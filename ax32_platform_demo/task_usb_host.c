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
* File Name   : task_usb_host.c
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
#include "../bwlib/fs/inc/diskio.h"

#define  USB_ICON_MASS      RES_ICON_USB_MODE
/*******************************************************************************
* Function Name  : task_usb_host
* Description    : usb host task for uvc & mass
* Input          : void *para : for task initial use
* Output         : none                                            
* Return         : 
*******************************************************************************/
int task_usb_host(void *para)
{
#if 0
//    INT16U value,event;
//	int ret;

    deg_Printf("usb host task enter.\n");

	logo_image_show(USB_ICON_MASS);
	SysCtrl.bfd_usb = 0;		// close usb device check 
	SysCtrl.bfd_sdcard = 0;		// close sd device check
	usb_host_remove();
	usb11_host_remove();
	while(1)
	{
/*
		ret = systemEventService(&value,&event);
		if(ret>0)
		{
			if(event == EVENT_SYS) // system event
			{
				if(((value == SYS_EVENT_USB)&& (SysCtrl.usb == USB_STAT_NULL)) ||(value == SYS_EVENT_OFF)) 
				{
                     break;  // power off
				}
			}
			else if(event == EVENT_KEY)
			{
				if(value == (KEY_VALUE_POWER|KEY_EVENT_CLICK))
				{
					if(SysCtrl.t_screensave)
				       boardIoctrl(SysCtrl.bfd_lcd,IOCTRL_LCD_BKLIGHT,0);   // screen off
				    SysCtrl.t_screensave = 0;
				}
			}
		}
*/ 

		static u32 tempi = 0;
		tempi++;
		if(tempi > 0xffffff)
		{
			tempi = 0;
//			deg_Printf("task:u_dev.pudisk=0x%x\n",u_dev.pudisk);
		}
		
		if(NULL != u_dev.pudisk)		// usb mass dev on line
		{
		//	FIL Fil;
		    int fd;

			deg_Printf("-------------usdisk test hal------------------------\n");
			deg_Printf("1.file system test\n");
			deg_Printf("2.write file: <project code: 0x2000000 ~ _text_len> \n");
			deg_Printf("3.verfiy file: <project code: 0x2000000 ~ _text_len> \n");
			deg_Printf("----------------------------------------------------\n");
			deg_Printf("Maxlun:%x,\n",u_dev.pudisk->maxlun);
			deg_Printf("Cap	:%x\n",u_dev.pudisk->cap);
			deg_Printf("Read Test: lba = 0, len = 4\n");

			//fat test
			fp_tmnow = NULL; //hal_rtcTimeGetExt;//now;
			fp_storage_init = (s32 (*)(u8 ))u_dev.pudisk->fp_udisk_actech;
			fp_storage_sta = u_dev.pudisk->fp_udisk_state;
			fp_storage_rd = (s32 (*)(void *, u32 , u32 ))u_dev.pudisk->fp_udisk_rd;
			fp_storage_wr = (s32 (*)(void *, u32 , u32 ))u_dev.pudisk->fp_udisk_wr;

			u32 ret = fs_mount(0); 
			if(FR_OK != ret){
				deg_Printf("fat -f_mount -Er:%x\n",ret);
				goto test_end;
			}else{
				deg_Printf("fat -f_mount ok\n");	
			}
			// creat doc
			u8 tdocname[20];
			memcpy(tdocname, "usbhost\0", 20);
			if(FR_OK != (ret = f_mkdir((const TCHAR*) tdocname))){
				if(FR_EXIST != ret){
					deg_Printf("fat -_f_mkdir err\n");
					goto test_end;
				}
			}
			else{
				deg_Printf("fat -make dri ok\n"); 
			}	

			// creat file
			memcpy(tdocname, "usbhost/test.bin\0", 20);
			f_unlink((char *)tdocname);
			fd = open((char const *)tdocname, FA_CREATE_NEW | FA_WRITE | FA_READ);
			if(fd<0){
				deg_Printf("fat -_f_open err\n");
				goto test_end;
			}
			else{
				deg_Printf("fat -_f_open	ok:\n");	
			}	

			//write loaction codes to udisk
			extern int _text_len;
			//u32 wrd;
			u32 wrlen = (u32)(&_text_len);
			wrlen *= 512 ; 
			
			if(write(fd, (char const *)0x2000000, wrlen)<0){
				deg_Printf("fat -_f_write err\n");
				goto test_end;
			}
			else{
				deg_Printf("fat -_f_write  ok:%d\n",wrlen);	
			}
			close(fd);

			//read code verfiy
			deg_Printf("fat -_f_read verfiy .... \n");
			fd = open((char const *)tdocname,  FA_READ);
			if(fd<0){						
				deg_Printf("fat -_f_open err\n");
				goto test_end;
			}
			lseek(fd,0,0);
			
			
			u8 verbuf[512];
			u8 *ps = verbuf;
			u8 *po = (u8 *)0x2000000;
			
			while(wrlen){
				if(read(fd, (u8 *)ps, 512)<0){
					deg_Printf("fat -_f_read err\n");
					goto test_end;
				}
				else{
					//debg("fat -_f_read  ok\n");	
				}
				if(memcmp(ps, po, 512)){
					deg_Printf(" very err!!!!!\n");
					break;
				}
				wrlen -= 512;
				po += 512;
				deg_Printf(".");
			}
test_end:
			deg_Printf("fat -test end");
			XOSTimeDly(5000);
		}

	}
		
	task_set_state(MAIN_STAT_POWER_OFF);  // change to power off
    deg_Printf("usb host task exist.\n");
#endif
	return true;
}

