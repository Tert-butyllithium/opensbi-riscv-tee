#include "drv_list.h"
#include "drv_page_pool.h"
#include "../drv_console/drv_console.h"

drv_ctrl_t* init_console_driver() {
    printd("[init_console_driver]\n");
    // extern char _drv_enclave_console_start, _drv_enclave_console_end;
    printd("[init_console_driver] drv_addr_list @ %p\n", drv_addr_list);
    uintptr_t drv_console_start = drv_addr_list[DRV_CONSOLE].drv_start;
    uintptr_t drv_console_end = drv_addr_list[DRV_CONSOLE].drv_end;
    printd("[init_console_driver] drv_console_start: 0x%x drv_console_end: 0x%x\n", drv_console_start, drv_console_end);

    uintptr_t console_drv_size = drv_console_end - drv_console_start;
    size_t n_console_drv_pages = (PAGE_UP(console_drv_size)) >> EPAGE_SHIFT;
    map_page((pte *)pt_root, drv_console_start, drv_console_start - EDRV_VA_PA_OFFSET, n_console_drv_pages, PTE_V | PTE_X | PTE_W | PTE_R);

    cmd_handler console_handler = (cmd_handler)drv_console_start;

    drv_ctrl_t* console_ctrl = (drv_ctrl_t*)console_handler(QUERY_INFO, 0, 0, 0);
    printd("%x\n", console_ctrl->reg_addr);
    
    uintptr_t console_va = ioremap((pte *)pt_root, console_ctrl->reg_addr, console_ctrl->reg_size);
    printd("%x\n", console_va);
    console_handler(CONSOLE_CMD_INIT, console_va, 0, 0);
    console_handler(CONSOLE_CMD_PUT, 'c', 0,0);
    console_handler(CONSOLE_CMD_PUT, '\n', 0,0);
    return console_ctrl;
}

// drv_ctrl_t* init_rtc_driver() {
//     printd("init rtc driver\n");

//     uintptr_t drv_rtc_start = drv_addr_list[DRV_RTC].drv_start,
//               drv_rtc_end = drv_addr_list[DRV_RTC].drv_end;
//     printd("rtc driver: %x ... %x\n", drv_rtc_start, drv_rtc_end);

//     uintptr_t drv_rtc_size = drv_rtc_end - drv_rtc_start;
//     size_t n_drv_rtc_pages = (PAGE_UP(drv_rtc_size)) >> EPAGE_SHIFT;
//     map_page((pte *)pt_root, drv_rtc_start, drv_rtc_start - EDRV_VA_PA_OFFSET, n_drv_rtc_pages, PTE_V | PTE_X | PTE_W | PTE_R);

//     cmd_handler rtc_handler = (cmd_handler)drv_rtc_start;

//     drv_ctrl_t* rtc_ctrl = (drv_ctrl_t*)rtc_handler(QUERY_INFO, 0, 0, 0);
//     printd("RTC reg phy addr: %x\n", rtc_ctrl->reg_addr);
//     uintptr_t rtc_reg_va = ioremap((pte *)pt_root, rtc_ctrl->reg_addr, rtc_ctrl->reg_size);
//     printd("RTC reg vir addr: %x\n", rtc_reg_va);

//     rtc_handler(RTC_CMD_INIT, rtc_reg_va, 0, 0);
//     uintptr_t init_time = rtc_handler(RTC_CMD_GET_TIME, 0, 0, 0);
//     printd("RTC time: %lld\n", init_time);

//     // for (uintptr_t time = rtc_handler(RTC_CMD_GET_TIME, 0, 0, 0) / 1000000000;
//     //      (time - init_time / 1000000000) < 3;
//     //      time = rtc_handler(RTC_CMD_GET_TIME, 0, 0, 0) / 1000000000)
//     //     printd("Count down: %d\r", 3 - (time - init_time / 1000000000));

//     return rtc_ctrl;
// }