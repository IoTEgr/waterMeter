/****************************************************************************
**
 **                              TASK DEMO
  ** *   **             THE APPOTECH MULTIMEDIA PROCESSOR
   **** **                  TASK PHOTO DEMO
  *** ***
 **  * **               (C) COPYRIGHT 2016 BUILDWIN 
**      **                         
         **         BuildWin SZ LTD.CO  ; VIDEO PROJECT TEAM
          **   
* File Name   : task_image_encode.c
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

#include "../multimedia/uartcom/uartcom.h"

static u8 take_image_flag = 0;	// 0: take image finish , 1 :taking image

void task_image_set_take_flag(u8 flag)
{
	take_image_flag = flag;
}

u8 task_image_get_take_flag()
{
	return take_image_flag;
}


static void task_image_arg(INT16U *width,INT16U *height,INT8U *timestramp)
{
// time stramp	
	*timestramp = TIME_WATERMASK;//configValue2Int(CONFIG_ID_TIMESTAMP);
// resolution	
    INT32U value = PHOTO_SIZE;//configValue2Int(CONFIG_ID_PRESLUTION);
    *width = value>>16;
	*height = value&0xffff;
	deg_Printf("take photo : [%d:%d]\n",*width,*height);
} 
int task_image_createfile(int channel,char **filename)
{
	int fHandle,ret;
	char *name;

	if(SysCtrl.sdcard!=SDC_STAT_NORMAL)
	{
		SysCtrl.f_update|=FLAG_SDC;
		return -1;
	}

	if(managerSpaceCheck(SysCtrl.jpg_list,FILEDIR_PHOTO,0)<0)// check space
	{
		SysCtrl.sdcard = SDC_STAT_FULL;
		SysCtrl.f_update|=FLAG_SDC;
		return -2;
	}
	
//---------creater file name
	name = managerFileNameCreater(SysCtrl.jpg_list,SUFFIX_JPG,FILEDIR_PHOTO);
	if(name==NULL)
	{
		deg_Printf("photo : create file name fail.\n");
		if(managerFileCount(SysCtrl.jpg_list)>=MANAGER_LIST_MAX)
		{
			//SysCtrl.sdcard = SDC_STAT_FULL;
			//SysCtrl.f_update|=FLAG_SDC;
			imageEncodeSetStatus(MEDIA_STAT_FILE_FULL);
			deg_Printf("photo : create file MAX.\n");
		}
		return -2;
	}
//---------open file from file system
    hal_sdLock();
	fHandle = open(name,FA_CREATE_NEW | FA_WRITE | FA_READ);
	if(fHandle<0)
	{
		deg_Printf("photo : open file fail.%s\n",name);
		
		ret =  -3;
	}
    if(filename)
		*filename = name;
	return fHandle;
}
/*void task_image_sdc_full2normal(void)
{
	SysCtrl.sdcard = SDC_STAT_NORMAL;
	SysCtrl.f_update|=FLAG_SDC;
}
 */
