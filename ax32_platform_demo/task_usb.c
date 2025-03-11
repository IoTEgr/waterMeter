/****************************************************************************
**
 **                              TASK 
  ** *   **             THE APPOTECH MULTIMEDIA PROCESSOR
   **** **                 TASK USB
  *** ***
 **  * **               (C) COPYRIGHT 2016 BUILDWIN 
**      **                         
         **         BuildWin SZ LTD.CO  ; VIDEO PROJECT TEAM
          **   
* File Name   : task_usb.c
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


/*******************************************************************************
* Function Name  : task_usb
* Description    : usb task for uvc & mass
* Input          : void *para : for task initial use
* Output         : none                                            
* Return         : 
*******************************************************************************/
int task_usb(void *para)
{
    INT16U value,event;
	int ret,mode;
	SENSOR_PWDN_ON();

    deg_Printf("usb task enter.\n");
//	dispLayerInit(DISP_LAYER_VIDEO); 
//    dispLayerUninit(DISP_LAYER_VIDEO);
    mode = 2;	// 0 : card reader  , 1 : PC cam   , 2 card reader + PCcam
//    layout_usb_init();
    //set lcd video layer color
//    hal_lcdSetBufYUV(hal_lcdGetShowingBuffer(),0,0x80,0x80);


	if(mode) // pc-cam   
	{
	   VIDEO_ARG_T arg;
	   arg.resolution.width = sensor_get_w();
	   arg.resolution.height= sensor_get_h();
	   deg_Printf("sensor_get_w:%d,sensor_get_h=%d\n",arg.resolution.width,arg.resolution.height);
	   videoRecordInit(&arg); // enable csi&mjpeg 
	}

	hal_usbdInit(mode);

	while(1)
	{
		if(false == hal_usbdProcess()){
			return false;
		}
		ret = systemEventService(&value,&event);
		if(ret>0)
		{
			if(event == EVENT_SYS) // system event
			{
				if(((value == SYS_EVENT_USB)&& (SysCtrl.usb == USB_STAT_NULL)) ||(value == SYS_EVENT_OFF)) 
				{
					 deg_Printf("usb out\n");
                     break;  // power off
				}
			}
		}
	}
    hal_usbdUninit();

	task_set_state(MAIN_STAT_POWER_OFF);  // change to power off
//	deg_Printf("off size = %x\n",nv_open(0));
    deg_Printf("usb task exist.\n");
	return true;
}

