/****************************************************************************
**
 **                              TASK DEMO
  ** *   **             THE APPOTECH MULTIMEDIA PROCESSOR
   **** **                  TASK VIDEO RECORD DEMO
  *** ***
 **  * **               (C) COPYRIGHT 2016 BUILDWIN 
**      **                         
         **         BuildWin SZ LTD.CO  ; VIDEO PROJECT TEAM
          **   
* File Name   : task_video_record.c
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

char tempFileName1[MANAGER_NAME_LEN+1+8],tempFileName2[MANAGER_NAME_LEN+1+8];  // there are two memories used by different program temparlly.do not mask
extern int task_image_createfile(int channel,char **filename);
//extern void task_image_sdc_full2normal(void);

#if (1 == SOUND_DEC_EN)
//===========sound detect=============
#define NOISE_WINSIZE 256
#define NOISE_THRESHOLD	(1000000+SOUND_DEC_THRESHOLD*500000)

#define NOISE_DETECT_COUNT (2*60*16000/NOISE_WINSIZE)	// 1min count = freq/winsize

#define ABS(a)  (((a) < 0) ? -(a) : (a))
u8 agc_detect_voice_flag;		// 0 : close sound detect , 1: open sound detect


/*******************************************************************************
* Function Name  : AGC_CheckSilence
* Description    : Check audio data biger than noise threshold
* Input          : buf - audio data buf 
*                 len - audio data length
* Output         : None
* Return         : 1-voice 0-noise or silence
*******************************************************************************/
static u32 AGC_CheckSilence(s16 *buf,u32 len)
{
	int i, j, count=0;
    
	for(i=0;i<len;i+=NOISE_WINSIZE)
	{
		count = 0;
		for(j=0;j<NOISE_WINSIZE;j++)
		{
			if((i+j)>=len)
				break;

			count += ABS(*buf);
			buf++;
		}

		//deg_Printf("count=%d\n",count);	//test
		if(count > NOISE_THRESHOLD)
		{
			return 1;
		}
	}

	return 0;
}


/*******************************************************************************
* Function Name  : AGC_DetectVoice
* Description    : Monitor Voice
* Input          : None
* Output         : None
* Return         : 1-deteced
*******************************************************************************/
u32 auadc_detect_voice(void)
{
	u32 ret = 0;
	INT16U value,event;
    if(hal_auadcMemInit()<0)
    {
		deg_Printf("audio record : auadc memroy malloc fail.\n");
		return STATUS_FAIL;
    }
	if(hal_auadcStartForWAV(SAMPLE_RATE_16000,100) < 0)
	{
		deg_Printf("audio record : stream memroy malloc fail.\n");
	}

	while(true)
	{
		INT32U len,addr;
		void *buff;
		INT32S res;
		s32 syncnt,syncnt_next;

		if(0 == agc_detect_voice_flag)		// close voice detect will break;
		{
			ret = 0;
			break;
		}

	    buff = hal_auadcBufferGet(&addr,&len,&syncnt,&syncnt_next);
		if(buff)
		{
			if(AGC_CheckSilence((S16*)addr, len/2) == 1)
			{
				ret = 1;
				//task_set_state(MAIN_STAT_VIDEO_REC);		// detect voice into video
				deg_Printf("detect voice\n");
				break;
			}
			hal_auadcBufferRelease(buff);
			deg_Printf(".");
		}

		if(systemEventService(&value,&event)>0)
		{
			if(event == EVENT_KEY) // key event
			{
				if(value == (KEY_VALUE_AUDIO|KEY_EVENT_CLICK)) //close voice detect
				{
					agc_detect_voice_flag = 0;
				}
				else if(value == (KEY_VALUE_AUDIO|KEY_EVENT_LONG))  // key-power long : power off
				{
					task_set_state(MAIN_STAT_POWER_OFF); // power off 
					break;
				}
			}
		}
	}

	ax32xx_auadcEnable(0);
	hal_auadcMemUninit();
	
	return ret;
}
#endif


