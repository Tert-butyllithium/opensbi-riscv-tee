#include <sbi/sbi_ecall_ebi_mem.h>
#include <sbi/sbi_types.h>
#include <sbi/sbi_string.h>
#include <sbi/sbi_console.h>
#include <sbi/riscv_asm.h>

#define for_each_section_in_pool(pool, section, i) \
	for (i = 0, section = &pool[i]; \
		i < MEMORY_POOL_SECTION_NUM; \
		i++, section = &pool[i])

#define sfn_to_section(sfn) \
	&memory_pool[(sfn - (MEMORY_POOL_START >> SECTION_SHIFT))]

#define __unused __attribute__((unused)) // to be removed


struct section memory_pool[MEMORY_POOL_SECTION_NUM];


static struct section *find_avail_section(void);
static void withdraw_pmp(struct section *sec);

__unused uintptr_t alloc_mem_for_enclave(int eid)
{
	struct section *sec;
	uintptr_t mstatus = csr_read(mstatus);

	if (!(mstatus & MSTATUS_MPP)) {
		sbi_printf("[alloc_mem_for_enclave] permission denied\n");
		return 0;
	}	

	sec = find_avail_section();
	if (!sec) {
		sbi_printf("[alloc_mem_for_enclave] no available mem section found\n");
		return 0;
	}
	
	sbi_printf("[alloc_mem_for_enclave] section 0x%lx allocated for enclave %d\n",
			sec->sfn, eid);
	sec->owner = eid;
	
	return (sec->sfn) << SECTION_SHIFT;
}

__unused void init_memory_pool()
{
	int i;
	struct section *sec;

	for_each_section_in_pool(memory_pool, sec, i) {
		sec->sfn = MEMORY_POOL_START + i * SECTION_SIZE;
		sec->owner = -1;
	}

	sbi_printf("[init_memory_pool] memory pool init successed!"
		"start = 0x%x, end = 0x%x, num = %u\n",
		MEMORY_POOL_START, MEMORY_POOL_END, MEMORY_POOL_SECTION_NUM);

	return;
}

static struct section *find_avail_section()
{
	int i;
	struct section *sec = NULL;

	for_each_section_in_pool(memory_pool, sec, i) {
		if (sec->owner < 0)
			break;
	}

	return sec;
}

static void withdraw_pmp(struct section *sec)
{
	// to be done
	return;
}

void free_section(uintptr_t sfn)
{
	struct section *sec = sfn_to_section(sfn);
	
	if (sec->owner < 0)
		return;

	// clear memory
	char *s = (char *)(sec->sfn >> SECTION_SHIFT);
	sbi_memset(s, 0, SECTION_SIZE);

	// configure pmp. previous owner may no longer access it.
	withdraw_pmp(sec);

	return;
}