/*******************************************************************************
* Function Name  : image_take_photo
* Description    : take a photo by user config
* Input          : none
* Output         : none                                            
* Return         : int <0 fail
*******************************************************************************/
static int image_take_photo(void)
{
	char *name;
	int fHandle;
	int ret=-1,flag;
	INT16U width,height;
	INT8U timestramp;
	u16 q;
	task_image_arg(&width,&height,&timestramp);
	if(width > 3200)
	{
		q = JPEG_Q_42;
	}
	else if(width > 2560)
	{
		q = JPEG_Q_50;
	}
	else
	{
		q = JPEG_Q_75;
	}

#if USENSOR_RESOLUTION == 1
	hal_watermarkBPos_Adjust(480);
#elif USENSOR_RESOLUTION == 2
	hal_watermarkBPos_Adjust(720);
#elif USENSOR_RESOLUTION == 3
	hal_watermarkBPos_Adjust(960);
#else
	hal_watermarkBPos_Adjust(480);
#endif
	flag = 0;
//-------------channel A

    fHandle = task_image_createfile(VIDEO_CH_A,&name);
	if(fHandle<0)
		goto TAKE_PHOTO_END;

	deg_Printf("take photoA : [%d:%d],%d\n",width,height,timestramp);
	if(timestramp)
	{
		if(mediaVideoCtrl.tinfo<0)
		{
			mediaVideoCtrl.tinfo = hal_watermarkOpen();
		}
		deg_Printf("take photoA : mediaVideoCtrl.tinfo=%d\n",mediaVideoCtrl.tinfo);
	}

	ret = imageEncodeStart((FHANDLE)fHandle,width,height,/*q*/JPEG_Q_75,timestramp);
	if(ret<0)
	{
		deg_Printf("photo : take photo fail.<%d>\n",ret);
		close((FHANDLE)fHandle);
		f_unlink(name);
		ret =  -3;
		goto TAKE_PHOTO_END;
	}
	
//===handle exif===
#if   (1 == JPEG_EXIF)
	int res;
	u8 *temp_ptr = (u32)hal_sysMemMalloc(fs_size(fHandle),32);
	if(NULL == temp_ptr)
	{
		deg_Printf("image encode : exif handle mem err.\n");
	}
	else
	{
		//memset(temp_ptr,0,fs_size(fHandle)+512);
		res = lseek(fHandle,0x14,0);
		res = read(fHandle,(void *)temp_ptr,fs_size(fHandle)-0x14); 
		u8 *head_ptr = (u32)hal_sysMemMalloc(0x2e8,32);
		if(NULL!=head_ptr)
		{
			u8 datatime[20];
			DATE_TIME_T *rtcTime = hal_rtcTimeGet();
			datatime[0] = (rtcTime->year/1000)%10 +'0';
			datatime[1] = (rtcTime->year/100)%10 +'0';
			datatime[2] = (rtcTime->year/10)%10 +'0';
			datatime[3] = (rtcTime->year)%10 +'0';
			datatime[4] = ':';
			datatime[5] = (rtcTime->month/10)%10 +'0';
			datatime[6] = (rtcTime->month)%10 +'0';
			datatime[7] = ':';
			datatime[8] = (rtcTime->day/10)%10 +'0';
			datatime[9] = (rtcTime->day)%10 +'0';
			datatime[10] = ' ';
			datatime[11] = (rtcTime->hour/10)%10 +'0';
			datatime[12] = (rtcTime->hour)%10 +'0';
			datatime[13] = ':';
			datatime[14] = (rtcTime->min/10)%10 +'0';
			datatime[15] = (rtcTime->min)%10 +'0';
			datatime[16] = ':';
			datatime[17] = (rtcTime->sec/10)%10 +'0';
			datatime[18] = (rtcTime->sec)%10 +'0';
			datatime[19] = 0;
			memset(head_ptr,0,0x2e8);
			res = jpeg_exif_head_init(head_ptr,width,height,datatime);
			head_ptr[0x2e6] = 0xff;
			head_ptr[0x2e7] = 0xD9;
			res = lseek(fHandle,0,0);
			res = write(fHandle,(void *)head_ptr,0x2e8);
			res = write(fHandle,(void *)temp_ptr,fs_size(fHandle)-0x14);
			hal_sysMemFree(head_ptr);
		}
		hal_sysMemFree(temp_ptr);
		deg_Printf("image encode : exif handle filesize 0x%x.\n",fs_size(fHandle));
	}

#endif
//===end handle exif===
	
	deamon_fsSizeModify(-1,fs_size(fHandle));
	close(fHandle);
	managerAddFile(SysCtrl.jpg_list,FILEDIR_PHOTO,&name[strlen(FILEDIR_PHOTO)]);
	deg_Printf("photoA : take photo ok.<%s>\n",name);
	flag|=1;
/*
//--------channel B
    if(!api_backrec_status())
		goto TAKE_PHOTO_END;
	
	if(TAKE_PHOTO_MODE)
	{
	    fHandle = task_image_createfile(VIDEO_CH_B,&name);
		if(fHandle<0)
			goto TAKE_PHOTO_END;
	#if USENSOR_RESOLUTION == 1
		width = 640;
		height = 480;
	#elif USENSOR_RESOLUTION == 2
		width = 1280;
		height = 720;
	#elif USENSOR_RESOLUTION == 3
		width = 1280;
		height = 960;
	#else
		width = 640;
		height = 480;
	#endif
		deg_Printf("take photoB : [%d:%d]\n",width,height);
		ret=imageEncodeStartB((FHANDLE)fHandle,width,height,JPEG_Q_75,timestramp);
		if(ret<0)
		{
			deg_Printf("photo : take photo fail.<%d>\n",ret);
			close((FHANDLE)fHandle);
			f_unlink(name);
			ret =  -3;
			goto TAKE_PHOTO_END;
		}
	//-------close file & add to file list
	    deamon_fsSizeModify(-1,fs_size(fHandle));
		close((FHANDLE)fHandle);
		managerAddFile(SysCtrl.jpg_list,FILEDIR_PHOTO,&name[strlen(FILEDIR_PHOTO)]);
		deg_Printf("photoB : take photo ok.<%s>\n",name);
		flag|=2;
	}
*/
    hal_sdStop();	
    ret = 0;
TAKE_PHOTO_END:
	hal_sdUnlock();
    if(flag)
		return 0;
	else
		return -1;
//	return ret;	
}
/*******************************************************************************
* Function Name  : task_image_encode
* Description    : image encode task
* Input          : void *para : for task initial use
* Output         : none                                            
* Return         : 
*******************************************************************************/

