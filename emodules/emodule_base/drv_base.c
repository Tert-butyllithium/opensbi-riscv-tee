#include "drv_base.h"
#ifndef __ASSEMBLER__
#include "drv_mem.h"
#endif
#include "drv_util.h"
#include "drv_list.h"

#define PUSH(usr_sp, val) (usr_sp) -= 8; *(uintptr_t*)(usr_sp) = val;
uintptr_t enclave_id;
drv_ctrl_t* peri_reg_list[MAX_DRV] = {0};
drv_initer drv_init_list[MAX_DRV];
extern drv_addr_t* drv_addr_list;

uintptr_t init_usr_stack(uintptr_t usr_sp) {
    PUSH(usr_sp, 0);
    PUSH(usr_sp, 0);
    PUSH(usr_sp, 1); 
    PUSH(usr_sp, 12);
    PUSH(usr_sp, 1);
    PUSH(usr_sp, 11); 
    PUSH(usr_sp, 1); 
    PUSH(usr_sp, 18); 
    PUSH(usr_sp, 1); 
    PUSH(usr_sp, 13); 
    PUSH(usr_sp, 0xdeaddead); 
    PUSH(usr_sp, 25); 
    PUSH(usr_sp, 0); 
    PUSH(usr_sp, 23); 
    PUSH(usr_sp, 0); 
    PUSH(usr_sp, 31); 
    PUSH(usr_sp, EPAGE_SIZE); 
    PUSH(usr_sp, 6); 
    PUSH(usr_sp, 0); 
    PUSH(usr_sp, 32); 
    PUSH(usr_sp, 0x112d); 
    PUSH(usr_sp, 16); 

    PUSH(usr_sp, 0); 

    PUSH(usr_sp, 0x16);
    PUSH(usr_sp, 0x39);
    PUSH(usr_sp, 0x0);

    PUSH(usr_sp, 0x3);
    return usr_sp;
}

void *  memset (void *a, int b, size_t c) {
    return a;
}

void init_other_driver() {
    // drv_initer local_init[64] = {init_console_driver};
    //                             //  init_rtc_driver};
    // // drv_initer local_init[64] = {0};
    // for (int i = 0; i < MAX_DRV; i++) {
    //     if (local_init[i]) {
    //         drv_init_list[i] = local_init[i];
    //         peri_reg_list[i] = drv_init_list[i]();
    //     }
    // }
    peri_reg_list[0] = init_console_driver();
}

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


void prepare_boot(uintptr_t usr_pc, uintptr_t usr_sp) {
    printd("[prepare_boot] peri_reg_list @ %p at %p\n", peri_reg_list, &peri_reg_list);
    printd("\033[0;32m[prepare_boot] enclave_id @ 0x%lx at 0x%p\n\033[0m", enclave_id, &enclave_id);
    printd("\033[0;32m[prepare_boot] drv_addr_list @ 0x%p at 0x%p\n\033[0m", drv_addr_list, &drv_addr_list);
    SBI_ECALL(0xdeadbeaf,0x40706408,0,0);
    // printd("[prepare_boot] 0x%lx\n",*(unsigned long * )0x40706408);
    init_other_driver();
    // printd("[prepare_boot] 1\n");
    /* allow S mode access U mode memory */
    uintptr_t sstatus = read_csr(sstatus);
    sstatus |= SSTATUS_SUM;
    write_csr(sstatus, sstatus);
    usr_sp = init_usr_stack(usr_sp);
    /* allow S mode trap/interrupt */
    uintptr_t sie = SIE_SEIE | SIE_SSIE;
    write_csr(sie, sie);

    printd("[prepare_boot] 2\n");

    /* disable user interrupt, stop S mode priv */
    sstatus = sstatus & ~(SSTATUS_SPP | SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SUM);
    // sstatus |= SSTATUS_SPIE | SSTATUS_SIE;
    write_csr(sstatus, sstatus);

    printd("[prepare_boot] usr_pc = 0x%lx\n", usr_pc);
    /* set user entry */
    write_csr(sepc, usr_pc);
    printd("[prepare_boot] usr_sp = 0x%lx\n", usr_sp);
    write_csr(sscratch, usr_sp);
}
