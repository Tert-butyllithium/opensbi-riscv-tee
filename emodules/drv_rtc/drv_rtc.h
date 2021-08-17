// See LICENSE for license details.

#ifndef _DRV_ENCLAVE_RTC_H
#define _DRV_ENCLAVE_RTC_H

#include <stdint.h>
#include "../util/drv_ctrl.h"
#include "../emodule_base/drv_util.h"

#define RTC_CMD_INIT 0
#define RTC_CMD_GET 1

#define RTC_BASE  0x07090000
#define RTC_GENERAL(n) 			(RTC_BASE + 0x100 + ((n)*4))
#define ALARM0_CUR_VLU_REG 0x24

#endif
