/****************************************************************************
**
 **                              BOARD
  ** *   **             THE APPOTECH MULTIMEDIA PROCESSOR
   **** **                  BOARD BWV1
  *** ***
 **  * **               (C) COPYRIGHT 2016 BUILDWIN 
**      **                         
         **         BuildWin SZ LTD.CO  ; VIDEO PROJECT TEAM
          **   
* File Name   : board_bwv1.c
* Author      : Mark.Douglas 
* Version     : V100
* Date        : 09/22/2016
* Description : This file is for user board
*               
* History     : 
* 2016-09-22  : 
*      <1>.This is created by mark,set version as v100.
*      <2>.Add basic functions & information
******************************************************************************/
#include "application.h"


#define  ADC_BAT_CH      ADC_CH_MVOUT
#define  ADC_BGP_CH      ADC_CH_BGOP
#define  ADC_KEY_CH      ADC_CH_PB1
#define  ADC_GSR_CH      ADC_CH_PA6

static u8 adCh;

static int board_cmos_init(void)
{
	sensorInit();
	hal_mjpegEncodeInit();
	ax32xx_csi_only_FrameSet();
	hal_csiEnable(1);
	return 0;
}
static int board_cmos_ioctrl(INT32U prit,INT32U op,INT32U para)
{
	if(op == IOCTRL_CMOS_INIT)
	{
		SENSOR_PWDN_ON();
		hal_dacHPSet(1,HP_VDD_2_8V);	// reset cmos sensor
		hal_sysDelayMS(50);
		hal_dacHPSet(0,0);
		hal_sysDelayMS(100);
		hal_dacHPSet(1,HP_VDD_2_8V);
		hal_sysDelayMS(100);
		
		return board_cmos_init();
	}
	return -1;
}

static int board_sdc_init(void)
{
    hal_sysLDOSet(SYS_LDO_SDC,0,0);  // disable SD_VDD
    return 0;
}


static int board_sdc_ioctrl(INT32U prit,INT32U op,INT32U para)
{
	if(op == IOCTRL_SDC_CHECK)
	{
		if(hal_sdCheck())
			*(INT32U *)para = 1;
		else
			*(INT32U *)para = 0;
		return 0;
	}
	return -1;
}
static int board_usb_init(void)
{
	hal_gpioInit(USB_DC_CH,USB_DC_PIN,GPIO_INPUT,GPIO_PULL_FLOATING);

//==PB6 handle clean USB setting==
	USB11CON0=0;
	USB11CON1=0;
	USB11CON0 |= (1<<6);//control by soft
	USB11CON1 &= ~(BIT(4)|BIT(6));	//disable dp,dm 120K pullup
	USB11CON1 &= ~(BIT(7)|BIT(5));	//disable dp,dm 15k pulldown
//==end PB6 handle clean USB setting==

	hal_gpioInit(DC_BAT_CHARGE_CH,DC_BAT_CHARGE_PIN,GPIO_INPUT,GPIO_PULL_UP);		// bat charge
    return 0;
}

static int board_usb_ioctrl(INT32U prit,INT32U op,INT32U para)
{
	if(op == IOCTRL_USB_CHECK)
	{ 
       *(INT32U *)para = hal_gpioRead(USB_DC_CH,USB_DC_PIN);
		return 0;
	}

	return -1;
}


//------------battery --------
#define  BATTERY_MAX     7
#define  BATTERY_AVG     16
#define  BATTERY_INV     30  //6
#define  BATTERY_OFS     (20) //电池到IC引脚之间的压差,unit:mV
const static u16 batteryValueTable[BATTERY_MAX] = {3330,3400,3530,3700,3800,3900,4100};

static int board_battery_init(void)
{
	u16 batValue=0,bgpValue=0;
	int value;

	hal_batDetectEnable(1);

    int i = 3;
    while(i--)
    {
        batValue += hal_adcGetChannel(ADC_BAT_CH);
        bgpValue += hal_adcGetChannel(ADC_BGP_CH);
    }

	if(bgpValue==0)
		value = 0;
	else
		value = hal_adcVDDRTCCalculate(batValue,bgpValue) + BATTERY_OFS;

	if(value<batteryValueTable[0])
	{
		board_usb_ioctrl(0,IOCTRL_USB_CHECK,(INT32U)&value);
		if(value==0)
		{
			deg_Printf("board : battary low power.try to power off.\n");
			hal_vddWKOEnable(0);
			XOSTimeDly(200);
		    return -1;
		}
	}
	
	return 0;
}

static int board_battery_ioctrl(INT32U prit,INT32U op,INT32U para)
{
	static u8 step = 0,oldBat=0xff;
	static u16 batValue=0,bgpValue=0;
	int i,value;
	if(op == IOCTRL_BAT_CHECK)
	{

		batValue += hal_adcGetChannel(ADC_BAT_CH);
		bgpValue += hal_adcGetChannel(ADC_BGP_CH);
		step++;

		if(step>=BATTERY_AVG)
		{
			if(bgpValue==0)
				value = 0;
            else
            {
            	batValue=batValue/BATTERY_AVG;
				bgpValue=bgpValue/BATTERY_AVG;
                value = hal_adcVDDRTCCalculate(batValue,bgpValue) + BATTERY_OFS;
            }

			for(i=0;i<BATTERY_MAX;i++)
			{
				if(value<=batteryValueTable[i])
					break;
			}
			if(oldBat!=i)
			{
				if(oldBat==0xff)
					oldBat = i;
				else
				{
					if(oldBat>i)
					{
						if(value<batteryValueTable[i]-BATTERY_INV)
							oldBat=i;
					}
					else
					{
						if(value>batteryValueTable[oldBat]+BATTERY_INV)
							oldBat=i;
					}
				}
			}
			//deg_Printf("battery : ad value = %d,i = %d,oldBat=%d\n",value,i,oldBat);
			step = 0;
			bgpValue=0;
			batValue=0;
			*(INT32U *)para = oldBat;
			return 0;
		}
	}

	return -1;
}


