/****************************************************************************
**
 **                              APPLICATION
  ** *   **             THE APPOTECH MULTIMEDIA PROCESSOR
   **** **                  APPLICATION HEADER
  *** ***
 **  * **               (C) COPYRIGHT 2016 BUILDWIN 
**      **                         
         **         BuildWin SZ LTD.CO  ; VIDEO PROJECT TEAM
          **   
* File Name   : application.h
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
#ifndef  APPLICATION_H
    #define  APPLICATION_H
	
// hal layer include
#include "../hal/inc/hal.h"   
// build win lib
#include "../bwlib/bwlib.h" 
// xos
#include "../xos/xos.h"
//-device 
#include "../device/gsensor/gsensor.h"
#include "../device/tft_lcd/tft_lcd.h"
#include "../device/cmos_sensor/cmos_sensor.h"
//-multimedia include.image,audio,video
#include "../multimedia/multimedia.h"

// explorer for file list.resource manager for file manager
#include "./inc/customer.h"
//#include ".\inc\explorer.h"    
#include "./inc/resource_manager.h"  
#include "./inc/config.h"
#include "./inc/board.h"
#include "./resource/res.h"



#define  FLAG_SDC      0x08
#define  FLAG_BAT      0x01
#define  FLAG_USB      0x02
#define  FLAG_LOK      0x04

#define SYSDEVICE_Q_SIZE    10

typedef struct System_Ctrl_S
{
	INT8U powerflag;   // power on flag.  key/dcin/gsensor/RTC/...
	INT8U battery;     // battery state;
	INT8U t_usb;           // usb last stat. no usb,dcin,usb-pc
	INT8U usb;           // usb stat. no usb,dcin,usb-pc
	INT8U usensor;     // usensor state
	
	INT8U sdcard;      // sdcard stat.no sdc,sdc unstable,sdc error,sdc full,sdc normal
	INT8U g_lock;      // g sensor active flag
	INT8U f_keysound;  //keysound flag
	INT8U f_update;   //flag update 
	INT8U firmware_update;	// 0: is not updata , 1 is updata success , others is updata err

	INT8U pip_mode;
	INT8U astern;     // astern
	INT8U usensorshow;  // usensor show flag
	INT8U bfolder;    // videob folder flag

	INT8S bfd_battery;  // board fd for battery check
	INT8S bfd_usb;       // board fd for usb check
	INT8S bfd_sdcard;   //board fd for sd card check
	INT8S bfd_gsensor; // board fd for gsensor check
	INT8S bfd_ir;		// board fd for ir ctrl
	INT8S bfd_led;      // board fd for led ctrl
	INT8S bfd_lcd;      // board fd for lcd ctrl
	INT8S bfd_key;      // board fd for key check
	INT8S bfd_usensor;  // board fd for usensor detect

	INT32S t_screensave;      // screen save flag
	INT32S t_autooff;       // auto power off time
	INT32U t_remain;	     // sdc record time
	INT32U t_rec;           // loop rec time
	INT32U t_mrec;
	INT32U t_ir_flag;		//ir flag: 0: ir close , 1: ir open
	INT32U t_ir_auto;		//ir flag: 0: ir close , 1: ir auto 
	INT32U t_powersave;   // power save when dcin out

	INT32S file_index;  // file index for playback
	int         file_type;
	
	INT32S jpg_list;  // avi & jpg file list handle
    INT32S avi_list;
	INT32S wav_list;        // wav file list
	INT32S avia_list;
	INT32S avib_list;

	INT32U sd_freesize;  //sdc free size KB
	INT32U fs_clustsize; // fs cluster size

	INT32U t_wait;    // wait csi & isp stable

	XMsgQ *sysQ;
}System_Ctrl_T;
extern System_Ctrl_T SysCtrl;

extern char tempFileName1[],tempFileName2[];
//-------------system main state table--------------------

#define 	MAIN_STAT_POWER_ON       0
#define 	MAIN_STAT_VIDEO_REC      1
#define 	MAIN_STAT_PHOTO_ENC      2
#define 	MAIN_STAT_VIDEO_PLY      3
#define 	MAIN_STAT_AUDIO_REC      4
#define 	MAIN_STAT_AUDIO_PLY      5
#define  	MAIN_STAT_MASS_USB       6
#define 	MAIN_STAT_POWER_OFF      7
#define 	MAIN_STAT_USB_HOST      8


//------------system event table-------------------------
#define  SYS_EVENT_SDC      0x0100    // sdc pulled out or in
#define  SYS_EVENT_USB      0x0200    // usb pulled out or in
#define  SYS_EVENT_DEL      0x0400    // menu selected to delete file
#define  SYS_EVENT_BAT      0x0800    // battery state
#define  SYS_EVENT_FMT      0x1000    // sdc formate
#define  SYS_EVENT_OFF      0x2000    // power off
#define  SYS_EVENT_ON       0x4000    // power on
#define  SYS_EVENT_MD       0x8000    // motion detetion
#define  SYS_EVENT_USENSOR  0x0300   // usensor pulledout or in
#define  SYS_EVENT_ASTERN   0x0500  // astern mode
#define  SYS_EVENT_UPGRADE  0x0600
typedef enum
{
    EVENT_NULL=0,
	EVENT_KEY,
	EVENT_SYS,
	EVENT_UART,
}EVENT_E;


//-----------device msg id-----------------
enum
{
	DEVICE_MSG_NULL=0,
	DEVICE_MSG_SDC,
	DEVICE_MSG_USB,
	DEVICE_MSG_BATTERY,
	DEVICE_MSG_GSENSOR,

	DEVICE_MSG_MAX
};

//-----------battery stat-------------------
enum
{
	BATTERY_STAT_0=0,
	BATTERY_STAT_1,
	BATTERY_STAT_2,
	BATTERY_STAT_3,
	BATTERY_STAT_4,
	BATTERY_STAT_5,

	BATTERY_STAT_MAX
};
//-----------power flag-------------------
enum
{
	POWERON_FLAG_KEY=0,
	POWERON_FLAG_DCIN,
	POWERON_FLAG_GSENSOR,
	POWERON_FLAG_RTC,

	POWERON_FLAG_MAX
};
//-----------usb stat-------------------
enum
{
	USB_STAT_NULL = 0,
	USB_STAT_DCIN,
	USB_STAT_PC,

	USB_STAT_MAX
};
//----------sd card stat----------------
enum
{
	SDC_STAT_NULL = 0,
	SDC_STAT_UNSTABLE,
	SDC_STAT_ERROR,
	SDC_STAT_FULL,
	SDC_STAT_NORMAL,

	SDC_STAT_MAX
};
//-----------usensor stat----------------
enum
{
	USENSOR_STAT_NULL=0,
	USENSOR_STAT_UNSTABLE,
	USENSOR_STAT_IN,

	USENSOR_SHOW_OFF=0,
	USENSOR_SHOW_ON,

	USENSOR_STAT_MAX
};
//-----------astern stat-----------------
enum
{
	ASTERN_OFF=0,
	ASTERN_ON
};

/*******************************************************************************
* Function Name  : task_main
* Description    : video main
* Input          : void *para : for task initial use
* Output         : none                                            
* Return         : 
*******************************************************************************/
bool task_main(void *para);
/*******************************************************************************
* Function Name  : task_deamon
* Description    : system service in deamon
* Input          : key 0: unhandle key, 1: handle key
* Output         : None
* Return         : None
*******************************************************************************/
void task_deamon(u8 key);
/*******************************************************************************
* Function Name  : task_deamon
* Description    : system service in deamon
* Input          : *
* Output         : None
* Return         : None
*******************************************************************************/
int deamon_screen_save(int event);
/*******************************************************************************
* Function Name  : deamon_auto_poweroff
* Description    : system auto power off check
* Input          : int event : system event
* Output         : None
* Return         : None
*******************************************************************************/
int deamon_auto_poweroff(int event);
/*******************************************************************************
* Function Name  : deamon_event_handler
* Description    : deamon event handle
* Input          : *
* Output         : None
* Return         : None
*******************************************************************************/
int deamon_event_handler(INT16U *value,INT16U *event);
/*******************************************************************************
* Function Name  : deamon_fsFreeSize
* Description    : deamon get fs free size
* Input          : *
* Output         : None
* Return         : None
*******************************************************************************/
int deamon_fsFreeSize(void);
/*******************************************************************************
* Function Name  : deamon_fsSizeAdd
* Description    : deamon dec size from free size
* Input          : *
* Output         : None
* Return         : None
*******************************************************************************/
int deamon_fsSizeModify(INT8S dec,INT32U size);
/*******************************************************************************
* Function Name  : task_image_encode
* Description    : image encode task
* Input          : void *para : for task initial use
* Output         : none                                            
* Return         : 
*******************************************************************************/
void task_image_encode(void *para);
/*******************************************************************************
* Function Name  : task_audio_playback
* Description    : audio playback task
* Input          : void *para : for task initial use
* Output         : none                                            
* Return         : 
*******************************************************************************/
void task_audio_playback(void *para);
/*******************************************************************************
* Function Name  : task_audio_record
* Description    : audio record task
* Input          : void *para : for task initial use
* Output         : none                                            
* Return         : 
*******************************************************************************/
void task_audio_record(void *para);
/*******************************************************************************
* Function Name  : task_video_record
* Description    : video record task
* Input          : void *para : for task initial use
* Output         : none                                            
* Return         : 
*******************************************************************************/
void task_video_record(void *para);
/*******************************************************************************
* Function Name  : task_video_playback
* Description    : video playback task
* Input          : void *para : for task initial use
* Output         : none                                            
* Return         : 
*******************************************************************************/
void task_video_playback(void *para);
/*******************************************************************************
* Function Name  : task_usb
* Description    : usb task for uvc & mass
* Input          : void *para : for task initial use
* Output         : none                                            
* Return         : 
*******************************************************************************/
int task_usb(void *para);
/*******************************************************************************
* Function Name  : task_usb_host
* Description    : usb host task for uvc & mass
* Input          : void *para : for task initial use
* Output         : none                                            
* Return         : 
*******************************************************************************/
int task_usb_host(void *para);

