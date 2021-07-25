#include "drv_elf.h"

uintptr_t __pt2pte(uint16_t pt)
{
    // uintptr_t res = PTE_V;
    // if (pt & PF_R)
    //     res |= PTE_R;
    // if (pt & PF_W)
    //     res |= PTE_W;
    // if (pt & PF_X)
    //     res |= PTE_X;
    // return res;
    return PTE_V | PTE_R | PTE_X | PTE_W;
}

uintptr_t elf_load(uintptr_t pt_root, uintptr_t elf_addr, char id,
		   uintptr_t *prog_brk)
{
	if (elf_check(elf_addr) != EBI_OK)
		return EBI_ERROR;
	Elf64_Ehdr *ehdr = (Elf64_Ehdr *)elf_addr;

    Elf64_Phdr *phdr_arr = (Elf64_Phdr *)(elf_addr + ehdr->e_phoff);
    //printd("there are %d program header\n", ehdr->e_phnum);
    Elf64_Phdr phdr;
    uintptr_t n_pages;
    for (int i = 0; i < ehdr->e_phnum; i++)
    {
        phdr = phdr_arr[i];
        switch (phdr.p_type)
        {
        case PT_LOAD:
        {
            n_pages = (PAGE_UP(phdr.p_filesz) >> EPAGE_SHIFT) + 1;
            //printd("mapping %d page from %x to %x\n", n_pages, PAGE_DOWN(phdr.p_vaddr), PAGE_DOWN(elf_addr + phdr.p_offset));
            map_page((pte *)pt_root, PAGE_DOWN(phdr.p_vaddr), PAGE_DOWN(elf_addr + phdr.p_offset), n_pages, PTE_U | __pt2pte(phdr.p_flags));
            if ((n_pages << EPAGE_SHIFT) < phdr.p_memsz)
            {
                n_pages = PAGE_UP(phdr.p_memsz - phdr.p_filesz) >> EPAGE_SHIFT;
                alloc_page((pte *)pt_root, PAGE_DOWN(phdr.p_vaddr + phdr.p_filesz), n_pages, PTE_U | __pt2pte(phdr.p_flags), id);
            }
            break;
        }
        default:
        {
            /* TODO: implementation */
        }
        }
    }
    // *prog_brk = PAGE_DOWN(phdr.p_paddr) + PAGE_UP((n_pages + 1)<<EPAGE_SHIFT);
    *prog_brk = EUSR_HEAP_START;
    // Elf64_Shdr *shdr_arr = (Elf64_Shdr *)(elf_addr + ehdr->e_shoff);
    // //printd("there are %d segments\n", ehdr->e_shnum);
    // for (int i = 0; i < ehdr->e_shnum; i++) {
    //     Elf64_Shdr shdr = shdr_arr[i];
    //     if (shdr.sh_size && (shdr.sh_flags & SHF_ALLOC) && (shdr.sh_type == SHT_NOBITS)) {
    //         uintptr_t n_pages = (PAGE_UP(shdr.sh_size) >> EPAGE_SHIFT);
    //         //printd("mapping %d page from %x to %x\n", n_pages, PAGE_DOWN(shdr.sh_addr), PAGE_DOWN(shdr.sh_addr) + PAGE_UP(n_pages<<EPAGE_SHIFT));
    //         if (shdr.sh_flags & SHF_WRITE)
    //             alloc_page((pte *)pt_root, PAGE_DOWN(shdr.sh_addr), n_pages, PTE_U | PTE_R | PTE_W, id);
    //         else
    //             alloc_page((pte *)pt_root, PAGE_DOWN(shdr.sh_addr), n_pages, PTE_U | PTE_R, id);
    //     }
    // }
    return ehdr->e_entry;
}

uintptr_t elf_check(uintptr_t elf_addr)
{
	char *p_elf = (char *)elf_addr;
	if (p_elf[0] != '\x7f' || p_elf[1] != 'E' || p_elf[2] != 'L' ||
	    p_elf[3] != 'F') {
		printd("not elf file");
		return EBI_ERROR;
	}
	char xlen = p_elf[4] == ELFCLASS64 ? 64 : 32;
	if (xlen != 64) {
		printd("not 64-bits file");
		return EBI_ERROR;
	}
	Elf64_Ehdr *ehdr = (Elf64_Ehdr *)elf_addr;
	if (ehdr->e_type != ET_EXEC) {
		printd("not executable file");
		return EBI_ERROR;
	}
	if (ehdr->e_machine != EM_RISCV) {
		printd("invalid machine platform");
		return EBI_ERROR;
	}
	return EBI_OK;
}