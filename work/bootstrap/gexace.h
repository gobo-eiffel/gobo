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

#define EIF_VOID ((EIF_REFERENCE)0)
#define EIF_FALSE ((EIF_BOOLEAN)'\0')
#define EIF_TRUE ((EIF_BOOLEAN)'\1')
#define EIF_TEST(x) ((x) ? EIF_TRUE : EIF_FALSE)

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

		"C functions used to implement class ARGUMENTS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
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
extern char** GE_argv;

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

/* STRING_8 */
typedef struct S17 T17;

/* GEXACE */
typedef struct S21 T21;

/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND] */
typedef struct S22 T22;

/* KL_ARGUMENTS */
typedef struct S23 T23;

/* DS_HASH_TABLE [STRING_8, STRING_8] */
typedef struct S24 T24;

/* UC_STRING_EQUALITY_TESTER */
typedef struct S25 T25;

/* DS_LINKED_LIST [GEXACE_COMMAND] */
typedef struct S27 T27;

/* ET_XACE_DEFAULT_ERROR_HANDLER */
typedef struct S28 T28;

/* KL_EXCEPTIONS */
typedef struct S30 T30;

/* DS_LINKED_LIST_CURSOR [STRING_8] */
typedef struct S31 T31;

/* DS_PAIR [STRING_8, STRING_8] */
typedef struct S32 T32;

/* DS_LINKED_LIST [STRING_8] */
typedef struct S33 T33;

/* UT_USAGE_MESSAGE */
typedef struct S34 T34;

/* GEXACE_SYSTEM_COMMAND */
typedef struct S36 T36;

/* GEXACE_LIBRARY_COMMAND */
typedef struct S40 T40;

/* GEXACE_VALIDATE_COMMAND */
typedef struct S41 T41;

/* ET_XACE_XACE_GENERATOR */
typedef struct S43 T43;

/* ET_XACE_ACE_GENERATOR */
typedef struct S44 T44;

/* ET_XACE_ECF_GENERATOR */
typedef struct S45 T45;

/* DS_LINKED_LIST [ET_XACE_GENERATOR] */
typedef struct S46 T46;

/* KL_STRING_ROUTINES */
typedef struct S47 T47;

/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8] */
typedef struct S48 T48;

/* SPECIAL [STRING_8] */
typedef struct S50 T50;

/* SPECIAL [INTEGER_32] */
typedef struct S51 T51;

/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
typedef struct S52 T52;

/* KL_SPECIAL_ROUTINES [INTEGER_32] */
typedef struct S53 T53;

/* KL_SPECIAL_ROUTINES [STRING_8] */
typedef struct S54 T54;

/* DS_LINKABLE [GEXACE_COMMAND] */
typedef struct S55 T55;

/* KL_STANDARD_FILES */
typedef struct S57 T57;

/* KL_STDERR_FILE */
typedef struct S58 T58;

/* KL_STDOUT_FILE */
typedef struct S59 T59;

/* KL_NULL_TEXT_OUTPUT_STREAM */
typedef struct S60 T60;

/* DS_LINKABLE [STRING_8] */
typedef struct S62 T62;

/* ARRAY [STRING_8] */
typedef struct S63 T63;

/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR] */
typedef struct S64 T64;

/* DS_LINKABLE [ET_XACE_GENERATOR] */
typedef struct S65 T65;

/* UC_STRING */
typedef struct S69 T69;

/* KL_ANY_ROUTINES */
typedef struct S70 T70;

/* DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8] */
typedef struct S71 T71;

/* TYPED_POINTER [ANY] */
typedef struct S72 T72;

/* STRING_TO_INTEGER_CONVERTOR */
typedef struct S74 T74;

/* ET_XACE_SYSTEM_CONFIG_PARSER */
typedef struct S75 T75;

/* ET_XACE_SYSTEM_CONFIG */
typedef struct S76 T76;

/* KL_TEXT_INPUT_FILE */
typedef struct S77 T77;

/* KL_TEXT_OUTPUT_FILE */
typedef struct S79 T79;

/* ET_XACE_LIBRARY_CONFIG_PARSER */
typedef struct S80 T80;

/* ET_XACE_LIBRARY_CONFIG */
typedef struct S81 T81;

/* ET_XACE_PARSER */
typedef struct S82 T82;

/* UT_CANNOT_READ_FILE_ERROR */
typedef struct S84 T84;

/* UT_CANNOT_WRITE_TO_FILE_ERROR */
typedef struct S85 T85;

/* INTEGER_OVERFLOW_CHECKER */
typedef struct S86 T86;

/* ET_XACE_AST_FACTORY */
typedef struct S87 T87;

/* XM_DOCUMENT */
typedef struct S88 T88;

/* XM_ELEMENT */
typedef struct S89 T89;

/* XM_POSITION_TABLE */
typedef struct S90 T90;

/* XM_TREE_CALLBACKS_PIPE */
typedef struct S92 T92;

/* XM_STOP_ON_ERROR_FILTER */
typedef struct S93 T93;

/* XM_CALLBACKS_TO_TREE_FILTER */
typedef struct S94 T94;

/* ET_XACE_VALIDATOR */
typedef struct S95 T95;

/* ET_XACE_PREPROCESSOR */
typedef struct S96 T96;

/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8] */
typedef struct S97 T97;

/* XM_EXPAT_PARSER_FACTORY */
typedef struct S98 T98;

/* XM_EIFFEL_PARSER */
typedef struct S99 T99;

/* SPECIAL [NATURAL_8] */
typedef struct S105 T105;

/* UT_MESSAGE */
typedef struct S106 T106;

/* ET_XACE_NOT_XACE_FILE_ERROR */
typedef struct S107 T107;

/* ET_XACE_CLUSTERS */
typedef struct S108 T108;

/* ET_XACE_MOUNTED_LIBRARIES */
typedef struct S109 T109;

/* ET_XACE_OPTIONS */
typedef struct S110 T110;

/* DS_HASH_SET_CURSOR [STRING_8] */
typedef struct S111 T111;

/* DS_ARRAYED_LIST_CURSOR [STRING_8] */
typedef struct S112 T112;

/* DS_HASH_SET [STRING_8] */
typedef struct S113 T113;

/* DS_ARRAYED_LIST [STRING_8] */
typedef struct S114 T114;

/* DS_ARRAYED_LIST [ET_XACE_CLUSTER] */
typedef struct S115 T115;

/* ET_XACE_CLUSTER */
typedef struct S116 T116;

/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY] */
typedef struct S117 T117;

/* ET_XACE_MOUNTED_LIBRARY */
typedef struct S118 T118;

/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS] */
typedef struct S119 T119;

/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS] */
typedef struct S120 T120;

/* ET_XACE_CLASS_OPTIONS */
typedef struct S121 T121;

/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS] */
typedef struct S122 T122;

/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS] */
typedef struct S123 T123;

/* ET_XACE_FEATURE_OPTIONS */
typedef struct S124 T124;

/* ET_XACE_EXTERNALS */
typedef struct S125 T125;

/* ET_XACE_OPTION_NAMES */
typedef struct S126 T126;

/* DS_LINKED_LIST [ET_XACE_ASSEMBLY] */
typedef struct S127 T127;

/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY] */
typedef struct S128 T128;

/* ET_XACE_ASSEMBLY */
typedef struct S129 T129;

/* KL_UNIX_FILE_SYSTEM */
typedef struct S130 T130;

/* KL_EXECUTION_ENVIRONMENT */
typedef struct S131 T131;

/* DS_LINKED_LIST [ET_XACE_CLUSTER] */
typedef struct S132 T132;

/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER] */
typedef struct S133 T133;

/* TUPLE [ET_XACE_CLASS_OPTIONS] */
typedef struct S134 T134;

/* PROCEDURE [ET_XACE_ECF_GENERATOR, TUPLE [ET_XACE_CLASS_OPTIONS]] */
typedef struct S136 T136;

/* TUPLE [ET_XACE_ECF_GENERATOR, INTEGER_32, KI_TEXT_OUTPUT_STREAM] */
typedef struct S137 T137;

/* TUPLE [ET_XACE_FEATURE_OPTIONS] */
typedef struct S138 T138;

/* PROCEDURE [ET_XACE_ECF_GENERATOR, TUPLE [ET_XACE_FEATURE_OPTIONS]] */
typedef struct S139 T139;

/* TUPLE [ET_XACE_ECF_GENERATOR, STRING_8, INTEGER_32, KI_TEXT_OUTPUT_STREAM] */
typedef struct S140 T140;

/* ET_TOKEN_CONSTANTS */
typedef struct S141 T141;

/* ET_SYSTEM */
typedef struct S142 T142;

/* XM_ATTRIBUTE */
typedef struct S145 T145;

/* DS_LINKED_LIST_CURSOR [XM_NODE] */
typedef struct S146 T146;

/* DS_HASH_TABLE [INTEGER_32, STRING_8] */
typedef struct S149 T149;

/* UNIX_FILE_INFO */
typedef struct S152 T152;

/* SPECIAL [NATURAL_64] */
typedef struct S153 T153;

/* XM_NAMESPACE_RESOLVER */
typedef struct S154 T154;

/* SPECIAL [XM_CALLBACKS_FILTER] */
typedef struct S155 T155;

/* ARRAY [XM_CALLBACKS_FILTER] */
typedef struct S156 T156;

/* XM_CALLBACKS_NULL */
typedef struct S157 T157;

/* UT_TEMPLATE_EXPANDER */
typedef struct S159 T159;

/* DS_SPARSE_TABLE_KEYS [ET_XACE_LIBRARY_CONFIG, STRING_8] */
typedef struct S161 T161;

/* DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8] */
typedef struct S163 T163;

/* SPECIAL [ET_XACE_LIBRARY_CONFIG] */
typedef struct S164 T164;

/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY_CONFIG] */
typedef struct S165 T165;

/* XM_EIFFEL_SCANNER */
typedef struct S166 T166;

/* XM_DEFAULT_POSITION */
typedef struct S167 T167;

/* DS_BILINKED_LIST [XM_POSITION] */
typedef struct S169 T169;

/* DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
typedef struct S170 T170;

/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S171 T171;

/* XM_NULL_EXTERNAL_RESOLVER */
typedef struct S173 T173;

/* SPECIAL [ANY] */
typedef struct S174 T174;

/* KL_SPECIAL_ROUTINES [ANY] */
typedef struct S175 T175;

/* XM_EIFFEL_PARSER_NAME */
typedef struct S176 T176;

/* XM_EIFFEL_DECLARATION */
typedef struct S177 T177;

/* XM_DTD_EXTERNAL_ID */
typedef struct S178 T178;

/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
typedef struct S179 T179;

/* XM_DTD_ELEMENT_CONTENT */
typedef struct S180 T180;

/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S181 T181;

/* XM_DTD_ATTRIBUTE_CONTENT */
typedef struct S182 T182;

/* DS_BILINKED_LIST [STRING_8] */
typedef struct S183 T183;

/* SPECIAL [XM_EIFFEL_PARSER_NAME] */
typedef struct S184 T184;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
typedef struct S185 T185;

/* SPECIAL [XM_EIFFEL_DECLARATION] */
typedef struct S186 T186;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
typedef struct S187 T187;

/* SPECIAL [BOOLEAN] */
typedef struct S188 T188;

/* SPECIAL [XM_DTD_EXTERNAL_ID] */
typedef struct S189 T189;

/* KL_SPECIAL_ROUTINES [BOOLEAN] */
typedef struct S190 T190;

/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S191 T191;

/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S192 T192;

/* SPECIAL [XM_DTD_ELEMENT_CONTENT] */
typedef struct S193 T193;

/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
typedef struct S194 T194;

/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S196 T196;

/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S198 T198;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S199 T199;

/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S200 T200;

/* SPECIAL [DS_BILINKED_LIST [STRING_8]] */
typedef struct S201 T201;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
typedef struct S202 T202;

/* XM_EIFFEL_ENTITY_DEF */
typedef struct S203 T203;

/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
typedef struct S204 T204;

/* XM_DTD_CALLBACKS_NULL */
typedef struct S206 T206;

/* XM_EIFFEL_SCANNER_DTD */
typedef struct S207 T207;

/* XM_EIFFEL_PE_ENTITY_DEF */
typedef struct S209 T209;

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR */
typedef struct S210 T210;

/* ET_XACE_BOOLEAN_EXPECTED_ERROR */
typedef struct S211 T211;

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR */
typedef struct S212 T212;

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR */
typedef struct S213 T213;

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR */
typedef struct S214 T214;

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING */
typedef struct S215 T215;

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR */
typedef struct S216 T216;

/* ET_XACE_MISSING_ATTRIBUTE_ERROR */
typedef struct S217 T217;

/* ET_XACE_MISSING_ELEMENT_ERROR */
typedef struct S218 T218;

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING */
typedef struct S219 T219;

/* ET_XACE_UNKNOWN_ELEMENT_ERROR */
typedef struct S220 T220;

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING */
typedef struct S221 T221;

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING */
typedef struct S222 T222;

/* KL_OPERATING_SYSTEM */
typedef struct S223 T223;

/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S226 T226;

/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S227 T227;

/* DS_PAIR [XM_POSITION, XM_NODE] */
typedef struct S228 T228;

/* ARRAY [INTEGER_32] */
typedef struct S229 T229;

/* UC_UTF8_ROUTINES */
typedef struct S230 T230;

/* UC_UTF8_STRING */
typedef struct S232 T232;

/* XM_EIFFEL_INPUT_STREAM */
typedef struct S233 T233;

/* KL_INTEGER_ROUTINES */
typedef struct S234 T234;

/* KL_PLATFORM */
typedef struct S235 T235;

/* UT_TRISTATE */
typedef struct S236 T236;

/* SPECIAL [ET_XACE_CLUSTER] */
typedef struct S237 T237;

/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER] */
typedef struct S238 T238;

/* DS_ARRAYED_LIST_CURSOR [ET_XACE_CLUSTER] */
typedef struct S239 T239;

/* SPECIAL [ET_XACE_MOUNTED_LIBRARY] */
typedef struct S240 T240;

/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY] */
typedef struct S241 T241;

/* DS_ARRAYED_LIST_CURSOR [ET_XACE_MOUNTED_LIBRARY] */
typedef struct S242 T242;

/* DS_LINKABLE [ET_XACE_CLASS_OPTIONS] */
typedef struct S243 T243;

/* DS_LINKABLE [ET_XACE_FEATURE_OPTIONS] */
typedef struct S244 T244;

/* DS_LINKABLE [ET_XACE_ASSEMBLY] */
typedef struct S245 T245;

/* EXECUTION_ENVIRONMENT */
typedef struct S246 T246;

/* DS_LINKABLE [ET_XACE_CLUSTER] */
typedef struct S247 T247;

/* ET_ERROR_HANDLER */
typedef struct S248 T248;

/* ET_AST_FACTORY */
typedef struct S249 T249;

/* ET_AST_NULL_PROCESSOR */
typedef struct S250 T250;

/* ET_ADAPTED_LIBRARIES */
typedef struct S252 T252;

/* ET_CLUSTERS */
typedef struct S253 T253;

/* ET_ADAPTED_DOTNET_ASSEMBLIES */
typedef struct S254 T254;

/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME] */
typedef struct S255 T255;

/* ET_CLASS_NAME_TESTER */
typedef struct S256 T256;

/* ET_MASTER_CLASS */
typedef struct S259 T259;

/* ET_CLIENT */
typedef struct S260 T260;

/* ET_CLASS_TYPE */
typedef struct S261 T261;

/* ET_PARENT */
typedef struct S264 T264;

/* ET_PARENT_LIST */
typedef struct S269 T269;

/* ET_CLIENT_LIST */
typedef struct S271 T271;

/* ET_TUPLE_TYPE */
typedef struct S273 T273;

/* ET_ACTUAL_PARAMETER_LIST */
typedef struct S274 T274;

/* ET_GENERIC_CLASS_TYPE */
typedef struct S276 T276;

/* ET_BUILTIN_CONVERT_FEATURE */
typedef struct S277 T277;

/* ET_CLASS */
typedef struct S279 T279;

/* ET_NONE_GROUP */
typedef struct S280 T280;

/* DS_SPARSE_TABLE_KEYS [INTEGER_32, STRING_8] */
typedef struct S282 T282;

/* DS_HASH_TABLE_CURSOR [INTEGER_32, STRING_8] */
typedef struct S284 T284;

/* TYPED_POINTER [SPECIAL [CHARACTER_8]] */
typedef struct S285 T285;

/* XM_NAMESPACE_RESOLVER_CONTEXT */
typedef struct S286 T286;

/* DS_LINKED_QUEUE [STRING_8] */
typedef struct S288 T288;

/* DS_SPARSE_TABLE_KEYS_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8] */
typedef struct S289 T289;

/* XM_EIFFEL_CHARACTER_ENTITY */
typedef struct S290 T290;

/* YY_BUFFER */
typedef struct S291 T291;

/* YY_FILE_BUFFER */
typedef struct S292 T292;

/* DS_LINKED_STACK [INTEGER_32] */
typedef struct S295 T295;

/* DS_BILINKABLE [XM_POSITION] */
typedef struct S296 T296;

/* DS_BILINKED_LIST_CURSOR [XM_POSITION] */
typedef struct S297 T297;

/* DS_LINKABLE [XM_EIFFEL_SCANNER] */
typedef struct S298 T298;

/* SPECIAL [XM_EIFFEL_ENTITY_DEF] */
typedef struct S299 T299;

/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S300 T300;

/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S302 T302;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
typedef struct S304 T304;

/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
typedef struct S305 T305;

/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
typedef struct S306 T306;

/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
typedef struct S307 T307;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S308 T308;

/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S309 T309;

/* DS_BILINKED_LIST_CURSOR [STRING_8] */
typedef struct S310 T310;

/* DS_BILINKABLE [STRING_8] */
typedef struct S311 T311;

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING */
typedef struct S312 T312;

/* ET_XACE_INVALID_EXPRESSION_ERROR */
typedef struct S313 T313;

/* UC_UNICODE_ROUTINES */
typedef struct S314 T314;

/* KL_ARRAY_ROUTINES [INTEGER_32] */
typedef struct S315 T315;

/* DS_LINKED_QUEUE [CHARACTER_8] */
typedef struct S322 T322;

/* UC_UTF16_ROUTINES */
typedef struct S323 T323;

/* DS_ARRAYED_LIST [ET_ADAPTED_LIBRARY] */
typedef struct S325 T325;

/* DS_ARRAYED_LIST [ET_CLUSTER] */
typedef struct S326 T326;

/* DS_ARRAYED_LIST [ET_ADAPTED_DOTNET_ASSEMBLY] */
typedef struct S327 T327;

/* SPECIAL [ET_MASTER_CLASS] */
typedef struct S328 T328;

/* DS_SPARSE_TABLE_KEYS [ET_MASTER_CLASS, ET_CLASS_NAME] */
typedef struct S330 T330;

/* SPECIAL [ET_CLASS_NAME] */
typedef struct S332 T332;

/* DS_HASH_TABLE_CURSOR [ET_MASTER_CLASS, ET_CLASS_NAME] */
typedef struct S333 T333;

/* KL_SPECIAL_ROUTINES [ET_MASTER_CLASS] */
typedef struct S334 T334;

/* KL_SPECIAL_ROUTINES [ET_CLASS_NAME] */
typedef struct S335 T335;

/* DS_ARRAYED_LIST [ET_CLASS] */
typedef struct S336 T336;

/* DS_ARRAYED_LIST [ET_MASTER_CLASS] */
typedef struct S337 T337;

/* TUPLE [ET_MASTER_CLASS] */
typedef struct S338 T338;

/* PROCEDURE [ET_MASTER_CLASS, TUPLE [ET_MASTER_CLASS]] */
typedef struct S339 T339;

/* ET_KEYWORD */
typedef struct S340 T340;

/* SPECIAL [ET_PARENT_ITEM] */
typedef struct S342 T342;

/* KL_SPECIAL_ROUTINES [ET_PARENT_ITEM] */
typedef struct S343 T343;

/* SPECIAL [ET_CLIENT_ITEM] */
typedef struct S344 T344;

/* KL_SPECIAL_ROUTINES [ET_CLIENT_ITEM] */
typedef struct S345 T345;

/* ET_IDENTIFIER */
typedef struct S346 T346;

/* ET_SYMBOL */
typedef struct S347 T347;

/* ET_BRACKET_SYMBOL */
typedef struct S348 T348;

/* SPECIAL [ET_ACTUAL_PARAMETER_ITEM] */
typedef struct S350 T350;

/* KL_SPECIAL_ROUTINES [ET_ACTUAL_PARAMETER_ITEM] */
typedef struct S351 T351;

/* ET_BRACED_TYPE_LIST */
typedef struct S354 T354;

/* DS_SPARSE_TABLE_KEYS_CURSOR [INTEGER_32, STRING_8] */
typedef struct S355 T355;

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S357 T357;

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S358 T358;

/* DS_LINKABLE [INTEGER_32] */
typedef struct S360 T360;

/* DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S361 T361;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
typedef struct S362 T362;

/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
typedef struct S363 T363;

/* C_STRING */
typedef struct S364 T364;

/* DS_HASH_SET [XM_NAMESPACE] */
typedef struct S365 T365;

/* XM_COMMENT */
typedef struct S366 T366;

/* XM_PROCESSING_INSTRUCTION */
typedef struct S367 T367;

/* XM_CHARACTER_DATA */
typedef struct S368 T368;

/* XM_NAMESPACE */
typedef struct S369 T369;

/* KL_WINDOWS_FILE_SYSTEM */
typedef struct S371 T371;

/* KL_STRING_INPUT_STREAM */
typedef struct S374 T374;

/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S375 T375;

/* ET_BASE_TYPE_LIST */
typedef struct S378 T378;

/* ET_QUERY_LIST */
typedef struct S379 T379;

/* ET_PROCEDURE_LIST */
typedef struct S380 T380;

/* ET_UNKNOWN_GROUP */
typedef struct S381 T381;

/* ET_CLASS_CODES */
typedef struct S382 T382;

/* KL_CHARACTER_BUFFER */
typedef struct S383 T383;

/* SPECIAL [ARRAY [INTEGER_32]] */
typedef struct S384 T384;

/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
typedef struct S385 T385;

/* DS_LINKABLE [CHARACTER_8] */
typedef struct S386 T386;

/* KL_SPECIAL_ROUTINES [ET_ADAPTED_LIBRARY] */
typedef struct S387 T387;

/* SPECIAL [ET_ADAPTED_LIBRARY] */
typedef struct S389 T389;

/* DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_LIBRARY] */
typedef struct S390 T390;

/* KL_SPECIAL_ROUTINES [ET_CLUSTER] */
typedef struct S391 T391;

/* SPECIAL [ET_CLUSTER] */
typedef struct S392 T392;

/* DS_ARRAYED_LIST_CURSOR [ET_CLUSTER] */
typedef struct S393 T393;

/* KL_SPECIAL_ROUTINES [ET_ADAPTED_DOTNET_ASSEMBLY] */
typedef struct S394 T394;

/* SPECIAL [ET_ADAPTED_DOTNET_ASSEMBLY] */
typedef struct S396 T396;

/* DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_DOTNET_ASSEMBLY] */
typedef struct S397 T397;

/* DS_SPARSE_TABLE_KEYS_CURSOR [ET_MASTER_CLASS, ET_CLASS_NAME] */
typedef struct S398 T398;

/* KL_SPECIAL_ROUTINES [ET_CLASS] */
typedef struct S399 T399;

/* SPECIAL [ET_CLASS] */
typedef struct S400 T400;

/* DS_ARRAYED_LIST_CURSOR [ET_CLASS] */
typedef struct S401 T401;

/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S405 T405;

/* DS_LINKABLE [XM_NODE] */
typedef struct S408 T408;

/* XM_NODE_TYPER */
typedef struct S410 T410;

/* DS_ARRAYED_LIST_CURSOR [ET_MASTER_CLASS] */
typedef struct S414 T414;

/* MANAGED_POINTER */
typedef struct S415 T415;

/* SPECIAL [XM_NAMESPACE] */
typedef struct S416 T416;

/* KL_EQUALITY_TESTER [XM_NAMESPACE] */
typedef struct S417 T417;

/* DS_HASH_SET_CURSOR [XM_NAMESPACE] */
typedef struct S418 T418;

/* KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
typedef struct S419 T419;

/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME] */
typedef struct S420 T420;

/* SPECIAL [ET_BASE_TYPE] */
typedef struct S423 T423;

/* KL_SPECIAL_ROUTINES [ET_BASE_TYPE] */
typedef struct S424 T424;

/* SPECIAL [ET_QUERY] */
typedef struct S426 T426;

/* KL_SPECIAL_ROUTINES [ET_QUERY] */
typedef struct S427 T427;

/* SPECIAL [ET_PROCEDURE] */
typedef struct S429 T429;

/* KL_SPECIAL_ROUTINES [ET_PROCEDURE] */
typedef struct S430 T430;

/* TYPED_POINTER [NATURAL_8] */
typedef struct S431 T431;

/* EXCEPTIONS */
typedef struct S432 T432;

/* DS_SPARSE_TABLE_KEYS [NATURAL_8, ET_CLASS_NAME] */
typedef struct S434 T434;

/* DS_HASH_TABLE_CURSOR [NATURAL_8, ET_CLASS_NAME] */
typedef struct S436 T436;

/* KL_SPECIAL_ROUTINES [NATURAL_8] */
typedef struct S437 T437;

/* DS_SPARSE_TABLE_KEYS_CURSOR [NATURAL_8, ET_CLASS_NAME] */
typedef struct S438 T438;

/* STRING_SEARCHER */
typedef struct S439 T439;

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

/* Struct for type TYPED_POINTER [ANY] */
struct S72 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type TYPED_POINTER [SPECIAL [CHARACTER_8]] */
struct S285 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type TYPED_POINTER [NATURAL_8] */
struct S431 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type SPECIAL [CHARACTER_8] */
struct S15 {
	int id;
	T6 a1; /* count */
	T2 z2[1]; /* item */
};

/* Struct for type STRING_8 */
struct S17 {
	int id;
	T0* a1; /* area */
	T6 a2; /* count */
	T6 a3; /* internal_hash_code */
};

/* Struct for type GEXACE */
struct S21 {
	int id;
	T0* a1; /* variables */
	T0* a2; /* commands */
	T0* a3; /* error_handler */
	T6 a4; /* next_option_position */
	T1 a5; /* is_shallow */
};

/* Struct for type DS_LINKED_LIST_CURSOR [GEXACE_COMMAND] */
struct S22 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type KL_ARGUMENTS */
struct S23 {
	int id;
	T0* a1; /* program_name */
};

/* Struct for type DS_HASH_TABLE [STRING_8, STRING_8] */
struct S24 {
	int id;
	T0* a1; /* key_equality_tester */
	T0* a2; /* internal_keys */
	T6 a3; /* position */
	T6 a4; /* last_position */
	T6 a5; /* capacity */
	T6 a6; /* slots_position */
	T6 a7; /* count */
	T0* a8; /* equality_tester */
	T6 a9; /* found_position */
	T6 a10; /* modulus */
	T6 a11; /* clashes_previous_position */
	T0* a12; /* item_storage */
	T0* a13; /* clashes */
	T0* a14; /* slots */
	T0* a15; /* key_storage */
	T6 a16; /* free_slot */
	T0* a17; /* special_item_routines */
	T0* a18; /* special_key_routines */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type UC_STRING_EQUALITY_TESTER */
struct S25 {
	int id;
};

/* Struct for type DS_LINKED_LIST [GEXACE_COMMAND] */
struct S27 {
	int id;
	T0* a1; /* first_cell */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* internal_cursor */
};

/* Struct for type ET_XACE_DEFAULT_ERROR_HANDLER */
struct S28 {
	int id;
	T6 a1; /* error_count */
	T0* a2; /* warning_file */
	T0* a3; /* info_file */
	T0* a4; /* error_file */
};

/* Struct for type KL_EXCEPTIONS */
struct S30 {
	int id;
};

/* Struct for type DS_LINKED_LIST_CURSOR [STRING_8] */
struct S31 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_PAIR [STRING_8, STRING_8] */
struct S32 {
	int id;
	T0* a1; /* second */
	T0* a2; /* first */
};

/* Struct for type DS_LINKED_LIST [STRING_8] */
struct S33 {
	int id;
	T0* a1; /* first_cell */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* internal_cursor */
};

/* Struct for type UT_USAGE_MESSAGE */
struct S34 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type GEXACE_SYSTEM_COMMAND */
struct S36 {
	int id;
	T0* a1; /* format */
	T0* a2; /* generators */
	T0* a3; /* variables */
	T0* a4; /* error_handler */
	T0* a5; /* xace_filename */
	T1 a6; /* is_shallow */
	T0* a7; /* output_filename */
	T1 a8; /* is_ve */
};

/* Struct for type GEXACE_LIBRARY_COMMAND */
struct S40 {
	int id;
	T0* a1; /* format */
	T0* a2; /* generators */
	T0* a3; /* variables */
	T0* a4; /* error_handler */
	T0* a5; /* xace_filename */
	T1 a6; /* is_shallow */
	T0* a7; /* output_filename */
	T1 a8; /* is_ve */
};

/* Struct for type GEXACE_VALIDATE_COMMAND */
struct S41 {
	int id;
	T0* a1; /* variables */
	T0* a2; /* error_handler */
	T0* a3; /* xace_filename */
	T1 a4; /* is_shallow */
};

/* Struct for type ET_XACE_XACE_GENERATOR */
struct S43 {
	int id;
	T0* a1; /* compiler */
	T0* a2; /* variables */
	T0* a3; /* error_handler */
	T1 a4; /* is_shallow */
};

/* Struct for type ET_XACE_ACE_GENERATOR */
struct S44 {
	int id;
	T0* a1; /* compiler */
	T0* a2; /* variables */
	T0* a3; /* error_handler */
	T1 a4; /* is_shallow */
};

/* Struct for type ET_XACE_ECF_GENERATOR */
struct S45 {
	int id;
	T0* a1; /* compiler */
	T0* a2; /* variables */
	T0* a3; /* error_handler */
	T1 a4; /* is_shallow */
};

/* Struct for type DS_LINKED_LIST [ET_XACE_GENERATOR] */
struct S46 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type KL_STRING_ROUTINES */
struct S47 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8] */
struct S48 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type SPECIAL [STRING_8] */
struct S50 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [INTEGER_32] */
struct S51 {
	int id;
	T6 a1; /* count */
	T6 z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
struct S52 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [INTEGER_32] */
struct S53 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [STRING_8] */
struct S54 {
	int id;
};

/* Struct for type DS_LINKABLE [GEXACE_COMMAND] */
struct S55 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type KL_STANDARD_FILES */
struct S57 {
	int id;
};

/* Struct for type KL_STDERR_FILE */
struct S58 {
	int id;
	T14 a1; /* file_pointer */
	T0* a2; /* name */
	T6 a3; /* mode */
	T0* a4; /* last_string */
};

/* Struct for type KL_STDOUT_FILE */
struct S59 {
	int id;
	T14 a1; /* file_pointer */
	T0* a2; /* name */
	T6 a3; /* mode */
	T0* a4; /* last_string */
};

/* Struct for type KL_NULL_TEXT_OUTPUT_STREAM */
struct S60 {
	int id;
	T0* a1; /* name */
};

/* Struct for type DS_LINKABLE [STRING_8] */
struct S62 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type ARRAY [STRING_8] */
struct S63 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR] */
struct S64 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_LINKABLE [ET_XACE_GENERATOR] */
struct S65 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type UC_STRING */
struct S69 {
	int id;
	T6 a1; /* count */
	T6 a2; /* byte_count */
	T6 a3; /* internal_hash_code */
	T0* a4; /* area */
	T6 a5; /* last_byte_index_input */
	T6 a6; /* last_byte_index_result */
};

/* Struct for type KL_ANY_ROUTINES */
struct S70 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8] */
struct S71 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type STRING_TO_INTEGER_CONVERTOR */
struct S74 {
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

/* Struct for type ET_XACE_SYSTEM_CONFIG_PARSER */
struct S75 {
	int id;
	T0* a1; /* last_system */
	T0* a2; /* ast_factory */
	T1 a3; /* is_shallow */
	T0* a4; /* library_parser */
	T1 a5; /* is_ve */
	T0* a6; /* xml_parser */
	T0* a7; /* tree_pipe */
	T0* a8; /* xml_validator */
	T0* a9; /* xml_preprocessor */
	T0* a10; /* parsed_libraries */
	T0* a11; /* error_handler */
};

/* Struct for type ET_XACE_SYSTEM_CONFIG */
struct S76 {
	int id;
	T0* a1; /* system_name */
	T0* a2; /* root_class_name */
	T0* a3; /* creation_procedure_name */
	T0* a4; /* options */
	T0* a5; /* clusters */
	T0* a6; /* libraries */
};

/* Struct for type KL_TEXT_INPUT_FILE */
struct S77 {
	int id;
	T6 a1; /* mode */
	T0* a2; /* last_string */
	T0* a3; /* name */
	T0* a4; /* string_name */
	T0* a5; /* character_buffer */
	T1 a6; /* end_of_file */
	T14 a7; /* file_pointer */
	T1 a8; /* descriptor_available */
	T2 a9; /* last_character */
};

/* Struct for type KL_TEXT_OUTPUT_FILE */
struct S79 {
	int id;
	T6 a1; /* mode */
	T0* a2; /* name */
	T0* a3; /* string_name */
	T0* a4; /* last_string */
	T14 a5; /* file_pointer */
	T1 a6; /* descriptor_available */
};

/* Struct for type ET_XACE_LIBRARY_CONFIG_PARSER */
struct S80 {
	int id;
	T0* a1; /* last_library */
	T1 a2; /* is_shallow */
	T1 a3; /* is_ve */
	T0* a4; /* ast_factory */
	T0* a5; /* library_parser */
	T0* a6; /* xml_parser */
	T0* a7; /* tree_pipe */
	T0* a8; /* xml_validator */
	T0* a9; /* xml_preprocessor */
	T0* a10; /* parsed_libraries */
	T0* a11; /* error_handler */
};

/* Struct for type ET_XACE_LIBRARY_CONFIG */
struct S81 {
	int id;
	T0* a1; /* name */
	T0* a2; /* library_prefix */
	T0* a3; /* options */
	T0* a4; /* clusters */
	T0* a5; /* libraries */
};

/* Struct for type ET_XACE_PARSER */
struct S82 {
	int id;
	T0* a1; /* ast_factory */
	T0* a2; /* xml_parser */
	T0* a3; /* tree_pipe */
	T0* a4; /* xml_validator */
	T0* a5; /* xml_preprocessor */
	T0* a6; /* parsed_libraries */
	T0* a7; /* error_handler */
	T0* a8; /* library_parser */
	T1 a9; /* is_shallow */
	T1 a10; /* is_ve */
};

/* Struct for type UT_CANNOT_READ_FILE_ERROR */
struct S84 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type UT_CANNOT_WRITE_TO_FILE_ERROR */
struct S85 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type INTEGER_OVERFLOW_CHECKER */
struct S86 {
	int id;
	T0* a1; /* integer_overflow_state1 */
	T0* a2; /* integer_overflow_state2 */
	T0* a3; /* natural_overflow_state1 */
	T0* a4; /* natural_overflow_state2 */
};

/* Struct for type ET_XACE_AST_FACTORY */
struct S87 {
	int id;
};

/* Struct for type XM_DOCUMENT */
struct S88 {
	int id;
	T0* a1; /* root_element */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
	T0* a5; /* internal_cursor */
	T0* a6; /* parent */
};

/* Struct for type XM_ELEMENT */
struct S89 {
	int id;
	T0* a1; /* parent */
	T0* a2; /* name */
	T0* a3; /* namespace */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T6 a6; /* count */
	T0* a7; /* internal_cursor */
};

/* Struct for type XM_POSITION_TABLE */
struct S90 {
	int id;
	T0* a1; /* table */
};

/* Struct for type XM_TREE_CALLBACKS_PIPE */
struct S92 {
	int id;
	T0* a1; /* error */
	T0* a2; /* tree */
	T0* a3; /* start */
	T0* a4; /* last */
};

/* Struct for type XM_STOP_ON_ERROR_FILTER */
struct S93 {
	int id;
	T1 a1; /* has_error */
	T0* a2; /* last_error */
	T0* a3; /* next */
};

/* Struct for type XM_CALLBACKS_TO_TREE_FILTER */
struct S94 {
	int id;
	T0* a1; /* last_position_table */
	T0* a2; /* document */
	T0* a3; /* next */
	T0* a4; /* source_parser */
	T0* a5; /* current_element */
	T0* a6; /* namespace_cache */
};

/* Struct for type ET_XACE_VALIDATOR */
struct S95 {
	int id;
	T1 a1; /* has_error */
	T0* a2; /* error_handler */
};

/* Struct for type ET_XACE_PREPROCESSOR */
struct S96 {
	int id;
	T0* a1; /* variables */
	T0* a2; /* error_handler */
};

/* Struct for type DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8] */
struct S97 {
	int id;
	T6 a1; /* count */
	T6 a2; /* last_position */
	T6 a3; /* free_slot */
	T6 a4; /* position */
	T0* a5; /* key_equality_tester */
	T0* a6; /* internal_keys */
	T0* a7; /* equality_tester */
	T0* a8; /* internal_cursor */
	T6 a9; /* found_position */
	T0* a10; /* item_storage */
	T0* a11; /* key_storage */
	T0* a12; /* clashes */
	T6 a13; /* modulus */
	T0* a14; /* slots */
	T6 a15; /* capacity */
	T0* a16; /* special_item_routines */
	T0* a17; /* special_key_routines */
	T6 a18; /* slots_position */
	T6 a19; /* clashes_previous_position */
	T0* a20; /* hash_function */
};

/* Struct for type XM_EXPAT_PARSER_FACTORY */
struct S98 {
	int id;
};

/* Struct for type XM_EIFFEL_PARSER */
struct S99 {
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
	T0* a13; /* yyss */
	T0* a14; /* yytranslate */
	T0* a15; /* yyr1 */
	T0* a16; /* yytypes1 */
	T0* a17; /* yytypes2 */
	T0* a18; /* yydefact */
	T0* a19; /* yydefgoto */
	T0* a20; /* yypact */
	T0* a21; /* yypgoto */
	T0* a22; /* yytable */
	T0* a23; /* yycheck */
	T6 a24; /* yy_parsing_status */
	T6 a25; /* yy_suspended_yystacksize */
	T6 a26; /* yy_suspended_yystate */
	T6 a27; /* yy_suspended_yyn */
	T6 a28; /* yy_suspended_yychar1 */
	T6 a29; /* yy_suspended_index */
	T6 a30; /* yy_suspended_yyss_top */
	T6 a31; /* yy_suspended_yy_goto */
	T6 a32; /* yyssp */
	T6 a33; /* error_count */
	T1 a34; /* yy_lookahead_needed */
	T6 a35; /* yyerrstatus */
	T6 a36; /* last_token */
	T6 a37; /* yyvsp1 */
	T6 a38; /* yyvsp2 */
	T6 a39; /* yyvsp3 */
	T6 a40; /* yyvsp4 */
	T6 a41; /* yyvsp5 */
	T6 a42; /* yyvsp6 */
	T6 a43; /* yyvsp7 */
	T6 a44; /* yyvsp8 */
	T6 a45; /* yyvsp9 */
	T6 a46; /* yyvsp10 */
	T6 a47; /* yyvsp11 */
	T0* a48; /* last_string_value */
	T6 a49; /* yyvsc1 */
	T0* a50; /* yyvs1 */
	T0* a51; /* yyspecial_routines1 */
	T0* a52; /* last_any_value */
	T6 a53; /* yyvsc4 */
	T0* a54; /* yyvs4 */
	T0* a55; /* yyspecial_routines4 */
	T6 a56; /* yyvsc2 */
	T0* a57; /* yyvs2 */
	T0* a58; /* yyspecial_routines2 */
	T0* a59; /* yyvs11 */
	T6 a60; /* yyvsc11 */
	T0* a61; /* yyspecial_routines11 */
	T0* a62; /* yyvs10 */
	T0* a63; /* yyvs5 */
	T6 a64; /* yyvsc10 */
	T0* a65; /* yyspecial_routines10 */
	T6 a66; /* yyvsc3 */
	T0* a67; /* yyvs3 */
	T0* a68; /* yyspecial_routines3 */
	T0* a69; /* yyvs6 */
	T6 a70; /* yyvsc6 */
	T0* a71; /* yyspecial_routines6 */
	T0* a72; /* yyvs8 */
	T0* a73; /* yyvs7 */
	T6 a74; /* yyvsc8 */
	T0* a75; /* yyspecial_routines8 */
	T6 a76; /* yyvsc7 */
	T0* a77; /* yyspecial_routines7 */
	T0* a78; /* yyvs9 */
	T6 a79; /* yyvsc9 */
	T0* a80; /* yyspecial_routines9 */
	T6 a81; /* yyvsc5 */
	T0* a82; /* yyspecial_routines5 */
	T0* a83; /* dtd_callbacks */
};

/* Struct for type SPECIAL [NATURAL_8] */
struct S105 {
	int id;
	T6 a1; /* count */
	T8 z2[1]; /* item */
};

/* Struct for type UT_MESSAGE */
struct S106 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_NOT_XACE_FILE_ERROR */
struct S107 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_CLUSTERS */
struct S108 {
	int id;
	T0* a1; /* clusters */
};

/* Struct for type ET_XACE_MOUNTED_LIBRARIES */
struct S109 {
	int id;
	T0* a1; /* libraries */
};

/* Struct for type ET_XACE_OPTIONS */
struct S110 {
	int id;
	T0* a1; /* declared_namespace */
	T0* a2; /* declared_assertion */
	T0* a3; /* declared_external_runtime */
	T0* a4; /* declared_metadata_cache_path */
	T0* a5; /* declared_msil_assembly_compatibility */
	T0* a6; /* declared_msil_clr_version */
	T0* a7; /* declared_msil_culture */
	T0* a8; /* declared_msil_key_file_name */
	T0* a9; /* declared_shared_library_definition */
	T0* a10; /* declared_override_cluster */
	T0* a11; /* declared_abstract */
	T0* a12; /* declared_recursive */
	T0* a13; /* declared_read_only */
	T0* a14; /* declared_address_expression */
	T0* a15; /* declared_arguments */
	T0* a16; /* declared_array_optimization */
	T0* a17; /* declared_assembly */
	T0* a18; /* declared_callback */
	T0* a19; /* declared_case_insensitive */
	T0* a20; /* declared_check_vape */
	T0* a21; /* declared_clean */
	T0* a22; /* declared_cls_compliant */
	T0* a23; /* declared_component */
	T0* a24; /* declared_console_application */
	T0* a25; /* declared_create_keyword_extension */
	T0* a26; /* declared_culture */
	T0* a27; /* declared_c_compiler_options */
	T0* a28; /* declared_dead_code_removal */
	T0* a29; /* declared_debug_option */
	T0* a30; /* declared_debug_tag */
	T0* a31; /* declared_debugger */
	T0* a32; /* declared_document */
	T0* a33; /* declared_dotnet_naming_convention */
	T0* a34; /* declared_dynamic_runtime */
	T0* a35; /* declared_exception_trace */
	T0* a36; /* declared_exclude */
	T0* a37; /* declared_export_option */
	T0* a38; /* declared_finalize_option */
	T0* a39; /* declared_flat_fst_optimization */
	T6 a40; /* declared_fst_expansion_factor */
	T0* a41; /* declared_fst_optimization */
	T0* a42; /* declared_garbage_collector */
	T0* a43; /* declared_gc_info */
	T0* a44; /* declared_header */
	T6 a45; /* declared_heap_size */
	T0* a46; /* declared_high_memory_compiler */
	T0* a47; /* declared_il_verifiable */
	T0* a48; /* declared_include */
	T0* a49; /* declared_inlining */
	T6 a50; /* declared_inlining_size */
	T0* a51; /* declared_jumps_optimization */
	T0* a52; /* declared_layout */
	T0* a53; /* declared_layout_optimization */
	T0* a54; /* declared_leaves_optimization */
	T0* a55; /* declared_line_generation */
	T0* a56; /* declared_link */
	T0* a57; /* declared_linker */
	T0* a58; /* declared_linux_fpu_double_precision */
	T0* a59; /* declared_manifest_string_trace */
	T0* a60; /* declared_map */
	T0* a61; /* declared_msil_generation */
	T0* a62; /* declared_msil_generation_version */
	T0* a63; /* declared_multithreaded */
	T0* a64; /* declared_no_default_lib */
	T0* a65; /* declared_portable_code_generation */
	T0* a66; /* declared_precompiled */
	T0* a67; /* declared_prefix_option */
	T0* a68; /* declared_profile */
	T0* a69; /* declared_public_key_token */
	T0* a70; /* declared_reloads_optimization */
	T0* a71; /* declared_split */
	T6 a72; /* declared_stack_size */
	T0* a73; /* declared_storable */
	T0* a74; /* declared_storable_filename */
	T0* a75; /* declared_strip_option */
	T0* a76; /* declared_target */
	T0* a77; /* declared_trace */
	T0* a78; /* declared_use_cluster_name_as_namespace */
	T0* a79; /* declared_use_full_cluster_name_as_namespace */
	T0* a80; /* declared_verbose */
	T0* a81; /* declared_version */
	T0* a82; /* declared_visible_filename */
	T0* a83; /* declared_warning */
	T0* a84; /* declared_wedit */
	T0* a85; /* declared_full_class_checking */
	T0* a86; /* declared_syntax */
	T0* a87; /* declared_automatic_backup */
	T0* a88; /* declared_check_generic_creation_constraint */
	T0* a89; /* declared_enforce_unique_class_names */
	T0* a90; /* declared_force_32bits */
	T6 a91; /* declared_msil_classes_per_module */
	T0* a92; /* declared_msil_use_optimized_precompile */
	T0* a93; /* declared_old_verbatim_strings */
	T0* a94; /* declared_ecf_library */
};

/* Struct for type DS_HASH_SET_CURSOR [STRING_8] */
struct S111 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [STRING_8] */
struct S112 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type DS_HASH_SET [STRING_8] */
struct S113 {
	int id;
	T6 a1; /* count */
	T6 a2; /* position */
	T6 a3; /* capacity */
	T6 a4; /* modulus */
	T6 a5; /* last_position */
	T6 a6; /* free_slot */
	T0* a7; /* equality_tester */
	T6 a8; /* slots_position */
	T6 a9; /* clashes_previous_position */
	T0* a10; /* special_item_routines */
	T0* a11; /* item_storage */
	T0* a12; /* clashes */
	T0* a13; /* slots */
	T6 a14; /* found_position */
	T0* a15; /* internal_cursor */
	T0* a16; /* hash_function */
};

/* Struct for type DS_ARRAYED_LIST [STRING_8] */
struct S114 {
	int id;
	T6 a1; /* count */
	T0* a2; /* special_routines */
	T0* a3; /* storage */
	T6 a4; /* capacity */
	T0* a5; /* equality_tester */
	T0* a6; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST [ET_XACE_CLUSTER] */
struct S115 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type ET_XACE_CLUSTER */
struct S116 {
	int id;
	T0* a1; /* name */
	T0* a2; /* pathname */
	T1 a3; /* is_abstract */
	T0* a4; /* options */
	T0* a5; /* subclusters */
	T0* a6; /* libraries */
	T1 a7; /* is_relative */
	T0* a8; /* universe */
	T0* a9; /* library_prefix */
	T0* a10; /* cluster_prefix */
	T0* a11; /* class_options */
	T1 a12; /* is_recursive */
	T1 a13; /* is_read_only */
	T1 a14; /* overridden_constraint_enabled */
	T1 a15; /* scm_mapping_constraint_enabled */
	T1 a16; /* is_implicit */
	T1 a17; /* is_mounted */
	T0* a18; /* parent */
	T1 a19; /* is_override */
	T0* a20; /* provider_constraint */
	T0* a21; /* dependant_constraint */
};

/* Struct for type DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY] */
struct S117 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type ET_XACE_MOUNTED_LIBRARY */
struct S118 {
	int id;
	T0* a1; /* pathname */
	T0* a2; /* library_prefix */
	T0* a3; /* library */
	T0* a4; /* position */
	T1 a5; /* is_root */
};

/* Struct for type DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS] */
struct S119 {
	int id;
	T0* a1; /* first_cell */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS] */
struct S120 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type ET_XACE_CLASS_OPTIONS */
struct S121 {
	int id;
	T0* a1; /* feature_options */
	T0* a2; /* class_name */
	T0* a3; /* options */
};

/* Struct for type DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS] */
struct S122 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS] */
struct S123 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type ET_XACE_FEATURE_OPTIONS */
struct S124 {
	int id;
	T0* a1; /* feature_name */
	T0* a2; /* options */
};

/* Struct for type ET_XACE_EXTERNALS */
struct S125 {
	int id;
	T0* a1; /* c_compiler_options */
	T0* a2; /* include_directories */
	T0* a3; /* link_libraries */
};

/* Struct for type ET_XACE_OPTION_NAMES */
struct S126 {
	int id;
};

/* Struct for type DS_LINKED_LIST [ET_XACE_ASSEMBLY] */
struct S127 {
	int id;
	T6 a1; /* count */
	T0* a2; /* internal_cursor */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY] */
struct S128 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type ET_XACE_ASSEMBLY */
struct S129 {
	int id;
	T0* a1; /* tag */
	T0* a2; /* assembly_name */
	T0* a3; /* version */
	T0* a4; /* culture */
	T0* a5; /* public_key_token */
	T0* a6; /* class_prefix */
	T0* a7; /* assembly_pathname */
};

/* Struct for type KL_UNIX_FILE_SYSTEM */
struct S130 {
	int id;
};

/* Struct for type KL_EXECUTION_ENVIRONMENT */
struct S131 {
	int id;
};

/* Struct for type DS_LINKED_LIST [ET_XACE_CLUSTER] */
struct S132 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER] */
struct S133 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type TUPLE [ET_XACE_CLASS_OPTIONS] */
struct S134 {
	int id;
	T0* z1;
};

/* Struct for type PROCEDURE [ET_XACE_ECF_GENERATOR, TUPLE [ET_XACE_CLASS_OPTIONS]] */
struct S136 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*, T0*);
};

/* Struct for type TUPLE [ET_XACE_ECF_GENERATOR, INTEGER_32, KI_TEXT_OUTPUT_STREAM] */
struct S137 {
	int id;
	T0* z1;
	T6 z2;
	T0* z3;
};

/* Struct for type TUPLE [ET_XACE_FEATURE_OPTIONS] */
struct S138 {
	int id;
	T0* z1;
};

/* Struct for type PROCEDURE [ET_XACE_ECF_GENERATOR, TUPLE [ET_XACE_FEATURE_OPTIONS]] */
struct S139 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*, T0*);
};

/* Struct for type TUPLE [ET_XACE_ECF_GENERATOR, STRING_8, INTEGER_32, KI_TEXT_OUTPUT_STREAM] */
struct S140 {
	int id;
	T0* z1;
	T0* z2;
	T6 z3;
	T0* z4;
};

/* Struct for type ET_TOKEN_CONSTANTS */
struct S141 {
	int id;
};

/* Struct for type ET_SYSTEM */
struct S142 {
	int id;
	T0* a1; /* current_system */
	T0* a2; /* error_handler */
	T0* a3; /* ast_factory */
	T0* a4; /* external_include_pathnames */
	T0* a5; /* external_object_pathnames */
	T0* a6; /* external_library_pathnames */
	T1 a7; /* console_application_mode */
	T1 a8; /* alias_transition_mode */
	T1 a9; /* unknown_builtin_reported */
	T0* a10; /* null_processor */
	T0* a11; /* eiffel_preparser */
	T0* a12; /* master_class_checker */
	T0* a13; /* eiffel_parser */
	T0* a14; /* provider_checker */
	T0* a15; /* ancestor_builder */
	T0* a16; /* feature_flattener */
	T0* a17; /* interface_checker */
	T0* a18; /* implementation_checker */
	T0* a19; /* flat_implementation_checker */
	T0* a20; /* libraries */
	T0* a21; /* clusters */
	T0* a22; /* dotnet_assemblies */
	T0* a23; /* master_classes */
	T1 a24; /* preparse_shallow_mode */
	T1 a25; /* preparse_single_mode */
	T1 a26; /* preparse_multiple_mode */
	T0* a27; /* system_name */
	T0* a28; /* name */
	T0* a29; /* universe */
	T1 a30; /* use_attribute_keyword */
	T1 a31; /* use_note_keyword */
	T1 a32; /* use_reference_keyword */
	T1 a33; /* use_attached_keyword */
	T1 a34; /* use_detachable_keyword */
	T0* a35; /* any_type */
	T0* a36; /* any_parent */
	T0* a37; /* any_parents */
	T0* a38; /* any_clients */
	T0* a39; /* tuple_type */
	T0* a40; /* array_any_type */
	T0* a41; /* boolean_type */
	T0* a42; /* character_type */
	T0* a43; /* character_8_type */
	T0* a44; /* character_8_convert_feature */
	T0* a45; /* character_32_type */
	T0* a46; /* character_32_convert_feature */
	T0* a47; /* double_type */
	T0* a48; /* function_type */
	T0* a49; /* integer_type */
	T0* a50; /* integer_8_type */
	T0* a51; /* integer_8_convert_feature */
	T0* a52; /* integer_16_type */
	T0* a53; /* integer_16_convert_feature */
	T0* a54; /* integer_32_type */
	T0* a55; /* integer_32_convert_feature */
	T0* a56; /* integer_64_type */
	T0* a57; /* integer_64_convert_feature */
	T0* a58; /* natural_type */
	T0* a59; /* natural_8_type */
	T0* a60; /* natural_8_convert_feature */
	T0* a61; /* natural_16_type */
	T0* a62; /* natural_16_convert_feature */
	T0* a63; /* natural_32_type */
	T0* a64; /* natural_32_convert_feature */
	T0* a65; /* natural_64_type */
	T0* a66; /* natural_64_convert_feature */
	T0* a67; /* none_type */
	T0* a68; /* pointer_type */
	T0* a69; /* predicate_type */
	T0* a70; /* procedure_type */
	T0* a71; /* real_type */
	T0* a72; /* real_32_type */
	T0* a73; /* real_32_convert_feature */
	T0* a74; /* real_64_type */
	T0* a75; /* real_64_convert_feature */
	T0* a76; /* routine_type */
	T0* a77; /* special_any_type */
	T0* a78; /* string_8_type */
	T0* a79; /* string_8_convert_feature */
	T0* a80; /* string_32_type */
	T0* a81; /* string_32_convert_feature */
	T0* a82; /* string_type */
	T0* a83; /* system_object_type */
	T0* a84; /* system_object_parents */
	T0* a85; /* system_string_type */
	T0* a86; /* type_any_type */
	T0* a87; /* typed_pointer_any_type */
	T0* a88; /* wide_character_type */
	T6 a89; /* registered_class_count */
};

/* Struct for type XM_ATTRIBUTE */
struct S145 {
	int id;
	T0* a1; /* name */
	T0* a2; /* namespace */
	T0* a3; /* value */
	T0* a4; /* parent */
};

/* Struct for type DS_LINKED_LIST_CURSOR [XM_NODE] */
struct S146 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* next_cursor */
	T0* a4; /* container */
	T1 a5; /* before */
};

/* Struct for type DS_HASH_TABLE [INTEGER_32, STRING_8] */
struct S149 {
	int id;
	T6 a1; /* found_position */
	T6 a2; /* position */
	T0* a3; /* item_storage */
	T0* a4; /* key_equality_tester */
	T0* a5; /* internal_keys */
	T6 a6; /* free_slot */
	T6 a7; /* last_position */
	T6 a8; /* count */
	T6 a9; /* modulus */
	T6 a10; /* slots_position */
	T6 a11; /* clashes_previous_position */
	T0* a12; /* equality_tester */
	T0* a13; /* clashes */
	T0* a14; /* slots */
	T0* a15; /* key_storage */
	T6 a16; /* capacity */
	T0* a17; /* special_item_routines */
	T0* a18; /* special_key_routines */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type UNIX_FILE_INFO */
struct S152 {
	int id;
	T0* a1; /* buffered_file_info */
	T0* a2; /* file_name */
};

/* Struct for type SPECIAL [NATURAL_64] */
struct S153 {
	int id;
	T6 a1; /* count */
	T11 z2[1]; /* item */
};

/* Struct for type XM_NAMESPACE_RESOLVER */
struct S154 {
	int id;
	T0* a1; /* next */
	T0* a2; /* context */
	T0* a3; /* element_prefix */
	T0* a4; /* element_local_part */
	T1 a5; /* forward_xmlns */
	T0* a6; /* attributes_prefix */
	T0* a7; /* attributes_local_part */
	T0* a8; /* attributes_value */
};

/* Struct for type SPECIAL [XM_CALLBACKS_FILTER] */
struct S155 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [XM_CALLBACKS_FILTER] */
struct S156 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type XM_CALLBACKS_NULL */
struct S157 {
	int id;
};

/* Struct for type UT_TEMPLATE_EXPANDER */
struct S159 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [ET_XACE_LIBRARY_CONFIG, STRING_8] */
struct S161 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8] */
struct S163 {
	int id;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T6 a3; /* position */
};

/* Struct for type SPECIAL [ET_XACE_LIBRARY_CONFIG] */
struct S164 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY_CONFIG] */
struct S165 {
	int id;
};

/* Struct for type XM_EIFFEL_SCANNER */
struct S166 {
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
	T0* a40; /* last_error */
	T0* a41; /* start_conditions */
};

/* Struct for type XM_DEFAULT_POSITION */
struct S167 {
	int id;
	T0* a1; /* source_name */
	T6 a2; /* row */
	T6 a3; /* column */
	T6 a4; /* byte_index */
};

/* Struct for type DS_BILINKED_LIST [XM_POSITION] */
struct S169 {
	int id;
	T0* a1; /* first_cell */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
struct S170 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
};

/* Struct for type DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S171 {
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
	T0* a17; /* equality_tester */
	T0* a18; /* special_item_routines */
	T0* a19; /* special_key_routines */
	T0* a20; /* hash_function */
};

/* Struct for type XM_NULL_EXTERNAL_RESOLVER */
struct S173 {
	int id;
};

/* Struct for type SPECIAL [ANY] */
struct S174 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ANY] */
struct S175 {
	int id;
};

/* Struct for type XM_EIFFEL_PARSER_NAME */
struct S176 {
	int id;
	T1 a1; /* use_namespaces */
	T6 a2; /* count */
	T0* a3; /* first */
	T0* a4; /* second */
	T0* a5; /* tail */
};

/* Struct for type XM_EIFFEL_DECLARATION */
struct S177 {
	int id;
	T0* a1; /* version */
	T0* a2; /* encoding */
	T1 a3; /* stand_alone */
};

/* Struct for type XM_DTD_EXTERNAL_ID */
struct S178 {
	int id;
	T0* a1; /* system_id */
	T0* a2; /* public_id */
};

/* Struct for type DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
struct S179 {
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
	T0* a13; /* item_storage */
	T0* a14; /* special_item_routines */
	T0* a15; /* internal_cursor */
	T0* a16; /* hash_function */
};

/* Struct for type XM_DTD_ELEMENT_CONTENT */
struct S180 {
	int id;
	T0* a1; /* items */
	T2 a2; /* repetition */
	T0* a3; /* name */
	T2 a4; /* type */
	T1 a5; /* is_character_data_allowed */
};

/* Struct for type DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
struct S181 {
	int id;
	T0* a1; /* first_cell */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* internal_cursor */
};

/* Struct for type XM_DTD_ATTRIBUTE_CONTENT */
struct S182 {
	int id;
	T0* a1; /* name */
	T2 a2; /* type */
	T1 a3; /* is_list_type */
	T0* a4; /* enumeration_list */
	T2 a5; /* value */
	T0* a6; /* default_value */
};

/* Struct for type DS_BILINKED_LIST [STRING_8] */
struct S183 {
	int id;
	T0* a1; /* first_cell */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* equality_tester */
	T0* a5; /* internal_cursor */
};

/* Struct for type SPECIAL [XM_EIFFEL_PARSER_NAME] */
struct S184 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
struct S185 {
	int id;
};

/* Struct for type SPECIAL [XM_EIFFEL_DECLARATION] */
struct S186 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
struct S187 {
	int id;
};

/* Struct for type SPECIAL [BOOLEAN] */
struct S188 {
	int id;
	T6 a1; /* count */
	T1 z2[1]; /* item */
};

/* Struct for type SPECIAL [XM_DTD_EXTERNAL_ID] */
struct S189 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [BOOLEAN] */
struct S190 {
	int id;
};

/* Struct for type SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S191 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S192 {
	int id;
};

/* Struct for type SPECIAL [XM_DTD_ELEMENT_CONTENT] */
struct S193 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
struct S194 {
	int id;
};

/* Struct for type SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S196 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
struct S198 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S199 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
struct S200 {
	int id;
};

/* Struct for type SPECIAL [DS_BILINKED_LIST [STRING_8]] */
struct S201 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
struct S202 {
	int id;
};

/* Struct for type XM_EIFFEL_ENTITY_DEF */
struct S203 {
	int id;
	T0* a1; /* literal_name */
	T0* a2; /* value */
	T0* a3; /* resolver */
	T0* a4; /* external_id */
	T0* a5; /* character_entity */
	T0* a6; /* input_buffer */
	T1 a7; /* in_use */
	T0* a8; /* input_name */
	T0* a9; /* last_error */
	T0* a10; /* start_conditions */
	T6 a11; /* yy_start_state */
	T6 a12; /* yy_line */
	T6 a13; /* yy_column */
	T6 a14; /* yy_position */
	T6 a15; /* line */
	T6 a16; /* column */
	T6 a17; /* position */
	T1 a18; /* yy_more_flag */
	T6 a19; /* yy_more_len */
	T6 a20; /* yy_last_accepting_state */
	T6 a21; /* yy_last_accepting_cpos */
	T1 a22; /* yy_rejected */
	T6 a23; /* yy_state_count */
	T6 a24; /* yy_full_match */
	T6 a25; /* yy_lp */
	T6 a26; /* yy_looking_for_trail_begin */
	T6 a27; /* yy_full_lp */
	T6 a28; /* yy_full_state */
	T0* a29; /* yy_state_stack */
	T6 a30; /* yy_end */
	T6 a31; /* yy_start */
	T0* a32; /* yy_nxt */
	T0* a33; /* yy_chk */
	T0* a34; /* yy_base */
	T0* a35; /* yy_def */
	T0* a36; /* yy_ec */
	T0* a37; /* yy_meta */
	T0* a38; /* yy_accept */
	T0* a39; /* yy_content */
	T0* a40; /* yy_content_area */
	T6 a41; /* last_token */
	T0* a42; /* last_value */
	T0* a43; /* input_filter */
	T0* a44; /* input_stream */
	T0* a45; /* input_resolver */
	T0* a46; /* yy_acclist */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
struct S204 {
	int id;
};

/* Struct for type XM_DTD_CALLBACKS_NULL */
struct S206 {
	int id;
};

/* Struct for type XM_EIFFEL_SCANNER_DTD */
struct S207 {
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
	T0* a42; /* last_error */
	T0* a43; /* start_conditions */
};

/* Struct for type XM_EIFFEL_PE_ENTITY_DEF */
struct S209 {
	int id;
	T0* a1; /* resolver */
	T0* a2; /* external_id */
	T0* a3; /* literal_name */
	T0* a4; /* value */
	T0* a5; /* character_entity */
	T0* a6; /* input_buffer */
	T1 a7; /* in_use */
	T0* a8; /* input_name */
	T0* a9; /* last_error */
	T0* a10; /* start_conditions */
	T6 a11; /* yy_start_state */
	T6 a12; /* yy_line */
	T6 a13; /* yy_column */
	T6 a14; /* yy_position */
	T6 a15; /* line */
	T6 a16; /* column */
	T6 a17; /* position */
	T1 a18; /* yy_more_flag */
	T6 a19; /* yy_more_len */
	T6 a20; /* yy_last_accepting_state */
	T6 a21; /* yy_last_accepting_cpos */
	T1 a22; /* yy_rejected */
	T6 a23; /* yy_state_count */
	T6 a24; /* yy_full_match */
	T6 a25; /* yy_lp */
	T6 a26; /* yy_looking_for_trail_begin */
	T6 a27; /* yy_full_lp */
	T6 a28; /* yy_full_state */
	T0* a29; /* yy_state_stack */
	T6 a30; /* yy_end */
	T6 a31; /* yy_start */
	T1 a32; /* pre_sent */
	T1 a33; /* post_sent */
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
	T0* a44; /* last_value */
	T0* a45; /* input_filter */
	T0* a46; /* input_stream */
	T0* a47; /* input_resolver */
	T0* a48; /* yy_acclist */
};

/* Struct for type ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR */
struct S210 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_BOOLEAN_EXPECTED_ERROR */
struct S211 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR */
struct S212 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR */
struct S213 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR */
struct S214 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING */
struct S215 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_WRONG_ROOT_ELEMENT_ERROR */
struct S216 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_MISSING_ATTRIBUTE_ERROR */
struct S217 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_MISSING_ELEMENT_ERROR */
struct S218 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING */
struct S219 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_UNKNOWN_ELEMENT_ERROR */
struct S220 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING */
struct S221 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_UNKNOWN_OPTION_NAME_WARNING */
struct S222 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type KL_OPERATING_SYSTEM */
struct S223 {
	int id;
};

/* Struct for type DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S226 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S227 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_PAIR [XM_POSITION, XM_NODE] */
struct S228 {
	int id;
	T0* a1; /* first */
	T0* a2; /* second */
};

/* Struct for type ARRAY [INTEGER_32] */
struct S229 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type UC_UTF8_ROUTINES */
struct S230 {
	int id;
};

/* Struct for type UC_UTF8_STRING */
struct S232 {
	int id;
	T6 a1; /* count */
	T0* a2; /* area */
	T6 a3; /* byte_count */
	T6 a4; /* internal_hash_code */
	T6 a5; /* last_byte_index_input */
	T6 a6; /* last_byte_index_result */
};

/* Struct for type XM_EIFFEL_INPUT_STREAM */
struct S233 {
	int id;
	T0* a1; /* last_string */
	T6 a2; /* encoding */
	T0* a3; /* impl */
	T0* a4; /* utf_queue */
};

/* Struct for type KL_INTEGER_ROUTINES */
struct S234 {
	int id;
};

/* Struct for type KL_PLATFORM */
struct S235 {
	int id;
};

/* Struct for type UT_TRISTATE */
struct S236 {
	int id;
	T2 a1; /* value */
};

/* Struct for type SPECIAL [ET_XACE_CLUSTER] */
struct S237 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER] */
struct S238 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [ET_XACE_CLUSTER] */
struct S239 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type SPECIAL [ET_XACE_MOUNTED_LIBRARY] */
struct S240 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY] */
struct S241 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [ET_XACE_MOUNTED_LIBRARY] */
struct S242 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_LINKABLE [ET_XACE_CLASS_OPTIONS] */
struct S243 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_LINKABLE [ET_XACE_FEATURE_OPTIONS] */
struct S244 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_LINKABLE [ET_XACE_ASSEMBLY] */
struct S245 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type EXECUTION_ENVIRONMENT */
struct S246 {
	int id;
};

/* Struct for type DS_LINKABLE [ET_XACE_CLUSTER] */
struct S247 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type ET_ERROR_HANDLER */
struct S248 {
	int id;
	T0* a1; /* error_file */
	T0* a2; /* warning_file */
	T0* a3; /* info_file */
};

/* Struct for type ET_AST_FACTORY */
struct S249 {
	int id;
};

/* Struct for type ET_AST_NULL_PROCESSOR */
struct S250 {
	int id;
};

/* Struct for type ET_ADAPTED_LIBRARIES */
struct S252 {
	int id;
	T0* a1; /* libraries */
};

/* Struct for type ET_CLUSTERS */
struct S253 {
	int id;
	T0* a1; /* clusters */
};

/* Struct for type ET_ADAPTED_DOTNET_ASSEMBLIES */
struct S254 {
	int id;
	T0* a1; /* dotnet_assemblies */
};

/* Struct for type DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME] */
struct S255 {
	int id;
	T6 a1; /* found_position */
	T0* a2; /* item_storage */
	T0* a3; /* key_equality_tester */
	T0* a4; /* internal_keys */
	T6 a5; /* position */
	T6 a6; /* last_position */
	T6 a7; /* capacity */
	T6 a8; /* slots_position */
	T6 a9; /* count */
	T0* a10; /* equality_tester */
	T6 a11; /* modulus */
	T6 a12; /* clashes_previous_position */
	T0* a13; /* clashes */
	T0* a14; /* slots */
	T0* a15; /* key_storage */
	T6 a16; /* free_slot */
	T0* a17; /* special_item_routines */
	T0* a18; /* special_key_routines */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type ET_CLASS_NAME_TESTER */
struct S256 {
	int id;
};

/* Struct for type ET_MASTER_CLASS */
struct S259 {
	int id;
	T0* a1; /* name */
	T0* a2; /* universe */
	T0* a3; /* named_base_class */
	T0* a4; /* other_local_override_classes */
	T0* a5; /* other_local_non_override_classes */
	T0* a6; /* other_local_ignored_classes */
	T0* a7; /* other_imported_classes */
	T0* a8; /* other_overriding_classes */
	T0* a9; /* intrinsic_class */
	T0* a10; /* mapped_class */
	T1 a11; /* is_modified */
	T1 a12; /* is_marked */
	T0* a13; /* first_local_ignored_class */
	T0* a14; /* first_local_override_class */
	T0* a15; /* first_local_non_override_class */
	T0* a16; /* first_imported_class */
	T0* a17; /* first_overriding_class */
};

/* Struct for type ET_CLIENT */
struct S260 {
	int id;
	T0* a1; /* name */
	T0* a2; /* named_base_class */
};

/* Struct for type ET_CLASS_TYPE */
struct S261 {
	int id;
	T0* a1; /* type_mark */
	T0* a2; /* name */
	T0* a3; /* named_base_class */
};

/* Struct for type ET_PARENT */
struct S264 {
	int id;
	T0* a1; /* type */
	T0* a2; /* renames */
	T0* a3; /* exports */
	T0* a4; /* undefines */
	T0* a5; /* redefines */
	T0* a6; /* selects */
	T0* a7; /* end_keyword */
};

/* Struct for type ET_PARENT_LIST */
struct S269 {
	int id;
	T0* a1; /* inherit_keyword */
	T6 a2; /* count */
	T0* a3; /* storage */
};

/* Struct for type ET_CLIENT_LIST */
struct S271 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
};

/* Struct for type ET_TUPLE_TYPE */
struct S273 {
	int id;
	T0* a1; /* type_mark */
	T0* a2; /* tuple_keyword */
	T0* a3; /* actual_parameters */
	T0* a4; /* named_base_class */
};

/* Struct for type ET_ACTUAL_PARAMETER_LIST */
struct S274 {
	int id;
	T0* a1; /* left_bracket */
	T0* a2; /* right_bracket */
	T6 a3; /* count */
	T0* a4; /* storage */
};

/* Struct for type ET_GENERIC_CLASS_TYPE */
struct S276 {
	int id;
	T0* a1; /* type_mark */
	T0* a2; /* name */
	T0* a3; /* actual_parameters */
	T0* a4; /* named_base_class */
};

/* Struct for type ET_BUILTIN_CONVERT_FEATURE */
struct S277 {
	int id;
	T0* a1; /* name */
	T0* a2; /* types */
	T0* a3; /* type */
};

/* Struct for type ET_CLASS */
struct S279 {
	int id;
	T1 a1; /* is_ignored */
	T0* a2; /* group */
	T0* a3; /* name */
	T6 a4; /* id */
	T0* a5; /* ancestors */
	T0* a6; /* queries */
	T0* a7; /* procedures */
	T0* a8; /* class_keyword */
	T0* a9; /* end_keyword */
	T0* a10; /* named_base_class */
	T6 a11; /* time_stamp */
	T8 a12; /* class_code */
	T1 a13; /* is_marked */
	T1 a14; /* is_parsed */
	T1 a15; /* has_syntax_error */
	T1 a16; /* ancestors_built */
	T1 a17; /* has_ancestors_error */
	T1 a18; /* features_flattened */
	T1 a19; /* has_flattening_error */
	T1 a20; /* interface_checked */
	T1 a21; /* has_interface_error */
	T1 a22; /* implementation_checked */
	T1 a23; /* has_implementation_error */
};

/* Struct for type ET_NONE_GROUP */
struct S280 {
	int id;
	T0* a1; /* name */
	T0* a2; /* universe */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [INTEGER_32, STRING_8] */
struct S282 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [INTEGER_32, STRING_8] */
struct S284 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type XM_NAMESPACE_RESOLVER_CONTEXT */
struct S286 {
	int id;
	T0* a1; /* context */
};

/* Struct for type DS_LINKED_QUEUE [STRING_8] */
struct S288 {
	int id;
	T0* a1; /* first_cell */
	T6 a2; /* count */
	T0* a3; /* last_cell */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8] */
struct S289 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type XM_EIFFEL_CHARACTER_ENTITY */
struct S290 {
	int id;
	T6 a1; /* code */
};

/* Struct for type YY_BUFFER */
struct S291 {
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
struct S292 {
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
struct S295 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
};

/* Struct for type DS_BILINKABLE [XM_POSITION] */
struct S296 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_POSITION] */
struct S297 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type DS_LINKABLE [XM_EIFFEL_SCANNER] */
struct S298 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type SPECIAL [XM_EIFFEL_ENTITY_DEF] */
struct S299 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S300 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S302 {
	int id;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T6 a3; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
struct S304 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
struct S305 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
struct S306 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
struct S307 {
	int id;
	T0* a1; /* first_cell */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
struct S308 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
struct S309 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [STRING_8] */
struct S310 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_BILINKABLE [STRING_8] */
struct S311 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING */
struct S312 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_INVALID_EXPRESSION_ERROR */
struct S313 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type UC_UNICODE_ROUTINES */
struct S314 {
	int id;
};

/* Struct for type KL_ARRAY_ROUTINES [INTEGER_32] */
struct S315 {
	int id;
};

/* Struct for type DS_LINKED_QUEUE [CHARACTER_8] */
struct S322 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
};

/* Struct for type UC_UTF16_ROUTINES */
struct S323 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST [ET_ADAPTED_LIBRARY] */
struct S325 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST [ET_CLUSTER] */
struct S326 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST [ET_ADAPTED_DOTNET_ASSEMBLY] */
struct S327 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
};

/* Struct for type SPECIAL [ET_MASTER_CLASS] */
struct S328 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [ET_MASTER_CLASS, ET_CLASS_NAME] */
struct S330 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type SPECIAL [ET_CLASS_NAME] */
struct S332 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [ET_MASTER_CLASS, ET_CLASS_NAME] */
struct S333 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_MASTER_CLASS] */
struct S334 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_CLASS_NAME] */
struct S335 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST [ET_CLASS] */
struct S336 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T6 a4; /* count */
	T0* a5; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST [ET_MASTER_CLASS] */
struct S337 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T6 a4; /* count */
	T0* a5; /* internal_cursor */
	T0* a6; /* equality_tester */
};

/* Struct for type TUPLE [ET_MASTER_CLASS] */
struct S338 {
	int id;
	T0* z1;
};

/* Struct for type PROCEDURE [ET_MASTER_CLASS, TUPLE [ET_MASTER_CLASS]] */
struct S339 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*, T0*);
};

/* Struct for type ET_KEYWORD */
struct S340 {
	int id;
	T2 a1; /* code */
	T0* a2; /* text */
	T6 a3; /* compressed_position */
};

/* Struct for type SPECIAL [ET_PARENT_ITEM] */
struct S342 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_PARENT_ITEM] */
struct S343 {
	int id;
};

/* Struct for type SPECIAL [ET_CLIENT_ITEM] */
struct S344 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_CLIENT_ITEM] */
struct S345 {
	int id;
};

/* Struct for type ET_IDENTIFIER */
struct S346 {
	int id;
	T6 a1; /* hash_code */
	T0* a2; /* name */
	T6 a3; /* compressed_position */
};

/* Struct for type ET_SYMBOL */
struct S347 {
	int id;
	T2 a1; /* code */
	T6 a2; /* compressed_position */
};

/* Struct for type ET_BRACKET_SYMBOL */
struct S348 {
	int id;
	T2 a1; /* code */
	T6 a2; /* compressed_position */
};

/* Struct for type SPECIAL [ET_ACTUAL_PARAMETER_ITEM] */
struct S350 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_ACTUAL_PARAMETER_ITEM] */
struct S351 {
	int id;
};

/* Struct for type ET_BRACED_TYPE_LIST */
struct S354 {
	int id;
	T0* a1; /* left_brace */
	T0* a2; /* right_brace */
	T6 a3; /* count */
	T0* a4; /* storage */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [INTEGER_32, STRING_8] */
struct S355 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S357 {
	int id;
	T6 a1; /* count */
	T0* a2; /* last_cell */
	T0* a3; /* first_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S358 {
	int id;
	T1 a1; /* before */
	T0* a2; /* current_cell */
	T0* a3; /* next_cursor */
	T0* a4; /* container */
	T1 a5; /* after */
};

/* Struct for type DS_LINKABLE [INTEGER_32] */
struct S360 {
	int id;
	T6 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S361 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
struct S362 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
struct S363 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type C_STRING */
struct S364 {
	int id;
	T6 a1; /* count */
	T0* a2; /* managed_data */
};

/* Struct for type DS_HASH_SET [XM_NAMESPACE] */
struct S365 {
	int id;
	T6 a1; /* position */
	T0* a2; /* item_storage */
	T0* a3; /* equality_tester */
	T6 a4; /* last_position */
	T6 a5; /* capacity */
	T6 a6; /* slots_position */
	T6 a7; /* count */
	T6 a8; /* modulus */
	T6 a9; /* clashes_previous_position */
	T6 a10; /* free_slot */
	T6 a11; /* found_position */
	T0* a12; /* clashes */
	T0* a13; /* slots */
	T0* a14; /* special_item_routines */
	T0* a15; /* internal_cursor */
	T0* a16; /* hash_function */
};

/* Struct for type XM_COMMENT */
struct S366 {
	int id;
	T0* a1; /* data */
	T0* a2; /* parent */
};

/* Struct for type XM_PROCESSING_INSTRUCTION */
struct S367 {
	int id;
	T0* a1; /* target */
	T0* a2; /* data */
	T0* a3; /* parent */
};

/* Struct for type XM_CHARACTER_DATA */
struct S368 {
	int id;
	T0* a1; /* content */
	T0* a2; /* parent */
};

/* Struct for type XM_NAMESPACE */
struct S369 {
	int id;
	T0* a1; /* uri */
	T0* a2; /* ns_prefix */
};

/* Struct for type KL_WINDOWS_FILE_SYSTEM */
struct S371 {
	int id;
	T2 a1; /* secondary_directory_separator */
};

/* Struct for type KL_STRING_INPUT_STREAM */
struct S374 {
	int id;
	T1 a1; /* end_of_input */
	T2 a2; /* last_character */
	T0* a3; /* last_string */
	T0* a4; /* string */
	T6 a5; /* location */
};

/* Struct for type DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S375 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type ET_BASE_TYPE_LIST */
struct S378 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
};

/* Struct for type ET_QUERY_LIST */
struct S379 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
};

/* Struct for type ET_PROCEDURE_LIST */
struct S380 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
};

/* Struct for type ET_UNKNOWN_GROUP */
struct S381 {
	int id;
	T0* a1; /* name */
};

/* Struct for type ET_CLASS_CODES */
struct S382 {
	int id;
};

/* Struct for type KL_CHARACTER_BUFFER */
struct S383 {
	int id;
	T0* a1; /* as_special */
	T0* a2; /* area */
};

/* Struct for type SPECIAL [ARRAY [INTEGER_32]] */
struct S384 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
struct S385 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_LINKABLE [CHARACTER_8] */
struct S386 {
	int id;
	T2 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_ADAPTED_LIBRARY] */
struct S387 {
	int id;
};

/* Struct for type SPECIAL [ET_ADAPTED_LIBRARY] */
struct S389 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_LIBRARY] */
struct S390 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_CLUSTER] */
struct S391 {
	int id;
};

/* Struct for type SPECIAL [ET_CLUSTER] */
struct S392 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [ET_CLUSTER] */
struct S393 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_ADAPTED_DOTNET_ASSEMBLY] */
struct S394 {
	int id;
};

/* Struct for type SPECIAL [ET_ADAPTED_DOTNET_ASSEMBLY] */
struct S396 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_DOTNET_ASSEMBLY] */
struct S397 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [ET_MASTER_CLASS, ET_CLASS_NAME] */
struct S398 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_CLASS] */
struct S399 {
	int id;
};

/* Struct for type SPECIAL [ET_CLASS] */
struct S400 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [ET_CLASS] */
struct S401 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S405 {
	int id;
	T0* a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
};

/* Struct for type DS_LINKABLE [XM_NODE] */
struct S408 {
	int id;
	T0* a1; /* right */
	T0* a2; /* item */
};

/* Struct for type XM_NODE_TYPER */
struct S410 {
	int id;
	T0* a1; /* xml_attribute */
	T0* a2; /* element */
	T0* a3; /* composite */
	T0* a4; /* document */
	T0* a5; /* character_data */
	T0* a6; /* processing_instruction */
	T0* a7; /* comment */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [ET_MASTER_CLASS] */
struct S414 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type MANAGED_POINTER */
struct S415 {
	int id;
	T1 a1; /* is_shared */
	T14 a2; /* item */
	T6 a3; /* count */
};

/* Struct for type SPECIAL [XM_NAMESPACE] */
struct S416 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_EQUALITY_TESTER [XM_NAMESPACE] */
struct S417 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [XM_NAMESPACE] */
struct S418 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
struct S419 {
	int id;
};

/* Struct for type DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME] */
struct S420 {
	int id;
	T6 a1; /* found_position */
	T0* a2; /* item_storage */
	T6 a3; /* position */
	T0* a4; /* key_equality_tester */
	T0* a5; /* internal_keys */
	T6 a6; /* last_position */
	T6 a7; /* capacity */
	T6 a8; /* slots_position */
	T6 a9; /* count */
	T0* a10; /* equality_tester */
	T6 a11; /* modulus */
	T6 a12; /* clashes_previous_position */
	T0* a13; /* clashes */
	T0* a14; /* slots */
	T0* a15; /* key_storage */
	T6 a16; /* free_slot */
	T0* a17; /* special_item_routines */
	T0* a18; /* special_key_routines */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type SPECIAL [ET_BASE_TYPE] */
struct S423 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_BASE_TYPE] */
struct S424 {
	int id;
};

/* Struct for type SPECIAL [ET_QUERY] */
struct S426 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_QUERY] */
struct S427 {
	int id;
};

/* Struct for type SPECIAL [ET_PROCEDURE] */
struct S429 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_PROCEDURE] */
struct S430 {
	int id;
};

/* Struct for type EXCEPTIONS */
struct S432 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [NATURAL_8, ET_CLASS_NAME] */
struct S434 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [NATURAL_8, ET_CLASS_NAME] */
struct S436 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [NATURAL_8] */
struct S437 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [NATURAL_8, ET_CLASS_NAME] */
struct S438 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type STRING_SEARCHER */
struct S439 {
	int id;
	T0* a1; /* deltas */
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
extern T17 GE_default17;
extern T21 GE_default21;
extern T22 GE_default22;
extern T23 GE_default23;
extern T24 GE_default24;
extern T25 GE_default25;
extern T27 GE_default27;
extern T28 GE_default28;
extern T30 GE_default30;
extern T31 GE_default31;
extern T32 GE_default32;
extern T33 GE_default33;
extern T34 GE_default34;
extern T36 GE_default36;
extern T40 GE_default40;
extern T41 GE_default41;
extern T43 GE_default43;
extern T44 GE_default44;
extern T45 GE_default45;
extern T46 GE_default46;
extern T47 GE_default47;
extern T48 GE_default48;
extern T50 GE_default50;
extern T51 GE_default51;
extern T52 GE_default52;
extern T53 GE_default53;
extern T54 GE_default54;
extern T55 GE_default55;
extern T57 GE_default57;
extern T58 GE_default58;
extern T59 GE_default59;
extern T60 GE_default60;
extern T62 GE_default62;
extern T63 GE_default63;
extern T64 GE_default64;
extern T65 GE_default65;
extern T69 GE_default69;
extern T70 GE_default70;
extern T71 GE_default71;
extern T72 GE_default72;
extern T74 GE_default74;
extern T75 GE_default75;
extern T76 GE_default76;
extern T77 GE_default77;
extern T79 GE_default79;
extern T80 GE_default80;
extern T81 GE_default81;
extern T82 GE_default82;
extern T84 GE_default84;
extern T85 GE_default85;
extern T86 GE_default86;
extern T87 GE_default87;
extern T88 GE_default88;
extern T89 GE_default89;
extern T90 GE_default90;
extern T92 GE_default92;
extern T93 GE_default93;
extern T94 GE_default94;
extern T95 GE_default95;
extern T96 GE_default96;
extern T97 GE_default97;
extern T98 GE_default98;
extern T99 GE_default99;
extern T105 GE_default105;
extern T106 GE_default106;
extern T107 GE_default107;
extern T108 GE_default108;
extern T109 GE_default109;
extern T110 GE_default110;
extern T111 GE_default111;
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
extern T124 GE_default124;
extern T125 GE_default125;
extern T126 GE_default126;
extern T127 GE_default127;
extern T128 GE_default128;
extern T129 GE_default129;
extern T130 GE_default130;
extern T131 GE_default131;
extern T132 GE_default132;
extern T133 GE_default133;
extern T134 GE_default134;
extern T136 GE_default136;
extern T137 GE_default137;
extern T138 GE_default138;
extern T139 GE_default139;
extern T140 GE_default140;
extern T141 GE_default141;
extern T142 GE_default142;
extern T145 GE_default145;
extern T146 GE_default146;
extern T149 GE_default149;
extern T152 GE_default152;
extern T153 GE_default153;
extern T154 GE_default154;
extern T155 GE_default155;
extern T156 GE_default156;
extern T157 GE_default157;
extern T159 GE_default159;
extern T161 GE_default161;
extern T163 GE_default163;
extern T164 GE_default164;
extern T165 GE_default165;
extern T166 GE_default166;
extern T167 GE_default167;
extern T169 GE_default169;
extern T170 GE_default170;
extern T171 GE_default171;
extern T173 GE_default173;
extern T174 GE_default174;
extern T175 GE_default175;
extern T176 GE_default176;
extern T177 GE_default177;
extern T178 GE_default178;
extern T179 GE_default179;
extern T180 GE_default180;
extern T181 GE_default181;
extern T182 GE_default182;
extern T183 GE_default183;
extern T184 GE_default184;
extern T185 GE_default185;
extern T186 GE_default186;
extern T187 GE_default187;
extern T188 GE_default188;
extern T189 GE_default189;
extern T190 GE_default190;
extern T191 GE_default191;
extern T192 GE_default192;
extern T193 GE_default193;
extern T194 GE_default194;
extern T196 GE_default196;
extern T198 GE_default198;
extern T199 GE_default199;
extern T200 GE_default200;
extern T201 GE_default201;
extern T202 GE_default202;
extern T203 GE_default203;
extern T204 GE_default204;
extern T206 GE_default206;
extern T207 GE_default207;
extern T209 GE_default209;
extern T210 GE_default210;
extern T211 GE_default211;
extern T212 GE_default212;
extern T213 GE_default213;
extern T214 GE_default214;
extern T215 GE_default215;
extern T216 GE_default216;
extern T217 GE_default217;
extern T218 GE_default218;
extern T219 GE_default219;
extern T220 GE_default220;
extern T221 GE_default221;
extern T222 GE_default222;
extern T223 GE_default223;
extern T226 GE_default226;
extern T227 GE_default227;
extern T228 GE_default228;
extern T229 GE_default229;
extern T230 GE_default230;
extern T232 GE_default232;
extern T233 GE_default233;
extern T234 GE_default234;
extern T235 GE_default235;
extern T236 GE_default236;
extern T237 GE_default237;
extern T238 GE_default238;
extern T239 GE_default239;
extern T240 GE_default240;
extern T241 GE_default241;
extern T242 GE_default242;
extern T243 GE_default243;
extern T244 GE_default244;
extern T245 GE_default245;
extern T246 GE_default246;
extern T247 GE_default247;
extern T248 GE_default248;
extern T249 GE_default249;
extern T250 GE_default250;
extern T252 GE_default252;
extern T253 GE_default253;
extern T254 GE_default254;
extern T255 GE_default255;
extern T256 GE_default256;
extern T259 GE_default259;
extern T260 GE_default260;
extern T261 GE_default261;
extern T264 GE_default264;
extern T269 GE_default269;
extern T271 GE_default271;
extern T273 GE_default273;
extern T274 GE_default274;
extern T276 GE_default276;
extern T277 GE_default277;
extern T279 GE_default279;
extern T280 GE_default280;
extern T282 GE_default282;
extern T284 GE_default284;
extern T285 GE_default285;
extern T286 GE_default286;
extern T288 GE_default288;
extern T289 GE_default289;
extern T290 GE_default290;
extern T291 GE_default291;
extern T292 GE_default292;
extern T295 GE_default295;
extern T296 GE_default296;
extern T297 GE_default297;
extern T298 GE_default298;
extern T299 GE_default299;
extern T300 GE_default300;
extern T302 GE_default302;
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
extern T322 GE_default322;
extern T323 GE_default323;
extern T325 GE_default325;
extern T326 GE_default326;
extern T327 GE_default327;
extern T328 GE_default328;
extern T330 GE_default330;
extern T332 GE_default332;
extern T333 GE_default333;
extern T334 GE_default334;
extern T335 GE_default335;
extern T336 GE_default336;
extern T337 GE_default337;
extern T338 GE_default338;
extern T339 GE_default339;
extern T340 GE_default340;
extern T342 GE_default342;
extern T343 GE_default343;
extern T344 GE_default344;
extern T345 GE_default345;
extern T346 GE_default346;
extern T347 GE_default347;
extern T348 GE_default348;
extern T350 GE_default350;
extern T351 GE_default351;
extern T354 GE_default354;
extern T355 GE_default355;
extern T357 GE_default357;
extern T358 GE_default358;
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
extern T371 GE_default371;
extern T374 GE_default374;
extern T375 GE_default375;
extern T378 GE_default378;
extern T379 GE_default379;
extern T380 GE_default380;
extern T381 GE_default381;
extern T382 GE_default382;
extern T383 GE_default383;
extern T384 GE_default384;
extern T385 GE_default385;
extern T386 GE_default386;
extern T387 GE_default387;
extern T389 GE_default389;
extern T390 GE_default390;
extern T391 GE_default391;
extern T392 GE_default392;
extern T393 GE_default393;
extern T394 GE_default394;
extern T396 GE_default396;
extern T397 GE_default397;
extern T398 GE_default398;
extern T399 GE_default399;
extern T400 GE_default400;
extern T401 GE_default401;
extern T405 GE_default405;
extern T408 GE_default408;
extern T410 GE_default410;
extern T414 GE_default414;
extern T415 GE_default415;
extern T416 GE_default416;
extern T417 GE_default417;
extern T418 GE_default418;
extern T419 GE_default419;
extern T420 GE_default420;
extern T423 GE_default423;
extern T424 GE_default424;
extern T426 GE_default426;
extern T427 GE_default427;
extern T429 GE_default429;
extern T430 GE_default430;
extern T431 GE_default431;
extern T432 GE_default432;
extern T434 GE_default434;
extern T436 GE_default436;
extern T437 GE_default437;
extern T438 GE_default438;
extern T439 GE_default439;

extern T0* GE_ms8(char* s, T6 c);
extern T0* GE_ms32(char* s, T6 c);
/* Call to UT_ERROR.default_message */
extern T0* T35x2653(T0* C);
/* Call to ET_XACE_GENERATOR.default_library_output_filename */
extern T0* T42x2677(T0* C);
/* Call to ET_XACE_GENERATOR.default_system_output_filename */
extern T0* T42x2676(T0* C);
/* Call to XM_NODE.parent */
extern T0* T147x5983(T0* C);
/* Call to XM_EIFFEL_SCANNER.start_condition */
extern T6 T166x10159(T0* C);
/* Call to XM_EIFFEL_SCANNER.is_applicable_encoding */
extern T1 T166x10034T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.end_of_file */
extern T1 T166x10164(T0* C);
/* Call to XM_EIFFEL_SCANNER.last_value */
extern T0* T166x10045(T0* C);
/* Call to XM_EIFFEL_SCANNER.last_token */
extern T6 T166x10155(T0* C);
/* Call to XM_EIFFEL_SCANNER.error_position */
extern T0* T166x10043(T0* C);
/* Call to GEXACE_COMMAND.set_xace_filename */
extern void T29x2100T0(T0* C, T0* a1);
/* Call to GEXACE_COMMAND.execute */
extern void T29x2105(T0* C);
/* Call to ET_XACE_GENERATOR.generate_library */
extern void T42x2683T0T0(T0* C, T0* a1, T0* a2);
/* Call to ET_XACE_GENERATOR.generate_system */
extern void T42x2682T0T0(T0* C, T0* a1, T0* a2);
/* Call to ET_XACE_GENERATOR.set_shallow */
extern void T42x2681T1(T0* C, T1 a1);
/* Call to XM_CALLBACKS_FILTER.set_next */
extern void T100x6137T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_xml_declaration */
extern void T101x6193T0T0T1(T0* C, T0* a1, T0* a2, T1 a3);
/* Call to XM_CALLBACKS.on_error */
extern void T101x6194T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_start_tag_finish */
extern void T101x6199(T0* C);
/* Call to XM_CALLBACKS.on_finish */
extern void T101x6192(T0* C);
/* Call to XM_CALLBACKS.on_attribute */
extern void T101x6198T0T0T0T0(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* Call to XM_CALLBACKS.on_end_tag */
extern void T101x6200T0T0T0(T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_start_tag */
extern void T101x6197T0T0T0(T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_content */
extern void T101x6201T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_processing_instruction */
extern void T101x6195T0T0(T0* C, T0* a1, T0* a2);
/* Call to XM_CALLBACKS.on_comment */
extern void T101x6196T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_start */
extern void T101x6191(T0* C);
/* Call to XM_NODE.node_set_parent */
extern void T147x5991T0(T0* C, T0* a1);
/* Call to XM_NODE.process */
extern void T147x5993T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.close_input */
extern void T166x10030(T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T166x10029T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.set_encoding */
extern void T166x10035T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T166x10026(T0* C);
/* Call to XM_EIFFEL_SCANNER.read_token */
extern void T166x10170(T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_stream */
extern void T166x10028T0(T0* C, T0* a1);
/* New instance of type SPECIAL [CHARACTER_8] */
extern T0* GE_new15(T6 a1, T1 initialize);
/* New instance of type STRING_8 */
extern T0* GE_new17(T1 initialize);
/* New instance of type GEXACE */
extern T0* GE_new21(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [GEXACE_COMMAND] */
extern T0* GE_new22(T1 initialize);
/* New instance of type KL_ARGUMENTS */
extern T0* GE_new23(T1 initialize);
/* New instance of type DS_HASH_TABLE [STRING_8, STRING_8] */
extern T0* GE_new24(T1 initialize);
/* New instance of type UC_STRING_EQUALITY_TESTER */
extern T0* GE_new25(T1 initialize);
/* New instance of type DS_LINKED_LIST [GEXACE_COMMAND] */
extern T0* GE_new27(T1 initialize);
/* New instance of type ET_XACE_DEFAULT_ERROR_HANDLER */
extern T0* GE_new28(T1 initialize);
/* New instance of type KL_EXCEPTIONS */
extern T0* GE_new30(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [STRING_8] */
extern T0* GE_new31(T1 initialize);
/* New instance of type DS_PAIR [STRING_8, STRING_8] */
extern T0* GE_new32(T1 initialize);
/* New instance of type DS_LINKED_LIST [STRING_8] */
extern T0* GE_new33(T1 initialize);
/* New instance of type UT_USAGE_MESSAGE */
extern T0* GE_new34(T1 initialize);
/* New instance of type GEXACE_SYSTEM_COMMAND */
extern T0* GE_new36(T1 initialize);
/* New instance of type GEXACE_LIBRARY_COMMAND */
extern T0* GE_new40(T1 initialize);
/* New instance of type GEXACE_VALIDATE_COMMAND */
extern T0* GE_new41(T1 initialize);
/* New instance of type ET_XACE_XACE_GENERATOR */
extern T0* GE_new43(T1 initialize);
/* New instance of type ET_XACE_ACE_GENERATOR */
extern T0* GE_new44(T1 initialize);
/* New instance of type ET_XACE_ECF_GENERATOR */
extern T0* GE_new45(T1 initialize);
/* New instance of type DS_LINKED_LIST [ET_XACE_GENERATOR] */
extern T0* GE_new46(T1 initialize);
/* New instance of type KL_STRING_ROUTINES */
extern T0* GE_new47(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8] */
extern T0* GE_new48(T1 initialize);
/* New instance of type SPECIAL [STRING_8] */
extern T0* GE_new50(T6 a1, T1 initialize);
/* New instance of type SPECIAL [INTEGER_32] */
extern T0* GE_new51(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
extern T0* GE_new52(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [INTEGER_32] */
extern T0* GE_new53(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [STRING_8] */
extern T0* GE_new54(T1 initialize);
/* New instance of type DS_LINKABLE [GEXACE_COMMAND] */
extern T0* GE_new55(T1 initialize);
/* New instance of type KL_STANDARD_FILES */
extern T0* GE_new57(T1 initialize);
/* New instance of type KL_STDERR_FILE */
extern T0* GE_new58(T1 initialize);
/* New instance of type KL_STDOUT_FILE */
extern T0* GE_new59(T1 initialize);
/* New instance of type KL_NULL_TEXT_OUTPUT_STREAM */
extern T0* GE_new60(T1 initialize);
/* New instance of type DS_LINKABLE [STRING_8] */
extern T0* GE_new62(T1 initialize);
/* New instance of type ARRAY [STRING_8] */
extern T0* GE_new63(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR] */
extern T0* GE_new64(T1 initialize);
/* New instance of type DS_LINKABLE [ET_XACE_GENERATOR] */
extern T0* GE_new65(T1 initialize);
/* New instance of type UC_STRING */
extern T0* GE_new69(T1 initialize);
/* New instance of type KL_ANY_ROUTINES */
extern T0* GE_new70(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8] */
extern T0* GE_new71(T1 initialize);
/* New instance of type STRING_TO_INTEGER_CONVERTOR */
extern T0* GE_new74(T1 initialize);
/* New instance of type ET_XACE_SYSTEM_CONFIG_PARSER */
extern T0* GE_new75(T1 initialize);
/* New instance of type ET_XACE_SYSTEM_CONFIG */
extern T0* GE_new76(T1 initialize);
/* New instance of type KL_TEXT_INPUT_FILE */
extern T0* GE_new77(T1 initialize);
/* New instance of type KL_TEXT_OUTPUT_FILE */
extern T0* GE_new79(T1 initialize);
/* New instance of type ET_XACE_LIBRARY_CONFIG_PARSER */
extern T0* GE_new80(T1 initialize);
/* New instance of type ET_XACE_LIBRARY_CONFIG */
extern T0* GE_new81(T1 initialize);
/* New instance of type ET_XACE_PARSER */
extern T0* GE_new82(T1 initialize);
/* New instance of type UT_CANNOT_READ_FILE_ERROR */
extern T0* GE_new84(T1 initialize);
/* New instance of type UT_CANNOT_WRITE_TO_FILE_ERROR */
extern T0* GE_new85(T1 initialize);
/* New instance of type INTEGER_OVERFLOW_CHECKER */
extern T0* GE_new86(T1 initialize);
/* New instance of type ET_XACE_AST_FACTORY */
extern T0* GE_new87(T1 initialize);
/* New instance of type XM_DOCUMENT */
extern T0* GE_new88(T1 initialize);
/* New instance of type XM_ELEMENT */
extern T0* GE_new89(T1 initialize);
/* New instance of type XM_POSITION_TABLE */
extern T0* GE_new90(T1 initialize);
/* New instance of type XM_TREE_CALLBACKS_PIPE */
extern T0* GE_new92(T1 initialize);
/* New instance of type XM_STOP_ON_ERROR_FILTER */
extern T0* GE_new93(T1 initialize);
/* New instance of type XM_CALLBACKS_TO_TREE_FILTER */
extern T0* GE_new94(T1 initialize);
/* New instance of type ET_XACE_VALIDATOR */
extern T0* GE_new95(T1 initialize);
/* New instance of type ET_XACE_PREPROCESSOR */
extern T0* GE_new96(T1 initialize);
/* New instance of type DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8] */
extern T0* GE_new97(T1 initialize);
/* New instance of type XM_EXPAT_PARSER_FACTORY */
extern T0* GE_new98(T1 initialize);
/* New instance of type XM_EIFFEL_PARSER */
extern T0* GE_new99(T1 initialize);
/* New instance of type SPECIAL [NATURAL_8] */
extern T0* GE_new105(T6 a1, T1 initialize);
/* New instance of type UT_MESSAGE */
extern T0* GE_new106(T1 initialize);
/* New instance of type ET_XACE_NOT_XACE_FILE_ERROR */
extern T0* GE_new107(T1 initialize);
/* New instance of type ET_XACE_CLUSTERS */
extern T0* GE_new108(T1 initialize);
/* New instance of type ET_XACE_MOUNTED_LIBRARIES */
extern T0* GE_new109(T1 initialize);
/* New instance of type ET_XACE_OPTIONS */
extern T0* GE_new110(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [STRING_8] */
extern T0* GE_new111(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [STRING_8] */
extern T0* GE_new112(T1 initialize);
/* New instance of type DS_HASH_SET [STRING_8] */
extern T0* GE_new113(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [STRING_8] */
extern T0* GE_new114(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [ET_XACE_CLUSTER] */
extern T0* GE_new115(T1 initialize);
/* New instance of type ET_XACE_CLUSTER */
extern T0* GE_new116(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY] */
extern T0* GE_new117(T1 initialize);
/* New instance of type ET_XACE_MOUNTED_LIBRARY */
extern T0* GE_new118(T1 initialize);
/* New instance of type DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS] */
extern T0* GE_new119(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS] */
extern T0* GE_new120(T1 initialize);
/* New instance of type ET_XACE_CLASS_OPTIONS */
extern T0* GE_new121(T1 initialize);
/* New instance of type DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS] */
extern T0* GE_new122(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS] */
extern T0* GE_new123(T1 initialize);
/* New instance of type ET_XACE_FEATURE_OPTIONS */
extern T0* GE_new124(T1 initialize);
/* New instance of type ET_XACE_EXTERNALS */
extern T0* GE_new125(T1 initialize);
/* New instance of type ET_XACE_OPTION_NAMES */
extern T0* GE_new126(T1 initialize);
/* New instance of type DS_LINKED_LIST [ET_XACE_ASSEMBLY] */
extern T0* GE_new127(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY] */
extern T0* GE_new128(T1 initialize);
/* New instance of type ET_XACE_ASSEMBLY */
extern T0* GE_new129(T1 initialize);
/* New instance of type KL_UNIX_FILE_SYSTEM */
extern T0* GE_new130(T1 initialize);
/* New instance of type KL_EXECUTION_ENVIRONMENT */
extern T0* GE_new131(T1 initialize);
/* New instance of type DS_LINKED_LIST [ET_XACE_CLUSTER] */
extern T0* GE_new132(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER] */
extern T0* GE_new133(T1 initialize);
/* New instance of type TUPLE [ET_XACE_CLASS_OPTIONS] */
extern T0* GE_new134(T1 initialize);
/* New instance of type PROCEDURE [ET_XACE_ECF_GENERATOR, TUPLE [ET_XACE_CLASS_OPTIONS]] */
extern T0* GE_new136(T1 initialize);
/* New instance of type TUPLE [ET_XACE_ECF_GENERATOR, INTEGER_32, KI_TEXT_OUTPUT_STREAM] */
extern T0* GE_new137(T1 initialize);
/* New instance of type TUPLE [ET_XACE_FEATURE_OPTIONS] */
extern T0* GE_new138(T1 initialize);
/* New instance of type PROCEDURE [ET_XACE_ECF_GENERATOR, TUPLE [ET_XACE_FEATURE_OPTIONS]] */
extern T0* GE_new139(T1 initialize);
/* New instance of type TUPLE [ET_XACE_ECF_GENERATOR, STRING_8, INTEGER_32, KI_TEXT_OUTPUT_STREAM] */
extern T0* GE_new140(T1 initialize);
/* New instance of type ET_TOKEN_CONSTANTS */
extern T0* GE_new141(T1 initialize);
/* New instance of type ET_SYSTEM */
extern T0* GE_new142(T1 initialize);
/* New instance of type XM_ATTRIBUTE */
extern T0* GE_new145(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [XM_NODE] */
extern T0* GE_new146(T1 initialize);
/* New instance of type DS_HASH_TABLE [INTEGER_32, STRING_8] */
extern T0* GE_new149(T1 initialize);
/* New instance of type UNIX_FILE_INFO */
extern T0* GE_new152(T1 initialize);
/* New instance of type SPECIAL [NATURAL_64] */
extern T0* GE_new153(T6 a1, T1 initialize);
/* New instance of type XM_NAMESPACE_RESOLVER */
extern T0* GE_new154(T1 initialize);
/* New instance of type SPECIAL [XM_CALLBACKS_FILTER] */
extern T0* GE_new155(T6 a1, T1 initialize);
/* New instance of type ARRAY [XM_CALLBACKS_FILTER] */
extern T0* GE_new156(T1 initialize);
/* New instance of type XM_CALLBACKS_NULL */
extern T0* GE_new157(T1 initialize);
/* New instance of type UT_TEMPLATE_EXPANDER */
extern T0* GE_new159(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [ET_XACE_LIBRARY_CONFIG, STRING_8] */
extern T0* GE_new161(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8] */
extern T0* GE_new163(T1 initialize);
/* New instance of type SPECIAL [ET_XACE_LIBRARY_CONFIG] */
extern T0* GE_new164(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY_CONFIG] */
extern T0* GE_new165(T1 initialize);
/* New instance of type XM_EIFFEL_SCANNER */
extern T0* GE_new166(T1 initialize);
/* New instance of type XM_DEFAULT_POSITION */
extern T0* GE_new167(T1 initialize);
/* New instance of type DS_BILINKED_LIST [XM_POSITION] */
extern T0* GE_new169(T1 initialize);
/* New instance of type DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
extern T0* GE_new170(T1 initialize);
/* New instance of type DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
extern T0* GE_new171(T1 initialize);
/* New instance of type XM_NULL_EXTERNAL_RESOLVER */
extern T0* GE_new173(T1 initialize);
/* New instance of type SPECIAL [ANY] */
extern T0* GE_new174(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ANY] */
extern T0* GE_new175(T1 initialize);
/* New instance of type XM_EIFFEL_PARSER_NAME */
extern T0* GE_new176(T1 initialize);
/* New instance of type XM_EIFFEL_DECLARATION */
extern T0* GE_new177(T1 initialize);
/* New instance of type XM_DTD_EXTERNAL_ID */
extern T0* GE_new178(T1 initialize);
/* New instance of type DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new179(T1 initialize);
/* New instance of type XM_DTD_ELEMENT_CONTENT */
extern T0* GE_new180(T1 initialize);
/* New instance of type DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new181(T1 initialize);
/* New instance of type XM_DTD_ATTRIBUTE_CONTENT */
extern T0* GE_new182(T1 initialize);
/* New instance of type DS_BILINKED_LIST [STRING_8] */
extern T0* GE_new183(T1 initialize);
/* New instance of type SPECIAL [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new184(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new185(T1 initialize);
/* New instance of type SPECIAL [XM_EIFFEL_DECLARATION] */
extern T0* GE_new186(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
extern T0* GE_new187(T1 initialize);
/* New instance of type SPECIAL [BOOLEAN] */
extern T0* GE_new188(T6 a1, T1 initialize);
/* New instance of type SPECIAL [XM_DTD_EXTERNAL_ID] */
extern T0* GE_new189(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [BOOLEAN] */
extern T0* GE_new190(T1 initialize);
/* New instance of type SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
extern T0* GE_new191(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
extern T0* GE_new192(T1 initialize);
/* New instance of type SPECIAL [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new193(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new194(T1 initialize);
/* New instance of type SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
extern T0* GE_new196(T6 a1, T1 initialize);
/* New instance of type SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new198(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
extern T0* GE_new199(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new200(T1 initialize);
/* New instance of type SPECIAL [DS_BILINKED_LIST [STRING_8]] */
extern T0* GE_new201(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
extern T0* GE_new202(T1 initialize);
/* New instance of type XM_EIFFEL_ENTITY_DEF */
extern T0* GE_new203(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
extern T0* GE_new204(T1 initialize);
/* New instance of type XM_DTD_CALLBACKS_NULL */
extern T0* GE_new206(T1 initialize);
/* New instance of type XM_EIFFEL_SCANNER_DTD */
extern T0* GE_new207(T1 initialize);
/* New instance of type XM_EIFFEL_PE_ENTITY_DEF */
extern T0* GE_new209(T1 initialize);
/* New instance of type ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR */
extern T0* GE_new210(T1 initialize);
/* New instance of type ET_XACE_BOOLEAN_EXPECTED_ERROR */
extern T0* GE_new211(T1 initialize);
/* New instance of type ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR */
extern T0* GE_new212(T1 initialize);
/* New instance of type ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR */
extern T0* GE_new213(T1 initialize);
/* New instance of type ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR */
extern T0* GE_new214(T1 initialize);
/* New instance of type ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING */
extern T0* GE_new215(T1 initialize);
/* New instance of type ET_XACE_WRONG_ROOT_ELEMENT_ERROR */
extern T0* GE_new216(T1 initialize);
/* New instance of type ET_XACE_MISSING_ATTRIBUTE_ERROR */
extern T0* GE_new217(T1 initialize);
/* New instance of type ET_XACE_MISSING_ELEMENT_ERROR */
extern T0* GE_new218(T1 initialize);
/* New instance of type ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING */
extern T0* GE_new219(T1 initialize);
/* New instance of type ET_XACE_UNKNOWN_ELEMENT_ERROR */
extern T0* GE_new220(T1 initialize);
/* New instance of type ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING */
extern T0* GE_new221(T1 initialize);
/* New instance of type ET_XACE_UNKNOWN_OPTION_NAME_WARNING */
extern T0* GE_new222(T1 initialize);
/* New instance of type KL_OPERATING_SYSTEM */
extern T0* GE_new223(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
extern T0* GE_new226(T1 initialize);
/* New instance of type DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
extern T0* GE_new227(T1 initialize);
/* New instance of type DS_PAIR [XM_POSITION, XM_NODE] */
extern T0* GE_new228(T1 initialize);
/* New instance of type ARRAY [INTEGER_32] */
extern T0* GE_new229(T1 initialize);
/* New instance of type UC_UTF8_ROUTINES */
extern T0* GE_new230(T1 initialize);
/* New instance of type UC_UTF8_STRING */
extern T0* GE_new232(T1 initialize);
/* New instance of type XM_EIFFEL_INPUT_STREAM */
extern T0* GE_new233(T1 initialize);
/* New instance of type KL_INTEGER_ROUTINES */
extern T0* GE_new234(T1 initialize);
/* New instance of type KL_PLATFORM */
extern T0* GE_new235(T1 initialize);
/* New instance of type UT_TRISTATE */
extern T0* GE_new236(T1 initialize);
/* New instance of type SPECIAL [ET_XACE_CLUSTER] */
extern T0* GE_new237(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER] */
extern T0* GE_new238(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_XACE_CLUSTER] */
extern T0* GE_new239(T1 initialize);
/* New instance of type SPECIAL [ET_XACE_MOUNTED_LIBRARY] */
extern T0* GE_new240(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY] */
extern T0* GE_new241(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_XACE_MOUNTED_LIBRARY] */
extern T0* GE_new242(T1 initialize);
/* New instance of type DS_LINKABLE [ET_XACE_CLASS_OPTIONS] */
extern T0* GE_new243(T1 initialize);
/* New instance of type DS_LINKABLE [ET_XACE_FEATURE_OPTIONS] */
extern T0* GE_new244(T1 initialize);
/* New instance of type DS_LINKABLE [ET_XACE_ASSEMBLY] */
extern T0* GE_new245(T1 initialize);
/* New instance of type EXECUTION_ENVIRONMENT */
extern T0* GE_new246(T1 initialize);
/* New instance of type DS_LINKABLE [ET_XACE_CLUSTER] */
extern T0* GE_new247(T1 initialize);
/* New instance of type ET_ERROR_HANDLER */
extern T0* GE_new248(T1 initialize);
/* New instance of type ET_AST_FACTORY */
extern T0* GE_new249(T1 initialize);
/* New instance of type ET_AST_NULL_PROCESSOR */
extern T0* GE_new250(T1 initialize);
/* New instance of type ET_ADAPTED_LIBRARIES */
extern T0* GE_new252(T1 initialize);
/* New instance of type ET_CLUSTERS */
extern T0* GE_new253(T1 initialize);
/* New instance of type ET_ADAPTED_DOTNET_ASSEMBLIES */
extern T0* GE_new254(T1 initialize);
/* New instance of type DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME] */
extern T0* GE_new255(T1 initialize);
/* New instance of type ET_CLASS_NAME_TESTER */
extern T0* GE_new256(T1 initialize);
/* New instance of type ET_MASTER_CLASS */
extern T0* GE_new259(T1 initialize);
/* New instance of type ET_CLIENT */
extern T0* GE_new260(T1 initialize);
/* New instance of type ET_CLASS_TYPE */
extern T0* GE_new261(T1 initialize);
/* New instance of type ET_PARENT */
extern T0* GE_new264(T1 initialize);
/* New instance of type ET_PARENT_LIST */
extern T0* GE_new269(T1 initialize);
/* New instance of type ET_CLIENT_LIST */
extern T0* GE_new271(T1 initialize);
/* New instance of type ET_TUPLE_TYPE */
extern T0* GE_new273(T1 initialize);
/* New instance of type ET_ACTUAL_PARAMETER_LIST */
extern T0* GE_new274(T1 initialize);
/* New instance of type ET_GENERIC_CLASS_TYPE */
extern T0* GE_new276(T1 initialize);
/* New instance of type ET_BUILTIN_CONVERT_FEATURE */
extern T0* GE_new277(T1 initialize);
/* New instance of type ET_CLASS */
extern T0* GE_new279(T1 initialize);
/* New instance of type ET_NONE_GROUP */
extern T0* GE_new280(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [INTEGER_32, STRING_8] */
extern T0* GE_new282(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [INTEGER_32, STRING_8] */
extern T0* GE_new284(T1 initialize);
/* New instance of type XM_NAMESPACE_RESOLVER_CONTEXT */
extern T0* GE_new286(T1 initialize);
/* New instance of type DS_LINKED_QUEUE [STRING_8] */
extern T0* GE_new288(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8] */
extern T0* GE_new289(T1 initialize);
/* New instance of type XM_EIFFEL_CHARACTER_ENTITY */
extern T0* GE_new290(T1 initialize);
/* New instance of type YY_BUFFER */
extern T0* GE_new291(T1 initialize);
/* New instance of type YY_FILE_BUFFER */
extern T0* GE_new292(T1 initialize);
/* New instance of type DS_LINKED_STACK [INTEGER_32] */
extern T0* GE_new295(T1 initialize);
/* New instance of type DS_BILINKABLE [XM_POSITION] */
extern T0* GE_new296(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [XM_POSITION] */
extern T0* GE_new297(T1 initialize);
/* New instance of type DS_LINKABLE [XM_EIFFEL_SCANNER] */
extern T0* GE_new298(T1 initialize);
/* New instance of type SPECIAL [XM_EIFFEL_ENTITY_DEF] */
extern T0* GE_new299(T6 a1, T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8] */
extern T0* GE_new300(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
extern T0* GE_new302(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
extern T0* GE_new304(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new305(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new306(T1 initialize);
/* New instance of type DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new307(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new308(T1 initialize);
/* New instance of type DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new309(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [STRING_8] */
extern T0* GE_new310(T1 initialize);
/* New instance of type DS_BILINKABLE [STRING_8] */
extern T0* GE_new311(T1 initialize);
/* New instance of type ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING */
extern T0* GE_new312(T1 initialize);
/* New instance of type ET_XACE_INVALID_EXPRESSION_ERROR */
extern T0* GE_new313(T1 initialize);
/* New instance of type UC_UNICODE_ROUTINES */
extern T0* GE_new314(T1 initialize);
/* New instance of type KL_ARRAY_ROUTINES [INTEGER_32] */
extern T0* GE_new315(T1 initialize);
/* New instance of type DS_LINKED_QUEUE [CHARACTER_8] */
extern T0* GE_new322(T1 initialize);
/* New instance of type UC_UTF16_ROUTINES */
extern T0* GE_new323(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [ET_ADAPTED_LIBRARY] */
extern T0* GE_new325(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [ET_CLUSTER] */
extern T0* GE_new326(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [ET_ADAPTED_DOTNET_ASSEMBLY] */
extern T0* GE_new327(T1 initialize);
/* New instance of type SPECIAL [ET_MASTER_CLASS] */
extern T0* GE_new328(T6 a1, T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [ET_MASTER_CLASS, ET_CLASS_NAME] */
extern T0* GE_new330(T1 initialize);
/* New instance of type SPECIAL [ET_CLASS_NAME] */
extern T0* GE_new332(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [ET_MASTER_CLASS, ET_CLASS_NAME] */
extern T0* GE_new333(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_MASTER_CLASS] */
extern T0* GE_new334(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_CLASS_NAME] */
extern T0* GE_new335(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [ET_CLASS] */
extern T0* GE_new336(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [ET_MASTER_CLASS] */
extern T0* GE_new337(T1 initialize);
/* New instance of type TUPLE [ET_MASTER_CLASS] */
extern T0* GE_new338(T1 initialize);
/* New instance of type PROCEDURE [ET_MASTER_CLASS, TUPLE [ET_MASTER_CLASS]] */
extern T0* GE_new339(T1 initialize);
/* New instance of type ET_KEYWORD */
extern T0* GE_new340(T1 initialize);
/* New instance of type SPECIAL [ET_PARENT_ITEM] */
extern T0* GE_new342(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_PARENT_ITEM] */
extern T0* GE_new343(T1 initialize);
/* New instance of type SPECIAL [ET_CLIENT_ITEM] */
extern T0* GE_new344(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_CLIENT_ITEM] */
extern T0* GE_new345(T1 initialize);
/* New instance of type ET_IDENTIFIER */
extern T0* GE_new346(T1 initialize);
/* New instance of type ET_SYMBOL */
extern T0* GE_new347(T1 initialize);
/* New instance of type ET_BRACKET_SYMBOL */
extern T0* GE_new348(T1 initialize);
/* New instance of type SPECIAL [ET_ACTUAL_PARAMETER_ITEM] */
extern T0* GE_new350(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_ACTUAL_PARAMETER_ITEM] */
extern T0* GE_new351(T1 initialize);
/* New instance of type ET_BRACED_TYPE_LIST */
extern T0* GE_new354(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [INTEGER_32, STRING_8] */
extern T0* GE_new355(T1 initialize);
/* New instance of type DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
extern T0* GE_new357(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
extern T0* GE_new358(T1 initialize);
/* New instance of type DS_LINKABLE [INTEGER_32] */
extern T0* GE_new360(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
extern T0* GE_new361(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new362(T1 initialize);
/* New instance of type DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new363(T1 initialize);
/* New instance of type C_STRING */
extern T0* GE_new364(T1 initialize);
/* New instance of type DS_HASH_SET [XM_NAMESPACE] */
extern T0* GE_new365(T1 initialize);
/* New instance of type XM_COMMENT */
extern T0* GE_new366(T1 initialize);
/* New instance of type XM_PROCESSING_INSTRUCTION */
extern T0* GE_new367(T1 initialize);
/* New instance of type XM_CHARACTER_DATA */
extern T0* GE_new368(T1 initialize);
/* New instance of type XM_NAMESPACE */
extern T0* GE_new369(T1 initialize);
/* New instance of type KL_WINDOWS_FILE_SYSTEM */
extern T0* GE_new371(T1 initialize);
/* New instance of type KL_STRING_INPUT_STREAM */
extern T0* GE_new374(T1 initialize);
/* New instance of type DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
extern T0* GE_new375(T1 initialize);
/* New instance of type ET_BASE_TYPE_LIST */
extern T0* GE_new378(T1 initialize);
/* New instance of type ET_QUERY_LIST */
extern T0* GE_new379(T1 initialize);
/* New instance of type ET_PROCEDURE_LIST */
extern T0* GE_new380(T1 initialize);
/* New instance of type ET_UNKNOWN_GROUP */
extern T0* GE_new381(T1 initialize);
/* New instance of type ET_CLASS_CODES */
extern T0* GE_new382(T1 initialize);
/* New instance of type KL_CHARACTER_BUFFER */
extern T0* GE_new383(T1 initialize);
/* New instance of type SPECIAL [ARRAY [INTEGER_32]] */
extern T0* GE_new384(T6 a1, T1 initialize);
/* New instance of type SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
extern T0* GE_new385(T6 a1, T1 initialize);
/* New instance of type DS_LINKABLE [CHARACTER_8] */
extern T0* GE_new386(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_ADAPTED_LIBRARY] */
extern T0* GE_new387(T1 initialize);
/* New instance of type SPECIAL [ET_ADAPTED_LIBRARY] */
extern T0* GE_new389(T6 a1, T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_LIBRARY] */
extern T0* GE_new390(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_CLUSTER] */
extern T0* GE_new391(T1 initialize);
/* New instance of type SPECIAL [ET_CLUSTER] */
extern T0* GE_new392(T6 a1, T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_CLUSTER] */
extern T0* GE_new393(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_ADAPTED_DOTNET_ASSEMBLY] */
extern T0* GE_new394(T1 initialize);
/* New instance of type SPECIAL [ET_ADAPTED_DOTNET_ASSEMBLY] */
extern T0* GE_new396(T6 a1, T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_DOTNET_ASSEMBLY] */
extern T0* GE_new397(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [ET_MASTER_CLASS, ET_CLASS_NAME] */
extern T0* GE_new398(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_CLASS] */
extern T0* GE_new399(T1 initialize);
/* New instance of type SPECIAL [ET_CLASS] */
extern T0* GE_new400(T6 a1, T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_CLASS] */
extern T0* GE_new401(T1 initialize);
/* New instance of type DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
extern T0* GE_new405(T1 initialize);
/* New instance of type DS_LINKABLE [XM_NODE] */
extern T0* GE_new408(T1 initialize);
/* New instance of type XM_NODE_TYPER */
extern T0* GE_new410(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_MASTER_CLASS] */
extern T0* GE_new414(T1 initialize);
/* New instance of type MANAGED_POINTER */
extern T0* GE_new415(T1 initialize);
/* New instance of type SPECIAL [XM_NAMESPACE] */
extern T0* GE_new416(T6 a1, T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [XM_NAMESPACE] */
extern T0* GE_new417(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [XM_NAMESPACE] */
extern T0* GE_new418(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
extern T0* GE_new419(T1 initialize);
/* New instance of type DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME] */
extern T0* GE_new420(T1 initialize);
/* New instance of type SPECIAL [ET_BASE_TYPE] */
extern T0* GE_new423(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_BASE_TYPE] */
extern T0* GE_new424(T1 initialize);
/* New instance of type SPECIAL [ET_QUERY] */
extern T0* GE_new426(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_QUERY] */
extern T0* GE_new427(T1 initialize);
/* New instance of type SPECIAL [ET_PROCEDURE] */
extern T0* GE_new429(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_PROCEDURE] */
extern T0* GE_new430(T1 initialize);
/* New instance of type EXCEPTIONS */
extern T0* GE_new432(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [NATURAL_8, ET_CLASS_NAME] */
extern T0* GE_new434(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [NATURAL_8, ET_CLASS_NAME] */
extern T0* GE_new436(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [NATURAL_8] */
extern T0* GE_new437(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [NATURAL_8, ET_CLASS_NAME] */
extern T0* GE_new438(T1 initialize);
/* New instance of type STRING_SEARCHER */
extern T0* GE_new439(T1 initialize);
/* GEXACE.make */
extern T0* T21c20(void);
/* KL_EXCEPTIONS.die */
extern void T30f2(T0* C, T6 a1);
/* GEXACE.exceptions */
extern unsigned char ge112os1770;
extern T0* ge112ov1770;
extern T0* T21f6(T0* C);
/* KL_EXCEPTIONS.default_create */
extern T0* T30c1(void);
/* ET_XACE_DEFAULT_ERROR_HANDLER.has_error */
extern T1 T28f5(T0* C);
/* INTEGER_32.is_greater */
extern T1 T6f4(T6* C, T6 a1);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].forth */
extern void T22f9(T0* C);
/* DS_LINKED_LIST [GEXACE_COMMAND].cursor_forth */
extern void T27f12(T0* C, T0* a1);
/* DS_LINKED_LIST [GEXACE_COMMAND].add_traversing_cursor */
extern void T27f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].set_next_cursor */
extern void T22f11(T0* C, T0* a1);
/* DS_LINKED_LIST [GEXACE_COMMAND].remove_traversing_cursor */
extern void T27f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].set */
extern void T22f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].item */
extern T0* T22f6(T0* C);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].start */
extern void T22f8(T0* C);
/* DS_LINKED_LIST [GEXACE_COMMAND].cursor_start */
extern void T27f11(T0* C, T0* a1);
/* DS_LINKED_LIST [GEXACE_COMMAND].cursor_off */
extern T1 T27f7(T0* C, T0* a1);
/* DS_LINKED_LIST [GEXACE_COMMAND].new_cursor */
extern T0* T27f5(T0* C);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].make */
extern T0* T22c7(T0* a1);
/* GEXACE.process_arguments */
extern void T21f22(T0* C);
/* GEXACE.process_command */
extern void T21f26(T0* C);
/* GEXACE.report_usage_error */
extern void T21f29(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_error */
extern void T28f11(T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_error_message */
extern void T28f15(T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_error_message */
extern void T28f15p1(T0* C, T0* a1);
/* KL_STDERR_FILE.put_line */
extern void T58f12(T0* C, T0* a1);
/* KL_STDERR_FILE.put_new_line */
extern void T58f15(T0* C);
/* KL_STDERR_FILE.put_string */
extern void T58f14(T0* C, T0* a1);
/* KL_STDERR_FILE.old_put_string */
extern void T58f18(T0* C, T0* a1);
/* KL_STDERR_FILE.console_ps */
extern void T58f19(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STRING_ROUTINES.as_string */
extern T0* T47f10(T0* C, T0* a1);
/* UC_UTF8_STRING.string */
extern T0* T232f12(T0* C);
/* UC_UTF8_STRING.next_byte_index */
extern T6 T232f28(T0* C, T6 a1);
/* UC_UTF8_ROUTINES.encoded_byte_count */
extern T6 T230f3(T0* C, T2 a1);
/* CHARACTER_8.is_less_equal */
extern T1 T2f17(T2* C, T2 a1);
/* CHARACTER_8.is_less */
extern T1 T2f15(T2* C, T2 a1);
/* UC_UTF8_STRING.utf8 */
extern unsigned char ge128os4441;
extern T0* ge128ov4441;
extern T0* T232f32(T0* C);
/* UC_UTF8_ROUTINES.default_create */
extern T0* T230c36(void);
/* KL_INTEGER_ROUTINES.to_character */
extern T2 T234f2(T0* C, T6 a1);
/* UC_UTF8_STRING.integer_ */
extern unsigned char ge35os2936;
extern T0* ge35ov2936;
extern T0* T232f31(T0* C);
/* KL_INTEGER_ROUTINES.default_create */
extern T0* T234c4(void);
/* INTEGER_32.is_less_equal */
extern T1 T6f6(T6* C, T6 a1);
/* KL_PLATFORM.maximum_character_code */
extern unsigned char ge109os10887;
extern T6 ge109ov10887;
extern T6 T235f1(T0* C);
/* UC_UTF8_STRING.platform */
extern unsigned char ge116os2934;
extern T0* ge116ov2934;
extern T0* T232f27(T0* C);
/* KL_PLATFORM.default_create */
extern T0* T235c3(void);
/* UC_UTF8_STRING.item_code_at_byte_index */
extern T6 T232f26(T0* C, T6 a1);
/* UC_UTF8_ROUTINES.encoded_next_value */
extern T6 T230f6(T0* C, T2 a1);
/* UC_UTF8_ROUTINES.encoded_first_value */
extern T6 T230f4(T0* C, T2 a1);
/* STRING_8.append_character */
extern void T17f38(T0* C, T2 a1);
/* STRING_8.resize */
extern void T17f44(T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].aliased_resized_area */
extern T0* T15f5(T0* C, T6 a1);
/* INTEGER_32.is_greater_equal */
extern T1 T6f2(T6* C, T6 a1);
/* STRING_8.additional_space */
extern T6 T17f23(T0* C);
/* INTEGER_32.max */
extern T6 T6f13(T6* C, T6 a1);
/* STRING_8.capacity */
extern T6 T17f22(T0* C);
/* UC_UTF8_STRING.byte_item */
extern T2 T232f24(T0* C, T6 a1);
/* UC_UTF8_STRING.old_item */
extern T2 T232f37(T0* C, T6 a1);
/* UC_UTF8_STRING.set_count */
extern void T232f69(T0* C, T6 a1);
/* UC_UTF8_STRING.reset_byte_index_cache */
extern void T232f76(T0* C);
/* STRING_8.make */
extern void T17f36(T0* C, T6 a1);
/* STRING_8.make */
extern T0* T17c36(T6 a1);
/* SPECIAL [CHARACTER_8].make */
extern T0* T15c10(T6 a1);
/* STRING_8.string */
extern T0* T17f25(T0* C);
/* STRING_8.make_from_string */
extern T0* T17c46(T0* a1);
/* SPECIAL [CHARACTER_8].copy_data */
extern void T15f9(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [CHARACTER_8].move_data */
extern void T15f11(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].overlapping_move */
extern void T15f14(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].non_overlapping_move */
extern void T15f13(T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.area_lower */
extern T6 T17f10(T0* C);
/* UC_UTF8_STRING.as_string */
extern T0* T232f11(T0* C);
/* UC_UTF8_STRING.to_utf8 */
extern T0* T232f30(T0* C);
/* KL_ANY_ROUTINES.same_types */
extern T1 T70f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.any_ */
extern unsigned char ge30os1853;
extern T0* ge30ov1853;
extern T0* T47f5(T0* C);
/* KL_ANY_ROUTINES.default_create */
extern T0* T70c2(void);
/* KL_STDERR_FILE.string_ */
extern unsigned char ge37os1763;
extern T0* ge37ov1763;
extern T0* T58f6(T0* C);
/* KL_STRING_ROUTINES.default_create */
extern T0* T47c14(void);
/* ET_XACE_DEFAULT_ERROR_HANDLER.message */
extern T0* T28f6(T0* C, T0* a1);
/* GEXACE.usage_message */
extern unsigned char ge2os1750;
extern T0* ge2ov1750;
extern T0* T21f15(T0* C);
/* UT_USAGE_MESSAGE.make */
extern T0* T34c7(T0* a1);
/* ARRAY [STRING_8].put */
extern void T63f7(T0* C, T0* a1, T6 a2);
/* ARRAY [STRING_8].make */
extern T0* T63c6(T6 a1, T6 a2);
/* ARRAY [STRING_8].make_area */
extern void T63f8(T0* C, T6 a1);
/* SPECIAL [STRING_8].make */
extern void T50f8(T0* C, T6 a1);
/* SPECIAL [STRING_8].make */
extern T0* T50c8(T6 a1);
/* GEXACE.process_validate */
extern void T21f32(T0* C);
/* GEXACE.process_xace_file */
extern void T21f36(T0* C, T0* a1);
/* GEXACE.next_option */
extern T0* T21f17(T0* C);
/* KL_ARGUMENTS.argument */
extern T0* T23f3(T0* C, T6 a1);
/* GEXACE.has_next_option */
extern T1 T21f16(T0* C);
/* GEXACE.is_valid_option_position */
extern T1 T21f19(T0* C, T6 a1);
/* GEXACE.consume_option */
extern void T21f28(T0* C);
/* DS_LINKED_LIST [GEXACE_COMMAND].force_last */
extern void T27f9(T0* C, T0* a1);
/* DS_LINKABLE [GEXACE_COMMAND].put_right */
extern void T55f4(T0* C, T0* a1);
/* DS_LINKABLE [GEXACE_COMMAND].make */
extern T0* T55c3(T0* a1);
/* DS_LINKED_LIST [GEXACE_COMMAND].is_empty */
extern T1 T27f6(T0* C);
/* GEXACE_VALIDATE_COMMAND.set_shallow */
extern void T41f7(T0* C, T1 a1);
/* GEXACE_VALIDATE_COMMAND.make */
extern T0* T41c6(T0* a1, T0* a2);
/* GEXACE.process_library */
extern void T21f31(T0* C);
/* GEXACE.process_output */
extern void T21f35(T0* C, T0* a1);
/* GEXACE_LIBRARY_COMMAND.set_output_filename */
extern void T40f13(T0* C, T0* a1);
/* GEXACE_SYSTEM_COMMAND.set_output_filename */
extern void T36f13(T0* C, T0* a1);
/* GEXACE.process_compilers */
extern void T21f34(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].is_empty */
extern T1 T46f6(T0* C);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].force_last */
extern void T46f9(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_GENERATOR].put_right */
extern void T65f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_GENERATOR].make */
extern T0* T65c3(T0* a1);
/* STRING_8.is_equal */
extern T1 T17f8(T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].same_items */
extern T1 T15f3(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* ET_XACE_ECF_GENERATOR.make */
extern T0* T45c23(T0* a1, T0* a2, T0* a3);
/* ET_XACE_ACE_GENERATOR.make */
extern T0* T44c17(T0* a1, T0* a2, T0* a3);
/* ET_XACE_XACE_GENERATOR.make */
extern T0* T43c17(T0* a1, T0* a2, T0* a3);
/* STRING_8.same_string */
extern T1 T17f7(T0* C, T0* a1);
/* STRING_8.same_string_general */
extern T1 T17f11(T0* C, T0* a1);
/* UC_UTF8_STRING.code */
extern T10 T232f39(T0* C, T6 a1);
/* UC_UTF8_STRING.item_code */
extern T6 T232f8(T0* C, T6 a1);
/* UC_UTF8_STRING.byte_index */
extern T6 T232f25(T0* C, T6 a1);
/* STRING_8.code */
extern T10 T17f12(T0* C, T6 a1);
/* INTEGER_32.to_natural_32 */
extern T10 T6f7(T6* C);
/* UC_UTF8_STRING.area_lower */
extern T6 T232f38(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].force_last */
extern void T24f40(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_put */
extern void T24f48(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_put */
extern void T24f47(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_put */
extern void T24f46(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_item */
extern T6 T24f22(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].hash_position */
extern T6 T24f28(T0* C, T0* a1);
/* UC_UTF8_STRING.hash_code */
extern T6 T232f9(T0* C);
/* UC_UTF8_STRING.hash_code */
extern T6 T232f9p1(T0* C);
/* STRING_8.hash_code */
extern T6 T17f14(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].resize */
extern void T24f45(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_resize */
extern void T24f53(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].resize */
extern T0* T53f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [INTEGER_32].aliased_resized_area_with_default */
extern T0* T51f2(T0* C, T6 a1, T6 a2);
/* SPECIAL [INTEGER_32].aliased_resized_area */
extern T0* T51f4(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].special_integer_ */
extern unsigned char ge36os2330;
extern T0* ge36ov2330;
extern T0* T24f26(T0* C);
/* KL_SPECIAL_ROUTINES [INTEGER_32].default_create */
extern T0* T53c4(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_resize */
extern void T24f52(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].resize */
extern T0* T54f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].aliased_resized_area_with_default */
extern T0* T50f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].aliased_resized_area */
extern T0* T50f4(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_resize */
extern void T24f51(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_item */
extern T0* T24f24(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_item */
extern T6 T24f27(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_resize */
extern void T24f50(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_modulus */
extern T6 T24f29(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_capacity */
extern T6 T24f23(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_put */
extern void T24f44(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].search_position */
extern void T24f43(T0* C, T0* a1);
/* UC_STRING_EQUALITY_TESTER.test */
extern T1 T25f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.same_string */
extern T1 T47f1(T0* C, T0* a1, T0* a2);
/* STRING_8.item_code */
extern T6 T17f15(T0* C, T6 a1);
/* KL_STRING_ROUTINES.elks_same_string */
extern T1 T47f7(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.same_string */
extern T1 T232f7(T0* C, T0* a1);
/* UC_UTF8_STRING.substring_index */
extern T6 T232f22(T0* C, T0* a1, T6 a2);
/* STRING_8.item */
extern T2 T17f13(T0* C, T6 a1);
/* UC_UTF8_STRING.item */
extern T2 T232f16(T0* C, T6 a1);
/* UC_UTF8_STRING.character_item_at_byte_index */
extern T2 T232f35(T0* C, T6 a1);
/* UC_UTF8_STRING.as_string_8 */
extern T0* T232f21(T0* C);
/* STRING_8.put_code */
extern void T17f51(T0* C, T10 a1, T6 a2);
/* UC_UTF8_STRING.put_code */
extern void T232f68(T0* C, T10 a1, T6 a2);
/* UC_UTF8_STRING.put_item_code */
extern void T232f83(T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.put_code_at_byte_index */
extern void T232f86(T0* C, T6 a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.put_byte */
extern void T232f84(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.old_put */
extern void T232f73(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.move_bytes_right */
extern void T232f80(T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.resize_byte_storage */
extern void T232f72(T0* C, T6 a1);
/* UC_UTF8_STRING.resize */
extern void T232f85(T0* C, T6 a1);
/* UC_UTF8_STRING.byte_capacity */
extern T6 T232f42(T0* C);
/* UC_UTF8_STRING.capacity */
extern T6 T232f42p1(T0* C);
/* UC_UTF8_STRING.move_bytes_left */
extern void T232f79(T0* C, T6 a1, T6 a2);
/* UC_UTF8_ROUTINES.code_byte_count */
extern T6 T230f24(T0* C, T6 a1);
/* STRING_8.valid_code */
extern T1 T17f30(T0* C, T10 a1);
/* NATURAL_32.is_less_equal */
extern T1 T10f8(T10* C, T10 a1);
/* UC_UTF8_STRING.valid_code */
extern T1 T232f36(T0* C, T10 a1);
/* STRING_8.set_count */
extern void T17f37(T0* C, T6 a1);
/* UC_UTF8_STRING.old_set_count */
extern void T232f67(T0* C, T6 a1);
/* STRING_8.as_string_8 */
extern T0* T17f29(T0* C);
/* UC_UTF8_STRING.same_unicode_string */
extern T1 T232f29(T0* C, T0* a1);
/* UC_UTF8_STRING.unicode_substring_index */
extern T6 T232f20(T0* C, T0* a1, T6 a2);
/* NATURAL_32.to_integer_32 */
extern T6 T10f7(T10* C);
/* UC_STRING_EQUALITY_TESTER.string_ */
extern T0* T25f2(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].unset_found_item */
extern void T24f42(T0* C);
/* GEXACE.process_format */
extern void T21f33(T0* C, T0* a1);
/* GEXACE_LIBRARY_COMMAND.set_format */
extern void T40f12(T0* C, T0* a1);
/* GEXACE_SYSTEM_COMMAND.set_format */
extern void T36f12(T0* C, T0* a1);
/* GEXACE.next_option_value */
extern T0* T21f11(T0* C);
/* STRING_8.substring */
extern T0* T17f4(T0* C, T6 a1, T6 a2);
/* STRING_8.new_string */
extern T0* T17f6(T0* C, T6 a1);
/* STRING_8.index_of */
extern T6 T17f5(T0* C, T2 a1, T6 a2);
/* GEXACE.has_next_option_value */
extern T1 T21f10(T0* C);
/* GEXACE.is_next_option_long_option */
extern T1 T21f9(T0* C);
/* GEXACE.string_ */
extern T0* T21f18(T0* C);
/* GEXACE_LIBRARY_COMMAND.set_shallow */
extern void T40f11(T0* C, T1 a1);
/* GEXACE_LIBRARY_COMMAND.make */
extern T0* T40c10(T0* a1, T0* a2);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].make */
extern T0* T46c8(void);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].set_internal_cursor */
extern void T46f10(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].new_cursor */
extern T0* T46f5(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].make */
extern T0* T64c7(T0* a1);
/* GEXACE.process_system */
extern void T21f30(T0* C);
/* GEXACE_SYSTEM_COMMAND.set_shallow */
extern void T36f11(T0* C, T1 a1);
/* GEXACE_SYSTEM_COMMAND.make */
extern T0* T36c10(T0* a1, T0* a2);
/* GEXACE.match_long_option */
extern T1 T21f8(T0* C, T0* a1);
/* GEXACE.process_options */
extern void T21f25(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.enable_verbose */
extern void T28f10(T0* C);
/* KL_STANDARD_FILES.output */
extern unsigned char ge77os3017;
extern T0* ge77ov3017;
extern T0* T57f2(T0* C);
/* KL_STDOUT_FILE.make */
extern T0* T59c8(void);
/* KL_STDOUT_FILE.make_open_stdout */
extern void T59f10(T0* C, T0* a1);
/* KL_STDOUT_FILE.set_write_mode */
extern void T59f12(T0* C);
/* KL_STDOUT_FILE.console_def */
extern T14 T59f6(T0* C, T6 a1);
/* KL_STDOUT_FILE.old_make */
extern void T59f11(T0* C, T0* a1);
/* STRING_8.make_empty */
extern T0* T17c41(void);
/* KL_STANDARD_FILES.error */
extern unsigned char ge77os3018;
extern T0* ge77ov3018;
extern T0* T57f1(T0* C);
/* KL_STDERR_FILE.make */
extern T0* T58c10(void);
/* KL_STDERR_FILE.make_open_stderr */
extern void T58f13(T0* C, T0* a1);
/* KL_STDERR_FILE.set_write_mode */
extern void T58f17(T0* C);
/* KL_STDERR_FILE.console_def */
extern T14 T58f5(T0* C, T6 a1);
/* KL_STDERR_FILE.old_make */
extern void T58f16(T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.std */
extern unsigned char ge75os2459;
extern T0* ge75ov2459;
extern T0* T28f7(T0* C);
/* KL_STANDARD_FILES.default_create */
extern T0* T57c3(void);
/* GEXACE.process_define */
extern void T21f24(T0* C);
/* GEXACE.process_define_string */
extern void T21f27(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].forth */
extern void T31f10(T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_forth */
extern void T33f13(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].add_traversing_cursor */
extern void T33f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T31f12(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].remove_traversing_cursor */
extern void T33f15(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].set */
extern void T31f11(T0* C, T0* a1, T1 a2, T1 a3);
/* GEXACE.split_on_first */
extern T0* T21f14(T0* C, T0* a1, T2 a2);
/* DS_PAIR [STRING_8, STRING_8].make */
extern T0* T32c3(T0* a1, T0* a2);
/* KL_STRING_ROUTINES.new_empty_string */
extern T0* T47f2(T0* C, T0* a1, T6 a2);
/* UC_UTF8_STRING.old_wipe_out */
extern void T232f62(T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T232f77(T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T232f62p1(T0* C);
/* STRING_8.wipe_out */
extern void T17f39(T0* C);
/* KL_STRING_ROUTINES.cloned_string */
extern T0* T47f8(T0* C, T0* a1);
/* UC_UTF8_STRING.twin */
extern T0* T232f19(T0* C);
/* UC_UTF8_STRING.copy */
extern void T232f66(T0* C, T0* a1);
/* UC_UTF8_STRING.copy */
extern void T232f66p1(T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].twin */
extern T0* T15f4(T0* C);
/* STRING_8.twin */
extern T0* T17f18(T0* C);
/* STRING_8.copy */
extern void T17f42(T0* C, T0* a1);
/* UC_UTF8_STRING.new_empty_string */
extern T0* T232f15(T0* C, T6 a1);
/* UC_UTF8_STRING.make */
extern void T232f61(T0* C, T6 a1);
/* UC_UTF8_STRING.make */
extern T0* T232c61(T6 a1);
/* UC_UTF8_STRING.make */
extern void T232f61p1(T0* C, T6 a1);
/* UC_UTF8_STRING.substring */
extern T0* T232f18(T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.make_from_substring */
extern T0* T232c63(T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.make_from_substring_general */
extern void T232f78(T0* C, T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.put_substring_at_byte_index */
extern void T232f75(T0* C, T0* a1, T6 a2, T6 a3, T6 a4, T6 a5);
/* UC_UTF8_STRING.put_character_at_byte_index */
extern void T232f74(T0* C, T2 a1, T6 a2, T6 a3);
/* UC_UTF8_ROUTINES.character_byte_count */
extern T6 T230f23(T0* C, T2 a1);
/* UC_UTF8_STRING.any_ */
extern T0* T232f44(T0* C);
/* UC_UTF8_ROUTINES.substring_byte_count */
extern T6 T230f22(T0* C, T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.shifted_byte_index */
extern T6 T232f49(T0* C, T6 a1, T6 a2);
/* UC_UTF8_ROUTINES.dummy_uc_string */
extern unsigned char ge141os10792;
extern T0* ge141ov10792;
extern T0* T230f27(T0* C);
/* UC_STRING.make_empty */
extern T0* T69c8(void);
/* UC_STRING.make */
extern void T69f9(T0* C, T6 a1);
/* UC_STRING.old_set_count */
extern void T69f12(T0* C, T6 a1);
/* UC_STRING.set_count */
extern void T69f11(T0* C, T6 a1);
/* UC_STRING.byte_capacity */
extern T6 T69f7(T0* C);
/* UC_STRING.capacity */
extern T6 T69f7p1(T0* C);
/* UC_STRING.make */
extern void T69f9p1(T0* C, T6 a1);
/* UC_STRING.reset_byte_index_cache */
extern void T69f10(T0* C);
/* UC_UTF8_ROUTINES.any_ */
extern T0* T230f25(T0* C);
/* UC_UTF8_STRING.cloned_string */
extern T0* T232f43(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].item */
extern T0* T31f6(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].start */
extern void T31f9(T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_start */
extern void T33f12(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].cursor_off */
extern T1 T33f7(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].new_cursor */
extern T0* T33f5(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].make */
extern T0* T31c8(T0* a1);
/* GEXACE.split_string */
extern T0* T21f13(T0* C, T0* a1, T2 a2);
/* DS_LINKED_LIST [STRING_8].put_last */
extern void T33f10(T0* C, T0* a1);
/* DS_LINKABLE [STRING_8].put_right */
extern void T62f4(T0* C, T0* a1);
/* DS_LINKABLE [STRING_8].make */
extern T0* T62c3(T0* a1);
/* DS_LINKED_LIST [STRING_8].is_empty */
extern T1 T33f6(T0* C);
/* DS_LINKED_LIST [STRING_8].make */
extern T0* T33c9(void);
/* DS_LINKED_LIST [STRING_8].set_internal_cursor */
extern void T33f11(T0* C, T0* a1);
/* GEXACE.make_command_line_parser */
extern void T21f21(T0* C);
/* GEXACE.reset */
extern void T21f23(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.make */
extern T0* T28c9(void);
/* ET_XACE_DEFAULT_ERROR_HANDLER.set_warning_null */
extern void T28f14(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.null_output_stream */
extern unsigned char ge76os2460;
extern T0* ge76ov2460;
extern T0* T28f8(T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.make */
extern T0* T60c3(T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.set_info_null */
extern void T28f13(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.make_standard */
extern void T28f12(T0* C);
/* DS_LINKED_LIST [GEXACE_COMMAND].make */
extern T0* T27c8(void);
/* DS_LINKED_LIST [GEXACE_COMMAND].set_internal_cursor */
extern void T27f10(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_key_equality_tester */
extern void T24f39(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].internal_set_equality_tester */
extern void T48f6(T0* C, T0* a1);
/* GEXACE.string_equality_tester */
extern unsigned char ge130os1769;
extern T0* ge130ov1769;
extern T0* T21f12(T0* C);
/* UC_STRING_EQUALITY_TESTER.default_create */
extern T0* T25c3(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map */
extern void T24f38(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map */
extern T0* T24c38(T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_with_equality_testers */
extern void T24f41(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].make */
extern T0* T48c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].set_internal_cursor */
extern void T48f7(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].new_cursor */
extern T0* T48f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8].make */
extern T0* T71c3(T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_cursor */
extern T0* T24f25(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].make */
extern T0* T52c3(T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_sparse_container */
extern void T24f49(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_internal_cursor */
extern void T24f58(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_slots */
extern void T24f57(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].make */
extern T0* T53f2(T0* C, T6 a1);
/* SPECIAL [INTEGER_32].make_filled */
extern T0* T51c5(T6 a1, T6 a2);
/* SPECIAL [INTEGER_32].fill_with */
extern void T51f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].make */
extern void T51f7(T0* C, T6 a1);
/* SPECIAL [INTEGER_32].make */
extern T0* T51c7(T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_clashes */
extern void T24f56(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_key_storage */
extern void T24f55(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].make */
extern T0* T54f2(T0* C, T6 a1);
/* SPECIAL [STRING_8].make_filled */
extern T0* T50c6(T0* a1, T6 a2);
/* SPECIAL [STRING_8].fill_with */
extern void T50f9(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_SPECIAL_ROUTINES [STRING_8].default_create */
extern T0* T54c3(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_item_storage */
extern void T24f54(T0* C, T6 a1);
/* KL_ARGUMENTS.set_program_name */
extern void T23f5(T0* C, T0* a1);
/* GEXACE.arguments */
extern unsigned char ge110os1762;
extern T0* ge110ov1762;
extern T0* T21f7(T0* C);
/* KL_ARGUMENTS.make */
extern T0* T23c4(void);
/* MANAGED_POINTER.dispose */
extern void T415f8(T0* C);
/* POINTER.memory_free */
extern void T14f6(T14* C);
/* POINTER.default_pointer */
extern T14 T14f5(T14* C);
/* POINTER.c_free */
extern void T14f7(T14* C, T14 a1);
/* KL_TEXT_OUTPUT_FILE.dispose */
extern void T79f22(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_close */
extern void T79f26(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_close */
extern void T79f28(T0* C, T14 a1);
/* KL_TEXT_OUTPUT_FILE.old_is_closed */
extern T1 T79f11(T0* C);
/* KL_TEXT_INPUT_FILE.dispose */
extern void T77f38(T0* C);
/* KL_TEXT_INPUT_FILE.old_close */
extern void T77f42(T0* C);
/* KL_TEXT_INPUT_FILE.file_close */
extern void T77f44(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.old_is_closed */
extern T1 T77f11(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_stream */
extern void T209f234(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T209f241(T0* C, T0* a1);
/* YY_FILE_BUFFER.name */
extern T0* T292f14(T0* C);
/* XM_EIFFEL_INPUT_STREAM.name */
extern T0* T233f26(T0* C);
/* KL_STRING_INPUT_STREAM.name */
extern unsigned char ge81os5111;
extern T0* ge81ov5111;
extern T0* T374f6(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T209f241p1(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_load_input_buffer */
extern void T209f215(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_content */
extern void T209f218(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.special_integer_ */
extern T0* T209f70(T0* C);
/* KL_CHARACTER_BUFFER.count */
extern T6 T383f4(T0* C);
/* YY_FILE_BUFFER.set_position */
extern void T292f19(T0* C, T6 a1, T6 a2, T6 a3);
/* YY_BUFFER.set_position */
extern void T291f14(T0* C, T6 a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.set_index */
extern void T292f18(T0* C, T6 a1);
/* YY_BUFFER.set_index */
extern void T291f13(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.new_file_buffer */
extern T0* T209f71(T0* C, T0* a1);
/* YY_FILE_BUFFER.make */
extern T0* T292c17(T0* a1);
/* YY_FILE_BUFFER.make_with_size */
extern void T292f21(T0* C, T0* a1, T6 a2);
/* YY_FILE_BUFFER.set_file */
extern void T292f23(T0* C, T0* a1);
/* YY_FILE_BUFFER.flush */
extern void T292f25(T0* C);
/* KL_CHARACTER_BUFFER.put */
extern void T383f9(T0* C, T2 a1, T6 a2);
/* XM_EIFFEL_INPUT_STREAM.end_of_input */
extern T1 T233f18(T0* C);
/* KL_TEXT_INPUT_FILE.end_of_input */
extern T1 T77f26(T0* C);
/* YY_FILE_BUFFER.new_default_buffer */
extern T0* T292f16(T0* C, T6 a1);
/* KL_CHARACTER_BUFFER.make */
extern T0* T383c7(T6 a1);
/* YY_FILE_BUFFER.default_capacity */
extern unsigned char ge256os13381;
extern T6 ge256ov13381;
extern T6 T292f13(T0* C);
/* XM_EIFFEL_INPUT_STREAM.make_from_stream */
extern T0* T233c28(T0* a1);
/* DS_LINKED_QUEUE [CHARACTER_8].make */
extern T0* T322c6(void);
/* XM_EIFFEL_SCANNER_DTD.set_input_stream */
extern void T207f199(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T207f208(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T207f208p1(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_load_input_buffer */
extern void T207f217(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_content */
extern void T207f218(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.special_integer_ */
extern T0* T207f184(T0* C);
/* XM_EIFFEL_SCANNER_DTD.new_file_buffer */
extern T0* T207f54(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_stream */
extern void T203f230(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T203f237(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T203f237p1(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_load_input_buffer */
extern void T203f212(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_content */
extern void T203f214(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.special_integer_ */
extern T0* T203f57(T0* C);
/* XM_EIFFEL_ENTITY_DEF.new_file_buffer */
extern T0* T203f69(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_stream */
extern void T166f197(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T166f205(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T166f205p1(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_load_input_buffer */
extern void T166f212(T0* C);
/* XM_EIFFEL_SCANNER.yy_set_content */
extern void T166f213(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.special_integer_ */
extern T0* T166f182(T0* C);
/* XM_EIFFEL_SCANNER.new_file_buffer */
extern T0* T166f45(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T209f235(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T209f235p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_external */
extern T1 T209f66(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T209f235p0(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_action */
extern void T209f245(T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.from_hexadecimal */
extern void T290f10(T0* C, T0* a1);
/* KL_STRING_ROUTINES.hexadecimal_to_integer */
extern T6 T47f13(T0* C, T0* a1);
/* XM_EIFFEL_CHARACTER_ENTITY.string_ */
extern T0* T290f7(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.to_utf8 */
extern T0* T290f3(T0* C);
/* UC_UTF8_ROUTINES.append_code_to_utf8 */
extern void T230f37(T0* C, T0* a1, T6 a2);
/* UC_UTF8_ROUTINES.integer_ */
extern T0* T230f29(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.utf8 */
extern T0* T290f6(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_ascii */
extern T1 T290f2(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_valid */
extern T1 T290f5(T0* C);
/* UC_UNICODE_ROUTINES.valid_non_surrogate_code */
extern T1 T314f2(T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.unicode */
extern unsigned char ge125os2937;
extern T0* ge125ov2937;
extern T0* T290f4(T0* C);
/* UC_UNICODE_ROUTINES.default_create */
extern T0* T314c29(void);
/* XM_EIFFEL_CHARACTER_ENTITY.from_decimal */
extern void T290f9(T0* C, T0* a1);
/* STRING_8.to_integer */
extern T6 T17f17(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
extern T6 T74f13(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
extern void T74f17(T0* C, T0* a1, T6 a2);
/* STRING_TO_INTEGER_CONVERTOR.parse_character */
extern void T74f23(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflowed */
extern T1 T74f15(T0* C);
/* INTEGER_OVERFLOW_CHECKER.will_overflow */
extern T1 T86f7(T0* C, T11 a1, T11 a2, T6 a3, T6 a4);
/* NATURAL_64.is_greater */
extern T1 T11f4(T11* C, T11 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
extern unsigned char ge2290os4507;
extern T0* ge2290ov4507;
extern T0* T74f14(T0* C);
/* INTEGER_OVERFLOW_CHECKER.make */
extern T0* T86c13(void);
/* NATURAL_64.to_natural_64 */
extern T11 T11f7(T11* C);
/* NATURAL_32.to_natural_64 */
extern T11 T10f4(T10* C);
/* NATURAL_16.to_natural_64 */
extern T11 T9f3(T9* C);
/* NATURAL_8.to_natural_64 */
extern T11 T8f7(T8* C);
/* INTEGER_64.to_natural_64 */
extern T11 T7f7(T7* C);
/* INTEGER_16.to_natural_64 */
extern T11 T5f3(T5* C);
/* INTEGER_8.to_natural_64 */
extern T11 T4f3(T4* C);
/* SPECIAL [NATURAL_64].make */
extern T0* T153c3(T6 a1);
/* STRING_8.has */
extern T1 T17f26(T0* C, T2 a1);
/* INTEGER_32.to_natural_64 */
extern T11 T6f15(T6* C);
/* CHARACTER_8.is_digit */
extern T1 T2f2(T2* C);
/* NATURAL_8.is_greater */
extern T1 T8f2(T8* C, T8 a1);
/* CHARACTER_8.character_types */
extern T8 T2f4(T2* C, T6 a1);
/* CHARACTER_8.internal_character_types */
extern unsigned char ge2220os92;
extern T0* ge2220ov92;
extern T0* T2f6(T2* C);
/* SPECIAL [NATURAL_8].make */
extern void T105f5(T0* C, T6 a1);
/* SPECIAL [NATURAL_8].make */
extern T0* T105c5(T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.reset */
extern void T74f18(T0* C, T6 a1);
/* STRING_8.ctoi_convertor */
extern unsigned char ge2274os1245;
extern T0* ge2274ov1245;
extern T0* T17f21(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
extern void T74f22(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
extern void T74f21(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
extern void T74f20(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
extern void T74f19(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.make */
extern T0* T74c16(void);
/* XM_EIFFEL_PE_ENTITY_DEF.has_normalized_newline */
extern T1 T209f201(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_literal */
extern T1 T209f63(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_substring */
extern T0* T209f181(T0* C, T6 a1, T6 a2);
/* KL_CHARACTER_BUFFER.substring */
extern T0* T383f3(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_PE_ENTITY_DEF.text_count */
extern T6 T209f180(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.system_literal_text */
extern T0* T209f162(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_item */
extern T2 T209f207(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern T0* T209f121(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern unsigned char ge1434os10052;
extern T0* ge1434ov10052;
extern T0* T209f121p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_line_column */
extern void T209f249(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text */
extern T0* T209f105(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.pop_start_condition */
extern void T209f248(T0* C);
/* DS_LINKED_STACK [INTEGER_32].remove */
extern void T295f7(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_start_condition */
extern void T209f233(T0* C, T6 a1);
/* DS_LINKED_STACK [INTEGER_32].item */
extern T6 T295f4(T0* C);
/* DS_LINKED_STACK [INTEGER_32].is_empty */
extern T1 T295f3(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition */
extern void T209f246(T0* C, T6 a1);
/* DS_LINKED_STACK [INTEGER_32].force */
extern void T295f6(T0* C, T6 a1);
/* DS_LINKABLE [INTEGER_32].put_right */
extern void T360f4(T0* C, T0* a1);
/* DS_LINKABLE [INTEGER_32].make */
extern T0* T360c3(T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_last_token */
extern void T209f247(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_eof_action */
extern void T209f244(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.wrap */
extern T1 T209f99(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_refill_input_buffer */
extern void T209f243(T0* C);
/* YY_FILE_BUFFER.fill */
extern void T292f20(T0* C);
/* KL_CHARACTER_BUFFER.fill_from_stream */
extern T6 T383f5(T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T6 T233f27(T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T6 T233f27p1(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STRING_INPUT_STREAM.read_to_string */
extern T6 T374f8(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STRING_INPUT_STREAM.read_character */
extern void T374f10(T0* C);
/* KL_TEXT_INPUT_FILE.read_to_string */
extern T6 T77f31(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
extern unsigned char ge66os5134;
extern T0* ge66ov5134;
extern T0* T77f35(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_to_string */
extern T6 T77f34(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.file_gss */
extern T6 T77f36(T0* C, T14 a1, T14 a2, T6 a3);
/* SPECIAL [CHARACTER_8].item_address */
extern T14 T15f6(T0* C, T6 a1);
/* KL_TEXT_INPUT_FILE.any_ */
extern T0* T77f32(T0* C);
/* KL_TEXT_INPUT_FILE.old_end_of_file */
extern T1 T77f28(T0* C);
/* KL_TEXT_INPUT_FILE.file_feof */
extern T1 T77f30(T0* C, T14 a1);
/* STRING_8.put */
extern void T17f48(T0* C, T2 a1, T6 a2);
/* XM_EIFFEL_INPUT_STREAM.last_character */
extern T2 T233f19(T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].item */
extern T2 T322f5(T0* C);
/* XM_EIFFEL_INPUT_STREAM.read_character */
extern void T233f31(T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].remove */
extern void T322f7(T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].wipe_out */
extern void T322f9(T0* C);
/* XM_EIFFEL_INPUT_STREAM.noqueue_read_character */
extern void T233f33(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf16_read_character */
extern void T233f35(T0* C);
/* XM_EIFFEL_INPUT_STREAM.append_character */
extern void T233f36(T0* C, T6 a1);
/* DS_LINKED_QUEUE [CHARACTER_8].force */
extern void T322f8(T0* C, T2 a1);
/* DS_LINKABLE [CHARACTER_8].put_right */
extern void T386f4(T0* C, T0* a1);
/* DS_LINKED_QUEUE [CHARACTER_8].is_empty */
extern T1 T322f4(T0* C);
/* DS_LINKABLE [CHARACTER_8].make */
extern T0* T386c3(T2 a1);
/* XM_EIFFEL_INPUT_STREAM.utf8 */
extern T0* T233f22(T0* C);
/* KL_STRING_ROUTINES.wipe_out */
extern void T47f16(T0* C, T0* a1);
/* STRING_8.keep_head */
extern void T17f50(T0* C, T6 a1);
/* XM_EIFFEL_INPUT_STREAM.string_ */
extern T0* T233f17(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf8_buffer */
extern unsigned char ge1425os10828;
extern T0* ge1425ov10828;
extern T0* T233f25(T0* C);
/* UC_UTF16_ROUTINES.surrogate */
extern T6 T323f7(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_low_surrogate */
extern T1 T323f6(T0* C, T6 a1);
/* UC_UTF16_ROUTINES.least_10_bits */
extern T6 T323f5(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_high_surrogate */
extern T1 T323f4(T0* C, T6 a1);
/* UC_UTF16_ROUTINES.is_surrogate */
extern T1 T323f3(T0* C, T6 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16 */
extern unsigned char ge126os2938;
extern T0* ge126ov2938;
extern T0* T233f20(T0* C);
/* UC_UTF16_ROUTINES.default_create */
extern T0* T323c16(void);
/* XM_EIFFEL_INPUT_STREAM.least_significant */
extern T6 T233f24(T0* C, T2 a1, T2 a2);
/* XM_EIFFEL_INPUT_STREAM.most_significant */
extern T6 T233f23(T0* C, T2 a1, T2 a2);
/* XM_EIFFEL_INPUT_STREAM.latin1_read_character */
extern void T233f34(T0* C);
/* KL_TEXT_INPUT_FILE.read_character */
extern void T77f46(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_character */
extern void T77f47(T0* C);
/* KL_TEXT_INPUT_FILE.file_gc */
extern T2 T77f29(T0* C, T14 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16_detect_read_character */
extern void T233f32(T0* C);
/* UC_UTF8_ROUTINES.is_endian_detection_character */
extern T1 T230f31(T0* C, T2 a1, T2 a2, T2 a3);
/* UC_UTF8_ROUTINES.is_endian_detection_character_start */
extern T1 T230f30(T0* C, T2 a1, T2 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_least_first */
extern T1 T323f2(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_most_first */
extern T1 T323f1(T0* C, T6 a1, T6 a2);
/* YY_FILE_BUFFER.compact_left */
extern void T292f22(T0* C);
/* KL_CHARACTER_BUFFER.move_left */
extern void T383f10(T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.subcopy */
extern void T17f54(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* YY_FILE_BUFFER.resize */
extern void T292f24(T0* C);
/* KL_CHARACTER_BUFFER.resize */
extern void T383f11(T0* C, T6 a1);
/* YY_BUFFER.fill */
extern void T291f15(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_null_trans_state */
extern T6 T209f98(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_previous_state */
extern T6 T209f97(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.fatal_error */
extern void T209f240(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.item */
extern T2 T383f6(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.terminate */
extern void T209f242(T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T207f200(T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T207f200p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_action */
extern void T207f214(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.has_normalized_newline */
extern T1 T207f179(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_substring */
extern T0* T207f159(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_SCANNER_DTD.text_count */
extern T6 T207f158(T0* C);
/* XM_EIFFEL_SCANNER_DTD.system_literal_text */
extern T0* T207f140(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_item */
extern T2 T207f194(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.normalized_newline */
extern T0* T207f102(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_line_column */
extern void T207f220(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text */
extern T0* T207f76(T0* C);
/* XM_EIFFEL_SCANNER_DTD.pop_start_condition */
extern void T207f219(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_start_condition */
extern void T207f205(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition */
extern void T207f215(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_eof_action */
extern void T207f213(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.wrap */
extern T1 T207f67(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_refill_input_buffer */
extern void T207f212(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_null_trans_state */
extern T6 T207f66(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_previous_state */
extern T6 T207f65(T0* C);
/* XM_EIFFEL_SCANNER_DTD.fatal_error */
extern void T207f211(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.terminate */
extern void T207f210(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_last_token */
extern void T207f209(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T203f231(T0* C);
/* XM_EIFFEL_ENTITY_DEF.is_external */
extern T1 T203f51(T0* C);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T203f231p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_action */
extern void T203f240(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.has_normalized_newline */
extern T1 T203f198(T0* C);
/* XM_EIFFEL_ENTITY_DEF.is_literal */
extern T1 T203f62(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_substring */
extern T0* T203f178(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_ENTITY_DEF.text_count */
extern T6 T203f177(T0* C);
/* XM_EIFFEL_ENTITY_DEF.system_literal_text */
extern T0* T203f159(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_item */
extern T2 T203f205(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T203f118(T0* C);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T203f118p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_line_column */
extern void T203f245(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text */
extern T0* T203f102(T0* C);
/* XM_EIFFEL_ENTITY_DEF.pop_start_condition */
extern void T203f244(T0* C);
/* XM_EIFFEL_ENTITY_DEF.set_start_condition */
extern void T203f229(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition */
extern void T203f241(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.set_last_token */
extern void T203f243(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_eof_action */
extern void T203f239(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.terminate */
extern void T203f242(T0* C);
/* XM_EIFFEL_ENTITY_DEF.wrap */
extern T1 T203f96(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_refill_input_buffer */
extern void T203f238(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_null_trans_state */
extern T6 T203f95(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_previous_state */
extern T6 T203f94(T0* C);
/* XM_EIFFEL_ENTITY_DEF.fatal_error */
extern void T203f236(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.read_token */
extern void T166f198(T0* C);
/* XM_EIFFEL_SCANNER.yy_execute_action */
extern void T166f209(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.has_normalized_newline */
extern T1 T166f177(T0* C);
/* XM_EIFFEL_SCANNER.text_substring */
extern T0* T166f157(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_SCANNER.text_count */
extern T6 T166f156(T0* C);
/* XM_EIFFEL_SCANNER.system_literal_text */
extern T0* T166f138(T0* C);
/* XM_EIFFEL_SCANNER.text_item */
extern T2 T166f192(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.normalized_newline */
extern T0* T166f97(T0* C);
/* XM_EIFFEL_SCANNER.yy_set_line_column */
extern void T166f217(T0* C);
/* XM_EIFFEL_SCANNER.text */
extern T0* T166f71(T0* C);
/* XM_EIFFEL_SCANNER.pop_start_condition */
extern void T166f216(T0* C);
/* XM_EIFFEL_SCANNER.set_start_condition */
extern void T166f218(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.push_start_condition */
extern void T166f210(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.set_last_token */
extern void T166f215(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.yy_execute_eof_action */
extern void T166f208(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.terminate */
extern void T166f214(T0* C);
/* XM_EIFFEL_SCANNER.wrap */
extern T1 T166f62(T0* C);
/* XM_EIFFEL_SCANNER.yy_refill_input_buffer */
extern void T166f207(T0* C);
/* XM_EIFFEL_SCANNER.yy_null_trans_state */
extern T6 T166f61(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.yy_previous_state */
extern T6 T166f60(T0* C);
/* XM_EIFFEL_SCANNER.fatal_error */
extern void T166f206(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T209f237(T0* C);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition_dtd_ignore */
extern void T207f202(T0* C);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T203f233(T0* C);
/* XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T166f200(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_encoding */
extern void T209f238(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.set_encoding */
extern void T233f30(T0* C, T0* a1);
/* KL_STRING_ROUTINES.same_case_insensitive */
extern T1 T47f11(T0* C, T0* a1, T0* a2);
/* CHARACTER_8.lower */
extern T2 T2f16(T2* C);
/* CHARACTER_8.is_upper */
extern T1 T2f19(T2* C);
/* UC_UNICODE_ROUTINES.lower_code */
extern T6 T314f1(T0* C, T6 a1);
/* ARRAY [INTEGER_32].item */
extern T6 T229f4(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.lower_codes */
extern unsigned char ge152os13451;
extern T0* ge152ov13451;
extern T0* T314f3(T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_plane */
extern unsigned char ge152os13450;
extern T0* ge152ov13450;
extern T0* T314f10(T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_segment */
extern unsigned char ge152os13437;
extern T0* ge152ov13437;
extern T0* T314f17(T0* C);
/* KL_INTEGER_ROUTINES.to_integer */
extern T6 T234f3(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.integer_ */
extern T0* T314f28(T0* C);
/* SPECIAL [ARRAY [INTEGER_32]].make_filled */
extern T0* T384c3(T0* a1, T6 a2);
/* SPECIAL [ARRAY [INTEGER_32]].fill_with */
extern void T384f6(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ARRAY [INTEGER_32]].make */
extern void T384f5(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.lower_code_plane_1 */
extern unsigned char ge152os13449;
extern T0* ge152ov13449;
extern T0* T314f9(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_1_segment_4 */
extern unsigned char ge152os13448;
extern T0* ge152ov13448;
extern T0* T314f27(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0 */
extern unsigned char ge152os13447;
extern T0* ge152ov13447;
extern T0* T314f8(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_255 */
extern unsigned char ge152os13446;
extern T0* ge152ov13446;
extern T0* T314f26(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_167 */
extern unsigned char ge152os13445;
extern T0* ge152ov13445;
extern T0* T314f25(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_166 */
extern unsigned char ge152os13444;
extern T0* ge152ov13444;
extern T0* T314f24(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_44 */
extern unsigned char ge152os13443;
extern T0* ge152ov13443;
extern T0* T314f23(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_36 */
extern unsigned char ge152os13442;
extern T0* ge152ov13442;
extern T0* T314f22(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_33 */
extern unsigned char ge152os13441;
extern T0* ge152ov13441;
extern T0* T314f21(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_31 */
extern unsigned char ge152os13440;
extern T0* ge152ov13440;
extern T0* T314f20(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_30 */
extern unsigned char ge152os13439;
extern T0* ge152ov13439;
extern T0* T314f19(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_16 */
extern unsigned char ge152os13438;
extern T0* ge152ov13438;
extern T0* T314f18(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_5 */
extern unsigned char ge152os13436;
extern T0* ge152ov13436;
extern T0* T314f16(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_4 */
extern unsigned char ge152os13435;
extern T0* ge152ov13435;
extern T0* T314f15(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_3 */
extern unsigned char ge152os13434;
extern T0* ge152ov13434;
extern T0* T314f14(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_2 */
extern unsigned char ge152os13433;
extern T0* ge152ov13433;
extern T0* T314f13(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_1 */
extern unsigned char ge152os13432;
extern T0* ge152ov13432;
extern T0* T314f12(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_0 */
extern unsigned char ge152os13431;
extern T0* ge152ov13431;
extern T0* T314f11(T0* C);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].make_filled */
extern T0* T385c3(T0* a1, T6 a2);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].fill_with */
extern void T385f6(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].make */
extern void T385f5(T0* C, T6 a1);
/* KL_STRING_ROUTINES.unicode */
extern T0* T47f12(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_encoding */
extern void T207f203(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_encoding */
extern void T203f234(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_encoding */
extern void T166f201(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_from_resolver */
extern void T209f239(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.last_stream */
extern T0* T173f3(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_input_from_resolver */
extern void T207f204(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_from_resolver */
extern void T203f235(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T166f202(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.close_input */
extern void T209f236(T0* C);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_finish */
extern void T173f7(T0* C);
/* KL_STRING_INPUT_STREAM.close */
extern void T374f11(T0* C);
/* KL_TEXT_INPUT_FILE.close */
extern void T77f40(T0* C);
/* KL_STRING_INPUT_STREAM.is_closable */
extern T1 T374f7(T0* C);
/* KL_TEXT_INPUT_FILE.is_closable */
extern T1 T77f25(T0* C);
/* KL_TEXT_INPUT_FILE.is_open_read */
extern T1 T77f20(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_read */
extern T1 T77f19(T0* C);
/* XM_EIFFEL_SCANNER_DTD.close_input */
extern void T207f201(T0* C);
/* XM_EIFFEL_ENTITY_DEF.close_input */
extern void T203f232(T0* C);
/* XM_EIFFEL_SCANNER.close_input */
extern void T166f199(T0* C);
/* XM_CHARACTER_DATA.process */
extern void T368f5(T0* C, T0* a1);
/* XM_NODE_TYPER.process_character_data */
extern void T410f17(T0* C, T0* a1);
/* XM_NODE_TYPER.reset */
extern void T410f13(T0* C);
/* XM_PROCESSING_INSTRUCTION.process */
extern void T367f7(T0* C, T0* a1);
/* XM_NODE_TYPER.process_processing_instruction */
extern void T410f16(T0* C, T0* a1);
/* XM_COMMENT.process */
extern void T366f6(T0* C, T0* a1);
/* XM_NODE_TYPER.process_comment */
extern void T410f15(T0* C, T0* a1);
/* XM_ATTRIBUTE.process */
extern void T145f8(T0* C, T0* a1);
/* XM_NODE_TYPER.process_attribute */
extern void T410f14(T0* C, T0* a1);
/* XM_ELEMENT.process */
extern void T89f40(T0* C, T0* a1);
/* XM_NODE_TYPER.process_element */
extern void T410f11(T0* C, T0* a1);
/* XM_CHARACTER_DATA.node_set_parent */
extern void T368f4(T0* C, T0* a1);
/* XM_PROCESSING_INSTRUCTION.node_set_parent */
extern void T367f6(T0* C, T0* a1);
/* XM_COMMENT.node_set_parent */
extern void T366f5(T0* C, T0* a1);
/* XM_ATTRIBUTE.node_set_parent */
extern void T145f6(T0* C, T0* a1);
/* XM_ELEMENT.node_set_parent */
extern void T89f31(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_start */
extern void T157f2(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start */
extern void T154f26(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_make */
extern void T154f36(T0* C);
/* XM_NAMESPACE_RESOLVER.new_string_queue */
extern T0* T154f12(T0* C);
/* DS_LINKED_QUEUE [STRING_8].make */
extern T0* T288c6(void);
/* XM_NAMESPACE_RESOLVER_CONTEXT.make */
extern T0* T286c10(void);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T357c9(void);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].set_internal_cursor */
extern void T357f12(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].new_cursor */
extern T0* T357f7(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T358c7(T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start */
extern void T94f12(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_equal */
extern T0* T365c32(T6 a1);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].default_create */
extern T0* T417c2(void);
/* DS_HASH_SET [XM_NAMESPACE].make */
extern void T365f35(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].set_internal_cursor */
extern void T365f45(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].new_cursor */
extern T0* T365f22(T0* C);
/* DS_HASH_SET_CURSOR [XM_NAMESPACE].make */
extern T0* T418c3(T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].unset_found_item */
extern void T365f36(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_slots */
extern void T365f44(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].special_integer_ */
extern T0* T365f28(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].new_modulus */
extern T6 T365f20(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_clashes */
extern void T365f43(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_key_storage */
extern void T365f42(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_item_storage */
extern void T365f41(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].make */
extern T0* T419f1(T0* C, T6 a1);
/* SPECIAL [XM_NAMESPACE].make_filled */
extern T0* T416c5(T0* a1, T6 a2);
/* SPECIAL [XM_NAMESPACE].fill_with */
extern void T416f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_NAMESPACE].make */
extern void T416f7(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].default_create */
extern T0* T419c3(void);
/* XM_DOCUMENT.make */
extern T0* T88c15(void);
/* XM_DOCUMENT.make_with_root_named */
extern void T88f16(T0* C, T0* a1, T0* a2);
/* XM_DOCUMENT.force_last */
extern void T88f18(T0* C, T0* a1);
/* XM_DOCUMENT.force_last */
extern void T88f18p1(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].put_right */
extern void T408f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].make */
extern T0* T408c3(T0* a1);
/* XM_DOCUMENT.is_empty */
extern T1 T88f9(T0* C);
/* XM_DOCUMENT.before_addition */
extern void T88f20(T0* C, T0* a1);
/* XM_ELEMENT.equality_delete */
extern void T89f39(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].forth */
extern void T146f11(T0* C);
/* XM_DOCUMENT.cursor_forth */
extern void T88f25(T0* C, T0* a1);
/* XM_DOCUMENT.add_traversing_cursor */
extern void T88f29(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_next_cursor */
extern void T146f16(T0* C, T0* a1);
/* XM_DOCUMENT.remove_traversing_cursor */
extern void T88f30(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set */
extern void T146f17(T0* C, T0* a1, T1 a2, T1 a3);
/* XM_ELEMENT.cursor_forth */
extern void T89f46(T0* C, T0* a1);
/* XM_ELEMENT.add_traversing_cursor */
extern void T89f48(T0* C, T0* a1);
/* XM_ELEMENT.remove_traversing_cursor */
extern void T89f49(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].remove */
extern void T146f14(T0* C);
/* XM_DOCUMENT.remove_at_cursor */
extern void T88f27(T0* C, T0* a1);
/* XM_DOCUMENT.move_all_cursors */
extern void T88f34(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_current_cell */
extern void T146f13(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].put */
extern void T408f6(T0* C, T0* a1);
/* XM_DOCUMENT.set_last_cell */
extern void T88f33(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].forget_right */
extern void T408f5(T0* C);
/* XM_DOCUMENT.remove_last */
extern void T88f32(T0* C);
/* XM_DOCUMENT.move_last_cursors_after */
extern void T88f37(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_after */
extern void T146f15(T0* C);
/* XM_DOCUMENT.wipe_out */
extern void T88f35(T0* C);
/* XM_DOCUMENT.move_all_cursors_after */
extern void T88f38(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].is_last */
extern T1 T146f7(T0* C);
/* XM_DOCUMENT.cursor_is_last */
extern T1 T88f11(T0* C, T0* a1);
/* XM_ELEMENT.cursor_is_last */
extern T1 T89f23(T0* C, T0* a1);
/* XM_DOCUMENT.remove_first */
extern void T88f31(T0* C);
/* XM_DOCUMENT.set_first_cell */
extern void T88f36(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].is_first */
extern T1 T146f6(T0* C);
/* XM_DOCUMENT.cursor_is_first */
extern T1 T88f12(T0* C, T0* a1);
/* XM_ELEMENT.cursor_is_first */
extern T1 T89f24(T0* C, T0* a1);
/* XM_ELEMENT.remove_at_cursor */
extern void T89f30(T0* C, T0* a1);
/* XM_ELEMENT.move_all_cursors */
extern void T89f37(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.set_last_cell */
extern void T89f36(T0* C, T0* a1);
/* XM_ELEMENT.remove_last */
extern void T89f35(T0* C);
/* XM_ELEMENT.move_last_cursors_after */
extern void T89f43(T0* C);
/* XM_ELEMENT.wipe_out */
extern void T89f41(T0* C);
/* XM_ELEMENT.move_all_cursors_after */
extern void T89f44(T0* C);
/* XM_ELEMENT.remove_first */
extern void T89f34(T0* C);
/* XM_ELEMENT.set_first_cell */
extern void T89f42(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].item */
extern T0* T146f8(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].start */
extern void T146f10(T0* C);
/* XM_DOCUMENT.cursor_start */
extern void T88f24(T0* C, T0* a1);
/* XM_DOCUMENT.cursor_off */
extern T1 T88f14(T0* C, T0* a1);
/* XM_ELEMENT.cursor_start */
extern void T89f45(T0* C, T0* a1);
/* XM_ELEMENT.cursor_off */
extern T1 T89f25(T0* C, T0* a1);
/* XM_ELEMENT.new_cursor */
extern T0* T89f22(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].make */
extern T0* T146c9(T0* a1);
/* XM_DOCUMENT.equality_delete */
extern void T88f22(T0* C, T0* a1);
/* XM_DOCUMENT.new_cursor */
extern T0* T88f8(T0* C);
/* XM_DOCUMENT.list_make */
extern void T88f17(T0* C);
/* XM_DOCUMENT.set_internal_cursor */
extern void T88f19(T0* C, T0* a1);
/* XM_ELEMENT.make */
extern T0* T89c29(T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.list_make */
extern void T89f32(T0* C);
/* XM_ELEMENT.set_internal_cursor */
extern void T89f38(T0* C, T0* a1);
/* XM_DOCUMENT.default_ns */
extern unsigned char ge1385os5992;
extern T0* ge1385ov5992;
extern T0* T88f7(T0* C);
/* XM_NAMESPACE.make_default */
extern T0* T369c8(void);
/* XM_NAMESPACE.make */
extern void T369f7(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE.make */
extern T0* T369c7(T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T93f6(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T93f6p1(T0* C);
/* XM_CALLBACKS_NULL.make */
extern T0* T157c1(void);
/* XM_CALLBACKS_NULL.on_comment */
extern void T157f4(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_comment */
extern void T154f28(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_comment */
extern void T94f14(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.handle_position */
extern void T94f22(T0* C, T0* a1);
/* XM_POSITION_TABLE.put */
extern void T90f4(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].put_last */
extern void T227f15(T0* C, T0* a1);
/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].put_right */
extern void T375f4(T0* C, T0* a1);
/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T375c3(T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].is_empty */
extern T1 T227f5(T0* C);
/* DS_PAIR [XM_POSITION, XM_NODE].make */
extern T0* T228c3(T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.position */
extern T0* T99f137(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].first */
extern T0* T169f5(T0* C);
/* XM_EIFFEL_PARSER.positions */
extern T0* T99f91(T0* C);
/* XM_EIFFEL_PARSER.new_positions */
extern T0* T99f135(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].remove */
extern void T170f7(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].item */
extern T0* T170f4(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].is_empty */
extern T1 T170f3(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].force_last */
extern void T169f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].put_right */
extern void T296f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].attach_left */
extern void T296f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].make */
extern T0* T296c4(T0* a1);
/* DS_BILINKED_LIST [XM_POSITION].is_empty */
extern T1 T169f7(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].make */
extern T0* T169c8(void);
/* DS_BILINKED_LIST [XM_POSITION].set_internal_cursor */
extern void T169f10(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_POSITION].new_cursor */
extern T0* T169f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_POSITION].make */
extern T0* T297c3(T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].copy */
extern void T170f6(T0* C, T0* a1);
/* DS_LINKABLE [XM_EIFFEL_SCANNER].put_right */
extern void T298f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_EIFFEL_SCANNER].make */
extern T0* T298c3(T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].make */
extern T0* T170c5(void);
/* XM_EIFFEL_PARSER.is_correct */
extern T1 T99f121(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.is_position_table_enabled */
extern T1 T94f8(T0* C);
/* XM_COMMENT.make_last */
extern T0* T366c4(T0* a1, T0* a2);
/* XM_ELEMENT.force_last */
extern void T89f28(T0* C, T0* a1);
/* XM_ELEMENT.force_last */
extern void T89f28p1(T0* C, T0* a1);
/* XM_ELEMENT.force_last */
extern void T89f28p0(T0* C, T0* a1);
/* XM_ELEMENT.before_addition */
extern void T89f33(T0* C, T0* a1);
/* XM_ELEMENT.last */
extern T0* T89f17(T0* C);
/* XM_ELEMENT.is_empty */
extern T1 T89f16(T0* C);
/* XM_COMMENT.make_last_in_document */
extern T0* T366c3(T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T93f8(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T93f8p1(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_processing_instruction */
extern void T157f5(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_processing_instruction */
extern void T154f29(T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_TO_TREE_FILTER.on_processing_instruction */
extern void T94f15(T0* C, T0* a1, T0* a2);
/* XM_PROCESSING_INSTRUCTION.make_last */
extern T0* T367c5(T0* a1, T0* a2, T0* a3);
/* XM_PROCESSING_INSTRUCTION.make_last_in_document */
extern T0* T367c4(T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T93f9(T0* C, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T93f9p1(T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_NULL.on_content */
extern void T157f6(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_content */
extern void T154f30(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_content */
extern void T94f16(T0* C, T0* a1);
/* XM_CHARACTER_DATA.make_last */
extern T0* T368c3(T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T93f10(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T93f10p1(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_start_tag */
extern void T157f9(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER.on_start_tag */
extern void T154f33(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.push */
extern void T286f12(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].force_last */
extern void T357f11(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].put_right */
extern void T405f5(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].attach_left */
extern void T405f6(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T405c4(T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].is_empty */
extern T1 T357f5(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.new_string_string_table */
extern T0* T286f8(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_equality_tester */
extern void T24f60(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.string_equality_tester */
extern T0* T286f9(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map_default */
extern T0* T24c59(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].default_capacity */
extern T6 T24f36(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag */
extern void T94f17(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_last */
extern T0* T89c27(T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_root */
extern T0* T89c26(T0* a1, T0* a2, T0* a3);
/* XM_DOCUMENT.set_root_element */
extern void T88f21(T0* C, T0* a1);
/* XM_DOCUMENT.remove_previous_root_element */
extern void T88f28(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].go_after */
extern void T146f12(T0* C);
/* XM_DOCUMENT.cursor_go_after */
extern void T88f26(T0* C, T0* a1);
/* XM_ELEMENT.cursor_go_after */
extern void T89f47(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.new_namespace */
extern T0* T94f7(T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_NAMESPACE].force_last */
extern void T365f33(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_put */
extern void T365f40(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].clashes_put */
extern void T365f39(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].slots_item */
extern T6 T365f26(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].hash_position */
extern T6 T365f23(T0* C, T0* a1);
/* XM_NAMESPACE.hash_code */
extern T6 T369f5(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].resize */
extern void T365f38(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_resize */
extern void T365f49(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].key_storage_resize */
extern void T365f48(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_resize */
extern void T365f47(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].resize */
extern T0* T419f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_NAMESPACE].aliased_resized_area_with_default */
extern T0* T416f3(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_NAMESPACE].aliased_resized_area */
extern T0* T416f4(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].key_storage_item */
extern T0* T365f18(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_item */
extern T0* T365f30(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_item */
extern T6 T365f19(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_resize */
extern void T365f46(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_capacity */
extern T6 T365f21(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_put */
extern void T365f37(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].search_position */
extern void T365f34(T0* C, T0* a1);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].test */
extern T1 T417f1(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE.is_equal */
extern T1 T369f4(T0* C, T0* a1);
/* XM_NAMESPACE.string_ */
extern T0* T369f3(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].key_equality_tester */
extern T0* T365f17(T0* C);
/* XM_NAMESPACE.same_prefix */
extern T1 T369f6(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].item */
extern T0* T365f25(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].has */
extern T1 T365f27(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T93f11(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T93f11p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_NULL.on_end_tag */
extern void T157f8(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T154f32(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.pop */
extern void T286f11(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_last */
extern void T357f10(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].set_last_cell */
extern void T357f15(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].forget_right */
extern void T405f7(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_last_cursors_after */
extern void T357f14(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_next_cursor */
extern void T358f12(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_after */
extern void T358f11(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].wipe_out */
extern void T357f13(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_all_cursors_after */
extern void T357f16(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve_default */
extern T0* T286f3(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_pseudo_prefix */
extern unsigned char ge1359os13294;
extern T0* ge1359ov13294;
extern T0* T286f7(T0* C);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T154f32p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve */
extern T0* T286f2(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].back */
extern void T358f10(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_back */
extern void T357f19(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].add_traversing_cursor */
extern void T357f20(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_traversing_cursor */
extern void T357f21(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set */
extern void T358f13(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].go_before */
extern void T358f9(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_go_before */
extern void T357f18(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_before */
extern void T358f14(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_off */
extern T1 T357f8(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item */
extern T0* T24f34(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_item */
extern T0* T24f35(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].has */
extern T1 T24f33(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].item */
extern T0* T358f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].finish */
extern void T358f8(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_finish */
extern void T357f17(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_namespace */
extern unsigned char ge1359os13295;
extern T0* ge1359ov13295;
extern T0* T286f6(T0* C);
/* XM_NAMESPACE_RESOLVER.has_prefix */
extern T1 T154f9(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_end_tag */
extern void T94f19(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.parent_element */
extern T0* T89f8(T0* C);
/* XM_DOCUMENT.process */
extern void T88f23(T0* C, T0* a1);
/* XM_NODE_TYPER.process_document */
extern void T410f12(T0* C, T0* a1);
/* XM_NODE_TYPER.default_create */
extern T0* T410c10(void);
/* XM_ELEMENT.is_root_node */
extern T1 T89f21(T0* C);
/* XM_DOCUMENT.is_root_node */
extern T1 T88f10(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T93f13(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T93f13p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_NULL.on_attribute */
extern void T157f10(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER.on_attribute */
extern void T154f34(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add */
extern void T286f14(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force_new */
extern void T24f61(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].last */
extern T0* T357f6(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.shallow_has */
extern T1 T286f4(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.attributes_force */
extern void T154f38(T0* C, T0* a1, T0* a2, T0* a3);
/* DS_LINKED_QUEUE [STRING_8].force */
extern void T288f7(T0* C, T0* a1);
/* DS_LINKED_QUEUE [STRING_8].is_empty */
extern T1 T288f4(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add_default */
extern void T286f13(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.is_xmlns */
extern T1 T154f14(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.same_string */
extern T1 T154f21(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.string_equality_tester */
extern T0* T154f24(T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns */
extern unsigned char ge1326os2735;
extern T0* ge1326ov2735;
extern T0* T154f20(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_attribute */
extern void T94f21(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_ATTRIBUTE.make_last */
extern T0* T145c5(T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T93f15(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T93f15p1(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_CALLBACKS_NULL.on_finish */
extern void T157f3(T0* C);
/* XM_NAMESPACE_RESOLVER.on_finish */
extern void T154f27(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_finish */
extern void T94f13(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T93f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T93f7p1(T0* C);
/* XM_CALLBACKS_NULL.on_start_tag_finish */
extern void T157f7(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T154f31(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T154f31p1(T0* C);
/* KL_STRING_ROUTINES.appended_string */
extern T0* T47f4(T0* C, T0* a1, T0* a2);
/* STRING_8.append_string */
extern void T17f40(T0* C, T0* a1);
/* STRING_8.append */
extern void T17f43(T0* C, T0* a1);
/* KL_STRING_ROUTINES.concat */
extern T0* T47f9(T0* C, T0* a1, T0* a2);
/* STRING_8.plus */
extern T0* T17f19(T0* C, T0* a1);
/* UC_UTF8_STRING.prefixed_string */
extern T0* T232f14(T0* C, T0* a1);
/* UC_UTF8_STRING.plus */
extern T0* T232f13(T0* C, T0* a1);
/* UC_UTF8_STRING.append_string */
extern void T232f57(T0* C, T0* a1);
/* UC_UTF8_STRING.append */
extern void T232f71(T0* C, T0* a1);
/* UC_UTF8_STRING.dummy_uc_string */
extern unsigned char ge131os4431;
extern T0* ge131ov4431;
extern T0* T232f46(T0* C);
/* UC_UTF8_STRING.append_substring */
extern void T232f59(T0* C, T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.append */
extern void T232f71p1(T0* C, T0* a1);
/* UC_UTF8_STRING.additional_space */
extern T6 T232f47(T0* C);
/* ISE_RUNTIME.check_assert */
extern T1 T321s1(T1 a1);
/* XM_NAMESPACE_RESOLVER.string_ */
extern T0* T154f11(T0* C);
/* XM_NAMESPACE_RESOLVER.on_delayed_attributes */
extern void T154f37(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_remove */
extern void T154f39(T0* C);
/* DS_LINKED_QUEUE [STRING_8].remove */
extern void T288f8(T0* C);
/* DS_LINKED_QUEUE [STRING_8].wipe_out */
extern void T288f9(T0* C);
/* XM_NAMESPACE_RESOLVER.unprefixed_attribute_namespace */
extern T0* T154f19(T0* C);
/* XM_NAMESPACE_RESOLVER.default_namespace */
extern unsigned char ge1326os2734;
extern T0* ge1326ov2734;
extern T0* T154f23(T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns_namespace */
extern unsigned char ge1326os2742;
extern T0* ge1326ov2742;
extern T0* T154f18(T0* C);
/* XM_NAMESPACE_RESOLVER.xml_prefix_namespace */
extern unsigned char ge1326os2741;
extern T0* ge1326ov2741;
extern T0* T154f17(T0* C);
/* XM_NAMESPACE_RESOLVER.is_xml */
extern T1 T154f16(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.xml_prefix */
extern unsigned char ge1326os2736;
extern T0* ge1326ov2736;
extern T0* T154f22(T0* C);
/* DS_LINKED_QUEUE [STRING_8].item */
extern T0* T288f5(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_is_empty */
extern T1 T154f15(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.has */
extern T1 T286f5(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag_finish */
extern void T94f18(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T93f12(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T93f12p1(T0* C);
/* XM_CALLBACKS_NULL.on_error */
extern void T157f11(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_error */
extern void T154f35(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_error */
extern void T94f20(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T93f14(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T93f14p1(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_xml_declaration */
extern void T157f12(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_NAMESPACE_RESOLVER.on_xml_declaration */
extern void T154f41(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_xml_declaration */
extern void T94f23(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_STOP_ON_ERROR_FILTER.on_xml_declaration */
extern void T93f16(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_NAMESPACE_RESOLVER.set_next */
extern void T154f40(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.set_next */
extern void T94f11(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.set_next */
extern void T93f5(T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.set_shallow */
extern void T45f24(T0* C, T1 a1);
/* ET_XACE_ACE_GENERATOR.set_shallow */
extern void T44f18(T0* C, T1 a1);
/* ET_XACE_XACE_GENERATOR.set_shallow */
extern void T43f18(T0* C, T1 a1);
/* ET_XACE_ECF_GENERATOR.generate_system */
extern void T45f25(T0* C, T0* a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.print_ecf_system_file */
extern void T45f27(T0* C, T0* a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.print_override_clusters */
extern void T45f41(T0* C, T0* a1, T6 a2, T0* a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].forth */
extern void T133f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].cursor_forth */
extern void T132f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].add_traversing_cursor */
extern void T132f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].set_next_cursor */
extern void T133f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].remove_traversing_cursor */
extern void T132f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].set */
extern void T133f10(T0* C, T0* a1, T1 a2, T1 a3);
/* ET_XACE_ECF_GENERATOR.print_override_cluster */
extern void T45f45(T0* C, T0* a1, T6 a2, T0* a3);
/* Creation of agent #1 in feature ET_XACE_ECF_GENERATOR.print_override_cluster */
extern T0* T45f45ac1(T0* a1, T6 a2, T0* a3);
/* Creation of agent #2 in feature ET_XACE_ECF_GENERATOR.print_override_cluster */
extern T0* T45f45ac2(T0* a1, T6 a2, T0* a3);
/* ET_XACE_ECF_GENERATOR.print_class_visible */
extern void T45f49(T0* C, T0* a1, T6 a2, T0* a3);
/* Creation of agent #1 in feature ET_XACE_ECF_GENERATOR.print_class_visible */
extern T0* T45f49ac1(T0* a1, T0* a2, T6 a3, T0* a4);
/* ET_XACE_ECF_GENERATOR.print_feature_visible */
extern void T45f50(T0* C, T0* a1, T0* a2, T6 a3, T0* a4);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].do_all */
extern void T122f11(T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.string_ */
extern T0* T45f10(T0* C);
/* ET_XACE_OPTIONS.export_option */
extern T0* T110f326(T0* C);
/* ET_XACE_OPTIONS.default_export_option */
extern unsigned char ge1229os7655;
extern T0* ge1229ov7655;
extern T0* T110f261(T0* C);
/* ET_XACE_OPTIONS.is_export_option_declared */
extern T1 T110f324(T0* C);
/* ET_XACE_ECF_GENERATOR.print_class_options */
extern void T45f48(T0* C, T0* a1, T6 a2, T0* a3);
/* DS_HASH_SET [STRING_8].has */
extern T1 T113f26(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].search_position */
extern void T113f42(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].clashes_item */
extern T6 T113f34(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].hash_position */
extern T6 T113f17(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].key_storage_item */
extern T0* T113f21(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_item */
extern T0* T113f30(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].key_equality_tester */
extern T0* T113f20(T0* C);
/* DS_HASH_SET [STRING_8].slots_item */
extern T6 T113f27(T0* C, T6 a1);
/* ET_XACE_OPTIONS.is_assertion_declared */
extern T1 T110f240(T0* C);
/* DS_HASH_SET [STRING_8].is_empty */
extern T1 T113f24(T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].forth */
extern void T111f8(T0* C);
/* DS_HASH_SET [STRING_8].cursor_forth */
extern void T113f63(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].add_traversing_cursor */
extern void T113f65(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_next_cursor */
extern void T111f10(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].remove_traversing_cursor */
extern void T113f64(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_position */
extern void T111f9(T0* C, T6 a1);
/* DS_HASH_SET_CURSOR [STRING_8].item */
extern T0* T111f4(T0* C);
/* DS_HASH_SET [STRING_8].cursor_item */
extern T0* T113f32(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].after */
extern T1 T111f5(T0* C);
/* DS_HASH_SET [STRING_8].cursor_after */
extern T1 T113f31(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].start */
extern void T111f7(T0* C);
/* DS_HASH_SET [STRING_8].cursor_start */
extern void T113f62(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].cursor_off */
extern T1 T113f36(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].new_cursor */
extern T0* T113f22(T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].make */
extern T0* T111c6(T0* a1);
/* ET_XACE_OPTIONS.debug_tag */
extern T0* T110f294(T0* C);
/* ET_XACE_OPTIONS.default_debug_tag */
extern unsigned char ge1229os7646;
extern T0* ge1229ov7646;
extern T0* T110f247(T0* C);
/* DS_HASH_SET [STRING_8].set_equality_tester */
extern void T113f38(T0* C, T0* a1);
/* ET_XACE_OPTIONS.string_equality_tester */
extern T0* T110f203(T0* C);
/* DS_HASH_SET [STRING_8].make */
extern T0* T113c37(T6 a1);
/* DS_HASH_SET [STRING_8].set_internal_cursor */
extern void T113f48(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].unset_found_item */
extern void T113f47(T0* C);
/* DS_HASH_SET [STRING_8].make_slots */
extern void T113f46(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].special_integer_ */
extern T0* T113f25(T0* C);
/* DS_HASH_SET [STRING_8].new_modulus */
extern T6 T113f19(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_clashes */
extern void T113f45(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_key_storage */
extern void T113f44(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_item_storage */
extern void T113f43(T0* C, T6 a1);
/* ET_XACE_OPTIONS.is_debug_tag_declared */
extern T1 T110f292(T0* C);
/* ET_XACE_OPTIONS.syntax */
extern T0* T110f177(T0* C);
/* ET_XACE_OPTIONS.default_syntax */
extern unsigned char ge1229os7710;
extern T0* ge1229ov7710;
extern T0* T110f364(T0* C);
/* ET_XACE_OPTIONS.options */
extern unsigned char ge1217os2687;
extern T0* ge1217ov2687;
extern T0* T110f204(T0* C);
/* ET_XACE_OPTION_NAMES.default_create */
extern T0* T126c222(void);
/* ET_XACE_OPTIONS.is_syntax_declared */
extern T1 T110f176(T0* C);
/* ET_XACE_OPTIONS.full_class_checking */
extern T1 T110f175(T0* C);
/* UT_TRISTATE.is_true */
extern T1 T236f2(T0* C);
/* ET_XACE_OPTIONS.is_full_class_checking_declared */
extern T1 T110f174(T0* C);
/* UT_TRISTATE.is_undefined */
extern T1 T236f4(T0* C);
/* UT_TRISTATE.is_false */
extern T1 T236f3(T0* C);
/* ET_XACE_OPTIONS.is_namespace_declared */
extern T1 T110f127(T0* C);
/* ET_XACE_OPTIONS.warning */
extern T0* T110f170(T0* C);
/* ET_XACE_OPTIONS.default_warning */
extern unsigned char ge1229os7721;
extern T0* ge1229ov7721;
extern T0* T110f358(T0* C);
/* ET_XACE_OPTIONS.debug_option */
extern T1 T110f290(T0* C);
/* ET_XACE_OPTIONS.profile */
extern T1 T110f138(T0* C);
/* ET_XACE_OPTIONS.trace */
extern T1 T110f158(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].do_all */
extern void T119f11(T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.print_file_rules */
extern void T45f47(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.exclude */
extern T0* T110f322(T0* C);
/* ET_XACE_OPTIONS.default_exclude */
extern unsigned char ge1229os7654;
extern T0* ge1229ov7654;
extern T0* T110f259(T0* C);
/* ET_XACE_ECF_GENERATOR.print_escaped_string */
extern void T45f42(T0* C, T0* a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.print_escaped_character */
extern void T45f46(T0* C, T6 a1, T0* a2);
/* KL_TEXT_OUTPUT_FILE.put_integer */
extern void T79f33(T0* C, T6 a1);
/* KL_TEXT_OUTPUT_FILE.put_integer_64 */
extern void T79f36(T0* C, T7 a1);
/* INTEGER_32.to_integer_64 */
extern T7 T6f17(T6* C);
/* ET_XACE_ECF_GENERATOR.quot_entity */
extern unsigned char ge1326os2729;
extern T0* ge1326ov2729;
extern T0* T45f9(T0* C);
/* ET_XACE_ECF_GENERATOR.amp_entity */
extern unsigned char ge1326os2728;
extern T0* ge1326ov2728;
extern T0* T45f21(T0* C);
/* ET_XACE_ECF_GENERATOR.gt_entity */
extern unsigned char ge1326os2727;
extern T0* ge1326ov2727;
extern T0* T45f19(T0* C);
/* ET_XACE_ECF_GENERATOR.lt_entity */
extern unsigned char ge1326os2726;
extern T0* ge1326ov2726;
extern T0* T45f17(T0* C);
/* ET_XACE_ECF_GENERATOR.is_escaped */
extern T1 T45f15(T0* C, T6 a1);
/* ET_XACE_OPTIONS.include */
extern T0* T110f371(T0* C);
/* ET_XACE_OPTIONS.default_include */
extern unsigned char ge1229os7669;
extern T0* ge1229ov7669;
extern T0* T110f283(T0* C);
/* ET_XACE_OPTIONS.is_exclude_declared */
extern T1 T110f320(T0* C);
/* ET_XACE_OPTIONS.is_include_declared */
extern T1 T110f369(T0* C);
/* ET_XACE_OPTIONS.is_prefix_option_declared */
extern T1 T110f135(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_character */
extern void T79f32(T0* C, T2 a1);
/* KL_TEXT_OUTPUT_FILE.old_put_character */
extern void T79f35(T0* C, T2 a1);
/* KL_TEXT_OUTPUT_FILE.file_pc */
extern void T79f38(T0* C, T14 a1, T2 a2);
/* ET_XACE_CLUSTER.full_pathname */
extern T0* T116f22(T0* C);
/* KL_UNIX_FILE_SYSTEM.pathname */
extern T0* T130f8(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.append_character */
extern void T232f58(T0* C, T2 a1);
/* KL_UNIX_FILE_SYSTEM.string_ */
extern T0* T130f9(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.pathname */
extern T0* T371f5(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_separator */
extern T1 T371f3(T0* C, T2 a1);
/* KL_WINDOWS_FILE_SYSTEM.string_ */
extern T0* T371f2(T0* C);
/* ET_XACE_CLUSTER.file_system */
extern unsigned char ge74os1772;
extern T0* ge74ov1772;
extern T0* T116f26(T0* C);
/* ET_XACE_CLUSTER.unix_file_system */
extern unsigned char ge74os1775;
extern T0* ge74ov1775;
extern T0* T116f29(T0* C);
/* KL_UNIX_FILE_SYSTEM.make */
extern T0* T130c10(void);
/* KL_OPERATING_SYSTEM.is_unix */
extern unsigned char ge107os3026;
extern T1 ge107ov3026;
extern T1 T223f5(T0* C);
/* KL_OPERATING_SYSTEM.current_working_directory */
extern T0* T223f3(T0* C);
/* EXECUTION_ENVIRONMENT.current_working_directory */
extern T0* T246f2(T0* C);
/* KL_OPERATING_SYSTEM.execution_environment */
extern unsigned char ge107os3030;
extern T0* ge107ov3030;
extern T0* T223f4(T0* C);
/* EXECUTION_ENVIRONMENT.default_create */
extern T0* T246c4(void);
/* KL_OPERATING_SYSTEM.variable_value */
extern T0* T223f2(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.get */
extern T0* T246f1(T0* C, T0* a1);
/* STRING_8.make_from_c */
extern T0* T17c53(T14 a1);
/* C_STRING.read_substring_into_character_8_area */
extern void T364f6(T0* C, T0* a1, T6 a2, T6 a3);
/* MANAGED_POINTER.read_natural_8 */
extern T8 T415f6(T0* C, T6 a1);
/* TYPED_POINTER [NATURAL_8].memory_copy */
extern void T431f2(T431* C, T14 a1, T6 a2);
/* TYPED_POINTER [NATURAL_8].c_memcpy */
extern void T431f3(T431* C, T14 a1, T14 a2, T6 a3);
/* C_STRING.set_shared_from_pointer */
extern void T364f5(T0* C, T14 a1);
/* C_STRING.set_shared_from_pointer_and_count */
extern void T364f7(T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.set_from_pointer */
extern void T415f10(T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.share_from_pointer */
extern T0* T415c9(T14 a1, T6 a2);
/* C_STRING.c_strlen */
extern T6 T364f3(T0* C, T14 a1);
/* STRING_8.c_string_provider */
extern unsigned char ge2274os1244;
extern T0* ge2274ov1244;
extern T0* T17f31(T0* C);
/* C_STRING.make_empty */
extern T0* T364c4(T6 a1);
/* MANAGED_POINTER.make */
extern T0* T415c7(T6 a1);
/* EXCEPTIONS.raise */
extern void T432f3(T0* C, T0* a1);
/* EXCEPTIONS.eraise */
extern void T432f4(T0* C, T14 a1, T6 a2);
/* EXCEPTIONS.default_create */
extern T0* T432c2(void);
/* MANAGED_POINTER.default_pointer */
extern T14 T415f5(T0* C);
/* POINTER.memory_calloc */
extern T14 T14f2(T14* C, T6 a1, T6 a2);
/* POINTER.c_calloc */
extern T14 T14f3(T14* C, T6 a1, T6 a2);
/* EXECUTION_ENVIRONMENT.eif_getenv */
extern T14 T246f3(T0* C, T14 a1);
/* UC_UTF8_STRING.to_c */
extern T0* T232f10(T0* C);
/* STRING_8.to_c */
extern T0* T17f27(T0* C);
/* ET_XACE_CLUSTER.windows_file_system */
extern unsigned char ge74os1773;
extern T0* ge74ov1773;
extern T0* T116f28(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.make */
extern T0* T371c6(void);
/* KL_OPERATING_SYSTEM.is_windows */
extern unsigned char ge107os3025;
extern T1 ge107ov3025;
extern T1 T223f1(T0* C);
/* ET_XACE_CLUSTER.operating_system */
extern unsigned char ge115os1776;
extern T0* ge115ov1776;
extern T0* T116f27(T0* C);
/* KL_OPERATING_SYSTEM.default_create */
extern T0* T223c6(void);
/* ET_XACE_CLUSTER.prefixed_name */
extern T0* T116f31(T0* C);
/* ET_XACE_CLUSTER.string_ */
extern T0* T116f25(T0* C);
/* ET_XACE_CLUSTER.is_fully_abstract */
extern T1 T116f30(T0* C);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].item */
extern T0* T115f9(T0* C, T6 a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].item */
extern T0* T133f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].start */
extern void T133f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].cursor_start */
extern void T132f10(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].cursor_off */
extern T1 T132f6(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].new_cursor */
extern T0* T132f7(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].make */
extern T0* T133c7(T0* a1);
/* ET_XACE_CLUSTERS.merge_override_clusters */
extern void T108f10(T0* C, T0* a1);
/* ET_XACE_CLUSTER.merge_override_clusters */
extern void T116f47(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].force_last */
extern void T132f14(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_CLUSTER].put_right */
extern void T247f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_CLUSTER].make */
extern T0* T247c3(T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].is_empty */
extern T1 T132f5(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].make */
extern T0* T132c8(void);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].set_internal_cursor */
extern void T132f9(T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.print_clusters */
extern void T45f40(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_ECF_GENERATOR.print_cluster */
extern void T45f44(T0* C, T0* a1, T6 a2, T0* a3);
/* Creation of agent #1 in feature ET_XACE_ECF_GENERATOR.print_cluster */
extern T0* T45f44ac1(T0* a1, T6 a2, T0* a3);
/* Creation of agent #2 in feature ET_XACE_ECF_GENERATOR.print_cluster */
extern T0* T45f44ac2(T0* a1, T6 a2, T0* a3);
/* ET_XACE_CLUSTER.is_fully_ecf_abstract */
extern T1 T116f24(T0* C);
/* ET_XACE_OPTIONS.is_ecf_library_declared */
extern T1 T110f380(T0* C);
/* ET_XACE_ECF_GENERATOR.print_assemblies */
extern void T45f39(T0* C, T0* a1, T6 a2, T0* a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].forth */
extern void T128f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].cursor_forth */
extern void T127f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].add_traversing_cursor */
extern void T127f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].set_next_cursor */
extern void T128f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].remove_traversing_cursor */
extern void T127f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].set */
extern void T128f10(T0* C, T0* a1, T1 a2, T1 a3);
/* UC_UTF8_STRING.old_is_empty */
extern T1 T232f17(T0* C);
/* STRING_8.is_empty */
extern T1 T17f28(T0* C);
/* ET_XACE_ECF_GENERATOR.print_escaped_name */
extern void T45f43(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].item */
extern T0* T128f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].start */
extern void T128f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].cursor_start */
extern void T127f10(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].cursor_off */
extern T1 T127f5(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].new_cursor */
extern T0* T127f7(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].make */
extern T0* T128c7(T0* a1);
/* ET_XACE_CLUSTERS.merge_assemblies */
extern void T108f8(T0* C, T0* a1);
/* ET_XACE_CLUSTER.merge_assemblies */
extern void T116f45(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].force_last */
extern void T127f14(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_ASSEMBLY].put_right */
extern void T245f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_ASSEMBLY].make */
extern T0* T245c3(T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].is_empty */
extern T1 T127f6(T0* C);
/* ET_XACE_ASSEMBLY.set_assembly_pathname */
extern void T129f9(T0* C, T0* a1);
/* ET_XACE_ASSEMBLY.make */
extern T0* T129c8(T0* a1, T0* a2, T0* a3, T0* a4, T0* a5, T0* a6);
/* ET_XACE_OPTIONS.prefix_option */
extern T0* T110f136(T0* C);
/* ET_XACE_OPTIONS.default_prefix_option */
extern unsigned char ge1229os7698;
extern T0* ge1229ov7698;
extern T0* T110f325(T0* C);
/* ET_XACE_OPTIONS.public_key_token */
extern T0* T110f140(T0* C);
/* ET_XACE_OPTIONS.default_public_key_token */
extern unsigned char ge1229os7700;
extern T0* ge1229ov7700;
extern T0* T110f329(T0* C);
/* ET_XACE_OPTIONS.is_public_key_token_declared */
extern T1 T110f139(T0* C);
/* ET_XACE_OPTIONS.culture */
extern T0* T110f278(T0* C);
/* ET_XACE_OPTIONS.default_culture */
extern unsigned char ge1229os7642;
extern T0* ge1229ov7642;
extern T0* T110f239(T0* C);
/* ET_XACE_OPTIONS.is_culture_declared */
extern T1 T110f276(T0* C);
/* ET_XACE_OPTIONS.version */
extern T0* T110f166(T0* C);
/* ET_XACE_OPTIONS.default_version */
extern unsigned char ge1229os7719;
extern T0* ge1229ov7719;
extern T0* T110f354(T0* C);
/* ET_XACE_OPTIONS.is_version_declared */
extern T1 T110f165(T0* C);
/* ET_XACE_OPTIONS.assembly */
extern T0* T110f238(T0* C);
/* ET_XACE_OPTIONS.default_assembly */
extern unsigned char ge1229os7630;
extern T0* ge1229ov7630;
extern T0* T110f220(T0* C);
/* ET_XACE_OPTIONS.is_assembly_declared */
extern T1 T110f236(T0* C);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].make */
extern T0* T127c8(void);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].set_internal_cursor */
extern void T127f9(T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.print_ecf_clusters */
extern void T45f38(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_CLUSTERS.merge_ecf_clusters */
extern void T108f9(T0* C, T0* a1);
/* ET_XACE_CLUSTER.merge_ecf_clusters */
extern void T116f46(T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.print_mounted_libraries */
extern void T45f37(T0* C, T0* a1, T6 a2, T0* a3);
/* KL_UNIX_FILE_SYSTEM.dirname */
extern T0* T130f3(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.root_directory */
extern unsigned char ge83os8086;
extern T0* ge83ov8086;
extern T0* T130f6(T0* C);
/* KL_UNIX_FILE_SYSTEM.is_root_directory */
extern T1 T130f5(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.basename */
extern T0* T130f2(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.interpreted_string */
extern T0* T131f2(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.variable_value */
extern T0* T131f1(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.environment_impl */
extern unsigned char ge100os8205;
extern T0* ge100ov8205;
extern T0* T131f3(T0* C);
/* KL_STRING_ROUTINES.append_substring_to_string */
extern void T47f15(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* KL_STRING_ROUTINES.appended_substring */
extern T0* T47f3(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* KL_EXECUTION_ENVIRONMENT.string_ */
extern T0* T131f4(T0* C);
/* ET_XACE_ECF_GENERATOR.execution_environment */
extern unsigned char ge113os1771;
extern T0* ge113ov1771;
extern T0* T45f14(T0* C);
/* KL_EXECUTION_ENVIRONMENT.default_create */
extern T0* T131c5(void);
/* UC_UTF8_STRING.remove_tail */
extern void T232f65(T0* C, T6 a1);
/* UC_UTF8_STRING.keep_head */
extern void T232f81(T0* C, T6 a1);
/* STRING_8.remove_tail */
extern void T17f49(T0* C, T6 a1);
/* KL_UNIX_FILE_SYSTEM.extension */
extern T0* T130f1(T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.unix_file_system */
extern T0* T45f13(T0* C);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].item */
extern T0* T117f10(T0* C, T6 a1);
/* ET_XACE_ECF_GENERATOR.print_external_libraries */
extern void T45f36(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_ECF_GENERATOR.replace_all_characters */
extern T0* T45f12(T0* C, T0* a1, T2 a2, T2 a3);
/* UC_UTF8_STRING.put */
extern void T232f64(T0* C, T2 a1, T6 a2);
/* ET_XACE_ECF_GENERATOR.is_windows */
extern T1 T45f11(T0* C);
/* ET_XACE_ECF_GENERATOR.operating_system */
extern T0* T45f22(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].value */
extern T0* T24f32(T0* C, T0* a1);
/* ET_XACE_EXTERNALS.has_link_libraries */
extern T1 T125f5(T0* C);
/* ET_XACE_ECF_GENERATOR.print_external_c_compiler_options */
extern void T45f35(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_EXTERNALS.has_c_compiler_options */
extern T1 T125f4(T0* C);
/* ET_XACE_ECF_GENERATOR.print_external_includes */
extern void T45f34(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_EXTERNALS.has_include_directories */
extern T1 T125f6(T0* C);
/* ET_XACE_SYSTEM_CONFIG.merge_externals */
extern void T76f8(T0* C, T0* a1);
/* ET_XACE_MOUNTED_LIBRARIES.merge_externals */
extern void T109f8(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.merge_externals */
extern void T108f11(T0* C, T0* a1);
/* ET_XACE_CLUSTER.merge_externals */
extern void T116f48(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].forth */
extern void T112f9(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_forth */
extern void T114f23(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].set_position */
extern void T112f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].add_traversing_cursor */
extern void T114f24(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T112f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].remove_traversing_cursor */
extern void T114f25(T0* C, T0* a1);
/* ET_XACE_EXTERNALS.put_link_library */
extern void T125f10(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].force_last */
extern void T33f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].item */
extern T0* T112f4(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_item */
extern T0* T114f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].item */
extern T0* T114f14(T0* C, T6 a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].after */
extern T1 T112f6(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_after */
extern T1 T114f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].start */
extern void T112f8(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_start */
extern void T114f22(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].is_empty */
extern T1 T114f10(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].off */
extern T1 T112f5(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_off */
extern T1 T114f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].cursor_before */
extern T1 T114f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].new_cursor */
extern T0* T114f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].make */
extern T0* T112c7(T0* a1);
/* ET_XACE_OPTIONS.link */
extern T0* T110f106(T0* C);
/* ET_XACE_OPTIONS.default_link */
extern unsigned char ge1229os7677;
extern T0* ge1229ov7677;
extern T0* T110f299(T0* C);
/* DS_ARRAYED_LIST [STRING_8].set_equality_tester */
extern void T114f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].make */
extern T0* T114c17(T6 a1);
/* DS_ARRAYED_LIST [STRING_8].set_internal_cursor */
extern void T114f20(T0* C, T0* a1);
/* ET_XACE_OPTIONS.is_link_declared */
extern T1 T110f105(T0* C);
/* ET_XACE_EXTERNALS.put_include_directory */
extern void T125f9(T0* C, T0* a1);
/* ET_XACE_OPTIONS.header */
extern T0* T110f355(T0* C);
/* ET_XACE_OPTIONS.default_header */
extern unsigned char ge1229os7666;
extern T0* ge1229ov7666;
extern T0* T110f275(T0* C);
/* ET_XACE_OPTIONS.is_header_declared */
extern T1 T110f353(T0* C);
/* ET_XACE_EXTERNALS.put_c_compiler_options */
extern void T125f8(T0* C, T0* a1);
/* ET_XACE_OPTIONS.c_compiler_options */
extern T0* T110f282(T0* C);
/* ET_XACE_OPTIONS.default_c_compiler_options */
extern unsigned char ge1229os7643;
extern T0* ge1229ov7643;
extern T0* T110f241(T0* C);
/* ET_XACE_OPTIONS.is_c_compiler_options_declared */
extern T1 T110f280(T0* C);
/* ET_XACE_EXTERNALS.make */
extern T0* T125c7(void);
/* ET_XACE_ECF_GENERATOR.print_settings */
extern void T45f33(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.use_full_cluster_name_as_namespace */
extern T1 T110f162(T0* C);
/* ET_XACE_OPTIONS.is_use_full_cluster_name_as_namespace_declared */
extern T1 T110f161(T0* C);
/* ET_XACE_OPTIONS.use_cluster_name_as_namespace */
extern T1 T110f160(T0* C);
/* ET_XACE_OPTIONS.is_use_cluster_name_as_namespace_declared */
extern T1 T110f159(T0* C);
/* ET_XACE_OPTIONS.is_shared_library_definition_declared */
extern T1 T110f143(T0* C);
/* ET_XACE_OPTIONS.old_verbatim_strings */
extern T1 T110f201(T0* C);
/* ET_XACE_OPTIONS.is_old_verbatim_strings_declared */
extern T1 T110f200(T0* C);
/* ET_XACE_OPTIONS.multithreaded */
extern T1 T110f126(T0* C);
/* ET_XACE_OPTIONS.is_multithreaded_declared */
extern T1 T110f125(T0* C);
/* ET_XACE_OPTIONS.msil_use_optimized_precompile */
extern T1 T110f199(T0* C);
/* ET_XACE_OPTIONS.is_msil_use_optimized_precompile_declared */
extern T1 T110f198(T0* C);
/* ET_XACE_OPTIONS.is_msil_key_file_name_declared */
extern T1 T110f196(T0* C);
/* ET_XACE_OPTIONS.target */
extern T0* T110f156(T0* C);
/* ET_XACE_OPTIONS.default_target */
extern unsigned char ge1229os7711;
extern T0* ge1229ov7711;
extern T0* T110f344(T0* C);
/* ET_XACE_OPTIONS.is_target_declared */
extern T1 T110f155(T0* C);
/* ET_XACE_OPTIONS.msil_generation */
extern T1 T110f122(T0* C);
/* ET_XACE_OPTIONS.is_msil_generation_declared */
extern T1 T110f121(T0* C);
/* ET_XACE_OPTIONS.is_msil_culture_declared */
extern T1 T110f194(T0* C);
/* ET_XACE_OPTIONS.is_msil_clr_version_declared */
extern T1 T110f119(T0* C);
/* ET_XACE_OPTIONS.msil_classes_per_module */
extern T6 T110f192(T0* C);
/* ET_XACE_OPTIONS.is_msil_classes_per_module_declared */
extern T1 T110f191(T0* C);
/* ET_XACE_OPTIONS.is_msil_assembly_compatibility_declared */
extern T1 T110f117(T0* C);
/* ET_XACE_OPTIONS.is_metadata_cache_path_declared */
extern T1 T110f115(T0* C);
/* ET_XACE_OPTIONS.line_generation */
extern T1 T110f104(T0* C);
/* ET_XACE_OPTIONS.is_line_generation_declared */
extern T1 T110f103(T0* C);
/* ET_XACE_OPTIONS.inlining_size */
extern T6 T110f379(T0* C);
/* ET_XACE_OPTIONS.is_inlining_size_declared */
extern T1 T110f377(T0* C);
/* ET_XACE_OPTIONS.inlining */
extern T0* T110f375(T0* C);
/* ET_XACE_OPTIONS.default_inlining */
extern unsigned char ge1229os7670;
extern T0* ge1229ov7670;
extern T0* T110f285(T0* C);
/* DS_HASH_SET [STRING_8].put_new */
extern void T113f40(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].item_storage_put */
extern void T113f49(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [STRING_8].slots_put */
extern void T113f52(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING_8].clashes_put */
extern void T113f51(T0* C, T6 a1, T6 a2);
/* ET_XACE_OPTIONS.is_inlining_declared */
extern T1 T110f373(T0* C);
/* ET_XACE_OPTIONS.il_verifiable */
extern T1 T110f367(T0* C);
/* ET_XACE_OPTIONS.is_il_verifiable_declared */
extern T1 T110f365(T0* C);
/* ET_XACE_OPTIONS.force_32bits */
extern T1 T110f188(T0* C);
/* ET_XACE_OPTIONS.is_force_32bits_declared */
extern T1 T110f187(T0* C);
/* ET_XACE_OPTIONS.is_external_runtime_declared */
extern T1 T110f185(T0* C);
/* ET_XACE_OPTIONS.exception_trace */
extern T1 T110f318(T0* C);
/* ET_XACE_OPTIONS.is_exception_trace_declared */
extern T1 T110f315(T0* C);
/* ET_XACE_OPTIONS.enforce_unique_class_names */
extern T1 T110f184(T0* C);
/* ET_XACE_OPTIONS.is_enforce_unique_class_names_declared */
extern T1 T110f183(T0* C);
/* ET_XACE_OPTIONS.dynamic_runtime */
extern T1 T110f313(T0* C);
/* ET_XACE_OPTIONS.is_dynamic_runtime_declared */
extern T1 T110f311(T0* C);
/* ET_XACE_OPTIONS.dotnet_naming_convention */
extern T1 T110f306(T0* C);
/* ET_XACE_OPTIONS.is_dotnet_naming_convention_declared */
extern T1 T110f304(T0* C);
/* ET_XACE_OPTIONS.dead_code_removal */
extern T0* T110f286(T0* C);
/* ET_XACE_OPTIONS.default_dead_code_removal */
extern unsigned char ge1229os7644;
extern T0* ge1229ov7644;
extern T0* T110f243(T0* C);
/* ET_XACE_OPTIONS.is_dead_code_removal_declared */
extern T1 T110f284(T0* C);
/* ET_XACE_OPTIONS.console_application */
extern T1 T110f270(T0* C);
/* ET_XACE_OPTIONS.is_console_application_declared */
extern T1 T110f268(T0* C);
/* ET_XACE_OPTIONS.cls_compliant */
extern T1 T110f262(T0* C);
/* ET_XACE_OPTIONS.is_cls_compliant_declared */
extern T1 T110f260(T0* C);
/* ET_XACE_OPTIONS.check_vape */
extern T1 T110f254(T0* C);
/* ET_XACE_OPTIONS.is_check_vape_declared */
extern T1 T110f252(T0* C);
/* ET_XACE_OPTIONS.check_generic_creation_constraint */
extern T1 T110f182(T0* C);
/* ET_XACE_OPTIONS.is_check_generic_creation_constraint_declared */
extern T1 T110f181(T0* C);
/* ET_XACE_OPTIONS.automatic_backup */
extern T1 T110f180(T0* C);
/* ET_XACE_OPTIONS.is_automatic_backup_declared */
extern T1 T110f179(T0* C);
/* ET_XACE_OPTIONS.array_optimization */
extern T1 T110f234(T0* C);
/* ET_XACE_OPTIONS.is_array_optimization_declared */
extern T1 T110f232(T0* C);
/* ET_XACE_OPTIONS.address_expression */
extern T1 T110f226(T0* C);
/* ET_XACE_OPTIONS.is_address_expression_declared */
extern T1 T110f224(T0* C);
/* ET_XACE_ECF_GENERATOR.print_options */
extern void T45f32(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.set_debug_option */
extern void T110f400(T0* C, T1 a1);
/* UT_TRISTATE.set_false */
extern void T236f7(T0* C);
/* UT_TRISTATE.set_true */
extern void T236f6(T0* C);
/* UT_TRISTATE.make_undefined */
extern T0* T236c5(void);
/* UT_TRISTATE.set_undefined */
extern void T236f8(T0* C);
/* ET_XACE_OPTIONS.is_debug_option_declared */
extern T1 T110f288(T0* C);
/* ET_XACE_OPTIONS.set_profile */
extern void T110f454(T0* C, T1 a1);
/* ET_XACE_OPTIONS.is_profile_declared */
extern T1 T110f137(T0* C);
/* ET_XACE_OPTIONS.set_trace */
extern void T110f466(T0* C, T1 a1);
/* ET_XACE_OPTIONS.is_trace_declared */
extern T1 T110f157(T0* C);
/* ET_XACE_OPTIONS.set_warning */
extern void T110f472(T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.options */
extern T0* T45f7(T0* C);
/* ET_XACE_OPTIONS.is_warning_declared */
extern T1 T110f169(T0* C);
/* ET_XACE_ECF_GENERATOR.print_indentation */
extern void T45f31(T0* C, T6 a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.print_quote_escaped_string */
extern void T45f30(T0* C, T0* a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.print_ecf_namespaces */
extern void T45f29(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.put_string */
extern void T79f31(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_put_string */
extern void T79f34(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_ps */
extern void T79f37(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_TEXT_OUTPUT_FILE.string_ */
extern T0* T79f9(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_line */
extern void T79f29(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.put_new_line */
extern void T79f30(T0* C);
/* ET_XACE_ACE_GENERATOR.generate_system */
extern void T44f19(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_GENERATOR.print_ace_file */
extern void T44f21(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_GENERATOR.print_link_libraries */
extern void T44f29(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [STRING_8].is_last */
extern T1 T31f7(T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_is_last */
extern T1 T33f8(T0* C, T0* a1);
/* ET_XACE_ACE_GENERATOR.replace_all_characters */
extern T0* T44f11(T0* C, T0* a1, T2 a2, T2 a3);
/* ET_XACE_ACE_GENERATOR.string_ */
extern T0* T44f9(T0* C);
/* ET_XACE_ACE_GENERATOR.is_windows */
extern T1 T44f10(T0* C);
/* ET_XACE_ACE_GENERATOR.operating_system */
extern T0* T44f16(T0* C);
/* ET_XACE_ACE_GENERATOR.execution_environment */
extern T0* T44f15(T0* C);
/* ET_XACE_ACE_GENERATOR.print_c_compiler_options_and_include_directories */
extern void T44f28(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_ACE_GENERATOR.print_assemblies */
extern void T44f27(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_GENERATOR.print_clusters */
extern void T44f26(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_GENERATOR.print_cluster */
extern void T44f30(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_GENERATOR.print_class_options */
extern T1 T44f13(T0* C, T0* a1, T6 a2, T0* a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].forth */
extern void T123f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].cursor_forth */
extern void T122f13(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].add_traversing_cursor */
extern void T122f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].set_next_cursor */
extern void T123f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].remove_traversing_cursor */
extern void T122f15(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].set */
extern void T123f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].item */
extern T0* T123f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].start */
extern void T123f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].cursor_start */
extern void T122f12(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].cursor_off */
extern T1 T122f7(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].new_cursor */
extern T0* T122f5(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].make */
extern T0* T123c7(T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].forth */
extern void T120f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].cursor_forth */
extern void T119f13(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].add_traversing_cursor */
extern void T119f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].set_next_cursor */
extern void T120f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].remove_traversing_cursor */
extern void T119f15(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].set */
extern void T120f10(T0* C, T0* a1, T1 a2, T1 a3);
/* ET_XACE_ACE_GENERATOR.options */
extern T0* T44f8(T0* C);
/* ET_XACE_OPTIONS.assertion */
extern T0* T110f242(T0* C);
/* ET_XACE_OPTIONS.default_assertion */
extern unsigned char ge1229os7631;
extern T0* ge1229ov7631;
extern T0* T110f221(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].item */
extern T0* T120f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].start */
extern void T120f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].cursor_start */
extern void T119f12(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].cursor_off */
extern T1 T119f7(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].new_cursor */
extern T0* T119f5(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].make */
extern T0* T120c7(T0* a1);
/* ET_XACE_ACE_GENERATOR.print_cluster_options */
extern T1 T44f12(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.namespace */
extern T0* T110f128(T0* C);
/* ET_XACE_OPTIONS.default_namespace */
extern unsigned char ge1229os7692;
extern T0* ge1229ov7692;
extern T0* T110f317(T0* C);
/* ET_XACE_OPTIONS.document */
extern T0* T110f302(T0* C);
/* ET_XACE_OPTIONS.default_document */
extern unsigned char ge1229os7648;
extern T0* ge1229ov7648;
extern T0* T110f251(T0* C);
/* ET_XACE_OPTIONS.is_document_declared */
extern T1 T110f300(T0* C);
/* ET_XACE_ACE_GENERATOR.print_options */
extern void T44f25(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.shared_library_definition */
extern T0* T110f144(T0* C);
/* ET_XACE_OPTIONS.default_shared_library_definition */
extern unsigned char ge1229os7704;
extern T0* ge1229ov7704;
extern T0* T110f332(T0* C);
/* ET_XACE_OPTIONS.precompiled */
extern T0* T110f134(T0* C);
/* ET_XACE_OPTIONS.default_precompiled */
extern unsigned char ge1229os7697;
extern T0* ge1229ov7697;
extern T0* T110f323(T0* C);
/* ET_XACE_OPTIONS.is_precompiled_declared */
extern T1 T110f133(T0* C);
/* ET_XACE_OPTIONS.override_cluster */
extern T0* T110f209(T0* C);
/* ET_XACE_OPTIONS.default_override_cluster */
extern unsigned char ge1229os7695;
extern T0* ge1229ov7695;
extern T0* T110f206(T0* C);
/* ET_XACE_OPTIONS.is_override_cluster_declared */
extern T1 T110f207(T0* C);
/* ET_XACE_OPTIONS.msil_generation_version */
extern T0* T110f124(T0* C);
/* ET_XACE_OPTIONS.default_msil_generation_version */
extern unsigned char ge1229os7688;
extern T0* ge1229ov7688;
extern T0* T110f314(T0* C);
/* ET_XACE_OPTIONS.is_msil_generation_version_declared */
extern T1 T110f123(T0* C);
/* ET_XACE_OPTIONS.msil_clr_version */
extern T0* T110f120(T0* C);
/* ET_XACE_OPTIONS.default_msil_clr_version */
extern unsigned char ge1229os7685;
extern T0* ge1229ov7685;
extern T0* T110f310(T0* C);
/* ET_XACE_OPTIONS.msil_assembly_compatibility */
extern T0* T110f118(T0* C);
/* ET_XACE_OPTIONS.default_msil_assembly_compatibility */
extern unsigned char ge1229os7683;
extern T0* ge1229ov7683;
extern T0* T110f309(T0* C);
/* ET_XACE_OPTIONS.metadata_cache_path */
extern T0* T110f116(T0* C);
/* ET_XACE_OPTIONS.default_metadata_cache_path */
extern unsigned char ge1229os7682;
extern T0* ge1229ov7682;
extern T0* T110f308(T0* C);
/* ET_XACE_OPTIONS.arguments */
extern T0* T110f230(T0* C);
/* ET_XACE_OPTIONS.default_arguments */
extern unsigned char ge1229os7628;
extern T0* ge1229ov7628;
extern T0* T110f216(T0* C);
/* ET_XACE_OPTIONS.is_arguments_declared */
extern T1 T110f228(T0* C);
/* ET_XACE_ACE_GENERATOR.print_escaped_name */
extern void T44f24(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_GENERATOR.is_lace_keyword */
extern T1 T44f7(T0* C, T0* a1);
/* ARRAY [STRING_8].item */
extern T0* T63f5(T0* C, T6 a1);
/* ET_XACE_ACE_GENERATOR.lace_keywords */
extern unsigned char ge1253os2809;
extern T0* ge1253ov2809;
extern T0* T44f14(T0* C);
/* UC_UTF8_STRING.has */
extern T1 T232f48(T0* C, T2 a1);
/* UC_UTF8_STRING.index_of */
extern T6 T232f51(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.index_of_item_code */
extern T6 T232f52(T0* C, T6 a1, T6 a2);
/* ET_XACE_ACE_GENERATOR.print_indentation */
extern void T44f23(T0* C, T6 a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.generate_system */
extern void T43f19(T0* C, T0* a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.print_xace_system_file */
extern void T43f21(T0* C, T0* a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.print_mounted_libraries */
extern void T43f28(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XACE_GENERATOR.print_clusters */
extern void T43f27(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XACE_GENERATOR.print_cluster */
extern void T43f30(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XACE_GENERATOR.print_class_options */
extern void T43f32(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XACE_GENERATOR.print_feature_options */
extern void T43f33(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XACE_GENERATOR.string_ */
extern T0* T43f10(T0* C);
/* ET_XACE_XACE_GENERATOR.print_console_application_option */
extern void T43f26(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XACE_GENERATOR.print_options */
extern void T43f25(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.wedit */
extern T1 T110f172(T0* C);
/* ET_XACE_OPTIONS.is_wedit_declared */
extern T1 T110f171(T0* C);
/* ET_XACE_OPTIONS.visible_filename */
extern T0* T110f168(T0* C);
/* ET_XACE_OPTIONS.default_visible_filename */
extern unsigned char ge1229os7720;
extern T0* ge1229ov7720;
extern T0* T110f356(T0* C);
/* ET_XACE_OPTIONS.is_visible_filename_declared */
extern T1 T110f167(T0* C);
/* ET_XACE_OPTIONS.verbose */
extern T1 T110f164(T0* C);
/* ET_XACE_OPTIONS.is_verbose_declared */
extern T1 T110f163(T0* C);
/* ET_XACE_OPTIONS.strip_option */
extern T1 T110f154(T0* C);
/* ET_XACE_OPTIONS.is_strip_option_declared */
extern T1 T110f153(T0* C);
/* ET_XACE_OPTIONS.storable_filename */
extern T0* T110f152(T0* C);
/* ET_XACE_OPTIONS.default_storable_filename */
extern unsigned char ge1229os7708;
extern T0* ge1229ov7708;
extern T0* T110f340(T0* C);
/* ET_XACE_OPTIONS.is_storable_filename_declared */
extern T1 T110f151(T0* C);
/* ET_XACE_OPTIONS.storable */
extern T1 T110f150(T0* C);
/* ET_XACE_OPTIONS.is_storable_declared */
extern T1 T110f149(T0* C);
/* ET_XACE_OPTIONS.stack_size */
extern T6 T110f148(T0* C);
/* ET_XACE_OPTIONS.is_stack_size_declared */
extern T1 T110f147(T0* C);
/* ET_XACE_OPTIONS.split */
extern T1 T110f146(T0* C);
/* ET_XACE_OPTIONS.is_split_declared */
extern T1 T110f145(T0* C);
/* ET_XACE_OPTIONS.reloads_optimization */
extern T1 T110f142(T0* C);
/* ET_XACE_OPTIONS.is_reloads_optimization_declared */
extern T1 T110f141(T0* C);
/* ET_XACE_OPTIONS.recursive */
extern T1 T110f217(T0* C);
/* ET_XACE_OPTIONS.is_recursive_declared */
extern T1 T110f215(T0* C);
/* ET_XACE_OPTIONS.read_only */
extern T1 T110f222(T0* C);
/* ET_XACE_OPTIONS.is_read_only_declared */
extern T1 T110f219(T0* C);
/* ET_XACE_OPTIONS.portable_code_generation */
extern T1 T110f132(T0* C);
/* ET_XACE_OPTIONS.is_portable_code_generation_declared */
extern T1 T110f131(T0* C);
/* ET_XACE_OPTIONS.no_default_lib */
extern T1 T110f130(T0* C);
/* ET_XACE_OPTIONS.is_no_default_lib_declared */
extern T1 T110f129(T0* C);
/* ET_XACE_OPTIONS.map */
extern T1 T110f114(T0* C);
/* ET_XACE_OPTIONS.is_map_declared */
extern T1 T110f113(T0* C);
/* ET_XACE_OPTIONS.manifest_string_trace */
extern T1 T110f112(T0* C);
/* ET_XACE_OPTIONS.is_manifest_string_trace_declared */
extern T1 T110f111(T0* C);
/* ET_XACE_OPTIONS.linux_fpu_double_precision */
extern T1 T110f110(T0* C);
/* ET_XACE_OPTIONS.is_linux_fpu_double_precision_declared */
extern T1 T110f109(T0* C);
/* ET_XACE_OPTIONS.linker */
extern T0* T110f108(T0* C);
/* ET_XACE_OPTIONS.default_linker */
extern unsigned char ge1229os7678;
extern T0* ge1229ov7678;
extern T0* T110f301(T0* C);
/* ET_XACE_OPTIONS.is_linker_declared */
extern T1 T110f107(T0* C);
/* ET_XACE_OPTIONS.leaves_optimization */
extern T1 T110f102(T0* C);
/* ET_XACE_OPTIONS.is_leaves_optimization_declared */
extern T1 T110f101(T0* C);
/* ET_XACE_OPTIONS.layout_optimization */
extern T1 T110f100(T0* C);
/* ET_XACE_OPTIONS.is_layout_optimization_declared */
extern T1 T110f99(T0* C);
/* ET_XACE_OPTIONS.layout */
extern T0* T110f98(T0* C);
/* ET_XACE_OPTIONS.default_layout */
extern unsigned char ge1229os7673;
extern T0* ge1229ov7673;
extern T0* T110f291(T0* C);
/* ET_XACE_OPTIONS.is_layout_declared */
extern T1 T110f97(T0* C);
/* ET_XACE_OPTIONS.jumps_optimization */
extern T1 T110f96(T0* C);
/* ET_XACE_OPTIONS.is_jumps_optimization_declared */
extern T1 T110f95(T0* C);
/* ET_XACE_OPTIONS.high_memory_compiler */
extern T1 T110f363(T0* C);
/* ET_XACE_OPTIONS.is_high_memory_compiler_declared */
extern T1 T110f361(T0* C);
/* ET_XACE_OPTIONS.heap_size */
extern T6 T110f359(T0* C);
/* ET_XACE_OPTIONS.is_heap_size_declared */
extern T1 T110f357(T0* C);
/* ET_XACE_OPTIONS.gc_info */
extern T1 T110f351(T0* C);
/* ET_XACE_OPTIONS.is_gc_info_declared */
extern T1 T110f349(T0* C);
/* ET_XACE_OPTIONS.garbage_collector */
extern T0* T110f347(T0* C);
/* ET_XACE_OPTIONS.default_garbage_collector */
extern unsigned char ge1229os7663;
extern T0* ge1229ov7663;
extern T0* T110f271(T0* C);
/* ET_XACE_OPTIONS.is_garbage_collector_declared */
extern T1 T110f345(T0* C);
/* ET_XACE_OPTIONS.fst_optimization */
extern T1 T110f343(T0* C);
/* ET_XACE_OPTIONS.is_fst_optimization_declared */
extern T1 T110f341(T0* C);
/* ET_XACE_OPTIONS.fst_expansion_factor */
extern T6 T110f339(T0* C);
/* ET_XACE_OPTIONS.is_fst_expansion_factor_declared */
extern T1 T110f337(T0* C);
/* ET_XACE_OPTIONS.flat_fst_optimization */
extern T1 T110f335(T0* C);
/* ET_XACE_OPTIONS.is_flat_fst_optimization_declared */
extern T1 T110f333(T0* C);
/* ET_XACE_OPTIONS.finalize_option */
extern T1 T110f330(T0* C);
/* ET_XACE_OPTIONS.is_finalize_option_declared */
extern T1 T110f328(T0* C);
/* ET_XACE_OPTIONS.debugger */
extern T1 T110f298(T0* C);
/* ET_XACE_OPTIONS.is_debugger_declared */
extern T1 T110f296(T0* C);
/* ET_XACE_OPTIONS.create_keyword_extension */
extern T1 T110f274(T0* C);
/* ET_XACE_OPTIONS.is_create_keyword_extension_declared */
extern T1 T110f272(T0* C);
/* ET_XACE_OPTIONS.component */
extern T0* T110f266(T0* C);
/* ET_XACE_OPTIONS.default_component */
extern unsigned char ge1229os7639;
extern T0* ge1229ov7639;
extern T0* T110f233(T0* C);
/* ET_XACE_OPTIONS.is_component_declared */
extern T1 T110f264(T0* C);
/* ET_XACE_OPTIONS.clean */
extern T1 T110f258(T0* C);
/* ET_XACE_OPTIONS.is_clean_declared */
extern T1 T110f256(T0* C);
/* ET_XACE_OPTIONS.case_insensitive */
extern T1 T110f250(T0* C);
/* ET_XACE_OPTIONS.is_case_insensitive_declared */
extern T1 T110f248(T0* C);
/* ET_XACE_OPTIONS.callback */
extern T0* T110f246(T0* C);
/* ET_XACE_OPTIONS.default_callback */
extern unsigned char ge1229os7633;
extern T0* ge1229ov7633;
extern T0* T110f223(T0* C);
/* ET_XACE_OPTIONS.is_callback_declared */
extern T1 T110f244(T0* C);
/* ET_XACE_OPTIONS.abstract */
extern T1 T110f213(T0* C);
/* ET_XACE_OPTIONS.is_abstract_declared */
extern T1 T110f211(T0* C);
/* ET_XACE_XACE_GENERATOR.print_indentation */
extern void T43f24(T0* C, T6 a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.print_quote_escaped_string */
extern void T43f23(T0* C, T0* a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.quot_entity */
extern T0* T43f8(T0* C);
/* ET_XACE_XACE_GENERATOR.print_escaped_string */
extern void T43f29(T0* C, T0* a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.print_escaped_character */
extern void T43f31(T0* C, T6 a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.amp_entity */
extern T0* T43f16(T0* C);
/* ET_XACE_XACE_GENERATOR.gt_entity */
extern T0* T43f14(T0* C);
/* ET_XACE_XACE_GENERATOR.lt_entity */
extern T0* T43f12(T0* C);
/* ET_XACE_XACE_GENERATOR.is_escaped */
extern T1 T43f9(T0* C, T6 a1);
/* ET_XACE_ECF_GENERATOR.generate_library */
extern void T45f26(T0* C, T0* a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.print_ecf_library_file */
extern void T45f28(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_CONFIG.merge_externals */
extern void T81f8(T0* C, T0* a1);
/* ET_XACE_ACE_GENERATOR.generate_library */
extern void T44f20(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_GENERATOR.print_precompile_ace_file */
extern void T44f22(T0* C, T0* a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.generate_library */
extern void T43f20(T0* C, T0* a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.print_xace_library_file */
extern void T43f22(T0* C, T0* a1, T0* a2);
/* GEXACE_VALIDATE_COMMAND.execute */
extern void T41f9(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_cannot_read_file_error */
extern void T28f16(T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.make */
extern T0* T84c7(T0* a1);
/* ET_XACE_PARSER.parse_file */
extern void T82f253(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.last_error_extended_description */
extern T0* T99f89(T0* C);
/* XM_EIFFEL_PARSER.string_ */
extern T0* T99f85(T0* C);
/* XM_EIFFEL_PARSER.last_error_description */
extern T0* T99f177(T0* C);
/* INTEGER_32.out */
extern T0* T6f20(T6* C);
/* STRING_8.append_integer */
extern void T17f47(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.safe_error_component */
extern T0* T99f170(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_safe_error_character */
extern T1 T99f109(T0* C, T2 a1);
/* CHARACTER_8.is_greater_equal */
extern T1 T2f14(T2* C, T2 a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_parser_error */
extern void T28f18(T0* C, T0* a1);
/* UT_MESSAGE.make */
extern T0* T106c7(T0* a1);
/* XM_TREE_CALLBACKS_PIPE.last_error */
extern T0* T92f8(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_not_xace_file_error */
extern void T28f19(T0* C, T0* a1);
/* ET_XACE_NOT_XACE_FILE_ERROR.make */
extern T0* T107c7(T0* a1);
/* ET_XACE_PARSER.new_library */
extern T0* T82f12(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_CONFIG.mount_libraries */
extern void T81f14(T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.mount_libraries */
extern void T109f9(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.mount_libraries */
extern void T108f16(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTERS.put_last */
extern void T108f6(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].force_last */
extern void T115f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].resize */
extern void T115f14(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER].resize */
extern T0* T238f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_XACE_CLUSTER].aliased_resized_area_with_default */
extern T0* T237f3(T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_XACE_CLUSTER].aliased_resized_area */
extern T0* T237f4(T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].new_capacity */
extern T6 T115f8(T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].extendible */
extern T1 T115f7(T0* C, T6 a1);
/* ET_XACE_CLUSTER.set_library_prefix */
extern void T116f49(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.set_library_prefix */
extern void T108f13(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_mounted */
extern void T116f51(T0* C, T1 a1);
/* ET_XACE_CLUSTERS.set_mounted */
extern void T108f17(T0* C, T1 a1);
/* ET_XACE_CLUSTERS.make_empty */
extern T0* T108c12(void);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].make */
extern T0* T115c10(T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].set_internal_cursor */
extern void T115f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].new_cursor */
extern T0* T115f6(T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_XACE_CLUSTER].make */
extern T0* T239c3(T0* a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER].make */
extern T0* T238f1(T0* C, T6 a1);
/* SPECIAL [ET_XACE_CLUSTER].make_filled */
extern T0* T237c5(T0* a1, T6 a2);
/* SPECIAL [ET_XACE_CLUSTER].fill_with */
extern void T237f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ET_XACE_CLUSTER].make */
extern void T237f7(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER].default_create */
extern T0* T238c3(void);
/* ET_XACE_PARSER.fill_library */
extern void T82f255(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_LIBRARY_CONFIG.set_libraries */
extern void T81f13(T0* C, T0* a1);
/* ET_XACE_LIBRARY_CONFIG.set_clusters */
extern void T81f12(T0* C, T0* a1);
/* ET_XACE_LIBRARY_CONFIG.merge_libraries */
extern void T81f15(T0* C, T0* a1, T0* a2);
/* ET_XACE_MOUNTED_LIBRARIES.merge_libraries */
extern void T109f10(T0* C, T0* a1, T0* a2);
/* ET_XACE_MOUNTED_LIBRARY.set_root */
extern void T118f12(T0* C, T1 a1);
/* ET_XACE_MOUNTED_LIBRARY.cloned_object */
extern T0* T118f8(T0* C);
/* ET_XACE_MOUNTED_LIBRARY.twin */
extern T0* T118f9(T0* C);
/* ET_XACE_MOUNTED_LIBRARY.copy */
extern void T118f13(T0* C, T0* a1);
/* ET_XACE_MOUNTED_LIBRARIES.set_root */
extern void T109f7(T0* C, T1 a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].is_empty */
extern T1 T117f6(T0* C);
/* ET_XACE_CLUSTERS.merge_libraries */
extern void T108f7(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTER.merge_libraries */
extern void T116f44(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTER.set_override */
extern void T116f43(T0* C, T1 a1);
/* ET_XACE_CLUSTERS.cluster_by_name */
extern T0* T108f2(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.string_ */
extern T0* T108f3(T0* C);
/* ET_XACE_PARSER.fill_externals */
extern void T82f258(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_CLUSTER.put_class_option */
extern void T116f35(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].put_last */
extern void T119f9(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_CLASS_OPTIONS].put_right */
extern void T243f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_CLASS_OPTIONS].make */
extern T0* T243c3(T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].is_empty */
extern T1 T119f6(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].make */
extern T0* T119c8(void);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].set_internal_cursor */
extern void T119f10(T0* C, T0* a1);
/* ET_XACE_PARSER.new_export */
extern T0* T82f144(T0* C, T0* a1, T0* a2);
/* ET_XACE_OPTIONS.set_export_option */
extern void T110f410(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].is_empty */
extern T1 T122f6(T0* C);
/* ET_XACE_CLASS_OPTIONS.put_feature_option */
extern void T121f5(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].put_last */
extern void T122f9(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_FEATURE_OPTIONS].put_right */
extern void T244f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_FEATURE_OPTIONS].make */
extern T0* T244c3(T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].make */
extern T0* T122c8(void);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].set_internal_cursor */
extern void T122f10(T0* C, T0* a1);
/* ET_XACE_PARSER.new_exported_feature */
extern T0* T82f249(T0* C, T0* a1, T0* a2);
/* ET_XACE_AST_FACTORY.new_feature_options */
extern T0* T87f9(T0* C, T0* a1, T0* a2);
/* ET_XACE_FEATURE_OPTIONS.make */
extern T0* T124c3(T0* a1, T0* a2);
/* ET_XACE_PARSER.uc_alias */
extern unsigned char ge1258os2506;
extern T0* ge1258ov2506;
extern T0* T82f251(T0* C);
/* ET_XACE_PARSER.uc_feature */
extern unsigned char ge1258os2507;
extern T0* ge1258ov2507;
extern T0* T82f248(T0* C);
/* ET_XACE_AST_FACTORY.new_class_options */
extern T0* T87f8(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLASS_OPTIONS.make */
extern T0* T121c4(T0* a1, T0* a2);
/* ET_XACE_PARSER.uc_class */
extern unsigned char ge1258os2482;
extern T0* ge1258ov2482;
extern T0* T82f27(T0* C);
/* ET_XACE_PARSER.uc_export */
extern unsigned char ge1258os2505;
extern T0* ge1258ov2505;
extern T0* T82f143(T0* C);
/* ET_XACE_OPTIONS.set_header */
extern void T110f421(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].force_last */
extern void T113f41(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].resize */
extern void T113f53(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].clashes_resize */
extern void T113f61(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].key_storage_resize */
extern void T113f60(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_resize */
extern void T113f59(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].slots_resize */
extern void T113f58(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].new_capacity */
extern T6 T113f18(T0* C, T6 a1);
/* ET_XACE_PARSER.uc_include_dir */
extern unsigned char ge1258os2504;
extern T0* ge1258ov2504;
extern T0* T82f142(T0* C);
/* ET_XACE_OPTIONS.set_link */
extern void T110f432(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].force_last */
extern void T114f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].resize */
extern void T114f21(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].new_capacity */
extern T6 T114f9(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].extendible */
extern T1 T114f8(T0* C, T6 a1);
/* ET_XACE_PARSER.uc_location */
extern unsigned char ge1258os2491;
extern T0* ge1258ov2491;
extern T0* T82f141(T0* C);
/* ET_XACE_PARSER.uc_link_library */
extern unsigned char ge1258os2508;
extern T0* ge1258ov2508;
extern T0* T82f140(T0* C);
/* ET_XACE_AST_FACTORY.new_options */
extern T0* T87f4(T0* C);
/* ET_XACE_OPTIONS.make */
extern T0* T110c381(void);
/* ET_XACE_PARSER.uc_external */
extern unsigned char ge1258os2495;
extern T0* ge1258ov2495;
extern T0* T82f25(T0* C);
/* ET_XACE_PARSER.new_options */
extern T0* T82f24(T0* C, T0* a1, T0* a2);
/* ET_XACE_PARSER.fill_options */
extern void T82f257(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_PARSER.uc_debug */
extern unsigned char ge1258os2502;
extern T0* ge1258ov2502;
extern T0* T82f139(T0* C);
/* ET_XACE_PARSER.uc_optimize */
extern unsigned char ge1258os2503;
extern T0* ge1258ov2503;
extern T0* T82f138(T0* C);
/* ET_XACE_PARSER.uc_check */
extern unsigned char ge1258os2501;
extern T0* ge1258ov2501;
extern T0* T82f136(T0* C);
/* ET_XACE_PARSER.uc_loop */
extern unsigned char ge1258os2500;
extern T0* ge1258ov2500;
extern T0* T82f133(T0* C);
/* ET_XACE_PARSER.uc_invariant */
extern unsigned char ge1258os2499;
extern T0* ge1258ov2499;
extern T0* T82f131(T0* C);
/* ET_XACE_PARSER.uc_ensure */
extern unsigned char ge1258os2498;
extern T0* ge1258ov2498;
extern T0* T82f129(T0* C);
/* ET_XACE_PARSER.uc_enable */
extern unsigned char ge1258os2496;
extern T0* ge1258ov2496;
extern T0* T82f127(T0* C);
/* ET_XACE_PARSER.uc_require */
extern unsigned char ge1258os2497;
extern T0* ge1258ov2497;
extern T0* T82f126(T0* C);
/* ET_XACE_OPTIONS.set_wedit */
extern void T110f473(T0* C, T1 a1);
/* ET_XACE_OPTIONS.valid_warning */
extern unsigned char ge1229os7531;
extern T0* ge1229ov7531;
extern T0* T110f205(T0* C);
/* DS_HASH_SET [STRING_8].put_last */
extern void T113f39(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].compress */
extern void T113f50(T0* C);
/* DS_HASH_SET [STRING_8].slots_wipe_out */
extern void T113f57(T0* C);
/* DS_HASH_SET [STRING_8].clashes_wipe_out */
extern void T113f56(T0* C);
/* DS_HASH_SET [STRING_8].move_all_cursors */
extern void T113f55(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING_8].key_storage_put */
extern void T113f54(T0* C, T0* a1, T6 a2);
/* ET_XACE_OPTIONS.set_visible_filename */
extern void T110f471(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_version */
extern void T110f470(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_verbose */
extern void T110f469(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_use_full_cluster_name_as_namespace */
extern void T110f468(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_use_cluster_name_as_namespace */
extern void T110f467(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_target */
extern void T110f465(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_target */
extern unsigned char ge1229os7529;
extern T0* ge1229ov7529;
extern T0* T110f202(T0* C);
/* ET_XACE_OPTIONS.set_syntax */
extern void T110f464(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_syntax */
extern unsigned char ge1229os7528;
extern T0* ge1229ov7528;
extern T0* T110f197(T0* C);
/* ET_XACE_OPTIONS.set_strip_option */
extern void T110f463(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_storable_filename */
extern void T110f462(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_stack_size */
extern void T110f461(T0* C, T6 a1);
/* ET_XACE_OPTIONS.set_split */
extern void T110f460(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_shared_library_definition */
extern void T110f459(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_reloads_optimization */
extern void T110f458(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_recursive */
extern void T110f457(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_read_only */
extern void T110f456(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_public_key_token */
extern void T110f455(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_prefix_option */
extern void T110f453(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_precompiled */
extern void T110f452(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_portable_code_generation */
extern void T110f451(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_override_cluster */
extern void T110f450(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_old_verbatim_strings */
extern void T110f449(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_no_default_lib */
extern void T110f448(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_namespace */
extern void T110f447(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_multithreaded */
extern void T110f446(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_msil_use_optimized_precompile */
extern void T110f445(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_msil_key_file_name */
extern void T110f444(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_msil_generation_version */
extern void T110f443(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_msil_generation */
extern void T110f442(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_msil_culture */
extern void T110f441(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_msil_clr_version */
extern void T110f440(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_msil_classes_per_module */
extern void T110f439(T0* C, T6 a1);
/* ET_XACE_OPTIONS.set_msil_assembly_compatibility */
extern void T110f438(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_metadata_cache_path */
extern void T110f437(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_map */
extern void T110f436(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_manifest_string_trace */
extern void T110f435(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_linux_fpu_double_precision */
extern void T110f434(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_linker */
extern void T110f433(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_linker */
extern unsigned char ge1229os7527;
extern T0* ge1229ov7527;
extern T0* T110f195(T0* C);
/* ET_XACE_OPTIONS.set_line_generation */
extern void T110f431(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_leaves_optimization */
extern void T110f430(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_layout_optimization */
extern void T110f429(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_layout */
extern void T110f428(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_layout */
extern unsigned char ge1229os7526;
extern T0* ge1229ov7526;
extern T0* T110f193(T0* C);
/* ET_XACE_OPTIONS.set_jumps_optimization */
extern void T110f427(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_inlining_size */
extern void T110f426(T0* C, T6 a1);
/* ET_XACE_OPTIONS.set_inlining */
extern void T110f425(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_inlining */
extern unsigned char ge1229os7525;
extern T0* ge1229ov7525;
extern T0* T110f190(T0* C);
/* ET_XACE_OPTIONS.set_include */
extern void T110f424(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_il_verifiable */
extern void T110f423(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_high_memory_compiler */
extern void T110f422(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_heap_size */
extern void T110f420(T0* C, T6 a1);
/* ET_XACE_OPTIONS.set_gc_info */
extern void T110f419(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_garbage_collector */
extern void T110f418(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_garbage_collector */
extern unsigned char ge1229os7524;
extern T0* ge1229ov7524;
extern T0* T110f189(T0* C);
/* ET_XACE_OPTIONS.set_full_class_checking */
extern void T110f417(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_fst_optimization */
extern void T110f416(T0* C, T1 a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_positive_integer_expected_error */
extern void T28f24(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.make */
extern T0* T214c7(T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_DEFAULT_POSITION.out */
extern T0* T167f5(T0* C);
/* XM_DEFAULT_POSITION.string_ */
extern T0* T167f6(T0* C);
/* ET_XACE_OPTIONS.set_fst_expansion_factor */
extern void T110f415(T0* C, T6 a1);
/* UC_UTF8_STRING.to_integer */
extern T6 T232f34(T0* C);
/* UC_UTF8_STRING.ctoi_convertor */
extern T0* T232f41(T0* C);
/* UC_UTF8_STRING.is_integer */
extern T1 T232f33(T0* C);
/* UC_UTF8_STRING.is_valid_integer_or_natural */
extern T1 T232f40(T0* C, T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.is_integral_integer */
extern T1 T74f12(T0* C);
/* STRING_8.is_integer */
extern T1 T17f16(T0* C);
/* STRING_8.is_valid_integer_or_natural */
extern T1 T17f20(T0* C, T6 a1);
/* ET_XACE_OPTIONS.set_force_32bits */
extern void T110f414(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_flat_fst_optimization */
extern void T110f413(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_finalize_option */
extern void T110f412(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_external_runtime */
extern void T110f411(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_exclude */
extern void T110f409(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_exception_trace */
extern void T110f408(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_enforce_unique_class_names */
extern void T110f407(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_ecf_library */
extern void T110f406(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_dynamic_runtime */
extern void T110f405(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_dotnet_naming_convention */
extern void T110f404(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_document */
extern void T110f403(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_debugger */
extern void T110f402(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_debug_tag */
extern void T110f401(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_dead_code_removal */
extern void T110f399(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_dead_code_removal */
extern unsigned char ge1229os7523;
extern T0* ge1229ov7523;
extern T0* T110f186(T0* C);
/* ET_XACE_OPTIONS.set_c_compiler_options */
extern void T110f398(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_culture */
extern void T110f397(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_create_keyword_extension */
extern void T110f396(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_console_application */
extern void T110f395(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_component */
extern void T110f394(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_cls_compliant */
extern void T110f393(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_clean */
extern void T110f392(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_check_vape */
extern void T110f391(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_case_insensitive */
extern void T110f390(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_callback */
extern void T110f389(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_callback */
extern unsigned char ge1229os7522;
extern T0* ge1229ov7522;
extern T0* T110f178(T0* C);
/* ET_XACE_OPTIONS.set_automatic_backup */
extern void T110f388(T0* C, T1 a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_wrong_attribute_value_error */
extern void T28f23(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.make */
extern T0* T213c7(T0* a1, T0* a2, T0* a3, T0* a4, T0* a5);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.string_ */
extern T0* T213f4(T0* C);
/* ET_XACE_OPTIONS.set_assertion */
extern void T110f387(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_assertion */
extern unsigned char ge1229os7521;
extern T0* ge1229ov7521;
extern T0* T110f173(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_non_empty_attribute_expected_error */
extern void T28f22(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.make */
extern T0* T212c7(T0* a1, T0* a2, T0* a3);
/* ET_XACE_OPTIONS.set_assembly */
extern void T110f386(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_array_optimization */
extern void T110f385(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_arguments */
extern void T110f384(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_address_expression */
extern void T110f383(T0* C, T1 a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_boolean_expected_error */
extern void T28f21(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.make */
extern T0* T211c7(T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_PARSER.is_false */
extern T1 T82f125(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_abstract */
extern void T110f382(T0* C, T1 a1);
/* ET_XACE_PARSER.is_true */
extern T1 T82f124(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].found_item */
extern T6 T149f22(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].item_storage_item */
extern T6 T149f33(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].found */
extern T1 T149f30(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].search */
extern void T149f36(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].search_position */
extern void T149f39(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].clashes_item */
extern T6 T149f24(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].hash_position */
extern T6 T149f25(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].key_storage_item */
extern T0* T149f21(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].slots_item */
extern T6 T149f26(T0* C, T6 a1);
/* ET_XACE_PARSER.option_codes */
extern unsigned char ge1230os4761;
extern T0* ge1230ov4761;
extern T0* T82f30(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].put_new */
extern void T149f38(T0* C, T6 a1, T0* a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].key_storage_put */
extern void T149f45(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].item_storage_put */
extern void T149f44(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].slots_put */
extern void T149f43(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].clashes_put */
extern void T149f42(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].unset_found_item */
extern void T149f41(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].set_key_equality_tester */
extern void T149f37(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [INTEGER_32, STRING_8].internal_set_equality_tester */
extern void T282f6(T0* C, T0* a1);
/* ET_XACE_PARSER.string_equality_tester */
extern T0* T82f14(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_map */
extern T0* T149c35(T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_with_equality_testers */
extern void T149f40(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [INTEGER_32, STRING_8].make */
extern T0* T282c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [INTEGER_32, STRING_8].set_internal_cursor */
extern void T282f7(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [INTEGER_32, STRING_8].new_cursor */
extern T0* T282f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [INTEGER_32, STRING_8].make */
extern T0* T355c3(T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].new_cursor */
extern T0* T149f28(T0* C);
/* DS_HASH_TABLE_CURSOR [INTEGER_32, STRING_8].make */
extern T0* T284c3(T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_sparse_container */
extern void T149f46(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].set_internal_cursor */
extern void T149f51(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_slots */
extern void T149f50(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].special_integer_ */
extern T0* T149f31(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].new_modulus */
extern T6 T149f27(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_clashes */
extern void T149f49(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_key_storage */
extern void T149f48(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_item_storage */
extern void T149f47(T0* C, T6 a1);
/* ET_XACE_PARSER.uc_value */
extern unsigned char ge1258os2487;
extern T0* ge1258ov2487;
extern T0* T82f29(T0* C);
/* ET_XACE_PARSER.uc_option */
extern unsigned char ge1258os2494;
extern T0* ge1258ov2494;
extern T0* T82f23(T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.put_last */
extern void T109f6(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].force_last */
extern void T117f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].resize */
extern void T117f14(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY].resize */
extern T0* T241f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].aliased_resized_area_with_default */
extern T0* T240f3(T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].aliased_resized_area */
extern T0* T240f4(T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].new_capacity */
extern T6 T117f9(T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].extendible */
extern T1 T117f8(T0* C, T6 a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_multiple_library_prefix_error */
extern void T28f20(T0* C, T0* a1, T0* a2);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.make */
extern T0* T210c7(T0* a1, T0* a2);
/* ET_XACE_MOUNTED_LIBRARY.same_library_prefix */
extern T1 T118f7(T0* C, T0* a1);
/* ET_XACE_MOUNTED_LIBRARY.string_ */
extern T0* T118f6(T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.item */
extern T0* T109f2(T0* C, T0* a1);
/* ET_XACE_MOUNTED_LIBRARIES.string_ */
extern T0* T109f3(T0* C);
/* ET_XACE_AST_FACTORY.new_mounted_libraries */
extern T0* T87f3(T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.make_empty */
extern T0* T109c5(void);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].make */
extern T0* T117c11(T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].set_internal_cursor */
extern void T117f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].new_cursor */
extern T0* T117f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_XACE_MOUNTED_LIBRARY].make */
extern T0* T242c3(T0* a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY].make */
extern T0* T241f1(T0* C, T6 a1);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].make_filled */
extern T0* T240c5(T0* a1, T6 a2);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].fill_with */
extern void T240f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].make */
extern void T240f7(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY].default_create */
extern T0* T241c3(void);
/* ET_XACE_PARSER.new_mount */
extern T0* T82f22(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_MOUNTED_LIBRARY.set_library_prefix */
extern void T118f11(T0* C, T0* a1);
/* ET_XACE_AST_FACTORY.new_mounted_library */
extern T0* T87f7(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_MOUNTED_LIBRARY.make */
extern T0* T118c10(T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_CONFIG_PARSER.parse_library */
extern void T80f257(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_CONFIG_PARSER.fill_library */
extern void T80f254(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_LIBRARY_CONFIG_PARSER.fill_externals */
extern void T80f256(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_LIBRARY_CONFIG_PARSER.new_export */
extern T0* T80f141(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_CONFIG_PARSER.new_exported_feature */
extern T0* T80f245(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_alias */
extern T0* T80f247(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_feature */
extern T0* T80f244(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_class */
extern T0* T80f144(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_export */
extern T0* T80f140(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_include_dir */
extern T0* T80f139(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_location */
extern T0* T80f138(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_link_library */
extern T0* T80f137(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_external */
extern T0* T80f25(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.new_options */
extern T0* T80f24(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_CONFIG_PARSER.fill_options */
extern void T80f255(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_debug */
extern T0* T80f136(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_optimize */
extern T0* T80f135(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_check */
extern T0* T80f133(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_loop */
extern T0* T80f130(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_invariant */
extern T0* T80f128(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_ensure */
extern T0* T80f126(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_enable */
extern T0* T80f124(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_require */
extern T0* T80f123(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.is_false */
extern T1 T80f122(T0* C, T0* a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.is_true */
extern T1 T80f121(T0* C, T0* a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.option_codes */
extern T0* T80f27(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.string_equality_tester */
extern T0* T80f13(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_value */
extern T0* T80f26(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_option */
extern T0* T80f23(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.new_mount */
extern T0* T80f22(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_CONFIG_PARSER.execution_environment */
extern T0* T80f146(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_mount */
extern unsigned char ge1258os2490;
extern T0* ge1258ov2490;
extern T0* T80f21(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_prefix */
extern unsigned char ge1258os2492;
extern T0* ge1258ov2492;
extern T0* T80f20(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.new_cluster */
extern T0* T80f19(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_CLUSTER.set_libraries */
extern void T116f41(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_subclusters */
extern void T116f40(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.set_parent */
extern void T108f14(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_parent */
extern void T116f50(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_dependant_constraint */
extern void T116f53(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.set_dependant_constraint */
extern void T108f19(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_provider_constraint */
extern void T116f52(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.set_provider_constraint */
extern void T108f18(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_options */
extern void T116f39(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_read_only */
extern void T116f38(T0* C, T1 a1);
/* ET_XACE_CLUSTER.set_recursive */
extern void T116f37(T0* C, T1 a1);
/* ET_XACE_CLUSTER.set_abstract */
extern void T116f36(T0* C, T1 a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.new_class */
extern T0* T80f145(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_CONFIG_PARSER.new_feature */
extern T0* T80f246(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTER.set_cluster_prefix */
extern void T116f34(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_relative */
extern void T116f33(T0* C, T1 a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_relative */
extern unsigned char ge1258os2489;
extern T0* ge1258ov2489;
extern T0* T80f143(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_attribute_obsoleted_by_element_warning */
extern void T28f35(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_warning */
extern void T28f33(T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_warning_message */
extern void T28f34(T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_line */
extern void T60f4(T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_new_line */
extern void T60f6(T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_string */
extern void T60f5(T0* C, T0* a1);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.make */
extern T0* T312c7(T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_abstract */
extern unsigned char ge1258os2488;
extern T0* ge1258ov2488;
extern T0* T80f142(T0* C);
/* ET_XACE_AST_FACTORY.new_cluster */
extern T0* T87f6(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_CLUSTER.make */
extern T0* T116c32(T0* a1, T0* a2, T0* a3);
/* ET_XACE_CLUSTER.set_scm_mapping_constraint_enabled */
extern void T116f42(T0* C, T1 a1);
/* ET_XACE_CLUSTERS.set_scm_mapping_constraint_enabled */
extern void T108f15(T0* C, T1 a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_cluster */
extern unsigned char ge1258os2485;
extern T0* ge1258ov2485;
extern T0* T80f17(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.string_ */
extern T0* T80f16(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_name */
extern unsigned char ge1258os2486;
extern T0* ge1258ov2486;
extern T0* T80f15(T0* C);
/* ET_XACE_PARSER.execution_environment */
extern T0* T82f150(T0* C);
/* UC_UTF8_STRING.has_substring */
extern T1 T232f53(T0* C, T0* a1);
/* STRING_8.has_substring */
extern T1 T17f32(T0* C, T0* a1);
/* STRING_8.substring_index */
extern T6 T17f34(T0* C, T0* a1, T6 a2);
/* STRING_SEARCHER.substring_index */
extern T6 T439f2(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* STRING_SEARCHER.substring_index_with_deltas */
extern T6 T439f3(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* STRING_SEARCHER.internal_initialize_deltas */
extern void T439f6(T0* C, T0* a1, T6 a2, T0* a3);
/* STRING_8.string_searcher */
extern unsigned char ge2274os1243;
extern T0* ge2274ov1243;
extern T0* T17f35(T0* C);
/* STRING_SEARCHER.make */
extern T0* T439c5(void);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].force_new */
extern void T97f54(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].key_storage_put */
extern void T97f60(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].item_storage_put */
extern void T97f59(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].slots_put */
extern void T97f58(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].clashes_put */
extern void T97f57(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].slots_item */
extern T6 T97f30(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].hash_position */
extern T6 T97f29(T0* C, T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].clashes_item */
extern T6 T97f28(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].resize */
extern void T97f56(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].clashes_resize */
extern void T97f64(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].special_integer_ */
extern T0* T97f22(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].key_storage_resize */
extern void T97f63(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].item_storage_resize */
extern void T97f62(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY_CONFIG].resize */
extern T0* T165f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_XACE_LIBRARY_CONFIG].aliased_resized_area_with_default */
extern T0* T164f3(T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_XACE_LIBRARY_CONFIG].aliased_resized_area */
extern T0* T164f4(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].key_storage_item */
extern T0* T97f33(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].slots_resize */
extern void T97f61(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].new_modulus */
extern T6 T97f31(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].new_capacity */
extern T6 T97f26(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].unset_found_item */
extern void T97f42(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].found_item */
extern T0* T97f24(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].item_storage_item */
extern T0* T97f25(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].found */
extern T1 T97f23(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].search */
extern void T97f53(T0* C, T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].search_position */
extern void T97f55(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_mount */
extern T0* T82f21(T0* C);
/* ET_XACE_LIBRARY_CONFIG.set_library_prefix */
extern void T81f11(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_prefix */
extern T0* T82f20(T0* C);
/* ET_XACE_AST_FACTORY.new_clusters */
extern T0* T87f2(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.make */
extern T0* T108c5(T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].put_last */
extern void T115f11(T0* C, T0* a1);
/* ET_XACE_LIBRARY_CONFIG.set_options */
extern void T81f10(T0* C, T0* a1);
/* ET_XACE_PARSER.new_cluster */
extern T0* T82f19(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_PARSER.new_class */
extern T0* T82f147(T0* C, T0* a1, T0* a2);
/* ET_XACE_PARSER.new_feature */
extern T0* T82f250(T0* C, T0* a1, T0* a2);
/* ET_XACE_PARSER.uc_relative */
extern T0* T82f146(T0* C);
/* ET_XACE_PARSER.uc_abstract */
extern T0* T82f145(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_element_obsoleted_by_element_warning */
extern void T28f25(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.make */
extern T0* T215c7(T0* a1, T0* a2, T0* a3);
/* XM_POSITION_TABLE.item */
extern T0* T90f2(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].forth */
extern void T226f10(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_forth */
extern void T227f12(T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].add_traversing_cursor */
extern void T227f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set_next_cursor */
extern void T226f13(T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].remove_traversing_cursor */
extern void T227f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set */
extern void T226f11(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].go_after */
extern void T226f9(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_go_after */
extern void T227f11(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set_after */
extern void T226f12(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_off */
extern T1 T227f6(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].item */
extern T0* T226f6(T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].start */
extern void T226f8(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_start */
extern void T227f10(T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].new_cursor */
extern T0* T227f7(T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T226c7(T0* a1);
/* ET_XACE_LIBRARY_CONFIG.set_name */
extern void T81f9(T0* C, T0* a1);
/* XM_ELEMENT.attribute_by_name */
extern T0* T89f18(T0* C, T0* a1);
/* XM_ELEMENT.attribute_same_name */
extern T1 T89f9(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.same_string */
extern T1 T89f11(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.string_equality_tester */
extern T0* T89f13(T0* C);
/* XM_NODE_TYPER.is_attribute */
extern T1 T410f8(T0* C);
/* XM_ELEMENT.has_attribute_by_name */
extern T1 T89f15(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_name */
extern T0* T82f17(T0* C);
/* ET_TOKEN_CONSTANTS.unknown_system */
extern unsigned char ge922os8975;
extern T0* ge922ov8975;
extern T0* T141f1(T0* C);
/* ET_SYSTEM.make */
extern T0* T142c93(T0* a1);
/* ET_SYSTEM.make_adapted */
extern void T142f100(T0* C, T0* a1, T0* a2);
/* ET_SYSTEM.set_system_name */
extern void T142f99(T0* C, T0* a1);
/* ET_AST_NULL_PROCESSOR.make */
extern T0* T250c1(void);
/* ET_SYSTEM.set_kernel_types */
extern void T142f98(T0* C);
/* ET_SYSTEM.set_wide_character_type */
extern void T142f154(T0* C);
/* ET_CLASS_TYPE.make */
extern T0* T261c4(T0* a1, T0* a2, T0* a3);
/* ET_MASTER_CLASS.set_in_system */
extern void T259f21(T0* C, T1 a1);
/* ET_MASTER_CLASS.set_marked */
extern void T259f24(T0* C, T1 a1);
/* ET_CLASS.set_marked */
extern void T279f35(T0* C, T1 a1);
/* ET_CLASS.is_unknown */
extern T1 T279f29(T0* C);
/* ET_NONE_GROUP.is_unknown */
extern T1 T280f4(T0* C);
/* ET_MASTER_CLASS.actual_class */
extern T0* T259f18(T0* C);
/* ET_CLASS.actual_class */
extern T0* T279f31(T0* C);
/* ET_SYSTEM.master_class */
extern T0* T142f91(T0* C, T0* a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].force_last_new */
extern void T255f38(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].key_storage_put */
extern void T255f46(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].item_storage_put */
extern void T255f45(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].slots_put */
extern void T255f44(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].clashes_put */
extern void T255f43(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].slots_item */
extern T6 T255f26(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].hash_position */
extern T6 T255f24(T0* C, T0* a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].resize */
extern void T255f42(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].clashes_resize */
extern void T255f51(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].special_integer_ */
extern T0* T255f29(T0* C);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].key_storage_resize */
extern void T255f50(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_CLASS_NAME].resize */
extern T0* T335f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_CLASS_NAME].aliased_resized_area_with_default */
extern T0* T332f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_CLASS_NAME].aliased_resized_area */
extern T0* T332f4(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].item_storage_resize */
extern void T255f49(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_MASTER_CLASS].resize */
extern T0* T334f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_MASTER_CLASS].aliased_resized_area_with_default */
extern T0* T328f3(T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_MASTER_CLASS].aliased_resized_area */
extern T0* T328f4(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].key_storage_item */
extern T0* T255f33(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].clashes_item */
extern T6 T255f21(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].slots_resize */
extern void T255f48(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].new_modulus */
extern T6 T255f22(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].new_capacity */
extern T6 T255f32(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].unset_found_item */
extern void T255f41(T0* C);
/* ET_MASTER_CLASS.make */
extern T0* T259c20(T0* a1, T0* a2);
/* ET_TOKEN_CONSTANTS.unknown_class */
extern unsigned char ge922os8973;
extern T0* ge922ov8973;
extern T0* T141f102(T0* C);
/* ET_CLASS.set_implementation_error */
extern void T279f46(T0* C);
/* ET_CLASS.set_implementation_checked */
extern void T279f45(T0* C);
/* ET_CLASS.set_interface_error */
extern void T279f44(T0* C);
/* ET_CLASS.set_interface_checked */
extern void T279f43(T0* C);
/* ET_CLASS.set_flattening_error */
extern void T279f42(T0* C);
/* ET_CLASS.set_features_flattened */
extern void T279f41(T0* C);
/* ET_CLASS.set_ancestors_error */
extern void T279f40(T0* C);
/* ET_CLASS.set_ancestors_built */
extern void T279f39(T0* C);
/* ET_CLASS.set_syntax_error */
extern void T279f38(T0* C);
/* ET_CLASS.set_parsed */
extern void T279f37(T0* C);
/* ET_CLASS.set_group */
extern void T279f34(T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.unknown_group */
extern unsigned char ge922os8974;
extern T0* ge922ov8974;
extern T0* T141f108(T0* C);
/* ET_UNKNOWN_GROUP.make */
extern T0* T381c6(void);
/* ET_CLASS.make_unknown */
extern T0* T279c36(void);
/* ET_CLASS.make */
extern void T279f32(T0* C, T0* a1);
/* ET_CLASS.make */
extern T0* T279c32(T0* a1);
/* ET_CLASS_CODES.class_code */
extern T8 T382f1(T0* C, T0* a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].found_item */
extern T8 T420f30(T0* C);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].item_storage_item */
extern T8 T420f27(T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].found */
extern T1 T420f31(T0* C);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].search */
extern void T420f36(T0* C, T0* a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].search_position */
extern void T420f40(T0* C, T0* a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].clashes_item */
extern T6 T420f21(T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].hash_position */
extern T6 T420f24(T0* C, T0* a1);
/* ET_CLASS_NAME_TESTER.test */
extern T1 T256f1(T0* C, T0* a1, T0* a2);
/* ET_IDENTIFIER.same_class_name */
extern T1 T346f6(T0* C, T0* a1);
/* ET_IDENTIFIER.string_ */
extern T0* T346f4(T0* C);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].key_storage_item */
extern T0* T420f33(T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].slots_item */
extern T6 T420f26(T0* C, T6 a1);
/* ET_CLASS_CODES.codes_by_name */
extern unsigned char ge904os14591;
extern T0* ge904ov14591;
extern T0* T382f2(T0* C);
/* ET_TOKEN_CONSTANTS.disposable_class_name */
extern unsigned char ge922os8218;
extern T0* ge922ov8218;
extern T0* T141f116(T0* C);
/* ET_IDENTIFIER.make */
extern T0* T346c7(T0* a1);
/* ET_IDENTIFIER.make_with_hash_code */
extern void T346f8(T0* C, T0* a1, T6 a2);
/* ET_IDENTIFIER.make_leaf */
extern void T346f9(T0* C);
/* ET_IDENTIFIER.new_hash_code */
extern T6 T346f5(T0* C, T0* a1);
/* CHARACTER_8.upper */
extern T2 T2f20(T2* C);
/* CHARACTER_8.is_lower */
extern T1 T2f21(T2* C);
/* ET_TOKEN_CONSTANTS.system_object_class_name */
extern unsigned char ge922os8248;
extern T0* ge922ov8248;
extern T0* T141f48(T0* C);
/* ET_TOKEN_CONSTANTS.any_class_name */
extern unsigned char ge922os8210;
extern T0* ge922ov8210;
extern T0* T141f30(T0* C);
/* ET_TOKEN_CONSTANTS.array_class_name */
extern unsigned char ge922os8212;
extern T0* ge922ov8212;
extern T0* T141f32(T0* C);
/* ET_TOKEN_CONSTANTS.typed_pointer_class_name */
extern unsigned char ge922os8252;
extern T0* ge922ov8252;
extern T0* T141f51(T0* C);
/* ET_TOKEN_CONSTANTS.type_class_name */
extern unsigned char ge922os8251;
extern T0* ge922ov8251;
extern T0* T141f50(T0* C);
/* ET_TOKEN_CONSTANTS.special_class_name */
extern unsigned char ge922os8244;
extern T0* ge922ov8244;
extern T0* T141f46(T0* C);
/* ET_TOKEN_CONSTANTS.routine_class_name */
extern unsigned char ge922os8243;
extern T0* ge922ov8243;
extern T0* T141f45(T0* C);
/* ET_TOKEN_CONSTANTS.procedure_class_name */
extern unsigned char ge922os8239;
extern T0* ge922ov8239;
extern T0* T141f44(T0* C);
/* ET_TOKEN_CONSTANTS.predicate_class_name */
extern unsigned char ge922os8238;
extern T0* ge922ov8238;
extern T0* T141f43(T0* C);
/* ET_TOKEN_CONSTANTS.function_class_name */
extern unsigned char ge922os8220;
extern T0* ge922ov8220;
extern T0* T141f34(T0* C);
/* ET_TOKEN_CONSTANTS.tuple_class_name */
extern unsigned char ge922os8250;
extern T0* ge922ov8250;
extern T0* T141f31(T0* C);
/* ET_TOKEN_CONSTANTS.pointer_class_name */
extern unsigned char ge922os8237;
extern T0* ge922ov8237;
extern T0* T141f42(T0* C);
/* ET_TOKEN_CONSTANTS.real_64_class_name */
extern unsigned char ge922os8242;
extern T0* ge922ov8242;
extern T0* T141f6(T0* C);
/* ET_TOKEN_CONSTANTS.real_32_class_name */
extern unsigned char ge922os8241;
extern T0* ge922ov8241;
extern T0* T141f12(T0* C);
/* ET_TOKEN_CONSTANTS.natural_64_class_name */
extern unsigned char ge922os8234;
extern T0* ge922ov8234;
extern T0* T141f40(T0* C);
/* ET_TOKEN_CONSTANTS.natural_32_class_name */
extern unsigned char ge922os8233;
extern T0* ge922ov8233;
extern T0* T141f10(T0* C);
/* ET_TOKEN_CONSTANTS.natural_16_class_name */
extern unsigned char ge922os8232;
extern T0* ge922ov8232;
extern T0* T141f39(T0* C);
/* ET_TOKEN_CONSTANTS.natural_8_class_name */
extern unsigned char ge922os8231;
extern T0* ge922ov8231;
extern T0* T141f38(T0* C);
/* ET_TOKEN_CONSTANTS.integer_64_class_name */
extern unsigned char ge922os8226;
extern T0* ge922ov8226;
extern T0* T141f37(T0* C);
/* ET_TOKEN_CONSTANTS.integer_32_class_name */
extern unsigned char ge922os8225;
extern T0* ge922ov8225;
extern T0* T141f8(T0* C);
/* ET_TOKEN_CONSTANTS.integer_16_class_name */
extern unsigned char ge922os8224;
extern T0* ge922ov8224;
extern T0* T141f36(T0* C);
/* ET_TOKEN_CONSTANTS.integer_8_class_name */
extern unsigned char ge922os8223;
extern T0* ge922ov8223;
extern T0* T141f35(T0* C);
/* ET_TOKEN_CONSTANTS.character_32_class_name */
extern unsigned char ge922os8217;
extern T0* ge922ov8217;
extern T0* T141f15(T0* C);
/* ET_TOKEN_CONSTANTS.character_8_class_name */
extern unsigned char ge922os8216;
extern T0* ge922ov8216;
extern T0* T141f4(T0* C);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].force_last */
extern void T420f38(T0* C, T8 a1, T0* a2);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].key_storage_put */
extern void T420f46(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].slots_put */
extern void T420f45(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].clashes_put */
extern void T420f44(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].resize */
extern void T420f43(T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].clashes_resize */
extern void T420f51(T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].special_integer_ */
extern T0* T420f29(T0* C);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].key_storage_resize */
extern void T420f50(T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].item_storage_resize */
extern void T420f49(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [NATURAL_8].resize */
extern T0* T437f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [NATURAL_8].aliased_resized_area_with_default */
extern T0* T105f3(T0* C, T8 a1, T6 a2);
/* SPECIAL [NATURAL_8].aliased_resized_area */
extern T0* T105f4(T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].slots_resize */
extern void T420f48(T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].new_modulus */
extern T6 T420f22(T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].new_capacity */
extern T6 T420f32(T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].item_storage_put */
extern void T420f42(T0* C, T8 a1, T6 a2);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].unset_found_item */
extern void T420f41(T0* C);
/* ET_TOKEN_CONSTANTS.boolean_class_name */
extern unsigned char ge922os8214;
extern T0* ge922ov8214;
extern T0* T141f33(T0* C);
/* ET_CLASS_CODES.tokens */
extern unsigned char ge916os4794;
extern T0* ge916ov4794;
extern T0* T382f6(T0* C);
/* ET_TOKEN_CONSTANTS.default_create */
extern T0* T141c129(void);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].set_key_equality_tester */
extern void T420f37(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [NATURAL_8, ET_CLASS_NAME].internal_set_equality_tester */
extern void T434f6(T0* C, T0* a1);
/* ET_CLASS_CODES.class_name_tester */
extern unsigned char ge970os9691;
extern T0* ge970ov9691;
extern T0* T382f4(T0* C);
/* ET_CLASS_NAME_TESTER.default_create */
extern T0* T256c2(void);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].make_map */
extern T0* T420c35(T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].make_with_equality_testers */
extern void T420f39(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [NATURAL_8, ET_CLASS_NAME].make */
extern T0* T434c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [NATURAL_8, ET_CLASS_NAME].set_internal_cursor */
extern void T434f7(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [NATURAL_8, ET_CLASS_NAME].new_cursor */
extern T0* T434f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [NATURAL_8, ET_CLASS_NAME].make */
extern T0* T438c3(T0* a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].new_cursor */
extern T0* T420f28(T0* C);
/* DS_HASH_TABLE_CURSOR [NATURAL_8, ET_CLASS_NAME].make */
extern T0* T436c3(T0* a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].make_sparse_container */
extern void T420f47(T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].set_internal_cursor */
extern void T420f56(T0* C, T0* a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].make_slots */
extern void T420f55(T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].make_clashes */
extern void T420f54(T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].make_key_storage */
extern void T420f53(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_CLASS_NAME].make */
extern T0* T335f2(T0* C, T6 a1);
/* SPECIAL [ET_CLASS_NAME].make_filled */
extern T0* T332c5(T0* a1, T6 a2);
/* SPECIAL [ET_CLASS_NAME].fill_with */
extern void T332f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ET_CLASS_NAME].make */
extern void T332f7(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_CLASS_NAME].default_create */
extern T0* T335c3(void);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].make_item_storage */
extern void T420f52(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [NATURAL_8].make */
extern T0* T437f2(T0* C, T6 a1);
/* SPECIAL [NATURAL_8].make_filled */
extern T0* T105c7(T8 a1, T6 a2);
/* SPECIAL [NATURAL_8].fill_with */
extern void T105f8(T0* C, T8 a1, T6 a2, T6 a3);
/* KL_SPECIAL_ROUTINES [NATURAL_8].default_create */
extern T0* T437c3(void);
/* ET_CLASS.class_codes */
extern unsigned char ge915os13267;
extern T0* ge915ov13267;
extern T0* T279f28(T0* C);
/* ET_CLASS_CODES.default_create */
extern T0* T382c32(void);
/* ET_TOKEN_CONSTANTS.end_keyword */
extern unsigned char ge922os8523;
extern T0* ge922ov8523;
extern T0* T141f103(T0* C);
/* ET_KEYWORD.make_end */
extern T0* T340c5(void);
/* ET_KEYWORD.make_token */
extern void T340f7(T0* C, T0* a1);
/* ET_KEYWORD.make_leaf */
extern void T340f8(T0* C);
/* ET_KEYWORD.tokens */
extern T0* T340f4(T0* C);
/* ET_TOKEN_CONSTANTS.class_keyword */
extern unsigned char ge922os8512;
extern T0* ge922ov8512;
extern T0* T141f112(T0* C);
/* ET_KEYWORD.make_class */
extern T0* T340c9(void);
/* ET_TOKEN_CONSTANTS.empty_procedures */
extern unsigned char ge922os8971;
extern T0* ge922ov8971;
extern T0* T141f111(T0* C);
/* ET_PROCEDURE_LIST.make_with_capacity */
extern T0* T380c4(T6 a1);
/* KL_SPECIAL_ROUTINES [ET_PROCEDURE].make */
extern T0* T430f1(T0* C, T6 a1);
/* SPECIAL [ET_PROCEDURE].make_filled */
extern T0* T429c2(T0* a1, T6 a2);
/* SPECIAL [ET_PROCEDURE].fill_with */
extern void T429f4(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ET_PROCEDURE].make */
extern void T429f3(T0* C, T6 a1);
/* ET_PROCEDURE_LIST.fixed_array */
extern unsigned char ge827os12714;
extern T0* ge827ov12714;
extern T0* T380f3(T0* C);
/* KL_SPECIAL_ROUTINES [ET_PROCEDURE].default_create */
extern T0* T430c2(void);
/* ET_TOKEN_CONSTANTS.empty_queries */
extern unsigned char ge922os8970;
extern T0* ge922ov8970;
extern T0* T141f110(T0* C);
/* ET_QUERY_LIST.make_with_capacity */
extern T0* T379c4(T6 a1);
/* KL_SPECIAL_ROUTINES [ET_QUERY].make */
extern T0* T427f1(T0* C, T6 a1);
/* SPECIAL [ET_QUERY].make_filled */
extern T0* T426c2(T0* a1, T6 a2);
/* SPECIAL [ET_QUERY].fill_with */
extern void T426f4(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ET_QUERY].make */
extern void T426f3(T0* C, T6 a1);
/* ET_QUERY_LIST.fixed_array */
extern unsigned char ge829os12714;
extern T0* ge829ov12714;
extern T0* T379f3(T0* C);
/* KL_SPECIAL_ROUTINES [ET_QUERY].default_create */
extern T0* T427c2(void);
/* ET_TOKEN_CONSTANTS.empty_ancestors */
extern unsigned char ge922os8969;
extern T0* ge922ov8969;
extern T0* T141f109(T0* C);
/* ET_BASE_TYPE_LIST.make_with_capacity */
extern T0* T378c4(T6 a1);
/* KL_SPECIAL_ROUTINES [ET_BASE_TYPE].make */
extern T0* T424f1(T0* C, T6 a1);
/* SPECIAL [ET_BASE_TYPE].make_filled */
extern T0* T423c2(T0* a1, T6 a2);
/* SPECIAL [ET_BASE_TYPE].fill_with */
extern void T423f4(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ET_BASE_TYPE].make */
extern void T423f3(T0* C, T6 a1);
/* ET_BASE_TYPE_LIST.fixed_array */
extern unsigned char ge981os14374;
extern T0* ge981ov14374;
extern T0* T378f3(T0* C);
/* KL_SPECIAL_ROUTINES [ET_BASE_TYPE].default_create */
extern T0* T424c2(void);
/* ET_TOKEN_CONSTANTS.unknown_class_name */
extern unsigned char ge922os8254;
extern T0* ge922ov8254;
extern T0* T141f113(T0* C);
/* ET_CLASS.tokens */
extern T0* T279f25(T0* C);
/* ET_TOKEN_CONSTANTS.empty_master_classes */
extern unsigned char ge922os8980;
extern T0* ge922ov8980;
extern T0* T141f101(T0* C);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].make */
extern T0* T337c14(T6 a1);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].set_internal_cursor */
extern void T337f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].new_cursor */
extern T0* T337f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_MASTER_CLASS].make */
extern T0* T414c4(T0* a1);
/* KL_SPECIAL_ROUTINES [ET_MASTER_CLASS].make */
extern T0* T334f2(T0* C, T6 a1);
/* SPECIAL [ET_MASTER_CLASS].make_filled */
extern T0* T328c5(T0* a1, T6 a2);
/* SPECIAL [ET_MASTER_CLASS].fill_with */
extern void T328f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ET_MASTER_CLASS].make */
extern void T328f7(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_MASTER_CLASS].default_create */
extern T0* T334c3(void);
/* ET_TOKEN_CONSTANTS.empty_classes */
extern unsigned char ge922os8979;
extern T0* ge922ov8979;
extern T0* T141f100(T0* C);
/* DS_ARRAYED_LIST [ET_CLASS].make */
extern T0* T336c9(T6 a1);
/* DS_ARRAYED_LIST [ET_CLASS].set_internal_cursor */
extern void T336f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_CLASS].new_cursor */
extern T0* T336f6(T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_CLASS].make */
extern T0* T401c4(T0* a1);
/* KL_SPECIAL_ROUTINES [ET_CLASS].make */
extern T0* T399f1(T0* C, T6 a1);
/* SPECIAL [ET_CLASS].make_filled */
extern T0* T400c5(T0* a1, T6 a2);
/* SPECIAL [ET_CLASS].fill_with */
extern void T400f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ET_CLASS].make */
extern void T400f7(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_CLASS].default_create */
extern T0* T399c3(void);
/* ET_MASTER_CLASS.tokens */
extern T0* T259f19(T0* C);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].found_item */
extern T0* T255f30(T0* C);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].item_storage_item */
extern T0* T255f27(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].found */
extern T1 T255f31(T0* C);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].search */
extern void T255f37(T0* C, T0* a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].search_position */
extern void T255f40(T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.wide_character_class_name */
extern unsigned char ge922os8253;
extern T0* ge922ov8253;
extern T0* T141f28(T0* C);
/* ET_SYSTEM.set_typed_pointer_type */
extern void T142f153(T0* C);
/* ET_GENERIC_CLASS_TYPE.make */
extern T0* T276c5(T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_ACTUAL_PARAMETER_LIST.put_first */
extern void T274f8(T0* C, T0* a1);
/* ET_ACTUAL_PARAMETER_LIST.make_with_capacity */
extern T0* T274c7(T6 a1);
/* ET_ACTUAL_PARAMETER_LIST.make_with_capacity */
extern void T274f7p1(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_ACTUAL_PARAMETER_ITEM].make */
extern T0* T351f1(T0* C, T6 a1);
/* SPECIAL [ET_ACTUAL_PARAMETER_ITEM].make_filled */
extern T0* T350c2(T0* a1, T6 a2);
/* SPECIAL [ET_ACTUAL_PARAMETER_ITEM].fill_with */
extern void T350f5(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ET_ACTUAL_PARAMETER_ITEM].make */
extern void T350f4(T0* C, T6 a1);
/* ET_ACTUAL_PARAMETER_LIST.fixed_array */
extern unsigned char ge979os12714;
extern T0* ge979ov12714;
extern T0* T274f6(T0* C);
/* KL_SPECIAL_ROUTINES [ET_ACTUAL_PARAMETER_ITEM].default_create */
extern T0* T351c2(void);
/* ET_TOKEN_CONSTANTS.right_bracket_symbol */
extern unsigned char ge922os8497;
extern T0* ge922ov8497;
extern T0* T141f107(T0* C);
/* ET_SYMBOL.make_right_bracket */
extern T0* T347c4(void);
/* ET_SYMBOL.make_leaf */
extern void T347f5(T0* C);
/* ET_SYMBOL.tokens */
extern T0* T347f3(T0* C);
/* ET_TOKEN_CONSTANTS.left_bracket_symbol */
extern unsigned char ge922os8492;
extern T0* ge922ov8492;
extern T0* T141f106(T0* C);
/* ET_BRACKET_SYMBOL.make */
extern T0* T348c4(void);
/* ET_BRACKET_SYMBOL.make_leaf */
extern void T348f5(T0* C);
/* ET_BRACKET_SYMBOL.tokens */
extern T0* T348f3(T0* C);
/* ET_ACTUAL_PARAMETER_LIST.tokens */
extern T0* T274f5(T0* C);
/* ET_SYSTEM.set_type_type */
extern void T142f152(T0* C);
/* ET_SYSTEM.set_system_string_type */
extern void T142f151(T0* C);
/* ET_TOKEN_CONSTANTS.system_string_class_name */
extern unsigned char ge922os8249;
extern T0* ge922ov8249;
extern T0* T141f49(T0* C);
/* ET_SYSTEM.set_system_object_type */
extern void T142f150(T0* C);
/* ET_PARENT_LIST.put_first */
extern void T269f7(T0* C, T0* a1);
/* ET_PARENT_LIST.make_with_capacity */
extern T0* T269c6(T6 a1);
/* ET_PARENT_LIST.make_with_capacity */
extern void T269f6p1(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_PARENT_ITEM].make */
extern T0* T343f1(T0* C, T6 a1);
/* SPECIAL [ET_PARENT_ITEM].make_filled */
extern T0* T342c2(T0* a1, T6 a2);
/* SPECIAL [ET_PARENT_ITEM].fill_with */
extern void T342f5(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ET_PARENT_ITEM].make */
extern void T342f4(T0* C, T6 a1);
/* ET_PARENT_LIST.fixed_array */
extern unsigned char ge686os12714;
extern T0* ge686ov12714;
extern T0* T269f5(T0* C);
/* KL_SPECIAL_ROUTINES [ET_PARENT_ITEM].default_create */
extern T0* T343c2(void);
/* ET_TOKEN_CONSTANTS.inherit_keyword */
extern unsigned char ge922os8534;
extern T0* ge922ov8534;
extern T0* T141f104(T0* C);
/* ET_KEYWORD.make_inherit */
extern T0* T340c6(void);
/* ET_PARENT_LIST.tokens */
extern T0* T269f4(T0* C);
/* ET_PARENT.make */
extern T0* T264c10(T0* a1, T0* a2, T0* a3, T0* a4, T0* a5, T0* a6);
/* ET_PARENT.tokens */
extern T0* T264f9(T0* C);
/* ET_PARENT.has_feature_adaptation */
extern T1 T264f8(T0* C);
/* ET_SYSTEM.set_string_type */
extern void T142f149(T0* C);
/* ET_TOKEN_CONSTANTS.string_class_name */
extern unsigned char ge922os8245;
extern T0* ge922ov8245;
extern T0* T141f27(T0* C);
/* ET_SYSTEM.set_string_32_type */
extern void T142f148(T0* C);
/* ET_BUILTIN_CONVERT_FEATURE.make */
extern T0* T277c4(T0* a1);
/* ET_BRACED_TYPE_LIST.make */
extern T0* T354c6(void);
/* ET_BRACED_TYPE_LIST.make */
extern void T354f6p1(T0* C);
/* ET_TOKEN_CONSTANTS.right_brace_symbol */
extern unsigned char ge922os8496;
extern T0* ge922ov8496;
extern T0* T141f115(T0* C);
/* ET_SYMBOL.make_right_brace */
extern T0* T347c7(void);
/* ET_TOKEN_CONSTANTS.left_brace_symbol */
extern unsigned char ge922os8491;
extern T0* ge922ov8491;
extern T0* T141f114(T0* C);
/* ET_SYMBOL.make_left_brace */
extern T0* T347c6(void);
/* ET_BRACED_TYPE_LIST.tokens */
extern T0* T354f5(T0* C);
/* ET_TOKEN_CONSTANTS.string_32_class_name */
extern unsigned char ge922os8247;
extern T0* ge922ov8247;
extern T0* T141f47(T0* C);
/* ET_SYSTEM.set_string_8_type */
extern void T142f147(T0* C);
/* ET_TOKEN_CONSTANTS.string_8_class_name */
extern unsigned char ge922os8246;
extern T0* ge922ov8246;
extern T0* T141f14(T0* C);
/* ET_SYSTEM.set_special_type */
extern void T142f146(T0* C);
/* ET_SYSTEM.set_routine_type */
extern void T142f145(T0* C);
/* ET_SYSTEM.set_real_64_type */
extern void T142f144(T0* C);
/* ET_SYSTEM.set_real_32_type */
extern void T142f143(T0* C);
/* ET_SYSTEM.set_real_type */
extern void T142f142(T0* C);
/* ET_TOKEN_CONSTANTS.real_class_name */
extern unsigned char ge922os8240;
extern T0* ge922ov8240;
extern T0* T141f25(T0* C);
/* ET_SYSTEM.set_procedure_type */
extern void T142f141(T0* C);
/* ET_SYSTEM.set_predicate_type */
extern void T142f140(T0* C);
/* ET_SYSTEM.set_pointer_type */
extern void T142f139(T0* C);
/* ET_SYSTEM.set_none_type */
extern void T142f138(T0* C);
/* ET_MASTER_CLASS.add_first_local_class */
extern void T259f22(T0* C, T0* a1);
/* ET_MASTER_CLASS.add_first_local_non_override_class */
extern void T259f27(T0* C, T0* a1);
/* ET_MASTER_CLASS.update_intrinsic_class */
extern void T259f28(T0* C);
/* ET_MASTER_CLASS.set_intrinsic_class */
extern void T259f29(T0* C, T0* a1);
/* Creation of agent #1 in feature ET_MASTER_CLASS.set_intrinsic_class */
extern T0* T259f29ac1(T0* a1);
/* Creation of agent #2 in feature ET_MASTER_CLASS.set_intrinsic_class */
extern T0* T259f29ac2(T0* a1);
/* ET_MASTER_CLASS.mark_overridden */
extern void T259f31(T0* C, T0* a1);
/* ET_MASTER_CLASS.add_last_overriding_class */
extern void T259f33(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].force_last */
extern void T337f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].resize */
extern void T337f23(T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].new_capacity */
extern T6 T337f12(T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].extendible */
extern T1 T337f11(T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].do_all */
extern void T337f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].item */
extern T0* T337f10(T0* C, T6 a1);
/* ET_MASTER_CLASS.unmark_overridden */
extern void T259f30(T0* C, T0* a1);
/* ET_MASTER_CLASS.remove_overriding_class */
extern void T259f32(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].remove_first */
extern void T337f18(T0* C);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].remove */
extern void T337f22(T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].move_left */
extern void T337f26(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].move_cursors_left */
extern void T337f25(T0* C, T6 a1);
/* DS_ARRAYED_LIST_CURSOR [ET_MASTER_CLASS].set_position */
extern void T414f5(T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].remove_last */
extern void T337f24(T0* C);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].move_last_cursors_after */
extern void T337f27(T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_MASTER_CLASS].set_next_cursor */
extern void T414f6(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].first */
extern T0* T337f9(T0* C);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].is_empty */
extern T1 T337f8(T0* C);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].delete */
extern void T337f17(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].clear_items */
extern void T337f21(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].move_all_cursors_after */
extern void T337f20(T0* C);
/* ET_CLASS.is_override */
extern T1 T279f30(T0* C, T0* a1);
/* ET_CLASS.universe */
extern T0* T279f27(T0* C);
/* ET_UNKNOWN_GROUP.universe */
extern T0* T381f2(T0* C);
/* ET_UNKNOWN_GROUP.tokens */
extern T0* T381f4(T0* C);
/* DS_ARRAYED_LIST [ET_CLASS].force_first */
extern void T336f10(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_CLASS].put */
extern void T336f13(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [ET_CLASS].move_cursors_right */
extern void T336f16(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [ET_CLASS].set_position */
extern void T401f5(T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_CLASS].move_right */
extern void T336f15(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [ET_CLASS].put_last */
extern void T336f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_CLASS].resize */
extern void T336f12(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_CLASS].resize */
extern T0* T399f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_CLASS].aliased_resized_area_with_default */
extern T0* T400f3(T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_CLASS].aliased_resized_area */
extern T0* T400f4(T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_CLASS].new_capacity */
extern T6 T336f7(T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_CLASS].extendible */
extern T1 T336f8(T0* C, T6 a1);
/* ET_MASTER_CLASS.add_first_local_override_class */
extern void T259f26(T0* C, T0* a1);
/* ET_CLASS.is_in_override_group */
extern T1 T279f24(T0* C);
/* ET_MASTER_CLASS.add_first_local_ignored_class */
extern void T259f25(T0* C, T0* a1);
/* ET_NONE_GROUP.make */
extern T0* T280c5(T0* a1);
/* ET_SYSTEM.register_class */
extern void T142f156(T0* C, T0* a1);
/* ET_CLASS.set_id */
extern void T279f33(T0* C, T6 a1);
/* ET_AST_FACTORY.new_class */
extern T0* T249f1(T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.none_class_name */
extern unsigned char ge922os8235;
extern T0* ge922ov8235;
extern T0* T141f41(T0* C);
/* ET_SYSTEM.set_natural_64_type */
extern void T142f137(T0* C);
/* ET_SYSTEM.set_natural_32_type */
extern void T142f136(T0* C);
/* ET_SYSTEM.set_natural_16_type */
extern void T142f135(T0* C);
/* ET_SYSTEM.set_natural_8_type */
extern void T142f134(T0* C);
/* ET_SYSTEM.set_natural_type */
extern void T142f133(T0* C);
/* ET_TOKEN_CONSTANTS.natural_class_name */
extern unsigned char ge922os8230;
extern T0* ge922ov8230;
extern T0* T141f23(T0* C);
/* ET_SYSTEM.set_integer_64_type */
extern void T142f132(T0* C);
/* ET_SYSTEM.set_integer_32_type */
extern void T142f131(T0* C);
/* ET_SYSTEM.set_integer_16_type */
extern void T142f130(T0* C);
/* ET_SYSTEM.set_integer_8_type */
extern void T142f129(T0* C);
/* ET_SYSTEM.set_integer_type */
extern void T142f128(T0* C);
/* ET_TOKEN_CONSTANTS.integer_class_name */
extern unsigned char ge922os8222;
extern T0* ge922ov8222;
extern T0* T141f21(T0* C);
/* ET_SYSTEM.set_function_type */
extern void T142f127(T0* C);
/* ET_SYSTEM.set_double_type */
extern void T142f126(T0* C);
/* ET_TOKEN_CONSTANTS.double_class_name */
extern unsigned char ge922os8219;
extern T0* ge922ov8219;
extern T0* T141f19(T0* C);
/* ET_SYSTEM.set_character_32_type */
extern void T142f125(T0* C);
/* ET_SYSTEM.set_character_8_type */
extern void T142f124(T0* C);
/* ET_SYSTEM.set_character_type */
extern void T142f123(T0* C);
/* ET_TOKEN_CONSTANTS.character_class_name */
extern unsigned char ge922os8215;
extern T0* ge922ov8215;
extern T0* T141f17(T0* C);
/* ET_SYSTEM.set_boolean_type */
extern void T142f122(T0* C);
/* ET_SYSTEM.set_array_type */
extern void T142f121(T0* C);
/* ET_SYSTEM.set_tuple_type */
extern void T142f120(T0* C);
/* ET_TUPLE_TYPE.make */
extern T0* T273c6(T0* a1, T0* a2, T0* a3);
/* ET_TOKEN_CONSTANTS.tuple_keyword */
extern unsigned char ge922os8559;
extern T0* ge922ov8559;
extern T0* T141f105(T0* C);
/* ET_TUPLE_TYPE.tokens */
extern T0* T273f5(T0* C);
/* ET_SYSTEM.set_any_type */
extern void T142f119(T0* C);
/* ET_CLIENT_LIST.put_first */
extern void T271f5(T0* C, T0* a1);
/* ET_CLIENT.make */
extern T0* T260c3(T0* a1, T0* a2);
/* ET_CLIENT_LIST.make_with_capacity */
extern T0* T271c4(T6 a1);
/* KL_SPECIAL_ROUTINES [ET_CLIENT_ITEM].make */
extern T0* T345f1(T0* C, T6 a1);
/* SPECIAL [ET_CLIENT_ITEM].make_filled */
extern T0* T344c2(T0* a1, T6 a2);
/* SPECIAL [ET_CLIENT_ITEM].fill_with */
extern void T344f5(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ET_CLIENT_ITEM].make */
extern void T344f4(T0* C, T6 a1);
/* ET_CLIENT_LIST.fixed_array */
extern unsigned char ge651os12714;
extern T0* ge651ov12714;
extern T0* T271f3(T0* C);
/* KL_SPECIAL_ROUTINES [ET_CLIENT_ITEM].default_create */
extern T0* T345c2(void);
/* ET_SYSTEM.set_default_class_mapping */
extern void T142f97(T0* C);
/* ET_SYSTEM.set_wide_character_ref_class_mapping */
extern void T142f118(T0* C, T0* a1);
/* ET_SYSTEM.set_class_mapping */
extern void T142f155(T0* C, T0* a1, T0* a2);
/* ET_MASTER_CLASS.set_mapped_class */
extern void T259f23(T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.wide_character_ref_class_name */
extern unsigned char ge922os8274;
extern T0* ge922ov8274;
extern T0* T141f29(T0* C);
/* ET_TOKEN_CONSTANTS.character_32_ref_class_name */
extern unsigned char ge922os8258;
extern T0* ge922ov8258;
extern T0* T141f16(T0* C);
/* ET_SYSTEM.set_wide_character_class_mapping */
extern void T142f117(T0* C, T0* a1);
/* ET_SYSTEM.set_string_class_mapping */
extern void T142f116(T0* C, T0* a1);
/* ET_SYSTEM.set_real_ref_class_mapping */
extern void T142f115(T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.real_ref_class_name */
extern unsigned char ge922os8271;
extern T0* ge922ov8271;
extern T0* T141f26(T0* C);
/* ET_TOKEN_CONSTANTS.real_32_ref_class_name */
extern unsigned char ge922os8272;
extern T0* ge922ov8272;
extern T0* T141f13(T0* C);
/* ET_SYSTEM.set_real_class_mapping */
extern void T142f114(T0* C, T0* a1);
/* ET_SYSTEM.set_natural_ref_class_mapping */
extern void T142f113(T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.natural_ref_class_name */
extern unsigned char ge922os8265;
extern T0* ge922ov8265;
extern T0* T141f24(T0* C);
/* ET_TOKEN_CONSTANTS.natural_32_ref_class_name */
extern unsigned char ge922os8268;
extern T0* ge922ov8268;
extern T0* T141f11(T0* C);
/* ET_SYSTEM.set_natural_class_mapping */
extern void T142f112(T0* C, T0* a1);
/* ET_SYSTEM.set_integer_ref_class_mapping */
extern void T142f111(T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.integer_ref_class_name */
extern unsigned char ge922os8260;
extern T0* ge922ov8260;
extern T0* T141f22(T0* C);
/* ET_TOKEN_CONSTANTS.integer_32_ref_class_name */
extern unsigned char ge922os8263;
extern T0* ge922ov8263;
extern T0* T141f9(T0* C);
/* ET_SYSTEM.set_integer_class_mapping */
extern void T142f110(T0* C, T0* a1);
/* ET_SYSTEM.set_double_ref_class_mapping */
extern void T142f109(T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.double_ref_class_name */
extern unsigned char ge922os8259;
extern T0* ge922ov8259;
extern T0* T141f20(T0* C);
/* ET_TOKEN_CONSTANTS.real_64_ref_class_name */
extern unsigned char ge922os8273;
extern T0* ge922ov8273;
extern T0* T141f7(T0* C);
/* ET_SYSTEM.set_double_class_mapping */
extern void T142f108(T0* C, T0* a1);
/* ET_SYSTEM.set_character_ref_class_mapping */
extern void T142f107(T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.character_ref_class_name */
extern unsigned char ge922os8256;
extern T0* ge922ov8256;
extern T0* T141f18(T0* C);
/* ET_TOKEN_CONSTANTS.character_8_ref_class_name */
extern unsigned char ge922os8257;
extern T0* ge922ov8257;
extern T0* T141f5(T0* C);
/* ET_SYSTEM.set_character_class_mapping */
extern void T142f106(T0* C, T0* a1);
/* ET_SYSTEM.set_preparse_shallow_mode */
extern void T142f96(T0* C);
/* ET_SYSTEM.set_default_keyword_usage */
extern void T142f95(T0* C);
/* ET_SYSTEM.set_use_detachable_keyword */
extern void T142f105(T0* C, T1 a1);
/* ET_SYSTEM.set_use_attached_keyword */
extern void T142f104(T0* C, T1 a1);
/* ET_SYSTEM.set_use_reference_keyword */
extern void T142f103(T0* C, T1 a1);
/* ET_SYSTEM.set_use_note_keyword */
extern void T142f102(T0* C, T1 a1);
/* ET_SYSTEM.set_use_attribute_keyword */
extern void T142f101(T0* C, T1 a1);
/* ET_SYSTEM.initialize */
extern void T142f94(T0* C);
/* ET_ADAPTED_DOTNET_ASSEMBLIES.make_empty */
extern T0* T254c3(void);
/* DS_ARRAYED_LIST [ET_ADAPTED_DOTNET_ASSEMBLY].make */
extern T0* T327c6(T6 a1);
/* DS_ARRAYED_LIST [ET_ADAPTED_DOTNET_ASSEMBLY].set_internal_cursor */
extern void T327f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_ADAPTED_DOTNET_ASSEMBLY].new_cursor */
extern T0* T327f5(T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_DOTNET_ASSEMBLY].make */
extern T0* T397c3(T0* a1);
/* KL_SPECIAL_ROUTINES [ET_ADAPTED_DOTNET_ASSEMBLY].make */
extern T0* T394f1(T0* C, T6 a1);
/* SPECIAL [ET_ADAPTED_DOTNET_ASSEMBLY].make_filled */
extern T0* T396c2(T0* a1, T6 a2);
/* SPECIAL [ET_ADAPTED_DOTNET_ASSEMBLY].fill_with */
extern void T396f4(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ET_ADAPTED_DOTNET_ASSEMBLY].make */
extern void T396f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_ADAPTED_DOTNET_ASSEMBLY].default_create */
extern T0* T394c2(void);
/* ET_CLUSTERS.make_empty */
extern T0* T253c3(void);
/* DS_ARRAYED_LIST [ET_CLUSTER].make */
extern T0* T326c6(T6 a1);
/* DS_ARRAYED_LIST [ET_CLUSTER].set_internal_cursor */
extern void T326f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_CLUSTER].new_cursor */
extern T0* T326f5(T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_CLUSTER].make */
extern T0* T393c3(T0* a1);
/* KL_SPECIAL_ROUTINES [ET_CLUSTER].make */
extern T0* T391f1(T0* C, T6 a1);
/* SPECIAL [ET_CLUSTER].make_filled */
extern T0* T392c2(T0* a1, T6 a2);
/* SPECIAL [ET_CLUSTER].fill_with */
extern void T392f4(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ET_CLUSTER].make */
extern void T392f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_CLUSTER].default_create */
extern T0* T391c2(void);
/* ET_ADAPTED_LIBRARIES.make_empty */
extern T0* T252c3(void);
/* DS_ARRAYED_LIST [ET_ADAPTED_LIBRARY].make */
extern T0* T325c6(T6 a1);
/* DS_ARRAYED_LIST [ET_ADAPTED_LIBRARY].set_internal_cursor */
extern void T325f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_ADAPTED_LIBRARY].new_cursor */
extern T0* T325f5(T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_LIBRARY].make */
extern T0* T390c3(T0* a1);
/* KL_SPECIAL_ROUTINES [ET_ADAPTED_LIBRARY].make */
extern T0* T387f1(T0* C, T6 a1);
/* SPECIAL [ET_ADAPTED_LIBRARY].make_filled */
extern T0* T389c2(T0* a1, T6 a2);
/* SPECIAL [ET_ADAPTED_LIBRARY].fill_with */
extern void T389f4(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ET_ADAPTED_LIBRARY].make */
extern void T389f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_ADAPTED_LIBRARY].default_create */
extern T0* T387c2(void);
/* ET_SYSTEM.initialize */
extern void T142f94p1(T0* C);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].set_key_equality_tester */
extern void T255f36(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [ET_MASTER_CLASS, ET_CLASS_NAME].internal_set_equality_tester */
extern void T330f6(T0* C, T0* a1);
/* ET_SYSTEM.class_name_tester */
extern T0* T142f92(T0* C);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].make_map */
extern T0* T255c35(T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].make_with_equality_testers */
extern void T255f39(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [ET_MASTER_CLASS, ET_CLASS_NAME].make */
extern T0* T330c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [ET_MASTER_CLASS, ET_CLASS_NAME].set_internal_cursor */
extern void T330f7(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [ET_MASTER_CLASS, ET_CLASS_NAME].new_cursor */
extern T0* T330f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [ET_MASTER_CLASS, ET_CLASS_NAME].make */
extern T0* T398c3(T0* a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].new_cursor */
extern T0* T255f28(T0* C);
/* DS_HASH_TABLE_CURSOR [ET_MASTER_CLASS, ET_CLASS_NAME].make */
extern T0* T333c3(T0* a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].make_sparse_container */
extern void T255f47(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].set_internal_cursor */
extern void T255f56(T0* C, T0* a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].make_slots */
extern void T255f55(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].make_clashes */
extern void T255f54(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].make_key_storage */
extern void T255f53(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].make_item_storage */
extern void T255f52(T0* C, T6 a1);
/* ET_TOKEN_CONSTANTS.default_ast_factory */
extern unsigned char ge922os8978;
extern T0* ge922ov8978;
extern T0* T141f3(T0* C);
/* ET_AST_FACTORY.make */
extern T0* T249c2(void);
/* ET_TOKEN_CONSTANTS.standard_error_handler */
extern unsigned char ge922os8977;
extern T0* ge922ov8977;
extern T0* T141f2(T0* C);
/* ET_ERROR_HANDLER.make_standard */
extern T0* T248c5(void);
/* ET_ERROR_HANDLER.std */
extern T0* T248f4(T0* C);
/* ET_SYSTEM.tokens */
extern T0* T142f90(T0* C);
/* ET_XACE_PARSER.tokens */
extern T0* T82f16(T0* C);
/* ET_XACE_AST_FACTORY.new_library */
extern T0* T87f5(T0* C);
/* ET_XACE_LIBRARY_CONFIG.make */
extern T0* T81c7(void);
/* ET_XACE_VALIDATOR.validate_library_doc */
extern void T95f32(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_wrong_root_element_error */
extern void T28f26(T0* C, T0* a1, T0* a2);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.make */
extern T0* T216c7(T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_named_cluster */
extern void T95f35(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_cluster */
extern void T95f37(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_unknown_element_error */
extern void T28f30(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.make */
extern T0* T220c7(T0* a1, T0* a2, T0* a3);
/* ET_XACE_VALIDATOR.validate_external */
extern void T95f40(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_export */
extern void T95f43(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_feature */
extern T0* T95f29(T0* C);
/* ET_XACE_VALIDATOR.uc_export */
extern T0* T95f28(T0* C);
/* ET_XACE_VALIDATOR.uc_link_library */
extern T0* T95f27(T0* C);
/* ET_XACE_VALIDATOR.uc_location */
extern T0* T95f15(T0* C);
/* ET_XACE_VALIDATOR.uc_include_dir */
extern T0* T95f26(T0* C);
/* ET_XACE_VALIDATOR.uc_external */
extern T0* T95f12(T0* C);
/* ET_XACE_VALIDATOR.validate_class */
extern void T95f41(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_feature */
extern void T95f44(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_class */
extern T0* T95f13(T0* C);
/* ET_XACE_VALIDATOR.validate_option */
extern void T95f39(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_optimize */
extern T0* T95f25(T0* C);
/* ET_XACE_VALIDATOR.uc_debug */
extern T0* T95f24(T0* C);
/* ET_XACE_VALIDATOR.uc_check */
extern T0* T95f23(T0* C);
/* ET_XACE_VALIDATOR.uc_loop */
extern T0* T95f22(T0* C);
/* ET_XACE_VALIDATOR.uc_invariant */
extern T0* T95f21(T0* C);
/* ET_XACE_VALIDATOR.uc_ensure */
extern T0* T95f20(T0* C);
/* ET_XACE_VALIDATOR.uc_require */
extern T0* T95f19(T0* C);
/* ET_XACE_VALIDATOR.uc_value */
extern T0* T95f18(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_unknown_option_warning */
extern void T28f32(T0* C, T0* a1, T0* a2);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.make */
extern T0* T222c8(T0* a1, T0* a2);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.uc_name */
extern T0* T222f7(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].has */
extern T1 T149f29(T0* C, T0* a1);
/* ET_XACE_OPTION_NAMES.option_codes */
extern T0* T126f17(T0* C);
/* ET_XACE_OPTION_NAMES.string_equality_tester */
extern T0* T126f33(T0* C);
/* ET_XACE_VALIDATOR.options */
extern T0* T95f17(T0* C);
/* ET_XACE_VALIDATOR.uc_option */
extern T0* T95f11(T0* C);
/* ET_XACE_VALIDATOR.validate_mount */
extern void T95f38(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_exclude */
extern void T95f42(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_obsolete_exclude_element_warning */
extern void T28f31(T0* C, T0* a1);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.make */
extern T0* T221c7(T0* a1);
/* ET_XACE_VALIDATOR.uc_exclude */
extern unsigned char ge1258os2509;
extern T0* ge1258ov2509;
extern T0* T95f16(T0* C);
/* ET_XACE_VALIDATOR.uc_mount */
extern T0* T95f10(T0* C);
/* ET_XACE_VALIDATOR.uc_description */
extern unsigned char ge1258os2493;
extern T0* ge1258ov2493;
extern T0* T95f9(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_missing_attribute_error */
extern void T28f27(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.make */
extern T0* T217c7(T0* a1, T0* a2, T0* a3);
/* ET_XACE_VALIDATOR.uc_name */
extern T0* T95f7(T0* C);
/* ET_XACE_VALIDATOR.uc_cluster */
extern T0* T95f6(T0* C);
/* ET_XACE_VALIDATOR.validate_library */
extern void T95f34(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_library */
extern unsigned char ge1258os2484;
extern T0* ge1258ov2484;
extern T0* T95f5(T0* C);
/* ET_XACE_VALIDATOR.string_ */
extern T0* T95f3(T0* C);
/* ET_XACE_PARSER.uc_cluster */
extern T0* T82f11(T0* C);
/* ET_XACE_PARSER.uc_library */
extern T0* T82f149(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].wipe_out */
extern void T97f38(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].slots_wipe_out */
extern void T97f46(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].clashes_wipe_out */
extern void T97f45(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].key_storage_wipe_out */
extern void T97f44(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].item_storage_wipe_out */
extern void T97f43(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].move_all_cursors_after */
extern void T97f41(T0* C);
/* DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8].set_next_cursor */
extern void T163f6(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8].set_position */
extern void T163f5(T0* C, T6 a1);
/* ET_XACE_PARSER.new_system */
extern T0* T82f15(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_CONFIG.mount_libraries */
extern void T76f15(T0* C);
/* ET_XACE_PARSER.fill_system */
extern void T82f256(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_SYSTEM_CONFIG.set_libraries */
extern void T76f14(T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG.set_options */
extern void T76f13(T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG.set_creation_procedure_name */
extern void T76f12(T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG.set_root_class_name */
extern void T76f11(T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG.set_system_name */
extern void T76f10(T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG.set_clusters */
extern void T76f9(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_creation */
extern unsigned char ge1258os2483;
extern T0* ge1258ov2483;
extern T0* T82f28(T0* C);
/* XM_ELEMENT.element_by_name */
extern T0* T89f20(T0* C, T0* a1);
/* XM_ELEMENT.named_same_name */
extern T1 T89f10(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.same_namespace */
extern T1 T89f12(T0* C, T0* a1);
/* XM_ELEMENT.has_namespace */
extern T1 T89f14(T0* C);
/* XM_NODE_TYPER.is_element */
extern T1 T410f9(T0* C);
/* XM_ELEMENT.has_element_by_name */
extern T1 T89f19(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_root */
extern unsigned char ge1258os2481;
extern T0* ge1258ov2481;
extern T0* T82f26(T0* C);
/* ET_XACE_AST_FACTORY.new_system */
extern T0* T87f1(T0* C);
/* ET_XACE_SYSTEM_CONFIG.make */
extern T0* T76c7(void);
/* ET_XACE_PREPROCESSOR.preprocess_element */
extern void T96f11(T0* C, T0* a1, T0* a2);
/* ET_XACE_PREPROCESSOR.should_strip_element */
extern T1 T96f3(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_invalid_expression_error */
extern void T28f36(T0* C, T0* a1, T0* a2);
/* ET_XACE_INVALID_EXPRESSION_ERROR.make */
extern T0* T313c7(T0* a1, T0* a2);
/* ET_XACE_PREPROCESSOR.is_expression_true */
extern T1 T96f8(T0* C, T0* a1);
/* UT_TEMPLATE_EXPANDER.expand_from_values */
extern T0* T159f1(T0* C, T0* a1, T0* a2);
/* UT_TEMPLATE_EXPANDER.string_ */
extern T0* T159f2(T0* C);
/* ET_XACE_PREPROCESSOR.template_expander */
extern unsigned char ge1266os6314;
extern T0* ge1266ov6314;
extern T0* T96f4(T0* C);
/* UT_TEMPLATE_EXPANDER.make */
extern T0* T159c3(void);
/* ET_XACE_PREPROCESSOR.string_ */
extern T0* T96f9(T0* C);
/* UC_UTF8_STRING.occurrences */
extern T6 T232f54(T0* C, T2 a1);
/* UC_UTF8_STRING.code_occurrences */
extern T6 T232f55(T0* C, T6 a1);
/* STRING_8.occurrences */
extern T6 T17f33(T0* C, T2 a1);
/* ET_XACE_PREPROCESSOR.is_valid_expression */
extern T1 T96f7(T0* C, T0* a1);
/* ET_XACE_PREPROCESSOR.uc_unless */
extern unsigned char ge1258os2511;
extern T0* ge1258ov2511;
extern T0* T96f6(T0* C);
/* ET_XACE_PREPROCESSOR.uc_if */
extern unsigned char ge1258os2510;
extern T0* ge1258ov2510;
extern T0* T96f5(T0* C);
/* ET_XACE_PREPROCESSOR.expand_attribute_variables */
extern void T96f12(T0* C, T0* a1);
/* XM_ATTRIBUTE.set_value */
extern void T145f7(T0* C, T0* a1);
/* ET_XACE_VALIDATOR.validate_system_doc */
extern void T95f31(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_system */
extern void T95f33(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_obsolete_cluster_element_warning */
extern void T28f29(T0* C, T0* a1);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.make */
extern T0* T219c7(T0* a1);
/* ET_XACE_VALIDATOR.validate_root */
extern void T95f36(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_creation */
extern T0* T95f14(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_missing_element_error */
extern void T28f28(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_MISSING_ELEMENT_ERROR.make */
extern T0* T218c7(T0* a1, T0* a2, T0* a3);
/* ET_XACE_VALIDATOR.uc_root */
extern T0* T95f8(T0* C);
/* ET_XACE_VALIDATOR.uc_system */
extern unsigned char ge1258os2480;
extern T0* ge1258ov2480;
extern T0* T95f4(T0* C);
/* ET_XACE_PARSER.uc_system */
extern T0* T82f13(T0* C);
/* ET_XACE_PARSER.string_ */
extern T0* T82f148(T0* C);
/* XM_TREE_CALLBACKS_PIPE.document */
extern T0* T92f5(T0* C);
/* XM_EIFFEL_PARSER.parse_from_stream */
extern void T99f203(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.parse_with_events */
extern void T99f209(T0* C);
/* XM_EIFFEL_PARSER.on_finish */
extern void T99f215(T0* C);
/* XM_EIFFEL_PARSER.parse */
extern void T99f214(T0* C);
/* XM_EIFFEL_PARSER.yy_pop_last_value */
extern void T99f224(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.yy_push_error_value */
extern void T99f223(T0* C);
/* KL_SPECIAL_ROUTINES [ANY].resize */
extern T0* T175f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ANY].aliased_resized_area_with_default */
extern T0* T174f3(T0* C, T0* a1, T6 a2);
/* SPECIAL [ANY].aliased_resized_area */
extern T0* T174f4(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].make */
extern T0* T175f1(T0* C, T6 a1);
/* SPECIAL [ANY].make_filled */
extern T0* T174c5(T0* a1, T6 a2);
/* SPECIAL [ANY].fill_with */
extern void T174f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ANY].make */
extern void T174f8(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].default_create */
extern T0* T175c3(void);
/* XM_EIFFEL_PARSER.yy_do_action */
extern void T99f222(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.on_notation_declaration */
extern void T99f252(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_notation_declaration */
extern void T206f8(T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.set_public */
extern void T178f6(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].resize */
extern T0* T204f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_EXTERNAL_ID].aliased_resized_area_with_default */
extern T0* T189f4(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_EXTERNAL_ID].aliased_resized_area */
extern T0* T189f5(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].make */
extern T0* T204f1(T0* C, T6 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].make_filled */
extern T0* T189c6(T0* a1, T6 a2);
/* SPECIAL [XM_DTD_EXTERNAL_ID].fill_with */
extern void T189f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_EXTERNAL_ID].make */
extern void T189f9(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].default_create */
extern T0* T204c3(void);
/* XM_DTD_EXTERNAL_ID.set_system */
extern void T178f5(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_dtd_external_id */
extern T0* T99f169(T0* C);
/* XM_DTD_EXTERNAL_ID.make */
extern T0* T178c4(void);
/* XM_EIFFEL_PARSER.when_pe_entity_declared */
extern void T99f251(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].force_new */
extern void T171f40(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_put */
extern void T171f54(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_put */
extern void T171f53(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_put */
extern void T171f52(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_put */
extern void T171f51(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_item */
extern T6 T171f28(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].hash_position */
extern T6 T171f27(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_item */
extern T6 T171f26(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].resize */
extern void T171f50(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_resize */
extern void T171f59(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].special_integer_ */
extern T0* T171f32(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_resize */
extern void T171f58(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_resize */
extern void T171f57(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].resize */
extern T0* T304f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].aliased_resized_area_with_default */
extern T0* T299f3(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].aliased_resized_area */
extern T0* T299f4(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_item */
extern T0* T171f22(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_resize */
extern void T171f56(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_modulus */
extern T6 T171f29(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_capacity */
extern T6 T171f23(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].unset_found_item */
extern void T171f45(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].has */
extern T1 T171f33(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].search_position */
extern void T171f42(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_def */
extern T0* T209c208(T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_literal */
extern void T209f210(T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.default_create */
extern T0* T173c4(void);
/* XM_EIFFEL_PE_ENTITY_DEF.make_scanner */
extern void T209f211(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T209f213(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset_sent */
extern void T209f216(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T209f213p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T209f213p0(T0* C);
/* DS_LINKED_STACK [INTEGER_32].make */
extern T0* T295c5(void);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T209f213p2(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.make_with_buffer */
extern void T209f212(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_initialize */
extern void T209f214(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_build_tables */
extern void T209f217(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template */
extern unsigned char ge1432os9993;
extern T0* ge1432ov9993;
extern T0* T209f50(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_fixed_array */
extern T0* T209f54(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].to_special */
extern T0* T53f3(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_meta_template */
extern unsigned char ge1432os9992;
extern T0* ge1432ov9992;
extern T0* T209f91(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_ec_template */
extern unsigned char ge1432os9991;
extern T0* ge1432ov9991;
extern T0* T209f69(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template */
extern unsigned char ge1432os9990;
extern T0* ge1432ov9990;
extern T0* T209f59(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template */
extern unsigned char ge1432os9989;
extern T0* ge1432ov9989;
extern T0* T209f52(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template */
extern unsigned char ge1432os9982;
extern T0* ge1432ov9982;
extern T0* T209f49(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_6 */
extern void T209f230(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_array_subcopy */
extern void T209f231(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* KL_ARRAY_ROUTINES [INTEGER_32].subcopy */
extern void T315f2(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* ARRAY [INTEGER_32].subcopy */
extern void T229f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER_32].copy_data */
extern void T51f9(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER_32].move_data */
extern void T51f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].overlapping_move */
extern void T51f12(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].non_overlapping_move */
extern void T51f11(T0* C, T6 a1, T6 a2, T6 a3);
/* XM_EIFFEL_PE_ENTITY_DEF.integer_array_ */
extern unsigned char ge31os2657;
extern T0* ge31ov2657;
extern T0* T209f55(T0* C);
/* KL_ARRAY_ROUTINES [INTEGER_32].default_create */
extern T0* T315c1(void);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_5 */
extern void T209f229(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_4 */
extern void T209f228(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_3 */
extern void T209f227(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_2 */
extern void T209f226(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_1 */
extern void T209f225(T0* C, T0* a1);
/* ARRAY [INTEGER_32].make */
extern T0* T229c5(T6 a1, T6 a2);
/* ARRAY [INTEGER_32].make_area */
extern void T229f6(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template */
extern unsigned char ge1432os9975;
extern T0* ge1432ov9975;
extern T0* T209f65(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_6 */
extern void T209f224(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_5 */
extern void T209f223(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_4 */
extern void T209f222(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_3 */
extern void T209f221(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_2 */
extern void T209f220(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_1 */
extern void T209f219(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.empty_buffer */
extern unsigned char ge261os10185;
extern T0* ge261ov10185;
extern T0* T209f58(T0* C);
/* YY_BUFFER.make */
extern T0* T291c12(T0* a1);
/* YY_BUFFER.make_from_buffer */
extern void T291f16(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.fill_from_string */
extern void T383f8(T0* C, T0* a1, T6 a2);
/* YY_BUFFER.new_default_buffer */
extern T0* T291f11(T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.make */
extern T0* T290c8(void);
/* XM_EIFFEL_PE_ENTITY_DEF.make_external */
extern void T209f209(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.new_external_entity */
extern T0* T99f168(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.make_external */
extern T0* T203c207(T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_scanner */
extern void T203f208(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T203f210(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T203f210p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T203f210p0(T0* C);
/* XM_EIFFEL_ENTITY_DEF.make_with_buffer */
extern void T203f209(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_initialize */
extern void T203f211(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_build_tables */
extern void T203f213(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template */
extern T0* T203f48(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_fixed_array */
extern T0* T203f53(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_meta_template */
extern T0* T203f88(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_ec_template */
extern T0* T203f67(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template */
extern T0* T203f58(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template */
extern T0* T203f50(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template */
extern T0* T203f47(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_6 */
extern void T203f226(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_array_subcopy */
extern void T203f227(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_ENTITY_DEF.integer_array_ */
extern T0* T203f54(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_5 */
extern void T203f225(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_4 */
extern void T203f224(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_3 */
extern void T203f223(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_2 */
extern void T203f222(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_1 */
extern void T203f221(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template */
extern T0* T203f64(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_6 */
extern void T203f220(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_5 */
extern void T203f219(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_4 */
extern void T203f218(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_3 */
extern void T203f217(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_2 */
extern void T203f216(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_1 */
extern void T203f215(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.empty_buffer */
extern T0* T203f49(T0* C);
/* XM_EIFFEL_PARSER.on_entity_declaration */
extern void T99f250(T0* C, T0* a1, T1 a2, T0* a3, T0* a4, T0* a5);
/* XM_DTD_CALLBACKS_NULL.on_entity_declaration */
extern void T206f7(T0* C, T0* a1, T1 a2, T0* a3, T0* a4, T0* a5);
/* XM_EIFFEL_PARSER.when_entity_declared */
extern void T99f249(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.new_literal_entity */
extern T0* T99f167(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_literal */
extern T0* T203c206(T0* a1, T0* a2);
/* XM_DTD_ATTRIBUTE_CONTENT.set_default_value */
extern void T182f26(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_fixed */
extern void T182f25(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_implied */
extern void T182f24(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_required */
extern void T182f23(T0* C);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].resize */
extern T0* T202f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].aliased_resized_area_with_default */
extern T0* T201f4(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].aliased_resized_area */
extern T0* T201f5(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].make */
extern T0* T202f1(T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].make_filled */
extern T0* T201c6(T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].fill_with */
extern void T201f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].make */
extern void T201f9(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].default_create */
extern T0* T202c3(void);
/* DS_BILINKED_LIST [STRING_8].force_last */
extern void T183f12(T0* C, T0* a1);
/* DS_BILINKABLE [STRING_8].put_right */
extern void T311f5(T0* C, T0* a1);
/* DS_BILINKABLE [STRING_8].attach_left */
extern void T311f6(T0* C, T0* a1);
/* DS_BILINKABLE [STRING_8].make */
extern T0* T311c4(T0* a1);
/* DS_BILINKED_LIST [STRING_8].is_empty */
extern T1 T183f6(T0* C);
/* XM_EIFFEL_PARSER.new_string_bilinked_list */
extern T0* T99f162(T0* C);
/* DS_BILINKED_LIST [STRING_8].set_equality_tester */
extern void T183f13(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.string_equality_tester */
extern T0* T99f182(T0* C);
/* DS_BILINKED_LIST [STRING_8].make */
extern T0* T183c11(void);
/* DS_BILINKED_LIST [STRING_8].set_internal_cursor */
extern void T183f14(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].new_cursor */
extern T0* T183f7(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].make */
extern T0* T310c7(T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration_list */
extern void T182f22(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration */
extern void T182f27(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.default_enumeration_list */
extern unsigned char ge1343os10626;
extern T0* ge1343ov10626;
extern T0* T182f7(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_notation */
extern void T182f21(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_token */
extern void T182f20(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_entity */
extern void T182f19(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_list_type */
extern void T182f18(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id_ref */
extern void T182f17(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id */
extern void T182f16(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_data */
extern void T182f15(T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content */
extern T0* T99f160(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.make */
extern T0* T182c12(void);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].resize */
extern T0* T200f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].aliased_resized_area_with_default */
extern T0* T198f4(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].aliased_resized_area */
extern T0* T198f5(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T200f1(T0* C, T6 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make_filled */
extern T0* T198c6(T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].fill_with */
extern void T198f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make */
extern void T198f9(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].default_create */
extern T0* T200c3(void);
/* XM_DTD_ATTRIBUTE_CONTENT.copy_default */
extern void T182f14(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_implied */
extern T1 T182f11(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_required */
extern T1 T182f10(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.has_default_value */
extern T1 T182f9(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_fixed */
extern T1 T182f8(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_name */
extern void T182f13(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].resize */
extern T0* T199f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].aliased_resized_area_with_default */
extern T0* T196f4(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].aliased_resized_area */
extern T0* T196f5(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T199f1(T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make_filled */
extern T0* T196c6(T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].fill_with */
extern void T196f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern void T196f9(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].default_create */
extern T0* T199c3(void);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].force_last */
extern void T181f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].put_right */
extern void T309f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].attach_left */
extern void T309f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T309c4(T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].is_empty */
extern T1 T181f6(T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content_list */
extern T0* T99f153(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T181c8(void);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].set_internal_cursor */
extern void T181f10(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].new_cursor */
extern T0* T181f5(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T308c7(T0* a1);
/* XM_EIFFEL_PARSER.on_attribute_declarations */
extern void T99f248(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].forth */
extern void T308f9(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_forth */
extern void T181f12(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].add_traversing_cursor */
extern void T181f13(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set_next_cursor */
extern void T308f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].remove_traversing_cursor */
extern void T181f14(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set */
extern void T308f10(T0* C, T0* a1, T1 a2, T1 a3);
/* XM_EIFFEL_PARSER.on_attribute_declaration */
extern void T99f258(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_DTD_CALLBACKS_NULL.on_attribute_declaration */
extern void T206f9(T0* C, T0* a1, T0* a2, T0* a3);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].item */
extern T0* T308f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].start */
extern void T308f8(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_start */
extern void T181f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_off */
extern T1 T181f7(T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_more */
extern void T180f11(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_mixed */
extern T0* T180c10(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_mixed */
extern void T180f21(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_choice */
extern void T180f19(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_list */
extern void T180f16(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_default */
extern void T180f22(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one */
extern void T180f12(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_sequence */
extern void T180f20(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T307c7(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].set_internal_cursor */
extern void T307f10(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].new_cursor */
extern T0* T307f5(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T362c3(T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_sequence */
extern T0* T180c9(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_last */
extern void T307f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].put_right */
extern void T363f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].attach_left */
extern void T363f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T363c4(T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].is_empty */
extern T1 T307f6(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_choice */
extern T0* T180c8(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_first */
extern void T307f8(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.element_name */
extern T0* T99f147(T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_name */
extern T0* T180c15(T0* a1);
/* XM_EIFFEL_PARSER.set_element_repetition */
extern void T99f247(T0* C, T0* a1, T0* a2);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_one */
extern void T180f14(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one_or_more */
extern void T180f13(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_any */
extern T0* T180c7(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_any */
extern void T180f18(T0* C);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].resize */
extern T0* T194f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].aliased_resized_area_with_default */
extern T0* T193f4(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].aliased_resized_area */
extern T0* T193f5(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T194f1(T0* C, T6 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].make_filled */
extern T0* T193c6(T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].fill_with */
extern void T193f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].make */
extern void T193f9(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].default_create */
extern T0* T194c3(void);
/* XM_DTD_ELEMENT_CONTENT.make_empty */
extern T0* T180c6(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_empty */
extern void T180f17(T0* C);
/* XM_EIFFEL_PARSER.on_element_declaration */
extern void T99f246(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_element_declaration */
extern void T206f6(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_attribute */
extern void T99f245(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].has */
extern T1 T179f30(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].search_position */
extern void T179f34(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_item */
extern T6 T179f23(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].hash_position */
extern T6 T179f24(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.hash_code */
extern T6 T176f16(T0* C);
/* XM_EIFFEL_PARSER_NAME.item */
extern T0* T176f17(T0* C, T6 a1);
/* DS_BILINKED_LIST [STRING_8].item */
extern T0* T183f9(T0* C, T6 a1);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].test */
extern T1 T305f1(T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_storage_item */
extern T0* T179f18(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_item */
extern T0* T179f29(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_equality_tester */
extern T0* T179f17(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_item */
extern T6 T179f25(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].resize */
extern T0* T192f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].aliased_resized_area_with_default */
extern T0* T191f4(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].aliased_resized_area */
extern T0* T191f5(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T192f1(T0* C, T6 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make_filled */
extern T0* T191c6(T0* a1, T6 a2);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].fill_with */
extern void T191f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern void T191f9(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].default_create */
extern T0* T192c3(void);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].force_new */
extern void T179f33(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_put */
extern void T179f40(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_put */
extern void T179f39(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_put */
extern void T179f38(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].resize */
extern void T179f37(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_resize */
extern void T179f49(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].special_integer_ */
extern T0* T179f27(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_storage_resize */
extern void T179f48(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_resize */
extern void T179f47(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_resize */
extern void T179f46(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_modulus */
extern T6 T179f19(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_capacity */
extern T6 T179f26(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].unset_found_item */
extern void T179f36(T0* C);
/* XM_EIFFEL_PARSER.new_name_set */
extern T0* T99f134(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_equal */
extern T0* T179c32(T6 a1);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T305c2(void);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make */
extern void T179f35(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].set_internal_cursor */
extern void T179f45(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_cursor */
extern T0* T179f20(T0* C);
/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME].make */
extern T0* T306c3(T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_slots */
extern void T179f44(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_clashes */
extern void T179f43(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_key_storage */
extern void T179f42(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_item_storage */
extern void T179f41(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.on_start_tag */
extern void T99f244(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER.on_end_tag */
extern void T99f243(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER_NAME.local_part */
extern T0* T176f10(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].forth */
extern void T310f9(T0* C);
/* DS_BILINKED_LIST [STRING_8].cursor_forth */
extern void T183f16(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].add_traversing_cursor */
extern void T183f17(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T310f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].remove_traversing_cursor */
extern void T183f18(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].set */
extern void T310f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [STRING_8].item */
extern T0* T310f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].start */
extern void T310f8(T0* C);
/* DS_BILINKED_LIST [STRING_8].cursor_start */
extern void T183f15(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].cursor_off */
extern T1 T183f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.string_ */
extern T0* T176f15(T0* C);
/* XM_EIFFEL_PARSER_NAME.last */
extern T0* T176f14(T0* C);
/* DS_BILINKED_LIST [STRING_8].last */
extern T0* T183f8(T0* C);
/* XM_EIFFEL_PARSER_NAME.ns_prefix */
extern T0* T176f9(T0* C);
/* XM_EIFFEL_PARSER_NAME.is_namespace_name */
extern T1 T176f13(T0* C);
/* XM_EIFFEL_PARSER.on_start_tag_finish */
extern void T99f242(T0* C);
/* XM_EIFFEL_PARSER_NAME.is_equal */
extern T1 T176f8(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.same_string */
extern T1 T176f12(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER_NAME.string_equality_tester */
extern T0* T176f11(T0* C);
/* KL_SPECIAL_ROUTINES [BOOLEAN].resize */
extern T0* T190f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [BOOLEAN].aliased_resized_area_with_default */
extern T0* T188f4(T0* C, T1 a1, T6 a2);
/* SPECIAL [BOOLEAN].aliased_resized_area */
extern T0* T188f5(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].make */
extern T0* T190f1(T0* C, T6 a1);
/* SPECIAL [BOOLEAN].make_filled */
extern T0* T188c6(T1 a1, T6 a2);
/* SPECIAL [BOOLEAN].fill_with */
extern void T188f8(T0* C, T1 a1, T6 a2, T6 a3);
/* SPECIAL [BOOLEAN].make */
extern void T188f9(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].default_create */
extern T0* T190c3(void);
/* XM_EIFFEL_PARSER.when_external_dtd */
extern void T99f241(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.last_error */
extern T0* T173f2(T0* C);
/* XM_EIFFEL_PARSER.null_resolver */
extern unsigned char ge1430os6423;
extern T0* ge1430ov6423;
extern T0* T99f103(T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern T0* T207c198(void);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern void T207f198p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T207f207(T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T207f207p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_with_buffer */
extern void T207f206(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_initialize */
extern void T207f216(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_build_tables */
extern void T207f221(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template */
extern T0* T207f192(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_fixed_array */
extern T0* T207f195(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_meta_template */
extern T0* T207f191(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_ec_template */
extern T0* T207f190(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template */
extern T0* T207f189(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template */
extern T0* T207f188(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template */
extern T0* T207f187(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_6 */
extern void T207f233(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_array_subcopy */
extern void T207f234(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_SCANNER_DTD.integer_array_ */
extern T0* T207f197(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_5 */
extern void T207f232(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_4 */
extern void T207f231(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_3 */
extern void T207f230(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_2 */
extern void T207f229(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_1 */
extern void T207f228(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template */
extern T0* T207f186(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_6 */
extern void T207f227(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_5 */
extern void T207f226(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_4 */
extern void T207f225(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_3 */
extern void T207f224(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_2 */
extern void T207f223(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_1 */
extern void T207f222(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.empty_buffer */
extern T0* T207f49(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].force */
extern void T170f8(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.has_error */
extern T1 T173f1(T0* C);
/* XM_EIFFEL_PARSER.resolve_external_id */
extern void T99f257(T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.resolve */
extern void T173f6(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_public */
extern void T173f5(T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.is_public */
extern T1 T178f3(T0* C);
/* XM_EIFFEL_PARSER.on_dtd_end */
extern void T99f240(T0* C);
/* XM_DTD_CALLBACKS_NULL.on_dtd_end */
extern void T206f5(T0* C);
/* XM_EIFFEL_PARSER.on_doctype */
extern void T99f239(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_DTD_CALLBACKS_NULL.on_doctype */
extern void T206f4(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_DTD_CALLBACKS_NULL.make */
extern T0* T206c1(void);
/* XM_EIFFEL_DECLARATION.set_encoding */
extern void T177f9(T0* C, T0* a1);
/* XM_EIFFEL_DECLARATION.set_stand_alone */
extern void T177f8(T0* C, T1 a1);
/* XM_EIFFEL_DECLARATION.set_version */
extern void T177f11(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].resize */
extern T0* T187f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_DECLARATION].aliased_resized_area_with_default */
extern T0* T186f4(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_DECLARATION].aliased_resized_area */
extern T0* T186f5(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].make */
extern T0* T187f1(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_DECLARATION].make_filled */
extern T0* T186c6(T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_DECLARATION].fill_with */
extern void T186f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_DECLARATION].make */
extern void T186f9(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].default_create */
extern T0* T187c3(void);
/* XM_EIFFEL_DECLARATION.make */
extern T0* T177c7(void);
/* XM_EIFFEL_DECLARATION.process */
extern void T177f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_xml_declaration */
extern void T99f261(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_EIFFEL_PARSER.apply_encoding */
extern void T99f238(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_content */
extern void T99f237(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_dtd_processing_instruction */
extern void T99f236(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_dtd_processing_instruction */
extern void T206f3(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_processing_instruction */
extern void T99f235(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_dtd_comment */
extern void T99f234(T0* C, T0* a1);
/* XM_DTD_CALLBACKS_NULL.on_dtd_comment */
extern void T206f2(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_comment */
extern void T99f233(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.entity_referenced_in_entity_value */
extern T0* T99f117(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.defined_entity_referenced */
extern T0* T99f194(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.external_entity_to_string */
extern T0* T99f200(T0* C, T0* a1);
/* STRING_8.remove */
extern void T17f52(T0* C, T6 a1);
/* XM_EIFFEL_INPUT_STREAM.read_string */
extern void T233f29(T0* C, T6 a1);
/* KL_PLATFORM.maximum_integer */
extern unsigned char ge109os10889;
extern T6 ge109ov10889;
extern T6 T235f2(T0* C);
/* KL_INTEGER_ROUTINES.platform */
extern T0* T234f1(T0* C);
/* XM_EIFFEL_PARSER.integer_ */
extern T0* T99f201(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item */
extern T0* T171f21(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_item */
extern T0* T171f36(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.force_error */
extern void T99f232(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.report_error */
extern void T99f230(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_error */
extern void T99f256(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.setup_error_state */
extern void T99f255(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.onstring_utf8 */
extern T0* T99f96(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.maximum_item_code */
extern T6 T99f189(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_latin1 */
extern T1 T99f188(T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_from_utf8 */
extern T0* T99f184(T0* C, T0* a1);
/* UC_UTF8_STRING.make_from_utf8 */
extern T0* T232c56(T0* a1);
/* UC_UTF8_STRING.append_utf8 */
extern void T232f70(T0* C, T0* a1);
/* UC_UTF8_ROUTINES.valid_utf8 */
extern T1 T230f1(T0* C, T0* a1);
/* UC_UTF8_ROUTINES.is_encoded_next_byte */
extern T1 T230f10(T0* C, T2 a1);
/* UC_UTF8_ROUTINES.is_encoded_second_byte */
extern T1 T230f5(T0* C, T2 a1, T2 a2);
/* UC_UTF8_ROUTINES.is_encoded_first_byte */
extern T1 T230f2(T0* C, T2 a1);
/* XM_EIFFEL_PARSER.utf8 */
extern T0* T99f187(T0* C);
/* XM_EIFFEL_PARSER.is_string_mode_ascii */
extern T1 T99f185(T0* C);
/* XM_EIFFEL_PARSER.onstring_ascii */
extern T0* T99f94(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_unicode */
extern T1 T99f183(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string */
extern T0* T99f115(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_string */
extern unsigned char ge1430os6490;
extern T0* ge1430ov6490;
extern T0* T99f193(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_uc */
extern unsigned char ge1430os6491;
extern T0* ge1430ov6491;
extern T0* T99f192(T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_empty */
extern T0* T99f199(T0* C);
/* UC_UTF8_STRING.make_empty */
extern T0* T232c60(void);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].resize */
extern T0* T185f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].aliased_resized_area_with_default */
extern T0* T184f4(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].aliased_resized_area */
extern T0* T184f5(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].make */
extern T0* T185f1(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].make_filled */
extern T0* T184c6(T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].fill_with */
extern void T184f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].make */
extern void T184f9(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T185c3(void);
/* XM_EIFFEL_PARSER.namespace_force_last */
extern void T99f231(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER_NAME.force_last */
extern void T176f19(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.new_string_bilinked_list */
extern T0* T176f7(T0* C);
/* XM_EIFFEL_PARSER_NAME.can_force_last */
extern T1 T176f6(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_namespace_name */
extern T0* T99f111(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern void T176f20(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern T0* T176c20(void);
/* XM_EIFFEL_PARSER_NAME.make_namespaces */
extern T0* T176c18(void);
/* XM_EIFFEL_PARSER.yy_push_last_value */
extern void T99f221(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.accept */
extern void T99f220(T0* C);
/* XM_EIFFEL_PARSER.yy_do_error_action */
extern void T99f218(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.report_eof_expected_error */
extern void T99f229(T0* C);
/* XM_EIFFEL_PARSER.read_token */
extern void T99f217(T0* C);
/* XM_EIFFEL_PARSER.process_attribute_entity */
extern void T99f228(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_entity_scanner */
extern void T99f254(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.has_error */
extern T1 T203f55(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.has_error */
extern T1 T209f56(T0* C);
/* XM_EIFFEL_ENTITY_DEF.apply_input_buffer */
extern void T203f228(T0* C);
/* KL_STRING_INPUT_STREAM.make */
extern T0* T374c9(T0* a1);
/* UC_UTF8_ROUTINES.to_utf8 */
extern T0* T230f32(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.utf8 */
extern T0* T203f66(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.apply_input_buffer */
extern void T209f232(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.utf8 */
extern T0* T209f68(T0* C);
/* XM_EIFFEL_PARSER.process_entity */
extern void T99f227(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_pe_entity */
extern void T99f226(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.special_integer_ */
extern T0* T99f113(T0* C);
/* XM_EIFFEL_PARSER.yy_init_value_stacks */
extern void T99f216(T0* C);
/* XM_EIFFEL_PARSER.yy_clear_all */
extern void T99f225(T0* C);
/* XM_EIFFEL_PARSER.clear_all */
extern void T99f253(T0* C);
/* XM_EIFFEL_PARSER.clear_stacks */
extern void T99f259(T0* C);
/* XM_EIFFEL_PARSER.yy_clear_value_stacks */
extern void T99f260(T0* C);
/* SPECIAL [XM_EIFFEL_DECLARATION].upper */
extern T6 T186f3(T0* C);
/* SPECIAL [BOOLEAN].upper */
extern T6 T188f3(T0* C);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].upper */
extern T6 T201f3(T0* C);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].upper */
extern T6 T196f3(T0* C);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].upper */
extern T6 T198f3(T0* C);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].upper */
extern T6 T193f3(T0* C);
/* SPECIAL [XM_DTD_EXTERNAL_ID].upper */
extern T6 T189f3(T0* C);
/* SPECIAL [STRING_8].upper */
extern T6 T50f5(T0* C);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].upper */
extern T6 T191f3(T0* C);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].upper */
extern T6 T184f3(T0* C);
/* SPECIAL [ANY].upper */
extern T6 T174f2(T0* C);
/* XM_EIFFEL_PARSER.abort */
extern void T99f219(T0* C);
/* XM_EIFFEL_PARSER.on_start */
extern void T99f213(T0* C);
/* XM_EIFFEL_PARSER.reset_error_state */
extern void T99f212(T0* C);
/* XM_EIFFEL_PARSER.reset */
extern void T99f208(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].wipe_out */
extern void T171f39(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_wipe_out */
extern void T171f49(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_wipe_out */
extern void T171f48(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_wipe_out */
extern void T171f47(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_wipe_out */
extern void T171f46(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].move_all_cursors_after */
extern void T171f44(T0* C);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].set_next_cursor */
extern void T302f6(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].set_position */
extern void T302f5(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.make_scanner */
extern void T99f206(T0* C);
/* XM_EIFFEL_SCANNER.make_scanner */
extern T0* T166c196(void);
/* XM_EIFFEL_SCANNER.reset */
extern void T166f204(T0* C);
/* XM_EIFFEL_SCANNER.reset */
extern void T166f204p1(T0* C);
/* XM_EIFFEL_SCANNER.make_with_buffer */
extern void T166f203(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_initialize */
extern void T166f211(T0* C);
/* XM_EIFFEL_SCANNER.yy_build_tables */
extern void T166f219(T0* C);
/* XM_EIFFEL_SCANNER.yy_accept_template */
extern T0* T166f190(T0* C);
/* XM_EIFFEL_SCANNER.yy_fixed_array */
extern T0* T166f193(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_meta_template */
extern T0* T166f189(T0* C);
/* XM_EIFFEL_SCANNER.yy_ec_template */
extern T0* T166f188(T0* C);
/* XM_EIFFEL_SCANNER.yy_def_template */
extern T0* T166f187(T0* C);
/* XM_EIFFEL_SCANNER.yy_base_template */
extern T0* T166f186(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template */
extern T0* T166f185(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_6 */
extern void T166f231(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_array_subcopy */
extern void T166f232(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_SCANNER.integer_array_ */
extern T0* T166f195(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_5 */
extern void T166f230(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_4 */
extern void T166f229(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_3 */
extern void T166f228(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_2 */
extern void T166f227(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_1 */
extern void T166f226(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template */
extern T0* T166f184(T0* C);
/* XM_EIFFEL_SCANNER.yy_nxt_template_6 */
extern void T166f225(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_5 */
extern void T166f224(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_4 */
extern void T166f223(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_3 */
extern void T166f222(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_2 */
extern void T166f221(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_1 */
extern void T166f220(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.empty_buffer */
extern T0* T166f42(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T77f39(T0* C);
/* KL_TEXT_INPUT_FILE.is_closed */
extern T1 T77f17(T0* C);
/* KL_TEXT_INPUT_FILE.old_open_read */
extern void T77f43(T0* C);
/* KL_TEXT_INPUT_FILE.default_pointer */
extern T14 T77f21(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T77f43p1(T0* C);
/* KL_TEXT_INPUT_FILE.file_open */
extern T14 T77f22(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.old_is_readable */
extern T1 T77f16(T0* C);
/* UNIX_FILE_INFO.is_readable */
extern T1 T152f5(T0* C);
/* UNIX_FILE_INFO.file_eaccess */
extern T1 T152f3(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.buffered_file_info */
extern unsigned char ge2229os3286;
extern T0* ge2229ov3286;
extern T0* T77f24(T0* C);
/* UNIX_FILE_INFO.make */
extern T0* T152c6(void);
/* UNIX_FILE_INFO.make_buffered_file_info */
extern void T152f8(T0* C, T6 a1);
/* UNIX_FILE_INFO.stat_size */
extern T6 T152f4(T0* C);
/* KL_TEXT_INPUT_FILE.set_buffer */
extern void T77f45(T0* C);
/* UNIX_FILE_INFO.update */
extern void T152f7(T0* C, T0* a1);
/* UNIX_FILE_INFO.file_stat */
extern void T152f9(T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.old_exists */
extern T1 T77f15(T0* C);
/* KL_TEXT_INPUT_FILE.file_exists */
extern T1 T77f23(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.make */
extern T0* T77c37(T0* a1);
/* KL_TEXT_INPUT_FILE.make */
extern void T77f37p1(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.old_make */
extern void T77f41(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.string_ */
extern T0* T77f27(T0* C);
/* ET_XACE_PARSER.make_with_variables */
extern T0* T82c252(T0* a1, T0* a2);
/* ET_XACE_PARSER.make_with_variables_and_factory */
extern void T82f254(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.enable_position_table */
extern void T94f10(T0* C, T0* a1);
/* XM_POSITION_TABLE.make */
extern T0* T90c3(void);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T227c8(void);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].set_internal_cursor */
extern void T227f9(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.set_callbacks */
extern void T99f205(T0* C, T0* a1);
/* XM_TREE_CALLBACKS_PIPE.make */
extern T0* T92c10(void);
/* XM_TREE_CALLBACKS_PIPE.callbacks_pipe */
extern T0* T92f9(T0* C, T0* a1);
/* ARRAY [XM_CALLBACKS_FILTER].item */
extern T0* T156f4(T0* C, T6 a1);
/* XM_CALLBACKS_TO_TREE_FILTER.make_null */
extern T0* T94c9(void);
/* XM_TREE_CALLBACKS_PIPE.new_stop_on_error */
extern T0* T92f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.make_null */
extern T0* T93c4(void);
/* XM_TREE_CALLBACKS_PIPE.new_namespace_resolver */
extern T0* T92f6(T0* C);
/* XM_NAMESPACE_RESOLVER.make_null */
extern T0* T154c25(void);
/* XM_EIFFEL_PARSER.set_string_mode_mixed */
extern void T99f204(T0* C);
/* XM_EIFFEL_PARSER.make */
extern T0* T99c202(void);
/* XM_EIFFEL_PARSER.new_entities_table */
extern T0* T99f87(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].set_key_equality_tester */
extern void T171f41(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8].internal_set_equality_tester */
extern void T300f6(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_map_default */
extern T0* T171c38(void);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_map */
extern void T171f43(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_with_equality_testers */
extern void T171f55(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T300c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8].set_internal_cursor */
extern void T300f7(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8].new_cursor */
extern T0* T300f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T361c3(T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_cursor */
extern T0* T171f35(T0* C);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T302c4(T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_sparse_container */
extern void T171f60(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].set_internal_cursor */
extern void T171f65(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_slots */
extern void T171f64(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_clashes */
extern void T171f63(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_key_storage */
extern void T171f62(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_item_storage */
extern void T171f61(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T304f2(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].make_filled */
extern T0* T299c5(T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].fill_with */
extern void T299f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].make */
extern void T299f7(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].default_create */
extern T0* T304c3(void);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].default_capacity */
extern T6 T171f31(T0* C);
/* XM_EIFFEL_PARSER.make_parser */
extern void T99f207(T0* C);
/* XM_EIFFEL_PARSER.yy_build_parser_tables */
extern void T99f211(T0* C);
/* XM_EIFFEL_PARSER.yycheck_template */
extern unsigned char ge1426os6370;
extern T0* ge1426ov6370;
extern T0* T99f104(T0* C);
/* XM_EIFFEL_PARSER.yyfixed_array */
extern T0* T99f181(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytable_template */
extern unsigned char ge1426os6369;
extern T0* ge1426ov6369;
extern T0* T99f92(T0* C);
/* XM_EIFFEL_PARSER.yypgoto_template */
extern unsigned char ge1426os6368;
extern T0* ge1426ov6368;
extern T0* T99f90(T0* C);
/* XM_EIFFEL_PARSER.yypact_template */
extern unsigned char ge1426os6367;
extern T0* ge1426ov6367;
extern T0* T99f88(T0* C);
/* XM_EIFFEL_PARSER.yydefgoto_template */
extern unsigned char ge1426os6366;
extern T0* ge1426ov6366;
extern T0* T99f86(T0* C);
/* XM_EIFFEL_PARSER.yydefact_template */
extern unsigned char ge1426os6365;
extern T0* ge1426ov6365;
extern T0* T99f84(T0* C);
/* XM_EIFFEL_PARSER.yytypes2_template */
extern unsigned char ge1426os6364;
extern T0* ge1426ov6364;
extern T0* T99f171(T0* C);
/* XM_EIFFEL_PARSER.yytypes1_template */
extern unsigned char ge1426os6363;
extern T0* ge1426ov6363;
extern T0* T99f155(T0* C);
/* XM_EIFFEL_PARSER.yyr1_template */
extern unsigned char ge1426os6362;
extern T0* ge1426ov6362;
extern T0* T99f136(T0* C);
/* XM_EIFFEL_PARSER.yytranslate_template */
extern unsigned char ge1426os6361;
extern T0* ge1426ov6361;
extern T0* T99f125(T0* C);
/* XM_EIFFEL_PARSER.yy_create_value_stacks */
extern void T99f210(T0* C);
/* XM_EXPAT_PARSER_FACTORY.new_expat_parser */
extern T0* T98f2(T0* C);
/* XM_EXPAT_PARSER_FACTORY.is_expat_parser_available */
extern T1 T98f1(T0* C);
/* XM_EXPAT_PARSER_FACTORY.default_create */
extern T0* T98c3(void);
/* ET_XACE_VALIDATOR.make */
extern T0* T95c30(T0* a1);
/* ET_XACE_PREPROCESSOR.make */
extern T0* T96c10(T0* a1, T0* a2);
/* ET_XACE_LIBRARY_CONFIG_PARSER.set_parsed_libraries */
extern void T80f253(T0* C, T0* a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.make_with_variables_and_factory */
extern void T80f252(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_CONFIG_PARSER.make_with_variables_and_factory */
extern T0* T80c252(T0* a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].set_key_equality_tester */
extern void T97f39(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [ET_XACE_LIBRARY_CONFIG, STRING_8].internal_set_equality_tester */
extern void T161f6(T0* C, T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_map */
extern T0* T97c37(T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_with_equality_testers */
extern void T97f40(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [ET_XACE_LIBRARY_CONFIG, STRING_8].make */
extern T0* T161c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [ET_XACE_LIBRARY_CONFIG, STRING_8].set_internal_cursor */
extern void T161f7(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [ET_XACE_LIBRARY_CONFIG, STRING_8].new_cursor */
extern T0* T161f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8].make */
extern T0* T289c3(T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].new_cursor */
extern T0* T97f32(T0* C);
/* DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8].make */
extern T0* T163c4(T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_sparse_container */
extern void T97f47(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].set_internal_cursor */
extern void T97f52(T0* C, T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_slots */
extern void T97f51(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_clashes */
extern void T97f50(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_key_storage */
extern void T97f49(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_item_storage */
extern void T97f48(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY_CONFIG].make */
extern T0* T165f1(T0* C, T6 a1);
/* SPECIAL [ET_XACE_LIBRARY_CONFIG].make_filled */
extern T0* T164c5(T0* a1, T6 a2);
/* SPECIAL [ET_XACE_LIBRARY_CONFIG].fill_with */
extern void T164f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ET_XACE_LIBRARY_CONFIG].make */
extern void T164f7(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY_CONFIG].default_create */
extern T0* T165c3(void);
/* ET_XACE_AST_FACTORY.make */
extern T0* T87c10(void);
/* GEXACE_LIBRARY_COMMAND.execute */
extern void T40f15(T0* C);
/* GEXACE_LIBRARY_COMMAND.execute_generators */
extern void T40f16(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].forth */
extern void T64f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].cursor_forth */
extern void T46f12(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].add_traversing_cursor */
extern void T46f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].set_next_cursor */
extern void T64f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].remove_traversing_cursor */
extern void T46f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].set */
extern void T64f10(T0* C, T0* a1, T1 a2, T1 a3);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_cannot_write_file_error */
extern void T28f17(T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.make */
extern T0* T85c7(T0* a1);
/* KL_TEXT_OUTPUT_FILE.close */
extern void T79f24(T0* C);
/* KL_TEXT_OUTPUT_FILE.is_open_write */
extern T1 T79f12(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
extern T1 T79f8(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T79f23(T0* C);
/* KL_TEXT_OUTPUT_FILE.is_closed */
extern T1 T79f13(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_write */
extern void T79f27(T0* C);
/* KL_TEXT_OUTPUT_FILE.default_pointer */
extern T14 T79f18(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T79f27p1(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_open */
extern T14 T79f19(T0* C, T14 a1, T6 a2);
/* KL_TEXT_OUTPUT_FILE.make */
extern T0* T79c21(T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_make */
extern void T79f25(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].item */
extern T0* T64f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].start */
extern void T64f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].cursor_start */
extern void T46f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].cursor_off */
extern T1 T46f7(T0* C, T0* a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.parse_file */
extern void T80f251(T0* C, T0* a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.new_library */
extern T0* T80f12(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_CONFIG_PARSER.tokens */
extern T0* T80f14(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.set_ve */
extern void T80f250(T0* C, T1 a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.set_shallow */
extern void T80f249(T0* C, T1 a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.make_with_variables */
extern T0* T80c248(T0* a1, T0* a2);
/* GEXACE_SYSTEM_COMMAND.execute */
extern void T36f15(T0* C);
/* GEXACE_SYSTEM_COMMAND.execute_generators */
extern void T36f16(T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG_PARSER.parse_file */
extern void T75f253(T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG_PARSER.new_system */
extern T0* T75f12(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.fill_system */
extern void T75f255(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_SYSTEM_CONFIG_PARSER.fill_externals */
extern void T75f257(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_SYSTEM_CONFIG_PARSER.new_export */
extern T0* T75f143(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.new_exported_feature */
extern T0* T75f247(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_alias */
extern T0* T75f249(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_feature */
extern T0* T75f246(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_export */
extern T0* T75f142(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_include_dir */
extern T0* T75f141(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_location */
extern T0* T75f140(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_link_library */
extern T0* T75f139(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_external */
extern T0* T75f27(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.new_options */
extern T0* T75f26(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.fill_options */
extern void T75f256(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_debug */
extern T0* T75f138(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_optimize */
extern T0* T75f137(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_check */
extern T0* T75f135(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_loop */
extern T0* T75f132(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_invariant */
extern T0* T75f130(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_ensure */
extern T0* T75f128(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_enable */
extern T0* T75f126(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_require */
extern T0* T75f125(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.is_false */
extern T1 T75f124(T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG_PARSER.is_true */
extern T1 T75f123(T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG_PARSER.option_codes */
extern T0* T75f29(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.string_equality_tester */
extern T0* T75f13(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_value */
extern T0* T75f28(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_option */
extern T0* T75f25(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.new_mount */
extern T0* T75f24(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_SYSTEM_CONFIG_PARSER.execution_environment */
extern T0* T75f148(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_prefix */
extern T0* T75f146(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_mount */
extern T0* T75f23(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.new_cluster */
extern T0* T75f22(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_SYSTEM_CONFIG_PARSER.new_class */
extern T0* T75f147(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.new_feature */
extern T0* T75f248(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_relative */
extern T0* T75f145(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_abstract */
extern T0* T75f144(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_cluster */
extern T0* T75f20(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.string_ */
extern T0* T75f19(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_creation */
extern T0* T75f18(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_class */
extern T0* T75f17(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_root */
extern T0* T75f16(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_name */
extern T0* T75f15(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.tokens */
extern T0* T75f14(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.set_ve */
extern void T75f252(T0* C, T1 a1);
/* ET_XACE_SYSTEM_CONFIG_PARSER.set_shallow */
extern void T75f251(T0* C, T1 a1);
/* ET_XACE_SYSTEM_CONFIG_PARSER.make_with_variables */
extern T0* T75c250(T0* a1, T0* a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.make_with_variables_and_factory */
extern void T75f254(T0* C, T0* a1, T0* a2, T0* a3);
/* GEXACE_VALIDATE_COMMAND.set_xace_filename */
extern void T41f8(T0* C, T0* a1);
/* GEXACE_LIBRARY_COMMAND.set_xace_filename */
extern void T40f14(T0* C, T0* a1);
/* GEXACE_SYSTEM_COMMAND.set_xace_filename */
extern void T36f14(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.error_position */
extern T0* T209f57(T0* C);
/* XM_DEFAULT_POSITION.make */
extern T0* T167c7(T0* a1, T6 a2, T6 a3, T6 a4);
/* XM_EIFFEL_SCANNER_DTD.error_position */
extern T0* T207f55(T0* C);
/* XM_EIFFEL_ENTITY_DEF.error_position */
extern T0* T203f56(T0* C);
/* XM_EIFFEL_SCANNER.error_position */
extern T0* T166f63(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.end_of_file */
extern T1 T209f60(T0* C);
/* XM_EIFFEL_SCANNER_DTD.end_of_file */
extern T1 T207f61(T0* C);
/* XM_EIFFEL_ENTITY_DEF.end_of_file */
extern T1 T203f59(T0* C);
/* XM_EIFFEL_SCANNER.end_of_file */
extern T1 T166f65(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_applicable_encoding */
extern T1 T209f61(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_applicable_encoding */
extern T1 T233f16(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_valid_encoding */
extern T1 T233f9(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.is_applicable_encoding */
extern T1 T207f48(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.is_applicable_encoding */
extern T1 T203f60(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.is_applicable_encoding */
extern T1 T166f66(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.start_condition */
extern T6 T209f62(T0* C);
/* XM_EIFFEL_SCANNER_DTD.start_condition */
extern T6 T207f50(T0* C);
/* XM_EIFFEL_ENTITY_DEF.start_condition */
extern T6 T203f61(T0* C);
/* XM_EIFFEL_SCANNER.start_condition */
extern T6 T166f43(T0* C);
/* ET_XACE_ECF_GENERATOR.default_system_output_filename */
extern unsigned char ge1254os2676;
extern T0* ge1254ov2676;
extern T0* T45f5(T0* C);
/* ET_XACE_ACE_GENERATOR.default_system_output_filename */
extern unsigned char ge1253os2676;
extern T0* ge1253ov2676;
extern T0* T44f5(T0* C);
/* ET_XACE_XACE_GENERATOR.default_system_output_filename */
extern unsigned char ge1256os2676;
extern T0* ge1256ov2676;
extern T0* T43f5(T0* C);
/* ET_XACE_ECF_GENERATOR.default_library_output_filename */
extern unsigned char ge1254os2677;
extern T0* ge1254ov2677;
extern T0* T45f6(T0* C);
/* ET_XACE_ACE_GENERATOR.default_library_output_filename */
extern unsigned char ge1253os2677;
extern T0* ge1253ov2677;
extern T0* T44f6(T0* C);
/* ET_XACE_XACE_GENERATOR.default_library_output_filename */
extern unsigned char ge1256os2677;
extern T0* ge1256ov2677;
extern T0* T43f6(T0* C);
/* ET_XACE_INVALID_EXPRESSION_ERROR.default_message */
extern T0* T313f5(T0* C);
/* ET_XACE_INVALID_EXPRESSION_ERROR.message */
extern T0* T313f3(T0* C, T0* a1);
/* ET_XACE_INVALID_EXPRESSION_ERROR.arguments */
extern T0* T313f6(T0* C);
/* ARRAY [STRING_8].valid_index */
extern T1 T63f4(T0* C, T6 a1);
/* ET_XACE_INVALID_EXPRESSION_ERROR.string_ */
extern T0* T313f4(T0* C);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.default_message */
extern T0* T312f5(T0* C);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.message */
extern T0* T312f3(T0* C, T0* a1);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.arguments */
extern T0* T312f6(T0* C);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.string_ */
extern T0* T312f4(T0* C);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.default_message */
extern T0* T222f5(T0* C);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.message */
extern T0* T222f3(T0* C, T0* a1);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.arguments */
extern T0* T222f6(T0* C);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.string_ */
extern T0* T222f4(T0* C);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.default_message */
extern T0* T221f5(T0* C);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.message */
extern T0* T221f3(T0* C, T0* a1);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.arguments */
extern T0* T221f6(T0* C);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.string_ */
extern T0* T221f4(T0* C);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.default_message */
extern T0* T220f5(T0* C);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.message */
extern T0* T220f3(T0* C, T0* a1);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.arguments */
extern T0* T220f6(T0* C);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.string_ */
extern T0* T220f4(T0* C);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.default_message */
extern T0* T219f5(T0* C);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.message */
extern T0* T219f3(T0* C, T0* a1);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.arguments */
extern T0* T219f6(T0* C);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.string_ */
extern T0* T219f4(T0* C);
/* ET_XACE_MISSING_ELEMENT_ERROR.default_message */
extern T0* T218f5(T0* C);
/* ET_XACE_MISSING_ELEMENT_ERROR.message */
extern T0* T218f3(T0* C, T0* a1);
/* ET_XACE_MISSING_ELEMENT_ERROR.arguments */
extern T0* T218f6(T0* C);
/* ET_XACE_MISSING_ELEMENT_ERROR.string_ */
extern T0* T218f4(T0* C);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.default_message */
extern T0* T217f5(T0* C);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.message */
extern T0* T217f3(T0* C, T0* a1);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.arguments */
extern T0* T217f6(T0* C);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.string_ */
extern T0* T217f4(T0* C);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.default_message */
extern T0* T216f5(T0* C);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.message */
extern T0* T216f3(T0* C, T0* a1);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.arguments */
extern T0* T216f6(T0* C);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.string_ */
extern T0* T216f4(T0* C);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.default_message */
extern T0* T215f5(T0* C);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.message */
extern T0* T215f3(T0* C, T0* a1);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.arguments */
extern T0* T215f6(T0* C);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.string_ */
extern T0* T215f4(T0* C);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.default_message */
extern T0* T214f5(T0* C);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.message */
extern T0* T214f3(T0* C, T0* a1);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.arguments */
extern T0* T214f6(T0* C);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.string_ */
extern T0* T214f4(T0* C);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.default_message */
extern T0* T213f5(T0* C);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.message */
extern T0* T213f3(T0* C, T0* a1);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.arguments */
extern T0* T213f6(T0* C);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.default_message */
extern T0* T212f5(T0* C);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.message */
extern T0* T212f3(T0* C, T0* a1);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.arguments */
extern T0* T212f6(T0* C);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.string_ */
extern T0* T212f4(T0* C);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.default_message */
extern T0* T211f5(T0* C);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.message */
extern T0* T211f3(T0* C, T0* a1);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.arguments */
extern T0* T211f6(T0* C);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.string_ */
extern T0* T211f4(T0* C);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.default_message */
extern T0* T210f5(T0* C);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.message */
extern T0* T210f3(T0* C, T0* a1);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.arguments */
extern T0* T210f6(T0* C);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.string_ */
extern T0* T210f4(T0* C);
/* ET_XACE_NOT_XACE_FILE_ERROR.default_message */
extern T0* T107f5(T0* C);
/* ET_XACE_NOT_XACE_FILE_ERROR.message */
extern T0* T107f3(T0* C, T0* a1);
/* ET_XACE_NOT_XACE_FILE_ERROR.arguments */
extern T0* T107f6(T0* C);
/* ET_XACE_NOT_XACE_FILE_ERROR.string_ */
extern T0* T107f4(T0* C);
/* UT_MESSAGE.default_message */
extern T0* T106f5(T0* C);
/* UT_MESSAGE.message */
extern T0* T106f3(T0* C, T0* a1);
/* UT_MESSAGE.arguments */
extern T0* T106f6(T0* C);
/* UT_MESSAGE.string_ */
extern T0* T106f4(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
extern T0* T85f5(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
extern T0* T85f3(T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.arguments */
extern T0* T85f6(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
extern T0* T85f4(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.default_message */
extern T0* T84f5(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.message */
extern T0* T84f3(T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.arguments */
extern T0* T84f6(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.string_ */
extern T0* T84f4(T0* C);
/* UT_USAGE_MESSAGE.default_message */
extern T0* T34f2(T0* C);
/* UT_USAGE_MESSAGE.message */
extern T0* T34f4(T0* C, T0* a1);
/* UT_USAGE_MESSAGE.arguments */
extern T0* T34f6(T0* C);
/* UT_USAGE_MESSAGE.string_ */
extern T0* T34f5(T0* C);
extern T0* GE_ma229(T6 c, T6 n, ...);
extern T0* GE_ma63(T6 c, T6 n, ...);
extern T0* GE_ma156(T6 c, T6 n, ...);
extern T0* ge78ov2991;
extern T0* ge42ov2930;
extern T0* ge4ov2106;
extern T0* ge4ov2107;
extern T0* ge131ov4430;
extern T0* ge141ov10791;
extern T0* ge1434ov10054;
extern T0* ge1434ov10055;
extern T0* ge66ov5133;
extern T0* ge1425ov10799;
extern T0* ge1425ov10801;
extern T0* ge1377ov5958;
extern T0* ge1358ov9899;
extern T0* ge1358ov9898;
extern T0* ge1230ov4770;
extern T0* ge1230ov4783;
extern T0* ge1230ov4786;
extern T0* ge1230ov4762;
extern T0* ge1230ov4790;
extern T0* ge1230ov4772;
extern T0* ge1230ov4766;
extern T0* ge1230ov4777;
extern T0* ge1230ov4779;
extern T0* ge1230ov4778;
extern T0* ge1230ov4791;
extern T0* ge83ov8084;
extern T0* ge1230ov4774;
extern T0* ge1230ov4763;
extern T0* ge1230ov4769;
extern T0* ge1230ov4785;
extern T0* ge1230ov4771;
extern T0* ge1230ov4773;
extern T0* ge176ov2991;
extern T0* ge1230ov4775;
extern T0* ge1230ov4764;
extern T0* ge1230ov4776;
extern T0* ge1420ov6118;
extern T0* ge1420ov6117;
extern T0* ge1261ov4572;
extern T0* ge1230ov4789;
extern T0* ge1230ov4768;
extern T0* ge1230ov4782;
extern T0* ge1230ov4784;
extern T0* ge1230ov4788;
extern T0* ge1230ov4781;
extern T0* ge1230ov4787;
extern T0* ge1230ov4765;
extern T0* ge1230ov4780;
extern T0* ge1230ov4767;
extern T0* ge1230ov4793;
extern T0* ge1261ov4571;
extern T0* ge1261ov4570;
extern T0* ge1230ov4573;
extern T0* ge1230ov4574;
extern T0* ge1230ov4575;
extern T0* ge1230ov4576;
extern T0* ge1230ov4577;
extern T0* ge1230ov4578;
extern T0* ge1230ov4579;
extern T0* ge1230ov4580;
extern T0* ge1230ov4581;
extern T0* ge1230ov4582;
extern T0* ge1230ov4583;
extern T0* ge1230ov4584;
extern T0* ge1230ov4585;
extern T0* ge1230ov4586;
extern T0* ge1230ov4587;
extern T0* ge1230ov4588;
extern T0* ge1230ov4589;
extern T0* ge1230ov4590;
extern T0* ge1230ov4591;
extern T0* ge1230ov4592;
extern T0* ge1230ov4593;
extern T0* ge1230ov4594;
extern T0* ge1230ov4595;
extern T0* ge1230ov4596;
extern T0* ge1230ov4597;
extern T0* ge1230ov4598;
extern T0* ge1230ov4599;
extern T0* ge1230ov4600;
extern T0* ge1230ov4601;
extern T0* ge1230ov4602;
extern T0* ge1230ov4603;
extern T0* ge1230ov4604;
extern T0* ge1230ov4605;
extern T0* ge1230ov4606;
extern T0* ge1230ov4607;
extern T0* ge1230ov4608;
extern T0* ge1230ov4609;
extern T0* ge1230ov4610;
extern T0* ge1230ov4611;
extern T0* ge1230ov4612;
extern T0* ge1230ov4613;
extern T0* ge1230ov4614;
extern T0* ge1230ov4615;
extern T0* ge1230ov4616;
extern T0* ge1230ov4617;
extern T0* ge1230ov4618;
extern T0* ge1230ov4619;
extern T0* ge1230ov4620;
extern T0* ge1230ov4621;
extern T0* ge1230ov4622;
extern T0* ge1230ov4623;
extern T0* ge1230ov4624;
extern T0* ge1230ov4625;
extern T0* ge1230ov4626;
extern T0* ge1230ov4627;
extern T0* ge1230ov4628;
extern T0* ge1230ov4629;
extern T0* ge1230ov4630;
extern T0* ge1230ov4631;
extern T0* ge1230ov4632;
extern T0* ge1230ov4633;
extern T0* ge1230ov4634;
extern T0* ge1230ov4635;
extern T0* ge1230ov4636;
extern T0* ge1230ov4637;
extern T0* ge1230ov4638;
extern T0* ge1230ov4639;
extern T0* ge1230ov4640;
extern T0* ge1230ov4641;
extern T0* ge1230ov4642;
extern T0* ge1230ov4643;
extern T0* ge1230ov4644;
extern T0* ge1230ov4645;
extern T0* ge1230ov4646;
extern T0* ge1230ov4647;
extern T0* ge1230ov4648;
extern T0* ge1230ov4649;
extern T0* ge1230ov4650;
extern T0* ge1230ov4651;
extern T0* ge1230ov4652;
extern T0* ge1230ov4653;
extern T0* ge1230ov4654;
extern T0* ge1230ov4655;
extern T0* ge1230ov4656;
extern T0* ge1230ov4657;
extern T0* ge1230ov4658;
extern T0* ge1230ov4659;
extern T0* ge1230ov4660;
extern T0* ge1230ov4661;
extern T0* ge1230ov4662;
extern T0* ge1230ov4663;
extern T0* ge1230ov4664;
extern T0* ge1230ov4665;
extern T0* ge1230ov4666;
extern T0* ge69ov2991;
extern T0* ge1220ov7036;
extern T0* ge922ov8575;
extern T0* ge922ov8604;
extern T0* ge922ov8566;
extern T0* ge922ov8568;
extern T0* ge922ov8608;
extern T0* ge922ov8607;
extern T0* ge922ov8600;
extern T0* ge922ov8599;
extern T0* ge922ov8595;
extern T0* ge922ov8594;
extern T0* ge922ov8576;
extern T0* ge922ov8606;
extern T0* ge922ov8593;
extern T0* ge922ov8598;
extern T0* ge922ov8597;
extern T0* ge922ov8590;
extern T0* ge922ov8589;
extern T0* ge922ov8588;
extern T0* ge922ov8587;
extern T0* ge922ov8582;
extern T0* ge922ov8581;
extern T0* ge922ov8580;
extern T0* ge922ov8579;
extern T0* ge922ov8573;
extern T0* ge922ov8572;
extern T0* ge922ov8570;
extern T0* ge922ov8820;
extern T0* ge922ov8809;
extern T0* ge922ov8610;
extern T0* ge922ov8609;
extern T0* ge922ov8605;
extern T0* ge922ov8833;
extern T0* ge922ov8601;
extern T0* ge922ov8603;
extern T0* ge922ov8602;
extern T0* ge922ov8596;
extern T0* ge922ov8591;
extern T0* ge922ov8586;
extern T0* ge922ov8578;
extern T0* ge922ov8574;
extern T0* ge922ov8571;
extern T0* ge922ov8923;
extern T0* ge922ov8907;
extern T0* ge922ov8920;
extern T0* ge922ov8921;
extern T0* ge922ov8914;
extern T0* ge922ov8917;
extern T0* ge922ov8909;
extern T0* ge922ov8912;
extern T0* ge922ov8908;
extern T0* ge922ov8922;
extern T0* ge922ov8905;
extern T0* ge922ov8906;
extern T0* ge1226ov5933;
extern T0* ge1427ov6742;
extern T0* ge1427ov6704;
extern T0* ge1427ov6702;
extern T0* ge1427ov6743;
extern T0* ge1427ov6715;
extern T0* ge1427ov6714;
extern T0* ge1427ov6725;
extern T0* ge1427ov6719;
extern T0* ge1427ov6718;
extern T0* ge1427ov6717;
extern T0* ge1427ov6723;
extern T0* ge1427ov6722;
extern T0* ge1427ov6724;
extern T0* ge1427ov6701;
extern T0* ge1427ov6727;
extern T0* ge1427ov6736;
extern T0* ge1430ov6465;
extern T0* ge1430ov6463;
extern T0* ge1430ov6464;
extern T0* ge1427ov6737;
extern T0* ge1427ov6738;
extern T0* ge1427ov6741;
extern T0* ge1427ov6739;
extern T0* ge1427ov6740;
extern T0* ge1427ov6734;
extern T0* ge1423ov10507;
extern T0* ge1423ov10508;
extern T0* ge1427ov6707;
extern T0* ge1427ov6730;
extern T0* ge1427ov6750;
extern T0* ge1427ov6751;
extern T0* ge1427ov6752;
extern T0* ge1427ov6745;
extern T0* ge1427ov6728;
extern T0* ge1427ov6729;
extern T0* ge1427ov6731;
extern T0* ge1427ov6735;
extern T0* ge64ov5153;
extern T0* ge1425ov10798;
extern T0* ge1425ov10800;
extern T0* ge1239ov2654;
extern T0* ge1233ov2654;
extern T0* ge1249ov2654;
extern T0* ge1246ov2654;
extern T0* ge1248ov2654;
extern T0* ge1245ov2654;
extern T0* ge1241ov2654;
extern T0* ge1240ov2654;
extern T0* ge1252ov2654;
extern T0* ge1236ov2654;
extern T0* ge1247ov2654;
extern T0* ge1251ov2654;
extern T0* ge1243ov2654;
extern T0* ge1234ov2654;
extern T0* ge1242ov2654;
extern T0* ge1244ov2654;
extern T0* ge1275ov2654;
extern T0* ge1272ov2654;
extern T0* ge1271ov2654;
extern T0* ge1281ov2654;
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
typedef EIF_CHARACTER (*EIF_CHARACTER_FUNCTION)(EIF_REFERENCE, ...); /* Returns char */
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
extern EIF_CHARACTER_FUNCTION eif_character_function(char* rout, EIF_TYPE_ID cid);
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

		"C functions used to implement class FILE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2007, Eric Bezault and others"
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

/*
 * Create directory `dirname'.
 */
extern void file_mkdir(char* dirname);

/*
 * Rename file `from' into `to'.
 */
extern void file_rename(char* from, char* to);

/*
 * Link file `from' into `to'.
 */
extern void file_link(char *from, char *to);

/*
 * Delete file or directory `name'.
 */
extern void file_unlink(char *name);

/*
 * Open file `name' with the corresponding type `how'.
 */
extern EIF_POINTER file_open(char *name, int how);

/*
 * Open file `fd' with the corresponding type `how'.
 */
extern EIF_POINTER file_dopen(int fd, int how);

/*
 * Reopen file `name' with the corresponding type `how' and substitute that
 * to the old stream described by `old'. This is useful to redirect 'stdout'
 * to another place, for instance.
 */
extern EIF_POINTER file_reopen(char *name, int how, FILE *old);

/*
 * Close the file.
 */
extern void file_close(FILE *fp);

/*
 * Flush data held in stdio buffer.
 */
extern void file_flush(FILE *fp);

/*
 * Return the associated file descriptor.
 */
extern EIF_INTEGER file_fd(FILE *f);

/*
 * Get a character from `f'.
 */
extern EIF_CHARACTER file_gc(FILE *f);

/*
 * Get a string from `f' and fill it into `s' (at most `bound' characters),
 * with `start' being the amount of bytes already stored within s. This
 * means we really have to read (bound - start) characters.
 */
extern EIF_INTEGER file_gs(FILE *f, char *s, EIF_INTEGER bound, EIF_INTEGER start);

/*
 * Read min (bound, remaining bytes in file) characters into `s' and
 * return the number of characters read.
 */
extern EIF_INTEGER file_gss(FILE *f, char *s, EIF_INTEGER bound);

/*
 * Get a word from `f' and fill it into `s' (at most `bound' characters),
 * with `start' being the amount of bytes already stored within s. This
 * means we really have to read (bound - start) characters. Any leading
 * spaces are skipped.
 */
extern EIF_INTEGER file_gw(FILE *f, char *s, EIF_INTEGER bound, EIF_INTEGER start);

/*
 * Look ahead one character. If EOF, return 0.
 */
extern EIF_CHARACTER file_lh(FILE *f);

/*
 * Size of file `fp'.
 */
extern EIF_INTEGER eif_file_size(FILE *fp);

/*
 * Read upto next input line.
 */
extern void file_tnil(FILE *f);

/*
 * Current position within file.
 */
extern EIF_INTEGER file_tell(FILE *f);

/*
 * Touch file `name' by setting both access and modification time to the
 * current time stamp. This external function exists only because there
 * is no way within UNIX_FILE to get the current time stamp. Otherwise,
 * we could simply call file_utime.
 */
extern void file_touch(char *name);

/*
 * Modify the modification and/or the access time stored in the file's
 * inode. The 'how' parameter tells which attributes should be set.
 */
extern void file_utime(char *name, time_t stamp, int how);

/*
 * This is an encapsulation of the stat() system call. The routine either
 * succeeds and returns or fails and raises the appropriate exception.
 */
extern void file_stat(char *path, struct stat *buf);

/*
 * Change permissions of file `name', using an interface like chmod(1).
 * The flag is true if permissions are to be added, 0 to remove them.
 */
extern void file_perm(char *name, char *who, char *what, int flag);

/*
 * Change permission mode on file `path'.
 */
extern void file_chmod(char *path, int mode);

/*
 * Change the owner of the file to `uid'.
 */
extern void file_chown(char *name, int uid);

/*
 * Change the group of the file to `gid'.
 */
extern void file_chgrp(char *name, int gid);

/*
 * Put new_line onto `f'.
 */
extern void file_tnwl(FILE *f);

/*
 * Append a copy of `other' to `f'.
 */
extern void file_append(FILE *f, FILE *other, EIF_INTEGER l);

/*
 * Write string `str' on `f'.
 */
extern void file_ps(FILE *f, char *str, EIF_INTEGER len);

/*
 * Write character `c' on `f'.
 */
extern void file_pc(FILE *f, char c);

/*
 * Go to absolute position `pos' counted from start.
 */
extern void file_go(FILE *f, EIF_INTEGER pos);

/*
 * Go to absolute position `pos' counted from end.
 */
extern void file_recede(FILE *f, EIF_INTEGER pos);

/*
 * Go to absolute position `pos' counted from current position.
 */
extern void file_move(FILE *f, EIF_INTEGER pos);

/*
 * End of file.
 */
extern EIF_BOOLEAN file_feof(FILE *fp);

/*
 * Test whether file exists or not. If `name' represents a symbolic link,
 * it will check that pointed file does exist.
 */
extern EIF_BOOLEAN file_exists(char *name);

/*
 * Test whether file exists or not without following the symbolic link
 * if `name' represents one.
 */
extern EIF_BOOLEAN file_path_exists(char *name);

/*
 * Check whether access permission `op' are possible on file `name' using
 * real UID and real GID. This is probably only useful to setuid or setgid
 * programs.
 */
extern EIF_BOOLEAN file_access(char *name, EIF_INTEGER op);

/*
 * Check whether the file `path' may be created: we need write permissions
 * in the parent directory and there must not be any file bearing that name
 * with no write permissions...
 */
extern EIF_BOOLEAN file_creatable(char *path, EIF_INTEGER length);

/*
 * Get an integer from `f'.
 */
extern EIF_INTEGER file_gi(FILE *f);

/*
 * Get a real from `f'.
 */
extern EIF_REAL_32 file_gr(FILE *f);

/*
 * Get a double from `f'.
 */
extern EIF_REAL_64 file_gd(FILE *f);

/*
 * Write `number' on `f'.
 */
extern void file_pi(FILE *f, EIF_INTEGER number);

/*
 * Write `number' on `f'.
 */
extern void file_pr(FILE *f, EIF_REAL_32 number);

/*
 * Write double `val' onto `f'.
 */
extern void file_pd(FILE *f, EIF_REAL_64 val);

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
extern EIF_BOOLEAN file_eaccess(struct stat *buf, int op);

/*
 * Perform the field dereferencing from the appropriate stat structure,
 * which Eiffel cannot do directly.
 */
extern EIF_INTEGER file_info(struct stat *buf, int op);

/*
 * Return the Eiffel string filled in with the name associated with `uid'
 * if found in /etc/passwd. Otherwise, return fill it in with the numeric
 * value.
 */
extern EIF_REFERENCE file_owner(int uid);

/*
 * Return the Eiffel string filled in with the name associated with `gid'
 * if found in /etc/group. Otherwise, return fill it in with the numeric
 * value.
 */
extern EIF_REFERENCE file_group(int gid);

/*
 * Get an integer from `f'.
 */
extern EIF_INTEGER file_gib(FILE* f);

/*
 * Get a real from `f'.
 */
extern EIF_REAL_32 file_grb(FILE* f);

/*
 * Get a double from `f'.
 */
extern EIF_REAL_64 file_gdb(FILE* f);

/*
 * Open file `name' with the corresponding type `how'.
 */
extern EIF_POINTER file_binary_open(char* name, int how);

/*
 * Open file `fd' with the corresponding type `how'.
 */
extern EIF_POINTER file_binary_dopen(int fd, int how);

/*
 * Reopen file `name' with the corresponding type `how' and substitute that
 * to the old stream described by `old'. This is useful to redirect 'stdout'
 * to another place, for instance.
 */
extern EIF_POINTER file_binary_reopen(char* name, int how, FILE* old);

/*
 * Write `number' on `f'.
 */
extern void file_pib(FILE* f, EIF_INTEGER number);

/*
 * Write `number' on `f'.
 */
extern void file_prb(FILE* f, EIF_REAL_32 number);

/*
 * Write double `val' onto `f'.
 */
extern void file_pdb(FILE* f, EIF_REAL_64 val);

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
extern EIF_CHARACTER console_separator(FILE* f);
extern void console_ps(FILE* f, char* str, EIF_INTEGER len);
extern void console_pr(FILE* f, EIF_REAL_32 number);
extern void console_pc(FILE* f, EIF_CHARACTER c);
extern void console_pd(FILE* f, EIF_REAL_64 val);
extern void console_pi(FILE* f, EIF_INTEGER number);
extern void console_tnwl(FILE* f);
extern EIF_CHARACTER console_readchar(FILE* f);
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

		"C functions used to implement class DIRECTORY"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_DIR_H
#define EIF_DIR_H

#ifdef __cplusplus
extern "C" {
#endif

extern void* dir_open (char* dirname);
extern EIF_REFERENCE dir_next (void* dir);
extern void dir_rewind (void* dir);
extern void dir_close (void* dir);
extern EIF_BOOLEAN eif_dir_exists (char* dirname);
extern EIF_BOOLEAN eif_dir_is_readable (char* dirname);
extern EIF_BOOLEAN eif_dir_is_writable (char* dirname);
extern EIF_BOOLEAN eif_dir_is_executable (char* dirname);
extern void eif_dir_delete (char* dirname);
extern EIF_CHARACTER eif_dir_separator(void);
extern EIF_REFERENCE dir_current(void);
extern EIF_INTEGER eif_chdir(char* path);

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
#include <stdlib.h>
#include <string.h>
