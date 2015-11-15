/*
	description:

		"C declarations for the Gobo Eiffel runtime."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2005-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_EIFFEL_H
#define GE_EIFFEL_H

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

#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include <string.h>

/* Platform definition */
/* Unix definition */
#define EIF_IS_UNIX EIF_TRUE
/* Windows definition */
#ifdef EIF_WINDOWS
#define EIF_IS_WINDOWS EIF_TRUE
#undef EIF_IS_UNIX
#define EIF_IS_UNIX EIF_FALSE
#else
#define EIF_IS_WINDOWS EIF_FALSE
#endif
/* VMS definition */
#ifdef EIF_VMS
#define EIF_IS_VMS EIF_TRUE
#undef EIF_IS_UNIX
#define EIF_IS_UNIX EIF_FALSE
#else
#define EIF_IS_VMS EIF_FALSE
#endif
/* MAC definition */
#ifdef EIF_MAC
#define EIF_IS_MAC EIF_TRUE
#undef EIF_IS_UNIX
#define EIF_IS_UNIX EIF_FALSE
#else
#define EIF_IS_MAC EIF_FALSE
#endif
/* VxWorks definition */
#ifdef EIF_VXWORKS
#define EIF_IS_VXWORKS EIF_TRUE
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
#endif

/* Basic Eiffel types */
typedef struct {int id;} EIF_ANY;
typedef EIF_ANY* EIF_REFERENCE;
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
#else
#if defined (__BORLANDC__) && (__BORLANDC__ < 0x600) /* Borland before 6.0 */
#define GE_int64(x) x##i64
#define GE_nat64(x) x##ui64
#else /* ISO C 99 */
#define GE_int64(x) x##LL
#define GE_nat64(x) x##ULL
#endif
#endif

#ifdef _MSC_VER /* MSVC */
/* MSVC does not support ISO C 99's 'snprintf' from stdio.h */
#define snprintf(a,b,c,d) sprintf(a,c,d)
#endif

/*
	Interoperability with ISE.
*/
#define RTI64C(x) GE_int64(x)
#define EIF_OBJECT EIF_REFERENCE
#define EIF_OBJ EIF_OBJECT
#define EIF_INTEGER EIF_INTEGER_32
#define EIF_CHARACTER EIF_CHARACTER_8
#define EIF_REAL EIF_REAL_32
#define EIF_DOUBLE EIF_REAL_64
/* Function pointer call to make sure all arguments are correctly pushed onto stack. */
/* FUNCTION_CAST is for standard C calls. */
/* FUNCTION_CAST_TYPE is for non-standard C calls. */
#define FUNCTION_CAST(r_type,arg_types) (r_type (*) arg_types)
#define FUNCTION_CAST_TYPE(r_type,call_type,arg_types) (r_type (call_type *) arg_types)
#define rt_public				/* default C scope */
#define rt_private static		/* static outside a block means private */
#define rt_shared				/* data shared between modules, but not public */
typedef int32_t EIF_TYPE_ID;
#define EIF_NO_TYPE (EIF_TYPE_ID)(-1)
typedef uint16_t EIF_TYPE_INDEX;
extern EIF_REFERENCE GE_ms8(char* s, EIF_INTEGER_32 c);
#define RTMS(s) GE_ms8((s),strlen(s))
#define RTMS_EX(s,c) GE_ms8((s),(c))

#ifdef __cplusplus
}
#endif

#endif

/*
	description:

		"C functions used to manipulate native strings"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_NATIVE_STRING_H
#define GE_NATIVE_STRING_H

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#include <string.h>
#ifndef EIF_WINDOWS
#include <sys/types.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_WINDOWS

	/* Macro used to manipulate native string, i.e: (wchar_t*) */
#define GE_nstrlen wcslen /* size of string */
#define GE_nstrncpy wcsncpy /* Copy n characters of one string to another */
#define GE_nstrcpy wcscpy /* Copy one string to another */
#define GE_nstrncat wcsncat /* Append characters of a string */
#define GE_nstrcat wcscat /* Append a string */
#define GE_nstrstr wcsstr /* Return a pointer to the first occurrence of a search string in a string. */
#define GE_nmakestr(quote) L##quote /* Manifest Native string declaration */
#define GE_nstr_fopen	_wfopen /* Open file using native string name */
#define GE_nstrcmp wcscmp /* Compare two strings. */
#define GE_nstrdup _wcsdup /* Duplicate string. */

#define GE_nstr_cat_ascii(dest, src) { 						\
		int i;													\
		size_t dest_len, src_len;								\
		dest_len = rt_nstrlen (dest);							\
		src_len = strlen (src);									\
		for (i = 0; i < src_len; i++) {							\
			dest[dest_len + i] = (EIF_NATIVE_CHAR) src[i];		\
		}														\
		dest[dest_len + src_len] = (EIF_NATIVE_CHAR) 0;			\
	}

#else /* not EIF_WINDOWS */

	/* Macro used to manipulate native string, i.e: (char*) */
#define GE_nstrlen  strlen /* size of string */
#define GE_nstrncpy strncpy /* Copy n characters of one string to another */
#define GE_nstrcpy strcpy /* Copy one string to another */
#define GE_nstrncat strncat /* Append characters of a string */
#define GE_nstrcat strcat /* Append a string */
#define GE_nstrstr strstr /* Return a pointer to the first occurrence of a search string in a string. */
#define GE_nmakestr(quote) quote /* Manifest Native string declaration */
#define GE_nstr_fopen	fopen /* Open file using native string name */
#define GE_nstrcmp strcmp /* Compare two strings. */
#define GE_nstrdup strdup /* Duplicate string. */

#define GE_nstr_cat_ascii strcat

#endif


#ifdef __cplusplus
}
#endif

#endif

/*
	description:

		"C functions used to implement class ARGUMENTS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_ARGUMENTS_H
#define GE_ARGUMENTS_H

#ifdef __cplusplus
extern "C" {
#endif

extern int GE_argc;
extern EIF_NATIVE_CHAR** GE_argv;

#ifdef __cplusplus
}
#endif

#endif

/*
	description:

		"C functions used to implement class EXCEPTION"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_EXCEPTION_H
#define GE_EXCEPTION_H

#include <setjmp.h>

/*
	On Linux glibc systems, we need to use sig* versions of jmp_buf,
	setjmp and longjmp to preserve the signal handling context.
	One way to detect this is if _SIGSET_H_types has
	been defined in /usr/include/setjmp.h.
	NOTE: ANSI only recognizes the non-sig versions.
*/
#if (defined(_SIGSET_H_types) && !defined(__STRICT_ANSI__))
#define GE_jmp_buf sigjmp_buf
#define GE_setjmp(x) sigsetjmp((x),1)
#define GE_longjmp(x,y) siglongjmp((x),(y))
#else
#define GE_jmp_buf jmp_buf
#define GE_setjmp(x) setjmp((x))
#define GE_longjmp(x,y) longjmp((x),(y))
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
	Information about the feature being executed.
*/
typedef struct GE_call_struct GE_call;
struct GE_call_struct {
	char* feature_name;
	char* type_name;
	GE_call* caller; /* previous feature in the call chain */
};

/*
	Context of features containing a rescue clause.
*/
typedef struct GE_rescue_struct GE_rescue;
struct GE_rescue_struct {
	GE_jmp_buf jb;
	GE_rescue* previous; /* previous context in the call chain */
};

/*
	Context of last feature entered containing a rescue clause.
	Warning: this is not thread-safe.
*/
extern GE_rescue* GE_last_rescue;

/*
	Raise an exception with code 'code'.
*/
extern void GE_raise(int code);

/*
	Check whether the type id of 'obj' is not in 'type_ids'.
	If it is, then raise a CAT-call exception. Don't do anything if 'obj' is Void.
	'nb' is the number of ids in 'type_ids' and is expected to be >0.
	'type_ids' is sorted in increasing order.
	Return 'obj'.
*/
#define GE_catcall(obj,type_ids,nb) GE_check_catcall((obj),(type_ids),(nb))
EIF_REFERENCE GE_check_catcall(EIF_REFERENCE obj, int type_ids[], int nb);

/*
	Check whether 'obj' is Void.
	If it is, then raise a call-on-void-target exception.
	Return 'obj'
*/
#define GE_void(obj) (!(obj)?GE_check_void(obj):(obj))
extern EIF_REFERENCE GE_check_void(EIF_REFERENCE obj);

/*
	Check whether 'ptr' is a null pointer.
	If it is, then raise a no-more-memory exception.
	Return 'ptr'
*/
#define GE_null(ptr) GE_check_null(ptr)
extern void* GE_check_null(void* ptr);

#ifdef __cplusplus
}
#endif

#endif

/*
	description:

		"C functions used to implement class CONSOLE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_CONSOLE_H
#define GE_CONSOLE_H

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_WINDOWS

/*
	Create a new DOS console if needed (i.e. in case of a Windows application).
*/
extern void GE_show_console(void);

#endif

#ifdef __cplusplus
}
#endif

#endif

/*
	description:

		"C functions used to implement the program initialization"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_MAIN_H
#define GE_MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

extern int GE_main(int argc, EIF_NATIVE_CHAR** argv);

#ifdef EIF_WINDOWS

#include <windows.h>

/*
	Main entry point when compiling a Windows application.
	See:
		http://en.wikipedia.org/wiki/WinMain
		http://msdn2.microsoft.com/en-us/library/ms633559.aspx
*/
extern int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow);

#endif

#ifdef __cplusplus
}
#endif

#endif

/*
	description:

		"C functions used to access garbage collector facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_GC_H
#define GE_GC_H

#ifdef EIF_BOEHM_GC
/*
	Use the Boehm garbage collector.
	See:
		http://en.wikipedia.org/wiki/Boehm_GC
		http://www.hpl.hp.com/personal/Hans_Boehm/gc/
*/

#define GC_IGNORE_WARN
#include "gc.h"
#endif


/*
	GC initialization.
*/

#ifdef EIF_BOEHM_GC
#define GE_init_gc() GC_INIT(); GC_enable_incremental()
#else /* No GC */
#define GE_init_gc() /* do nothing */
#endif


/*
	Memory allocation.
*/

/*
 * GE_alloc allocates memory that can contain pointers to collectable objects.
 */
#ifdef EIF_BOEHM_GC
#define GE_alloc(x) GE_null(GC_MALLOC(x))
#else /* No GC */
#define GE_alloc(x) GE_null(malloc(x))
#endif

/*
 * When defined, GE_alloc_cleared means that GE_alloc makes sure that the allocated memory is zeroed.
 */
#ifdef EIF_BOEHM_GC
#define GE_alloc_cleared
#else /* No GC */
#endif

/*
 * GE_alloc_atomic allocates memory that does not contain pointers to collectable objects.
 */
#ifdef EIF_BOEHM_GC
#define GE_alloc_atomic(x) GE_null(GC_MALLOC_ATOMIC(x))
#else /* No GC */
#define GE_alloc_atomic(x) GE_null(malloc(x))
#endif

/*
 * When defined, GE_alloc_atomic_cleared means that GE_alloc_atomic makes sure that the allocated memory is zeroed.
 */
/* #define GE_alloc_atomic_cleared */






/*
 * Allocate memory that can contain pointers to collectable objects.
 * The allocated memory is not necessarily zeroed.
 * The allocated object is itself collectable.
 */
#ifdef EIF_BOEHM_GC
#define GE_malloc(size) GE_null(GC_MALLOC(size))
#else /* No GC */
#define GE_malloc(size) GE_null(malloc(size))
#endif

/*
 * Allocate memory that does not contain pointers to collectable objects.
 * The allocated memory is not necessarily zeroed.
 * The allocated object is itself collectable.
 */
#ifdef EIF_BOEHM_GC
#define GE_malloc_atomic(size) GE_null(GC_MALLOC_ATOMIC(size))
#else /* No GC */
#define GE_malloc_atomic(size) GE_null(malloc(size))
#endif

/*
 * Allocate memory that can contain pointers to collectable objects.
 * The allocated memory is zeroed.
 * The allocated object is itself collectable.
 */
#ifdef EIF_BOEHM_GC
#define GE_calloc(nelem, elsize) GE_null(GC_MALLOC((nelem) * (elsize)))
#else /* No GC */
#define GE_calloc(nelem, elsize) GE_null(calloc((nelem), (elsize)))
#endif

/*
 * Allocate memory that does not contain pointers to collectable objects.
 * The allocated memory is zeroed.
 * The allocated object is itself collectable.
 */
#ifdef EIF_BOEHM_GC
#define GE_calloc_atomic(nelem, elsize) memset(GE_null(GC_MALLOC_ATOMIC((nelem) * (elsize))), 0, (nelem) * (elsize))
#else /* No GC */
#define GE_calloc(nelem, elsize) GE_null(calloc((nelem), (elsize)))
#endif

/*
 * Allocate memory that can contain pointers to collectable objects.
 * The allocated memory is not necessarily zeroed.
 * The allocated object is itself not collectable.
 */
#ifdef EIF_BOEHM_GC
#define GE_malloc_uncollectable(size) GE_null(GC_MALLOC_UNCOLLECTABLE(size))
#else /* No GC */
#define GE_malloc_uncollectable(size) GE_null(malloc(size))
#endif

/*
 * Allocate memory that does not contain pointers to collectable objects.
 * The allocated memory is not necessarily zeroed.
 * The allocated object is itself not collectable.
 */
#ifdef EIF_BOEHM_GC
#define GE_malloc_atomic_uncollectable(size) GE_null(GC_malloc_atomic_uncollectable(size))
#else /* No GC */
#define GE_malloc_uncollectable(size) GE_null(malloc(size))
#endif

/*
 * Allocate memory that can contain pointers to collectable objects.
 * The allocated memory is zeroed.
 * The allocated object is itself not collectable.
 */
#ifdef EIF_BOEHM_GC
#define GE_calloc_uncollectable(nelem, elsize) GE_null(GC_MALLOC_UNCOLLECTABLE((nelem) * (elsize)))
#else /* No GC */
#define GE_calloc_uncollectable(nelem, elsize) GE_null(calloc((nelem), (elsize)))
#endif

/*
 * Allocate memory that does not contain pointers to collectable objects.
 * The allocated memory is zeroed.
 * The allocated object is itself not collectable.
 */
#ifdef EIF_BOEHM_GC
#define GE_calloc_atomic_uncollectable(nelem, elsize) memset(GE_null(GC_malloc_atomic_uncollectable((nelem) * (elsize))), 0, (nelem) * (elsize))
#else /* No GC */
#define GE_calloc_atomic_uncollectable(nelem, elsize) GE_null(calloc((nelem), (elsize)))
#endif

/*
 * Allocate more memory for the given pointer.
 * The reallocated pointer keeps the same properties (e.g. atomic or not, collectable or not).
 * The extra allocated memory is not necessarily zeroed.
 * The allocated object is itself collectable.
 */
#ifdef EIF_BOEHM_GC
#define GE_realloc(p, size) GE_null(GC_REALLOC((p), (size)))
#else /* No GC */
#define GE_realloc(p, size) GE_null(realloc((p), (size)))
#endif

/*
 * Allocate more memory for the given pointer.
 * The reallocated pointer keeps the same properties (e.g. atomic or not, collectable or not).
 * The extra allocated memory is zeroed.
 * The allocated object is itself collectable.
 */
extern void* GE_recalloc(void* p, size_t old_nelem, size_t new_nelem, size_t elsize);

/*
 * Explicitly deallocate an object.
 */
#ifdef EIF_BOEHM_GC
#define GE_free(p) GC_FREE(p)
#else /* No GC */
#define GE_free(p) free(p)
#endif

/*
 * When defined, GE_malloc_cleared means that GE_malloc and GE_malloc_uncollectable
 * make sure that the allocated memory is zeroed.
 */
#ifdef EIF_BOEHM_GC
#define GE_malloc_cleared
#else /* No GC */
#endif

/*
 * When defined, GE_malloc_atomic_cleared means that GE_malloc_atomic and
 * GE_malloc_atomic_uncollectable make sure that the allocated memory is zeroed.
 */
#ifdef EIF_BOEHM_GC
/* #define GE_malloc_atomic_cleared */
#else /* No GC */
#endif


/*
	Dispose
*/

/*
 * Register dispose routine `disp' to be called on object `obj' when it will be collected.
 */
#ifdef EIF_BOEHM_GC
extern void GE_boehm_dispose(void* C, void* disp); /* Call dispose routine `disp' on object `C'. */
#define GE_register_dispose(obj, disp) GC_REGISTER_FINALIZER((void*)(obj), (void (*) (void*, void*)) &GE_boehm_dispose, NULL, NULL, NULL)
#else /* No GC */
#define GE_register_dispose(obj, disp) /* do nothing */
#endif


/*
	Access to objects, useful with GCs which move objects in memory.
	This is not the case here, since the Boehm GC is not a moving GC.
*/

/* Access object through hector */
#define eif_access(obj) (obj)
/* Freeze memory address */
#define eif_freeze(obj) (obj)
/* The C side adopts an object */
#define eif_adopt(obj) (obj)
/* The C side protects an object */
#define eif_protect(obj) (obj)
/* The C side weans adopted object */
#define eif_wean(obj) (obj)
/* Forget a frozen memory address */
#define eif_unfreeze(obj)
/* Always frozen since they do not move */
#define eif_frozen(obj) 1
/* Always frozen since they do not move */
#define spfrozen(obj) 1

#endif

/*
	description:

		"C functions used to implement class IDENTIFIED"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_IDENTIFIED_H
#define GE_IDENTIFIED_H

#ifdef __cplusplus
extern "C" {
#endif

/*
	Initialize data to keep track of object ids.
*/
extern void GE_init_identified(void);

/*
	Get a new id for `object', assuming it is NOT in the stack.
*/
extern EIF_INTEGER_32 GE_object_id(EIF_OBJECT object);

/*
	Return the object associated with `id'.
*/
extern EIF_REFERENCE GE_id_object(EIF_INTEGER_32 id);

/*
	Remove the object associated with `id' from the stack.
*/
extern void GE_object_id_free(EIF_INTEGER_32 id);

#ifdef __cplusplus
}
#endif

#endif

#ifdef __cplusplus
extern "C" {
#endif

#define T0 EIF_ANY

/* CHARACTER */
#define EIF_CHARACTER EIF_CHARACTER_8

/* WIDE_CHARACTER */
#define EIF_WIDE_CHAR EIF_CHARACTER_32

/* INTEGER */
#define EIF_INTEGER EIF_INTEGER_32

/* NATURAL */
#define EIF_NATURAL EIF_NATURAL_32

/* REAL */
#define EIF_REAL EIF_REAL_32

/* DOUBLE */
#define EIF_DOUBLE EIF_REAL_64

/* BOOLEAN */
#define T1 EIF_BOOLEAN
extern T0* GE_boxed1(T1 a1);
typedef struct Sb1 Tb1;

/* CHARACTER_8 */
#define T2 EIF_CHARACTER_8
extern T0* GE_boxed2(T2 a1);
typedef struct Sb2 Tb2;

/* CHARACTER_32 */
#define T3 EIF_CHARACTER_32
extern T0* GE_boxed3(T3 a1);
typedef struct Sb3 Tb3;

/* INTEGER_8 */
#define T4 EIF_INTEGER_8
extern T0* GE_boxed4(T4 a1);
typedef struct Sb4 Tb4;

/* INTEGER_16 */
#define T5 EIF_INTEGER_16
extern T0* GE_boxed5(T5 a1);
typedef struct Sb5 Tb5;

/* INTEGER_32 */
#define T6 EIF_INTEGER_32
extern T0* GE_boxed6(T6 a1);
typedef struct Sb6 Tb6;

/* INTEGER_64 */
#define T7 EIF_INTEGER_64
extern T0* GE_boxed7(T7 a1);
typedef struct Sb7 Tb7;

/* NATURAL_8 */
#define T8 EIF_NATURAL_8
extern T0* GE_boxed8(T8 a1);
typedef struct Sb8 Tb8;

/* NATURAL_16 */
#define T9 EIF_NATURAL_16
extern T0* GE_boxed9(T9 a1);
typedef struct Sb9 Tb9;

/* NATURAL_32 */
#define T10 EIF_NATURAL_32
extern T0* GE_boxed10(T10 a1);
typedef struct Sb10 Tb10;

/* NATURAL_64 */
#define T11 EIF_NATURAL_64
extern T0* GE_boxed11(T11 a1);
typedef struct Sb11 Tb11;

/* REAL_32 */
#define T12 EIF_REAL_32
extern T0* GE_boxed12(T12 a1);
typedef struct Sb12 Tb12;

/* REAL_64 */
#define T13 EIF_REAL_64
extern T0* GE_boxed13(T13 a1);
typedef struct Sb13 Tb13;

/* POINTER */
#define T14 EIF_POINTER
extern T0* GE_boxed14(T14 a1);
typedef struct Sb14 Tb14;

/* SPECIAL [CHARACTER_8] */
typedef struct S15 T15;

/* SPECIAL [CHARACTER_32] */
typedef struct S16 T16;

/* STRING_8 */
typedef struct S17 T17;

/* STRING_32 */
typedef struct S18 T18;

/* GEANT */
typedef struct S21 T21;

/* GEANT_PROJECT */
typedef struct S22 T22;

/* GEANT_PROJECT_LOADER */
typedef struct S23 T23;

/* GEANT_PROJECT_OPTIONS */
typedef struct S24 T24;

/* GEANT_PROJECT_VARIABLES */
typedef struct S25 T25;

/* GEANT_TARGET */
typedef struct S26 T26;

/* KL_ARGUMENTS */
typedef struct S27 T27;

/* UT_ERROR_HANDLER */
typedef struct S28 T28;

/* GEANT_VARIABLES */
typedef struct S29 T29;

/* GEANT_PROJECT_ELEMENT */
typedef struct S30 T30;

/* DS_HASH_TABLE [GEANT_TARGET, STRING_8] */
typedef struct S31 T31;

/* SPECIAL [STRING_8] */
typedef struct S32 T32;

/* ARRAY [STRING_8] */
typedef struct S33 T33;

/* GEANT_ARGUMENT_VARIABLES */
typedef struct S34 T34;

/* AP_FLAG */
typedef struct S35 T35;

/* AP_ALTERNATIVE_OPTIONS_LIST */
typedef struct S36 T36;

/* AP_STRING_OPTION */
typedef struct S37 T37;

/* AP_PARSER */
typedef struct S38 T38;

/* AP_ERROR */
typedef struct S40 T40;

/* AP_ERROR_HANDLER */
typedef struct S45 T45;

/* KL_STANDARD_FILES */
typedef struct S46 T46;

/* KL_STDERR_FILE */
typedef struct S47 T47;

/* KL_EXCEPTIONS */
typedef struct S48 T48;

/* UT_VERSION_NUMBER */
typedef struct S49 T49;

/* KL_OPERATING_SYSTEM */
typedef struct S51 T51;

/* KL_WINDOWS_FILE_SYSTEM */
typedef struct S53 T53;

/* KL_UNIX_FILE_SYSTEM */
typedef struct S54 T54;

/* KL_TEXT_INPUT_FILE */
typedef struct S55 T55;

/* GEANT_PROJECT_PARSER */
typedef struct S56 T56;

/* GEANT_PROJECT_VARIABLE_RESOLVER */
typedef struct S58 T58;

/* UC_STRING_EQUALITY_TESTER */
typedef struct S59 T59;

/* KL_SPECIAL_ROUTINES [STRING_8] */
typedef struct S62 T62;

/* SPECIAL [INTEGER_32] */
typedef struct S63 T63;

/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
typedef struct S64 T64;

/* KL_SPECIAL_ROUTINES [INTEGER_32] */
typedef struct S65 T65;

/* KL_STDOUT_FILE */
typedef struct S67 T67;

/* DS_LINKED_LIST_CURSOR [AP_OPTION] */
typedef struct S68 T68;

/* DS_ARRAYED_LIST [detachable STRING_8] */
typedef struct S70 T70;

/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8] */
typedef struct S71 T71;

/* AP_DISPLAY_HELP_FLAG */
typedef struct S72 T72;

/* DS_ARRAYED_LIST [AP_OPTION] */
typedef struct S73 T73;

/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S74 T74;

/* KL_STRING_ROUTINES */
typedef struct S75 T75;

/* TYPED_POINTER [ANY] */
typedef struct S77 T77;
extern T0* GE_boxed77(T77 a1);
typedef struct Sb77 Tb77;

/* MANAGED_POINTER */
typedef struct S78 T78;

/* FILE_INFO */
typedef struct S79 T79;

/* DS_HASH_TABLE [STRING_8, STRING_8] */
typedef struct S83 T83;

/* ARGUMENTS_32 */
typedef struct S84 T84;

/* IMMUTABLE_STRING_32 */
typedef struct S85 T85;

/* EXECUTION_ENVIRONMENT */
typedef struct S87 T87;

/* KL_ANY_ROUTINES */
typedef struct S88 T88;

/* KL_PATHNAME */
typedef struct S90 T90;

/* detachable KL_LINKABLE [CHARACTER_8] */
typedef struct S92 T92;

/* XM_EXPAT_PARSER_FACTORY */
typedef struct S94 T94;

/* XM_EIFFEL_PARSER */
typedef struct S96 T96;

/* XM_TREE_CALLBACKS_PIPE */
typedef struct S97 T97;

/* XM_CALLBACKS_TO_TREE_FILTER */
typedef struct S100 T100;

/* XM_DOCUMENT */
typedef struct S101 T101;

/* XM_ELEMENT */
typedef struct S102 T102;

/* XM_STOP_ON_ERROR_FILTER */
typedef struct S103 T103;

/* XM_POSITION_TABLE */
typedef struct S104 T104;

/* KL_EXECUTION_ENVIRONMENT */
typedef struct S107 T107;

/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES] */
typedef struct S108 T108;

/* DS_ARRAYED_STACK [GEANT_VARIABLES] */
typedef struct S109 T109;

/* DS_ARRAYED_LIST_CURSOR [AP_OPTION] */
typedef struct S110 T110;

/* SPECIAL [AP_OPTION] */
typedef struct S112 T112;

/* KL_SPECIAL_ROUTINES [AP_OPTION] */
typedef struct S113 T113;

/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S114 T114;

/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S115 T115;

/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S116 T116;

/* UC_STRING */
typedef struct S117 T117;

/* UTF_CONVERTER */
typedef struct S118 T118;
extern T0* GE_boxed118(T118 a1);
typedef struct Sb118 Tb118;

/* C_STRING */
typedef struct S119 T119;

/* PLATFORM */
typedef struct S120 T120;

/* detachable CELL [INTEGER_32] */
typedef struct S121 T121;

/* SPECIAL [NATURAL_8] */
typedef struct S122 T122;

/* TYPED_POINTER [SPECIAL [NATURAL_8]] */
typedef struct S123 T123;
extern T0* GE_boxed123(T123 a1);
typedef struct Sb123 Tb123;

/* STRING_TO_INTEGER_CONVERTOR */
typedef struct S125 T125;

/* DS_LINKED_LIST [XM_ELEMENT] */
typedef struct S127 T127;

/* DS_LINKED_LIST_CURSOR [XM_ELEMENT] */
typedef struct S128 T128;

/* GEANT_INHERIT_ELEMENT */
typedef struct S129 T129;

/* GEANT_INHERIT */
typedef struct S130 T130;

/* SPECIAL [GEANT_TARGET] */
typedef struct S131 T131;

/* KL_SPECIAL_ROUTINES [GEANT_TARGET] */
typedef struct S134 T134;

/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8] */
typedef struct S135 T135;

/* EXCEPTIONS */
typedef struct S136 T136;

/* SPECIAL [IMMUTABLE_STRING_32] */
typedef struct S137 T137;

/* ARRAY [IMMUTABLE_STRING_32] */
typedef struct S138 T138;

/* NATIVE_STRING */
typedef struct S139 T139;

/* XM_EIFFEL_SCANNER */
typedef struct S142 T142;

/* XM_DEFAULT_POSITION */
typedef struct S143 T143;

/* DS_BILINKED_LIST [XM_POSITION] */
typedef struct S145 T145;

/* DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
typedef struct S146 T146;

/* XM_CALLBACKS_NULL */
typedef struct S147 T147;

/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S148 T148;

/* XM_NULL_EXTERNAL_RESOLVER */
typedef struct S150 T150;

/* XM_DTD_CALLBACKS_NULL */
typedef struct S152 T152;

/* KL_SPECIAL_ROUTINES [detachable ANY] */
typedef struct S153 T153;

/* SPECIAL [detachable ANY] */
typedef struct S154 T154;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
typedef struct S155 T155;

/* XM_EIFFEL_PARSER_NAME */
typedef struct S156 T156;

/* SPECIAL [XM_EIFFEL_PARSER_NAME] */
typedef struct S157 T157;

/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S158 T158;

/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
typedef struct S159 T159;

/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S160 T160;

/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
typedef struct S161 T161;

/* XM_DTD_EXTERNAL_ID */
typedef struct S162 T162;

/* SPECIAL [XM_DTD_EXTERNAL_ID] */
typedef struct S163 T163;

/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
typedef struct S164 T164;

/* XM_DTD_ELEMENT_CONTENT */
typedef struct S165 T165;

/* SPECIAL [XM_DTD_ELEMENT_CONTENT] */
typedef struct S166 T166;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S167 T167;

/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S168 T168;

/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S169 T169;

/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S170 T170;

/* XM_DTD_ATTRIBUTE_CONTENT */
typedef struct S171 T171;

/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S172 T172;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
typedef struct S173 T173;

/* DS_BILINKED_LIST [STRING_8] */
typedef struct S174 T174;

/* SPECIAL [DS_BILINKED_LIST [STRING_8]] */
typedef struct S175 T175;

/* KL_SPECIAL_ROUTINES [BOOLEAN] */
typedef struct S176 T176;

/* SPECIAL [BOOLEAN] */
typedef struct S177 T177;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
typedef struct S178 T178;

/* XM_EIFFEL_DECLARATION */
typedef struct S179 T179;

/* SPECIAL [XM_EIFFEL_DECLARATION] */
typedef struct S180 T180;

/* XM_EIFFEL_ENTITY_DEF */
typedef struct S183 T183;

/* XM_EIFFEL_SCANNER_DTD */
typedef struct S184 T184;

/* XM_EIFFEL_PE_ENTITY_DEF */
typedef struct S186 T186;

/* XM_NAMESPACE_RESOLVER */
typedef struct S187 T187;

/* SPECIAL [XM_CALLBACKS_FILTER] */
typedef struct S188 T188;

/* ARRAY [XM_CALLBACKS_FILTER] */
typedef struct S189 T189;

/* DS_HASH_SET [XM_NAMESPACE] */
typedef struct S190 T190;

/* XM_NAMESPACE */
typedef struct S191 T191;

/* XM_LINKED_LIST [XM_DOCUMENT_NODE] */
typedef struct S192 T192;

/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE] */
typedef struct S196 T196;

/* XM_LINKED_LIST [XM_ELEMENT_NODE] */
typedef struct S199 T199;

/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S201 T201;

/* SPECIAL [GEANT_ARGUMENT_VARIABLES] */
typedef struct S202 T202;

/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES] */
typedef struct S203 T203;

/* SPECIAL [GEANT_VARIABLES] */
typedef struct S204 T204;

/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES] */
typedef struct S205 T205;

/* ARRAY [AP_OPTION] */
typedef struct S206 T206;

/* ARRAY [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S207 T207;

/* DS_ARRAYED_STACK [GEANT_TARGET] */
typedef struct S209 T209;

/* GEANT_TASK_FACTORY */
typedef struct S210 T210;

/* GEANT_PARENT */
typedef struct S211 T211;

/* DS_ARRAYED_LIST [GEANT_PARENT] */
typedef struct S213 T213;

/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT] */
typedef struct S214 T214;

/* GEANT_INTERPRETING_ELEMENT */
typedef struct S215 T215;

/* GEANT_ARGUMENT_ELEMENT */
typedef struct S216 T216;

/* GEANT_LOCAL_ELEMENT */
typedef struct S217 T217;

/* GEANT_GLOBAL_ELEMENT */
typedef struct S218 T218;

/* XM_ATTRIBUTE */
typedef struct S219 T219;

/* GEANT_GROUP */
typedef struct S220 T220;

/* [attached] TYPE [STRING_8] */
#define T222 EIF_TYPE

/* TYPED_POINTER [NATURAL_16] */
typedef struct S223 T223;
extern T0* GE_boxed223(T223 a1);
typedef struct Sb223 Tb223;

/* TYPED_POINTER [NATURAL_8] */
typedef struct S224 T224;
extern T0* GE_boxed224(T224 a1);
typedef struct Sb224 Tb224;

/* ARRAY [INTEGER_32] */
typedef struct S225 T225;

/* UC_UTF8_ROUTINES */
typedef struct S226 T226;

/* UC_UTF8_STRING */
typedef struct S227 T227;

/* XM_EIFFEL_INPUT_STREAM */
typedef struct S228 T228;

/* KL_INTEGER_ROUTINES */
typedef struct S229 T229;

/* KL_PLATFORM */
typedef struct S230 T230;

/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE] */
typedef struct S231 T231;

/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S232 T232;

/* DS_PAIR [XM_POSITION, XM_NODE] */
typedef struct S233 T233;

/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER */
typedef struct S234 T234;

/* INTEGER_OVERFLOW_CHECKER */
typedef struct S235 T235;

/* detachable DS_LINKABLE [XM_ELEMENT] */
typedef struct S236 T236;

/* GEANT_PARENT_ELEMENT */
typedef struct S237 T237;

/* ARRAY [GEANT_TARGET] */
typedef struct S239 T239;

/* XM_EIFFEL_CHARACTER_ENTITY */
typedef struct S240 T240;

/* YY_BUFFER */
typedef struct S241 T241;

/* YY_FILE_BUFFER */
typedef struct S242 T242;

/* DS_LINKED_STACK [INTEGER_32] */
typedef struct S245 T245;

/* detachable DS_BILINKABLE [XM_POSITION] */
typedef struct S246 T246;

/* DS_BILINKED_LIST_CURSOR [XM_POSITION] */
typedef struct S247 T247;

/* detachable DS_LINKABLE [XM_EIFFEL_SCANNER] */
typedef struct S248 T248;

/* SPECIAL [XM_EIFFEL_ENTITY_DEF] */
typedef struct S249 T249;

/* detachable DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S252 T252;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
typedef struct S253 T253;

/* ARRAY [detachable ANY] */
typedef struct S254 T254;

/* ARRAY [XM_EIFFEL_PARSER_NAME] */
typedef struct S255 T255;

/* ARRAY [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S256 T256;

/* detachable KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
typedef struct S257 T257;

/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
typedef struct S258 T258;

/* ARRAY [XM_DTD_EXTERNAL_ID] */
typedef struct S259 T259;

/* ARRAY [XM_DTD_ELEMENT_CONTENT] */
typedef struct S260 T260;

/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
typedef struct S261 T261;

/* ARRAY [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S262 T262;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S263 T263;

/* detachable DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S264 T264;

/* ARRAY [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S265 T265;

/* DS_LINKED_LIST [STRING_8] */
typedef struct S266 T266;

/* ARRAY [DS_BILINKED_LIST [STRING_8]] */
typedef struct S267 T267;

/* DS_BILINKED_LIST_CURSOR [STRING_8] */
typedef struct S268 T268;

/* detachable DS_BILINKABLE [STRING_8] */
typedef struct S269 T269;

/* ARRAY [BOOLEAN] */
typedef struct S270 T270;

/* ARRAY [XM_EIFFEL_DECLARATION] */
typedef struct S271 T271;

/* XM_NAMESPACE_RESOLVER_CONTEXT */
typedef struct S272 T272;

/* DS_LINKED_QUEUE [STRING_8] */
typedef struct S274 T274;

/* detachable KL_EQUALITY_TESTER [XM_NAMESPACE] */
typedef struct S275 T275;

/* DS_HASH_SET_CURSOR [XM_NAMESPACE] */
typedef struct S276 T276;

/* KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
typedef struct S277 T277;

/* SPECIAL [XM_NAMESPACE] */
typedef struct S278 T278;

/* detachable DS_LINKABLE [XM_DOCUMENT_NODE] */
typedef struct S279 T279;

/* ARRAY [GEANT_ARGUMENT_VARIABLES] */
typedef struct S283 T283;

/* ARRAY [GEANT_VARIABLES] */
typedef struct S284 T284;

/* GEANT_STRING_INTERPRETER */
typedef struct S285 T285;

/* [attached] TYPE [GEANT_TARGET] */
#define T287 EIF_TYPE

/* XM_COMMENT */
typedef struct S289 T289;

/* XM_PROCESSING_INSTRUCTION */
typedef struct S290 T290;

/* XM_CHARACTER_DATA */
typedef struct S291 T291;

/* KL_ARRAY_ROUTINES [INTEGER_32] */
typedef struct S292 T292;

/* detachable DS_LINKABLE [XM_ELEMENT_NODE] */
typedef struct S294 T294;

/* detachable DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S295 T295;

/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
typedef struct S296 T296;

/* GEANT_GEC_TASK */
typedef struct S297 T297;

/* [attached] TUPLE [XM_ELEMENT] */
typedef struct S298 T298;

/* detachable TUPLE */
typedef struct S299 T299;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEC_TASK] */
typedef struct S300 T300;

/* [attached] TUPLE [GEANT_TASK_FACTORY] */
typedef struct S301 T301;

/* GEANT_ISE_TASK */
typedef struct S304 T304;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_ISE_TASK] */
typedef struct S305 T305;

/* GEANT_EXEC_TASK */
typedef struct S306 T306;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_EXEC_TASK] */
typedef struct S307 T307;

/* GEANT_LCC_TASK */
typedef struct S308 T308;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_LCC_TASK] */
typedef struct S309 T309;

/* GEANT_SET_TASK */
typedef struct S310 T310;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_SET_TASK] */
typedef struct S311 T311;

/* GEANT_UNSET_TASK */
typedef struct S312 T312;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_UNSET_TASK] */
typedef struct S313 T313;

/* GEANT_GEXACE_TASK */
typedef struct S314 T314;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEXACE_TASK] */
typedef struct S315 T315;

/* GEANT_GELEX_TASK */
typedef struct S316 T316;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GELEX_TASK] */
typedef struct S317 T317;

/* GEANT_GEYACC_TASK */
typedef struct S318 T318;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEYACC_TASK] */
typedef struct S319 T319;

/* GEANT_GEPP_TASK */
typedef struct S320 T320;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEPP_TASK] */
typedef struct S321 T321;

/* GEANT_GETEST_TASK */
typedef struct S322 T322;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GETEST_TASK] */
typedef struct S323 T323;

/* GEANT_GEANT_TASK */
typedef struct S324 T324;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEANT_TASK] */
typedef struct S325 T325;

/* GEANT_ECHO_TASK */
typedef struct S326 T326;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_ECHO_TASK] */
typedef struct S327 T327;

/* GEANT_MKDIR_TASK */
typedef struct S328 T328;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_MKDIR_TASK] */
typedef struct S329 T329;

/* GEANT_DELETE_TASK */
typedef struct S330 T330;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_DELETE_TASK] */
typedef struct S331 T331;

/* GEANT_COPY_TASK */
typedef struct S332 T332;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_COPY_TASK] */
typedef struct S333 T333;

/* GEANT_MOVE_TASK */
typedef struct S334 T334;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_MOVE_TASK] */
typedef struct S335 T335;

/* GEANT_SETENV_TASK */
typedef struct S336 T336;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_SETENV_TASK] */
typedef struct S337 T337;

/* GEANT_XSLT_TASK */
typedef struct S338 T338;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_XSLT_TASK] */
typedef struct S339 T339;

/* GEANT_OUTOFDATE_TASK */
typedef struct S340 T340;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_OUTOFDATE_TASK] */
typedef struct S341 T341;

/* GEANT_EXIT_TASK */
typedef struct S342 T342;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_EXIT_TASK] */
typedef struct S343 T343;

/* GEANT_PRECURSOR_TASK */
typedef struct S344 T344;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_PRECURSOR_TASK] */
typedef struct S345 T345;

/* GEANT_AVAILABLE_TASK */
typedef struct S346 T346;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_AVAILABLE_TASK] */
typedef struct S347 T347;

/* GEANT_INPUT_TASK */
typedef struct S348 T348;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_INPUT_TASK] */
typedef struct S349 T349;

/* GEANT_REPLACE_TASK */
typedef struct S350 T350;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_REPLACE_TASK] */
typedef struct S351 T351;

/* KL_SPECIAL_ROUTINES [GEANT_PARENT] */
typedef struct S352 T352;

/* SPECIAL [GEANT_PARENT] */
typedef struct S353 T353;

/* UC_UNICODE_ROUTINES */
typedef struct S355 T355;

/* DS_LINKED_QUEUE [CHARACTER_8] */
typedef struct S357 T357;

/* UC_UTF16_ROUTINES */
typedef struct S358 T358;

/* SPECIAL [NATURAL_64] */
typedef struct S359 T359;

/* GEANT_RENAME_ELEMENT */
typedef struct S360 T360;

/* GEANT_REDEFINE_ELEMENT */
typedef struct S361 T361;

/* GEANT_SELECT_ELEMENT */
typedef struct S362 T362;

/* GEANT_RENAME */
typedef struct S363 T363;

/* DS_HASH_TABLE [GEANT_RENAME, STRING_8] */
typedef struct S364 T364;

/* GEANT_REDEFINE */
typedef struct S365 T365;

/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8] */
typedef struct S366 T366;

/* GEANT_SELECT */
typedef struct S367 T367;

/* DS_HASH_TABLE [GEANT_SELECT, STRING_8] */
typedef struct S368 T368;

/* detachable DS_LINKABLE [INTEGER_32] */
typedef struct S369 T369;

/* ARRAY [XM_EIFFEL_ENTITY_DEF] */
typedef struct S370 T370;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
typedef struct S371 T371;

/* attached DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
typedef struct S372 T372;

/* DS_LINKED_LIST_CURSOR [STRING_8] */
typedef struct S373 T373;

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S375 T375;

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S376 T376;

/* detachable DS_LINKABLE [STRING_8] */
typedef struct S377 T377;

/* ARRAY [XM_NAMESPACE] */
typedef struct S378 T378;

/* GEANT_NAME_VALUE_ELEMENT */
typedef struct S379 T379;

/* KL_ARRAY_ROUTINES [detachable STRING_8] */
typedef struct S380 T380;

/* AP_OPTION_COMPARATOR */
typedef struct S381 T381;

/* DS_QUICK_SORTER [AP_OPTION] */
typedef struct S382 T382;

/* ST_WORD_WRAPPER */
typedef struct S384 T384;

/* KL_CHARACTER_BUFFER */
typedef struct S387 T387;

/* KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
typedef struct S390 T390;

/* SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
typedef struct S391 T391;

/* DS_HASH_TABLE_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
typedef struct S392 T392;

/* GEANT_GEC_COMMAND */
typedef struct S393 T393;

/* DS_CELL [PROCEDURE [ANY, TUPLE]] */
typedef struct S394 T394;

/* [attached] PROCEDURE [GEANT_GEC_TASK, [attached] TUPLE] */
typedef struct S395 T395;

/* [attached] TUPLE [GEANT_GEC_TASK] */
typedef struct S396 T396;

/* GEANT_ISE_COMMAND */
typedef struct S397 T397;

/* [attached] PROCEDURE [GEANT_ISE_TASK, [attached] TUPLE] */
typedef struct S398 T398;

/* [attached] TUPLE [GEANT_ISE_TASK] */
typedef struct S399 T399;

/* GEANT_FILESET_ELEMENT */
typedef struct S400 T400;

/* GEANT_EXEC_COMMAND */
typedef struct S401 T401;

/* GEANT_STRING_PROPERTY */
typedef struct S402 T402;

/* [attached] FUNCTION [GEANT_INTERPRETING_ELEMENT, [attached] TUPLE, STRING_8] */
typedef struct S403 T403;

/* [attached] TUPLE [GEANT_INTERPRETING_ELEMENT, STRING_8] */
typedef struct S404 T404;

/* GEANT_BOOLEAN_PROPERTY */
typedef struct S405 T405;

/* GEANT_FILESET */
typedef struct S406 T406;

/* [attached] PROCEDURE [GEANT_EXEC_TASK, [attached] TUPLE] */
typedef struct S407 T407;

/* [attached] TUPLE [GEANT_EXEC_TASK] */
typedef struct S408 T408;

/* GEANT_LCC_COMMAND */
typedef struct S409 T409;

/* [attached] PROCEDURE [GEANT_LCC_TASK, [attached] TUPLE] */
typedef struct S410 T410;

/* [attached] TUPLE [GEANT_LCC_TASK] */
typedef struct S411 T411;

/* GEANT_SET_COMMAND */
typedef struct S412 T412;

/* [attached] PROCEDURE [GEANT_SET_TASK, [attached] TUPLE] */
typedef struct S413 T413;

/* [attached] TUPLE [GEANT_SET_TASK] */
typedef struct S414 T414;

/* GEANT_UNSET_COMMAND */
typedef struct S415 T415;

/* [attached] PROCEDURE [GEANT_UNSET_TASK, [attached] TUPLE] */
typedef struct S416 T416;

/* [attached] TUPLE [GEANT_UNSET_TASK] */
typedef struct S417 T417;

/* GEANT_DEFINE_ELEMENT */
typedef struct S418 T418;

/* GEANT_GEXACE_COMMAND */
typedef struct S419 T419;

/* [attached] PROCEDURE [GEANT_GEXACE_TASK, [attached] TUPLE] */
typedef struct S420 T420;

/* [attached] TUPLE [GEANT_GEXACE_TASK] */
typedef struct S421 T421;

/* GEANT_GELEX_COMMAND */
typedef struct S422 T422;

/* [attached] PROCEDURE [GEANT_GELEX_TASK, [attached] TUPLE] */
typedef struct S423 T423;

/* [attached] TUPLE [GEANT_GELEX_TASK] */
typedef struct S424 T424;

/* GEANT_GEYACC_COMMAND */
typedef struct S425 T425;

/* [attached] PROCEDURE [GEANT_GEYACC_TASK, [attached] TUPLE] */
typedef struct S426 T426;

/* [attached] TUPLE [GEANT_GEYACC_TASK] */
typedef struct S427 T427;

/* GEANT_GEPP_COMMAND */
typedef struct S428 T428;

/* [attached] PROCEDURE [GEANT_GEPP_TASK, [attached] TUPLE] */
typedef struct S429 T429;

/* [attached] TUPLE [GEANT_GEPP_TASK] */
typedef struct S430 T430;

/* GEANT_GETEST_COMMAND */
typedef struct S431 T431;

/* [attached] PROCEDURE [GEANT_GETEST_TASK, [attached] TUPLE] */
typedef struct S432 T432;

/* [attached] TUPLE [GEANT_GETEST_TASK] */
typedef struct S433 T433;

/* GEANT_GEANT_COMMAND */
typedef struct S434 T434;

/* ST_SPLITTER */
typedef struct S435 T435;

/* [attached] PROCEDURE [GEANT_GEANT_TASK, [attached] TUPLE] */
typedef struct S436 T436;

/* [attached] TUPLE [GEANT_GEANT_TASK] */
typedef struct S437 T437;

/* GEANT_ECHO_COMMAND */
typedef struct S438 T438;

/* [attached] PROCEDURE [GEANT_ECHO_TASK, [attached] TUPLE] */
typedef struct S439 T439;

/* [attached] TUPLE [GEANT_ECHO_TASK] */
typedef struct S440 T440;

/* GEANT_MKDIR_COMMAND */
typedef struct S441 T441;

/* [attached] PROCEDURE [GEANT_MKDIR_TASK, [attached] TUPLE] */
typedef struct S442 T442;

/* [attached] TUPLE [GEANT_MKDIR_TASK] */
typedef struct S443 T443;

/* GEANT_DIRECTORYSET_ELEMENT */
typedef struct S444 T444;

/* GEANT_DELETE_COMMAND */
typedef struct S445 T445;

/* GEANT_DIRECTORYSET */
typedef struct S446 T446;

/* [attached] PROCEDURE [GEANT_DELETE_TASK, [attached] TUPLE] */
typedef struct S447 T447;

/* [attached] TUPLE [GEANT_DELETE_TASK] */
typedef struct S448 T448;

/* GEANT_COPY_COMMAND */
typedef struct S449 T449;

/* [attached] PROCEDURE [GEANT_COPY_TASK, [attached] TUPLE] */
typedef struct S450 T450;

/* [attached] TUPLE [GEANT_COPY_TASK] */
typedef struct S451 T451;

/* GEANT_MOVE_COMMAND */
typedef struct S452 T452;

/* [attached] PROCEDURE [GEANT_MOVE_TASK, [attached] TUPLE] */
typedef struct S453 T453;

/* [attached] TUPLE [GEANT_MOVE_TASK] */
typedef struct S454 T454;

/* GEANT_SETENV_COMMAND */
typedef struct S455 T455;

/* [attached] PROCEDURE [GEANT_SETENV_TASK, [attached] TUPLE] */
typedef struct S456 T456;

/* [attached] TUPLE [GEANT_SETENV_TASK] */
typedef struct S457 T457;

/* DS_PAIR [STRING_8, STRING_8] */
typedef struct S458 T458;

/* GEANT_XSLT_COMMAND */
typedef struct S459 T459;

/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S460 T460;

/* [attached] PROCEDURE [GEANT_XSLT_TASK, [attached] TUPLE] */
typedef struct S461 T461;

/* [attached] TUPLE [GEANT_XSLT_TASK] */
typedef struct S462 T462;

/* GEANT_OUTOFDATE_COMMAND */
typedef struct S463 T463;

/* [attached] PROCEDURE [GEANT_OUTOFDATE_TASK, [attached] TUPLE] */
typedef struct S464 T464;

/* [attached] TUPLE [GEANT_OUTOFDATE_TASK] */
typedef struct S465 T465;

/* GEANT_EXIT_COMMAND */
typedef struct S466 T466;

/* [attached] PROCEDURE [GEANT_EXIT_TASK, [attached] TUPLE] */
typedef struct S467 T467;

/* [attached] TUPLE [GEANT_EXIT_TASK] */
typedef struct S468 T468;

/* GEANT_PRECURSOR_COMMAND */
typedef struct S469 T469;

/* [attached] PROCEDURE [GEANT_PRECURSOR_TASK, [attached] TUPLE] */
typedef struct S470 T470;

/* [attached] TUPLE [GEANT_PRECURSOR_TASK] */
typedef struct S471 T471;

/* GEANT_AVAILABLE_COMMAND */
typedef struct S472 T472;

/* [attached] PROCEDURE [GEANT_AVAILABLE_TASK, [attached] TUPLE] */
typedef struct S473 T473;

/* [attached] TUPLE [GEANT_AVAILABLE_TASK] */
typedef struct S474 T474;

/* GEANT_INPUT_COMMAND */
typedef struct S475 T475;

/* [attached] PROCEDURE [GEANT_INPUT_TASK, [attached] TUPLE] */
typedef struct S476 T476;

/* [attached] TUPLE [GEANT_INPUT_TASK] */
typedef struct S477 T477;

/* GEANT_REPLACE_COMMAND */
typedef struct S478 T478;

/* [attached] PROCEDURE [GEANT_REPLACE_TASK, [attached] TUPLE] */
typedef struct S479 T479;

/* [attached] TUPLE [GEANT_REPLACE_TASK] */
typedef struct S480 T480;

/* ARRAY [GEANT_PARENT] */
typedef struct S481 T481;

/* SPECIAL [ARRAY [INTEGER_32]] */
typedef struct S482 T482;

/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
typedef struct S483 T483;

/* detachable DS_LINKABLE [CHARACTER_8] */
typedef struct S484 T484;

/* detachable KL_EQUALITY_TESTER [GEANT_RENAME] */
typedef struct S485 T485;

/* KL_SPECIAL_ROUTINES [GEANT_RENAME] */
typedef struct S487 T487;

/* SPECIAL [GEANT_RENAME] */
typedef struct S488 T488;

/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8] */
typedef struct S489 T489;

/* detachable KL_EQUALITY_TESTER [GEANT_REDEFINE] */
typedef struct S490 T490;

/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE] */
typedef struct S492 T492;

/* SPECIAL [GEANT_REDEFINE] */
typedef struct S493 T493;

/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8] */
typedef struct S494 T494;

/* detachable KL_EQUALITY_TESTER [GEANT_SELECT] */
typedef struct S495 T495;

/* KL_SPECIAL_ROUTINES [GEANT_SELECT] */
typedef struct S497 T497;

/* SPECIAL [GEANT_SELECT] */
typedef struct S498 T498;

/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8] */
typedef struct S499 T499;

/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S500 T500;

/* KL_DIRECTORY */
typedef struct S501 T501;

/* KL_STRING_INPUT_STREAM */
typedef struct S502 T502;

/* KL_ARRAY [detachable STRING_8] */
typedef struct S504 T504;

/* ARRAY [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
typedef struct S505 T505;

/* GEANT_MAP_ELEMENT */
typedef struct S508 T508;

/* GEANT_MAP */
typedef struct S509 T509;

/* DS_HASH_SET [GEANT_FILESET_ENTRY] */
typedef struct S512 T512;

/* DS_HASH_SET [STRING_8] */
typedef struct S514 T514;

/* LX_DFA_WILDCARD */
typedef struct S516 T516;

/* DS_HASH_SET [INTEGER_32] */
typedef struct S518 T518;

/* DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8]]] */
typedef struct S519 T519;

/* [attached] TUPLE [STRING_8] */
typedef struct S520 T520;

/* [attached] PROCEDURE [GEANT_ECHO_COMMAND, [attached] TUPLE [STRING_8]] */
typedef struct S521 T521;

/* [attached] TUPLE [GEANT_ECHO_COMMAND] */
typedef struct S522 T522;

/* DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]]] */
typedef struct S524 T524;

/* KL_TEXT_OUTPUT_FILE */
typedef struct S525 T525;

/* [attached] TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN] */
typedef struct S526 T526;

/* [attached] PROCEDURE [GEANT_ECHO_COMMAND, [attached] TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]] */
typedef struct S527 T527;

/* [attached] PROCEDURE [GEANT_MKDIR_COMMAND, [attached] TUPLE [STRING_8]] */
typedef struct S529 T529;

/* [attached] TUPLE [GEANT_MKDIR_COMMAND] */
typedef struct S530 T530;

/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S531 T531;

/* SPECIAL [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S532 T532;

/* DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S533 T533;

/* DS_CELL [FUNCTION [ANY, TUPLE [STRING_8], BOOLEAN]] */
typedef struct S534 T534;

/* [attached] PREDICATE [GEANT_AVAILABLE_COMMAND, [attached] TUPLE [STRING_8]] */
typedef struct S535 T535;

/* [attached] TUPLE [GEANT_AVAILABLE_COMMAND] */
typedef struct S536 T536;

/* ARRAY [GEANT_RENAME] */
typedef struct S538 T538;

/* ARRAY [GEANT_REDEFINE] */
typedef struct S539 T539;

/* ARRAY [GEANT_SELECT] */
typedef struct S540 T540;

/* [attached] TYPE [INTEGER_32] */
#define T543 EIF_TYPE

/* detachable KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY] */
typedef struct S544 T544;

/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY] */
typedef struct S545 T545;

/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY] */
typedef struct S546 T546;

/* GEANT_FILESET_ENTRY */
typedef struct S547 T547;

/* SPECIAL [GEANT_FILESET_ENTRY] */
typedef struct S548 T548;

/* DS_HASH_SET_CURSOR [STRING_8] */
typedef struct S549 T549;

/* LX_WILDCARD_PARSER */
typedef struct S550 T550;

/* LX_DESCRIPTION */
typedef struct S551 T551;

/* LX_FULL_DFA */
typedef struct S552 T552;

/* DS_HASH_SET_CURSOR [INTEGER_32] */
typedef struct S554 T554;

/* detachable KL_EQUALITY_TESTER [INTEGER_32] */
typedef struct S555 T555;

/* ARRAY [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S556 T556;

/* KL_NULL_TEXT_OUTPUT_STREAM */
typedef struct S557 T557;

/* DP_SHELL_COMMAND */
typedef struct S558 T558;

/* DS_CELL [BOOLEAN] */
typedef struct S559 T559;

/* KL_BOOLEAN_ROUTINES */
typedef struct S561 T561;

/* GEANT_VARIABLES_VARIABLE_RESOLVER */
typedef struct S562 T562;

/* RX_PCRE_REGULAR_EXPRESSION */
typedef struct S563 T563;

/* KL_STRING_EQUALITY_TESTER */
typedef struct S564 T564;

/* KL_STDIN_FILE */
typedef struct S565 T565;

/* [attached] TYPE [GEANT_FILESET_ENTRY] */
#define T567 EIF_TYPE

/* ARRAY [GEANT_FILESET_ENTRY] */
typedef struct S569 T569;

/* DS_ARRAYED_LIST [LX_RULE] */
typedef struct S570 T570;

/* LX_START_CONDITIONS */
typedef struct S571 T571;

/* LX_ACTION_FACTORY */
typedef struct S572 T572;

/* DS_ARRAYED_STACK [INTEGER_32] */
typedef struct S573 T573;

/* LX_SYMBOL_CLASS */
typedef struct S574 T574;

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8] */
typedef struct S575 T575;

/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS] */
typedef struct S576 T576;

/* SPECIAL [LX_SYMBOL_CLASS] */
typedef struct S577 T577;

/* KL_SPECIAL_ROUTINES [LX_NFA] */
typedef struct S578 T578;

/* LX_NFA */
typedef struct S579 T579;

/* SPECIAL [LX_NFA] */
typedef struct S580 T580;

/* LX_EQUIVALENCE_CLASSES */
typedef struct S581 T581;

/* LX_RULE */
typedef struct S582 T582;

/* UT_SYNTAX_ERROR */
typedef struct S583 T583;

/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
typedef struct S584 T584;

/* LX_UNRECOGNIZED_RULE_ERROR */
typedef struct S585 T585;

/* LX_MISSING_QUOTE_ERROR */
typedef struct S586 T586;

/* LX_BAD_CHARACTER_CLASS_ERROR */
typedef struct S587 T587;

/* LX_BAD_CHARACTER_ERROR */
typedef struct S588 T588;

/* LX_FULL_AND_META_ERROR */
typedef struct S589 T589;

/* LX_FULL_AND_REJECT_ERROR */
typedef struct S590 T590;

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR */
typedef struct S591 T591;

/* LX_CHARACTER_OUT_OF_RANGE_ERROR */
typedef struct S592 T592;

/* SPECIAL [LX_RULE] */
typedef struct S593 T593;

/* ARRAY [LX_RULE] */
typedef struct S594 T594;

/* LX_DFA_STATE */
typedef struct S595 T595;

/* DS_ARRAYED_LIST [LX_NFA_STATE] */
typedef struct S596 T596;

/* DS_ARRAYED_LIST [LX_DFA_STATE] */
typedef struct S597 T597;

/* LX_SYMBOL_PARTITIONS */
typedef struct S598 T598;

/* KL_ARRAY_ROUTINES [LX_RULE] */
typedef struct S599 T599;

/* LX_START_CONDITION */
typedef struct S600 T600;

/* LX_TRANSITION_TABLE [LX_DFA_STATE] */
typedef struct S601 T601;

/* DS_ARRAYED_LIST [LX_NFA] */
typedef struct S602 T602;

/* DS_HASH_TABLE [LX_NFA, INTEGER_32] */
typedef struct S603 T603;

/* LX_NFA_STATE */
typedef struct S604 T604;

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR */
typedef struct S606 T606;

/* RX_BYTE_CODE */
typedef struct S608 T608;

/* RX_CHARACTER_SET */
typedef struct S609 T609;

/* RX_CASE_MAPPING */
typedef struct S610 T610;

/* SPECIAL [RX_CHARACTER_SET] */
typedef struct S612 T612;

/* ARRAY [RX_CHARACTER_SET] */
typedef struct S613 T613;

/* KL_SPECIAL_ROUTINES [LX_RULE] */
typedef struct S614 T614;

/* DS_ARRAYED_LIST_CURSOR [LX_RULE] */
typedef struct S615 T615;

/* SPECIAL [LX_START_CONDITION] */
typedef struct S616 T616;

/* KL_SPECIAL_ROUTINES [LX_START_CONDITION] */
typedef struct S617 T617;

/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION] */
typedef struct S618 T618;

/* DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
typedef struct S619 T619;

/* ARRAY [LX_SYMBOL_CLASS] */
typedef struct S622 T622;

/* ARRAY [LX_NFA] */
typedef struct S623 T623;

/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE] */
typedef struct S624 T624;

/* LX_EPSILON_TRANSITION [LX_NFA_STATE] */
typedef struct S626 T626;

/* LX_SYMBOL_TRANSITION [LX_NFA_STATE] */
typedef struct S628 T628;

/* DS_BILINKABLE [INTEGER_32] */
typedef struct S629 T629;

/* SPECIAL [DS_BILINKABLE [INTEGER_32]] */
typedef struct S630 T630;

/* ARRAY [DS_BILINKABLE [INTEGER_32]] */
typedef struct S631 T631;

/* LX_ACTION */
typedef struct S633 T633;

/* DS_BUBBLE_SORTER [LX_NFA_STATE] */
typedef struct S634 T634;

/* DS_BUBBLE_SORTER [LX_RULE] */
typedef struct S636 T636;

/* SPECIAL [LX_NFA_STATE] */
typedef struct S638 T638;

/* KL_SPECIAL_ROUTINES [LX_NFA_STATE] */
typedef struct S640 T640;

/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE] */
typedef struct S641 T641;

/* SPECIAL [LX_DFA_STATE] */
typedef struct S643 T643;

/* KL_SPECIAL_ROUTINES [LX_DFA_STATE] */
typedef struct S644 T644;

/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE] */
typedef struct S645 T645;

/* KL_ARRAY [LX_RULE] */
typedef struct S646 T646;

/* ARRAY [detachable LX_DFA_STATE] */
typedef struct S647 T647;

/* KL_ARRAY_ROUTINES [detachable LX_DFA_STATE] */
typedef struct S648 T648;

/* DS_ARRAYED_LIST_CURSOR [LX_NFA] */
typedef struct S649 T649;

/* DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32] */
typedef struct S651 T651;

/* KL_BINARY_INPUT_FILE */
typedef struct S652 T652;

/* KL_BINARY_OUTPUT_FILE */
typedef struct S653 T653;

/* [attached] TYPE [BOOLEAN] */
#define T654 EIF_TYPE

/* PATH */
typedef struct S659 T659;

/* RAW_FILE */
typedef struct S660 T660;

/* DIRECTORY */
typedef struct S661 T661;

/* ARRAYED_LIST [READABLE_STRING_32] */
typedef struct S662 T662;

/* [attached] TUPLE [ARRAYED_LIST [READABLE_STRING_32]] */
typedef struct S663 T663;

/* KL_COMPARABLE_COMPARATOR [LX_RULE] */
typedef struct S666 T666;

/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE] */
typedef struct S669 T669;

/* ARRAY [LX_START_CONDITION] */
typedef struct S672 T672;

/* ARRAY [LX_NFA_STATE] */
typedef struct S673 T673;

/* STRING_8_SEARCHER */
typedef struct S674 T674;

/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32] */
typedef struct S675 T675;

/* DS_SHELL_SORTER [INTEGER_32] */
typedef struct S676 T676;

/* ARRAYED_LIST [READABLE_STRING_GENERAL] */
typedef struct S678 T678;

/* [attached] TUPLE [ARRAYED_LIST [READABLE_STRING_GENERAL]] */
typedef struct S679 T679;

/* SPECIAL [READABLE_STRING_32] */
typedef struct S680 T680;

/* KL_COMPARABLE_COMPARATOR [INTEGER_32] */
typedef struct S681 T681;

/* PRIMES */
typedef struct S684 T684;

/* SPECIAL [NATIVE_STRING] */
typedef struct S685 T685;

/* SPECIAL [READABLE_STRING_GENERAL] */
typedef struct S686 T686;

/* Struct for boxed version of type BOOLEAN */
struct Sb1 {
	int id;
	T1 z1; /* item */
};

/* Struct for boxed version of type CHARACTER_8 */
struct Sb2 {
	int id;
	T2 z1; /* item */
};

/* Struct for boxed version of type CHARACTER_32 */
struct Sb3 {
	int id;
	T3 z1; /* item */
};

/* Struct for boxed version of type INTEGER_8 */
struct Sb4 {
	int id;
	T4 z1; /* item */
};

/* Struct for boxed version of type INTEGER_16 */
struct Sb5 {
	int id;
	T5 z1; /* item */
};

/* Struct for boxed version of type INTEGER_32 */
struct Sb6 {
	int id;
	T6 z1; /* item */
};

/* Struct for boxed version of type INTEGER_64 */
struct Sb7 {
	int id;
	T7 z1; /* item */
};

/* Struct for boxed version of type NATURAL_8 */
struct Sb8 {
	int id;
	T8 z1; /* item */
};

/* Struct for boxed version of type NATURAL_16 */
struct Sb9 {
	int id;
	T9 z1; /* item */
};

/* Struct for boxed version of type NATURAL_32 */
struct Sb10 {
	int id;
	T10 z1; /* item */
};

/* Struct for boxed version of type NATURAL_64 */
struct Sb11 {
	int id;
	T11 z1; /* item */
};

/* Struct for boxed version of type REAL_32 */
struct Sb12 {
	int id;
	T12 z1; /* item */
};

/* Struct for boxed version of type REAL_64 */
struct Sb13 {
	int id;
	T13 z1; /* item */
};

/* Struct for boxed version of type POINTER */
struct Sb14 {
	int id;
	T14 z1; /* item */
};

/* Struct for type UTF_CONVERTER */
struct S118 {
	char dummy;
};

/* Struct for boxed version of type UTF_CONVERTER */
struct Sb118 {
	int id;
	T118 z1; /* item */
};

/* Struct for type TYPED_POINTER [NATURAL_8] */
struct S224 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for boxed version of type TYPED_POINTER [NATURAL_8] */
struct Sb224 {
	int id;
	T224 z1; /* item */
};

/* Struct for type TYPED_POINTER [NATURAL_16] */
struct S223 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for boxed version of type TYPED_POINTER [NATURAL_16] */
struct Sb223 {
	int id;
	T223 z1; /* item */
};

/* Struct for type TYPED_POINTER [SPECIAL [NATURAL_8]] */
struct S123 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for boxed version of type TYPED_POINTER [SPECIAL [NATURAL_8]] */
struct Sb123 {
	int id;
	T123 z1; /* item */
};

/* Struct for type TYPED_POINTER [ANY] */
struct S77 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for boxed version of type TYPED_POINTER [ANY] */
struct Sb77 {
	int id;
	T77 z1; /* item */
};

/* Struct for type SPECIAL [CHARACTER_8] */
struct S15 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T2 z2[1]; /* item */
};

/* Struct for type SPECIAL [CHARACTER_32] */
struct S16 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T3 z2[1]; /* item */
};

/* Struct for type STRING_8 */
struct S17 {
	int id;
	T0* a1; /* area */
	T6 a2; /* count */
	T6 a3; /* internal_hash_code */
};

/* Struct for type STRING_32 */
struct S18 {
	int id;
	T0* a1; /* area */
	T6 a2; /* count */
	T6 a3; /* internal_hash_code */
};

/* Struct for type GEANT */
struct S21 {
	int id;
	T0* a1; /* error_handler */
	T1 a2; /* verbose */
	T1 a3; /* debug_mode */
	T1 a4; /* no_exec */
	T0* a5; /* build_filename */
	T0* a6; /* start_target_name */
	T1 a7; /* show_target_info */
};

/* Struct for type GEANT_PROJECT */
struct S22 {
	int id;
	T0* a1; /* targets */
	T0* a2; /* name */
	T1 a3; /* build_successful */
	T0* a4; /* start_target_name */
	T0* a5; /* default_target_name */
	T0* a6; /* output_file */
	T0* a7; /* selected_targets */
	T0* a8; /* targets_stack */
	T0* a9; /* task_factory */
	T0* a10; /* options */
	T0* a11; /* inherit_clause */
	T0* a12; /* position_table */
	T0* a13; /* description */
	T1 a14; /* old_inherit */
	T0* a15; /* variables */
};

/* Struct for type GEANT_PROJECT_LOADER */
struct S23 {
	int id;
	T0* a1; /* project_element */
	T0* a2; /* build_filename */
};

/* Struct for type GEANT_PROJECT_OPTIONS */
struct S24 {
	int id;
	T1 a1; /* verbose */
	T1 a2; /* debug_mode */
	T1 a3; /* no_exec */
	T1 a4; /* variable_local_by_default */
};

/* Struct for type GEANT_PROJECT_VARIABLES */
struct S25 {
	int id;
	T0* a1; /* key_equality_tester */
	T0* a2; /* internal_keys */
	T6 a3; /* position */
	T6 a4; /* count */
	T6 a5; /* capacity */
	T6 a6; /* slots_position */
	T6 a7; /* free_slot */
	T6 a8; /* last_position */
	T0* a9; /* equality_tester */
	T6 a10; /* found_position */
	T6 a11; /* modulus */
	T6 a12; /* clashes_previous_position */
	T0* a13; /* special_item_routines */
	T0* a14; /* item_storage */
	T0* a15; /* clashes */
	T0* a16; /* slots */
	T0* a17; /* special_key_routines */
	T0* a18; /* key_storage */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type GEANT_TARGET */
struct S26 {
	int id;
	T0* a1; /* name */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
	T0* a5; /* formal_arguments */
	T0* a6; /* formal_locals */
	T0* a7; /* formal_globals */
	T0* a8; /* obsolete_message */
	T0* a9; /* exports */
	T1 a10; /* execute_once */
	T0* a11; /* description */
	T1 a12; /* is_executed */
	T0* a13; /* precursor_target */
	T0* a14; /* redefining_target */
};

/* Struct for type KL_ARGUMENTS */
struct S27 {
	int id;
	T0* a1; /* program_name */
};

/* Struct for type UT_ERROR_HANDLER */
struct S28 {
	int id;
	T0* a1; /* error_file */
	T0* a2; /* warning_file */
	T0* a3; /* info_file */
};

/* Struct for type GEANT_VARIABLES */
struct S29 {
	int id;
	T6 a1; /* position */
	T6 a2; /* count */
	T6 a3; /* capacity */
	T6 a4; /* slots_position */
	T6 a5; /* free_slot */
	T6 a6; /* last_position */
	T0* a7; /* key_equality_tester */
	T0* a8; /* internal_keys */
	T6 a9; /* found_position */
	T6 a10; /* modulus */
	T6 a11; /* clashes_previous_position */
	T0* a12; /* special_item_routines */
	T0* a13; /* item_storage */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* special_key_routines */
	T0* a17; /* key_storage */
	T0* a18; /* equality_tester */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type GEANT_PROJECT_ELEMENT */
struct S30 {
	int id;
	T0* a1; /* project */
	T0* a2; /* xml_element */
};

/* Struct for type DS_HASH_TABLE [GEANT_TARGET, STRING_8] */
struct S31 {
	int id;
	T6 a1; /* found_position */
	T0* a2; /* item_storage */
	T0* a3; /* key_equality_tester */
	T0* a4; /* internal_keys */
	T6 a5; /* position */
	T6 a6; /* last_position */
	T6 a7; /* capacity */
	T6 a8; /* count */
	T0* a9; /* equality_tester */
	T6 a10; /* modulus */
	T6 a11; /* slots_position */
	T6 a12; /* clashes_previous_position */
	T0* a13; /* clashes */
	T0* a14; /* slots */
	T0* a15; /* special_item_routines */
	T0* a16; /* special_key_routines */
	T0* a17; /* key_storage */
	T6 a18; /* free_slot */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type SPECIAL [STRING_8] */
struct S32 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [STRING_8] */
struct S33 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type GEANT_ARGUMENT_VARIABLES */
struct S34 {
	int id;
	T6 a1; /* position */
	T6 a2; /* count */
	T6 a3; /* capacity */
	T6 a4; /* slots_position */
	T6 a5; /* free_slot */
	T6 a6; /* last_position */
	T0* a7; /* key_equality_tester */
	T0* a8; /* internal_keys */
	T6 a9; /* found_position */
	T6 a10; /* modulus */
	T6 a11; /* clashes_previous_position */
	T0* a12; /* special_item_routines */
	T0* a13; /* item_storage */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* special_key_routines */
	T0* a17; /* key_storage */
	T0* a18; /* equality_tester */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type AP_FLAG */
struct S35 {
	int id;
	T6 a1; /* occurrences */
	T0* a2; /* description */
	T0* a3; /* long_form */
	T2 a4; /* short_form */
	T1 a5; /* has_short_form */
	T1 a6; /* is_mandatory */
	T6 a7; /* maximum_occurrences */
	T1 a8; /* is_hidden */
};

/* Struct for type AP_ALTERNATIVE_OPTIONS_LIST */
struct S36 {
	int id;
	T0* a1; /* introduction_option */
	T0* a2; /* parameters_description */
	T0* a3; /* internal_cursor */
	T0* a4; /* first_cell */
};

/* Struct for type AP_STRING_OPTION */
struct S37 {
	int id;
	T0* a1; /* parameters */
	T0* a2; /* description */
	T0* a3; /* parameter_description */
	T1 a4; /* needs_parameter */
	T2 a5; /* short_form */
	T1 a6; /* has_short_form */
	T0* a7; /* long_form */
	T1 a8; /* is_mandatory */
	T6 a9; /* maximum_occurrences */
	T1 a10; /* is_hidden */
};

/* Struct for type AP_PARSER */
struct S38 {
	int id;
	T0* a1; /* options */
	T0* a2; /* alternative_options_lists */
	T0* a3; /* error_handler */
	T0* a4; /* parameters */
	T0* a5; /* help_option */
	T0* a6; /* application_description */
	T0* a7; /* parameters_description */
	T0* a8; /* current_options */
	T1 a9; /* is_first_option */
	T0* a10; /* last_option_parameter */
};

/* Struct for type AP_ERROR */
struct S40 {
	int id;
	T0* a1; /* parameters */
	T0* a2; /* default_template */
	T0* a3; /* code */
};

/* Struct for type AP_ERROR_HANDLER */
struct S45 {
	int id;
	T1 a1; /* has_error */
	T0* a2; /* error_file */
	T0* a3; /* warning_file */
	T0* a4; /* info_file */
};

/* Struct for type KL_STANDARD_FILES */
struct S46 {
	int id;
};

/* Struct for type KL_STDERR_FILE */
struct S47 {
	int id;
	T14 a1; /* file_pointer */
	T6 a2; /* mode */
	T0* a3; /* last_string */
	T0* a4; /* internal_name */
	T0* a5; /* internal_detachable_name_pointer */
};

/* Struct for type KL_EXCEPTIONS */
struct S48 {
	int id;
};

/* Struct for type UT_VERSION_NUMBER */
struct S49 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type KL_OPERATING_SYSTEM */
struct S51 {
	int id;
};

/* Struct for type KL_WINDOWS_FILE_SYSTEM */
struct S53 {
	int id;
	T2 a1; /* secondary_directory_separator */
};

/* Struct for type KL_UNIX_FILE_SYSTEM */
struct S54 {
	int id;
};

/* Struct for type KL_TEXT_INPUT_FILE */
struct S55 {
	int id;
	T6 a1; /* mode */
	T0* a2; /* internal_name */
	T0* a3; /* internal_detachable_name_pointer */
	T0* a4; /* last_string */
	T0* a5; /* name */
	T0* a6; /* character_buffer */
	T1 a7; /* end_of_file */
	T14 a8; /* file_pointer */
	T1 a9; /* descriptor_available */
	T2 a10; /* last_character */
};

/* Struct for type GEANT_PROJECT_PARSER */
struct S56 {
	int id;
	T0* a1; /* last_project_element */
	T0* a2; /* variables */
	T0* a3; /* options */
	T0* a4; /* build_filename */
	T0* a5; /* xml_parser */
	T0* a6; /* tree_pipe */
};

/* Struct for type GEANT_PROJECT_VARIABLE_RESOLVER */
struct S58 {
	int id;
	T0* a1; /* variables */
};

/* Struct for type UC_STRING_EQUALITY_TESTER */
struct S59 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [STRING_8] */
struct S62 {
	int id;
};

/* Struct for type SPECIAL [INTEGER_32] */
struct S63 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T6 z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
struct S64 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [INTEGER_32] */
struct S65 {
	int id;
};

/* Struct for type KL_STDOUT_FILE */
struct S67 {
	int id;
	T14 a1; /* file_pointer */
	T6 a2; /* mode */
	T0* a3; /* last_string */
	T0* a4; /* internal_name */
	T0* a5; /* internal_detachable_name_pointer */
};

/* Struct for type DS_LINKED_LIST_CURSOR [AP_OPTION] */
struct S68 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_ARRAYED_LIST [detachable STRING_8] */
struct S70 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* internal_cursor */
	T0* a4; /* special_routines */
	T6 a5; /* capacity */
	T0* a6; /* equality_tester */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [detachable STRING_8] */
struct S71 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type AP_DISPLAY_HELP_FLAG */
struct S72 {
	int id;
	T0* a1; /* description */
	T2 a2; /* short_form */
	T1 a3; /* has_short_form */
	T0* a4; /* long_form */
	T6 a5; /* occurrences */
	T1 a6; /* is_mandatory */
	T6 a7; /* maximum_occurrences */
	T1 a8; /* is_hidden */
};

/* Struct for type DS_ARRAYED_LIST [AP_OPTION] */
struct S73 {
	int id;
	T0* a1; /* internal_cursor */
	T6 a2; /* count */
	T0* a3; /* equality_tester */
	T0* a4; /* storage */
	T0* a5; /* special_routines */
	T6 a6; /* capacity */
};

/* Struct for type DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S74 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T6 a5; /* count */
};

/* Struct for type KL_STRING_ROUTINES */
struct S75 {
	int id;
};

/* Struct for type MANAGED_POINTER */
struct S78 {
	int id;
	T14 a1; /* item */
	T6 a2; /* count */
	T1 a3; /* is_shared */
};

/* Struct for type FILE_INFO */
struct S79 {
	int id;
	T0* a1; /* buffered_file_info */
	T1 a2; /* is_following_symlinks */
	T1 a3; /* exists */
	T0* a4; /* internal_file_name */
	T0* a5; /* internal_name_pointer */
};

/* Struct for type DS_HASH_TABLE [STRING_8, STRING_8] */
struct S83 {
	int id;
	T0* a1; /* key_equality_tester */
	T0* a2; /* internal_keys */
	T0* a3; /* equality_tester */
	T6 a4; /* capacity */
	T6 a5; /* modulus */
	T6 a6; /* last_position */
	T6 a7; /* free_slot */
	T6 a8; /* position */
	T0* a9; /* special_item_routines */
	T0* a10; /* item_storage */
	T0* a11; /* special_key_routines */
	T0* a12; /* key_storage */
	T0* a13; /* clashes */
	T0* a14; /* slots */
	T6 a15; /* found_position */
	T0* a16; /* internal_cursor */
	T6 a17; /* slots_position */
	T6 a18; /* count */
	T6 a19; /* clashes_previous_position */
	T0* a20; /* hash_function */
};

/* Struct for type ARGUMENTS_32 */
struct S84 {
	int id;
};

/* Struct for type IMMUTABLE_STRING_32 */
struct S85 {
	int id;
	T0* a1; /* area */
	T6 a2; /* count */
	T6 a3; /* internal_hash_code */
	T6 a4; /* area_lower */
};

/* Struct for type EXECUTION_ENVIRONMENT */
struct S87 {
	int id;
	T6 a1; /* return_code */
};

/* Struct for type KL_ANY_ROUTINES */
struct S88 {
	int id;
};

/* Struct for type KL_PATHNAME */
struct S90 {
	int id;
	T6 a1; /* count */
	T0* a2; /* drive */
	T0* a3; /* hostname */
	T0* a4; /* sharename */
	T1 a5; /* is_relative */
	T0* a6; /* components */
};

/* Struct for type detachable KL_LINKABLE [CHARACTER_8] */
struct S92 {
	int id;
	T2 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type XM_EXPAT_PARSER_FACTORY */
struct S94 {
	int id;
};

/* Struct for type XM_EIFFEL_PARSER */
struct S96 {
	int id;
	T0* a1; /* internal_last_error_description */
	T0* a2; /* scanner */
	T0* a3; /* error_positions */
	T0* a4; /* scanners */
	T1 a5; /* in_external_dtd */
	T0* a6; /* callbacks */
	T0* a7; /* entities */
	T0* a8; /* pe_entities */
	T0* a9; /* dtd_resolver */
	T0* a10; /* entity_resolver */
	T1 a11; /* use_namespaces */
	T6 a12; /* string_mode */
	T0* a13; /* dtd_callbacks */
	T0* a14; /* last_string_value */
	T0* a15; /* yyss */
	T0* a16; /* yyspecial_routines1 */
	T6 a17; /* yyvsc1 */
	T0* a18; /* yyvs1 */
	T0* a19; /* yyspecial_routines2 */
	T6 a20; /* yyvsc2 */
	T0* a21; /* yyvs2 */
	T0* a22; /* yyspecial_routines3 */
	T6 a23; /* yyvsc3 */
	T0* a24; /* yyvs3 */
	T0* a25; /* yyspecial_routines4 */
	T6 a26; /* yyvsc4 */
	T0* a27; /* yyvs4 */
	T0* a28; /* yyspecial_routines5 */
	T6 a29; /* yyvsc5 */
	T0* a30; /* yyvs5 */
	T0* a31; /* yyspecial_routines6 */
	T6 a32; /* yyvsc6 */
	T0* a33; /* yyvs6 */
	T0* a34; /* yyspecial_routines7 */
	T6 a35; /* yyvsc7 */
	T0* a36; /* yyvs7 */
	T0* a37; /* yyspecial_routines8 */
	T6 a38; /* yyvsc8 */
	T0* a39; /* yyvs8 */
	T0* a40; /* yyspecial_routines9 */
	T6 a41; /* yyvsc9 */
	T0* a42; /* yyvs9 */
	T0* a43; /* yyspecial_routines10 */
	T6 a44; /* yyvsc10 */
	T0* a45; /* yyvs10 */
	T0* a46; /* yyspecial_routines11 */
	T6 a47; /* yyvsc11 */
	T0* a48; /* yyvs11 */
	T0* a49; /* yytranslate */
	T0* a50; /* yyr1 */
	T0* a51; /* yytypes1 */
	T0* a52; /* yytypes2 */
	T0* a53; /* yydefact */
	T0* a54; /* yydefgoto */
	T0* a55; /* yypact */
	T0* a56; /* yypgoto */
	T0* a57; /* yytable */
	T0* a58; /* yycheck */
	T6 a59; /* yy_parsing_status */
	T6 a60; /* yy_suspended_yystacksize */
	T6 a61; /* yy_suspended_yystate */
	T6 a62; /* yy_suspended_yyn */
	T6 a63; /* yy_suspended_yychar1 */
	T6 a64; /* yy_suspended_index */
	T6 a65; /* yy_suspended_yyss_top */
	T6 a66; /* yy_suspended_yy_goto */
	T6 a67; /* yyssp */
	T6 a68; /* error_count */
	T1 a69; /* yy_lookahead_needed */
	T6 a70; /* yyerrstatus */
	T6 a71; /* last_token */
	T6 a72; /* yyvsp1 */
	T6 a73; /* yyvsp2 */
	T6 a74; /* yyvsp3 */
	T6 a75; /* yyvsp4 */
	T6 a76; /* yyvsp5 */
	T6 a77; /* yyvsp6 */
	T6 a78; /* yyvsp7 */
	T6 a79; /* yyvsp8 */
	T6 a80; /* yyvsp9 */
	T6 a81; /* yyvsp10 */
	T6 a82; /* yyvsp11 */
	T0* a83; /* last_detachable_any_value */
};

/* Struct for type XM_TREE_CALLBACKS_PIPE */
struct S97 {
	int id;
	T0* a1; /* start */
	T0* a2; /* tree */
	T0* a3; /* error */
	T0* a4; /* last */
};

/* Struct for type XM_CALLBACKS_TO_TREE_FILTER */
struct S100 {
	int id;
	T0* a1; /* last_position_table */
	T0* a2; /* document */
	T0* a3; /* source_parser */
	T0* a4; /* current_element */
	T0* a5; /* namespace_cache */
	T0* a6; /* next */
};

/* Struct for type XM_DOCUMENT */
struct S101 {
	int id;
	T0* a1; /* root_element */
	T0* a2; /* children */
};

/* Struct for type XM_ELEMENT */
struct S102 {
	int id;
	T0* a1; /* parent */
	T0* a2; /* children */
	T0* a3; /* namespace */
	T0* a4; /* name */
};

/* Struct for type XM_STOP_ON_ERROR_FILTER */
struct S103 {
	int id;
	T1 a1; /* has_error */
	T0* a2; /* last_error */
	T0* a3; /* next */
};

/* Struct for type XM_POSITION_TABLE */
struct S104 {
	int id;
	T0* a1; /* table */
};

/* Struct for type KL_EXECUTION_ENVIRONMENT */
struct S107 {
	int id;
};

/* Struct for type DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES] */
struct S108 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type DS_ARRAYED_STACK [GEANT_VARIABLES] */
struct S109 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [AP_OPTION] */
struct S110 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [AP_OPTION] */
struct S112 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [AP_OPTION] */
struct S113 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S114 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S115 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S116 {
	int id;
};

/* Struct for type UC_STRING */
struct S117 {
	int id;
	T6 a1; /* count */
	T6 a2; /* byte_count */
	T6 a3; /* internal_hash_code */
	T0* a4; /* area */
	T6 a5; /* last_byte_index_input */
	T6 a6; /* last_byte_index_result */
};

/* Struct for type C_STRING */
struct S119 {
	int id;
	T0* a1; /* managed_data */
	T6 a2; /* count */
};

/* Struct for type PLATFORM */
struct S120 {
	int id;
};

/* Struct for type detachable CELL [INTEGER_32] */
struct S121 {
	int id;
	T6 a1; /* item */
};

/* Struct for type SPECIAL [NATURAL_8] */
struct S122 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T8 z2[1]; /* item */
};

/* Struct for type STRING_TO_INTEGER_CONVERTOR */
struct S125 {
	int id;
	T6 a1; /* sign */
	T11 a2; /* part1 */
	T11 a3; /* part2 */
	T6 a4; /* last_state */
	T1 a5; /* internal_overflowed */
	T0* a6; /* leading_separators */
	T0* a7; /* trailing_separators */
	T6 a8; /* conversion_type */
	T1 a9; /* leading_separators_acceptable */
	T1 a10; /* trailing_separators_acceptable */
};

/* Struct for type DS_LINKED_LIST [XM_ELEMENT] */
struct S127 {
	int id;
	T6 a1; /* count */
	T0* a2; /* last_cell */
	T0* a3; /* first_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_LINKED_LIST_CURSOR [XM_ELEMENT] */
struct S128 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type GEANT_INHERIT_ELEMENT */
struct S129 {
	int id;
	T0* a1; /* geant_inherit */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_INHERIT */
struct S130 {
	int id;
	T0* a1; /* parents */
	T0* a2; /* project */
};

/* Struct for type SPECIAL [GEANT_TARGET] */
struct S131 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_TARGET] */
struct S134 {
	int id;
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8] */
struct S135 {
	int id;
	T6 a1; /* position */
	T0* a2; /* container */
	T0* a3; /* next_cursor */
};

/* Struct for type EXCEPTIONS */
struct S136 {
	int id;
};

/* Struct for type SPECIAL [IMMUTABLE_STRING_32] */
struct S137 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [IMMUTABLE_STRING_32] */
struct S138 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
	T1 a4; /* object_comparison */
};

/* Struct for type NATIVE_STRING */
struct S139 {
	int id;
	T0* a1; /* managed_data */
	T6 a2; /* unit_count */
};

/* Struct for type XM_EIFFEL_SCANNER */
struct S142 {
	int id;
	T6 a1; /* last_token */
	T0* a2; /* last_value */
	T0* a3; /* input_name */
	T6 a4; /* position */
	T6 a5; /* column */
	T6 a6; /* line */
	T0* a7; /* input_filter */
	T6 a8; /* yy_start_state */
	T0* a9; /* character_entity */
	T0* a10; /* input_stream */
	T0* a11; /* input_resolver */
	T1 a12; /* yy_more_flag */
	T6 a13; /* yy_more_len */
	T6 a14; /* yy_end */
	T6 a15; /* yy_start */
	T6 a16; /* yy_line */
	T6 a17; /* yy_column */
	T6 a18; /* yy_position */
	T0* a19; /* input_buffer */
	T0* a20; /* yy_state_stack */
	T6 a21; /* yy_state_count */
	T0* a22; /* yy_content_area */
	T0* a23; /* yy_ec */
	T0* a24; /* yy_content */
	T0* a25; /* yy_accept */
	T6 a26; /* yy_last_accepting_state */
	T6 a27; /* yy_last_accepting_cpos */
	T0* a28; /* yy_chk */
	T0* a29; /* yy_base */
	T0* a30; /* yy_def */
	T0* a31; /* yy_meta */
	T0* a32; /* yy_nxt */
	T6 a33; /* yy_lp */
	T0* a34; /* yy_acclist */
	T6 a35; /* yy_looking_for_trail_begin */
	T6 a36; /* yy_full_match */
	T6 a37; /* yy_full_state */
	T6 a38; /* yy_full_lp */
	T1 a39; /* yy_rejected */
	T0* a40; /* last_string_value */
	T0* a41; /* last_error */
	T0* a42; /* start_conditions */
};

/* Struct for type XM_DEFAULT_POSITION */
struct S143 {
	int id;
	T0* a1; /* source_name */
	T6 a2; /* row */
	T6 a3; /* column */
	T6 a4; /* byte_index */
};

/* Struct for type DS_BILINKED_LIST [XM_POSITION] */
struct S145 {
	int id;
	T0* a1; /* first_cell */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
struct S146 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
};

/* Struct for type XM_CALLBACKS_NULL */
struct S147 {
	int id;
};

/* Struct for type DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S148 {
	int id;
	T6 a1; /* position */
	T0* a2; /* item_storage */
	T6 a3; /* count */
	T6 a4; /* last_position */
	T6 a5; /* free_slot */
	T6 a6; /* capacity */
	T0* a7; /* key_equality_tester */
	T0* a8; /* internal_keys */
	T6 a9; /* modulus */
	T6 a10; /* slots_position */
	T6 a11; /* clashes_previous_position */
	T0* a12; /* internal_cursor */
	T6 a13; /* found_position */
	T0* a14; /* key_storage */
	T0* a15; /* clashes */
	T0* a16; /* slots */
	T0* a17; /* special_item_routines */
	T0* a18; /* special_key_routines */
	T0* a19; /* equality_tester */
	T0* a20; /* hash_function */
};

/* Struct for type XM_NULL_EXTERNAL_RESOLVER */
struct S150 {
	int id;
};

/* Struct for type XM_DTD_CALLBACKS_NULL */
struct S152 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [detachable ANY] */
struct S153 {
	int id;
};

/* Struct for type SPECIAL [detachable ANY] */
struct S154 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
struct S155 {
	int id;
};

/* Struct for type XM_EIFFEL_PARSER_NAME */
struct S156 {
	int id;
	T1 a1; /* use_namespaces */
	T6 a2; /* count */
	T0* a3; /* first */
	T0* a4; /* second */
	T0* a5; /* tail */
};

/* Struct for type SPECIAL [XM_EIFFEL_PARSER_NAME] */
struct S157 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S158 {
	int id;
};

/* Struct for type DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
struct S159 {
	int id;
	T6 a1; /* position */
	T0* a2; /* equality_tester */
	T6 a3; /* count */
	T6 a4; /* capacity */
	T6 a5; /* free_slot */
	T6 a6; /* last_position */
	T6 a7; /* modulus */
	T6 a8; /* slots_position */
	T6 a9; /* clashes_previous_position */
	T6 a10; /* found_position */
	T0* a11; /* clashes */
	T0* a12; /* slots */
	T0* a13; /* special_item_routines */
	T0* a14; /* item_storage */
	T0* a15; /* internal_cursor */
	T0* a16; /* hash_function */
};

/* Struct for type SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S160 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
struct S161 {
	int id;
};

/* Struct for type XM_DTD_EXTERNAL_ID */
struct S162 {
	int id;
	T0* a1; /* system_id */
	T0* a2; /* public_id */
};

/* Struct for type SPECIAL [XM_DTD_EXTERNAL_ID] */
struct S163 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
struct S164 {
	int id;
};

/* Struct for type XM_DTD_ELEMENT_CONTENT */
struct S165 {
	int id;
	T0* a1; /* items */
	T2 a2; /* repetition */
	T0* a3; /* name */
	T2 a4; /* type */
	T1 a5; /* is_character_data_allowed */
};

/* Struct for type SPECIAL [XM_DTD_ELEMENT_CONTENT] */
struct S166 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S167 {
	int id;
};

/* Struct for type DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
struct S168 {
	int id;
	T0* a1; /* last_cell */
	T6 a2; /* count */
	T0* a3; /* first_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S169 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
struct S170 {
	int id;
};

/* Struct for type XM_DTD_ATTRIBUTE_CONTENT */
struct S171 {
	int id;
	T0* a1; /* name */
	T2 a2; /* type */
	T1 a3; /* is_list_type */
	T0* a4; /* enumeration_list */
	T2 a5; /* value */
	T0* a6; /* default_value */
};

/* Struct for type SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
struct S172 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
struct S173 {
	int id;
};

/* Struct for type DS_BILINKED_LIST [STRING_8] */
struct S174 {
	int id;
	T0* a1; /* last_cell */
	T6 a2; /* count */
	T0* a3; /* first_cell */
	T0* a4; /* equality_tester */
	T0* a5; /* internal_cursor */
};

/* Struct for type SPECIAL [DS_BILINKED_LIST [STRING_8]] */
struct S175 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [BOOLEAN] */
struct S176 {
	int id;
};

/* Struct for type SPECIAL [BOOLEAN] */
struct S177 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T1 z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
struct S178 {
	int id;
};

/* Struct for type XM_EIFFEL_DECLARATION */
struct S179 {
	int id;
	T0* a1; /* version */
	T0* a2; /* encoding */
	T1 a3; /* stand_alone */
};

/* Struct for type SPECIAL [XM_EIFFEL_DECLARATION] */
struct S180 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type XM_EIFFEL_ENTITY_DEF */
struct S183 {
	int id;
	T0* a1; /* literal_name */
	T0* a2; /* value */
	T0* a3; /* resolver */
	T0* a4; /* external_id */
	T0* a5; /* character_entity */
	T0* a6; /* input_buffer */
	T1 a7; /* in_use */
	T0* a8; /* input_name */
	T0* a9; /* last_value */
	T0* a10; /* last_string_value */
	T0* a11; /* last_error */
	T0* a12; /* start_conditions */
	T6 a13; /* yy_start_state */
	T6 a14; /* yy_line */
	T6 a15; /* yy_column */
	T6 a16; /* yy_position */
	T6 a17; /* line */
	T6 a18; /* column */
	T6 a19; /* position */
	T1 a20; /* yy_more_flag */
	T6 a21; /* yy_more_len */
	T6 a22; /* yy_last_accepting_state */
	T6 a23; /* yy_last_accepting_cpos */
	T1 a24; /* yy_rejected */
	T6 a25; /* yy_state_count */
	T6 a26; /* yy_full_match */
	T6 a27; /* yy_lp */
	T6 a28; /* yy_looking_for_trail_begin */
	T6 a29; /* yy_full_lp */
	T6 a30; /* yy_full_state */
	T0* a31; /* yy_state_stack */
	T6 a32; /* yy_end */
	T6 a33; /* yy_start */
	T0* a34; /* yy_nxt */
	T0* a35; /* yy_chk */
	T0* a36; /* yy_base */
	T0* a37; /* yy_def */
	T0* a38; /* yy_ec */
	T0* a39; /* yy_meta */
	T0* a40; /* yy_accept */
	T0* a41; /* yy_content */
	T0* a42; /* yy_content_area */
	T6 a43; /* last_token */
	T0* a44; /* input_filter */
	T0* a45; /* input_stream */
	T0* a46; /* input_resolver */
	T0* a47; /* yy_acclist */
};

/* Struct for type XM_EIFFEL_SCANNER_DTD */
struct S184 {
	int id;
	T6 a1; /* last_token */
	T0* a2; /* last_value */
	T0* a3; /* input_name */
	T6 a4; /* position */
	T6 a5; /* column */
	T6 a6; /* line */
	T0* a7; /* input_filter */
	T6 a8; /* yy_start_state */
	T0* a9; /* character_entity */
	T0* a10; /* input_stream */
	T0* a11; /* input_resolver */
	T1 a12; /* decl_start_sent */
	T1 a13; /* decl_end_sent */
	T1 a14; /* yy_more_flag */
	T6 a15; /* yy_more_len */
	T6 a16; /* yy_end */
	T6 a17; /* yy_start */
	T6 a18; /* yy_line */
	T6 a19; /* yy_column */
	T6 a20; /* yy_position */
	T0* a21; /* input_buffer */
	T0* a22; /* yy_state_stack */
	T6 a23; /* yy_state_count */
	T0* a24; /* yy_content_area */
	T0* a25; /* yy_ec */
	T0* a26; /* yy_content */
	T0* a27; /* yy_accept */
	T6 a28; /* yy_last_accepting_state */
	T6 a29; /* yy_last_accepting_cpos */
	T0* a30; /* yy_chk */
	T0* a31; /* yy_base */
	T0* a32; /* yy_def */
	T0* a33; /* yy_meta */
	T0* a34; /* yy_nxt */
	T6 a35; /* yy_lp */
	T0* a36; /* yy_acclist */
	T6 a37; /* yy_looking_for_trail_begin */
	T6 a38; /* yy_full_match */
	T6 a39; /* yy_full_state */
	T6 a40; /* yy_full_lp */
	T1 a41; /* yy_rejected */
	T0* a42; /* last_string_value */
	T0* a43; /* last_error */
	T0* a44; /* start_conditions */
};

/* Struct for type XM_EIFFEL_PE_ENTITY_DEF */
struct S186 {
	int id;
	T0* a1; /* resolver */
	T0* a2; /* external_id */
	T0* a3; /* literal_name */
	T0* a4; /* value */
	T0* a5; /* character_entity */
	T0* a6; /* input_buffer */
	T1 a7; /* in_use */
	T0* a8; /* input_name */
	T0* a9; /* last_value */
	T0* a10; /* last_string_value */
	T0* a11; /* last_error */
	T0* a12; /* start_conditions */
	T6 a13; /* yy_start_state */
	T6 a14; /* yy_line */
	T6 a15; /* yy_column */
	T6 a16; /* yy_position */
	T6 a17; /* line */
	T6 a18; /* column */
	T6 a19; /* position */
	T1 a20; /* yy_more_flag */
	T6 a21; /* yy_more_len */
	T6 a22; /* yy_last_accepting_state */
	T6 a23; /* yy_last_accepting_cpos */
	T1 a24; /* yy_rejected */
	T6 a25; /* yy_state_count */
	T6 a26; /* yy_full_match */
	T6 a27; /* yy_lp */
	T6 a28; /* yy_looking_for_trail_begin */
	T6 a29; /* yy_full_lp */
	T6 a30; /* yy_full_state */
	T0* a31; /* yy_state_stack */
	T6 a32; /* yy_end */
	T6 a33; /* yy_start */
	T1 a34; /* pre_sent */
	T1 a35; /* post_sent */
	T0* a36; /* yy_nxt */
	T0* a37; /* yy_chk */
	T0* a38; /* yy_base */
	T0* a39; /* yy_def */
	T0* a40; /* yy_ec */
	T0* a41; /* yy_meta */
	T0* a42; /* yy_accept */
	T0* a43; /* yy_content */
	T0* a44; /* yy_content_area */
	T6 a45; /* last_token */
	T0* a46; /* input_filter */
	T0* a47; /* input_stream */
	T0* a48; /* input_resolver */
	T0* a49; /* yy_acclist */
};

/* Struct for type XM_NAMESPACE_RESOLVER */
struct S187 {
	int id;
	T0* a1; /* next */
	T0* a2; /* element_local_part */
	T0* a3; /* element_prefix */
	T0* a4; /* context */
	T1 a5; /* forward_xmlns */
	T0* a6; /* attributes_prefix */
	T0* a7; /* attributes_local_part */
	T0* a8; /* attributes_value */
};

/* Struct for type SPECIAL [XM_CALLBACKS_FILTER] */
struct S188 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [XM_CALLBACKS_FILTER] */
struct S189 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_HASH_SET [XM_NAMESPACE] */
struct S190 {
	int id;
	T0* a1; /* equality_tester */
	T6 a2; /* capacity */
	T6 a3; /* modulus */
	T6 a4; /* last_position */
	T6 a5; /* free_slot */
	T6 a6; /* position */
	T0* a7; /* special_item_routines */
	T0* a8; /* item_storage */
	T0* a9; /* clashes */
	T0* a10; /* slots */
	T6 a11; /* found_position */
	T0* a12; /* internal_cursor */
	T6 a13; /* slots_position */
	T6 a14; /* count */
	T6 a15; /* clashes_previous_position */
	T0* a16; /* hash_function */
};

/* Struct for type XM_NAMESPACE */
struct S191 {
	int id;
	T0* a1; /* uri */
	T0* a2; /* ns_prefix */
};

/* Struct for type XM_LINKED_LIST [XM_DOCUMENT_NODE] */
struct S192 {
	int id;
	T6 a1; /* count */
	T0* a2; /* last_cell */
	T0* a3; /* first_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE] */
struct S196 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type XM_LINKED_LIST [XM_ELEMENT_NODE] */
struct S199 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* first_cell */
};

/* Struct for type DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S201 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* first_cell */
};

/* Struct for type SPECIAL [GEANT_ARGUMENT_VARIABLES] */
struct S202 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES] */
struct S203 {
	int id;
};

/* Struct for type SPECIAL [GEANT_VARIABLES] */
struct S204 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_VARIABLES] */
struct S205 {
	int id;
};

/* Struct for type ARRAY [AP_OPTION] */
struct S206 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S207 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_ARRAYED_STACK [GEANT_TARGET] */
struct S209 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type GEANT_TASK_FACTORY */
struct S210 {
	int id;
	T0* a1; /* project */
	T0* a2; /* builders */
};

/* Struct for type GEANT_PARENT */
struct S211 {
	int id;
	T0* a1; /* renames */
	T0* a2; /* parent_project */
	T0* a3; /* redefines */
	T0* a4; /* selects */
	T0* a5; /* project */
	T0* a6; /* unchanged_targets */
	T0* a7; /* renamed_targets */
	T0* a8; /* redefined_targets */
};

/* Struct for type DS_ARRAYED_LIST [GEANT_PARENT] */
struct S213 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T6 a4; /* count */
	T0* a5; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [GEANT_PARENT] */
struct S214 {
	int id;
	T6 a1; /* position */
	T0* a2; /* container */
	T0* a3; /* next_cursor */
};

/* Struct for type GEANT_INTERPRETING_ELEMENT */
struct S215 {
	int id;
	T0* a1; /* project */
	T0* a2; /* xml_element */
	T0* a3; /* position */
};

/* Struct for type GEANT_ARGUMENT_ELEMENT */
struct S216 {
	int id;
	T0* a1; /* xml_element */
};

/* Struct for type GEANT_LOCAL_ELEMENT */
struct S217 {
	int id;
	T0* a1; /* xml_element */
};

/* Struct for type GEANT_GLOBAL_ELEMENT */
struct S218 {
	int id;
	T0* a1; /* xml_element */
};

/* Struct for type XM_ATTRIBUTE */
struct S219 {
	int id;
	T0* a1; /* name */
	T0* a2; /* namespace */
	T0* a3; /* value */
	T0* a4; /* parent */
};

/* Struct for type GEANT_GROUP */
struct S220 {
	int id;
	T0* a1; /* project */
	T0* a2; /* xml_element */
	T0* a3; /* position */
	T0* a4; /* parent */
	T0* a5; /* description */
};

/* Struct for type ARRAY [INTEGER_32] */
struct S225 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type UC_UTF8_ROUTINES */
struct S226 {
	int id;
};

/* Struct for type UC_UTF8_STRING */
struct S227 {
	int id;
	T6 a1; /* count */
	T0* a2; /* area */
	T6 a3; /* byte_count */
	T6 a4; /* internal_hash_code */
	T6 a5; /* last_byte_index_input */
	T6 a6; /* last_byte_index_result */
};

/* Struct for type XM_EIFFEL_INPUT_STREAM */
struct S228 {
	int id;
	T0* a1; /* last_string */
	T6 a2; /* encoding */
	T0* a3; /* impl */
	T0* a4; /* utf_queue */
};

/* Struct for type KL_INTEGER_ROUTINES */
struct S229 {
	int id;
};

/* Struct for type KL_PLATFORM */
struct S230 {
	int id;
};

/* Struct for type DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE] */
struct S231 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S232 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_PAIR [XM_POSITION, XM_NODE] */
struct S233 {
	int id;
	T0* a1; /* first */
	T0* a2; /* second */
};

/* Struct for type HEXADECIMAL_STRING_TO_INTEGER_CONVERTER */
struct S234 {
	int id;
	T6 a1; /* last_state */
	T1 a2; /* internal_overflowed */
	T11 a3; /* part1 */
	T11 a4; /* part2 */
	T0* a5; /* leading_separators */
	T0* a6; /* trailing_separators */
	T6 a7; /* sign */
	T6 a8; /* conversion_type */
	T2 a9; /* internal_lookahead */
	T1 a10; /* leading_separators_acceptable */
	T1 a11; /* trailing_separators_acceptable */
};

/* Struct for type INTEGER_OVERFLOW_CHECKER */
struct S235 {
	int id;
	T0* a1; /* integer_overflow_state1 */
	T0* a2; /* integer_overflow_state2 */
	T0* a3; /* natural_overflow_state1 */
	T0* a4; /* natural_overflow_state2 */
};

/* Struct for type detachable DS_LINKABLE [XM_ELEMENT] */
struct S236 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type GEANT_PARENT_ELEMENT */
struct S237 {
	int id;
	T0* a1; /* parent */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type ARRAY [GEANT_TARGET] */
struct S239 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type XM_EIFFEL_CHARACTER_ENTITY */
struct S240 {
	int id;
	T6 a1; /* code */
};

/* Struct for type YY_BUFFER */
struct S241 {
	int id;
	T1 a1; /* beginning_of_line */
	T6 a2; /* count */
	T1 a3; /* filled */
	T0* a4; /* content */
	T6 a5; /* index */
	T6 a6; /* line */
	T6 a7; /* column */
	T6 a8; /* position */
	T6 a9; /* capacity */
};

/* Struct for type YY_FILE_BUFFER */
struct S242 {
	int id;
	T1 a1; /* beginning_of_line */
	T6 a2; /* count */
	T1 a3; /* filled */
	T0* a4; /* content */
	T6 a5; /* index */
	T6 a6; /* line */
	T6 a7; /* column */
	T6 a8; /* position */
	T0* a9; /* file */
	T1 a10; /* end_of_file */
	T6 a11; /* capacity */
	T1 a12; /* interactive */
};

/* Struct for type DS_LINKED_STACK [INTEGER_32] */
struct S245 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
};

/* Struct for type detachable DS_BILINKABLE [XM_POSITION] */
struct S246 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_POSITION] */
struct S247 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type detachable DS_LINKABLE [XM_EIFFEL_SCANNER] */
struct S248 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type SPECIAL [XM_EIFFEL_ENTITY_DEF] */
struct S249 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type detachable DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S252 {
	int id;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T6 a3; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
struct S253 {
	int id;
};

/* Struct for type ARRAY [detachable ANY] */
struct S254 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [XM_EIFFEL_PARSER_NAME] */
struct S255 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S256 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type detachable KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
struct S257 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
struct S258 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type ARRAY [XM_DTD_EXTERNAL_ID] */
struct S259 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [XM_DTD_ELEMENT_CONTENT] */
struct S260 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
struct S261 {
	int id;
	T0* a1; /* first_cell */
	T6 a2; /* count */
	T0* a3; /* last_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type ARRAY [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S262 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
struct S263 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type detachable DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
struct S264 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type ARRAY [XM_DTD_ATTRIBUTE_CONTENT] */
struct S265 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_LINKED_LIST [STRING_8] */
struct S266 {
	int id;
	T0* a1; /* internal_cursor */
	T6 a2; /* count */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
	T0* a5; /* equality_tester */
};

/* Struct for type ARRAY [DS_BILINKED_LIST [STRING_8]] */
struct S267 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [STRING_8] */
struct S268 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type detachable DS_BILINKABLE [STRING_8] */
struct S269 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type ARRAY [BOOLEAN] */
struct S270 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [XM_EIFFEL_DECLARATION] */
struct S271 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type XM_NAMESPACE_RESOLVER_CONTEXT */
struct S272 {
	int id;
	T0* a1; /* context */
};

/* Struct for type DS_LINKED_QUEUE [STRING_8] */
struct S274 {
	int id;
	T0* a1; /* first_cell */
	T6 a2; /* count */
	T0* a3; /* last_cell */
};

/* Struct for type detachable KL_EQUALITY_TESTER [XM_NAMESPACE] */
struct S275 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [XM_NAMESPACE] */
struct S276 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
struct S277 {
	int id;
};

/* Struct for type SPECIAL [XM_NAMESPACE] */
struct S278 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type detachable DS_LINKABLE [XM_DOCUMENT_NODE] */
struct S279 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type ARRAY [GEANT_ARGUMENT_VARIABLES] */
struct S283 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [GEANT_VARIABLES] */
struct S284 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type GEANT_STRING_INTERPRETER */
struct S285 {
	int id;
	T0* a1; /* variable_resolver */
};

/* Struct for type XM_COMMENT */
struct S289 {
	int id;
	T0* a1; /* data */
	T0* a2; /* parent */
};

/* Struct for type XM_PROCESSING_INSTRUCTION */
struct S290 {
	int id;
	T0* a1; /* target */
	T0* a2; /* data */
	T0* a3; /* parent */
};

/* Struct for type XM_CHARACTER_DATA */
struct S291 {
	int id;
	T0* a1; /* content */
	T0* a2; /* parent */
};

/* Struct for type KL_ARRAY_ROUTINES [INTEGER_32] */
struct S292 {
	int id;
};

/* Struct for type detachable DS_LINKABLE [XM_ELEMENT_NODE] */
struct S294 {
	int id;
	T0* a1; /* right */
	T0* a2; /* item */
};

/* Struct for type detachable DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S295 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
struct S296 {
	int id;
	T0* a1; /* key_equality_tester */
	T0* a2; /* internal_keys */
	T6 a3; /* count */
	T6 a4; /* capacity */
	T6 a5; /* free_slot */
	T6 a6; /* last_position */
	T0* a7; /* equality_tester */
	T6 a8; /* found_position */
	T6 a9; /* modulus */
	T6 a10; /* position */
	T0* a11; /* clashes */
	T0* a12; /* slots */
	T0* a13; /* special_item_routines */
	T0* a14; /* item_storage */
	T0* a15; /* special_key_routines */
	T0* a16; /* key_storage */
	T0* a17; /* internal_cursor */
	T0* a18; /* hash_function */
	T6 a19; /* slots_position */
	T6 a20; /* clashes_previous_position */
};

/* Struct for type GEANT_GEC_TASK */
struct S297 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] TUPLE [XM_ELEMENT] */
struct S298 {
	int id;
	T0* z1;
};

/* Struct for type detachable TUPLE */
struct S299 {
	int id;
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEC_TASK] */
struct S300 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type [attached] TUPLE [GEANT_TASK_FACTORY] */
struct S301 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_ISE_TASK */
struct S304 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_ISE_TASK] */
struct S305 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_EXEC_TASK */
struct S306 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_EXEC_TASK] */
struct S307 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_LCC_TASK */
struct S308 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_LCC_TASK] */
struct S309 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_SET_TASK */
struct S310 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_SET_TASK] */
struct S311 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_UNSET_TASK */
struct S312 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_UNSET_TASK] */
struct S313 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_GEXACE_TASK */
struct S314 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* position */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEXACE_TASK] */
struct S315 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_GELEX_TASK */
struct S316 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GELEX_TASK] */
struct S317 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_GEYACC_TASK */
struct S318 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEYACC_TASK] */
struct S319 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_GEPP_TASK */
struct S320 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEPP_TASK] */
struct S321 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_GETEST_TASK */
struct S322 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* position */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GETEST_TASK] */
struct S323 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_GEANT_TASK */
struct S324 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEANT_TASK] */
struct S325 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_ECHO_TASK */
struct S326 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_ECHO_TASK] */
struct S327 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_MKDIR_TASK */
struct S328 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_MKDIR_TASK] */
struct S329 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_DELETE_TASK */
struct S330 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_DELETE_TASK] */
struct S331 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_COPY_TASK */
struct S332 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_COPY_TASK] */
struct S333 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_MOVE_TASK */
struct S334 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_MOVE_TASK] */
struct S335 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_SETENV_TASK */
struct S336 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_SETENV_TASK] */
struct S337 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_XSLT_TASK */
struct S338 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* position */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_XSLT_TASK] */
struct S339 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_OUTOFDATE_TASK */
struct S340 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_OUTOFDATE_TASK] */
struct S341 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_EXIT_TASK */
struct S342 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_EXIT_TASK] */
struct S343 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_PRECURSOR_TASK */
struct S344 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* position */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_PRECURSOR_TASK] */
struct S345 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_AVAILABLE_TASK */
struct S346 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_AVAILABLE_TASK] */
struct S347 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_INPUT_TASK */
struct S348 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_INPUT_TASK] */
struct S349 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_REPLACE_TASK */
struct S350 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_REPLACE_TASK] */
struct S351 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_PARENT] */
struct S352 {
	int id;
};

/* Struct for type SPECIAL [GEANT_PARENT] */
struct S353 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type UC_UNICODE_ROUTINES */
struct S355 {
	int id;
};

/* Struct for type DS_LINKED_QUEUE [CHARACTER_8] */
struct S357 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
};

/* Struct for type UC_UTF16_ROUTINES */
struct S358 {
	int id;
};

/* Struct for type SPECIAL [NATURAL_64] */
struct S359 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T11 z2[1]; /* item */
};

/* Struct for type GEANT_RENAME_ELEMENT */
struct S360 {
	int id;
	T0* a1; /* rename_clause */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_REDEFINE_ELEMENT */
struct S361 {
	int id;
	T0* a1; /* redefine_clause */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_SELECT_ELEMENT */
struct S362 {
	int id;
	T0* a1; /* select_clause */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_RENAME */
struct S363 {
	int id;
	T0* a1; /* original_name */
	T0* a2; /* new_name */
};

/* Struct for type DS_HASH_TABLE [GEANT_RENAME, STRING_8] */
struct S364 {
	int id;
	T6 a1; /* position */
	T0* a2; /* equality_tester */
	T6 a3; /* last_position */
	T6 a4; /* capacity */
	T6 a5; /* slots_position */
	T6 a6; /* count */
	T0* a7; /* key_equality_tester */
	T0* a8; /* internal_keys */
	T6 a9; /* modulus */
	T6 a10; /* clashes_previous_position */
	T6 a11; /* found_position */
	T0* a12; /* special_item_routines */
	T0* a13; /* item_storage */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* special_key_routines */
	T0* a17; /* key_storage */
	T6 a18; /* free_slot */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type GEANT_REDEFINE */
struct S365 {
	int id;
	T0* a1; /* name */
};

/* Struct for type DS_HASH_TABLE [GEANT_REDEFINE, STRING_8] */
struct S366 {
	int id;
	T0* a1; /* equality_tester */
	T6 a2; /* position */
	T6 a3; /* last_position */
	T6 a4; /* capacity */
	T6 a5; /* slots_position */
	T6 a6; /* count */
	T0* a7; /* key_equality_tester */
	T0* a8; /* internal_keys */
	T6 a9; /* found_position */
	T6 a10; /* modulus */
	T6 a11; /* clashes_previous_position */
	T0* a12; /* special_item_routines */
	T0* a13; /* item_storage */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* special_key_routines */
	T0* a17; /* key_storage */
	T6 a18; /* free_slot */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type GEANT_SELECT */
struct S367 {
	int id;
	T0* a1; /* name */
};

/* Struct for type DS_HASH_TABLE [GEANT_SELECT, STRING_8] */
struct S368 {
	int id;
	T0* a1; /* equality_tester */
	T6 a2; /* position */
	T6 a3; /* last_position */
	T6 a4; /* capacity */
	T6 a5; /* slots_position */
	T6 a6; /* count */
	T0* a7; /* key_equality_tester */
	T0* a8; /* internal_keys */
	T6 a9; /* found_position */
	T6 a10; /* modulus */
	T6 a11; /* clashes_previous_position */
	T0* a12; /* special_item_routines */
	T0* a13; /* item_storage */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* special_key_routines */
	T0* a17; /* key_storage */
	T6 a18; /* free_slot */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type detachable DS_LINKABLE [INTEGER_32] */
struct S369 {
	int id;
	T6 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type ARRAY [XM_EIFFEL_ENTITY_DEF] */
struct S370 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
struct S371 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type attached DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
struct S372 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_LINKED_LIST_CURSOR [STRING_8] */
struct S373 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S375 {
	int id;
	T6 a1; /* count */
	T0* a2; /* last_cell */
	T0* a3; /* first_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S376 {
	int id;
	T1 a1; /* before */
	T0* a2; /* current_cell */
	T0* a3; /* next_cursor */
	T0* a4; /* container */
	T1 a5; /* after */
};

/* Struct for type detachable DS_LINKABLE [STRING_8] */
struct S377 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type ARRAY [XM_NAMESPACE] */
struct S378 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type GEANT_NAME_VALUE_ELEMENT */
struct S379 {
	int id;
	T0* a1; /* xml_element */
};

/* Struct for type KL_ARRAY_ROUTINES [detachable STRING_8] */
struct S380 {
	int id;
};

/* Struct for type AP_OPTION_COMPARATOR */
struct S381 {
	int id;
};

/* Struct for type DS_QUICK_SORTER [AP_OPTION] */
struct S382 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type ST_WORD_WRAPPER */
struct S384 {
	int id;
	T6 a1; /* new_line_indentation */
	T6 a2; /* broken_words */
	T6 a3; /* maximum_text_width */
};

/* Struct for type KL_CHARACTER_BUFFER */
struct S387 {
	int id;
	T0* a1; /* as_special */
	T0* a2; /* area */
};

/* Struct for type KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
struct S390 {
	int id;
};

/* Struct for type SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
struct S391 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
struct S392 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type GEANT_GEC_COMMAND */
struct S393 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T1 a3; /* c_compile */
	T1 a4; /* split_mode */
	T0* a5; /* ace_filename */
	T0* a6; /* clean */
	T1 a7; /* finalize */
	T1 a8; /* gelint */
	T0* a9; /* catcall_mode */
	T6 a10; /* split_size */
	T0* a11; /* garbage_collector */
	T0* a12; /* exit_code_variable_name */
	T6 a13; /* exit_code */
};

/* Struct for type DS_CELL [PROCEDURE [ANY, TUPLE]] */
struct S394 {
	int id;
	T0* a1; /* item */
};

/* Struct for type [attached] PROCEDURE [GEANT_GEC_TASK, [attached] TUPLE] */
struct S395 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_GEC_TASK] */
struct S396 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_ISE_COMMAND */
struct S397 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* ace_filename */
	T0* a4; /* system_name */
	T0* a5; /* clean */
	T1 a6; /* compatible_mode */
	T1 a7; /* finalize_mode */
	T1 a8; /* finish_freezing */
	T0* a9; /* exit_code_variable_name */
	T6 a10; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_ISE_TASK, [attached] TUPLE] */
struct S398 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_ISE_TASK] */
struct S399 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_FILESET_ELEMENT */
struct S400 {
	int id;
	T0* a1; /* fileset */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_EXEC_COMMAND */
struct S401 {
	int id;
	T0* a1; /* command_line */
	T0* a2; /* exit_code_variable_name */
	T0* a3; /* accept_errors */
	T0* a4; /* log_validation_messages_agent_cell */
	T0* a5; /* project */
	T0* a6; /* fileset */
	T6 a7; /* exit_code */
	T1 a8; /* single_execution_mode */
};

/* Struct for type GEANT_STRING_PROPERTY */
struct S402 {
	int id;
	T0* a1; /* string_value_agent */
	T1 a2; /* has_been_retrieved */
	T0* a3; /* retrieved_string_value */
};

/* Struct for type [attached] FUNCTION [GEANT_INTERPRETING_ELEMENT, [attached] TUPLE, STRING_8] */
struct S403 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_INTERPRETING_ELEMENT, STRING_8] */
struct S404 {
	int id;
	T0* z1;
	T0* z2;
};

/* Struct for type GEANT_BOOLEAN_PROPERTY */
struct S405 {
	int id;
	T0* a1; /* string_value_agent */
	T1 a2; /* has_been_retrieved */
	T0* a3; /* retrieved_string_value */
};

/* Struct for type GEANT_FILESET */
struct S406 {
	int id;
	T0* a1; /* project */
	T0* a2; /* filenames */
	T0* a3; /* single_includes */
	T0* a4; /* single_excludes */
	T1 a5; /* force */
	T0* a6; /* dir_name */
	T0* a7; /* directory_name */
	T0* a8; /* include_wc_string */
	T0* a9; /* include_wildcard */
	T0* a10; /* exclude_wc_string */
	T0* a11; /* exclude_wildcard */
	T1 a12; /* concat */
	T0* a13; /* filename_variable_name */
	T0* a14; /* mapped_filename_variable_name */
	T0* a15; /* filename_directory_name */
	T0* a16; /* mapped_filename_directory_name */
	T1 a17; /* convert_to_filesystem */
	T0* a18; /* map */
};

/* Struct for type [attached] PROCEDURE [GEANT_EXEC_TASK, [attached] TUPLE] */
struct S407 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_EXEC_TASK] */
struct S408 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_LCC_COMMAND */
struct S409 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* executable */
	T0* a4; /* source_filename */
	T6 a5; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_LCC_TASK, [attached] TUPLE] */
struct S410 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_LCC_TASK] */
struct S411 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_SET_COMMAND */
struct S412 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* name */
	T0* a4; /* value */
	T6 a5; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_SET_TASK, [attached] TUPLE] */
struct S413 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_SET_TASK] */
struct S414 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_UNSET_COMMAND */
struct S415 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* name */
	T6 a4; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_UNSET_TASK, [attached] TUPLE] */
struct S416 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_UNSET_TASK] */
struct S417 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_DEFINE_ELEMENT */
struct S418 {
	int id;
	T0* a1; /* project */
	T0* a2; /* xml_element */
	T0* a3; /* position */
};

/* Struct for type GEANT_GEXACE_COMMAND */
struct S419 {
	int id;
	T0* a1; /* defines */
	T0* a2; /* log_validation_messages_agent_cell */
	T0* a3; /* project */
	T1 a4; /* verbose */
	T1 a5; /* validate_command */
	T0* a6; /* system_command */
	T0* a7; /* library_command */
	T0* a8; /* format */
	T0* a9; /* xace_filename */
	T0* a10; /* output_filename */
	T6 a11; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_GEXACE_TASK, [attached] TUPLE] */
struct S420 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_GEXACE_TASK] */
struct S421 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_GELEX_COMMAND */
struct S422 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* output_filename */
	T0* a4; /* input_filename */
	T0* a5; /* size */
	T1 a6; /* ecs */
	T1 a7; /* meta_ecs */
	T1 a8; /* backup */
	T1 a9; /* full */
	T1 a10; /* case_insensitive */
	T1 a11; /* no_default */
	T1 a12; /* no_warn */
	T1 a13; /* separate_actions */
	T6 a14; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_GELEX_TASK, [attached] TUPLE] */
struct S423 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_GELEX_TASK] */
struct S424 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_GEYACC_COMMAND */
struct S425 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* output_filename */
	T0* a4; /* input_filename */
	T1 a5; /* rescue_on_abort */
	T1 a6; /* separate_actions */
	T0* a7; /* verbose_filename */
	T0* a8; /* tokens_classname */
	T0* a9; /* tokens_filename */
	T6 a10; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_GEYACC_TASK, [attached] TUPLE] */
struct S426 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_GEYACC_TASK] */
struct S427 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_GEPP_COMMAND */
struct S428 {
	int id;
	T0* a1; /* defines */
	T0* a2; /* log_validation_messages_agent_cell */
	T0* a3; /* project */
	T0* a4; /* input_filename */
	T0* a5; /* output_filename */
	T1 a6; /* empty_lines */
	T0* a7; /* to_directory */
	T1 a8; /* force */
	T0* a9; /* fileset */
	T6 a10; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_GEPP_TASK, [attached] TUPLE] */
struct S429 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_GEPP_TASK] */
struct S430 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_GETEST_COMMAND */
struct S431 {
	int id;
	T0* a1; /* defines */
	T0* a2; /* log_validation_messages_agent_cell */
	T0* a3; /* project */
	T1 a4; /* generation */
	T1 a5; /* compilation */
	T1 a6; /* execution */
	T1 a7; /* verbose */
	T0* a8; /* config_filename */
	T0* a9; /* compile */
	T0* a10; /* class_regexp */
	T0* a11; /* feature_regexp */
	T1 a12; /* default_test_included */
	T1 a13; /* abort */
	T6 a14; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_GETEST_TASK, [attached] TUPLE] */
struct S432 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_GETEST_TASK] */
struct S433 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_GEANT_COMMAND */
struct S434 {
	int id;
	T0* a1; /* arguments */
	T0* a2; /* log_validation_messages_agent_cell */
	T0* a3; /* project */
	T0* a4; /* start_target_name */
	T1 a5; /* reuse_variables */
	T0* a6; /* filename */
	T1 a7; /* fork */
	T1 a8; /* has_fork_been_set */
	T0* a9; /* fileset */
	T0* a10; /* exit_code_variable_name */
	T6 a11; /* exit_code */
};

/* Struct for type ST_SPLITTER */
struct S435 {
	int id;
	T1 a1; /* has_escape_character */
	T2 a2; /* escape_character */
	T0* a3; /* separator_codes */
	T0* a4; /* separators */
};

/* Struct for type [attached] PROCEDURE [GEANT_GEANT_TASK, [attached] TUPLE] */
struct S436 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_GEANT_TASK] */
struct S437 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_ECHO_COMMAND */
struct S438 {
	int id;
	T0* a1; /* message_property */
	T0* a2; /* to_file_property */
	T0* a3; /* append_property */
	T0* a4; /* log_validation_messages_agent_cell */
	T0* a5; /* project */
	T0* a6; /* message_only_agent_cell */
	T0* a7; /* message_with_file_agent_cell */
	T6 a8; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_ECHO_TASK, [attached] TUPLE] */
struct S439 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_ECHO_TASK] */
struct S440 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_MKDIR_COMMAND */
struct S441 {
	int id;
	T0* a1; /* directory */
	T0* a2; /* log_validation_messages_agent_cell */
	T0* a3; /* project */
	T0* a4; /* mkdir_agent_cell */
	T6 a5; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_MKDIR_TASK, [attached] TUPLE] */
struct S442 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_MKDIR_TASK] */
struct S443 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_DIRECTORYSET_ELEMENT */
struct S444 {
	int id;
	T0* a1; /* directoryset */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_DELETE_COMMAND */
struct S445 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* directory */
	T0* a4; /* file */
	T0* a5; /* fileset */
	T0* a6; /* directoryset */
	T6 a7; /* exit_code */
};

/* Struct for type GEANT_DIRECTORYSET */
struct S446 {
	int id;
	T0* a1; /* project */
	T0* a2; /* directory_names */
	T0* a3; /* single_includes */
	T0* a4; /* single_excludes */
	T0* a5; /* directory_name */
	T0* a6; /* include_wc_string */
	T0* a7; /* include_wildcard */
	T0* a8; /* exclude_wc_string */
	T0* a9; /* exclude_wildcard */
	T1 a10; /* concat */
	T0* a11; /* directory_name_variable_name */
	T1 a12; /* convert_to_filesystem */
};

/* Struct for type [attached] PROCEDURE [GEANT_DELETE_TASK, [attached] TUPLE] */
struct S447 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_DELETE_TASK] */
struct S448 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_COPY_COMMAND */
struct S449 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* file */
	T0* a4; /* to_file */
	T0* a5; /* to_directory */
	T1 a6; /* force */
	T0* a7; /* fileset */
	T6 a8; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_COPY_TASK, [attached] TUPLE] */
struct S450 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_COPY_TASK] */
struct S451 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_MOVE_COMMAND */
struct S452 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* file */
	T0* a4; /* to_file */
	T0* a5; /* to_directory */
	T0* a6; /* fileset */
	T6 a7; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_MOVE_TASK, [attached] TUPLE] */
struct S453 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_MOVE_TASK] */
struct S454 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_SETENV_COMMAND */
struct S455 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* name */
	T0* a4; /* value */
	T6 a5; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_SETENV_TASK, [attached] TUPLE] */
struct S456 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_SETENV_TASK] */
struct S457 {
	int id;
	T0* z1;
};

/* Struct for type DS_PAIR [STRING_8, STRING_8] */
struct S458 {
	int id;
	T0* a1; /* first */
	T0* a2; /* second */
};

/* Struct for type GEANT_XSLT_COMMAND */
struct S459 {
	int id;
	T0* a1; /* parameters */
	T0* a2; /* log_validation_messages_agent_cell */
	T0* a3; /* project */
	T0* a4; /* input_filename */
	T0* a5; /* output_filename */
	T6 a6; /* processor */
	T0* a7; /* stylesheet_filename */
	T1 a8; /* force */
	T0* a9; /* indent */
	T0* a10; /* format */
	T0* a11; /* extdirs */
	T0* a12; /* classpath */
	T6 a13; /* exit_code */
};

/* Struct for type DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]] */
struct S460 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T6 a4; /* count */
	T0* a5; /* internal_cursor */
};

/* Struct for type [attached] PROCEDURE [GEANT_XSLT_TASK, [attached] TUPLE] */
struct S461 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_XSLT_TASK] */
struct S462 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_OUTOFDATE_COMMAND */
struct S463 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* source_filename */
	T0* a4; /* target_filename */
	T0* a5; /* true_value */
	T0* a6; /* false_value */
	T0* a7; /* variable_name */
	T0* a8; /* fileset */
	T6 a9; /* exit_code */
	T1 a10; /* is_out_of_date */
};

/* Struct for type [attached] PROCEDURE [GEANT_OUTOFDATE_TASK, [attached] TUPLE] */
struct S464 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_OUTOFDATE_TASK] */
struct S465 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_EXIT_COMMAND */
struct S466 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T6 a3; /* code */
	T6 a4; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_EXIT_TASK, [attached] TUPLE] */
struct S467 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_EXIT_TASK] */
struct S468 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_PRECURSOR_COMMAND */
struct S469 {
	int id;
	T0* a1; /* arguments */
	T0* a2; /* log_validation_messages_agent_cell */
	T0* a3; /* project */
	T0* a4; /* parent */
	T6 a5; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_PRECURSOR_TASK, [attached] TUPLE] */
struct S470 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_PRECURSOR_TASK] */
struct S471 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_AVAILABLE_COMMAND */
struct S472 {
	int id;
	T0* a1; /* resource_name */
	T0* a2; /* variable_name */
	T0* a3; /* true_value */
	T0* a4; /* false_value */
	T0* a5; /* log_validation_messages_agent_cell */
	T0* a6; /* project */
	T0* a7; /* available_agent_cell */
	T6 a8; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_AVAILABLE_TASK, [attached] TUPLE] */
struct S473 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_AVAILABLE_TASK] */
struct S474 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_INPUT_COMMAND */
struct S475 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* variable */
	T0* a4; /* message */
	T0* a5; /* default_value */
	T0* a6; /* validargs */
	T0* a7; /* validregexp */
	T1 a8; /* answer_required */
	T6 a9; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_INPUT_TASK, [attached] TUPLE] */
struct S476 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_INPUT_TASK] */
struct S477 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_REPLACE_COMMAND */
struct S478 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* file */
	T0* a4; /* to_file */
	T0* a5; /* to_directory */
	T0* a6; /* match */
	T0* a7; /* token */
	T0* a8; /* variable_pattern */
	T0* a9; /* replace */
	T0* a10; /* flags */
	T0* a11; /* fileset */
	T6 a12; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_REPLACE_TASK, [attached] TUPLE] */
struct S479 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_REPLACE_TASK] */
struct S480 {
	int id;
	T0* z1;
};

/* Struct for type ARRAY [GEANT_PARENT] */
struct S481 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type SPECIAL [ARRAY [INTEGER_32]] */
struct S482 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
struct S483 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type detachable DS_LINKABLE [CHARACTER_8] */
struct S484 {
	int id;
	T2 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type detachable KL_EQUALITY_TESTER [GEANT_RENAME] */
struct S485 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_RENAME] */
struct S487 {
	int id;
};

/* Struct for type SPECIAL [GEANT_RENAME] */
struct S488 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8] */
struct S489 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type detachable KL_EQUALITY_TESTER [GEANT_REDEFINE] */
struct S490 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_REDEFINE] */
struct S492 {
	int id;
};

/* Struct for type SPECIAL [GEANT_REDEFINE] */
struct S493 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8] */
struct S494 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type detachable KL_EQUALITY_TESTER [GEANT_SELECT] */
struct S495 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_SELECT] */
struct S497 {
	int id;
};

/* Struct for type SPECIAL [GEANT_SELECT] */
struct S498 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8] */
struct S499 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S500 {
	int id;
	T0* a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
};

/* Struct for type KL_DIRECTORY */
struct S501 {
	int id;
	T0* a1; /* name */
	T0* a2; /* internal_detachable_name_pointer */
	T0* a3; /* last_entry */
	T14 a4; /* directory_pointer */
	T6 a5; /* mode */
	T0* a6; /* internal_name */
	T1 a7; /* end_of_input */
	T0* a8; /* entry_buffer */
	T0* a9; /* lastentry */
	T14 a10; /* last_entry_pointer */
};

/* Struct for type KL_STRING_INPUT_STREAM */
struct S502 {
	int id;
	T1 a1; /* end_of_input */
	T2 a2; /* last_character */
	T0* a3; /* last_string */
	T0* a4; /* string */
	T6 a5; /* location */
};

/* Struct for type KL_ARRAY [detachable STRING_8] */
struct S504 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
struct S505 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type GEANT_MAP_ELEMENT */
struct S508 {
	int id;
	T0* a1; /* map */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_MAP */
struct S509 {
	int id;
	T0* a1; /* project */
	T0* a2; /* type */
	T0* a3; /* source_pattern */
	T0* a4; /* target_pattern */
	T0* a5; /* map */
};

/* Struct for type DS_HASH_SET [GEANT_FILESET_ENTRY] */
struct S512 {
	int id;
	T0* a1; /* equality_tester */
	T6 a2; /* capacity */
	T6 a3; /* modulus */
	T6 a4; /* last_position */
	T6 a5; /* free_slot */
	T6 a6; /* position */
	T0* a7; /* special_item_routines */
	T0* a8; /* item_storage */
	T0* a9; /* clashes */
	T0* a10; /* slots */
	T6 a11; /* found_position */
	T0* a12; /* internal_cursor */
	T6 a13; /* slots_position */
	T6 a14; /* count */
	T6 a15; /* clashes_previous_position */
	T0* a16; /* hash_function */
};

/* Struct for type DS_HASH_SET [STRING_8] */
struct S514 {
	int id;
	T6 a1; /* capacity */
	T6 a2; /* modulus */
	T6 a3; /* last_position */
	T6 a4; /* free_slot */
	T6 a5; /* position */
	T0* a6; /* equality_tester */
	T6 a7; /* slots_position */
	T6 a8; /* count */
	T0* a9; /* special_item_routines */
	T0* a10; /* item_storage */
	T0* a11; /* clashes */
	T0* a12; /* slots */
	T6 a13; /* found_position */
	T0* a14; /* internal_cursor */
	T6 a15; /* clashes_previous_position */
	T0* a16; /* hash_function */
};

/* Struct for type LX_DFA_WILDCARD */
struct S516 {
	int id;
	T0* a1; /* yy_nxt */
	T0* a2; /* yy_accept */
	T0* a3; /* pattern */
	T1 a4; /* is_case_insensitive */
	T6 a5; /* yyNb_rows */
	T6 a6; /* match_count */
	T6 a7; /* subject_start */
	T6 a8; /* subject_end */
	T0* a9; /* subject */
	T6 a10; /* matched_start */
	T6 a11; /* matched_end */
};

/* Struct for type DS_HASH_SET [INTEGER_32] */
struct S518 {
	int id;
	T6 a1; /* position */
	T6 a2; /* capacity */
	T6 a3; /* modulus */
	T6 a4; /* last_position */
	T6 a5; /* free_slot */
	T6 a6; /* slots_position */
	T6 a7; /* count */
	T6 a8; /* clashes_previous_position */
	T0* a9; /* special_item_routines */
	T0* a10; /* item_storage */
	T0* a11; /* clashes */
	T0* a12; /* slots */
	T6 a13; /* found_position */
	T0* a14; /* internal_cursor */
	T0* a15; /* equality_tester */
	T0* a16; /* hash_function */
};

/* Struct for type DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8]]] */
struct S519 {
	int id;
	T0* a1; /* item */
};

/* Struct for type [attached] TUPLE [STRING_8] */
struct S520 {
	int id;
	T0* z1;
};

/* Struct for type [attached] PROCEDURE [GEANT_ECHO_COMMAND, [attached] TUPLE [STRING_8]] */
struct S521 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*, T0*);
};

/* Struct for type [attached] TUPLE [GEANT_ECHO_COMMAND] */
struct S522 {
	int id;
	T0* z1;
};

/* Struct for type DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]]] */
struct S524 {
	int id;
	T0* a1; /* item */
};

/* Struct for type KL_TEXT_OUTPUT_FILE */
struct S525 {
	int id;
	T0* a1; /* name */
	T6 a2; /* mode */
	T14 a3; /* file_pointer */
	T1 a4; /* descriptor_available */
	T0* a5; /* last_string */
	T0* a6; /* internal_name */
	T0* a7; /* internal_detachable_name_pointer */
};

/* Struct for type [attached] TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN] */
struct S526 {
	int id;
	T0* z1;
	T0* z2;
	T1 z3;
};

/* Struct for type [attached] PROCEDURE [GEANT_ECHO_COMMAND, [attached] TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]] */
struct S527 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*, T0*, T0*, T1);
};

/* Struct for type [attached] PROCEDURE [GEANT_MKDIR_COMMAND, [attached] TUPLE [STRING_8]] */
struct S529 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*, T0*);
};

/* Struct for type [attached] TUPLE [GEANT_MKDIR_COMMAND] */
struct S530 {
	int id;
	T0* z1;
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]] */
struct S531 {
	int id;
};

/* Struct for type SPECIAL [DS_PAIR [STRING_8, STRING_8]] */
struct S532 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING_8, STRING_8]] */
struct S533 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_CELL [FUNCTION [ANY, TUPLE [STRING_8], BOOLEAN]] */
struct S534 {
	int id;
	T0* a1; /* item */
};

/* Struct for type [attached] PREDICATE [GEANT_AVAILABLE_COMMAND, [attached] TUPLE [STRING_8]] */
struct S535 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T1 (*f)(T0*, T0*);
};

/* Struct for type [attached] TUPLE [GEANT_AVAILABLE_COMMAND] */
struct S536 {
	int id;
	T0* z1;
};

/* Struct for type ARRAY [GEANT_RENAME] */
struct S538 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [GEANT_REDEFINE] */
struct S539 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [GEANT_SELECT] */
struct S540 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type detachable KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY] */
struct S544 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY] */
struct S545 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY] */
struct S546 {
	int id;
};

/* Struct for type GEANT_FILESET_ENTRY */
struct S547 {
	int id;
	T0* a1; /* filename */
	T0* a2; /* mapped_filename */
};

/* Struct for type SPECIAL [GEANT_FILESET_ENTRY] */
struct S548 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_SET_CURSOR [STRING_8] */
struct S549 {
	int id;
	T6 a1; /* position */
	T0* a2; /* container */
	T0* a3; /* next_cursor */
};

/* Struct for type LX_WILDCARD_PARSER */
struct S550 {
	int id;
	T1 a1; /* successful */
	T0* a2; /* pending_rules */
	T0* a3; /* start_condition_stack */
	T0* a4; /* action_factory */
	T0* a5; /* old_singleton_lines */
	T0* a6; /* old_singleton_columns */
	T0* a7; /* old_singleton_counts */
	T0* a8; /* old_regexp_lines */
	T0* a9; /* old_regexp_columns */
	T0* a10; /* old_regexp_counts */
	T0* a11; /* description */
	T0* a12; /* last_string_value */
	T0* a13; /* last_lx_symbol_class_value */
	T0* a14; /* error_handler */
	T0* a15; /* name_definitions */
	T0* a16; /* character_classes */
	T6 a17; /* line_nb */
	T0* a18; /* yyss */
	T0* a19; /* input_buffer */
	T6 a20; /* yy_end */
	T6 a21; /* yy_position */
	T6 a22; /* yy_line */
	T6 a23; /* yy_column */
	T6 a24; /* yy_parsing_status */
	T6 a25; /* yy_suspended_yystacksize */
	T6 a26; /* yy_suspended_yystate */
	T6 a27; /* yy_suspended_yyn */
	T6 a28; /* yy_suspended_yychar1 */
	T6 a29; /* yy_suspended_index */
	T6 a30; /* yy_suspended_yyss_top */
	T6 a31; /* yy_suspended_yy_goto */
	T0* a32; /* yyr1 */
	T6 a33; /* yyssp */
	T0* a34; /* yypgoto */
	T0* a35; /* yycheck */
	T0* a36; /* yytable */
	T0* a37; /* yydefgoto */
	T6 a38; /* error_count */
	T1 a39; /* yy_lookahead_needed */
	T6 a40; /* yyerrstatus */
	T0* a41; /* yypact */
	T6 a42; /* last_token */
	T0* a43; /* yytranslate */
	T0* a44; /* yydefact */
	T0* a45; /* yyspecial_routines1 */
	T6 a46; /* yyvsc1 */
	T0* a47; /* yyvs1 */
	T0* a48; /* yyspecial_routines2 */
	T6 a49; /* yyvsc2 */
	T0* a50; /* yyvs2 */
	T0* a51; /* yyspecial_routines3 */
	T6 a52; /* yyvsc3 */
	T0* a53; /* yyvs3 */
	T0* a54; /* yyspecial_routines4 */
	T6 a55; /* yyvsc4 */
	T0* a56; /* yyvs4 */
	T0* a57; /* yyspecial_routines5 */
	T6 a58; /* yyvsc5 */
	T0* a59; /* yyvs5 */
	T0* a60; /* yytypes1 */
	T0* a61; /* yytypes2 */
	T6 a62; /* yy_start */
	T6 a63; /* yyvsp1 */
	T6 a64; /* yyvsp2 */
	T6 a65; /* yyvsp3 */
	T6 a66; /* yyvsp4 */
	T6 a67; /* yyvsp5 */
	T1 a68; /* yy_more_flag */
	T6 a69; /* yy_more_len */
	T6 a70; /* line */
	T6 a71; /* column */
	T6 a72; /* position */
	T6 a73; /* yy_start_state */
	T0* a74; /* yy_state_stack */
	T6 a75; /* yy_state_count */
	T0* a76; /* yy_content_area */
	T0* a77; /* yy_ec */
	T0* a78; /* yy_content */
	T0* a79; /* yy_accept */
	T6 a80; /* yy_last_accepting_state */
	T6 a81; /* yy_last_accepting_cpos */
	T0* a82; /* yy_chk */
	T0* a83; /* yy_base */
	T0* a84; /* yy_def */
	T0* a85; /* yy_meta */
	T0* a86; /* yy_nxt */
	T6 a87; /* yy_lp */
	T0* a88; /* yy_acclist */
	T6 a89; /* yy_looking_for_trail_begin */
	T6 a90; /* yy_full_match */
	T6 a91; /* yy_full_state */
	T6 a92; /* yy_full_lp */
	T1 a93; /* yy_rejected */
	T0* a94; /* last_detachable_any_value */
	T6 a95; /* last_integer_value */
	T1 a96; /* in_trail_context */
	T0* a97; /* rule */
	T1 a98; /* has_trail_context */
	T6 a99; /* head_count */
	T6 a100; /* head_line */
	T6 a101; /* head_column */
	T6 a102; /* trail_count */
	T6 a103; /* rule_line_nb */
};

/* Struct for type LX_DESCRIPTION */
struct S551 {
	int id;
	T0* a1; /* equiv_classes */
	T1 a2; /* equiv_classes_used */
	T1 a3; /* full_table */
	T1 a4; /* meta_equiv_classes_used */
	T1 a5; /* reject_used */
	T1 a6; /* variable_trail_context */
	T0* a7; /* rules */
	T0* a8; /* start_conditions */
	T6 a9; /* characters_count */
	T6 a10; /* array_size */
	T1 a11; /* line_pragma */
	T0* a12; /* eof_rules */
	T0* a13; /* eiffel_header */
	T1 a14; /* case_insensitive */
	T0* a15; /* input_filename */
	T1 a16; /* inspect_used */
	T1 a17; /* actions_separated */
	T0* a18; /* eiffel_code */
	T1 a19; /* bol_needed */
	T1 a20; /* pre_action_used */
	T1 a21; /* post_action_used */
	T1 a22; /* pre_eof_action_used */
	T1 a23; /* post_eof_action_used */
	T1 a24; /* line_used */
	T1 a25; /* position_used */
};

/* Struct for type LX_FULL_DFA */
struct S552 {
	int id;
	T0* a1; /* yy_nxt */
	T0* a2; /* yy_accept */
	T6 a3; /* yyNb_rows */
	T0* a4; /* input_filename */
	T6 a5; /* characters_count */
	T6 a6; /* array_size */
	T1 a7; /* inspect_used */
	T1 a8; /* actions_separated */
	T0* a9; /* eiffel_code */
	T0* a10; /* eiffel_header */
	T1 a11; /* bol_needed */
	T1 a12; /* pre_action_used */
	T1 a13; /* post_action_used */
	T1 a14; /* pre_eof_action_used */
	T1 a15; /* post_eof_action_used */
	T1 a16; /* line_pragma */
	T0* a17; /* yy_start_conditions */
	T0* a18; /* yy_ec */
	T6 a19; /* yyNull_equiv_class */
	T6 a20; /* yyNb_rules */
	T0* a21; /* yy_rules */
	T6 a22; /* yyEnd_of_buffer */
	T1 a23; /* yyLine_used */
	T1 a24; /* yyPosition_used */
	T6 a25; /* minimum_symbol */
	T6 a26; /* maximum_symbol */
	T0* a27; /* states */
	T6 a28; /* backing_up_count */
	T0* a29; /* partitions */
	T6 a30; /* start_states_count */
	T1 a31; /* yyBacking_up */
	T0* a32; /* yy_eof_rules */
};

/* Struct for type DS_HASH_SET_CURSOR [INTEGER_32] */
struct S554 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type detachable KL_EQUALITY_TESTER [INTEGER_32] */
struct S555 {
	int id;
};

/* Struct for type ARRAY [DS_PAIR [STRING_8, STRING_8]] */
struct S556 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type KL_NULL_TEXT_OUTPUT_STREAM */
struct S557 {
	int id;
	T0* a1; /* name */
};

/* Struct for type DP_SHELL_COMMAND */
struct S558 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* string_command */
	T0* a3; /* command */
	T6 a4; /* return_code */
	T1 a5; /* is_system_code */
};

/* Struct for type DS_CELL [BOOLEAN] */
struct S559 {
	int id;
	T1 a1; /* item */
};

/* Struct for type KL_BOOLEAN_ROUTINES */
struct S561 {
	int id;
};

/* Struct for type GEANT_VARIABLES_VARIABLE_RESOLVER */
struct S562 {
	int id;
	T0* a1; /* variables */
};

/* Struct for type RX_PCRE_REGULAR_EXPRESSION */
struct S563 {
	int id;
	T6 a1; /* match_count */
	T0* a2; /* error_message */
	T0* a3; /* subject */
	T6 a4; /* subject_end */
	T6 a5; /* subject_start */
	T0* a6; /* offset_vector */
	T6 a7; /* offset_vector_count */
	T6 a8; /* brastart_capacity */
	T0* a9; /* brastart_vector */
	T6 a10; /* brastart_lower */
	T6 a11; /* brastart_count */
	T6 a12; /* eptr_capacity */
	T0* a13; /* eptr_vector */
	T6 a14; /* eptr_lower */
	T6 a15; /* eptr_upper */
	T0* a16; /* byte_code */
	T0* a17; /* internal_start_bits */
	T0* a18; /* pattern_buffer */
	T6 a19; /* subexpression_count */
	T0* a20; /* pattern */
	T6 a21; /* pattern_count */
	T6 a22; /* pattern_position */
	T6 a23; /* code_index */
	T6 a24; /* maxbackrefs */
	T6 a25; /* optchanged */
	T6 a26; /* first_character */
	T6 a27; /* required_character */
	T6 a28; /* regexp_countlits */
	T0* a29; /* start_bits */
	T1 a30; /* is_anchored */
	T1 a31; /* is_caseless */
	T1 a32; /* is_multiline */
	T0* a33; /* character_case_mapping */
	T0* a34; /* word_set */
	T6 a35; /* subject_next_start */
	T6 a36; /* error_code */
	T6 a37; /* error_position */
	T1 a38; /* is_startline */
	T1 a39; /* is_bol */
	T1 a40; /* is_eol */
	T1 a41; /* is_dotall */
	T1 a42; /* is_extended */
	T1 a43; /* is_empty_allowed */
	T1 a44; /* is_dollar_endonly */
	T1 a45; /* is_greedy */
	T1 a46; /* is_strict */
	T1 a47; /* is_ichanged */
	T6 a48; /* first_matched_index */
	T6 a49; /* eptr */
	T6 a50; /* offset_top */
	T1 a51; /* is_matching_caseless */
	T1 a52; /* is_matching_multiline */
	T1 a53; /* is_matching_dotall */
};

/* Struct for type KL_STRING_EQUALITY_TESTER */
struct S564 {
	int id;
};

/* Struct for type KL_STDIN_FILE */
struct S565 {
	int id;
	T0* a1; /* last_string */
	T1 a2; /* end_of_file */
	T2 a3; /* last_character */
	T14 a4; /* file_pointer */
	T0* a5; /* character_buffer */
	T6 a6; /* mode */
	T0* a7; /* internal_name */
	T0* a8; /* internal_detachable_name_pointer */
};

/* Struct for type ARRAY [GEANT_FILESET_ENTRY] */
struct S569 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_ARRAYED_LIST [LX_RULE] */
struct S570 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type LX_START_CONDITIONS */
struct S571 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type LX_ACTION_FACTORY */
struct S572 {
	int id;
};

/* Struct for type DS_ARRAYED_STACK [INTEGER_32] */
struct S573 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
};

/* Struct for type LX_SYMBOL_CLASS */
struct S574 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T1 a4; /* sort_needed */
	T1 a5; /* negated */
	T0* a6; /* internal_cursor */
	T6 a7; /* count */
	T0* a8; /* equality_tester */
};

/* Struct for type DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8] */
struct S575 {
	int id;
	T6 a1; /* position */
	T6 a2; /* found_position */
	T0* a3; /* item_storage */
	T0* a4; /* key_equality_tester */
	T0* a5; /* internal_keys */
	T6 a6; /* count */
	T6 a7; /* capacity */
	T6 a8; /* slots_position */
	T6 a9; /* free_slot */
	T6 a10; /* last_position */
	T6 a11; /* modulus */
	T6 a12; /* clashes_previous_position */
	T0* a13; /* equality_tester */
	T0* a14; /* special_item_routines */
	T0* a15; /* clashes */
	T0* a16; /* slots */
	T0* a17; /* special_key_routines */
	T0* a18; /* key_storage */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS] */
struct S576 {
	int id;
};

/* Struct for type SPECIAL [LX_SYMBOL_CLASS] */
struct S577 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_NFA] */
struct S578 {
	int id;
};

/* Struct for type LX_NFA */
struct S579 {
	int id;
	T1 a1; /* in_trail_context */
	T0* a2; /* states */
};

/* Struct for type SPECIAL [LX_NFA] */
struct S580 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type LX_EQUIVALENCE_CLASSES */
struct S581 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
};

/* Struct for type LX_RULE */
struct S582 {
	int id;
	T6 a1; /* id */
	T0* a2; /* pattern */
	T0* a3; /* action */
	T6 a4; /* head_count */
	T6 a5; /* trail_count */
	T6 a6; /* line_count */
	T6 a7; /* column_count */
	T6 a8; /* line_nb */
	T1 a9; /* has_trail_context */
	T1 a10; /* is_useful */
};

/* Struct for type UT_SYNTAX_ERROR */
struct S583 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
struct S584 {
	int id;
	T6 a1; /* position */
	T0* a2; /* container */
	T0* a3; /* next_cursor */
};

/* Struct for type LX_UNRECOGNIZED_RULE_ERROR */
struct S585 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_MISSING_QUOTE_ERROR */
struct S586 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_BAD_CHARACTER_CLASS_ERROR */
struct S587 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_BAD_CHARACTER_ERROR */
struct S588 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_FULL_AND_META_ERROR */
struct S589 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_FULL_AND_REJECT_ERROR */
struct S590 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR */
struct S591 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_CHARACTER_OUT_OF_RANGE_ERROR */
struct S592 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type SPECIAL [LX_RULE] */
struct S593 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [LX_RULE] */
struct S594 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type LX_DFA_STATE */
struct S595 {
	int id;
	T0* a1; /* accepted_rules */
	T0* a2; /* states */
	T0* a3; /* transitions */
	T0* a4; /* accepted_head_rules */
	T6 a5; /* code */
	T6 a6; /* id */
};

/* Struct for type DS_ARRAYED_LIST [LX_NFA_STATE] */
struct S596 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* equality_tester */
	T0* a4; /* special_routines */
	T6 a5; /* capacity */
	T0* a6; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST [LX_DFA_STATE] */
struct S597 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T0* a5; /* internal_cursor */
};

/* Struct for type LX_SYMBOL_PARTITIONS */
struct S598 {
	int id;
	T0* a1; /* symbols */
	T0* a2; /* storage */
	T6 a3; /* count */
};

/* Struct for type KL_ARRAY_ROUTINES [LX_RULE] */
struct S599 {
	int id;
};

/* Struct for type LX_START_CONDITION */
struct S600 {
	int id;
	T0* a1; /* name */
	T6 a2; /* id */
	T1 a3; /* is_exclusive */
	T0* a4; /* patterns */
	T0* a5; /* bol_patterns */
};

/* Struct for type LX_TRANSITION_TABLE [LX_DFA_STATE] */
struct S601 {
	int id;
	T0* a1; /* storage */
	T0* a2; /* array_routines */
	T6 a3; /* count */
};

/* Struct for type DS_ARRAYED_LIST [LX_NFA] */
struct S602 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T6 a5; /* count */
};

/* Struct for type DS_HASH_TABLE [LX_NFA, INTEGER_32] */
struct S603 {
	int id;
	T6 a1; /* position */
	T0* a2; /* item_storage */
	T0* a3; /* key_equality_tester */
	T6 a4; /* count */
	T6 a5; /* capacity */
	T6 a6; /* slots_position */
	T6 a7; /* free_slot */
	T6 a8; /* last_position */
	T6 a9; /* modulus */
	T6 a10; /* clashes_previous_position */
	T0* a11; /* equality_tester */
	T6 a12; /* found_position */
	T0* a13; /* special_item_routines */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* special_key_routines */
	T0* a17; /* key_storage */
	T0* a18; /* internal_cursor */
	T0* a19; /* hash_function */
};

/* Struct for type LX_NFA_STATE */
struct S604 {
	int id;
	T1 a1; /* in_trail_context */
	T0* a2; /* transition */
	T0* a3; /* epsilon_transition */
	T6 a4; /* id */
	T0* a5; /* accepted_rule */
};

/* Struct for type LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR */
struct S606 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type RX_BYTE_CODE */
struct S608 {
	int id;
	T6 a1; /* count */
	T0* a2; /* byte_code */
	T0* a3; /* character_sets */
	T6 a4; /* capacity */
	T6 a5; /* character_sets_count */
	T6 a6; /* character_sets_capacity */
};

/* Struct for type RX_CHARACTER_SET */
struct S609 {
	int id;
	T0* a1; /* set */
};

/* Struct for type RX_CASE_MAPPING */
struct S610 {
	int id;
	T0* a1; /* lower_table */
	T0* a2; /* flip_table */
};

/* Struct for type SPECIAL [RX_CHARACTER_SET] */
struct S612 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [RX_CHARACTER_SET] */
struct S613 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_RULE] */
struct S614 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_RULE] */
struct S615 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [LX_START_CONDITION] */
struct S616 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_START_CONDITION] */
struct S617 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION] */
struct S618 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
struct S619 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type ARRAY [LX_SYMBOL_CLASS] */
struct S622 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [LX_NFA] */
struct S623 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE] */
struct S624 {
	int id;
	T0* a1; /* label */
	T0* a2; /* target */
};

/* Struct for type LX_EPSILON_TRANSITION [LX_NFA_STATE] */
struct S626 {
	int id;
	T0* a1; /* target */
};

/* Struct for type LX_SYMBOL_TRANSITION [LX_NFA_STATE] */
struct S628 {
	int id;
	T6 a1; /* label */
	T0* a2; /* target */
};

/* Struct for type DS_BILINKABLE [INTEGER_32] */
struct S629 {
	int id;
	T6 a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
};

/* Struct for type SPECIAL [DS_BILINKABLE [INTEGER_32]] */
struct S630 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [DS_BILINKABLE [INTEGER_32]] */
struct S631 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type LX_ACTION */
struct S633 {
	int id;
	T0* a1; /* text */
};

/* Struct for type DS_BUBBLE_SORTER [LX_NFA_STATE] */
struct S634 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type DS_BUBBLE_SORTER [LX_RULE] */
struct S636 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type SPECIAL [LX_NFA_STATE] */
struct S638 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_NFA_STATE] */
struct S640 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE] */
struct S641 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [LX_DFA_STATE] */
struct S643 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_DFA_STATE] */
struct S644 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE] */
struct S645 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_ARRAY [LX_RULE] */
struct S646 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [detachable LX_DFA_STATE] */
struct S647 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type KL_ARRAY_ROUTINES [detachable LX_DFA_STATE] */
struct S648 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_NFA] */
struct S649 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32] */
struct S651 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_BINARY_INPUT_FILE */
struct S652 {
	int id;
	T1 a1; /* end_of_file */
	T0* a2; /* last_string */
	T6 a3; /* mode */
	T0* a4; /* name */
	T0* a5; /* character_buffer */
	T14 a6; /* file_pointer */
	T1 a7; /* descriptor_available */
	T0* a8; /* internal_name */
	T0* a9; /* internal_detachable_name_pointer */
};

/* Struct for type KL_BINARY_OUTPUT_FILE */
struct S653 {
	int id;
	T6 a1; /* mode */
	T0* a2; /* name */
	T14 a3; /* file_pointer */
	T1 a4; /* descriptor_available */
	T0* a5; /* last_string */
	T0* a6; /* internal_name */
	T0* a7; /* internal_detachable_name_pointer */
};

/* Struct for type PATH */
struct S659 {
	int id;
	T0* a1; /* storage */
	T0* a2; /* internal_name */
	T1 a3; /* is_normalized */
};

/* Struct for type RAW_FILE */
struct S660 {
	int id;
	T6 a1; /* mode */
	T14 a2; /* file_pointer */
	T0* a3; /* last_string */
	T6 a4; /* last_integer */
	T12 a5; /* last_real */
	T13 a6; /* last_double */
	T2 a7; /* last_character */
	T0* a8; /* internal_name */
	T0* a9; /* internal_detachable_name_pointer */
	T1 a10; /* descriptor_available */
};

/* Struct for type DIRECTORY */
struct S661 {
	int id;
	T14 a1; /* last_entry_pointer */
	T14 a2; /* directory_pointer */
	T0* a3; /* lastentry */
	T0* a4; /* internal_name */
	T6 a5; /* mode */
	T0* a6; /* internal_detachable_name_pointer */
};

/* Struct for type ARRAYED_LIST [READABLE_STRING_32] */
struct S662 {
	int id;
	T6 a1; /* index */
	T0* a2; /* area_v2 */
};

/* Struct for type [attached] TUPLE [ARRAYED_LIST [READABLE_STRING_32]] */
struct S663 {
	int id;
	T0* z1;
};

/* Struct for type KL_COMPARABLE_COMPARATOR [LX_RULE] */
struct S666 {
	int id;
};

/* Struct for type KL_COMPARABLE_COMPARATOR [LX_NFA_STATE] */
struct S669 {
	int id;
};

/* Struct for type ARRAY [LX_START_CONDITION] */
struct S672 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [LX_NFA_STATE] */
struct S673 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type STRING_8_SEARCHER */
struct S674 {
	int id;
	T0* a1; /* deltas */
};

/* Struct for type HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32] */
struct S675 {
	int id;
	T6 a1; /* capacity */
	T0* a2; /* content */
	T0* a3; /* keys */
	T0* a4; /* deleted_marks */
	T0* a5; /* indexes_map */
	T6 a6; /* iteration_position */
	T6 a7; /* count */
	T6 a8; /* deleted_item_position */
	T6 a9; /* control */
	T0* a10; /* found_item */
	T1 a11; /* has_default */
	T6 a12; /* item_position */
	T6 a13; /* ht_lowest_deleted_position */
	T0* a14; /* ht_deleted_item */
	T0* a15; /* ht_deleted_key */
	T1 a16; /* object_comparison */
};

/* Struct for type DS_SHELL_SORTER [INTEGER_32] */
struct S676 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type ARRAYED_LIST [READABLE_STRING_GENERAL] */
struct S678 {
	int id;
	T6 a1; /* index */
	T0* a2; /* area_v2 */
};

/* Struct for type [attached] TUPLE [ARRAYED_LIST [READABLE_STRING_GENERAL]] */
struct S679 {
	int id;
	T0* z1;
};

/* Struct for type SPECIAL [READABLE_STRING_32] */
struct S680 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_COMPARABLE_COMPARATOR [INTEGER_32] */
struct S681 {
	int id;
};

/* Struct for type PRIMES */
struct S684 {
	int id;
};

/* Struct for type SPECIAL [NATIVE_STRING] */
struct S685 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [READABLE_STRING_GENERAL] */
struct S686 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

typedef struct {
	int id;
	EIF_INTEGER type_id;
	EIF_BOOLEAN is_special;
	void (*dispose) (EIF_REFERENCE);
	T0* a1;
} EIF_TYPE;


extern T1 GE_default1;
extern T2 GE_default2;
extern T3 GE_default3;
extern T4 GE_default4;
extern T5 GE_default5;
extern T6 GE_default6;
extern T7 GE_default7;
extern T8 GE_default8;
extern T9 GE_default9;
extern T10 GE_default10;
extern T11 GE_default11;
extern T12 GE_default12;
extern T13 GE_default13;
extern T14 GE_default14;
extern T15 GE_default15;
extern T16 GE_default16;
extern T17 GE_default17;
extern T18 GE_default18;
extern T21 GE_default21;
extern T22 GE_default22;
extern T23 GE_default23;
extern T24 GE_default24;
extern T25 GE_default25;
extern T26 GE_default26;
extern T27 GE_default27;
extern T28 GE_default28;
extern T29 GE_default29;
extern T30 GE_default30;
extern T31 GE_default31;
extern T32 GE_default32;
extern T33 GE_default33;
extern T34 GE_default34;
extern T35 GE_default35;
extern T36 GE_default36;
extern T37 GE_default37;
extern T38 GE_default38;
extern T40 GE_default40;
extern T45 GE_default45;
extern T46 GE_default46;
extern T47 GE_default47;
extern T48 GE_default48;
extern T49 GE_default49;
extern T51 GE_default51;
extern T53 GE_default53;
extern T54 GE_default54;
extern T55 GE_default55;
extern T56 GE_default56;
extern T58 GE_default58;
extern T59 GE_default59;
extern T62 GE_default62;
extern T63 GE_default63;
extern T64 GE_default64;
extern T65 GE_default65;
extern T67 GE_default67;
extern T68 GE_default68;
extern T70 GE_default70;
extern T71 GE_default71;
extern T72 GE_default72;
extern T73 GE_default73;
extern T74 GE_default74;
extern T75 GE_default75;
extern T77 GE_default77;
extern T78 GE_default78;
extern T79 GE_default79;
extern T83 GE_default83;
extern T84 GE_default84;
extern T85 GE_default85;
extern T87 GE_default87;
extern T88 GE_default88;
extern T90 GE_default90;
extern T92 GE_default92;
extern T94 GE_default94;
extern T96 GE_default96;
extern T97 GE_default97;
extern T100 GE_default100;
extern T101 GE_default101;
extern T102 GE_default102;
extern T103 GE_default103;
extern T104 GE_default104;
extern T107 GE_default107;
extern T108 GE_default108;
extern T109 GE_default109;
extern T110 GE_default110;
extern T112 GE_default112;
extern T113 GE_default113;
extern T114 GE_default114;
extern T115 GE_default115;
extern T116 GE_default116;
extern T117 GE_default117;
extern T118 GE_default118;
extern T119 GE_default119;
extern T120 GE_default120;
extern T121 GE_default121;
extern T122 GE_default122;
extern T123 GE_default123;
extern T125 GE_default125;
extern T127 GE_default127;
extern T128 GE_default128;
extern T129 GE_default129;
extern T130 GE_default130;
extern T131 GE_default131;
extern T134 GE_default134;
extern T135 GE_default135;
extern T136 GE_default136;
extern T137 GE_default137;
extern T138 GE_default138;
extern T139 GE_default139;
extern T142 GE_default142;
extern T143 GE_default143;
extern T145 GE_default145;
extern T146 GE_default146;
extern T147 GE_default147;
extern T148 GE_default148;
extern T150 GE_default150;
extern T152 GE_default152;
extern T153 GE_default153;
extern T154 GE_default154;
extern T155 GE_default155;
extern T156 GE_default156;
extern T157 GE_default157;
extern T158 GE_default158;
extern T159 GE_default159;
extern T160 GE_default160;
extern T161 GE_default161;
extern T162 GE_default162;
extern T163 GE_default163;
extern T164 GE_default164;
extern T165 GE_default165;
extern T166 GE_default166;
extern T167 GE_default167;
extern T168 GE_default168;
extern T169 GE_default169;
extern T170 GE_default170;
extern T171 GE_default171;
extern T172 GE_default172;
extern T173 GE_default173;
extern T174 GE_default174;
extern T175 GE_default175;
extern T176 GE_default176;
extern T177 GE_default177;
extern T178 GE_default178;
extern T179 GE_default179;
extern T180 GE_default180;
extern T183 GE_default183;
extern T184 GE_default184;
extern T186 GE_default186;
extern T187 GE_default187;
extern T188 GE_default188;
extern T189 GE_default189;
extern T190 GE_default190;
extern T191 GE_default191;
extern T192 GE_default192;
extern T196 GE_default196;
extern T199 GE_default199;
extern T201 GE_default201;
extern T202 GE_default202;
extern T203 GE_default203;
extern T204 GE_default204;
extern T205 GE_default205;
extern T206 GE_default206;
extern T207 GE_default207;
extern T209 GE_default209;
extern T210 GE_default210;
extern T211 GE_default211;
extern T213 GE_default213;
extern T214 GE_default214;
extern T215 GE_default215;
extern T216 GE_default216;
extern T217 GE_default217;
extern T218 GE_default218;
extern T219 GE_default219;
extern T220 GE_default220;
extern T223 GE_default223;
extern T224 GE_default224;
extern T225 GE_default225;
extern T226 GE_default226;
extern T227 GE_default227;
extern T228 GE_default228;
extern T229 GE_default229;
extern T230 GE_default230;
extern T231 GE_default231;
extern T232 GE_default232;
extern T233 GE_default233;
extern T234 GE_default234;
extern T235 GE_default235;
extern T236 GE_default236;
extern T237 GE_default237;
extern T239 GE_default239;
extern T240 GE_default240;
extern T241 GE_default241;
extern T242 GE_default242;
extern T245 GE_default245;
extern T246 GE_default246;
extern T247 GE_default247;
extern T248 GE_default248;
extern T249 GE_default249;
extern T252 GE_default252;
extern T253 GE_default253;
extern T254 GE_default254;
extern T255 GE_default255;
extern T256 GE_default256;
extern T257 GE_default257;
extern T258 GE_default258;
extern T259 GE_default259;
extern T260 GE_default260;
extern T261 GE_default261;
extern T262 GE_default262;
extern T263 GE_default263;
extern T264 GE_default264;
extern T265 GE_default265;
extern T266 GE_default266;
extern T267 GE_default267;
extern T268 GE_default268;
extern T269 GE_default269;
extern T270 GE_default270;
extern T271 GE_default271;
extern T272 GE_default272;
extern T274 GE_default274;
extern T275 GE_default275;
extern T276 GE_default276;
extern T277 GE_default277;
extern T278 GE_default278;
extern T279 GE_default279;
extern T283 GE_default283;
extern T284 GE_default284;
extern T285 GE_default285;
extern T289 GE_default289;
extern T290 GE_default290;
extern T291 GE_default291;
extern T292 GE_default292;
extern T294 GE_default294;
extern T295 GE_default295;
extern T296 GE_default296;
extern T297 GE_default297;
extern T298 GE_default298;
extern T299 GE_default299;
extern T300 GE_default300;
extern T301 GE_default301;
extern T304 GE_default304;
extern T305 GE_default305;
extern T306 GE_default306;
extern T307 GE_default307;
extern T308 GE_default308;
extern T309 GE_default309;
extern T310 GE_default310;
extern T311 GE_default311;
extern T312 GE_default312;
extern T313 GE_default313;
extern T314 GE_default314;
extern T315 GE_default315;
extern T316 GE_default316;
extern T317 GE_default317;
extern T318 GE_default318;
extern T319 GE_default319;
extern T320 GE_default320;
extern T321 GE_default321;
extern T322 GE_default322;
extern T323 GE_default323;
extern T324 GE_default324;
extern T325 GE_default325;
extern T326 GE_default326;
extern T327 GE_default327;
extern T328 GE_default328;
extern T329 GE_default329;
extern T330 GE_default330;
extern T331 GE_default331;
extern T332 GE_default332;
extern T333 GE_default333;
extern T334 GE_default334;
extern T335 GE_default335;
extern T336 GE_default336;
extern T337 GE_default337;
extern T338 GE_default338;
extern T339 GE_default339;
extern T340 GE_default340;
extern T341 GE_default341;
extern T342 GE_default342;
extern T343 GE_default343;
extern T344 GE_default344;
extern T345 GE_default345;
extern T346 GE_default346;
extern T347 GE_default347;
extern T348 GE_default348;
extern T349 GE_default349;
extern T350 GE_default350;
extern T351 GE_default351;
extern T352 GE_default352;
extern T353 GE_default353;
extern T355 GE_default355;
extern T357 GE_default357;
extern T358 GE_default358;
extern T359 GE_default359;
extern T360 GE_default360;
extern T361 GE_default361;
extern T362 GE_default362;
extern T363 GE_default363;
extern T364 GE_default364;
extern T365 GE_default365;
extern T366 GE_default366;
extern T367 GE_default367;
extern T368 GE_default368;
extern T369 GE_default369;
extern T370 GE_default370;
extern T371 GE_default371;
extern T372 GE_default372;
extern T373 GE_default373;
extern T375 GE_default375;
extern T376 GE_default376;
extern T377 GE_default377;
extern T378 GE_default378;
extern T379 GE_default379;
extern T380 GE_default380;
extern T381 GE_default381;
extern T382 GE_default382;
extern T384 GE_default384;
extern T387 GE_default387;
extern T390 GE_default390;
extern T391 GE_default391;
extern T392 GE_default392;
extern T393 GE_default393;
extern T394 GE_default394;
extern T395 GE_default395;
extern T396 GE_default396;
extern T397 GE_default397;
extern T398 GE_default398;
extern T399 GE_default399;
extern T400 GE_default400;
extern T401 GE_default401;
extern T402 GE_default402;
extern T403 GE_default403;
extern T404 GE_default404;
extern T405 GE_default405;
extern T406 GE_default406;
extern T407 GE_default407;
extern T408 GE_default408;
extern T409 GE_default409;
extern T410 GE_default410;
extern T411 GE_default411;
extern T412 GE_default412;
extern T413 GE_default413;
extern T414 GE_default414;
extern T415 GE_default415;
extern T416 GE_default416;
extern T417 GE_default417;
extern T418 GE_default418;
extern T419 GE_default419;
extern T420 GE_default420;
extern T421 GE_default421;
extern T422 GE_default422;
extern T423 GE_default423;
extern T424 GE_default424;
extern T425 GE_default425;
extern T426 GE_default426;
extern T427 GE_default427;
extern T428 GE_default428;
extern T429 GE_default429;
extern T430 GE_default430;
extern T431 GE_default431;
extern T432 GE_default432;
extern T433 GE_default433;
extern T434 GE_default434;
extern T435 GE_default435;
extern T436 GE_default436;
extern T437 GE_default437;
extern T438 GE_default438;
extern T439 GE_default439;
extern T440 GE_default440;
extern T441 GE_default441;
extern T442 GE_default442;
extern T443 GE_default443;
extern T444 GE_default444;
extern T445 GE_default445;
extern T446 GE_default446;
extern T447 GE_default447;
extern T448 GE_default448;
extern T449 GE_default449;
extern T450 GE_default450;
extern T451 GE_default451;
extern T452 GE_default452;
extern T453 GE_default453;
extern T454 GE_default454;
extern T455 GE_default455;
extern T456 GE_default456;
extern T457 GE_default457;
extern T458 GE_default458;
extern T459 GE_default459;
extern T460 GE_default460;
extern T461 GE_default461;
extern T462 GE_default462;
extern T463 GE_default463;
extern T464 GE_default464;
extern T465 GE_default465;
extern T466 GE_default466;
extern T467 GE_default467;
extern T468 GE_default468;
extern T469 GE_default469;
extern T470 GE_default470;
extern T471 GE_default471;
extern T472 GE_default472;
extern T473 GE_default473;
extern T474 GE_default474;
extern T475 GE_default475;
extern T476 GE_default476;
extern T477 GE_default477;
extern T478 GE_default478;
extern T479 GE_default479;
extern T480 GE_default480;
extern T481 GE_default481;
extern T482 GE_default482;
extern T483 GE_default483;
extern T484 GE_default484;
extern T485 GE_default485;
extern T487 GE_default487;
extern T488 GE_default488;
extern T489 GE_default489;
extern T490 GE_default490;
extern T492 GE_default492;
extern T493 GE_default493;
extern T494 GE_default494;
extern T495 GE_default495;
extern T497 GE_default497;
extern T498 GE_default498;
extern T499 GE_default499;
extern T500 GE_default500;
extern T501 GE_default501;
extern T502 GE_default502;
extern T504 GE_default504;
extern T505 GE_default505;
extern T508 GE_default508;
extern T509 GE_default509;
extern T512 GE_default512;
extern T514 GE_default514;
extern T516 GE_default516;
extern T518 GE_default518;
extern T519 GE_default519;
extern T520 GE_default520;
extern T521 GE_default521;
extern T522 GE_default522;
extern T524 GE_default524;
extern T525 GE_default525;
extern T526 GE_default526;
extern T527 GE_default527;
extern T529 GE_default529;
extern T530 GE_default530;
extern T531 GE_default531;
extern T532 GE_default532;
extern T533 GE_default533;
extern T534 GE_default534;
extern T535 GE_default535;
extern T536 GE_default536;
extern T538 GE_default538;
extern T539 GE_default539;
extern T540 GE_default540;
extern T544 GE_default544;
extern T545 GE_default545;
extern T546 GE_default546;
extern T547 GE_default547;
extern T548 GE_default548;
extern T549 GE_default549;
extern T550 GE_default550;
extern T551 GE_default551;
extern T552 GE_default552;
extern T554 GE_default554;
extern T555 GE_default555;
extern T556 GE_default556;
extern T557 GE_default557;
extern T558 GE_default558;
extern T559 GE_default559;
extern T561 GE_default561;
extern T562 GE_default562;
extern T563 GE_default563;
extern T564 GE_default564;
extern T565 GE_default565;
extern T569 GE_default569;
extern T570 GE_default570;
extern T571 GE_default571;
extern T572 GE_default572;
extern T573 GE_default573;
extern T574 GE_default574;
extern T575 GE_default575;
extern T576 GE_default576;
extern T577 GE_default577;
extern T578 GE_default578;
extern T579 GE_default579;
extern T580 GE_default580;
extern T581 GE_default581;
extern T582 GE_default582;
extern T583 GE_default583;
extern T584 GE_default584;
extern T585 GE_default585;
extern T586 GE_default586;
extern T587 GE_default587;
extern T588 GE_default588;
extern T589 GE_default589;
extern T590 GE_default590;
extern T591 GE_default591;
extern T592 GE_default592;
extern T593 GE_default593;
extern T594 GE_default594;
extern T595 GE_default595;
extern T596 GE_default596;
extern T597 GE_default597;
extern T598 GE_default598;
extern T599 GE_default599;
extern T600 GE_default600;
extern T601 GE_default601;
extern T602 GE_default602;
extern T603 GE_default603;
extern T604 GE_default604;
extern T606 GE_default606;
extern T608 GE_default608;
extern T609 GE_default609;
extern T610 GE_default610;
extern T612 GE_default612;
extern T613 GE_default613;
extern T614 GE_default614;
extern T615 GE_default615;
extern T616 GE_default616;
extern T617 GE_default617;
extern T618 GE_default618;
extern T619 GE_default619;
extern T622 GE_default622;
extern T623 GE_default623;
extern T624 GE_default624;
extern T626 GE_default626;
extern T628 GE_default628;
extern T629 GE_default629;
extern T630 GE_default630;
extern T631 GE_default631;
extern T633 GE_default633;
extern T634 GE_default634;
extern T636 GE_default636;
extern T638 GE_default638;
extern T640 GE_default640;
extern T641 GE_default641;
extern T643 GE_default643;
extern T644 GE_default644;
extern T645 GE_default645;
extern T646 GE_default646;
extern T647 GE_default647;
extern T648 GE_default648;
extern T649 GE_default649;
extern T651 GE_default651;
extern T652 GE_default652;
extern T653 GE_default653;
extern T659 GE_default659;
extern T660 GE_default660;
extern T661 GE_default661;
extern T662 GE_default662;
extern T663 GE_default663;
extern T666 GE_default666;
extern T669 GE_default669;
extern T672 GE_default672;
extern T673 GE_default673;
extern T674 GE_default674;
extern T675 GE_default675;
extern T676 GE_default676;
extern T678 GE_default678;
extern T679 GE_default679;
extern T680 GE_default680;
extern T681 GE_default681;
extern T684 GE_default684;
extern T685 GE_default685;
extern T686 GE_default686;

extern T0* GE_ms8(char* s, T6 c);
extern T0* GE_ms32(char* s, T6 c);
/* Call to ANY.same_type */
extern T1 T19x27T0(T0* C, T0* a1);
/* Call to GEANT_VARIABLES.has */
extern T1 T29x2154T0(T0* C, T0* a1);
/* Call to GEANT_VARIABLES.item_for_iteration */
extern T0* T29x2220(T0* C);
/* Call to GEANT_VARIABLES.key_for_iteration */
extern T0* T29x2146(T0* C);
/* Call to GEANT_VARIABLES.after */
extern T1 T29x2200(T0* C);
/* Call to GEANT_VARIABLES.found_item */
extern T0* T29x2243(T0* C);
/* Call to GEANT_VARIABLES.found */
extern T1 T29x2251(T0* C);
/* Call to AP_OPTION.short_form */
extern T2 T42x2712(T0* C);
/* Call to AP_OPTION.long_form */
extern T0* T42x2707(T0* C);
/* Call to AP_OPTION.example */
extern T0* T42x2706(T0* C);
/* Call to AP_OPTION.is_hidden */
extern T1 T42x2716(T0* C);
/* Call to AP_OPTION.description */
extern T0* T42x2705(T0* C);
/* Call to AP_OPTION.names */
extern T0* T42x2709(T0* C);
/* Call to AP_OPTION.name */
extern T0* T42x2708(T0* C);
/* Call to AP_OPTION.needs_parameter */
extern T1 T42x2718(T0* C);
/* Call to AP_OPTION.has_short_form */
extern T1 T42x2715(T0* C);
/* Call to AP_OPTION.allows_parameter */
extern T1 T42x2713(T0* C);
/* Call to AP_OPTION.maximum_occurrences */
extern T6 T42x2711(T0* C);
/* Call to AP_OPTION.occurrences */
extern T6 T42x2710(T0* C);
/* Call to AP_OPTION.was_found */
extern T1 T42x2720(T0* C);
/* Call to AP_OPTION.is_mandatory */
extern T1 T42x2717(T0* C);
/* Call to UT_ERROR.default_message */
extern T0* T50x3037(T0* C);
/* Call to READABLE_STRING_GENERAL.code */
extern T10 T76x403T6(T0* C, T6 a1);
/* Call to READABLE_STRING_GENERAL.count */
extern T6 T76x439(T0* C);
/* Call to READABLE_STRING_GENERAL.substring */
extern T0* T76x480T6T6(T0* C, T6 a1, T6 a2);
/* Call to READABLE_STRING_GENERAL.item */
extern T3 T76x404T6(T0* C, T6 a1);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_key */
extern T0* T83x2148T0(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_item */
extern T0* T83x2228T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.start_condition */
extern T6 T142x7377(T0* C);
/* Call to XM_EIFFEL_SCANNER.is_applicable_encoding */
extern T1 T142x7252T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.end_of_file */
extern T1 T142x7382(T0* C);
/* Call to XM_EIFFEL_SCANNER.last_value */
extern T0* T142x7263(T0* C);
/* Call to XM_EIFFEL_SCANNER.last_token */
extern T6 T142x7373(T0* C);
/* Call to XM_EIFFEL_SCANNER.error_position */
extern T0* T142x7261(T0* C);
/* Call to XM_DOCUMENT_NODE.parent */
extern T0* T194x6676(T0* C);
/* Call to XM_ELEMENT_NODE.parent */
extern T0* T282x6676(T0* C);
/* Call to GEANT_TASK.exit_code */
extern T6 T302x8830(T0* C);
/* Call to GEANT_TASK.is_exit_command */
extern T1 T302x8831(T0* C);
/* Call to GEANT_TASK.is_enabled */
extern T1 T302x2535(T0* C);
/* Call to GEANT_TASK.is_executable */
extern T1 T302x8829(T0* C);
/* Call to FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK].item with a manifest tuple argument of type [attached] TUPLE [XM_ELEMENT] */
extern T0* T303xmt8820T298(T0* C, T0* a1);
/* Call to detachable LX_TRANSITION [LX_NFA_STATE].target */
extern T0* T625x12794(T0* C);
/* Call to detachable LX_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T625x12797T6(T0* C, T6 a1);
/* Call to GEANT_VARIABLES.replace */
extern void T29x2156T0T0(T0* C, T0* a1, T0* a2);
/* Call to GEANT_VARIABLES.set_variable_value */
extern void T29x2062T0T0(T0* C, T0* a1, T0* a2);
/* Call to GEANT_VARIABLES.forth */
extern void T29x2204(T0* C);
/* Call to GEANT_VARIABLES.start */
extern void T29x2203(T0* C);
/* Call to GEANT_VARIABLES.search */
extern void T29x2260T0(T0* C, T0* a1);
/* Call to GEANT_VARIABLES.force_last */
extern void T29x2131T0T0(T0* C, T0* a1, T0* a2);
/* Call to AP_OPTION.record_occurrence */
extern void T42x2731T0(T0* C, T0* a1);
/* Call to AP_OPTION.reset */
extern void T42x2732(T0* C);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_forth */
extern void T83x2217T0(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_start */
extern void T83x2216T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS_FILTER.set_next */
extern void T98x5914T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_xml_declaration */
extern void T99x6082T0T0T1(T0* C, T0* a1, T0* a2, T1 a3);
/* Call to XM_CALLBACKS.on_attribute */
extern void T99x6087T0T0T0T0(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* Call to XM_CALLBACKS.on_error */
extern void T99x6083T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_end_tag */
extern void T99x6089T0T0T0(T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_start_tag_finish */
extern void T99x6088(T0* C);
/* Call to XM_CALLBACKS.on_start_tag */
extern void T99x6086T0T0T0(T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_content */
extern void T99x6090T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_processing_instruction */
extern void T99x6084T0T0(T0* C, T0* a1, T0* a2);
/* Call to XM_CALLBACKS.on_comment */
extern void T99x6085T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_finish */
extern void T99x6081(T0* C);
/* Call to XM_CALLBACKS.on_start */
extern void T99x6080(T0* C);
/* Call to XM_EIFFEL_SCANNER.close_input */
extern void T142x7248(T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T142x7247T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.set_encoding */
extern void T142x7253T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T142x7244(T0* C);
/* Call to XM_EIFFEL_SCANNER.read_token */
extern void T142x7388(T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_stream */
extern void T142x7246T0(T0* C, T0* a1);
/* Call to XM_DOCUMENT_NODE.node_set_parent */
extern void T194x6700T0(T0* C, T0* a1);
/* Call to XM_ELEMENT_NODE.node_set_parent */
extern void T282x6700T0(T0* C, T0* a1);
/* Call to GEANT_TASK.execute */
extern void T302x8833(T0* C);
/* Call to GEANT_TASK.log_validation_messages */
extern void T302x8834(T0* C);
/* Call to detachable LX_TRANSITION [LX_NFA_STATE].record */
extern void T625x12798T0(T0* C, T0* a1);
/* New instance of type SPECIAL [CHARACTER_8] */
extern T0* GE_new15(T6 a1, T1 initialize);
/* New instance of type SPECIAL [CHARACTER_32] */
extern T0* GE_new16(T6 a1, T1 initialize);
/* New instance of type STRING_8 */
extern T0* GE_new17(T1 initialize);
/* New instance of type STRING_32 */
extern T0* GE_new18(T1 initialize);
/* New instance of type GEANT */
extern T0* GE_new21(T1 initialize);
/* New instance of type GEANT_PROJECT */
extern T0* GE_new22(T1 initialize);
/* New instance of type GEANT_PROJECT_LOADER */
extern T0* GE_new23(T1 initialize);
/* New instance of type GEANT_PROJECT_OPTIONS */
extern T0* GE_new24(T1 initialize);
/* New instance of type GEANT_PROJECT_VARIABLES */
extern T0* GE_new25(T1 initialize);
/* New instance of type GEANT_TARGET */
extern T0* GE_new26(T1 initialize);
/* New instance of type KL_ARGUMENTS */
extern T0* GE_new27(T1 initialize);
/* New instance of type UT_ERROR_HANDLER */
extern T0* GE_new28(T1 initialize);
/* New instance of type GEANT_VARIABLES */
extern T0* GE_new29(T1 initialize);
/* New instance of type GEANT_PROJECT_ELEMENT */
extern T0* GE_new30(T1 initialize);
/* New instance of type DS_HASH_TABLE [GEANT_TARGET, STRING_8] */
extern T0* GE_new31(T1 initialize);
/* New instance of type SPECIAL [STRING_8] */
extern T0* GE_new32(T6 a1, T1 initialize);
/* New instance of type ARRAY [STRING_8] */
extern T0* GE_new33(T1 initialize);
/* New instance of type GEANT_ARGUMENT_VARIABLES */
extern T0* GE_new34(T1 initialize);
/* New instance of type AP_FLAG */
extern T0* GE_new35(T1 initialize);
/* New instance of type AP_ALTERNATIVE_OPTIONS_LIST */
extern T0* GE_new36(T1 initialize);
/* New instance of type AP_STRING_OPTION */
extern T0* GE_new37(T1 initialize);
/* New instance of type AP_PARSER */
extern T0* GE_new38(T1 initialize);
/* New instance of type AP_ERROR */
extern T0* GE_new40(T1 initialize);
/* New instance of type AP_ERROR_HANDLER */
extern T0* GE_new45(T1 initialize);
/* New instance of type KL_STANDARD_FILES */
extern T0* GE_new46(T1 initialize);
/* New instance of type KL_STDERR_FILE */
extern T0* GE_new47(T1 initialize);
/* New instance of type KL_EXCEPTIONS */
extern T0* GE_new48(T1 initialize);
/* New instance of type UT_VERSION_NUMBER */
extern T0* GE_new49(T1 initialize);
/* New instance of type KL_OPERATING_SYSTEM */
extern T0* GE_new51(T1 initialize);
/* New instance of type KL_WINDOWS_FILE_SYSTEM */
extern T0* GE_new53(T1 initialize);
/* New instance of type KL_UNIX_FILE_SYSTEM */
extern T0* GE_new54(T1 initialize);
/* New instance of type KL_TEXT_INPUT_FILE */
extern T0* GE_new55(T1 initialize);
/* New instance of type GEANT_PROJECT_PARSER */
extern T0* GE_new56(T1 initialize);
/* New instance of type GEANT_PROJECT_VARIABLE_RESOLVER */
extern T0* GE_new58(T1 initialize);
/* New instance of type UC_STRING_EQUALITY_TESTER */
extern T0* GE_new59(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [STRING_8] */
extern T0* GE_new62(T1 initialize);
/* New instance of type SPECIAL [INTEGER_32] */
extern T0* GE_new63(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
extern T0* GE_new64(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [INTEGER_32] */
extern T0* GE_new65(T1 initialize);
/* New instance of type KL_STDOUT_FILE */
extern T0* GE_new67(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [AP_OPTION] */
extern T0* GE_new68(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [detachable STRING_8] */
extern T0* GE_new70(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [detachable STRING_8] */
extern T0* GE_new71(T1 initialize);
/* New instance of type AP_DISPLAY_HELP_FLAG */
extern T0* GE_new72(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [AP_OPTION] */
extern T0* GE_new73(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST] */
extern T0* GE_new74(T1 initialize);
/* New instance of type KL_STRING_ROUTINES */
extern T0* GE_new75(T1 initialize);
/* New instance of type MANAGED_POINTER */
extern T0* GE_new78(T1 initialize);
/* New instance of type FILE_INFO */
extern T0* GE_new79(T1 initialize);
/* New instance of type DS_HASH_TABLE [STRING_8, STRING_8] */
extern T0* GE_new83(T1 initialize);
/* New instance of type ARGUMENTS_32 */
extern T0* GE_new84(T1 initialize);
/* New instance of type IMMUTABLE_STRING_32 */
extern T0* GE_new85(T1 initialize);
/* New instance of type EXECUTION_ENVIRONMENT */
extern T0* GE_new87(T1 initialize);
/* New instance of type KL_ANY_ROUTINES */
extern T0* GE_new88(T1 initialize);
/* New instance of type KL_PATHNAME */
extern T0* GE_new90(T1 initialize);
/* New instance of type detachable KL_LINKABLE [CHARACTER_8] */
extern T0* GE_new92(T1 initialize);
/* New instance of type XM_EXPAT_PARSER_FACTORY */
extern T0* GE_new94(T1 initialize);
/* New instance of type XM_EIFFEL_PARSER */
extern T0* GE_new96(T1 initialize);
/* New instance of type XM_TREE_CALLBACKS_PIPE */
extern T0* GE_new97(T1 initialize);
/* New instance of type XM_CALLBACKS_TO_TREE_FILTER */
extern T0* GE_new100(T1 initialize);
/* New instance of type XM_DOCUMENT */
extern T0* GE_new101(T1 initialize);
/* New instance of type XM_ELEMENT */
extern T0* GE_new102(T1 initialize);
/* New instance of type XM_STOP_ON_ERROR_FILTER */
extern T0* GE_new103(T1 initialize);
/* New instance of type XM_POSITION_TABLE */
extern T0* GE_new104(T1 initialize);
/* New instance of type KL_EXECUTION_ENVIRONMENT */
extern T0* GE_new107(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES] */
extern T0* GE_new108(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [GEANT_VARIABLES] */
extern T0* GE_new109(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [AP_OPTION] */
extern T0* GE_new110(T1 initialize);
/* New instance of type SPECIAL [AP_OPTION] */
extern T0* GE_new112(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [AP_OPTION] */
extern T0* GE_new113(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST] */
extern T0* GE_new114(T1 initialize);
/* New instance of type SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
extern T0* GE_new115(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST] */
extern T0* GE_new116(T1 initialize);
/* New instance of type UC_STRING */
extern T0* GE_new117(T1 initialize);
/* New instance of type C_STRING */
extern T0* GE_new119(T1 initialize);
/* New instance of type PLATFORM */
extern T0* GE_new120(T1 initialize);
/* New instance of type detachable CELL [INTEGER_32] */
extern T0* GE_new121(T1 initialize);
/* New instance of type SPECIAL [NATURAL_8] */
extern T0* GE_new122(T6 a1, T1 initialize);
/* New instance of type STRING_TO_INTEGER_CONVERTOR */
extern T0* GE_new125(T1 initialize);
/* New instance of type DS_LINKED_LIST [XM_ELEMENT] */
extern T0* GE_new127(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [XM_ELEMENT] */
extern T0* GE_new128(T1 initialize);
/* New instance of type GEANT_INHERIT_ELEMENT */
extern T0* GE_new129(T1 initialize);
/* New instance of type GEANT_INHERIT */
extern T0* GE_new130(T1 initialize);
/* New instance of type SPECIAL [GEANT_TARGET] */
extern T0* GE_new131(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_TARGET] */
extern T0* GE_new134(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8] */
extern T0* GE_new135(T1 initialize);
/* New instance of type EXCEPTIONS */
extern T0* GE_new136(T1 initialize);
/* New instance of type SPECIAL [IMMUTABLE_STRING_32] */
extern T0* GE_new137(T6 a1, T1 initialize);
/* New instance of type ARRAY [IMMUTABLE_STRING_32] */
extern T0* GE_new138(T1 initialize);
/* New instance of type NATIVE_STRING */
extern T0* GE_new139(T1 initialize);
/* New instance of type XM_EIFFEL_SCANNER */
extern T0* GE_new142(T1 initialize);
/* New instance of type XM_DEFAULT_POSITION */
extern T0* GE_new143(T1 initialize);
/* New instance of type DS_BILINKED_LIST [XM_POSITION] */
extern T0* GE_new145(T1 initialize);
/* New instance of type DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
extern T0* GE_new146(T1 initialize);
/* New instance of type XM_CALLBACKS_NULL */
extern T0* GE_new147(T1 initialize);
/* New instance of type DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
extern T0* GE_new148(T1 initialize);
/* New instance of type XM_NULL_EXTERNAL_RESOLVER */
extern T0* GE_new150(T1 initialize);
/* New instance of type XM_DTD_CALLBACKS_NULL */
extern T0* GE_new152(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [detachable ANY] */
extern T0* GE_new153(T1 initialize);
/* New instance of type SPECIAL [detachable ANY] */
extern T0* GE_new154(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new155(T1 initialize);
/* New instance of type XM_EIFFEL_PARSER_NAME */
extern T0* GE_new156(T1 initialize);
/* New instance of type SPECIAL [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new157(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
extern T0* GE_new158(T1 initialize);
/* New instance of type DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new159(T1 initialize);
/* New instance of type SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
extern T0* GE_new160(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
extern T0* GE_new161(T1 initialize);
/* New instance of type XM_DTD_EXTERNAL_ID */
extern T0* GE_new162(T1 initialize);
/* New instance of type SPECIAL [XM_DTD_EXTERNAL_ID] */
extern T0* GE_new163(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new164(T1 initialize);
/* New instance of type XM_DTD_ELEMENT_CONTENT */
extern T0* GE_new165(T1 initialize);
/* New instance of type SPECIAL [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new166(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
extern T0* GE_new167(T1 initialize);
/* New instance of type DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new168(T1 initialize);
/* New instance of type SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
extern T0* GE_new169(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new170(T1 initialize);
/* New instance of type XM_DTD_ATTRIBUTE_CONTENT */
extern T0* GE_new171(T1 initialize);
/* New instance of type SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new172(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
extern T0* GE_new173(T1 initialize);
/* New instance of type DS_BILINKED_LIST [STRING_8] */
extern T0* GE_new174(T1 initialize);
/* New instance of type SPECIAL [DS_BILINKED_LIST [STRING_8]] */
extern T0* GE_new175(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [BOOLEAN] */
extern T0* GE_new176(T1 initialize);
/* New instance of type SPECIAL [BOOLEAN] */
extern T0* GE_new177(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
extern T0* GE_new178(T1 initialize);
/* New instance of type XM_EIFFEL_DECLARATION */
extern T0* GE_new179(T1 initialize);
/* New instance of type SPECIAL [XM_EIFFEL_DECLARATION] */
extern T0* GE_new180(T6 a1, T1 initialize);
/* New instance of type XM_EIFFEL_ENTITY_DEF */
extern T0* GE_new183(T1 initialize);
/* New instance of type XM_EIFFEL_SCANNER_DTD */
extern T0* GE_new184(T1 initialize);
/* New instance of type XM_EIFFEL_PE_ENTITY_DEF */
extern T0* GE_new186(T1 initialize);
/* New instance of type XM_NAMESPACE_RESOLVER */
extern T0* GE_new187(T1 initialize);
/* New instance of type SPECIAL [XM_CALLBACKS_FILTER] */
extern T0* GE_new188(T6 a1, T1 initialize);
/* New instance of type ARRAY [XM_CALLBACKS_FILTER] */
extern T0* GE_new189(T1 initialize);
/* New instance of type DS_HASH_SET [XM_NAMESPACE] */
extern T0* GE_new190(T1 initialize);
/* New instance of type XM_NAMESPACE */
extern T0* GE_new191(T1 initialize);
/* New instance of type XM_LINKED_LIST [XM_DOCUMENT_NODE] */
extern T0* GE_new192(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE] */
extern T0* GE_new196(T1 initialize);
/* New instance of type XM_LINKED_LIST [XM_ELEMENT_NODE] */
extern T0* GE_new199(T1 initialize);
/* New instance of type DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
extern T0* GE_new201(T1 initialize);
/* New instance of type SPECIAL [GEANT_ARGUMENT_VARIABLES] */
extern T0* GE_new202(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES] */
extern T0* GE_new203(T1 initialize);
/* New instance of type SPECIAL [GEANT_VARIABLES] */
extern T0* GE_new204(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_VARIABLES] */
extern T0* GE_new205(T1 initialize);
/* New instance of type ARRAY [AP_OPTION] */
extern T0* GE_new206(T1 initialize);
/* New instance of type ARRAY [AP_ALTERNATIVE_OPTIONS_LIST] */
extern T0* GE_new207(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [GEANT_TARGET] */
extern T0* GE_new209(T1 initialize);
/* New instance of type GEANT_TASK_FACTORY */
extern T0* GE_new210(T1 initialize);
/* New instance of type GEANT_PARENT */
extern T0* GE_new211(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [GEANT_PARENT] */
extern T0* GE_new213(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [GEANT_PARENT] */
extern T0* GE_new214(T1 initialize);
/* New instance of type GEANT_INTERPRETING_ELEMENT */
extern T0* GE_new215(T1 initialize);
/* New instance of type GEANT_ARGUMENT_ELEMENT */
extern T0* GE_new216(T1 initialize);
/* New instance of type GEANT_LOCAL_ELEMENT */
extern T0* GE_new217(T1 initialize);
/* New instance of type GEANT_GLOBAL_ELEMENT */
extern T0* GE_new218(T1 initialize);
/* New instance of type XM_ATTRIBUTE */
extern T0* GE_new219(T1 initialize);
/* New instance of type GEANT_GROUP */
extern T0* GE_new220(T1 initialize);
/* New instance of type ARRAY [INTEGER_32] */
extern T0* GE_new225(T1 initialize);
/* New instance of type UC_UTF8_ROUTINES */
extern T0* GE_new226(T1 initialize);
/* New instance of type UC_UTF8_STRING */
extern T0* GE_new227(T1 initialize);
/* New instance of type XM_EIFFEL_INPUT_STREAM */
extern T0* GE_new228(T1 initialize);
/* New instance of type KL_INTEGER_ROUTINES */
extern T0* GE_new229(T1 initialize);
/* New instance of type KL_PLATFORM */
extern T0* GE_new230(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE] */
extern T0* GE_new231(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
extern T0* GE_new232(T1 initialize);
/* New instance of type DS_PAIR [XM_POSITION, XM_NODE] */
extern T0* GE_new233(T1 initialize);
/* New instance of type HEXADECIMAL_STRING_TO_INTEGER_CONVERTER */
extern T0* GE_new234(T1 initialize);
/* New instance of type INTEGER_OVERFLOW_CHECKER */
extern T0* GE_new235(T1 initialize);
/* New instance of type detachable DS_LINKABLE [XM_ELEMENT] */
extern T0* GE_new236(T1 initialize);
/* New instance of type GEANT_PARENT_ELEMENT */
extern T0* GE_new237(T1 initialize);
/* New instance of type ARRAY [GEANT_TARGET] */
extern T0* GE_new239(T1 initialize);
/* New instance of type XM_EIFFEL_CHARACTER_ENTITY */
extern T0* GE_new240(T1 initialize);
/* New instance of type YY_BUFFER */
extern T0* GE_new241(T1 initialize);
/* New instance of type YY_FILE_BUFFER */
extern T0* GE_new242(T1 initialize);
/* New instance of type DS_LINKED_STACK [INTEGER_32] */
extern T0* GE_new245(T1 initialize);
/* New instance of type detachable DS_BILINKABLE [XM_POSITION] */
extern T0* GE_new246(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [XM_POSITION] */
extern T0* GE_new247(T1 initialize);
/* New instance of type detachable DS_LINKABLE [XM_EIFFEL_SCANNER] */
extern T0* GE_new248(T1 initialize);
/* New instance of type SPECIAL [XM_EIFFEL_ENTITY_DEF] */
extern T0* GE_new249(T6 a1, T1 initialize);
/* New instance of type detachable DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
extern T0* GE_new252(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
extern T0* GE_new253(T1 initialize);
/* New instance of type ARRAY [detachable ANY] */
extern T0* GE_new254(T1 initialize);
/* New instance of type ARRAY [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new255(T1 initialize);
/* New instance of type ARRAY [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
extern T0* GE_new256(T1 initialize);
/* New instance of type detachable KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new257(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new258(T1 initialize);
/* New instance of type ARRAY [XM_DTD_EXTERNAL_ID] */
extern T0* GE_new259(T1 initialize);
/* New instance of type ARRAY [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new260(T1 initialize);
/* New instance of type DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new261(T1 initialize);
/* New instance of type ARRAY [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
extern T0* GE_new262(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new263(T1 initialize);
/* New instance of type detachable DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new264(T1 initialize);
/* New instance of type ARRAY [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new265(T1 initialize);
/* New instance of type DS_LINKED_LIST [STRING_8] */
extern T0* GE_new266(T1 initialize);
/* New instance of type ARRAY [DS_BILINKED_LIST [STRING_8]] */
extern T0* GE_new267(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [STRING_8] */
extern T0* GE_new268(T1 initialize);
/* New instance of type detachable DS_BILINKABLE [STRING_8] */
extern T0* GE_new269(T1 initialize);
/* New instance of type ARRAY [BOOLEAN] */
extern T0* GE_new270(T1 initialize);
/* New instance of type ARRAY [XM_EIFFEL_DECLARATION] */
extern T0* GE_new271(T1 initialize);
/* New instance of type XM_NAMESPACE_RESOLVER_CONTEXT */
extern T0* GE_new272(T1 initialize);
/* New instance of type DS_LINKED_QUEUE [STRING_8] */
extern T0* GE_new274(T1 initialize);
/* New instance of type detachable KL_EQUALITY_TESTER [XM_NAMESPACE] */
extern T0* GE_new275(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [XM_NAMESPACE] */
extern T0* GE_new276(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
extern T0* GE_new277(T1 initialize);
/* New instance of type SPECIAL [XM_NAMESPACE] */
extern T0* GE_new278(T6 a1, T1 initialize);
/* New instance of type detachable DS_LINKABLE [XM_DOCUMENT_NODE] */
extern T0* GE_new279(T1 initialize);
/* New instance of type ARRAY [GEANT_ARGUMENT_VARIABLES] */
extern T0* GE_new283(T1 initialize);
/* New instance of type ARRAY [GEANT_VARIABLES] */
extern T0* GE_new284(T1 initialize);
/* New instance of type GEANT_STRING_INTERPRETER */
extern T0* GE_new285(T1 initialize);
/* New instance of type XM_COMMENT */
extern T0* GE_new289(T1 initialize);
/* New instance of type XM_PROCESSING_INSTRUCTION */
extern T0* GE_new290(T1 initialize);
/* New instance of type XM_CHARACTER_DATA */
extern T0* GE_new291(T1 initialize);
/* New instance of type KL_ARRAY_ROUTINES [INTEGER_32] */
extern T0* GE_new292(T1 initialize);
/* New instance of type detachable DS_LINKABLE [XM_ELEMENT_NODE] */
extern T0* GE_new294(T1 initialize);
/* New instance of type detachable DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
extern T0* GE_new295(T1 initialize);
/* New instance of type DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
extern T0* GE_new296(T1 initialize);
/* New instance of type GEANT_GEC_TASK */
extern T0* GE_new297(T1 initialize);
/* New instance of type [attached] TUPLE [XM_ELEMENT] */
extern T0* GE_new298(T1 initialize);
/* New instance of type detachable TUPLE */
extern T0* GE_new299(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEC_TASK] */
extern T0* GE_new300(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_TASK_FACTORY] */
extern T0* GE_new301(T1 initialize);
/* New instance of type GEANT_ISE_TASK */
extern T0* GE_new304(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_ISE_TASK] */
extern T0* GE_new305(T1 initialize);
/* New instance of type GEANT_EXEC_TASK */
extern T0* GE_new306(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_EXEC_TASK] */
extern T0* GE_new307(T1 initialize);
/* New instance of type GEANT_LCC_TASK */
extern T0* GE_new308(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_LCC_TASK] */
extern T0* GE_new309(T1 initialize);
/* New instance of type GEANT_SET_TASK */
extern T0* GE_new310(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_SET_TASK] */
extern T0* GE_new311(T1 initialize);
/* New instance of type GEANT_UNSET_TASK */
extern T0* GE_new312(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_UNSET_TASK] */
extern T0* GE_new313(T1 initialize);
/* New instance of type GEANT_GEXACE_TASK */
extern T0* GE_new314(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEXACE_TASK] */
extern T0* GE_new315(T1 initialize);
/* New instance of type GEANT_GELEX_TASK */
extern T0* GE_new316(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GELEX_TASK] */
extern T0* GE_new317(T1 initialize);
/* New instance of type GEANT_GEYACC_TASK */
extern T0* GE_new318(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEYACC_TASK] */
extern T0* GE_new319(T1 initialize);
/* New instance of type GEANT_GEPP_TASK */
extern T0* GE_new320(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEPP_TASK] */
extern T0* GE_new321(T1 initialize);
/* New instance of type GEANT_GETEST_TASK */
extern T0* GE_new322(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GETEST_TASK] */
extern T0* GE_new323(T1 initialize);
/* New instance of type GEANT_GEANT_TASK */
extern T0* GE_new324(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEANT_TASK] */
extern T0* GE_new325(T1 initialize);
/* New instance of type GEANT_ECHO_TASK */
extern T0* GE_new326(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_ECHO_TASK] */
extern T0* GE_new327(T1 initialize);
/* New instance of type GEANT_MKDIR_TASK */
extern T0* GE_new328(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_MKDIR_TASK] */
extern T0* GE_new329(T1 initialize);
/* New instance of type GEANT_DELETE_TASK */
extern T0* GE_new330(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_DELETE_TASK] */
extern T0* GE_new331(T1 initialize);
/* New instance of type GEANT_COPY_TASK */
extern T0* GE_new332(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_COPY_TASK] */
extern T0* GE_new333(T1 initialize);
/* New instance of type GEANT_MOVE_TASK */
extern T0* GE_new334(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_MOVE_TASK] */
extern T0* GE_new335(T1 initialize);
/* New instance of type GEANT_SETENV_TASK */
extern T0* GE_new336(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_SETENV_TASK] */
extern T0* GE_new337(T1 initialize);
/* New instance of type GEANT_XSLT_TASK */
extern T0* GE_new338(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_XSLT_TASK] */
extern T0* GE_new339(T1 initialize);
/* New instance of type GEANT_OUTOFDATE_TASK */
extern T0* GE_new340(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_OUTOFDATE_TASK] */
extern T0* GE_new341(T1 initialize);
/* New instance of type GEANT_EXIT_TASK */
extern T0* GE_new342(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_EXIT_TASK] */
extern T0* GE_new343(T1 initialize);
/* New instance of type GEANT_PRECURSOR_TASK */
extern T0* GE_new344(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_PRECURSOR_TASK] */
extern T0* GE_new345(T1 initialize);
/* New instance of type GEANT_AVAILABLE_TASK */
extern T0* GE_new346(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_AVAILABLE_TASK] */
extern T0* GE_new347(T1 initialize);
/* New instance of type GEANT_INPUT_TASK */
extern T0* GE_new348(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_INPUT_TASK] */
extern T0* GE_new349(T1 initialize);
/* New instance of type GEANT_REPLACE_TASK */
extern T0* GE_new350(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_REPLACE_TASK] */
extern T0* GE_new351(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_PARENT] */
extern T0* GE_new352(T1 initialize);
/* New instance of type SPECIAL [GEANT_PARENT] */
extern T0* GE_new353(T6 a1, T1 initialize);
/* New instance of type UC_UNICODE_ROUTINES */
extern T0* GE_new355(T1 initialize);
/* New instance of type DS_LINKED_QUEUE [CHARACTER_8] */
extern T0* GE_new357(T1 initialize);
/* New instance of type UC_UTF16_ROUTINES */
extern T0* GE_new358(T1 initialize);
/* New instance of type SPECIAL [NATURAL_64] */
extern T0* GE_new359(T6 a1, T1 initialize);
/* New instance of type GEANT_RENAME_ELEMENT */
extern T0* GE_new360(T1 initialize);
/* New instance of type GEANT_REDEFINE_ELEMENT */
extern T0* GE_new361(T1 initialize);
/* New instance of type GEANT_SELECT_ELEMENT */
extern T0* GE_new362(T1 initialize);
/* New instance of type GEANT_RENAME */
extern T0* GE_new363(T1 initialize);
/* New instance of type DS_HASH_TABLE [GEANT_RENAME, STRING_8] */
extern T0* GE_new364(T1 initialize);
/* New instance of type GEANT_REDEFINE */
extern T0* GE_new365(T1 initialize);
/* New instance of type DS_HASH_TABLE [GEANT_REDEFINE, STRING_8] */
extern T0* GE_new366(T1 initialize);
/* New instance of type GEANT_SELECT */
extern T0* GE_new367(T1 initialize);
/* New instance of type DS_HASH_TABLE [GEANT_SELECT, STRING_8] */
extern T0* GE_new368(T1 initialize);
/* New instance of type detachable DS_LINKABLE [INTEGER_32] */
extern T0* GE_new369(T1 initialize);
/* New instance of type ARRAY [XM_EIFFEL_ENTITY_DEF] */
extern T0* GE_new370(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new371(T1 initialize);
/* New instance of type attached DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new372(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [STRING_8] */
extern T0* GE_new373(T1 initialize);
/* New instance of type DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
extern T0* GE_new375(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
extern T0* GE_new376(T1 initialize);
/* New instance of type detachable DS_LINKABLE [STRING_8] */
extern T0* GE_new377(T1 initialize);
/* New instance of type ARRAY [XM_NAMESPACE] */
extern T0* GE_new378(T1 initialize);
/* New instance of type GEANT_NAME_VALUE_ELEMENT */
extern T0* GE_new379(T1 initialize);
/* New instance of type KL_ARRAY_ROUTINES [detachable STRING_8] */
extern T0* GE_new380(T1 initialize);
/* New instance of type AP_OPTION_COMPARATOR */
extern T0* GE_new381(T1 initialize);
/* New instance of type DS_QUICK_SORTER [AP_OPTION] */
extern T0* GE_new382(T1 initialize);
/* New instance of type ST_WORD_WRAPPER */
extern T0* GE_new384(T1 initialize);
/* New instance of type KL_CHARACTER_BUFFER */
extern T0* GE_new387(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
extern T0* GE_new390(T1 initialize);
/* New instance of type SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
extern T0* GE_new391(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
extern T0* GE_new392(T1 initialize);
/* New instance of type GEANT_GEC_COMMAND */
extern T0* GE_new393(T1 initialize);
/* New instance of type DS_CELL [PROCEDURE [ANY, TUPLE]] */
extern T0* GE_new394(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_GEC_TASK, [attached] TUPLE] */
extern T0* GE_new395(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GEC_TASK] */
extern T0* GE_new396(T1 initialize);
/* New instance of type GEANT_ISE_COMMAND */
extern T0* GE_new397(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_ISE_TASK, [attached] TUPLE] */
extern T0* GE_new398(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_ISE_TASK] */
extern T0* GE_new399(T1 initialize);
/* New instance of type GEANT_FILESET_ELEMENT */
extern T0* GE_new400(T1 initialize);
/* New instance of type GEANT_EXEC_COMMAND */
extern T0* GE_new401(T1 initialize);
/* New instance of type GEANT_STRING_PROPERTY */
extern T0* GE_new402(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_INTERPRETING_ELEMENT, [attached] TUPLE, STRING_8] */
extern T0* GE_new403(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_INTERPRETING_ELEMENT, STRING_8] */
extern T0* GE_new404(T1 initialize);
/* New instance of type GEANT_BOOLEAN_PROPERTY */
extern T0* GE_new405(T1 initialize);
/* New instance of type GEANT_FILESET */
extern T0* GE_new406(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_EXEC_TASK, [attached] TUPLE] */
extern T0* GE_new407(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_EXEC_TASK] */
extern T0* GE_new408(T1 initialize);
/* New instance of type GEANT_LCC_COMMAND */
extern T0* GE_new409(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_LCC_TASK, [attached] TUPLE] */
extern T0* GE_new410(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_LCC_TASK] */
extern T0* GE_new411(T1 initialize);
/* New instance of type GEANT_SET_COMMAND */
extern T0* GE_new412(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_SET_TASK, [attached] TUPLE] */
extern T0* GE_new413(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_SET_TASK] */
extern T0* GE_new414(T1 initialize);
/* New instance of type GEANT_UNSET_COMMAND */
extern T0* GE_new415(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_UNSET_TASK, [attached] TUPLE] */
extern T0* GE_new416(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_UNSET_TASK] */
extern T0* GE_new417(T1 initialize);
/* New instance of type GEANT_DEFINE_ELEMENT */
extern T0* GE_new418(T1 initialize);
/* New instance of type GEANT_GEXACE_COMMAND */
extern T0* GE_new419(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_GEXACE_TASK, [attached] TUPLE] */
extern T0* GE_new420(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GEXACE_TASK] */
extern T0* GE_new421(T1 initialize);
/* New instance of type GEANT_GELEX_COMMAND */
extern T0* GE_new422(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_GELEX_TASK, [attached] TUPLE] */
extern T0* GE_new423(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GELEX_TASK] */
extern T0* GE_new424(T1 initialize);
/* New instance of type GEANT_GEYACC_COMMAND */
extern T0* GE_new425(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_GEYACC_TASK, [attached] TUPLE] */
extern T0* GE_new426(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GEYACC_TASK] */
extern T0* GE_new427(T1 initialize);
/* New instance of type GEANT_GEPP_COMMAND */
extern T0* GE_new428(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_GEPP_TASK, [attached] TUPLE] */
extern T0* GE_new429(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GEPP_TASK] */
extern T0* GE_new430(T1 initialize);
/* New instance of type GEANT_GETEST_COMMAND */
extern T0* GE_new431(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_GETEST_TASK, [attached] TUPLE] */
extern T0* GE_new432(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GETEST_TASK] */
extern T0* GE_new433(T1 initialize);
/* New instance of type GEANT_GEANT_COMMAND */
extern T0* GE_new434(T1 initialize);
/* New instance of type ST_SPLITTER */
extern T0* GE_new435(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_GEANT_TASK, [attached] TUPLE] */
extern T0* GE_new436(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GEANT_TASK] */
extern T0* GE_new437(T1 initialize);
/* New instance of type GEANT_ECHO_COMMAND */
extern T0* GE_new438(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_ECHO_TASK, [attached] TUPLE] */
extern T0* GE_new439(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_ECHO_TASK] */
extern T0* GE_new440(T1 initialize);
/* New instance of type GEANT_MKDIR_COMMAND */
extern T0* GE_new441(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_MKDIR_TASK, [attached] TUPLE] */
extern T0* GE_new442(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_MKDIR_TASK] */
extern T0* GE_new443(T1 initialize);
/* New instance of type GEANT_DIRECTORYSET_ELEMENT */
extern T0* GE_new444(T1 initialize);
/* New instance of type GEANT_DELETE_COMMAND */
extern T0* GE_new445(T1 initialize);
/* New instance of type GEANT_DIRECTORYSET */
extern T0* GE_new446(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_DELETE_TASK, [attached] TUPLE] */
extern T0* GE_new447(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_DELETE_TASK] */
extern T0* GE_new448(T1 initialize);
/* New instance of type GEANT_COPY_COMMAND */
extern T0* GE_new449(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_COPY_TASK, [attached] TUPLE] */
extern T0* GE_new450(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_COPY_TASK] */
extern T0* GE_new451(T1 initialize);
/* New instance of type GEANT_MOVE_COMMAND */
extern T0* GE_new452(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_MOVE_TASK, [attached] TUPLE] */
extern T0* GE_new453(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_MOVE_TASK] */
extern T0* GE_new454(T1 initialize);
/* New instance of type GEANT_SETENV_COMMAND */
extern T0* GE_new455(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_SETENV_TASK, [attached] TUPLE] */
extern T0* GE_new456(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_SETENV_TASK] */
extern T0* GE_new457(T1 initialize);
/* New instance of type DS_PAIR [STRING_8, STRING_8] */
extern T0* GE_new458(T1 initialize);
/* New instance of type GEANT_XSLT_COMMAND */
extern T0* GE_new459(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]] */
extern T0* GE_new460(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_XSLT_TASK, [attached] TUPLE] */
extern T0* GE_new461(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_XSLT_TASK] */
extern T0* GE_new462(T1 initialize);
/* New instance of type GEANT_OUTOFDATE_COMMAND */
extern T0* GE_new463(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_OUTOFDATE_TASK, [attached] TUPLE] */
extern T0* GE_new464(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_OUTOFDATE_TASK] */
extern T0* GE_new465(T1 initialize);
/* New instance of type GEANT_EXIT_COMMAND */
extern T0* GE_new466(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_EXIT_TASK, [attached] TUPLE] */
extern T0* GE_new467(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_EXIT_TASK] */
extern T0* GE_new468(T1 initialize);
/* New instance of type GEANT_PRECURSOR_COMMAND */
extern T0* GE_new469(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_PRECURSOR_TASK, [attached] TUPLE] */
extern T0* GE_new470(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_PRECURSOR_TASK] */
extern T0* GE_new471(T1 initialize);
/* New instance of type GEANT_AVAILABLE_COMMAND */
extern T0* GE_new472(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_AVAILABLE_TASK, [attached] TUPLE] */
extern T0* GE_new473(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_AVAILABLE_TASK] */
extern T0* GE_new474(T1 initialize);
/* New instance of type GEANT_INPUT_COMMAND */
extern T0* GE_new475(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_INPUT_TASK, [attached] TUPLE] */
extern T0* GE_new476(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_INPUT_TASK] */
extern T0* GE_new477(T1 initialize);
/* New instance of type GEANT_REPLACE_COMMAND */
extern T0* GE_new478(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_REPLACE_TASK, [attached] TUPLE] */
extern T0* GE_new479(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_REPLACE_TASK] */
extern T0* GE_new480(T1 initialize);
/* New instance of type ARRAY [GEANT_PARENT] */
extern T0* GE_new481(T1 initialize);
/* New instance of type SPECIAL [ARRAY [INTEGER_32]] */
extern T0* GE_new482(T6 a1, T1 initialize);
/* New instance of type SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
extern T0* GE_new483(T6 a1, T1 initialize);
/* New instance of type detachable DS_LINKABLE [CHARACTER_8] */
extern T0* GE_new484(T1 initialize);
/* New instance of type detachable KL_EQUALITY_TESTER [GEANT_RENAME] */
extern T0* GE_new485(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_RENAME] */
extern T0* GE_new487(T1 initialize);
/* New instance of type SPECIAL [GEANT_RENAME] */
extern T0* GE_new488(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8] */
extern T0* GE_new489(T1 initialize);
/* New instance of type detachable KL_EQUALITY_TESTER [GEANT_REDEFINE] */
extern T0* GE_new490(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_REDEFINE] */
extern T0* GE_new492(T1 initialize);
/* New instance of type SPECIAL [GEANT_REDEFINE] */
extern T0* GE_new493(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8] */
extern T0* GE_new494(T1 initialize);
/* New instance of type detachable KL_EQUALITY_TESTER [GEANT_SELECT] */
extern T0* GE_new495(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_SELECT] */
extern T0* GE_new497(T1 initialize);
/* New instance of type SPECIAL [GEANT_SELECT] */
extern T0* GE_new498(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8] */
extern T0* GE_new499(T1 initialize);
/* New instance of type detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
extern T0* GE_new500(T1 initialize);
/* New instance of type KL_DIRECTORY */
extern T0* GE_new501(T1 initialize);
/* New instance of type KL_STRING_INPUT_STREAM */
extern T0* GE_new502(T1 initialize);
/* New instance of type KL_ARRAY [detachable STRING_8] */
extern T0* GE_new504(T1 initialize);
/* New instance of type ARRAY [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
extern T0* GE_new505(T1 initialize);
/* New instance of type GEANT_MAP_ELEMENT */
extern T0* GE_new508(T1 initialize);
/* New instance of type GEANT_MAP */
extern T0* GE_new509(T1 initialize);
/* New instance of type DS_HASH_SET [GEANT_FILESET_ENTRY] */
extern T0* GE_new512(T1 initialize);
/* New instance of type DS_HASH_SET [STRING_8] */
extern T0* GE_new514(T1 initialize);
/* New instance of type LX_DFA_WILDCARD */
extern T0* GE_new516(T1 initialize);
/* New instance of type DS_HASH_SET [INTEGER_32] */
extern T0* GE_new518(T1 initialize);
/* New instance of type DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8]]] */
extern T0* GE_new519(T1 initialize);
/* New instance of type [attached] TUPLE [STRING_8] */
extern T0* GE_new520(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_ECHO_COMMAND, [attached] TUPLE [STRING_8]] */
extern T0* GE_new521(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_ECHO_COMMAND] */
extern T0* GE_new522(T1 initialize);
/* New instance of type DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]]] */
extern T0* GE_new524(T1 initialize);
/* New instance of type KL_TEXT_OUTPUT_FILE */
extern T0* GE_new525(T1 initialize);
/* New instance of type [attached] TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN] */
extern T0* GE_new526(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_ECHO_COMMAND, [attached] TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]] */
extern T0* GE_new527(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_MKDIR_COMMAND, [attached] TUPLE [STRING_8]] */
extern T0* GE_new529(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_MKDIR_COMMAND] */
extern T0* GE_new530(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]] */
extern T0* GE_new531(T1 initialize);
/* New instance of type SPECIAL [DS_PAIR [STRING_8, STRING_8]] */
extern T0* GE_new532(T6 a1, T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING_8, STRING_8]] */
extern T0* GE_new533(T1 initialize);
/* New instance of type DS_CELL [FUNCTION [ANY, TUPLE [STRING_8], BOOLEAN]] */
extern T0* GE_new534(T1 initialize);
/* New instance of type [attached] PREDICATE [GEANT_AVAILABLE_COMMAND, [attached] TUPLE [STRING_8]] */
extern T0* GE_new535(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_AVAILABLE_COMMAND] */
extern T0* GE_new536(T1 initialize);
/* New instance of type ARRAY [GEANT_RENAME] */
extern T0* GE_new538(T1 initialize);
/* New instance of type ARRAY [GEANT_REDEFINE] */
extern T0* GE_new539(T1 initialize);
/* New instance of type ARRAY [GEANT_SELECT] */
extern T0* GE_new540(T1 initialize);
/* New instance of type detachable KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY] */
extern T0* GE_new544(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY] */
extern T0* GE_new545(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY] */
extern T0* GE_new546(T1 initialize);
/* New instance of type GEANT_FILESET_ENTRY */
extern T0* GE_new547(T1 initialize);
/* New instance of type SPECIAL [GEANT_FILESET_ENTRY] */
extern T0* GE_new548(T6 a1, T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [STRING_8] */
extern T0* GE_new549(T1 initialize);
/* New instance of type LX_WILDCARD_PARSER */
extern T0* GE_new550(T1 initialize);
/* New instance of type LX_DESCRIPTION */
extern T0* GE_new551(T1 initialize);
/* New instance of type LX_FULL_DFA */
extern T0* GE_new552(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [INTEGER_32] */
extern T0* GE_new554(T1 initialize);
/* New instance of type detachable KL_EQUALITY_TESTER [INTEGER_32] */
extern T0* GE_new555(T1 initialize);
/* New instance of type ARRAY [DS_PAIR [STRING_8, STRING_8]] */
extern T0* GE_new556(T1 initialize);
/* New instance of type KL_NULL_TEXT_OUTPUT_STREAM */
extern T0* GE_new557(T1 initialize);
/* New instance of type DP_SHELL_COMMAND */
extern T0* GE_new558(T1 initialize);
/* New instance of type DS_CELL [BOOLEAN] */
extern T0* GE_new559(T1 initialize);
/* New instance of type KL_BOOLEAN_ROUTINES */
extern T0* GE_new561(T1 initialize);
/* New instance of type GEANT_VARIABLES_VARIABLE_RESOLVER */
extern T0* GE_new562(T1 initialize);
/* New instance of type RX_PCRE_REGULAR_EXPRESSION */
extern T0* GE_new563(T1 initialize);
/* New instance of type KL_STRING_EQUALITY_TESTER */
extern T0* GE_new564(T1 initialize);
/* New instance of type KL_STDIN_FILE */
extern T0* GE_new565(T1 initialize);
/* New instance of type ARRAY [GEANT_FILESET_ENTRY] */
extern T0* GE_new569(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [LX_RULE] */
extern T0* GE_new570(T1 initialize);
/* New instance of type LX_START_CONDITIONS */
extern T0* GE_new571(T1 initialize);
/* New instance of type LX_ACTION_FACTORY */
extern T0* GE_new572(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [INTEGER_32] */
extern T0* GE_new573(T1 initialize);
/* New instance of type LX_SYMBOL_CLASS */
extern T0* GE_new574(T1 initialize);
/* New instance of type DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8] */
extern T0* GE_new575(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS] */
extern T0* GE_new576(T1 initialize);
/* New instance of type SPECIAL [LX_SYMBOL_CLASS] */
extern T0* GE_new577(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_NFA] */
extern T0* GE_new578(T1 initialize);
/* New instance of type LX_NFA */
extern T0* GE_new579(T1 initialize);
/* New instance of type SPECIAL [LX_NFA] */
extern T0* GE_new580(T6 a1, T1 initialize);
/* New instance of type LX_EQUIVALENCE_CLASSES */
extern T0* GE_new581(T1 initialize);
/* New instance of type LX_RULE */
extern T0* GE_new582(T1 initialize);
/* New instance of type UT_SYNTAX_ERROR */
extern T0* GE_new583(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
extern T0* GE_new584(T1 initialize);
/* New instance of type LX_UNRECOGNIZED_RULE_ERROR */
extern T0* GE_new585(T1 initialize);
/* New instance of type LX_MISSING_QUOTE_ERROR */
extern T0* GE_new586(T1 initialize);
/* New instance of type LX_BAD_CHARACTER_CLASS_ERROR */
extern T0* GE_new587(T1 initialize);
/* New instance of type LX_BAD_CHARACTER_ERROR */
extern T0* GE_new588(T1 initialize);
/* New instance of type LX_FULL_AND_META_ERROR */
extern T0* GE_new589(T1 initialize);
/* New instance of type LX_FULL_AND_REJECT_ERROR */
extern T0* GE_new590(T1 initialize);
/* New instance of type LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR */
extern T0* GE_new591(T1 initialize);
/* New instance of type LX_CHARACTER_OUT_OF_RANGE_ERROR */
extern T0* GE_new592(T1 initialize);
/* New instance of type SPECIAL [LX_RULE] */
extern T0* GE_new593(T6 a1, T1 initialize);
/* New instance of type ARRAY [LX_RULE] */
extern T0* GE_new594(T1 initialize);
/* New instance of type LX_DFA_STATE */
extern T0* GE_new595(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [LX_NFA_STATE] */
extern T0* GE_new596(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [LX_DFA_STATE] */
extern T0* GE_new597(T1 initialize);
/* New instance of type LX_SYMBOL_PARTITIONS */
extern T0* GE_new598(T1 initialize);
/* New instance of type KL_ARRAY_ROUTINES [LX_RULE] */
extern T0* GE_new599(T1 initialize);
/* New instance of type LX_START_CONDITION */
extern T0* GE_new600(T1 initialize);
/* New instance of type LX_TRANSITION_TABLE [LX_DFA_STATE] */
extern T0* GE_new601(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [LX_NFA] */
extern T0* GE_new602(T1 initialize);
/* New instance of type DS_HASH_TABLE [LX_NFA, INTEGER_32] */
extern T0* GE_new603(T1 initialize);
/* New instance of type LX_NFA_STATE */
extern T0* GE_new604(T1 initialize);
/* New instance of type LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR */
extern T0* GE_new606(T1 initialize);
/* New instance of type RX_BYTE_CODE */
extern T0* GE_new608(T1 initialize);
/* New instance of type RX_CHARACTER_SET */
extern T0* GE_new609(T1 initialize);
/* New instance of type RX_CASE_MAPPING */
extern T0* GE_new610(T1 initialize);
/* New instance of type SPECIAL [RX_CHARACTER_SET] */
extern T0* GE_new612(T6 a1, T1 initialize);
/* New instance of type ARRAY [RX_CHARACTER_SET] */
extern T0* GE_new613(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_RULE] */
extern T0* GE_new614(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_RULE] */
extern T0* GE_new615(T1 initialize);
/* New instance of type SPECIAL [LX_START_CONDITION] */
extern T0* GE_new616(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_START_CONDITION] */
extern T0* GE_new617(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION] */
extern T0* GE_new618(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
extern T0* GE_new619(T1 initialize);
/* New instance of type ARRAY [LX_SYMBOL_CLASS] */
extern T0* GE_new622(T1 initialize);
/* New instance of type ARRAY [LX_NFA] */
extern T0* GE_new623(T1 initialize);
/* New instance of type LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE] */
extern T0* GE_new624(T1 initialize);
/* New instance of type LX_EPSILON_TRANSITION [LX_NFA_STATE] */
extern T0* GE_new626(T1 initialize);
/* New instance of type LX_SYMBOL_TRANSITION [LX_NFA_STATE] */
extern T0* GE_new628(T1 initialize);
/* New instance of type DS_BILINKABLE [INTEGER_32] */
extern T0* GE_new629(T1 initialize);
/* New instance of type SPECIAL [DS_BILINKABLE [INTEGER_32]] */
extern T0* GE_new630(T6 a1, T1 initialize);
/* New instance of type ARRAY [DS_BILINKABLE [INTEGER_32]] */
extern T0* GE_new631(T1 initialize);
/* New instance of type LX_ACTION */
extern T0* GE_new633(T1 initialize);
/* New instance of type DS_BUBBLE_SORTER [LX_NFA_STATE] */
extern T0* GE_new634(T1 initialize);
/* New instance of type DS_BUBBLE_SORTER [LX_RULE] */
extern T0* GE_new636(T1 initialize);
/* New instance of type SPECIAL [LX_NFA_STATE] */
extern T0* GE_new638(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_NFA_STATE] */
extern T0* GE_new640(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE] */
extern T0* GE_new641(T1 initialize);
/* New instance of type SPECIAL [LX_DFA_STATE] */
extern T0* GE_new643(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_DFA_STATE] */
extern T0* GE_new644(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE] */
extern T0* GE_new645(T1 initialize);
/* New instance of type KL_ARRAY [LX_RULE] */
extern T0* GE_new646(T1 initialize);
/* New instance of type ARRAY [detachable LX_DFA_STATE] */
extern T0* GE_new647(T1 initialize);
/* New instance of type KL_ARRAY_ROUTINES [detachable LX_DFA_STATE] */
extern T0* GE_new648(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_NFA] */
extern T0* GE_new649(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32] */
extern T0* GE_new651(T1 initialize);
/* New instance of type KL_BINARY_INPUT_FILE */
extern T0* GE_new652(T1 initialize);
/* New instance of type KL_BINARY_OUTPUT_FILE */
extern T0* GE_new653(T1 initialize);
/* New instance of type PATH */
extern T0* GE_new659(T1 initialize);
/* New instance of type RAW_FILE */
extern T0* GE_new660(T1 initialize);
/* New instance of type DIRECTORY */
extern T0* GE_new661(T1 initialize);
/* New instance of type ARRAYED_LIST [READABLE_STRING_32] */
extern T0* GE_new662(T1 initialize);
/* New instance of type [attached] TUPLE [ARRAYED_LIST [READABLE_STRING_32]] */
extern T0* GE_new663(T1 initialize);
/* New instance of type KL_COMPARABLE_COMPARATOR [LX_RULE] */
extern T0* GE_new666(T1 initialize);
/* New instance of type KL_COMPARABLE_COMPARATOR [LX_NFA_STATE] */
extern T0* GE_new669(T1 initialize);
/* New instance of type ARRAY [LX_START_CONDITION] */
extern T0* GE_new672(T1 initialize);
/* New instance of type ARRAY [LX_NFA_STATE] */
extern T0* GE_new673(T1 initialize);
/* New instance of type STRING_8_SEARCHER */
extern T0* GE_new674(T1 initialize);
/* New instance of type HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32] */
extern T0* GE_new675(T1 initialize);
/* New instance of type DS_SHELL_SORTER [INTEGER_32] */
extern T0* GE_new676(T1 initialize);
/* New instance of type ARRAYED_LIST [READABLE_STRING_GENERAL] */
extern T0* GE_new678(T1 initialize);
/* New instance of type [attached] TUPLE [ARRAYED_LIST [READABLE_STRING_GENERAL]] */
extern T0* GE_new679(T1 initialize);
/* New instance of type SPECIAL [READABLE_STRING_32] */
extern T0* GE_new680(T6 a1, T1 initialize);
/* New instance of type KL_COMPARABLE_COMPARATOR [INTEGER_32] */
extern T0* GE_new681(T1 initialize);
/* New instance of type PRIMES */
extern T0* GE_new684(T1 initialize);
/* New instance of type SPECIAL [NATIVE_STRING] */
extern T0* GE_new685(T6 a1, T1 initialize);
/* New instance of type SPECIAL [READABLE_STRING_GENERAL] */
extern T0* GE_new686(T6 a1, T1 initialize);
/* GEANT.make */
extern T0* T21c20(void);
/* GEANT_PROJECT.build */
extern void T22f35(T0* C, T0* a1);
/* GEANT_PROJECT.build_target */
extern void T22f46(T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].remove */
extern void T108f10(T0* C);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].keep_head */
extern void T202f8(T0* C, T6 a1);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].set_count */
extern void T202f10(T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].remove */
extern void T209f11(T0* C);
/* SPECIAL [GEANT_TARGET].keep_head */
extern void T131f8(T0* C, T6 a1);
/* SPECIAL [GEANT_TARGET].set_count */
extern void T131f10(T0* C, T6 a1);
/* GEANT_PROJECT.execute_target */
extern void T22f49(T0* C, T0* a1, T0* a2, T1 a3, T1 a4);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].remove */
extern void T109f10(T0* C);
/* SPECIAL [GEANT_VARIABLES].keep_head */
extern void T204f8(T0* C, T6 a1);
/* SPECIAL [GEANT_VARIABLES].set_count */
extern void T204f10(T0* C, T6 a1);
/* GEANT_TARGET.execute */
extern void T26f75(T0* C);
/* GEANT_TARGET.set_executed */
extern void T26f79(T0* C, T1 a1);
/* GEANT_TARGET.execute */
extern void T26f75p1(T0* C);
/* GEANT_TARGET.has_attribute */
extern T1 T26f28(T0* C, T0* a1);
/* GEANT_TARGET.execute_nested_tasks */
extern void T26f81(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].forth */
extern void T196f13(T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].cursor_forth */
extern void T199f16(T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].add_traversing_cursor */
extern void T199f19(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].set_next_cursor */
extern void T196f17(T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].remove_traversing_cursor */
extern void T199f20(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].set */
extern void T196f15(T0* C, T0* a1, T1 a2, T1 a3);
/* GEANT_TARGET.execute_element */
extern void T26f83(T0* C, T0* a1);
/* GEANT_TARGET.obsolete_element_name */
extern unsigned char ge12os2508;
extern T0* ge12ov2508;
extern T0* T26f17(T0* C);
/* GEANT_TARGET.argument_element_name */
extern unsigned char ge12os2509;
extern T0* ge12ov2509;
extern T0* T26f15(T0* C);
/* GEANT_TARGET.description_element_name */
extern unsigned char ge78os2558;
extern T0* ge78ov2558;
extern T0* T26f22(T0* C);
/* GEANT_TARGET.execute_task */
extern void T26f84(T0* C, T0* a1);
/* GEANT_PROJECT.new_task */
extern T0* T22f25(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_task */
extern T0* T210f54(T0* C, T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].item */
extern T0* T296f30(T0* C, T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].item_storage_item */
extern T0* T296f32(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].search_position */
extern void T296f55(T0* C, T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].hash_position */
extern T6 T296f34(T0* C, T0* a1);
/* UC_UTF8_STRING.hash_code */
extern T6 T227f18(T0* C);
/* UC_UTF8_STRING.string */
extern T0* T227f8(T0* C);
/* KL_INTEGER_ROUTINES.to_character */
extern T2 T229f2(T0* C, T6 a1);
/* UC_UTF8_STRING.integer_ */
extern unsigned char ge126os5546;
extern T0* ge126ov5546;
extern T0* T227f27(T0* C);
/* KL_INTEGER_ROUTINES.default_create */
extern T0* T229c4(void);
/* STRING_8.append_character */
extern void T17f39(T0* C, T2 a1);
/* STRING_8.resize */
extern void T17f41(T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].aliased_resized_area_with_default */
extern T0* T15f3(T0* C, T2 a1, T6 a2);
/* SPECIAL [CHARACTER_8].fill_with */
extern void T15f14(T0* C, T2 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].extend */
extern void T15f18(T0* C, T2 a1);
/* INTEGER_32.min */
extern T6 T6f10(T6* C, T6 a1);
/* SPECIAL [CHARACTER_8].aliased_resized_area */
extern T0* T15f4(T0* C, T6 a1);
/* STRING_8.additional_space */
extern T6 T17f6(T0* C);
/* INTEGER_32.max */
extern T6 T6f11(T6* C, T6 a1);
/* INTEGER_32.is_greater_equal */
extern T1 T6f6(T6* C, T6 a1);
/* STRING_8.capacity */
extern T6 T17f5(T0* C);
/* UC_UTF8_STRING.byte_item */
extern T2 T227f24(T0* C, T6 a1);
/* UC_UTF8_STRING.old_item */
extern T2 T227f37(T0* C, T6 a1);
/* UC_UTF8_STRING.set_count */
extern void T227f67(T0* C, T6 a1);
/* UC_UTF8_STRING.reset_byte_index_cache */
extern void T227f75(T0* C);
/* STRING_8.make */
extern void T17f38(T0* C, T6 a1);
/* STRING_8.make */
extern T0* T17c38(T6 a1);
/* SPECIAL [CHARACTER_8].make_filled */
extern T0* T15c11(T2 a1, T6 a2);
/* SPECIAL [CHARACTER_8].make_empty */
extern void T15f15(T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].make_empty */
extern T0* T15c15(T6 a1);
/* UC_UTF8_STRING.next_byte_index */
extern T6 T227f28(T0* C, T6 a1);
/* UC_UTF8_ROUTINES.encoded_byte_count */
extern T6 T226f3(T0* C, T2 a1);
/* CHARACTER_8.is_less_equal */
extern T1 T2f20(T2* C, T2 a1);
/* CHARACTER_8.is_less */
extern T1 T2f7(T2* C, T2 a1);
/* CHARACTER_8.natural_32_code */
extern T10 T2f3(T2* C);
/* INTEGER_32.to_natural_32 */
extern T10 T6f13(T6* C);
/* UC_UTF8_STRING.utf8 */
extern unsigned char ge220os6364;
extern T0* ge220ov6364;
extern T0* T227f29(T0* C);
/* UC_UTF8_ROUTINES.default_create */
extern T0* T226c36(void);
/* KL_PLATFORM.maximum_character_code */
extern unsigned char ge201os8554;
extern T6 ge201ov8554;
extern T6 T230f1(T0* C);
/* UC_UTF8_STRING.platform */
extern unsigned char ge208os4367;
extern T0* ge208ov4367;
extern T0* T227f26(T0* C);
/* KL_PLATFORM.default_create */
extern T0* T230c3(void);
/* UC_UTF8_STRING.item_code_at_byte_index */
extern T6 T227f25(T0* C, T6 a1);
/* UC_UTF8_ROUTINES.encoded_next_value */
extern T6 T226f6(T0* C, T2 a1);
/* UC_UTF8_ROUTINES.encoded_first_value */
extern T6 T226f4(T0* C, T2 a1);
/* UC_UTF8_STRING.hash_code */
extern T6 T227f18p1(T0* C);
/* STRING_8.hash_code */
extern T6 T17f8(T0* C);
/* UC_STRING_EQUALITY_TESTER.test */
extern T1 T59f1(T0* C, T0* a1, T0* a2);
/* UC_STRING_EQUALITY_TESTER.string_ */
extern unsigned char ge128os1922;
extern T0* ge128ov1922;
extern T0* T59f2(T0* C);
/* KL_STRING_ROUTINES.default_create */
extern T0* T75c19(void);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].key_storage_item */
extern T0* T296f31(T0* C, T6 a1);
/* INTEGER_32.is_less_equal */
extern T1 T6f5(T6* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].clashes_item */
extern T6 T296f33(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].slots_item */
extern T6 T296f21(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].has */
extern T1 T296f29(T0* C, T0* a1);
/* XM_ELEMENT.set_name */
extern void T102f30(T0* C, T0* a1);
/* GEANT_TARGET.set_attribute_name */
extern unsigned char ge12os2511;
extern T0* ge12ov2511;
extern T0* T26f55(T0* C);
/* XM_ELEMENT.cloned_object */
extern T0* T102f20(T0* C);
/* XM_ELEMENT.twin */
extern T0* T102f22(T0* C);
/* XM_ELEMENT.copy */
extern void T102f31(T0* C, T0* a1);
/* GEANT_NAME_VALUE_ELEMENT.has_value */
extern T1 T379f4(T0* C);
/* GEANT_NAME_VALUE_ELEMENT.has_attribute */
extern T1 T379f3(T0* C, T0* a1);
/* GEANT_NAME_VALUE_ELEMENT.value_attribute_name */
extern unsigned char ge90os8298;
extern T0* ge90ov8298;
extern T0* T379f2(T0* C);
/* GEANT_NAME_VALUE_ELEMENT.make */
extern T0* T379c5(T0* a1);
/* GEANT_NAME_VALUE_ELEMENT.set_xml_element */
extern void T379f6(T0* C, T0* a1);
/* GEANT_TARGET.global_element_name */
extern unsigned char ge4os2531;
extern T0* ge4ov2531;
extern T0* T26f21(T0* C);
/* GEANT_TARGET.local_element_name */
extern unsigned char ge4os2532;
extern T0* ge4ov2532;
extern T0* T26f19(T0* C);
/* GEANT_TARGET.execute_group_element */
extern void T26f82(T0* C, T0* a1);
/* GEANT_GROUP.execute */
extern void T220f26(T0* C);
/* GEANT_GROUP.has_attribute */
extern T1 T220f18(T0* C, T0* a1);
/* GEANT_GROUP.execute_nested_tasks */
extern void T220f32(T0* C);
/* GEANT_GROUP.execute_element */
extern void T220f37(T0* C, T0* a1);
/* GEANT_GROUP.execute_task */
extern void T220f38(T0* C, T0* a1);
/* GEANT_GROUP.description_element_name */
extern T0* T220f13(T0* C);
/* GEANT_GROUP.global_element_name */
extern T0* T220f20(T0* C);
/* GEANT_GROUP.local_element_name */
extern T0* T220f19(T0* C);
/* GEANT_GROUP.execute_group_element */
extern void T220f36(T0* C, T0* a1);
/* GEANT_GROUP.group_element_name */
extern unsigned char ge4os2530;
extern T0* ge4ov2530;
extern T0* T220f17(T0* C);
/* GEANT_GROUP.string_ */
extern T0* T220f16(T0* C);
/* GEANT_GROUP.prepare_variables_before_execution */
extern void T220f31(T0* C);
/* GEANT_GROUP.exit_application */
extern void T220f30(T0* C, T6 a1, T0* a2);
/* KL_EXCEPTIONS.die */
extern void T48f2(T0* C, T6 a1);
/* GEANT_GROUP.exceptions */
extern unsigned char ge204os1924;
extern T0* ge204ov1924;
extern T0* T220f15(T0* C);
/* KL_EXCEPTIONS.default_create */
extern T0* T48c1(void);
/* KL_STDERR_FILE.put_line */
extern void T47f16(T0* C, T0* a1);
/* KL_STDERR_FILE.put_string */
extern void T47f17(T0* C, T0* a1);
/* KL_STDERR_FILE.old_put_string */
extern void T47f19(T0* C, T0* a1);
/* KL_STDERR_FILE.console_ps */
extern void T47f22(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STRING_ROUTINES.as_string */
extern T0* T75f2(T0* C, T0* a1);
/* STRING_8.string */
extern T0* T17f15(T0* C);
/* STRING_8.make_from_string */
extern T0* T17c46(T0* a1);
/* SPECIAL [CHARACTER_8].copy_data */
extern void T15f13(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [CHARACTER_8].force */
extern void T15f17(T0* C, T2 a1, T6 a2);
/* SPECIAL [CHARACTER_8].move_data */
extern void T15f16(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].overlapping_move */
extern void T15f20(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].non_overlapping_move */
extern void T15f19(T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.area_lower */
extern T6 T17f7(T0* C);
/* UC_UTF8_STRING.as_string */
extern T0* T227f7(T0* C);
/* UC_UTF8_STRING.to_utf8 */
extern T0* T227f22(T0* C);
/* KL_ANY_ROUTINES.same_types */
extern T1 T88f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.any_ */
extern unsigned char ge121os2181;
extern T0* ge121ov2181;
extern T0* T75f8(T0* C);
/* KL_ANY_ROUTINES.default_create */
extern T0* T88c2(void);
/* KL_STDERR_FILE.string_ */
extern T0* T47f11(T0* C);
/* KL_STDERR_FILE.put_new_line */
extern void T47f15(T0* C);
/* KL_STANDARD_FILES.error */
extern unsigned char ge168os3046;
extern T0* ge168ov3046;
extern T0* T46f1(T0* C);
/* KL_STDERR_FILE.make */
extern T0* T47c13(void);
/* KL_STDERR_FILE.make_open_stderr */
extern void T47f18(T0* C, T0* a1);
/* KL_STDERR_FILE.set_write_mode */
extern void T47f21(T0* C);
/* KL_STDERR_FILE.console_def */
extern T14 T47f10(T0* C, T6 a1);
/* KL_STDERR_FILE.make_with_name */
extern void T47f20(T0* C, T0* a1);
/* STRING_8.make_empty */
extern T0* T17c37(void);
/* KL_STDERR_FILE.default_pointer */
extern T14 T47f7(T0* C);
/* KL_STDERR_FILE.set_name */
extern void T47f23(T0* C, T0* a1);
/* FILE_INFO.file_name_to_pointer */
extern T0* T79f6(T0* C, T0* a1, T0* a2);
extern T1 T79f6ot1(T0* a1);
extern T1 T79f6ot2(T0* a1);
/* C_STRING.set_string */
extern void T119f9(T0* C, T0* a1);
/* C_STRING.set_substring */
extern void T119f11(T0* C, T0* a1, T6 a2, T6 a3);
/* MANAGED_POINTER.put_natural_8 */
extern void T78f14(T0* C, T8 a1, T6 a2);
/* POINTER.memory_copy */
extern void T14f16(T14* C, T14 a1, T6 a2);
/* POINTER.c_memcpy */
extern void T14f17(T14* C, T14 a1, T14 a2, T6 a3);
/* NATURAL_32.to_natural_8 */
extern T8 T10f9(T10* C);
/* C_STRING.make_shared_from_pointer_and_count */
extern void T119f8(T0* C, T14 a1, T6 a2);
/* C_STRING.make_shared_from_pointer_and_count */
extern T0* T119c8(T14 a1, T6 a2);
/* MANAGED_POINTER.share_from_pointer */
extern T0* T78c15(T14 a1, T6 a2);
/* MANAGED_POINTER.increment_counter */
extern void T78f12(T0* C);
/* UTF_CONVERTER.escaped_utf_32_substring_into_utf_8_0_pointer */
extern void T118f12(T118* C, T0* a1, T6 a2, T6 a3, T0* a4, T6 a5, T0* a6);
/* detachable CELL [INTEGER_32].put */
extern void T121f2(T0* C, T6 a1);
/* detachable CELL [INTEGER_32].put */
extern T0* T121c2(T6 a1);
/* NATURAL_32.is_less_equal */
extern T1 T10f3(T10* C, T10 a1);
/* UTF_CONVERTER.to_natural_32 */
extern T10 T118f4(T118* C, T0* a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.parsed_natural_32 */
extern T10 T234f12(T0* C);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.parse_string_with_type */
extern void T234f19(T0* C, T0* a1, T6 a2);
extern T1 T234f19ot1(T0* a1, T0** a2);
extern T1 T234f19ot2(T0* a1, T0** a2);
/* NATURAL_32.is_valid_character_8_code */
extern T1 T10f14(T10* C);
/* CHARACTER_32.is_character_8 */
extern T1 T3f3(T3* C);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.parse_character */
extern void T234f22(T0* C, T2 a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.overflowed */
extern T1 T234f16(T0* C);
/* INTEGER_OVERFLOW_CHECKER.will_overflow */
extern T1 T235f7(T0* C, T11 a1, T11 a2, T6 a3, T6 a4);
/* NATURAL_64.is_greater */
extern T1 T11f7(T11* C, T11 a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.overflow_checker */
extern unsigned char ge1489os8630;
extern T0* ge1489ov8630;
extern T0* T234f15(T0* C);
/* INTEGER_OVERFLOW_CHECKER.make */
extern T0* T235c13(void);
/* NATURAL_64.to_natural_64 */
extern T11 T11f10(T11* C);
/* NATURAL_32.to_natural_64 */
extern T11 T10f22(T10* C);
/* NATURAL_16.to_natural_64 */
extern T11 T9f7(T9* C);
/* NATURAL_8.to_natural_64 */
extern T11 T8f14(T8* C);
/* INTEGER_64.to_natural_64 */
extern T11 T7f3(T7* C);
/* INTEGER_16.to_natural_64 */
extern T11 T5f3(T5* C);
/* INTEGER_8.to_natural_64 */
extern T11 T4f3(T4* C);
/* SPECIAL [NATURAL_64].extend */
extern void T359f5(T0* C, T11 a1);
/* SPECIAL [NATURAL_64].make_empty */
extern T0* T359c4(T6 a1);
/* STRING_8.has */
extern T1 T17f29(T0* C, T2 a1);
/* INTEGER_32.to_natural_64 */
extern T11 T6f20(T6* C);
/* CHARACTER_8.is_greater_equal */
extern T1 T2f6(T2* C, T2 a1);
/* CHARACTER_8.is_hexa_digit */
extern T1 T2f21(T2* C);
/* NATURAL_8.is_greater */
extern T1 T8f3(T8* C, T8 a1);
/* CHARACTER_8.character_types */
extern T8 T2f10(T2* C, T6 a1);
/* CHARACTER_8.internal_character_types */
extern unsigned char ge1415os93;
extern T0* ge1415ov93;
extern T0* T2f12(T2* C);
/* SPECIAL [NATURAL_8].fill_with */
extern void T122f6(T0* C, T8 a1, T6 a2, T6 a3);
/* SPECIAL [NATURAL_8].extend */
extern void T122f8(T0* C, T8 a1);
/* SPECIAL [NATURAL_8].make_empty */
extern void T122f5(T0* C, T6 a1);
/* SPECIAL [NATURAL_8].make_empty */
extern T0* T122c5(T6 a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.reset */
extern void T234f18(T0* C, T6 a1);
/* UTF_CONVERTER.ctoi_convertor */
extern unsigned char ge1487os7026;
extern T0* ge1487ov7026;
extern T0* T118f6(T118* C);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.set_trailing_separators_acceptable */
extern void T234f21(T0* C, T1 a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.set_leading_separators_acceptable */
extern void T234f20(T0* C, T1 a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.make */
extern T0* T234c17(void);
/* UTF_CONVERTER.is_hexa_decimal */
extern T1 T118f3(T118* C, T0* a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.is_integral_integer */
extern T1 T234f14(T0* C);
/* UTF_CONVERTER.utf_8_bytes_count */
extern T6 T118f5(T118* C, T0* a1, T6 a2, T6 a3);
/* FILE_INFO.multi_byte_to_utf_16 */
extern T6 T79f13(T0* C, T14 a1, T14 a2, T6 a3);
/* FILE_INFO.default_pointer */
extern T14 T79f12(T0* C);
/* C_STRING.item */
extern T14 T119f3(T0* C);
/* C_STRING.make */
extern T0* T119c7(T0* a1);
/* C_STRING.make_empty */
extern void T119f10(T0* C, T6 a1);
/* C_STRING.make_empty */
extern T0* T119c10(T6 a1);
/* UTF_CONVERTER.escaped_utf_32_substring_into_utf_16_0_pointer */
extern void T118f11(T118* C, T0* a1, T6 a2, T6 a3, T0* a4, T6 a5, T0* a6);
/* MANAGED_POINTER.put_natural_16 */
extern void T78f13(T0* C, T9 a1, T6 a2);
/* NATURAL_32.to_natural_16 */
extern T9 T10f5(T10* C);
/* UTF_CONVERTER.utf_16_bytes_count */
extern T6 T118f1(T118* C, T0* a1, T6 a2, T6 a3);
/* MANAGED_POINTER.resize */
extern void T78f11(T0* C, T6 a1);
/* POINTER.memory_set */
extern void T14f12(T14* C, T6 a1, T6 a2);
/* POINTER.c_memset */
extern void T14f15(T14* C, T14 a1, T6 a2, T6 a3);
/* EXCEPTIONS.raise */
extern void T136f3(T0* C, T0* a1);
/* EXCEPTIONS.eraise */
extern void T136f4(T0* C, T14 a1, T6 a2);
/* STRING_8.to_c */
extern T0* T17f30(T0* C);
/* EXCEPTIONS.default_create */
extern T0* T136c2(void);
/* MANAGED_POINTER.default_pointer */
extern T14 T78f4(T0* C);
/* POINTER.memory_realloc */
extern T14 T14f2(T14* C, T6 a1);
/* POINTER.c_realloc */
extern T14 T14f7(T14* C, T14 a1, T6 a2);
/* MANAGED_POINTER.make */
extern T0* T78c9(T6 a1);
/* POINTER.memory_calloc */
extern T14 T14f1(T14* C, T6 a1, T6 a2);
/* POINTER.c_calloc */
extern T14 T14f5(T14* C, T6 a1, T6 a2);
/* PLATFORM.is_windows */
extern T1 T120s1(void);
/* KL_STDERR_FILE.buffered_file_info */
extern unsigned char ge1425os3351;
extern T0* ge1425ov3351;
extern T0* T47f12(T0* C);
/* FILE_INFO.make */
extern T0* T79c22(void);
/* FILE_INFO.make_filled_area */
extern void T79f24(T0* C, T8 a1, T6 a2);
/* SPECIAL [NATURAL_8].make_filled */
extern T0* T122c4(T8 a1, T6 a2);
/* FILE_INFO.stat_size */
extern T6 T79f9(T0* C);
/* GEANT_GROUP.std */
extern unsigned char ge166os1925;
extern T0* ge166ov1925;
extern T0* T220f14(T0* C);
/* KL_STANDARD_FILES.default_create */
extern T0* T46c3(void);
/* GEANT_GROUP.log_messages */
extern void T220f35(T0* C, T0* a1);
/* ARRAY [STRING_8].item */
extern T0* T33f4(T0* C, T6 a1);
/* GEANT_GROUP.associated_target */
extern T0* T220f12(T0* C);
/* GEANT_GROUP.file_system */
extern unsigned char ge165os1926;
extern T0* ge165ov1926;
extern T0* T220f11(T0* C);
/* GEANT_GROUP.unix_file_system */
extern unsigned char ge165os1929;
extern T0* ge165ov1929;
extern T0* T220f23(T0* C);
/* KL_UNIX_FILE_SYSTEM.make */
extern T0* T54c33(void);
/* KL_OPERATING_SYSTEM.is_unix */
extern unsigned char ge199os3079;
extern T1 ge199ov3079;
extern T1 T51f2(T0* C);
/* STRING_8.item */
extern T2 T17f10(T0* C, T6 a1);
/* KL_OPERATING_SYSTEM.current_working_directory */
extern T0* T51f4(T0* C);
/* EXECUTION_ENVIRONMENT.current_working_directory */
extern T0* T87f2(T0* C);
/* FILE_INFO.pointer_to_file_name_8 */
extern T0* T79f15(T0* C, T14 a1);
/* C_STRING.string */
extern T0* T119f5(T0* C);
/* C_STRING.c_strlen */
extern T6 T119f6(T0* C, T14 a1);
/* C_STRING.make_shared_from_pointer */
extern T0* T119c12(T14 a1);
/* C_STRING.substring */
extern T0* T119f4(T0* C, T6 a1, T6 a2);
/* C_STRING.read_substring_into */
extern void T119f13(T0* C, T0* a1, T6 a2, T6 a3);
/* STRING_8.put_code */
extern void T17f45(T0* C, T10 a1, T6 a2);
/* NATURAL_8.to_natural_32 */
extern T10 T8f1(T8* C);
/* MANAGED_POINTER.read_natural_8 */
extern T8 T78f7(T0* C, T6 a1);
/* TYPED_POINTER [NATURAL_8].memory_copy */
extern void T224f2(T224* C, T14 a1, T6 a2);
/* TYPED_POINTER [NATURAL_8].c_memcpy */
extern void T224f3(T224* C, T14 a1, T14 a2, T6 a3);
/* STRING_8.set_count */
extern void T17f44(T0* C, T6 a1);
/* FILE_INFO.utf_16_to_multi_byte */
extern T6 T79f16(T0* C, T14 a1, T14 a2, T6 a3);
/* EXECUTION_ENVIRONMENT.file_info */
extern unsigned char ge1627os5839;
extern T0* ge1627ov5839;
extern T0* T87f5(T0* C);
/* EXECUTION_ENVIRONMENT.eif_dir_current */
extern T6 T87f4(T0* C, T14 a1, T6 a2);
/* KL_OPERATING_SYSTEM.execution_environment */
extern unsigned char ge199os3083;
extern T0* ge199ov3083;
extern T0* T51f5(T0* C);
/* EXECUTION_ENVIRONMENT.default_create */
extern T0* T87c11(void);
/* STRING_8.is_equal */
extern T1 T17f31(T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].same_items */
extern T1 T15f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* KL_OPERATING_SYSTEM.variable_value */
extern T0* T51f3(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.get */
extern T0* T87f7(T0* C, T0* a1);
/* STRING_32.as_string_8 */
extern T0* T18f4(T0* C);
/* STRING_8.valid_code */
extern T1 T17f24(T0* C, T10 a1);
/* EXECUTION_ENVIRONMENT.item */
extern T0* T87f3(T0* C, T0* a1);
/* NATIVE_STRING.string */
extern T0* T139f3(T0* C);
/* UTF_CONVERTER.utf_8_0_pointer_to_escaped_string_32 */
extern T0* T118f8(T118* C, T0* a1);
/* UTF_CONVERTER.utf_8_0_pointer_into_escaped_string_32 */
extern void T118f14(T118* C, T0* a1, T0* a2);
/* UTF_CONVERTER.utf_8_0_subpointer_into_escaped_string_32 */
extern void T118f16(T118* C, T0* a1, T6 a2, T6 a3, T1 a4, T0* a5);
/* UTF_CONVERTER.escape_code_into */
extern void T118f17(T118* C, T0* a1, T9 a2);
/* NATURAL_16.to_hex_string */
extern T0* T9f4(T9* C);
/* STRING_8.put */
extern void T17f53(T0* C, T2 a1, T6 a2);
/* INTEGER_32.to_hex_character */
extern T2 T6f24(T6* C);
/* NATURAL_16.to_integer_32 */
extern T6 T9f12(T9* C);
/* STRING_8.fill_blank */
extern void T17f56(T0* C);
/* STRING_8.fill_character */
extern void T17f57(T0* C, T2 a1);
/* PLATFORM.default_create */
extern T0* T120c3(void);
/* STRING_32.append_string_general */
extern void T18f17(T0* C, T0* a1);
/* STRING_32.append */
extern void T18f17p1(T0* C, T0* a1);
/* STRING_32.set_count */
extern void T18f21(T0* C, T6 a1);
/* STRING_32.append_code */
extern void T18f20(T0* C, T10 a1);
/* STRING_32.put_code */
extern void T18f22(T0* C, T10 a1, T6 a2);
/* STRING_32.resize */
extern void T18f18(T0* C, T6 a1);
/* SPECIAL [CHARACTER_32].aliased_resized_area_with_default */
extern T0* T16f4(T0* C, T3 a1, T6 a2);
/* SPECIAL [CHARACTER_32].fill_with */
extern void T16f12(T0* C, T3 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_32].extend */
extern void T16f16(T0* C, T3 a1);
/* SPECIAL [CHARACTER_32].aliased_resized_area */
extern T0* T16f5(T0* C, T6 a1);
/* STRING_32.capacity */
extern T6 T18f7(T0* C);
/* STRING_32.append */
extern void T18f19(T0* C, T0* a1);
/* SPECIAL [CHARACTER_32].copy_data */
extern void T16f8(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [CHARACTER_32].force */
extern void T16f11(T0* C, T3 a1, T6 a2);
/* SPECIAL [CHARACTER_32].move_data */
extern void T16f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_32].overlapping_move */
extern void T16f14(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_32].non_overlapping_move */
extern void T16f13(T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_32.additional_space */
extern T6 T18f8(T0* C);
/* NATURAL_8.to_hex_string */
extern T0* T8f12(T8* C);
/* NATURAL_8.to_integer_32 */
extern T6 T8f7(T8* C);
/* NATURAL_16.is_less_equal */
extern T1 T9f2(T9* C, T9 a1);
/* STRING_32.append_character */
extern void T18f16(T0* C, T3 a1);
/* NATURAL_8.to_natural_16 */
extern T9 T8f10(T8* C);
/* STRING_32.extend */
extern void T18f15(T0* C, T3 a1);
/* NATURAL_8.is_less_equal */
extern T1 T8f8(T8* C, T8 a1);
/* STRING_32.grow */
extern void T18f14(T0* C, T6 a1);
/* STRING_32.make */
extern void T18f13(T0* C, T6 a1);
/* STRING_32.make */
extern T0* T18c13(T6 a1);
/* SPECIAL [CHARACTER_32].make_filled */
extern T0* T16c9(T3 a1, T6 a2);
/* SPECIAL [CHARACTER_32].make_empty */
extern void T16f7(T0* C, T6 a1);
/* SPECIAL [CHARACTER_32].make_empty */
extern T0* T16c7(T6 a1);
/* UTF_CONVERTER.utf_16_0_pointer_to_escaped_string_32 */
extern T0* T118f7(T118* C, T0* a1);
/* UTF_CONVERTER.utf_16_0_pointer_into_escaped_string_32 */
extern void T118f13(T118* C, T0* a1, T0* a2);
/* UTF_CONVERTER.utf_16_0_subpointer_into_escaped_string_32 */
extern void T118f15(T118* C, T0* a1, T6 a2, T6 a3, T1 a4, T0* a5);
/* NATURAL_32.is_greater_equal */
extern T1 T10f16(T10* C, T10 a1);
/* NATURAL_16.to_natural_32 */
extern T10 T9f1(T9* C);
/* MANAGED_POINTER.read_natural_16 */
extern T9 T78f8(T0* C, T6 a1);
/* TYPED_POINTER [NATURAL_16].memory_copy */
extern void T223f2(T223* C, T14 a1, T6 a2);
/* TYPED_POINTER [NATURAL_16].c_memcpy */
extern void T223f3(T223* C, T14 a1, T14 a2, T6 a3);
/* NATIVE_STRING.make_from_pointer */
extern T0* T139c12(T14 a1);
/* MANAGED_POINTER.make_from_pointer */
extern T0* T78c16(T14 a1, T6 a2);
/* POINTER.memory_alloc */
extern T14 T14f9(T14* C, T6 a1);
/* POINTER.c_malloc */
extern T14 T14f10(T14* C, T6 a1);
/* NATIVE_STRING.unit_size */
extern T6 T139f4(T0* C);
/* NATIVE_STRING.pointer_length_in_bytes */
extern T6 T139f6(T0* C, T14 a1);
/* NATURAL_64.to_integer_32 */
extern T6 T11f5(T11* C);
/* NATURAL_64.is_less_equal */
extern T1 T11f4(T11* C, T11 a1);
/* NATIVE_STRING.c_pointer_length_in_bytes */
extern T11 T139f8(T0* C, T14 a1);
/* EXECUTION_ENVIRONMENT.eif_getenv */
extern T14 T87f6(T0* C, T14 a1);
/* NATIVE_STRING.item */
extern T14 T139f5(T0* C);
/* NATIVE_STRING.make */
extern T0* T139c11(T0* a1);
/* NATIVE_STRING.set_string */
extern void T139f14(T0* C, T0* a1);
/* NATIVE_STRING.set_substring */
extern void T139f15(T0* C, T0* a1, T6 a2, T6 a3);
/* NATIVE_STRING.upper_cell */
extern unsigned char ge1493os7181;
extern T0* ge1493ov7181;
extern T0* T139f7(T0* C);
/* NATIVE_STRING.make_empty */
extern void T139f9(T0* C, T6 a1);
/* NATIVE_STRING.make_empty */
extern T0* T139c9(T6 a1);
/* GEANT_GROUP.windows_file_system */
extern unsigned char ge165os1927;
extern T0* ge165ov1927;
extern T0* T220f22(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.make */
extern T0* T53c36(void);
/* KL_OPERATING_SYSTEM.is_windows */
extern unsigned char ge199os3078;
extern T1 ge199ov3078;
extern T1 T51f1(T0* C);
/* GEANT_GROUP.operating_system */
extern unsigned char ge207os1930;
extern T0* ge207ov1930;
extern T0* T220f21(T0* C);
/* KL_OPERATING_SYSTEM.default_create */
extern T0* T51c6(void);
/* GEANT_GROUP.project_variables_resolver */
extern unsigned char ge10os1912;
extern T0* ge10ov1912;
extern T0* T220f6(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.make */
extern T0* T58c18(void);
/* GEANT_GROUP.dir_attribute_name */
extern unsigned char ge86os2540;
extern T0* ge86ov2540;
extern T0* T220f10(T0* C);
/* GEANT_GROUP.is_enabled */
extern T1 T220f8(T0* C);
/* GEANT_GROUP.unless_attribute_name */
extern unsigned char ge86os2542;
extern T0* ge86ov2542;
extern T0* T220f7(T0* C);
/* BOOLEAN.out */
extern T0* T1f6(T1* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.boolean_condition_value */
extern T1 T58f8(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.exit_application */
extern void T58f20(T0* C, T6 a1, T0* a2);
/* GEANT_PROJECT_VARIABLE_RESOLVER.exceptions */
extern T0* T58f17(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.std */
extern T0* T58f16(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.log_messages */
extern void T58f21(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.has */
extern T1 T58f6(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.variable_value */
extern T0* T107f1(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.string_ */
extern T0* T107f3(T0* C);
/* KL_EXECUTION_ENVIRONMENT.environment_impl */
extern unsigned char ge192os6771;
extern T0* ge192ov6771;
extern T0* T107f2(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.execution_environment */
extern unsigned char ge205os1923;
extern T0* ge205ov1923;
extern T0* T58f7(T0* C);
/* KL_EXECUTION_ENVIRONMENT.default_create */
extern T0* T107c4(void);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].item */
extern T0* T109f5(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.target_locals_stack */
extern unsigned char ge10os1915;
extern T0* ge10ov1915;
extern T0* T58f5(T0* C);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].make */
extern T0* T109c8(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES].make */
extern T0* T205f1(T0* C, T6 a1);
/* SPECIAL [GEANT_VARIABLES].aliased_resized_area */
extern T0* T204f4(T0* C, T6 a1);
/* ARRAY [GEANT_VARIABLES].make_empty */
extern T0* T284c5(void);
/* ARRAY [GEANT_VARIABLES].make_empty_area */
extern void T284f6(T0* C, T6 a1);
/* SPECIAL [GEANT_VARIABLES].make_empty */
extern void T204f5(T0* C, T6 a1);
/* SPECIAL [GEANT_VARIABLES].make_empty */
extern T0* T204c5(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES].default_create */
extern T0* T205c3(void);
/* GEANT_PROJECT_VARIABLE_RESOLVER.commandline_variables */
extern unsigned char ge10os1905;
extern T0* ge10ov1905;
extern T0* T58f4(T0* C);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].item */
extern T0* T108f5(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.target_arguments_stack */
extern unsigned char ge10os1914;
extern T0* ge10ov1914;
extern T0* T58f3(T0* C);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].make */
extern T0* T108c8(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].make */
extern T0* T203f1(T0* C, T6 a1);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].aliased_resized_area */
extern T0* T202f4(T0* C, T6 a1);
/* ARRAY [GEANT_ARGUMENT_VARIABLES].make_empty */
extern T0* T283c4(void);
/* ARRAY [GEANT_ARGUMENT_VARIABLES].make_empty_area */
extern void T283f5(T0* C, T6 a1);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].make_empty */
extern T0* T202c5(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].default_create */
extern T0* T203c3(void);
/* UC_UTF8_STRING.item */
extern T2 T227f13(T0* C, T6 a1);
/* UC_UTF8_STRING.character_item_at_byte_index */
extern T2 T227f31(T0* C, T6 a1);
/* UC_UTF8_STRING.byte_index */
extern T6 T227f30(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.true_attribute_value */
extern unsigned char ge9os4946;
extern T0* ge9ov4946;
extern T0* T58f11(T0* C);
/* KL_STRING_ROUTINES.same_case_insensitive */
extern T1 T75f11(T0* C, T0* a1, T0* a2);
/* CHARACTER_8.lower */
extern T2 T2f22(T2* C);
/* CHARACTER_8.is_upper */
extern T1 T2f23(T2* C);
/* UC_UNICODE_ROUTINES.lower_code */
extern T6 T355f4(T0* C, T6 a1);
/* ARRAY [INTEGER_32].item */
extern T6 T225f4(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.lower_codes */
extern unsigned char ge236os9479;
extern T0* ge236ov9479;
extern T0* T355f9(T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_plane */
extern unsigned char ge236os9478;
extern T0* ge236ov9478;
extern T0* T355f12(T0* C);
/* SPECIAL [ARRAY [INTEGER_32]].make_filled */
extern T0* T482c4(T0* a1, T6 a2);
/* SPECIAL [ARRAY [INTEGER_32]].fill_with */
extern void T482f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ARRAY [INTEGER_32]].extend */
extern void T482f8(T0* C, T0* a1);
/* SPECIAL [ARRAY [INTEGER_32]].make_empty */
extern void T482f6(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.empty_lower_code_segment */
extern unsigned char ge236os9465;
extern T0* ge236ov9465;
extern T0* T355f19(T0* C);
/* KL_INTEGER_ROUTINES.to_integer */
extern T6 T229f3(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.integer_ */
extern T0* T355f30(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_1 */
extern unsigned char ge236os9477;
extern T0* ge236ov9477;
extern T0* T355f11(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_1_segment_4 */
extern unsigned char ge236os9476;
extern T0* ge236ov9476;
extern T0* T355f29(T0* C);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].make_filled */
extern T0* T483c4(T0* a1, T6 a2);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].fill_with */
extern void T483f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].extend */
extern void T483f8(T0* C, T0* a1);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].make_empty */
extern void T483f6(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.lower_code_plane_0 */
extern unsigned char ge236os9475;
extern T0* ge236ov9475;
extern T0* T355f10(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_255 */
extern unsigned char ge236os9474;
extern T0* ge236ov9474;
extern T0* T355f28(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_167 */
extern unsigned char ge236os9473;
extern T0* ge236ov9473;
extern T0* T355f27(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_166 */
extern unsigned char ge236os9472;
extern T0* ge236ov9472;
extern T0* T355f26(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_44 */
extern unsigned char ge236os9471;
extern T0* ge236ov9471;
extern T0* T355f25(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_36 */
extern unsigned char ge236os9470;
extern T0* ge236ov9470;
extern T0* T355f24(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_33 */
extern unsigned char ge236os9469;
extern T0* ge236ov9469;
extern T0* T355f23(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_31 */
extern unsigned char ge236os9468;
extern T0* ge236ov9468;
extern T0* T355f22(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_30 */
extern unsigned char ge236os9467;
extern T0* ge236ov9467;
extern T0* T355f21(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_16 */
extern unsigned char ge236os9466;
extern T0* ge236ov9466;
extern T0* T355f20(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_5 */
extern unsigned char ge236os9464;
extern T0* ge236ov9464;
extern T0* T355f18(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_4 */
extern unsigned char ge236os9463;
extern T0* ge236ov9463;
extern T0* T355f17(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_3 */
extern unsigned char ge236os9462;
extern T0* ge236ov9462;
extern T0* T355f16(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_2 */
extern unsigned char ge236os9461;
extern T0* ge236ov9461;
extern T0* T355f15(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_1 */
extern unsigned char ge236os9460;
extern T0* ge236ov9460;
extern T0* T355f14(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_0 */
extern unsigned char ge236os9459;
extern T0* ge236ov9459;
extern T0* T355f13(T0* C);
/* KL_STRING_ROUTINES.unicode */
extern unsigned char ge217os5547;
extern T0* ge217ov5547;
extern T0* T75f12(T0* C);
/* UC_UNICODE_ROUTINES.default_create */
extern T0* T355c31(void);
/* UC_UTF8_STRING.item_code */
extern T6 T227f17(T0* C, T6 a1);
/* STRING_8.item_code */
extern T6 T17f14(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.false_attribute_value */
extern unsigned char ge9os4947;
extern T0* ge9ov4947;
extern T0* T58f10(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.string_ */
extern T0* T58f2(T0* C);
/* DS_LINKED_LIST [STRING_8].item */
extern T0* T266f6(T0* C, T6 a1);
/* ST_SPLITTER.split_greedy */
extern T0* T435f9(T0* C, T0* a1);
/* ST_SPLITTER.do_split */
extern T0* T435f7(T0* C, T0* a1, T1 a2);
/* DS_LINKED_LIST [STRING_8].force_last */
extern void T266f12(T0* C, T0* a1);
/* detachable DS_LINKABLE [STRING_8].put_right */
extern void T377f4(T0* C, T0* a1);
/* detachable DS_LINKABLE [STRING_8].make */
extern T0* T377c3(T0* a1);
/* DS_HASH_SET [INTEGER_32].has */
extern T1 T518f25(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].search_position */
extern void T518f31(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].hash_position */
extern T6 T518f19(T0* C, T6 a1);
/* INTEGER_32.hash_code */
extern T6 T6f26(T6* C);
/* DS_HASH_SET [INTEGER_32].key_storage_item */
extern T6 T518f18(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].item_storage_item */
extern T6 T518f27(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].clashes_item */
extern T6 T518f22(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].key_equality_tester */
extern T0* T518f28(T0* C);
/* DS_HASH_SET [INTEGER_32].slots_item */
extern T6 T518f24(T0* C, T6 a1);
/* KL_STRING_ROUTINES.appended_substring */
extern T0* T75f4(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* UC_UTF8_STRING.append_character */
extern void T227f60(T0* C, T2 a1);
/* UC_UTF8_STRING.put_character_at_byte_index */
extern void T227f72(T0* C, T2 a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.put_code_at_byte_index */
extern void T227f79(T0* C, T6 a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.put_byte */
extern void T227f77(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.old_put */
extern void T227f71(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.resize_byte_storage */
extern void T227f70(T0* C, T6 a1);
/* UC_UTF8_STRING.old_set_count */
extern void T227f63(T0* C, T6 a1);
/* UC_UTF8_STRING.resize */
extern void T227f78(T0* C, T6 a1);
/* UC_UTF8_STRING.byte_capacity */
extern T6 T227f40(T0* C);
/* UC_UTF8_STRING.capacity */
extern T6 T227f40p1(T0* C);
/* UC_UTF8_ROUTINES.character_byte_count */
extern T6 T226f23(T0* C, T2 a1);
/* UC_UTF8_STRING.append_string */
extern void T227f59(T0* C, T0* a1);
/* UC_UTF8_STRING.append */
extern void T227f69(T0* C, T0* a1);
/* UC_UTF8_STRING.dummy_uc_string */
extern unsigned char ge223os6931;
extern T0* ge223ov6931;
extern T0* T227f44(T0* C);
/* UC_STRING.make_empty */
extern T0* T117c8(void);
/* UC_STRING.make */
extern void T117f9(T0* C, T6 a1);
/* UC_STRING.old_set_count */
extern void T117f12(T0* C, T6 a1);
/* UC_STRING.set_count */
extern void T117f11(T0* C, T6 a1);
/* UC_STRING.byte_capacity */
extern T6 T117f7(T0* C);
/* UC_STRING.capacity */
extern T6 T117f7p1(T0* C);
/* UC_STRING.make */
extern void T117f9p1(T0* C, T6 a1);
/* UC_STRING.reset_byte_index_cache */
extern void T117f10(T0* C);
/* UC_UTF8_STRING.append */
extern void T227f69p1(T0* C, T0* a1);
/* UC_UTF8_STRING.area_lower */
extern T6 T227f14(T0* C);
/* UC_UTF8_STRING.additional_space */
extern T6 T227f45(T0* C);
/* ISE_RUNTIME.check_assert */
extern T1 T356s1(T1 a1);
/* UC_UTF8_ROUTINES.substring_byte_count */
extern T6 T226f22(T0* C, T0* a1, T6 a2, T6 a3);
extern T1 T226f22ot1(T0* a1, T0** a2);
extern T1 T226f22ot2(T0* a1, T0** a2);
/* UC_UTF8_ROUTINES.code_byte_count */
extern T6 T226f24(T0* C, T6 a1);
/* NATURAL_32.to_integer_32 */
extern T6 T10f19(T10* C);
/* UC_UTF8_STRING.shifted_byte_index */
extern T6 T227f47(T0* C, T6 a1, T6 a2);
/* UC_UTF8_ROUTINES.dummy_uc_string */
extern unsigned char ge233os8459;
extern T0* ge233ov8459;
extern T0* T226f27(T0* C);
/* UC_UTF8_ROUTINES.any_ */
extern T0* T226f25(T0* C);
/* UC_UTF8_STRING.as_string_8 */
extern T0* T227f23(T0* C);
/* UC_UTF8_STRING.put_code */
extern void T227f64(T0* C, T10 a1, T6 a2);
/* UC_UTF8_STRING.put_item_code */
extern void T227f74(T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.move_bytes_right */
extern void T227f81(T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.move_bytes_left */
extern void T227f80(T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.valid_code */
extern T1 T227f21(T0* C, T10 a1);
/* STRING_8.as_string_8 */
extern T0* T17f12(T0* C);
/* UC_UTF8_STRING.any_ */
extern T0* T227f42(T0* C);
/* UC_UTF8_STRING.new_empty_string */
extern T0* T227f12(T0* C, T6 a1);
/* UC_UTF8_STRING.make */
extern void T227f65(T0* C, T6 a1);
/* UC_UTF8_STRING.make */
extern T0* T227c65(T6 a1);
/* UC_UTF8_STRING.make */
extern void T227f65p1(T0* C, T6 a1);
/* UC_UTF8_STRING.gobo_append_substring */
extern void T227f61(T0* C, T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.put_substring_at_byte_index */
extern void T227f73(T0* C, T0* a1, T6 a2, T6 a3, T6 a4, T6 a5);
extern T1 T227f73ot1(T0* a1, T0** a2);
extern T1 T227f73ot2(T0* a1, T0** a2);
extern T1 T227f73ot3(T0* a1, T0** a2);
/* UC_UTF8_STRING.cloned_string */
extern T0* T227f41(T0* C);
/* UC_UTF8_STRING.twin */
extern T0* T227f46(T0* C);
/* UC_UTF8_STRING.copy */
extern void T227f85(T0* C, T0* a1);
/* UC_UTF8_STRING.copy */
extern void T227f85p1(T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].resized_area */
extern T0* T15f7(T0* C, T6 a1);
/* ST_SPLITTER.string_ */
extern T0* T435f6(T0* C);
/* DS_LINKED_LIST [STRING_8].make */
extern T0* T266c10(void);
/* DS_LINKED_LIST [STRING_8].set_internal_cursor */
extern void T266f11(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].new_cursor */
extern T0* T266f9(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].make */
extern T0* T373c8(T0* a1);
/* ST_SPLITTER.make_with_separators */
extern T0* T435c10(T0* a1);
/* ST_SPLITTER.set_separators */
extern void T435f12(T0* C, T0* a1);
/* DS_HASH_SET [INTEGER_32].put */
extern void T518f30(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].slots_put */
extern void T518f40(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [INTEGER_32].clashes_put */
extern void T518f39(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [INTEGER_32].item_storage_put */
extern void T518f38(T0* C, T6 a1, T6 a2);
/* KL_SPECIAL_ROUTINES [INTEGER_32].force */
extern void T65f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].fill_with */
extern void T63f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].extend */
extern void T63f10(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].unset_found_item */
extern void T518f36(T0* C);
/* DS_HASH_SET [INTEGER_32].make */
extern T0* T518c29(T6 a1);
/* DS_HASH_SET [INTEGER_32].set_internal_cursor */
extern void T518f37(T0* C, T0* a1);
/* DS_HASH_SET [INTEGER_32].new_cursor */
extern T0* T518f20(T0* C);
/* DS_HASH_SET_CURSOR [INTEGER_32].make */
extern T0* T554c4(T0* a1);
/* DS_HASH_SET [INTEGER_32].make_slots */
extern void T518f35(T0* C, T6 a1);
/* SPECIAL [INTEGER_32].make_filled */
extern T0* T63c6(T6 a1, T6 a2);
/* SPECIAL [INTEGER_32].make_empty */
extern void T63f8(T0* C, T6 a1);
/* SPECIAL [INTEGER_32].make_empty */
extern T0* T63c8(T6 a1);
/* DS_HASH_SET [INTEGER_32].new_modulus */
extern T6 T518f23(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].make_clashes */
extern void T518f34(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].make_key_storage */
extern void T518f33(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].make_item_storage */
extern void T518f32(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].make */
extern T0* T65f2(T0* C, T6 a1);
/* SPECIAL [INTEGER_32].aliased_resized_area */
extern T0* T63f5(T0* C, T6 a1);
/* ARRAY [INTEGER_32].make_empty */
extern T0* T225c9(void);
/* ARRAY [INTEGER_32].make_empty_area */
extern void T225f11(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].default_create */
extern T0* T65c6(void);
/* GEANT_GROUP.if_attribute_name */
extern unsigned char ge86os2541;
extern T0* ge86ov2541;
extern T0* T220f9(T0* C);
/* GEANT_GROUP.set_parent */
extern void T220f25(T0* C, T0* a1);
/* GEANT_GROUP.make */
extern T0* T220c24(T0* a1, T0* a2);
/* GEANT_GROUP.initialize */
extern void T220f27(T0* C);
/* GEANT_GROUP.set_description */
extern void T220f33(T0* C, T0* a1);
/* XM_ELEMENT.text */
extern T0* T102f19(T0* C);
extern T1 T102f19ot1(T0* a1, T0** a2);
/* KL_STRING_ROUTINES.appended_string */
extern T0* T75f5(T0* C, T0* a1, T0* a2);
/* STRING_8.append_string */
extern void T17f43(T0* C, T0* a1);
/* STRING_8.append */
extern void T17f40(T0* C, T0* a1);
/* KL_STRING_ROUTINES.concat */
extern T0* T75f6(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.prefixed_string */
extern T0* T227f11(T0* C, T0* a1);
/* KL_STRING_ROUTINES.cloned_string */
extern T0* T75f7(T0* C, T0* a1);
/* STRING_8.twin */
extern T0* T17f18(T0* C);
/* STRING_8.copy */
extern void T17f47(T0* C, T0* a1);
/* XM_ELEMENT.string_ */
extern T0* T102f21(T0* C);
/* XM_ELEMENT.element_by_name */
extern T0* T102f6(T0* C, T0* a1);
extern T1 T102f6ot1(T0* a1, T0** a2);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].go_after */
extern void T196f12(T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].cursor_go_after */
extern void T199f15(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].set_after */
extern void T196f16(T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].cursor_off */
extern T1 T199f6(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].off */
extern T1 T196f9(T0* C);
/* XM_ELEMENT.named_same_name */
extern T1 T102f5(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.same_namespace */
extern T1 T102f8(T0* C, T0* a1);
/* XM_NAMESPACE.is_equal */
extern T1 T191f4(T0* C, T0* a1);
/* XM_NAMESPACE.string_ */
extern T0* T191f3(T0* C);
/* XM_ELEMENT.same_string */
extern T1 T102f7(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.string_equality_tester */
extern unsigned char ge222os2343;
extern T0* ge222ov2343;
extern T0* T102f9(T0* C);
/* UC_STRING_EQUALITY_TESTER.default_create */
extern T0* T59c3(void);
/* GEANT_GROUP.make */
extern void T220f24p1(T0* C, T0* a1, T0* a2);
/* XM_POSITION_TABLE.item */
extern T0* T104f3(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].forth */
extern void T232f11(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_forth */
extern void T201f12(T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].add_traversing_cursor */
extern void T201f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set_next_cursor */
extern void T232f14(T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].remove_traversing_cursor */
extern void T201f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set */
extern void T232f12(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].go_after */
extern void T232f10(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_go_after */
extern void T201f11(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set_after */
extern void T232f13(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_off */
extern T1 T201f6(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].off */
extern T1 T232f7(T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].item */
extern T0* T232f6(T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].start */
extern void T232f9(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_start */
extern void T201f10(T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].new_cursor */
extern T0* T201f5(T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T232c8(T0* a1);
/* XM_POSITION_TABLE.has */
extern T1 T104f2(T0* C, T0* a1);
/* GEANT_GROUP.set_project */
extern void T220f29(T0* C, T0* a1);
/* GEANT_GROUP.element_make */
extern void T220f28(T0* C, T0* a1);
/* GEANT_GROUP.set_xml_element */
extern void T220f34(T0* C, T0* a1);
/* KL_STRING_ROUTINES.same_string */
extern T1 T75f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.elks_same_string */
extern T1 T75f10(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.same_string */
extern T1 T227f16(T0* C, T0* a1);
/* UC_UTF8_STRING.substring_index */
extern T6 T227f33(T0* C, T0* a1, T6 a2);
/* STRING_8.same_string */
extern T1 T17f19(T0* C, T0* a1);
/* STRING_8.same_characters */
extern T1 T17f27(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* UC_UTF8_STRING.same_unicode_string */
extern T1 T227f15(T0* C, T0* a1);
/* UC_UTF8_STRING.unicode_substring_index */
extern T6 T227f32(T0* C, T0* a1, T6 a2);
/* GEANT_TARGET.group_element_name */
extern T0* T26f54(T0* C);
/* GEANT_TARGET.string_ */
extern T0* T26f30(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].item */
extern T0* T196f8(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].start */
extern void T196f11(T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].cursor_start */
extern void T199f14(T0* C, T0* a1);
/* XM_ELEMENT.new_cursor */
extern T0* T102f11(T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].new_cursor */
extern T0* T199f5(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].make */
extern T0* T196c10(T0* a1);
/* GEANT_TARGET.prepare_variables_before_execution */
extern void T26f80(T0* C);
/* GEANT_TARGET.prepare_variables_before_execution */
extern void T26f80p1(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].forth */
extern void T64f12(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].key */
extern T0* T64f6(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].item */
extern T0* T64f5(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].after */
extern T1 T64f4(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].start */
extern void T64f11(T0* C);
/* GEANT_VARIABLES.new_cursor */
extern T0* T29f29(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].make */
extern T0* T64c10(T0* a1);
/* GEANT_TARGET.target_locals_stack */
extern T0* T26f53(T0* C);
/* GEANT_TARGET.prepared_arguments_from_formal_arguments */
extern T0* T26f52(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.has_same_keys */
extern T1 T34f34(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.new_cursor */
extern T0* T34f29(T0* C);
/* GEANT_TARGET.named_from_numbered_arguments */
extern T0* T26f61(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.has_numbered_keys */
extern T1 T34f37(T0* C);
/* INTEGER_32.out */
extern T0* T6f14(T6* C);
/* STRING_8.append_integer */
extern void T17f51(T0* C, T6 a1);
/* GEANT_TARGET.target_arguments_stack */
extern T0* T26f51(T0* C);
/* KL_UNIX_FILE_SYSTEM.set_current_working_directory */
extern void T54f34(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.change_working_directory */
extern void T87f12(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.eif_chdir */
extern T6 T87f8(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.execution_environment */
extern unsigned char ge156os4208;
extern T0* ge156ov4208;
extern T0* T54f18(T0* C);
/* KL_UNIX_FILE_SYSTEM.string_ */
extern T0* T54f13(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.set_current_working_directory */
extern void T53f37(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.execution_environment */
extern T0* T53f20(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.string_ */
extern T0* T53f12(T0* C);
/* GEANT_TARGET.exit_application */
extern void T26f67(T0* C, T6 a1, T0* a2);
/* GEANT_TARGET.exceptions */
extern T0* T26f24(T0* C);
/* GEANT_TARGET.std */
extern T0* T26f23(T0* C);
/* GEANT_TARGET.log_messages */
extern void T26f74(T0* C, T0* a1);
/* GEANT_TARGET.associated_target */
extern T0* T26f50(T0* C);
/* KL_UNIX_FILE_SYSTEM.directory_exists */
extern T1 T54f25(T0* C, T0* a1);
/* KL_DIRECTORY.exists */
extern T1 T501f16(T0* C);
/* KL_DIRECTORY.old_exists */
extern T1 T501f19(T0* C);
/* KL_DIRECTORY.eif_dir_exists */
extern T1 T501f14(T0* C, T14 a1);
/* KL_DIRECTORY.internal_name_pointer */
extern T0* T501f12(T0* C);
/* KL_DIRECTORY.reset */
extern void T501f45(T0* C, T0* a1);
/* KL_DIRECTORY.make */
extern void T501f43(T0* C, T0* a1);
/* KL_DIRECTORY.make */
extern T0* T501c43(T0* a1);
/* KL_DIRECTORY.old_make */
extern void T501f46(T0* C, T0* a1);
/* KL_DIRECTORY.make_with_name */
extern void T501f48(T0* C, T0* a1);
/* KL_DIRECTORY.set_name */
extern void T501f50(T0* C, T0* a1);
/* KL_DIRECTORY.file_info */
extern unsigned char ge1420os9989;
extern T0* ge1420ov9989;
extern T0* T501f17(T0* C);
/* KL_DIRECTORY.string_ */
extern T0* T501f24(T0* C);
/* KL_UNIX_FILE_SYSTEM.tmp_directory */
extern unsigned char ge156os4206;
extern T0* ge156ov4206;
extern T0* T54f26(T0* C);
/* UC_UTF8_STRING.old_is_empty */
extern T1 T227f53(T0* C);
/* STRING_8.is_empty */
extern T1 T17f32(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.directory_exists */
extern T1 T53f27(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.tmp_directory */
extern T0* T53f28(T0* C);
/* KL_UNIX_FILE_SYSTEM.current_working_directory */
extern T0* T54f24(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.current_working_directory */
extern T0* T53f26(T0* C);
/* GEANT_TARGET.file_system */
extern T0* T26f49(T0* C);
/* GEANT_TARGET.unix_file_system */
extern T0* T26f60(T0* C);
/* GEANT_TARGET.windows_file_system */
extern T0* T26f59(T0* C);
/* GEANT_TARGET.operating_system */
extern T0* T26f58(T0* C);
/* GEANT_STRING_INTERPRETER.interpreted_string */
extern T0* T285f5(T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.variable_value */
extern T0* T285f3(T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.expanded_variable_value */
extern T0* T285f6(T0* C, T0* a1);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.value */
extern T0* T562f2(T0* C, T0* a1);
/* GEANT_VARIABLES.item */
extern T0* T29f34(T0* C, T0* a1);
/* GEANT_VARIABLES.item_storage_item */
extern T0* T29f35(T0* C, T6 a1);
/* GEANT_VARIABLES.search_position */
extern void T29f52(T0* C, T0* a1);
/* GEANT_VARIABLES.hash_position */
extern T6 T29f24(T0* C, T0* a1);
/* GEANT_VARIABLES.key_storage_item */
extern T0* T29f30(T0* C, T6 a1);
/* GEANT_VARIABLES.clashes_item */
extern T6 T29f26(T0* C, T6 a1);
/* GEANT_VARIABLES.slots_item */
extern T6 T29f33(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.value */
extern T0* T58f9(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.cwd */
extern T0* T54f10(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.cwd */
extern T0* T53f10(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.file_system */
extern T0* T58f12(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.unix_file_system */
extern T0* T58f15(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.windows_file_system */
extern T0* T58f14(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.operating_system */
extern T0* T58f13(T0* C);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.has */
extern T1 T562f3(T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.default_variable_value */
extern T0* T285f4(T0* C, T0* a1);
/* KL_STRING_ROUTINES.append_substring_to_string */
extern void T75f20(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* KL_STRING_ROUTINES.new_empty_string */
extern T0* T75f3(T0* C, T0* a1, T6 a2);
/* UC_UTF8_STRING.old_wipe_out */
extern void T227f83(T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T227f86(T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T227f83p1(T0* C);
/* STRING_8.wipe_out */
extern void T17f42(T0* C);
/* GEANT_STRING_INTERPRETER.string_ */
extern T0* T285f2(T0* C);
/* UC_UTF8_STRING.out */
extern T0* T227f19(T0* C);
/* UC_UTF8_STRING.unicode */
extern T0* T227f35(T0* C);
/* STRING_8.out */
extern T0* T17f4(T0* C);
/* XM_ELEMENT.attribute_by_name */
extern T0* T102f13(T0* C, T0* a1);
extern T1 T102f13ot1(T0* a1, T0** a2);
/* XM_ELEMENT.attribute_same_name */
extern T1 T102f14(T0* C, T0* a1, T0* a2);
/* GEANT_STRING_INTERPRETER.set_variable_resolver */
extern void T285f8(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.set_variables */
extern void T58f19(T0* C, T0* a1);
/* GEANT_TARGET.project_variables_resolver */
extern T0* T26f33(T0* C);
/* GEANT_STRING_INTERPRETER.make */
extern T0* T285c7(void);
/* XM_ELEMENT.has_attribute_by_name */
extern T1 T102f12(T0* C, T0* a1);
extern T1 T102f12ot1(T0* a1, T0** a2);
/* GEANT_TARGET.dir_attribute_name */
extern T0* T26f48(T0* C);
/* GEANT_PROJECT.log */
extern void T22f50(T0* C, T0* a1);
/* KL_STDOUT_FILE.flush */
extern void T67f24(T0* C);
/* KL_STDOUT_FILE.old_flush */
extern void T67f25(T0* C);
/* KL_STDOUT_FILE.file_flush */
extern void T67f26(T0* C, T14 a1);
/* KL_STDOUT_FILE.put_new_line */
extern void T67f18(T0* C);
/* KL_STDOUT_FILE.put_string */
extern void T67f17(T0* C, T0* a1);
/* KL_STDOUT_FILE.old_put_string */
extern void T67f21(T0* C, T0* a1);
/* KL_STDOUT_FILE.console_ps */
extern void T67f23(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STDOUT_FILE.string_ */
extern T0* T67f8(T0* C);
/* GEANT_PROJECT.target_name */
extern T0* T22f24(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].forth */
extern void T135f13(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_forth */
extern void T31f66(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].add_traversing_cursor */
extern void T31f71(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].set_next_cursor */
extern void T135f20(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].set_position */
extern void T135f18(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].remove_traversing_cursor */
extern void T31f70(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].set_after */
extern void T135f17(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].clashes_item */
extern T6 T31f35(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].go_after */
extern void T135f16(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_go_after */
extern void T31f78(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_off */
extern T1 T31f39(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].off */
extern T1 T135f10(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].key */
extern T0* T135f9(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_key */
extern T0* T31f37(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].key_storage_item */
extern T0* T31f22(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].item */
extern T0* T135f7(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_item */
extern T0* T31f36(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item_storage_item */
extern T0* T31f27(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].after */
extern T1 T135f5(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].start */
extern void T135f12(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_start */
extern void T31f65(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].is_empty */
extern T1 T31f38(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].new_cursor */
extern T0* T31f30(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].make */
extern T0* T135c11(T0* a1);
/* GEANT_TARGET.is_enabled */
extern T1 T26f47(T0* C);
/* GEANT_TARGET.unless_attribute_name */
extern T0* T26f57(T0* C);
/* GEANT_TARGET.if_attribute_name */
extern T0* T26f56(T0* C);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].force */
extern void T109f9(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES].force */
extern void T205f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_VARIABLES].fill_with */
extern void T204f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_VARIABLES].extend */
extern void T204f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].resize */
extern void T109f11(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES].aliased_resized_area */
extern T0* T205f2(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].new_capacity */
extern T6 T109f7(T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].extendible */
extern T1 T109f6(T0* C, T6 a1);
/* GEANT_VARIABLES.make */
extern T0* T29c46(void);
/* GEANT_VARIABLES.set_key_equality_tester */
extern void T29f50(T0* C, T0* a1);
/* GEANT_VARIABLES.make_map */
extern void T29f49(T0* C, T6 a1);
/* GEANT_VARIABLES.make_with_equality_testers */
extern void T29f58(T0* C, T6 a1, T0* a2, T0* a3);
/* GEANT_VARIABLES.make_sparse_container */
extern void T29f63(T0* C, T6 a1);
/* GEANT_VARIABLES.set_internal_cursor */
extern void T29f68(T0* C, T0* a1);
/* GEANT_VARIABLES.unset_found_item */
extern void T29f51(T0* C);
/* GEANT_VARIABLES.make_slots */
extern void T29f67(T0* C, T6 a1);
/* GEANT_VARIABLES.new_modulus */
extern T6 T29f22(T0* C, T6 a1);
/* GEANT_VARIABLES.make_clashes */
extern void T29f66(T0* C, T6 a1);
/* GEANT_VARIABLES.make_key_storage */
extern void T29f65(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].make */
extern T0* T62f2(T0* C, T6 a1);
/* SPECIAL [STRING_8].aliased_resized_area */
extern T0* T32f4(T0* C, T6 a1);
/* ARRAY [STRING_8].make_empty */
extern T0* T33c14(void);
/* ARRAY [STRING_8].make_empty_area */
extern void T33f15(T0* C, T6 a1);
/* SPECIAL [STRING_8].make_empty */
extern void T32f8(T0* C, T6 a1);
/* SPECIAL [STRING_8].make_empty */
extern T0* T32c8(T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].default_create */
extern T0* T62c3(void);
/* GEANT_VARIABLES.make_item_storage */
extern void T29f64(T0* C, T6 a1);
/* GEANT_PROJECT.target_locals_stack */
extern T0* T22f23(T0* C);
/* GEANT_TARGET.final_target */
extern T0* T26f37(T0* C);
/* GEANT_PROJECT.current_target */
extern T0* T22f22(T0* C);
/* DS_ARRAYED_STACK [GEANT_TARGET].is_empty */
extern T1 T209f5(T0* C);
/* GEANT_PROJECT.trace_debug */
extern void T22f39(T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].item */
extern T0* T209f6(T0* C);
/* GEANT_ARGUMENT_VARIABLES.make */
extern T0* T34c46(void);
/* GEANT_ARGUMENT_VARIABLES.set_key_equality_tester */
extern void T34f49(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.make_map */
extern void T34f48(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_with_equality_testers */
extern void T34f57(T0* C, T6 a1, T0* a2, T0* a3);
/* GEANT_ARGUMENT_VARIABLES.make_sparse_container */
extern void T34f62(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.set_internal_cursor */
extern void T34f67(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.unset_found_item */
extern void T34f50(T0* C);
/* GEANT_ARGUMENT_VARIABLES.make_slots */
extern void T34f66(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.new_modulus */
extern T6 T34f22(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_clashes */
extern void T34f65(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_key_storage */
extern void T34f64(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_item_storage */
extern void T34f63(T0* C, T6 a1);
/* GEANT_PROJECT.calculate_depend_order */
extern void T22f48(T0* C, T0* a1);
/* GEANT_TARGET.dependent_targets */
extern T0* T26f41(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].item */
extern T0* T70f21(T0* C, T6 a1);
/* GEANT_TARGET.show_dependent_targets */
extern void T26f78(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_line */
extern void T67f15(T0* C, T0* a1);
/* KL_STANDARD_FILES.output */
extern unsigned char ge168os3045;
extern T0* ge168ov3045;
extern T0* T46f2(T0* C);
/* KL_STDOUT_FILE.make */
extern T0* T67c13(void);
/* KL_STDOUT_FILE.make_open_stdout */
extern void T67f16(T0* C, T0* a1);
/* KL_STDOUT_FILE.set_write_mode */
extern void T67f20(T0* C);
/* KL_STDOUT_FILE.console_def */
extern T14 T67f11(T0* C, T6 a1);
/* KL_STDOUT_FILE.make_with_name */
extern void T67f19(T0* C, T0* a1);
/* KL_STDOUT_FILE.default_pointer */
extern T14 T67f7(T0* C);
/* KL_STDOUT_FILE.set_name */
extern void T67f22(T0* C, T0* a1);
/* KL_STDOUT_FILE.buffered_file_info */
extern T0* T67f12(T0* C);
/* GEANT_TARGET.string_tokens */
extern T0* T26f25(T0* C, T0* a1, T2 a2);
/* DS_ARRAYED_LIST [detachable STRING_8].force_last */
extern void T70f26(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [STRING_8].force */
extern void T62f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [STRING_8].fill_with */
extern void T32f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].extend */
extern void T32f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].resize */
extern void T70f28(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].aliased_resized_area */
extern T0* T62f1(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [detachable STRING_8].new_capacity */
extern T6 T70f16(T0* C, T6 a1);
/* DS_ARRAYED_LIST [detachable STRING_8].extendible */
extern T1 T70f15(T0* C, T6 a1);
/* UC_UTF8_STRING.index_of */
extern T6 T227f20(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.index_of_item_code */
extern T6 T227f36(T0* C, T6 a1, T6 a2);
/* STRING_8.index_of */
extern T6 T17f13(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.keep_head */
extern void T227f82(T0* C, T6 a1);
/* STRING_8.keep_head */
extern void T17f55(T0* C, T6 a1);
/* UC_UTF8_STRING.keep_tail */
extern void T227f84(T0* C, T6 a1);
/* STRING_8.keep_tail */
extern void T17f54(T0* C, T6 a1);
/* DS_ARRAYED_LIST [detachable STRING_8].make */
extern T0* T70c22(T6 a1);
/* DS_ARRAYED_LIST [detachable STRING_8].set_internal_cursor */
extern void T70f27(T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].new_cursor */
extern T0* T70f9(T0* C);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].make */
extern T0* T71c9(T0* a1);
/* GEANT_TARGET.dependencies */
extern T0* T26f45(T0* C);
/* GEANT_TARGET.depend_attribute_name */
extern unsigned char ge12os2512;
extern T0* ge12ov2512;
extern T0* T26f46(T0* C);
/* GEANT_TARGET.has_dependencies */
extern T1 T26f44(T0* C);
/* DS_ARRAYED_STACK [GEANT_TARGET].force */
extern void T209f10(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].force */
extern void T134f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_TARGET].fill_with */
extern void T131f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_TARGET].extend */
extern void T131f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].resize */
extern void T209f12(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].aliased_resized_area */
extern T0* T134f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_TARGET].aliased_resized_area */
extern T0* T131f4(T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].new_capacity */
extern T6 T209f8(T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].extendible */
extern T1 T209f7(T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].make */
extern T0* T209c9(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].make */
extern T0* T134f2(T0* C, T6 a1);
/* ARRAY [GEANT_TARGET].make_empty */
extern T0* T239c4(void);
/* ARRAY [GEANT_TARGET].make_empty_area */
extern void T239f5(T0* C, T6 a1);
/* SPECIAL [GEANT_TARGET].make_empty */
extern T0* T131c5(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].default_create */
extern T0* T134c3(void);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].force */
extern void T108f9(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].force */
extern void T203f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].fill_with */
extern void T202f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].extend */
extern void T202f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].resize */
extern void T108f11(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].aliased_resized_area */
extern T0* T203f2(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].new_capacity */
extern T6 T108f7(T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].extendible */
extern T1 T108f6(T0* C, T6 a1);
/* GEANT_PROJECT.target_arguments_stack */
extern T0* T22f21(T0* C);
/* GEANT_PROJECT.trace */
extern void T22f31(T0* C, T0* a1);
/* GEANT.commandline_arguments */
extern unsigned char ge10os1906;
extern T0* ge10ov1906;
extern T0* T21f11(T0* C);
/* GEANT_PROJECT.start_target */
extern T0* T22f17(T0* C);
/* GEANT_PROJECT.exit_application */
extern void T22f43(T0* C, T6 a1, T0* a2);
/* GEANT_PROJECT.exceptions */
extern T0* T22f19(T0* C);
/* GEANT_PROJECT.std */
extern T0* T22f18(T0* C);
/* GEANT_PROJECT.log_messages */
extern void T22f47(T0* C, T0* a1);
/* GEANT_PROJECT.preferred_start_target */
extern T0* T22f20(T0* C);
/* GEANT_PROJECT.default_target */
extern T0* T22f16(T0* C);
/* GEANT_PROJECT.show_target_info */
extern void T22f34(T0* C);
/* GEANT_PROJECT.set_start_target_name */
extern void T22f33(T0* C, T0* a1);
/* GEANT_TARGET.full_name */
extern T0* T26f34(T0* C);
/* GEANT_TARGET.is_exported_to_any */
extern T1 T26f35(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].has */
extern T1 T70f20(T0* C, T0* a1);
/* GEANT_TARGET.project_name_any */
extern unsigned char ge12os2515;
extern T0* ge12ov2515;
extern T0* T26f26(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item */
extern T0* T31f34(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].search_position */
extern void T31f47(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].hash_position */
extern T6 T31f24(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].slots_item */
extern T6 T31f25(T0* C, T6 a1);
/* GEANT.exit_application */
extern void T21f22(T0* C, T6 a1, T0* a2);
/* GEANT.exceptions */
extern T0* T21f14(T0* C);
/* GEANT.std */
extern T0* T21f13(T0* C);
/* GEANT.log_messages */
extern void T21f28(T0* C, T0* a1);
/* UC_UTF8_STRING.plus */
extern T0* T227f10(T0* C, T0* a1);
/* STRING_8.plus */
extern T0* T17f9(T0* C, T0* a1);
/* STRING_8.append_string_general */
extern void T17f48(T0* C, T0* a1);
/* STRING_8.append */
extern void T17f48p1(T0* C, T0* a1);
/* STRING_8.append_code */
extern void T17f50(T0* C, T10 a1);
/* STRING_8.new_string */
extern T0* T17f22(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].has */
extern T1 T31f33(T0* C, T0* a1);
/* INTEGER_32.is_greater */
extern T1 T6f1(T6* C, T6 a1);
/* GEANT_PROJECT.merge_in_parent_projects */
extern void T22f32(T0* C);
/* GEANT_TARGET.show_precursors */
extern void T26f77(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].to_array */
extern T0* T70f19(T0* C);
/* ARRAY [STRING_8].put */
extern void T33f12(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].after */
extern T1 T71f8(T0* C);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].forth */
extern void T71f11(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].cursor_forth */
extern void T70f31(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].set_position */
extern void T71f13(T0* C, T6 a1);
/* DS_ARRAYED_LIST [detachable STRING_8].add_traversing_cursor */
extern void T70f35(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].set_next_cursor */
extern void T71f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].remove_traversing_cursor */
extern void T70f36(T0* C, T0* a1);
/* ARRAY [STRING_8].make_filled */
extern T0* T33c11(T0* a1, T6 a2, T6 a3);
/* ARRAY [STRING_8].make_filled_area */
extern void T33f13(T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].make_filled */
extern T0* T32c6(T0* a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].item */
extern T0* T71f6(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].cursor_item */
extern T0* T70f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].start */
extern void T71f10(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].cursor_start */
extern void T70f30(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].set_after */
extern void T71f12(T0* C);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].off */
extern T1 T71f4(T0* C);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].before */
extern T1 T71f7(T0* C);
/* KL_ARRAY_ROUTINES [detachable STRING_8].make_empty_with_lower */
extern T0* T380f1(T0* C, T6 a1);
/* ARRAY [STRING_8].make_from_array */
extern T0* T33c18(T0* a1);
/* ARRAY [STRING_8].set_area */
extern void T33f17(T0* C, T0* a1);
/* KL_ARRAY [detachable STRING_8].new_rebase */
extern void T504f5(T0* C, T6 a1);
/* KL_ARRAY [detachable STRING_8].make_empty */
extern T0* T504c4(void);
/* KL_ARRAY [detachable STRING_8].make_empty_area */
extern void T504f6(T0* C, T6 a1);
/* KL_ARRAY_ROUTINES [detachable STRING_8].default_create */
extern T0* T380c2(void);
/* DS_ARRAYED_LIST [detachable STRING_8].is_empty */
extern T1 T70f17(T0* C);
/* GEANT_INHERIT.apply_selects */
extern void T130f8(T0* C);
/* GEANT_INHERIT.check_targets_for_conflicts */
extern void T130f14(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].back */
extern void T135f15(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_back */
extern void T31f68(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].set_before */
extern void T135f19(T0* C);
/* GEANT_INHERIT.exit_application */
extern void T130f15(T0* C, T6 a1, T0* a2);
/* GEANT_INHERIT.exceptions */
extern T0* T130f5(T0* C);
/* GEANT_INHERIT.std */
extern T0* T130f4(T0* C);
/* GEANT_INHERIT.log_messages */
extern void T130f16(T0* C, T0* a1);
/* GEANT_TARGET.conflicts_with */
extern T1 T26f39(T0* C, T0* a1);
/* GEANT_TARGET.seed */
extern T0* T26f43(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].before */
extern T1 T135f4(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].finish */
extern void T135f14(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_finish */
extern void T31f67(T0* C, T0* a1);
/* GEANT_INHERIT.sort_out_selected_targets */
extern void T130f13(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].remove */
extern void T31f64(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].remove_position */
extern void T31f69(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].key_storage_put */
extern void T31f53(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item_storage_put */
extern void T31f52(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].key_storage_keep_head */
extern void T31f75(T0* C, T6 a1);
/* SPECIAL [STRING_8].keep_head */
extern void T32f10(T0* C, T6 a1);
/* SPECIAL [STRING_8].set_count */
extern void T32f11(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item_storage_keep_head */
extern void T31f74(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].clashes_put */
extern void T31f50(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].slots_put */
extern void T31f51(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].move_cursors_forth */
extern void T31f73(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].move_all_cursors */
extern void T31f77(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].move_cursors_after */
extern void T31f76(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].internal_set_key_equality_tester */
extern void T31f72(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].unset_found_item */
extern void T31f48(T0* C);
/* GEANT_TARGET.set_redefining_target */
extern void T26f85(T0* C, T0* a1);
/* GEANT_INHERIT.validate_parent_selects */
extern void T130f12(T0* C);
/* GEANT_INHERIT.merge_in_parent_project */
extern void T130f7(T0* C, T0* a1);
/* GEANT_INHERIT.merge_in_unchanged_targets */
extern void T130f11(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].force_last_new */
extern void T31f45(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].resize */
extern void T31f49(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].clashes_resize */
extern void T31f58(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].aliased_resized_area_with_default */
extern T0* T65f1(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].aliased_resized_area_with_default */
extern T0* T63f4(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].special_integer_ */
extern unsigned char ge127os2341;
extern T0* ge127ov2341;
extern T0* T31f31(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].key_storage_resize */
extern void T31f57(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item_storage_resize */
extern void T31f56(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].slots_resize */
extern void T31f55(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].new_modulus */
extern T6 T31f23(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].new_capacity */
extern T6 T31f32(T0* C, T6 a1);
/* GEANT_INHERIT.string_ */
extern T0* T130f3(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].found_item */
extern T0* T31f28(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].found */
extern T1 T31f29(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].search */
extern void T31f44(T0* C, T0* a1);
/* GEANT_INHERIT.merge_in_renamed_targets */
extern void T130f10(T0* C, T0* a1);
/* GEANT_INHERIT.merge_in_redefined_targets */
extern void T130f9(T0* C, T0* a1);
/* GEANT_TARGET.set_precursor_target */
extern void T26f76(T0* C, T0* a1);
/* GEANT_TARGET.formal_arguments_match */
extern T1 T26f38(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].forth */
extern void T214f11(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_forth */
extern void T213f17(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].set_position */
extern void T214f13(T0* C, T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].add_traversing_cursor */
extern void T213f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].set_next_cursor */
extern void T214f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].remove_traversing_cursor */
extern void T213f19(T0* C, T0* a1);
/* GEANT_PARENT.prepare_project */
extern void T211f14(T0* C);
/* GEANT_PARENT.apply_selects */
extern void T211f19(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].forth */
extern void T499f11(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_forth */
extern void T368f57(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].add_traversing_cursor */
extern void T368f59(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].set_next_cursor */
extern void T499f14(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].set_position */
extern void T499f13(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].remove_traversing_cursor */
extern void T368f58(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].set_after */
extern void T499f12(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].clashes_item */
extern T6 T368f24(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].force_last */
extern void T31f79(T0* C, T0* a1, T0* a2);
/* GEANT_PARENT.exit_application */
extern void T211f20(T0* C, T6 a1, T0* a2);
/* GEANT_PARENT.exceptions */
extern T0* T211f11(T0* C);
/* GEANT_PARENT.std */
extern T0* T211f10(T0* C);
/* GEANT_PARENT.log_messages */
extern void T211f21(T0* C, T0* a1);
/* GEANT_SELECT.is_executable */
extern T1 T367f2(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].item */
extern T0* T499f5(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_item */
extern T0* T368f31(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].item_storage_item */
extern T0* T368f32(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].after */
extern T1 T499f4(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].start */
extern void T499f10(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_start */
extern void T368f56(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_off */
extern T1 T368f34(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].off */
extern T1 T499f8(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].is_empty */
extern T1 T368f33(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].new_cursor */
extern T0* T368f27(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].make */
extern T0* T499c9(T0* a1);
/* GEANT_PARENT.apply_undeclared_redefines */
extern void T211f18(T0* C);
/* GEANT_PARENT.apply_unchangeds */
extern void T211f17(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].has_item */
extern T1 T31f41(T0* C, T0* a1);
/* GEANT_PARENT.apply_redefines */
extern void T211f16(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].forth */
extern void T494f11(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_forth */
extern void T366f57(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].add_traversing_cursor */
extern void T366f59(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].set_next_cursor */
extern void T494f14(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].set_position */
extern void T494f13(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].remove_traversing_cursor */
extern void T366f58(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].set_after */
extern void T494f12(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].clashes_item */
extern T6 T366f24(T0* C, T6 a1);
/* GEANT_REDEFINE.is_executable */
extern T1 T365f2(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].item */
extern T0* T494f5(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_item */
extern T0* T366f31(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].item_storage_item */
extern T0* T366f32(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].after */
extern T1 T494f4(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].start */
extern void T494f10(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_start */
extern void T366f56(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_off */
extern T1 T366f34(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].off */
extern T1 T494f8(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].is_empty */
extern T1 T366f33(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].new_cursor */
extern T0* T366f27(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].make */
extern T0* T494c9(T0* a1);
/* GEANT_PARENT.apply_renames */
extern void T211f15(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].back */
extern void T489f11(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_back */
extern void T364f58(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].add_traversing_cursor */
extern void T364f60(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].set_next_cursor */
extern void T489f14(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].set_position */
extern void T489f13(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].remove_traversing_cursor */
extern void T364f59(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].set_before */
extern void T489f12(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].clashes_item */
extern T6 T364f25(T0* C, T6 a1);
/* GEANT_RENAME.is_executable */
extern T1 T363f3(T0* C);
/* GEANT_RENAME.string_ */
extern T0* T363f4(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].item */
extern T0* T489f5(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_item */
extern T0* T364f32(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].item_storage_item */
extern T0* T364f33(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].before */
extern T1 T489f4(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].finish */
extern void T489f10(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_finish */
extern void T364f57(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_off */
extern T1 T364f35(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].off */
extern T1 T489f8(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].is_empty */
extern T1 T364f34(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].new_cursor */
extern T0* T364f28(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].make */
extern T0* T489c9(T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].item */
extern T0* T214f5(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_item */
extern T0* T213f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].after */
extern T1 T214f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].start */
extern void T214f10(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_start */
extern void T213f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].set_after */
extern void T214f12(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].is_empty */
extern T1 T213f10(T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].off */
extern T1 T214f6(T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].before */
extern T1 T214f8(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].new_cursor */
extern T0* T213f6(T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].make */
extern T0* T214c9(T0* a1);
/* GEANT_PROJECT_LOADER.load */
extern void T23f10(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_LOADER.exit_application */
extern void T23f11(T0* C, T6 a1, T0* a2);
/* GEANT_PROJECT_LOADER.exceptions */
extern T0* T23f6(T0* C);
/* GEANT_PROJECT_LOADER.log_messages */
extern void T23f12(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.absolute_pathname */
extern T0* T53f4(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.current_drive */
extern T0* T53f13(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_separator */
extern T1 T53f19(T0* C, T2 a1);
/* KL_WINDOWS_FILE_SYSTEM.pathname */
extern T0* T53f11(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.is_relative_pathname */
extern T1 T53f9(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_absolute_pathname */
extern T1 T53f8(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.absolute_pathname */
extern T0* T54f4(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.pathname */
extern T0* T54f11(T0* C, T0* a1, T0* a2);
/* KL_UNIX_FILE_SYSTEM.is_absolute_pathname */
extern T1 T54f9(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.pathname_from_file_system */
extern T0* T53f3(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.pathname_to_string */
extern T0* T53f7(T0* C, T0* a1);
/* KL_PATHNAME.item */
extern T0* T90f8(T0* C, T6 a1);
/* KL_PATHNAME.is_parent */
extern T1 T90f7(T0* C, T6 a1);
/* KL_PATHNAME.is_current */
extern T1 T90f11(T0* C, T6 a1);
/* KL_WINDOWS_FILE_SYSTEM.root_directory */
extern unsigned char ge177os4253;
extern T0* ge177ov4253;
extern T0* T53f16(T0* C);
/* KL_UNIX_FILE_SYSTEM.string_to_pathname */
extern T0* T54f5(T0* C, T0* a1);
/* KL_PATHNAME.append_name */
extern void T90f17(T0* C, T0* a1);
/* ARRAY [STRING_8].force */
extern void T33f16(T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].move_data */
extern void T32f12(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].overlapping_move */
extern void T32f14(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].force */
extern void T32f15(T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].non_overlapping_move */
extern void T32f13(T0* C, T6 a1, T6 a2, T6 a3);
/* ARRAY [STRING_8].capacity */
extern T6 T33f8(T0* C);
/* ARRAY [STRING_8].additional_space */
extern T6 T33f7(T0* C);
/* ARRAY [STRING_8].empty_area */
extern T1 T33f6(T0* C);
/* KL_PATHNAME.append_parent */
extern void T90f16(T0* C);
/* KL_PATHNAME.append_current */
extern void T90f15(T0* C);
/* KL_PATHNAME.set_relative */
extern void T90f14(T0* C, T1 a1);
/* KL_PATHNAME.make */
extern T0* T90c13(void);
/* KL_WINDOWS_FILE_SYSTEM.any_ */
extern T0* T53f6(T0* C);
/* KL_UNIX_FILE_SYSTEM.pathname_from_file_system */
extern T0* T54f3(T0* C, T0* a1, T0* a2);
/* KL_UNIX_FILE_SYSTEM.pathname_to_string */
extern T0* T54f8(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.root_directory */
extern unsigned char ge174os4253;
extern T0* ge174ov4253;
extern T0* T54f17(T0* C);
/* KL_UNIX_FILE_SYSTEM.any_ */
extern T0* T54f7(T0* C);
/* GEANT_PROJECT_LOADER.unix_file_system */
extern T0* T23f4(T0* C);
/* GEANT_PROJECT_LOADER.file_system */
extern T0* T23f3(T0* C);
/* GEANT_PROJECT_LOADER.windows_file_system */
extern T0* T23f8(T0* C);
/* GEANT_PROJECT_LOADER.operating_system */
extern T0* T23f7(T0* C);
/* KL_STDERR_FILE.put_character */
extern void T47f24(T0* C, T2 a1);
/* KL_STDERR_FILE.old_put_character */
extern void T47f25(T0* C, T2 a1);
/* KL_STDERR_FILE.console_pc */
extern void T47f26(T0* C, T14 a1, T2 a2);
/* GEANT_PROJECT_LOADER.std */
extern T0* T23f5(T0* C);
/* KL_TEXT_INPUT_FILE.close */
extern void T55f63(T0* C);
/* KL_TEXT_INPUT_FILE.old_close */
extern void T55f67(T0* C);
/* KL_TEXT_INPUT_FILE.default_pointer */
extern T14 T55f27(T0* C);
/* KL_TEXT_INPUT_FILE.file_close */
extern void T55f70(T0* C, T14 a1);
/* GEANT_PROJECT_PARSER.parse_file */
extern void T56f9(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.last_error_extended_description */
extern T0* T96f92(T0* C);
/* XM_EIFFEL_PARSER.string_ */
extern T0* T96f89(T0* C);
/* XM_EIFFEL_PARSER.last_error_description */
extern T0* T96f87(T0* C);
/* XM_EIFFEL_PARSER.safe_error_component */
extern T0* T96f140(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_safe_error_character */
extern T1 T96f97(T0* C, T2 a1);
/* XM_EIFFEL_PARSER.position */
extern T0* T96f128(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].first */
extern T0* T145f6(T0* C);
/* XM_EIFFEL_PARSER.positions */
extern T0* T96f93(T0* C);
/* XM_EIFFEL_PARSER.new_positions */
extern T0* T96f122(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].remove */
extern void T146f7(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].item */
extern T0* T146f4(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].is_empty */
extern T1 T146f3(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].force_last */
extern void T145f8(T0* C, T0* a1);
/* detachable DS_BILINKABLE [XM_POSITION].put_right */
extern void T246f5(T0* C, T0* a1);
/* detachable DS_BILINKABLE [XM_POSITION].attach_left */
extern void T246f6(T0* C, T0* a1);
/* detachable DS_BILINKABLE [XM_POSITION].make */
extern T0* T246c4(T0* a1);
/* DS_BILINKED_LIST [XM_POSITION].make */
extern T0* T145c7(void);
/* DS_BILINKED_LIST [XM_POSITION].set_internal_cursor */
extern void T145f9(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_POSITION].new_cursor */
extern T0* T145f5(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_POSITION].make */
extern T0* T247c3(T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].copy */
extern void T146f6(T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_EIFFEL_SCANNER].put_right */
extern void T248f4(T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_EIFFEL_SCANNER].make */
extern T0* T248c3(T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].make */
extern T0* T146c5(void);
/* KL_STDERR_FILE.flush */
extern void T47f27(T0* C);
/* KL_STDERR_FILE.old_flush */
extern void T47f28(T0* C);
/* KL_STDERR_FILE.file_flush */
extern void T47f29(T0* C, T14 a1);
/* XM_TREE_CALLBACKS_PIPE.last_error */
extern T0* T97f5(T0* C);
/* GEANT_PROJECT_PARSER.std */
extern T0* T56f7(T0* C);
/* GEANT_PROJECT.set_position_table */
extern void T22f36(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.make */
extern T0* T30c20(T0* a1, T0* a2, T0* a3, T0* a4);
/* GEANT_PROJECT_ELEMENT.load_parent_projects */
extern void T30f23(T0* C);
/* GEANT_INHERIT_ELEMENT.make */
extern T0* T129c11(T0* a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.exit_application */
extern void T129f13(T0* C, T6 a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.exceptions */
extern T0* T129f8(T0* C);
/* GEANT_INHERIT_ELEMENT.std */
extern T0* T129f7(T0* C);
/* GEANT_INHERIT_ELEMENT.log_messages */
extern void T129f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].force_last */
extern void T213f13(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].force */
extern void T352f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_PARENT].fill_with */
extern void T353f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_PARENT].extend */
extern void T353f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].resize */
extern void T213f15(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].aliased_resized_area */
extern T0* T352f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_PARENT].aliased_resized_area */
extern T0* T353f3(T0* C, T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].new_capacity */
extern T6 T213f7(T0* C, T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].extendible */
extern T1 T213f8(T0* C, T6 a1);
/* GEANT_PARENT.is_executable */
extern T1 T211f9(T0* C);
/* GEANT_PARENT_ELEMENT.make */
extern T0* T237c22(T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].force_last */
extern void T368f36(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].key_storage_put */
extern void T368f45(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].slots_put */
extern void T368f44(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].clashes_put */
extern void T368f43(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].slots_item */
extern T6 T368f30(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].hash_position */
extern T6 T368f23(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].resize */
extern void T368f42(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].clashes_resize */
extern void T368f50(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].special_integer_ */
extern T0* T368f28(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].key_storage_resize */
extern void T368f49(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].item_storage_resize */
extern void T368f48(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].aliased_resized_area */
extern T0* T497f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_SELECT].aliased_resized_area */
extern T0* T498f3(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].key_storage_item */
extern T0* T368f26(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].slots_resize */
extern void T368f47(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].new_modulus */
extern T6 T368f21(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].new_capacity */
extern T6 T368f22(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].item_storage_put */
extern void T368f41(T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].force */
extern void T497f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_SELECT].fill_with */
extern void T498f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_SELECT].extend */
extern void T498f8(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].search_position */
extern void T368f40(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].unset_found_item */
extern void T368f39(T0* C);
/* GEANT_SELECT_ELEMENT.make */
extern T0* T362c9(T0* a1, T0* a2);
/* GEANT_SELECT.set_name */
extern void T367f4(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.attribute_value */
extern T0* T362f7(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.project_variables_resolver */
extern T0* T362f8(T0* C);
/* GEANT_SELECT_ELEMENT.has_attribute */
extern T1 T362f6(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.target_attribute_name */
extern unsigned char ge100os9632;
extern T0* ge100ov9632;
extern T0* T362f5(T0* C);
/* GEANT_SELECT.make */
extern T0* T367c3(void);
/* GEANT_SELECT_ELEMENT.interpreting_element_make */
extern void T362f10(T0* C, T0* a1, T0* a2);
/* GEANT_SELECT_ELEMENT.set_project */
extern void T362f12(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.element_make */
extern void T362f11(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.set_xml_element */
extern void T362f13(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.select_element_name */
extern unsigned char ge92os8646;
extern T0* ge92ov8646;
extern T0* T237f11(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].force_last */
extern void T366f36(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].key_storage_put */
extern void T366f45(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].slots_put */
extern void T366f44(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].clashes_put */
extern void T366f43(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].slots_item */
extern T6 T366f30(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].hash_position */
extern T6 T366f23(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].resize */
extern void T366f42(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].clashes_resize */
extern void T366f50(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].special_integer_ */
extern T0* T366f28(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].key_storage_resize */
extern void T366f49(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].item_storage_resize */
extern void T366f48(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].aliased_resized_area */
extern T0* T492f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_REDEFINE].aliased_resized_area */
extern T0* T493f3(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].key_storage_item */
extern T0* T366f26(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].slots_resize */
extern void T366f47(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].new_modulus */
extern T6 T366f21(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].new_capacity */
extern T6 T366f22(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].item_storage_put */
extern void T366f41(T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].force */
extern void T492f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_REDEFINE].fill_with */
extern void T493f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_REDEFINE].extend */
extern void T493f8(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].search_position */
extern void T366f40(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].unset_found_item */
extern void T366f39(T0* C);
/* GEANT_REDEFINE_ELEMENT.make */
extern T0* T361c9(T0* a1, T0* a2);
/* GEANT_REDEFINE.set_name */
extern void T365f4(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.attribute_value */
extern T0* T361f7(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.project_variables_resolver */
extern T0* T361f8(T0* C);
/* GEANT_REDEFINE_ELEMENT.has_attribute */
extern T1 T361f6(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.target_attribute_name */
extern unsigned char ge96os9628;
extern T0* ge96ov9628;
extern T0* T361f5(T0* C);
/* GEANT_REDEFINE.make */
extern T0* T365c3(void);
/* GEANT_REDEFINE_ELEMENT.interpreting_element_make */
extern void T361f10(T0* C, T0* a1, T0* a2);
/* GEANT_REDEFINE_ELEMENT.set_project */
extern void T361f12(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.element_make */
extern void T361f11(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.set_xml_element */
extern void T361f13(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.redefine_element_name */
extern unsigned char ge92os8645;
extern T0* ge92ov8645;
extern T0* T237f10(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].force_last */
extern void T364f37(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].key_storage_put */
extern void T364f46(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].slots_put */
extern void T364f45(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].clashes_put */
extern void T364f44(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].slots_item */
extern T6 T364f24(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].hash_position */
extern T6 T364f21(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].resize */
extern void T364f43(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].clashes_resize */
extern void T364f51(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].special_integer_ */
extern T0* T364f29(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].key_storage_resize */
extern void T364f50(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].item_storage_resize */
extern void T364f49(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].aliased_resized_area */
extern T0* T487f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_RENAME].aliased_resized_area */
extern T0* T488f3(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].key_storage_item */
extern T0* T364f27(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].slots_resize */
extern void T364f48(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].new_modulus */
extern T6 T364f22(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].new_capacity */
extern T6 T364f31(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].item_storage_put */
extern void T364f42(T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].force */
extern void T487f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_RENAME].fill_with */
extern void T488f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_RENAME].extend */
extern void T488f8(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].search_position */
extern void T364f39(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].unset_found_item */
extern void T364f41(T0* C);
/* GEANT_PARENT_ELEMENT.exit_application */
extern void T237f24(T0* C, T6 a1, T0* a2);
/* GEANT_PARENT_ELEMENT.exceptions */
extern T0* T237f15(T0* C);
/* GEANT_PARENT_ELEMENT.std */
extern T0* T237f14(T0* C);
/* GEANT_PARENT_ELEMENT.log_messages */
extern void T237f27(T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].put_last */
extern void T70f32(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].has */
extern T1 T364f30(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.make */
extern T0* T360c10(T0* a1, T0* a2);
/* GEANT_RENAME.set_new_name */
extern void T363f7(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.as_attribute_name */
extern unsigned char ge98os9624;
extern T0* ge98ov9624;
extern T0* T360f5(T0* C);
/* GEANT_RENAME.set_original_name */
extern void T363f6(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.attribute_value */
extern T0* T360f8(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.project_variables_resolver */
extern T0* T360f9(T0* C);
/* GEANT_RENAME_ELEMENT.has_attribute */
extern T1 T360f7(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.target_attribute_name */
extern unsigned char ge98os9623;
extern T0* ge98ov9623;
extern T0* T360f6(T0* C);
/* GEANT_RENAME.make */
extern T0* T363c5(void);
/* GEANT_RENAME_ELEMENT.interpreting_element_make */
extern void T360f11(T0* C, T0* a1, T0* a2);
/* GEANT_RENAME_ELEMENT.set_project */
extern void T360f13(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.element_make */
extern void T360f12(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.set_xml_element */
extern void T360f14(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.elements_by_name */
extern T0* T237f9(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].force_last */
extern void T127f8(T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_ELEMENT].put_right */
extern void T236f4(T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_ELEMENT].make */
extern T0* T236c3(T0* a1);
/* GEANT_PARENT_ELEMENT.string_ */
extern T0* T237f19(T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].make */
extern T0* T127c7(void);
/* DS_LINKED_LIST [XM_ELEMENT].set_internal_cursor */
extern void T127f9(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.rename_element_name */
extern unsigned char ge92os8644;
extern T0* ge92ov8644;
extern T0* T237f8(T0* C);
/* GEANT_PARENT.set_parent_project */
extern void T211f13(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.value */
extern T0* T25f45(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.item */
extern T0* T25f47(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.item_storage_item */
extern T0* T25f48(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.search_position */
extern void T25f65(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.hash_position */
extern T6 T25f33(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.key_storage_item */
extern T0* T25f28(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.clashes_item */
extern T6 T25f21(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.slots_item */
extern T6 T25f22(T0* C, T6 a1);
/* KL_UNIX_FILE_SYSTEM.is_relative_pathname */
extern T1 T54f23(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.file_system */
extern T0* T237f7(T0* C);
/* GEANT_PARENT_ELEMENT.unix_file_system */
extern T0* T237f18(T0* C);
/* GEANT_PARENT_ELEMENT.windows_file_system */
extern T0* T237f17(T0* C);
/* GEANT_PARENT_ELEMENT.operating_system */
extern T0* T237f16(T0* C);
/* GEANT_PARENT_ELEMENT.attribute_value */
extern T0* T237f12(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.project_variables_resolver */
extern T0* T237f20(T0* C);
/* GEANT_PARENT_ELEMENT.has_attribute */
extern T1 T237f6(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.location_attribute_name */
extern unsigned char ge92os8642;
extern T0* ge92ov8642;
extern T0* T237f5(T0* C);
/* GEANT_PARENT.make */
extern T0* T211c12(T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].set_key_equality_tester */
extern void T368f37(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_map_equal */
extern T0* T368c35(T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_with_equality_testers */
extern void T368f38(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_sparse_container */
extern void T368f46(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].set_internal_cursor */
extern void T368f55(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_slots */
extern void T368f54(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_clashes */
extern void T368f53(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_key_storage */
extern void T368f52(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_item_storage */
extern void T368f51(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].make */
extern T0* T497f2(T0* C, T6 a1);
/* ARRAY [GEANT_SELECT].make_empty */
extern T0* T540c4(void);
/* ARRAY [GEANT_SELECT].make_empty_area */
extern void T540f5(T0* C, T6 a1);
/* SPECIAL [GEANT_SELECT].make_empty */
extern T0* T498c5(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].default_create */
extern T0* T497c3(void);
/* detachable KL_EQUALITY_TESTER [GEANT_SELECT].default_create */
extern T0* T495c1(void);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].set_key_equality_tester */
extern void T366f37(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_map_equal */
extern T0* T366c35(T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_with_equality_testers */
extern void T366f38(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_sparse_container */
extern void T366f46(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].set_internal_cursor */
extern void T366f55(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_slots */
extern void T366f54(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_clashes */
extern void T366f53(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_key_storage */
extern void T366f52(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_item_storage */
extern void T366f51(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].make */
extern T0* T492f2(T0* C, T6 a1);
/* ARRAY [GEANT_REDEFINE].make_empty */
extern T0* T539c4(void);
/* ARRAY [GEANT_REDEFINE].make_empty_area */
extern void T539f5(T0* C, T6 a1);
/* SPECIAL [GEANT_REDEFINE].make_empty */
extern T0* T493c5(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].default_create */
extern T0* T492c3(void);
/* detachable KL_EQUALITY_TESTER [GEANT_REDEFINE].default_create */
extern T0* T490c1(void);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].set_key_equality_tester */
extern void T364f38(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_map_equal */
extern T0* T364c36(T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_with_equality_testers */
extern void T364f40(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_sparse_container */
extern void T364f47(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].set_internal_cursor */
extern void T364f56(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_slots */
extern void T364f55(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_clashes */
extern void T364f54(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_key_storage */
extern void T364f53(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_item_storage */
extern void T364f52(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].make */
extern T0* T487f2(T0* C, T6 a1);
/* ARRAY [GEANT_RENAME].make_empty */
extern T0* T538c4(void);
/* ARRAY [GEANT_RENAME].make_empty_area */
extern void T538f5(T0* C, T6 a1);
/* SPECIAL [GEANT_RENAME].make_empty */
extern T0* T488c5(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].default_create */
extern T0* T487c3(void);
/* detachable KL_EQUALITY_TESTER [GEANT_RENAME].default_create */
extern T0* T485c1(void);
/* GEANT_PARENT_ELEMENT.interpreting_element_make */
extern void T237f23(T0* C, T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.set_project */
extern void T237f26(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.element_make */
extern void T237f25(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.set_xml_element */
extern void T237f28(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.elements_by_name */
extern T0* T129f6(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.string_ */
extern T0* T129f9(T0* C);
/* GEANT_INHERIT_ELEMENT.parent_element_name */
extern unsigned char ge85os7131;
extern T0* ge85ov7131;
extern T0* T129f5(T0* C);
/* GEANT_INHERIT.make */
extern T0* T130c6(T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].make */
extern T0* T213c12(T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].set_internal_cursor */
extern void T213f14(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].make */
extern T0* T352f1(T0* C, T6 a1);
/* ARRAY [GEANT_PARENT].make_empty */
extern T0* T481c4(void);
/* ARRAY [GEANT_PARENT].make_empty_area */
extern void T481f5(T0* C, T6 a1);
/* SPECIAL [GEANT_PARENT].make_empty */
extern T0* T353c5(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].default_create */
extern T0* T352c3(void);
/* GEANT_INHERIT_ELEMENT.interpreting_element_make */
extern void T129f12(T0* C, T0* a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.set_project */
extern void T129f15(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.element_make */
extern void T129f14(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.set_xml_element */
extern void T129f17(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.inherit_element_name */
extern unsigned char ge93os2691;
extern T0* ge93ov2691;
extern T0* T30f16(T0* C);
/* GEANT_PROJECT.set_inherit_clause */
extern void T22f42(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.make_old */
extern T0* T129c10(T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.make_old */
extern T0* T237c21(T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.inherit_attribute_name */
extern unsigned char ge92os8643;
extern T0* ge92ov8643;
extern T0* T237f13(T0* C);
/* GEANT_PROJECT.set_old_inherit */
extern void T22f41(T0* C, T1 a1);
/* GEANT_PROJECT_ELEMENT.has_inherit_element */
extern T1 T30f15(T0* C);
/* GEANT_PROJECT_ELEMENT.inherit_attribute_name */
extern unsigned char ge93os2690;
extern T0* ge93ov2690;
extern T0* T30f14(T0* C);
/* GEANT_PROJECT.set_targets */
extern void T22f40(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].forth */
extern void T128f10(T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_forth */
extern void T127f11(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].add_traversing_cursor */
extern void T127f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].set_next_cursor */
extern void T128f12(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].remove_traversing_cursor */
extern void T127f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].set */
extern void T128f11(T0* C, T0* a1, T1 a2, T1 a3);
/* GEANT_TARGET.make */
extern T0* T26c63(T0* a1, T0* a2);
/* GEANT_TARGET.initialize */
extern void T26f64(T0* C);
/* GEANT_TARGET.initialize */
extern void T26f64p1(T0* C);
/* GEANT_TARGET.set_description */
extern void T26f72(T0* C, T0* a1);
/* GEANT_GLOBAL_ELEMENT.name */
extern T0* T218f2(T0* C);
/* GEANT_GLOBAL_ELEMENT.attribute_value */
extern T0* T218f5(T0* C, T0* a1);
/* GEANT_GLOBAL_ELEMENT.name_attribute_name */
extern unsigned char ge90os8297;
extern T0* ge90ov8297;
extern T0* T218f3(T0* C);
/* GEANT_GLOBAL_ELEMENT.has_name */
extern T1 T218f6(T0* C);
/* GEANT_GLOBAL_ELEMENT.has_attribute */
extern T1 T218f4(T0* C, T0* a1);
/* GEANT_GLOBAL_ELEMENT.make */
extern T0* T218c7(T0* a1);
/* GEANT_GLOBAL_ELEMENT.set_xml_element */
extern void T218f8(T0* C, T0* a1);
/* GEANT_LOCAL_ELEMENT.name */
extern T0* T217f2(T0* C);
/* GEANT_LOCAL_ELEMENT.attribute_value */
extern T0* T217f5(T0* C, T0* a1);
/* GEANT_LOCAL_ELEMENT.name_attribute_name */
extern T0* T217f3(T0* C);
/* GEANT_LOCAL_ELEMENT.has_name */
extern T1 T217f6(T0* C);
/* GEANT_LOCAL_ELEMENT.has_attribute */
extern T1 T217f4(T0* C, T0* a1);
/* GEANT_LOCAL_ELEMENT.make */
extern T0* T217c7(T0* a1);
/* GEANT_LOCAL_ELEMENT.set_xml_element */
extern void T217f8(T0* C, T0* a1);
/* GEANT_TARGET.empty_variables */
extern unsigned char ge10os1907;
extern T0* ge10ov1907;
extern T0* T26f18(T0* C);
/* GEANT_ARGUMENT_ELEMENT.name */
extern T0* T216f2(T0* C);
/* GEANT_ARGUMENT_ELEMENT.attribute_value */
extern T0* T216f5(T0* C, T0* a1);
/* GEANT_ARGUMENT_ELEMENT.name_attribute_name */
extern T0* T216f3(T0* C);
/* GEANT_ARGUMENT_ELEMENT.has_name */
extern T1 T216f6(T0* C);
/* GEANT_ARGUMENT_ELEMENT.has_attribute */
extern T1 T216f4(T0* C, T0* a1);
/* GEANT_ARGUMENT_ELEMENT.make */
extern T0* T216c7(T0* a1);
/* GEANT_ARGUMENT_ELEMENT.set_xml_element */
extern void T216f8(T0* C, T0* a1);
/* GEANT_TARGET.elements_by_name */
extern T0* T26f16(T0* C, T0* a1);
/* GEANT_TARGET.empty_argument_variables */
extern unsigned char ge10os1908;
extern T0* ge10ov1908;
extern T0* T26f42(T0* C);
/* GEANT_TARGET.set_execute_once */
extern void T26f71(T0* C, T1 a1);
/* GEANT_TARGET.boolean_value */
extern T1 T26f36(T0* C, T0* a1);
/* GEANT_TARGET.false_attribute_value */
extern unsigned char ge78os2560;
extern T0* ge78ov2560;
extern T0* T26f32(T0* C);
/* GEANT_TARGET.true_attribute_value */
extern unsigned char ge78os2559;
extern T0* ge78ov2559;
extern T0* T26f31(T0* C);
/* GEANT_TARGET.attribute_value */
extern T0* T26f29(T0* C, T0* a1);
/* GEANT_TARGET.once_attribute_name */
extern unsigned char ge12os2514;
extern T0* ge12ov2514;
extern T0* T26f27(T0* C);
/* GEANT_TARGET.set_exports */
extern void T26f70(T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].set_equality_tester */
extern void T70f37(T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].put */
extern void T70f29(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [detachable STRING_8].move_cursors_right */
extern void T70f34(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [detachable STRING_8].move_right */
extern void T70f33(T0* C, T6 a1, T6 a2);
/* GEANT_TARGET.export_attribute_name */
extern unsigned char ge12os2513;
extern T0* ge12ov2513;
extern T0* T26f20(T0* C);
/* GEANT_TARGET.set_obsolete_message */
extern void T26f69(T0* C, T0* a1);
/* GEANT_TARGET.set_name */
extern void T26f68(T0* C, T0* a1);
/* GEANT_TARGET.name_attribute_name */
extern unsigned char ge12os2510;
extern T0* ge12ov2510;
extern T0* T26f40(T0* C);
/* GEANT_TARGET.make */
extern void T26f63p1(T0* C, T0* a1, T0* a2);
/* GEANT_TARGET.set_project */
extern void T26f66(T0* C, T0* a1);
/* GEANT_TARGET.element_make */
extern void T26f65(T0* C, T0* a1);
/* GEANT_TARGET.set_xml_element */
extern void T26f73(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].item */
extern T0* T128f6(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].start */
extern void T128f9(T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_start */
extern void T127f10(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_off */
extern T1 T127f6(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].off */
extern T1 T128f7(T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].new_cursor */
extern T0* T127f5(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].make */
extern T0* T128c8(T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].set_key_equality_tester */
extern void T31f43(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_map */
extern T0* T31c42(T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_with_equality_testers */
extern void T31f46(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_sparse_container */
extern void T31f54(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].set_internal_cursor */
extern void T31f63(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_slots */
extern void T31f62(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_clashes */
extern void T31f61(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_key_storage */
extern void T31f60(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_item_storage */
extern void T31f59(T0* C, T6 a1);
/* GEANT_PROJECT_ELEMENT.elements_by_name */
extern T0* T30f11(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.string_ */
extern T0* T30f19(T0* C);
/* GEANT_PROJECT_ELEMENT.target_element_name */
extern unsigned char ge93os2693;
extern T0* ge93ov2693;
extern T0* T30f10(T0* C);
/* GEANT_PROJECT.set_default_target_name */
extern void T22f38(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.default_attribute_name */
extern unsigned char ge93os2689;
extern T0* ge93ov2689;
extern T0* T30f9(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.basename */
extern T0* T53f24(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_root_directory */
extern T1 T53f25(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.basename */
extern T0* T54f21(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.is_root_directory */
extern T1 T54f22(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.dirname */
extern T0* T53f23(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.dirname */
extern T0* T54f20(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.unix_file_system */
extern T0* T30f8(T0* C);
/* GEANT_PROJECT_ELEMENT.file_system */
extern T0* T30f7(T0* C);
/* GEANT_PROJECT_ELEMENT.windows_file_system */
extern T0* T30f18(T0* C);
/* GEANT_PROJECT_ELEMENT.operating_system */
extern T0* T30f17(T0* C);
/* GEANT_PROJECT.set_description */
extern void T22f37(T0* C, T0* a1);
/* XM_ELEMENT.has_element_by_name */
extern T1 T102f10(T0* C, T0* a1);
extern T1 T102f10ot1(T0* a1, T0** a2);
/* GEANT_PROJECT_ELEMENT.description_element_name */
extern T0* T30f6(T0* C);
/* GEANT_PROJECT_ELEMENT.attribute_value */
extern T0* T30f4(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.exit_application */
extern void T30f22(T0* C, T6 a1, T0* a2);
/* GEANT_PROJECT_ELEMENT.exceptions */
extern T0* T30f13(T0* C);
/* GEANT_PROJECT_ELEMENT.std */
extern T0* T30f12(T0* C);
/* GEANT_PROJECT_ELEMENT.log_messages */
extern void T30f25(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.has_attribute */
extern T1 T30f3(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.name_attribute_name */
extern unsigned char ge93os2688;
extern T0* ge93ov2688;
extern T0* T30f5(T0* C);
/* GEANT_PROJECT.make */
extern T0* T22c30(T0* a1, T0* a2, T0* a3);
/* GEANT_TASK_FACTORY.make */
extern T0* T210c55(T0* a1);
/* GEANT_TASK_FACTORY.create_builders */
extern void T210f56(T0* C);
/* Creation of agent #1 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac1(T0* a1);
/* Creation of agent #2 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac2(T0* a1);
/* Creation of agent #3 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac3(T0* a1);
/* Creation of agent #4 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac4(T0* a1);
/* Creation of agent #5 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac5(T0* a1);
/* Creation of agent #6 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac6(T0* a1);
/* Creation of agent #7 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac7(T0* a1);
/* Creation of agent #8 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac8(T0* a1);
/* Creation of agent #9 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac9(T0* a1);
/* Creation of agent #10 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac10(T0* a1);
/* Creation of agent #11 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac11(T0* a1);
/* Creation of agent #12 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac12(T0* a1);
/* Creation of agent #13 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac13(T0* a1);
/* Creation of agent #14 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac14(T0* a1);
/* Creation of agent #15 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac15(T0* a1);
/* Creation of agent #16 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac16(T0* a1);
/* Creation of agent #17 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac17(T0* a1);
/* Creation of agent #18 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac18(T0* a1);
/* Creation of agent #19 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac19(T0* a1);
/* Creation of agent #20 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac20(T0* a1);
/* Creation of agent #21 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac21(T0* a1);
/* Creation of agent #22 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac22(T0* a1);
/* Creation of agent #23 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac23(T0* a1);
/* Creation of agent #24 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac24(T0* a1);
/* Creation of agent #25 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T210f56ac25(T0* a1);
/* GEANT_TASK_FACTORY.new_replace_task */
extern T0* T210f52(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.make */
extern T0* T350c31(T0* a1, T0* a2);
/* GEANT_REPLACE_COMMAND.set_fileset */
extern void T478f38(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.make */
extern T0* T400c29(T0* a1, T0* a2);
/* GEANT_FILESET.set_map */
extern void T406f47(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.make */
extern T0* T508c12(T0* a1, T0* a2);
/* GEANT_MAP.set_map */
extern void T509f21(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.map_element_name */
extern unsigned char ge89os10077;
extern T0* ge89ov10077;
extern T0* T508f9(T0* C);
/* GEANT_MAP.set_target_pattern */
extern void T509f20(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.to_attribute_name */
extern unsigned char ge89os10076;
extern T0* ge89ov10076;
extern T0* T508f7(T0* C);
/* GEANT_MAP.set_source_pattern */
extern void T509f19(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.from_attribute_name */
extern unsigned char ge89os10075;
extern T0* ge89ov10075;
extern T0* T508f6(T0* C);
/* GEANT_MAP.set_type */
extern void T509f18(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.attribute_value */
extern T0* T508f5(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.project_variables_resolver */
extern T0* T508f11(T0* C);
/* GEANT_MAP_ELEMENT.has_attribute */
extern T1 T508f10(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.type_attribute_name */
extern unsigned char ge89os10074;
extern T0* ge89ov10074;
extern T0* T508f8(T0* C);
/* GEANT_MAP.make */
extern T0* T509c17(T0* a1);
/* GEANT_MAP.type_attribute_value_identity */
extern unsigned char ge88os10090;
extern T0* ge88ov10090;
extern T0* T509f6(T0* C);
/* GEANT_MAP_ELEMENT.make */
extern void T508f12p1(T0* C, T0* a1, T0* a2);
/* GEANT_MAP_ELEMENT.set_project */
extern void T508f14(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.element_make */
extern void T508f13(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.set_xml_element */
extern void T508f15(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.map_element_name */
extern unsigned char ge81os9733;
extern T0* ge81ov9733;
extern T0* T400f21(T0* C);
/* GEANT_FILESET.add_single_exclude */
extern void T406f46(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].force_last */
extern void T514f34(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].slots_put */
extern void T514f45(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING_8].clashes_put */
extern void T514f44(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING_8].slots_item */
extern T6 T514f19(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].hash_position */
extern T6 T514f17(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].resize */
extern void T514f43(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].clashes_resize */
extern void T514f49(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].special_integer_ */
extern T0* T514f26(T0* C);
/* DS_HASH_SET [STRING_8].key_storage_resize */
extern void T514f48(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_resize */
extern void T514f47(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].key_storage_item */
extern T0* T514f25(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_item */
extern T0* T514f28(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].clashes_item */
extern T6 T514f23(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].slots_resize */
extern void T514f46(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].new_modulus */
extern T6 T514f21(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].new_capacity */
extern T6 T514f27(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_put */
extern void T514f42(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [STRING_8].search_position */
extern void T514f41(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].key_equality_tester */
extern T0* T514f22(T0* C);
/* DS_HASH_SET [STRING_8].unset_found_item */
extern void T514f39(T0* C);
/* GEANT_FILESET_ELEMENT.exclude_element_name */
extern unsigned char ge81os9732;
extern T0* ge81ov9732;
extern T0* T400f19(T0* C);
/* GEANT_FILESET.add_single_include */
extern void T406f45(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.name */
extern T0* T418f4(T0* C);
/* GEANT_DEFINE_ELEMENT.attribute_value */
extern T0* T418f14(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.project_variables_resolver */
extern T0* T418f6(T0* C);
/* GEANT_DEFINE_ELEMENT.name_attribute_name */
extern T0* T418f13(T0* C);
/* GEANT_DEFINE_ELEMENT.has_name */
extern T1 T418f10(T0* C);
/* GEANT_DEFINE_ELEMENT.has_attribute */
extern T1 T418f9(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.is_enabled */
extern T1 T418f7(T0* C);
/* GEANT_DEFINE_ELEMENT.unless_attribute_name */
extern T0* T418f11(T0* C);
/* GEANT_DEFINE_ELEMENT.if_attribute_name */
extern T0* T418f8(T0* C);
/* GEANT_DEFINE_ELEMENT.make */
extern T0* T418c16(T0* a1, T0* a2);
/* GEANT_DEFINE_ELEMENT.set_project */
extern void T418f18(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.element_make */
extern void T418f17(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.set_xml_element */
extern void T418f19(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.elements_by_name */
extern T0* T400f18(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.string_ */
extern T0* T400f26(T0* C);
/* GEANT_FILESET_ELEMENT.include_element_name */
extern unsigned char ge81os9731;
extern T0* ge81ov9731;
extern T0* T400f17(T0* C);
/* GEANT_FILESET.set_convert_to_filesystem */
extern void T406f44(T0* C, T1 a1);
/* GEANT_FILESET_ELEMENT.convert_attribute_name */
extern unsigned char ge81os9729;
extern T0* ge81ov9729;
extern T0* T400f16(T0* C);
/* GEANT_FILESET.set_mapped_filename_directory_name */
extern void T406f43(T0* C, T0* a1);
/* GEANT_FILESET.set_filename_directory_name */
extern void T406f42(T0* C, T0* a1);
/* GEANT_FILESET.set_mapped_filename_variable_name */
extern void T406f41(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.mapped_filename_variable_name_attribute_name */
extern unsigned char ge81os9727;
extern T0* ge81ov9727;
extern T0* T400f15(T0* C);
/* GEANT_FILESET.set_filename_variable_name */
extern void T406f40(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.filename_variable_name_attribute_name */
extern unsigned char ge81os9726;
extern T0* ge81ov9726;
extern T0* T400f14(T0* C);
/* GEANT_FILESET.set_concat */
extern void T406f39(T0* C, T1 a1);
/* GEANT_FILESET.set_force */
extern void T406f38(T0* C, T1 a1);
/* GEANT_FILESET_ELEMENT.boolean_value */
extern T1 T400f13(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.std */
extern T0* T400f23(T0* C);
/* GEANT_FILESET_ELEMENT.false_attribute_value */
extern T0* T400f28(T0* C);
/* GEANT_FILESET_ELEMENT.true_attribute_value */
extern T0* T400f27(T0* C);
/* GEANT_FILESET_ELEMENT.force_attribute_name */
extern unsigned char ge81os9724;
extern T0* ge81ov9724;
extern T0* T400f12(T0* C);
/* GEANT_FILESET.set_exclude_wc_string */
extern void T406f37(T0* C, T0* a1);
/* LX_DFA_WILDCARD.is_compiled */
extern T1 T516f14(T0* C);
/* LX_DFA_WILDCARD.compile */
extern T0* T516c16(T0* a1, T1 a2);
/* LX_FULL_DFA.make */
extern T0* T552c37(T0* a1);
/* LX_FULL_DFA.build */
extern void T552f40(T0* C);
/* LX_FULL_DFA.build_accept_table */
extern void T552f46(T0* C);
/* ARRAY [INTEGER_32].put */
extern void T225f14(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [LX_RULE].first */
extern T0* T570f6(T0* C);
/* ARRAY [INTEGER_32].make_filled */
extern T0* T225c10(T6 a1, T6 a2, T6 a3);
/* ARRAY [INTEGER_32].make_filled_area */
extern void T225f12(T0* C, T6 a1, T6 a2);
/* LX_FULL_DFA.build_nxt_table */
extern void T552f45(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].target */
extern T0* T601f6(T0* C, T6 a1);
/* ARRAY [detachable LX_DFA_STATE].item */
extern T0* T647f4(T0* C, T6 a1);
/* LX_DFA_STATE.is_accepting */
extern T1 T595f10(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].is_empty */
extern T1 T570f11(T0* C);
/* LX_FULL_DFA.build_transitions */
extern void T552f44(T0* C, T0* a1);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].set_target */
extern void T601f8(T0* C, T0* a1, T6 a2);
/* ARRAY [detachable LX_DFA_STATE].put */
extern void T647f9(T0* C, T0* a1, T6 a2);
/* LX_SYMBOL_PARTITIONS.previous_symbol */
extern T6 T598f4(T0* C, T6 a1);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].item */
extern T0* T631f4(T0* C, T6 a1);
/* LX_FULL_DFA.new_state */
extern T0* T552f36(T0* C, T0* a1);
/* LX_DFA_STATE.set_id */
extern void T595f17(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].put_last */
extern void T597f9(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].force */
extern void T644f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [LX_DFA_STATE].fill_with */
extern void T643f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [LX_DFA_STATE].extend */
extern void T643f9(T0* C, T0* a1);
/* LX_DFA_STATE.is_equal */
extern T1 T595f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].is_equal */
extern T1 T596f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].any_ */
extern T0* T596f17(T0* C);
/* LX_DFA_STATE.any_ */
extern T0* T595f14(T0* C);
/* LX_DFA_STATE.new_state */
extern T0* T595f9(T0* C, T6 a1);
/* LX_DFA_STATE.make */
extern T0* T595c16(T0* a1, T6 a2, T6 a3);
extern T1 T595f16ot1(T0* a1, T0** a2);
/* LX_RULE.set_useful */
extern void T582f22(T0* C, T1 a1);
/* DS_ARRAYED_LIST [LX_RULE].sort */
extern void T570f17(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_RULE].sort */
extern void T636f3(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_RULE].sort_with_comparator */
extern void T636f4(T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [LX_RULE].subsort_with_comparator */
extern void T636f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* DS_ARRAYED_LIST [LX_RULE].replace */
extern void T570f22(T0* C, T0* a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [LX_RULE].less_than */
extern T1 T666f1(T0* C, T0* a1, T0* a2);
/* LX_RULE.is_less */
extern T1 T582f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].item */
extern T0* T570f10(T0* C, T6 a1);
/* LX_DFA_STATE.rule_sorter */
extern unsigned char ge263os11186;
extern T0* ge263ov11186;
extern T0* T595f7(T0* C);
/* DS_BUBBLE_SORTER [LX_RULE].make */
extern T0* T636c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [LX_RULE].make */
extern T0* T666c2(void);
/* DS_ARRAYED_LIST [LX_NFA_STATE].sort */
extern void T596f25(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].sort */
extern void T634f3(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].sort_with_comparator */
extern void T634f4(T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].subsort_with_comparator */
extern void T634f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* DS_ARRAYED_LIST [LX_NFA_STATE].replace */
extern void T596f22(T0* C, T0* a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE].less_than */
extern T1 T669f1(T0* C, T0* a1, T0* a2);
/* LX_NFA_STATE.is_less */
extern T1 T604f7(T0* C, T0* a1);
/* LX_DFA_STATE.bubble_sorter */
extern unsigned char ge263os11185;
extern T0* ge263ov11185;
extern T0* T595f8(T0* C);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].make */
extern T0* T634c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE].make */
extern T0* T669c2(void);
/* DS_ARRAYED_LIST [LX_NFA_STATE].last */
extern T0* T596f9(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].is_empty */
extern T1 T596f8(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].force_last */
extern void T570f13(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].force */
extern void T614f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [LX_RULE].fill_with */
extern void T593f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [LX_RULE].extend */
extern void T593f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].resize */
extern void T570f15(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].aliased_resized_area */
extern T0* T614f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_RULE].aliased_resized_area */
extern T0* T593f4(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].new_capacity */
extern T6 T570f9(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].extendible */
extern T1 T570f8(T0* C, T6 a1);
/* LX_NFA_STATE.is_accepting_head */
extern T1 T604f6(T0* C);
/* LX_NFA_STATE.has_transition */
extern T1 T604f9(T0* C);
/* LX_NFA_STATE.is_accepting */
extern T1 T604f8(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].has */
extern T1 T596f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].force_last */
extern void T596f23(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].force */
extern void T640f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [LX_NFA_STATE].fill_with */
extern void T638f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [LX_NFA_STATE].extend */
extern void T638f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].resize */
extern void T596f28(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].aliased_resized_area */
extern T0* T640f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_NFA_STATE].aliased_resized_area */
extern T0* T638f4(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].new_capacity */
extern T6 T596f12(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].extendible */
extern T1 T596f11(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].make */
extern T0* T570c12(T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].set_internal_cursor */
extern void T570f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].new_cursor */
extern T0* T570f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_RULE].make */
extern T0* T615c4(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].make */
extern T0* T614f1(T0* C, T6 a1);
/* ARRAY [LX_RULE].make_empty */
extern T0* T594c7(void);
/* ARRAY [LX_RULE].make_empty_area */
extern void T594f9(T0* C, T6 a1);
/* SPECIAL [LX_RULE].make_empty */
extern void T593f7(T0* C, T6 a1);
/* SPECIAL [LX_RULE].make_empty */
extern T0* T593c7(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].default_create */
extern T0* T614c3(void);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].make */
extern T0* T601c7(T6 a1, T6 a2);
/* KL_ARRAY_ROUTINES [detachable LX_DFA_STATE].default_create */
extern T0* T648c1(void);
/* ARRAY [detachable LX_DFA_STATE].make_filled */
extern T0* T647c5(T0* a1, T6 a2, T6 a3);
/* ARRAY [detachable LX_DFA_STATE].make_filled_area */
extern void T647f7(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_DFA_STATE].make_filled */
extern T0* T643c5(T0* a1, T6 a2);
/* SPECIAL [LX_DFA_STATE].make_empty */
extern void T643f8(T0* C, T6 a1);
/* SPECIAL [LX_DFA_STATE].make_empty */
extern T0* T643c8(T6 a1);
/* LX_DFA_STATE.maximum_symbol */
extern T6 T595f13(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].upper */
extern T6 T601f5(T0* C);
/* LX_DFA_STATE.minimum_symbol */
extern T6 T595f12(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].lower */
extern T6 T601f4(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put_last */
extern void T596f20(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].item */
extern T0* T596f13(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].make */
extern T0* T596c19(T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].set_internal_cursor */
extern void T596f26(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].new_cursor */
extern T0* T596f10(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].make */
extern T0* T641c9(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].make */
extern T0* T640f1(T0* C, T6 a1);
/* ARRAY [LX_NFA_STATE].make_empty */
extern T0* T673c4(void);
/* ARRAY [LX_NFA_STATE].make_empty_area */
extern void T673f5(T0* C, T6 a1);
/* SPECIAL [LX_NFA_STATE].make_empty */
extern T0* T638c5(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].default_create */
extern T0* T640c3(void);
/* LX_SYMBOL_PARTITIONS.is_representative */
extern T1 T598f8(T0* C, T6 a1);
/* ARRAY [BOOLEAN].item */
extern T1 T270f4(T0* C, T6 a1);
/* LX_DFA_STATE.partition */
extern void T595f18(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.initialize */
extern void T598f10(T0* C);
/* ARRAY [BOOLEAN].clear_all */
extern void T270f9(T0* C);
/* SPECIAL [BOOLEAN].fill_with */
extern void T177f8(T0* C, T1 a1, T6 a2, T6 a3);
/* SPECIAL [BOOLEAN].extend */
extern void T177f10(T0* C, T1 a1);
/* LX_SYMBOL_PARTITIONS.initialize */
extern void T598f10p1(T0* C);
/* DS_BILINKABLE [INTEGER_32].put_left */
extern void T629f9(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].attach_right */
extern void T629f10(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].put */
extern void T629f5(T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.lower */
extern T6 T598f7(T0* C);
/* LX_SYMBOL_PARTITIONS.upper */
extern T6 T598f6(T0* C);
/* LX_FULL_DFA.resize */
extern void T552f49(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].resize */
extern void T597f10(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].aliased_resized_area */
extern T0* T644f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_DFA_STATE].aliased_resized_area */
extern T0* T643f4(T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.capacity */
extern T6 T598f5(T0* C);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].count */
extern T6 T631f5(T0* C);
/* DS_ARRAYED_LIST [LX_DFA_STATE].item */
extern T0* T597f7(T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.make */
extern T0* T598c9(T6 a1, T6 a2);
/* LX_SYMBOL_PARTITIONS.make */
extern void T598f9p1(T0* C, T6 a1, T6 a2);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].put */
extern void T631f7(T0* C, T0* a1, T6 a2);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].make_filled */
extern T0* T631c6(T0* a1, T6 a2, T6 a3);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].make_filled_area */
extern void T631f8(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKABLE [INTEGER_32]].make_filled */
extern T0* T630c4(T0* a1, T6 a2);
/* SPECIAL [DS_BILINKABLE [INTEGER_32]].fill_with */
extern void T630f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKABLE [INTEGER_32]].extend */
extern void T630f8(T0* C, T0* a1);
/* SPECIAL [DS_BILINKABLE [INTEGER_32]].make_empty */
extern void T630f6(T0* C, T6 a1);
/* DS_BILINKABLE [INTEGER_32].make */
extern T0* T629c4(T6 a1);
/* ARRAY [BOOLEAN].make_filled */
extern T0* T270c7(T1 a1, T6 a2, T6 a3);
/* ARRAY [BOOLEAN].make_filled_area */
extern void T270f10(T0* C, T1 a1, T6 a2);
/* SPECIAL [BOOLEAN].make_filled */
extern T0* T177c12(T1 a1, T6 a2);
/* SPECIAL [BOOLEAN].make_empty */
extern void T177f6(T0* C, T6 a1);
/* SPECIAL [BOOLEAN].make_empty */
extern T0* T177c6(T6 a1);
/* LX_FULL_DFA.put_eob_state */
extern void T552f39(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].force_first */
extern void T570f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].put */
extern void T570f18(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [LX_RULE].move_cursors_right */
extern void T570f21(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_RULE].set_position */
extern void T615f5(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].move_right */
extern void T570f20(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [LX_RULE].put_last */
extern void T570f19(T0* C, T0* a1);
/* LX_RULE.make_default */
extern T0* T582c14(T6 a1);
/* LX_RULE.dummy_action */
extern unsigned char ge343os12559;
extern T0* ge343ov12559;
extern T0* T582f11(T0* C);
/* LX_ACTION.make */
extern T0* T633c2(T0* a1);
/* LX_RULE.dummy_pattern */
extern unsigned char ge343os12558;
extern T0* ge343ov12558;
extern T0* T582f12(T0* C);
/* LX_NFA.make_epsilon */
extern T0* T579c12(T1 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put_first */
extern void T596f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put */
extern void T596f27(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [LX_NFA_STATE].move_cursors_right */
extern void T596f31(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_position */
extern void T641f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].move_right */
extern void T596f30(T0* C, T6 a1, T6 a2);
/* LX_NFA_STATE.set_transition */
extern void T604f11(T0* C, T0* a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].make */
extern T0* T626c3(T0* a1);
/* LX_NFA_STATE.make */
extern T0* T604c10(T1 a1);
/* LX_FULL_DFA.initialize */
extern void T552f38(T0* C, T0* a1);
/* LX_FULL_DFA.initialize_dfa */
extern void T552f43(T0* C, T0* a1, T6 a2, T6 a3);
/* LX_FULL_DFA.put_start_condition */
extern void T552f48(T0* C, T0* a1);
/* LX_NFA.start_state */
extern T0* T579f4(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].first */
extern T0* T596f14(T0* C);
/* DS_ARRAYED_LIST [LX_NFA].item */
extern T0* T602f7(T0* C, T6 a1);
/* LX_START_CONDITIONS.item */
extern T0* T571f9(T0* C, T6 a1);
/* LX_FULL_DFA.set_nfa_state_ids */
extern void T552f47(T0* C, T0* a1);
/* LX_NFA_STATE.set_id */
extern void T604f14(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].force */
extern void T603f35(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].key_storage_put */
extern void T603f43(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].slots_put */
extern void T603f42(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].clashes_put */
extern void T603f41(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].slots_item */
extern T6 T603f29(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].clashes_item */
extern T6 T603f28(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].hash_position */
extern T6 T603f22(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].resize */
extern void T603f40(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].clashes_resize */
extern void T603f48(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].special_integer_ */
extern T0* T603f31(T0* C);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].key_storage_resize */
extern void T603f47(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].aliased_resized_area */
extern T0* T65f3(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item_storage_resize */
extern void T603f46(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].aliased_resized_area */
extern T0* T578f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_NFA].aliased_resized_area */
extern T0* T580f4(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].key_storage_item */
extern T6 T603f21(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].slots_resize */
extern void T603f45(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].new_modulus */
extern T6 T603f25(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].new_capacity */
extern T6 T603f33(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item_storage_put */
extern void T603f39(T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [LX_NFA].force */
extern void T578f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [LX_NFA].fill_with */
extern void T580f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [LX_NFA].extend */
extern void T580f9(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].search_position */
extern void T603f36(T0* C, T6 a1);
/* detachable KL_EQUALITY_TESTER [INTEGER_32].test */
extern T1 T555f1(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].unset_found_item */
extern void T603f38(T0* C);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item */
extern T0* T603f23(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item_storage_item */
extern T0* T603f32(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].has */
extern T1 T603f24(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make */
extern T0* T603c34(T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_with_equality_testers */
extern void T603f37(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_sparse_container */
extern void T603f44(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].set_internal_cursor */
extern void T603f53(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].new_cursor */
extern T0* T603f30(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32].make */
extern T0* T651c4(T0* a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_slots */
extern void T603f52(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_clashes */
extern void T603f51(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_key_storage */
extern void T603f50(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_item_storage */
extern void T603f49(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].make */
extern T0* T578f1(T0* C, T6 a1);
/* ARRAY [LX_NFA].make_empty */
extern T0* T623c4(void);
/* ARRAY [LX_NFA].make_empty_area */
extern void T623f5(T0* C, T6 a1);
/* SPECIAL [LX_NFA].make_empty */
extern T0* T580c5(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].default_create */
extern T0* T578c3(void);
/* detachable KL_EQUALITY_TESTER [INTEGER_32].default_create */
extern T0* T555c2(void);
/* DS_ARRAYED_LIST [LX_DFA_STATE].make */
extern T0* T597c8(T6 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].set_internal_cursor */
extern void T597f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].new_cursor */
extern T0* T597f6(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].make */
extern T0* T645c3(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].make */
extern T0* T644f1(T0* C, T6 a1);
/* ARRAY [detachable LX_DFA_STATE].make_empty */
extern T0* T647c6(void);
/* ARRAY [detachable LX_DFA_STATE].make_empty_area */
extern void T647f8(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].default_create */
extern T0* T644c3(void);
/* LX_EQUIVALENCE_CLASSES.to_array */
extern T0* T581f6(T0* C, T6 a1, T6 a2);
/* LX_EQUIVALENCE_CLASSES.lower */
extern T6 T581f5(T0* C);
/* LX_EQUIVALENCE_CLASSES.upper */
extern T6 T581f4(T0* C);
/* LX_EQUIVALENCE_CLASSES.built */
extern T1 T581f3(T0* C);
/* LX_FULL_DFA.build_eof_rules */
extern void T552f42(T0* C, T0* a1, T6 a2, T6 a3);
/* ARRAY [LX_RULE].put */
extern void T594f5(T0* C, T0* a1, T6 a2);
/* ARRAY [LX_RULE].make_filled */
extern T0* T594c4(T0* a1, T6 a2, T6 a3);
/* ARRAY [LX_RULE].make_filled_area */
extern void T594f6(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_RULE].make_filled */
extern T0* T593c5(T0* a1, T6 a2);
/* ARRAY [STRING_8].count */
extern T6 T33f10(T0* C);
/* LX_FULL_DFA.build_rules */
extern void T552f41(T0* C, T0* a1);
/* KL_ARRAY_ROUTINES [LX_RULE].make_empty_with_lower */
extern T0* T599f1(T0* C, T6 a1);
/* ARRAY [LX_RULE].make_from_array */
extern T0* T594c8(T0* a1);
/* ARRAY [LX_RULE].set_area */
extern void T594f10(T0* C, T0* a1);
/* KL_ARRAY [LX_RULE].new_rebase */
extern void T646f5(T0* C, T6 a1);
/* KL_ARRAY [LX_RULE].make_empty */
extern T0* T646c4(void);
/* KL_ARRAY [LX_RULE].make_empty_area */
extern void T646f6(T0* C, T6 a1);
/* KL_ARRAY_ROUTINES [LX_RULE].default_create */
extern T0* T599c2(void);
/* LX_START_CONDITIONS.names */
extern T0* T571f7(T0* C);
/* LX_START_CONDITIONS.first */
extern T0* T571f6(T0* C);
/* LX_START_CONDITIONS.string_array_routines */
extern unsigned char ge122os3011;
extern T0* ge122ov3011;
extern T0* T571f11(T0* C);
/* LX_WILDCARD_PARSER.parse_string */
extern void T550f219(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.parse */
extern void T550f223(T0* C);
/* LX_WILDCARD_PARSER.yy_pop_last_value */
extern void T550f236(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_push_error_value */
extern void T550f235(T0* C);
/* KL_SPECIAL_ROUTINES [detachable ANY].force */
extern void T153f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [detachable ANY].fill_with */
extern void T154f6(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [detachable ANY].extend */
extern void T154f8(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [detachable ANY].aliased_resized_area */
extern T0* T153f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [detachable ANY].aliased_resized_area */
extern T0* T154f3(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_do_action */
extern void T550f234(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.append_character_to_string */
extern T0* T550f170(T0* C, T6 a1, T0* a2);
/* LX_WILDCARD_PARSER.new_symbol_nfa */
extern T0* T550f215(T0* C, T6 a1);
/* LX_NFA.make_symbol */
extern T0* T579c13(T6 a1, T1 a2);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].make */
extern T0* T628c4(T6 a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].force_new */
extern void T575f44(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].key_storage_put */
extern void T575f52(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item_storage_put */
extern void T575f48(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].slots_put */
extern void T575f51(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].clashes_put */
extern void T575f50(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].slots_item */
extern T6 T575f22(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].hash_position */
extern T6 T575f31(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].clashes_item */
extern T6 T575f21(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].resize */
extern void T575f49(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].clashes_resize */
extern void T575f57(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].special_integer_ */
extern T0* T575f34(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].key_storage_resize */
extern void T575f56(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item_storage_resize */
extern void T575f55(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].key_storage_item */
extern T0* T575f26(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].slots_resize */
extern void T575f54(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].new_modulus */
extern T6 T575f29(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].new_capacity */
extern T6 T575f30(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].unset_found_item */
extern void T575f47(T0* C);
/* LX_EQUIVALENCE_CLASSES.add */
extern void T581f11(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].forget_right */
extern void T629f7(T0* C);
/* DS_BILINKABLE [INTEGER_32].forget_left */
extern void T629f8(T0* C);
/* ARRAY [BOOLEAN].put */
extern void T270f8(T0* C, T1 a1, T6 a2);
/* DS_BILINKABLE [INTEGER_32].put_right */
extern void T629f6(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].attach_left */
extern void T629f11(T0* C, T0* a1);
/* LX_SYMBOL_CLASS.item */
extern T6 T574f14(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.put */
extern void T574f19(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.force_last */
extern void T574f22(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.resize */
extern void T574f23(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.new_capacity */
extern T6 T574f13(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.extendible */
extern T1 T574f11(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.last */
extern T6 T574f12(T0* C);
/* LX_SYMBOL_CLASS.is_empty */
extern T1 T574f10(T0* C);
/* LX_SYMBOL_CLASS.has */
extern T1 T574f9(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.arrayed_has */
extern T1 T574f15(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.make */
extern T0* T574c18(T6 a1);
/* LX_SYMBOL_CLASS.set_internal_cursor */
extern void T574f21(T0* C, T0* a1);
/* LX_SYMBOL_CLASS.new_cursor */
extern T0* T574f16(T0* C);
/* DS_ARRAYED_LIST_CURSOR [INTEGER_32].make */
extern T0* T619c3(T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].found_item */
extern T0* T575f24(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item_storage_item */
extern T0* T575f32(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].found */
extern T1 T575f23(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].search */
extern void T575f43(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].search_position */
extern void T575f45(T0* C, T0* a1);
/* KL_STRING_EQUALITY_TESTER.test */
extern T1 T564f1(T0* C, T0* a1, T0* a2);
/* LX_WILDCARD_PARSER.new_epsilon_nfa */
extern T0* T550f169(T0* C);
/* LX_WILDCARD_PARSER.append_character_set_to_character_class */
extern T0* T550f168(T0* C, T6 a1, T6 a2, T0* a3);
/* LX_WILDCARD_PARSER.report_negative_range_in_character_class_error */
extern void T550f267(T0* C);
/* UT_ERROR_HANDLER.report_error */
extern void T28f11(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_error_message */
extern void T28f12(T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_line */
extern void T557f4(T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_new_line */
extern void T557f6(T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_string */
extern void T557f5(T0* C, T0* a1);
/* UT_ERROR_HANDLER.message */
extern T0* T28f5(T0* C, T0* a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.make */
extern T0* T606c8(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.filename */
extern T0* T550f188(T0* C);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].aliased_resized_area */
extern T0* T576f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_SYMBOL_CLASS].aliased_resized_area */
extern T0* T577f3(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.append_character_to_character_class */
extern T0* T550f167(T0* C, T6 a1, T0* a2);
/* LX_WILDCARD_PARSER.new_character_class */
extern T0* T550f166(T0* C);
/* LX_SYMBOL_CLASS.set_negated */
extern void T574f20(T0* C, T1 a1);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].force */
extern void T576f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [LX_SYMBOL_CLASS].fill_with */
extern void T577f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [LX_SYMBOL_CLASS].extend */
extern void T577f9(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].force */
extern void T575f42(T0* C, T0* a1, T0* a2);
/* LX_WILDCARD_PARSER.new_nfa_from_character_class */
extern T0* T550f165(T0* C, T0* a1);
/* LX_SYMBOL_CLASS.sort */
extern void T574f25(T0* C);
/* LX_SYMBOL_CLASS.arrayed_sort */
extern void T574f27(T0* C, T0* a1);
/* DS_SHELL_SORTER [INTEGER_32].sort */
extern void T676f3(T0* C, T0* a1);
/* DS_SHELL_SORTER [INTEGER_32].sort_with_comparator */
extern void T676f4(T0* C, T0* a1, T0* a2);
/* DS_SHELL_SORTER [INTEGER_32].subsort_with_comparator */
extern void T676f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* LX_SYMBOL_CLASS.replace */
extern void T574f26(T0* C, T6 a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [INTEGER_32].less_than */
extern T1 T681f1(T0* C, T6 a1, T6 a2);
/* LX_SYMBOL_CLASS.sorter */
extern unsigned char ge268os12593;
extern T0* ge268ov12593;
extern T0* T574f17(T0* C);
/* DS_SHELL_SORTER [INTEGER_32].make */
extern T0* T676c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [INTEGER_32].make */
extern T0* T681c2(void);
/* LX_WILDCARD_PARSER.new_symbol_class_nfa */
extern T0* T550f163(T0* C, T0* a1);
/* LX_NFA.make_symbol_class */
extern T0* T579c6(T0* a1, T1 a2);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].make */
extern T0* T624c4(T0* a1, T0* a2);
/* LX_WILDCARD_PARSER.question_character_class */
extern T0* T550f162(T0* C);
/* LX_NFA.build_optional */
extern void T579f11(T0* C);
/* LX_NFA_STATE.set_epsilon_transition */
extern void T604f12(T0* C, T0* a1);
/* LX_NFA.final_state */
extern T0* T579f5(T0* C);
/* LX_NFA.build_positive_closure */
extern void T579f10(T0* C);
/* LX_NFA.build_closure */
extern void T579f9(T0* C);
/* LX_WILDCARD_PARSER.new_nfa_from_character */
extern T0* T550f161(T0* C, T6 a1);
/* LX_NFA.build_concatenation */
extern void T579f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].append_last */
extern void T596f24(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].extend_last */
extern void T596f29(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].forth */
extern void T641f12(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_forth */
extern void T596f33(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].add_traversing_cursor */
extern void T596f34(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_next_cursor */
extern void T641f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].remove_traversing_cursor */
extern void T596f35(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].item */
extern T0* T641f4(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_item */
extern T0* T596f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].after */
extern T1 T641f6(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].start */
extern void T641f11(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_start */
extern void T596f32(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_after */
extern void T641f13(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].off */
extern T1 T641f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].before */
extern T1 T641f8(T0* C);
/* LX_NFA.build_union */
extern void T579f7(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.report_unrecognized_rule_error */
extern void T550f249(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.make */
extern T0* T585c8(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.process_rule */
extern void T550f248(T0* C, T0* a1);
/* LX_START_CONDITIONS.add_nfa_to_all */
extern void T571f13(T0* C, T0* a1);
/* LX_START_CONDITION.put_nfa */
extern void T600f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA].force_last */
extern void T602f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA].resize */
extern void T602f13(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA].new_capacity */
extern T6 T602f9(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA].extendible */
extern T1 T602f8(T0* C, T6 a1);
/* LX_START_CONDITIONS.add_nfa_to_non_exclusive */
extern void T571f15(T0* C, T0* a1);
/* LX_START_CONDITIONS.is_empty */
extern T1 T571f8(T0* C);
/* LX_DESCRIPTION.set_variable_trail_context */
extern void T551f34(T0* C, T1 a1);
/* LX_RULE.set_column_count */
extern void T582f21(T0* C, T6 a1);
/* LX_RULE.set_line_count */
extern void T582f20(T0* C, T6 a1);
/* LX_RULE.set_trail_count */
extern void T582f19(T0* C, T6 a1);
/* LX_RULE.set_head_count */
extern void T582f18(T0* C, T6 a1);
/* LX_RULE.set_trail_context */
extern void T582f17(T0* C, T1 a1);
/* LX_RULE.set_line_nb */
extern void T582f16(T0* C, T6 a1);
/* LX_RULE.set_pattern */
extern void T582f15(T0* C, T0* a1);
/* LX_NFA.set_accepted_rule */
extern void T579f14(T0* C, T0* a1);
/* LX_NFA_STATE.set_accepted_rule */
extern void T604f13(T0* C, T0* a1);
/* LX_DESCRIPTION.create_equiv_classes */
extern void T551f33(T0* C);
/* LX_EQUIVALENCE_CLASSES.make */
extern T0* T581c9(T6 a1, T6 a2);
/* LX_EQUIVALENCE_CLASSES.initialize */
extern void T581f12(T0* C);
/* LX_WILDCARD_PARSER.check_options */
extern void T550f247(T0* C);
/* LX_WILDCARD_PARSER.report_full_and_variable_trailing_context_error */
extern void T550f262(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.make */
extern T0* T591c8(void);
/* LX_WILDCARD_PARSER.report_full_and_reject_error */
extern void T550f261(T0* C);
/* LX_FULL_AND_REJECT_ERROR.make */
extern T0* T590c8(void);
/* LX_WILDCARD_PARSER.report_full_and_meta_equiv_classes_error */
extern void T550f260(T0* C);
/* LX_FULL_AND_META_ERROR.make */
extern T0* T589c8(void);
/* LX_WILDCARD_PARSER.build_equiv_classes */
extern void T550f246(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].forth */
extern void T584f11(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_forth */
extern void T575f64(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].add_traversing_cursor */
extern void T575f66(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].set_next_cursor */
extern void T584f14(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].set_position */
extern void T584f13(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].remove_traversing_cursor */
extern void T575f65(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].set_after */
extern void T584f12(T0* C);
/* LX_SYMBOL_CLASS.convert_to_equivalence */
extern void T574f24(T0* C, T0* a1);
/* LX_EQUIVALENCE_CLASSES.equivalence_class */
extern T6 T581f8(T0* C, T6 a1);
/* LX_EQUIVALENCE_CLASSES.is_representative */
extern T1 T581f7(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].item */
extern T0* T584f5(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_item */
extern T0* T575f36(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].after */
extern T1 T584f7(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].start */
extern void T584f10(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_start */
extern void T575f63(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_off */
extern T1 T575f39(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].off */
extern T1 T584f8(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].is_empty */
extern T1 T575f38(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].new_cursor */
extern T0* T575f35(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].make */
extern T0* T584c9(T0* a1);
/* LX_EQUIVALENCE_CLASSES.build */
extern void T581f10(T0* C);
/* LX_WILDCARD_PARSER.yy_push_last_value */
extern void T550f233(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.accept */
extern void T550f232(T0* C);
/* LX_WILDCARD_PARSER.yy_do_error_action */
extern void T550f230(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.report_error */
extern void T550f245(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.make */
extern T0* T583c8(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.report_eof_expected_error */
extern void T550f244(T0* C);
/* LX_WILDCARD_PARSER.read_token */
extern void T550f229(T0* C);
/* LX_WILDCARD_PARSER.yy_execute_action */
extern void T550f243(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.report_bad_character_error */
extern void T550f259(T0* C, T0* a1);
/* LX_BAD_CHARACTER_ERROR.make */
extern T0* T588c8(T0* a1, T6 a2, T0* a3);
/* LX_WILDCARD_PARSER.report_bad_character_class_error */
extern void T550f258(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.make */
extern T0* T587c8(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.start_condition */
extern T6 T550f183(T0* C);
/* LX_WILDCARD_PARSER.process_escaped_character */
extern void T550f257(T0* C);
/* LX_WILDCARD_PARSER.text_count */
extern T6 T550f204(T0* C);
/* LX_WILDCARD_PARSER.report_missing_quote_error */
extern void T550f256(T0* C);
/* LX_MISSING_QUOTE_ERROR.make */
extern T0* T586c8(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.process_character */
extern void T550f255(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.report_character_out_of_range_error */
extern void T550f265(T0* C, T0* a1);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.make */
extern T0* T592c8(T0* a1, T6 a2, T0* a3);
/* LX_WILDCARD_PARSER.text_item */
extern T2 T550f180(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.less */
extern void T550f254(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_set_line_column */
extern void T550f264(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item */
extern T0* T575f33(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].has */
extern T1 T575f27(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.text */
extern T0* T550f174(T0* C);
/* KL_CHARACTER_BUFFER.substring */
extern T0* T387f3(T0* C, T6 a1, T6 a2);
/* LX_WILDCARD_PARSER.set_start_condition */
extern void T550f253(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_execute_eof_action */
extern void T550f242(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.terminate */
extern void T550f252(T0* C);
/* LX_WILDCARD_PARSER.wrap */
extern T1 T550f147(T0* C);
/* LX_WILDCARD_PARSER.yy_refill_input_buffer */
extern void T550f241(T0* C);
/* LX_WILDCARD_PARSER.yy_set_content */
extern void T550f239(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.count */
extern T6 T387f4(T0* C);
/* YY_BUFFER.fill */
extern void T241f15(T0* C);
/* YY_BUFFER.set_index */
extern void T241f13(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_null_trans_state */
extern T6 T550f146(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_previous_state */
extern T6 T550f145(T0* C);
/* LX_WILDCARD_PARSER.fatal_error */
extern void T550f240(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.std */
extern T0* T550f171(T0* C);
/* KL_CHARACTER_BUFFER.item */
extern T2 T387f6(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.special_integer_ */
extern T0* T550f127(T0* C);
/* LX_WILDCARD_PARSER.yy_init_value_stacks */
extern void T550f228(T0* C);
/* LX_WILDCARD_PARSER.yy_clear_all */
extern void T550f237(T0* C);
/* LX_WILDCARD_PARSER.clear_all */
extern void T550f250(T0* C);
/* LX_WILDCARD_PARSER.clear_stacks */
extern void T550f263(T0* C);
/* LX_WILDCARD_PARSER.yy_clear_value_stacks */
extern void T550f266(T0* C);
/* SPECIAL [LX_NFA].keep_head */
extern void T580f8(T0* C, T6 a1);
/* SPECIAL [LX_NFA].set_count */
extern void T580f10(T0* C, T6 a1);
/* SPECIAL [LX_SYMBOL_CLASS].keep_head */
extern void T577f8(T0* C, T6 a1);
/* SPECIAL [LX_SYMBOL_CLASS].set_count */
extern void T577f10(T0* C, T6 a1);
/* SPECIAL [INTEGER_32].keep_head */
extern void T63f16(T0* C, T6 a1);
/* SPECIAL [INTEGER_32].set_count */
extern void T63f17(T0* C, T6 a1);
/* SPECIAL [detachable ANY].keep_head */
extern void T154f7(T0* C, T6 a1);
/* SPECIAL [detachable ANY].set_count */
extern void T154f9(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.abort */
extern void T550f231(T0* C);
/* LX_WILDCARD_PARSER.set_input_buffer */
extern void T550f222(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_load_input_buffer */
extern void T550f227(T0* C);
/* YY_BUFFER.set_position */
extern void T241f14(T0* C, T6 a1, T6 a2, T6 a3);
/* LX_WILDCARD_PARSER.new_string_buffer */
extern T0* T550f129(T0* C, T0* a1);
/* YY_BUFFER.make */
extern T0* T241c12(T0* a1);
/* YY_BUFFER.make_from_buffer */
extern void T241f16(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.put */
extern void T387f9(T0* C, T2 a1, T6 a2);
/* KL_CHARACTER_BUFFER.fill_from_string */
extern void T387f8(T0* C, T0* a1, T6 a2);
/* STRING_8.subcopy */
extern void T17f59(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* YY_BUFFER.new_default_buffer */
extern T0* T241f11(T0* C, T6 a1);
/* KL_CHARACTER_BUFFER.make */
extern T0* T387c7(T6 a1);
/* STRING_8.make_filled */
extern T0* T17c58(T2 a1, T6 a2);
/* LX_WILDCARD_PARSER.make_from_description */
extern T0* T550c218(T0* a1, T0* a2);
/* DS_ARRAYED_STACK [INTEGER_32].make */
extern T0* T573c4(T6 a1);
/* LX_ACTION_FACTORY.make */
extern T0* T572c1(void);
/* LX_START_CONDITIONS.make */
extern void T571f12(T0* C, T6 a1);
/* LX_START_CONDITIONS.make */
extern T0* T571c12(T6 a1);
/* LX_START_CONDITIONS.set_internal_cursor */
extern void T571f16(T0* C, T0* a1);
/* LX_START_CONDITIONS.new_cursor */
extern T0* T571f10(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].make */
extern T0* T618c4(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].make */
extern T0* T617f1(T0* C, T6 a1);
/* SPECIAL [LX_START_CONDITION].aliased_resized_area */
extern T0* T616f4(T0* C, T6 a1);
/* ARRAY [LX_START_CONDITION].make_empty */
extern T0* T672c4(void);
/* ARRAY [LX_START_CONDITION].make_empty_area */
extern void T672f5(T0* C, T6 a1);
/* SPECIAL [LX_START_CONDITION].make_empty */
extern T0* T616c5(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].default_create */
extern T0* T617c2(void);
/* LX_WILDCARD_PARSER.make_parser_skeleton */
extern void T550f221(T0* C);
/* LX_WILDCARD_PARSER.yy_build_parser_tables */
extern void T550f226(T0* C);
/* LX_WILDCARD_PARSER.yycheck_template */
extern unsigned char ge328os10582;
extern T0* ge328ov10582;
extern T0* T550f156(T0* C);
/* LX_WILDCARD_PARSER.yyfixed_array */
extern T0* T550f210(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].to_special */
extern T0* T65f4(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yytable_template */
extern unsigned char ge328os10581;
extern T0* ge328ov10581;
extern T0* T550f155(T0* C);
/* LX_WILDCARD_PARSER.yypgoto_template */
extern unsigned char ge328os10580;
extern T0* ge328ov10580;
extern T0* T550f154(T0* C);
/* LX_WILDCARD_PARSER.yypact_template */
extern unsigned char ge328os10579;
extern T0* ge328ov10579;
extern T0* T550f153(T0* C);
/* LX_WILDCARD_PARSER.yydefgoto_template */
extern unsigned char ge328os10578;
extern T0* ge328ov10578;
extern T0* T550f152(T0* C);
/* LX_WILDCARD_PARSER.yydefact_template */
extern unsigned char ge328os10577;
extern T0* ge328ov10577;
extern T0* T550f151(T0* C);
/* LX_WILDCARD_PARSER.yytypes2_template */
extern unsigned char ge328os10576;
extern T0* ge328ov10576;
extern T0* T550f148(T0* C);
/* LX_WILDCARD_PARSER.yytypes1_template */
extern unsigned char ge328os10575;
extern T0* ge328ov10575;
extern T0* T550f141(T0* C);
/* LX_WILDCARD_PARSER.yyr1_template */
extern unsigned char ge328os10574;
extern T0* ge328ov10574;
extern T0* T550f138(T0* C);
/* LX_WILDCARD_PARSER.yytranslate_template */
extern unsigned char ge328os10573;
extern T0* ge328ov10573;
extern T0* T550f135(T0* C);
/* LX_WILDCARD_PARSER.yy_create_value_stacks */
extern void T550f225(T0* C);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].make */
extern T0* T576f1(T0* C, T6 a1);
/* ARRAY [LX_SYMBOL_CLASS].make_empty */
extern T0* T622c4(void);
/* ARRAY [LX_SYMBOL_CLASS].make_empty_area */
extern void T622f5(T0* C, T6 a1);
/* SPECIAL [LX_SYMBOL_CLASS].make_empty */
extern T0* T577c5(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].default_create */
extern T0* T576c3(void);
/* KL_SPECIAL_ROUTINES [detachable ANY].make */
extern T0* T153f1(T0* C, T6 a1);
/* ARRAY [detachable ANY].make_empty */
extern T0* T254c4(void);
/* ARRAY [detachable ANY].make_empty_area */
extern void T254f5(T0* C, T6 a1);
/* SPECIAL [detachable ANY].make_empty */
extern T0* T154c4(T6 a1);
/* KL_SPECIAL_ROUTINES [detachable ANY].default_create */
extern T0* T153c3(void);
/* LX_WILDCARD_PARSER.make_lex_scanner_from_description */
extern void T550f220(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].set_key_equality_tester */
extern void T575f41(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_map */
extern T0* T575c40(T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_with_equality_testers */
extern void T575f46(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_sparse_container */
extern void T575f53(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].set_internal_cursor */
extern void T575f62(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_slots */
extern void T575f61(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_clashes */
extern void T575f60(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_key_storage */
extern void T575f59(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_item_storage */
extern void T575f58(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_key_equality_tester */
extern void T83f41(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.string_equality_tester */
extern unsigned char ge130os3005;
extern T0* ge130ov3005;
extern T0* T550f116(T0* C);
/* KL_STRING_EQUALITY_TESTER.default_create */
extern T0* T564c2(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map */
extern void T83f43(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map */
extern T0* T83c43(T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_with_equality_testers */
extern void T83f44(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_sparse_container */
extern void T83f45(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_internal_cursor */
extern void T83f51(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_cursor */
extern T0* T83f39(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].unset_found_item */
extern void T83f50(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_slots */
extern void T83f49(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_modulus */
extern T6 T83f31(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_clashes */
extern void T83f48(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_key_storage */
extern void T83f47(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_item_storage */
extern void T83f46(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.make_with_buffer */
extern void T550f224(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_initialize */
extern void T550f238(T0* C);
/* LX_WILDCARD_PARSER.yy_build_tables */
extern void T550f251(T0* C);
/* LX_WILDCARD_PARSER.yy_accept_template */
extern unsigned char ge329os10853;
extern T0* ge329ov10853;
extern T0* T550f196(T0* C);
/* LX_WILDCARD_PARSER.yy_fixed_array */
extern T0* T550f217(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_meta_template */
extern unsigned char ge329os10852;
extern T0* ge329ov10852;
extern T0* T550f195(T0* C);
/* LX_WILDCARD_PARSER.yy_ec_template */
extern unsigned char ge329os10851;
extern T0* ge329ov10851;
extern T0* T550f194(T0* C);
/* LX_WILDCARD_PARSER.yy_def_template */
extern unsigned char ge329os10850;
extern T0* ge329ov10850;
extern T0* T550f193(T0* C);
/* LX_WILDCARD_PARSER.yy_base_template */
extern unsigned char ge329os10849;
extern T0* ge329ov10849;
extern T0* T550f192(T0* C);
/* LX_WILDCARD_PARSER.yy_chk_template */
extern unsigned char ge329os10848;
extern T0* ge329ov10848;
extern T0* T550f191(T0* C);
/* LX_WILDCARD_PARSER.yy_nxt_template */
extern unsigned char ge329os10847;
extern T0* ge329ov10847;
extern T0* T550f190(T0* C);
/* LX_WILDCARD_PARSER.empty_buffer */
extern unsigned char ge1657os7403;
extern T0* ge1657ov7403;
extern T0* T550f117(T0* C);
/* LX_DESCRIPTION.set_case_insensitive */
extern void T551f32(T0* C, T1 a1);
/* LX_DESCRIPTION.set_full_table */
extern void T551f31(T0* C, T1 a1);
/* LX_DESCRIPTION.set_meta_equiv_classes_used */
extern void T551f30(T0* C, T1 a1);
/* LX_DESCRIPTION.set_equiv_classes_used */
extern void T551f29(T0* C, T1 a1);
/* LX_DESCRIPTION.make */
extern T0* T551c28(void);
/* LX_START_CONDITIONS.make_with_initial */
extern T0* T571c14(T6 a1);
/* LX_START_CONDITIONS.put_first */
extern void T571f17(T0* C, T0* a1);
/* LX_START_CONDITIONS.put */
extern void T571f18(T0* C, T0* a1, T6 a2);
/* LX_START_CONDITIONS.move_cursors_right */
extern void T571f21(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].set_position */
extern void T618f5(T0* C, T6 a1);
/* LX_START_CONDITIONS.move_right */
extern void T571f20(T0* C, T6 a1, T6 a2);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].force */
extern void T617f3(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [LX_START_CONDITION].fill_with */
extern void T616f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [LX_START_CONDITION].extend */
extern void T616f8(T0* C, T0* a1);
/* LX_START_CONDITIONS.put_last */
extern void T571f19(T0* C, T0* a1);
/* LX_START_CONDITION.make */
extern T0* T600c6(T0* a1, T6 a2, T1 a3);
/* DS_ARRAYED_LIST [LX_NFA].make */
extern T0* T602c10(T6 a1);
/* DS_ARRAYED_LIST [LX_NFA].set_internal_cursor */
extern void T602f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA].new_cursor */
extern T0* T602f6(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA].make */
extern T0* T649c3(T0* a1);
/* UT_ERROR_HANDLER.make_null */
extern T0* T28c10(void);
/* UT_ERROR_HANDLER.null_output_stream */
extern unsigned char ge167os2682;
extern T0* ge167ov2682;
extern T0* T28f6(T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.make */
extern T0* T557c3(T0* a1);
/* LX_DFA_WILDCARD.wipe_out */
extern void T516f17(T0* C);
/* GEANT_FILESET_ELEMENT.exclude_attribute_name */
extern unsigned char ge81os9723;
extern T0* ge81ov9723;
extern T0* T400f11(T0* C);
/* GEANT_FILESET.set_include_wc_string */
extern void T406f36(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.include_attribute_name */
extern unsigned char ge81os9722;
extern T0* ge81ov9722;
extern T0* T400f10(T0* C);
/* GEANT_FILESET.set_directory_name */
extern void T406f35(T0* C, T0* a1);
/* GEANT_FILESET.set_dir_name */
extern void T406f34(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.attribute_value */
extern T0* T400f9(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.project_variables_resolver */
extern T0* T400f25(T0* C);
/* GEANT_FILESET_ELEMENT.dir_attribute_name */
extern T0* T400f8(T0* C);
/* GEANT_FILESET.make */
extern T0* T406c33(T0* a1);
/* DS_HASH_SET [STRING_8].set_equality_tester */
extern void T514f33(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].make */
extern T0* T514c32(T6 a1);
/* DS_HASH_SET [STRING_8].set_internal_cursor */
extern void T514f40(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].new_cursor */
extern T0* T514f20(T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].make */
extern T0* T549c9(T0* a1);
/* DS_HASH_SET [STRING_8].make_slots */
extern void T514f38(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_clashes */
extern void T514f37(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_key_storage */
extern void T514f36(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_item_storage */
extern void T514f35(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_equal */
extern T0* T512c37(T6 a1);
/* detachable KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY].default_create */
extern T0* T544c2(void);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make */
extern void T512f38(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].set_internal_cursor */
extern void T512f44(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].new_cursor */
extern T0* T512f30(T0* C);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].make */
extern T0* T545c8(T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].unset_found_item */
extern void T512f43(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_slots */
extern void T512f42(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].new_modulus */
extern T6 T512f23(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_clashes */
extern void T512f41(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_key_storage */
extern void T512f40(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_item_storage */
extern void T512f39(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].make */
extern T0* T546f1(T0* C, T6 a1);
/* SPECIAL [GEANT_FILESET_ENTRY].aliased_resized_area */
extern T0* T548f4(T0* C, T6 a1);
/* ARRAY [GEANT_FILESET_ENTRY].make_empty */
extern T0* T569c4(void);
/* ARRAY [GEANT_FILESET_ENTRY].make_empty_area */
extern void T569f5(T0* C, T6 a1);
/* SPECIAL [GEANT_FILESET_ENTRY].make_empty */
extern T0* T548c5(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].default_create */
extern T0* T546c3(void);
/* GEANT_FILESET_ELEMENT.exit_application */
extern void T400f30(T0* C, T6 a1, T0* a2);
/* GEANT_FILESET_ELEMENT.exceptions */
extern T0* T400f24(T0* C);
/* GEANT_FILESET_ELEMENT.log_messages */
extern void T400f33(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.mapped_filename_directory_attribute_name */
extern unsigned char ge81os9730;
extern T0* ge81ov9730;
extern T0* T400f6(T0* C);
/* GEANT_FILESET_ELEMENT.filename_directory_attribute_name */
extern unsigned char ge81os9728;
extern T0* ge81ov9728;
extern T0* T400f5(T0* C);
/* GEANT_FILESET_ELEMENT.directory_attribute_name */
extern unsigned char ge81os9721;
extern T0* ge81ov9721;
extern T0* T400f22(T0* C);
/* GEANT_FILESET_ELEMENT.has_attribute */
extern T1 T400f20(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.concat_attribute_name */
extern unsigned char ge81os9725;
extern T0* ge81ov9725;
extern T0* T400f7(T0* C);
/* GEANT_FILESET_ELEMENT.make */
extern void T400f29p1(T0* C, T0* a1, T0* a2);
/* GEANT_FILESET_ELEMENT.set_project */
extern void T400f32(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.element_make */
extern void T400f31(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.set_xml_element */
extern void T400f34(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.fileset_element_name */
extern unsigned char ge68os9414;
extern T0* ge68ov9414;
extern T0* T350f13(T0* C);
/* GEANT_REPLACE_COMMAND.set_flags */
extern void T478f37(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.flags_attribute_name */
extern unsigned char ge68os9413;
extern T0* ge68ov9413;
extern T0* T350f12(T0* C);
/* GEANT_REPLACE_COMMAND.set_replace */
extern void T478f36(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.replace_attribute_name */
extern unsigned char ge68os9412;
extern T0* ge68ov9412;
extern T0* T350f11(T0* C);
/* GEANT_REPLACE_COMMAND.set_variable_pattern */
extern void T478f35(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.variable_pattern_attribute_name */
extern unsigned char ge68os9411;
extern T0* ge68ov9411;
extern T0* T350f9(T0* C);
/* GEANT_REPLACE_COMMAND.set_token */
extern void T478f34(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.token_attribute_name */
extern unsigned char ge68os9410;
extern T0* ge68ov9410;
extern T0* T350f8(T0* C);
/* GEANT_REPLACE_COMMAND.set_match */
extern void T478f33(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.match_attribute_name */
extern unsigned char ge68os9409;
extern T0* ge68ov9409;
extern T0* T350f7(T0* C);
/* GEANT_REPLACE_COMMAND.set_to_directory */
extern void T478f32(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.to_directory_attribute_name */
extern unsigned char ge68os9408;
extern T0* ge68ov9408;
extern T0* T350f6(T0* C);
/* GEANT_REPLACE_COMMAND.set_to_file */
extern void T478f31(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.to_file_attribute_name */
extern unsigned char ge68os9407;
extern T0* ge68ov9407;
extern T0* T350f5(T0* C);
/* GEANT_REPLACE_COMMAND.set_file */
extern void T478f30(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.attribute_value */
extern T0* T350f14(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.project_variables_resolver */
extern T0* T350f17(T0* C);
/* GEANT_REPLACE_TASK.has_attribute */
extern T1 T350f10(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.file_attribute_name */
extern unsigned char ge68os9406;
extern T0* ge68ov9406;
extern T0* T350f15(T0* C);
/* GEANT_REPLACE_TASK.make */
extern void T350f31p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_REPLACE_TASK.make */
extern T0* T350f31p1ac1(T0* a1);
/* DS_CELL [PROCEDURE [ANY, TUPLE]].put */
extern void T394f3(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.make_with_command */
extern void T350f33(T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_TASK.interpreting_element_make */
extern void T350f36(T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_TASK.set_project */
extern void T350f38(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.element_make */
extern void T350f37(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.set_xml_element */
extern void T350f39(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.set_command */
extern void T350f35(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.build_command */
extern void T350f32(T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.make */
extern T0* T478c29(T0* a1);
/* DS_CELL [PROCEDURE [ANY, TUPLE]].make */
extern T0* T394c2(T0* a1);
/* GEANT_REPLACE_COMMAND.set_project */
extern void T478f39(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_input_task */
extern T0* T210f50(T0* C, T0* a1);
/* GEANT_INPUT_TASK.make */
extern T0* T348c32(T0* a1, T0* a2);
/* GEANT_INPUT_COMMAND.set_answer_required */
extern void T475f21(T0* C, T1 a1);
/* GEANT_INPUT_TASK.boolean_value */
extern T1 T348f10(T0* C, T0* a1);
/* GEANT_INPUT_TASK.std */
extern T0* T348f18(T0* C);
/* GEANT_INPUT_TASK.false_attribute_value */
extern T0* T348f17(T0* C);
/* GEANT_INPUT_TASK.true_attribute_value */
extern T0* T348f16(T0* C);
/* GEANT_INPUT_TASK.string_ */
extern T0* T348f15(T0* C);
/* GEANT_INPUT_TASK.answer_required_attribute_name */
extern unsigned char ge61os9388;
extern T0* ge61ov9388;
extern T0* T348f9(T0* C);
/* GEANT_INPUT_COMMAND.set_validregexp */
extern void T475f20(T0* C, T0* a1);
/* GEANT_INPUT_TASK.validregexp_attribute_name */
extern unsigned char ge61os9387;
extern T0* ge61ov9387;
extern T0* T348f8(T0* C);
/* GEANT_INPUT_COMMAND.set_validargs */
extern void T475f19(T0* C, T0* a1);
/* GEANT_INPUT_TASK.validargs_attribute_name */
extern unsigned char ge61os9386;
extern T0* ge61ov9386;
extern T0* T348f7(T0* C);
/* GEANT_INPUT_COMMAND.set_default_value */
extern void T475f18(T0* C, T0* a1);
/* GEANT_INPUT_TASK.defaultvalue_attribute_name */
extern unsigned char ge61os9385;
extern T0* ge61ov9385;
extern T0* T348f6(T0* C);
/* GEANT_INPUT_COMMAND.set_message */
extern void T475f17(T0* C, T0* a1);
/* GEANT_INPUT_TASK.message_attribute_name */
extern unsigned char ge61os9384;
extern T0* ge61ov9384;
extern T0* T348f5(T0* C);
/* GEANT_INPUT_COMMAND.set_variable */
extern void T475f16(T0* C, T0* a1);
/* GEANT_INPUT_TASK.attribute_value */
extern T0* T348f12(T0* C, T0* a1);
/* GEANT_INPUT_TASK.project_variables_resolver */
extern T0* T348f19(T0* C);
/* GEANT_INPUT_TASK.has_attribute */
extern T1 T348f11(T0* C, T0* a1);
/* GEANT_INPUT_TASK.variable_attribute_name */
extern unsigned char ge61os9383;
extern T0* ge61ov9383;
extern T0* T348f14(T0* C);
/* GEANT_INPUT_TASK.make */
extern void T348f32p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_INPUT_TASK.make */
extern T0* T348f32p1ac1(T0* a1);
/* GEANT_INPUT_TASK.make_with_command */
extern void T348f34(T0* C, T0* a1, T0* a2);
/* GEANT_INPUT_TASK.interpreting_element_make */
extern void T348f37(T0* C, T0* a1, T0* a2);
/* GEANT_INPUT_TASK.set_project */
extern void T348f39(T0* C, T0* a1);
/* GEANT_INPUT_TASK.element_make */
extern void T348f38(T0* C, T0* a1);
/* GEANT_INPUT_TASK.set_xml_element */
extern void T348f40(T0* C, T0* a1);
/* GEANT_INPUT_TASK.set_command */
extern void T348f36(T0* C, T0* a1);
/* GEANT_INPUT_TASK.build_command */
extern void T348f33(T0* C, T0* a1);
/* GEANT_INPUT_COMMAND.make */
extern T0* T475c15(T0* a1);
/* GEANT_INPUT_COMMAND.set_project */
extern void T475f22(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_available_task */
extern T0* T210f48(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T346c21(T0* a1);
/* Creation of agent #1 in feature GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T346f21ac1(T0* a1, T0* a2);
/* Creation of agent #2 in feature GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T346f21ac2(T0* a1, T0* a2);
/* Creation of agent #3 in feature GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T346f21ac3(T0* a1, T0* a2);
/* Creation of agent #4 in feature GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T346f21ac4(T0* a1, T0* a2);
/* GEANT_INTERPRETING_ELEMENT.attribute_value_if_existing */
extern T0* T215f5(T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.has_attribute */
extern T1 T215f8(T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.attribute_value */
extern T0* T215f4(T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.project_variables_resolver */
extern T0* T215f7(T0* C);
/* GEANT_STRING_PROPERTY.set_string_value_agent */
extern void T402f9(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern void T346f21p1(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.make */
extern void T346f22(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_AVAILABLE_TASK.make */
extern T0* T346f22ac1(T0* a1);
/* GEANT_AVAILABLE_TASK.make_with_command */
extern void T346f24(T0* C, T0* a1, T0* a2);
/* GEANT_AVAILABLE_TASK.interpreting_element_make */
extern void T346f27(T0* C, T0* a1, T0* a2);
/* GEANT_AVAILABLE_TASK.set_project */
extern void T346f29(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.element_make */
extern void T346f28(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.set_xml_element */
extern void T346f30(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.set_command */
extern void T346f26(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.build_command */
extern void T346f23(T0* C, T0* a1);
/* GEANT_AVAILABLE_COMMAND.make */
extern T0* T472c17(T0* a1);
/* Creation of agent #1 in feature GEANT_AVAILABLE_COMMAND.make */
extern T0* T472f17ac1(T0* a1);
/* GEANT_AVAILABLE_COMMAND.is_resource_existing */
extern T1 T472f15(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.file_exists */
extern T1 T53f29(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.exists */
extern T1 T55f37(T0* C);
/* KL_TEXT_INPUT_FILE.is_plain */
extern T1 T55f26(T0* C);
/* FILE_INFO.is_plain */
extern T1 T79f11(T0* C);
/* FILE_INFO.file_info */
extern T6 T79f8(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.buffered_file_info */
extern T0* T55f17(T0* C);
/* KL_TEXT_INPUT_FILE.set_buffer */
extern void T55f65(T0* C);
/* FILE_INFO.fast_update */
extern void T79f23(T0* C, T0* a1, T0* a2);
/* FILE_INFO.eif_file_stat */
extern T6 T79f14(T0* C, T14 a1, T14 a2, T1 a3);
/* KL_TEXT_INPUT_FILE.internal_name_pointer */
extern T0* T55f15(T0* C);
/* KL_TEXT_INPUT_FILE.old_exists */
extern T1 T55f23(T0* C);
/* KL_TEXT_INPUT_FILE.file_exists */
extern T1 T55f16(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.old_is_closed */
extern T1 T55f14(T0* C);
/* KL_TEXT_INPUT_FILE.string_name */
extern T0* T55f20(T0* C);
/* KL_TEXT_INPUT_FILE.reset */
extern void T55f64(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.tmp_file */
extern unsigned char ge156os4205;
extern T0* ge156ov4205;
extern T0* T53f5(T0* C);
/* KL_UNIX_FILE_SYSTEM.file_exists */
extern T1 T54f27(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.tmp_file */
extern T0* T54f6(T0* C);
/* GEANT_AVAILABLE_COMMAND.unix_file_system */
extern T0* T472f10(T0* C);
/* GEANT_AVAILABLE_COMMAND.file_system */
extern T0* T472f9(T0* C);
/* GEANT_AVAILABLE_COMMAND.windows_file_system */
extern T0* T472f12(T0* C);
/* GEANT_AVAILABLE_COMMAND.operating_system */
extern T0* T472f11(T0* C);
/* DS_CELL [FUNCTION [ANY, TUPLE [STRING_8], BOOLEAN]].make */
extern T0* T534c2(T0* a1);
/* GEANT_STRING_PROPERTY.make */
extern T0* T402c8(void);
/* GEANT_AVAILABLE_COMMAND.make */
extern void T472f17p1(T0* C, T0* a1);
/* GEANT_AVAILABLE_COMMAND.set_project */
extern void T472f18(T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.make */
extern T0* T215c12(T0* a1, T0* a2);
/* GEANT_INTERPRETING_ELEMENT.set_project */
extern void T215f14(T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.element_make */
extern void T215f13(T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.set_xml_element */
extern void T215f15(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_precursor_task */
extern T0* T210f46(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.make */
extern T0* T344c28(T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.force_last_new */
extern void T34f74(T0* C, T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.key_storage_put */
extern void T34f56(T0* C, T0* a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.item_storage_put */
extern void T34f52(T0* C, T0* a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.slots_put */
extern void T34f55(T0* C, T6 a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.clashes_put */
extern void T34f54(T0* C, T6 a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.slots_item */
extern T6 T34f31(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.hash_position */
extern T6 T34f24(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.resize */
extern void T34f53(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.clashes_resize */
extern void T34f61(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.special_integer_ */
extern T0* T34f28(T0* C);
/* GEANT_ARGUMENT_VARIABLES.key_storage_resize */
extern void T34f60(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.item_storage_resize */
extern void T34f59(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.key_storage_item */
extern T0* T34f30(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.clashes_item */
extern T6 T34f26(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.slots_resize */
extern void T34f58(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.new_capacity */
extern T6 T34f23(T0* C, T6 a1);
/* GEANT_DEFINE_ELEMENT.value */
extern T0* T418f5(T0* C);
/* GEANT_DEFINE_ELEMENT.value_attribute_name */
extern T0* T418f12(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].forth */
extern void T373f10(T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_forth */
extern void T266f14(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].add_traversing_cursor */
extern void T266f15(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T373f12(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].remove_traversing_cursor */
extern void T266f16(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].set */
extern void T373f11(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [STRING_8].item */
extern T0* T373f6(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].start */
extern void T373f9(T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_start */
extern void T266f13(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].cursor_off */
extern T1 T266f7(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].off */
extern T1 T373f7(T0* C);
/* ST_SPLITTER.split */
extern T0* T435f5(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.arguments_string_splitter */
extern unsigned char ge10os1910;
extern T0* ge10ov1910;
extern T0* T344f8(T0* C);
/* ST_SPLITTER.make */
extern T0* T435c11(void);
/* GEANT_PRECURSOR_TASK.exit_application */
extern void T344f29(T0* C, T6 a1, T0* a2);
/* GEANT_PRECURSOR_TASK.exceptions */
extern T0* T344f11(T0* C);
/* GEANT_PRECURSOR_TASK.std */
extern T0* T344f10(T0* C);
/* GEANT_PRECURSOR_TASK.log_messages */
extern void T344f33(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.arguments_attribute_name */
extern unsigned char ge67os9361;
extern T0* ge67ov9361;
extern T0* T344f7(T0* C);
/* GEANT_PRECURSOR_TASK.elements_by_name */
extern T0* T344f6(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.string_ */
extern T0* T344f15(T0* C);
/* GEANT_PRECURSOR_TASK.argument_element_name */
extern unsigned char ge67os9360;
extern T0* ge67ov9360;
extern T0* T344f5(T0* C);
/* GEANT_PRECURSOR_COMMAND.set_parent */
extern void T469f9(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.attribute_value */
extern T0* T344f12(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.project_variables_resolver */
extern T0* T344f16(T0* C);
/* GEANT_PRECURSOR_TASK.has_attribute */
extern T1 T344f9(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.parent_attribute_name */
extern unsigned char ge67os9359;
extern T0* ge67ov9359;
extern T0* T344f14(T0* C);
/* GEANT_PRECURSOR_TASK.make */
extern void T344f28p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_PRECURSOR_TASK.make */
extern T0* T344f28p1ac1(T0* a1);
/* GEANT_PRECURSOR_TASK.make_with_command */
extern void T344f31(T0* C, T0* a1, T0* a2);
/* GEANT_PRECURSOR_TASK.interpreting_element_make */
extern void T344f35(T0* C, T0* a1, T0* a2);
/* GEANT_PRECURSOR_TASK.set_project */
extern void T344f37(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.element_make */
extern void T344f36(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.set_xml_element */
extern void T344f38(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.set_command */
extern void T344f34(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.build_command */
extern void T344f30(T0* C, T0* a1);
/* GEANT_PRECURSOR_COMMAND.make */
extern T0* T469c8(T0* a1);
/* GEANT_PRECURSOR_COMMAND.make */
extern void T469f8p1(T0* C, T0* a1);
/* GEANT_PRECURSOR_COMMAND.set_project */
extern void T469f10(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_exit_task */
extern T0* T210f44(T0* C, T0* a1);
/* GEANT_EXIT_TASK.make */
extern T0* T342c23(T0* a1, T0* a2);
/* UC_UTF8_STRING.to_integer */
extern T6 T227f50(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
extern T6 T125f13(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
extern void T125f17(T0* C, T0* a1, T6 a2);
/* STRING_TO_INTEGER_CONVERTOR.parse_character */
extern void T125f23(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflowed */
extern T1 T125f15(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
extern unsigned char ge1506os7105;
extern T0* ge1506ov7105;
extern T0* T125f14(T0* C);
/* CHARACTER_8.is_digit */
extern T1 T2f9(T2* C);
/* STRING_TO_INTEGER_CONVERTOR.reset */
extern void T125f18(T0* C, T6 a1);
/* UC_UTF8_STRING.ctoi_convertor */
extern unsigned char ge1497os488;
extern T0* ge1497ov488;
extern T0* T227f52(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
extern void T125f22(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
extern void T125f21(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
extern void T125f20(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
extern void T125f19(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.make */
extern T0* T125c16(void);
/* STRING_8.to_integer */
extern T6 T17f17(T0* C);
/* STRING_8.ctoi_convertor */
extern T0* T17f26(T0* C);
/* GEANT_EXIT_COMMAND.set_code */
extern void T466f8(T0* C, T6 a1);
/* UC_UTF8_STRING.is_integer */
extern T1 T227f49(T0* C);
/* UC_UTF8_STRING.is_valid_integer_or_natural */
extern T1 T227f51(T0* C, T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.is_integral_integer */
extern T1 T125f12(T0* C);
/* STRING_8.is_integer */
extern T1 T17f16(T0* C);
/* STRING_8.is_valid_integer_or_natural */
extern T1 T17f25(T0* C, T6 a1);
/* GEANT_EXIT_TASK.attribute_value */
extern T0* T342f6(T0* C, T0* a1);
/* GEANT_EXIT_TASK.project_variables_resolver */
extern T0* T342f9(T0* C);
/* GEANT_EXIT_TASK.has_attribute */
extern T1 T342f5(T0* C, T0* a1);
/* GEANT_EXIT_TASK.code_attribute_name */
extern unsigned char ge53os9350;
extern T0* ge53ov9350;
extern T0* T342f8(T0* C);
/* GEANT_EXIT_TASK.make */
extern void T342f23p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_EXIT_TASK.make */
extern T0* T342f23p1ac1(T0* a1);
/* GEANT_EXIT_TASK.make_with_command */
extern void T342f25(T0* C, T0* a1, T0* a2);
/* GEANT_EXIT_TASK.interpreting_element_make */
extern void T342f28(T0* C, T0* a1, T0* a2);
/* GEANT_EXIT_TASK.set_project */
extern void T342f30(T0* C, T0* a1);
/* GEANT_EXIT_TASK.element_make */
extern void T342f29(T0* C, T0* a1);
/* GEANT_EXIT_TASK.set_xml_element */
extern void T342f31(T0* C, T0* a1);
/* GEANT_EXIT_TASK.set_command */
extern void T342f27(T0* C, T0* a1);
/* GEANT_EXIT_TASK.build_command */
extern void T342f24(T0* C, T0* a1);
/* GEANT_EXIT_COMMAND.make */
extern T0* T466c7(T0* a1);
/* GEANT_EXIT_COMMAND.set_project */
extern void T466f9(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_outofdate_task */
extern T0* T210f42(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.make */
extern T0* T340c28(T0* a1, T0* a2);
/* GEANT_OUTOFDATE_COMMAND.set_fileset */
extern void T463f26(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.fileset_element_name */
extern unsigned char ge66os9329;
extern T0* ge66ov9329;
extern T0* T340f10(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_variable_name */
extern void T463f25(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.variable_attribute_name */
extern unsigned char ge66os9326;
extern T0* ge66ov9326;
extern T0* T340f8(T0* C);
/* GEANT_OUTOFDATE_TASK.false_value_attribute_name */
extern unsigned char ge66os9328;
extern T0* ge66ov9328;
extern T0* T340f7(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_false_value */
extern void T463f24(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.true_value_attribute_name */
extern unsigned char ge66os9327;
extern T0* ge66ov9327;
extern T0* T340f6(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_true_value */
extern void T463f23(T0* C, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.set_target_filename */
extern void T463f22(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.target_attribute_name */
extern unsigned char ge66os9325;
extern T0* ge66ov9325;
extern T0* T340f5(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_source_filename */
extern void T463f21(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.attribute_value */
extern T0* T340f11(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.project_variables_resolver */
extern T0* T340f14(T0* C);
/* GEANT_OUTOFDATE_TASK.has_attribute */
extern T1 T340f9(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.source_attribute_name */
extern unsigned char ge66os9324;
extern T0* ge66ov9324;
extern T0* T340f12(T0* C);
/* GEANT_OUTOFDATE_TASK.make */
extern void T340f28p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_OUTOFDATE_TASK.make */
extern T0* T340f28p1ac1(T0* a1);
/* GEANT_OUTOFDATE_TASK.make_with_command */
extern void T340f30(T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.interpreting_element_make */
extern void T340f33(T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.set_project */
extern void T340f35(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.element_make */
extern void T340f34(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.set_xml_element */
extern void T340f36(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.set_command */
extern void T340f32(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.build_command */
extern void T340f29(T0* C, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.make */
extern T0* T463c20(T0* a1);
/* GEANT_OUTOFDATE_COMMAND.set_project */
extern void T463f27(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_xslt_task */
extern T0* T210f40(T0* C, T0* a1);
/* GEANT_XSLT_TASK.make */
extern T0* T338c41(T0* a1, T0* a2);
/* GEANT_XSLT_COMMAND.set_classpath */
extern void T459f38(T0* C, T0* a1);
/* GEANT_XSLT_TASK.classpath_attribute_name */
extern unsigned char ge73os9284;
extern T0* ge73ov9284;
extern T0* T338f21(T0* C);
/* GEANT_XSLT_COMMAND.set_extdirs */
extern void T459f37(T0* C, T0* a1);
/* GEANT_XSLT_TASK.extdirs_attribute_name */
extern unsigned char ge73os9283;
extern T0* ge73ov9283;
extern T0* T338f20(T0* C);
/* GEANT_XSLT_COMMAND.set_format */
extern void T459f36(T0* C, T0* a1);
/* GEANT_XSLT_TASK.format_attribute_name */
extern unsigned char ge73os9281;
extern T0* ge73ov9281;
extern T0* T338f19(T0* C);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].force_last */
extern void T460f11(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]].force */
extern void T531f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [DS_PAIR [STRING_8, STRING_8]].fill_with */
extern void T532f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_PAIR [STRING_8, STRING_8]].extend */
extern void T532f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].resize */
extern void T460f13(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]].aliased_resized_area */
extern T0* T531f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_PAIR [STRING_8, STRING_8]].aliased_resized_area */
extern T0* T532f3(T0* C, T6 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].new_capacity */
extern T6 T460f7(T0* C, T6 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].extendible */
extern T1 T460f8(T0* C, T6 a1);
/* DS_PAIR [STRING_8, STRING_8].make */
extern T0* T458c3(T0* a1, T0* a2);
/* GEANT_DEFINE_ELEMENT.has_value */
extern T1 T418f15(T0* C);
/* GEANT_XSLT_TASK.elements_by_name */
extern T0* T338f17(T0* C, T0* a1);
/* GEANT_XSLT_TASK.parameter_element_name */
extern unsigned char ge73os9285;
extern T0* ge73ov9285;
extern T0* T338f16(T0* C);
/* GEANT_XSLT_COMMAND.set_indent */
extern void T459f35(T0* C, T0* a1);
/* GEANT_XSLT_TASK.indent_attribute_name */
extern unsigned char ge73os9282;
extern T0* ge73ov9282;
extern T0* T338f15(T0* C);
/* GEANT_XSLT_COMMAND.set_force */
extern void T459f34(T0* C, T1 a1);
/* GEANT_XSLT_TASK.boolean_value */
extern T1 T338f14(T0* C, T0* a1);
/* GEANT_XSLT_TASK.std */
extern T0* T338f27(T0* C);
/* GEANT_XSLT_TASK.false_attribute_value */
extern T0* T338f26(T0* C);
/* GEANT_XSLT_TASK.true_attribute_value */
extern T0* T338f25(T0* C);
/* GEANT_XSLT_TASK.force_attribute_name */
extern unsigned char ge73os9275;
extern T0* ge73ov9275;
extern T0* T338f13(T0* C);
/* GEANT_XSLT_COMMAND.set_stylesheet_filename */
extern void T459f33(T0* C, T0* a1);
/* GEANT_XSLT_TASK.stylesheet_filename_attribute_name */
extern unsigned char ge73os9274;
extern T0* ge73ov9274;
extern T0* T338f12(T0* C);
/* GEANT_XSLT_COMMAND.set_output_filename */
extern void T459f32(T0* C, T0* a1);
/* GEANT_XSLT_TASK.output_filename_attribute_name */
extern unsigned char ge73os9273;
extern T0* ge73ov9273;
extern T0* T338f11(T0* C);
/* GEANT_XSLT_COMMAND.set_input_filename */
extern void T459f31(T0* C, T0* a1);
/* GEANT_XSLT_TASK.input_filename_attribute_name */
extern unsigned char ge73os9272;
extern T0* ge73ov9272;
extern T0* T338f10(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_gexslt */
extern void T459f30(T0* C);
/* GEANT_XSLT_COMMAND.set_processor */
extern void T459f40(T0* C, T6 a1);
/* GEANT_XSLT_TASK.processor_attribute_value_gexslt */
extern unsigned char ge73os9280;
extern T0* ge73ov9280;
extern T0* T338f9(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xsltproc */
extern void T459f29(T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xsltproc */
extern unsigned char ge73os9279;
extern T0* ge73ov9279;
extern T0* T338f8(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xalan_java */
extern void T459f28(T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xalan_java */
extern unsigned char ge73os9278;
extern T0* ge73ov9278;
extern T0* T338f7(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xalan_cpp */
extern void T459f27(T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xalan_cpp */
extern unsigned char ge73os9277;
extern T0* ge73ov9277;
extern T0* T338f5(T0* C);
/* GEANT_XSLT_TASK.string_ */
extern T0* T338f24(T0* C);
/* GEANT_XSLT_TASK.attribute_value */
extern T0* T338f22(T0* C, T0* a1);
/* GEANT_XSLT_TASK.project_variables_resolver */
extern T0* T338f28(T0* C);
/* GEANT_XSLT_TASK.has_attribute */
extern T1 T338f18(T0* C, T0* a1);
/* GEANT_XSLT_TASK.processor_attribute_name */
extern unsigned char ge73os9276;
extern T0* ge73ov9276;
extern T0* T338f6(T0* C);
/* GEANT_XSLT_TASK.make */
extern void T338f41p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_XSLT_TASK.make */
extern T0* T338f41p1ac1(T0* a1);
/* GEANT_XSLT_TASK.make_with_command */
extern void T338f43(T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_TASK.interpreting_element_make */
extern void T338f46(T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_TASK.set_project */
extern void T338f48(T0* C, T0* a1);
/* GEANT_XSLT_TASK.element_make */
extern void T338f47(T0* C, T0* a1);
/* GEANT_XSLT_TASK.set_xml_element */
extern void T338f49(T0* C, T0* a1);
/* GEANT_XSLT_TASK.set_command */
extern void T338f45(T0* C, T0* a1);
/* GEANT_XSLT_TASK.build_command */
extern void T338f42(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.make */
extern T0* T459c26(T0* a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].make */
extern T0* T460c10(T6 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].set_internal_cursor */
extern void T460f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].new_cursor */
extern T0* T460f6(T0* C);
/* DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING_8, STRING_8]].make */
extern T0* T533c3(T0* a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]].make */
extern T0* T531f1(T0* C, T6 a1);
/* ARRAY [DS_PAIR [STRING_8, STRING_8]].make_empty */
extern T0* T556c4(void);
/* ARRAY [DS_PAIR [STRING_8, STRING_8]].make_empty_area */
extern void T556f5(T0* C, T6 a1);
/* SPECIAL [DS_PAIR [STRING_8, STRING_8]].make_empty */
extern T0* T532c5(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]].default_create */
extern T0* T531c3(void);
/* GEANT_XSLT_COMMAND.make */
extern void T459f26p1(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.set_project */
extern void T459f39(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_setenv_task */
extern T0* T210f38(T0* C, T0* a1);
/* GEANT_SETENV_TASK.make */
extern T0* T336c24(T0* a1, T0* a2);
/* GEANT_SETENV_COMMAND.set_value */
extern void T455f11(T0* C, T0* a1);
/* GEANT_SETENV_TASK.value_attribute_name */
extern unsigned char ge69os9262;
extern T0* ge69ov9262;
extern T0* T336f5(T0* C);
/* GEANT_SETENV_COMMAND.set_name */
extern void T455f10(T0* C, T0* a1);
/* GEANT_SETENV_TASK.attribute_value */
extern T0* T336f7(T0* C, T0* a1);
/* GEANT_SETENV_TASK.project_variables_resolver */
extern T0* T336f10(T0* C);
/* GEANT_SETENV_TASK.has_attribute */
extern T1 T336f6(T0* C, T0* a1);
/* GEANT_SETENV_TASK.name_attribute_name */
extern unsigned char ge69os9261;
extern T0* ge69ov9261;
extern T0* T336f9(T0* C);
/* GEANT_SETENV_TASK.make */
extern void T336f24p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_SETENV_TASK.make */
extern T0* T336f24p1ac1(T0* a1);
/* GEANT_SETENV_TASK.make_with_command */
extern void T336f26(T0* C, T0* a1, T0* a2);
/* GEANT_SETENV_TASK.interpreting_element_make */
extern void T336f29(T0* C, T0* a1, T0* a2);
/* GEANT_SETENV_TASK.set_project */
extern void T336f31(T0* C, T0* a1);
/* GEANT_SETENV_TASK.element_make */
extern void T336f30(T0* C, T0* a1);
/* GEANT_SETENV_TASK.set_xml_element */
extern void T336f32(T0* C, T0* a1);
/* GEANT_SETENV_TASK.set_command */
extern void T336f28(T0* C, T0* a1);
/* GEANT_SETENV_TASK.build_command */
extern void T336f25(T0* C, T0* a1);
/* GEANT_SETENV_COMMAND.make */
extern T0* T455c9(T0* a1);
/* GEANT_SETENV_COMMAND.set_project */
extern void T455f12(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_move_task */
extern T0* T210f36(T0* C, T0* a1);
/* GEANT_MOVE_TASK.make */
extern T0* T334c26(T0* a1, T0* a2);
/* GEANT_MOVE_COMMAND.set_fileset */
extern void T452f21(T0* C, T0* a1);
/* GEANT_MOVE_TASK.fileset_element_name */
extern unsigned char ge65os9243;
extern T0* ge65ov9243;
extern T0* T334f8(T0* C);
/* GEANT_MOVE_COMMAND.set_to_directory */
extern void T452f20(T0* C, T0* a1);
/* GEANT_MOVE_TASK.to_directory_attribute_name */
extern unsigned char ge65os9242;
extern T0* ge65ov9242;
extern T0* T334f6(T0* C);
/* GEANT_MOVE_COMMAND.set_to_file */
extern void T452f19(T0* C, T0* a1);
/* GEANT_MOVE_TASK.to_file_attribute_name */
extern unsigned char ge65os9241;
extern T0* ge65ov9241;
extern T0* T334f5(T0* C);
/* GEANT_MOVE_COMMAND.set_file */
extern void T452f18(T0* C, T0* a1);
/* GEANT_MOVE_TASK.attribute_value */
extern T0* T334f9(T0* C, T0* a1);
/* GEANT_MOVE_TASK.project_variables_resolver */
extern T0* T334f12(T0* C);
/* GEANT_MOVE_TASK.has_attribute */
extern T1 T334f7(T0* C, T0* a1);
/* GEANT_MOVE_TASK.file_attribute_name */
extern unsigned char ge65os9240;
extern T0* ge65ov9240;
extern T0* T334f10(T0* C);
/* GEANT_MOVE_TASK.make */
extern void T334f26p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_MOVE_TASK.make */
extern T0* T334f26p1ac1(T0* a1);
/* GEANT_MOVE_TASK.make_with_command */
extern void T334f28(T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_TASK.interpreting_element_make */
extern void T334f31(T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_TASK.set_project */
extern void T334f33(T0* C, T0* a1);
/* GEANT_MOVE_TASK.element_make */
extern void T334f32(T0* C, T0* a1);
/* GEANT_MOVE_TASK.set_xml_element */
extern void T334f34(T0* C, T0* a1);
/* GEANT_MOVE_TASK.set_command */
extern void T334f30(T0* C, T0* a1);
/* GEANT_MOVE_TASK.build_command */
extern void T334f27(T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.make */
extern T0* T452c17(T0* a1);
/* GEANT_MOVE_COMMAND.set_project */
extern void T452f22(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_copy_task */
extern T0* T210f34(T0* C, T0* a1);
/* GEANT_COPY_TASK.make */
extern T0* T332c31(T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.set_fileset */
extern void T449f25(T0* C, T0* a1);
/* GEANT_COPY_TASK.fileset_element_name */
extern unsigned char ge49os9220;
extern T0* ge49ov9220;
extern T0* T332f10(T0* C);
/* GEANT_COPY_COMMAND.set_force */
extern void T449f24(T0* C, T1 a1);
/* GEANT_COPY_TASK.boolean_value */
extern T1 T332f8(T0* C, T0* a1);
/* GEANT_COPY_TASK.std */
extern T0* T332f17(T0* C);
/* GEANT_COPY_TASK.false_attribute_value */
extern T0* T332f16(T0* C);
/* GEANT_COPY_TASK.true_attribute_value */
extern T0* T332f15(T0* C);
/* GEANT_COPY_TASK.string_ */
extern T0* T332f14(T0* C);
/* GEANT_COPY_TASK.force_attribute_name */
extern unsigned char ge49os9219;
extern T0* ge49ov9219;
extern T0* T332f7(T0* C);
/* GEANT_COPY_COMMAND.set_to_directory */
extern void T449f23(T0* C, T0* a1);
/* GEANT_COPY_TASK.to_directory_attribute_name */
extern unsigned char ge49os9218;
extern T0* ge49ov9218;
extern T0* T332f6(T0* C);
/* GEANT_COPY_COMMAND.set_to_file */
extern void T449f22(T0* C, T0* a1);
/* GEANT_COPY_TASK.to_file_attribute_name */
extern unsigned char ge49os9217;
extern T0* ge49ov9217;
extern T0* T332f5(T0* C);
/* GEANT_COPY_COMMAND.set_file */
extern void T449f21(T0* C, T0* a1);
/* GEANT_COPY_TASK.attribute_value */
extern T0* T332f11(T0* C, T0* a1);
/* GEANT_COPY_TASK.project_variables_resolver */
extern T0* T332f18(T0* C);
/* GEANT_COPY_TASK.has_attribute */
extern T1 T332f9(T0* C, T0* a1);
/* GEANT_COPY_TASK.file_attribute_name */
extern unsigned char ge49os9216;
extern T0* ge49ov9216;
extern T0* T332f12(T0* C);
/* GEANT_COPY_TASK.make */
extern void T332f31p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_COPY_TASK.make */
extern T0* T332f31p1ac1(T0* a1);
/* GEANT_COPY_TASK.make_with_command */
extern void T332f33(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_TASK.interpreting_element_make */
extern void T332f36(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_TASK.set_project */
extern void T332f38(T0* C, T0* a1);
/* GEANT_COPY_TASK.element_make */
extern void T332f37(T0* C, T0* a1);
/* GEANT_COPY_TASK.set_xml_element */
extern void T332f39(T0* C, T0* a1);
/* GEANT_COPY_TASK.set_command */
extern void T332f35(T0* C, T0* a1);
/* GEANT_COPY_TASK.build_command */
extern void T332f32(T0* C, T0* a1);
/* GEANT_COPY_COMMAND.make */
extern T0* T449c20(T0* a1);
/* GEANT_COPY_COMMAND.set_project */
extern void T449f26(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_delete_task */
extern T0* T210f32(T0* C, T0* a1);
/* GEANT_DELETE_TASK.make */
extern T0* T330c26(T0* a1, T0* a2);
/* GEANT_DELETE_COMMAND.set_directoryset */
extern void T445f23(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.make */
extern T0* T444c20(T0* a1, T0* a2);
/* GEANT_DIRECTORYSET.add_single_exclude */
extern void T446f27(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.exclude_element_name */
extern unsigned char ge77os9853;
extern T0* ge77ov9853;
extern T0* T444f12(T0* C);
/* GEANT_DIRECTORYSET.add_single_include */
extern void T446f26(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.elements_by_name */
extern T0* T444f11(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.string_ */
extern T0* T444f16(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.include_element_name */
extern unsigned char ge77os9852;
extern T0* ge77ov9852;
extern T0* T444f10(T0* C);
/* GEANT_DIRECTORYSET.set_concat */
extern void T446f25(T0* C, T1 a1);
/* GEANT_DIRECTORYSET_ELEMENT.boolean_value */
extern T1 T444f9(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.std */
extern T0* T444f19(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.false_attribute_value */
extern T0* T444f18(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.true_attribute_value */
extern T0* T444f17(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.concat_attribute_name */
extern unsigned char ge77os9851;
extern T0* ge77ov9851;
extern T0* T444f8(T0* C);
/* GEANT_DIRECTORYSET.set_exclude_wc_string */
extern void T446f24(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.exclude_attribute_name */
extern unsigned char ge77os9850;
extern T0* ge77ov9850;
extern T0* T444f7(T0* C);
/* GEANT_DIRECTORYSET.set_include_wc_string */
extern void T446f23(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.include_attribute_name */
extern unsigned char ge77os9849;
extern T0* ge77ov9849;
extern T0* T444f6(T0* C);
/* GEANT_DIRECTORYSET.set_directory_name */
extern void T446f22(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.attribute_value */
extern T0* T444f5(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.project_variables_resolver */
extern T0* T444f15(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.has_attribute */
extern T1 T444f14(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.directory_attribute_name */
extern unsigned char ge77os9848;
extern T0* ge77ov9848;
extern T0* T444f13(T0* C);
/* GEANT_DIRECTORYSET.make */
extern T0* T446c21(T0* a1);
/* GEANT_DIRECTORYSET.set_directory_name_variable_name */
extern void T446f28(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.make */
extern void T444f20p1(T0* C, T0* a1, T0* a2);
/* GEANT_DIRECTORYSET_ELEMENT.set_project */
extern void T444f22(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.element_make */
extern void T444f21(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.set_xml_element */
extern void T444f23(T0* C, T0* a1);
/* GEANT_DELETE_TASK.directoryset_element_name */
extern unsigned char ge50os9198;
extern T0* ge50ov9198;
extern T0* T330f9(T0* C);
/* GEANT_DELETE_COMMAND.set_fileset */
extern void T445f22(T0* C, T0* a1);
/* GEANT_DELETE_TASK.fileset_element_name */
extern unsigned char ge50os9197;
extern T0* ge50ov9197;
extern T0* T330f7(T0* C);
/* GEANT_DELETE_COMMAND.set_file */
extern void T445f21(T0* C, T0* a1);
/* GEANT_DELETE_TASK.file_attribute_name */
extern unsigned char ge50os9196;
extern T0* ge50ov9196;
extern T0* T330f5(T0* C);
/* GEANT_DELETE_COMMAND.set_directory */
extern void T445f20(T0* C, T0* a1);
/* GEANT_DELETE_TASK.attribute_value */
extern T0* T330f8(T0* C, T0* a1);
/* GEANT_DELETE_TASK.project_variables_resolver */
extern T0* T330f12(T0* C);
/* GEANT_DELETE_TASK.has_attribute */
extern T1 T330f6(T0* C, T0* a1);
/* GEANT_DELETE_TASK.directory_attribute_name */
extern unsigned char ge50os9195;
extern T0* ge50ov9195;
extern T0* T330f10(T0* C);
/* GEANT_DELETE_TASK.make */
extern void T330f26p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_DELETE_TASK.make */
extern T0* T330f26p1ac1(T0* a1);
/* GEANT_DELETE_TASK.make_with_command */
extern void T330f28(T0* C, T0* a1, T0* a2);
/* GEANT_DELETE_TASK.interpreting_element_make */
extern void T330f31(T0* C, T0* a1, T0* a2);
/* GEANT_DELETE_TASK.set_project */
extern void T330f33(T0* C, T0* a1);
/* GEANT_DELETE_TASK.element_make */
extern void T330f32(T0* C, T0* a1);
/* GEANT_DELETE_TASK.set_xml_element */
extern void T330f34(T0* C, T0* a1);
/* GEANT_DELETE_TASK.set_command */
extern void T330f30(T0* C, T0* a1);
/* GEANT_DELETE_TASK.build_command */
extern void T330f27(T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.make */
extern T0* T445c19(T0* a1);
/* GEANT_DELETE_COMMAND.set_project */
extern void T445f24(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_mkdir_task */
extern T0* T210f30(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.make_from_interpreting_element */
extern T0* T328c21(T0* a1);
/* Creation of agent #1 in feature GEANT_MKDIR_TASK.make_from_interpreting_element */
extern T0* T328f21ac1(T0* a1, T0* a2);
/* GEANT_MKDIR_TASK.make_from_interpreting_element */
extern void T328f21p1(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.make */
extern void T328f22(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_MKDIR_TASK.make */
extern T0* T328f22ac1(T0* a1);
/* GEANT_MKDIR_TASK.make_with_command */
extern void T328f24(T0* C, T0* a1, T0* a2);
/* GEANT_MKDIR_TASK.interpreting_element_make */
extern void T328f27(T0* C, T0* a1, T0* a2);
/* GEANT_MKDIR_TASK.set_project */
extern void T328f29(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.element_make */
extern void T328f28(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.set_xml_element */
extern void T328f30(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.set_command */
extern void T328f26(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.build_command */
extern void T328f23(T0* C, T0* a1);
/* GEANT_MKDIR_COMMAND.make */
extern T0* T441c13(T0* a1);
/* Creation of agent #1 in feature GEANT_MKDIR_COMMAND.make */
extern T0* T441f13ac1(T0* a1);
/* GEANT_MKDIR_COMMAND.create_directory */
extern void T441f14(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.recursive_create_directory */
extern void T53f38(T0* C, T0* a1);
/* KL_DIRECTORY.recursive_create_directory */
extern void T501f51(T0* C);
/* KL_UNIX_FILE_SYSTEM.canonical_pathname */
extern T0* T54f29(T0* C, T0* a1);
/* KL_PATHNAME.set_canonical */
extern void T90f18(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.canonical_pathname */
extern T0* T53f34(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.string_to_pathname */
extern T0* T53f35(T0* C, T0* a1);
/* KL_PATHNAME.set_drive */
extern void T90f21(T0* C, T0* a1);
/* KL_PATHNAME.set_sharename */
extern void T90f20(T0* C, T0* a1);
/* KL_PATHNAME.set_hostname */
extern void T90f19(T0* C, T0* a1);
/* KL_DIRECTORY.string_name */
extern T0* T501f21(T0* C);
/* KL_DIRECTORY.file_system */
extern T0* T501f20(T0* C);
/* KL_DIRECTORY.unix_file_system */
extern T0* T501f32(T0* C);
/* KL_DIRECTORY.windows_file_system */
extern T0* T501f31(T0* C);
/* KL_DIRECTORY.operating_system */
extern T0* T501f30(T0* C);
/* KL_DIRECTORY.create_directory */
extern void T501f55(T0* C);
/* KL_DIRECTORY.create_dir */
extern void T501f58(T0* C);
/* KL_DIRECTORY.file_mkdir */
extern void T501f59(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.recursive_create_directory */
extern void T54f35(T0* C, T0* a1);
/* GEANT_MKDIR_COMMAND.unix_file_system */
extern T0* T441f7(T0* C);
/* GEANT_MKDIR_COMMAND.file_system */
extern T0* T441f6(T0* C);
/* GEANT_MKDIR_COMMAND.windows_file_system */
extern T0* T441f9(T0* C);
/* GEANT_MKDIR_COMMAND.operating_system */
extern T0* T441f8(T0* C);
/* DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8]]].make */
extern T0* T519c2(T0* a1);
/* GEANT_MKDIR_COMMAND.make */
extern void T441f13p1(T0* C, T0* a1);
/* GEANT_MKDIR_COMMAND.set_project */
extern void T441f15(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_echo_task */
extern T0* T210f28(T0* C, T0* a1);
/* GEANT_ECHO_TASK.make_from_interpreting_element */
extern T0* T326c21(T0* a1);
/* Creation of agent #1 in feature GEANT_ECHO_TASK.make_from_interpreting_element */
extern T0* T326f21ac1(T0* a1, T0* a2);
/* Creation of agent #2 in feature GEANT_ECHO_TASK.make_from_interpreting_element */
extern T0* T326f21ac2(T0* a1, T0* a2);
/* Creation of agent #3 in feature GEANT_ECHO_TASK.make_from_interpreting_element */
extern T0* T326f21ac3(T0* a1, T0* a2);
/* GEANT_INTERPRETING_ELEMENT.attribute_or_content_value */
extern T0* T215f6(T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.exit_application */
extern void T215f17(T0* C, T6 a1, T0* a2);
/* GEANT_INTERPRETING_ELEMENT.exceptions */
extern T0* T215f11(T0* C);
/* GEANT_INTERPRETING_ELEMENT.std */
extern T0* T215f10(T0* C);
/* GEANT_INTERPRETING_ELEMENT.log_messages */
extern void T215f16(T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.content */
extern T0* T215f9(T0* C);
/* GEANT_BOOLEAN_PROPERTY.set_string_value_agent */
extern void T405f13(T0* C, T0* a1);
/* GEANT_ECHO_TASK.make_from_interpreting_element */
extern void T326f21p1(T0* C, T0* a1);
/* GEANT_ECHO_TASK.make */
extern void T326f22(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_ECHO_TASK.make */
extern T0* T326f22ac1(T0* a1);
/* GEANT_ECHO_TASK.make_with_command */
extern void T326f24(T0* C, T0* a1, T0* a2);
/* GEANT_ECHO_TASK.interpreting_element_make */
extern void T326f27(T0* C, T0* a1, T0* a2);
/* GEANT_ECHO_TASK.set_project */
extern void T326f29(T0* C, T0* a1);
/* GEANT_ECHO_TASK.element_make */
extern void T326f28(T0* C, T0* a1);
/* GEANT_ECHO_TASK.set_xml_element */
extern void T326f30(T0* C, T0* a1);
/* GEANT_ECHO_TASK.set_command */
extern void T326f26(T0* C, T0* a1);
/* GEANT_ECHO_TASK.build_command */
extern void T326f23(T0* C, T0* a1);
/* GEANT_ECHO_COMMAND.make */
extern T0* T438c12(T0* a1);
/* Creation of agent #1 in feature GEANT_ECHO_COMMAND.make */
extern T0* T438f12ac1(T0* a1);
/* Creation of agent #2 in feature GEANT_ECHO_COMMAND.make */
extern T0* T438f12ac2(T0* a1);
/* GEANT_ECHO_COMMAND.write_message_to_file */
extern void T438f14(T0* C, T0* a1, T0* a2, T1 a3);
/* KL_TEXT_OUTPUT_FILE.put_line */
extern void T525f29(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.put_new_line */
extern void T525f36(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_string */
extern void T525f35(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_put_string */
extern void T525f39(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_ps */
extern void T525f41(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_TEXT_OUTPUT_FILE.string_ */
extern T0* T525f9(T0* C);
/* KL_TEXT_OUTPUT_FILE.is_open_write */
extern T1 T525f17(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
extern T1 T525f14(T0* C);
/* GEANT_ECHO_COMMAND.write_message */
extern void T438f13(T0* C, T0* a1);
/* DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]]].make */
extern T0* T524c2(T0* a1);
/* GEANT_BOOLEAN_PROPERTY.make */
extern T0* T405c12(void);
/* GEANT_ECHO_COMMAND.make */
extern void T438f12p1(T0* C, T0* a1);
/* GEANT_ECHO_COMMAND.set_project */
extern void T438f15(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_geant_task */
extern T0* T210f26(T0* C, T0* a1);
/* GEANT_GEANT_TASK.make */
extern T0* T324c36(T0* a1, T0* a2);
/* GEANT_GEANT_TASK.arguments_string_splitter */
extern T0* T324f16(T0* C);
/* GEANT_GEANT_TASK.exit_application */
extern void T324f37(T0* C, T6 a1, T0* a2);
/* GEANT_GEANT_TASK.exceptions */
extern T0* T324f18(T0* C);
/* GEANT_GEANT_TASK.std */
extern T0* T324f17(T0* C);
/* GEANT_GEANT_TASK.log_messages */
extern void T324f41(T0* C, T0* a1);
/* GEANT_GEANT_TASK.arguments_attribute_name */
extern unsigned char ge54os9143;
extern T0* ge54ov9143;
extern T0* T324f15(T0* C);
/* GEANT_GEANT_TASK.elements_by_name */
extern T0* T324f14(T0* C, T0* a1);
/* GEANT_GEANT_TASK.string_ */
extern T0* T324f21(T0* C);
/* GEANT_GEANT_TASK.argument_element_name */
extern unsigned char ge54os9142;
extern T0* ge54ov9142;
extern T0* T324f13(T0* C);
/* GEANT_GEANT_COMMAND.set_exit_code_variable_name */
extern void T434f32(T0* C, T0* a1);
/* GEANT_GEANT_TASK.exit_code_variable_attribute_name */
extern unsigned char ge54os9144;
extern T0* ge54ov9144;
extern T0* T324f12(T0* C);
/* GEANT_GEANT_TASK.fork_attribute_name */
extern unsigned char ge54os9140;
extern T0* ge54ov9140;
extern T0* T324f11(T0* C);
/* GEANT_GEANT_COMMAND.set_fileset */
extern void T434f31(T0* C, T0* a1);
/* GEANT_GEANT_TASK.fileset_element_name */
extern unsigned char ge54os9141;
extern T0* ge54ov9141;
extern T0* T324f9(T0* C);
/* GEANT_GEANT_COMMAND.set_fork */
extern void T434f30(T0* C, T1 a1);
/* GEANT_GEANT_COMMAND.set_filename */
extern void T434f29(T0* C, T0* a1);
/* GEANT_GEANT_TASK.filename_attribute_name */
extern unsigned char ge54os9137;
extern T0* ge54ov9137;
extern T0* T324f7(T0* C);
/* GEANT_GEANT_COMMAND.set_reuse_variables */
extern void T434f28(T0* C, T1 a1);
/* GEANT_GEANT_TASK.boolean_value */
extern T1 T324f6(T0* C, T0* a1);
/* GEANT_GEANT_TASK.false_attribute_value */
extern T0* T324f23(T0* C);
/* GEANT_GEANT_TASK.true_attribute_value */
extern T0* T324f22(T0* C);
/* GEANT_GEANT_TASK.reuse_variables_attribute_name */
extern unsigned char ge54os9139;
extern T0* ge54ov9139;
extern T0* T324f5(T0* C);
/* GEANT_GEANT_COMMAND.set_start_target_name */
extern void T434f27(T0* C, T0* a1);
/* GEANT_GEANT_TASK.attribute_value */
extern T0* T324f10(T0* C, T0* a1);
/* GEANT_GEANT_TASK.project_variables_resolver */
extern T0* T324f24(T0* C);
/* GEANT_GEANT_TASK.has_attribute */
extern T1 T324f8(T0* C, T0* a1);
/* GEANT_GEANT_TASK.start_target_attribute_name */
extern unsigned char ge54os9138;
extern T0* ge54ov9138;
extern T0* T324f19(T0* C);
/* GEANT_GEANT_TASK.make */
extern void T324f36p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEANT_TASK.make */
extern T0* T324f36p1ac1(T0* a1);
/* GEANT_GEANT_TASK.make_with_command */
extern void T324f39(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_TASK.interpreting_element_make */
extern void T324f43(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_TASK.set_project */
extern void T324f45(T0* C, T0* a1);
/* GEANT_GEANT_TASK.element_make */
extern void T324f44(T0* C, T0* a1);
/* GEANT_GEANT_TASK.set_xml_element */
extern void T324f46(T0* C, T0* a1);
/* GEANT_GEANT_TASK.set_command */
extern void T324f42(T0* C, T0* a1);
/* GEANT_GEANT_TASK.build_command */
extern void T324f38(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.make */
extern T0* T434c26(T0* a1);
/* GEANT_GEANT_COMMAND.make */
extern void T434f26p1(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.set_project */
extern void T434f33(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_getest_task */
extern T0* T210f24(T0* C, T0* a1);
/* GEANT_GETEST_TASK.make */
extern T0* T322c39(T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force */
extern void T83f53(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_put */
extern void T83f62(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_put */
extern void T83f61(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_put */
extern void T83f60(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_item */
extern T6 T83f30(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_item */
extern T6 T83f33(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].hash_position */
extern T6 T83f28(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].resize */
extern void T83f59(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_resize */
extern void T83f68(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].special_integer_ */
extern T0* T83f38(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_resize */
extern void T83f67(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_resize */
extern void T83f66(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_item */
extern T0* T83f26(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_resize */
extern void T83f65(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_capacity */
extern T6 T83f27(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_put */
extern void T83f58(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].search_position */
extern void T83f57(T0* C, T0* a1);
/* GEANT_GETEST_TASK.define_element_name */
extern unsigned char ge58os9108;
extern T0* ge58ov9108;
extern T0* T322f20(T0* C);
/* GEANT_GETEST_TASK.true_attribute_value */
extern T0* T322f19(T0* C);
/* GEANT_GETEST_TASK.string_ */
extern T0* T322f18(T0* C);
/* GEANT_GETEST_TASK.elements_by_name */
extern T0* T322f16(T0* C, T0* a1);
/* GEANT_GETEST_TASK.attribute_element_name */
extern unsigned char ge58os9107;
extern T0* ge58ov9107;
extern T0* T322f15(T0* C);
/* GEANT_GETEST_COMMAND.set_abort */
extern void T431f32(T0* C, T1 a1);
/* GEANT_GETEST_TASK.abort_attribute_name */
extern unsigned char ge58os9106;
extern T0* ge58ov9106;
extern T0* T322f14(T0* C);
/* GEANT_GETEST_COMMAND.set_execution */
extern void T431f31(T0* C, T1 a1);
/* GEANT_GETEST_TASK.execution_attribute_name */
extern unsigned char ge58os9105;
extern T0* ge58ov9105;
extern T0* T322f13(T0* C);
/* GEANT_GETEST_COMMAND.set_compilation */
extern void T431f30(T0* C, T1 a1);
/* GEANT_GETEST_TASK.compilation_attribute_name */
extern unsigned char ge58os9104;
extern T0* ge58ov9104;
extern T0* T322f12(T0* C);
/* GEANT_GETEST_COMMAND.set_generation */
extern void T431f29(T0* C, T1 a1);
/* GEANT_GETEST_TASK.generation_attribute_name */
extern unsigned char ge58os9103;
extern T0* ge58ov9103;
extern T0* T322f11(T0* C);
/* GEANT_GETEST_COMMAND.set_default_test_included */
extern void T431f28(T0* C, T1 a1);
/* GEANT_GETEST_TASK.default_test_attribute_name */
extern unsigned char ge58os9102;
extern T0* ge58ov9102;
extern T0* T322f10(T0* C);
/* GEANT_GETEST_COMMAND.set_feature_regexp */
extern void T431f27(T0* C, T0* a1);
/* GEANT_GETEST_TASK.feature_attribute_name */
extern unsigned char ge58os9101;
extern T0* ge58ov9101;
extern T0* T322f9(T0* C);
/* GEANT_GETEST_COMMAND.set_class_regexp */
extern void T431f26(T0* C, T0* a1);
/* GEANT_GETEST_TASK.class_attribute_name */
extern unsigned char ge58os9100;
extern T0* ge58ov9100;
extern T0* T322f8(T0* C);
/* GEANT_GETEST_COMMAND.set_compile */
extern void T431f25(T0* C, T0* a1);
/* GEANT_GETEST_TASK.compile_attribute_name */
extern unsigned char ge58os9099;
extern T0* ge58ov9099;
extern T0* T322f7(T0* C);
/* GEANT_GETEST_COMMAND.set_config_filename */
extern void T431f24(T0* C, T0* a1);
/* GEANT_GETEST_TASK.attribute_value */
extern T0* T322f6(T0* C, T0* a1);
/* GEANT_GETEST_TASK.project_variables_resolver */
extern T0* T322f24(T0* C);
/* GEANT_GETEST_TASK.config_filename_attribute_name */
extern unsigned char ge58os9098;
extern T0* ge58ov9098;
extern T0* T322f5(T0* C);
/* GEANT_GETEST_COMMAND.set_verbose */
extern void T431f23(T0* C, T1 a1);
/* GEANT_GETEST_TASK.boolean_value */
extern T1 T322f23(T0* C, T0* a1);
/* GEANT_GETEST_TASK.std */
extern T0* T322f26(T0* C);
/* GEANT_GETEST_TASK.false_attribute_value */
extern T0* T322f25(T0* C);
/* GEANT_GETEST_TASK.has_attribute */
extern T1 T322f17(T0* C, T0* a1);
/* GEANT_GETEST_TASK.verbose_attribute_name */
extern unsigned char ge58os9097;
extern T0* ge58ov9097;
extern T0* T322f21(T0* C);
/* GEANT_GETEST_TASK.make */
extern void T322f39p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GETEST_TASK.make */
extern T0* T322f39p1ac1(T0* a1);
/* GEANT_GETEST_TASK.make_with_command */
extern void T322f41(T0* C, T0* a1, T0* a2);
/* GEANT_GETEST_TASK.interpreting_element_make */
extern void T322f44(T0* C, T0* a1, T0* a2);
/* GEANT_GETEST_TASK.set_project */
extern void T322f46(T0* C, T0* a1);
/* GEANT_GETEST_TASK.element_make */
extern void T322f45(T0* C, T0* a1);
/* GEANT_GETEST_TASK.set_xml_element */
extern void T322f47(T0* C, T0* a1);
/* GEANT_GETEST_TASK.set_command */
extern void T322f43(T0* C, T0* a1);
/* GEANT_GETEST_TASK.build_command */
extern void T322f40(T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.make */
extern T0* T431c22(T0* a1);
/* GEANT_GETEST_COMMAND.make */
extern void T431f22p1(T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.set_project */
extern void T431f33(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_gepp_task */
extern T0* T210f22(T0* C, T0* a1);
/* GEANT_GEPP_TASK.make */
extern T0* T320c34(T0* a1, T0* a2);
/* GEANT_GEPP_COMMAND.set_fileset */
extern void T428f27(T0* C, T0* a1);
/* GEANT_GEPP_TASK.fileset_element_name */
extern unsigned char ge57os9072;
extern T0* ge57ov9072;
extern T0* T320f14(T0* C);
/* GEANT_GEPP_COMMAND.set_force */
extern void T428f26(T0* C, T1 a1);
/* GEANT_GEPP_TASK.force_attribute_name */
extern unsigned char ge57os9071;
extern T0* ge57ov9071;
extern T0* T320f12(T0* C);
/* GEANT_GEPP_COMMAND.set_to_directory */
extern void T428f25(T0* C, T0* a1);
/* GEANT_GEPP_TASK.to_directory_attribute_name */
extern unsigned char ge57os9070;
extern T0* ge57ov9070;
extern T0* T320f11(T0* C);
/* GEANT_GEPP_TASK.elements_by_name */
extern T0* T320f9(T0* C, T0* a1);
/* GEANT_GEPP_TASK.string_ */
extern T0* T320f17(T0* C);
/* GEANT_GEPP_TASK.define_element_name */
extern unsigned char ge57os9069;
extern T0* ge57ov9069;
extern T0* T320f8(T0* C);
/* GEANT_GEPP_COMMAND.set_empty_lines */
extern void T428f24(T0* C, T1 a1);
/* GEANT_GEPP_TASK.boolean_value */
extern T1 T320f7(T0* C, T0* a1);
/* GEANT_GEPP_TASK.std */
extern T0* T320f20(T0* C);
/* GEANT_GEPP_TASK.false_attribute_value */
extern T0* T320f19(T0* C);
/* GEANT_GEPP_TASK.true_attribute_value */
extern T0* T320f18(T0* C);
/* GEANT_GEPP_TASK.lines_attribute_name */
extern unsigned char ge57os9068;
extern T0* ge57ov9068;
extern T0* T320f6(T0* C);
/* GEANT_GEPP_COMMAND.set_output_filename */
extern void T428f23(T0* C, T0* a1);
/* GEANT_GEPP_TASK.output_filename_attribute_name */
extern unsigned char ge57os9067;
extern T0* ge57ov9067;
extern T0* T320f5(T0* C);
/* GEANT_GEPP_COMMAND.set_input_filename */
extern void T428f22(T0* C, T0* a1);
/* GEANT_GEPP_TASK.attribute_value */
extern T0* T320f13(T0* C, T0* a1);
/* GEANT_GEPP_TASK.project_variables_resolver */
extern T0* T320f21(T0* C);
/* GEANT_GEPP_TASK.has_attribute */
extern T1 T320f10(T0* C, T0* a1);
/* GEANT_GEPP_TASK.input_filename_attribute_name */
extern unsigned char ge57os9066;
extern T0* ge57ov9066;
extern T0* T320f15(T0* C);
/* GEANT_GEPP_TASK.make */
extern void T320f34p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEPP_TASK.make */
extern T0* T320f34p1ac1(T0* a1);
/* GEANT_GEPP_TASK.make_with_command */
extern void T320f36(T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_TASK.interpreting_element_make */
extern void T320f39(T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_TASK.set_project */
extern void T320f41(T0* C, T0* a1);
/* GEANT_GEPP_TASK.element_make */
extern void T320f40(T0* C, T0* a1);
/* GEANT_GEPP_TASK.set_xml_element */
extern void T320f42(T0* C, T0* a1);
/* GEANT_GEPP_TASK.set_command */
extern void T320f38(T0* C, T0* a1);
/* GEANT_GEPP_TASK.build_command */
extern void T320f35(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.make */
extern T0* T428c21(T0* a1);
/* GEANT_GEPP_COMMAND.make */
extern void T428f21p1(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.set_project */
extern void T428f28(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_geyacc_task */
extern T0* T210f20(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.make */
extern T0* T318c34(T0* a1, T0* a2);
/* GEANT_GEYACC_COMMAND.set_input_filename */
extern void T425f25(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.input_filename_attribute_name */
extern unsigned char ge60os9044;
extern T0* ge60ov9044;
extern T0* T318f12(T0* C);
/* GEANT_GEYACC_COMMAND.set_output_filename */
extern void T425f24(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.output_filename_attribute_name */
extern unsigned char ge60os9043;
extern T0* ge60ov9043;
extern T0* T318f11(T0* C);
/* GEANT_GEYACC_COMMAND.set_tokens_filename */
extern void T425f23(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.tokens_filename_attribute_name */
extern unsigned char ge60os9042;
extern T0* ge60ov9042;
extern T0* T318f10(T0* C);
/* GEANT_GEYACC_COMMAND.set_tokens_classname */
extern void T425f22(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.tokens_classname_attribute_name */
extern unsigned char ge60os9041;
extern T0* ge60ov9041;
extern T0* T318f9(T0* C);
/* GEANT_GEYACC_TASK.new_typing_attribute_name */
extern unsigned char ge60os9045;
extern T0* ge60ov9045;
extern T0* T318f8(T0* C);
/* GEANT_GEYACC_COMMAND.set_verbose_filename */
extern void T425f21(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.attribute_value */
extern T0* T318f7(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.project_variables_resolver */
extern T0* T318f17(T0* C);
/* GEANT_GEYACC_TASK.verbose_filename_attribute_name */
extern unsigned char ge60os9040;
extern T0* ge60ov9040;
extern T0* T318f6(T0* C);
/* GEANT_GEYACC_COMMAND.set_separate_actions */
extern void T425f20(T0* C, T1 a1);
/* GEANT_GEYACC_TASK.separate_actions_attribute_name */
extern unsigned char ge60os9039;
extern T0* ge60ov9039;
extern T0* T318f5(T0* C);
/* GEANT_GEYACC_COMMAND.set_rescue_on_abort */
extern void T425f19(T0* C, T1 a1);
/* GEANT_GEYACC_TASK.boolean_value */
extern T1 T318f16(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.std */
extern T0* T318f21(T0* C);
/* GEANT_GEYACC_TASK.false_attribute_value */
extern T0* T318f20(T0* C);
/* GEANT_GEYACC_TASK.true_attribute_value */
extern T0* T318f19(T0* C);
/* GEANT_GEYACC_TASK.string_ */
extern T0* T318f18(T0* C);
/* GEANT_GEYACC_TASK.has_attribute */
extern T1 T318f13(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.rescue_on_abort_attribute_name */
extern unsigned char ge60os9038;
extern T0* ge60ov9038;
extern T0* T318f14(T0* C);
/* GEANT_GEYACC_TASK.make */
extern void T318f34p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEYACC_TASK.make */
extern T0* T318f34p1ac1(T0* a1);
/* GEANT_GEYACC_TASK.make_with_command */
extern void T318f36(T0* C, T0* a1, T0* a2);
/* GEANT_GEYACC_TASK.interpreting_element_make */
extern void T318f39(T0* C, T0* a1, T0* a2);
/* GEANT_GEYACC_TASK.set_project */
extern void T318f41(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.element_make */
extern void T318f40(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.set_xml_element */
extern void T318f42(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.set_command */
extern void T318f38(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.build_command */
extern void T318f35(T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.make */
extern T0* T425c18(T0* a1);
/* GEANT_GEYACC_COMMAND.make */
extern void T425f18p1(T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.set_project */
extern void T425f26(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_gelex_task */
extern T0* T210f18(T0* C, T0* a1);
/* GEANT_GELEX_TASK.make */
extern T0* T316c37(T0* a1, T0* a2);
/* GEANT_GELEX_COMMAND.set_input_filename */
extern void T422f33(T0* C, T0* a1);
/* GEANT_GELEX_TASK.input_filename_attribute_name */
extern unsigned char ge56os9009;
extern T0* ge56ov9009;
extern T0* T316f15(T0* C);
/* GEANT_GELEX_COMMAND.set_output_filename */
extern void T422f32(T0* C, T0* a1);
/* GEANT_GELEX_TASK.output_filename_attribute_name */
extern unsigned char ge56os9008;
extern T0* ge56ov9008;
extern T0* T316f14(T0* C);
/* GEANT_GELEX_COMMAND.set_separate_actions */
extern void T422f31(T0* C, T1 a1);
/* GEANT_GELEX_TASK.separate_actions_attribute_name */
extern unsigned char ge56os9007;
extern T0* ge56ov9007;
extern T0* T316f13(T0* C);
/* GEANT_GELEX_COMMAND.set_no_warn */
extern void T422f30(T0* C, T1 a1);
/* GEANT_GELEX_TASK.no_warn_attribute_name */
extern unsigned char ge56os9006;
extern T0* ge56ov9006;
extern T0* T316f12(T0* C);
/* GEANT_GELEX_COMMAND.set_no_default */
extern void T422f29(T0* C, T1 a1);
/* GEANT_GELEX_TASK.no_default_attribute_name */
extern unsigned char ge56os9005;
extern T0* ge56ov9005;
extern T0* T316f11(T0* C);
/* GEANT_GELEX_COMMAND.set_meta_ecs */
extern void T422f28(T0* C, T1 a1);
/* GEANT_GELEX_TASK.meta_ecs_attribute_name */
extern unsigned char ge56os9004;
extern T0* ge56ov9004;
extern T0* T316f10(T0* C);
/* GEANT_GELEX_COMMAND.set_case_insensitive */
extern void T422f27(T0* C, T1 a1);
/* GEANT_GELEX_TASK.case_insensitive_attribute_name */
extern unsigned char ge56os9003;
extern T0* ge56ov9003;
extern T0* T316f9(T0* C);
/* GEANT_GELEX_COMMAND.set_full */
extern void T422f26(T0* C, T1 a1);
/* GEANT_GELEX_TASK.full_attribute_name */
extern unsigned char ge56os9002;
extern T0* ge56ov9002;
extern T0* T316f8(T0* C);
/* GEANT_GELEX_COMMAND.set_ecs */
extern void T422f25(T0* C, T1 a1);
/* GEANT_GELEX_TASK.ecs_attribute_name */
extern unsigned char ge56os9001;
extern T0* ge56ov9001;
extern T0* T316f7(T0* C);
/* GEANT_GELEX_COMMAND.set_backup */
extern void T422f24(T0* C, T1 a1);
/* GEANT_GELEX_TASK.boolean_value */
extern T1 T316f6(T0* C, T0* a1);
/* GEANT_GELEX_TASK.std */
extern T0* T316f23(T0* C);
/* GEANT_GELEX_TASK.false_attribute_value */
extern T0* T316f22(T0* C);
/* GEANT_GELEX_TASK.true_attribute_value */
extern T0* T316f21(T0* C);
/* GEANT_GELEX_TASK.string_ */
extern T0* T316f20(T0* C);
/* GEANT_GELEX_TASK.backup_attribute_name */
extern unsigned char ge56os9000;
extern T0* ge56ov9000;
extern T0* T316f5(T0* C);
/* GEANT_GELEX_COMMAND.set_size */
extern void T422f23(T0* C, T0* a1);
/* GEANT_GELEX_TASK.attribute_value */
extern T0* T316f17(T0* C, T0* a1);
/* GEANT_GELEX_TASK.project_variables_resolver */
extern T0* T316f24(T0* C);
/* GEANT_GELEX_TASK.has_attribute */
extern T1 T316f16(T0* C, T0* a1);
/* GEANT_GELEX_TASK.size_attribute_name */
extern unsigned char ge56os8999;
extern T0* ge56ov8999;
extern T0* T316f19(T0* C);
/* GEANT_GELEX_TASK.make */
extern void T316f37p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GELEX_TASK.make */
extern T0* T316f37p1ac1(T0* a1);
/* GEANT_GELEX_TASK.make_with_command */
extern void T316f39(T0* C, T0* a1, T0* a2);
/* GEANT_GELEX_TASK.interpreting_element_make */
extern void T316f42(T0* C, T0* a1, T0* a2);
/* GEANT_GELEX_TASK.set_project */
extern void T316f44(T0* C, T0* a1);
/* GEANT_GELEX_TASK.element_make */
extern void T316f43(T0* C, T0* a1);
/* GEANT_GELEX_TASK.set_xml_element */
extern void T316f45(T0* C, T0* a1);
/* GEANT_GELEX_TASK.set_command */
extern void T316f41(T0* C, T0* a1);
/* GEANT_GELEX_TASK.build_command */
extern void T316f38(T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.make */
extern T0* T422c22(T0* a1);
/* GEANT_GELEX_COMMAND.make */
extern void T422f22p1(T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.set_project */
extern void T422f34(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_gexace_task */
extern T0* T210f16(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.make */
extern T0* T314c35(T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force_last */
extern void T83f52(T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.elements_by_name */
extern T0* T314f13(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.string_ */
extern T0* T314f19(T0* C);
/* GEANT_GEXACE_TASK.define_element_name */
extern unsigned char ge59os8973;
extern T0* ge59ov8973;
extern T0* T314f12(T0* C);
/* GEANT_GEXACE_COMMAND.set_output_filename */
extern void T419f30(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.output_filename_attribute_name */
extern unsigned char ge59os8972;
extern T0* ge59ov8972;
extern T0* T314f11(T0* C);
/* GEANT_GEXACE_COMMAND.set_xace_filename */
extern void T419f29(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.xace_filename_attribute_name */
extern unsigned char ge59os8971;
extern T0* ge59ov8971;
extern T0* T314f10(T0* C);
/* GEANT_GEXACE_COMMAND.set_format */
extern void T419f28(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.format_attribute_name */
extern unsigned char ge59os8970;
extern T0* ge59ov8970;
extern T0* T314f9(T0* C);
/* GEANT_GEXACE_COMMAND.set_library_command */
extern void T419f27(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.library_attribute_name */
extern unsigned char ge59os8969;
extern T0* ge59ov8969;
extern T0* T314f8(T0* C);
/* GEANT_GEXACE_COMMAND.set_system_command */
extern void T419f26(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.attribute_value */
extern T0* T314f7(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.project_variables_resolver */
extern T0* T314f18(T0* C);
/* GEANT_GEXACE_TASK.system_attribute_name */
extern unsigned char ge59os8968;
extern T0* ge59ov8968;
extern T0* T314f6(T0* C);
/* GEANT_GEXACE_COMMAND.set_validate_command */
extern void T419f25(T0* C, T1 a1);
/* GEANT_GEXACE_TASK.validate_attribute_name */
extern unsigned char ge59os8967;
extern T0* ge59ov8967;
extern T0* T314f5(T0* C);
/* GEANT_GEXACE_COMMAND.set_verbose */
extern void T419f24(T0* C, T1 a1);
/* GEANT_GEXACE_TASK.boolean_value */
extern T1 T314f17(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.std */
extern T0* T314f22(T0* C);
/* GEANT_GEXACE_TASK.false_attribute_value */
extern T0* T314f21(T0* C);
/* GEANT_GEXACE_TASK.true_attribute_value */
extern T0* T314f20(T0* C);
/* GEANT_GEXACE_TASK.has_attribute */
extern T1 T314f14(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.verbose_attribute_name */
extern unsigned char ge59os8966;
extern T0* ge59ov8966;
extern T0* T314f15(T0* C);
/* GEANT_GEXACE_TASK.make */
extern void T314f35p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEXACE_TASK.make */
extern T0* T314f35p1ac1(T0* a1);
/* GEANT_GEXACE_TASK.make_with_command */
extern void T314f37(T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.interpreting_element_make */
extern void T314f40(T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.set_project */
extern void T314f42(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.element_make */
extern void T314f41(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.set_xml_element */
extern void T314f43(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.set_command */
extern void T314f39(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.build_command */
extern void T314f36(T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.make */
extern T0* T419c23(T0* a1);
/* GEANT_GEXACE_COMMAND.make */
extern void T419f23p1(T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.set_project */
extern void T419f31(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_unset_task */
extern T0* T210f14(T0* C, T0* a1);
/* GEANT_UNSET_TASK.make */
extern T0* T312c23(T0* a1, T0* a2);
/* GEANT_UNSET_COMMAND.set_name */
extern void T415f8(T0* C, T0* a1);
/* GEANT_UNSET_TASK.attribute_value */
extern T0* T312f6(T0* C, T0* a1);
/* GEANT_UNSET_TASK.project_variables_resolver */
extern T0* T312f9(T0* C);
/* GEANT_UNSET_TASK.has_attribute */
extern T1 T312f5(T0* C, T0* a1);
/* GEANT_UNSET_TASK.name_attribute_name */
extern unsigned char ge72os8958;
extern T0* ge72ov8958;
extern T0* T312f8(T0* C);
/* GEANT_UNSET_TASK.make */
extern void T312f23p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_UNSET_TASK.make */
extern T0* T312f23p1ac1(T0* a1);
/* GEANT_UNSET_TASK.make_with_command */
extern void T312f25(T0* C, T0* a1, T0* a2);
/* GEANT_UNSET_TASK.interpreting_element_make */
extern void T312f28(T0* C, T0* a1, T0* a2);
/* GEANT_UNSET_TASK.set_project */
extern void T312f30(T0* C, T0* a1);
/* GEANT_UNSET_TASK.element_make */
extern void T312f29(T0* C, T0* a1);
/* GEANT_UNSET_TASK.set_xml_element */
extern void T312f31(T0* C, T0* a1);
/* GEANT_UNSET_TASK.set_command */
extern void T312f27(T0* C, T0* a1);
/* GEANT_UNSET_TASK.build_command */
extern void T312f24(T0* C, T0* a1);
/* GEANT_UNSET_COMMAND.make */
extern T0* T415c7(T0* a1);
/* GEANT_UNSET_COMMAND.set_project */
extern void T415f9(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_set_task */
extern T0* T210f12(T0* C, T0* a1);
/* GEANT_SET_TASK.make */
extern T0* T310c24(T0* a1, T0* a2);
/* GEANT_SET_COMMAND.set_value */
extern void T412f15(T0* C, T0* a1);
/* GEANT_SET_TASK.value_attribute_name */
extern unsigned char ge70os8948;
extern T0* ge70ov8948;
extern T0* T310f5(T0* C);
/* GEANT_SET_COMMAND.set_name */
extern void T412f14(T0* C, T0* a1);
/* GEANT_SET_TASK.attribute_value */
extern T0* T310f7(T0* C, T0* a1);
/* GEANT_SET_TASK.project_variables_resolver */
extern T0* T310f10(T0* C);
/* GEANT_SET_TASK.has_attribute */
extern T1 T310f6(T0* C, T0* a1);
/* GEANT_SET_TASK.name_attribute_name */
extern unsigned char ge70os8947;
extern T0* ge70ov8947;
extern T0* T310f9(T0* C);
/* GEANT_SET_TASK.make */
extern void T310f24p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_SET_TASK.make */
extern T0* T310f24p1ac1(T0* a1);
/* GEANT_SET_TASK.make_with_command */
extern void T310f26(T0* C, T0* a1, T0* a2);
/* GEANT_SET_TASK.interpreting_element_make */
extern void T310f29(T0* C, T0* a1, T0* a2);
/* GEANT_SET_TASK.set_project */
extern void T310f31(T0* C, T0* a1);
/* GEANT_SET_TASK.element_make */
extern void T310f30(T0* C, T0* a1);
/* GEANT_SET_TASK.set_xml_element */
extern void T310f32(T0* C, T0* a1);
/* GEANT_SET_TASK.set_command */
extern void T310f28(T0* C, T0* a1);
/* GEANT_SET_TASK.build_command */
extern void T310f25(T0* C, T0* a1);
/* GEANT_SET_COMMAND.make */
extern T0* T412c13(T0* a1);
/* GEANT_SET_COMMAND.set_project */
extern void T412f16(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_lcc_task */
extern T0* T210f10(T0* C, T0* a1);
/* GEANT_LCC_TASK.make */
extern T0* T308c24(T0* a1, T0* a2);
/* GEANT_LCC_COMMAND.set_source_filename */
extern void T409f15(T0* C, T0* a1);
/* GEANT_LCC_TASK.source_filename_attribute_name */
extern unsigned char ge63os8937;
extern T0* ge63ov8937;
extern T0* T308f5(T0* C);
/* GEANT_LCC_COMMAND.set_executable */
extern void T409f14(T0* C, T0* a1);
/* GEANT_LCC_TASK.attribute_value */
extern T0* T308f7(T0* C, T0* a1);
/* GEANT_LCC_TASK.project_variables_resolver */
extern T0* T308f10(T0* C);
/* GEANT_LCC_TASK.has_attribute */
extern T1 T308f6(T0* C, T0* a1);
/* GEANT_LCC_TASK.executable_attribute_name */
extern unsigned char ge63os8936;
extern T0* ge63ov8936;
extern T0* T308f9(T0* C);
/* GEANT_LCC_TASK.make */
extern void T308f24p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_LCC_TASK.make */
extern T0* T308f24p1ac1(T0* a1);
/* GEANT_LCC_TASK.make_with_command */
extern void T308f26(T0* C, T0* a1, T0* a2);
/* GEANT_LCC_TASK.interpreting_element_make */
extern void T308f29(T0* C, T0* a1, T0* a2);
/* GEANT_LCC_TASK.set_project */
extern void T308f31(T0* C, T0* a1);
/* GEANT_LCC_TASK.element_make */
extern void T308f30(T0* C, T0* a1);
/* GEANT_LCC_TASK.set_xml_element */
extern void T308f32(T0* C, T0* a1);
/* GEANT_LCC_TASK.set_command */
extern void T308f28(T0* C, T0* a1);
/* GEANT_LCC_TASK.build_command */
extern void T308f25(T0* C, T0* a1);
/* GEANT_LCC_COMMAND.make */
extern T0* T409c13(T0* a1);
/* GEANT_LCC_COMMAND.set_project */
extern void T409f16(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_exec_task */
extern T0* T210f8(T0* C, T0* a1);
/* GEANT_EXEC_TASK.make_from_interpreting_element */
extern T0* T306c22(T0* a1);
/* Creation of agent #1 in feature GEANT_EXEC_TASK.make_from_interpreting_element */
extern T0* T306f22ac1(T0* a1, T0* a2);
/* Creation of agent #2 in feature GEANT_EXEC_TASK.make_from_interpreting_element */
extern T0* T306f22ac2(T0* a1, T0* a2);
/* Creation of agent #3 in feature GEANT_EXEC_TASK.make_from_interpreting_element */
extern T0* T306f22ac3(T0* a1, T0* a2);
/* GEANT_EXEC_COMMAND.set_fileset */
extern void T401f14(T0* C, T0* a1);
/* GEANT_EXEC_TASK.fileset_element_name */
extern unsigned char ge52os8923;
extern T0* ge52ov8923;
extern T0* T306f5(T0* C);
/* GEANT_EXEC_TASK.make_from_interpreting_element */
extern void T306f22p1(T0* C, T0* a1);
/* GEANT_EXEC_TASK.make */
extern void T306f23(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_EXEC_TASK.make */
extern T0* T306f23ac1(T0* a1);
/* GEANT_EXEC_TASK.make_with_command */
extern void T306f25(T0* C, T0* a1, T0* a2);
/* GEANT_EXEC_TASK.interpreting_element_make */
extern void T306f28(T0* C, T0* a1, T0* a2);
/* GEANT_EXEC_TASK.set_project */
extern void T306f30(T0* C, T0* a1);
/* GEANT_EXEC_TASK.element_make */
extern void T306f29(T0* C, T0* a1);
/* GEANT_EXEC_TASK.set_xml_element */
extern void T306f31(T0* C, T0* a1);
/* GEANT_EXEC_TASK.set_command */
extern void T306f27(T0* C, T0* a1);
/* GEANT_EXEC_TASK.build_command */
extern void T306f24(T0* C, T0* a1);
/* GEANT_EXEC_COMMAND.make */
extern T0* T401c13(T0* a1);
/* GEANT_EXEC_COMMAND.make */
extern void T401f13p1(T0* C, T0* a1);
/* GEANT_EXEC_COMMAND.set_project */
extern void T401f15(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_ise_task */
extern T0* T210f6(T0* C, T0* a1);
/* GEANT_ISE_TASK.make */
extern T0* T304c35(T0* a1, T0* a2);
/* GEANT_ISE_COMMAND.set_exit_code_variable_name */
extern void T397f30(T0* C, T0* a1);
/* GEANT_ISE_TASK.attribute_value */
extern T0* T304f13(T0* C, T0* a1);
/* GEANT_ISE_TASK.project_variables_resolver */
extern T0* T304f22(T0* C);
/* GEANT_ISE_TASK.exit_code_variable_attribute_name */
extern unsigned char ge62os8896;
extern T0* ge62ov8896;
extern T0* T304f12(T0* C);
/* GEANT_ISE_COMMAND.set_project_path */
extern void T397f29(T0* C, T0* a1);
/* GEANT_ISE_TASK.project_path_attribute_name */
extern unsigned char ge62os8895;
extern T0* ge62ov8895;
extern T0* T304f11(T0* C);
/* GEANT_ISE_COMMAND.set_finish_freezing */
extern void T397f28(T0* C, T1 a1);
/* GEANT_ISE_TASK.finish_freezing_attribute_name */
extern unsigned char ge62os8893;
extern T0* ge62ov8893;
extern T0* T304f10(T0* C);
/* GEANT_ISE_COMMAND.set_finalize_mode */
extern void T397f27(T0* C, T1 a1);
/* GEANT_ISE_TASK.finalize_attribute_name */
extern unsigned char ge62os8892;
extern T0* ge62ov8892;
extern T0* T304f9(T0* C);
/* GEANT_ISE_COMMAND.set_compatible_mode */
extern void T397f26(T0* C, T1 a1);
/* GEANT_ISE_TASK.boolean_value */
extern T1 T304f8(T0* C, T0* a1);
/* GEANT_ISE_TASK.std */
extern T0* T304f21(T0* C);
/* GEANT_ISE_TASK.false_attribute_value */
extern T0* T304f20(T0* C);
/* GEANT_ISE_TASK.true_attribute_value */
extern T0* T304f19(T0* C);
/* GEANT_ISE_TASK.string_ */
extern T0* T304f18(T0* C);
/* GEANT_ISE_TASK.compatible_attribute_name */
extern unsigned char ge62os8891;
extern T0* ge62ov8891;
extern T0* T304f7(T0* C);
/* GEANT_ISE_COMMAND.set_clean */
extern void T397f25(T0* C, T0* a1);
/* GEANT_ISE_TASK.clean_attribute_name */
extern unsigned char ge62os8894;
extern T0* ge62ov8894;
extern T0* T304f6(T0* C);
/* GEANT_ISE_COMMAND.set_system_name */
extern void T397f24(T0* C, T0* a1);
/* GEANT_ISE_TASK.system_attribute_name */
extern unsigned char ge62os8890;
extern T0* ge62ov8890;
extern T0* T304f5(T0* C);
/* GEANT_ISE_COMMAND.set_ace_filename */
extern void T397f23(T0* C, T0* a1);
/* GEANT_ISE_TASK.attribute_value_or_default */
extern T0* T304f15(T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.has_attribute */
extern T1 T304f14(T0* C, T0* a1);
/* GEANT_ISE_TASK.ace_attribute_name */
extern unsigned char ge62os8889;
extern T0* ge62ov8889;
extern T0* T304f17(T0* C);
/* GEANT_ISE_TASK.make */
extern void T304f35p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_ISE_TASK.make */
extern T0* T304f35p1ac1(T0* a1);
/* GEANT_ISE_TASK.make_with_command */
extern void T304f37(T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.interpreting_element_make */
extern void T304f40(T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.set_project */
extern void T304f42(T0* C, T0* a1);
/* GEANT_ISE_TASK.element_make */
extern void T304f41(T0* C, T0* a1);
/* GEANT_ISE_TASK.set_xml_element */
extern void T304f43(T0* C, T0* a1);
/* GEANT_ISE_TASK.set_command */
extern void T304f39(T0* C, T0* a1);
/* GEANT_ISE_TASK.build_command */
extern void T304f36(T0* C, T0* a1);
/* GEANT_ISE_COMMAND.make */
extern T0* T397c22(T0* a1);
/* GEANT_ISE_COMMAND.set_project */
extern void T397f31(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_gec_task */
extern T0* T210f4(T0* C, T0* a1);
/* GEANT_GEC_TASK.make */
extern T0* T297c37(T0* a1, T0* a2);
/* GEANT_GEC_COMMAND.set_exit_code_variable_name */
extern void T393f35(T0* C, T0* a1);
/* GEANT_GEC_TASK.exit_code_variable_attribute_name */
extern unsigned char ge55os8843;
extern T0* ge55ov8843;
extern T0* T297f15(T0* C);
/* GEANT_GEC_COMMAND.set_garbage_collector */
extern void T393f34(T0* C, T0* a1);
/* GEANT_GEC_TASK.gc_attribute_name */
extern unsigned char ge55os8845;
extern T0* ge55ov8845;
extern T0* T297f14(T0* C);
/* GEANT_GEC_COMMAND.set_split_size */
extern void T393f33(T0* C, T6 a1);
/* GEANT_GEC_TASK.split_size_attribute_name */
extern unsigned char ge55os8848;
extern T0* ge55ov8848;
extern T0* T297f13(T0* C);
/* GEANT_GEC_COMMAND.set_split_mode */
extern void T393f32(T0* C, T1 a1);
/* GEANT_GEC_TASK.split_attribute_name */
extern unsigned char ge55os8847;
extern T0* ge55ov8847;
extern T0* T297f12(T0* C);
/* GEANT_GEC_COMMAND.set_catcall_mode */
extern void T393f31(T0* C, T0* a1);
/* GEANT_GEC_TASK.attribute_value */
extern T0* T297f11(T0* C, T0* a1);
/* GEANT_GEC_TASK.project_variables_resolver */
extern T0* T297f24(T0* C);
/* GEANT_GEC_TASK.catcall_attribute_name */
extern unsigned char ge55os8841;
extern T0* ge55ov8841;
extern T0* T297f10(T0* C);
/* GEANT_GEC_COMMAND.set_gelint */
extern void T393f30(T0* C, T1 a1);
/* GEANT_GEC_TASK.gelint_attribute_name */
extern unsigned char ge55os8846;
extern T0* ge55ov8846;
extern T0* T297f9(T0* C);
/* GEANT_GEC_COMMAND.set_finalize */
extern void T393f29(T0* C, T1 a1);
/* GEANT_GEC_TASK.finalize_attribute_name */
extern unsigned char ge55os8844;
extern T0* ge55ov8844;
extern T0* T297f8(T0* C);
/* GEANT_GEC_COMMAND.set_c_compile */
extern void T393f28(T0* C, T1 a1);
/* GEANT_GEC_TASK.boolean_value */
extern T1 T297f7(T0* C, T0* a1);
/* GEANT_GEC_TASK.std */
extern T0* T297f23(T0* C);
/* GEANT_GEC_TASK.false_attribute_value */
extern T0* T297f22(T0* C);
/* GEANT_GEC_TASK.true_attribute_value */
extern T0* T297f21(T0* C);
/* GEANT_GEC_TASK.string_ */
extern T0* T297f20(T0* C);
/* GEANT_GEC_TASK.c_compile_attribute_name */
extern unsigned char ge55os8840;
extern T0* ge55ov8840;
extern T0* T297f6(T0* C);
/* GEANT_GEC_COMMAND.set_clean */
extern void T393f27(T0* C, T0* a1);
/* GEANT_GEC_TASK.clean_attribute_name */
extern unsigned char ge55os8842;
extern T0* ge55ov8842;
extern T0* T297f5(T0* C);
/* GEANT_GEC_COMMAND.set_ace_filename */
extern void T393f26(T0* C, T0* a1);
/* GEANT_GEC_TASK.attribute_value_or_default */
extern T0* T297f17(T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.has_attribute */
extern T1 T297f16(T0* C, T0* a1);
/* GEANT_GEC_TASK.ace_attribute_name */
extern unsigned char ge55os8839;
extern T0* ge55ov8839;
extern T0* T297f19(T0* C);
/* GEANT_GEC_TASK.make */
extern void T297f37p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEC_TASK.make */
extern T0* T297f37p1ac1(T0* a1);
/* GEANT_GEC_TASK.make_with_command */
extern void T297f39(T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.interpreting_element_make */
extern void T297f42(T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.set_project */
extern void T297f44(T0* C, T0* a1);
/* GEANT_GEC_TASK.element_make */
extern void T297f43(T0* C, T0* a1);
/* GEANT_GEC_TASK.set_xml_element */
extern void T297f45(T0* C, T0* a1);
/* GEANT_GEC_TASK.set_command */
extern void T297f41(T0* C, T0* a1);
/* GEANT_GEC_TASK.build_command */
extern void T297f38(T0* C, T0* a1);
/* GEANT_GEC_COMMAND.make */
extern T0* T393c25(T0* a1);
/* GEANT_GEC_COMMAND.make */
extern void T393f25p1(T0* C, T0* a1);
/* GEANT_GEC_COMMAND.set_project */
extern void T393f36(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.replace_task_name */
extern unsigned char ge79os2587;
extern T0* ge79ov2587;
extern T0* T210f53(T0* C);
/* GEANT_TASK_FACTORY.input_task_name */
extern unsigned char ge79os2586;
extern T0* ge79ov2586;
extern T0* T210f51(T0* C);
/* GEANT_TASK_FACTORY.available_task_name */
extern unsigned char ge79os2585;
extern T0* ge79ov2585;
extern T0* T210f49(T0* C);
/* GEANT_TASK_FACTORY.precursor_task_name */
extern unsigned char ge79os2584;
extern T0* ge79ov2584;
extern T0* T210f47(T0* C);
/* GEANT_TASK_FACTORY.exit_task_name */
extern unsigned char ge79os2583;
extern T0* ge79ov2583;
extern T0* T210f45(T0* C);
/* GEANT_TASK_FACTORY.outofdate_task_name */
extern unsigned char ge79os2582;
extern T0* ge79ov2582;
extern T0* T210f43(T0* C);
/* GEANT_TASK_FACTORY.xslt_task_name */
extern unsigned char ge79os2581;
extern T0* ge79ov2581;
extern T0* T210f41(T0* C);
/* GEANT_TASK_FACTORY.setenv_task_name */
extern unsigned char ge79os2580;
extern T0* ge79ov2580;
extern T0* T210f39(T0* C);
/* GEANT_TASK_FACTORY.move_task_name */
extern unsigned char ge79os2579;
extern T0* ge79ov2579;
extern T0* T210f37(T0* C);
/* GEANT_TASK_FACTORY.copy_task_name */
extern unsigned char ge79os2578;
extern T0* ge79ov2578;
extern T0* T210f35(T0* C);
/* GEANT_TASK_FACTORY.delete_task_name */
extern unsigned char ge79os2577;
extern T0* ge79ov2577;
extern T0* T210f33(T0* C);
/* GEANT_TASK_FACTORY.mkdir_task_name */
extern unsigned char ge79os2576;
extern T0* ge79ov2576;
extern T0* T210f31(T0* C);
/* GEANT_TASK_FACTORY.echo_task_name */
extern unsigned char ge79os2575;
extern T0* ge79ov2575;
extern T0* T210f29(T0* C);
/* GEANT_TASK_FACTORY.geant_task_name */
extern unsigned char ge79os2574;
extern T0* ge79ov2574;
extern T0* T210f27(T0* C);
/* GEANT_TASK_FACTORY.getest_task_name */
extern unsigned char ge79os2573;
extern T0* ge79ov2573;
extern T0* T210f25(T0* C);
/* GEANT_TASK_FACTORY.gepp_task_name */
extern unsigned char ge79os2572;
extern T0* ge79ov2572;
extern T0* T210f23(T0* C);
/* GEANT_TASK_FACTORY.geyacc_task_name */
extern unsigned char ge79os2571;
extern T0* ge79ov2571;
extern T0* T210f21(T0* C);
/* GEANT_TASK_FACTORY.gelex_task_name */
extern unsigned char ge79os2570;
extern T0* ge79ov2570;
extern T0* T210f19(T0* C);
/* GEANT_TASK_FACTORY.gexace_task_name */
extern unsigned char ge79os2569;
extern T0* ge79ov2569;
extern T0* T210f17(T0* C);
/* GEANT_TASK_FACTORY.unset_task_name */
extern unsigned char ge79os2568;
extern T0* ge79ov2568;
extern T0* T210f15(T0* C);
/* GEANT_TASK_FACTORY.set_task_name */
extern unsigned char ge79os2567;
extern T0* ge79ov2567;
extern T0* T210f13(T0* C);
/* GEANT_TASK_FACTORY.lcc_task_name */
extern unsigned char ge79os2566;
extern T0* ge79ov2566;
extern T0* T210f11(T0* C);
/* GEANT_TASK_FACTORY.exec_task_name */
extern unsigned char ge79os2565;
extern T0* ge79ov2565;
extern T0* T210f9(T0* C);
/* GEANT_TASK_FACTORY.ise_task_name */
extern unsigned char ge79os2564;
extern T0* ge79ov2564;
extern T0* T210f7(T0* C);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].force_new */
extern void T296f37(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].key_storage_put */
extern void T296f44(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].item_storage_put */
extern void T296f43(T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].force */
extern void T390f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].fill_with */
extern void T391f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].extend */
extern void T391f8(T0* C, T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].slots_put */
extern void T296f42(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].clashes_put */
extern void T296f41(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].resize */
extern void T296f40(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].clashes_resize */
extern void T296f49(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].special_integer_ */
extern T0* T296f27(T0* C);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].key_storage_resize */
extern void T296f48(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].item_storage_resize */
extern void T296f47(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].aliased_resized_area */
extern T0* T390f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].aliased_resized_area */
extern T0* T391f3(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].slots_resize */
extern void T296f46(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].new_modulus */
extern T6 T296f24(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].new_capacity */
extern T6 T296f23(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].unset_found_item */
extern void T296f39(T0* C);
/* GEANT_TASK_FACTORY.gec_task_name */
extern unsigned char ge79os2563;
extern T0* ge79ov2563;
extern T0* T210f5(T0* C);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].set_key_equality_tester */
extern void T296f36(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.string_equality_tester */
extern T0* T210f3(T0* C);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_map */
extern T0* T296c35(T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_with_equality_testers */
extern void T296f38(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_sparse_container */
extern void T296f45(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].set_internal_cursor */
extern void T296f54(T0* C, T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].new_cursor */
extern T0* T296f26(T0* C);
/* DS_HASH_TABLE_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make */
extern T0* T392c4(T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_slots */
extern void T296f53(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_clashes */
extern void T296f52(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_key_storage */
extern void T296f51(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_item_storage */
extern void T296f50(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].make */
extern T0* T390f2(T0* C, T6 a1);
/* ARRAY [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].make_empty */
extern T0* T505c4(void);
/* ARRAY [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].make_empty_area */
extern void T505f5(T0* C, T6 a1);
/* SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].make_empty */
extern T0* T391c5(T6 a1);
/* KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].default_create */
extern T0* T390c3(void);
/* GEANT_PROJECT.set_options */
extern void T22f45(T0* C, T0* a1);
/* GEANT_PROJECT.set_variables */
extern void T22f44(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.element_make */
extern void T30f21(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.set_xml_element */
extern void T30f24(T0* C, T0* a1);
/* XM_TREE_CALLBACKS_PIPE.document */
extern T0* T97f8(T0* C);
/* XM_EIFFEL_PARSER.is_correct */
extern T1 T96f120(T0* C);
/* XM_EIFFEL_PARSER.parse_from_stream */
extern void T96f207(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.parse_with_events */
extern void T96f212(T0* C);
/* XM_EIFFEL_PARSER.on_finish */
extern void T96f218(T0* C);
/* XM_EIFFEL_PARSER.parse */
extern void T96f217(T0* C);
/* XM_EIFFEL_PARSER.yy_pop_last_value */
extern void T96f227(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.yy_push_error_value */
extern void T96f226(T0* C);
/* XM_EIFFEL_PARSER.yy_do_action */
extern void T96f225(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.on_notation_declaration */
extern void T96f255(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_notation_declaration */
extern void T152f8(T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.set_public */
extern void T162f5(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].aliased_resized_area */
extern T0* T161f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_EXTERNAL_ID].aliased_resized_area */
extern T0* T163f4(T0* C, T6 a1);
/* XM_DTD_EXTERNAL_ID.set_system */
extern void T162f4(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_dtd_external_id */
extern T0* T96f174(T0* C);
/* XM_DTD_EXTERNAL_ID.make */
extern T0* T162c3(void);
/* XM_EIFFEL_PARSER.when_pe_entity_declared */
extern void T96f254(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].force_new */
extern void T148f38(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_put */
extern void T148f52(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_put */
extern void T148f51(T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].force */
extern void T253f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].fill_with */
extern void T249f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].extend */
extern void T249f10(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_put */
extern void T148f50(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_put */
extern void T148f49(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_item */
extern T6 T148f28(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].hash_position */
extern T6 T148f27(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_item */
extern T6 T148f26(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].resize */
extern void T148f48(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_resize */
extern void T148f57(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].special_integer_ */
extern T0* T148f33(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_resize */
extern void T148f56(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_resize */
extern void T148f55(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].aliased_resized_area */
extern T0* T253f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].aliased_resized_area */
extern T0* T249f4(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_item */
extern T0* T148f23(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_resize */
extern void T148f54(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_modulus */
extern T6 T148f29(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_capacity */
extern T6 T148f24(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].unset_found_item */
extern void T148f43(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].has */
extern T1 T148f31(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].search_position */
extern void T148f40(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_def */
extern T0* T186c208(T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_literal */
extern void T186f210(T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.default_create */
extern T0* T150c3(void);
/* XM_EIFFEL_PE_ENTITY_DEF.make_scanner */
extern void T186f211(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T186f213(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset_sent */
extern void T186f216(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T186f213p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T186f213p0(T0* C);
/* DS_LINKED_STACK [INTEGER_32].make */
extern T0* T245c5(void);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T186f213p2(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.make_with_buffer */
extern void T186f212(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_load_input_buffer */
extern void T186f215(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_content */
extern void T186f218(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.special_integer_ */
extern T0* T186f91(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_initialize */
extern void T186f214(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_build_tables */
extern void T186f217(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template */
extern unsigned char ge1798os7211;
extern T0* ge1798ov7211;
extern T0* T186f52(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_fixed_array */
extern T0* T186f56(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_meta_template */
extern unsigned char ge1798os7210;
extern T0* ge1798ov7210;
extern T0* T186f50(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_ec_template */
extern unsigned char ge1798os7209;
extern T0* ge1798ov7209;
extern T0* T186f70(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template */
extern unsigned char ge1798os7208;
extern T0* ge1798ov7208;
extern T0* T186f65(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template */
extern unsigned char ge1798os7207;
extern T0* ge1798ov7207;
extern T0* T186f54(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template */
extern unsigned char ge1798os7200;
extern T0* ge1798ov7200;
extern T0* T186f51(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_6 */
extern void T186f230(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_array_subcopy */
extern void T186f231(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* KL_ARRAY_ROUTINES [INTEGER_32].subcopy */
extern void T292f2(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* ARRAY [INTEGER_32].subcopy */
extern void T225f13(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER_32].copy_data */
extern void T63f11(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER_32].force */
extern void T63f13(T0* C, T6 a1, T6 a2);
/* SPECIAL [INTEGER_32].move_data */
extern void T63f12(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].overlapping_move */
extern void T63f15(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].non_overlapping_move */
extern void T63f14(T0* C, T6 a1, T6 a2, T6 a3);
/* XM_EIFFEL_PE_ENTITY_DEF.integer_array_ */
extern unsigned char ge122os3008;
extern T0* ge122ov3008;
extern T0* T186f57(T0* C);
/* KL_ARRAY_ROUTINES [INTEGER_32].default_create */
extern T0* T292c1(void);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_5 */
extern void T186f229(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_4 */
extern void T186f228(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_3 */
extern void T186f227(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_2 */
extern void T186f226(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_1 */
extern void T186f225(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template */
extern unsigned char ge1798os7193;
extern T0* ge1798ov7193;
extern T0* T186f69(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_6 */
extern void T186f224(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_5 */
extern void T186f223(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_4 */
extern void T186f222(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_3 */
extern void T186f221(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_2 */
extern void T186f220(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_1 */
extern void T186f219(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.empty_buffer */
extern T0* T186f59(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.make */
extern T0* T240c8(void);
/* XM_EIFFEL_PE_ENTITY_DEF.make_external */
extern void T186f209(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.new_external_entity */
extern T0* T96f173(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.make_external */
extern T0* T183c207(T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_scanner */
extern void T183f208(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T183f210(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T183f210p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T183f210p0(T0* C);
/* XM_EIFFEL_ENTITY_DEF.make_with_buffer */
extern void T183f209(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_load_input_buffer */
extern void T183f212(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_content */
extern void T183f214(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.special_integer_ */
extern T0* T183f57(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_initialize */
extern void T183f211(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_build_tables */
extern void T183f213(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template */
extern T0* T183f50(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_fixed_array */
extern T0* T183f54(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_meta_template */
extern T0* T183f48(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_ec_template */
extern T0* T183f68(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template */
extern T0* T183f63(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template */
extern T0* T183f52(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template */
extern T0* T183f49(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_6 */
extern void T183f226(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_array_subcopy */
extern void T183f227(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_ENTITY_DEF.integer_array_ */
extern T0* T183f55(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_5 */
extern void T183f225(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_4 */
extern void T183f224(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_3 */
extern void T183f223(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_2 */
extern void T183f222(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_1 */
extern void T183f221(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template */
extern T0* T183f67(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_6 */
extern void T183f220(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_5 */
extern void T183f219(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_4 */
extern void T183f218(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_3 */
extern void T183f217(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_2 */
extern void T183f216(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_1 */
extern void T183f215(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.empty_buffer */
extern T0* T183f51(T0* C);
/* XM_EIFFEL_PARSER.on_entity_declaration */
extern void T96f253(T0* C, T0* a1, T1 a2, T0* a3, T0* a4, T0* a5);
/* XM_DTD_CALLBACKS_NULL.on_entity_declaration */
extern void T152f7(T0* C, T0* a1, T1 a2, T0* a3, T0* a4, T0* a5);
/* XM_EIFFEL_PARSER.when_entity_declared */
extern void T96f252(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.new_literal_entity */
extern T0* T96f172(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_literal */
extern T0* T183c206(T0* a1, T0* a2);
/* XM_DTD_ATTRIBUTE_CONTENT.set_default_value */
extern void T171f26(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_fixed */
extern void T171f25(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_implied */
extern void T171f24(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_required */
extern void T171f23(T0* C);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].aliased_resized_area */
extern T0* T173f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].aliased_resized_area */
extern T0* T175f4(T0* C, T6 a1);
/* DS_BILINKED_LIST [STRING_8].force_last */
extern void T174f11(T0* C, T0* a1);
/* detachable DS_BILINKABLE [STRING_8].put_right */
extern void T269f5(T0* C, T0* a1);
/* detachable DS_BILINKABLE [STRING_8].attach_left */
extern void T269f6(T0* C, T0* a1);
/* detachable DS_BILINKABLE [STRING_8].make */
extern T0* T269c4(T0* a1);
/* XM_EIFFEL_PARSER.new_string_bilinked_list */
extern T0* T96f169(T0* C);
/* DS_BILINKED_LIST [STRING_8].set_equality_tester */
extern void T174f12(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.string_equality_tester */
extern T0* T96f184(T0* C);
/* DS_BILINKED_LIST [STRING_8].make */
extern T0* T174c10(void);
/* DS_BILINKED_LIST [STRING_8].set_internal_cursor */
extern void T174f13(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].new_cursor */
extern T0* T174f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].make */
extern T0* T268c8(T0* a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].force */
extern void T173f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].fill_with */
extern void T175f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].extend */
extern void T175f9(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration_list */
extern void T171f22(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration */
extern void T171f27(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.default_enumeration_list */
extern unsigned char ge1708os8023;
extern T0* ge1708ov8023;
extern T0* T171f7(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_notation */
extern void T171f21(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_token */
extern void T171f20(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_entity */
extern void T171f19(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_list_type */
extern void T171f18(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id_ref */
extern void T171f17(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id */
extern void T171f16(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_data */
extern void T171f15(T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content */
extern T0* T96f168(T0* C);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].aliased_resized_area */
extern T0* T170f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].aliased_resized_area */
extern T0* T172f4(T0* C, T6 a1);
/* XM_DTD_ATTRIBUTE_CONTENT.make */
extern T0* T171c12(void);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].force */
extern void T170f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].fill_with */
extern void T172f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].extend */
extern void T172f9(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.copy_default */
extern void T171f14(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_implied */
extern T1 T171f11(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_required */
extern T1 T171f10(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.has_default_value */
extern T1 T171f9(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_fixed */
extern T1 T171f8(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_name */
extern void T171f13(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].force */
extern void T167f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].fill_with */
extern void T169f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].extend */
extern void T169f9(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].aliased_resized_area */
extern T0* T167f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].aliased_resized_area */
extern T0* T169f4(T0* C, T6 a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].force_last */
extern void T168f8(T0* C, T0* a1);
/* detachable DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].put_right */
extern void T264f5(T0* C, T0* a1);
/* detachable DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].attach_left */
extern void T264f6(T0* C, T0* a1);
/* detachable DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T264c4(T0* a1);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content_list */
extern T0* T96f166(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T168c7(void);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].set_internal_cursor */
extern void T168f9(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].new_cursor */
extern T0* T168f5(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T263c8(T0* a1);
/* XM_EIFFEL_PARSER.on_attribute_declarations */
extern void T96f251(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].forth */
extern void T263f10(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_forth */
extern void T168f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].add_traversing_cursor */
extern void T168f12(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set_next_cursor */
extern void T263f12(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].remove_traversing_cursor */
extern void T168f13(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set */
extern void T263f11(T0* C, T0* a1, T1 a2, T1 a3);
/* XM_EIFFEL_PARSER.on_attribute_declaration */
extern void T96f261(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_DTD_CALLBACKS_NULL.on_attribute_declaration */
extern void T152f9(T0* C, T0* a1, T0* a2, T0* a3);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].item */
extern T0* T263f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].start */
extern void T263f9(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_start */
extern void T168f10(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_off */
extern T1 T168f6(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].off */
extern T1 T263f7(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_more */
extern void T165f11(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_mixed */
extern T0* T165c10(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_mixed */
extern void T165f21(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_choice */
extern void T165f19(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_list */
extern void T165f16(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_default */
extern void T165f22(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one */
extern void T165f12(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_sequence */
extern void T165f20(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T261c6(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].set_internal_cursor */
extern void T261f9(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].new_cursor */
extern T0* T261f5(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T371c3(T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_sequence */
extern T0* T165c9(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_last */
extern void T261f8(T0* C, T0* a1);
/* attached DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].put_right */
extern void T372f5(T0* C, T0* a1);
/* attached DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].attach_left */
extern void T372f6(T0* C, T0* a1);
/* attached DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T372c4(T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_choice */
extern T0* T165c8(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_first */
extern void T261f7(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.element_name */
extern T0* T96f161(T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_name */
extern T0* T165c15(T0* a1);
/* XM_EIFFEL_PARSER.set_element_repetition */
extern void T96f250(T0* C, T0* a1, T0* a2);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_one */
extern void T165f14(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one_or_more */
extern void T165f13(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_any */
extern T0* T165c7(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_any */
extern void T165f18(T0* C);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].force */
extern void T164f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].fill_with */
extern void T166f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].extend */
extern void T166f9(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].aliased_resized_area */
extern T0* T164f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].aliased_resized_area */
extern T0* T166f4(T0* C, T6 a1);
/* XM_DTD_ELEMENT_CONTENT.make_empty */
extern T0* T165c6(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_empty */
extern void T165f17(T0* C);
/* XM_EIFFEL_PARSER.on_element_declaration */
extern void T96f249(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_element_declaration */
extern void T152f6(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_attribute */
extern void T96f248(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].has */
extern T1 T159f30(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].search_position */
extern void T159f33(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].hash_position */
extern T6 T159f24(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.hash_code */
extern T6 T156f9(T0* C);
/* XM_EIFFEL_PARSER_NAME.item */
extern T0* T156f13(T0* C, T6 a1);
/* DS_BILINKED_LIST [STRING_8].item */
extern T0* T174f7(T0* C, T6 a1);
/* detachable KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].test */
extern T1 T257f1(T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_storage_item */
extern T0* T159f19(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_item */
extern T0* T159f29(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_item */
extern T6 T159f23(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_equality_tester */
extern T0* T159f17(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_item */
extern T6 T159f25(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].force */
extern void T158f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].fill_with */
extern void T160f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].extend */
extern void T160f9(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].aliased_resized_area */
extern T0* T158f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].aliased_resized_area */
extern T0* T160f3(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].force_new */
extern void T159f32(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_put */
extern void T159f39(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_put */
extern void T159f38(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_put */
extern void T159f37(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].resize */
extern void T159f36(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_resize */
extern void T159f48(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].special_integer_ */
extern T0* T159f28(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_storage_resize */
extern void T159f47(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_resize */
extern void T159f46(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_resize */
extern void T159f45(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_modulus */
extern T6 T159f20(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_capacity */
extern T6 T159f26(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].unset_found_item */
extern void T159f35(T0* C);
/* XM_EIFFEL_PARSER.new_name_set */
extern T0* T96f154(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_equal */
extern T0* T159c31(T6 a1);
/* detachable KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T257c2(void);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make */
extern void T159f34(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].set_internal_cursor */
extern void T159f44(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_cursor */
extern T0* T159f21(T0* C);
/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME].make */
extern T0* T258c4(T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_slots */
extern void T159f43(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_clashes */
extern void T159f42(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_key_storage */
extern void T159f41(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_item_storage */
extern void T159f40(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].make */
extern T0* T155f1(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].aliased_resized_area */
extern T0* T157f3(T0* C, T6 a1);
/* ARRAY [XM_EIFFEL_PARSER_NAME].make_empty */
extern T0* T255c4(void);
/* ARRAY [XM_EIFFEL_PARSER_NAME].make_empty_area */
extern void T255f5(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].make_empty */
extern T0* T157c5(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T155c3(void);
/* XM_EIFFEL_PARSER.on_start_tag */
extern void T96f247(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER.on_end_tag */
extern void T96f246(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER_NAME.local_part */
extern T0* T156f12(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].forth */
extern void T268f10(T0* C);
/* DS_BILINKED_LIST [STRING_8].cursor_forth */
extern void T174f15(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].add_traversing_cursor */
extern void T174f16(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T268f12(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].remove_traversing_cursor */
extern void T174f17(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].set */
extern void T268f11(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [STRING_8].item */
extern T0* T268f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].start */
extern void T268f9(T0* C);
/* DS_BILINKED_LIST [STRING_8].cursor_start */
extern void T174f14(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].cursor_off */
extern T1 T174f9(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].off */
extern T1 T268f7(T0* C);
/* XM_EIFFEL_PARSER_NAME.string_ */
extern T0* T156f17(T0* C);
/* XM_EIFFEL_PARSER_NAME.last */
extern T0* T156f16(T0* C);
/* DS_BILINKED_LIST [STRING_8].last */
extern T0* T174f8(T0* C);
/* XM_EIFFEL_PARSER_NAME.ns_prefix */
extern T0* T156f11(T0* C);
/* XM_EIFFEL_PARSER_NAME.is_namespace_name */
extern T1 T156f15(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern void T156f18(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern T0* T156c18(void);
/* XM_EIFFEL_PARSER_NAME.new_string_bilinked_list */
extern T0* T156f7(T0* C);
/* XM_EIFFEL_PARSER_NAME.string_equality_tester */
extern T0* T156f8(T0* C);
/* XM_EIFFEL_PARSER.on_start_tag_finish */
extern void T96f245(T0* C);
/* XM_EIFFEL_PARSER_NAME.is_equal */
extern T1 T156f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.same_string */
extern T1 T156f14(T0* C, T0* a1, T0* a2);
/* KL_SPECIAL_ROUTINES [BOOLEAN].force */
extern void T176f6(T0* C, T0* a1, T1 a2, T6 a3);
/* KL_SPECIAL_ROUTINES [BOOLEAN].aliased_resized_area */
extern T0* T176f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [BOOLEAN].aliased_resized_area */
extern T0* T177f4(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.when_external_dtd */
extern void T96f244(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern T0* T184c199(void);
/* XM_EIFFEL_SCANNER_DTD.set_start_condition */
extern void T184f206(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern void T184f199p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T184f208(T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T184f208p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_with_buffer */
extern void T184f207(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_load_input_buffer */
extern void T184f218(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_content */
extern void T184f219(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.special_integer_ */
extern T0* T184f62(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_initialize */
extern void T184f217(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_build_tables */
extern void T184f222(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template */
extern T0* T184f193(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_fixed_array */
extern T0* T184f196(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_meta_template */
extern T0* T184f192(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_ec_template */
extern T0* T184f191(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template */
extern T0* T184f190(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template */
extern T0* T184f189(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template */
extern T0* T184f188(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_6 */
extern void T184f234(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_array_subcopy */
extern void T184f235(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_SCANNER_DTD.integer_array_ */
extern T0* T184f198(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_5 */
extern void T184f233(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_4 */
extern void T184f232(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_3 */
extern void T184f231(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_2 */
extern void T184f230(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_1 */
extern void T184f229(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template */
extern T0* T184f187(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_6 */
extern void T184f228(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_5 */
extern void T184f227(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_4 */
extern void T184f226(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_3 */
extern void T184f225(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_2 */
extern void T184f224(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_1 */
extern void T184f223(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.empty_buffer */
extern T0* T184f50(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].force */
extern void T146f8(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.null_resolver */
extern unsigned char ge1796os5993;
extern T0* ge1796ov5993;
extern T0* T96f94(T0* C);
/* XM_NULL_EXTERNAL_RESOLVER.last_error */
extern T0* T150f1(T0* C);
/* XM_EIFFEL_PARSER.resolve_external_id */
extern void T96f260(T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.resolve */
extern void T150f5(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_public */
extern void T150f4(T0* C, T0* a1, T0* a2);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].force */
extern void T161f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_DTD_EXTERNAL_ID].fill_with */
extern void T163f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_EXTERNAL_ID].extend */
extern void T163f9(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_dtd_end */
extern void T96f243(T0* C);
/* XM_DTD_CALLBACKS_NULL.on_dtd_end */
extern void T152f5(T0* C);
/* XM_EIFFEL_PARSER.on_doctype */
extern void T96f242(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_DTD_CALLBACKS_NULL.on_doctype */
extern void T152f4(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_EIFFEL_DECLARATION.set_encoding */
extern void T179f9(T0* C, T0* a1);
/* XM_EIFFEL_DECLARATION.set_stand_alone */
extern void T179f8(T0* C, T1 a1);
/* XM_EIFFEL_DECLARATION.set_version */
extern void T179f11(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].force */
extern void T178f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_EIFFEL_DECLARATION].fill_with */
extern void T180f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_DECLARATION].extend */
extern void T180f9(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].aliased_resized_area */
extern T0* T178f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_DECLARATION].aliased_resized_area */
extern T0* T180f4(T0* C, T6 a1);
/* XM_EIFFEL_DECLARATION.make */
extern T0* T179c7(void);
/* XM_EIFFEL_DECLARATION.process */
extern void T179f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_xml_declaration */
extern void T96f264(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_EIFFEL_PARSER.apply_encoding */
extern void T96f241(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_content */
extern void T96f240(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_dtd_processing_instruction */
extern void T96f239(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_dtd_processing_instruction */
extern void T152f3(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_processing_instruction */
extern void T96f238(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_dtd_comment */
extern void T96f237(T0* C, T0* a1);
/* XM_DTD_CALLBACKS_NULL.on_dtd_comment */
extern void T152f2(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_comment */
extern void T96f236(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.entity_referenced_in_entity_value */
extern T0* T96f144(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.defined_entity_referenced */
extern T0* T96f196(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.external_entity_to_string */
extern T0* T96f202(T0* C, T0* a1);
/* STRING_8.remove */
extern void T17f52(T0* C, T6 a1);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_finish */
extern void T150f6(T0* C);
/* XM_EIFFEL_INPUT_STREAM.read_string */
extern void T228f29(T0* C, T6 a1);
/* XM_EIFFEL_INPUT_STREAM.last_character */
extern T2 T228f19(T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].item */
extern T2 T357f4(T0* C);
/* XM_EIFFEL_INPUT_STREAM.end_of_input */
extern T1 T228f18(T0* C);
/* KL_TEXT_INPUT_FILE.end_of_input */
extern T1 T55f31(T0* C);
/* XM_EIFFEL_INPUT_STREAM.read_character */
extern void T228f31(T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].remove */
extern void T357f6(T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].wipe_out */
extern void T357f8(T0* C);
/* XM_EIFFEL_INPUT_STREAM.noqueue_read_character */
extern void T228f33(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf16_read_character */
extern void T228f35(T0* C);
/* XM_EIFFEL_INPUT_STREAM.append_character */
extern void T228f36(T0* C, T6 a1);
/* DS_LINKED_QUEUE [CHARACTER_8].force */
extern void T357f7(T0* C, T2 a1);
/* detachable DS_LINKABLE [CHARACTER_8].put_right */
extern void T484f4(T0* C, T0* a1);
/* detachable DS_LINKABLE [CHARACTER_8].make */
extern T0* T484c3(T2 a1);
/* UC_UTF8_ROUTINES.append_code_to_utf8 */
extern void T226f37(T0* C, T0* a1, T6 a2);
/* UC_UTF8_ROUTINES.integer_ */
extern T0* T226f29(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf8 */
extern T0* T228f22(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf8_buffer */
extern unsigned char ge1791os8495;
extern T0* ge1791ov8495;
extern T0* T228f25(T0* C);
/* UC_UTF16_ROUTINES.surrogate */
extern T6 T358f7(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_low_surrogate */
extern T1 T358f6(T0* C, T6 a1);
/* UC_UTF16_ROUTINES.least_10_bits */
extern T6 T358f5(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_high_surrogate */
extern T1 T358f4(T0* C, T6 a1);
/* UC_UTF16_ROUTINES.is_surrogate */
extern T1 T358f3(T0* C, T6 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16 */
extern unsigned char ge218os5548;
extern T0* ge218ov5548;
extern T0* T228f20(T0* C);
/* UC_UTF16_ROUTINES.default_create */
extern T0* T358c16(void);
/* XM_EIFFEL_INPUT_STREAM.least_significant */
extern T6 T228f24(T0* C, T2 a1, T2 a2);
/* XM_EIFFEL_INPUT_STREAM.most_significant */
extern T6 T228f23(T0* C, T2 a1, T2 a2);
/* XM_EIFFEL_INPUT_STREAM.latin1_read_character */
extern void T228f34(T0* C);
/* KL_STRING_INPUT_STREAM.read_character */
extern void T502f10(T0* C);
/* KL_TEXT_INPUT_FILE.read_character */
extern void T55f72(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_character */
extern void T55f73(T0* C);
/* KL_TEXT_INPUT_FILE.file_gc */
extern T2 T55f34(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.old_end_of_file */
extern T1 T55f33(T0* C);
/* KL_TEXT_INPUT_FILE.file_feof */
extern T1 T55f35(T0* C, T14 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16_detect_read_character */
extern void T228f32(T0* C);
/* UC_UTF8_ROUTINES.is_endian_detection_character */
extern T1 T226f31(T0* C, T2 a1, T2 a2, T2 a3);
/* UC_UTF8_ROUTINES.is_endian_detection_character_start */
extern T1 T226f30(T0* C, T2 a1, T2 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_least_first */
extern T1 T358f2(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_most_first */
extern T1 T358f1(T0* C, T6 a1, T6 a2);
/* KL_STRING_ROUTINES.wipe_out */
extern void T75f21(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.string_ */
extern T0* T228f17(T0* C);
/* KL_PLATFORM.maximum_integer */
extern unsigned char ge201os8556;
extern T6 ge201ov8556;
extern T6 T230f2(T0* C);
/* KL_INTEGER_ROUTINES.platform */
extern T0* T229f1(T0* C);
/* XM_EIFFEL_PARSER.integer_ */
extern T0* T96f203(T0* C);
/* XM_EIFFEL_INPUT_STREAM.make_from_stream */
extern T0* T228c28(T0* a1);
/* DS_LINKED_QUEUE [CHARACTER_8].make */
extern T0* T357c5(void);
/* XM_NULL_EXTERNAL_RESOLVER.last_stream */
extern T0* T150f2(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item */
extern T0* T148f21(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_item */
extern T0* T148f35(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.force_error */
extern void T96f235(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.report_error */
extern void T96f233(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_error */
extern void T96f259(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.setup_error_state */
extern void T96f258(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.onstring_utf8 */
extern T0* T96f133(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.maximum_item_code */
extern T6 T96f191(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_latin1 */
extern T1 T96f190(T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_from_utf8 */
extern T0* T96f186(T0* C, T0* a1);
/* UC_UTF8_STRING.make_from_utf8 */
extern T0* T227c58(T0* a1);
/* UC_UTF8_STRING.append_utf8 */
extern void T227f68(T0* C, T0* a1);
/* UC_UTF8_ROUTINES.valid_utf8 */
extern T1 T226f1(T0* C, T0* a1);
/* UC_UTF8_ROUTINES.is_encoded_next_byte */
extern T1 T226f10(T0* C, T2 a1);
/* UC_UTF8_ROUTINES.is_encoded_second_byte */
extern T1 T226f5(T0* C, T2 a1, T2 a2);
/* UC_UTF8_ROUTINES.is_encoded_first_byte */
extern T1 T226f2(T0* C, T2 a1);
/* XM_EIFFEL_PARSER.utf8 */
extern T0* T96f189(T0* C);
/* XM_EIFFEL_PARSER.is_string_mode_ascii */
extern T1 T96f187(T0* C);
/* XM_EIFFEL_PARSER.onstring_ascii */
extern T0* T96f131(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_unicode */
extern T1 T96f185(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string */
extern T0* T96f142(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_string */
extern unsigned char ge1796os6060;
extern T0* ge1796ov6060;
extern T0* T96f195(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_uc */
extern unsigned char ge1796os6061;
extern T0* ge1796ov6061;
extern T0* T96f194(T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_empty */
extern T0* T96f201(T0* C);
/* UC_UTF8_STRING.make_empty */
extern T0* T227c62(void);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].force */
extern void T155f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].fill_with */
extern void T157f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].extend */
extern void T157f9(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].aliased_resized_area */
extern T0* T155f2(T0* C, T0* a1, T6 a2);
/* XM_EIFFEL_PARSER.namespace_force_last */
extern void T96f234(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER_NAME.force_last */
extern void T156f19(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.can_force_last */
extern T1 T156f6(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_namespace_name */
extern T0* T96f141(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_namespaces */
extern T0* T156c20(void);
/* XM_EIFFEL_PARSER.yy_push_last_value */
extern void T96f224(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.accept */
extern void T96f223(T0* C);
/* XM_EIFFEL_PARSER.yy_do_error_action */
extern void T96f221(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.report_eof_expected_error */
extern void T96f232(T0* C);
/* XM_EIFFEL_PARSER.read_token */
extern void T96f220(T0* C);
/* XM_EIFFEL_PARSER.process_attribute_entity */
extern void T96f231(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_entity_scanner */
extern void T96f257(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_start_condition */
extern void T183f229(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_start_condition */
extern void T186f233(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.apply_input_buffer */
extern void T183f228(T0* C);
/* KL_STRING_INPUT_STREAM.make */
extern T0* T502c9(T0* a1);
/* UC_UTF8_ROUTINES.to_utf8 */
extern T0* T226f35(T0* C, T0* a1);
extern T1 T226f35ot1(T0* a1, T0** a2);
/* XM_EIFFEL_ENTITY_DEF.utf8 */
extern T0* T183f66(T0* C);
/* XM_EIFFEL_ENTITY_DEF.fatal_error */
extern void T183f236(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.apply_input_buffer */
extern void T186f232(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.utf8 */
extern T0* T186f68(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.fatal_error */
extern void T186f240(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.is_literal */
extern T1 T183f61(T0* C);
/* XM_EIFFEL_ENTITY_DEF.is_external */
extern T1 T183f64(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_literal */
extern T1 T186f63(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_external */
extern T1 T186f66(T0* C);
/* XM_EIFFEL_PARSER.process_entity */
extern void T96f230(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_pe_entity */
extern void T96f229(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.special_integer_ */
extern T0* T96f124(T0* C);
/* XM_EIFFEL_PARSER.yy_init_value_stacks */
extern void T96f219(T0* C);
/* XM_EIFFEL_PARSER.yy_clear_all */
extern void T96f228(T0* C);
/* XM_EIFFEL_PARSER.clear_all */
extern void T96f256(T0* C);
/* XM_EIFFEL_PARSER.clear_stacks */
extern void T96f262(T0* C);
/* XM_EIFFEL_PARSER.yy_clear_value_stacks */
extern void T96f263(T0* C);
/* SPECIAL [XM_EIFFEL_DECLARATION].keep_head */
extern void T180f8(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_DECLARATION].set_count */
extern void T180f10(T0* C, T6 a1);
/* SPECIAL [BOOLEAN].keep_head */
extern void T177f9(T0* C, T6 a1);
/* SPECIAL [BOOLEAN].set_count */
extern void T177f11(T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].keep_head */
extern void T175f8(T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].set_count */
extern void T175f10(T0* C, T6 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].keep_head */
extern void T172f8(T0* C, T6 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].set_count */
extern void T172f10(T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].keep_head */
extern void T169f8(T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].set_count */
extern void T169f10(T0* C, T6 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].keep_head */
extern void T166f8(T0* C, T6 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].set_count */
extern void T166f10(T0* C, T6 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].keep_head */
extern void T163f8(T0* C, T6 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].set_count */
extern void T163f10(T0* C, T6 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].keep_head */
extern void T160f8(T0* C, T6 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].set_count */
extern void T160f10(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].keep_head */
extern void T157f8(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].set_count */
extern void T157f10(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.abort */
extern void T96f222(T0* C);
/* XM_EIFFEL_PARSER.on_start */
extern void T96f216(T0* C);
/* XM_EIFFEL_PARSER.reset_error_state */
extern void T96f215(T0* C);
/* XM_EIFFEL_PARSER.reset */
extern void T96f211(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].wipe_out */
extern void T148f37(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_wipe_out */
extern void T148f47(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_wipe_out */
extern void T148f46(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_wipe_out */
extern void T148f45(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_wipe_out */
extern void T148f44(T0* C);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].keep_head */
extern void T249f6(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].set_count */
extern void T249f9(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].move_all_cursors_after */
extern void T148f42(T0* C);
/* detachable DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].set_next_cursor */
extern void T252f8(T0* C, T0* a1);
/* detachable DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].set_after */
extern void T252f7(T0* C);
/* XM_EIFFEL_PARSER.make_scanner */
extern void T96f209(T0* C);
/* XM_EIFFEL_SCANNER.make_scanner */
extern T0* T142c197(void);
/* XM_EIFFEL_SCANNER.reset */
extern void T142f205(T0* C);
/* XM_EIFFEL_SCANNER.reset */
extern void T142f205p1(T0* C);
/* XM_EIFFEL_SCANNER.make_with_buffer */
extern void T142f204(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_load_input_buffer */
extern void T142f213(T0* C);
/* XM_EIFFEL_SCANNER.yy_set_content */
extern void T142f214(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.special_integer_ */
extern T0* T142f51(T0* C);
/* XM_EIFFEL_SCANNER.yy_initialize */
extern void T142f212(T0* C);
/* XM_EIFFEL_SCANNER.yy_build_tables */
extern void T142f220(T0* C);
/* XM_EIFFEL_SCANNER.yy_accept_template */
extern T0* T142f191(T0* C);
/* XM_EIFFEL_SCANNER.yy_fixed_array */
extern T0* T142f194(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_meta_template */
extern T0* T142f190(T0* C);
/* XM_EIFFEL_SCANNER.yy_ec_template */
extern T0* T142f189(T0* C);
/* XM_EIFFEL_SCANNER.yy_def_template */
extern T0* T142f188(T0* C);
/* XM_EIFFEL_SCANNER.yy_base_template */
extern T0* T142f187(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template */
extern T0* T142f186(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_6 */
extern void T142f232(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_array_subcopy */
extern void T142f233(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_SCANNER.integer_array_ */
extern T0* T142f196(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_5 */
extern void T142f231(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_4 */
extern void T142f230(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_3 */
extern void T142f229(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_2 */
extern void T142f228(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_1 */
extern void T142f227(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template */
extern T0* T142f185(T0* C);
/* XM_EIFFEL_SCANNER.yy_nxt_template_6 */
extern void T142f226(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_5 */
extern void T142f225(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_4 */
extern void T142f224(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_3 */
extern void T142f223(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_2 */
extern void T142f222(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_1 */
extern void T142f221(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.empty_buffer */
extern T0* T142f43(T0* C);
/* GEANT_PROJECT_PARSER.make */
extern T0* T56c8(T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.enable_position_table */
extern void T100f10(T0* C, T0* a1);
/* XM_POSITION_TABLE.make */
extern T0* T104c4(void);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T201c7(void);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].set_internal_cursor */
extern void T201f8(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.set_callbacks */
extern void T96f206(T0* C, T0* a1);
/* XM_TREE_CALLBACKS_PIPE.make */
extern T0* T97c10(void);
/* XM_TREE_CALLBACKS_PIPE.callbacks_pipe */
extern T0* T97f9(T0* C, T0* a1);
/* ARRAY [XM_CALLBACKS_FILTER].item */
extern T0* T189f4(T0* C, T6 a1);
/* XM_CALLBACKS_TO_TREE_FILTER.make_null */
extern T0* T100c9(void);
/* XM_CALLBACKS_TO_TREE_FILTER.make_next */
extern void T100f11(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.initialize */
extern void T100f12(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_equal */
extern T0* T190c31(T6 a1);
/* detachable KL_EQUALITY_TESTER [XM_NAMESPACE].default_create */
extern T0* T275c2(void);
/* DS_HASH_SET [XM_NAMESPACE].make */
extern void T190f32(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].set_internal_cursor */
extern void T190f38(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].new_cursor */
extern T0* T190f24(T0* C);
/* DS_HASH_SET_CURSOR [XM_NAMESPACE].make */
extern T0* T276c4(T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].unset_found_item */
extern void T190f37(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_slots */
extern void T190f36(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_modulus */
extern T6 T190f21(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_clashes */
extern void T190f35(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_key_storage */
extern void T190f34(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_item_storage */
extern void T190f33(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].make */
extern T0* T277f1(T0* C, T6 a1);
/* SPECIAL [XM_NAMESPACE].aliased_resized_area */
extern T0* T278f4(T0* C, T6 a1);
/* ARRAY [XM_NAMESPACE].make_empty */
extern T0* T378c4(void);
/* ARRAY [XM_NAMESPACE].make_empty_area */
extern void T378f5(T0* C, T6 a1);
/* SPECIAL [XM_NAMESPACE].make_empty */
extern T0* T278c5(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].default_create */
extern T0* T277c3(void);
/* XM_DOCUMENT.make */
extern T0* T101c10(void);
/* XM_DOCUMENT.make_with_root_named */
extern void T101f11(T0* C, T0* a1, T0* a2);
/* XM_DOCUMENT.force_last */
extern void T101f12(T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].force_last */
extern void T192f12(T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].force_last */
extern void T192f12p1(T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_DOCUMENT_NODE].put_right */
extern void T279f4(T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_DOCUMENT_NODE].make */
extern T0* T279c3(T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].before_addition */
extern void T192f14(T0* C, T0* a1);
/* XM_DOCUMENT.before_addition */
extern void T101f13(T0* C, T0* a1);
/* XM_ELEMENT.equality_delete */
extern void T102f27(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].remove */
extern void T196f14(T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].remove_at_cursor */
extern void T199f17(T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].move_all_cursors */
extern void T199f24(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].set_current_cell */
extern void T196f18(T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_ELEMENT_NODE].put */
extern void T294f6(T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_ELEMENT_NODE].put_right */
extern void T294f4(T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].set_last_cell */
extern void T199f23(T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_ELEMENT_NODE].forget_right */
extern void T294f5(T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].remove_last */
extern void T199f22(T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].move_last_cursors_after */
extern void T199f27(T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].wipe_out */
extern void T199f25(T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].move_all_cursors_after */
extern void T199f28(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].is_last */
extern T1 T196f7(T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].cursor_is_last */
extern T1 T199f10(T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].remove_first */
extern void T199f21(T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].set_first_cell */
extern void T199f26(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].is_first */
extern T1 T196f6(T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].cursor_is_first */
extern T1 T199f9(T0* C, T0* a1);
/* XM_DOCUMENT.equality_delete */
extern void T101f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].forth */
extern void T231f13(T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_forth */
extern void T192f17(T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].add_traversing_cursor */
extern void T192f18(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].set_next_cursor */
extern void T231f16(T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].remove_traversing_cursor */
extern void T192f23(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].set */
extern void T231f15(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].remove */
extern void T231f12(T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].remove_at_cursor */
extern void T192f16(T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].move_all_cursors */
extern void T192f22(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].set_current_cell */
extern void T231f17(T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_DOCUMENT_NODE].put */
extern void T279f6(T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].set_last_cell */
extern void T192f21(T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_DOCUMENT_NODE].forget_right */
extern void T279f5(T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].remove_last */
extern void T192f20(T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].move_last_cursors_after */
extern void T192f26(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].set_after */
extern void T231f18(T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].wipe_out */
extern void T192f24(T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].move_all_cursors_after */
extern void T192f27(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].is_last */
extern T1 T231f7(T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_is_last */
extern T1 T192f10(T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].remove_first */
extern void T192f19(T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].set_first_cell */
extern void T192f25(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].is_first */
extern T1 T231f6(T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_is_first */
extern T1 T192f9(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].item */
extern T0* T231f8(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].start */
extern void T231f11(T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_start */
extern void T192f15(T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_off */
extern T1 T192f8(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].off */
extern T1 T231f9(T0* C);
/* XM_DOCUMENT.new_cursor */
extern T0* T101f7(T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].new_cursor */
extern T0* T192f5(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].make */
extern T0* T231c10(T0* a1);
/* XM_DOCUMENT.last */
extern T0* T101f6(T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].last */
extern T0* T192f7(T0* C);
/* XM_DOCUMENT.is_empty */
extern T1 T101f5(T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].is_empty */
extern T1 T192f6(T0* C);
/* XM_ELEMENT.make */
extern T0* T102c23(T0* a1, T0* a2, T0* a3);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].make */
extern T0* T199c11(void);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].set_internal_cursor */
extern void T199f12(T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].make */
extern T0* T192c11(void);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].set_internal_cursor */
extern void T192f13(T0* C, T0* a1);
/* XM_DOCUMENT.default_ns */
extern unsigned char ge1751os6685;
extern T0* ge1751ov6685;
extern T0* T101f3(T0* C);
/* XM_NAMESPACE.make_default */
extern T0* T191c7(void);
/* XM_NAMESPACE.make */
extern void T191f8(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE.make */
extern T0* T191c8(T0* a1, T0* a2);
/* XM_CALLBACKS_TO_TREE_FILTER.null_callbacks */
extern T0* T100f7(T0* C);
/* XM_CALLBACKS_NULL.make */
extern T0* T147c1(void);
/* XM_TREE_CALLBACKS_PIPE.new_stop_on_error */
extern T0* T97f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.make_null */
extern T0* T103c5(void);
/* XM_STOP_ON_ERROR_FILTER.make_next */
extern void T103f6(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.initialize */
extern void T103f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.null_callbacks */
extern T0* T103f4(T0* C);
/* XM_TREE_CALLBACKS_PIPE.new_namespace_resolver */
extern T0* T97f6(T0* C);
/* XM_NAMESPACE_RESOLVER.make_null */
extern T0* T187c26(void);
/* XM_NAMESPACE_RESOLVER.make_next */
extern void T187f37(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.initialize */
extern void T187f38(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_make */
extern void T187f42(T0* C);
/* XM_NAMESPACE_RESOLVER.new_string_queue */
extern T0* T187f20(T0* C);
/* DS_LINKED_QUEUE [STRING_8].make */
extern T0* T274c6(void);
/* XM_NAMESPACE_RESOLVER_CONTEXT.make */
extern T0* T272c10(void);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T375c8(void);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].set_internal_cursor */
extern void T375f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].new_cursor */
extern T0* T375f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T376c8(T0* a1);
/* XM_NAMESPACE_RESOLVER.null_callbacks */
extern T0* T187f13(T0* C);
/* XM_EIFFEL_PARSER.set_string_mode_mixed */
extern void T96f205(T0* C);
/* XM_EIFFEL_PARSER.make */
extern T0* T96c204(void);
/* XM_EIFFEL_PARSER.new_entities_table */
extern T0* T96f91(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].set_key_equality_tester */
extern void T148f39(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_map_default */
extern T0* T148c36(void);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_map */
extern void T148f41(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_with_equality_testers */
extern void T148f53(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_sparse_container */
extern void T148f58(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].set_internal_cursor */
extern void T148f63(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_cursor */
extern T0* T148f34(T0* C);
/* detachable DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T252c6(T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_slots */
extern void T148f62(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_clashes */
extern void T148f61(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_key_storage */
extern void T148f60(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_item_storage */
extern void T148f59(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T253f2(T0* C, T6 a1);
/* ARRAY [XM_EIFFEL_ENTITY_DEF].make_empty */
extern T0* T370c4(void);
/* ARRAY [XM_EIFFEL_ENTITY_DEF].make_empty_area */
extern void T370f5(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].make_empty */
extern T0* T249c5(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].default_create */
extern T0* T253c3(void);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].default_capacity */
extern T6 T148f30(T0* C);
/* XM_EIFFEL_PARSER.make_parser */
extern void T96f210(T0* C);
/* XM_EIFFEL_PARSER.yy_build_parser_tables */
extern void T96f214(T0* C);
/* XM_EIFFEL_PARSER.yycheck_template */
extern unsigned char ge1792os5939;
extern T0* ge1792ov5939;
extern T0* T96f88(T0* C);
/* XM_EIFFEL_PARSER.yyfixed_array */
extern T0* T96f183(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytable_template */
extern unsigned char ge1792os5938;
extern T0* ge1792ov5938;
extern T0* T96f86(T0* C);
/* XM_EIFFEL_PARSER.yypgoto_template */
extern unsigned char ge1792os5937;
extern T0* ge1792ov5937;
extern T0* T96f84(T0* C);
/* XM_EIFFEL_PARSER.yypact_template */
extern unsigned char ge1792os5936;
extern T0* ge1792ov5936;
extern T0* T96f129(T0* C);
/* XM_EIFFEL_PARSER.yydefgoto_template */
extern unsigned char ge1792os5935;
extern T0* ge1792ov5935;
extern T0* T96f127(T0* C);
/* XM_EIFFEL_PARSER.yydefact_template */
extern unsigned char ge1792os5934;
extern T0* ge1792ov5934;
extern T0* T96f125(T0* C);
/* XM_EIFFEL_PARSER.yytypes2_template */
extern unsigned char ge1792os5933;
extern T0* ge1792ov5933;
extern T0* T96f123(T0* C);
/* XM_EIFFEL_PARSER.yytypes1_template */
extern unsigned char ge1792os5932;
extern T0* ge1792ov5932;
extern T0* T96f121(T0* C);
/* XM_EIFFEL_PARSER.yyr1_template */
extern unsigned char ge1792os5931;
extern T0* ge1792ov5931;
extern T0* T96f119(T0* C);
/* XM_EIFFEL_PARSER.yytranslate_template */
extern unsigned char ge1792os5930;
extern T0* ge1792ov5930;
extern T0* T96f106(T0* C);
/* XM_EIFFEL_PARSER.yy_create_value_stacks */
extern void T96f213(T0* C);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].make */
extern T0* T178f1(T0* C, T6 a1);
/* ARRAY [XM_EIFFEL_DECLARATION].make_empty */
extern T0* T271c4(void);
/* ARRAY [XM_EIFFEL_DECLARATION].make_empty_area */
extern void T271f5(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_DECLARATION].make_empty */
extern T0* T180c5(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].default_create */
extern T0* T178c3(void);
/* KL_SPECIAL_ROUTINES [BOOLEAN].make */
extern T0* T176f1(T0* C, T6 a1);
/* ARRAY [BOOLEAN].make_empty */
extern T0* T270c5(void);
/* ARRAY [BOOLEAN].make_empty_area */
extern void T270f6(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].default_create */
extern T0* T176c5(void);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].make */
extern T0* T173f1(T0* C, T6 a1);
/* ARRAY [DS_BILINKED_LIST [STRING_8]].make_empty */
extern T0* T267c4(void);
/* ARRAY [DS_BILINKED_LIST [STRING_8]].make_empty_area */
extern void T267f5(T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].make_empty */
extern T0* T175c5(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].default_create */
extern T0* T173c3(void);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T170f1(T0* C, T6 a1);
/* ARRAY [XM_DTD_ATTRIBUTE_CONTENT].make_empty */
extern T0* T265c4(void);
/* ARRAY [XM_DTD_ATTRIBUTE_CONTENT].make_empty_area */
extern void T265f5(T0* C, T6 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make_empty */
extern T0* T172c5(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].default_create */
extern T0* T170c3(void);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T167f1(T0* C, T6 a1);
/* ARRAY [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make_empty */
extern T0* T262c4(void);
/* ARRAY [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make_empty_area */
extern void T262f5(T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make_empty */
extern T0* T169c5(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].default_create */
extern T0* T167c3(void);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T164f1(T0* C, T6 a1);
/* ARRAY [XM_DTD_ELEMENT_CONTENT].make_empty */
extern T0* T260c4(void);
/* ARRAY [XM_DTD_ELEMENT_CONTENT].make_empty_area */
extern void T260f5(T0* C, T6 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].make_empty */
extern T0* T166c5(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].default_create */
extern T0* T164c3(void);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].make */
extern T0* T161f1(T0* C, T6 a1);
/* ARRAY [XM_DTD_EXTERNAL_ID].make_empty */
extern T0* T259c4(void);
/* ARRAY [XM_DTD_EXTERNAL_ID].make_empty_area */
extern void T259f5(T0* C, T6 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].make_empty */
extern T0* T163c5(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].default_create */
extern T0* T161c3(void);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T158f1(T0* C, T6 a1);
/* ARRAY [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make_empty */
extern T0* T256c4(void);
/* ARRAY [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make_empty_area */
extern void T256f5(T0* C, T6 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make_empty */
extern T0* T160c5(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].default_create */
extern T0* T158c3(void);
/* XM_EIFFEL_PARSER.initialize */
extern void T96f208(T0* C);
/* XM_EIFFEL_PARSER.null_dtd_callbacks */
extern T0* T96f112(T0* C);
/* XM_DTD_CALLBACKS_NULL.make */
extern T0* T152c1(void);
/* XM_EIFFEL_PARSER.null_callbacks */
extern T0* T96f104(T0* C);
/* XM_EXPAT_PARSER_FACTORY.new_expat_parser */
extern T0* T94f2(T0* C);
/* XM_EXPAT_PARSER_FACTORY.is_expat_parser_available */
extern T1 T94f1(T0* C);
/* XM_EXPAT_PARSER_FACTORY.default_create */
extern T0* T94c3(void);
/* KL_TEXT_INPUT_FILE.is_open_read */
extern T1 T55f28(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_read */
extern T1 T55f19(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T55f62(T0* C);
/* KL_TEXT_INPUT_FILE.is_closed */
extern T1 T55f25(T0* C);
/* KL_TEXT_INPUT_FILE.old_open_read */
extern void T55f68(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T55f68p1(T0* C);
/* KL_TEXT_INPUT_FILE.file_open */
extern T14 T55f29(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.old_is_readable */
extern T1 T55f24(T0* C);
/* FILE_INFO.is_readable */
extern T1 T79f10(T0* C);
/* FILE_INFO.file_eaccess */
extern T1 T79f7(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.make */
extern void T55f60(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.make */
extern T0* T55c60(T0* a1);
/* KL_TEXT_INPUT_FILE.make */
extern void T55f60p1(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.old_make */
extern void T55f66(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.make_with_name */
extern void T55f69(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.set_name */
extern void T55f71(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.string_ */
extern T0* T55f22(T0* C);
/* GEANT_PROJECT_LOADER.make */
extern T0* T23c9(T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_file_readable */
extern T1 T53f2(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.is_readable */
extern T1 T55f13(T0* C);
/* KL_UNIX_FILE_SYSTEM.is_file_readable */
extern T1 T54f2(T0* C, T0* a1);
/* GEANT.default_build_filename */
extern unsigned char ge2os1903;
extern T0* ge2ov1903;
extern T0* T21f8(T0* C);
/* GEANT_PROJECT_OPTIONS.set_no_exec */
extern void T24f8(T0* C, T1 a1);
/* GEANT_PROJECT_OPTIONS.set_debug_mode */
extern void T24f7(T0* C, T1 a1);
/* GEANT_PROJECT_OPTIONS.set_verbose */
extern void T24f6(T0* C, T1 a1);
/* GEANT_PROJECT_OPTIONS.make */
extern T0* T24c5(void);
/* GEANT_PROJECT_VARIABLES.make */
extern T0* T25c58(void);
/* GEANT_PROJECT_VARIABLES.verbose_name */
extern unsigned char ge8os2059;
extern T0* ge8ov2059;
extern T0* T25f38(T0* C);
/* GEANT_PROJECT_VARIABLES.exe_name */
extern unsigned char ge8os2058;
extern T0* ge8ov2058;
extern T0* T25f35(T0* C);
/* GEANT_PROJECT_VARIABLES.path_separator_name */
extern unsigned char ge8os2057;
extern T0* ge8ov2057;
extern T0* T25f34(T0* C);
/* GEANT_PROJECT_VARIABLES.is_unix_name */
extern unsigned char ge8os2056;
extern T0* ge8ov2056;
extern T0* T25f30(T0* C);
/* GEANT_PROJECT_VARIABLES.is_windows_name */
extern unsigned char ge8os2055;
extern T0* ge8ov2055;
extern T0* T25f29(T0* C);
/* GEANT_VARIABLES.value */
extern T0* T29f31(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.default_builtin_variables */
extern unsigned char ge10os1909;
extern T0* ge10ov1909;
extern T0* T25f25(T0* C);
/* GEANT_PROJECT_VARIABLES.file_system */
extern T0* T25f40(T0* C);
/* GEANT_PROJECT_VARIABLES.unix_file_system */
extern T0* T25f43(T0* C);
/* GEANT_PROJECT_VARIABLES.windows_file_system */
extern T0* T25f42(T0* C);
/* GEANT_PROJECT_VARIABLES.operating_system */
extern T0* T25f39(T0* C);
/* GEANT_PROJECT_VARIABLES.gobo_os_name */
extern unsigned char ge8os2054;
extern T0* ge8ov2054;
extern T0* T25f24(T0* C);
/* GEANT_PROJECT_VARIABLES.project_variables_resolver */
extern T0* T25f23(T0* C);
/* GEANT_PROJECT_VARIABLES.make */
extern void T25f58p1(T0* C);
/* GEANT_PROJECT_VARIABLES.set_key_equality_tester */
extern void T25f61(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.make_map */
extern void T25f60(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_with_equality_testers */
extern void T25f63(T0* C, T6 a1, T0* a2, T0* a3);
/* GEANT_PROJECT_VARIABLES.make_sparse_container */
extern void T25f71(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.set_internal_cursor */
extern void T25f80(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.new_cursor */
extern T0* T25f36(T0* C);
/* GEANT_PROJECT_VARIABLES.unset_found_item */
extern void T25f64(T0* C);
/* GEANT_PROJECT_VARIABLES.make_slots */
extern void T25f79(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.new_modulus */
extern T6 T25f31(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_clashes */
extern void T25f78(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_key_storage */
extern void T25f77(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_item_storage */
extern void T25f76(T0* C, T6 a1);
/* GEANT.default_builtin_variables */
extern T0* T21f9(T0* C);
/* GEANT.file_system */
extern T0* T21f17(T0* C);
/* GEANT.unix_file_system */
extern T0* T21f19(T0* C);
/* GEANT.windows_file_system */
extern T0* T21f18(T0* C);
/* GEANT.operating_system */
extern T0* T21f16(T0* C);
/* GEANT.read_command_line */
extern void T21f21(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].first */
extern T0* T70f14(T0* C);
/* GEANT_VARIABLES.force */
extern void T29f48(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.key_storage_put */
extern void T29f57(T0* C, T0* a1, T6 a2);
/* GEANT_VARIABLES.slots_put */
extern void T29f56(T0* C, T6 a1, T6 a2);
/* GEANT_VARIABLES.clashes_put */
extern void T29f55(T0* C, T6 a1, T6 a2);
/* GEANT_VARIABLES.resize */
extern void T29f54(T0* C, T6 a1);
/* GEANT_VARIABLES.clashes_resize */
extern void T29f62(T0* C, T6 a1);
/* GEANT_VARIABLES.special_integer_ */
extern T0* T29f28(T0* C);
/* GEANT_VARIABLES.key_storage_resize */
extern void T29f61(T0* C, T6 a1);
/* GEANT_VARIABLES.item_storage_resize */
extern void T29f60(T0* C, T6 a1);
/* GEANT_VARIABLES.slots_resize */
extern void T29f59(T0* C, T6 a1);
/* GEANT_VARIABLES.new_capacity */
extern T6 T29f23(T0* C, T6 a1);
/* GEANT_VARIABLES.item_storage_put */
extern void T29f53(T0* C, T0* a1, T6 a2);
/* GEANT.commandline_variables */
extern T0* T21f12(T0* C);
/* AP_PARSER.final_error_action */
extern void T38f28(T0* C);
/* AP_PARSER.exceptions */
extern T0* T38f13(T0* C);
/* AP_ERROR_HANDLER.report_error_message */
extern void T45f9(T0* C, T0* a1);
/* AP_ERROR_HANDLER.report_error_message */
extern void T45f9p1(T0* C, T0* a1);
/* AP_ERROR_HANDLER.report_error */
extern void T45f8(T0* C, T0* a1);
/* AP_ERROR_HANDLER.message */
extern T0* T45f6(T0* C, T0* a1);
/* AP_ERROR.default_message */
extern T0* T40f17(T0* C);
/* AP_ERROR.message */
extern T0* T40f18(T0* C, T0* a1);
/* AP_ERROR.arguments */
extern unsigned char ge202os1931;
extern T0* ge202ov1931;
extern T0* T40f20(T0* C);
/* KL_ARGUMENTS.make */
extern T0* T27c5(void);
/* KL_ARGUMENTS.argument */
extern T0* T27f2(T0* C, T6 a1);
/* IMMUTABLE_STRING_32.as_string_8 */
extern T0* T85f6(T0* C);
/* ARGUMENTS_32.argument */
extern T0* T84f1(T0* C, T6 a1);
/* ARRAY [IMMUTABLE_STRING_32].item */
extern T0* T138f5(T0* C, T6 a1);
/* ARGUMENTS_32.internal_argument_array */
extern unsigned char ge1407os5769;
extern T0* ge1407ov5769;
extern T0* T84f3(T0* C);
/* ARRAY [IMMUTABLE_STRING_32].put */
extern void T138f8(T0* C, T0* a1, T6 a2);
/* ARGUMENTS_32.i_th_argument_string */
extern T0* T84f4(T0* C, T6 a1);
/* IMMUTABLE_STRING_32.make_from_string */
extern T0* T85c14(T0* a1);
/* STRING_32.area_lower */
extern T6 T18f6(T0* C);
/* NATIVE_STRING.set_shared_from_pointer */
extern void T139f10(T0* C, T14 a1);
/* NATIVE_STRING.set_shared_from_pointer_and_count */
extern void T139f13(T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.set_from_pointer */
extern void T78f17(T0* C, T14 a1, T6 a2);
/* ARGUMENTS_32.default_pointer */
extern T14 T84f6(T0* C);
/* ARRAY [IMMUTABLE_STRING_32].compare_objects */
extern void T138f7(T0* C);
/* ARRAY [IMMUTABLE_STRING_32].make_filled */
extern T0* T138c6(T0* a1, T6 a2, T6 a3);
/* ARRAY [IMMUTABLE_STRING_32].make_filled_area */
extern void T138f9(T0* C, T0* a1, T6 a2);
/* SPECIAL [IMMUTABLE_STRING_32].make_filled */
extern T0* T137c4(T0* a1, T6 a2);
/* SPECIAL [IMMUTABLE_STRING_32].fill_with */
extern void T137f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [IMMUTABLE_STRING_32].extend */
extern void T137f8(T0* C, T0* a1);
/* SPECIAL [IMMUTABLE_STRING_32].make_empty */
extern void T137f6(T0* C, T6 a1);
/* SPECIAL [IMMUTABLE_STRING_32].make_empty */
extern T0* T137c6(T6 a1);
/* IMMUTABLE_STRING_32.make_empty */
extern T0* T85c13(void);
/* IMMUTABLE_STRING_32.make */
extern void T85f15(T0* C, T6 a1);
/* IMMUTABLE_STRING_32.make */
extern T0* T85c15(T6 a1);
/* KL_ARGUMENTS.internal_arguments */
extern unsigned char ge1406os2658;
extern T0* ge1406ov2658;
extern T0* T27f3(T0* C);
/* ARGUMENTS_32.default_create */
extern T0* T84c7(void);
/* ARRAY [STRING_8].valid_index */
extern T1 T33f5(T0* C, T6 a1);
/* AP_ERROR.string_ */
extern T0* T40f19(T0* C);
/* AP_ERROR.make_invalid_parameter_error */
extern T0* T40c21(T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.force */
extern void T34f47(T0* C, T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.search_position */
extern void T34f51(T0* C, T0* a1);
/* GEANT.set_show_target_info */
extern void T21f27(T0* C, T1 a1);
/* AP_STRING_OPTION.parameter */
extern T0* T37f14(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].last */
extern T0* T70f8(T0* C);
/* GEANT.set_debug_mode */
extern void T21f26(T0* C, T1 a1);
/* GEANT.set_no_exec */
extern void T21f25(T0* C, T1 a1);
/* GEANT.set_verbose */
extern void T21f24(T0* C, T1 a1);
/* GEANT.report_version_number */
extern void T21f23(T0* C);
/* UT_ERROR_HANDLER.report_info */
extern void T28f8(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_info_message */
extern void T28f9(T0* C, T0* a1);
/* UT_VERSION_NUMBER.make */
extern T0* T49c8(T0* a1);
/* AP_PARSER.parse_arguments */
extern void T38f27(T0* C);
/* AP_PARSER.parse_list */
extern void T38f30(T0* C, T0* a1);
/* AP_PARSER.check_options_after_parsing */
extern void T38f33(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.forth */
extern void T36f17(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_forth */
extern void T36f19(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.add_traversing_cursor */
extern void T36f20(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [AP_OPTION].set_next_cursor */
extern void T68f9(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.remove_traversing_cursor */
extern void T36f21(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [AP_OPTION].set */
extern void T68f8(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_ARRAYED_LIST [AP_OPTION].forth */
extern void T73f20(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_forth */
extern void T73f24(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].set_position */
extern void T110f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].add_traversing_cursor */
extern void T73f25(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].set_next_cursor */
extern void T110f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].remove_traversing_cursor */
extern void T73f26(T0* C, T0* a1);
/* AP_ERROR.make_surplus_option_error */
extern T0* T40c23(T0* a1);
/* AP_ERROR.make_missing_option_error */
extern T0* T40c22(T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.item_for_iteration */
extern T0* T36f6(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_item */
extern T0* T36f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].item_for_iteration */
extern T0* T73f7(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_item */
extern T0* T73f11(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.after */
extern T1 T36f5(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_after */
extern T1 T36f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].after */
extern T1 T73f9(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_after */
extern T1 T73f10(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].after */
extern T1 T110f5(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.start */
extern void T36f16(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_start */
extern void T36f18(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_off */
extern T1 T36f9(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [AP_OPTION].off */
extern T1 T68f6(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].start */
extern void T73f19(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_start */
extern void T73f23(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].set_after */
extern void T110f9(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].is_empty */
extern T1 T73f15(T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].off */
extern T1 T110f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].before */
extern T1 T110f6(T0* C);
/* AP_PARSER.parse_argument */
extern void T38f32(T0* C, T0* a1);
/* AP_PARSER.parse_short */
extern void T38f35(T0* C, T0* a1);
/* AP_ERROR.make_missing_parameter_error */
extern T0* T40c25(T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].off */
extern T1 T70f7(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].cursor_off */
extern T1 T70f12(T0* C, T0* a1);
/* AP_ERROR.make_unknown_option_error */
extern T0* T40c24(T0* a1);
/* CHARACTER_8.out */
extern T0* T2f1(T2* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].forth */
extern void T74f17(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_forth */
extern void T74f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].set_position */
extern void T114f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].add_traversing_cursor */
extern void T74f22(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].set_next_cursor */
extern void T114f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].remove_traversing_cursor */
extern void T74f23(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].item_for_iteration */
extern T0* T74f6(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_item */
extern T0* T74f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].after */
extern T1 T74f7(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_after */
extern T1 T74f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].after */
extern T1 T114f5(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].start */
extern void T74f16(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_start */
extern void T74f20(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].set_after */
extern void T114f9(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].is_empty */
extern T1 T74f13(T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].off */
extern T1 T114f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].before */
extern T1 T114f6(T0* C);
/* AP_PARSER.parse_long */
extern void T38f34(T0* C, T0* a1);
/* AP_ERROR.make_unnecessary_parameter_error */
extern T0* T40c26(T0* a1, T0* a2);
/* AP_PARSER.string_ */
extern T0* T38f22(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].forth */
extern void T70f25(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].item_for_iteration */
extern T0* T70f18(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].after */
extern T1 T70f13(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].cursor_after */
extern T1 T70f10(T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].start */
extern void T70f24(T0* C);
/* AP_PARSER.reset_parser */
extern void T38f31(T0* C);
/* AP_PARSER.all_options */
extern T0* T38f16(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].has */
extern T1 T73f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].make */
extern T0* T73c17(T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].set_internal_cursor */
extern void T73f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].new_cursor */
extern T0* T73f12(T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].make */
extern T0* T110c8(T0* a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].make */
extern T0* T113f1(T0* C, T6 a1);
/* SPECIAL [AP_OPTION].aliased_resized_area */
extern T0* T112f4(T0* C, T6 a1);
/* ARRAY [AP_OPTION].make_empty */
extern T0* T206c4(void);
/* ARRAY [AP_OPTION].make_empty_area */
extern void T206f5(T0* C, T6 a1);
/* SPECIAL [AP_OPTION].make_empty */
extern T0* T112c5(T6 a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].default_create */
extern T0* T113c3(void);
/* AP_ERROR_HANDLER.reset */
extern void T45f10(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].force */
extern void T70f23(T0* C, T0* a1, T6 a2);
/* KL_ARGUMENTS.argument_count */
extern T6 T27f4(T0* C);
/* AP_PARSER.arguments */
extern T0* T38f11(T0* C);
/* AP_STRING_OPTION.make */
extern T0* T37c25(T2 a1, T0* a2);
/* AP_STRING_OPTION.set_long_form */
extern void T37f29(T0* C, T0* a1);
/* AP_STRING_OPTION.set_short_form */
extern void T37f27(T0* C, T2 a1);
/* AP_STRING_OPTION.initialize */
extern void T37f26(T0* C);
/* AP_STRING_OPTION.initialize */
extern void T37f26p1(T0* C);
/* AP_STRING_OPTION.initialize */
extern void T37f26p0(T0* C);
/* AP_FLAG.make */
extern T0* T35c19(T2 a1, T0* a2);
/* AP_FLAG.set_long_form */
extern void T35f21(T0* C, T0* a1);
/* AP_FLAG.set_short_form */
extern void T35f23(T0* C, T2 a1);
/* AP_FLAG.initialize */
extern void T35f20(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].force_last */
extern void T74f15(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].force */
extern void T116f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].fill_with */
extern void T115f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].extend */
extern void T115f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].resize */
extern void T74f19(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].aliased_resized_area */
extern T0* T116f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].aliased_resized_area */
extern T0* T115f4(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].new_capacity */
extern T6 T74f12(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].extendible */
extern T1 T74f10(T0* C, T6 a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.make */
extern T0* T36c11(T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.old_make */
extern void T36f14(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.set_internal_cursor */
extern void T36f15(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.new_cursor */
extern T0* T36f10(T0* C);
/* DS_LINKED_LIST_CURSOR [AP_OPTION].make */
extern T0* T68c7(T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.set_parameters_description */
extern void T36f13(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.set_introduction_option */
extern void T36f12(T0* C, T0* a1);
/* AP_FLAG.set_description */
extern void T35f18(T0* C, T0* a1);
/* AP_FLAG.make_with_long_form */
extern T0* T35c17(T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].force_last */
extern void T73f18(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].force */
extern void T113f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [AP_OPTION].fill_with */
extern void T112f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [AP_OPTION].extend */
extern void T112f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].resize */
extern void T73f22(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].aliased_resized_area */
extern T0* T113f2(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [AP_OPTION].new_capacity */
extern T6 T73f14(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].extendible */
extern T1 T73f13(T0* C, T6 a1);
/* AP_STRING_OPTION.set_parameter_description */
extern void T37f24(T0* C, T0* a1);
/* AP_STRING_OPTION.set_description */
extern void T37f23(T0* C, T0* a1);
/* AP_STRING_OPTION.make_with_short_form */
extern T0* T37c22(T2 a1);
/* AP_PARSER.set_parameters_description */
extern void T38f26(T0* C, T0* a1);
/* AP_PARSER.set_application_description */
extern void T38f25(T0* C, T0* a1);
/* AP_PARSER.make */
extern T0* T38c24(void);
/* AP_DISPLAY_HELP_FLAG.set_description */
extern void T72f36(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.make */
extern T0* T72c35(T2 a1, T0* a2);
/* AP_DISPLAY_HELP_FLAG.set_long_form */
extern void T72f39(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.set_short_form */
extern void T72f38(T0* C, T2 a1);
/* AP_DISPLAY_HELP_FLAG.initialize */
extern void T72f37(T0* C);
/* AP_PARSER.make_empty */
extern void T38f29(T0* C);
/* AP_ERROR_HANDLER.make_standard */
extern T0* T45c7(void);
/* AP_ERROR_HANDLER.std */
extern T0* T45f5(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T74c14(T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].set_internal_cursor */
extern void T74f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].new_cursor */
extern T0* T74f9(T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T114c8(T0* a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T116f1(T0* C, T6 a1);
/* ARRAY [AP_ALTERNATIVE_OPTIONS_LIST].make_empty */
extern T0* T207c4(void);
/* ARRAY [AP_ALTERNATIVE_OPTIONS_LIST].make_empty_area */
extern void T207f5(T0* C, T6 a1);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].make_empty */
extern T0* T115c5(T6 a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].default_create */
extern T0* T116c3(void);
/* UT_ERROR_HANDLER.make_standard */
extern T0* T28c7(void);
/* UT_ERROR_HANDLER.std */
extern T0* T28f4(T0* C);
/* KL_ARGUMENTS.set_program_name */
extern void T27f6(T0* C, T0* a1);
/* GEANT.arguments */
extern T0* T21f10(T0* C);
/* DIRECTORY.dispose */
extern void T661f20(T0* C);
/* DIRECTORY.close */
extern void T661f25(T0* C);
/* DIRECTORY.default_pointer */
extern T14 T661f7(T0* C);
/* DIRECTORY.dir_close */
extern void T661f30(T0* C, T14 a1);
/* DIRECTORY.is_closed */
extern T1 T661f8(T0* C);
/* RAW_FILE.dispose */
extern void T660f16(T0* C);
/* RAW_FILE.close */
extern void T660f20(T0* C);
/* RAW_FILE.default_pointer */
extern T14 T660f14(T0* C);
/* RAW_FILE.file_close */
extern void T660f22(T0* C, T14 a1);
/* RAW_FILE.is_closed */
extern T1 T660f13(T0* C);
/* KL_BINARY_OUTPUT_FILE.dispose */
extern void T653f25(T0* C);
/* KL_BINARY_OUTPUT_FILE.old_close */
extern void T653f30(T0* C);
/* KL_BINARY_OUTPUT_FILE.default_pointer */
extern T14 T653f16(T0* C);
/* KL_BINARY_OUTPUT_FILE.file_close */
extern void T653f34(T0* C, T14 a1);
/* KL_BINARY_OUTPUT_FILE.old_is_closed */
extern T1 T653f11(T0* C);
/* KL_BINARY_INPUT_FILE.dispose */
extern void T652f37(T0* C);
/* KL_BINARY_INPUT_FILE.old_close */
extern void T652f42(T0* C);
/* KL_BINARY_INPUT_FILE.default_pointer */
extern T14 T652f23(T0* C);
/* KL_BINARY_INPUT_FILE.file_close */
extern void T652f45(T0* C, T14 a1);
/* KL_BINARY_INPUT_FILE.old_is_closed */
extern T1 T652f12(T0* C);
/* KL_TEXT_OUTPUT_FILE.dispose */
extern void T525f26(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_close */
extern void T525f32(T0* C);
/* KL_TEXT_OUTPUT_FILE.default_pointer */
extern T14 T525f16(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_close */
extern void T525f38(T0* C, T14 a1);
/* KL_TEXT_OUTPUT_FILE.old_is_closed */
extern T1 T525f11(T0* C);
/* KL_DIRECTORY.dispose */
extern void T501f44(T0* C);
/* KL_DIRECTORY.old_close */
extern void T501f47(T0* C);
/* KL_DIRECTORY.default_pointer */
extern T14 T501f13(T0* C);
/* KL_DIRECTORY.dir_close */
extern void T501f49(T0* C, T14 a1);
/* KL_DIRECTORY.is_closed */
extern T1 T501f11(T0* C);
/* MANAGED_POINTER.dispose */
extern void T78f10(T0* C);
/* POINTER.memory_free */
extern void T14f11(T14* C);
/* POINTER.default_pointer */
extern T14 T14f8(T14* C);
/* POINTER.c_free */
extern void T14f13(T14* C, T14 a1);
/* KL_TEXT_INPUT_FILE.dispose */
extern void T55f61(T0* C);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].record */
extern void T628f5(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.put */
extern void T598f12(T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.put */
extern void T598f12p1(T0* C, T6 a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].record */
extern void T626f4(T0* C, T0* a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].record */
extern void T624f5(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.add */
extern void T598f11(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.add */
extern void T598f11p1(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.log_validation_messages */
extern void T350f34(T0* C);
/* GEANT_REPLACE_TASK.validation_messages */
extern unsigned char ge10os1913;
extern T0* ge10ov1913;
extern T0* T350f16(T0* C);
/* GEANT_INPUT_TASK.log_validation_messages */
extern void T348f35(T0* C);
/* GEANT_INPUT_TASK.validation_messages */
extern T0* T348f13(T0* C);
/* GEANT_AVAILABLE_TASK.log_validation_messages */
extern void T346f25(T0* C);
/* GEANT_AVAILABLE_TASK.validation_messages */
extern T0* T346f5(T0* C);
/* GEANT_PRECURSOR_TASK.log_validation_messages */
extern void T344f32(T0* C);
/* GEANT_PRECURSOR_TASK.validation_messages */
extern T0* T344f13(T0* C);
/* GEANT_EXIT_TASK.log_validation_messages */
extern void T342f26(T0* C);
/* GEANT_EXIT_TASK.validation_messages */
extern T0* T342f7(T0* C);
/* GEANT_OUTOFDATE_TASK.log_validation_messages */
extern void T340f31(T0* C);
/* GEANT_OUTOFDATE_TASK.validation_messages */
extern T0* T340f13(T0* C);
/* GEANT_XSLT_TASK.log_validation_messages */
extern void T338f44(T0* C);
/* GEANT_XSLT_TASK.validation_messages */
extern T0* T338f23(T0* C);
/* GEANT_SETENV_TASK.log_validation_messages */
extern void T336f27(T0* C);
/* GEANT_SETENV_TASK.validation_messages */
extern T0* T336f8(T0* C);
/* GEANT_MOVE_TASK.log_validation_messages */
extern void T334f29(T0* C);
/* GEANT_MOVE_TASK.validation_messages */
extern T0* T334f11(T0* C);
/* GEANT_COPY_TASK.log_validation_messages */
extern void T332f34(T0* C);
/* GEANT_COPY_TASK.validation_messages */
extern T0* T332f13(T0* C);
/* GEANT_DELETE_TASK.log_validation_messages */
extern void T330f29(T0* C);
/* GEANT_DELETE_TASK.validation_messages */
extern T0* T330f11(T0* C);
/* GEANT_MKDIR_TASK.log_validation_messages */
extern void T328f25(T0* C);
/* GEANT_MKDIR_TASK.validation_messages */
extern T0* T328f5(T0* C);
/* GEANT_ECHO_TASK.log_validation_messages */
extern void T326f25(T0* C);
/* GEANT_ECHO_TASK.validation_messages */
extern T0* T326f5(T0* C);
/* GEANT_GEANT_TASK.log_validation_messages */
extern void T324f40(T0* C);
/* GEANT_GEANT_TASK.validation_messages */
extern T0* T324f20(T0* C);
/* GEANT_GETEST_TASK.log_validation_messages */
extern void T322f42(T0* C);
/* GEANT_GETEST_TASK.validation_messages */
extern T0* T322f22(T0* C);
/* GEANT_GEPP_TASK.log_validation_messages */
extern void T320f37(T0* C);
/* GEANT_GEPP_TASK.validation_messages */
extern T0* T320f16(T0* C);
/* GEANT_GEYACC_TASK.log_validation_messages */
extern void T318f37(T0* C);
/* GEANT_GEYACC_TASK.validation_messages */
extern T0* T318f15(T0* C);
/* GEANT_GELEX_TASK.log_validation_messages */
extern void T316f40(T0* C);
/* GEANT_GELEX_TASK.validation_messages */
extern T0* T316f18(T0* C);
/* GEANT_GEXACE_TASK.log_validation_messages */
extern void T314f38(T0* C);
/* GEANT_GEXACE_TASK.validation_messages */
extern T0* T314f16(T0* C);
/* GEANT_UNSET_TASK.log_validation_messages */
extern void T312f26(T0* C);
/* GEANT_UNSET_TASK.validation_messages */
extern T0* T312f7(T0* C);
/* GEANT_SET_TASK.log_validation_messages */
extern void T310f27(T0* C);
/* GEANT_SET_TASK.validation_messages */
extern T0* T310f8(T0* C);
/* GEANT_LCC_TASK.log_validation_messages */
extern void T308f27(T0* C);
/* GEANT_LCC_TASK.validation_messages */
extern T0* T308f8(T0* C);
/* GEANT_EXEC_TASK.log_validation_messages */
extern void T306f26(T0* C);
/* GEANT_EXEC_TASK.validation_messages */
extern T0* T306f6(T0* C);
/* GEANT_ISE_TASK.log_validation_messages */
extern void T304f38(T0* C);
/* GEANT_ISE_TASK.validation_messages */
extern T0* T304f16(T0* C);
/* GEANT_GEC_TASK.log_validation_messages */
extern void T297f40(T0* C);
/* GEANT_GEC_TASK.validation_messages */
extern T0* T297f18(T0* C);
/* GEANT_REPLACE_TASK.execute */
extern void T350f40(T0* C);
/* GEANT_REPLACE_COMMAND.execute */
extern void T478f40(T0* C);
/* GEANT_FILESET.forth */
extern void T406f50(T0* C);
/* GEANT_FILESET.update_project_variables */
extern void T406f55(T0* C);
/* GEANT_FILESET.remove_project_variables */
extern void T406f51(T0* C);
/* GEANT_PROJECT_VARIABLES.remove */
extern void T25f86(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.remove_position */
extern void T25f88(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.key_storage_put */
extern void T25f70(T0* C, T0* a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.item_storage_put */
extern void T25f66(T0* C, T0* a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.key_storage_keep_head */
extern void T25f92(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.item_storage_keep_head */
extern void T25f91(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.clashes_put */
extern void T25f68(T0* C, T6 a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.slots_put */
extern void T25f69(T0* C, T6 a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.move_cursors_forth */
extern void T25f90(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.move_all_cursors */
extern void T25f94(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].set_position */
extern void T64f14(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.move_cursors_after */
extern void T25f93(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].set_next_cursor */
extern void T64f15(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].set_after */
extern void T64f13(T0* C);
/* GEANT_PROJECT_VARIABLES.internal_set_key_equality_tester */
extern void T25f89(T0* C, T0* a1);
/* GEANT_FILESET.off */
extern T1 T406f27(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].off */
extern T1 T512f35(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_off */
extern T1 T512f27(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].off */
extern T1 T545f7(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].forth */
extern void T512f46(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_forth */
extern void T512f50(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].add_traversing_cursor */
extern void T512f58(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].set_next_cursor */
extern void T545f11(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].set_position */
extern void T545f10(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].remove_traversing_cursor */
extern void T512f57(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].set_after */
extern void T545f9(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].clashes_item */
extern T6 T512f28(T0* C, T6 a1);
/* GEANT_REPLACE_COMMAND.create_directory_for_pathname */
extern void T478f42(T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.file_system */
extern T0* T478f20(T0* C);
/* GEANT_REPLACE_COMMAND.windows_file_system */
extern T0* T478f27(T0* C);
/* GEANT_REPLACE_COMMAND.operating_system */
extern T0* T478f26(T0* C);
/* GEANT_FILESET.item_mapped_filename */
extern T0* T406f26(T0* C);
/* GEANT_FILESET_ENTRY.mapped_filename_converted */
extern T0* T547f7(T0* C);
/* GEANT_FILESET_ENTRY.unix_file_system */
extern T0* T547f9(T0* C);
/* GEANT_FILESET_ENTRY.file_system */
extern T0* T547f8(T0* C);
/* GEANT_FILESET_ENTRY.windows_file_system */
extern T0* T547f11(T0* C);
/* GEANT_FILESET_ENTRY.operating_system */
extern T0* T547f10(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_for_iteration */
extern T0* T512f17(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_item */
extern T0* T512f19(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_storage_item */
extern T0* T512f20(T0* C, T6 a1);
/* GEANT_FILESET.item_filename */
extern T0* T406f25(T0* C);
/* GEANT_FILESET_ENTRY.filename_converted */
extern T0* T547f6(T0* C);
/* GEANT_REPLACE_COMMAND.unix_file_system */
extern T0* T478f19(T0* C);
/* GEANT_FILESET.is_in_gobo_31_format */
extern T1 T406f21(T0* C);
/* GEANT_FILESET.after */
extern T1 T406f20(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].after */
extern T1 T512f36(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_after */
extern T1 T512f18(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].after */
extern T1 T545f4(T0* C);
/* GEANT_FILESET.start */
extern void T406f49(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].start */
extern void T512f45(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_start */
extern void T512f49(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].is_empty */
extern T1 T512f26(T0* C);
/* GEANT_FILESET.execute */
extern void T406f48(T0* C);
/* GEANT_FILESET.remove_fileset_entry */
extern void T406f54(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].remove */
extern void T512f48(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].remove_position */
extern void T512f56(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_storage_put */
extern void T512f67(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_storage_put */
extern void T512f52(T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].force */
extern void T546f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_FILESET_ENTRY].fill_with */
extern void T548f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_FILESET_ENTRY].extend */
extern void T548f9(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_storage_keep_head */
extern void T512f66(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_storage_keep_head */
extern void T512f65(T0* C, T6 a1);
/* SPECIAL [GEANT_FILESET_ENTRY].keep_head */
extern void T548f8(T0* C, T6 a1);
/* SPECIAL [GEANT_FILESET_ENTRY].set_count */
extern void T548f10(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].clashes_put */
extern void T512f54(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].slots_put */
extern void T512f55(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].move_cursors_forth */
extern void T512f64(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].move_all_cursors */
extern void T512f69(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].move_cursors_after */
extern void T512f68(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].internal_set_key_equality_tester */
extern void T512f63(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_equality_tester */
extern T0* T512f31(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].slots_item */
extern T6 T512f24(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].hash_position */
extern T6 T512f22(T0* C, T0* a1);
/* GEANT_FILESET_ENTRY.hash_code */
extern T6 T547f3(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_storage_item */
extern T0* T512f32(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].search_position */
extern void T512f51(T0* C, T0* a1);
/* detachable KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY].test */
extern T1 T544f1(T0* C, T0* a1, T0* a2);
/* GEANT_FILESET_ENTRY.is_equal */
extern T1 T547f4(T0* C, T0* a1);
/* GEANT_FILESET_ENTRY.string_ */
extern T0* T547f5(T0* C);
/* GEANT_FILESET_ENTRY.make */
extern T0* T547c12(T0* a1, T0* a2);
/* DS_HASH_SET_CURSOR [STRING_8].forth */
extern void T549f11(T0* C);
/* DS_HASH_SET [STRING_8].cursor_forth */
extern void T514f51(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].add_traversing_cursor */
extern void T514f53(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_next_cursor */
extern void T549f14(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_position */
extern void T549f13(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].remove_traversing_cursor */
extern void T514f52(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_after */
extern void T549f12(T0* C);
/* GEANT_FILESET.add_fileset_entry_if_necessary */
extern void T406f53(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].force_last */
extern void T512f47(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].resize */
extern void T512f53(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].clashes_resize */
extern void T512f62(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].special_integer_ */
extern T0* T512f34(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_storage_resize */
extern void T512f61(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_storage_resize */
extern void T512f60(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].aliased_resized_area */
extern T0* T546f2(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].slots_resize */
extern void T512f59(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].new_capacity */
extern T6 T512f21(T0* C, T6 a1);
/* GEANT_FILESET.is_file_outofdate */
extern T1 T406f29(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.file_time_stamp */
extern T6 T53f32(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.time_stamp */
extern T6 T55f43(T0* C);
/* KL_TEXT_INPUT_FILE.date */
extern T6 T55f45(T0* C);
/* KL_TEXT_INPUT_FILE.eif_file_date */
extern T6 T55f50(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.file_time_stamp */
extern T6 T54f31(T0* C, T0* a1);
/* GEANT_MAP.mapped_filename */
extern T0* T509f8(T0* C, T0* a1);
/* UC_UTF8_STRING.remove_tail */
extern void T227f90(T0* C, T6 a1);
/* STRING_8.remove_tail */
extern void T17f62(T0* C, T6 a1);
/* UC_UTF8_STRING.remove_head */
extern void T227f89(T0* C, T6 a1);
/* STRING_8.remove_head */
extern void T17f61(T0* C, T6 a1);
/* GEANT_MAP.glob_postfix */
extern T0* T509f16(T0* C, T0* a1);
/* GEANT_MAP.glob_prefix */
extern T0* T509f15(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.replace_all */
extern T0* T563f231(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_replace_all_to_string */
extern void T563f305(T0* C, T0* a1, T0* a2);
/* RX_PCRE_REGULAR_EXPRESSION.match_unbounded_substring */
extern void T563f319(T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_substring */
extern void T563f317(T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_it */
extern void T563f331(T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_start */
extern T1 T563f151(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_internal */
extern T6 T563f233(T0* C, T6 a1, T1 a2, T1 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_type */
extern T6 T563f297(T0* C, T6 a1, T6 a2, T6 a3, T1 a4);
/* RX_PCRE_REGULAR_EXPRESSION.match_not_repeated_characters */
extern T6 T563f296(T0* C, T6 a1, T6 a2, T6 a3, T1 a4);
/* RX_PCRE_REGULAR_EXPRESSION.infinity */
extern unsigned char ge427os11602;
extern T6 ge427ov11602;
extern T6 T563f62(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.platform */
extern T0* T563f195(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_characters */
extern T6 T563f295(T0* C, T6 a1, T6 a2, T6 a3, T1 a4);
/* RX_BYTE_CODE.character_item */
extern T6 T608f8(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_classes */
extern T6 T563f294(T0* C, T6 a1);
/* RX_BYTE_CODE.character_set_has */
extern T1 T608f10(T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_refs */
extern T6 T563f293(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_ref */
extern T6 T563f299(T0* C, T6 a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.space_set */
extern unsigned char ge433os11769;
extern T0* ge433ov11769;
extern T0* T563f152(T0* C);
/* RX_CHARACTER_SET.make */
extern T0* T609c5(T0* a1);
/* RX_CHARACTER_SET.add_string */
extern void T609f10(T0* C, T0* a1);
/* RX_CHARACTER_SET.add_character */
extern void T609f9(T0* C, T6 a1);
/* RX_CHARACTER_SET.make_empty */
extern void T609f4(T0* C);
/* RX_CHARACTER_SET.make_empty */
extern T0* T609c4(void);
/* KL_SPECIAL_ROUTINES [BOOLEAN].make_filled */
extern T0* T176f3(T0* C, T1 a1, T6 a2);
/* RX_CHARACTER_SET.special_boolean_ */
extern unsigned char ge127os2339;
extern T0* ge127ov2339;
extern T0* T609f3(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.digit_set */
extern unsigned char ge433os11761;
extern T0* ge433ov11761;
extern T0* T563f168(T0* C);
/* RX_CHARACTER_SET.has */
extern T1 T609f2(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_ims_options */
extern void T563f329(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_dotall */
extern T1 T563f87(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_multiline */
extern T1 T563f86(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_caseless */
extern T1 T563f85(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_match_count */
extern void T563f338(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_next_start */
extern void T563f337(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_recursive */
extern T6 T563f292(T0* C, T6 a1, T1 a2, T1 a3);
/* RX_BYTE_CODE.integer_item */
extern T6 T608f11(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.next_matching_alternate */
extern T6 T563f290(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_additional_bracket */
extern T6 T563f271(T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.opcode_item */
extern T6 T608f7(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.special_integer_ */
extern T0* T563f56(T0* C);
/* RX_CASE_MAPPING.flip_case */
extern T6 T610f4(T0* C, T6 a1);
/* RX_CASE_MAPPING.to_lower */
extern T6 T610f3(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_replacement_to_string */
extern void T563f318(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.append_code */
extern void T227f91(T0* C, T10 a1);
/* UC_UTF8_STRING.append_item_code */
extern void T227f92(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_captured_substring_to_string */
extern void T563f332(T0* C, T0* a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.captured_end_position */
extern T6 T563f55(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.captured_start_position */
extern T6 T563f54(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.string_ */
extern T0* T563f57(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.has_matched */
extern T1 T563f72(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.match */
extern void T563f304(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_compiled */
extern T1 T563f149(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.compile */
extern void T563f301(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.compile */
extern void T563f301p1(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_startline */
extern void T563f316(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.has_startline */
extern T1 T563f230(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.first_significant_code */
extern T6 T563f190(T0* C, T6 a1, T6 a2, T1 a3);
/* RX_PCRE_REGULAR_EXPRESSION.find_firstchar */
extern T6 T563f229(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_anchored */
extern void T563f315(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.can_anchored */
extern T1 T563f228(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.ims_options */
extern T6 T563f84(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_option_dotall */
extern T6 T563f133(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_option_multiline */
extern T6 T563f131(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_option_caseless */
extern T6 T563f129(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.compile_regexp */
extern void T563f314(T0* C, T6 a1, T1 a2, T1 a3, T6 a4);
/* RX_BYTE_CODE.set_count */
extern void T608f18(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.find_fixed_code_length */
extern T6 T563f67(T0* C, T6 a1);
/* RX_BYTE_CODE.put_integer */
extern void T608f17(T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.compile_branch */
extern void T563f330(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.meta_set */
extern unsigned char ge433os11770;
extern T0* ge433ov11770;
extern T0* T563f148(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.maxlit */
extern unsigned char ge427os11603;
extern T6 ge427ov11603;
extern T6 T563f147(T0* C);
/* RX_BYTE_CODE.append_character */
extern void T608f19(T0* C, T6 a1);
/* RX_BYTE_CODE.put_character */
extern void T608f25(T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.resize_byte_code */
extern void T608f24(T0* C, T6 a1);
/* RX_BYTE_CODE.special_integer_ */
extern T0* T608f9(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.scan_escape */
extern T6 T563f142(T0* C, T6 a1, T1 a2);
/* RX_PCRE_REGULAR_EXPRESSION.scan_hex_number */
extern T6 T563f223(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.xdigit_set */
extern unsigned char ge433os11763;
extern T0* ge433ov11763;
extern T0* T563f245(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.scan_octal_number */
extern T6 T563f222(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.escape_character */
extern T6 T563f218(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.to_option_ims */
extern T6 T563f136(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_ichanged */
extern void T563f328(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.unset_option_dotall */
extern T6 T563f134(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.unset_option_multiline */
extern T6 T563f132(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.unset_option_caseless */
extern T6 T563f130(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.scan_decimal_number */
extern T6 T563f111(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.compile_repeats */
extern void T563f335(T0* C, T6 a1, T6 a2, T6 a3, T6 a4, T6 a5);
/* RX_BYTE_CODE.append_subcopy */
extern void T608f23(T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.put_opcode */
extern void T608f22(T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.move_right */
extern void T608f21(T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.compile_single_repeat */
extern void T563f336(T0* C, T6 a1, T6 a2, T6 a3, T6 a4, T6 a5, T6 a6);
/* RX_PCRE_REGULAR_EXPRESSION.compile_character_class */
extern void T563f334(T0* C);
/* RX_BYTE_CODE.append_character_set */
extern void T608f20(T0* C, T0* a1, T1 a2);
/* RX_BYTE_CODE.resize_character_sets */
extern void T608f26(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].aliased_resized_area_with_default */
extern T0* T176f4(T0* C, T0* a1, T1 a2, T6 a3);
/* SPECIAL [BOOLEAN].aliased_resized_area_with_default */
extern T0* T177f5(T0* C, T1 a1, T6 a2);
/* RX_BYTE_CODE.special_boolean_ */
extern T0* T608f12(T0* C);
/* RX_CHARACTER_SET.add_set */
extern void T609f8(T0* C, T0* a1);
/* RX_CHARACTER_SET.add_negated_set */
extern void T609f7(T0* C, T0* a1);
/* ARRAY [RX_CHARACTER_SET].item */
extern T0* T613f4(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.class_sets */
extern unsigned char ge433os11772;
extern T0* ge433ov11772;
extern T0* T563f160(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.default_word_set */
extern unsigned char ge433os11757;
extern T0* ge433ov11757;
extern T0* T563f78(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.punct_set */
extern unsigned char ge433os11767;
extern T0* ge433ov11767;
extern T0* T563f244(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.print_set */
extern unsigned char ge433os11766;
extern T0* ge433ov11766;
extern T0* T563f243(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.graph_set */
extern unsigned char ge433os11765;
extern T0* ge433ov11765;
extern T0* T563f242(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.cntrl_set */
extern unsigned char ge433os11764;
extern T0* ge433ov11764;
extern T0* T563f241(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.ascii_set */
extern unsigned char ge433os11768;
extern T0* ge433ov11768;
extern T0* T563f240(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.alnum_set */
extern unsigned char ge433os11762;
extern T0* ge433ov11762;
extern T0* T563f239(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.upper_set */
extern unsigned char ge433os11758;
extern T0* ge433ov11758;
extern T0* T563f238(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.lower_set */
extern unsigned char ge433os11759;
extern T0* ge433ov11759;
extern T0* T563f237(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.alpha_set */
extern unsigned char ge433os11760;
extern T0* ge433ov11760;
extern T0* T563f235(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.check_posix_name */
extern T6 T563f158(T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.class_names */
extern unsigned char ge433os11771;
extern T0* ge433ov11771;
extern T0* T563f236(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.check_posix_syntax */
extern T6 T563f156(T0* C, T6 a1);
/* RX_CHARACTER_SET.wipe_out */
extern void T609f6(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.actual_set */
extern unsigned char ge427os11601;
extern T0* ge427ov11601;
extern T0* T563f153(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.compile_counted_repeats */
extern T1 T563f89(T0* C, T6 a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.scan_comment */
extern void T563f333(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_undef */
extern T1 T563f64(T0* C, T6 a1);
/* RX_BYTE_CODE.append_integer */
extern void T608f16(T0* C, T6 a1);
/* RX_BYTE_CODE.append_opcode */
extern void T608f15(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_error */
extern void T563f313(T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.set_default_internal_options */
extern void T563f312(T0* C);
/* RX_BYTE_CODE.wipe_out */
extern void T608f14(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.wipe_out */
extern void T563f311(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.wipe_out */
extern void T563f311p1(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.make */
extern T0* T563c300(void);
/* KL_SPECIAL_ROUTINES [INTEGER_32].make_filled */
extern T0* T65f5(T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.make */
extern void T563f300p1(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_default_options */
extern void T563f310(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_strict */
extern void T563f327(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_greedy */
extern void T563f326(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_eol */
extern void T563f325(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_bol */
extern void T563f324(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_dollar_endonly */
extern void T563f323(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_empty_allowed */
extern void T563f322(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_extended */
extern void T563f321(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_dotall */
extern void T563f320(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_multiline */
extern void T563f303(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_caseless */
extern void T563f302(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_word_set */
extern void T563f309(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_character_case_mapping */
extern void T563f308(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.default_character_case_mapping */
extern unsigned char ge433os11756;
extern T0* ge433ov11756;
extern T0* T563f77(T0* C);
/* RX_CASE_MAPPING.make */
extern T0* T610c6(T0* a1, T0* a2);
/* RX_CASE_MAPPING.add */
extern void T610f8(T0* C, T0* a1, T0* a2);
/* RX_CASE_MAPPING.make_default */
extern void T610f7(T0* C);
/* RX_CASE_MAPPING.clear */
extern void T610f9(T0* C);
/* RX_CASE_MAPPING.special_integer_ */
extern T0* T610f5(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.reset */
extern void T563f307(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.reset */
extern void T563f307p1(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.empty_pattern_buffer */
extern unsigned char ge427os11600;
extern T0* ge427ov11600;
extern T0* T563f76(T0* C);
/* RX_BYTE_CODE.make */
extern T0* T608c13(T6 a1);
/* GEANT_MAP.type_attribute_value_regexp */
extern unsigned char ge88os10094;
extern T0* ge88ov10094;
extern T0* T509f12(T0* C);
/* GEANT_MAP.type_attribute_value_merge */
extern unsigned char ge88os10092;
extern T0* ge88ov10092;
extern T0* T509f11(T0* C);
/* GEANT_MAP.unix_file_system */
extern T0* T509f14(T0* C);
/* GEANT_MAP.type_attribute_value_flat */
extern unsigned char ge88os10091;
extern T0* ge88ov10091;
extern T0* T509f10(T0* C);
/* GEANT_MAP.string_ */
extern T0* T509f9(T0* C);
/* GEANT_MAP.is_executable */
extern T1 T509f7(T0* C);
/* GEANT_MAP.type_attribute_value_glob */
extern unsigned char ge88os10093;
extern T0* ge88ov10093;
extern T0* T509f13(T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].item */
extern T0* T549f5(T0* C);
/* DS_HASH_SET [STRING_8].cursor_item */
extern T0* T514f29(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].after */
extern T1 T549f7(T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].start */
extern void T549f10(T0* C);
/* DS_HASH_SET [STRING_8].cursor_start */
extern void T514f50(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].cursor_off */
extern T1 T514f31(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].off */
extern T1 T549f8(T0* C);
/* DS_HASH_SET [STRING_8].is_empty */
extern T1 T514f30(T0* C);
/* GEANT_FILESET.scan_internal */
extern void T406f52(T0* C, T0* a1);
/* KL_DIRECTORY.close */
extern void T501f54(T0* C);
/* LX_DFA_WILDCARD.recognizes */
extern T1 T516f12(T0* C, T0* a1);
/* LX_DFA_WILDCARD.longest_end_position */
extern T6 T516f13(T0* C, T0* a1, T6 a2);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_readable */
extern T1 T53f31(T0* C, T0* a1);
/* KL_DIRECTORY.is_readable */
extern T1 T501f35(T0* C);
/* KL_DIRECTORY.old_is_readable */
extern T1 T501f23(T0* C);
/* KL_DIRECTORY.eif_dir_is_readable */
extern T1 T501f33(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.is_directory_readable */
extern T1 T54f30(T0* C, T0* a1);
/* GEANT_FILESET.string_ */
extern T0* T406f28(T0* C);
/* KL_DIRECTORY.read_entry */
extern void T501f53(T0* C);
/* KL_DIRECTORY.readentry */
extern void T501f57(T0* C);
/* KL_DIRECTORY.eif_dir_next */
extern T14 T501f29(T0* C, T14 a1);
/* KL_DIRECTORY.old_end_of_input */
extern T1 T501f25(T0* C);
/* KL_DIRECTORY.is_open_read */
extern T1 T501f18(T0* C);
/* KL_DIRECTORY.open_read */
extern void T501f52(T0* C);
/* KL_DIRECTORY.old_open_read */
extern void T501f56(T0* C);
/* KL_DIRECTORY.dir_open */
extern T14 T501f26(T0* C, T14 a1);
/* GEANT_FILESET.unix_file_system */
extern T0* T406f24(T0* C);
/* GEANT_FILESET.file_system */
extern T0* T406f23(T0* C);
/* GEANT_FILESET.windows_file_system */
extern T0* T406f32(T0* C);
/* GEANT_FILESET.operating_system */
extern T0* T406f31(T0* C);
/* GEANT_FILESET.is_executable */
extern T1 T406f19(T0* C);
/* GEANT_FILESET.is_in_gobo_32_format */
extern T1 T406f22(T0* C);
/* GEANT_REPLACE_COMMAND.execute_replace */
extern void T478f41(T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_COMMAND.execute_replace_token */
extern void T478f45(T0* C, T0* a1, T0* a2);
/* KL_TEXT_OUTPUT_FILE.close */
extern void T525f30(T0* C);
/* KL_STRING_ROUTINES.replaced_first_substring */
extern T0* T75f16(T0* C, T0* a1, T0* a2, T0* a3);
/* KL_STRING_ROUTINES.substring_index */
extern T6 T75f17(T0* C, T0* a1, T0* a2, T6 a3);
/* KL_STRING_ROUTINES.platform */
extern T0* T75f18(T0* C);
/* STRING_8.substring_index */
extern T6 T17f34(T0* C, T0* a1, T6 a2);
/* STRING_8_SEARCHER.substring_index */
extern T6 T674f2(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* STRING_8_SEARCHER.substring_index_with_deltas */
extern T6 T674f3(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* STRING_8_SEARCHER.internal_initialize_deltas */
extern void T674f6(T0* C, T0* a1, T6 a2, T0* a3);
/* STRING_8.string_searcher */
extern unsigned char ge1496os486;
extern T0* ge1496ov486;
extern T0* T17f35(T0* C);
/* STRING_8_SEARCHER.make */
extern T0* T674c5(void);
/* KL_STRING_ROUTINES.replaced_all_substrings */
extern T0* T75f15(T0* C, T0* a1, T0* a2, T0* a3);
/* GEANT_REPLACE_COMMAND.string_ */
extern T0* T478f25(T0* C);
/* UC_UTF8_STRING.has */
extern T1 T227f55(T0* C, T2 a1);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T525f28(T0* C);
/* KL_TEXT_OUTPUT_FILE.is_closed */
extern T1 T525f13(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_write */
extern void T525f34(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T525f34p1(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_open */
extern T14 T525f19(T0* C, T14 a1, T6 a2);
/* KL_TEXT_OUTPUT_FILE.internal_name_pointer */
extern T0* T525f18(T0* C);
/* KL_TEXT_OUTPUT_FILE.string_name */
extern T0* T525f12(T0* C);
/* KL_TEXT_OUTPUT_FILE.reset */
extern void T525f42(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.make */
extern void T525f25(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.make */
extern T0* T525c25(T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_make */
extern void T525f31(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.make_with_name */
extern void T525f37(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.set_name */
extern void T525f40(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.buffered_file_info */
extern T0* T525f24(T0* C);
/* GEANT_REPLACE_COMMAND.tmp_output_file */
extern unsigned char ge42os9443;
extern T0* ge42ov9443;
extern T0* T478f24(T0* C);
/* KL_TEXT_INPUT_FILE.read_string */
extern void T55f74(T0* C, T6 a1);
/* KL_TEXT_INPUT_FILE.read_to_string */
extern T6 T55f36(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
extern unsigned char ge157os4390;
extern T0* ge157ov4390;
extern T0* T55f41(T0* C);
/* KL_TEXT_INPUT_FILE.any_ */
extern T0* T55f38(T0* C);
/* STRING_8.set_internal_hash_code */
extern void T17f60(T0* C, T6 a1);
/* KL_TEXT_INPUT_FILE.old_read_to_string */
extern T6 T55f40(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.file_gss */
extern T6 T55f42(T0* C, T14 a1, T14 a2, T6 a3);
/* SPECIAL [CHARACTER_8].item_address */
extern T14 T15f8(T0* C, T6 a1);
/* GEANT_REPLACE_COMMAND.tmp_input_file */
extern unsigned char ge42os9442;
extern T0* ge42ov9442;
extern T0* T478f22(T0* C);
/* GEANT_REPLACE_COMMAND.execute_replace_regexp */
extern void T478f44(T0* C, T0* a1, T0* a2);
/* RX_PCRE_REGULAR_EXPRESSION.replace */
extern T0* T563f232(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_replace_to_string */
extern void T563f306(T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_COMMAND.execute_replace_variable_pattern */
extern void T478f43(T0* C, T0* a1, T0* a2);
/* ARRAY [GEANT_VARIABLES].item */
extern T0* T284f4(T0* C, T6 a1);
/* GEANT_PROJECT.aggregated_variables_array */
extern T0* T22f27(T0* C);
/* ARRAY [GEANT_VARIABLES].put */
extern void T284f8(T0* C, T0* a1, T6 a2);
/* ARRAY [GEANT_VARIABLES].make_filled */
extern T0* T284c7(T0* a1, T6 a2, T6 a3);
/* ARRAY [GEANT_VARIABLES].make_filled_area */
extern void T284f9(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_VARIABLES].make_filled */
extern T0* T204c11(T0* a1, T6 a2);
/* UC_UTF8_STRING.occurrences */
extern T6 T227f54(T0* C, T2 a1);
/* UC_UTF8_STRING.code_occurrences */
extern T6 T227f56(T0* C, T6 a1);
/* STRING_8.occurrences */
extern T6 T17f33(T0* C, T2 a1);
/* GEANT_REPLACE_COMMAND.is_file_to_file_executable */
extern T1 T478f16(T0* C);
/* GEANT_REPLACE_COMMAND.is_replace_executable */
extern T1 T478f18(T0* C);
/* GEANT_REPLACE_TASK.exit_application */
extern void T350f41(T0* C, T6 a1, T0* a2);
/* GEANT_REPLACE_TASK.exceptions */
extern T0* T350f27(T0* C);
/* GEANT_REPLACE_TASK.std */
extern T0* T350f26(T0* C);
/* GEANT_REPLACE_TASK.log_messages */
extern void T350f42(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.dir_attribute_name */
extern T0* T350f25(T0* C);
/* GEANT_REPLACE_TASK.file_system */
extern T0* T350f24(T0* C);
/* GEANT_REPLACE_TASK.unix_file_system */
extern T0* T350f30(T0* C);
/* GEANT_REPLACE_TASK.windows_file_system */
extern T0* T350f29(T0* C);
/* GEANT_REPLACE_TASK.operating_system */
extern T0* T350f28(T0* C);
/* GEANT_INPUT_TASK.execute */
extern void T348f41(T0* C);
/* GEANT_INPUT_COMMAND.execute */
extern void T475f23(T0* C);
/* GEANT_PROJECT.set_variable_value */
extern void T22f51(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT.is_local_variable */
extern T1 T22f26(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.matches */
extern T1 T563f58(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].has */
extern T1 T266f8(T0* C, T0* a1);
/* GEANT_INPUT_COMMAND.string_ */
extern T0* T475f14(T0* C);
/* KL_STDIN_FILE.read_line */
extern void T565f20(T0* C);
/* KL_STDIN_FILE.unread_character */
extern void T565f23(T0* C, T2 a1);
/* detachable KL_LINKABLE [CHARACTER_8].put_right */
extern void T92f4(T0* C, T0* a1);
/* detachable KL_LINKABLE [CHARACTER_8].make */
extern T0* T92c3(T2 a1);
/* KL_STDIN_FILE.read_character */
extern void T565f22(T0* C);
/* KL_STDIN_FILE.old_read_character */
extern void T565f26(T0* C);
/* KL_STDIN_FILE.console_readchar */
extern T2 T565f13(T0* C, T14 a1);
/* KL_STDIN_FILE.old_end_of_file */
extern T1 T565f15(T0* C);
/* KL_STDIN_FILE.console_eof */
extern T1 T565f17(T0* C, T14 a1);
/* KL_STDIN_FILE.string_ */
extern T0* T565f14(T0* C);
/* GEANT_INPUT_COMMAND.input */
extern unsigned char ge168os3044;
extern T0* ge168ov3044;
extern T0* T475f13(T0* C);
/* KL_STDIN_FILE.make */
extern T0* T565c18(void);
/* KL_STDIN_FILE.make_open_stdin */
extern void T565f21(T0* C, T0* a1);
/* KL_STDIN_FILE.set_read_mode */
extern void T565f25(T0* C);
/* KL_STDIN_FILE.console_def */
extern T14 T565f9(T0* C, T6 a1);
/* KL_STDIN_FILE.make_with_name */
extern void T565f24(T0* C, T0* a1);
/* KL_STDIN_FILE.default_pointer */
extern T14 T565f11(T0* C);
/* KL_STDIN_FILE.set_name */
extern void T565f27(T0* C, T0* a1);
/* KL_STDIN_FILE.buffered_file_info */
extern T0* T565f16(T0* C);
/* GEANT_INPUT_COMMAND.output */
extern T0* T475f12(T0* C);
/* DS_LINKED_LIST [STRING_8].set_equality_tester */
extern void T266f17(T0* C, T0* a1);
/* GEANT_INPUT_TASK.exit_application */
extern void T348f42(T0* C, T6 a1, T0* a2);
/* GEANT_INPUT_TASK.exceptions */
extern T0* T348f28(T0* C);
/* GEANT_INPUT_TASK.log_messages */
extern void T348f43(T0* C, T0* a1);
/* GEANT_INPUT_TASK.dir_attribute_name */
extern T0* T348f27(T0* C);
/* GEANT_INPUT_TASK.file_system */
extern T0* T348f26(T0* C);
/* GEANT_INPUT_TASK.unix_file_system */
extern T0* T348f31(T0* C);
/* GEANT_INPUT_TASK.windows_file_system */
extern T0* T348f30(T0* C);
/* GEANT_INPUT_TASK.operating_system */
extern T0* T348f29(T0* C);
/* GEANT_AVAILABLE_TASK.execute */
extern void T346f31(T0* C);
/* GEANT_AVAILABLE_COMMAND.execute */
extern void T472f19(T0* C);
/* GEANT_STRING_PROPERTY.non_empty_value_or_else */
extern T0* T402f7(T0* C, T0* a1);
/* GEANT_STRING_PROPERTY.string_value */
extern T0* T402f4(T0* C);
/* GEANT_STRING_PROPERTY.is_defined */
extern T1 T402f5(T0* C);
/* GEANT_STRING_PROPERTY.value */
extern T0* T402f6(T0* C);
/* GEANT_AVAILABLE_TASK.exit_application */
extern void T346f32(T0* C, T6 a1, T0* a2);
/* GEANT_AVAILABLE_TASK.exceptions */
extern T0* T346f17(T0* C);
/* GEANT_AVAILABLE_TASK.std */
extern T0* T346f16(T0* C);
/* GEANT_AVAILABLE_TASK.log_messages */
extern void T346f33(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.project_variables_resolver */
extern T0* T346f10(T0* C);
/* GEANT_AVAILABLE_TASK.dir_attribute_name */
extern T0* T346f15(T0* C);
/* GEANT_AVAILABLE_TASK.file_system */
extern T0* T346f14(T0* C);
/* GEANT_AVAILABLE_TASK.unix_file_system */
extern T0* T346f20(T0* C);
/* GEANT_AVAILABLE_TASK.windows_file_system */
extern T0* T346f19(T0* C);
/* GEANT_AVAILABLE_TASK.operating_system */
extern T0* T346f18(T0* C);
/* GEANT_PRECURSOR_TASK.execute */
extern void T344f39(T0* C);
/* GEANT_PRECURSOR_COMMAND.execute */
extern void T469f11(T0* C);
/* GEANT_PRECURSOR_TASK.dir_attribute_name */
extern T0* T344f24(T0* C);
/* GEANT_PRECURSOR_TASK.file_system */
extern T0* T344f23(T0* C);
/* GEANT_PRECURSOR_TASK.unix_file_system */
extern T0* T344f27(T0* C);
/* GEANT_PRECURSOR_TASK.windows_file_system */
extern T0* T344f26(T0* C);
/* GEANT_PRECURSOR_TASK.operating_system */
extern T0* T344f25(T0* C);
/* GEANT_EXIT_TASK.execute */
extern void T342f32(T0* C);
/* GEANT_EXIT_COMMAND.execute */
extern void T466f10(T0* C);
/* GEANT_EXIT_TASK.exit_application */
extern void T342f33(T0* C, T6 a1, T0* a2);
/* GEANT_EXIT_TASK.exceptions */
extern T0* T342f19(T0* C);
/* GEANT_EXIT_TASK.std */
extern T0* T342f18(T0* C);
/* GEANT_EXIT_TASK.log_messages */
extern void T342f34(T0* C, T0* a1);
/* GEANT_EXIT_TASK.dir_attribute_name */
extern T0* T342f17(T0* C);
/* GEANT_EXIT_TASK.file_system */
extern T0* T342f16(T0* C);
/* GEANT_EXIT_TASK.unix_file_system */
extern T0* T342f22(T0* C);
/* GEANT_EXIT_TASK.windows_file_system */
extern T0* T342f21(T0* C);
/* GEANT_EXIT_TASK.operating_system */
extern T0* T342f20(T0* C);
/* GEANT_OUTOFDATE_TASK.execute */
extern void T340f37(T0* C);
/* GEANT_OUTOFDATE_COMMAND.execute */
extern void T463f28(T0* C);
/* GEANT_FILESET.go_after */
extern void T406f56(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].go_after */
extern void T512f70(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_go_after */
extern void T512f71(T0* C, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.is_file_outofdate */
extern T1 T463f17(T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_COMMAND.unix_file_system */
extern T0* T463f15(T0* C);
/* GEANT_OUTOFDATE_COMMAND.file_system */
extern T0* T463f14(T0* C);
/* GEANT_OUTOFDATE_COMMAND.windows_file_system */
extern T0* T463f19(T0* C);
/* GEANT_OUTOFDATE_COMMAND.operating_system */
extern T0* T463f18(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_file_executable */
extern T1 T463f12(T0* C);
/* GEANT_OUTOFDATE_TASK.exit_application */
extern void T340f38(T0* C, T6 a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.exceptions */
extern T0* T340f24(T0* C);
/* GEANT_OUTOFDATE_TASK.std */
extern T0* T340f23(T0* C);
/* GEANT_OUTOFDATE_TASK.log_messages */
extern void T340f39(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.dir_attribute_name */
extern T0* T340f22(T0* C);
/* GEANT_OUTOFDATE_TASK.file_system */
extern T0* T340f21(T0* C);
/* GEANT_OUTOFDATE_TASK.unix_file_system */
extern T0* T340f27(T0* C);
/* GEANT_OUTOFDATE_TASK.windows_file_system */
extern T0* T340f26(T0* C);
/* GEANT_OUTOFDATE_TASK.operating_system */
extern T0* T340f25(T0* C);
/* GEANT_XSLT_TASK.execute */
extern void T338f50(T0* C);
/* GEANT_XSLT_COMMAND.execute */
extern void T459f41(T0* C);
/* GEANT_XSLT_COMMAND.execute_gexslt */
extern void T459f45(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_shell */
extern void T459f46(T0* C, T0* a1);
/* DP_SHELL_COMMAND.execute */
extern void T558f13(T0* C);
/* DP_SHELL_COMMAND.operating_system */
extern T0* T558f6(T0* C);
/* DP_SHELL_COMMAND.system */
extern void T558f14(T0* C, T0* a1);
/* DP_SHELL_COMMAND.system_call */
extern T6 T558f9(T0* C, T14 a1);
/* DP_SHELL_COMMAND.default_shell */
extern unsigned char ge1627os5819;
extern T0* ge1627ov5819;
extern T0* T558f8(T0* C);
/* STRING_32.make_empty */
extern T0* T18c23(void);
/* DP_SHELL_COMMAND.item */
extern T0* T558f10(T0* C, T0* a1);
/* DP_SHELL_COMMAND.eif_getenv */
extern T14 T558f11(T0* C, T14 a1);
/* DP_SHELL_COMMAND.make */
extern T0* T558c12(T0* a1);
/* DP_SHELL_COMMAND.string_ */
extern T0* T558f7(T0* C);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].item */
extern T0* T460f9(T0* C, T6 a1);
/* GEANT_XSLT_COMMAND.string_ */
extern T0* T459f23(T0* C);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.set_variables */
extern void T562f5(T0* C, T0* a1);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.make */
extern T0* T562c4(void);
/* GEANT_XSLT_COMMAND.execute_xsltproc */
extern void T459f44(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_xalan_java */
extern void T459f43(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_xalan_cpp */
extern void T459f42(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.is_file_outofdate */
extern T1 T459f22(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.put */
extern void T29f75(T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_COMMAND.unix_file_system */
extern T0* T459f21(T0* C);
/* GEANT_XSLT_COMMAND.file_system */
extern T0* T459f20(T0* C);
/* GEANT_XSLT_COMMAND.windows_file_system */
extern T0* T459f25(T0* C);
/* GEANT_XSLT_COMMAND.operating_system */
extern T0* T459f24(T0* C);
/* GEANT_XSLT_TASK.exit_application */
extern void T338f51(T0* C, T6 a1, T0* a2);
/* GEANT_XSLT_TASK.exceptions */
extern T0* T338f37(T0* C);
/* GEANT_XSLT_TASK.log_messages */
extern void T338f52(T0* C, T0* a1);
/* GEANT_XSLT_TASK.dir_attribute_name */
extern T0* T338f36(T0* C);
/* GEANT_XSLT_TASK.file_system */
extern T0* T338f35(T0* C);
/* GEANT_XSLT_TASK.unix_file_system */
extern T0* T338f40(T0* C);
/* GEANT_XSLT_TASK.windows_file_system */
extern T0* T338f39(T0* C);
/* GEANT_XSLT_TASK.operating_system */
extern T0* T338f38(T0* C);
/* GEANT_SETENV_TASK.execute */
extern void T336f33(T0* C);
/* GEANT_SETENV_COMMAND.execute */
extern void T455f13(T0* C);
/* KL_EXECUTION_ENVIRONMENT.set_variable_value */
extern void T107f5(T0* C, T0* a1, T0* a2);
/* EXECUTION_ENVIRONMENT.put */
extern void T87f13(T0* C, T0* a1, T0* a2);
/* EXECUTION_ENVIRONMENT.eif_putenv */
extern T6 T87f10(T0* C, T14 a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].force */
extern void T675f35(T0* C, T0* a1, T0* a2);
/* SPECIAL [NATIVE_STRING].force */
extern void T685f5(T0* C, T0* a1, T6 a2);
/* SPECIAL [NATIVE_STRING].extend */
extern void T685f7(T0* C, T0* a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].position */
extern T6 T675f22(T0* C);
/* SPECIAL [IMMUTABLE_STRING_32].force */
extern void T137f9(T0* C, T0* a1, T6 a2);
/* SPECIAL [BOOLEAN].force */
extern void T177f13(T0* C, T1 a1, T6 a2);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].deleted_position */
extern T6 T675f21(T0* C, T6 a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].add_space */
extern void T675f37(T0* C);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].accommodate */
extern void T675f38(T0* C, T6 a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].set_indexes_map */
extern void T675f42(T0* C, T0* a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].set_deleted_marks */
extern void T675f41(T0* C, T0* a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].set_keys */
extern void T675f40(T0* C, T0* a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].set_content */
extern void T675f39(T0* C, T0* a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].put */
extern void T675f43(T0* C, T0* a1, T0* a2);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].set_conflict */
extern void T675f45(T0* C);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].found */
extern T1 T675f31(T0* C);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].occupied */
extern T1 T675f29(T0* C, T6 a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].empty_duplicate */
extern T0* T675f28(T0* C, T6 a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].compare_objects */
extern void T675f44(T0* C);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].make */
extern T0* T675c34(T6 a1);
/* SPECIAL [NATIVE_STRING].make_empty */
extern T0* T685c4(T6 a1);
/* PRIMES.higher_prime */
extern T6 T684f1(T0* C, T6 a1);
/* PRIMES.is_prime */
extern T1 T684f3(T0* C, T6 a1);
/* PRIMES.default_create */
extern T0* T684c5(void);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].soon_full */
extern T1 T675f20(T0* C);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].not_found */
extern T1 T675f19(T0* C);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].internal_search */
extern void T675f36(T0* C, T0* a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].same_keys */
extern T1 T675f26(T0* C, T0* a1, T0* a2);
/* IMMUTABLE_STRING_32.is_equal */
extern T1 T85f12(T0* C, T0* a1);
/* SPECIAL [CHARACTER_32].same_items */
extern T1 T16f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].hash_code_of */
extern T6 T675f25(T0* C, T0* a1);
/* IMMUTABLE_STRING_32.hash_code */
extern T6 T85f11(T0* C);
/* IMMUTABLE_STRING_32.make_from_string_general */
extern T0* T85c16(T0* a1);
/* UC_UTF8_STRING.to_string_32 */
extern T0* T227f57(T0* C);
/* STRING_8.to_string_32 */
extern T0* T17f36(T0* C);
/* IMMUTABLE_STRING_32.make_from_string_32 */
extern void T85f19(T0* C, T0* a1);
/* IMMUTABLE_STRING_32.make_from_string_8 */
extern void T85f18(T0* C, T0* a1);
/* IMMUTABLE_STRING_32.make_from_area_and_bounds */
extern void T85f17(T0* C, T0* a1, T6 a2, T6 a3);
/* IMMUTABLE_STRING_32.make_from_area_and_bounds */
extern T0* T85c17(T0* a1, T6 a2, T6 a3);
/* EXECUTION_ENVIRONMENT.environ */
extern unsigned char ge1627os5836;
extern T0* ge1627ov5836;
extern T0* T87f9(T0* C);
/* GEANT_SETENV_COMMAND.execution_environment */
extern T0* T455f8(T0* C);
/* GEANT_SETENV_TASK.exit_application */
extern void T336f34(T0* C, T6 a1, T0* a2);
/* GEANT_SETENV_TASK.exceptions */
extern T0* T336f20(T0* C);
/* GEANT_SETENV_TASK.std */
extern T0* T336f19(T0* C);
/* GEANT_SETENV_TASK.log_messages */
extern void T336f35(T0* C, T0* a1);
/* GEANT_SETENV_TASK.dir_attribute_name */
extern T0* T336f18(T0* C);
/* GEANT_SETENV_TASK.file_system */
extern T0* T336f17(T0* C);
/* GEANT_SETENV_TASK.unix_file_system */
extern T0* T336f23(T0* C);
/* GEANT_SETENV_TASK.windows_file_system */
extern T0* T336f22(T0* C);
/* GEANT_SETENV_TASK.operating_system */
extern T0* T336f21(T0* C);
/* GEANT_MOVE_TASK.execute */
extern void T334f35(T0* C);
/* GEANT_MOVE_COMMAND.execute */
extern void T452f23(T0* C);
/* GEANT_MOVE_COMMAND.create_directory_for_pathname */
extern void T452f26(T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.file_system */
extern T0* T452f14(T0* C);
/* GEANT_MOVE_COMMAND.windows_file_system */
extern T0* T452f16(T0* C);
/* GEANT_MOVE_COMMAND.operating_system */
extern T0* T452f15(T0* C);
/* GEANT_MOVE_COMMAND.is_file_to_file_executable */
extern T1 T452f10(T0* C);
/* GEANT_MOVE_COMMAND.move_file */
extern void T452f25(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.same_physical_file */
extern T1 T53f33(T0* C, T0* a1, T0* a2);
/* KL_TEXT_INPUT_FILE.same_physical_file */
extern T1 T55f44(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.change_name */
extern void T55f77(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.old_change_name */
extern void T55f79(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.rename_file */
extern void T55f81(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.file_rename */
extern void T55f82(T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.file_system */
extern T0* T55f49(T0* C);
/* KL_TEXT_INPUT_FILE.unix_file_system */
extern T0* T55f55(T0* C);
/* KL_TEXT_INPUT_FILE.windows_file_system */
extern T0* T55f54(T0* C);
/* KL_TEXT_INPUT_FILE.operating_system */
extern T0* T55f53(T0* C);
/* KL_TEXT_INPUT_FILE.count */
extern T6 T55f48(T0* C);
/* KL_TEXT_INPUT_FILE.old_count */
extern T6 T55f52(T0* C);
/* KL_TEXT_INPUT_FILE.file_size */
extern T6 T55f57(T0* C, T14 a1);
/* FILE_INFO.size */
extern T6 T79f18(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_write */
extern T1 T55f56(T0* C);
/* KL_TEXT_INPUT_FILE.inode */
extern T6 T55f47(T0* C);
/* FILE_INFO.inode */
extern T6 T79f17(T0* C);
/* KL_TEXT_INPUT_FILE.tmp_file1 */
extern unsigned char ge155os4411;
extern T0* ge155ov4411;
extern T0* T55f46(T0* C);
/* KL_UNIX_FILE_SYSTEM.same_physical_file */
extern T1 T54f32(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.rename_file */
extern void T53f44(T0* C, T0* a1, T0* a2);
/* KL_UNIX_FILE_SYSTEM.rename_file */
extern void T54f41(T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_COMMAND.unix_file_system */
extern T0* T452f13(T0* C);
/* GEANT_MOVE_COMMAND.create_directory */
extern void T452f24(T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.is_file_to_directory_executable */
extern T1 T452f11(T0* C);
/* GEANT_MOVE_TASK.exit_application */
extern void T334f36(T0* C, T6 a1, T0* a2);
/* GEANT_MOVE_TASK.exceptions */
extern T0* T334f22(T0* C);
/* GEANT_MOVE_TASK.std */
extern T0* T334f21(T0* C);
/* GEANT_MOVE_TASK.log_messages */
extern void T334f37(T0* C, T0* a1);
/* GEANT_MOVE_TASK.dir_attribute_name */
extern T0* T334f20(T0* C);
/* GEANT_MOVE_TASK.file_system */
extern T0* T334f19(T0* C);
/* GEANT_MOVE_TASK.unix_file_system */
extern T0* T334f25(T0* C);
/* GEANT_MOVE_TASK.windows_file_system */
extern T0* T334f24(T0* C);
/* GEANT_MOVE_TASK.operating_system */
extern T0* T334f23(T0* C);
/* GEANT_COPY_TASK.execute */
extern void T332f40(T0* C);
/* GEANT_COPY_COMMAND.execute */
extern void T449f27(T0* C);
/* GEANT_COPY_COMMAND.create_directory_for_pathname */
extern void T449f30(T0* C, T0* a1);
/* GEANT_COPY_COMMAND.file_system */
extern T0* T449f16(T0* C);
/* GEANT_COPY_COMMAND.windows_file_system */
extern T0* T449f19(T0* C);
/* GEANT_COPY_COMMAND.operating_system */
extern T0* T449f18(T0* C);
/* GEANT_COPY_COMMAND.is_file_to_file_executable */
extern T1 T449f12(T0* C);
/* GEANT_COPY_COMMAND.copy_file */
extern void T449f29(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.copy_file */
extern void T53f43(T0* C, T0* a1, T0* a2);
/* KL_TEXT_INPUT_FILE.copy_file */
extern void T55f76(T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.close */
extern void T652f40(T0* C);
/* KL_BINARY_OUTPUT_FILE.close */
extern void T653f28(T0* C);
/* KL_BINARY_OUTPUT_FILE.put_string */
extern void T653f27(T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.old_put_string */
extern void T653f32(T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.file_ps */
extern void T653f35(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_BINARY_OUTPUT_FILE.string_ */
extern T0* T653f9(T0* C);
/* KL_BINARY_INPUT_FILE.read_string */
extern void T652f39(T0* C, T6 a1);
/* KL_BINARY_INPUT_FILE.read_to_string */
extern T6 T652f20(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_BINARY_INPUT_FILE.dummy_kl_character_buffer */
extern T0* T652f35(T0* C);
/* KL_BINARY_INPUT_FILE.any_ */
extern T0* T652f33(T0* C);
/* KL_BINARY_INPUT_FILE.old_read_to_string */
extern T6 T652f19(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_BINARY_INPUT_FILE.file_gss */
extern T6 T652f32(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_BINARY_INPUT_FILE.old_end_of_file */
extern T1 T652f18(T0* C);
/* KL_BINARY_INPUT_FILE.file_feof */
extern T1 T652f31(T0* C, T14 a1);
/* KL_BINARY_OUTPUT_FILE.is_open_write */
extern T1 T653f14(T0* C);
/* KL_BINARY_OUTPUT_FILE.old_is_open_write */
extern T1 T653f8(T0* C);
/* KL_BINARY_OUTPUT_FILE.open_write */
extern void T653f26(T0* C);
/* KL_BINARY_OUTPUT_FILE.is_closed */
extern T1 T653f13(T0* C);
/* KL_BINARY_OUTPUT_FILE.old_open_write */
extern void T653f31(T0* C);
/* KL_BINARY_OUTPUT_FILE.open_write */
extern void T653f31p1(T0* C);
/* KL_BINARY_OUTPUT_FILE.file_open */
extern T14 T653f19(T0* C, T14 a1, T6 a2);
/* KL_BINARY_OUTPUT_FILE.internal_name_pointer */
extern T0* T653f18(T0* C);
/* KL_BINARY_OUTPUT_FILE.string_name */
extern T0* T653f12(T0* C);
/* KL_BINARY_OUTPUT_FILE.make */
extern T0* T653c24(T0* a1);
/* KL_BINARY_OUTPUT_FILE.old_make */
extern void T653f29(T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.make_with_name */
extern void T653f33(T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.set_name */
extern void T653f36(T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.buffered_file_info */
extern T0* T653f23(T0* C);
/* KL_BINARY_INPUT_FILE.is_open_read */
extern T1 T652f14(T0* C);
/* KL_BINARY_INPUT_FILE.old_is_open_read */
extern T1 T652f28(T0* C);
/* KL_BINARY_INPUT_FILE.open_read */
extern void T652f38(T0* C);
/* KL_BINARY_INPUT_FILE.is_closed */
extern T1 T652f17(T0* C);
/* KL_BINARY_INPUT_FILE.old_open_read */
extern void T652f43(T0* C);
/* KL_BINARY_INPUT_FILE.open_read */
extern void T652f43p1(T0* C);
/* KL_BINARY_INPUT_FILE.file_open */
extern T14 T652f26(T0* C, T14 a1, T6 a2);
/* KL_BINARY_INPUT_FILE.internal_name_pointer */
extern T0* T652f25(T0* C);
/* KL_BINARY_INPUT_FILE.old_is_readable */
extern T1 T652f16(T0* C);
/* KL_BINARY_INPUT_FILE.buffered_file_info */
extern T0* T652f29(T0* C);
/* KL_BINARY_INPUT_FILE.set_buffer */
extern void T652f47(T0* C);
/* KL_BINARY_INPUT_FILE.old_exists */
extern T1 T652f15(T0* C);
/* KL_BINARY_INPUT_FILE.file_exists */
extern T1 T652f30(T0* C, T14 a1);
/* KL_BINARY_INPUT_FILE.string_name */
extern T0* T652f13(T0* C);
/* KL_BINARY_INPUT_FILE.make */
extern T0* T652c36(T0* a1);
/* KL_BINARY_INPUT_FILE.make */
extern void T652f36p1(T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.old_make */
extern void T652f41(T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.make_with_name */
extern void T652f44(T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.set_name */
extern void T652f46(T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.string_ */
extern T0* T652f10(T0* C);
/* KL_UNIX_FILE_SYSTEM.copy_file */
extern void T54f40(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.is_file_outofdate */
extern T1 T449f17(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.unix_file_system */
extern T0* T449f15(T0* C);
/* GEANT_COPY_COMMAND.create_directory */
extern void T449f28(T0* C, T0* a1);
/* GEANT_COPY_COMMAND.is_file_to_directory_executable */
extern T1 T449f13(T0* C);
/* GEANT_COPY_TASK.exit_application */
extern void T332f41(T0* C, T6 a1, T0* a2);
/* GEANT_COPY_TASK.exceptions */
extern T0* T332f27(T0* C);
/* GEANT_COPY_TASK.log_messages */
extern void T332f42(T0* C, T0* a1);
/* GEANT_COPY_TASK.dir_attribute_name */
extern T0* T332f26(T0* C);
/* GEANT_COPY_TASK.file_system */
extern T0* T332f25(T0* C);
/* GEANT_COPY_TASK.unix_file_system */
extern T0* T332f30(T0* C);
/* GEANT_COPY_TASK.windows_file_system */
extern T0* T332f29(T0* C);
/* GEANT_COPY_TASK.operating_system */
extern T0* T332f28(T0* C);
/* GEANT_DELETE_TASK.execute */
extern void T330f35(T0* C);
/* GEANT_DELETE_COMMAND.execute */
extern void T445f25(T0* C);
/* GEANT_DIRECTORYSET.forth */
extern void T446f31(T0* C);
/* GEANT_DIRECTORYSET.update_project_variables */
extern void T446f35(T0* C);
/* GEANT_DIRECTORYSET.item_directory_name */
extern T0* T446f14(T0* C);
/* GEANT_DIRECTORYSET.after */
extern T1 T446f13(T0* C);
/* GEANT_DIRECTORYSET.start */
extern void T446f30(T0* C);
/* GEANT_DIRECTORYSET.execute */
extern void T446f29(T0* C);
/* GEANT_DIRECTORYSET.remove_fileset_entry */
extern void T446f34(T0* C, T0* a1);
/* GEANT_DIRECTORYSET.add_fileset_entry_if_necessary */
extern void T446f33(T0* C, T0* a1);
/* GEANT_DIRECTORYSET.scan_internal */
extern void T446f32(T0* C, T0* a1);
/* GEANT_DIRECTORYSET.file_system */
extern T0* T446f18(T0* C);
/* GEANT_DIRECTORYSET.windows_file_system */
extern T0* T446f20(T0* C);
/* GEANT_DIRECTORYSET.operating_system */
extern T0* T446f19(T0* C);
/* GEANT_DIRECTORYSET.string_ */
extern T0* T446f17(T0* C);
/* GEANT_DIRECTORYSET.unix_file_system */
extern T0* T446f16(T0* C);
/* GEANT_DIRECTORYSET.is_executable */
extern T1 T446f15(T0* C);
/* GEANT_DELETE_COMMAND.is_directoryset_executable */
extern T1 T445f14(T0* C);
/* GEANT_DELETE_COMMAND.is_fileset_executable */
extern T1 T445f13(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.delete_file */
extern void T53f39(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.delete */
extern void T55f75(T0* C);
/* KL_TEXT_INPUT_FILE.old_delete */
extern void T55f78(T0* C);
/* KL_TEXT_INPUT_FILE.file_unlink */
extern void T55f80(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.delete_file */
extern void T54f36(T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.is_file_executable */
extern T1 T445f11(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.recursive_delete_directory */
extern void T53f41(T0* C, T0* a1);
/* KL_DIRECTORY.recursive_delete */
extern void T501f60(T0* C);
/* KL_DIRECTORY.old_recursive_delete */
extern void T501f62(T0* C);
/* KL_DIRECTORY.old_delete */
extern void T501f63(T0* C);
/* KL_DIRECTORY.eif_dir_delete */
extern void T501f65(T0* C, T14 a1);
/* KL_DIRECTORY.old_is_empty */
extern T1 T501f38(T0* C);
/* KL_DIRECTORY.count */
extern T6 T501f42(T0* C);
/* DIRECTORY.readentry */
extern void T661f22(T0* C);
/* DIRECTORY.file_info */
extern T0* T661f9(T0* C);
/* DIRECTORY.eif_dir_next */
extern T14 T661f18(T0* C, T14 a1);
/* DIRECTORY.start */
extern void T661f21(T0* C);
/* DIRECTORY.dir_rewind */
extern T14 T661f11(T0* C, T14 a1, T14 a2);
/* DIRECTORY.internal_name_pointer */
extern T0* T661f10(T0* C);
/* DIRECTORY.make_open_read */
extern T0* T661c19(T0* a1);
/* DIRECTORY.open_read */
extern void T661f27(T0* C);
/* DIRECTORY.dir_open */
extern T14 T661f13(T0* C, T14 a1);
/* DIRECTORY.make */
extern void T661f26(T0* C, T0* a1);
/* DIRECTORY.make_with_name */
extern void T661f31(T0* C, T0* a1);
/* DIRECTORY.set_name */
extern void T661f33(T0* C, T0* a1);
/* KL_DIRECTORY.delete_content */
extern void T501f64(T0* C);
/* KL_DIRECTORY.delete_content_with_action */
extern void T501f66(T0* C, T0* a1, T0* a2, T6 a3);
/* ARRAYED_LIST [READABLE_STRING_32].wipe_out */
extern void T662f9(T0* C);
/* SPECIAL [READABLE_STRING_32].wipe_out */
extern void T680f6(T0* C);
/* SPECIAL [READABLE_STRING_32].set_count */
extern void T680f7(T0* C, T6 a1);
/* ARRAYED_LIST [READABLE_STRING_32].extend */
extern void T662f8(T0* C, T0* a1);
/* SPECIAL [READABLE_STRING_32].extend */
extern void T680f5(T0* C, T0* a1);
/* SPECIAL [READABLE_STRING_32].aliased_resized_area */
extern T0* T680f3(T0* C, T6 a1);
/* ARRAYED_LIST [READABLE_STRING_32].additional_space */
extern T6 T662f4(T0* C);
/* ARRAYED_LIST [READABLE_STRING_32].capacity */
extern T6 T662f5(T0* C);
/* ARRAYED_LIST [READABLE_STRING_32].count */
extern T6 T662f3(T0* C);
/* RAW_FILE.delete */
extern void T660f18(T0* C);
/* RAW_FILE.file_unlink */
extern void T660f21(T0* C, T14 a1);
/* RAW_FILE.internal_name_pointer */
extern T0* T660f11(T0* C);
/* RAW_FILE.make_with_path */
extern T0* T660c15(T0* a1);
/* RAW_FILE.set_path */
extern void T660f19(T0* C, T0* a1);
/* PATH.to_pointer */
extern T0* T659f15(T0* C);
/* PATH.unit_size */
extern T6 T659f14(T0* C);
/* RAW_FILE.reset_path */
extern void T660f17(T0* C, T0* a1);
/* FILE_INFO.is_writable */
extern T1 T79f21(T0* C);
/* DIRECTORY.recursive_delete_with_action */
extern void T661f24(T0* C, T0* a1, T0* a2, T6 a3);
/* ARRAYED_LIST [READABLE_STRING_GENERAL].extend */
extern void T678f8(T0* C, T0* a1);
/* SPECIAL [READABLE_STRING_GENERAL].extend */
extern void T686f5(T0* C, T0* a1);
/* SPECIAL [READABLE_STRING_GENERAL].aliased_resized_area */
extern T0* T686f3(T0* C, T6 a1);
/* ARRAYED_LIST [READABLE_STRING_GENERAL].additional_space */
extern T6 T678f4(T0* C);
/* ARRAYED_LIST [READABLE_STRING_GENERAL].capacity */
extern T6 T678f5(T0* C);
/* ARRAYED_LIST [READABLE_STRING_GENERAL].count */
extern T6 T678f3(T0* C);
/* ARRAYED_LIST [READABLE_STRING_GENERAL].make */
extern T0* T678c7(T6 a1);
/* SPECIAL [READABLE_STRING_GENERAL].make_empty */
extern T0* T686c4(T6 a1);
/* DIRECTORY.delete */
extern void T661f29(T0* C);
/* DIRECTORY.eif_dir_delete */
extern void T661f32(T0* C, T14 a1);
/* DIRECTORY.delete_content_with_action */
extern void T661f28(T0* C, T0* a1, T0* a2, T6 a3);
/* DIRECTORY.path */
extern T0* T661f15(T0* C);
/* PATH.make_from_pointer */
extern T0* T659c17(T14 a1);
/* PATH.reset_internal_data */
extern void T659f21(T0* C);
/* PATH.normalize */
extern void T659f20(T0* C);
/* PATH.directory_separator */
extern T2 T659f5(T0* C);
/* PATH.root_end_position */
extern T6 T659f4(T0* C);
/* PATH.next_directory_separator */
extern T6 T659f10(T0* C, T6 a1);
/* CHARACTER_8.as_lower */
extern T2 T2f24(T2* C);
/* PATH.is_character */
extern T1 T659f8(T0* C, T0* a1, T6 a2, T2 a3);
/* PATH.pointer_length_in_bytes */
extern T6 T659f13(T0* C, T14 a1);
/* PATH.c_pointer_length_in_bytes */
extern T11 T659f16(T0* C, T14 a1);
/* DIRECTORY.make_with_path */
extern void T661f23(T0* C, T0* a1);
/* DIRECTORY.make_with_path */
extern T0* T661c23(T0* a1);
/* FILE_INFO.is_directory */
extern T1 T79f20(T0* C);
/* FILE_INFO.is_symlink */
extern T1 T79f19(T0* C);
/* FILE_INFO.update */
extern void T79f26(T0* C, T0* a1);
/* PATH.name */
extern T0* T659f6(T0* C);
/* UTF_CONVERTER.utf_8_string_8_to_escaped_string_32 */
extern T0* T118f10(T118* C, T0* a1);
/* UTF_CONVERTER.utf_8_string_8_into_escaped_string_32 */
extern void T118f21(T118* C, T0* a1, T0* a2);
/* UTF_CONVERTER.utf_16le_string_8_to_escaped_string_32 */
extern T0* T118f9(T118* C, T0* a1);
/* UTF_CONVERTER.utf_16le_string_8_into_escaped_string_32 */
extern void T118f20(T118* C, T0* a1, T0* a2);
/* PATH.extended */
extern T0* T659f12(T0* C, T0* a1);
/* PATH.make_from_storage */
extern T0* T659c19(T0* a1);
/* PATH.internal_append_into */
extern void T659f18(T0* C, T0* a1, T0* a2, T2 a3);
/* UTF_CONVERTER.escaped_utf_32_string_into_utf_8_string_8 */
extern void T118f19(T118* C, T0* a1, T0* a2);
/* STRING_8.extend */
extern void T17f64(T0* C, T2 a1);
/* STRING_8.grow */
extern void T17f63(T0* C, T6 a1);
/* UTF_CONVERTER.escaped_utf_32_string_into_utf_16le_string_8 */
extern void T118f18(T118* C, T0* a1, T0* a2);
/* KL_DIRECTORY.path */
extern T0* T501f39(T0* C);
/* FILE_INFO.set_is_following_symlinks */
extern void T79f25(T0* C, T1 a1);
/* ARRAYED_LIST [READABLE_STRING_32].make */
extern T0* T662c7(T6 a1);
/* SPECIAL [READABLE_STRING_32].make_empty */
extern T0* T680c4(T6 a1);
/* KL_UNIX_FILE_SYSTEM.recursive_delete_directory */
extern void T54f38(T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.unix_file_system */
extern T0* T445f16(T0* C);
/* GEANT_DELETE_COMMAND.file_system */
extern T0* T445f15(T0* C);
/* GEANT_DELETE_COMMAND.windows_file_system */
extern T0* T445f18(T0* C);
/* GEANT_DELETE_COMMAND.operating_system */
extern T0* T445f17(T0* C);
/* GEANT_DELETE_COMMAND.is_directory_executable */
extern T1 T445f12(T0* C);
/* GEANT_DELETE_TASK.exit_application */
extern void T330f36(T0* C, T6 a1, T0* a2);
/* GEANT_DELETE_TASK.exceptions */
extern T0* T330f22(T0* C);
/* GEANT_DELETE_TASK.std */
extern T0* T330f21(T0* C);
/* GEANT_DELETE_TASK.log_messages */
extern void T330f37(T0* C, T0* a1);
/* GEANT_DELETE_TASK.dir_attribute_name */
extern T0* T330f20(T0* C);
/* GEANT_DELETE_TASK.file_system */
extern T0* T330f19(T0* C);
/* GEANT_DELETE_TASK.unix_file_system */
extern T0* T330f25(T0* C);
/* GEANT_DELETE_TASK.windows_file_system */
extern T0* T330f24(T0* C);
/* GEANT_DELETE_TASK.operating_system */
extern T0* T330f23(T0* C);
/* GEANT_MKDIR_TASK.execute */
extern void T328f31(T0* C);
/* GEANT_MKDIR_COMMAND.execute */
extern void T441f16(T0* C);
/* GEANT_MKDIR_TASK.exit_application */
extern void T328f32(T0* C, T6 a1, T0* a2);
/* GEANT_MKDIR_TASK.exceptions */
extern T0* T328f17(T0* C);
/* GEANT_MKDIR_TASK.std */
extern T0* T328f16(T0* C);
/* GEANT_MKDIR_TASK.log_messages */
extern void T328f33(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.project_variables_resolver */
extern T0* T328f10(T0* C);
/* GEANT_MKDIR_TASK.dir_attribute_name */
extern T0* T328f15(T0* C);
/* GEANT_MKDIR_TASK.file_system */
extern T0* T328f14(T0* C);
/* GEANT_MKDIR_TASK.unix_file_system */
extern T0* T328f20(T0* C);
/* GEANT_MKDIR_TASK.windows_file_system */
extern T0* T328f19(T0* C);
/* GEANT_MKDIR_TASK.operating_system */
extern T0* T328f18(T0* C);
/* GEANT_ECHO_TASK.execute */
extern void T326f31(T0* C);
/* GEANT_ECHO_COMMAND.execute */
extern void T438f16(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_append */
extern void T525f27(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_append */
extern void T525f33(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_append */
extern void T525f33p1(T0* C);
/* GEANT_BOOLEAN_PROPERTY.non_empty_value_or_else */
extern T1 T405f6(T0* C, T1 a1);
/* GEANT_BOOLEAN_PROPERTY.value */
extern T1 T405f5(T0* C);
/* GEANT_BOOLEAN_PROPERTY.boolean_value */
extern T1 T405f8(T0* C, T0* a1);
/* GEANT_BOOLEAN_PROPERTY.false_attribute_value */
extern unsigned char ge19os9764;
extern T0* ge19ov9764;
extern T0* T405f11(T0* C);
/* GEANT_BOOLEAN_PROPERTY.true_attribute_value */
extern unsigned char ge19os9763;
extern T0* ge19ov9763;
extern T0* T405f10(T0* C);
/* GEANT_BOOLEAN_PROPERTY.string_ */
extern T0* T405f9(T0* C);
/* GEANT_BOOLEAN_PROPERTY.string_value */
extern T0* T405f4(T0* C);
/* GEANT_BOOLEAN_PROPERTY.is_defined */
extern T1 T405f7(T0* C);
/* GEANT_ECHO_TASK.exit_application */
extern void T326f32(T0* C, T6 a1, T0* a2);
/* GEANT_ECHO_TASK.exceptions */
extern T0* T326f17(T0* C);
/* GEANT_ECHO_TASK.std */
extern T0* T326f16(T0* C);
/* GEANT_ECHO_TASK.log_messages */
extern void T326f33(T0* C, T0* a1);
/* GEANT_ECHO_TASK.project_variables_resolver */
extern T0* T326f10(T0* C);
/* GEANT_ECHO_TASK.dir_attribute_name */
extern T0* T326f15(T0* C);
/* GEANT_ECHO_TASK.file_system */
extern T0* T326f14(T0* C);
/* GEANT_ECHO_TASK.unix_file_system */
extern T0* T326f20(T0* C);
/* GEANT_ECHO_TASK.windows_file_system */
extern T0* T326f19(T0* C);
/* GEANT_ECHO_TASK.operating_system */
extern T0* T326f18(T0* C);
/* GEANT_GEANT_TASK.execute */
extern void T324f47(T0* C);
/* GEANT_GEANT_COMMAND.execute */
extern void T434f34(T0* C);
/* GEANT_GEANT_COMMAND.execute_with_target */
extern void T434f38(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.is_fileset_executable */
extern T1 T434f21(T0* C);
/* GEANT_GEANT_COMMAND.execute_forked_with_target */
extern void T434f37(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.string_ */
extern T0* T434f19(T0* C);
/* GEANT_GEANT_COMMAND.execute_with_filename */
extern void T434f36(T0* C, T0* a1);
/* GEANT_TARGET.is_exported_to_project */
extern T1 T26f62(T0* C, T0* a1);
/* GEANT_PROJECT.has_parent_with_name */
extern T1 T22f28(T0* C, T0* a1);
/* GEANT_PROJECT.string_ */
extern T0* T22f29(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].item */
extern T0* T213f11(T0* C, T6 a1);
/* GEANT_GEANT_COMMAND.exit_application */
extern void T434f39(T0* C, T6 a1, T0* a2);
/* GEANT_GEANT_COMMAND.exceptions */
extern T0* T434f23(T0* C);
/* GEANT_GEANT_COMMAND.std */
extern T0* T434f22(T0* C);
/* GEANT_GEANT_COMMAND.log_messages */
extern void T434f41(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.execute_forked_with_filename_and_target */
extern void T434f35(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_COMMAND.execute_shell */
extern void T434f40(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.options_and_arguments_for_cmdline */
extern T0* T434f20(T0* C);
/* GEANT_PROJECT_VARIABLES.put */
extern void T25f87(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_COMMAND.project_variables_resolver */
extern T0* T434f18(T0* C);
/* GEANT_GEANT_COMMAND.unix_file_system */
extern T0* T434f17(T0* C);
/* GEANT_GEANT_COMMAND.file_system */
extern T0* T434f16(T0* C);
/* GEANT_GEANT_COMMAND.windows_file_system */
extern T0* T434f25(T0* C);
/* GEANT_GEANT_COMMAND.operating_system */
extern T0* T434f24(T0* C);
/* GEANT_GEANT_COMMAND.is_filename_executable */
extern T1 T434f14(T0* C);
/* GEANT_GEANT_TASK.dir_attribute_name */
extern T0* T324f32(T0* C);
/* GEANT_GEANT_TASK.file_system */
extern T0* T324f31(T0* C);
/* GEANT_GEANT_TASK.unix_file_system */
extern T0* T324f35(T0* C);
/* GEANT_GEANT_TASK.windows_file_system */
extern T0* T324f34(T0* C);
/* GEANT_GEANT_TASK.operating_system */
extern T0* T324f33(T0* C);
/* GEANT_GETEST_TASK.execute */
extern void T322f48(T0* C);
/* GEANT_GETEST_COMMAND.execute */
extern void T431f34(T0* C);
/* GEANT_GETEST_COMMAND.execute_shell */
extern void T431f35(T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.unix_file_system */
extern T0* T431f19(T0* C);
/* GEANT_GETEST_COMMAND.file_system */
extern T0* T431f18(T0* C);
/* GEANT_GETEST_COMMAND.windows_file_system */
extern T0* T431f21(T0* C);
/* GEANT_GETEST_COMMAND.operating_system */
extern T0* T431f20(T0* C);
/* GEANT_GETEST_COMMAND.string_ */
extern T0* T431f17(T0* C);
/* GEANT_GETEST_TASK.exit_application */
extern void T322f49(T0* C, T6 a1, T0* a2);
/* GEANT_GETEST_TASK.exceptions */
extern T0* T322f35(T0* C);
/* GEANT_GETEST_TASK.log_messages */
extern void T322f50(T0* C, T0* a1);
/* GEANT_GETEST_TASK.dir_attribute_name */
extern T0* T322f34(T0* C);
/* GEANT_GETEST_TASK.file_system */
extern T0* T322f33(T0* C);
/* GEANT_GETEST_TASK.unix_file_system */
extern T0* T322f38(T0* C);
/* GEANT_GETEST_TASK.windows_file_system */
extern T0* T322f37(T0* C);
/* GEANT_GETEST_TASK.operating_system */
extern T0* T322f36(T0* C);
/* GEANT_GEPP_TASK.execute */
extern void T320f43(T0* C);
/* GEANT_GEPP_COMMAND.execute */
extern void T428f29(T0* C);
/* GEANT_FILESET.has_map */
extern T1 T406f30(T0* C);
/* GEANT_GEPP_COMMAND.execute_shell */
extern void T428f31(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.is_file_outofdate */
extern T1 T428f18(T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_COMMAND.unix_file_system */
extern T0* T428f17(T0* C);
/* GEANT_GEPP_COMMAND.file_system */
extern T0* T428f16(T0* C);
/* GEANT_GEPP_COMMAND.windows_file_system */
extern T0* T428f20(T0* C);
/* GEANT_GEPP_COMMAND.operating_system */
extern T0* T428f19(T0* C);
/* GEANT_GEPP_COMMAND.is_file_executable */
extern T1 T428f13(T0* C);
/* GEANT_GEPP_COMMAND.create_directory */
extern void T428f30(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.string_ */
extern T0* T428f15(T0* C);
/* GEANT_GEPP_TASK.exit_application */
extern void T320f44(T0* C, T6 a1, T0* a2);
/* GEANT_GEPP_TASK.exceptions */
extern T0* T320f30(T0* C);
/* GEANT_GEPP_TASK.log_messages */
extern void T320f45(T0* C, T0* a1);
/* GEANT_GEPP_TASK.dir_attribute_name */
extern T0* T320f29(T0* C);
/* GEANT_GEPP_TASK.file_system */
extern T0* T320f28(T0* C);
/* GEANT_GEPP_TASK.unix_file_system */
extern T0* T320f33(T0* C);
/* GEANT_GEPP_TASK.windows_file_system */
extern T0* T320f32(T0* C);
/* GEANT_GEPP_TASK.operating_system */
extern T0* T320f31(T0* C);
/* GEANT_GEYACC_TASK.execute */
extern void T318f43(T0* C);
/* GEANT_GEYACC_COMMAND.execute */
extern void T425f27(T0* C);
/* GEANT_GEYACC_COMMAND.execute_shell */
extern void T425f28(T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.string_ */
extern T0* T425f15(T0* C);
/* GEANT_GEYACC_COMMAND.unix_file_system */
extern T0* T425f14(T0* C);
/* GEANT_GEYACC_COMMAND.file_system */
extern T0* T425f13(T0* C);
/* GEANT_GEYACC_COMMAND.windows_file_system */
extern T0* T425f17(T0* C);
/* GEANT_GEYACC_COMMAND.operating_system */
extern T0* T425f16(T0* C);
/* GEANT_GEYACC_TASK.exit_application */
extern void T318f44(T0* C, T6 a1, T0* a2);
/* GEANT_GEYACC_TASK.exceptions */
extern T0* T318f30(T0* C);
/* GEANT_GEYACC_TASK.log_messages */
extern void T318f45(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.dir_attribute_name */
extern T0* T318f29(T0* C);
/* GEANT_GEYACC_TASK.file_system */
extern T0* T318f28(T0* C);
/* GEANT_GEYACC_TASK.unix_file_system */
extern T0* T318f33(T0* C);
/* GEANT_GEYACC_TASK.windows_file_system */
extern T0* T318f32(T0* C);
/* GEANT_GEYACC_TASK.operating_system */
extern T0* T318f31(T0* C);
/* GEANT_GELEX_TASK.execute */
extern void T316f46(T0* C);
/* GEANT_GELEX_COMMAND.execute */
extern void T422f35(T0* C);
/* GEANT_GELEX_COMMAND.execute_shell */
extern void T422f36(T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.unix_file_system */
extern T0* T422f19(T0* C);
/* GEANT_GELEX_COMMAND.file_system */
extern T0* T422f18(T0* C);
/* GEANT_GELEX_COMMAND.windows_file_system */
extern T0* T422f21(T0* C);
/* GEANT_GELEX_COMMAND.operating_system */
extern T0* T422f20(T0* C);
/* GEANT_GELEX_COMMAND.string_ */
extern T0* T422f17(T0* C);
/* GEANT_GELEX_TASK.exit_application */
extern void T316f47(T0* C, T6 a1, T0* a2);
/* GEANT_GELEX_TASK.exceptions */
extern T0* T316f33(T0* C);
/* GEANT_GELEX_TASK.log_messages */
extern void T316f48(T0* C, T0* a1);
/* GEANT_GELEX_TASK.dir_attribute_name */
extern T0* T316f32(T0* C);
/* GEANT_GELEX_TASK.file_system */
extern T0* T316f31(T0* C);
/* GEANT_GELEX_TASK.unix_file_system */
extern T0* T316f36(T0* C);
/* GEANT_GELEX_TASK.windows_file_system */
extern T0* T316f35(T0* C);
/* GEANT_GELEX_TASK.operating_system */
extern T0* T316f34(T0* C);
/* GEANT_GEXACE_TASK.execute */
extern void T314f44(T0* C);
/* GEANT_GEXACE_COMMAND.execute */
extern void T419f32(T0* C);
/* GEANT_GEXACE_COMMAND.execute_shell */
extern void T419f33(T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.unix_file_system */
extern T0* T419f20(T0* C);
/* GEANT_GEXACE_COMMAND.file_system */
extern T0* T419f19(T0* C);
/* GEANT_GEXACE_COMMAND.windows_file_system */
extern T0* T419f22(T0* C);
/* GEANT_GEXACE_COMMAND.operating_system */
extern T0* T419f21(T0* C);
/* GEANT_GEXACE_COMMAND.is_library_executable */
extern T1 T419f17(T0* C);
/* GEANT_GEXACE_COMMAND.is_system_executable */
extern T1 T419f16(T0* C);
/* GEANT_GEXACE_COMMAND.is_validate_executable */
extern T1 T419f15(T0* C);
/* GEANT_GEXACE_COMMAND.string_ */
extern T0* T419f18(T0* C);
/* GEANT_GEXACE_TASK.exit_application */
extern void T314f45(T0* C, T6 a1, T0* a2);
/* GEANT_GEXACE_TASK.exceptions */
extern T0* T314f31(T0* C);
/* GEANT_GEXACE_TASK.log_messages */
extern void T314f46(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.dir_attribute_name */
extern T0* T314f30(T0* C);
/* GEANT_GEXACE_TASK.file_system */
extern T0* T314f29(T0* C);
/* GEANT_GEXACE_TASK.unix_file_system */
extern T0* T314f34(T0* C);
/* GEANT_GEXACE_TASK.windows_file_system */
extern T0* T314f33(T0* C);
/* GEANT_GEXACE_TASK.operating_system */
extern T0* T314f32(T0* C);
/* GEANT_UNSET_TASK.execute */
extern void T312f32(T0* C);
/* GEANT_UNSET_COMMAND.execute */
extern void T415f10(T0* C);
/* GEANT_PROJECT.unset_variable */
extern void T22f52(T0* C, T0* a1);
/* GEANT_UNSET_TASK.exit_application */
extern void T312f33(T0* C, T6 a1, T0* a2);
/* GEANT_UNSET_TASK.exceptions */
extern T0* T312f19(T0* C);
/* GEANT_UNSET_TASK.std */
extern T0* T312f18(T0* C);
/* GEANT_UNSET_TASK.log_messages */
extern void T312f34(T0* C, T0* a1);
/* GEANT_UNSET_TASK.dir_attribute_name */
extern T0* T312f17(T0* C);
/* GEANT_UNSET_TASK.file_system */
extern T0* T312f16(T0* C);
/* GEANT_UNSET_TASK.unix_file_system */
extern T0* T312f22(T0* C);
/* GEANT_UNSET_TASK.windows_file_system */
extern T0* T312f21(T0* C);
/* GEANT_UNSET_TASK.operating_system */
extern T0* T312f20(T0* C);
/* GEANT_SET_TASK.execute */
extern void T310f33(T0* C);
/* GEANT_SET_COMMAND.execute */
extern void T412f17(T0* C);
/* GEANT_SET_COMMAND.default_builtin_variables */
extern T0* T412f8(T0* C);
/* GEANT_SET_COMMAND.file_system */
extern T0* T412f10(T0* C);
/* GEANT_SET_COMMAND.unix_file_system */
extern T0* T412f12(T0* C);
/* GEANT_SET_COMMAND.windows_file_system */
extern T0* T412f11(T0* C);
/* GEANT_SET_COMMAND.operating_system */
extern T0* T412f9(T0* C);
/* GEANT_SET_TASK.exit_application */
extern void T310f34(T0* C, T6 a1, T0* a2);
/* GEANT_SET_TASK.exceptions */
extern T0* T310f20(T0* C);
/* GEANT_SET_TASK.std */
extern T0* T310f19(T0* C);
/* GEANT_SET_TASK.log_messages */
extern void T310f35(T0* C, T0* a1);
/* GEANT_SET_TASK.dir_attribute_name */
extern T0* T310f18(T0* C);
/* GEANT_SET_TASK.file_system */
extern T0* T310f17(T0* C);
/* GEANT_SET_TASK.unix_file_system */
extern T0* T310f23(T0* C);
/* GEANT_SET_TASK.windows_file_system */
extern T0* T310f22(T0* C);
/* GEANT_SET_TASK.operating_system */
extern T0* T310f21(T0* C);
/* GEANT_LCC_TASK.execute */
extern void T308f33(T0* C);
/* GEANT_LCC_COMMAND.execute */
extern void T409f17(T0* C);
/* GEANT_LCC_COMMAND.execute_shell */
extern void T409f18(T0* C, T0* a1);
/* GEANT_LCC_COMMAND.string_ */
extern T0* T409f10(T0* C);
/* GEANT_LCC_COMMAND.unix_file_system */
extern T0* T409f9(T0* C);
/* GEANT_LCC_COMMAND.file_system */
extern T0* T409f8(T0* C);
/* GEANT_LCC_COMMAND.windows_file_system */
extern T0* T409f12(T0* C);
/* GEANT_LCC_COMMAND.operating_system */
extern T0* T409f11(T0* C);
/* GEANT_LCC_TASK.exit_application */
extern void T308f34(T0* C, T6 a1, T0* a2);
/* GEANT_LCC_TASK.exceptions */
extern T0* T308f20(T0* C);
/* GEANT_LCC_TASK.std */
extern T0* T308f19(T0* C);
/* GEANT_LCC_TASK.log_messages */
extern void T308f35(T0* C, T0* a1);
/* GEANT_LCC_TASK.dir_attribute_name */
extern T0* T308f18(T0* C);
/* GEANT_LCC_TASK.file_system */
extern T0* T308f17(T0* C);
/* GEANT_LCC_TASK.unix_file_system */
extern T0* T308f23(T0* C);
/* GEANT_LCC_TASK.windows_file_system */
extern T0* T308f22(T0* C);
/* GEANT_LCC_TASK.operating_system */
extern T0* T308f21(T0* C);
/* GEANT_EXEC_TASK.execute */
extern void T306f32(T0* C);
/* GEANT_EXEC_COMMAND.execute */
extern void T401f16(T0* C);
/* GEANT_EXEC_COMMAND.project_variables_resolver */
extern T0* T401f11(T0* C);
/* GEANT_EXEC_COMMAND.execute_shell */
extern void T401f18(T0* C, T0* a1);
/* GEANT_EXEC_TASK.exit_application */
extern void T306f33(T0* C, T6 a1, T0* a2);
/* GEANT_EXEC_TASK.exceptions */
extern T0* T306f18(T0* C);
/* GEANT_EXEC_TASK.std */
extern T0* T306f17(T0* C);
/* GEANT_EXEC_TASK.log_messages */
extern void T306f34(T0* C, T0* a1);
/* GEANT_EXEC_TASK.project_variables_resolver */
extern T0* T306f11(T0* C);
/* GEANT_EXEC_TASK.dir_attribute_name */
extern T0* T306f16(T0* C);
/* GEANT_EXEC_TASK.file_system */
extern T0* T306f15(T0* C);
/* GEANT_EXEC_TASK.unix_file_system */
extern T0* T306f21(T0* C);
/* GEANT_EXEC_TASK.windows_file_system */
extern T0* T306f20(T0* C);
/* GEANT_EXEC_TASK.operating_system */
extern T0* T306f19(T0* C);
/* GEANT_ISE_TASK.execute */
extern void T304f44(T0* C);
/* GEANT_ISE_COMMAND.execute */
extern void T397f32(T0* C);
/* GEANT_ISE_COMMAND.execute_clean */
extern void T397f34(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.delete_directory */
extern void T53f42(T0* C, T0* a1);
/* KL_DIRECTORY.delete */
extern void T501f61(T0* C);
/* KL_DIRECTORY.is_empty */
extern T1 T501f34(T0* C);
/* KL_DIRECTORY.tmp_directory */
extern unsigned char ge154os9924;
extern T0* ge154ov9924;
extern T0* T501f36(T0* C);
/* KL_UNIX_FILE_SYSTEM.delete_directory */
extern void T54f39(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_empty */
extern T1 T53f30(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.is_directory_empty */
extern T1 T54f28(T0* C, T0* a1);
/* GEANT_ISE_COMMAND.eifgen_directory */
extern unsigned char ge35os8908;
extern T0* ge35ov8908;
extern T0* T397f19(T0* C);
/* GEANT_ISE_COMMAND.file_system */
extern T0* T397f16(T0* C);
/* GEANT_ISE_COMMAND.unix_file_system */
extern T0* T397f17(T0* C);
/* GEANT_ISE_COMMAND.windows_file_system */
extern T0* T397f21(T0* C);
/* GEANT_ISE_COMMAND.operating_system */
extern T0* T397f20(T0* C);
/* GEANT_ISE_COMMAND.execute_compile */
extern void T397f33(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.cd */
extern void T53f40(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.cd */
extern void T54f37(T0* C, T0* a1);
/* GEANT_ISE_COMMAND.execute_shell */
extern void T397f35(T0* C, T0* a1);
/* GEANT_ISE_COMMAND.string_ */
extern T0* T397f18(T0* C);
/* GEANT_ISE_COMMAND.is_compilable */
extern T1 T397f14(T0* C);
/* GEANT_ISE_TASK.exit_application */
extern void T304f45(T0* C, T6 a1, T0* a2);
/* GEANT_ISE_TASK.exceptions */
extern T0* T304f31(T0* C);
/* GEANT_ISE_TASK.log_messages */
extern void T304f46(T0* C, T0* a1);
/* GEANT_ISE_TASK.dir_attribute_name */
extern T0* T304f30(T0* C);
/* GEANT_ISE_TASK.file_system */
extern T0* T304f29(T0* C);
/* GEANT_ISE_TASK.unix_file_system */
extern T0* T304f34(T0* C);
/* GEANT_ISE_TASK.windows_file_system */
extern T0* T304f33(T0* C);
/* GEANT_ISE_TASK.operating_system */
extern T0* T304f32(T0* C);
/* GEANT_GEC_TASK.execute */
extern void T297f46(T0* C);
/* GEANT_GEC_COMMAND.execute */
extern void T393f37(T0* C);
/* GEANT_GEC_COMMAND.execute_shell */
extern void T393f38(T0* C, T0* a1);
/* GEANT_GEC_COMMAND.new_ace_cmdline */
extern T0* T393f19(T0* C);
/* GEANT_GEC_COMMAND.string_ */
extern T0* T393f24(T0* C);
/* GEANT_GEC_COMMAND.unix_file_system */
extern T0* T393f22(T0* C);
/* KL_INTEGER_ROUTINES.append_decimal_integer */
extern void T229f5(T0* C, T6 a1, T0* a2);
/* GEANT_GEC_COMMAND.integer_ */
extern T0* T393f23(T0* C);
/* GEANT_GEC_COMMAND.is_ace_configuration */
extern T1 T393f16(T0* C);
/* GEANT_GEC_COMMAND.file_system */
extern T0* T393f18(T0* C);
/* GEANT_GEC_COMMAND.windows_file_system */
extern T0* T393f21(T0* C);
/* GEANT_GEC_COMMAND.operating_system */
extern T0* T393f20(T0* C);
/* GEANT_GEC_COMMAND.is_cleanable */
extern T1 T393f17(T0* C);
/* GEANT_GEC_TASK.exit_application */
extern void T297f47(T0* C, T6 a1, T0* a2);
/* GEANT_GEC_TASK.exceptions */
extern T0* T297f33(T0* C);
/* GEANT_GEC_TASK.log_messages */
extern void T297f48(T0* C, T0* a1);
/* GEANT_GEC_TASK.dir_attribute_name */
extern T0* T297f32(T0* C);
/* GEANT_GEC_TASK.file_system */
extern T0* T297f31(T0* C);
/* GEANT_GEC_TASK.unix_file_system */
extern T0* T297f36(T0* C);
/* GEANT_GEC_TASK.windows_file_system */
extern T0* T297f35(T0* C);
/* GEANT_GEC_TASK.operating_system */
extern T0* T297f34(T0* C);
/* XM_CHARACTER_DATA.node_set_parent */
extern void T291f4(T0* C, T0* a1);
/* XM_ATTRIBUTE.node_set_parent */
extern void T219f6(T0* C, T0* a1);
/* XM_PROCESSING_INSTRUCTION.node_set_parent */
extern void T290f6(T0* C, T0* a1);
/* XM_COMMENT.node_set_parent */
extern void T289f5(T0* C, T0* a1);
/* XM_ELEMENT.node_set_parent */
extern void T102f24(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_stream */
extern void T186f234(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T186f241(T0* C, T0* a1);
/* YY_FILE_BUFFER.name */
extern T0* T242f14(T0* C);
/* XM_EIFFEL_INPUT_STREAM.name */
extern T0* T228f26(T0* C);
/* KL_STRING_INPUT_STREAM.name */
extern unsigned char ge172os4363;
extern T0* ge172ov4363;
extern T0* T502f6(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T186f241p1(T0* C, T0* a1);
/* YY_FILE_BUFFER.set_position */
extern void T242f19(T0* C, T6 a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.set_index */
extern void T242f18(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.new_file_buffer */
extern T0* T186f71(T0* C, T0* a1);
/* YY_FILE_BUFFER.make */
extern T0* T242c17(T0* a1);
/* YY_FILE_BUFFER.make_with_size */
extern void T242f21(T0* C, T0* a1, T6 a2);
/* YY_FILE_BUFFER.set_file */
extern void T242f23(T0* C, T0* a1);
/* YY_FILE_BUFFER.flush */
extern void T242f25(T0* C);
/* YY_FILE_BUFFER.new_default_buffer */
extern T0* T242f16(T0* C, T6 a1);
/* YY_FILE_BUFFER.default_capacity */
extern unsigned char ge1652os8681;
extern T6 ge1652ov8681;
extern T6 T242f13(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_input_stream */
extern void T184f200(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T184f209(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T184f209p1(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.new_file_buffer */
extern T0* T184f55(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_stream */
extern void T183f230(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T183f237(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T183f237p1(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.new_file_buffer */
extern T0* T183f69(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_stream */
extern void T142f198(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T142f206(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T142f206p1(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.new_file_buffer */
extern T0* T142f46(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T186f235(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T186f235p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T186f235p0(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_action */
extern void T186f245(T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.from_hexadecimal */
extern void T240f10(T0* C, T0* a1);
/* KL_STRING_ROUTINES.hexadecimal_to_integer */
extern T6 T75f13(T0* C, T0* a1);
/* XM_EIFFEL_CHARACTER_ENTITY.string_ */
extern T0* T240f7(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.to_utf8 */
extern T0* T240f3(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.utf8 */
extern T0* T240f6(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_ascii */
extern T1 T240f2(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_valid */
extern T1 T240f5(T0* C);
/* UC_UNICODE_ROUTINES.valid_non_surrogate_code */
extern T1 T355f3(T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.unicode */
extern T0* T240f4(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.from_decimal */
extern void T240f9(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.has_normalized_newline */
extern T1 T186f201(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_substring */
extern T0* T186f181(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_PE_ENTITY_DEF.text_count */
extern T6 T186f180(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.system_literal_text */
extern T0* T186f162(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_item */
extern T2 T186f207(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern T0* T186f121(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern unsigned char ge1800os7270;
extern T0* ge1800ov7270;
extern T0* T186f121p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_line_column */
extern void T186f249(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text */
extern T0* T186f105(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.pop_start_condition */
extern void T186f248(T0* C);
/* DS_LINKED_STACK [INTEGER_32].remove */
extern void T245f7(T0* C);
/* DS_LINKED_STACK [INTEGER_32].item */
extern T6 T245f4(T0* C);
/* DS_LINKED_STACK [INTEGER_32].is_empty */
extern T1 T245f3(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition */
extern void T186f246(T0* C, T6 a1);
/* DS_LINKED_STACK [INTEGER_32].force */
extern void T245f6(T0* C, T6 a1);
/* detachable DS_LINKABLE [INTEGER_32].put_right */
extern void T369f4(T0* C, T0* a1);
/* detachable DS_LINKABLE [INTEGER_32].make */
extern T0* T369c3(T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_last_token */
extern void T186f247(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_eof_action */
extern void T186f244(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.wrap */
extern T1 T186f99(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_refill_input_buffer */
extern void T186f243(T0* C);
/* YY_FILE_BUFFER.fill */
extern void T242f20(T0* C);
/* KL_CHARACTER_BUFFER.fill_from_stream */
extern T6 T387f5(T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T6 T228f27(T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T6 T228f27p1(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STRING_INPUT_STREAM.read_to_string */
extern T6 T502f8(T0* C, T0* a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.compact_left */
extern void T242f22(T0* C);
/* KL_CHARACTER_BUFFER.move_left */
extern void T387f10(T0* C, T6 a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.resize */
extern void T242f24(T0* C);
/* KL_CHARACTER_BUFFER.resize */
extern void T387f11(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_null_trans_state */
extern T6 T186f98(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_previous_state */
extern T6 T186f97(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.terminate */
extern void T186f242(T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T184f201(T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T184f201p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_action */
extern void T184f215(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.has_normalized_newline */
extern T1 T184f181(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_substring */
extern T0* T184f161(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_SCANNER_DTD.text_count */
extern T6 T184f160(T0* C);
/* XM_EIFFEL_SCANNER_DTD.system_literal_text */
extern T0* T184f142(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_item */
extern T2 T184f195(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.normalized_newline */
extern T0* T184f104(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_line_column */
extern void T184f221(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text */
extern T0* T184f78(T0* C);
/* XM_EIFFEL_SCANNER_DTD.pop_start_condition */
extern void T184f220(T0* C);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition */
extern void T184f216(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_eof_action */
extern void T184f214(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.wrap */
extern T1 T184f68(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_refill_input_buffer */
extern void T184f213(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_null_trans_state */
extern T6 T184f67(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_previous_state */
extern T6 T184f66(T0* C);
/* XM_EIFFEL_SCANNER_DTD.fatal_error */
extern void T184f212(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.terminate */
extern void T184f211(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_last_token */
extern void T184f210(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T183f231(T0* C);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T183f231p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_action */
extern void T183f240(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.has_normalized_newline */
extern T1 T183f198(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_substring */
extern T0* T183f178(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_ENTITY_DEF.text_count */
extern T6 T183f177(T0* C);
/* XM_EIFFEL_ENTITY_DEF.system_literal_text */
extern T0* T183f159(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_item */
extern T2 T183f205(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T183f118(T0* C);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T183f118p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_line_column */
extern void T183f245(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text */
extern T0* T183f102(T0* C);
/* XM_EIFFEL_ENTITY_DEF.pop_start_condition */
extern void T183f244(T0* C);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition */
extern void T183f241(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.set_last_token */
extern void T183f243(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_eof_action */
extern void T183f239(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.terminate */
extern void T183f242(T0* C);
/* XM_EIFFEL_ENTITY_DEF.wrap */
extern T1 T183f96(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_refill_input_buffer */
extern void T183f238(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_null_trans_state */
extern T6 T183f95(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_previous_state */
extern T6 T183f94(T0* C);
/* XM_EIFFEL_SCANNER.read_token */
extern void T142f199(T0* C);
/* XM_EIFFEL_SCANNER.yy_execute_action */
extern void T142f210(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.has_normalized_newline */
extern T1 T142f179(T0* C);
/* XM_EIFFEL_SCANNER.text_substring */
extern T0* T142f159(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_SCANNER.text_count */
extern T6 T142f158(T0* C);
/* XM_EIFFEL_SCANNER.system_literal_text */
extern T0* T142f140(T0* C);
/* XM_EIFFEL_SCANNER.text_item */
extern T2 T142f193(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.normalized_newline */
extern T0* T142f99(T0* C);
/* XM_EIFFEL_SCANNER.yy_set_line_column */
extern void T142f218(T0* C);
/* XM_EIFFEL_SCANNER.text */
extern T0* T142f73(T0* C);
/* XM_EIFFEL_SCANNER.pop_start_condition */
extern void T142f217(T0* C);
/* XM_EIFFEL_SCANNER.set_start_condition */
extern void T142f219(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.push_start_condition */
extern void T142f211(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.set_last_token */
extern void T142f216(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.yy_execute_eof_action */
extern void T142f209(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.terminate */
extern void T142f215(T0* C);
/* XM_EIFFEL_SCANNER.wrap */
extern T1 T142f63(T0* C);
/* XM_EIFFEL_SCANNER.yy_refill_input_buffer */
extern void T142f208(T0* C);
/* XM_EIFFEL_SCANNER.yy_null_trans_state */
extern T6 T142f62(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.yy_previous_state */
extern T6 T142f61(T0* C);
/* XM_EIFFEL_SCANNER.fatal_error */
extern void T142f207(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T186f237(T0* C);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition_dtd_ignore */
extern void T184f203(T0* C);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T183f233(T0* C);
/* XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T142f201(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_encoding */
extern void T186f238(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.set_encoding */
extern void T228f30(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_encoding */
extern void T184f204(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_encoding */
extern void T183f234(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_encoding */
extern void T142f202(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_from_resolver */
extern void T186f239(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_from_resolver */
extern void T184f205(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_from_resolver */
extern void T183f235(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T142f203(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.close_input */
extern void T186f236(T0* C);
/* KL_STRING_INPUT_STREAM.close */
extern void T502f11(T0* C);
/* KL_STRING_INPUT_STREAM.is_closable */
extern T1 T502f7(T0* C);
/* KL_TEXT_INPUT_FILE.is_closable */
extern T1 T55f30(T0* C);
/* XM_EIFFEL_SCANNER_DTD.close_input */
extern void T184f202(T0* C);
/* XM_EIFFEL_ENTITY_DEF.close_input */
extern void T183f232(T0* C);
/* XM_EIFFEL_SCANNER.close_input */
extern void T142f200(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start */
extern void T187f27(T0* C);
/* XM_CALLBACKS_NULL.on_start */
extern void T147f2(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T103f9(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T103f9p1(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start */
extern void T100f14(T0* C);
/* XM_NAMESPACE_RESOLVER.on_finish */
extern void T187f28(T0* C);
/* XM_CALLBACKS_NULL.on_finish */
extern void T147f3(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T103f10(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T103f10p1(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_finish */
extern void T100f15(T0* C);
/* XM_NAMESPACE_RESOLVER.on_comment */
extern void T187f29(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_comment */
extern void T147f4(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T103f11(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T103f11p1(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_comment */
extern void T100f16(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.handle_position */
extern void T100f24(T0* C, T0* a1);
/* XM_POSITION_TABLE.put */
extern void T104f5(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].put_last */
extern void T201f9(T0* C, T0* a1);
/* detachable DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].put_right */
extern void T295f4(T0* C, T0* a1);
/* detachable DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T295c3(T0* a1);
/* DS_PAIR [XM_POSITION, XM_NODE].make */
extern T0* T233c3(T0* a1, T0* a2);
/* XM_COMMENT.make_last_in_document */
extern T0* T289c4(T0* a1, T0* a2);
/* XM_COMMENT.make_last */
extern T0* T289c3(T0* a1, T0* a2);
/* XM_ELEMENT.force_last */
extern void T102f28(T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].force_last */
extern void T199f13(T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].force_last */
extern void T199f13p1(T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_ELEMENT_NODE].make */
extern T0* T294c3(T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].before_addition */
extern void T199f18(T0* C, T0* a1);
/* XM_ELEMENT.before_addition */
extern void T102f29(T0* C, T0* a1);
/* XM_ELEMENT.last */
extern T0* T102f18(T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].last */
extern T0* T199f8(T0* C);
/* XM_ELEMENT.is_empty */
extern T1 T102f17(T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].is_empty */
extern T1 T199f7(T0* C);
/* XM_NAMESPACE_RESOLVER.on_processing_instruction */
extern void T187f30(T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_NULL.on_processing_instruction */
extern void T147f5(T0* C, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T103f12(T0* C, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T103f12p1(T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_TO_TREE_FILTER.on_processing_instruction */
extern void T100f17(T0* C, T0* a1, T0* a2);
/* XM_PROCESSING_INSTRUCTION.make_last_in_document */
extern T0* T290c5(T0* a1, T0* a2, T0* a3);
/* XM_PROCESSING_INSTRUCTION.make_last */
extern T0* T290c4(T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER.on_content */
extern void T187f31(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_content */
extern void T147f6(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T103f13(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T103f13p1(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_content */
extern void T100f18(T0* C, T0* a1);
/* XM_CHARACTER_DATA.make_last */
extern T0* T291c3(T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_start_tag */
extern void T187f34(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.push */
extern void T272f12(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].force_last */
extern void T375f10(T0* C, T0* a1);
/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].put_right */
extern void T500f5(T0* C, T0* a1);
/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].attach_left */
extern void T500f6(T0* C, T0* a1);
/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T500c4(T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.new_string_string_table */
extern T0* T272f8(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_equality_tester */
extern void T83f42(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.string_equality_tester */
extern T0* T272f9(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map_default */
extern T0* T83c40(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].default_capacity */
extern T6 T83f37(T0* C);
/* XM_CALLBACKS_NULL.on_start_tag */
extern void T147f9(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T103f14(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T103f14p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag */
extern void T100f19(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_root */
extern T0* T102c26(T0* a1, T0* a2, T0* a3);
/* XM_DOCUMENT.set_root_element */
extern void T101f15(T0* C, T0* a1);
/* XM_DOCUMENT.remove_previous_root_element */
extern void T101f16(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].go_after */
extern void T231f14(T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_go_after */
extern void T192f28(T0* C, T0* a1);
/* XM_ELEMENT.make_last */
extern T0* T102c25(T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.new_namespace */
extern T0* T100f8(T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_NAMESPACE].force_last */
extern void T190f39(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_put */
extern void T190f44(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].clashes_put */
extern void T190f43(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].slots_item */
extern T6 T190f22(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].hash_position */
extern T6 T190f20(T0* C, T0* a1);
/* XM_NAMESPACE.hash_code */
extern T6 T191f6(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].resize */
extern void T190f42(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_resize */
extern void T190f48(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].special_integer_ */
extern T0* T190f29(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].key_storage_resize */
extern void T190f47(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_resize */
extern void T190f46(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].aliased_resized_area */
extern T0* T277f2(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].key_storage_item */
extern T0* T190f28(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_item */
extern T0* T190f18(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_item */
extern T6 T190f26(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_resize */
extern void T190f45(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_capacity */
extern T6 T190f19(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_put */
extern void T190f41(T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].force */
extern void T277f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_NAMESPACE].fill_with */
extern void T278f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_NAMESPACE].extend */
extern void T278f8(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].search_position */
extern void T190f40(T0* C, T0* a1);
/* detachable KL_EQUALITY_TESTER [XM_NAMESPACE].test */
extern T1 T275f1(T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_NAMESPACE].key_equality_tester */
extern T0* T190f25(T0* C);
/* XM_NAMESPACE.same_prefix */
extern T1 T191f5(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].item */
extern T0* T190f17(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].has */
extern T1 T190f30(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T187f32(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T187f32p1(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve_default */
extern T0* T272f3(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_pseudo_prefix */
extern unsigned char ge1724os8724;
extern T0* ge1724ov8724;
extern T0* T272f7(T0* C);
/* XM_NAMESPACE_RESOLVER.string_ */
extern T0* T187f14(T0* C);
/* XM_NAMESPACE_RESOLVER.on_delayed_attributes */
extern void T187f39(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_remove */
extern void T187f43(T0* C);
/* DS_LINKED_QUEUE [STRING_8].remove */
extern void T274f8(T0* C);
/* DS_LINKED_QUEUE [STRING_8].wipe_out */
extern void T274f9(T0* C);
/* XM_NAMESPACE_RESOLVER.unprefixed_attribute_namespace */
extern T0* T187f19(T0* C);
/* XM_NAMESPACE_RESOLVER.default_namespace */
extern unsigned char ge1691os7712;
extern T0* ge1691ov7712;
extern T0* T187f24(T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns_namespace */
extern unsigned char ge1691os7720;
extern T0* ge1691ov7720;
extern T0* T187f18(T0* C);
/* XM_NAMESPACE_RESOLVER.is_xmlns */
extern T1 T187f9(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.same_string */
extern T1 T187f22(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.string_equality_tester */
extern T0* T187f25(T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns */
extern unsigned char ge1691os7713;
extern T0* ge1691ov7713;
extern T0* T187f21(T0* C);
/* XM_NAMESPACE_RESOLVER.xml_prefix_namespace */
extern unsigned char ge1691os7719;
extern T0* ge1691ov7719;
extern T0* T187f17(T0* C);
/* XM_NAMESPACE_RESOLVER.is_xml */
extern T1 T187f16(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.xml_prefix */
extern unsigned char ge1691os7714;
extern T0* ge1691ov7714;
extern T0* T187f23(T0* C);
/* DS_LINKED_QUEUE [STRING_8].item */
extern T0* T274f5(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_is_empty */
extern T1 T187f12(T0* C);
/* DS_LINKED_QUEUE [STRING_8].is_empty */
extern T1 T274f4(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve */
extern T0* T272f2(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].back */
extern void T376f11(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_back */
extern void T375f18(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].add_traversing_cursor */
extern void T375f19(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_next_cursor */
extern void T376f13(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_traversing_cursor */
extern void T375f20(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set */
extern void T376f14(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].go_before */
extern void T376f10(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_go_before */
extern void T375f17(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_before */
extern void T376f15(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_off */
extern T1 T375f7(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].off */
extern T1 T376f7(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].item */
extern T0* T83f22(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_item */
extern T0* T83f25(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].has */
extern T1 T83f21(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].item */
extern T0* T376f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].finish */
extern void T376f9(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_finish */
extern void T375f16(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_namespace */
extern unsigned char ge1724os8725;
extern T0* ge1724ov8725;
extern T0* T272f6(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.has */
extern T1 T272f5(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.has_prefix */
extern T1 T187f10(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_start_tag_finish */
extern void T147f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T103f15(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T103f15p1(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag_finish */
extern void T100f20(T0* C);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T187f33(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.pop */
extern void T272f11(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_last */
extern void T375f9(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].set_last_cell */
extern void T375f14(T0* C, T0* a1);
/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].forget_right */
extern void T500f7(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_last_cursors_after */
extern void T375f13(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_after */
extern void T376f12(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].wipe_out */
extern void T375f12(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_all_cursors_after */
extern void T375f15(T0* C);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T187f33p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_NULL.on_end_tag */
extern void T147f8(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T103f16(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T103f16p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_end_tag */
extern void T100f21(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.parent_element */
extern T0* T102f15(T0* C);
extern T1 T102f15ot1(T0* a1, T0** a2);
/* XM_ELEMENT.is_root_node */
extern T1 T102f16(T0* C);
/* XM_DOCUMENT.is_root_node */
extern T1 T101f8(T0* C);
/* XM_DOCUMENT.parent */
extern T0* T101f9(T0* C);
/* XM_NAMESPACE_RESOLVER.on_error */
extern void T187f36(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_error */
extern void T147f11(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T103f17(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T103f17p1(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_error */
extern void T100f22(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_attribute */
extern void T187f35(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add */
extern void T272f14(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force_new */
extern void T83f54(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].last */
extern T0* T375f5(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.shallow_has */
extern T1 T272f4(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.attributes_force */
extern void T187f40(T0* C, T0* a1, T0* a2, T0* a3);
/* DS_LINKED_QUEUE [STRING_8].force */
extern void T274f7(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add_default */
extern void T272f13(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_attribute */
extern void T147f10(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T103f18(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T103f18p1(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_CALLBACKS_TO_TREE_FILTER.on_attribute */
extern void T100f23(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_ATTRIBUTE.make_last */
extern T0* T219c5(T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER.on_xml_declaration */
extern void T187f44(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_CALLBACKS_NULL.on_xml_declaration */
extern void T147f12(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_STOP_ON_ERROR_FILTER.on_xml_declaration */
extern void T103f19(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_xml_declaration */
extern void T100f25(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_NAMESPACE_RESOLVER.set_next */
extern void T187f41(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.set_next */
extern void T103f8(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.set_next */
extern void T100f13(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_start */
extern void T83f55(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].add_traversing_cursor */
extern void T83f64(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].remove_traversing_cursor */
extern void T83f63(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_off */
extern T1 T83f35(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].off */
extern T1 T64f9(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].is_empty */
extern T1 T83f34(T0* C);
/* GEANT_ARGUMENT_VARIABLES.cursor_start */
extern void T34f70(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.add_traversing_cursor */
extern void T34f73(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.remove_traversing_cursor */
extern void T34f72(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_off */
extern T1 T34f40(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.is_empty */
extern T1 T34f39(T0* C);
/* GEANT_VARIABLES.cursor_start */
extern void T29f71(T0* C, T0* a1);
/* GEANT_VARIABLES.add_traversing_cursor */
extern void T29f74(T0* C, T0* a1);
/* GEANT_VARIABLES.remove_traversing_cursor */
extern void T29f73(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_off */
extern T1 T29f40(T0* C, T0* a1);
/* GEANT_VARIABLES.is_empty */
extern T1 T29f39(T0* C);
/* GEANT_PROJECT_VARIABLES.cursor_start */
extern void T25f82(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.add_traversing_cursor */
extern void T25f85(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.remove_traversing_cursor */
extern void T25f84(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_off */
extern T1 T25f52(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.is_empty */
extern T1 T25f51(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_forth */
extern void T83f56(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_forth */
extern void T34f71(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_forth */
extern void T29f72(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_forth */
extern void T25f83(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.reset */
extern void T72f40(T0* C);
/* AP_STRING_OPTION.reset */
extern void T37f28(T0* C);
/* AP_FLAG.reset */
extern void T35f22(T0* C);
/* AP_DISPLAY_HELP_FLAG.record_occurrence */
extern void T72f41(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.display_help */
extern void T72f42(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.exceptions */
extern T0* T72f15(T0* C);
/* AP_ERROR_HANDLER.report_info_message */
extern void T45f11(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.full_help_text */
extern T0* T72f14(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.option_help_text */
extern T0* T72f23(T0* C, T0* a1, T6 a2);
/* DS_QUICK_SORTER [AP_OPTION].sort */
extern void T382f3(T0* C, T0* a1);
/* DS_QUICK_SORTER [AP_OPTION].sort_with_comparator */
extern void T382f4(T0* C, T0* a1, T0* a2);
/* DS_QUICK_SORTER [AP_OPTION].subsort_with_comparator */
extern void T382f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* ARRAY [INTEGER_32].force */
extern void T225f15(T0* C, T6 a1, T6 a2);
/* ARRAY [INTEGER_32].capacity */
extern T6 T225f7(T0* C);
/* ARRAY [INTEGER_32].set_area */
extern void T225f16(T0* C, T0* a1);
/* ARRAY [INTEGER_32].additional_space */
extern T6 T225f6(T0* C);
/* ARRAY [INTEGER_32].empty_area */
extern T1 T225f5(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].swap */
extern void T73f28(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [AP_OPTION].replace */
extern void T73f27(T0* C, T0* a1, T6 a2);
/* AP_OPTION_COMPARATOR.less_than */
extern T1 T381f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.three_way_comparison */
extern T6 T75f14(T0* C, T0* a1, T0* a2);
/* AP_OPTION_COMPARATOR.string_ */
extern T0* T381f2(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].item */
extern T0* T73f16(T0* C, T6 a1);
/* ST_WORD_WRAPPER.wrapped_string */
extern T0* T384f5(T0* C, T0* a1);
/* ST_WORD_WRAPPER.canonify_whitespace */
extern void T384f12(T0* C, T0* a1);
/* UC_UTF8_STRING.put */
extern void T227f88(T0* C, T2 a1, T6 a2);
/* ST_WORD_WRAPPER.is_space */
extern T1 T384f8(T0* C, T2 a1);
/* ST_WORD_WRAPPER.string_ */
extern T0* T384f4(T0* C);
/* ST_WORD_WRAPPER.set_new_line_indentation */
extern void T384f10(T0* C, T6 a1);
/* AP_DISPLAY_HELP_FLAG.wrapper */
extern unsigned char ge104os5505;
extern T0* ge104ov5505;
extern T0* T72f18(T0* C);
/* ST_WORD_WRAPPER.set_maximum_text_width */
extern void T384f11(T0* C, T6 a1);
/* ST_WORD_WRAPPER.make */
extern T0* T384c9(void);
/* AP_DISPLAY_HELP_FLAG.full_usage_instruction */
extern T0* T72f16(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.alternative_usage_instruction */
extern T0* T72f25(T0* C, T0* a1, T0* a2);
/* AP_DISPLAY_HELP_FLAG.arguments */
extern T0* T72f29(T0* C);
/* AP_DISPLAY_HELP_FLAG.file_system */
extern T0* T72f28(T0* C);
/* AP_DISPLAY_HELP_FLAG.unix_file_system */
extern T0* T72f34(T0* C);
/* AP_DISPLAY_HELP_FLAG.windows_file_system */
extern T0* T72f33(T0* C);
/* AP_DISPLAY_HELP_FLAG.operating_system */
extern T0* T72f32(T0* C);
/* AP_DISPLAY_HELP_FLAG.usage_instruction */
extern T0* T72f24(T0* C, T0* a1);
/* DS_QUICK_SORTER [AP_OPTION].make */
extern T0* T382c2(T0* a1);
/* AP_OPTION_COMPARATOR.default_create */
extern T0* T381c3(void);
/* AP_STRING_OPTION.record_occurrence */
extern void T37f30(T0* C, T0* a1);
/* AP_FLAG.record_occurrence */
extern void T35f24(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.force_last */
extern void T34f68(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.force_last */
extern void T29f70(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.force_last */
extern void T25f95(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.resize */
extern void T25f67(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.clashes_resize */
extern void T25f75(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.special_integer_ */
extern T0* T25f37(T0* C);
/* GEANT_PROJECT_VARIABLES.key_storage_resize */
extern void T25f74(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.item_storage_resize */
extern void T25f73(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.slots_resize */
extern void T25f72(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.new_capacity */
extern T6 T25f32(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.search */
extern void T34f69(T0* C, T0* a1);
/* GEANT_VARIABLES.search */
extern void T29f69(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.search */
extern void T25f81(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.start */
extern void T34f77(T0* C);
/* GEANT_VARIABLES.start */
extern void T29f77(T0* C);
/* GEANT_PROJECT_VARIABLES.start */
extern void T25f97(T0* C);
/* GEANT_ARGUMENT_VARIABLES.forth */
extern void T34f78(T0* C);
/* GEANT_VARIABLES.forth */
extern void T29f78(T0* C);
/* GEANT_PROJECT_VARIABLES.forth */
extern void T25f98(T0* C);
/* GEANT_ARGUMENT_VARIABLES.set_variable_value */
extern void T34f75(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.set_variable_value */
extern void T29f47(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.set_variable_value */
extern void T25f59(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.force */
extern void T25f62(T0* C, T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.replace */
extern void T34f76(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.replace */
extern void T29f76(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.replace */
extern void T25f96(T0* C, T0* a1, T0* a2);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T628f3(T0* C, T6 a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T626f2(T0* C, T6 a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T624f3(T0* C, T6 a1);
/* GEANT_REPLACE_TASK.is_executable */
extern T1 T350f18(T0* C);
/* GEANT_REPLACE_COMMAND.is_executable */
extern T1 T478f14(T0* C);
/* KL_BOOLEAN_ROUTINES.nxor */
extern T1 T561f1(T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.is_fileset_to_directory_executable */
extern T1 T478f17(T0* C);
/* GEANT_REPLACE_COMMAND.boolean_ */
extern unsigned char ge123os5911;
extern T0* ge123ov5911;
extern T0* T478f15(T0* C);
/* KL_BOOLEAN_ROUTINES.default_create */
extern T0* T561c2(void);
/* GEANT_INPUT_TASK.is_executable */
extern T1 T348f20(T0* C);
/* GEANT_INPUT_COMMAND.is_executable */
extern T1 T475f11(T0* C);
/* GEANT_AVAILABLE_TASK.is_executable */
extern T1 T346f6(T0* C);
/* GEANT_AVAILABLE_COMMAND.is_executable */
extern T1 T472f13(T0* C);
/* GEANT_AVAILABLE_COMMAND.validate_condition */
extern void T472f20(T0* C, T1 a1, T0* a2, T0* a3);
/* GEANT_AVAILABLE_COMMAND.validation_messages */
extern T0* T472f16(T0* C);
/* DS_CELL [BOOLEAN].put */
extern void T559f3(T0* C, T1 a1);
/* DS_CELL [BOOLEAN].make */
extern T0* T559c2(T1 a1);
/* GEANT_PRECURSOR_TASK.is_executable */
extern T1 T344f17(T0* C);
/* GEANT_PRECURSOR_COMMAND.is_executable */
extern T1 T469f7(T0* C);
/* GEANT_EXIT_TASK.is_executable */
extern T1 T342f10(T0* C);
/* GEANT_EXIT_COMMAND.is_executable */
extern T1 T466f6(T0* C);
/* GEANT_OUTOFDATE_TASK.is_executable */
extern T1 T340f15(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_executable */
extern T1 T463f11(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_fileset_executable */
extern T1 T463f13(T0* C);
/* GEANT_XSLT_TASK.is_executable */
extern T1 T338f29(T0* C);
/* GEANT_XSLT_COMMAND.is_executable */
extern T1 T459f17(T0* C);
/* GEANT_SETENV_TASK.is_executable */
extern T1 T336f11(T0* C);
/* GEANT_SETENV_COMMAND.is_executable */
extern T1 T455f7(T0* C);
/* GEANT_MOVE_TASK.is_executable */
extern T1 T334f13(T0* C);
/* GEANT_MOVE_COMMAND.is_executable */
extern T1 T452f9(T0* C);
/* GEANT_MOVE_COMMAND.is_fileset_to_directory_executable */
extern T1 T452f12(T0* C);
/* GEANT_COPY_TASK.is_executable */
extern T1 T332f19(T0* C);
/* GEANT_COPY_COMMAND.is_executable */
extern T1 T449f10(T0* C);
/* GEANT_COPY_COMMAND.is_fileset_to_directory_executable */
extern T1 T449f14(T0* C);
/* GEANT_COPY_COMMAND.boolean_ */
extern T0* T449f11(T0* C);
/* GEANT_DELETE_TASK.is_executable */
extern T1 T330f13(T0* C);
/* GEANT_DELETE_COMMAND.is_executable */
extern T1 T445f9(T0* C);
/* GEANT_DELETE_COMMAND.boolean_ */
extern T0* T445f10(T0* C);
/* GEANT_MKDIR_TASK.is_executable */
extern T1 T328f6(T0* C);
/* GEANT_MKDIR_COMMAND.is_executable */
extern T1 T441f10(T0* C);
/* GEANT_MKDIR_COMMAND.validate_condition */
extern void T441f17(T0* C, T1 a1, T0* a2, T0* a3);
/* GEANT_MKDIR_COMMAND.validation_messages */
extern T0* T441f12(T0* C);
/* GEANT_ECHO_TASK.is_executable */
extern T1 T326f6(T0* C);
/* GEANT_ECHO_COMMAND.is_executable */
extern T1 T438f9(T0* C);
/* GEANT_ECHO_COMMAND.validate_condition */
extern void T438f17(T0* C, T1 a1, T0* a2, T0* a3);
/* GEANT_ECHO_COMMAND.validation_messages */
extern T0* T438f11(T0* C);
/* GEANT_GEANT_TASK.is_executable */
extern T1 T324f25(T0* C);
/* GEANT_GEANT_COMMAND.is_executable */
extern T1 T434f13(T0* C);
/* GEANT_GEANT_COMMAND.is_target_executable */
extern T1 T434f15(T0* C);
/* GEANT_GETEST_TASK.is_executable */
extern T1 T322f27(T0* C);
/* GEANT_GETEST_COMMAND.is_executable */
extern T1 T431f16(T0* C);
/* GEANT_GEPP_TASK.is_executable */
extern T1 T320f22(T0* C);
/* GEANT_GEPP_COMMAND.is_executable */
extern T1 T428f12(T0* C);
/* GEANT_GEPP_COMMAND.is_fileset_executable */
extern T1 T428f14(T0* C);
/* GEANT_GEYACC_TASK.is_executable */
extern T1 T318f22(T0* C);
/* GEANT_GEYACC_COMMAND.is_executable */
extern T1 T425f12(T0* C);
/* GEANT_GELEX_TASK.is_executable */
extern T1 T316f25(T0* C);
/* GEANT_GELEX_COMMAND.is_executable */
extern T1 T422f16(T0* C);
/* GEANT_GEXACE_TASK.is_executable */
extern T1 T314f23(T0* C);
/* GEANT_GEXACE_COMMAND.is_executable */
extern T1 T419f13(T0* C);
/* GEANT_GEXACE_COMMAND.boolean_ */
extern T0* T419f14(T0* C);
/* GEANT_UNSET_TASK.is_executable */
extern T1 T312f10(T0* C);
/* GEANT_UNSET_COMMAND.is_executable */
extern T1 T415f6(T0* C);
/* GEANT_SET_TASK.is_executable */
extern T1 T310f11(T0* C);
/* GEANT_SET_COMMAND.is_executable */
extern T1 T412f7(T0* C);
/* GEANT_LCC_TASK.is_executable */
extern T1 T308f11(T0* C);
/* GEANT_LCC_COMMAND.is_executable */
extern T1 T409f7(T0* C);
/* GEANT_EXEC_TASK.is_executable */
extern T1 T306f7(T0* C);
/* GEANT_EXEC_COMMAND.is_executable */
extern T1 T401f9(T0* C);
/* GEANT_EXEC_COMMAND.validate_condition */
extern void T401f17(T0* C, T1 a1, T0* a2, T0* a3);
/* GEANT_EXEC_COMMAND.validation_messages */
extern T0* T401f12(T0* C);
/* GEANT_ISE_TASK.is_executable */
extern T1 T304f23(T0* C);
/* GEANT_ISE_COMMAND.is_executable */
extern T1 T397f11(T0* C);
/* GEANT_ISE_COMMAND.is_cleanable */
extern T1 T397f15(T0* C);
/* GEANT_GEC_TASK.is_executable */
extern T1 T297f25(T0* C);
/* GEANT_GEC_COMMAND.is_executable */
extern T1 T393f15(T0* C);
/* GEANT_REPLACE_TASK.is_enabled */
extern T1 T350f19(T0* C);
/* GEANT_REPLACE_TASK.unless_attribute_name */
extern T0* T350f23(T0* C);
/* GEANT_REPLACE_TASK.if_attribute_name */
extern T0* T350f22(T0* C);
/* GEANT_INPUT_TASK.is_enabled */
extern T1 T348f21(T0* C);
/* GEANT_INPUT_TASK.unless_attribute_name */
extern T0* T348f25(T0* C);
/* GEANT_INPUT_TASK.if_attribute_name */
extern T0* T348f24(T0* C);
/* GEANT_AVAILABLE_TASK.is_enabled */
extern T1 T346f7(T0* C);
/* GEANT_AVAILABLE_TASK.unless_attribute_name */
extern T0* T346f13(T0* C);
/* GEANT_AVAILABLE_TASK.has_attribute */
extern T1 T346f12(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.if_attribute_name */
extern T0* T346f11(T0* C);
/* GEANT_PRECURSOR_TASK.is_enabled */
extern T1 T344f18(T0* C);
/* GEANT_PRECURSOR_TASK.unless_attribute_name */
extern T0* T344f22(T0* C);
/* GEANT_PRECURSOR_TASK.if_attribute_name */
extern T0* T344f21(T0* C);
/* GEANT_EXIT_TASK.is_enabled */
extern T1 T342f11(T0* C);
/* GEANT_EXIT_TASK.unless_attribute_name */
extern T0* T342f15(T0* C);
/* GEANT_EXIT_TASK.if_attribute_name */
extern T0* T342f14(T0* C);
/* GEANT_OUTOFDATE_TASK.is_enabled */
extern T1 T340f16(T0* C);
/* GEANT_OUTOFDATE_TASK.unless_attribute_name */
extern T0* T340f20(T0* C);
/* GEANT_OUTOFDATE_TASK.if_attribute_name */
extern T0* T340f19(T0* C);
/* GEANT_XSLT_TASK.is_enabled */
extern T1 T338f30(T0* C);
/* GEANT_XSLT_TASK.unless_attribute_name */
extern T0* T338f34(T0* C);
/* GEANT_XSLT_TASK.if_attribute_name */
extern T0* T338f33(T0* C);
/* GEANT_SETENV_TASK.is_enabled */
extern T1 T336f12(T0* C);
/* GEANT_SETENV_TASK.unless_attribute_name */
extern T0* T336f16(T0* C);
/* GEANT_SETENV_TASK.if_attribute_name */
extern T0* T336f15(T0* C);
/* GEANT_MOVE_TASK.is_enabled */
extern T1 T334f14(T0* C);
/* GEANT_MOVE_TASK.unless_attribute_name */
extern T0* T334f18(T0* C);
/* GEANT_MOVE_TASK.if_attribute_name */
extern T0* T334f17(T0* C);
/* GEANT_COPY_TASK.is_enabled */
extern T1 T332f20(T0* C);
/* GEANT_COPY_TASK.unless_attribute_name */
extern T0* T332f24(T0* C);
/* GEANT_COPY_TASK.if_attribute_name */
extern T0* T332f23(T0* C);
/* GEANT_DELETE_TASK.is_enabled */
extern T1 T330f14(T0* C);
/* GEANT_DELETE_TASK.unless_attribute_name */
extern T0* T330f18(T0* C);
/* GEANT_DELETE_TASK.if_attribute_name */
extern T0* T330f17(T0* C);
/* GEANT_MKDIR_TASK.is_enabled */
extern T1 T328f7(T0* C);
/* GEANT_MKDIR_TASK.unless_attribute_name */
extern T0* T328f13(T0* C);
/* GEANT_MKDIR_TASK.has_attribute */
extern T1 T328f12(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.if_attribute_name */
extern T0* T328f11(T0* C);
/* GEANT_ECHO_TASK.is_enabled */
extern T1 T326f7(T0* C);
/* GEANT_ECHO_TASK.unless_attribute_name */
extern T0* T326f13(T0* C);
/* GEANT_ECHO_TASK.has_attribute */
extern T1 T326f12(T0* C, T0* a1);
/* GEANT_ECHO_TASK.if_attribute_name */
extern T0* T326f11(T0* C);
/* GEANT_GEANT_TASK.is_enabled */
extern T1 T324f26(T0* C);
/* GEANT_GEANT_TASK.unless_attribute_name */
extern T0* T324f30(T0* C);
/* GEANT_GEANT_TASK.if_attribute_name */
extern T0* T324f29(T0* C);
/* GEANT_GETEST_TASK.is_enabled */
extern T1 T322f28(T0* C);
/* GEANT_GETEST_TASK.unless_attribute_name */
extern T0* T322f32(T0* C);
/* GEANT_GETEST_TASK.if_attribute_name */
extern T0* T322f31(T0* C);
/* GEANT_GEPP_TASK.is_enabled */
extern T1 T320f23(T0* C);
/* GEANT_GEPP_TASK.unless_attribute_name */
extern T0* T320f27(T0* C);
/* GEANT_GEPP_TASK.if_attribute_name */
extern T0* T320f26(T0* C);
/* GEANT_GEYACC_TASK.is_enabled */
extern T1 T318f23(T0* C);
/* GEANT_GEYACC_TASK.unless_attribute_name */
extern T0* T318f27(T0* C);
/* GEANT_GEYACC_TASK.if_attribute_name */
extern T0* T318f26(T0* C);
/* GEANT_GELEX_TASK.is_enabled */
extern T1 T316f26(T0* C);
/* GEANT_GELEX_TASK.unless_attribute_name */
extern T0* T316f30(T0* C);
/* GEANT_GELEX_TASK.if_attribute_name */
extern T0* T316f29(T0* C);
/* GEANT_GEXACE_TASK.is_enabled */
extern T1 T314f24(T0* C);
/* GEANT_GEXACE_TASK.unless_attribute_name */
extern T0* T314f28(T0* C);
/* GEANT_GEXACE_TASK.if_attribute_name */
extern T0* T314f27(T0* C);
/* GEANT_UNSET_TASK.is_enabled */
extern T1 T312f11(T0* C);
/* GEANT_UNSET_TASK.unless_attribute_name */
extern T0* T312f15(T0* C);
/* GEANT_UNSET_TASK.if_attribute_name */
extern T0* T312f14(T0* C);
/* GEANT_SET_TASK.is_enabled */
extern T1 T310f12(T0* C);
/* GEANT_SET_TASK.unless_attribute_name */
extern T0* T310f16(T0* C);
/* GEANT_SET_TASK.if_attribute_name */
extern T0* T310f15(T0* C);
/* GEANT_LCC_TASK.is_enabled */
extern T1 T308f12(T0* C);
/* GEANT_LCC_TASK.unless_attribute_name */
extern T0* T308f16(T0* C);
/* GEANT_LCC_TASK.if_attribute_name */
extern T0* T308f15(T0* C);
/* GEANT_EXEC_TASK.is_enabled */
extern T1 T306f8(T0* C);
/* GEANT_EXEC_TASK.unless_attribute_name */
extern T0* T306f14(T0* C);
/* GEANT_EXEC_TASK.has_attribute */
extern T1 T306f13(T0* C, T0* a1);
/* GEANT_EXEC_TASK.if_attribute_name */
extern T0* T306f12(T0* C);
/* GEANT_ISE_TASK.is_enabled */
extern T1 T304f24(T0* C);
/* GEANT_ISE_TASK.unless_attribute_name */
extern T0* T304f28(T0* C);
/* GEANT_ISE_TASK.if_attribute_name */
extern T0* T304f27(T0* C);
/* GEANT_GEC_TASK.is_enabled */
extern T1 T297f26(T0* C);
/* GEANT_GEC_TASK.unless_attribute_name */
extern T0* T297f30(T0* C);
/* GEANT_GEC_TASK.if_attribute_name */
extern T0* T297f29(T0* C);
/* GEANT_REPLACE_TASK.is_exit_command */
extern T1 T350f20(T0* C);
/* GEANT_REPLACE_COMMAND.is_exit_command */
extern T1 T478f13(T0* C);
/* GEANT_INPUT_TASK.is_exit_command */
extern T1 T348f22(T0* C);
/* GEANT_INPUT_COMMAND.is_exit_command */
extern T1 T475f10(T0* C);
/* GEANT_AVAILABLE_TASK.is_exit_command */
extern T1 T346f8(T0* C);
/* GEANT_AVAILABLE_COMMAND.is_exit_command */
extern T1 T472f14(T0* C);
/* GEANT_PRECURSOR_TASK.is_exit_command */
extern T1 T344f19(T0* C);
/* GEANT_PRECURSOR_COMMAND.is_exit_command */
extern T1 T469f6(T0* C);
/* GEANT_EXIT_TASK.is_exit_command */
extern T1 T342f12(T0* C);
/* GEANT_OUTOFDATE_TASK.is_exit_command */
extern T1 T340f17(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_exit_command */
extern T1 T463f16(T0* C);
/* GEANT_XSLT_TASK.is_exit_command */
extern T1 T338f31(T0* C);
/* GEANT_XSLT_COMMAND.is_exit_command */
extern T1 T459f18(T0* C);
/* GEANT_SETENV_TASK.is_exit_command */
extern T1 T336f13(T0* C);
/* GEANT_SETENV_COMMAND.is_exit_command */
extern T1 T455f6(T0* C);
/* GEANT_MOVE_TASK.is_exit_command */
extern T1 T334f15(T0* C);
/* GEANT_MOVE_COMMAND.is_exit_command */
extern T1 T452f8(T0* C);
/* GEANT_COPY_TASK.is_exit_command */
extern T1 T332f21(T0* C);
/* GEANT_COPY_COMMAND.is_exit_command */
extern T1 T449f9(T0* C);
/* GEANT_DELETE_TASK.is_exit_command */
extern T1 T330f15(T0* C);
/* GEANT_DELETE_COMMAND.is_exit_command */
extern T1 T445f8(T0* C);
/* GEANT_MKDIR_TASK.is_exit_command */
extern T1 T328f8(T0* C);
/* GEANT_MKDIR_COMMAND.is_exit_command */
extern T1 T441f11(T0* C);
/* GEANT_ECHO_TASK.is_exit_command */
extern T1 T326f8(T0* C);
/* GEANT_ECHO_COMMAND.is_exit_command */
extern T1 T438f10(T0* C);
/* GEANT_GEANT_TASK.is_exit_command */
extern T1 T324f27(T0* C);
/* GEANT_GEANT_COMMAND.is_exit_command */
extern T1 T434f12(T0* C);
/* GEANT_GETEST_TASK.is_exit_command */
extern T1 T322f29(T0* C);
/* GEANT_GETEST_COMMAND.is_exit_command */
extern T1 T431f15(T0* C);
/* GEANT_GEPP_TASK.is_exit_command */
extern T1 T320f24(T0* C);
/* GEANT_GEPP_COMMAND.is_exit_command */
extern T1 T428f11(T0* C);
/* GEANT_GEYACC_TASK.is_exit_command */
extern T1 T318f24(T0* C);
/* GEANT_GEYACC_COMMAND.is_exit_command */
extern T1 T425f11(T0* C);
/* GEANT_GELEX_TASK.is_exit_command */
extern T1 T316f27(T0* C);
/* GEANT_GELEX_COMMAND.is_exit_command */
extern T1 T422f15(T0* C);
/* GEANT_GEXACE_TASK.is_exit_command */
extern T1 T314f25(T0* C);
/* GEANT_GEXACE_COMMAND.is_exit_command */
extern T1 T419f12(T0* C);
/* GEANT_UNSET_TASK.is_exit_command */
extern T1 T312f12(T0* C);
/* GEANT_UNSET_COMMAND.is_exit_command */
extern T1 T415f5(T0* C);
/* GEANT_SET_TASK.is_exit_command */
extern T1 T310f13(T0* C);
/* GEANT_SET_COMMAND.is_exit_command */
extern T1 T412f6(T0* C);
/* GEANT_LCC_TASK.is_exit_command */
extern T1 T308f13(T0* C);
/* GEANT_LCC_COMMAND.is_exit_command */
extern T1 T409f6(T0* C);
/* GEANT_EXEC_TASK.is_exit_command */
extern T1 T306f9(T0* C);
/* GEANT_EXEC_COMMAND.is_exit_command */
extern T1 T401f10(T0* C);
/* GEANT_ISE_TASK.is_exit_command */
extern T1 T304f25(T0* C);
/* GEANT_ISE_COMMAND.is_exit_command */
extern T1 T397f12(T0* C);
/* GEANT_GEC_TASK.is_exit_command */
extern T1 T297f27(T0* C);
/* GEANT_GEC_COMMAND.is_exit_command */
extern T1 T393f14(T0* C);
/* GEANT_REPLACE_TASK.exit_code */
extern T6 T350f21(T0* C);
/* GEANT_INPUT_TASK.exit_code */
extern T6 T348f23(T0* C);
/* GEANT_AVAILABLE_TASK.exit_code */
extern T6 T346f9(T0* C);
/* GEANT_PRECURSOR_TASK.exit_code */
extern T6 T344f20(T0* C);
/* GEANT_EXIT_TASK.exit_code */
extern T6 T342f13(T0* C);
/* GEANT_OUTOFDATE_TASK.exit_code */
extern T6 T340f18(T0* C);
/* GEANT_XSLT_TASK.exit_code */
extern T6 T338f32(T0* C);
/* GEANT_SETENV_TASK.exit_code */
extern T6 T336f14(T0* C);
/* GEANT_MOVE_TASK.exit_code */
extern T6 T334f16(T0* C);
/* GEANT_COPY_TASK.exit_code */
extern T6 T332f22(T0* C);
/* GEANT_DELETE_TASK.exit_code */
extern T6 T330f16(T0* C);
/* GEANT_MKDIR_TASK.exit_code */
extern T6 T328f9(T0* C);
/* GEANT_ECHO_TASK.exit_code */
extern T6 T326f9(T0* C);
/* GEANT_GEANT_TASK.exit_code */
extern T6 T324f28(T0* C);
/* GEANT_GETEST_TASK.exit_code */
extern T6 T322f30(T0* C);
/* GEANT_GEPP_TASK.exit_code */
extern T6 T320f25(T0* C);
/* GEANT_GEYACC_TASK.exit_code */
extern T6 T318f25(T0* C);
/* GEANT_GELEX_TASK.exit_code */
extern T6 T316f28(T0* C);
/* GEANT_GEXACE_TASK.exit_code */
extern T6 T314f26(T0* C);
/* GEANT_UNSET_TASK.exit_code */
extern T6 T312f13(T0* C);
/* GEANT_SET_TASK.exit_code */
extern T6 T310f14(T0* C);
/* GEANT_LCC_TASK.exit_code */
extern T6 T308f14(T0* C);
/* GEANT_EXEC_TASK.exit_code */
extern T6 T306f10(T0* C);
/* GEANT_ISE_TASK.exit_code */
extern T6 T304f26(T0* C);
/* GEANT_GEC_TASK.exit_code */
extern T6 T297f28(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.error_position */
extern T0* T186f58(T0* C);
/* XM_DEFAULT_POSITION.make */
extern T0* T143c5(T0* a1, T6 a2, T6 a3, T6 a4);
/* XM_EIFFEL_SCANNER_DTD.error_position */
extern T0* T184f56(T0* C);
/* XM_EIFFEL_ENTITY_DEF.error_position */
extern T0* T183f56(T0* C);
/* XM_EIFFEL_SCANNER.error_position */
extern T0* T142f66(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.end_of_file */
extern T1 T186f60(T0* C);
/* XM_EIFFEL_SCANNER_DTD.end_of_file */
extern T1 T184f63(T0* C);
/* XM_EIFFEL_ENTITY_DEF.end_of_file */
extern T1 T183f58(T0* C);
/* XM_EIFFEL_SCANNER.end_of_file */
extern T1 T142f67(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_applicable_encoding */
extern T1 T186f61(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_applicable_encoding */
extern T1 T228f16(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_valid_encoding */
extern T1 T228f9(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.is_applicable_encoding */
extern T1 T184f49(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.is_applicable_encoding */
extern T1 T183f59(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.is_applicable_encoding */
extern T1 T142f68(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.start_condition */
extern T6 T186f62(T0* C);
/* XM_EIFFEL_SCANNER_DTD.start_condition */
extern T6 T184f51(T0* C);
/* XM_EIFFEL_ENTITY_DEF.start_condition */
extern T6 T183f60(T0* C);
/* XM_EIFFEL_SCANNER.start_condition */
extern T6 T142f44(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_item */
extern T0* T83f23(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_item */
extern T0* T34f35(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.item_storage_item */
extern T0* T34f38(T0* C, T6 a1);
/* GEANT_VARIABLES.cursor_item */
extern T0* T29f37(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_item */
extern T0* T25f49(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_key */
extern T0* T83f24(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_key */
extern T0* T34f36(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_key */
extern T0* T29f38(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_key */
extern T0* T25f50(T0* C, T0* a1);
/* UC_UTF8_STRING.character_32_item */
extern T3 T227f38(T0* C, T6 a1);
/* IMMUTABLE_STRING_32.item */
extern T3 T85f7(T0* C, T6 a1);
/* STRING_32.item */
extern T3 T18f10(T0* C, T6 a1);
/* STRING_8.character_32_item */
extern T3 T17f21(T0* C, T6 a1);
/* UC_UTF8_STRING.substring */
extern T0* T227f39(T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.make_from_substring */
extern T0* T227c66(T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.make_from_substring_general */
extern void T227f76(T0* C, T0* a1, T6 a2, T6 a3);
/* IMMUTABLE_STRING_32.substring */
extern T0* T85f8(T0* C, T6 a1, T6 a2);
/* IMMUTABLE_STRING_32.empty_string */
extern unsigned char ge1490os5791;
extern T0* ge1490ov5791;
extern T0* T85f9(T0* C);
/* STRING_32.substring */
extern T0* T18f11(T0* C, T6 a1, T6 a2);
/* STRING_32.new_string */
extern T0* T18f12(T0* C, T6 a1);
/* STRING_8.substring */
extern T0* T17f11(T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.code */
extern T10 T227f34(T0* C, T6 a1);
/* IMMUTABLE_STRING_32.code */
extern T10 T85f5(T0* C, T6 a1);
/* STRING_32.code */
extern T10 T18f5(T0* C, T6 a1);
/* STRING_8.code */
extern T10 T17f23(T0* C, T6 a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.default_message */
extern T0* T606f5(T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.message */
extern T0* T606f3(T0* C, T0* a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.arguments */
extern T0* T606f6(T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.string_ */
extern T0* T606f4(T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.default_message */
extern T0* T592f5(T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.message */
extern T0* T592f3(T0* C, T0* a1);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.arguments */
extern T0* T592f6(T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.string_ */
extern T0* T592f4(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.default_message */
extern T0* T591f5(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.message */
extern T0* T591f3(T0* C, T0* a1);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.arguments */
extern T0* T591f6(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.string_ */
extern T0* T591f4(T0* C);
/* LX_FULL_AND_REJECT_ERROR.default_message */
extern T0* T590f5(T0* C);
/* LX_FULL_AND_REJECT_ERROR.message */
extern T0* T590f3(T0* C, T0* a1);
/* LX_FULL_AND_REJECT_ERROR.arguments */
extern T0* T590f6(T0* C);
/* LX_FULL_AND_REJECT_ERROR.string_ */
extern T0* T590f4(T0* C);
/* LX_FULL_AND_META_ERROR.default_message */
extern T0* T589f5(T0* C);
/* LX_FULL_AND_META_ERROR.message */
extern T0* T589f3(T0* C, T0* a1);
/* LX_FULL_AND_META_ERROR.arguments */
extern T0* T589f6(T0* C);
/* LX_FULL_AND_META_ERROR.string_ */
extern T0* T589f4(T0* C);
/* LX_BAD_CHARACTER_ERROR.default_message */
extern T0* T588f5(T0* C);
/* LX_BAD_CHARACTER_ERROR.message */
extern T0* T588f3(T0* C, T0* a1);
/* LX_BAD_CHARACTER_ERROR.arguments */
extern T0* T588f6(T0* C);
/* LX_BAD_CHARACTER_ERROR.string_ */
extern T0* T588f4(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.default_message */
extern T0* T587f5(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.message */
extern T0* T587f3(T0* C, T0* a1);
/* LX_BAD_CHARACTER_CLASS_ERROR.arguments */
extern T0* T587f6(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.string_ */
extern T0* T587f4(T0* C);
/* LX_MISSING_QUOTE_ERROR.default_message */
extern T0* T586f5(T0* C);
/* LX_MISSING_QUOTE_ERROR.message */
extern T0* T586f3(T0* C, T0* a1);
/* LX_MISSING_QUOTE_ERROR.arguments */
extern T0* T586f6(T0* C);
/* LX_MISSING_QUOTE_ERROR.string_ */
extern T0* T586f4(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.default_message */
extern T0* T585f5(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.message */
extern T0* T585f3(T0* C, T0* a1);
/* LX_UNRECOGNIZED_RULE_ERROR.arguments */
extern T0* T585f6(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.string_ */
extern T0* T585f4(T0* C);
/* UT_SYNTAX_ERROR.default_message */
extern T0* T583f5(T0* C);
/* UT_SYNTAX_ERROR.message */
extern T0* T583f3(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.arguments */
extern T0* T583f6(T0* C);
/* UT_SYNTAX_ERROR.string_ */
extern T0* T583f4(T0* C);
/* UT_VERSION_NUMBER.default_message */
extern T0* T49f3(T0* C);
/* UT_VERSION_NUMBER.message */
extern T0* T49f5(T0* C, T0* a1);
/* UT_VERSION_NUMBER.arguments */
extern T0* T49f7(T0* C);
/* UT_VERSION_NUMBER.string_ */
extern T0* T49f6(T0* C);
/* AP_DISPLAY_HELP_FLAG.was_found */
extern T1 T72f10(T0* C);
/* AP_STRING_OPTION.was_found */
extern T1 T37f15(T0* C);
/* AP_FLAG.was_found */
extern T1 T35f9(T0* C);
/* AP_STRING_OPTION.occurrences */
extern T6 T37f17(T0* C);
/* AP_DISPLAY_HELP_FLAG.allows_parameter */
extern T1 T72f21(T0* C);
/* AP_STRING_OPTION.allows_parameter */
extern T1 T37f16(T0* C);
/* AP_FLAG.allows_parameter */
extern T1 T35f11(T0* C);
/* AP_DISPLAY_HELP_FLAG.needs_parameter */
extern T1 T72f9(T0* C);
/* AP_FLAG.needs_parameter */
extern T1 T35f10(T0* C);
/* AP_DISPLAY_HELP_FLAG.name */
extern T0* T72f11(T0* C);
/* AP_STRING_OPTION.name */
extern T0* T37f11(T0* C);
/* AP_FLAG.name */
extern T0* T35f14(T0* C);
/* AP_DISPLAY_HELP_FLAG.names */
extern T0* T72f22(T0* C);
/* AP_STRING_OPTION.names */
extern T0* T37f18(T0* C);
/* AP_STRING_OPTION.has_long_form */
extern T1 T37f20(T0* C);
/* AP_STRING_OPTION.names */
extern T0* T37f18p1(T0* C);
/* AP_FLAG.names */
extern T0* T35f15(T0* C);
/* AP_DISPLAY_HELP_FLAG.example */
extern T0* T72f27(T0* C);
/* AP_STRING_OPTION.example */
extern T0* T37f19(T0* C);
/* AP_FLAG.example */
extern T0* T35f16(T0* C);
/* GEANT_ARGUMENT_VARIABLES.found */
extern T1 T34f33(T0* C);
/* GEANT_VARIABLES.found */
extern T1 T29f36(T0* C);
/* GEANT_PROJECT_VARIABLES.found */
extern T1 T25f44(T0* C);
/* GEANT_ARGUMENT_VARIABLES.found_item */
extern T0* T34f41(T0* C);
/* GEANT_VARIABLES.found_item */
extern T0* T29f41(T0* C);
/* GEANT_PROJECT_VARIABLES.found_item */
extern T0* T25f53(T0* C);
/* GEANT_ARGUMENT_VARIABLES.after */
extern T1 T34f42(T0* C);
/* GEANT_ARGUMENT_VARIABLES.cursor_after */
extern T1 T34f45(T0* C, T0* a1);
/* GEANT_VARIABLES.after */
extern T1 T29f42(T0* C);
/* GEANT_VARIABLES.cursor_after */
extern T1 T29f45(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.after */
extern T1 T25f54(T0* C);
/* GEANT_PROJECT_VARIABLES.cursor_after */
extern T1 T25f57(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.key_for_iteration */
extern T0* T34f43(T0* C);
/* GEANT_VARIABLES.key_for_iteration */
extern T0* T29f43(T0* C);
/* GEANT_PROJECT_VARIABLES.key_for_iteration */
extern T0* T25f55(T0* C);
/* GEANT_ARGUMENT_VARIABLES.item_for_iteration */
extern T0* T34f44(T0* C);
/* GEANT_VARIABLES.item_for_iteration */
extern T0* T29f44(T0* C);
/* GEANT_PROJECT_VARIABLES.item_for_iteration */
extern T0* T25f56(T0* C);
/* GEANT_ARGUMENT_VARIABLES.has */
extern T1 T34f32(T0* C, T0* a1);
/* GEANT_VARIABLES.has */
extern T1 T29f32(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.has */
extern T1 T25f46(T0* C, T0* a1);
extern T0* GE_ma33(T6 c, T6 n, ...);
extern T0* GE_ma225(T6 c, T6 n, ...);
extern T0* GE_ma189(T6 c, T6 n, ...);
extern T0* GE_ma613(T6 c, T6 n, ...);
extern T0* GE_ma270(T6 c, T6 n, ...);
extern T0* GE_mt663(T0* a1);
extern T0* GE_mt679(T0* a1);
extern T0* ge133ov5541;
extern T0* ge169ov3055;
extern T0* ge223ov6930;
extern T0* ge233ov8458;
extern T0* ge154ov9926;
extern T0* ge154ov9927;
extern T0* ge156ov4207;
extern T0* ge171ov3055;
extern T0* ge177ov4251;
extern T0* ge177ov4252;
extern T0* ge162ov4519;
extern T0* ge162ov4518;
extern T0* ge174ov4251;
extern T0* ge174ov4252;
extern T0* ge1786ov5895;
extern T0* ge1786ov5894;
extern T0* ge309ov11126;
extern T0* ge160ov3055;
extern T0* ge1357ov3040;
extern T0* ge424ov10159;
extern T0* ge155ov4410;
extern T0* ge457ov9831;
extern T0* ge260ov3055;
extern T0* ge35ov8907;
extern T0* ge1793ov6343;
extern T0* ge1793ov6305;
extern T0* ge1793ov6303;
extern T0* ge1793ov6344;
extern T0* ge1793ov6316;
extern T0* ge1793ov6315;
extern T0* ge1793ov6326;
extern T0* ge1793ov6320;
extern T0* ge1793ov6319;
extern T0* ge1793ov6318;
extern T0* ge1793ov6324;
extern T0* ge1793ov6323;
extern T0* ge1793ov6325;
extern T0* ge1793ov6302;
extern T0* ge1793ov6328;
extern T0* ge1793ov6337;
extern T0* ge1796ov6035;
extern T0* ge1796ov6033;
extern T0* ge1796ov6034;
extern T0* ge1793ov6338;
extern T0* ge1793ov6339;
extern T0* ge1793ov6342;
extern T0* ge1793ov6340;
extern T0* ge1793ov6341;
extern T0* ge1793ov6335;
extern T0* ge1789ov8040;
extern T0* ge1789ov8041;
extern T0* ge1793ov6308;
extern T0* ge1793ov6331;
extern T0* ge1793ov6351;
extern T0* ge1793ov6352;
extern T0* ge1793ov6353;
extern T0* ge1793ov6346;
extern T0* ge1793ov6329;
extern T0* ge1793ov6330;
extern T0* ge1793ov6332;
extern T0* ge1793ov6336;
extern T0* ge1743ov6642;
extern T0* ge177ov4262;
extern T0* ge174ov4262;
extern T0* ge103ov2739;
extern T0* ge106ov3022;
extern T0* ge106ov3029;
extern T0* ge193ov1904;
extern T0* ge106ov3025;
extern T0* ge106ov3032;
extern T0* ge106ov3023;
extern T0* ge106ov3030;
extern T0* ge106ov3024;
extern T0* ge106ov3031;
extern T0* ge106ov3026;
extern T0* ge106ov3033;
extern T0* ge106ov3027;
extern T0* ge106ov3034;
extern T0* ge103ov2734;
extern T0* ge103ov2733;
extern T0* ge103ov2741;
extern T0* ge103ov2740;
extern T0* ge428ov11678;
extern T0* ge428ov11715;
extern T0* ge428ov11700;
extern T0* ge428ov11693;
extern T0* ge428ov11703;
extern T0* ge428ov11696;
extern T0* ge428ov11704;
extern T0* ge428ov11713;
extern T0* ge428ov11706;
extern T0* ge428ov11702;
extern T0* ge428ov11690;
extern T0* ge428ov11691;
extern T0* ge428ov11705;
extern T0* ge428ov11692;
extern T0* ge428ov11679;
extern T0* ge428ov11680;
extern T0* ge428ov11681;
extern T0* ge428ov11687;
extern T0* ge428ov11689;
extern T0* ge428ov11684;
extern T0* ge428ov11709;
extern T0* ge428ov11708;
extern T0* ge428ov11685;
extern T0* ge428ov11686;
extern T0* ge428ov11683;
extern T0* ge428ov11682;
extern T0* ge42ov9444;
extern T0* ge157ov4389;
extern T0* ge155ov4412;
extern T0* ge1420ov9986;
extern T0* ge1420ov9987;
extern T0* ge154ov9925;
extern T0* ge1800ov7272;
extern T0* ge1800ov7273;
extern T0* ge1791ov8466;
extern T0* ge1791ov8468;
extern T0* ge1723ov8099;
extern T0* ge1723ov8100;
extern T0* ge104ov5493;
extern T0* ge104ov5494;
extern T0* ge104ov5495;
extern T0* ge104ov5492;
extern T0* ge1791ov8465;
extern T0* ge1791ov8467;
extern T0* ge294ov3038;
extern T0* ge280ov3038;
extern T0* ge286ov3038;
extern T0* ge285ov3038;
extern T0* ge284ov3038;
extern T0* ge275ov3038;
extern T0* ge274ov3038;
extern T0* ge291ov3038;
extern T0* ge304ov3038;
extern T0* ge1361ov3038;
extern T0* ge1366ov3038;
extern void GE_const_init(void);
extern EIF_TYPE GE_types[];

#ifdef __cplusplus
}
#endif


/*
	description:

		"Part of ISE Eiffel runtime. Needed to compile the EiffelCOM library."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_CECIL_H
#define EIF_CECIL_H

#ifdef __cplusplus
extern "C" {
#endif

typedef void (*EIF_PROCEDURE)(EIF_REFERENCE, ...);
#define EIF_PROC EIF_PROCEDURE
typedef EIF_INTEGER_32 (*EIF_INTEGER_32_FUNCTION)(EIF_REFERENCE, ...); /* Returns an Eiffel Integer 32 bits */
#define EIF_INTEGER_FUNCTION EIF_INTEGER_32_FUNCTION
typedef EIF_REFERENCE (*EIF_REFERENCE_FUNCTION)(EIF_REFERENCE, ...); /* Returns an Eiffel Reference */
typedef EIF_POINTER (*EIF_POINTER_FUNCTION)(EIF_REFERENCE, ...); /* Returns an Eiffel Pointer */
typedef EIF_BOOLEAN (*EIF_BOOLEAN_FUNCTION)(EIF_REFERENCE, ...); /* Returns an Eiffel Boolean */
typedef EIF_CHARACTER_8 (*EIF_CHARACTER_8_FUNCTION)(EIF_REFERENCE, ...); /* Returns char */
#define EIF_CHARACTER_FUNCTION EIF_CHARACTER_8_FUNCTION
typedef EIF_REAL_64 (*EIF_REAL_64_FUNCTION)(EIF_REFERENCE, ...); /* Returns an Eiffel Double */
#define EIF_DOUBLE_FUNCTION EIF_REAL_64_FUNCTION
typedef EIF_REAL_32 (*EIF_REAL_32_FUNCTION)(EIF_REFERENCE, ...); /* Returns an Eiffel Real */
#define EIF_REAL_FUNCTION EIF_REAL_32_FUNCTION

extern EIF_PROCEDURE eif_procedure(char* rout, EIF_TYPE_ID cid);
#define eif_proc eif_procedure /* Use `eif_procedure' instead */
extern EIF_INTEGER_FUNCTION eif_integer_function(char* rout, EIF_TYPE_ID cid);
extern EIF_REFERENCE_FUNCTION eif_reference_function(char* rout, EIF_TYPE_ID cid);
extern EIF_POINTER_FUNCTION eif_pointer_function(char* rout, EIF_TYPE_ID cid);
extern EIF_BOOLEAN_FUNCTION eif_boolean_function(char* rout, EIF_TYPE_ID cid);
extern EIF_REAL_64_FUNCTION eif_real_64_function(char* rout, EIF_TYPE_ID cid);
#define eif_double_function(rout,cid) eif_real_64_function((rout),(cid))
extern EIF_REAL_32_FUNCTION eif_real_32_function(char* rout, EIF_TYPE_ID cid);
#define eif_real_function(rout,cid) eif_real_32_function((rout),(cid))
extern EIF_CHARACTER_8_FUNCTION eif_character_8_function(char* rout, EIF_TYPE_ID cid);
#define eif_character_function(rout,cid) eif_character_8_function((rout),(cid))
extern EIF_OBJECT eif_create(EIF_TYPE_ID cid);
extern EIF_TYPE_ID eif_type_id(char* type_string);
extern EIF_INTEGER eifaddr_offset(EIF_REFERENCE object, char *name, int * const ret);
#define eif_string(s) RTMS(s)
#define makestr(s,c) RTMS_EX((s),(c))
#define eifaddr(object,name,ret) ((void *) ((char *) object + eifaddr_offset (object, name, ret)))
#define eif_field(object,name,type) *(type *)(eifaddr(object,name, NULL)) /* Obsolete. Use "eif_attribute" instead. */
#define eif_attribute(object,name,type,ret) *(type *)(eifaddr(object,name,ret)) /* Returns the attribute of an object. Return status in "ret".*/

/* Miscellaneous useful functions. */

/* Make an Eiffel array from a C array:
 * `eif_array' is the direct reference to the Eiffel array.
 * `c_array' is the C array.
 * `nelts' the number of elements to copy in the eiffel array, it has to
 * be equal to `eif_array.count'.
 * type is an Eiffel type.
 */
#define eif_make_from_c(eif_array, c_array, nelts, type) \
	{ \
		EIF_REFERENCE area = eif_field (eif_array, \
										"area", EIF_REFERENCE); \
		memcpy ((type *) area, c_array, nelts * sizeof (type));\
	}

#define eif_type eiftype /* Dynamic type ID */
extern EIF_TYPE_ID eiftype(EIF_OBJECT object); /* Give dynamic type of EIF_OBJECT. Obsolete, use "eif_type_by_object". */
extern EIF_TYPE_ID eif_type_by_reference (EIF_REFERENCE object);
extern EIF_TYPE_INDEX eif_gen_param_id(EIF_TYPE_INDEX dftype, uint32_t pos);

#ifdef __cplusplus
}
#endif

#endif
/*
	description:

		"Part of ISE Eiffel runtime. Needed to compile the EiffelCOM library."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_PLUG_H
#define EIF_PLUG_H

#ifdef __cplusplus
extern "C" {
#endif

#ifndef EIF_THREADS
extern int nstcall;	/* Nested call global variable: signals a nested call and
					 * trigger an invariant check in generated C routines  */
#endif

#ifdef __cplusplus
}
#endif

#endif
/*
	description:

		"C functions used to implement class EXCEPTIONS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_EXCEPT_H
#define EIF_EXCEPT_H

#include <errno.h>

#ifdef __cplusplus
extern "C" {
#endif

extern void eraise(char* name, long code);
extern void esdie(int code);
extern EIF_REFERENCE eename(long except);
extern EIF_REFERENCE eeltag(void);
extern EIF_REFERENCE eelrout(void);
extern EIF_REFERENCE eelclass(void);
extern long eelcode(void);
extern EIF_REFERENCE stack_trace_string(void);
extern EIF_REFERENCE eeotag(void);
extern long eeocode(void);
extern EIF_REFERENCE eeorout(void);
extern EIF_REFERENCE eeoclass(void);
extern void eecatch(long code);
extern void eeignore(long code);
extern void eetrace(char b);
/* Used in EiffelCOM */
extern char eedefined(long ex);

#ifdef EIF_WINDOWS
/* Needed to compile some code at AXAR */
extern void set_windows_exception_filter();
#endif

/* Raises an Eiffel exception of the given code with no associated tag. */
extern void xraise(int code);
/* Raise 'Operating system error' exception. */
extern void esys(void);
/* As a special case, an I/O error is raised when a system call which is I/O bound fails. */
extern void eise_io(char *tag);
/* Raise "out of memory exception. */
extern void enomem(void);
/* Raise EiffelCOM exception */
#define com_eraise(tag,num) eraise((tag),(num))

/*
 * Predefined exception numbers. Value cannot start at 0 because this may need
 * a propagation via longjmp and USG implementations turn out a 0 to be 1.
 */
#define EN_VOID		1			/* Feature applied to void reference */
#define EN_MEM		2			/* No more memory */
#define EN_PRE		3			/* Pre-condition violated */
#define EN_POST		4			/* Post-condition violated */
#define EN_FLOAT	5			/* Floating point exception (signal SIGFPE) */
#define EN_CINV		6			/* Class invariant violated */
#define EN_CHECK	7			/* Assertion violated */
#define EN_FAIL		8			/* Routine failure */
#define EN_WHEN		9			/* Unmatched inspect value */
#define EN_VAR		10			/* Non-decreasing loop variant */
#define EN_LINV		11			/* Loop invariant violated */
#define EN_SIG		12			/* Operating system signal */
#define EN_BYE		13			/* Eiffel run-time panic */
#define EN_RESC		14			/* Exception in rescue clause */
#define EN_OMEM		15			/* Out of memory (cannot be ignored) */
#define EN_RES		16			/* Resumption failed (retry did not succeed) */
#define EN_CDEF		17			/* Create on deferred */
#define EN_EXT		18			/* External event */
#define EN_VEXP		19			/* Void assigned to expanded */
#define EN_HDLR		20			/* Exception in signal handler */
#define EN_IO		21			/* I/O error */
#define EN_SYS		22			/* Operating system error */
#define EN_RETR		23			/* Retrieval error */
#define EN_PROG		24			/* Developer exception */
#define EN_FATAL	25			/* Eiffel run-time fatal error */
#define EN_DOL		26			/* $ applied to melted feature */
#define EN_ISE_IO	27			/* I/O error raised by the ISE Eiffel runtime */
#define EN_COM		28			/* COM error raised by EiffelCOM runtime */
#define EN_RT_CHECK	29			/* Runtime check error such as out-of-bound array access */

#define echval 0
#define echtg (char*)0

#ifdef __cplusplus
}
#endif

#endif
/*
	description:

		"C functions used to implement class REAL"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_REAL_H
#define GE_REAL_H

#include <math.h>

#ifndef GE_power
#define GE_power(x,y) pow((x),(y))
#endif
#define GE_ceiling(x) ceil(x)
#define GE_floor(x) floor(x)

extern EIF_NATURAL_32 GE_real_32_to_bits (EIF_REAL_32 v);
extern EIF_NATURAL_64 GE_real_64_to_bits (EIF_REAL_64 v);
extern EIF_REAL_32 GE_real_32_from_bits (EIF_NATURAL_32 v);
extern EIF_REAL_64 GE_real_64_from_bits (EIF_NATURAL_64 v);

#define GE_real_32_is_nan(v) ((v)!=(v) ? EIF_TRUE : ((GE_real_32_to_bits(v) & ~GE_nat32(0x80000000)) > GE_nat32(0x7FF00000)))
#define GE_real_64_is_nan(v) ((v)!=(v) ? EIF_TRUE : ((GE_real_64_to_bits(v) & ~GE_nat64(0x8000000000000000)) > GE_nat64(0x7FF0000000000000)))
#define GE_real_32_is_negative_infinity(v) (GE_real_32_to_bits(v) == GE_nat32(0xFF800000))
#define GE_real_64_is_negative_infinity(v) (GE_real_64_to_bits(v) == GE_nat64(0xFFF0000000000000))
#define GE_real_32_is_positive_infinity(v) (GE_real_32_to_bits(v) == GE_nat32(0x7F800000))
#define GE_real_64_is_positive_infinity(v) (GE_real_64_to_bits(v) == GE_nat64(0x7FF0000000000000))
#define GE_real_32_nan GE_real_32_from_bits(GE_nat32(0x7FC00000))
#define GE_real_64_nan GE_real_64_from_bits(GE_nat64(0x7FF8000000000000))
#define GE_real_32_negative_infinity GE_real_32_from_bits(GE_nat32(0xFF800000))
#define GE_real_64_negative_infinity GE_real_64_from_bits(GE_nat64(0xFFF0000000000000))
#define GE_real_32_positive_infinity GE_real_32_from_bits(GE_nat32(0x7F800000))
#define GE_real_64_positive_infinity GE_real_64_from_bits(GE_nat64(0x7FF0000000000000))

#endif
/*
	description:

		"C functions used to implement class FILE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_FILE_H
#define EIF_FILE_H

#include <time.h>
#include <sys/stat.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Let's define the stat structure for our platforms. */
/* The definition is the same for both ANSI and Unicode versions on Windows. */
#ifdef EIF_WINDOWS
#	ifdef EIF_64_BITS
#		define rt_stat_buf	struct _stat64
#	else
#		define rt_stat_buf	struct _stat64i32
#	endif
#else
#	define rt_stat_buf		struct stat
#endif

/*
 * Create directory `dirname'.
 */
extern void eif_file_mkdir(EIF_FILENAME dirname);

/*
 * Rename file `from' into `to'.
 */
extern void eif_file_rename(EIF_FILENAME from, EIF_FILENAME  to);

/*
 * Link file `from' into `to'.
 */
extern void eif_file_link(EIF_FILENAME from, EIF_FILENAME to);

/*
 * Delete file or directory `name'.
 */
extern void eif_file_unlink(EIF_FILENAME name);

/*
 * Open file `name' with the corresponding type `how'.
 */
extern EIF_POINTER eif_file_open(EIF_FILENAME name, int how);

/*
 * Open file `fd' with the corresponding type `how'.
 */
extern EIF_POINTER eif_file_dopen(int fd, int how);

/*
 * Reopen file `name' with the corresponding type `how' and substitute that
 * to the old stream described by `old'. This is useful to redirect 'stdout'
 * to another place, for instance.
 */
extern EIF_POINTER eif_file_reopen( EIF_FILENAME name, int how, FILE *old);

/*
 * Close the file.
 */
extern void eif_file_close(FILE *fp);

/*
 * Flush data held in stdio buffer.
 */
extern void eif_file_flush(FILE *fp);

/*
 * Return the associated file descriptor.
 */
extern EIF_INTEGER eif_file_fd(FILE *f);

/*
 * Get a character from `f'.
 */
extern EIF_CHARACTER_8 eif_file_gc(FILE *f);

/*
 * Get a string from `f' and fill it into `s' (at most `bound' characters),
 * with `start' being the amount of bytes already stored within s. This
 * means we really have to read (bound - start) characters.
 */
extern EIF_INTEGER eif_file_gs(FILE *f, char *s, EIF_INTEGER bound, EIF_INTEGER start);

/*
 * Read min (bound, remaining bytes in file) characters into `s' and
 * return the number of characters read.
 */
extern EIF_INTEGER eif_file_gss(FILE *f, char *s, EIF_INTEGER bound);

/*
 * Get a word from `f' and fill it into `s' (at most `bound' characters),
 * with `start' being the amount of bytes already stored within s. This
 * means we really have to read (bound - start) characters. Any leading
 * spaces are skipped.
 */
extern EIF_INTEGER eif_file_gw(FILE *f, char *s, EIF_INTEGER bound, EIF_INTEGER start);

/*
 * Look ahead one character. If EOF, return 0.
 */
extern EIF_CHARACTER_8 eif_file_lh(FILE *f);

/*
 * Size of file `fp'.
 */
extern EIF_INTEGER eif_file_size(FILE *fp);

/*
 * Read upto next input line.
 */
extern void eif_file_tnil(FILE *f);

/*
 * Current position within file.
 */
extern EIF_INTEGER eif_file_tell(FILE *f);

/*
 * Touch file `name' by setting both access and modification time to the
 * current time stamp. This external function exists only because there
 * is no way within UNIX_FILE to get the current time stamp. Otherwise,
 * we could simply call file_utime.
 */
extern void eif_file_touch(EIF_FILENAME name);

/*
 * Modify the modification and/or the access time stored in the file's
 * inode. The 'how' parameter tells which attributes should be set.
 */
extern void eif_file_utime(EIF_FILENAME name, time_t stamp, int how);

/*
 * This is an encapsulation of the stat() system call. The routine either
 * succeeds and returns or fails and raises the appropriate exception.
 */
extern int eif_file_stat(EIF_FILENAME path, rt_stat_buf *buf, int follow);

/*
 * Change permissions of file `name', using an interface like chmod(1).
 * The flag is true if permissions are to be added, 0 to remove them.
 */
extern void eif_file_perm(EIF_FILENAME name, char *who, char *what, int flag);

/*
 * Change permission mode on file `path'.
 */
extern void eif_file_chmod(EIF_FILENAME path, int mode);

/*
 * Change the owner of the file to `uid'.
 */
extern void eif_file_chown(EIF_FILENAME name, int uid);

/*
 * Change the group of the file to `gid'.
 */
extern void eif_file_chgrp(EIF_FILENAME name, int gid);

/*
 * Put new_line onto `f'.
 */
extern void eif_file_tnwl(FILE *f);

/*
 * Append a copy of `other' to `f'.
 */
extern void eif_file_append(FILE *f, FILE *other, EIF_INTEGER l);

/*
 * Write string `str' on `f'.
 */
extern void eif_file_ps(FILE *f, char *str, EIF_INTEGER len);

/*
 * Write character `c' on `f'.
 */
extern void eif_file_pc(FILE *f, char c);

/*
 * Go to absolute position `pos' counted from start.
 */
extern void eif_file_go(FILE *f, EIF_INTEGER pos);

/*
 * Go to absolute position `pos' counted from end.
 */
extern void eif_file_recede(FILE *f, EIF_INTEGER pos);

/*
 * Go to absolute position `pos' counted from current position.
 */
extern void eif_file_move(FILE *f, EIF_INTEGER pos);

/*
 * End of file.
 */
extern EIF_BOOLEAN eif_file_feof(FILE *fp);

/*
 * Test whether file exists or not. If `name' represents a symbolic link,
 * it will check that pointed file does exist.
 */
extern EIF_BOOLEAN eif_file_exists(EIF_FILENAME name);

/*
 * Test whether file exists or not without following the symbolic link
 * if `name' represents one.
 */
extern EIF_BOOLEAN eif_file_path_exists(EIF_FILENAME name);

/*
 * Check whether access permission `op' are possible on file `name' using
 * real UID and real GID. This is probably only useful to setuid or setgid
 * programs.
 */
extern EIF_BOOLEAN eif_file_access(EIF_FILENAME name, EIF_INTEGER op);

/*
 * Check whether the file `path' may be created: we need write permissions
 * in the parent directory and there must not be any file bearing that name
 * with no write permissions...
 */
extern EIF_BOOLEAN eif_file_creatable(EIF_FILENAME path, EIF_INTEGER nbytes);

/*
 * Get an integer from `f'.
 */
extern EIF_INTEGER eif_file_gi(FILE *f);

/*
 * Get a real from `f'.
 */
extern EIF_REAL_32 eif_file_gr(FILE *f);

/*
 * Get a double from `f'.
 */
extern EIF_REAL_64 eif_file_gd(FILE *f);

/*
 * Write `number' on `f'.
 */
extern void eif_file_pi(FILE *f, EIF_INTEGER number);

/*
 * Write `number' on `f'.
 */
extern void eif_file_pr(FILE *f, EIF_REAL_32 number);

/*
 * Write double `val' onto `f'.
 */
extern void eif_file_pd(FILE *f, EIF_REAL_64 val);

/*
 * Size of the stat structure. This is used by the Eiffel side to create
 * the area (special object) which will play the role of a stat buffer
 * structure.
 */
extern EIF_INTEGER stat_size(void);

/*
 * Check file permissions using effective UID and effective GID. The
 * current permission mode is held in the st_mode field of the stat()
 * buffer structure `buf'.
 */
extern EIF_BOOLEAN eif_file_eaccess(rt_stat_buf *buf, int op);

/*
 * Perform the field dereferencing from the appropriate stat structure,
 * which Eiffel cannot do directly.
 */
extern EIF_INTEGER eif_file_info(rt_stat_buf *buf, int op);

/*
 * Return the Eiffel string filled in with the name associated with `uid'
 * if found in /etc/passwd. Otherwise, return fill it in with the numeric
 * value.
 */
extern EIF_REFERENCE eif_file_owner(int uid);

/*
 * Return the Eiffel string filled in with the name associated with `gid'
 * if found in /etc/group. Otherwise, return fill it in with the numeric
 * value.
 */
extern EIF_REFERENCE eif_file_group(int gid);

/*
 * Get an integer from `f'.
 */
extern EIF_INTEGER eif_file_gib(FILE* f);

/*
 * Get a real from `f'.
 */
extern EIF_REAL_32 eif_file_grb(FILE* f);

/*
 * Get a double from `f'.
 */
extern EIF_REAL_64 eif_file_gdb(FILE* f);

/*
 * Open file `name' with the corresponding type `how'.
 */
extern EIF_POINTER eif_file_binary_open(EIF_FILENAME name, int how);

/*
 * Open file `fd' with the corresponding type `how'.
 */
extern EIF_POINTER eif_file_binary_dopen(int fd, int how);

/*
 * Reopen file `name' with the corresponding type `how' and substitute that
 * to the old stream described by `old'. This is useful to redirect 'stdout'
 * to another place, for instance.
 */
extern EIF_POINTER eif_file_binary_reopen(EIF_FILENAME name, int how, FILE* old);

/*
 * Write `number' on `f'.
 */
extern void eif_file_pib(FILE* f, EIF_INTEGER number);

/*
 * Write `number' on `f'.
 */
extern void eif_file_prb(FILE* f, EIF_REAL_32 number);

/*
 * Write double `val' onto `f'.
 */
extern void eif_file_pdb(FILE* f, EIF_REAL_64 val);

/*
 * Modification time of a file.
 * Seconds since epoch (01 January 1970) in UTC or 0 if time cannot be retrieved.
 */
extern EIF_INTEGER eif_file_date (EIF_FILENAME  name);

/*
 * Access time of a file.
 * Seconds since epoch (01 January 1970) in UTC or 0 if time cannot be retrieved.
 */
extern EIF_INTEGER eif_file_access_date (EIF_FILENAME  name);

#ifdef __cplusplus
}
#endif

#endif
/*
	description:

		"C functions used to implement class CONSOLE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_CONSOLE_H
#define EIF_CONSOLE_H

#ifdef __cplusplus
extern "C" {
#endif

extern EIF_POINTER console_def(EIF_INTEGER file);
extern EIF_BOOLEAN console_eof(FILE* fp);
extern EIF_CHARACTER_8 console_separator(FILE* f);
extern void console_ps(FILE* f, char* str, EIF_INTEGER len);
extern void console_pr(FILE* f, EIF_REAL_32 number);
extern void console_pc(FILE* f, EIF_CHARACTER_8 c);
extern void console_pd(FILE* f, EIF_REAL_64 val);
extern void console_pi(FILE* f, EIF_INTEGER number);
extern void console_tnwl(FILE* f);
extern EIF_CHARACTER_8 console_readchar(FILE* f);
extern EIF_REAL_32 console_readreal(FILE* f);
extern EIF_INTEGER console_readint(FILE* f);
extern EIF_REAL_64 console_readdouble(FILE* f);
extern EIF_INTEGER console_readword(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start);
extern EIF_INTEGER console_readline(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start);
extern void console_next_line(FILE* f);
extern EIF_INTEGER console_readstream(FILE* f, char* s, EIF_INTEGER bound);
extern void console_file_close (FILE* f);

#ifdef __cplusplus
}
#endif

#endif
/*
	description:

		"C functions used to implement Thread support"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_THREADS_H
#define EIF_THREADS_H

#ifndef EIF_CECIL_H
#include "eif_cecil.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifndef EIF_THREADS

/*
	Empty stubs for EiffelThread library so that it may be compiled against a non-multithreaded run-time.
*/
#define eif_thr_mutex_create() NULL
#define eif_thr_mutex_lock(a_mutex_pointer)
#define eif_thr_mutex_unlock(a_mutex_pointer)
#define eif_thr_mutex_trylock(a_mutex_pointer) EIF_FALSE
#define eif_thr_mutex_destroy(a_mutex_pointer)
#define eif_thr_cond_create() NULL
#define eif_thr_cond_broadcast(a_cond_ptr)
#define eif_thr_cond_wait(a_cond_ptr,a_mutex_ptr)
#define eif_thr_cond_destroy(a_mutex_ptr)
#define eif_thr_thread_id() NULL
#define eif_thr_last_thread() NULL
#define eif_thr_default_priority() 0
#define eif_thr_create_with_attr(current_obj, init_func, attr)
#define eif_thr_create_with_args(current_obj, init_func, priority, policy, detach)
#define eif_thr_sleep(nanoseconds)
#define eif_thr_cond_signal(a_cond_ptr)
#define eif_thr_cond_wait_with_timeout(a_cond_ptr,a_mutex_ptr,a_timeout) 0
#define eif_thr_wait_with_timeout(term,tms) EIF_FALSE
#define eif_thr_wait(term)

#endif

#ifdef __cplusplus
}
#endif

#endif
/*
	description:

		"Part of ISE Eiffel runtime. Needed to compile the EiffelCOM library."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2010-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_GLOBALS_H
#define EIF_GLOBALS_H

#ifndef EIF_THREADS_H
#include "eif_threads.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

#define EIF_GET_CONTEXT
#define GTCX EIF_GET_CONTEXT

#ifdef __cplusplus
}
#endif

#endif
/*
	description:

		"C declarations for the ISE Eiffel runtime."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_EIFFEL_H
#define EIF_EIFFEL_H

#ifndef EIF_GLOBALS_H
#include "eif_globals.h"
#endif
#ifndef EIF_EXCEPT_H
#include "eif_except.h"
#endif

#endif
/*
	description:

		"C functions used to implement class DIRECTORY"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_DIR_H
#define EIF_DIR_H

#ifdef __cplusplus
extern "C" {
#endif

extern EIF_POINTER eif_dir_open (EIF_FILENAME dirname);
extern EIF_POINTER eif_dir_next (EIF_POINTER dir);
extern EIF_POINTER eif_dir_rewind (EIF_POINTER d, EIF_FILENAME dir_name);
extern void eif_dir_close (EIF_POINTER dir);
extern EIF_BOOLEAN eif_dir_exists (EIF_FILENAME dirname);
extern EIF_BOOLEAN eif_dir_is_readable (EIF_FILENAME dirname);
extern EIF_BOOLEAN eif_dir_is_writable (EIF_FILENAME dirname);
extern EIF_BOOLEAN eif_dir_is_executable (EIF_FILENAME dirname);
extern EIF_BOOLEAN eif_dir_is_deletable (EIF_FILENAME name);
extern EIF_CHARACTER_8 eif_dir_separator(void);
extern EIF_INTEGER eif_dir_current (EIF_FILENAME a_buffer, EIF_INTEGER a_count);
extern EIF_INTEGER eif_chdir (EIF_FILENAME path);

#ifdef __cplusplus
}
#endif

#endif
/*
	description:

		"C functions used to access DLLs"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_DLL_H
#define GE_DLL_H

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_WINDOWS

#include <windows.h>

/* DLL declarations */
#define GE_load_dll(name) LoadLibraryA((LPCSTR)name)

#endif

#ifdef __cplusplus
}
#endif

#endif
/*
	description:

		"C functions used to implement class EXECUTION_ENVIRONMENT"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_MISC_H
#define EIF_MISC_H

#ifdef __cplusplus
extern "C" {
#endif

extern EIF_INTEGER eif_system(EIF_NATIVE_CHAR* s);
extern void eif_system_asynchronous(EIF_NATIVE_CHAR* cmd);
extern void eif_sleep(EIF_INTEGER_64);

#ifdef EIF_WINDOWS
/* DLL declarations */
#define eif_load_dll(name) GE_load_dll(name)
#endif

#ifdef __cplusplus
}
#endif

#endif
/*
	description:

		"C functions used to implement the main function"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_MAIN_H
#define EIF_MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_WINDOWS

#include <windows.h>

/*
	Used in WEL.
*/
extern HINSTANCE eif_hInstance;

#endif

/*
	Used by the ISE runtime to figure out whether the application
	was launched from EiffelStudio in workbench mode or not.
*/
extern int debug_mode;

#ifdef __cplusplus
}
#endif

#endif
#include <string.h>
#include <stdlib.h>
