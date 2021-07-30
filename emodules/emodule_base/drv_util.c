#include "drv_util.h"
#include "mm/page_table.h"
#include <errno.h>
#include <stdarg.h>
#include <stdio.h>

#define bool char
#define false 0
#define true 1

int vsnprintf(char* out, size_t n, const char* s, va_list vl)
{
  bool format = false;
  bool longarg = false;
  size_t pos = 0;
  for( ; *s; s++)
  {
    if(format)
    {
      switch(*s)
      {
        case 'l':
          longarg = true;
          break;
        case 'p':
          longarg = true;
          if (++pos < n) out[pos-1] = '0';
          if (++pos < n) out[pos-1] = 'x';
        case 'x':
        {
          long num = longarg ? va_arg(vl, long) : va_arg(vl, int);
          for(int i = 2*(longarg ? sizeof(long) : sizeof(int))-1; i >= 0; i--) {
            int d = (num >> (4*i)) & 0xF;
            if (++pos < n) out[pos-1] = (d < 10 ? '0'+d : 'a'+d-10);
          }
          longarg = false;
          format = false;
          break;
        }
        case 'd':
        {
          long num = longarg ? va_arg(vl, long) : va_arg(vl, int);
          if (num < 0) {
            num = -num;
            if (++pos < n) out[pos-1] = '-';
          }
          long digits = 1;
          for (long nn = num; nn /= 10; digits++)
            ;
          for (int i = digits-1; i >= 0; i--) {
            if (pos + i + 1 < n) out[pos + i] = '0' + (num % 10);
            num /= 10;
          }
          pos += digits;
          longarg = false;
          format = false;
          break;
        }
        case 's':
        {
          const char* s2 = va_arg(vl, const char*);
          while (*s2) {
            if (++pos < n)
              out[pos-1] = *s2;
            s2++;
          }
          longarg = false;
          format = false;
          break;
        }
        case 'c':
        {
          if (++pos < n) out[pos-1] = (char)va_arg(vl,int);
          longarg = false;
          format = false;
          break;
        }
        default:
          break;
      }
    }
    else if(*s == '%')
      format = true;
    else
      if (++pos < n) out[pos-1] = *s;
  }
  if (pos < n)
    out[pos] = 0;
  else if (n)
    out[n-1] = 0;
  return pos;
}

int snprintf(char* out, size_t n, const char* s, ...)
{
  va_list vl;
  va_start(vl, s);
  int res = vsnprintf(out, n, s, vl);
  va_end(vl);
  return res;
}

void putstring(const char* s)
{
    while (*s) {
        unsigned int arg0 = (unsigned int)*s++;
        register unsigned int a0 asm("a0") = (unsigned int)(arg0);
        register unsigned int a7 asm("a7") = (unsigned int)(1);
        asm volatile("ecall"
                     : "+r"(a0)
                     : "r"(a7)
                     : "memory");
    }
}
void vprintd(const char* s, va_list vl)
{
    char buf[256];
    vsnprintf(buf, sizeof buf, s, vl);
    putstring(buf);
}

void printd(const char* s, ...)
{
    va_list vl;

    va_start(vl, s);
    vprintd(s, vl);
    va_end(vl);
}

void *my_memset(void *s, int c,  unsigned int len)
{
    unsigned char* p=s;
    while(len--)
    {
        *p++ = (unsigned char)c;
    }
    return s;
}

void print_color(const char* s)
{
  printd("\033[0;32m%s\033[0m\n", s);
}

// void show_reg(uintptr_t *regs)
void show_reg()
{
  printd("**************** SHOW REG ****************\n");

  uintptr_t sstatus, sepc, stvec, satp;
  
  sstatus = read_csr(sstatus);
  sepc = read_csr(sepc);
  stvec = read_csr(stvec);
  satp = read_csr(satp);

  printd("status: 0x%lx\n", sstatus);
  printd("sepc: 0x%lx\n", sepc);
  printd("stvec: 0x%lx\n", stvec);
  printd("satp: 0x%lx\n", satp);

  // for (int i = 0; i < 32; i++) {
  //   printd("x%d: 0x%lx\n", i, regs[i]);
  // }
  
  printd("************** END SHOW REG **************\n");
}


#define L1_CACHE_BYTES 64
void flush_dcache_range(unsigned long start, unsigned long end)
{
	register unsigned long i asm("a0") = start & ~(L1_CACHE_BYTES - 1);
	for (; i < end; i += L1_CACHE_BYTES)
		asm volatile(".long 0x0295000b");	/*dcache.cpa a0*/
	asm volatile(".long 0x01b0000b");		/*sync.is*/
}

void invalidate_dcache_range(unsigned long start, unsigned long end)
{
	register unsigned long i asm("a0") = start & ~(L1_CACHE_BYTES - 1);

	for (; i < end; i += L1_CACHE_BYTES)
		asm volatile ("dcache.ipa a0");

	asm volatile (".long 0x01b0000b");
}

void flush_tlb_range(unsigned long start, unsigned long end)
{
  for (uintptr_t i = start; i < end; i += EPAGE_SIZE) {
    __asm__ __volatile__("sfence.vma %0"
				     :
				     : "r"(i)
				     : "memory");
  }
}