static int board_key_init(void)
{
	hal_gpioInit(PWR_KEY_CH,PWR_KEY_PIN,GPIO_INPUT,GPIO_PULL_FLOATING);		// power key
	hal_gpioInit(DV_KEY_CH,DV_KEY_PIN,GPIO_INPUT,GPIO_PULL_UP);	  // dv
}
static int board_key_process(INT32U keyValue)
{
	static int oldKey=0,oldTime=0;
	INT8U key;

    key = 0;
	if(keyValue == 0)
	{
		if(oldKey)
		{
			key = oldKey;
			if(oldTime>=(KEY_LONG_TIME-KEY_LONG_TICK))
				key|=T_KEY_LONG_UP;
			else if(oldTime>1)
				key|=T_KEY_SHORT_UP;
			else 
				key|=T_KEY_SHORT;
			oldKey = 0;
			oldTime = 0;
		}
	}
	else
	{
		if(oldKey == keyValue)
		{
			oldTime++;
			if(oldTime>=KEY_LONG_TIME)
			{
				oldTime-=KEY_LONG_TICK;
				key = oldKey|T_KEY_LONG;
			}
			else if(oldTime==1)
			{
				key = oldKey|T_KEY_DOWN;
			}
		}
		else
		{
			oldKey = keyValue;
			oldTime = 0;
		}
	}

	return key;
}

static int board_key_ioctrl(INT32U prit,INT32U op,INT32U para)
{
	int value,i;
	
	if(op == IOCTRL_KEY_READ)
	{

	   if(!hal_gpioRead(DV_KEY_CH,DV_KEY_PIN))
		{
			value = KEY_VALUE_DV;   // dv key ,key value
		}
		else
		{
			value = 0;
		}

		if(0 != value)
		{
			//deg_Printf("key value=0x%x\n",value);
		}

		i = board_key_process(value);	
			if(0 != i)
		{
			//deg_Printf("key para=0x%x\n",i);
		}
		*(int *)para = i; 
		if(!i)
	   	   return -1;				   	   
	}
    else if(op == IOCTRL_KEY_POWER)
    {
		value = hal_gpioRead(PWR_KEY_CH,PWR_KEY_PIN);
		*(int *)para = value; 
    }
	else if(op == IOCTRL_KEY_POWEROFF)
	{
		hal_gpioInit(PWR_KEY_CH,PWR_KEY_PIN,GPIO_OUTPUT,GPIO_PULL_DOWN);
		hal_gpioWrite(PWR_KEY_CH,PWR_KEY_PIN,GPIO_LOW);
	}
	return 0;
}

static int board_ir_init(void)
{
#if (1 == IR_MENU_EN)
	ax32xx_gpioDigitalSet(IR_LED_CH,IR_LED_PIN,GPIO_DIGITAL_EN);		// set ir io is digital .
#endif
	return 0;
}

static int board_ir_ioctrl(INT32U prit,INT32U op,INT32U para)
{
#if (1 == IR_MENU_EN)

	static uint32 irState=0;
	if(op == IOCTRL_IR_SET)
	{
	   if(para)	// on
	   {
		   hal_gpioInit(IR_LED_CH,IR_LED_PIN,GPIO_OUTPUT,GPIO_PULL_UP);
		   hal_gpioWrite(IR_LED_CH,IR_LED_PIN,GPIO_HIGH);
		   irState=1;
	   }
	   else		//off
	   {
		   hal_gpioInit(IR_LED_CH,IR_LED_PIN,GPIO_OUTPUT,GPIO_PULL_DOWN);
		   hal_gpioWrite(IR_LED_CH,IR_LED_PIN,GPIO_LOW);
		   irState=0;
	   }
	}
	else if(op == IOCTRL_IR_GET)
	{
		*(INT32U*)para=irState;
	}
#endif
	return 0;
}


const Board_Node_T  board_bwv1[]=
{
	{//------bat-----------
		.name = DEV_NAME_BATTERY,
		.init = board_battery_init,
		.ioctrl = board_battery_ioctrl, 
		.prit = 0
	},
	
	{//------sdc-----------
		.name = DEV_NAME_SDCARD,
		.init = board_sdc_init,
		.ioctrl = board_sdc_ioctrl, 
		.prit = 0
	},

    {//------usb-----------
		.name = DEV_NAME_USB,
		.init = board_usb_init,
		.ioctrl = board_usb_ioctrl, 
		.prit = 0
	},

	{//------cmos -sensor
		.name = "cmos-sensor",
		.init = NULL,//booard_cmos_init,
		.ioctrl = board_cmos_ioctrl,
		.prit=0
	},
	{//------key-----------
		.name = DEV_NAME_KEY,
		.init = board_key_init,
		.ioctrl = board_key_ioctrl, 
		.prit = 0
	},
#if (1 == IR_MENU_EN)
	{//------ir led-----------
		.name = DEV_NAME_IR,
		.init = board_ir_init,
		.ioctrl = board_ir_ioctrl, 
		.prit = 0
	},
#endif
    {
		.name[0] = 0,
		.init = NULL,
		.ioctrl = NULL,
    }
};




