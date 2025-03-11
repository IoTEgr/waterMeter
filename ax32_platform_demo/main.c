/****************************************************************************
**
 **                              MAIN 
  ** *   **             THE APPOTECH MULTIMEDIA PROCESSOR
   **** **                  MAIN ENTER  OF SYSTEM
  *** ***
 **  * **               (C) COPYRIGHT 2016 BUILDWIN 
**      **                         
         **         BuildWin SZ LTD.CO  ; VIDEO PROJECT TEAM
          **   
* File Name   : main.c
* Author      : Mark.Douglas 
* Version     : V100
* Date        : 09/22/2016
* Description : 
*               
* History     : 
* 2016-09-22  : 
*      <1>.This is created by mark,set version as v100.
*      <2>.Add basic functions & information
******************************************************************************/
#include "application.h" 

static MSG_T sysDeviceQStack[SYSDEVICE_Q_SIZE];

System_Ctrl_T SysCtrl;
/*******************************************************************************
* Function Name  : uninit
* Description    : system uninitial,for power off
* Input          : *
* Output         : None
* Return         : None
*******************************************************************************/
int uninit(void)
{
#if (BOARD_TYPE_MINIDV == SYSTEM_BOARD)

	int temp;
	int key_cnt = 0;
    deg_Printf("system power off\n");
	task_set_state( MAIN_STAT_POWER_OFF); // set current  state
	LED_RED_OFF();

    if(SysCtrl.battery != 0)
    {
		u32 timeout = 0xffffff;
		do{boardIoctrl(SysCtrl.bfd_key,IOCTRL_KEY_POWER,(INT32U )&temp);hal_wdtClear();}		// until  power key up
		while(temp && (timeout--));
    }
	
	//====save power=====
		ax32xx_sysLDOSet(SYS_LDO_LSEN,SYS_VOL_V1_8,0);	
		ax32xx_sysLDOSet(SYS_LDO_HSEN,SYS_VOL_V3_1,0);	

		hal_intEnable(IRQ_CSI,0);
		hal_intEnable(IRQ_AUADC,0); 
		hal_intEnable(IRQ_JPGA,0);	
		hal_intEnable(IRQ_JPGB,0);
		hal_intEnable(IRQ_LCDC,0);	
		hal_intEnable(IRQ_DE,0);	
		hal_intEnable(IRQ_DAC,0);	
		hal_intEnable(IRQ_GPIO,0);	
		hal_intEnable(IRQ_USB20,0);	

		ax32xx_sysClkSet(SYS_CLK_DE,0);
		ax32xx_sysClkSet(SYS_CLK_AUADC,0);
		ax32xx_sysClkSet(SYS_CLK_LCDC,0);
		ax32xx_sysClkSet(SYS_CLK_JPGA,0);
		ax32xx_sysClkSet(SYS_CLK_JPGB,0);
		ax32xx_sysClkSet(SYS_CLK_DVP_CSI,0);
		ax32xx_sysClkSet(SYS_CLK_USB20,0);
		ax32xx_sysClkSet(SYS_CLK_ADC,0);
		ax32xx_sysClkSet(SYS_CLK_DAC,0);

	//====end save power===
		SENSOR_PWDN_OFF();
		deg_Printf("into while\n");
		while(1)
		{
			hal_wdtClear();
			boardIoctrl(SysCtrl.bfd_usb,IOCTRL_USB_CHECK,(INT32U)&temp);
			if(0 != temp)	// dc on
			{
				boardIoctrl(SysCtrl.bfd_key,IOCTRL_KEY_POWER,(INT32U )&temp);
				if(temp)	// key push
				{
					key_cnt ++;
					if(key_cnt >= 100)	// 1s ,reset
					{
						hal_wdtReset();
					}
				}
				else
				{
					key_cnt;
				}
				XOSTimeDly(10);
			}
			else
			{
				POWER_OFF();
				//deg_Printf("POWER_OFF\n");
				XOSTimeDly(300);
				//deg_Printf("POWER_OFF END\n");
			}
		}
#else
		hal_wdtReset();
#endif

}

