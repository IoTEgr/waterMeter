/****************************************************************************
**
 **                              CUSTOMER
  ** *   **             THE APPOTECH MULTIMEDIA PROCESSOR
   **** **                  CUSTOMER HEADER
  *** ***
 **  * **               (C) COPYRIGHT 2016 BUILDWIN 
**      **                         
         **         BuildWin SZ LTD.CO  ; VIDEO PROJECT TEAM
          **   
* File Name   : customer.h
* Author      : Mark.Douglas 
* Version     : V100
* Date        : 09/22/2016
* Description : This file is customer define 
*               
* History     : 
* 2016-09-22  : 
*      <1>.This is created by mark,set version as v100.
*      <2>.Add basic functions & information
******************************************************************************/
#ifndef  CUSTOMER_H
#define  CUSTOMER_H

#include "../../ax32xx/inc/ax32xx_cfg.h"

//--------------software version-------------
#define  SYSTEM_VERSION     "AX3293_V104"  //----user configure

//----------board------------------------
#define  BOARD_TYPE_MINIDV      0	// minidv demo board
#define  BOARD_TYPE_HP          1    // hp demo board


#define  SYSTEM_BOARD      BOARD_TYPE_MINIDV     //----user configure


#define RECORD_MODE_DEFAULT       0  //  default mode,720P+VGA doule sensor.
#define RECORD_MODE_SIGNAL        1  //  only 720P
#define RECORD_MODE_AUTO           2  //  720P first.if VGA in ,creating B folder


#define  RECORD_MODE       RECORD_MODE_SIGNAL 


#if (BOARD_TYPE_MINIDV == SYSTEM_BOARD)

#define  UPDATA_RTC_TIME_EN 	0	// 0 is not use file updata rtc , 1: use file updata rtc
#define  UPDATA_RTC_TIME_FILE 	"TIME.TXT"

#define  TIME_WATERMASK  0		// 0: close time watermask , 1: open time watermask
#define  RECORD_VIDEO_TIME 	5*60		// video rec second per file, loop rec
#define  RECORD_VIDEO_LOOP	0 			// 0: card full stop , 1: del old file loop rec

#define  AUTO_POWER_OFF_TIME   0*60 // 0: close  auto power off func, other:  other sec -> 0 ,will power off when standby

#define  MOTION_DEC_EN 		0   // 0: is disable motion dection,  1: enable motion dection 
#define  MOTION_DEC_TIME    20 // second.when motion dection no active recording this time will stop recording

#define  SOUND_DEC_EN 		0   // 0: is disable sound dection,  1: enable sound dection 
#define  SOUND_DEC_THRESHOLD    1  // THRESHOLD LEVEL   0: easy happen, 1: normal  happen, 2 :not easy happen

#define  RECORD_VIDEO_MUTE   0 	// 0: record video have sound, 1: record video no sound
#define  RECORD_AUDIO_TASK	 1  // 0: not audio task , 1: have audio task 

#define  TIMER_ISR_HANDLE_LED_KEY	1 // 0: LED & KEY not timer isr handle, 1: LED & KEY timer isr handle

#else
#define  AUTO_POWER_OFF_TIME   0 // 0: close  auto power off func, other:  other sec -> 0 ,will power off when standby

#define  TIME_WATERMASK  0		// 0: close time watermask , 1: open time watermask
#define  RECORD_VIDEO_TIME 	0	// 24*60*60 second , not loop rec

#define  MOTION_DEC_EN 		0   // 0: is disable motion dection,  1: enable motion dection 
#define  MOTION_DEC_TIME    20 // second.when motion dection no active recording this time will stop recording

#define  SOUND_DEC_EN 		0   // 0: is disable sound dection,  1: enable sound dection 
#define  SOUND_DEC_THRESHOLD    1  // THRESHOLD LEVEL   0: easy happen, 1: normal  happen, 2 :not easy happen

