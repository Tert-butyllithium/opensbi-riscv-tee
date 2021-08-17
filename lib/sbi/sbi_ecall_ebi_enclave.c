#include <sbi/riscv_encoding.h>
#include <sbi/sbi_ecall_ebi_enclave.h>
#include <sbi/sbi_console.h>
#include <sbi/riscv_asm.h>
#include <sbi/sbi_string.h>
#include <sbi/sbi_trap.h>
#include <sbi/sbi_hart.h>
#include <sbi/sbi_ecall_ebi_mem.h>
#include "../../platform/thead/c910/platform.h"

// #define MAX_PAGE 8192
// static enclave_page_t pages[MAX_PAGE];
// static size_t max_pages;

enclave_context *eid_to_context(uintptr_t eid)
{
	return &enclaves[eid];
}

void poweroff(uint16_t code)
{
    sbi_printf("Power off\r\n");
//     finisher_exit(code);
//     if (htif) {
//         htif_poweroff();
//     } else {
//         send_ipi_many(0, IPI_HALT);
//         while (1) {
//             asm volatile("wfi\n");
//         }
//     }
}


#define assert(x) ({ if (!(x)) die("assertion failed: %s", #x); })
#define die(str, ...) ({ sbi_printf("%s:%d: " str "\n", __FILE__, __LINE__, ##__VA_ARGS__); poweroff(-1); })

int memset() {
	return -1;
}

long atol(const char *str)
{
	long res = 0;
	int sign = 0;

	while (*str == ' ')
		str++;

	if (*str == '-' || *str == '+') {
		sign = *str == '-';
		str++;
	}

	while (*str) {
		res *= 10;
		res += *str++ - '0';
	}

	return sign ? -res : res;
}

static inline uint32_t load_uint32_t(const uint32_t *addr, uintptr_t mepc)
{
	register uintptr_t __mepc asm("a2") = mepc;
	register uintptr_t __mstatus asm("a3");
	uint32_t val;
	asm("csrrs %0, mstatus, %3\n"
	    "lw %1, %2\n"
	    "csrw mstatus, %0"
	    : "+&r"(__mstatus), "=&r"(val)
	    : "m"(*addr), "r"(MSTATUS_MPRV), "r"(__mepc));
	return val;
}

static inline uint8_t load_uint8_t(const uint8_t *addr, uintptr_t mepc)
{
	register uintptr_t __mepc asm("a2") = mepc;
	register uintptr_t __mstatus asm("a3");
	uint8_t val;
	asm("csrrs %0, mstatus, %3\n"
	    "lbu %1, %2\n"
	    "csrw mstatus, %0"
	    : "+&r"(__mstatus), "=&r"(val)
	    : "m"(*addr), "r"(MSTATUS_MPRV), "r"(__mepc));
	return val;
}

static inline void store_uint32_t(uint32_t *addr, uint32_t val, uintptr_t mepc)
{
	register uintptr_t __mepc asm("a2") = mepc;
	register uintptr_t __mstatus asm("a3");
	asm volatile("csrrs %0, mstatus, %3\n"
		     "sw %1, %2\n"
		     "csrw mstatus, %0"
		     : "+&r"(__mstatus)
		     : "r"(val), "m"(*addr), "r"(MSTATUS_MPRV), "r"(__mepc));
}

static inline void flush_tlb()
{
	asm volatile("sfence.vma");
}

static inline uint64_t load_uint64_t(const uint64_t *addr, uintptr_t mepc)
{
	return load_uint32_t((uint32_t *)addr, mepc) +
	       ((uint64_t)load_uint32_t((uint32_t *)addr + 1, mepc) << 32);
}

static inline void store_uint64_t(uint64_t *addr, uint64_t val, uintptr_t mepc)
{
	store_uint32_t((uint32_t *)addr, val, mepc);
	store_uint32_t((uint32_t *)addr + 1, val >> 32, mepc);
}

