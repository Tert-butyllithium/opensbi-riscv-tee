#pragma once
#include <stdint.h>

typedef uintptr_t (*cmd_handler)(uintptr_t cmd, uintptr_t arg0, uintptr_t arg1, uintptr_t arg2);
typedef struct {
    uintptr_t reg_addr;
    uintptr_t reg_size;
}drv_ctrl_t; 
typedef struct 
{
    uintptr_t drv_start;
    uintptr_t drv_end;
    int using_by;
}drv_addr_t;


#define MAX_DRV  64
#define QUERY_INFO -1