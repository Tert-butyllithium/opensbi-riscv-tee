# Page Compaction Ideas

Memory is divided into sections and is managed at the granularity of sections.

## M mode

On an OOM exception, an enclave sends a memory allocation request to the MM.
Then the MM should perform the following tasks:
	- rearrange the memory layout of the sections
	- update (1) page table, (2) inverse mapping, (3) &EDRV_VA_PA_OFFSET, (4) &EDRV_PA_START of the enclave
	- allocates a section from the memory pool
	- returns the physical address and the size of the section