void pmp_update(enclave_context *context)
{
	// if (!context) 
	// 	return;

	// uintptr_t p0 = context->pmp_reg[0].pmp_start >> PMP_SHIFT,
	// 	  p1 = context->pmp_reg[0].pmp_size >> PMP_SHIFT,
	// 	  p2 = context->pmp_reg[1].pmp_start >> PMP_SHIFT,
	// 	  p3 = context->pmp_reg[1].pmp_size >> PMP_SHIFT,
	// 	  p4 = context->pmp_reg[2].pmp_start >> PMP_SHIFT,
	// 	  p5 = context->pmp_reg[2].pmp_size >> PMP_SHIFT,
	// 	  p6 = context->pmp_reg[3].pmp_start >> PMP_SHIFT,
	// 	  p7 = context->pmp_reg[3].pmp_size >> PMP_SHIFT,
	// 	  cfg = 0;

	// for (int i = 0; i < PMP_REGION_MAX; i++) {
	// 	if (context->pmp_reg[i].used) {
	// 		cfg |= (PMP_A_TOR | PMP_R | PMP_W | PMP_X)
	// 			<< (8 + 16 * i);
	// 		sbi_printf("[m mode pmp_update] PMP%d used: "
	// 				"start: 0x%lx, size: 0x%lx, "
	// 				"cfg: 0x%lx\n",
	// 				i, context->pmp_reg[i].pmp_start,
	// 				context->pmp_reg[i].pmp_size, cfg);
	// 	}
	// }

	// pmp off
	uintptr_t p0, p1, p2, p3, p4, p5, p6, p7, cfg;
	p0 = p1 = p2 = p3 = p4 = p5 = p6 = p7 = cfg = 0;

	asm volatile("csrw pmpaddr0, %[p0]\n\t"
		     "csrw pmpaddr1, %[p1]\n\t"
		     "csrw pmpaddr2, %[p2]\n\t"
		     "csrw pmpaddr3, %[p3]\n\t"
		     "csrw pmpaddr4, %[p4]\n\t"
		     "csrw pmpaddr5, %[p5]\n\t"
		     "csrw pmpaddr6, %[p6]\n\t"
		     "csrw pmpaddr7, %[p7]\n\t"
		     "csrw pmpcfg0, %[cfg]" ::
		     [p0] "r"(p0), [p1] "r"(p1), [p2] "r"(p2), [p3] "r"(p3),
		     [p4] "r"(p4), [p5] "r"(p5), [p6] "r"(p6), [p7] "r"(p7),
		     [cfg] "r"(cfg));
}

// Allocate initial memory for enclave
// @param:
// context: enclave context
// enclave_size: currently we only support initial mem less than a section.
//		 more memory case should be supported later
uintptr_t enclave_initial_mem_alloc(enclave_context *context, size_t enclave_size)
{
	uintptr_t pa;

	if (enclave_size > SECTION_SIZE) {
		sbi_printf("[enclave_initial_mem_alloc] allocation failed: "
				"Currently only initial mem less than 0x%lx "
				"is supported. 0x%lx requested\n",
				SECTION_SIZE, enclave_size);
		return 0;
	}

	pa = alloc_section_for_enclave(context, EDRV_VA_START);

	context->pa = pa;
	context->mem_size = enclave_size;
	return EBI_OK;
}

uintptr_t enclave_mem_free(enclave_context *context)
{
	int eid = context->id;

	context->offset_addr		= 0;
	context->pt_root_addr		= 0;
	context->inverse_map_addr	= 0;

	free_section_for_enclave(eid);

	return EBI_OK;
}

enclave_context enclaves[NUM_ENCLAVE + 1];
int enclave_on_core[NUM_CORES]; 

