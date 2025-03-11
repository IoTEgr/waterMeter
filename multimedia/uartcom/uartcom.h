#ifndef __UART_COM__
#define __UART_COM__

// 在文件顶部添加结构体定义
typedef struct
{
    u16 x;
    u16 y;
    u16 width;
    u16 height;
} ImagePositionInfo;

// 修改btcomCmdRsp函数参数或在包头中加入该结构

void btcomInit(void);
void btcomUninit(void);

void btcomCmdRsp(const u8 *data, int len, u8 pack_total, u8 pack_cur);

void btcomService(void);

void btcomCmdFail(void);

#endif // __UART_COM__