/*******************************************************************************
* Function Name  : video_record_callback
* Description    : video record callback function.user should fill the function,video record service will callback
* Input          : 
* Output         : none                                            
* Return         : int fd : file handle
*******************************************************************************/
int video_record_callback(INT32U channel,INT32U cmd,INT32U para)
{
	static INT8U chBfileFlag = 0; //channel B created file flag,for lock file using
	char *name;
    FHANDLE *fdt;
	int fd[2],ret=0,index,rectime;
	INT32U bsize,size;
	static INT32U oldfilesizeA,oldfilesizeB;
	if(channel >= VIDEO_CH_MAX)
	{
		deg_Printf("video : unknow channel.%d\n",channel);
		return -1;
	}
    
	if(cmd == CMD_VIDEO_RECORD_START) // video record start
	{
		rectime = RECORD_VIDEO_TIME;//configValue2Int(CONFIG_ID_LOOPTIME);
		if(rectime == 0)
		{
			size = videoRecordSizePreSec(VIDEO_CH_A,10*60);
			if(backrec_sensor_stat())
				size += videoRecordSizePreSec(VIDEO_CH_B,10*60);
			if(SysCtrl.sd_freesize<size)
			{
				SysCtrl.sdcard = SDC_STAT_FULL;
				SysCtrl.f_update|=FLAG_SDC;
				return -1;
			}
			rectime = 10*60;
		}
		fd[0] = -1;
		if(channel == VIDEO_CH_A)  // video A
		{
		#if RECORD_MODE == RECORD_MODE_AUTO  // create videob folder
             if((SysCtrl.bfolder==0)&&(SysCtrl.usensor!=USENSOR_STAT_NULL))
             {
			 	strcpy(tempFileName1,FILEDIR_VIDEOB);
				tempFileName1[strlen(tempFileName1)-1] = 0;
				f_mkdir((const TCHAR*)tempFileName1);//FILEDIR_VIDEO);
				SysCtrl.bfolder = 1;
				deg_Printf("video : create folder %s\n",tempFileName1);
				tempFileName1[0] = 0;
             }
		#endif	
			oldfilesizeA = 0;
		#if AVI_TYPE_ODML	
			bsize = videoRecordSizePreSec(VIDEO_CH_A,rectime);
		    if(backrec_sensor_stat())//(api_backrec_status())
				bsize += videoRecordSizePreSec(VIDEO_CH_B,rectime);
			//bsize+=(5*1024);  // for take photo
			memset(tempFileName2,0,MANAGER_NAME_LEN+1+8);
			if(bsize>SysCtrl.sd_freesize)
			{
				index = 1;
				name = manangerFindFileAndDel(SysCtrl.avi_list,&index,MA_FILE_AVIA);
				if(name)
				{
					 fd[0] = open(name,FA_WRITE | FA_READ);	
					 if(fd[0]>=0)
					 {
					 	 strcpy(tempFileName2,name);
						 size = fs_size(fd[0])>>10;
						 bsize = videoRecordSizePreSec(VIDEO_CH_A,rectime);
                         if((size<=(bsize+100*1024))&&(size>=bsize))
                         {
						 	oldfilesizeA = bsize = fs_size(fd[0])>>10;
							managerDelFileByIndex(SysCtrl.avi_list,index);
                         }
						 else
						 {
						 	close(fd[0]);
							fd[0] = -1;
							oldfilesizeA = bsize = 0;
						 }
					 }
				}
				if(fd[0]<0)
				{
					oldfilesizeA = bsize = 0;
					//tempFileName2[0] = 0;
					memset(tempFileName2,0,MANAGER_NAME_LEN+1+8);
				}
			}
         #endif   
			name = managerFileNameCreater(SysCtrl.avi_list,SUFFIX_AVI,FILEDIR_VIDEOA); // the static memory is unsafe,maybe used by other programe when video recording
			if(name == NULL)
			{
				SysCtrl.sdcard = SDC_STAT_FULL;
				SysCtrl.f_update|=FLAG_SDC;
				memset(tempFileName1,0,MANAGER_NAME_LEN+1+8);
				//tempFileName1[0] = 0;
				//sysLog("managerFileNameCreater fail");
				return -1;
			}
			strcpy(tempFileName1,name);	

		}
		else if(channel == VIDEO_CH_B)// video B
		{	
			oldfilesizeB = 0;
			if(tempFileName1[0] == 0)
			{
				deg_Printf("video : channel error.%d\n",channel);
				return -1;
			}
			memcpy(tempFileName2,FILEDIR_VIDEOB,strlen(FILEDIR_VIDEOA)); // create B video file
			memcpy(tempFileName1,FILEDIR_VIDEOB,strlen(FILEDIR_VIDEOA)); // create B video file
			//deg_Printf("B:%s\n",tempFileName2);
		#if AVI_TYPE_ODML		
			if(managerCheckLock(&tempFileName2[strlen(FILEDIR_VIDEOA)])!=0)
				fd[0] = -1;
			else
			    fd[0] = open(tempFileName2,FA_WRITE | FA_READ);					
			if(fd[0]>=0) // delete file
			{
				 bsize = videoRecordSizePreSec(VIDEO_CH_B,rectime);
				 size = fs_size(fd[0])>>10;
				 if((size<=(bsize+100*1024))&&(size>=bsize))
				 {
				 	ret = managerDelFileByFullName(SysCtrl.avi_list,tempFileName2);
					oldfilesizeB = bsize = size ;
				 }
				 else
				 {
				 	close(fd[0]);
					fd[0] = -1;
					oldfilesizeB = bsize = 0;
				 }
			}
		#endif	
		}
		
		//SysCtrl.g_lock = 0; // clear g-sensor lock active flag
		//SysCtrl.f_update|=FLAG_LOK;
		
		if(fd[0]<0)
		{
			fd[0] = open(tempFileName1,FA_CREATE_ALWAYS | FA_WRITE | FA_READ);  // FA_CREATE_NEW
			bsize = 0;
		}
		else
		{
			bsize = fs_size(fd[0]);
			close(fd[0]);
			f_rename(tempFileName2,tempFileName1);  // must close before rename 
			fd[0] = open(tempFileName1,FA_WRITE | FA_READ);
			//f_rename(tempFileName2,tempFileName1);
			deg_Printf("using old file:%s.%d b\n",tempFileName2,bsize);
			//sysLog("using old file.");
		}
	 //   fd[0] = open(tempFileName1,FA_WRITE | FA_READ);  // FA_CREATE_NEW
		deg_Printf("video : record start->%s ",tempFileName1);	
		//sysLog(tempFileName1);

		
	#if AVI_TYPE_ODML == 0		    
		if(channel == VIDEO_CH_A)
		{
			fd[1] = open("VIDEOA.TMP",FA_CREATE_ALWAYS | FA_WRITE | FA_READ);  // FA_CREATE_NEW
		}
		else if(channel == VIDEO_CH_B)
		{
			fd[1] = open("VIDEOB.TMP",FA_CREATE_ALWAYS | FA_WRITE | FA_READ);  // FA_CREATE_NEW	
		}
		
	#else
	    fd[1] = fd[0];
	#endif
		if((fd[0]>=0) && (fd[1]>=0)) // success
		{	        
			fdt = (FHANDLE *)para;
			*fdt = (FHANDLE)fd[0];
			*(fdt+1) = (FHANDLE)fd[1];
			deg_Printf("success.\n");
			if(bsize == 0) // try to alloc size
			{
			//----count video file size	
				if(channel == VIDEO_CH_A)
				{
					if (oldfilesizeA)
						size = bsize = oldfilesizeA;
					else 
					size = bsize = videoRecordSizePreSec(VIDEO_CH_A,rectime);
				}
				else 
				{
					if (oldfilesizeB)
						size = oldfilesizeB ;
					else	
					size = videoRecordSizePreSec(VIDEO_CH_B,rectime);
					if (oldfilesizeA)
						bsize = size + oldfilesizeA;
					else
					    bsize = size+videoRecordSizePreSec(VIDEO_CH_A,rectime);
				}
				#if (RECORD_VIDEO_LOOP)
				ret = managerSpaceCheck(SysCtrl.avi_list,FILEDIR_VIDEO,bsize);
				if((ret<0)||((ret<<10)<bsize))
				#else
				ret = managerSpaceCheck(SysCtrl.avi_list,FILEDIR_VIDEO,0);
				bsize=ret<<10;
				deg_Printf("bsize:%d\n",bsize);
				if(ret<0)
				#endif
				{
					deg_Printf("no more space\n");
					//sysLog("no more space");
					SysCtrl.f_update|=FLAG_SDC;
				    SysCtrl.sdcard = SDC_STAT_FULL;
					ret = -1;
					goto VIDEO_RECORD_ERROR_HANDLE;
				}
				if(size>0x3c0000) // 3.8G
				   size = 0x3c0000;
			#if AVI_TYPE_ODML		
			#if FILE_SIZE_PRE_MALLOC
				ret = XOSTimeGet();	
				if(lseek(fd[0],size<<10,0)<0)
				{			
				    deg_Printf("lseek fail.\n");
					ret = -1;
					goto VIDEO_RECORD_ERROR_HANDLE;
				}
				fs_sync(fd[0]);
				ret = XOSTimeGet()-ret;
				if(fs_size(fd[0])<(size<<10))
				{
					debg("fs_size:%d,size:%d\n",fs_size(fd[0]),size<<10);
					deg_Printf("lseek fail.\n");
					ret = -1;
					goto VIDEO_RECORD_ERROR_HANDLE;
				}
				lseek(fd[0],0,0);
				bsize = fs_size(fd[0]);	
				deg_Printf("fs alloc time using : %dms,file size : %dkb,speed = %dkb/ms.\n",ret,bsize>>10,(bsize>>10)/ret);
			#endif
			#endif	
			}
			else
			{
				deamon_fsSizeModify(1,bsize);
			}
		#if AVI_TYPE_ODML	
			#if FILE_SIZE_PRE_MALLOC
				ret = XOSTimeGet();
				if(fs_fastseek_init(fd[0])<0)
				{
					deg_Printf("fs_fastseek_init fail.\n");
					ret = -1;
					goto VIDEO_RECORD_ERROR_HANDLE;
				}
				ret = XOSTimeGet()-ret;
				deg_Printf("fs_fastseek_init time using : %dms.\n",ret);
				if(channel == VIDEO_CH_B)
					chBfileFlag = 2;
				else
					chBfileFlag = 1;
				//	SysCtrl.t_rec = 0;	
				return (bsize>>10);
			#else		
				return bsize;
			#endif

		#else
		    if(channel == VIDEO_CH_A)
			    SysCtrl.t_rec = 0;			
			return (SysCtrl.sd_freesize>>10);
		#endif	
		}
		else //fail
		{			
		    deg_Printf("fail.\n");
			ret = -1;
			goto VIDEO_RECORD_ERROR_HANDLE;
		}
	}
	else if(cmd == CMD_VIDEO_RECORD_STOP)// video record start
	{
		if( channel == VIDEO_CH_A)
		{
			SysCtrl.t_rec = 0;
		}
		//SysCtrl.t_rec = 0;
		fdt = (FHANDLE *)para;
        fd[0] = (int)*fdt;
		fd[1] = (int)*(fdt+1);
		if(SysCtrl.sdcard != SDC_STAT_NORMAL)
			goto VIDEO_RECORD_ERROR_HANDLE;
		bsize = fs_size(fd[0]);
		if(bsize>0)
			deamon_fsSizeModify(-1,bsize);
		bsize>>=10;
		deg_Printf("video : fs size = %dG%dM%dKB\n",bsize>>20,(bsize>>10)&0x3ff,(bsize)&0x3ff);
		close((FHANDLE)fd[0]);
	#if AVI_TYPE_ODML == 0		
		close((FHANDLE)fd[1]);
	#endif
		name = tempFileName1;		    
		if(SysCtrl.g_lock)// video A
		{	
			managerUnlockFile(name);  // maybe file name is locked when the second callback
			strcpy(tempFileName2,tempFileName1);  // backup file name
			managerLockFile(tempFileName1); // rename in resource manager list
			if(channel == VIDEO_CH_A)
			{
				memcpy(tempFileName2,FILEDIR_VIDEOA,strlen(FILEDIR_VIDEOA));
				memcpy(tempFileName1,FILEDIR_VIDEOA,strlen(FILEDIR_VIDEOA));						
			}
			else if(channel == VIDEO_CH_B)
			{
				memcpy(tempFileName2,FILEDIR_VIDEOB,strlen(FILEDIR_VIDEOB));
				memcpy(tempFileName1,FILEDIR_VIDEOB,strlen(FILEDIR_VIDEOB));
			}
			
			f_rename(tempFileName2,tempFileName1);  // rename in file system
			//deg_Printf("video : rename  .%s->%s\n",tempFileName2,tempFileName1);
			//deg_Printf("video : lock this file.\n");
		}
		name = &tempFileName1[strlen(FILEDIR_VIDEOA)];
		deg_Printf("video : stop ");
		if(channel == VIDEO_CH_A)
		{
			oldfilesizeA = 0;
			ret = managerAddFile(SysCtrl.avi_list,FILEDIR_VIDEOA,name);	// add video a
			deg_Printf("%s%s\n",FILEDIR_VIDEOA,name);
			/*if(chBfileFlag==0)
			{
				SysCtrl.g_lock = 0; // clear g-sensor lock active flag
		        SysCtrl.f_update|=FLAG_LOK;
			}*/
		}
		else if(channel == VIDEO_CH_B)
		{
			//chBfileFlag = 0;
			ret = managerAddFile(SysCtrl.avi_list,FILEDIR_VIDEOB,name);	// add video b
			deg_Printf("%s%s\n",FILEDIR_VIDEOB,name);
			//SysCtrl.g_lock = 0; // clear g-sensor lock active flag
		    //SysCtrl.f_update|=FLAG_LOK;
		}
		if(chBfileFlag)
		{
			chBfileFlag--;
			if(chBfileFlag==0)
			{
				SysCtrl.g_lock = 0; // clear g-sensor lock active flag
		        SysCtrl.f_update|=FLAG_LOK;
			}
		}
		task_video_record_caltime();
		deg_Printf("video : fs free size = %dG%dM%dKB\n",SysCtrl.sd_freesize>>20,(SysCtrl.sd_freesize>>10)&0x3ff,(SysCtrl.sd_freesize)&0x3ff);
		return 0;
	}
	else if(cmd == CMD_COM_ERROR)// video record error
	{
		chBfileFlag = 0;
		SysCtrl.g_lock = 0; // clear g-sensor lock active flag
		SysCtrl.f_update|=FLAG_LOK;
		//if(para == CMD_VIDEO_RECORD_START) // start fail
		{
			fdt = (FHANDLE *)para;
			fd[0] = (int)*fdt;
			fd[1] = (int)*(fdt+1);
			ret = 0;
			SysCtrl.g_lock = 0; // clear g-sensor lock active flag
			if(hal_sdGetCardState()==SDC_STATE_ERROR)
			{
				SysCtrl.f_update|=FLAG_LOK|FLAG_SDC;
				SysCtrl.sdcard = SDC_STAT_ERROR;
				deg_Printf("video : error\n");
			}
			else if(channel == VIDEO_CH_A)
			{
				XMsgQPost(SysCtrl.sysQ,(void *)(SYS_EVENT_ON|EVENT_SYS));  // restart
				deg_Printf("video : send event on\n");
			}
			deg_Printf("video : error fs size %d\n",fs_size(fd[0]));
			deg_Printf("video : fs before size = %dG%dM%dKB\n",SysCtrl.sd_freesize>>20,(SysCtrl.sd_freesize>>10)&0x3ff,(SysCtrl.sd_freesize)&0x3ff);
			bsize = fs_size(fd[0]);
			if(close((FHANDLE)fd[0]) < 0)
				bsize = 0 ;
			if(bsize>0){
		#if AVI_TYPE_ODML
				name = tempFileName1;		    
				name = &tempFileName1[strlen(FILEDIR_VIDEOA)];
				if(channel == VIDEO_CH_A)
				{
					ret = managerAddFile(SysCtrl.avi_list,FILEDIR_VIDEOA,name);	// add video a
					deg_Printf("%s%s\n",FILEDIR_VIDEOA,name);
				}
				else if(channel == VIDEO_CH_B)
				{
					ret = managerAddFile(SysCtrl.avi_list,FILEDIR_VIDEOB,name);	// add video b
					deg_Printf("%s%s\n",FILEDIR_VIDEOB,name);
				}
		#endif
			}
			//close((FHANDLE)fd[0]);
		#if AVI_TYPE_ODML == 0		
			close((FHANDLE)fd[1]);
		    goto VIDEO_RECORD_ERROR_HANDLE;
		#else
		    deamon_fsSizeModify(-1,bsize);	
		#endif
		    return -1;
		}
	}
	else if(cmd == CMD_COM_CHECK) // check sdc sapce
	{
		if(para==0)
		{
			ret = videoRecordSizePreSec(VIDEO_CH_A,RECORD_VIDEO_TIME);
			
			para = ret;
		}
		ret = managerSpaceCheck(SysCtrl.avi_list,FILEDIR_VIDEO,para);//REMAIN_SAPCE_VIDEO);
		if(ret<0)
		{
			SysCtrl.sdcard = SDC_STAT_FULL;
			SysCtrl.f_update|=FLAG_SDC;
		}
		return ret;
	}

	return 0;

VIDEO_RECORD_ERROR_HANDLE:	
	deg_Printf("video : error.delete current file\n");
	close((FHANDLE)fd[0]);
#if AVI_TYPE_ODML == 0	
	close((FHANDLE)fd[1]);
#endif
    if(channel == VIDEO_CH_A)
    {
		memcpy(tempFileName1,FILEDIR_VIDEOA,strlen(FILEDIR_VIDEOA));
    }
	else if(channel == VIDEO_CH_B)
	{
		memcpy(tempFileName1,FILEDIR_VIDEOB,strlen(FILEDIR_VIDEOB));
	}
    f_unlink(tempFileName1);  
#if AVI_TYPE_ODML == 0  
    if(channel == VIDEO_CH_A)
		f_unlink("VIDEOA.TMP");
	if(channel == VIDEO_CH_B)
	    f_unlink("VIDEOB.TMP");

#endif
	task_video_record_caltime();
	return ret;
}
/*******************************************************************************
* Function Name  : video_record_start
* Description    : video record start
* Input          : 
* Output         : none                                            
* Return         : int fd : file handle
*******************************************************************************/
static int video_record_start(void)
{	
	int ret;
    
	if(SysCtrl.sdcard!=SDC_STAT_NORMAL)
	{
		SysCtrl.f_update|=FLAG_SDC;
		return -1;
	}
	SysCtrl.t_rec = 0;

    ret = videoRecordStart();

//	deg_Printf("video record start.%d\n",ret);	
	
	return ret;
}
/*******************************************************************************
* Function Name  : task_record_stop
* Description    : video record stop
* Input          : int fd : file handle
* Output         : none                                            
* Return         : 
*******************************************************************************/
static int task_record_stop(void)
{
	int ret;

	ret = videoRecordStop();
	SysCtrl.t_rec = 0;
	SysCtrl.g_lock = 0; // clear g-sensor lock active flag
	SysCtrl.f_update|=FLAG_LOK;
//	deg_Printf("video record stop.%d\n",ret);

	return ret;
}
/*******************************************************************************
* Function Name  : task_video_record
* Description    : video record task
* Input          : void *para : for task initial use
* Output         : none                                            
* Return         : 
*******************************************************************************/
void task_video_record(void *para)
{
	VIDEO_ARG_T arg;
	INT16U value,event;
	INT32S ret,recstat,onstart=0,mdtime=0,mdmtime=0,rtcfd = -1,photoFd=-1;
    char *photoname,curstat;
	
	deg_Printf("video record task enter.\n");
    //sysLog("video record task enter.");
	task_get_state(NULL,(INT8U *)&curstat);
	arg.quality = JPEG_Q_40;
	arg.fps = 30;
	arg.timestramp = TIME_WATERMASK;
	#if (1 == RECORD_VIDEO_MUTE)
	arg.audio = 0;//configValue2Int(CONFIG_ID_AUDIOREC);
	#else
	arg.audio = 1;
	#endif
	arg.rectime = RECORD_VIDEO_TIME;//configValue2Int(CONFIG_ID_LOOPTIME);
	if(arg.rectime==0)
	{
		arg.rectime = 24*60*60;
		arg.looprecord = 0;
	}
	else
		arg.looprecord = 1;
	ret = VIDEO_SIZE;//configValue2Int(CONFIG_ID_RESOLUTION);
	arg.resolution.width = ret>>16;
	arg.resolution.height = ret&0xffff;	
    arg.callback = video_record_callback;
//	arg.fastwr = FILE_FAST_WRITE;
	arg.ftype = AVI_TYPE_ODML;
	arg.syncwr = FILE_SYNC_WRITE;
	
    videoRecordInit(&arg);	
#if USENSOR_AUDIO_ON == 0
	if (arg.audio)
		arg.audio = 0;
#endif
#if USENSOR_RESOLUTION == 1
	arg.resolution.width = 640;
	arg.resolution.height = 480;
#elif USENSOR_RESOLUTION == 2
	arg.resolution.width = 1280;
	arg.resolution.height = 720;
#elif USENSOR_RESOLUTION == 3
	arg.resolution.width = 1280;
	arg.resolution.height = 960;
#else
	arg.resolution.width = 640;
	arg.resolution.height = 480;
#endif

	//videoRecordInitB(&arg);	
	task_video_record_caltime(); // re-cal
	

	if(!api_backrec_status())
	{
	}
	else
		api_backrec_relinking();

    if(SysCtrl.usb == USB_STAT_PC)
		goto TASK_VIDEO_REC_END;


	while(1)
	{	
		ret = systemEventService(&value,&event);
		if (videoRecordTakePhotoStatus() == MEDIA_STAT_ERROR)
		{
			if ( SysCtrl.sdcard == SDC_STAT_FULL )
			{
				SysCtrl.sdcard = SDC_STAT_NORMAL;
				SysCtrl.f_update|=FLAG_SDC;
				videoRecordSetPhotoStatus(MEDIA_STAT_STOP);
			}
		}
		if(ret>0)
		{
			recstat = videoRecordGetStatus();
			if(event == EVENT_KEY) // key event
			{
#if (BOARD_TYPE_MINIDV == SYSTEM_BOARD)
				if(value == (KEY_VALUE_DV|KEY_EVENT_LONGUP))   // key DV LONG UP
				{
					if(videoRecordGetStatus() == MEDIA_STAT_START)
					{
						task_record_stop();
						SENSOR_PWDN_OFF();
					}
					else if(SysCtrl.sdcard == SDC_STAT_NORMAL)
					{
						SENSOR_PWDN_ON();
						XOSTimeDly(5);
						video_record_start();
					}
				}
				else if(value == (KEY_VALUE_DV|KEY_EVENT_CLICK)) // key DC short
				{
					if(recstat == MEDIA_STAT_START)
					{
						task_record_stop();
						SENSOR_PWDN_OFF();
					}
					else
					{
						task_set_state(MAIN_STAT_PHOTO_ENC); 
						XMsgQPost(SysCtrl.sysQ,(void *)(EVENT_KEY|((KEY_VALUE_DV|KEY_EVENT_UP)<<8)));
						XMsgQPost(SysCtrl.sysQ,(void *)(EVENT_KEY|(value<<8)));
					}
					break;
				}
				else if(value == (KEY_VALUE_AUDIO|KEY_EVENT_CLICK)) // key-audio
				{
					#if (1 == SOUND_DEC_EN)
						if(0 == agc_detect_voice_flag)
						{
							if(videoRecordGetStatus() == MEDIA_STAT_START)
							{
								task_record_stop();
								SENSOR_PWDN_OFF();
							}
							agc_detect_voice_flag = 1;
							deg_Printf("open voice detect.\n");
						}
					#else
						if(recstat == MEDIA_STAT_START)
							task_record_stop();
						task_set_state(MAIN_STAT_AUDIO_REC);
						XMsgQPost(SysCtrl.sysQ,(void *)(EVENT_KEY|((KEY_VALUE_AUDIO|KEY_EVENT_UP)<<8)));
						XMsgQPost(SysCtrl.sysQ,(void *)(EVENT_KEY|(value<<8)));
						break;
					#endif
				}
				else if(value == (KEY_VALUE_AUDIO|KEY_EVENT_LONG))  // key-power long : power off
				{
					if(recstat == MEDIA_STAT_START)
						task_record_stop();
					task_set_state(MAIN_STAT_POWER_OFF); // power off 
					break;
				}
#else
				if(value == (KEY_VALUE_DV|KEY_EVENT_CLICK))   //  DV 
				{
					if(videoRecordGetStatus() == MEDIA_STAT_START)
					{
						task_record_stop();
						SENSOR_PWDN_OFF();
					}
					else if(SysCtrl.sdcard == SDC_STAT_NORMAL)
					{
						SENSOR_PWDN_ON();
						XOSTimeDly(5);
						video_record_start();
					}
				}
				else if(value == (KEY_VALUE_DC|KEY_EVENT_CLICK))  // DC
				{
					if(videoRecordGetStatus() == MEDIA_STAT_START)
					{
						task_record_stop();
						SENSOR_PWDN_OFF();
					}
					XMsgQPost(SysCtrl.sysQ,(void *)(EVENT_KEY|((KEY_VALUE_DC|KEY_EVENT_UP)<<8)));
					XMsgQPost(SysCtrl.sysQ,(void *)(EVENT_KEY|(value<<8)));
				}

#endif
			}
			else if(event == EVENT_SYS) // system event
			{
				if(value == SYS_EVENT_SDC) // sdc event
				{
					if(SysCtrl.sdcard != SDC_STAT_NORMAL && recstat == MEDIA_STAT_START) // sdc out when recording
					{
						task_record_stop();
						SENSOR_PWDN_OFF();
					}
					deg_Printf("recorder : sdc stat ->%d\n",SysCtrl.sdcard);
				}
				else if((value == SYS_EVENT_USB)) // usb event
				{
					deg_Printf("recorder : usb stat ->%d\n",SysCtrl.usb);
					if(SysCtrl.usb == USB_STAT_PC) // usb out or battery low
					{
						if(recstat == MEDIA_STAT_START)
						    task_record_stop();
						task_set_state(MAIN_STAT_MASS_USB); 
						//videoRecordUninit();
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
					if(recstat == MEDIA_STAT_START)
						task_record_stop();
					#if (BOARD_TYPE_MINIDV == SYSTEM_BOARD)
					task_set_state(MAIN_STAT_POWER_OFF); // power off 
					#endif
					break;
				}
				else if(value == SYS_EVENT_MD)
				{
					deg_Printf("SYS_EVENT_MD\n");
					if(recstat != MEDIA_STAT_START)
					{
						  SENSOR_PWDN_ON();
						  XOSTimeDly(5);
						  video_record_start();
					}
					if(videoRecordGetStatus()==MEDIA_STAT_START)
						mdtime = XOSTimeGet();

				}
				else if(value == SYS_EVENT_USENSOR)
				{
					if(SysCtrl.usensorshow == USENSOR_SHOW_ON)
					{
						#if RECORD_MODE == RECORD_MODE_AUTO  // create videob folder
				             if((SysCtrl.bfolder==0)&&(videoRecordGetStatus() != MEDIA_STAT_START))
				             {
							 	strcpy(tempFileName1,FILEDIR_VIDEOB);
								tempFileName1[strlen(tempFileName1)-1] = 0;
								f_mkdir((const TCHAR*)tempFileName1);//FILEDIR_VIDEO);
								SysCtrl.bfolder = 1;
								deg_Printf("video : create folder %s\n",tempFileName1);
								tempFileName1[0] = 0;
				             }
						#endif
					}
					else
					{
						SysCtrl.astern = ASTERN_OFF;			// usensor out clean adtern stat
						api_astern_set_status(false);
					}
				}
			}
			
		}
        if(photoFd>=0)
        {
			if(videoRecordTakePhotoStatus() == MEDIA_STAT_STOP)
			{
				deamon_fsSizeModify(-1,fs_size(photoFd));
		        close(photoFd);
		        managerAddFile(SysCtrl.jpg_list,FILEDIR_PHOTO,&photoname[strlen(FILEDIR_PHOTO)]);
				photoFd = -1;
				deg_Printf("recorder : take photo stop.\n");
			}
        }

		if(mdtime)
		{
			if((mdtime+MOTION_DEC_TIME*1000)<=XOSTimeGet())
			{
				task_record_stop();
				SENSOR_PWDN_OFF();
				mdtime = 0;
			}
		}

#if(1 == SOUND_DEC_EN)
		if(agc_detect_voice_flag)
		{
			if(videoRecordGetStatus() == MEDIA_STAT_STOP)
			{
				if(1 == auadc_detect_voice())	// audio detect
				{
					SENSOR_PWDN_ON();
					XOSTimeDly(50);
					video_record_start();
				}
			}
		}
#endif
		
		f_unlink_ext_service(); // fs service
		videoRecordService(); // record service
		//videoRecordServiceB();  // record B service
	}
TASK_VIDEO_REC_END:	
	
	while(f_unlink_ext_service());

	if(SysCtrl.sdcard == SDC_STAT_FULL)
	{
		SysCtrl.sdcard = SDC_STAT_NORMAL;
		SysCtrl.f_update|=FLAG_SDC;
	}

	deg_Printf("video record task exit.\n");
}

void task_video_record_caltime(void)
{
	INT32U size1,size2;

	
	size1 = videoRecordSizePreSec(VIDEO_CH_A,1);
	
	size2 = SysCtrl.sd_freesize;

    deg_Printf("rec time : %dkb/s,%dkb\n",size1,size2);
	SysCtrl.t_remain = size2/size1;
}