void pmp_switch(enclave_context *context)
{
	sbi_printf("\033[0;36m[pmp_switch] to %s\n\033[0m",context?"enclave":"Linux");
	uintptr_t p0 = 0, p1 = 0, p2 = 0, p3 = 0, p4 = 0, p5 = 0, p6 = 0, p7 = 0, cfg = 0;
	if (context == NULL) {
		// Switch to Linux
		extern char _enclave_end;
		p0  = (uintptr_t)(FW_TEXT_START) >> PMP_SHIFT;
		p1  = (uintptr_t)(&_enclave_end) >> PMP_SHIFT;
		cfg = PMP_A_TOR << 8;
		p2  = 0 >> PMP_SHIFT;
		p3  = -1UL >> PMP_SHIFT;
		cfg |= (PMP_A_TOR | PMP_R | PMP_W | PMP_X) << 24;

	} else {
		// Switch to some enclave
		p6 = 0UL >> PMP_SHIFT;
		p7 = -1UL >> PMP_SHIFT;
		// p6 = context->pa >> PMP_SHIFT;
		// p7 = (context->pa + context->mem_size) >> PMP_SHIFT;
		cfg = (uintptr_t)(PMP_A_TOR | PMP_R | PMP_W | PMP_X) << 56;
		sbi_printf("[m mode pmp_switch] p6 = 0x%lx, p7 = 0x%lx, cfg = 0x%lx\n",
			p6, p7, cfg);
	}

	asm volatile("csrw pmpaddr0, %[p0]\n\t"
		     "csrw pmpaddr1, %[p1]\n\t"
		     "csrw pmpaddr2, %[p2]\n\t"
		     "csrw pmpaddr3, %[p3]\n\t"
		     "csrw pmpaddr4, %[p4]\n\t"
		     "csrw pmpaddr5, %[p5]\n\t"
		     "csrw pmpaddr6, %[p6]\n\t"
		     "csrw pmpaddr7, %[p7]\n\t"
		     "csrw pmpcfg0, %[cfg]" ::[p0] "r"(p0),
		     [p1] "r"(p1), [p2] "r"(p2), [p3] "r"(p3), [p4] "r"(p4),
		     [p5] "r"(p5), [p6] "r"(p6), [p7] "r"(p7), [cfg] "r"(cfg));
}

void pmp_allow_access(peri_addr_t* peri){
	__attribute__((unused)) uintptr_t p2 = 0, p3 = 0, p4 = 0, p5 = 0, cfg;
	cfg = csr_read(CSR_PMPCFG0);
	p2 = peri->reg_pa_start >> PMP_SHIFT;
	p3 = (peri->reg_pa_start + peri->reg_size) >> PMP_SHIFT;
	cfg |= (PMP_A_TOR | PMP_R | PMP_W | PMP_X) << 24;
	sbi_printf("[pmp_allow_access] PMP 0x%lx ~ 0x%lx\n",p2 << PMP_SHIFT,p3 << PMP_SHIFT);

	asm volatile(
	     "csrw pmpaddr2, %[p2]\n\t"
	     "csrw pmpaddr3, %[p3]\n\t"
	     "csrw pmpcfg0, %[cfg]" ::[p2] "r"(p2), [p3] "r"(p3), [cfg] "r"(cfg));
	flush_tlb();
}

void pmp_allow_region(uintptr_t pa, uintptr_t size)
{
	uintptr_t p4, p5, cfg;
	cfg = csr_read(CSR_PMPCFG0);
	p4 = pa >> PMP_SHIFT;
	p5 = (pa + size) >> PMP_SHIFT;
	cfg |= (PMP_A_TOR | PMP_R | PMP_W | PMP_X) << 40;
	sbi_printf("[pmp_allow_region] PMP 0x%lx ~ 0x%lx\n",
			p4 << PMP_SHIFT,
			p5 << PMP_SHIFT);

	asm volatile(
	     "csrw pmpaddr4, %[p4]\n\t"
	     "csrw pmpaddr5, %[p5]\n\t"
	     "csrw pmpcfg0, %[cfg]" ::[p4] "r"(p4), [p5] "r"(p5), [cfg] "r"(cfg));
	flush_tlb();
}

void save_umode_context(enclave_context *context, struct sbi_trap_regs *regs)
{
	sbi_memcpy(context->umode_context, regs, INTEGER_CONTEXT_SIZE);
}

void restore_umode_context(enclave_context *context, struct sbi_trap_regs *regs)
{
	sbi_memcpy(regs, context->umode_context, INTEGER_CONTEXT_SIZE);
}