/*******************************************************************************
* Function Name  : init
* Description    : initial system hardware & task
* Input          : *
* Output         : None
* Return         : None
*******************************************************************************/
int init(void)
{
	deg_Printf("****************CLKTUN:%x, OUT %x, IN %x***************\n",CLKTUN,(CLKTUN>>7)&0x1f,CLKTUN&0x1f);
	deg_Printf("****************DLLCON:%x, CH1 %x, CH2 %x***************\n",DLLCON,(DLLCON>>25)&0xf,(DLLCON>>21)&0xf);
	deg_Printf("CHIP_ID:0x%x\n",CHIP_ID);
	deg_Printf("RC:0x%x\n",((*(u32 *)0x4fa8)& 0xfffc00)>>10);

	//hal_vddWKOEnable(1);  // hold power
	POWER_ON();// hold power
    hal_wkiWakeup(1);
    
	hal_sysInit();	//initial system for free run
	
	hal_uartInit();
	
//----------initial system work queue.work queues are isr callback function	
	XOSInit();	
//----------start system work queue for system check & deamon service	
	hal_timerStart(HAL_CFG_OS_TIMER,X_CFG_TICK,XOSTickService);  // 1000 hz 
	XWorkCreate(15*X_TICK,isp_process_check);  // isp process
	deg_Printf("system power on\n");
	debg("DLLCON0:%x\n",DLLCON);
	debg("************[DACACON0:%x]*********\n",DACACON0);
//----------board initial,LCD,LED,SPI,ADC,DAC....	
	boardInit(NULL);   // initial main board	
//----------get board device ioctrl handler	
    memset(&SysCtrl,0,sizeof(System_Ctrl_T));
	SysCtrl.bfd_battery = boardOpen(DEV_NAME_BATTERY);
    SysCtrl.bfd_gsensor = boardOpen(DEV_NAME_GSENSOR);	
	SysCtrl.bfd_usb 	= boardOpen(DEV_NAME_USB);
	SysCtrl.bfd_key 	= boardOpen(DEV_NAME_KEY);   
    SysCtrl.bfd_sdcard  = boardOpen(DEV_NAME_SDCARD);		
	SysCtrl.bfd_led     = boardOpen(DEV_NAME_LED);
	SysCtrl.bfd_lcd     = boardOpen(DEV_NAME_LCD);
	SysCtrl.bfd_ir 		= boardOpen(DEV_NAME_IR);
	SysCtrl.bfd_usensor= boardOpen(DEV_NAME_USENSOR);
	SysCtrl.powerflag = POWERON_FLAG_MAX;
	if(SysCtrl.bfd_battery<0)
	{
		//uninit();
	}
//-----------welcome
	deg_Printf("\n");
    deg_Printf(">>---------------------------------------------<<\n");
	deg_Printf(">>- Welcome.BuildWin SZ LTD.CO-----------------<<\n");
    deg_Printf(">>- VIDEO PROJECT TEAM.VISION------------------<<\n");
	deg_Printf(">>- %s --------------------<<\n",SYSTEM_VERSION);
    deg_Printf(">>---------------------------------------------<<\n");
//----------nv fs for read only resource
	nv_init();	 
//----------user menu configure set
	userConfigInitial();
#if (BOARD_TYPE_MINIDV == SYSTEM_BOARD)
//----------power on flag check
	int ret,temp;
	boardIoctrl(SysCtrl.bfd_key,IOCTRL_KEY_POWER,(INT32U )&temp);
	if(temp)
		SysCtrl.powerflag = POWERON_FLAG_KEY; 
	else
	{
	    boardIoctrl(SysCtrl.bfd_usb,IOCTRL_USB_CHECK,(INT32U)&temp);
		if(temp)
		   SysCtrl.powerflag = POWERON_FLAG_DCIN;     // dcin or usb in power on
		else
		   SysCtrl.powerflag = POWERON_FLAG_KEY;     // dcin or usb in power on  
		deg_Printf("SysCtrl.powerflag=0x%x\n",SysCtrl.powerflag);
	}

	/*if(SysCtrl.powerflag==POWERON_FLAG_KEY) 	// power key is not hold
	{
		temp = 0;
		boardIoctrl(SysCtrl.bfd_key,IOCTRL_KEY_POWER,(INT32U )&temp);
		if(temp==0)
		{
			deg_Printf("power key not hold.\n");
			//uninit();		// power off
		}
	}*/

#endif

#if CMOS_USART_ONLINE_DBG>0
    XWorkCreate(10*X_TICK,sensorDBGTimeout);
#endif

//	hal_dacInit();

//	layout_logo_show(1,0,1);  // power on.music en,do not wait music end	//---->show logo here,can speed start logo show.make user feeling system starting faster
//	XOSTimeDly(50);  // delay 80ms,wait lcd frame end	
//	boardIoctrl(SysCtrl.bfd_lcd,IOCTRL_LCD_BKLIGHT,1); // back light on

//--------initial resource manager for fs
	managerInit();

//---------update time RTC time
//    boardIoctrl(SysCtrl.bfd_lcd,IOCTRL_LCD_BKLIGHT,1); // back light on
//	deg_Printf("main : backlight on.%d ms\n",XOSTimeGet()-tick);
//	int fd = boardOpen(DEV_NAME_BATTERY);
	boardNameIoctrl("cmos-sensor",IOCTRL_CMOS_INIT,0);

//    deg_Printf("main : csi end.%d ms\n",XOSTimeGet()-tick);
	SysCtrl.t_wait = XOSTimeGet();
    SysCtrl.pip_mode = 0;
	SysCtrl.f_update = 0;
    SysCtrl.avi_list = -1;
	SysCtrl.jpg_list = -1;
	SysCtrl.wav_list = -1;
	SysCtrl.t_autooff = AUTO_POWER_OFF_TIME*1000;
	SysCtrl.sysQ = XMsgQCreate(sysDeviceQStack,SYSDEVICE_Q_SIZE);
	SysCtrl.sdcard = SDC_STAT_NULL;//SDC_STAT_UNSTABLE;
	SysCtrl.battery = BATTERY_STAT_4;  // DEFAULT VALUE
//--------initial fs	
	fs_init();
//--------board check ,the first time.	
	if(1280==sensor_get_w())
	{
		hal_mdInit(0);
		deg_Printf("md init 720P\n");
	}
	else
	{
		hal_mdInit(0);
		deg_Printf("md init vga\n");
	}

	LED_RED_OFF();	// standy led state
	
	 //boardIoctrl(SysCtrl.bfd_ir,IOCTRL_IR_SET,0);

	ret = XOSTimeGet();

	while(XOSTimeGet()-ret <= 500) // for check usb , Usensor
	{
		XOSTimeDly(10);
		task_deamon(0); // check unkey
	}

	#if (1 == TIMER_ISR_HANDLE_LED_KEY)
	extern void deamon_led_check(void);
	extern void deamon_key_check(void);
	XWorkCreate(10*X_TICK,deamon_led_check);  // time isr handle LED, WARNING ! cann't add XOSTimeDly() in deamon_led_check()
	XWorkCreate(10*X_TICK,deamon_key_check);  // time isr handle KEY, WARNING ! cann't add XOSTimeDly() in deamon_key_check()
	#endif

	return 0;
}

