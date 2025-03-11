/****************************************************************************
**
 **                              TASK DEMO
  ** *   **             THE APPOTECH MULTIMEDIA PROCESSOR
   **** **                      TASK DEAMON
  *** ***
 **  * **               (C) COPYRIGHT 2016 BUILDWIN 
**      **                         
         **         BuildWin SZ LTD.CO  ; VIDEO PROJECT TEAM
          **   
* File Name   : task_deamon.c
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

#define SDC_WAIT_TIME   50 // 500ms       
static int keyTime=0;

void deamon_sdc_check(void);
void deamon_usb_check(void);
void deamon_gsensor_check(void);
void deamon_led_check(void);
void deamon_key_check(void);
void deamon_astern_check(void);
u8 task_image_get_take_flag();


static void deamon_ir_auto_check(void)
{
#if (1 == IR_MENU_EN)
	if(0 == SysCtrl.t_ir_auto) return;
	//deg_Printf("sensor light:0x%x\n",get_scen_light());

	if(isp_get_scen_light() <= 0xf)		// need ir
	{
		if(0 == SysCtrl.t_ir_flag)
		{
			hal_gpioInit(IR_LED_CH,IR_LED_PIN,GPIO_OUTPUT,GPIO_PULL_UP);
			hal_gpioWrite(IR_LED_CH,IR_LED_PIN,GPIO_HIGH);
			SysCtrl.t_ir_flag = 1;
			//deg_Printf("ir auto open\n");
		}
	}
	else
	{
		if(1 == SysCtrl.t_ir_flag)
		{
			hal_gpioInit(IR_LED_CH,IR_LED_PIN,GPIO_OUTPUT,GPIO_PULL_DOWN);
			hal_gpioWrite(IR_LED_CH,IR_LED_PIN,GPIO_LOW);
			SysCtrl.t_ir_flag = 0;
			//deg_Printf("ir auto close\n");
		}
	}
#endif
}


/*******************************************************************************
* Function Name  : updata_rtc_from_txt()
* Description	 :  updata rtc time with time.txt file
* Input 		 : 
* Output		 :
* Return		 : 
*******************************************************************************/
static void updata_rtc_from_txt()
{
#if (BOARD_TYPE_MINIDV == SYSTEM_BOARD)
	
#if  (1 == UPDATA_RTC_TIME_EN)

	u32 ret;
	FIL rtc_file;
	DATE_TIME_T rtc_time;
	u8 rtc_timebuf[]="2024-01-01 00:00:00";
	ret =  f_open(&rtc_file,(char const *)UPDATA_RTC_TIME_FILE, FA_WRITE|FA_READ);
	if(ret == FR_OK)		//file on
	{
		u32 read;
		deg_Printf("fopen rtc file	ok\n");
		f_read(&rtc_file,&rtc_timebuf, sizeof(rtc_timebuf),&read);
		f_close(&rtc_file);
		deg_Printf("fread rtc file size=%d,string=%s\n",read,rtc_timebuf);
	}	
	else			//not find file ,creat new one
	{
		u32 writed;
		ret =  f_open(&rtc_file,(char const *)UPDATA_RTC_TIME_FILE, FA_CREATE_NEW| FA_WRITE | FA_READ);
		deg_Printf("create rtc file ret = %d\n",ret);
		if(FR_OK != ret)
		{
			return FALSE;
		}
		f_write(&rtc_file,&rtc_timebuf, strlen(rtc_timebuf),&writed);
		f_close(&rtc_file);
		deg_Printf("fwrite rtc file size %d\n",writed);
	}

	//======check if need updata rtc time=====
	if(!((rtc_timebuf[0]=='2')&&(rtc_timebuf[1]=='0')&&(rtc_timebuf[2]=='1')&&(rtc_timebuf[3]=='7')&&(rtc_timebuf[5]=='0')&&(rtc_timebuf[6]=='6')\
		&&(rtc_timebuf[8]=='1')&&(rtc_timebuf[9]=='2')&&(rtc_timebuf[11]=='2')&&(rtc_timebuf[12]=='3')&&(rtc_timebuf[14]=='5')&&(rtc_timebuf[15]=='9')\
		&&(rtc_timebuf[17]=='5')&&(rtc_timebuf[18]=='9')))
	{
		rtc_time.year = 1000*(rtc_timebuf[0]-'0')+100*(rtc_timebuf[1]-'0')+10*(rtc_timebuf[2]-'0')+(rtc_timebuf[3]-'0');
		rtc_time.month = 10*(rtc_timebuf[5]-'0')+(rtc_timebuf[6]-'0');
		rtc_time.day =10*(rtc_timebuf[8]-'0')+(rtc_timebuf[9]-'0');
		rtc_time.hour=10*(rtc_timebuf[11]-'0')+(rtc_timebuf[12]-'0');
		rtc_time.min =10*(rtc_timebuf[14]-'0')+(rtc_timebuf[15]-'0');
		rtc_time.sec =10*(rtc_timebuf[17]-'0')+(rtc_timebuf[18]-'0');

		hal_rtcTimeSet(&rtc_time);	//write rtc time
		deg_Printf("updata rtc time %s\n",rtc_timebuf);

		//=====set default value===
		u32 writed;
		u8 rtc_timebuf[]="2024-01-01 00:00:00";
		ret =  f_open(&rtc_file,(char const *)UPDATA_RTC_TIME_FILE, FA_WRITE | FA_READ);
		f_write(&rtc_file,&rtc_timebuf, strlen(rtc_timebuf),&writed);
		f_close(&rtc_file);
		//=====end set default value===

		return TRUE;
	}

#else
	DATE_TIME_T *rtcTime = hal_rtcTimeGet();	
	if((rtcTime->year<2017)) // user configure reset  
	{
		rtcTime->year = 2017;
		rtcTime->month =1;
		rtcTime->day = 1;
		rtcTime->hour = 0;
		rtcTime->min = 0;
		rtcTime->sec = 0;
		hal_rtcTimeSet(rtcTime); // default time ->2017/01/01 00:00:00
	}
#endif
#endif
}