void save_csr_context(enclave_context *from, uintptr_t mepc, struct sbi_trap_regs *regs)
{
	from->ns_satp = csr_read(CSR_SATP);

	from->ns_mepc	 = mepc + 4;
	// from->ns_mstatus = csr_read(CSR_MSTATUS);
	from->ns_mstatus = regs->mstatus;
	from->ns_medeleg = csr_read(CSR_MEDELEG);

	from->ns_sie	  = csr_read(CSR_SIE);
	from->ns_stvec	  = csr_read(CSR_STVEC);
	from->ns_sstatus  = csr_read(CSR_SSTATUS);
	from->ns_sscratch = csr_read(CSR_SSCRATCH);
}

void restore_csr_context(enclave_context *into, struct sbi_trap_regs *regs)
{
	csr_write(CSR_SATP, into->ns_satp);
	flush_tlb();

	// csr_write(CSR_MEPC, into->ns_mepc);
	// csr_write(CSR_MSTATUS, into->ns_mstatus);
	csr_write(CSR_MEDELEG, into->ns_medeleg);

	csr_write(CSR_SIE, into->ns_sie);
	csr_write(CSR_STVEC, into->ns_stvec);
	csr_write(CSR_SSTATUS, into->ns_sstatus);
	csr_write(CSR_SSCRATCH, into->ns_sscratch);

	regs->mepc = into->ns_mepc - 4;
	regs->mstatus = into->ns_mstatus;
}

void init_csr_context(enclave_context *context)
{
	uintptr_t new_mstatus = csr_read(CSR_MSTATUS) &
				~(MSTATUS_MPP | MSTATUS_SIE | MSTATUS_SPIE);
	new_mstatus |= MSTATUS_MPP & (MSTATUS_MPP >> 1);
	new_mstatus |= MSTATUS_SIE;
	context->ns_mstatus = new_mstatus;

	context->ns_sstatus = csr_read(CSR_SSTATUS) & ~(SSTATUS_SIE);
	context->ns_mepc    = 0x0 + context->pa + EUSR_MEM_SIZE;
	// context->ns_medeleg = (csr_read(CSR_MEDELEG) | (1U << CAUSE_FETCH_ACCESS) | (1U << CAUSE_USER_ECALL)) & ~(1U << CAUSE_SUPERVISOR_ECALL);
	context->ns_sscratch = 0;
	context->ns_satp     = 0;
	context->ns_sie	     = 0;
	context->ns_stvec    = 0;
	context->pt_root_addr	  = 0;
	context->inverse_map_addr = 0;
	context->offset_addr	  = 0;
}

/* Machine mode does not contains the necessary mapping, need to switch back to
 * user mode */
void memcpy_from_user(uintptr_t uaddr, uintptr_t maddr, uintptr_t size,
		      uintptr_t mepc)
{
	while (size > 0) {
		/* 8 bytes per iter */
		if (size >= 8) {
			*(uint64_t *)maddr =
				load_uint64_t((uint64_t *)uaddr, mepc);
			maddr += 8;
			uaddr += 8;
			size -= 8;
		} else {
			*(uint8_t *)maddr =
				load_uint8_t((uint8_t *)uaddr, mepc);
			sbi_printf("%c\n", *(char *)maddr);
			++maddr;
			++uaddr;
			size -= 1;
		}
	}
}

uintptr_t find_avail_enclave()
{
	for (size_t i = 1; i <= NUM_ENCLAVE; ++i) {
		if (enclaves[i].status == ENC_FREE)
			return i;
	}
	return EBI_ERROR;
}

void init_enclaves(void)
{
	// enclave_mem_init();
	init_memory_pool();
	// sbi_memset(enclaves, 0, sizeof(enclave_context) * NUM_ENCLAVE);
	enclaves[0].status = ENC_RUN;
	for (size_t i = 1; i <= NUM_ENCLAVE; ++i)
		enclaves[i].status = ENC_FREE;
}

static void disable_watchdog()
{
	uintptr_t base_addr = 0x2050000;
	uint32_t *cfg = (uint32_t *)base_addr + 0xb4;
	uint32_t *irq_ena = (uint32_t *)base_addr + 0xa0;

	uint32_t origin_cfg = *cfg;
	uint32_t updated_cfg = (origin_cfg & ~(0x3)) | 0b10;

	*cfg = updated_cfg;
	*irq_ena = 0;
}

