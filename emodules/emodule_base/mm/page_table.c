// #define _DEBUG_LANRANLI

#include <stdint.h>
#include "page_table.h"
#include "drv_page_pool.h"

#define PAGE_SIZE 4096
#ifdef _DEBUG_LANRANLI
#define printd printf
#endif

static page_directory page_directory_pool[PAGE_DIR_POOL] __attribute__((section(".page_table")));
static trie address_trie __attribute__((section(".page_table_trie")));

/**
 * insert a va-pa pair to page table, maintained via a trie
 * @param t a trie to maintain used page directory in a pool, should be `static trie address_trie`
 * @param va the virtual address
 * @param pa the physical address corresponding to va
 * @param len the number of levels should be used. Note, it can be smaller than 3, which indicates a huge page
 * @param attr pte attribution, reserved for future
 * @return
 */
static uintptr_t trie_get_or_insert(trie *t, const uintptr_t va,
				    const uintptr_t pa, const int len,
				    const int attr)
{
	uint32_t p = 0, i = 0;
	/*
     * [L2, L1, L0] PPN for each level, used fot trie to get offset of 
     * page_directory_pool
     * Note: l[0] = L1, l[2] = l[0]
     */

	uintptr_t l[] = { (va & MASK_L2) >> 30, (va & MASK_L1) >> 21,
			  (va & MASK_L0) >> 12 };
	pte *tmp_pte;

	// for a three level page table, only two PPNs need to point to next level
	for (; i < len - 1; i++) {
		if (!t->next[p][l[i]]) {
			t->next[p][l[i]] = ++t->cnt;
			printd("page cnt:%d\n", t->cnt);
			tmp_pte = &page_directory_pool[p][l[i]];
			tmp_pte->ppn =
				(((uintptr_t)&page_directory_pool[t->cnt][0]) - va_pa_offset())>>12;
			tmp_pte->pte_v = tmp_pte->pte_d = 1;
		}
		p = t->next[p][l[i]];
	}

	// set items for the leaf page table entry
	tmp_pte	     = &page_directory_pool[p][l[len - 1]];
	tmp_pte->ppn = pa >> 12;
	if (len == 2) {
		tmp_pte->ppn = (tmp_pte->ppn | MASK_OFFSET) ^ MASK_OFFSET;
	}
	tmp_pte->pte_v = tmp_pte->pte_g = 1;
	if(attr & PTE_U){
		tmp_pte->pte_u = 1;
	}
	if(attr & PTE_W || attr & PTE_D){
		tmp_pte->pte_d = tmp_pte->pte_w = 1;
	}
	if(attr & PTE_R || attr & PTE_A){
		tmp_pte->pte_a = tmp_pte->pte_r  = 1;
	}
	if(attr & PTE_X){
		tmp_pte->pte_x = 1;
	}
	flush_tlb();
	flush_tlb();
	flush_tlb();

	return *((uintptr_t *)tmp_pte);
}

static uintptr_t page_directory_insert(uintptr_t va, uintptr_t pa, int levels,
				       int attr)
{
	uintptr_t p = (uintptr_t)trie_get_or_insert(&address_trie, va, pa,
						    levels, attr);
	return p;
}

uintptr_t get_page_table_root()
{
	return (uintptr_t)&page_directory_pool[0][0];
}

void print_pte(uintptr_t va){
		uintptr_t l[] = { (va & MASK_L2) >> 30, (va & MASK_L1) >> 21,
			  (va & MASK_L0) >> 12 };
	pte entry;
	pte *root = (void*) get_page_table_root();
	pte tmp_entry;
	uintptr_t tmp;
	int i = 0;
	while (1) {
		tmp_entry = root[l[i]];
		if (!tmp_entry.pte_v) {
			printd("ERROR: va:0x%lx is not valid!!!\n", va);
			return;
		}
		if ((tmp_entry.pte_r | tmp_entry.pte_w | tmp_entry.pte_x)) {
			break;
		}
		tmp  = tmp_entry.ppn << 12;
		root = (pte *)(tmp + va_pa_offset());
		i++;
	}
	printd("##########PRINT PTE @ %x############\n",va);
	printd("PTE stored @ %p\n",root);
	printd("PTE ppn: %x\n",tmp_entry.ppn);
	printd("PTE pte_v: %x\n",tmp_entry.pte_v);
	printd("PTE pte_r: %x\n",tmp_entry.pte_r);
	printd("PTE pte_w: %x\n",tmp_entry.pte_w);
	printd("PTE pte_x: %x\n",tmp_entry.pte_x);
	printd("PTE pte_u: %x\n",tmp_entry.pte_u);
	printd("PTE pte_g: %x\n",tmp_entry.pte_g);
	printd("PTE pte_a: %x\n",tmp_entry.pte_a);
	printd("PTE pte_d: %x\n",tmp_entry.pte_d);
	printd("##########PRINT PTE END#################\n");
}

