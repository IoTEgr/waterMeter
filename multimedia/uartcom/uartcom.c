#include "../../ax32_platform_demo/application.h"
#include "uartCrc.h"

#define RX_LEN_MAX 23
static u8 PrvRxbuf[RX_LEN_MAX];
static u8 PrvRxFlag;
static u8 PrvRxLen = 0;
static u8 PrvRxEn;
static uint32 tick;

// 所有支持的命令
#define UART_COM_CTR_SEND_DATA 0x97 // 发送数据
#define UART_COM_CTR_GET_DATA 0X17	// 接受发送数据命令

#define UART_COM_CTR_SET_RES 0x18		 // 设置中心点和分辨率
#define UART_COM_CTR_GET_RES_RESULT 0X98 // 设置中心点和分辨率结果

#define UART_COM_CTR_GET_RES 0X19  // 获取中心点和分辨率
#define UART_COM_CTR_SEND_RES 0X99 // 获取中心点和分辨率

static void RxbufFree(void)
{
	PrvRxFlag = 0;
	PrvRxLen = 0;
	PrvRxEn = 0;
	memset(PrvRxbuf, 0, RX_LEN_MAX);
}

// * 串口数据接收
static void prvRxIsr(u8 data)
{
	// deg_Printf("RxIsr data=0x%x.\n",data);

	if (data == 0x68)
	{
		if (PrvRxFlag == 0) // 开始接收数据
		{
			PrvRxFlag = 1;
			tick = XOSTimeGet();
		}
	}

	if (PrvRxFlag)
	{
		if (PrvRxLen < RX_LEN_MAX) // 接收数据
		{
			PrvRxbuf[PrvRxLen++] = data;
		}

		if (PrvRxLen >= RX_LEN_MAX) // 接收数据完成
		{
			deg_Printf("0x%x,0x%x,0x%x.\n", PrvRxbuf[0], PrvRxbuf[21], PrvRxbuf[22]);
			deg_Printf("0x%x,0x%x,0x%x,0x%x,0x%x,0x%x,0x%x,0x%x,0x%x,0x%x.\n", PrvRxbuf[11], PrvRxbuf[12], PrvRxbuf[13], PrvRxbuf[14], PrvRxbuf[15], PrvRxbuf[16], PrvRxbuf[17], PrvRxbuf[18], PrvRxbuf[19], PrvRxbuf[20]);
			// XOSTimeDly(5);
			if (PrvRxbuf[0] == 0x68 && PrvRxbuf[22] == 0x16 && PrvRxbuf[21] == uartCheckSum(PrvRxbuf + 11, 10)) // 接收数据是否有效
			{
				PrvRxEn = 1;
			}
			else
			{
				PrvRxEn = 0;
			}
		}
	}
}

/**
 * 指令处理结果的回复
 * cmd - 指令
 * data - 回复的数据
 * len - 数据长度
 */
void btcomCmdRsp(const u8 *data, int len, u8 pack_total, u8 pack_cur)
{
	const u8 *fragment[3];
	int frag_len[3];
	u8 header[24];
	u8 tail[2];
	u32 i, j;

	int CRC_len;

	CRC_len = (1 == pack_cur) ? len + 12 : len + 4;
	// header
	header[0] = 0x68;
	header[1] = 0x10;
	header[2] = 0xAA;
	header[3] = 0xAA;
	header[4] = 0xAA;
	header[5] = 0xAA;
	header[6] = 0xAA;
	header[7] = 0xAA;
	header[8] = 0xAA;

	header[9] = UART_COM_CTR_SEND_DATA;

	header[10] = CRC_len & 0xFF;
	header[11] = (CRC_len >> 8) & 0xFF;

	header[12] = 0x17;
	header[13] = 0x01;

	header[14] = pack_total;
	header[15] = pack_cur;

	if (1 == pack_cur)
	{
		header[16] = configGet(CONFIG_ID_CENTER_X) & 0xFF;
		header[17] = (configGet(CONFIG_ID_CENTER_X) >> 8) & 0xFF;

		header[18] = configGet(CONFIG_ID_CENTER_Y) & 0xFF;
		header[19] = (configGet(CONFIG_ID_CENTER_Y) >> 8) & 0xFF;

		header[20] = configGet(CONFIG_ID_MJPEG_W) & 0xFF;
		header[21] = (configGet(CONFIG_ID_MJPEG_W) >> 8) & 0xFF;

		header[22] = configGet(CONFIG_ID_MJPEG_H) & 0xFF;
		header[23] = (configGet(CONFIG_ID_MJPEG_H) >> 8) & 0xFF;
	}

	// tail
	tail[0] = uartCheckSum(header + 10, (1 == pack_cur) ? 14 : 6) + uartCheckSum(data, len);
	tail[1] = 0x16;

	fragment[0] = header;
	frag_len[0] = (1 == pack_cur) ? 24 : 16;
	fragment[1] = data;
	frag_len[1] = len;
	fragment[2] = tail;
	frag_len[2] = 2;
	for (i = 0; i < sizeof(fragment) / sizeof(fragment[0]); i++)
	{
		for (j = 0; j < frag_len[i]; j++)
		{
			hal_uart1SendData(fragment[i][j]);
		}
	}
}

// 图像采集失败
void btcomCmdFail(void)
{
	u8 header[20];
	u16 i;

	// header
	header[0] = 0x68;
	header[1] = 0x10;
	header[2] = 0xAA;
	header[3] = 0xAA;
	header[4] = 0xAA;
	header[5] = 0xAA;
	header[6] = 0xAA;
	header[7] = 0xAA;
	header[8] = 0xAA;

	header[9] = UART_COM_CTR_SEND_DATA;

	header[10] = 0x04;
	header[11] = 0x0;

	header[12] = 0x17;
	header[13] = 0x01;

	header[14] = 0x0;
	header[15] = 0x0;

	header[16] = uartCheckSum(header + 10, 6);
	header[17] = 0x16;

	for (i = 0; i < 18; i++)
	{
		hal_uart1SendData(header[i]);
	}
}

