#include "drv_list.h"
#include "drv_page_pool.h"
#include "../drv_console/drv_console.h"

drv_ctrl_t* init_console_driver() {
    uintptr_t drv_console_start, drv_console_end, console_drv_size, console_va;
    size_t n_console_drv_pages;
    cmd_handler console_handler;
    drv_ctrl_t* console_ctrl;

    printd("[init_console_driver]\n");
    // extern char _drv_enclave_console_start, _drv_enclave_console_end;

    // if(!drv_addr_list){
    //     drv_addr_list = 0xc0708028;
    //     printd("\033[0;32mHere, I found the address becoming 0 and change it to 0x%p\n\033[0m",drv_addr_list);
    // }
    printd("\033[0;32m[init_console_driver] drv_addr_list: 0x%p\n\033[0m", drv_addr_list);
    drv_console_start = drv_addr_list[DRV_CONSOLE].drv_start;
    drv_console_end = drv_addr_list[DRV_CONSOLE].drv_end;
    printd("[init_console_driver] drv_console_start: 0x%x drv_console_end: 0x%x\n", drv_console_start, drv_console_end);

    console_drv_size = drv_console_end - drv_console_start;
    n_console_drv_pages = (PAGE_UP(console_drv_size)) >> EPAGE_SHIFT;
    printd("[init_console_driver] drv_size: 0x%lx, n_console_drv_pages: 0x%lx at %p\n",console_drv_size, n_console_drv_pages, &n_console_drv_pages);
 
    map_page((pte *)pt_root, drv_console_start, drv_console_start - EDRV_VA_PA_OFFSET, n_console_drv_pages, PTE_V | PTE_X | PTE_W | PTE_R);
    printd("[init_console_driver] after map_page\n");
    
    console_handler = (cmd_handler)drv_console_start;

    console_ctrl = (drv_ctrl_t*)console_handler(QUERY_INFO, 0, 0, 0);
    printd("%x\n", console_ctrl->reg_addr);
    
    console_va = ioremap((pte *)pt_root, console_ctrl->reg_addr, console_ctrl->reg_size);
    printd("%x\n", console_va);
    printd("\033[0;36m[init_console_driver] console_handler at %p\n\033[0m",console_handler);
    console_handler(CONSOLE_CMD_INIT, console_va, 0, 0);
    console_handler(CONSOLE_CMD_PUT, 'c', 0,0);
    console_handler(CONSOLE_CMD_PUT, 'o', 0,0);
    console_handler(CONSOLE_CMD_PUT, 'm', 0,0);
    console_handler(CONSOLE_CMD_PUT, 'p', 0,0);
    console_handler(CONSOLE_CMD_PUT, 'a', 0,0);
    console_handler(CONSOLE_CMD_PUT, 's', 0,0);
    console_handler(CONSOLE_CMD_PUT, 's', 0,0);
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