#include <sbi/sbi_ecall.h>
#include <sbi/sbi_ecall_interface.h>
#include <sbi/sbi_ecall_ebi_enclave.h>
#include <sbi/sbi_error.h>
#include <sbi/sbi_trap.h>
#include <sbi/sbi_version.h>
#include <sbi/riscv_asm.h>
#include <sbi/sbi_console.h>
#include <sbi/sbi_ecall_ebi_dma.h>

extern char _base_start, _base_end;
extern char _enclave_start, _enclave_end;

static void inline mem_dump(uintptr_t addr, uintptr_t len)
{
	sbi_printf("[m mode mem_dump] start ----------------------");
	unsigned char *ptr = (unsigned char *)addr;
	for (int i = 0; i < len; i++) {
		if (i % 8 == 0)
			sbi_printf("\n0x%p:\t", ptr);
		sbi_printf("0x%x\t", *ptr++);
	}
	sbi_printf("\n[m mode mem_dump] end ------------------------\n");
}


#define MASK_OFFSET 0xfff
#define MASK_L0 0x1ff000
#define MASK_L1 0x3fe00000
#define MASK_L2 0x7fc0000000

uintptr_t get_pa(uintptr_t va, uintptr_t pt_root_addr)
{
	uintptr_t l[] = { (va & MASK_L2) >> 30, (va & MASK_L1) >> 21,
			  (va & MASK_L0) >> 12 };
	pte *root = (pte *)pt_root_addr;
	pte tmp_entry;
	uintptr_t tmp;
	int i = 0;
	while (1) {
		sbi_printf("[M mode get_pa] i = %d, root = %p, offset = 0x%lx\n",
				i, root, l[i]);
		tmp_entry = root[l[i]];
		sbi_printf("[M mode get_pa] pte @ %p, pte = 0x%lx\n", &root[l[i]], *(uintptr_t *)&tmp_entry);
		if (i == 1)
			mem_dump((uintptr_t)root, 4096);
		if (!tmp_entry.pte_v) {
			sbi_printf("ERROR: va:0x%lx is not valid!!!\n", va);
			return 0;
		}
		if ((tmp_entry.pte_r | tmp_entry.pte_w | tmp_entry.pte_x)) {
			break;
		}
		tmp  = tmp_entry.ppn << 12;
		root = (pte *)tmp;
		i++;
	}
	if (i == 2)
		return (tmp_entry.ppn << 12) | (va & 0xfff);
	else if (i == 1)
		return (tmp_entry.ppn >> 9) << 21 | (va & 0x1fffff);
	else {
		return 0;
	}
}

static int sbi_ecall_debug_handler(struct sbi_scratch *scratch,
				 unsigned long extid, unsigned long funcid,
				 unsigned long *args, unsigned long *out_val,
				 struct sbi_trap_info *out_trap)
{
	sbi_printf("[debug_handler] ############## DEBUG START ###########\n");
										// mem_dump(0x48000000, 16);
										// mem_dump(0x50000000, 16);
										// dma_copy(0x48000000, 0x50000000, 4096);
										// mem_dump(0x50000000, 16);
	uintptr_t pa = args[0];
	uintptr_t *ptr = (uintptr_t *)pa;

	sbi_printf("%p: 0x%lx\n", ptr, *ptr);

	// uintptr_t satp, va, pt_root_addr, pa;
	// va = args[0];
	// satp = args[1];
	// pt_root_addr = satp << 12;

	// pa = get_pa(va, pt_root_addr);
	// sbi_printf("pa = 0x%lx\n", pa);

	sbi_printf("[debug_handler] ############## DEBUG END ###########\n");
	return 0;
}

struct sbi_ecall_extension ecall_debug = {
	.extid_start = SBI_EXT_DEBUG,
	.extid_end   = SBI_EXT_DEBUG,
	.handle	     = sbi_ecall_debug_handler,
};