/*******************************************************************************
* Function Name  : upgrade
* Description    : upgrade
* Input          : 
* Output         : none                                            
* Return         : int : 0: ->upgrade fail
                            -1:->no upgrade file
                           <-1:->upgrade fail,fireware maybe error
*******************************************************************************/
int upgrade(void);
/*******************************************************************************
* Function Name  : self_test
* Description    : self_test
* Input          : 
* Output         : none                                            
* Return         : int : 0: ->self_test pass
*******************************************************************************/
int self_test(void);



void task_video_record_caltime(void);
/*******************************************************************************
* Function Name  : deamon_keysound_check
* Description    : deamon key sound condition check
* Input          : *
* Output         : None
* Return         : None
*******************************************************************************/
int deamon_keysound_play(INT8U key);
/*******************************************************************************
* Function Name  : systemEventService
* Description    : system event service for event and key get
* Input          : INT16U *value : event value
*                  INT16U *event : event
* Output         : None
* Return         : int event value
*******************************************************************************/
int systemEventService(INT16U *value,INT16U *event);

/*******************************************************************************
* Function Name  : task_set_state
* Description    : set main state
* Input          : INT8U stat : main state.see the table,MAIN_STAT_VIDEO_REC/MAIN_STAT_PHOTO_ENC
* Output         : none                                            MAIN_STAT_VIDEO_PLY/MAIN_STAT_AUDIO_REC
* Return         :                                                    MAIN_STAT_AUDIO_PLY
*******************************************************************************/
int task_set_state(INT8U stat);
/*******************************************************************************
* Function Name  : task_get_state
* Description    : get main state
* Input          : INT8U stat : main state.see the table,MAIN_STAT_VIDEO_REC/MAIN_STAT_PHOTO_ENC
* Output         : none                                            MAIN_STAT_VIDEO_PLY/MAIN_STAT_AUDIO_REC
* Return         :                                                    MAIN_STAT_AUDIO_PLY
*******************************************************************************/
void task_get_state(INT8U *cur,INT8U *prev);
/*******************************************************************************
* Function Name  : task_get_curstate
* Description    : get main state
* Input          : INT8U stat : main state.see the table,MAIN_STAT_VIDEO_REC/MAIN_STAT_PHOTO_ENC
* Output         : none                                            MAIN_STAT_VIDEO_PLY/MAIN_STAT_AUDIO_REC
* Return         :                                                    MAIN_STAT_AUDIO_PLY
*******************************************************************************/
INT8U task_get_curstate(void);
/*******************************************************************************
* Function Name  : task_change_state
* Description    : change main state
* Input          : 
* Output         : none                                            
* Return         :                                                    
*******************************************************************************/
void task_change_state(void);


void hal_check_tfdebg(void);

























#endif

