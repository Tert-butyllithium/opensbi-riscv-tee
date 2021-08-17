#include "drv_base.h"
#ifndef __ASSEMBLER__
#include "drv_mem.h"
#endif
#include "drv_util.h"
#include "drv_list.h"

#define PUSH(usr_sp, val) ({\
	(usr_sp) -= 8;    \
	*(uintptr_t *)(usr_sp) = val;})
uintptr_t enclave_id;
drv_ctrl_t *peri_reg_list[MAX_DRV] = { 0 };
drv_initer drv_init_list[MAX_DRV];
drv_addr_t *drv_addr_list;

uintptr_t init_usr_stack(uintptr_t usr_sp)
{
	for (int i = 0; i < 100; i++)
		PUSH(usr_sp, 0);
	return usr_sp;
}

void init_other_driver()
{
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
	peri_reg_list[1] = init_rtc_driver();
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

void prepare_boot(uintptr_t usr_pc, uintptr_t usr_sp)
{
	init_other_driver();

	/* allow S mode access U mode memory */
	uintptr_t sstatus = read_csr(sstatus);
	sstatus |= SSTATUS_SUM;
	sstatus &= ~SSTATUS_SPP;
	write_csr(sstatus, sstatus);
	usr_sp = init_usr_stack(usr_sp);
	/* allow S mode trap/interrupt */
	uintptr_t sie = SIE_SEIE | SIE_SSIE;
	write_csr(sie, sie);

	/* set user entry */
	write_csr(sepc, usr_pc);
	write_csr(sscratch, usr_sp);
}
