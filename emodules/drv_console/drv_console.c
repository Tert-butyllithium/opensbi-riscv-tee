// See LICENSE for license details.

// #include <string.h>
// #include <stdarg.h>
// #include <assert.h>
#include "drv_console.h"


#define UART_REG_QUEUE     0    // rx/tx fifo data
#define UART_REG_DLL       0    // divisor latch (LSB)
#define UART_REG_IER       1    // interrupt enable register
#define UART_REG_DLM       1    // divisor latch (MSB) 
#define UART_REG_FCR       2    // fifo control register
#define UART_REG_LCR       3    // line control register
#define UART_REG_MCR       4    // modem control register
#define UART_REG_LSR       0x1f    // line status register
#define UART_REG_MSR       6    // modem status register
#define UART_REG_SCR       7    // scratch register
#define UART_REG_STATUS_RX 0x04
#define UART_REG_STATUS_TX 0x02

#define SUNXI_UART_THR     0
#define SUNXI_UART_RBR     0
#define SUNXI_UART_USR     0x1F //addr:0x7C
#define SUNXI_UART_USR_NF  0x02
#define SUNXI_UART_USR_RFNE  0x04

static volatile uint32_t* sunxi_uart;

// We cannot use the word DEFAULT for a parameter that cannot be overridden due to -Werror
drv_ctrl_t ctrl = {
    .reg_addr = CONSOLE_REG_ADDR,
    .reg_size = CONSOLE_REG_SIZE,
  };

#define SBI_ECALL(__num, __a0, __a1, __a2)                                    \
	({                                                                    \
		register unsigned long a0 asm("a0") = (unsigned long)(__a0);  \
		register unsigned long a1 asm("a1") = (unsigned long)(__a1);  \
		register unsigned long a2 asm("a2") = (unsigned long)(__a2);  \
		register unsigned long a7 asm("a7") = (unsigned long)(__num); \
		asm volatile("ecall"                                          \
			     : "+r"(a0)                                       \
			     : "r"(a1), "r"(a2), "r"(a7)                      \
			     : "memory");                                     \
		a0;                                                           \
	})


int sunxi_uart_getc(void)
{
	if ((sunxi_uart[SUNXI_UART_USR] & SUNXI_UART_USR_RFNE) != 0)
		return sunxi_uart[SUNXI_UART_RBR];
	else
		return -1;
}

int sunxi_uart_init(unsigned long base)
{
  SBI_ECALL(0xdeadbeaf,sunxi_uart,&sunxi_uart,0);
	sunxi_uart = (volatile void *)base;
	return 0;
}

void sunxi_uart_putc(char ch)
{
	// while ((sunxi_uart[SUNXI_UART_USR] & SUNXI_UART_USR_NF) == 0);
	sunxi_uart[SUNXI_UART_THR] = ch;
  SBI_ECALL(0xdeadbeaf,sunxi_uart,&sunxi_uart,0);
}



uintptr_t uart16550_cmd_handler(uintptr_t cmd, uintptr_t arg0, uintptr_t arg1, uintptr_t arg2) __attribute__((section(".text.init")));
uintptr_t uart16550_cmd_handler(uintptr_t cmd, uintptr_t arg0, uintptr_t arg1, uintptr_t arg2) 
{
  // SBI_ECALL(0xdeadbeaf,arg0,cmd,0x2333); 
  switch (cmd)
  {
  case QUERY_INFO:
    return (uintptr_t)&ctrl;
  case CONSOLE_CMD_INIT:
    return sunxi_uart_init(arg0);
  case CONSOLE_CMD_PUT: 
    // return uart16550_putchar((uint8_t)(arg0 & 0xff));
    sunxi_uart_putc((char)arg0);
    // SBI_ECALL(0xdeadbeaf,arg0,cmd,0x19260817); 
    return 0;
  case CONSOLE_CMD_GET:
    return sunxi_uart_getc();
  // case CONSOLE_CMD_DESTORY:
  //   return uart16550_destroy();
  default:
    return -1;
  }
}