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

/* GEYACC */
typedef struct S21 T21;

/* PR_FSM */
typedef struct S22 T22;

/* PR_PARSER_GENERATOR */
typedef struct S23 T23;

/* KL_TEXT_OUTPUT_FILE */
typedef struct S24 T24;

/* UT_CANNOT_WRITE_TO_FILE_ERROR */
typedef struct S25 T25;

/* KL_ARGUMENTS */
typedef struct S27 T27;

/* UT_ERROR_HANDLER */
typedef struct S28 T28;

/* PR_GRAMMAR */
typedef struct S29 T29;

/* PR_XML_DOC_GENERATOR */
typedef struct S30 T30;

/* PR_HTML_DOC_GENERATOR */
typedef struct S31 T31;

/* KL_EXCEPTIONS */
typedef struct S34 T34;

/* KL_STANDARD_FILES */
typedef struct S35 T35;

/* KL_STDOUT_FILE */
typedef struct S36 T36;

/* KL_EQUALITY_TESTER [PR_RULE] */
typedef struct S37 T37;

/* KL_EQUALITY_TESTER [PR_TOKEN] */
typedef struct S38 T38;

/* KL_EQUALITY_TESTER [PR_VARIABLE] */
typedef struct S39 T39;

/* KL_EQUALITY_TESTER [PR_TYPE] */
typedef struct S40 T40;

/* KL_EQUALITY_TESTER [INTEGER_32] */
typedef struct S41 T41;

/* KL_EQUALITY_TESTER [STRING_8] */
typedef struct S42 T42;

/* KL_EQUALITY_TESTER [PR_TRANSITION] */
typedef struct S43 T43;

/* KL_EQUALITY_TESTER [PR_REDUCTION] */
typedef struct S44 T44;

/* KL_EQUALITY_TESTER [PR_STATE] */
typedef struct S45 T45;

/* KL_EQUALITY_TESTER [PR_PORTION] */
typedef struct S46 T46;

/* KL_EQUALITY_TESTER [PR_CONFLICT] */
typedef struct S47 T47;

/* KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_VARIABLE]] */
typedef struct S48 T48;

/* KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_STATE]] */
typedef struct S49 T49;

/* PR_YACC_PARSER */
typedef struct S50 T50;

/* KL_TEXT_INPUT_FILE */
typedef struct S51 T51;

/* UT_CANNOT_READ_FILE_ERROR */
typedef struct S52 T52;

/* KL_STDIN_FILE */
typedef struct S54 T54;

/* UT_VERSION_NUMBER */
typedef struct S55 T55;

/* UT_USAGE_MESSAGE */
typedef struct S56 T56;

/* DS_ARRAYED_LIST [PR_STATE] */
typedef struct S57 T57;

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32] */
typedef struct S58 T58;

/* PR_STATE */
typedef struct S59 T59;

/* UT_MESSAGE */
typedef struct S62 T62;

/* DS_LINKED_LIST [PR_CONFLICT] */
typedef struct S63 T63;

/* PR_CONFLICT */
typedef struct S65 T65;

/* KL_INTEGER_ROUTINES */
typedef struct S67 T67;

/* DS_ARRAYED_LIST [PR_POSITION] */
typedef struct S68 T68;

/* PR_POSITION */
typedef struct S69 T69;

/* PR_ERROR_ACTION */
typedef struct S70 T70;

/* DS_ARRAYED_LIST [PR_RULE] */
typedef struct S71 T71;

/* PR_RULE */
typedef struct S72 T72;

/* PR_VARIABLE */
typedef struct S73 T73;

/* DS_LINKED_LIST [PR_REDUCTION] */
typedef struct S74 T74;

/* DS_LINKED_LIST [PR_TRANSITION] */
typedef struct S76 T76;

/* DS_NESTED_LIST_FLATTENER [PR_TOKEN] */
typedef struct S78 T78;

/* DS_LINKED_LIST [PR_TOKEN] */
typedef struct S79 T79;

/* DS_ARRAYED_LIST [PR_SYMBOL] */
typedef struct S80 T80;

/* DS_ARRAYED_STACK [PR_STATE] */
typedef struct S81 T81;

/* PR_TRANSITION */
typedef struct S82 T82;

/* PR_TOKEN */
typedef struct S84 T84;

/* DS_ARRAYED_LIST [PR_REDUCTION] */
typedef struct S85 T85;

/* DS_LINKED_LIST_CURSOR [PR_TRANSITION] */
typedef struct S87 T87;

/* DS_LINKED_LIST_CURSOR [PR_REDUCTION] */
typedef struct S89 T89;

/* PR_REDUCTION */
typedef struct S90 T90;

/* DS_ARRAYED_LIST [PR_VARIABLE] */
typedef struct S91 T91;

/* DS_NESTED_LIST_FLATTENER [PR_RULE] */
typedef struct S92 T92;

/* DS_LINKED_LIST [PR_VARIABLE] */
typedef struct S93 T93;

/* DS_LINKED_LIST [PR_RULE] */
typedef struct S94 T94;

/* SPECIAL [detachable PR_STATE] */
typedef struct S96 T96;

/* ARRAY [detachable PR_STATE] */
typedef struct S97 T97;

/* DS_ARRAYED_LIST [PR_TOKEN] */
typedef struct S98 T98;

/* PR_TYPE */
typedef struct S99 T99;

/* DS_LINKED_LIST_CURSOR [PR_RULE] */
typedef struct S100 T100;

/* SPECIAL [INTEGER_32] */
typedef struct S101 T101;

/* ARRAY [INTEGER_32] */
typedef struct S102 T102;

/* DS_ARRAYED_LIST [PR_PORTION] */
typedef struct S103 T103;

/* DS_ARRAYED_LIST [INTEGER_32] */
typedef struct S104 T104;

/* PR_PORTION */
typedef struct S105 T105;

/* DS_BUBBLE_SORTER [PR_PORTION] */
typedef struct S107 T107;

/* KL_ARRAY_ROUTINES [INTEGER_32] */
typedef struct S109 T109;

/* UT_STRING_FORMATTER */
typedef struct S110 T110;

/* DS_ARRAYED_LIST [STRING_8] */
typedef struct S111 T111;

/* DS_ARRAYED_LIST [PR_TYPE] */
typedef struct S112 T112;

/* DS_HASH_SET [PR_TYPE] */
typedef struct S113 T113;

/* DS_HASH_SET_CURSOR [PR_TYPE] */
typedef struct S114 T114;

/* SPECIAL [detachable PR_TRANSITION] */
typedef struct S116 T116;

/* ARRAY [detachable PR_TRANSITION] */
typedef struct S117 T117;

/* KL_STRING_ROUTINES */
typedef struct S118 T118;

/* UT_ARRAY_FORMATTER */
typedef struct S119 T119;

/* TYPED_POINTER [ANY] */
typedef struct S121 T121;

/* SPECIAL [STRING_8] */
typedef struct S122 T122;

/* ARRAY [STRING_8] */
typedef struct S123 T123;

/* KL_STDERR_FILE */
typedef struct S124 T124;

/* PR_ACTION_FACTORY */
typedef struct S125 T125;

/* DS_HASH_TABLE [PR_TOKEN, STRING_8] */
typedef struct S126 T126;

/* DS_HASH_TABLE [PR_VARIABLE, STRING_8] */
typedef struct S127 T127;

/* DS_HASH_TABLE [PR_TYPE, STRING_8] */
typedef struct S128 T128;

/* YY_FILE_BUFFER */
typedef struct S129 T129;

/* YY_BUFFER */
typedef struct S130 T130;

/* KL_SPECIAL_ROUTINES [INTEGER_32] */
typedef struct S131 T131;

/* SPECIAL [ANY] */
typedef struct S133 T133;

/* KL_SPECIAL_ROUTINES [ANY] */
typedef struct S134 T134;

/* KL_SPECIAL_ROUTINES [STRING_8] */
typedef struct S135 T135;

/* DS_ARRAYED_LIST [PR_LABELED_TYPE] */
typedef struct S136 T136;

/* PR_LABELED_TYPE */
typedef struct S137 T137;

/* DS_PAIR [STRING_8, INTEGER_32] */
typedef struct S138 T138;

/* SPECIAL [PR_TYPE] */
typedef struct S139 T139;

/* KL_SPECIAL_ROUTINES [PR_TYPE] */
typedef struct S140 T140;

/* SPECIAL [DS_ARRAYED_LIST [PR_TYPE]] */
typedef struct S141 T141;

/* SPECIAL [DS_ARRAYED_LIST [PR_LABELED_TYPE]] */
typedef struct S142 T142;

/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_TYPE]] */
typedef struct S143 T143;

/* SPECIAL [PR_LABELED_TYPE] */
typedef struct S144 T144;

/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_LABELED_TYPE]] */
typedef struct S145 T145;

/* KL_SPECIAL_ROUTINES [PR_LABELED_TYPE] */
typedef struct S146 T146;

/* SPECIAL [PR_TOKEN] */
typedef struct S147 T147;

/* KL_SPECIAL_ROUTINES [PR_TOKEN] */
typedef struct S148 T148;

/* DS_ARRAYED_LIST [PR_ERROR_ACTION] */
typedef struct S149 T149;

/* UT_SYNTAX_ERROR */
typedef struct S150 T150;

/* ARRAY [detachable PR_TOKEN] */
typedef struct S151 T151;

/* PR_MULTIPLE_START_DECLARATIONS_ERROR */
typedef struct S152 T152;

/* PR_NO_RULES_ERROR */
typedef struct S153 T153;

/* PR_LHS_SYMBOL_TOKEN_ERROR */
typedef struct S154 T154;

/* PR_RULE_DECLARED_TWICE_ERROR */
typedef struct S155 T155;

/* PR_INVALID_ERROR_N_ERROR */
typedef struct S156 T156;

/* PR_PREC_SPECIFIED_TWICE_ERROR */
typedef struct S157 T157;

/* PR_PREC_NOT_TOKEN_ERROR */
typedef struct S158 T158;

/* PR_MISSING_CHARACTERS_ERROR */
typedef struct S159 T159;

/* PR_NULL_INTEGER_ERROR */
typedef struct S160 T160;

/* PR_INVALID_STRING_TOKEN_ERROR */
typedef struct S161 T161;

/* PR_INVALID_DOLLAR_DOLLAR_ERROR */
typedef struct S162 T162;

/* PR_INTEGER_TOO_LARGE_ERROR */
typedef struct S163 T163;

/* PR_START_SYMBOL_TOKEN_ERROR */
typedef struct S164 T164;

/* PR_UNKNOWN_START_SYMBOL_ERROR */
typedef struct S165 T165;

/* PR_TOKEN_ID_USED_TWICE_ERROR */
typedef struct S166 T166;

/* PR_UNDEFINED_SYMBOL_ERROR */
typedef struct S167 T167;

/* PR_ALIAS_NAME_UNDEFINED_ERROR */
typedef struct S168 T168;

/* PR_LAST_VALUE_NAME_USED_TWICE_ERROR */
typedef struct S169 T169;

/* PR_ALIAS_NAME_NOT_DEFINED_ERROR */
typedef struct S170 T170;

/* PR_ALIAS_NAME_DEFINED_TWICE_ERROR */
typedef struct S171 T171;

/* PR_TWO_TOKEN_IDS_TOKEN_ERROR */
typedef struct S172 T172;

/* PR_TWO_STRINGS_TOKEN_ERROR */
typedef struct S173 T173;

/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR */
typedef struct S174 T174;

/* PR_DANGEROUS_DOLLAR_N_ERROR */
typedef struct S175 T175;

/* PR_INVALID_DOLLAR_N_ERROR */
typedef struct S176 T176;

/* KL_COMPARABLE_COMPARATOR [PR_PORTION] */
typedef struct S179 T179;

/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]] */
typedef struct S182 T182;

/* PR_BASIC_TYPE */
typedef struct S183 T183;

/* PR_ACTION */
typedef struct S184 T184;

/* PR_SYMBOL_DECLARED_VARIABLE_ERROR */
typedef struct S185 T185;

/* PR_TOKEN_DECLARED_TWICE_ERROR */
typedef struct S186 T186;

/* PR_SYMBOL_DECLARED_TOKEN_ERROR */
typedef struct S187 T187;

/* PR_VARIABLE_DECLARED_TWICE_ERROR */
typedef struct S188 T188;

/* PR_UNDEFINED_STRING_TOKEN_ERROR */
typedef struct S189 T189;

/* PR_PRECEDENCE_DEFINED_TWICE_ERROR */
typedef struct S190 T190;

/* UNIX_FILE_INFO */
typedef struct S191 T191;

/* KL_SPECIAL_ROUTINES [PR_STATE] */
typedef struct S192 T192;

/* DS_ARRAYED_LIST_CURSOR [PR_STATE] */
typedef struct S193 T193;

/* SPECIAL [DS_ARRAYED_LIST [PR_STATE]] */
typedef struct S194 T194;

/* DS_SPARSE_TABLE_KEYS [DS_ARRAYED_LIST [PR_STATE], INTEGER_32] */
typedef struct S195 T195;

/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_STATE]] */
typedef struct S197 T197;

/* DS_HASH_TABLE_CURSOR [DS_ARRAYED_LIST [PR_STATE], INTEGER_32] */
typedef struct S198 T198;

/* KL_ANY_ROUTINES */
typedef struct S199 T199;

/* DS_BUBBLE_SORTER [PR_POSITION] */
typedef struct S200 T200;

/* SPECIAL [PR_POSITION] */
typedef struct S202 T202;

/* KL_EQUALITY_TESTER [PR_POSITION] */
typedef struct S203 T203;

/* KL_SPECIAL_ROUTINES [PR_POSITION] */
typedef struct S204 T204;

/* DS_ARRAYED_LIST_CURSOR [PR_POSITION] */
typedef struct S205 T205;

/* SPECIAL [PR_RULE] */
typedef struct S206 T206;

/* KL_SPECIAL_ROUTINES [PR_RULE] */
typedef struct S207 T207;

/* DS_ARRAYED_LIST_CURSOR [PR_RULE] */
typedef struct S208 T208;

/* DS_LINKABLE [PR_REDUCTION] */
typedef struct S210 T210;

/* DS_LINKABLE [PR_TRANSITION] */
typedef struct S211 T211;

/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]] */
typedef struct S213 T213;

/* SPECIAL [PR_SYMBOL] */
typedef struct S218 T218;

/* KL_SPECIAL_ROUTINES [PR_SYMBOL] */
typedef struct S219 T219;

/* DS_ARRAYED_LIST_CURSOR [PR_SYMBOL] */
typedef struct S220 T220;

/* KL_SPECIAL_ROUTINES [PR_REDUCTION] */
typedef struct S221 T221;

/* SPECIAL [PR_REDUCTION] */
typedef struct S222 T222;

/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION] */
typedef struct S223 T223;

/* SPECIAL [PR_VARIABLE] */
typedef struct S224 T224;

/* KL_SPECIAL_ROUTINES [PR_VARIABLE] */
typedef struct S225 T225;

/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE] */
typedef struct S226 T226;

/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]] */
typedef struct S229 T229;

/* DS_LINKED_LIST_CURSOR [PR_VARIABLE] */
typedef struct S234 T234;

/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN] */
typedef struct S235 T235;

/* KL_CHARACTER_ROUTINES */
typedef struct S236 T236;

/* DS_LINKABLE [PR_RULE] */
typedef struct S237 T237;

/* SPECIAL [PR_PORTION] */
typedef struct S238 T238;

/* KL_SPECIAL_ROUTINES [PR_PORTION] */
typedef struct S239 T239;

/* DS_ARRAYED_LIST_CURSOR [PR_PORTION] */
typedef struct S240 T240;

/* DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
typedef struct S242 T242;

/* UT_INTEGER_FORMATTER */
typedef struct S243 T243;

/* DS_ARRAYED_LIST_CURSOR [STRING_8] */
typedef struct S244 T244;

/* DS_ARRAYED_LIST_CURSOR [PR_TYPE] */
typedef struct S245 T245;

/* UC_UNICODE_ROUTINES */
typedef struct S247 T247;

/* DS_SPARSE_TABLE_KEYS [PR_TOKEN, STRING_8] */
typedef struct S248 T248;

/* DS_HASH_TABLE_CURSOR [PR_TOKEN, STRING_8] */
typedef struct S250 T250;

/* DS_SPARSE_TABLE_KEYS [PR_VARIABLE, STRING_8] */
typedef struct S251 T251;

/* DS_HASH_TABLE_CURSOR [PR_VARIABLE, STRING_8] */
typedef struct S253 T253;

/* DS_SPARSE_TABLE_KEYS [PR_TYPE, STRING_8] */
typedef struct S254 T254;

/* DS_HASH_TABLE_CURSOR [PR_TYPE, STRING_8] */
typedef struct S256 T256;

/* DS_ARRAYED_LIST_CURSOR [PR_LABELED_TYPE] */
typedef struct S257 T257;

/* KL_SPECIAL_ROUTINES [PR_ERROR_ACTION] */
typedef struct S258 T258;

/* SPECIAL [PR_ERROR_ACTION] */
typedef struct S259 T259;

/* DS_ARRAYED_LIST_CURSOR [PR_ERROR_ACTION] */
typedef struct S260 T260;

/* SPECIAL [NATURAL_8] */
typedef struct S261 T261;

/* STRING_TO_INTEGER_CONVERTOR */
typedef struct S263 T263;

/* KL_COMPARABLE_COMPARATOR [PR_POSITION] */
typedef struct S266 T266;

/* DS_LINKABLE [PR_TOKEN] */
typedef struct S270 T270;

/* DS_LINKED_LIST_CURSOR [PR_TOKEN] */
typedef struct S271 T271;

/* KL_CHARACTER_BUFFER */
typedef struct S275 T275;

/* SPECIAL [DS_ARRAYED_LIST [PR_VARIABLE]] */
typedef struct S276 T276;

/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_VARIABLE]] */
typedef struct S277 T277;

/* DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [PR_VARIABLE]] */
typedef struct S278 T278;

/* TYPED_POINTER [SPECIAL [CHARACTER_8]] */
typedef struct S279 T279;

/* DS_SPARSE_TABLE_KEYS_CURSOR [DS_ARRAYED_LIST [PR_STATE], INTEGER_32] */
typedef struct S280 T280;

/* SPECIAL [DS_NESTED_LIST [PR_TOKEN]] */
typedef struct S281 T281;

/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_TOKEN]] */
typedef struct S282 T282;

/* SPECIAL [DS_NESTED_LIST [PR_RULE]] */
typedef struct S283 T283;

/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_RULE]] */
typedef struct S284 T284;

/* SPECIAL [ARRAY [INTEGER_32]] */
typedef struct S285 T285;

/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
typedef struct S286 T286;

/* DS_SPARSE_TABLE_KEYS_CURSOR [PR_TOKEN, STRING_8] */
typedef struct S287 T287;

/* DS_SPARSE_TABLE_KEYS_CURSOR [PR_VARIABLE, STRING_8] */
typedef struct S288 T288;

/* DS_SPARSE_TABLE_KEYS_CURSOR [PR_TYPE, STRING_8] */
typedef struct S289 T289;

/* DS_LINKED_LIST_CURSOR [PR_CONFLICT] */
typedef struct S290 T290;

/* DS_LINKABLE [PR_CONFLICT] */
typedef struct S291 T291;

/* DS_HASH_TABLE [INTEGER_32, PR_TYPE] */
typedef struct S292 T292;

/* DS_HASH_TABLE_CURSOR [INTEGER_32, PR_TYPE] */
typedef struct S293 T293;

/* DS_LINKABLE [PR_VARIABLE] */
typedef struct S296 T296;

/* INTEGER_OVERFLOW_CHECKER */
typedef struct S297 T297;

/* DS_SPARSE_TABLE_KEYS [INTEGER_32, PR_TYPE] */
typedef struct S302 T302;

/* SPECIAL [NATURAL_64] */
typedef struct S304 T304;

/* DS_SPARSE_TABLE_KEYS_CURSOR [INTEGER_32, PR_TYPE] */
typedef struct S305 T305;

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
struct S121 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type TYPED_POINTER [SPECIAL [CHARACTER_8]] */
struct S279 {
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

/* Struct for type GEYACC */
struct S21 {
	int id;
	T0* a1; /* error_handler */
	T1 a2; /* old_typing */
	T1 a3; /* line_pragma */
	T0* a4; /* grammar */
	T0* a5; /* doc_format */
	T0* a6; /* output_filename */
	T0* a7; /* verbose_filename */
	T0* a8; /* input_filename */
	T0* a9; /* token_classname */
	T0* a10; /* token_filename */
	T1 a11; /* actions_separated */
};

/* Struct for type PR_FSM */
struct S22 {
	int id;
	T0* a1; /* grammar */
	T0* a2; /* states */
	T0* a3; /* cached_states */
};

/* Struct for type PR_PARSER_GENERATOR */
struct S23 {
	int id;
	T0* a1; /* machine */
	T6 a2; /* yyFinal */
	T6 a3; /* yyFlag */
	T6 a4; /* array_size */
	T1 a5; /* line_pragma */
	T0* a6; /* input_filename */
	T1 a7; /* old_typing */
	T6 a8; /* yyNtbase */
	T6 a9; /* yyNsyms */
	T6 a10; /* yyMax_token */
	T0* a11; /* yytranslate */
	T0* a12; /* yyr1 */
	T0* a13; /* yytypes1 */
	T0* a14; /* yytypes2 */
	T0* a15; /* yydefact */
	T0* a16; /* yydefgoto */
	T0* a17; /* yypact */
	T0* a18; /* yypgoto */
	T0* a19; /* yytable */
	T0* a20; /* yycheck */
	T6 a21; /* yyLast */
};

/* Struct for type KL_TEXT_OUTPUT_FILE */
struct S24 {
	int id;
	T6 a1; /* mode */
	T0* a2; /* name */
	T0* a3; /* string_name */
	T0* a4; /* last_string */
	T14 a5; /* file_pointer */
	T1 a6; /* descriptor_available */
};

/* Struct for type UT_CANNOT_WRITE_TO_FILE_ERROR */
struct S25 {
	int id;
	T0* a1; /* parameters */
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

/* Struct for type PR_GRAMMAR */
struct S29 {
	int id;
	T0* a1; /* rules */
	T6 a2; /* expected_conflicts */
	T0* a3; /* start_symbol */
	T0* a4; /* variables */
	T0* a5; /* tokens */
	T0* a6; /* eiffel_header */
	T0* a7; /* types */
	T0* a8; /* eiffel_code */
};

/* Struct for type PR_XML_DOC_GENERATOR */
struct S30 {
	int id;
	T0* a1; /* grammar */
	T1 a2; /* lhs_shared */
};

/* Struct for type PR_HTML_DOC_GENERATOR */
struct S31 {
	int id;
	T0* a1; /* grammar */
	T1 a2; /* lhs_shared */
};

/* Struct for type KL_EXCEPTIONS */
struct S34 {
	int id;
};

/* Struct for type KL_STANDARD_FILES */
struct S35 {
	int id;
};

/* Struct for type KL_STDOUT_FILE */
struct S36 {
	int id;
	T14 a1; /* file_pointer */
	T0* a2; /* name */
	T6 a3; /* mode */
	T0* a4; /* last_string */
};

/* Struct for type KL_EQUALITY_TESTER [PR_RULE] */
struct S37 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [PR_TOKEN] */
struct S38 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [PR_VARIABLE] */
struct S39 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [PR_TYPE] */
struct S40 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [INTEGER_32] */
struct S41 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [STRING_8] */
struct S42 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [PR_TRANSITION] */
struct S43 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [PR_REDUCTION] */
struct S44 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [PR_STATE] */
struct S45 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [PR_PORTION] */
struct S46 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [PR_CONFLICT] */
struct S47 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_VARIABLE]] */
struct S48 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_STATE]] */
struct S49 {
	int id;
};

/* Struct for type PR_YACC_PARSER */
struct S50 {
	int id;
	T1 a1; /* successful */
	T0* a2; /* last_grammar */
	T0* a3; /* action_factory */
	T0* a4; /* terminal_symbols */
	T0* a5; /* nonterminal_symbols */
	T0* a6; /* types */
	T0* a7; /* last_value_names */
	T1 a8; /* old_typing */
	T0* a9; /* error_handler */
	T0* a10; /* action_buffer */
	T6 a11; /* line_nb */
	T0* a12; /* yyss */
	T0* a13; /* input_buffer */
	T6 a14; /* yy_end */
	T6 a15; /* yy_position */
	T6 a16; /* yy_line */
	T6 a17; /* yy_column */
	T6 a18; /* yy_parsing_status */
	T6 a19; /* yy_suspended_yystacksize */
	T6 a20; /* yy_suspended_yystate */
	T6 a21; /* yy_suspended_yyn */
	T6 a22; /* yy_suspended_yychar1 */
	T6 a23; /* yy_suspended_index */
	T6 a24; /* yy_suspended_yyss_top */
	T6 a25; /* yy_suspended_yy_goto */
	T0* a26; /* yyr1 */
	T6 a27; /* yyssp */
	T0* a28; /* yypgoto */
	T0* a29; /* yycheck */
	T0* a30; /* yytable */
	T0* a31; /* yydefgoto */
	T6 a32; /* error_count */
	T1 a33; /* yy_lookahead_needed */
	T6 a34; /* yyerrstatus */
	T0* a35; /* yypact */
	T6 a36; /* last_token */
	T0* a37; /* yytranslate */
	T0* a38; /* yydefact */
	T0* a39; /* yytypes1 */
	T0* a40; /* yytypes2 */
	T6 a41; /* yy_start */
	T6 a42; /* yyvsp1 */
	T6 a43; /* yyvsp2 */
	T6 a44; /* yyvsp3 */
	T6 a45; /* yyvsp4 */
	T6 a46; /* yyvsp5 */
	T6 a47; /* yyvsp6 */
	T6 a48; /* yyvsp7 */
	T6 a49; /* yyvsp8 */
	T1 a50; /* yy_more_flag */
	T6 a51; /* yy_more_len */
	T6 a52; /* line */
	T6 a53; /* column */
	T6 a54; /* position */
	T6 a55; /* yy_start_state */
	T0* a56; /* yy_state_stack */
	T6 a57; /* yy_state_count */
	T0* a58; /* yy_content_area */
	T0* a59; /* yy_ec */
	T0* a60; /* yy_content */
	T0* a61; /* yy_accept */
	T6 a62; /* yy_last_accepting_state */
	T6 a63; /* yy_last_accepting_cpos */
	T0* a64; /* yy_chk */
	T0* a65; /* yy_base */
	T0* a66; /* yy_def */
	T0* a67; /* yy_meta */
	T0* a68; /* yy_nxt */
	T6 a69; /* yy_lp */
	T0* a70; /* yy_acclist */
	T6 a71; /* yy_looking_for_trail_begin */
	T6 a72; /* yy_full_match */
	T6 a73; /* yy_full_state */
	T6 a74; /* yy_full_lp */
	T1 a75; /* yy_rejected */
	T6 a76; /* yyvsc1 */
	T0* a77; /* yyvs1 */
	T0* a78; /* yyspecial_routines1 */
	T0* a79; /* last_any_value */
	T6 a80; /* yyvsc2 */
	T0* a81; /* yyvs2 */
	T0* a82; /* yyspecial_routines2 */
	T0* a83; /* last_string_value */
	T6 a84; /* yyvsc3 */
	T0* a85; /* yyvs3 */
	T0* a86; /* yyspecial_routines3 */
	T6 a87; /* last_integer_value */
	T6 a88; /* precedence */
	T0* a89; /* type */
	T0* a90; /* start_symbol */
	T0* a91; /* yyvs5 */
	T6 a92; /* yyvsc5 */
	T0* a93; /* yyspecial_routines5 */
	T0* a94; /* yyvs6 */
	T0* a95; /* yyvs8 */
	T6 a96; /* yyvsc6 */
	T0* a97; /* yyspecial_routines6 */
	T0* a98; /* yyvs7 */
	T6 a99; /* yyvsc8 */
	T0* a100; /* yyspecial_routines8 */
	T6 a101; /* yyvsc7 */
	T0* a102; /* yyspecial_routines7 */
	T6 a103; /* yyvsc4 */
	T0* a104; /* yyvs4 */
	T0* a105; /* yyspecial_routines4 */
	T0* a106; /* rule */
	T0* a107; /* precedence_token */
	T6 a108; /* last_error */
	T6 a109; /* nb_open_brackets */
};