/*******************************************************************************
* Function Name  : task_deamon
* Description    : system service in deamon
* Input          : key 0: unhandle key, 1: handle key
* Output         : None
* Return         : None
*******************************************************************************/
void task_deamon(u8 key)
{
	static U32 oldtime = 0/*,ispcnt=0*/;
	u32 curtime;

	curtime = XOSTimeGet();

	hal_ispService();
	#if CFG_MCU_TFDBG_EN
		hal_check_tfdebg();
	#endif
	if(curtime>=oldtime)
	{
		if((curtime-oldtime)<20*X_TICK)
			return ;
	}
	else
	{
		oldtime = curtime;
		return;
	}

	oldtime = curtime;
    if(task_get_curstate() != MAIN_STAT_POWER_OFF)
    {
	    //boardIoctrl(SysCtrl.bfd_led,IOCTRL_LED_CHECK,1);  // SYSTEM CHECK LED STATE
//-------sdc card check-----------------    
	    deamon_sdc_check();  // sdc state check
//--------gsensor check-----------------
	    //deamon_gsensor_check(); // gsensor state check
//--------sereen save check ------------	
	    //deamon_screen_save(0);  // system check,no event
//--------auto power off check----------
	    deamon_auto_poweroff(0); //auto power off check 
//--------astern mode check-----------
        //deamon_astern_check(); // astern stat check
		//deamon_ir_auto_check();
    }
//--------usb check---------------------
	deamon_usb_check();  // usb state check

	#if (0 == TIMER_ISR_HANDLE_LED_KEY)
//--------led check---------------------
	deamon_led_check();  // led check
//--------key check -------------------
	//modify: add parameters to determine whether to perform key check  lwq 2018.3.23  
	if(key)
	deamon_key_check();      // system key read
	#endif

//--------motion dection check----------
	if(hal_mdCheck())
	{
		XMsgQPost(SysCtrl.sysQ,(void *)(EVENT_SYS|SYS_EVENT_MD));
	}
#if CMOS_USART_ONLINE_DBG >0
    sesnorDBGService();
#endif

//    LogShowCheck();
//	logFlush();
}
/*******************************************************************************
* Function Name  : deamon_key_check
* Description    : key check value
* Input          : *
* Output         : None
* Return         : None
*******************************************************************************/
void deamon_key_check(void)
{
	if(SysCtrl.bfd_key<0)
		return ;
	
	int keyValue;
	if(boardIoctrl(SysCtrl.bfd_key,IOCTRL_KEY_READ,(INT32U )&keyValue)>=0)
	{
		if(keyValue)
		{
			hal_md_reset_checktime();
		#if (BOARD_TYPE_MINIDV == SYSTEM_BOARD)
				if((USB_STAT_DCIN != SysCtrl.usb) && (USB_STAT_PC != SysCtrl.usb))	// no dc 
				{
					if(0 == SysCtrl.battery)	// low power, key unuse
					{
					}
					else
					{
						XMsgQPost(SysCtrl.sysQ,(void *)(EVENT_KEY|(keyValue<<8)));
					}
				}
				else
				{
					XMsgQPost(SysCtrl.sysQ,(void *)(EVENT_KEY|(keyValue<<8)));
				}
		#else
				if(USB_STAT_PC != SysCtrl.usb)
				{
					if(0 == SysCtrl.battery)	// low power, key unuse
					{
					}
					else
					{
						XMsgQPost(SysCtrl.sysQ,(void *)(EVENT_KEY|(keyValue<<8)));
					}
				}
		#endif

			//deg_Printf("post key : %d\n",adcValue);
		}
	}

}
void deamon_fs_scan(void)
{
	deg_Printf("deamon : fs scan start.%d\n",XOSTimeGet());
	updata_rtc_from_txt();
	
	char string[16];
#if(RECORD_AUDIO_TASK)
	strcpy(string,FILEDIR_AUDIO);
	string[strlen(string)-1] = 0;
	f_mkdir((const TCHAR*)string);//FILEDIR_AUDIO);
#endif

	strcpy(string,FILEDIR_VIDEOA);
	string[strlen(string)-1] = 0;
	f_mkdir((const TCHAR*) string);//FILEDIR_VIDEO);
	
#if RECORD_MODE == RECORD_MODE_DEFAULT	
	strcpy(string,FILEDIR_VIDEOB);
	string[strlen(string)-1] = 0;
	f_mkdir((const TCHAR*)string);//FILEDIR_VIDEO);
	SysCtrl.bfolder = 1;
#elif RECORD_MODE == RECORD_MODE_AUTO	
    if(SysCtrl.usensor!=USENSOR_STAT_NULL)
    {
		strcpy(string,FILEDIR_VIDEOB);
		string[strlen(string)-1] = 0;
		f_mkdir((const TCHAR*)string);//FILEDIR_VIDEO);
		SysCtrl.bfolder = 1;
    }
	else
		SysCtrl.bfolder = 0;
#else
    // no B floder
    SysCtrl.bfolder = 0;
#endif

	strcpy(string,FILEDIR_PHOTO);
	string[strlen(string)-1] = 0;
	f_mkdir((const TCHAR*)string);					

	if(SysCtrl.avi_list<0) // scan file list
	{
		SysCtrl.avi_list = managerCreate(FILEDIR_VIDEO,MA_FILE_AVI,-1);
		SysCtrl.jpg_list = managerCreate(FILEDIR_VIDEO,MA_FILE_JPG,SysCtrl.avi_list); // using the same list with avi_list
		SysCtrl.avia_list = managerCreate(FILEDIR_VIDEO,MA_FILE_AVIA,SysCtrl.avi_list); // using the same list with avi_list
		SysCtrl.avib_list = managerCreate(FILEDIR_VIDEO,MA_FILE_AVIB,SysCtrl.avi_list); // using the same list with avi_list
		managerScanStart(SysCtrl.avi_list);
		managerFileScan(SysCtrl.avi_list,FILEDIR_VIDEOA);
		deg_Printf("SysCtrl.avi_list %d\n",SysCtrl.avi_list);
		deg_Printf("SysCtrl.jpg_list %d\n",SysCtrl.jpg_list);
		deg_Printf("SysCtrl.avia_list %d\n",SysCtrl.avia_list);
		deg_Printf("SysCtrl.avib_list %d\n",SysCtrl.avib_list);
		managerFileScan(SysCtrl.avi_list,FILEDIR_VIDEOB);
		if(strcmp(FILEDIR_PHOTO,FILEDIR_VIDEO)!=0)
			managerFileScan(SysCtrl.jpg_list,FILEDIR_PHOTO);
		managerScanEnd(SysCtrl.avi_list);
	}
	#if (RECORD_AUDIO_TASK)
	if(SysCtrl.wav_list<0)
    {
		SysCtrl.wav_list = managerCreate(FILEDIR_AUDIO,MA_FILE_WAV,-1);
		deg_Printf("SysCtrl.wav_list %d\n",SysCtrl.wav_list);
		managerScanStart(SysCtrl.wav_list);
		managerFileScan(SysCtrl.wav_list ,FILEDIR_AUDIO);
		managerScanEnd(SysCtrl.wav_list);
    }
	#endif

	XMsgQPost(SysCtrl.sysQ,(void *)(SYS_EVENT_SDC|EVENT_SYS));
	deg_Printf("deamon : sdc normal\n",XOSTimeGet());

}
/*******************************************************************************
* Function Name  : deamon_sdc_check
* Description    : sd card stat check
* Input          : *
* Output         : None
* Return         : None
*******************************************************************************/
void deamon_sdc_check(void)
{
	int temp,res;
	
    if(SysCtrl.bfd_sdcard<0)
		return ;

	boardIoctrl(SysCtrl.bfd_sdcard,IOCTRL_SDC_CHECK,(INT32U)&temp);
	if(SysCtrl.sdcard <= SDC_STAT_UNSTABLE)
	{
		if(hal_sdInit(SD_BUS_WIDTH1)>=0)
		{
			if(SysCtrl.sdcard == SDC_STAT_NULL)
			{
			    SysCtrl.sdcard = SDC_STAT_UNSTABLE;
				deg_Printf("deamon : sdc pulled in.\n");
			}
			else if(SysCtrl.sdcard == SDC_STAT_UNSTABLE)
			{
				deg_Printf("deamon : sdc stable.\n");
				res = fs_mount(0);
				if(res!=FR_OK)
				{
					hal_sdSetCardState(SDC_STATE_NULL);
					if(hal_sdInit(SD_BUS_WIDTH1)>=0) // sdc intial 1line
					{
						res = fs_mount(0);
					}
				}

				if(res<0)
				{
					SysCtrl.sdcard = SDC_STAT_ERROR; 
					SysCtrl.f_update |= FLAG_SDC;
					deg_Printf("deamon : sdc error.%d\n",res);
				}
				else
				{
					SysCtrl.sdcard = SDC_STAT_NORMAL; 
    				SysCtrl.f_update |= FLAG_SDC;
					deg_Printf("deamon : sdc mounted ok\n");
					SysCtrl.fs_clustsize = fs_getclustersize();
					deg_Printf("deamon : fs cluster size.%d B\n",SysCtrl.fs_clustsize);
					deamon_fsFreeSize();
					task_video_record_caltime();
					
					deamon_fs_scan();
				}
		    }
			temp = 1;
		}
	}
	if(temp==0) // no sdc dectcted
	{
		if(SysCtrl.sdcard == SDC_STAT_NULL)
		{

		}
		else if(SysCtrl.sdcard == SDC_STAT_UNSTABLE)
		{
			deg_Printf("deamon : sdc pulled out\n");
			SysCtrl.sdcard = SDC_STAT_NULL;
		}
		else// if(SysCtrl.sdcard!=SDC_STAT_NULL)
		{
			fs_nodeinit();  // initial fs node
			managerDestory(SysCtrl.avi_list);
			managerDestory(SysCtrl.jpg_list);
			managerDestory(SysCtrl.avia_list);
			managerDestory(SysCtrl.avib_list);
			#if (RECORD_AUDIO_TASK)
			managerDestory(SysCtrl.wav_list);
			#endif
			
			SysCtrl.avi_list = -1;
			SysCtrl.jpg_list = -1;
			SysCtrl.wav_list = -1;
		    SysCtrl.sdcard = SDC_STAT_NULL;  // sdc out
		    SysCtrl.f_update |= FLAG_SDC;
			imageEncodeSetStatus(MEDIA_STAT_STOP);
			
			deamon_fsFreeSize();
		    task_video_record_caltime();
			hal_sdReset();
		    deg_Printf("deamon : sdc unmounted.\n");
			XMsgQPost(SysCtrl.sysQ,(void *)(SYS_EVENT_SDC|EVENT_SYS));
		}
	}
}
/*******************************************************************************
* Function Name  : deamon_astern_check
* Description    : astern mode & backrec status 
* Input          : *
* Output         : None
* Return         : None
*******************************************************************************/
void deamon_astern_check(void)
{
	bool ret;

	api_backrec_linking();	

	ret = api_astern_status();
	if((SysCtrl.astern==ASTERN_OFF) && (ret == true))
	{
		deg_Printf("deamon : astern on\n");
		SysCtrl.astern = ASTERN_ON;
		XMsgQPost(SysCtrl.sysQ,(void *)(SYS_EVENT_ASTERN|EVENT_SYS));
	}
	else if((SysCtrl.astern==ASTERN_ON) && (ret == false))
	{
		deg_Printf("deamon : astern off\n");
		SysCtrl.astern = ASTERN_OFF;
		XMsgQPost(SysCtrl.sysQ,(void *)(SYS_EVENT_ASTERN|EVENT_SYS));
	}

	ret = api_backrec_status();
	if((SysCtrl.usensorshow==USENSOR_SHOW_OFF) && (ret == true))
	{
		deg_Printf("deamon : uensor show on\n");
		SysCtrl.usensorshow = USENSOR_SHOW_ON;
		XMsgQPost(SysCtrl.sysQ,(void *)(SYS_EVENT_USENSOR|EVENT_SYS));
	}
	else if((SysCtrl.usensorshow==USENSOR_SHOW_ON) && (ret == false))
	{
		deg_Printf("deamon : uensor show off\n");
		SysCtrl.usensorshow = USENSOR_SHOW_OFF;
		api_astern_set_status(false);
		XMsgQPost(SysCtrl.sysQ,(void *)(SYS_EVENT_USENSOR|EVENT_SYS));
	}
}
void reflush_usensor_check(void)
{
	boardIoctrl(SysCtrl.bfd_usensor,IOCTRL_USB_POWER,0);
	deg_Printf("{deamon : usensor out}\n");
	SysCtrl.usensor=USENSOR_STAT_NULL;	
	SysCtrl.usensorshow = USENSOR_SHOW_OFF;
	XMsgQPost(SysCtrl.sysQ,(void *)(SYS_EVENT_USENSOR|EVENT_SYS));
}
/*******************************************************************************
* Function Name  : deamon_usb_check
* Description    : usb & battery stat check
* Input          : *
* Output         : None
* Return         : None
*******************************************************************************/
extern int uninit(void);
static BOOL softwareDetachUsensor=FALSE;
void setSoftwareDetachUsensor(BOOL en)
{
	softwareDetachUsensor=en;
}
void deamon_usb_check(void)
{
	static INT32U usbdelay = 0;
	static INT8S checkTime = 10,checkStable=0,nopower=0,usbdev=0;	
	//static INT32U nopower=0;
	int temp,ret;
#if RECORD_MODE != RECORD_MODE_SIGNAL
//-------------------usensor detect----------------------
	ret = boardIoctrl(SysCtrl.bfd_usensor,IOCTRL_USB_CHECK,(INT32U)&temp);//mark modify 2017/12/15.usb check may have debouds,to avoud differ
	//to detect usb1.1 and usb 2.0,boadcheck may be different,here should be modified
	//ret = 0; temp =1;
	if(ret>=0)
	{
		if(((temp ==0)&&(SysCtrl.usensor!=USENSOR_STAT_NULL))||softwareDetachUsensor)
		{
            boardIoctrl(SysCtrl.bfd_usensor,IOCTRL_USB_POWER,0);
			deg_Printf("deamon : usensor out\n");
			SysCtrl.usensor=USENSOR_STAT_NULL;
			backrec_sensor(0);
			usbdelay = 0;
		}
		else if(temp)
		{
			if(SysCtrl.usensor==USENSOR_STAT_NULL)
			{
			    usbdelay = XOSTimeGet();
				SysCtrl.usensor=USENSOR_STAT_UNSTABLE;
				deg_Printf("deamon : usensor in\n");
			}
			else if((SysCtrl.usensor==USENSOR_STAT_UNSTABLE) &&((usbdelay+100)<XOSTimeGet()))
			{
			 //   XOSTimeDly(100);
			    usbdelay = 0;
                boardIoctrl(SysCtrl.bfd_usensor,IOCTRL_USB_POWER,1);
			    deg_Printf("deamon : usensor power on\n");
			    SysCtrl.usensor=USENSOR_STAT_IN;
			    backrec_sensor(1);
				u8 usb_type = usb_host_detect();
				if(usb_type ==1)
					hal_husb11_init_typeA();
				else if(usb_type ==2)
					hal_husb_init_typeA();
				else
					SysCtrl.usensor=USENSOR_STAT_NULL;
			}
		}
	}
#endif	
//--------------------usb detect------------------------
	ret = boardIoctrl(SysCtrl.bfd_usb,IOCTRL_USB_CHECK,(INT32U)&temp);
	if(ret>=0)
    {
		if((temp == 0) && (SysCtrl.usb !=USB_STAT_NULL)) // dc out
		{			
		    SysCtrl.usb = USB_STAT_NULL;  // dc out
		    SysCtrl.f_update |= FLAG_USB;
			SysCtrl.f_update |= FLAG_BAT;
			SysCtrl.t_powersave = hal_rtcSecondGet();
			checkStable = 5; // wait stable
			usbdev = 0;
			usbdev_reset();
			deg_Printf("dc out,power off\n");
			XMsgQPost(SysCtrl.sysQ,(void *)(SYS_EVENT_OFF|EVENT_SYS));
		}
		else if(temp&& (SysCtrl.usb ==USB_STAT_NULL)) // dc in
		{
			SysCtrl.t_usb = USB_STAT_DCIN;
			if(SysCtrl.usensor == USENSOR_STAT_NULL)
				ret = hal_usbdCheck();
			else
				ret = -1;
			if(ret>=0)
			{
				hal_usbdInit(0);
			}

		 	SysCtrl.usb = USB_STAT_DCIN;
			
			SysCtrl.f_update |= FLAG_USB;
			SysCtrl.battery = BATTERY_STAT_5;
			XMsgQPost(SysCtrl.sysQ,(void *)(SYS_EVENT_USB|EVENT_SYS));
			nopower = 0;
		}
		else
		{
			if((SysCtrl.usb == USB_STAT_DCIN)&&usbdev_rqu()&&(usbdev==0))
			{
				SysCtrl.usb = USB_STAT_PC;
				usbdev = 1;
				XMsgQPost(SysCtrl.sysQ,(void *)(SYS_EVENT_USB|EVENT_SYS));
				//hal_usbdUninit();
			}

			if(BAT_CHARGE_CHECK())		// bat full
			{
				SysCtrl.battery = BATTERY_STAT_MAX;
			}
			else	// bat charging
			{
				SysCtrl.battery = BATTERY_STAT_5;
			}
		}
    }

#if 0
//----------------------battery detect---------------------------------------	
	if(SysCtrl.usb == USB_STAT_NULL) // only dc out check battery
	{
		checkTime--;
		if(checkTime)
			return ;
		checkTime = 1;
	    ret = boardIoctrl(SysCtrl.bfd_battery,IOCTRL_BAT_CHECK,(INT32U)&temp);  
		if(ret>=0)
		{
			if((SysCtrl.battery != temp)&&(checkStable==0)) // need battery stable
			{
				checkStable = 2;
			}
			else if(SysCtrl.battery == temp)
			{
				checkStable=0;
				return ; // no need update
			}
			if(checkStable>0)
				checkStable--;
            
			if(checkStable == 0)
			{
				SysCtrl.battery = temp;
				if(temp==0)
				{
					deg_Printf("low power battery = %x\n",SysCtrl.battery);
					//taskStart(TASK_POWER_OFF,0);		
				}
				XMsgQPost(SysCtrl.sysQ,(void *)(SYS_EVENT_BAT|EVENT_SYS));
			}
		}

	}
#endif
	
}
/*******************************************************************************
* Function Name  : deamon_gsensor_check
* Description    : gsensor stat check
* Input          : *
* Output         : None
* Return         : None
*******************************************************************************/
void deamon_gsensor_check(void) // 10 ms
{
/*
	static INT8U count=0;
	int temp,ret;

	
	count++;
	if(count<50)
		return ;
	count = 0;

	if((keyTime+3000)>XOSTimeGet())
		return ;
	if((task_get_curstate() != MAIN_STAT_VIDEO_REC) || menuActiveGet())
		return ;
	if((SysCtrl.bfd_gsensor>0) && configValue2Int(CONFIG_ID_GSENSOR))
    {
		ret = boardIoctrl(SysCtrl.bfd_gsensor,IOCTRL_GSE_LOCK,(INT32U)&temp);
		if((ret>=0) && temp && (videoRecordGetStatus()==MEDIA_STAT_START))
		{
			SysCtrl.g_lock = 1;
			SysCtrl.f_update |= FLAG_LOK;
			deg_Printf("deamon : gsensor active.\n");
			//sysLog("deamon : gsensor active.");
		}
		
    }
 */
}