uintptr_t create_enclave(uintptr_t *args, uintptr_t mepc)
{
	uintptr_t addr;

	addr			 = args[0];
	size_t binary_size	 = args[1];
	uintptr_t driver_bitmask = args[2];

	if (PAGE_UP(binary_size) > EMEM_SIZE)
		return EBI_ERROR;

	disable_watchdog();

	enclave_context *context = NULL;
	uintptr_t avail_id	 = find_avail_enclave();

	if (avail_id == EBI_ERROR)
		return EBI_ERROR;
	/* LOADED enclave, loaded not running */
	context			= &enclaves[avail_id];
	context->status 	= ENC_LOAD;
	context->id		= avail_id;
	context->pa		= 0;
	context->pt_root_addr	= 0;
	context->offset_addr	= 0;
	context->inverse_map_addr = 0;
	
	if (EBI_OK != enclave_initial_mem_alloc(context, EMEM_SIZE))
		return EBI_ERROR;

	uintptr_t base_start, base_end;
	base_start	     = (uintptr_t)&_base_start;
	base_end	     = (uintptr_t)&_base_end;
	size_t base_size     = PAGE_UP(base_end - base_start);
	uintptr_t start_addr = context->pa + EUSR_MEM_SIZE;
	uintptr_t drv_size   = 0;

	sbi_memcpy((void *)start_addr, (void *)base_start, base_size);

	start_addr += base_size;
	if (driver_bitmask != 0) {
		drv_size	      = drvcpy(&start_addr, driver_bitmask);
		// context->peri_bitmask = driver_bitmask;s
	} else {
		start_addr = 0;
	}
	memcpy_from_user(addr, context->pa, binary_size, mepc);
	init_csr_context(context);

	context->enclave_binary_size = binary_size;
	context->drv_list	     = start_addr;
	context->user_param	     = start_addr + drv_size;
	// args[0]			     = avail_id;
	return avail_id;
}

// regs changed to args
uintptr_t enter_enclave(uintptr_t *args, uintptr_t mepc)
{
	uintptr_t id	      = args[0];
	enclave_context *into = &enclaves[id], *from = &enclaves[0];
	uint32_t hartid = sbi_current_hartid();

	disable_watchdog();
	if (into->status != ENC_LOAD || from->status != ENC_RUN)
		return EBI_ERROR;

	memcpy_from_user(args[2], into->user_param, args[1],
			 mepc);

	struct sbi_trap_regs *regs = (struct sbi_trap_regs *)args[5];

	pmp_switch(into);
	save_umode_context(from, regs); // this line is not compatible !!!
	save_csr_context(from, mepc, regs);
	restore_csr_context(into, regs);
	flush_tlb();

	enclave_on_core[hartid] = id;

	/* User parameter */
	/* argc and argv */
	//TODO: args --> regs
	regs->a4 = args[1];
	regs->a5 = into->user_param;

	regs->a0 = id;
	regs->a1 = id;
	regs->a2 = into->pa;
	regs->a3 = into->enclave_binary_size;
	regs->a4 = into->drv_list;
	into->status   = ENC_RUN;
	from->status   = ENC_IDLE;
	return id;
}

uintptr_t exit_enclave(struct sbi_trap_regs *regs)
{
	uintptr_t id = regs->a0, retval = regs->a1;
	uint32_t hartid = sbi_current_hartid();

	enclave_context *from = &(enclaves[id]), *into = &enclaves[0];
	if (from->status != ENC_RUN || into->status != ENC_IDLE)
		return EBI_ERROR;

	// sbi_memset((void *)from->pa, 0, EMEM_SIZE);
	enclave_mem_free(from);
	// clean and switch pmp

	enclave_on_core[hartid] = 0;
	pmp_switch(NULL);
	restore_umode_context(into, regs);
	restore_csr_context(into, regs);

	regs->a0 = retval;

	from->status = ENC_FREE;
	into->status = ENC_RUN;
	return EBI_OK;
}

void inform_peri(struct sbi_trap_regs *regs){
	int hartid		 = sbi_current_hartid();
	enclave_context *current_enclave = &enclaves[enclave_on_core[hartid]];
	uintptr_t pa		 = regs->a0;
	uintptr_t va		 = regs->a1;
	uintptr_t sz		 = regs->a2;
	current_enclave->peri_list[current_enclave->peri_cnt].reg_pa_start = pa;
	current_enclave->peri_list[current_enclave->peri_cnt].reg_va_start = va;
	current_enclave->peri_list[current_enclave->peri_cnt].reg_size = sz;
	current_enclave->peri_cnt++;
}

