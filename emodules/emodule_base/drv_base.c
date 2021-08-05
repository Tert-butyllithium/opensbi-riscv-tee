#include "drv_base.h"
#ifndef __ASSEMBLER__
#include "drv_mem.h"
#endif
#include "drv_util.h"
#include "drv_list.h"

#define PUSH(usr_sp, val) \
	(usr_sp) -= 8;    \
	*(uintptr_t *)(usr_sp) = val;
uintptr_t enclave_id;
drv_ctrl_t* peri_reg_list[MAX_DRV] = {0};
drv_initer drv_init_list[MAX_DRV];
drv_addr_t *drv_addr_list;


uintptr_t init_usr_stack(uintptr_t usr_sp)
{
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


void init_other_driver() {
	// int i = 0;
    // drv_initer local_init[64] = {init_console_driver};
    //                             //  init_rtc_driver};
    // // drv_initer local_init[64] = {0};
    // for (; i < MAX_DRV; i++) {
    //     if (local_init[i]) {
    //         drv_init_list[i] = local_init[i];
    //         peri_reg_list[i] = drv_init_list[i]();
    //     }
    // }
    peri_reg_list[0] = init_console_driver();
	peri_reg_list[1] = init_net_driver();
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

static void test(uintptr_t va)
{
	static uintptr_t pa = 0x48808000;
	map_page(NULL, va, pa, 1, -1);
	printd("[S mode test] log 1\n");
	pa += EPAGE_SIZE;
	printd("[S mode test] log 2\n");
	SBI_CALL5(0xdeadbeef, va, read_csr(satp), 0, 0); // dump pte in m mode
	uintptr_t *ptr = (uintptr_t*)va;
	uintptr_t content = *ptr;
	printd("[S mode test] memory dump of %p: 0x%lx\n",
		ptr, content);
}

void prepare_boot(uintptr_t usr_pc, uintptr_t usr_sp) {
	printd("[prepare_boot] peri_reg_list: %p at %p\n", peri_reg_list, &peri_reg_list);
	printd("\033[0;32m[prepare_boot] enclave_id: 0x%lx at %p\n\033[0m", enclave_id, &enclave_id);
	printd("\033[0;32m[prepare_boot] drv_addr_list: %p at %p\n\033[0m", drv_addr_list, &drv_addr_list);

	init_other_driver();

	/* allow S mode access U mode memory */
	uintptr_t sstatus = read_csr(sstatus);
	printd("[prepare_boot] sstatus = 0x%lx\n", sstatus);
	sstatus |= SSTATUS_SUM;
	sstatus &= ~SSTATUS_SPP;
	write_csr(sstatus, sstatus);
	usr_sp = init_usr_stack(usr_sp);
	/* allow S mode trap/interrupt */
	uintptr_t sie = SIE_SEIE | SIE_SSIE;
	write_csr(sie, sie);

	printd("[prepare_boot] usr_pc = 0x%lx\n", usr_pc);
	/* set user entry */
	write_csr(sepc, usr_pc);
	printd("[prepare_boot] usr_sp = 0x%lx\n", usr_sp);
	write_csr(sscratch, usr_sp);
}