/*******************************************************************************
* Function Name  : deamon_led_check
* Description    : led stat seting
* Input          : *
* Output         : None
* Return         : None
*******************************************************************************/
void deamon_led_check(void) // 10 ms
{
	static INT32U count=0;
	count++;

	if(0 != SysCtrl.firmware_update)		// updata show 
	{
		if(1 == SysCtrl.firmware_update)	//success
		{
			if(0==(count % 100))
			{
				
				LED_RED_CHANGE();
			}
		}
		else
		{
			if(0==(count % 10))
			{
				
				LED_RED_CHANGE();
			}
		}
	}
	else if(MAIN_STAT_POWER_OFF== task_get_curstate())
	{
	
		LED_RED_OFF();
	}
	else if(0 == cmos_sensor_id)	// sensor err
	{
		if(0==(count % 10))
		{
			
		}
	}
	else if(SDC_STAT_NULL == SysCtrl.sdcard)	// TF offline
	{
		if(0==(count % 10))
		{
	
			LED_RED_CHANGE();
		}
	}
	else if((SDC_STAT_ERROR == SysCtrl.sdcard) || (SDC_STAT_FULL == SysCtrl.sdcard))
	{
		if(0==(count % 10))
		{
			
		}
	}
	else
	{
		if(MAIN_STAT_VIDEO_REC== task_get_curstate())
		{
		
			if(MEDIA_STAT_START == videoRecordGetStatus())	// recording 
			{
				if(0==(count % 50))
				{
				
					LED_RED_CHANGE();
				}
			}
			else		// standy
			{
				if(USB_STAT_NULL != SysCtrl.usb)	// dc in ,or usb
				{

					if(BATTERY_STAT_MAX == SysCtrl.battery)  // bat full
					{
					
						LED_RED_OFF();
					}
					else	// charging
					{
						if(0==(count % 50))
						{
						
							LED_RED_CHANGE();
						}
					}

				}
				else
				{
					
					LED_RED_OFF();
				}
			}
		}
		else if(MAIN_STAT_AUDIO_REC== task_get_curstate())
		{
			if(MEDIA_STAT_START == audioRecordGetStatus())	// recording 
			{
				if(0==(count % 50))
				{
					
					LED_RED_ON();
				}
			}
			else if(MEDIA_STAT_FILE_FULL== audioRecordGetStatus())	// file num full
			{
				if(0==(count % 50))
				{
					
				}
			}
			else		// standy
			{
				if(USB_STAT_NULL != SysCtrl.usb)	// dc in ,or usb
				{

					if(BATTERY_STAT_MAX == SysCtrl.battery)  // bat full
					{
						
						LED_RED_OFF();
					}
					else	// charging
					{
						if(0==(count % 50))
						{
							
							LED_RED_CHANGE();
						}
					}

				}
				else
				{
					
					LED_RED_OFF();
				}
			}
		}
		else if(MAIN_STAT_PHOTO_ENC == task_get_curstate())
		{
			if(MEDIA_STAT_FILE_FULL== imageEncodeGetStatus())	// file num full
			{
				if(0==(count % 50))
				{
					
				}
			}
			else 
			{
				if(USB_STAT_NULL != SysCtrl.usb)	// dc in ,or usb
				{
					if(task_image_get_take_flag())
					{
						LED_RED_ON();
					}
					else
					{
						if(BATTERY_STAT_MAX == SysCtrl.battery)  // bat full
						{
							
							LED_RED_OFF();
						}
						else	// charging
						{
							if(0==(count % 50))
							{
								LED_RED_CHANGE();
							}
						}
					}
				}
				else
				{
					if(task_image_get_take_flag())
					{
					
						LED_RED_ON();
					}
					else
					{
						
						LED_RED_OFF();
					}
				}
			}
		}
		else if(USB_STAT_NULL != SysCtrl.usb)	// dc in ,or usb
		{
			if(BATTERY_STAT_MAX == SysCtrl.battery)  // bat full
			{
				
				LED_RED_OFF();

			}
			else	// charging
			{
				if(0==(count % 50))
				{
					LED_RED_CHANGE();
				}
			}


		}
	}

}


