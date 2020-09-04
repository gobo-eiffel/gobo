/*
	description:

		"C declarations for the Gobo Eiffel runtime."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2005-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_EIFFEL_H
#define GE_EIFFEL_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Class name mapping as defined in the FreeELKS library. */
#ifndef EIF_INTEGER
#define EIF_INTEGER EIF_INTEGER_32
#endif
#ifndef EIF_CHARACTER
#define EIF_CHARACTER EIF_CHARACTER_8
#endif
#ifndef EIF_REAL
#define EIF_REAL EIF_REAL_32
#endif
#ifndef EIF_DOUBLE
#define EIF_DOUBLE EIF_REAL_64
#endif
#ifndef GE_ms
#if EIF_CHARACTER == EIF_CHARACTER_8
#define GE_ms(s,c) GE_ms8((s),(c))
#else
#define GE_ms(s,c) GE_ms32((s),(c))
#endif
#endif

#if defined(__USE_POSIX) || defined(__unix__) || defined(_POSIX_C_SOURCE)
#include <unistd.h>
#endif
#if !defined(WIN32) && \
	(defined(WINVER) || defined(_WIN32_WINNT) || defined(_WIN32) || \
	defined(__WIN32__) || defined(__TOS_WIN__) || defined(_MSC_VER) || \
	defined(__MINGW32__))
#define WIN32 1
#endif
#ifdef WIN32
#define EIF_WINDOWS 1
#include <windows.h>
#endif

/* See https://sourceforge.net/p/predef/wiki/OperatingSystems/ */
#if (defined(macintosh) || defined(Macintosh))
#define EIF_MAC 1
#define EIF_MACOSX 1
#endif
#if (defined(__APPLE__) && defined(__MACH__))
/* Apparently ISE does not define EIF_MASOSX for Mac OS X >=10.4 (see EXECUTION_ENVIRONMENT.available_cpu_count) */
#define EIF_MAC 1
#endif

#if (defined(VMS) || defined(__VMS))
#define EIF_VMS 1
#endif

#if (defined(__VXWORKS__) || defined(__vxworks))
#define EIF_VXWORKS 1
#endif

#define BYTEORDER 0x1234

#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include <stddef.h>

#define EIF_OS_WINNT 	1
#define EIF_OS_LINUX 	2
#define EIF_OS_DARWIN 	4
#define EIF_OS_VXWORKS	11
#define EIF_OS_VMS	12

/* Platform definition */
/* Unix definition */
#define EIF_IS_UNIX EIF_TRUE
#define EIF_OS EIF_OS_LINUX
/* Windows definition */
#ifdef EIF_WINDOWS
#define EIF_IS_WINDOWS EIF_TRUE
#undef EIF_OS
#define EIF_OS EIF_OS_WINNT
#undef EIF_IS_UNIX
#define EIF_IS_UNIX EIF_FALSE
#else
#define EIF_IS_WINDOWS EIF_FALSE
#endif
/* VMS definition */
#ifdef EIF_VMS
#define EIF_IS_VMS EIF_TRUE
#undef EIF_OS
#define EIF_OS EIF_OS_VMS
#undef EIF_IS_UNIX
#define EIF_IS_UNIX EIF_FALSE
#else
#define EIF_IS_VMS EIF_FALSE
#endif
/* MAC definition */
#ifdef EIF_MAC
#define EIF_IS_MAC EIF_TRUE
#undef EIF_OS
#define EIF_OS EIF_OS_DARWIN
#undef EIF_IS_UNIX
#define EIF_IS_UNIX EIF_FALSE
#else
#define EIF_IS_MAC EIF_FALSE
#endif
/* VxWorks definition */
#ifdef EIF_VXWORKS
#define EIF_IS_VXWORKS EIF_TRUE
#undef EIF_OS
#define EIF_OS EIF_OS_VXWORKS
#undef EIF_IS_UNIX
#define EIF_IS_UNIX EIF_FALSE
#else
#define EIF_IS_VXWORKS EIF_FALSE
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifdef _MSC_VER /* MSVC */
typedef signed char int8_t;
typedef signed short int16_t;
typedef signed int int32_t;
typedef signed __int64 int64_t;
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
typedef unsigned __int64 uint64_t;
#else
#if defined (__BORLANDC__) && (__BORLANDC__ < 0x600) /* Borland before 6.0 */
typedef signed char int8_t;
typedef signed short int16_t;
typedef signed long int int32_t;
typedef signed __int64 int64_t;
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned __int64 uint64_t;
#else
#include <inttypes.h>
#endif
#endif

/* Portable integer pointers */
#ifdef EIF_WINDOWS
#ifndef _INTPTR_T_DEFINED
#define _INTPTR_T_DEFINED
#ifdef _WIN64
typedef __int64 intptr_t;
#else
typedef int intptr_t;
#endif
#endif
#ifndef _UINTPTR_T_DEFINED
#define _UINTPTR_T_DEFINED
#ifdef _WIN64
  typedef unsigned __int64 uintptr_t;
#else
  typedef unsigned int uintptr_t;
#endif
#endif
#endif

/* C type for underlying integer type identifying object's dynamic type. */
typedef uint16_t EIF_TYPE_INDEX;

/*
 * Abstraction representing an Eiffel type.
 * It is made of a compiler type-id,
 * and of some annotations (attached/detachable/separate/variant/frozen).
 */
typedef struct eif_type {
	EIF_TYPE_INDEX id;
	EIF_TYPE_INDEX annotations;
} EIF_TYPE;

/*
 * Since EIF_TYPE and EIF_ENCODED_TYPE have the same size, the encoded version
 * is basically a memcpy version of the EIF_TYPE representation.
 * It is used to provide backward compatibility to most Eiffel and
 * C APIs manipulating types as an INTEGER.
 */