/*******************************************************************************
* Function Name  : main
* Description    : 
* Input          : *
* Output         : None
* Return         : None
*******************************************************************************/
int main(void)
{	
	
//--------------power on--------	 
    init();       // system power on configure
	debg("*********************\n");
	debg("\nCLKTUN:%x, %x\n",(CLKTUN>>7)&0x1F, (CLKTUN&0X1F));
	u8 sbuf[]={'T','U','N',':','0','0','-','0','0',' ','\n', '\0'};
	sbuf[4] = ((CLKTUN>>11)&0X1) + '0';
	if(((CLKTUN>>7)&0xf)<10)
		sbuf[5] = ((CLKTUN>>7)&0xf)+'0';
	else
		sbuf[5] = (((CLKTUN>>7)&0xf)-10)+'a';
	sbuf[7] = ((CLKTUN>>4)&0x1) + '0';
	if(((CLKTUN)&0xf)<10)
		sbuf[8] = ((CLKTUN)&0xf)+'0';
	else
		sbuf[8] = (((CLKTUN)&0xf)-10)+'a';
		
	LogPrint((char *)sbuf,0);
    
//    task_set_state( MAIN_STAT_POWER_ON); // set current  state
    
//    layout_main_init();                                                   // system ui 
//	menuSettingReset();                                                   // menu configure load


//----fireware upgrade
    if(upgrade()!=-1)
    {
		// upgrade sucessful or fail, system should reset	
	#if 1	// key power off
	    INT16U value,event;
		LED_RED_ON();
		while(1)
		{
			if(systemEventService(&value,&event)>0) 
			{
				if((event == EVENT_KEY)&&(value == (KEY_VALUE_POWER|KEY_EVENT_LONG))) 
					goto MAIN_POWER_OFF;
				if((event == EVENT_SYS)&&(value == SYS_EVENT_SDC)) // sdc out,try to reset
				{
					if(SysCtrl.sdcard!=SDC_STAT_NORMAL)
					{
						//hal_rtcAlarmSet(hal_rtcSecondGet()+2,1);
						uninit();
					}
				}
			}
		}
    #else // delay & power off
		XOSTimeDly(2000); // delay 2-second
		goto MAIN_POWER_OFF;
	#endif
    }

//----------main task------------
    if(!(task_main((void *)0))){
		return 2;
	}
    
MAIN_POWER_OFF:
//----------power off-------------
    task_set_state( MAIN_STAT_POWER_OFF); // set current  state
	uninit();                                                           // system power off configure

	return 0;
}
/*******************************************************************************
* Function Name  : systemEventService
* Description    : system event service for event and key get
* Input          : INT16U *value : event value
*                  INT16U *event : event
* Output         : None
* Return         : int event value
*******************************************************************************/
int systemEventService(INT16U *value,INT16U *event)
{
	static INT16U oldKey = T_KEY_SHORT_UP;
	INT16U key,id;

	int ret;
	hal_wdtClear();
	task_deamon(1);	
    
	ret = deamon_event_handler(&key,&id);
    if(ret<0)
	   goto SYS_ICON_SHOW;		
	if(event)
		*event = id;
	if(id == EVENT_KEY)   //----key message
	{
		if((key & T_KEY_SHORT_UP)) // key up
		{
			if((oldKey & T_KEY_SHORT_UP)) // last key is up.key event error
				goto SYS_ICON_SHOW;
		}
		deamon_auto_poweroff(EVENT_KEY);
        if(deamon_screen_save(EVENT_KEY))
			goto SYS_ICON_SHOW;
		
		
		oldKey = key;
		
		if(value)
		   *value = oldKey;
		goto SYS_EVENT_END;
	}
	else
	{
		if(value)
			*value = key;
	}	
SYS_EVENT_END:

    return id;

SYS_ICON_SHOW:

	return -1;
}