/*******************************************************************************
* Function Name  : deamon_screen_save
* Description    : screen save check
* Input          : *
* Output         : None
* Return         : None
*******************************************************************************/
int deamon_screen_save(int event)
{
/*
	int cfg_save;

	if(task_get_curstate() == MAIN_STAT_POWER_OFF)
		return 0;
    if((SysCtrl.t_screensave== 0)&&(SysCtrl.astern == ASTERN_ON))
	{
	    boardIoctrl(SysCtrl.bfd_lcd,IOCTRL_LCD_BKLIGHT,1);   // screen on			
		SysCtrl.t_screensave = hal_rtcSecondGet();
	}
	cfg_save = configValue2Int(CONFIG_ID_SCREENSAVE);
	if(event == 0) // service check
	{
		if(menuActiveGet() || (SysCtrl.astern == ASTERN_ON)) // menu active,no event
			return 0;
		if(SysCtrl.t_screensave && cfg_save)
		{
			if((SysCtrl.t_screensave+cfg_save)<=hal_rtcSecondGet())
			{
				SysCtrl.t_screensave = 0;
				boardIoctrl(SysCtrl.bfd_lcd,IOCTRL_LCD_BKLIGHT,0);   // screen off
			    deg_Printf("screen save : back light off\n");
			}
		}
	}
	else if((event == (SYS_EVENT_USB|EVENT_SYS)) || (event == (SYS_EVENT_SDC|EVENT_SYS))||\
		       (event == EVENT_KEY))
	{
		if((SysCtrl.t_screensave == 0))
		{
			boardIoctrl(SysCtrl.bfd_lcd,IOCTRL_LCD_BKLIGHT,1);   // screen on			
			SysCtrl.t_screensave = hal_rtcSecondGet();
            deg_Printf("screen save : back light on\n");
			return 1;
		}
		else
		{
			SysCtrl.t_screensave = hal_rtcSecondGet();		// push key will recount 
			//deg_Printf("screen save : reset screen save time\n");
		}
	}
*/
	return 0;
}
/*******************************************************************************
* Function Name  : deamon_auto_poweroff
* Description    : system auto power off check
* Input          : int event : system event
* Output         : None
* Return         : None
*******************************************************************************/
int deamon_auto_poweroff(int event)
{
#if (BOARD_TYPE_MINIDV == SYSTEM_BOARD)
		INT8U state;
	
		if(event == EVENT_KEY)
		{
			SysCtrl.t_autooff = AUTO_POWER_OFF_TIME*1000;
			//deg_Printf("EVENT_KEY into=%d\n",SysCtrl.t_autooff);
			return 0;
		}
		state = task_get_curstate();
		
	
		if(((state == MAIN_STAT_VIDEO_REC) && (videoRecordGetStatus() == MEDIA_STAT_START)) || \
			((state == MAIN_STAT_AUDIO_REC) && (audioRecordGetStatus() == MEDIA_STAT_START)) || \
			(state == MAIN_STAT_MASS_USB)||(state == MAIN_STAT_POWER_OFF)||(state == MAIN_STAT_POWER_ON)||\
			(USB_STAT_NULL != SysCtrl.usb))
		{
			//SysCtrl.t_autooff
			SysCtrl.t_autooff = AUTO_POWER_OFF_TIME*1000;
			//deg_Printf("SysCtrl.t_autooff=%d,state=%d,%d,%d,usb=%d\n",SysCtrl.t_autooff,state,videoRecordGetStatus(),audioRecordGetStatus(),SysCtrl.usb);
			return 0;
		}
			
		if(event == 0)
		{
			if(SysCtrl.t_autooff)
			{
				SysCtrl.t_autooff -= 20*X_TICK;
				//deg_Printf("SysCtrl.t_autooff=%d\n",SysCtrl.t_autooff);
				if(SysCtrl.t_autooff<=0)
				{
					SysCtrl.t_autooff = 0;
					XMsgQPost(SysCtrl.sysQ,(void *)(SYS_EVENT_OFF|EVENT_SYS));
					//deg_Printf("auto power off \n");
				}
			}
		}
#endif

	return 0;
}
/*******************************************************************************
* Function Name  : deamon_event_handler
* Description    : deamon event handle
* Input          : *
* Output         : None
* Return         : None
*******************************************************************************/
int deamon_event_handler(INT16U *value,INT16U *event)
{	

	INT32U msgid;
	INT8U err,key;
	
	msgid = (INT32U)XMsgQPend(SysCtrl.sysQ,&err);  // check system event
	if(err == X_ERR_NONE)
	{
		if((msgid&0xff) == EVENT_KEY)
		{			
			key = (msgid&0xff00)>>8;
			//deg_Printf("pend key : %d\n",key);

			if(value)
				*value = (msgid&0xff00)>>8;
		}
		else
		{
			if(value)
				*value = msgid&0xff00;
		}
		if(event)
			*event = msgid&0xff;
		return (msgid&0xff);
	}

	return -1;

}
/*******************************************************************************
* Function Name  : deamon_keysound_check
* Description    : deamon key sound condition check
* Input          : *
* Output         : None
* Return         : None
*******************************************************************************/
int deamon_keysound_play(INT8U key)
{
#if 0
	if((key&T_KEY_SHORT_UP)==0) // key down
	{
		return 0;
	}
	if(SysCtrl.f_keysound==0) // key sound off
	{
		return 0;
	}
	if((videoPlaybackGetStatus()==MEDIA_STAT_PLAY)||(audioPlaybackGetStatus()==MEDIA_STAT_PLAY)) // video/audio playing
	{
		return 0;
	}

    if((task_get_curstate() == MAIN_STAT_PHOTO_ENC) && (key==(T_KEY_SHORT_UP|KEY_VALUE_OK))&&(menuActiveGet()==0)) // take photo
	{
		return 0;
	}
    if(task_get_curstate() == MAIN_STAT_POWER_OFF)
		return 0;
	
	Audio_ARG_T music;

//	music.size = 2160;
	music.media.src.buff = (INT32U)layout_keysound_load(&music.size);//buildwin_res_key;
	if(music.media.src.buff==0)
	{
		deg_Printf("load music fail\n");
		return -1;
	}
	music.channel =1 ;
	music.type = FILE_TYPE_RAW;
	music.samplerate = 16000;
	music.media.type = MEDIA_SRC_RAM;

    audioPlaybackSetVolume(KEYSOUND_VOLUME);
//	audioPlaybackSetVolume(100);
	audioPlaybackStart(&music);
#endif
	return 0;		
}
/*******************************************************************************
* Function Name  : deamon_fsFreeSize
* Description    : deamon get fs free size
* Input          : *
* Output         : None
* Return         : None
*******************************************************************************/
int deamon_fsFreeSize(void)
{
	if(SysCtrl.sdcard == SDC_STAT_NORMAL)
	{
		SysCtrl.sd_freesize = fs_free_size()>>1;  // kb
		/*if(fs_check()<0)
		{
			SysCtrl.sd_freesize = 0;
			deg_Printf("deamon : fs system too more debris\n");
		}*/
		if(SysCtrl.sd_freesize == 0)
		{
			SysCtrl.sdcard = SDC_STAT_FULL; 
			SysCtrl.f_update |= FLAG_SDC;
			deg_Printf("deamon : sdc normal but free space is 0.set sdc error\n");  // user need format sdc
		}
	}
	else
		SysCtrl.sd_freesize = 0;
	deg_Printf("deamon : fs free size = %dG%dM%dKB\n",SysCtrl.sd_freesize>>20,(SysCtrl.sd_freesize>>10)&0x3ff,(SysCtrl.sd_freesize)&0x3ff);
	return SysCtrl.sd_freesize;
}
/*******************************************************************************
* Function Name  : deamon_fsSizeAdd
* Description    : deamon dec size from free size
* Input          : *
* Output         : None
* Return         : None
*******************************************************************************/
int deamon_fsSizeModify(INT8S dec,INT32U size)
{
	if(size&(SysCtrl.fs_clustsize-1))
	{
		size = (size&(~(SysCtrl.fs_clustsize-1)))+SysCtrl.fs_clustsize;
		//size+=1024;
	}
	size>>=10;
//    deg_Printf("deamon 0: fs free size = %dG%dM%dKB\n",SysCtrl.sd_freesize>>20,(SysCtrl.sd_freesize>>10)&0x3ff,(SysCtrl.sd_freesize)&0x3ff);
	if(dec<0)
	{
		if(SysCtrl.sd_freesize>size)
			SysCtrl.sd_freesize-=size;
		else
			SysCtrl.sd_freesize = 0;
	}
	else
	{
		SysCtrl.sd_freesize+=size;
	}
//	deg_Printf("deamon 1: fs free size = %dG%dM%dKB\n",SysCtrl.sd_freesize>>20,(SysCtrl.sd_freesize>>10)&0x3ff,(SysCtrl.sd_freesize)&0x3ff);
	return SysCtrl.sd_freesize;
}




