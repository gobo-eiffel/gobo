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

/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8] */
typedef struct S61 T61;

/* SPECIAL [INTEGER_32] */
typedef struct S63 T63;

/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
typedef struct S64 T64;

/* KL_SPECIAL_ROUTINES [INTEGER_32] */
typedef struct S65 T65;

/* KL_SPECIAL_ROUTINES [STRING_8] */
typedef struct S66 T66;

/* KL_STDOUT_FILE */
typedef struct S68 T68;

/* DS_LINKED_LIST_CURSOR [AP_OPTION] */
typedef struct S69 T69;

/* DS_ARRAYED_LIST [detachable STRING_8] */
typedef struct S71 T71;

/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8] */
typedef struct S72 T72;

/* AP_DISPLAY_HELP_FLAG */
typedef struct S73 T73;

/* DS_ARRAYED_LIST [AP_OPTION] */
typedef struct S74 T74;

/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S75 T75;

/* KL_STRING_ROUTINES */
typedef struct S76 T76;

/* TYPED_POINTER [ANY] */
typedef struct S77 T77;

/* DS_HASH_TABLE [STRING_8, STRING_8] */
typedef struct S81 T81;

/* EXECUTION_ENVIRONMENT */
typedef struct S83 T83;

/* KL_ANY_ROUTINES */
typedef struct S84 T84;

/* KL_PATHNAME */
typedef struct S86 T86;

/* UNIX_FILE_INFO */
typedef struct S87 T87;

/* detachable KL_LINKABLE [CHARACTER_8] */
typedef struct S89 T89;

/* XM_EXPAT_PARSER_FACTORY */
typedef struct S91 T91;

/* XM_EIFFEL_PARSER */
typedef struct S93 T93;

/* XM_TREE_CALLBACKS_PIPE */
typedef struct S94 T94;

/* XM_CALLBACKS_TO_TREE_FILTER */
typedef struct S97 T97;

/* XM_DOCUMENT */
typedef struct S98 T98;

/* XM_ELEMENT */
typedef struct S99 T99;

/* XM_STOP_ON_ERROR_FILTER */
typedef struct S100 T100;

/* XM_POSITION_TABLE */
typedef struct S101 T101;

/* KL_EXECUTION_ENVIRONMENT */
typedef struct S104 T104;

/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES] */
typedef struct S105 T105;

/* DS_ARRAYED_STACK [GEANT_VARIABLES] */
typedef struct S106 T106;

/* DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8] */
typedef struct S107 T107;

/* ARRAY [INTEGER_32] */
typedef struct S108 T108;

/* DS_ARRAYED_LIST_CURSOR [AP_OPTION] */
typedef struct S109 T109;

/* SPECIAL [AP_OPTION] */
typedef struct S111 T111;

/* KL_SPECIAL_ROUTINES [AP_OPTION] */
typedef struct S112 T112;

/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S113 T113;

/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S114 T114;

/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S115 T115;

/* UC_STRING */
typedef struct S116 T116;

/* STRING_TO_INTEGER_CONVERTOR */
typedef struct S118 T118;

/* DS_LINKED_LIST [XM_ELEMENT] */
typedef struct S120 T120;

/* DS_LINKED_LIST_CURSOR [XM_ELEMENT] */
typedef struct S121 T121;

/* GEANT_INHERIT_ELEMENT */
typedef struct S122 T122;

/* GEANT_INHERIT */
typedef struct S123 T123;

/* SPECIAL [GEANT_TARGET] */
typedef struct S124 T124;

/* DS_SPARSE_TABLE_KEYS [GEANT_TARGET, STRING_8] */
typedef struct S126 T126;

/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8] */
typedef struct S128 T128;

/* KL_SPECIAL_ROUTINES [GEANT_TARGET] */
typedef struct S129 T129;

/* TYPED_POINTER [SPECIAL [CHARACTER_8]] */
typedef struct S130 T130;

/* XM_EIFFEL_SCANNER */
typedef struct S132 T132;

/* XM_DEFAULT_POSITION */
typedef struct S133 T133;

/* DS_BILINKED_LIST [XM_POSITION] */
typedef struct S135 T135;

/* DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
typedef struct S136 T136;

/* XM_CALLBACKS_NULL */
typedef struct S137 T137;

/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S138 T138;

/* XM_NULL_EXTERNAL_RESOLVER */
typedef struct S140 T140;

/* SPECIAL [ANY] */
typedef struct S141 T141;

/* KL_SPECIAL_ROUTINES [ANY] */
typedef struct S142 T142;

/* XM_EIFFEL_PARSER_NAME */
typedef struct S143 T143;

/* XM_EIFFEL_DECLARATION */
typedef struct S144 T144;

/* XM_DTD_EXTERNAL_ID */
typedef struct S145 T145;

/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
typedef struct S146 T146;

/* XM_DTD_ELEMENT_CONTENT */
typedef struct S147 T147;

/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S148 T148;

/* XM_DTD_ATTRIBUTE_CONTENT */
typedef struct S149 T149;

/* DS_BILINKED_LIST [STRING_8] */
typedef struct S150 T150;

/* SPECIAL [XM_EIFFEL_PARSER_NAME] */
typedef struct S151 T151;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
typedef struct S152 T152;

/* SPECIAL [XM_EIFFEL_DECLARATION] */
typedef struct S153 T153;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
typedef struct S154 T154;

/* SPECIAL [BOOLEAN] */
typedef struct S155 T155;

/* SPECIAL [XM_DTD_EXTERNAL_ID] */
typedef struct S156 T156;

/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
typedef struct S157 T157;

/* KL_SPECIAL_ROUTINES [BOOLEAN] */
typedef struct S158 T158;

/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S159 T159;

/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S160 T160;

/* SPECIAL [XM_DTD_ELEMENT_CONTENT] */
typedef struct S161 T161;

/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
typedef struct S162 T162;

/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S164 T164;

/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S166 T166;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S167 T167;

/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S168 T168;

/* SPECIAL [DS_BILINKED_LIST [STRING_8]] */
typedef struct S169 T169;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
typedef struct S170 T170;

/* XM_EIFFEL_ENTITY_DEF */
typedef struct S171 T171;

/* XM_DTD_CALLBACKS_NULL */
typedef struct S173 T173;

/* XM_EIFFEL_SCANNER_DTD */
typedef struct S174 T174;

/* XM_EIFFEL_PE_ENTITY_DEF */
typedef struct S176 T176;

/* XM_NAMESPACE_RESOLVER */
typedef struct S177 T177;

/* SPECIAL [XM_CALLBACKS_FILTER] */
typedef struct S178 T178;

/* ARRAY [XM_CALLBACKS_FILTER] */
typedef struct S179 T179;

/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S180 T180;

/* SPECIAL [GEANT_ARGUMENT_VARIABLES] */
typedef struct S181 T181;

/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES] */
typedef struct S182 T182;

/* SPECIAL [GEANT_VARIABLES] */
typedef struct S183 T183;

/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES] */
typedef struct S184 T184;

/* ARRAY [AP_OPTION] */
typedef struct S186 T186;

/* ARRAY [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S187 T187;

/* C_STRING */
typedef struct S188 T188;

/* DS_ARRAYED_STACK [GEANT_TARGET] */
typedef struct S190 T190;

/* GEANT_TASK_FACTORY */
typedef struct S191 T191;

/* GEANT_PARENT */
typedef struct S192 T192;

/* DS_ARRAYED_LIST [GEANT_PARENT] */
typedef struct S194 T194;

/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT] */
typedef struct S195 T195;

/* GEANT_INTERPRETING_ELEMENT */
typedef struct S196 T196;

/* GEANT_ARGUMENT_ELEMENT */
typedef struct S197 T197;

/* GEANT_LOCAL_ELEMENT */
typedef struct S198 T198;

/* GEANT_GLOBAL_ELEMENT */
typedef struct S199 T199;

/* XM_ATTRIBUTE */
typedef struct S200 T200;

/* GEANT_GROUP */
typedef struct S201 T201;

/* DS_LINKED_LIST_CURSOR [XM_NODE] */
typedef struct S203 T203;

/* UC_UTF8_ROUTINES */
typedef struct S204 T204;

/* UC_UTF8_STRING */
typedef struct S205 T205;

/* XM_EIFFEL_INPUT_STREAM */
typedef struct S206 T206;

/* KL_INTEGER_ROUTINES */
typedef struct S207 T207;

/* KL_PLATFORM */
typedef struct S208 T208;

/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S209 T209;

/* DS_PAIR [XM_POSITION, XM_NODE] */
typedef struct S210 T210;

/* INTEGER_OVERFLOW_CHECKER */
typedef struct S211 T211;

/* DS_LINKABLE [XM_ELEMENT] */
typedef struct S212 T212;

/* GEANT_PARENT_ELEMENT */
typedef struct S213 T213;

/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_TARGET, STRING_8] */
typedef struct S215 T215;

/* ARRAY [GEANT_TARGET] */
typedef struct S216 T216;

/* XM_EIFFEL_CHARACTER_ENTITY */
typedef struct S217 T217;

/* YY_BUFFER */
typedef struct S218 T218;

/* YY_FILE_BUFFER */
typedef struct S219 T219;

/* DS_LINKED_STACK [INTEGER_32] */
typedef struct S222 T222;

/* DS_BILINKABLE [XM_POSITION] */
typedef struct S223 T223;

/* DS_BILINKED_LIST_CURSOR [XM_POSITION] */
typedef struct S224 T224;

/* DS_LINKABLE [XM_EIFFEL_SCANNER] */
typedef struct S225 T225;

/* SPECIAL [XM_EIFFEL_ENTITY_DEF] */
typedef struct S226 T226;

/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S227 T227;

/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S229 T229;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
typedef struct S231 T231;

/* ARRAY [ANY] */
typedef struct S232 T232;

/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
typedef struct S233 T233;

/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
typedef struct S234 T234;

/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
typedef struct S235 T235;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S236 T236;

/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S237 T237;

/* DS_LINKED_LIST [STRING_8] */
typedef struct S238 T238;

/* DS_BILINKED_LIST_CURSOR [STRING_8] */
typedef struct S239 T239;

/* DS_BILINKABLE [STRING_8] */
typedef struct S240 T240;

/* ARRAY [XM_EIFFEL_PARSER_NAME] */
typedef struct S241 T241;

/* ARRAY [XM_EIFFEL_DECLARATION] */
typedef struct S242 T242;

/* ARRAY [XM_DTD_EXTERNAL_ID] */
typedef struct S243 T243;

/* ARRAY [BOOLEAN] */
typedef struct S244 T244;

/* ARRAY [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S245 T245;

/* ARRAY [XM_DTD_ELEMENT_CONTENT] */
typedef struct S246 T246;

/* ARRAY [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S247 T247;

/* ARRAY [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S248 T248;

/* ARRAY [DS_BILINKED_LIST [STRING_8]] */
typedef struct S249 T249;

/* XM_NAMESPACE_RESOLVER_CONTEXT */
typedef struct S250 T250;

/* DS_LINKED_QUEUE [STRING_8] */
typedef struct S252 T252;

/* ARRAY [GEANT_ARGUMENT_VARIABLES] */
typedef struct S253 T253;

/* ARRAY [GEANT_VARIABLES] */
typedef struct S254 T254;

/* SPECIAL [NATURAL_8] */
typedef struct S255 T255;

/* GEANT_STRING_INTERPRETER */
typedef struct S256 T256;

/* KL_ARRAY_ROUTINES [INTEGER_32] */
typedef struct S259 T259;

/* MANAGED_POINTER */
typedef struct S261 T261;

/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
typedef struct S262 T262;

/* GEANT_GEC_TASK */
typedef struct S263 T263;

/* [attached] TUPLE [XM_ELEMENT] */
typedef struct S264 T264;

/* detachable TUPLE */
typedef struct S265 T265;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEC_TASK] */
typedef struct S266 T266;

/* [attached] TUPLE [GEANT_TASK_FACTORY] */
typedef struct S267 T267;

/* GEANT_ISE_TASK */
typedef struct S270 T270;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_ISE_TASK] */
typedef struct S271 T271;

/* GEANT_EXEC_TASK */
typedef struct S272 T272;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_EXEC_TASK] */
typedef struct S273 T273;

/* GEANT_LCC_TASK */
typedef struct S274 T274;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_LCC_TASK] */
typedef struct S275 T275;

/* GEANT_SET_TASK */
typedef struct S276 T276;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_SET_TASK] */
typedef struct S277 T277;

/* GEANT_UNSET_TASK */
typedef struct S278 T278;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_UNSET_TASK] */
typedef struct S279 T279;

/* GEANT_GEXACE_TASK */
typedef struct S280 T280;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEXACE_TASK] */
typedef struct S281 T281;

/* GEANT_GELEX_TASK */
typedef struct S282 T282;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GELEX_TASK] */
typedef struct S283 T283;

/* GEANT_GEYACC_TASK */
typedef struct S284 T284;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEYACC_TASK] */
typedef struct S285 T285;

/* GEANT_GEPP_TASK */
typedef struct S286 T286;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEPP_TASK] */
typedef struct S287 T287;

/* GEANT_GETEST_TASK */
typedef struct S288 T288;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GETEST_TASK] */
typedef struct S289 T289;

/* GEANT_GEANT_TASK */
typedef struct S290 T290;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEANT_TASK] */
typedef struct S291 T291;

/* GEANT_ECHO_TASK */
typedef struct S292 T292;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_ECHO_TASK] */
typedef struct S293 T293;

/* GEANT_MKDIR_TASK */
typedef struct S294 T294;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_MKDIR_TASK] */
typedef struct S295 T295;

/* GEANT_DELETE_TASK */
typedef struct S296 T296;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_DELETE_TASK] */
typedef struct S297 T297;

/* GEANT_COPY_TASK */
typedef struct S298 T298;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_COPY_TASK] */
typedef struct S299 T299;

/* GEANT_MOVE_TASK */
typedef struct S300 T300;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_MOVE_TASK] */
typedef struct S301 T301;

/* GEANT_SETENV_TASK */
typedef struct S302 T302;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_SETENV_TASK] */
typedef struct S303 T303;

/* GEANT_XSLT_TASK */
typedef struct S304 T304;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_XSLT_TASK] */
typedef struct S305 T305;

/* GEANT_OUTOFDATE_TASK */
typedef struct S306 T306;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_OUTOFDATE_TASK] */
typedef struct S307 T307;

/* GEANT_EXIT_TASK */
typedef struct S308 T308;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_EXIT_TASK] */
typedef struct S309 T309;

/* GEANT_PRECURSOR_TASK */
typedef struct S310 T310;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_PRECURSOR_TASK] */
typedef struct S311 T311;

/* GEANT_AVAILABLE_TASK */
typedef struct S312 T312;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_AVAILABLE_TASK] */
typedef struct S313 T313;

/* GEANT_INPUT_TASK */
typedef struct S314 T314;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_INPUT_TASK] */
typedef struct S315 T315;

/* GEANT_REPLACE_TASK */
typedef struct S316 T316;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_REPLACE_TASK] */
typedef struct S317 T317;

/* KL_SPECIAL_ROUTINES [GEANT_PARENT] */
typedef struct S318 T318;

/* SPECIAL [GEANT_PARENT] */
typedef struct S319 T319;

/* UC_UNICODE_ROUTINES */
typedef struct S321 T321;

/* DS_LINKED_QUEUE [CHARACTER_8] */
typedef struct S324 T324;

/* UC_UTF16_ROUTINES */
typedef struct S325 T325;

/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S326 T326;

/* SPECIAL [NATURAL_64] */
typedef struct S327 T327;

/* GEANT_RENAME_ELEMENT */
typedef struct S328 T328;

/* GEANT_REDEFINE_ELEMENT */
typedef struct S329 T329;

/* GEANT_SELECT_ELEMENT */
typedef struct S330 T330;

/* GEANT_RENAME */
typedef struct S331 T331;

/* DS_HASH_TABLE [GEANT_RENAME, STRING_8] */
typedef struct S332 T332;

/* GEANT_REDEFINE */
typedef struct S333 T333;

/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8] */
typedef struct S334 T334;

/* GEANT_SELECT */
typedef struct S335 T335;

/* DS_HASH_TABLE [GEANT_SELECT, STRING_8] */
typedef struct S336 T336;

/* DS_LINKABLE [INTEGER_32] */
typedef struct S338 T338;

/* DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S339 T339;

/* ARRAY [XM_EIFFEL_ENTITY_DEF] */
typedef struct S340 T340;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
typedef struct S341 T341;

/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
typedef struct S342 T342;

/* DS_LINKED_LIST_CURSOR [STRING_8] */
typedef struct S343 T343;

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S345 T345;

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S346 T346;

/* DS_LINKABLE [STRING_8] */
typedef struct S347 T347;

/* GEANT_NAME_VALUE_ELEMENT */
typedef struct S348 T348;

/* KL_ARRAY_ROUTINES [detachable STRING_8] */
typedef struct S349 T349;

/* AP_OPTION_COMPARATOR */
typedef struct S350 T350;

/* DS_QUICK_SORTER [AP_OPTION] */
typedef struct S351 T351;

/* ST_WORD_WRAPPER */
typedef struct S353 T353;

/* DS_HASH_SET [XM_NAMESPACE] */
typedef struct S355 T355;

/* XM_COMMENT */
typedef struct S356 T356;

/* XM_PROCESSING_INSTRUCTION */
typedef struct S357 T357;

/* XM_CHARACTER_DATA */
typedef struct S358 T358;

/* XM_NAMESPACE */
typedef struct S359 T359;

/* DS_LINKABLE [XM_NODE] */
typedef struct S362 T362;

/* XM_NODE_TYPER */
typedef struct S364 T364;

/* KL_CHARACTER_BUFFER */
typedef struct S368 T368;

/* TYPED_POINTER [NATURAL_8] */
typedef struct S369 T369;

/* EXCEPTIONS */
typedef struct S370 T370;

/* DS_SPARSE_TABLE_KEYS [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
typedef struct S372 T372;

/* SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
typedef struct S374 T374;

/* DS_HASH_TABLE_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
typedef struct S375 T375;

/* KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
typedef struct S376 T376;

/* GEANT_GEC_COMMAND */
typedef struct S377 T377;

/* DS_CELL [PROCEDURE [ANY, TUPLE]] */
typedef struct S378 T378;

/* [attached] PROCEDURE [GEANT_GEC_TASK, [attached] TUPLE] */
typedef struct S379 T379;

/* [attached] TUPLE [GEANT_GEC_TASK] */
typedef struct S380 T380;

/* GEANT_ISE_COMMAND */
typedef struct S381 T381;

/* [attached] PROCEDURE [GEANT_ISE_TASK, [attached] TUPLE] */
typedef struct S382 T382;

/* [attached] TUPLE [GEANT_ISE_TASK] */
typedef struct S383 T383;

/* GEANT_FILESET_ELEMENT */
typedef struct S384 T384;

/* GEANT_EXEC_COMMAND */
typedef struct S385 T385;

/* GEANT_STRING_PROPERTY */
typedef struct S386 T386;

/* [attached] FUNCTION [GEANT_INTERPRETING_ELEMENT, [attached] TUPLE, STRING_8] */
typedef struct S387 T387;

/* [attached] TUPLE [GEANT_INTERPRETING_ELEMENT, STRING_8] */
typedef struct S388 T388;

/* GEANT_BOOLEAN_PROPERTY */
typedef struct S389 T389;

/* GEANT_FILESET */
typedef struct S390 T390;

/* [attached] PROCEDURE [GEANT_EXEC_TASK, [attached] TUPLE] */
typedef struct S391 T391;

/* [attached] TUPLE [GEANT_EXEC_TASK] */
typedef struct S392 T392;

/* GEANT_LCC_COMMAND */
typedef struct S393 T393;

/* [attached] PROCEDURE [GEANT_LCC_TASK, [attached] TUPLE] */
typedef struct S394 T394;

/* [attached] TUPLE [GEANT_LCC_TASK] */
typedef struct S395 T395;

/* GEANT_SET_COMMAND */
typedef struct S396 T396;

/* [attached] PROCEDURE [GEANT_SET_TASK, [attached] TUPLE] */
typedef struct S397 T397;

/* [attached] TUPLE [GEANT_SET_TASK] */
typedef struct S398 T398;

/* GEANT_UNSET_COMMAND */
typedef struct S399 T399;

/* [attached] PROCEDURE [GEANT_UNSET_TASK, [attached] TUPLE] */
typedef struct S400 T400;

/* [attached] TUPLE [GEANT_UNSET_TASK] */
typedef struct S401 T401;

/* GEANT_DEFINE_ELEMENT */
typedef struct S402 T402;

/* GEANT_GEXACE_COMMAND */
typedef struct S403 T403;

/* [attached] PROCEDURE [GEANT_GEXACE_TASK, [attached] TUPLE] */
typedef struct S404 T404;

/* [attached] TUPLE [GEANT_GEXACE_TASK] */
typedef struct S405 T405;

/* GEANT_GELEX_COMMAND */
typedef struct S406 T406;

/* [attached] PROCEDURE [GEANT_GELEX_TASK, [attached] TUPLE] */
typedef struct S407 T407;

/* [attached] TUPLE [GEANT_GELEX_TASK] */
typedef struct S408 T408;

/* GEANT_GEYACC_COMMAND */
typedef struct S409 T409;

/* [attached] PROCEDURE [GEANT_GEYACC_TASK, [attached] TUPLE] */
typedef struct S410 T410;

/* [attached] TUPLE [GEANT_GEYACC_TASK] */
typedef struct S411 T411;

/* GEANT_GEPP_COMMAND */
typedef struct S412 T412;

/* [attached] PROCEDURE [GEANT_GEPP_TASK, [attached] TUPLE] */
typedef struct S413 T413;

/* [attached] TUPLE [GEANT_GEPP_TASK] */
typedef struct S414 T414;

/* GEANT_GETEST_COMMAND */
typedef struct S415 T415;

/* [attached] PROCEDURE [GEANT_GETEST_TASK, [attached] TUPLE] */
typedef struct S416 T416;

/* [attached] TUPLE [GEANT_GETEST_TASK] */
typedef struct S417 T417;

/* GEANT_GEANT_COMMAND */
typedef struct S418 T418;

/* ST_SPLITTER */
typedef struct S419 T419;

/* [attached] PROCEDURE [GEANT_GEANT_TASK, [attached] TUPLE] */
typedef struct S420 T420;

/* [attached] TUPLE [GEANT_GEANT_TASK] */
typedef struct S421 T421;

/* GEANT_ECHO_COMMAND */
typedef struct S422 T422;

/* [attached] PROCEDURE [GEANT_ECHO_TASK, [attached] TUPLE] */
typedef struct S423 T423;

/* [attached] TUPLE [GEANT_ECHO_TASK] */
typedef struct S424 T424;

/* GEANT_MKDIR_COMMAND */
typedef struct S425 T425;

/* [attached] PROCEDURE [GEANT_MKDIR_TASK, [attached] TUPLE] */
typedef struct S426 T426;

/* [attached] TUPLE [GEANT_MKDIR_TASK] */
typedef struct S427 T427;

/* GEANT_DIRECTORYSET_ELEMENT */
typedef struct S428 T428;

/* GEANT_DELETE_COMMAND */
typedef struct S429 T429;

/* GEANT_DIRECTORYSET */
typedef struct S430 T430;

/* [attached] PROCEDURE [GEANT_DELETE_TASK, [attached] TUPLE] */
typedef struct S431 T431;

/* [attached] TUPLE [GEANT_DELETE_TASK] */
typedef struct S432 T432;

/* GEANT_COPY_COMMAND */
typedef struct S433 T433;

/* [attached] PROCEDURE [GEANT_COPY_TASK, [attached] TUPLE] */
typedef struct S434 T434;

/* [attached] TUPLE [GEANT_COPY_TASK] */
typedef struct S435 T435;

/* GEANT_MOVE_COMMAND */
typedef struct S436 T436;

/* [attached] PROCEDURE [GEANT_MOVE_TASK, [attached] TUPLE] */
typedef struct S437 T437;

/* [attached] TUPLE [GEANT_MOVE_TASK] */
typedef struct S438 T438;

/* GEANT_SETENV_COMMAND */
typedef struct S439 T439;

/* [attached] PROCEDURE [GEANT_SETENV_TASK, [attached] TUPLE] */
typedef struct S440 T440;

/* [attached] TUPLE [GEANT_SETENV_TASK] */
typedef struct S441 T441;

/* DS_PAIR [STRING_8, STRING_8] */
typedef struct S442 T442;

/* GEANT_XSLT_COMMAND */
typedef struct S443 T443;

/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S444 T444;

/* [attached] PROCEDURE [GEANT_XSLT_TASK, [attached] TUPLE] */
typedef struct S445 T445;

/* [attached] TUPLE [GEANT_XSLT_TASK] */
typedef struct S446 T446;

/* GEANT_OUTOFDATE_COMMAND */
typedef struct S447 T447;

/* [attached] PROCEDURE [GEANT_OUTOFDATE_TASK, [attached] TUPLE] */
typedef struct S448 T448;

/* [attached] TUPLE [GEANT_OUTOFDATE_TASK] */
typedef struct S449 T449;

/* GEANT_EXIT_COMMAND */
typedef struct S450 T450;

/* [attached] PROCEDURE [GEANT_EXIT_TASK, [attached] TUPLE] */
typedef struct S451 T451;

/* [attached] TUPLE [GEANT_EXIT_TASK] */
typedef struct S452 T452;

/* GEANT_PRECURSOR_COMMAND */
typedef struct S453 T453;

/* [attached] PROCEDURE [GEANT_PRECURSOR_TASK, [attached] TUPLE] */
typedef struct S454 T454;

/* [attached] TUPLE [GEANT_PRECURSOR_TASK] */
typedef struct S455 T455;

/* GEANT_AVAILABLE_COMMAND */
typedef struct S456 T456;

/* [attached] PROCEDURE [GEANT_AVAILABLE_TASK, [attached] TUPLE] */
typedef struct S457 T457;

/* [attached] TUPLE [GEANT_AVAILABLE_TASK] */
typedef struct S458 T458;

/* GEANT_INPUT_COMMAND */
typedef struct S459 T459;

/* [attached] PROCEDURE [GEANT_INPUT_TASK, [attached] TUPLE] */
typedef struct S460 T460;

/* [attached] TUPLE [GEANT_INPUT_TASK] */
typedef struct S461 T461;

/* GEANT_REPLACE_COMMAND */
typedef struct S462 T462;

/* [attached] PROCEDURE [GEANT_REPLACE_TASK, [attached] TUPLE] */
typedef struct S463 T463;

/* [attached] TUPLE [GEANT_REPLACE_TASK] */
typedef struct S464 T464;

/* ARRAY [GEANT_PARENT] */
typedef struct S465 T465;

/* SPECIAL [ARRAY [INTEGER_32]] */
typedef struct S466 T466;

/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
typedef struct S467 T467;

/* DS_LINKABLE [CHARACTER_8] */
typedef struct S468 T468;

/* KL_EQUALITY_TESTER [GEANT_RENAME] */
typedef struct S469 T469;

/* DS_SPARSE_TABLE_KEYS [GEANT_RENAME, STRING_8] */
typedef struct S470 T470;

/* SPECIAL [GEANT_RENAME] */
typedef struct S472 T472;

/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8] */
typedef struct S473 T473;

/* KL_SPECIAL_ROUTINES [GEANT_RENAME] */
typedef struct S474 T474;

/* KL_EQUALITY_TESTER [GEANT_REDEFINE] */
typedef struct S475 T475;

/* DS_SPARSE_TABLE_KEYS [GEANT_REDEFINE, STRING_8] */
typedef struct S476 T476;

/* SPECIAL [GEANT_REDEFINE] */
typedef struct S478 T478;

/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8] */
typedef struct S479 T479;

/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE] */
typedef struct S480 T480;

/* KL_EQUALITY_TESTER [GEANT_SELECT] */
typedef struct S481 T481;

/* DS_SPARSE_TABLE_KEYS [GEANT_SELECT, STRING_8] */
typedef struct S482 T482;

/* SPECIAL [GEANT_SELECT] */
typedef struct S484 T484;

/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8] */
typedef struct S485 T485;

/* KL_SPECIAL_ROUTINES [GEANT_SELECT] */
typedef struct S486 T486;

/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S488 T488;

/* KL_DIRECTORY */
typedef struct S489 T489;

/* KL_STRING_INPUT_STREAM */
typedef struct S490 T490;

/* KL_ARRAY [detachable STRING_8] */
typedef struct S491 T491;

/* SPECIAL [XM_NAMESPACE] */
typedef struct S492 T492;

/* KL_EQUALITY_TESTER [XM_NAMESPACE] */
typedef struct S493 T493;

/* DS_HASH_SET_CURSOR [XM_NAMESPACE] */
typedef struct S494 T494;

/* KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
typedef struct S495 T495;

/* DS_SPARSE_TABLE_KEYS_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
typedef struct S496 T496;

/* ARRAY [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
typedef struct S497 T497;

/* GEANT_MAP_ELEMENT */
typedef struct S500 T500;

/* GEANT_MAP */
typedef struct S501 T501;

/* DS_HASH_SET [GEANT_FILESET_ENTRY] */
typedef struct S504 T504;

/* DS_HASH_SET [STRING_8] */
typedef struct S506 T506;

/* LX_DFA_WILDCARD */
typedef struct S508 T508;

/* DS_HASH_SET [INTEGER_32] */
typedef struct S510 T510;

/* DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8]]] */
typedef struct S511 T511;

/* [attached] TUPLE [STRING_8] */
typedef struct S512 T512;

/* [attached] PROCEDURE [GEANT_ECHO_COMMAND, [attached] TUPLE [STRING_8]] */
typedef struct S513 T513;

/* [attached] TUPLE [GEANT_ECHO_COMMAND] */
typedef struct S514 T514;

/* DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]]] */
typedef struct S516 T516;

/* KL_TEXT_OUTPUT_FILE */
typedef struct S517 T517;

/* [attached] TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN] */
typedef struct S518 T518;

/* [attached] PROCEDURE [GEANT_ECHO_COMMAND, [attached] TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]] */
typedef struct S519 T519;

/* [attached] PROCEDURE [GEANT_MKDIR_COMMAND, [attached] TUPLE [STRING_8]] */
typedef struct S521 T521;

/* [attached] TUPLE [GEANT_MKDIR_COMMAND] */
typedef struct S522 T522;

/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S523 T523;

/* SPECIAL [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S524 T524;

/* DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S525 T525;

/* DS_CELL [FUNCTION [ANY, TUPLE [STRING_8], BOOLEAN]] */
typedef struct S526 T526;

/* [attached] PREDICATE [GEANT_AVAILABLE_COMMAND, [attached] TUPLE [STRING_8]] */
typedef struct S527 T527;

/* [attached] TUPLE [GEANT_AVAILABLE_COMMAND] */
typedef struct S528 T528;

/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_RENAME, STRING_8] */
typedef struct S530 T530;

/* ARRAY [GEANT_RENAME] */
typedef struct S531 T531;

/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_REDEFINE, STRING_8] */
typedef struct S532 T532;

/* ARRAY [GEANT_REDEFINE] */
typedef struct S533 T533;

/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_SELECT, STRING_8] */
typedef struct S534 T534;

/* ARRAY [GEANT_SELECT] */
typedef struct S535 T535;

/* ARRAY [XM_NAMESPACE] */
typedef struct S540 T540;

/* KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY] */
typedef struct S542 T542;

/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY] */
typedef struct S543 T543;

/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY] */
typedef struct S544 T544;

/* GEANT_FILESET_ENTRY */
typedef struct S545 T545;

/* SPECIAL [GEANT_FILESET_ENTRY] */
typedef struct S546 T546;

/* DS_HASH_SET_CURSOR [STRING_8] */
typedef struct S547 T547;

/* LX_WILDCARD_PARSER */
typedef struct S548 T548;

/* LX_DESCRIPTION */
typedef struct S549 T549;

/* LX_FULL_DFA */
typedef struct S550 T550;

/* DS_HASH_SET_CURSOR [INTEGER_32] */
typedef struct S552 T552;

/* KL_EQUALITY_TESTER [INTEGER_32] */
typedef struct S553 T553;

/* ARRAY [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S554 T554;

/* KL_NULL_TEXT_OUTPUT_STREAM */
typedef struct S558 T558;

/* DP_SHELL_COMMAND */
typedef struct S560 T560;

/* DS_CELL [BOOLEAN] */
typedef struct S561 T561;

/* KL_BOOLEAN_ROUTINES */
typedef struct S563 T563;

/* GEANT_VARIABLES_VARIABLE_RESOLVER */
typedef struct S564 T564;

/* RX_PCRE_REGULAR_EXPRESSION */
typedef struct S565 T565;

/* KL_STRING_EQUALITY_TESTER */
typedef struct S566 T566;

/* KL_STDIN_FILE */
typedef struct S567 T567;

/* ARRAY [GEANT_FILESET_ENTRY] */
typedef struct S570 T570;

/* DS_ARRAYED_LIST [LX_RULE] */
typedef struct S571 T571;

/* LX_START_CONDITIONS */
typedef struct S572 T572;

/* LX_ACTION_FACTORY */
typedef struct S573 T573;

/* DS_ARRAYED_STACK [INTEGER_32] */
typedef struct S574 T574;

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8] */
typedef struct S575 T575;

/* LX_SYMBOL_CLASS */
typedef struct S576 T576;

/* SPECIAL [LX_SYMBOL_CLASS] */
typedef struct S577 T577;

/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS] */
typedef struct S578 T578;

/* LX_NFA */
typedef struct S579 T579;

/* LX_EQUIVALENCE_CLASSES */
typedef struct S580 T580;

/* LX_RULE */
typedef struct S581 T581;

/* SPECIAL [LX_NFA] */
typedef struct S582 T582;

/* KL_SPECIAL_ROUTINES [LX_NFA] */
typedef struct S583 T583;

/* UT_SYNTAX_ERROR */
typedef struct S584 T584;

/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
typedef struct S585 T585;

/* LX_UNRECOGNIZED_RULE_ERROR */
typedef struct S586 T586;

/* LX_MISSING_QUOTE_ERROR */
typedef struct S587 T587;

/* LX_BAD_CHARACTER_CLASS_ERROR */
typedef struct S588 T588;

/* LX_BAD_CHARACTER_ERROR */
typedef struct S589 T589;

/* LX_FULL_AND_META_ERROR */
typedef struct S590 T590;

/* LX_FULL_AND_REJECT_ERROR */
typedef struct S591 T591;

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR */
typedef struct S592 T592;

/* LX_CHARACTER_OUT_OF_RANGE_ERROR */
typedef struct S593 T593;

/* SPECIAL [LX_RULE] */
typedef struct S594 T594;

/* ARRAY [LX_RULE] */
typedef struct S595 T595;

/* LX_DFA_STATE */
typedef struct S596 T596;

/* DS_ARRAYED_LIST [LX_NFA_STATE] */
typedef struct S597 T597;

/* DS_ARRAYED_LIST [LX_DFA_STATE] */
typedef struct S598 T598;

/* LX_SYMBOL_PARTITIONS */
typedef struct S599 T599;

/* KL_ARRAY_ROUTINES [LX_RULE] */
typedef struct S600 T600;

/* LX_START_CONDITION */
typedef struct S601 T601;

/* LX_TRANSITION_TABLE [LX_DFA_STATE] */
typedef struct S602 T602;

/* DS_ARRAYED_LIST [LX_NFA] */
typedef struct S603 T603;

/* DS_HASH_TABLE [LX_NFA, INTEGER_32] */
typedef struct S604 T604;

/* LX_NFA_STATE */
typedef struct S605 T605;

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR */
typedef struct S607 T607;

/* RX_BYTE_CODE */
typedef struct S609 T609;

/* RX_CHARACTER_SET */
typedef struct S610 T610;

/* RX_CASE_MAPPING */
typedef struct S611 T611;

/* SPECIAL [RX_CHARACTER_SET] */
typedef struct S613 T613;

/* ARRAY [RX_CHARACTER_SET] */
typedef struct S614 T614;

/* KL_SPECIAL_ROUTINES [LX_RULE] */
typedef struct S615 T615;

/* DS_ARRAYED_LIST_CURSOR [LX_RULE] */
typedef struct S616 T616;

/* SPECIAL [LX_START_CONDITION] */
typedef struct S617 T617;

/* KL_SPECIAL_ROUTINES [LX_START_CONDITION] */
typedef struct S618 T618;

/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION] */
typedef struct S619 T619;

/* DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING_8] */
typedef struct S621 T621;

/* DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
typedef struct S623 T623;

/* ARRAY [LX_SYMBOL_CLASS] */
typedef struct S624 T624;

/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE] */
typedef struct S625 T625;

/* LX_EPSILON_TRANSITION [LX_NFA_STATE] */
typedef struct S627 T627;

/* LX_SYMBOL_TRANSITION [LX_NFA_STATE] */
typedef struct S629 T629;

/* DS_BILINKABLE [INTEGER_32] */
typedef struct S630 T630;

/* SPECIAL [DS_BILINKABLE [INTEGER_32]] */
typedef struct S631 T631;

/* ARRAY [DS_BILINKABLE [INTEGER_32]] */
typedef struct S632 T632;

/* LX_ACTION */
typedef struct S634 T634;

/* ARRAY [LX_NFA] */
typedef struct S635 T635;

/* DS_BUBBLE_SORTER [LX_NFA_STATE] */
typedef struct S636 T636;

/* DS_BUBBLE_SORTER [LX_RULE] */
typedef struct S638 T638;

/* SPECIAL [LX_NFA_STATE] */
typedef struct S640 T640;

/* KL_SPECIAL_ROUTINES [LX_NFA_STATE] */
typedef struct S642 T642;

/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE] */
typedef struct S643 T643;

/* SPECIAL [LX_DFA_STATE] */
typedef struct S645 T645;

/* KL_SPECIAL_ROUTINES [LX_DFA_STATE] */
typedef struct S646 T646;

/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE] */
typedef struct S647 T647;

/* KL_ARRAY [LX_RULE] */
typedef struct S648 T648;

/* ARRAY [LX_DFA_STATE] */
typedef struct S649 T649;

/* KL_ARRAY_ROUTINES [LX_DFA_STATE] */
typedef struct S650 T650;

/* DS_ARRAYED_LIST_CURSOR [LX_NFA] */
typedef struct S651 T651;

/* DS_SPARSE_TABLE_KEYS [LX_NFA, INTEGER_32] */
typedef struct S653 T653;

/* DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32] */
typedef struct S655 T655;

/* KL_BINARY_INPUT_FILE */
typedef struct S656 T656;

/* KL_BINARY_OUTPUT_FILE */
typedef struct S657 T657;

/* FILE_NAME */
typedef struct S659 T659;

/* RAW_FILE */
typedef struct S660 T660;

/* DIRECTORY */
typedef struct S661 T661;

/* ARRAYED_LIST [STRING_8] */
typedef struct S662 T662;

/* KL_COMPARABLE_COMPARATOR [LX_RULE] */
typedef struct S665 T665;

/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE] */
typedef struct S668 T668;

/* ARRAY [LX_START_CONDITION] */
typedef struct S671 T671;

/* DS_SPARSE_TABLE_KEYS_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
typedef struct S672 T672;

/* ARRAY [LX_NFA_STATE] */
typedef struct S673 T673;

/* DS_SPARSE_TABLE_KEYS_CURSOR [LX_NFA, INTEGER_32] */
typedef struct S674 T674;

/* STRING_SEARCHER */
typedef struct S675 T675;

/* HASH_TABLE [C_STRING, STRING_8] */
typedef struct S676 T676;

/* DS_SHELL_SORTER [INTEGER_32] */
typedef struct S677 T677;

/* TYPED_POINTER [FILE_NAME] */
typedef struct S679 T679;

/* KL_COMPARABLE_COMPARATOR [INTEGER_32] */
typedef struct S682 T682;

/* PRIMES */
typedef struct S685 T685;

/* SPECIAL [C_STRING] */
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

/* Struct for type TYPED_POINTER [ANY] */
struct S77 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type TYPED_POINTER [SPECIAL [CHARACTER_8]] */
struct S130 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type TYPED_POINTER [NATURAL_8] */
struct S369 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type TYPED_POINTER [FILE_NAME] */
struct S679 {
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
	T0* a13; /* item_storage */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* key_storage */
	T0* a17; /* special_item_routines */
	T0* a18; /* special_key_routines */
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
	T0* a12; /* item_storage */
	T0* a13; /* clashes */
	T0* a14; /* slots */
	T0* a15; /* key_storage */
	T0* a16; /* equality_tester */
	T0* a17; /* special_item_routines */
	T0* a18; /* special_key_routines */
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

/* Struct for type SPECIAL [STRING_8] */
struct S32 {
	int id;
	T6 a1; /* count */
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
	T0* a12; /* item_storage */
	T0* a13; /* clashes */
	T0* a14; /* slots */
	T0* a15; /* key_storage */
	T0* a16; /* equality_tester */
	T0* a17; /* special_item_routines */
	T0* a18; /* special_key_routines */
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
	T0* a2; /* name */
	T6 a3; /* mode */
	T0* a4; /* last_string */
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
	T0* a1; /* string_name */
	T6 a2; /* mode */
	T0* a3; /* last_string */
	T0* a4; /* name */
	T0* a5; /* character_buffer */
	T1 a6; /* end_of_file */
	T14 a7; /* file_pointer */
	T1 a8; /* descriptor_available */
	T2 a9; /* last_character */
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

/* Struct for type DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8] */
struct S61 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type SPECIAL [INTEGER_32] */
struct S63 {
	int id;
	T6 a1; /* count */
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

/* Struct for type KL_SPECIAL_ROUTINES [STRING_8] */
struct S66 {
	int id;
};

/* Struct for type KL_STDOUT_FILE */
struct S68 {
	int id;
	T14 a1; /* file_pointer */
	T0* a2; /* name */
	T6 a3; /* mode */
	T0* a4; /* last_string */
};

/* Struct for type DS_LINKED_LIST_CURSOR [AP_OPTION] */
struct S69 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_ARRAYED_LIST [detachable STRING_8] */
struct S71 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* internal_cursor */
	T0* a4; /* special_routines */
	T6 a5; /* capacity */
	T0* a6; /* equality_tester */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [detachable STRING_8] */
struct S72 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type AP_DISPLAY_HELP_FLAG */
struct S73 {
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
struct S74 {
	int id;
	T0* a1; /* internal_cursor */
	T6 a2; /* count */
	T0* a3; /* equality_tester */
	T0* a4; /* storage */
	T0* a5; /* special_routines */
	T6 a6; /* capacity */
};

/* Struct for type DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S75 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T6 a5; /* count */
};

/* Struct for type KL_STRING_ROUTINES */
struct S76 {
	int id;
};

/* Struct for type DS_HASH_TABLE [STRING_8, STRING_8] */
struct S81 {
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

/* Struct for type EXECUTION_ENVIRONMENT */
struct S83 {
	int id;
	T6 a1; /* return_code */
};

/* Struct for type KL_ANY_ROUTINES */
struct S84 {
	int id;
};

/* Struct for type KL_PATHNAME */
struct S86 {
	int id;
	T6 a1; /* count */
	T0* a2; /* drive */
	T0* a3; /* hostname */
	T0* a4; /* sharename */
	T1 a5; /* is_relative */
	T0* a6; /* components */
};

/* Struct for type UNIX_FILE_INFO */
struct S87 {
	int id;
	T0* a1; /* buffered_file_info */
	T0* a2; /* file_name */
};

/* Struct for type detachable KL_LINKABLE [CHARACTER_8] */
struct S89 {
	int id;
	T2 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type XM_EXPAT_PARSER_FACTORY */
struct S91 {
	int id;
};

/* Struct for type XM_EIFFEL_PARSER */
struct S93 {
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
	T0* a64; /* yyspecial_routines5 */
	T6 a65; /* yyvsc10 */
	T0* a66; /* yyspecial_routines10 */
	T6 a67; /* yyvsc3 */
	T0* a68; /* yyvs3 */
	T0* a69; /* yyspecial_routines3 */
	T0* a70; /* yyvs6 */
	T6 a71; /* yyvsc6 */
	T0* a72; /* yyspecial_routines6 */
	T0* a73; /* yyvs8 */
	T0* a74; /* yyvs7 */
	T6 a75; /* yyvsc8 */
	T0* a76; /* yyspecial_routines8 */
	T0* a77; /* yyspecial_routines7 */
	T6 a78; /* yyvsc7 */
	T0* a79; /* yyvs9 */
	T0* a80; /* yyspecial_routines9 */
	T6 a81; /* yyvsc9 */
	T6 a82; /* yyvsc5 */
	T0* a83; /* dtd_callbacks */
};

/* Struct for type XM_TREE_CALLBACKS_PIPE */
struct S94 {
	int id;
	T0* a1; /* start */
	T0* a2; /* tree */
	T0* a3; /* error */
	T0* a4; /* last */
};

/* Struct for type XM_CALLBACKS_TO_TREE_FILTER */
struct S97 {
	int id;
	T0* a1; /* last_position_table */
	T0* a2; /* document */
	T0* a3; /* next */
	T0* a4; /* source_parser */
	T0* a5; /* current_element */
	T0* a6; /* namespace_cache */
};

/* Struct for type XM_DOCUMENT */
struct S98 {
	int id;
	T0* a1; /* root_element */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
	T0* a5; /* internal_cursor */
	T0* a6; /* parent */
};

/* Struct for type XM_ELEMENT */
struct S99 {
	int id;
	T0* a1; /* parent */
	T0* a2; /* name */
	T0* a3; /* namespace */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T6 a6; /* count */
	T0* a7; /* internal_cursor */
};

/* Struct for type XM_STOP_ON_ERROR_FILTER */
struct S100 {
	int id;
	T1 a1; /* has_error */
	T0* a2; /* last_error */
	T0* a3; /* next */
};

/* Struct for type XM_POSITION_TABLE */
struct S101 {
	int id;
	T0* a1; /* table */
};

/* Struct for type KL_EXECUTION_ENVIRONMENT */
struct S104 {
	int id;
};

/* Struct for type DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES] */
struct S105 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type DS_ARRAYED_STACK [GEANT_VARIABLES] */
struct S106 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8] */
struct S107 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type ARRAY [INTEGER_32] */
struct S108 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [AP_OPTION] */
struct S109 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [AP_OPTION] */
struct S111 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [AP_OPTION] */
struct S112 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S113 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S114 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S115 {
	int id;
};

/* Struct for type UC_STRING */
struct S116 {
	int id;
	T6 a1; /* count */
	T6 a2; /* byte_count */
	T6 a3; /* internal_hash_code */
	T0* a4; /* area */
	T6 a5; /* last_byte_index_input */
	T6 a6; /* last_byte_index_result */
};

/* Struct for type STRING_TO_INTEGER_CONVERTOR */
struct S118 {
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
struct S120 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_LINKED_LIST_CURSOR [XM_ELEMENT] */
struct S121 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type GEANT_INHERIT_ELEMENT */
struct S122 {
	int id;
	T0* a1; /* geant_inherit */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_INHERIT */
struct S123 {
	int id;
	T0* a1; /* parents */
	T0* a2; /* project */
};

/* Struct for type SPECIAL [GEANT_TARGET] */
struct S124 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [GEANT_TARGET, STRING_8] */
struct S126 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8] */
struct S128 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_TARGET] */
struct S129 {
	int id;
};

/* Struct for type XM_EIFFEL_SCANNER */
struct S132 {
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
struct S133 {
	int id;
	T0* a1; /* source_name */
	T6 a2; /* row */
	T6 a3; /* column */
	T6 a4; /* byte_index */
};

/* Struct for type DS_BILINKED_LIST [XM_POSITION] */
struct S135 {
	int id;
	T0* a1; /* first_cell */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
struct S136 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
};

/* Struct for type XM_CALLBACKS_NULL */
struct S137 {
	int id;
};

/* Struct for type DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S138 {
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
struct S140 {
	int id;
};

/* Struct for type SPECIAL [ANY] */
struct S141 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ANY] */
struct S142 {
	int id;
};

/* Struct for type XM_EIFFEL_PARSER_NAME */
struct S143 {
	int id;
	T1 a1; /* use_namespaces */
	T6 a2; /* count */
	T0* a3; /* first */
	T0* a4; /* second */
	T0* a5; /* tail */
};

/* Struct for type XM_EIFFEL_DECLARATION */
struct S144 {
	int id;
	T0* a1; /* version */
	T0* a2; /* encoding */
	T1 a3; /* stand_alone */
};

/* Struct for type XM_DTD_EXTERNAL_ID */
struct S145 {
	int id;
	T0* a1; /* system_id */
	T0* a2; /* public_id */
};

/* Struct for type DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
struct S146 {
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
struct S147 {
	int id;
	T0* a1; /* items */
	T2 a2; /* repetition */
	T0* a3; /* name */
	T2 a4; /* type */
	T1 a5; /* is_character_data_allowed */
};

/* Struct for type DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
struct S148 {
	int id;
	T0* a1; /* first_cell */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* internal_cursor */
};

/* Struct for type XM_DTD_ATTRIBUTE_CONTENT */
struct S149 {
	int id;
	T0* a1; /* name */
	T2 a2; /* type */
	T1 a3; /* is_list_type */
	T0* a4; /* enumeration_list */
	T2 a5; /* value */
	T0* a6; /* default_value */
};

/* Struct for type DS_BILINKED_LIST [STRING_8] */
struct S150 {
	int id;
	T0* a1; /* first_cell */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* equality_tester */
	T0* a5; /* internal_cursor */
};

/* Struct for type SPECIAL [XM_EIFFEL_PARSER_NAME] */
struct S151 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
struct S152 {
	int id;
};

/* Struct for type SPECIAL [XM_EIFFEL_DECLARATION] */
struct S153 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
struct S154 {
	int id;
};

/* Struct for type SPECIAL [BOOLEAN] */
struct S155 {
	int id;
	T6 a1; /* count */
	T1 z2[1]; /* item */
};

/* Struct for type SPECIAL [XM_DTD_EXTERNAL_ID] */
struct S156 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
struct S157 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [BOOLEAN] */
struct S158 {
	int id;
};

/* Struct for type SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S159 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S160 {
	int id;
};

/* Struct for type SPECIAL [XM_DTD_ELEMENT_CONTENT] */
struct S161 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
struct S162 {
	int id;
};

/* Struct for type SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S164 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
struct S166 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S167 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
struct S168 {
	int id;
};

/* Struct for type SPECIAL [DS_BILINKED_LIST [STRING_8]] */
struct S169 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
struct S170 {
	int id;
};

/* Struct for type XM_EIFFEL_ENTITY_DEF */
struct S171 {
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

/* Struct for type XM_DTD_CALLBACKS_NULL */
struct S173 {
	int id;
};

/* Struct for type XM_EIFFEL_SCANNER_DTD */
struct S174 {
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
struct S176 {
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

/* Struct for type XM_NAMESPACE_RESOLVER */
struct S177 {
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
struct S178 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [XM_CALLBACKS_FILTER] */
struct S179 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S180 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type SPECIAL [GEANT_ARGUMENT_VARIABLES] */
struct S181 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES] */
struct S182 {
	int id;
};

/* Struct for type SPECIAL [GEANT_VARIABLES] */
struct S183 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_VARIABLES] */
struct S184 {
	int id;
};

/* Struct for type ARRAY [AP_OPTION] */
struct S186 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S187 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type C_STRING */
struct S188 {
	int id;
	T6 a1; /* count */
	T0* a2; /* managed_data */
};

/* Struct for type DS_ARRAYED_STACK [GEANT_TARGET] */
struct S190 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type GEANT_TASK_FACTORY */
struct S191 {
	int id;
	T0* a1; /* project */
	T0* a2; /* builders */
};

/* Struct for type GEANT_PARENT */
struct S192 {
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
struct S194 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T6 a4; /* count */
	T0* a5; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [GEANT_PARENT] */
struct S195 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type GEANT_INTERPRETING_ELEMENT */
struct S196 {
	int id;
	T0* a1; /* project */
	T0* a2; /* xml_element */
	T0* a3; /* position */
};

/* Struct for type GEANT_ARGUMENT_ELEMENT */
struct S197 {
	int id;
	T0* a1; /* xml_element */
};

/* Struct for type GEANT_LOCAL_ELEMENT */
struct S198 {
	int id;
	T0* a1; /* xml_element */
};

/* Struct for type GEANT_GLOBAL_ELEMENT */
struct S199 {
	int id;
	T0* a1; /* xml_element */
};

/* Struct for type XM_ATTRIBUTE */
struct S200 {
	int id;
	T0* a1; /* name */
	T0* a2; /* namespace */
	T0* a3; /* value */
	T0* a4; /* parent */
};

/* Struct for type GEANT_GROUP */
struct S201 {
	int id;
	T0* a1; /* project */
	T0* a2; /* xml_element */
	T0* a3; /* position */
	T0* a4; /* parent */
	T0* a5; /* description */
};

/* Struct for type DS_LINKED_LIST_CURSOR [XM_NODE] */
struct S203 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type UC_UTF8_ROUTINES */
struct S204 {
	int id;
};

/* Struct for type UC_UTF8_STRING */
struct S205 {
	int id;
	T6 a1; /* count */
	T0* a2; /* area */
	T6 a3; /* byte_count */
	T6 a4; /* internal_hash_code */
	T6 a5; /* last_byte_index_input */
	T6 a6; /* last_byte_index_result */
};

/* Struct for type XM_EIFFEL_INPUT_STREAM */
struct S206 {
	int id;
	T0* a1; /* last_string */
	T6 a2; /* encoding */
	T0* a3; /* impl */
	T0* a4; /* utf_queue */
};

/* Struct for type KL_INTEGER_ROUTINES */
struct S207 {
	int id;
};

/* Struct for type KL_PLATFORM */
struct S208 {
	int id;
};

/* Struct for type DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S209 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_PAIR [XM_POSITION, XM_NODE] */
struct S210 {
	int id;
	T0* a1; /* first */
	T0* a2; /* second */
};

/* Struct for type INTEGER_OVERFLOW_CHECKER */
struct S211 {
	int id;
	T0* a1; /* integer_overflow_state1 */
	T0* a2; /* integer_overflow_state2 */
	T0* a3; /* natural_overflow_state1 */
	T0* a4; /* natural_overflow_state2 */
};

/* Struct for type DS_LINKABLE [XM_ELEMENT] */
struct S212 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type GEANT_PARENT_ELEMENT */
struct S213 {
	int id;
	T0* a1; /* parent */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_TARGET, STRING_8] */
struct S215 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type ARRAY [GEANT_TARGET] */
struct S216 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type XM_EIFFEL_CHARACTER_ENTITY */
struct S217 {
	int id;
	T6 a1; /* code */
};

/* Struct for type YY_BUFFER */
struct S218 {
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
struct S219 {
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
struct S222 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
};

/* Struct for type DS_BILINKABLE [XM_POSITION] */
struct S223 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_POSITION] */
struct S224 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type DS_LINKABLE [XM_EIFFEL_SCANNER] */
struct S225 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type SPECIAL [XM_EIFFEL_ENTITY_DEF] */
struct S226 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S227 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S229 {
	int id;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T6 a3; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
struct S231 {
	int id;
};

/* Struct for type ARRAY [ANY] */
struct S232 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
struct S233 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
struct S234 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
struct S235 {
	int id;
	T0* a1; /* first_cell */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
struct S236 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
struct S237 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_LINKED_LIST [STRING_8] */
struct S238 {
	int id;
	T0* a1; /* internal_cursor */
	T6 a2; /* count */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
	T0* a5; /* equality_tester */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [STRING_8] */
struct S239 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_BILINKABLE [STRING_8] */
struct S240 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type ARRAY [XM_EIFFEL_PARSER_NAME] */
struct S241 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [XM_EIFFEL_DECLARATION] */
struct S242 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [XM_DTD_EXTERNAL_ID] */
struct S243 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [BOOLEAN] */
struct S244 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S245 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [XM_DTD_ELEMENT_CONTENT] */
struct S246 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S247 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [XM_DTD_ATTRIBUTE_CONTENT] */
struct S248 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [DS_BILINKED_LIST [STRING_8]] */
struct S249 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type XM_NAMESPACE_RESOLVER_CONTEXT */
struct S250 {
	int id;
	T0* a1; /* context */
};

/* Struct for type DS_LINKED_QUEUE [STRING_8] */
struct S252 {
	int id;
	T0* a1; /* first_cell */
	T6 a2; /* count */
	T0* a3; /* last_cell */
};

/* Struct for type ARRAY [GEANT_ARGUMENT_VARIABLES] */
struct S253 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [GEANT_VARIABLES] */
struct S254 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type SPECIAL [NATURAL_8] */
struct S255 {
	int id;
	T6 a1; /* count */
	T8 z2[1]; /* item */
};

/* Struct for type GEANT_STRING_INTERPRETER */
struct S256 {
	int id;
	T0* a1; /* variable_resolver */
};

/* Struct for type KL_ARRAY_ROUTINES [INTEGER_32] */
struct S259 {
	int id;
};

/* Struct for type MANAGED_POINTER */
struct S261 {
	int id;
	T1 a1; /* is_shared */
	T14 a2; /* item */
	T6 a3; /* count */
};

/* Struct for type DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
struct S262 {
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
	T0* a13; /* item_storage */
	T0* a14; /* key_storage */
	T0* a15; /* special_item_routines */
	T0* a16; /* special_key_routines */
	T0* a17; /* internal_cursor */
	T0* a18; /* hash_function */
	T6 a19; /* slots_position */
	T6 a20; /* clashes_previous_position */
};

/* Struct for type GEANT_GEC_TASK */
struct S263 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] TUPLE [XM_ELEMENT] */
struct S264 {
	int id;
	T0* z1;
};

/* Struct for type detachable TUPLE */
struct S265 {
	int id;
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEC_TASK] */
struct S266 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type [attached] TUPLE [GEANT_TASK_FACTORY] */
struct S267 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_ISE_TASK */
struct S270 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_ISE_TASK] */
struct S271 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_EXEC_TASK */
struct S272 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_EXEC_TASK] */
struct S273 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_LCC_TASK */
struct S274 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_LCC_TASK] */
struct S275 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_SET_TASK */
struct S276 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_SET_TASK] */
struct S277 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_UNSET_TASK */
struct S278 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_UNSET_TASK] */
struct S279 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_GEXACE_TASK */
struct S280 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* position */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEXACE_TASK] */
struct S281 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_GELEX_TASK */
struct S282 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GELEX_TASK] */
struct S283 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_GEYACC_TASK */
struct S284 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEYACC_TASK] */
struct S285 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_GEPP_TASK */
struct S286 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEPP_TASK] */
struct S287 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_GETEST_TASK */
struct S288 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* position */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GETEST_TASK] */
struct S289 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_GEANT_TASK */
struct S290 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEANT_TASK] */
struct S291 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_ECHO_TASK */
struct S292 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_ECHO_TASK] */
struct S293 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_MKDIR_TASK */
struct S294 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_MKDIR_TASK] */
struct S295 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_DELETE_TASK */
struct S296 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_DELETE_TASK] */
struct S297 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_COPY_TASK */
struct S298 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_COPY_TASK] */
struct S299 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_MOVE_TASK */
struct S300 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_MOVE_TASK] */
struct S301 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_SETENV_TASK */
struct S302 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_SETENV_TASK] */
struct S303 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_XSLT_TASK */
struct S304 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* position */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_XSLT_TASK] */
struct S305 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_OUTOFDATE_TASK */
struct S306 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_OUTOFDATE_TASK] */
struct S307 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_EXIT_TASK */
struct S308 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_EXIT_TASK] */
struct S309 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_PRECURSOR_TASK */
struct S310 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* position */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_PRECURSOR_TASK] */
struct S311 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_AVAILABLE_TASK */
struct S312 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_AVAILABLE_TASK] */
struct S313 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_INPUT_TASK */
struct S314 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_INPUT_TASK] */
struct S315 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_REPLACE_TASK */
struct S316 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_REPLACE_TASK] */
struct S317 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_PARENT] */
struct S318 {
	int id;
};

/* Struct for type SPECIAL [GEANT_PARENT] */
struct S319 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type UC_UNICODE_ROUTINES */
struct S321 {
	int id;
};

/* Struct for type DS_LINKED_QUEUE [CHARACTER_8] */
struct S324 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
};

/* Struct for type UC_UTF16_ROUTINES */
struct S325 {
	int id;
};

/* Struct for type DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S326 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type SPECIAL [NATURAL_64] */
struct S327 {
	int id;
	T6 a1; /* count */
	T11 z2[1]; /* item */
};

/* Struct for type GEANT_RENAME_ELEMENT */
struct S328 {
	int id;
	T0* a1; /* rename_clause */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_REDEFINE_ELEMENT */
struct S329 {
	int id;
	T0* a1; /* redefine_clause */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_SELECT_ELEMENT */
struct S330 {
	int id;
	T0* a1; /* select_clause */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_RENAME */
struct S331 {
	int id;
	T0* a1; /* original_name */
	T0* a2; /* new_name */
};

/* Struct for type DS_HASH_TABLE [GEANT_RENAME, STRING_8] */
struct S332 {
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

/* Struct for type GEANT_REDEFINE */
struct S333 {
	int id;
	T0* a1; /* name */
};

/* Struct for type DS_HASH_TABLE [GEANT_REDEFINE, STRING_8] */
struct S334 {
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

/* Struct for type GEANT_SELECT */
struct S335 {
	int id;
	T0* a1; /* name */
};

/* Struct for type DS_HASH_TABLE [GEANT_SELECT, STRING_8] */
struct S336 {
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

/* Struct for type DS_LINKABLE [INTEGER_32] */
struct S338 {
	int id;
	T6 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S339 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type ARRAY [XM_EIFFEL_ENTITY_DEF] */
struct S340 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
struct S341 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
struct S342 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_LINKED_LIST_CURSOR [STRING_8] */
struct S343 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S345 {
	int id;
	T6 a1; /* count */
	T0* a2; /* last_cell */
	T0* a3; /* first_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S346 {
	int id;
	T1 a1; /* before */
	T0* a2; /* current_cell */
	T0* a3; /* next_cursor */
	T0* a4; /* container */
	T1 a5; /* after */
};

/* Struct for type DS_LINKABLE [STRING_8] */
struct S347 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type GEANT_NAME_VALUE_ELEMENT */
struct S348 {
	int id;
	T0* a1; /* xml_element */
};

/* Struct for type KL_ARRAY_ROUTINES [detachable STRING_8] */
struct S349 {
	int id;
};

/* Struct for type AP_OPTION_COMPARATOR */
struct S350 {
	int id;
};

/* Struct for type DS_QUICK_SORTER [AP_OPTION] */
struct S351 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type ST_WORD_WRAPPER */
struct S353 {
	int id;
	T6 a1; /* new_line_indentation */
	T6 a2; /* broken_words */
	T6 a3; /* maximum_text_width */
};

/* Struct for type DS_HASH_SET [XM_NAMESPACE] */
struct S355 {
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
struct S356 {
	int id;
	T0* a1; /* data */
	T0* a2; /* parent */
};

/* Struct for type XM_PROCESSING_INSTRUCTION */
struct S357 {
	int id;
	T0* a1; /* target */
	T0* a2; /* data */
	T0* a3; /* parent */
};

/* Struct for type XM_CHARACTER_DATA */
struct S358 {
	int id;
	T0* a1; /* content */
	T0* a2; /* parent */
};

/* Struct for type XM_NAMESPACE */
struct S359 {
	int id;
	T0* a1; /* uri */
	T0* a2; /* ns_prefix */
};

/* Struct for type DS_LINKABLE [XM_NODE] */
struct S362 {
	int id;
	T0* a1; /* right */
	T0* a2; /* item */
};

/* Struct for type XM_NODE_TYPER */
struct S364 {
	int id;
	T0* a1; /* element */
	T0* a2; /* xml_attribute */
	T0* a3; /* composite */
	T0* a4; /* document */
	T0* a5; /* character_data */
	T0* a6; /* processing_instruction */
	T0* a7; /* comment */
};

/* Struct for type KL_CHARACTER_BUFFER */
struct S368 {
	int id;
	T0* a1; /* as_special */
	T0* a2; /* area */
};

/* Struct for type EXCEPTIONS */
struct S370 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
struct S372 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
struct S374 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
struct S375 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
struct S376 {
	int id;
};

/* Struct for type GEANT_GEC_COMMAND */
struct S377 {
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
struct S378 {
	int id;
	T0* a1; /* item */
};

/* Struct for type [attached] PROCEDURE [GEANT_GEC_TASK, [attached] TUPLE] */
struct S379 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_GEC_TASK] */
struct S380 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_ISE_COMMAND */
struct S381 {
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
struct S382 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_ISE_TASK] */
struct S383 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_FILESET_ELEMENT */
struct S384 {
	int id;
	T0* a1; /* fileset */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_EXEC_COMMAND */
struct S385 {
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
struct S386 {
	int id;
	T0* a1; /* string_value_agent */
	T1 a2; /* has_been_retrieved */
	T0* a3; /* retrieved_string_value */
};

/* Struct for type [attached] FUNCTION [GEANT_INTERPRETING_ELEMENT, [attached] TUPLE, STRING_8] */
struct S387 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_INTERPRETING_ELEMENT, STRING_8] */
struct S388 {
	int id;
	T0* z1;
	T0* z2;
};

/* Struct for type GEANT_BOOLEAN_PROPERTY */
struct S389 {
	int id;
	T0* a1; /* string_value_agent */
	T1 a2; /* has_been_retrieved */
	T0* a3; /* retrieved_string_value */
};

/* Struct for type GEANT_FILESET */
struct S390 {
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
struct S391 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_EXEC_TASK] */
struct S392 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_LCC_COMMAND */
struct S393 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* executable */
	T0* a4; /* source_filename */
	T6 a5; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_LCC_TASK, [attached] TUPLE] */
struct S394 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_LCC_TASK] */
struct S395 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_SET_COMMAND */
struct S396 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* name */
	T0* a4; /* value */
	T6 a5; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_SET_TASK, [attached] TUPLE] */
struct S397 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_SET_TASK] */
struct S398 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_UNSET_COMMAND */
struct S399 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* name */
	T6 a4; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_UNSET_TASK, [attached] TUPLE] */
struct S400 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_UNSET_TASK] */
struct S401 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_DEFINE_ELEMENT */
struct S402 {
	int id;
	T0* a1; /* project */
	T0* a2; /* xml_element */
	T0* a3; /* position */
};

/* Struct for type GEANT_GEXACE_COMMAND */
struct S403 {
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
struct S404 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_GEXACE_TASK] */
struct S405 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_GELEX_COMMAND */
struct S406 {
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
struct S407 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_GELEX_TASK] */
struct S408 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_GEYACC_COMMAND */
struct S409 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* output_filename */
	T0* a4; /* input_filename */
	T1 a5; /* separate_actions */
	T0* a6; /* verbose_filename */
	T1 a7; /* old_typing */
	T1 a8; /* new_typing */
	T0* a9; /* tokens_classname */
	T0* a10; /* tokens_filename */
	T6 a11; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_GEYACC_TASK, [attached] TUPLE] */
struct S410 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_GEYACC_TASK] */
struct S411 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_GEPP_COMMAND */
struct S412 {
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
struct S413 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_GEPP_TASK] */
struct S414 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_GETEST_COMMAND */
struct S415 {
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
struct S416 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_GETEST_TASK] */
struct S417 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_GEANT_COMMAND */
struct S418 {
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
struct S419 {
	int id;
	T1 a1; /* has_escape_character */
	T2 a2; /* escape_character */
	T0* a3; /* separator_codes */
	T0* a4; /* separators */
};

/* Struct for type [attached] PROCEDURE [GEANT_GEANT_TASK, [attached] TUPLE] */
struct S420 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_GEANT_TASK] */
struct S421 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_ECHO_COMMAND */
struct S422 {
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
struct S423 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_ECHO_TASK] */
struct S424 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_MKDIR_COMMAND */
struct S425 {
	int id;
	T0* a1; /* directory */
	T0* a2; /* log_validation_messages_agent_cell */
	T0* a3; /* project */
	T0* a4; /* mkdir_agent_cell */
	T6 a5; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_MKDIR_TASK, [attached] TUPLE] */
struct S426 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_MKDIR_TASK] */
struct S427 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_DIRECTORYSET_ELEMENT */
struct S428 {
	int id;
	T0* a1; /* directoryset */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_DELETE_COMMAND */
struct S429 {
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
struct S430 {
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
struct S431 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_DELETE_TASK] */
struct S432 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_COPY_COMMAND */
struct S433 {
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
struct S434 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_COPY_TASK] */
struct S435 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_MOVE_COMMAND */
struct S436 {
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
struct S437 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_MOVE_TASK] */
struct S438 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_SETENV_COMMAND */
struct S439 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* name */
	T0* a4; /* value */
	T6 a5; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_SETENV_TASK, [attached] TUPLE] */
struct S440 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_SETENV_TASK] */
struct S441 {
	int id;
	T0* z1;
};

/* Struct for type DS_PAIR [STRING_8, STRING_8] */
struct S442 {
	int id;
	T0* a1; /* first */
	T0* a2; /* second */
};

/* Struct for type GEANT_XSLT_COMMAND */
struct S443 {
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
struct S444 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T6 a4; /* count */
	T0* a5; /* internal_cursor */
};

/* Struct for type [attached] PROCEDURE [GEANT_XSLT_TASK, [attached] TUPLE] */
struct S445 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_XSLT_TASK] */
struct S446 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_OUTOFDATE_COMMAND */
struct S447 {
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
struct S448 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_OUTOFDATE_TASK] */
struct S449 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_EXIT_COMMAND */
struct S450 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T6 a3; /* code */
	T6 a4; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_EXIT_TASK, [attached] TUPLE] */
struct S451 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_EXIT_TASK] */
struct S452 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_PRECURSOR_COMMAND */
struct S453 {
	int id;
	T0* a1; /* arguments */
	T0* a2; /* log_validation_messages_agent_cell */
	T0* a3; /* project */
	T0* a4; /* parent */
	T6 a5; /* exit_code */
};

/* Struct for type [attached] PROCEDURE [GEANT_PRECURSOR_TASK, [attached] TUPLE] */
struct S454 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_PRECURSOR_TASK] */
struct S455 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_AVAILABLE_COMMAND */
struct S456 {
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
struct S457 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_AVAILABLE_TASK] */
struct S458 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_INPUT_COMMAND */
struct S459 {
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
struct S460 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_INPUT_TASK] */
struct S461 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_REPLACE_COMMAND */
struct S462 {
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
struct S463 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type [attached] TUPLE [GEANT_REPLACE_TASK] */
struct S464 {
	int id;
	T0* z1;
};

/* Struct for type ARRAY [GEANT_PARENT] */
struct S465 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type SPECIAL [ARRAY [INTEGER_32]] */
struct S466 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
struct S467 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_LINKABLE [CHARACTER_8] */
struct S468 {
	int id;
	T2 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type KL_EQUALITY_TESTER [GEANT_RENAME] */
struct S469 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [GEANT_RENAME, STRING_8] */
struct S470 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type SPECIAL [GEANT_RENAME] */
struct S472 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8] */
struct S473 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_RENAME] */
struct S474 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [GEANT_REDEFINE] */
struct S475 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [GEANT_REDEFINE, STRING_8] */
struct S476 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type SPECIAL [GEANT_REDEFINE] */
struct S478 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8] */
struct S479 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_REDEFINE] */
struct S480 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [GEANT_SELECT] */
struct S481 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [GEANT_SELECT, STRING_8] */
struct S482 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type SPECIAL [GEANT_SELECT] */
struct S484 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8] */
struct S485 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_SELECT] */
struct S486 {
	int id;
};

/* Struct for type DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S488 {
	int id;
	T0* a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
};

/* Struct for type KL_DIRECTORY */
struct S489 {
	int id;
	T0* a1; /* string_name */
	T0* a2; /* name */
	T0* a3; /* last_entry */
	T6 a4; /* mode */
	T14 a5; /* directory_pointer */
	T1 a6; /* end_of_input */
	T0* a7; /* entry_buffer */
	T0* a8; /* lastentry */
};

/* Struct for type KL_STRING_INPUT_STREAM */
struct S490 {
	int id;
	T1 a1; /* end_of_input */
	T2 a2; /* last_character */
	T0* a3; /* last_string */
	T0* a4; /* string */
	T6 a5; /* location */
};

/* Struct for type KL_ARRAY [detachable STRING_8] */
struct S491 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type SPECIAL [XM_NAMESPACE] */
struct S492 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_EQUALITY_TESTER [XM_NAMESPACE] */
struct S493 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [XM_NAMESPACE] */
struct S494 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
struct S495 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
struct S496 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type ARRAY [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
struct S497 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type GEANT_MAP_ELEMENT */
struct S500 {
	int id;
	T0* a1; /* map */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_MAP */
struct S501 {
	int id;
	T0* a1; /* project */
	T0* a2; /* type */
	T0* a3; /* source_pattern */
	T0* a4; /* target_pattern */
	T0* a5; /* map */
};

/* Struct for type DS_HASH_SET [GEANT_FILESET_ENTRY] */
struct S504 {
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
struct S506 {
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
struct S508 {
	int id;
	T0* a1; /* yy_nxt */
	T0* a2; /* pattern */
	T1 a3; /* is_case_insensitive */
	T0* a4; /* yy_accept */
	T6 a5; /* yyNb_rows */
	T6 a6; /* match_count */
	T6 a7; /* subject_start */
	T6 a8; /* subject_end */
	T0* a9; /* subject */
	T6 a10; /* matched_start */
	T6 a11; /* matched_end */
};

/* Struct for type DS_HASH_SET [INTEGER_32] */
struct S510 {
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
struct S511 {
	int id;
	T0* a1; /* item */
};

/* Struct for type [attached] TUPLE [STRING_8] */
struct S512 {
	int id;
	T0* z1;
};

/* Struct for type [attached] PROCEDURE [GEANT_ECHO_COMMAND, [attached] TUPLE [STRING_8]] */
struct S513 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*, T0*);
};

/* Struct for type [attached] TUPLE [GEANT_ECHO_COMMAND] */
struct S514 {
	int id;
	T0* z1;
};

/* Struct for type DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]]] */
struct S516 {
	int id;
	T0* a1; /* item */
};

/* Struct for type KL_TEXT_OUTPUT_FILE */
struct S517 {
	int id;
	T0* a1; /* name */
	T6 a2; /* mode */
	T0* a3; /* string_name */
	T0* a4; /* last_string */
	T14 a5; /* file_pointer */
	T1 a6; /* descriptor_available */
};

/* Struct for type [attached] TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN] */
struct S518 {
	int id;
	T0* z1;
	T0* z2;
	T1 z3;
};

/* Struct for type [attached] PROCEDURE [GEANT_ECHO_COMMAND, [attached] TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]] */
struct S519 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*, T0*, T0*, T1);
};

/* Struct for type [attached] PROCEDURE [GEANT_MKDIR_COMMAND, [attached] TUPLE [STRING_8]] */
struct S521 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*, T0*);
};

/* Struct for type [attached] TUPLE [GEANT_MKDIR_COMMAND] */
struct S522 {
	int id;
	T0* z1;
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]] */
struct S523 {
	int id;
};

/* Struct for type SPECIAL [DS_PAIR [STRING_8, STRING_8]] */
struct S524 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING_8, STRING_8]] */
struct S525 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_CELL [FUNCTION [ANY, TUPLE [STRING_8], BOOLEAN]] */
struct S526 {
	int id;
	T0* a1; /* item */
};

/* Struct for type [attached] PREDICATE [GEANT_AVAILABLE_COMMAND, [attached] TUPLE [STRING_8]] */
struct S527 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T1 (*f)(T0*, T0*);
};

/* Struct for type [attached] TUPLE [GEANT_AVAILABLE_COMMAND] */
struct S528 {
	int id;
	T0* z1;
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_RENAME, STRING_8] */
struct S530 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type ARRAY [GEANT_RENAME] */
struct S531 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_REDEFINE, STRING_8] */
struct S532 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type ARRAY [GEANT_REDEFINE] */
struct S533 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_SELECT, STRING_8] */
struct S534 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type ARRAY [GEANT_SELECT] */
struct S535 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [XM_NAMESPACE] */
struct S540 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY] */
struct S542 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY] */
struct S543 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY] */
struct S544 {
	int id;
};

/* Struct for type GEANT_FILESET_ENTRY */
struct S545 {
	int id;
	T0* a1; /* filename */
	T0* a2; /* mapped_filename */
};

/* Struct for type SPECIAL [GEANT_FILESET_ENTRY] */
struct S546 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_SET_CURSOR [STRING_8] */
struct S547 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type LX_WILDCARD_PARSER */
struct S548 {
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
	T0* a12; /* error_handler */
	T0* a13; /* name_definitions */
	T0* a14; /* character_classes */
	T6 a15; /* line_nb */
	T0* a16; /* yyss */
	T0* a17; /* input_buffer */
	T6 a18; /* yy_end */
	T6 a19; /* yy_position */
	T6 a20; /* yy_line */
	T6 a21; /* yy_column */
	T6 a22; /* yy_parsing_status */
	T6 a23; /* yy_suspended_yystacksize */
	T6 a24; /* yy_suspended_yystate */
	T6 a25; /* yy_suspended_yyn */
	T6 a26; /* yy_suspended_yychar1 */
	T6 a27; /* yy_suspended_index */
	T6 a28; /* yy_suspended_yyss_top */
	T6 a29; /* yy_suspended_yy_goto */
	T0* a30; /* yyr1 */
	T6 a31; /* yyssp */
	T0* a32; /* yypgoto */
	T0* a33; /* yycheck */
	T0* a34; /* yytable */
	T0* a35; /* yydefgoto */
	T6 a36; /* error_count */
	T1 a37; /* yy_lookahead_needed */
	T6 a38; /* yyerrstatus */
	T0* a39; /* yypact */
	T6 a40; /* last_token */
	T0* a41; /* yytranslate */
	T0* a42; /* yydefact */
	T0* a43; /* yytypes1 */
	T0* a44; /* yytypes2 */
	T6 a45; /* yy_start */
	T6 a46; /* yyvsp1 */
	T6 a47; /* yyvsp2 */
	T6 a48; /* yyvsp3 */
	T6 a49; /* yyvsp4 */
	T6 a50; /* yyvsp5 */
	T1 a51; /* yy_more_flag */
	T6 a52; /* yy_more_len */
	T6 a53; /* line */
	T6 a54; /* column */
	T6 a55; /* position */
	T6 a56; /* yy_start_state */
	T0* a57; /* yy_state_stack */
	T6 a58; /* yy_state_count */
	T0* a59; /* yy_content_area */
	T0* a60; /* yy_ec */
	T0* a61; /* yy_content */
	T0* a62; /* yy_accept */
	T6 a63; /* yy_last_accepting_state */
	T6 a64; /* yy_last_accepting_cpos */
	T0* a65; /* yy_chk */
	T0* a66; /* yy_base */
	T0* a67; /* yy_def */
	T0* a68; /* yy_meta */
	T0* a69; /* yy_nxt */
	T6 a70; /* yy_lp */
	T0* a71; /* yy_acclist */
	T6 a72; /* yy_looking_for_trail_begin */
	T6 a73; /* yy_full_match */
	T6 a74; /* yy_full_state */
	T6 a75; /* yy_full_lp */
	T1 a76; /* yy_rejected */
	T6 a77; /* yyvsc1 */
	T0* a78; /* yyvs1 */
	T0* a79; /* yyspecial_routines1 */
	T0* a80; /* last_any_value */
	T6 a81; /* yyvsc2 */
	T0* a82; /* yyvs2 */
	T0* a83; /* yyspecial_routines2 */
	T6 a84; /* last_integer_value */
	T6 a85; /* yyvsc3 */
	T0* a86; /* yyvs3 */
	T0* a87; /* yyspecial_routines3 */
	T0* a88; /* last_lx_symbol_class_value */
	T6 a89; /* yyvsc4 */
	T0* a90; /* yyvs4 */
	T0* a91; /* yyspecial_routines4 */
	T0* a92; /* last_string_value */
	T1 a93; /* in_trail_context */
	T0* a94; /* rule */
	T0* a95; /* yyvs5 */
	T1 a96; /* has_trail_context */
	T6 a97; /* head_count */
	T6 a98; /* head_line */
	T6 a99; /* head_column */
	T6 a100; /* trail_count */
	T0* a101; /* yyspecial_routines5 */
	T6 a102; /* yyvsc5 */
	T0* a103; /* last_string */
	T6 a104; /* rule_line_nb */
};

/* Struct for type LX_DESCRIPTION */
struct S549 {
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
struct S550 {
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
struct S552 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_EQUALITY_TESTER [INTEGER_32] */
struct S553 {
	int id;
};

/* Struct for type ARRAY [DS_PAIR [STRING_8, STRING_8]] */
struct S554 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type KL_NULL_TEXT_OUTPUT_STREAM */
struct S558 {
	int id;
	T0* a1; /* name */
};

/* Struct for type DP_SHELL_COMMAND */
struct S560 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* string_command */
	T0* a3; /* command */
	T6 a4; /* return_code */
	T1 a5; /* is_system_code */
};

/* Struct for type DS_CELL [BOOLEAN] */
struct S561 {
	int id;
	T1 a1; /* item */
};

/* Struct for type KL_BOOLEAN_ROUTINES */
struct S563 {
	int id;
};

/* Struct for type GEANT_VARIABLES_VARIABLE_RESOLVER */
struct S564 {
	int id;
	T0* a1; /* variables */
};

/* Struct for type RX_PCRE_REGULAR_EXPRESSION */
struct S565 {
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
struct S566 {
	int id;
};

/* Struct for type KL_STDIN_FILE */
struct S567 {
	int id;
	T0* a1; /* last_string */
	T1 a2; /* end_of_file */
	T2 a3; /* last_character */
	T14 a4; /* file_pointer */
	T0* a5; /* character_buffer */
	T0* a6; /* name */
	T6 a7; /* mode */
};

/* Struct for type ARRAY [GEANT_FILESET_ENTRY] */
struct S570 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_ARRAYED_LIST [LX_RULE] */
struct S571 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type LX_START_CONDITIONS */
struct S572 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type LX_ACTION_FACTORY */
struct S573 {
	int id;
};

/* Struct for type DS_ARRAYED_STACK [INTEGER_32] */
struct S574 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
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
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* key_storage */
	T0* a17; /* special_item_routines */
	T0* a18; /* special_key_routines */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type LX_SYMBOL_CLASS */
struct S576 {
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

/* Struct for type SPECIAL [LX_SYMBOL_CLASS] */
struct S577 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS] */
struct S578 {
	int id;
};

/* Struct for type LX_NFA */
struct S579 {
	int id;
	T1 a1; /* in_trail_context */
	T0* a2; /* states */
};

/* Struct for type LX_EQUIVALENCE_CLASSES */
struct S580 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
};

/* Struct for type LX_RULE */
struct S581 {
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

/* Struct for type SPECIAL [LX_NFA] */
struct S582 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_NFA] */
struct S583 {
	int id;
};

/* Struct for type UT_SYNTAX_ERROR */
struct S584 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
struct S585 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type LX_UNRECOGNIZED_RULE_ERROR */
struct S586 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_MISSING_QUOTE_ERROR */
struct S587 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_BAD_CHARACTER_CLASS_ERROR */
struct S588 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_BAD_CHARACTER_ERROR */
struct S589 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_FULL_AND_META_ERROR */
struct S590 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_FULL_AND_REJECT_ERROR */
struct S591 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR */
struct S592 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_CHARACTER_OUT_OF_RANGE_ERROR */
struct S593 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type SPECIAL [LX_RULE] */
struct S594 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [LX_RULE] */
struct S595 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type LX_DFA_STATE */
struct S596 {
	int id;
	T0* a1; /* accepted_rules */
	T0* a2; /* states */
	T0* a3; /* transitions */
	T0* a4; /* accepted_head_rules */
	T6 a5; /* code */
	T6 a6; /* id */
};

/* Struct for type DS_ARRAYED_LIST [LX_NFA_STATE] */
struct S597 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* equality_tester */
	T0* a4; /* special_routines */
	T6 a5; /* capacity */
	T0* a6; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST [LX_DFA_STATE] */
struct S598 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T0* a5; /* internal_cursor */
};

/* Struct for type LX_SYMBOL_PARTITIONS */
struct S599 {
	int id;
	T0* a1; /* symbols */
	T0* a2; /* storage */
	T6 a3; /* count */
};

/* Struct for type KL_ARRAY_ROUTINES [LX_RULE] */
struct S600 {
	int id;
};

/* Struct for type LX_START_CONDITION */
struct S601 {
	int id;
	T0* a1; /* name */
	T6 a2; /* id */
	T1 a3; /* is_exclusive */
	T0* a4; /* patterns */
	T0* a5; /* bol_patterns */
};

/* Struct for type LX_TRANSITION_TABLE [LX_DFA_STATE] */
struct S602 {
	int id;
	T0* a1; /* storage */
	T0* a2; /* array_routines */
	T6 a3; /* count */
};

/* Struct for type DS_ARRAYED_LIST [LX_NFA] */
struct S603 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T6 a5; /* count */
};

/* Struct for type DS_HASH_TABLE [LX_NFA, INTEGER_32] */
struct S604 {
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
	T0* a12; /* internal_keys */
	T6 a13; /* found_position */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* key_storage */
	T0* a17; /* special_item_routines */
	T0* a18; /* special_key_routines */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type LX_NFA_STATE */
struct S605 {
	int id;
	T1 a1; /* in_trail_context */
	T0* a2; /* transition */
	T0* a3; /* epsilon_transition */
	T6 a4; /* id */
	T0* a5; /* accepted_rule */
};

/* Struct for type LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR */
struct S607 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type RX_BYTE_CODE */
struct S609 {
	int id;
	T6 a1; /* count */
	T0* a2; /* byte_code */
	T0* a3; /* character_sets */
	T6 a4; /* capacity */
	T6 a5; /* character_sets_count */
	T6 a6; /* character_sets_capacity */
};

/* Struct for type RX_CHARACTER_SET */
struct S610 {
	int id;
	T0* a1; /* set */
};

/* Struct for type RX_CASE_MAPPING */
struct S611 {
	int id;
	T0* a1; /* lower_table */
	T0* a2; /* flip_table */
};

/* Struct for type SPECIAL [RX_CHARACTER_SET] */
struct S613 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [RX_CHARACTER_SET] */
struct S614 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_RULE] */
struct S615 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_RULE] */
struct S616 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [LX_START_CONDITION] */
struct S617 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_START_CONDITION] */
struct S618 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION] */
struct S619 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING_8] */
struct S621 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
struct S623 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type ARRAY [LX_SYMBOL_CLASS] */
struct S624 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE] */
struct S625 {
	int id;
	T0* a1; /* label */
	T0* a2; /* target */
};

/* Struct for type LX_EPSILON_TRANSITION [LX_NFA_STATE] */
struct S627 {
	int id;
	T0* a1; /* target */
};

/* Struct for type LX_SYMBOL_TRANSITION [LX_NFA_STATE] */
struct S629 {
	int id;
	T6 a1; /* label */
	T0* a2; /* target */
};

/* Struct for type DS_BILINKABLE [INTEGER_32] */
struct S630 {
	int id;
	T6 a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
};

/* Struct for type SPECIAL [DS_BILINKABLE [INTEGER_32]] */
struct S631 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [DS_BILINKABLE [INTEGER_32]] */
struct S632 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type LX_ACTION */
struct S634 {
	int id;
	T0* a1; /* text */
};

/* Struct for type ARRAY [LX_NFA] */
struct S635 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_BUBBLE_SORTER [LX_NFA_STATE] */
struct S636 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type DS_BUBBLE_SORTER [LX_RULE] */
struct S638 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type SPECIAL [LX_NFA_STATE] */
struct S640 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_NFA_STATE] */
struct S642 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE] */
struct S643 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [LX_DFA_STATE] */
struct S645 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_DFA_STATE] */
struct S646 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE] */
struct S647 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_ARRAY [LX_RULE] */
struct S648 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [LX_DFA_STATE] */
struct S649 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type KL_ARRAY_ROUTINES [LX_DFA_STATE] */
struct S650 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_NFA] */
struct S651 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [LX_NFA, INTEGER_32] */
struct S653 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32] */
struct S655 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_BINARY_INPUT_FILE */
struct S656 {
	int id;
	T1 a1; /* end_of_file */
	T0* a2; /* last_string */
	T6 a3; /* mode */
	T0* a4; /* name */
	T0* a5; /* string_name */
	T0* a6; /* character_buffer */
	T14 a7; /* file_pointer */
	T1 a8; /* descriptor_available */
};

/* Struct for type KL_BINARY_OUTPUT_FILE */
struct S657 {
	int id;
	T6 a1; /* mode */
	T0* a2; /* name */
	T0* a3; /* string_name */
	T0* a4; /* last_string */
	T14 a5; /* file_pointer */
	T1 a6; /* descriptor_available */
};

/* Struct for type FILE_NAME */
struct S659 {
	int id;
	T6 a1; /* count */
	T6 a2; /* internal_hash_code */
	T0* a3; /* area */
};

/* Struct for type RAW_FILE */
struct S660 {
	int id;
	T0* a1; /* name */
	T6 a2; /* mode */
	T0* a3; /* last_string */
	T14 a4; /* file_pointer */
	T1 a5; /* descriptor_available */
};

/* Struct for type DIRECTORY */
struct S661 {
	int id;
	T0* a1; /* lastentry */
	T0* a2; /* name */
	T6 a3; /* mode */
	T14 a4; /* directory_pointer */
};

/* Struct for type ARRAYED_LIST [STRING_8] */
struct S662 {
	int id;
	T6 a1; /* index */
	T6 a2; /* count */
	T0* a3; /* area */
	T6 a4; /* lower */
	T6 a5; /* upper */
};

/* Struct for type KL_COMPARABLE_COMPARATOR [LX_RULE] */
struct S665 {
	int id;
};

/* Struct for type KL_COMPARABLE_COMPARATOR [LX_NFA_STATE] */
struct S668 {
	int id;
};

/* Struct for type ARRAY [LX_START_CONDITION] */
struct S671 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
struct S672 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type ARRAY [LX_NFA_STATE] */
struct S673 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [LX_NFA, INTEGER_32] */
struct S674 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type STRING_SEARCHER */
struct S675 {
	int id;
	T0* a1; /* deltas */
};

/* Struct for type HASH_TABLE [C_STRING, STRING_8] */
struct S676 {
	int id;
	T6 a1; /* capacity */
	T0* a2; /* content */
	T0* a3; /* keys */
	T0* a4; /* deleted_marks */
	T6 a5; /* iteration_position */
	T6 a6; /* count */
	T6 a7; /* deleted_position */
	T6 a8; /* control */
	T0* a9; /* found_item */
	T1 a10; /* has_default */
	T6 a11; /* position */
	T6 a12; /* used_slot_count */
};

/* Struct for type DS_SHELL_SORTER [INTEGER_32] */
struct S677 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type KL_COMPARABLE_COMPARATOR [INTEGER_32] */
struct S682 {
	int id;
};

/* Struct for type PRIMES */
struct S685 {
	int id;
};

/* Struct for type SPECIAL [C_STRING] */
struct S686 {
	int id;
	T6 a1; /* count */
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
extern T17 GE_default17;
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
extern T61 GE_default61;
extern T63 GE_default63;
extern T64 GE_default64;
extern T65 GE_default65;
extern T66 GE_default66;
extern T68 GE_default68;
extern T69 GE_default69;
extern T71 GE_default71;
extern T72 GE_default72;
extern T73 GE_default73;
extern T74 GE_default74;
extern T75 GE_default75;
extern T76 GE_default76;
extern T77 GE_default77;
extern T81 GE_default81;
extern T83 GE_default83;
extern T84 GE_default84;
extern T86 GE_default86;
extern T87 GE_default87;
extern T89 GE_default89;
extern T91 GE_default91;
extern T93 GE_default93;
extern T94 GE_default94;
extern T97 GE_default97;
extern T98 GE_default98;
extern T99 GE_default99;
extern T100 GE_default100;
extern T101 GE_default101;
extern T104 GE_default104;
extern T105 GE_default105;
extern T106 GE_default106;
extern T107 GE_default107;
extern T108 GE_default108;
extern T109 GE_default109;
extern T111 GE_default111;
extern T112 GE_default112;
extern T113 GE_default113;
extern T114 GE_default114;
extern T115 GE_default115;
extern T116 GE_default116;
extern T118 GE_default118;
extern T120 GE_default120;
extern T121 GE_default121;
extern T122 GE_default122;
extern T123 GE_default123;
extern T124 GE_default124;
extern T126 GE_default126;
extern T128 GE_default128;
extern T129 GE_default129;
extern T130 GE_default130;
extern T132 GE_default132;
extern T133 GE_default133;
extern T135 GE_default135;
extern T136 GE_default136;
extern T137 GE_default137;
extern T138 GE_default138;
extern T140 GE_default140;
extern T141 GE_default141;
extern T142 GE_default142;
extern T143 GE_default143;
extern T144 GE_default144;
extern T145 GE_default145;
extern T146 GE_default146;
extern T147 GE_default147;
extern T148 GE_default148;
extern T149 GE_default149;
extern T150 GE_default150;
extern T151 GE_default151;
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
extern T164 GE_default164;
extern T166 GE_default166;
extern T167 GE_default167;
extern T168 GE_default168;
extern T169 GE_default169;
extern T170 GE_default170;
extern T171 GE_default171;
extern T173 GE_default173;
extern T174 GE_default174;
extern T176 GE_default176;
extern T177 GE_default177;
extern T178 GE_default178;
extern T179 GE_default179;
extern T180 GE_default180;
extern T181 GE_default181;
extern T182 GE_default182;
extern T183 GE_default183;
extern T184 GE_default184;
extern T186 GE_default186;
extern T187 GE_default187;
extern T188 GE_default188;
extern T190 GE_default190;
extern T191 GE_default191;
extern T192 GE_default192;
extern T194 GE_default194;
extern T195 GE_default195;
extern T196 GE_default196;
extern T197 GE_default197;
extern T198 GE_default198;
extern T199 GE_default199;
extern T200 GE_default200;
extern T201 GE_default201;
extern T203 GE_default203;
extern T204 GE_default204;
extern T205 GE_default205;
extern T206 GE_default206;
extern T207 GE_default207;
extern T208 GE_default208;
extern T209 GE_default209;
extern T210 GE_default210;
extern T211 GE_default211;
extern T212 GE_default212;
extern T213 GE_default213;
extern T215 GE_default215;
extern T216 GE_default216;
extern T217 GE_default217;
extern T218 GE_default218;
extern T219 GE_default219;
extern T222 GE_default222;
extern T223 GE_default223;
extern T224 GE_default224;
extern T225 GE_default225;
extern T226 GE_default226;
extern T227 GE_default227;
extern T229 GE_default229;
extern T231 GE_default231;
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
extern T261 GE_default261;
extern T262 GE_default262;
extern T263 GE_default263;
extern T264 GE_default264;
extern T265 GE_default265;
extern T266 GE_default266;
extern T267 GE_default267;
extern T270 GE_default270;
extern T271 GE_default271;
extern T272 GE_default272;
extern T273 GE_default273;
extern T274 GE_default274;
extern T275 GE_default275;
extern T276 GE_default276;
extern T277 GE_default277;
extern T278 GE_default278;
extern T279 GE_default279;
extern T280 GE_default280;
extern T281 GE_default281;
extern T282 GE_default282;
extern T283 GE_default283;
extern T284 GE_default284;
extern T285 GE_default285;
extern T286 GE_default286;
extern T287 GE_default287;
extern T288 GE_default288;
extern T289 GE_default289;
extern T290 GE_default290;
extern T291 GE_default291;
extern T292 GE_default292;
extern T293 GE_default293;
extern T294 GE_default294;
extern T295 GE_default295;
extern T296 GE_default296;
extern T297 GE_default297;
extern T298 GE_default298;
extern T299 GE_default299;
extern T300 GE_default300;
extern T301 GE_default301;
extern T302 GE_default302;
extern T303 GE_default303;
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
extern T321 GE_default321;
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
extern T338 GE_default338;
extern T339 GE_default339;
extern T340 GE_default340;
extern T341 GE_default341;
extern T342 GE_default342;
extern T343 GE_default343;
extern T345 GE_default345;
extern T346 GE_default346;
extern T347 GE_default347;
extern T348 GE_default348;
extern T349 GE_default349;
extern T350 GE_default350;
extern T351 GE_default351;
extern T353 GE_default353;
extern T355 GE_default355;
extern T356 GE_default356;
extern T357 GE_default357;
extern T358 GE_default358;
extern T359 GE_default359;
extern T362 GE_default362;
extern T364 GE_default364;
extern T368 GE_default368;
extern T369 GE_default369;
extern T370 GE_default370;
extern T372 GE_default372;
extern T374 GE_default374;
extern T375 GE_default375;
extern T376 GE_default376;
extern T377 GE_default377;
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
extern T388 GE_default388;
extern T389 GE_default389;
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
extern T472 GE_default472;
extern T473 GE_default473;
extern T474 GE_default474;
extern T475 GE_default475;
extern T476 GE_default476;
extern T478 GE_default478;
extern T479 GE_default479;
extern T480 GE_default480;
extern T481 GE_default481;
extern T482 GE_default482;
extern T484 GE_default484;
extern T485 GE_default485;
extern T486 GE_default486;
extern T488 GE_default488;
extern T489 GE_default489;
extern T490 GE_default490;
extern T491 GE_default491;
extern T492 GE_default492;
extern T493 GE_default493;
extern T494 GE_default494;
extern T495 GE_default495;
extern T496 GE_default496;
extern T497 GE_default497;
extern T500 GE_default500;
extern T501 GE_default501;
extern T504 GE_default504;
extern T506 GE_default506;
extern T508 GE_default508;
extern T510 GE_default510;
extern T511 GE_default511;
extern T512 GE_default512;
extern T513 GE_default513;
extern T514 GE_default514;
extern T516 GE_default516;
extern T517 GE_default517;
extern T518 GE_default518;
extern T519 GE_default519;
extern T521 GE_default521;
extern T522 GE_default522;
extern T523 GE_default523;
extern T524 GE_default524;
extern T525 GE_default525;
extern T526 GE_default526;
extern T527 GE_default527;
extern T528 GE_default528;
extern T530 GE_default530;
extern T531 GE_default531;
extern T532 GE_default532;
extern T533 GE_default533;
extern T534 GE_default534;
extern T535 GE_default535;
extern T540 GE_default540;
extern T542 GE_default542;
extern T543 GE_default543;
extern T544 GE_default544;
extern T545 GE_default545;
extern T546 GE_default546;
extern T547 GE_default547;
extern T548 GE_default548;
extern T549 GE_default549;
extern T550 GE_default550;
extern T552 GE_default552;
extern T553 GE_default553;
extern T554 GE_default554;
extern T558 GE_default558;
extern T560 GE_default560;
extern T561 GE_default561;
extern T563 GE_default563;
extern T564 GE_default564;
extern T565 GE_default565;
extern T566 GE_default566;
extern T567 GE_default567;
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
extern T605 GE_default605;
extern T607 GE_default607;
extern T609 GE_default609;
extern T610 GE_default610;
extern T611 GE_default611;
extern T613 GE_default613;
extern T614 GE_default614;
extern T615 GE_default615;
extern T616 GE_default616;
extern T617 GE_default617;
extern T618 GE_default618;
extern T619 GE_default619;
extern T621 GE_default621;
extern T623 GE_default623;
extern T624 GE_default624;
extern T625 GE_default625;
extern T627 GE_default627;
extern T629 GE_default629;
extern T630 GE_default630;
extern T631 GE_default631;
extern T632 GE_default632;
extern T634 GE_default634;
extern T635 GE_default635;
extern T636 GE_default636;
extern T638 GE_default638;
extern T640 GE_default640;
extern T642 GE_default642;
extern T643 GE_default643;
extern T645 GE_default645;
extern T646 GE_default646;
extern T647 GE_default647;
extern T648 GE_default648;
extern T649 GE_default649;
extern T650 GE_default650;
extern T651 GE_default651;
extern T653 GE_default653;
extern T655 GE_default655;
extern T656 GE_default656;
extern T657 GE_default657;
extern T659 GE_default659;
extern T660 GE_default660;
extern T661 GE_default661;
extern T662 GE_default662;
extern T665 GE_default665;
extern T668 GE_default668;
extern T671 GE_default671;
extern T672 GE_default672;
extern T673 GE_default673;
extern T674 GE_default674;
extern T675 GE_default675;
extern T676 GE_default676;
extern T677 GE_default677;
extern T679 GE_default679;
extern T682 GE_default682;
extern T685 GE_default685;
extern T686 GE_default686;

extern T0* GE_ms8(char* s, T6 c);
extern T0* GE_ms32(char* s, T6 c);
/* Call to STRING_8.to_c */
extern T0* T17x1128(T0* C);
/* Call to STRING_8.count */
extern T6 T17x1225(T0* C);
/* Call to ANY.same_type */
extern T1 T19x27T0(T0* C, T0* a1);
/* Call to GEANT_VARIABLES.has */
extern T1 T29x1990T0(T0* C, T0* a1);
/* Call to GEANT_VARIABLES.item_for_iteration */
extern T0* T29x2054(T0* C);
/* Call to GEANT_VARIABLES.key_for_iteration */
extern T0* T29x1982(T0* C);
/* Call to GEANT_VARIABLES.after */
extern T1 T29x2033(T0* C);
/* Call to GEANT_VARIABLES.found_item */
extern T0* T29x2078(T0* C);
/* Call to GEANT_VARIABLES.found */
extern T1 T29x2086(T0* C);
/* Call to AP_OPTION.short_form */
extern T2 T42x2540(T0* C);
/* Call to AP_OPTION.long_form */
extern T0* T42x2535(T0* C);
/* Call to AP_OPTION.has_long_form */
extern T1 T42x2542(T0* C);
/* Call to AP_OPTION.example */
extern T0* T42x2534(T0* C);
/* Call to AP_OPTION.is_hidden */
extern T1 T42x2544(T0* C);
/* Call to AP_OPTION.description */
extern T0* T42x2533(T0* C);
/* Call to AP_OPTION.names */
extern T0* T42x2537(T0* C);
/* Call to AP_OPTION.name */
extern T0* T42x2536(T0* C);
/* Call to AP_OPTION.needs_parameter */
extern T1 T42x2546(T0* C);
/* Call to AP_OPTION.has_short_form */
extern T1 T42x2543(T0* C);
/* Call to AP_OPTION.allows_parameter */
extern T1 T42x2541(T0* C);
/* Call to AP_OPTION.maximum_occurrences */
extern T6 T42x2539(T0* C);
/* Call to AP_OPTION.occurrences */
extern T6 T42x2538(T0* C);
/* Call to AP_OPTION.was_found */
extern T1 T42x2548(T0* C);
/* Call to AP_OPTION.is_mandatory */
extern T1 T42x2545(T0* C);
/* Call to UT_ERROR.default_message */
extern T0* T50x2865(T0* C);
/* Call to DS_SPARSE_TABLE [STRING_8, STRING_8].new_cursor */
extern T0* T62x2055(T0* C);
/* Call to DS_SPARSE_TABLE [STRING_8, STRING_8].key_equality_tester */
extern T0* T62x2111(T0* C);
/* Call to READABLE_STRING_8.area_lower */
extern T6 T78x1220(T0* C);
/* Call to READABLE_STRING_8.area */
extern T0* T78x1219(T0* C);
/* Call to READABLE_STRING_8.count */
extern T6 T78x1225(T0* C);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_key */
extern T0* T81x1984T0(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_item */
extern T0* T81x2062T0(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_after */
extern T1 T81x2049T0(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].before_position */
extern T6 T81x2166(T0* C);
/* Call to XM_EIFFEL_SCANNER.start_condition */
extern T6 T132x6771(T0* C);
/* Call to XM_EIFFEL_SCANNER.is_applicable_encoding */
extern T1 T132x6646T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.end_of_file */
extern T1 T132x6776(T0* C);
/* Call to XM_EIFFEL_SCANNER.last_value */
extern T0* T132x6657(T0* C);
/* Call to XM_EIFFEL_SCANNER.last_token */
extern T6 T132x6767(T0* C);
/* Call to XM_EIFFEL_SCANNER.error_position */
extern T0* T132x6655(T0* C);
/* Call to XM_NODE.parent */
extern T0* T202x6166(T0* C);
/* Call to GEANT_TASK.exit_code */
extern T6 T268x8234(T0* C);
/* Call to GEANT_TASK.is_exit_command */
extern T1 T268x8235(T0* C);
/* Call to GEANT_TASK.is_enabled */
extern T1 T268x2366(T0* C);
/* Call to GEANT_TASK.is_executable */
extern T1 T268x8233(T0* C);
/* Call to FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK].item with a manifest tuple argument of type [attached] TUPLE [XM_ELEMENT] */
extern T0* T269xmt8224T264(T0* C, T0* a1);
/* Call to LX_TRANSITION [LX_NFA_STATE].target */
extern T0* T626x12170(T0* C);
/* Call to LX_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T626x12173T6(T0* C, T6 a1);
/* Call to GEANT_VARIABLES.replace */
extern void T29x1992T0T0(T0* C, T0* a1, T0* a2);
/* Call to GEANT_VARIABLES.set_variable_value */
extern void T29x1906T0T0(T0* C, T0* a1, T0* a2);
/* Call to GEANT_VARIABLES.forth */
extern void T29x2037(T0* C);
/* Call to GEANT_VARIABLES.start */
extern void T29x2036(T0* C);
/* Call to GEANT_VARIABLES.search */
extern void T29x2095T0(T0* C, T0* a1);
/* Call to GEANT_VARIABLES.force_last */
extern void T29x1971T0T0(T0* C, T0* a1, T0* a2);
/* Call to AP_OPTION.record_occurrence */
extern void T42x2559T0(T0* C, T0* a1);
/* Call to AP_OPTION.reset */
extern void T42x2560(T0* C);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_forth */
extern void T81x2051T0(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_start */
extern void T81x2050T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS_FILTER.set_next */
extern void T95x5421T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_xml_declaration */
extern void T96x5584T0T0T1(T0* C, T0* a1, T0* a2, T1 a3);
/* Call to XM_CALLBACKS.on_attribute */
extern void T96x5589T0T0T0T0(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* Call to XM_CALLBACKS.on_error */
extern void T96x5585T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_end_tag */
extern void T96x5591T0T0T0(T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_start_tag_finish */
extern void T96x5590(T0* C);
/* Call to XM_CALLBACKS.on_start_tag */
extern void T96x5588T0T0T0(T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_content */
extern void T96x5592T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_processing_instruction */
extern void T96x5586T0T0(T0* C, T0* a1, T0* a2);
/* Call to XM_CALLBACKS.on_comment */
extern void T96x5587T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_finish */
extern void T96x5583(T0* C);
/* Call to XM_CALLBACKS.on_start */
extern void T96x5582(T0* C);
/* Call to XM_EIFFEL_SCANNER.close_input */
extern void T132x6642(T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T132x6641T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.set_encoding */
extern void T132x6647T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T132x6638(T0* C);
/* Call to XM_EIFFEL_SCANNER.read_token */
extern void T132x6782(T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_stream */
extern void T132x6640T0(T0* C, T0* a1);
/* Call to XM_NODE.process */
extern void T202x6176T0(T0* C, T0* a1);
/* Call to XM_NODE.node_set_parent */
extern void T202x6174T0(T0* C, T0* a1);
/* Call to GEANT_TASK.execute */
extern void T268x8237(T0* C);
/* Call to GEANT_TASK.log_validation_messages */
extern void T268x8238(T0* C);
/* Call to LX_TRANSITION [LX_NFA_STATE].record */
extern void T626x12174T0(T0* C, T0* a1);
/* New instance of type SPECIAL [CHARACTER_8] */
extern T0* GE_new15(T6 a1, T1 initialize);
/* New instance of type STRING_8 */
extern T0* GE_new17(T1 initialize);
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
/* New instance of type DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8] */
extern T0* GE_new61(T1 initialize);
/* New instance of type SPECIAL [INTEGER_32] */
extern T0* GE_new63(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
extern T0* GE_new64(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [INTEGER_32] */
extern T0* GE_new65(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [STRING_8] */
extern T0* GE_new66(T1 initialize);
/* New instance of type KL_STDOUT_FILE */
extern T0* GE_new68(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [AP_OPTION] */
extern T0* GE_new69(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [detachable STRING_8] */
extern T0* GE_new71(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [detachable STRING_8] */
extern T0* GE_new72(T1 initialize);
/* New instance of type AP_DISPLAY_HELP_FLAG */
extern T0* GE_new73(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [AP_OPTION] */
extern T0* GE_new74(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST] */
extern T0* GE_new75(T1 initialize);
/* New instance of type KL_STRING_ROUTINES */
extern T0* GE_new76(T1 initialize);
/* New instance of type DS_HASH_TABLE [STRING_8, STRING_8] */
extern T0* GE_new81(T1 initialize);
/* New instance of type EXECUTION_ENVIRONMENT */
extern T0* GE_new83(T1 initialize);
/* New instance of type KL_ANY_ROUTINES */
extern T0* GE_new84(T1 initialize);
/* New instance of type KL_PATHNAME */
extern T0* GE_new86(T1 initialize);
/* New instance of type UNIX_FILE_INFO */
extern T0* GE_new87(T1 initialize);
/* New instance of type detachable KL_LINKABLE [CHARACTER_8] */
extern T0* GE_new89(T1 initialize);
/* New instance of type XM_EXPAT_PARSER_FACTORY */
extern T0* GE_new91(T1 initialize);
/* New instance of type XM_EIFFEL_PARSER */
extern T0* GE_new93(T1 initialize);
/* New instance of type XM_TREE_CALLBACKS_PIPE */
extern T0* GE_new94(T1 initialize);
/* New instance of type XM_CALLBACKS_TO_TREE_FILTER */
extern T0* GE_new97(T1 initialize);
/* New instance of type XM_DOCUMENT */
extern T0* GE_new98(T1 initialize);
/* New instance of type XM_ELEMENT */
extern T0* GE_new99(T1 initialize);
/* New instance of type XM_STOP_ON_ERROR_FILTER */
extern T0* GE_new100(T1 initialize);
/* New instance of type XM_POSITION_TABLE */
extern T0* GE_new101(T1 initialize);
/* New instance of type KL_EXECUTION_ENVIRONMENT */
extern T0* GE_new104(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES] */
extern T0* GE_new105(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [GEANT_VARIABLES] */
extern T0* GE_new106(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8] */
extern T0* GE_new107(T1 initialize);
/* New instance of type ARRAY [INTEGER_32] */
extern T0* GE_new108(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [AP_OPTION] */
extern T0* GE_new109(T1 initialize);
/* New instance of type SPECIAL [AP_OPTION] */
extern T0* GE_new111(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [AP_OPTION] */
extern T0* GE_new112(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST] */
extern T0* GE_new113(T1 initialize);
/* New instance of type SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
extern T0* GE_new114(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST] */
extern T0* GE_new115(T1 initialize);
/* New instance of type UC_STRING */
extern T0* GE_new116(T1 initialize);
/* New instance of type STRING_TO_INTEGER_CONVERTOR */
extern T0* GE_new118(T1 initialize);
/* New instance of type DS_LINKED_LIST [XM_ELEMENT] */
extern T0* GE_new120(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [XM_ELEMENT] */
extern T0* GE_new121(T1 initialize);
/* New instance of type GEANT_INHERIT_ELEMENT */
extern T0* GE_new122(T1 initialize);
/* New instance of type GEANT_INHERIT */
extern T0* GE_new123(T1 initialize);
/* New instance of type SPECIAL [GEANT_TARGET] */
extern T0* GE_new124(T6 a1, T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [GEANT_TARGET, STRING_8] */
extern T0* GE_new126(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8] */
extern T0* GE_new128(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_TARGET] */
extern T0* GE_new129(T1 initialize);
/* New instance of type XM_EIFFEL_SCANNER */
extern T0* GE_new132(T1 initialize);
/* New instance of type XM_DEFAULT_POSITION */
extern T0* GE_new133(T1 initialize);
/* New instance of type DS_BILINKED_LIST [XM_POSITION] */
extern T0* GE_new135(T1 initialize);
/* New instance of type DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
extern T0* GE_new136(T1 initialize);
/* New instance of type XM_CALLBACKS_NULL */
extern T0* GE_new137(T1 initialize);
/* New instance of type DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
extern T0* GE_new138(T1 initialize);
/* New instance of type XM_NULL_EXTERNAL_RESOLVER */
extern T0* GE_new140(T1 initialize);
/* New instance of type SPECIAL [ANY] */
extern T0* GE_new141(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ANY] */
extern T0* GE_new142(T1 initialize);
/* New instance of type XM_EIFFEL_PARSER_NAME */
extern T0* GE_new143(T1 initialize);
/* New instance of type XM_EIFFEL_DECLARATION */
extern T0* GE_new144(T1 initialize);
/* New instance of type XM_DTD_EXTERNAL_ID */
extern T0* GE_new145(T1 initialize);
/* New instance of type DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new146(T1 initialize);
/* New instance of type XM_DTD_ELEMENT_CONTENT */
extern T0* GE_new147(T1 initialize);
/* New instance of type DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new148(T1 initialize);
/* New instance of type XM_DTD_ATTRIBUTE_CONTENT */
extern T0* GE_new149(T1 initialize);
/* New instance of type DS_BILINKED_LIST [STRING_8] */
extern T0* GE_new150(T1 initialize);
/* New instance of type SPECIAL [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new151(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new152(T1 initialize);
/* New instance of type SPECIAL [XM_EIFFEL_DECLARATION] */
extern T0* GE_new153(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
extern T0* GE_new154(T1 initialize);
/* New instance of type SPECIAL [BOOLEAN] */
extern T0* GE_new155(T6 a1, T1 initialize);
/* New instance of type SPECIAL [XM_DTD_EXTERNAL_ID] */
extern T0* GE_new156(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
extern T0* GE_new157(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [BOOLEAN] */
extern T0* GE_new158(T1 initialize);
/* New instance of type SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
extern T0* GE_new159(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
extern T0* GE_new160(T1 initialize);
/* New instance of type SPECIAL [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new161(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new162(T1 initialize);
/* New instance of type SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
extern T0* GE_new164(T6 a1, T1 initialize);
/* New instance of type SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new166(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
extern T0* GE_new167(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new168(T1 initialize);
/* New instance of type SPECIAL [DS_BILINKED_LIST [STRING_8]] */
extern T0* GE_new169(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
extern T0* GE_new170(T1 initialize);
/* New instance of type XM_EIFFEL_ENTITY_DEF */
extern T0* GE_new171(T1 initialize);
/* New instance of type XM_DTD_CALLBACKS_NULL */
extern T0* GE_new173(T1 initialize);
/* New instance of type XM_EIFFEL_SCANNER_DTD */
extern T0* GE_new174(T1 initialize);
/* New instance of type XM_EIFFEL_PE_ENTITY_DEF */
extern T0* GE_new176(T1 initialize);
/* New instance of type XM_NAMESPACE_RESOLVER */
extern T0* GE_new177(T1 initialize);
/* New instance of type SPECIAL [XM_CALLBACKS_FILTER] */
extern T0* GE_new178(T6 a1, T1 initialize);
/* New instance of type ARRAY [XM_CALLBACKS_FILTER] */
extern T0* GE_new179(T1 initialize);
/* New instance of type DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
extern T0* GE_new180(T1 initialize);
/* New instance of type SPECIAL [GEANT_ARGUMENT_VARIABLES] */
extern T0* GE_new181(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES] */
extern T0* GE_new182(T1 initialize);
/* New instance of type SPECIAL [GEANT_VARIABLES] */
extern T0* GE_new183(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_VARIABLES] */
extern T0* GE_new184(T1 initialize);
/* New instance of type ARRAY [AP_OPTION] */
extern T0* GE_new186(T1 initialize);
/* New instance of type ARRAY [AP_ALTERNATIVE_OPTIONS_LIST] */
extern T0* GE_new187(T1 initialize);
/* New instance of type C_STRING */
extern T0* GE_new188(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [GEANT_TARGET] */
extern T0* GE_new190(T1 initialize);
/* New instance of type GEANT_TASK_FACTORY */
extern T0* GE_new191(T1 initialize);
/* New instance of type GEANT_PARENT */
extern T0* GE_new192(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [GEANT_PARENT] */
extern T0* GE_new194(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [GEANT_PARENT] */
extern T0* GE_new195(T1 initialize);
/* New instance of type GEANT_INTERPRETING_ELEMENT */
extern T0* GE_new196(T1 initialize);
/* New instance of type GEANT_ARGUMENT_ELEMENT */
extern T0* GE_new197(T1 initialize);
/* New instance of type GEANT_LOCAL_ELEMENT */
extern T0* GE_new198(T1 initialize);
/* New instance of type GEANT_GLOBAL_ELEMENT */
extern T0* GE_new199(T1 initialize);
/* New instance of type XM_ATTRIBUTE */
extern T0* GE_new200(T1 initialize);
/* New instance of type GEANT_GROUP */
extern T0* GE_new201(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [XM_NODE] */
extern T0* GE_new203(T1 initialize);
/* New instance of type UC_UTF8_ROUTINES */
extern T0* GE_new204(T1 initialize);
/* New instance of type UC_UTF8_STRING */
extern T0* GE_new205(T1 initialize);
/* New instance of type XM_EIFFEL_INPUT_STREAM */
extern T0* GE_new206(T1 initialize);
/* New instance of type KL_INTEGER_ROUTINES */
extern T0* GE_new207(T1 initialize);
/* New instance of type KL_PLATFORM */
extern T0* GE_new208(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
extern T0* GE_new209(T1 initialize);
/* New instance of type DS_PAIR [XM_POSITION, XM_NODE] */
extern T0* GE_new210(T1 initialize);
/* New instance of type INTEGER_OVERFLOW_CHECKER */
extern T0* GE_new211(T1 initialize);
/* New instance of type DS_LINKABLE [XM_ELEMENT] */
extern T0* GE_new212(T1 initialize);
/* New instance of type GEANT_PARENT_ELEMENT */
extern T0* GE_new213(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_TARGET, STRING_8] */
extern T0* GE_new215(T1 initialize);
/* New instance of type ARRAY [GEANT_TARGET] */
extern T0* GE_new216(T1 initialize);
/* New instance of type XM_EIFFEL_CHARACTER_ENTITY */
extern T0* GE_new217(T1 initialize);
/* New instance of type YY_BUFFER */
extern T0* GE_new218(T1 initialize);
/* New instance of type YY_FILE_BUFFER */
extern T0* GE_new219(T1 initialize);
/* New instance of type DS_LINKED_STACK [INTEGER_32] */
extern T0* GE_new222(T1 initialize);
/* New instance of type DS_BILINKABLE [XM_POSITION] */
extern T0* GE_new223(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [XM_POSITION] */
extern T0* GE_new224(T1 initialize);
/* New instance of type DS_LINKABLE [XM_EIFFEL_SCANNER] */
extern T0* GE_new225(T1 initialize);
/* New instance of type SPECIAL [XM_EIFFEL_ENTITY_DEF] */
extern T0* GE_new226(T6 a1, T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8] */
extern T0* GE_new227(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
extern T0* GE_new229(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
extern T0* GE_new231(T1 initialize);
/* New instance of type ARRAY [ANY] */
extern T0* GE_new232(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new233(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new234(T1 initialize);
/* New instance of type DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new235(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new236(T1 initialize);
/* New instance of type DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new237(T1 initialize);
/* New instance of type DS_LINKED_LIST [STRING_8] */
extern T0* GE_new238(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [STRING_8] */
extern T0* GE_new239(T1 initialize);
/* New instance of type DS_BILINKABLE [STRING_8] */
extern T0* GE_new240(T1 initialize);
/* New instance of type ARRAY [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new241(T1 initialize);
/* New instance of type ARRAY [XM_EIFFEL_DECLARATION] */
extern T0* GE_new242(T1 initialize);
/* New instance of type ARRAY [XM_DTD_EXTERNAL_ID] */
extern T0* GE_new243(T1 initialize);
/* New instance of type ARRAY [BOOLEAN] */
extern T0* GE_new244(T1 initialize);
/* New instance of type ARRAY [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
extern T0* GE_new245(T1 initialize);
/* New instance of type ARRAY [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new246(T1 initialize);
/* New instance of type ARRAY [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
extern T0* GE_new247(T1 initialize);
/* New instance of type ARRAY [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new248(T1 initialize);
/* New instance of type ARRAY [DS_BILINKED_LIST [STRING_8]] */
extern T0* GE_new249(T1 initialize);
/* New instance of type XM_NAMESPACE_RESOLVER_CONTEXT */
extern T0* GE_new250(T1 initialize);
/* New instance of type DS_LINKED_QUEUE [STRING_8] */
extern T0* GE_new252(T1 initialize);
/* New instance of type ARRAY [GEANT_ARGUMENT_VARIABLES] */
extern T0* GE_new253(T1 initialize);
/* New instance of type ARRAY [GEANT_VARIABLES] */
extern T0* GE_new254(T1 initialize);
/* New instance of type SPECIAL [NATURAL_8] */
extern T0* GE_new255(T6 a1, T1 initialize);
/* New instance of type GEANT_STRING_INTERPRETER */
extern T0* GE_new256(T1 initialize);
/* New instance of type KL_ARRAY_ROUTINES [INTEGER_32] */
extern T0* GE_new259(T1 initialize);
/* New instance of type MANAGED_POINTER */
extern T0* GE_new261(T1 initialize);
/* New instance of type DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
extern T0* GE_new262(T1 initialize);
/* New instance of type GEANT_GEC_TASK */
extern T0* GE_new263(T1 initialize);
/* New instance of type [attached] TUPLE [XM_ELEMENT] */
extern T0* GE_new264(T1 initialize);
/* New instance of type detachable TUPLE */
extern T0* GE_new265(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEC_TASK] */
extern T0* GE_new266(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_TASK_FACTORY] */
extern T0* GE_new267(T1 initialize);
/* New instance of type GEANT_ISE_TASK */
extern T0* GE_new270(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_ISE_TASK] */
extern T0* GE_new271(T1 initialize);
/* New instance of type GEANT_EXEC_TASK */
extern T0* GE_new272(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_EXEC_TASK] */
extern T0* GE_new273(T1 initialize);
/* New instance of type GEANT_LCC_TASK */
extern T0* GE_new274(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_LCC_TASK] */
extern T0* GE_new275(T1 initialize);
/* New instance of type GEANT_SET_TASK */
extern T0* GE_new276(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_SET_TASK] */
extern T0* GE_new277(T1 initialize);
/* New instance of type GEANT_UNSET_TASK */
extern T0* GE_new278(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_UNSET_TASK] */
extern T0* GE_new279(T1 initialize);
/* New instance of type GEANT_GEXACE_TASK */
extern T0* GE_new280(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEXACE_TASK] */
extern T0* GE_new281(T1 initialize);
/* New instance of type GEANT_GELEX_TASK */
extern T0* GE_new282(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GELEX_TASK] */
extern T0* GE_new283(T1 initialize);
/* New instance of type GEANT_GEYACC_TASK */
extern T0* GE_new284(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEYACC_TASK] */
extern T0* GE_new285(T1 initialize);
/* New instance of type GEANT_GEPP_TASK */
extern T0* GE_new286(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEPP_TASK] */
extern T0* GE_new287(T1 initialize);
/* New instance of type GEANT_GETEST_TASK */
extern T0* GE_new288(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GETEST_TASK] */
extern T0* GE_new289(T1 initialize);
/* New instance of type GEANT_GEANT_TASK */
extern T0* GE_new290(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEANT_TASK] */
extern T0* GE_new291(T1 initialize);
/* New instance of type GEANT_ECHO_TASK */
extern T0* GE_new292(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_ECHO_TASK] */
extern T0* GE_new293(T1 initialize);
/* New instance of type GEANT_MKDIR_TASK */
extern T0* GE_new294(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_MKDIR_TASK] */
extern T0* GE_new295(T1 initialize);
/* New instance of type GEANT_DELETE_TASK */
extern T0* GE_new296(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_DELETE_TASK] */
extern T0* GE_new297(T1 initialize);
/* New instance of type GEANT_COPY_TASK */
extern T0* GE_new298(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_COPY_TASK] */
extern T0* GE_new299(T1 initialize);
/* New instance of type GEANT_MOVE_TASK */
extern T0* GE_new300(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_MOVE_TASK] */
extern T0* GE_new301(T1 initialize);
/* New instance of type GEANT_SETENV_TASK */
extern T0* GE_new302(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_SETENV_TASK] */
extern T0* GE_new303(T1 initialize);
/* New instance of type GEANT_XSLT_TASK */
extern T0* GE_new304(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_XSLT_TASK] */
extern T0* GE_new305(T1 initialize);
/* New instance of type GEANT_OUTOFDATE_TASK */
extern T0* GE_new306(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_OUTOFDATE_TASK] */
extern T0* GE_new307(T1 initialize);
/* New instance of type GEANT_EXIT_TASK */
extern T0* GE_new308(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_EXIT_TASK] */
extern T0* GE_new309(T1 initialize);
/* New instance of type GEANT_PRECURSOR_TASK */
extern T0* GE_new310(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_PRECURSOR_TASK] */
extern T0* GE_new311(T1 initialize);
/* New instance of type GEANT_AVAILABLE_TASK */
extern T0* GE_new312(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_AVAILABLE_TASK] */
extern T0* GE_new313(T1 initialize);
/* New instance of type GEANT_INPUT_TASK */
extern T0* GE_new314(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_INPUT_TASK] */
extern T0* GE_new315(T1 initialize);
/* New instance of type GEANT_REPLACE_TASK */
extern T0* GE_new316(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_REPLACE_TASK] */
extern T0* GE_new317(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_PARENT] */
extern T0* GE_new318(T1 initialize);
/* New instance of type SPECIAL [GEANT_PARENT] */
extern T0* GE_new319(T6 a1, T1 initialize);
/* New instance of type UC_UNICODE_ROUTINES */
extern T0* GE_new321(T1 initialize);
/* New instance of type DS_LINKED_QUEUE [CHARACTER_8] */
extern T0* GE_new324(T1 initialize);
/* New instance of type UC_UTF16_ROUTINES */
extern T0* GE_new325(T1 initialize);
/* New instance of type DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
extern T0* GE_new326(T1 initialize);
/* New instance of type SPECIAL [NATURAL_64] */
extern T0* GE_new327(T6 a1, T1 initialize);
/* New instance of type GEANT_RENAME_ELEMENT */
extern T0* GE_new328(T1 initialize);
/* New instance of type GEANT_REDEFINE_ELEMENT */
extern T0* GE_new329(T1 initialize);
/* New instance of type GEANT_SELECT_ELEMENT */
extern T0* GE_new330(T1 initialize);
/* New instance of type GEANT_RENAME */
extern T0* GE_new331(T1 initialize);
/* New instance of type DS_HASH_TABLE [GEANT_RENAME, STRING_8] */
extern T0* GE_new332(T1 initialize);
/* New instance of type GEANT_REDEFINE */
extern T0* GE_new333(T1 initialize);
/* New instance of type DS_HASH_TABLE [GEANT_REDEFINE, STRING_8] */
extern T0* GE_new334(T1 initialize);
/* New instance of type GEANT_SELECT */
extern T0* GE_new335(T1 initialize);
/* New instance of type DS_HASH_TABLE [GEANT_SELECT, STRING_8] */
extern T0* GE_new336(T1 initialize);
/* New instance of type DS_LINKABLE [INTEGER_32] */
extern T0* GE_new338(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
extern T0* GE_new339(T1 initialize);
/* New instance of type ARRAY [XM_EIFFEL_ENTITY_DEF] */
extern T0* GE_new340(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new341(T1 initialize);
/* New instance of type DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new342(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [STRING_8] */
extern T0* GE_new343(T1 initialize);
/* New instance of type DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
extern T0* GE_new345(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
extern T0* GE_new346(T1 initialize);
/* New instance of type DS_LINKABLE [STRING_8] */
extern T0* GE_new347(T1 initialize);
/* New instance of type GEANT_NAME_VALUE_ELEMENT */
extern T0* GE_new348(T1 initialize);
/* New instance of type KL_ARRAY_ROUTINES [detachable STRING_8] */
extern T0* GE_new349(T1 initialize);
/* New instance of type AP_OPTION_COMPARATOR */
extern T0* GE_new350(T1 initialize);
/* New instance of type DS_QUICK_SORTER [AP_OPTION] */
extern T0* GE_new351(T1 initialize);
/* New instance of type ST_WORD_WRAPPER */
extern T0* GE_new353(T1 initialize);
/* New instance of type DS_HASH_SET [XM_NAMESPACE] */
extern T0* GE_new355(T1 initialize);
/* New instance of type XM_COMMENT */
extern T0* GE_new356(T1 initialize);
/* New instance of type XM_PROCESSING_INSTRUCTION */
extern T0* GE_new357(T1 initialize);
/* New instance of type XM_CHARACTER_DATA */
extern T0* GE_new358(T1 initialize);
/* New instance of type XM_NAMESPACE */
extern T0* GE_new359(T1 initialize);
/* New instance of type DS_LINKABLE [XM_NODE] */
extern T0* GE_new362(T1 initialize);
/* New instance of type XM_NODE_TYPER */
extern T0* GE_new364(T1 initialize);
/* New instance of type KL_CHARACTER_BUFFER */
extern T0* GE_new368(T1 initialize);
/* New instance of type EXCEPTIONS */
extern T0* GE_new370(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
extern T0* GE_new372(T1 initialize);
/* New instance of type SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
extern T0* GE_new374(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
extern T0* GE_new375(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
extern T0* GE_new376(T1 initialize);
/* New instance of type GEANT_GEC_COMMAND */
extern T0* GE_new377(T1 initialize);
/* New instance of type DS_CELL [PROCEDURE [ANY, TUPLE]] */
extern T0* GE_new378(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_GEC_TASK, [attached] TUPLE] */
extern T0* GE_new379(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GEC_TASK] */
extern T0* GE_new380(T1 initialize);
/* New instance of type GEANT_ISE_COMMAND */
extern T0* GE_new381(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_ISE_TASK, [attached] TUPLE] */
extern T0* GE_new382(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_ISE_TASK] */
extern T0* GE_new383(T1 initialize);
/* New instance of type GEANT_FILESET_ELEMENT */
extern T0* GE_new384(T1 initialize);
/* New instance of type GEANT_EXEC_COMMAND */
extern T0* GE_new385(T1 initialize);
/* New instance of type GEANT_STRING_PROPERTY */
extern T0* GE_new386(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_INTERPRETING_ELEMENT, [attached] TUPLE, STRING_8] */
extern T0* GE_new387(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_INTERPRETING_ELEMENT, STRING_8] */
extern T0* GE_new388(T1 initialize);
/* New instance of type GEANT_BOOLEAN_PROPERTY */
extern T0* GE_new389(T1 initialize);
/* New instance of type GEANT_FILESET */
extern T0* GE_new390(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_EXEC_TASK, [attached] TUPLE] */
extern T0* GE_new391(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_EXEC_TASK] */
extern T0* GE_new392(T1 initialize);
/* New instance of type GEANT_LCC_COMMAND */
extern T0* GE_new393(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_LCC_TASK, [attached] TUPLE] */
extern T0* GE_new394(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_LCC_TASK] */
extern T0* GE_new395(T1 initialize);
/* New instance of type GEANT_SET_COMMAND */
extern T0* GE_new396(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_SET_TASK, [attached] TUPLE] */
extern T0* GE_new397(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_SET_TASK] */
extern T0* GE_new398(T1 initialize);
/* New instance of type GEANT_UNSET_COMMAND */
extern T0* GE_new399(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_UNSET_TASK, [attached] TUPLE] */
extern T0* GE_new400(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_UNSET_TASK] */
extern T0* GE_new401(T1 initialize);
/* New instance of type GEANT_DEFINE_ELEMENT */
extern T0* GE_new402(T1 initialize);
/* New instance of type GEANT_GEXACE_COMMAND */
extern T0* GE_new403(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_GEXACE_TASK, [attached] TUPLE] */
extern T0* GE_new404(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GEXACE_TASK] */
extern T0* GE_new405(T1 initialize);
/* New instance of type GEANT_GELEX_COMMAND */
extern T0* GE_new406(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_GELEX_TASK, [attached] TUPLE] */
extern T0* GE_new407(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GELEX_TASK] */
extern T0* GE_new408(T1 initialize);
/* New instance of type GEANT_GEYACC_COMMAND */
extern T0* GE_new409(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_GEYACC_TASK, [attached] TUPLE] */
extern T0* GE_new410(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GEYACC_TASK] */
extern T0* GE_new411(T1 initialize);
/* New instance of type GEANT_GEPP_COMMAND */
extern T0* GE_new412(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_GEPP_TASK, [attached] TUPLE] */
extern T0* GE_new413(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GEPP_TASK] */
extern T0* GE_new414(T1 initialize);
/* New instance of type GEANT_GETEST_COMMAND */
extern T0* GE_new415(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_GETEST_TASK, [attached] TUPLE] */
extern T0* GE_new416(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GETEST_TASK] */
extern T0* GE_new417(T1 initialize);
/* New instance of type GEANT_GEANT_COMMAND */
extern T0* GE_new418(T1 initialize);
/* New instance of type ST_SPLITTER */
extern T0* GE_new419(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_GEANT_TASK, [attached] TUPLE] */
extern T0* GE_new420(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GEANT_TASK] */
extern T0* GE_new421(T1 initialize);
/* New instance of type GEANT_ECHO_COMMAND */
extern T0* GE_new422(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_ECHO_TASK, [attached] TUPLE] */
extern T0* GE_new423(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_ECHO_TASK] */
extern T0* GE_new424(T1 initialize);
/* New instance of type GEANT_MKDIR_COMMAND */
extern T0* GE_new425(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_MKDIR_TASK, [attached] TUPLE] */
extern T0* GE_new426(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_MKDIR_TASK] */
extern T0* GE_new427(T1 initialize);
/* New instance of type GEANT_DIRECTORYSET_ELEMENT */
extern T0* GE_new428(T1 initialize);
/* New instance of type GEANT_DELETE_COMMAND */
extern T0* GE_new429(T1 initialize);
/* New instance of type GEANT_DIRECTORYSET */
extern T0* GE_new430(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_DELETE_TASK, [attached] TUPLE] */
extern T0* GE_new431(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_DELETE_TASK] */
extern T0* GE_new432(T1 initialize);
/* New instance of type GEANT_COPY_COMMAND */
extern T0* GE_new433(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_COPY_TASK, [attached] TUPLE] */
extern T0* GE_new434(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_COPY_TASK] */
extern T0* GE_new435(T1 initialize);
/* New instance of type GEANT_MOVE_COMMAND */
extern T0* GE_new436(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_MOVE_TASK, [attached] TUPLE] */
extern T0* GE_new437(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_MOVE_TASK] */
extern T0* GE_new438(T1 initialize);
/* New instance of type GEANT_SETENV_COMMAND */
extern T0* GE_new439(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_SETENV_TASK, [attached] TUPLE] */
extern T0* GE_new440(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_SETENV_TASK] */
extern T0* GE_new441(T1 initialize);
/* New instance of type DS_PAIR [STRING_8, STRING_8] */
extern T0* GE_new442(T1 initialize);
/* New instance of type GEANT_XSLT_COMMAND */
extern T0* GE_new443(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]] */
extern T0* GE_new444(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_XSLT_TASK, [attached] TUPLE] */
extern T0* GE_new445(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_XSLT_TASK] */
extern T0* GE_new446(T1 initialize);
/* New instance of type GEANT_OUTOFDATE_COMMAND */
extern T0* GE_new447(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_OUTOFDATE_TASK, [attached] TUPLE] */
extern T0* GE_new448(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_OUTOFDATE_TASK] */
extern T0* GE_new449(T1 initialize);
/* New instance of type GEANT_EXIT_COMMAND */
extern T0* GE_new450(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_EXIT_TASK, [attached] TUPLE] */
extern T0* GE_new451(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_EXIT_TASK] */
extern T0* GE_new452(T1 initialize);
/* New instance of type GEANT_PRECURSOR_COMMAND */
extern T0* GE_new453(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_PRECURSOR_TASK, [attached] TUPLE] */
extern T0* GE_new454(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_PRECURSOR_TASK] */
extern T0* GE_new455(T1 initialize);
/* New instance of type GEANT_AVAILABLE_COMMAND */
extern T0* GE_new456(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_AVAILABLE_TASK, [attached] TUPLE] */
extern T0* GE_new457(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_AVAILABLE_TASK] */
extern T0* GE_new458(T1 initialize);
/* New instance of type GEANT_INPUT_COMMAND */
extern T0* GE_new459(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_INPUT_TASK, [attached] TUPLE] */
extern T0* GE_new460(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_INPUT_TASK] */
extern T0* GE_new461(T1 initialize);
/* New instance of type GEANT_REPLACE_COMMAND */
extern T0* GE_new462(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_REPLACE_TASK, [attached] TUPLE] */
extern T0* GE_new463(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_REPLACE_TASK] */
extern T0* GE_new464(T1 initialize);
/* New instance of type ARRAY [GEANT_PARENT] */
extern T0* GE_new465(T1 initialize);
/* New instance of type SPECIAL [ARRAY [INTEGER_32]] */
extern T0* GE_new466(T6 a1, T1 initialize);
/* New instance of type SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
extern T0* GE_new467(T6 a1, T1 initialize);
/* New instance of type DS_LINKABLE [CHARACTER_8] */
extern T0* GE_new468(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [GEANT_RENAME] */
extern T0* GE_new469(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [GEANT_RENAME, STRING_8] */
extern T0* GE_new470(T1 initialize);
/* New instance of type SPECIAL [GEANT_RENAME] */
extern T0* GE_new472(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8] */
extern T0* GE_new473(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_RENAME] */
extern T0* GE_new474(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [GEANT_REDEFINE] */
extern T0* GE_new475(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [GEANT_REDEFINE, STRING_8] */
extern T0* GE_new476(T1 initialize);
/* New instance of type SPECIAL [GEANT_REDEFINE] */
extern T0* GE_new478(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8] */
extern T0* GE_new479(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_REDEFINE] */
extern T0* GE_new480(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [GEANT_SELECT] */
extern T0* GE_new481(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [GEANT_SELECT, STRING_8] */
extern T0* GE_new482(T1 initialize);
/* New instance of type SPECIAL [GEANT_SELECT] */
extern T0* GE_new484(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8] */
extern T0* GE_new485(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_SELECT] */
extern T0* GE_new486(T1 initialize);
/* New instance of type DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
extern T0* GE_new488(T1 initialize);
/* New instance of type KL_DIRECTORY */
extern T0* GE_new489(T1 initialize);
/* New instance of type KL_STRING_INPUT_STREAM */
extern T0* GE_new490(T1 initialize);
/* New instance of type KL_ARRAY [detachable STRING_8] */
extern T0* GE_new491(T1 initialize);
/* New instance of type SPECIAL [XM_NAMESPACE] */
extern T0* GE_new492(T6 a1, T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [XM_NAMESPACE] */
extern T0* GE_new493(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [XM_NAMESPACE] */
extern T0* GE_new494(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
extern T0* GE_new495(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
extern T0* GE_new496(T1 initialize);
/* New instance of type ARRAY [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
extern T0* GE_new497(T1 initialize);
/* New instance of type GEANT_MAP_ELEMENT */
extern T0* GE_new500(T1 initialize);
/* New instance of type GEANT_MAP */
extern T0* GE_new501(T1 initialize);
/* New instance of type DS_HASH_SET [GEANT_FILESET_ENTRY] */
extern T0* GE_new504(T1 initialize);
/* New instance of type DS_HASH_SET [STRING_8] */
extern T0* GE_new506(T1 initialize);
/* New instance of type LX_DFA_WILDCARD */
extern T0* GE_new508(T1 initialize);
/* New instance of type DS_HASH_SET [INTEGER_32] */
extern T0* GE_new510(T1 initialize);
/* New instance of type DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8]]] */
extern T0* GE_new511(T1 initialize);
/* New instance of type [attached] TUPLE [STRING_8] */
extern T0* GE_new512(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_ECHO_COMMAND, [attached] TUPLE [STRING_8]] */
extern T0* GE_new513(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_ECHO_COMMAND] */
extern T0* GE_new514(T1 initialize);
/* New instance of type DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]]] */
extern T0* GE_new516(T1 initialize);
/* New instance of type KL_TEXT_OUTPUT_FILE */
extern T0* GE_new517(T1 initialize);
/* New instance of type [attached] TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN] */
extern T0* GE_new518(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_ECHO_COMMAND, [attached] TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]] */
extern T0* GE_new519(T1 initialize);
/* New instance of type [attached] PROCEDURE [GEANT_MKDIR_COMMAND, [attached] TUPLE [STRING_8]] */
extern T0* GE_new521(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_MKDIR_COMMAND] */
extern T0* GE_new522(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]] */
extern T0* GE_new523(T1 initialize);
/* New instance of type SPECIAL [DS_PAIR [STRING_8, STRING_8]] */
extern T0* GE_new524(T6 a1, T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING_8, STRING_8]] */
extern T0* GE_new525(T1 initialize);
/* New instance of type DS_CELL [FUNCTION [ANY, TUPLE [STRING_8], BOOLEAN]] */
extern T0* GE_new526(T1 initialize);
/* New instance of type [attached] PREDICATE [GEANT_AVAILABLE_COMMAND, [attached] TUPLE [STRING_8]] */
extern T0* GE_new527(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_AVAILABLE_COMMAND] */
extern T0* GE_new528(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_RENAME, STRING_8] */
extern T0* GE_new530(T1 initialize);
/* New instance of type ARRAY [GEANT_RENAME] */
extern T0* GE_new531(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_REDEFINE, STRING_8] */
extern T0* GE_new532(T1 initialize);
/* New instance of type ARRAY [GEANT_REDEFINE] */
extern T0* GE_new533(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_SELECT, STRING_8] */
extern T0* GE_new534(T1 initialize);
/* New instance of type ARRAY [GEANT_SELECT] */
extern T0* GE_new535(T1 initialize);
/* New instance of type ARRAY [XM_NAMESPACE] */
extern T0* GE_new540(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY] */
extern T0* GE_new542(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY] */
extern T0* GE_new543(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY] */
extern T0* GE_new544(T1 initialize);
/* New instance of type GEANT_FILESET_ENTRY */
extern T0* GE_new545(T1 initialize);
/* New instance of type SPECIAL [GEANT_FILESET_ENTRY] */
extern T0* GE_new546(T6 a1, T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [STRING_8] */
extern T0* GE_new547(T1 initialize);
/* New instance of type LX_WILDCARD_PARSER */
extern T0* GE_new548(T1 initialize);
/* New instance of type LX_DESCRIPTION */
extern T0* GE_new549(T1 initialize);
/* New instance of type LX_FULL_DFA */
extern T0* GE_new550(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [INTEGER_32] */
extern T0* GE_new552(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [INTEGER_32] */
extern T0* GE_new553(T1 initialize);
/* New instance of type ARRAY [DS_PAIR [STRING_8, STRING_8]] */
extern T0* GE_new554(T1 initialize);
/* New instance of type KL_NULL_TEXT_OUTPUT_STREAM */
extern T0* GE_new558(T1 initialize);
/* New instance of type DP_SHELL_COMMAND */
extern T0* GE_new560(T1 initialize);
/* New instance of type DS_CELL [BOOLEAN] */
extern T0* GE_new561(T1 initialize);
/* New instance of type KL_BOOLEAN_ROUTINES */
extern T0* GE_new563(T1 initialize);
/* New instance of type GEANT_VARIABLES_VARIABLE_RESOLVER */
extern T0* GE_new564(T1 initialize);
/* New instance of type RX_PCRE_REGULAR_EXPRESSION */
extern T0* GE_new565(T1 initialize);
/* New instance of type KL_STRING_EQUALITY_TESTER */
extern T0* GE_new566(T1 initialize);
/* New instance of type KL_STDIN_FILE */
extern T0* GE_new567(T1 initialize);
/* New instance of type ARRAY [GEANT_FILESET_ENTRY] */
extern T0* GE_new570(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [LX_RULE] */
extern T0* GE_new571(T1 initialize);
/* New instance of type LX_START_CONDITIONS */
extern T0* GE_new572(T1 initialize);
/* New instance of type LX_ACTION_FACTORY */
extern T0* GE_new573(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [INTEGER_32] */
extern T0* GE_new574(T1 initialize);
/* New instance of type DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8] */
extern T0* GE_new575(T1 initialize);
/* New instance of type LX_SYMBOL_CLASS */
extern T0* GE_new576(T1 initialize);
/* New instance of type SPECIAL [LX_SYMBOL_CLASS] */
extern T0* GE_new577(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS] */
extern T0* GE_new578(T1 initialize);
/* New instance of type LX_NFA */
extern T0* GE_new579(T1 initialize);
/* New instance of type LX_EQUIVALENCE_CLASSES */
extern T0* GE_new580(T1 initialize);
/* New instance of type LX_RULE */
extern T0* GE_new581(T1 initialize);
/* New instance of type SPECIAL [LX_NFA] */
extern T0* GE_new582(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_NFA] */
extern T0* GE_new583(T1 initialize);
/* New instance of type UT_SYNTAX_ERROR */
extern T0* GE_new584(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
extern T0* GE_new585(T1 initialize);
/* New instance of type LX_UNRECOGNIZED_RULE_ERROR */
extern T0* GE_new586(T1 initialize);
/* New instance of type LX_MISSING_QUOTE_ERROR */
extern T0* GE_new587(T1 initialize);
/* New instance of type LX_BAD_CHARACTER_CLASS_ERROR */
extern T0* GE_new588(T1 initialize);
/* New instance of type LX_BAD_CHARACTER_ERROR */
extern T0* GE_new589(T1 initialize);
/* New instance of type LX_FULL_AND_META_ERROR */
extern T0* GE_new590(T1 initialize);
/* New instance of type LX_FULL_AND_REJECT_ERROR */
extern T0* GE_new591(T1 initialize);
/* New instance of type LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR */
extern T0* GE_new592(T1 initialize);
/* New instance of type LX_CHARACTER_OUT_OF_RANGE_ERROR */
extern T0* GE_new593(T1 initialize);
/* New instance of type SPECIAL [LX_RULE] */
extern T0* GE_new594(T6 a1, T1 initialize);
/* New instance of type ARRAY [LX_RULE] */
extern T0* GE_new595(T1 initialize);
/* New instance of type LX_DFA_STATE */
extern T0* GE_new596(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [LX_NFA_STATE] */
extern T0* GE_new597(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [LX_DFA_STATE] */
extern T0* GE_new598(T1 initialize);
/* New instance of type LX_SYMBOL_PARTITIONS */
extern T0* GE_new599(T1 initialize);
/* New instance of type KL_ARRAY_ROUTINES [LX_RULE] */
extern T0* GE_new600(T1 initialize);
/* New instance of type LX_START_CONDITION */
extern T0* GE_new601(T1 initialize);
/* New instance of type LX_TRANSITION_TABLE [LX_DFA_STATE] */
extern T0* GE_new602(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [LX_NFA] */
extern T0* GE_new603(T1 initialize);
/* New instance of type DS_HASH_TABLE [LX_NFA, INTEGER_32] */
extern T0* GE_new604(T1 initialize);
/* New instance of type LX_NFA_STATE */
extern T0* GE_new605(T1 initialize);
/* New instance of type LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR */
extern T0* GE_new607(T1 initialize);
/* New instance of type RX_BYTE_CODE */
extern T0* GE_new609(T1 initialize);
/* New instance of type RX_CHARACTER_SET */
extern T0* GE_new610(T1 initialize);
/* New instance of type RX_CASE_MAPPING */
extern T0* GE_new611(T1 initialize);
/* New instance of type SPECIAL [RX_CHARACTER_SET] */
extern T0* GE_new613(T6 a1, T1 initialize);
/* New instance of type ARRAY [RX_CHARACTER_SET] */
extern T0* GE_new614(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_RULE] */
extern T0* GE_new615(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_RULE] */
extern T0* GE_new616(T1 initialize);
/* New instance of type SPECIAL [LX_START_CONDITION] */
extern T0* GE_new617(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_START_CONDITION] */
extern T0* GE_new618(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION] */
extern T0* GE_new619(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING_8] */
extern T0* GE_new621(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
extern T0* GE_new623(T1 initialize);
/* New instance of type ARRAY [LX_SYMBOL_CLASS] */
extern T0* GE_new624(T1 initialize);
/* New instance of type LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE] */
extern T0* GE_new625(T1 initialize);
/* New instance of type LX_EPSILON_TRANSITION [LX_NFA_STATE] */
extern T0* GE_new627(T1 initialize);
/* New instance of type LX_SYMBOL_TRANSITION [LX_NFA_STATE] */
extern T0* GE_new629(T1 initialize);
/* New instance of type DS_BILINKABLE [INTEGER_32] */
extern T0* GE_new630(T1 initialize);
/* New instance of type SPECIAL [DS_BILINKABLE [INTEGER_32]] */
extern T0* GE_new631(T6 a1, T1 initialize);
/* New instance of type ARRAY [DS_BILINKABLE [INTEGER_32]] */
extern T0* GE_new632(T1 initialize);
/* New instance of type LX_ACTION */
extern T0* GE_new634(T1 initialize);
/* New instance of type ARRAY [LX_NFA] */
extern T0* GE_new635(T1 initialize);
/* New instance of type DS_BUBBLE_SORTER [LX_NFA_STATE] */
extern T0* GE_new636(T1 initialize);
/* New instance of type DS_BUBBLE_SORTER [LX_RULE] */
extern T0* GE_new638(T1 initialize);
/* New instance of type SPECIAL [LX_NFA_STATE] */
extern T0* GE_new640(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_NFA_STATE] */
extern T0* GE_new642(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE] */
extern T0* GE_new643(T1 initialize);
/* New instance of type SPECIAL [LX_DFA_STATE] */
extern T0* GE_new645(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_DFA_STATE] */
extern T0* GE_new646(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE] */
extern T0* GE_new647(T1 initialize);
/* New instance of type KL_ARRAY [LX_RULE] */
extern T0* GE_new648(T1 initialize);
/* New instance of type ARRAY [LX_DFA_STATE] */
extern T0* GE_new649(T1 initialize);
/* New instance of type KL_ARRAY_ROUTINES [LX_DFA_STATE] */
extern T0* GE_new650(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_NFA] */
extern T0* GE_new651(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [LX_NFA, INTEGER_32] */
extern T0* GE_new653(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32] */
extern T0* GE_new655(T1 initialize);
/* New instance of type KL_BINARY_INPUT_FILE */
extern T0* GE_new656(T1 initialize);
/* New instance of type KL_BINARY_OUTPUT_FILE */
extern T0* GE_new657(T1 initialize);
/* New instance of type FILE_NAME */
extern T0* GE_new659(T1 initialize);
/* New instance of type RAW_FILE */
extern T0* GE_new660(T1 initialize);
/* New instance of type DIRECTORY */
extern T0* GE_new661(T1 initialize);
/* New instance of type ARRAYED_LIST [STRING_8] */
extern T0* GE_new662(T1 initialize);
/* New instance of type KL_COMPARABLE_COMPARATOR [LX_RULE] */
extern T0* GE_new665(T1 initialize);
/* New instance of type KL_COMPARABLE_COMPARATOR [LX_NFA_STATE] */
extern T0* GE_new668(T1 initialize);
/* New instance of type ARRAY [LX_START_CONDITION] */
extern T0* GE_new671(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
extern T0* GE_new672(T1 initialize);
/* New instance of type ARRAY [LX_NFA_STATE] */
extern T0* GE_new673(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [LX_NFA, INTEGER_32] */
extern T0* GE_new674(T1 initialize);
/* New instance of type STRING_SEARCHER */
extern T0* GE_new675(T1 initialize);
/* New instance of type HASH_TABLE [C_STRING, STRING_8] */
extern T0* GE_new676(T1 initialize);
/* New instance of type DS_SHELL_SORTER [INTEGER_32] */
extern T0* GE_new677(T1 initialize);
/* New instance of type KL_COMPARABLE_COMPARATOR [INTEGER_32] */
extern T0* GE_new682(T1 initialize);
/* New instance of type PRIMES */
extern T0* GE_new685(T1 initialize);
/* New instance of type SPECIAL [C_STRING] */
extern T0* GE_new686(T6 a1, T1 initialize);
/* GEANT.make */
extern T0* T21c20(void);
/* GEANT_PROJECT.build */
extern void T22f35(T0* C, T0* a1);
/* GEANT_PROJECT.build_target */
extern void T22f46(T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].remove */
extern void T105f10(T0* C);
/* DS_ARRAYED_STACK [GEANT_TARGET].remove */
extern void T190f11(T0* C);
/* GEANT_PROJECT.execute_target */
extern void T22f49(T0* C, T0* a1, T0* a2, T1 a3, T1 a4);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].remove */
extern void T106f10(T0* C);
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
/* DS_LINKED_LIST_CURSOR [XM_NODE].forth */
extern void T203f11(T0* C);
/* XM_DOCUMENT.cursor_forth */
extern void T98f25(T0* C, T0* a1);
/* XM_DOCUMENT.add_traversing_cursor */
extern void T98f29(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_next_cursor */
extern void T203f16(T0* C, T0* a1);
/* XM_DOCUMENT.remove_traversing_cursor */
extern void T98f30(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set */
extern void T203f14(T0* C, T0* a1, T1 a2, T1 a3);
/* XM_ELEMENT.cursor_forth */
extern void T99f42(T0* C, T0* a1);
/* XM_ELEMENT.add_traversing_cursor */
extern void T99f45(T0* C, T0* a1);
/* XM_ELEMENT.remove_traversing_cursor */
extern void T99f46(T0* C, T0* a1);
/* GEANT_TARGET.execute_element */
extern void T26f83(T0* C, T0* a1);
/* GEANT_TARGET.obsolete_element_name */
extern unsigned char ge12os2339;
extern T0* ge12ov2339;
extern T0* T26f17(T0* C);
/* GEANT_TARGET.argument_element_name */
extern unsigned char ge12os2340;
extern T0* ge12ov2340;
extern T0* T26f15(T0* C);
/* GEANT_TARGET.description_element_name */
extern unsigned char ge78os2389;
extern T0* ge78ov2389;
extern T0* T26f22(T0* C);
/* GEANT_TARGET.execute_task */
extern void T26f84(T0* C, T0* a1);
/* GEANT_PROJECT.new_task */
extern T0* T22f25(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_task */
extern T0* T191f54(T0* C, T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].item */
extern T0* T262f30(T0* C, T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].item_storage_item */
extern T0* T262f32(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].search_position */
extern void T262f56(T0* C, T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].clashes_item */
extern T6 T262f33(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].hash_position */
extern T6 T262f34(T0* C, T0* a1);
/* UC_UTF8_STRING.hash_code */
extern T6 T205f17(T0* C);
/* UC_UTF8_STRING.string */
extern T0* T205f37(T0* C);
/* KL_INTEGER_ROUTINES.to_character */
extern T2 T207f2(T0* C, T6 a1);
/* UC_UTF8_STRING.integer_ */
extern unsigned char ge126os5282;
extern T0* ge126ov5282;
extern T0* T205f25(T0* C);
/* KL_INTEGER_ROUTINES.default_create */
extern T0* T207c4(void);
/* INTEGER_32.is_less_equal */
extern T1 T6f9(T6* C, T6 a1);
/* STRING_8.append_character */
extern void T17f38(T0* C, T2 a1);
/* STRING_8.resize */
extern void T17f40(T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].aliased_resized_area */
extern T0* T15f2(T0* C, T6 a1);
/* INTEGER_32.is_greater_equal */
extern T1 T6f5(T6* C, T6 a1);
/* STRING_8.additional_space */
extern T6 T17f6(T0* C);
/* INTEGER_32.max */
extern T6 T6f10(T6* C, T6 a1);
/* STRING_8.capacity */
extern T6 T17f5(T0* C);
/* UC_UTF8_STRING.byte_item */
extern T2 T205f22(T0* C, T6 a1);
/* UC_UTF8_STRING.old_item */
extern T2 T205f36(T0* C, T6 a1);
/* UC_UTF8_STRING.set_count */
extern void T205f65(T0* C, T6 a1);
/* UC_UTF8_STRING.reset_byte_index_cache */
extern void T205f74(T0* C);
/* STRING_8.make */
extern void T17f37(T0* C, T6 a1);
/* STRING_8.make */
extern T0* T17c37(T6 a1);
/* SPECIAL [CHARACTER_8].make */
extern T0* T15c9(T6 a1);
/* UC_UTF8_STRING.next_byte_index */
extern T6 T205f26(T0* C, T6 a1);
/* UC_UTF8_ROUTINES.encoded_byte_count */
extern T6 T204f3(T0* C, T2 a1);
/* CHARACTER_8.is_less_equal */
extern T1 T2f17(T2* C, T2 a1);
/* CHARACTER_8.is_less */
extern T1 T2f5(T2* C, T2 a1);
/* UC_UTF8_STRING.utf8 */
extern unsigned char ge219os5864;
extern T0* ge219ov5864;
extern T0* T205f27(T0* C);
/* UC_UTF8_ROUTINES.default_create */
extern T0* T204c36(void);
/* KL_PLATFORM.maximum_character_code */
extern unsigned char ge200os7872;
extern T6 ge200ov7872;
extern T6 T208f1(T0* C);
/* UC_UTF8_STRING.platform */
extern unsigned char ge207os4153;
extern T0* ge207ov4153;
extern T0* T205f24(T0* C);
/* KL_PLATFORM.default_create */
extern T0* T208c3(void);
/* UC_UTF8_STRING.item_code_at_byte_index */
extern T6 T205f23(T0* C, T6 a1);
/* UC_UTF8_ROUTINES.encoded_next_value */
extern T6 T204f6(T0* C, T2 a1);
/* UC_UTF8_ROUTINES.encoded_first_value */
extern T6 T204f4(T0* C, T2 a1);
/* UC_UTF8_STRING.hash_code */
extern T6 T205f17p1(T0* C);
/* STRING_8.hash_code */
extern T6 T17f8(T0* C);
/* UC_STRING_EQUALITY_TESTER.test */
extern T1 T59f1(T0* C, T0* a1, T0* a2);
/* UC_STRING_EQUALITY_TESTER.string_ */
extern unsigned char ge128os1766;
extern T0* ge128ov1766;
extern T0* T59f2(T0* C);
/* KL_STRING_ROUTINES.default_create */
extern T0* T76c19(void);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].key_storage_item */
extern T0* T262f31(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].slots_item */
extern T6 T262f21(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].has */
extern T1 T262f29(T0* C, T0* a1);
/* XM_ELEMENT.set_name */
extern void T99f55(T0* C, T0* a1);
/* GEANT_TARGET.set_attribute_name */
extern unsigned char ge12os2342;
extern T0* ge12ov2342;
extern T0* T26f55(T0* C);
/* XM_ELEMENT.cloned_object */
extern T0* T99f26(T0* C);
/* XM_ELEMENT.twin */
extern T0* T99f28(T0* C);
/* XM_ELEMENT.copy */
extern void T99f56(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].put_right */
extern void T362f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].make */
extern T0* T362c3(T0* a1);
/* XM_ELEMENT.is_empty */
extern T1 T99f16(T0* C);
/* XM_ELEMENT.set_internal_cursor */
extern void T99f37(T0* C, T0* a1);
/* XM_ELEMENT.valid_cursor */
extern T1 T99f30(T0* C, T0* a1);
/* XM_ELEMENT.move_all_cursors_after */
extern void T99f54(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_after */
extern void T203f15(T0* C);
/* GEANT_NAME_VALUE_ELEMENT.has_value */
extern T1 T348f4(T0* C);
/* GEANT_NAME_VALUE_ELEMENT.has_attribute */
extern T1 T348f3(T0* C, T0* a1);
/* GEANT_NAME_VALUE_ELEMENT.value_attribute_name */
extern unsigned char ge90os7681;
extern T0* ge90ov7681;
extern T0* T348f2(T0* C);
/* GEANT_NAME_VALUE_ELEMENT.make */
extern T0* T348c5(T0* a1);
/* GEANT_NAME_VALUE_ELEMENT.set_xml_element */
extern void T348f6(T0* C, T0* a1);
/* GEANT_TARGET.global_element_name */
extern unsigned char ge4os2362;
extern T0* ge4ov2362;
extern T0* T26f21(T0* C);
/* GEANT_TARGET.local_element_name */
extern unsigned char ge4os2363;
extern T0* ge4ov2363;
extern T0* T26f19(T0* C);
/* GEANT_TARGET.execute_group_element */
extern void T26f82(T0* C, T0* a1);
/* GEANT_GROUP.execute */
extern void T201f26(T0* C);
/* GEANT_GROUP.has_attribute */
extern T1 T201f18(T0* C, T0* a1);
/* GEANT_GROUP.execute_nested_tasks */
extern void T201f32(T0* C);
/* GEANT_GROUP.execute_element */
extern void T201f37(T0* C, T0* a1);
/* GEANT_GROUP.execute_task */
extern void T201f38(T0* C, T0* a1);
/* GEANT_GROUP.description_element_name */
extern T0* T201f13(T0* C);
/* GEANT_GROUP.global_element_name */
extern T0* T201f20(T0* C);
/* GEANT_GROUP.local_element_name */
extern T0* T201f19(T0* C);
/* GEANT_GROUP.execute_group_element */
extern void T201f36(T0* C, T0* a1);
/* GEANT_GROUP.group_element_name */
extern unsigned char ge4os2361;
extern T0* ge4ov2361;
extern T0* T201f17(T0* C);
/* GEANT_GROUP.string_ */
extern T0* T201f16(T0* C);
/* GEANT_GROUP.prepare_variables_before_execution */
extern void T201f31(T0* C);
/* GEANT_GROUP.exit_application */
extern void T201f30(T0* C, T6 a1, T0* a2);
/* KL_EXCEPTIONS.die */
extern void T48f2(T0* C, T6 a1);
/* GEANT_GROUP.exceptions */
extern unsigned char ge203os1768;
extern T0* ge203ov1768;
extern T0* T201f15(T0* C);
/* KL_EXCEPTIONS.default_create */
extern T0* T48c1(void);
/* KL_STDERR_FILE.put_line */
extern void T47f13(T0* C, T0* a1);
/* KL_STDERR_FILE.put_string */
extern void T47f14(T0* C, T0* a1);
/* KL_STDERR_FILE.old_put_string */
extern void T47f16(T0* C, T0* a1);
/* KL_STDERR_FILE.console_ps */
extern void T47f19(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STRING_ROUTINES.as_string */
extern T0* T76f2(T0* C, T0* a1);
/* STRING_8.string */
extern T0* T17f15(T0* C);
/* STRING_8.make_from_string */
extern T0* T17c43(T0* a1);
/* SPECIAL [CHARACTER_8].copy_data */
extern void T15f11(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [CHARACTER_8].move_data */
extern void T15f12(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].overlapping_move */
extern void T15f14(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].non_overlapping_move */
extern void T15f13(T0* C, T6 a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.as_string */
extern T0* T205f33(T0* C);
/* UC_UTF8_STRING.to_utf8 */
extern T0* T205f20(T0* C);
/* KL_ANY_ROUTINES.same_types */
extern T1 T84f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.any_ */
extern unsigned char ge121os2013;
extern T0* ge121ov2013;
extern T0* T76f8(T0* C);
/* KL_ANY_ROUTINES.default_create */
extern T0* T84c2(void);
/* KL_STDERR_FILE.string_ */
extern T0* T47f5(T0* C);
/* KL_STDERR_FILE.put_new_line */
extern void T47f12(T0* C);
/* KL_STANDARD_FILES.error */
extern unsigned char ge167os2874;
extern T0* ge167ov2874;
extern T0* T46f1(T0* C);
/* KL_STDERR_FILE.make */
extern T0* T47c10(void);
/* KL_STDERR_FILE.make_open_stderr */
extern void T47f15(T0* C, T0* a1);
/* KL_STDERR_FILE.set_write_mode */
extern void T47f18(T0* C);
/* KL_STDERR_FILE.console_def */
extern T14 T47f8(T0* C, T6 a1);
/* KL_STDERR_FILE.old_make */
extern void T47f17(T0* C, T0* a1);
/* STRING_8.make_empty */
extern T0* T17c36(void);
/* GEANT_GROUP.std */
extern unsigned char ge165os1769;
extern T0* ge165ov1769;
extern T0* T201f14(T0* C);
/* KL_STANDARD_FILES.default_create */
extern T0* T46c3(void);
/* GEANT_GROUP.log_messages */
extern void T201f35(T0* C, T0* a1);
/* ARRAY [STRING_8].item */
extern T0* T33f4(T0* C, T6 a1);
/* GEANT_GROUP.associated_target */
extern T0* T201f12(T0* C);
/* GEANT_GROUP.file_system */
extern unsigned char ge164os1770;
extern T0* ge164ov1770;
extern T0* T201f11(T0* C);
/* GEANT_GROUP.unix_file_system */
extern unsigned char ge164os1773;
extern T0* ge164ov1773;
extern T0* T201f23(T0* C);
/* KL_UNIX_FILE_SYSTEM.make */
extern T0* T54c32(void);
/* KL_OPERATING_SYSTEM.is_unix */
extern unsigned char ge198os2907;
extern T1 ge198ov2907;
extern T1 T51f2(T0* C);
/* STRING_8.item */
extern T2 T17f10(T0* C, T6 a1);
/* KL_OPERATING_SYSTEM.current_working_directory */
extern T0* T51f4(T0* C);
/* EXECUTION_ENVIRONMENT.current_working_directory */
extern T0* T83f2(T0* C);
/* KL_OPERATING_SYSTEM.execution_environment */
extern unsigned char ge198os2911;
extern T0* ge198ov2911;
extern T0* T51f5(T0* C);
/* EXECUTION_ENVIRONMENT.default_create */
extern T0* T83c8(void);
/* STRING_8.is_equal */
extern T1 T17f27(T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].same_items */
extern T1 T15f4(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* KL_OPERATING_SYSTEM.variable_value */
extern T0* T51f3(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.get */
extern T0* T83f4(T0* C, T0* a1);
/* STRING_8.make_from_c */
extern T0* T17c47(T14 a1);
/* C_STRING.read_substring_into_character_8_area */
extern void T188f7(T0* C, T0* a1, T6 a2, T6 a3);
/* MANAGED_POINTER.read_natural_8 */
extern T8 T261f6(T0* C, T6 a1);
/* TYPED_POINTER [NATURAL_8].memory_copy */
extern void T369f2(T369* C, T14 a1, T6 a2);
/* TYPED_POINTER [NATURAL_8].c_memcpy */
extern void T369f3(T369* C, T14 a1, T14 a2, T6 a3);
/* C_STRING.set_shared_from_pointer */
extern void T188f6(T0* C, T14 a1);
/* C_STRING.set_shared_from_pointer_and_count */
extern void T188f8(T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.set_from_pointer */
extern void T261f10(T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.share_from_pointer */
extern T0* T261c9(T14 a1, T6 a2);
/* C_STRING.c_strlen */
extern T6 T188f3(T0* C, T14 a1);
/* STRING_8.c_string_provider */
extern unsigned char ge2385os1244;
extern T0* ge2385ov1244;
extern T0* T17f28(T0* C);
/* C_STRING.make_empty */
extern void T188f5(T0* C, T6 a1);
/* C_STRING.make_empty */
extern T0* T188c5(T6 a1);
/* MANAGED_POINTER.make */
extern T0* T261c7(T6 a1);
/* EXCEPTIONS.raise */
extern void T370f3(T0* C, T0* a1);
/* EXCEPTIONS.eraise */
extern void T370f4(T0* C, T14 a1, T6 a2);
/* EXCEPTIONS.default_create */
extern T0* T370c2(void);
/* MANAGED_POINTER.default_pointer */
extern T14 T261f5(T0* C);
/* POINTER.memory_calloc */
extern T14 T14f2(T14* C, T6 a1, T6 a2);
/* POINTER.c_calloc */
extern T14 T14f3(T14* C, T6 a1, T6 a2);
/* EXECUTION_ENVIRONMENT.eif_getenv */
extern T14 T83f3(T0* C, T14 a1);
/* GEANT_GROUP.windows_file_system */
extern unsigned char ge164os1771;
extern T0* ge164ov1771;
extern T0* T201f22(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.make */
extern T0* T53c36(void);
/* KL_OPERATING_SYSTEM.is_windows */
extern unsigned char ge198os2906;
extern T1 ge198ov2906;
extern T1 T51f1(T0* C);
/* GEANT_GROUP.operating_system */
extern unsigned char ge206os1774;
extern T0* ge206ov1774;
extern T0* T201f21(T0* C);
/* KL_OPERATING_SYSTEM.default_create */
extern T0* T51c6(void);
/* GEANT_GROUP.project_variables_resolver */
extern unsigned char ge10os1756;
extern T0* ge10ov1756;
extern T0* T201f6(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.make */
extern T0* T58c18(void);
/* GEANT_GROUP.dir_attribute_name */
extern unsigned char ge86os2371;
extern T0* ge86ov2371;
extern T0* T201f10(T0* C);
/* GEANT_GROUP.is_enabled */
extern T1 T201f8(T0* C);
/* GEANT_GROUP.unless_attribute_name */
extern unsigned char ge86os2373;
extern T0* ge86ov2373;
extern T0* T201f7(T0* C);
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
extern T0* T104f1(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.string_ */
extern T0* T104f3(T0* C);
/* KL_EXECUTION_ENVIRONMENT.environment_impl */
extern unsigned char ge191os6293;
extern T0* ge191ov6293;
extern T0* T104f2(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.execution_environment */
extern unsigned char ge204os1767;
extern T0* ge204ov1767;
extern T0* T58f7(T0* C);
/* KL_EXECUTION_ENVIRONMENT.default_create */
extern T0* T104c4(void);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].item */
extern T0* T106f5(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.target_locals_stack */
extern unsigned char ge10os1759;
extern T0* ge10ov1759;
extern T0* T58f5(T0* C);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].make */
extern T0* T106c8(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES].make */
extern T0* T184f1(T0* C, T6 a1);
/* SPECIAL [GEANT_VARIABLES].aliased_resized_area */
extern T0* T183f4(T0* C, T6 a1);
/* ARRAY [GEANT_VARIABLES].make_empty */
extern T0* T254c5(void);
/* ARRAY [GEANT_VARIABLES].make_area */
extern void T254f6(T0* C, T6 a1);
/* SPECIAL [GEANT_VARIABLES].make */
extern void T183f5(T0* C, T6 a1);
/* SPECIAL [GEANT_VARIABLES].make */
extern T0* T183c5(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES].default_create */
extern T0* T184c3(void);
/* GEANT_PROJECT_VARIABLE_RESOLVER.commandline_variables */
extern unsigned char ge10os1749;
extern T0* ge10ov1749;
extern T0* T58f4(T0* C);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].item */
extern T0* T105f5(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.target_arguments_stack */
extern unsigned char ge10os1758;
extern T0* ge10ov1758;
extern T0* T58f3(T0* C);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].make */
extern T0* T105c8(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].make */
extern T0* T182f1(T0* C, T6 a1);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].aliased_resized_area */
extern T0* T181f4(T0* C, T6 a1);
/* ARRAY [GEANT_ARGUMENT_VARIABLES].make_empty */
extern T0* T253c4(void);
/* ARRAY [GEANT_ARGUMENT_VARIABLES].make_area */
extern void T253f5(T0* C, T6 a1);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].make */
extern T0* T181c5(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].default_create */
extern T0* T182c3(void);
/* UC_UTF8_STRING.substring */
extern T0* T205f11(T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.make_from_substring */
extern T0* T205c64(T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.make_from_substring_general */
extern void T205f75(T0* C, T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.put_substring_at_byte_index */
extern void T205f73(T0* C, T0* a1, T6 a2, T6 a3, T6 a4, T6 a5);
extern T1 T205f73ot1(T0* a1, T0** a2);
extern T1 T205f73ot2(T0* a1, T0** a2);
extern T1 T205f73ot3(T0* a1, T0** a2);
/* NATURAL_32.to_integer_32 */
extern T6 T10f2(T10* C);
/* UC_UTF8_STRING.code */
extern T10 T205f14(T0* C, T6 a1);
/* UC_UTF8_STRING.item_code */
extern T6 T205f16(T0* C, T6 a1);
/* STRING_8.code */
extern T10 T17f26(T0* C, T6 a1);
/* INTEGER_32.to_natural_32 */
extern T10 T6f12(T6* C);
/* UC_UTF8_STRING.put_code_at_byte_index */
extern void T205f79(T0* C, T6 a1, T6 a2, T6 a3);
/* UC_UTF8_ROUTINES.code_byte_count */
extern T6 T204f24(T0* C, T6 a1);
/* UC_UTF8_STRING.byte_index */
extern T6 T205f28(T0* C, T6 a1);
/* UC_UTF8_STRING.put_character_at_byte_index */
extern void T205f72(T0* C, T2 a1, T6 a2, T6 a3);
/* UC_UTF8_ROUTINES.character_byte_count */
extern T6 T204f23(T0* C, T2 a1);
/* UC_UTF8_STRING.put_byte */
extern void T205f77(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.old_put */
extern void T205f71(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.any_ */
extern T0* T205f42(T0* C);
/* UC_UTF8_ROUTINES.substring_byte_count */
extern T6 T204f22(T0* C, T0* a1, T6 a2, T6 a3);
extern T1 T204f22ot1(T0* a1, T0** a2);
extern T1 T204f22ot2(T0* a1, T0** a2);
/* UC_UTF8_STRING.shifted_byte_index */
extern T6 T205f47(T0* C, T6 a1, T6 a2);
/* UC_UTF8_ROUTINES.dummy_uc_string */
extern unsigned char ge232os7777;
extern T0* ge232ov7777;
extern T0* T204f27(T0* C);
/* UC_STRING.make_empty */
extern T0* T116c8(void);
/* UC_STRING.make */
extern void T116f9(T0* C, T6 a1);
/* UC_STRING.old_set_count */
extern void T116f12(T0* C, T6 a1);
/* UC_STRING.set_count */
extern void T116f11(T0* C, T6 a1);
/* UC_STRING.byte_capacity */
extern T6 T116f7(T0* C);
/* UC_STRING.capacity */
extern T6 T116f7p1(T0* C);
/* UC_STRING.make */
extern void T116f9p1(T0* C, T6 a1);
/* UC_STRING.reset_byte_index_cache */
extern void T116f10(T0* C);
/* UC_UTF8_ROUTINES.any_ */
extern T0* T204f25(T0* C);
/* UC_UTF8_STRING.cloned_string */
extern T0* T205f41(T0* C);
/* UC_UTF8_STRING.twin */
extern T0* T205f46(T0* C);
/* UC_UTF8_STRING.copy */
extern void T205f85(T0* C, T0* a1);
/* UC_UTF8_STRING.copy */
extern void T205f85p1(T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].twin */
extern T0* T15f5(T0* C);
/* UC_UTF8_STRING.make */
extern void T205f63(T0* C, T6 a1);
/* UC_UTF8_STRING.make */
extern T0* T205c63(T6 a1);
/* UC_UTF8_STRING.old_set_count */
extern void T205f66(T0* C, T6 a1);
/* UC_UTF8_STRING.byte_capacity */
extern T6 T205f40(T0* C);
/* UC_UTF8_STRING.capacity */
extern T6 T205f40p1(T0* C);
/* UC_UTF8_STRING.make */
extern void T205f63p1(T0* C, T6 a1);
/* STRING_8.substring */
extern T0* T17f11(T0* C, T6 a1, T6 a2);
/* STRING_8.set_count */
extern void T17f45(T0* C, T6 a1);
/* STRING_8.new_string */
extern T0* T17f21(T0* C, T6 a1);
/* UC_UTF8_STRING.item */
extern T2 T205f10(T0* C, T6 a1);
/* UC_UTF8_STRING.character_item_at_byte_index */
extern T2 T205f29(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.true_attribute_value */
extern unsigned char ge9os4714;
extern T0* ge9ov4714;
extern T0* T58f11(T0* C);
/* KL_STRING_ROUTINES.same_case_insensitive */
extern T1 T76f11(T0* C, T0* a1, T0* a2);
/* CHARACTER_8.lower */
extern T2 T2f19(T2* C);
/* CHARACTER_8.is_upper */
extern T1 T2f20(T2* C);
/* NATURAL_8.is_greater */
extern T1 T8f2(T8* C, T8 a1);
/* CHARACTER_8.character_types */
extern T8 T2f7(T2* C, T6 a1);
/* CHARACTER_8.internal_character_types */
extern unsigned char ge2331os92;
extern T0* ge2331ov92;
extern T0* T2f9(T2* C);
/* SPECIAL [NATURAL_8].make */
extern T0* T255c3(T6 a1);
/* UC_UNICODE_ROUTINES.lower_code */
extern T6 T321f4(T0* C, T6 a1);
/* ARRAY [INTEGER_32].item */
extern T6 T108f4(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.lower_codes */
extern unsigned char ge243os8881;
extern T0* ge243ov8881;
extern T0* T321f9(T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_plane */
extern unsigned char ge243os8880;
extern T0* ge243ov8880;
extern T0* T321f12(T0* C);
/* SPECIAL [ARRAY [INTEGER_32]].make_filled */
extern T0* T466c3(T0* a1, T6 a2);
/* SPECIAL [ARRAY [INTEGER_32]].fill_with */
extern void T466f6(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ARRAY [INTEGER_32]].make */
extern void T466f5(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.empty_lower_code_segment */
extern unsigned char ge243os8867;
extern T0* ge243ov8867;
extern T0* T321f19(T0* C);
/* KL_INTEGER_ROUTINES.to_integer */
extern T6 T207f3(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.integer_ */
extern T0* T321f30(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_1 */
extern unsigned char ge243os8879;
extern T0* ge243ov8879;
extern T0* T321f11(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_1_segment_4 */
extern unsigned char ge243os8878;
extern T0* ge243ov8878;
extern T0* T321f29(T0* C);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].make_filled */
extern T0* T467c3(T0* a1, T6 a2);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].fill_with */
extern void T467f6(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].make */
extern void T467f5(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.lower_code_plane_0 */
extern unsigned char ge243os8877;
extern T0* ge243ov8877;
extern T0* T321f10(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_255 */
extern unsigned char ge243os8876;
extern T0* ge243ov8876;
extern T0* T321f28(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_167 */
extern unsigned char ge243os8875;
extern T0* ge243ov8875;
extern T0* T321f27(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_166 */
extern unsigned char ge243os8874;
extern T0* ge243ov8874;
extern T0* T321f26(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_44 */
extern unsigned char ge243os8873;
extern T0* ge243ov8873;
extern T0* T321f25(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_36 */
extern unsigned char ge243os8872;
extern T0* ge243ov8872;
extern T0* T321f24(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_33 */
extern unsigned char ge243os8871;
extern T0* ge243ov8871;
extern T0* T321f23(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_31 */
extern unsigned char ge243os8870;
extern T0* ge243ov8870;
extern T0* T321f22(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_30 */
extern unsigned char ge243os8869;
extern T0* ge243ov8869;
extern T0* T321f21(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_16 */
extern unsigned char ge243os8868;
extern T0* ge243ov8868;
extern T0* T321f20(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_5 */
extern unsigned char ge243os8866;
extern T0* ge243ov8866;
extern T0* T321f18(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_4 */
extern unsigned char ge243os8865;
extern T0* ge243ov8865;
extern T0* T321f17(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_3 */
extern unsigned char ge243os8864;
extern T0* ge243ov8864;
extern T0* T321f16(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_2 */
extern unsigned char ge243os8863;
extern T0* ge243ov8863;
extern T0* T321f15(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_1 */
extern unsigned char ge243os8862;
extern T0* ge243ov8862;
extern T0* T321f14(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_0 */
extern unsigned char ge243os8861;
extern T0* ge243ov8861;
extern T0* T321f13(T0* C);
/* KL_STRING_ROUTINES.unicode */
extern unsigned char ge216os5283;
extern T0* ge216ov5283;
extern T0* T76f12(T0* C);
/* UC_UNICODE_ROUTINES.default_create */
extern T0* T321c31(void);
/* STRING_8.item_code */
extern T6 T17f14(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.false_attribute_value */
extern unsigned char ge9os4715;
extern T0* ge9ov4715;
extern T0* T58f10(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.string_ */
extern T0* T58f2(T0* C);
/* DS_LINKED_LIST [STRING_8].item */
extern T0* T238f7(T0* C, T6 a1);
/* ST_SPLITTER.split_greedy */
extern T0* T419f9(T0* C, T0* a1);
/* ST_SPLITTER.do_split */
extern T0* T419f7(T0* C, T0* a1, T1 a2);
/* DS_LINKED_LIST [STRING_8].force_last */
extern void T238f13(T0* C, T0* a1);
/* DS_LINKABLE [STRING_8].put_right */
extern void T347f4(T0* C, T0* a1);
/* DS_LINKABLE [STRING_8].make */
extern T0* T347c3(T0* a1);
/* DS_LINKED_LIST [STRING_8].is_empty */
extern T1 T238f6(T0* C);
/* DS_HASH_SET [INTEGER_32].has */
extern T1 T510f25(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].search_position */
extern void T510f32(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].clashes_item */
extern T6 T510f21(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].hash_position */
extern T6 T510f18(T0* C, T6 a1);
/* INTEGER_32.hash_code */
extern T6 T6f23(T6* C);
/* DS_HASH_SET [INTEGER_32].key_storage_item */
extern T6 T510f17(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].item_storage_item */
extern T6 T510f27(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].key_equality_tester */
extern T0* T510f28(T0* C);
/* DS_HASH_SET [INTEGER_32].slots_item */
extern T6 T510f24(T0* C, T6 a1);
/* KL_STRING_ROUTINES.appended_substring */
extern T0* T76f4(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* UC_UTF8_STRING.append_character */
extern void T205f60(T0* C, T2 a1);
/* UC_UTF8_STRING.resize_byte_storage */
extern void T205f70(T0* C, T6 a1);
/* UC_UTF8_STRING.resize */
extern void T205f78(T0* C, T6 a1);
/* UC_UTF8_STRING.append_string */
extern void T205f59(T0* C, T0* a1);
/* UC_UTF8_STRING.append */
extern void T205f69(T0* C, T0* a1);
/* UC_UTF8_STRING.dummy_uc_string */
extern unsigned char ge222os6449;
extern T0* ge222ov6449;
extern T0* T205f44(T0* C);
/* UC_UTF8_STRING.append */
extern void T205f69p1(T0* C, T0* a1);
/* UC_UTF8_STRING.additional_space */
extern T6 T205f45(T0* C);
/* ISE_RUNTIME.check_assert */
extern T1 T323s1(T1 a1);
/* UC_UTF8_STRING.as_string_8 */
extern T0* T205f31(T0* C);
/* STRING_8.put_code */
extern void T17f51(T0* C, T10 a1, T6 a2);
/* UC_UTF8_STRING.put_code */
extern void T205f67(T0* C, T10 a1, T6 a2);
/* UC_UTF8_STRING.put_item_code */
extern void T205f76(T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.move_bytes_right */
extern void T205f81(T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.move_bytes_left */
extern void T205f80(T0* C, T6 a1, T6 a2);
/* STRING_8.valid_code */
extern T1 T17f31(T0* C, T10 a1);
/* NATURAL_32.is_less_equal */
extern T1 T10f3(T10* C, T10 a1);
/* UC_UTF8_STRING.valid_code */
extern T1 T205f39(T0* C, T10 a1);
/* STRING_8.as_string_8 */
extern T0* T17f30(T0* C);
/* UC_UTF8_STRING.new_empty_string */
extern T0* T205f9(T0* C, T6 a1);
/* UC_UTF8_STRING.append_substring */
extern void T205f61(T0* C, T0* a1, T6 a2, T6 a3);
/* ST_SPLITTER.string_ */
extern T0* T419f6(T0* C);
/* DS_LINKED_LIST [STRING_8].make */
extern T0* T238c11(void);
/* DS_LINKED_LIST [STRING_8].set_internal_cursor */
extern void T238f12(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].new_cursor */
extern T0* T238f10(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].make */
extern T0* T343c7(T0* a1);
/* ST_SPLITTER.make_with_separators */
extern T0* T419c10(T0* a1);
/* ST_SPLITTER.set_separators */
extern void T419f12(T0* C, T0* a1);
/* DS_HASH_SET [INTEGER_32].put */
extern void T510f31(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].slots_put */
extern void T510f41(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [INTEGER_32].clashes_put */
extern void T510f40(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [INTEGER_32].item_storage_put */
extern void T510f39(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [INTEGER_32].unset_found_item */
extern void T510f37(T0* C);
/* DS_HASH_SET [INTEGER_32].make */
extern T0* T510c30(T6 a1);
/* DS_HASH_SET [INTEGER_32].set_internal_cursor */
extern void T510f38(T0* C, T0* a1);
/* DS_HASH_SET [INTEGER_32].new_cursor */
extern T0* T510f19(T0* C);
/* DS_HASH_SET_CURSOR [INTEGER_32].make */
extern T0* T552c3(T0* a1);
/* DS_HASH_SET [INTEGER_32].make_slots */
extern void T510f36(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].make */
extern T0* T65f2(T0* C, T6 a1);
/* SPECIAL [INTEGER_32].aliased_resized_area */
extern T0* T63f4(T0* C, T6 a1);
/* ARRAY [INTEGER_32].make_empty */
extern T0* T108c9(void);
/* ARRAY [INTEGER_32].make_area */
extern void T108f10(T0* C, T6 a1);
/* SPECIAL [INTEGER_32].make */
extern void T63f7(T0* C, T6 a1);
/* SPECIAL [INTEGER_32].make */
extern T0* T63c7(T6 a1);
/* DS_HASH_SET [INTEGER_32].special_integer_ */
extern unsigned char ge127os2179;
extern T0* ge127ov2179;
extern T0* T510f22(T0* C);
/* KL_SPECIAL_ROUTINES [INTEGER_32].default_create */
extern T0* T65c6(void);
/* DS_HASH_SET [INTEGER_32].new_modulus */
extern T6 T510f23(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].make_clashes */
extern void T510f35(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].make_key_storage */
extern void T510f34(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].make_item_storage */
extern void T510f33(T0* C, T6 a1);
/* GEANT_GROUP.if_attribute_name */
extern unsigned char ge86os2372;
extern T0* ge86ov2372;
extern T0* T201f9(T0* C);
/* GEANT_GROUP.set_parent */
extern void T201f25(T0* C, T0* a1);
/* GEANT_GROUP.make */
extern T0* T201c24(T0* a1, T0* a2);
/* GEANT_GROUP.initialize */
extern void T201f27(T0* C);
/* GEANT_GROUP.set_description */
extern void T201f33(T0* C, T0* a1);
/* XM_ELEMENT.text */
extern T0* T99f27(T0* C);
/* KL_STRING_ROUTINES.appended_string */
extern T0* T76f5(T0* C, T0* a1, T0* a2);
/* STRING_8.append_string */
extern void T17f42(T0* C, T0* a1);
/* STRING_8.append */
extern void T17f39(T0* C, T0* a1);
/* KL_STRING_ROUTINES.concat */
extern T0* T76f6(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.prefixed_string */
extern T0* T205f8(T0* C, T0* a1);
/* KL_STRING_ROUTINES.cloned_string */
extern T0* T76f7(T0* C, T0* a1);
/* STRING_8.twin */
extern T0* T17f18(T0* C);
/* STRING_8.copy */
extern void T17f44(T0* C, T0* a1);
/* XM_ELEMENT.string_ */
extern T0* T99f29(T0* C);
/* XM_NODE_TYPER.is_character_data */
extern T1 T364f10(T0* C);
/* XM_NODE_TYPER.default_create */
extern T0* T364c11(void);
/* XM_ELEMENT.element_by_name */
extern T0* T99f18(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].go_after */
extern void T203f12(T0* C);
/* XM_DOCUMENT.cursor_go_after */
extern void T98f26(T0* C, T0* a1);
/* XM_DOCUMENT.cursor_off */
extern T1 T98f12(T0* C, T0* a1);
/* XM_ELEMENT.cursor_go_after */
extern void T99f43(T0* C, T0* a1);
/* XM_ELEMENT.cursor_off */
extern T1 T99f23(T0* C, T0* a1);
/* XM_ELEMENT.named_same_name */
extern T1 T99f9(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.same_namespace */
extern T1 T99f12(T0* C, T0* a1);
/* XM_NAMESPACE.is_equal */
extern T1 T359f4(T0* C, T0* a1);
/* XM_NAMESPACE.string_ */
extern T0* T359f3(T0* C);
/* XM_ELEMENT.has_namespace */
extern T1 T99f14(T0* C);
/* XM_ELEMENT.same_string */
extern T1 T99f11(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.string_equality_tester */
extern unsigned char ge221os2181;
extern T0* ge221ov2181;
extern T0* T99f13(T0* C);
/* UC_STRING_EQUALITY_TESTER.default_create */
extern T0* T59c3(void);
/* XM_NODE_TYPER.is_element */
extern T1 T364f8(T0* C);
/* GEANT_GROUP.make */
extern void T201f24p1(T0* C, T0* a1, T0* a2);
/* XM_POSITION_TABLE.item */
extern T0* T101f3(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].forth */
extern void T209f10(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_forth */
extern void T180f12(T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].add_traversing_cursor */
extern void T180f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set_next_cursor */
extern void T209f13(T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].remove_traversing_cursor */
extern void T180f15(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set */
extern void T209f11(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].go_after */
extern void T209f9(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_go_after */
extern void T180f11(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set_after */
extern void T209f12(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_off */
extern T1 T180f6(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].item */
extern T0* T209f6(T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].start */
extern void T209f8(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_start */
extern void T180f10(T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].new_cursor */
extern T0* T180f7(T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T209c7(T0* a1);
/* XM_POSITION_TABLE.has */
extern T1 T101f2(T0* C, T0* a1);
/* GEANT_GROUP.set_project */
extern void T201f29(T0* C, T0* a1);
/* GEANT_GROUP.element_make */
extern void T201f28(T0* C, T0* a1);
/* GEANT_GROUP.set_xml_element */
extern void T201f34(T0* C, T0* a1);
/* KL_STRING_ROUTINES.same_string */
extern T1 T76f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.elks_same_string */
extern T1 T76f10(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.same_string */
extern T1 T205f15(T0* C, T0* a1);
/* UC_UTF8_STRING.substring_index */
extern T6 T205f32(T0* C, T0* a1, T6 a2);
/* STRING_8.same_string */
extern T1 T17f19(T0* C, T0* a1);
/* STRING_8.same_string_general */
extern T1 T17f25(T0* C, T0* a1);
/* UC_UTF8_STRING.same_unicode_string */
extern T1 T205f13(T0* C, T0* a1);
/* UC_UTF8_STRING.unicode_substring_index */
extern T6 T205f30(T0* C, T0* a1, T6 a2);
/* GEANT_TARGET.group_element_name */
extern T0* T26f54(T0* C);
/* GEANT_TARGET.string_ */
extern T0* T26f30(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].item */
extern T0* T203f8(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].start */
extern void T203f10(T0* C);
/* XM_DOCUMENT.cursor_start */
extern void T98f24(T0* C, T0* a1);
/* XM_ELEMENT.cursor_start */
extern void T99f41(T0* C, T0* a1);
/* XM_ELEMENT.new_cursor */
extern T0* T99f20(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].make */
extern T0* T203c9(T0* a1);
/* GEANT_TARGET.prepare_variables_before_execution */
extern void T26f80(T0* C);
/* GEANT_TARGET.prepare_variables_before_execution */
extern void T26f80p1(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].forth */
extern void T64f9(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].key */
extern T0* T64f5(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].item */
extern T0* T64f4(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].after */
extern T1 T64f6(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].start */
extern void T64f8(T0* C);
/* GEANT_TARGET.target_locals_stack */
extern T0* T26f53(T0* C);
/* GEANT_TARGET.prepared_arguments_from_formal_arguments */
extern T0* T26f52(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.has_same_keys */
extern T1 T34f35(T0* C, T0* a1);
/* GEANT_TARGET.named_from_numbered_arguments */
extern T0* T26f61(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.has_numbered_keys */
extern T1 T34f39(T0* C);
/* INTEGER_32.out */
extern T0* T6f13(T6* C);
/* STRING_8.append_integer */
extern void T17f48(T0* C, T6 a1);
/* GEANT_TARGET.target_arguments_stack */
extern T0* T26f51(T0* C);
/* KL_UNIX_FILE_SYSTEM.set_current_working_directory */
extern void T54f33(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.change_working_directory */
extern void T83f9(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.eif_chdir */
extern T6 T83f5(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.execution_environment */
extern unsigned char ge155os3995;
extern T0* ge155ov3995;
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
extern T1 T54f24(T0* C, T0* a1);
/* KL_DIRECTORY.exists */
extern T1 T489f12(T0* C);
/* KL_DIRECTORY.old_exists */
extern T1 T489f15(T0* C);
/* KL_DIRECTORY.eif_dir_exists */
extern T1 T489f10(T0* C, T14 a1);
/* KL_DIRECTORY.reset */
extern void T489f37(T0* C, T0* a1);
/* KL_DIRECTORY.make */
extern void T489f35(T0* C, T0* a1);
/* KL_DIRECTORY.make */
extern T0* T489c35(T0* a1);
/* KL_DIRECTORY.old_make */
extern void T489f38(T0* C, T0* a1);
/* KL_DIRECTORY.string_ */
extern T0* T489f19(T0* C);
/* KL_UNIX_FILE_SYSTEM.tmp_directory */
extern unsigned char ge155os3993;
extern T0* ge155ov3993;
extern T0* T54f25(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.directory_exists */
extern T1 T53f27(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.tmp_directory */
extern T0* T53f28(T0* C);
/* KL_UNIX_FILE_SYSTEM.current_working_directory */
extern T0* T54f23(T0* C);
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
extern T0* T256f5(T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.variable_value */
extern T0* T256f3(T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.expanded_variable_value */
extern T0* T256f6(T0* C, T0* a1);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.value */
extern T0* T564f2(T0* C, T0* a1);
/* GEANT_VARIABLES.item */
extern T0* T29f34(T0* C, T0* a1);
/* GEANT_VARIABLES.item_storage_item */
extern T0* T29f35(T0* C, T6 a1);
/* GEANT_VARIABLES.search_position */
extern void T29f54(T0* C, T0* a1);
/* GEANT_VARIABLES.clashes_item */
extern T6 T29f27(T0* C, T6 a1);
/* GEANT_VARIABLES.hash_position */
extern T6 T29f24(T0* C, T0* a1);
/* GEANT_VARIABLES.key_storage_item */
extern T0* T29f28(T0* C, T6 a1);
/* GEANT_VARIABLES.slots_item */
extern T6 T29f30(T0* C, T6 a1);
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
extern T1 T564f3(T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.default_variable_value */
extern T0* T256f4(T0* C, T0* a1);
/* UC_UTF8_STRING.old_is_empty */
extern T1 T205f53(T0* C);
/* STRING_8.is_empty */
extern T1 T17f32(T0* C);
/* KL_STRING_ROUTINES.append_substring_to_string */
extern void T76f20(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* KL_STRING_ROUTINES.new_empty_string */
extern T0* T76f3(T0* C, T0* a1, T6 a2);
/* UC_UTF8_STRING.old_wipe_out */
extern void T205f83(T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T205f86(T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T205f83p1(T0* C);
/* STRING_8.wipe_out */
extern void T17f41(T0* C);
/* GEANT_STRING_INTERPRETER.string_ */
extern T0* T256f2(T0* C);
/* UC_UTF8_STRING.out */
extern T0* T205f18(T0* C);
/* UC_UTF8_STRING.unicode */
extern T0* T205f34(T0* C);
/* STRING_8.out */
extern T0* T17f4(T0* C);
/* XM_ELEMENT.attribute_by_name */
extern T0* T99f8(T0* C, T0* a1);
/* XM_ELEMENT.attribute_same_name */
extern T1 T99f10(T0* C, T0* a1, T0* a2);
/* XM_NODE_TYPER.is_attribute */
extern T1 T364f9(T0* C);
/* GEANT_STRING_INTERPRETER.set_variable_resolver */
extern void T256f8(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.set_variables */
extern void T58f19(T0* C, T0* a1);
/* GEANT_TARGET.project_variables_resolver */
extern T0* T26f33(T0* C);
/* GEANT_STRING_INTERPRETER.make */
extern T0* T256c7(void);
/* XM_ELEMENT.has_attribute_by_name */
extern T1 T99f21(T0* C, T0* a1);
/* GEANT_TARGET.dir_attribute_name */
extern T0* T26f48(T0* C);
/* GEANT_PROJECT.log */
extern void T22f50(T0* C, T0* a1);
/* KL_STDOUT_FILE.flush */
extern void T68f20(T0* C);
/* KL_STDOUT_FILE.old_flush */
extern void T68f21(T0* C);
/* KL_STDOUT_FILE.file_flush */
extern void T68f22(T0* C, T14 a1);
/* KL_STDOUT_FILE.put_new_line */
extern void T68f15(T0* C);
/* KL_STDOUT_FILE.put_string */
extern void T68f14(T0* C, T0* a1);
/* KL_STDOUT_FILE.old_put_string */
extern void T68f18(T0* C, T0* a1);
/* KL_STDOUT_FILE.console_ps */
extern void T68f19(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STDOUT_FILE.string_ */
extern T0* T68f6(T0* C);
/* GEANT_PROJECT.target_name */
extern T0* T22f24(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].forth */
extern void T128f10(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_forth */
extern void T31f70(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].add_traversing_cursor */
extern void T31f75(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].set_next_cursor */
extern void T128f15(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].remove_traversing_cursor */
extern void T31f74(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].set_position */
extern void T128f14(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].clashes_item */
extern T6 T31f21(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].go_after */
extern void T128f13(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_go_after */
extern void T31f80(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_off */
extern T1 T31f43(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].key */
extern T0* T128f7(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_key */
extern T0* T31f38(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].key_storage_item */
extern T0* T31f35(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].item */
extern T0* T128f6(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_item */
extern T0* T31f37(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item_storage_item */
extern T0* T31f27(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].after */
extern T1 T128f5(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_after */
extern T1 T31f36(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].start */
extern void T128f9(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_start */
extern void T31f69(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].is_empty */
extern T1 T31f42(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].new_cursor */
extern T0* T31f28(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].make */
extern T0* T128c8(T0* a1);
/* GEANT_TARGET.is_enabled */
extern T1 T26f47(T0* C);
/* GEANT_TARGET.unless_attribute_name */
extern T0* T26f57(T0* C);
/* GEANT_TARGET.if_attribute_name */
extern T0* T26f56(T0* C);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].force */
extern void T106f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].resize */
extern void T106f11(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES].resize */
extern T0* T184f2(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].new_capacity */
extern T6 T106f7(T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].extendible */
extern T1 T106f6(T0* C, T6 a1);
/* GEANT_VARIABLES.make */
extern T0* T29c48(void);
/* GEANT_VARIABLES.set_key_equality_tester */
extern void T29f52(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].internal_set_equality_tester */
extern void T61f6(T0* C, T0* a1);
/* GEANT_VARIABLES.make_map */
extern void T29f51(T0* C, T6 a1);
/* GEANT_VARIABLES.make_with_equality_testers */
extern void T29f60(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].make */
extern T0* T61c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].set_internal_cursor */
extern void T61f7(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].new_cursor */
extern T0* T61f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8].make */
extern T0* T107c3(T0* a1);
/* GEANT_VARIABLES.make_sparse_container */
extern void T29f65(T0* C, T6 a1);
/* GEANT_VARIABLES.set_internal_cursor */
extern void T29f70(T0* C, T0* a1);
/* GEANT_VARIABLES.unset_found_item */
extern void T29f53(T0* C);
/* GEANT_VARIABLES.make_slots */
extern void T29f69(T0* C, T6 a1);
/* GEANT_VARIABLES.special_integer_ */
extern T0* T29f26(T0* C);
/* GEANT_VARIABLES.new_modulus */
extern T6 T29f33(T0* C, T6 a1);
/* GEANT_VARIABLES.make_clashes */
extern void T29f68(T0* C, T6 a1);
/* GEANT_VARIABLES.make_key_storage */
extern void T29f67(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].make */
extern T0* T66f2(T0* C, T6 a1);
/* SPECIAL [STRING_8].aliased_resized_area */
extern T0* T32f4(T0* C, T6 a1);
/* ARRAY [STRING_8].make_empty */
extern T0* T33c14(void);
/* ARRAY [STRING_8].make_area */
extern void T33f15(T0* C, T6 a1);
/* SPECIAL [STRING_8].make */
extern void T32f9(T0* C, T6 a1);
/* SPECIAL [STRING_8].make */
extern T0* T32c9(T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].default_create */
extern T0* T66c3(void);
/* GEANT_VARIABLES.make_item_storage */
extern void T29f66(T0* C, T6 a1);
/* GEANT_PROJECT.target_locals_stack */
extern T0* T22f23(T0* C);
/* GEANT_TARGET.final_target */
extern T0* T26f37(T0* C);
/* GEANT_PROJECT.current_target */
extern T0* T22f22(T0* C);
/* DS_ARRAYED_STACK [GEANT_TARGET].is_empty */
extern T1 T190f5(T0* C);
/* GEANT_PROJECT.trace_debug */
extern void T22f39(T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].item */
extern T0* T190f6(T0* C);
/* GEANT_ARGUMENT_VARIABLES.make */
extern T0* T34c48(void);
/* GEANT_ARGUMENT_VARIABLES.set_key_equality_tester */
extern void T34f51(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.make_map */
extern void T34f50(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_with_equality_testers */
extern void T34f59(T0* C, T6 a1, T0* a2, T0* a3);
/* GEANT_ARGUMENT_VARIABLES.make_sparse_container */
extern void T34f64(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.set_internal_cursor */
extern void T34f69(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.unset_found_item */
extern void T34f52(T0* C);
/* GEANT_ARGUMENT_VARIABLES.make_slots */
extern void T34f68(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.special_integer_ */
extern T0* T34f26(T0* C);
/* GEANT_ARGUMENT_VARIABLES.new_modulus */
extern T6 T34f31(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_clashes */
extern void T34f67(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_key_storage */
extern void T34f66(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_item_storage */
extern void T34f65(T0* C, T6 a1);
/* GEANT_PROJECT.calculate_depend_order */
extern void T22f48(T0* C, T0* a1);
/* GEANT_TARGET.dependent_targets */
extern T0* T26f41(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].item */
extern T0* T71f14(T0* C, T6 a1);
/* GEANT_TARGET.show_dependent_targets */
extern void T26f78(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_line */
extern void T68f12(T0* C, T0* a1);
/* KL_STANDARD_FILES.output */
extern unsigned char ge167os2873;
extern T0* ge167ov2873;
extern T0* T46f2(T0* C);
/* KL_STDOUT_FILE.make */
extern T0* T68c10(void);
/* KL_STDOUT_FILE.make_open_stdout */
extern void T68f13(T0* C, T0* a1);
/* KL_STDOUT_FILE.set_write_mode */
extern void T68f17(T0* C);
/* KL_STDOUT_FILE.console_def */
extern T14 T68f5(T0* C, T6 a1);
/* KL_STDOUT_FILE.old_make */
extern void T68f16(T0* C, T0* a1);
/* GEANT_TARGET.string_tokens */
extern T0* T26f25(T0* C, T0* a1, T2 a2);
/* DS_ARRAYED_LIST [detachable STRING_8].force_last */
extern void T71f28(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [STRING_8].force */
extern void T66f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [STRING_8].fill_with */
extern void T32f10(T0* C, T0* a1, T6 a2, T6 a3);
/* DS_ARRAYED_LIST [detachable STRING_8].resize */
extern void T71f30(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].resize */
extern T0* T66f1(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [detachable STRING_8].new_capacity */
extern T6 T71f19(T0* C, T6 a1);
/* DS_ARRAYED_LIST [detachable STRING_8].extendible */
extern T1 T71f18(T0* C, T6 a1);
/* UC_UTF8_STRING.index_of */
extern T6 T205f19(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.index_of_item_code */
extern T6 T205f35(T0* C, T6 a1, T6 a2);
/* STRING_8.index_of */
extern T6 T17f13(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.keep_head */
extern void T205f82(T0* C, T6 a1);
/* STRING_8.keep_head */
extern void T17f50(T0* C, T6 a1);
/* UC_UTF8_STRING.keep_tail */
extern void T205f84(T0* C, T6 a1);
/* STRING_8.keep_tail */
extern void T17f49(T0* C, T6 a1);
/* DS_ARRAYED_LIST [detachable STRING_8].make */
extern T0* T71c24(T6 a1);
/* DS_ARRAYED_LIST [detachable STRING_8].set_internal_cursor */
extern void T71f29(T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].new_cursor */
extern T0* T71f9(T0* C);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].make */
extern T0* T72c7(T0* a1);
/* GEANT_TARGET.dependencies */
extern T0* T26f45(T0* C);
/* GEANT_TARGET.depend_attribute_name */
extern unsigned char ge12os2343;
extern T0* ge12ov2343;
extern T0* T26f46(T0* C);
/* GEANT_TARGET.has_dependencies */
extern T1 T26f44(T0* C);
/* DS_ARRAYED_STACK [GEANT_TARGET].force */
extern void T190f10(T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].resize */
extern void T190f12(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].resize */
extern T0* T129f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_TARGET].aliased_resized_area */
extern T0* T124f4(T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].new_capacity */
extern T6 T190f8(T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].extendible */
extern T1 T190f7(T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].make */
extern T0* T190c9(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].make */
extern T0* T129f2(T0* C, T6 a1);
/* ARRAY [GEANT_TARGET].make_empty */
extern T0* T216c4(void);
/* ARRAY [GEANT_TARGET].make_area */
extern void T216f5(T0* C, T6 a1);
/* SPECIAL [GEANT_TARGET].make */
extern T0* T124c5(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].default_create */
extern T0* T129c3(void);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].force */
extern void T105f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].resize */
extern void T105f11(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].resize */
extern T0* T182f2(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].new_capacity */
extern T6 T105f7(T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].extendible */
extern T1 T105f6(T0* C, T6 a1);
/* GEANT_PROJECT.target_arguments_stack */
extern T0* T22f21(T0* C);
/* GEANT_PROJECT.trace */
extern void T22f31(T0* C, T0* a1);
/* GEANT.commandline_arguments */
extern unsigned char ge10os1750;
extern T0* ge10ov1750;
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
extern T1 T71f23(T0* C, T0* a1);
/* GEANT_TARGET.project_name_any */
extern unsigned char ge12os2346;
extern T0* ge12ov2346;
extern T0* T26f26(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item */
extern T0* T31f34(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].search_position */
extern void T31f51(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].hash_position */
extern T6 T31f24(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].slots_item */
extern T6 T31f26(T0* C, T6 a1);
/* GEANT.exit_application */
extern void T21f22(T0* C, T6 a1, T0* a2);
/* GEANT.exceptions */
extern T0* T21f14(T0* C);
/* GEANT.std */
extern T0* T21f13(T0* C);
/* GEANT.log_messages */
extern void T21f28(T0* C, T0* a1);
/* UC_UTF8_STRING.plus */
extern T0* T205f7(T0* C, T0* a1);
/* STRING_8.plus */
extern T0* T17f9(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].has */
extern T1 T31f33(T0* C, T0* a1);
/* INTEGER_32.is_greater */
extern T1 T6f1(T6* C, T6 a1);
/* GEANT_PROJECT.merge_in_parent_projects */
extern void T22f32(T0* C);
/* GEANT_TARGET.show_precursors */
extern void T26f77(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].to_array */
extern T0* T71f22(T0* C);
/* ARRAY [STRING_8].put */
extern void T33f12(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].after */
extern T1 T72f6(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].cursor_after */
extern T1 T71f10(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].forth */
extern void T72f9(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].cursor_forth */
extern void T71f33(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].set_position */
extern void T72f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [detachable STRING_8].add_traversing_cursor */
extern void T71f37(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].set_next_cursor */
extern void T72f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].remove_traversing_cursor */
extern void T71f38(T0* C, T0* a1);
/* ARRAY [STRING_8].make_filled */
extern T0* T33c11(T0* a1, T6 a2, T6 a3);
/* ARRAY [STRING_8].make_filled_area */
extern void T33f13(T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].make_filled */
extern T0* T32c8(T0* a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].item */
extern T0* T72f5(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].cursor_item */
extern T0* T71f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].start */
extern void T72f8(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].cursor_start */
extern void T71f32(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].off */
extern T1 T72f4(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].cursor_off */
extern T1 T71f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].cursor_before */
extern T1 T71f15(T0* C, T0* a1);
/* KL_ARRAY_ROUTINES [detachable STRING_8].make_empty_with_lower */
extern T0* T349f1(T0* C, T6 a1);
/* ARRAY [STRING_8].make_from_array */
extern T0* T33c18(T0* a1);
/* KL_ARRAY [detachable STRING_8].new_rebase */
extern void T491f5(T0* C, T6 a1);
/* KL_ARRAY [detachable STRING_8].make_empty */
extern T0* T491c4(void);
/* KL_ARRAY [detachable STRING_8].make_area */
extern void T491f6(T0* C, T6 a1);
/* KL_ARRAY_ROUTINES [detachable STRING_8].default_create */
extern T0* T349c2(void);
/* DS_ARRAYED_LIST [detachable STRING_8].is_empty */
extern T1 T71f20(T0* C);
/* GEANT_INHERIT.apply_selects */
extern void T123f8(T0* C);
/* GEANT_INHERIT.check_targets_for_conflicts */
extern void T123f14(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].back */
extern void T128f12(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_back */
extern void T31f72(T0* C, T0* a1);
/* GEANT_INHERIT.exit_application */
extern void T123f15(T0* C, T6 a1, T0* a2);
/* GEANT_INHERIT.exceptions */
extern T0* T123f5(T0* C);
/* GEANT_INHERIT.std */
extern T0* T123f4(T0* C);
/* GEANT_INHERIT.log_messages */
extern void T123f16(T0* C, T0* a1);
/* GEANT_TARGET.conflicts_with */
extern T1 T26f39(T0* C, T0* a1);
/* GEANT_TARGET.seed */
extern T0* T26f43(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].before */
extern T1 T128f4(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_before */
extern T1 T31f39(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].finish */
extern void T128f11(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_finish */
extern void T31f71(T0* C, T0* a1);
/* GEANT_INHERIT.sort_out_selected_targets */
extern void T123f13(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].remove */
extern void T31f68(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].remove_position */
extern void T31f73(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].key_storage_put */
extern void T31f57(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item_storage_put */
extern void T31f56(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].clashes_put */
extern void T31f54(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].slots_put */
extern void T31f55(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].move_cursors_forth */
extern void T31f77(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].move_all_cursors */
extern void T31f79(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].move_cursors_after */
extern void T31f78(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].internal_set_key_equality_tester */
extern void T31f76(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_TARGET, STRING_8].internal_set_equality_tester */
extern void T126f6(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].unset_found_item */
extern void T31f52(T0* C);
/* GEANT_TARGET.set_redefining_target */
extern void T26f85(T0* C, T0* a1);
/* GEANT_INHERIT.validate_parent_selects */
extern void T123f12(T0* C);
/* GEANT_INHERIT.merge_in_parent_project */
extern void T123f7(T0* C, T0* a1);
/* GEANT_INHERIT.merge_in_unchanged_targets */
extern void T123f11(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].force_last_new */
extern void T31f49(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].resize */
extern void T31f53(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].clashes_resize */
extern void T31f62(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].resize */
extern T0* T65f1(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].special_integer_ */
extern T0* T31f29(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].key_storage_resize */
extern void T31f61(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item_storage_resize */
extern void T31f60(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].slots_resize */
extern void T31f59(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].new_modulus */
extern T6 T31f22(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].new_capacity */
extern T6 T31f32(T0* C, T6 a1);
/* GEANT_INHERIT.string_ */
extern T0* T123f3(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].found_item */
extern T0* T31f30(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].found */
extern T1 T31f31(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].search */
extern void T31f48(T0* C, T0* a1);
/* GEANT_INHERIT.merge_in_renamed_targets */
extern void T123f10(T0* C, T0* a1);
/* GEANT_INHERIT.merge_in_redefined_targets */
extern void T123f9(T0* C, T0* a1);
/* GEANT_TARGET.set_precursor_target */
extern void T26f76(T0* C, T0* a1);
/* GEANT_TARGET.formal_arguments_match */
extern T1 T26f38(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].forth */
extern void T195f9(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_forth */
extern void T194f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].set_position */
extern void T195f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].add_traversing_cursor */
extern void T194f22(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].set_next_cursor */
extern void T195f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].remove_traversing_cursor */
extern void T194f23(T0* C, T0* a1);
/* GEANT_PARENT.prepare_project */
extern void T192f14(T0* C);
/* GEANT_PARENT.apply_selects */
extern void T192f19(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].forth */
extern void T485f8(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_forth */
extern void T336f60(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].add_traversing_cursor */
extern void T336f62(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].set_next_cursor */
extern void T485f10(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].remove_traversing_cursor */
extern void T336f61(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].set_position */
extern void T485f9(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].clashes_item */
extern T6 T336f27(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].force_last */
extern void T31f81(T0* C, T0* a1, T0* a2);
/* GEANT_PARENT.exit_application */
extern void T192f20(T0* C, T6 a1, T0* a2);
/* GEANT_PARENT.exceptions */
extern T0* T192f11(T0* C);
/* GEANT_PARENT.std */
extern T0* T192f10(T0* C);
/* GEANT_PARENT.log_messages */
extern void T192f21(T0* C, T0* a1);
/* GEANT_SELECT.is_executable */
extern T1 T335f2(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].item */
extern T0* T485f4(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_item */
extern T0* T336f33(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].item_storage_item */
extern T0* T336f35(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].after */
extern T1 T485f5(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_after */
extern T1 T336f32(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].start */
extern void T485f7(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_start */
extern void T336f59(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_off */
extern T1 T336f37(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].is_empty */
extern T1 T336f36(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].new_cursor */
extern T0* T336f25(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].make */
extern T0* T485c6(T0* a1);
/* GEANT_PARENT.apply_undeclared_redefines */
extern void T192f18(T0* C);
/* GEANT_PARENT.apply_unchangeds */
extern void T192f17(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].has_item */
extern T1 T31f45(T0* C, T0* a1);
/* GEANT_PARENT.apply_redefines */
extern void T192f16(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].forth */
extern void T479f8(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_forth */
extern void T334f60(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].add_traversing_cursor */
extern void T334f62(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].set_next_cursor */
extern void T479f10(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].remove_traversing_cursor */
extern void T334f61(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].set_position */
extern void T479f9(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].clashes_item */
extern T6 T334f27(T0* C, T6 a1);
/* GEANT_REDEFINE.is_executable */
extern T1 T333f2(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].item */
extern T0* T479f4(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_item */
extern T0* T334f33(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].item_storage_item */
extern T0* T334f35(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].after */
extern T1 T479f5(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_after */
extern T1 T334f32(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].start */
extern void T479f7(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_start */
extern void T334f59(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_off */
extern T1 T334f37(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].is_empty */
extern T1 T334f36(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].new_cursor */
extern T0* T334f25(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].make */
extern T0* T479c6(T0* a1);
/* GEANT_PARENT.apply_renames */
extern void T192f15(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].back */
extern void T473f8(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_back */
extern void T332f61(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].add_traversing_cursor */
extern void T332f63(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].set_next_cursor */
extern void T473f10(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].remove_traversing_cursor */
extern void T332f62(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].set_position */
extern void T473f9(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].clashes_item */
extern T6 T332f28(T0* C, T6 a1);
/* GEANT_RENAME.is_executable */
extern T1 T331f3(T0* C);
/* GEANT_RENAME.string_ */
extern T0* T331f4(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].item */
extern T0* T473f4(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_item */
extern T0* T332f34(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].item_storage_item */
extern T0* T332f35(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].before */
extern T1 T473f5(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_before */
extern T1 T332f33(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].finish */
extern void T473f7(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_finish */
extern void T332f60(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_off */
extern T1 T332f37(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].is_empty */
extern T1 T332f36(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].new_cursor */
extern T0* T332f26(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].make */
extern T0* T473c6(T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].item */
extern T0* T195f4(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_item */
extern T0* T194f10(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].item */
extern T0* T194f12(T0* C, T6 a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].after */
extern T1 T195f6(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_after */
extern T1 T194f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].start */
extern void T195f8(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_start */
extern void T194f20(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].is_empty */
extern T1 T194f13(T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].off */
extern T1 T195f5(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_off */
extern T1 T194f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_before */
extern T1 T194f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].new_cursor */
extern T0* T194f6(T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].make */
extern T0* T195c7(T0* a1);
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
extern T0* T86f8(T0* C, T6 a1);
/* KL_PATHNAME.is_parent */
extern T1 T86f7(T0* C, T6 a1);
/* KL_PATHNAME.is_current */
extern T1 T86f11(T0* C, T6 a1);
/* KL_WINDOWS_FILE_SYSTEM.root_directory */
extern unsigned char ge176os4040;
extern T0* ge176ov4040;
extern T0* T53f16(T0* C);
/* KL_UNIX_FILE_SYSTEM.string_to_pathname */
extern T0* T54f5(T0* C, T0* a1);
/* KL_PATHNAME.append_name */
extern void T86f17(T0* C, T0* a1);
/* ARRAY [STRING_8].force */
extern void T33f16(T0* C, T0* a1, T6 a2);
/* ARRAY [STRING_8].auto_resize */
extern void T33f17(T0* C, T6 a1, T6 a2);
/* SPECIAL [STRING_8].fill_with_default */
extern void T32f12(T0* C, T6 a1, T6 a2);
/* SPECIAL [STRING_8].move_data */
extern void T32f11(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].overlapping_move */
extern void T32f14(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].non_overlapping_move */
extern void T32f13(T0* C, T6 a1, T6 a2, T6 a3);
/* ARRAY [STRING_8].capacity */
extern T6 T33f8(T0* C);
/* ARRAY [STRING_8].additional_space */
extern T6 T33f7(T0* C);
/* INTEGER_32.min */
extern T6 T6f19(T6* C, T6 a1);
/* ARRAY [STRING_8].empty_area */
extern T1 T33f6(T0* C);
/* KL_PATHNAME.append_parent */
extern void T86f16(T0* C);
/* KL_PATHNAME.append_current */
extern void T86f15(T0* C);
/* KL_PATHNAME.set_relative */
extern void T86f14(T0* C, T1 a1);
/* KL_PATHNAME.make */
extern T0* T86c13(void);
/* KL_WINDOWS_FILE_SYSTEM.any_ */
extern T0* T53f6(T0* C);
/* KL_UNIX_FILE_SYSTEM.pathname_from_file_system */
extern T0* T54f3(T0* C, T0* a1, T0* a2);
/* KL_UNIX_FILE_SYSTEM.pathname_to_string */
extern T0* T54f8(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.root_directory */
extern unsigned char ge173os4040;
extern T0* ge173ov4040;
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
extern void T47f20(T0* C, T2 a1);
/* KL_STDERR_FILE.old_put_character */
extern void T47f21(T0* C, T2 a1);
/* KL_STDERR_FILE.console_pc */
extern void T47f22(T0* C, T14 a1, T2 a2);
/* GEANT_PROJECT_LOADER.std */
extern T0* T23f5(T0* C);
/* KL_TEXT_INPUT_FILE.close */
extern void T55f59(T0* C);
/* KL_TEXT_INPUT_FILE.old_close */
extern void T55f63(T0* C);
/* KL_TEXT_INPUT_FILE.file_close */
extern void T55f65(T0* C, T14 a1);
/* GEANT_PROJECT_PARSER.parse_file */
extern void T56f9(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.last_error_extended_description */
extern T0* T93f89(T0* C);
/* XM_EIFFEL_PARSER.string_ */
extern T0* T93f85(T0* C);
/* XM_EIFFEL_PARSER.last_error_description */
extern T0* T93f177(T0* C);
/* XM_EIFFEL_PARSER.safe_error_component */
extern T0* T93f165(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_safe_error_character */
extern T1 T93f109(T0* C, T2 a1);
/* CHARACTER_8.is_greater_equal */
extern T1 T2f4(T2* C, T2 a1);
/* XM_EIFFEL_PARSER.position */
extern T0* T93f137(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].first */
extern T0* T135f5(T0* C);
/* XM_EIFFEL_PARSER.positions */
extern T0* T93f91(T0* C);
/* XM_EIFFEL_PARSER.new_positions */
extern T0* T93f130(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].remove */
extern void T136f7(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].item */
extern T0* T136f4(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].is_empty */
extern T1 T136f3(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].force_last */
extern void T135f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].put_right */
extern void T223f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].attach_left */
extern void T223f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].make */
extern T0* T223c4(T0* a1);
/* DS_BILINKED_LIST [XM_POSITION].is_empty */
extern T1 T135f7(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].make */
extern T0* T135c8(void);
/* DS_BILINKED_LIST [XM_POSITION].set_internal_cursor */
extern void T135f10(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_POSITION].new_cursor */
extern T0* T135f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_POSITION].make */
extern T0* T224c3(T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].copy */
extern void T136f6(T0* C, T0* a1);
/* DS_LINKABLE [XM_EIFFEL_SCANNER].put_right */
extern void T225f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_EIFFEL_SCANNER].make */
extern T0* T225c3(T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].make */
extern T0* T136c5(void);
/* KL_STDERR_FILE.flush */
extern void T47f23(T0* C);
/* KL_STDERR_FILE.old_flush */
extern void T47f24(T0* C);
/* KL_STDERR_FILE.file_flush */
extern void T47f25(T0* C, T14 a1);
/* XM_TREE_CALLBACKS_PIPE.last_error */
extern T0* T94f5(T0* C);
/* GEANT_PROJECT_PARSER.std */
extern T0* T56f7(T0* C);
/* GEANT_PROJECT.set_position_table */
extern void T22f36(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.make */
extern T0* T30c20(T0* a1, T0* a2, T0* a3, T0* a4);
/* GEANT_PROJECT_ELEMENT.load_parent_projects */
extern void T30f23(T0* C);
/* GEANT_INHERIT_ELEMENT.make */
extern T0* T122c11(T0* a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.exit_application */
extern void T122f13(T0* C, T6 a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.exceptions */
extern T0* T122f8(T0* C);
/* GEANT_INHERIT_ELEMENT.std */
extern T0* T122f7(T0* C);
/* GEANT_INHERIT_ELEMENT.log_messages */
extern void T122f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].force_last */
extern void T194f17(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].force */
extern void T318f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_PARENT].fill_with */
extern void T319f7(T0* C, T0* a1, T6 a2, T6 a3);
/* DS_ARRAYED_LIST [GEANT_PARENT].resize */
extern void T194f19(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].resize */
extern T0* T318f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_PARENT].aliased_resized_area */
extern T0* T319f3(T0* C, T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].new_capacity */
extern T6 T194f7(T0* C, T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].extendible */
extern T1 T194f8(T0* C, T6 a1);
/* GEANT_PARENT.is_executable */
extern T1 T192f9(T0* C);
/* GEANT_PARENT_ELEMENT.make */
extern T0* T213c18(T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].force_last */
extern void T336f39(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].key_storage_put */
extern void T336f48(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].slots_put */
extern void T336f47(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].clashes_put */
extern void T336f46(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].slots_item */
extern T6 T336f21(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].hash_position */
extern T6 T336f23(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].resize */
extern void T336f45(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].clashes_resize */
extern void T336f53(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].special_integer_ */
extern T0* T336f26(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].key_storage_resize */
extern void T336f52(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].item_storage_resize */
extern void T336f51(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].resize */
extern T0* T486f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_SELECT].aliased_resized_area */
extern T0* T484f3(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].key_storage_item */
extern T0* T336f24(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].slots_resize */
extern void T336f50(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].new_modulus */
extern T6 T336f29(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].new_capacity */
extern T6 T336f22(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].item_storage_put */
extern void T336f44(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].search_position */
extern void T336f43(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].unset_found_item */
extern void T336f42(T0* C);
/* GEANT_SELECT_ELEMENT.make */
extern T0* T330c9(T0* a1, T0* a2);
/* GEANT_SELECT.set_name */
extern void T335f4(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.attribute_value */
extern T0* T330f7(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.project_variables_resolver */
extern T0* T330f8(T0* C);
/* GEANT_SELECT_ELEMENT.has_attribute */
extern T1 T330f6(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.target_attribute_name */
extern unsigned char ge100os9034;
extern T0* ge100ov9034;
extern T0* T330f5(T0* C);
/* GEANT_SELECT.make */
extern T0* T335c3(void);
/* GEANT_SELECT_ELEMENT.interpreting_element_make */
extern void T330f10(T0* C, T0* a1, T0* a2);
/* GEANT_SELECT_ELEMENT.set_project */
extern void T330f12(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.element_make */
extern void T330f11(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.set_xml_element */
extern void T330f13(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.select_element_name */
extern unsigned char ge92os7986;
extern T0* ge92ov7986;
extern T0* T213f10(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].force_last */
extern void T334f39(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].key_storage_put */
extern void T334f48(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].slots_put */
extern void T334f47(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].clashes_put */
extern void T334f46(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].slots_item */
extern T6 T334f21(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].hash_position */
extern T6 T334f23(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].resize */
extern void T334f45(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].clashes_resize */
extern void T334f53(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].special_integer_ */
extern T0* T334f26(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].key_storage_resize */
extern void T334f52(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].item_storage_resize */
extern void T334f51(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].resize */
extern T0* T480f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_REDEFINE].aliased_resized_area */
extern T0* T478f3(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].key_storage_item */
extern T0* T334f24(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].slots_resize */
extern void T334f50(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].new_modulus */
extern T6 T334f29(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].new_capacity */
extern T6 T334f22(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].item_storage_put */
extern void T334f44(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].search_position */
extern void T334f43(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].unset_found_item */
extern void T334f42(T0* C);
/* GEANT_REDEFINE_ELEMENT.make */
extern T0* T329c9(T0* a1, T0* a2);
/* GEANT_REDEFINE.set_name */
extern void T333f4(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.attribute_value */
extern T0* T329f7(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.project_variables_resolver */
extern T0* T329f8(T0* C);
/* GEANT_REDEFINE_ELEMENT.has_attribute */
extern T1 T329f6(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.target_attribute_name */
extern unsigned char ge96os9030;
extern T0* ge96ov9030;
extern T0* T329f5(T0* C);
/* GEANT_REDEFINE.make */
extern T0* T333c3(void);
/* GEANT_REDEFINE_ELEMENT.interpreting_element_make */
extern void T329f10(T0* C, T0* a1, T0* a2);
/* GEANT_REDEFINE_ELEMENT.set_project */
extern void T329f12(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.element_make */
extern void T329f11(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.set_xml_element */
extern void T329f13(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.redefine_element_name */
extern unsigned char ge92os7985;
extern T0* ge92ov7985;
extern T0* T213f9(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].force_last */
extern void T332f40(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].key_storage_put */
extern void T332f49(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].slots_put */
extern void T332f48(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].clashes_put */
extern void T332f47(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].slots_item */
extern T6 T332f24(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].hash_position */
extern T6 T332f22(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].resize */
extern void T332f46(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].clashes_resize */
extern void T332f54(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].special_integer_ */
extern T0* T332f27(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].key_storage_resize */
extern void T332f53(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].item_storage_resize */
extern void T332f52(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].resize */
extern T0* T474f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_RENAME].aliased_resized_area */
extern T0* T472f3(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].key_storage_item */
extern T0* T332f25(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].slots_resize */
extern void T332f51(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].new_modulus */
extern T6 T332f31(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].new_capacity */
extern T6 T332f30(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].item_storage_put */
extern void T332f45(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].search_position */
extern void T332f42(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].unset_found_item */
extern void T332f44(T0* C);
/* GEANT_PARENT_ELEMENT.exit_application */
extern void T213f20(T0* C, T6 a1, T0* a2);
/* GEANT_PARENT_ELEMENT.exceptions */
extern T0* T213f14(T0* C);
/* GEANT_PARENT_ELEMENT.std */
extern T0* T213f13(T0* C);
/* GEANT_PARENT_ELEMENT.log_messages */
extern void T213f23(T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].put_last */
extern void T71f34(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].has */
extern T1 T332f29(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.make */
extern T0* T328c10(T0* a1, T0* a2);
/* GEANT_RENAME.set_new_name */
extern void T331f7(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.as_attribute_name */
extern unsigned char ge98os9026;
extern T0* ge98ov9026;
extern T0* T328f5(T0* C);
/* GEANT_RENAME.set_original_name */
extern void T331f6(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.attribute_value */
extern T0* T328f8(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.project_variables_resolver */
extern T0* T328f9(T0* C);
/* GEANT_RENAME_ELEMENT.has_attribute */
extern T1 T328f7(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.target_attribute_name */
extern unsigned char ge98os9025;
extern T0* ge98ov9025;
extern T0* T328f6(T0* C);
/* GEANT_RENAME.make */
extern T0* T331c5(void);
/* GEANT_RENAME_ELEMENT.interpreting_element_make */
extern void T328f11(T0* C, T0* a1, T0* a2);
/* GEANT_RENAME_ELEMENT.set_project */
extern void T328f13(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.element_make */
extern void T328f12(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.set_xml_element */
extern void T328f14(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.elements_by_name */
extern T0* T213f8(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].force_last */
extern void T120f9(T0* C, T0* a1);
/* DS_LINKABLE [XM_ELEMENT].put_right */
extern void T212f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_ELEMENT].make */
extern T0* T212c3(T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].is_empty */
extern T1 T120f5(T0* C);
/* GEANT_PARENT_ELEMENT.string_ */
extern T0* T213f15(T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].make */
extern T0* T120c8(void);
/* DS_LINKED_LIST [XM_ELEMENT].set_internal_cursor */
extern void T120f10(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.rename_element_name */
extern unsigned char ge92os7984;
extern T0* ge92ov7984;
extern T0* T213f7(T0* C);
/* GEANT_PARENT.set_parent_project */
extern void T192f13(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.attribute_value */
extern T0* T213f11(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.project_variables_resolver */
extern T0* T213f16(T0* C);
/* GEANT_PARENT_ELEMENT.has_attribute */
extern T1 T213f6(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.location_attribute_name */
extern unsigned char ge92os7982;
extern T0* ge92ov7982;
extern T0* T213f5(T0* C);
/* GEANT_PARENT.make */
extern T0* T192c12(T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].set_key_equality_tester */
extern void T336f40(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_SELECT, STRING_8].internal_set_equality_tester */
extern void T482f6(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_map_equal */
extern T0* T336c38(T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_with_equality_testers */
extern void T336f41(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [GEANT_SELECT, STRING_8].make */
extern T0* T482c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_SELECT, STRING_8].set_internal_cursor */
extern void T482f7(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_SELECT, STRING_8].new_cursor */
extern T0* T482f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_SELECT, STRING_8].make */
extern T0* T534c3(T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_sparse_container */
extern void T336f49(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].set_internal_cursor */
extern void T336f58(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_slots */
extern void T336f57(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_clashes */
extern void T336f56(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_key_storage */
extern void T336f55(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_item_storage */
extern void T336f54(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].make */
extern T0* T486f2(T0* C, T6 a1);
/* ARRAY [GEANT_SELECT].make_empty */
extern T0* T535c4(void);
/* ARRAY [GEANT_SELECT].make_area */
extern void T535f5(T0* C, T6 a1);
/* SPECIAL [GEANT_SELECT].make */
extern T0* T484c5(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].default_create */
extern T0* T486c3(void);
/* KL_EQUALITY_TESTER [GEANT_SELECT].default_create */
extern T0* T481c1(void);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].set_key_equality_tester */
extern void T334f40(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_REDEFINE, STRING_8].internal_set_equality_tester */
extern void T476f6(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_map_equal */
extern T0* T334c38(T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_with_equality_testers */
extern void T334f41(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [GEANT_REDEFINE, STRING_8].make */
extern T0* T476c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_REDEFINE, STRING_8].set_internal_cursor */
extern void T476f7(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_REDEFINE, STRING_8].new_cursor */
extern T0* T476f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_REDEFINE, STRING_8].make */
extern T0* T532c3(T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_sparse_container */
extern void T334f49(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].set_internal_cursor */
extern void T334f58(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_slots */
extern void T334f57(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_clashes */
extern void T334f56(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_key_storage */
extern void T334f55(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_item_storage */
extern void T334f54(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].make */
extern T0* T480f2(T0* C, T6 a1);
/* ARRAY [GEANT_REDEFINE].make_empty */
extern T0* T533c4(void);
/* ARRAY [GEANT_REDEFINE].make_area */
extern void T533f5(T0* C, T6 a1);
/* SPECIAL [GEANT_REDEFINE].make */
extern T0* T478c5(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].default_create */
extern T0* T480c3(void);
/* KL_EQUALITY_TESTER [GEANT_REDEFINE].default_create */
extern T0* T475c1(void);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].set_key_equality_tester */
extern void T332f41(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_RENAME, STRING_8].internal_set_equality_tester */
extern void T470f6(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_map_equal */
extern T0* T332c39(T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_with_equality_testers */
extern void T332f43(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [GEANT_RENAME, STRING_8].make */
extern T0* T470c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_RENAME, STRING_8].set_internal_cursor */
extern void T470f7(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_RENAME, STRING_8].new_cursor */
extern T0* T470f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_RENAME, STRING_8].make */
extern T0* T530c3(T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_sparse_container */
extern void T332f50(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].set_internal_cursor */
extern void T332f59(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_slots */
extern void T332f58(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_clashes */
extern void T332f57(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_key_storage */
extern void T332f56(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_item_storage */
extern void T332f55(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].make */
extern T0* T474f2(T0* C, T6 a1);
/* ARRAY [GEANT_RENAME].make_empty */
extern T0* T531c4(void);
/* ARRAY [GEANT_RENAME].make_area */
extern void T531f5(T0* C, T6 a1);
/* SPECIAL [GEANT_RENAME].make */
extern T0* T472c5(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].default_create */
extern T0* T474c3(void);
/* KL_EQUALITY_TESTER [GEANT_RENAME].default_create */
extern T0* T469c1(void);
/* GEANT_PARENT_ELEMENT.interpreting_element_make */
extern void T213f19(T0* C, T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.set_project */
extern void T213f22(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.element_make */
extern void T213f21(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.set_xml_element */
extern void T213f24(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.elements_by_name */
extern T0* T122f6(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.string_ */
extern T0* T122f9(T0* C);
/* GEANT_INHERIT_ELEMENT.parent_element_name */
extern unsigned char ge85os6546;
extern T0* ge85ov6546;
extern T0* T122f5(T0* C);
/* GEANT_INHERIT.make */
extern T0* T123c6(T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].make */
extern T0* T194c16(T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].set_internal_cursor */
extern void T194f18(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].make */
extern T0* T318f1(T0* C, T6 a1);
/* ARRAY [GEANT_PARENT].make_empty */
extern T0* T465c4(void);
/* ARRAY [GEANT_PARENT].make_area */
extern void T465f5(T0* C, T6 a1);
/* SPECIAL [GEANT_PARENT].make */
extern T0* T319c5(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].default_create */
extern T0* T318c3(void);
/* GEANT_INHERIT_ELEMENT.interpreting_element_make */
extern void T122f12(T0* C, T0* a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.set_project */
extern void T122f15(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.element_make */
extern void T122f14(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.set_xml_element */
extern void T122f17(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.inherit_element_name */
extern unsigned char ge93os2519;
extern T0* ge93ov2519;
extern T0* T30f16(T0* C);
/* GEANT_PROJECT.set_inherit_clause */
extern void T22f42(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.make_old */
extern T0* T122c10(T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.make_old */
extern T0* T213c17(T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.inherit_attribute_name */
extern unsigned char ge92os7983;
extern T0* ge92ov7983;
extern T0* T213f12(T0* C);
/* GEANT_PROJECT.set_old_inherit */
extern void T22f41(T0* C, T1 a1);
/* GEANT_PROJECT_ELEMENT.has_inherit_element */
extern T1 T30f15(T0* C);
/* GEANT_PROJECT_ELEMENT.inherit_attribute_name */
extern unsigned char ge93os2518;
extern T0* ge93ov2518;
extern T0* T30f14(T0* C);
/* GEANT_PROJECT.set_targets */
extern void T22f40(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].forth */
extern void T121f9(T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_forth */
extern void T120f12(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].add_traversing_cursor */
extern void T120f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].set_next_cursor */
extern void T121f11(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].remove_traversing_cursor */
extern void T120f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].set */
extern void T121f10(T0* C, T0* a1, T1 a2, T1 a3);
/* GEANT_TARGET.make */
extern T0* T26c63(T0* a1, T0* a2);
/* GEANT_TARGET.initialize */
extern void T26f64(T0* C);
/* GEANT_TARGET.initialize */
extern void T26f64p1(T0* C);
/* GEANT_TARGET.set_description */
extern void T26f72(T0* C, T0* a1);
/* GEANT_GLOBAL_ELEMENT.name */
extern T0* T199f2(T0* C);
/* GEANT_GLOBAL_ELEMENT.attribute_value */
extern T0* T199f5(T0* C, T0* a1);
/* GEANT_GLOBAL_ELEMENT.name_attribute_name */
extern unsigned char ge90os7680;
extern T0* ge90ov7680;
extern T0* T199f3(T0* C);
/* GEANT_GLOBAL_ELEMENT.has_name */
extern T1 T199f6(T0* C);
/* GEANT_GLOBAL_ELEMENT.has_attribute */
extern T1 T199f4(T0* C, T0* a1);
/* GEANT_GLOBAL_ELEMENT.make */
extern T0* T199c7(T0* a1);
/* GEANT_GLOBAL_ELEMENT.set_xml_element */
extern void T199f8(T0* C, T0* a1);
/* GEANT_LOCAL_ELEMENT.name */
extern T0* T198f2(T0* C);
/* GEANT_LOCAL_ELEMENT.attribute_value */
extern T0* T198f5(T0* C, T0* a1);
/* GEANT_LOCAL_ELEMENT.name_attribute_name */
extern T0* T198f3(T0* C);
/* GEANT_LOCAL_ELEMENT.has_name */
extern T1 T198f6(T0* C);
/* GEANT_LOCAL_ELEMENT.has_attribute */
extern T1 T198f4(T0* C, T0* a1);
/* GEANT_LOCAL_ELEMENT.make */
extern T0* T198c7(T0* a1);
/* GEANT_LOCAL_ELEMENT.set_xml_element */
extern void T198f8(T0* C, T0* a1);
/* GEANT_TARGET.empty_variables */
extern unsigned char ge10os1751;
extern T0* ge10ov1751;
extern T0* T26f18(T0* C);
/* GEANT_ARGUMENT_ELEMENT.name */
extern T0* T197f2(T0* C);
/* GEANT_ARGUMENT_ELEMENT.attribute_value */
extern T0* T197f5(T0* C, T0* a1);
/* GEANT_ARGUMENT_ELEMENT.name_attribute_name */
extern T0* T197f3(T0* C);
/* GEANT_ARGUMENT_ELEMENT.has_name */
extern T1 T197f6(T0* C);
/* GEANT_ARGUMENT_ELEMENT.has_attribute */
extern T1 T197f4(T0* C, T0* a1);
/* GEANT_ARGUMENT_ELEMENT.make */
extern T0* T197c7(T0* a1);
/* GEANT_ARGUMENT_ELEMENT.set_xml_element */
extern void T197f8(T0* C, T0* a1);
/* GEANT_TARGET.elements_by_name */
extern T0* T26f16(T0* C, T0* a1);
/* GEANT_TARGET.empty_argument_variables */
extern unsigned char ge10os1752;
extern T0* ge10ov1752;
extern T0* T26f42(T0* C);
/* GEANT_TARGET.set_execute_once */
extern void T26f71(T0* C, T1 a1);
/* GEANT_TARGET.boolean_value */
extern T1 T26f36(T0* C, T0* a1);
/* GEANT_TARGET.false_attribute_value */
extern unsigned char ge78os2391;
extern T0* ge78ov2391;
extern T0* T26f32(T0* C);
/* GEANT_TARGET.true_attribute_value */
extern unsigned char ge78os2390;
extern T0* ge78ov2390;
extern T0* T26f31(T0* C);
/* GEANT_TARGET.attribute_value */
extern T0* T26f29(T0* C, T0* a1);
/* GEANT_TARGET.once_attribute_name */
extern unsigned char ge12os2345;
extern T0* ge12ov2345;
extern T0* T26f27(T0* C);
/* GEANT_TARGET.set_exports */
extern void T26f70(T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].set_equality_tester */
extern void T71f39(T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].put */
extern void T71f31(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [detachable STRING_8].move_cursors_right */
extern void T71f36(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [detachable STRING_8].move_right */
extern void T71f35(T0* C, T6 a1, T6 a2);
/* GEANT_TARGET.export_attribute_name */
extern unsigned char ge12os2344;
extern T0* ge12ov2344;
extern T0* T26f20(T0* C);
/* GEANT_TARGET.set_obsolete_message */
extern void T26f69(T0* C, T0* a1);
/* GEANT_TARGET.set_name */
extern void T26f68(T0* C, T0* a1);
/* GEANT_TARGET.name_attribute_name */
extern unsigned char ge12os2341;
extern T0* ge12ov2341;
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
extern T0* T121f6(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].start */
extern void T121f8(T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_start */
extern void T120f11(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_off */
extern T1 T120f7(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].new_cursor */
extern T0* T120f6(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].make */
extern T0* T121c7(T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].set_key_equality_tester */
extern void T31f47(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_map */
extern T0* T31c46(T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_with_equality_testers */
extern void T31f50(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [GEANT_TARGET, STRING_8].make */
extern T0* T126c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_TARGET, STRING_8].set_internal_cursor */
extern void T126f7(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_TARGET, STRING_8].new_cursor */
extern T0* T126f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_TARGET, STRING_8].make */
extern T0* T215c3(T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_sparse_container */
extern void T31f58(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].set_internal_cursor */
extern void T31f67(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_slots */
extern void T31f66(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_clashes */
extern void T31f65(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_key_storage */
extern void T31f64(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_item_storage */
extern void T31f63(T0* C, T6 a1);
/* GEANT_PROJECT_ELEMENT.elements_by_name */
extern T0* T30f11(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.string_ */
extern T0* T30f19(T0* C);
/* GEANT_PROJECT_ELEMENT.target_element_name */
extern unsigned char ge93os2521;
extern T0* ge93ov2521;
extern T0* T30f10(T0* C);
/* GEANT_PROJECT.set_default_target_name */
extern void T22f38(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.default_attribute_name */
extern unsigned char ge93os2517;
extern T0* ge93ov2517;
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
extern T1 T99f15(T0* C, T0* a1);
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
extern unsigned char ge93os2516;
extern T0* ge93ov2516;
extern T0* T30f5(T0* C);
/* GEANT_PROJECT.make */
extern T0* T22c30(T0* a1, T0* a2, T0* a3);
/* GEANT_TASK_FACTORY.make */
extern T0* T191c55(T0* a1);
/* GEANT_TASK_FACTORY.create_builders */
extern void T191f56(T0* C);
/* Creation of agent #1 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac1(T0* a1);
/* Creation of agent #2 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac2(T0* a1);
/* Creation of agent #3 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac3(T0* a1);
/* Creation of agent #4 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac4(T0* a1);
/* Creation of agent #5 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac5(T0* a1);
/* Creation of agent #6 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac6(T0* a1);
/* Creation of agent #7 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac7(T0* a1);
/* Creation of agent #8 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac8(T0* a1);
/* Creation of agent #9 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac9(T0* a1);
/* Creation of agent #10 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac10(T0* a1);
/* Creation of agent #11 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac11(T0* a1);
/* Creation of agent #12 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac12(T0* a1);
/* Creation of agent #13 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac13(T0* a1);
/* Creation of agent #14 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac14(T0* a1);
/* Creation of agent #15 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac15(T0* a1);
/* Creation of agent #16 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac16(T0* a1);
/* Creation of agent #17 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac17(T0* a1);
/* Creation of agent #18 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac18(T0* a1);
/* Creation of agent #19 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac19(T0* a1);
/* Creation of agent #20 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac20(T0* a1);
/* Creation of agent #21 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac21(T0* a1);
/* Creation of agent #22 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac22(T0* a1);
/* Creation of agent #23 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac23(T0* a1);
/* Creation of agent #24 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac24(T0* a1);
/* Creation of agent #25 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac25(T0* a1);
/* GEANT_TASK_FACTORY.new_replace_task */
extern T0* T191f52(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.make */
extern T0* T316c31(T0* a1, T0* a2);
/* GEANT_REPLACE_COMMAND.set_fileset */
extern void T462f38(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.make */
extern T0* T384c29(T0* a1, T0* a2);
/* GEANT_FILESET.set_map */
extern void T390f47(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.make */
extern T0* T500c12(T0* a1, T0* a2);
/* GEANT_MAP.set_map */
extern void T501f21(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.map_element_name */
extern unsigned char ge89os9509;
extern T0* ge89ov9509;
extern T0* T500f9(T0* C);
/* GEANT_MAP.set_target_pattern */
extern void T501f20(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.to_attribute_name */
extern unsigned char ge89os9508;
extern T0* ge89ov9508;
extern T0* T500f7(T0* C);
/* GEANT_MAP.set_source_pattern */
extern void T501f19(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.from_attribute_name */
extern unsigned char ge89os9507;
extern T0* ge89ov9507;
extern T0* T500f6(T0* C);
/* GEANT_MAP.set_type */
extern void T501f18(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.attribute_value */
extern T0* T500f5(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.project_variables_resolver */
extern T0* T500f11(T0* C);
/* GEANT_MAP_ELEMENT.has_attribute */
extern T1 T500f10(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.type_attribute_name */
extern unsigned char ge89os9506;
extern T0* ge89ov9506;
extern T0* T500f8(T0* C);
/* GEANT_MAP.make */
extern T0* T501c17(T0* a1);
/* GEANT_MAP.type_attribute_value_identity */
extern unsigned char ge88os9522;
extern T0* ge88ov9522;
extern T0* T501f6(T0* C);
/* GEANT_MAP_ELEMENT.make */
extern void T500f12p1(T0* C, T0* a1, T0* a2);
/* GEANT_MAP_ELEMENT.set_project */
extern void T500f14(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.element_make */
extern void T500f13(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.set_xml_element */
extern void T500f15(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.map_element_name */
extern unsigned char ge81os9193;
extern T0* ge81ov9193;
extern T0* T384f21(T0* C);
/* GEANT_FILESET.add_single_exclude */
extern void T390f46(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].force_last */
extern void T506f37(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].slots_put */
extern void T506f48(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING_8].clashes_put */
extern void T506f47(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING_8].slots_item */
extern T6 T506f20(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].hash_position */
extern T6 T506f17(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].resize */
extern void T506f46(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].clashes_resize */
extern void T506f52(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].special_integer_ */
extern T0* T506f18(T0* C);
/* DS_HASH_SET [STRING_8].key_storage_resize */
extern void T506f51(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_resize */
extern void T506f50(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].key_storage_item */
extern T0* T506f24(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_item */
extern T0* T506f28(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].clashes_item */
extern T6 T506f25(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].slots_resize */
extern void T506f49(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].new_modulus */
extern T6 T506f19(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].new_capacity */
extern T6 T506f27(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_put */
extern void T506f45(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [STRING_8].search_position */
extern void T506f44(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].key_equality_tester */
extern T0* T506f23(T0* C);
/* DS_HASH_SET [STRING_8].unset_found_item */
extern void T506f42(T0* C);
/* GEANT_FILESET_ELEMENT.exclude_element_name */
extern unsigned char ge81os9192;
extern T0* ge81ov9192;
extern T0* T384f19(T0* C);
/* GEANT_FILESET.add_single_include */
extern void T390f45(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.name */
extern T0* T402f4(T0* C);
/* GEANT_DEFINE_ELEMENT.attribute_value */
extern T0* T402f14(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.project_variables_resolver */
extern T0* T402f6(T0* C);
/* GEANT_DEFINE_ELEMENT.name_attribute_name */
extern T0* T402f13(T0* C);
/* GEANT_DEFINE_ELEMENT.has_name */
extern T1 T402f10(T0* C);
/* GEANT_DEFINE_ELEMENT.has_attribute */
extern T1 T402f9(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.is_enabled */
extern T1 T402f7(T0* C);
/* GEANT_DEFINE_ELEMENT.unless_attribute_name */
extern T0* T402f11(T0* C);
/* GEANT_DEFINE_ELEMENT.if_attribute_name */
extern T0* T402f8(T0* C);
/* GEANT_DEFINE_ELEMENT.make */
extern T0* T402c16(T0* a1, T0* a2);
/* GEANT_DEFINE_ELEMENT.set_project */
extern void T402f18(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.element_make */
extern void T402f17(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.set_xml_element */
extern void T402f19(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.elements_by_name */
extern T0* T384f18(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.string_ */
extern T0* T384f26(T0* C);
/* GEANT_FILESET_ELEMENT.include_element_name */
extern unsigned char ge81os9191;
extern T0* ge81ov9191;
extern T0* T384f17(T0* C);
/* GEANT_FILESET.set_convert_to_filesystem */
extern void T390f44(T0* C, T1 a1);
/* GEANT_FILESET_ELEMENT.convert_attribute_name */
extern unsigned char ge81os9189;
extern T0* ge81ov9189;
extern T0* T384f16(T0* C);
/* GEANT_FILESET.set_mapped_filename_directory_name */
extern void T390f43(T0* C, T0* a1);
/* GEANT_FILESET.set_filename_directory_name */
extern void T390f42(T0* C, T0* a1);
/* GEANT_FILESET.set_mapped_filename_variable_name */
extern void T390f41(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.mapped_filename_variable_name_attribute_name */
extern unsigned char ge81os9187;
extern T0* ge81ov9187;
extern T0* T384f15(T0* C);
/* GEANT_FILESET.set_filename_variable_name */
extern void T390f40(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.filename_variable_name_attribute_name */
extern unsigned char ge81os9186;
extern T0* ge81ov9186;
extern T0* T384f14(T0* C);
/* GEANT_FILESET.set_concat */
extern void T390f39(T0* C, T1 a1);
/* GEANT_FILESET.set_force */
extern void T390f38(T0* C, T1 a1);
/* GEANT_FILESET_ELEMENT.boolean_value */
extern T1 T384f13(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.std */
extern T0* T384f23(T0* C);
/* GEANT_FILESET_ELEMENT.false_attribute_value */
extern T0* T384f28(T0* C);
/* GEANT_FILESET_ELEMENT.true_attribute_value */
extern T0* T384f27(T0* C);
/* GEANT_FILESET_ELEMENT.force_attribute_name */
extern unsigned char ge81os9184;
extern T0* ge81ov9184;
extern T0* T384f12(T0* C);
/* GEANT_FILESET.set_exclude_wc_string */
extern void T390f37(T0* C, T0* a1);
/* LX_DFA_WILDCARD.is_compiled */
extern T1 T508f14(T0* C);
/* LX_DFA_WILDCARD.compile */
extern T0* T508c16(T0* a1, T1 a2);
/* LX_FULL_DFA.make */
extern T0* T550c37(T0* a1);
/* LX_FULL_DFA.build */
extern void T550f40(T0* C);
/* LX_FULL_DFA.build_accept_table */
extern void T550f46(T0* C);
/* ARRAY [INTEGER_32].put */
extern void T108f14(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [LX_RULE].first */
extern T0* T571f6(T0* C);
/* ARRAY [INTEGER_32].make_filled */
extern T0* T108c11(T6 a1, T6 a2, T6 a3);
/* ARRAY [INTEGER_32].make_filled_area */
extern void T108f12(T0* C, T6 a1, T6 a2);
/* SPECIAL [INTEGER_32].make_filled */
extern T0* T63c10(T6 a1, T6 a2);
/* SPECIAL [INTEGER_32].fill_with */
extern void T63f9(T0* C, T6 a1, T6 a2, T6 a3);
/* LX_FULL_DFA.build_nxt_table */
extern void T550f45(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].target */
extern T0* T602f6(T0* C, T6 a1);
/* ARRAY [LX_DFA_STATE].item */
extern T0* T649f4(T0* C, T6 a1);
/* LX_DFA_STATE.is_accepting */
extern T1 T596f10(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].is_empty */
extern T1 T571f11(T0* C);
/* LX_FULL_DFA.build_transitions */
extern void T550f44(T0* C, T0* a1);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].set_target */
extern void T602f8(T0* C, T0* a1, T6 a2);
/* ARRAY [LX_DFA_STATE].put */
extern void T649f9(T0* C, T0* a1, T6 a2);
/* LX_SYMBOL_PARTITIONS.previous_symbol */
extern T6 T599f4(T0* C, T6 a1);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].item */
extern T0* T632f4(T0* C, T6 a1);
/* LX_FULL_DFA.new_state */
extern T0* T550f36(T0* C, T0* a1);
/* LX_DFA_STATE.set_id */
extern void T596f17(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].put_last */
extern void T598f9(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].force */
extern void T646f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [LX_DFA_STATE].fill_with */
extern void T645f7(T0* C, T0* a1, T6 a2, T6 a3);
/* LX_DFA_STATE.is_equal */
extern T1 T596f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].is_equal */
extern T1 T597f17(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].any_ */
extern T0* T597f19(T0* C);
/* LX_DFA_STATE.any_ */
extern T0* T596f14(T0* C);
/* LX_DFA_STATE.new_state */
extern T0* T596f9(T0* C, T6 a1);
/* LX_DFA_STATE.make */
extern T0* T596c16(T0* a1, T6 a2, T6 a3);
/* LX_RULE.set_useful */
extern void T581f22(T0* C, T1 a1);
/* DS_ARRAYED_LIST [LX_RULE].sort */
extern void T571f17(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_RULE].sort */
extern void T638f3(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_RULE].sort_with_comparator */
extern void T638f4(T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [LX_RULE].subsort_with_comparator */
extern void T638f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* DS_ARRAYED_LIST [LX_RULE].replace */
extern void T571f22(T0* C, T0* a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [LX_RULE].less_than */
extern T1 T665f1(T0* C, T0* a1, T0* a2);
/* LX_RULE.is_less */
extern T1 T581f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].item */
extern T0* T571f10(T0* C, T6 a1);
/* LX_DFA_STATE.rule_sorter */
extern unsigned char ge271os10595;
extern T0* ge271ov10595;
extern T0* T596f7(T0* C);
/* DS_BUBBLE_SORTER [LX_RULE].make */
extern T0* T638c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [LX_RULE].make */
extern T0* T665c2(void);
/* DS_ARRAYED_LIST [LX_NFA_STATE].sort */
extern void T597f29(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].sort */
extern void T636f3(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].sort_with_comparator */
extern void T636f4(T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].subsort_with_comparator */
extern void T636f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* DS_ARRAYED_LIST [LX_NFA_STATE].replace */
extern void T597f26(T0* C, T0* a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE].less_than */
extern T1 T668f1(T0* C, T0* a1, T0* a2);
/* LX_NFA_STATE.is_less */
extern T1 T605f8(T0* C, T0* a1);
/* LX_DFA_STATE.bubble_sorter */
extern unsigned char ge271os10594;
extern T0* ge271ov10594;
extern T0* T596f8(T0* C);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].make */
extern T0* T636c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE].make */
extern T0* T668c2(void);
/* DS_ARRAYED_LIST [LX_NFA_STATE].last */
extern T0* T597f9(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].is_empty */
extern T1 T597f8(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].force_last */
extern void T571f13(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].force */
extern void T615f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [LX_RULE].fill_with */
extern void T594f8(T0* C, T0* a1, T6 a2, T6 a3);
/* DS_ARRAYED_LIST [LX_RULE].resize */
extern void T571f15(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].resize */
extern T0* T615f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_RULE].aliased_resized_area */
extern T0* T594f3(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].new_capacity */
extern T6 T571f9(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].extendible */
extern T1 T571f8(T0* C, T6 a1);
/* LX_NFA_STATE.is_accepting_head */
extern T1 T605f6(T0* C);
/* LX_NFA_STATE.has_transition */
extern T1 T605f9(T0* C);
/* LX_NFA_STATE.is_accepting */
extern T1 T605f7(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].has */
extern T1 T597f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].force_last */
extern void T597f27(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].force */
extern void T642f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [LX_NFA_STATE].fill_with */
extern void T640f7(T0* C, T0* a1, T6 a2, T6 a3);
/* DS_ARRAYED_LIST [LX_NFA_STATE].resize */
extern void T597f32(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].resize */
extern T0* T642f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_NFA_STATE].aliased_resized_area */
extern T0* T640f4(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].new_capacity */
extern T6 T597f12(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].extendible */
extern T1 T597f11(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].make */
extern T0* T571c12(T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].set_internal_cursor */
extern void T571f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].new_cursor */
extern T0* T571f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_RULE].make */
extern T0* T616c4(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].make */
extern T0* T615f1(T0* C, T6 a1);
/* ARRAY [LX_RULE].make_empty */
extern T0* T595c7(void);
/* ARRAY [LX_RULE].make_area */
extern void T595f9(T0* C, T6 a1);
/* SPECIAL [LX_RULE].make */
extern void T594f7(T0* C, T6 a1);
/* SPECIAL [LX_RULE].make */
extern T0* T594c7(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].default_create */
extern T0* T615c3(void);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].make */
extern T0* T602c7(T6 a1, T6 a2);
/* KL_ARRAY_ROUTINES [LX_DFA_STATE].default_create */
extern T0* T650c1(void);
/* ARRAY [LX_DFA_STATE].make_filled */
extern T0* T649c5(T0* a1, T6 a2, T6 a3);
/* ARRAY [LX_DFA_STATE].make_filled_area */
extern void T649f7(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_DFA_STATE].make_filled */
extern T0* T645c5(T0* a1, T6 a2);
/* SPECIAL [LX_DFA_STATE].make */
extern void T645f8(T0* C, T6 a1);
/* SPECIAL [LX_DFA_STATE].make */
extern T0* T645c8(T6 a1);
/* LX_DFA_STATE.maximum_symbol */
extern T6 T596f13(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].upper */
extern T6 T602f5(T0* C);
/* LX_DFA_STATE.minimum_symbol */
extern T6 T596f12(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].lower */
extern T6 T602f4(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put_last */
extern void T597f24(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].item */
extern T0* T597f13(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].make */
extern T0* T597c23(T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].set_internal_cursor */
extern void T597f30(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].new_cursor */
extern T0* T597f10(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].make */
extern T0* T643c7(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].make */
extern T0* T642f1(T0* C, T6 a1);
/* ARRAY [LX_NFA_STATE].make_empty */
extern T0* T673c4(void);
/* ARRAY [LX_NFA_STATE].make_area */
extern void T673f5(T0* C, T6 a1);
/* SPECIAL [LX_NFA_STATE].make */
extern T0* T640c5(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].default_create */
extern T0* T642c3(void);
/* LX_SYMBOL_PARTITIONS.is_representative */
extern T1 T599f8(T0* C, T6 a1);
/* ARRAY [BOOLEAN].item */
extern T1 T244f4(T0* C, T6 a1);
/* LX_DFA_STATE.partition */
extern void T596f18(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.initialize */
extern void T599f10(T0* C);
/* ARRAY [BOOLEAN].clear_all */
extern void T244f9(T0* C);
/* SPECIAL [BOOLEAN].clear_all */
extern void T155f10(T0* C);
/* LX_SYMBOL_PARTITIONS.initialize */
extern void T599f10p1(T0* C);
/* DS_BILINKABLE [INTEGER_32].put_left */
extern void T630f9(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].attach_right */
extern void T630f10(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].put */
extern void T630f5(T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.lower */
extern T6 T599f7(T0* C);
/* LX_SYMBOL_PARTITIONS.upper */
extern T6 T599f6(T0* C);
/* LX_FULL_DFA.resize */
extern void T550f49(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].resize */
extern void T598f10(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].resize */
extern T0* T646f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_DFA_STATE].aliased_resized_area */
extern T0* T645f4(T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.capacity */
extern T6 T599f5(T0* C);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].count */
extern T6 T632f5(T0* C);
/* DS_ARRAYED_LIST [LX_DFA_STATE].item */
extern T0* T598f7(T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.make */
extern T0* T599c9(T6 a1, T6 a2);
/* LX_SYMBOL_PARTITIONS.make */
extern void T599f9p1(T0* C, T6 a1, T6 a2);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].put */
extern void T632f7(T0* C, T0* a1, T6 a2);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].make_filled */
extern T0* T632c6(T0* a1, T6 a2, T6 a3);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].make_filled_area */
extern void T632f8(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKABLE [INTEGER_32]].make_filled */
extern T0* T631c3(T0* a1, T6 a2);
/* SPECIAL [DS_BILINKABLE [INTEGER_32]].fill_with */
extern void T631f6(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKABLE [INTEGER_32]].make */
extern void T631f5(T0* C, T6 a1);
/* DS_BILINKABLE [INTEGER_32].make */
extern T0* T630c4(T6 a1);
/* ARRAY [BOOLEAN].make_filled */
extern T0* T244c7(T1 a1, T6 a2, T6 a3);
/* ARRAY [BOOLEAN].make_filled_area */
extern void T244f10(T0* C, T1 a1, T6 a2);
/* SPECIAL [BOOLEAN].make_filled */
extern T0* T155c11(T1 a1, T6 a2);
/* SPECIAL [BOOLEAN].fill_with */
extern void T155f9(T0* C, T1 a1, T6 a2, T6 a3);
/* SPECIAL [BOOLEAN].make */
extern void T155f7(T0* C, T6 a1);
/* SPECIAL [BOOLEAN].make */
extern T0* T155c7(T6 a1);
/* LX_FULL_DFA.put_eob_state */
extern void T550f39(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].force_first */
extern void T571f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].put */
extern void T571f18(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [LX_RULE].move_cursors_right */
extern void T571f21(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_RULE].set_position */
extern void T616f5(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].move_right */
extern void T571f20(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [LX_RULE].put_last */
extern void T571f19(T0* C, T0* a1);
/* LX_RULE.make_default */
extern T0* T581c14(T6 a1);
/* LX_RULE.dummy_action */
extern unsigned char ge358os11937;
extern T0* ge358ov11937;
extern T0* T581f11(T0* C);
/* LX_ACTION.make */
extern T0* T634c2(T0* a1);
/* LX_RULE.dummy_pattern */
extern unsigned char ge358os11936;
extern T0* ge358ov11936;
extern T0* T581f12(T0* C);
/* LX_NFA.make_epsilon */
extern T0* T579c12(T1 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put_first */
extern void T597f25(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put */
extern void T597f31(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [LX_NFA_STATE].move_cursors_right */
extern void T597f35(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_position */
extern void T643f8(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].move_right */
extern void T597f34(T0* C, T6 a1, T6 a2);
/* LX_NFA_STATE.set_transition */
extern void T605f11(T0* C, T0* a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].make */
extern T0* T627c3(T0* a1);
/* LX_NFA_STATE.make */
extern T0* T605c10(T1 a1);
/* LX_FULL_DFA.initialize */
extern void T550f38(T0* C, T0* a1);
/* LX_FULL_DFA.initialize_dfa */
extern void T550f43(T0* C, T0* a1, T6 a2, T6 a3);
/* LX_FULL_DFA.put_start_condition */
extern void T550f48(T0* C, T0* a1);
/* LX_NFA.start_state */
extern T0* T579f4(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].first */
extern T0* T597f14(T0* C);
/* DS_ARRAYED_LIST [LX_NFA].item */
extern T0* T603f7(T0* C, T6 a1);
/* LX_START_CONDITIONS.item */
extern T0* T572f9(T0* C, T6 a1);
/* LX_FULL_DFA.set_nfa_state_ids */
extern void T550f47(T0* C, T0* a1);
/* LX_NFA_STATE.set_id */
extern void T605f14(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].force */
extern void T604f37(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].key_storage_put */
extern void T604f45(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].slots_put */
extern void T604f44(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].clashes_put */
extern void T604f43(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].slots_item */
extern T6 T604f31(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].clashes_item */
extern T6 T604f28(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].hash_position */
extern T6 T604f21(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].resize */
extern void T604f42(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].clashes_resize */
extern void T604f50(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].special_integer_ */
extern T0* T604f30(T0* C);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].key_storage_resize */
extern void T604f49(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item_storage_resize */
extern void T604f48(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].resize */
extern T0* T583f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_NFA].aliased_resized_area */
extern T0* T582f4(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].key_storage_item */
extern T6 T604f34(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].slots_resize */
extern void T604f47(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].new_modulus */
extern T6 T604f24(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].new_capacity */
extern T6 T604f33(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item_storage_put */
extern void T604f41(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].search_position */
extern void T604f38(T0* C, T6 a1);
/* KL_EQUALITY_TESTER [INTEGER_32].test */
extern T1 T553f1(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].unset_found_item */
extern void T604f40(T0* C);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item */
extern T0* T604f22(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item_storage_item */
extern T0* T604f32(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].has */
extern T1 T604f23(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make */
extern T0* T604c36(T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_with_equality_testers */
extern void T604f39(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [LX_NFA, INTEGER_32].make */
extern T0* T653c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [LX_NFA, INTEGER_32].set_internal_cursor */
extern void T653f6(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [LX_NFA, INTEGER_32].new_cursor */
extern T0* T653f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [LX_NFA, INTEGER_32].make */
extern T0* T674c3(T0* a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].new_cursor */
extern T0* T604f29(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32].make */
extern T0* T655c3(T0* a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_sparse_container */
extern void T604f46(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].set_internal_cursor */
extern void T604f55(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_slots */
extern void T604f54(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_clashes */
extern void T604f53(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_key_storage */
extern void T604f52(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_item_storage */
extern void T604f51(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].make */
extern T0* T583f1(T0* C, T6 a1);
/* ARRAY [LX_NFA].make_empty */
extern T0* T635c4(void);
/* ARRAY [LX_NFA].make_area */
extern void T635f5(T0* C, T6 a1);
/* SPECIAL [LX_NFA].make */
extern T0* T582c6(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].default_create */
extern T0* T583c3(void);
/* KL_EQUALITY_TESTER [INTEGER_32].default_create */
extern T0* T553c2(void);
/* DS_ARRAYED_LIST [LX_DFA_STATE].make */
extern T0* T598c8(T6 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].set_internal_cursor */
extern void T598f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].new_cursor */
extern T0* T598f6(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].make */
extern T0* T647c3(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].make */
extern T0* T646f1(T0* C, T6 a1);
/* ARRAY [LX_DFA_STATE].make_empty */
extern T0* T649c6(void);
/* ARRAY [LX_DFA_STATE].make_area */
extern void T649f8(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].default_create */
extern T0* T646c3(void);
/* LX_EQUIVALENCE_CLASSES.to_array */
extern T0* T580f6(T0* C, T6 a1, T6 a2);
/* LX_EQUIVALENCE_CLASSES.lower */
extern T6 T580f5(T0* C);
/* LX_EQUIVALENCE_CLASSES.upper */
extern T6 T580f4(T0* C);
/* LX_EQUIVALENCE_CLASSES.built */
extern T1 T580f3(T0* C);
/* LX_FULL_DFA.build_eof_rules */
extern void T550f42(T0* C, T0* a1, T6 a2, T6 a3);
/* ARRAY [LX_RULE].put */
extern void T595f5(T0* C, T0* a1, T6 a2);
/* ARRAY [LX_RULE].make_filled */
extern T0* T595c4(T0* a1, T6 a2, T6 a3);
/* ARRAY [LX_RULE].make_filled_area */
extern void T595f6(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_RULE].make_filled */
extern T0* T594c5(T0* a1, T6 a2);
/* ARRAY [STRING_8].count */
extern T6 T33f10(T0* C);
/* LX_FULL_DFA.build_rules */
extern void T550f41(T0* C, T0* a1);
/* KL_ARRAY_ROUTINES [LX_RULE].make_empty_with_lower */
extern T0* T600f1(T0* C, T6 a1);
/* ARRAY [LX_RULE].make_from_array */
extern T0* T595c8(T0* a1);
/* KL_ARRAY [LX_RULE].new_rebase */
extern void T648f5(T0* C, T6 a1);
/* KL_ARRAY [LX_RULE].make_empty */
extern T0* T648c4(void);
/* KL_ARRAY [LX_RULE].make_area */
extern void T648f6(T0* C, T6 a1);
/* KL_ARRAY_ROUTINES [LX_RULE].default_create */
extern T0* T600c2(void);
/* LX_START_CONDITIONS.names */
extern T0* T572f7(T0* C);
/* LX_START_CONDITIONS.first */
extern T0* T572f6(T0* C);
/* LX_START_CONDITIONS.string_array_ */
extern unsigned char ge122os2841;
extern T0* ge122ov2841;
extern T0* T572f11(T0* C);
/* LX_WILDCARD_PARSER.parse_string */
extern void T548f220(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.parse */
extern void T548f224(T0* C);
/* LX_WILDCARD_PARSER.yy_pop_last_value */
extern void T548f237(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_push_error_value */
extern void T548f236(T0* C);
/* KL_SPECIAL_ROUTINES [ANY].force */
extern void T142f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [ANY].fill_with */
extern void T141f7(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_SPECIAL_ROUTINES [ANY].resize */
extern T0* T142f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ANY].aliased_resized_area */
extern T0* T141f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].make */
extern T0* T142f1(T0* C, T6 a1);
/* ARRAY [ANY].make_empty */
extern T0* T232c4(void);
/* ARRAY [ANY].make_area */
extern void T232f5(T0* C, T6 a1);
/* SPECIAL [ANY].make */
extern T0* T141c5(T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].default_create */
extern T0* T142c3(void);
/* LX_WILDCARD_PARSER.yy_do_action */
extern void T548f235(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.append_character_to_string */
extern T0* T548f170(T0* C, T6 a1, T0* a2);
/* LX_WILDCARD_PARSER.new_symbol_nfa */
extern T0* T548f216(T0* C, T6 a1);
/* LX_NFA.make_symbol */
extern T0* T579c13(T6 a1, T1 a2);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].make */
extern T0* T629c4(T6 a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].force_new */
extern void T575f47(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].key_storage_put */
extern void T575f55(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item_storage_put */
extern void T575f51(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].slots_put */
extern void T575f54(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].clashes_put */
extern void T575f53(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].slots_item */
extern T6 T575f22(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].hash_position */
extern T6 T575f31(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].clashes_item */
extern T6 T575f21(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].resize */
extern void T575f52(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].clashes_resize */
extern void T575f60(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].special_integer_ */
extern T0* T575f32(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].key_storage_resize */
extern void T575f59(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item_storage_resize */
extern void T575f58(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].key_storage_item */
extern T0* T575f25(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].slots_resize */
extern void T575f57(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].new_modulus */
extern T6 T575f27(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].new_capacity */
extern T6 T575f30(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].unset_found_item */
extern void T575f50(T0* C);
/* LX_EQUIVALENCE_CLASSES.add */
extern void T580f11(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].forget_right */
extern void T630f7(T0* C);
/* DS_BILINKABLE [INTEGER_32].forget_left */
extern void T630f8(T0* C);
/* ARRAY [BOOLEAN].put */
extern void T244f8(T0* C, T1 a1, T6 a2);
/* DS_BILINKABLE [INTEGER_32].put_right */
extern void T630f6(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].attach_left */
extern void T630f11(T0* C, T0* a1);
/* LX_SYMBOL_CLASS.item */
extern T6 T576f14(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.put */
extern void T576f19(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.force_last */
extern void T576f22(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.resize */
extern void T576f23(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.new_capacity */
extern T6 T576f13(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.extendible */
extern T1 T576f11(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.last */
extern T6 T576f12(T0* C);
/* LX_SYMBOL_CLASS.is_empty */
extern T1 T576f10(T0* C);
/* LX_SYMBOL_CLASS.has */
extern T1 T576f9(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.arrayed_has */
extern T1 T576f15(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.make */
extern T0* T576c18(T6 a1);
/* LX_SYMBOL_CLASS.set_internal_cursor */
extern void T576f21(T0* C, T0* a1);
/* LX_SYMBOL_CLASS.new_cursor */
extern T0* T576f16(T0* C);
/* DS_ARRAYED_LIST_CURSOR [INTEGER_32].make */
extern T0* T623c3(T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].found_item */
extern T0* T575f24(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item_storage_item */
extern T0* T575f33(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].found */
extern T1 T575f23(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].search */
extern void T575f46(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].search_position */
extern void T575f48(T0* C, T0* a1);
/* KL_STRING_EQUALITY_TESTER.test */
extern T1 T566f1(T0* C, T0* a1, T0* a2);
/* LX_WILDCARD_PARSER.new_epsilon_nfa */
extern T0* T548f169(T0* C);
/* LX_WILDCARD_PARSER.append_character_set_to_character_class */
extern T0* T548f168(T0* C, T6 a1, T6 a2, T0* a3);
/* LX_WILDCARD_PARSER.report_negative_range_in_character_class_error */
extern void T548f268(T0* C);
/* UT_ERROR_HANDLER.report_error */
extern void T28f11(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_error_message */
extern void T28f12(T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_line */
extern void T558f4(T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_new_line */
extern void T558f6(T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_string */
extern void T558f5(T0* C, T0* a1);
/* UT_ERROR_HANDLER.message */
extern T0* T28f5(T0* C, T0* a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.make */
extern T0* T607c8(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.filename */
extern T0* T548f189(T0* C);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].resize */
extern T0* T578f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_SYMBOL_CLASS].aliased_resized_area */
extern T0* T577f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].make */
extern T0* T578f1(T0* C, T6 a1);
/* ARRAY [LX_SYMBOL_CLASS].make_empty */
extern T0* T624c4(void);
/* ARRAY [LX_SYMBOL_CLASS].make_area */
extern void T624f5(T0* C, T6 a1);
/* SPECIAL [LX_SYMBOL_CLASS].make */
extern T0* T577c6(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].default_create */
extern T0* T578c3(void);
/* LX_WILDCARD_PARSER.append_character_to_character_class */
extern T0* T548f167(T0* C, T6 a1, T0* a2);
/* LX_WILDCARD_PARSER.new_character_class */
extern T0* T548f166(T0* C);
/* LX_SYMBOL_CLASS.set_negated */
extern void T576f20(T0* C, T1 a1);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].force */
extern void T578f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [LX_SYMBOL_CLASS].fill_with */
extern void T577f8(T0* C, T0* a1, T6 a2, T6 a3);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].force */
extern void T575f45(T0* C, T0* a1, T0* a2);
/* LX_WILDCARD_PARSER.new_nfa_from_character_class */
extern T0* T548f165(T0* C, T0* a1);
/* LX_SYMBOL_CLASS.sort */
extern void T576f25(T0* C);
/* LX_SYMBOL_CLASS.arrayed_sort */
extern void T576f27(T0* C, T0* a1);
/* DS_SHELL_SORTER [INTEGER_32].sort */
extern void T677f3(T0* C, T0* a1);
/* DS_SHELL_SORTER [INTEGER_32].sort_with_comparator */
extern void T677f4(T0* C, T0* a1, T0* a2);
/* DS_SHELL_SORTER [INTEGER_32].subsort_with_comparator */
extern void T677f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* LX_SYMBOL_CLASS.replace */
extern void T576f26(T0* C, T6 a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [INTEGER_32].less_than */
extern T1 T682f1(T0* C, T6 a1, T6 a2);
/* LX_SYMBOL_CLASS.sorter */
extern unsigned char ge276os11971;
extern T0* ge276ov11971;
extern T0* T576f17(T0* C);
/* DS_SHELL_SORTER [INTEGER_32].make */
extern T0* T677c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [INTEGER_32].make */
extern T0* T682c2(void);
/* LX_WILDCARD_PARSER.new_symbol_class_nfa */
extern T0* T548f163(T0* C, T0* a1);
/* LX_NFA.make_symbol_class */
extern T0* T579c6(T0* a1, T1 a2);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].make */
extern T0* T625c4(T0* a1, T0* a2);
/* LX_WILDCARD_PARSER.question_character_class */
extern T0* T548f162(T0* C);
/* LX_NFA.build_optional */
extern void T579f11(T0* C);
/* LX_NFA_STATE.set_epsilon_transition */
extern void T605f12(T0* C, T0* a1);
/* LX_NFA.final_state */
extern T0* T579f5(T0* C);
/* LX_NFA.build_positive_closure */
extern void T579f10(T0* C);
/* LX_NFA.build_closure */
extern void T579f9(T0* C);
/* LX_WILDCARD_PARSER.new_nfa_from_character */
extern T0* T548f160(T0* C, T6 a1);
/* LX_NFA.build_concatenation */
extern void T579f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].append_last */
extern void T597f28(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].extend_last */
extern void T597f33(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].forth */
extern void T643f10(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_forth */
extern void T597f37(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].add_traversing_cursor */
extern void T597f38(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_next_cursor */
extern void T643f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].remove_traversing_cursor */
extern void T597f39(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].item */
extern T0* T643f4(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_item */
extern T0* T597f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].after */
extern T1 T643f5(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_after */
extern T1 T597f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].start */
extern void T643f9(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_start */
extern void T597f36(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].off */
extern T1 T643f6(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_off */
extern T1 T597f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_before */
extern T1 T597f22(T0* C, T0* a1);
/* LX_NFA.build_union */
extern void T579f7(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].force */
extern void T583f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [LX_NFA].fill_with */
extern void T582f8(T0* C, T0* a1, T6 a2, T6 a3);
/* LX_WILDCARD_PARSER.report_unrecognized_rule_error */
extern void T548f250(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.make */
extern T0* T586c8(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.process_rule */
extern void T548f249(T0* C, T0* a1);
/* LX_START_CONDITIONS.add_nfa_to_all */
extern void T572f13(T0* C, T0* a1);
/* LX_START_CONDITION.put_nfa */
extern void T601f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA].force_last */
extern void T603f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA].resize */
extern void T603f13(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA].new_capacity */
extern T6 T603f9(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA].extendible */
extern T1 T603f8(T0* C, T6 a1);
/* LX_START_CONDITIONS.add_nfa_to_non_exclusive */
extern void T572f15(T0* C, T0* a1);
/* LX_START_CONDITIONS.is_empty */
extern T1 T572f8(T0* C);
/* LX_DESCRIPTION.set_variable_trail_context */
extern void T549f34(T0* C, T1 a1);
/* LX_RULE.set_column_count */
extern void T581f21(T0* C, T6 a1);
/* LX_RULE.set_line_count */
extern void T581f20(T0* C, T6 a1);
/* LX_RULE.set_trail_count */
extern void T581f19(T0* C, T6 a1);
/* LX_RULE.set_head_count */
extern void T581f18(T0* C, T6 a1);
/* LX_RULE.set_trail_context */
extern void T581f17(T0* C, T1 a1);
/* LX_RULE.set_line_nb */
extern void T581f16(T0* C, T6 a1);
/* LX_RULE.set_pattern */
extern void T581f15(T0* C, T0* a1);
/* LX_NFA.set_accepted_rule */
extern void T579f14(T0* C, T0* a1);
/* LX_NFA_STATE.set_accepted_rule */
extern void T605f13(T0* C, T0* a1);
/* LX_DESCRIPTION.create_equiv_classes */
extern void T549f33(T0* C);
/* LX_EQUIVALENCE_CLASSES.make */
extern T0* T580c9(T6 a1, T6 a2);
/* LX_EQUIVALENCE_CLASSES.initialize */
extern void T580f12(T0* C);
/* LX_WILDCARD_PARSER.check_options */
extern void T548f248(T0* C);
/* LX_WILDCARD_PARSER.report_full_and_variable_trailing_context_error */
extern void T548f263(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.make */
extern T0* T592c8(void);
/* LX_WILDCARD_PARSER.report_full_and_reject_error */
extern void T548f262(T0* C);
/* LX_FULL_AND_REJECT_ERROR.make */
extern T0* T591c8(void);
/* LX_WILDCARD_PARSER.report_full_and_meta_equiv_classes_error */
extern void T548f261(T0* C);
/* LX_FULL_AND_META_ERROR.make */
extern T0* T590c8(void);
/* LX_WILDCARD_PARSER.build_equiv_classes */
extern void T548f247(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].forth */
extern void T585f8(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_forth */
extern void T575f67(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].add_traversing_cursor */
extern void T575f69(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].set_next_cursor */
extern void T585f10(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].remove_traversing_cursor */
extern void T575f68(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].set_position */
extern void T585f9(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.convert_to_equivalence */
extern void T576f24(T0* C, T0* a1);
/* LX_EQUIVALENCE_CLASSES.equivalence_class */
extern T6 T580f8(T0* C, T6 a1);
/* LX_EQUIVALENCE_CLASSES.is_representative */
extern T1 T580f7(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].item */
extern T0* T585f4(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_item */
extern T0* T575f37(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].after */
extern T1 T585f5(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_after */
extern T1 T575f36(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].start */
extern void T585f7(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_start */
extern void T575f66(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_off */
extern T1 T575f42(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].is_empty */
extern T1 T575f41(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].new_cursor */
extern T0* T575f35(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].make */
extern T0* T585c6(T0* a1);
/* LX_EQUIVALENCE_CLASSES.build */
extern void T580f10(T0* C);
/* LX_WILDCARD_PARSER.yy_push_last_value */
extern void T548f234(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.accept */
extern void T548f233(T0* C);
/* LX_WILDCARD_PARSER.yy_do_error_action */
extern void T548f231(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.report_error */
extern void T548f246(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.make */
extern T0* T584c8(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.report_eof_expected_error */
extern void T548f245(T0* C);
/* LX_WILDCARD_PARSER.read_token */
extern void T548f230(T0* C);
/* LX_WILDCARD_PARSER.yy_execute_action */
extern void T548f244(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.report_bad_character_error */
extern void T548f260(T0* C, T0* a1);
/* LX_BAD_CHARACTER_ERROR.make */
extern T0* T589c8(T0* a1, T6 a2, T0* a3);
/* LX_WILDCARD_PARSER.report_bad_character_class_error */
extern void T548f259(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.make */
extern T0* T588c8(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.start_condition */
extern T6 T548f184(T0* C);
/* LX_WILDCARD_PARSER.process_escaped_character */
extern void T548f258(T0* C);
/* LX_WILDCARD_PARSER.text_count */
extern T6 T548f205(T0* C);
/* LX_WILDCARD_PARSER.report_missing_quote_error */
extern void T548f257(T0* C);
/* LX_MISSING_QUOTE_ERROR.make */
extern T0* T587c8(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.process_character */
extern void T548f256(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.report_character_out_of_range_error */
extern void T548f266(T0* C, T0* a1);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.make */
extern T0* T593c8(T0* a1, T6 a2, T0* a3);
/* LX_WILDCARD_PARSER.text_item */
extern T2 T548f181(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.less */
extern void T548f255(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_set_line_column */
extern void T548f265(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item */
extern T0* T575f34(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].has */
extern T1 T575f26(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.text */
extern T0* T548f175(T0* C);
/* KL_CHARACTER_BUFFER.substring */
extern T0* T368f3(T0* C, T6 a1, T6 a2);
/* LX_WILDCARD_PARSER.set_start_condition */
extern void T548f254(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_execute_eof_action */
extern void T548f243(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.terminate */
extern void T548f253(T0* C);
/* LX_WILDCARD_PARSER.wrap */
extern T1 T548f129(T0* C);
/* LX_WILDCARD_PARSER.yy_refill_input_buffer */
extern void T548f242(T0* C);
/* LX_WILDCARD_PARSER.yy_set_content */
extern void T548f240(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.count */
extern T6 T368f4(T0* C);
/* YY_BUFFER.fill */
extern void T218f15(T0* C);
/* YY_BUFFER.set_index */
extern void T218f13(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_null_trans_state */
extern T6 T548f128(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_previous_state */
extern T6 T548f127(T0* C);
/* LX_WILDCARD_PARSER.fatal_error */
extern void T548f241(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.std */
extern T0* T548f171(T0* C);
/* KL_CHARACTER_BUFFER.item */
extern T2 T368f6(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].force */
extern void T65f7(T0* C, T0* a1, T6 a2, T6 a3);
/* LX_WILDCARD_PARSER.special_integer_ */
extern T0* T548f152(T0* C);
/* LX_WILDCARD_PARSER.yy_init_value_stacks */
extern void T548f229(T0* C);
/* LX_WILDCARD_PARSER.yy_clear_all */
extern void T548f238(T0* C);
/* LX_WILDCARD_PARSER.clear_all */
extern void T548f251(T0* C);
/* LX_WILDCARD_PARSER.clear_stacks */
extern void T548f264(T0* C);
/* LX_WILDCARD_PARSER.yy_clear_value_stacks */
extern void T548f267(T0* C);
/* SPECIAL [LX_NFA].upper */
extern T6 T582f5(T0* C);
/* SPECIAL [STRING_8].upper */
extern T6 T32f5(T0* C);
/* SPECIAL [LX_SYMBOL_CLASS].upper */
extern T6 T577f5(T0* C);
/* SPECIAL [INTEGER_32].upper */
extern T6 T63f5(T0* C);
/* SPECIAL [ANY].upper */
extern T6 T141f4(T0* C);
/* LX_WILDCARD_PARSER.abort */
extern void T548f232(T0* C);
/* LX_WILDCARD_PARSER.set_input_buffer */
extern void T548f223(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_load_input_buffer */
extern void T548f228(T0* C);
/* YY_BUFFER.set_position */
extern void T218f14(T0* C, T6 a1, T6 a2, T6 a3);
/* LX_WILDCARD_PARSER.new_string_buffer */
extern T0* T548f123(T0* C, T0* a1);
/* YY_BUFFER.make */
extern T0* T218c12(T0* a1);
/* YY_BUFFER.make_from_buffer */
extern void T218f16(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.put */
extern void T368f9(T0* C, T2 a1, T6 a2);
/* KL_CHARACTER_BUFFER.fill_from_string */
extern void T368f8(T0* C, T0* a1, T6 a2);
/* STRING_8.subcopy */
extern void T17f56(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* YY_BUFFER.new_default_buffer */
extern T0* T218f11(T0* C, T6 a1);
/* KL_CHARACTER_BUFFER.make */
extern T0* T368c7(T6 a1);
/* LX_WILDCARD_PARSER.make_from_description */
extern T0* T548c219(T0* a1, T0* a2);
/* DS_ARRAYED_STACK [INTEGER_32].make */
extern T0* T574c4(T6 a1);
/* LX_ACTION_FACTORY.make */
extern T0* T573c1(void);
/* LX_START_CONDITIONS.make */
extern void T572f12(T0* C, T6 a1);
/* LX_START_CONDITIONS.make */
extern T0* T572c12(T6 a1);
/* LX_START_CONDITIONS.set_internal_cursor */
extern void T572f16(T0* C, T0* a1);
/* LX_START_CONDITIONS.new_cursor */
extern T0* T572f10(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].make */
extern T0* T619c4(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].make */
extern T0* T618f1(T0* C, T6 a1);
/* SPECIAL [LX_START_CONDITION].aliased_resized_area */
extern T0* T617f3(T0* C, T6 a1);
/* ARRAY [LX_START_CONDITION].make_empty */
extern T0* T671c4(void);
/* ARRAY [LX_START_CONDITION].make_area */
extern void T671f5(T0* C, T6 a1);
/* SPECIAL [LX_START_CONDITION].make */
extern T0* T617c4(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].default_create */
extern T0* T618c2(void);
/* LX_WILDCARD_PARSER.make_parser_skeleton */
extern void T548f222(T0* C);
/* LX_WILDCARD_PARSER.yy_build_parser_tables */
extern void T548f227(T0* C);
/* LX_WILDCARD_PARSER.yycheck_template */
extern unsigned char ge336os9995;
extern T0* ge336ov9995;
extern T0* T548f138(T0* C);
/* LX_WILDCARD_PARSER.yyfixed_array */
extern T0* T548f211(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].to_special */
extern T0* T65f3(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yytable_template */
extern unsigned char ge336os9994;
extern T0* ge336ov9994;
extern T0* T548f137(T0* C);
/* LX_WILDCARD_PARSER.yypgoto_template */
extern unsigned char ge336os9993;
extern T0* ge336ov9993;
extern T0* T548f135(T0* C);
/* LX_WILDCARD_PARSER.yypact_template */
extern unsigned char ge336os9992;
extern T0* ge336ov9992;
extern T0* T548f134(T0* C);
/* LX_WILDCARD_PARSER.yydefgoto_template */
extern unsigned char ge336os9991;
extern T0* ge336ov9991;
extern T0* T548f133(T0* C);
/* LX_WILDCARD_PARSER.yydefact_template */
extern unsigned char ge336os9990;
extern T0* ge336ov9990;
extern T0* T548f130(T0* C);
/* LX_WILDCARD_PARSER.yytypes2_template */
extern unsigned char ge336os9989;
extern T0* ge336ov9989;
extern T0* T548f124(T0* C);
/* LX_WILDCARD_PARSER.yytypes1_template */
extern unsigned char ge336os9988;
extern T0* ge336ov9988;
extern T0* T548f122(T0* C);
/* LX_WILDCARD_PARSER.yyr1_template */
extern unsigned char ge336os9987;
extern T0* ge336ov9987;
extern T0* T548f117(T0* C);
/* LX_WILDCARD_PARSER.yytranslate_template */
extern unsigned char ge336os9986;
extern T0* ge336ov9986;
extern T0* T548f116(T0* C);
/* LX_WILDCARD_PARSER.yy_create_value_stacks */
extern void T548f226(T0* C);
/* LX_WILDCARD_PARSER.make_lex_scanner_from_description */
extern void T548f221(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].set_key_equality_tester */
extern void T575f44(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING_8].internal_set_equality_tester */
extern void T621f6(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_map */
extern T0* T575c43(T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_with_equality_testers */
extern void T575f49(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING_8].make */
extern T0* T621c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING_8].set_internal_cursor */
extern void T621f7(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING_8].new_cursor */
extern T0* T621f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [LX_SYMBOL_CLASS, STRING_8].make */
extern T0* T672c3(T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_sparse_container */
extern void T575f56(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].set_internal_cursor */
extern void T575f65(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_slots */
extern void T575f64(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_clashes */
extern void T575f63(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_key_storage */
extern void T575f62(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_item_storage */
extern void T575f61(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_key_equality_tester */
extern void T81f44(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.string_equality_tester */
extern unsigned char ge130os2836;
extern T0* ge130ov2836;
extern T0* T548f120(T0* C);
/* KL_STRING_EQUALITY_TESTER.default_create */
extern T0* T566c2(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map */
extern void T81f46(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map */
extern T0* T81c46(T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_with_equality_testers */
extern void T81f47(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_sparse_container */
extern void T81f48(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_internal_cursor */
extern void T81f54(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].unset_found_item */
extern void T81f53(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_slots */
extern void T81f52(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].special_integer_ */
extern T0* T81f35(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_modulus */
extern T6 T81f21(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_clashes */
extern void T81f51(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_key_storage */
extern void T81f50(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_item_storage */
extern void T81f49(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.make_with_buffer */
extern void T548f225(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_initialize */
extern void T548f239(T0* C);
/* LX_WILDCARD_PARSER.yy_build_tables */
extern void T548f252(T0* C);
/* LX_WILDCARD_PARSER.yy_accept_template */
extern unsigned char ge337os10262;
extern T0* ge337ov10262;
extern T0* T548f197(T0* C);
/* LX_WILDCARD_PARSER.yy_fixed_array */
extern T0* T548f218(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_meta_template */
extern unsigned char ge337os10261;
extern T0* ge337ov10261;
extern T0* T548f196(T0* C);
/* LX_WILDCARD_PARSER.yy_ec_template */
extern unsigned char ge337os10260;
extern T0* ge337ov10260;
extern T0* T548f195(T0* C);
/* LX_WILDCARD_PARSER.yy_def_template */
extern unsigned char ge337os10259;
extern T0* ge337ov10259;
extern T0* T548f194(T0* C);
/* LX_WILDCARD_PARSER.yy_base_template */
extern unsigned char ge337os10258;
extern T0* ge337ov10258;
extern T0* T548f193(T0* C);
/* LX_WILDCARD_PARSER.yy_chk_template */
extern unsigned char ge337os10257;
extern T0* ge337ov10257;
extern T0* T548f192(T0* C);
/* LX_WILDCARD_PARSER.yy_nxt_template */
extern unsigned char ge337os10256;
extern T0* ge337ov10256;
extern T0* T548f191(T0* C);
/* LX_WILDCARD_PARSER.empty_buffer */
extern unsigned char ge353os6797;
extern T0* ge353ov6797;
extern T0* T548f144(T0* C);
/* LX_DESCRIPTION.set_case_insensitive */
extern void T549f32(T0* C, T1 a1);
/* LX_DESCRIPTION.set_full_table */
extern void T549f31(T0* C, T1 a1);
/* LX_DESCRIPTION.set_meta_equiv_classes_used */
extern void T549f30(T0* C, T1 a1);
/* LX_DESCRIPTION.set_equiv_classes_used */
extern void T549f29(T0* C, T1 a1);
/* LX_DESCRIPTION.make */
extern T0* T549c28(void);
/* LX_START_CONDITIONS.make_with_initial */
extern T0* T572c14(T6 a1);
/* LX_START_CONDITIONS.put_first */
extern void T572f17(T0* C, T0* a1);
/* LX_START_CONDITIONS.put */
extern void T572f18(T0* C, T0* a1, T6 a2);
/* LX_START_CONDITIONS.move_cursors_right */
extern void T572f21(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].set_position */
extern void T619f5(T0* C, T6 a1);
/* LX_START_CONDITIONS.move_right */
extern void T572f20(T0* C, T6 a1, T6 a2);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].force */
extern void T618f3(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [LX_START_CONDITION].fill_with */
extern void T617f6(T0* C, T0* a1, T6 a2, T6 a3);
/* LX_START_CONDITIONS.put_last */
extern void T572f19(T0* C, T0* a1);
/* LX_START_CONDITION.make */
extern T0* T601c6(T0* a1, T6 a2, T1 a3);
/* DS_ARRAYED_LIST [LX_NFA].make */
extern T0* T603c10(T6 a1);
/* DS_ARRAYED_LIST [LX_NFA].set_internal_cursor */
extern void T603f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA].new_cursor */
extern T0* T603f6(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA].make */
extern T0* T651c3(T0* a1);
/* UT_ERROR_HANDLER.make_null */
extern T0* T28c10(void);
/* UT_ERROR_HANDLER.null_output_stream */
extern unsigned char ge166os2510;
extern T0* ge166ov2510;
extern T0* T28f6(T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.make */
extern T0* T558c3(T0* a1);
/* LX_DFA_WILDCARD.wipe_out */
extern void T508f17(T0* C);
/* GEANT_FILESET_ELEMENT.exclude_attribute_name */
extern unsigned char ge81os9183;
extern T0* ge81ov9183;
extern T0* T384f11(T0* C);
/* GEANT_FILESET.set_include_wc_string */
extern void T390f36(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.include_attribute_name */
extern unsigned char ge81os9182;
extern T0* ge81ov9182;
extern T0* T384f10(T0* C);
/* GEANT_FILESET.set_directory_name */
extern void T390f35(T0* C, T0* a1);
/* GEANT_FILESET.set_dir_name */
extern void T390f34(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.attribute_value */
extern T0* T384f9(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.project_variables_resolver */
extern T0* T384f25(T0* C);
/* GEANT_FILESET_ELEMENT.dir_attribute_name */
extern T0* T384f8(T0* C);
/* GEANT_FILESET.make */
extern T0* T390c33(T0* a1);
/* DS_HASH_SET [STRING_8].set_equality_tester */
extern void T506f36(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].make */
extern T0* T506c35(T6 a1);
/* DS_HASH_SET [STRING_8].set_internal_cursor */
extern void T506f43(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].new_cursor */
extern T0* T506f21(T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].make */
extern T0* T547c6(T0* a1);
/* DS_HASH_SET [STRING_8].make_slots */
extern void T506f41(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_clashes */
extern void T506f40(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_key_storage */
extern void T506f39(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_item_storage */
extern void T506f38(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_equal */
extern T0* T504c39(T6 a1);
/* KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY].default_create */
extern T0* T542c2(void);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make */
extern void T504f40(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].set_internal_cursor */
extern void T504f46(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].new_cursor */
extern T0* T504f38(T0* C);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].make */
extern T0* T543c4(T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].unset_found_item */
extern void T504f45(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_slots */
extern void T504f44(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].special_integer_ */
extern T0* T504f25(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].new_modulus */
extern T6 T504f33(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_clashes */
extern void T504f43(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_key_storage */
extern void T504f42(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_item_storage */
extern void T504f41(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].make */
extern T0* T544f1(T0* C, T6 a1);
/* SPECIAL [GEANT_FILESET_ENTRY].aliased_resized_area */
extern T0* T546f4(T0* C, T6 a1);
/* ARRAY [GEANT_FILESET_ENTRY].make_empty */
extern T0* T570c4(void);
/* ARRAY [GEANT_FILESET_ENTRY].make_area */
extern void T570f5(T0* C, T6 a1);
/* SPECIAL [GEANT_FILESET_ENTRY].make */
extern T0* T546c5(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].default_create */
extern T0* T544c3(void);
/* GEANT_FILESET_ELEMENT.exit_application */
extern void T384f30(T0* C, T6 a1, T0* a2);
/* GEANT_FILESET_ELEMENT.exceptions */
extern T0* T384f24(T0* C);
/* GEANT_FILESET_ELEMENT.log_messages */
extern void T384f33(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.mapped_filename_directory_attribute_name */
extern unsigned char ge81os9190;
extern T0* ge81ov9190;
extern T0* T384f6(T0* C);
/* GEANT_FILESET_ELEMENT.filename_directory_attribute_name */
extern unsigned char ge81os9188;
extern T0* ge81ov9188;
extern T0* T384f5(T0* C);
/* GEANT_FILESET_ELEMENT.directory_attribute_name */
extern unsigned char ge81os9181;
extern T0* ge81ov9181;
extern T0* T384f22(T0* C);
/* GEANT_FILESET_ELEMENT.has_attribute */
extern T1 T384f20(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.concat_attribute_name */
extern unsigned char ge81os9185;
extern T0* ge81ov9185;
extern T0* T384f7(T0* C);
/* GEANT_FILESET_ELEMENT.make */
extern void T384f29p1(T0* C, T0* a1, T0* a2);
/* GEANT_FILESET_ELEMENT.set_project */
extern void T384f32(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.element_make */
extern void T384f31(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.set_xml_element */
extern void T384f34(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.fileset_element_name */
extern unsigned char ge68os8816;
extern T0* ge68ov8816;
extern T0* T316f13(T0* C);
/* GEANT_REPLACE_COMMAND.set_flags */
extern void T462f37(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.flags_attribute_name */
extern unsigned char ge68os8815;
extern T0* ge68ov8815;
extern T0* T316f12(T0* C);
/* GEANT_REPLACE_COMMAND.set_replace */
extern void T462f36(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.replace_attribute_name */
extern unsigned char ge68os8814;
extern T0* ge68ov8814;
extern T0* T316f11(T0* C);
/* GEANT_REPLACE_COMMAND.set_variable_pattern */
extern void T462f35(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.variable_pattern_attribute_name */
extern unsigned char ge68os8813;
extern T0* ge68ov8813;
extern T0* T316f9(T0* C);
/* GEANT_REPLACE_COMMAND.set_token */
extern void T462f34(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.token_attribute_name */
extern unsigned char ge68os8812;
extern T0* ge68ov8812;
extern T0* T316f8(T0* C);
/* GEANT_REPLACE_COMMAND.set_match */
extern void T462f33(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.match_attribute_name */
extern unsigned char ge68os8811;
extern T0* ge68ov8811;
extern T0* T316f7(T0* C);
/* GEANT_REPLACE_COMMAND.set_to_directory */
extern void T462f32(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.to_directory_attribute_name */
extern unsigned char ge68os8810;
extern T0* ge68ov8810;
extern T0* T316f6(T0* C);
/* GEANT_REPLACE_COMMAND.set_to_file */
extern void T462f31(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.to_file_attribute_name */
extern unsigned char ge68os8809;
extern T0* ge68ov8809;
extern T0* T316f5(T0* C);
/* GEANT_REPLACE_COMMAND.set_file */
extern void T462f30(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.attribute_value */
extern T0* T316f14(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.project_variables_resolver */
extern T0* T316f17(T0* C);
/* GEANT_REPLACE_TASK.has_attribute */
extern T1 T316f10(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.file_attribute_name */
extern unsigned char ge68os8808;
extern T0* ge68ov8808;
extern T0* T316f15(T0* C);
/* GEANT_REPLACE_TASK.make */
extern void T316f31p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_REPLACE_TASK.make */
extern T0* T316f31p1ac1(T0* a1);
/* DS_CELL [PROCEDURE [ANY, TUPLE]].put */
extern void T378f3(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.make_with_command */
extern void T316f33(T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_TASK.interpreting_element_make */
extern void T316f36(T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_TASK.set_project */
extern void T316f38(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.element_make */
extern void T316f37(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.set_xml_element */
extern void T316f39(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.set_command */
extern void T316f35(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.build_command */
extern void T316f32(T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.make */
extern T0* T462c29(T0* a1);
/* DS_CELL [PROCEDURE [ANY, TUPLE]].make */
extern T0* T378c2(T0* a1);
/* GEANT_REPLACE_COMMAND.set_project */
extern void T462f39(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_input_task */
extern T0* T191f50(T0* C, T0* a1);
/* GEANT_INPUT_TASK.make */
extern T0* T314c32(T0* a1, T0* a2);
/* GEANT_INPUT_COMMAND.set_answer_required */
extern void T459f21(T0* C, T1 a1);
/* GEANT_INPUT_TASK.boolean_value */
extern T1 T314f10(T0* C, T0* a1);
/* GEANT_INPUT_TASK.std */
extern T0* T314f18(T0* C);
/* GEANT_INPUT_TASK.false_attribute_value */
extern T0* T314f17(T0* C);
/* GEANT_INPUT_TASK.true_attribute_value */
extern T0* T314f16(T0* C);
/* GEANT_INPUT_TASK.string_ */
extern T0* T314f15(T0* C);
/* GEANT_INPUT_TASK.answer_required_attribute_name */
extern unsigned char ge61os8790;
extern T0* ge61ov8790;
extern T0* T314f9(T0* C);
/* GEANT_INPUT_COMMAND.set_validregexp */
extern void T459f20(T0* C, T0* a1);
/* GEANT_INPUT_TASK.validregexp_attribute_name */
extern unsigned char ge61os8789;
extern T0* ge61ov8789;
extern T0* T314f8(T0* C);
/* GEANT_INPUT_COMMAND.set_validargs */
extern void T459f19(T0* C, T0* a1);
/* GEANT_INPUT_TASK.validargs_attribute_name */
extern unsigned char ge61os8788;
extern T0* ge61ov8788;
extern T0* T314f7(T0* C);
/* GEANT_INPUT_COMMAND.set_default_value */
extern void T459f18(T0* C, T0* a1);
/* GEANT_INPUT_TASK.defaultvalue_attribute_name */
extern unsigned char ge61os8787;
extern T0* ge61ov8787;
extern T0* T314f6(T0* C);
/* GEANT_INPUT_COMMAND.set_message */
extern void T459f17(T0* C, T0* a1);
/* GEANT_INPUT_TASK.message_attribute_name */
extern unsigned char ge61os8786;
extern T0* ge61ov8786;
extern T0* T314f5(T0* C);
/* GEANT_INPUT_COMMAND.set_variable */
extern void T459f16(T0* C, T0* a1);
/* GEANT_INPUT_TASK.attribute_value */
extern T0* T314f12(T0* C, T0* a1);
/* GEANT_INPUT_TASK.project_variables_resolver */
extern T0* T314f19(T0* C);
/* GEANT_INPUT_TASK.has_attribute */
extern T1 T314f11(T0* C, T0* a1);
/* GEANT_INPUT_TASK.variable_attribute_name */
extern unsigned char ge61os8785;
extern T0* ge61ov8785;
extern T0* T314f14(T0* C);
/* GEANT_INPUT_TASK.make */
extern void T314f32p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_INPUT_TASK.make */
extern T0* T314f32p1ac1(T0* a1);
/* GEANT_INPUT_TASK.make_with_command */
extern void T314f34(T0* C, T0* a1, T0* a2);
/* GEANT_INPUT_TASK.interpreting_element_make */
extern void T314f37(T0* C, T0* a1, T0* a2);
/* GEANT_INPUT_TASK.set_project */
extern void T314f39(T0* C, T0* a1);
/* GEANT_INPUT_TASK.element_make */
extern void T314f38(T0* C, T0* a1);
/* GEANT_INPUT_TASK.set_xml_element */
extern void T314f40(T0* C, T0* a1);
/* GEANT_INPUT_TASK.set_command */
extern void T314f36(T0* C, T0* a1);
/* GEANT_INPUT_TASK.build_command */
extern void T314f33(T0* C, T0* a1);
/* GEANT_INPUT_COMMAND.make */
extern T0* T459c15(T0* a1);
/* GEANT_INPUT_COMMAND.set_project */
extern void T459f22(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_available_task */
extern T0* T191f48(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T312c21(T0* a1);
/* Creation of agent #1 in feature GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T312f21ac1(T0* a1, T0* a2);
/* Creation of agent #2 in feature GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T312f21ac2(T0* a1, T0* a2);
/* Creation of agent #3 in feature GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T312f21ac3(T0* a1, T0* a2);
/* Creation of agent #4 in feature GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T312f21ac4(T0* a1, T0* a2);
/* GEANT_INTERPRETING_ELEMENT.attribute_value_if_existing */
extern T0* T196f5(T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.has_attribute */
extern T1 T196f8(T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.attribute_value */
extern T0* T196f4(T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.project_variables_resolver */
extern T0* T196f7(T0* C);
/* GEANT_STRING_PROPERTY.set_string_value_agent */
extern void T386f9(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern void T312f21p1(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.make */
extern void T312f22(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_AVAILABLE_TASK.make */
extern T0* T312f22ac1(T0* a1);
/* GEANT_AVAILABLE_TASK.make_with_command */
extern void T312f24(T0* C, T0* a1, T0* a2);
/* GEANT_AVAILABLE_TASK.interpreting_element_make */
extern void T312f27(T0* C, T0* a1, T0* a2);
/* GEANT_AVAILABLE_TASK.set_project */
extern void T312f29(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.element_make */
extern void T312f28(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.set_xml_element */
extern void T312f30(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.set_command */
extern void T312f26(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.build_command */
extern void T312f23(T0* C, T0* a1);
/* GEANT_AVAILABLE_COMMAND.make */
extern T0* T456c17(T0* a1);
/* Creation of agent #1 in feature GEANT_AVAILABLE_COMMAND.make */
extern T0* T456f17ac1(T0* a1);
/* GEANT_AVAILABLE_COMMAND.is_resource_existing */
extern T1 T456f15(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.file_exists */
extern T1 T53f29(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.exists */
extern T1 T55f34(T0* C);
/* KL_TEXT_INPUT_FILE.is_plain */
extern T1 T55f24(T0* C);
/* UNIX_FILE_INFO.is_plain */
extern T1 T87f7(T0* C);
/* UNIX_FILE_INFO.file_info */
extern T6 T87f5(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.buffered_file_info */
extern unsigned char ge2340os3167;
extern T0* ge2340ov3167;
extern T0* T55f14(T0* C);
/* UNIX_FILE_INFO.make */
extern T0* T87c14(void);
/* UNIX_FILE_INFO.make_buffered_file_info */
extern void T87f16(T0* C, T6 a1);
/* UNIX_FILE_INFO.stat_size */
extern T6 T87f6(T0* C);
/* KL_TEXT_INPUT_FILE.set_buffer */
extern void T55f61(T0* C);
/* UNIX_FILE_INFO.update */
extern void T87f15(T0* C, T0* a1);
/* UNIX_FILE_INFO.file_stat */
extern void T87f17(T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.old_exists */
extern T1 T55f20(T0* C);
/* KL_TEXT_INPUT_FILE.file_exists */
extern T1 T55f13(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.reset */
extern void T55f60(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.tmp_file */
extern unsigned char ge155os3992;
extern T0* ge155ov3992;
extern T0* T53f5(T0* C);
/* KL_UNIX_FILE_SYSTEM.file_exists */
extern T1 T54f26(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.tmp_file */
extern T0* T54f6(T0* C);
/* GEANT_AVAILABLE_COMMAND.unix_file_system */
extern T0* T456f10(T0* C);
/* GEANT_AVAILABLE_COMMAND.file_system */
extern T0* T456f9(T0* C);
/* GEANT_AVAILABLE_COMMAND.windows_file_system */
extern T0* T456f12(T0* C);
/* GEANT_AVAILABLE_COMMAND.operating_system */
extern T0* T456f11(T0* C);
/* DS_CELL [FUNCTION [ANY, TUPLE [STRING_8], BOOLEAN]].make */
extern T0* T526c2(T0* a1);
/* GEANT_STRING_PROPERTY.make */
extern T0* T386c8(void);
/* GEANT_AVAILABLE_COMMAND.make */
extern void T456f17p1(T0* C, T0* a1);
/* GEANT_AVAILABLE_COMMAND.set_project */
extern void T456f18(T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.make */
extern T0* T196c12(T0* a1, T0* a2);
/* GEANT_INTERPRETING_ELEMENT.set_project */
extern void T196f14(T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.element_make */
extern void T196f13(T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.set_xml_element */
extern void T196f15(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_precursor_task */
extern T0* T191f46(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.make */
extern T0* T310c28(T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.force_last_new */
extern void T34f76(T0* C, T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.key_storage_put */
extern void T34f58(T0* C, T0* a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.item_storage_put */
extern void T34f54(T0* C, T0* a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.slots_put */
extern void T34f57(T0* C, T6 a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.clashes_put */
extern void T34f56(T0* C, T6 a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.slots_item */
extern T6 T34f30(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.hash_position */
extern T6 T34f24(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.resize */
extern void T34f55(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.clashes_resize */
extern void T34f63(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.key_storage_resize */
extern void T34f62(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.item_storage_resize */
extern void T34f61(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.key_storage_item */
extern T0* T34f28(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.clashes_item */
extern T6 T34f27(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.slots_resize */
extern void T34f60(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.new_capacity */
extern T6 T34f23(T0* C, T6 a1);
/* GEANT_DEFINE_ELEMENT.value */
extern T0* T402f5(T0* C);
/* GEANT_DEFINE_ELEMENT.value_attribute_name */
extern T0* T402f12(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].forth */
extern void T343f9(T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_forth */
extern void T238f15(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].add_traversing_cursor */
extern void T238f16(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T343f11(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].remove_traversing_cursor */
extern void T238f17(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].set */
extern void T343f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [STRING_8].item */
extern T0* T343f6(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].start */
extern void T343f8(T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_start */
extern void T238f14(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].cursor_off */
extern T1 T238f8(T0* C, T0* a1);
/* ST_SPLITTER.split */
extern T0* T419f5(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.arguments_string_splitter */
extern unsigned char ge10os1754;
extern T0* ge10ov1754;
extern T0* T310f8(T0* C);
/* ST_SPLITTER.make */
extern T0* T419c11(void);
/* GEANT_PRECURSOR_TASK.exit_application */
extern void T310f29(T0* C, T6 a1, T0* a2);
/* GEANT_PRECURSOR_TASK.exceptions */
extern T0* T310f11(T0* C);
/* GEANT_PRECURSOR_TASK.std */
extern T0* T310f10(T0* C);
/* GEANT_PRECURSOR_TASK.log_messages */
extern void T310f33(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.arguments_attribute_name */
extern unsigned char ge67os8763;
extern T0* ge67ov8763;
extern T0* T310f7(T0* C);
/* GEANT_PRECURSOR_TASK.elements_by_name */
extern T0* T310f6(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.string_ */
extern T0* T310f15(T0* C);
/* GEANT_PRECURSOR_TASK.argument_element_name */
extern unsigned char ge67os8762;
extern T0* ge67ov8762;
extern T0* T310f5(T0* C);
/* GEANT_PRECURSOR_COMMAND.set_parent */
extern void T453f9(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.attribute_value */
extern T0* T310f12(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.project_variables_resolver */
extern T0* T310f16(T0* C);
/* GEANT_PRECURSOR_TASK.has_attribute */
extern T1 T310f9(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.parent_attribute_name */
extern unsigned char ge67os8761;
extern T0* ge67ov8761;
extern T0* T310f14(T0* C);
/* GEANT_PRECURSOR_TASK.make */
extern void T310f28p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_PRECURSOR_TASK.make */
extern T0* T310f28p1ac1(T0* a1);
/* GEANT_PRECURSOR_TASK.make_with_command */
extern void T310f31(T0* C, T0* a1, T0* a2);
/* GEANT_PRECURSOR_TASK.interpreting_element_make */
extern void T310f35(T0* C, T0* a1, T0* a2);
/* GEANT_PRECURSOR_TASK.set_project */
extern void T310f37(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.element_make */
extern void T310f36(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.set_xml_element */
extern void T310f38(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.set_command */
extern void T310f34(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.build_command */
extern void T310f30(T0* C, T0* a1);
/* GEANT_PRECURSOR_COMMAND.make */
extern T0* T453c8(T0* a1);
/* GEANT_PRECURSOR_COMMAND.make */
extern void T453f8p1(T0* C, T0* a1);
/* GEANT_PRECURSOR_COMMAND.set_project */
extern void T453f10(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_exit_task */
extern T0* T191f44(T0* C, T0* a1);
/* GEANT_EXIT_TASK.make */
extern T0* T308c23(T0* a1, T0* a2);
/* UC_UTF8_STRING.to_integer */
extern T6 T205f50(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
extern T6 T118f13(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
extern void T118f17(T0* C, T0* a1, T6 a2);
/* STRING_TO_INTEGER_CONVERTOR.parse_character */
extern void T118f23(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflowed */
extern T1 T118f15(T0* C);
/* INTEGER_OVERFLOW_CHECKER.will_overflow */
extern T1 T211f7(T0* C, T11 a1, T11 a2, T6 a3, T6 a4);
/* NATURAL_64.is_greater */
extern T1 T11f4(T11* C, T11 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
extern unsigned char ge2401os6520;
extern T0* ge2401ov6520;
extern T0* T118f14(T0* C);
/* INTEGER_OVERFLOW_CHECKER.make */
extern T0* T211c13(void);
/* NATURAL_64.to_natural_64 */
extern T11 T11f7(T11* C);
/* NATURAL_32.to_natural_64 */
extern T11 T10f7(T10* C);
/* NATURAL_16.to_natural_64 */
extern T11 T9f3(T9* C);
/* NATURAL_8.to_natural_64 */
extern T11 T8f8(T8* C);
/* INTEGER_64.to_natural_64 */
extern T11 T7f3(T7* C);
/* INTEGER_16.to_natural_64 */
extern T11 T5f3(T5* C);
/* INTEGER_8.to_natural_64 */
extern T11 T4f3(T4* C);
/* SPECIAL [NATURAL_64].make */
extern T0* T327c3(T6 a1);
/* STRING_8.has */
extern T1 T17f29(T0* C, T2 a1);
/* INTEGER_32.to_natural_64 */
extern T11 T6f20(T6* C);
/* CHARACTER_8.is_digit */
extern T1 T2f6(T2* C);
/* STRING_TO_INTEGER_CONVERTOR.reset */
extern void T118f18(T0* C, T6 a1);
/* UC_UTF8_STRING.ctoi_convertor */
extern unsigned char ge2385os1245;
extern T0* ge2385ov1245;
extern T0* T205f52(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
extern void T118f22(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
extern void T118f21(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
extern void T118f20(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
extern void T118f19(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.make */
extern T0* T118c16(void);
/* STRING_8.to_integer */
extern T6 T17f17(T0* C);
/* STRING_8.ctoi_convertor */
extern T0* T17f23(T0* C);
/* GEANT_EXIT_COMMAND.set_code */
extern void T450f8(T0* C, T6 a1);
/* UC_UTF8_STRING.is_integer */
extern T1 T205f49(T0* C);
/* UC_UTF8_STRING.is_valid_integer_or_natural */
extern T1 T205f51(T0* C, T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.is_integral_integer */
extern T1 T118f12(T0* C);
/* STRING_8.is_integer */
extern T1 T17f16(T0* C);
/* STRING_8.is_valid_integer_or_natural */
extern T1 T17f22(T0* C, T6 a1);
/* GEANT_EXIT_TASK.attribute_value */
extern T0* T308f6(T0* C, T0* a1);
/* GEANT_EXIT_TASK.project_variables_resolver */
extern T0* T308f9(T0* C);
/* GEANT_EXIT_TASK.has_attribute */
extern T1 T308f5(T0* C, T0* a1);
/* GEANT_EXIT_TASK.code_attribute_name */
extern unsigned char ge53os8752;
extern T0* ge53ov8752;
extern T0* T308f8(T0* C);
/* GEANT_EXIT_TASK.make */
extern void T308f23p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_EXIT_TASK.make */
extern T0* T308f23p1ac1(T0* a1);
/* GEANT_EXIT_TASK.make_with_command */
extern void T308f25(T0* C, T0* a1, T0* a2);
/* GEANT_EXIT_TASK.interpreting_element_make */
extern void T308f28(T0* C, T0* a1, T0* a2);
/* GEANT_EXIT_TASK.set_project */
extern void T308f30(T0* C, T0* a1);
/* GEANT_EXIT_TASK.element_make */
extern void T308f29(T0* C, T0* a1);
/* GEANT_EXIT_TASK.set_xml_element */
extern void T308f31(T0* C, T0* a1);
/* GEANT_EXIT_TASK.set_command */
extern void T308f27(T0* C, T0* a1);
/* GEANT_EXIT_TASK.build_command */
extern void T308f24(T0* C, T0* a1);
/* GEANT_EXIT_COMMAND.make */
extern T0* T450c7(T0* a1);
/* GEANT_EXIT_COMMAND.set_project */
extern void T450f9(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_outofdate_task */
extern T0* T191f42(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.make */
extern T0* T306c28(T0* a1, T0* a2);
/* GEANT_OUTOFDATE_COMMAND.set_fileset */
extern void T447f26(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.fileset_element_name */
extern unsigned char ge66os8731;
extern T0* ge66ov8731;
extern T0* T306f10(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_variable_name */
extern void T447f25(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.variable_attribute_name */
extern unsigned char ge66os8728;
extern T0* ge66ov8728;
extern T0* T306f8(T0* C);
/* GEANT_OUTOFDATE_TASK.false_value_attribute_name */
extern unsigned char ge66os8730;
extern T0* ge66ov8730;
extern T0* T306f7(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_false_value */
extern void T447f24(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.true_value_attribute_name */
extern unsigned char ge66os8729;
extern T0* ge66ov8729;
extern T0* T306f6(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_true_value */
extern void T447f23(T0* C, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.set_target_filename */
extern void T447f22(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.target_attribute_name */
extern unsigned char ge66os8727;
extern T0* ge66ov8727;
extern T0* T306f5(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_source_filename */
extern void T447f21(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.attribute_value */
extern T0* T306f11(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.project_variables_resolver */
extern T0* T306f14(T0* C);
/* GEANT_OUTOFDATE_TASK.has_attribute */
extern T1 T306f9(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.source_attribute_name */
extern unsigned char ge66os8726;
extern T0* ge66ov8726;
extern T0* T306f12(T0* C);
/* GEANT_OUTOFDATE_TASK.make */
extern void T306f28p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_OUTOFDATE_TASK.make */
extern T0* T306f28p1ac1(T0* a1);
/* GEANT_OUTOFDATE_TASK.make_with_command */
extern void T306f30(T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.interpreting_element_make */
extern void T306f33(T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.set_project */
extern void T306f35(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.element_make */
extern void T306f34(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.set_xml_element */
extern void T306f36(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.set_command */
extern void T306f32(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.build_command */
extern void T306f29(T0* C, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.make */
extern T0* T447c20(T0* a1);
/* GEANT_OUTOFDATE_COMMAND.set_project */
extern void T447f27(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_xslt_task */
extern T0* T191f40(T0* C, T0* a1);
/* GEANT_XSLT_TASK.make */
extern T0* T304c41(T0* a1, T0* a2);
/* GEANT_XSLT_COMMAND.set_classpath */
extern void T443f38(T0* C, T0* a1);
/* GEANT_XSLT_TASK.classpath_attribute_name */
extern unsigned char ge73os8686;
extern T0* ge73ov8686;
extern T0* T304f21(T0* C);
/* GEANT_XSLT_COMMAND.set_extdirs */
extern void T443f37(T0* C, T0* a1);
/* GEANT_XSLT_TASK.extdirs_attribute_name */
extern unsigned char ge73os8685;
extern T0* ge73ov8685;
extern T0* T304f20(T0* C);
/* GEANT_XSLT_COMMAND.set_format */
extern void T443f36(T0* C, T0* a1);
/* GEANT_XSLT_TASK.format_attribute_name */
extern unsigned char ge73os8683;
extern T0* ge73ov8683;
extern T0* T304f19(T0* C);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].force_last */
extern void T444f11(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]].force */
extern void T523f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [DS_PAIR [STRING_8, STRING_8]].fill_with */
extern void T524f7(T0* C, T0* a1, T6 a2, T6 a3);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].resize */
extern void T444f13(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]].resize */
extern T0* T523f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_PAIR [STRING_8, STRING_8]].aliased_resized_area */
extern T0* T524f3(T0* C, T6 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].new_capacity */
extern T6 T444f7(T0* C, T6 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].extendible */
extern T1 T444f8(T0* C, T6 a1);
/* DS_PAIR [STRING_8, STRING_8].make */
extern T0* T442c3(T0* a1, T0* a2);
/* GEANT_DEFINE_ELEMENT.has_value */
extern T1 T402f15(T0* C);
/* GEANT_XSLT_TASK.elements_by_name */
extern T0* T304f17(T0* C, T0* a1);
/* GEANT_XSLT_TASK.parameter_element_name */
extern unsigned char ge73os8687;
extern T0* ge73ov8687;
extern T0* T304f16(T0* C);
/* GEANT_XSLT_COMMAND.set_indent */
extern void T443f35(T0* C, T0* a1);
/* GEANT_XSLT_TASK.indent_attribute_name */
extern unsigned char ge73os8684;
extern T0* ge73ov8684;
extern T0* T304f15(T0* C);
/* GEANT_XSLT_COMMAND.set_force */
extern void T443f34(T0* C, T1 a1);
/* GEANT_XSLT_TASK.boolean_value */
extern T1 T304f14(T0* C, T0* a1);
/* GEANT_XSLT_TASK.std */
extern T0* T304f27(T0* C);
/* GEANT_XSLT_TASK.false_attribute_value */
extern T0* T304f26(T0* C);
/* GEANT_XSLT_TASK.true_attribute_value */
extern T0* T304f25(T0* C);
/* GEANT_XSLT_TASK.force_attribute_name */
extern unsigned char ge73os8677;
extern T0* ge73ov8677;
extern T0* T304f13(T0* C);
/* GEANT_XSLT_COMMAND.set_stylesheet_filename */
extern void T443f33(T0* C, T0* a1);
/* GEANT_XSLT_TASK.stylesheet_filename_attribute_name */
extern unsigned char ge73os8676;
extern T0* ge73ov8676;
extern T0* T304f12(T0* C);
/* GEANT_XSLT_COMMAND.set_output_filename */
extern void T443f32(T0* C, T0* a1);
/* GEANT_XSLT_TASK.output_filename_attribute_name */
extern unsigned char ge73os8675;
extern T0* ge73ov8675;
extern T0* T304f11(T0* C);
/* GEANT_XSLT_COMMAND.set_input_filename */
extern void T443f31(T0* C, T0* a1);
/* GEANT_XSLT_TASK.input_filename_attribute_name */
extern unsigned char ge73os8674;
extern T0* ge73ov8674;
extern T0* T304f10(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_gexslt */
extern void T443f30(T0* C);
/* GEANT_XSLT_COMMAND.set_processor */
extern void T443f40(T0* C, T6 a1);
/* GEANT_XSLT_TASK.processor_attribute_value_gexslt */
extern unsigned char ge73os8682;
extern T0* ge73ov8682;
extern T0* T304f9(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xsltproc */
extern void T443f29(T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xsltproc */
extern unsigned char ge73os8681;
extern T0* ge73ov8681;
extern T0* T304f8(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xalan_java */
extern void T443f28(T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xalan_java */
extern unsigned char ge73os8680;
extern T0* ge73ov8680;
extern T0* T304f7(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xalan_cpp */
extern void T443f27(T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xalan_cpp */
extern unsigned char ge73os8679;
extern T0* ge73ov8679;
extern T0* T304f5(T0* C);
/* GEANT_XSLT_TASK.string_ */
extern T0* T304f24(T0* C);
/* GEANT_XSLT_TASK.attribute_value */
extern T0* T304f22(T0* C, T0* a1);
/* GEANT_XSLT_TASK.project_variables_resolver */
extern T0* T304f28(T0* C);
/* GEANT_XSLT_TASK.has_attribute */
extern T1 T304f18(T0* C, T0* a1);
/* GEANT_XSLT_TASK.processor_attribute_name */
extern unsigned char ge73os8678;
extern T0* ge73ov8678;
extern T0* T304f6(T0* C);
/* GEANT_XSLT_TASK.make */
extern void T304f41p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_XSLT_TASK.make */
extern T0* T304f41p1ac1(T0* a1);
/* GEANT_XSLT_TASK.make_with_command */
extern void T304f43(T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_TASK.interpreting_element_make */
extern void T304f46(T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_TASK.set_project */
extern void T304f48(T0* C, T0* a1);
/* GEANT_XSLT_TASK.element_make */
extern void T304f47(T0* C, T0* a1);
/* GEANT_XSLT_TASK.set_xml_element */
extern void T304f49(T0* C, T0* a1);
/* GEANT_XSLT_TASK.set_command */
extern void T304f45(T0* C, T0* a1);
/* GEANT_XSLT_TASK.build_command */
extern void T304f42(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.make */
extern T0* T443c26(T0* a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].make */
extern T0* T444c10(T6 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].set_internal_cursor */
extern void T444f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].new_cursor */
extern T0* T444f6(T0* C);
/* DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING_8, STRING_8]].make */
extern T0* T525c3(T0* a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]].make */
extern T0* T523f1(T0* C, T6 a1);
/* ARRAY [DS_PAIR [STRING_8, STRING_8]].make_empty */
extern T0* T554c4(void);
/* ARRAY [DS_PAIR [STRING_8, STRING_8]].make_area */
extern void T554f5(T0* C, T6 a1);
/* SPECIAL [DS_PAIR [STRING_8, STRING_8]].make */
extern T0* T524c5(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]].default_create */
extern T0* T523c3(void);
/* GEANT_XSLT_COMMAND.make */
extern void T443f26p1(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.set_project */
extern void T443f39(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_setenv_task */
extern T0* T191f38(T0* C, T0* a1);
/* GEANT_SETENV_TASK.make */
extern T0* T302c24(T0* a1, T0* a2);
/* GEANT_SETENV_COMMAND.set_value */
extern void T439f11(T0* C, T0* a1);
/* GEANT_SETENV_TASK.value_attribute_name */
extern unsigned char ge69os8664;
extern T0* ge69ov8664;
extern T0* T302f5(T0* C);
/* GEANT_SETENV_COMMAND.set_name */
extern void T439f10(T0* C, T0* a1);
/* GEANT_SETENV_TASK.attribute_value */
extern T0* T302f7(T0* C, T0* a1);
/* GEANT_SETENV_TASK.project_variables_resolver */
extern T0* T302f10(T0* C);
/* GEANT_SETENV_TASK.has_attribute */
extern T1 T302f6(T0* C, T0* a1);
/* GEANT_SETENV_TASK.name_attribute_name */
extern unsigned char ge69os8663;
extern T0* ge69ov8663;
extern T0* T302f9(T0* C);
/* GEANT_SETENV_TASK.make */
extern void T302f24p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_SETENV_TASK.make */
extern T0* T302f24p1ac1(T0* a1);
/* GEANT_SETENV_TASK.make_with_command */
extern void T302f26(T0* C, T0* a1, T0* a2);
/* GEANT_SETENV_TASK.interpreting_element_make */
extern void T302f29(T0* C, T0* a1, T0* a2);
/* GEANT_SETENV_TASK.set_project */
extern void T302f31(T0* C, T0* a1);
/* GEANT_SETENV_TASK.element_make */
extern void T302f30(T0* C, T0* a1);
/* GEANT_SETENV_TASK.set_xml_element */
extern void T302f32(T0* C, T0* a1);
/* GEANT_SETENV_TASK.set_command */
extern void T302f28(T0* C, T0* a1);
/* GEANT_SETENV_TASK.build_command */
extern void T302f25(T0* C, T0* a1);
/* GEANT_SETENV_COMMAND.make */
extern T0* T439c9(T0* a1);
/* GEANT_SETENV_COMMAND.set_project */
extern void T439f12(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_move_task */
extern T0* T191f36(T0* C, T0* a1);
/* GEANT_MOVE_TASK.make */
extern T0* T300c26(T0* a1, T0* a2);
/* GEANT_MOVE_COMMAND.set_fileset */
extern void T436f21(T0* C, T0* a1);
/* GEANT_MOVE_TASK.fileset_element_name */
extern unsigned char ge65os8645;
extern T0* ge65ov8645;
extern T0* T300f8(T0* C);
/* GEANT_MOVE_COMMAND.set_to_directory */
extern void T436f20(T0* C, T0* a1);
/* GEANT_MOVE_TASK.to_directory_attribute_name */
extern unsigned char ge65os8644;
extern T0* ge65ov8644;
extern T0* T300f6(T0* C);
/* GEANT_MOVE_COMMAND.set_to_file */
extern void T436f19(T0* C, T0* a1);
/* GEANT_MOVE_TASK.to_file_attribute_name */
extern unsigned char ge65os8643;
extern T0* ge65ov8643;
extern T0* T300f5(T0* C);
/* GEANT_MOVE_COMMAND.set_file */
extern void T436f18(T0* C, T0* a1);
/* GEANT_MOVE_TASK.attribute_value */
extern T0* T300f9(T0* C, T0* a1);
/* GEANT_MOVE_TASK.project_variables_resolver */
extern T0* T300f12(T0* C);
/* GEANT_MOVE_TASK.has_attribute */
extern T1 T300f7(T0* C, T0* a1);
/* GEANT_MOVE_TASK.file_attribute_name */
extern unsigned char ge65os8642;
extern T0* ge65ov8642;
extern T0* T300f10(T0* C);
/* GEANT_MOVE_TASK.make */
extern void T300f26p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_MOVE_TASK.make */
extern T0* T300f26p1ac1(T0* a1);
/* GEANT_MOVE_TASK.make_with_command */
extern void T300f28(T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_TASK.interpreting_element_make */
extern void T300f31(T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_TASK.set_project */
extern void T300f33(T0* C, T0* a1);
/* GEANT_MOVE_TASK.element_make */
extern void T300f32(T0* C, T0* a1);
/* GEANT_MOVE_TASK.set_xml_element */
extern void T300f34(T0* C, T0* a1);
/* GEANT_MOVE_TASK.set_command */
extern void T300f30(T0* C, T0* a1);
/* GEANT_MOVE_TASK.build_command */
extern void T300f27(T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.make */
extern T0* T436c17(T0* a1);
/* GEANT_MOVE_COMMAND.set_project */
extern void T436f22(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_copy_task */
extern T0* T191f34(T0* C, T0* a1);
/* GEANT_COPY_TASK.make */
extern T0* T298c31(T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.set_fileset */
extern void T433f25(T0* C, T0* a1);
/* GEANT_COPY_TASK.fileset_element_name */
extern unsigned char ge49os8622;
extern T0* ge49ov8622;
extern T0* T298f10(T0* C);
/* GEANT_COPY_COMMAND.set_force */
extern void T433f24(T0* C, T1 a1);
/* GEANT_COPY_TASK.boolean_value */
extern T1 T298f8(T0* C, T0* a1);
/* GEANT_COPY_TASK.std */
extern T0* T298f17(T0* C);
/* GEANT_COPY_TASK.false_attribute_value */
extern T0* T298f16(T0* C);
/* GEANT_COPY_TASK.true_attribute_value */
extern T0* T298f15(T0* C);
/* GEANT_COPY_TASK.string_ */
extern T0* T298f14(T0* C);
/* GEANT_COPY_TASK.force_attribute_name */
extern unsigned char ge49os8621;
extern T0* ge49ov8621;
extern T0* T298f7(T0* C);
/* GEANT_COPY_COMMAND.set_to_directory */
extern void T433f23(T0* C, T0* a1);
/* GEANT_COPY_TASK.to_directory_attribute_name */
extern unsigned char ge49os8620;
extern T0* ge49ov8620;
extern T0* T298f6(T0* C);
/* GEANT_COPY_COMMAND.set_to_file */
extern void T433f22(T0* C, T0* a1);
/* GEANT_COPY_TASK.to_file_attribute_name */
extern unsigned char ge49os8619;
extern T0* ge49ov8619;
extern T0* T298f5(T0* C);
/* GEANT_COPY_COMMAND.set_file */
extern void T433f21(T0* C, T0* a1);
/* GEANT_COPY_TASK.attribute_value */
extern T0* T298f11(T0* C, T0* a1);
/* GEANT_COPY_TASK.project_variables_resolver */
extern T0* T298f18(T0* C);
/* GEANT_COPY_TASK.has_attribute */
extern T1 T298f9(T0* C, T0* a1);
/* GEANT_COPY_TASK.file_attribute_name */
extern unsigned char ge49os8618;
extern T0* ge49ov8618;
extern T0* T298f12(T0* C);
/* GEANT_COPY_TASK.make */
extern void T298f31p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_COPY_TASK.make */
extern T0* T298f31p1ac1(T0* a1);
/* GEANT_COPY_TASK.make_with_command */
extern void T298f33(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_TASK.interpreting_element_make */
extern void T298f36(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_TASK.set_project */
extern void T298f38(T0* C, T0* a1);
/* GEANT_COPY_TASK.element_make */
extern void T298f37(T0* C, T0* a1);
/* GEANT_COPY_TASK.set_xml_element */
extern void T298f39(T0* C, T0* a1);
/* GEANT_COPY_TASK.set_command */
extern void T298f35(T0* C, T0* a1);
/* GEANT_COPY_TASK.build_command */
extern void T298f32(T0* C, T0* a1);
/* GEANT_COPY_COMMAND.make */
extern T0* T433c20(T0* a1);
/* GEANT_COPY_COMMAND.set_project */
extern void T433f26(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_delete_task */
extern T0* T191f32(T0* C, T0* a1);
/* GEANT_DELETE_TASK.make */
extern T0* T296c26(T0* a1, T0* a2);
/* GEANT_DELETE_COMMAND.set_directoryset */
extern void T429f23(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.make */
extern T0* T428c20(T0* a1, T0* a2);
/* GEANT_DIRECTORYSET.add_single_exclude */
extern void T430f27(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.exclude_element_name */
extern unsigned char ge77os9313;
extern T0* ge77ov9313;
extern T0* T428f12(T0* C);
/* GEANT_DIRECTORYSET.add_single_include */
extern void T430f26(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.elements_by_name */
extern T0* T428f11(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.string_ */
extern T0* T428f16(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.include_element_name */
extern unsigned char ge77os9312;
extern T0* ge77ov9312;
extern T0* T428f10(T0* C);
/* GEANT_DIRECTORYSET.set_concat */
extern void T430f25(T0* C, T1 a1);
/* GEANT_DIRECTORYSET_ELEMENT.boolean_value */
extern T1 T428f9(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.std */
extern T0* T428f19(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.false_attribute_value */
extern T0* T428f18(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.true_attribute_value */
extern T0* T428f17(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.concat_attribute_name */
extern unsigned char ge77os9311;
extern T0* ge77ov9311;
extern T0* T428f8(T0* C);
/* GEANT_DIRECTORYSET.set_exclude_wc_string */
extern void T430f24(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.exclude_attribute_name */
extern unsigned char ge77os9310;
extern T0* ge77ov9310;
extern T0* T428f7(T0* C);
/* GEANT_DIRECTORYSET.set_include_wc_string */
extern void T430f23(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.include_attribute_name */
extern unsigned char ge77os9309;
extern T0* ge77ov9309;
extern T0* T428f6(T0* C);
/* GEANT_DIRECTORYSET.set_directory_name */
extern void T430f22(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.attribute_value */
extern T0* T428f5(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.project_variables_resolver */
extern T0* T428f15(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.has_attribute */
extern T1 T428f14(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.directory_attribute_name */
extern unsigned char ge77os9308;
extern T0* ge77ov9308;
extern T0* T428f13(T0* C);
/* GEANT_DIRECTORYSET.make */
extern T0* T430c21(T0* a1);
/* GEANT_DIRECTORYSET.set_directory_name_variable_name */
extern void T430f28(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.make */
extern void T428f20p1(T0* C, T0* a1, T0* a2);
/* GEANT_DIRECTORYSET_ELEMENT.set_project */
extern void T428f22(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.element_make */
extern void T428f21(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.set_xml_element */
extern void T428f23(T0* C, T0* a1);
/* GEANT_DELETE_TASK.directoryset_element_name */
extern unsigned char ge50os8600;
extern T0* ge50ov8600;
extern T0* T296f9(T0* C);
/* GEANT_DELETE_COMMAND.set_fileset */
extern void T429f22(T0* C, T0* a1);
/* GEANT_DELETE_TASK.fileset_element_name */
extern unsigned char ge50os8599;
extern T0* ge50ov8599;
extern T0* T296f7(T0* C);
/* GEANT_DELETE_COMMAND.set_file */
extern void T429f21(T0* C, T0* a1);
/* GEANT_DELETE_TASK.file_attribute_name */
extern unsigned char ge50os8598;
extern T0* ge50ov8598;
extern T0* T296f5(T0* C);
/* GEANT_DELETE_COMMAND.set_directory */
extern void T429f20(T0* C, T0* a1);
/* GEANT_DELETE_TASK.attribute_value */
extern T0* T296f8(T0* C, T0* a1);
/* GEANT_DELETE_TASK.project_variables_resolver */
extern T0* T296f12(T0* C);
/* GEANT_DELETE_TASK.has_attribute */
extern T1 T296f6(T0* C, T0* a1);
/* GEANT_DELETE_TASK.directory_attribute_name */
extern unsigned char ge50os8597;
extern T0* ge50ov8597;
extern T0* T296f10(T0* C);
/* GEANT_DELETE_TASK.make */
extern void T296f26p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_DELETE_TASK.make */
extern T0* T296f26p1ac1(T0* a1);
/* GEANT_DELETE_TASK.make_with_command */
extern void T296f28(T0* C, T0* a1, T0* a2);
/* GEANT_DELETE_TASK.interpreting_element_make */
extern void T296f31(T0* C, T0* a1, T0* a2);
/* GEANT_DELETE_TASK.set_project */
extern void T296f33(T0* C, T0* a1);
/* GEANT_DELETE_TASK.element_make */
extern void T296f32(T0* C, T0* a1);
/* GEANT_DELETE_TASK.set_xml_element */
extern void T296f34(T0* C, T0* a1);
/* GEANT_DELETE_TASK.set_command */
extern void T296f30(T0* C, T0* a1);
/* GEANT_DELETE_TASK.build_command */
extern void T296f27(T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.make */
extern T0* T429c19(T0* a1);
/* GEANT_DELETE_COMMAND.set_project */
extern void T429f24(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_mkdir_task */
extern T0* T191f30(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.make_from_interpreting_element */
extern T0* T294c21(T0* a1);
/* Creation of agent #1 in feature GEANT_MKDIR_TASK.make_from_interpreting_element */
extern T0* T294f21ac1(T0* a1, T0* a2);
/* GEANT_MKDIR_TASK.make_from_interpreting_element */
extern void T294f21p1(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.make */
extern void T294f22(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_MKDIR_TASK.make */
extern T0* T294f22ac1(T0* a1);
/* GEANT_MKDIR_TASK.make_with_command */
extern void T294f24(T0* C, T0* a1, T0* a2);
/* GEANT_MKDIR_TASK.interpreting_element_make */
extern void T294f27(T0* C, T0* a1, T0* a2);
/* GEANT_MKDIR_TASK.set_project */
extern void T294f29(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.element_make */
extern void T294f28(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.set_xml_element */
extern void T294f30(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.set_command */
extern void T294f26(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.build_command */
extern void T294f23(T0* C, T0* a1);
/* GEANT_MKDIR_COMMAND.make */
extern T0* T425c13(T0* a1);
/* Creation of agent #1 in feature GEANT_MKDIR_COMMAND.make */
extern T0* T425f13ac1(T0* a1);
/* GEANT_MKDIR_COMMAND.create_directory */
extern void T425f14(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.recursive_create_directory */
extern void T53f38(T0* C, T0* a1);
/* KL_DIRECTORY.recursive_create_directory */
extern void T489f41(T0* C);
/* KL_UNIX_FILE_SYSTEM.canonical_pathname */
extern T0* T54f28(T0* C, T0* a1);
/* KL_PATHNAME.set_canonical */
extern void T86f18(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.canonical_pathname */
extern T0* T53f34(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.string_to_pathname */
extern T0* T53f35(T0* C, T0* a1);
/* KL_PATHNAME.set_drive */
extern void T86f21(T0* C, T0* a1);
/* KL_PATHNAME.set_sharename */
extern void T86f20(T0* C, T0* a1);
/* KL_PATHNAME.set_hostname */
extern void T86f19(T0* C, T0* a1);
/* KL_DIRECTORY.file_system */
extern T0* T489f16(T0* C);
/* KL_DIRECTORY.unix_file_system */
extern T0* T489f26(T0* C);
/* KL_DIRECTORY.windows_file_system */
extern T0* T489f25(T0* C);
/* KL_DIRECTORY.operating_system */
extern T0* T489f24(T0* C);
/* KL_DIRECTORY.create_directory */
extern void T489f45(T0* C);
/* KL_DIRECTORY.create_dir */
extern void T489f48(T0* C);
/* KL_DIRECTORY.file_mkdir */
extern void T489f49(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.recursive_create_directory */
extern void T54f34(T0* C, T0* a1);
/* GEANT_MKDIR_COMMAND.unix_file_system */
extern T0* T425f7(T0* C);
/* GEANT_MKDIR_COMMAND.file_system */
extern T0* T425f6(T0* C);
/* GEANT_MKDIR_COMMAND.windows_file_system */
extern T0* T425f9(T0* C);
/* GEANT_MKDIR_COMMAND.operating_system */
extern T0* T425f8(T0* C);
/* DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8]]].make */
extern T0* T511c2(T0* a1);
/* GEANT_MKDIR_COMMAND.make */
extern void T425f13p1(T0* C, T0* a1);
/* GEANT_MKDIR_COMMAND.set_project */
extern void T425f15(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_echo_task */
extern T0* T191f28(T0* C, T0* a1);
/* GEANT_ECHO_TASK.make_from_interpreting_element */
extern T0* T292c21(T0* a1);
/* Creation of agent #1 in feature GEANT_ECHO_TASK.make_from_interpreting_element */
extern T0* T292f21ac1(T0* a1, T0* a2);
/* Creation of agent #2 in feature GEANT_ECHO_TASK.make_from_interpreting_element */
extern T0* T292f21ac2(T0* a1, T0* a2);
/* Creation of agent #3 in feature GEANT_ECHO_TASK.make_from_interpreting_element */
extern T0* T292f21ac3(T0* a1, T0* a2);
/* GEANT_INTERPRETING_ELEMENT.attribute_or_content_value */
extern T0* T196f6(T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.exit_application */
extern void T196f17(T0* C, T6 a1, T0* a2);
/* GEANT_INTERPRETING_ELEMENT.exceptions */
extern T0* T196f11(T0* C);
/* GEANT_INTERPRETING_ELEMENT.std */
extern T0* T196f10(T0* C);
/* GEANT_INTERPRETING_ELEMENT.log_messages */
extern void T196f16(T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.content */
extern T0* T196f9(T0* C);
/* GEANT_BOOLEAN_PROPERTY.set_string_value_agent */
extern void T389f13(T0* C, T0* a1);
/* GEANT_ECHO_TASK.make_from_interpreting_element */
extern void T292f21p1(T0* C, T0* a1);
/* GEANT_ECHO_TASK.make */
extern void T292f22(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_ECHO_TASK.make */
extern T0* T292f22ac1(T0* a1);
/* GEANT_ECHO_TASK.make_with_command */
extern void T292f24(T0* C, T0* a1, T0* a2);
/* GEANT_ECHO_TASK.interpreting_element_make */
extern void T292f27(T0* C, T0* a1, T0* a2);
/* GEANT_ECHO_TASK.set_project */
extern void T292f29(T0* C, T0* a1);
/* GEANT_ECHO_TASK.element_make */
extern void T292f28(T0* C, T0* a1);
/* GEANT_ECHO_TASK.set_xml_element */
extern void T292f30(T0* C, T0* a1);
/* GEANT_ECHO_TASK.set_command */
extern void T292f26(T0* C, T0* a1);
/* GEANT_ECHO_TASK.build_command */
extern void T292f23(T0* C, T0* a1);
/* GEANT_ECHO_COMMAND.make */
extern T0* T422c12(T0* a1);
/* Creation of agent #1 in feature GEANT_ECHO_COMMAND.make */
extern T0* T422f12ac1(T0* a1);
/* Creation of agent #2 in feature GEANT_ECHO_COMMAND.make */
extern T0* T422f12ac2(T0* a1);
/* GEANT_ECHO_COMMAND.write_message_to_file */
extern void T422f14(T0* C, T0* a1, T0* a2, T1 a3);
/* KL_TEXT_OUTPUT_FILE.put_line */
extern void T517f25(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.put_new_line */
extern void T517f32(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_string */
extern void T517f31(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_put_string */
extern void T517f34(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_ps */
extern void T517f35(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_TEXT_OUTPUT_FILE.string_ */
extern T0* T517f9(T0* C);
/* KL_TEXT_OUTPUT_FILE.is_open_write */
extern T1 T517f15(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
extern T1 T517f12(T0* C);
/* GEANT_ECHO_COMMAND.write_message */
extern void T422f13(T0* C, T0* a1);
/* DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]]].make */
extern T0* T516c2(T0* a1);
/* GEANT_BOOLEAN_PROPERTY.make */
extern T0* T389c12(void);
/* GEANT_ECHO_COMMAND.make */
extern void T422f12p1(T0* C, T0* a1);
/* GEANT_ECHO_COMMAND.set_project */
extern void T422f15(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_geant_task */
extern T0* T191f26(T0* C, T0* a1);
/* GEANT_GEANT_TASK.make */
extern T0* T290c36(T0* a1, T0* a2);
/* GEANT_GEANT_TASK.arguments_string_splitter */
extern T0* T290f16(T0* C);
/* GEANT_GEANT_TASK.exit_application */
extern void T290f37(T0* C, T6 a1, T0* a2);
/* GEANT_GEANT_TASK.exceptions */
extern T0* T290f18(T0* C);
/* GEANT_GEANT_TASK.std */
extern T0* T290f17(T0* C);
/* GEANT_GEANT_TASK.log_messages */
extern void T290f41(T0* C, T0* a1);
/* GEANT_GEANT_TASK.arguments_attribute_name */
extern unsigned char ge54os8545;
extern T0* ge54ov8545;
extern T0* T290f15(T0* C);
/* GEANT_GEANT_TASK.elements_by_name */
extern T0* T290f14(T0* C, T0* a1);
/* GEANT_GEANT_TASK.string_ */
extern T0* T290f21(T0* C);
/* GEANT_GEANT_TASK.argument_element_name */
extern unsigned char ge54os8544;
extern T0* ge54ov8544;
extern T0* T290f13(T0* C);
/* GEANT_GEANT_COMMAND.set_exit_code_variable_name */
extern void T418f32(T0* C, T0* a1);
/* GEANT_GEANT_TASK.exit_code_variable_attribute_name */
extern unsigned char ge54os8546;
extern T0* ge54ov8546;
extern T0* T290f12(T0* C);
/* GEANT_GEANT_TASK.fork_attribute_name */
extern unsigned char ge54os8542;
extern T0* ge54ov8542;
extern T0* T290f11(T0* C);
/* GEANT_GEANT_COMMAND.set_fileset */
extern void T418f31(T0* C, T0* a1);
/* GEANT_GEANT_TASK.fileset_element_name */
extern unsigned char ge54os8543;
extern T0* ge54ov8543;
extern T0* T290f9(T0* C);
/* GEANT_GEANT_COMMAND.set_fork */
extern void T418f30(T0* C, T1 a1);
/* GEANT_GEANT_COMMAND.set_filename */
extern void T418f29(T0* C, T0* a1);
/* GEANT_GEANT_TASK.filename_attribute_name */
extern unsigned char ge54os8539;
extern T0* ge54ov8539;
extern T0* T290f7(T0* C);
/* GEANT_GEANT_COMMAND.set_reuse_variables */
extern void T418f28(T0* C, T1 a1);
/* GEANT_GEANT_TASK.boolean_value */
extern T1 T290f6(T0* C, T0* a1);
/* GEANT_GEANT_TASK.false_attribute_value */
extern T0* T290f23(T0* C);
/* GEANT_GEANT_TASK.true_attribute_value */
extern T0* T290f22(T0* C);
/* GEANT_GEANT_TASK.reuse_variables_attribute_name */
extern unsigned char ge54os8541;
extern T0* ge54ov8541;
extern T0* T290f5(T0* C);
/* GEANT_GEANT_COMMAND.set_start_target_name */
extern void T418f27(T0* C, T0* a1);
/* GEANT_GEANT_TASK.attribute_value */
extern T0* T290f10(T0* C, T0* a1);
/* GEANT_GEANT_TASK.project_variables_resolver */
extern T0* T290f24(T0* C);
/* GEANT_GEANT_TASK.has_attribute */
extern T1 T290f8(T0* C, T0* a1);
/* GEANT_GEANT_TASK.start_target_attribute_name */
extern unsigned char ge54os8540;
extern T0* ge54ov8540;
extern T0* T290f19(T0* C);
/* GEANT_GEANT_TASK.make */
extern void T290f36p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEANT_TASK.make */
extern T0* T290f36p1ac1(T0* a1);
/* GEANT_GEANT_TASK.make_with_command */
extern void T290f39(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_TASK.interpreting_element_make */
extern void T290f43(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_TASK.set_project */
extern void T290f45(T0* C, T0* a1);
/* GEANT_GEANT_TASK.element_make */
extern void T290f44(T0* C, T0* a1);
/* GEANT_GEANT_TASK.set_xml_element */
extern void T290f46(T0* C, T0* a1);
/* GEANT_GEANT_TASK.set_command */
extern void T290f42(T0* C, T0* a1);
/* GEANT_GEANT_TASK.build_command */
extern void T290f38(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.make */
extern T0* T418c26(T0* a1);
/* GEANT_GEANT_COMMAND.make */
extern void T418f26p1(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.set_project */
extern void T418f33(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_getest_task */
extern T0* T191f24(T0* C, T0* a1);
/* GEANT_GETEST_TASK.make */
extern T0* T288c39(T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force */
extern void T81f56(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_put */
extern void T81f65(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_put */
extern void T81f64(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_put */
extern void T81f63(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_item */
extern T6 T81f34(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_item */
extern T6 T81f37(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].hash_position */
extern T6 T81f32(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].resize */
extern void T81f62(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_resize */
extern void T81f71(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_resize */
extern void T81f70(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_resize */
extern void T81f69(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_item */
extern T0* T81f30(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_resize */
extern void T81f68(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_capacity */
extern T6 T81f31(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_put */
extern void T81f61(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].search_position */
extern void T81f60(T0* C, T0* a1);
/* GEANT_GETEST_TASK.define_element_name */
extern unsigned char ge58os8510;
extern T0* ge58ov8510;
extern T0* T288f20(T0* C);
/* GEANT_GETEST_TASK.true_attribute_value */
extern T0* T288f19(T0* C);
/* GEANT_GETEST_TASK.string_ */
extern T0* T288f18(T0* C);
/* GEANT_GETEST_TASK.elements_by_name */
extern T0* T288f16(T0* C, T0* a1);
/* GEANT_GETEST_TASK.attribute_element_name */
extern unsigned char ge58os8509;
extern T0* ge58ov8509;
extern T0* T288f15(T0* C);
/* GEANT_GETEST_COMMAND.set_abort */
extern void T415f32(T0* C, T1 a1);
/* GEANT_GETEST_TASK.abort_attribute_name */
extern unsigned char ge58os8508;
extern T0* ge58ov8508;
extern T0* T288f14(T0* C);
/* GEANT_GETEST_COMMAND.set_execution */
extern void T415f31(T0* C, T1 a1);
/* GEANT_GETEST_TASK.execution_attribute_name */
extern unsigned char ge58os8507;
extern T0* ge58ov8507;
extern T0* T288f13(T0* C);
/* GEANT_GETEST_COMMAND.set_compilation */
extern void T415f30(T0* C, T1 a1);
/* GEANT_GETEST_TASK.compilation_attribute_name */
extern unsigned char ge58os8506;
extern T0* ge58ov8506;
extern T0* T288f12(T0* C);
/* GEANT_GETEST_COMMAND.set_generation */
extern void T415f29(T0* C, T1 a1);
/* GEANT_GETEST_TASK.generation_attribute_name */
extern unsigned char ge58os8505;
extern T0* ge58ov8505;
extern T0* T288f11(T0* C);
/* GEANT_GETEST_COMMAND.set_default_test_included */
extern void T415f28(T0* C, T1 a1);
/* GEANT_GETEST_TASK.default_test_attribute_name */
extern unsigned char ge58os8504;
extern T0* ge58ov8504;
extern T0* T288f10(T0* C);
/* GEANT_GETEST_COMMAND.set_feature_regexp */
extern void T415f27(T0* C, T0* a1);
/* GEANT_GETEST_TASK.feature_attribute_name */
extern unsigned char ge58os8503;
extern T0* ge58ov8503;
extern T0* T288f9(T0* C);
/* GEANT_GETEST_COMMAND.set_class_regexp */
extern void T415f26(T0* C, T0* a1);
/* GEANT_GETEST_TASK.class_attribute_name */
extern unsigned char ge58os8502;
extern T0* ge58ov8502;
extern T0* T288f8(T0* C);
/* GEANT_GETEST_COMMAND.set_compile */
extern void T415f25(T0* C, T0* a1);
/* GEANT_GETEST_TASK.compile_attribute_name */
extern unsigned char ge58os8501;
extern T0* ge58ov8501;
extern T0* T288f7(T0* C);
/* GEANT_GETEST_COMMAND.set_config_filename */
extern void T415f24(T0* C, T0* a1);
/* GEANT_GETEST_TASK.attribute_value */
extern T0* T288f6(T0* C, T0* a1);
/* GEANT_GETEST_TASK.project_variables_resolver */
extern T0* T288f24(T0* C);
/* GEANT_GETEST_TASK.config_filename_attribute_name */
extern unsigned char ge58os8500;
extern T0* ge58ov8500;
extern T0* T288f5(T0* C);
/* GEANT_GETEST_COMMAND.set_verbose */
extern void T415f23(T0* C, T1 a1);
/* GEANT_GETEST_TASK.boolean_value */
extern T1 T288f23(T0* C, T0* a1);
/* GEANT_GETEST_TASK.std */
extern T0* T288f26(T0* C);
/* GEANT_GETEST_TASK.false_attribute_value */
extern T0* T288f25(T0* C);
/* GEANT_GETEST_TASK.has_attribute */
extern T1 T288f17(T0* C, T0* a1);
/* GEANT_GETEST_TASK.verbose_attribute_name */
extern unsigned char ge58os8499;
extern T0* ge58ov8499;
extern T0* T288f21(T0* C);
/* GEANT_GETEST_TASK.make */
extern void T288f39p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GETEST_TASK.make */
extern T0* T288f39p1ac1(T0* a1);
/* GEANT_GETEST_TASK.make_with_command */
extern void T288f41(T0* C, T0* a1, T0* a2);
/* GEANT_GETEST_TASK.interpreting_element_make */
extern void T288f44(T0* C, T0* a1, T0* a2);
/* GEANT_GETEST_TASK.set_project */
extern void T288f46(T0* C, T0* a1);
/* GEANT_GETEST_TASK.element_make */
extern void T288f45(T0* C, T0* a1);
/* GEANT_GETEST_TASK.set_xml_element */
extern void T288f47(T0* C, T0* a1);
/* GEANT_GETEST_TASK.set_command */
extern void T288f43(T0* C, T0* a1);
/* GEANT_GETEST_TASK.build_command */
extern void T288f40(T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.make */
extern T0* T415c22(T0* a1);
/* GEANT_GETEST_COMMAND.make */
extern void T415f22p1(T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.set_project */
extern void T415f33(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_gepp_task */
extern T0* T191f22(T0* C, T0* a1);
/* GEANT_GEPP_TASK.make */
extern T0* T286c34(T0* a1, T0* a2);
/* GEANT_GEPP_COMMAND.set_fileset */
extern void T412f27(T0* C, T0* a1);
/* GEANT_GEPP_TASK.fileset_element_name */
extern unsigned char ge57os8474;
extern T0* ge57ov8474;
extern T0* T286f14(T0* C);
/* GEANT_GEPP_COMMAND.set_force */
extern void T412f26(T0* C, T1 a1);
/* GEANT_GEPP_TASK.force_attribute_name */
extern unsigned char ge57os8473;
extern T0* ge57ov8473;
extern T0* T286f12(T0* C);
/* GEANT_GEPP_COMMAND.set_to_directory */
extern void T412f25(T0* C, T0* a1);
/* GEANT_GEPP_TASK.to_directory_attribute_name */
extern unsigned char ge57os8472;
extern T0* ge57ov8472;
extern T0* T286f11(T0* C);
/* GEANT_GEPP_TASK.elements_by_name */
extern T0* T286f9(T0* C, T0* a1);
/* GEANT_GEPP_TASK.string_ */
extern T0* T286f17(T0* C);
/* GEANT_GEPP_TASK.define_element_name */
extern unsigned char ge57os8471;
extern T0* ge57ov8471;
extern T0* T286f8(T0* C);
/* GEANT_GEPP_COMMAND.set_empty_lines */
extern void T412f24(T0* C, T1 a1);
/* GEANT_GEPP_TASK.boolean_value */
extern T1 T286f7(T0* C, T0* a1);
/* GEANT_GEPP_TASK.std */
extern T0* T286f20(T0* C);
/* GEANT_GEPP_TASK.false_attribute_value */
extern T0* T286f19(T0* C);
/* GEANT_GEPP_TASK.true_attribute_value */
extern T0* T286f18(T0* C);
/* GEANT_GEPP_TASK.lines_attribute_name */
extern unsigned char ge57os8470;
extern T0* ge57ov8470;
extern T0* T286f6(T0* C);
/* GEANT_GEPP_COMMAND.set_output_filename */
extern void T412f23(T0* C, T0* a1);
/* GEANT_GEPP_TASK.output_filename_attribute_name */
extern unsigned char ge57os8469;
extern T0* ge57ov8469;
extern T0* T286f5(T0* C);
/* GEANT_GEPP_COMMAND.set_input_filename */
extern void T412f22(T0* C, T0* a1);
/* GEANT_GEPP_TASK.attribute_value */
extern T0* T286f13(T0* C, T0* a1);
/* GEANT_GEPP_TASK.project_variables_resolver */
extern T0* T286f21(T0* C);
/* GEANT_GEPP_TASK.has_attribute */
extern T1 T286f10(T0* C, T0* a1);
/* GEANT_GEPP_TASK.input_filename_attribute_name */
extern unsigned char ge57os8468;
extern T0* ge57ov8468;
extern T0* T286f15(T0* C);
/* GEANT_GEPP_TASK.make */
extern void T286f34p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEPP_TASK.make */
extern T0* T286f34p1ac1(T0* a1);
/* GEANT_GEPP_TASK.make_with_command */
extern void T286f36(T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_TASK.interpreting_element_make */
extern void T286f39(T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_TASK.set_project */
extern void T286f41(T0* C, T0* a1);
/* GEANT_GEPP_TASK.element_make */
extern void T286f40(T0* C, T0* a1);
/* GEANT_GEPP_TASK.set_xml_element */
extern void T286f42(T0* C, T0* a1);
/* GEANT_GEPP_TASK.set_command */
extern void T286f38(T0* C, T0* a1);
/* GEANT_GEPP_TASK.build_command */
extern void T286f35(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.make */
extern T0* T412c21(T0* a1);
/* GEANT_GEPP_COMMAND.make */
extern void T412f21p1(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.set_project */
extern void T412f28(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_geyacc_task */
extern T0* T191f20(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.make */
extern T0* T284c34(T0* a1, T0* a2);
/* GEANT_GEYACC_COMMAND.set_input_filename */
extern void T409f27(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.input_filename_attribute_name */
extern unsigned char ge60os8443;
extern T0* ge60ov8443;
extern T0* T284f12(T0* C);
/* GEANT_GEYACC_COMMAND.set_output_filename */
extern void T409f26(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.output_filename_attribute_name */
extern unsigned char ge60os8442;
extern T0* ge60ov8442;
extern T0* T284f11(T0* C);
/* GEANT_GEYACC_COMMAND.set_tokens_filename */
extern void T409f25(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.tokens_filename_attribute_name */
extern unsigned char ge60os8441;
extern T0* ge60ov8441;
extern T0* T284f10(T0* C);
/* GEANT_GEYACC_COMMAND.set_tokens_classname */
extern void T409f24(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.tokens_classname_attribute_name */
extern unsigned char ge60os8440;
extern T0* ge60ov8440;
extern T0* T284f9(T0* C);
/* GEANT_GEYACC_COMMAND.set_new_typing */
extern void T409f23(T0* C, T1 a1);
/* GEANT_GEYACC_TASK.new_typing_attribute_name */
extern unsigned char ge60os8445;
extern T0* ge60ov8445;
extern T0* T284f8(T0* C);
/* GEANT_GEYACC_COMMAND.set_old_typing */
extern void T409f22(T0* C, T1 a1);
/* GEANT_GEYACC_TASK.old_typing_attribute_name */
extern unsigned char ge60os8444;
extern T0* ge60ov8444;
extern T0* T284f7(T0* C);
/* GEANT_GEYACC_COMMAND.set_verbose_filename */
extern void T409f21(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.attribute_value */
extern T0* T284f6(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.project_variables_resolver */
extern T0* T284f17(T0* C);
/* GEANT_GEYACC_TASK.verbose_filename_attribute_name */
extern unsigned char ge60os8439;
extern T0* ge60ov8439;
extern T0* T284f5(T0* C);
/* GEANT_GEYACC_COMMAND.set_separate_actions */
extern void T409f20(T0* C, T1 a1);
/* GEANT_GEYACC_TASK.boolean_value */
extern T1 T284f16(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.std */
extern T0* T284f21(T0* C);
/* GEANT_GEYACC_TASK.false_attribute_value */
extern T0* T284f20(T0* C);
/* GEANT_GEYACC_TASK.true_attribute_value */
extern T0* T284f19(T0* C);
/* GEANT_GEYACC_TASK.string_ */
extern T0* T284f18(T0* C);
/* GEANT_GEYACC_TASK.has_attribute */
extern T1 T284f13(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.separate_actions_attribute_name */
extern unsigned char ge60os8438;
extern T0* ge60ov8438;
extern T0* T284f14(T0* C);
/* GEANT_GEYACC_TASK.make */
extern void T284f34p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEYACC_TASK.make */
extern T0* T284f34p1ac1(T0* a1);
/* GEANT_GEYACC_TASK.make_with_command */
extern void T284f36(T0* C, T0* a1, T0* a2);
/* GEANT_GEYACC_TASK.interpreting_element_make */
extern void T284f39(T0* C, T0* a1, T0* a2);
/* GEANT_GEYACC_TASK.set_project */
extern void T284f41(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.element_make */
extern void T284f40(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.set_xml_element */
extern void T284f42(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.set_command */
extern void T284f38(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.build_command */
extern void T284f35(T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.make */
extern T0* T409c19(T0* a1);
/* GEANT_GEYACC_COMMAND.make */
extern void T409f19p1(T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.set_project */
extern void T409f28(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_gelex_task */
extern T0* T191f18(T0* C, T0* a1);
/* GEANT_GELEX_TASK.make */
extern T0* T282c37(T0* a1, T0* a2);
/* GEANT_GELEX_COMMAND.set_input_filename */
extern void T406f33(T0* C, T0* a1);
/* GEANT_GELEX_TASK.input_filename_attribute_name */
extern unsigned char ge56os8409;
extern T0* ge56ov8409;
extern T0* T282f15(T0* C);
/* GEANT_GELEX_COMMAND.set_output_filename */
extern void T406f32(T0* C, T0* a1);
/* GEANT_GELEX_TASK.output_filename_attribute_name */
extern unsigned char ge56os8408;
extern T0* ge56ov8408;
extern T0* T282f14(T0* C);
/* GEANT_GELEX_COMMAND.set_separate_actions */
extern void T406f31(T0* C, T1 a1);
/* GEANT_GELEX_TASK.separate_actions_attribute_name */
extern unsigned char ge56os8407;
extern T0* ge56ov8407;
extern T0* T282f13(T0* C);
/* GEANT_GELEX_COMMAND.set_no_warn */
extern void T406f30(T0* C, T1 a1);
/* GEANT_GELEX_TASK.no_warn_attribute_name */
extern unsigned char ge56os8406;
extern T0* ge56ov8406;
extern T0* T282f12(T0* C);
/* GEANT_GELEX_COMMAND.set_no_default */
extern void T406f29(T0* C, T1 a1);
/* GEANT_GELEX_TASK.no_default_attribute_name */
extern unsigned char ge56os8405;
extern T0* ge56ov8405;
extern T0* T282f11(T0* C);
/* GEANT_GELEX_COMMAND.set_meta_ecs */
extern void T406f28(T0* C, T1 a1);
/* GEANT_GELEX_TASK.meta_ecs_attribute_name */
extern unsigned char ge56os8404;
extern T0* ge56ov8404;
extern T0* T282f10(T0* C);
/* GEANT_GELEX_COMMAND.set_case_insensitive */
extern void T406f27(T0* C, T1 a1);
/* GEANT_GELEX_TASK.case_insensitive_attribute_name */
extern unsigned char ge56os8403;
extern T0* ge56ov8403;
extern T0* T282f9(T0* C);
/* GEANT_GELEX_COMMAND.set_full */
extern void T406f26(T0* C, T1 a1);
/* GEANT_GELEX_TASK.full_attribute_name */
extern unsigned char ge56os8402;
extern T0* ge56ov8402;
extern T0* T282f8(T0* C);
/* GEANT_GELEX_COMMAND.set_ecs */
extern void T406f25(T0* C, T1 a1);
/* GEANT_GELEX_TASK.ecs_attribute_name */
extern unsigned char ge56os8401;
extern T0* ge56ov8401;
extern T0* T282f7(T0* C);
/* GEANT_GELEX_COMMAND.set_backup */
extern void T406f24(T0* C, T1 a1);
/* GEANT_GELEX_TASK.boolean_value */
extern T1 T282f6(T0* C, T0* a1);
/* GEANT_GELEX_TASK.std */
extern T0* T282f23(T0* C);
/* GEANT_GELEX_TASK.false_attribute_value */
extern T0* T282f22(T0* C);
/* GEANT_GELEX_TASK.true_attribute_value */
extern T0* T282f21(T0* C);
/* GEANT_GELEX_TASK.string_ */
extern T0* T282f20(T0* C);
/* GEANT_GELEX_TASK.backup_attribute_name */
extern unsigned char ge56os8400;
extern T0* ge56ov8400;
extern T0* T282f5(T0* C);
/* GEANT_GELEX_COMMAND.set_size */
extern void T406f23(T0* C, T0* a1);
/* GEANT_GELEX_TASK.attribute_value */
extern T0* T282f17(T0* C, T0* a1);
/* GEANT_GELEX_TASK.project_variables_resolver */
extern T0* T282f24(T0* C);
/* GEANT_GELEX_TASK.has_attribute */
extern T1 T282f16(T0* C, T0* a1);
/* GEANT_GELEX_TASK.size_attribute_name */
extern unsigned char ge56os8399;
extern T0* ge56ov8399;
extern T0* T282f19(T0* C);
/* GEANT_GELEX_TASK.make */
extern void T282f37p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GELEX_TASK.make */
extern T0* T282f37p1ac1(T0* a1);
/* GEANT_GELEX_TASK.make_with_command */
extern void T282f39(T0* C, T0* a1, T0* a2);
/* GEANT_GELEX_TASK.interpreting_element_make */
extern void T282f42(T0* C, T0* a1, T0* a2);
/* GEANT_GELEX_TASK.set_project */
extern void T282f44(T0* C, T0* a1);
/* GEANT_GELEX_TASK.element_make */
extern void T282f43(T0* C, T0* a1);
/* GEANT_GELEX_TASK.set_xml_element */
extern void T282f45(T0* C, T0* a1);
/* GEANT_GELEX_TASK.set_command */
extern void T282f41(T0* C, T0* a1);
/* GEANT_GELEX_TASK.build_command */
extern void T282f38(T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.make */
extern T0* T406c22(T0* a1);
/* GEANT_GELEX_COMMAND.make */
extern void T406f22p1(T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.set_project */
extern void T406f34(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_gexace_task */
extern T0* T191f16(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.make */
extern T0* T280c35(T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force_last */
extern void T81f55(T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.elements_by_name */
extern T0* T280f13(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.string_ */
extern T0* T280f19(T0* C);
/* GEANT_GEXACE_TASK.define_element_name */
extern unsigned char ge59os8373;
extern T0* ge59ov8373;
extern T0* T280f12(T0* C);
/* GEANT_GEXACE_COMMAND.set_output_filename */
extern void T403f30(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.output_filename_attribute_name */
extern unsigned char ge59os8372;
extern T0* ge59ov8372;
extern T0* T280f11(T0* C);
/* GEANT_GEXACE_COMMAND.set_xace_filename */
extern void T403f29(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.xace_filename_attribute_name */
extern unsigned char ge59os8371;
extern T0* ge59ov8371;
extern T0* T280f10(T0* C);
/* GEANT_GEXACE_COMMAND.set_format */
extern void T403f28(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.format_attribute_name */
extern unsigned char ge59os8370;
extern T0* ge59ov8370;
extern T0* T280f9(T0* C);
/* GEANT_GEXACE_COMMAND.set_library_command */
extern void T403f27(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.library_attribute_name */
extern unsigned char ge59os8369;
extern T0* ge59ov8369;
extern T0* T280f8(T0* C);
/* GEANT_GEXACE_COMMAND.set_system_command */
extern void T403f26(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.attribute_value */
extern T0* T280f7(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.project_variables_resolver */
extern T0* T280f18(T0* C);
/* GEANT_GEXACE_TASK.system_attribute_name */
extern unsigned char ge59os8368;
extern T0* ge59ov8368;
extern T0* T280f6(T0* C);
/* GEANT_GEXACE_COMMAND.set_validate_command */
extern void T403f25(T0* C, T1 a1);
/* GEANT_GEXACE_TASK.validate_attribute_name */
extern unsigned char ge59os8367;
extern T0* ge59ov8367;
extern T0* T280f5(T0* C);
/* GEANT_GEXACE_COMMAND.set_verbose */
extern void T403f24(T0* C, T1 a1);
/* GEANT_GEXACE_TASK.boolean_value */
extern T1 T280f17(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.std */
extern T0* T280f22(T0* C);
/* GEANT_GEXACE_TASK.false_attribute_value */
extern T0* T280f21(T0* C);
/* GEANT_GEXACE_TASK.true_attribute_value */
extern T0* T280f20(T0* C);
/* GEANT_GEXACE_TASK.has_attribute */
extern T1 T280f14(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.verbose_attribute_name */
extern unsigned char ge59os8366;
extern T0* ge59ov8366;
extern T0* T280f15(T0* C);
/* GEANT_GEXACE_TASK.make */
extern void T280f35p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEXACE_TASK.make */
extern T0* T280f35p1ac1(T0* a1);
/* GEANT_GEXACE_TASK.make_with_command */
extern void T280f37(T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.interpreting_element_make */
extern void T280f40(T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.set_project */
extern void T280f42(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.element_make */
extern void T280f41(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.set_xml_element */
extern void T280f43(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.set_command */
extern void T280f39(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.build_command */
extern void T280f36(T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.make */
extern T0* T403c23(T0* a1);
/* GEANT_GEXACE_COMMAND.make */
extern void T403f23p1(T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.set_project */
extern void T403f31(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_unset_task */
extern T0* T191f14(T0* C, T0* a1);
/* GEANT_UNSET_TASK.make */
extern T0* T278c23(T0* a1, T0* a2);
/* GEANT_UNSET_COMMAND.set_name */
extern void T399f8(T0* C, T0* a1);
/* GEANT_UNSET_TASK.attribute_value */
extern T0* T278f6(T0* C, T0* a1);
/* GEANT_UNSET_TASK.project_variables_resolver */
extern T0* T278f9(T0* C);
/* GEANT_UNSET_TASK.has_attribute */
extern T1 T278f5(T0* C, T0* a1);
/* GEANT_UNSET_TASK.name_attribute_name */
extern unsigned char ge72os8358;
extern T0* ge72ov8358;
extern T0* T278f8(T0* C);
/* GEANT_UNSET_TASK.make */
extern void T278f23p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_UNSET_TASK.make */
extern T0* T278f23p1ac1(T0* a1);
/* GEANT_UNSET_TASK.make_with_command */
extern void T278f25(T0* C, T0* a1, T0* a2);
/* GEANT_UNSET_TASK.interpreting_element_make */
extern void T278f28(T0* C, T0* a1, T0* a2);
/* GEANT_UNSET_TASK.set_project */
extern void T278f30(T0* C, T0* a1);
/* GEANT_UNSET_TASK.element_make */
extern void T278f29(T0* C, T0* a1);
/* GEANT_UNSET_TASK.set_xml_element */
extern void T278f31(T0* C, T0* a1);
/* GEANT_UNSET_TASK.set_command */
extern void T278f27(T0* C, T0* a1);
/* GEANT_UNSET_TASK.build_command */
extern void T278f24(T0* C, T0* a1);
/* GEANT_UNSET_COMMAND.make */
extern T0* T399c7(T0* a1);
/* GEANT_UNSET_COMMAND.set_project */
extern void T399f9(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_set_task */
extern T0* T191f12(T0* C, T0* a1);
/* GEANT_SET_TASK.make */
extern T0* T276c24(T0* a1, T0* a2);
/* GEANT_SET_COMMAND.set_value */
extern void T396f15(T0* C, T0* a1);
/* GEANT_SET_TASK.value_attribute_name */
extern unsigned char ge70os8348;
extern T0* ge70ov8348;
extern T0* T276f5(T0* C);
/* GEANT_SET_COMMAND.set_name */
extern void T396f14(T0* C, T0* a1);
/* GEANT_SET_TASK.attribute_value */
extern T0* T276f7(T0* C, T0* a1);
/* GEANT_SET_TASK.project_variables_resolver */
extern T0* T276f10(T0* C);
/* GEANT_SET_TASK.has_attribute */
extern T1 T276f6(T0* C, T0* a1);
/* GEANT_SET_TASK.name_attribute_name */
extern unsigned char ge70os8347;
extern T0* ge70ov8347;
extern T0* T276f9(T0* C);
/* GEANT_SET_TASK.make */
extern void T276f24p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_SET_TASK.make */
extern T0* T276f24p1ac1(T0* a1);
/* GEANT_SET_TASK.make_with_command */
extern void T276f26(T0* C, T0* a1, T0* a2);
/* GEANT_SET_TASK.interpreting_element_make */
extern void T276f29(T0* C, T0* a1, T0* a2);
/* GEANT_SET_TASK.set_project */
extern void T276f31(T0* C, T0* a1);
/* GEANT_SET_TASK.element_make */
extern void T276f30(T0* C, T0* a1);
/* GEANT_SET_TASK.set_xml_element */
extern void T276f32(T0* C, T0* a1);
/* GEANT_SET_TASK.set_command */
extern void T276f28(T0* C, T0* a1);
/* GEANT_SET_TASK.build_command */
extern void T276f25(T0* C, T0* a1);
/* GEANT_SET_COMMAND.make */
extern T0* T396c13(T0* a1);
/* GEANT_SET_COMMAND.set_project */
extern void T396f16(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_lcc_task */
extern T0* T191f10(T0* C, T0* a1);
/* GEANT_LCC_TASK.make */
extern T0* T274c24(T0* a1, T0* a2);
/* GEANT_LCC_COMMAND.set_source_filename */
extern void T393f15(T0* C, T0* a1);
/* GEANT_LCC_TASK.source_filename_attribute_name */
extern unsigned char ge63os8337;
extern T0* ge63ov8337;
extern T0* T274f5(T0* C);
/* GEANT_LCC_COMMAND.set_executable */
extern void T393f14(T0* C, T0* a1);
/* GEANT_LCC_TASK.attribute_value */
extern T0* T274f7(T0* C, T0* a1);
/* GEANT_LCC_TASK.project_variables_resolver */
extern T0* T274f10(T0* C);
/* GEANT_LCC_TASK.has_attribute */
extern T1 T274f6(T0* C, T0* a1);
/* GEANT_LCC_TASK.executable_attribute_name */
extern unsigned char ge63os8336;
extern T0* ge63ov8336;
extern T0* T274f9(T0* C);
/* GEANT_LCC_TASK.make */
extern void T274f24p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_LCC_TASK.make */
extern T0* T274f24p1ac1(T0* a1);
/* GEANT_LCC_TASK.make_with_command */
extern void T274f26(T0* C, T0* a1, T0* a2);
/* GEANT_LCC_TASK.interpreting_element_make */
extern void T274f29(T0* C, T0* a1, T0* a2);
/* GEANT_LCC_TASK.set_project */
extern void T274f31(T0* C, T0* a1);
/* GEANT_LCC_TASK.element_make */
extern void T274f30(T0* C, T0* a1);
/* GEANT_LCC_TASK.set_xml_element */
extern void T274f32(T0* C, T0* a1);
/* GEANT_LCC_TASK.set_command */
extern void T274f28(T0* C, T0* a1);
/* GEANT_LCC_TASK.build_command */
extern void T274f25(T0* C, T0* a1);
/* GEANT_LCC_COMMAND.make */
extern T0* T393c13(T0* a1);
/* GEANT_LCC_COMMAND.set_project */
extern void T393f16(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_exec_task */
extern T0* T191f8(T0* C, T0* a1);
/* GEANT_EXEC_TASK.make_from_interpreting_element */
extern T0* T272c22(T0* a1);
/* Creation of agent #1 in feature GEANT_EXEC_TASK.make_from_interpreting_element */
extern T0* T272f22ac1(T0* a1, T0* a2);
/* Creation of agent #2 in feature GEANT_EXEC_TASK.make_from_interpreting_element */
extern T0* T272f22ac2(T0* a1, T0* a2);
/* Creation of agent #3 in feature GEANT_EXEC_TASK.make_from_interpreting_element */
extern T0* T272f22ac3(T0* a1, T0* a2);
/* GEANT_EXEC_COMMAND.set_fileset */
extern void T385f14(T0* C, T0* a1);
/* GEANT_EXEC_TASK.fileset_element_name */
extern unsigned char ge52os8323;
extern T0* ge52ov8323;
extern T0* T272f5(T0* C);
/* GEANT_EXEC_TASK.make_from_interpreting_element */
extern void T272f22p1(T0* C, T0* a1);
/* GEANT_EXEC_TASK.make */
extern void T272f23(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_EXEC_TASK.make */
extern T0* T272f23ac1(T0* a1);
/* GEANT_EXEC_TASK.make_with_command */
extern void T272f25(T0* C, T0* a1, T0* a2);
/* GEANT_EXEC_TASK.interpreting_element_make */
extern void T272f28(T0* C, T0* a1, T0* a2);
/* GEANT_EXEC_TASK.set_project */
extern void T272f30(T0* C, T0* a1);
/* GEANT_EXEC_TASK.element_make */
extern void T272f29(T0* C, T0* a1);
/* GEANT_EXEC_TASK.set_xml_element */
extern void T272f31(T0* C, T0* a1);
/* GEANT_EXEC_TASK.set_command */
extern void T272f27(T0* C, T0* a1);
/* GEANT_EXEC_TASK.build_command */
extern void T272f24(T0* C, T0* a1);
/* GEANT_EXEC_COMMAND.make */
extern T0* T385c13(T0* a1);
/* GEANT_EXEC_COMMAND.make */
extern void T385f13p1(T0* C, T0* a1);
/* GEANT_EXEC_COMMAND.set_project */
extern void T385f15(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_ise_task */
extern T0* T191f6(T0* C, T0* a1);
/* GEANT_ISE_TASK.make */
extern T0* T270c34(T0* a1, T0* a2);
/* GEANT_ISE_COMMAND.set_exit_code_variable_name */
extern void T381f27(T0* C, T0* a1);
/* GEANT_ISE_TASK.attribute_value */
extern T0* T270f12(T0* C, T0* a1);
/* GEANT_ISE_TASK.project_variables_resolver */
extern T0* T270f21(T0* C);
/* GEANT_ISE_TASK.exit_code_variable_attribute_name */
extern unsigned char ge62os8299;
extern T0* ge62ov8299;
extern T0* T270f11(T0* C);
/* GEANT_ISE_COMMAND.set_finish_freezing */
extern void T381f26(T0* C, T1 a1);
/* GEANT_ISE_TASK.finish_freezing_attribute_name */
extern unsigned char ge62os8297;
extern T0* ge62ov8297;
extern T0* T270f10(T0* C);
/* GEANT_ISE_COMMAND.set_finalize_mode */
extern void T381f25(T0* C, T1 a1);
/* GEANT_ISE_TASK.finalize_attribute_name */
extern unsigned char ge62os8296;
extern T0* ge62ov8296;
extern T0* T270f9(T0* C);
/* GEANT_ISE_COMMAND.set_compatible_mode */
extern void T381f24(T0* C, T1 a1);
/* GEANT_ISE_TASK.boolean_value */
extern T1 T270f8(T0* C, T0* a1);
/* GEANT_ISE_TASK.std */
extern T0* T270f20(T0* C);
/* GEANT_ISE_TASK.false_attribute_value */
extern T0* T270f19(T0* C);
/* GEANT_ISE_TASK.true_attribute_value */
extern T0* T270f18(T0* C);
/* GEANT_ISE_TASK.string_ */
extern T0* T270f17(T0* C);
/* GEANT_ISE_TASK.compatible_attribute_name */
extern unsigned char ge62os8295;
extern T0* ge62ov8295;
extern T0* T270f7(T0* C);
/* GEANT_ISE_COMMAND.set_clean */
extern void T381f23(T0* C, T0* a1);
/* GEANT_ISE_TASK.clean_attribute_name */
extern unsigned char ge62os8298;
extern T0* ge62ov8298;
extern T0* T270f6(T0* C);
/* GEANT_ISE_COMMAND.set_system_name */
extern void T381f22(T0* C, T0* a1);
/* GEANT_ISE_TASK.system_attribute_name */
extern unsigned char ge62os8294;
extern T0* ge62ov8294;
extern T0* T270f5(T0* C);
/* GEANT_ISE_COMMAND.set_ace_filename */
extern void T381f21(T0* C, T0* a1);
/* GEANT_ISE_TASK.attribute_value_or_default */
extern T0* T270f14(T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.has_attribute */
extern T1 T270f13(T0* C, T0* a1);
/* GEANT_ISE_TASK.ace_attribute_name */
extern unsigned char ge62os8293;
extern T0* ge62ov8293;
extern T0* T270f16(T0* C);
/* GEANT_ISE_TASK.make */
extern void T270f34p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_ISE_TASK.make */
extern T0* T270f34p1ac1(T0* a1);
/* GEANT_ISE_TASK.make_with_command */
extern void T270f36(T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.interpreting_element_make */
extern void T270f39(T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.set_project */
extern void T270f41(T0* C, T0* a1);
/* GEANT_ISE_TASK.element_make */
extern void T270f40(T0* C, T0* a1);
/* GEANT_ISE_TASK.set_xml_element */
extern void T270f42(T0* C, T0* a1);
/* GEANT_ISE_TASK.set_command */
extern void T270f38(T0* C, T0* a1);
/* GEANT_ISE_TASK.build_command */
extern void T270f35(T0* C, T0* a1);
/* GEANT_ISE_COMMAND.make */
extern T0* T381c20(T0* a1);
/* GEANT_ISE_COMMAND.set_project */
extern void T381f28(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_gec_task */
extern T0* T191f4(T0* C, T0* a1);
/* GEANT_GEC_TASK.make */
extern T0* T263c37(T0* a1, T0* a2);
/* GEANT_GEC_COMMAND.set_exit_code_variable_name */
extern void T377f35(T0* C, T0* a1);
/* GEANT_GEC_TASK.exit_code_variable_attribute_name */
extern unsigned char ge55os8247;
extern T0* ge55ov8247;
extern T0* T263f15(T0* C);
/* GEANT_GEC_COMMAND.set_garbage_collector */
extern void T377f34(T0* C, T0* a1);
/* GEANT_GEC_TASK.gc_attribute_name */
extern unsigned char ge55os8249;
extern T0* ge55ov8249;
extern T0* T263f14(T0* C);
/* GEANT_GEC_COMMAND.set_split_size */
extern void T377f33(T0* C, T6 a1);
/* GEANT_GEC_TASK.split_size_attribute_name */
extern unsigned char ge55os8252;
extern T0* ge55ov8252;
extern T0* T263f13(T0* C);
/* GEANT_GEC_COMMAND.set_split_mode */
extern void T377f32(T0* C, T1 a1);
/* GEANT_GEC_TASK.split_attribute_name */
extern unsigned char ge55os8251;
extern T0* ge55ov8251;
extern T0* T263f12(T0* C);
/* GEANT_GEC_COMMAND.set_catcall_mode */
extern void T377f31(T0* C, T0* a1);
/* GEANT_GEC_TASK.attribute_value */
extern T0* T263f11(T0* C, T0* a1);
/* GEANT_GEC_TASK.project_variables_resolver */
extern T0* T263f24(T0* C);
/* GEANT_GEC_TASK.catcall_attribute_name */
extern unsigned char ge55os8245;
extern T0* ge55ov8245;
extern T0* T263f10(T0* C);
/* GEANT_GEC_COMMAND.set_gelint */
extern void T377f30(T0* C, T1 a1);
/* GEANT_GEC_TASK.gelint_attribute_name */
extern unsigned char ge55os8250;
extern T0* ge55ov8250;
extern T0* T263f9(T0* C);
/* GEANT_GEC_COMMAND.set_finalize */
extern void T377f29(T0* C, T1 a1);
/* GEANT_GEC_TASK.finalize_attribute_name */
extern unsigned char ge55os8248;
extern T0* ge55ov8248;
extern T0* T263f8(T0* C);
/* GEANT_GEC_COMMAND.set_c_compile */
extern void T377f28(T0* C, T1 a1);
/* GEANT_GEC_TASK.boolean_value */
extern T1 T263f7(T0* C, T0* a1);
/* GEANT_GEC_TASK.std */
extern T0* T263f23(T0* C);
/* GEANT_GEC_TASK.false_attribute_value */
extern T0* T263f22(T0* C);
/* GEANT_GEC_TASK.true_attribute_value */
extern T0* T263f21(T0* C);
/* GEANT_GEC_TASK.string_ */
extern T0* T263f20(T0* C);
/* GEANT_GEC_TASK.c_compile_attribute_name */
extern unsigned char ge55os8244;
extern T0* ge55ov8244;
extern T0* T263f6(T0* C);
/* GEANT_GEC_COMMAND.set_clean */
extern void T377f27(T0* C, T0* a1);
/* GEANT_GEC_TASK.clean_attribute_name */
extern unsigned char ge55os8246;
extern T0* ge55ov8246;
extern T0* T263f5(T0* C);
/* GEANT_GEC_COMMAND.set_ace_filename */
extern void T377f26(T0* C, T0* a1);
/* GEANT_GEC_TASK.attribute_value_or_default */
extern T0* T263f17(T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.has_attribute */
extern T1 T263f16(T0* C, T0* a1);
/* GEANT_GEC_TASK.ace_attribute_name */
extern unsigned char ge55os8243;
extern T0* ge55ov8243;
extern T0* T263f19(T0* C);
/* GEANT_GEC_TASK.make */
extern void T263f37p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEC_TASK.make */
extern T0* T263f37p1ac1(T0* a1);
/* GEANT_GEC_TASK.make_with_command */
extern void T263f39(T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.interpreting_element_make */
extern void T263f42(T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.set_project */
extern void T263f44(T0* C, T0* a1);
/* GEANT_GEC_TASK.element_make */
extern void T263f43(T0* C, T0* a1);
/* GEANT_GEC_TASK.set_xml_element */
extern void T263f45(T0* C, T0* a1);
/* GEANT_GEC_TASK.set_command */
extern void T263f41(T0* C, T0* a1);
/* GEANT_GEC_TASK.build_command */
extern void T263f38(T0* C, T0* a1);
/* GEANT_GEC_COMMAND.make */
extern T0* T377c25(T0* a1);
/* GEANT_GEC_COMMAND.make */
extern void T377f25p1(T0* C, T0* a1);
/* GEANT_GEC_COMMAND.set_project */
extern void T377f36(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.replace_task_name */
extern unsigned char ge79os2418;
extern T0* ge79ov2418;
extern T0* T191f53(T0* C);
/* GEANT_TASK_FACTORY.input_task_name */
extern unsigned char ge79os2417;
extern T0* ge79ov2417;
extern T0* T191f51(T0* C);
/* GEANT_TASK_FACTORY.available_task_name */
extern unsigned char ge79os2416;
extern T0* ge79ov2416;
extern T0* T191f49(T0* C);
/* GEANT_TASK_FACTORY.precursor_task_name */
extern unsigned char ge79os2415;
extern T0* ge79ov2415;
extern T0* T191f47(T0* C);
/* GEANT_TASK_FACTORY.exit_task_name */
extern unsigned char ge79os2414;
extern T0* ge79ov2414;
extern T0* T191f45(T0* C);
/* GEANT_TASK_FACTORY.outofdate_task_name */
extern unsigned char ge79os2413;
extern T0* ge79ov2413;
extern T0* T191f43(T0* C);
/* GEANT_TASK_FACTORY.xslt_task_name */
extern unsigned char ge79os2412;
extern T0* ge79ov2412;
extern T0* T191f41(T0* C);
/* GEANT_TASK_FACTORY.setenv_task_name */
extern unsigned char ge79os2411;
extern T0* ge79ov2411;
extern T0* T191f39(T0* C);
/* GEANT_TASK_FACTORY.move_task_name */
extern unsigned char ge79os2410;
extern T0* ge79ov2410;
extern T0* T191f37(T0* C);
/* GEANT_TASK_FACTORY.copy_task_name */
extern unsigned char ge79os2409;
extern T0* ge79ov2409;
extern T0* T191f35(T0* C);
/* GEANT_TASK_FACTORY.delete_task_name */
extern unsigned char ge79os2408;
extern T0* ge79ov2408;
extern T0* T191f33(T0* C);
/* GEANT_TASK_FACTORY.mkdir_task_name */
extern unsigned char ge79os2407;
extern T0* ge79ov2407;
extern T0* T191f31(T0* C);
/* GEANT_TASK_FACTORY.echo_task_name */
extern unsigned char ge79os2406;
extern T0* ge79ov2406;
extern T0* T191f29(T0* C);
/* GEANT_TASK_FACTORY.geant_task_name */
extern unsigned char ge79os2405;
extern T0* ge79ov2405;
extern T0* T191f27(T0* C);
/* GEANT_TASK_FACTORY.getest_task_name */
extern unsigned char ge79os2404;
extern T0* ge79ov2404;
extern T0* T191f25(T0* C);
/* GEANT_TASK_FACTORY.gepp_task_name */
extern unsigned char ge79os2403;
extern T0* ge79ov2403;
extern T0* T191f23(T0* C);
/* GEANT_TASK_FACTORY.geyacc_task_name */
extern unsigned char ge79os2402;
extern T0* ge79ov2402;
extern T0* T191f21(T0* C);
/* GEANT_TASK_FACTORY.gelex_task_name */
extern unsigned char ge79os2401;
extern T0* ge79ov2401;
extern T0* T191f19(T0* C);
/* GEANT_TASK_FACTORY.gexace_task_name */
extern unsigned char ge79os2400;
extern T0* ge79ov2400;
extern T0* T191f17(T0* C);
/* GEANT_TASK_FACTORY.unset_task_name */
extern unsigned char ge79os2399;
extern T0* ge79ov2399;
extern T0* T191f15(T0* C);
/* GEANT_TASK_FACTORY.set_task_name */
extern unsigned char ge79os2398;
extern T0* ge79ov2398;
extern T0* T191f13(T0* C);
/* GEANT_TASK_FACTORY.lcc_task_name */
extern unsigned char ge79os2397;
extern T0* ge79ov2397;
extern T0* T191f11(T0* C);
/* GEANT_TASK_FACTORY.exec_task_name */
extern unsigned char ge79os2396;
extern T0* ge79ov2396;
extern T0* T191f9(T0* C);
/* GEANT_TASK_FACTORY.ise_task_name */
extern unsigned char ge79os2395;
extern T0* ge79ov2395;
extern T0* T191f7(T0* C);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].force_new */
extern void T262f38(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].key_storage_put */
extern void T262f45(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].item_storage_put */
extern void T262f44(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].slots_put */
extern void T262f43(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].clashes_put */
extern void T262f42(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].resize */
extern void T262f41(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].clashes_resize */
extern void T262f50(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].special_integer_ */
extern T0* T262f25(T0* C);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].key_storage_resize */
extern void T262f49(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].item_storage_resize */
extern void T262f48(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].resize */
extern T0* T376f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].aliased_resized_area */
extern T0* T374f3(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].slots_resize */
extern void T262f47(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].new_modulus */
extern T6 T262f26(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].new_capacity */
extern T6 T262f23(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].unset_found_item */
extern void T262f40(T0* C);
/* GEANT_TASK_FACTORY.gec_task_name */
extern unsigned char ge79os2394;
extern T0* ge79ov2394;
extern T0* T191f5(T0* C);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].set_key_equality_tester */
extern void T262f37(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].internal_set_equality_tester */
extern void T372f6(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.string_equality_tester */
extern T0* T191f3(T0* C);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_map */
extern T0* T262c36(T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_with_equality_testers */
extern void T262f39(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make */
extern T0* T372c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].set_internal_cursor */
extern void T372f7(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].new_cursor */
extern T0* T372f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make */
extern T0* T496c3(T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].new_cursor */
extern T0* T262f24(T0* C);
/* DS_HASH_TABLE_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make */
extern T0* T375c3(T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_sparse_container */
extern void T262f46(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].set_internal_cursor */
extern void T262f55(T0* C, T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_slots */
extern void T262f54(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_clashes */
extern void T262f53(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_key_storage */
extern void T262f52(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_item_storage */
extern void T262f51(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].make */
extern T0* T376f2(T0* C, T6 a1);
/* ARRAY [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].make_empty */
extern T0* T497c4(void);
/* ARRAY [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].make_area */
extern void T497f5(T0* C, T6 a1);
/* SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].make */
extern T0* T374c5(T6 a1);
/* KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].default_create */
extern T0* T376c3(void);
/* GEANT_PROJECT.set_options */
extern void T22f45(T0* C, T0* a1);
/* GEANT_PROJECT.set_variables */
extern void T22f44(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.element_make */
extern void T30f21(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.set_xml_element */
extern void T30f24(T0* C, T0* a1);
/* XM_TREE_CALLBACKS_PIPE.document */
extern T0* T94f8(T0* C);
/* XM_EIFFEL_PARSER.is_correct */
extern T1 T93f121(T0* C);
/* XM_EIFFEL_PARSER.parse_from_stream */
extern void T93f205(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.parse_with_events */
extern void T93f209(T0* C);
/* XM_EIFFEL_PARSER.on_finish */
extern void T93f215(T0* C);
/* XM_EIFFEL_PARSER.parse */
extern void T93f214(T0* C);
/* XM_EIFFEL_PARSER.yy_pop_last_value */
extern void T93f224(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.yy_push_error_value */
extern void T93f223(T0* C);
/* XM_EIFFEL_PARSER.yy_do_action */
extern void T93f222(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.on_notation_declaration */
extern void T93f252(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_notation_declaration */
extern void T173f8(T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.set_public */
extern void T145f6(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].resize */
extern T0* T157f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_EXTERNAL_ID].aliased_resized_area */
extern T0* T156f4(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].make */
extern T0* T157f1(T0* C, T6 a1);
/* ARRAY [XM_DTD_EXTERNAL_ID].make_empty */
extern T0* T243c4(void);
/* ARRAY [XM_DTD_EXTERNAL_ID].make_area */
extern void T243f5(T0* C, T6 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].make */
extern T0* T156c6(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].default_create */
extern T0* T157c3(void);
/* XM_DTD_EXTERNAL_ID.set_system */
extern void T145f5(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_dtd_external_id */
extern T0* T93f170(T0* C);
/* XM_DTD_EXTERNAL_ID.make */
extern T0* T145c4(void);
/* XM_EIFFEL_PARSER.when_pe_entity_declared */
extern void T93f251(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].force_new */
extern void T138f40(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_put */
extern void T138f54(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_put */
extern void T138f53(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_put */
extern void T138f52(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_put */
extern void T138f51(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_item */
extern T6 T138f28(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].hash_position */
extern T6 T138f27(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_item */
extern T6 T138f26(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].resize */
extern void T138f50(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_resize */
extern void T138f59(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].special_integer_ */
extern T0* T138f32(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_resize */
extern void T138f58(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_resize */
extern void T138f57(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].resize */
extern T0* T231f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].aliased_resized_area */
extern T0* T226f4(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_item */
extern T0* T138f22(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_resize */
extern void T138f56(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_modulus */
extern T6 T138f29(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_capacity */
extern T6 T138f23(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].unset_found_item */
extern void T138f45(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].has */
extern T1 T138f33(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].search_position */
extern void T138f42(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_def */
extern T0* T176c208(T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_literal */
extern void T176f210(T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.default_create */
extern T0* T140c4(void);
/* XM_EIFFEL_PE_ENTITY_DEF.make_scanner */
extern void T176f211(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T176f213(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset_sent */
extern void T176f216(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T176f213p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T176f213p0(T0* C);
/* DS_LINKED_STACK [INTEGER_32].make */
extern T0* T222c5(void);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T176f213p2(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.make_with_buffer */
extern void T176f212(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_load_input_buffer */
extern void T176f215(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_content */
extern void T176f218(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.special_integer_ */
extern T0* T176f70(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_initialize */
extern void T176f214(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_build_tables */
extern void T176f217(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template */
extern unsigned char ge1543os6605;
extern T0* ge1543ov6605;
extern T0* T176f50(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_fixed_array */
extern T0* T176f54(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_meta_template */
extern unsigned char ge1543os6604;
extern T0* ge1543ov6604;
extern T0* T176f91(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_ec_template */
extern unsigned char ge1543os6603;
extern T0* ge1543ov6603;
extern T0* T176f69(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template */
extern unsigned char ge1543os6602;
extern T0* ge1543ov6602;
extern T0* T176f59(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template */
extern unsigned char ge1543os6601;
extern T0* ge1543ov6601;
extern T0* T176f52(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template */
extern unsigned char ge1543os6594;
extern T0* ge1543ov6594;
extern T0* T176f49(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_6 */
extern void T176f230(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_array_subcopy */
extern void T176f231(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* KL_ARRAY_ROUTINES [INTEGER_32].subcopy */
extern void T259f2(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* ARRAY [INTEGER_32].subcopy */
extern void T108f13(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER_32].copy_data */
extern void T63f11(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER_32].move_data */
extern void T63f12(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].overlapping_move */
extern void T63f14(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].non_overlapping_move */
extern void T63f13(T0* C, T6 a1, T6 a2, T6 a3);
/* XM_EIFFEL_PE_ENTITY_DEF.integer_array_ */
extern unsigned char ge122os2839;
extern T0* ge122ov2839;
extern T0* T176f55(T0* C);
/* KL_ARRAY_ROUTINES [INTEGER_32].default_create */
extern T0* T259c1(void);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_5 */
extern void T176f229(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_4 */
extern void T176f228(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_3 */
extern void T176f227(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_2 */
extern void T176f226(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_1 */
extern void T176f225(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template */
extern unsigned char ge1543os6587;
extern T0* ge1543ov6587;
extern T0* T176f65(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_6 */
extern void T176f224(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_5 */
extern void T176f223(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_4 */
extern void T176f222(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_3 */
extern void T176f221(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_2 */
extern void T176f220(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_1 */
extern void T176f219(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.empty_buffer */
extern T0* T176f58(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.make */
extern T0* T217c8(void);
/* XM_EIFFEL_PE_ENTITY_DEF.make_external */
extern void T176f209(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.is_external */
extern T1 T171f51(T0* C);
/* XM_EIFFEL_PARSER.new_external_entity */
extern T0* T93f169(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.make_external */
extern T0* T171c207(T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_scanner */
extern void T171f208(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T171f210(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T171f210p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T171f210p0(T0* C);
/* XM_EIFFEL_ENTITY_DEF.make_with_buffer */
extern void T171f209(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_load_input_buffer */
extern void T171f212(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_content */
extern void T171f214(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.special_integer_ */
extern T0* T171f57(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_initialize */
extern void T171f211(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_build_tables */
extern void T171f213(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template */
extern T0* T171f48(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_fixed_array */
extern T0* T171f53(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_meta_template */
extern T0* T171f88(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_ec_template */
extern T0* T171f67(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template */
extern T0* T171f58(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template */
extern T0* T171f50(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template */
extern T0* T171f47(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_6 */
extern void T171f226(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_array_subcopy */
extern void T171f227(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_ENTITY_DEF.integer_array_ */
extern T0* T171f54(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_5 */
extern void T171f225(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_4 */
extern void T171f224(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_3 */
extern void T171f223(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_2 */
extern void T171f222(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_1 */
extern void T171f221(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template */
extern T0* T171f64(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_6 */
extern void T171f220(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_5 */
extern void T171f219(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_4 */
extern void T171f218(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_3 */
extern void T171f217(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_2 */
extern void T171f216(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_1 */
extern void T171f215(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.empty_buffer */
extern T0* T171f49(T0* C);
/* XM_EIFFEL_PARSER.on_entity_declaration */
extern void T93f250(T0* C, T0* a1, T1 a2, T0* a3, T0* a4, T0* a5);
/* XM_DTD_CALLBACKS_NULL.on_entity_declaration */
extern void T173f7(T0* C, T0* a1, T1 a2, T0* a3, T0* a4, T0* a5);
/* XM_EIFFEL_PARSER.when_entity_declared */
extern void T93f249(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.new_literal_entity */
extern T0* T93f168(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_literal */
extern T0* T171c206(T0* a1, T0* a2);
/* XM_DTD_ATTRIBUTE_CONTENT.set_default_value */
extern void T149f26(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_fixed */
extern void T149f25(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_implied */
extern void T149f24(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_required */
extern void T149f23(T0* C);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].resize */
extern T0* T170f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].aliased_resized_area */
extern T0* T169f4(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].make */
extern T0* T170f1(T0* C, T6 a1);
/* ARRAY [DS_BILINKED_LIST [STRING_8]].make_empty */
extern T0* T249c4(void);
/* ARRAY [DS_BILINKED_LIST [STRING_8]].make_area */
extern void T249f5(T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].make */
extern T0* T169c6(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].default_create */
extern T0* T170c3(void);
/* DS_BILINKED_LIST [STRING_8].force_last */
extern void T150f12(T0* C, T0* a1);
/* DS_BILINKABLE [STRING_8].put_right */
extern void T240f5(T0* C, T0* a1);
/* DS_BILINKABLE [STRING_8].attach_left */
extern void T240f6(T0* C, T0* a1);
/* DS_BILINKABLE [STRING_8].make */
extern T0* T240c4(T0* a1);
/* DS_BILINKED_LIST [STRING_8].is_empty */
extern T1 T150f6(T0* C);
/* XM_EIFFEL_PARSER.new_string_bilinked_list */
extern T0* T93f164(T0* C);
/* DS_BILINKED_LIST [STRING_8].set_equality_tester */
extern void T150f13(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.string_equality_tester */
extern T0* T93f182(T0* C);
/* DS_BILINKED_LIST [STRING_8].make */
extern T0* T150c11(void);
/* DS_BILINKED_LIST [STRING_8].set_internal_cursor */
extern void T150f14(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].new_cursor */
extern T0* T150f7(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].make */
extern T0* T239c7(T0* a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].force */
extern void T170f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].fill_with */
extern void T169f8(T0* C, T0* a1, T6 a2, T6 a3);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration_list */
extern void T149f22(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration */
extern void T149f27(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.default_enumeration_list */
extern unsigned char ge1454os7415;
extern T0* ge1454ov7415;
extern T0* T149f7(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_notation */
extern void T149f21(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_token */
extern void T149f20(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_entity */
extern void T149f19(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_list_type */
extern void T149f18(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id_ref */
extern void T149f17(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id */
extern void T149f16(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_data */
extern void T149f15(T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content */
extern T0* T93f161(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.make */
extern T0* T149c12(void);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].resize */
extern T0* T168f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].aliased_resized_area */
extern T0* T166f4(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T168f1(T0* C, T6 a1);
/* ARRAY [XM_DTD_ATTRIBUTE_CONTENT].make_empty */
extern T0* T248c4(void);
/* ARRAY [XM_DTD_ATTRIBUTE_CONTENT].make_area */
extern void T248f5(T0* C, T6 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T166c6(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].default_create */
extern T0* T168c3(void);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].force */
extern void T168f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].fill_with */
extern void T166f8(T0* C, T0* a1, T6 a2, T6 a3);
/* XM_DTD_ATTRIBUTE_CONTENT.copy_default */
extern void T149f14(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_implied */
extern T1 T149f11(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_required */
extern T1 T149f10(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.has_default_value */
extern T1 T149f9(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_fixed */
extern T1 T149f8(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_name */
extern void T149f13(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].force */
extern void T167f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].fill_with */
extern void T164f8(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].resize */
extern T0* T167f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].aliased_resized_area */
extern T0* T164f4(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T167f1(T0* C, T6 a1);
/* ARRAY [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make_empty */
extern T0* T247c4(void);
/* ARRAY [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make_area */
extern void T247f5(T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T164c6(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].default_create */
extern T0* T167c3(void);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].force_last */
extern void T148f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].put_right */
extern void T237f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].attach_left */
extern void T237f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T237c4(T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].is_empty */
extern T1 T148f6(T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content_list */
extern T0* T93f154(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T148c8(void);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].set_internal_cursor */
extern void T148f10(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].new_cursor */
extern T0* T148f5(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T236c7(T0* a1);
/* XM_EIFFEL_PARSER.on_attribute_declarations */
extern void T93f248(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].forth */
extern void T236f9(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_forth */
extern void T148f12(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].add_traversing_cursor */
extern void T148f13(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set_next_cursor */
extern void T236f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].remove_traversing_cursor */
extern void T148f14(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set */
extern void T236f10(T0* C, T0* a1, T1 a2, T1 a3);
/* XM_EIFFEL_PARSER.on_attribute_declaration */
extern void T93f258(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_DTD_CALLBACKS_NULL.on_attribute_declaration */
extern void T173f9(T0* C, T0* a1, T0* a2, T0* a3);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].item */
extern T0* T236f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].start */
extern void T236f8(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_start */
extern void T148f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_off */
extern T1 T148f7(T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_more */
extern void T147f11(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_mixed */
extern T0* T147c10(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_mixed */
extern void T147f21(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_choice */
extern void T147f19(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_list */
extern void T147f16(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_default */
extern void T147f22(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one */
extern void T147f12(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_sequence */
extern void T147f20(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T235c7(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].set_internal_cursor */
extern void T235f10(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].new_cursor */
extern T0* T235f5(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T341c3(T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_sequence */
extern T0* T147c9(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_last */
extern void T235f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].put_right */
extern void T342f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].attach_left */
extern void T342f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T342c4(T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].is_empty */
extern T1 T235f6(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_choice */
extern T0* T147c8(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_first */
extern void T235f8(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.element_name */
extern T0* T93f148(T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_name */
extern T0* T147c15(T0* a1);
/* XM_EIFFEL_PARSER.set_element_repetition */
extern void T93f247(T0* C, T0* a1, T0* a2);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_one */
extern void T147f14(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one_or_more */
extern void T147f13(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_any */
extern T0* T147c7(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_any */
extern void T147f18(T0* C);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].force */
extern void T162f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].fill_with */
extern void T161f8(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].resize */
extern T0* T162f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].aliased_resized_area */
extern T0* T161f4(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T162f1(T0* C, T6 a1);
/* ARRAY [XM_DTD_ELEMENT_CONTENT].make_empty */
extern T0* T246c4(void);
/* ARRAY [XM_DTD_ELEMENT_CONTENT].make_area */
extern void T246f5(T0* C, T6 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T161c6(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].default_create */
extern T0* T162c3(void);
/* XM_DTD_ELEMENT_CONTENT.make_empty */
extern T0* T147c6(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_empty */
extern void T147f17(T0* C);
/* XM_EIFFEL_PARSER.on_element_declaration */
extern void T93f246(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_element_declaration */
extern void T173f6(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_attribute */
extern void T93f245(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].has */
extern T1 T146f30(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].search_position */
extern void T146f34(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_item */
extern T6 T146f23(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].hash_position */
extern T6 T146f24(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.hash_code */
extern T6 T143f9(T0* C);
/* XM_EIFFEL_PARSER_NAME.item */
extern T0* T143f13(T0* C, T6 a1);
/* DS_BILINKED_LIST [STRING_8].item */
extern T0* T150f8(T0* C, T6 a1);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].test */
extern T1 T233f1(T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_storage_item */
extern T0* T146f18(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_item */
extern T0* T146f29(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_equality_tester */
extern T0* T146f17(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_item */
extern T6 T146f25(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].force */
extern void T160f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].fill_with */
extern void T159f8(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].resize */
extern T0* T160f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].aliased_resized_area */
extern T0* T159f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T160f1(T0* C, T6 a1);
/* ARRAY [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make_empty */
extern T0* T245c4(void);
/* ARRAY [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make_area */
extern void T245f5(T0* C, T6 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T159c6(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].default_create */
extern T0* T160c3(void);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].force_new */
extern void T146f33(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_put */
extern void T146f40(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_put */
extern void T146f39(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_put */
extern void T146f38(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].resize */
extern void T146f37(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_resize */
extern void T146f49(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].special_integer_ */
extern T0* T146f27(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_storage_resize */
extern void T146f48(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_resize */
extern void T146f47(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_resize */
extern void T146f46(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_modulus */
extern T6 T146f19(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_capacity */
extern T6 T146f26(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].unset_found_item */
extern void T146f36(T0* C);
/* XM_EIFFEL_PARSER.new_name_set */
extern T0* T93f135(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_equal */
extern T0* T146c32(T6 a1);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T233c2(void);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make */
extern void T146f35(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].set_internal_cursor */
extern void T146f45(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_cursor */
extern T0* T146f20(T0* C);
/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME].make */
extern T0* T234c3(T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_slots */
extern void T146f44(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_clashes */
extern void T146f43(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_key_storage */
extern void T146f42(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_item_storage */
extern void T146f41(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.on_start_tag */
extern void T93f244(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER.on_end_tag */
extern void T93f243(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER_NAME.local_part */
extern T0* T143f12(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].forth */
extern void T239f9(T0* C);
/* DS_BILINKED_LIST [STRING_8].cursor_forth */
extern void T150f16(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].add_traversing_cursor */
extern void T150f17(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T239f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].remove_traversing_cursor */
extern void T150f18(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].set */
extern void T239f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [STRING_8].item */
extern T0* T239f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].start */
extern void T239f8(T0* C);
/* DS_BILINKED_LIST [STRING_8].cursor_start */
extern void T150f15(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].cursor_off */
extern T1 T150f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.string_ */
extern T0* T143f17(T0* C);
/* XM_EIFFEL_PARSER_NAME.last */
extern T0* T143f16(T0* C);
/* DS_BILINKED_LIST [STRING_8].last */
extern T0* T150f9(T0* C);
/* XM_EIFFEL_PARSER_NAME.ns_prefix */
extern T0* T143f11(T0* C);
/* XM_EIFFEL_PARSER_NAME.is_namespace_name */
extern T1 T143f15(T0* C);
/* XM_EIFFEL_PARSER.on_start_tag_finish */
extern void T93f242(T0* C);
/* XM_EIFFEL_PARSER_NAME.is_equal */
extern T1 T143f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.same_string */
extern T1 T143f14(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER_NAME.string_equality_tester */
extern T0* T143f8(T0* C);
/* KL_SPECIAL_ROUTINES [BOOLEAN].force */
extern void T158f6(T0* C, T0* a1, T1 a2, T6 a3);
/* KL_SPECIAL_ROUTINES [BOOLEAN].resize */
extern T0* T158f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [BOOLEAN].aliased_resized_area */
extern T0* T155f4(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].make */
extern T0* T158f1(T0* C, T6 a1);
/* ARRAY [BOOLEAN].make_empty */
extern T0* T244c5(void);
/* ARRAY [BOOLEAN].make_area */
extern void T244f6(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].default_create */
extern T0* T158c5(void);
/* XM_EIFFEL_PARSER.when_external_dtd */
extern void T93f241(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.last_error */
extern T0* T140f2(T0* C);
/* XM_EIFFEL_PARSER.null_resolver */
extern unsigned char ge1541os5496;
extern T0* ge1541ov5496;
extern T0* T93f103(T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern T0* T174c198(void);
/* XM_EIFFEL_SCANNER_DTD.set_start_condition */
extern void T174f205(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern void T174f198p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T174f207(T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T174f207p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_with_buffer */
extern void T174f206(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_load_input_buffer */
extern void T174f217(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_content */
extern void T174f218(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.special_integer_ */
extern T0* T174f62(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_initialize */
extern void T174f216(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_build_tables */
extern void T174f221(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template */
extern T0* T174f192(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_fixed_array */
extern T0* T174f195(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_meta_template */
extern T0* T174f191(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_ec_template */
extern T0* T174f190(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template */
extern T0* T174f189(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template */
extern T0* T174f188(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template */
extern T0* T174f187(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_6 */
extern void T174f233(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_array_subcopy */
extern void T174f234(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_SCANNER_DTD.integer_array_ */
extern T0* T174f197(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_5 */
extern void T174f232(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_4 */
extern void T174f231(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_3 */
extern void T174f230(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_2 */
extern void T174f229(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_1 */
extern void T174f228(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template */
extern T0* T174f186(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_6 */
extern void T174f227(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_5 */
extern void T174f226(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_4 */
extern void T174f225(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_3 */
extern void T174f224(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_2 */
extern void T174f223(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_1 */
extern void T174f222(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.empty_buffer */
extern T0* T174f50(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].force */
extern void T136f8(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.has_error */
extern T1 T140f1(T0* C);
/* XM_EIFFEL_PARSER.resolve_external_id */
extern void T93f257(T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.resolve */
extern void T140f6(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_public */
extern void T140f5(T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.is_public */
extern T1 T145f3(T0* C);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].force */
extern void T157f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_DTD_EXTERNAL_ID].fill_with */
extern void T156f8(T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_PARSER.on_dtd_end */
extern void T93f240(T0* C);
/* XM_DTD_CALLBACKS_NULL.on_dtd_end */
extern void T173f5(T0* C);
/* XM_EIFFEL_PARSER.on_doctype */
extern void T93f239(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_DTD_CALLBACKS_NULL.on_doctype */
extern void T173f4(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_DTD_CALLBACKS_NULL.make */
extern T0* T173c1(void);
/* XM_EIFFEL_DECLARATION.set_encoding */
extern void T144f9(T0* C, T0* a1);
/* XM_EIFFEL_DECLARATION.set_stand_alone */
extern void T144f8(T0* C, T1 a1);
/* XM_EIFFEL_DECLARATION.set_version */
extern void T144f11(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].force */
extern void T154f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_EIFFEL_DECLARATION].fill_with */
extern void T153f8(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].resize */
extern T0* T154f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_DECLARATION].aliased_resized_area */
extern T0* T153f4(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].make */
extern T0* T154f1(T0* C, T6 a1);
/* ARRAY [XM_EIFFEL_DECLARATION].make_empty */
extern T0* T242c4(void);
/* ARRAY [XM_EIFFEL_DECLARATION].make_area */
extern void T242f5(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_DECLARATION].make */
extern T0* T153c6(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].default_create */
extern T0* T154c3(void);
/* XM_EIFFEL_DECLARATION.make */
extern T0* T144c7(void);
/* XM_EIFFEL_DECLARATION.process */
extern void T144f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_xml_declaration */
extern void T93f261(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_EIFFEL_PARSER.apply_encoding */
extern void T93f238(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_content */
extern void T93f237(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_dtd_processing_instruction */
extern void T93f236(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_dtd_processing_instruction */
extern void T173f3(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_processing_instruction */
extern void T93f235(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_dtd_comment */
extern void T93f234(T0* C, T0* a1);
/* XM_DTD_CALLBACKS_NULL.on_dtd_comment */
extern void T173f2(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_comment */
extern void T93f233(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.entity_referenced_in_entity_value */
extern T0* T93f117(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.defined_entity_referenced */
extern T0* T93f194(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.external_entity_to_string */
extern T0* T93f200(T0* C, T0* a1);
/* STRING_8.put */
extern void T17f53(T0* C, T2 a1, T6 a2);
/* STRING_8.remove */
extern void T17f52(T0* C, T6 a1);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_finish */
extern void T140f7(T0* C);
/* XM_EIFFEL_INPUT_STREAM.read_string */
extern void T206f29(T0* C, T6 a1);
/* XM_EIFFEL_INPUT_STREAM.last_character */
extern T2 T206f19(T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].item */
extern T2 T324f5(T0* C);
/* XM_EIFFEL_INPUT_STREAM.end_of_input */
extern T1 T206f18(T0* C);
/* KL_TEXT_INPUT_FILE.end_of_input */
extern T1 T55f28(T0* C);
/* XM_EIFFEL_INPUT_STREAM.read_character */
extern void T206f31(T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].remove */
extern void T324f7(T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].wipe_out */
extern void T324f9(T0* C);
/* XM_EIFFEL_INPUT_STREAM.noqueue_read_character */
extern void T206f33(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf16_read_character */
extern void T206f35(T0* C);
/* XM_EIFFEL_INPUT_STREAM.append_character */
extern void T206f36(T0* C, T6 a1);
/* DS_LINKED_QUEUE [CHARACTER_8].force */
extern void T324f8(T0* C, T2 a1);
/* DS_LINKABLE [CHARACTER_8].put_right */
extern void T468f4(T0* C, T0* a1);
/* DS_LINKED_QUEUE [CHARACTER_8].is_empty */
extern T1 T324f4(T0* C);
/* DS_LINKABLE [CHARACTER_8].make */
extern T0* T468c3(T2 a1);
/* UC_UTF8_ROUTINES.append_code_to_utf8 */
extern void T204f37(T0* C, T0* a1, T6 a2);
/* UC_UTF8_ROUTINES.integer_ */
extern T0* T204f29(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf8 */
extern T0* T206f22(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf8_buffer */
extern unsigned char ge1536os7813;
extern T0* ge1536ov7813;
extern T0* T206f25(T0* C);
/* UC_UTF16_ROUTINES.surrogate */
extern T6 T325f7(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_low_surrogate */
extern T1 T325f6(T0* C, T6 a1);
/* UC_UTF16_ROUTINES.least_10_bits */
extern T6 T325f5(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_high_surrogate */
extern T1 T325f4(T0* C, T6 a1);
/* UC_UTF16_ROUTINES.is_surrogate */
extern T1 T325f3(T0* C, T6 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16 */
extern unsigned char ge217os5284;
extern T0* ge217ov5284;
extern T0* T206f20(T0* C);
/* UC_UTF16_ROUTINES.default_create */
extern T0* T325c16(void);
/* XM_EIFFEL_INPUT_STREAM.least_significant */
extern T6 T206f24(T0* C, T2 a1, T2 a2);
/* XM_EIFFEL_INPUT_STREAM.most_significant */
extern T6 T206f23(T0* C, T2 a1, T2 a2);
/* XM_EIFFEL_INPUT_STREAM.latin1_read_character */
extern void T206f34(T0* C);
/* KL_STRING_INPUT_STREAM.read_character */
extern void T490f10(T0* C);
/* KL_TEXT_INPUT_FILE.read_character */
extern void T55f66(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_character */
extern void T55f67(T0* C);
/* KL_TEXT_INPUT_FILE.file_gc */
extern T2 T55f31(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.old_end_of_file */
extern T1 T55f30(T0* C);
/* KL_TEXT_INPUT_FILE.file_feof */
extern T1 T55f32(T0* C, T14 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16_detect_read_character */
extern void T206f32(T0* C);
/* UC_UTF8_ROUTINES.is_endian_detection_character */
extern T1 T204f31(T0* C, T2 a1, T2 a2, T2 a3);
/* UC_UTF8_ROUTINES.is_endian_detection_character_start */
extern T1 T204f30(T0* C, T2 a1, T2 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_least_first */
extern T1 T325f2(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_most_first */
extern T1 T325f1(T0* C, T6 a1, T6 a2);
/* KL_STRING_ROUTINES.wipe_out */
extern void T76f21(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.string_ */
extern T0* T206f17(T0* C);
/* KL_PLATFORM.maximum_integer */
extern unsigned char ge200os7874;
extern T6 ge200ov7874;
extern T6 T208f2(T0* C);
/* KL_INTEGER_ROUTINES.platform */
extern T0* T207f1(T0* C);
/* XM_EIFFEL_PARSER.integer_ */
extern T0* T93f201(T0* C);
/* XM_EIFFEL_INPUT_STREAM.make_from_stream */
extern T0* T206c28(T0* a1);
/* DS_LINKED_QUEUE [CHARACTER_8].make */
extern T0* T324c6(void);
/* XM_NULL_EXTERNAL_RESOLVER.last_stream */
extern T0* T140f3(T0* C);
/* XM_EIFFEL_ENTITY_DEF.is_literal */
extern T1 T171f62(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_literal */
extern T1 T176f63(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_external */
extern T1 T176f66(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item */
extern T0* T138f21(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_item */
extern T0* T138f36(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.force_error */
extern void T93f232(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.report_error */
extern void T93f230(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_error */
extern void T93f256(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.setup_error_state */
extern void T93f255(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.onstring_utf8 */
extern T0* T93f96(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.maximum_item_code */
extern T6 T93f189(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_latin1 */
extern T1 T93f188(T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_from_utf8 */
extern T0* T93f184(T0* C, T0* a1);
/* UC_UTF8_STRING.make_from_utf8 */
extern T0* T205c58(T0* a1);
/* UC_UTF8_STRING.append_utf8 */
extern void T205f68(T0* C, T0* a1);
/* UC_UTF8_ROUTINES.valid_utf8 */
extern T1 T204f1(T0* C, T0* a1);
/* UC_UTF8_ROUTINES.is_encoded_next_byte */
extern T1 T204f10(T0* C, T2 a1);
/* UC_UTF8_ROUTINES.is_encoded_second_byte */
extern T1 T204f5(T0* C, T2 a1, T2 a2);
/* UC_UTF8_ROUTINES.is_encoded_first_byte */
extern T1 T204f2(T0* C, T2 a1);
/* XM_EIFFEL_PARSER.utf8 */
extern T0* T93f187(T0* C);
/* XM_EIFFEL_PARSER.is_string_mode_ascii */
extern T1 T93f185(T0* C);
/* XM_EIFFEL_PARSER.onstring_ascii */
extern T0* T93f94(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_unicode */
extern T1 T93f183(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string */
extern T0* T93f115(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_string */
extern unsigned char ge1541os5563;
extern T0* ge1541ov5563;
extern T0* T93f193(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_uc */
extern unsigned char ge1541os5564;
extern T0* ge1541ov5564;
extern T0* T93f192(T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_empty */
extern T0* T93f199(T0* C);
/* UC_UTF8_STRING.make_empty */
extern T0* T205c62(void);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].force */
extern void T152f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].fill_with */
extern void T151f8(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].resize */
extern T0* T152f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].aliased_resized_area */
extern T0* T151f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].make */
extern T0* T152f1(T0* C, T6 a1);
/* ARRAY [XM_EIFFEL_PARSER_NAME].make_empty */
extern T0* T241c4(void);
/* ARRAY [XM_EIFFEL_PARSER_NAME].make_area */
extern void T241f5(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].make */
extern T0* T151c6(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T152c3(void);
/* XM_EIFFEL_PARSER.namespace_force_last */
extern void T93f231(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER_NAME.force_last */
extern void T143f19(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.new_string_bilinked_list */
extern T0* T143f7(T0* C);
/* XM_EIFFEL_PARSER_NAME.can_force_last */
extern T1 T143f6(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_namespace_name */
extern T0* T93f111(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern void T143f20(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern T0* T143c20(void);
/* XM_EIFFEL_PARSER_NAME.make_namespaces */
extern T0* T143c18(void);
/* XM_EIFFEL_PARSER.yy_push_last_value */
extern void T93f221(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.accept */
extern void T93f220(T0* C);
/* XM_EIFFEL_PARSER.yy_do_error_action */
extern void T93f218(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.report_eof_expected_error */
extern void T93f229(T0* C);
/* XM_EIFFEL_PARSER.read_token */
extern void T93f217(T0* C);
/* XM_EIFFEL_PARSER.process_attribute_entity */
extern void T93f228(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_entity_scanner */
extern void T93f254(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_start_condition */
extern void T171f229(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_start_condition */
extern void T176f233(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.has_error */
extern T1 T171f55(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.has_error */
extern T1 T176f56(T0* C);
/* XM_EIFFEL_ENTITY_DEF.apply_input_buffer */
extern void T171f228(T0* C);
/* KL_STRING_INPUT_STREAM.make */
extern T0* T490c9(T0* a1);
/* UC_UTF8_ROUTINES.to_utf8 */
extern T0* T204f35(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.utf8 */
extern T0* T171f66(T0* C);
/* XM_EIFFEL_ENTITY_DEF.fatal_error */
extern void T171f236(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.apply_input_buffer */
extern void T176f232(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.utf8 */
extern T0* T176f68(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.fatal_error */
extern void T176f240(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_entity */
extern void T93f227(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_pe_entity */
extern void T93f226(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.special_integer_ */
extern T0* T93f113(T0* C);
/* XM_EIFFEL_PARSER.yy_init_value_stacks */
extern void T93f216(T0* C);
/* XM_EIFFEL_PARSER.yy_clear_all */
extern void T93f225(T0* C);
/* XM_EIFFEL_PARSER.clear_all */
extern void T93f253(T0* C);
/* XM_EIFFEL_PARSER.clear_stacks */
extern void T93f259(T0* C);
/* XM_EIFFEL_PARSER.yy_clear_value_stacks */
extern void T93f260(T0* C);
/* SPECIAL [XM_EIFFEL_DECLARATION].upper */
extern T6 T153f5(T0* C);
/* SPECIAL [BOOLEAN].upper */
extern T6 T155f5(T0* C);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].upper */
extern T6 T169f5(T0* C);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].upper */
extern T6 T164f5(T0* C);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].upper */
extern T6 T166f5(T0* C);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].upper */
extern T6 T161f5(T0* C);
/* SPECIAL [XM_DTD_EXTERNAL_ID].upper */
extern T6 T156f5(T0* C);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].upper */
extern T6 T159f5(T0* C);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].upper */
extern T6 T151f5(T0* C);
/* XM_EIFFEL_PARSER.abort */
extern void T93f219(T0* C);
/* XM_EIFFEL_PARSER.on_start */
extern void T93f213(T0* C);
/* XM_CALLBACKS_NULL.make */
extern T0* T137c1(void);
/* XM_EIFFEL_PARSER.reset_error_state */
extern void T93f212(T0* C);
/* XM_EIFFEL_PARSER.reset */
extern void T93f208(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].wipe_out */
extern void T138f39(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_wipe_out */
extern void T138f49(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_wipe_out */
extern void T138f48(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_wipe_out */
extern void T138f47(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_wipe_out */
extern void T138f46(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].move_all_cursors_after */
extern void T138f44(T0* C);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].set_next_cursor */
extern void T229f6(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].set_position */
extern void T229f5(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.make_scanner */
extern void T93f206(T0* C);
/* XM_EIFFEL_SCANNER.make_scanner */
extern T0* T132c196(void);
/* XM_EIFFEL_SCANNER.reset */
extern void T132f204(T0* C);
/* XM_EIFFEL_SCANNER.reset */
extern void T132f204p1(T0* C);
/* XM_EIFFEL_SCANNER.make_with_buffer */
extern void T132f203(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_load_input_buffer */
extern void T132f212(T0* C);
/* XM_EIFFEL_SCANNER.yy_set_content */
extern void T132f213(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.special_integer_ */
extern T0* T132f51(T0* C);
/* XM_EIFFEL_SCANNER.yy_initialize */
extern void T132f211(T0* C);
/* XM_EIFFEL_SCANNER.yy_build_tables */
extern void T132f219(T0* C);
/* XM_EIFFEL_SCANNER.yy_accept_template */
extern T0* T132f190(T0* C);
/* XM_EIFFEL_SCANNER.yy_fixed_array */
extern T0* T132f193(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_meta_template */
extern T0* T132f189(T0* C);
/* XM_EIFFEL_SCANNER.yy_ec_template */
extern T0* T132f188(T0* C);
/* XM_EIFFEL_SCANNER.yy_def_template */
extern T0* T132f187(T0* C);
/* XM_EIFFEL_SCANNER.yy_base_template */
extern T0* T132f186(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template */
extern T0* T132f185(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_6 */
extern void T132f231(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_array_subcopy */
extern void T132f232(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_SCANNER.integer_array_ */
extern T0* T132f195(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_5 */
extern void T132f230(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_4 */
extern void T132f229(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_3 */
extern void T132f228(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_2 */
extern void T132f227(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_1 */
extern void T132f226(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template */
extern T0* T132f184(T0* C);
/* XM_EIFFEL_SCANNER.yy_nxt_template_6 */
extern void T132f225(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_5 */
extern void T132f224(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_4 */
extern void T132f223(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_3 */
extern void T132f222(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_2 */
extern void T132f221(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_1 */
extern void T132f220(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.empty_buffer */
extern T0* T132f43(T0* C);
/* GEANT_PROJECT_PARSER.make */
extern T0* T56c8(T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.enable_position_table */
extern void T97f10(T0* C, T0* a1);
/* XM_POSITION_TABLE.make */
extern T0* T101c4(void);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T180c8(void);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].set_internal_cursor */
extern void T180f9(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.set_callbacks */
extern void T93f204(T0* C, T0* a1);
/* XM_TREE_CALLBACKS_PIPE.make */
extern T0* T94c10(void);
/* XM_TREE_CALLBACKS_PIPE.callbacks_pipe */
extern T0* T94f9(T0* C, T0* a1);
/* ARRAY [XM_CALLBACKS_FILTER].item */
extern T0* T179f4(T0* C, T6 a1);
/* XM_CALLBACKS_TO_TREE_FILTER.make_null */
extern T0* T97c9(void);
/* XM_TREE_CALLBACKS_PIPE.new_stop_on_error */
extern T0* T94f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.make_null */
extern T0* T100c4(void);
/* XM_TREE_CALLBACKS_PIPE.new_namespace_resolver */
extern T0* T94f6(T0* C);
/* XM_NAMESPACE_RESOLVER.make_null */
extern T0* T177c25(void);
/* XM_EIFFEL_PARSER.set_string_mode_mixed */
extern void T93f203(T0* C);
/* XM_EIFFEL_PARSER.make */
extern T0* T93c202(void);
/* XM_EIFFEL_PARSER.new_entities_table */
extern T0* T93f87(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].set_key_equality_tester */
extern void T138f41(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8].internal_set_equality_tester */
extern void T227f6(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_map_default */
extern T0* T138c38(void);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_map */
extern void T138f43(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_with_equality_testers */
extern void T138f55(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T227c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8].set_internal_cursor */
extern void T227f7(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8].new_cursor */
extern T0* T227f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T339c3(T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_cursor */
extern T0* T138f35(T0* C);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T229c4(T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_sparse_container */
extern void T138f60(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].set_internal_cursor */
extern void T138f65(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_slots */
extern void T138f64(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_clashes */
extern void T138f63(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_key_storage */
extern void T138f62(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_item_storage */
extern void T138f61(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T231f2(T0* C, T6 a1);
/* ARRAY [XM_EIFFEL_ENTITY_DEF].make_empty */
extern T0* T340c4(void);
/* ARRAY [XM_EIFFEL_ENTITY_DEF].make_area */
extern void T340f5(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T226c5(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].default_create */
extern T0* T231c3(void);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].default_capacity */
extern T6 T138f31(T0* C);
/* XM_EIFFEL_PARSER.make_parser */
extern void T93f207(T0* C);
/* XM_EIFFEL_PARSER.yy_build_parser_tables */
extern void T93f211(T0* C);
/* XM_EIFFEL_PARSER.yycheck_template */
extern unsigned char ge1537os5443;
extern T0* ge1537ov5443;
extern T0* T93f104(T0* C);
/* XM_EIFFEL_PARSER.yyfixed_array */
extern T0* T93f181(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytable_template */
extern unsigned char ge1537os5442;
extern T0* ge1537ov5442;
extern T0* T93f92(T0* C);
/* XM_EIFFEL_PARSER.yypgoto_template */
extern unsigned char ge1537os5441;
extern T0* ge1537ov5441;
extern T0* T93f90(T0* C);
/* XM_EIFFEL_PARSER.yypact_template */
extern unsigned char ge1537os5440;
extern T0* ge1537ov5440;
extern T0* T93f88(T0* C);
/* XM_EIFFEL_PARSER.yydefgoto_template */
extern unsigned char ge1537os5439;
extern T0* ge1537ov5439;
extern T0* T93f86(T0* C);
/* XM_EIFFEL_PARSER.yydefact_template */
extern unsigned char ge1537os5438;
extern T0* ge1537ov5438;
extern T0* T93f84(T0* C);
/* XM_EIFFEL_PARSER.yytypes2_template */
extern unsigned char ge1537os5437;
extern T0* ge1537ov5437;
extern T0* T93f171(T0* C);
/* XM_EIFFEL_PARSER.yytypes1_template */
extern unsigned char ge1537os5436;
extern T0* ge1537ov5436;
extern T0* T93f155(T0* C);
/* XM_EIFFEL_PARSER.yyr1_template */
extern unsigned char ge1537os5435;
extern T0* ge1537ov5435;
extern T0* T93f136(T0* C);
/* XM_EIFFEL_PARSER.yytranslate_template */
extern unsigned char ge1537os5434;
extern T0* ge1537ov5434;
extern T0* T93f125(T0* C);
/* XM_EIFFEL_PARSER.yy_create_value_stacks */
extern void T93f210(T0* C);
/* XM_EXPAT_PARSER_FACTORY.new_expat_parser */
extern T0* T91f2(T0* C);
/* XM_EXPAT_PARSER_FACTORY.is_expat_parser_available */
extern T1 T91f1(T0* C);
/* XM_EXPAT_PARSER_FACTORY.default_create */
extern T0* T91c3(void);
/* KL_TEXT_INPUT_FILE.is_open_read */
extern T1 T55f16(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_read */
extern T1 T55f15(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T55f58(T0* C);
/* KL_TEXT_INPUT_FILE.is_closed */
extern T1 T55f21(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_closed */
extern T1 T55f18(T0* C);
/* KL_TEXT_INPUT_FILE.old_open_read */
extern void T55f64(T0* C);
/* KL_TEXT_INPUT_FILE.default_pointer */
extern T14 T55f25(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T55f64p1(T0* C);
/* KL_TEXT_INPUT_FILE.file_open */
extern T14 T55f26(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.old_is_readable */
extern T1 T55f23(T0* C);
/* UNIX_FILE_INFO.is_readable */
extern T1 T87f3(T0* C);
/* UNIX_FILE_INFO.file_eaccess */
extern T1 T87f4(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.make */
extern void T55f56(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.make */
extern T0* T55c56(T0* a1);
/* KL_TEXT_INPUT_FILE.make */
extern void T55f56p1(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.old_make */
extern void T55f62(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.string_ */
extern T0* T55f17(T0* C);
/* GEANT_PROJECT_LOADER.make */
extern T0* T23c9(T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_file_readable */
extern T1 T53f2(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.is_readable */
extern T1 T55f29(T0* C);
/* KL_UNIX_FILE_SYSTEM.is_file_readable */
extern T1 T54f2(T0* C, T0* a1);
/* GEANT.default_build_filename */
extern unsigned char ge2os1747;
extern T0* ge2ov1747;
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
extern T0* T25c59(void);
/* GEANT_PROJECT_VARIABLES.verbose_name */
extern unsigned char ge8os1903;
extern T0* ge8ov1903;
extern T0* T25f38(T0* C);
/* GEANT_PROJECT_VARIABLES.exe_name */
extern unsigned char ge8os1902;
extern T0* ge8ov1902;
extern T0* T25f37(T0* C);
/* GEANT_PROJECT_VARIABLES.path_separator_name */
extern unsigned char ge8os1901;
extern T0* ge8ov1901;
extern T0* T25f36(T0* C);
/* GEANT_PROJECT_VARIABLES.is_unix_name */
extern unsigned char ge8os1900;
extern T0* ge8ov1900;
extern T0* T25f31(T0* C);
/* GEANT_PROJECT_VARIABLES.is_windows_name */
extern unsigned char ge8os1899;
extern T0* ge8ov1899;
extern T0* T25f28(T0* C);
/* GEANT_VARIABLES.value */
extern T0* T29f31(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.default_builtin_variables */
extern unsigned char ge10os1753;
extern T0* ge10ov1753;
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
extern unsigned char ge8os1898;
extern T0* ge8ov1898;
extern T0* T25f24(T0* C);
/* GEANT_PROJECT_VARIABLES.project_variables_resolver */
extern T0* T25f23(T0* C);
/* GEANT_PROJECT_VARIABLES.make */
extern void T25f59p1(T0* C);
/* GEANT_PROJECT_VARIABLES.set_key_equality_tester */
extern void T25f62(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.make_map */
extern void T25f61(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_with_equality_testers */
extern void T25f64(T0* C, T6 a1, T0* a2, T0* a3);
/* GEANT_PROJECT_VARIABLES.make_sparse_container */
extern void T25f72(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.set_internal_cursor */
extern void T25f81(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.unset_found_item */
extern void T25f65(T0* C);
/* GEANT_PROJECT_VARIABLES.make_slots */
extern void T25f80(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.special_integer_ */
extern T0* T25f35(T0* C);
/* GEANT_PROJECT_VARIABLES.new_modulus */
extern T6 T25f29(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_clashes */
extern void T25f79(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_key_storage */
extern void T25f78(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_item_storage */
extern void T25f77(T0* C, T6 a1);
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
extern T0* T71f17(T0* C);
/* GEANT_VARIABLES.force */
extern void T29f50(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.key_storage_put */
extern void T29f59(T0* C, T0* a1, T6 a2);
/* GEANT_VARIABLES.slots_put */
extern void T29f58(T0* C, T6 a1, T6 a2);
/* GEANT_VARIABLES.clashes_put */
extern void T29f57(T0* C, T6 a1, T6 a2);
/* GEANT_VARIABLES.resize */
extern void T29f56(T0* C, T6 a1);
/* GEANT_VARIABLES.clashes_resize */
extern void T29f64(T0* C, T6 a1);
/* GEANT_VARIABLES.key_storage_resize */
extern void T29f63(T0* C, T6 a1);
/* GEANT_VARIABLES.item_storage_resize */
extern void T29f62(T0* C, T6 a1);
/* GEANT_VARIABLES.slots_resize */
extern void T29f61(T0* C, T6 a1);
/* GEANT_VARIABLES.new_capacity */
extern T6 T29f23(T0* C, T6 a1);
/* GEANT_VARIABLES.item_storage_put */
extern void T29f55(T0* C, T0* a1, T6 a2);
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
extern unsigned char ge201os1775;
extern T0* ge201ov1775;
extern T0* T40f20(T0* C);
/* KL_ARGUMENTS.make */
extern T0* T27c4(void);
/* KL_ARGUMENTS.argument */
extern T0* T27f2(T0* C, T6 a1);
/* ARRAY [STRING_8].valid_index */
extern T1 T33f5(T0* C, T6 a1);
/* AP_ERROR.string_ */
extern T0* T40f19(T0* C);
/* AP_ERROR.make_invalid_parameter_error */
extern T0* T40c21(T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.force */
extern void T34f49(T0* C, T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.search_position */
extern void T34f53(T0* C, T0* a1);
/* GEANT.set_show_target_info */
extern void T21f27(T0* C, T1 a1);
/* AP_STRING_OPTION.parameter */
extern T0* T37f15(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].last */
extern T0* T71f8(T0* C);
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
extern void T69f8(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.remove_traversing_cursor */
extern void T36f21(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [AP_OPTION].set */
extern void T69f7(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_ARRAYED_LIST [AP_OPTION].forth */
extern void T74f23(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_forth */
extern void T74f27(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].set_position */
extern void T109f6(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].add_traversing_cursor */
extern void T74f28(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].set_next_cursor */
extern void T109f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].remove_traversing_cursor */
extern void T74f29(T0* C, T0* a1);
/* AP_ERROR.make_surplus_option_error */
extern T0* T40c23(T0* a1);
/* AP_ERROR.make_missing_option_error */
extern T0* T40c22(T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.item_for_iteration */
extern T0* T36f6(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_item */
extern T0* T36f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].item_for_iteration */
extern T0* T74f7(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_item */
extern T0* T74f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].item */
extern T0* T74f11(T0* C, T6 a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.after */
extern T1 T36f5(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_after */
extern T1 T36f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].after */
extern T1 T74f9(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_after */
extern T1 T74f12(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.start */
extern void T36f16(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_start */
extern void T36f18(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_off */
extern T1 T36f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].start */
extern void T74f22(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_start */
extern void T74f26(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].is_empty */
extern T1 T74f17(T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].off */
extern T1 T109f4(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_off */
extern T1 T74f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_before */
extern T1 T74f19(T0* C, T0* a1);
/* AP_PARSER.parse_argument */
extern void T38f32(T0* C, T0* a1);
/* AP_PARSER.parse_short */
extern void T38f35(T0* C, T0* a1);
/* AP_ERROR.make_missing_parameter_error */
extern T0* T40c25(T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].off */
extern T1 T71f7(T0* C);
/* AP_ERROR.make_unknown_option_error */
extern T0* T40c24(T0* a1);
/* CHARACTER_8.out */
extern T0* T2f1(T2* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].forth */
extern void T75f21(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_forth */
extern void T75f25(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].set_position */
extern void T113f6(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].add_traversing_cursor */
extern void T75f26(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].set_next_cursor */
extern void T113f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].remove_traversing_cursor */
extern void T75f27(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].item_for_iteration */
extern T0* T75f8(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_item */
extern T0* T75f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].item */
extern T0* T75f7(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].after */
extern T1 T75f9(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_after */
extern T1 T75f10(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].start */
extern void T75f20(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_start */
extern void T75f24(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].is_empty */
extern T1 T75f15(T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].off */
extern T1 T113f4(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_off */
extern T1 T75f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_before */
extern T1 T75f17(T0* C, T0* a1);
/* AP_PARSER.parse_long */
extern void T38f34(T0* C, T0* a1);
/* AP_ERROR.make_unnecessary_parameter_error */
extern T0* T40c26(T0* a1, T0* a2);
/* AP_PARSER.string_ */
extern T0* T38f22(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].forth */
extern void T71f27(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].item_for_iteration */
extern T0* T71f21(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].after */
extern T1 T71f16(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].start */
extern void T71f26(T0* C);
/* AP_PARSER.reset_parser */
extern void T38f31(T0* C);
/* AP_PARSER.all_options */
extern T0* T38f16(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].has */
extern T1 T74f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].make */
extern T0* T74c20(T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].set_internal_cursor */
extern void T74f24(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].new_cursor */
extern T0* T74f14(T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].make */
extern T0* T109c5(T0* a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].make */
extern T0* T112f1(T0* C, T6 a1);
/* SPECIAL [AP_OPTION].aliased_resized_area */
extern T0* T111f4(T0* C, T6 a1);
/* ARRAY [AP_OPTION].make_empty */
extern T0* T186c4(void);
/* ARRAY [AP_OPTION].make_area */
extern void T186f5(T0* C, T6 a1);
/* SPECIAL [AP_OPTION].make */
extern T0* T111c5(T6 a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].default_create */
extern T0* T112c3(void);
/* AP_ERROR_HANDLER.reset */
extern void T45f10(T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].force */
extern void T71f25(T0* C, T0* a1, T6 a2);
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
extern T0* T35c20(T2 a1, T0* a2);
/* AP_FLAG.set_long_form */
extern void T35f22(T0* C, T0* a1);
/* AP_FLAG.set_short_form */
extern void T35f24(T0* C, T2 a1);
/* AP_FLAG.initialize */
extern void T35f21(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].force_last */
extern void T75f19(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].force */
extern void T115f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].fill_with */
extern void T114f7(T0* C, T0* a1, T6 a2, T6 a3);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].resize */
extern void T75f23(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].resize */
extern T0* T115f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].aliased_resized_area */
extern T0* T114f4(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].new_capacity */
extern T6 T75f14(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].extendible */
extern T1 T75f12(T0* C, T6 a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.make */
extern T0* T36c11(T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.old_make */
extern void T36f14(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.set_internal_cursor */
extern void T36f15(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.new_cursor */
extern T0* T36f10(T0* C);
/* DS_LINKED_LIST_CURSOR [AP_OPTION].make */
extern T0* T69c6(T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.set_parameters_description */
extern void T36f13(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.set_introduction_option */
extern void T36f12(T0* C, T0* a1);
/* AP_FLAG.set_description */
extern void T35f19(T0* C, T0* a1);
/* AP_FLAG.make_with_long_form */
extern T0* T35c18(T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].force_last */
extern void T74f21(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].force */
extern void T112f4(T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [AP_OPTION].fill_with */
extern void T111f7(T0* C, T0* a1, T6 a2, T6 a3);
/* DS_ARRAYED_LIST [AP_OPTION].resize */
extern void T74f25(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].resize */
extern T0* T112f2(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [AP_OPTION].new_capacity */
extern T6 T74f16(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].extendible */
extern T1 T74f15(T0* C, T6 a1);
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
extern void T73f37(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.make */
extern T0* T73c36(T2 a1, T0* a2);
/* AP_DISPLAY_HELP_FLAG.set_long_form */
extern void T73f40(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.set_short_form */
extern void T73f39(T0* C, T2 a1);
/* AP_DISPLAY_HELP_FLAG.initialize */
extern void T73f38(T0* C);
/* AP_PARSER.make_empty */
extern void T38f29(T0* C);
/* AP_ERROR_HANDLER.make_standard */
extern T0* T45c7(void);
/* AP_ERROR_HANDLER.std */
extern T0* T45f5(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T75c18(T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].set_internal_cursor */
extern void T75f22(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].new_cursor */
extern T0* T75f11(T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T113c5(T0* a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T115f1(T0* C, T6 a1);
/* ARRAY [AP_ALTERNATIVE_OPTIONS_LIST].make_empty */
extern T0* T187c4(void);
/* ARRAY [AP_ALTERNATIVE_OPTIONS_LIST].make_area */
extern void T187f5(T0* C, T6 a1);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T114c5(T6 a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].default_create */
extern T0* T115c3(void);
/* UT_ERROR_HANDLER.make_standard */
extern T0* T28c7(void);
/* UT_ERROR_HANDLER.std */
extern T0* T28f4(T0* C);
/* KL_ARGUMENTS.set_program_name */
extern void T27f5(T0* C, T0* a1);
/* GEANT.arguments */
extern T0* T21f10(T0* C);
/* DIRECTORY.dispose */
extern void T661f15(T0* C);
/* DIRECTORY.close */
extern void T661f20(T0* C);
/* DIRECTORY.default_pointer */
extern T14 T661f9(T0* C);
/* DIRECTORY.dir_close */
extern void T661f25(T0* C, T14 a1);
/* DIRECTORY.is_closed */
extern T1 T661f5(T0* C);
/* RAW_FILE.dispose */
extern void T660f15(T0* C);
/* RAW_FILE.close */
extern void T660f18(T0* C);
/* RAW_FILE.file_close */
extern void T660f20(T0* C, T14 a1);
/* RAW_FILE.is_closed */
extern T1 T660f11(T0* C);
/* KL_BINARY_OUTPUT_FILE.dispose */
extern void T657f21(T0* C);
/* KL_BINARY_OUTPUT_FILE.old_close */
extern void T657f26(T0* C);
/* KL_BINARY_OUTPUT_FILE.file_close */
extern void T657f29(T0* C, T14 a1);
/* KL_BINARY_OUTPUT_FILE.old_is_closed */
extern T1 T657f11(T0* C);
/* KL_BINARY_INPUT_FILE.dispose */
extern void T656f34(T0* C);
/* KL_BINARY_INPUT_FILE.old_close */
extern void T656f39(T0* C);
/* KL_BINARY_INPUT_FILE.file_close */
extern void T656f41(T0* C, T14 a1);
/* KL_BINARY_INPUT_FILE.old_is_closed */
extern T1 T656f12(T0* C);
/* KL_TEXT_OUTPUT_FILE.dispose */
extern void T517f22(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_close */
extern void T517f28(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_close */
extern void T517f33(T0* C, T14 a1);
/* KL_TEXT_OUTPUT_FILE.old_is_closed */
extern T1 T517f11(T0* C);
/* KL_DIRECTORY.dispose */
extern void T489f36(T0* C);
/* KL_DIRECTORY.old_close */
extern void T489f39(T0* C);
/* KL_DIRECTORY.default_pointer */
extern T14 T489f13(T0* C);
/* KL_DIRECTORY.dir_close */
extern void T489f40(T0* C, T14 a1);
/* KL_DIRECTORY.is_closed */
extern T1 T489f9(T0* C);
/* MANAGED_POINTER.dispose */
extern void T261f8(T0* C);
/* POINTER.memory_free */
extern void T14f8(T14* C);
/* POINTER.default_pointer */
extern T14 T14f5(T14* C);
/* POINTER.c_free */
extern void T14f9(T14* C, T14 a1);
/* KL_TEXT_INPUT_FILE.dispose */
extern void T55f57(T0* C);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].record */
extern void T629f5(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.put */
extern void T599f12(T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.put */
extern void T599f12p1(T0* C, T6 a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].record */
extern void T627f4(T0* C, T0* a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].record */
extern void T625f5(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.add */
extern void T599f11(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.add */
extern void T599f11p1(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.log_validation_messages */
extern void T316f34(T0* C);
/* GEANT_REPLACE_TASK.validation_messages */
extern unsigned char ge10os1757;
extern T0* ge10ov1757;
extern T0* T316f16(T0* C);
/* GEANT_INPUT_TASK.log_validation_messages */
extern void T314f35(T0* C);
/* GEANT_INPUT_TASK.validation_messages */
extern T0* T314f13(T0* C);
/* GEANT_AVAILABLE_TASK.log_validation_messages */
extern void T312f25(T0* C);
/* GEANT_AVAILABLE_TASK.validation_messages */
extern T0* T312f5(T0* C);
/* GEANT_PRECURSOR_TASK.log_validation_messages */
extern void T310f32(T0* C);
/* GEANT_PRECURSOR_TASK.validation_messages */
extern T0* T310f13(T0* C);
/* GEANT_EXIT_TASK.log_validation_messages */
extern void T308f26(T0* C);
/* GEANT_EXIT_TASK.validation_messages */
extern T0* T308f7(T0* C);
/* GEANT_OUTOFDATE_TASK.log_validation_messages */
extern void T306f31(T0* C);
/* GEANT_OUTOFDATE_TASK.validation_messages */
extern T0* T306f13(T0* C);
/* GEANT_XSLT_TASK.log_validation_messages */
extern void T304f44(T0* C);
/* GEANT_XSLT_TASK.validation_messages */
extern T0* T304f23(T0* C);
/* GEANT_SETENV_TASK.log_validation_messages */
extern void T302f27(T0* C);
/* GEANT_SETENV_TASK.validation_messages */
extern T0* T302f8(T0* C);
/* GEANT_MOVE_TASK.log_validation_messages */
extern void T300f29(T0* C);
/* GEANT_MOVE_TASK.validation_messages */
extern T0* T300f11(T0* C);
/* GEANT_COPY_TASK.log_validation_messages */
extern void T298f34(T0* C);
/* GEANT_COPY_TASK.validation_messages */
extern T0* T298f13(T0* C);
/* GEANT_DELETE_TASK.log_validation_messages */
extern void T296f29(T0* C);
/* GEANT_DELETE_TASK.validation_messages */
extern T0* T296f11(T0* C);
/* GEANT_MKDIR_TASK.log_validation_messages */
extern void T294f25(T0* C);
/* GEANT_MKDIR_TASK.validation_messages */
extern T0* T294f5(T0* C);
/* GEANT_ECHO_TASK.log_validation_messages */
extern void T292f25(T0* C);
/* GEANT_ECHO_TASK.validation_messages */
extern T0* T292f5(T0* C);
/* GEANT_GEANT_TASK.log_validation_messages */
extern void T290f40(T0* C);
/* GEANT_GEANT_TASK.validation_messages */
extern T0* T290f20(T0* C);
/* GEANT_GETEST_TASK.log_validation_messages */
extern void T288f42(T0* C);
/* GEANT_GETEST_TASK.validation_messages */
extern T0* T288f22(T0* C);
/* GEANT_GEPP_TASK.log_validation_messages */
extern void T286f37(T0* C);
/* GEANT_GEPP_TASK.validation_messages */
extern T0* T286f16(T0* C);
/* GEANT_GEYACC_TASK.log_validation_messages */
extern void T284f37(T0* C);
/* GEANT_GEYACC_TASK.validation_messages */
extern T0* T284f15(T0* C);
/* GEANT_GELEX_TASK.log_validation_messages */
extern void T282f40(T0* C);
/* GEANT_GELEX_TASK.validation_messages */
extern T0* T282f18(T0* C);
/* GEANT_GEXACE_TASK.log_validation_messages */
extern void T280f38(T0* C);
/* GEANT_GEXACE_TASK.validation_messages */
extern T0* T280f16(T0* C);
/* GEANT_UNSET_TASK.log_validation_messages */
extern void T278f26(T0* C);
/* GEANT_UNSET_TASK.validation_messages */
extern T0* T278f7(T0* C);
/* GEANT_SET_TASK.log_validation_messages */
extern void T276f27(T0* C);
/* GEANT_SET_TASK.validation_messages */
extern T0* T276f8(T0* C);
/* GEANT_LCC_TASK.log_validation_messages */
extern void T274f27(T0* C);
/* GEANT_LCC_TASK.validation_messages */
extern T0* T274f8(T0* C);
/* GEANT_EXEC_TASK.log_validation_messages */
extern void T272f26(T0* C);
/* GEANT_EXEC_TASK.validation_messages */
extern T0* T272f6(T0* C);
/* GEANT_ISE_TASK.log_validation_messages */
extern void T270f37(T0* C);
/* GEANT_ISE_TASK.validation_messages */
extern T0* T270f15(T0* C);
/* GEANT_GEC_TASK.log_validation_messages */
extern void T263f40(T0* C);
/* GEANT_GEC_TASK.validation_messages */
extern T0* T263f18(T0* C);
/* GEANT_REPLACE_TASK.execute */
extern void T316f40(T0* C);
/* GEANT_REPLACE_COMMAND.execute */
extern void T462f40(T0* C);
/* GEANT_FILESET.forth */
extern void T390f50(T0* C);
/* GEANT_FILESET.update_project_variables */
extern void T390f55(T0* C);
/* GEANT_FILESET.remove_project_variables */
extern void T390f51(T0* C);
/* GEANT_PROJECT_VARIABLES.remove */
extern void T25f87(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.remove_position */
extern void T25f89(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.key_storage_put */
extern void T25f71(T0* C, T0* a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.item_storage_put */
extern void T25f67(T0* C, T0* a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.clashes_put */
extern void T25f69(T0* C, T6 a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.slots_put */
extern void T25f70(T0* C, T6 a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.clashes_item */
extern T6 T25f21(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.move_cursors_forth */
extern void T25f91(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.move_all_cursors */
extern void T25f93(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].set_position */
extern void T64f10(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.move_cursors_after */
extern void T25f92(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].set_next_cursor */
extern void T64f11(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.internal_set_key_equality_tester */
extern void T25f90(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.slots_item */
extern T6 T25f22(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.hash_position */
extern T6 T25f33(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.key_storage_item */
extern T0* T25f27(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.search_position */
extern void T25f66(T0* C, T0* a1);
/* GEANT_FILESET.off */
extern T1 T390f27(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].off */
extern T1 T504f37(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_off */
extern T1 T504f29(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].forth */
extern void T504f48(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_forth */
extern void T504f52(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].add_traversing_cursor */
extern void T504f60(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].set_next_cursor */
extern void T543f6(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].remove_traversing_cursor */
extern void T504f59(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].set_position */
extern void T543f5(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].clashes_item */
extern T6 T504f30(T0* C, T6 a1);
/* GEANT_REPLACE_COMMAND.create_directory_for_pathname */
extern void T462f42(T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.file_system */
extern T0* T462f20(T0* C);
/* GEANT_REPLACE_COMMAND.windows_file_system */
extern T0* T462f27(T0* C);
/* GEANT_REPLACE_COMMAND.operating_system */
extern T0* T462f26(T0* C);
/* GEANT_FILESET.item_mapped_filename */
extern T0* T390f26(T0* C);
/* GEANT_FILESET_ENTRY.mapped_filename_converted */
extern T0* T545f7(T0* C);
/* GEANT_FILESET_ENTRY.unix_file_system */
extern T0* T545f9(T0* C);
/* GEANT_FILESET_ENTRY.file_system */
extern T0* T545f8(T0* C);
/* GEANT_FILESET_ENTRY.windows_file_system */
extern T0* T545f11(T0* C);
/* GEANT_FILESET_ENTRY.operating_system */
extern T0* T545f10(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_for_iteration */
extern T0* T504f18(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_item */
extern T0* T504f20(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_storage_item */
extern T0* T504f22(T0* C, T6 a1);
/* GEANT_FILESET.item_filename */
extern T0* T390f25(T0* C);
/* GEANT_FILESET_ENTRY.filename_converted */
extern T0* T545f6(T0* C);
/* GEANT_REPLACE_COMMAND.unix_file_system */
extern T0* T462f19(T0* C);
/* GEANT_FILESET.is_in_gobo_31_format */
extern T1 T390f21(T0* C);
/* GEANT_FILESET.after */
extern T1 T390f20(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].after */
extern T1 T504f17(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_after */
extern T1 T504f19(T0* C, T0* a1);
/* GEANT_FILESET.start */
extern void T390f49(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].start */
extern void T504f47(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_start */
extern void T504f51(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].is_empty */
extern T1 T504f28(T0* C);
/* GEANT_FILESET.execute */
extern void T390f48(T0* C);
/* GEANT_FILESET.remove_fileset_entry */
extern void T390f54(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].remove */
extern void T504f50(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].remove_position */
extern void T504f58(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_storage_put */
extern void T504f67(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_storage_put */
extern void T504f54(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].clashes_put */
extern void T504f56(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].slots_put */
extern void T504f57(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].move_cursors_forth */
extern void T504f66(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].move_all_cursors */
extern void T504f69(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].move_cursors_after */
extern void T504f68(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].internal_set_key_equality_tester */
extern void T504f65(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_equality_tester */
extern T0* T504f34(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].slots_item */
extern T6 T504f26(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].hash_position */
extern T6 T504f24(T0* C, T0* a1);
/* GEANT_FILESET_ENTRY.hash_code */
extern T6 T545f3(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_storage_item */
extern T0* T504f35(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].search_position */
extern void T504f53(T0* C, T0* a1);
/* KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY].test */
extern T1 T542f1(T0* C, T0* a1, T0* a2);
/* GEANT_FILESET_ENTRY.is_equal */
extern T1 T545f4(T0* C, T0* a1);
/* GEANT_FILESET_ENTRY.string_ */
extern T0* T545f5(T0* C);
/* GEANT_FILESET_ENTRY.make */
extern T0* T545c12(T0* a1, T0* a2);
/* DS_HASH_SET_CURSOR [STRING_8].forth */
extern void T547f8(T0* C);
/* DS_HASH_SET [STRING_8].cursor_forth */
extern void T506f54(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].add_traversing_cursor */
extern void T506f56(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_next_cursor */
extern void T547f10(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].remove_traversing_cursor */
extern void T506f55(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_position */
extern void T547f9(T0* C, T6 a1);
/* GEANT_FILESET.add_fileset_entry_if_necessary */
extern void T390f53(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].force_last */
extern void T504f49(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].resize */
extern void T504f55(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].clashes_resize */
extern void T504f64(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_storage_resize */
extern void T504f63(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_storage_resize */
extern void T504f62(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].resize */
extern T0* T544f2(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].slots_resize */
extern void T504f61(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].new_capacity */
extern T6 T504f23(T0* C, T6 a1);
/* GEANT_FILESET.is_file_outofdate */
extern T1 T390f29(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.file_time_stamp */
extern T6 T53f32(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.time_stamp */
extern T6 T55f40(T0* C);
/* KL_TEXT_INPUT_FILE.date */
extern T6 T55f42(T0* C);
/* UNIX_FILE_INFO.date */
extern T6 T87f8(T0* C);
/* KL_UNIX_FILE_SYSTEM.file_time_stamp */
extern T6 T54f30(T0* C, T0* a1);
/* GEANT_MAP.mapped_filename */
extern T0* T501f8(T0* C, T0* a1);
/* UC_UTF8_STRING.remove_tail */
extern void T205f90(T0* C, T6 a1);
/* STRING_8.remove_tail */
extern void T17f59(T0* C, T6 a1);
/* UC_UTF8_STRING.remove_head */
extern void T205f89(T0* C, T6 a1);
/* STRING_8.remove_head */
extern void T17f58(T0* C, T6 a1);
/* GEANT_MAP.glob_postfix */
extern T0* T501f16(T0* C, T0* a1);
/* GEANT_MAP.glob_prefix */
extern T0* T501f15(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.replace_all */
extern T0* T565f231(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_replace_all_to_string */
extern void T565f305(T0* C, T0* a1, T0* a2);
/* RX_PCRE_REGULAR_EXPRESSION.match_unbounded_substring */
extern void T565f319(T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_substring */
extern void T565f317(T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_it */
extern void T565f331(T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_start */
extern T1 T565f151(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_internal */
extern T6 T565f233(T0* C, T6 a1, T1 a2, T1 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_type */
extern T6 T565f297(T0* C, T6 a1, T6 a2, T6 a3, T1 a4);
/* RX_PCRE_REGULAR_EXPRESSION.match_not_repeated_characters */
extern T6 T565f296(T0* C, T6 a1, T6 a2, T6 a3, T1 a4);
/* RX_PCRE_REGULAR_EXPRESSION.infinity */
extern unsigned char ge449os10998;
extern T6 ge449ov10998;
extern T6 T565f62(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.platform */
extern T0* T565f195(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_characters */
extern T6 T565f295(T0* C, T6 a1, T6 a2, T6 a3, T1 a4);
/* RX_BYTE_CODE.character_item */
extern T6 T609f8(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_classes */
extern T6 T565f294(T0* C, T6 a1);
/* RX_BYTE_CODE.character_set_has */
extern T1 T609f10(T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_refs */
extern T6 T565f293(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_ref */
extern T6 T565f299(T0* C, T6 a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.space_set */
extern unsigned char ge455os11165;
extern T0* ge455ov11165;
extern T0* T565f152(T0* C);
/* RX_CHARACTER_SET.make */
extern T0* T610c5(T0* a1);
/* RX_CHARACTER_SET.add_string */
extern void T610f10(T0* C, T0* a1);
/* RX_CHARACTER_SET.add_character */
extern void T610f9(T0* C, T6 a1);
/* RX_CHARACTER_SET.make_empty */
extern void T610f4(T0* C);
/* RX_CHARACTER_SET.make_empty */
extern T0* T610c4(void);
/* KL_SPECIAL_ROUTINES [BOOLEAN].make_filled */
extern T0* T158f3(T0* C, T1 a1, T6 a2);
/* RX_CHARACTER_SET.special_boolean_ */
extern unsigned char ge127os2177;
extern T0* ge127ov2177;
extern T0* T610f3(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.digit_set */
extern unsigned char ge455os11157;
extern T0* ge455ov11157;
extern T0* T565f168(T0* C);
/* RX_CHARACTER_SET.has */
extern T1 T610f2(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_ims_options */
extern void T565f329(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_dotall */
extern T1 T565f87(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_multiline */
extern T1 T565f86(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_caseless */
extern T1 T565f85(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_match_count */
extern void T565f338(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_next_start */
extern void T565f337(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_recursive */
extern T6 T565f292(T0* C, T6 a1, T1 a2, T1 a3);
/* RX_BYTE_CODE.integer_item */
extern T6 T609f11(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.next_matching_alternate */
extern T6 T565f290(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_additional_bracket */
extern T6 T565f271(T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.opcode_item */
extern T6 T609f7(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].aliased_resized_area_with_default */
extern T0* T65f5(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].aliased_resized_area_with_default */
extern T0* T63f6(T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.special_integer_ */
extern T0* T565f56(T0* C);
/* RX_CASE_MAPPING.flip_case */
extern T6 T611f4(T0* C, T6 a1);
/* RX_CASE_MAPPING.to_lower */
extern T6 T611f3(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_replacement_to_string */
extern void T565f318(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.append_code */
extern void T205f91(T0* C, T10 a1);
/* UC_UTF8_STRING.append_item_code */
extern void T205f92(T0* C, T6 a1);
/* STRING_8.append_code */
extern void T17f60(T0* C, T10 a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_captured_substring_to_string */
extern void T565f332(T0* C, T0* a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.captured_end_position */
extern T6 T565f55(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.captured_start_position */
extern T6 T565f54(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.string_ */
extern T0* T565f57(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.has_matched */
extern T1 T565f72(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.match */
extern void T565f304(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_compiled */
extern T1 T565f149(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.compile */
extern void T565f301(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.compile */
extern void T565f301p1(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_startline */
extern void T565f316(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.has_startline */
extern T1 T565f230(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.first_significant_code */
extern T6 T565f190(T0* C, T6 a1, T6 a2, T1 a3);
/* RX_PCRE_REGULAR_EXPRESSION.find_firstchar */
extern T6 T565f229(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_anchored */
extern void T565f315(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.can_anchored */
extern T1 T565f228(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.ims_options */
extern T6 T565f84(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_option_dotall */
extern T6 T565f133(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_option_multiline */
extern T6 T565f131(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_option_caseless */
extern T6 T565f129(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.compile_regexp */
extern void T565f314(T0* C, T6 a1, T1 a2, T1 a3, T6 a4);
/* RX_BYTE_CODE.set_count */
extern void T609f18(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.find_fixed_code_length */
extern T6 T565f67(T0* C, T6 a1);
/* RX_BYTE_CODE.put_integer */
extern void T609f17(T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.compile_branch */
extern void T565f330(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.meta_set */
extern unsigned char ge455os11166;
extern T0* ge455ov11166;
extern T0* T565f148(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.maxlit */
extern unsigned char ge449os10999;
extern T6 ge449ov10999;
extern T6 T565f147(T0* C);
/* RX_BYTE_CODE.append_character */
extern void T609f19(T0* C, T6 a1);
/* RX_BYTE_CODE.put_character */
extern void T609f25(T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.resize_byte_code */
extern void T609f24(T0* C, T6 a1);
/* RX_BYTE_CODE.special_integer_ */
extern T0* T609f9(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.scan_escape */
extern T6 T565f142(T0* C, T6 a1, T1 a2);
/* RX_PCRE_REGULAR_EXPRESSION.scan_hex_number */
extern T6 T565f223(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.xdigit_set */
extern unsigned char ge455os11159;
extern T0* ge455ov11159;
extern T0* T565f245(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.scan_octal_number */
extern T6 T565f222(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.escape_character */
extern T6 T565f218(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.to_option_ims */
extern T6 T565f136(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_ichanged */
extern void T565f328(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.unset_option_dotall */
extern T6 T565f134(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.unset_option_multiline */
extern T6 T565f132(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.unset_option_caseless */
extern T6 T565f130(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.scan_decimal_number */
extern T6 T565f111(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.compile_repeats */
extern void T565f335(T0* C, T6 a1, T6 a2, T6 a3, T6 a4, T6 a5);
/* RX_BYTE_CODE.append_subcopy */
extern void T609f23(T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.put_opcode */
extern void T609f22(T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.move_right */
extern void T609f21(T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.compile_single_repeat */
extern void T565f336(T0* C, T6 a1, T6 a2, T6 a3, T6 a4, T6 a5, T6 a6);
/* RX_PCRE_REGULAR_EXPRESSION.compile_character_class */
extern void T565f334(T0* C);
/* RX_BYTE_CODE.append_character_set */
extern void T609f20(T0* C, T0* a1, T1 a2);
/* RX_BYTE_CODE.resize_character_sets */
extern void T609f26(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].aliased_resized_area_with_default */
extern T0* T158f4(T0* C, T0* a1, T1 a2, T6 a3);
/* SPECIAL [BOOLEAN].aliased_resized_area_with_default */
extern T0* T155f6(T0* C, T1 a1, T6 a2);
/* RX_BYTE_CODE.special_boolean_ */
extern T0* T609f12(T0* C);
/* RX_CHARACTER_SET.add_set */
extern void T610f8(T0* C, T0* a1);
/* RX_CHARACTER_SET.add_negated_set */
extern void T610f7(T0* C, T0* a1);
/* ARRAY [RX_CHARACTER_SET].item */
extern T0* T614f4(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.class_sets */
extern unsigned char ge455os11168;
extern T0* ge455ov11168;
extern T0* T565f160(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.default_word_set */
extern unsigned char ge455os11153;
extern T0* ge455ov11153;
extern T0* T565f78(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.punct_set */
extern unsigned char ge455os11163;
extern T0* ge455ov11163;
extern T0* T565f244(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.print_set */
extern unsigned char ge455os11162;
extern T0* ge455ov11162;
extern T0* T565f243(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.graph_set */
extern unsigned char ge455os11161;
extern T0* ge455ov11161;
extern T0* T565f242(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.cntrl_set */
extern unsigned char ge455os11160;
extern T0* ge455ov11160;
extern T0* T565f241(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.ascii_set */
extern unsigned char ge455os11164;
extern T0* ge455ov11164;
extern T0* T565f240(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.alnum_set */
extern unsigned char ge455os11158;
extern T0* ge455ov11158;
extern T0* T565f239(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.upper_set */
extern unsigned char ge455os11154;
extern T0* ge455ov11154;
extern T0* T565f238(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.lower_set */
extern unsigned char ge455os11155;
extern T0* ge455ov11155;
extern T0* T565f237(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.alpha_set */
extern unsigned char ge455os11156;
extern T0* ge455ov11156;
extern T0* T565f235(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.check_posix_name */
extern T6 T565f158(T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.class_names */
extern unsigned char ge455os11167;
extern T0* ge455ov11167;
extern T0* T565f236(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.check_posix_syntax */
extern T6 T565f156(T0* C, T6 a1);
/* RX_CHARACTER_SET.wipe_out */
extern void T610f6(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.actual_set */
extern unsigned char ge449os10997;
extern T0* ge449ov10997;
extern T0* T565f153(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.compile_counted_repeats */
extern T1 T565f89(T0* C, T6 a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.scan_comment */
extern void T565f333(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_undef */
extern T1 T565f64(T0* C, T6 a1);
/* RX_BYTE_CODE.append_integer */
extern void T609f16(T0* C, T6 a1);
/* RX_BYTE_CODE.append_opcode */
extern void T609f15(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_error */
extern void T565f313(T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.set_default_internal_options */
extern void T565f312(T0* C);
/* RX_BYTE_CODE.wipe_out */
extern void T609f14(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.wipe_out */
extern void T565f311(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.wipe_out */
extern void T565f311p1(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.make */
extern T0* T565c300(void);
/* KL_SPECIAL_ROUTINES [INTEGER_32].make_filled */
extern T0* T65f4(T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.make */
extern void T565f300p1(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_default_options */
extern void T565f310(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_strict */
extern void T565f327(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_greedy */
extern void T565f326(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_eol */
extern void T565f325(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_bol */
extern void T565f324(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_dollar_endonly */
extern void T565f323(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_empty_allowed */
extern void T565f322(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_extended */
extern void T565f321(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_dotall */
extern void T565f320(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_multiline */
extern void T565f303(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_caseless */
extern void T565f302(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_word_set */
extern void T565f309(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_character_case_mapping */
extern void T565f308(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.default_character_case_mapping */
extern unsigned char ge455os11152;
extern T0* ge455ov11152;
extern T0* T565f77(T0* C);
/* RX_CASE_MAPPING.make */
extern T0* T611c6(T0* a1, T0* a2);
/* RX_CASE_MAPPING.add */
extern void T611f8(T0* C, T0* a1, T0* a2);
/* RX_CASE_MAPPING.make_default */
extern void T611f7(T0* C);
/* RX_CASE_MAPPING.clear */
extern void T611f9(T0* C);
/* RX_CASE_MAPPING.special_integer_ */
extern T0* T611f5(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.reset */
extern void T565f307(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.reset */
extern void T565f307p1(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.empty_pattern_buffer */
extern unsigned char ge449os10996;
extern T0* ge449ov10996;
extern T0* T565f76(T0* C);
/* RX_BYTE_CODE.make */
extern T0* T609c13(T6 a1);
/* GEANT_MAP.type_attribute_value_regexp */
extern unsigned char ge88os9526;
extern T0* ge88ov9526;
extern T0* T501f12(T0* C);
/* GEANT_MAP.type_attribute_value_merge */
extern unsigned char ge88os9524;
extern T0* ge88ov9524;
extern T0* T501f11(T0* C);
/* GEANT_MAP.unix_file_system */
extern T0* T501f14(T0* C);
/* GEANT_MAP.type_attribute_value_flat */
extern unsigned char ge88os9523;
extern T0* ge88ov9523;
extern T0* T501f10(T0* C);
/* GEANT_MAP.string_ */
extern T0* T501f9(T0* C);
/* GEANT_MAP.is_executable */
extern T1 T501f7(T0* C);
/* GEANT_MAP.type_attribute_value_glob */
extern unsigned char ge88os9525;
extern T0* ge88ov9525;
extern T0* T501f13(T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].item */
extern T0* T547f4(T0* C);
/* DS_HASH_SET [STRING_8].cursor_item */
extern T0* T506f30(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].after */
extern T1 T547f5(T0* C);
/* DS_HASH_SET [STRING_8].cursor_after */
extern T1 T506f29(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].start */
extern void T547f7(T0* C);
/* DS_HASH_SET [STRING_8].cursor_start */
extern void T506f53(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].cursor_off */
extern T1 T506f34(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].is_empty */
extern T1 T506f33(T0* C);
/* GEANT_FILESET.scan_internal */
extern void T390f52(T0* C, T0* a1);
/* KL_DIRECTORY.close */
extern void T489f44(T0* C);
/* LX_DFA_WILDCARD.recognizes */
extern T1 T508f12(T0* C, T0* a1);
/* LX_DFA_WILDCARD.longest_end_position */
extern T6 T508f13(T0* C, T0* a1, T6 a2);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_readable */
extern T1 T53f31(T0* C, T0* a1);
/* KL_DIRECTORY.is_readable */
extern T1 T489f29(T0* C);
/* KL_DIRECTORY.old_is_readable */
extern T1 T489f18(T0* C);
/* KL_DIRECTORY.eif_dir_is_readable */
extern T1 T489f27(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.is_directory_readable */
extern T1 T54f29(T0* C, T0* a1);
/* GEANT_FILESET.string_ */
extern T0* T390f28(T0* C);
/* KL_DIRECTORY.read_entry */
extern void T489f43(T0* C);
/* KL_DIRECTORY.readentry */
extern void T489f47(T0* C);
/* KL_DIRECTORY.dir_next */
extern T0* T489f23(T0* C, T14 a1);
/* KL_DIRECTORY.old_end_of_input */
extern T1 T489f20(T0* C);
/* KL_DIRECTORY.is_open_read */
extern T1 T489f14(T0* C);
/* KL_DIRECTORY.open_read */
extern void T489f42(T0* C);
/* KL_DIRECTORY.old_open_read */
extern void T489f46(T0* C);
/* KL_DIRECTORY.dir_open */
extern T14 T489f21(T0* C, T14 a1);
/* GEANT_FILESET.unix_file_system */
extern T0* T390f24(T0* C);
/* GEANT_FILESET.file_system */
extern T0* T390f23(T0* C);
/* GEANT_FILESET.windows_file_system */
extern T0* T390f32(T0* C);
/* GEANT_FILESET.operating_system */
extern T0* T390f31(T0* C);
/* GEANT_FILESET.is_executable */
extern T1 T390f19(T0* C);
/* GEANT_FILESET.is_in_gobo_32_format */
extern T1 T390f22(T0* C);
/* GEANT_REPLACE_COMMAND.execute_replace */
extern void T462f41(T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_COMMAND.execute_replace_token */
extern void T462f45(T0* C, T0* a1, T0* a2);
/* KL_TEXT_OUTPUT_FILE.close */
extern void T517f26(T0* C);
/* KL_STRING_ROUTINES.replaced_first_substring */
extern T0* T76f16(T0* C, T0* a1, T0* a2, T0* a3);
/* KL_STRING_ROUTINES.substring_index */
extern T6 T76f17(T0* C, T0* a1, T0* a2, T6 a3);
/* KL_STRING_ROUTINES.platform */
extern T0* T76f18(T0* C);
/* STRING_8.substring_index */
extern T6 T17f34(T0* C, T0* a1, T6 a2);
/* STRING_SEARCHER.substring_index */
extern T6 T675f2(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* STRING_SEARCHER.substring_index_with_deltas */
extern T6 T675f3(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* STRING_SEARCHER.internal_initialize_deltas */
extern void T675f6(T0* C, T0* a1, T6 a2, T0* a3);
/* STRING_8.string_searcher */
extern unsigned char ge2385os1243;
extern T0* ge2385ov1243;
extern T0* T17f35(T0* C);
/* STRING_SEARCHER.make */
extern T0* T675c5(void);
/* KL_STRING_ROUTINES.replaced_all_substrings */
extern T0* T76f15(T0* C, T0* a1, T0* a2, T0* a3);
/* GEANT_REPLACE_COMMAND.string_ */
extern T0* T462f25(T0* C);
/* UC_UTF8_STRING.has */
extern T1 T205f55(T0* C, T2 a1);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T517f24(T0* C);
/* KL_TEXT_OUTPUT_FILE.is_closed */
extern T1 T517f13(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_write */
extern void T517f30(T0* C);
/* KL_TEXT_OUTPUT_FILE.default_pointer */
extern T14 T517f18(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T517f30p1(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_open */
extern T14 T517f19(T0* C, T14 a1, T6 a2);
/* KL_TEXT_OUTPUT_FILE.reset */
extern void T517f36(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.make */
extern void T517f21(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.make */
extern T0* T517c21(T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_make */
extern void T517f27(T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.tmp_output_file */
extern unsigned char ge42os8845;
extern T0* ge42ov8845;
extern T0* T462f24(T0* C);
/* KL_TEXT_INPUT_FILE.read_string */
extern void T55f68(T0* C, T6 a1);
/* KL_TEXT_INPUT_FILE.read_to_string */
extern T6 T55f33(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
extern unsigned char ge156os4177;
extern T0* ge156ov4177;
extern T0* T55f38(T0* C);
/* KL_TEXT_INPUT_FILE.any_ */
extern T0* T55f35(T0* C);
/* STRING_8.set_internal_hash_code */
extern void T17f57(T0* C, T6 a1);
/* KL_TEXT_INPUT_FILE.old_read_to_string */
extern T6 T55f37(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.file_gss */
extern T6 T55f39(T0* C, T14 a1, T14 a2, T6 a3);
/* SPECIAL [CHARACTER_8].item_address */
extern T14 T15f6(T0* C, T6 a1);
/* GEANT_REPLACE_COMMAND.tmp_input_file */
extern unsigned char ge42os8844;
extern T0* ge42ov8844;
extern T0* T462f22(T0* C);
/* GEANT_REPLACE_COMMAND.execute_replace_regexp */
extern void T462f44(T0* C, T0* a1, T0* a2);
/* RX_PCRE_REGULAR_EXPRESSION.replace */
extern T0* T565f232(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_replace_to_string */
extern void T565f306(T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_COMMAND.execute_replace_variable_pattern */
extern void T462f43(T0* C, T0* a1, T0* a2);
/* ARRAY [GEANT_VARIABLES].item */
extern T0* T254f4(T0* C, T6 a1);
/* GEANT_PROJECT.aggregated_variables_array */
extern T0* T22f27(T0* C);
/* ARRAY [GEANT_VARIABLES].put */
extern void T254f8(T0* C, T0* a1, T6 a2);
/* ARRAY [GEANT_VARIABLES].make_filled */
extern T0* T254c7(T0* a1, T6 a2, T6 a3);
/* ARRAY [GEANT_VARIABLES].make_filled_area */
extern void T254f9(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_VARIABLES].make_filled */
extern T0* T183c7(T0* a1, T6 a2);
/* SPECIAL [GEANT_VARIABLES].fill_with */
extern void T183f8(T0* C, T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.occurrences */
extern T6 T205f54(T0* C, T2 a1);
/* UC_UTF8_STRING.code_occurrences */
extern T6 T205f56(T0* C, T6 a1);
/* STRING_8.occurrences */
extern T6 T17f33(T0* C, T2 a1);
/* GEANT_REPLACE_COMMAND.is_file_to_file_executable */
extern T1 T462f16(T0* C);
/* GEANT_REPLACE_COMMAND.is_replace_executable */
extern T1 T462f18(T0* C);
/* GEANT_REPLACE_TASK.exit_application */
extern void T316f41(T0* C, T6 a1, T0* a2);
/* GEANT_REPLACE_TASK.exceptions */
extern T0* T316f27(T0* C);
/* GEANT_REPLACE_TASK.std */
extern T0* T316f26(T0* C);
/* GEANT_REPLACE_TASK.log_messages */
extern void T316f42(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.dir_attribute_name */
extern T0* T316f25(T0* C);
/* GEANT_REPLACE_TASK.file_system */
extern T0* T316f24(T0* C);
/* GEANT_REPLACE_TASK.unix_file_system */
extern T0* T316f30(T0* C);
/* GEANT_REPLACE_TASK.windows_file_system */
extern T0* T316f29(T0* C);
/* GEANT_REPLACE_TASK.operating_system */
extern T0* T316f28(T0* C);
/* GEANT_INPUT_TASK.execute */
extern void T314f41(T0* C);
/* GEANT_INPUT_COMMAND.execute */
extern void T459f23(T0* C);
/* GEANT_PROJECT.set_variable_value */
extern void T22f51(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT.is_local_variable */
extern T1 T22f26(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.matches */
extern T1 T565f58(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].has */
extern T1 T238f9(T0* C, T0* a1);
/* GEANT_INPUT_COMMAND.string_ */
extern T0* T459f14(T0* C);
/* KL_STDIN_FILE.read_line */
extern void T567f17(T0* C);
/* KL_STDIN_FILE.unread_character */
extern void T567f20(T0* C, T2 a1);
/* detachable KL_LINKABLE [CHARACTER_8].put_right */
extern void T89f4(T0* C, T0* a1);
/* detachable KL_LINKABLE [CHARACTER_8].make */
extern T0* T89c3(T2 a1);
/* KL_STDIN_FILE.read_character */
extern void T567f19(T0* C);
/* KL_STDIN_FILE.old_read_character */
extern void T567f23(T0* C);
/* KL_STDIN_FILE.console_readchar */
extern T2 T567f13(T0* C, T14 a1);
/* KL_STDIN_FILE.old_end_of_file */
extern T1 T567f8(T0* C);
/* KL_STDIN_FILE.console_eof */
extern T1 T567f14(T0* C, T14 a1);
/* KL_STDIN_FILE.string_ */
extern T0* T567f10(T0* C);
/* GEANT_INPUT_COMMAND.input */
extern unsigned char ge167os2872;
extern T0* ge167ov2872;
extern T0* T459f13(T0* C);
/* KL_STDIN_FILE.make */
extern T0* T567c15(void);
/* KL_STDIN_FILE.make_open_stdin */
extern void T567f18(T0* C, T0* a1);
/* KL_STDIN_FILE.set_read_mode */
extern void T567f22(T0* C);
/* KL_STDIN_FILE.console_def */
extern T14 T567f9(T0* C, T6 a1);
/* KL_STDIN_FILE.old_make */
extern void T567f21(T0* C, T0* a1);
/* GEANT_INPUT_COMMAND.output */
extern T0* T459f12(T0* C);
/* DS_LINKED_LIST [STRING_8].set_equality_tester */
extern void T238f18(T0* C, T0* a1);
/* GEANT_INPUT_TASK.exit_application */
extern void T314f42(T0* C, T6 a1, T0* a2);
/* GEANT_INPUT_TASK.exceptions */
extern T0* T314f28(T0* C);
/* GEANT_INPUT_TASK.log_messages */
extern void T314f43(T0* C, T0* a1);
/* GEANT_INPUT_TASK.dir_attribute_name */
extern T0* T314f27(T0* C);
/* GEANT_INPUT_TASK.file_system */
extern T0* T314f26(T0* C);
/* GEANT_INPUT_TASK.unix_file_system */
extern T0* T314f31(T0* C);
/* GEANT_INPUT_TASK.windows_file_system */
extern T0* T314f30(T0* C);
/* GEANT_INPUT_TASK.operating_system */
extern T0* T314f29(T0* C);
/* GEANT_AVAILABLE_TASK.execute */
extern void T312f31(T0* C);
/* GEANT_AVAILABLE_COMMAND.execute */
extern void T456f19(T0* C);
/* GEANT_STRING_PROPERTY.non_empty_value_or_else */
extern T0* T386f7(T0* C, T0* a1);
/* GEANT_STRING_PROPERTY.string_value */
extern T0* T386f4(T0* C);
/* GEANT_STRING_PROPERTY.is_defined */
extern T1 T386f5(T0* C);
/* GEANT_STRING_PROPERTY.value */
extern T0* T386f6(T0* C);
/* GEANT_AVAILABLE_TASK.exit_application */
extern void T312f32(T0* C, T6 a1, T0* a2);
/* GEANT_AVAILABLE_TASK.exceptions */
extern T0* T312f17(T0* C);
/* GEANT_AVAILABLE_TASK.std */
extern T0* T312f16(T0* C);
/* GEANT_AVAILABLE_TASK.log_messages */
extern void T312f33(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.project_variables_resolver */
extern T0* T312f10(T0* C);
/* GEANT_AVAILABLE_TASK.dir_attribute_name */
extern T0* T312f15(T0* C);
/* GEANT_AVAILABLE_TASK.file_system */
extern T0* T312f14(T0* C);
/* GEANT_AVAILABLE_TASK.unix_file_system */
extern T0* T312f20(T0* C);
/* GEANT_AVAILABLE_TASK.windows_file_system */
extern T0* T312f19(T0* C);
/* GEANT_AVAILABLE_TASK.operating_system */
extern T0* T312f18(T0* C);
/* GEANT_PRECURSOR_TASK.execute */
extern void T310f39(T0* C);
/* GEANT_PRECURSOR_COMMAND.execute */
extern void T453f11(T0* C);
/* GEANT_PRECURSOR_TASK.dir_attribute_name */
extern T0* T310f24(T0* C);
/* GEANT_PRECURSOR_TASK.file_system */
extern T0* T310f23(T0* C);
/* GEANT_PRECURSOR_TASK.unix_file_system */
extern T0* T310f27(T0* C);
/* GEANT_PRECURSOR_TASK.windows_file_system */
extern T0* T310f26(T0* C);
/* GEANT_PRECURSOR_TASK.operating_system */
extern T0* T310f25(T0* C);
/* GEANT_EXIT_TASK.execute */
extern void T308f32(T0* C);
/* GEANT_EXIT_COMMAND.execute */
extern void T450f10(T0* C);
/* GEANT_EXIT_TASK.exit_application */
extern void T308f33(T0* C, T6 a1, T0* a2);
/* GEANT_EXIT_TASK.exceptions */
extern T0* T308f19(T0* C);
/* GEANT_EXIT_TASK.std */
extern T0* T308f18(T0* C);
/* GEANT_EXIT_TASK.log_messages */
extern void T308f34(T0* C, T0* a1);
/* GEANT_EXIT_TASK.dir_attribute_name */
extern T0* T308f17(T0* C);
/* GEANT_EXIT_TASK.file_system */
extern T0* T308f16(T0* C);
/* GEANT_EXIT_TASK.unix_file_system */
extern T0* T308f22(T0* C);
/* GEANT_EXIT_TASK.windows_file_system */
extern T0* T308f21(T0* C);
/* GEANT_EXIT_TASK.operating_system */
extern T0* T308f20(T0* C);
/* GEANT_OUTOFDATE_TASK.execute */
extern void T306f37(T0* C);
/* GEANT_OUTOFDATE_COMMAND.execute */
extern void T447f28(T0* C);
/* GEANT_FILESET.go_after */
extern void T390f56(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].go_after */
extern void T504f70(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_go_after */
extern void T504f71(T0* C, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.is_file_outofdate */
extern T1 T447f17(T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_COMMAND.unix_file_system */
extern T0* T447f15(T0* C);
/* GEANT_OUTOFDATE_COMMAND.file_system */
extern T0* T447f14(T0* C);
/* GEANT_OUTOFDATE_COMMAND.windows_file_system */
extern T0* T447f19(T0* C);
/* GEANT_OUTOFDATE_COMMAND.operating_system */
extern T0* T447f18(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_file_executable */
extern T1 T447f12(T0* C);
/* GEANT_OUTOFDATE_TASK.exit_application */
extern void T306f38(T0* C, T6 a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.exceptions */
extern T0* T306f24(T0* C);
/* GEANT_OUTOFDATE_TASK.std */
extern T0* T306f23(T0* C);
/* GEANT_OUTOFDATE_TASK.log_messages */
extern void T306f39(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.dir_attribute_name */
extern T0* T306f22(T0* C);
/* GEANT_OUTOFDATE_TASK.file_system */
extern T0* T306f21(T0* C);
/* GEANT_OUTOFDATE_TASK.unix_file_system */
extern T0* T306f27(T0* C);
/* GEANT_OUTOFDATE_TASK.windows_file_system */
extern T0* T306f26(T0* C);
/* GEANT_OUTOFDATE_TASK.operating_system */
extern T0* T306f25(T0* C);
/* GEANT_XSLT_TASK.execute */
extern void T304f50(T0* C);
/* GEANT_XSLT_COMMAND.execute */
extern void T443f41(T0* C);
/* GEANT_XSLT_COMMAND.execute_gexslt */
extern void T443f45(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_shell */
extern void T443f46(T0* C, T0* a1);
/* DP_SHELL_COMMAND.execute */
extern void T560f13(T0* C);
/* DP_SHELL_COMMAND.operating_system */
extern T0* T560f6(T0* C);
/* DP_SHELL_COMMAND.system */
extern void T560f14(T0* C, T0* a1);
/* DP_SHELL_COMMAND.system_call */
extern T6 T560f9(T0* C, T14 a1);
/* C_STRING.item */
extern T14 T188f4(T0* C);
/* C_STRING.make */
extern T0* T188c9(T0* a1);
/* C_STRING.set_string */
extern void T188f10(T0* C, T0* a1);
/* C_STRING.set_substring */
extern void T188f11(T0* C, T0* a1, T6 a2, T6 a3);
/* MANAGED_POINTER.put_natural_8 */
extern void T261f12(T0* C, T8 a1, T6 a2);
/* POINTER.memory_copy */
extern void T14f12(T14* C, T14 a1, T6 a2);
/* POINTER.c_memcpy */
extern void T14f14(T14* C, T14 a1, T14 a2, T6 a3);
/* NATURAL_32.to_natural_8 */
extern T8 T10f11(T10* C);
/* MANAGED_POINTER.resize */
extern void T261f11(T0* C, T6 a1);
/* POINTER.memory_set */
extern void T14f11(T14* C, T6 a1, T6 a2);
/* POINTER.c_memset */
extern void T14f13(T14* C, T14 a1, T6 a2, T6 a3);
/* POINTER.memory_realloc */
extern T14 T14f6(T14* C, T6 a1);
/* POINTER.c_realloc */
extern T14 T14f7(T14* C, T14 a1, T6 a2);
/* DP_SHELL_COMMAND.default_shell */
extern unsigned char ge2521os5289;
extern T0* ge2521ov5289;
extern T0* T560f8(T0* C);
/* DP_SHELL_COMMAND.get */
extern T0* T560f10(T0* C, T0* a1);
/* DP_SHELL_COMMAND.eif_getenv */
extern T14 T560f11(T0* C, T14 a1);
/* DP_SHELL_COMMAND.make */
extern T0* T560c12(T0* a1);
/* DP_SHELL_COMMAND.string_ */
extern T0* T560f7(T0* C);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].item */
extern T0* T444f9(T0* C, T6 a1);
/* GEANT_XSLT_COMMAND.string_ */
extern T0* T443f23(T0* C);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.set_variables */
extern void T564f5(T0* C, T0* a1);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.make */
extern T0* T564c4(void);
/* GEANT_XSLT_COMMAND.execute_xsltproc */
extern void T443f44(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_xalan_java */
extern void T443f43(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_xalan_cpp */
extern void T443f42(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.is_file_outofdate */
extern T1 T443f22(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.put */
extern void T29f77(T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_COMMAND.unix_file_system */
extern T0* T443f21(T0* C);
/* GEANT_XSLT_COMMAND.file_system */
extern T0* T443f20(T0* C);
/* GEANT_XSLT_COMMAND.windows_file_system */
extern T0* T443f25(T0* C);
/* GEANT_XSLT_COMMAND.operating_system */
extern T0* T443f24(T0* C);
/* GEANT_XSLT_TASK.exit_application */
extern void T304f51(T0* C, T6 a1, T0* a2);
/* GEANT_XSLT_TASK.exceptions */
extern T0* T304f37(T0* C);
/* GEANT_XSLT_TASK.log_messages */
extern void T304f52(T0* C, T0* a1);
/* GEANT_XSLT_TASK.dir_attribute_name */
extern T0* T304f36(T0* C);
/* GEANT_XSLT_TASK.file_system */
extern T0* T304f35(T0* C);
/* GEANT_XSLT_TASK.unix_file_system */
extern T0* T304f40(T0* C);
/* GEANT_XSLT_TASK.windows_file_system */
extern T0* T304f39(T0* C);
/* GEANT_XSLT_TASK.operating_system */
extern T0* T304f38(T0* C);
/* GEANT_SETENV_TASK.execute */
extern void T302f33(T0* C);
/* GEANT_SETENV_COMMAND.execute */
extern void T439f13(T0* C);
/* KL_EXECUTION_ENVIRONMENT.set_variable_value */
extern void T104f5(T0* C, T0* a1, T0* a2);
/* EXECUTION_ENVIRONMENT.put */
extern void T83f10(T0* C, T0* a1, T0* a2);
/* EXECUTION_ENVIRONMENT.eif_putenv */
extern T6 T83f7(T0* C, T14 a1);
/* HASH_TABLE [C_STRING, STRING_8].force */
extern void T676f26(T0* C, T0* a1, T0* a2);
/* HASH_TABLE [C_STRING, STRING_8].add_space */
extern void T676f28(T0* C);
/* HASH_TABLE [C_STRING, STRING_8].accommodate */
extern void T676f29(T0* C, T6 a1);
/* HASH_TABLE [C_STRING, STRING_8].set_deleted_marks */
extern void T676f32(T0* C, T0* a1);
/* HASH_TABLE [C_STRING, STRING_8].set_keys */
extern void T676f31(T0* C, T0* a1);
/* HASH_TABLE [C_STRING, STRING_8].set_content */
extern void T676f30(T0* C, T0* a1);
/* HASH_TABLE [C_STRING, STRING_8].put */
extern void T676f33(T0* C, T0* a1, T0* a2);
/* HASH_TABLE [C_STRING, STRING_8].set_conflict */
extern void T676f34(T0* C);
/* HASH_TABLE [C_STRING, STRING_8].found */
extern T1 T676f22(T0* C);
/* HASH_TABLE [C_STRING, STRING_8].occupied */
extern T1 T676f21(T0* C, T6 a1);
/* SPECIAL [STRING_8].is_default */
extern T1 T32f6(T0* C, T6 a1);
/* HASH_TABLE [C_STRING, STRING_8].empty_duplicate */
extern T0* T676f20(T0* C, T6 a1);
/* HASH_TABLE [C_STRING, STRING_8].make */
extern T0* T676c25(T6 a1);
/* SPECIAL [C_STRING].make */
extern T0* T686c3(T6 a1);
/* PRIMES.higher_prime */
extern T6 T685f1(T0* C, T6 a1);
/* PRIMES.is_prime */
extern T1 T685f3(T0* C, T6 a1);
/* PRIMES.default_create */
extern T0* T685c5(void);
/* HASH_TABLE [C_STRING, STRING_8].soon_full */
extern T1 T676f15(T0* C);
/* HASH_TABLE [C_STRING, STRING_8].not_found */
extern T1 T676f14(T0* C);
/* HASH_TABLE [C_STRING, STRING_8].internal_search */
extern void T676f27(T0* C, T0* a1);
/* HASH_TABLE [C_STRING, STRING_8].same_keys */
extern T1 T676f19(T0* C, T0* a1, T0* a2);
extern T1 T676f19oe1(T0* a1, T0* a2);
/* UC_UTF8_STRING.is_equal */
extern T1 T205f57(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.environ */
extern unsigned char ge2521os5300;
extern T0* ge2521ov5300;
extern T0* T83f6(T0* C);
/* GEANT_SETENV_COMMAND.execution_environment */
extern T0* T439f8(T0* C);
/* GEANT_SETENV_TASK.exit_application */
extern void T302f34(T0* C, T6 a1, T0* a2);
/* GEANT_SETENV_TASK.exceptions */
extern T0* T302f20(T0* C);
/* GEANT_SETENV_TASK.std */
extern T0* T302f19(T0* C);
/* GEANT_SETENV_TASK.log_messages */
extern void T302f35(T0* C, T0* a1);
/* GEANT_SETENV_TASK.dir_attribute_name */
extern T0* T302f18(T0* C);
/* GEANT_SETENV_TASK.file_system */
extern T0* T302f17(T0* C);
/* GEANT_SETENV_TASK.unix_file_system */
extern T0* T302f23(T0* C);
/* GEANT_SETENV_TASK.windows_file_system */
extern T0* T302f22(T0* C);
/* GEANT_SETENV_TASK.operating_system */
extern T0* T302f21(T0* C);
/* GEANT_MOVE_TASK.execute */
extern void T300f35(T0* C);
/* GEANT_MOVE_COMMAND.execute */
extern void T436f23(T0* C);
/* GEANT_MOVE_COMMAND.create_directory_for_pathname */
extern void T436f26(T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.file_system */
extern T0* T436f14(T0* C);
/* GEANT_MOVE_COMMAND.windows_file_system */
extern T0* T436f16(T0* C);
/* GEANT_MOVE_COMMAND.operating_system */
extern T0* T436f15(T0* C);
/* GEANT_MOVE_COMMAND.is_file_to_file_executable */
extern T1 T436f10(T0* C);
/* GEANT_MOVE_COMMAND.move_file */
extern void T436f25(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.same_physical_file */
extern T1 T53f33(T0* C, T0* a1, T0* a2);
/* KL_TEXT_INPUT_FILE.same_physical_file */
extern T1 T55f41(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.old_change_name */
extern void T55f72(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.file_rename */
extern void T55f74(T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.file_system */
extern T0* T55f46(T0* C);
/* KL_TEXT_INPUT_FILE.unix_file_system */
extern T0* T55f51(T0* C);
/* KL_TEXT_INPUT_FILE.windows_file_system */
extern T0* T55f50(T0* C);
/* KL_TEXT_INPUT_FILE.operating_system */
extern T0* T55f49(T0* C);
/* KL_TEXT_INPUT_FILE.count */
extern T6 T55f45(T0* C);
/* KL_TEXT_INPUT_FILE.old_count */
extern T6 T55f48(T0* C);
/* KL_TEXT_INPUT_FILE.file_size */
extern T6 T55f53(T0* C, T14 a1);
/* UNIX_FILE_INFO.size */
extern T6 T87f10(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_write */
extern T1 T55f52(T0* C);
/* KL_TEXT_INPUT_FILE.inode */
extern T6 T55f44(T0* C);
/* UNIX_FILE_INFO.inode */
extern T6 T87f9(T0* C);
/* KL_TEXT_INPUT_FILE.tmp_file1 */
extern unsigned char ge154os4197;
extern T0* ge154ov4197;
extern T0* T55f43(T0* C);
/* KL_UNIX_FILE_SYSTEM.same_physical_file */
extern T1 T54f31(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.rename_file */
extern void T53f44(T0* C, T0* a1, T0* a2);
/* KL_TEXT_INPUT_FILE.change_name */
extern void T55f71(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.rename_file */
extern void T54f40(T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_COMMAND.unix_file_system */
extern T0* T436f13(T0* C);
/* GEANT_MOVE_COMMAND.create_directory */
extern void T436f24(T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.is_file_to_directory_executable */
extern T1 T436f11(T0* C);
/* GEANT_MOVE_TASK.exit_application */
extern void T300f36(T0* C, T6 a1, T0* a2);
/* GEANT_MOVE_TASK.exceptions */
extern T0* T300f22(T0* C);
/* GEANT_MOVE_TASK.std */
extern T0* T300f21(T0* C);
/* GEANT_MOVE_TASK.log_messages */
extern void T300f37(T0* C, T0* a1);
/* GEANT_MOVE_TASK.dir_attribute_name */
extern T0* T300f20(T0* C);
/* GEANT_MOVE_TASK.file_system */
extern T0* T300f19(T0* C);
/* GEANT_MOVE_TASK.unix_file_system */
extern T0* T300f25(T0* C);
/* GEANT_MOVE_TASK.windows_file_system */
extern T0* T300f24(T0* C);
/* GEANT_MOVE_TASK.operating_system */
extern T0* T300f23(T0* C);
/* GEANT_COPY_TASK.execute */
extern void T298f40(T0* C);
/* GEANT_COPY_COMMAND.execute */
extern void T433f27(T0* C);
/* GEANT_COPY_COMMAND.create_directory_for_pathname */
extern void T433f30(T0* C, T0* a1);
/* GEANT_COPY_COMMAND.file_system */
extern T0* T433f16(T0* C);
/* GEANT_COPY_COMMAND.windows_file_system */
extern T0* T433f19(T0* C);
/* GEANT_COPY_COMMAND.operating_system */
extern T0* T433f18(T0* C);
/* GEANT_COPY_COMMAND.is_file_to_file_executable */
extern T1 T433f12(T0* C);
/* GEANT_COPY_COMMAND.copy_file */
extern void T433f29(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.copy_file */
extern void T53f43(T0* C, T0* a1, T0* a2);
/* KL_TEXT_INPUT_FILE.copy_file */
extern void T55f70(T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.close */
extern void T656f37(T0* C);
/* KL_BINARY_OUTPUT_FILE.close */
extern void T657f24(T0* C);
/* KL_BINARY_OUTPUT_FILE.put_string */
extern void T657f23(T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.old_put_string */
extern void T657f28(T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.file_ps */
extern void T657f30(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_BINARY_OUTPUT_FILE.string_ */
extern T0* T657f9(T0* C);
/* KL_BINARY_INPUT_FILE.read_string */
extern void T656f36(T0* C, T6 a1);
/* KL_BINARY_INPUT_FILE.read_to_string */
extern T6 T656f20(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_BINARY_INPUT_FILE.dummy_kl_character_buffer */
extern T0* T656f32(T0* C);
/* KL_BINARY_INPUT_FILE.any_ */
extern T0* T656f30(T0* C);
/* KL_BINARY_INPUT_FILE.old_read_to_string */
extern T6 T656f19(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_BINARY_INPUT_FILE.file_gss */
extern T6 T656f29(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_BINARY_INPUT_FILE.old_end_of_file */
extern T1 T656f18(T0* C);
/* KL_BINARY_INPUT_FILE.file_feof */
extern T1 T656f28(T0* C, T14 a1);
/* KL_BINARY_OUTPUT_FILE.is_open_write */
extern T1 T657f12(T0* C);
/* KL_BINARY_OUTPUT_FILE.old_is_open_write */
extern T1 T657f8(T0* C);
/* KL_BINARY_OUTPUT_FILE.open_write */
extern void T657f22(T0* C);
/* KL_BINARY_OUTPUT_FILE.is_closed */
extern T1 T657f13(T0* C);
/* KL_BINARY_OUTPUT_FILE.old_open_write */
extern void T657f27(T0* C);
/* KL_BINARY_OUTPUT_FILE.default_pointer */
extern T14 T657f18(T0* C);
/* KL_BINARY_OUTPUT_FILE.open_write */
extern void T657f27p1(T0* C);
/* KL_BINARY_OUTPUT_FILE.file_open */
extern T14 T657f19(T0* C, T14 a1, T6 a2);
/* KL_BINARY_OUTPUT_FILE.make */
extern T0* T657c20(T0* a1);
/* KL_BINARY_OUTPUT_FILE.old_make */
extern void T657f25(T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.is_open_read */
extern T1 T656f13(T0* C);
/* KL_BINARY_INPUT_FILE.old_is_open_read */
extern T1 T656f9(T0* C);
/* KL_BINARY_INPUT_FILE.open_read */
extern void T656f35(T0* C);
/* KL_BINARY_INPUT_FILE.is_closed */
extern T1 T656f17(T0* C);
/* KL_BINARY_INPUT_FILE.old_open_read */
extern void T656f40(T0* C);
/* KL_BINARY_INPUT_FILE.default_pointer */
extern T14 T656f24(T0* C);
/* KL_BINARY_INPUT_FILE.open_read */
extern void T656f40p1(T0* C);
/* KL_BINARY_INPUT_FILE.file_open */
extern T14 T656f25(T0* C, T14 a1, T6 a2);
/* KL_BINARY_INPUT_FILE.old_is_readable */
extern T1 T656f16(T0* C);
/* KL_BINARY_INPUT_FILE.buffered_file_info */
extern T0* T656f27(T0* C);
/* KL_BINARY_INPUT_FILE.set_buffer */
extern void T656f42(T0* C);
/* KL_BINARY_INPUT_FILE.old_exists */
extern T1 T656f15(T0* C);
/* KL_BINARY_INPUT_FILE.file_exists */
extern T1 T656f26(T0* C, T14 a1);
/* KL_BINARY_INPUT_FILE.make */
extern T0* T656c33(T0* a1);
/* KL_BINARY_INPUT_FILE.make */
extern void T656f33p1(T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.old_make */
extern void T656f38(T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.string_ */
extern T0* T656f10(T0* C);
/* KL_UNIX_FILE_SYSTEM.copy_file */
extern void T54f39(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.is_file_outofdate */
extern T1 T433f17(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.unix_file_system */
extern T0* T433f15(T0* C);
/* GEANT_COPY_COMMAND.create_directory */
extern void T433f28(T0* C, T0* a1);
/* GEANT_COPY_COMMAND.is_file_to_directory_executable */
extern T1 T433f13(T0* C);
/* GEANT_COPY_TASK.exit_application */
extern void T298f41(T0* C, T6 a1, T0* a2);
/* GEANT_COPY_TASK.exceptions */
extern T0* T298f27(T0* C);
/* GEANT_COPY_TASK.log_messages */
extern void T298f42(T0* C, T0* a1);
/* GEANT_COPY_TASK.dir_attribute_name */
extern T0* T298f26(T0* C);
/* GEANT_COPY_TASK.file_system */
extern T0* T298f25(T0* C);
/* GEANT_COPY_TASK.unix_file_system */
extern T0* T298f30(T0* C);
/* GEANT_COPY_TASK.windows_file_system */
extern T0* T298f29(T0* C);
/* GEANT_COPY_TASK.operating_system */
extern T0* T298f28(T0* C);
/* GEANT_DELETE_TASK.execute */
extern void T296f35(T0* C);
/* GEANT_DELETE_COMMAND.execute */
extern void T429f25(T0* C);
/* GEANT_DIRECTORYSET.forth */
extern void T430f31(T0* C);
/* GEANT_DIRECTORYSET.update_project_variables */
extern void T430f35(T0* C);
/* GEANT_DIRECTORYSET.item_directory_name */
extern T0* T430f14(T0* C);
/* GEANT_DIRECTORYSET.after */
extern T1 T430f13(T0* C);
/* GEANT_DIRECTORYSET.start */
extern void T430f30(T0* C);
/* GEANT_DIRECTORYSET.execute */
extern void T430f29(T0* C);
/* GEANT_DIRECTORYSET.remove_fileset_entry */
extern void T430f34(T0* C, T0* a1);
/* GEANT_DIRECTORYSET.add_fileset_entry_if_necessary */
extern void T430f33(T0* C, T0* a1);
/* GEANT_DIRECTORYSET.scan_internal */
extern void T430f32(T0* C, T0* a1);
/* GEANT_DIRECTORYSET.file_system */
extern T0* T430f18(T0* C);
/* GEANT_DIRECTORYSET.windows_file_system */
extern T0* T430f20(T0* C);
/* GEANT_DIRECTORYSET.operating_system */
extern T0* T430f19(T0* C);
/* GEANT_DIRECTORYSET.string_ */
extern T0* T430f17(T0* C);
/* GEANT_DIRECTORYSET.unix_file_system */
extern T0* T430f16(T0* C);
/* GEANT_DIRECTORYSET.is_executable */
extern T1 T430f15(T0* C);
/* GEANT_DELETE_COMMAND.is_directoryset_executable */
extern T1 T429f14(T0* C);
/* GEANT_DELETE_COMMAND.is_fileset_executable */
extern T1 T429f13(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.delete_file */
extern void T53f39(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.delete */
extern void T55f69(T0* C);
/* KL_TEXT_INPUT_FILE.old_delete */
extern void T55f73(T0* C);
/* KL_TEXT_INPUT_FILE.file_unlink */
extern void T55f75(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.delete_file */
extern void T54f35(T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.is_file_executable */
extern T1 T429f11(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.recursive_delete_directory */
extern void T53f41(T0* C, T0* a1);
/* KL_DIRECTORY.recursive_delete */
extern void T489f50(T0* C);
/* KL_DIRECTORY.old_recursive_delete */
extern void T489f52(T0* C);
/* KL_DIRECTORY.old_delete */
extern void T489f53(T0* C);
/* KL_DIRECTORY.eif_dir_delete */
extern void T489f55(T0* C, T14 a1);
/* KL_DIRECTORY.old_is_empty */
extern T1 T489f32(T0* C);
/* KL_DIRECTORY.count */
extern T6 T489f34(T0* C);
/* DIRECTORY.readentry */
extern void T661f19(T0* C);
/* DIRECTORY.dir_next */
extern T0* T661f8(T0* C, T14 a1);
/* DIRECTORY.start */
extern void T661f18(T0* C);
/* DIRECTORY.dir_rewind */
extern void T661f24(T0* C, T14 a1);
/* DIRECTORY.make_open_read */
extern T0* T661c17(T0* a1);
/* DIRECTORY.open_read */
extern void T661f23(T0* C);
/* DIRECTORY.dir_open */
extern T14 T661f11(T0* C, T14 a1);
/* DIRECTORY.make */
extern void T661f14(T0* C, T0* a1);
/* DIRECTORY.make */
extern T0* T661c14(T0* a1);
/* KL_DIRECTORY.delete_content */
extern void T489f54(T0* C);
/* ARRAYED_LIST [STRING_8].forth */
extern void T662f14(T0* C);
/* RAW_FILE.delete */
extern void T660f16(T0* C);
/* RAW_FILE.file_unlink */
extern void T660f19(T0* C, T14 a1);
/* RAW_FILE.is_writable */
extern T1 T660f12(T0* C);
/* UNIX_FILE_INFO.is_writable */
extern T1 T87f13(T0* C);
/* RAW_FILE.buffered_file_info */
extern T0* T660f7(T0* C);
/* RAW_FILE.set_buffer */
extern void T660f17(T0* C);
/* DIRECTORY.recursive_delete */
extern void T661f16(T0* C);
/* DIRECTORY.delete */
extern void T661f22(T0* C);
/* DIRECTORY.eif_dir_delete */
extern void T661f26(T0* C, T14 a1);
/* DIRECTORY.is_empty */
extern T1 T661f6(T0* C);
/* DIRECTORY.count */
extern T6 T661f13(T0* C);
/* DIRECTORY.delete_content */
extern void T661f21(T0* C);
/* DIRECTORY.linear_representation */
extern T0* T661f10(T0* C);
/* ARRAYED_LIST [STRING_8].extend */
extern void T662f15(T0* C, T0* a1);
/* ARRAYED_LIST [STRING_8].force_i_th */
extern void T662f18(T0* C, T0* a1, T6 a2);
/* ARRAYED_LIST [STRING_8].put_i_th */
extern void T662f21(T0* C, T0* a1, T6 a2);
/* ARRAYED_LIST [STRING_8].auto_resize */
extern void T662f20(T0* C, T6 a1, T6 a2);
/* ARRAYED_LIST [STRING_8].capacity */
extern T6 T662f10(T0* C);
/* ARRAYED_LIST [STRING_8].make_area */
extern void T662f19(T0* C, T6 a1);
/* ARRAYED_LIST [STRING_8].additional_space */
extern T6 T662f9(T0* C);
/* ARRAYED_LIST [STRING_8].empty_area */
extern T1 T662f8(T0* C);
/* ARRAYED_LIST [STRING_8].set_count */
extern void T662f16(T0* C, T6 a1);
/* ARRAYED_LIST [STRING_8].make */
extern T0* T662c12(T6 a1);
/* ARRAYED_LIST [STRING_8].array_make */
extern void T662f17(T0* C, T6 a1, T6 a2);
/* RAW_FILE.is_directory */
extern T1 T660f10(T0* C);
/* UNIX_FILE_INFO.is_directory */
extern T1 T87f12(T0* C);
/* RAW_FILE.is_symlink */
extern T1 T660f8(T0* C);
/* UNIX_FILE_INFO.is_symlink */
extern T1 T87f11(T0* C);
/* RAW_FILE.exists */
extern T1 T660f13(T0* C);
/* RAW_FILE.file_exists */
extern T1 T660f6(T0* C, T14 a1);
/* RAW_FILE.make */
extern T0* T660c14(T0* a1);
/* FILE_NAME.set_file_name */
extern void T659f11(T0* C, T0* a1);
/* FILE_NAME.set_count */
extern void T659f16(T0* C, T6 a1);
/* FILE_NAME.c_strlen */
extern T6 T659f4(T0* C, T14 a1);
/* FILE_NAME.eif_append_file_name */
extern void T659f15(T0* C, T14 a1, T14 a2, T14 a3);
/* FILE_NAME.resize */
extern void T659f14(T0* C, T6 a1);
/* FILE_NAME.capacity */
extern T6 T659f5(T0* C);
/* FILE_NAME.make_from_string */
extern T0* T659c10(T0* a1);
/* FILE_NAME.append */
extern void T659f13(T0* C, T0* a1);
/* FILE_NAME.additional_space */
extern T6 T659f7(T0* C);
/* FILE_NAME.string_make */
extern void T659f12(T0* C, T6 a1);
/* ARRAYED_LIST [STRING_8].item */
extern T0* T662f6(T0* C);
/* ARRAYED_LIST [STRING_8].after */
extern T1 T662f7(T0* C);
/* ARRAYED_LIST [STRING_8].start */
extern void T662f13(T0* C);
/* KL_DIRECTORY.linear_representation */
extern T0* T489f33(T0* C);
/* KL_UNIX_FILE_SYSTEM.recursive_delete_directory */
extern void T54f37(T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.unix_file_system */
extern T0* T429f16(T0* C);
/* GEANT_DELETE_COMMAND.file_system */
extern T0* T429f15(T0* C);
/* GEANT_DELETE_COMMAND.windows_file_system */
extern T0* T429f18(T0* C);
/* GEANT_DELETE_COMMAND.operating_system */
extern T0* T429f17(T0* C);
/* GEANT_DELETE_COMMAND.is_directory_executable */
extern T1 T429f12(T0* C);
/* GEANT_DELETE_TASK.exit_application */
extern void T296f36(T0* C, T6 a1, T0* a2);
/* GEANT_DELETE_TASK.exceptions */
extern T0* T296f22(T0* C);
/* GEANT_DELETE_TASK.std */
extern T0* T296f21(T0* C);
/* GEANT_DELETE_TASK.log_messages */
extern void T296f37(T0* C, T0* a1);
/* GEANT_DELETE_TASK.dir_attribute_name */
extern T0* T296f20(T0* C);
/* GEANT_DELETE_TASK.file_system */
extern T0* T296f19(T0* C);
/* GEANT_DELETE_TASK.unix_file_system */
extern T0* T296f25(T0* C);
/* GEANT_DELETE_TASK.windows_file_system */
extern T0* T296f24(T0* C);
/* GEANT_DELETE_TASK.operating_system */
extern T0* T296f23(T0* C);
/* GEANT_MKDIR_TASK.execute */
extern void T294f31(T0* C);
/* GEANT_MKDIR_COMMAND.execute */
extern void T425f16(T0* C);
/* GEANT_MKDIR_TASK.exit_application */
extern void T294f32(T0* C, T6 a1, T0* a2);
/* GEANT_MKDIR_TASK.exceptions */
extern T0* T294f17(T0* C);
/* GEANT_MKDIR_TASK.std */
extern T0* T294f16(T0* C);
/* GEANT_MKDIR_TASK.log_messages */
extern void T294f33(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.project_variables_resolver */
extern T0* T294f10(T0* C);
/* GEANT_MKDIR_TASK.dir_attribute_name */
extern T0* T294f15(T0* C);
/* GEANT_MKDIR_TASK.file_system */
extern T0* T294f14(T0* C);
/* GEANT_MKDIR_TASK.unix_file_system */
extern T0* T294f20(T0* C);
/* GEANT_MKDIR_TASK.windows_file_system */
extern T0* T294f19(T0* C);
/* GEANT_MKDIR_TASK.operating_system */
extern T0* T294f18(T0* C);
/* GEANT_ECHO_TASK.execute */
extern void T292f31(T0* C);
/* GEANT_ECHO_COMMAND.execute */
extern void T422f16(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_append */
extern void T517f23(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_append */
extern void T517f29(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_append */
extern void T517f29p1(T0* C);
/* GEANT_BOOLEAN_PROPERTY.non_empty_value_or_else */
extern T1 T389f6(T0* C, T1 a1);
/* GEANT_BOOLEAN_PROPERTY.value */
extern T1 T389f5(T0* C);
/* GEANT_BOOLEAN_PROPERTY.boolean_value */
extern T1 T389f8(T0* C, T0* a1);
/* GEANT_BOOLEAN_PROPERTY.false_attribute_value */
extern unsigned char ge19os9224;
extern T0* ge19ov9224;
extern T0* T389f11(T0* C);
/* GEANT_BOOLEAN_PROPERTY.true_attribute_value */
extern unsigned char ge19os9223;
extern T0* ge19ov9223;
extern T0* T389f10(T0* C);
/* GEANT_BOOLEAN_PROPERTY.string_ */
extern T0* T389f9(T0* C);
/* GEANT_BOOLEAN_PROPERTY.string_value */
extern T0* T389f4(T0* C);
/* GEANT_BOOLEAN_PROPERTY.is_defined */
extern T1 T389f7(T0* C);
/* GEANT_ECHO_TASK.exit_application */
extern void T292f32(T0* C, T6 a1, T0* a2);
/* GEANT_ECHO_TASK.exceptions */
extern T0* T292f17(T0* C);
/* GEANT_ECHO_TASK.std */
extern T0* T292f16(T0* C);
/* GEANT_ECHO_TASK.log_messages */
extern void T292f33(T0* C, T0* a1);
/* GEANT_ECHO_TASK.project_variables_resolver */
extern T0* T292f10(T0* C);
/* GEANT_ECHO_TASK.dir_attribute_name */
extern T0* T292f15(T0* C);
/* GEANT_ECHO_TASK.file_system */
extern T0* T292f14(T0* C);
/* GEANT_ECHO_TASK.unix_file_system */
extern T0* T292f20(T0* C);
/* GEANT_ECHO_TASK.windows_file_system */
extern T0* T292f19(T0* C);
/* GEANT_ECHO_TASK.operating_system */
extern T0* T292f18(T0* C);
/* GEANT_GEANT_TASK.execute */
extern void T290f47(T0* C);
/* GEANT_GEANT_COMMAND.execute */
extern void T418f34(T0* C);
/* GEANT_GEANT_COMMAND.execute_with_target */
extern void T418f38(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.is_fileset_executable */
extern T1 T418f21(T0* C);
/* GEANT_GEANT_COMMAND.execute_forked_with_target */
extern void T418f37(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.item */
extern T0* T25f54(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.item_storage_item */
extern T0* T25f50(T0* C, T6 a1);
/* GEANT_GEANT_COMMAND.string_ */
extern T0* T418f19(T0* C);
/* GEANT_GEANT_COMMAND.execute_with_filename */
extern void T418f36(T0* C, T0* a1);
/* GEANT_TARGET.is_exported_to_project */
extern T1 T26f62(T0* C, T0* a1);
/* GEANT_PROJECT.has_parent_with_name */
extern T1 T22f28(T0* C, T0* a1);
/* GEANT_PROJECT.string_ */
extern T0* T22f29(T0* C);
/* GEANT_GEANT_COMMAND.exit_application */
extern void T418f39(T0* C, T6 a1, T0* a2);
/* GEANT_GEANT_COMMAND.exceptions */
extern T0* T418f23(T0* C);
/* GEANT_GEANT_COMMAND.std */
extern T0* T418f22(T0* C);
/* GEANT_GEANT_COMMAND.log_messages */
extern void T418f41(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.execute_forked_with_filename_and_target */
extern void T418f35(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_COMMAND.execute_shell */
extern void T418f40(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.options_and_arguments_for_cmdline */
extern T0* T418f20(T0* C);
/* GEANT_PROJECT_VARIABLES.put */
extern void T25f88(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_COMMAND.project_variables_resolver */
extern T0* T418f18(T0* C);
/* GEANT_GEANT_COMMAND.unix_file_system */
extern T0* T418f17(T0* C);
/* GEANT_GEANT_COMMAND.file_system */
extern T0* T418f16(T0* C);
/* GEANT_GEANT_COMMAND.windows_file_system */
extern T0* T418f25(T0* C);
/* GEANT_GEANT_COMMAND.operating_system */
extern T0* T418f24(T0* C);
/* GEANT_GEANT_COMMAND.is_filename_executable */
extern T1 T418f14(T0* C);
/* GEANT_GEANT_TASK.dir_attribute_name */
extern T0* T290f32(T0* C);
/* GEANT_GEANT_TASK.file_system */
extern T0* T290f31(T0* C);
/* GEANT_GEANT_TASK.unix_file_system */
extern T0* T290f35(T0* C);
/* GEANT_GEANT_TASK.windows_file_system */
extern T0* T290f34(T0* C);
/* GEANT_GEANT_TASK.operating_system */
extern T0* T290f33(T0* C);
/* GEANT_GETEST_TASK.execute */
extern void T288f48(T0* C);
/* GEANT_GETEST_COMMAND.execute */
extern void T415f34(T0* C);
/* GEANT_GETEST_COMMAND.execute_shell */
extern void T415f35(T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.unix_file_system */
extern T0* T415f19(T0* C);
/* GEANT_GETEST_COMMAND.file_system */
extern T0* T415f18(T0* C);
/* GEANT_GETEST_COMMAND.windows_file_system */
extern T0* T415f21(T0* C);
/* GEANT_GETEST_COMMAND.operating_system */
extern T0* T415f20(T0* C);
/* GEANT_GETEST_COMMAND.string_ */
extern T0* T415f17(T0* C);
/* GEANT_GETEST_TASK.exit_application */
extern void T288f49(T0* C, T6 a1, T0* a2);
/* GEANT_GETEST_TASK.exceptions */
extern T0* T288f35(T0* C);
/* GEANT_GETEST_TASK.log_messages */
extern void T288f50(T0* C, T0* a1);
/* GEANT_GETEST_TASK.dir_attribute_name */
extern T0* T288f34(T0* C);
/* GEANT_GETEST_TASK.file_system */
extern T0* T288f33(T0* C);
/* GEANT_GETEST_TASK.unix_file_system */
extern T0* T288f38(T0* C);
/* GEANT_GETEST_TASK.windows_file_system */
extern T0* T288f37(T0* C);
/* GEANT_GETEST_TASK.operating_system */
extern T0* T288f36(T0* C);
/* GEANT_GEPP_TASK.execute */
extern void T286f43(T0* C);
/* GEANT_GEPP_COMMAND.execute */
extern void T412f29(T0* C);
/* GEANT_FILESET.has_map */
extern T1 T390f30(T0* C);
/* GEANT_GEPP_COMMAND.execute_shell */
extern void T412f31(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.is_file_outofdate */
extern T1 T412f18(T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_COMMAND.unix_file_system */
extern T0* T412f17(T0* C);
/* GEANT_GEPP_COMMAND.file_system */
extern T0* T412f16(T0* C);
/* GEANT_GEPP_COMMAND.windows_file_system */
extern T0* T412f20(T0* C);
/* GEANT_GEPP_COMMAND.operating_system */
extern T0* T412f19(T0* C);
/* GEANT_GEPP_COMMAND.is_file_executable */
extern T1 T412f13(T0* C);
/* GEANT_GEPP_COMMAND.create_directory */
extern void T412f30(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.string_ */
extern T0* T412f15(T0* C);
/* GEANT_GEPP_TASK.exit_application */
extern void T286f44(T0* C, T6 a1, T0* a2);
/* GEANT_GEPP_TASK.exceptions */
extern T0* T286f30(T0* C);
/* GEANT_GEPP_TASK.log_messages */
extern void T286f45(T0* C, T0* a1);
/* GEANT_GEPP_TASK.dir_attribute_name */
extern T0* T286f29(T0* C);
/* GEANT_GEPP_TASK.file_system */
extern T0* T286f28(T0* C);
/* GEANT_GEPP_TASK.unix_file_system */
extern T0* T286f33(T0* C);
/* GEANT_GEPP_TASK.windows_file_system */
extern T0* T286f32(T0* C);
/* GEANT_GEPP_TASK.operating_system */
extern T0* T286f31(T0* C);
/* GEANT_GEYACC_TASK.execute */
extern void T284f43(T0* C);
/* GEANT_GEYACC_COMMAND.execute */
extern void T409f29(T0* C);
/* GEANT_GEYACC_COMMAND.execute_shell */
extern void T409f30(T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.string_ */
extern T0* T409f16(T0* C);
/* GEANT_GEYACC_COMMAND.unix_file_system */
extern T0* T409f15(T0* C);
/* GEANT_GEYACC_COMMAND.file_system */
extern T0* T409f14(T0* C);
/* GEANT_GEYACC_COMMAND.windows_file_system */
extern T0* T409f18(T0* C);
/* GEANT_GEYACC_COMMAND.operating_system */
extern T0* T409f17(T0* C);
/* GEANT_GEYACC_TASK.exit_application */
extern void T284f44(T0* C, T6 a1, T0* a2);
/* GEANT_GEYACC_TASK.exceptions */
extern T0* T284f30(T0* C);
/* GEANT_GEYACC_TASK.log_messages */
extern void T284f45(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.dir_attribute_name */
extern T0* T284f29(T0* C);
/* GEANT_GEYACC_TASK.file_system */
extern T0* T284f28(T0* C);
/* GEANT_GEYACC_TASK.unix_file_system */
extern T0* T284f33(T0* C);
/* GEANT_GEYACC_TASK.windows_file_system */
extern T0* T284f32(T0* C);
/* GEANT_GEYACC_TASK.operating_system */
extern T0* T284f31(T0* C);
/* GEANT_GELEX_TASK.execute */
extern void T282f46(T0* C);
/* GEANT_GELEX_COMMAND.execute */
extern void T406f35(T0* C);
/* GEANT_GELEX_COMMAND.execute_shell */
extern void T406f36(T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.unix_file_system */
extern T0* T406f19(T0* C);
/* GEANT_GELEX_COMMAND.file_system */
extern T0* T406f18(T0* C);
/* GEANT_GELEX_COMMAND.windows_file_system */
extern T0* T406f21(T0* C);
/* GEANT_GELEX_COMMAND.operating_system */
extern T0* T406f20(T0* C);
/* GEANT_GELEX_COMMAND.string_ */
extern T0* T406f17(T0* C);
/* GEANT_GELEX_TASK.exit_application */
extern void T282f47(T0* C, T6 a1, T0* a2);
/* GEANT_GELEX_TASK.exceptions */
extern T0* T282f33(T0* C);
/* GEANT_GELEX_TASK.log_messages */
extern void T282f48(T0* C, T0* a1);
/* GEANT_GELEX_TASK.dir_attribute_name */
extern T0* T282f32(T0* C);
/* GEANT_GELEX_TASK.file_system */
extern T0* T282f31(T0* C);
/* GEANT_GELEX_TASK.unix_file_system */
extern T0* T282f36(T0* C);
/* GEANT_GELEX_TASK.windows_file_system */
extern T0* T282f35(T0* C);
/* GEANT_GELEX_TASK.operating_system */
extern T0* T282f34(T0* C);
/* GEANT_GEXACE_TASK.execute */
extern void T280f44(T0* C);
/* GEANT_GEXACE_COMMAND.execute */
extern void T403f32(T0* C);
/* GEANT_GEXACE_COMMAND.execute_shell */
extern void T403f33(T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.unix_file_system */
extern T0* T403f20(T0* C);
/* GEANT_GEXACE_COMMAND.file_system */
extern T0* T403f19(T0* C);
/* GEANT_GEXACE_COMMAND.windows_file_system */
extern T0* T403f22(T0* C);
/* GEANT_GEXACE_COMMAND.operating_system */
extern T0* T403f21(T0* C);
/* GEANT_GEXACE_COMMAND.is_library_executable */
extern T1 T403f17(T0* C);
/* GEANT_GEXACE_COMMAND.is_system_executable */
extern T1 T403f16(T0* C);
/* GEANT_GEXACE_COMMAND.is_validate_executable */
extern T1 T403f15(T0* C);
/* GEANT_GEXACE_COMMAND.string_ */
extern T0* T403f18(T0* C);
/* GEANT_GEXACE_TASK.exit_application */
extern void T280f45(T0* C, T6 a1, T0* a2);
/* GEANT_GEXACE_TASK.exceptions */
extern T0* T280f31(T0* C);
/* GEANT_GEXACE_TASK.log_messages */
extern void T280f46(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.dir_attribute_name */
extern T0* T280f30(T0* C);
/* GEANT_GEXACE_TASK.file_system */
extern T0* T280f29(T0* C);
/* GEANT_GEXACE_TASK.unix_file_system */
extern T0* T280f34(T0* C);
/* GEANT_GEXACE_TASK.windows_file_system */
extern T0* T280f33(T0* C);
/* GEANT_GEXACE_TASK.operating_system */
extern T0* T280f32(T0* C);
/* GEANT_UNSET_TASK.execute */
extern void T278f32(T0* C);
/* GEANT_UNSET_COMMAND.execute */
extern void T399f10(T0* C);
/* GEANT_PROJECT.unset_variable */
extern void T22f52(T0* C, T0* a1);
/* GEANT_UNSET_TASK.exit_application */
extern void T278f33(T0* C, T6 a1, T0* a2);
/* GEANT_UNSET_TASK.exceptions */
extern T0* T278f19(T0* C);
/* GEANT_UNSET_TASK.std */
extern T0* T278f18(T0* C);
/* GEANT_UNSET_TASK.log_messages */
extern void T278f34(T0* C, T0* a1);
/* GEANT_UNSET_TASK.dir_attribute_name */
extern T0* T278f17(T0* C);
/* GEANT_UNSET_TASK.file_system */
extern T0* T278f16(T0* C);
/* GEANT_UNSET_TASK.unix_file_system */
extern T0* T278f22(T0* C);
/* GEANT_UNSET_TASK.windows_file_system */
extern T0* T278f21(T0* C);
/* GEANT_UNSET_TASK.operating_system */
extern T0* T278f20(T0* C);
/* GEANT_SET_TASK.execute */
extern void T276f33(T0* C);
/* GEANT_SET_COMMAND.execute */
extern void T396f17(T0* C);
/* GEANT_SET_COMMAND.default_builtin_variables */
extern T0* T396f8(T0* C);
/* GEANT_SET_COMMAND.file_system */
extern T0* T396f10(T0* C);
/* GEANT_SET_COMMAND.unix_file_system */
extern T0* T396f12(T0* C);
/* GEANT_SET_COMMAND.windows_file_system */
extern T0* T396f11(T0* C);
/* GEANT_SET_COMMAND.operating_system */
extern T0* T396f9(T0* C);
/* GEANT_SET_TASK.exit_application */
extern void T276f34(T0* C, T6 a1, T0* a2);
/* GEANT_SET_TASK.exceptions */
extern T0* T276f20(T0* C);
/* GEANT_SET_TASK.std */
extern T0* T276f19(T0* C);
/* GEANT_SET_TASK.log_messages */
extern void T276f35(T0* C, T0* a1);
/* GEANT_SET_TASK.dir_attribute_name */
extern T0* T276f18(T0* C);
/* GEANT_SET_TASK.file_system */
extern T0* T276f17(T0* C);
/* GEANT_SET_TASK.unix_file_system */
extern T0* T276f23(T0* C);
/* GEANT_SET_TASK.windows_file_system */
extern T0* T276f22(T0* C);
/* GEANT_SET_TASK.operating_system */
extern T0* T276f21(T0* C);
/* GEANT_LCC_TASK.execute */
extern void T274f33(T0* C);
/* GEANT_LCC_COMMAND.execute */
extern void T393f17(T0* C);
/* GEANT_LCC_COMMAND.execute_shell */
extern void T393f18(T0* C, T0* a1);
/* GEANT_LCC_COMMAND.string_ */
extern T0* T393f10(T0* C);
/* GEANT_LCC_COMMAND.unix_file_system */
extern T0* T393f9(T0* C);
/* GEANT_LCC_COMMAND.file_system */
extern T0* T393f8(T0* C);
/* GEANT_LCC_COMMAND.windows_file_system */
extern T0* T393f12(T0* C);
/* GEANT_LCC_COMMAND.operating_system */
extern T0* T393f11(T0* C);
/* GEANT_LCC_TASK.exit_application */
extern void T274f34(T0* C, T6 a1, T0* a2);
/* GEANT_LCC_TASK.exceptions */
extern T0* T274f20(T0* C);
/* GEANT_LCC_TASK.std */
extern T0* T274f19(T0* C);
/* GEANT_LCC_TASK.log_messages */
extern void T274f35(T0* C, T0* a1);
/* GEANT_LCC_TASK.dir_attribute_name */
extern T0* T274f18(T0* C);
/* GEANT_LCC_TASK.file_system */
extern T0* T274f17(T0* C);
/* GEANT_LCC_TASK.unix_file_system */
extern T0* T274f23(T0* C);
/* GEANT_LCC_TASK.windows_file_system */
extern T0* T274f22(T0* C);
/* GEANT_LCC_TASK.operating_system */
extern T0* T274f21(T0* C);
/* GEANT_EXEC_TASK.execute */
extern void T272f32(T0* C);
/* GEANT_EXEC_COMMAND.execute */
extern void T385f16(T0* C);
/* GEANT_EXEC_COMMAND.project_variables_resolver */
extern T0* T385f11(T0* C);
/* GEANT_EXEC_COMMAND.execute_shell */
extern void T385f18(T0* C, T0* a1);
/* GEANT_EXEC_TASK.exit_application */
extern void T272f33(T0* C, T6 a1, T0* a2);
/* GEANT_EXEC_TASK.exceptions */
extern T0* T272f18(T0* C);
/* GEANT_EXEC_TASK.std */
extern T0* T272f17(T0* C);
/* GEANT_EXEC_TASK.log_messages */
extern void T272f34(T0* C, T0* a1);
/* GEANT_EXEC_TASK.project_variables_resolver */
extern T0* T272f11(T0* C);
/* GEANT_EXEC_TASK.dir_attribute_name */
extern T0* T272f16(T0* C);
/* GEANT_EXEC_TASK.file_system */
extern T0* T272f15(T0* C);
/* GEANT_EXEC_TASK.unix_file_system */
extern T0* T272f21(T0* C);
/* GEANT_EXEC_TASK.windows_file_system */
extern T0* T272f20(T0* C);
/* GEANT_EXEC_TASK.operating_system */
extern T0* T272f19(T0* C);
/* GEANT_ISE_TASK.execute */
extern void T270f43(T0* C);
/* GEANT_ISE_COMMAND.execute */
extern void T381f29(T0* C);
/* GEANT_ISE_COMMAND.execute_clean */
extern void T381f31(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.delete_directory */
extern void T53f42(T0* C, T0* a1);
/* KL_DIRECTORY.delete */
extern void T489f51(T0* C);
/* KL_DIRECTORY.is_empty */
extern T1 T489f28(T0* C);
/* KL_DIRECTORY.tmp_directory */
extern unsigned char ge153os9384;
extern T0* ge153ov9384;
extern T0* T489f30(T0* C);
/* KL_UNIX_FILE_SYSTEM.delete_directory */
extern void T54f38(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_empty */
extern T1 T53f30(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.is_directory_empty */
extern T1 T54f27(T0* C, T0* a1);
/* GEANT_ISE_COMMAND.file_system */
extern T0* T381f15(T0* C);
/* GEANT_ISE_COMMAND.unix_file_system */
extern T0* T381f16(T0* C);
/* GEANT_ISE_COMMAND.windows_file_system */
extern T0* T381f19(T0* C);
/* GEANT_ISE_COMMAND.operating_system */
extern T0* T381f18(T0* C);
/* GEANT_ISE_COMMAND.execute_compile */
extern void T381f30(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.cd */
extern void T53f40(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.cd */
extern void T54f36(T0* C, T0* a1);
/* GEANT_ISE_COMMAND.execute_shell */
extern void T381f32(T0* C, T0* a1);
/* GEANT_ISE_COMMAND.string_ */
extern T0* T381f17(T0* C);
/* GEANT_ISE_COMMAND.is_compilable */
extern T1 T381f13(T0* C);
/* GEANT_ISE_TASK.exit_application */
extern void T270f44(T0* C, T6 a1, T0* a2);
/* GEANT_ISE_TASK.exceptions */
extern T0* T270f30(T0* C);
/* GEANT_ISE_TASK.log_messages */
extern void T270f45(T0* C, T0* a1);
/* GEANT_ISE_TASK.dir_attribute_name */
extern T0* T270f29(T0* C);
/* GEANT_ISE_TASK.file_system */
extern T0* T270f28(T0* C);
/* GEANT_ISE_TASK.unix_file_system */
extern T0* T270f33(T0* C);
/* GEANT_ISE_TASK.windows_file_system */
extern T0* T270f32(T0* C);
/* GEANT_ISE_TASK.operating_system */
extern T0* T270f31(T0* C);
/* GEANT_GEC_TASK.execute */
extern void T263f46(T0* C);
/* GEANT_GEC_COMMAND.execute */
extern void T377f37(T0* C);
/* GEANT_GEC_COMMAND.execute_shell */
extern void T377f38(T0* C, T0* a1);
/* GEANT_GEC_COMMAND.new_ace_cmdline */
extern T0* T377f19(T0* C);
/* GEANT_GEC_COMMAND.string_ */
extern T0* T377f24(T0* C);
/* GEANT_GEC_COMMAND.unix_file_system */
extern T0* T377f22(T0* C);
/* KL_INTEGER_ROUTINES.append_decimal_integer */
extern void T207f5(T0* C, T6 a1, T0* a2);
/* GEANT_GEC_COMMAND.integer_ */
extern T0* T377f23(T0* C);
/* GEANT_GEC_COMMAND.is_ace_configuration */
extern T1 T377f16(T0* C);
/* GEANT_GEC_COMMAND.file_system */
extern T0* T377f18(T0* C);
/* GEANT_GEC_COMMAND.windows_file_system */
extern T0* T377f21(T0* C);
/* GEANT_GEC_COMMAND.operating_system */
extern T0* T377f20(T0* C);
/* GEANT_GEC_COMMAND.is_cleanable */
extern T1 T377f17(T0* C);
/* GEANT_GEC_TASK.exit_application */
extern void T263f47(T0* C, T6 a1, T0* a2);
/* GEANT_GEC_TASK.exceptions */
extern T0* T263f33(T0* C);
/* GEANT_GEC_TASK.log_messages */
extern void T263f48(T0* C, T0* a1);
/* GEANT_GEC_TASK.dir_attribute_name */
extern T0* T263f32(T0* C);
/* GEANT_GEC_TASK.file_system */
extern T0* T263f31(T0* C);
/* GEANT_GEC_TASK.unix_file_system */
extern T0* T263f36(T0* C);
/* GEANT_GEC_TASK.windows_file_system */
extern T0* T263f35(T0* C);
/* GEANT_GEC_TASK.operating_system */
extern T0* T263f34(T0* C);
/* XM_CHARACTER_DATA.node_set_parent */
extern void T358f4(T0* C, T0* a1);
/* XM_PROCESSING_INSTRUCTION.node_set_parent */
extern void T357f6(T0* C, T0* a1);
/* XM_COMMENT.node_set_parent */
extern void T356f5(T0* C, T0* a1);
/* XM_ATTRIBUTE.node_set_parent */
extern void T200f6(T0* C, T0* a1);
/* XM_ELEMENT.node_set_parent */
extern void T99f34(T0* C, T0* a1);
/* XM_CHARACTER_DATA.process */
extern void T358f5(T0* C, T0* a1);
/* XM_NODE_TYPER.process_character_data */
extern void T364f18(T0* C, T0* a1);
/* XM_NODE_TYPER.reset */
extern void T364f14(T0* C);
/* XM_PROCESSING_INSTRUCTION.process */
extern void T357f7(T0* C, T0* a1);
/* XM_NODE_TYPER.process_processing_instruction */
extern void T364f17(T0* C, T0* a1);
/* XM_COMMENT.process */
extern void T356f6(T0* C, T0* a1);
/* XM_NODE_TYPER.process_comment */
extern void T364f16(T0* C, T0* a1);
/* XM_ATTRIBUTE.process */
extern void T200f7(T0* C, T0* a1);
/* XM_NODE_TYPER.process_attribute */
extern void T364f15(T0* C, T0* a1);
/* XM_ELEMENT.process */
extern void T99f40(T0* C, T0* a1);
/* XM_NODE_TYPER.process_element */
extern void T364f12(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_stream */
extern void T176f234(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T176f241(T0* C, T0* a1);
/* YY_FILE_BUFFER.name */
extern T0* T219f14(T0* C);
/* XM_EIFFEL_INPUT_STREAM.name */
extern T0* T206f26(T0* C);
/* KL_STRING_INPUT_STREAM.name */
extern unsigned char ge171os4149;
extern T0* ge171ov4149;
extern T0* T490f6(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T176f241p1(T0* C, T0* a1);
/* YY_FILE_BUFFER.set_position */
extern void T219f19(T0* C, T6 a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.set_index */
extern void T219f18(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.new_file_buffer */
extern T0* T176f71(T0* C, T0* a1);
/* YY_FILE_BUFFER.make */
extern T0* T219c17(T0* a1);
/* YY_FILE_BUFFER.make_with_size */
extern void T219f21(T0* C, T0* a1, T6 a2);
/* YY_FILE_BUFFER.set_file */
extern void T219f23(T0* C, T0* a1);
/* YY_FILE_BUFFER.flush */
extern void T219f25(T0* C);
/* YY_FILE_BUFFER.new_default_buffer */
extern T0* T219f16(T0* C, T6 a1);
/* YY_FILE_BUFFER.default_capacity */
extern unsigned char ge348os8021;
extern T6 ge348ov8021;
extern T6 T219f13(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_input_stream */
extern void T174f199(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T174f208(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T174f208p1(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.new_file_buffer */
extern T0* T174f55(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_stream */
extern void T171f230(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T171f237(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T171f237p1(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.new_file_buffer */
extern T0* T171f69(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_stream */
extern void T132f197(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T132f205(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T132f205p1(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.new_file_buffer */
extern T0* T132f46(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T176f235(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T176f235p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T176f235p0(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_action */
extern void T176f245(T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.from_hexadecimal */
extern void T217f10(T0* C, T0* a1);
/* KL_STRING_ROUTINES.hexadecimal_to_integer */
extern T6 T76f13(T0* C, T0* a1);
/* XM_EIFFEL_CHARACTER_ENTITY.string_ */
extern T0* T217f7(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.to_utf8 */
extern T0* T217f3(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.utf8 */
extern T0* T217f6(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_ascii */
extern T1 T217f2(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_valid */
extern T1 T217f5(T0* C);
/* UC_UNICODE_ROUTINES.valid_non_surrogate_code */
extern T1 T321f3(T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.unicode */
extern T0* T217f4(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.from_decimal */
extern void T217f9(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.has_normalized_newline */
extern T1 T176f201(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_substring */
extern T0* T176f181(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_PE_ENTITY_DEF.text_count */
extern T6 T176f180(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.system_literal_text */
extern T0* T176f162(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_item */
extern T2 T176f207(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern T0* T176f121(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern unsigned char ge1545os6664;
extern T0* ge1545ov6664;
extern T0* T176f121p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_line_column */
extern void T176f249(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text */
extern T0* T176f105(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.pop_start_condition */
extern void T176f248(T0* C);
/* DS_LINKED_STACK [INTEGER_32].remove */
extern void T222f7(T0* C);
/* DS_LINKED_STACK [INTEGER_32].item */
extern T6 T222f4(T0* C);
/* DS_LINKED_STACK [INTEGER_32].is_empty */
extern T1 T222f3(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition */
extern void T176f246(T0* C, T6 a1);
/* DS_LINKED_STACK [INTEGER_32].force */
extern void T222f6(T0* C, T6 a1);
/* DS_LINKABLE [INTEGER_32].put_right */
extern void T338f4(T0* C, T0* a1);
/* DS_LINKABLE [INTEGER_32].make */
extern T0* T338c3(T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_last_token */
extern void T176f247(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_eof_action */
extern void T176f244(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.wrap */
extern T1 T176f99(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_refill_input_buffer */
extern void T176f243(T0* C);
/* YY_FILE_BUFFER.fill */
extern void T219f20(T0* C);
/* KL_CHARACTER_BUFFER.fill_from_stream */
extern T6 T368f5(T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T6 T206f27(T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T6 T206f27p1(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STRING_INPUT_STREAM.read_to_string */
extern T6 T490f8(T0* C, T0* a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.compact_left */
extern void T219f22(T0* C);
/* KL_CHARACTER_BUFFER.move_left */
extern void T368f10(T0* C, T6 a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.resize */
extern void T219f24(T0* C);
/* KL_CHARACTER_BUFFER.resize */
extern void T368f11(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_null_trans_state */
extern T6 T176f98(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_previous_state */
extern T6 T176f97(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.terminate */
extern void T176f242(T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T174f200(T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T174f200p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_action */
extern void T174f214(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.has_normalized_newline */
extern T1 T174f180(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_substring */
extern T0* T174f160(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_SCANNER_DTD.text_count */
extern T6 T174f159(T0* C);
/* XM_EIFFEL_SCANNER_DTD.system_literal_text */
extern T0* T174f141(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_item */
extern T2 T174f194(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.normalized_newline */
extern T0* T174f103(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_line_column */
extern void T174f220(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text */
extern T0* T174f77(T0* C);
/* XM_EIFFEL_SCANNER_DTD.pop_start_condition */
extern void T174f219(T0* C);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition */
extern void T174f215(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_eof_action */
extern void T174f213(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.wrap */
extern T1 T174f68(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_refill_input_buffer */
extern void T174f212(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_null_trans_state */
extern T6 T174f67(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_previous_state */
extern T6 T174f66(T0* C);
/* XM_EIFFEL_SCANNER_DTD.fatal_error */
extern void T174f211(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.terminate */
extern void T174f210(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_last_token */
extern void T174f209(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T171f231(T0* C);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T171f231p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_action */
extern void T171f240(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.has_normalized_newline */
extern T1 T171f198(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_substring */
extern T0* T171f178(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_ENTITY_DEF.text_count */
extern T6 T171f177(T0* C);
/* XM_EIFFEL_ENTITY_DEF.system_literal_text */
extern T0* T171f159(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_item */
extern T2 T171f205(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T171f118(T0* C);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T171f118p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_line_column */
extern void T171f245(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text */
extern T0* T171f102(T0* C);
/* XM_EIFFEL_ENTITY_DEF.pop_start_condition */
extern void T171f244(T0* C);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition */
extern void T171f241(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.set_last_token */
extern void T171f243(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_eof_action */
extern void T171f239(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.terminate */
extern void T171f242(T0* C);
/* XM_EIFFEL_ENTITY_DEF.wrap */
extern T1 T171f96(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_refill_input_buffer */
extern void T171f238(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_null_trans_state */
extern T6 T171f95(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_previous_state */
extern T6 T171f94(T0* C);
/* XM_EIFFEL_SCANNER.read_token */
extern void T132f198(T0* C);
/* XM_EIFFEL_SCANNER.yy_execute_action */
extern void T132f209(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.has_normalized_newline */
extern T1 T132f178(T0* C);
/* XM_EIFFEL_SCANNER.text_substring */
extern T0* T132f158(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_SCANNER.text_count */
extern T6 T132f157(T0* C);
/* XM_EIFFEL_SCANNER.system_literal_text */
extern T0* T132f139(T0* C);
/* XM_EIFFEL_SCANNER.text_item */
extern T2 T132f192(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.normalized_newline */
extern T0* T132f98(T0* C);
/* XM_EIFFEL_SCANNER.yy_set_line_column */
extern void T132f217(T0* C);
/* XM_EIFFEL_SCANNER.text */
extern T0* T132f72(T0* C);
/* XM_EIFFEL_SCANNER.pop_start_condition */
extern void T132f216(T0* C);
/* XM_EIFFEL_SCANNER.set_start_condition */
extern void T132f218(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.push_start_condition */
extern void T132f210(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.set_last_token */
extern void T132f215(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.yy_execute_eof_action */
extern void T132f208(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.terminate */
extern void T132f214(T0* C);
/* XM_EIFFEL_SCANNER.wrap */
extern T1 T132f63(T0* C);
/* XM_EIFFEL_SCANNER.yy_refill_input_buffer */
extern void T132f207(T0* C);
/* XM_EIFFEL_SCANNER.yy_null_trans_state */
extern T6 T132f62(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.yy_previous_state */
extern T6 T132f61(T0* C);
/* XM_EIFFEL_SCANNER.fatal_error */
extern void T132f206(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T176f237(T0* C);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition_dtd_ignore */
extern void T174f202(T0* C);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T171f233(T0* C);
/* XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T132f200(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_encoding */
extern void T176f238(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.set_encoding */
extern void T206f30(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_encoding */
extern void T174f203(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_encoding */
extern void T171f234(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_encoding */
extern void T132f201(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_from_resolver */
extern void T176f239(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_from_resolver */
extern void T174f204(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_from_resolver */
extern void T171f235(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T132f202(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.close_input */
extern void T176f236(T0* C);
/* KL_STRING_INPUT_STREAM.close */
extern void T490f11(T0* C);
/* KL_STRING_INPUT_STREAM.is_closable */
extern T1 T490f7(T0* C);
/* KL_TEXT_INPUT_FILE.is_closable */
extern T1 T55f27(T0* C);
/* XM_EIFFEL_SCANNER_DTD.close_input */
extern void T174f201(T0* C);
/* XM_EIFFEL_ENTITY_DEF.close_input */
extern void T171f232(T0* C);
/* XM_EIFFEL_SCANNER.close_input */
extern void T132f199(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start */
extern void T177f26(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_make */
extern void T177f36(T0* C);
/* XM_NAMESPACE_RESOLVER.new_string_queue */
extern T0* T177f12(T0* C);
/* DS_LINKED_QUEUE [STRING_8].make */
extern T0* T252c6(void);
/* XM_NAMESPACE_RESOLVER_CONTEXT.make */
extern T0* T250c10(void);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T345c9(void);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].set_internal_cursor */
extern void T345f12(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].new_cursor */
extern T0* T345f7(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T346c7(T0* a1);
/* XM_CALLBACKS_NULL.on_start */
extern void T137f2(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T100f6(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T100f6p1(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start */
extern void T97f12(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_equal */
extern T0* T355c32(T6 a1);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].default_create */
extern T0* T493c2(void);
/* DS_HASH_SET [XM_NAMESPACE].make */
extern void T355f35(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].set_internal_cursor */
extern void T355f45(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].new_cursor */
extern T0* T355f22(T0* C);
/* DS_HASH_SET_CURSOR [XM_NAMESPACE].make */
extern T0* T494c3(T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].unset_found_item */
extern void T355f36(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_slots */
extern void T355f44(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].special_integer_ */
extern T0* T355f28(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].new_modulus */
extern T6 T355f20(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_clashes */
extern void T355f43(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_key_storage */
extern void T355f42(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_item_storage */
extern void T355f41(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].make */
extern T0* T495f1(T0* C, T6 a1);
/* SPECIAL [XM_NAMESPACE].aliased_resized_area */
extern T0* T492f4(T0* C, T6 a1);
/* ARRAY [XM_NAMESPACE].make_empty */
extern T0* T540c4(void);
/* ARRAY [XM_NAMESPACE].make_area */
extern void T540f5(T0* C, T6 a1);
/* SPECIAL [XM_NAMESPACE].make */
extern T0* T492c5(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].default_create */
extern T0* T495c3(void);
/* XM_DOCUMENT.make */
extern T0* T98c15(void);
/* XM_DOCUMENT.make_with_root_named */
extern void T98f16(T0* C, T0* a1, T0* a2);
/* XM_DOCUMENT.force_last */
extern void T98f18(T0* C, T0* a1);
/* XM_DOCUMENT.force_last */
extern void T98f18p1(T0* C, T0* a1);
/* XM_DOCUMENT.is_empty */
extern T1 T98f9(T0* C);
/* XM_DOCUMENT.before_addition */
extern void T98f20(T0* C, T0* a1);
/* XM_ELEMENT.equality_delete */
extern void T99f39(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].remove */
extern void T203f13(T0* C);
/* XM_DOCUMENT.remove_at_cursor */
extern void T98f27(T0* C, T0* a1);
/* XM_DOCUMENT.move_all_cursors */
extern void T98f34(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_current_cell */
extern void T203f17(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].put */
extern void T362f6(T0* C, T0* a1);
/* XM_DOCUMENT.set_last_cell */
extern void T98f33(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].forget_right */
extern void T362f5(T0* C);
/* XM_DOCUMENT.remove_last */
extern void T98f32(T0* C);
/* XM_DOCUMENT.move_last_cursors_after */
extern void T98f37(T0* C);
/* XM_DOCUMENT.wipe_out */
extern void T98f35(T0* C);
/* XM_DOCUMENT.move_all_cursors_after */
extern void T98f38(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].is_last */
extern T1 T203f7(T0* C);
/* XM_DOCUMENT.cursor_is_last */
extern T1 T98f14(T0* C, T0* a1);
/* XM_ELEMENT.cursor_is_last */
extern T1 T99f25(T0* C, T0* a1);
/* XM_DOCUMENT.remove_first */
extern void T98f31(T0* C);
/* XM_DOCUMENT.set_first_cell */
extern void T98f36(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].is_first */
extern T1 T203f6(T0* C);
/* XM_DOCUMENT.cursor_is_first */
extern T1 T98f13(T0* C, T0* a1);
/* XM_ELEMENT.cursor_is_first */
extern T1 T99f24(T0* C, T0* a1);
/* XM_ELEMENT.remove_at_cursor */
extern void T99f44(T0* C, T0* a1);
/* XM_ELEMENT.move_all_cursors */
extern void T99f50(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.set_last_cell */
extern void T99f49(T0* C, T0* a1);
/* XM_ELEMENT.remove_last */
extern void T99f48(T0* C);
/* XM_ELEMENT.move_last_cursors_after */
extern void T99f53(T0* C);
/* XM_ELEMENT.wipe_out */
extern void T99f51(T0* C);
/* XM_ELEMENT.remove_first */
extern void T99f47(T0* C);
/* XM_ELEMENT.set_first_cell */
extern void T99f52(T0* C, T0* a1);
/* XM_DOCUMENT.equality_delete */
extern void T98f22(T0* C, T0* a1);
/* XM_DOCUMENT.new_cursor */
extern T0* T98f8(T0* C);
/* XM_DOCUMENT.list_make */
extern void T98f17(T0* C);
/* XM_DOCUMENT.set_internal_cursor */
extern void T98f19(T0* C, T0* a1);
/* XM_ELEMENT.make */
extern T0* T99c33(T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.list_make */
extern void T99f35(T0* C);
/* XM_DOCUMENT.default_ns */
extern unsigned char ge1496os6175;
extern T0* ge1496ov6175;
extern T0* T98f7(T0* C);
/* XM_NAMESPACE.make_default */
extern T0* T359c8(void);
/* XM_NAMESPACE.make */
extern void T359f7(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE.make */
extern T0* T359c7(T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_finish */
extern void T177f27(T0* C);
/* XM_CALLBACKS_NULL.on_finish */
extern void T137f3(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T100f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T100f7p1(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_finish */
extern void T97f13(T0* C);
/* XM_NAMESPACE_RESOLVER.on_comment */
extern void T177f28(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_comment */
extern void T137f4(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T100f8(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T100f8p1(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_comment */
extern void T97f14(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.handle_position */
extern void T97f22(T0* C, T0* a1);
/* XM_POSITION_TABLE.put */
extern void T101f5(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].put_last */
extern void T180f13(T0* C, T0* a1);
/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].put_right */
extern void T326f4(T0* C, T0* a1);
/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T326c3(T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].is_empty */
extern T1 T180f5(T0* C);
/* DS_PAIR [XM_POSITION, XM_NODE].make */
extern T0* T210c3(T0* a1, T0* a2);
/* XM_CALLBACKS_TO_TREE_FILTER.is_position_table_enabled */
extern T1 T97f8(T0* C);
/* XM_COMMENT.make_last */
extern T0* T356c4(T0* a1, T0* a2);
/* XM_ELEMENT.force_last */
extern void T99f36(T0* C, T0* a1);
/* XM_ELEMENT.force_last */
extern void T99f36p1(T0* C, T0* a1);
/* XM_ELEMENT.force_last */
extern void T99f36p0(T0* C, T0* a1);
/* XM_ELEMENT.before_addition */
extern void T99f38(T0* C, T0* a1);
/* XM_ELEMENT.last */
extern T0* T99f17(T0* C);
/* XM_COMMENT.make_last_in_document */
extern T0* T356c3(T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_processing_instruction */
extern void T177f29(T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_NULL.on_processing_instruction */
extern void T137f5(T0* C, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T100f9(T0* C, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T100f9p1(T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_TO_TREE_FILTER.on_processing_instruction */
extern void T97f15(T0* C, T0* a1, T0* a2);
/* XM_PROCESSING_INSTRUCTION.make_last */
extern T0* T357c5(T0* a1, T0* a2, T0* a3);
/* XM_PROCESSING_INSTRUCTION.make_last_in_document */
extern T0* T357c4(T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER.on_content */
extern void T177f30(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_content */
extern void T137f6(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T100f10(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T100f10p1(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_content */
extern void T97f16(T0* C, T0* a1);
/* XM_CHARACTER_DATA.make_last */
extern T0* T358c3(T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_start_tag */
extern void T177f33(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.push */
extern void T250f12(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].force_last */
extern void T345f11(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].put_right */
extern void T488f5(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].attach_left */
extern void T488f6(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T488c4(T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].is_empty */
extern T1 T345f5(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.new_string_string_table */
extern T0* T250f8(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_equality_tester */
extern void T81f45(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.string_equality_tester */
extern T0* T250f9(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map_default */
extern T0* T81c43(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].default_capacity */
extern T6 T81f33(T0* C);
/* XM_CALLBACKS_NULL.on_start_tag */
extern void T137f9(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T100f11(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T100f11p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag */
extern void T97f17(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_last */
extern T0* T99c32(T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_root */
extern T0* T99c31(T0* a1, T0* a2, T0* a3);
/* XM_DOCUMENT.set_root_element */
extern void T98f21(T0* C, T0* a1);
/* XM_DOCUMENT.remove_previous_root_element */
extern void T98f28(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.new_namespace */
extern T0* T97f7(T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_NAMESPACE].force_last */
extern void T355f33(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_put */
extern void T355f40(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].clashes_put */
extern void T355f39(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].slots_item */
extern T6 T355f26(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].hash_position */
extern T6 T355f23(T0* C, T0* a1);
/* XM_NAMESPACE.hash_code */
extern T6 T359f5(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].resize */
extern void T355f38(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_resize */
extern void T355f49(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].key_storage_resize */
extern void T355f48(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_resize */
extern void T355f47(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].resize */
extern T0* T495f2(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].key_storage_item */
extern T0* T355f18(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_item */
extern T0* T355f30(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_item */
extern T6 T355f19(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_resize */
extern void T355f46(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_capacity */
extern T6 T355f21(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_put */
extern void T355f37(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].search_position */
extern void T355f34(T0* C, T0* a1);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].test */
extern T1 T493f1(T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_NAMESPACE].key_equality_tester */
extern T0* T355f17(T0* C);
/* XM_NAMESPACE.same_prefix */
extern T1 T359f6(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].item */
extern T0* T355f25(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].has */
extern T1 T355f27(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T177f31(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T177f31p1(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve_default */
extern T0* T250f3(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_pseudo_prefix */
extern unsigned char ge1470os8062;
extern T0* ge1470ov8062;
extern T0* T250f7(T0* C);
/* XM_NAMESPACE_RESOLVER.string_ */
extern T0* T177f11(T0* C);
/* XM_NAMESPACE_RESOLVER.on_delayed_attributes */
extern void T177f37(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_remove */
extern void T177f39(T0* C);
/* DS_LINKED_QUEUE [STRING_8].remove */
extern void T252f8(T0* C);
/* DS_LINKED_QUEUE [STRING_8].wipe_out */
extern void T252f9(T0* C);
/* XM_NAMESPACE_RESOLVER.unprefixed_attribute_namespace */
extern T0* T177f19(T0* C);
/* XM_NAMESPACE_RESOLVER.default_namespace */
extern unsigned char ge1437os7095;
extern T0* ge1437ov7095;
extern T0* T177f23(T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns_namespace */
extern unsigned char ge1437os7103;
extern T0* ge1437ov7103;
extern T0* T177f18(T0* C);
/* XM_NAMESPACE_RESOLVER.is_xmlns */
extern T1 T177f14(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.same_string */
extern T1 T177f21(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.string_equality_tester */
extern T0* T177f24(T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns */
extern unsigned char ge1437os7096;
extern T0* ge1437ov7096;
extern T0* T177f20(T0* C);
/* XM_NAMESPACE_RESOLVER.xml_prefix_namespace */
extern unsigned char ge1437os7102;
extern T0* ge1437ov7102;
extern T0* T177f17(T0* C);
/* XM_NAMESPACE_RESOLVER.is_xml */
extern T1 T177f16(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.xml_prefix */
extern unsigned char ge1437os7097;
extern T0* ge1437ov7097;
extern T0* T177f22(T0* C);
/* DS_LINKED_QUEUE [STRING_8].item */
extern T0* T252f5(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_is_empty */
extern T1 T177f15(T0* C);
/* DS_LINKED_QUEUE [STRING_8].is_empty */
extern T1 T252f4(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve */
extern T0* T250f2(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].back */
extern void T346f10(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_back */
extern void T345f19(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].add_traversing_cursor */
extern void T345f20(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_next_cursor */
extern void T346f12(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_traversing_cursor */
extern void T345f21(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set */
extern void T346f13(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].go_before */
extern void T346f9(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_go_before */
extern void T345f18(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_before */
extern void T346f14(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_off */
extern T1 T345f8(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item */
extern T0* T81f23(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_item */
extern T0* T81f28(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].has */
extern T1 T81f22(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].item */
extern T0* T346f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].finish */
extern void T346f8(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_finish */
extern void T345f17(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_namespace */
extern unsigned char ge1470os8063;
extern T0* ge1470ov8063;
extern T0* T250f6(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.has */
extern T1 T250f5(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.has_prefix */
extern T1 T177f9(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_start_tag_finish */
extern void T137f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T100f12(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T100f12p1(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag_finish */
extern void T97f18(T0* C);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T177f32(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.pop */
extern void T250f11(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_last */
extern void T345f10(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].set_last_cell */
extern void T345f15(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].forget_right */
extern void T488f7(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_last_cursors_after */
extern void T345f14(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_after */
extern void T346f11(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].wipe_out */
extern void T345f13(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_all_cursors_after */
extern void T345f16(T0* C);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T177f32p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_NULL.on_end_tag */
extern void T137f8(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T100f13(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T100f13p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_end_tag */
extern void T97f19(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.parent_element */
extern T0* T99f19(T0* C);
/* XM_DOCUMENT.process */
extern void T98f23(T0* C, T0* a1);
/* XM_NODE_TYPER.process_document */
extern void T364f13(T0* C, T0* a1);
/* XM_ELEMENT.is_root_node */
extern T1 T99f22(T0* C);
/* XM_DOCUMENT.is_root_node */
extern T1 T98f10(T0* C);
/* XM_NAMESPACE_RESOLVER.on_error */
extern void T177f35(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_error */
extern void T137f11(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T100f14(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T100f14p1(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_error */
extern void T97f20(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_attribute */
extern void T177f34(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add */
extern void T250f14(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force_new */
extern void T81f57(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].last */
extern T0* T345f6(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.shallow_has */
extern T1 T250f4(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.attributes_force */
extern void T177f38(T0* C, T0* a1, T0* a2, T0* a3);
/* DS_LINKED_QUEUE [STRING_8].force */
extern void T252f7(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add_default */
extern void T250f13(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_attribute */
extern void T137f10(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T100f15(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T100f15p1(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_CALLBACKS_TO_TREE_FILTER.on_attribute */
extern void T97f21(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_ATTRIBUTE.make_last */
extern T0* T200c5(T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER.on_xml_declaration */
extern void T177f41(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_CALLBACKS_NULL.on_xml_declaration */
extern void T137f12(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_STOP_ON_ERROR_FILTER.on_xml_declaration */
extern void T100f16(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_xml_declaration */
extern void T97f23(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_NAMESPACE_RESOLVER.set_next */
extern void T177f40(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.set_next */
extern void T100f5(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.set_next */
extern void T97f11(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_start */
extern void T81f58(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].add_traversing_cursor */
extern void T81f67(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].remove_traversing_cursor */
extern void T81f66(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_off */
extern T1 T81f39(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].is_empty */
extern T1 T81f38(T0* C);
/* GEANT_ARGUMENT_VARIABLES.cursor_start */
extern void T34f72(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.add_traversing_cursor */
extern void T34f75(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.remove_traversing_cursor */
extern void T34f74(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_off */
extern T1 T34f43(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.is_empty */
extern T1 T34f42(T0* C);
/* GEANT_VARIABLES.cursor_start */
extern void T29f73(T0* C, T0* a1);
/* GEANT_VARIABLES.add_traversing_cursor */
extern void T29f76(T0* C, T0* a1);
/* GEANT_VARIABLES.remove_traversing_cursor */
extern void T29f75(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_off */
extern T1 T29f43(T0* C, T0* a1);
/* GEANT_VARIABLES.is_empty */
extern T1 T29f42(T0* C);
/* GEANT_PROJECT_VARIABLES.cursor_start */
extern void T25f83(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.add_traversing_cursor */
extern void T25f86(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.remove_traversing_cursor */
extern void T25f85(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_off */
extern T1 T25f52(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.is_empty */
extern T1 T25f51(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_forth */
extern void T81f59(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_forth */
extern void T34f73(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_forth */
extern void T29f74(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_forth */
extern void T25f84(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.reset */
extern void T73f41(T0* C);
/* AP_STRING_OPTION.reset */
extern void T37f28(T0* C);
/* AP_FLAG.reset */
extern void T35f23(T0* C);
/* AP_DISPLAY_HELP_FLAG.record_occurrence */
extern void T73f42(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.display_help */
extern void T73f43(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.exceptions */
extern T0* T73f16(T0* C);
/* AP_ERROR_HANDLER.report_info_message */
extern void T45f11(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.full_help_text */
extern T0* T73f15(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.option_help_text */
extern T0* T73f24(T0* C, T0* a1, T6 a2);
/* STRING_8.make_filled */
extern T0* T17c54(T2 a1, T6 a2);
/* STRING_8.fill_character */
extern void T17f55(T0* C, T2 a1);
/* SPECIAL [CHARACTER_8].fill_with */
extern void T15f16(T0* C, T2 a1, T6 a2, T6 a3);
/* DS_QUICK_SORTER [AP_OPTION].sort */
extern void T351f3(T0* C, T0* a1);
/* DS_QUICK_SORTER [AP_OPTION].sort_with_comparator */
extern void T351f4(T0* C, T0* a1, T0* a2);
/* DS_QUICK_SORTER [AP_OPTION].subsort_with_comparator */
extern void T351f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* ARRAY [INTEGER_32].force */
extern void T108f15(T0* C, T6 a1, T6 a2);
/* ARRAY [INTEGER_32].auto_resize */
extern void T108f16(T0* C, T6 a1, T6 a2);
/* SPECIAL [INTEGER_32].fill_with_default */
extern void T63f15(T0* C, T6 a1, T6 a2);
/* ARRAY [INTEGER_32].capacity */
extern T6 T108f7(T0* C);
/* ARRAY [INTEGER_32].additional_space */
extern T6 T108f6(T0* C);
/* ARRAY [INTEGER_32].empty_area */
extern T1 T108f5(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].swap */
extern void T74f31(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [AP_OPTION].replace */
extern void T74f30(T0* C, T0* a1, T6 a2);
/* AP_OPTION_COMPARATOR.less_than */
extern T1 T350f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.three_way_comparison */
extern T6 T76f14(T0* C, T0* a1, T0* a2);
/* AP_OPTION_COMPARATOR.string_ */
extern T0* T350f2(T0* C);
/* ST_WORD_WRAPPER.wrapped_string */
extern T0* T353f5(T0* C, T0* a1);
/* ST_WORD_WRAPPER.canonify_whitespace */
extern void T353f12(T0* C, T0* a1);
/* UC_UTF8_STRING.put */
extern void T205f88(T0* C, T2 a1, T6 a2);
/* ST_WORD_WRAPPER.is_space */
extern T1 T353f8(T0* C, T2 a1);
/* ST_WORD_WRAPPER.string_ */
extern T0* T353f4(T0* C);
/* ST_WORD_WRAPPER.set_new_line_indentation */
extern void T353f10(T0* C, T6 a1);
/* AP_DISPLAY_HELP_FLAG.wrapper */
extern unsigned char ge104os5241;
extern T0* ge104ov5241;
extern T0* T73f19(T0* C);
/* ST_WORD_WRAPPER.set_maximum_text_width */
extern void T353f11(T0* C, T6 a1);
/* ST_WORD_WRAPPER.make */
extern T0* T353c9(void);
/* AP_DISPLAY_HELP_FLAG.full_usage_instruction */
extern T0* T73f17(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.alternative_usage_instruction */
extern T0* T73f26(T0* C, T0* a1, T0* a2);
/* AP_DISPLAY_HELP_FLAG.arguments */
extern T0* T73f30(T0* C);
/* AP_DISPLAY_HELP_FLAG.file_system */
extern T0* T73f29(T0* C);
/* AP_DISPLAY_HELP_FLAG.unix_file_system */
extern T0* T73f35(T0* C);
/* AP_DISPLAY_HELP_FLAG.windows_file_system */
extern T0* T73f34(T0* C);
/* AP_DISPLAY_HELP_FLAG.operating_system */
extern T0* T73f33(T0* C);
/* AP_DISPLAY_HELP_FLAG.usage_instruction */
extern T0* T73f25(T0* C, T0* a1);
/* DS_QUICK_SORTER [AP_OPTION].make */
extern T0* T351c2(T0* a1);
/* AP_OPTION_COMPARATOR.default_create */
extern T0* T350c3(void);
/* AP_STRING_OPTION.record_occurrence */
extern void T37f30(T0* C, T0* a1);
/* AP_FLAG.record_occurrence */
extern void T35f25(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.force_last */
extern void T34f70(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.force_last */
extern void T29f72(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.force_last */
extern void T25f94(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.resize */
extern void T25f68(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.clashes_resize */
extern void T25f76(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.key_storage_resize */
extern void T25f75(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.item_storage_resize */
extern void T25f74(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.slots_resize */
extern void T25f73(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.new_capacity */
extern T6 T25f32(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.search */
extern void T34f71(T0* C, T0* a1);
/* GEANT_VARIABLES.search */
extern void T29f71(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.search */
extern void T25f82(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.start */
extern void T34f79(T0* C);
/* GEANT_VARIABLES.start */
extern void T29f79(T0* C);
/* GEANT_PROJECT_VARIABLES.start */
extern void T25f96(T0* C);
/* GEANT_ARGUMENT_VARIABLES.forth */
extern void T34f80(T0* C);
/* GEANT_VARIABLES.forth */
extern void T29f80(T0* C);
/* GEANT_PROJECT_VARIABLES.forth */
extern void T25f97(T0* C);
/* GEANT_ARGUMENT_VARIABLES.set_variable_value */
extern void T34f77(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.set_variable_value */
extern void T29f49(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.set_variable_value */
extern void T25f60(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.force */
extern void T25f63(T0* C, T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.replace */
extern void T34f78(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.replace */
extern void T29f78(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.replace */
extern void T25f95(T0* C, T0* a1, T0* a2);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T629f3(T0* C, T6 a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T627f2(T0* C, T6 a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T625f3(T0* C, T6 a1);
/* GEANT_REPLACE_TASK.is_executable */
extern T1 T316f18(T0* C);
/* GEANT_REPLACE_COMMAND.is_executable */
extern T1 T462f14(T0* C);
/* KL_BOOLEAN_ROUTINES.nxor */
extern T1 T563f1(T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.is_fileset_to_directory_executable */
extern T1 T462f17(T0* C);
/* GEANT_REPLACE_COMMAND.boolean_ */
extern unsigned char ge123os5418;
extern T0* ge123ov5418;
extern T0* T462f15(T0* C);
/* KL_BOOLEAN_ROUTINES.default_create */
extern T0* T563c2(void);
/* GEANT_INPUT_TASK.is_executable */
extern T1 T314f20(T0* C);
/* GEANT_INPUT_COMMAND.is_executable */
extern T1 T459f11(T0* C);
/* GEANT_AVAILABLE_TASK.is_executable */
extern T1 T312f6(T0* C);
/* GEANT_AVAILABLE_COMMAND.is_executable */
extern T1 T456f13(T0* C);
/* GEANT_AVAILABLE_COMMAND.validate_condition */
extern void T456f20(T0* C, T1 a1, T0* a2, T0* a3);
/* GEANT_AVAILABLE_COMMAND.validation_messages */
extern T0* T456f16(T0* C);
/* DS_CELL [BOOLEAN].put */
extern void T561f3(T0* C, T1 a1);
/* DS_CELL [BOOLEAN].make */
extern T0* T561c2(T1 a1);
/* GEANT_PRECURSOR_TASK.is_executable */
extern T1 T310f17(T0* C);
/* GEANT_PRECURSOR_COMMAND.is_executable */
extern T1 T453f7(T0* C);
/* GEANT_EXIT_TASK.is_executable */
extern T1 T308f10(T0* C);
/* GEANT_EXIT_COMMAND.is_executable */
extern T1 T450f6(T0* C);
/* GEANT_OUTOFDATE_TASK.is_executable */
extern T1 T306f15(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_executable */
extern T1 T447f11(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_fileset_executable */
extern T1 T447f13(T0* C);
/* GEANT_XSLT_TASK.is_executable */
extern T1 T304f29(T0* C);
/* GEANT_XSLT_COMMAND.is_executable */
extern T1 T443f17(T0* C);
/* GEANT_SETENV_TASK.is_executable */
extern T1 T302f11(T0* C);
/* GEANT_SETENV_COMMAND.is_executable */
extern T1 T439f7(T0* C);
/* GEANT_MOVE_TASK.is_executable */
extern T1 T300f13(T0* C);
/* GEANT_MOVE_COMMAND.is_executable */
extern T1 T436f9(T0* C);
/* GEANT_MOVE_COMMAND.is_fileset_to_directory_executable */
extern T1 T436f12(T0* C);
/* GEANT_COPY_TASK.is_executable */
extern T1 T298f19(T0* C);
/* GEANT_COPY_COMMAND.is_executable */
extern T1 T433f10(T0* C);
/* GEANT_COPY_COMMAND.is_fileset_to_directory_executable */
extern T1 T433f14(T0* C);
/* GEANT_COPY_COMMAND.boolean_ */
extern T0* T433f11(T0* C);
/* GEANT_DELETE_TASK.is_executable */
extern T1 T296f13(T0* C);
/* GEANT_DELETE_COMMAND.is_executable */
extern T1 T429f9(T0* C);
/* GEANT_DELETE_COMMAND.boolean_ */
extern T0* T429f10(T0* C);
/* GEANT_MKDIR_TASK.is_executable */
extern T1 T294f6(T0* C);
/* GEANT_MKDIR_COMMAND.is_executable */
extern T1 T425f10(T0* C);
/* GEANT_MKDIR_COMMAND.validate_condition */
extern void T425f17(T0* C, T1 a1, T0* a2, T0* a3);
/* GEANT_MKDIR_COMMAND.validation_messages */
extern T0* T425f12(T0* C);
/* GEANT_ECHO_TASK.is_executable */
extern T1 T292f6(T0* C);
/* GEANT_ECHO_COMMAND.is_executable */
extern T1 T422f9(T0* C);
/* GEANT_ECHO_COMMAND.validate_condition */
extern void T422f17(T0* C, T1 a1, T0* a2, T0* a3);
/* GEANT_ECHO_COMMAND.validation_messages */
extern T0* T422f11(T0* C);
/* GEANT_GEANT_TASK.is_executable */
extern T1 T290f25(T0* C);
/* GEANT_GEANT_COMMAND.is_executable */
extern T1 T418f13(T0* C);
/* GEANT_GEANT_COMMAND.is_target_executable */
extern T1 T418f15(T0* C);
/* GEANT_GETEST_TASK.is_executable */
extern T1 T288f27(T0* C);
/* GEANT_GETEST_COMMAND.is_executable */
extern T1 T415f16(T0* C);
/* GEANT_GEPP_TASK.is_executable */
extern T1 T286f22(T0* C);
/* GEANT_GEPP_COMMAND.is_executable */
extern T1 T412f12(T0* C);
/* GEANT_GEPP_COMMAND.is_fileset_executable */
extern T1 T412f14(T0* C);
/* GEANT_GEYACC_TASK.is_executable */
extern T1 T284f22(T0* C);
/* GEANT_GEYACC_COMMAND.is_executable */
extern T1 T409f13(T0* C);
/* GEANT_GELEX_TASK.is_executable */
extern T1 T282f25(T0* C);
/* GEANT_GELEX_COMMAND.is_executable */
extern T1 T406f16(T0* C);
/* GEANT_GEXACE_TASK.is_executable */
extern T1 T280f23(T0* C);
/* GEANT_GEXACE_COMMAND.is_executable */
extern T1 T403f13(T0* C);
/* GEANT_GEXACE_COMMAND.boolean_ */
extern T0* T403f14(T0* C);
/* GEANT_UNSET_TASK.is_executable */
extern T1 T278f10(T0* C);
/* GEANT_UNSET_COMMAND.is_executable */
extern T1 T399f6(T0* C);
/* GEANT_SET_TASK.is_executable */
extern T1 T276f11(T0* C);
/* GEANT_SET_COMMAND.is_executable */
extern T1 T396f7(T0* C);
/* GEANT_LCC_TASK.is_executable */
extern T1 T274f11(T0* C);
/* GEANT_LCC_COMMAND.is_executable */
extern T1 T393f7(T0* C);
/* GEANT_EXEC_TASK.is_executable */
extern T1 T272f7(T0* C);
/* GEANT_EXEC_COMMAND.is_executable */
extern T1 T385f9(T0* C);
/* GEANT_EXEC_COMMAND.validate_condition */
extern void T385f17(T0* C, T1 a1, T0* a2, T0* a3);
/* GEANT_EXEC_COMMAND.validation_messages */
extern T0* T385f12(T0* C);
/* GEANT_ISE_TASK.is_executable */
extern T1 T270f22(T0* C);
/* GEANT_ISE_COMMAND.is_executable */
extern T1 T381f12(T0* C);
/* GEANT_ISE_COMMAND.is_cleanable */
extern T1 T381f14(T0* C);
/* GEANT_GEC_TASK.is_executable */
extern T1 T263f25(T0* C);
/* GEANT_GEC_COMMAND.is_executable */
extern T1 T377f15(T0* C);
/* GEANT_REPLACE_TASK.is_enabled */
extern T1 T316f19(T0* C);
/* GEANT_REPLACE_TASK.unless_attribute_name */
extern T0* T316f23(T0* C);
/* GEANT_REPLACE_TASK.if_attribute_name */
extern T0* T316f22(T0* C);
/* GEANT_INPUT_TASK.is_enabled */
extern T1 T314f21(T0* C);
/* GEANT_INPUT_TASK.unless_attribute_name */
extern T0* T314f25(T0* C);
/* GEANT_INPUT_TASK.if_attribute_name */
extern T0* T314f24(T0* C);
/* GEANT_AVAILABLE_TASK.is_enabled */
extern T1 T312f7(T0* C);
/* GEANT_AVAILABLE_TASK.unless_attribute_name */
extern T0* T312f13(T0* C);
/* GEANT_AVAILABLE_TASK.has_attribute */
extern T1 T312f12(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.if_attribute_name */
extern T0* T312f11(T0* C);
/* GEANT_PRECURSOR_TASK.is_enabled */
extern T1 T310f18(T0* C);
/* GEANT_PRECURSOR_TASK.unless_attribute_name */
extern T0* T310f22(T0* C);
/* GEANT_PRECURSOR_TASK.if_attribute_name */
extern T0* T310f21(T0* C);
/* GEANT_EXIT_TASK.is_enabled */
extern T1 T308f11(T0* C);
/* GEANT_EXIT_TASK.unless_attribute_name */
extern T0* T308f15(T0* C);
/* GEANT_EXIT_TASK.if_attribute_name */
extern T0* T308f14(T0* C);
/* GEANT_OUTOFDATE_TASK.is_enabled */
extern T1 T306f16(T0* C);
/* GEANT_OUTOFDATE_TASK.unless_attribute_name */
extern T0* T306f20(T0* C);
/* GEANT_OUTOFDATE_TASK.if_attribute_name */
extern T0* T306f19(T0* C);
/* GEANT_XSLT_TASK.is_enabled */
extern T1 T304f30(T0* C);
/* GEANT_XSLT_TASK.unless_attribute_name */
extern T0* T304f34(T0* C);
/* GEANT_XSLT_TASK.if_attribute_name */
extern T0* T304f33(T0* C);
/* GEANT_SETENV_TASK.is_enabled */
extern T1 T302f12(T0* C);
/* GEANT_SETENV_TASK.unless_attribute_name */
extern T0* T302f16(T0* C);
/* GEANT_SETENV_TASK.if_attribute_name */
extern T0* T302f15(T0* C);
/* GEANT_MOVE_TASK.is_enabled */
extern T1 T300f14(T0* C);
/* GEANT_MOVE_TASK.unless_attribute_name */
extern T0* T300f18(T0* C);
/* GEANT_MOVE_TASK.if_attribute_name */
extern T0* T300f17(T0* C);
/* GEANT_COPY_TASK.is_enabled */
extern T1 T298f20(T0* C);
/* GEANT_COPY_TASK.unless_attribute_name */
extern T0* T298f24(T0* C);
/* GEANT_COPY_TASK.if_attribute_name */
extern T0* T298f23(T0* C);
/* GEANT_DELETE_TASK.is_enabled */
extern T1 T296f14(T0* C);
/* GEANT_DELETE_TASK.unless_attribute_name */
extern T0* T296f18(T0* C);
/* GEANT_DELETE_TASK.if_attribute_name */
extern T0* T296f17(T0* C);
/* GEANT_MKDIR_TASK.is_enabled */
extern T1 T294f7(T0* C);
/* GEANT_MKDIR_TASK.unless_attribute_name */
extern T0* T294f13(T0* C);
/* GEANT_MKDIR_TASK.has_attribute */
extern T1 T294f12(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.if_attribute_name */
extern T0* T294f11(T0* C);
/* GEANT_ECHO_TASK.is_enabled */
extern T1 T292f7(T0* C);
/* GEANT_ECHO_TASK.unless_attribute_name */
extern T0* T292f13(T0* C);
/* GEANT_ECHO_TASK.has_attribute */
extern T1 T292f12(T0* C, T0* a1);
/* GEANT_ECHO_TASK.if_attribute_name */
extern T0* T292f11(T0* C);
/* GEANT_GEANT_TASK.is_enabled */
extern T1 T290f26(T0* C);
/* GEANT_GEANT_TASK.unless_attribute_name */
extern T0* T290f30(T0* C);
/* GEANT_GEANT_TASK.if_attribute_name */
extern T0* T290f29(T0* C);
/* GEANT_GETEST_TASK.is_enabled */
extern T1 T288f28(T0* C);
/* GEANT_GETEST_TASK.unless_attribute_name */
extern T0* T288f32(T0* C);
/* GEANT_GETEST_TASK.if_attribute_name */
extern T0* T288f31(T0* C);
/* GEANT_GEPP_TASK.is_enabled */
extern T1 T286f23(T0* C);
/* GEANT_GEPP_TASK.unless_attribute_name */
extern T0* T286f27(T0* C);
/* GEANT_GEPP_TASK.if_attribute_name */
extern T0* T286f26(T0* C);
/* GEANT_GEYACC_TASK.is_enabled */
extern T1 T284f23(T0* C);
/* GEANT_GEYACC_TASK.unless_attribute_name */
extern T0* T284f27(T0* C);
/* GEANT_GEYACC_TASK.if_attribute_name */
extern T0* T284f26(T0* C);
/* GEANT_GELEX_TASK.is_enabled */
extern T1 T282f26(T0* C);
/* GEANT_GELEX_TASK.unless_attribute_name */
extern T0* T282f30(T0* C);
/* GEANT_GELEX_TASK.if_attribute_name */
extern T0* T282f29(T0* C);
/* GEANT_GEXACE_TASK.is_enabled */
extern T1 T280f24(T0* C);
/* GEANT_GEXACE_TASK.unless_attribute_name */
extern T0* T280f28(T0* C);
/* GEANT_GEXACE_TASK.if_attribute_name */
extern T0* T280f27(T0* C);
/* GEANT_UNSET_TASK.is_enabled */
extern T1 T278f11(T0* C);
/* GEANT_UNSET_TASK.unless_attribute_name */
extern T0* T278f15(T0* C);
/* GEANT_UNSET_TASK.if_attribute_name */
extern T0* T278f14(T0* C);
/* GEANT_SET_TASK.is_enabled */
extern T1 T276f12(T0* C);
/* GEANT_SET_TASK.unless_attribute_name */
extern T0* T276f16(T0* C);
/* GEANT_SET_TASK.if_attribute_name */
extern T0* T276f15(T0* C);
/* GEANT_LCC_TASK.is_enabled */
extern T1 T274f12(T0* C);
/* GEANT_LCC_TASK.unless_attribute_name */
extern T0* T274f16(T0* C);
/* GEANT_LCC_TASK.if_attribute_name */
extern T0* T274f15(T0* C);
/* GEANT_EXEC_TASK.is_enabled */
extern T1 T272f8(T0* C);
/* GEANT_EXEC_TASK.unless_attribute_name */
extern T0* T272f14(T0* C);
/* GEANT_EXEC_TASK.has_attribute */
extern T1 T272f13(T0* C, T0* a1);
/* GEANT_EXEC_TASK.if_attribute_name */
extern T0* T272f12(T0* C);
/* GEANT_ISE_TASK.is_enabled */
extern T1 T270f23(T0* C);
/* GEANT_ISE_TASK.unless_attribute_name */
extern T0* T270f27(T0* C);
/* GEANT_ISE_TASK.if_attribute_name */
extern T0* T270f26(T0* C);
/* GEANT_GEC_TASK.is_enabled */
extern T1 T263f26(T0* C);
/* GEANT_GEC_TASK.unless_attribute_name */
extern T0* T263f30(T0* C);
/* GEANT_GEC_TASK.if_attribute_name */
extern T0* T263f29(T0* C);
/* GEANT_REPLACE_TASK.is_exit_command */
extern T1 T316f20(T0* C);
/* GEANT_REPLACE_COMMAND.is_exit_command */
extern T1 T462f13(T0* C);
/* GEANT_INPUT_TASK.is_exit_command */
extern T1 T314f22(T0* C);
/* GEANT_INPUT_COMMAND.is_exit_command */
extern T1 T459f10(T0* C);
/* GEANT_AVAILABLE_TASK.is_exit_command */
extern T1 T312f8(T0* C);
/* GEANT_AVAILABLE_COMMAND.is_exit_command */
extern T1 T456f14(T0* C);
/* GEANT_PRECURSOR_TASK.is_exit_command */
extern T1 T310f19(T0* C);
/* GEANT_PRECURSOR_COMMAND.is_exit_command */
extern T1 T453f6(T0* C);
/* GEANT_EXIT_TASK.is_exit_command */
extern T1 T308f12(T0* C);
/* GEANT_OUTOFDATE_TASK.is_exit_command */
extern T1 T306f17(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_exit_command */
extern T1 T447f16(T0* C);
/* GEANT_XSLT_TASK.is_exit_command */
extern T1 T304f31(T0* C);
/* GEANT_XSLT_COMMAND.is_exit_command */
extern T1 T443f18(T0* C);
/* GEANT_SETENV_TASK.is_exit_command */
extern T1 T302f13(T0* C);
/* GEANT_SETENV_COMMAND.is_exit_command */
extern T1 T439f6(T0* C);
/* GEANT_MOVE_TASK.is_exit_command */
extern T1 T300f15(T0* C);
/* GEANT_MOVE_COMMAND.is_exit_command */
extern T1 T436f8(T0* C);
/* GEANT_COPY_TASK.is_exit_command */
extern T1 T298f21(T0* C);
/* GEANT_COPY_COMMAND.is_exit_command */
extern T1 T433f9(T0* C);
/* GEANT_DELETE_TASK.is_exit_command */
extern T1 T296f15(T0* C);
/* GEANT_DELETE_COMMAND.is_exit_command */
extern T1 T429f8(T0* C);
/* GEANT_MKDIR_TASK.is_exit_command */
extern T1 T294f8(T0* C);
/* GEANT_MKDIR_COMMAND.is_exit_command */
extern T1 T425f11(T0* C);
/* GEANT_ECHO_TASK.is_exit_command */
extern T1 T292f8(T0* C);
/* GEANT_ECHO_COMMAND.is_exit_command */
extern T1 T422f10(T0* C);
/* GEANT_GEANT_TASK.is_exit_command */
extern T1 T290f27(T0* C);
/* GEANT_GEANT_COMMAND.is_exit_command */
extern T1 T418f12(T0* C);
/* GEANT_GETEST_TASK.is_exit_command */
extern T1 T288f29(T0* C);
/* GEANT_GETEST_COMMAND.is_exit_command */
extern T1 T415f15(T0* C);
/* GEANT_GEPP_TASK.is_exit_command */
extern T1 T286f24(T0* C);
/* GEANT_GEPP_COMMAND.is_exit_command */
extern T1 T412f11(T0* C);
/* GEANT_GEYACC_TASK.is_exit_command */
extern T1 T284f24(T0* C);
/* GEANT_GEYACC_COMMAND.is_exit_command */
extern T1 T409f12(T0* C);
/* GEANT_GELEX_TASK.is_exit_command */
extern T1 T282f27(T0* C);
/* GEANT_GELEX_COMMAND.is_exit_command */
extern T1 T406f15(T0* C);
/* GEANT_GEXACE_TASK.is_exit_command */
extern T1 T280f25(T0* C);
/* GEANT_GEXACE_COMMAND.is_exit_command */
extern T1 T403f12(T0* C);
/* GEANT_UNSET_TASK.is_exit_command */
extern T1 T278f12(T0* C);
/* GEANT_UNSET_COMMAND.is_exit_command */
extern T1 T399f5(T0* C);
/* GEANT_SET_TASK.is_exit_command */
extern T1 T276f13(T0* C);
/* GEANT_SET_COMMAND.is_exit_command */
extern T1 T396f6(T0* C);
/* GEANT_LCC_TASK.is_exit_command */
extern T1 T274f13(T0* C);
/* GEANT_LCC_COMMAND.is_exit_command */
extern T1 T393f6(T0* C);
/* GEANT_EXEC_TASK.is_exit_command */
extern T1 T272f9(T0* C);
/* GEANT_EXEC_COMMAND.is_exit_command */
extern T1 T385f10(T0* C);
/* GEANT_ISE_TASK.is_exit_command */
extern T1 T270f24(T0* C);
/* GEANT_ISE_COMMAND.is_exit_command */
extern T1 T381f11(T0* C);
/* GEANT_GEC_TASK.is_exit_command */
extern T1 T263f27(T0* C);
/* GEANT_GEC_COMMAND.is_exit_command */
extern T1 T377f14(T0* C);
/* GEANT_REPLACE_TASK.exit_code */
extern T6 T316f21(T0* C);
/* GEANT_INPUT_TASK.exit_code */
extern T6 T314f23(T0* C);
/* GEANT_AVAILABLE_TASK.exit_code */
extern T6 T312f9(T0* C);
/* GEANT_PRECURSOR_TASK.exit_code */
extern T6 T310f20(T0* C);
/* GEANT_EXIT_TASK.exit_code */
extern T6 T308f13(T0* C);
/* GEANT_OUTOFDATE_TASK.exit_code */
extern T6 T306f18(T0* C);
/* GEANT_XSLT_TASK.exit_code */
extern T6 T304f32(T0* C);
/* GEANT_SETENV_TASK.exit_code */
extern T6 T302f14(T0* C);
/* GEANT_MOVE_TASK.exit_code */
extern T6 T300f16(T0* C);
/* GEANT_COPY_TASK.exit_code */
extern T6 T298f22(T0* C);
/* GEANT_DELETE_TASK.exit_code */
extern T6 T296f16(T0* C);
/* GEANT_MKDIR_TASK.exit_code */
extern T6 T294f9(T0* C);
/* GEANT_ECHO_TASK.exit_code */
extern T6 T292f9(T0* C);
/* GEANT_GEANT_TASK.exit_code */
extern T6 T290f28(T0* C);
/* GEANT_GETEST_TASK.exit_code */
extern T6 T288f30(T0* C);
/* GEANT_GEPP_TASK.exit_code */
extern T6 T286f25(T0* C);
/* GEANT_GEYACC_TASK.exit_code */
extern T6 T284f25(T0* C);
/* GEANT_GELEX_TASK.exit_code */
extern T6 T282f28(T0* C);
/* GEANT_GEXACE_TASK.exit_code */
extern T6 T280f26(T0* C);
/* GEANT_UNSET_TASK.exit_code */
extern T6 T278f13(T0* C);
/* GEANT_SET_TASK.exit_code */
extern T6 T276f14(T0* C);
/* GEANT_LCC_TASK.exit_code */
extern T6 T274f14(T0* C);
/* GEANT_EXEC_TASK.exit_code */
extern T6 T272f10(T0* C);
/* GEANT_ISE_TASK.exit_code */
extern T6 T270f25(T0* C);
/* GEANT_GEC_TASK.exit_code */
extern T6 T263f28(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.error_position */
extern T0* T176f57(T0* C);
/* XM_DEFAULT_POSITION.make */
extern T0* T133c5(T0* a1, T6 a2, T6 a3, T6 a4);
/* XM_EIFFEL_SCANNER_DTD.error_position */
extern T0* T174f56(T0* C);
/* XM_EIFFEL_ENTITY_DEF.error_position */
extern T0* T171f56(T0* C);
/* XM_EIFFEL_SCANNER.error_position */
extern T0* T132f66(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.end_of_file */
extern T1 T176f60(T0* C);
/* XM_EIFFEL_SCANNER_DTD.end_of_file */
extern T1 T174f63(T0* C);
/* XM_EIFFEL_ENTITY_DEF.end_of_file */
extern T1 T171f59(T0* C);
/* XM_EIFFEL_SCANNER.end_of_file */
extern T1 T132f67(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_applicable_encoding */
extern T1 T176f61(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_applicable_encoding */
extern T1 T206f16(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_valid_encoding */
extern T1 T206f9(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.is_applicable_encoding */
extern T1 T174f49(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.is_applicable_encoding */
extern T1 T171f60(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.is_applicable_encoding */
extern T1 T132f42(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.start_condition */
extern T6 T176f62(T0* C);
/* XM_EIFFEL_SCANNER_DTD.start_condition */
extern T6 T174f51(T0* C);
/* XM_EIFFEL_ENTITY_DEF.start_condition */
extern T6 T171f61(T0* C);
/* XM_EIFFEL_SCANNER.start_condition */
extern T6 T132f44(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_after */
extern T1 T81f25(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_after */
extern T1 T34f36(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_after */
extern T1 T29f38(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_after */
extern T1 T25f46(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_item */
extern T0* T81f26(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_item */
extern T0* T34f37(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.item_storage_item */
extern T0* T34f41(T0* C, T6 a1);
/* GEANT_VARIABLES.cursor_item */
extern T0* T29f39(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_item */
extern T0* T25f47(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_key */
extern T0* T81f27(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_key */
extern T0* T34f38(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_key */
extern T0* T29f40(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_key */
extern T0* T25f48(T0* C, T0* a1);
/* FILE_NAME.area_lower */
extern T6 T659f8(T0* C);
/* UC_UTF8_STRING.area_lower */
extern T6 T205f12(T0* C);
/* STRING_8.area_lower */
extern T6 T17f7(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_cursor */
extern T0* T81f41(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].make */
extern T0* T64c7(T0* a1);
/* GEANT_ARGUMENT_VARIABLES.new_cursor */
extern T0* T34f29(T0* C);
/* GEANT_VARIABLES.new_cursor */
extern T0* T29f29(T0* C);
/* GEANT_PROJECT_VARIABLES.new_cursor */
extern T0* T25f34(T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.default_message */
extern T0* T607f5(T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.message */
extern T0* T607f3(T0* C, T0* a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.arguments */
extern T0* T607f6(T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.string_ */
extern T0* T607f4(T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.default_message */
extern T0* T593f5(T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.message */
extern T0* T593f3(T0* C, T0* a1);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.arguments */
extern T0* T593f6(T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.string_ */
extern T0* T593f4(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.default_message */
extern T0* T592f5(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.message */
extern T0* T592f3(T0* C, T0* a1);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.arguments */
extern T0* T592f6(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.string_ */
extern T0* T592f4(T0* C);
/* LX_FULL_AND_REJECT_ERROR.default_message */
extern T0* T591f5(T0* C);
/* LX_FULL_AND_REJECT_ERROR.message */
extern T0* T591f3(T0* C, T0* a1);
/* LX_FULL_AND_REJECT_ERROR.arguments */
extern T0* T591f6(T0* C);
/* LX_FULL_AND_REJECT_ERROR.string_ */
extern T0* T591f4(T0* C);
/* LX_FULL_AND_META_ERROR.default_message */
extern T0* T590f5(T0* C);
/* LX_FULL_AND_META_ERROR.message */
extern T0* T590f3(T0* C, T0* a1);
/* LX_FULL_AND_META_ERROR.arguments */
extern T0* T590f6(T0* C);
/* LX_FULL_AND_META_ERROR.string_ */
extern T0* T590f4(T0* C);
/* LX_BAD_CHARACTER_ERROR.default_message */
extern T0* T589f5(T0* C);
/* LX_BAD_CHARACTER_ERROR.message */
extern T0* T589f3(T0* C, T0* a1);
/* LX_BAD_CHARACTER_ERROR.arguments */
extern T0* T589f6(T0* C);
/* LX_BAD_CHARACTER_ERROR.string_ */
extern T0* T589f4(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.default_message */
extern T0* T588f5(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.message */
extern T0* T588f3(T0* C, T0* a1);
/* LX_BAD_CHARACTER_CLASS_ERROR.arguments */
extern T0* T588f6(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.string_ */
extern T0* T588f4(T0* C);
/* LX_MISSING_QUOTE_ERROR.default_message */
extern T0* T587f5(T0* C);
/* LX_MISSING_QUOTE_ERROR.message */
extern T0* T587f3(T0* C, T0* a1);
/* LX_MISSING_QUOTE_ERROR.arguments */
extern T0* T587f6(T0* C);
/* LX_MISSING_QUOTE_ERROR.string_ */
extern T0* T587f4(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.default_message */
extern T0* T586f5(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.message */
extern T0* T586f3(T0* C, T0* a1);
/* LX_UNRECOGNIZED_RULE_ERROR.arguments */
extern T0* T586f6(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.string_ */
extern T0* T586f4(T0* C);
/* UT_SYNTAX_ERROR.default_message */
extern T0* T584f5(T0* C);
/* UT_SYNTAX_ERROR.message */
extern T0* T584f3(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.arguments */
extern T0* T584f6(T0* C);
/* UT_SYNTAX_ERROR.string_ */
extern T0* T584f4(T0* C);
/* UT_VERSION_NUMBER.default_message */
extern T0* T49f3(T0* C);
/* UT_VERSION_NUMBER.message */
extern T0* T49f5(T0* C, T0* a1);
/* UT_VERSION_NUMBER.arguments */
extern T0* T49f7(T0* C);
/* UT_VERSION_NUMBER.string_ */
extern T0* T49f6(T0* C);
/* AP_DISPLAY_HELP_FLAG.was_found */
extern T1 T73f11(T0* C);
/* AP_STRING_OPTION.was_found */
extern T1 T37f16(T0* C);
/* AP_FLAG.was_found */
extern T1 T35f9(T0* C);
/* AP_STRING_OPTION.occurrences */
extern T6 T37f18(T0* C);
/* AP_DISPLAY_HELP_FLAG.allows_parameter */
extern T1 T73f9(T0* C);
/* AP_STRING_OPTION.allows_parameter */
extern T1 T37f17(T0* C);
/* AP_FLAG.allows_parameter */
extern T1 T35f12(T0* C);
/* AP_DISPLAY_HELP_FLAG.needs_parameter */
extern T1 T73f12(T0* C);
/* AP_FLAG.needs_parameter */
extern T1 T35f11(T0* C);
/* AP_DISPLAY_HELP_FLAG.name */
extern T0* T73f22(T0* C);
/* AP_STRING_OPTION.name */
extern T0* T37f11(T0* C);
/* AP_FLAG.name */
extern T0* T35f15(T0* C);
/* AP_DISPLAY_HELP_FLAG.names */
extern T0* T73f23(T0* C);
/* AP_STRING_OPTION.names */
extern T0* T37f19(T0* C);
/* AP_STRING_OPTION.names */
extern T0* T37f19p1(T0* C);
/* AP_FLAG.names */
extern T0* T35f16(T0* C);
/* AP_DISPLAY_HELP_FLAG.example */
extern T0* T73f28(T0* C);
/* AP_STRING_OPTION.example */
extern T0* T37f20(T0* C);
/* AP_FLAG.example */
extern T0* T35f17(T0* C);
/* AP_DISPLAY_HELP_FLAG.has_long_form */
extern T1 T73f10(T0* C);
/* AP_STRING_OPTION.has_long_form */
extern T1 T37f12(T0* C);
/* AP_FLAG.has_long_form */
extern T1 T35f10(T0* C);
/* GEANT_ARGUMENT_VARIABLES.found */
extern T1 T34f34(T0* C);
/* GEANT_VARIABLES.found */
extern T1 T29f36(T0* C);
/* GEANT_PROJECT_VARIABLES.found */
extern T1 T25f44(T0* C);
/* GEANT_ARGUMENT_VARIABLES.found_item */
extern T0* T34f44(T0* C);
/* GEANT_VARIABLES.found_item */
extern T0* T29f44(T0* C);
/* GEANT_PROJECT_VARIABLES.found_item */
extern T0* T25f53(T0* C);
/* GEANT_ARGUMENT_VARIABLES.after */
extern T1 T34f45(T0* C);
/* GEANT_VARIABLES.after */
extern T1 T29f45(T0* C);
/* GEANT_PROJECT_VARIABLES.after */
extern T1 T25f56(T0* C);
/* GEANT_ARGUMENT_VARIABLES.key_for_iteration */
extern T0* T34f46(T0* C);
/* GEANT_VARIABLES.key_for_iteration */
extern T0* T29f46(T0* C);
/* GEANT_PROJECT_VARIABLES.key_for_iteration */
extern T0* T25f57(T0* C);
/* GEANT_ARGUMENT_VARIABLES.item_for_iteration */
extern T0* T34f47(T0* C);
/* GEANT_VARIABLES.item_for_iteration */
extern T0* T29f47(T0* C);
/* GEANT_PROJECT_VARIABLES.item_for_iteration */
extern T0* T25f58(T0* C);
/* GEANT_ARGUMENT_VARIABLES.has */
extern T1 T34f33(T0* C, T0* a1);
/* GEANT_VARIABLES.has */
extern T1 T29f32(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.has */
extern T1 T25f55(T0* C, T0* a1);
/* FILE_NAME.to_c */
extern T0* T659f6(T0* C);
/* UC_UTF8_STRING.to_c */
extern T0* T205f21(T0* C);
/* STRING_8.to_c */
extern T0* T17f12(T0* C);
extern T0* GE_ma33(T6 c, T6 n, ...);
extern T0* GE_ma108(T6 c, T6 n, ...);
extern T0* GE_ma179(T6 c, T6 n, ...);
extern T0* GE_ma614(T6 c, T6 n, ...);
extern T0* GE_ma244(T6 c, T6 n, ...);
extern T0* ge132ov5277;
extern T0* ge168ov2883;
extern T0* ge222ov6448;
extern T0* ge232ov7776;
extern T0* ge153ov9386;
extern T0* ge155ov3994;
extern T0* ge170ov2883;
extern T0* ge176ov4038;
extern T0* ge176ov4039;
extern T0* ge161ov4305;
extern T0* ge161ov4304;
extern T0* ge173ov4038;
extern T0* ge173ov4039;
extern T0* ge1531ov5402;
extern T0* ge1531ov5401;
extern T0* ge317ov10535;
extern T0* ge159ov2883;
extern T0* ge1384ov2868;
extern T0* ge446ov9591;
extern T0* ge154ov4196;
extern T0* ge489ov9291;
extern T0* ge268ov2883;
extern T0* ge1538ov5843;
extern T0* ge1538ov5805;
extern T0* ge1538ov5803;
extern T0* ge1538ov5844;
extern T0* ge1538ov5816;
extern T0* ge1538ov5815;
extern T0* ge1538ov5826;
extern T0* ge1538ov5820;
extern T0* ge1538ov5819;
extern T0* ge1538ov5818;
extern T0* ge1538ov5824;
extern T0* ge1538ov5823;
extern T0* ge1538ov5825;
extern T0* ge1538ov5802;
extern T0* ge1538ov5828;
extern T0* ge1538ov5837;
extern T0* ge1541ov5538;
extern T0* ge1541ov5536;
extern T0* ge1541ov5537;
extern T0* ge1538ov5838;
extern T0* ge1538ov5839;
extern T0* ge1538ov5842;
extern T0* ge1538ov5840;
extern T0* ge1538ov5841;
extern T0* ge1538ov5835;
extern T0* ge1534ov7167;
extern T0* ge1534ov7168;
extern T0* ge1538ov5808;
extern T0* ge1538ov5831;
extern T0* ge1538ov5851;
extern T0* ge1538ov5852;
extern T0* ge1538ov5853;
extern T0* ge1538ov5846;
extern T0* ge1538ov5829;
extern T0* ge1538ov5830;
extern T0* ge1538ov5832;
extern T0* ge1538ov5836;
extern T0* ge176ov4049;
extern T0* ge173ov4049;
extern T0* ge103ov2567;
extern T0* ge106ov2850;
extern T0* ge106ov2857;
extern T0* ge192ov1748;
extern T0* ge106ov2853;
extern T0* ge106ov2860;
extern T0* ge106ov2851;
extern T0* ge106ov2858;
extern T0* ge106ov2852;
extern T0* ge106ov2859;
extern T0* ge106ov2854;
extern T0* ge106ov2861;
extern T0* ge106ov2855;
extern T0* ge106ov2862;
extern T0* ge103ov2562;
extern T0* ge103ov2561;
extern T0* ge103ov2569;
extern T0* ge103ov2568;
extern T0* ge450ov11074;
extern T0* ge450ov11111;
extern T0* ge450ov11096;
extern T0* ge450ov11089;
extern T0* ge450ov11099;
extern T0* ge450ov11092;
extern T0* ge450ov11100;
extern T0* ge450ov11109;
extern T0* ge450ov11102;
extern T0* ge450ov11098;
extern T0* ge450ov11086;
extern T0* ge450ov11087;
extern T0* ge450ov11101;
extern T0* ge450ov11088;
extern T0* ge450ov11075;
extern T0* ge450ov11076;
extern T0* ge450ov11077;
extern T0* ge450ov11083;
extern T0* ge450ov11085;
extern T0* ge450ov11080;
extern T0* ge450ov11105;
extern T0* ge450ov11104;
extern T0* ge450ov11081;
extern T0* ge450ov11082;
extern T0* ge450ov11079;
extern T0* ge450ov11078;
extern T0* ge42ov8846;
extern T0* ge156ov4176;
extern T0* ge154ov4198;
extern T0* ge153ov9385;
extern T0* ge1545ov6666;
extern T0* ge1545ov6667;
extern T0* ge1536ov7784;
extern T0* ge1536ov7786;
extern T0* ge1488ov6141;
extern T0* ge1469ov7488;
extern T0* ge1469ov7489;
extern T0* ge104ov5229;
extern T0* ge104ov5230;
extern T0* ge104ov5231;
extern T0* ge104ov5228;
extern T0* ge1536ov7783;
extern T0* ge1536ov7785;
extern T0* ge302ov2866;
extern T0* ge288ov2866;
extern T0* ge294ov2866;
extern T0* ge293ov2866;
extern T0* ge292ov2866;
extern T0* ge283ov2866;
extern T0* ge282ov2866;
extern T0* ge299ov2866;
extern T0* ge312ov2866;
extern T0* ge1388ov2866;
extern T0* ge1393ov2866;
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
	copyright: "Copyright (c) 2006-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_MISC_H
#define EIF_MISC_H

#ifdef __cplusplus
extern "C" {
#endif

extern EIF_INTEGER eif_system(char* s);
extern void eif_system_asynchronous(char* cmd);
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

		"C functions used to implement class PATH_NAME"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_PATH_NAME_H
#define EIF_PATH_NAME_H

#ifdef __cplusplus
extern "C" {
#endif

extern EIF_BOOLEAN eif_is_volume_name_valid(EIF_CHARACTER* p);
extern EIF_BOOLEAN eif_is_directory_name_valid(EIF_CHARACTER* p);
extern void eif_append_directory(EIF_REFERENCE string, EIF_CHARACTER* p, EIF_CHARACTER* v);
extern void eif_set_directory(EIF_REFERENCE string, EIF_CHARACTER* p, EIF_CHARACTER* v);
extern EIF_BOOLEAN eif_path_name_compare(EIF_CHARACTER* s, EIF_CHARACTER* t, EIF_INTEGER length);
extern EIF_REFERENCE eif_volume_name(EIF_CHARACTER* p);
extern EIF_REFERENCE eif_extracted_paths(EIF_CHARACTER* p);
extern void eif_append_file_name(EIF_REFERENCE string, EIF_CHARACTER* p, EIF_CHARACTER* v);
extern EIF_BOOLEAN eif_is_file_name_valid(EIF_CHARACTER* p);
extern EIF_BOOLEAN eif_is_extension_valid(EIF_CHARACTER* p);
extern EIF_BOOLEAN eif_is_file_valid(EIF_CHARACTER* p);
extern EIF_BOOLEAN eif_is_directory_valid(EIF_CHARACTER* p);
extern EIF_BOOLEAN eif_home_dir_supported(void);
extern EIF_BOOLEAN eif_root_dir_supported(void);
extern EIF_BOOLEAN eif_case_sensitive_path_names(void);
extern EIF_REFERENCE eif_current_dir_representation(void);
extern EIF_REFERENCE eif_home_directory_name(void);
extern EIF_REFERENCE eif_root_directory_name(void);

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
