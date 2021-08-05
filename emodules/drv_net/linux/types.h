
#ifndef _LINUX_TYPES_H
#define _LINUX_TYPES_H

// #include <linux/posix_types.h>
// #include <asm/types.h>
#include <stdbool.h>
#include <stdint.h>
#define __signed__

typedef __signed__ char __s8;
typedef unsigned char __u8;

typedef __signed__ short __s16;
typedef unsigned short __u16;

typedef __signed__ int __s32;
typedef unsigned int __u32;

#ifdef __GNUC__
__extension__ typedef __signed__ long long __s64;
__extension__ typedef unsigned long long __u64;
#else
typedef __signed__ long long __s64;
typedef unsigned long long __u64;
#endif


// #ifndef __KERNEL_STRICT_NAMES

typedef unsigned long phys_addr_t;
typedef unsigned long phys_size_t;
typedef unsigned long		uintptr_t;

/* bsd */
typedef unsigned char		u_char;
typedef unsigned short		u_short;
typedef unsigned int		u_int;
typedef unsigned long		u_long;

/* sysv */
typedef unsigned char		unchar;
typedef unsigned short		ushort;
typedef unsigned int		uint;
typedef unsigned long		ulong;

#ifndef __BIT_TYPES_DEFINED__
#define __BIT_TYPES_DEFINED__

// typedef		__u8		u_int8_t;
// typedef		__s8		int8_t;
// typedef		__u16		u_int16_t;
// typedef		__s16		int16_t;
// typedef		__u32		u_int32_t;
// typedef		__s32		int32_t;

#endif /* !(__BIT_TYPES_DEFINED__) */

// typedef		__u8		uint8_t;
// typedef		__u16		uint16_t;
// typedef		__u32		uint32_t;

// #if defined(__GNUC__) && !defined(__STRICT_ANSI__) && \
// 	(!defined(CONFIG_USE_STDINT) || !defined(__INT64_TYPE__))
// typedef		__u64		uint64_t;
// typedef		__u64		u_int64_t;
// typedef		__s64		int64_t;
// #endif

// #endif /* __KERNEL_STRICT_NAMES */

/* this is a special 64bit data type that is 8-byte aligned */
#define aligned_u64 __u64 __aligned(8)
#define aligned_be64 __be64 __aligned(8)
#define aligned_le64 __le64 __aligned(8)

#if defined(CONFIG_USE_STDINT) && defined(__INT64_TYPE__)
typedef		__UINT64_TYPE__	uint64_t;
typedef		__UINT64_TYPE__	u_int64_t;
typedef		__INT64_TYPE__		int64_t;
#endif

#ifdef __KERNEL__
// typedef phys_addr_t resource_size_t;
#endif

/*
 * Below are truly Linux-specific types that should never collide with
 * any application/library that wants linux/types.h.
 */
#ifdef __CHECKER__
#define __bitwise__ __attribute__((bitwise))
#else
#define __bitwise__
#endif
#ifdef __CHECK_ENDIAN__
#define __bitwise __bitwise__
#else
#define __bitwise
#endif

typedef __u16 __bitwise __le16;
typedef __u16 __bitwise __be16;
typedef __u32 __bitwise __le32;
typedef __u32 __bitwise __be32;
#if defined(__GNUC__)
typedef __u64 __bitwise __le64;
typedef __u64 __bitwise __be64;
#endif
typedef __u16 __bitwise __sum16;
typedef __u32 __bitwise __wsum;

typedef unsigned __bitwise__	gfp_t;

// struct ustat {
// 	__kernel_daddr_t	f_tfree;
// 	__kernel_ino_t		f_tinode;
// 	char			f_fname[6];
// 	char			f_fpack[6];
// };

#endif /* _LINUX_TYPES_H */
