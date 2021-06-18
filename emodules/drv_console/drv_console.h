// See LICENSE for license details.

#ifndef _DRV_ENCLAVE_CONSOLE_H
#define _DRV_ENCLAVE_CONSOLE_H

#include <stdint.h>
#include "drv_ctrl.h"

#define CONSOLE_CMD_INIT    0
#define CONSOLE_CMD_PUT     1
#define CONSOLE_CMD_GET     2
#define CONSOLE_CMD_DESTORY 3
#define CONSOLE_REG_ADDR    0x02500400
#define CONSOLE_REG_SIZE    0x400

#endif
