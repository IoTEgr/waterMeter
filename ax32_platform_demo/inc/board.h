/****************************************************************************
**
 **                              BOARD
  ** *   **             THE APPOTECH MULTIMEDIA PROCESSOR
   **** **                  BOARD HEADER
  *** ***
 **  * **               (C) COPYRIGHT 2016 BUILDWIN 
**      **                         
         **         BuildWin SZ LTD.CO  ; VIDEO PROJECT TEAM
          **   
* File Name   : board.h
* Author      : Mark.Douglas 
* Version     : V100
* Date        : 09/22/2016
* Description : This file is for user board
*               
* History     : 
* 2016-09-22  : 
*      <1>.This is created by mark,set version as v100.
*      <2>.Add basic functions & information
******************************************************************************/
#ifndef  BOARD_H
    #define  BOARD_H

#define __IO_R(x)     (x|0x00000000)
#define __IO_W(x)     (x|0x10000000)
#define __IO_C(x)     (x|0x20000000)

typedef struct Board_Node_S
{
	char name[12];

	int (*init)(void);

	int (*ioctrl)(INT32U prit,INT32U op,INT32U para);

    INT32U prit;
}Board_Node_T;

#define  DEV_NAME_BATTERY      "battery"
#define  DEV_NAME_LCD            "lcd"
#define  DEV_NAME_LED            "led"
#define  DEV_NAME_GSENSOR      "g-sensor"
#define  DEV_NAME_SDCARD       "sd-card"
#define  DEV_NAME_USB            "usb"
#define  DEV_NAME_KEY         "key"
#define  DEV_NAME_USENSOR      "usensor"
#define  DEV_NAME_IR      		"ir"
//-----------key value table-------------------------
#define NO_KEY                  0
#define T_KEY_1                 0x1
#define T_KEY_2                 0x2
#define T_KEY_3                 0x3
#define T_KEY_4                 0x4
#define T_KEY_5                 0x5
#define T_KEY_6                 0x6
#define T_KEY_7                 0x7
#define T_KEY_8                 0x8
#define T_KEY_9                 0x9
#define T_KEY_9                 0x9
#define T_KEY_10                0xa
#define T_KEY_11                0xb
#define T_KEY_12                0xc
#define T_KEY_13                0xd
#define T_KEY_14                0xe
#define T_KEY_15                0xf


#define T_KEY_SHORT             0x00
#define T_KEY_SHORT_UP         0x20
#define T_KEY_LONG              0x40
#define T_KEY_LONG_UP          0x60
#define T_KEY_DOWN              0x80


//----------key-------------------------
#define  KEY_VALUE_NULL       NO_KEY
#define  KEY_VALUE_OK          T_KEY_1
#define  KEY_VALUE_MENU       T_KEY_5
#define  KEY_VALUE_MODE       T_KEY_2
#define  KEY_VALUE_UP          T_KEY_4
#define  KEY_VALUE_DOWN       T_KEY_3
#define  KEY_VALUE_POWER      T_KEY_15
#define  KEY_VALUE_LOCK       T_KEY_6

#define  KEY_VALUE_DC			T_KEY_1
#define  KEY_VALUE_DV			T_KEY_2
#define  KEY_VALUE_AUDIO		T_KEY_3



#define  KEY_VALUE_GATHER		T_KEY_7  //采集
#define  KEY_VALUE_SEND			T_KEY_8  //发送



#define  KEY_EVENT_UP         T_KEY_SHORT
#define  KEY_EVENT_DOWN      T_KEY_DOWN
#define  KEY_EVENT_CLICK     T_KEY_SHORT_UP  // short time push
#define  KEY_EVENT_SHORT     T_KEY_SHORT_UP
#define  KEY_EVENT_LONG      T_KEY_LONG  // long time push
#define  KEY_EVENT_LONGUP   T_KEY_LONG_UP

//----------io command-----------------
#define  IOCTRL_SDC_CHECK    __IO_C(1)
#define  IOCTRL_USB_CHECK    __IO_C(2)
#define  IOCTRL_BAT_CHECK    __IO_C(3)
#define  IOCTRL_LCD_BKLIGHT  __IO_C(4)
#define  IOCTRL_LCD_LCMOFF   __IO_C(5)

#define  IOCTRL_GSE_LOCK     __IO_C(5)
#define  IOCTRL_GSE_PARK     __IO_C(6)
#define  IOCTRL_GSE_SETLOCK  __IO_C(7)
#define  IOCTRL_GSE_SETPARK  __IO_C(8)
#define  IOCTRL_GSE_STABLE   __IO_C(9) // wait gsensor stable,when power off
#define  IOCTRL_GSE_GETNAME  __IO_C(10)

#define  IOCTRL_KEY_READ     __IO_R(9)
#define  IOCTRL_KEY_POWER    __IO_C(13)
#define  IOCTRL_KEY_POWEROFF __IO_C(14)
#define  IOCTRL_LED_NO0      __IO_C(10)
#define  IOCTRL_LED_CHECK    __IO_C(11)

#define  IOCTRL_CMOS_INIT    __IO_C(15)
#define  IOCTRL_USB_POWER    __IO_C(16) // for usensor power enable
#define  IOCTRL_KEY_CHECK    __IO_C(17) 
#define  IOCTRL_IR_SET    	__IO_C(18)
#define  IOCTRL_IR_GET 		__IO_C(19)

/*******************************************************************************
* Function Name  : boardInit
* Description    : 
* Input          : Board_Node_T *table : board node table
* Output         : none                                            
* Return         : int : 
*******************************************************************************/
int boardInit(Board_Node_T *table);
/*******************************************************************************
* Function Name  : boardOpen
* Description    :  open a board node by node name
* Input          : char *name : name
* Output         : none                                            
* Return         : int : 
*******************************************************************************/
int boardOpen(char *name);
/*******************************************************************************
* Function Name  : boardIoctrl
* Description    :  ioctrl for board node
* Input          : int fd : node index
                      INT32U op: operation
                      INT32U para:paramater
* Output         : none                                            
* Return         : int : 
*******************************************************************************/
int boardIoctrl(int fd,INT32U op,INT32U para);
/*******************************************************************************
* Function Name  : boardNameIoctrl
* Description    :  ioctrl for board node
* Input          : char *name : name
                      INT32U op: operation
                      INT32U para:paramater
* Output         : none                                            
* Return         : int : 
*******************************************************************************/
int boardNameIoctrl(char *name,INT32U op,INT32U para);






















#endif


