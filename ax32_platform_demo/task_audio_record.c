/****************************************************************************
**
 **                              TASK DEMO
  ** *   **             THE APPOTECH MULTIMEDIA PROCESSOR
   **** **                  TASK AUDIO RECORD DEMO
  *** ***
 **  * **               (C) COPYRIGHT 2016 BUILDWIN 
**      **                         
         **         BuildWin SZ LTD.CO  ; VIDEO PROJECT TEAM
          **   
* File Name   : task_audio_record.c
* Author      : Mark.Douglas 
* Version     : V100
* Date        : 09/22/2016
* Description : This file is image encode file
*               
* History     : 
* 2016-09-22  : 
*      <1>.This is created by mark,set version as v100.
*      <2>.Add basic functions & information
******************************************************************************/
#include "application.h"

int audio_record_callback(INT32U cmd,INT32U para)
{
    FHANDLE *fd;
	int fdt;
    char *name;
	
	if(cmd == CMD_AUDIO_RECORD_START)
	{
		name = managerFileNameCreater(SysCtrl.wav_list,SUFFIX_WAV,FILEDIR_AUDIO);
		if(name == NULL)
		{
			deg_Printf("audio : create file name fail.\n");
			if(managerFileCount(SysCtrl.wav_list)>=MANAGER_LIST_MAX)
			{
				deg_Printf("audio : file num full.\n");
				audioRecordSetStatus(MEDIA_STAT_FILE_FULL);
			}
			return -1;
		}

		fdt = open(name,FA_CREATE_NEW | FA_WRITE | FA_READ);
		if(fdt<0)
		{
			deg_Printf("audio : open file fail<%s>,%d\n",name,fdt);
			return -1;
		}
		fd = (FHANDLE *)para;
		*fd = (FHANDLE)fdt;
		managerAddFile(SysCtrl.wav_list,FILEDIR_AUDIO,&name[strlen(FILEDIR_AUDIO)]);
		deg_Printf("audio : open file ok<%s>\n",name);
		return 0;
	}
	else if(cmd == CMD_AUDIO_RECORD_STOP)
	{
		fd = (FHANDLE *)para;
		deamon_fsSizeModify(-1,fs_size((FHANDLE)*fd));
		close((FHANDLE)*fd);
		return 0;
	}
	else if(cmd == CMD_COM_ERROR)
	{
		if(para == CMD_AUDIO_RECORD_START)
		{
			fd = (FHANDLE *)para;
			close((FHANDLE)*fd);
			return 0;
		}
	}
	else if(cmd == CMD_COM_CHECK) // check sdc sapce
	{
		return managerSpaceCheck(SysCtrl.wav_list,FILEDIR_AUDIO,para);
	}

    return 0;
}
/*******************************************************************************
* Function Name  : task_audio_record
* Description    : audio record task
* Input          : void *para : for task initial use
* Output         : none                                            
* Return         : 
*******************************************************************************/
void task_audio_record(void *para)
{
	AUDIO_RARG_T arg;
	int ret;
	INT16U value,event;

	deg_Printf("audio task enter\n");
	SENSOR_PWDN_OFF();
	arg.channel = 1;
	arg.samplerate = SAMPLE_RATE_16000;
	arg.looprec = AUDIO_LOOP_EN;
	arg.looptime = AUDIO_REC_TIME; // second
	arg.tar_type = WAV_TYPE_PCM;
    arg.callback = audio_record_callback;

    audioRecordInit(&arg);

	if(managerSpaceCheck(SysCtrl.wav_list,FILEDIR_AUDIO,0)<0) // check space
	{
		hal_sdUnlock();
		SysCtrl.sdcard = SDC_STAT_FULL;
		deg_Printf("wav_list full\n");
	}

	while(1)
	{
		event = 0;
		ret = systemEventService(&value,&event);
		if(ret>0)
		{
			if(ret == EVENT_KEY)
			{
				ret = audioRecordGetStatus();
				if(value == (KEY_VALUE_AUDIO|KEY_EVENT_CLICK))	 // key-audio
				{
					if(ret == MEDIA_STAT_START)
					{	
						audioRecordStop();
					}
					else if(ret == MEDIA_STAT_STOP)
					{
						ret = audioRecordStart();
						if(ret < 0)
						{
							deg_Printf("audioRecordStart %d\n",ret);
						}
					}
				}
				else if(value == (KEY_VALUE_DV|KEY_EVENT_LONGUP)) // key-dv 
				{
					if(ret == MEDIA_STAT_START)
						audioRecordStop();

					task_set_state(MAIN_STAT_VIDEO_REC);
					XMsgQPost(SysCtrl.sysQ,(void *)(EVENT_KEY|((KEY_VALUE_DV|KEY_EVENT_UP)<<8)));
					XMsgQPost(SysCtrl.sysQ,(void *)(EVENT_KEY|(value<<8)));
					break;
				}
				else if(value == (KEY_VALUE_DV|KEY_EVENT_CLICK)) // key-dc
				{
					if(ret == MEDIA_STAT_START)
						audioRecordStop();

					task_set_state(MAIN_STAT_PHOTO_ENC);
					XMsgQPost(SysCtrl.sysQ,(void *)(EVENT_KEY|((KEY_VALUE_DV|KEY_EVENT_UP)<<8)));
					XMsgQPost(SysCtrl.sysQ,(void *)(EVENT_KEY|(value<<8)));
					hal_csiEnable(1);
					break;
				}
				else if(value == (KEY_VALUE_AUDIO|KEY_EVENT_LONG))  // key-power long : power off
				{
					if(ret == MEDIA_STAT_START)
						audioRecordStop();

					task_set_state(MAIN_STAT_POWER_OFF); // power off 
					break;
				}
			}
			else if(event == EVENT_SYS) // system event
			{
				ret = audioRecordGetStatus();
				if(value == SYS_EVENT_SDC) // sdc event
				{
					if(SysCtrl.sdcard != SDC_STAT_NORMAL && ret == MEDIA_STAT_START) // sdc out when recording
						audioRecordStop();
					deg_Printf("recorder : sdc stat ->%d\n",SysCtrl.sdcard);
				}
				else if((value == SYS_EVENT_USB)) // usb event
				{
					//deg_Printf("recorder : usb stat ->%d\n",SysCtrl.usb);
					if(SysCtrl.usb == USB_STAT_PC) // usb out or battery low
					{
						if(ret == MEDIA_STAT_START)
							audioRecordStop();
						task_set_state(MAIN_STAT_MASS_USB); 
						break;
					}
				}
				else if(value == SYS_EVENT_BAT)
				{
					/*deg_Printf("recorder : battery stat ->%d\n",SysCtrl.battery);
					if(SysCtrl.battery == 0)
					{
						if(recstat == MEDIA_STAT_START)
							 task_record_stop();
						task_set_state(MAIN_STAT_POWER_OFF); // power off 
						break;
					}*/
				}
				else if(value == SYS_EVENT_OFF)
				{
					deg_Printf("recorder : system power off.\n");
					if(ret == MEDIA_STAT_START)
						audioRecordStop();
					#if (BOARD_TYPE_MINIDV == SYSTEM_BOARD)
					task_set_state(MAIN_STAT_POWER_OFF);	// power off 
					#endif
					break;
				}
				else if(value == SYS_EVENT_MD)
				{
					if(ret == MEDIA_STAT_STOP)
					{
						deg_Printf("SYS_EVENT_MD\n");
						task_set_state(MAIN_STAT_VIDEO_REC);
						XMsgQPost(SysCtrl.sysQ,(void *)(EVENT_KEY|((KEY_VALUE_DV|KEY_EVENT_UP)<<8)));
						XMsgQPost(SysCtrl.sysQ,(void *)(EVENT_KEY|(value<<8)));
					}
				}
		
			}
		}

		audioRecordService();

		if(MEDIA_STAT_STOP == audioRecordGetStatus())
		{
			static u32 temp_cnt = 0;
			temp_cnt++;
			if(temp_cnt > 10000)
			{
				temp_cnt = 0;
				if(managerSpaceCheck(SysCtrl.wav_list,FILEDIR_AUDIO,0)<0) // check space
				{
					hal_sdUnlock();
					SysCtrl.sdcard = SDC_STAT_FULL;
				}
			}
		}

	}
    audioRecordUninit();
	deg_Printf("audio task exit\n");
}




