/****************************************************************************
**
 **                              TASK DEMO
  ** *   **             THE APPOTECH MULTIMEDIA PROCESSOR
   **** **                  TASK AUDIO PLAYBACK DEMO
  *** ***
 **  * **               (C) COPYRIGHT 2016 BUILDWIN 
**      **                         
         **         BuildWin SZ LTD.CO  ; VIDEO PROJECT TEAM
          **   
* File Name   : task_audio_playback.c
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


static int audio_play_start(int idx)
{
	Audio_ARG_T arg;
	INT32U totaltime;
	char *name;
	int type;

	name = manangerGetFileFullPathName(SysCtrl.wav_list,idx,&type);
	if(name == NULL)
		return -1;
	
		
	arg.media.src.fd = (FHANDLE)open(name,FA_READ);
	if((int)arg.media.src.fd < 0)
		return -1;

	arg.channel = 1;
	arg.samplerate = SAMPLE_RATE_AUTO;
	arg.type = FILE_TYPE_WAV;
	arg.media.type = MEDIA_SRC_FS;

	if(audioPlaybackStart(&arg)<0)
	{
		deg_Printf("audio task : play fail\n");
		return -1;
	}

	audioPlaybackGetTime(&totaltime,NULL);	
	deg_Printf("audio task : play ok.total time = %dm %ds %dms\n",(totaltime/1000)/60,(totaltime/1000)%60,totaltime%1000);

	return 0;
}
/*******************************************************************************
* Function Name  : task_audio_playback
* Description    : audio playback task
* Input          : void *para : for task initial use
* Output         : none                                            
* Return         : 
*******************************************************************************/
void task_audio_playback(void *para)
{
	INT16U value,event;
	INT32S ret,index;

	deg_Printf("audio play task enter\n");

	audioPlaybackInit();

    index = 1;
	audio_play_start(index);
	
	while(1)
	{
		event = 1;
		ret = systemEventService(&value,&event);
		if(ret>0)
		{
			if(ret == EVENT_KEY)
			{
				ret = audioPlaybackGetStatus();
				if(value == (KEY_VALUE_OK|KEY_EVENT_CLICK)) // start/pause/resume
				{
					if(ret == MEDIA_STAT_STOP)
						audio_play_start(index);
					else if(ret == MEDIA_STAT_START)
						audioPlaybackPuase();
					else if(ret == MEDIA_STAT_PAUSE)
						audioPlaybackResume();
				}
				else if(value == (KEY_VALUE_DOWN|KEY_EVENT_CLICK))//next
				{
					if(ret != MEDIA_STAT_STOP)
						audioPlaybackStop();
					index++;
					if(index>managerFileCount(SysCtrl.wav_list))
						index = 1;
					audio_play_start(index);
				}
				else if(value == (KEY_VALUE_UP|KEY_EVENT_CLICK))//prev
				{
					if(ret != MEDIA_STAT_STOP)
						audioPlaybackStop();
					index--;
					if(index<=0)
						index = managerFileCount(SysCtrl.wav_list);
					audio_play_start(index);
				}
				else if(value == (KEY_VALUE_MODE|KEY_EVENT_CLICK))//exit
				{
					if(ret == MEDIA_STAT_STOP)
					{
						task_change_state();
						break;
					}
				}
				
			}
			
		}
         
		audioPlaybackService();
	}
	audioPlaybackStop();
	
    audioPlaybackUninit();

	deg_Printf("audio play task exit\n");
}