uintptr_t get_pa(uintptr_t va)
{
	uintptr_t l[] = { (va & MASK_L2) >> 30, (va & MASK_L1) >> 21,
			  (va & MASK_L0) >> 12 };
	pte entry;
	pte *root = (void*) get_page_table_root();
	pte tmp_entry;
	uintptr_t tmp;
	int i = 0;
	while (1) {
		tmp_entry = root[l[i]];
		if (!tmp_entry.pte_v) {
			printd("ERROR: va:0x%lx is not valid!!!\n", va);
			return 0;
		}
		if ((tmp_entry.pte_r | tmp_entry.pte_w | tmp_entry.pte_x)) {
			break;
		}
		tmp  = tmp_entry.ppn << 12;
		root = (pte *)(tmp + va_pa_offset());
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

void test_va(uintptr_t va)
{
	uintptr_t *content = (uintptr_t *)va;
	uintptr_t pa = get_pa(va);
	printd("[test_va] va: 0x%lx --> pa: 0x%lx\n", va, pa);
	print_pte(va);
	if (read_csr(satp))
		printd("[test_va] content: 0x%lx\n", *content);
}

void map_page(pte *root, uintptr_t va, uintptr_t pa, size_t n_pages,
	      uintptr_t attr)
{
	pte *pt;
	printd("[doing_map_page]map_page(nullptr,0x%lx,0x%lx,%d,0);\n",va,pa,n_pages);
	// while (n_pages >= 512) {
	// 	page_directory_insert(va, pa, 2, attr);
	// 	va += EPAGE_SIZE * 512;
	// 	pa += EPAGE_SIZE * 512;
	// 	n_pages -= 512;
	// }

	while (n_pages >= 1) {
		page_directory_insert(va, pa, 3, attr);
		va += EPAGE_SIZE;
		pa += EPAGE_SIZE;
		n_pages--;
	}
}

uintptr_t ioremap(pte *root, uintptr_t pa, size_t size)
{
	static uintptr_t drv_addr_alloc = 0;
	printd("current root address: %p",get_page_table_root());
	size_t n_pages		      = PAGE_UP(size) >> EPAGE_SHIFT;
	map_page(root,  EDRV_DRV_START + drv_addr_alloc, pa, n_pages,
		 PTE_V | PTE_W | PTE_R | PTE_D | PTE_X);
	uintptr_t cur_addr =  EDRV_DRV_START;
	drv_addr_alloc += n_pages << 12;
	return cur_addr;
}

uintptr_t alloc_page(pte *root, uintptr_t va, size_t n_pages, uintptr_t attr,
		     char id)
{
	pte *pt;
	uintptr_t pa;

	while (n_pages >= 1) {
		pa = spa_get_pa_zero(id);
		printd("[alloc_page]alloc_page(nullptr,0x%lx,%d,0);\n",va,n_pages);
		printd("[alloc_page] pa = 0x%lx\n", pa);
		page_directory_insert(va, pa, 3, attr);
		va += EPAGE_SIZE;
		n_pages--;
	}

	return pa;
}

void all_zero()
{
	int i, j;
	pte *tmp_pte;
	for (i = 0; i < 64; i++) {
		for (j = 0; j < 512; j++) {
			tmp_pte = &page_directory_pool[i][j];
			if (*((uintptr_t *)tmp_pte)) {
				printd("!!!!!!! %d:%d not zero\n", i, j);
			}
		}
	}
}