#define  RECORD_VIDEO_MUTE   0 	// 0: record video have sound, 1: record video no sound
#define  RECORD_AUDIO_TASK	 0  // 0: not audio task , 1: have audio task 

#define  TIMER_ISR_HANDLE_LED_KEY	1 // 0: LED & KEY not timer isr handle, 1: LED & KEY timer isr handle

#endif

#define  AUDIO_LOOP_EN		0		// audio 0: is not loop rec , 1 is loop rec
#define  AUDIO_REC_TIME  	5*60	// audio rec second pre file.

#define  AVI_TYPE_ODML       1  // AVI FILE TYPE .1-open dml,0-std
#define  FILE_SYNC_WRITE    1  // write sync for avi file


#define  FILE_SIZE_PRE_MALLOC	0 // 0: file is not pre malloc , 1 : file is pre malloc(FILE MAX SIZE before REC)
#define  TAKE_PHOTO_MODE     	1  // 1: take photo A and B , 0:only A 
#define  USENSOR_PWRCTRL_EN    0  // if enable,control usensor power by PE1;if disable,usensor power always power-on
#if USENSOR_PWRCTRL_EN
#define  USB2_PWR_CH     GPIO_PE
#define  USB2_PWR_PIN    GPIO_PIN1
#define  USB2_DET_CH     GPIO_PE
#define  USB2_DET_PIN    GPIO_PIN0
#else
#define  USB2_DET_CH     GPIO_PE
#define  USB2_DET_PIN    GPIO_PIN0
#endif

#define  USENSOR_AUDIO_ON      1 // back record audio volume on, use front record audio


#define  USENSOR_RESOLUTION      1 //usensor recording resolution. 1: 640*480; 2: 1280:720; 3:1280:960

#define  IR_MENU_EN            1  // 0: not IR control , 1 IR control
#define  IR_LED_CH 			   GPIO_PF
#define  IR_LED_PIN			   GPIO_PIN8  

/*
//========led io control======
#define  LED_RED_CH 	 GPIO_PD
#define  LED_RED_PIN	 GPIO_PIN10 
#define  LED_RED_ON()  {hal_gpioInit(LED_RED_CH,LED_RED_PIN,GPIO_OUTPUT,GPIO_PULL_DOWN); \
						hal_gpioWrite(LED_RED_CH,LED_RED_PIN,GPIO_LOW); \
						}
#define  LED_RED_OFF()  {hal_gpioInit(LED_RED_CH,LED_RED_PIN,GPIO_OUTPUT,GPIO_PULL_UP); \
						hal_gpioWrite(LED_RED_CH,LED_RED_PIN,GPIO_HIGH); \
						}
#define  LED_RED_CHANGE()  {if(hal_gpioRead(LED_RED_CH,LED_RED_PIN)) \
							hal_gpioWrite(LED_RED_CH,LED_RED_PIN,GPIO_LOW); \
							else\
							hal_gpioWrite(LED_RED_CH,LED_RED_PIN,GPIO_HIGH);\
							}
#define  LED_RED_CHECK()   hal_gpioRead(LED_RED_CH,LED_RED_PIN)

#define  LED_BLUE_CH 	 GPIO_PF
#define  LED_BLUE_PIN	 GPIO_PIN8
#define  LED_BLUE_ON()  {hal_gpioInit(LED_BLUE_CH,LED_BLUE_PIN,GPIO_OUTPUT,GPIO_PULL_DOWN); \
						hal_gpioWrite(LED_BLUE_CH,LED_BLUE_PIN,GPIO_LOW); \
						}
#define  LED_BLUE_OFF()  {hal_gpioInit(LED_BLUE_CH,LED_BLUE_PIN,GPIO_OUTPUT,GPIO_PULL_UP); \
						hal_gpioWrite(LED_BLUE_CH,LED_BLUE_PIN,GPIO_HIGH); \
						}
#define  LED_BLUE_CHANGE()  {if(hal_gpioRead(LED_BLUE_CH,LED_BLUE_PIN)) \
							hal_gpioWrite(LED_BLUE_CH,LED_BLUE_PIN,GPIO_LOW); \
							else\
							hal_gpioWrite(LED_BLUE_CH,LED_BLUE_PIN,GPIO_HIGH);\
							}
#define  LED_BLUE_CHECK()   hal_gpioRead(LED_BLUE_CH,LED_BLUE_PIN)
*/

