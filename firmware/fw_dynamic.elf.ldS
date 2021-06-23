/*
 * SPDX-License-Identifier: BSD-2-Clause
 *
 * Copyright (c) 2019 Western Digital Corporation or its affiliates.
 *
 * Authors:
 *   Anup Patel <anup.patel@wdc.com>
 */

OUTPUT_ARCH(riscv)
ENTRY(_start)

SECTIONS
{
	#include "fw_base.ldS"

	. = ALIGN(0x1000);
	_enclave_start = .;
	. = 0x41700000;
	_enclave_end = .;

	PROVIDE(_fw_reloc_end = .);
}
