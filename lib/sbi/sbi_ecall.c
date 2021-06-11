/*
 * SPDX-License-Identifier: BSD-2-Clause
 *
 * Copyright (c) 2019 Western Digital Corporation or its affiliates.
 *
 * Authors:
 *   Anup Patel <anup.patel@wdc.com>
 */

#include <sbi/sbi_ecall.h>
#include <sbi/sbi_ecall_interface.h>
#include <sbi/sbi_error.h>
#include <sbi/sbi_trap.h>
#include <sbi/sbi_console.h>
#include <sbi/riscv_encoding.h>
#include <sbi/riscv_asm.h>

u16 sbi_ecall_version_major(void)
{
	return SBI_ECALL_VERSION_MAJOR;
}

u16 sbi_ecall_version_minor(void)
{
	return SBI_ECALL_VERSION_MINOR;
}

static SBI_LIST_HEAD(ecall_exts_list);

struct sbi_ecall_extension *sbi_ecall_find_extension(unsigned long extid)
{
	struct sbi_ecall_extension *t, *ret = NULL;

	sbi_list_for_each_entry(t, &ecall_exts_list, head)
	{
		if (t->extid_start <= extid && extid <= t->extid_end) {
			ret = t;
			break;
		}
	}

	return ret;
}

int sbi_ecall_register_extension(struct sbi_ecall_extension *ext)
{
	if (!ext || (ext->extid_end < ext->extid_start) || !ext->handle)
		return SBI_EINVAL;
	if (sbi_ecall_find_extension(ext->extid_start) ||
	    sbi_ecall_find_extension(ext->extid_end))
		return SBI_EINVAL;

	SBI_INIT_LIST_HEAD(&ext->head);
	sbi_list_add_tail(&ext->head, &ecall_exts_list);

	return 0;
}

void sbi_ecall_unregister_extension(struct sbi_ecall_extension *ext)
{
	bool found = FALSE;
	struct sbi_ecall_extension *t;

	if (!ext)
		return;

	sbi_list_for_each_entry(t, &ecall_exts_list, head)
	{
		if (t == ext) {
			found = TRUE;
			break;
		}
	}

	if (found)
		sbi_list_del_init(&ext->head);
}

int sbi_ecall_handler(u32 hartid, ulong mcause, struct sbi_trap_regs *regs,
		      struct sbi_scratch *scratch)
{
	int ret = 0;
	struct sbi_ecall_extension *ext;
	unsigned long extension_id = regs->a7;
	unsigned long func_id	   = regs->a6;
	struct sbi_trap_info trap  = { 0 };
	unsigned long out_val	   = 0;
	bool is_0_1_spec	   = 0;
	unsigned long args[6];
	ulong mtval = csr_read(CSR_MTVAL), mtval2 = 0, mtinst = 0;
	ulong prev_mode = (regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;

	if (prev_mode == 0) {
		if (regs->a6 != 0x233) {
			// sbi_printf("illegal exception %lx, %lx!\n", mcause, extension_id);
			// sbi_printf("return to %lx\n",regs->mepc);
			// regs->mstatus |= 1 << MSTATUS_MPP_SHIFT;
			trap.epc   = regs->mepc;
			trap.cause = mcause;
			trap.tval  = mtval;
			trap.tval2 = mtval2;
			trap.tinst = mtinst;
			sbi_trap_redirect(regs, &trap, scratch);
			return 0;
		} else {
			sbi_printf("[sbi_ecall_handler] EBI call number: %lu\n", extension_id);
		}
	}

	args[0] = regs->a0;
	args[1] = regs->a1;
	args[2] = regs->a2;
	args[3] = regs->a3;
	args[4] = regs->a4;
	args[5] = regs->a5;

	ext = sbi_ecall_find_extension(extension_id);

	if (ext && ext->handle) {
		ret = ext->handle(scratch, extension_id, func_id, args,
				  &out_val, &trap);
		if (extension_id >= SBI_EXT_0_1_SET_TIMER &&
		    extension_id <= SBI_EXT_0_1_SHUTDOWN)
			is_0_1_spec = 1;
	} else {
		ret = SBI_ENOTSUPP;
	}

	if (ret == SBI_ETRAP) {
		trap.epc = regs->mepc;
		sbi_trap_redirect(regs, &trap, scratch);
	} else {
		/* This function should return non-zero value only in case of
		 * fatal error. However, there is no good way to distinguish
		 * between a fatal and non-fatal errors yet. That's why we treat
		 * every return value except ETRAP as non-fatal and just return
		 * accordingly for now. Once fatal errors are defined, that
		 * case should be handled differently.
		 */
		regs->mepc += 4;
		regs->a0 = ret;
		if (!is_0_1_spec)
			regs->a1 = out_val;
	}

	return 0;
}

int sbi_ecall_init(void)
{
	int ret;

	/* The order of below registrations is performance optimized */
	ret = sbi_ecall_register_extension(&ecall_time);
	if (ret)
		return ret;
	ret = sbi_ecall_register_extension(&ecall_rfence);
	if (ret)
		return ret;
	ret = sbi_ecall_register_extension(&ecall_ipi);
	if (ret)
		return ret;
	ret = sbi_ecall_register_extension(&ecall_srst);
	if (ret)
		return ret;
	ret = sbi_ecall_register_extension(&ecall_base);
	if (ret)
		return ret;
	ret = sbi_ecall_register_extension(&ecall_legacy);
	if (ret)
		return ret;
	ret = sbi_ecall_register_extension(&ecall_vendor);
	if (ret)
		return ret;
	ret = sbi_ecall_register_extension(&ecall_ebi);
	sbi_printf("############### init ecall_ebi successfully\n");
	sbi_printf("ecall_ebi: %p\n", ecall_ebi.handle);
	if (ret)
		return ret;

	return 0;
}