//====led 300R control

#define  LED_RED_CH 	 GPIO_PD
#define  LED_RED_PIN	 GPIO_PIN10 
#define  LED_RED_ON()  {hal_gpioInit(LED_RED_CH,LED_RED_PIN,GPIO_INPUT,GPIO_PULL_FLOATING); \
							hal_gpioLedInit(GPIO_LED10_PD10,GPIO_PULL_UP,0); \
							hal_gpioLedInit(GPIO_LED10_PD10,GPIO_PULL_DOWN,0); \
							hal_gpioLedPull(LED_RED_CH,LED_RED_PIN,GPIO_PULLE_UP); \
							}
#define  LED_RED_OFF()  {hal_gpioInit(LED_RED_CH,LED_RED_PIN,GPIO_INPUT,GPIO_PULL_FLOATING); \
							hal_gpioLedInit(GPIO_LED10_PD10,GPIO_PULL_UP,0); \
							hal_gpioLedInit(GPIO_LED10_PD10,GPIO_PULL_DOWN,0); \
							hal_gpioLedPull(LED_RED_CH,LED_RED_PIN,GPIO_PULLE_DOWN); \
							}
#define  LED_RED_CHANGE()  {if(hal_gpioRead(LED_RED_CH,LED_RED_PIN)) \
								hal_gpioLedPull(LED_RED_CH,LED_RED_PIN,GPIO_PULLE_DOWN); \
								else\
								hal_gpioLedPull(LED_RED_CH,LED_RED_PIN,GPIO_PULLE_UP);\
								}
#define  LED_RED_CHECK()   hal_gpioRead(LED_RED_CH,LED_RED_PIN)

#if 0
#define  LED_BLUE_CH 	 GPIO_PF
#define  LED_BLUE_PIN	 GPIO_PIN8
#define  LED_BLUE_ON()  {hal_gpioInit(LED_BLUE_CH,LED_BLUE_PIN,GPIO_INPUT,GPIO_PULL_FLOATING); \
							hal_gpioLedInit(GPIO_LED15_PF8,GPIO_PULL_UP,0); \
							hal_gpioLedInit(GPIO_LED15_PF8,GPIO_PULL_DOWN,0); \
							hal_gpioLedPull(LED_BLUE_CH,LED_BLUE_PIN,GPIO_PULLE_UP);	\
							}
#define  LED_BLUE_OFF()  {hal_gpioInit(LED_BLUE_CH,LED_BLUE_PIN,GPIO_INPUT,GPIO_PULL_FLOATING); \
							hal_gpioLedInit(GPIO_LED15_PF8,GPIO_PULL_UP,0); \
							hal_gpioLedInit(GPIO_LED15_PF8,GPIO_PULL_DOWN,0); \
							hal_gpioLedPull(LED_BLUE_CH,LED_BLUE_PIN,GPIO_PULLE_DOWN);	\
							}
#define  LED_BLUE_CHANGE()  {if(hal_gpioRead(LED_BLUE_CH,LED_BLUE_PIN)) \
								hal_gpioLedPull(LED_BLUE_CH,LED_BLUE_PIN,GPIO_PULLE_DOWN); \
								else\
								hal_gpioLedPull(LED_BLUE_CH,LED_BLUE_PIN,GPIO_PULLE_UP);\
								}
#define  LED_BLUE_CHECK()   hal_gpioRead(LED_BLUE_CH,LED_BLUE_PIN)
#endif