/* Struct for type KL_TEXT_INPUT_FILE */
struct S51 {
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

/* Struct for type UT_CANNOT_READ_FILE_ERROR */
struct S52 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type KL_STDIN_FILE */
struct S54 {
	int id;
	T0* a1; /* last_string */
	T1 a2; /* end_of_file */
	T14 a3; /* file_pointer */
	T0* a4; /* name */
	T6 a5; /* mode */
	T2 a6; /* last_character */
	T0* a7; /* character_buffer */
};

/* Struct for type UT_VERSION_NUMBER */
struct S55 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type UT_USAGE_MESSAGE */
struct S56 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type DS_ARRAYED_LIST [PR_STATE] */
struct S57 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T0* a5; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32] */
struct S58 {
	int id;
	T6 a1; /* capacity */
	T6 a2; /* found_position */
	T0* a3; /* item_storage */
	T0* a4; /* key_equality_tester */
	T6 a5; /* modulus */
	T6 a6; /* last_position */
	T6 a7; /* position */
	T6 a8; /* free_slot */
	T6 a9; /* count */
	T0* a10; /* equality_tester */
	T0* a11; /* internal_keys */
	T0* a12; /* slots */
	T0* a13; /* clashes */
	T0* a14; /* special_item_routines */
	T0* a15; /* key_storage */
	T0* a16; /* special_key_routines */
	T6 a17; /* slots_position */
	T6 a18; /* clashes_previous_position */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type PR_STATE */
struct S59 {
	int id;
	T0* a1; /* shifts */
	T6 a2; /* hash_code */
	T0* a3; /* positions */
	T6 a4; /* id */
	T0* a5; /* accessing_symbol */
	T0* a6; /* reductions */
	T0* a7; /* errors */
	T1 a8; /* lookahead_needed */
	T1 a9; /* has_conflict */
	T0* a10; /* error_action */
};

/* Struct for type UT_MESSAGE */
struct S62 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type DS_LINKED_LIST [PR_CONFLICT] */
struct S63 {
	int id;
	T0* a1; /* first_cell */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* internal_cursor */
};

/* Struct for type PR_CONFLICT */
struct S65 {
	int id;
	T0* a1; /* state */
	T0* a2; /* rule */
	T0* a3; /* token */
	T0* a4; /* resolution */
};

/* Struct for type KL_INTEGER_ROUTINES */
struct S67 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST [PR_POSITION] */
struct S68 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* equality_tester */
	T6 a4; /* capacity */
	T0* a5; /* special_routines */
	T0* a6; /* internal_cursor */
};

/* Struct for type PR_POSITION */
struct S69 {
	int id;
	T6 a1; /* index */
	T0* a2; /* rule */
};

/* Struct for type PR_ERROR_ACTION */
struct S70 {
	int id;
	T0* a1; /* action */
	T6 a2; /* line_nb */
};

/* Struct for type DS_ARRAYED_LIST [PR_RULE] */
struct S71 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* special_routines */
	T0* a5; /* internal_cursor */
	T0* a6; /* equality_tester */
};

/* Struct for type PR_RULE */
struct S72 {
	int id;
	T0* a1; /* rhs */
	T0* a2; /* lhs */
	T0* a3; /* error_actions */
	T0* a4; /* action */
	T6 a5; /* line_nb */
	T6 a6; /* id */
	T6 a7; /* associativity */
	T6 a8; /* precedence */
	T1 a9; /* is_useful */
};

/* Struct for type PR_VARIABLE */
struct S73 {
	int id;
	T0* a1; /* rules */
	T0* a2; /* derives */
	T1 a3; /* is_useful */
	T0* a4; /* type */
	T6 a5; /* id */
	T0* a6; /* name */
	T0* a7; /* transitions */
	T0* a8; /* firsts */
	T1 a9; /* is_nullable */
	T6 a10; /* index */
};

/* Struct for type DS_LINKED_LIST [PR_REDUCTION] */
struct S74 {
	int id;
	T0* a1; /* first_cell */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_LINKED_LIST [PR_TRANSITION] */
struct S76 {
	int id;
	T0* a1; /* first_cell */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_NESTED_LIST_FLATTENER [PR_TOKEN] */
struct S78 {
	int id;
};

/* Struct for type DS_LINKED_LIST [PR_TOKEN] */
struct S79 {
	int id;
	T0* a1; /* first_cell */
	T0* a2; /* equality_tester */
	T0* a3; /* last_cell */
	T6 a4; /* count */
	T0* a5; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST [PR_SYMBOL] */
struct S80 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* special_routines */
	T0* a5; /* internal_cursor */
	T0* a6; /* equality_tester */
};

/* Struct for type DS_ARRAYED_STACK [PR_STATE] */
struct S81 {
	int id;
	T0* a1; /* storage */
	T6 a2; /* count */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type PR_TRANSITION */
struct S82 {
	int id;
	T0* a1; /* following_tokens */
	T0* a2; /* target */
	T0* a3; /* included_tokens */
	T0* a4; /* source */
	T6 a5; /* index */
};

/* Struct for type PR_TOKEN */
struct S84 {
	int id;
	T6 a1; /* token_id */
	T0* a2; /* name */
	T0* a3; /* literal_string */
	T1 a4; /* is_declared */
	T6 a5; /* precedence */
	T6 a6; /* id */
	T0* a7; /* type */
	T6 a8; /* associativity */
	T1 a9; /* is_useful */
};

/* Struct for type DS_ARRAYED_LIST [PR_REDUCTION] */
struct S85 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T6 a5; /* count */
};

/* Struct for type DS_LINKED_LIST_CURSOR [PR_TRANSITION] */
struct S87 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_LINKED_LIST_CURSOR [PR_REDUCTION] */
struct S89 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type PR_REDUCTION */
struct S90 {
	int id;
	T0* a1; /* rule */
	T0* a2; /* lookaheads */
	T0* a3; /* transitions */
};

/* Struct for type DS_ARRAYED_LIST [PR_VARIABLE] */
struct S91 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type DS_NESTED_LIST_FLATTENER [PR_RULE] */
struct S92 {
	int id;
};

/* Struct for type DS_LINKED_LIST [PR_VARIABLE] */
struct S93 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_LINKED_LIST [PR_RULE] */
struct S94 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* equality_tester */
	T0* a4; /* last_cell */
	T6 a5; /* count */
};

/* Struct for type SPECIAL [detachable PR_STATE] */
struct S96 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [detachable PR_STATE] */
struct S97 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_ARRAYED_LIST [PR_TOKEN] */
struct S98 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
	T0* a6; /* equality_tester */
};

/* Struct for type PR_TYPE */
struct S99 {
	int id;
	T0* a1; /* alias_name */
	T0* a2; /* name */
	T6 a3; /* id */
	T1 a4; /* is_used */
};

/* Struct for type DS_LINKED_LIST_CURSOR [PR_RULE] */
struct S100 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type SPECIAL [INTEGER_32] */
struct S101 {
	int id;
	T6 a1; /* count */
	T6 z2[1]; /* item */
};

/* Struct for type ARRAY [INTEGER_32] */
struct S102 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_ARRAYED_LIST [PR_PORTION] */
struct S103 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST [INTEGER_32] */
struct S104 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T6 a4; /* count */
	T0* a5; /* internal_cursor */
};

/* Struct for type PR_PORTION */
struct S105 {
	int id;
	T6 a1; /* id */
	T0* a2; /* froms */
	T0* a3; /* tos */
	T6 a4; /* count */
	T6 a5; /* width */
	T1 a6; /* is_state */
	T6 a7; /* position */
};

/* Struct for type DS_BUBBLE_SORTER [PR_PORTION] */
struct S107 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type KL_ARRAY_ROUTINES [INTEGER_32] */
struct S109 {
	int id;
};

/* Struct for type UT_STRING_FORMATTER */
struct S110 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST [STRING_8] */
struct S111 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST [PR_TYPE] */
struct S112 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type DS_HASH_SET [PR_TYPE] */
struct S113 {
	int id;
	T6 a1; /* count */
	T0* a2; /* clashes */
	T0* a3; /* item_storage */
	T6 a4; /* capacity */
	T6 a5; /* modulus */
	T6 a6; /* last_position */
	T6 a7; /* free_slot */
	T6 a8; /* position */
	T6 a9; /* slots_position */
	T0* a10; /* special_item_routines */
	T0* a11; /* slots */
	T6 a12; /* found_position */
	T0* a13; /* internal_cursor */
	T6 a14; /* clashes_previous_position */
	T0* a15; /* equality_tester */
	T0* a16; /* hash_function */
};

/* Struct for type DS_HASH_SET_CURSOR [PR_TYPE] */
struct S114 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type SPECIAL [detachable PR_TRANSITION] */
struct S116 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [detachable PR_TRANSITION] */
struct S117 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type KL_STRING_ROUTINES */
struct S118 {
	int id;
};

/* Struct for type UT_ARRAY_FORMATTER */
struct S119 {
	int id;
};

/* Struct for type SPECIAL [STRING_8] */
struct S122 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [STRING_8] */
struct S123 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type KL_STDERR_FILE */
struct S124 {
	int id;
	T14 a1; /* file_pointer */
	T0* a2; /* name */
	T6 a3; /* mode */
	T0* a4; /* last_string */
};

/* Struct for type PR_ACTION_FACTORY */
struct S125 {
	int id;
};

/* Struct for type DS_HASH_TABLE [PR_TOKEN, STRING_8] */
struct S126 {
	int id;
	T6 a1; /* position */
	T6 a2; /* found_position */
	T0* a3; /* item_storage */
	T0* a4; /* key_equality_tester */
	T6 a5; /* count */
	T6 a6; /* capacity */
	T6 a7; /* slots_position */
	T6 a8; /* free_slot */
	T6 a9; /* last_position */
	T6 a10; /* modulus */
	T6 a11; /* clashes_previous_position */
	T0* a12; /* equality_tester */
	T0* a13; /* internal_keys */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* key_storage */
	T0* a17; /* special_item_routines */
	T0* a18; /* special_key_routines */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type DS_HASH_TABLE [PR_VARIABLE, STRING_8] */
struct S127 {
	int id;
	T6 a1; /* count */
	T6 a2; /* found_position */
	T6 a3; /* position */
	T0* a4; /* item_storage */
	T0* a5; /* key_equality_tester */
	T6 a6; /* capacity */
	T6 a7; /* slots_position */
	T6 a8; /* free_slot */
	T6 a9; /* last_position */
	T6 a10; /* modulus */
	T6 a11; /* clashes_previous_position */
	T0* a12; /* equality_tester */
	T0* a13; /* internal_keys */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* key_storage */
	T0* a17; /* special_item_routines */
	T0* a18; /* special_key_routines */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type DS_HASH_TABLE [PR_TYPE, STRING_8] */
struct S128 {
	int id;
	T6 a1; /* found_position */
	T0* a2; /* item_storage */
	T0* a3; /* key_equality_tester */
	T6 a4; /* position */
	T6 a5; /* last_position */
	T6 a6; /* capacity */
	T6 a7; /* slots_position */
	T6 a8; /* count */
	T6 a9; /* free_slot */
	T0* a10; /* equality_tester */
	T0* a11; /* internal_keys */
	T6 a12; /* modulus */
	T6 a13; /* clashes_previous_position */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* key_storage */
	T0* a17; /* special_item_routines */
	T0* a18; /* special_key_routines */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type YY_FILE_BUFFER */
struct S129 {
	int id;
	T0* a1; /* content */
	T6 a2; /* index */
	T6 a3; /* line */
	T6 a4; /* column */
	T6 a5; /* position */
	T1 a6; /* beginning_of_line */
	T6 a7; /* count */
	T1 a8; /* filled */
	T0* a9; /* file */
	T1 a10; /* end_of_file */
	T6 a11; /* capacity */
	T1 a12; /* interactive */
};

/* Struct for type YY_BUFFER */
struct S130 {
	int id;
	T0* a1; /* content */
	T6 a2; /* index */
	T6 a3; /* line */
	T6 a4; /* column */
	T6 a5; /* position */
	T1 a6; /* beginning_of_line */
	T6 a7; /* count */
	T1 a8; /* filled */
	T6 a9; /* capacity */
};

/* Struct for type KL_SPECIAL_ROUTINES [INTEGER_32] */
struct S131 {
	int id;
};

/* Struct for type SPECIAL [ANY] */
struct S133 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ANY] */
struct S134 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [STRING_8] */
struct S135 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST [PR_LABELED_TYPE] */
struct S136 {
	int id;
	T0* a1; /* storage */
	T0* a2; /* special_routines */
	T6 a3; /* capacity */
	T6 a4; /* count */
	T0* a5; /* internal_cursor */
};

/* Struct for type PR_LABELED_TYPE */
struct S137 {
	int id;
	T0* a1; /* labels */
	T0* a2; /* type */
};

/* Struct for type DS_PAIR [STRING_8, INTEGER_32] */
struct S138 {
	int id;
	T0* a1; /* first */
	T6 a2; /* second */
};

/* Struct for type SPECIAL [PR_TYPE] */
struct S139 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [PR_TYPE] */
struct S140 {
	int id;
};

/* Struct for type SPECIAL [DS_ARRAYED_LIST [PR_TYPE]] */
struct S141 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [DS_ARRAYED_LIST [PR_LABELED_TYPE]] */
struct S142 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_TYPE]] */
struct S143 {
	int id;
};

/* Struct for type SPECIAL [PR_LABELED_TYPE] */
struct S144 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_LABELED_TYPE]] */
struct S145 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [PR_LABELED_TYPE] */
struct S146 {
	int id;
};

/* Struct for type SPECIAL [PR_TOKEN] */
struct S147 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [PR_TOKEN] */
struct S148 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST [PR_ERROR_ACTION] */
struct S149 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* a3; /* special_routines */
	T0* a4; /* storage */
	T0* a5; /* internal_cursor */
};

/* Struct for type UT_SYNTAX_ERROR */
struct S150 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ARRAY [detachable PR_TOKEN] */
struct S151 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type PR_MULTIPLE_START_DECLARATIONS_ERROR */
struct S152 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_NO_RULES_ERROR */
struct S153 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_LHS_SYMBOL_TOKEN_ERROR */
struct S154 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_RULE_DECLARED_TWICE_ERROR */
struct S155 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_INVALID_ERROR_N_ERROR */
struct S156 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_PREC_SPECIFIED_TWICE_ERROR */
struct S157 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_PREC_NOT_TOKEN_ERROR */
struct S158 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_MISSING_CHARACTERS_ERROR */
struct S159 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_NULL_INTEGER_ERROR */
struct S160 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_INVALID_STRING_TOKEN_ERROR */
struct S161 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_INVALID_DOLLAR_DOLLAR_ERROR */
struct S162 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_INTEGER_TOO_LARGE_ERROR */
struct S163 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_START_SYMBOL_TOKEN_ERROR */
struct S164 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_UNKNOWN_START_SYMBOL_ERROR */
struct S165 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_TOKEN_ID_USED_TWICE_ERROR */
struct S166 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_UNDEFINED_SYMBOL_ERROR */
struct S167 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_ALIAS_NAME_UNDEFINED_ERROR */
struct S168 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_LAST_VALUE_NAME_USED_TWICE_ERROR */
struct S169 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_ALIAS_NAME_NOT_DEFINED_ERROR */
struct S170 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_ALIAS_NAME_DEFINED_TWICE_ERROR */
struct S171 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_TWO_TOKEN_IDS_TOKEN_ERROR */
struct S172 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_TWO_STRINGS_TOKEN_ERROR */
struct S173 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_STRING_TOKEN_DEFINED_TWICE_ERROR */
struct S174 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_DANGEROUS_DOLLAR_N_ERROR */
struct S175 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_INVALID_DOLLAR_N_ERROR */
struct S176 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type KL_COMPARABLE_COMPARATOR [PR_PORTION] */
struct S179 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]] */
struct S182 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type PR_BASIC_TYPE */
struct S183 {
	int id;
	T0* a1; /* alias_name */
	T6 a2; /* id */
	T0* a3; /* name */
	T1 a4; /* is_used */
};

/* Struct for type PR_ACTION */
struct S184 {
	int id;
	T0* a1; /* text */
};

/* Struct for type PR_SYMBOL_DECLARED_VARIABLE_ERROR */
struct S185 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_TOKEN_DECLARED_TWICE_ERROR */
struct S186 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_SYMBOL_DECLARED_TOKEN_ERROR */
struct S187 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_VARIABLE_DECLARED_TWICE_ERROR */
struct S188 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_UNDEFINED_STRING_TOKEN_ERROR */
struct S189 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_PRECEDENCE_DEFINED_TWICE_ERROR */
struct S190 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type UNIX_FILE_INFO */
struct S191 {
	int id;
	T0* a1; /* buffered_file_info */
	T0* a2; /* file_name */
};

/* Struct for type KL_SPECIAL_ROUTINES [PR_STATE] */
struct S192 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [PR_STATE] */
struct S193 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [DS_ARRAYED_LIST [PR_STATE]] */
struct S194 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [DS_ARRAYED_LIST [PR_STATE], INTEGER_32] */
struct S195 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_STATE]] */
struct S197 {
	int id;
};

/* Struct for type DS_HASH_TABLE_CURSOR [DS_ARRAYED_LIST [PR_STATE], INTEGER_32] */
struct S198 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_ANY_ROUTINES */
struct S199 {
	int id;
};

/* Struct for type DS_BUBBLE_SORTER [PR_POSITION] */
struct S200 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type SPECIAL [PR_POSITION] */
struct S202 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_EQUALITY_TESTER [PR_POSITION] */
struct S203 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [PR_POSITION] */
struct S204 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [PR_POSITION] */
struct S205 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type SPECIAL [PR_RULE] */
struct S206 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [PR_RULE] */
struct S207 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [PR_RULE] */
struct S208 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type DS_LINKABLE [PR_REDUCTION] */
struct S210 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_LINKABLE [PR_TRANSITION] */
struct S211 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]] */
struct S213 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type SPECIAL [PR_SYMBOL] */
struct S218 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [PR_SYMBOL] */
struct S219 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [PR_SYMBOL] */
struct S220 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [PR_REDUCTION] */
struct S221 {
	int id;
};

/* Struct for type SPECIAL [PR_REDUCTION] */
struct S222 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [PR_REDUCTION] */
struct S223 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type SPECIAL [PR_VARIABLE] */
struct S224 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [PR_VARIABLE] */
struct S225 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [PR_VARIABLE] */
struct S226 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]] */
struct S229 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type DS_LINKED_LIST_CURSOR [PR_VARIABLE] */
struct S234 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [PR_TOKEN] */
struct S235 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type KL_CHARACTER_ROUTINES */
struct S236 {
	int id;
};

/* Struct for type DS_LINKABLE [PR_RULE] */
struct S237 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type SPECIAL [PR_PORTION] */
struct S238 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [PR_PORTION] */
struct S239 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [PR_PORTION] */
struct S240 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
struct S242 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type UT_INTEGER_FORMATTER */
struct S243 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [STRING_8] */
struct S244 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [PR_TYPE] */
struct S245 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type UC_UNICODE_ROUTINES */
struct S247 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [PR_TOKEN, STRING_8] */
struct S248 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [PR_TOKEN, STRING_8] */
struct S250 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [PR_VARIABLE, STRING_8] */
struct S251 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [PR_VARIABLE, STRING_8] */
struct S253 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [PR_TYPE, STRING_8] */
struct S254 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [PR_TYPE, STRING_8] */
struct S256 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [PR_LABELED_TYPE] */
struct S257 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type KL_SPECIAL_ROUTINES [PR_ERROR_ACTION] */
struct S258 {
	int id;
};

/* Struct for type SPECIAL [PR_ERROR_ACTION] */
struct S259 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [PR_ERROR_ACTION] */
struct S260 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type SPECIAL [NATURAL_8] */
struct S261 {
	int id;
	T6 a1; /* count */
	T8 z2[1]; /* item */
};

/* Struct for type STRING_TO_INTEGER_CONVERTOR */
struct S263 {
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

/* Struct for type KL_COMPARABLE_COMPARATOR [PR_POSITION] */
struct S266 {
	int id;
};

/* Struct for type DS_LINKABLE [PR_TOKEN] */
struct S270 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_LINKED_LIST_CURSOR [PR_TOKEN] */
struct S271 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type KL_CHARACTER_BUFFER */
struct S275 {
	int id;
	T0* a1; /* as_special */
	T0* a2; /* area */
};

/* Struct for type SPECIAL [DS_ARRAYED_LIST [PR_VARIABLE]] */
struct S276 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_VARIABLE]] */
struct S277 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [PR_VARIABLE]] */
struct S278 {
	int id;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T6 a3; /* position */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [DS_ARRAYED_LIST [PR_STATE], INTEGER_32] */
struct S280 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type SPECIAL [DS_NESTED_LIST [PR_TOKEN]] */
struct S281 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_TOKEN]] */
struct S282 {
	int id;
};

/* Struct for type SPECIAL [DS_NESTED_LIST [PR_RULE]] */
struct S283 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_RULE]] */
struct S284 {
	int id;
};

