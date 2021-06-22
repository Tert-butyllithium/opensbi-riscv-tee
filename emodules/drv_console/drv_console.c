// See LICENSE for license details.

// #include <string.h>
// #include <stdarg.h>
// #include <assert.h>
#include "drv_console.h"

volatile uint8_t* uart16550;
// some devices require a shifted register index
// (e.g. 32 bit registers instead of 8 bit registers)
uintptr_t uart16550_reg_shift;
uintptr_t uart16550_clock = 3686400;   // a "common" base clock

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


// We cannot use the word DEFAULT for a parameter that cannot be overridden due to -Werror
#ifndef UART_DEFAULT_BAUD
#define UART_DEFAULT_BAUD  38400
#endif
drv_ctrl_t ctrl = {
    .reg_addr = CONSOLE_REG_ADDR,
    .reg_size = CONSOLE_REG_SIZE,
  };
int uart16550_putchar(uint8_t ch)
{
  while ((uart16550[UART_REG_LSR << uart16550_reg_shift] & UART_REG_STATUS_TX) == 0);
  uart16550[UART_REG_QUEUE << uart16550_reg_shift] = ch;
  return 0;
}

int uart16550_getchar(uint8_t* ch)
{
  while ((uart16550[UART_REG_LSR << uart16550_reg_shift] & UART_REG_STATUS_RX) == 0);
  *ch = uart16550[UART_REG_QUEUE << uart16550_reg_shift];
  return 0;
}

int uart16550_destroy()
{
  return 0;
}

int uart16550_init(uintptr_t reg_addr) 
{
    // uint32_t clock_freq;

    // uint32_t divisor = uart16550_clock / (16 * UART_DEFAULT_BAUD);
    // // If the divisor is out of range, don't assert, set the rate back to the default
    // if (divisor >= 0x10000u)
    //     divisor = uart16550_clock / (16 * UART_DEFAULT_BAUD);

    uart16550 = (void*)reg_addr;
    uart16550_reg_shift = 0;
    
    uart16550[UART_REG_IER << uart16550_reg_shift] = 0x00;                // Disable all interrupts
    uart16550[UART_REG_LCR << uart16550_reg_shift] = 0x03;                // Enable DLAB (set baud rate divisor)
    // uart16550[UART_REG_DLL << uart16550_reg_shift] = (uint8_t)divisor;    // Set divisor (lo byte)
    // uart16550[UART_REG_DLM << uart16550_reg_shift] = (uint8_t)(divisor >> 8);     //     (hi byte)
    // uart16550[UART_REG_LCR << uart16550_reg_shift] = 0x03;                // 8 bits, no parity, one stop bit
    // uart16550[UART_REG_FCR << uart16550_reg_shift] = 0xC7;                // Enable FIFO, clear them, with 14-byte threshold
    return 0;
}


uintptr_t uart16550_cmd_handler(uintptr_t cmd, uintptr_t arg0, uintptr_t arg1, uintptr_t arg2) __attribute__((section(".text.init")));
uintptr_t uart16550_cmd_handler(uintptr_t cmd, uintptr_t arg0, uintptr_t arg1, uintptr_t arg2) 
{
  switch (cmd)
  {
  case QUERY_INFO:
    return (uintptr_t)&ctrl;
  case CONSOLE_CMD_INIT:
    return uart16550_init(arg0);
  case CONSOLE_CMD_PUT: 
    return uart16550_putchar((uint8_t)(arg0 & 0xff));
  case CONSOLE_CMD_GET:
    return uart16550_getchar((uint8_t *)arg0);
  case CONSOLE_CMD_DESTORY:
    return uart16550_destroy();
  default:
    return -1;
  }
}