// TODO: actually pause/resume can replace enter/exit
// NOTE: remember to update the `enclave_on_core`
/* pause an enclave, do not take care of ret */
uintptr_t suspend_enclave(uintptr_t id, uintptr_t *regs, uintptr_t mepc)
{
	// enclave_context *from = &(enclaves[id]);
	// // ensure one can only pause itself
	// if (from->status != ENC_RUN)
	// 	return EBI_ERROR;

	// save_umode_context(from, regs);
	// save_csr_context(from, mepc, regs);
	// // protect entire enclave section
	// pmp_switch(NULL);
	// /* Stop paging and save page table */
	// csr_write(CSR_SATP, 0x0);
	// flush_tlb();

	// from->status = ENC_IDLE;
	return 0;
}
/* resume certain enclave, must exist */
uintptr_t resume_enclave(uintptr_t id, uintptr_t *regs)
{
	// enclave_context *into = &(enclaves[id]);
	// if (into->status != ENC_IDLE && into->status != ENC_LOAD)
	// 	return EBI_ERROR;

	// pmp_switch(into);
	// restore_csr_context(into, regs);
	// if (into->status == ENC_IDLE)
	// 	restore_umode_context(into, regs);
	// else {
	// 	/* User parameter */
	// 	regs[A5_INDEX] = regs[A1_INDEX];
	// 	regs[A6_INDEX] = regs[A2_INDEX];

	// 	regs[A0_INDEX] = id;
	// 	regs[A1_INDEX] = id;
	// 	regs[A2_INDEX] = into->pa;
	// 	regs[A3_INDEX] = into->enclave_binary_size;
	// 	regs[A4_INDEX] = into->drv_list;
	// }
	// into->status = ENC_RUN;
	// return id;
	return 0;
}

extern char _console_start, _console_end;
// extern char _drv_rtc_start, _drv_rtc_end;
drv_addr_t bbl_addr_list[MAX_DRV] = {
    {(uintptr_t)&_console_start, (uintptr_t)&_console_end, -1}
//     {(uintptr_t)&_drv_rtc_start, (uintptr_t)&_drv_rtc_end, -1}
};


// drv_addr_t bbl_addr_list[MAX_DRV] = {};

uintptr_t drvcpy(uintptr_t *start_addr, uintptr_t bitmask)
{
	drv_addr_t _local_drv_addr_list[64] = {};
	int cnt			     = 0;
	for (int i = 0; i < MAX_DRV; i++) {
		if (bbl_addr_list[i].drv_start && (bitmask & (1 << i))) {
			uintptr_t drv_start = bbl_addr_list[i].drv_start;
			uintptr_t drv_size  = bbl_addr_list[i].drv_end -
					     bbl_addr_list[i].drv_start;
			_local_drv_addr_list[cnt].drv_start = *start_addr;
			_local_drv_addr_list[cnt].drv_end   = *start_addr + drv_size;
			cnt++;
			sbi_memcpy((void *)(*start_addr), (void *)drv_start,
			       drv_size);
			*start_addr += drv_size;
		}
	}
	sbi_memcpy((void *)*start_addr, (void *)_local_drv_addr_list,
	       sizeof(_local_drv_addr_list));
	return sizeof(_local_drv_addr_list);
}

char drvfetch(int enclave_id, int driver_id)
{
	if (driver_id >= MAX_DRV)
		return -1;
	if (atomic_read((atomic_t *)&bbl_addr_list[driver_id].using_by) ==
	    enclave_id)
		return enclave_id;
	while (atomic_cas(&bbl_addr_list[driver_id].using_by, -1, enclave_id) !=
	       enclave_id)
		;
	return enclave_id;
}

void drvrelease(int enclave_id, int driver_id)
{
	if (driver_id >= MAX_DRV) {
		return;
	}
	atomic_cas(&bbl_addr_list[driver_id].using_by, enclave_id, -1);
}