/* Struct for type SPECIAL [ARRAY [INTEGER_32]] */
struct S285 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
struct S286 {
	int id;
	T6 a1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [PR_TOKEN, STRING_8] */
struct S287 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [PR_VARIABLE, STRING_8] */
struct S288 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [PR_TYPE, STRING_8] */
struct S289 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type DS_LINKED_LIST_CURSOR [PR_CONFLICT] */
struct S290 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_LINKABLE [PR_CONFLICT] */
struct S291 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_HASH_TABLE [INTEGER_32, PR_TYPE] */
struct S292 {
	int id;
	T6 a1; /* found_position */
	T6 a2; /* position */
	T0* a3; /* item_storage */
	T6 a4; /* free_slot */
	T6 a5; /* last_position */
	T6 a6; /* count */
	T6 a7; /* modulus */
	T6 a8; /* slots_position */
	T6 a9; /* clashes_previous_position */
	T0* a10; /* key_equality_tester */
	T0* a11; /* equality_tester */
	T0* a12; /* internal_keys */
	T0* a13; /* clashes */
	T0* a14; /* slots */
	T0* a15; /* key_storage */
	T6 a16; /* capacity */
	T0* a17; /* special_item_routines */
	T0* a18; /* special_key_routines */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type DS_HASH_TABLE_CURSOR [INTEGER_32, PR_TYPE] */
struct S293 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type DS_LINKABLE [PR_VARIABLE] */
struct S296 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type INTEGER_OVERFLOW_CHECKER */
struct S297 {
	int id;
	T0* a1; /* integer_overflow_state1 */
	T0* a2; /* integer_overflow_state2 */
	T0* a3; /* natural_overflow_state1 */
	T0* a4; /* natural_overflow_state2 */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [INTEGER_32, PR_TYPE] */
struct S302 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type SPECIAL [NATURAL_64] */
struct S304 {
	int id;
	T6 a1; /* count */
	T11 z2[1]; /* item */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [INTEGER_32, PR_TYPE] */
struct S305 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
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
extern T29 GE_default29;
extern T30 GE_default30;
extern T31 GE_default31;
extern T34 GE_default34;
extern T35 GE_default35;
extern T36 GE_default36;
extern T37 GE_default37;
extern T38 GE_default38;
extern T39 GE_default39;
extern T40 GE_default40;
extern T41 GE_default41;
extern T42 GE_default42;
extern T43 GE_default43;
extern T44 GE_default44;
extern T45 GE_default45;
extern T46 GE_default46;
extern T47 GE_default47;
extern T48 GE_default48;
extern T49 GE_default49;
extern T50 GE_default50;
extern T51 GE_default51;
extern T52 GE_default52;
extern T54 GE_default54;
extern T55 GE_default55;
extern T56 GE_default56;
extern T57 GE_default57;
extern T58 GE_default58;
extern T59 GE_default59;
extern T62 GE_default62;
extern T63 GE_default63;
extern T65 GE_default65;
extern T67 GE_default67;
extern T68 GE_default68;
extern T69 GE_default69;
extern T70 GE_default70;
extern T71 GE_default71;
extern T72 GE_default72;
extern T73 GE_default73;
extern T74 GE_default74;
extern T76 GE_default76;
extern T78 GE_default78;
extern T79 GE_default79;
extern T80 GE_default80;
extern T81 GE_default81;
extern T82 GE_default82;
extern T84 GE_default84;
extern T85 GE_default85;
extern T87 GE_default87;
extern T89 GE_default89;
extern T90 GE_default90;
extern T91 GE_default91;
extern T92 GE_default92;
extern T93 GE_default93;
extern T94 GE_default94;
extern T96 GE_default96;
extern T97 GE_default97;
extern T98 GE_default98;
extern T99 GE_default99;
extern T100 GE_default100;
extern T101 GE_default101;
extern T102 GE_default102;
extern T103 GE_default103;
extern T104 GE_default104;
extern T105 GE_default105;
extern T107 GE_default107;
extern T109 GE_default109;
extern T110 GE_default110;
extern T111 GE_default111;
extern T112 GE_default112;
extern T113 GE_default113;
extern T114 GE_default114;
extern T116 GE_default116;
extern T117 GE_default117;
extern T118 GE_default118;
extern T119 GE_default119;
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
extern T133 GE_default133;
extern T134 GE_default134;
extern T135 GE_default135;
extern T136 GE_default136;
extern T137 GE_default137;
extern T138 GE_default138;
extern T139 GE_default139;
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
extern T179 GE_default179;
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
extern T195 GE_default195;
extern T197 GE_default197;
extern T198 GE_default198;
extern T199 GE_default199;
extern T200 GE_default200;
extern T202 GE_default202;
extern T203 GE_default203;
extern T204 GE_default204;
extern T205 GE_default205;
extern T206 GE_default206;
extern T207 GE_default207;
extern T208 GE_default208;
extern T210 GE_default210;
extern T211 GE_default211;
extern T213 GE_default213;
extern T218 GE_default218;
extern T219 GE_default219;
extern T220 GE_default220;
extern T221 GE_default221;
extern T222 GE_default222;
extern T223 GE_default223;
extern T224 GE_default224;
extern T225 GE_default225;
extern T226 GE_default226;
extern T229 GE_default229;
extern T234 GE_default234;
extern T235 GE_default235;
extern T236 GE_default236;
extern T237 GE_default237;
extern T238 GE_default238;
extern T239 GE_default239;
extern T240 GE_default240;
extern T242 GE_default242;
extern T243 GE_default243;
extern T244 GE_default244;
extern T245 GE_default245;
extern T247 GE_default247;
extern T248 GE_default248;
extern T250 GE_default250;
extern T251 GE_default251;
extern T253 GE_default253;
extern T254 GE_default254;
extern T256 GE_default256;
extern T257 GE_default257;
extern T258 GE_default258;
extern T259 GE_default259;
extern T260 GE_default260;
extern T261 GE_default261;
extern T263 GE_default263;
extern T266 GE_default266;
extern T270 GE_default270;
extern T271 GE_default271;
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
extern T296 GE_default296;
extern T297 GE_default297;
extern T302 GE_default302;
extern T304 GE_default304;
extern T305 GE_default305;

extern T0* GE_ms8(char* s, T6 c);
extern T0* GE_ms32(char* s, T6 c);
/* Call to ANY.same_type */
extern T1 T19x27T0(T0* C, T0* a1);
/* Call to UT_ERROR.default_message */
extern T0* T33x2714(T0* C);
/* New instance of type SPECIAL [CHARACTER_8] */
extern T0* GE_new15(T6 a1, T1 initialize);
/* New instance of type STRING_8 */
extern T0* GE_new17(T1 initialize);
/* New instance of type GEYACC */
extern T0* GE_new21(T1 initialize);
/* New instance of type PR_FSM */
extern T0* GE_new22(T1 initialize);
/* New instance of type PR_PARSER_GENERATOR */
extern T0* GE_new23(T1 initialize);
/* New instance of type KL_TEXT_OUTPUT_FILE */
extern T0* GE_new24(T1 initialize);
/* New instance of type UT_CANNOT_WRITE_TO_FILE_ERROR */
extern T0* GE_new25(T1 initialize);
/* New instance of type KL_ARGUMENTS */
extern T0* GE_new27(T1 initialize);
/* New instance of type UT_ERROR_HANDLER */
extern T0* GE_new28(T1 initialize);
/* New instance of type PR_GRAMMAR */
extern T0* GE_new29(T1 initialize);
/* New instance of type PR_XML_DOC_GENERATOR */
extern T0* GE_new30(T1 initialize);
/* New instance of type PR_HTML_DOC_GENERATOR */
extern T0* GE_new31(T1 initialize);
/* New instance of type KL_EXCEPTIONS */
extern T0* GE_new34(T1 initialize);
/* New instance of type KL_STANDARD_FILES */
extern T0* GE_new35(T1 initialize);
/* New instance of type KL_STDOUT_FILE */
extern T0* GE_new36(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [PR_RULE] */
extern T0* GE_new37(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [PR_TOKEN] */
extern T0* GE_new38(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [PR_VARIABLE] */
extern T0* GE_new39(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [PR_TYPE] */
extern T0* GE_new40(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [INTEGER_32] */
extern T0* GE_new41(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [STRING_8] */
extern T0* GE_new42(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [PR_TRANSITION] */
extern T0* GE_new43(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [PR_REDUCTION] */
extern T0* GE_new44(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [PR_STATE] */
extern T0* GE_new45(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [PR_PORTION] */
extern T0* GE_new46(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [PR_CONFLICT] */
extern T0* GE_new47(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_VARIABLE]] */
extern T0* GE_new48(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_STATE]] */
extern T0* GE_new49(T1 initialize);
/* New instance of type PR_YACC_PARSER */
extern T0* GE_new50(T1 initialize);
/* New instance of type KL_TEXT_INPUT_FILE */
extern T0* GE_new51(T1 initialize);
/* New instance of type UT_CANNOT_READ_FILE_ERROR */
extern T0* GE_new52(T1 initialize);
/* New instance of type KL_STDIN_FILE */
extern T0* GE_new54(T1 initialize);
/* New instance of type UT_VERSION_NUMBER */
extern T0* GE_new55(T1 initialize);
/* New instance of type UT_USAGE_MESSAGE */
extern T0* GE_new56(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [PR_STATE] */
extern T0* GE_new57(T1 initialize);
/* New instance of type DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32] */
extern T0* GE_new58(T1 initialize);
/* New instance of type PR_STATE */
extern T0* GE_new59(T1 initialize);
/* New instance of type UT_MESSAGE */
extern T0* GE_new62(T1 initialize);
/* New instance of type DS_LINKED_LIST [PR_CONFLICT] */
extern T0* GE_new63(T1 initialize);
/* New instance of type PR_CONFLICT */
extern T0* GE_new65(T1 initialize);
/* New instance of type KL_INTEGER_ROUTINES */
extern T0* GE_new67(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [PR_POSITION] */
extern T0* GE_new68(T1 initialize);
/* New instance of type PR_POSITION */
extern T0* GE_new69(T1 initialize);
/* New instance of type PR_ERROR_ACTION */
extern T0* GE_new70(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [PR_RULE] */
extern T0* GE_new71(T1 initialize);
/* New instance of type PR_RULE */
extern T0* GE_new72(T1 initialize);
/* New instance of type PR_VARIABLE */
extern T0* GE_new73(T1 initialize);
/* New instance of type DS_LINKED_LIST [PR_REDUCTION] */
extern T0* GE_new74(T1 initialize);
/* New instance of type DS_LINKED_LIST [PR_TRANSITION] */
extern T0* GE_new76(T1 initialize);
/* New instance of type DS_NESTED_LIST_FLATTENER [PR_TOKEN] */
extern T0* GE_new78(T1 initialize);
/* New instance of type DS_LINKED_LIST [PR_TOKEN] */
extern T0* GE_new79(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [PR_SYMBOL] */
extern T0* GE_new80(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [PR_STATE] */
extern T0* GE_new81(T1 initialize);
/* New instance of type PR_TRANSITION */
extern T0* GE_new82(T1 initialize);
/* New instance of type PR_TOKEN */
extern T0* GE_new84(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [PR_REDUCTION] */
extern T0* GE_new85(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [PR_TRANSITION] */
extern T0* GE_new87(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [PR_REDUCTION] */
extern T0* GE_new89(T1 initialize);
/* New instance of type PR_REDUCTION */
extern T0* GE_new90(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [PR_VARIABLE] */
extern T0* GE_new91(T1 initialize);
/* New instance of type DS_NESTED_LIST_FLATTENER [PR_RULE] */
extern T0* GE_new92(T1 initialize);
/* New instance of type DS_LINKED_LIST [PR_VARIABLE] */
extern T0* GE_new93(T1 initialize);
/* New instance of type DS_LINKED_LIST [PR_RULE] */
extern T0* GE_new94(T1 initialize);
/* New instance of type SPECIAL [detachable PR_STATE] */
extern T0* GE_new96(T6 a1, T1 initialize);
/* New instance of type ARRAY [detachable PR_STATE] */
extern T0* GE_new97(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [PR_TOKEN] */
extern T0* GE_new98(T1 initialize);
/* New instance of type PR_TYPE */
extern T0* GE_new99(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [PR_RULE] */
extern T0* GE_new100(T1 initialize);
/* New instance of type SPECIAL [INTEGER_32] */
extern T0* GE_new101(T6 a1, T1 initialize);
/* New instance of type ARRAY [INTEGER_32] */
extern T0* GE_new102(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [PR_PORTION] */
extern T0* GE_new103(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [INTEGER_32] */
extern T0* GE_new104(T1 initialize);
/* New instance of type PR_PORTION */
extern T0* GE_new105(T1 initialize);
/* New instance of type DS_BUBBLE_SORTER [PR_PORTION] */
extern T0* GE_new107(T1 initialize);
/* New instance of type KL_ARRAY_ROUTINES [INTEGER_32] */
extern T0* GE_new109(T1 initialize);
/* New instance of type UT_STRING_FORMATTER */
extern T0* GE_new110(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [STRING_8] */
extern T0* GE_new111(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [PR_TYPE] */
extern T0* GE_new112(T1 initialize);
/* New instance of type DS_HASH_SET [PR_TYPE] */
extern T0* GE_new113(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [PR_TYPE] */
extern T0* GE_new114(T1 initialize);
/* New instance of type SPECIAL [detachable PR_TRANSITION] */
extern T0* GE_new116(T6 a1, T1 initialize);
/* New instance of type ARRAY [detachable PR_TRANSITION] */
extern T0* GE_new117(T1 initialize);
/* New instance of type KL_STRING_ROUTINES */
extern T0* GE_new118(T1 initialize);
/* New instance of type UT_ARRAY_FORMATTER */
extern T0* GE_new119(T1 initialize);
/* New instance of type SPECIAL [STRING_8] */
extern T0* GE_new122(T6 a1, T1 initialize);
/* New instance of type ARRAY [STRING_8] */
extern T0* GE_new123(T1 initialize);
/* New instance of type KL_STDERR_FILE */
extern T0* GE_new124(T1 initialize);
/* New instance of type PR_ACTION_FACTORY */
extern T0* GE_new125(T1 initialize);
/* New instance of type DS_HASH_TABLE [PR_TOKEN, STRING_8] */
extern T0* GE_new126(T1 initialize);
/* New instance of type DS_HASH_TABLE [PR_VARIABLE, STRING_8] */
extern T0* GE_new127(T1 initialize);
/* New instance of type DS_HASH_TABLE [PR_TYPE, STRING_8] */
extern T0* GE_new128(T1 initialize);
/* New instance of type YY_FILE_BUFFER */
extern T0* GE_new129(T1 initialize);
/* New instance of type YY_BUFFER */
extern T0* GE_new130(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [INTEGER_32] */
extern T0* GE_new131(T1 initialize);
/* New instance of type SPECIAL [ANY] */
extern T0* GE_new133(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ANY] */
extern T0* GE_new134(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [STRING_8] */
extern T0* GE_new135(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [PR_LABELED_TYPE] */
extern T0* GE_new136(T1 initialize);
/* New instance of type PR_LABELED_TYPE */
extern T0* GE_new137(T1 initialize);
/* New instance of type DS_PAIR [STRING_8, INTEGER_32] */
extern T0* GE_new138(T1 initialize);
/* New instance of type SPECIAL [PR_TYPE] */
extern T0* GE_new139(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [PR_TYPE] */
extern T0* GE_new140(T1 initialize);
/* New instance of type SPECIAL [DS_ARRAYED_LIST [PR_TYPE]] */
extern T0* GE_new141(T6 a1, T1 initialize);
/* New instance of type SPECIAL [DS_ARRAYED_LIST [PR_LABELED_TYPE]] */
extern T0* GE_new142(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_TYPE]] */
extern T0* GE_new143(T1 initialize);
/* New instance of type SPECIAL [PR_LABELED_TYPE] */
extern T0* GE_new144(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_LABELED_TYPE]] */
extern T0* GE_new145(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [PR_LABELED_TYPE] */
extern T0* GE_new146(T1 initialize);
/* New instance of type SPECIAL [PR_TOKEN] */
extern T0* GE_new147(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [PR_TOKEN] */
extern T0* GE_new148(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [PR_ERROR_ACTION] */
extern T0* GE_new149(T1 initialize);
/* New instance of type UT_SYNTAX_ERROR */
extern T0* GE_new150(T1 initialize);
/* New instance of type ARRAY [detachable PR_TOKEN] */
extern T0* GE_new151(T1 initialize);
/* New instance of type PR_MULTIPLE_START_DECLARATIONS_ERROR */
extern T0* GE_new152(T1 initialize);
/* New instance of type PR_NO_RULES_ERROR */
extern T0* GE_new153(T1 initialize);
/* New instance of type PR_LHS_SYMBOL_TOKEN_ERROR */
extern T0* GE_new154(T1 initialize);
/* New instance of type PR_RULE_DECLARED_TWICE_ERROR */
extern T0* GE_new155(T1 initialize);
/* New instance of type PR_INVALID_ERROR_N_ERROR */
extern T0* GE_new156(T1 initialize);
/* New instance of type PR_PREC_SPECIFIED_TWICE_ERROR */
extern T0* GE_new157(T1 initialize);
/* New instance of type PR_PREC_NOT_TOKEN_ERROR */
extern T0* GE_new158(T1 initialize);
/* New instance of type PR_MISSING_CHARACTERS_ERROR */
extern T0* GE_new159(T1 initialize);
/* New instance of type PR_NULL_INTEGER_ERROR */
extern T0* GE_new160(T1 initialize);
/* New instance of type PR_INVALID_STRING_TOKEN_ERROR */
extern T0* GE_new161(T1 initialize);
/* New instance of type PR_INVALID_DOLLAR_DOLLAR_ERROR */
extern T0* GE_new162(T1 initialize);
/* New instance of type PR_INTEGER_TOO_LARGE_ERROR */
extern T0* GE_new163(T1 initialize);
/* New instance of type PR_START_SYMBOL_TOKEN_ERROR */
extern T0* GE_new164(T1 initialize);
/* New instance of type PR_UNKNOWN_START_SYMBOL_ERROR */
extern T0* GE_new165(T1 initialize);
/* New instance of type PR_TOKEN_ID_USED_TWICE_ERROR */
extern T0* GE_new166(T1 initialize);
/* New instance of type PR_UNDEFINED_SYMBOL_ERROR */
extern T0* GE_new167(T1 initialize);
/* New instance of type PR_ALIAS_NAME_UNDEFINED_ERROR */
extern T0* GE_new168(T1 initialize);
/* New instance of type PR_LAST_VALUE_NAME_USED_TWICE_ERROR */
extern T0* GE_new169(T1 initialize);
/* New instance of type PR_ALIAS_NAME_NOT_DEFINED_ERROR */
extern T0* GE_new170(T1 initialize);
/* New instance of type PR_ALIAS_NAME_DEFINED_TWICE_ERROR */
extern T0* GE_new171(T1 initialize);
/* New instance of type PR_TWO_TOKEN_IDS_TOKEN_ERROR */
extern T0* GE_new172(T1 initialize);
/* New instance of type PR_TWO_STRINGS_TOKEN_ERROR */
extern T0* GE_new173(T1 initialize);
/* New instance of type PR_STRING_TOKEN_DEFINED_TWICE_ERROR */
extern T0* GE_new174(T1 initialize);
/* New instance of type PR_DANGEROUS_DOLLAR_N_ERROR */
extern T0* GE_new175(T1 initialize);
/* New instance of type PR_INVALID_DOLLAR_N_ERROR */
extern T0* GE_new176(T1 initialize);
/* New instance of type KL_COMPARABLE_COMPARATOR [PR_PORTION] */
extern T0* GE_new179(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]] */
extern T0* GE_new182(T1 initialize);
/* New instance of type PR_BASIC_TYPE */
extern T0* GE_new183(T1 initialize);
/* New instance of type PR_ACTION */
extern T0* GE_new184(T1 initialize);
/* New instance of type PR_SYMBOL_DECLARED_VARIABLE_ERROR */
extern T0* GE_new185(T1 initialize);
/* New instance of type PR_TOKEN_DECLARED_TWICE_ERROR */
extern T0* GE_new186(T1 initialize);
/* New instance of type PR_SYMBOL_DECLARED_TOKEN_ERROR */
extern T0* GE_new187(T1 initialize);
/* New instance of type PR_VARIABLE_DECLARED_TWICE_ERROR */
extern T0* GE_new188(T1 initialize);
/* New instance of type PR_UNDEFINED_STRING_TOKEN_ERROR */
extern T0* GE_new189(T1 initialize);
/* New instance of type PR_PRECEDENCE_DEFINED_TWICE_ERROR */
extern T0* GE_new190(T1 initialize);
/* New instance of type UNIX_FILE_INFO */
extern T0* GE_new191(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [PR_STATE] */
extern T0* GE_new192(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [PR_STATE] */
extern T0* GE_new193(T1 initialize);
/* New instance of type SPECIAL [DS_ARRAYED_LIST [PR_STATE]] */
extern T0* GE_new194(T6 a1, T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [DS_ARRAYED_LIST [PR_STATE], INTEGER_32] */
extern T0* GE_new195(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_STATE]] */
extern T0* GE_new197(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [DS_ARRAYED_LIST [PR_STATE], INTEGER_32] */
extern T0* GE_new198(T1 initialize);
/* New instance of type KL_ANY_ROUTINES */
extern T0* GE_new199(T1 initialize);
/* New instance of type DS_BUBBLE_SORTER [PR_POSITION] */
extern T0* GE_new200(T1 initialize);
/* New instance of type SPECIAL [PR_POSITION] */
extern T0* GE_new202(T6 a1, T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [PR_POSITION] */
extern T0* GE_new203(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [PR_POSITION] */
extern T0* GE_new204(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [PR_POSITION] */
extern T0* GE_new205(T1 initialize);
/* New instance of type SPECIAL [PR_RULE] */
extern T0* GE_new206(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [PR_RULE] */
extern T0* GE_new207(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [PR_RULE] */
extern T0* GE_new208(T1 initialize);
/* New instance of type DS_LINKABLE [PR_REDUCTION] */
extern T0* GE_new210(T1 initialize);
/* New instance of type DS_LINKABLE [PR_TRANSITION] */
extern T0* GE_new211(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]] */
extern T0* GE_new213(T1 initialize);
/* New instance of type SPECIAL [PR_SYMBOL] */
extern T0* GE_new218(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [PR_SYMBOL] */
extern T0* GE_new219(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [PR_SYMBOL] */
extern T0* GE_new220(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [PR_REDUCTION] */
extern T0* GE_new221(T1 initialize);
/* New instance of type SPECIAL [PR_REDUCTION] */
extern T0* GE_new222(T6 a1, T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [PR_REDUCTION] */
extern T0* GE_new223(T1 initialize);
/* New instance of type SPECIAL [PR_VARIABLE] */
extern T0* GE_new224(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [PR_VARIABLE] */
extern T0* GE_new225(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [PR_VARIABLE] */
extern T0* GE_new226(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]] */
extern T0* GE_new229(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [PR_VARIABLE] */
extern T0* GE_new234(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [PR_TOKEN] */
extern T0* GE_new235(T1 initialize);
/* New instance of type KL_CHARACTER_ROUTINES */
extern T0* GE_new236(T1 initialize);
/* New instance of type DS_LINKABLE [PR_RULE] */
extern T0* GE_new237(T1 initialize);
/* New instance of type SPECIAL [PR_PORTION] */
extern T0* GE_new238(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [PR_PORTION] */
extern T0* GE_new239(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [PR_PORTION] */
extern T0* GE_new240(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
extern T0* GE_new242(T1 initialize);
/* New instance of type UT_INTEGER_FORMATTER */
extern T0* GE_new243(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [STRING_8] */
extern T0* GE_new244(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [PR_TYPE] */
extern T0* GE_new245(T1 initialize);
/* New instance of type UC_UNICODE_ROUTINES */
extern T0* GE_new247(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [PR_TOKEN, STRING_8] */
extern T0* GE_new248(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [PR_TOKEN, STRING_8] */
extern T0* GE_new250(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [PR_VARIABLE, STRING_8] */
extern T0* GE_new251(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [PR_VARIABLE, STRING_8] */
extern T0* GE_new253(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [PR_TYPE, STRING_8] */
extern T0* GE_new254(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [PR_TYPE, STRING_8] */
extern T0* GE_new256(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [PR_LABELED_TYPE] */
extern T0* GE_new257(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [PR_ERROR_ACTION] */
extern T0* GE_new258(T1 initialize);
/* New instance of type SPECIAL [PR_ERROR_ACTION] */
extern T0* GE_new259(T6 a1, T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [PR_ERROR_ACTION] */
extern T0* GE_new260(T1 initialize);
/* New instance of type SPECIAL [NATURAL_8] */
extern T0* GE_new261(T6 a1, T1 initialize);
/* New instance of type STRING_TO_INTEGER_CONVERTOR */
extern T0* GE_new263(T1 initialize);
/* New instance of type KL_COMPARABLE_COMPARATOR [PR_POSITION] */
extern T0* GE_new266(T1 initialize);
/* New instance of type DS_LINKABLE [PR_TOKEN] */
extern T0* GE_new270(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [PR_TOKEN] */
extern T0* GE_new271(T1 initialize);
/* New instance of type KL_CHARACTER_BUFFER */
extern T0* GE_new275(T1 initialize);
/* New instance of type SPECIAL [DS_ARRAYED_LIST [PR_VARIABLE]] */
extern T0* GE_new276(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_VARIABLE]] */
extern T0* GE_new277(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [PR_VARIABLE]] */
extern T0* GE_new278(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [DS_ARRAYED_LIST [PR_STATE], INTEGER_32] */
extern T0* GE_new280(T1 initialize);
/* New instance of type SPECIAL [DS_NESTED_LIST [PR_TOKEN]] */
extern T0* GE_new281(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_TOKEN]] */
extern T0* GE_new282(T1 initialize);
/* New instance of type SPECIAL [DS_NESTED_LIST [PR_RULE]] */
extern T0* GE_new283(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_RULE]] */
extern T0* GE_new284(T1 initialize);
/* New instance of type SPECIAL [ARRAY [INTEGER_32]] */
extern T0* GE_new285(T6 a1, T1 initialize);
/* New instance of type SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
extern T0* GE_new286(T6 a1, T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [PR_TOKEN, STRING_8] */
extern T0* GE_new287(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [PR_VARIABLE, STRING_8] */
extern T0* GE_new288(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [PR_TYPE, STRING_8] */
extern T0* GE_new289(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [PR_CONFLICT] */
extern T0* GE_new290(T1 initialize);
/* New instance of type DS_LINKABLE [PR_CONFLICT] */
extern T0* GE_new291(T1 initialize);
/* New instance of type DS_HASH_TABLE [INTEGER_32, PR_TYPE] */
extern T0* GE_new292(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [INTEGER_32, PR_TYPE] */
extern T0* GE_new293(T1 initialize);
/* New instance of type DS_LINKABLE [PR_VARIABLE] */
extern T0* GE_new296(T1 initialize);
/* New instance of type INTEGER_OVERFLOW_CHECKER */
extern T0* GE_new297(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [INTEGER_32, PR_TYPE] */
extern T0* GE_new302(T1 initialize);
/* New instance of type SPECIAL [NATURAL_64] */
extern T0* GE_new304(T6 a1, T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [INTEGER_32, PR_TYPE] */
extern T0* GE_new305(T1 initialize);
/* GEYACC.execute */
extern T0* T21c18(void);
/* PR_PARSER_GENERATOR.print_parser */
extern void T23f36(T0* C, T1 a1, T1 a2, T0* a3);
/* PR_PARSER_GENERATOR.print_eiffel_code */
extern void T23f59(T0* C, T0* a1);
/* PR_PARSER_GENERATOR.print_constants */
extern void T23f58(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_integer */
extern void T36f16(T0* C, T6 a1);
/* KL_STDOUT_FILE.put_integer_64 */
extern void T36f20(T0* C, T7 a1);
/* KL_STDOUT_FILE.put_character */
extern void T36f14(T0* C, T2 a1);
/* KL_STDOUT_FILE.old_put_character */
extern void T36f19(T0* C, T2 a1);
/* KL_STDOUT_FILE.console_pc */
extern void T36f24(T0* C, T14 a1, T2 a2);
/* INTEGER_32.to_integer_64 */
extern T7 T6f10(T6* C);
/* KL_TEXT_OUTPUT_FILE.put_integer */
extern void T24f26(T0* C, T6 a1);
/* KL_TEXT_OUTPUT_FILE.put_integer_64 */
extern void T24f34(T0* C, T7 a1);
/* KL_TEXT_OUTPUT_FILE.put_character */
extern void T24f27(T0* C, T2 a1);
/* KL_TEXT_OUTPUT_FILE.old_put_character */
extern void T24f35(T0* C, T2 a1);
/* KL_TEXT_OUTPUT_FILE.file_pc */
extern void T24f38(T0* C, T14 a1, T2 a2);
/* PR_PARSER_GENERATOR.print_stack_declarations */
extern void T23f57(T0* C, T0* a1);
/* PR_BASIC_TYPE.print_yyvs_declaration */
extern void T183f16(T0* C, T6 a1, T0* a2);
/* KL_STDOUT_FILE.put_line */
extern void T36f12(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.put_line */
extern void T24f29(T0* C, T0* a1);
/* PR_BASIC_TYPE.print_indentation */
extern void T183f22(T0* C, T6 a1, T0* a2);
/* PR_TYPE.print_yyvs_declaration */
extern void T99f20(T0* C, T6 a1, T0* a2);
/* PR_TYPE.print_indentation */
extern void T99f26(T0* C, T6 a1, T0* a2);
/* DS_ARRAYED_LIST [PR_TYPE].item */
extern T0* T112f11(T0* C, T6 a1);
/* INTEGER_32.is_greater */
extern T1 T6f1(T6* C, T6 a1);
/* PR_PARSER_GENERATOR.old_print_conversion_routines */
extern void T23f56(T0* C, T0* a1);
/* PR_BASIC_TYPE.old_print_conversion_routine */
extern void T183f15(T0* C, T0* a1);
/* PR_TYPE.old_print_conversion_routine */
extern void T99f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TYPE].is_empty */
extern T1 T112f6(T0* C);
/* PR_PARSER_GENERATOR.print_eiffel_tables */
extern void T23f55(T0* C, T0* a1);
/* PR_PARSER_GENERATOR.print_eiffel_array */
extern void T23f63(T0* C, T0* a1, T0* a2, T0* a3);
/* INTEGER_32.min */
extern T6 T6f9(T6* C, T6 a1);
/* INTEGER_32.is_less_equal */
extern T1 T6f12(T6* C, T6 a1);
/* UT_ARRAY_FORMATTER.put_integer_array */
extern void T119f8(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* INTEGER_32.out */
extern T0* T6f11(T6* C);
/* STRING_8.append_integer */
extern void T17f35(T0* C, T6 a1);
/* INTEGER_32.is_greater_equal */
extern T1 T6f4(T6* C, T6 a1);
/* STRING_8.append_character */
extern void T17f34(T0* C, T2 a1);
/* STRING_8.resize */
extern void T17f41(T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].aliased_resized_area */
extern T0* T15f5(T0* C, T6 a1);
/* STRING_8.additional_space */
extern T6 T17f13(T0* C);
/* INTEGER_32.max */
extern T6 T6f18(T6* C, T6 a1);
/* STRING_8.capacity */
extern T6 T17f12(T0* C);
/* STRING_8.make */
extern void T17f30(T0* C, T6 a1);
/* STRING_8.make */
extern T0* T17c30(T6 a1);
/* SPECIAL [CHARACTER_8].make */
extern T0* T15c11(T6 a1);
/* ARRAY [INTEGER_32].item */
extern T6 T102f4(T0* C, T6 a1);
/* PR_PARSER_GENERATOR.array_formatter_ */
extern unsigned char ge177os1848;
extern T0* ge177ov1848;
extern T0* T23f29(T0* C);
/* UT_ARRAY_FORMATTER.default_create */
extern T0* T119c7(void);
/* ARRAY [INTEGER_32].count */
extern T6 T102f5(T0* C);
/* KL_STRING_ROUTINES.same_string */
extern T1 T118f1(T0* C, T0* a1, T0* a2);
/* STRING_8.item_code */
extern T6 T17f19(T0* C, T6 a1);
/* KL_STRING_ROUTINES.elks_same_string */
extern T1 T118f9(T0* C, T0* a1, T0* a2);
/* STRING_8.same_string */
extern T1 T17f17(T0* C, T0* a1);
/* STRING_8.same_string_general */
extern T1 T17f26(T0* C, T0* a1);
/* STRING_8.code */
extern T10 T17f27(T0* C, T6 a1);
/* INTEGER_32.to_natural_32 */
extern T10 T6f19(T6* C);
/* SPECIAL [CHARACTER_8].same_items */
extern T1 T15f2(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* STRING_8.area_lower */
extern T6 T17f8(T0* C);
/* KL_ANY_ROUTINES.same_types */
extern T1 T199f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.any_ */
extern unsigned char ge218os1947;
extern T0* ge218ov1947;
extern T0* T118f7(T0* C);
/* KL_ANY_ROUTINES.default_create */
extern T0* T199c2(void);
/* STRING_8.substring */
extern T0* T17f11(T0* C, T6 a1, T6 a2);
/* STRING_8.set_count */
extern void T17f36(T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].copy_data */
extern void T15f10(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [CHARACTER_8].move_data */
extern void T15f13(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].overlapping_move */
extern void T15f15(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].non_overlapping_move */
extern void T15f14(T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.new_string */
extern T0* T17f7(T0* C, T6 a1);
/* PR_PARSER_GENERATOR.string_ */
extern unsigned char ge225os1756;
extern T0* ge225ov1756;
extern T0* T23f28(T0* C);
/* KL_STRING_ROUTINES.default_create */
extern T0* T118c13(void);
/* PR_PARSER_GENERATOR.print_error_actions */
extern void T23f54(T0* C, T0* a1);
/* PR_ACTION.out */
extern T0* T184f2(T0* C);
/* DS_ARRAYED_LIST [PR_STATE].item */
extern T0* T57f8(T0* C, T6 a1);
/* PR_PARSER_GENERATOR.print_separated_error_actions */
extern void T23f53(T0* C, T0* a1);
/* PR_PARSER_GENERATOR.print_actions */
extern void T23f52(T0* C, T0* a1);
/* PR_RULE.print_action */
extern void T72f26(T0* C, T0* a1, T1 a2, T0* a3);
/* PR_BASIC_TYPE.print_push_yyval */
extern void T183f21(T0* C, T6 a1, T0* a2);
/* PR_TYPE.print_push_yyval */
extern void T99f25(T0* C, T6 a1, T0* a2);
/* PR_BASIC_TYPE.print_resize_yyvs */
extern void T183f20(T0* C, T6 a1, T0* a2);
/* PR_BASIC_TYPE.print_create_yyvs */
extern void T183f23(T0* C, T6 a1, T0* a2);
/* PR_TYPE.print_resize_yyvs */
extern void T99f24(T0* C, T6 a1, T0* a2);
/* PR_TYPE.print_create_yyvs */
extern void T99f27(T0* C, T6 a1, T0* a2);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].item */
extern T6 T292f37(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].item_storage_item */
extern T6 T292f29(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].search_position */
extern void T292f46(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].clashes_item */
extern T6 T292f24(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].hash_position */
extern T6 T292f25(T0* C, T0* a1);
/* PR_BASIC_TYPE.hash_code */
extern T6 T183f6(T0* C);
/* PR_TYPE.hash_code */
extern T6 T99f8(T0* C);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].key_storage_item */
extern T0* T292f21(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].slots_item */
extern T6 T292f26(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [INTEGER_32, PR_TYPE].forth */
extern void T293f9(T0* C);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].cursor_forth */
extern void T292f60(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].add_traversing_cursor */
extern void T292f62(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [INTEGER_32, PR_TYPE].set_next_cursor */
extern void T293f11(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].remove_traversing_cursor */
extern void T292f61(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [INTEGER_32, PR_TYPE].set_position */
extern void T293f10(T0* C, T6 a1);
/* PR_BASIC_TYPE.print_increment_yyvsp */
extern void T183f19(T0* C, T6 a1, T6 a2, T0* a3);
/* PR_TYPE.print_increment_yyvsp */
extern void T99f23(T0* C, T6 a1, T6 a2, T0* a3);
/* DS_HASH_TABLE_CURSOR [INTEGER_32, PR_TYPE].key */
extern T0* T293f6(T0* C);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].cursor_key */
extern T0* T292f35(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [INTEGER_32, PR_TYPE].item */
extern T6 T293f5(T0* C);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].cursor_item */
extern T6 T292f34(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [INTEGER_32, PR_TYPE].after */
extern T1 T293f4(T0* C);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].cursor_after */
extern T1 T292f33(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [INTEGER_32, PR_TYPE].start */
extern void T293f8(T0* C);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].cursor_start */
extern void T292f59(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].cursor_off */
extern T1 T292f40(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].is_empty */
extern T1 T292f39(T0* C);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].new_cursor */
extern T0* T292f32(T0* C);
/* DS_HASH_TABLE_CURSOR [INTEGER_32, PR_TYPE].make */
extern T0* T293c7(T0* a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].replace_found_item */
extern void T292f45(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].item_storage_put */
extern void T292f51(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].found_item */
extern T6 T292f30(T0* C);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].found */
extern T1 T292f22(T0* C);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].search */
extern void T292f44(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_SYMBOL].item */
extern T0* T80f12(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].put_new */
extern void T292f43(T0* C, T6 a1, T0* a2);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].key_storage_put */
extern void T292f52(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].slots_put */
extern void T292f50(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].clashes_put */
extern void T292f49(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].unset_found_item */
extern void T292f48(T0* C);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].make_map */
extern T0* T292c42(T6 a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].make_with_equality_testers */
extern void T292f47(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [INTEGER_32, PR_TYPE].make */
extern T0* T302c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [INTEGER_32, PR_TYPE].set_internal_cursor */
extern void T302f6(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [INTEGER_32, PR_TYPE].new_cursor */
extern T0* T302f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [INTEGER_32, PR_TYPE].make */
extern T0* T305c3(T0* a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].make_sparse_container */
extern void T292f53(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].set_internal_cursor */
extern void T292f58(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].make_slots */
extern void T292f57(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].make */
extern T0* T131f1(T0* C, T6 a1);
/* SPECIAL [INTEGER_32].make_filled */
extern T0* T101c7(T6 a1, T6 a2);
/* SPECIAL [INTEGER_32].fill_with */
extern void T101f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].make */
extern void T101f9(T0* C, T6 a1);
/* SPECIAL [INTEGER_32].make */
extern T0* T101c9(T6 a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].special_integer_ */
extern unsigned char ge224os4355;
extern T0* ge224ov4355;
extern T0* T292f31(T0* C);
/* KL_SPECIAL_ROUTINES [INTEGER_32].default_create */
extern T0* T131c4(void);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].new_modulus */
extern T6 T292f28(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].make_clashes */
extern void T292f56(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].make_key_storage */
extern void T292f55(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_TYPE].make */
extern T0* T140f1(T0* C, T6 a1);
/* SPECIAL [PR_TYPE].make_filled */
extern T0* T139c6(T0* a1, T6 a2);
/* SPECIAL [PR_TYPE].fill_with */
extern void T139f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [PR_TYPE].make */
extern void T139f9(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_TYPE].default_create */
extern T0* T140c3(void);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].make_item_storage */
extern void T292f54(T0* C, T6 a1);
/* PR_RULE.old_print_action */
extern void T72f25(T0* C, T0* a1, T1 a2, T0* a3);
/* PR_BASIC_TYPE.old_print_dollar_dollar_finalization */
extern void T183f27(T0* C, T0* a1);
/* PR_TYPE.old_print_dollar_dollar_finalization */
extern void T99f31(T0* C, T0* a1);
/* PR_BASIC_TYPE.old_print_dollar_dollar_initialization */
extern void T183f26(T0* C, T0* a1);
/* PR_TYPE.old_print_dollar_dollar_initialization */
extern void T99f30(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [PR_TYPE].forth */
extern void T114f8(T0* C);
/* DS_HASH_SET [PR_TYPE].cursor_forth */
extern void T113f49(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].add_traversing_cursor */
extern void T113f51(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [PR_TYPE].set_next_cursor */
extern void T114f10(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].remove_traversing_cursor */
extern void T113f50(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [PR_TYPE].set_position */
extern void T114f9(T0* C, T6 a1);
/* DS_HASH_SET [PR_TYPE].clashes_item */
extern T6 T113f22(T0* C, T6 a1);
/* PR_BASIC_TYPE.print_dollar_dollar_declaration */
extern void T183f18(T0* C, T0* a1);
/* PR_TYPE.print_dollar_dollar_declaration */
extern void T99f22(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [PR_TYPE].item */
extern T0* T114f4(T0* C);
/* DS_HASH_SET [PR_TYPE].cursor_item */
extern T0* T113f30(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].item_storage_item */
extern T0* T113f25(T0* C, T6 a1);
/* DS_HASH_SET_CURSOR [PR_TYPE].after */
extern T1 T114f5(T0* C);
/* DS_HASH_SET [PR_TYPE].cursor_after */
extern T1 T113f29(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [PR_TYPE].start */
extern void T114f7(T0* C);
/* DS_HASH_SET [PR_TYPE].cursor_start */
extern void T113f48(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].cursor_off */
extern T1 T113f35(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].new_cursor */
extern T0* T113f18(T0* C);
/* DS_HASH_SET_CURSOR [PR_TYPE].make */
extern T0* T114c6(T0* a1);
/* DS_HASH_SET [PR_TYPE].is_empty */
extern T1 T113f20(T0* C);
/* DS_HASH_SET [PR_TYPE].put */
extern void T113f37(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].slots_put */
extern void T113f47(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [PR_TYPE].clashes_put */
extern void T113f46(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [PR_TYPE].slots_item */
extern T6 T113f19(T0* C, T6 a1);
/* DS_HASH_SET [PR_TYPE].item_storage_put */
extern void T113f45(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [PR_TYPE].search_position */
extern void T113f44(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].hash_position */
extern T6 T113f28(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].key_storage_item */
extern T0* T113f27(T0* C, T6 a1);
/* DS_HASH_SET [PR_TYPE].key_equality_tester */
extern T0* T113f26(T0* C);
/* DS_HASH_SET [PR_TYPE].unset_found_item */
extern void T113f42(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].item */
extern T0* T71f7(T0* C, T6 a1);
/* DS_HASH_SET [PR_TYPE].make */
extern T0* T113c36(T6 a1);
/* DS_HASH_SET [PR_TYPE].set_internal_cursor */
extern void T113f43(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].make_slots */
extern void T113f41(T0* C, T6 a1);
/* DS_HASH_SET [PR_TYPE].special_integer_ */
extern T0* T113f21(T0* C);
/* DS_HASH_SET [PR_TYPE].new_modulus */
extern T6 T113f23(T0* C, T6 a1);
/* DS_HASH_SET [PR_TYPE].make_clashes */
extern void T113f40(T0* C, T6 a1);
/* DS_HASH_SET [PR_TYPE].make_key_storage */
extern void T113f39(T0* C, T6 a1);
/* DS_HASH_SET [PR_TYPE].make_item_storage */
extern void T113f38(T0* C, T6 a1);
/* PR_PARSER_GENERATOR.print_separated_actions */
extern void T23f51(T0* C, T0* a1);
/* PR_PARSER_GENERATOR.print_pop_last_value */
extern void T23f50(T0* C, T0* a1);
/* PR_BASIC_TYPE.print_pop_last_value */
extern void T183f14(T0* C, T6 a1, T0* a2);
/* PR_TYPE.print_pop_last_value */
extern void T99f18(T0* C, T6 a1, T0* a2);
/* PR_PARSER_GENERATOR.print_push_error_value */
extern void T23f49(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].item */
extern T0* T98f7(T0* C, T6 a1);
/* PR_PARSER_GENERATOR.print_push_last_value */
extern void T23f48(T0* C, T0* a1);
/* PR_BASIC_TYPE.print_push_last_value */
extern void T183f17(T0* C, T6 a1, T0* a2);
/* PR_BASIC_TYPE.last_value_name */
extern T0* T183f5(T0* C);
/* KL_CHARACTER_ROUTINES.as_lower */
extern T2 T236f1(T0* C, T2 a1);
/* CHARACTER_8.lower */
extern T2 T2f3(T2* C);
/* CHARACTER_8.is_upper */
extern T1 T2f6(T2* C);
/* NATURAL_8.is_greater */
extern T1 T8f2(T8* C, T8 a1);
/* CHARACTER_8.character_types */
extern T8 T2f7(T2* C, T6 a1);
/* CHARACTER_8.internal_character_types */
extern unsigned char ge501os92;
extern T0* ge501ov92;
extern T0* T2f10(T2* C);
/* SPECIAL [NATURAL_8].make */
extern T0* T261c3(T6 a1);
/* PR_BASIC_TYPE.character_ */
extern unsigned char ge221os3873;
extern T0* ge221ov3873;
extern T0* T183f7(T0* C);
/* KL_CHARACTER_ROUTINES.default_create */
extern T0* T236c2(void);
/* STRING_8.item */
extern T2 T17f14(T0* C, T6 a1);
/* STRING_8.append_string */
extern void T17f31(T0* C, T0* a1);
/* STRING_8.append */
extern void T17f40(T0* C, T0* a1);
/* STRING_8.is_empty */
extern T1 T17f18(T0* C);
/* PR_TYPE.print_push_last_value */
extern void T99f21(T0* C, T6 a1, T0* a2);
/* PR_TYPE.last_value_name */
extern T0* T99f5(T0* C);
/* PR_TYPE.character_ */
extern T0* T99f7(T0* C);
/* DS_HASH_SET [PR_TYPE].first */
extern T0* T113f33(T0* C);
/* PR_PARSER_GENERATOR.print_clear_value_stacks */
extern void T23f47(T0* C, T0* a1);
/* PR_BASIC_TYPE.print_clear_yyvs */
extern void T183f13(T0* C, T6 a1, T0* a2);
/* PR_TYPE.print_clear_yyvs */
extern void T99f17(T0* C, T6 a1, T0* a2);
/* PR_PARSER_GENERATOR.print_init_value_stacks */
extern void T23f46(T0* C, T0* a1);
/* PR_PARSER_GENERATOR.print_create_value_stacks */
extern void T23f45(T0* C, T0* a1);
/* PR_PARSER_GENERATOR.print_build_parser_tables */
extern void T23f44(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_string */
extern void T36f13(T0* C, T0* a1);
/* KL_STDOUT_FILE.old_put_string */
extern void T36f18(T0* C, T0* a1);
/* KL_STDOUT_FILE.console_ps */
extern void T36f23(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STRING_ROUTINES.as_string */
extern T0* T118f2(T0* C, T0* a1);
/* STRING_8.string */
extern T0* T17f20(T0* C);
/* STRING_8.make_from_string */
extern T0* T17c45(T0* a1);
/* KL_STDOUT_FILE.string_ */
extern T0* T36f6(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_string */
extern void T24f25(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_put_string */
extern void T24f33(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_ps */
extern void T24f37(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_TEXT_OUTPUT_FILE.string_ */
extern T0* T24f9(T0* C);
/* PR_PARSER_GENERATOR.print_token_codes */
extern void T23f42(T0* C, T0* a1);
/* UT_STRING_FORMATTER.put_eiffel_string */
extern void T110f3(T0* C, T0* a1, T0* a2);
/* UT_INTEGER_FORMATTER.put_decimal_integer */
extern void T243f2(T0* C, T0* a1, T6 a2);
/* UT_STRING_FORMATTER.integer_formatter_ */
extern unsigned char ge177os1844;
extern T0* ge177ov1844;
extern T0* T110f1(T0* C);
/* UT_INTEGER_FORMATTER.default_create */
extern T0* T243c1(void);
/* PR_PARSER_GENERATOR.string_formatter_ */
extern unsigned char ge177os1847;
extern T0* ge177ov1847;
extern T0* T23f27(T0* C);
/* UT_STRING_FORMATTER.default_create */
extern T0* T110c2(void);
/* PR_TOKEN.has_identifier */
extern T1 T84f18(T0* C);
/* PR_PARSER_GENERATOR.print_last_values */
extern void T23f62(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_new_line */
extern void T36f15(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_new_line */
extern void T24f28(T0* C);
/* PR_PARSER_GENERATOR.print_eiffel_header */
extern void T23f43(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].item */
extern T0* T111f9(T0* C, T6 a1);
/* PR_PARSER_GENERATOR.print_token_class */
extern void T23f35(T0* C, T0* a1, T0* a2, T0* a3);
/* PR_PARSER_GENERATOR.set_input_filename */
extern void T23f34(T0* C, T0* a1);
/* PR_PARSER_GENERATOR.set_line_pragma */
extern void T23f33(T0* C, T1 a1);
/* PR_PARSER_GENERATOR.set_old_typing */
extern void T23f32(T0* C, T1 a1);
/* PR_PARSER_GENERATOR.make */
extern T0* T23c31(T0* a1);
/* PR_PARSER_GENERATOR.build_action_tables */
extern void T23f41(T0* C);
/* KL_ARRAY_ROUTINES [INTEGER_32].subarray */
extern T0* T109f1(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* KL_ARRAY_ROUTINES [INTEGER_32].subcopy */
extern void T109f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* ARRAY [INTEGER_32].subcopy */
extern void T102f11(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER_32].copy_data */
extern void T101f12(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER_32].move_data */
extern void T101f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].overlapping_move */
extern void T101f14(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].non_overlapping_move */
extern void T101f13(T0* C, T6 a1, T6 a2, T6 a3);
/* KL_ARRAY_ROUTINES [INTEGER_32].make_empty_with_lower */
extern T0* T109f2(T0* C, T6 a1);
/* PR_PORTION.set_position */
extern void T105f13(T0* C, T6 a1);
/* KL_ARRAY_ROUTINES [INTEGER_32].resize */
extern void T109f4(T0* C, T0* a1, T6 a2, T6 a3);
/* ARRAY [INTEGER_32].conservative_resize */
extern void T102f10(T0* C, T6 a1, T6 a2);
/* SPECIAL [INTEGER_32].fill_with_default */
extern void T101f11(T0* C, T6 a1, T6 a2);
/* SPECIAL [INTEGER_32].aliased_resized_area */
extern T0* T101f5(T0* C, T6 a1);
/* ARRAY [INTEGER_32].make_area */
extern void T102f12(T0* C, T6 a1);
/* ARRAY [INTEGER_32].empty_area */
extern T1 T102f6(T0* C);
/* PR_PARSER_GENERATOR.integer_array_ */
extern unsigned char ge219os1840;
extern T0* ge219ov1840;
extern T0* T23f26(T0* C);
/* KL_ARRAY_ROUTINES [INTEGER_32].default_create */
extern T0* T109c3(void);
/* DS_ARRAYED_LIST [INTEGER_32].item */
extern T6 T104f9(T0* C, T6 a1);
/* DS_ARRAYED_LIST [INTEGER_32].first */
extern T6 T104f8(T0* C);
/* PR_PORTION.same_portion */
extern T1 T105f8(T0* C, T0* a1);
/* PR_PORTION.order_is_equal */
extern T1 T105f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_PORTION].item */
extern T0* T103f7(T0* C, T6 a1);
/* ARRAY [INTEGER_32].put */
extern void T102f8(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [PR_PORTION].sort */
extern void T103f10(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [PR_PORTION].sort */
extern void T107f3(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [PR_PORTION].sort_with_comparator */
extern void T107f4(T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [PR_PORTION].subsort_with_comparator */
extern void T107f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* DS_ARRAYED_LIST [PR_PORTION].replace */
extern void T103f13(T0* C, T0* a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [PR_PORTION].less_than */
extern T1 T179f1(T0* C, T0* a1, T0* a2);
/* PR_PORTION.is_less */
extern T1 T105f10(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_PORTION].is_empty */
extern T1 T103f8(T0* C);
/* PR_PARSER_GENERATOR.portion_sorter */
extern unsigned char ge136os1821;
extern T0* ge136ov1821;
extern T0* T23f23(T0* C);
/* DS_BUBBLE_SORTER [PR_PORTION].make */
extern T0* T107c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [PR_PORTION].make */
extern T0* T179c2(void);
/* PR_PARSER_GENERATOR.put_yydefgoto */
extern void T23f61(T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_LIST [PR_PORTION].put_last */
extern void T103f11(T0* C, T0* a1);
/* PR_PORTION.make_symbol */
extern T0* T105c12(T6 a1, T0* a2, T0* a3);
/* DS_ARRAYED_LIST [INTEGER_32].last */
extern T6 T104f7(T0* C);
/* DS_ARRAYED_LIST [INTEGER_32].put_last */
extern void T104f11(T0* C, T6 a1);
/* ARRAY [detachable PR_TRANSITION].item */
extern T0* T117f4(T0* C, T6 a1);
/* DS_ARRAYED_LIST [INTEGER_32].make */
extern T0* T104c10(T6 a1);
/* DS_ARRAYED_LIST [INTEGER_32].set_internal_cursor */
extern void T104f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [INTEGER_32].new_cursor */
extern T0* T104f6(T0* C);
/* DS_ARRAYED_LIST_CURSOR [INTEGER_32].make */
extern T0* T242c3(T0* a1);
/* ARRAY [detachable PR_TRANSITION].put */
extern void T117f6(T0* C, T0* a1, T6 a2);
/* ARRAY [detachable PR_TRANSITION].make_filled */
extern T0* T117c5(T0* a1, T6 a2, T6 a3);
/* ARRAY [detachable PR_TRANSITION].make_filled_area */
extern void T117f7(T0* C, T0* a1, T6 a2);
/* SPECIAL [detachable PR_TRANSITION].make_filled */
extern T0* T116c3(T0* a1, T6 a2);
/* SPECIAL [detachable PR_TRANSITION].fill_with */
extern void T116f6(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [detachable PR_TRANSITION].make */
extern void T116f5(T0* C, T6 a1);
/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].forth */
extern void T87f9(T0* C);
/* DS_LINKED_LIST [PR_TRANSITION].cursor_forth */
extern void T76f12(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TRANSITION].add_traversing_cursor */
extern void T76f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].set_next_cursor */
extern void T87f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TRANSITION].remove_traversing_cursor */
extern void T76f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].set */
extern void T87f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].item */
extern T0* T87f6(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].start */
extern void T87f8(T0* C);
/* DS_LINKED_LIST [PR_TRANSITION].cursor_start */
extern void T76f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TRANSITION].cursor_off */
extern T1 T76f7(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TRANSITION].new_cursor */
extern T0* T76f5(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].make */
extern T0* T87c7(T0* a1);
/* DS_LINKED_LIST [PR_TRANSITION].is_empty */
extern T1 T76f6(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].item */
extern T0* T91f6(T0* C, T6 a1);
/* PR_PARSER_GENERATOR.put_yydefact */
extern void T23f60(T0* C, T0* a1, T0* a2);
/* PR_PORTION.make_state */
extern T0* T105c11(T6 a1, T0* a2, T0* a3);
/* DS_ARRAYED_LIST [PR_REDUCTION].first */
extern T0* T85f10(T0* C);
/* DS_ARRAYED_LIST [PR_REDUCTION].item */
extern T0* T85f9(T0* C, T6 a1);
/* ARRAY [INTEGER_32].make_filled */
extern T0* T102c7(T6 a1, T6 a2, T6 a3);
/* ARRAY [INTEGER_32].make_filled_area */
extern void T102f9(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [PR_PORTION].make */
extern T0* T103c9(T6 a1);
/* DS_ARRAYED_LIST [PR_PORTION].set_internal_cursor */
extern void T103f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_PORTION].new_cursor */
extern T0* T103f6(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_PORTION].make */
extern T0* T240c3(T0* a1);
/* KL_SPECIAL_ROUTINES [PR_PORTION].make */
extern T0* T239f1(T0* C, T6 a1);
/* SPECIAL [PR_PORTION].make_filled */
extern T0* T238c3(T0* a1, T6 a2);
/* SPECIAL [PR_PORTION].fill_with */
extern void T238f6(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [PR_PORTION].make */
extern void T238f5(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_PORTION].default_create */
extern T0* T239c2(void);
/* PR_PARSER_GENERATOR.build_yytypes2 */
extern void T23f40(T0* C);
/* PR_PARSER_GENERATOR.build_yytypes1 */
extern void T23f39(T0* C);
/* PR_PARSER_GENERATOR.build_yyr1 */
extern void T23f38(T0* C);
/* PR_PARSER_GENERATOR.build_yytranslate */
extern void T23f37(T0* C);
/* DS_ARRAYED_LIST [PR_STATE].last */
extern T0* T57f6(T0* C);
/* PR_FSM.make */
extern T0* T22c10(T0* a1, T0* a2);
/* PR_FSM.set_error_actions */
extern void T22f16(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_warning */
extern void T28f9(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_warning_message */
extern void T28f12(T0* C, T0* a1);
/* KL_STDERR_FILE.put_line */
extern void T124f12(T0* C, T0* a1);
/* KL_STDERR_FILE.put_new_line */
extern void T124f16(T0* C);
/* KL_STDERR_FILE.put_string */
extern void T124f13(T0* C, T0* a1);
/* KL_STDERR_FILE.old_put_string */
extern void T124f17(T0* C, T0* a1);
/* KL_STDERR_FILE.console_ps */
extern void T124f21(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STDERR_FILE.string_ */
extern T0* T124f5(T0* C);
/* UT_ERROR_HANDLER.message */
extern T0* T28f5(T0* C, T0* a1);
/* UT_MESSAGE.make */
extern T0* T62c8(T0* a1);
/* ARRAY [STRING_8].put */
extern void T123f7(T0* C, T0* a1, T6 a2);
/* ARRAY [STRING_8].make_filled */
extern T0* T123c6(T0* a1, T6 a2, T6 a3);
/* ARRAY [STRING_8].make_filled_area */
extern void T123f8(T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].make_filled */
extern T0* T122c6(T0* a1, T6 a2);
/* SPECIAL [STRING_8].fill_with */
extern void T122f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].make */
extern void T122f9(T0* C, T6 a1);
/* KL_INTEGER_ROUTINES.append_decimal_integer */
extern void T67f3(T0* C, T6 a1, T0* a2);
/* PR_FSM.integer_ */
extern unsigned char ge223os1779;
extern T0* ge223ov1779;
extern T0* T22f5(T0* C);
/* KL_INTEGER_ROUTINES.default_create */
extern T0* T67c2(void);
/* PR_STATE.set_error_action */
extern void T59f29(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_POSITION].put_last */
extern void T68f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].has */
extern T1 T71f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_POSITION].make */
extern T0* T68c12(T6 a1);
/* DS_ARRAYED_LIST [PR_POSITION].set_internal_cursor */
extern void T68f17(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_POSITION].new_cursor */
extern T0* T68f9(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_POSITION].make */
extern T0* T205c3(T0* a1);
/* KL_SPECIAL_ROUTINES [PR_POSITION].make */
extern T0* T204f1(T0* C, T6 a1);
/* SPECIAL [PR_POSITION].make_filled */
extern T0* T202c5(T0* a1, T6 a2);
/* SPECIAL [PR_POSITION].fill_with */
extern void T202f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [PR_POSITION].make */
extern void T202f7(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_POSITION].default_create */
extern T0* T204c3(void);
/* PR_ERROR_ACTION.is_equal */
extern T1 T70f3(T0* C, T0* a1);
/* PR_ACTION.is_equal */
extern T1 T184f3(T0* C, T0* a1);
/* PR_ACTION.any_ */
extern T0* T184f4(T0* C);
/* PR_ERROR_ACTION.any_ */
extern T0* T70f4(T0* C);
/* PR_POSITION.error_action */
extern T0* T69f6(T0* C);
/* DS_ARRAYED_LIST [PR_ERROR_ACTION].item */
extern T0* T149f8(T0* C, T6 a1);
/* PR_POSITION.after */
extern T1 T69f5(T0* C);
/* PR_POSITION.before */
extern T1 T69f4(T0* C);
/* DS_ARRAYED_LIST [PR_POSITION].item */
extern T0* T68f8(T0* C, T6 a1);
/* PR_FSM.resolve_conflicts */
extern void T22f15(T0* C, T0* a1);
/* PR_STATE.reduce_reduce_count */
extern T6 T59f20(T0* C);
/* DS_LINKED_LIST [PR_TOKEN].force_last */
extern void T79f11(T0* C, T0* a1);
/* DS_LINKABLE [PR_TOKEN].put_right */
extern void T270f4(T0* C, T0* a1);
/* DS_LINKABLE [PR_TOKEN].make */
extern T0* T270c3(T0* a1);
/* DS_LINKED_LIST [PR_TOKEN].is_empty */
extern T1 T79f8(T0* C);
/* DS_LINKED_LIST [PR_TOKEN].has */
extern T1 T79f6(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TOKEN].make */
extern T0* T79c10(void);
/* DS_LINKED_LIST [PR_TOKEN].set_internal_cursor */
extern void T79f12(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TOKEN].new_cursor */
extern T0* T79f7(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_TOKEN].make */
extern T0* T271c7(T0* a1);
/* PR_STATE.shift_reduce_count */
extern T6 T59f19(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].remove */
extern void T98f23(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_TOKEN].move_left */
extern void T98f30(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [PR_TOKEN].move_cursors_left */
extern void T98f29(T0* C, T6 a1);
/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].set_position */
extern void T235f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_TOKEN].remove_last */
extern void T98f28(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].move_last_cursors_after */
extern void T98f33(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].set_next_cursor */
extern void T235f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].has */
extern T1 T98f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].put_last */
extern void T98f22(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].make */
extern T0* T98c19(T6 a1);
/* DS_ARRAYED_LIST [PR_TOKEN].set_internal_cursor */
extern void T98f20(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].new_cursor */
extern T0* T98f10(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].make */
extern T0* T235c7(T0* a1);
/* KL_SPECIAL_ROUTINES [PR_TOKEN].make */
extern T0* T148f1(T0* C, T6 a1);
/* SPECIAL [PR_TOKEN].make_filled */
extern T0* T147c6(T0* a1, T6 a2);
/* SPECIAL [PR_TOKEN].fill_with */
extern void T147f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [PR_TOKEN].make */
extern void T147f9(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_TOKEN].default_create */
extern T0* T148c3(void);
/* PR_STATE.resolve_conflicts */
extern T0* T59f17(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].force_last */
extern void T98f24(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].resize */
extern void T98f21(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_TOKEN].resize */
extern T0* T148f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_TOKEN].aliased_resized_area_with_default */
extern T0* T147f4(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_TOKEN].aliased_resized_area */
extern T0* T147f5(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_TOKEN].new_capacity */
extern T6 T98f12(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_TOKEN].extendible */
extern T1 T98f11(T0* C, T6 a1);
/* PR_TOKEN.is_non_associative */
extern T1 T84f17(T0* C);
/* PR_TOKEN.is_right_associative */
extern T1 T84f16(T0* C);
/* PR_TOKEN.is_left_associative */
extern T1 T84f15(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].delete */
extern void T98f26(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].clear_items */
extern void T98f32(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [PR_TOKEN].is_empty */
extern T1 T98f13(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].move_all_cursors_after */
extern void T98f31(T0* C);
/* DS_LINKED_LIST [PR_CONFLICT].force_last */
extern void T63f9(T0* C, T0* a1);
/* DS_LINKABLE [PR_CONFLICT].put_right */
extern void T291f4(T0* C, T0* a1);
/* DS_LINKABLE [PR_CONFLICT].make */
extern T0* T291c3(T0* a1);
/* DS_LINKED_LIST [PR_CONFLICT].is_empty */
extern T1 T63f6(T0* C);
/* PR_CONFLICT.make */
extern T0* T65c5(T0* a1, T0* a2, T0* a3, T0* a4);
/* PR_STATE.remove_shift */
extern void T59f33(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_STATE].remove */
extern void T57f23(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_STATE].move_left */
extern void T57f26(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [PR_STATE].move_cursors_left */
extern void T57f25(T0* C, T6 a1);
/* DS_ARRAYED_LIST_CURSOR [PR_STATE].set_position */
extern void T193f5(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_STATE].remove_last */
extern void T57f24(T0* C);
/* DS_ARRAYED_LIST [PR_STATE].move_last_cursors_after */
extern void T57f27(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_STATE].set_next_cursor */
extern void T193f6(T0* C, T0* a1);
/* PR_TOKEN.has_precedence */
extern T1 T84f10(T0* C);
/* PR_RULE.has_precedence */
extern T1 T72f15(T0* C);
/* DS_LINKED_LIST [PR_CONFLICT].make */
extern T0* T63c8(void);
/* DS_LINKED_LIST [PR_CONFLICT].set_internal_cursor */
extern void T63f10(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_CONFLICT].new_cursor */
extern T0* T63f5(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_CONFLICT].make */
extern T0* T290c7(T0* a1);
/* PR_FSM.make_default */
extern void T22f11(T0* C, T0* a1);
/* PR_FSM.build_deterministic */
extern void T22f18(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_REDUCTION].forth */
extern void T89f9(T0* C);
/* DS_LINKED_LIST [PR_REDUCTION].cursor_forth */
extern void T74f12(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_REDUCTION].add_traversing_cursor */
extern void T74f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_REDUCTION].set_next_cursor */
extern void T89f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_REDUCTION].remove_traversing_cursor */
extern void T74f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_REDUCTION].set */
extern void T89f10(T0* C, T0* a1, T1 a2, T1 a3);
/* PR_REDUCTION.build_lookaheads */
extern void T90f7(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_TOKEN].forth */
extern void T271f9(T0* C);
/* DS_LINKED_LIST [PR_TOKEN].cursor_forth */
extern void T79f14(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TOKEN].add_traversing_cursor */
extern void T79f15(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_TOKEN].set_next_cursor */
extern void T271f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TOKEN].remove_traversing_cursor */
extern void T79f16(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_TOKEN].set */
extern void T271f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [PR_TOKEN].item */
extern T0* T271f6(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_TOKEN].start */
extern void T271f8(T0* C);
/* DS_LINKED_LIST [PR_TOKEN].cursor_start */
extern void T79f13(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TOKEN].cursor_off */
extern T1 T79f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].wipe_out */
extern void T98f27(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_REDUCTION].item */
extern T0* T89f6(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_REDUCTION].start */
extern void T89f8(T0* C);
/* DS_LINKED_LIST [PR_REDUCTION].cursor_start */
extern void T74f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_REDUCTION].cursor_off */
extern T1 T74f7(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_REDUCTION].new_cursor */
extern T0* T74f5(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_REDUCTION].make */
extern T0* T89c7(T0* a1);
/* DS_NESTED_LIST_FLATTENER [PR_TOKEN].flatten */
extern void T78f2(T0* C, T0* a1);
/* DS_NESTED_LIST_FLATTENER [PR_TOKEN].traverse */
extern void T78f3(T0* C, T0* a1, T0* a2);
/* PR_TRANSITION.set_following_tokens */
extern void T82f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].remove */
extern void T213f10(T0* C);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].item */
extern T0* T213f5(T0* C);
/* PR_TRANSITION.add_following_token */
extern void T82f10(T0* C, T0* a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].force */
extern void T213f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].resize */
extern void T213f11(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_TOKEN]].resize */
extern T0* T282f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_NESTED_LIST [PR_TOKEN]].aliased_resized_area_with_default */
extern T0* T281f3(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_NESTED_LIST [PR_TOKEN]].aliased_resized_area */
extern T0* T281f4(T0* C, T6 a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].new_capacity */
extern T6 T213f7(T0* C, T6 a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].extendible */
extern T1 T213f6(T0* C, T6 a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].make */
extern T0* T213c8(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_TOKEN]].make */
extern T0* T282f1(T0* C, T6 a1);
/* SPECIAL [DS_NESTED_LIST [PR_TOKEN]].make_filled */
extern T0* T281c5(T0* a1, T6 a2);
/* SPECIAL [DS_NESTED_LIST [PR_TOKEN]].fill_with */
extern void T281f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_NESTED_LIST [PR_TOKEN]].make */
extern void T281f7(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_TOKEN]].default_create */
extern T0* T282c3(void);
/* PR_TRANSITION.set_index */
extern void T82f8(T0* C, T6 a1);
/* DS_NESTED_LIST_FLATTENER [PR_TOKEN].make */
extern T0* T78c1(void);
/* DS_ARRAYED_STACK [PR_STATE].item */
extern T0* T81f5(T0* C);
/* DS_ARRAYED_STACK [PR_STATE].remove */
extern void T81f9(T0* C);
/* PR_STATE.put_transition */
extern void T59f32(T0* C, T0* a1, T0* a2);
/* PR_REDUCTION.put_transition */
extern void T90f6(T0* C, T0* a1);
/* PR_STATE.shift */
extern T0* T59f21(T0* C, T0* a1);
/* DS_ARRAYED_STACK [PR_STATE].put */
extern void T81f8(T0* C, T0* a1);
/* DS_ARRAYED_STACK [PR_STATE].wipe_out */
extern void T81f7(T0* C);
/* DS_ARRAYED_STACK [PR_STATE].clear_items */
extern void T81f10(T0* C, T6 a1, T6 a2);
/* PR_TRANSITION.symbol */
extern T0* T82f6(T0* C);
/* PR_VARIABLE.transition */
extern T0* T73f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].go_after */
extern void T87f12(T0* C);
/* DS_LINKED_LIST [PR_TRANSITION].cursor_go_after */
extern void T76f15(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].set_after */
extern void T87f13(T0* C);
/* DS_ARRAYED_STACK [PR_STATE].make */
extern T0* T81c6(T6 a1);
/* KL_SPECIAL_ROUTINES [PR_STATE].make */
extern T0* T192f1(T0* C, T6 a1);
/* SPECIAL [detachable PR_STATE].make_filled */
extern T0* T96c5(T0* a1, T6 a2);
/* SPECIAL [detachable PR_STATE].fill_with */
extern void T96f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [detachable PR_STATE].make */
extern void T96f7(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_STATE].default_create */
extern T0* T192c3(void);
/* PR_GRAMMAR.max_rhs */
extern T6 T29f9(T0* C);
/* DS_LINKED_LIST [PR_TRANSITION].force_last */
extern void T76f9(T0* C, T0* a1);
/* DS_LINKABLE [PR_TRANSITION].put_right */
extern void T211f4(T0* C, T0* a1);
/* DS_LINKABLE [PR_TRANSITION].make */
extern T0* T211c3(T0* a1);
/* PR_VARIABLE.put_transition */
extern void T73f19(T0* C, T0* a1);
/* PR_TRANSITION.make */
extern T0* T82c7(T0* a1, T0* a2);
/* DS_LINKED_LIST [PR_REDUCTION].append_last */
extern void T74f9(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_REDUCTION].is_empty */
extern T1 T74f6(T0* C);
/* DS_LINKABLE [PR_REDUCTION].put_right */
extern void T210f4(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].after */
extern T1 T223f4(T0* C);
/* DS_ARRAYED_LIST [PR_REDUCTION].cursor_after */
extern T1 T85f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].forth */
extern void T223f9(T0* C);
/* DS_ARRAYED_LIST [PR_REDUCTION].cursor_forth */
extern void T85f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].set_position */
extern void T223f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_REDUCTION].add_traversing_cursor */
extern void T85f22(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].set_next_cursor */
extern void T223f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_REDUCTION].remove_traversing_cursor */
extern void T85f23(T0* C, T0* a1);
/* DS_LINKABLE [PR_REDUCTION].make */
extern T0* T210c3(T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].item */
extern T0* T223f6(T0* C);
/* DS_ARRAYED_LIST [PR_REDUCTION].cursor_item */
extern T0* T85f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].start */
extern void T223f8(T0* C);
/* DS_ARRAYED_LIST [PR_REDUCTION].cursor_start */
extern void T85f20(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].off */
extern T1 T223f5(T0* C);
/* DS_ARRAYED_LIST [PR_REDUCTION].cursor_off */
extern T1 T85f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_REDUCTION].cursor_before */
extern T1 T85f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_REDUCTION].new_cursor */
extern T0* T85f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].make */
extern T0* T223c7(T0* a1);
/* DS_ARRAYED_LIST [PR_REDUCTION].is_empty */
extern T1 T85f8(T0* C);
/* PR_STATE.set_lookahead_needed */
extern void T59f31(T0* C);
/* DS_ARRAYED_LIST [PR_STATE].is_empty */
extern T1 T57f12(T0* C);
/* DS_LINKED_LIST [PR_TRANSITION].make */
extern T0* T76c8(void);
/* DS_LINKED_LIST [PR_TRANSITION].set_internal_cursor */
extern void T76f10(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_REDUCTION].make */
extern T0* T74c8(void);
/* DS_LINKED_LIST [PR_REDUCTION].set_internal_cursor */
extern void T74f10(T0* C, T0* a1);
/* PR_FSM.build_nondeterministic */
extern void T22f17(T0* C);
/* PR_FSM.put_final_state */
extern void T22f22(T0* C);
/* PR_TOKEN.make */
extern T0* T84c20(T6 a1, T0* a2, T0* a3);
/* PR_FSM.no_type */
extern unsigned char ge129os1778;
extern T0* ge129ov1778;
extern T0* T22f8(T0* C);
/* DS_ARRAYED_LIST [PR_TYPE].first */
extern T0* T112f7(T0* C);
/* PR_TYPE.make */
extern void T99f9(T0* C, T6 a1, T0* a2, T0* a3);
/* PR_TYPE.make */
extern T0* T99c9(T6 a1, T0* a2, T0* a3);
/* DS_ARRAYED_LIST [PR_STATE].force_last */
extern void T57f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_STATE].new_capacity */
extern T6 T57f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_STATE].put_last */
extern void T57f17(T0* C, T0* a1);
/* PR_STATE.make */
extern T0* T59c25(T6 a1, T0* a2);
/* DS_ARRAYED_LIST [PR_REDUCTION].make */
extern T0* T85c16(T6 a1);
/* DS_ARRAYED_LIST [PR_REDUCTION].set_internal_cursor */
extern void T85f17(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [PR_REDUCTION].make */
extern T0* T221f1(T0* C, T6 a1);
/* SPECIAL [PR_REDUCTION].make_filled */
extern T0* T222c5(T0* a1, T6 a2);
/* SPECIAL [PR_REDUCTION].fill_with */
extern void T222f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [PR_REDUCTION].make */
extern void T222f6(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_REDUCTION].default_create */
extern T0* T221c3(void);
/* DS_ARRAYED_LIST [PR_POSITION].make_equal */
extern T0* T68c14(T6 a1);
/* KL_EQUALITY_TESTER [PR_POSITION].default_create */
extern T0* T203c2(void);
/* PR_STATE.has_shift */
extern T1 T59f23(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_STATE].first */
extern T0* T57f11(T0* C);
/* DS_ARRAYED_LIST [PR_STATE].resize */
extern void T57f16(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_STATE].resize */
extern T0* T192f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [detachable PR_STATE].aliased_resized_area_with_default */
extern T0* T96f3(T0* C, T0* a1, T6 a2);
/* SPECIAL [detachable PR_STATE].aliased_resized_area */
extern T0* T96f4(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_STATE].extendible */
extern T1 T57f7(T0* C, T6 a1);
/* PR_FSM.build_transitions */
extern void T22f21(T0* C, T0* a1);
/* PR_FSM.new_state */
extern T0* T22f7(T0* C, T0* a1);
/* PR_STATE.set_id */
extern void T59f28(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].put_new */
extern void T58f38(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].key_storage_put */
extern void T58f49(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].item_storage_put */
extern void T58f48(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].slots_put */
extern void T58f42(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].clashes_put */
extern void T58f43(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].slots_item */
extern T6 T58f28(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].hash_position */
extern T6 T58f27(T0* C, T6 a1);
/* INTEGER_32.hash_code */
extern T6 T6f20(T6* C);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].clashes_item */
extern T6 T58f23(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].unset_found_item */
extern void T58f40(T0* C);
/* PR_STATE.same_state */
extern T1 T59f12(T0* C, T0* a1);
/* PR_POSITION.same_position */
extern T1 T69f7(T0* C, T0* a1);
/* PR_STATE.any_ */
extern T0* T59f22(T0* C);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].found_item */
extern T0* T58f29(T0* C);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].item_storage_item */
extern T0* T58f22(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].found */
extern T1 T58f30(T0* C);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].search */
extern void T58f37(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].search_position */
extern void T58f47(T0* C, T6 a1);
/* KL_EQUALITY_TESTER [INTEGER_32].test */
extern T1 T41f1(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].key_storage_item */
extern T6 T58f26(T0* C, T6 a1);
/* PR_STATE.sort_positions */
extern void T59f26(T0* C);
/* DS_ARRAYED_LIST [PR_POSITION].sort */
extern void T68f15(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [PR_POSITION].sort */
extern void T200f3(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [PR_POSITION].sort_with_comparator */
extern void T200f4(T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [PR_POSITION].subsort_with_comparator */
extern void T200f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* DS_ARRAYED_LIST [PR_POSITION].replace */
extern void T68f18(T0* C, T0* a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [PR_POSITION].less_than */
extern T1 T266f1(T0* C, T0* a1, T0* a2);
/* PR_POSITION.is_less */
extern T1 T69f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_POSITION].is_empty */
extern T1 T68f11(T0* C);
/* PR_STATE.position_sorter */
extern unsigned char ge132os3922;
extern T0* ge132ov3922;
extern T0* T59f14(T0* C);
/* DS_BUBBLE_SORTER [PR_POSITION].make */
extern T0* T200c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [PR_POSITION].make */
extern T0* T266c2(void);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].resize */
extern void T58f36(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].clashes_resize */
extern void T58f46(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].resize */
extern T0* T131f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [INTEGER_32].aliased_resized_area_with_default */
extern T0* T101f4(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].special_integer_ */
extern T0* T58f24(T0* C);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].key_storage_resize */
extern void T58f45(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].item_storage_resize */
extern void T58f44(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_STATE]].resize */
extern T0* T197f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_ARRAYED_LIST [PR_STATE]].aliased_resized_area_with_default */
extern T0* T194f3(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_ARRAYED_LIST [PR_STATE]].aliased_resized_area */
extern T0* T194f4(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].slots_resize */
extern void T58f41(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].new_modulus */
extern T6 T58f33(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_REDUCTION].put_last */
extern void T85f19(T0* C, T0* a1);
/* PR_REDUCTION.make */
extern T0* T90c5(T0* a1);
/* PR_FSM.put_closure_positions */
extern void T22f23(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [PR_RULE].forth */
extern void T100f9(T0* C);
/* DS_LINKED_LIST [PR_RULE].cursor_forth */
extern void T94f13(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_RULE].add_traversing_cursor */
extern void T94f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_RULE].set_next_cursor */
extern void T100f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_RULE].remove_traversing_cursor */
extern void T94f15(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_RULE].set */
extern void T100f10(T0* C, T0* a1, T1 a2, T1 a3);
/* PR_POSITION.make */
extern T0* T69c12(T0* a1, T6 a2);
/* DS_LINKED_LIST_CURSOR [PR_RULE].item */
extern T0* T100f6(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_RULE].start */
extern void T100f8(T0* C);
/* DS_LINKED_LIST [PR_RULE].cursor_start */
extern void T94f12(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_RULE].cursor_off */
extern T1 T94f6(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_RULE].new_cursor */
extern T0* T94f8(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_RULE].make */
extern T0* T100c7(T0* a1);
/* PR_STATE.put_position */
extern void T59f27(T0* C, T0* a1);
/* PR_POSITION.hash_code */
extern T6 T69f3(T0* C);
/* DS_ARRAYED_LIST [PR_POSITION].resize */
extern void T68f16(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_POSITION].resize */
extern T0* T204f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_POSITION].aliased_resized_area_with_default */
extern T0* T202f3(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_POSITION].aliased_resized_area */
extern T0* T202f4(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_POSITION].is_full */
extern T1 T68f7(T0* C);
/* DS_ARRAYED_LIST [PR_POSITION].has */
extern T1 T68f10(T0* C, T0* a1);
/* KL_EQUALITY_TESTER [PR_POSITION].test */
extern T1 T203f1(T0* C, T0* a1, T0* a2);
/* PR_POSITION.is_equal */
extern T1 T69f10(T0* C, T0* a1);
/* PR_POSITION.next */
extern T0* T69f9(T0* C);
/* ARRAY [detachable PR_STATE].put */
extern void T97f6(T0* C, T0* a1, T6 a2);
/* ARRAY [detachable PR_STATE].item */
extern T0* T97f4(T0* C, T6 a1);
/* PR_POSITION.symbol */
extern T0* T69f8(T0* C);
/* DS_ARRAYED_LIST [PR_REDUCTION].resize */
extern void T85f18(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_REDUCTION].resize */
extern T0* T221f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_REDUCTION].aliased_resized_area_with_default */
extern T0* T222f3(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_REDUCTION].aliased_resized_area */
extern T0* T222f4(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_REDUCTION].extendible */
extern T1 T85f6(T0* C, T6 a1);
/* ARRAY [detachable PR_STATE].make_filled */
extern T0* T97c5(T0* a1, T6 a2, T6 a3);
/* ARRAY [detachable PR_STATE].make_filled_area */
extern void T97f7(T0* C, T0* a1, T6 a2);
/* PR_FSM.put_start_state */
extern void T22f20(T0* C);
/* DS_ARRAYED_LIST [PR_STATE].put_first */
extern void T57f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_STATE].put */
extern void T57f20(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [PR_STATE].move_cursors_right */
extern void T57f22(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [PR_STATE].move_right */
extern void T57f21(T0* C, T6 a1, T6 a2);
/* PR_FSM.build_derives */
extern void T22f19(T0* C);
/* DS_NESTED_LIST_FLATTENER [PR_RULE].flatten */
extern void T92f2(T0* C, T0* a1);
/* DS_NESTED_LIST_FLATTENER [PR_RULE].traverse */
extern void T92f3(T0* C, T0* a1, T0* a2);
/* PR_VARIABLE.set_derives */
extern void T73f25(T0* C, T0* a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].remove */
extern void T229f10(T0* C);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].item */
extern T0* T229f5(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_VARIABLE].forth */
extern void T234f9(T0* C);
/* DS_LINKED_LIST [PR_VARIABLE].cursor_forth */
extern void T93f12(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_VARIABLE].add_traversing_cursor */
extern void T93f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_VARIABLE].set_next_cursor */
extern void T234f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_VARIABLE].remove_traversing_cursor */
extern void T93f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_VARIABLE].set */
extern void T234f10(T0* C, T0* a1, T1 a2, T1 a3);
/* PR_VARIABLE.add_derive */
extern void T73f24(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_RULE].force_last */
extern void T94f17(T0* C, T0* a1);
/* DS_LINKABLE [PR_RULE].put_right */
extern void T237f4(T0* C, T0* a1);
/* DS_LINKABLE [PR_RULE].make */
extern T0* T237c3(T0* a1);
/* DS_LINKED_LIST [PR_RULE].is_empty */
extern T1 T94f7(T0* C);
/* DS_LINKED_LIST [PR_RULE].has */
extern T1 T94f9(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_VARIABLE].item */
extern T0* T234f6(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_VARIABLE].start */
extern void T234f8(T0* C);
/* DS_LINKED_LIST [PR_VARIABLE].cursor_start */
extern void T93f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_VARIABLE].cursor_off */
extern T1 T93f7(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_VARIABLE].new_cursor */
extern T0* T93f6(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_VARIABLE].make */
extern T0* T234c7(T0* a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].force */
extern void T229f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].resize */
extern void T229f11(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_RULE]].resize */
extern T0* T284f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_NESTED_LIST [PR_RULE]].aliased_resized_area_with_default */
extern T0* T283f3(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_NESTED_LIST [PR_RULE]].aliased_resized_area */
extern T0* T283f4(T0* C, T6 a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].new_capacity */
extern T6 T229f7(T0* C, T6 a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].extendible */
extern T1 T229f6(T0* C, T6 a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].make */
extern T0* T229c8(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_RULE]].make */
extern T0* T284f1(T0* C, T6 a1);
/* SPECIAL [DS_NESTED_LIST [PR_RULE]].make_filled */
extern T0* T283c5(T0* a1, T6 a2);
/* SPECIAL [DS_NESTED_LIST [PR_RULE]].fill_with */
extern void T283f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_NESTED_LIST [PR_RULE]].make */
extern void T283f7(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_RULE]].default_create */
extern T0* T284c3(void);
/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].forth */
extern void T226f11(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].cursor_forth */
extern void T91f37(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].set_position */
extern void T226f8(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].add_traversing_cursor */
extern void T91f38(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].set_next_cursor */
extern void T226f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].remove_traversing_cursor */
extern void T91f39(T0* C, T0* a1);
/* PR_VARIABLE.set_index */
extern void T73f23(T0* C, T6 a1);
/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].item */
extern T0* T226f4(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].cursor_item */
extern T0* T91f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].after */
extern T1 T226f5(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].cursor_after */
extern T1 T91f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].start */
extern void T226f10(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].cursor_start */
extern void T91f36(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].is_empty */
extern T1 T91f17(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].off */
extern T1 T226f6(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].cursor_off */
extern T1 T91f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].cursor_before */
extern T1 T91f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].new_cursor */
extern T0* T91f10(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].make */
extern T0* T226c7(T0* a1);
/* DS_NESTED_LIST_FLATTENER [PR_RULE].make */
extern T0* T92c1(void);
/* DS_LINKED_LIST [PR_RULE].append_last */
extern void T94f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_RULE].after */
extern T1 T208f5(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].cursor_after */
extern T1 T71f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_RULE].forth */
extern void T208f11(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].cursor_forth */
extern void T71f34(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_RULE].set_position */
extern void T208f8(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_RULE].add_traversing_cursor */
extern void T71f35(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_RULE].set_next_cursor */
extern void T208f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].remove_traversing_cursor */
extern void T71f36(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_RULE].item */
extern T0* T208f4(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].cursor_item */
extern T0* T71f17(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_RULE].start */
extern void T208f10(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].cursor_start */
extern void T71f33(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_RULE].off */
extern T1 T208f6(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].cursor_off */
extern T1 T71f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].cursor_before */
extern T1 T71f20(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].new_cursor */
extern T0* T71f11(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_RULE].make */
extern T0* T208c7(T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].is_empty */
extern T1 T71f9(T0* C);
/* DS_LINKED_LIST [PR_VARIABLE].force_last */
extern void T93f10(T0* C, T0* a1);
/* DS_LINKABLE [PR_VARIABLE].put_right */
extern void T296f4(T0* C, T0* a1);
/* DS_LINKABLE [PR_VARIABLE].make */
extern T0* T296c3(T0* a1);
/* DS_LINKED_LIST [PR_VARIABLE].is_empty */
extern T1 T93f5(T0* C);
/* DS_ARRAYED_LIST [PR_SYMBOL].first */
extern T0* T80f10(T0* C);
/* DS_ARRAYED_LIST [PR_SYMBOL].is_empty */
extern T1 T80f9(T0* C);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].make */
extern T0* T58c35(T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].make_with_equality_testers */
extern void T58f39(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].make */
extern T0* T195c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].set_internal_cursor */
extern void T195f6(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].new_cursor */
extern T0* T195f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].make */
extern T0* T280c3(T0* a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].new_cursor */
extern T0* T58f31(T0* C);
/* DS_HASH_TABLE_CURSOR [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].make */
extern T0* T198c3(T0* a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].make_sparse_container */
extern void T58f50(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].set_internal_cursor */
extern void T58f55(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].make_slots */
extern void T58f54(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].make_clashes */
extern void T58f53(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].make_key_storage */
extern void T58f52(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].make_item_storage */
extern void T58f51(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_STATE]].make */
extern T0* T197f2(T0* C, T6 a1);
/* SPECIAL [DS_ARRAYED_LIST [PR_STATE]].make_filled */
extern T0* T194c5(T0* a1, T6 a2);
/* SPECIAL [DS_ARRAYED_LIST [PR_STATE]].fill_with */
extern void T194f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_ARRAYED_LIST [PR_STATE]].make */
extern void T194f7(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_STATE]].default_create */
extern T0* T197c3(void);
/* KL_EQUALITY_TESTER [INTEGER_32].default_create */
extern T0* T41c2(void);
/* DS_ARRAYED_LIST [PR_STATE].make */
extern T0* T57c14(T6 a1);
/* DS_ARRAYED_LIST [PR_STATE].set_internal_cursor */
extern void T57f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_STATE].new_cursor */
extern T0* T57f9(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_STATE].make */
extern T0* T193c4(T0* a1);
/* PR_GRAMMAR.set_nullable */
extern void T29f21(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].remove_last */
extern void T91f23(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].move_last_cursors_after */
extern void T91f28(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].last */
extern T0* T91f11(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].first */
extern T0* T91f9(T0* C);
/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].item */
extern T0* T182f7(T0* C, T6 a1);
/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].wipe_out */
extern void T182f11(T0* C);
/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].clear_items */
extern void T182f14(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].move_all_cursors_after */
extern void T182f13(T0* C);
/* DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [PR_VARIABLE]].set_next_cursor */
extern void T278f6(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [PR_VARIABLE]].set_position */
extern void T278f5(T0* C, T6 a1);
/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].put_last */
extern void T182f10(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].put_last */
extern void T91f22(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].put_first */
extern void T91f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].put */
extern void T91f27(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [PR_VARIABLE].move_cursors_right */
extern void T91f34(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [PR_VARIABLE].move_right */
extern void T91f33(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [PR_VARIABLE].make */
extern T0* T91c20(T6 a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].set_internal_cursor */
extern void T91f26(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [PR_VARIABLE].make */
extern T0* T225f1(T0* C, T6 a1);
/* SPECIAL [PR_VARIABLE].make_filled */
extern T0* T224c6(T0* a1, T6 a2);
/* SPECIAL [PR_VARIABLE].fill_with */
extern void T224f10(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [PR_VARIABLE].make */
extern void T224f9(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_VARIABLE].default_create */
extern T0* T225c3(void);
/* PR_VARIABLE.set_nullable */
extern void T73f20(T0* C);
/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].make */
extern T0* T182c9(T6 a1);
/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].set_internal_cursor */
extern void T182f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].new_cursor */
extern T0* T182f6(T0* C);
/* DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [PR_VARIABLE]].make */
extern T0* T278c4(T0* a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_VARIABLE]].make */
extern T0* T277f1(T0* C, T6 a1);
/* SPECIAL [DS_ARRAYED_LIST [PR_VARIABLE]].make_filled */
extern T0* T276c3(T0* a1, T6 a2);
/* SPECIAL [DS_ARRAYED_LIST [PR_VARIABLE]].fill_with */
extern void T276f6(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_ARRAYED_LIST [PR_VARIABLE]].make */
extern void T276f5(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_VARIABLE]].default_create */
extern T0* T277c2(void);
/* PR_GRAMMAR.reduce */
extern void T29f23(T0* C, T0* a1);
/* PR_GRAMMAR.integer_ */
extern T0* T29f14(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].remove */
extern void T91f24(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].move_left */
extern void T91f30(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [PR_VARIABLE].move_cursors_left */
extern void T91f29(T0* C, T6 a1);
/* PR_VARIABLE.set_id */
extern void T73f22(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_RULE].remove */
extern void T71f22(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_RULE].move_left */
extern void T71f29(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [PR_RULE].move_cursors_left */
extern void T71f28(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_RULE].remove_last */
extern void T71f27(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].move_last_cursors_after */
extern void T71f32(T0* C);
/* PR_RULE.set_id */
extern void T72f28(T0* C, T6 a1);
/* PR_GRAMMAR.mark_useful_rules */
extern void T29f29(T0* C);
/* PR_RULE.set_useful */
extern void T72f29(T0* C, T1 a1);
/* PR_GRAMMAR.traverse_variable */
extern void T29f30(T0* C, T0* a1);
/* PR_TOKEN.set_useful */
extern void T84f28(T0* C, T1 a1);
/* PR_VARIABLE.set_useful */
extern void T73f18(T0* C, T1 a1);
/* PR_GRAMMAR.mark_useful_variables */
extern void T29f28(T0* C);
/* PR_FSM.make_verbose */
extern T0* T22c9(T0* a1, T0* a2, T0* a3);
/* PR_FSM.print_machine */
extern void T22f14(T0* C, T0* a1);
/* PR_STATE.print_state */
extern void T59f30(T0* C, T0* a1);
/* PR_STATE.print_reductions */
extern void T59f34(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].extend_last */
extern void T98f25(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].forth */
extern void T235f9(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].cursor_forth */
extern void T98f35(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].add_traversing_cursor */
extern void T98f36(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].remove_traversing_cursor */
extern void T98f37(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].item */
extern T0* T235f4(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].cursor_item */
extern T0* T98f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].after */
extern T1 T235f5(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].cursor_after */
extern T1 T98f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].start */
extern void T235f8(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].cursor_start */
extern void T98f34(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].off */
extern T1 T235f6(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].cursor_off */
extern T1 T98f17(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].cursor_before */
extern T1 T98f18(T0* C, T0* a1);
/* PR_POSITION.print_position */
extern void T69f13(T0* C, T0* a1);
/* PR_GRAMMAR.print_grammar */
extern void T29f22(T0* C, T0* a1);
/* PR_VARIABLE.print_variable */
extern void T73f21(T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_LIST [PR_SYMBOL].has */
extern T1 T80f11(T0* C, T0* a1);
/* PR_TOKEN.print_token */
extern void T84f30(T0* C, T0* a1, T0* a2);
/* PR_RULE.print_rule */
extern void T72f27(T0* C, T0* a1);
/* PR_FSM.set_error_actions_verbose */
extern void T22f13(T0* C, T0* a1, T0* a2);
/* PR_FSM.resolve_conflicts_verbose */
extern void T22f12(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [PR_CONFLICT].forth */
extern void T290f9(T0* C);
/* DS_LINKED_LIST [PR_CONFLICT].cursor_forth */
extern void T63f12(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_CONFLICT].add_traversing_cursor */
extern void T63f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_CONFLICT].set_next_cursor */
extern void T290f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_CONFLICT].remove_traversing_cursor */
extern void T63f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_CONFLICT].set */
extern void T290f10(T0* C, T0* a1, T1 a2, T1 a3);
/* PR_CONFLICT.print_conflict */
extern void T65f6(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_CONFLICT].item */
extern T0* T290f6(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_CONFLICT].start */
extern void T290f8(T0* C);
/* DS_LINKED_LIST [PR_CONFLICT].cursor_start */
extern void T63f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_CONFLICT].cursor_off */
extern T1 T63f7(T0* C, T0* a1);
/* PR_GRAMMAR.reduce_verbose */
extern void T29f20(T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_LIST [PR_RULE].cloned_object */
extern T0* T71f12(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].twin */
extern T0* T71f8(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].copy */
extern void T71f25(T0* C, T0* a1);
/* SPECIAL [PR_RULE].twin */
extern T0* T206f3(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].set_internal_cursor */
extern void T71f26(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].valid_cursor */
extern T1 T71f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].move_all_cursors_after */
extern void T71f30(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].cloned_object */
extern T0* T91f8(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].twin */
extern T0* T91f7(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].copy */
extern void T91f25(T0* C, T0* a1);
/* SPECIAL [PR_VARIABLE].twin */
extern T0* T224f3(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].valid_cursor */
extern T1 T91f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].move_all_cursors_after */
extern void T91f31(T0* C);
/* KL_STANDARD_FILES.output */
extern unsigned char ge265os2970;
extern T0* ge265ov2970;
extern T0* T35f1(T0* C);
/* KL_STDOUT_FILE.make */
extern T0* T36c10(void);
/* KL_STDOUT_FILE.make_open_stdout */
extern void T36f17(T0* C, T0* a1);
/* KL_STDOUT_FILE.set_write_mode */
extern void T36f22(T0* C);
/* KL_STDOUT_FILE.console_def */
extern T14 T36f8(T0* C, T6 a1);
/* KL_STDOUT_FILE.old_make */
extern void T36f21(T0* C, T0* a1);
/* STRING_8.make_empty */
extern T0* T17c32(void);
/* GEYACC.std */
extern unsigned char ge263os1755;
extern T0* ge263ov1755;
extern T0* T21f12(T0* C);
/* KL_STANDARD_FILES.default_create */
extern T0* T35c4(void);
/* KL_EXCEPTIONS.die */
extern void T34f2(T0* C, T6 a1);
/* GEYACC.exceptions */
extern unsigned char ge300os1753;
extern T0* ge300ov1753;
extern T0* T21f15(T0* C);
/* KL_EXCEPTIONS.default_create */
extern T0* T34c1(void);
/* UT_ERROR_HANDLER.report_error */
extern void T28f7(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_error_message */
extern void T28f10(T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.make */
extern T0* T25c8(T0* a1);
/* KL_TEXT_OUTPUT_FILE.close */
extern void T24f24(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_close */
extern void T24f31(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_close */
extern void T24f36(T0* C, T14 a1);
/* PR_HTML_DOC_GENERATOR.print_grammar */
extern void T31f5(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_grammar_footer */
extern void T31f8(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_rules */
extern void T31f7(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_first_rhs_footer */
extern void T31f17(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_first_rhs_header */
extern void T31f16(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_lhs */
extern void T31f15(T0* C, T0* a1, T0* a2);
/* PR_HTML_DOC_GENERATOR.print_rule_header */
extern void T31f14(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_rule_footer */
extern void T31f13(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_next_rhs_footer */
extern void T31f12(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_rhs */
extern void T31f11(T0* C, T0* a1, T0* a2);
/* PR_HTML_DOC_GENERATOR.print_variable */
extern void T31f20(T0* C, T0* a1, T0* a2);
/* PR_HTML_DOC_GENERATOR.print_token */
extern void T31f19(T0* C, T0* a1, T0* a2);
/* PR_HTML_DOC_GENERATOR.print_escaped */
extern void T31f21(T0* C, T0* a1, T0* a2);
/* PR_HTML_DOC_GENERATOR.print_empty_rhs */
extern void T31f18(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_next_rhs_header */
extern void T31f10(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_grammar_header */
extern void T31f6(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_css */
extern void T31f9(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_grammar */
extern void T30f5(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_grammar_footer */
extern void T30f8(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_rules */
extern void T30f7(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_first_rhs_footer */
extern void T30f16(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_first_rhs_header */
extern void T30f15(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_lhs */
extern void T30f14(T0* C, T0* a1, T0* a2);
/* PR_XML_DOC_GENERATOR.print_rule_header */
extern void T30f13(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_rule_footer */
extern void T30f12(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_next_rhs_footer */
extern void T30f11(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_rhs */
extern void T30f10(T0* C, T0* a1, T0* a2);
/* PR_XML_DOC_GENERATOR.print_variable */
extern void T30f19(T0* C, T0* a1, T0* a2);
/* PR_XML_DOC_GENERATOR.print_token */
extern void T30f18(T0* C, T0* a1, T0* a2);
/* PR_XML_DOC_GENERATOR.print_escaped */
extern void T30f20(T0* C, T0* a1, T0* a2);
/* PR_XML_DOC_GENERATOR.print_empty_rhs */
extern void T30f17(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_next_rhs_header */
extern void T30f9(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_grammar_header */
extern void T30f6(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.is_open_write */
extern T1 T24f12(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
extern T1 T24f8(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T24f23(T0* C);
/* KL_TEXT_OUTPUT_FILE.is_closed */
extern T1 T24f13(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_closed */
extern T1 T24f11(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_write */
extern void T24f32(T0* C);
/* KL_TEXT_OUTPUT_FILE.default_pointer */
extern T14 T24f19(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T24f32p1(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_open */
extern T14 T24f20(T0* C, T14 a1, T6 a2);
/* STRING_8.to_c */
extern T0* T17f4(T0* C);
/* KL_TEXT_OUTPUT_FILE.make */
extern T0* T24c21(T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_make */
extern void T24f30(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.set_lhs_shared */
extern void T31f4(T0* C, T1 a1);
/* PR_XML_DOC_GENERATOR.set_lhs_shared */
extern void T30f4(T0* C, T1 a1);
/* PR_HTML_DOC_GENERATOR.make */
extern T0* T31c3(T0* a1);
/* PR_XML_DOC_GENERATOR.make */
extern T0* T30c3(T0* a1);
/* STRING_8.is_equal */
extern T1 T17f5(T0* C, T0* a1);
/* GEYACC.parse_input_file */
extern void T21f21(T0* C);
/* KL_STANDARD_FILES.input */
extern unsigned char ge265os2969;
extern T0* ge265ov2969;
extern T0* T35f2(T0* C);
/* KL_STDIN_FILE.make */
extern T0* T54c19(void);
/* KL_STDIN_FILE.make_open_stdin */
extern void T54f21(T0* C, T0* a1);
/* KL_STDIN_FILE.set_read_mode */
extern void T54f23(T0* C);
/* KL_STDIN_FILE.console_def */
extern T14 T54f9(T0* C, T6 a1);
/* KL_STDIN_FILE.old_make */
extern void T54f22(T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.make */
extern T0* T52c8(T0* a1);
/* KL_TEXT_INPUT_FILE.close */
extern void T51f39(T0* C);
/* KL_TEXT_INPUT_FILE.old_close */
extern void T51f41(T0* C);
/* KL_TEXT_INPUT_FILE.file_close */
extern void T51f43(T0* C, T14 a1);
/* PR_YACC_PARSER.parse_file */
extern void T50f293(T0* C, T0* a1);
/* PR_YACC_PARSER.parse */
extern void T50f297(T0* C);
/* PR_YACC_PARSER.yy_pop_last_value */
extern void T50f310(T0* C, T6 a1);
/* PR_YACC_PARSER.yy_push_error_value */
extern void T50f309(T0* C);
/* KL_SPECIAL_ROUTINES [ANY].resize */
extern T0* T134f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ANY].aliased_resized_area_with_default */
extern T0* T133f3(T0* C, T0* a1, T6 a2);
/* SPECIAL [ANY].aliased_resized_area */
extern T0* T133f4(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].make */
extern T0* T134f1(T0* C, T6 a1);
/* SPECIAL [ANY].make_filled */
extern T0* T133c5(T0* a1, T6 a2);
/* SPECIAL [ANY].fill_with */
extern void T133f7(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ANY].make */
extern void T133f8(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].default_create */
extern T0* T134c3(void);
/* PR_YACC_PARSER.yy_do_action */
extern void T50f308(T0* C, T6 a1);
/* PR_GRAMMAR.set_eiffel_code */
extern void T29f25(T0* C, T0* a1);
/* PR_YACC_PARSER.report_prec_not_token_error */
extern void T50f338(T0* C, T0* a1);
/* PR_PREC_NOT_TOKEN_ERROR.make */
extern T0* T158c8(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.filename */
extern T0* T50f262(T0* C);
/* PR_YACC_PARSER.new_token */
extern T0* T50f189(T0* C, T0* a1);
/* PR_GRAMMAR.put_token */
extern void T29f33(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].is_full */
extern T1 T98f8(T0* C);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].force_new */
extern void T126f41(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].key_storage_put */
extern void T126f49(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].item_storage_put */
extern void T126f45(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].slots_put */
extern void T126f48(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].clashes_put */
extern void T126f47(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].slots_item */
extern T6 T126f36(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].hash_position */
extern T6 T126f28(T0* C, T0* a1);
/* STRING_8.hash_code */
extern T6 T17f28(T0* C);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].clashes_item */
extern T6 T126f35(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].resize */
extern void T126f46(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].clashes_resize */
extern void T126f54(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].special_integer_ */
extern T0* T126f32(T0* C);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].key_storage_resize */
extern void T126f53(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].item_storage_resize */
extern void T126f52(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].key_storage_item */
extern T0* T126f23(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].slots_resize */
extern void T126f51(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].new_modulus */
extern T6 T126f26(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].new_capacity */
extern T6 T126f25(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].unset_found_item */
extern void T126f44(T0* C);
/* PR_YACC_PARSER.unknown_type */
extern T0* T50f279(T0* C);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].found_item */
extern T0* T126f21(T0* C);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].item_storage_item */
extern T0* T126f29(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].found */
extern T1 T126f33(T0* C);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].search */
extern void T126f40(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].search_position */
extern void T126f42(T0* C, T0* a1);
/* KL_EQUALITY_TESTER [STRING_8].test */
extern T1 T42f1(T0* C, T0* a1, T0* a2);
/* STRING_8.as_lower */
extern T0* T17f10(T0* C);
/* STRING_8.to_lower */
extern void T17f39(T0* C);
/* STRING_8.to_lower_area */
extern void T17f44(T0* C, T0* a1, T6 a2, T6 a3);
/* STRING_8.twin */
extern T0* T17f9(T0* C);
/* STRING_8.copy */
extern void T17f38(T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].twin */
extern T0* T15f4(T0* C);
/* PR_YACC_PARSER.report_prec_specified_twice_error */
extern void T50f337(T0* C);
/* PR_PREC_SPECIFIED_TWICE_ERROR.make */
extern T0* T157c8(T0* a1, T6 a2);
/* PR_YACC_PARSER.put_action */
extern void T50f336(T0* C, T0* a1, T0* a2);
/* PR_RULE.put_symbol */
extern void T72f23(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_ERROR_ACTION].put_last */
extern void T149f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_ERROR_ACTION].resize */
extern void T149f11(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_ERROR_ACTION].resize */
extern T0* T258f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_ERROR_ACTION].aliased_resized_area_with_default */
extern T0* T259f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_ERROR_ACTION].aliased_resized_area */
extern T0* T259f3(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_ERROR_ACTION].is_full */
extern T1 T149f7(T0* C);
/* DS_ARRAYED_LIST [PR_SYMBOL].put_last */
extern void T80f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_SYMBOL].resize */
extern void T80f14(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_SYMBOL].resize */
extern T0* T219f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_SYMBOL].aliased_resized_area_with_default */
extern T0* T218f3(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_SYMBOL].aliased_resized_area */
extern T0* T218f4(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_SYMBOL].is_full */
extern T1 T80f8(T0* C);
/* PR_RULE.set_action */
extern void T72f24(T0* C, T0* a1);
/* PR_VARIABLE.set_type */
extern void T73f16(T0* C, T0* a1);
/* PR_YACC_PARSER.no_action */
extern unsigned char ge158os4256;
extern T0* ge158ov4256;
extern T0* T50f265(T0* C);
/* PR_ACTION_FACTORY.new_action */
extern T0* T125f1(T0* C, T0* a1);
/* PR_ACTION.make */
extern T0* T184c6(T0* a1);
/* PR_YACC_PARSER.new_action */
extern T0* T50f188(T0* C, T0* a1);
/* PR_YACC_PARSER.new_string_token */
extern T0* T50f187(T0* C, T0* a1);
/* PR_TOKEN.set_literal_string */
extern void T84f22(T0* C, T0* a1);
/* PR_YACC_PARSER.report_undefined_string_token_error */
extern void T50f375(T0* C, T0* a1);
/* PR_UNDEFINED_STRING_TOKEN_ERROR.make */
extern T0* T189c8(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.new_char_token */
extern T0* T50f186(T0* C, T0* a1);
/* PR_TOKEN.set_token_id */
extern void T84f21(T0* C, T6 a1);
/* PR_YACC_PARSER.put_symbol */
extern void T50f335(T0* C, T0* a1, T0* a2);
/* PR_YACC_PARSER.new_symbol */
extern T0* T50f185(T0* C, T0* a1);
/* PR_GRAMMAR.put_variable */
extern void T29f32(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].resize */
extern void T91f35(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_VARIABLE].resize */
extern T0* T225f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_VARIABLE].aliased_resized_area_with_default */
extern T0* T224f4(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_VARIABLE].aliased_resized_area */
extern T0* T224f5(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].is_full */
extern T1 T91f14(T0* C);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].force_new */
extern void T127f40(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].key_storage_put */
extern void T127f48(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].item_storage_put */
extern void T127f44(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].slots_put */
extern void T127f47(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].clashes_put */
extern void T127f46(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].slots_item */
extern T6 T127f34(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].hash_position */
extern T6 T127f24(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].clashes_item */
extern T6 T127f33(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].resize */
extern void T127f45(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].clashes_resize */
extern void T127f53(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].special_integer_ */
extern T0* T127f31(T0* C);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].key_storage_resize */
extern void T127f52(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].item_storage_resize */
extern void T127f51(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].key_storage_item */
extern T0* T127f22(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].slots_resize */
extern void T127f50(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].new_modulus */
extern T6 T127f25(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].new_capacity */
extern T6 T127f23(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].unset_found_item */
extern void T127f43(T0* C);
/* PR_VARIABLE.make */
extern T0* T73c15(T6 a1, T0* a2, T0* a3);
/* DS_LINKED_LIST [PR_VARIABLE].make */
extern T0* T93c8(void);
/* DS_LINKED_LIST [PR_VARIABLE].set_internal_cursor */
extern void T93f9(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_RULE].make */
extern T0* T94c10(void);
/* DS_LINKED_LIST [PR_RULE].set_internal_cursor */
extern void T94f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].make */
extern T0* T71c21(T6 a1);
/* KL_SPECIAL_ROUTINES [PR_RULE].make */
extern T0* T207f1(T0* C, T6 a1);
/* SPECIAL [PR_RULE].make_filled */
extern T0* T206c6(T0* a1, T6 a2);
/* SPECIAL [PR_RULE].fill_with */
extern void T206f10(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [PR_RULE].make */
extern void T206f9(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_RULE].default_create */
extern T0* T207c3(void);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].item */
extern T0* T126f30(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].has */
extern T1 T126f22(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].found_item */
extern T0* T127f28(T0* C);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].item_storage_item */
extern T0* T127f27(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].found */
extern T1 T127f35(T0* C);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].search */
extern void T127f39(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].search_position */
extern void T127f41(T0* C, T0* a1);
/* PR_YACC_PARSER.put_error_action */
extern void T50f334(T0* C, T0* a1, T6 a2, T0* a3);
/* PR_RULE.set_error_action */
extern void T72f22(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [PR_ERROR_ACTION].replace */
extern void T149f10(T0* C, T0* a1, T6 a2);
/* PR_YACC_PARSER.new_error_action */
extern T0* T50f184(T0* C, T0* a1, T6 a2);
/* PR_ERROR_ACTION.make */
extern T0* T70c6(T0* a1, T6 a2);
/* PR_YACC_PARSER.report_invalid_error_n_error */
extern void T50f333(T0* C, T6 a1);
/* PR_INVALID_ERROR_N_ERROR.make */
extern T0* T156c8(T0* a1, T6 a2, T6 a3);
/* PR_RULE.set_line_nb */
extern void T72f21(T0* C, T6 a1);
/* PR_YACC_PARSER.put_rule */
extern void T50f332(T0* C, T0* a1);
/* PR_GRAMMAR.put_rule */
extern void T29f27(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].put_last */
extern void T71f24(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].resize */
extern void T71f23(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_RULE].resize */
extern T0* T207f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_RULE].aliased_resized_area_with_default */
extern T0* T206f4(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_RULE].aliased_resized_area */
extern T0* T206f5(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_RULE].is_full */
extern T1 T71f16(T0* C);
/* PR_YACC_PARSER.report_rule_declared_twice_warning */
extern void T50f331(T0* C, T0* a1);
/* PR_RULE_DECLARED_TWICE_ERROR.make */
extern T0* T155c8(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.new_variable */
extern T0* T50f183(T0* C, T0* a1);
/* PR_YACC_PARSER.new_rule */
extern T0* T50f182(T0* C, T0* a1);
/* PR_VARIABLE.put_rule */
extern void T73f17(T0* C, T0* a1);
/* PR_RULE.make */
extern T0* T72c16(T6 a1, T0* a2, T0* a3);
/* DS_ARRAYED_LIST [PR_ERROR_ACTION].make */
extern T0* T149c9(T6 a1);
/* DS_ARRAYED_LIST [PR_ERROR_ACTION].set_internal_cursor */
extern void T149f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_ERROR_ACTION].new_cursor */
extern T0* T149f6(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_ERROR_ACTION].make */
extern T0* T260c3(T0* a1);
/* KL_SPECIAL_ROUTINES [PR_ERROR_ACTION].make */
extern T0* T258f1(T0* C, T6 a1);
/* SPECIAL [PR_ERROR_ACTION].make_filled */
extern T0* T259c5(T0* a1, T6 a2);
/* SPECIAL [PR_ERROR_ACTION].fill_with */
extern void T259f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [PR_ERROR_ACTION].make */
extern void T259f7(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_ERROR_ACTION].default_create */
extern T0* T258c3(void);
/* DS_ARRAYED_LIST [PR_SYMBOL].make */
extern T0* T80c13(T6 a1);
/* DS_ARRAYED_LIST [PR_SYMBOL].set_internal_cursor */
extern void T80f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_SYMBOL].new_cursor */
extern T0* T80f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_SYMBOL].make */
extern T0* T220c3(T0* a1);
/* KL_SPECIAL_ROUTINES [PR_SYMBOL].make */
extern T0* T219f1(T0* C, T6 a1);
/* SPECIAL [PR_SYMBOL].make_filled */
extern T0* T218c5(T0* a1, T6 a2);
/* SPECIAL [PR_SYMBOL].fill_with */
extern void T218f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [PR_SYMBOL].make */
extern void T218f7(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_SYMBOL].default_create */
extern T0* T219c3(void);
/* PR_YACC_PARSER.new_dummy_variable */
extern T0* T50f181(T0* C);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].force */
extern void T127f38(T0* C, T0* a1, T0* a2);
/* PR_YACC_PARSER.integer_ */
extern T0* T50f278(T0* C);
/* PR_YACC_PARSER.report_lhs_symbol_token_error */
extern void T50f330(T0* C, T0* a1);
/* PR_LHS_SYMBOL_TOKEN_ERROR.make */
extern T0* T154c8(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.is_terminal */
extern T1 T50f180(T0* C, T0* a1);
/* PR_YACC_PARSER.process_rule */
extern void T50f329(T0* C, T0* a1);
/* PR_RULE.set_precedence */
extern void T72f20(T0* C, T6 a1);
/* PR_RULE.set_non_associative */
extern void T72f19(T0* C);
/* PR_RULE.set_right_associative */
extern void T72f18(T0* C);
/* PR_RULE.set_left_associative */
extern void T72f17(T0* C);
/* PR_YACC_PARSER.report_no_rules_error */
extern void T50f328(T0* C);
/* PR_NO_RULES_ERROR.make */
extern T0* T153c8(T0* a1);
/* PR_YACC_PARSER.new_nonterminal */
extern T0* T50f177(T0* C, T0* a1, T0* a2);
/* PR_YACC_PARSER.report_variable_declared_twice_error */
extern void T50f374(T0* C, T0* a1);
/* PR_VARIABLE_DECLARED_TWICE_ERROR.make */
extern T0* T188c8(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.is_nonterminal */
extern T1 T50f263(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].has */
extern T1 T127f29(T0* C, T0* a1);
/* PR_YACC_PARSER.report_variable_declared_as_token_error */
extern void T50f373(T0* C, T0* a1);
/* PR_SYMBOL_DECLARED_TOKEN_ERROR.make */
extern T0* T187c8(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.new_nonassoc_char_terminal */
extern T0* T50f176(T0* C, T0* a1, T6 a2);
/* PR_YACC_PARSER.set_precedence */
extern void T50f372(T0* C, T0* a1, T6 a2);
/* PR_TOKEN.set_precedence */
extern void T84f29(T0* C, T6 a1);
/* PR_YACC_PARSER.report_precedence_defined_twice_error */
extern void T50f381(T0* C, T0* a1);
/* PR_PRECEDENCE_DEFINED_TWICE_ERROR.make */
extern T0* T190c8(T0* a1, T6 a2, T0* a3);
/* PR_TOKEN.set_non_associative */
extern void T84f27(T0* C);
/* PR_YACC_PARSER.new_nonassoc_terminal */
extern T0* T50f175(T0* C, T0* a1, T6 a2);
/* PR_YACC_PARSER.report_token_declared_as_variable_error */
extern void T50f370(T0* C, T0* a1);
/* PR_SYMBOL_DECLARED_VARIABLE_ERROR.make */
extern T0* T185c8(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.new_right_char_terminal */
extern T0* T50f174(T0* C, T0* a1, T6 a2);
/* PR_TOKEN.set_right_associative */
extern void T84f26(T0* C);
/* PR_YACC_PARSER.new_right_terminal */
extern T0* T50f173(T0* C, T0* a1, T6 a2);
/* PR_YACC_PARSER.new_left_char_terminal */
extern T0* T50f172(T0* C, T0* a1, T6 a2);
/* PR_TOKEN.set_left_associative */
extern void T84f25(T0* C);
/* PR_YACC_PARSER.new_left_terminal */
extern T0* T50f171(T0* C, T0* a1, T6 a2);
/* PR_YACC_PARSER.new_char_terminal */
extern T0* T50f170(T0* C, T0* a1, T0* a2);
/* PR_TOKEN.set_type */
extern void T84f24(T0* C, T0* a1);
/* PR_TOKEN.set_declared */
extern void T84f23(T0* C);
/* PR_YACC_PARSER.report_token_declared_twice_error */
extern void T50f371(T0* C, T0* a1);
/* PR_TOKEN_DECLARED_TWICE_ERROR.make */
extern T0* T186c8(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.set_literal_string */
extern void T50f327(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].force */
extern void T126f39(T0* C, T0* a1, T0* a2);
/* PR_YACC_PARSER.report_string_token_defined_twice_error */
extern void T50f361(T0* C, T0* a1, T0* a2, T0* a3);
/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR.make */
extern T0* T174c8(T0* a1, T6 a2, T0* a3, T0* a4, T0* a5);
/* PR_YACC_PARSER.report_two_strings_token_error */
extern void T50f360(T0* C, T0* a1, T0* a2, T0* a3);
/* PR_TWO_STRINGS_TOKEN_ERROR.make */
extern T0* T173c8(T0* a1, T6 a2, T0* a3, T0* a4, T0* a5);
/* PR_YACC_PARSER.set_token_id */
extern void T50f326(T0* C, T0* a1, T6 a2);
/* PR_YACC_PARSER.report_two_token_ids_token_error */
extern void T50f359(T0* C, T0* a1, T6 a2, T6 a3);
/* PR_TWO_TOKEN_IDS_TOKEN_ERROR.make */
extern T0* T172c8(T0* a1, T6 a2, T0* a3, T6 a4, T6 a5);
/* PR_TOKEN.has_token_id */
extern T1 T84f14(T0* C);
/* PR_YACC_PARSER.new_terminal */
extern T0* T50f166(T0* C, T0* a1, T0* a2);
/* KL_SPECIAL_ROUTINES [PR_LABELED_TYPE].resize */
extern T0* T146f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_LABELED_TYPE].aliased_resized_area_with_default */
extern T0* T144f4(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_LABELED_TYPE].aliased_resized_area */
extern T0* T144f5(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_LABELED_TYPE].make */
extern T0* T146f1(T0* C, T6 a1);
/* SPECIAL [PR_LABELED_TYPE].make_filled */
extern T0* T144c6(T0* a1, T6 a2);
/* SPECIAL [PR_LABELED_TYPE].fill_with */
extern void T144f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [PR_LABELED_TYPE].make */
extern void T144f9(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_LABELED_TYPE].default_create */
extern T0* T146c3(void);
/* PR_YACC_PARSER.new_labeled_type */
extern T0* T50f163(T0* C, T0* a1, T0* a2);
/* PR_LABELED_TYPE.make */
extern T0* T137c3(T0* a1, T0* a2);
/* DS_ARRAYED_LIST [STRING_8].put_first */
extern void T111f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].put */
extern void T111f15(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [STRING_8].move_cursors_right */
extern void T111f18(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].set_position */
extern void T244f5(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].move_right */
extern void T111f17(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [STRING_8].put_last */
extern void T111f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].make */
extern T0* T111c10(T6 a1);
/* DS_ARRAYED_LIST [STRING_8].set_internal_cursor */
extern void T111f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].new_cursor */
extern T0* T111f6(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].make */
extern T0* T244c4(T0* a1);
/* DS_ARRAYED_LIST [STRING_8].force_first */
extern void T111f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].resize */
extern void T111f14(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].new_capacity */
extern T6 T111f8(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].extendible */
extern T1 T111f7(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_LABELED_TYPE].first */
extern T0* T136f7(T0* C);
/* DS_ARRAYED_LIST [PR_LABELED_TYPE].force_first */
extern void T136f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_LABELED_TYPE].put */
extern void T136f17(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [PR_LABELED_TYPE].move_cursors_right */
extern void T136f20(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [PR_LABELED_TYPE].set_position */
extern void T257f5(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_LABELED_TYPE].move_right */
extern void T136f19(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [PR_LABELED_TYPE].put_last */
extern void T136f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_LABELED_TYPE].resize */
extern void T136f16(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_LABELED_TYPE].new_capacity */
extern T6 T136f8(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_LABELED_TYPE].extendible */
extern T1 T136f6(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_LABELED_TYPE]].resize */
extern T0* T145f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_ARRAYED_LIST [PR_LABELED_TYPE]].aliased_resized_area_with_default */
extern T0* T142f4(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_ARRAYED_LIST [PR_LABELED_TYPE]].aliased_resized_area */
extern T0* T142f5(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_LABELED_TYPE]].make */
extern T0* T145f1(T0* C, T6 a1);
/* SPECIAL [DS_ARRAYED_LIST [PR_LABELED_TYPE]].make_filled */
extern T0* T142c6(T0* a1, T6 a2);
/* SPECIAL [DS_ARRAYED_LIST [PR_LABELED_TYPE]].fill_with */
extern void T142f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_ARRAYED_LIST [PR_LABELED_TYPE]].make */
extern void T142f9(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_LABELED_TYPE]].default_create */
extern T0* T145c3(void);
/* DS_ARRAYED_LIST [PR_LABELED_TYPE].force_last */
extern void T136f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_LABELED_TYPE].make */
extern T0* T136c12(T6 a1);
/* DS_ARRAYED_LIST [PR_LABELED_TYPE].set_internal_cursor */
extern void T136f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_LABELED_TYPE].new_cursor */
extern T0* T136f9(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_LABELED_TYPE].make */
extern T0* T257c4(T0* a1);
/* DS_ARRAYED_LIST [PR_TYPE].force_first */
extern void T112f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TYPE].put */
extern void T112f18(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [PR_TYPE].move_cursors_right */
extern void T112f21(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [PR_TYPE].set_position */
extern void T245f5(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_TYPE].move_right */
extern void T112f20(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [PR_TYPE].put_last */
extern void T112f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TYPE].resize */
extern void T112f17(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_TYPE].new_capacity */
extern T6 T112f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_TYPE].extendible */
extern T1 T112f9(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_TYPE]].resize */
extern T0* T143f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_ARRAYED_LIST [PR_TYPE]].aliased_resized_area_with_default */
extern T0* T141f4(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_ARRAYED_LIST [PR_TYPE]].aliased_resized_area */
extern T0* T141f5(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_TYPE]].make */
extern T0* T143f1(T0* C, T6 a1);
/* SPECIAL [DS_ARRAYED_LIST [PR_TYPE]].make_filled */
extern T0* T141c6(T0* a1, T6 a2);
/* SPECIAL [DS_ARRAYED_LIST [PR_TYPE]].fill_with */
extern void T141f8(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_ARRAYED_LIST [PR_TYPE]].make */
extern void T141f9(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_TYPE]].default_create */
extern T0* T143c3(void);
/* DS_ARRAYED_LIST [PR_TYPE].force_last */
extern void T112f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TYPE].make */
extern T0* T112c13(T6 a1);
/* DS_ARRAYED_LIST [PR_TYPE].set_internal_cursor */
extern void T112f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TYPE].new_cursor */
extern T0* T112f8(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_TYPE].make */
extern T0* T245c4(T0* a1);
/* KL_SPECIAL_ROUTINES [STRING_8].resize */
extern T0* T135f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].aliased_resized_area_with_default */
extern T0* T122f4(T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].aliased_resized_area */
extern T0* T122f5(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].make */
extern T0* T135f1(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].default_create */
extern T0* T135c3(void);
/* PR_YACC_PARSER.new_like_current_type */
extern T0* T50f157(T0* C, T0* a1);
/* PR_GRAMMAR.put_type */
extern void T29f31(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TYPE].is_full */
extern T1 T112f12(T0* C);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].force_new */
extern void T128f39(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].key_storage_put */
extern void T128f47(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].item_storage_put */
extern void T128f46(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].slots_put */
extern void T128f45(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].clashes_put */
extern void T128f44(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].slots_item */
extern T6 T128f26(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].hash_position */
extern T6 T128f21(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].clashes_item */
extern T6 T128f32(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].resize */
extern void T128f43(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].clashes_resize */
extern void T128f52(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].special_integer_ */
extern T0* T128f30(T0* C);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].key_storage_resize */
extern void T128f51(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].item_storage_resize */
extern void T128f50(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].key_storage_item */
extern T0* T128f23(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].slots_resize */
extern void T128f49(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].new_modulus */
extern T6 T128f24(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].new_capacity */
extern T6 T128f34(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].unset_found_item */
extern void T128f42(T0* C);
/* PR_TYPE.make_like_current */
extern T0* T99c14(T6 a1, T0* a2);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].found_item */
extern T0* T128f33(T0* C);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].item_storage_item */
extern T0* T128f28(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].found */
extern T1 T128f22(T0* C);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].search */
extern void T128f37(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].search_position */
extern void T128f41(T0* C, T0* a1);
/* PR_YACC_PARSER.new_anchored_type */
extern T0* T50f156(T0* C, T0* a1, T0* a2);
/* PR_TYPE.make_anchored */
extern T0* T99c13(T6 a1, T0* a2, T0* a3);
/* PR_YACC_PARSER.new_labeled_tuple_type */
extern T0* T50f155(T0* C, T0* a1, T0* a2, T0* a3);
/* STRING_8.as_upper */
extern T0* T17f6(T0* C);
/* STRING_8.to_upper */
extern void T17f37(T0* C);
/* STRING_8.to_upper_area */
extern void T17f42(T0* C, T0* a1, T6 a2, T6 a3);
/* CHARACTER_8.upper */
extern T2 T2f2(T2* C);
/* CHARACTER_8.is_lower */
extern T1 T2f4(T2* C);
/* PR_TYPE.make_labeled_tuple */
extern T0* T99c12(T6 a1, T0* a2, T0* a3, T0* a4);
/* DS_ARRAYED_LIST [PR_LABELED_TYPE].item */
extern T0* T136f11(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_LABELED_TYPE].is_empty */
extern T1 T136f10(T0* C);
/* PR_YACC_PARSER.new_generic_type */
extern T0* T50f153(T0* C, T0* a1, T0* a2, T0* a3);
/* PR_TYPE.make_generic */
extern T0* T99c11(T6 a1, T0* a2, T0* a3, T0* a4);
/* PR_YACC_PARSER.new_basic_type */
extern T0* T50f151(T0* C, T0* a1, T0* a2);
/* PR_BASIC_TYPE.make */
extern T0* T183c9(T6 a1, T0* a2, T0* a3);
/* KL_SPECIAL_ROUTINES [PR_TYPE].resize */
extern T0* T140f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_TYPE].aliased_resized_area_with_default */
extern T0* T139f4(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_TYPE].aliased_resized_area */
extern T0* T139f5(T0* C, T6 a1);
/* PR_YACC_PARSER.new_type */
extern T0* T50f148(T0* C, T0* a1, T0* a2);
/* PR_YACC_PARSER.set_alias_name */
extern void T50f325(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].force_last_new */
extern void T128f38(T0* C, T0* a1, T0* a2);
/* PR_YACC_PARSER.report_last_value_name_used_twice_error */
extern void T50f356(T0* C, T0* a1, T0* a2, T0* a3);
/* PR_LAST_VALUE_NAME_USED_TWICE_ERROR.make */
extern T0* T169c8(T0* a1, T6 a2, T0* a3, T0* a4, T0* a5);
/* PR_BASIC_TYPE.set_alias_name */
extern void T183f10(T0* C, T0* a1);
/* PR_TYPE.set_alias_name */
extern void T99f10(T0* C, T0* a1);
/* PR_YACC_PARSER.report_alias_name_defined_twice_error */
extern void T50f358(T0* C, T0* a1, T0* a2, T0* a3);
/* PR_ALIAS_NAME_DEFINED_TWICE_ERROR.make */
extern T0* T171c8(T0* a1, T6 a2, T0* a3, T0* a4, T0* a5);
/* PR_YACC_PARSER.report_alias_name_not_defined_error */
extern void T50f357(T0* C, T0* a1, T0* a2);
/* PR_ALIAS_NAME_NOT_DEFINED_ERROR.make */
extern T0* T170c8(T0* a1, T6 a2, T0* a3, T0* a4);
/* KL_STRING_ROUTINES.same_case_insensitive */
extern T1 T118f3(T0* C, T0* a1, T0* a2);
/* UC_UNICODE_ROUTINES.lower_code */
extern T6 T247f1(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.lower_codes */
extern unsigned char ge340os7059;
extern T0* ge340ov7059;
extern T0* T247f2(T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_plane */
extern unsigned char ge340os7058;
extern T0* ge340ov7058;
extern T0* T247f5(T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_segment */
extern unsigned char ge340os7045;
extern T0* ge340ov7045;
extern T0* T247f12(T0* C);
/* KL_INTEGER_ROUTINES.to_integer */
extern T6 T67f1(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.integer_ */
extern T0* T247f23(T0* C);
/* SPECIAL [ARRAY [INTEGER_32]].make_filled */
extern T0* T285c3(T0* a1, T6 a2);
/* SPECIAL [ARRAY [INTEGER_32]].fill_with */
extern void T285f6(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ARRAY [INTEGER_32]].make */
extern void T285f5(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.lower_code_plane_1 */
extern unsigned char ge340os7057;
extern T0* ge340ov7057;
extern T0* T247f4(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_1_segment_4 */
extern unsigned char ge340os7056;
extern T0* ge340ov7056;
extern T0* T247f22(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0 */
extern unsigned char ge340os7055;
extern T0* ge340ov7055;
extern T0* T247f3(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_255 */
extern unsigned char ge340os7054;
extern T0* ge340ov7054;
extern T0* T247f21(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_167 */
extern unsigned char ge340os7053;
extern T0* ge340ov7053;
extern T0* T247f20(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_166 */
extern unsigned char ge340os7052;
extern T0* ge340ov7052;
extern T0* T247f19(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_44 */
extern unsigned char ge340os7051;
extern T0* ge340ov7051;
extern T0* T247f18(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_36 */
extern unsigned char ge340os7050;
extern T0* ge340ov7050;
extern T0* T247f17(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_33 */
extern unsigned char ge340os7049;
extern T0* ge340ov7049;
extern T0* T247f16(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_31 */
extern unsigned char ge340os7048;
extern T0* ge340ov7048;
extern T0* T247f15(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_30 */
extern unsigned char ge340os7047;
extern T0* ge340ov7047;
extern T0* T247f14(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_16 */
extern unsigned char ge340os7046;
extern T0* ge340ov7046;
extern T0* T247f13(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_5 */
extern unsigned char ge340os7044;
extern T0* ge340ov7044;
extern T0* T247f11(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_4 */
extern unsigned char ge340os7043;
extern T0* ge340ov7043;
extern T0* T247f10(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_3 */
extern unsigned char ge340os7042;
extern T0* ge340ov7042;
extern T0* T247f9(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_2 */
extern unsigned char ge340os7041;
extern T0* ge340ov7041;
extern T0* T247f8(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_1 */
extern unsigned char ge340os7040;
extern T0* ge340ov7040;
extern T0* T247f7(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_0 */
extern unsigned char ge340os7039;
extern T0* ge340ov7039;
extern T0* T247f6(T0* C);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].make_filled */
extern T0* T286c3(T0* a1, T6 a2);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].fill_with */
extern void T286f6(T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].make */
extern void T286f5(T0* C, T6 a1);
/* KL_STRING_ROUTINES.unicode */
extern unsigned char ge313os6227;
extern T0* ge313ov6227;
extern T0* T118f10(T0* C);
/* UC_UNICODE_ROUTINES.default_create */
extern T0* T247c24(void);
/* PR_YACC_PARSER.string_ */
extern T0* T50f264(T0* C);
/* PR_YACC_PARSER.set_no_alias_name */
extern void T50f324(T0* C, T0* a1);
/* PR_YACC_PARSER.report_alias_name_undefined_error */
extern void T50f355(T0* C, T0* a1, T0* a2);
/* PR_ALIAS_NAME_UNDEFINED_ERROR.make */
extern T0* T168c8(T0* a1, T6 a2, T0* a3, T0* a4);
/* PR_YACC_PARSER.no_type */
extern T0* T50f146(T0* C);
/* PR_GRAMMAR.set_expected_conflicts */
extern void T29f24(T0* C, T6 a1);
/* DS_PAIR [STRING_8, INTEGER_32].make */
extern T0* T138c3(T0* a1, T6 a2);
/* PR_YACC_PARSER.report_multiple_start_declarations_error */
extern void T50f323(T0* C);
/* PR_MULTIPLE_START_DECLARATIONS_ERROR.make */
extern T0* T152c8(T0* a1, T6 a2);
/* DS_ARRAYED_LIST [STRING_8].force_last */
extern void T111f11(T0* C, T0* a1);
/* PR_YACC_PARSER.initialize_grammar */
extern void T50f322(T0* C);
/* PR_YACC_PARSER.process_symbols */
extern void T50f321(T0* C);
/* PR_YACC_PARSER.report_undefined_symbol_error */
extern void T50f354(T0* C, T0* a1);
/* PR_UNDEFINED_SYMBOL_ERROR.make */
extern T0* T167c8(T0* a1, T0* a2);
/* ARRAY [detachable PR_TOKEN].put */
extern void T151f6(T0* C, T0* a1, T6 a2);
/* PR_YACC_PARSER.report_token_id_used_twice_warning */
extern void T50f353(T0* C, T0* a1, T0* a2);
/* PR_TOKEN_ID_USED_TWICE_ERROR.make */
extern T0* T166c8(T0* a1, T0* a2, T0* a3, T6 a4);
/* ARRAY [detachable PR_TOKEN].item */
extern T0* T151f4(T0* C, T6 a1);
/* ARRAY [detachable PR_TOKEN].make_filled */
extern T0* T151c5(T0* a1, T6 a2, T6 a3);
/* ARRAY [detachable PR_TOKEN].make_filled_area */
extern void T151f7(T0* C, T0* a1, T6 a2);
/* PR_YACC_PARSER.set_start_symbol */
extern void T50f320(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].first */
extern T0* T71f10(T0* C);
/* PR_GRAMMAR.set_start_symbol */
extern void T29f26(T0* C, T0* a1);
/* PR_YACC_PARSER.report_unknown_start_symbol_error */
extern void T50f352(T0* C);
/* PR_UNKNOWN_START_SYMBOL_ERROR.make */
extern T0* T165c8(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.report_start_symbol_token_error */
extern void T50f351(T0* C);
/* PR_START_SYMBOL_TOKEN_ERROR.make */
extern T0* T164c8(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.yy_push_last_value */
extern void T50f307(T0* C, T6 a1);
/* PR_YACC_PARSER.accept */
extern void T50f306(T0* C);
/* PR_YACC_PARSER.yy_do_error_action */
extern void T50f304(T0* C, T6 a1);
/* PR_YACC_PARSER.report_error */
extern void T50f319(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.make */
extern T0* T150c8(T0* a1, T6 a2);
/* PR_YACC_PARSER.report_eof_expected_error */
extern void T50f318(T0* C);
/* PR_YACC_PARSER.read_token */
extern void T50f303(T0* C);
/* PR_YACC_PARSER.yy_execute_action */
extern void T50f317(T0* C, T6 a1);
/* PR_YACC_PARSER.text_item */
extern T2 T50f261(T0* C, T6 a1);
/* STRING_8.wipe_out */
extern void T17f33(T0* C);
/* PR_YACC_PARSER.cloned_string */
extern T0* T50f196(T0* C, T0* a1);
/* PR_YACC_PARSER.report_integer_too_large_error */
extern void T50f350(T0* C, T0* a1);
/* PR_INTEGER_TOO_LARGE_ERROR.make */
extern T0* T163c8(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.process_dollar_n */
extern void T50f349(T0* C, T6 a1, T6 a2, T0* a3);
/* PR_BASIC_TYPE.append_dollar_n_to_string */
extern void T183f25(T0* C, T6 a1, T6 a2, T0* a3, T0* a4);
/* PR_BASIC_TYPE.integer_ */
extern T0* T183f8(T0* C);
/* PR_TYPE.append_dollar_n_to_string */
extern void T99f29(T0* C, T6 a1, T6 a2, T0* a3, T0* a4);
/* PR_TYPE.integer_ */
extern T0* T99f6(T0* C);
/* PR_BASIC_TYPE.old_append_dollar_n_to_string */
extern void T183f24(T0* C, T6 a1, T6 a2, T0* a3, T0* a4);
/* PR_TYPE.old_append_dollar_n_to_string */
extern void T99f28(T0* C, T6 a1, T6 a2, T0* a3, T0* a4);
/* PR_YACC_PARSER.report_invalid_dollar_n_error */
extern void T50f364(T0* C, T6 a1);
/* PR_INVALID_DOLLAR_N_ERROR.make */
extern T0* T176c8(T0* a1, T6 a2, T6 a3);
/* PR_YACC_PARSER.report_dangerous_dollar_n_warning */
extern void T50f363(T0* C, T6 a1);
/* PR_DANGEROUS_DOLLAR_N_ERROR.make */
extern T0* T175c8(T0* a1, T6 a2, T6 a3);
/* STRING_8.is_integer */
extern T1 T17f15(T0* C);
/* STRING_8.is_valid_integer_or_natural */
extern T1 T17f23(T0* C, T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.is_integral_integer */
extern T1 T263f12(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
extern void T263f17(T0* C, T0* a1, T6 a2);
/* STRING_TO_INTEGER_CONVERTOR.parse_character */
extern void T263f23(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflowed */
extern T1 T263f15(T0* C);
/* INTEGER_OVERFLOW_CHECKER.will_overflow */
extern T1 T297f7(T0* C, T11 a1, T11 a2, T6 a3, T6 a4);
/* NATURAL_64.is_greater */
extern T1 T11f4(T11* C, T11 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
extern unsigned char ge571os7216;
extern T0* ge571ov7216;
extern T0* T263f14(T0* C);
/* INTEGER_OVERFLOW_CHECKER.make */
extern T0* T297c13(void);
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
extern T0* T304c3(T6 a1);
/* STRING_8.has */
extern T1 T17f29(T0* C, T2 a1);
/* INTEGER_32.to_natural_64 */
extern T11 T6f24(T6* C);
/* CHARACTER_8.is_digit */
extern T1 T2f17(T2* C);
/* STRING_TO_INTEGER_CONVERTOR.reset */
extern void T263f18(T0* C, T6 a1);
/* STRING_8.ctoi_convertor */
extern unsigned char ge555os1245;
extern T0* ge555ov1245;
extern T0* T17f24(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
extern void T263f22(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
extern void T263f21(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
extern void T263f20(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
extern void T263f19(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.make */
extern T0* T263c16(void);
/* PR_YACC_PARSER.process_dollar_dollar */
extern void T50f348(T0* C, T0* a1);
/* PR_BASIC_TYPE.append_dollar_dollar_to_string */
extern void T183f12(T0* C, T0* a1);
/* PR_TYPE.append_dollar_dollar_to_string */
extern void T99f16(T0* C, T0* a1);
/* PR_BASIC_TYPE.old_append_dollar_dollar_to_string */
extern void T183f11(T0* C, T0* a1);
/* PR_TYPE.old_append_dollar_dollar_to_string */
extern void T99f15(T0* C, T0* a1);
/* PR_YACC_PARSER.report_invalid_dollar_dollar_error */
extern void T50f347(T0* C);
/* PR_INVALID_DOLLAR_DOLLAR_ERROR.make */
extern T0* T162c8(T0* a1, T6 a2);
/* PR_YACC_PARSER.start_condition */
extern T6 T50f259(T0* C);
/* PR_YACC_PARSER.text_substring */
extern T0* T50f193(T0* C, T6 a1, T6 a2);
/* KL_CHARACTER_BUFFER.substring */
extern T0* T275f6(T0* C, T6 a1, T6 a2);
/* PR_YACC_PARSER.more */
extern void T50f346(T0* C);
/* PR_YACC_PARSER.report_invalid_string_token_error */
extern void T50f345(T0* C, T0* a1);
/* PR_INVALID_STRING_TOKEN_ERROR.make */
extern T0* T161c8(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.text_count */
extern T6 T50f192(T0* C);
/* PR_YACC_PARSER.report_null_integer_error */
extern void T50f344(T0* C);
/* PR_NULL_INTEGER_ERROR.make */
extern T0* T160c8(T0* a1, T6 a2);
/* STRING_8.to_integer */
extern T6 T17f16(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
extern T6 T263f13(T0* C);
/* PR_YACC_PARSER.text */
extern T0* T50f214(T0* C);
/* PR_YACC_PARSER.set_start_condition */
extern void T50f342(T0* C, T6 a1);
/* PR_YACC_PARSER.yy_execute_eof_action */
extern void T50f316(T0* C, T6 a1);
/* PR_YACC_PARSER.terminate */
extern void T50f343(T0* C);
/* PR_YACC_PARSER.report_missing_characters_error */
extern void T50f341(T0* C, T0* a1);
/* PR_MISSING_CHARACTERS_ERROR.make */
extern T0* T159c8(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.wrap */
extern T1 T50f126(T0* C);
/* PR_YACC_PARSER.yy_refill_input_buffer */
extern void T50f315(T0* C);
/* PR_YACC_PARSER.yy_set_content */
extern void T50f313(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.count */
extern T6 T275f4(T0* C);
/* YY_FILE_BUFFER.fill */
extern void T129f19(T0* C);
/* KL_CHARACTER_BUFFER.fill_from_stream */
extern T6 T275f5(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STDIN_FILE.read_to_string */
extern T6 T54f14(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STDIN_FILE.old_read_to_string */
extern T6 T54f17(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STDIN_FILE.file_gss */
extern T6 T54f18(T0* C, T14 a1, T14 a2, T6 a3);
/* SPECIAL [CHARACTER_8].item_address */
extern T14 T15f6(T0* C, T6 a1);
/* KL_STDIN_FILE.any_ */
extern T0* T54f15(T0* C);
/* KL_STDIN_FILE.old_end_of_file */
extern T1 T54f11(T0* C);
/* KL_STDIN_FILE.console_eof */
extern T1 T54f13(T0* C, T14 a1);
/* STRING_8.put */
extern void T17f47(T0* C, T2 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.read_to_string */
extern T6 T51f30(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
extern unsigned char ge254os4938;
extern T0* ge254ov4938;
extern T0* T51f34(T0* C);
/* KL_CHARACTER_BUFFER.make */
extern T0* T275c7(T6 a1);
/* STRING_8.set_internal_hash_code */
extern void T17f48(T0* C, T6 a1);
/* KL_TEXT_INPUT_FILE.old_read_to_string */
extern T6 T51f33(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.file_gss */
extern T6 T51f35(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.any_ */
extern T0* T51f31(T0* C);
/* KL_TEXT_INPUT_FILE.old_end_of_file */
extern T1 T51f27(T0* C);
/* KL_TEXT_INPUT_FILE.file_feof */
extern T1 T51f29(T0* C, T14 a1);
/* KL_CHARACTER_BUFFER.put */
extern void T275f8(T0* C, T2 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.end_of_input */
extern T1 T51f25(T0* C);
/* KL_STDIN_FILE.read_character */
extern void T54f24(T0* C);
/* KL_STDIN_FILE.old_read_character */
extern void T54f25(T0* C);
/* KL_STDIN_FILE.console_readchar */
extern T2 T54f12(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.read_character */
extern void T51f45(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_character */
extern void T51f46(T0* C);
/* KL_TEXT_INPUT_FILE.file_gc */
extern T2 T51f28(T0* C, T14 a1);
/* YY_FILE_BUFFER.compact_left */
extern void T129f21(T0* C);
/* KL_CHARACTER_BUFFER.move_left */
extern void T275f9(T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.subcopy */
extern void T17f46(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* YY_FILE_BUFFER.resize */
extern void T129f23(T0* C);
/* KL_CHARACTER_BUFFER.resize */
extern void T275f10(T0* C, T6 a1);
/* YY_FILE_BUFFER.default_capacity */
extern unsigned char ge83os6618;
extern T6 ge83ov6618;
extern T6 T129f13(T0* C);
/* YY_BUFFER.fill */
extern void T130f15(T0* C);
/* YY_FILE_BUFFER.set_index */
extern void T129f17(T0* C, T6 a1);
/* YY_BUFFER.set_index */
extern void T130f13(T0* C, T6 a1);
/* PR_YACC_PARSER.yy_null_trans_state */
extern T6 T50f125(T0* C, T6 a1);
/* PR_YACC_PARSER.yy_previous_state */
extern T6 T50f124(T0* C);
/* PR_YACC_PARSER.fatal_error */
extern void T50f314(T0* C, T0* a1);
/* KL_STDERR_FILE.put_character */
extern void T124f14(T0* C, T2 a1);
/* KL_STDERR_FILE.old_put_character */
extern void T124f18(T0* C, T2 a1);
/* KL_STDERR_FILE.console_pc */
extern void T124f22(T0* C, T14 a1, T2 a2);
/* KL_STANDARD_FILES.error */
extern unsigned char ge265os2971;
extern T0* ge265ov2971;
extern T0* T35f3(T0* C);
/* KL_STDERR_FILE.make */
extern T0* T124c10(void);
/* KL_STDERR_FILE.make_open_stderr */
extern void T124f15(T0* C, T0* a1);
/* KL_STDERR_FILE.set_write_mode */
extern void T124f20(T0* C);
/* KL_STDERR_FILE.console_def */
extern T14 T124f6(T0* C, T6 a1);
/* KL_STDERR_FILE.old_make */
extern void T124f19(T0* C, T0* a1);
/* PR_YACC_PARSER.std */
extern T0* T50f190(T0* C);
/* KL_CHARACTER_BUFFER.item */
extern T2 T275f3(T0* C, T6 a1);
/* PR_YACC_PARSER.special_integer_ */
extern T0* T50f111(T0* C);
/* PR_YACC_PARSER.yy_init_value_stacks */
extern void T50f302(T0* C);
/* PR_YACC_PARSER.yy_clear_all */
extern void T50f311(T0* C);
/* PR_YACC_PARSER.clear_all */
extern void T50f339(T0* C);
/* PR_YACC_PARSER.clear_stacks */
extern void T50f362(T0* C);
/* PR_YACC_PARSER.yy_clear_value_stacks */
extern void T50f365(T0* C);
/* SPECIAL [DS_ARRAYED_LIST [PR_LABELED_TYPE]].upper */
extern T6 T142f3(T0* C);
/* SPECIAL [PR_LABELED_TYPE].upper */
extern T6 T144f3(T0* C);
/* SPECIAL [DS_ARRAYED_LIST [PR_TYPE]].upper */
extern T6 T141f3(T0* C);
/* SPECIAL [PR_TYPE].upper */
extern T6 T139f3(T0* C);
/* SPECIAL [PR_TOKEN].upper */
extern T6 T147f3(T0* C);
/* SPECIAL [INTEGER_32].upper */
extern T6 T101f3(T0* C);
/* SPECIAL [STRING_8].upper */
extern T6 T122f3(T0* C);
/* SPECIAL [ANY].upper */
extern T6 T133f2(T0* C);
/* PR_YACC_PARSER.abort */
extern void T50f305(T0* C);
/* PR_YACC_PARSER.set_input_buffer */
extern void T50f296(T0* C, T0* a1);
/* PR_YACC_PARSER.yy_load_input_buffer */
extern void T50f301(T0* C);
/* YY_FILE_BUFFER.set_position */
extern void T129f18(T0* C, T6 a1, T6 a2, T6 a3);
/* YY_BUFFER.set_position */
extern void T130f14(T0* C, T6 a1, T6 a2, T6 a3);
/* PR_YACC_PARSER.new_file_buffer */
extern T0* T50f162(T0* C, T0* a1);
/* YY_FILE_BUFFER.make */
extern T0* T129c16(T0* a1);
/* YY_FILE_BUFFER.make_with_size */
extern void T129f20(T0* C, T0* a1, T6 a2);
/* YY_FILE_BUFFER.set_file */
extern void T129f22(T0* C, T0* a1);
/* YY_FILE_BUFFER.flush */
extern void T129f24(T0* C);
/* YY_FILE_BUFFER.new_default_buffer */
extern T0* T129f15(T0* C, T6 a1);
/* KL_TEXT_INPUT_FILE.is_open_read */
extern T1 T51f20(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_read */
extern T1 T51f19(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T51f38(T0* C);
/* KL_TEXT_INPUT_FILE.is_closed */
extern T1 T51f17(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_closed */
extern T1 T51f11(T0* C);
/* KL_TEXT_INPUT_FILE.old_open_read */
extern void T51f42(T0* C);
/* KL_TEXT_INPUT_FILE.default_pointer */
extern T14 T51f21(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T51f42p1(T0* C);
/* KL_TEXT_INPUT_FILE.file_open */
extern T14 T51f22(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.old_is_readable */
extern T1 T51f16(T0* C);
/* UNIX_FILE_INFO.is_readable */
extern T1 T191f5(T0* C);
/* UNIX_FILE_INFO.file_eaccess */
extern T1 T191f3(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.buffered_file_info */
extern unsigned char ge510os2144;
extern T0* ge510ov2144;
extern T0* T51f24(T0* C);
/* UNIX_FILE_INFO.make */
extern T0* T191c6(void);
/* UNIX_FILE_INFO.make_buffered_file_info */
extern void T191f8(T0* C, T6 a1);
/* UNIX_FILE_INFO.stat_size */
extern T6 T191f4(T0* C);
/* KL_TEXT_INPUT_FILE.set_buffer */
extern void T51f44(T0* C);
/* UNIX_FILE_INFO.update */
extern void T191f7(T0* C, T0* a1);
/* UNIX_FILE_INFO.file_stat */
extern void T191f9(T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.old_exists */
extern T1 T51f15(T0* C);
/* KL_TEXT_INPUT_FILE.file_exists */
extern T1 T51f23(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.make */
extern T0* T51c36(T0* a1);
/* KL_TEXT_INPUT_FILE.make */
extern void T51f36p1(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.old_make */
extern void T51f40(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.string_ */
extern T0* T51f26(T0* C);
/* PR_YACC_PARSER.set_old_typing */
extern void T50f292(T0* C, T1 a1);
/* PR_YACC_PARSER.make */
extern T0* T50c291(T0* a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].make */
extern T0* T128c36(T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].make_with_equality_testers */
extern void T128f40(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [PR_TYPE, STRING_8].make */
extern T0* T254c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [PR_TYPE, STRING_8].set_internal_cursor */
extern void T254f6(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [PR_TYPE, STRING_8].new_cursor */
extern T0* T254f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [PR_TYPE, STRING_8].make */
extern T0* T289c3(T0* a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].new_cursor */
extern T0* T128f29(T0* C);
/* DS_HASH_TABLE_CURSOR [PR_TYPE, STRING_8].make */
extern T0* T256c3(T0* a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].make_sparse_container */
extern void T128f48(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].set_internal_cursor */
extern void T128f57(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].make_slots */
extern void T128f56(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].make_clashes */
extern void T128f55(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].make_key_storage */
extern void T128f54(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].make_item_storage */
extern void T128f53(T0* C, T6 a1);
/* KL_EQUALITY_TESTER [STRING_8].default_create */
extern T0* T42c2(void);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].make */
extern T0* T127c37(T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].make_with_equality_testers */
extern void T127f42(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [PR_VARIABLE, STRING_8].make */
extern T0* T251c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [PR_VARIABLE, STRING_8].set_internal_cursor */
extern void T251f6(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [PR_VARIABLE, STRING_8].new_cursor */
extern T0* T251f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [PR_VARIABLE, STRING_8].make */
extern T0* T288c3(T0* a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].new_cursor */
extern T0* T127f30(T0* C);
/* DS_HASH_TABLE_CURSOR [PR_VARIABLE, STRING_8].make */
extern T0* T253c3(T0* a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].make_sparse_container */
extern void T127f49(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].set_internal_cursor */
extern void T127f58(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].make_slots */
extern void T127f57(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].make_clashes */
extern void T127f56(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].make_key_storage */
extern void T127f55(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].make_item_storage */
extern void T127f54(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].make */
extern T0* T126c38(T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].make_with_equality_testers */
extern void T126f43(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [PR_TOKEN, STRING_8].make */
extern T0* T248c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [PR_TOKEN, STRING_8].set_internal_cursor */
extern void T248f6(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [PR_TOKEN, STRING_8].new_cursor */
extern T0* T248f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [PR_TOKEN, STRING_8].make */
extern T0* T287c3(T0* a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].new_cursor */
extern T0* T126f31(T0* C);
/* DS_HASH_TABLE_CURSOR [PR_TOKEN, STRING_8].make */
extern T0* T250c3(T0* a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].make_sparse_container */
extern void T126f50(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].set_internal_cursor */
extern void T126f59(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].make_slots */
extern void T126f58(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].make_clashes */
extern void T126f57(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].make_key_storage */
extern void T126f56(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].make_item_storage */
extern void T126f55(T0* C, T6 a1);
/* PR_GRAMMAR.make */
extern T0* T29c19(void);
/* PR_ACTION_FACTORY.make */
extern T0* T125c2(void);
/* PR_YACC_PARSER.make_parser_skeleton */
extern void T50f295(T0* C);
/* PR_YACC_PARSER.yy_build_parser_tables */
extern void T50f300(T0* C);
/* PR_YACC_PARSER.yycheck_template */
extern unsigned char ge157os4131;
extern T0* ge157ov4131;
extern T0* T50f127(T0* C);
/* PR_YACC_PARSER.yyfixed_array */
extern T0* T50f275(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].to_special */
extern T0* T131f3(T0* C, T0* a1);
/* PR_YACC_PARSER.yycheck_template_2 */
extern void T50f369(T0* C, T0* a1);
/* PR_YACC_PARSER.yyarray_subcopy */
extern void T50f380(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* PR_YACC_PARSER.integer_array_ */
extern T0* T50f290(T0* C);
/* PR_YACC_PARSER.yycheck_template_1 */
extern void T50f368(T0* C, T0* a1);
/* PR_YACC_PARSER.yytable_template */
extern unsigned char ge157os4128;
extern T0* ge157ov4128;
extern T0* T50f121(T0* C);
/* PR_YACC_PARSER.yytable_template_2 */
extern void T50f367(T0* C, T0* a1);
/* PR_YACC_PARSER.yytable_template_1 */
extern void T50f366(T0* C, T0* a1);
/* PR_YACC_PARSER.yypgoto_template */
extern unsigned char ge157os4127;
extern T0* ge157ov4127;
extern T0* T50f120(T0* C);
/* PR_YACC_PARSER.yypact_template */
extern unsigned char ge157os4126;
extern T0* ge157ov4126;
extern T0* T50f119(T0* C);
/* PR_YACC_PARSER.yydefgoto_template */
extern unsigned char ge157os4125;
extern T0* ge157ov4125;
extern T0* T50f117(T0* C);
/* PR_YACC_PARSER.yydefact_template */
extern unsigned char ge157os4124;
extern T0* ge157ov4124;
extern T0* T50f114(T0* C);
/* PR_YACC_PARSER.yytypes2_template */
extern unsigned char ge157os4123;
extern T0* ge157ov4123;
extern T0* T50f113(T0* C);
/* PR_YACC_PARSER.yytypes1_template */
extern unsigned char ge157os4122;
extern T0* ge157ov4122;
extern T0* T50f260(T0* C);
/* PR_YACC_PARSER.yyr1_template */
extern unsigned char ge157os4121;
extern T0* ge157ov4121;
extern T0* T50f179(T0* C);
/* PR_YACC_PARSER.yytranslate_template */
extern unsigned char ge157os4120;
extern T0* ge157ov4120;
extern T0* T50f178(T0* C);
/* PR_YACC_PARSER.yy_create_value_stacks */
extern void T50f299(T0* C);
/* PR_YACC_PARSER.make_yacc_scanner */
extern void T50f294(T0* C, T0* a1);
/* PR_YACC_PARSER.make_with_buffer */
extern void T50f298(T0* C, T0* a1);
/* PR_YACC_PARSER.yy_initialize */
extern void T50f312(T0* C);
/* PR_YACC_PARSER.yy_build_tables */
extern void T50f340(T0* C);
/* PR_YACC_PARSER.yy_accept_template */
extern unsigned char ge159os4686;
extern T0* ge159ov4686;
extern T0* T50f272(T0* C);
/* PR_YACC_PARSER.yy_fixed_array */
extern T0* T50f288(T0* C, T0* a1);
/* PR_YACC_PARSER.yy_meta_template */
extern unsigned char ge159os4685;
extern T0* ge159ov4685;
extern T0* T50f271(T0* C);
/* PR_YACC_PARSER.yy_ec_template */
extern unsigned char ge159os4684;
extern T0* ge159ov4684;
extern T0* T50f270(T0* C);
/* PR_YACC_PARSER.yy_def_template */
extern unsigned char ge159os4683;
extern T0* ge159ov4683;
extern T0* T50f269(T0* C);
/* PR_YACC_PARSER.yy_base_template */
extern unsigned char ge159os4682;
extern T0* ge159ov4682;
extern T0* T50f268(T0* C);
/* PR_YACC_PARSER.yy_chk_template */
extern unsigned char ge159os4679;
extern T0* ge159ov4679;
extern T0* T50f267(T0* C);
/* PR_YACC_PARSER.yy_chk_template_2 */
extern void T50f379(T0* C, T0* a1);
/* PR_YACC_PARSER.yy_array_subcopy */
extern void T50f382(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* PR_YACC_PARSER.yy_chk_template_1 */
extern void T50f378(T0* C, T0* a1);
/* PR_YACC_PARSER.yy_nxt_template */
extern unsigned char ge159os4676;
extern T0* ge159ov4676;
extern T0* T50f266(T0* C);
/* PR_YACC_PARSER.yy_nxt_template_2 */
extern void T50f377(T0* C, T0* a1);
/* PR_YACC_PARSER.yy_nxt_template_1 */
extern void T50f376(T0* C, T0* a1);
/* PR_YACC_PARSER.empty_buffer */
extern unsigned char ge88os4510;
extern T0* ge88ov4510;
extern T0* T50f132(T0* C);
/* YY_BUFFER.make */
extern T0* T130c12(T0* a1);
/* YY_BUFFER.make_from_buffer */
extern void T130f16(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.fill_from_string */
extern void T275f11(T0* C, T0* a1, T6 a2);
/* YY_BUFFER.new_default_buffer */
extern T0* T130f11(T0* C, T6 a1);
/* GEYACC.read_command_line */
extern void T21f20(T0* C);
/* GEYACC.report_usage_error */
extern void T21f24(T0* C);
/* GEYACC.usage_message */
extern unsigned char ge2os1750;
extern T0* ge2ov1750;
extern T0* T21f17(T0* C);
/* UT_USAGE_MESSAGE.make */
extern T0* T56c8(T0* a1);
/* GEYACC.report_usage_message */
extern void T21f23(T0* C);
/* UT_ERROR_HANDLER.report_info */
extern void T28f8(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_info_message */
extern void T28f11(T0* C, T0* a1);
/* GEYACC.report_version_number */
extern void T21f22(T0* C);
/* UT_VERSION_NUMBER.make */
extern T0* T55c8(T0* a1);
/* KL_ARGUMENTS.argument */
extern T0* T27f2(T0* C, T6 a1);
/* UT_ERROR_HANDLER.make_standard */
extern T0* T28c6(void);
/* UT_ERROR_HANDLER.std */
extern T0* T28f4(T0* C);
/* KL_ARGUMENTS.set_program_name */
extern void T27f5(T0* C, T0* a1);
/* GEYACC.arguments */
extern unsigned char ge298os1754;
extern T0* ge298ov1754;
extern T0* T21f13(T0* C);
/* KL_ARGUMENTS.make */
extern T0* T27c4(void);
/* GEYACC.resurrect_code */
extern void T21f19(T0* C);
/* KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_STATE]].default_create */
extern T0* T49c1(void);
/* KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_VARIABLE]].default_create */
extern T0* T48c1(void);
/* KL_EQUALITY_TESTER [PR_CONFLICT].default_create */
extern T0* T47c1(void);
/* KL_EQUALITY_TESTER [PR_PORTION].default_create */
extern T0* T46c1(void);
/* KL_EQUALITY_TESTER [PR_STATE].default_create */
extern T0* T45c1(void);
/* KL_EQUALITY_TESTER [PR_REDUCTION].default_create */
extern T0* T44c1(void);
/* KL_EQUALITY_TESTER [PR_TRANSITION].default_create */
extern T0* T43c1(void);
/* KL_EQUALITY_TESTER [PR_TYPE].default_create */
extern T0* T40c1(void);
/* KL_EQUALITY_TESTER [PR_VARIABLE].default_create */
extern T0* T39c1(void);
/* KL_EQUALITY_TESTER [PR_TOKEN].default_create */
extern T0* T38c1(void);
/* KL_EQUALITY_TESTER [PR_RULE].default_create */
extern T0* T37c1(void);
/* KL_TEXT_INPUT_FILE.dispose */
extern void T51f37(T0* C);
/* KL_TEXT_OUTPUT_FILE.dispose */
extern void T24f22(T0* C);
/* PR_PRECEDENCE_DEFINED_TWICE_ERROR.default_message */
extern T0* T190f5(T0* C);
/* PR_PRECEDENCE_DEFINED_TWICE_ERROR.message */
extern T0* T190f3(T0* C, T0* a1);
/* PR_PRECEDENCE_DEFINED_TWICE_ERROR.arguments */
extern T0* T190f6(T0* C);
/* KL_STRING_ROUTINES.appended_string */
extern T0* T118f6(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.concat */
extern T0* T118f12(T0* C, T0* a1, T0* a2);
/* STRING_8.plus */
extern T0* T17f21(T0* C, T0* a1);
/* ARRAY [STRING_8].item */
extern T0* T123f5(T0* C, T6 a1);
/* ARRAY [STRING_8].valid_index */
extern T1 T123f4(T0* C, T6 a1);
/* KL_STRING_ROUTINES.append_substring_to_string */
extern void T118f14(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* KL_STRING_ROUTINES.appended_substring */
extern T0* T118f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* KL_STRING_ROUTINES.new_empty_string */
extern T0* T118f4(T0* C, T0* a1, T6 a2);
/* KL_STRING_ROUTINES.cloned_string */
extern T0* T118f11(T0* C, T0* a1);
/* PR_PRECEDENCE_DEFINED_TWICE_ERROR.string_ */
extern T0* T190f4(T0* C);
/* PR_UNDEFINED_STRING_TOKEN_ERROR.default_message */
extern T0* T189f5(T0* C);
/* PR_UNDEFINED_STRING_TOKEN_ERROR.message */
extern T0* T189f3(T0* C, T0* a1);
/* PR_UNDEFINED_STRING_TOKEN_ERROR.arguments */
extern T0* T189f6(T0* C);
/* PR_UNDEFINED_STRING_TOKEN_ERROR.string_ */
extern T0* T189f4(T0* C);
/* PR_VARIABLE_DECLARED_TWICE_ERROR.default_message */
extern T0* T188f5(T0* C);
/* PR_VARIABLE_DECLARED_TWICE_ERROR.message */
extern T0* T188f3(T0* C, T0* a1);
/* PR_VARIABLE_DECLARED_TWICE_ERROR.arguments */
extern T0* T188f6(T0* C);
/* PR_VARIABLE_DECLARED_TWICE_ERROR.string_ */
extern T0* T188f4(T0* C);
/* PR_SYMBOL_DECLARED_TOKEN_ERROR.default_message */
extern T0* T187f5(T0* C);
/* PR_SYMBOL_DECLARED_TOKEN_ERROR.message */
extern T0* T187f3(T0* C, T0* a1);
/* PR_SYMBOL_DECLARED_TOKEN_ERROR.arguments */
extern T0* T187f6(T0* C);
/* PR_SYMBOL_DECLARED_TOKEN_ERROR.string_ */
extern T0* T187f4(T0* C);
/* PR_TOKEN_DECLARED_TWICE_ERROR.default_message */
extern T0* T186f5(T0* C);
/* PR_TOKEN_DECLARED_TWICE_ERROR.message */
extern T0* T186f3(T0* C, T0* a1);
/* PR_TOKEN_DECLARED_TWICE_ERROR.arguments */
extern T0* T186f6(T0* C);
/* PR_TOKEN_DECLARED_TWICE_ERROR.string_ */
extern T0* T186f4(T0* C);
/* PR_SYMBOL_DECLARED_VARIABLE_ERROR.default_message */
extern T0* T185f5(T0* C);
/* PR_SYMBOL_DECLARED_VARIABLE_ERROR.message */
extern T0* T185f3(T0* C, T0* a1);
/* PR_SYMBOL_DECLARED_VARIABLE_ERROR.arguments */
extern T0* T185f6(T0* C);
/* PR_SYMBOL_DECLARED_VARIABLE_ERROR.string_ */
extern T0* T185f4(T0* C);
/* PR_INVALID_DOLLAR_N_ERROR.default_message */
extern T0* T176f5(T0* C);
/* PR_INVALID_DOLLAR_N_ERROR.message */
extern T0* T176f3(T0* C, T0* a1);
/* PR_INVALID_DOLLAR_N_ERROR.arguments */
extern T0* T176f6(T0* C);
/* PR_INVALID_DOLLAR_N_ERROR.string_ */
extern T0* T176f4(T0* C);
/* PR_DANGEROUS_DOLLAR_N_ERROR.default_message */
extern T0* T175f5(T0* C);
/* PR_DANGEROUS_DOLLAR_N_ERROR.message */
extern T0* T175f3(T0* C, T0* a1);
/* PR_DANGEROUS_DOLLAR_N_ERROR.arguments */
extern T0* T175f6(T0* C);
/* PR_DANGEROUS_DOLLAR_N_ERROR.string_ */
extern T0* T175f4(T0* C);
/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR.default_message */
extern T0* T174f5(T0* C);
/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR.message */
extern T0* T174f3(T0* C, T0* a1);
/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR.arguments */
extern T0* T174f6(T0* C);
/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR.string_ */
extern T0* T174f4(T0* C);
/* PR_TWO_STRINGS_TOKEN_ERROR.default_message */
extern T0* T173f5(T0* C);
/* PR_TWO_STRINGS_TOKEN_ERROR.message */
extern T0* T173f3(T0* C, T0* a1);
/* PR_TWO_STRINGS_TOKEN_ERROR.arguments */
extern T0* T173f6(T0* C);
/* PR_TWO_STRINGS_TOKEN_ERROR.string_ */
extern T0* T173f4(T0* C);
/* PR_TWO_TOKEN_IDS_TOKEN_ERROR.default_message */
extern T0* T172f5(T0* C);
/* PR_TWO_TOKEN_IDS_TOKEN_ERROR.message */
extern T0* T172f3(T0* C, T0* a1);
/* PR_TWO_TOKEN_IDS_TOKEN_ERROR.arguments */
extern T0* T172f6(T0* C);
/* PR_TWO_TOKEN_IDS_TOKEN_ERROR.string_ */
extern T0* T172f4(T0* C);
/* PR_ALIAS_NAME_DEFINED_TWICE_ERROR.default_message */
extern T0* T171f5(T0* C);
/* PR_ALIAS_NAME_DEFINED_TWICE_ERROR.message */
extern T0* T171f3(T0* C, T0* a1);
/* PR_ALIAS_NAME_DEFINED_TWICE_ERROR.arguments */
extern T0* T171f6(T0* C);
/* PR_ALIAS_NAME_DEFINED_TWICE_ERROR.string_ */
extern T0* T171f4(T0* C);
/* PR_ALIAS_NAME_NOT_DEFINED_ERROR.default_message */
extern T0* T170f5(T0* C);
/* PR_ALIAS_NAME_NOT_DEFINED_ERROR.message */
extern T0* T170f3(T0* C, T0* a1);
/* PR_ALIAS_NAME_NOT_DEFINED_ERROR.arguments */
extern T0* T170f6(T0* C);
/* PR_ALIAS_NAME_NOT_DEFINED_ERROR.string_ */
extern T0* T170f4(T0* C);
/* PR_LAST_VALUE_NAME_USED_TWICE_ERROR.default_message */
extern T0* T169f5(T0* C);
/* PR_LAST_VALUE_NAME_USED_TWICE_ERROR.message */
extern T0* T169f3(T0* C, T0* a1);
/* PR_LAST_VALUE_NAME_USED_TWICE_ERROR.arguments */
extern T0* T169f6(T0* C);
/* PR_LAST_VALUE_NAME_USED_TWICE_ERROR.string_ */
extern T0* T169f4(T0* C);
/* PR_ALIAS_NAME_UNDEFINED_ERROR.default_message */
extern T0* T168f5(T0* C);
/* PR_ALIAS_NAME_UNDEFINED_ERROR.message */
extern T0* T168f3(T0* C, T0* a1);
/* PR_ALIAS_NAME_UNDEFINED_ERROR.arguments */
extern T0* T168f6(T0* C);
/* PR_ALIAS_NAME_UNDEFINED_ERROR.string_ */
extern T0* T168f4(T0* C);
/* PR_UNDEFINED_SYMBOL_ERROR.default_message */
extern T0* T167f5(T0* C);
/* PR_UNDEFINED_SYMBOL_ERROR.message */
extern T0* T167f3(T0* C, T0* a1);
/* PR_UNDEFINED_SYMBOL_ERROR.arguments */
extern T0* T167f6(T0* C);
/* PR_UNDEFINED_SYMBOL_ERROR.string_ */
extern T0* T167f4(T0* C);
/* PR_TOKEN_ID_USED_TWICE_ERROR.default_message */
extern T0* T166f5(T0* C);
/* PR_TOKEN_ID_USED_TWICE_ERROR.message */
extern T0* T166f3(T0* C, T0* a1);
/* PR_TOKEN_ID_USED_TWICE_ERROR.arguments */
extern T0* T166f6(T0* C);
/* PR_TOKEN_ID_USED_TWICE_ERROR.string_ */
extern T0* T166f4(T0* C);
/* PR_UNKNOWN_START_SYMBOL_ERROR.default_message */
extern T0* T165f5(T0* C);
/* PR_UNKNOWN_START_SYMBOL_ERROR.message */
extern T0* T165f3(T0* C, T0* a1);
/* PR_UNKNOWN_START_SYMBOL_ERROR.arguments */
extern T0* T165f6(T0* C);
/* PR_UNKNOWN_START_SYMBOL_ERROR.string_ */
extern T0* T165f4(T0* C);
/* PR_START_SYMBOL_TOKEN_ERROR.default_message */
extern T0* T164f5(T0* C);
/* PR_START_SYMBOL_TOKEN_ERROR.message */
extern T0* T164f3(T0* C, T0* a1);
/* PR_START_SYMBOL_TOKEN_ERROR.arguments */
extern T0* T164f6(T0* C);
/* PR_START_SYMBOL_TOKEN_ERROR.string_ */
extern T0* T164f4(T0* C);
/* PR_INTEGER_TOO_LARGE_ERROR.default_message */
extern T0* T163f5(T0* C);
/* PR_INTEGER_TOO_LARGE_ERROR.message */
extern T0* T163f3(T0* C, T0* a1);
/* PR_INTEGER_TOO_LARGE_ERROR.arguments */
extern T0* T163f6(T0* C);
/* PR_INTEGER_TOO_LARGE_ERROR.string_ */
extern T0* T163f4(T0* C);
/* PR_INVALID_DOLLAR_DOLLAR_ERROR.default_message */
extern T0* T162f5(T0* C);
/* PR_INVALID_DOLLAR_DOLLAR_ERROR.message */
extern T0* T162f3(T0* C, T0* a1);
/* PR_INVALID_DOLLAR_DOLLAR_ERROR.arguments */
extern T0* T162f6(T0* C);
/* PR_INVALID_DOLLAR_DOLLAR_ERROR.string_ */
extern T0* T162f4(T0* C);
/* PR_INVALID_STRING_TOKEN_ERROR.default_message */
extern T0* T161f5(T0* C);
/* PR_INVALID_STRING_TOKEN_ERROR.message */
extern T0* T161f3(T0* C, T0* a1);
/* PR_INVALID_STRING_TOKEN_ERROR.arguments */
extern T0* T161f6(T0* C);
/* PR_INVALID_STRING_TOKEN_ERROR.string_ */
extern T0* T161f4(T0* C);
/* PR_NULL_INTEGER_ERROR.default_message */
extern T0* T160f5(T0* C);
/* PR_NULL_INTEGER_ERROR.message */
extern T0* T160f3(T0* C, T0* a1);
/* PR_NULL_INTEGER_ERROR.arguments */
extern T0* T160f6(T0* C);
/* PR_NULL_INTEGER_ERROR.string_ */
extern T0* T160f4(T0* C);
/* PR_MISSING_CHARACTERS_ERROR.default_message */
extern T0* T159f5(T0* C);
/* PR_MISSING_CHARACTERS_ERROR.message */
extern T0* T159f3(T0* C, T0* a1);
/* PR_MISSING_CHARACTERS_ERROR.arguments */
extern T0* T159f6(T0* C);
/* PR_MISSING_CHARACTERS_ERROR.string_ */
extern T0* T159f4(T0* C);
/* PR_PREC_NOT_TOKEN_ERROR.default_message */
extern T0* T158f5(T0* C);
/* PR_PREC_NOT_TOKEN_ERROR.message */
extern T0* T158f3(T0* C, T0* a1);
/* PR_PREC_NOT_TOKEN_ERROR.arguments */
extern T0* T158f6(T0* C);
/* PR_PREC_NOT_TOKEN_ERROR.string_ */
extern T0* T158f4(T0* C);
/* PR_PREC_SPECIFIED_TWICE_ERROR.default_message */
extern T0* T157f5(T0* C);
/* PR_PREC_SPECIFIED_TWICE_ERROR.message */
extern T0* T157f3(T0* C, T0* a1);
/* PR_PREC_SPECIFIED_TWICE_ERROR.arguments */
extern T0* T157f6(T0* C);
/* PR_PREC_SPECIFIED_TWICE_ERROR.string_ */
extern T0* T157f4(T0* C);
/* PR_INVALID_ERROR_N_ERROR.default_message */
extern T0* T156f5(T0* C);
/* PR_INVALID_ERROR_N_ERROR.message */
extern T0* T156f3(T0* C, T0* a1);
/* PR_INVALID_ERROR_N_ERROR.arguments */
extern T0* T156f6(T0* C);
/* PR_INVALID_ERROR_N_ERROR.string_ */
extern T0* T156f4(T0* C);
/* PR_RULE_DECLARED_TWICE_ERROR.default_message */
extern T0* T155f5(T0* C);
/* PR_RULE_DECLARED_TWICE_ERROR.message */
extern T0* T155f3(T0* C, T0* a1);
/* PR_RULE_DECLARED_TWICE_ERROR.arguments */
extern T0* T155f6(T0* C);
/* PR_RULE_DECLARED_TWICE_ERROR.string_ */
extern T0* T155f4(T0* C);
/* PR_LHS_SYMBOL_TOKEN_ERROR.default_message */
extern T0* T154f5(T0* C);
/* PR_LHS_SYMBOL_TOKEN_ERROR.message */
extern T0* T154f3(T0* C, T0* a1);
/* PR_LHS_SYMBOL_TOKEN_ERROR.arguments */
extern T0* T154f6(T0* C);
/* PR_LHS_SYMBOL_TOKEN_ERROR.string_ */
extern T0* T154f4(T0* C);
/* PR_NO_RULES_ERROR.default_message */
extern T0* T153f5(T0* C);
/* PR_NO_RULES_ERROR.message */
extern T0* T153f3(T0* C, T0* a1);
/* PR_NO_RULES_ERROR.arguments */
extern T0* T153f6(T0* C);
/* PR_NO_RULES_ERROR.string_ */
extern T0* T153f4(T0* C);
/* PR_MULTIPLE_START_DECLARATIONS_ERROR.default_message */
extern T0* T152f5(T0* C);
/* PR_MULTIPLE_START_DECLARATIONS_ERROR.message */
extern T0* T152f3(T0* C, T0* a1);
/* PR_MULTIPLE_START_DECLARATIONS_ERROR.arguments */
extern T0* T152f6(T0* C);
/* PR_MULTIPLE_START_DECLARATIONS_ERROR.string_ */
extern T0* T152f4(T0* C);
/* UT_SYNTAX_ERROR.default_message */
extern T0* T150f5(T0* C);
/* UT_SYNTAX_ERROR.message */
extern T0* T150f3(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.arguments */
extern T0* T150f6(T0* C);
/* UT_SYNTAX_ERROR.string_ */
extern T0* T150f4(T0* C);
/* UT_MESSAGE.default_message */
extern T0* T62f5(T0* C);
/* UT_MESSAGE.message */
extern T0* T62f3(T0* C, T0* a1);
/* UT_MESSAGE.arguments */
extern T0* T62f6(T0* C);
/* UT_MESSAGE.string_ */
extern T0* T62f4(T0* C);
/* UT_USAGE_MESSAGE.default_message */
extern T0* T56f3(T0* C);
/* UT_USAGE_MESSAGE.message */
extern T0* T56f5(T0* C, T0* a1);
/* UT_USAGE_MESSAGE.arguments */
extern T0* T56f7(T0* C);
/* UT_USAGE_MESSAGE.string_ */
extern T0* T56f6(T0* C);
/* UT_VERSION_NUMBER.default_message */
extern T0* T55f3(T0* C);
/* UT_VERSION_NUMBER.message */
extern T0* T55f5(T0* C, T0* a1);
/* UT_VERSION_NUMBER.arguments */
extern T0* T55f7(T0* C);
/* UT_VERSION_NUMBER.string_ */
extern T0* T55f6(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.default_message */
extern T0* T52f3(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.message */
extern T0* T52f5(T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.arguments */
extern T0* T52f7(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.string_ */
extern T0* T52f6(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
extern T0* T25f3(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
extern T0* T25f5(T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.arguments */
extern T0* T25f7(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
extern T0* T25f6(T0* C);
extern T0* GE_ma102(T6 c, T6 n, ...);
extern T0* ge289ov1752;
extern T0* ge136ov1820;
extern T0* ge174ov6234;
extern T0* ge174ov6233;
extern T0* ge174ov6232;
extern T0* ge174ov6231;
extern T0* ge230ov6223;
extern T0* ge268ov1897;
extern T0* ge364ov1897;
extern T0* ge136ov1822;
extern T0* ge266ov1897;
extern T0* ge164ov2717;
extern T0* ge252ov1927;
extern T0* ge158ov4255;
extern T0* ge267ov5321;
extern T0* ge254ov4937;
extern T0* ge2ov1746;
extern T0* ge112ov2715;
extern T0* ge124ov2715;
extern T0* ge127ov2715;
extern T0* ge118ov2715;
extern T0* ge120ov2715;
extern T0* ge119ov2715;
extern T0* ge103ov2715;
extern T0* ge100ov2715;
extern T0* ge117ov2715;
extern T0* ge122ov2715;
extern T0* ge123ov2715;
extern T0* ge97ov2715;
extern T0* ge98ov2715;
extern T0* ge106ov2715;
extern T0* ge99ov2715;
extern T0* ge125ov2715;
extern T0* ge121ov2715;
extern T0* ge126ov2715;
extern T0* ge116ov2715;
extern T0* ge101ov2715;
extern T0* ge102ov2715;
extern T0* ge105ov2715;
extern T0* ge111ov2715;
extern T0* ge108ov2715;
extern T0* ge113ov2715;
extern T0* ge114ov2715;
extern T0* ge104ov2715;
extern T0* ge115ov2715;
extern T0* ge107ov2715;
extern T0* ge110ov2715;
extern T0* ge109ov2715;
extern T0* ge168ov2715;
extern T0* ge166ov2715;
extern T0* ge172ov2715;
extern T0* ge173ov2715;
extern T0* ge162ov2715;
extern T0* ge163ov2715;
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