u8 send_pack_cnt=1;
void task_image_encode(void *para)
{
	INT16U value,event;
	INT32S ret;

    deg_Printf("image encode task enter.\n");
    imageEncodeInit();
	SENSOR_PWDN_ON();
	XOSTimeDly(50);
	btcomInit();

	boardIoctrl(SysCtrl.bfd_ir,IOCTRL_IR_SET,0);
	XMsgQPost(SysCtrl.sysQ,(void *)(EVENT_KEY|(KEY_VALUE_GATHER<<8)));

	//boardIoctrl(SysCtrl.bfd_ir,IOCTRL_IR_SET,1);
	
	while(1)
	{
		event = 0;
		ret = systemEventService(&value,&event);
		if(ret>0)
		{
			if(event == EVENT_KEY)
			{
				if(value == (KEY_VALUE_DV|KEY_EVENT_CLICK)) // key-dV
				{
				#if 1
					boardIoctrl(SysCtrl.bfd_ir,IOCTRL_IR_SET,1);
					XOSTimeDly(1000);
					ret = image_take_photo();
					if(ret < 0)
					{
						deg_Printf("take photo %d\n",ret);
					}
					boardIoctrl(SysCtrl.bfd_ir,IOCTRL_IR_SET,0);

					//deg_Printf("--------send_pack_cnt=%d-------------.\n",send_pack_cnt);
					//send_pack(send_pack_cnt++);
				#else
					LED_RED_ON();
					SENSOR_PWDN_ON();
					XOSTimeDly(100);
					ret =GetimageEncodebuf();
					SENSOR_PWDN_OFF();
					if(ret == 0)
					{
						sned_1pack();
					}
				#endif

				}
				else if(value == KEY_VALUE_GATHER ) 
				{
					//SENSOR_PWDN_ON();
					boardIoctrl(SysCtrl.bfd_ir,IOCTRL_IR_SET,1);
					XOSTimeDly(1000);
					ret =GetimageEncodebuf();
					//SENSOR_PWDN_OFF();
					boardIoctrl(SysCtrl.bfd_ir,IOCTRL_IR_SET,0);
					if(ret == 0)
					{
						send_1pack();
						send_pack_cnt++;
						//send_Allpack();
						
					}
					else
					{
						deg_Printf("gather fail.\n");
						btcomCmdFail();
					}
				}
				else if(value == KEY_VALUE_SEND ) 
				{
			
				}
				/*else if(value == (KEY_VALUE_DV|KEY_EVENT_LONGUP)) // key-dv long up
				{
					task_set_state(MAIN_STAT_VIDEO_REC);
					XMsgQPost(SysCtrl.sysQ,(void *)(EVENT_KEY|((KEY_VALUE_DV|KEY_EVENT_UP)<<8)));
					XMsgQPost(SysCtrl.sysQ,(void *)(EVENT_KEY|(value<<8)));
					break;
				}
				else if(value == (KEY_VALUE_AUDIO|KEY_EVENT_CLICK)) // key-audio
				{
					task_set_state(MAIN_STAT_AUDIO_REC);
					XMsgQPost(SysCtrl.sysQ,(void *)(EVENT_KEY|((KEY_VALUE_AUDIO|KEY_EVENT_UP)<<8)));
					XMsgQPost(SysCtrl.sysQ,(void *)(EVENT_KEY|(value<<8)));
					break;
				}
				else if(value == (KEY_VALUE_AUDIO|KEY_EVENT_LONG))	// key-power long : power off
				{
					task_set_state(MAIN_STAT_POWER_OFF); // power off 
					break;
				}*/


			}
			else if(event == EVENT_SYS)
			{
				if(value == SYS_EVENT_SDC) // sdc event
				{
					deg_Printf("camare : sdc stat ->%d\n",SysCtrl.sdcard);
				}
				else if((value == SYS_EVENT_USB)) // usb event
				{
					deg_Printf("camare : usb stat ->%d\n",SysCtrl.usb);
					if(SysCtrl.usb == USB_STAT_PC) // usb out or battery low
					{
						task_set_state(MAIN_STAT_MASS_USB); 
						break;
					}
				}
				else if(value == SYS_EVENT_BAT)
				{
					/*deg_Printf("camare : battery stat ->%d\n",SysCtrl.battery);
					if(SysCtrl.battery == 0)
					{
					    task_set_state(MAIN_STAT_POWER_OFF); // power off 
						break;
					}*/
				}
				if(value == SYS_EVENT_OFF)
				{
					#if (BOARD_TYPE_MINIDV == SYSTEM_BOARD)
						deg_Printf("task image : system power off.\n");
						task_set_state(MAIN_STAT_POWER_OFF); // power off 
					#endif
					break;
				}
				else if(event == SYS_EVENT_MD)
				{

				}
				else if(value == SYS_EVENT_USENSOR)
				{
					if(SysCtrl.usensorshow == USENSOR_SHOW_ON)
					{
					#if RECORD_MODE == RECORD_MODE_AUTO  // create videob folder
			             if((SysCtrl.bfolder==0))
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

        f_unlink_ext_service();

		btcomService();
	}

    while(f_unlink_ext_service());
	imageEncodeUninit();
	videoRecordUninit();
	if(SysCtrl.sdcard == SDC_STAT_FULL)
	{
		SysCtrl.sdcard = SDC_STAT_NORMAL;
		SysCtrl.f_update|=FLAG_SDC;
	}

	deg_Printf("image encode task exit.\n");
}


bool cut_sdr_data_en = 0;
u32 cut_sdr_data_addr = 0;


#if _DEBG_CUT_SDR_DATA_
typedef struct 
{
	void * sdr_data_buff;
	u32 len;
}SDR_DATA_MSG;
SDR_DATA_MSG sdr_data;
/*******************************************************************************
* Function Name  : sdram_data_capture_cfg
* Description    : config for capture sdram_data
* Input          : void *sdr_data_buff
* Output         : None
* Return         : None
*******************************************************************************/
void sdram_data_capture_cfg(void *sdr_data_buff)
{
	//dvp
	void hal_Cut_SDR_SrcCSI(void *sdr_buf,bool csi_save);
#if (_DEBG_CUT_SDR_DATA_&0xf0) == _DEBG_CUT_BEFOR_CSI_
	hal_Cut_SDR_SrcCSI(sdr_data_buff,1);
#elif _DEBG_CUT_SDR_DATA_ == _DEBG_CUT_POST_YUV_
	hal_Cut_SDR_SrcCSI(sdr_data_buff,0);
#endif
}
/*******************************************************************************
* Function Name  : sdram_data_capture_task
* Description    : capture sdram data 
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void sdram_data_capture_task(u8 *fname)
{
	//capture rawdata
	_Sensor_Adpt_ *senradpt = hal_csiAdptGet();
	
#if _DEBG_CUT_SDR_DATA_ == _DEBG_CUT_CSI_RAW_
	debg("capture rawdata start\n");
	char filename[18] = "DEBG/RAWD0000.raw";
	sdr_data.len = senradpt->pixelw * senradpt->pixelh * 2;
	sdr_data.sdr_data_buff = hal_sysMemMalloc(senradpt->pixelh*senradpt->pixelw*2,64);
#elif _DEBG_CUT_SDR_DATA_ == _DEBG_CUT_CSI_YUV_
	debg("capture csi yuv422 data start\n");
	char filename[18] = "DEBG/YUV80000.raw";
	sdr_data.len = senradpt->pixelw * senradpt->pixelh * 2;
#else
	debg("capture post yuv420 data start\n");
	char filename[18] = "DEBG/YUV60000.yuv";
	sdr_data.len = senradpt->pixelw * senradpt->pixelh * 3 / 2;
	#if _DEBG_CUT_SDR_DATA_  ==  _DEBG_CUT_POST_YUV_INAVI_    
		sdr_data.sdr_data_buff = (void * )cut_sdr_data_addr;
	#elif _DEBG_CUT_SDR_DATA_  ==  _DEBG_CUT_POST_YUV_LCD_
		sdr_data.sdr_data_buff = (void * )cut_sdr_data_addr;
		sdr_data.len = 480*272*3/2;
	#endif
#endif
	if(sdr_data.sdr_data_buff ==NULL){
		debg("sdr_data_buff  apply fail \n");
		return;
	}
	sdram_data_capture_cfg(sdr_data.sdr_data_buff);
	//msg deal
	FIL Fil;
	FRESULT ret = f_mkdir("DEBG\0");
	if(ret != FR_OK){	
		if(ret != FR_EXIST){
			debg("DEBG mkdir err\n");
			return;
		}
	}
	u32 filenum ,loop = 1;
	debg("CSIMODE:%x CSIPMODE2:%x CSI_DMA_MODE:%x ",CSIMODE,ISPMODE,CSI_DMA_MODE);
	while(loop){
		hal_wdtClear();
		if(cut_sdr_data_en == 1){
			/*word_reg_memcpy(reg_buf, SPRGROUP_SFR6 + (0x000<<2), sizeof(reg_buf) / 4);
			for(i = 0;i < sizeof(reg_buf) / 4;i++){
				debg("REG[%d] = %x\n",i,reg_buf[i]);
			}*/
			debg("capture sdrdata pending\n");
			cut_sdr_data_en = 0;
			uint write;
			for(filenum = 0;filenum < 1000;filenum++){
				filename[9]='0'+ ((filenum / 1000)%10);
				filename[10]='0'+ ((filenum / 100)%10);
				filename[11]='0'+ ((filenum / 10)%10);
				filename[12]='0'+ (filenum  % 10);
				if(FR_OK != f_open(&Fil,(char const *)filename, FA_READ)){
					if(FR_OK == f_open(&Fil,(char const *)filename, FA_CREATE_NEW | FA_WRITE)){
						f_write(&Fil, (const void*)sdr_data.sdr_data_buff, sdr_data.len, &write);
						debg("Raw len = %x\n",write);
						loop = 0;
						hal_sysMemFree(sdr_data.sdr_data_buff);
						memcpy(fname,filename,sizeof(filename));
						hal_mjpegMemUninit();//mjpegEncCtrl.ybuffer = 0;
					}
					f_close(&Fil);
					break;
				}
				f_close(&Fil);
			}		
		}
	}

}
#endif
