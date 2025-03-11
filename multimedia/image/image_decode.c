/****************************************************************************
**
 **                              MULTIMEDIA
  ** *   **             THE APPOTECH MULTIMEDIA PROCESSOR
   **** **                  MULTIMEDIA IMAGE DECODE
  *** ***
 **  * **               (C) COPYRIGHT 2016 BUILDWIN 
**      **                         
         **         BuildWin SZ LTD.CO  ; VIDEO PROJECT TEAM
          **   
* File Name   : image_decode.c
* Author      : Mark.Douglas 
* Version     : V100
* Date        : 09/22/2016
* Description : This file is image decode file
*               
* History     : 
* 2016-09-22  : 
*      <1>.This is created by mark,set version as v100.
*      <2>.Add basic functions & information
******************************************************************************/
#include "../media.h"
#include "../multimedia.h"

#if  MEDIA_CFG_IMAGE_DECODE_EN  >0

/*******************************************************************************
* Function Name  : imageDecodeInit
* Description	 : image decode initial
* Input 		 : none
* Output		 : none 										   
* Return		 : int 0
*******************************************************************************/
int imageDecodeInit(void)
{
	return STATUS_OK;
}
/*******************************************************************************
* Function Name  : imageDecodeUninit
* Description	 : image decode uninitial
* Input 		 : none
* Output		 : none 										   
* Return		 : int 0 success
*******************************************************************************/
int imageDecodeUninit(void)
{
	return STATUS_OK;
}
/*******************************************************************************
* Function Name  : imageDecodeStart
* Description	 : image decode
* Input 		 : Image_ARG_T *arg : image arg
* Output		 : none 										   
* Return		 : int : 0 success
                                -1 fail
*******************************************************************************/
int imageDecodeStart(Image_ARG_T *arg)
{
    INT8U *jpegBuffer;
	INT32S len,addr,size,ret;
	volatile int timeout;

	if(arg == NULL)
		return STATUS_FAIL;
	if(arg->media.type == MEDIA_SRC_FS)
	{
		if(arg->media.src.fd<0)
			return STATUS_FAIL;
		jpegBuffer = (INT8U *)hal_sysMemMalloc(fs_size(arg->media.src.fd),64);//shareMemMalloc(JPEG_CFG_CACHE_NUM*JPEG_CFG_CACHE_SIZE);//jpegCache;
		if(jpegBuffer)
		{
			size = fs_size(arg->media.src.fd);
			read(arg->media.src.fd,jpegBuffer,size);		
		}
		addr = 0;
	}
	else if(arg->media.type == MEDIA_SRC_NVFS)
	{
		addr = nv_open((int)arg->media.src.fd);
		if(addr<0)
			return STATUS_FAIL;

		jpegBuffer = (INT8U *)hal_sysMemMalloc(nv_size(arg->media.src.fd),64);//shareMemMalloc(JPEG_CFG_CACHE_NUM*JPEG_CFG_CACHE_SIZE);//jpegCache;
		if(jpegBuffer)
		{
			len = nv_size((int)arg->media.src.fd);
			nv_read(addr,jpegBuffer,len);					
		}

	}
	else if(arg->media.type == MEDIA_SRC_RAM)
	{
		if(arg->media.src.buff == 0)
			return STATUS_FAIL;
		jpegBuffer = (INT8U *)arg->media.src.buff;
		addr = 0;
	}
	else
		return STATUS_FAIL;
    
	if(jpegBuffer == NULL)
	{
		return STATUS_FAIL;
	}

	ret = 0;
//    if(jpeg_decode_picture(jpegBuffer,arg->yout,arg->uvout,arg->target.width,arg->target.height) == false)
	if(hal_mjpegDecodePicture(jpegBuffer,arg->yout,arg->uvout,arg->target.width,arg->target.height)<0)
    {
		ret = -1;
		goto END_INAGE_DECODE;
    }

	if(arg->wait) // wait decode end
	{
//		timer_ticktimer_start();
	    timeout = 0;
	    while(hal_mjpegDecodeStatusCheck())
		{
			timeout++;
			if(timeout>=0x0fffff)
				break;
		}
//	    ticktimer_stop();
	}

	if(hal_mjpegDecodeErrorCheck()!=0)
	    ret = -1;
END_INAGE_DECODE:
	if(arg->media.type != MEDIA_SRC_RAM)
		hal_sysMemFree((void *)jpegBuffer);

		//shareMemFree(jpegBuffer);
    if(ret<0)
	    return STATUS_FAIL;
	else
		return STATUS_OK;
}
/*******************************************************************************
* Function Name  : imageDecodeGetResolution
* Description	 : image decode get jpeg resolution
* Input 		 : INT16U *width,INT16U *height
* Output		 : none 										   
* Return		 : int : 0 success
                                -1 fail
*******************************************************************************/
int imageDecodeGetResolution(INT16U *width,INT16U *height)
{
	hal_mjpegDecodeGetResolution(width,height);

	return 0;
}




#endif







