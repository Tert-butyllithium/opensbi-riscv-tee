// See LICENSE for license details.

// #include <string.h>
// #include <stdarg.h>
// #include <assert.h>
#include "drv_rtc.h"


static volatile uint32_t* rtc_base;

// We cannot use the word DEFAULT for a parameter that cannot be overridden due to -Werror
drv_ctrl_t ctrl = {
    .reg_addr = RTC_BASE,
    .reg_size = 0x400,
  };

// #define SBI_ECALL(__num, __a0, __a1, __a2)                                    \
// 	({                                                                    \
// 		register unsigned long a0 asm("a0") = (unsigned long)(__a0);  \
// 		register unsigned long a1 asm("a1") = (unsigned long)(__a1);  \
// 		register unsigned long a2 asm("a2") = (unsigned long)(__a2);  \
// 		register unsigned long a7 asm("a7") = (unsigned long)(__num); \
// 		asm volatile("ecall"                                          \
// 			     : "+r"(a0)                                       \
// 			     : "r"(a1), "r"(a2), "r"(a7)                      \
// 			     : "memory");                                     \
// 		a0;                                                           \
// 	})

int rtc_init(unsigned long base){
  	rtc_base = (volatile uint32_t*)base;
	return 0;
}

uintptr_t rtc_get(){
  return rtc_base[ALARM0_CUR_VLU_REG];
}


uintptr_t rtc_cmd_handler(uintptr_t cmd, uintptr_t arg0, uintptr_t arg1, uintptr_t arg2) __attribute__((section(".text.init")));
uintptr_t rtc_cmd_handler(uintptr_t cmd, uintptr_t arg0, uintptr_t arg1, uintptr_t arg2) 
{
  // SBI_ECALL(0xdeadbeaf,arg0,cmd,0x2333); 
  switch (cmd)
  {
  case QUERY_INFO:
    return (uintptr_t)&ctrl;
  case RTC_CMD_INIT:
    return rtc_init(arg0);
  case RTC_CMD_GET:
    return rtc_get();
  default:
    return -1;
  }
}