typedef int32_t EIF_ENCODED_TYPE;
typedef EIF_ENCODED_TYPE EIF_TYPE_ID;
#define EIF_NO_TYPE (EIF_TYPE_ID)(-1)

/* Basic Eiffel types */
typedef char EIF_BOOLEAN;
typedef unsigned char EIF_CHARACTER_8;
typedef uint32_t EIF_CHARACTER_32;
typedef int8_t EIF_INTEGER_8;
typedef int16_t EIF_INTEGER_16;
typedef int32_t EIF_INTEGER_32;
typedef int64_t EIF_INTEGER_64;
typedef uint8_t EIF_NATURAL_8;
typedef uint16_t EIF_NATURAL_16;
typedef uint32_t EIF_NATURAL_32;
typedef uint64_t EIF_NATURAL_64;
typedef void* EIF_POINTER;
typedef float EIF_REAL_32;
typedef double EIF_REAL_64;
typedef struct {EIF_TYPE_INDEX id; uint16_t flags;} EIF_ANY;
typedef EIF_ANY* EIF_REFERENCE;
typedef struct {EIF_TYPE_INDEX id; uint16_t flags; EIF_REFERENCE area; EIF_INTEGER count;} EIF_STRING;
typedef struct {EIF_TYPE_INDEX id; uint16_t flags; uint32_t offset; EIF_INTEGER count; EIF_INTEGER capacity;} EIF_SPECIAL;

#ifdef EIF_WINDOWS
typedef wchar_t EIF_NATIVE_CHAR;
#else
typedef char EIF_NATIVE_CHAR;
#endif
typedef EIF_NATIVE_CHAR* EIF_FILENAME;

#define EIF_VOID ((EIF_REFERENCE)0)
#define EIF_FALSE ((EIF_BOOLEAN)'\0')
#define EIF_TRUE ((EIF_BOOLEAN)'\1')
#define EIF_TEST(x) ((x) ? EIF_TRUE : EIF_FALSE)

#define EIF_IS_WORKBENCH EIF_FALSE
#define EIF_POINTER_DISPLAY "lX"

/* For INTEGER and NATURAL manifest constants */
#define GE_int8(x) x
#define GE_nat8(x) x
#define GE_int16(x) x
#define GE_nat16(x) x
#define GE_int32(x) x##L
#define GE_nat32(x) x##U
#if defined (_MSC_VER) && (_MSC_VER < 1400) /* MSC older than v8 */
#define GE_int64(x) x##i64
#define GE_nat64(x) x##ui64
#elif defined(__BORLANDC__) && (__BORLANDC__ < 0x600) /* Borland before 6.0 */
#define GE_int64(x) x##i64
#define GE_nat64(x) x##ui64
#else /* ISO C 99 */
#define GE_int64(x) x##LL
#define GE_nat64(x) x##ULL
#endif
#ifdef __LCC__
/* lcc-win32 reports a constant overflow for -21474836478. */
#define GE_min_int32 (-GE_int32(2147483647)-GE_int32(1))
#else
#define GE_min_int32 GE_int32(-2147483648)
#endif
#define GE_max_int32 GE_int32(2147483647)
#if defined(__LCC__) || defined(__GNUC__) || defined(__MINGW32__)
/* lcc-win32 reports a constant overflow for -9223372036854775808. */
/* gcc and mingw-win64 warn that integer constant is so large that it is unsigned. */
#define GE_min_int64 (-GE_int64(9223372036854775807)-GE_int64(1))
#else
#define GE_min_int64 GE_int64(-9223372036854775808)
#endif
#if defined(__LCC__) && !defined(_WIN64)
/* lcc-win32 does not consider 64 bit constants as constants in case statement. */
#define GE_case_int64(x) ((int32_t)(x))
#define GE_case_nat64(x) ((uint32_t)(x))
#else
#define GE_case_int64(x) (x)
#define GE_case_nat64(x) (x)
#endif

#ifdef _WIN64
#define GE_IS_64_BITS EIF_TRUE
#else
#define GE_IS_64_BITS EIF_TEST(sizeof(void*)==64)
#endif

/* Posix threads */
#if !defined(EIF_WINDOWS)
#define GE_USE_POSIX_THREADS
#endif

#ifdef _MSC_VER /* MSVC */
/* MSVC does not support ISO C 99's 'snprintf' from stdio.h */
#define snprintf(a,b,c,d) sprintf(a,c,d)
#endif

/*
 * Gobo compiler version.
 * Starts with 6080 (looks like GOBO) followed by 5 digits.
 */
#define GE_compiler_version() 608000001

/*
	Interoperability with ISE.
*/
#define RTI64C(x) GE_int64(x)
#define EIF_OBJECT EIF_REFERENCE
#define EIF_OBJ EIF_OBJECT
#define OVERHEAD sizeof(EIF_ANY)
/* Function pointer call to make sure all arguments are correctly pushed onto stack. */
/* FUNCTION_CAST is for standard C calls. */
/* FUNCTION_CAST_TYPE is for non-standard C calls. */
#define FUNCTION_CAST(r_type,arg_types) (r_type (*) arg_types)
#define FUNCTION_CAST_TYPE(r_type,call_type,arg_types) (r_type (call_type *) arg_types)
#define SIGBLOCK
#define SIGRESUME
#define rt_public				/* default C scope */
#define rt_private static		/* static outside a block means private */
#define rt_shared				/* data shared between modules, but not public */
typedef intptr_t rt_int_ptr;
typedef uintptr_t rt_uint_ptr;
#define RTMS(s) GE_str8(s)
#define RTMS_EX(s,c) GE_ms8((s),(c))

#ifdef __cplusplus
}
#endif

#endif