#define  POWER_ON_CH 	 GPIO_PA
#define  POWER_ON_PIN	 GPIO_PIN4
#define  POWER_ON()		{hal_gpioInit(POWER_ON_CH,GPIO_PIN4,GPIO_OUTPUT,GPIO_PULL_UP); \
						hal_gpioWrite(POWER_ON_CH,GPIO_PIN4,GPIO_HIGH); \
						}
#define  POWER_OFF()	{hal_gpioInit(POWER_ON_CH,GPIO_PIN4,GPIO_OUTPUT,GPIO_PULL_DOWN); \
						hal_gpioWrite(POWER_ON_CH,GPIO_PIN4,GPIO_LOW); \
						}

#define  SENSOR_PWDN_CH 	 GPIO_PB
#define  SENSOR_PWDN_PIN	 GPIO_PIN6
#define  SENSOR_PWDN_OFF()		{hal_gpioInit(SENSOR_PWDN_CH,SENSOR_PWDN_PIN,GPIO_OUTPUT,GPIO_PULL_UP); \
								hal_gpioWrite(SENSOR_PWDN_CH,SENSOR_PWDN_PIN,GPIO_HIGH); \
								}
#define  SENSOR_PWDN_ON()		{hal_gpioInit(SENSOR_PWDN_CH,SENSOR_PWDN_PIN,GPIO_OUTPUT,GPIO_PULL_DOWN); \
								hal_gpioWrite(SENSOR_PWDN_CH,SENSOR_PWDN_PIN,GPIO_LOW); \
								}

#if  (AX32_PLATFORM == AX3293C)
#define  PWR_KEY_CH      GPIO_PD
#define  PWR_KEY_PIN    GPIO_PIN10
#else
#define  PWR_KEY_CH      GPIO_PD
#define  PWR_KEY_PIN    GPIO_PIN9
#endif

#define  DV_KEY_CH      GPIO_PD
#define  DV_KEY_PIN    GPIO_PIN8

#define  USB_DC_CH      GPIO_PD
#define  USB_DC_PIN    GPIO_PIN7

#define  DC_BAT_CHARGE_CH      GPIO_PB
#define  DC_BAT_CHARGE_PIN     GPIO_PIN6
#define  BAT_CHARGE_CHECK()   hal_gpioRead(DC_BAT_CHARGE_CH,DC_BAT_CHARGE_PIN)


#define KEY_LONG_TIME    150   // 2-second
#define KEY_LONG_TICK    50    // every 0.5second tick once


#define PHOTO_640_480    ((640<<16)|480) 
#define PHOTO_1280_720    ((1280<<16)|720) 
#define PHOTO_1920_1080    ((1920<<16)|1080)
#define PHOTO_2560_1440    ((2560<<16)|1440)
#define PHOTO_2944_1656    ((2944<<16)|1656)
#define PHOTO_3712_2160    ((3712<<16)|2160)
#define PHOTO_4032_3024    ((4032<<16)|3024)


#define VIDEO_640_480		((640<<16)|480) 
#define VIDEO_1280_720		((1280<<16)|720) 
#define VIDEO_1920_1080    ((1920<<16)|1080)

#define  PHOTO_SIZE  	PHOTO_1280_720//PHOTO_1280_720
#define  VIDEO_SIZE 	VIDEO_1280_720//VIDEO_1280_720


//---------file dir-----------------------
#define  FILEDIR_VIDEO  "VIDEO/"              //----user configure
#define  FILEDIR_PHOTO  "PHOTO/"              //----user configure
#define  FILEDIR_AUDIO  "AUDIO/"              //----user configure
#if RECORD_MODE == RECORD_MODE_SIGNAL
#define  FILEDIR_VIDEOA "VIDEO/"
#define  FILEDIR_VIDEOB "VIDEO/"
#else
#define  FILEDIR_VIDEOA "VIDEOA/"
#define  FILEDIR_VIDEOB "VIDEOB/"
#endif



#endif




