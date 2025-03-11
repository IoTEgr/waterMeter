/****************************************************************************
**
 **                              TASK DEMO
  ** *   **             THE APPOTECH MULTIMEDIA PROCESSOR
   **** **                      TASK MAIN
  *** ***
 **  * **               (C) COPYRIGHT 2016 BUILDWIN 
**      **                         
         **         BuildWin SZ LTD.CO  ; VIDEO PROJECT TEAM
          **   
* File Name   : task_main.c
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

typedef struct Status_Reg_S
{
	INT16U cur_stat;
	INT16U prv_stat;
}Status_Reg_T;
#define MAIN_STAT_NUM    3

static INT8U MainStateTable[] = {MAIN_STAT_VIDEO_REC,MAIN_STAT_PHOTO_ENC,MAIN_STAT_VIDEO_PLY};//MAIN_STAT_AUDIO_REC,
static Status_Reg_T mainCtrl;
/*******************************************************************************
* Function Name  : task_main
* Description    : video main
* Input          : void *para : for task initial use
* Output         : none                                            
* Return         : 
*******************************************************************************/
bool task_main(void *para)
{
	u32 temp;

	deg_Printf("main task : SysCtrl.usb=%d\n",SysCtrl.usb);
	if(SysCtrl.usb == USB_STAT_PC)
	{
        task_set_state(MAIN_STAT_MASS_USB);
	}
	else
	{		
	    task_set_state(MAIN_STAT_PHOTO_ENC);

	}


#if (1 == MOTION_DEC_EN)
		hal_md_reset_checktime();
		hal_mdEnable(1);
		//deg_Printf("md:%d\n",hal_mdEnable_check());
#endif

	while(1)
	{
		switch(mainCtrl.cur_stat)
		{
			case MAIN_STAT_VIDEO_REC:
				   task_video_record((void *)0);
				   break;
		    case MAIN_STAT_PHOTO_ENC:
				   task_image_encode((void *)0);
				   break;
			case MAIN_STAT_VIDEO_PLY:
				   task_video_playback((void *)0);
				   break;
			case MAIN_STAT_AUDIO_REC:
				   task_audio_record((void *)0);
			       break;
			case MAIN_STAT_AUDIO_PLY:
			       task_audio_playback((void *)0);
				   break;
			case MAIN_STAT_MASS_USB:
                   if(task_usb((void *)0)==false)
					   return false;
				   break;	   
			case MAIN_STAT_POWER_OFF:
                   return true; // power off
                   break;	   			
		   	case MAIN_STAT_USB_HOST:
				   task_usb_host((void *)0);
				   break;

			default:// error stat
				   task_set_state(MAIN_STAT_VIDEO_REC);
				   break;
		}
	}

}
/*******************************************************************************
* Function Name  : task_set_state
* Description    : set main state
* Input          : INT8U stat : main state.see the table,MAIN_STAT_VIDEO_REC/MAIN_STAT_PHOTO_ENC
* Output         : none                                            MAIN_STAT_VIDEO_PLY/MAIN_STAT_AUDIO_REC
* Return         :                                                    MAIN_STAT_AUDIO_PLY
*******************************************************************************/
int task_set_state(INT8U stat)
{
	mainCtrl.prv_stat = mainCtrl.cur_stat;
	mainCtrl.cur_stat = stat;

	return mainCtrl.prv_stat;
}
/*******************************************************************************
* Function Name  : task_get_state
* Description    : get main state
* Input          : INT8U stat : main state.see the table,MAIN_STAT_VIDEO_REC/MAIN_STAT_PHOTO_ENC
* Output         : none                                            MAIN_STAT_VIDEO_PLY/MAIN_STAT_AUDIO_REC
* Return         :                                                    MAIN_STAT_AUDIO_PLY
*******************************************************************************/
void task_get_state(INT8U *cur,INT8U *prev)
{
	if(cur)
		*cur = mainCtrl.cur_stat;
	if(prev)
		*prev = mainCtrl.prv_stat;
}
/*******************************************************************************
* Function Name  : task_get_curstate
* Description    : get main state
* Input          : INT8U stat : main state.see the table,MAIN_STAT_VIDEO_REC/MAIN_STAT_PHOTO_ENC
* Output         : none                                            MAIN_STAT_VIDEO_PLY/MAIN_STAT_AUDIO_REC
* Return         :                                                    MAIN_STAT_AUDIO_PLY
*******************************************************************************/
INT8U task_get_curstate(void)
{
	return mainCtrl.cur_stat;
}
/*******************************************************************************
* Function Name  : task_change_state
* Description    : change main state
* Input          : 
* Output         : none                                            
* Return         :                                                    
*******************************************************************************/
void task_change_state(void)
{
	int i;

	for(i=0;i<MAIN_STAT_NUM;i++)
	{
		if(MainStateTable[i] == mainCtrl.cur_stat)
			break;
	}
	i++;
	if(i>=MAIN_STAT_NUM) // unknow stat
		i = 0;
	task_set_state(MainStateTable[i]);

}


