#pragma once
#ifndef __ASSEMBLER__
#include "stdint.h"
#include "drv_mem.h"
#include "drv_util.h"
#include "enclave.h"

#define DRV_CONSOLE 0
#define DRV_RTC 1

typedef drv_ctrl_t *(*drv_initer)();

extern drv_ctrl_t *peri_reg_list[MAX_DRV];
extern drv_initer drv_init_list[MAX_DRV];
extern drv_addr_t *drv_addr_list;

drv_ctrl_t *init_console_driver();
drv_ctrl_t *init_rtc_driver();

#endif