#ifndef __UART_COM__
#define __UART_COM__


void btcomInit(void);
void btcomUninit(void);

void btcomCmdRsp(const u8 *data, int len,u8 pack_total,u8 pack_cur);

void btcomService(void);

void btcomCmdFail(void);


#endif // __UART_COM__