void set_Center_Ack(u8 state)
{
	u8 header[20];
	u8 i;
	// header
	header[0] = 0x68;
	header[1] = 0x10;
	header[2] = 0xAA;
	header[3] = 0xAA;
	header[4] = 0xAA;
	header[5] = 0xAA;
	header[6] = 0xAA;
	header[7] = 0xAA;
	header[8] = 0xAA;

	header[9] = UART_COM_CTR_GET_RES_RESULT;

	header[10] = 0x03;
	header[11] = 0x0;

	header[12] = 0x18;
	header[13] = 0x01;

	header[14] = state;
	header[15] = uartCheckSum(header + 10, 5);
	header[16] = 0x16;

	for (i = 0; i < 17; i++)
	{
		hal_uart1SendData(header[i]);
	}
}

void set_Center(u16 x, u16 y, u16 w, u16 h)
{
	if (x >= 640)
	{
		x = 0;
	}
	if (y >= 480)
	{
		y = 0;
	}

	// w=(w+ 0x1f) & (~0x1f);//32bit
	// h=h & ~1;//2
	if (w > 640)
	{
		w = 640;
	}
	if (h > 480)
	{
		h = 480;
	}

	// deg_Printf("-----=x=%d,y=%d,w=%d,h=%d--------------------.\n",x,y,w,h);
	configSet(CONFIG_ID_CENTER_X, x);
	configSet(CONFIG_ID_CENTER_Y, y);
	configSet(CONFIG_ID_MJPEG_W, w);
	configSet(CONFIG_ID_MJPEG_H, h);
	userConfigSave();

	set_Center_Ack(0x01);
}

void get_Center(void)
{
	u8 header[24];
	u8 i;
	// header
	header[0] = 0x68;
	header[1] = 0x10;
	header[2] = 0xAA;
	header[3] = 0xAA;
	header[4] = 0xAA;
	header[5] = 0xAA;
	header[6] = 0xAA;
	header[7] = 0xAA;
	header[8] = 0xAA;

	header[9] = UART_COM_CTR_SEND_RES;

	header[10] = 0x0a;
	header[11] = 0x0;

	header[12] = 0x19;
	header[13] = 0x01;

	header[14] = configGet(CONFIG_ID_CENTER_X) & 0xFF;
	header[15] = (configGet(CONFIG_ID_CENTER_X) >> 8) & 0xFF;

	header[16] = configGet(CONFIG_ID_CENTER_Y) & 0xFF;
	header[17] = (configGet(CONFIG_ID_CENTER_Y) >> 8) & 0xFF;

	header[18] = configGet(CONFIG_ID_MJPEG_W) & 0xFF;
	header[19] = (configGet(CONFIG_ID_MJPEG_W) >> 8) & 0xFF;

	header[20] = configGet(CONFIG_ID_MJPEG_H) & 0xFF;
	header[21] = (configGet(CONFIG_ID_MJPEG_H) >> 8) & 0xFF;

	// deg_Printf("x=0x%x,y=0x%x,w=0x%x,h=0x%x.\n",configGet(CONFIG_ID_CENTER_X),configGet(CONFIG_ID_CENTER_Y),configGet(CONFIG_ID_MJPEG_W),configGet(CONFIG_ID_MJPEG_H));
	// deg_Printf("x=0x%x,0x%x,\n",header[14],header[15]);
	// deg_Printf("y=0x%x,0x%x,\n",header[16],header[17]);
	// deg_Printf("w=0x%x,0x%x,\n",header[18],header[19]);
	// deg_Printf("h=0x%x,0x%x,\n",header[20],header[21]);

	header[22] = uartCheckSum(header + 10, 12);
	header[23] = 0x16;

	for (i = 0; i < 24; i++)
	{
		hal_uart1SendData(header[i]);
	}
}

void btcomInit(void)
{

	// 注删蓝牙数据接收
	hal_uartRXIsrRegister(prvRxIsr);
	hal_uart1Init();
	RxbufFree();
}

/**
 * 蓝牙通讯反初始化
 *
 */
void btcomUninit(void)
{
	// 不再接收数据
	hal_uartRXIsrRegister(NULL);
	RxbufFree();
}

void btcomService(void)
{
	u16 x, y, w, h;

	if (PrvRxbuf[0] == 0)
	{
		return;
	}

	if (PrvRxFlag && PrvRxEn)
	{
		switch (PrvRxbuf[9])
		{
		case UART_COM_CTR_GET_DATA:
		{
			send_pack(PrvRxbuf[13]); // 发第几包数据
			break;
		}
		case UART_COM_CTR_SET_RES: // 设置中心点，
		{
			x = PrvRxbuf[13] | PrvRxbuf[14] << 8;
			y = PrvRxbuf[15] | PrvRxbuf[16] << 8;
			w = PrvRxbuf[17] | PrvRxbuf[18] << 8;
			h = PrvRxbuf[19] | PrvRxbuf[20] << 8;
			set_Center(x, y, w, h);
			break;
		}
		case UART_COM_CTR_GET_RES: // 获取中心点，
		{
			get_Center();
			break;
		}
		default:
		{
			break;
		}
		}

		RxbufFree();
	}

	if (PrvRxFlag) // 超时检测
	{
		if (tick > 0 && (XOSTimeGet() - tick) >= 5000 && PrvRxLen > 0)
		{
			RxbufFree();
			tick = 0;
			deg_Printf("rev timeout 5s.\n");
		}
	}
}
