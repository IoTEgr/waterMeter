/****************************************************************************
**
 **                              TASK DEMO
  ** *   **             THE APPOTECH MULTIMEDIA PROCESSOR
   **** **                  TASK VIDEO PLAYBACK DEMO
  *** ***
 **  * **               (C) COPYRIGHT 2016 BUILDWIN 
**      **                         
         **         BuildWin SZ LTD.CO  ; VIDEO PROJECT TEAM
          **   
* File Name   : task_video_playback.c
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


#define  TASK_VIDEOPLAY_THUMBNAIL        0
#define  TASK_VIDEOPLAY_AUTOPLAY         1      //0,playback end,display last frame of current file
                                                //1,playback end,display first frame of current file
                                                //2,playback end,display first frame of next file
#if TASK_VIDEOPLAY_AUTOPLAY >0
    #define  TASK_VIDEOPLAY_FIRSTFRAME      1
#else
    #define  TASK_VIDEOPLAY_FIRSTFRAME      1
#endif


typedef struct Video_Thumbnail_S
{
	char file_name[MANAGER_NAME_LEN+1];

	INT8U index;
	INT8U stat;
	INT16U file_index;
	INT8U *y_buffer;
	INT8U *uv_buffer;

}Video_Thumbnail_T;

//static Video_Thumbnail_T thnumbnailCtrl[THUMBNAIL_CFG_NUM];
#define  VIDEO_PLAY_WAIT_KEYSOUND_END           while(audioPlaybackGetStatus() == MEDIA_STAT_PLAY){XOSTimeDly(10);}


int video_playback_start(int index)
{
#if 0
	char *name;
	
	
	int type;

	if(managerFileCount(SysCtrl.avi_list)<1)
		return -1;

	deg_Printf("video play : index = %d ",index);

	name = manangerGetFileFullPathName(SysCtrl.avi_list,index,&type);
	if(name == NULL)
	{
		return -1;
	}
    SysCtrl.file_index = index;
    deg_Printf(": %s\n",name);
	if(type == FILE_TYPE_JPG)
	{
		Image_ARG_T arg;
		disp_frame_t *p_lcd_buffer;

        dispLayerGetResolution(DISP_LAYER_VIDEO,&arg.target.width,&arg.target.height);
        dispRatioResolutionCalculate(VIDEO_RATIO,&arg.target.width,&arg.target.height);  // jpeg scaler the jpg to target size
		
		p_lcd_buffer = (disp_frame_t *)dispLayerGetFrame(DISP_LAYER_VIDEO);

        arg.yout  = p_lcd_buffer->y_addr;
        arg.uvout = p_lcd_buffer->uv_addr;

		arg.media.type = MEDIA_SRC_FS;
		arg.media.src.fd = (FHANDLE)open(name,FA_READ);
		if((int)arg.media.src.fd<0)
			return -1;
		layout_video_playback_name(manangerGetFileFullPathName(SysCtrl.avi_list,index,NULL));
	    arg.wait = 1;  // wait decode end
	    if(imageDecodeStart(&arg)<0)
		{
			deg_Printf("jpg decode fail\n");
			close(arg.media.src.fd);
            dispLayerFreeFrame(DISP_LAYER_VIDEO,p_lcd_buffer);
			return -1;
		}
		INT16U width,height;
		imageDecodeGetResolution(&width,&height);
		if(height==720)
			layout_main_flag(ICON_FLAG_RES,CFG_RES_1M);
		else if(height==1080)
			layout_main_flag(ICON_FLAG_RES,CFG_RES_2M);
		else if(height==1440)
			layout_main_flag(ICON_FLAG_RES,CFG_RES_3M);
	    dispLayerShow(DISP_LAYER_VIDEO,(INT32U)p_lcd_buffer,arg.target.width,arg.target.height,VIDEO_ROTATE);
      
		close(arg.media.src.fd);

		deg_Printf("video player : JPG[%d:%d]\n",width,height);
	}
	else
	{
		VIDEO_PARG_T arg;
		INT16U width,height;
		
		arg.media.type = MEDIA_SRC_FS;
	    arg.media.src.fd = (FHANDLE)open(name,FA_READ);
		if((int)arg.media.src.fd<0)
			return -1;
        layout_video_playback_name(manangerGetFileFullPathName(SysCtrl.avi_list,index,NULL));
		dispLayerGetResolution(DISP_LAYER_VIDEO,&width,&height);
		arg.tar.width = width;
		arg.tar.height = height;
		dispRatioResolutionCalculate(VIDEO_RATIO,&arg.tar.width,&arg.tar.height); 
		arg.pos.x = (width-arg.tar.width)>>1;
		arg.pos.y = (height-arg.tar.height)>>1;
		arg.rotate = VIDEO_ROTATE;
		arg.firstframe = TASK_VIDEOPLAY_FIRSTFRAME; // pause at first frame waiting user key
		
        fs_fastseek_init(arg.media.src.fd);  // enable fast seek for this file
        
		while(audioPlaybackGetStatus() == MEDIA_STAT_PLAY);  // wait key sound end
		if(videoPlaybackStart(&arg)<0)
		{
			deg_Printf("avi decode fail<0x%x>\n",(int)arg.media.src.fd);
			close(arg.media.src.fd);
			return -1;
		}
		
		Media_Res_T *res= videoPlaybackGetResolution();
		if(res->height==720)
			layout_main_flag(ICON_FLAG_RES,CFG_RES_720P);
		else if(res->height==1080)
			layout_main_flag(ICON_FLAG_RES,CFG_RES_1080FHD);
		else 
			layout_main_flag(ICON_FLAG_RES,CFG_RES_720P);
		INT32U totatime;
		videoPlaybackGetTime(&totatime,NULL);
		deg_Printf("video player : AVI[%d:%d],total time = %dm %ds %dms\n",res->width,res->height,(totatime/1000)/60,(totatime/1000)%60,totatime%1000);
	}
    //layout_video_playback_name(manangerGetFileName(SysCtrl.avi_list,index));
	
	
    if(managerCheckLockExt(SysCtrl.avi_list,index))
		SysCtrl.g_lock = 1;  // set lock flag		
	else
		SysCtrl.g_lock = 0;  // set unlock flag		
    SysCtrl.f_update|=FLAG_LOK;
	deg_Printf("video play start.<%s>\n",name);
	return type;
#endif
}
#if TASK_VIDEOPLAY_THUMBNAIL>0
static int task_video_thumbnail(int index)
{
#if 0
	char *name;
	int ret,type;
	FHANDLE fd;	
	INT16U value,event,cnt,pcnt,page;
	INT16U w,h,j;
	INT16S x,y;

	cnt = managerFileCount(SysCtrl.avi_list);
	if(index>cnt)
		index = 1;
	page = (index-1)/9;
	pcnt = (page<(cnt/9))?9:(cnt%9);//((cnt-page*9)%9)?((cnt-page*9)%9):9;	
    j = 0;
	dispLayerGetResolution(DISP_LAYER_VIDEO,&w,&h);
	w = (w-THUMBNAIL_CFG_WIDTH*3)>>2;
	h = (h-THUMBNAIL_CFG_HEIGHT*3)>>2;

	videoPlaybackThumbnailInit(pcnt);
	layout_thumbnail_init(9);
    layout_thumbnail_display((index-1)%9,pcnt);
    deg_Printf("count = %d,page = %d,page cnt = %d,j = %d\n",cnt,page,pcnt,j);
	while(1)
	{
		event = 0;
		ret = systemEventService(&value,&event);
		if(ret>0)
		{
			if(ret == EVENT_KEY)
			{
				if(value == (KEY_VALUE_OK|T_KEY_SHORT_UP)) // key-ok
					break; 
				else if(value == (KEY_VALUE_UP|T_KEY_SHORT_UP)) // key-up
				{
					cnt = managerFileCount(SysCtrl.avi_list);
					index++;
					if(index>cnt)
						index = 1;
					if(((index-1)/9) != page)
					{
						page = (index-1)/9;
						pcnt = (page<(cnt/9))?9:(cnt%9);
					    j = 0;
						videoPlaybackThumbnailInit(pcnt);
						deg_Printf("count = %d,page = %d,page cnt = %d,j = %d\n",cnt,page,pcnt,j);
					}
					layout_thumbnail_display((index-1)%9,pcnt);
				}
				else if(value == (KEY_VALUE_DOWN|T_KEY_SHORT_UP)) // key-down
				{
					cnt = managerFileCount(SysCtrl.avi_list);
					index--;
					if(index<=0)
						index = cnt;
					if(((index-1)/9) != page)
					{
						page = (index-1)/9;
						pcnt = (page<(cnt/9))?9:(cnt%9);
					    j = 0;
						videoPlaybackThumbnailInit(pcnt);
						deg_Printf("count = %d,page = %d,page cnt = %d,j = %d\n",cnt,page,pcnt,j);
					}
					layout_thumbnail_display((index-1)%9,pcnt);
				}
				else if((value == (KEY_VALUE_MODE|T_KEY_SHORT_UP))) // key-mode.
				{
					task_change_state();//exit playback task
                    break;
				}
				
			}
		}

		if(j<pcnt) // thumbnail show one by one
		{
			name = manangerGetFileFullPathName(SysCtrl.avi_list,page*9+j+1,&type);
			if(name != NULL)
			{
				x = w+(THUMBNAIL_CFG_WIDTH+w)*(j%3);
				y = h+(THUMBNAIL_CFG_HEIGHT+h)*(j/3);	
				fd = (FHANDLE)open(name,FA_READ);
				videoPlaybackThumbnailOne(fd,type,x,y,THUMBNAIL_CFG_WIDTH,THUMBNAIL_CFG_HEIGHT);
				close(fd);	
			}
			j++;
			deg_Printf("thumbnail %d,->%s\n",page*9+j,name);	  
		}
	}
	videoPlaybackThumbnailUninit();
    layout_thumbnail_uninit();
	return index;
#endif
}
#endif
/*******************************************************************************
* Function Name  : task_video_playback
* Description    : video playback task
* Input          : void *para : for task initial use
* Output         : none                                            
* Return         : 
*******************************************************************************/
void task_video_playback(void *para)
{
#if 0
	INT16U value,event;
	INT32S ret,index=0,type=-1;
	INT8U state,delFlag=0;

 //   dispLayerUninit(DISP_LAYER_OSD0);
	deg_Printf("video playback task enter.\n");

    deg_Printf("video a count = %d\n",managerFileCountEx(SysCtrl.avia_list));
	deg_Printf("video b count = %d\n",managerFileCountEx(SysCtrl.avib_list));
    while(audioPlaybackGetStatus() == MEDIA_STAT_PLAY);  // wait key sound end
    videoPlaybackInit();
	videoPlaybackSetVolume(100);
    dispLayerSetPIPMode(DISP_PIP_DISABLE);
PLAYBACK_NOFILE:	
	if(managerFileCount(SysCtrl.avi_list)<1)
	{
		deg_Printf("video playback : no file\n");
		layout_video_playback_nofile();
	}
	else
	{
		    index = managerFileCount(SysCtrl.avi_list);
		    
		 //   videoPlaybackInit();
		//----------------------thumbnail show---------------------
#if TASK_VIDEOPLAY_THUMBNAIL>0
		    if(userConfigGetValue(CONFIG_ID_THUMBNAIL)==CFG_COM_ON) // thumbnail check enable
		    {
			    index = task_video_thumbnail(index);
				
				//if(task_get_curstate() != MAIN_STAT_VIDEO_PLY)
				//	goto END_VIDEOPLAY;
		    }
#endif	
		//--------------------video play-------------------------	
			//layout_video_playback_init();
			type = video_playback_start(index);           
	}


	while(1)
	{
		event = 0;
//--------------------------------------- auto loop playback		
    #if TASK_VIDEOPLAY_AUTOPLAY>0
		if((videoPlaybackGetStatus() == MEDIA_STAT_STOP) && (type==FILE_TYPE_AVI)&&(SysCtrl.astern != ASTERN_ON))
		{
            #if (TASK_VIDEOPLAY_AUTOPLAY > 1)
			index++;
			if(index>managerFileCount(SysCtrl.avi_list))
				index = 1;
            #endif
			type = video_playback_start(index);	
		}
    #endif
//-------------------------------------
		ret = systemEventService(&value,&event);
		if(ret>0)
		{
			state = videoPlaybackGetStatus();
			if(ret == EVENT_KEY) // key event handle
			{
				if(value == (KEY_VALUE_OK|KEY_EVENT_CLICK)) // key-ok
				{
					if(managerFileCount(SysCtrl.avi_list)>=1)
					{
						if(state== MEDIA_STAT_START)
						{
							videoPlaybackPuase();
							while(videoPlaybackGetStatus()==MEDIA_STAT_START);
							deamon_keysound_play(value);
						}
						else if(state== MEDIA_STAT_PAUSE)
						{
							VIDEO_PLAY_WAIT_KEYSOUND_END;
							layout_video_playback_init();
							videoPlaybackResume();
						}
						else
							type = video_playback_start(index);
					}
					
				}
				else if(value == (KEY_VALUE_DOWN|KEY_EVENT_CLICK)) // key-up
				{
					if(managerFileCount(SysCtrl.avi_list)>=1)
					{
					#if 0
						if(state == MEDIA_STAT_PLAY)
							videoPlaybackFastForward();
					#else							
						if(state != MEDIA_STAT_STOP)
						{
	                          videoPlaybackStop();
							  deamon_keysound_play(value);
						}
						index++;
						if(index>managerFileCount(SysCtrl.avi_list))
							index = 1;
						type = video_playback_start(index);	
					#endif
					}
					
				}
				else if(value == (KEY_VALUE_UP|KEY_EVENT_CLICK)) // key-down
				{
					if(managerFileCount(SysCtrl.avi_list)>=1)
					{
					#if 0
						if(state == MEDIA_STAT_PLAY)
							videoPlaybackFastBackward();

					#else
						if(state != MEDIA_STAT_STOP)
						{
	                          videoPlaybackStop();
							  deamon_keysound_play(value);
						}
						index--;
						if(index<1)
							index = managerFileCount(SysCtrl.avi_list);
						type = video_playback_start(index);	
					#endif	
					}
				
				}
#if KEY_NUM == 6
				else if(value == (KEY_VALUE_MENU|KEY_EVENT_CLICK)) // key-menu
#elif KEY_NUM == 5
				else if(value == (KEY_VALUE_MODE|KEY_EVENT_LONG)) // key-menu
#else
	#error "key number err"
#endif
				{
                    if((state != MEDIA_STAT_START)&&(managerFileCount(SysCtrl.avi_list)>0))
					{
						delFlag = 0;
						ret = managerFileCount(SysCtrl.avi_list);
                        layout_video_playback_menu(); 						
						layout_video_playback_name(manangerGetFileFullPathName(SysCtrl.avi_list,SysCtrl.file_index,NULL));
						if(managerFileCount(SysCtrl.avi_list)>=1)
						{
							if(ret<1)
							{
								layout_video_playback_uninit();
								index = managerFileCount(SysCtrl.avi_list);
								type = video_playback_start(index);
							}
							else
							{
								//if(index<=managerFileCount(SysCtrl.avi_list))
							    //    layout_video_playback_name(manangerGetFileFullPathName(SysCtrl.avi_list,index,NULL));// reset file name
							}
						    
						}
						else
							goto PLAYBACK_NOFILE;
					}
				}
				else if(value == (KEY_VALUE_MODE|KEY_EVENT_CLICK))// key-mode
				{
					if(state != MEDIA_STAT_PLAY)
					{
						INT32U temp=0;
					#if UI_STYLE == UI_STYLE1	
						if(managerFileCount(SysCtrl.avi_list)<1)
							temp = 0;
						else
						videoPlaybackGetTime(NULL,&temp);
					#else
                        temp = 0;
					#endif
						if(temp<100)
						{
						   task_change_state();
	                       break;
						}
						else
						{
							videoPlaybackStop();
							video_playback_start(index);
						}
					}
				}
				else if(value == (KEY_VALUE_POWER|KEY_EVENT_LONG))  // key-power long : power off
				{
					if(state == MEDIA_STAT_PLAY)
						videoPlaybackStop();
					deg_Printf("long key power off\n");
					task_set_state(MAIN_STAT_POWER_OFF); // power off 
		 			break;
				}
				else if(value == (KEY_VALUE_POWER|KEY_EVENT_CLICK))
				{
					if(state != MEDIA_STAT_PLAY)
					{
						if(SysCtrl.t_screensave)
					       boardIoctrl(SysCtrl.bfd_lcd,IOCTRL_LCD_BKLIGHT,0);   // screen off
					    SysCtrl.t_screensave = 0;
					}
				}
			}
			else if(ret == EVENT_SYS) // system event
			{
				if(value == SYS_EVENT_SDC) // sdc event
				{
					deg_Printf("player : sdc stat ->%d\n",SysCtrl.sdcard);
					if((SysCtrl.sdcard != SDC_STAT_NORMAL)/* && (state == MEDIA_STAT_PLAY)*/) // sdc out when recording
					{
						if(state == MEDIA_STAT_PLAY)
						    videoPlaybackStop();
 				        goto PLAYBACK_NOFILE;
					}
					else
					{
						index = managerFileCount(SysCtrl.avi_list);
						if(index>0)
						{
							layout_video_playback_exitnofile();
							type = video_playback_start(index);							
						}
						else
						{
							goto PLAYBACK_NOFILE;
						}
					}
				}
				else if((value == SYS_EVENT_USB)) // usb event
				{
					deg_Printf("player : usb stat ->%d\n",SysCtrl.usb);
					if(SysCtrl.usb == USB_STAT_PC) // usb out or battery low
					{
						if(state == MEDIA_STAT_PLAY)
						    videoPlaybackStop();
						task_set_state(MAIN_STAT_MASS_USB); 
						break;
					}
				}
				else if(value == SYS_EVENT_BAT)
				{
					/*deg_Printf("player : battery stat ->%d\n",SysCtrl.battery);
					if((SysCtrl.battery == 0))
					{
						if(state == MEDIA_STAT_PLAY)
						   videoPlaybackStop();
					    task_set_state(MAIN_STAT_POWER_OFF); // power off 
						break;
					}*/
					
				}
				else if(value == SYS_EVENT_DEL)
				{
					if(delFlag==0) // if more one file deleted,noe more SYS_EVENT_DEL will be recived 
					{
						while(audioPlaybackGetStatus() == MEDIA_STAT_PLAY);
						delFlag = 1;
						videoPlaybackStop();
	                    
						ret = managerFileCount(SysCtrl.avi_list);
						deg_Printf("player : delete file.file count = %d\n",ret);
						if(ret>0)
						{
							if(index>ret) // play next
								index = ret;
							type = video_playback_start(index);	
						}
						
					}
				}
				else if(value == SYS_EVENT_OFF)
				{
					videoPlaybackStop();
					deg_Printf("player : system power off.\n");
					
					task_set_state(MAIN_STAT_POWER_OFF); // power off 
					break;
				}
				else if(value == SYS_EVENT_ASTERN)
				{
					if(SysCtrl.astern == ASTERN_ON)
					{
						videoPlaybackStop();
						hal_csiEnable(1);
						dispLayerInit(DISP_LAYER_VIDEO); // preview
					    dispLayerSetPIPMode(DISP_PIP_BACK);
					    api_backrec_relinking();
						layout_video_playback_astern(1);
						layout_astern_enter();
						deg_Printf("player : astern on\n");
					}
					else
					{
						dispLayerSetPIPMode(DISP_PIP_DISABLE);
					    dispLayerUninit(DISP_LAYER_VIDEO); // preview
					    hal_csiEnable(0);						
                        deg_Printf("player : astern off\n");
					    index = managerFileCount(SysCtrl.avi_list);
						if(index>0)
						{
							if(index>=SysCtrl.file_index)
								index = SysCtrl.file_index;  // current file
							type = video_playback_start(index);							
						}
						layout_video_playback_astern(0);
                        layout_astern_exit(); //osd off back line
						if(index<=0) 
							goto PLAYBACK_NOFILE;
						
					}
				}
				
			}
		}
		
	    videoPlaybackService();
		layout_video_playback_display();
	}
//END_VIDEOPLAY:
	while(audioPlaybackGetStatus() == MEDIA_STAT_PLAY);  // wait key sound end	
    videoPlaybackUninit();
	layout_video_playback_uninit();
	if(managerFileCount(SysCtrl.avi_list)<1)
		layout_main_update(1);
//	dispLayerInit(DISP_LAYER_OSD0);
//	if(SysCtrl.g_lock)
	{
		SysCtrl.g_lock = 0;
		SysCtrl.f_update |= FLAG_LOK;
	}
	if(SysCtrl.sdcard!=SDC_STAT_NORMAL)
		SysCtrl.f_update |= FLAG_SDC;
	hal_mjpB_ecdown();
    deg_Printf("video playback task exit.\n");
#endif
}





