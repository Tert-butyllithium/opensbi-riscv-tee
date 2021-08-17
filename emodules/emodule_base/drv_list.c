#include "drv_list.h"
#include "mm/drv_page_pool.h"
#include "mm/page_table.h"
#include "../drv_console/drv_console.h"
#include "../drv_rtc/drv_rtc.h"

drv_ctrl_t *init_console_driver()
{
	uintptr_t drv_console_start, console_va;
	cmd_handler console_handler;
	drv_ctrl_t *console_ctrl;

	drv_console_start = drv_addr_list[DRV_CONSOLE].drv_start;
	console_handler	  = (cmd_handler)drv_console_start;

	console_ctrl = (drv_ctrl_t *)console_handler(QUERY_INFO, 0, 0, 0);

	console_va = ioremap(NULL, console_ctrl->reg_addr, 1024);
	SBI_CALL5(0x19260817, console_ctrl->reg_addr, console_va,
		  PAGE_UP(console_ctrl->reg_size), 420);
	console_handler(CONSOLE_CMD_INIT, console_va, 0, 0);
	return console_ctrl;
}

drv_ctrl_t* init_rtc_driver() {
    printd("init rtc driver\n");

    // uintptr_t drv_rtc_start = drv_addr_list[DRV_RTC].drv_start,
    //           drv_rtc_end = drv_addr_list[DRV_RTC].drv_end;
    // printd("rtc driver: %x ... %x\n", drv_rtc_start, drv_rtc_end);

    // uintptr_t drv_rtc_size = drv_rtc_end - drv_rtc_start;
    // size_t n_drv_rtc_pages = (PAGE_UP(drv_rtc_size)) >> EPAGE_SHIFT;
    // map_page(NULL, drv_rtc_start, drv_rtc_start - ENC_VA_PA_OFFSET, n_drv_rtc_pages, PTE_V | PTE_X | PTE_W | PTE_R);

    cmd_handler rtc_handler = (cmd_handler) drv_addr_list[DRV_RTC].drv_start;

    drv_ctrl_t* rtc_ctrl = (drv_ctrl_t*)rtc_handler(QUERY_INFO, 0, 0, 0);
    printd("RTC reg phy addr: %x\n", rtc_ctrl->reg_addr);
    uintptr_t rtc_reg_va = ioremap(NULL, rtc_ctrl->reg_addr, rtc_ctrl->reg_size);

	SBI_CALL5(0x19260817, rtc_ctrl->reg_addr, rtc_reg_va,
		  PAGE_UP(rtc_ctrl->reg_size), 420);

    printd("RTC reg vir addr: %x\n", rtc_reg_va);

    rtc_handler(RTC_CMD_INIT, rtc_reg_va, 0, 0);
    uintptr_t init_time = rtc_handler(RTC_CMD_GET, 0, 0, 0);
    printd("RTC time: %lld\n", init_time);

    // for (uintptr_t time = rtc_handler(RTC_CMD_GET_TIME, 0, 0, 0) / 1000000000;
    //      (time - init_time / 1000000000) < 3;
    //      time = rtc_handler(RTC_CMD_GET_TIME, 0, 0, 0) / 1000000000)
    //     printd("Count down: %d\r", 3 - (time - init_time / 1000000000));

    return rtc_ctrl;
}