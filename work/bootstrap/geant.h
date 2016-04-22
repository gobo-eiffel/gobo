/*
	description:

		"C declarations for the Gobo Eiffel runtime."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2005-2016, Eric Bezault and others"
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
#else
#if defined (__BORLANDC__) && (__BORLANDC__ < 0x600) /* Borland before 6.0 */
#define GE_int64(x) x##i64
#define GE_nat64(x) x##ui64
#else /* ISO C 99 */
#define GE_int64(x) x##LL
#define GE_nat64(x) x##ULL
#endif
#endif

extern EIF_REFERENCE GE_ms8(const char *s, EIF_INTEGER_32 c);
#define GE_str8(s) GE_ms8((s),strlen(s))

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
#define SIGBLOCK
#define SIGRESUME
#define rt_public				/* default C scope */
#define rt_private static		/* static outside a block means private */
#define rt_shared				/* data shared between modules, but not public */
typedef int32_t EIF_TYPE_ID;
#define EIF_NO_TYPE (EIF_TYPE_ID)(-1)
typedef uint16_t EIF_TYPE_INDEX;
#define RTMS(s) GE_str8(s)
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
	copyright: "Copyright (c) 2007-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_EXCEPTION_H
#define GE_EXCEPTION_H

#include <setjmp.h>

/*
 * On Linux glibc systems, we need to use sig* versions of jmp_buf,
 * setjmp and longjmp to preserve the signal handling context.
 * One way to detect this is if _SIGSET_H_types has
 * been defined in /usr/include/setjmp.h.
 * NOTE: ANSI only recognizes the non-sig versions.
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
 * Predefined exception codes.
 */
#define GE_EX_VOID		1			/* Feature applied to void reference */
#define GE_EX_MEM		2			/* No more memory */
#define GE_EX_PRE		3			/* Pre-condition violated */
#define GE_EX_POST		4			/* Post-condition violated */
#define GE_EX_FLOAT		5			/* Floating point exception (signal SIGFPE) */
#define GE_EX_CINV		6			/* Class invariant violated */
#define GE_EX_CHECK		7			/* Check instruction violated */
#define GE_EX_FAIL		8			/* Routine failure */
#define GE_EX_WHEN		9			/* Unmatched inspect value */
#define GE_EX_VAR		10			/* Non-decreasing loop variant */
#define GE_EX_LINV		11			/* Loop invariant violated */
#define GE_EX_SIG		12			/* Operating system signal */
#define GE_EX_BYE		13			/* Eiffel run-time panic */
#define GE_EX_RESC		14			/* Exception in rescue clause */
#define GE_EX_OMEM		15			/* Out of memory (cannot be ignored) */
#define GE_EX_RES		16			/* Resumption failed (retry did not succeed) */
#define GE_EX_CDEF		17			/* Create on deferred */
#define GE_EX_EXT		18			/* External event */
#define GE_EX_VEXP		19			/* Void assigned to expanded */
#define GE_EX_HDLR		20			/* Exception in signal handler */
#define GE_EX_IO		21			/* I/O error */
#define GE_EX_SYS		22			/* Operating system error */
#define GE_EX_RETR		23			/* Retrieval error */
#define GE_EX_PROG		24			/* Developer exception */
#define GE_EX_FATAL		25			/* Eiffel run-time fatal error */
#define GE_EX_DOL		26			/* $ applied to melted feature */
#define GE_EX_ISE_IO	27			/* I/O error raised by the ISE Eiffel runtime */
#define GE_EX_COM		28			/* COM error raised by EiffelCOM runtime */
#define GE_EX_RT_CHECK	29			/* Runtime check error such as out-of-bound array access */
#define GE_EX_OLD		30			/* Old violation */
#define GE_EX_SEL		31			/* Serialization failure */
#define GE_EX_DIRTY		32			/* SCOOP processor dirty exception. */
#define GE_EX_NEX		32			/* Number of internal exceptions */

/*
 * String buffer used to build the exception trace.
 */
typedef struct GE_exception_trace_buffer_struct GE_exception_trace_buffer;
struct GE_exception_trace_buffer_struct {
	char* area;
	uint32_t count;
	uint32_t capacity;
};

/*
 * Information about the feature being executed.
 */
typedef struct GE_call_struct GE_call;
struct GE_call_struct {
#ifdef EIF_CURRENT_IN_EXCEPTION_TRACE
	void* object; /* Current object */
#endif
	const char* class_name;
	const char* feature_name;
	GE_call* caller; /* previous feature in the call chain */
};

/*
 * Context of features containing a rescue clause.
 */
typedef struct GE_rescue_struct GE_rescue;
struct GE_rescue_struct {
	GE_jmp_buf jb;
	GE_rescue* previous; /* previous context in the call chain */
};

/*
 * Information about the execution context.
 * One such struct per thread.
 */
typedef struct GE_thread_context_struct GE_thread_context;
typedef struct GE_context_struct GE_context;
struct GE_context_struct {
	GE_call* call; /* Call stack */
	GE_rescue* last_rescue; /* Context of last feature entered containing a rescue clause */
	uint32_t in_rescue; /* Number of rescue clauses currently being executed */
	EIF_REFERENCE exception_manager; /* Exception manager */
	char raising_exception; /* Is an exception currently being raised? */
	char exception_trace_enabled; /* Should exception trace be displayed? */
	GE_exception_trace_buffer exception_trace_buffer; /* String buffer used to build the exception trace */
	GE_exception_trace_buffer last_exception_trace; /* Last non-routine-failure exception trace */
#ifdef EIF_THREADS
	GE_thread_context* thread; /* Thread context */
#endif
};

/*
 * Default initialization for 'GE_context'.
 */
extern GE_context GE_default_context;

/*
 * Execution context of main thread.
 */
extern GE_context* GE_main_context;

/*
 * Execution context of current thread.
 */
extern GE_context* GE_current_context();

/*
 * Initialization of exception handling.
 */
extern void GE_init_exception(GE_context* context);

/*
 * Pointer to function to create a new exception manager object.
 */
extern EIF_REFERENCE (*GE_new_exception_manager)(EIF_BOOLEAN);

/*
 * Pointer to Eiffel routine EXCEPTION_MANAGER.init_exception_manager.
 */
extern void (*GE_init_exception_manager)(GE_context*, EIF_REFERENCE);

/*
 * Pointer to Eiffel routine EXCEPTION_MANAGER.set_exception_data.
 */
extern void (*GE_set_exception_data)(GE_context*, EIF_REFERENCE, EIF_INTEGER_32, EIF_BOOLEAN, EIF_INTEGER_32, EIF_INTEGER_32, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_INTEGER_32, EIF_BOOLEAN);

/*
 * Exception tag associated with `code'.
 */
extern char* GE_exception_tag(long code);

/*
 * Raise an exception with code 'code'.
 */
extern void GE_raise(long code);

/*
 * Raise an exception with code 'code' and message 'msg'.
 */
extern void GE_raise_with_message(long code, const char* msg);

/*
 * Raise an exception from EXCEPTION_MANAGER.
 */
extern void GE_developer_raise(long code, char* meaning, char* message);

/*
 * Check whether the type id of 'obj' is not in 'type_ids'.
 * If it is, then raise a CAT-call exception. Don't do anything if 'obj' is Void.
 * 'nb' is the number of ids in 'type_ids' and is expected to be >0.
 * 'type_ids' is sorted in increasing order.
 * Return 'obj'.
 */
#define GE_catcall(obj,type_ids,nb) GE_check_catcall((obj),(type_ids),(nb))
EIF_REFERENCE GE_check_catcall(EIF_REFERENCE obj, int type_ids[], int nb);

/*
 * Check whether 'obj' is Void.
 * If it is, then raise a call-on-void-target exception.
 * Return 'obj'.
 */
#define GE_void(obj) (!(obj)?GE_check_void(obj):(obj))
extern EIF_REFERENCE GE_check_void(EIF_REFERENCE obj);

/*
 * Check whether 'ptr' is a null pointer.
 * If it is, then raise a no-more-memory exception.
 * Return 'ptr'.
 */
#define GE_null(ptr) GE_check_null(ptr)
extern void* GE_check_null(void* ptr);

#ifdef EIF_WINDOWS
/*
 * Set default exception handler.
 */
extern void GE_set_windows_exception_filter();
#endif

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
	copyright: "Copyright (c) 2007-2016, Eric Bezault and others"
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

/*
 * System name.
 */
extern char* GE_system_name;

/*
 * Root class name.
 */
extern char* GE_root_class_name;

#ifdef EIF_WINDOWS

#include <windows.h>

/*
 * Used in WEL.
 */
extern HINSTANCE eif_hInstance;
extern HINSTANCE eif_hPrevInstance;
extern LPWSTR eif_lpCmdLine;
extern int eif_nCmdShow;

/*
 * Main entry point when compiling a Windows application.
 * See:
 *    http://en.wikipedia.org/wiki/WinMain
 *    http://msdn2.microsoft.com/en-us/library/ms633559.aspx
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
	copyright: "Copyright (c) 2007-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_GC_H
#define GE_GC_H

#ifdef EIF_BOEHM_GC
/*
 *	Use the Boehm garbage collector.
 *	See:
 *		http://en.wikipedia.org/wiki/Boehm_GC
 *		http://www.hpl.hp.com/personal/Hans_Boehm/gc/
 */

#define GC_IGNORE_WARN
#include "gc.h"
#endif


/*
 * GC initialization.
 */

#ifdef EIF_BOEHM_GC
#define GE_init_gc() GC_INIT(); GC_enable_incremental()
#else /* No GC */
#define GE_init_gc() /* do nothing */
#endif


/*
 * Memory allocation.
 */

/*
 * GE_alloc allocates memory that can contain pointers to collectable objects.
 * Raise an exception when no-more-memory.
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
 * Raise an exception when no-more-memory.
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
 * Raise an exception when no-more-memory.
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
 * Raise an exception when no-more-memory.
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
 * Raise an exception when no-more-memory.
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
 * Raise an exception when no-more-memory.
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
 * Raise an exception when no-more-memory.
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
 * Raise an exception when no-more-memory.
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
 * Raise an exception when no-more-memory.
 */
#ifdef EIF_BOEHM_GC
#define GE_calloc_atomic_uncollectable(nelem, elsize) memset(GE_null(GC_malloc_atomic_uncollectable((nelem) * (elsize))), 0, (nelem) * (elsize))
#else /* No GC */
#define GE_calloc_atomic_uncollectable(nelem, elsize) GE_null(calloc((nelem), (elsize)))
#endif

/*
 * Allocate memory that does not contain pointers to collectable objects.
 * The allocated memory is zeroed.
 * The allocated object is itself not collectable.
 * Do not raise an exception when no-more-memory.
 */
#ifdef EIF_BOEHM_GC
extern void* GE_raw_calloc_atomic_uncollectable(size_t nelem, size_t elsize);
#else /* No GC */
#define GE_raw_calloc_atomic_uncollectable(nelem, elsize) calloc((nelem), (elsize))
#endif

/*
 * Allocate more memory for the given pointer.
 * The reallocated pointer keeps the same properties (e.g. atomic or not, collectable or not).
 * The extra allocated memory is not necessarily zeroed.
 * The allocated object is itself collectable.
 * Raise an exception when no-more-memory.
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
 * Raise an exception when no-more-memory.
 */
extern void* GE_recalloc(void* p, size_t old_nelem, size_t new_nelem, size_t elsize);

/*
 * Allocate more memory for the given pointer.
 * The reallocated pointer keeps the same properties (e.g. atomic or not, collectable or not).
 * The extra allocated memory is zeroed.
 * The allocated object is itself collectable.
 * Do not raise an exception when no-more-memory.
 */
extern void* GE_raw_recalloc(void* p, size_t old_nelem, size_t new_nelem, size_t elsize);

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
 * Dispose
 */

/*
 * Register dispose routine `disp' to be called on object `obj' when it will be collected.
 */
#ifdef EIF_BOEHM_GC
extern void GE_boehm_dispose(void* C, void* disp); /* Call dispose routine `disp' on object `C'. */
#define GE_register_dispose(obj, disp) GC_REGISTER_FINALIZER_NO_ORDER((void*)(obj), (void (*) (void*, void*)) &GE_boehm_dispose, NULL, NULL, NULL)
#else /* No GC */
#define GE_register_dispose(obj, disp) /* do nothing */
#endif


/*
 * Access to objects, useful with GCs which move objects in memory.
 * This is not the case here, since the Boehm GC is not a moving GC.
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

/* ISE_EXCEPTION_MANAGER */
typedef struct S19 T19;

/* GEANT */
typedef struct S22 T22;

/* HASH_TABLE [INTEGER_32, INTEGER_32] */
typedef struct S23 T23;

/* CELL [detachable TUPLE [INTEGER_32, INTEGER_32, INTEGER_32, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, INTEGER_32, BOOLEAN]] */
typedef struct S24 T24;

/* CELL [detachable EXCEPTION] */
typedef struct S25 T25;

/* CELL [NO_MORE_MEMORY] */
typedef struct S26 T26;

/* [attached] TUPLE [INTEGER_32, INTEGER_32, INTEGER_32, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, INTEGER_32, BOOLEAN] */
typedef struct S27 T27;

/* GEANT_PROJECT */
typedef struct S29 T29;

/* GEANT_PROJECT_LOADER */
typedef struct S30 T30;

/* GEANT_PROJECT_OPTIONS */
typedef struct S31 T31;

/* GEANT_PROJECT_VARIABLES */
typedef struct S32 T32;

/* GEANT_TARGET */
typedef struct S33 T33;

/* KL_ARGUMENTS */
typedef struct S34 T34;

/* UT_ERROR_HANDLER */
typedef struct S35 T35;

/* GEANT_VARIABLES */
typedef struct S36 T36;

/* GEANT_PROJECT_ELEMENT */
typedef struct S37 T37;

/* DS_HASH_TABLE [GEANT_TARGET, STRING_8] */
typedef struct S38 T38;

/* SPECIAL [STRING_8] */
typedef struct S39 T39;

/* ARRAY [STRING_8] */
typedef struct S40 T40;

/* GEANT_ARGUMENT_VARIABLES */
typedef struct S41 T41;

/* AP_FLAG */
typedef struct S42 T42;

/* AP_ALTERNATIVE_OPTIONS_LIST */
typedef struct S43 T43;

/* AP_STRING_OPTION */
typedef struct S44 T44;

/* AP_PARSER */
typedef struct S45 T45;

/* AP_ERROR */
typedef struct S47 T47;

/* AP_ERROR_HANDLER */
typedef struct S52 T52;

/* KL_STANDARD_FILES */
typedef struct S53 T53;

/* KL_STDERR_FILE */
typedef struct S54 T54;

/* KL_EXCEPTIONS */
typedef struct S55 T55;

/* UT_VERSION_NUMBER */
typedef struct S56 T56;

/* VOID_TARGET */
typedef struct S58 T58;

/* [attached] TYPE [VOID_TARGET] */
#define T59 EIF_TYPE

/* ROUTINE_FAILURE */
typedef struct S60 T60;

/* [attached] TYPE [ROUTINE_FAILURE] */
#define T61 EIF_TYPE

/* OLD_VIOLATION */
typedef struct S62 T62;

/* [attached] TYPE [OLD_VIOLATION] */
#define T63 EIF_TYPE

/* NO_MORE_MEMORY */
typedef struct S64 T64;

/* INVARIANT_VIOLATION */
typedef struct S65 T65;

/* OPERATING_SYSTEM_SIGNAL_FAILURE */
typedef struct S66 T66;

/* IO_FAILURE */
typedef struct S67 T67;

/* OPERATING_SYSTEM_FAILURE */
typedef struct S68 T68;

/* COM_FAILURE */
typedef struct S69 T69;

/* EIFFEL_RUNTIME_PANIC */
typedef struct S70 T70;

/* PRECONDITION_VIOLATION */
typedef struct S73 T73;

/* POSTCONDITION_VIOLATION */
typedef struct S74 T74;

/* FLOATING_POINT_FAILURE */
typedef struct S75 T75;

/* CHECK_VIOLATION */
typedef struct S76 T76;

/* BAD_INSPECT_VALUE */
typedef struct S77 T77;

/* VARIANT_VIOLATION */
typedef struct S78 T78;

/* LOOP_INVARIANT_VIOLATION */
typedef struct S79 T79;

/* RESCUE_FAILURE */
typedef struct S80 T80;

/* RESUMPTION_FAILURE */
typedef struct S81 T81;

/* CREATE_ON_DEFERRED */
typedef struct S82 T82;

/* EXTERNAL_FAILURE */
typedef struct S83 T83;

/* VOID_ASSIGNED_TO_EXPANDED */
typedef struct S84 T84;

/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE */
typedef struct S85 T85;

/* MISMATCH_FAILURE */
typedef struct S86 T86;

/* DEVELOPER_EXCEPTION */
typedef struct S87 T87;

/* ADDRESS_APPLIED_TO_MELTED_FEATURE */
typedef struct S88 T88;

/* SERIALIZATION_FAILURE */
typedef struct S89 T89;

/* KL_OPERATING_SYSTEM */
typedef struct S90 T90;

/* KL_WINDOWS_FILE_SYSTEM */
typedef struct S92 T92;

/* KL_UNIX_FILE_SYSTEM */
typedef struct S93 T93;

/* PRIMES */
typedef struct S94 T94;

/* SPECIAL [INTEGER_32] */
typedef struct S95 T95;

/* SPECIAL [BOOLEAN] */
typedef struct S96 T96;

/* KL_TEXT_INPUT_FILE */
typedef struct S97 T97;

/* GEANT_PROJECT_PARSER */
typedef struct S98 T98;

/* GEANT_PROJECT_VARIABLE_RESOLVER */
typedef struct S100 T100;

/* UC_STRING_EQUALITY_TESTER */
typedef struct S101 T101;

/* KL_SPECIAL_ROUTINES [STRING_8] */
typedef struct S104 T104;

/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
typedef struct S105 T105;

/* KL_SPECIAL_ROUTINES [INTEGER_32] */
typedef struct S106 T106;

/* KL_STDOUT_FILE */
typedef struct S108 T108;

/* DS_LINKED_LIST_CURSOR [AP_OPTION] */
typedef struct S109 T109;

/* DS_ARRAYED_LIST [detachable STRING_8] */
typedef struct S111 T111;

/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8] */
typedef struct S112 T112;

/* AP_DISPLAY_HELP_FLAG */
typedef struct S113 T113;

/* DS_ARRAYED_LIST [AP_OPTION] */
typedef struct S114 T114;

/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S115 T115;

/* KL_STRING_ROUTINES */
typedef struct S116 T116;

/* TYPED_POINTER [ANY] */
typedef struct S117 T117;
extern T0* GE_boxed117(T117 a1);
typedef struct Sb117 Tb117;

/* MANAGED_POINTER */
typedef struct S118 T118;

/* FILE_INFO */
typedef struct S119 T119;

/* DS_HASH_TABLE [STRING_8, STRING_8] */
typedef struct S123 T123;

/* ARGUMENTS_32 */
typedef struct S124 T124;

/* IMMUTABLE_STRING_32 */
typedef struct S125 T125;

/* UTF_CONVERTER */
typedef struct S127 T127;
extern T0* GE_boxed127(T127 a1);
typedef struct Sb127 Tb127;

/* CELL [INTEGER_32] */
typedef struct S128 T128;

/* C_STRING */
typedef struct S129 T129;

/* EXECUTION_ENVIRONMENT */
typedef struct S130 T130;

/* KL_ANY_ROUTINES */
typedef struct S131 T131;

/* KL_PATHNAME */
typedef struct S133 T133;

/* detachable KL_LINKABLE [CHARACTER_8] */
typedef struct S135 T135;

/* XM_EXPAT_PARSER_FACTORY */
typedef struct S137 T137;

/* XM_EIFFEL_PARSER */
typedef struct S139 T139;

/* XM_TREE_CALLBACKS_PIPE */
typedef struct S140 T140;

/* XM_CALLBACKS_TO_TREE_FILTER */
typedef struct S143 T143;

/* XM_DOCUMENT */
typedef struct S144 T144;

/* XM_ELEMENT */
typedef struct S145 T145;

/* XM_STOP_ON_ERROR_FILTER */
typedef struct S146 T146;

/* XM_POSITION_TABLE */
typedef struct S147 T147;

/* KL_EXECUTION_ENVIRONMENT */
typedef struct S150 T150;

/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES] */
typedef struct S151 T151;

/* DS_ARRAYED_STACK [GEANT_VARIABLES] */
typedef struct S152 T152;

/* DS_ARRAYED_LIST_CURSOR [AP_OPTION] */
typedef struct S153 T153;

/* SPECIAL [AP_OPTION] */
typedef struct S155 T155;

/* KL_SPECIAL_ROUTINES [AP_OPTION] */
typedef struct S156 T156;

/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S157 T157;

/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S158 T158;

/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S159 T159;

/* UC_STRING */
typedef struct S160 T160;

/* PLATFORM */
typedef struct S161 T161;

/* READABLE_STRING_32 */
typedef struct S162 T162;

/* SPECIAL [NATURAL_8] */
typedef struct S163 T163;

/* TYPED_POINTER [SPECIAL [NATURAL_8]] */
typedef struct S164 T164;
extern T0* GE_boxed164(T164 a1);
typedef struct Sb164 Tb164;

/* STRING_TO_INTEGER_CONVERTOR */
typedef struct S166 T166;

/* DS_LINKED_LIST [XM_ELEMENT] */
typedef struct S168 T168;

/* DS_LINKED_LIST_CURSOR [XM_ELEMENT] */
typedef struct S169 T169;

/* GEANT_INHERIT_ELEMENT */
typedef struct S170 T170;

/* GEANT_INHERIT */
typedef struct S171 T171;

/* SPECIAL [GEANT_TARGET] */
typedef struct S172 T172;

/* KL_SPECIAL_ROUTINES [GEANT_TARGET] */
typedef struct S175 T175;

/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8] */
typedef struct S176 T176;

/* STD_FILES */
typedef struct S177 T177;

/* EXCEPTIONS */
typedef struct S178 T178;

/* SPECIAL [IMMUTABLE_STRING_32] */
typedef struct S179 T179;

/* ARRAY [IMMUTABLE_STRING_32] */
typedef struct S180 T180;

/* NATIVE_STRING */
typedef struct S181 T181;

/* XM_EIFFEL_SCANNER */
typedef struct S183 T183;

/* XM_DEFAULT_POSITION */
typedef struct S184 T184;

/* DS_BILINKED_LIST [XM_POSITION] */
typedef struct S186 T186;

/* DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
typedef struct S187 T187;

/* XM_CALLBACKS_NULL */
typedef struct S188 T188;

/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S189 T189;

/* XM_NULL_EXTERNAL_RESOLVER */
typedef struct S191 T191;

/* XM_DTD_CALLBACKS_NULL */
typedef struct S193 T193;

/* KL_SPECIAL_ROUTINES [detachable ANY] */
typedef struct S194 T194;

/* SPECIAL [detachable ANY] */
typedef struct S195 T195;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
typedef struct S196 T196;

/* XM_EIFFEL_PARSER_NAME */
typedef struct S197 T197;

/* SPECIAL [XM_EIFFEL_PARSER_NAME] */
typedef struct S198 T198;

/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S199 T199;

/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
typedef struct S200 T200;

/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S201 T201;

/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
typedef struct S202 T202;

/* XM_DTD_EXTERNAL_ID */
typedef struct S203 T203;

/* SPECIAL [XM_DTD_EXTERNAL_ID] */
typedef struct S204 T204;

/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
typedef struct S205 T205;

/* XM_DTD_ELEMENT_CONTENT */
typedef struct S206 T206;

/* SPECIAL [XM_DTD_ELEMENT_CONTENT] */
typedef struct S207 T207;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S208 T208;

/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S209 T209;

/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S210 T210;

/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S211 T211;

/* XM_DTD_ATTRIBUTE_CONTENT */
typedef struct S212 T212;

/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S213 T213;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
typedef struct S214 T214;

/* DS_BILINKED_LIST [STRING_8] */
typedef struct S215 T215;

/* SPECIAL [DS_BILINKED_LIST [STRING_8]] */
typedef struct S216 T216;

/* KL_SPECIAL_ROUTINES [BOOLEAN] */
typedef struct S217 T217;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
typedef struct S218 T218;

/* XM_EIFFEL_DECLARATION */
typedef struct S219 T219;

/* SPECIAL [XM_EIFFEL_DECLARATION] */
typedef struct S220 T220;

/* XM_EIFFEL_ENTITY_DEF */
typedef struct S223 T223;

/* XM_EIFFEL_SCANNER_DTD */
typedef struct S224 T224;

/* XM_EIFFEL_PE_ENTITY_DEF */
typedef struct S226 T226;

/* XM_NAMESPACE_RESOLVER */
typedef struct S227 T227;

/* SPECIAL [XM_CALLBACKS_FILTER] */
typedef struct S228 T228;

/* ARRAY [XM_CALLBACKS_FILTER] */
typedef struct S229 T229;

/* DS_HASH_SET [XM_NAMESPACE] */
typedef struct S230 T230;

/* XM_NAMESPACE */
typedef struct S231 T231;

/* XM_LINKED_LIST [XM_DOCUMENT_NODE] */
typedef struct S232 T232;

/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE] */
typedef struct S236 T236;

/* XM_LINKED_LIST [XM_ELEMENT_NODE] */
typedef struct S239 T239;

/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S241 T241;

/* SPECIAL [GEANT_ARGUMENT_VARIABLES] */
typedef struct S242 T242;

/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES] */
typedef struct S243 T243;

/* SPECIAL [GEANT_VARIABLES] */
typedef struct S244 T244;

/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES] */
typedef struct S245 T245;

/* DS_ARRAYED_STACK [GEANT_TARGET] */
typedef struct S247 T247;

/* GEANT_TASK_FACTORY */
typedef struct S248 T248;

/* GEANT_PARENT */
typedef struct S249 T249;

/* DS_ARRAYED_LIST [GEANT_PARENT] */
typedef struct S251 T251;

/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT] */
typedef struct S252 T252;

/* GEANT_INTERPRETING_ELEMENT */
typedef struct S253 T253;

/* GEANT_ARGUMENT_ELEMENT */
typedef struct S254 T254;

/* GEANT_LOCAL_ELEMENT */
typedef struct S255 T255;

/* GEANT_GLOBAL_ELEMENT */
typedef struct S256 T256;

/* XM_ATTRIBUTE */
typedef struct S257 T257;

/* GEANT_GROUP */
typedef struct S258 T258;

/* [attached] TYPE [STRING_8] */
#define T260 EIF_TYPE

/* TYPED_POINTER [NATURAL_16] */
typedef struct S262 T262;
extern T0* GE_boxed262(T262 a1);
typedef struct Sb262 Tb262;

/* TYPED_POINTER [NATURAL_8] */
typedef struct S263 T263;
extern T0* GE_boxed263(T263 a1);
typedef struct Sb263 Tb263;

/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER */
typedef struct S264 T264;

/* ARRAY [INTEGER_32] */
typedef struct S265 T265;

/* UC_UTF8_ROUTINES */
typedef struct S266 T266;

/* UC_UTF8_STRING */
typedef struct S267 T267;

/* XM_EIFFEL_INPUT_STREAM */
typedef struct S268 T268;

/* KL_INTEGER_ROUTINES */
typedef struct S269 T269;

/* KL_PLATFORM */
typedef struct S270 T270;

/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE] */
typedef struct S271 T271;

/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S272 T272;

/* DS_PAIR [XM_POSITION, XM_NODE] */
typedef struct S273 T273;

/* INTEGER_OVERFLOW_CHECKER */
typedef struct S274 T274;

/* detachable DS_LINKABLE [XM_ELEMENT] */
typedef struct S275 T275;

/* GEANT_PARENT_ELEMENT */
typedef struct S276 T276;

/* XM_EIFFEL_CHARACTER_ENTITY */
typedef struct S278 T278;

/* YY_BUFFER */
typedef struct S279 T279;

/* YY_FILE_BUFFER */
typedef struct S280 T280;

/* detachable DS_BILINKABLE [XM_POSITION] */
typedef struct S284 T284;

/* DS_BILINKED_LIST_CURSOR [XM_POSITION] */
typedef struct S285 T285;

/* detachable DS_LINKABLE [XM_EIFFEL_SCANNER] */
typedef struct S286 T286;

/* SPECIAL [XM_EIFFEL_ENTITY_DEF] */
typedef struct S287 T287;

/* detachable DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S290 T290;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
typedef struct S291 T291;

/* detachable KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
typedef struct S293 T293;

/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
typedef struct S294 T294;

/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
typedef struct S295 T295;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S296 T296;

/* detachable DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S297 T297;

/* DS_LINKED_LIST [STRING_8] */
typedef struct S298 T298;

/* DS_BILINKED_LIST_CURSOR [STRING_8] */
typedef struct S299 T299;

/* detachable DS_BILINKABLE [STRING_8] */
typedef struct S300 T300;

/* XM_NAMESPACE_RESOLVER_CONTEXT */
typedef struct S301 T301;

/* DS_LINKED_QUEUE [STRING_8] */
typedef struct S303 T303;

/* detachable KL_EQUALITY_TESTER [XM_NAMESPACE] */
typedef struct S304 T304;

/* DS_HASH_SET_CURSOR [XM_NAMESPACE] */
typedef struct S305 T305;

/* KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
typedef struct S306 T306;

/* SPECIAL [XM_NAMESPACE] */
typedef struct S307 T307;

/* detachable DS_LINKABLE [XM_DOCUMENT_NODE] */
typedef struct S308 T308;

/* GEANT_STRING_INTERPRETER */
typedef struct S312 T312;

/* GEANT_NAME_VALUE_ELEMENT */
typedef struct S314 T314;

/* [attached] TYPE [GEANT_TARGET] */
#define T316 EIF_TYPE

/* KL_ARRAY_ROUTINES [detachable STRING_8] */
typedef struct S318 T318;

/* AP_OPTION_COMPARATOR */
typedef struct S319 T319;

/* DS_QUICK_SORTER [AP_OPTION] */
typedef struct S320 T320;

/* ST_WORD_WRAPPER */
typedef struct S322 T322;

/* XM_COMMENT */
typedef struct S324 T324;

/* XM_PROCESSING_INSTRUCTION */
typedef struct S325 T325;

/* XM_CHARACTER_DATA */
typedef struct S326 T326;

/* CONSOLE */
typedef struct S327 T327;

/* KL_ARRAY_ROUTINES [INTEGER_32] */
typedef struct S328 T328;

/* detachable DS_LINKABLE [XM_ELEMENT_NODE] */
typedef struct S330 T330;

/* detachable DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S331 T331;

/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
typedef struct S332 T332;

/* GEANT_GEC_TASK */
typedef struct S333 T333;

/* [attached] TUPLE [XM_ELEMENT] */
typedef struct S334 T334;

/* detachable TUPLE */
typedef struct S335 T335;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEC_TASK] */
typedef struct S336 T336;

/* [attached] TUPLE [GEANT_TASK_FACTORY] */
typedef struct S337 T337;

/* GEANT_ISE_TASK */
typedef struct S339 T339;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_ISE_TASK] */
typedef struct S340 T340;

/* GEANT_EXEC_TASK */
typedef struct S341 T341;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_EXEC_TASK] */
typedef struct S342 T342;

/* GEANT_LCC_TASK */
typedef struct S343 T343;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_LCC_TASK] */
typedef struct S344 T344;

/* GEANT_SET_TASK */
typedef struct S345 T345;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_SET_TASK] */
typedef struct S346 T346;

/* GEANT_UNSET_TASK */
typedef struct S347 T347;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_UNSET_TASK] */
typedef struct S348 T348;

/* GEANT_GEXACE_TASK */
typedef struct S349 T349;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEXACE_TASK] */
typedef struct S350 T350;

/* GEANT_GELEX_TASK */
typedef struct S351 T351;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GELEX_TASK] */
typedef struct S352 T352;

/* GEANT_GEYACC_TASK */
typedef struct S353 T353;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEYACC_TASK] */
typedef struct S354 T354;

/* GEANT_GEPP_TASK */
typedef struct S355 T355;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEPP_TASK] */
typedef struct S356 T356;

/* GEANT_GETEST_TASK */
typedef struct S357 T357;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GETEST_TASK] */
typedef struct S358 T358;

/* GEANT_GEANT_TASK */
typedef struct S359 T359;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEANT_TASK] */
typedef struct S360 T360;

/* GEANT_ECHO_TASK */
typedef struct S361 T361;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_ECHO_TASK] */
typedef struct S362 T362;

/* GEANT_MKDIR_TASK */
typedef struct S363 T363;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_MKDIR_TASK] */
typedef struct S364 T364;

/* GEANT_DELETE_TASK */
typedef struct S365 T365;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_DELETE_TASK] */
typedef struct S366 T366;

/* GEANT_COPY_TASK */
typedef struct S367 T367;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_COPY_TASK] */
typedef struct S368 T368;

/* GEANT_MOVE_TASK */
typedef struct S369 T369;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_MOVE_TASK] */
typedef struct S370 T370;

/* GEANT_SETENV_TASK */
typedef struct S371 T371;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_SETENV_TASK] */
typedef struct S372 T372;

/* GEANT_XSLT_TASK */
typedef struct S373 T373;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_XSLT_TASK] */
typedef struct S374 T374;

/* GEANT_OUTOFDATE_TASK */
typedef struct S375 T375;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_OUTOFDATE_TASK] */
typedef struct S376 T376;

/* GEANT_EXIT_TASK */
typedef struct S377 T377;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_EXIT_TASK] */
typedef struct S378 T378;

/* GEANT_PRECURSOR_TASK */
typedef struct S379 T379;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_PRECURSOR_TASK] */
typedef struct S380 T380;

/* GEANT_AVAILABLE_TASK */
typedef struct S381 T381;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_AVAILABLE_TASK] */
typedef struct S382 T382;

/* GEANT_INPUT_TASK */
typedef struct S383 T383;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_INPUT_TASK] */
typedef struct S384 T384;

/* GEANT_REPLACE_TASK */
typedef struct S385 T385;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_REPLACE_TASK] */
typedef struct S386 T386;

/* KL_SPECIAL_ROUTINES [GEANT_PARENT] */
typedef struct S387 T387;

/* SPECIAL [GEANT_PARENT] */
typedef struct S388 T388;

/* UC_UNICODE_ROUTINES */
typedef struct S390 T390;

/* DS_LINKED_QUEUE [CHARACTER_8] */
typedef struct S392 T392;

/* UC_UTF16_ROUTINES */
typedef struct S393 T393;

/* SPECIAL [NATURAL_64] */
typedef struct S394 T394;

/* GEANT_RENAME_ELEMENT */
typedef struct S395 T395;

/* GEANT_REDEFINE_ELEMENT */
typedef struct S396 T396;

/* GEANT_SELECT_ELEMENT */
typedef struct S397 T397;

/* GEANT_RENAME */
typedef struct S398 T398;

/* DS_HASH_TABLE [GEANT_RENAME, STRING_8] */
typedef struct S399 T399;

/* GEANT_REDEFINE */
typedef struct S400 T400;

/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8] */
typedef struct S401 T401;

/* GEANT_SELECT */
typedef struct S402 T402;

/* DS_HASH_TABLE [GEANT_SELECT, STRING_8] */
typedef struct S403 T403;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
typedef struct S404 T404;

/* attached DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
typedef struct S405 T405;

/* DS_LINKED_LIST_CURSOR [STRING_8] */
typedef struct S406 T406;

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S408 T408;

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S409 T409;

/* detachable DS_LINKABLE [STRING_8] */
typedef struct S410 T410;

/* KL_DIRECTORY */
typedef struct S411 T411;

/* ST_SPLITTER */
typedef struct S412 T412;

/* KL_STRING_INPUT_STREAM */
typedef struct S413 T413;

/* KL_CHARACTER_BUFFER */
typedef struct S414 T414;

/* KL_ARRAY [detachable STRING_8] */
typedef struct S415 T415;

/* SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
typedef struct S416 T416;

/* KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
typedef struct S419 T419;

/* DS_HASH_TABLE_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
typedef struct S420 T420;

/* GEANT_GEC_COMMAND */
typedef struct S421 T421;

/* DS_CELL [PROCEDURE [ANY, TUPLE]] */
typedef struct S422 T422;

/* [attached] PROCEDURE [[attached] NONE, [attached] TUPLE] */
typedef struct S423 T423;

/* [attached] TUPLE [GEANT_GEC_TASK] */
typedef struct S424 T424;

/* GEANT_ISE_COMMAND */
typedef struct S425 T425;

/* [attached] TUPLE [GEANT_ISE_TASK] */
typedef struct S426 T426;

/* GEANT_FILESET_ELEMENT */
typedef struct S427 T427;

/* GEANT_EXEC_COMMAND */
typedef struct S428 T428;

/* GEANT_STRING_PROPERTY */
typedef struct S429 T429;

/* [attached] FUNCTION [GEANT_INTERPRETING_ELEMENT, [attached] TUPLE, STRING_8] */
typedef struct S430 T430;

/* [attached] TUPLE [GEANT_INTERPRETING_ELEMENT, STRING_8] */
typedef struct S431 T431;

/* GEANT_BOOLEAN_PROPERTY */
typedef struct S432 T432;

/* GEANT_FILESET */
typedef struct S433 T433;

/* [attached] TUPLE [GEANT_EXEC_TASK] */
typedef struct S434 T434;

/* GEANT_LCC_COMMAND */
typedef struct S435 T435;

/* [attached] TUPLE [GEANT_LCC_TASK] */
typedef struct S436 T436;

/* GEANT_SET_COMMAND */
typedef struct S437 T437;

/* [attached] TUPLE [GEANT_SET_TASK] */
typedef struct S438 T438;

/* GEANT_UNSET_COMMAND */
typedef struct S439 T439;

/* [attached] TUPLE [GEANT_UNSET_TASK] */
typedef struct S440 T440;

/* GEANT_DEFINE_ELEMENT */
typedef struct S441 T441;

/* GEANT_GEXACE_COMMAND */
typedef struct S442 T442;

/* [attached] TUPLE [GEANT_GEXACE_TASK] */
typedef struct S443 T443;

/* GEANT_GELEX_COMMAND */
typedef struct S444 T444;

/* [attached] TUPLE [GEANT_GELEX_TASK] */
typedef struct S445 T445;

/* GEANT_GEYACC_COMMAND */
typedef struct S446 T446;

/* [attached] TUPLE [GEANT_GEYACC_TASK] */
typedef struct S447 T447;

/* GEANT_GEPP_COMMAND */
typedef struct S448 T448;

/* [attached] TUPLE [GEANT_GEPP_TASK] */
typedef struct S449 T449;

/* GEANT_GETEST_COMMAND */
typedef struct S450 T450;

/* [attached] TUPLE [GEANT_GETEST_TASK] */
typedef struct S451 T451;

/* GEANT_GEANT_COMMAND */
typedef struct S452 T452;

/* [attached] TUPLE [GEANT_GEANT_TASK] */
typedef struct S453 T453;

/* GEANT_ECHO_COMMAND */
typedef struct S454 T454;

/* [attached] TUPLE [GEANT_ECHO_TASK] */
typedef struct S455 T455;

/* GEANT_MKDIR_COMMAND */
typedef struct S456 T456;

/* [attached] TUPLE [GEANT_MKDIR_TASK] */
typedef struct S457 T457;

/* GEANT_DIRECTORYSET_ELEMENT */
typedef struct S458 T458;

/* GEANT_DELETE_COMMAND */
typedef struct S459 T459;

/* GEANT_DIRECTORYSET */
typedef struct S460 T460;

/* [attached] TUPLE [GEANT_DELETE_TASK] */
typedef struct S461 T461;

/* GEANT_COPY_COMMAND */
typedef struct S462 T462;

/* [attached] TUPLE [GEANT_COPY_TASK] */
typedef struct S463 T463;

/* GEANT_MOVE_COMMAND */
typedef struct S464 T464;

/* [attached] TUPLE [GEANT_MOVE_TASK] */
typedef struct S465 T465;

/* GEANT_SETENV_COMMAND */
typedef struct S466 T466;

/* [attached] TUPLE [GEANT_SETENV_TASK] */
typedef struct S467 T467;

/* DS_PAIR [STRING_8, STRING_8] */
typedef struct S468 T468;

/* GEANT_XSLT_COMMAND */
typedef struct S469 T469;

/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S470 T470;

/* [attached] TUPLE [GEANT_XSLT_TASK] */
typedef struct S471 T471;

/* GEANT_OUTOFDATE_COMMAND */
typedef struct S472 T472;

/* [attached] TUPLE [GEANT_OUTOFDATE_TASK] */
typedef struct S473 T473;

/* GEANT_EXIT_COMMAND */
typedef struct S474 T474;

/* [attached] TUPLE [GEANT_EXIT_TASK] */
typedef struct S475 T475;

/* GEANT_PRECURSOR_COMMAND */
typedef struct S476 T476;

/* [attached] TUPLE [GEANT_PRECURSOR_TASK] */
typedef struct S477 T477;

/* GEANT_AVAILABLE_COMMAND */
typedef struct S478 T478;

/* [attached] TUPLE [GEANT_AVAILABLE_TASK] */
typedef struct S479 T479;

/* GEANT_INPUT_COMMAND */
typedef struct S480 T480;

/* [attached] TUPLE [GEANT_INPUT_TASK] */
typedef struct S481 T481;

/* GEANT_REPLACE_COMMAND */
typedef struct S482 T482;

/* [attached] TUPLE [GEANT_REPLACE_TASK] */
typedef struct S483 T483;

/* SPECIAL [ARRAY [INTEGER_32]] */
typedef struct S484 T484;

/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
typedef struct S485 T485;

/* detachable DS_LINKABLE [CHARACTER_8] */
typedef struct S486 T486;

/* detachable KL_EQUALITY_TESTER [GEANT_RENAME] */
typedef struct S487 T487;

/* KL_SPECIAL_ROUTINES [GEANT_RENAME] */
typedef struct S489 T489;

/* SPECIAL [GEANT_RENAME] */
typedef struct S490 T490;

/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8] */
typedef struct S491 T491;

/* detachable KL_EQUALITY_TESTER [GEANT_REDEFINE] */
typedef struct S492 T492;

/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE] */
typedef struct S494 T494;

/* SPECIAL [GEANT_REDEFINE] */
typedef struct S495 T495;

/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8] */
typedef struct S496 T496;

/* detachable KL_EQUALITY_TESTER [GEANT_SELECT] */
typedef struct S497 T497;

/* KL_SPECIAL_ROUTINES [GEANT_SELECT] */
typedef struct S499 T499;

/* SPECIAL [GEANT_SELECT] */
typedef struct S500 T500;

/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8] */
typedef struct S501 T501;

/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S502 T502;

/* TYPE [DEVELOPER_EXCEPTION] */
#define T503 EIF_TYPE

/* [attached] TYPE [INTEGER_32] */
#define T508 EIF_TYPE

/* DS_HASH_SET [INTEGER_32] */
typedef struct S509 T509;

/* GEANT_MAP_ELEMENT */
typedef struct S512 T512;

/* GEANT_MAP */
typedef struct S513 T513;

/* DS_HASH_SET [GEANT_FILESET_ENTRY] */
typedef struct S516 T516;

/* DS_HASH_SET [STRING_8] */
typedef struct S518 T518;

/* LX_DFA_WILDCARD */
typedef struct S520 T520;

/* DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8]]] */
typedef struct S522 T522;

/* [attached] TUPLE [STRING_8] */
typedef struct S523 T523;

/* [attached] PROCEDURE [[attached] NONE, [attached] TUPLE [STRING_8]] */
typedef struct S524 T524;

/* [attached] TUPLE [GEANT_ECHO_COMMAND] */
typedef struct S525 T525;

/* DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]]] */
typedef struct S527 T527;

/* KL_TEXT_OUTPUT_FILE */
typedef struct S528 T528;

/* [attached] TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN] */
typedef struct S529 T529;

/* [attached] PROCEDURE [[attached] NONE, [attached] TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]] */
typedef struct S530 T530;

/* [attached] TUPLE [GEANT_MKDIR_COMMAND] */
typedef struct S532 T532;

/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S533 T533;

/* SPECIAL [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S534 T534;

/* DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S535 T535;

/* DS_CELL [FUNCTION [ANY, TUPLE [STRING_8], BOOLEAN]] */
typedef struct S536 T536;

/* [attached] PREDICATE [[attached] NONE, [attached] TUPLE [STRING_8]] */
typedef struct S537 T537;

/* [attached] TUPLE [GEANT_AVAILABLE_COMMAND] */
typedef struct S538 T538;

/* DP_SHELL_COMMAND */
typedef struct S540 T540;

/* DS_CELL [BOOLEAN] */
typedef struct S541 T541;

/* DS_HASH_SET_CURSOR [STRING_8] */
typedef struct S543 T543;

/* GEANT_FILESET_ENTRY */
typedef struct S544 T544;

/* KL_BOOLEAN_ROUTINES */
typedef struct S545 T545;

/* ARRAY [BOOLEAN] */
typedef struct S546 T546;

/* GEANT_VARIABLES_VARIABLE_RESOLVER */
typedef struct S547 T547;

/* RX_PCRE_REGULAR_EXPRESSION */
typedef struct S548 T548;

/* KL_STRING_EQUALITY_TESTER */
typedef struct S549 T549;

/* KL_STDIN_FILE */
typedef struct S550 T550;

/* ARRAY [GEANT_VARIABLES] */
typedef struct S551 T551;

/* DS_HASH_SET_CURSOR [INTEGER_32] */
typedef struct S552 T552;

/* detachable KL_EQUALITY_TESTER [INTEGER_32] */
typedef struct S553 T553;

/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY] */
typedef struct S554 T554;

/* SPECIAL [GEANT_FILESET_ENTRY] */
typedef struct S555 T555;

/* detachable KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY] */
typedef struct S556 T556;

/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY] */
typedef struct S557 T557;

/* [attached] TYPE [GEANT_FILESET_ENTRY] */
#define T558 EIF_TYPE

/* LX_WILDCARD_PARSER */
typedef struct S559 T559;

/* LX_DESCRIPTION */
typedef struct S560 T560;

/* LX_FULL_DFA */
typedef struct S561 T561;

/* KL_NULL_TEXT_OUTPUT_STREAM */
typedef struct S563 T563;

/* RX_BYTE_CODE */
typedef struct S568 T568;

/* RX_CHARACTER_SET */
typedef struct S569 T569;

/* RX_CASE_MAPPING */
typedef struct S570 T570;

/* SPECIAL [RX_CHARACTER_SET] */
typedef struct S572 T572;

/* ARRAY [RX_CHARACTER_SET] */
typedef struct S573 T573;

/* DS_ARRAYED_LIST [LX_RULE] */
typedef struct S574 T574;

/* LX_START_CONDITIONS */
typedef struct S575 T575;

/* LX_ACTION_FACTORY */
typedef struct S576 T576;

/* DS_ARRAYED_STACK [INTEGER_32] */
typedef struct S577 T577;

/* LX_SYMBOL_CLASS */
typedef struct S578 T578;

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8] */
typedef struct S579 T579;

/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS] */
typedef struct S580 T580;

/* SPECIAL [LX_SYMBOL_CLASS] */
typedef struct S581 T581;

/* KL_SPECIAL_ROUTINES [LX_NFA] */
typedef struct S582 T582;

/* LX_NFA */
typedef struct S583 T583;

/* SPECIAL [LX_NFA] */
typedef struct S584 T584;

/* LX_EQUIVALENCE_CLASSES */
typedef struct S585 T585;

/* LX_RULE */
typedef struct S586 T586;

/* UT_SYNTAX_ERROR */
typedef struct S587 T587;

/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
typedef struct S588 T588;

/* LX_UNRECOGNIZED_RULE_ERROR */
typedef struct S589 T589;

/* LX_MISSING_QUOTE_ERROR */
typedef struct S590 T590;

/* LX_BAD_CHARACTER_CLASS_ERROR */
typedef struct S591 T591;

/* LX_BAD_CHARACTER_ERROR */
typedef struct S592 T592;

/* LX_FULL_AND_META_ERROR */
typedef struct S593 T593;

/* LX_FULL_AND_REJECT_ERROR */
typedef struct S594 T594;

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR */
typedef struct S595 T595;

/* LX_CHARACTER_OUT_OF_RANGE_ERROR */
typedef struct S596 T596;

/* SPECIAL [LX_RULE] */
typedef struct S597 T597;

/* ARRAY [LX_RULE] */
typedef struct S598 T598;

/* LX_DFA_STATE */
typedef struct S599 T599;

/* DS_ARRAYED_LIST [LX_NFA_STATE] */
typedef struct S600 T600;

/* DS_ARRAYED_LIST [LX_DFA_STATE] */
typedef struct S601 T601;

/* LX_SYMBOL_PARTITIONS */
typedef struct S602 T602;

/* KL_ARRAY_ROUTINES [LX_RULE] */
typedef struct S603 T603;

/* LX_START_CONDITION */
typedef struct S604 T604;

/* LX_TRANSITION_TABLE [LX_DFA_STATE] */
typedef struct S605 T605;

/* DS_ARRAYED_LIST [LX_NFA] */
typedef struct S606 T606;

/* DS_HASH_TABLE [LX_NFA, INTEGER_32] */
typedef struct S607 T607;

/* LX_NFA_STATE */
typedef struct S608 T608;

/* KL_BINARY_INPUT_FILE */
typedef struct S609 T609;

/* KL_BINARY_OUTPUT_FILE */
typedef struct S610 T610;

/* PATH */
typedef struct S615 T615;

/* RAW_FILE */
typedef struct S616 T616;

/* DIRECTORY */
typedef struct S617 T617;

/* ARRAYED_LIST [READABLE_STRING_32] */
typedef struct S618 T618;

/* [attached] TUPLE [ARRAYED_LIST [READABLE_STRING_32]] */
typedef struct S619 T619;

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR */
typedef struct S620 T620;

/* KL_SPECIAL_ROUTINES [LX_RULE] */
typedef struct S621 T621;

/* DS_ARRAYED_LIST_CURSOR [LX_RULE] */
typedef struct S622 T622;

/* SPECIAL [LX_START_CONDITION] */
typedef struct S623 T623;

/* KL_SPECIAL_ROUTINES [LX_START_CONDITION] */
typedef struct S624 T624;

/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION] */
typedef struct S625 T625;

/* DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
typedef struct S626 T626;

/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE] */
typedef struct S629 T629;

/* LX_EPSILON_TRANSITION [LX_NFA_STATE] */
typedef struct S631 T631;

/* LX_SYMBOL_TRANSITION [LX_NFA_STATE] */
typedef struct S633 T633;

/* DS_BILINKABLE [INTEGER_32] */
typedef struct S634 T634;

/* SPECIAL [DS_BILINKABLE [INTEGER_32]] */
typedef struct S635 T635;

/* ARRAY [DS_BILINKABLE [INTEGER_32]] */
typedef struct S636 T636;

/* LX_ACTION */
typedef struct S638 T638;

/* DS_BUBBLE_SORTER [LX_NFA_STATE] */
typedef struct S639 T639;

/* DS_BUBBLE_SORTER [LX_RULE] */
typedef struct S641 T641;

/* SPECIAL [LX_NFA_STATE] */
typedef struct S643 T643;

/* KL_SPECIAL_ROUTINES [LX_NFA_STATE] */
typedef struct S645 T645;

/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE] */
typedef struct S646 T646;

/* SPECIAL [LX_DFA_STATE] */
typedef struct S648 T648;

/* KL_SPECIAL_ROUTINES [LX_DFA_STATE] */
typedef struct S649 T649;

/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE] */
typedef struct S650 T650;

/* KL_ARRAY [LX_RULE] */
typedef struct S651 T651;

/* ARRAY [detachable LX_DFA_STATE] */
typedef struct S652 T652;

/* KL_ARRAY_ROUTINES [detachable LX_DFA_STATE] */
typedef struct S653 T653;

/* DS_ARRAYED_LIST_CURSOR [LX_NFA] */
typedef struct S654 T654;

/* DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32] */
typedef struct S656 T656;

/* STRING_8_SEARCHER */
typedef struct S657 T657;

/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32] */
typedef struct S658 T658;

/* [attached] TYPE [BOOLEAN] */
#define T659 EIF_TYPE

/* DS_SHELL_SORTER [INTEGER_32] */
typedef struct S662 T662;

/* KL_COMPARABLE_COMPARATOR [LX_RULE] */
typedef struct S664 T664;

/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE] */
typedef struct S667 T667;

/* ARRAYED_LIST [READABLE_STRING_GENERAL] */
typedef struct S670 T670;

/* [attached] TUPLE [ARRAYED_LIST [READABLE_STRING_GENERAL]] */
typedef struct S671 T671;

/* SPECIAL [READABLE_STRING_32] */
typedef struct S672 T672;

/* KL_COMPARABLE_COMPARATOR [INTEGER_32] */
typedef struct S673 T673;

/* SPECIAL [NATIVE_STRING] */
typedef struct S676 T676;

/* SPECIAL [READABLE_STRING_GENERAL] */
typedef struct S677 T677;

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
struct S127 {
	char dummy;
};

/* Struct for boxed version of type UTF_CONVERTER */
struct Sb127 {
	int id;
	T127 z1; /* item */
};

/* Struct for type TYPED_POINTER [NATURAL_8] */
struct S263 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for boxed version of type TYPED_POINTER [NATURAL_8] */
struct Sb263 {
	int id;
	T263 z1; /* item */
};

/* Struct for type TYPED_POINTER [NATURAL_16] */
struct S262 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for boxed version of type TYPED_POINTER [NATURAL_16] */
struct Sb262 {
	int id;
	T262 z1; /* item */
};

/* Struct for type TYPED_POINTER [SPECIAL [NATURAL_8]] */
struct S164 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for boxed version of type TYPED_POINTER [SPECIAL [NATURAL_8]] */
struct Sb164 {
	int id;
	T164 z1; /* item */
};

/* Struct for type TYPED_POINTER [ANY] */
struct S117 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for boxed version of type TYPED_POINTER [ANY] */
struct Sb117 {
	int id;
	T117 z1; /* item */
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

/* Struct for type ISE_EXCEPTION_MANAGER */
struct S19 {
	int id;
};

/* Struct for type GEANT */
struct S22 {
	int id;
	T0* a1; /* error_handler */
	T1 a2; /* verbose */
	T1 a3; /* debug_mode */
	T1 a4; /* no_exec */
	T0* a5; /* build_filename */
	T0* a6; /* start_target_name */
	T1 a7; /* show_target_info */
};

/* Struct for type HASH_TABLE [INTEGER_32, INTEGER_32] */
struct S23 {
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
	T6 a10; /* found_item */
	T1 a11; /* has_default */
	T6 a12; /* item_position */
	T6 a13; /* ht_lowest_deleted_position */
	T6 a14; /* ht_deleted_item */
	T6 a15; /* ht_deleted_key */
	T1 a16; /* object_comparison */
};

/* Struct for type CELL [detachable TUPLE [INTEGER_32, INTEGER_32, INTEGER_32, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, INTEGER_32, BOOLEAN]] */
struct S24 {
	int id;
	T0* a1; /* item */
};

/* Struct for type CELL [detachable EXCEPTION] */
struct S25 {
	int id;
	T0* a1; /* item */
};

/* Struct for type CELL [NO_MORE_MEMORY] */
struct S26 {
	int id;
	T0* a1; /* item */
};

/* Struct for type [attached] TUPLE [INTEGER_32, INTEGER_32, INTEGER_32, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, INTEGER_32, BOOLEAN] */
struct S27 {
	int id;
	T6 z1;
	T6 z2;
	T6 z3;
	T0* z4;
	T0* z5;
	T0* z6;
	T0* z7;
	T0* z8;
	T0* z9;
	T6 z10;
	T1 z11;
};

/* Struct for type GEANT_PROJECT */
struct S29 {
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
struct S30 {
	int id;
	T0* a1; /* project_element */
	T0* a2; /* build_filename */
};

/* Struct for type GEANT_PROJECT_OPTIONS */
struct S31 {
	int id;
	T1 a1; /* verbose */
	T1 a2; /* debug_mode */
	T1 a3; /* no_exec */
	T1 a4; /* variable_local_by_default */
};

/* Struct for type GEANT_PROJECT_VARIABLES */
struct S32 {
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
struct S33 {
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
	T0* a13; /* redefining_target */
	T0* a14; /* precursor_target */
};

/* Struct for type KL_ARGUMENTS */
struct S34 {
	int id;
	T0* a1; /* program_name */
};

/* Struct for type UT_ERROR_HANDLER */
struct S35 {
	int id;
	T0* a1; /* error_file */
	T0* a2; /* warning_file */
	T0* a3; /* info_file */
};

/* Struct for type GEANT_VARIABLES */
struct S36 {
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
struct S37 {
	int id;
	T0* a1; /* project */
	T0* a2; /* xml_element */
};

/* Struct for type DS_HASH_TABLE [GEANT_TARGET, STRING_8] */
struct S38 {
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
struct S39 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [STRING_8] */
struct S40 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type GEANT_ARGUMENT_VARIABLES */
struct S41 {
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
struct S42 {
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
struct S43 {
	int id;
	T0* a1; /* introduction_option */
	T0* a2; /* parameters_description */
	T0* a3; /* internal_cursor */
	T0* a4; /* first_cell */
};

/* Struct for type AP_STRING_OPTION */
struct S44 {
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
struct S45 {
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
struct S47 {
	int id;
	T0* a1; /* parameters */
	T0* a2; /* default_template */
	T0* a3; /* code */
};

/* Struct for type AP_ERROR_HANDLER */
struct S52 {
	int id;
	T1 a1; /* has_error */
	T0* a2; /* error_file */
	T0* a3; /* warning_file */
	T0* a4; /* info_file */
};

/* Struct for type KL_STANDARD_FILES */
struct S53 {
	int id;
};

/* Struct for type KL_STDERR_FILE */
struct S54 {
	int id;
	T14 a1; /* file_pointer */
	T6 a2; /* mode */
	T0* a3; /* last_string */
	T0* a4; /* internal_name */
	T0* a5; /* internal_detachable_name_pointer */
};

/* Struct for type KL_EXCEPTIONS */
struct S55 {
	int id;
};

/* Struct for type UT_VERSION_NUMBER */
struct S56 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type VOID_TARGET */
struct S58 {
	int id;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type ROUTINE_FAILURE */
struct S60 {
	int id;
	T0* a1; /* routine_name */
	T0* a2; /* class_name */
	T0* a3; /* throwing_exception */
	T0* a4; /* internal_trace */
	T0* a5; /* c_description */
	T0* a6; /* recipient_name */
	T0* a7; /* type_name */
};

/* Struct for type OLD_VIOLATION */
struct S62 {
	int id;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type NO_MORE_MEMORY */
struct S64 {
	int id;
	T0* a1; /* internal_trace */
	T6 a2; /* internal_code */
	T0* a3; /* throwing_exception */
	T0* a4; /* c_description */
	T0* a5; /* recipient_name */
	T0* a6; /* type_name */
};

/* Struct for type INVARIANT_VIOLATION */
struct S65 {
	int id;
	T0* a1; /* throwing_exception */
	T1 a2; /* is_entry */
	T0* a3; /* internal_trace */
	T0* a4; /* c_description */
	T0* a5; /* recipient_name */
	T0* a6; /* type_name */
};

/* Struct for type OPERATING_SYSTEM_SIGNAL_FAILURE */
struct S66 {
	int id;
	T0* a1; /* throwing_exception */
	T6 a2; /* signal_code */
	T0* a3; /* internal_trace */
	T0* a4; /* c_description */
	T0* a5; /* recipient_name */
	T0* a6; /* type_name */
};

/* Struct for type IO_FAILURE */
struct S67 {
	int id;
	T6 a1; /* internal_code */
	T0* a2; /* throwing_exception */
	T6 a3; /* error_code */
	T0* a4; /* internal_trace */
	T0* a5; /* c_description */
	T0* a6; /* recipient_name */
	T0* a7; /* type_name */
};

/* Struct for type OPERATING_SYSTEM_FAILURE */
struct S68 {
	int id;
	T0* a1; /* throwing_exception */
	T6 a2; /* error_code */
	T0* a3; /* internal_trace */
	T0* a4; /* c_description */
	T0* a5; /* recipient_name */
	T0* a6; /* type_name */
};

/* Struct for type COM_FAILURE */
struct S69 {
	int id;
	T0* a1; /* throwing_exception */
	T6 a2; /* hresult_code */
	T0* a3; /* exception_information */
	T6 a4; /* hresult */
	T0* a5; /* internal_trace */
	T0* a6; /* c_description */
	T0* a7; /* recipient_name */
	T0* a8; /* type_name */
};

/* Struct for type EIFFEL_RUNTIME_PANIC */
struct S70 {
	int id;
	T6 a1; /* internal_code */
	T0* a2; /* throwing_exception */
	T0* a3; /* internal_trace */
	T0* a4; /* c_description */
	T0* a5; /* recipient_name */
	T0* a6; /* type_name */
};

/* Struct for type PRECONDITION_VIOLATION */
struct S73 {
	int id;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type POSTCONDITION_VIOLATION */
struct S74 {
	int id;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type FLOATING_POINT_FAILURE */
struct S75 {
	int id;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type CHECK_VIOLATION */
struct S76 {
	int id;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type BAD_INSPECT_VALUE */
struct S77 {
	int id;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type VARIANT_VIOLATION */
struct S78 {
	int id;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type LOOP_INVARIANT_VIOLATION */
struct S79 {
	int id;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type RESCUE_FAILURE */
struct S80 {
	int id;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type RESUMPTION_FAILURE */
struct S81 {
	int id;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type CREATE_ON_DEFERRED */
struct S82 {
	int id;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type EXTERNAL_FAILURE */
struct S83 {
	int id;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type VOID_ASSIGNED_TO_EXPANDED */
struct S84 {
	int id;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type EXCEPTION_IN_SIGNAL_HANDLER_FAILURE */
struct S85 {
	int id;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type MISMATCH_FAILURE */
struct S86 {
	int id;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type DEVELOPER_EXCEPTION */
struct S87 {
	int id;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type ADDRESS_APPLIED_TO_MELTED_FEATURE */
struct S88 {
	int id;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type SERIALIZATION_FAILURE */
struct S89 {
	int id;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type KL_OPERATING_SYSTEM */
struct S90 {
	int id;
};

/* Struct for type KL_WINDOWS_FILE_SYSTEM */
struct S92 {
	int id;
	T2 a1; /* secondary_directory_separator */
};

/* Struct for type KL_UNIX_FILE_SYSTEM */
struct S93 {
	int id;
};

/* Struct for type PRIMES */
struct S94 {
	int id;
};

/* Struct for type SPECIAL [INTEGER_32] */
struct S95 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T6 z2[1]; /* item */
};

/* Struct for type SPECIAL [BOOLEAN] */
struct S96 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T1 z2[1]; /* item */
};

/* Struct for type KL_TEXT_INPUT_FILE */
struct S97 {
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
struct S98 {
	int id;
	T0* a1; /* last_project_element */
	T0* a2; /* variables */
	T0* a3; /* options */
	T0* a4; /* build_filename */
	T0* a5; /* xml_parser */
	T0* a6; /* tree_pipe */
};

/* Struct for type GEANT_PROJECT_VARIABLE_RESOLVER */
struct S100 {
	int id;
	T0* a1; /* variables */
};

/* Struct for type UC_STRING_EQUALITY_TESTER */
struct S101 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [STRING_8] */
struct S104 {
	int id;
};

/* Struct for type DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
struct S105 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [INTEGER_32] */
struct S106 {
	int id;
};

/* Struct for type KL_STDOUT_FILE */
struct S108 {
	int id;
	T14 a1; /* file_pointer */
	T6 a2; /* mode */
	T0* a3; /* last_string */
	T0* a4; /* internal_name */
	T0* a5; /* internal_detachable_name_pointer */
};

/* Struct for type DS_LINKED_LIST_CURSOR [AP_OPTION] */
struct S109 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_ARRAYED_LIST [detachable STRING_8] */
struct S111 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* internal_cursor */
	T0* a4; /* special_routines */
	T6 a5; /* capacity */
	T0* a6; /* equality_tester */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [detachable STRING_8] */
struct S112 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type AP_DISPLAY_HELP_FLAG */
struct S113 {
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
struct S114 {
	int id;
	T0* a1; /* internal_cursor */
	T6 a2; /* count */
	T0* a3; /* equality_tester */
	T0* a4; /* storage */
	T0* a5; /* special_routines */
	T6 a6; /* capacity */
};

/* Struct for type DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S115 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T6 a5; /* count */
};

/* Struct for type KL_STRING_ROUTINES */
struct S116 {
	int id;
};

/* Struct for type MANAGED_POINTER */
struct S118 {
	int id;
	T14 a1; /* item */
	T6 a2; /* count */
	T1 a3; /* is_shared */
};

/* Struct for type FILE_INFO */
struct S119 {
	int id;
	T0* a1; /* buffered_file_info */
	T1 a2; /* is_following_symlinks */
	T1 a3; /* exists */
	T0* a4; /* internal_file_name */
	T0* a5; /* internal_name_pointer */
};

/* Struct for type DS_HASH_TABLE [STRING_8, STRING_8] */
struct S123 {
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
struct S124 {
	int id;
};

/* Struct for type IMMUTABLE_STRING_32 */
struct S125 {
	int id;
	T0* a1; /* area */
	T6 a2; /* count */
	T6 a3; /* internal_hash_code */
	T6 a4; /* area_lower */
};

/* Struct for type CELL [INTEGER_32] */
struct S128 {
	int id;
	T6 a1; /* item */
};

/* Struct for type C_STRING */
struct S129 {
	int id;
	T0* a1; /* managed_data */
	T6 a2; /* count */
};

/* Struct for type EXECUTION_ENVIRONMENT */
struct S130 {
	int id;
	T6 a1; /* return_code */
};

/* Struct for type KL_ANY_ROUTINES */
struct S131 {
	int id;
};

/* Struct for type KL_PATHNAME */
struct S133 {
	int id;
	T6 a1; /* count */
	T0* a2; /* drive */
	T0* a3; /* hostname */
	T0* a4; /* sharename */
	T1 a5; /* is_relative */
	T0* a6; /* components */
};

/* Struct for type detachable KL_LINKABLE [CHARACTER_8] */
struct S135 {
	int id;
	T2 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type XM_EXPAT_PARSER_FACTORY */
struct S137 {
	int id;
};

/* Struct for type XM_EIFFEL_PARSER */
struct S139 {
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
struct S140 {
	int id;
	T0* a1; /* start */
	T0* a2; /* tree */
	T0* a3; /* error */
	T0* a4; /* last */
};

/* Struct for type XM_CALLBACKS_TO_TREE_FILTER */
struct S143 {
	int id;
	T0* a1; /* last_position_table */
	T0* a2; /* document */
	T0* a3; /* source_parser */
	T0* a4; /* current_element */
	T0* a5; /* namespace_cache */
	T0* a6; /* next */
};

/* Struct for type XM_DOCUMENT */
struct S144 {
	int id;
	T0* a1; /* root_element */
	T0* a2; /* children */
};

/* Struct for type XM_ELEMENT */
struct S145 {
	int id;
	T0* a1; /* parent */
	T0* a2; /* children */
	T0* a3; /* namespace */
	T0* a4; /* name */
};

/* Struct for type XM_STOP_ON_ERROR_FILTER */
struct S146 {
	int id;
	T1 a1; /* has_error */
	T0* a2; /* last_error */
	T0* a3; /* next */
};

/* Struct for type XM_POSITION_TABLE */
struct S147 {
	int id;
	T0* a1; /* table */
};

/* Struct for type KL_EXECUTION_ENVIRONMENT */
struct S150 {
	int id;
};

/* Struct for type DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES] */
struct S151 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type DS_ARRAYED_STACK [GEANT_VARIABLES] */
struct S152 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [AP_OPTION] */
struct S153 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [AP_OPTION] */
struct S155 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [AP_OPTION] */
struct S156 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S157 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S158 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S159 {
	int id;
};

/* Struct for type UC_STRING */
struct S160 {
	int id;
	T6 a1; /* count */
	T6 a2; /* byte_count */
	T6 a3; /* internal_hash_code */
	T0* a4; /* area */
	T6 a5; /* last_byte_index_input */
	T6 a6; /* last_byte_index_result */
};

/* Struct for type PLATFORM */
struct S161 {
	int id;
};

/* Struct for type READABLE_STRING_32 */
struct S162 {
	int id;
};

/* Struct for type SPECIAL [NATURAL_8] */
struct S163 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T8 z2[1]; /* item */
};

/* Struct for type STRING_TO_INTEGER_CONVERTOR */
struct S166 {
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
struct S168 {
	int id;
	T6 a1; /* count */
	T0* a2; /* last_cell */
	T0* a3; /* first_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_LINKED_LIST_CURSOR [XM_ELEMENT] */
struct S169 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type GEANT_INHERIT_ELEMENT */
struct S170 {
	int id;
	T0* a1; /* geant_inherit */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_INHERIT */
struct S171 {
	int id;
	T0* a1; /* parents */
	T0* a2; /* project */
};

/* Struct for type SPECIAL [GEANT_TARGET] */
struct S172 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_TARGET] */
struct S175 {
	int id;
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8] */
struct S176 {
	int id;
	T6 a1; /* position */
	T0* a2; /* container */
	T0* a3; /* next_cursor */
};

/* Struct for type STD_FILES */
struct S177 {
	int id;
	T0* a1; /* default_output */
};

/* Struct for type EXCEPTIONS */
struct S178 {
	int id;
};

/* Struct for type SPECIAL [IMMUTABLE_STRING_32] */
struct S179 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [IMMUTABLE_STRING_32] */
struct S180 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
	T1 a4; /* object_comparison */
};

/* Struct for type NATIVE_STRING */
struct S181 {
	int id;
	T0* a1; /* managed_data */
	T6 a2; /* unit_count */
};

/* Struct for type XM_EIFFEL_SCANNER */
struct S183 {
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
	T0* a40; /* yy_pushed_start_conditions */
	T0* a41; /* last_string_value */
	T0* a42; /* last_error */
	T6 a43; /* pushed_start_condition_count */
};

/* Struct for type XM_DEFAULT_POSITION */
struct S184 {
	int id;
	T0* a1; /* source_name */
	T6 a2; /* row */
	T6 a3; /* column */
	T6 a4; /* byte_index */
};

/* Struct for type DS_BILINKED_LIST [XM_POSITION] */
struct S186 {
	int id;
	T0* a1; /* first_cell */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
struct S187 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
};

/* Struct for type XM_CALLBACKS_NULL */
struct S188 {
	int id;
};

/* Struct for type DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S189 {
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
struct S191 {
	int id;
};

/* Struct for type XM_DTD_CALLBACKS_NULL */
struct S193 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [detachable ANY] */
struct S194 {
	int id;
};

/* Struct for type SPECIAL [detachable ANY] */
struct S195 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
struct S196 {
	int id;
};

/* Struct for type XM_EIFFEL_PARSER_NAME */
struct S197 {
	int id;
	T1 a1; /* use_namespaces */
	T6 a2; /* count */
	T0* a3; /* first */
	T0* a4; /* second */
	T0* a5; /* tail */
};

/* Struct for type SPECIAL [XM_EIFFEL_PARSER_NAME] */
struct S198 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S199 {
	int id;
};

/* Struct for type DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
struct S200 {
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
struct S201 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
struct S202 {
	int id;
};

/* Struct for type XM_DTD_EXTERNAL_ID */
struct S203 {
	int id;
	T0* a1; /* system_id */
	T0* a2; /* public_id */
};

/* Struct for type SPECIAL [XM_DTD_EXTERNAL_ID] */
struct S204 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
struct S205 {
	int id;
};

/* Struct for type XM_DTD_ELEMENT_CONTENT */
struct S206 {
	int id;
	T0* a1; /* items */
	T2 a2; /* repetition */
	T0* a3; /* name */
	T2 a4; /* type */
	T1 a5; /* is_character_data_allowed */
};

/* Struct for type SPECIAL [XM_DTD_ELEMENT_CONTENT] */
struct S207 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S208 {
	int id;
};

/* Struct for type DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
struct S209 {
	int id;
	T0* a1; /* last_cell */
	T6 a2; /* count */
	T0* a3; /* first_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S210 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
struct S211 {
	int id;
};

/* Struct for type XM_DTD_ATTRIBUTE_CONTENT */
struct S212 {
	int id;
	T0* a1; /* name */
	T0* a2; /* default_value */
	T2 a3; /* type */
	T1 a4; /* is_list_type */
	T0* a5; /* enumeration_list */
	T2 a6; /* value */
};

/* Struct for type SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
struct S213 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
struct S214 {
	int id;
};

/* Struct for type DS_BILINKED_LIST [STRING_8] */
struct S215 {
	int id;
	T0* a1; /* last_cell */
	T6 a2; /* count */
	T0* a3; /* first_cell */
	T0* a4; /* equality_tester */
	T0* a5; /* internal_cursor */
};

/* Struct for type SPECIAL [DS_BILINKED_LIST [STRING_8]] */
struct S216 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [BOOLEAN] */
struct S217 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
struct S218 {
	int id;
};

/* Struct for type XM_EIFFEL_DECLARATION */
struct S219 {
	int id;
	T0* a1; /* encoding */
	T0* a2; /* version */
	T1 a3; /* stand_alone */
};

/* Struct for type SPECIAL [XM_EIFFEL_DECLARATION] */
struct S220 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type XM_EIFFEL_ENTITY_DEF */
struct S223 {
	int id;
	T0* a1; /* literal_name */
	T0* a2; /* value */
	T0* a3; /* resolver */
	T0* a4; /* external_id */
	T0* a5; /* character_entity */
	T0* a6; /* yy_pushed_start_conditions */
	T0* a7; /* input_buffer */
	T1 a8; /* in_use */
	T0* a9; /* input_name */
	T0* a10; /* last_value */
	T0* a11; /* last_string_value */
	T0* a12; /* last_error */
	T1 a13; /* yy_rejected */
	T6 a14; /* yy_state_count */
	T6 a15; /* yy_full_match */
	T6 a16; /* yy_lp */
	T6 a17; /* yy_looking_for_trail_begin */
	T6 a18; /* yy_full_lp */
	T6 a19; /* yy_full_state */
	T6 a20; /* pushed_start_condition_count */
	T6 a21; /* yy_start_state */
	T6 a22; /* yy_line */
	T6 a23; /* yy_column */
	T6 a24; /* yy_position */
	T6 a25; /* yy_start */
	T6 a26; /* yy_end */
	T6 a27; /* line */
	T6 a28; /* column */
	T6 a29; /* position */
	T1 a30; /* yy_more_flag */
	T6 a31; /* yy_more_len */
	T6 a32; /* yy_last_accepting_state */
	T6 a33; /* yy_last_accepting_cpos */
	T0* a34; /* yy_state_stack */
	T0* a35; /* yy_nxt */
	T0* a36; /* yy_chk */
	T0* a37; /* yy_base */
	T0* a38; /* yy_def */
	T0* a39; /* yy_ec */
	T0* a40; /* yy_meta */
	T0* a41; /* yy_accept */
	T0* a42; /* yy_content */
	T0* a43; /* yy_content_area */
	T6 a44; /* last_token */
	T0* a45; /* input_filter */
	T0* a46; /* input_stream */
	T0* a47; /* input_resolver */
	T0* a48; /* yy_acclist */
};

/* Struct for type XM_EIFFEL_SCANNER_DTD */
struct S224 {
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
	T0* a42; /* yy_pushed_start_conditions */
	T0* a43; /* last_string_value */
	T0* a44; /* last_error */
	T6 a45; /* pushed_start_condition_count */
};

/* Struct for type XM_EIFFEL_PE_ENTITY_DEF */
struct S226 {
	int id;
	T0* a1; /* resolver */
	T0* a2; /* external_id */
	T0* a3; /* literal_name */
	T0* a4; /* value */
	T0* a5; /* character_entity */
	T0* a6; /* yy_pushed_start_conditions */
	T0* a7; /* input_buffer */
	T1 a8; /* in_use */
	T0* a9; /* input_name */
	T0* a10; /* last_value */
	T0* a11; /* last_string_value */
	T0* a12; /* last_error */
	T1 a13; /* yy_rejected */
	T6 a14; /* yy_state_count */
	T6 a15; /* yy_full_match */
	T6 a16; /* yy_lp */
	T6 a17; /* yy_looking_for_trail_begin */
	T6 a18; /* yy_full_lp */
	T6 a19; /* yy_full_state */
	T6 a20; /* pushed_start_condition_count */
	T6 a21; /* yy_start_state */
	T6 a22; /* yy_line */
	T6 a23; /* yy_column */
	T6 a24; /* yy_position */
	T6 a25; /* yy_start */
	T6 a26; /* yy_end */
	T6 a27; /* line */
	T6 a28; /* column */
	T6 a29; /* position */
	T1 a30; /* yy_more_flag */
	T6 a31; /* yy_more_len */
	T6 a32; /* yy_last_accepting_state */
	T6 a33; /* yy_last_accepting_cpos */
	T0* a34; /* yy_state_stack */
	T1 a35; /* pre_sent */
	T1 a36; /* post_sent */
	T0* a37; /* yy_nxt */
	T0* a38; /* yy_chk */
	T0* a39; /* yy_base */
	T0* a40; /* yy_def */
	T0* a41; /* yy_ec */
	T0* a42; /* yy_meta */
	T0* a43; /* yy_accept */
	T0* a44; /* yy_content */
	T0* a45; /* yy_content_area */
	T6 a46; /* last_token */
	T0* a47; /* input_filter */
	T0* a48; /* input_stream */
	T0* a49; /* input_resolver */
	T0* a50; /* yy_acclist */
};

/* Struct for type XM_NAMESPACE_RESOLVER */
struct S227 {
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
struct S228 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [XM_CALLBACKS_FILTER] */
struct S229 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_HASH_SET [XM_NAMESPACE] */
struct S230 {
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
struct S231 {
	int id;
	T0* a1; /* uri */
	T0* a2; /* ns_prefix */
};

/* Struct for type XM_LINKED_LIST [XM_DOCUMENT_NODE] */
struct S232 {
	int id;
	T6 a1; /* count */
	T0* a2; /* last_cell */
	T0* a3; /* first_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE] */
struct S236 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type XM_LINKED_LIST [XM_ELEMENT_NODE] */
struct S239 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* first_cell */
};

/* Struct for type DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S241 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* first_cell */
};

/* Struct for type SPECIAL [GEANT_ARGUMENT_VARIABLES] */
struct S242 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES] */
struct S243 {
	int id;
};

/* Struct for type SPECIAL [GEANT_VARIABLES] */
struct S244 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_VARIABLES] */
struct S245 {
	int id;
};

/* Struct for type DS_ARRAYED_STACK [GEANT_TARGET] */
struct S247 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type GEANT_TASK_FACTORY */
struct S248 {
	int id;
	T0* a1; /* project */
	T0* a2; /* builders */
};

/* Struct for type GEANT_PARENT */
struct S249 {
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
struct S251 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T6 a4; /* count */
	T0* a5; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [GEANT_PARENT] */
struct S252 {
	int id;
	T6 a1; /* position */
	T0* a2; /* container */
	T0* a3; /* next_cursor */
};

/* Struct for type GEANT_INTERPRETING_ELEMENT */
struct S253 {
	int id;
	T0* a1; /* project */
	T0* a2; /* xml_element */
	T0* a3; /* position */
};

/* Struct for type GEANT_ARGUMENT_ELEMENT */
struct S254 {
	int id;
	T0* a1; /* xml_element */
};

/* Struct for type GEANT_LOCAL_ELEMENT */
struct S255 {
	int id;
	T0* a1; /* xml_element */
};

/* Struct for type GEANT_GLOBAL_ELEMENT */
struct S256 {
	int id;
	T0* a1; /* xml_element */
};

/* Struct for type XM_ATTRIBUTE */
struct S257 {
	int id;
	T0* a1; /* name */
	T0* a2; /* namespace */
	T0* a3; /* value */
	T0* a4; /* parent */
};

/* Struct for type GEANT_GROUP */
struct S258 {
	int id;
	T0* a1; /* project */
	T0* a2; /* xml_element */
	T0* a3; /* position */
	T0* a4; /* parent */
	T0* a5; /* description */
};

/* Struct for type HEXADECIMAL_STRING_TO_INTEGER_CONVERTER */
struct S264 {
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

/* Struct for type ARRAY [INTEGER_32] */
struct S265 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type UC_UTF8_ROUTINES */
struct S266 {
	int id;
};

/* Struct for type UC_UTF8_STRING */
struct S267 {
	int id;
	T6 a1; /* count */
	T0* a2; /* area */
	T6 a3; /* byte_count */
	T6 a4; /* internal_hash_code */
	T6 a5; /* last_byte_index_input */
	T6 a6; /* last_byte_index_result */
};

/* Struct for type XM_EIFFEL_INPUT_STREAM */
struct S268 {
	int id;
	T0* a1; /* last_string */
	T6 a2; /* encoding */
	T0* a3; /* impl */
	T0* a4; /* utf_queue */
};

/* Struct for type KL_INTEGER_ROUTINES */
struct S269 {
	int id;
};

/* Struct for type KL_PLATFORM */
struct S270 {
	int id;
};

/* Struct for type DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE] */
struct S271 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S272 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_PAIR [XM_POSITION, XM_NODE] */
struct S273 {
	int id;
	T0* a1; /* first */
	T0* a2; /* second */
};

/* Struct for type INTEGER_OVERFLOW_CHECKER */
struct S274 {
	int id;
	T0* a1; /* integer_overflow_state1 */
	T0* a2; /* integer_overflow_state2 */
	T0* a3; /* natural_overflow_state1 */
	T0* a4; /* natural_overflow_state2 */
};

/* Struct for type detachable DS_LINKABLE [XM_ELEMENT] */
struct S275 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type GEANT_PARENT_ELEMENT */
struct S276 {
	int id;
	T0* a1; /* parent */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type XM_EIFFEL_CHARACTER_ENTITY */
struct S278 {
	int id;
	T6 a1; /* code */
};

/* Struct for type YY_BUFFER */
struct S279 {
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
struct S280 {
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

/* Struct for type detachable DS_BILINKABLE [XM_POSITION] */
struct S284 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_POSITION] */
struct S285 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type detachable DS_LINKABLE [XM_EIFFEL_SCANNER] */
struct S286 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type SPECIAL [XM_EIFFEL_ENTITY_DEF] */
struct S287 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type detachable DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S290 {
	int id;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T6 a3; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
struct S291 {
	int id;
};

/* Struct for type detachable KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
struct S293 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
struct S294 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
struct S295 {
	int id;
	T0* a1; /* first_cell */
	T6 a2; /* count */
	T0* a3; /* last_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
struct S296 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type detachable DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
struct S297 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_LINKED_LIST [STRING_8] */
struct S298 {
	int id;
	T0* a1; /* internal_cursor */
	T6 a2; /* count */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
	T0* a5; /* equality_tester */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [STRING_8] */
struct S299 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type detachable DS_BILINKABLE [STRING_8] */
struct S300 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type XM_NAMESPACE_RESOLVER_CONTEXT */
struct S301 {
	int id;
	T0* a1; /* context */
};

/* Struct for type DS_LINKED_QUEUE [STRING_8] */
struct S303 {
	int id;
	T0* a1; /* first_cell */
	T6 a2; /* count */
	T0* a3; /* last_cell */
};

/* Struct for type detachable KL_EQUALITY_TESTER [XM_NAMESPACE] */
struct S304 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [XM_NAMESPACE] */
struct S305 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
struct S306 {
	int id;
};

/* Struct for type SPECIAL [XM_NAMESPACE] */
struct S307 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type detachable DS_LINKABLE [XM_DOCUMENT_NODE] */
struct S308 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type GEANT_STRING_INTERPRETER */
struct S312 {
	int id;
	T0* a1; /* variable_resolver */
};

/* Struct for type GEANT_NAME_VALUE_ELEMENT */
struct S314 {
	int id;
	T0* a1; /* xml_element */
};

/* Struct for type KL_ARRAY_ROUTINES [detachable STRING_8] */
struct S318 {
	int id;
};

/* Struct for type AP_OPTION_COMPARATOR */
struct S319 {
	int id;
};

/* Struct for type DS_QUICK_SORTER [AP_OPTION] */
struct S320 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type ST_WORD_WRAPPER */
struct S322 {
	int id;
	T6 a1; /* new_line_indentation */
	T6 a2; /* broken_words */
	T6 a3; /* maximum_text_width */
};

/* Struct for type XM_COMMENT */
struct S324 {
	int id;
	T0* a1; /* data */
	T0* a2; /* parent */
};

/* Struct for type XM_PROCESSING_INSTRUCTION */
struct S325 {
	int id;
	T0* a1; /* target */
	T0* a2; /* data */
	T0* a3; /* parent */
};

/* Struct for type XM_CHARACTER_DATA */
struct S326 {
	int id;
	T0* a1; /* content */
	T0* a2; /* parent */
};

/* Struct for type CONSOLE */
struct S327 {
	int id;
	T14 a1; /* file_pointer */
	T6 a2; /* mode */
	T0* a3; /* last_string */
	T0* a4; /* internal_name */
	T0* a5; /* internal_detachable_name_pointer */
};

/* Struct for type KL_ARRAY_ROUTINES [INTEGER_32] */
struct S328 {
	int id;
};

/* Struct for type detachable DS_LINKABLE [XM_ELEMENT_NODE] */
struct S330 {
	int id;
	T0* a1; /* right */
	T0* a2; /* item */
};

/* Struct for type detachable DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S331 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
struct S332 {
	int id;
	T6 a1; /* position */
	T0* a2; /* item_storage */
	T0* a3; /* key_equality_tester */
	T0* a4; /* internal_keys */
	T6 a5; /* count */
	T6 a6; /* capacity */
	T6 a7; /* free_slot */
	T6 a8; /* last_position */
	T6 a9; /* modulus */
	T6 a10; /* slots_position */
	T6 a11; /* clashes_previous_position */
	T0* a12; /* equality_tester */
	T6 a13; /* found_position */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* special_item_routines */
	T0* a17; /* special_key_routines */
	T0* a18; /* key_storage */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type GEANT_GEC_TASK */
struct S333 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] TUPLE [XM_ELEMENT] */
struct S334 {
	int id;
	T0* z1;
};

/* Struct for type detachable TUPLE */
struct S335 {
	int id;
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEC_TASK] */
struct S336 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type [attached] TUPLE [GEANT_TASK_FACTORY] */
struct S337 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_ISE_TASK */
struct S339 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_ISE_TASK] */
struct S340 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_EXEC_TASK */
struct S341 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_EXEC_TASK] */
struct S342 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_LCC_TASK */
struct S343 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_LCC_TASK] */
struct S344 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_SET_TASK */
struct S345 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_SET_TASK] */
struct S346 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_UNSET_TASK */
struct S347 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_UNSET_TASK] */
struct S348 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_GEXACE_TASK */
struct S349 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* position */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEXACE_TASK] */
struct S350 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_GELEX_TASK */
struct S351 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GELEX_TASK] */
struct S352 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_GEYACC_TASK */
struct S353 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEYACC_TASK] */
struct S354 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_GEPP_TASK */
struct S355 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEPP_TASK] */
struct S356 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_GETEST_TASK */
struct S357 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* position */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GETEST_TASK] */
struct S358 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_GEANT_TASK */
struct S359 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEANT_TASK] */
struct S360 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_ECHO_TASK */
struct S361 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_ECHO_TASK] */
struct S362 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_MKDIR_TASK */
struct S363 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_MKDIR_TASK] */
struct S364 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_DELETE_TASK */
struct S365 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_DELETE_TASK] */
struct S366 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_COPY_TASK */
struct S367 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_COPY_TASK] */
struct S368 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_MOVE_TASK */
struct S369 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_MOVE_TASK] */
struct S370 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_SETENV_TASK */
struct S371 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_SETENV_TASK] */
struct S372 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_XSLT_TASK */
struct S373 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* position */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_XSLT_TASK] */
struct S374 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_OUTOFDATE_TASK */
struct S375 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_OUTOFDATE_TASK] */
struct S376 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_EXIT_TASK */
struct S377 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_EXIT_TASK] */
struct S378 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_PRECURSOR_TASK */
struct S379 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* position */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_PRECURSOR_TASK] */
struct S380 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_AVAILABLE_TASK */
struct S381 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_AVAILABLE_TASK] */
struct S382 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_INPUT_TASK */
struct S383 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_INPUT_TASK] */
struct S384 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_REPLACE_TASK */
struct S385 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_REPLACE_TASK] */
struct S386 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_PARENT] */
struct S387 {
	int id;
};

/* Struct for type SPECIAL [GEANT_PARENT] */
struct S388 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type UC_UNICODE_ROUTINES */
struct S390 {
	int id;
};

/* Struct for type DS_LINKED_QUEUE [CHARACTER_8] */
struct S392 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
};

/* Struct for type UC_UTF16_ROUTINES */
struct S393 {
	int id;
};

/* Struct for type SPECIAL [NATURAL_64] */
struct S394 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T11 z2[1]; /* item */
};

/* Struct for type GEANT_RENAME_ELEMENT */
struct S395 {
	int id;
	T0* a1; /* rename_clause */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_REDEFINE_ELEMENT */
struct S396 {
	int id;
	T0* a1; /* redefine_clause */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_SELECT_ELEMENT */
struct S397 {
	int id;
	T0* a1; /* select_clause */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_RENAME */
struct S398 {
	int id;
	T0* a1; /* original_name */
	T0* a2; /* new_name */
};

/* Struct for type DS_HASH_TABLE [GEANT_RENAME, STRING_8] */
struct S399 {
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
struct S400 {
	int id;
	T0* a1; /* name */
};

/* Struct for type DS_HASH_TABLE [GEANT_REDEFINE, STRING_8] */
struct S401 {
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
struct S402 {
	int id;
	T0* a1; /* name */
};

/* Struct for type DS_HASH_TABLE [GEANT_SELECT, STRING_8] */
struct S403 {
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

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
struct S404 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type attached DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
struct S405 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_LINKED_LIST_CURSOR [STRING_8] */
struct S406 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S408 {
	int id;
	T6 a1; /* count */
	T0* a2; /* last_cell */
	T0* a3; /* first_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S409 {
	int id;
	T1 a1; /* before */
	T0* a2; /* current_cell */
	T0* a3; /* next_cursor */
	T0* a4; /* container */
	T1 a5; /* after */
};

/* Struct for type detachable DS_LINKABLE [STRING_8] */
struct S410 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type KL_DIRECTORY */
struct S411 {
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

/* Struct for type ST_SPLITTER */
struct S412 {
	int id;
	T1 a1; /* has_escape_character */
	T2 a2; /* escape_character */
	T0* a3; /* separator_codes */
	T0* a4; /* separators */
};

/* Struct for type KL_STRING_INPUT_STREAM */
struct S413 {
	int id;
	T1 a1; /* end_of_input */
	T2 a2; /* last_character */
	T0* a3; /* last_string */
	T0* a4; /* string */
	T6 a5; /* location */
};

/* Struct for type KL_CHARACTER_BUFFER */
struct S414 {
	int id;
	T0* a1; /* as_special */
	T0* a2; /* area */
};

/* Struct for type KL_ARRAY [detachable STRING_8] */
struct S415 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
struct S416 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
struct S419 {
	int id;
};

/* Struct for type DS_HASH_TABLE_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
struct S420 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type GEANT_GEC_COMMAND */
struct S421 {
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
struct S422 {
	int id;
	T0* a1; /* item */
};

/* Struct for type [attached] PROCEDURE [[attached] NONE, [attached] TUPLE] */
struct S423 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(GE_context*, T0*);
};

/* Struct for type [attached] TUPLE [GEANT_GEC_TASK] */
struct S424 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_ISE_COMMAND */
struct S425 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* ace_filename */
	T0* a4; /* system_name */
	T0* a5; /* clean */
	T1 a6; /* compatible_mode */
	T1 a7; /* finalize_mode */
	T1 a8; /* finish_freezing */
	T0* a9; /* project_path */
	T0* a10; /* exit_code_variable_name */
	T6 a11; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_ISE_TASK] */
struct S426 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_FILESET_ELEMENT */
struct S427 {
	int id;
	T0* a1; /* fileset */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_EXEC_COMMAND */
struct S428 {
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
struct S429 {
	int id;
	T0* a1; /* string_value_agent */
	T1 a2; /* has_been_retrieved */
	T0* a3; /* retrieved_string_value */
};

/* Struct for type [attached] FUNCTION [GEANT_INTERPRETING_ELEMENT, [attached] TUPLE, STRING_8] */
struct S430 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*);
};

/* Struct for type [attached] TUPLE [GEANT_INTERPRETING_ELEMENT, STRING_8] */
struct S431 {
	int id;
	T0* z1;
	T0* z2;
};

/* Struct for type GEANT_BOOLEAN_PROPERTY */
struct S432 {
	int id;
	T0* a1; /* string_value_agent */
	T1 a2; /* has_been_retrieved */
	T0* a3; /* retrieved_string_value */
};

/* Struct for type GEANT_FILESET */
struct S433 {
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

/* Struct for type [attached] TUPLE [GEANT_EXEC_TASK] */
struct S434 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_LCC_COMMAND */
struct S435 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* executable */
	T0* a4; /* source_filename */
	T6 a5; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_LCC_TASK] */
struct S436 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_SET_COMMAND */
struct S437 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* name */
	T0* a4; /* value */
	T6 a5; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_SET_TASK] */
struct S438 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_UNSET_COMMAND */
struct S439 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* name */
	T6 a4; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_UNSET_TASK] */
struct S440 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_DEFINE_ELEMENT */
struct S441 {
	int id;
	T0* a1; /* project */
	T0* a2; /* xml_element */
	T0* a3; /* position */
};

/* Struct for type GEANT_GEXACE_COMMAND */
struct S442 {
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

/* Struct for type [attached] TUPLE [GEANT_GEXACE_TASK] */
struct S443 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_GELEX_COMMAND */
struct S444 {
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

/* Struct for type [attached] TUPLE [GEANT_GELEX_TASK] */
struct S445 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_GEYACC_COMMAND */
struct S446 {
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

/* Struct for type [attached] TUPLE [GEANT_GEYACC_TASK] */
struct S447 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_GEPP_COMMAND */
struct S448 {
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

/* Struct for type [attached] TUPLE [GEANT_GEPP_TASK] */
struct S449 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_GETEST_COMMAND */
struct S450 {
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

/* Struct for type [attached] TUPLE [GEANT_GETEST_TASK] */
struct S451 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_GEANT_COMMAND */
struct S452 {
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

/* Struct for type [attached] TUPLE [GEANT_GEANT_TASK] */
struct S453 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_ECHO_COMMAND */
struct S454 {
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

/* Struct for type [attached] TUPLE [GEANT_ECHO_TASK] */
struct S455 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_MKDIR_COMMAND */
struct S456 {
	int id;
	T0* a1; /* directory */
	T0* a2; /* log_validation_messages_agent_cell */
	T0* a3; /* project */
	T0* a4; /* mkdir_agent_cell */
	T6 a5; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_MKDIR_TASK] */
struct S457 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_DIRECTORYSET_ELEMENT */
struct S458 {
	int id;
	T0* a1; /* directoryset */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_DELETE_COMMAND */
struct S459 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T1 a3; /* fail_on_error */
	T0* a4; /* directory */
	T0* a5; /* file */
	T0* a6; /* fileset */
	T0* a7; /* directoryset */
	T6 a8; /* exit_code */
};

/* Struct for type GEANT_DIRECTORYSET */
struct S460 {
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

/* Struct for type [attached] TUPLE [GEANT_DELETE_TASK] */
struct S461 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_COPY_COMMAND */
struct S462 {
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

/* Struct for type [attached] TUPLE [GEANT_COPY_TASK] */
struct S463 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_MOVE_COMMAND */
struct S464 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* file */
	T0* a4; /* to_file */
	T0* a5; /* to_directory */
	T0* a6; /* fileset */
	T6 a7; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_MOVE_TASK] */
struct S465 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_SETENV_COMMAND */
struct S466 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* name */
	T0* a4; /* value */
	T6 a5; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_SETENV_TASK] */
struct S467 {
	int id;
	T0* z1;
};

/* Struct for type DS_PAIR [STRING_8, STRING_8] */
struct S468 {
	int id;
	T0* a1; /* first */
	T0* a2; /* second */
};

/* Struct for type GEANT_XSLT_COMMAND */
struct S469 {
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
struct S470 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T6 a4; /* count */
	T0* a5; /* internal_cursor */
};

/* Struct for type [attached] TUPLE [GEANT_XSLT_TASK] */
struct S471 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_OUTOFDATE_COMMAND */
struct S472 {
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

/* Struct for type [attached] TUPLE [GEANT_OUTOFDATE_TASK] */
struct S473 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_EXIT_COMMAND */
struct S474 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T6 a3; /* code */
	T6 a4; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_EXIT_TASK] */
struct S475 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_PRECURSOR_COMMAND */
struct S476 {
	int id;
	T0* a1; /* arguments */
	T0* a2; /* log_validation_messages_agent_cell */
	T0* a3; /* project */
	T0* a4; /* parent */
	T6 a5; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_PRECURSOR_TASK] */
struct S477 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_AVAILABLE_COMMAND */
struct S478 {
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

/* Struct for type [attached] TUPLE [GEANT_AVAILABLE_TASK] */
struct S479 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_INPUT_COMMAND */
struct S480 {
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

/* Struct for type [attached] TUPLE [GEANT_INPUT_TASK] */
struct S481 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_REPLACE_COMMAND */
struct S482 {
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

/* Struct for type [attached] TUPLE [GEANT_REPLACE_TASK] */
struct S483 {
	int id;
	T0* z1;
};

/* Struct for type SPECIAL [ARRAY [INTEGER_32]] */
struct S484 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
struct S485 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type detachable DS_LINKABLE [CHARACTER_8] */
struct S486 {
	int id;
	T2 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type detachable KL_EQUALITY_TESTER [GEANT_RENAME] */
struct S487 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_RENAME] */
struct S489 {
	int id;
};

/* Struct for type SPECIAL [GEANT_RENAME] */
struct S490 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8] */
struct S491 {
	int id;
	T6 a1; /* position */
	T0* a2; /* container */
	T0* a3; /* next_cursor */
};

/* Struct for type detachable KL_EQUALITY_TESTER [GEANT_REDEFINE] */
struct S492 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_REDEFINE] */
struct S494 {
	int id;
};

/* Struct for type SPECIAL [GEANT_REDEFINE] */
struct S495 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8] */
struct S496 {
	int id;
	T6 a1; /* position */
	T0* a2; /* container */
	T0* a3; /* next_cursor */
};

/* Struct for type detachable KL_EQUALITY_TESTER [GEANT_SELECT] */
struct S497 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_SELECT] */
struct S499 {
	int id;
};

/* Struct for type SPECIAL [GEANT_SELECT] */
struct S500 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8] */
struct S501 {
	int id;
	T6 a1; /* position */
	T0* a2; /* container */
	T0* a3; /* next_cursor */
};

/* Struct for type detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S502 {
	int id;
	T0* a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
};

/* Struct for type DS_HASH_SET [INTEGER_32] */
struct S509 {
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

/* Struct for type GEANT_MAP_ELEMENT */
struct S512 {
	int id;
	T0* a1; /* map */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_MAP */
struct S513 {
	int id;
	T0* a1; /* type */
	T0* a2; /* project */
	T0* a3; /* source_pattern */
	T0* a4; /* target_pattern */
	T0* a5; /* map */
};

/* Struct for type DS_HASH_SET [GEANT_FILESET_ENTRY] */
struct S516 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* item_storage */
	T0* a3; /* equality_tester */
	T6 a4; /* position */
	T6 a5; /* last_position */
	T6 a6; /* capacity */
	T6 a7; /* slots_position */
	T6 a8; /* count */
	T6 a9; /* modulus */
	T6 a10; /* free_slot */
	T6 a11; /* found_position */
	T6 a12; /* clashes_previous_position */
	T0* a13; /* special_item_routines */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* hash_function */
};

/* Struct for type DS_HASH_SET [STRING_8] */
struct S518 {
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
struct S520 {
	int id;
	T0* a1; /* yy_nxt */
	T0* a2; /* yy_accept */
	T0* a3; /* subject */
	T6 a4; /* subject_start */
	T6 a5; /* subject_end */
	T6 a6; /* match_count */
	T6 a7; /* matched_start */
	T6 a8; /* matched_end */
	T6 a9; /* yyNb_rows */
	T0* a10; /* pattern */
	T1 a11; /* is_case_insensitive */
};

/* Struct for type DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8]]] */
struct S522 {
	int id;
	T0* a1; /* item */
};

/* Struct for type [attached] TUPLE [STRING_8] */
struct S523 {
	int id;
	T0* z1;
};

/* Struct for type [attached] PROCEDURE [[attached] NONE, [attached] TUPLE [STRING_8]] */
struct S524 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(GE_context*, T0*, T0*);
};

/* Struct for type [attached] TUPLE [GEANT_ECHO_COMMAND] */
struct S525 {
	int id;
	T0* z1;
};

/* Struct for type DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]]] */
struct S527 {
	int id;
	T0* a1; /* item */
};

/* Struct for type KL_TEXT_OUTPUT_FILE */
struct S528 {
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
struct S529 {
	int id;
	T0* z1;
	T0* z2;
	T1 z3;
};

/* Struct for type [attached] PROCEDURE [[attached] NONE, [attached] TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]] */
struct S530 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(GE_context*, T0*, T0*, T0*, T1);
};

/* Struct for type [attached] TUPLE [GEANT_MKDIR_COMMAND] */
struct S532 {
	int id;
	T0* z1;
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]] */
struct S533 {
	int id;
};

/* Struct for type SPECIAL [DS_PAIR [STRING_8, STRING_8]] */
struct S534 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING_8, STRING_8]] */
struct S535 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_CELL [FUNCTION [ANY, TUPLE [STRING_8], BOOLEAN]] */
struct S536 {
	int id;
	T0* a1; /* item */
};

/* Struct for type [attached] PREDICATE [[attached] NONE, [attached] TUPLE [STRING_8]] */
struct S537 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T1 (*f)(GE_context*, T0*, T0*);
};

/* Struct for type [attached] TUPLE [GEANT_AVAILABLE_COMMAND] */
struct S538 {
	int id;
	T0* z1;
};

/* Struct for type DP_SHELL_COMMAND */
struct S540 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* string_command */
	T0* a3; /* command */
	T6 a4; /* return_code */
	T1 a5; /* is_system_code */
};

/* Struct for type DS_CELL [BOOLEAN] */
struct S541 {
	int id;
	T1 a1; /* item */
};

/* Struct for type DS_HASH_SET_CURSOR [STRING_8] */
struct S543 {
	int id;
	T6 a1; /* position */
	T0* a2; /* container */
	T0* a3; /* next_cursor */
};

/* Struct for type GEANT_FILESET_ENTRY */
struct S544 {
	int id;
	T0* a1; /* filename */
	T0* a2; /* mapped_filename */
};

/* Struct for type KL_BOOLEAN_ROUTINES */
struct S545 {
	int id;
};

/* Struct for type ARRAY [BOOLEAN] */
struct S546 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type GEANT_VARIABLES_VARIABLE_RESOLVER */
struct S547 {
	int id;
	T0* a1; /* variables */
};

/* Struct for type RX_PCRE_REGULAR_EXPRESSION */
struct S548 {
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
struct S549 {
	int id;
};

/* Struct for type KL_STDIN_FILE */
struct S550 {
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

/* Struct for type ARRAY [GEANT_VARIABLES] */
struct S551 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_HASH_SET_CURSOR [INTEGER_32] */
struct S552 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type detachable KL_EQUALITY_TESTER [INTEGER_32] */
struct S553 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY] */
struct S554 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [GEANT_FILESET_ENTRY] */
struct S555 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type detachable KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY] */
struct S556 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY] */
struct S557 {
	int id;
};

/* Struct for type LX_WILDCARD_PARSER */
struct S559 {
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
	T0* a45; /* yy_pushed_start_conditions */
	T0* a46; /* yyspecial_routines1 */
	T6 a47; /* yyvsc1 */
	T0* a48; /* yyvs1 */
	T0* a49; /* yyspecial_routines2 */
	T6 a50; /* yyvsc2 */
	T0* a51; /* yyvs2 */
	T0* a52; /* yyspecial_routines3 */
	T6 a53; /* yyvsc3 */
	T0* a54; /* yyvs3 */
	T0* a55; /* yyspecial_routines4 */
	T6 a56; /* yyvsc4 */
	T0* a57; /* yyvs4 */
	T0* a58; /* yyspecial_routines5 */
	T6 a59; /* yyvsc5 */
	T0* a60; /* yyvs5 */
	T0* a61; /* yytypes1 */
	T0* a62; /* yytypes2 */
	T6 a63; /* yy_start */
	T6 a64; /* yyvsp1 */
	T6 a65; /* yyvsp2 */
	T6 a66; /* yyvsp3 */
	T6 a67; /* yyvsp4 */
	T6 a68; /* yyvsp5 */
	T1 a69; /* yy_more_flag */
	T6 a70; /* yy_more_len */
	T6 a71; /* line */
	T6 a72; /* column */
	T6 a73; /* position */
	T6 a74; /* yy_start_state */
	T0* a75; /* yy_state_stack */
	T6 a76; /* yy_state_count */
	T0* a77; /* yy_content_area */
	T0* a78; /* yy_ec */
	T0* a79; /* yy_content */
	T0* a80; /* yy_accept */
	T6 a81; /* yy_last_accepting_state */
	T6 a82; /* yy_last_accepting_cpos */
	T0* a83; /* yy_chk */
	T0* a84; /* yy_base */
	T0* a85; /* yy_def */
	T0* a86; /* yy_meta */
	T0* a87; /* yy_nxt */
	T6 a88; /* yy_lp */
	T0* a89; /* yy_acclist */
	T6 a90; /* yy_looking_for_trail_begin */
	T6 a91; /* yy_full_match */
	T6 a92; /* yy_full_state */
	T6 a93; /* yy_full_lp */
	T1 a94; /* yy_rejected */
	T0* a95; /* last_detachable_any_value */
	T6 a96; /* last_integer_value */
	T1 a97; /* in_trail_context */
	T0* a98; /* rule */
	T1 a99; /* has_trail_context */
	T6 a100; /* head_count */
	T6 a101; /* head_line */
	T6 a102; /* head_column */
	T6 a103; /* trail_count */
	T6 a104; /* rule_line_nb */
};

/* Struct for type LX_DESCRIPTION */
struct S560 {
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
struct S561 {
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

/* Struct for type KL_NULL_TEXT_OUTPUT_STREAM */
struct S563 {
	int id;
	T0* a1; /* name */
};

/* Struct for type RX_BYTE_CODE */
struct S568 {
	int id;
	T6 a1; /* count */
	T0* a2; /* byte_code */
	T0* a3; /* character_sets */
	T6 a4; /* capacity */
	T6 a5; /* character_sets_count */
	T6 a6; /* character_sets_capacity */
};

/* Struct for type RX_CHARACTER_SET */
struct S569 {
	int id;
	T0* a1; /* set */
};

/* Struct for type RX_CASE_MAPPING */
struct S570 {
	int id;
	T0* a1; /* lower_table */
	T0* a2; /* flip_table */
};

/* Struct for type SPECIAL [RX_CHARACTER_SET] */
struct S572 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [RX_CHARACTER_SET] */
struct S573 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_ARRAYED_LIST [LX_RULE] */
struct S574 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type LX_START_CONDITIONS */
struct S575 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type LX_ACTION_FACTORY */
struct S576 {
	int id;
};

/* Struct for type DS_ARRAYED_STACK [INTEGER_32] */
struct S577 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
};

/* Struct for type LX_SYMBOL_CLASS */
struct S578 {
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
struct S579 {
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
struct S580 {
	int id;
};

/* Struct for type SPECIAL [LX_SYMBOL_CLASS] */
struct S581 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_NFA] */
struct S582 {
	int id;
};

/* Struct for type LX_NFA */
struct S583 {
	int id;
	T1 a1; /* in_trail_context */
	T0* a2; /* states */
};

/* Struct for type SPECIAL [LX_NFA] */
struct S584 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type LX_EQUIVALENCE_CLASSES */
struct S585 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
};

/* Struct for type LX_RULE */
struct S586 {
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
struct S587 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
struct S588 {
	int id;
	T6 a1; /* position */
	T0* a2; /* container */
	T0* a3; /* next_cursor */
};

/* Struct for type LX_UNRECOGNIZED_RULE_ERROR */
struct S589 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_MISSING_QUOTE_ERROR */
struct S590 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_BAD_CHARACTER_CLASS_ERROR */
struct S591 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_BAD_CHARACTER_ERROR */
struct S592 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_FULL_AND_META_ERROR */
struct S593 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_FULL_AND_REJECT_ERROR */
struct S594 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR */
struct S595 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_CHARACTER_OUT_OF_RANGE_ERROR */
struct S596 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type SPECIAL [LX_RULE] */
struct S597 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [LX_RULE] */
struct S598 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type LX_DFA_STATE */
struct S599 {
	int id;
	T0* a1; /* accepted_rules */
	T0* a2; /* states */
	T0* a3; /* transitions */
	T0* a4; /* accepted_head_rules */
	T6 a5; /* code */
	T6 a6; /* id */
};

/* Struct for type DS_ARRAYED_LIST [LX_NFA_STATE] */
struct S600 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* equality_tester */
	T0* a4; /* special_routines */
	T6 a5; /* capacity */
	T0* a6; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST [LX_DFA_STATE] */
struct S601 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T0* a5; /* internal_cursor */
};

/* Struct for type LX_SYMBOL_PARTITIONS */
struct S602 {
	int id;
	T0* a1; /* symbols */
	T0* a2; /* storage */
	T6 a3; /* count */
};

/* Struct for type KL_ARRAY_ROUTINES [LX_RULE] */
struct S603 {
	int id;
};

/* Struct for type LX_START_CONDITION */
struct S604 {
	int id;
	T0* a1; /* name */
	T6 a2; /* id */
	T1 a3; /* is_exclusive */
	T0* a4; /* patterns */
	T0* a5; /* bol_patterns */
};

/* Struct for type LX_TRANSITION_TABLE [LX_DFA_STATE] */
struct S605 {
	int id;
	T0* a1; /* storage */
	T0* a2; /* array_routines */
	T6 a3; /* count */
};

/* Struct for type DS_ARRAYED_LIST [LX_NFA] */
struct S606 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T6 a5; /* count */
};

/* Struct for type DS_HASH_TABLE [LX_NFA, INTEGER_32] */
struct S607 {
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
struct S608 {
	int id;
	T1 a1; /* in_trail_context */
	T0* a2; /* transition */
	T0* a3; /* epsilon_transition */
	T6 a4; /* id */
	T0* a5; /* accepted_rule */
};

/* Struct for type KL_BINARY_INPUT_FILE */
struct S609 {
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
struct S610 {
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
struct S615 {
	int id;
	T0* a1; /* storage */
	T0* a2; /* internal_name */
	T1 a3; /* is_normalized */
};

/* Struct for type RAW_FILE */
struct S616 {
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
struct S617 {
	int id;
	T14 a1; /* last_entry_pointer */
	T6 a2; /* mode */
	T14 a3; /* directory_pointer */
	T0* a4; /* lastentry */
	T0* a5; /* internal_name */
	T0* a6; /* internal_detachable_name_pointer */
};

/* Struct for type ARRAYED_LIST [READABLE_STRING_32] */
struct S618 {
	int id;
	T6 a1; /* index */
	T0* a2; /* area_v2 */
};

/* Struct for type [attached] TUPLE [ARRAYED_LIST [READABLE_STRING_32]] */
struct S619 {
	int id;
	T0* z1;
};

/* Struct for type LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR */
struct S620 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_RULE] */
struct S621 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_RULE] */
struct S622 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [LX_START_CONDITION] */
struct S623 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_START_CONDITION] */
struct S624 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION] */
struct S625 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
struct S626 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE] */
struct S629 {
	int id;
	T0* a1; /* label */
	T0* a2; /* target */
};

/* Struct for type LX_EPSILON_TRANSITION [LX_NFA_STATE] */
struct S631 {
	int id;
	T0* a1; /* target */
};

/* Struct for type LX_SYMBOL_TRANSITION [LX_NFA_STATE] */
struct S633 {
	int id;
	T6 a1; /* label */
	T0* a2; /* target */
};

/* Struct for type DS_BILINKABLE [INTEGER_32] */
struct S634 {
	int id;
	T6 a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
};

/* Struct for type SPECIAL [DS_BILINKABLE [INTEGER_32]] */
struct S635 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [DS_BILINKABLE [INTEGER_32]] */
struct S636 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type LX_ACTION */
struct S638 {
	int id;
	T0* a1; /* text */
};

/* Struct for type DS_BUBBLE_SORTER [LX_NFA_STATE] */
struct S639 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type DS_BUBBLE_SORTER [LX_RULE] */
struct S641 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type SPECIAL [LX_NFA_STATE] */
struct S643 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_NFA_STATE] */
struct S645 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE] */
struct S646 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [LX_DFA_STATE] */
struct S648 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_DFA_STATE] */
struct S649 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE] */
struct S650 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_ARRAY [LX_RULE] */
struct S651 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [detachable LX_DFA_STATE] */
struct S652 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type KL_ARRAY_ROUTINES [detachable LX_DFA_STATE] */
struct S653 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_NFA] */
struct S654 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32] */
struct S656 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type STRING_8_SEARCHER */
struct S657 {
	int id;
	T0* a1; /* deltas */
};

/* Struct for type HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32] */
struct S658 {
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
struct S662 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type KL_COMPARABLE_COMPARATOR [LX_RULE] */
struct S664 {
	int id;
};

/* Struct for type KL_COMPARABLE_COMPARATOR [LX_NFA_STATE] */
struct S667 {
	int id;
};

/* Struct for type ARRAYED_LIST [READABLE_STRING_GENERAL] */
struct S670 {
	int id;
	T6 a1; /* index */
	T0* a2; /* area_v2 */
};

/* Struct for type [attached] TUPLE [ARRAYED_LIST [READABLE_STRING_GENERAL]] */
struct S671 {
	int id;
	T0* z1;
};

/* Struct for type SPECIAL [READABLE_STRING_32] */
struct S672 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_COMPARABLE_COMPARATOR [INTEGER_32] */
struct S673 {
	int id;
};

/* Struct for type SPECIAL [NATIVE_STRING] */
struct S676 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [READABLE_STRING_GENERAL] */
struct S677 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

typedef struct {
	int id;
	EIF_INTEGER type_id;
	EIF_BOOLEAN is_special;
	void (*dispose) (GE_context*, EIF_REFERENCE);
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
extern T19 GE_default19;
extern T22 GE_default22;
extern T23 GE_default23;
extern T24 GE_default24;
extern T25 GE_default25;
extern T26 GE_default26;
extern T27 GE_default27;
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
extern T39 GE_default39;
extern T40 GE_default40;
extern T41 GE_default41;
extern T42 GE_default42;
extern T43 GE_default43;
extern T44 GE_default44;
extern T45 GE_default45;
extern T47 GE_default47;
extern T52 GE_default52;
extern T53 GE_default53;
extern T54 GE_default54;
extern T55 GE_default55;
extern T56 GE_default56;
extern T58 GE_default58;
extern T60 GE_default60;
extern T62 GE_default62;
extern T64 GE_default64;
extern T65 GE_default65;
extern T66 GE_default66;
extern T67 GE_default67;
extern T68 GE_default68;
extern T69 GE_default69;
extern T70 GE_default70;
extern T73 GE_default73;
extern T74 GE_default74;
extern T75 GE_default75;
extern T76 GE_default76;
extern T77 GE_default77;
extern T78 GE_default78;
extern T79 GE_default79;
extern T80 GE_default80;
extern T81 GE_default81;
extern T82 GE_default82;
extern T83 GE_default83;
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
extern T100 GE_default100;
extern T101 GE_default101;
extern T104 GE_default104;
extern T105 GE_default105;
extern T106 GE_default106;
extern T108 GE_default108;
extern T109 GE_default109;
extern T111 GE_default111;
extern T112 GE_default112;
extern T113 GE_default113;
extern T114 GE_default114;
extern T115 GE_default115;
extern T116 GE_default116;
extern T117 GE_default117;
extern T118 GE_default118;
extern T119 GE_default119;
extern T123 GE_default123;
extern T124 GE_default124;
extern T125 GE_default125;
extern T127 GE_default127;
extern T128 GE_default128;
extern T129 GE_default129;
extern T130 GE_default130;
extern T131 GE_default131;
extern T133 GE_default133;
extern T135 GE_default135;
extern T137 GE_default137;
extern T139 GE_default139;
extern T140 GE_default140;
extern T143 GE_default143;
extern T144 GE_default144;
extern T145 GE_default145;
extern T146 GE_default146;
extern T147 GE_default147;
extern T150 GE_default150;
extern T151 GE_default151;
extern T152 GE_default152;
extern T153 GE_default153;
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
extern T166 GE_default166;
extern T168 GE_default168;
extern T169 GE_default169;
extern T170 GE_default170;
extern T171 GE_default171;
extern T172 GE_default172;
extern T175 GE_default175;
extern T176 GE_default176;
extern T177 GE_default177;
extern T178 GE_default178;
extern T179 GE_default179;
extern T180 GE_default180;
extern T181 GE_default181;
extern T183 GE_default183;
extern T184 GE_default184;
extern T186 GE_default186;
extern T187 GE_default187;
extern T188 GE_default188;
extern T189 GE_default189;
extern T191 GE_default191;
extern T193 GE_default193;
extern T194 GE_default194;
extern T195 GE_default195;
extern T196 GE_default196;
extern T197 GE_default197;
extern T198 GE_default198;
extern T199 GE_default199;
extern T200 GE_default200;
extern T201 GE_default201;
extern T202 GE_default202;
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
extern T214 GE_default214;
extern T215 GE_default215;
extern T216 GE_default216;
extern T217 GE_default217;
extern T218 GE_default218;
extern T219 GE_default219;
extern T220 GE_default220;
extern T223 GE_default223;
extern T224 GE_default224;
extern T226 GE_default226;
extern T227 GE_default227;
extern T228 GE_default228;
extern T229 GE_default229;
extern T230 GE_default230;
extern T231 GE_default231;
extern T232 GE_default232;
extern T236 GE_default236;
extern T239 GE_default239;
extern T241 GE_default241;
extern T242 GE_default242;
extern T243 GE_default243;
extern T244 GE_default244;
extern T245 GE_default245;
extern T247 GE_default247;
extern T248 GE_default248;
extern T249 GE_default249;
extern T251 GE_default251;
extern T252 GE_default252;
extern T253 GE_default253;
extern T254 GE_default254;
extern T255 GE_default255;
extern T256 GE_default256;
extern T257 GE_default257;
extern T258 GE_default258;
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
extern T273 GE_default273;
extern T274 GE_default274;
extern T275 GE_default275;
extern T276 GE_default276;
extern T278 GE_default278;
extern T279 GE_default279;
extern T280 GE_default280;
extern T284 GE_default284;
extern T285 GE_default285;
extern T286 GE_default286;
extern T287 GE_default287;
extern T290 GE_default290;
extern T291 GE_default291;
extern T293 GE_default293;
extern T294 GE_default294;
extern T295 GE_default295;
extern T296 GE_default296;
extern T297 GE_default297;
extern T298 GE_default298;
extern T299 GE_default299;
extern T300 GE_default300;
extern T301 GE_default301;
extern T303 GE_default303;
extern T304 GE_default304;
extern T305 GE_default305;
extern T306 GE_default306;
extern T307 GE_default307;
extern T308 GE_default308;
extern T312 GE_default312;
extern T314 GE_default314;
extern T318 GE_default318;
extern T319 GE_default319;
extern T320 GE_default320;
extern T322 GE_default322;
extern T324 GE_default324;
extern T325 GE_default325;
extern T326 GE_default326;
extern T327 GE_default327;
extern T328 GE_default328;
extern T330 GE_default330;
extern T331 GE_default331;
extern T332 GE_default332;
extern T333 GE_default333;
extern T334 GE_default334;
extern T335 GE_default335;
extern T336 GE_default336;
extern T337 GE_default337;
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
extern T354 GE_default354;
extern T355 GE_default355;
extern T356 GE_default356;
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
extern T390 GE_default390;
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
extern T408 GE_default408;
extern T409 GE_default409;
extern T410 GE_default410;
extern T411 GE_default411;
extern T412 GE_default412;
extern T413 GE_default413;
extern T414 GE_default414;
extern T415 GE_default415;
extern T416 GE_default416;
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
extern T486 GE_default486;
extern T487 GE_default487;
extern T489 GE_default489;
extern T490 GE_default490;
extern T491 GE_default491;
extern T492 GE_default492;
extern T494 GE_default494;
extern T495 GE_default495;
extern T496 GE_default496;
extern T497 GE_default497;
extern T499 GE_default499;
extern T500 GE_default500;
extern T501 GE_default501;
extern T502 GE_default502;
extern T509 GE_default509;
extern T512 GE_default512;
extern T513 GE_default513;
extern T516 GE_default516;
extern T518 GE_default518;
extern T520 GE_default520;
extern T522 GE_default522;
extern T523 GE_default523;
extern T524 GE_default524;
extern T525 GE_default525;
extern T527 GE_default527;
extern T528 GE_default528;
extern T529 GE_default529;
extern T530 GE_default530;
extern T532 GE_default532;
extern T533 GE_default533;
extern T534 GE_default534;
extern T535 GE_default535;
extern T536 GE_default536;
extern T537 GE_default537;
extern T538 GE_default538;
extern T540 GE_default540;
extern T541 GE_default541;
extern T543 GE_default543;
extern T544 GE_default544;
extern T545 GE_default545;
extern T546 GE_default546;
extern T547 GE_default547;
extern T548 GE_default548;
extern T549 GE_default549;
extern T550 GE_default550;
extern T551 GE_default551;
extern T552 GE_default552;
extern T553 GE_default553;
extern T554 GE_default554;
extern T555 GE_default555;
extern T556 GE_default556;
extern T557 GE_default557;
extern T559 GE_default559;
extern T560 GE_default560;
extern T561 GE_default561;
extern T563 GE_default563;
extern T568 GE_default568;
extern T569 GE_default569;
extern T570 GE_default570;
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
extern T606 GE_default606;
extern T607 GE_default607;
extern T608 GE_default608;
extern T609 GE_default609;
extern T610 GE_default610;
extern T615 GE_default615;
extern T616 GE_default616;
extern T617 GE_default617;
extern T618 GE_default618;
extern T619 GE_default619;
extern T620 GE_default620;
extern T621 GE_default621;
extern T622 GE_default622;
extern T623 GE_default623;
extern T624 GE_default624;
extern T625 GE_default625;
extern T626 GE_default626;
extern T629 GE_default629;
extern T631 GE_default631;
extern T633 GE_default633;
extern T634 GE_default634;
extern T635 GE_default635;
extern T636 GE_default636;
extern T638 GE_default638;
extern T639 GE_default639;
extern T641 GE_default641;
extern T643 GE_default643;
extern T645 GE_default645;
extern T646 GE_default646;
extern T648 GE_default648;
extern T649 GE_default649;
extern T650 GE_default650;
extern T651 GE_default651;
extern T652 GE_default652;
extern T653 GE_default653;
extern T654 GE_default654;
extern T656 GE_default656;
extern T657 GE_default657;
extern T658 GE_default658;
extern T662 GE_default662;
extern T664 GE_default664;
extern T667 GE_default667;
extern T670 GE_default670;
extern T671 GE_default671;
extern T672 GE_default672;
extern T673 GE_default673;
extern T676 GE_default676;
extern T677 GE_default677;

extern T0* GE_ms8(const char *s, T6 c);
extern T0* GE_ms32(char* s, T6 c);
/* Call to ANY.same_type */
extern T1 T20x27T0(GE_context* ac, T0* C, T0* a1);
/* Call to GEANT_VARIABLES.has */
extern T1 T36x2517T0(GE_context* ac, T0* C, T0* a1);
/* Call to GEANT_VARIABLES.item_for_iteration */
extern T0* T36x2584(GE_context* ac, T0* C);
/* Call to GEANT_VARIABLES.key_for_iteration */
extern T0* T36x2509(GE_context* ac, T0* C);
/* Call to GEANT_VARIABLES.after */
extern T1 T36x2564(GE_context* ac, T0* C);
/* Call to GEANT_VARIABLES.found_item */
extern T0* T36x2607(GE_context* ac, T0* C);
/* Call to GEANT_VARIABLES.found */
extern T1 T36x2615(GE_context* ac, T0* C);
/* Call to AP_OPTION.short_form */
extern T2 T49x3077(GE_context* ac, T0* C);
/* Call to AP_OPTION.long_form */
extern T0* T49x3072(GE_context* ac, T0* C);
/* Call to AP_OPTION.example */
extern T0* T49x3071(GE_context* ac, T0* C);
/* Call to AP_OPTION.is_hidden */
extern T1 T49x3081(GE_context* ac, T0* C);
/* Call to AP_OPTION.description */
extern T0* T49x3070(GE_context* ac, T0* C);
/* Call to AP_OPTION.names */
extern T0* T49x3074(GE_context* ac, T0* C);
/* Call to AP_OPTION.name */
extern T0* T49x3073(GE_context* ac, T0* C);
/* Call to AP_OPTION.needs_parameter */
extern T1 T49x3083(GE_context* ac, T0* C);
/* Call to AP_OPTION.has_short_form */
extern T1 T49x3080(GE_context* ac, T0* C);
/* Call to AP_OPTION.allows_parameter */
extern T1 T49x3078(GE_context* ac, T0* C);
/* Call to AP_OPTION.maximum_occurrences */
extern T6 T49x3076(GE_context* ac, T0* C);
/* Call to AP_OPTION.occurrences */
extern T6 T49x3075(GE_context* ac, T0* C);
/* Call to AP_OPTION.was_found */
extern T1 T49x3085(GE_context* ac, T0* C);
/* Call to AP_OPTION.is_mandatory */
extern T1 T49x3082(GE_context* ac, T0* C);
/* Call to UT_ERROR.default_message */
extern T0* T57x3405(GE_context* ac, T0* C);
/* Call to READABLE_STRING_GENERAL.code */
extern T10 T72x404T6(GE_context* ac, T0* C, T6 a1);
/* Call to READABLE_STRING_GENERAL.count */
extern T6 T72x442(GE_context* ac, T0* C);
/* Call to READABLE_STRING_GENERAL.substring */
extern T0* T72x483T6T6(GE_context* ac, T0* C, T6 a1, T6 a2);
/* Call to READABLE_STRING_GENERAL.item */
extern T3 T72x405T6(GE_context* ac, T0* C, T6 a1);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_key */
extern T0* T123x2511T0(GE_context* ac, T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_item */
extern T0* T123x2592T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.start_condition */
extern T6 T183x7989(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.is_applicable_encoding */
extern T1 T183x7858T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.end_of_file */
extern T1 T183x7995(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.last_value */
extern T0* T183x7869(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.last_token */
extern T6 T183x7985(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.error_position */
extern T0* T183x7867(GE_context* ac, T0* C);
/* Call to XM_DOCUMENT_NODE.parent */
extern T0* T234x7310(GE_context* ac, T0* C);
/* Call to XM_ELEMENT_NODE.parent */
extern T0* T311x7310(GE_context* ac, T0* C);
/* Call to GEANT_TASK.exit_code */
extern T6 T315x9352(GE_context* ac, T0* C);
/* Call to GEANT_TASK.is_exit_command */
extern T1 T315x9353(GE_context* ac, T0* C);
/* Call to GEANT_TASK.is_enabled */
extern T1 T315x2900(GE_context* ac, T0* C);
/* Call to GEANT_TASK.is_executable */
extern T1 T315x9351(GE_context* ac, T0* C);
/* Call to FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK].item with a manifest tuple argument of type [attached] TUPLE [XM_ELEMENT] */
extern T0* T338xmt9426T334(GE_context* ac, T0* C, T0* a1);
/* Call to detachable LX_TRANSITION [LX_NFA_STATE].target */
extern T0* T630x14160(GE_context* ac, T0* C);
/* Call to detachable LX_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T630x14163T6(GE_context* ac, T0* C, T6 a1);
/* Call to EXCEPTION.set_type_name */
extern void T28x2316T0(GE_context* ac, T0* C, T0* a1);
/* Call to EXCEPTION.set_recipient_name */
extern void T28x2312T0(GE_context* ac, T0* C, T0* a1);
/* Call to EXCEPTION.set_description */
extern void T28x2304T0(GE_context* ac, T0* C, T0* a1);
/* Call to EXCEPTION.set_exception_trace */
extern void T28x2318T0(GE_context* ac, T0* C, T0* a1);
/* Call to EXCEPTION.set_throwing_exception */
extern void T28x2311T0(GE_context* ac, T0* C, T0* a1);
/* Call to GEANT_VARIABLES.replace */
extern void T36x2519T0T0(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Call to GEANT_VARIABLES.set_variable_value */
extern void T36x2425T0T0(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Call to GEANT_VARIABLES.forth */
extern void T36x2568(GE_context* ac, T0* C);
/* Call to GEANT_VARIABLES.start */
extern void T36x2567(GE_context* ac, T0* C);
/* Call to GEANT_VARIABLES.search */
extern void T36x2624T0(GE_context* ac, T0* C, T0* a1);
/* Call to GEANT_VARIABLES.force_last */
extern void T36x2494T0T0(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Call to AP_OPTION.record_occurrence */
extern void T49x3096T0(GE_context* ac, T0* C, T0* a1);
/* Call to AP_OPTION.reset */
extern void T49x3097(GE_context* ac, T0* C);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_forth */
extern void T123x2581T0(GE_context* ac, T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_start */
extern void T123x2580T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_CALLBACKS_FILTER.set_next */
extern void T141x6548T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_xml_declaration */
extern void T142x6716T0T0T1(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* Call to XM_CALLBACKS.on_attribute */
extern void T142x6721T0T0T0T0(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* Call to XM_CALLBACKS.on_error */
extern void T142x6717T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_end_tag */
extern void T142x6723T0T0T0(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_start_tag_finish */
extern void T142x6722(GE_context* ac, T0* C);
/* Call to XM_CALLBACKS.on_start_tag */
extern void T142x6720T0T0T0(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_content */
extern void T142x6724T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_processing_instruction */
extern void T142x6718T0T0(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Call to XM_CALLBACKS.on_comment */
extern void T142x6719T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_finish */
extern void T142x6715(GE_context* ac, T0* C);
/* Call to XM_CALLBACKS.on_start */
extern void T142x6714(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.close_input */
extern void T183x7854(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T183x7853T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.set_encoding */
extern void T183x7859T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T183x7850(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.read_token */
extern void T183x8003(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_stream */
extern void T183x7852T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_DOCUMENT_NODE.node_set_parent */
extern void T234x7334T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_ELEMENT_NODE.node_set_parent */
extern void T311x7334T0(GE_context* ac, T0* C, T0* a1);
/* Call to GEANT_TASK.execute */
extern void T315x9355(GE_context* ac, T0* C);
/* Call to GEANT_TASK.log_validation_messages */
extern void T315x9356(GE_context* ac, T0* C);
/* Call to detachable LX_TRANSITION [LX_NFA_STATE].record */
extern void T630x14164T0(GE_context* ac, T0* C, T0* a1);
/* New instance of type SPECIAL [CHARACTER_8] */
extern T0* GE_new15(T6 a1, T1 initialize);
/* New instance of type SPECIAL [CHARACTER_32] */
extern T0* GE_new16(T6 a1, T1 initialize);
/* New instance of type STRING_8 */
extern T0* GE_new17(T1 initialize);
/* New instance of type STRING_32 */
extern T0* GE_new18(T1 initialize);
/* New instance of type ISE_EXCEPTION_MANAGER */
extern T0* GE_new19(T1 initialize);
/* New instance of type GEANT */
extern T0* GE_new22(T1 initialize);
/* New instance of type HASH_TABLE [INTEGER_32, INTEGER_32] */
extern T0* GE_new23(T1 initialize);
/* New instance of type CELL [detachable TUPLE [INTEGER_32, INTEGER_32, INTEGER_32, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, INTEGER_32, BOOLEAN]] */
extern T0* GE_new24(T1 initialize);
/* New instance of type CELL [detachable EXCEPTION] */
extern T0* GE_new25(T1 initialize);
/* New instance of type CELL [NO_MORE_MEMORY] */
extern T0* GE_new26(T1 initialize);
/* New instance of type [attached] TUPLE [INTEGER_32, INTEGER_32, INTEGER_32, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, INTEGER_32, BOOLEAN] */
extern T0* GE_new27(T1 initialize);
/* New instance of type GEANT_PROJECT */
extern T0* GE_new29(T1 initialize);
/* New instance of type GEANT_PROJECT_LOADER */
extern T0* GE_new30(T1 initialize);
/* New instance of type GEANT_PROJECT_OPTIONS */
extern T0* GE_new31(T1 initialize);
/* New instance of type GEANT_PROJECT_VARIABLES */
extern T0* GE_new32(T1 initialize);
/* New instance of type GEANT_TARGET */
extern T0* GE_new33(T1 initialize);
/* New instance of type KL_ARGUMENTS */
extern T0* GE_new34(T1 initialize);
/* New instance of type UT_ERROR_HANDLER */
extern T0* GE_new35(T1 initialize);
/* New instance of type GEANT_VARIABLES */
extern T0* GE_new36(T1 initialize);
/* New instance of type GEANT_PROJECT_ELEMENT */
extern T0* GE_new37(T1 initialize);
/* New instance of type DS_HASH_TABLE [GEANT_TARGET, STRING_8] */
extern T0* GE_new38(T1 initialize);
/* New instance of type SPECIAL [STRING_8] */
extern T0* GE_new39(T6 a1, T1 initialize);
/* New instance of type ARRAY [STRING_8] */
extern T0* GE_new40(T1 initialize);
/* New instance of type GEANT_ARGUMENT_VARIABLES */
extern T0* GE_new41(T1 initialize);
/* New instance of type AP_FLAG */
extern T0* GE_new42(T1 initialize);
/* New instance of type AP_ALTERNATIVE_OPTIONS_LIST */
extern T0* GE_new43(T1 initialize);
/* New instance of type AP_STRING_OPTION */
extern T0* GE_new44(T1 initialize);
/* New instance of type AP_PARSER */
extern T0* GE_new45(T1 initialize);
/* New instance of type AP_ERROR */
extern T0* GE_new47(T1 initialize);
/* New instance of type AP_ERROR_HANDLER */
extern T0* GE_new52(T1 initialize);
/* New instance of type KL_STANDARD_FILES */
extern T0* GE_new53(T1 initialize);
/* New instance of type KL_STDERR_FILE */
extern T0* GE_new54(T1 initialize);
/* New instance of type KL_EXCEPTIONS */
extern T0* GE_new55(T1 initialize);
/* New instance of type UT_VERSION_NUMBER */
extern T0* GE_new56(T1 initialize);
/* New instance of type VOID_TARGET */
extern T0* GE_new58(T1 initialize);
/* New instance of type ROUTINE_FAILURE */
extern T0* GE_new60(T1 initialize);
/* New instance of type OLD_VIOLATION */
extern T0* GE_new62(T1 initialize);
/* New instance of type NO_MORE_MEMORY */
extern T0* GE_new64(T1 initialize);
/* New instance of type INVARIANT_VIOLATION */
extern T0* GE_new65(T1 initialize);
/* New instance of type OPERATING_SYSTEM_SIGNAL_FAILURE */
extern T0* GE_new66(T1 initialize);
/* New instance of type IO_FAILURE */
extern T0* GE_new67(T1 initialize);
/* New instance of type OPERATING_SYSTEM_FAILURE */
extern T0* GE_new68(T1 initialize);
/* New instance of type COM_FAILURE */
extern T0* GE_new69(T1 initialize);
/* New instance of type EIFFEL_RUNTIME_PANIC */
extern T0* GE_new70(T1 initialize);
/* New instance of type PRECONDITION_VIOLATION */
extern T0* GE_new73(T1 initialize);
/* New instance of type POSTCONDITION_VIOLATION */
extern T0* GE_new74(T1 initialize);
/* New instance of type FLOATING_POINT_FAILURE */
extern T0* GE_new75(T1 initialize);
/* New instance of type CHECK_VIOLATION */
extern T0* GE_new76(T1 initialize);
/* New instance of type BAD_INSPECT_VALUE */
extern T0* GE_new77(T1 initialize);
/* New instance of type VARIANT_VIOLATION */
extern T0* GE_new78(T1 initialize);
/* New instance of type LOOP_INVARIANT_VIOLATION */
extern T0* GE_new79(T1 initialize);
/* New instance of type RESCUE_FAILURE */
extern T0* GE_new80(T1 initialize);
/* New instance of type RESUMPTION_FAILURE */
extern T0* GE_new81(T1 initialize);
/* New instance of type CREATE_ON_DEFERRED */
extern T0* GE_new82(T1 initialize);
/* New instance of type EXTERNAL_FAILURE */
extern T0* GE_new83(T1 initialize);
/* New instance of type VOID_ASSIGNED_TO_EXPANDED */
extern T0* GE_new84(T1 initialize);
/* New instance of type EXCEPTION_IN_SIGNAL_HANDLER_FAILURE */
extern T0* GE_new85(T1 initialize);
/* New instance of type MISMATCH_FAILURE */
extern T0* GE_new86(T1 initialize);
/* New instance of type DEVELOPER_EXCEPTION */
extern T0* GE_new87(T1 initialize);
/* New instance of type ADDRESS_APPLIED_TO_MELTED_FEATURE */
extern T0* GE_new88(T1 initialize);
/* New instance of type SERIALIZATION_FAILURE */
extern T0* GE_new89(T1 initialize);
/* New instance of type KL_OPERATING_SYSTEM */
extern T0* GE_new90(T1 initialize);
/* New instance of type KL_WINDOWS_FILE_SYSTEM */
extern T0* GE_new92(T1 initialize);
/* New instance of type KL_UNIX_FILE_SYSTEM */
extern T0* GE_new93(T1 initialize);
/* New instance of type PRIMES */
extern T0* GE_new94(T1 initialize);
/* New instance of type SPECIAL [INTEGER_32] */
extern T0* GE_new95(T6 a1, T1 initialize);
/* New instance of type SPECIAL [BOOLEAN] */
extern T0* GE_new96(T6 a1, T1 initialize);
/* New instance of type KL_TEXT_INPUT_FILE */
extern T0* GE_new97(T1 initialize);
/* New instance of type GEANT_PROJECT_PARSER */
extern T0* GE_new98(T1 initialize);
/* New instance of type GEANT_PROJECT_VARIABLE_RESOLVER */
extern T0* GE_new100(T1 initialize);
/* New instance of type UC_STRING_EQUALITY_TESTER */
extern T0* GE_new101(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [STRING_8] */
extern T0* GE_new104(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
extern T0* GE_new105(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [INTEGER_32] */
extern T0* GE_new106(T1 initialize);
/* New instance of type KL_STDOUT_FILE */
extern T0* GE_new108(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [AP_OPTION] */
extern T0* GE_new109(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [detachable STRING_8] */
extern T0* GE_new111(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [detachable STRING_8] */
extern T0* GE_new112(T1 initialize);
/* New instance of type AP_DISPLAY_HELP_FLAG */
extern T0* GE_new113(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [AP_OPTION] */
extern T0* GE_new114(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST] */
extern T0* GE_new115(T1 initialize);
/* New instance of type KL_STRING_ROUTINES */
extern T0* GE_new116(T1 initialize);
/* New instance of type MANAGED_POINTER */
extern T0* GE_new118(T1 initialize);
/* New instance of type FILE_INFO */
extern T0* GE_new119(T1 initialize);
/* New instance of type DS_HASH_TABLE [STRING_8, STRING_8] */
extern T0* GE_new123(T1 initialize);
/* New instance of type ARGUMENTS_32 */
extern T0* GE_new124(T1 initialize);
/* New instance of type IMMUTABLE_STRING_32 */
extern T0* GE_new125(T1 initialize);
/* New instance of type CELL [INTEGER_32] */
extern T0* GE_new128(T1 initialize);
/* New instance of type C_STRING */
extern T0* GE_new129(T1 initialize);
/* New instance of type EXECUTION_ENVIRONMENT */
extern T0* GE_new130(T1 initialize);
/* New instance of type KL_ANY_ROUTINES */
extern T0* GE_new131(T1 initialize);
/* New instance of type KL_PATHNAME */
extern T0* GE_new133(T1 initialize);
/* New instance of type detachable KL_LINKABLE [CHARACTER_8] */
extern T0* GE_new135(T1 initialize);
/* New instance of type XM_EXPAT_PARSER_FACTORY */
extern T0* GE_new137(T1 initialize);
/* New instance of type XM_EIFFEL_PARSER */
extern T0* GE_new139(T1 initialize);
/* New instance of type XM_TREE_CALLBACKS_PIPE */
extern T0* GE_new140(T1 initialize);
/* New instance of type XM_CALLBACKS_TO_TREE_FILTER */
extern T0* GE_new143(T1 initialize);
/* New instance of type XM_DOCUMENT */
extern T0* GE_new144(T1 initialize);
/* New instance of type XM_ELEMENT */
extern T0* GE_new145(T1 initialize);
/* New instance of type XM_STOP_ON_ERROR_FILTER */
extern T0* GE_new146(T1 initialize);
/* New instance of type XM_POSITION_TABLE */
extern T0* GE_new147(T1 initialize);
/* New instance of type KL_EXECUTION_ENVIRONMENT */
extern T0* GE_new150(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES] */
extern T0* GE_new151(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [GEANT_VARIABLES] */
extern T0* GE_new152(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [AP_OPTION] */
extern T0* GE_new153(T1 initialize);
/* New instance of type SPECIAL [AP_OPTION] */
extern T0* GE_new155(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [AP_OPTION] */
extern T0* GE_new156(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST] */
extern T0* GE_new157(T1 initialize);
/* New instance of type SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
extern T0* GE_new158(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST] */
extern T0* GE_new159(T1 initialize);
/* New instance of type UC_STRING */
extern T0* GE_new160(T1 initialize);
/* New instance of type PLATFORM */
extern T0* GE_new161(T1 initialize);
/* New instance of type READABLE_STRING_32 */
extern T0* GE_new162(T1 initialize);
/* New instance of type SPECIAL [NATURAL_8] */
extern T0* GE_new163(T6 a1, T1 initialize);
/* New instance of type STRING_TO_INTEGER_CONVERTOR */
extern T0* GE_new166(T1 initialize);
/* New instance of type DS_LINKED_LIST [XM_ELEMENT] */
extern T0* GE_new168(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [XM_ELEMENT] */
extern T0* GE_new169(T1 initialize);
/* New instance of type GEANT_INHERIT_ELEMENT */
extern T0* GE_new170(T1 initialize);
/* New instance of type GEANT_INHERIT */
extern T0* GE_new171(T1 initialize);
/* New instance of type SPECIAL [GEANT_TARGET] */
extern T0* GE_new172(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_TARGET] */
extern T0* GE_new175(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8] */
extern T0* GE_new176(T1 initialize);
/* New instance of type STD_FILES */
extern T0* GE_new177(T1 initialize);
/* New instance of type EXCEPTIONS */
extern T0* GE_new178(T1 initialize);
/* New instance of type SPECIAL [IMMUTABLE_STRING_32] */
extern T0* GE_new179(T6 a1, T1 initialize);
/* New instance of type ARRAY [IMMUTABLE_STRING_32] */
extern T0* GE_new180(T1 initialize);
/* New instance of type NATIVE_STRING */
extern T0* GE_new181(T1 initialize);
/* New instance of type XM_EIFFEL_SCANNER */
extern T0* GE_new183(T1 initialize);
/* New instance of type XM_DEFAULT_POSITION */
extern T0* GE_new184(T1 initialize);
/* New instance of type DS_BILINKED_LIST [XM_POSITION] */
extern T0* GE_new186(T1 initialize);
/* New instance of type DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
extern T0* GE_new187(T1 initialize);
/* New instance of type XM_CALLBACKS_NULL */
extern T0* GE_new188(T1 initialize);
/* New instance of type DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
extern T0* GE_new189(T1 initialize);
/* New instance of type XM_NULL_EXTERNAL_RESOLVER */
extern T0* GE_new191(T1 initialize);
/* New instance of type XM_DTD_CALLBACKS_NULL */
extern T0* GE_new193(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [detachable ANY] */
extern T0* GE_new194(T1 initialize);
/* New instance of type SPECIAL [detachable ANY] */
extern T0* GE_new195(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new196(T1 initialize);
/* New instance of type XM_EIFFEL_PARSER_NAME */
extern T0* GE_new197(T1 initialize);
/* New instance of type SPECIAL [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new198(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
extern T0* GE_new199(T1 initialize);
/* New instance of type DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new200(T1 initialize);
/* New instance of type SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
extern T0* GE_new201(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
extern T0* GE_new202(T1 initialize);
/* New instance of type XM_DTD_EXTERNAL_ID */
extern T0* GE_new203(T1 initialize);
/* New instance of type SPECIAL [XM_DTD_EXTERNAL_ID] */
extern T0* GE_new204(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new205(T1 initialize);
/* New instance of type XM_DTD_ELEMENT_CONTENT */
extern T0* GE_new206(T1 initialize);
/* New instance of type SPECIAL [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new207(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
extern T0* GE_new208(T1 initialize);
/* New instance of type DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new209(T1 initialize);
/* New instance of type SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
extern T0* GE_new210(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new211(T1 initialize);
/* New instance of type XM_DTD_ATTRIBUTE_CONTENT */
extern T0* GE_new212(T1 initialize);
/* New instance of type SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new213(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
extern T0* GE_new214(T1 initialize);
/* New instance of type DS_BILINKED_LIST [STRING_8] */
extern T0* GE_new215(T1 initialize);
/* New instance of type SPECIAL [DS_BILINKED_LIST [STRING_8]] */
extern T0* GE_new216(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [BOOLEAN] */
extern T0* GE_new217(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
extern T0* GE_new218(T1 initialize);
/* New instance of type XM_EIFFEL_DECLARATION */
extern T0* GE_new219(T1 initialize);
/* New instance of type SPECIAL [XM_EIFFEL_DECLARATION] */
extern T0* GE_new220(T6 a1, T1 initialize);
/* New instance of type XM_EIFFEL_ENTITY_DEF */
extern T0* GE_new223(T1 initialize);
/* New instance of type XM_EIFFEL_SCANNER_DTD */
extern T0* GE_new224(T1 initialize);
/* New instance of type XM_EIFFEL_PE_ENTITY_DEF */
extern T0* GE_new226(T1 initialize);
/* New instance of type XM_NAMESPACE_RESOLVER */
extern T0* GE_new227(T1 initialize);
/* New instance of type SPECIAL [XM_CALLBACKS_FILTER] */
extern T0* GE_new228(T6 a1, T1 initialize);
/* New instance of type ARRAY [XM_CALLBACKS_FILTER] */
extern T0* GE_new229(T1 initialize);
/* New instance of type DS_HASH_SET [XM_NAMESPACE] */
extern T0* GE_new230(T1 initialize);
/* New instance of type XM_NAMESPACE */
extern T0* GE_new231(T1 initialize);
/* New instance of type XM_LINKED_LIST [XM_DOCUMENT_NODE] */
extern T0* GE_new232(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE] */
extern T0* GE_new236(T1 initialize);
/* New instance of type XM_LINKED_LIST [XM_ELEMENT_NODE] */
extern T0* GE_new239(T1 initialize);
/* New instance of type DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
extern T0* GE_new241(T1 initialize);
/* New instance of type SPECIAL [GEANT_ARGUMENT_VARIABLES] */
extern T0* GE_new242(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES] */
extern T0* GE_new243(T1 initialize);
/* New instance of type SPECIAL [GEANT_VARIABLES] */
extern T0* GE_new244(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_VARIABLES] */
extern T0* GE_new245(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [GEANT_TARGET] */
extern T0* GE_new247(T1 initialize);
/* New instance of type GEANT_TASK_FACTORY */
extern T0* GE_new248(T1 initialize);
/* New instance of type GEANT_PARENT */
extern T0* GE_new249(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [GEANT_PARENT] */
extern T0* GE_new251(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [GEANT_PARENT] */
extern T0* GE_new252(T1 initialize);
/* New instance of type GEANT_INTERPRETING_ELEMENT */
extern T0* GE_new253(T1 initialize);
/* New instance of type GEANT_ARGUMENT_ELEMENT */
extern T0* GE_new254(T1 initialize);
/* New instance of type GEANT_LOCAL_ELEMENT */
extern T0* GE_new255(T1 initialize);
/* New instance of type GEANT_GLOBAL_ELEMENT */
extern T0* GE_new256(T1 initialize);
/* New instance of type XM_ATTRIBUTE */
extern T0* GE_new257(T1 initialize);
/* New instance of type GEANT_GROUP */
extern T0* GE_new258(T1 initialize);
/* New instance of type HEXADECIMAL_STRING_TO_INTEGER_CONVERTER */
extern T0* GE_new264(T1 initialize);
/* New instance of type ARRAY [INTEGER_32] */
extern T0* GE_new265(T1 initialize);
/* New instance of type UC_UTF8_ROUTINES */
extern T0* GE_new266(T1 initialize);
/* New instance of type UC_UTF8_STRING */
extern T0* GE_new267(T1 initialize);
/* New instance of type XM_EIFFEL_INPUT_STREAM */
extern T0* GE_new268(T1 initialize);
/* New instance of type KL_INTEGER_ROUTINES */
extern T0* GE_new269(T1 initialize);
/* New instance of type KL_PLATFORM */
extern T0* GE_new270(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE] */
extern T0* GE_new271(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
extern T0* GE_new272(T1 initialize);
/* New instance of type DS_PAIR [XM_POSITION, XM_NODE] */
extern T0* GE_new273(T1 initialize);
/* New instance of type INTEGER_OVERFLOW_CHECKER */
extern T0* GE_new274(T1 initialize);
/* New instance of type detachable DS_LINKABLE [XM_ELEMENT] */
extern T0* GE_new275(T1 initialize);
/* New instance of type GEANT_PARENT_ELEMENT */
extern T0* GE_new276(T1 initialize);
/* New instance of type XM_EIFFEL_CHARACTER_ENTITY */
extern T0* GE_new278(T1 initialize);
/* New instance of type YY_BUFFER */
extern T0* GE_new279(T1 initialize);
/* New instance of type YY_FILE_BUFFER */
extern T0* GE_new280(T1 initialize);
/* New instance of type detachable DS_BILINKABLE [XM_POSITION] */
extern T0* GE_new284(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [XM_POSITION] */
extern T0* GE_new285(T1 initialize);
/* New instance of type detachable DS_LINKABLE [XM_EIFFEL_SCANNER] */
extern T0* GE_new286(T1 initialize);
/* New instance of type SPECIAL [XM_EIFFEL_ENTITY_DEF] */
extern T0* GE_new287(T6 a1, T1 initialize);
/* New instance of type detachable DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
extern T0* GE_new290(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
extern T0* GE_new291(T1 initialize);
/* New instance of type detachable KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new293(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new294(T1 initialize);
/* New instance of type DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new295(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new296(T1 initialize);
/* New instance of type detachable DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new297(T1 initialize);
/* New instance of type DS_LINKED_LIST [STRING_8] */
extern T0* GE_new298(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [STRING_8] */
extern T0* GE_new299(T1 initialize);
/* New instance of type detachable DS_BILINKABLE [STRING_8] */
extern T0* GE_new300(T1 initialize);
/* New instance of type XM_NAMESPACE_RESOLVER_CONTEXT */
extern T0* GE_new301(T1 initialize);
/* New instance of type DS_LINKED_QUEUE [STRING_8] */
extern T0* GE_new303(T1 initialize);
/* New instance of type detachable KL_EQUALITY_TESTER [XM_NAMESPACE] */
extern T0* GE_new304(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [XM_NAMESPACE] */
extern T0* GE_new305(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
extern T0* GE_new306(T1 initialize);
/* New instance of type SPECIAL [XM_NAMESPACE] */
extern T0* GE_new307(T6 a1, T1 initialize);
/* New instance of type detachable DS_LINKABLE [XM_DOCUMENT_NODE] */
extern T0* GE_new308(T1 initialize);
/* New instance of type GEANT_STRING_INTERPRETER */
extern T0* GE_new312(T1 initialize);
/* New instance of type GEANT_NAME_VALUE_ELEMENT */
extern T0* GE_new314(T1 initialize);
/* New instance of type KL_ARRAY_ROUTINES [detachable STRING_8] */
extern T0* GE_new318(T1 initialize);
/* New instance of type AP_OPTION_COMPARATOR */
extern T0* GE_new319(T1 initialize);
/* New instance of type DS_QUICK_SORTER [AP_OPTION] */
extern T0* GE_new320(T1 initialize);
/* New instance of type ST_WORD_WRAPPER */
extern T0* GE_new322(T1 initialize);
/* New instance of type XM_COMMENT */
extern T0* GE_new324(T1 initialize);
/* New instance of type XM_PROCESSING_INSTRUCTION */
extern T0* GE_new325(T1 initialize);
/* New instance of type XM_CHARACTER_DATA */
extern T0* GE_new326(T1 initialize);
/* New instance of type CONSOLE */
extern T0* GE_new327(T1 initialize);
/* New instance of type KL_ARRAY_ROUTINES [INTEGER_32] */
extern T0* GE_new328(T1 initialize);
/* New instance of type detachable DS_LINKABLE [XM_ELEMENT_NODE] */
extern T0* GE_new330(T1 initialize);
/* New instance of type detachable DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
extern T0* GE_new331(T1 initialize);
/* New instance of type DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
extern T0* GE_new332(T1 initialize);
/* New instance of type GEANT_GEC_TASK */
extern T0* GE_new333(T1 initialize);
/* New instance of type [attached] TUPLE [XM_ELEMENT] */
extern T0* GE_new334(T1 initialize);
/* New instance of type detachable TUPLE */
extern T0* GE_new335(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEC_TASK] */
extern T0* GE_new336(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_TASK_FACTORY] */
extern T0* GE_new337(T1 initialize);
/* New instance of type GEANT_ISE_TASK */
extern T0* GE_new339(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_ISE_TASK] */
extern T0* GE_new340(T1 initialize);
/* New instance of type GEANT_EXEC_TASK */
extern T0* GE_new341(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_EXEC_TASK] */
extern T0* GE_new342(T1 initialize);
/* New instance of type GEANT_LCC_TASK */
extern T0* GE_new343(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_LCC_TASK] */
extern T0* GE_new344(T1 initialize);
/* New instance of type GEANT_SET_TASK */
extern T0* GE_new345(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_SET_TASK] */
extern T0* GE_new346(T1 initialize);
/* New instance of type GEANT_UNSET_TASK */
extern T0* GE_new347(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_UNSET_TASK] */
extern T0* GE_new348(T1 initialize);
/* New instance of type GEANT_GEXACE_TASK */
extern T0* GE_new349(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEXACE_TASK] */
extern T0* GE_new350(T1 initialize);
/* New instance of type GEANT_GELEX_TASK */
extern T0* GE_new351(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GELEX_TASK] */
extern T0* GE_new352(T1 initialize);
/* New instance of type GEANT_GEYACC_TASK */
extern T0* GE_new353(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEYACC_TASK] */
extern T0* GE_new354(T1 initialize);
/* New instance of type GEANT_GEPP_TASK */
extern T0* GE_new355(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEPP_TASK] */
extern T0* GE_new356(T1 initialize);
/* New instance of type GEANT_GETEST_TASK */
extern T0* GE_new357(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GETEST_TASK] */
extern T0* GE_new358(T1 initialize);
/* New instance of type GEANT_GEANT_TASK */
extern T0* GE_new359(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEANT_TASK] */
extern T0* GE_new360(T1 initialize);
/* New instance of type GEANT_ECHO_TASK */
extern T0* GE_new361(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_ECHO_TASK] */
extern T0* GE_new362(T1 initialize);
/* New instance of type GEANT_MKDIR_TASK */
extern T0* GE_new363(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_MKDIR_TASK] */
extern T0* GE_new364(T1 initialize);
/* New instance of type GEANT_DELETE_TASK */
extern T0* GE_new365(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_DELETE_TASK] */
extern T0* GE_new366(T1 initialize);
/* New instance of type GEANT_COPY_TASK */
extern T0* GE_new367(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_COPY_TASK] */
extern T0* GE_new368(T1 initialize);
/* New instance of type GEANT_MOVE_TASK */
extern T0* GE_new369(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_MOVE_TASK] */
extern T0* GE_new370(T1 initialize);
/* New instance of type GEANT_SETENV_TASK */
extern T0* GE_new371(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_SETENV_TASK] */
extern T0* GE_new372(T1 initialize);
/* New instance of type GEANT_XSLT_TASK */
extern T0* GE_new373(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_XSLT_TASK] */
extern T0* GE_new374(T1 initialize);
/* New instance of type GEANT_OUTOFDATE_TASK */
extern T0* GE_new375(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_OUTOFDATE_TASK] */
extern T0* GE_new376(T1 initialize);
/* New instance of type GEANT_EXIT_TASK */
extern T0* GE_new377(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_EXIT_TASK] */
extern T0* GE_new378(T1 initialize);
/* New instance of type GEANT_PRECURSOR_TASK */
extern T0* GE_new379(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_PRECURSOR_TASK] */
extern T0* GE_new380(T1 initialize);
/* New instance of type GEANT_AVAILABLE_TASK */
extern T0* GE_new381(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_AVAILABLE_TASK] */
extern T0* GE_new382(T1 initialize);
/* New instance of type GEANT_INPUT_TASK */
extern T0* GE_new383(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_INPUT_TASK] */
extern T0* GE_new384(T1 initialize);
/* New instance of type GEANT_REPLACE_TASK */
extern T0* GE_new385(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_REPLACE_TASK] */
extern T0* GE_new386(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_PARENT] */
extern T0* GE_new387(T1 initialize);
/* New instance of type SPECIAL [GEANT_PARENT] */
extern T0* GE_new388(T6 a1, T1 initialize);
/* New instance of type UC_UNICODE_ROUTINES */
extern T0* GE_new390(T1 initialize);
/* New instance of type DS_LINKED_QUEUE [CHARACTER_8] */
extern T0* GE_new392(T1 initialize);
/* New instance of type UC_UTF16_ROUTINES */
extern T0* GE_new393(T1 initialize);
/* New instance of type SPECIAL [NATURAL_64] */
extern T0* GE_new394(T6 a1, T1 initialize);
/* New instance of type GEANT_RENAME_ELEMENT */
extern T0* GE_new395(T1 initialize);
/* New instance of type GEANT_REDEFINE_ELEMENT */
extern T0* GE_new396(T1 initialize);
/* New instance of type GEANT_SELECT_ELEMENT */
extern T0* GE_new397(T1 initialize);
/* New instance of type GEANT_RENAME */
extern T0* GE_new398(T1 initialize);
/* New instance of type DS_HASH_TABLE [GEANT_RENAME, STRING_8] */
extern T0* GE_new399(T1 initialize);
/* New instance of type GEANT_REDEFINE */
extern T0* GE_new400(T1 initialize);
/* New instance of type DS_HASH_TABLE [GEANT_REDEFINE, STRING_8] */
extern T0* GE_new401(T1 initialize);
/* New instance of type GEANT_SELECT */
extern T0* GE_new402(T1 initialize);
/* New instance of type DS_HASH_TABLE [GEANT_SELECT, STRING_8] */
extern T0* GE_new403(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new404(T1 initialize);
/* New instance of type attached DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new405(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [STRING_8] */
extern T0* GE_new406(T1 initialize);
/* New instance of type DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
extern T0* GE_new408(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
extern T0* GE_new409(T1 initialize);
/* New instance of type detachable DS_LINKABLE [STRING_8] */
extern T0* GE_new410(T1 initialize);
/* New instance of type KL_DIRECTORY */
extern T0* GE_new411(T1 initialize);
/* New instance of type ST_SPLITTER */
extern T0* GE_new412(T1 initialize);
/* New instance of type KL_STRING_INPUT_STREAM */
extern T0* GE_new413(T1 initialize);
/* New instance of type KL_CHARACTER_BUFFER */
extern T0* GE_new414(T1 initialize);
/* New instance of type KL_ARRAY [detachable STRING_8] */
extern T0* GE_new415(T1 initialize);
/* New instance of type SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
extern T0* GE_new416(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
extern T0* GE_new419(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
extern T0* GE_new420(T1 initialize);
/* New instance of type GEANT_GEC_COMMAND */
extern T0* GE_new421(T1 initialize);
/* New instance of type DS_CELL [PROCEDURE [ANY, TUPLE]] */
extern T0* GE_new422(T1 initialize);
/* New instance of type [attached] PROCEDURE [[attached] NONE, [attached] TUPLE] */
extern T0* GE_new423(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GEC_TASK] */
extern T0* GE_new424(T1 initialize);
/* New instance of type GEANT_ISE_COMMAND */
extern T0* GE_new425(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_ISE_TASK] */
extern T0* GE_new426(T1 initialize);
/* New instance of type GEANT_FILESET_ELEMENT */
extern T0* GE_new427(T1 initialize);
/* New instance of type GEANT_EXEC_COMMAND */
extern T0* GE_new428(T1 initialize);
/* New instance of type GEANT_STRING_PROPERTY */
extern T0* GE_new429(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_INTERPRETING_ELEMENT, [attached] TUPLE, STRING_8] */
extern T0* GE_new430(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_INTERPRETING_ELEMENT, STRING_8] */
extern T0* GE_new431(T1 initialize);
/* New instance of type GEANT_BOOLEAN_PROPERTY */
extern T0* GE_new432(T1 initialize);
/* New instance of type GEANT_FILESET */
extern T0* GE_new433(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_EXEC_TASK] */
extern T0* GE_new434(T1 initialize);
/* New instance of type GEANT_LCC_COMMAND */
extern T0* GE_new435(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_LCC_TASK] */
extern T0* GE_new436(T1 initialize);
/* New instance of type GEANT_SET_COMMAND */
extern T0* GE_new437(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_SET_TASK] */
extern T0* GE_new438(T1 initialize);
/* New instance of type GEANT_UNSET_COMMAND */
extern T0* GE_new439(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_UNSET_TASK] */
extern T0* GE_new440(T1 initialize);
/* New instance of type GEANT_DEFINE_ELEMENT */
extern T0* GE_new441(T1 initialize);
/* New instance of type GEANT_GEXACE_COMMAND */
extern T0* GE_new442(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GEXACE_TASK] */
extern T0* GE_new443(T1 initialize);
/* New instance of type GEANT_GELEX_COMMAND */
extern T0* GE_new444(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GELEX_TASK] */
extern T0* GE_new445(T1 initialize);
/* New instance of type GEANT_GEYACC_COMMAND */
extern T0* GE_new446(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GEYACC_TASK] */
extern T0* GE_new447(T1 initialize);
/* New instance of type GEANT_GEPP_COMMAND */
extern T0* GE_new448(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GEPP_TASK] */
extern T0* GE_new449(T1 initialize);
/* New instance of type GEANT_GETEST_COMMAND */
extern T0* GE_new450(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GETEST_TASK] */
extern T0* GE_new451(T1 initialize);
/* New instance of type GEANT_GEANT_COMMAND */
extern T0* GE_new452(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GEANT_TASK] */
extern T0* GE_new453(T1 initialize);
/* New instance of type GEANT_ECHO_COMMAND */
extern T0* GE_new454(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_ECHO_TASK] */
extern T0* GE_new455(T1 initialize);
/* New instance of type GEANT_MKDIR_COMMAND */
extern T0* GE_new456(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_MKDIR_TASK] */
extern T0* GE_new457(T1 initialize);
/* New instance of type GEANT_DIRECTORYSET_ELEMENT */
extern T0* GE_new458(T1 initialize);
/* New instance of type GEANT_DELETE_COMMAND */
extern T0* GE_new459(T1 initialize);
/* New instance of type GEANT_DIRECTORYSET */
extern T0* GE_new460(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_DELETE_TASK] */
extern T0* GE_new461(T1 initialize);
/* New instance of type GEANT_COPY_COMMAND */
extern T0* GE_new462(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_COPY_TASK] */
extern T0* GE_new463(T1 initialize);
/* New instance of type GEANT_MOVE_COMMAND */
extern T0* GE_new464(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_MOVE_TASK] */
extern T0* GE_new465(T1 initialize);
/* New instance of type GEANT_SETENV_COMMAND */
extern T0* GE_new466(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_SETENV_TASK] */
extern T0* GE_new467(T1 initialize);
/* New instance of type DS_PAIR [STRING_8, STRING_8] */
extern T0* GE_new468(T1 initialize);
/* New instance of type GEANT_XSLT_COMMAND */
extern T0* GE_new469(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]] */
extern T0* GE_new470(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_XSLT_TASK] */
extern T0* GE_new471(T1 initialize);
/* New instance of type GEANT_OUTOFDATE_COMMAND */
extern T0* GE_new472(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_OUTOFDATE_TASK] */
extern T0* GE_new473(T1 initialize);
/* New instance of type GEANT_EXIT_COMMAND */
extern T0* GE_new474(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_EXIT_TASK] */
extern T0* GE_new475(T1 initialize);
/* New instance of type GEANT_PRECURSOR_COMMAND */
extern T0* GE_new476(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_PRECURSOR_TASK] */
extern T0* GE_new477(T1 initialize);
/* New instance of type GEANT_AVAILABLE_COMMAND */
extern T0* GE_new478(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_AVAILABLE_TASK] */
extern T0* GE_new479(T1 initialize);
/* New instance of type GEANT_INPUT_COMMAND */
extern T0* GE_new480(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_INPUT_TASK] */
extern T0* GE_new481(T1 initialize);
/* New instance of type GEANT_REPLACE_COMMAND */
extern T0* GE_new482(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_REPLACE_TASK] */
extern T0* GE_new483(T1 initialize);
/* New instance of type SPECIAL [ARRAY [INTEGER_32]] */
extern T0* GE_new484(T6 a1, T1 initialize);
/* New instance of type SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
extern T0* GE_new485(T6 a1, T1 initialize);
/* New instance of type detachable DS_LINKABLE [CHARACTER_8] */
extern T0* GE_new486(T1 initialize);
/* New instance of type detachable KL_EQUALITY_TESTER [GEANT_RENAME] */
extern T0* GE_new487(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_RENAME] */
extern T0* GE_new489(T1 initialize);
/* New instance of type SPECIAL [GEANT_RENAME] */
extern T0* GE_new490(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8] */
extern T0* GE_new491(T1 initialize);
/* New instance of type detachable KL_EQUALITY_TESTER [GEANT_REDEFINE] */
extern T0* GE_new492(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_REDEFINE] */
extern T0* GE_new494(T1 initialize);
/* New instance of type SPECIAL [GEANT_REDEFINE] */
extern T0* GE_new495(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8] */
extern T0* GE_new496(T1 initialize);
/* New instance of type detachable KL_EQUALITY_TESTER [GEANT_SELECT] */
extern T0* GE_new497(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_SELECT] */
extern T0* GE_new499(T1 initialize);
/* New instance of type SPECIAL [GEANT_SELECT] */
extern T0* GE_new500(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8] */
extern T0* GE_new501(T1 initialize);
/* New instance of type detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
extern T0* GE_new502(T1 initialize);
/* New instance of type DS_HASH_SET [INTEGER_32] */
extern T0* GE_new509(T1 initialize);
/* New instance of type GEANT_MAP_ELEMENT */
extern T0* GE_new512(T1 initialize);
/* New instance of type GEANT_MAP */
extern T0* GE_new513(T1 initialize);
/* New instance of type DS_HASH_SET [GEANT_FILESET_ENTRY] */
extern T0* GE_new516(T1 initialize);
/* New instance of type DS_HASH_SET [STRING_8] */
extern T0* GE_new518(T1 initialize);
/* New instance of type LX_DFA_WILDCARD */
extern T0* GE_new520(T1 initialize);
/* New instance of type DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8]]] */
extern T0* GE_new522(T1 initialize);
/* New instance of type [attached] TUPLE [STRING_8] */
extern T0* GE_new523(T1 initialize);
/* New instance of type [attached] PROCEDURE [[attached] NONE, [attached] TUPLE [STRING_8]] */
extern T0* GE_new524(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_ECHO_COMMAND] */
extern T0* GE_new525(T1 initialize);
/* New instance of type DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]]] */
extern T0* GE_new527(T1 initialize);
/* New instance of type KL_TEXT_OUTPUT_FILE */
extern T0* GE_new528(T1 initialize);
/* New instance of type [attached] TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN] */
extern T0* GE_new529(T1 initialize);
/* New instance of type [attached] PROCEDURE [[attached] NONE, [attached] TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]] */
extern T0* GE_new530(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_MKDIR_COMMAND] */
extern T0* GE_new532(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]] */
extern T0* GE_new533(T1 initialize);
/* New instance of type SPECIAL [DS_PAIR [STRING_8, STRING_8]] */
extern T0* GE_new534(T6 a1, T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING_8, STRING_8]] */
extern T0* GE_new535(T1 initialize);
/* New instance of type DS_CELL [FUNCTION [ANY, TUPLE [STRING_8], BOOLEAN]] */
extern T0* GE_new536(T1 initialize);
/* New instance of type [attached] PREDICATE [[attached] NONE, [attached] TUPLE [STRING_8]] */
extern T0* GE_new537(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_AVAILABLE_COMMAND] */
extern T0* GE_new538(T1 initialize);
/* New instance of type DP_SHELL_COMMAND */
extern T0* GE_new540(T1 initialize);
/* New instance of type DS_CELL [BOOLEAN] */
extern T0* GE_new541(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [STRING_8] */
extern T0* GE_new543(T1 initialize);
/* New instance of type GEANT_FILESET_ENTRY */
extern T0* GE_new544(T1 initialize);
/* New instance of type KL_BOOLEAN_ROUTINES */
extern T0* GE_new545(T1 initialize);
/* New instance of type ARRAY [BOOLEAN] */
extern T0* GE_new546(T1 initialize);
/* New instance of type GEANT_VARIABLES_VARIABLE_RESOLVER */
extern T0* GE_new547(T1 initialize);
/* New instance of type RX_PCRE_REGULAR_EXPRESSION */
extern T0* GE_new548(T1 initialize);
/* New instance of type KL_STRING_EQUALITY_TESTER */
extern T0* GE_new549(T1 initialize);
/* New instance of type KL_STDIN_FILE */
extern T0* GE_new550(T1 initialize);
/* New instance of type ARRAY [GEANT_VARIABLES] */
extern T0* GE_new551(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [INTEGER_32] */
extern T0* GE_new552(T1 initialize);
/* New instance of type detachable KL_EQUALITY_TESTER [INTEGER_32] */
extern T0* GE_new553(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY] */
extern T0* GE_new554(T1 initialize);
/* New instance of type SPECIAL [GEANT_FILESET_ENTRY] */
extern T0* GE_new555(T6 a1, T1 initialize);
/* New instance of type detachable KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY] */
extern T0* GE_new556(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY] */
extern T0* GE_new557(T1 initialize);
/* New instance of type LX_WILDCARD_PARSER */
extern T0* GE_new559(T1 initialize);
/* New instance of type LX_DESCRIPTION */
extern T0* GE_new560(T1 initialize);
/* New instance of type LX_FULL_DFA */
extern T0* GE_new561(T1 initialize);
/* New instance of type KL_NULL_TEXT_OUTPUT_STREAM */
extern T0* GE_new563(T1 initialize);
/* New instance of type RX_BYTE_CODE */
extern T0* GE_new568(T1 initialize);
/* New instance of type RX_CHARACTER_SET */
extern T0* GE_new569(T1 initialize);
/* New instance of type RX_CASE_MAPPING */
extern T0* GE_new570(T1 initialize);
/* New instance of type SPECIAL [RX_CHARACTER_SET] */
extern T0* GE_new572(T6 a1, T1 initialize);
/* New instance of type ARRAY [RX_CHARACTER_SET] */
extern T0* GE_new573(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [LX_RULE] */
extern T0* GE_new574(T1 initialize);
/* New instance of type LX_START_CONDITIONS */
extern T0* GE_new575(T1 initialize);
/* New instance of type LX_ACTION_FACTORY */
extern T0* GE_new576(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [INTEGER_32] */
extern T0* GE_new577(T1 initialize);
/* New instance of type LX_SYMBOL_CLASS */
extern T0* GE_new578(T1 initialize);
/* New instance of type DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8] */
extern T0* GE_new579(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS] */
extern T0* GE_new580(T1 initialize);
/* New instance of type SPECIAL [LX_SYMBOL_CLASS] */
extern T0* GE_new581(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_NFA] */
extern T0* GE_new582(T1 initialize);
/* New instance of type LX_NFA */
extern T0* GE_new583(T1 initialize);
/* New instance of type SPECIAL [LX_NFA] */
extern T0* GE_new584(T6 a1, T1 initialize);
/* New instance of type LX_EQUIVALENCE_CLASSES */
extern T0* GE_new585(T1 initialize);
/* New instance of type LX_RULE */
extern T0* GE_new586(T1 initialize);
/* New instance of type UT_SYNTAX_ERROR */
extern T0* GE_new587(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
extern T0* GE_new588(T1 initialize);
/* New instance of type LX_UNRECOGNIZED_RULE_ERROR */
extern T0* GE_new589(T1 initialize);
/* New instance of type LX_MISSING_QUOTE_ERROR */
extern T0* GE_new590(T1 initialize);
/* New instance of type LX_BAD_CHARACTER_CLASS_ERROR */
extern T0* GE_new591(T1 initialize);
/* New instance of type LX_BAD_CHARACTER_ERROR */
extern T0* GE_new592(T1 initialize);
/* New instance of type LX_FULL_AND_META_ERROR */
extern T0* GE_new593(T1 initialize);
/* New instance of type LX_FULL_AND_REJECT_ERROR */
extern T0* GE_new594(T1 initialize);
/* New instance of type LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR */
extern T0* GE_new595(T1 initialize);
/* New instance of type LX_CHARACTER_OUT_OF_RANGE_ERROR */
extern T0* GE_new596(T1 initialize);
/* New instance of type SPECIAL [LX_RULE] */
extern T0* GE_new597(T6 a1, T1 initialize);
/* New instance of type ARRAY [LX_RULE] */
extern T0* GE_new598(T1 initialize);
/* New instance of type LX_DFA_STATE */
extern T0* GE_new599(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [LX_NFA_STATE] */
extern T0* GE_new600(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [LX_DFA_STATE] */
extern T0* GE_new601(T1 initialize);
/* New instance of type LX_SYMBOL_PARTITIONS */
extern T0* GE_new602(T1 initialize);
/* New instance of type KL_ARRAY_ROUTINES [LX_RULE] */
extern T0* GE_new603(T1 initialize);
/* New instance of type LX_START_CONDITION */
extern T0* GE_new604(T1 initialize);
/* New instance of type LX_TRANSITION_TABLE [LX_DFA_STATE] */
extern T0* GE_new605(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [LX_NFA] */
extern T0* GE_new606(T1 initialize);
/* New instance of type DS_HASH_TABLE [LX_NFA, INTEGER_32] */
extern T0* GE_new607(T1 initialize);
/* New instance of type LX_NFA_STATE */
extern T0* GE_new608(T1 initialize);
/* New instance of type KL_BINARY_INPUT_FILE */
extern T0* GE_new609(T1 initialize);
/* New instance of type KL_BINARY_OUTPUT_FILE */
extern T0* GE_new610(T1 initialize);
/* New instance of type PATH */
extern T0* GE_new615(T1 initialize);
/* New instance of type RAW_FILE */
extern T0* GE_new616(T1 initialize);
/* New instance of type DIRECTORY */
extern T0* GE_new617(T1 initialize);
/* New instance of type ARRAYED_LIST [READABLE_STRING_32] */
extern T0* GE_new618(T1 initialize);
/* New instance of type [attached] TUPLE [ARRAYED_LIST [READABLE_STRING_32]] */
extern T0* GE_new619(T1 initialize);
/* New instance of type LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR */
extern T0* GE_new620(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_RULE] */
extern T0* GE_new621(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_RULE] */
extern T0* GE_new622(T1 initialize);
/* New instance of type SPECIAL [LX_START_CONDITION] */
extern T0* GE_new623(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_START_CONDITION] */
extern T0* GE_new624(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION] */
extern T0* GE_new625(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
extern T0* GE_new626(T1 initialize);
/* New instance of type LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE] */
extern T0* GE_new629(T1 initialize);
/* New instance of type LX_EPSILON_TRANSITION [LX_NFA_STATE] */
extern T0* GE_new631(T1 initialize);
/* New instance of type LX_SYMBOL_TRANSITION [LX_NFA_STATE] */
extern T0* GE_new633(T1 initialize);
/* New instance of type DS_BILINKABLE [INTEGER_32] */
extern T0* GE_new634(T1 initialize);
/* New instance of type SPECIAL [DS_BILINKABLE [INTEGER_32]] */
extern T0* GE_new635(T6 a1, T1 initialize);
/* New instance of type ARRAY [DS_BILINKABLE [INTEGER_32]] */
extern T0* GE_new636(T1 initialize);
/* New instance of type LX_ACTION */
extern T0* GE_new638(T1 initialize);
/* New instance of type DS_BUBBLE_SORTER [LX_NFA_STATE] */
extern T0* GE_new639(T1 initialize);
/* New instance of type DS_BUBBLE_SORTER [LX_RULE] */
extern T0* GE_new641(T1 initialize);
/* New instance of type SPECIAL [LX_NFA_STATE] */
extern T0* GE_new643(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_NFA_STATE] */
extern T0* GE_new645(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE] */
extern T0* GE_new646(T1 initialize);
/* New instance of type SPECIAL [LX_DFA_STATE] */
extern T0* GE_new648(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_DFA_STATE] */
extern T0* GE_new649(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE] */
extern T0* GE_new650(T1 initialize);
/* New instance of type KL_ARRAY [LX_RULE] */
extern T0* GE_new651(T1 initialize);
/* New instance of type ARRAY [detachable LX_DFA_STATE] */
extern T0* GE_new652(T1 initialize);
/* New instance of type KL_ARRAY_ROUTINES [detachable LX_DFA_STATE] */
extern T0* GE_new653(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_NFA] */
extern T0* GE_new654(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32] */
extern T0* GE_new656(T1 initialize);
/* New instance of type STRING_8_SEARCHER */
extern T0* GE_new657(T1 initialize);
/* New instance of type HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32] */
extern T0* GE_new658(T1 initialize);
/* New instance of type DS_SHELL_SORTER [INTEGER_32] */
extern T0* GE_new662(T1 initialize);
/* New instance of type KL_COMPARABLE_COMPARATOR [LX_RULE] */
extern T0* GE_new664(T1 initialize);
/* New instance of type KL_COMPARABLE_COMPARATOR [LX_NFA_STATE] */
extern T0* GE_new667(T1 initialize);
/* New instance of type ARRAYED_LIST [READABLE_STRING_GENERAL] */
extern T0* GE_new670(T1 initialize);
/* New instance of type [attached] TUPLE [ARRAYED_LIST [READABLE_STRING_GENERAL]] */
extern T0* GE_new671(T1 initialize);
/* New instance of type SPECIAL [READABLE_STRING_32] */
extern T0* GE_new672(T6 a1, T1 initialize);
/* New instance of type KL_COMPARABLE_COMPARATOR [INTEGER_32] */
extern T0* GE_new673(T1 initialize);
/* New instance of type SPECIAL [NATIVE_STRING] */
extern T0* GE_new676(T6 a1, T1 initialize);
/* New instance of type SPECIAL [READABLE_STRING_GENERAL] */
extern T0* GE_new677(T6 a1, T1 initialize);
/* GEANT.make */
extern T0* T22c20(GE_context* ac);
/* GEANT_PROJECT.build */
extern void T29f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT.build_target */
extern void T29f46(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].remove */
extern void T151f10(GE_context* ac, T0* C);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].keep_head */
extern void T242f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].set_count */
extern void T242f7(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].remove */
extern void T247f11(GE_context* ac, T0* C);
/* SPECIAL [GEANT_TARGET].keep_head */
extern void T172f8(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_TARGET].set_count */
extern void T172f10(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT.execute_target */
extern void T29f49(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3, T1 a4);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].remove */
extern void T152f10(GE_context* ac, T0* C);
/* SPECIAL [GEANT_VARIABLES].keep_head */
extern void T244f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_VARIABLES].set_count */
extern void T244f7(GE_context* ac, T0* C, T6 a1);
/* GEANT_TARGET.execute */
extern void T33f75(GE_context* ac, T0* C);
/* GEANT_TARGET.set_executed */
extern void T33f78(GE_context* ac, T0* C, T1 a1);
/* GEANT_TARGET.execute */
extern void T33f75p1(GE_context* ac, T0* C);
/* GEANT_TARGET.has_attribute */
extern T1 T33f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.execute_nested_tasks */
extern void T33f80(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].forth */
extern void T236f13(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].cursor_forth */
extern void T239f16(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].add_traversing_cursor */
extern void T239f19(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].set_next_cursor */
extern void T236f17(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].remove_traversing_cursor */
extern void T239f20(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].set */
extern void T236f15(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* GEANT_TARGET.execute_element */
extern void T33f82(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.obsolete_element_name */
extern unsigned char ge12os2873;
extern T0* ge12ov2873;
extern T0* T33f17(GE_context* ac, T0* C);
/* GEANT_TARGET.argument_element_name */
extern unsigned char ge12os2874;
extern T0* ge12ov2874;
extern T0* T33f15(GE_context* ac, T0* C);
/* GEANT_TARGET.description_element_name */
extern unsigned char ge78os2923;
extern T0* ge78ov2923;
extern T0* T33f22(GE_context* ac, T0* C);
/* GEANT_TARGET.execute_task */
extern void T33f83(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT.new_task */
extern T0* T29f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_task */
extern T0* T248f54(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].item */
extern T0* T332f33(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].item_storage_item */
extern T0* T332f30(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].search_position */
extern void T332f38(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].hash_position */
extern T6 T332f28(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.hash_code */
extern T6 T267f18(GE_context* ac, T0* C);
/* UC_UTF8_STRING.string */
extern T0* T267f8(GE_context* ac, T0* C);
/* KL_INTEGER_ROUTINES.to_character */
extern T2 T269f2(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.integer_ */
extern unsigned char ge126os6072;
extern T0* ge126ov6072;
extern T0* T267f28(GE_context* ac, T0* C);
/* KL_INTEGER_ROUTINES.default_create */
extern T0* T269c4(GE_context* ac);
/* STRING_8.append_character */
extern void T17f38(GE_context* ac, T0* C, T2 a1);
/* STRING_8.resize */
extern void T17f40(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].aliased_resized_area_with_default */
extern T0* T15f3(GE_context* ac, T0* C, T2 a1, T6 a2);
/* SPECIAL [CHARACTER_8].fill_with */
extern void T15f14(GE_context* ac, T0* C, T2 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].extend */
extern void T15f18(GE_context* ac, T0* C, T2 a1);
/* INTEGER_32.min */
extern T6 T6f11(GE_context* ac, T6* C, T6 a1);
/* SPECIAL [CHARACTER_8].aliased_resized_area */
extern T0* T15f4(GE_context* ac, T0* C, T6 a1);
/* STRING_8.additional_space */
extern T6 T17f6(GE_context* ac, T0* C);
/* INTEGER_32.max */
extern T6 T6f5(GE_context* ac, T6* C, T6 a1);
/* INTEGER_32.is_greater_equal */
extern T1 T6f8(GE_context* ac, T6* C, T6 a1);
/* STRING_8.capacity */
extern T6 T17f5(GE_context* ac, T0* C);
/* UC_UTF8_STRING.byte_item */
extern T2 T267f25(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.old_item */
extern T2 T267f40(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.set_count */
extern void T267f71(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.reset_byte_index_cache */
extern void T267f79(GE_context* ac, T0* C);
/* STRING_8.make */
extern void T17f36(GE_context* ac, T0* C, T6 a1);
/* STRING_8.make */
extern T0* T17c36(GE_context* ac, T6 a1);
/* SPECIAL [CHARACTER_8].make_filled */
extern T0* T15c11(GE_context* ac, T2 a1, T6 a2);
/* SPECIAL [CHARACTER_8].make_empty */
extern void T15f15(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].make_empty */
extern T0* T15c15(GE_context* ac, T6 a1);
/* UC_UTF8_STRING.next_byte_index */
extern T6 T267f29(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_ROUTINES.encoded_byte_count */
extern T6 T266f3(GE_context* ac, T0* C, T2 a1);
/* CHARACTER_8.is_less_equal */
extern T1 T2f21(GE_context* ac, T2* C, T2 a1);
/* CHARACTER_8.is_less */
extern T1 T2f7(GE_context* ac, T2* C, T2 a1);
/* CHARACTER_8.natural_32_code */
extern T10 T2f8(GE_context* ac, T2* C);
/* INTEGER_32.to_natural_32 */
extern T10 T6f17(GE_context* ac, T6* C);
/* UC_UTF8_STRING.utf8 */
extern unsigned char ge220os6998;
extern T0* ge220ov6998;
extern T0* T267f30(GE_context* ac, T0* C);
/* UC_UTF8_ROUTINES.default_create */
extern T0* T266c36(GE_context* ac);
/* KL_PLATFORM.maximum_character_code */
extern unsigned char ge201os9130;
extern T6 ge201ov9130;
extern T6 T270f1(GE_context* ac, T0* C);
/* UC_UTF8_STRING.platform */
extern unsigned char ge208os4856;
extern T0* ge208ov4856;
extern T0* T267f27(GE_context* ac, T0* C);
/* KL_PLATFORM.default_create */
extern T0* T270c3(GE_context* ac);
/* UC_UTF8_STRING.item_code_at_byte_index */
extern T6 T267f26(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_ROUTINES.encoded_next_value */
extern T6 T266f6(GE_context* ac, T0* C, T2 a1);
/* UC_UTF8_ROUTINES.encoded_first_value */
extern T6 T266f4(GE_context* ac, T0* C, T2 a1);
/* UC_UTF8_STRING.hash_code */
extern T6 T267f18p1(GE_context* ac, T0* C);
/* STRING_8.hash_code */
extern T6 T17f8(GE_context* ac, T0* C);
/* UC_STRING_EQUALITY_TESTER.test */
extern T1 T101f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* UC_STRING_EQUALITY_TESTER.string_ */
extern unsigned char ge128os1973;
extern T0* ge128ov1973;
extern T0* T101f2(GE_context* ac, T0* C);
/* KL_STRING_ROUTINES.default_create */
extern T0* T116c19(GE_context* ac);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].key_storage_item */
extern T0* T332f22(GE_context* ac, T0* C, T6 a1);
/* INTEGER_32.is_less_equal */
extern T1 T6f10(GE_context* ac, T6* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].clashes_item */
extern T6 T332f27(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].slots_item */
extern T6 T332f29(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].has */
extern T1 T332f23(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.set_name */
extern void T145f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.set_attribute_name */
extern unsigned char ge12os2876;
extern T0* ge12ov2876;
extern T0* T33f51(GE_context* ac, T0* C);
/* XM_ELEMENT.cloned_object */
extern T0* T145f20(GE_context* ac, T0* C);
/* XM_ELEMENT.twin */
extern T0* T145f22(GE_context* ac, T0* C);
/* XM_ELEMENT.copy */
extern void T145f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_NAME_VALUE_ELEMENT.has_value */
extern T1 T314f4(GE_context* ac, T0* C);
/* GEANT_NAME_VALUE_ELEMENT.has_attribute */
extern T1 T314f3(GE_context* ac, T0* C, T0* a1);
/* GEANT_NAME_VALUE_ELEMENT.value_attribute_name */
extern unsigned char ge90os8913;
extern T0* ge90ov8913;
extern T0* T314f2(GE_context* ac, T0* C);
/* GEANT_NAME_VALUE_ELEMENT.make */
extern T0* T314c5(GE_context* ac, T0* a1);
/* GEANT_NAME_VALUE_ELEMENT.set_xml_element */
extern void T314f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.global_element_name */
extern unsigned char ge4os2896;
extern T0* ge4ov2896;
extern T0* T33f21(GE_context* ac, T0* C);
/* GEANT_TARGET.local_element_name */
extern unsigned char ge4os2897;
extern T0* ge4ov2897;
extern T0* T33f19(GE_context* ac, T0* C);
/* GEANT_TARGET.execute_group_element */
extern void T33f81(GE_context* ac, T0* C, T0* a1);
/* GEANT_GROUP.execute */
extern void T258f26(GE_context* ac, T0* C);
/* GEANT_GROUP.has_attribute */
extern T1 T258f18(GE_context* ac, T0* C, T0* a1);
/* GEANT_GROUP.execute_nested_tasks */
extern void T258f32(GE_context* ac, T0* C);
/* GEANT_GROUP.execute_element */
extern void T258f37(GE_context* ac, T0* C, T0* a1);
/* GEANT_GROUP.execute_task */
extern void T258f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_GROUP.description_element_name */
extern T0* T258f13(GE_context* ac, T0* C);
/* GEANT_GROUP.global_element_name */
extern T0* T258f20(GE_context* ac, T0* C);
/* GEANT_GROUP.local_element_name */
extern T0* T258f19(GE_context* ac, T0* C);
/* GEANT_GROUP.execute_group_element */
extern void T258f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_GROUP.group_element_name */
extern unsigned char ge4os2895;
extern T0* ge4ov2895;
extern T0* T258f17(GE_context* ac, T0* C);
/* GEANT_GROUP.string_ */
extern T0* T258f16(GE_context* ac, T0* C);
/* GEANT_GROUP.prepare_variables_before_execution */
extern void T258f31(GE_context* ac, T0* C);
/* GEANT_GROUP.exit_application */
extern void T258f30(GE_context* ac, T0* C, T6 a1, T0* a2);
/* KL_EXCEPTIONS.die */
extern void T55f2(GE_context* ac, T0* C, T6 a1);
/* GEANT_GROUP.exceptions */
extern unsigned char ge204os1975;
extern T0* ge204ov1975;
extern T0* T258f15(GE_context* ac, T0* C);
/* KL_EXCEPTIONS.default_create */
extern T0* T55c1(GE_context* ac);
/* KL_STDERR_FILE.put_line */
extern void T54f16(GE_context* ac, T0* C, T0* a1);
/* KL_STDERR_FILE.put_string */
extern void T54f17(GE_context* ac, T0* C, T0* a1);
/* KL_STDERR_FILE.old_put_string */
extern void T54f19(GE_context* ac, T0* C, T0* a1);
/* KL_STDERR_FILE.console_ps */
extern void T54f22(GE_context* ac, T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STRING_ROUTINES.as_string */
extern T0* T116f2(GE_context* ac, T0* C, T0* a1);
/* STRING_8.string */
extern T0* T17f15(GE_context* ac, T0* C);
/* STRING_8.make_from_string */
extern T0* T17c45(GE_context* ac, T0* a1);
/* SPECIAL [CHARACTER_8].copy_data */
extern void T15f13(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [CHARACTER_8].force */
extern void T15f17(GE_context* ac, T0* C, T2 a1, T6 a2);
/* SPECIAL [CHARACTER_8].move_data */
extern void T15f16(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].overlapping_move */
extern void T15f20(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].non_overlapping_move */
extern void T15f19(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.area_lower */
extern T6 T17f7(GE_context* ac, T0* C);
/* UC_UTF8_STRING.as_string */
extern T0* T267f7(GE_context* ac, T0* C);
/* UC_UTF8_STRING.to_utf8 */
extern T0* T267f23(GE_context* ac, T0* C);
/* KL_ANY_ROUTINES.same_types */
extern T1 T131f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.any_ */
extern unsigned char ge121os2544;
extern T0* ge121ov2544;
extern T0* T116f8(GE_context* ac, T0* C);
/* KL_ANY_ROUTINES.default_create */
extern T0* T131c2(GE_context* ac);
/* KL_STDERR_FILE.string_ */
extern T0* T54f11(GE_context* ac, T0* C);
/* KL_STDERR_FILE.put_new_line */
extern void T54f15(GE_context* ac, T0* C);
/* KL_STANDARD_FILES.error */
extern unsigned char ge168os3414;
extern T0* ge168ov3414;
extern T0* T53f1(GE_context* ac, T0* C);
/* KL_STDERR_FILE.make */
extern T0* T54c13(GE_context* ac);
/* KL_STDERR_FILE.make_open_stderr */
extern void T54f18(GE_context* ac, T0* C, T0* a1);
/* KL_STDERR_FILE.set_write_mode */
extern void T54f21(GE_context* ac, T0* C);
/* KL_STDERR_FILE.console_def */
extern T14 T54f10(GE_context* ac, T0* C, T6 a1);
/* KL_STDERR_FILE.make_with_name */
extern void T54f20(GE_context* ac, T0* C, T0* a1);
/* STRING_8.make_empty */
extern T0* T17c37(GE_context* ac);
/* KL_STDERR_FILE.default_pointer */
extern T14 T54f7(GE_context* ac, T0* C);
/* KL_STDERR_FILE.set_name */
extern void T54f23(GE_context* ac, T0* C, T0* a1);
/* FILE_INFO.file_name_to_pointer */
extern T0* T119f6(GE_context* ac, T0* C, T0* a1, T0* a2);
extern T1 T119f6ot1(T0* a1);
extern T1 T119f6ot2(T0* a1);
/* C_STRING.set_string */
extern void T129f11(GE_context* ac, T0* C, T0* a1);
/* C_STRING.set_substring */
extern void T129f12(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* MANAGED_POINTER.put_natural_8 */
extern void T118f14(GE_context* ac, T0* C, T8 a1, T6 a2);
/* POINTER.memory_copy */
extern void T14f16(GE_context* ac, T14* C, T14 a1, T6 a2);
/* POINTER.c_memcpy */
extern void T14f17(GE_context* ac, T14* C, T14 a1, T14 a2, T6 a3);
/* NATURAL_32.to_natural_8 */
extern T8 T10f4(GE_context* ac, T10* C);
/* C_STRING.make_shared_from_pointer_and_count */
extern void T129f10(GE_context* ac, T0* C, T14 a1, T6 a2);
/* C_STRING.make_shared_from_pointer_and_count */
extern T0* T129c10(GE_context* ac, T14 a1, T6 a2);
/* MANAGED_POINTER.share_from_pointer */
extern T0* T118c15(GE_context* ac, T14 a1, T6 a2);
/* MANAGED_POINTER.increment_counter */
extern void T118f12(GE_context* ac, T0* C);
/* UTF_CONVERTER.escaped_utf_32_substring_into_utf_8_0_pointer */
extern void T127f13(GE_context* ac, T127* C, T0* a1, T6 a2, T6 a3, T0* a4, T6 a5, T0* a6);
/* CELL [INTEGER_32].put */
extern void T128f2(GE_context* ac, T0* C, T6 a1);
/* CELL [INTEGER_32].put */
extern T0* T128c2(GE_context* ac, T6 a1);
/* NATURAL_32.is_less_equal */
extern T1 T10f2(GE_context* ac, T10* C, T10 a1);
/* UTF_CONVERTER.to_natural_32 */
extern T10 T127f5(GE_context* ac, T127* C, T0* a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.parsed_natural_32 */
extern T10 T264f12(GE_context* ac, T0* C);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.parse_string_with_type */
extern void T264f19(GE_context* ac, T0* C, T0* a1, T6 a2);
extern T1 T264f19ot1(T0* a1, T0** a2);
extern T1 T264f19ot2(T0* a1, T0** a2);
/* NATURAL_32.is_valid_character_8_code */
extern T1 T10f14(GE_context* ac, T10* C);
/* CHARACTER_32.is_character_8 */
extern T1 T3f3(GE_context* ac, T3* C);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.parse_character */
extern void T264f22(GE_context* ac, T0* C, T2 a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.overflowed */
extern T1 T264f16(GE_context* ac, T0* C);
/* INTEGER_OVERFLOW_CHECKER.will_overflow */
extern T1 T274f7(GE_context* ac, T0* C, T11 a1, T11 a2, T6 a3, T6 a4);
/* NATURAL_64.is_greater */
extern T1 T11f7(GE_context* ac, T11* C, T11 a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.overflow_checker */
extern unsigned char ge2412os8988;
extern T0* ge2412ov8988;
extern T0* T264f15(GE_context* ac, T0* C);
/* INTEGER_OVERFLOW_CHECKER.make */
extern T0* T274c13(GE_context* ac);
/* NATURAL_64.to_natural_64 */
extern T11 T11f10(GE_context* ac, T11* C);
/* NATURAL_32.to_natural_64 */
extern T11 T10f23(GE_context* ac, T10* C);
/* NATURAL_16.to_natural_64 */
extern T11 T9f7(GE_context* ac, T9* C);
/* NATURAL_8.to_natural_64 */
extern T11 T8f14(GE_context* ac, T8* C);
/* INTEGER_64.to_natural_64 */
extern T11 T7f3(GE_context* ac, T7* C);
/* INTEGER_16.to_natural_64 */
extern T11 T5f3(GE_context* ac, T5* C);
/* INTEGER_8.to_natural_64 */
extern T11 T4f3(GE_context* ac, T4* C);
/* SPECIAL [NATURAL_64].extend */
extern void T394f5(GE_context* ac, T0* C, T11 a1);
/* SPECIAL [NATURAL_64].make_empty */
extern T0* T394c4(GE_context* ac, T6 a1);
/* STRING_8.has */
extern T1 T17f29(GE_context* ac, T0* C, T2 a1);
/* INTEGER_32.to_natural_64 */
extern T11 T6f25(GE_context* ac, T6* C);
/* CHARACTER_8.is_greater_equal */
extern T1 T2f6(GE_context* ac, T2* C, T2 a1);
/* CHARACTER_8.is_hexa_digit */
extern T1 T2f20(GE_context* ac, T2* C);
/* NATURAL_8.is_greater */
extern T1 T8f3(GE_context* ac, T8* C, T8 a1);
/* CHARACTER_8.character_types */
extern T8 T2f10(GE_context* ac, T2* C, T6 a1);
/* CHARACTER_8.internal_character_types */
extern unsigned char ge2309os93;
extern T0* ge2309ov93;
extern T0* T2f12(GE_context* ac, T2* C);
/* SPECIAL [NATURAL_8].fill_with */
extern void T163f6(GE_context* ac, T0* C, T8 a1, T6 a2, T6 a3);
/* SPECIAL [NATURAL_8].extend */
extern void T163f8(GE_context* ac, T0* C, T8 a1);
/* SPECIAL [NATURAL_8].make_empty */
extern void T163f5(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [NATURAL_8].make_empty */
extern T0* T163c5(GE_context* ac, T6 a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.reset */
extern void T264f18(GE_context* ac, T0* C, T6 a1);
/* UTF_CONVERTER.ctoi_convertor */
extern unsigned char ge2382os6417;
extern T0* ge2382ov6417;
extern T0* T127f6(GE_context* ac, T127* C);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.set_trailing_separators_acceptable */
extern void T264f21(GE_context* ac, T0* C, T1 a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.set_leading_separators_acceptable */
extern void T264f20(GE_context* ac, T0* C, T1 a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.make */
extern T0* T264c17(GE_context* ac);
/* UTF_CONVERTER.is_hexa_decimal */
extern T1 T127f4(GE_context* ac, T127* C, T0* a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.is_integral_integer */
extern T1 T264f14(GE_context* ac, T0* C);
/* UTF_CONVERTER.utf_8_bytes_count */
extern T6 T127f1(GE_context* ac, T127* C, T0* a1, T6 a2, T6 a3);
/* FILE_INFO.multi_byte_to_utf_16 */
extern T6 T119f13(GE_context* ac, T0* C, T14 a1, T14 a2, T6 a3);
/* FILE_INFO.default_pointer */
extern T14 T119f12(GE_context* ac, T0* C);
/* C_STRING.item */
extern T14 T129f3(GE_context* ac, T0* C);
/* C_STRING.make */
extern T0* T129c9(GE_context* ac, T0* a1);
/* C_STRING.make_empty */
extern void T129f7(GE_context* ac, T0* C, T6 a1);
/* C_STRING.make_empty */
extern T0* T129c7(GE_context* ac, T6 a1);
/* UTF_CONVERTER.escaped_utf_32_substring_into_utf_16_0_pointer */
extern void T127f12(GE_context* ac, T127* C, T0* a1, T6 a2, T6 a3, T0* a4, T6 a5, T0* a6);
/* MANAGED_POINTER.put_natural_16 */
extern void T118f13(GE_context* ac, T0* C, T9 a1, T6 a2);
/* NATURAL_32.to_natural_16 */
extern T9 T10f10(GE_context* ac, T10* C);
/* NATURAL_32.is_greater */
extern T1 T10f9(GE_context* ac, T10* C, T10 a1);
/* UTF_CONVERTER.utf_16_bytes_count */
extern T6 T127f2(GE_context* ac, T127* C, T0* a1, T6 a2, T6 a3);
/* MANAGED_POINTER.resize */
extern void T118f11(GE_context* ac, T0* C, T6 a1);
/* POINTER.memory_set */
extern void T14f12(GE_context* ac, T14* C, T6 a1, T6 a2);
/* POINTER.c_memset */
extern void T14f15(GE_context* ac, T14* C, T14 a1, T6 a2, T6 a3);
/* EXCEPTIONS.raise */
extern void T178f2(GE_context* ac, T0* C, T0* a1);
/* DEVELOPER_EXCEPTION.raise */
extern void T87f16(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.raise */
extern void T19f17(GE_context* ac, T0* C, T0* a1);
/* DEVELOPER_EXCEPTION.code */
extern T6 T87f8(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.default_pointer */
extern T14 T19f12(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.set_last_exception */
extern void T19f16(GE_context* ac, T0* C, T0* a1);
/* CELL [detachable EXCEPTION].put */
extern void T25f2(GE_context* ac, T0* C, T0* a1);
/* CELL [detachable EXCEPTION].put */
extern T0* T25c2(GE_context* ac, T0* a1);
/* ISE_EXCEPTION_MANAGER.last_exception_cell */
extern unsigned char ge2584os1921;
extern T0* ge2584ov1921;
extern T0* T19f5(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.last_exception */
extern T0* T19f8(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.in_rescue */
extern T1 T19f11(GE_context* ac, T0* C);
/* DEVELOPER_EXCEPTION.is_ignored */
extern T1 T87f7(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.is_ignored */
extern T1 T19f13(GE_context* ac, T0* C, T0* a1);
/* HASH_TABLE [INTEGER_32, INTEGER_32].has */
extern T1 T23f34(GE_context* ac, T0* C, T6 a1);
/* HASH_TABLE [INTEGER_32, INTEGER_32].same_keys */
extern T1 T23f26(GE_context* ac, T0* C, T6 a1, T6 a2);
/* HASH_TABLE [INTEGER_32, INTEGER_32].hash_code_of */
extern T6 T23f25(GE_context* ac, T0* C, T6 a1);
/* INTEGER_32.hash_code */
extern T6 T6f12(GE_context* ac, T6* C);
/* ISE_EXCEPTION_MANAGER.ignored_exceptions */
extern unsigned char ge2584os1916;
extern T0* ge2584ov1916;
extern T0* T19f1(GE_context* ac, T0* C);
/* HASH_TABLE [INTEGER_32, INTEGER_32].make */
extern T0* T23c35(GE_context* ac, T6 a1);
/* SPECIAL [INTEGER_32].make_filled */
extern T0* T95c7(GE_context* ac, T6 a1, T6 a2);
/* SPECIAL [INTEGER_32].fill_with */
extern void T95f10(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].extend */
extern void T95f11(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [BOOLEAN].make_filled */
extern T0* T96c6(GE_context* ac, T1 a1, T6 a2);
/* SPECIAL [BOOLEAN].fill_with */
extern void T96f9(GE_context* ac, T0* C, T1 a1, T6 a2, T6 a3);
/* SPECIAL [BOOLEAN].extend */
extern void T96f11(GE_context* ac, T0* C, T1 a1);
/* SPECIAL [BOOLEAN].make_empty */
extern void T96f8(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [BOOLEAN].make_empty */
extern T0* T96c8(GE_context* ac, T6 a1);
/* SPECIAL [INTEGER_32].make_empty */
extern void T95f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [INTEGER_32].make_empty */
extern T0* T95c6(GE_context* ac, T6 a1);
/* PRIMES.higher_prime */
extern T6 T94f1(GE_context* ac, T0* C, T6 a1);
/* PRIMES.is_prime */
extern T1 T94f3(GE_context* ac, T0* C, T6 a1);
/* PRIMES.default_create */
extern T0* T94c5(GE_context* ac);
/* DEVELOPER_EXCEPTION.generating_type */
extern T0* T87f9(GE_context* ac, T0* C);
/* DEVELOPER_EXCEPTION.exception_manager */
extern T0* T87f6(GE_context* ac, T0* C);
/* DEVELOPER_EXCEPTION.default_create */
extern T0* T87c10(GE_context* ac);
/* EXCEPTIONS.default_create */
extern T0* T178c1(GE_context* ac);
/* MANAGED_POINTER.default_pointer */
extern T14 T118f4(GE_context* ac, T0* C);
/* POINTER.memory_realloc */
extern T14 T14f2(GE_context* ac, T14* C, T6 a1);
/* POINTER.c_realloc */
extern T14 T14f7(GE_context* ac, T14* C, T14 a1, T6 a2);
/* MANAGED_POINTER.make */
extern T0* T118c9(GE_context* ac, T6 a1);
/* POINTER.memory_calloc */
extern T14 T14f1(GE_context* ac, T14* C, T6 a1, T6 a2);
/* POINTER.c_calloc */
extern T14 T14f5(GE_context* ac, T14* C, T6 a1, T6 a2);
/* PLATFORM.is_windows */
extern T1 T161s1(GE_context* ac);
/* KL_STDERR_FILE.buffered_file_info */
extern unsigned char ge2319os3719;
extern T0* ge2319ov3719;
extern T0* T54f12(GE_context* ac, T0* C);
/* FILE_INFO.make */
extern T0* T119c22(GE_context* ac);
/* FILE_INFO.make_filled_area */
extern void T119f24(GE_context* ac, T0* C, T8 a1, T6 a2);
/* SPECIAL [NATURAL_8].make_filled */
extern T0* T163c4(GE_context* ac, T8 a1, T6 a2);
/* FILE_INFO.stat_size */
extern T6 T119f9(GE_context* ac, T0* C);
/* GEANT_GROUP.std */
extern unsigned char ge166os1976;
extern T0* ge166ov1976;
extern T0* T258f14(GE_context* ac, T0* C);
/* KL_STANDARD_FILES.default_create */
extern T0* T53c3(GE_context* ac);
/* GEANT_GROUP.log_messages */
extern void T258f35(GE_context* ac, T0* C, T0* a1);
/* ARRAY [STRING_8].item */
extern T0* T40f4(GE_context* ac, T0* C, T6 a1);
/* GEANT_GROUP.associated_target */
extern T0* T258f12(GE_context* ac, T0* C);
/* GEANT_GROUP.file_system */
extern unsigned char ge165os1977;
extern T0* ge165ov1977;
extern T0* T258f11(GE_context* ac, T0* C);
/* GEANT_GROUP.unix_file_system */
extern unsigned char ge165os1980;
extern T0* ge165ov1980;
extern T0* T258f23(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.make */
extern T0* T93c33(GE_context* ac);
/* KL_OPERATING_SYSTEM.is_unix */
extern unsigned char ge199os3447;
extern T1 ge199ov3447;
extern T1 T90f2(GE_context* ac, T0* C);
/* STRING_8.item */
extern T2 T17f10(GE_context* ac, T0* C, T6 a1);
/* KL_OPERATING_SYSTEM.current_working_directory */
extern T0* T90f4(GE_context* ac, T0* C);
/* EXECUTION_ENVIRONMENT.current_working_directory */
extern T0* T130f2(GE_context* ac, T0* C);
/* FILE_INFO.pointer_to_file_name_8 */
extern T0* T119f15(GE_context* ac, T0* C, T14 a1);
/* C_STRING.string */
extern T0* T129f5(GE_context* ac, T0* C);
/* C_STRING.c_strlen */
extern T6 T129f6(GE_context* ac, T0* C, T14 a1);
/* C_STRING.make_shared_from_pointer */
extern T0* T129c13(GE_context* ac, T14 a1);
/* C_STRING.substring */
extern T0* T129f4(GE_context* ac, T0* C, T6 a1, T6 a2);
/* C_STRING.read_substring_into */
extern void T129f14(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* STRING_8.put_code */
extern void T17f44(GE_context* ac, T0* C, T10 a1, T6 a2);
/* NATURAL_8.to_natural_32 */
extern T10 T8f1(GE_context* ac, T8* C);
/* MANAGED_POINTER.read_natural_8 */
extern T8 T118f7(GE_context* ac, T0* C, T6 a1);
/* TYPED_POINTER [NATURAL_8].memory_copy */
extern void T263f2(GE_context* ac, T263* C, T14 a1, T6 a2);
/* TYPED_POINTER [NATURAL_8].c_memcpy */
extern void T263f3(GE_context* ac, T263* C, T14 a1, T14 a2, T6 a3);
/* STRING_8.set_count */
extern void T17f43(GE_context* ac, T0* C, T6 a1);
/* FILE_INFO.utf_16_to_multi_byte */
extern T6 T119f16(GE_context* ac, T0* C, T14 a1, T14 a2, T6 a3);
/* EXECUTION_ENVIRONMENT.file_info */
extern unsigned char ge2551os6473;
extern T0* ge2551ov6473;
extern T0* T130f5(GE_context* ac, T0* C);
/* EXECUTION_ENVIRONMENT.eif_dir_current */
extern T6 T130f4(GE_context* ac, T0* C, T14 a1, T6 a2);
/* KL_OPERATING_SYSTEM.execution_environment */
extern unsigned char ge199os3451;
extern T0* ge199ov3451;
extern T0* T90f5(GE_context* ac, T0* C);
/* EXECUTION_ENVIRONMENT.default_create */
extern T0* T130c11(GE_context* ac);
/* STRING_8.is_equal */
extern T1 T17f31(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].same_items */
extern T1 T15f6(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* KL_OPERATING_SYSTEM.variable_value */
extern T0* T90f3(GE_context* ac, T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.get */
extern T0* T130f7(GE_context* ac, T0* C, T0* a1);
/* STRING_32.as_string_8 */
extern T0* T18f4(GE_context* ac, T0* C);
/* STRING_8.valid_code */
extern T1 T17f24(GE_context* ac, T0* C, T10 a1);
/* EXECUTION_ENVIRONMENT.item */
extern T0* T130f3(GE_context* ac, T0* C, T0* a1);
/* NATIVE_STRING.string */
extern T0* T181f3(GE_context* ac, T0* C);
/* UTF_CONVERTER.utf_8_0_pointer_to_escaped_string_32 */
extern T0* T127f8(GE_context* ac, T127* C, T0* a1);
/* UTF_CONVERTER.utf_8_0_pointer_into_escaped_string_32 */
extern void T127f15(GE_context* ac, T127* C, T0* a1, T0* a2);
/* UTF_CONVERTER.utf_8_0_subpointer_into_escaped_string_32 */
extern void T127f17(GE_context* ac, T127* C, T0* a1, T6 a2, T6 a3, T1 a4, T0* a5);
/* UTF_CONVERTER.escape_code_into */
extern void T127f18(GE_context* ac, T127* C, T0* a1, T9 a2);
/* NATURAL_16.to_hex_string */
extern T0* T9f4(GE_context* ac, T9* C);
/* STRING_8.put */
extern void T17f52(GE_context* ac, T0* C, T2 a1, T6 a2);
/* INTEGER_32.to_hex_character */
extern T2 T6f21(GE_context* ac, T6* C);
/* NATURAL_16.to_integer_32 */
extern T6 T9f12(GE_context* ac, T9* C);
/* STRING_8.fill_blank */
extern void T17f51(GE_context* ac, T0* C);
/* STRING_8.fill_character */
extern void T17f53(GE_context* ac, T0* C, T2 a1);
/* PLATFORM.default_create */
extern T0* T161c4(GE_context* ac);
/* STRING_32.append_string_general */
extern void T18f17(GE_context* ac, T0* C, T0* a1);
/* STRING_32.append */
extern void T18f17p1(GE_context* ac, T0* C, T0* a1);
/* STRING_32.set_count */
extern void T18f21(GE_context* ac, T0* C, T6 a1);
/* STRING_32.append_code */
extern void T18f20(GE_context* ac, T0* C, T10 a1);
/* STRING_32.put_code */
extern void T18f22(GE_context* ac, T0* C, T10 a1, T6 a2);
/* STRING_32.resize */
extern void T18f18(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [CHARACTER_32].aliased_resized_area_with_default */
extern T0* T16f4(GE_context* ac, T0* C, T3 a1, T6 a2);
/* SPECIAL [CHARACTER_32].fill_with */
extern void T16f12(GE_context* ac, T0* C, T3 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_32].extend */
extern void T16f16(GE_context* ac, T0* C, T3 a1);
/* SPECIAL [CHARACTER_32].aliased_resized_area */
extern T0* T16f5(GE_context* ac, T0* C, T6 a1);
/* STRING_32.capacity */
extern T6 T18f7(GE_context* ac, T0* C);
/* STRING_32.append */
extern void T18f19(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [CHARACTER_32].copy_data */
extern void T16f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [CHARACTER_32].force */
extern void T16f11(GE_context* ac, T0* C, T3 a1, T6 a2);
/* SPECIAL [CHARACTER_32].move_data */
extern void T16f10(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_32].overlapping_move */
extern void T16f14(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_32].non_overlapping_move */
extern void T16f13(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_32.additional_space */
extern T6 T18f8(GE_context* ac, T0* C);
/* NATURAL_8.to_hex_string */
extern T0* T8f12(GE_context* ac, T8* C);
/* NATURAL_8.to_integer_32 */
extern T6 T8f7(GE_context* ac, T8* C);
/* NATURAL_16.is_less_equal */
extern T1 T9f2(GE_context* ac, T9* C, T9 a1);
/* STRING_32.append_character */
extern void T18f16(GE_context* ac, T0* C, T3 a1);
/* NATURAL_8.to_natural_16 */
extern T9 T8f10(GE_context* ac, T8* C);
/* STRING_32.extend */
extern void T18f15(GE_context* ac, T0* C, T3 a1);
/* NATURAL_8.is_less_equal */
extern T1 T8f8(GE_context* ac, T8* C, T8 a1);
/* STRING_32.grow */
extern void T18f14(GE_context* ac, T0* C, T6 a1);
/* STRING_32.make */
extern void T18f13(GE_context* ac, T0* C, T6 a1);
/* STRING_32.make */
extern T0* T18c13(GE_context* ac, T6 a1);
/* SPECIAL [CHARACTER_32].make_filled */
extern T0* T16c9(GE_context* ac, T3 a1, T6 a2);
/* SPECIAL [CHARACTER_32].make_empty */
extern void T16f7(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [CHARACTER_32].make_empty */
extern T0* T16c7(GE_context* ac, T6 a1);
/* UTF_CONVERTER.utf_16_0_pointer_to_escaped_string_32 */
extern T0* T127f7(GE_context* ac, T127* C, T0* a1);
/* UTF_CONVERTER.utf_16_0_pointer_into_escaped_string_32 */
extern void T127f14(GE_context* ac, T127* C, T0* a1, T0* a2);
/* UTF_CONVERTER.utf_16_0_subpointer_into_escaped_string_32 */
extern void T127f16(GE_context* ac, T127* C, T0* a1, T6 a2, T6 a3, T1 a4, T0* a5);
/* NATURAL_32.is_greater_equal */
extern T1 T10f16(GE_context* ac, T10* C, T10 a1);
/* NATURAL_16.to_natural_32 */
extern T10 T9f1(GE_context* ac, T9* C);
/* MANAGED_POINTER.read_natural_16 */
extern T9 T118f8(GE_context* ac, T0* C, T6 a1);
/* TYPED_POINTER [NATURAL_16].memory_copy */
extern void T262f2(GE_context* ac, T262* C, T14 a1, T6 a2);
/* TYPED_POINTER [NATURAL_16].c_memcpy */
extern void T262f3(GE_context* ac, T262* C, T14 a1, T14 a2, T6 a3);
/* NATIVE_STRING.make_from_pointer */
extern T0* T181c12(GE_context* ac, T14 a1);
/* MANAGED_POINTER.make_from_pointer */
extern T0* T118c16(GE_context* ac, T14 a1, T6 a2);
/* POINTER.memory_alloc */
extern T14 T14f9(GE_context* ac, T14* C, T6 a1);
/* POINTER.c_malloc */
extern T14 T14f10(GE_context* ac, T14* C, T6 a1);
/* NATIVE_STRING.unit_size */
extern T6 T181f4(GE_context* ac, T0* C);
/* NATIVE_STRING.pointer_length_in_bytes */
extern T6 T181f6(GE_context* ac, T0* C, T14 a1);
/* NATURAL_64.to_integer_32 */
extern T6 T11f5(GE_context* ac, T11* C);
/* NATURAL_64.is_less_equal */
extern T1 T11f4(GE_context* ac, T11* C, T11 a1);
/* NATIVE_STRING.c_pointer_length_in_bytes */
extern T11 T181f8(GE_context* ac, T0* C, T14 a1);
/* EXECUTION_ENVIRONMENT.eif_getenv */
extern T14 T130f6(GE_context* ac, T0* C, T14 a1);
/* NATIVE_STRING.item */
extern T14 T181f5(GE_context* ac, T0* C);
/* NATIVE_STRING.make */
extern T0* T181c11(GE_context* ac, T0* a1);
/* NATIVE_STRING.set_string */
extern void T181f14(GE_context* ac, T0* C, T0* a1);
/* NATIVE_STRING.set_substring */
extern void T181f15(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* NATIVE_STRING.upper_cell */
extern unsigned char ge2416os7787;
extern T0* ge2416ov7787;
extern T0* T181f7(GE_context* ac, T0* C);
/* NATIVE_STRING.make_empty */
extern void T181f9(GE_context* ac, T0* C, T6 a1);
/* NATIVE_STRING.make_empty */
extern T0* T181c9(GE_context* ac, T6 a1);
/* GEANT_GROUP.windows_file_system */
extern unsigned char ge165os1978;
extern T0* ge165ov1978;
extern T0* T258f22(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.make */
extern T0* T92c36(GE_context* ac);
/* KL_OPERATING_SYSTEM.is_windows */
extern unsigned char ge199os3446;
extern T1 ge199ov3446;
extern T1 T90f1(GE_context* ac, T0* C);
/* GEANT_GROUP.operating_system */
extern unsigned char ge207os1981;
extern T0* ge207ov1981;
extern T0* T258f21(GE_context* ac, T0* C);
/* KL_OPERATING_SYSTEM.default_create */
extern T0* T90c6(GE_context* ac);
/* GEANT_GROUP.project_variables_resolver */
extern unsigned char ge10os1963;
extern T0* ge10ov1963;
extern T0* T258f6(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.make */
extern T0* T100c18(GE_context* ac);
/* GEANT_GROUP.dir_attribute_name */
extern unsigned char ge86os2905;
extern T0* ge86ov2905;
extern T0* T258f10(GE_context* ac, T0* C);
/* GEANT_GROUP.is_enabled */
extern T1 T258f8(GE_context* ac, T0* C);
/* GEANT_GROUP.unless_attribute_name */
extern unsigned char ge86os2907;
extern T0* ge86ov2907;
extern T0* T258f7(GE_context* ac, T0* C);
/* BOOLEAN.out */
extern T0* T1f6(GE_context* ac, T1* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.boolean_condition_value */
extern T1 T100f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.exit_application */
extern void T100f20(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_PROJECT_VARIABLE_RESOLVER.exceptions */
extern T0* T100f12(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.std */
extern T0* T100f11(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.log_messages */
extern void T100f21(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.has */
extern T1 T100f6(GE_context* ac, T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.variable_value */
extern T0* T150f1(GE_context* ac, T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.string_ */
extern T0* T150f3(GE_context* ac, T0* C);
/* KL_EXECUTION_ENVIRONMENT.environment_impl */
extern unsigned char ge192os7405;
extern T0* ge192ov7405;
extern T0* T150f2(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.execution_environment */
extern unsigned char ge205os1974;
extern T0* ge205ov1974;
extern T0* T100f7(GE_context* ac, T0* C);
/* KL_EXECUTION_ENVIRONMENT.default_create */
extern T0* T150c4(GE_context* ac);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].item */
extern T0* T152f5(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.target_locals_stack */
extern unsigned char ge10os1966;
extern T0* ge10ov1966;
extern T0* T100f5(GE_context* ac, T0* C);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].make */
extern T0* T152c8(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES].make */
extern T0* T245f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_VARIABLES].make_empty */
extern void T244f5(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_VARIABLES].make_empty */
extern T0* T244c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES].default_create */
extern T0* T245c3(GE_context* ac);
/* GEANT_PROJECT_VARIABLE_RESOLVER.commandline_variables */
extern unsigned char ge10os1956;
extern T0* ge10ov1956;
extern T0* T100f4(GE_context* ac, T0* C);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].item */
extern T0* T151f5(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.target_arguments_stack */
extern unsigned char ge10os1965;
extern T0* ge10ov1965;
extern T0* T100f3(GE_context* ac, T0* C);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].make */
extern T0* T151c8(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].make */
extern T0* T243f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].make_empty */
extern T0* T242c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].default_create */
extern T0* T243c3(GE_context* ac);
/* UC_UTF8_STRING.item */
extern T2 T267f13(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.character_item_at_byte_index */
extern T2 T267f32(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.byte_index */
extern T6 T267f31(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.true_attribute_value */
extern unsigned char ge9os5472;
extern T0* ge9ov5472;
extern T0* T100f10(GE_context* ac, T0* C);
/* KL_STRING_ROUTINES.same_case_insensitive */
extern T1 T116f11(GE_context* ac, T0* C, T0* a1, T0* a2);
/* CHARACTER_8.lower */
extern T2 T2f22(GE_context* ac, T2* C);
/* CHARACTER_8.is_upper */
extern T1 T2f23(GE_context* ac, T2* C);
/* UC_UNICODE_ROUTINES.lower_code */
extern T6 T390f4(GE_context* ac, T0* C, T6 a1);
/* ARRAY [INTEGER_32].item */
extern T6 T265f4(GE_context* ac, T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.lower_codes */
extern unsigned char ge236os10078;
extern T0* ge236ov10078;
extern T0* T390f9(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_plane */
extern unsigned char ge236os10077;
extern T0* ge236ov10077;
extern T0* T390f12(GE_context* ac, T0* C);
/* SPECIAL [ARRAY [INTEGER_32]].make_filled */
extern T0* T484c4(GE_context* ac, T0* a1, T6 a2);
/* SPECIAL [ARRAY [INTEGER_32]].fill_with */
extern void T484f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ARRAY [INTEGER_32]].extend */
extern void T484f8(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [ARRAY [INTEGER_32]].make_empty */
extern void T484f6(GE_context* ac, T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.empty_lower_code_segment */
extern unsigned char ge236os10064;
extern T0* ge236ov10064;
extern T0* T390f19(GE_context* ac, T0* C);
/* KL_INTEGER_ROUTINES.to_integer */
extern T6 T269f3(GE_context* ac, T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.integer_ */
extern T0* T390f30(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_1 */
extern unsigned char ge236os10076;
extern T0* ge236ov10076;
extern T0* T390f11(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_1_segment_4 */
extern unsigned char ge236os10075;
extern T0* ge236ov10075;
extern T0* T390f29(GE_context* ac, T0* C);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].make_filled */
extern T0* T485c4(GE_context* ac, T0* a1, T6 a2);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].fill_with */
extern void T485f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].extend */
extern void T485f8(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].make_empty */
extern void T485f6(GE_context* ac, T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.lower_code_plane_0 */
extern unsigned char ge236os10074;
extern T0* ge236ov10074;
extern T0* T390f10(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_255 */
extern unsigned char ge236os10073;
extern T0* ge236ov10073;
extern T0* T390f28(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_167 */
extern unsigned char ge236os10072;
extern T0* ge236ov10072;
extern T0* T390f27(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_166 */
extern unsigned char ge236os10071;
extern T0* ge236ov10071;
extern T0* T390f26(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_44 */
extern unsigned char ge236os10070;
extern T0* ge236ov10070;
extern T0* T390f25(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_36 */
extern unsigned char ge236os10069;
extern T0* ge236ov10069;
extern T0* T390f24(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_33 */
extern unsigned char ge236os10068;
extern T0* ge236ov10068;
extern T0* T390f23(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_31 */
extern unsigned char ge236os10067;
extern T0* ge236ov10067;
extern T0* T390f22(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_30 */
extern unsigned char ge236os10066;
extern T0* ge236ov10066;
extern T0* T390f21(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_16 */
extern unsigned char ge236os10065;
extern T0* ge236ov10065;
extern T0* T390f20(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_5 */
extern unsigned char ge236os10063;
extern T0* ge236ov10063;
extern T0* T390f18(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_4 */
extern unsigned char ge236os10062;
extern T0* ge236ov10062;
extern T0* T390f17(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_3 */
extern unsigned char ge236os10061;
extern T0* ge236ov10061;
extern T0* T390f16(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_2 */
extern unsigned char ge236os10060;
extern T0* ge236ov10060;
extern T0* T390f15(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_1 */
extern unsigned char ge236os10059;
extern T0* ge236ov10059;
extern T0* T390f14(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_0 */
extern unsigned char ge236os10058;
extern T0* ge236ov10058;
extern T0* T390f13(GE_context* ac, T0* C);
/* KL_STRING_ROUTINES.unicode */
extern unsigned char ge217os6073;
extern T0* ge217ov6073;
extern T0* T116f12(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.default_create */
extern T0* T390c31(GE_context* ac);
/* UC_UTF8_STRING.item_code */
extern T6 T267f17(GE_context* ac, T0* C, T6 a1);
/* STRING_8.item_code */
extern T6 T17f14(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.false_attribute_value */
extern unsigned char ge9os5473;
extern T0* ge9ov5473;
extern T0* T100f9(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.string_ */
extern T0* T100f2(GE_context* ac, T0* C);
/* DS_LINKED_LIST [STRING_8].item */
extern T0* T298f6(GE_context* ac, T0* C, T6 a1);
/* ST_SPLITTER.split_greedy */
extern T0* T412f9(GE_context* ac, T0* C, T0* a1);
/* ST_SPLITTER.do_split */
extern T0* T412f7(GE_context* ac, T0* C, T0* a1, T1 a2);
/* DS_LINKED_LIST [STRING_8].force_last */
extern void T298f12(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [STRING_8].put_right */
extern void T410f4(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [STRING_8].make */
extern T0* T410c3(GE_context* ac, T0* a1);
/* DS_HASH_SET [INTEGER_32].has */
extern T1 T509f25(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].search_position */
extern void T509f31(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].hash_position */
extern T6 T509f19(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].key_storage_item */
extern T6 T509f18(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].item_storage_item */
extern T6 T509f27(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].clashes_item */
extern T6 T509f22(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].key_equality_tester */
extern T0* T509f28(GE_context* ac, T0* C);
/* DS_HASH_SET [INTEGER_32].slots_item */
extern T6 T509f24(GE_context* ac, T0* C, T6 a1);
/* KL_STRING_ROUTINES.appended_substring */
extern T0* T116f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* UC_UTF8_STRING.append_character */
extern void T267f60(GE_context* ac, T0* C, T2 a1);
/* UC_UTF8_STRING.put_character_at_byte_index */
extern void T267f76(GE_context* ac, T0* C, T2 a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.put_code_at_byte_index */
extern void T267f86(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.put_byte */
extern void T267f84(GE_context* ac, T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.old_put */
extern void T267f75(GE_context* ac, T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.resize_byte_storage */
extern void T267f74(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.old_set_count */
extern void T267f64(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.resize */
extern void T267f85(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.byte_capacity */
extern T6 T267f45(GE_context* ac, T0* C);
/* UC_UTF8_STRING.capacity */
extern T6 T267f45p1(GE_context* ac, T0* C);
/* UC_UTF8_ROUTINES.character_byte_count */
extern T6 T266f23(GE_context* ac, T0* C, T2 a1);
/* UC_UTF8_STRING.append_string */
extern void T267f59(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.append */
extern void T267f73(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.dummy_uc_string */
extern unsigned char ge223os7565;
extern T0* ge223ov7565;
extern T0* T267f49(GE_context* ac, T0* C);
/* UC_STRING.make_empty */
extern T0* T160c8(GE_context* ac);
/* UC_STRING.make */
extern void T160f9(GE_context* ac, T0* C, T6 a1);
/* UC_STRING.old_set_count */
extern void T160f12(GE_context* ac, T0* C, T6 a1);
/* UC_STRING.set_count */
extern void T160f11(GE_context* ac, T0* C, T6 a1);
/* UC_STRING.byte_capacity */
extern T6 T160f7(GE_context* ac, T0* C);
/* UC_STRING.capacity */
extern T6 T160f7p1(GE_context* ac, T0* C);
/* UC_STRING.make */
extern void T160f9p1(GE_context* ac, T0* C, T6 a1);
/* UC_STRING.reset_byte_index_cache */
extern void T160f10(GE_context* ac, T0* C);
/* UC_UTF8_STRING.append */
extern void T267f73p1(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.area_lower */
extern T6 T267f14(GE_context* ac, T0* C);
/* UC_UTF8_STRING.additional_space */
extern T6 T267f50(GE_context* ac, T0* C);
/* ISE_RUNTIME.check_assert */
extern T1 T391s1(GE_context* ac, T1 a1);
/* UC_UTF8_ROUTINES.substring_byte_count */
extern T6 T266f22(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
extern T1 T266f22ot1(T0* a1, T0** a2);
extern T1 T266f22ot2(T0* a1, T0** a2);
/* UC_UTF8_ROUTINES.code_byte_count */
extern T6 T266f24(GE_context* ac, T0* C, T6 a1);
/* NATURAL_32.to_integer_32 */
extern T6 T10f19(GE_context* ac, T10* C);
/* UC_UTF8_STRING.shifted_byte_index */
extern T6 T267f51(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF8_ROUTINES.dummy_uc_string */
extern unsigned char ge233os9035;
extern T0* ge233ov9035;
extern T0* T266f27(GE_context* ac, T0* C);
/* UC_UTF8_ROUTINES.any_ */
extern T0* T266f25(GE_context* ac, T0* C);
/* UC_UTF8_STRING.as_string_8 */
extern T0* T267f24(GE_context* ac, T0* C);
/* UC_UTF8_STRING.put_code */
extern void T267f65(GE_context* ac, T0* C, T10 a1, T6 a2);
/* UC_UTF8_STRING.put_item_code */
extern void T267f78(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.move_bytes_right */
extern void T267f87(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.move_bytes_left */
extern void T267f82(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.valid_code */
extern T1 T267f22(GE_context* ac, T0* C, T10 a1);
/* STRING_8.as_string_8 */
extern T0* T17f12(GE_context* ac, T0* C);
/* UC_UTF8_STRING.any_ */
extern T0* T267f47(GE_context* ac, T0* C);
/* UC_UTF8_STRING.new_empty_string */
extern T0* T267f12(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.make */
extern void T267f66(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.make */
extern T0* T267c66(GE_context* ac, T6 a1);
/* UC_UTF8_STRING.make */
extern void T267f66p1(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.gobo_append_substring */
extern void T267f61(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.put_substring_at_byte_index */
extern void T267f77(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4, T6 a5);
extern T1 T267f77ot1(T0* a1, T0** a2);
extern T1 T267f77ot2(T0* a1, T0** a2);
extern T1 T267f77ot3(T0* a1, T0** a2);
/* UC_UTF8_STRING.cloned_string */
extern T0* T267f46(GE_context* ac, T0* C);
/* UC_UTF8_STRING.twin */
extern T0* T267f21(GE_context* ac, T0* C);
/* UC_UTF8_STRING.copy */
extern void T267f70(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.copy */
extern void T267f70p1(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].resized_area */
extern T0* T15f7(GE_context* ac, T0* C, T6 a1);
/* ST_SPLITTER.string_ */
extern T0* T412f6(GE_context* ac, T0* C);
/* DS_LINKED_LIST [STRING_8].make */
extern T0* T298c10(GE_context* ac);
/* DS_LINKED_LIST [STRING_8].set_internal_cursor */
extern void T298f11(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].new_cursor */
extern T0* T298f8(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].make */
extern T0* T406c8(GE_context* ac, T0* a1);
/* ST_SPLITTER.make_with_separators */
extern T0* T412c10(GE_context* ac, T0* a1);
/* ST_SPLITTER.set_separators */
extern void T412f12(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [INTEGER_32].put */
extern void T509f30(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].slots_put */
extern void T509f40(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [INTEGER_32].clashes_put */
extern void T509f39(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [INTEGER_32].item_storage_put */
extern void T509f38(GE_context* ac, T0* C, T6 a1, T6 a2);
/* KL_SPECIAL_ROUTINES [INTEGER_32].force */
extern void T106f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* DS_HASH_SET [INTEGER_32].unset_found_item */
extern void T509f36(GE_context* ac, T0* C);
/* DS_HASH_SET [INTEGER_32].make */
extern T0* T509c29(GE_context* ac, T6 a1);
/* DS_HASH_SET [INTEGER_32].set_internal_cursor */
extern void T509f37(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [INTEGER_32].new_cursor */
extern T0* T509f20(GE_context* ac, T0* C);
/* DS_HASH_SET_CURSOR [INTEGER_32].make */
extern T0* T552c4(GE_context* ac, T0* a1);
/* DS_HASH_SET [INTEGER_32].make_slots */
extern void T509f35(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].new_modulus */
extern T6 T509f23(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].make_clashes */
extern void T509f34(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].make_key_storage */
extern void T509f33(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].make_item_storage */
extern void T509f32(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].make */
extern T0* T106f2(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].default_create */
extern T0* T106c6(GE_context* ac);
/* GEANT_GROUP.if_attribute_name */
extern unsigned char ge86os2906;
extern T0* ge86ov2906;
extern T0* T258f9(GE_context* ac, T0* C);
/* GEANT_GROUP.set_parent */
extern void T258f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_GROUP.make */
extern T0* T258c24(GE_context* ac, T0* a1, T0* a2);
/* GEANT_GROUP.initialize */
extern void T258f27(GE_context* ac, T0* C);
/* GEANT_GROUP.set_description */
extern void T258f33(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.text */
extern T0* T145f19(GE_context* ac, T0* C);
extern T1 T145f19ot1(T0* a1, T0** a2);
/* KL_STRING_ROUTINES.appended_string */
extern T0* T116f5(GE_context* ac, T0* C, T0* a1, T0* a2);
/* STRING_8.append_string */
extern void T17f42(GE_context* ac, T0* C, T0* a1);
/* STRING_8.append */
extern void T17f39(GE_context* ac, T0* C, T0* a1);
/* KL_STRING_ROUTINES.concat */
extern T0* T116f6(GE_context* ac, T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.prefixed_string */
extern T0* T267f11(GE_context* ac, T0* C, T0* a1);
/* KL_STRING_ROUTINES.cloned_string */
extern T0* T116f7(GE_context* ac, T0* C, T0* a1);
/* STRING_8.twin */
extern T0* T17f18(GE_context* ac, T0* C);
/* STRING_8.copy */
extern void T17f46(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.string_ */
extern T0* T145f21(GE_context* ac, T0* C);
/* XM_ELEMENT.element_by_name */
extern T0* T145f6(GE_context* ac, T0* C, T0* a1);
extern T1 T145f6ot1(T0* a1, T0** a2);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].go_after */
extern void T236f12(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].cursor_go_after */
extern void T239f15(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].set_after */
extern void T236f16(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].cursor_off */
extern T1 T239f6(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].off */
extern T1 T236f9(GE_context* ac, T0* C);
/* XM_ELEMENT.named_same_name */
extern T1 T145f5(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.same_namespace */
extern T1 T145f8(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE.is_equal */
extern T1 T231f4(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE.string_ */
extern T0* T231f3(GE_context* ac, T0* C);
/* XM_ELEMENT.same_string */
extern T1 T145f7(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.string_equality_tester */
extern unsigned char ge222os2707;
extern T0* ge222ov2707;
extern T0* T145f9(GE_context* ac, T0* C);
/* UC_STRING_EQUALITY_TESTER.default_create */
extern T0* T101c3(GE_context* ac);
/* GEANT_GROUP.make */
extern void T258f24p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_POSITION_TABLE.item */
extern T0* T147f3(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].forth */
extern void T272f11(GE_context* ac, T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_forth */
extern void T241f12(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].add_traversing_cursor */
extern void T241f13(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set_next_cursor */
extern void T272f14(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].remove_traversing_cursor */
extern void T241f14(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set */
extern void T272f12(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].go_after */
extern void T272f10(GE_context* ac, T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_go_after */
extern void T241f11(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set_after */
extern void T272f13(GE_context* ac, T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_off */
extern T1 T241f6(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].off */
extern T1 T272f7(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].item */
extern T0* T272f6(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].start */
extern void T272f9(GE_context* ac, T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_start */
extern void T241f10(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].new_cursor */
extern T0* T241f5(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T272c8(GE_context* ac, T0* a1);
/* XM_POSITION_TABLE.has */
extern T1 T147f2(GE_context* ac, T0* C, T0* a1);
/* GEANT_GROUP.set_project */
extern void T258f29(GE_context* ac, T0* C, T0* a1);
/* GEANT_GROUP.element_make */
extern void T258f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_GROUP.set_xml_element */
extern void T258f34(GE_context* ac, T0* C, T0* a1);
/* KL_STRING_ROUTINES.same_string */
extern T1 T116f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.elks_same_string */
extern T1 T116f10(GE_context* ac, T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.same_string */
extern T1 T267f16(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.substring_index */
extern T6 T267f34(GE_context* ac, T0* C, T0* a1, T6 a2);
/* STRING_8.same_string */
extern T1 T17f19(GE_context* ac, T0* C, T0* a1);
/* STRING_8.same_characters */
extern T1 T17f27(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* UC_UTF8_STRING.same_unicode_string */
extern T1 T267f15(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.unicode_substring_index */
extern T6 T267f33(GE_context* ac, T0* C, T0* a1, T6 a2);
/* GEANT_TARGET.group_element_name */
extern T0* T33f50(GE_context* ac, T0* C);
/* GEANT_TARGET.string_ */
extern T0* T33f35(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].item */
extern T0* T236f8(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].start */
extern void T236f11(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].cursor_start */
extern void T239f14(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.new_cursor */
extern T0* T145f11(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].new_cursor */
extern T0* T239f5(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].make */
extern T0* T236c10(GE_context* ac, T0* a1);
/* GEANT_TARGET.prepare_variables_before_execution */
extern void T33f79(GE_context* ac, T0* C);
/* GEANT_TARGET.prepare_variables_before_execution */
extern void T33f79p1(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].forth */
extern void T105f12(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].key */
extern T0* T105f6(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].item */
extern T0* T105f5(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].after */
extern T1 T105f4(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].start */
extern void T105f11(GE_context* ac, T0* C);
/* GEANT_VARIABLES.new_cursor */
extern T0* T36f29(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].make */
extern T0* T105c10(GE_context* ac, T0* a1);
/* GEANT_TARGET.target_locals_stack */
extern T0* T33f49(GE_context* ac, T0* C);
/* GEANT_TARGET.prepared_arguments_from_formal_arguments */
extern T0* T33f48(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.has_same_keys */
extern T1 T41f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.new_cursor */
extern T0* T41f29(GE_context* ac, T0* C);
/* GEANT_TARGET.named_from_numbered_arguments */
extern T0* T33f58(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.has_numbered_keys */
extern T1 T41f37(GE_context* ac, T0* C);
/* INTEGER_32.out */
extern T0* T6f18(GE_context* ac, T6* C);
/* STRING_8.append_integer */
extern void T17f50(GE_context* ac, T0* C, T6 a1);
/* GEANT_TARGET.target_arguments_stack */
extern T0* T33f47(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.set_current_working_directory */
extern void T93f34(GE_context* ac, T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.change_working_directory */
extern void T130f12(GE_context* ac, T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.eif_chdir */
extern T6 T130f8(GE_context* ac, T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.execution_environment */
extern unsigned char ge156os4697;
extern T0* ge156ov4697;
extern T0* T93f18(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.string_ */
extern T0* T93f13(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.set_current_working_directory */
extern void T92f37(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.execution_environment */
extern T0* T92f20(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.string_ */
extern T0* T92f12(GE_context* ac, T0* C);
/* GEANT_TARGET.exit_application */
extern void T33f67(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_TARGET.exceptions */
extern T0* T33f24(GE_context* ac, T0* C);
/* GEANT_TARGET.std */
extern T0* T33f23(GE_context* ac, T0* C);
/* GEANT_TARGET.log_messages */
extern void T33f74(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.associated_target */
extern T0* T33f46(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.directory_exists */
extern T1 T93f24(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.exists */
extern T1 T411f16(GE_context* ac, T0* C);
/* KL_DIRECTORY.old_exists */
extern T1 T411f19(GE_context* ac, T0* C);
/* KL_DIRECTORY.eif_dir_exists */
extern T1 T411f14(GE_context* ac, T0* C, T14 a1);
/* KL_DIRECTORY.internal_name_pointer */
extern T0* T411f12(GE_context* ac, T0* C);
/* KL_DIRECTORY.reset */
extern void T411f45(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.make */
extern void T411f43(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.make */
extern T0* T411c43(GE_context* ac, T0* a1);
/* KL_DIRECTORY.old_make */
extern void T411f46(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.make_with_name */
extern void T411f48(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.set_name */
extern void T411f50(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.file_info */
extern unsigned char ge2314os10340;
extern T0* ge2314ov10340;
extern T0* T411f17(GE_context* ac, T0* C);
/* KL_DIRECTORY.string_ */
extern T0* T411f22(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.tmp_directory */
extern unsigned char ge156os4695;
extern T0* ge156ov4695;
extern T0* T93f25(GE_context* ac, T0* C);
/* UC_UTF8_STRING.old_is_empty */
extern T1 T267f53(GE_context* ac, T0* C);
/* STRING_8.is_empty */
extern T1 T17f30(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.directory_exists */
extern T1 T92f27(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.tmp_directory */
extern T0* T92f28(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.current_working_directory */
extern T0* T93f23(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.current_working_directory */
extern T0* T92f26(GE_context* ac, T0* C);
/* GEANT_TARGET.file_system */
extern T0* T33f45(GE_context* ac, T0* C);
/* GEANT_TARGET.unix_file_system */
extern T0* T33f57(GE_context* ac, T0* C);
/* GEANT_TARGET.windows_file_system */
extern T0* T33f56(GE_context* ac, T0* C);
/* GEANT_TARGET.operating_system */
extern T0* T33f55(GE_context* ac, T0* C);
/* GEANT_STRING_INTERPRETER.interpreted_string */
extern T0* T312f5(GE_context* ac, T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.variable_value */
extern T0* T312f3(GE_context* ac, T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.expanded_variable_value */
extern T0* T312f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.value */
extern T0* T547f2(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.item */
extern T0* T36f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.item_storage_item */
extern T0* T36f35(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.search_position */
extern void T36f52(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.hash_position */
extern T6 T36f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.key_storage_item */
extern T0* T36f30(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.clashes_item */
extern T6 T36f26(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.slots_item */
extern T6 T36f33(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.value */
extern T0* T100f13(GE_context* ac, T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.cwd */
extern T0* T93f10(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.cwd */
extern T0* T92f10(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.file_system */
extern T0* T100f14(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.unix_file_system */
extern T0* T100f17(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.windows_file_system */
extern T0* T100f16(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.operating_system */
extern T0* T100f15(GE_context* ac, T0* C);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.has */
extern T1 T547f3(GE_context* ac, T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.default_variable_value */
extern T0* T312f4(GE_context* ac, T0* C, T0* a1);
/* KL_STRING_ROUTINES.append_substring_to_string */
extern void T116f20(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* KL_STRING_ROUTINES.new_empty_string */
extern T0* T116f3(GE_context* ac, T0* C, T0* a1, T6 a2);
/* UC_UTF8_STRING.old_wipe_out */
extern void T267f68(GE_context* ac, T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T267f81(GE_context* ac, T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T267f68p1(GE_context* ac, T0* C);
/* STRING_8.wipe_out */
extern void T17f41(GE_context* ac, T0* C);
/* GEANT_STRING_INTERPRETER.string_ */
extern T0* T312f2(GE_context* ac, T0* C);
/* UC_UTF8_STRING.out */
extern T0* T267f19(GE_context* ac, T0* C);
/* UC_UTF8_STRING.unicode */
extern T0* T267f36(GE_context* ac, T0* C);
/* STRING_8.out */
extern T0* T17f4(GE_context* ac, T0* C);
/* XM_ELEMENT.attribute_by_name */
extern T0* T145f13(GE_context* ac, T0* C, T0* a1);
extern T1 T145f13ot1(T0* a1, T0** a2);
/* XM_ELEMENT.attribute_same_name */
extern T1 T145f14(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_STRING_INTERPRETER.set_variable_resolver */
extern void T312f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.set_variables */
extern void T100f19(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.project_variables_resolver */
extern T0* T33f41(GE_context* ac, T0* C);
/* GEANT_STRING_INTERPRETER.make */
extern T0* T312c7(GE_context* ac);
/* XM_ELEMENT.has_attribute_by_name */
extern T1 T145f12(GE_context* ac, T0* C, T0* a1);
extern T1 T145f12ot1(T0* a1, T0** a2);
/* GEANT_TARGET.dir_attribute_name */
extern T0* T33f44(GE_context* ac, T0* C);
/* GEANT_PROJECT.log */
extern void T29f50(GE_context* ac, T0* C, T0* a1);
/* KL_STDOUT_FILE.flush */
extern void T108f24(GE_context* ac, T0* C);
/* KL_STDOUT_FILE.old_flush */
extern void T108f25(GE_context* ac, T0* C);
/* KL_STDOUT_FILE.file_flush */
extern void T108f26(GE_context* ac, T0* C, T14 a1);
/* KL_STDOUT_FILE.put_new_line */
extern void T108f18(GE_context* ac, T0* C);
/* KL_STDOUT_FILE.put_string */
extern void T108f17(GE_context* ac, T0* C, T0* a1);
/* KL_STDOUT_FILE.old_put_string */
extern void T108f21(GE_context* ac, T0* C, T0* a1);
/* KL_STDOUT_FILE.console_ps */
extern void T108f23(GE_context* ac, T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STDOUT_FILE.string_ */
extern T0* T108f8(GE_context* ac, T0* C);
/* GEANT_PROJECT.target_name */
extern T0* T29f24(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].forth */
extern void T176f13(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_forth */
extern void T38f66(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].add_traversing_cursor */
extern void T38f71(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].set_next_cursor */
extern void T176f20(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].set_position */
extern void T176f18(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].remove_traversing_cursor */
extern void T38f70(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].set_after */
extern void T176f17(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].clashes_item */
extern T6 T38f35(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].go_after */
extern void T176f16(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_go_after */
extern void T38f76(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_off */
extern T1 T38f39(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].off */
extern T1 T176f10(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].key */
extern T0* T176f9(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_key */
extern T0* T38f37(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].key_storage_item */
extern T0* T38f22(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].item */
extern T0* T176f7(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_item */
extern T0* T38f36(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item_storage_item */
extern T0* T38f27(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].after */
extern T1 T176f5(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].start */
extern void T176f12(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_start */
extern void T38f65(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].is_empty */
extern T1 T38f38(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].new_cursor */
extern T0* T38f30(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].make */
extern T0* T176c11(GE_context* ac, T0* a1);
/* GEANT_TARGET.is_enabled */
extern T1 T33f43(GE_context* ac, T0* C);
/* GEANT_TARGET.unless_attribute_name */
extern T0* T33f54(GE_context* ac, T0* C);
/* GEANT_TARGET.if_attribute_name */
extern T0* T33f53(GE_context* ac, T0* C);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].force */
extern void T152f9(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES].force */
extern void T245f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_VARIABLES].fill_with */
extern void T244f9(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_VARIABLES].extend */
extern void T244f10(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].resize */
extern void T152f11(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES].aliased_resized_area */
extern T0* T245f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_VARIABLES].aliased_resized_area */
extern T0* T244f4(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].new_capacity */
extern T6 T152f7(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].extendible */
extern T1 T152f6(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.make */
extern T0* T36c46(GE_context* ac);
/* GEANT_VARIABLES.set_key_equality_tester */
extern void T36f50(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.make_map */
extern void T36f49(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.make_with_equality_testers */
extern void T36f58(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* GEANT_VARIABLES.make_sparse_container */
extern void T36f63(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.set_internal_cursor */
extern void T36f68(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.unset_found_item */
extern void T36f51(GE_context* ac, T0* C);
/* GEANT_VARIABLES.make_slots */
extern void T36f67(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.new_modulus */
extern T6 T36f22(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.make_clashes */
extern void T36f66(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.make_key_storage */
extern void T36f65(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].make */
extern T0* T104f2(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [STRING_8].make_empty */
extern void T39f7(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [STRING_8].make_empty */
extern T0* T39c7(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].default_create */
extern T0* T104c3(GE_context* ac);
/* GEANT_VARIABLES.make_item_storage */
extern void T36f64(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT.target_locals_stack */
extern T0* T29f23(GE_context* ac, T0* C);
/* GEANT_TARGET.final_target */
extern T0* T33f32(GE_context* ac, T0* C);
/* GEANT_PROJECT.current_target */
extern T0* T29f22(GE_context* ac, T0* C);
/* DS_ARRAYED_STACK [GEANT_TARGET].is_empty */
extern T1 T247f5(GE_context* ac, T0* C);
/* GEANT_PROJECT.trace_debug */
extern void T29f39(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].item */
extern T0* T247f6(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_VARIABLES.make */
extern T0* T41c46(GE_context* ac);
/* GEANT_ARGUMENT_VARIABLES.set_key_equality_tester */
extern void T41f49(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.make_map */
extern void T41f48(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_with_equality_testers */
extern void T41f57(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* GEANT_ARGUMENT_VARIABLES.make_sparse_container */
extern void T41f62(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.set_internal_cursor */
extern void T41f67(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.unset_found_item */
extern void T41f50(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_VARIABLES.make_slots */
extern void T41f66(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.new_modulus */
extern T6 T41f22(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_clashes */
extern void T41f65(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_key_storage */
extern void T41f64(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_item_storage */
extern void T41f63(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT.calculate_depend_order */
extern void T29f48(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.dependent_targets */
extern T0* T33f52(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].item */
extern T0* T111f21(GE_context* ac, T0* C, T6 a1);
/* GEANT_TARGET.show_dependent_targets */
extern void T33f84(GE_context* ac, T0* C, T0* a1);
/* KL_STDOUT_FILE.put_line */
extern void T108f15(GE_context* ac, T0* C, T0* a1);
/* KL_STANDARD_FILES.output */
extern unsigned char ge168os3413;
extern T0* ge168ov3413;
extern T0* T53f2(GE_context* ac, T0* C);
/* KL_STDOUT_FILE.make */
extern T0* T108c13(GE_context* ac);
/* KL_STDOUT_FILE.make_open_stdout */
extern void T108f16(GE_context* ac, T0* C, T0* a1);
/* KL_STDOUT_FILE.set_write_mode */
extern void T108f20(GE_context* ac, T0* C);
/* KL_STDOUT_FILE.console_def */
extern T14 T108f11(GE_context* ac, T0* C, T6 a1);
/* KL_STDOUT_FILE.make_with_name */
extern void T108f19(GE_context* ac, T0* C, T0* a1);
/* KL_STDOUT_FILE.default_pointer */
extern T14 T108f7(GE_context* ac, T0* C);
/* KL_STDOUT_FILE.set_name */
extern void T108f22(GE_context* ac, T0* C, T0* a1);
/* KL_STDOUT_FILE.buffered_file_info */
extern T0* T108f12(GE_context* ac, T0* C);
/* GEANT_TARGET.string_tokens */
extern T0* T33f25(GE_context* ac, T0* C, T0* a1, T2 a2);
/* DS_ARRAYED_LIST [detachable STRING_8].force_last */
extern void T111f26(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [STRING_8].force */
extern void T104f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [STRING_8].fill_with */
extern void T39f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].extend */
extern void T39f9(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].resize */
extern void T111f28(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].aliased_resized_area */
extern T0* T104f1(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].aliased_resized_area */
extern T0* T39f4(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [detachable STRING_8].new_capacity */
extern T6 T111f16(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [detachable STRING_8].extendible */
extern T1 T111f15(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.index_of */
extern T6 T267f20(GE_context* ac, T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.index_of_item_code */
extern T6 T267f37(GE_context* ac, T0* C, T6 a1, T6 a2);
/* STRING_8.index_of */
extern T6 T17f13(GE_context* ac, T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.keep_head */
extern void T267f63(GE_context* ac, T0* C, T6 a1);
/* STRING_8.keep_head */
extern void T17f56(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.keep_tail */
extern void T267f69(GE_context* ac, T0* C, T6 a1);
/* STRING_8.keep_tail */
extern void T17f55(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [detachable STRING_8].make */
extern T0* T111c22(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [detachable STRING_8].set_internal_cursor */
extern void T111f27(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].new_cursor */
extern T0* T111f9(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].make */
extern T0* T112c9(GE_context* ac, T0* a1);
/* GEANT_TARGET.dependencies */
extern T0* T33f60(GE_context* ac, T0* C);
/* GEANT_TARGET.depend_attribute_name */
extern unsigned char ge12os2877;
extern T0* ge12ov2877;
extern T0* T33f61(GE_context* ac, T0* C);
/* GEANT_TARGET.has_dependencies */
extern T1 T33f59(GE_context* ac, T0* C);
/* DS_ARRAYED_STACK [GEANT_TARGET].force */
extern void T247f10(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].force */
extern void T175f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_TARGET].fill_with */
extern void T172f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_TARGET].extend */
extern void T172f9(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].resize */
extern void T247f12(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].aliased_resized_area */
extern T0* T175f1(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_TARGET].aliased_resized_area */
extern T0* T172f4(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].new_capacity */
extern T6 T247f8(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].extendible */
extern T1 T247f7(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].make */
extern T0* T247c9(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].make */
extern T0* T175f2(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_TARGET].make_empty */
extern T0* T172c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].default_create */
extern T0* T175c3(GE_context* ac);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].force */
extern void T151f9(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].force */
extern void T243f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].fill_with */
extern void T242f9(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].extend */
extern void T242f10(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].resize */
extern void T151f11(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].aliased_resized_area */
extern T0* T243f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].aliased_resized_area */
extern T0* T242f4(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].new_capacity */
extern T6 T151f7(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].extendible */
extern T1 T151f6(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT.target_arguments_stack */
extern T0* T29f21(GE_context* ac, T0* C);
/* GEANT_PROJECT.trace */
extern void T29f31(GE_context* ac, T0* C, T0* a1);
/* GEANT.commandline_arguments */
extern unsigned char ge10os1957;
extern T0* ge10ov1957;
extern T0* T22f11(GE_context* ac, T0* C);
/* GEANT_PROJECT.start_target */
extern T0* T29f17(GE_context* ac, T0* C);
/* GEANT_PROJECT.exit_application */
extern void T29f43(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_PROJECT.exceptions */
extern T0* T29f19(GE_context* ac, T0* C);
/* GEANT_PROJECT.std */
extern T0* T29f18(GE_context* ac, T0* C);
/* GEANT_PROJECT.log_messages */
extern void T29f47(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT.preferred_start_target */
extern T0* T29f20(GE_context* ac, T0* C);
/* GEANT_PROJECT.default_target */
extern T0* T29f16(GE_context* ac, T0* C);
/* GEANT_PROJECT.show_target_info */
extern void T29f34(GE_context* ac, T0* C);
/* GEANT_PROJECT.set_start_target_name */
extern void T29f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.full_name */
extern T0* T33f29(GE_context* ac, T0* C);
/* GEANT_TARGET.is_exported_to_any */
extern T1 T33f30(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].has */
extern T1 T111f19(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.project_name_any */
extern unsigned char ge12os2880;
extern T0* ge12ov2880;
extern T0* T33f26(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item */
extern T0* T38f34(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].search_position */
extern void T38f47(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].hash_position */
extern T6 T38f24(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].slots_item */
extern T6 T38f25(GE_context* ac, T0* C, T6 a1);
/* GEANT.exit_application */
extern void T22f22(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT.exceptions */
extern T0* T22f14(GE_context* ac, T0* C);
/* GEANT.std */
extern T0* T22f13(GE_context* ac, T0* C);
/* GEANT.log_messages */
extern void T22f28(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.plus */
extern T0* T267f10(GE_context* ac, T0* C, T0* a1);
/* STRING_8.plus */
extern T0* T17f9(GE_context* ac, T0* C, T0* a1);
/* STRING_8.append_string_general */
extern void T17f47(GE_context* ac, T0* C, T0* a1);
/* STRING_8.append */
extern void T17f47p1(GE_context* ac, T0* C, T0* a1);
/* STRING_8.append_code */
extern void T17f49(GE_context* ac, T0* C, T10 a1);
/* STRING_8.new_string */
extern T0* T17f22(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].has */
extern T1 T38f33(GE_context* ac, T0* C, T0* a1);
/* INTEGER_32.is_greater */
extern T1 T6f1(GE_context* ac, T6* C, T6 a1);
/* GEANT_PROJECT.merge_in_parent_projects */
extern void T29f32(GE_context* ac, T0* C);
/* GEANT_TARGET.show_precursors */
extern void T33f77(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].to_array */
extern T0* T111f20(GE_context* ac, T0* C);
/* ARRAY [STRING_8].put */
extern void T40f12(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].after */
extern T1 T112f8(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].forth */
extern void T112f11(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].cursor_forth */
extern void T111f31(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].set_position */
extern void T112f13(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [detachable STRING_8].add_traversing_cursor */
extern void T111f35(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].set_next_cursor */
extern void T112f14(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].remove_traversing_cursor */
extern void T111f36(GE_context* ac, T0* C, T0* a1);
/* ARRAY [STRING_8].make_filled */
extern T0* T40c11(GE_context* ac, T0* a1, T6 a2, T6 a3);
/* ARRAY [STRING_8].make_filled_area */
extern void T40f13(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].make_filled */
extern T0* T39c6(GE_context* ac, T0* a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].item */
extern T0* T112f6(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].cursor_item */
extern T0* T111f11(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].start */
extern void T112f10(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].cursor_start */
extern void T111f30(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].set_after */
extern void T112f12(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].off */
extern T1 T112f4(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].before */
extern T1 T112f7(GE_context* ac, T0* C);
/* KL_ARRAY_ROUTINES [detachable STRING_8].make_empty_with_lower */
extern T0* T318f1(GE_context* ac, T0* C, T6 a1);
/* ARRAY [STRING_8].make_from_array */
extern T0* T40c18(GE_context* ac, T0* a1);
/* ARRAY [STRING_8].set_area */
extern void T40f16(GE_context* ac, T0* C, T0* a1);
/* KL_ARRAY [detachable STRING_8].new_rebase */
extern void T415f5(GE_context* ac, T0* C, T6 a1);
/* KL_ARRAY [detachable STRING_8].make_empty */
extern T0* T415c4(GE_context* ac);
/* KL_ARRAY [detachable STRING_8].make_empty_area */
extern void T415f6(GE_context* ac, T0* C, T6 a1);
/* ARRAY [STRING_8].make_empty */
extern T0* T40c17(GE_context* ac);
/* ARRAY [STRING_8].make_empty_area */
extern void T40f15(GE_context* ac, T0* C, T6 a1);
/* KL_ARRAY_ROUTINES [detachable STRING_8].default_create */
extern T0* T318c2(GE_context* ac);
/* DS_ARRAYED_LIST [detachable STRING_8].is_empty */
extern T1 T111f17(GE_context* ac, T0* C);
/* GEANT_INHERIT.apply_selects */
extern void T171f8(GE_context* ac, T0* C);
/* GEANT_INHERIT.check_targets_for_conflicts */
extern void T171f14(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].back */
extern void T176f15(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_back */
extern void T38f68(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].set_before */
extern void T176f19(GE_context* ac, T0* C);
/* GEANT_INHERIT.exit_application */
extern void T171f15(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_INHERIT.exceptions */
extern T0* T171f5(GE_context* ac, T0* C);
/* GEANT_INHERIT.std */
extern T0* T171f4(GE_context* ac, T0* C);
/* GEANT_INHERIT.log_messages */
extern void T171f16(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.conflicts_with */
extern T1 T33f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.seed */
extern T0* T33f40(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].before */
extern T1 T176f4(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].finish */
extern void T176f14(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_finish */
extern void T38f67(GE_context* ac, T0* C, T0* a1);
/* GEANT_INHERIT.sort_out_selected_targets */
extern void T171f13(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].remove */
extern void T38f64(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].remove_position */
extern void T38f69(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].key_storage_put */
extern void T38f53(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item_storage_put */
extern void T38f52(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].key_storage_keep_head */
extern void T38f75(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [STRING_8].keep_head */
extern void T39f10(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [STRING_8].set_count */
extern void T39f11(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item_storage_keep_head */
extern void T38f74(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].clashes_put */
extern void T38f50(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].slots_put */
extern void T38f51(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].move_cursors_forth */
extern void T38f73(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].internal_set_key_equality_tester */
extern void T38f72(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].unset_found_item */
extern void T38f48(GE_context* ac, T0* C);
/* GEANT_TARGET.set_redefining_target */
extern void T33f85(GE_context* ac, T0* C, T0* a1);
/* GEANT_INHERIT.validate_parent_selects */
extern void T171f12(GE_context* ac, T0* C);
/* GEANT_INHERIT.merge_in_parent_project */
extern void T171f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_INHERIT.merge_in_unchanged_targets */
extern void T171f11(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].force_last_new */
extern void T38f45(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].resize */
extern void T38f49(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].clashes_resize */
extern void T38f58(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].aliased_resized_area_with_default */
extern T0* T106f1(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].aliased_resized_area_with_default */
extern T0* T95f4(GE_context* ac, T0* C, T6 a1, T6 a2);
/* SPECIAL [INTEGER_32].aliased_resized_area */
extern T0* T95f5(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].special_integer_ */
extern unsigned char ge127os2705;
extern T0* ge127ov2705;
extern T0* T38f31(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].key_storage_resize */
extern void T38f57(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item_storage_resize */
extern void T38f56(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].slots_resize */
extern void T38f55(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].new_modulus */
extern T6 T38f23(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].new_capacity */
extern T6 T38f32(GE_context* ac, T0* C, T6 a1);
/* GEANT_INHERIT.string_ */
extern T0* T171f3(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].found_item */
extern T0* T38f28(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].found */
extern T1 T38f29(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].search */
extern void T38f44(GE_context* ac, T0* C, T0* a1);
/* GEANT_INHERIT.merge_in_renamed_targets */
extern void T171f10(GE_context* ac, T0* C, T0* a1);
/* GEANT_INHERIT.merge_in_redefined_targets */
extern void T171f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.set_precursor_target */
extern void T33f76(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.formal_arguments_match */
extern T1 T33f33(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].forth */
extern void T252f11(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_forth */
extern void T251f17(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].set_position */
extern void T252f13(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].add_traversing_cursor */
extern void T251f18(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].set_next_cursor */
extern void T252f14(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].remove_traversing_cursor */
extern void T251f19(GE_context* ac, T0* C, T0* a1);
/* GEANT_PARENT.prepare_project */
extern void T249f14(GE_context* ac, T0* C);
/* GEANT_PARENT.apply_selects */
extern void T249f19(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].forth */
extern void T501f11(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_forth */
extern void T403f57(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].add_traversing_cursor */
extern void T403f59(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].set_next_cursor */
extern void T501f14(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].set_position */
extern void T501f13(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].remove_traversing_cursor */
extern void T403f58(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].set_after */
extern void T501f12(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].clashes_item */
extern T6 T403f24(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].force_last */
extern void T38f77(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_PARENT.exit_application */
extern void T249f20(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_PARENT.exceptions */
extern T0* T249f11(GE_context* ac, T0* C);
/* GEANT_PARENT.std */
extern T0* T249f10(GE_context* ac, T0* C);
/* GEANT_PARENT.log_messages */
extern void T249f21(GE_context* ac, T0* C, T0* a1);
/* GEANT_SELECT.is_executable */
extern T1 T402f2(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].item */
extern T0* T501f5(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_item */
extern T0* T403f31(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].item_storage_item */
extern T0* T403f32(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].after */
extern T1 T501f7(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].start */
extern void T501f10(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_start */
extern void T403f56(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_off */
extern T1 T403f34(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].off */
extern T1 T501f8(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].is_empty */
extern T1 T403f33(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].new_cursor */
extern T0* T403f27(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].make */
extern T0* T501c9(GE_context* ac, T0* a1);
/* GEANT_PARENT.apply_undeclared_redefines */
extern void T249f18(GE_context* ac, T0* C);
/* GEANT_PARENT.apply_unchangeds */
extern void T249f17(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].has_item */
extern T1 T38f41(GE_context* ac, T0* C, T0* a1);
/* GEANT_PARENT.apply_redefines */
extern void T249f16(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].forth */
extern void T496f11(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_forth */
extern void T401f57(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].add_traversing_cursor */
extern void T401f59(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].set_next_cursor */
extern void T496f14(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].set_position */
extern void T496f13(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].remove_traversing_cursor */
extern void T401f58(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].set_after */
extern void T496f12(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].clashes_item */
extern T6 T401f24(GE_context* ac, T0* C, T6 a1);
/* GEANT_REDEFINE.is_executable */
extern T1 T400f2(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].item */
extern T0* T496f5(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_item */
extern T0* T401f31(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].item_storage_item */
extern T0* T401f32(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].after */
extern T1 T496f7(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].start */
extern void T496f10(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_start */
extern void T401f56(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_off */
extern T1 T401f34(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].off */
extern T1 T496f8(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].is_empty */
extern T1 T401f33(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].new_cursor */
extern T0* T401f27(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].make */
extern T0* T496c9(GE_context* ac, T0* a1);
/* GEANT_PARENT.apply_renames */
extern void T249f15(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].back */
extern void T491f11(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_back */
extern void T399f58(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].add_traversing_cursor */
extern void T399f60(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].set_next_cursor */
extern void T491f14(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].set_position */
extern void T491f13(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].remove_traversing_cursor */
extern void T399f59(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].set_before */
extern void T491f12(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].clashes_item */
extern T6 T399f25(GE_context* ac, T0* C, T6 a1);
/* GEANT_RENAME.is_executable */
extern T1 T398f3(GE_context* ac, T0* C);
/* GEANT_RENAME.string_ */
extern T0* T398f4(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].item */
extern T0* T491f5(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_item */
extern T0* T399f32(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].item_storage_item */
extern T0* T399f33(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].before */
extern T1 T491f7(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].finish */
extern void T491f10(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_finish */
extern void T399f57(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_off */
extern T1 T399f35(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].off */
extern T1 T491f8(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].is_empty */
extern T1 T399f34(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].new_cursor */
extern T0* T399f28(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].make */
extern T0* T491c9(GE_context* ac, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].item */
extern T0* T252f5(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_item */
extern T0* T251f9(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].after */
extern T1 T252f7(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].start */
extern void T252f10(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_start */
extern void T251f16(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].set_after */
extern void T252f12(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].is_empty */
extern T1 T251f10(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].off */
extern T1 T252f6(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].before */
extern T1 T252f8(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].new_cursor */
extern T0* T251f6(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].make */
extern T0* T252c9(GE_context* ac, T0* a1);
/* GEANT_PROJECT_LOADER.load */
extern void T30f10(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_LOADER.exit_application */
extern void T30f11(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_PROJECT_LOADER.exceptions */
extern T0* T30f6(GE_context* ac, T0* C);
/* GEANT_PROJECT_LOADER.log_messages */
extern void T30f12(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.absolute_pathname */
extern T0* T92f4(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.current_drive */
extern T0* T92f13(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_separator */
extern T1 T92f19(GE_context* ac, T0* C, T2 a1);
/* KL_WINDOWS_FILE_SYSTEM.pathname */
extern T0* T92f11(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.is_relative_pathname */
extern T1 T92f9(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_absolute_pathname */
extern T1 T92f8(GE_context* ac, T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.absolute_pathname */
extern T0* T93f4(GE_context* ac, T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.pathname */
extern T0* T93f11(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_UNIX_FILE_SYSTEM.is_absolute_pathname */
extern T1 T93f9(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.pathname_from_file_system */
extern T0* T92f3(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.pathname_to_string */
extern T0* T92f7(GE_context* ac, T0* C, T0* a1);
/* KL_PATHNAME.item */
extern T0* T133f8(GE_context* ac, T0* C, T6 a1);
/* KL_PATHNAME.is_parent */
extern T1 T133f7(GE_context* ac, T0* C, T6 a1);
/* KL_PATHNAME.is_current */
extern T1 T133f11(GE_context* ac, T0* C, T6 a1);
/* KL_WINDOWS_FILE_SYSTEM.root_directory */
extern unsigned char ge177os4742;
extern T0* ge177ov4742;
extern T0* T92f16(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.string_to_pathname */
extern T0* T93f5(GE_context* ac, T0* C, T0* a1);
/* KL_PATHNAME.append_name */
extern void T133f17(GE_context* ac, T0* C, T0* a1);
/* ARRAY [STRING_8].force */
extern void T40f14(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].move_data */
extern void T39f12(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].overlapping_move */
extern void T39f14(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].force */
extern void T39f15(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].non_overlapping_move */
extern void T39f13(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* ARRAY [STRING_8].capacity */
extern T6 T40f8(GE_context* ac, T0* C);
/* ARRAY [STRING_8].additional_space */
extern T6 T40f7(GE_context* ac, T0* C);
/* ARRAY [STRING_8].empty_area */
extern T1 T40f6(GE_context* ac, T0* C);
/* KL_PATHNAME.append_parent */
extern void T133f16(GE_context* ac, T0* C);
/* KL_PATHNAME.append_current */
extern void T133f15(GE_context* ac, T0* C);
/* KL_PATHNAME.set_relative */
extern void T133f14(GE_context* ac, T0* C, T1 a1);
/* KL_PATHNAME.make */
extern T0* T133c13(GE_context* ac);
/* KL_WINDOWS_FILE_SYSTEM.any_ */
extern T0* T92f6(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.pathname_from_file_system */
extern T0* T93f3(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_UNIX_FILE_SYSTEM.pathname_to_string */
extern T0* T93f8(GE_context* ac, T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.root_directory */
extern unsigned char ge174os4742;
extern T0* ge174ov4742;
extern T0* T93f17(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.any_ */
extern T0* T93f7(GE_context* ac, T0* C);
/* GEANT_PROJECT_LOADER.unix_file_system */
extern T0* T30f4(GE_context* ac, T0* C);
/* GEANT_PROJECT_LOADER.file_system */
extern T0* T30f3(GE_context* ac, T0* C);
/* GEANT_PROJECT_LOADER.windows_file_system */
extern T0* T30f8(GE_context* ac, T0* C);
/* GEANT_PROJECT_LOADER.operating_system */
extern T0* T30f7(GE_context* ac, T0* C);
/* KL_STDERR_FILE.put_character */
extern void T54f24(GE_context* ac, T0* C, T2 a1);
/* KL_STDERR_FILE.old_put_character */
extern void T54f25(GE_context* ac, T0* C, T2 a1);
/* KL_STDERR_FILE.console_pc */
extern void T54f26(GE_context* ac, T0* C, T14 a1, T2 a2);
/* GEANT_PROJECT_LOADER.std */
extern T0* T30f5(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.close */
extern void T97f63(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.old_close */
extern void T97f67(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.default_pointer */
extern T14 T97f27(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.file_close */
extern void T97f70(GE_context* ac, T0* C, T14 a1);
/* GEANT_PROJECT_PARSER.parse_file */
extern void T98f9(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.last_error_extended_description */
extern T0* T139f92(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.string_ */
extern T0* T139f89(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.last_error_description */
extern T0* T139f87(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.safe_error_component */
extern T0* T139f140(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_safe_error_character */
extern T1 T139f97(GE_context* ac, T0* C, T2 a1);
/* XM_EIFFEL_PARSER.position */
extern T0* T139f128(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [XM_POSITION].first */
extern T0* T186f6(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.positions */
extern T0* T139f93(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.new_positions */
extern T0* T139f122(GE_context* ac, T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].remove */
extern void T187f7(GE_context* ac, T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].item */
extern T0* T187f4(GE_context* ac, T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].is_empty */
extern T1 T187f3(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [XM_POSITION].force_last */
extern void T186f8(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [XM_POSITION].put_right */
extern void T284f5(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [XM_POSITION].attach_left */
extern void T284f6(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [XM_POSITION].make */
extern T0* T284c4(GE_context* ac, T0* a1);
/* DS_BILINKED_LIST [XM_POSITION].make */
extern T0* T186c7(GE_context* ac);
/* DS_BILINKED_LIST [XM_POSITION].set_internal_cursor */
extern void T186f9(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_POSITION].new_cursor */
extern T0* T186f5(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_POSITION].make */
extern T0* T285c3(GE_context* ac, T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].copy */
extern void T187f6(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_EIFFEL_SCANNER].put_right */
extern void T286f4(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_EIFFEL_SCANNER].make */
extern T0* T286c3(GE_context* ac, T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].make */
extern T0* T187c5(GE_context* ac);
/* KL_STDERR_FILE.flush */
extern void T54f27(GE_context* ac, T0* C);
/* KL_STDERR_FILE.old_flush */
extern void T54f28(GE_context* ac, T0* C);
/* KL_STDERR_FILE.file_flush */
extern void T54f29(GE_context* ac, T0* C, T14 a1);
/* XM_TREE_CALLBACKS_PIPE.last_error */
extern T0* T140f5(GE_context* ac, T0* C);
/* GEANT_PROJECT_PARSER.std */
extern T0* T98f7(GE_context* ac, T0* C);
/* GEANT_PROJECT.set_position_table */
extern void T29f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.make */
extern T0* T37c20(GE_context* ac, T0* a1, T0* a2, T0* a3, T0* a4);
/* GEANT_PROJECT_ELEMENT.load_parent_projects */
extern void T37f23(GE_context* ac, T0* C);
/* GEANT_INHERIT_ELEMENT.make */
extern T0* T170c11(GE_context* ac, T0* a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.exit_application */
extern void T170f13(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.exceptions */
extern T0* T170f8(GE_context* ac, T0* C);
/* GEANT_INHERIT_ELEMENT.std */
extern T0* T170f7(GE_context* ac, T0* C);
/* GEANT_INHERIT_ELEMENT.log_messages */
extern void T170f16(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].force_last */
extern void T251f13(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].force */
extern void T387f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_PARENT].fill_with */
extern void T388f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_PARENT].extend */
extern void T388f8(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].resize */
extern void T251f15(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].aliased_resized_area */
extern T0* T387f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_PARENT].aliased_resized_area */
extern T0* T388f4(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].new_capacity */
extern T6 T251f7(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].extendible */
extern T1 T251f8(GE_context* ac, T0* C, T6 a1);
/* GEANT_PARENT.is_executable */
extern T1 T249f9(GE_context* ac, T0* C);
/* GEANT_PARENT_ELEMENT.make */
extern T0* T276c22(GE_context* ac, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].force_last */
extern void T403f36(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].key_storage_put */
extern void T403f45(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].slots_put */
extern void T403f44(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].clashes_put */
extern void T403f43(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].slots_item */
extern T6 T403f30(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].hash_position */
extern T6 T403f23(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].resize */
extern void T403f42(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].clashes_resize */
extern void T403f50(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].special_integer_ */
extern T0* T403f28(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].key_storage_resize */
extern void T403f49(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].item_storage_resize */
extern void T403f48(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].aliased_resized_area */
extern T0* T499f1(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_SELECT].aliased_resized_area */
extern T0* T500f3(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].key_storage_item */
extern T0* T403f26(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].slots_resize */
extern void T403f47(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].new_modulus */
extern T6 T403f21(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].new_capacity */
extern T6 T403f22(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].item_storage_put */
extern void T403f41(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].force */
extern void T499f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_SELECT].fill_with */
extern void T500f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_SELECT].extend */
extern void T500f8(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].search_position */
extern void T403f40(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].unset_found_item */
extern void T403f39(GE_context* ac, T0* C);
/* GEANT_SELECT_ELEMENT.make */
extern T0* T397c9(GE_context* ac, T0* a1, T0* a2);
/* GEANT_SELECT.set_name */
extern void T402f4(GE_context* ac, T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.attribute_value */
extern T0* T397f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.project_variables_resolver */
extern T0* T397f8(GE_context* ac, T0* C);
/* GEANT_SELECT_ELEMENT.has_attribute */
extern T1 T397f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.target_attribute_name */
extern unsigned char ge100os10231;
extern T0* ge100ov10231;
extern T0* T397f5(GE_context* ac, T0* C);
/* GEANT_SELECT.make */
extern T0* T402c3(GE_context* ac);
/* GEANT_SELECT_ELEMENT.interpreting_element_make */
extern void T397f10(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_SELECT_ELEMENT.set_project */
extern void T397f12(GE_context* ac, T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.element_make */
extern void T397f11(GE_context* ac, T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.set_xml_element */
extern void T397f13(GE_context* ac, T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.select_element_name */
extern unsigned char ge92os9196;
extern T0* ge92ov9196;
extern T0* T276f11(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].force_last */
extern void T401f36(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].key_storage_put */
extern void T401f45(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].slots_put */
extern void T401f44(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].clashes_put */
extern void T401f43(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].slots_item */
extern T6 T401f30(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].hash_position */
extern T6 T401f23(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].resize */
extern void T401f42(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].clashes_resize */
extern void T401f50(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].special_integer_ */
extern T0* T401f28(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].key_storage_resize */
extern void T401f49(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].item_storage_resize */
extern void T401f48(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].aliased_resized_area */
extern T0* T494f1(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_REDEFINE].aliased_resized_area */
extern T0* T495f3(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].key_storage_item */
extern T0* T401f26(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].slots_resize */
extern void T401f47(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].new_modulus */
extern T6 T401f21(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].new_capacity */
extern T6 T401f22(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].item_storage_put */
extern void T401f41(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].force */
extern void T494f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_REDEFINE].fill_with */
extern void T495f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_REDEFINE].extend */
extern void T495f8(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].search_position */
extern void T401f40(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].unset_found_item */
extern void T401f39(GE_context* ac, T0* C);
/* GEANT_REDEFINE_ELEMENT.make */
extern T0* T396c9(GE_context* ac, T0* a1, T0* a2);
/* GEANT_REDEFINE.set_name */
extern void T400f4(GE_context* ac, T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.attribute_value */
extern T0* T396f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.project_variables_resolver */
extern T0* T396f8(GE_context* ac, T0* C);
/* GEANT_REDEFINE_ELEMENT.has_attribute */
extern T1 T396f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.target_attribute_name */
extern unsigned char ge96os10227;
extern T0* ge96ov10227;
extern T0* T396f5(GE_context* ac, T0* C);
/* GEANT_REDEFINE.make */
extern T0* T400c3(GE_context* ac);
/* GEANT_REDEFINE_ELEMENT.interpreting_element_make */
extern void T396f10(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_REDEFINE_ELEMENT.set_project */
extern void T396f12(GE_context* ac, T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.element_make */
extern void T396f11(GE_context* ac, T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.set_xml_element */
extern void T396f13(GE_context* ac, T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.redefine_element_name */
extern unsigned char ge92os9195;
extern T0* ge92ov9195;
extern T0* T276f10(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].force_last */
extern void T399f37(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].key_storage_put */
extern void T399f46(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].slots_put */
extern void T399f45(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].clashes_put */
extern void T399f44(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].slots_item */
extern T6 T399f24(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].hash_position */
extern T6 T399f21(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].resize */
extern void T399f43(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].clashes_resize */
extern void T399f51(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].special_integer_ */
extern T0* T399f29(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].key_storage_resize */
extern void T399f50(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].item_storage_resize */
extern void T399f49(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].aliased_resized_area */
extern T0* T489f1(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_RENAME].aliased_resized_area */
extern T0* T490f3(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].key_storage_item */
extern T0* T399f27(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].slots_resize */
extern void T399f48(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].new_modulus */
extern T6 T399f22(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].new_capacity */
extern T6 T399f31(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].item_storage_put */
extern void T399f42(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].force */
extern void T489f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_RENAME].fill_with */
extern void T490f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_RENAME].extend */
extern void T490f8(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].search_position */
extern void T399f39(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].unset_found_item */
extern void T399f41(GE_context* ac, T0* C);
/* GEANT_PARENT_ELEMENT.exit_application */
extern void T276f24(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_PARENT_ELEMENT.exceptions */
extern T0* T276f15(GE_context* ac, T0* C);
/* GEANT_PARENT_ELEMENT.std */
extern T0* T276f14(GE_context* ac, T0* C);
/* GEANT_PARENT_ELEMENT.log_messages */
extern void T276f27(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].put_last */
extern void T111f32(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].has */
extern T1 T399f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.make */
extern T0* T395c10(GE_context* ac, T0* a1, T0* a2);
/* GEANT_RENAME.set_new_name */
extern void T398f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.as_attribute_name */
extern unsigned char ge98os10223;
extern T0* ge98ov10223;
extern T0* T395f5(GE_context* ac, T0* C);
/* GEANT_RENAME.set_original_name */
extern void T398f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.attribute_value */
extern T0* T395f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.project_variables_resolver */
extern T0* T395f9(GE_context* ac, T0* C);
/* GEANT_RENAME_ELEMENT.has_attribute */
extern T1 T395f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.target_attribute_name */
extern unsigned char ge98os10222;
extern T0* ge98ov10222;
extern T0* T395f6(GE_context* ac, T0* C);
/* GEANT_RENAME.make */
extern T0* T398c5(GE_context* ac);
/* GEANT_RENAME_ELEMENT.interpreting_element_make */
extern void T395f11(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_RENAME_ELEMENT.set_project */
extern void T395f13(GE_context* ac, T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.element_make */
extern void T395f12(GE_context* ac, T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.set_xml_element */
extern void T395f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.elements_by_name */
extern T0* T276f9(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].force_last */
extern void T168f8(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_ELEMENT].put_right */
extern void T275f4(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_ELEMENT].make */
extern T0* T275c3(GE_context* ac, T0* a1);
/* GEANT_PARENT_ELEMENT.string_ */
extern T0* T276f19(GE_context* ac, T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].make */
extern T0* T168c7(GE_context* ac);
/* DS_LINKED_LIST [XM_ELEMENT].set_internal_cursor */
extern void T168f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.rename_element_name */
extern unsigned char ge92os9194;
extern T0* ge92ov9194;
extern T0* T276f8(GE_context* ac, T0* C);
/* GEANT_PARENT.set_parent_project */
extern void T249f13(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.value */
extern T0* T32f47(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.item */
extern T0* T32f50(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.item_storage_item */
extern T0* T32f48(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.search_position */
extern void T32f65(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.hash_position */
extern T6 T32f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.key_storage_item */
extern T0* T32f28(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.clashes_item */
extern T6 T32f21(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.slots_item */
extern T6 T32f22(GE_context* ac, T0* C, T6 a1);
/* KL_UNIX_FILE_SYSTEM.is_relative_pathname */
extern T1 T93f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.file_system */
extern T0* T276f7(GE_context* ac, T0* C);
/* GEANT_PARENT_ELEMENT.unix_file_system */
extern T0* T276f18(GE_context* ac, T0* C);
/* GEANT_PARENT_ELEMENT.windows_file_system */
extern T0* T276f17(GE_context* ac, T0* C);
/* GEANT_PARENT_ELEMENT.operating_system */
extern T0* T276f16(GE_context* ac, T0* C);
/* GEANT_PARENT_ELEMENT.attribute_value */
extern T0* T276f12(GE_context* ac, T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.project_variables_resolver */
extern T0* T276f20(GE_context* ac, T0* C);
/* GEANT_PARENT_ELEMENT.has_attribute */
extern T1 T276f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.location_attribute_name */
extern unsigned char ge92os9192;
extern T0* ge92ov9192;
extern T0* T276f5(GE_context* ac, T0* C);
/* GEANT_PARENT.make */
extern T0* T249c12(GE_context* ac, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].set_key_equality_tester */
extern void T403f37(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_map_equal */
extern T0* T403c35(GE_context* ac, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_with_equality_testers */
extern void T403f38(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_sparse_container */
extern void T403f46(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].set_internal_cursor */
extern void T403f55(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_slots */
extern void T403f54(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_clashes */
extern void T403f53(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_key_storage */
extern void T403f52(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_item_storage */
extern void T403f51(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].make */
extern T0* T499f2(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_SELECT].make_empty */
extern T0* T500c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].default_create */
extern T0* T499c3(GE_context* ac);
/* detachable KL_EQUALITY_TESTER [GEANT_SELECT].default_create */
extern T0* T497c1(GE_context* ac);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].set_key_equality_tester */
extern void T401f37(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_map_equal */
extern T0* T401c35(GE_context* ac, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_with_equality_testers */
extern void T401f38(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_sparse_container */
extern void T401f46(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].set_internal_cursor */
extern void T401f55(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_slots */
extern void T401f54(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_clashes */
extern void T401f53(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_key_storage */
extern void T401f52(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_item_storage */
extern void T401f51(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].make */
extern T0* T494f2(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_REDEFINE].make_empty */
extern T0* T495c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].default_create */
extern T0* T494c3(GE_context* ac);
/* detachable KL_EQUALITY_TESTER [GEANT_REDEFINE].default_create */
extern T0* T492c1(GE_context* ac);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].set_key_equality_tester */
extern void T399f38(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_map_equal */
extern T0* T399c36(GE_context* ac, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_with_equality_testers */
extern void T399f40(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_sparse_container */
extern void T399f47(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].set_internal_cursor */
extern void T399f56(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_slots */
extern void T399f55(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_clashes */
extern void T399f54(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_key_storage */
extern void T399f53(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_item_storage */
extern void T399f52(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].make */
extern T0* T489f2(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_RENAME].make_empty */
extern T0* T490c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].default_create */
extern T0* T489c3(GE_context* ac);
/* detachable KL_EQUALITY_TESTER [GEANT_RENAME].default_create */
extern T0* T487c1(GE_context* ac);
/* GEANT_PARENT_ELEMENT.interpreting_element_make */
extern void T276f23(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.set_project */
extern void T276f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.element_make */
extern void T276f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.set_xml_element */
extern void T276f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.elements_by_name */
extern T0* T170f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.string_ */
extern T0* T170f9(GE_context* ac, T0* C);
/* GEANT_INHERIT_ELEMENT.parent_element_name */
extern unsigned char ge85os7662;
extern T0* ge85ov7662;
extern T0* T170f5(GE_context* ac, T0* C);
/* GEANT_INHERIT.make */
extern T0* T171c6(GE_context* ac, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].make */
extern T0* T251c12(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].set_internal_cursor */
extern void T251f14(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].make */
extern T0* T387f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_PARENT].make_empty */
extern T0* T388c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].default_create */
extern T0* T387c3(GE_context* ac);
/* GEANT_INHERIT_ELEMENT.interpreting_element_make */
extern void T170f12(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.set_project */
extern void T170f15(GE_context* ac, T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.element_make */
extern void T170f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.set_xml_element */
extern void T170f17(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.inherit_element_name */
extern unsigned char ge93os3056;
extern T0* ge93ov3056;
extern T0* T37f16(GE_context* ac, T0* C);
/* GEANT_PROJECT.set_inherit_clause */
extern void T29f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.make_old */
extern T0* T170c10(GE_context* ac, T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.make_old */
extern T0* T276c21(GE_context* ac, T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.inherit_attribute_name */
extern unsigned char ge92os9193;
extern T0* ge92ov9193;
extern T0* T276f13(GE_context* ac, T0* C);
/* GEANT_PROJECT.set_old_inherit */
extern void T29f41(GE_context* ac, T0* C, T1 a1);
/* GEANT_PROJECT_ELEMENT.has_inherit_element */
extern T1 T37f15(GE_context* ac, T0* C);
/* GEANT_PROJECT_ELEMENT.inherit_attribute_name */
extern unsigned char ge93os3055;
extern T0* ge93ov3055;
extern T0* T37f14(GE_context* ac, T0* C);
/* GEANT_PROJECT.set_targets */
extern void T29f40(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].forth */
extern void T169f10(GE_context* ac, T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_forth */
extern void T168f11(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].add_traversing_cursor */
extern void T168f12(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].set_next_cursor */
extern void T169f12(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].remove_traversing_cursor */
extern void T168f13(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].set */
extern void T169f11(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* GEANT_TARGET.make */
extern T0* T33c63(GE_context* ac, T0* a1, T0* a2);
/* GEANT_TARGET.initialize */
extern void T33f64(GE_context* ac, T0* C);
/* GEANT_TARGET.initialize */
extern void T33f64p1(GE_context* ac, T0* C);
/* GEANT_TARGET.set_description */
extern void T33f72(GE_context* ac, T0* C, T0* a1);
/* GEANT_GLOBAL_ELEMENT.name */
extern T0* T256f2(GE_context* ac, T0* C);
/* GEANT_GLOBAL_ELEMENT.attribute_value */
extern T0* T256f5(GE_context* ac, T0* C, T0* a1);
/* GEANT_GLOBAL_ELEMENT.name_attribute_name */
extern unsigned char ge90os8912;
extern T0* ge90ov8912;
extern T0* T256f3(GE_context* ac, T0* C);
/* GEANT_GLOBAL_ELEMENT.has_name */
extern T1 T256f6(GE_context* ac, T0* C);
/* GEANT_GLOBAL_ELEMENT.has_attribute */
extern T1 T256f4(GE_context* ac, T0* C, T0* a1);
/* GEANT_GLOBAL_ELEMENT.make */
extern T0* T256c7(GE_context* ac, T0* a1);
/* GEANT_GLOBAL_ELEMENT.set_xml_element */
extern void T256f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_LOCAL_ELEMENT.name */
extern T0* T255f2(GE_context* ac, T0* C);
/* GEANT_LOCAL_ELEMENT.attribute_value */
extern T0* T255f5(GE_context* ac, T0* C, T0* a1);
/* GEANT_LOCAL_ELEMENT.name_attribute_name */
extern T0* T255f3(GE_context* ac, T0* C);
/* GEANT_LOCAL_ELEMENT.has_name */
extern T1 T255f6(GE_context* ac, T0* C);
/* GEANT_LOCAL_ELEMENT.has_attribute */
extern T1 T255f4(GE_context* ac, T0* C, T0* a1);
/* GEANT_LOCAL_ELEMENT.make */
extern T0* T255c7(GE_context* ac, T0* a1);
/* GEANT_LOCAL_ELEMENT.set_xml_element */
extern void T255f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.empty_variables */
extern unsigned char ge10os1958;
extern T0* ge10ov1958;
extern T0* T33f18(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_ELEMENT.name */
extern T0* T254f2(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_ELEMENT.attribute_value */
extern T0* T254f5(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_ELEMENT.name_attribute_name */
extern T0* T254f3(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_ELEMENT.has_name */
extern T1 T254f6(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_ELEMENT.has_attribute */
extern T1 T254f4(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_ELEMENT.make */
extern T0* T254c7(GE_context* ac, T0* a1);
/* GEANT_ARGUMENT_ELEMENT.set_xml_element */
extern void T254f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.elements_by_name */
extern T0* T33f16(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.empty_argument_variables */
extern unsigned char ge10os1959;
extern T0* ge10ov1959;
extern T0* T33f42(GE_context* ac, T0* C);
/* GEANT_TARGET.set_execute_once */
extern void T33f71(GE_context* ac, T0* C, T1 a1);
/* GEANT_TARGET.boolean_value */
extern T1 T33f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.false_attribute_value */
extern unsigned char ge78os2925;
extern T0* ge78ov2925;
extern T0* T33f38(GE_context* ac, T0* C);
/* GEANT_TARGET.true_attribute_value */
extern unsigned char ge78os2924;
extern T0* ge78ov2924;
extern T0* T33f37(GE_context* ac, T0* C);
/* GEANT_TARGET.attribute_value */
extern T0* T33f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.once_attribute_name */
extern unsigned char ge12os2879;
extern T0* ge12ov2879;
extern T0* T33f27(GE_context* ac, T0* C);
/* GEANT_TARGET.set_exports */
extern void T33f70(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].set_equality_tester */
extern void T111f37(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].put */
extern void T111f29(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [detachable STRING_8].move_cursors_right */
extern void T111f34(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [detachable STRING_8].move_right */
extern void T111f33(GE_context* ac, T0* C, T6 a1, T6 a2);
/* GEANT_TARGET.export_attribute_name */
extern unsigned char ge12os2878;
extern T0* ge12ov2878;
extern T0* T33f20(GE_context* ac, T0* C);
/* GEANT_TARGET.set_obsolete_message */
extern void T33f69(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.set_name */
extern void T33f68(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.name_attribute_name */
extern unsigned char ge12os2875;
extern T0* ge12ov2875;
extern T0* T33f39(GE_context* ac, T0* C);
/* GEANT_TARGET.make */
extern void T33f63p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_TARGET.set_project */
extern void T33f66(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.element_make */
extern void T33f65(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.set_xml_element */
extern void T33f73(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].item */
extern T0* T169f6(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].start */
extern void T169f9(GE_context* ac, T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_start */
extern void T168f10(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_off */
extern T1 T168f6(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].off */
extern T1 T169f7(GE_context* ac, T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].new_cursor */
extern T0* T168f5(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].make */
extern T0* T169c8(GE_context* ac, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].set_key_equality_tester */
extern void T38f43(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_map */
extern T0* T38c42(GE_context* ac, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_with_equality_testers */
extern void T38f46(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_sparse_container */
extern void T38f54(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].set_internal_cursor */
extern void T38f63(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_slots */
extern void T38f62(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_clashes */
extern void T38f61(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_key_storage */
extern void T38f60(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_item_storage */
extern void T38f59(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_ELEMENT.elements_by_name */
extern T0* T37f11(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.string_ */
extern T0* T37f19(GE_context* ac, T0* C);
/* GEANT_PROJECT_ELEMENT.target_element_name */
extern unsigned char ge93os3058;
extern T0* ge93ov3058;
extern T0* T37f10(GE_context* ac, T0* C);
/* GEANT_PROJECT.set_default_target_name */
extern void T29f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.default_attribute_name */
extern unsigned char ge93os3054;
extern T0* ge93ov3054;
extern T0* T37f9(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.basename */
extern T0* T92f24(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_root_directory */
extern T1 T92f25(GE_context* ac, T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.basename */
extern T0* T93f21(GE_context* ac, T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.is_root_directory */
extern T1 T93f22(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.dirname */
extern T0* T92f23(GE_context* ac, T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.dirname */
extern T0* T93f20(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.unix_file_system */
extern T0* T37f8(GE_context* ac, T0* C);
/* GEANT_PROJECT_ELEMENT.file_system */
extern T0* T37f7(GE_context* ac, T0* C);
/* GEANT_PROJECT_ELEMENT.windows_file_system */
extern T0* T37f18(GE_context* ac, T0* C);
/* GEANT_PROJECT_ELEMENT.operating_system */
extern T0* T37f17(GE_context* ac, T0* C);
/* GEANT_PROJECT.set_description */
extern void T29f37(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.has_element_by_name */
extern T1 T145f10(GE_context* ac, T0* C, T0* a1);
extern T1 T145f10ot1(T0* a1, T0** a2);
/* GEANT_PROJECT_ELEMENT.description_element_name */
extern T0* T37f6(GE_context* ac, T0* C);
/* GEANT_PROJECT_ELEMENT.attribute_value */
extern T0* T37f4(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.exit_application */
extern void T37f22(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_PROJECT_ELEMENT.exceptions */
extern T0* T37f13(GE_context* ac, T0* C);
/* GEANT_PROJECT_ELEMENT.std */
extern T0* T37f12(GE_context* ac, T0* C);
/* GEANT_PROJECT_ELEMENT.log_messages */
extern void T37f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.has_attribute */
extern T1 T37f3(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.name_attribute_name */
extern unsigned char ge93os3053;
extern T0* ge93ov3053;
extern T0* T37f5(GE_context* ac, T0* C);
/* GEANT_PROJECT.make */
extern T0* T29c30(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* GEANT_TASK_FACTORY.make */
extern T0* T248c55(GE_context* ac, T0* a1);
/* GEANT_TASK_FACTORY.create_builders */
extern void T248f56(GE_context* ac, T0* C);
/* Creation of agent #1 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac1(T0* a1);
/* Creation of agent #2 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac2(T0* a1);
/* Creation of agent #3 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac3(T0* a1);
/* Creation of agent #4 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac4(T0* a1);
/* Creation of agent #5 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac5(T0* a1);
/* Creation of agent #6 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac6(T0* a1);
/* Creation of agent #7 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac7(T0* a1);
/* Creation of agent #8 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac8(T0* a1);
/* Creation of agent #9 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac9(T0* a1);
/* Creation of agent #10 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac10(T0* a1);
/* Creation of agent #11 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac11(T0* a1);
/* Creation of agent #12 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac12(T0* a1);
/* Creation of agent #13 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac13(T0* a1);
/* Creation of agent #14 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac14(T0* a1);
/* Creation of agent #15 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac15(T0* a1);
/* Creation of agent #16 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac16(T0* a1);
/* Creation of agent #17 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac17(T0* a1);
/* Creation of agent #18 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac18(T0* a1);
/* Creation of agent #19 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac19(T0* a1);
/* Creation of agent #20 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac20(T0* a1);
/* Creation of agent #21 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac21(T0* a1);
/* Creation of agent #22 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac22(T0* a1);
/* Creation of agent #23 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac23(T0* a1);
/* Creation of agent #24 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac24(T0* a1);
/* Creation of agent #25 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac25(T0* a1);
/* GEANT_TASK_FACTORY.new_replace_task */
extern T0* T248f52(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.make */
extern T0* T385c31(GE_context* ac, T0* a1, T0* a2);
/* GEANT_REPLACE_COMMAND.set_fileset */
extern void T482f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.make */
extern T0* T427c29(GE_context* ac, T0* a1, T0* a2);
/* GEANT_FILESET.set_map */
extern void T433f47(GE_context* ac, T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.make */
extern T0* T512c12(GE_context* ac, T0* a1, T0* a2);
/* GEANT_MAP.set_map */
extern void T513f21(GE_context* ac, T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.map_element_name */
extern unsigned char ge89os10640;
extern T0* ge89ov10640;
extern T0* T512f9(GE_context* ac, T0* C);
/* GEANT_MAP.set_target_pattern */
extern void T513f20(GE_context* ac, T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.to_attribute_name */
extern unsigned char ge89os10639;
extern T0* ge89ov10639;
extern T0* T512f7(GE_context* ac, T0* C);
/* GEANT_MAP.set_source_pattern */
extern void T513f19(GE_context* ac, T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.from_attribute_name */
extern unsigned char ge89os10638;
extern T0* ge89ov10638;
extern T0* T512f6(GE_context* ac, T0* C);
/* GEANT_MAP.set_type */
extern void T513f18(GE_context* ac, T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.attribute_value */
extern T0* T512f5(GE_context* ac, T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.project_variables_resolver */
extern T0* T512f11(GE_context* ac, T0* C);
/* GEANT_MAP_ELEMENT.has_attribute */
extern T1 T512f10(GE_context* ac, T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.type_attribute_name */
extern unsigned char ge89os10637;
extern T0* ge89ov10637;
extern T0* T512f8(GE_context* ac, T0* C);
/* GEANT_MAP.make */
extern T0* T513c17(GE_context* ac, T0* a1);
/* GEANT_MAP.type_attribute_value_identity */
extern unsigned char ge88os10653;
extern T0* ge88ov10653;
extern T0* T513f13(GE_context* ac, T0* C);
/* GEANT_MAP_ELEMENT.make */
extern void T512f12p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_MAP_ELEMENT.set_project */
extern void T512f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.element_make */
extern void T512f13(GE_context* ac, T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.set_xml_element */
extern void T512f15(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.map_element_name */
extern unsigned char ge81os10491;
extern T0* ge81ov10491;
extern T0* T427f21(GE_context* ac, T0* C);
/* GEANT_FILESET.add_single_exclude */
extern void T433f46(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].force_last */
extern void T518f34(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].slots_put */
extern void T518f45(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING_8].clashes_put */
extern void T518f44(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING_8].slots_item */
extern T6 T518f19(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].hash_position */
extern T6 T518f17(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].resize */
extern void T518f43(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].clashes_resize */
extern void T518f49(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].special_integer_ */
extern T0* T518f26(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].key_storage_resize */
extern void T518f48(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_resize */
extern void T518f47(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].key_storage_item */
extern T0* T518f25(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_item */
extern T0* T518f28(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].clashes_item */
extern T6 T518f23(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].slots_resize */
extern void T518f46(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].new_modulus */
extern T6 T518f18(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].new_capacity */
extern T6 T518f27(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_put */
extern void T518f42(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [STRING_8].search_position */
extern void T518f41(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].key_equality_tester */
extern T0* T518f22(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].unset_found_item */
extern void T518f39(GE_context* ac, T0* C);
/* GEANT_FILESET_ELEMENT.exclude_element_name */
extern unsigned char ge81os10490;
extern T0* ge81ov10490;
extern T0* T427f19(GE_context* ac, T0* C);
/* GEANT_FILESET.add_single_include */
extern void T433f45(GE_context* ac, T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.name */
extern T0* T441f4(GE_context* ac, T0* C);
/* GEANT_DEFINE_ELEMENT.attribute_value */
extern T0* T441f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.project_variables_resolver */
extern T0* T441f6(GE_context* ac, T0* C);
/* GEANT_DEFINE_ELEMENT.name_attribute_name */
extern T0* T441f13(GE_context* ac, T0* C);
/* GEANT_DEFINE_ELEMENT.has_name */
extern T1 T441f10(GE_context* ac, T0* C);
/* GEANT_DEFINE_ELEMENT.has_attribute */
extern T1 T441f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.is_enabled */
extern T1 T441f7(GE_context* ac, T0* C);
/* GEANT_DEFINE_ELEMENT.unless_attribute_name */
extern T0* T441f11(GE_context* ac, T0* C);
/* GEANT_DEFINE_ELEMENT.if_attribute_name */
extern T0* T441f8(GE_context* ac, T0* C);
/* GEANT_DEFINE_ELEMENT.make */
extern T0* T441c16(GE_context* ac, T0* a1, T0* a2);
/* GEANT_DEFINE_ELEMENT.set_project */
extern void T441f18(GE_context* ac, T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.element_make */
extern void T441f17(GE_context* ac, T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.set_xml_element */
extern void T441f19(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.elements_by_name */
extern T0* T427f18(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.string_ */
extern T0* T427f26(GE_context* ac, T0* C);
/* GEANT_FILESET_ELEMENT.include_element_name */
extern unsigned char ge81os10489;
extern T0* ge81ov10489;
extern T0* T427f17(GE_context* ac, T0* C);
/* GEANT_FILESET.set_convert_to_filesystem */
extern void T433f44(GE_context* ac, T0* C, T1 a1);
/* GEANT_FILESET_ELEMENT.convert_attribute_name */
extern unsigned char ge81os10487;
extern T0* ge81ov10487;
extern T0* T427f16(GE_context* ac, T0* C);
/* GEANT_FILESET.set_mapped_filename_directory_name */
extern void T433f43(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET.set_filename_directory_name */
extern void T433f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET.set_mapped_filename_variable_name */
extern void T433f41(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.mapped_filename_variable_name_attribute_name */
extern unsigned char ge81os10485;
extern T0* ge81ov10485;
extern T0* T427f15(GE_context* ac, T0* C);
/* GEANT_FILESET.set_filename_variable_name */
extern void T433f40(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.filename_variable_name_attribute_name */
extern unsigned char ge81os10484;
extern T0* ge81ov10484;
extern T0* T427f14(GE_context* ac, T0* C);
/* GEANT_FILESET.set_concat */
extern void T433f39(GE_context* ac, T0* C, T1 a1);
/* GEANT_FILESET.set_force */
extern void T433f38(GE_context* ac, T0* C, T1 a1);
/* GEANT_FILESET_ELEMENT.boolean_value */
extern T1 T427f13(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.std */
extern T0* T427f23(GE_context* ac, T0* C);
/* GEANT_FILESET_ELEMENT.false_attribute_value */
extern T0* T427f28(GE_context* ac, T0* C);
/* GEANT_FILESET_ELEMENT.true_attribute_value */
extern T0* T427f27(GE_context* ac, T0* C);
/* GEANT_FILESET_ELEMENT.force_attribute_name */
extern unsigned char ge81os10482;
extern T0* ge81ov10482;
extern T0* T427f12(GE_context* ac, T0* C);
/* GEANT_FILESET.set_exclude_wc_string */
extern void T433f37(GE_context* ac, T0* C, T0* a1);
/* LX_DFA_WILDCARD.is_compiled */
extern T1 T520f13(GE_context* ac, T0* C);
/* LX_DFA_WILDCARD.compile */
extern T0* T520c16(GE_context* ac, T0* a1, T1 a2);
/* LX_FULL_DFA.make */
extern T0* T561c37(GE_context* ac, T0* a1);
/* LX_FULL_DFA.build */
extern void T561f40(GE_context* ac, T0* C);
/* LX_FULL_DFA.build_accept_table */
extern void T561f46(GE_context* ac, T0* C);
/* ARRAY [INTEGER_32].put */
extern void T265f11(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [LX_RULE].first */
extern T0* T574f6(GE_context* ac, T0* C);
/* ARRAY [INTEGER_32].make_filled */
extern T0* T265c9(GE_context* ac, T6 a1, T6 a2, T6 a3);
/* ARRAY [INTEGER_32].make_filled_area */
extern void T265f10(GE_context* ac, T0* C, T6 a1, T6 a2);
/* LX_FULL_DFA.build_nxt_table */
extern void T561f45(GE_context* ac, T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].target */
extern T0* T605f6(GE_context* ac, T0* C, T6 a1);
/* ARRAY [detachable LX_DFA_STATE].item */
extern T0* T652f4(GE_context* ac, T0* C, T6 a1);
/* LX_DFA_STATE.is_accepting */
extern T1 T599f10(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [LX_RULE].is_empty */
extern T1 T574f11(GE_context* ac, T0* C);
/* LX_FULL_DFA.build_transitions */
extern void T561f44(GE_context* ac, T0* C, T0* a1);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].set_target */
extern void T605f8(GE_context* ac, T0* C, T0* a1, T6 a2);
/* ARRAY [detachable LX_DFA_STATE].put */
extern void T652f7(GE_context* ac, T0* C, T0* a1, T6 a2);
/* LX_SYMBOL_PARTITIONS.previous_symbol */
extern T6 T602f4(GE_context* ac, T0* C, T6 a1);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].item */
extern T0* T636f4(GE_context* ac, T0* C, T6 a1);
/* LX_FULL_DFA.new_state */
extern T0* T561f36(GE_context* ac, T0* C, T0* a1);
/* LX_DFA_STATE.set_id */
extern void T599f17(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].put_last */
extern void T601f9(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].force */
extern void T649f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [LX_DFA_STATE].fill_with */
extern void T648f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [LX_DFA_STATE].extend */
extern void T648f9(GE_context* ac, T0* C, T0* a1);
/* LX_DFA_STATE.is_equal */
extern T1 T599f11(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].is_equal */
extern T1 T600f16(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].any_ */
extern T0* T600f17(GE_context* ac, T0* C);
/* LX_DFA_STATE.any_ */
extern T0* T599f14(GE_context* ac, T0* C);
/* LX_DFA_STATE.new_state */
extern T0* T599f9(GE_context* ac, T0* C, T6 a1);
/* LX_DFA_STATE.make */
extern T0* T599c16(GE_context* ac, T0* a1, T6 a2, T6 a3);
extern T1 T599f16ot1(T0* a1, T0** a2);
/* LX_RULE.set_useful */
extern void T586f22(GE_context* ac, T0* C, T1 a1);
/* DS_ARRAYED_LIST [LX_RULE].sort */
extern void T574f17(GE_context* ac, T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_RULE].sort */
extern void T641f3(GE_context* ac, T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_RULE].sort_with_comparator */
extern void T641f4(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [LX_RULE].subsort_with_comparator */
extern void T641f5(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* DS_ARRAYED_LIST [LX_RULE].replace */
extern void T574f22(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [LX_RULE].less_than */
extern T1 T664f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* LX_RULE.is_less */
extern T1 T586f13(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].item */
extern T0* T574f10(GE_context* ac, T0* C, T6 a1);
/* LX_DFA_STATE.rule_sorter */
extern unsigned char ge263os12863;
extern T0* ge263ov12863;
extern T0* T599f7(GE_context* ac, T0* C);
/* DS_BUBBLE_SORTER [LX_RULE].make */
extern T0* T641c2(GE_context* ac, T0* a1);
/* KL_COMPARABLE_COMPARATOR [LX_RULE].make */
extern T0* T664c2(GE_context* ac);
/* DS_ARRAYED_LIST [LX_NFA_STATE].sort */
extern void T600f25(GE_context* ac, T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].sort */
extern void T639f3(GE_context* ac, T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].sort_with_comparator */
extern void T639f4(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].subsort_with_comparator */
extern void T639f5(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* DS_ARRAYED_LIST [LX_NFA_STATE].replace */
extern void T600f22(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE].less_than */
extern T1 T667f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* LX_NFA_STATE.is_less */
extern T1 T608f9(GE_context* ac, T0* C, T0* a1);
/* LX_DFA_STATE.bubble_sorter */
extern unsigned char ge263os12862;
extern T0* ge263ov12862;
extern T0* T599f8(GE_context* ac, T0* C);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].make */
extern T0* T639c2(GE_context* ac, T0* a1);
/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE].make */
extern T0* T667c2(GE_context* ac);
/* DS_ARRAYED_LIST [LX_NFA_STATE].last */
extern T0* T600f9(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].is_empty */
extern T1 T600f8(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [LX_RULE].force_last */
extern void T574f13(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].force */
extern void T621f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [LX_RULE].fill_with */
extern void T597f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [LX_RULE].extend */
extern void T597f9(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].resize */
extern void T574f15(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].aliased_resized_area */
extern T0* T621f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_RULE].aliased_resized_area */
extern T0* T597f4(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].new_capacity */
extern T6 T574f9(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].extendible */
extern T1 T574f8(GE_context* ac, T0* C, T6 a1);
/* LX_NFA_STATE.is_accepting_head */
extern T1 T608f6(GE_context* ac, T0* C);
/* LX_NFA_STATE.has_transition */
extern T1 T608f8(GE_context* ac, T0* C);
/* LX_NFA_STATE.is_accepting */
extern T1 T608f7(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].has */
extern T1 T600f7(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].force_last */
extern void T600f23(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].force */
extern void T645f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [LX_NFA_STATE].fill_with */
extern void T643f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [LX_NFA_STATE].extend */
extern void T643f8(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].resize */
extern void T600f28(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].aliased_resized_area */
extern T0* T645f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_NFA_STATE].aliased_resized_area */
extern T0* T643f4(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].new_capacity */
extern T6 T600f12(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].extendible */
extern T1 T600f11(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].make */
extern T0* T574c12(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].set_internal_cursor */
extern void T574f14(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].new_cursor */
extern T0* T574f7(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_RULE].make */
extern T0* T622c4(GE_context* ac, T0* a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].make */
extern T0* T621f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [LX_RULE].make_empty */
extern void T597f7(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [LX_RULE].make_empty */
extern T0* T597c7(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].default_create */
extern T0* T621c3(GE_context* ac);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].make */
extern T0* T605c7(GE_context* ac, T6 a1, T6 a2);
/* KL_ARRAY_ROUTINES [detachable LX_DFA_STATE].default_create */
extern T0* T653c1(GE_context* ac);
/* ARRAY [detachable LX_DFA_STATE].make_filled */
extern T0* T652c5(GE_context* ac, T0* a1, T6 a2, T6 a3);
/* ARRAY [detachable LX_DFA_STATE].make_filled_area */
extern void T652f6(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_DFA_STATE].make_filled */
extern T0* T648c8(GE_context* ac, T0* a1, T6 a2);
/* SPECIAL [LX_DFA_STATE].make_empty */
extern void T648f5(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [LX_DFA_STATE].make_empty */
extern T0* T648c5(GE_context* ac, T6 a1);
/* LX_DFA_STATE.maximum_symbol */
extern T6 T599f13(GE_context* ac, T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].upper */
extern T6 T605f5(GE_context* ac, T0* C);
/* LX_DFA_STATE.minimum_symbol */
extern T6 T599f12(GE_context* ac, T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].lower */
extern T6 T605f4(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put_last */
extern void T600f20(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].item */
extern T0* T600f13(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].make */
extern T0* T600c19(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].set_internal_cursor */
extern void T600f26(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].new_cursor */
extern T0* T600f10(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].make */
extern T0* T646c9(GE_context* ac, T0* a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].make */
extern T0* T645f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [LX_NFA_STATE].make_empty */
extern T0* T643c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].default_create */
extern T0* T645c3(GE_context* ac);
/* LX_SYMBOL_PARTITIONS.is_representative */
extern T1 T602f8(GE_context* ac, T0* C, T6 a1);
/* ARRAY [BOOLEAN].item */
extern T1 T546f4(GE_context* ac, T0* C, T6 a1);
/* LX_DFA_STATE.partition */
extern void T599f18(GE_context* ac, T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.initialize */
extern void T602f10(GE_context* ac, T0* C);
/* ARRAY [BOOLEAN].clear_all */
extern void T546f7(GE_context* ac, T0* C);
/* LX_SYMBOL_PARTITIONS.initialize */
extern void T602f10p1(GE_context* ac, T0* C);
/* DS_BILINKABLE [INTEGER_32].put_left */
extern void T634f9(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].attach_right */
extern void T634f10(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].put */
extern void T634f5(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.lower */
extern T6 T602f7(GE_context* ac, T0* C);
/* LX_SYMBOL_PARTITIONS.upper */
extern T6 T602f6(GE_context* ac, T0* C);
/* LX_FULL_DFA.resize */
extern void T561f49(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].resize */
extern void T601f10(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].aliased_resized_area */
extern T0* T649f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_DFA_STATE].aliased_resized_area */
extern T0* T648f4(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.capacity */
extern T6 T602f5(GE_context* ac, T0* C);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].count */
extern T6 T636f5(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [LX_DFA_STATE].item */
extern T0* T601f7(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.make */
extern T0* T602c9(GE_context* ac, T6 a1, T6 a2);
/* LX_SYMBOL_PARTITIONS.make */
extern void T602f9p1(GE_context* ac, T0* C, T6 a1, T6 a2);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].put */
extern void T636f7(GE_context* ac, T0* C, T0* a1, T6 a2);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].make_filled */
extern T0* T636c6(GE_context* ac, T0* a1, T6 a2, T6 a3);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].make_filled_area */
extern void T636f8(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKABLE [INTEGER_32]].make_filled */
extern T0* T635c4(GE_context* ac, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKABLE [INTEGER_32]].fill_with */
extern void T635f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKABLE [INTEGER_32]].extend */
extern void T635f8(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [DS_BILINKABLE [INTEGER_32]].make_empty */
extern void T635f6(GE_context* ac, T0* C, T6 a1);
/* DS_BILINKABLE [INTEGER_32].make */
extern T0* T634c4(GE_context* ac, T6 a1);
/* ARRAY [BOOLEAN].make_filled */
extern T0* T546c5(GE_context* ac, T1 a1, T6 a2, T6 a3);
/* ARRAY [BOOLEAN].make_filled_area */
extern void T546f8(GE_context* ac, T0* C, T1 a1, T6 a2);
/* LX_FULL_DFA.put_eob_state */
extern void T561f39(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [LX_RULE].force_first */
extern void T574f16(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].put */
extern void T574f18(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [LX_RULE].move_cursors_right */
extern void T574f21(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_RULE].set_position */
extern void T622f5(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].move_right */
extern void T574f20(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [LX_RULE].put_last */
extern void T574f19(GE_context* ac, T0* C, T0* a1);
/* LX_RULE.make_default */
extern T0* T586c14(GE_context* ac, T6 a1);
/* LX_RULE.dummy_action */
extern unsigned char ge343os13168;
extern T0* ge343ov13168;
extern T0* T586f11(GE_context* ac, T0* C);
/* LX_ACTION.make */
extern T0* T638c2(GE_context* ac, T0* a1);
/* LX_RULE.dummy_pattern */
extern unsigned char ge343os13167;
extern T0* ge343ov13167;
extern T0* T586f12(GE_context* ac, T0* C);
/* LX_NFA.make_epsilon */
extern T0* T583c12(GE_context* ac, T1 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put_first */
extern void T600f21(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put */
extern void T600f27(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [LX_NFA_STATE].move_cursors_right */
extern void T600f31(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_position */
extern void T646f10(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].move_right */
extern void T600f30(GE_context* ac, T0* C, T6 a1, T6 a2);
/* LX_NFA_STATE.set_transition */
extern void T608f11(GE_context* ac, T0* C, T0* a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].make */
extern T0* T631c3(GE_context* ac, T0* a1);
/* LX_NFA_STATE.make */
extern T0* T608c10(GE_context* ac, T1 a1);
/* LX_FULL_DFA.initialize */
extern void T561f38(GE_context* ac, T0* C, T0* a1);
/* LX_FULL_DFA.initialize_dfa */
extern void T561f43(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* LX_FULL_DFA.put_start_condition */
extern void T561f48(GE_context* ac, T0* C, T0* a1);
/* LX_NFA.start_state */
extern T0* T583f4(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].first */
extern T0* T600f14(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [LX_NFA].item */
extern T0* T606f7(GE_context* ac, T0* C, T6 a1);
/* LX_START_CONDITIONS.item */
extern T0* T575f9(GE_context* ac, T0* C, T6 a1);
/* LX_FULL_DFA.set_nfa_state_ids */
extern void T561f47(GE_context* ac, T0* C, T0* a1);
/* LX_NFA_STATE.set_id */
extern void T608f14(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].force */
extern void T607f35(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].key_storage_put */
extern void T607f43(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].slots_put */
extern void T607f42(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].clashes_put */
extern void T607f41(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].slots_item */
extern T6 T607f29(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].clashes_item */
extern T6 T607f28(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].hash_position */
extern T6 T607f22(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].resize */
extern void T607f40(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].clashes_resize */
extern void T607f48(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].special_integer_ */
extern T0* T607f31(GE_context* ac, T0* C);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].key_storage_resize */
extern void T607f47(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].aliased_resized_area */
extern T0* T106f3(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item_storage_resize */
extern void T607f46(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].aliased_resized_area */
extern T0* T582f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_NFA].aliased_resized_area */
extern T0* T584f4(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].key_storage_item */
extern T6 T607f21(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].slots_resize */
extern void T607f45(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].new_modulus */
extern T6 T607f25(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].new_capacity */
extern T6 T607f33(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item_storage_put */
extern void T607f39(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [LX_NFA].force */
extern void T582f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [LX_NFA].fill_with */
extern void T584f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [LX_NFA].extend */
extern void T584f10(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].search_position */
extern void T607f36(GE_context* ac, T0* C, T6 a1);
/* detachable KL_EQUALITY_TESTER [INTEGER_32].test */
extern T1 T553f1(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].unset_found_item */
extern void T607f38(GE_context* ac, T0* C);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item */
extern T0* T607f23(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item_storage_item */
extern T0* T607f32(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].has */
extern T1 T607f24(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make */
extern T0* T607c34(GE_context* ac, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_with_equality_testers */
extern void T607f37(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_sparse_container */
extern void T607f44(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].set_internal_cursor */
extern void T607f53(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].new_cursor */
extern T0* T607f30(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32].make */
extern T0* T656c4(GE_context* ac, T0* a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_slots */
extern void T607f52(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_clashes */
extern void T607f51(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_key_storage */
extern void T607f50(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_item_storage */
extern void T607f49(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].make */
extern T0* T582f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [LX_NFA].make_empty */
extern T0* T584c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].default_create */
extern T0* T582c3(GE_context* ac);
/* detachable KL_EQUALITY_TESTER [INTEGER_32].default_create */
extern T0* T553c2(GE_context* ac);
/* DS_ARRAYED_LIST [LX_DFA_STATE].make */
extern T0* T601c8(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].set_internal_cursor */
extern void T601f11(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].new_cursor */
extern T0* T601f6(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].make */
extern T0* T650c3(GE_context* ac, T0* a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].make */
extern T0* T649f1(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].default_create */
extern T0* T649c3(GE_context* ac);
/* LX_EQUIVALENCE_CLASSES.to_array */
extern T0* T585f6(GE_context* ac, T0* C, T6 a1, T6 a2);
/* LX_EQUIVALENCE_CLASSES.lower */
extern T6 T585f5(GE_context* ac, T0* C);
/* LX_EQUIVALENCE_CLASSES.upper */
extern T6 T585f4(GE_context* ac, T0* C);
/* LX_EQUIVALENCE_CLASSES.built */
extern T1 T585f3(GE_context* ac, T0* C);
/* LX_FULL_DFA.build_eof_rules */
extern void T561f42(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* ARRAY [LX_RULE].put */
extern void T598f5(GE_context* ac, T0* C, T0* a1, T6 a2);
/* ARRAY [LX_RULE].make_filled */
extern T0* T598c4(GE_context* ac, T0* a1, T6 a2, T6 a3);
/* ARRAY [LX_RULE].make_filled_area */
extern void T598f6(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_RULE].make_filled */
extern T0* T597c5(GE_context* ac, T0* a1, T6 a2);
/* ARRAY [STRING_8].count */
extern T6 T40f10(GE_context* ac, T0* C);
/* LX_FULL_DFA.build_rules */
extern void T561f41(GE_context* ac, T0* C, T0* a1);
/* KL_ARRAY_ROUTINES [LX_RULE].make_empty_with_lower */
extern T0* T603f1(GE_context* ac, T0* C, T6 a1);
/* ARRAY [LX_RULE].make_from_array */
extern T0* T598c8(GE_context* ac, T0* a1);
/* ARRAY [LX_RULE].set_area */
extern void T598f10(GE_context* ac, T0* C, T0* a1);
/* KL_ARRAY [LX_RULE].new_rebase */
extern void T651f5(GE_context* ac, T0* C, T6 a1);
/* KL_ARRAY [LX_RULE].make_empty */
extern T0* T651c4(GE_context* ac);
/* KL_ARRAY [LX_RULE].make_empty_area */
extern void T651f6(GE_context* ac, T0* C, T6 a1);
/* ARRAY [LX_RULE].make_empty */
extern T0* T598c7(GE_context* ac);
/* ARRAY [LX_RULE].make_empty_area */
extern void T598f9(GE_context* ac, T0* C, T6 a1);
/* KL_ARRAY_ROUTINES [LX_RULE].default_create */
extern T0* T603c2(GE_context* ac);
/* LX_START_CONDITIONS.names */
extern T0* T575f7(GE_context* ac, T0* C);
/* LX_START_CONDITIONS.first */
extern T0* T575f6(GE_context* ac, T0* C);
/* LX_START_CONDITIONS.string_array_routines */
extern unsigned char ge122os3376;
extern T0* ge122ov3376;
extern T0* T575f11(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.parse_string */
extern void T559f221(GE_context* ac, T0* C, T0* a1);
/* LX_WILDCARD_PARSER.parse */
extern void T559f225(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_pop_last_value */
extern void T559f238(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_push_error_value */
extern void T559f237(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [detachable ANY].force */
extern void T194f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [detachable ANY].fill_with */
extern void T195f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [detachable ANY].extend */
extern void T195f9(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [detachable ANY].aliased_resized_area */
extern T0* T194f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [detachable ANY].aliased_resized_area */
extern T0* T195f3(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_do_action */
extern void T559f236(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.append_character_to_string */
extern T0* T559f172(GE_context* ac, T0* C, T6 a1, T0* a2);
/* LX_WILDCARD_PARSER.new_symbol_nfa */
extern T0* T559f217(GE_context* ac, T0* C, T6 a1);
/* LX_NFA.make_symbol */
extern T0* T583c13(GE_context* ac, T6 a1, T1 a2);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].make */
extern T0* T633c4(GE_context* ac, T6 a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].force_new */
extern void T579f44(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].key_storage_put */
extern void T579f52(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item_storage_put */
extern void T579f48(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].slots_put */
extern void T579f51(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].clashes_put */
extern void T579f50(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].slots_item */
extern T6 T579f22(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].hash_position */
extern T6 T579f31(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].clashes_item */
extern T6 T579f21(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].resize */
extern void T579f49(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].clashes_resize */
extern void T579f57(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].special_integer_ */
extern T0* T579f34(GE_context* ac, T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].key_storage_resize */
extern void T579f56(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item_storage_resize */
extern void T579f55(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].key_storage_item */
extern T0* T579f26(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].slots_resize */
extern void T579f54(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].new_modulus */
extern T6 T579f29(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].new_capacity */
extern T6 T579f30(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].unset_found_item */
extern void T579f47(GE_context* ac, T0* C);
/* LX_EQUIVALENCE_CLASSES.add */
extern void T585f11(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].forget_right */
extern void T634f7(GE_context* ac, T0* C);
/* DS_BILINKABLE [INTEGER_32].forget_left */
extern void T634f8(GE_context* ac, T0* C);
/* ARRAY [BOOLEAN].put */
extern void T546f6(GE_context* ac, T0* C, T1 a1, T6 a2);
/* DS_BILINKABLE [INTEGER_32].put_right */
extern void T634f6(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].attach_left */
extern void T634f11(GE_context* ac, T0* C, T0* a1);
/* LX_SYMBOL_CLASS.item */
extern T6 T578f14(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_CLASS.put */
extern void T578f19(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_CLASS.force_last */
extern void T578f22(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_CLASS.resize */
extern void T578f23(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_CLASS.new_capacity */
extern T6 T578f13(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_CLASS.extendible */
extern T1 T578f11(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_CLASS.last */
extern T6 T578f12(GE_context* ac, T0* C);
/* LX_SYMBOL_CLASS.is_empty */
extern T1 T578f10(GE_context* ac, T0* C);
/* LX_SYMBOL_CLASS.has */
extern T1 T578f9(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_CLASS.arrayed_has */
extern T1 T578f15(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_CLASS.make */
extern T0* T578c18(GE_context* ac, T6 a1);
/* LX_SYMBOL_CLASS.set_internal_cursor */
extern void T578f21(GE_context* ac, T0* C, T0* a1);
/* LX_SYMBOL_CLASS.new_cursor */
extern T0* T578f16(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [INTEGER_32].make */
extern T0* T626c3(GE_context* ac, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].found_item */
extern T0* T579f24(GE_context* ac, T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item_storage_item */
extern T0* T579f32(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].found */
extern T1 T579f23(GE_context* ac, T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].search */
extern void T579f43(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].search_position */
extern void T579f45(GE_context* ac, T0* C, T0* a1);
/* KL_STRING_EQUALITY_TESTER.test */
extern T1 T549f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* LX_WILDCARD_PARSER.new_epsilon_nfa */
extern T0* T559f171(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.append_character_set_to_character_class */
extern T0* T559f170(GE_context* ac, T0* C, T6 a1, T6 a2, T0* a3);
/* LX_WILDCARD_PARSER.report_negative_range_in_character_class_error */
extern void T559f269(GE_context* ac, T0* C);
/* UT_ERROR_HANDLER.report_error */
extern void T35f11(GE_context* ac, T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_error_message */
extern void T35f12(GE_context* ac, T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_line */
extern void T563f4(GE_context* ac, T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_new_line */
extern void T563f6(GE_context* ac, T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_string */
extern void T563f5(GE_context* ac, T0* C, T0* a1);
/* UT_ERROR_HANDLER.message */
extern T0* T35f5(GE_context* ac, T0* C, T0* a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.make */
extern T0* T620c8(GE_context* ac, T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.filename */
extern T0* T559f190(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].aliased_resized_area */
extern T0* T580f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_SYMBOL_CLASS].aliased_resized_area */
extern T0* T581f4(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.append_character_to_character_class */
extern T0* T559f169(GE_context* ac, T0* C, T6 a1, T0* a2);
/* LX_WILDCARD_PARSER.new_character_class */
extern T0* T559f168(GE_context* ac, T0* C);
/* LX_SYMBOL_CLASS.set_negated */
extern void T578f20(GE_context* ac, T0* C, T1 a1);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].force */
extern void T580f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [LX_SYMBOL_CLASS].fill_with */
extern void T581f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [LX_SYMBOL_CLASS].extend */
extern void T581f10(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].force */
extern void T579f42(GE_context* ac, T0* C, T0* a1, T0* a2);
/* LX_WILDCARD_PARSER.new_nfa_from_character_class */
extern T0* T559f167(GE_context* ac, T0* C, T0* a1);
/* LX_SYMBOL_CLASS.sort */
extern void T578f24(GE_context* ac, T0* C);
/* LX_SYMBOL_CLASS.arrayed_sort */
extern void T578f25(GE_context* ac, T0* C, T0* a1);
/* DS_SHELL_SORTER [INTEGER_32].sort */
extern void T662f3(GE_context* ac, T0* C, T0* a1);
/* DS_SHELL_SORTER [INTEGER_32].sort_with_comparator */
extern void T662f4(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_SHELL_SORTER [INTEGER_32].subsort_with_comparator */
extern void T662f5(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* LX_SYMBOL_CLASS.replace */
extern void T578f27(GE_context* ac, T0* C, T6 a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [INTEGER_32].less_than */
extern T1 T673f1(GE_context* ac, T0* C, T6 a1, T6 a2);
/* LX_SYMBOL_CLASS.sorter */
extern unsigned char ge268os13202;
extern T0* ge268ov13202;
extern T0* T578f17(GE_context* ac, T0* C);
/* DS_SHELL_SORTER [INTEGER_32].make */
extern T0* T662c2(GE_context* ac, T0* a1);
/* KL_COMPARABLE_COMPARATOR [INTEGER_32].make */
extern T0* T673c2(GE_context* ac);
/* LX_WILDCARD_PARSER.new_symbol_class_nfa */
extern T0* T559f165(GE_context* ac, T0* C, T0* a1);
/* LX_NFA.make_symbol_class */
extern T0* T583c6(GE_context* ac, T0* a1, T1 a2);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].make */
extern T0* T629c4(GE_context* ac, T0* a1, T0* a2);
/* LX_WILDCARD_PARSER.question_character_class */
extern T0* T559f164(GE_context* ac, T0* C);
/* LX_NFA.build_optional */
extern void T583f11(GE_context* ac, T0* C);
/* LX_NFA_STATE.set_epsilon_transition */
extern void T608f12(GE_context* ac, T0* C, T0* a1);
/* LX_NFA.final_state */
extern T0* T583f5(GE_context* ac, T0* C);
/* LX_NFA.build_positive_closure */
extern void T583f10(GE_context* ac, T0* C);
/* LX_NFA.build_closure */
extern void T583f9(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.new_nfa_from_character */
extern T0* T559f163(GE_context* ac, T0* C, T6 a1);
/* LX_NFA.build_concatenation */
extern void T583f8(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].append_last */
extern void T600f24(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].extend_last */
extern void T600f29(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].forth */
extern void T646f12(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_forth */
extern void T600f33(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].add_traversing_cursor */
extern void T600f34(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_next_cursor */
extern void T646f14(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].remove_traversing_cursor */
extern void T600f35(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].item */
extern T0* T646f4(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_item */
extern T0* T600f15(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].after */
extern T1 T646f6(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].start */
extern void T646f11(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_start */
extern void T600f32(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_after */
extern void T646f13(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].off */
extern T1 T646f7(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].before */
extern T1 T646f8(GE_context* ac, T0* C);
/* LX_NFA.build_union */
extern void T583f7(GE_context* ac, T0* C, T0* a1);
/* LX_WILDCARD_PARSER.report_unrecognized_rule_error */
extern void T559f251(GE_context* ac, T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.make */
extern T0* T589c8(GE_context* ac, T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.process_rule */
extern void T559f250(GE_context* ac, T0* C, T0* a1);
/* LX_START_CONDITIONS.add_nfa_to_all */
extern void T575f13(GE_context* ac, T0* C, T0* a1);
/* LX_START_CONDITION.put_nfa */
extern void T604f7(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA].force_last */
extern void T606f12(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA].resize */
extern void T606f13(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA].new_capacity */
extern T6 T606f9(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA].extendible */
extern T1 T606f8(GE_context* ac, T0* C, T6 a1);
/* LX_START_CONDITIONS.add_nfa_to_non_exclusive */
extern void T575f15(GE_context* ac, T0* C, T0* a1);
/* LX_START_CONDITIONS.is_empty */
extern T1 T575f8(GE_context* ac, T0* C);
/* LX_DESCRIPTION.set_variable_trail_context */
extern void T560f34(GE_context* ac, T0* C, T1 a1);
/* LX_RULE.set_column_count */
extern void T586f21(GE_context* ac, T0* C, T6 a1);
/* LX_RULE.set_line_count */
extern void T586f20(GE_context* ac, T0* C, T6 a1);
/* LX_RULE.set_trail_count */
extern void T586f19(GE_context* ac, T0* C, T6 a1);
/* LX_RULE.set_head_count */
extern void T586f18(GE_context* ac, T0* C, T6 a1);
/* LX_RULE.set_trail_context */
extern void T586f17(GE_context* ac, T0* C, T1 a1);
/* LX_RULE.set_line_nb */
extern void T586f16(GE_context* ac, T0* C, T6 a1);
/* LX_RULE.set_pattern */
extern void T586f15(GE_context* ac, T0* C, T0* a1);
/* LX_NFA.set_accepted_rule */
extern void T583f14(GE_context* ac, T0* C, T0* a1);
/* LX_NFA_STATE.set_accepted_rule */
extern void T608f13(GE_context* ac, T0* C, T0* a1);
/* LX_DESCRIPTION.create_equiv_classes */
extern void T560f33(GE_context* ac, T0* C);
/* LX_EQUIVALENCE_CLASSES.make */
extern T0* T585c9(GE_context* ac, T6 a1, T6 a2);
/* LX_EQUIVALENCE_CLASSES.initialize */
extern void T585f12(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.check_options */
extern void T559f249(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.report_full_and_variable_trailing_context_error */
extern void T559f264(GE_context* ac, T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.make */
extern T0* T595c8(GE_context* ac);
/* LX_WILDCARD_PARSER.report_full_and_reject_error */
extern void T559f263(GE_context* ac, T0* C);
/* LX_FULL_AND_REJECT_ERROR.make */
extern T0* T594c8(GE_context* ac);
/* LX_WILDCARD_PARSER.report_full_and_meta_equiv_classes_error */
extern void T559f262(GE_context* ac, T0* C);
/* LX_FULL_AND_META_ERROR.make */
extern T0* T593c8(GE_context* ac);
/* LX_WILDCARD_PARSER.build_equiv_classes */
extern void T559f248(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].forth */
extern void T588f11(GE_context* ac, T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_forth */
extern void T579f64(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].add_traversing_cursor */
extern void T579f66(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].set_next_cursor */
extern void T588f14(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].set_position */
extern void T588f13(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].remove_traversing_cursor */
extern void T579f65(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].set_after */
extern void T588f12(GE_context* ac, T0* C);
/* LX_SYMBOL_CLASS.convert_to_equivalence */
extern void T578f26(GE_context* ac, T0* C, T0* a1);
/* LX_EQUIVALENCE_CLASSES.equivalence_class */
extern T6 T585f8(GE_context* ac, T0* C, T6 a1);
/* LX_EQUIVALENCE_CLASSES.is_representative */
extern T1 T585f7(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].item */
extern T0* T588f5(GE_context* ac, T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_item */
extern T0* T579f36(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].after */
extern T1 T588f7(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].start */
extern void T588f10(GE_context* ac, T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_start */
extern void T579f63(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_off */
extern T1 T579f39(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].off */
extern T1 T588f8(GE_context* ac, T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].is_empty */
extern T1 T579f38(GE_context* ac, T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].new_cursor */
extern T0* T579f35(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].make */
extern T0* T588c9(GE_context* ac, T0* a1);
/* LX_EQUIVALENCE_CLASSES.build */
extern void T585f10(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_push_last_value */
extern void T559f235(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.accept */
extern void T559f234(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_do_error_action */
extern void T559f232(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.report_error */
extern void T559f247(GE_context* ac, T0* C, T0* a1);
/* UT_SYNTAX_ERROR.make */
extern T0* T587c8(GE_context* ac, T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.report_eof_expected_error */
extern void T559f246(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.read_token */
extern void T559f231(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_execute_action */
extern void T559f245(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.report_bad_character_error */
extern void T559f261(GE_context* ac, T0* C, T0* a1);
/* LX_BAD_CHARACTER_ERROR.make */
extern T0* T592c8(GE_context* ac, T0* a1, T6 a2, T0* a3);
/* LX_WILDCARD_PARSER.report_bad_character_class_error */
extern void T559f260(GE_context* ac, T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.make */
extern T0* T591c8(GE_context* ac, T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.start_condition */
extern T6 T559f185(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.process_escaped_character */
extern void T559f259(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.text_count */
extern T6 T559f206(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.report_missing_quote_error */
extern void T559f258(GE_context* ac, T0* C);
/* LX_MISSING_QUOTE_ERROR.make */
extern T0* T590c8(GE_context* ac, T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.process_character */
extern void T559f257(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.report_character_out_of_range_error */
extern void T559f267(GE_context* ac, T0* C, T0* a1);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.make */
extern T0* T596c8(GE_context* ac, T0* a1, T6 a2, T0* a3);
/* LX_WILDCARD_PARSER.text_item */
extern T2 T559f182(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.less */
extern void T559f256(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_set_line_column */
extern void T559f266(GE_context* ac, T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item */
extern T0* T579f33(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].has */
extern T1 T579f27(GE_context* ac, T0* C, T0* a1);
/* LX_WILDCARD_PARSER.text */
extern T0* T559f176(GE_context* ac, T0* C);
/* KL_CHARACTER_BUFFER.substring */
extern T0* T414f3(GE_context* ac, T0* C, T6 a1, T6 a2);
/* LX_WILDCARD_PARSER.set_start_condition */
extern void T559f255(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_execute_eof_action */
extern void T559f244(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.terminate */
extern void T559f254(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.wrap */
extern T1 T559f149(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_refill_input_buffer */
extern void T559f243(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_set_content */
extern void T559f241(GE_context* ac, T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.count */
extern T6 T414f4(GE_context* ac, T0* C);
/* YY_BUFFER.fill */
extern void T279f15(GE_context* ac, T0* C);
/* YY_BUFFER.set_index */
extern void T279f13(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_null_trans_state */
extern T6 T559f148(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_previous_state */
extern T6 T559f147(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.fatal_error */
extern void T559f242(GE_context* ac, T0* C, T0* a1);
/* LX_WILDCARD_PARSER.std */
extern T0* T559f173(GE_context* ac, T0* C);
/* KL_CHARACTER_BUFFER.item */
extern T2 T414f6(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.special_integer_ */
extern T0* T559f129(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_init_value_stacks */
extern void T559f230(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_clear_all */
extern void T559f239(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.clear_all */
extern void T559f252(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.clear_stacks */
extern void T559f265(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_clear_value_stacks */
extern void T559f268(GE_context* ac, T0* C);
/* SPECIAL [LX_NFA].keep_head */
extern void T584f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [LX_NFA].set_count */
extern void T584f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [LX_SYMBOL_CLASS].keep_head */
extern void T581f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [LX_SYMBOL_CLASS].set_count */
extern void T581f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [INTEGER_32].keep_head */
extern void T95f16(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [INTEGER_32].set_count */
extern void T95f17(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [detachable ANY].keep_head */
extern void T195f5(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [detachable ANY].set_count */
extern void T195f8(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.abort */
extern void T559f233(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.set_input_buffer */
extern void T559f224(GE_context* ac, T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_load_input_buffer */
extern void T559f229(GE_context* ac, T0* C);
/* YY_BUFFER.set_position */
extern void T279f14(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* LX_WILDCARD_PARSER.new_string_buffer */
extern T0* T559f131(GE_context* ac, T0* C, T0* a1);
/* YY_BUFFER.make */
extern T0* T279c12(GE_context* ac, T0* a1);
/* YY_BUFFER.make_from_buffer */
extern void T279f16(GE_context* ac, T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.put */
extern void T414f9(GE_context* ac, T0* C, T2 a1, T6 a2);
/* KL_CHARACTER_BUFFER.fill_from_string */
extern void T414f8(GE_context* ac, T0* C, T0* a1, T6 a2);
/* STRING_8.subcopy */
extern void T17f58(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* YY_BUFFER.new_default_buffer */
extern T0* T279f11(GE_context* ac, T0* C, T6 a1);
/* KL_CHARACTER_BUFFER.make */
extern T0* T414c7(GE_context* ac, T6 a1);
/* STRING_8.make_filled */
extern T0* T17c57(GE_context* ac, T2 a1, T6 a2);
/* LX_WILDCARD_PARSER.make_from_description */
extern T0* T559c220(GE_context* ac, T0* a1, T0* a2);
/* DS_ARRAYED_STACK [INTEGER_32].make */
extern T0* T577c4(GE_context* ac, T6 a1);
/* LX_ACTION_FACTORY.make */
extern T0* T576c1(GE_context* ac);
/* LX_START_CONDITIONS.make */
extern void T575f12(GE_context* ac, T0* C, T6 a1);
/* LX_START_CONDITIONS.make */
extern T0* T575c12(GE_context* ac, T6 a1);
/* LX_START_CONDITIONS.set_internal_cursor */
extern void T575f16(GE_context* ac, T0* C, T0* a1);
/* LX_START_CONDITIONS.new_cursor */
extern T0* T575f10(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].make */
extern T0* T625c4(GE_context* ac, T0* a1);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].make */
extern T0* T624f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [LX_START_CONDITION].make_empty */
extern T0* T623c4(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].default_create */
extern T0* T624c2(GE_context* ac);
/* LX_WILDCARD_PARSER.make_parser_skeleton */
extern void T559f223(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_build_parser_tables */
extern void T559f228(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yycheck_template */
extern unsigned char ge328os12362;
extern T0* ge328ov12362;
extern T0* T559f160(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yyfixed_array */
extern T0* T559f212(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].to_special */
extern T0* T106f4(GE_context* ac, T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yytable_template */
extern unsigned char ge328os12361;
extern T0* ge328ov12361;
extern T0* T559f158(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yypgoto_template */
extern unsigned char ge328os12360;
extern T0* ge328ov12360;
extern T0* T559f157(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yypact_template */
extern unsigned char ge328os12359;
extern T0* ge328ov12359;
extern T0* T559f156(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yydefgoto_template */
extern unsigned char ge328os12358;
extern T0* ge328ov12358;
extern T0* T559f155(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yydefact_template */
extern unsigned char ge328os12357;
extern T0* ge328ov12357;
extern T0* T559f154(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yytypes2_template */
extern unsigned char ge328os12356;
extern T0* ge328ov12356;
extern T0* T559f153(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yytypes1_template */
extern unsigned char ge328os12355;
extern T0* ge328ov12355;
extern T0* T559f144(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yyr1_template */
extern unsigned char ge328os12354;
extern T0* ge328ov12354;
extern T0* T559f142(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yytranslate_template */
extern unsigned char ge328os12353;
extern T0* ge328ov12353;
extern T0* T559f140(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_create_value_stacks */
extern void T559f227(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].make */
extern T0* T580f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [LX_SYMBOL_CLASS].make_empty */
extern T0* T581c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].default_create */
extern T0* T580c3(GE_context* ac);
/* KL_SPECIAL_ROUTINES [detachable ANY].make */
extern T0* T194f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [detachable ANY].make_empty */
extern T0* T195c4(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [detachable ANY].default_create */
extern T0* T194c3(GE_context* ac);
/* LX_WILDCARD_PARSER.make_lex_scanner_from_description */
extern void T559f222(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].set_key_equality_tester */
extern void T579f41(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_map */
extern T0* T579c40(GE_context* ac, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_with_equality_testers */
extern void T579f46(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_sparse_container */
extern void T579f53(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].set_internal_cursor */
extern void T579f62(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_slots */
extern void T579f61(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_clashes */
extern void T579f60(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_key_storage */
extern void T579f59(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_item_storage */
extern void T579f58(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_key_equality_tester */
extern void T123f41(GE_context* ac, T0* C, T0* a1);
/* LX_WILDCARD_PARSER.string_equality_tester */
extern unsigned char ge130os3370;
extern T0* ge130ov3370;
extern T0* T559f117(GE_context* ac, T0* C);
/* KL_STRING_EQUALITY_TESTER.default_create */
extern T0* T549c2(GE_context* ac);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map */
extern void T123f43(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map */
extern T0* T123c43(GE_context* ac, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_with_equality_testers */
extern void T123f44(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_sparse_container */
extern void T123f45(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_internal_cursor */
extern void T123f51(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_cursor */
extern T0* T123f39(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].unset_found_item */
extern void T123f50(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_slots */
extern void T123f49(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_modulus */
extern T6 T123f31(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_clashes */
extern void T123f48(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_key_storage */
extern void T123f47(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_item_storage */
extern void T123f46(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.make_with_buffer */
extern void T559f226(GE_context* ac, T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_initialize */
extern void T559f240(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_initialize */
extern void T559f240p1(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_build_tables */
extern void T559f253(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_accept_template */
extern unsigned char ge329os12534;
extern T0* ge329ov12534;
extern T0* T559f198(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_fixed_array */
extern T0* T559f219(GE_context* ac, T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_meta_template */
extern unsigned char ge329os12533;
extern T0* ge329ov12533;
extern T0* T559f197(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_ec_template */
extern unsigned char ge329os12532;
extern T0* ge329ov12532;
extern T0* T559f196(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_def_template */
extern unsigned char ge329os12531;
extern T0* ge329ov12531;
extern T0* T559f195(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_base_template */
extern unsigned char ge329os12530;
extern T0* ge329ov12530;
extern T0* T559f194(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_chk_template */
extern unsigned char ge329os12529;
extern T0* ge329ov12529;
extern T0* T559f193(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_nxt_template */
extern unsigned char ge329os12528;
extern T0* ge329ov12528;
extern T0* T559f192(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.empty_buffer */
extern unsigned char ge2595os8018;
extern T0* ge2595ov8018;
extern T0* T559f119(GE_context* ac, T0* C);
/* LX_DESCRIPTION.set_case_insensitive */
extern void T560f32(GE_context* ac, T0* C, T1 a1);
/* LX_DESCRIPTION.set_full_table */
extern void T560f31(GE_context* ac, T0* C, T1 a1);
/* LX_DESCRIPTION.set_meta_equiv_classes_used */
extern void T560f30(GE_context* ac, T0* C, T1 a1);
/* LX_DESCRIPTION.set_equiv_classes_used */
extern void T560f29(GE_context* ac, T0* C, T1 a1);
/* LX_DESCRIPTION.make */
extern T0* T560c28(GE_context* ac);
/* LX_START_CONDITIONS.make_with_initial */
extern T0* T575c14(GE_context* ac, T6 a1);
/* LX_START_CONDITIONS.put_first */
extern void T575f17(GE_context* ac, T0* C, T0* a1);
/* LX_START_CONDITIONS.put */
extern void T575f18(GE_context* ac, T0* C, T0* a1, T6 a2);
/* LX_START_CONDITIONS.move_cursors_right */
extern void T575f21(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].set_position */
extern void T625f5(GE_context* ac, T0* C, T6 a1);
/* LX_START_CONDITIONS.move_right */
extern void T575f20(GE_context* ac, T0* C, T6 a1, T6 a2);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].force */
extern void T624f3(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [LX_START_CONDITION].fill_with */
extern void T623f6(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [LX_START_CONDITION].extend */
extern void T623f7(GE_context* ac, T0* C, T0* a1);
/* LX_START_CONDITIONS.put_last */
extern void T575f19(GE_context* ac, T0* C, T0* a1);
/* LX_START_CONDITION.make */
extern T0* T604c6(GE_context* ac, T0* a1, T6 a2, T1 a3);
/* DS_ARRAYED_LIST [LX_NFA].make */
extern T0* T606c10(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA].set_internal_cursor */
extern void T606f11(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA].new_cursor */
extern T0* T606f6(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA].make */
extern T0* T654c3(GE_context* ac, T0* a1);
/* UT_ERROR_HANDLER.make_null */
extern T0* T35c10(GE_context* ac);
/* UT_ERROR_HANDLER.null_output_stream */
extern unsigned char ge167os3047;
extern T0* ge167ov3047;
extern T0* T35f6(GE_context* ac, T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.make */
extern T0* T563c3(GE_context* ac, T0* a1);
/* LX_DFA_WILDCARD.wipe_out */
extern void T520f17(GE_context* ac, T0* C);
/* GEANT_FILESET_ELEMENT.exclude_attribute_name */
extern unsigned char ge81os10481;
extern T0* ge81ov10481;
extern T0* T427f11(GE_context* ac, T0* C);
/* GEANT_FILESET.set_include_wc_string */
extern void T433f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.include_attribute_name */
extern unsigned char ge81os10480;
extern T0* ge81ov10480;
extern T0* T427f10(GE_context* ac, T0* C);
/* GEANT_FILESET.set_directory_name */
extern void T433f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET.set_dir_name */
extern void T433f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.attribute_value */
extern T0* T427f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.project_variables_resolver */
extern T0* T427f25(GE_context* ac, T0* C);
/* GEANT_FILESET_ELEMENT.dir_attribute_name */
extern T0* T427f8(GE_context* ac, T0* C);
/* GEANT_FILESET.make */
extern T0* T433c33(GE_context* ac, T0* a1);
/* DS_HASH_SET [STRING_8].set_equality_tester */
extern void T518f33(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].make */
extern T0* T518c32(GE_context* ac, T6 a1);
/* DS_HASH_SET [STRING_8].set_internal_cursor */
extern void T518f40(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].new_cursor */
extern T0* T518f20(GE_context* ac, T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].make */
extern T0* T543c9(GE_context* ac, T0* a1);
/* DS_HASH_SET [STRING_8].make_slots */
extern void T518f38(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_clashes */
extern void T518f37(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_key_storage */
extern void T518f36(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_item_storage */
extern void T518f35(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_equal */
extern T0* T516c37(GE_context* ac, T6 a1);
/* detachable KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY].default_create */
extern T0* T556c2(GE_context* ac);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make */
extern void T516f42(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].set_internal_cursor */
extern void T516f56(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].new_cursor */
extern T0* T516f21(GE_context* ac, T0* C);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].make */
extern T0* T554c8(GE_context* ac, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].unset_found_item */
extern void T516f45(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_slots */
extern void T516f55(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].new_modulus */
extern T6 T516f19(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_clashes */
extern void T516f54(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_key_storage */
extern void T516f53(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_item_storage */
extern void T516f52(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].make */
extern T0* T557f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_FILESET_ENTRY].make_empty */
extern T0* T555c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].default_create */
extern T0* T557c3(GE_context* ac);
/* GEANT_FILESET_ELEMENT.exit_application */
extern void T427f30(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_FILESET_ELEMENT.exceptions */
extern T0* T427f24(GE_context* ac, T0* C);
/* GEANT_FILESET_ELEMENT.log_messages */
extern void T427f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.mapped_filename_directory_attribute_name */
extern unsigned char ge81os10488;
extern T0* ge81ov10488;
extern T0* T427f6(GE_context* ac, T0* C);
/* GEANT_FILESET_ELEMENT.filename_directory_attribute_name */
extern unsigned char ge81os10486;
extern T0* ge81ov10486;
extern T0* T427f5(GE_context* ac, T0* C);
/* GEANT_FILESET_ELEMENT.directory_attribute_name */
extern unsigned char ge81os10479;
extern T0* ge81ov10479;
extern T0* T427f22(GE_context* ac, T0* C);
/* GEANT_FILESET_ELEMENT.has_attribute */
extern T1 T427f20(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.concat_attribute_name */
extern unsigned char ge81os10483;
extern T0* ge81ov10483;
extern T0* T427f7(GE_context* ac, T0* C);
/* GEANT_FILESET_ELEMENT.make */
extern void T427f29p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_FILESET_ELEMENT.set_project */
extern void T427f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.element_make */
extern void T427f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.set_xml_element */
extern void T427f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.fileset_element_name */
extern unsigned char ge68os10013;
extern T0* ge68ov10013;
extern T0* T385f13(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.set_flags */
extern void T482f37(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.flags_attribute_name */
extern unsigned char ge68os10012;
extern T0* ge68ov10012;
extern T0* T385f12(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.set_replace */
extern void T482f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.replace_attribute_name */
extern unsigned char ge68os10011;
extern T0* ge68ov10011;
extern T0* T385f11(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.set_variable_pattern */
extern void T482f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.variable_pattern_attribute_name */
extern unsigned char ge68os10010;
extern T0* ge68ov10010;
extern T0* T385f9(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.set_token */
extern void T482f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.token_attribute_name */
extern unsigned char ge68os10009;
extern T0* ge68ov10009;
extern T0* T385f8(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.set_match */
extern void T482f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.match_attribute_name */
extern unsigned char ge68os10008;
extern T0* ge68ov10008;
extern T0* T385f7(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.set_to_directory */
extern void T482f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.to_directory_attribute_name */
extern unsigned char ge68os10007;
extern T0* ge68ov10007;
extern T0* T385f6(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.set_to_file */
extern void T482f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.to_file_attribute_name */
extern unsigned char ge68os10006;
extern T0* ge68ov10006;
extern T0* T385f5(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.set_file */
extern void T482f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.attribute_value */
extern T0* T385f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.project_variables_resolver */
extern T0* T385f17(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.has_attribute */
extern T1 T385f10(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.file_attribute_name */
extern unsigned char ge68os10005;
extern T0* ge68ov10005;
extern T0* T385f15(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.make */
extern void T385f31p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_REPLACE_TASK.make */
extern T0* T385f31p1ac1(T0* a1);
/* DS_CELL [PROCEDURE [ANY, TUPLE]].put */
extern void T422f3(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.make_with_command */
extern void T385f33(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_TASK.interpreting_element_make */
extern void T385f36(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_TASK.set_project */
extern void T385f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.element_make */
extern void T385f37(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.set_xml_element */
extern void T385f39(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.set_command */
extern void T385f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.build_command */
extern void T385f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.make */
extern T0* T482c29(GE_context* ac, T0* a1);
/* DS_CELL [PROCEDURE [ANY, TUPLE]].make */
extern T0* T422c2(GE_context* ac, T0* a1);
/* GEANT_REPLACE_COMMAND.set_project */
extern void T482f39(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_input_task */
extern T0* T248f50(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.make */
extern T0* T383c32(GE_context* ac, T0* a1, T0* a2);
/* GEANT_INPUT_COMMAND.set_answer_required */
extern void T480f21(GE_context* ac, T0* C, T1 a1);
/* GEANT_INPUT_TASK.boolean_value */
extern T1 T383f10(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.std */
extern T0* T383f18(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.false_attribute_value */
extern T0* T383f17(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.true_attribute_value */
extern T0* T383f16(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.string_ */
extern T0* T383f15(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.answer_required_attribute_name */
extern unsigned char ge61os9987;
extern T0* ge61ov9987;
extern T0* T383f9(GE_context* ac, T0* C);
/* GEANT_INPUT_COMMAND.set_validregexp */
extern void T480f20(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.validregexp_attribute_name */
extern unsigned char ge61os9986;
extern T0* ge61ov9986;
extern T0* T383f8(GE_context* ac, T0* C);
/* GEANT_INPUT_COMMAND.set_validargs */
extern void T480f19(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.validargs_attribute_name */
extern unsigned char ge61os9985;
extern T0* ge61ov9985;
extern T0* T383f7(GE_context* ac, T0* C);
/* GEANT_INPUT_COMMAND.set_default_value */
extern void T480f18(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.defaultvalue_attribute_name */
extern unsigned char ge61os9984;
extern T0* ge61ov9984;
extern T0* T383f6(GE_context* ac, T0* C);
/* GEANT_INPUT_COMMAND.set_message */
extern void T480f17(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.message_attribute_name */
extern unsigned char ge61os9983;
extern T0* ge61ov9983;
extern T0* T383f5(GE_context* ac, T0* C);
/* GEANT_INPUT_COMMAND.set_variable */
extern void T480f16(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.attribute_value */
extern T0* T383f12(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.project_variables_resolver */
extern T0* T383f19(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.has_attribute */
extern T1 T383f11(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.variable_attribute_name */
extern unsigned char ge61os9982;
extern T0* ge61ov9982;
extern T0* T383f14(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.make */
extern void T383f32p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_INPUT_TASK.make */
extern T0* T383f32p1ac1(T0* a1);
/* GEANT_INPUT_TASK.make_with_command */
extern void T383f34(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_INPUT_TASK.interpreting_element_make */
extern void T383f37(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_INPUT_TASK.set_project */
extern void T383f39(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.element_make */
extern void T383f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.set_xml_element */
extern void T383f40(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.set_command */
extern void T383f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.build_command */
extern void T383f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_COMMAND.make */
extern T0* T480c15(GE_context* ac, T0* a1);
/* GEANT_INPUT_COMMAND.set_project */
extern void T480f22(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_available_task */
extern T0* T248f48(GE_context* ac, T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T381c21(GE_context* ac, T0* a1);
/* Creation of agent #1 in feature GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T381f21ac1(T0* a1, T0* a2);
/* Creation of agent #2 in feature GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T381f21ac2(T0* a1, T0* a2);
/* Creation of agent #3 in feature GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T381f21ac3(T0* a1, T0* a2);
/* Creation of agent #4 in feature GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T381f21ac4(T0* a1, T0* a2);
/* GEANT_INTERPRETING_ELEMENT.attribute_value_if_existing */
extern T0* T253f5(GE_context* ac, T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.has_attribute */
extern T1 T253f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.attribute_value */
extern T0* T253f4(GE_context* ac, T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.project_variables_resolver */
extern T0* T253f7(GE_context* ac, T0* C);
/* GEANT_STRING_PROPERTY.set_string_value_agent */
extern void T429f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern void T381f21p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.make */
extern void T381f22(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_AVAILABLE_TASK.make */
extern T0* T381f22ac1(T0* a1);
/* GEANT_AVAILABLE_TASK.make_with_command */
extern void T381f24(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_AVAILABLE_TASK.interpreting_element_make */
extern void T381f27(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_AVAILABLE_TASK.set_project */
extern void T381f29(GE_context* ac, T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.element_make */
extern void T381f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.set_xml_element */
extern void T381f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.set_command */
extern void T381f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.build_command */
extern void T381f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_AVAILABLE_COMMAND.make */
extern T0* T478c17(GE_context* ac, T0* a1);
/* Creation of agent #1 in feature GEANT_AVAILABLE_COMMAND.make */
extern T0* T478f17ac1(T0* a1);
/* GEANT_AVAILABLE_COMMAND.is_resource_existing */
extern T1 T478f11(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.file_exists */
extern T1 T92f29(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.exists */
extern T1 T97f37(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.is_plain */
extern T1 T97f26(GE_context* ac, T0* C);
/* FILE_INFO.is_plain */
extern T1 T119f11(GE_context* ac, T0* C);
/* FILE_INFO.file_info */
extern T6 T119f8(GE_context* ac, T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.buffered_file_info */
extern T0* T97f17(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.set_buffer */
extern void T97f65(GE_context* ac, T0* C);
/* FILE_INFO.fast_update */
extern void T119f23(GE_context* ac, T0* C, T0* a1, T0* a2);
/* FILE_INFO.eif_file_stat */
extern T6 T119f14(GE_context* ac, T0* C, T14 a1, T14 a2, T1 a3);
/* KL_TEXT_INPUT_FILE.internal_name_pointer */
extern T0* T97f15(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.old_exists */
extern T1 T97f23(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.file_exists */
extern T1 T97f16(GE_context* ac, T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.old_is_closed */
extern T1 T97f14(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.string_name */
extern T0* T97f20(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.reset */
extern void T97f64(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.tmp_file */
extern unsigned char ge156os4694;
extern T0* ge156ov4694;
extern T0* T92f5(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.file_exists */
extern T1 T93f27(GE_context* ac, T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.tmp_file */
extern T0* T93f6(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_COMMAND.unix_file_system */
extern T0* T478f13(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_COMMAND.file_system */
extern T0* T478f12(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_COMMAND.windows_file_system */
extern T0* T478f15(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_COMMAND.operating_system */
extern T0* T478f14(GE_context* ac, T0* C);
/* DS_CELL [FUNCTION [ANY, TUPLE [STRING_8], BOOLEAN]].make */
extern T0* T536c2(GE_context* ac, T0* a1);
/* GEANT_STRING_PROPERTY.make */
extern T0* T429c8(GE_context* ac);
/* GEANT_AVAILABLE_COMMAND.make */
extern void T478f17p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_AVAILABLE_COMMAND.set_project */
extern void T478f18(GE_context* ac, T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.make */
extern T0* T253c12(GE_context* ac, T0* a1, T0* a2);
/* GEANT_INTERPRETING_ELEMENT.set_project */
extern void T253f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.element_make */
extern void T253f13(GE_context* ac, T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.set_xml_element */
extern void T253f15(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_precursor_task */
extern T0* T248f46(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.make */
extern T0* T379c28(GE_context* ac, T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.force_last_new */
extern void T41f74(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.key_storage_put */
extern void T41f56(GE_context* ac, T0* C, T0* a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.item_storage_put */
extern void T41f52(GE_context* ac, T0* C, T0* a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.slots_put */
extern void T41f55(GE_context* ac, T0* C, T6 a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.clashes_put */
extern void T41f54(GE_context* ac, T0* C, T6 a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.slots_item */
extern T6 T41f31(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.hash_position */
extern T6 T41f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.resize */
extern void T41f53(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.clashes_resize */
extern void T41f61(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.special_integer_ */
extern T0* T41f28(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_VARIABLES.key_storage_resize */
extern void T41f60(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.item_storage_resize */
extern void T41f59(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.key_storage_item */
extern T0* T41f30(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.clashes_item */
extern T6 T41f26(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.slots_resize */
extern void T41f58(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.new_capacity */
extern T6 T41f23(GE_context* ac, T0* C, T6 a1);
/* GEANT_DEFINE_ELEMENT.value */
extern T0* T441f5(GE_context* ac, T0* C);
/* GEANT_DEFINE_ELEMENT.value_attribute_name */
extern T0* T441f12(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].forth */
extern void T406f10(GE_context* ac, T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_forth */
extern void T298f14(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].add_traversing_cursor */
extern void T298f16(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T406f12(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].remove_traversing_cursor */
extern void T298f17(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].set */
extern void T406f11(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [STRING_8].item */
extern T0* T406f6(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].start */
extern void T406f9(GE_context* ac, T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_start */
extern void T298f13(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].cursor_off */
extern T1 T298f9(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].off */
extern T1 T406f7(GE_context* ac, T0* C);
/* ST_SPLITTER.split */
extern T0* T412f5(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.arguments_string_splitter */
extern unsigned char ge10os1961;
extern T0* ge10ov1961;
extern T0* T379f8(GE_context* ac, T0* C);
/* ST_SPLITTER.make */
extern T0* T412c11(GE_context* ac);
/* GEANT_PRECURSOR_TASK.exit_application */
extern void T379f29(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_PRECURSOR_TASK.exceptions */
extern T0* T379f11(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.std */
extern T0* T379f10(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.log_messages */
extern void T379f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.arguments_attribute_name */
extern unsigned char ge67os9960;
extern T0* ge67ov9960;
extern T0* T379f7(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.elements_by_name */
extern T0* T379f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.string_ */
extern T0* T379f15(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.argument_element_name */
extern unsigned char ge67os9959;
extern T0* ge67ov9959;
extern T0* T379f5(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_COMMAND.set_parent */
extern void T476f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.attribute_value */
extern T0* T379f12(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.project_variables_resolver */
extern T0* T379f16(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.has_attribute */
extern T1 T379f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.parent_attribute_name */
extern unsigned char ge67os9958;
extern T0* ge67ov9958;
extern T0* T379f14(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.make */
extern void T379f28p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_PRECURSOR_TASK.make */
extern T0* T379f28p1ac1(T0* a1);
/* GEANT_PRECURSOR_TASK.make_with_command */
extern void T379f31(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_PRECURSOR_TASK.interpreting_element_make */
extern void T379f35(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_PRECURSOR_TASK.set_project */
extern void T379f37(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.element_make */
extern void T379f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.set_xml_element */
extern void T379f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.set_command */
extern void T379f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.build_command */
extern void T379f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_COMMAND.make */
extern T0* T476c8(GE_context* ac, T0* a1);
/* GEANT_PRECURSOR_COMMAND.make */
extern void T476f8p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_COMMAND.set_project */
extern void T476f10(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_exit_task */
extern T0* T248f44(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXIT_TASK.make */
extern T0* T377c23(GE_context* ac, T0* a1, T0* a2);
/* UC_UTF8_STRING.to_integer */
extern T6 T267f39(GE_context* ac, T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
extern T6 T166f13(GE_context* ac, T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
extern void T166f17(GE_context* ac, T0* C, T0* a1, T6 a2);
/* STRING_TO_INTEGER_CONVERTOR.parse_character */
extern void T166f23(GE_context* ac, T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflowed */
extern T1 T166f15(GE_context* ac, T0* C);
/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
extern unsigned char ge2429os7636;
extern T0* ge2429ov7636;
extern T0* T166f14(GE_context* ac, T0* C);
/* CHARACTER_8.is_digit */
extern T1 T2f9(GE_context* ac, T2* C);
/* STRING_TO_INTEGER_CONVERTOR.reset */
extern void T166f18(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.ctoi_convertor */
extern unsigned char ge2420os491;
extern T0* ge2420ov491;
extern T0* T267f44(GE_context* ac, T0* C);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
extern void T166f22(GE_context* ac, T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
extern void T166f21(GE_context* ac, T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
extern void T166f20(GE_context* ac, T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
extern void T166f19(GE_context* ac, T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.make */
extern T0* T166c16(GE_context* ac);
/* STRING_8.to_integer */
extern T6 T17f17(GE_context* ac, T0* C);
/* STRING_8.ctoi_convertor */
extern T0* T17f26(GE_context* ac, T0* C);
/* GEANT_EXIT_COMMAND.set_code */
extern void T474f8(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.is_integer */
extern T1 T267f38(GE_context* ac, T0* C);
/* UC_UTF8_STRING.is_valid_integer_or_natural */
extern T1 T267f43(GE_context* ac, T0* C, T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.is_integral_integer */
extern T1 T166f12(GE_context* ac, T0* C);
/* STRING_8.is_integer */
extern T1 T17f16(GE_context* ac, T0* C);
/* STRING_8.is_valid_integer_or_natural */
extern T1 T17f25(GE_context* ac, T0* C, T6 a1);
/* GEANT_EXIT_TASK.attribute_value */
extern T0* T377f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXIT_TASK.project_variables_resolver */
extern T0* T377f9(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.has_attribute */
extern T1 T377f5(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXIT_TASK.code_attribute_name */
extern unsigned char ge53os9949;
extern T0* ge53ov9949;
extern T0* T377f8(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.make */
extern void T377f23p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_EXIT_TASK.make */
extern T0* T377f23p1ac1(T0* a1);
/* GEANT_EXIT_TASK.make_with_command */
extern void T377f25(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_EXIT_TASK.interpreting_element_make */
extern void T377f28(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_EXIT_TASK.set_project */
extern void T377f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXIT_TASK.element_make */
extern void T377f29(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXIT_TASK.set_xml_element */
extern void T377f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXIT_TASK.set_command */
extern void T377f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXIT_TASK.build_command */
extern void T377f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXIT_COMMAND.make */
extern T0* T474c7(GE_context* ac, T0* a1);
/* GEANT_EXIT_COMMAND.set_project */
extern void T474f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_outofdate_task */
extern T0* T248f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.make */
extern T0* T375c28(GE_context* ac, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_COMMAND.set_fileset */
extern void T472f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.fileset_element_name */
extern unsigned char ge66os9928;
extern T0* ge66ov9928;
extern T0* T375f10(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_variable_name */
extern void T472f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.variable_attribute_name */
extern unsigned char ge66os9925;
extern T0* ge66ov9925;
extern T0* T375f8(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.false_value_attribute_name */
extern unsigned char ge66os9927;
extern T0* ge66ov9927;
extern T0* T375f7(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_false_value */
extern void T472f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.true_value_attribute_name */
extern unsigned char ge66os9926;
extern T0* ge66ov9926;
extern T0* T375f6(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_true_value */
extern void T472f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.set_target_filename */
extern void T472f22(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.target_attribute_name */
extern unsigned char ge66os9924;
extern T0* ge66ov9924;
extern T0* T375f5(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_source_filename */
extern void T472f21(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.attribute_value */
extern T0* T375f11(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.project_variables_resolver */
extern T0* T375f14(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.has_attribute */
extern T1 T375f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.source_attribute_name */
extern unsigned char ge66os9923;
extern T0* ge66ov9923;
extern T0* T375f12(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.make */
extern void T375f28p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_OUTOFDATE_TASK.make */
extern T0* T375f28p1ac1(T0* a1);
/* GEANT_OUTOFDATE_TASK.make_with_command */
extern void T375f30(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.interpreting_element_make */
extern void T375f33(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.set_project */
extern void T375f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.element_make */
extern void T375f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.set_xml_element */
extern void T375f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.set_command */
extern void T375f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.build_command */
extern void T375f29(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.make */
extern T0* T472c20(GE_context* ac, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.set_project */
extern void T472f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_xslt_task */
extern T0* T248f40(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.make */
extern T0* T373c41(GE_context* ac, T0* a1, T0* a2);
/* GEANT_XSLT_COMMAND.set_classpath */
extern void T469f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.classpath_attribute_name */
extern unsigned char ge73os9883;
extern T0* ge73ov9883;
extern T0* T373f21(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.set_extdirs */
extern void T469f37(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.extdirs_attribute_name */
extern unsigned char ge73os9882;
extern T0* ge73ov9882;
extern T0* T373f20(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.set_format */
extern void T469f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.format_attribute_name */
extern unsigned char ge73os9880;
extern T0* ge73ov9880;
extern T0* T373f19(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].force_last */
extern void T470f11(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]].force */
extern void T533f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [DS_PAIR [STRING_8, STRING_8]].fill_with */
extern void T534f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_PAIR [STRING_8, STRING_8]].extend */
extern void T534f8(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].resize */
extern void T470f13(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]].aliased_resized_area */
extern T0* T533f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_PAIR [STRING_8, STRING_8]].aliased_resized_area */
extern T0* T534f4(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].new_capacity */
extern T6 T470f7(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].extendible */
extern T1 T470f8(GE_context* ac, T0* C, T6 a1);
/* DS_PAIR [STRING_8, STRING_8].make */
extern T0* T468c3(GE_context* ac, T0* a1, T0* a2);
/* GEANT_DEFINE_ELEMENT.has_value */
extern T1 T441f15(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.elements_by_name */
extern T0* T373f17(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.parameter_element_name */
extern unsigned char ge73os9884;
extern T0* ge73ov9884;
extern T0* T373f16(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.set_indent */
extern void T469f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.indent_attribute_name */
extern unsigned char ge73os9881;
extern T0* ge73ov9881;
extern T0* T373f15(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.set_force */
extern void T469f34(GE_context* ac, T0* C, T1 a1);
/* GEANT_XSLT_TASK.boolean_value */
extern T1 T373f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.std */
extern T0* T373f27(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.false_attribute_value */
extern T0* T373f26(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.true_attribute_value */
extern T0* T373f25(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.force_attribute_name */
extern unsigned char ge73os9874;
extern T0* ge73ov9874;
extern T0* T373f13(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.set_stylesheet_filename */
extern void T469f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.stylesheet_filename_attribute_name */
extern unsigned char ge73os9873;
extern T0* ge73ov9873;
extern T0* T373f12(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.set_output_filename */
extern void T469f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.output_filename_attribute_name */
extern unsigned char ge73os9872;
extern T0* ge73ov9872;
extern T0* T373f11(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.set_input_filename */
extern void T469f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.input_filename_attribute_name */
extern unsigned char ge73os9871;
extern T0* ge73ov9871;
extern T0* T373f10(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.set_processor_gexslt */
extern void T469f30(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.set_processor */
extern void T469f40(GE_context* ac, T0* C, T6 a1);
/* GEANT_XSLT_TASK.processor_attribute_value_gexslt */
extern unsigned char ge73os9879;
extern T0* ge73ov9879;
extern T0* T373f9(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xsltproc */
extern void T469f29(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xsltproc */
extern unsigned char ge73os9878;
extern T0* ge73ov9878;
extern T0* T373f8(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xalan_java */
extern void T469f28(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xalan_java */
extern unsigned char ge73os9877;
extern T0* ge73ov9877;
extern T0* T373f7(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xalan_cpp */
extern void T469f27(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xalan_cpp */
extern unsigned char ge73os9876;
extern T0* ge73ov9876;
extern T0* T373f5(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.string_ */
extern T0* T373f24(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.attribute_value */
extern T0* T373f22(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.project_variables_resolver */
extern T0* T373f28(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.has_attribute */
extern T1 T373f18(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.processor_attribute_name */
extern unsigned char ge73os9875;
extern T0* ge73ov9875;
extern T0* T373f6(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.make */
extern void T373f41p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_XSLT_TASK.make */
extern T0* T373f41p1ac1(T0* a1);
/* GEANT_XSLT_TASK.make_with_command */
extern void T373f43(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_TASK.interpreting_element_make */
extern void T373f46(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_TASK.set_project */
extern void T373f48(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.element_make */
extern void T373f47(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.set_xml_element */
extern void T373f49(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.set_command */
extern void T373f45(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.build_command */
extern void T373f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.make */
extern T0* T469c26(GE_context* ac, T0* a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].make */
extern T0* T470c10(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].set_internal_cursor */
extern void T470f12(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].new_cursor */
extern T0* T470f6(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING_8, STRING_8]].make */
extern T0* T535c3(GE_context* ac, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]].make */
extern T0* T533f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_PAIR [STRING_8, STRING_8]].make_empty */
extern T0* T534c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]].default_create */
extern T0* T533c3(GE_context* ac);
/* GEANT_XSLT_COMMAND.make */
extern void T469f26p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.set_project */
extern void T469f39(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_setenv_task */
extern T0* T248f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_SETENV_TASK.make */
extern T0* T371c24(GE_context* ac, T0* a1, T0* a2);
/* GEANT_SETENV_COMMAND.set_value */
extern void T466f11(GE_context* ac, T0* C, T0* a1);
/* GEANT_SETENV_TASK.value_attribute_name */
extern unsigned char ge69os9861;
extern T0* ge69ov9861;
extern T0* T371f5(GE_context* ac, T0* C);
/* GEANT_SETENV_COMMAND.set_name */
extern void T466f10(GE_context* ac, T0* C, T0* a1);
/* GEANT_SETENV_TASK.attribute_value */
extern T0* T371f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_SETENV_TASK.project_variables_resolver */
extern T0* T371f10(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.has_attribute */
extern T1 T371f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_SETENV_TASK.name_attribute_name */
extern unsigned char ge69os9860;
extern T0* ge69ov9860;
extern T0* T371f9(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.make */
extern void T371f24p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_SETENV_TASK.make */
extern T0* T371f24p1ac1(T0* a1);
/* GEANT_SETENV_TASK.make_with_command */
extern void T371f26(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_SETENV_TASK.interpreting_element_make */
extern void T371f29(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_SETENV_TASK.set_project */
extern void T371f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_SETENV_TASK.element_make */
extern void T371f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_SETENV_TASK.set_xml_element */
extern void T371f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_SETENV_TASK.set_command */
extern void T371f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_SETENV_TASK.build_command */
extern void T371f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_SETENV_COMMAND.make */
extern T0* T466c9(GE_context* ac, T0* a1);
/* GEANT_SETENV_COMMAND.set_project */
extern void T466f12(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_move_task */
extern T0* T248f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_TASK.make */
extern T0* T369c26(GE_context* ac, T0* a1, T0* a2);
/* GEANT_MOVE_COMMAND.set_fileset */
extern void T464f21(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_TASK.fileset_element_name */
extern unsigned char ge65os9842;
extern T0* ge65ov9842;
extern T0* T369f8(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.set_to_directory */
extern void T464f20(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_TASK.to_directory_attribute_name */
extern unsigned char ge65os9841;
extern T0* ge65ov9841;
extern T0* T369f6(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.set_to_file */
extern void T464f19(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_TASK.to_file_attribute_name */
extern unsigned char ge65os9840;
extern T0* ge65ov9840;
extern T0* T369f5(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.set_file */
extern void T464f18(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_TASK.attribute_value */
extern T0* T369f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_TASK.project_variables_resolver */
extern T0* T369f12(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.has_attribute */
extern T1 T369f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_TASK.file_attribute_name */
extern unsigned char ge65os9839;
extern T0* ge65ov9839;
extern T0* T369f10(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.make */
extern void T369f26p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_MOVE_TASK.make */
extern T0* T369f26p1ac1(T0* a1);
/* GEANT_MOVE_TASK.make_with_command */
extern void T369f28(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_TASK.interpreting_element_make */
extern void T369f31(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_TASK.set_project */
extern void T369f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_TASK.element_make */
extern void T369f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_TASK.set_xml_element */
extern void T369f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_TASK.set_command */
extern void T369f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_TASK.build_command */
extern void T369f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.make */
extern T0* T464c17(GE_context* ac, T0* a1);
/* GEANT_MOVE_COMMAND.set_project */
extern void T464f22(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_copy_task */
extern T0* T248f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.make */
extern T0* T367c31(GE_context* ac, T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.set_fileset */
extern void T462f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.fileset_element_name */
extern unsigned char ge49os9819;
extern T0* ge49ov9819;
extern T0* T367f10(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.set_force */
extern void T462f24(GE_context* ac, T0* C, T1 a1);
/* GEANT_COPY_TASK.boolean_value */
extern T1 T367f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.std */
extern T0* T367f17(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.false_attribute_value */
extern T0* T367f16(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.true_attribute_value */
extern T0* T367f15(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.string_ */
extern T0* T367f14(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.force_attribute_name */
extern unsigned char ge49os9818;
extern T0* ge49ov9818;
extern T0* T367f7(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.set_to_directory */
extern void T462f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.to_directory_attribute_name */
extern unsigned char ge49os9817;
extern T0* ge49ov9817;
extern T0* T367f6(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.set_to_file */
extern void T462f22(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.to_file_attribute_name */
extern unsigned char ge49os9816;
extern T0* ge49ov9816;
extern T0* T367f5(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.set_file */
extern void T462f21(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.attribute_value */
extern T0* T367f11(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.project_variables_resolver */
extern T0* T367f18(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.has_attribute */
extern T1 T367f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.file_attribute_name */
extern unsigned char ge49os9815;
extern T0* ge49ov9815;
extern T0* T367f12(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.make */
extern void T367f31p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_COPY_TASK.make */
extern T0* T367f31p1ac1(T0* a1);
/* GEANT_COPY_TASK.make_with_command */
extern void T367f33(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_COPY_TASK.interpreting_element_make */
extern void T367f36(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_COPY_TASK.set_project */
extern void T367f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.element_make */
extern void T367f37(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.set_xml_element */
extern void T367f39(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.set_command */
extern void T367f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.build_command */
extern void T367f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_COMMAND.make */
extern T0* T462c20(GE_context* ac, T0* a1);
/* GEANT_COPY_COMMAND.set_project */
extern void T462f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_delete_task */
extern T0* T248f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.make */
extern T0* T365c31(GE_context* ac, T0* a1, T0* a2);
/* GEANT_DELETE_COMMAND.set_directoryset */
extern void T459f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.make */
extern T0* T458c20(GE_context* ac, T0* a1, T0* a2);
/* GEANT_DIRECTORYSET.add_single_exclude */
extern void T460f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.exclude_element_name */
extern unsigned char ge77os10591;
extern T0* ge77ov10591;
extern T0* T458f12(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.add_single_include */
extern void T460f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.elements_by_name */
extern T0* T458f11(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.string_ */
extern T0* T458f16(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.include_element_name */
extern unsigned char ge77os10590;
extern T0* ge77ov10590;
extern T0* T458f10(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.set_concat */
extern void T460f25(GE_context* ac, T0* C, T1 a1);
/* GEANT_DIRECTORYSET_ELEMENT.boolean_value */
extern T1 T458f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.std */
extern T0* T458f19(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.false_attribute_value */
extern T0* T458f18(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.true_attribute_value */
extern T0* T458f17(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.concat_attribute_name */
extern unsigned char ge77os10589;
extern T0* ge77ov10589;
extern T0* T458f8(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.set_exclude_wc_string */
extern void T460f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.exclude_attribute_name */
extern unsigned char ge77os10588;
extern T0* ge77ov10588;
extern T0* T458f7(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.set_include_wc_string */
extern void T460f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.include_attribute_name */
extern unsigned char ge77os10587;
extern T0* ge77ov10587;
extern T0* T458f6(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.set_directory_name */
extern void T460f22(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.attribute_value */
extern T0* T458f5(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.project_variables_resolver */
extern T0* T458f15(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.has_attribute */
extern T1 T458f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.directory_attribute_name */
extern unsigned char ge77os10586;
extern T0* ge77ov10586;
extern T0* T458f13(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.make */
extern T0* T460c21(GE_context* ac, T0* a1);
/* GEANT_DIRECTORYSET.set_directory_name_variable_name */
extern void T460f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.make */
extern void T458f20p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_DIRECTORYSET_ELEMENT.set_project */
extern void T458f22(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.element_make */
extern void T458f21(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.set_xml_element */
extern void T458f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.directoryset_element_name */
extern unsigned char ge50os9793;
extern T0* ge50ov9793;
extern T0* T365f11(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.set_fileset */
extern void T459f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.fileset_element_name */
extern unsigned char ge50os9792;
extern T0* ge50ov9792;
extern T0* T365f9(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.set_fail_on_error */
extern void T459f24(GE_context* ac, T0* C, T1 a1);
/* GEANT_DELETE_TASK.boolean_value */
extern T1 T365f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.std */
extern T0* T365f17(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.false_attribute_value */
extern T0* T365f16(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.true_attribute_value */
extern T0* T365f15(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.string_ */
extern T0* T365f14(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.fail_on_error_attribute_name */
extern unsigned char ge50os9794;
extern T0* ge50ov9794;
extern T0* T365f6(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.set_file */
extern void T459f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.file_attribute_name */
extern unsigned char ge50os9791;
extern T0* ge50ov9791;
extern T0* T365f5(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.set_directory */
extern void T459f22(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.attribute_value */
extern T0* T365f10(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.project_variables_resolver */
extern T0* T365f18(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.has_attribute */
extern T1 T365f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.directory_attribute_name */
extern unsigned char ge50os9790;
extern T0* ge50ov9790;
extern T0* T365f12(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.make */
extern void T365f31p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_DELETE_TASK.make */
extern T0* T365f31p1ac1(T0* a1);
/* GEANT_DELETE_TASK.make_with_command */
extern void T365f33(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_DELETE_TASK.interpreting_element_make */
extern void T365f36(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_DELETE_TASK.set_project */
extern void T365f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.element_make */
extern void T365f37(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.set_xml_element */
extern void T365f39(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.set_command */
extern void T365f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.build_command */
extern void T365f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.make */
extern T0* T459c21(GE_context* ac, T0* a1);
/* GEANT_DELETE_COMMAND.make */
extern void T459f21p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.set_project */
extern void T459f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_mkdir_task */
extern T0* T248f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_MKDIR_TASK.make_from_interpreting_element */
extern T0* T363c21(GE_context* ac, T0* a1);
/* Creation of agent #1 in feature GEANT_MKDIR_TASK.make_from_interpreting_element */
extern T0* T363f21ac1(T0* a1, T0* a2);
/* GEANT_MKDIR_TASK.make_from_interpreting_element */
extern void T363f21p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_MKDIR_TASK.make */
extern void T363f22(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_MKDIR_TASK.make */
extern T0* T363f22ac1(T0* a1);
/* GEANT_MKDIR_TASK.make_with_command */
extern void T363f24(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_MKDIR_TASK.interpreting_element_make */
extern void T363f27(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_MKDIR_TASK.set_project */
extern void T363f29(GE_context* ac, T0* C, T0* a1);
/* GEANT_MKDIR_TASK.element_make */
extern void T363f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_MKDIR_TASK.set_xml_element */
extern void T363f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_MKDIR_TASK.set_command */
extern void T363f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_MKDIR_TASK.build_command */
extern void T363f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_MKDIR_COMMAND.make */
extern T0* T456c13(GE_context* ac, T0* a1);
/* Creation of agent #1 in feature GEANT_MKDIR_COMMAND.make */
extern T0* T456f13ac1(T0* a1);
/* GEANT_MKDIR_COMMAND.create_directory */
extern void T456f14(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.recursive_create_directory */
extern void T92f38(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.recursive_create_directory */
extern void T411f54(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.canonical_pathname */
extern T0* T93f29(GE_context* ac, T0* C, T0* a1);
/* KL_PATHNAME.set_canonical */
extern void T133f18(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.canonical_pathname */
extern T0* T92f34(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.string_to_pathname */
extern T0* T92f35(GE_context* ac, T0* C, T0* a1);
/* KL_PATHNAME.set_drive */
extern void T133f21(GE_context* ac, T0* C, T0* a1);
/* KL_PATHNAME.set_sharename */
extern void T133f20(GE_context* ac, T0* C, T0* a1);
/* KL_PATHNAME.set_hostname */
extern void T133f19(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.string_name */
extern T0* T411f25(GE_context* ac, T0* C);
/* KL_DIRECTORY.file_system */
extern T0* T411f24(GE_context* ac, T0* C);
/* KL_DIRECTORY.unix_file_system */
extern T0* T411f35(GE_context* ac, T0* C);
/* KL_DIRECTORY.windows_file_system */
extern T0* T411f34(GE_context* ac, T0* C);
/* KL_DIRECTORY.operating_system */
extern T0* T411f33(GE_context* ac, T0* C);
/* KL_DIRECTORY.create_directory */
extern void T411f57(GE_context* ac, T0* C);
/* KL_DIRECTORY.create_dir */
extern void T411f58(GE_context* ac, T0* C);
/* KL_DIRECTORY.file_mkdir */
extern void T411f59(GE_context* ac, T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.recursive_create_directory */
extern void T93f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_MKDIR_COMMAND.unix_file_system */
extern T0* T456f7(GE_context* ac, T0* C);
/* GEANT_MKDIR_COMMAND.file_system */
extern T0* T456f6(GE_context* ac, T0* C);
/* GEANT_MKDIR_COMMAND.windows_file_system */
extern T0* T456f11(GE_context* ac, T0* C);
/* GEANT_MKDIR_COMMAND.operating_system */
extern T0* T456f10(GE_context* ac, T0* C);
/* DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8]]].make */
extern T0* T522c2(GE_context* ac, T0* a1);
/* GEANT_MKDIR_COMMAND.make */
extern void T456f13p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_MKDIR_COMMAND.set_project */
extern void T456f15(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_echo_task */
extern T0* T248f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_ECHO_TASK.make_from_interpreting_element */
extern T0* T361c21(GE_context* ac, T0* a1);
/* Creation of agent #1 in feature GEANT_ECHO_TASK.make_from_interpreting_element */
extern T0* T361f21ac1(T0* a1, T0* a2);
/* Creation of agent #2 in feature GEANT_ECHO_TASK.make_from_interpreting_element */
extern T0* T361f21ac2(T0* a1, T0* a2);
/* Creation of agent #3 in feature GEANT_ECHO_TASK.make_from_interpreting_element */
extern T0* T361f21ac3(T0* a1, T0* a2);
/* GEANT_INTERPRETING_ELEMENT.attribute_or_content_value */
extern T0* T253f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.exit_application */
extern void T253f17(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_INTERPRETING_ELEMENT.exceptions */
extern T0* T253f11(GE_context* ac, T0* C);
/* GEANT_INTERPRETING_ELEMENT.std */
extern T0* T253f10(GE_context* ac, T0* C);
/* GEANT_INTERPRETING_ELEMENT.log_messages */
extern void T253f16(GE_context* ac, T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.content */
extern T0* T253f9(GE_context* ac, T0* C);
/* GEANT_BOOLEAN_PROPERTY.set_string_value_agent */
extern void T432f13(GE_context* ac, T0* C, T0* a1);
/* GEANT_ECHO_TASK.make_from_interpreting_element */
extern void T361f21p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_ECHO_TASK.make */
extern void T361f22(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_ECHO_TASK.make */
extern T0* T361f22ac1(T0* a1);
/* GEANT_ECHO_TASK.make_with_command */
extern void T361f24(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_ECHO_TASK.interpreting_element_make */
extern void T361f27(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_ECHO_TASK.set_project */
extern void T361f29(GE_context* ac, T0* C, T0* a1);
/* GEANT_ECHO_TASK.element_make */
extern void T361f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_ECHO_TASK.set_xml_element */
extern void T361f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_ECHO_TASK.set_command */
extern void T361f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_ECHO_TASK.build_command */
extern void T361f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_ECHO_COMMAND.make */
extern T0* T454c12(GE_context* ac, T0* a1);
/* Creation of agent #1 in feature GEANT_ECHO_COMMAND.make */
extern T0* T454f12ac1(T0* a1);
/* Creation of agent #2 in feature GEANT_ECHO_COMMAND.make */
extern T0* T454f12ac2(T0* a1);
/* GEANT_ECHO_COMMAND.write_message_to_file */
extern void T454f14(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* KL_TEXT_OUTPUT_FILE.put_line */
extern void T528f30(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.put_new_line */
extern void T528f36(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.put_string */
extern void T528f35(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_put_string */
extern void T528f39(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_ps */
extern void T528f41(GE_context* ac, T0* C, T14 a1, T14 a2, T6 a3);
/* KL_TEXT_OUTPUT_FILE.string_ */
extern T0* T528f9(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.is_open_write */
extern T1 T528f17(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
extern T1 T528f14(GE_context* ac, T0* C);
/* GEANT_ECHO_COMMAND.write_message */
extern void T454f13(GE_context* ac, T0* C, T0* a1);
/* DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]]].make */
extern T0* T527c2(GE_context* ac, T0* a1);
/* GEANT_BOOLEAN_PROPERTY.make */
extern T0* T432c12(GE_context* ac);
/* GEANT_ECHO_COMMAND.make */
extern void T454f12p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_ECHO_COMMAND.set_project */
extern void T454f15(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_geant_task */
extern T0* T248f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.make */
extern T0* T359c36(GE_context* ac, T0* a1, T0* a2);
/* GEANT_GEANT_TASK.arguments_string_splitter */
extern T0* T359f16(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.exit_application */
extern void T359f37(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_GEANT_TASK.exceptions */
extern T0* T359f18(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.std */
extern T0* T359f17(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.log_messages */
extern void T359f41(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.arguments_attribute_name */
extern unsigned char ge54os9738;
extern T0* ge54ov9738;
extern T0* T359f15(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.elements_by_name */
extern T0* T359f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.string_ */
extern T0* T359f21(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.argument_element_name */
extern unsigned char ge54os9737;
extern T0* ge54ov9737;
extern T0* T359f13(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.set_exit_code_variable_name */
extern void T452f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.exit_code_variable_attribute_name */
extern unsigned char ge54os9739;
extern T0* ge54ov9739;
extern T0* T359f12(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.fork_attribute_name */
extern unsigned char ge54os9735;
extern T0* ge54ov9735;
extern T0* T359f11(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.set_fileset */
extern void T452f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.fileset_element_name */
extern unsigned char ge54os9736;
extern T0* ge54ov9736;
extern T0* T359f9(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.set_fork */
extern void T452f30(GE_context* ac, T0* C, T1 a1);
/* GEANT_GEANT_COMMAND.set_filename */
extern void T452f29(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.filename_attribute_name */
extern unsigned char ge54os9732;
extern T0* ge54ov9732;
extern T0* T359f7(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.set_reuse_variables */
extern void T452f28(GE_context* ac, T0* C, T1 a1);
/* GEANT_GEANT_TASK.boolean_value */
extern T1 T359f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.false_attribute_value */
extern T0* T359f23(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.true_attribute_value */
extern T0* T359f22(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.reuse_variables_attribute_name */
extern unsigned char ge54os9734;
extern T0* ge54ov9734;
extern T0* T359f5(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.set_start_target_name */
extern void T452f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.attribute_value */
extern T0* T359f10(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.project_variables_resolver */
extern T0* T359f24(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.has_attribute */
extern T1 T359f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.start_target_attribute_name */
extern unsigned char ge54os9733;
extern T0* ge54ov9733;
extern T0* T359f19(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.make */
extern void T359f36p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEANT_TASK.make */
extern T0* T359f36p1ac1(T0* a1);
/* GEANT_GEANT_TASK.make_with_command */
extern void T359f39(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_TASK.interpreting_element_make */
extern void T359f43(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_TASK.set_project */
extern void T359f45(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.element_make */
extern void T359f44(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.set_xml_element */
extern void T359f46(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.set_command */
extern void T359f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.build_command */
extern void T359f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.make */
extern T0* T452c26(GE_context* ac, T0* a1);
/* GEANT_GEANT_COMMAND.make */
extern void T452f26p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.set_project */
extern void T452f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_getest_task */
extern T0* T248f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.make */
extern T0* T357c39(GE_context* ac, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force */
extern void T123f53(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_put */
extern void T123f62(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_put */
extern void T123f61(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_put */
extern void T123f60(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_item */
extern T6 T123f30(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_item */
extern T6 T123f33(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].hash_position */
extern T6 T123f28(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].resize */
extern void T123f59(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_resize */
extern void T123f68(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].special_integer_ */
extern T0* T123f38(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_resize */
extern void T123f67(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_resize */
extern void T123f66(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_item */
extern T0* T123f26(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_resize */
extern void T123f65(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_capacity */
extern T6 T123f27(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_put */
extern void T123f58(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].search_position */
extern void T123f57(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.define_element_name */
extern unsigned char ge58os9703;
extern T0* ge58ov9703;
extern T0* T357f20(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.true_attribute_value */
extern T0* T357f19(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.string_ */
extern T0* T357f18(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.elements_by_name */
extern T0* T357f16(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.attribute_element_name */
extern unsigned char ge58os9702;
extern T0* ge58ov9702;
extern T0* T357f15(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.set_abort */
extern void T450f32(GE_context* ac, T0* C, T1 a1);
/* GEANT_GETEST_TASK.abort_attribute_name */
extern unsigned char ge58os9701;
extern T0* ge58ov9701;
extern T0* T357f14(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.set_execution */
extern void T450f31(GE_context* ac, T0* C, T1 a1);
/* GEANT_GETEST_TASK.execution_attribute_name */
extern unsigned char ge58os9700;
extern T0* ge58ov9700;
extern T0* T357f13(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.set_compilation */
extern void T450f30(GE_context* ac, T0* C, T1 a1);
/* GEANT_GETEST_TASK.compilation_attribute_name */
extern unsigned char ge58os9699;
extern T0* ge58ov9699;
extern T0* T357f12(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.set_generation */
extern void T450f29(GE_context* ac, T0* C, T1 a1);
/* GEANT_GETEST_TASK.generation_attribute_name */
extern unsigned char ge58os9698;
extern T0* ge58ov9698;
extern T0* T357f11(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.set_default_test_included */
extern void T450f28(GE_context* ac, T0* C, T1 a1);
/* GEANT_GETEST_TASK.default_test_attribute_name */
extern unsigned char ge58os9697;
extern T0* ge58ov9697;
extern T0* T357f10(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.set_feature_regexp */
extern void T450f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.feature_attribute_name */
extern unsigned char ge58os9696;
extern T0* ge58ov9696;
extern T0* T357f9(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.set_class_regexp */
extern void T450f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.class_attribute_name */
extern unsigned char ge58os9695;
extern T0* ge58ov9695;
extern T0* T357f8(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.set_compile */
extern void T450f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.compile_attribute_name */
extern unsigned char ge58os9694;
extern T0* ge58ov9694;
extern T0* T357f7(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.set_config_filename */
extern void T450f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.attribute_value */
extern T0* T357f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.project_variables_resolver */
extern T0* T357f24(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.config_filename_attribute_name */
extern unsigned char ge58os9693;
extern T0* ge58ov9693;
extern T0* T357f5(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.set_verbose */
extern void T450f23(GE_context* ac, T0* C, T1 a1);
/* GEANT_GETEST_TASK.boolean_value */
extern T1 T357f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.std */
extern T0* T357f26(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.false_attribute_value */
extern T0* T357f25(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.has_attribute */
extern T1 T357f17(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.verbose_attribute_name */
extern unsigned char ge58os9692;
extern T0* ge58ov9692;
extern T0* T357f21(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.make */
extern void T357f39p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GETEST_TASK.make */
extern T0* T357f39p1ac1(T0* a1);
/* GEANT_GETEST_TASK.make_with_command */
extern void T357f41(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GETEST_TASK.interpreting_element_make */
extern void T357f44(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GETEST_TASK.set_project */
extern void T357f46(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.element_make */
extern void T357f45(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.set_xml_element */
extern void T357f47(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.set_command */
extern void T357f43(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.build_command */
extern void T357f40(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.make */
extern T0* T450c22(GE_context* ac, T0* a1);
/* GEANT_GETEST_COMMAND.make */
extern void T450f22p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.set_project */
extern void T450f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_gepp_task */
extern T0* T248f22(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.make */
extern T0* T355c34(GE_context* ac, T0* a1, T0* a2);
/* GEANT_GEPP_COMMAND.set_fileset */
extern void T448f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.fileset_element_name */
extern unsigned char ge57os9667;
extern T0* ge57ov9667;
extern T0* T355f14(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.set_force */
extern void T448f26(GE_context* ac, T0* C, T1 a1);
/* GEANT_GEPP_TASK.force_attribute_name */
extern unsigned char ge57os9666;
extern T0* ge57ov9666;
extern T0* T355f12(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.set_to_directory */
extern void T448f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.to_directory_attribute_name */
extern unsigned char ge57os9665;
extern T0* ge57ov9665;
extern T0* T355f11(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.elements_by_name */
extern T0* T355f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.string_ */
extern T0* T355f17(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.define_element_name */
extern unsigned char ge57os9664;
extern T0* ge57ov9664;
extern T0* T355f8(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.set_empty_lines */
extern void T448f24(GE_context* ac, T0* C, T1 a1);
/* GEANT_GEPP_TASK.boolean_value */
extern T1 T355f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.std */
extern T0* T355f20(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.false_attribute_value */
extern T0* T355f19(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.true_attribute_value */
extern T0* T355f18(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.lines_attribute_name */
extern unsigned char ge57os9663;
extern T0* ge57ov9663;
extern T0* T355f6(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.set_output_filename */
extern void T448f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.output_filename_attribute_name */
extern unsigned char ge57os9662;
extern T0* ge57ov9662;
extern T0* T355f5(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.set_input_filename */
extern void T448f22(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.attribute_value */
extern T0* T355f13(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.project_variables_resolver */
extern T0* T355f21(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.has_attribute */
extern T1 T355f10(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.input_filename_attribute_name */
extern unsigned char ge57os9661;
extern T0* ge57ov9661;
extern T0* T355f15(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.make */
extern void T355f34p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEPP_TASK.make */
extern T0* T355f34p1ac1(T0* a1);
/* GEANT_GEPP_TASK.make_with_command */
extern void T355f36(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_TASK.interpreting_element_make */
extern void T355f39(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_TASK.set_project */
extern void T355f41(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.element_make */
extern void T355f40(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.set_xml_element */
extern void T355f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.set_command */
extern void T355f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.build_command */
extern void T355f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.make */
extern T0* T448c21(GE_context* ac, T0* a1);
/* GEANT_GEPP_COMMAND.make */
extern void T448f21p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.set_project */
extern void T448f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_geyacc_task */
extern T0* T248f20(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.make */
extern T0* T353c34(GE_context* ac, T0* a1, T0* a2);
/* GEANT_GEYACC_COMMAND.set_input_filename */
extern void T446f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.input_filename_attribute_name */
extern unsigned char ge60os9639;
extern T0* ge60ov9639;
extern T0* T353f12(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.set_output_filename */
extern void T446f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.output_filename_attribute_name */
extern unsigned char ge60os9638;
extern T0* ge60ov9638;
extern T0* T353f11(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.set_tokens_filename */
extern void T446f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.tokens_filename_attribute_name */
extern unsigned char ge60os9637;
extern T0* ge60ov9637;
extern T0* T353f10(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.set_tokens_classname */
extern void T446f22(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.tokens_classname_attribute_name */
extern unsigned char ge60os9636;
extern T0* ge60ov9636;
extern T0* T353f9(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.new_typing_attribute_name */
extern unsigned char ge60os9640;
extern T0* ge60ov9640;
extern T0* T353f8(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.set_verbose_filename */
extern void T446f21(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.attribute_value */
extern T0* T353f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.project_variables_resolver */
extern T0* T353f17(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.verbose_filename_attribute_name */
extern unsigned char ge60os9635;
extern T0* ge60ov9635;
extern T0* T353f6(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.set_separate_actions */
extern void T446f20(GE_context* ac, T0* C, T1 a1);
/* GEANT_GEYACC_TASK.separate_actions_attribute_name */
extern unsigned char ge60os9634;
extern T0* ge60ov9634;
extern T0* T353f5(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.set_rescue_on_abort */
extern void T446f19(GE_context* ac, T0* C, T1 a1);
/* GEANT_GEYACC_TASK.boolean_value */
extern T1 T353f16(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.std */
extern T0* T353f21(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.false_attribute_value */
extern T0* T353f20(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.true_attribute_value */
extern T0* T353f19(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.string_ */
extern T0* T353f18(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.has_attribute */
extern T1 T353f13(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.rescue_on_abort_attribute_name */
extern unsigned char ge60os9633;
extern T0* ge60ov9633;
extern T0* T353f14(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.make */
extern void T353f34p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEYACC_TASK.make */
extern T0* T353f34p1ac1(T0* a1);
/* GEANT_GEYACC_TASK.make_with_command */
extern void T353f36(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEYACC_TASK.interpreting_element_make */
extern void T353f39(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEYACC_TASK.set_project */
extern void T353f41(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.element_make */
extern void T353f40(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.set_xml_element */
extern void T353f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.set_command */
extern void T353f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.build_command */
extern void T353f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.make */
extern T0* T446c18(GE_context* ac, T0* a1);
/* GEANT_GEYACC_COMMAND.make */
extern void T446f18p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.set_project */
extern void T446f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_gelex_task */
extern T0* T248f18(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.make */
extern T0* T351c37(GE_context* ac, T0* a1, T0* a2);
/* GEANT_GELEX_COMMAND.set_input_filename */
extern void T444f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.input_filename_attribute_name */
extern unsigned char ge56os9604;
extern T0* ge56ov9604;
extern T0* T351f15(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.set_output_filename */
extern void T444f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.output_filename_attribute_name */
extern unsigned char ge56os9603;
extern T0* ge56ov9603;
extern T0* T351f14(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.set_separate_actions */
extern void T444f31(GE_context* ac, T0* C, T1 a1);
/* GEANT_GELEX_TASK.separate_actions_attribute_name */
extern unsigned char ge56os9602;
extern T0* ge56ov9602;
extern T0* T351f13(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.set_no_warn */
extern void T444f30(GE_context* ac, T0* C, T1 a1);
/* GEANT_GELEX_TASK.no_warn_attribute_name */
extern unsigned char ge56os9601;
extern T0* ge56ov9601;
extern T0* T351f12(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.set_no_default */
extern void T444f29(GE_context* ac, T0* C, T1 a1);
/* GEANT_GELEX_TASK.no_default_attribute_name */
extern unsigned char ge56os9600;
extern T0* ge56ov9600;
extern T0* T351f11(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.set_meta_ecs */
extern void T444f28(GE_context* ac, T0* C, T1 a1);
/* GEANT_GELEX_TASK.meta_ecs_attribute_name */
extern unsigned char ge56os9599;
extern T0* ge56ov9599;
extern T0* T351f10(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.set_case_insensitive */
extern void T444f27(GE_context* ac, T0* C, T1 a1);
/* GEANT_GELEX_TASK.case_insensitive_attribute_name */
extern unsigned char ge56os9598;
extern T0* ge56ov9598;
extern T0* T351f9(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.set_full */
extern void T444f26(GE_context* ac, T0* C, T1 a1);
/* GEANT_GELEX_TASK.full_attribute_name */
extern unsigned char ge56os9597;
extern T0* ge56ov9597;
extern T0* T351f8(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.set_ecs */
extern void T444f25(GE_context* ac, T0* C, T1 a1);
/* GEANT_GELEX_TASK.ecs_attribute_name */
extern unsigned char ge56os9596;
extern T0* ge56ov9596;
extern T0* T351f7(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.set_backup */
extern void T444f24(GE_context* ac, T0* C, T1 a1);
/* GEANT_GELEX_TASK.boolean_value */
extern T1 T351f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.std */
extern T0* T351f23(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.false_attribute_value */
extern T0* T351f22(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.true_attribute_value */
extern T0* T351f21(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.string_ */
extern T0* T351f20(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.backup_attribute_name */
extern unsigned char ge56os9595;
extern T0* ge56ov9595;
extern T0* T351f5(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.set_size */
extern void T444f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.attribute_value */
extern T0* T351f17(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.project_variables_resolver */
extern T0* T351f24(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.has_attribute */
extern T1 T351f16(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.size_attribute_name */
extern unsigned char ge56os9594;
extern T0* ge56ov9594;
extern T0* T351f19(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.make */
extern void T351f37p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GELEX_TASK.make */
extern T0* T351f37p1ac1(T0* a1);
/* GEANT_GELEX_TASK.make_with_command */
extern void T351f39(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GELEX_TASK.interpreting_element_make */
extern void T351f42(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GELEX_TASK.set_project */
extern void T351f44(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.element_make */
extern void T351f43(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.set_xml_element */
extern void T351f45(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.set_command */
extern void T351f41(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.build_command */
extern void T351f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.make */
extern T0* T444c22(GE_context* ac, T0* a1);
/* GEANT_GELEX_COMMAND.make */
extern void T444f22p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.set_project */
extern void T444f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_gexace_task */
extern T0* T248f16(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.make */
extern T0* T349c35(GE_context* ac, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force_last */
extern void T123f52(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.elements_by_name */
extern T0* T349f13(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.string_ */
extern T0* T349f19(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.define_element_name */
extern unsigned char ge59os9568;
extern T0* ge59ov9568;
extern T0* T349f12(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.set_output_filename */
extern void T442f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.output_filename_attribute_name */
extern unsigned char ge59os9567;
extern T0* ge59ov9567;
extern T0* T349f11(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.set_xace_filename */
extern void T442f29(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.xace_filename_attribute_name */
extern unsigned char ge59os9566;
extern T0* ge59ov9566;
extern T0* T349f10(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.set_format */
extern void T442f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.format_attribute_name */
extern unsigned char ge59os9565;
extern T0* ge59ov9565;
extern T0* T349f9(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.set_library_command */
extern void T442f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.library_attribute_name */
extern unsigned char ge59os9564;
extern T0* ge59ov9564;
extern T0* T349f8(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.set_system_command */
extern void T442f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.attribute_value */
extern T0* T349f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.project_variables_resolver */
extern T0* T349f18(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.system_attribute_name */
extern unsigned char ge59os9563;
extern T0* ge59ov9563;
extern T0* T349f6(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.set_validate_command */
extern void T442f25(GE_context* ac, T0* C, T1 a1);
/* GEANT_GEXACE_TASK.validate_attribute_name */
extern unsigned char ge59os9562;
extern T0* ge59ov9562;
extern T0* T349f5(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.set_verbose */
extern void T442f24(GE_context* ac, T0* C, T1 a1);
/* GEANT_GEXACE_TASK.boolean_value */
extern T1 T349f17(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.std */
extern T0* T349f22(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.false_attribute_value */
extern T0* T349f21(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.true_attribute_value */
extern T0* T349f20(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.has_attribute */
extern T1 T349f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.verbose_attribute_name */
extern unsigned char ge59os9561;
extern T0* ge59ov9561;
extern T0* T349f15(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.make */
extern void T349f35p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEXACE_TASK.make */
extern T0* T349f35p1ac1(T0* a1);
/* GEANT_GEXACE_TASK.make_with_command */
extern void T349f37(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.interpreting_element_make */
extern void T349f40(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.set_project */
extern void T349f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.element_make */
extern void T349f41(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.set_xml_element */
extern void T349f43(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.set_command */
extern void T349f39(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.build_command */
extern void T349f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.make */
extern T0* T442c23(GE_context* ac, T0* a1);
/* GEANT_GEXACE_COMMAND.make */
extern void T442f23p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.set_project */
extern void T442f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_unset_task */
extern T0* T248f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_UNSET_TASK.make */
extern T0* T347c23(GE_context* ac, T0* a1, T0* a2);
/* GEANT_UNSET_COMMAND.set_name */
extern void T439f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_UNSET_TASK.attribute_value */
extern T0* T347f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_UNSET_TASK.project_variables_resolver */
extern T0* T347f9(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.has_attribute */
extern T1 T347f5(GE_context* ac, T0* C, T0* a1);
/* GEANT_UNSET_TASK.name_attribute_name */
extern unsigned char ge72os9553;
extern T0* ge72ov9553;
extern T0* T347f8(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.make */
extern void T347f23p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_UNSET_TASK.make */
extern T0* T347f23p1ac1(T0* a1);
/* GEANT_UNSET_TASK.make_with_command */
extern void T347f25(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_UNSET_TASK.interpreting_element_make */
extern void T347f28(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_UNSET_TASK.set_project */
extern void T347f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_UNSET_TASK.element_make */
extern void T347f29(GE_context* ac, T0* C, T0* a1);
/* GEANT_UNSET_TASK.set_xml_element */
extern void T347f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_UNSET_TASK.set_command */
extern void T347f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_UNSET_TASK.build_command */
extern void T347f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_UNSET_COMMAND.make */
extern T0* T439c7(GE_context* ac, T0* a1);
/* GEANT_UNSET_COMMAND.set_project */
extern void T439f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_set_task */
extern T0* T248f12(GE_context* ac, T0* C, T0* a1);
/* GEANT_SET_TASK.make */
extern T0* T345c24(GE_context* ac, T0* a1, T0* a2);
/* GEANT_SET_COMMAND.set_value */
extern void T437f15(GE_context* ac, T0* C, T0* a1);
/* GEANT_SET_TASK.value_attribute_name */
extern unsigned char ge70os9543;
extern T0* ge70ov9543;
extern T0* T345f5(GE_context* ac, T0* C);
/* GEANT_SET_COMMAND.set_name */
extern void T437f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_SET_TASK.attribute_value */
extern T0* T345f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_SET_TASK.project_variables_resolver */
extern T0* T345f10(GE_context* ac, T0* C);
/* GEANT_SET_TASK.has_attribute */
extern T1 T345f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_SET_TASK.name_attribute_name */
extern unsigned char ge70os9542;
extern T0* ge70ov9542;
extern T0* T345f9(GE_context* ac, T0* C);
/* GEANT_SET_TASK.make */
extern void T345f24p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_SET_TASK.make */
extern T0* T345f24p1ac1(T0* a1);
/* GEANT_SET_TASK.make_with_command */
extern void T345f26(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_SET_TASK.interpreting_element_make */
extern void T345f29(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_SET_TASK.set_project */
extern void T345f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_SET_TASK.element_make */
extern void T345f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_SET_TASK.set_xml_element */
extern void T345f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_SET_TASK.set_command */
extern void T345f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_SET_TASK.build_command */
extern void T345f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_SET_COMMAND.make */
extern T0* T437c13(GE_context* ac, T0* a1);
/* GEANT_SET_COMMAND.set_project */
extern void T437f16(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_lcc_task */
extern T0* T248f10(GE_context* ac, T0* C, T0* a1);
/* GEANT_LCC_TASK.make */
extern T0* T343c24(GE_context* ac, T0* a1, T0* a2);
/* GEANT_LCC_COMMAND.set_source_filename */
extern void T435f15(GE_context* ac, T0* C, T0* a1);
/* GEANT_LCC_TASK.source_filename_attribute_name */
extern unsigned char ge63os9532;
extern T0* ge63ov9532;
extern T0* T343f5(GE_context* ac, T0* C);
/* GEANT_LCC_COMMAND.set_executable */
extern void T435f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_LCC_TASK.attribute_value */
extern T0* T343f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_LCC_TASK.project_variables_resolver */
extern T0* T343f10(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.has_attribute */
extern T1 T343f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_LCC_TASK.executable_attribute_name */
extern unsigned char ge63os9531;
extern T0* ge63ov9531;
extern T0* T343f9(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.make */
extern void T343f24p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_LCC_TASK.make */
extern T0* T343f24p1ac1(T0* a1);
/* GEANT_LCC_TASK.make_with_command */
extern void T343f26(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_LCC_TASK.interpreting_element_make */
extern void T343f29(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_LCC_TASK.set_project */
extern void T343f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_LCC_TASK.element_make */
extern void T343f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_LCC_TASK.set_xml_element */
extern void T343f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_LCC_TASK.set_command */
extern void T343f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_LCC_TASK.build_command */
extern void T343f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_LCC_COMMAND.make */
extern T0* T435c13(GE_context* ac, T0* a1);
/* GEANT_LCC_COMMAND.set_project */
extern void T435f16(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_exec_task */
extern T0* T248f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXEC_TASK.make_from_interpreting_element */
extern T0* T341c22(GE_context* ac, T0* a1);
/* Creation of agent #1 in feature GEANT_EXEC_TASK.make_from_interpreting_element */
extern T0* T341f22ac1(T0* a1, T0* a2);
/* Creation of agent #2 in feature GEANT_EXEC_TASK.make_from_interpreting_element */
extern T0* T341f22ac2(T0* a1, T0* a2);
/* Creation of agent #3 in feature GEANT_EXEC_TASK.make_from_interpreting_element */
extern T0* T341f22ac3(T0* a1, T0* a2);
/* GEANT_EXEC_COMMAND.set_fileset */
extern void T428f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXEC_TASK.fileset_element_name */
extern unsigned char ge52os9518;
extern T0* ge52ov9518;
extern T0* T341f5(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.make_from_interpreting_element */
extern void T341f22p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXEC_TASK.make */
extern void T341f23(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_EXEC_TASK.make */
extern T0* T341f23ac1(T0* a1);
/* GEANT_EXEC_TASK.make_with_command */
extern void T341f25(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_EXEC_TASK.interpreting_element_make */
extern void T341f28(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_EXEC_TASK.set_project */
extern void T341f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXEC_TASK.element_make */
extern void T341f29(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXEC_TASK.set_xml_element */
extern void T341f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXEC_TASK.set_command */
extern void T341f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXEC_TASK.build_command */
extern void T341f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXEC_COMMAND.make */
extern T0* T428c13(GE_context* ac, T0* a1);
/* GEANT_EXEC_COMMAND.make */
extern void T428f13p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXEC_COMMAND.set_project */
extern void T428f15(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_ise_task */
extern T0* T248f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.make */
extern T0* T339c36(GE_context* ac, T0* a1, T0* a2);
/* GEANT_ISE_COMMAND.set_exit_code_variable_name */
extern void T425f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.attribute_value */
extern T0* T339f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.project_variables_resolver */
extern T0* T339f23(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.exit_code_variable_attribute_name */
extern unsigned char ge62os9491;
extern T0* ge62ov9491;
extern T0* T339f13(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.old_project_path_attribute_name */
extern unsigned char ge62os9490;
extern T0* ge62ov9490;
extern T0* T339f12(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.set_project_path */
extern void T425f29(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.project_path_attribute_name */
extern unsigned char ge62os9489;
extern T0* ge62ov9489;
extern T0* T339f11(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.set_finish_freezing */
extern void T425f28(GE_context* ac, T0* C, T1 a1);
/* GEANT_ISE_TASK.finish_freezing_attribute_name */
extern unsigned char ge62os9487;
extern T0* ge62ov9487;
extern T0* T339f10(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.set_finalize_mode */
extern void T425f27(GE_context* ac, T0* C, T1 a1);
/* GEANT_ISE_TASK.finalize_attribute_name */
extern unsigned char ge62os9486;
extern T0* ge62ov9486;
extern T0* T339f9(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.set_compatible_mode */
extern void T425f26(GE_context* ac, T0* C, T1 a1);
/* GEANT_ISE_TASK.boolean_value */
extern T1 T339f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.std */
extern T0* T339f22(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.false_attribute_value */
extern T0* T339f21(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.true_attribute_value */
extern T0* T339f20(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.string_ */
extern T0* T339f19(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.compatible_attribute_name */
extern unsigned char ge62os9485;
extern T0* ge62ov9485;
extern T0* T339f7(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.set_clean */
extern void T425f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.clean_attribute_name */
extern unsigned char ge62os9488;
extern T0* ge62ov9488;
extern T0* T339f6(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.set_system_name */
extern void T425f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.system_attribute_name */
extern unsigned char ge62os9484;
extern T0* ge62ov9484;
extern T0* T339f5(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.set_ace_filename */
extern void T425f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.attribute_value_or_default */
extern T0* T339f16(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.has_attribute */
extern T1 T339f15(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.ace_attribute_name */
extern unsigned char ge62os9483;
extern T0* ge62ov9483;
extern T0* T339f18(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.make */
extern void T339f36p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_ISE_TASK.make */
extern T0* T339f36p1ac1(T0* a1);
/* GEANT_ISE_TASK.make_with_command */
extern void T339f38(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.interpreting_element_make */
extern void T339f41(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.set_project */
extern void T339f43(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.element_make */
extern void T339f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.set_xml_element */
extern void T339f44(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.set_command */
extern void T339f40(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.build_command */
extern void T339f37(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_COMMAND.make */
extern T0* T425c22(GE_context* ac, T0* a1);
/* GEANT_ISE_COMMAND.set_project */
extern void T425f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_gec_task */
extern T0* T248f4(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.make */
extern T0* T333c37(GE_context* ac, T0* a1, T0* a2);
/* GEANT_GEC_COMMAND.set_exit_code_variable_name */
extern void T421f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.exit_code_variable_attribute_name */
extern unsigned char ge55os9437;
extern T0* ge55ov9437;
extern T0* T333f15(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.set_garbage_collector */
extern void T421f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.gc_attribute_name */
extern unsigned char ge55os9439;
extern T0* ge55ov9439;
extern T0* T333f14(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.set_split_size */
extern void T421f33(GE_context* ac, T0* C, T6 a1);
/* GEANT_GEC_TASK.split_size_attribute_name */
extern unsigned char ge55os9442;
extern T0* ge55ov9442;
extern T0* T333f13(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.set_split_mode */
extern void T421f32(GE_context* ac, T0* C, T1 a1);
/* GEANT_GEC_TASK.split_attribute_name */
extern unsigned char ge55os9441;
extern T0* ge55ov9441;
extern T0* T333f12(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.set_catcall_mode */
extern void T421f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.attribute_value */
extern T0* T333f11(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.project_variables_resolver */
extern T0* T333f24(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.catcall_attribute_name */
extern unsigned char ge55os9435;
extern T0* ge55ov9435;
extern T0* T333f10(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.set_gelint */
extern void T421f30(GE_context* ac, T0* C, T1 a1);
/* GEANT_GEC_TASK.gelint_attribute_name */
extern unsigned char ge55os9440;
extern T0* ge55ov9440;
extern T0* T333f9(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.set_finalize */
extern void T421f29(GE_context* ac, T0* C, T1 a1);
/* GEANT_GEC_TASK.finalize_attribute_name */
extern unsigned char ge55os9438;
extern T0* ge55ov9438;
extern T0* T333f8(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.set_c_compile */
extern void T421f28(GE_context* ac, T0* C, T1 a1);
/* GEANT_GEC_TASK.boolean_value */
extern T1 T333f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.std */
extern T0* T333f23(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.false_attribute_value */
extern T0* T333f22(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.true_attribute_value */
extern T0* T333f21(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.string_ */
extern T0* T333f20(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.c_compile_attribute_name */
extern unsigned char ge55os9434;
extern T0* ge55ov9434;
extern T0* T333f6(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.set_clean */
extern void T421f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.clean_attribute_name */
extern unsigned char ge55os9436;
extern T0* ge55ov9436;
extern T0* T333f5(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.set_ace_filename */
extern void T421f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.attribute_value_or_default */
extern T0* T333f17(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.has_attribute */
extern T1 T333f16(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.ace_attribute_name */
extern unsigned char ge55os9433;
extern T0* ge55ov9433;
extern T0* T333f19(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.make */
extern void T333f37p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEC_TASK.make */
extern T0* T333f37p1ac1(T0* a1);
/* GEANT_GEC_TASK.make_with_command */
extern void T333f39(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.interpreting_element_make */
extern void T333f42(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.set_project */
extern void T333f44(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.element_make */
extern void T333f43(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.set_xml_element */
extern void T333f45(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.set_command */
extern void T333f41(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.build_command */
extern void T333f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_COMMAND.make */
extern T0* T421c25(GE_context* ac, T0* a1);
/* GEANT_GEC_COMMAND.make */
extern void T421f25p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_COMMAND.set_project */
extern void T421f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.replace_task_name */
extern unsigned char ge79os2952;
extern T0* ge79ov2952;
extern T0* T248f53(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.input_task_name */
extern unsigned char ge79os2951;
extern T0* ge79ov2951;
extern T0* T248f51(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.available_task_name */
extern unsigned char ge79os2950;
extern T0* ge79ov2950;
extern T0* T248f49(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.precursor_task_name */
extern unsigned char ge79os2949;
extern T0* ge79ov2949;
extern T0* T248f47(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.exit_task_name */
extern unsigned char ge79os2948;
extern T0* ge79ov2948;
extern T0* T248f45(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.outofdate_task_name */
extern unsigned char ge79os2947;
extern T0* ge79ov2947;
extern T0* T248f43(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.xslt_task_name */
extern unsigned char ge79os2946;
extern T0* ge79ov2946;
extern T0* T248f41(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.setenv_task_name */
extern unsigned char ge79os2945;
extern T0* ge79ov2945;
extern T0* T248f39(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.move_task_name */
extern unsigned char ge79os2944;
extern T0* ge79ov2944;
extern T0* T248f37(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.copy_task_name */
extern unsigned char ge79os2943;
extern T0* ge79ov2943;
extern T0* T248f35(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.delete_task_name */
extern unsigned char ge79os2942;
extern T0* ge79ov2942;
extern T0* T248f33(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.mkdir_task_name */
extern unsigned char ge79os2941;
extern T0* ge79ov2941;
extern T0* T248f31(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.echo_task_name */
extern unsigned char ge79os2940;
extern T0* ge79ov2940;
extern T0* T248f29(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.geant_task_name */
extern unsigned char ge79os2939;
extern T0* ge79ov2939;
extern T0* T248f27(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.getest_task_name */
extern unsigned char ge79os2938;
extern T0* ge79ov2938;
extern T0* T248f25(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.gepp_task_name */
extern unsigned char ge79os2937;
extern T0* ge79ov2937;
extern T0* T248f23(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.geyacc_task_name */
extern unsigned char ge79os2936;
extern T0* ge79ov2936;
extern T0* T248f21(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.gelex_task_name */
extern unsigned char ge79os2935;
extern T0* ge79ov2935;
extern T0* T248f19(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.gexace_task_name */
extern unsigned char ge79os2934;
extern T0* ge79ov2934;
extern T0* T248f17(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.unset_task_name */
extern unsigned char ge79os2933;
extern T0* ge79ov2933;
extern T0* T248f15(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.set_task_name */
extern unsigned char ge79os2932;
extern T0* ge79ov2932;
extern T0* T248f13(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.lcc_task_name */
extern unsigned char ge79os2931;
extern T0* ge79ov2931;
extern T0* T248f11(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.exec_task_name */
extern unsigned char ge79os2930;
extern T0* ge79ov2930;
extern T0* T248f9(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.ise_task_name */
extern unsigned char ge79os2929;
extern T0* ge79ov2929;
extern T0* T248f7(GE_context* ac, T0* C);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].force_new */
extern void T332f37(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].key_storage_put */
extern void T332f45(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].item_storage_put */
extern void T332f44(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].force */
extern void T419f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].fill_with */
extern void T416f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].extend */
extern void T416f8(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].slots_put */
extern void T332f43(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].clashes_put */
extern void T332f42(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].resize */
extern void T332f41(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].clashes_resize */
extern void T332f50(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].special_integer_ */
extern T0* T332f32(GE_context* ac, T0* C);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].key_storage_resize */
extern void T332f49(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].item_storage_resize */
extern void T332f48(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].aliased_resized_area */
extern T0* T419f1(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].aliased_resized_area */
extern T0* T416f4(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].slots_resize */
extern void T332f47(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].new_modulus */
extern T6 T332f25(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].new_capacity */
extern T6 T332f34(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].unset_found_item */
extern void T332f40(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.gec_task_name */
extern unsigned char ge79os2928;
extern T0* ge79ov2928;
extern T0* T248f5(GE_context* ac, T0* C);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].set_key_equality_tester */
extern void T332f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.string_equality_tester */
extern T0* T248f3(GE_context* ac, T0* C);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_map */
extern T0* T332c35(GE_context* ac, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_with_equality_testers */
extern void T332f39(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_sparse_container */
extern void T332f46(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].set_internal_cursor */
extern void T332f55(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].new_cursor */
extern T0* T332f31(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make */
extern T0* T420c4(GE_context* ac, T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_slots */
extern void T332f54(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_clashes */
extern void T332f53(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_key_storage */
extern void T332f52(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_item_storage */
extern void T332f51(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].make */
extern T0* T419f2(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].make_empty */
extern T0* T416c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].default_create */
extern T0* T419c3(GE_context* ac);
/* GEANT_PROJECT.set_options */
extern void T29f45(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT.set_variables */
extern void T29f44(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.element_make */
extern void T37f21(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.set_xml_element */
extern void T37f24(GE_context* ac, T0* C, T0* a1);
/* XM_TREE_CALLBACKS_PIPE.document */
extern T0* T140f8(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.is_correct */
extern T1 T139f120(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.parse_from_stream */
extern void T139f207(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.parse_with_events */
extern void T139f212(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.on_finish */
extern void T139f218(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.parse */
extern void T139f217(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yy_pop_last_value */
extern void T139f227(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.yy_push_error_value */
extern void T139f226(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yy_do_action */
extern void T139f225(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.on_notation_declaration */
extern void T139f255(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_notation_declaration */
extern void T193f8(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.set_public */
extern void T203f5(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].aliased_resized_area */
extern T0* T202f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_EXTERNAL_ID].aliased_resized_area */
extern T0* T204f4(GE_context* ac, T0* C, T6 a1);
/* XM_DTD_EXTERNAL_ID.set_system */
extern void T203f4(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_dtd_external_id */
extern T0* T139f174(GE_context* ac, T0* C);
/* XM_DTD_EXTERNAL_ID.make */
extern T0* T203c3(GE_context* ac);
/* XM_EIFFEL_PARSER.when_pe_entity_declared */
extern void T139f254(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].force_new */
extern void T189f38(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_put */
extern void T189f52(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_put */
extern void T189f51(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].force */
extern void T291f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].fill_with */
extern void T287f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].extend */
extern void T287f10(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_put */
extern void T189f50(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_put */
extern void T189f49(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_item */
extern T6 T189f28(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].hash_position */
extern T6 T189f27(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_item */
extern T6 T189f26(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].resize */
extern void T189f48(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_resize */
extern void T189f57(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].special_integer_ */
extern T0* T189f33(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_resize */
extern void T189f56(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_resize */
extern void T189f55(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].aliased_resized_area */
extern T0* T291f1(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].aliased_resized_area */
extern T0* T287f4(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_item */
extern T0* T189f23(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_resize */
extern void T189f54(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_modulus */
extern T6 T189f29(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_capacity */
extern T6 T189f24(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].unset_found_item */
extern void T189f43(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].has */
extern T1 T189f31(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].search_position */
extern void T189f40(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_def */
extern T0* T226c210(GE_context* ac, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_literal */
extern void T226f212(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.default_create */
extern T0* T191c3(GE_context* ac);
/* XM_EIFFEL_PE_ENTITY_DEF.make_scanner */
extern void T226f213(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T226f215(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset_sent */
extern void T226f218(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T226f215p1(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T226f215p0(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T226f215p2(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T226f215p3(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.make_with_buffer */
extern void T226f214(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_load_input_buffer */
extern void T226f217(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_content */
extern void T226f220(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_initialize */
extern void T226f216(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_initialize */
extern void T226f216p1(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_build_tables */
extern void T226f219(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template */
extern unsigned char ge1523os7817;
extern T0* ge1523ov7817;
extern T0* T226f54(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_fixed_array */
extern T0* T226f58(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_meta_template */
extern unsigned char ge1523os7816;
extern T0* ge1523ov7816;
extern T0* T226f52(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_ec_template */
extern unsigned char ge1523os7815;
extern T0* ge1523ov7815;
extern T0* T226f93(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template */
extern unsigned char ge1523os7814;
extern T0* ge1523ov7814;
extern T0* T226f71(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template */
extern unsigned char ge1523os7813;
extern T0* ge1523ov7813;
extern T0* T226f61(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template */
extern unsigned char ge1523os7806;
extern T0* ge1523ov7806;
extern T0* T226f55(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_6 */
extern void T226f232(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_array_subcopy */
extern void T226f233(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* KL_ARRAY_ROUTINES [INTEGER_32].subcopy */
extern void T328f2(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* ARRAY [INTEGER_32].subcopy */
extern void T265f13(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER_32].copy_data */
extern void T95f13(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER_32].force */
extern void T95f9(GE_context* ac, T0* C, T6 a1, T6 a2);
/* SPECIAL [INTEGER_32].move_data */
extern void T95f12(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].overlapping_move */
extern void T95f15(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].non_overlapping_move */
extern void T95f14(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* XM_EIFFEL_PE_ENTITY_DEF.integer_array_ */
extern unsigned char ge122os3373;
extern T0* ge122ov3373;
extern T0* T226f59(GE_context* ac, T0* C);
/* KL_ARRAY_ROUTINES [INTEGER_32].default_create */
extern T0* T328c1(GE_context* ac);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_5 */
extern void T226f231(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_4 */
extern void T226f230(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_3 */
extern void T226f229(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_2 */
extern void T226f228(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_1 */
extern void T226f227(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template */
extern unsigned char ge1523os7799;
extern T0* ge1523ov7799;
extern T0* T226f51(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_6 */
extern void T226f226(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_5 */
extern void T226f225(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_4 */
extern void T226f224(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_3 */
extern void T226f223(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_2 */
extern void T226f222(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_1 */
extern void T226f221(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.special_integer_ */
extern T0* T226f56(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.empty_buffer */
extern T0* T226f53(GE_context* ac, T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.make */
extern T0* T278c8(GE_context* ac);
/* XM_EIFFEL_PE_ENTITY_DEF.make_external */
extern void T226f211(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.new_external_entity */
extern T0* T139f173(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.make_external */
extern T0* T223c209(GE_context* ac, T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_scanner */
extern void T223f210(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T223f212(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T223f212p1(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T223f212p0(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T223f212p2(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.make_with_buffer */
extern void T223f211(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_load_input_buffer */
extern void T223f214(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_content */
extern void T223f216(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_initialize */
extern void T223f213(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_initialize */
extern void T223f213p1(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_build_tables */
extern void T223f215(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template */
extern T0* T223f52(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_fixed_array */
extern T0* T223f56(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_meta_template */
extern T0* T223f50(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_ec_template */
extern T0* T223f90(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template */
extern T0* T223f69(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template */
extern T0* T223f59(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template */
extern T0* T223f53(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_6 */
extern void T223f228(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_array_subcopy */
extern void T223f229(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_ENTITY_DEF.integer_array_ */
extern T0* T223f57(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_5 */
extern void T223f227(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_4 */
extern void T223f226(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_3 */
extern void T223f225(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_2 */
extern void T223f224(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_1 */
extern void T223f223(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template */
extern T0* T223f49(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_6 */
extern void T223f222(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_5 */
extern void T223f221(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_4 */
extern void T223f220(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_3 */
extern void T223f219(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_2 */
extern void T223f218(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_1 */
extern void T223f217(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.special_integer_ */
extern T0* T223f70(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.empty_buffer */
extern T0* T223f65(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.on_entity_declaration */
extern void T139f253(GE_context* ac, T0* C, T0* a1, T1 a2, T0* a3, T0* a4, T0* a5);
/* XM_DTD_CALLBACKS_NULL.on_entity_declaration */
extern void T193f7(GE_context* ac, T0* C, T0* a1, T1 a2, T0* a3, T0* a4, T0* a5);
/* XM_EIFFEL_PARSER.when_entity_declared */
extern void T139f252(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.new_literal_entity */
extern T0* T139f172(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_literal */
extern T0* T223c208(GE_context* ac, T0* a1, T0* a2);
/* XM_DTD_ATTRIBUTE_CONTENT.set_default_value */
extern void T212f26(GE_context* ac, T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_fixed */
extern void T212f25(GE_context* ac, T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_implied */
extern void T212f24(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_required */
extern void T212f23(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].aliased_resized_area */
extern T0* T214f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].aliased_resized_area */
extern T0* T216f4(GE_context* ac, T0* C, T6 a1);
/* DS_BILINKED_LIST [STRING_8].force_last */
extern void T215f11(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [STRING_8].put_right */
extern void T300f5(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [STRING_8].attach_left */
extern void T300f6(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [STRING_8].make */
extern T0* T300c4(GE_context* ac, T0* a1);
/* XM_EIFFEL_PARSER.new_string_bilinked_list */
extern T0* T139f169(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [STRING_8].set_equality_tester */
extern void T215f12(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.string_equality_tester */
extern T0* T139f184(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [STRING_8].make */
extern T0* T215c10(GE_context* ac);
/* DS_BILINKED_LIST [STRING_8].set_internal_cursor */
extern void T215f13(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].new_cursor */
extern T0* T215f6(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].make */
extern T0* T299c8(GE_context* ac, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].force */
extern void T214f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].fill_with */
extern void T216f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].extend */
extern void T216f10(GE_context* ac, T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration_list */
extern void T212f22(GE_context* ac, T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration */
extern void T212f27(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.default_enumeration_list */
extern unsigned char ge1433os8638;
extern T0* ge1433ov8638;
extern T0* T212f11(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_notation */
extern void T212f21(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_token */
extern void T212f20(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_entity */
extern void T212f19(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_list_type */
extern void T212f18(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id_ref */
extern void T212f17(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id */
extern void T212f16(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_data */
extern void T212f15(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content */
extern T0* T139f168(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].aliased_resized_area */
extern T0* T211f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].aliased_resized_area */
extern T0* T213f4(GE_context* ac, T0* C, T6 a1);
/* XM_DTD_ATTRIBUTE_CONTENT.make */
extern T0* T212c12(GE_context* ac);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].force */
extern void T211f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].fill_with */
extern void T213f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].extend */
extern void T213f10(GE_context* ac, T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.copy_default */
extern void T212f14(GE_context* ac, T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_implied */
extern T1 T212f10(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_required */
extern T1 T212f9(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.has_default_value */
extern T1 T212f8(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_fixed */
extern T1 T212f7(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_name */
extern void T212f13(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].force */
extern void T208f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].fill_with */
extern void T210f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].extend */
extern void T210f10(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].aliased_resized_area */
extern T0* T208f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].aliased_resized_area */
extern T0* T210f4(GE_context* ac, T0* C, T6 a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].force_last */
extern void T209f8(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].put_right */
extern void T297f5(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].attach_left */
extern void T297f6(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T297c4(GE_context* ac, T0* a1);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content_list */
extern T0* T139f166(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T209c7(GE_context* ac);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].set_internal_cursor */
extern void T209f9(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].new_cursor */
extern T0* T209f5(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T296c8(GE_context* ac, T0* a1);
/* XM_EIFFEL_PARSER.on_attribute_declarations */
extern void T139f251(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].forth */
extern void T296f10(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_forth */
extern void T209f11(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].add_traversing_cursor */
extern void T209f12(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set_next_cursor */
extern void T296f12(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].remove_traversing_cursor */
extern void T209f13(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set */
extern void T296f11(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* XM_EIFFEL_PARSER.on_attribute_declaration */
extern void T139f261(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_DTD_CALLBACKS_NULL.on_attribute_declaration */
extern void T193f9(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].item */
extern T0* T296f6(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].start */
extern void T296f9(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_start */
extern void T209f10(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_off */
extern T1 T209f6(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].off */
extern T1 T296f7(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_more */
extern void T206f11(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_mixed */
extern T0* T206c10(GE_context* ac);
/* XM_DTD_ELEMENT_CONTENT.set_content_mixed */
extern void T206f21(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_choice */
extern void T206f19(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_list */
extern void T206f16(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_default */
extern void T206f22(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one */
extern void T206f12(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_sequence */
extern void T206f20(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T295c6(GE_context* ac);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].set_internal_cursor */
extern void T295f9(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].new_cursor */
extern T0* T295f5(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T404c3(GE_context* ac, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_sequence */
extern T0* T206c9(GE_context* ac);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_last */
extern void T295f8(GE_context* ac, T0* C, T0* a1);
/* attached DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].put_right */
extern void T405f5(GE_context* ac, T0* C, T0* a1);
/* attached DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].attach_left */
extern void T405f6(GE_context* ac, T0* C, T0* a1);
/* attached DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T405c4(GE_context* ac, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_choice */
extern T0* T206c8(GE_context* ac);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_first */
extern void T295f7(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.element_name */
extern T0* T139f161(GE_context* ac, T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_name */
extern T0* T206c15(GE_context* ac, T0* a1);
/* XM_EIFFEL_PARSER.set_element_repetition */
extern void T139f250(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_one */
extern void T206f14(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one_or_more */
extern void T206f13(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_any */
extern T0* T206c7(GE_context* ac);
/* XM_DTD_ELEMENT_CONTENT.set_content_any */
extern void T206f18(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].force */
extern void T205f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].fill_with */
extern void T207f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].extend */
extern void T207f10(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].aliased_resized_area */
extern T0* T205f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].aliased_resized_area */
extern T0* T207f4(GE_context* ac, T0* C, T6 a1);
/* XM_DTD_ELEMENT_CONTENT.make_empty */
extern T0* T206c6(GE_context* ac);
/* XM_DTD_ELEMENT_CONTENT.set_content_empty */
extern void T206f17(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.on_element_declaration */
extern void T139f249(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_element_declaration */
extern void T193f6(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_attribute */
extern void T139f248(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].has */
extern T1 T200f30(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].search_position */
extern void T200f33(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].hash_position */
extern T6 T200f24(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.hash_code */
extern T6 T197f16(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.item */
extern T0* T197f17(GE_context* ac, T0* C, T6 a1);
/* DS_BILINKED_LIST [STRING_8].item */
extern T0* T215f8(GE_context* ac, T0* C, T6 a1);
/* detachable KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].test */
extern T1 T293f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_storage_item */
extern T0* T200f19(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_item */
extern T0* T200f29(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_item */
extern T6 T200f23(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_equality_tester */
extern T0* T200f17(GE_context* ac, T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_item */
extern T6 T200f25(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].force */
extern void T199f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].fill_with */
extern void T201f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].extend */
extern void T201f10(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].aliased_resized_area */
extern T0* T199f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].aliased_resized_area */
extern T0* T201f4(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].force_new */
extern void T200f32(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_put */
extern void T200f39(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_put */
extern void T200f38(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_put */
extern void T200f37(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].resize */
extern void T200f36(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_resize */
extern void T200f48(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].special_integer_ */
extern T0* T200f28(GE_context* ac, T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_storage_resize */
extern void T200f47(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_resize */
extern void T200f46(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_resize */
extern void T200f45(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_modulus */
extern T6 T200f20(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_capacity */
extern T6 T200f26(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].unset_found_item */
extern void T200f35(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.new_name_set */
extern T0* T139f154(GE_context* ac, T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_equal */
extern T0* T200c31(GE_context* ac, T6 a1);
/* detachable KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T293c2(GE_context* ac);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make */
extern void T200f34(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].set_internal_cursor */
extern void T200f44(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_cursor */
extern T0* T200f21(GE_context* ac, T0* C);
/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME].make */
extern T0* T294c4(GE_context* ac, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_slots */
extern void T200f43(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_clashes */
extern void T200f42(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_key_storage */
extern void T200f41(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_item_storage */
extern void T200f40(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].make */
extern T0* T196f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].make_empty */
extern T0* T198c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T196c3(GE_context* ac);
/* XM_EIFFEL_PARSER.on_start_tag */
extern void T139f247(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER.on_end_tag */
extern void T139f246(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER_NAME.local_part */
extern T0* T197f11(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].forth */
extern void T299f10(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [STRING_8].cursor_forth */
extern void T215f15(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].add_traversing_cursor */
extern void T215f16(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T299f12(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].remove_traversing_cursor */
extern void T215f17(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].set */
extern void T299f11(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [STRING_8].item */
extern T0* T299f6(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].start */
extern void T299f9(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [STRING_8].cursor_start */
extern void T215f14(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].cursor_off */
extern T1 T215f9(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].off */
extern T1 T299f7(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.string_ */
extern T0* T197f10(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.last */
extern T0* T197f9(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [STRING_8].last */
extern T0* T215f7(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.ns_prefix */
extern T0* T197f8(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.is_namespace_name */
extern T1 T197f7(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern void T197f18(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern T0* T197c18(GE_context* ac);
/* XM_EIFFEL_PARSER_NAME.new_string_bilinked_list */
extern T0* T197f15(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.string_equality_tester */
extern T0* T197f14(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.on_start_tag_finish */
extern void T139f245(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.is_equal */
extern T1 T197f6(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.same_string */
extern T1 T197f13(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_SPECIAL_ROUTINES [BOOLEAN].force */
extern void T217f6(GE_context* ac, T0* C, T0* a1, T1 a2, T6 a3);
/* KL_SPECIAL_ROUTINES [BOOLEAN].aliased_resized_area */
extern T0* T217f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [BOOLEAN].aliased_resized_area */
extern T0* T96f4(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.when_external_dtd */
extern void T139f244(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern T0* T224c201(GE_context* ac);
/* XM_EIFFEL_SCANNER_DTD.set_start_condition */
extern void T224f208(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern void T224f201p1(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T224f210(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T224f210p1(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T224f210p0(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_with_buffer */
extern void T224f209(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_load_input_buffer */
extern void T224f220(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_content */
extern void T224f221(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_initialize */
extern void T224f219(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_initialize */
extern void T224f219p1(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_build_tables */
extern void T224f224(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template */
extern T0* T224f195(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_fixed_array */
extern T0* T224f198(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_meta_template */
extern T0* T224f194(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_ec_template */
extern T0* T224f193(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template */
extern T0* T224f192(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template */
extern T0* T224f191(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template */
extern T0* T224f190(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_6 */
extern void T224f236(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_array_subcopy */
extern void T224f237(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_SCANNER_DTD.integer_array_ */
extern T0* T224f200(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_5 */
extern void T224f235(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_4 */
extern void T224f234(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_3 */
extern void T224f233(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_2 */
extern void T224f232(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_1 */
extern void T224f231(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template */
extern T0* T224f189(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_6 */
extern void T224f230(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_5 */
extern void T224f229(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_4 */
extern void T224f228(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_3 */
extern void T224f227(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_2 */
extern void T224f226(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_1 */
extern void T224f225(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.special_integer_ */
extern T0* T224f62(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.empty_buffer */
extern T0* T224f50(GE_context* ac, T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].force */
extern void T187f8(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.null_resolver */
extern unsigned char ge1521os6627;
extern T0* ge1521ov6627;
extern T0* T139f94(GE_context* ac, T0* C);
/* XM_NULL_EXTERNAL_RESOLVER.last_error */
extern T0* T191f1(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.resolve_external_id */
extern void T139f260(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.resolve */
extern void T191f5(GE_context* ac, T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_public */
extern void T191f4(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].force */
extern void T202f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_DTD_EXTERNAL_ID].fill_with */
extern void T204f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_EXTERNAL_ID].extend */
extern void T204f10(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_dtd_end */
extern void T139f243(GE_context* ac, T0* C);
/* XM_DTD_CALLBACKS_NULL.on_dtd_end */
extern void T193f5(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.on_doctype */
extern void T139f242(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* XM_DTD_CALLBACKS_NULL.on_doctype */
extern void T193f4(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* XM_EIFFEL_DECLARATION.set_encoding */
extern void T219f9(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_DECLARATION.set_stand_alone */
extern void T219f8(GE_context* ac, T0* C, T1 a1);
/* XM_EIFFEL_DECLARATION.set_version */
extern void T219f11(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].force */
extern void T218f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_EIFFEL_DECLARATION].fill_with */
extern void T220f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_DECLARATION].extend */
extern void T220f10(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].aliased_resized_area */
extern T0* T218f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_DECLARATION].aliased_resized_area */
extern T0* T220f4(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_DECLARATION.make */
extern T0* T219c7(GE_context* ac);
/* XM_EIFFEL_DECLARATION.process */
extern void T219f10(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_xml_declaration */
extern void T139f264(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* XM_EIFFEL_PARSER.apply_encoding */
extern void T139f241(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_content */
extern void T139f240(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_dtd_processing_instruction */
extern void T139f239(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_dtd_processing_instruction */
extern void T193f3(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_processing_instruction */
extern void T139f238(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_dtd_comment */
extern void T139f237(GE_context* ac, T0* C, T0* a1);
/* XM_DTD_CALLBACKS_NULL.on_dtd_comment */
extern void T193f2(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_comment */
extern void T139f236(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.entity_referenced_in_entity_value */
extern T0* T139f144(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.defined_entity_referenced */
extern T0* T139f196(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.external_entity_to_string */
extern T0* T139f202(GE_context* ac, T0* C, T0* a1);
/* STRING_8.remove */
extern void T17f54(GE_context* ac, T0* C, T6 a1);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_finish */
extern void T191f6(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.read_string */
extern void T268f29(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_INPUT_STREAM.last_character */
extern T2 T268f19(GE_context* ac, T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].item */
extern T2 T392f4(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.end_of_input */
extern T1 T268f18(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.end_of_input */
extern T1 T97f31(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.read_character */
extern void T268f31(GE_context* ac, T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].remove */
extern void T392f6(GE_context* ac, T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].wipe_out */
extern void T392f8(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.noqueue_read_character */
extern void T268f33(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf16_read_character */
extern void T268f35(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.append_character */
extern void T268f36(GE_context* ac, T0* C, T6 a1);
/* DS_LINKED_QUEUE [CHARACTER_8].force */
extern void T392f7(GE_context* ac, T0* C, T2 a1);
/* detachable DS_LINKABLE [CHARACTER_8].put_right */
extern void T486f4(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [CHARACTER_8].make */
extern T0* T486c3(GE_context* ac, T2 a1);
/* UC_UTF8_ROUTINES.append_code_to_utf8 */
extern void T266f37(GE_context* ac, T0* C, T0* a1, T6 a2);
/* UC_UTF8_ROUTINES.integer_ */
extern T0* T266f29(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf8 */
extern T0* T268f22(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf8_buffer */
extern unsigned char ge1516os9071;
extern T0* ge1516ov9071;
extern T0* T268f25(GE_context* ac, T0* C);
/* UC_UTF16_ROUTINES.surrogate */
extern T6 T393f7(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_low_surrogate */
extern T1 T393f6(GE_context* ac, T0* C, T6 a1);
/* UC_UTF16_ROUTINES.least_10_bits */
extern T6 T393f5(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_high_surrogate */
extern T1 T393f4(GE_context* ac, T0* C, T6 a1);
/* UC_UTF16_ROUTINES.is_surrogate */
extern T1 T393f3(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16 */
extern unsigned char ge218os6074;
extern T0* ge218ov6074;
extern T0* T268f20(GE_context* ac, T0* C);
/* UC_UTF16_ROUTINES.default_create */
extern T0* T393c16(GE_context* ac);
/* XM_EIFFEL_INPUT_STREAM.least_significant */
extern T6 T268f24(GE_context* ac, T0* C, T2 a1, T2 a2);
/* XM_EIFFEL_INPUT_STREAM.most_significant */
extern T6 T268f23(GE_context* ac, T0* C, T2 a1, T2 a2);
/* XM_EIFFEL_INPUT_STREAM.latin1_read_character */
extern void T268f34(GE_context* ac, T0* C);
/* KL_STRING_INPUT_STREAM.read_character */
extern void T413f10(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.read_character */
extern void T97f72(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.old_read_character */
extern void T97f73(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.file_gc */
extern T2 T97f34(GE_context* ac, T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.old_end_of_file */
extern T1 T97f33(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.file_feof */
extern T1 T97f35(GE_context* ac, T0* C, T14 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16_detect_read_character */
extern void T268f32(GE_context* ac, T0* C);
/* UC_UTF8_ROUTINES.is_endian_detection_character */
extern T1 T266f31(GE_context* ac, T0* C, T2 a1, T2 a2, T2 a3);
/* UC_UTF8_ROUTINES.is_endian_detection_character_start */
extern T1 T266f30(GE_context* ac, T0* C, T2 a1, T2 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_least_first */
extern T1 T393f2(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_most_first */
extern T1 T393f1(GE_context* ac, T0* C, T6 a1, T6 a2);
/* KL_STRING_ROUTINES.wipe_out */
extern void T116f21(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.string_ */
extern T0* T268f17(GE_context* ac, T0* C);
/* KL_PLATFORM.maximum_integer */
extern unsigned char ge201os9132;
extern T6 ge201ov9132;
extern T6 T270f2(GE_context* ac, T0* C);
/* KL_INTEGER_ROUTINES.platform */
extern T0* T269f1(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.integer_ */
extern T0* T139f203(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.make_from_stream */
extern T0* T268c28(GE_context* ac, T0* a1);
/* DS_LINKED_QUEUE [CHARACTER_8].make */
extern T0* T392c5(GE_context* ac);
/* XM_NULL_EXTERNAL_RESOLVER.last_stream */
extern T0* T191f2(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item */
extern T0* T189f21(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_item */
extern T0* T189f35(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.force_error */
extern void T139f235(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.report_error */
extern void T139f233(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_error */
extern void T139f259(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.setup_error_state */
extern void T139f258(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.onstring_utf8 */
extern T0* T139f133(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.maximum_item_code */
extern T6 T139f191(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_latin1 */
extern T1 T139f190(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_from_utf8 */
extern T0* T139f186(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.make_from_utf8 */
extern T0* T267c58(GE_context* ac, T0* a1);
/* UC_UTF8_STRING.append_utf8 */
extern void T267f72(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_ROUTINES.valid_utf8 */
extern T1 T266f1(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_ROUTINES.is_encoded_next_byte */
extern T1 T266f10(GE_context* ac, T0* C, T2 a1);
/* UC_UTF8_ROUTINES.is_encoded_second_byte */
extern T1 T266f5(GE_context* ac, T0* C, T2 a1, T2 a2);
/* UC_UTF8_ROUTINES.is_encoded_first_byte */
extern T1 T266f2(GE_context* ac, T0* C, T2 a1);
/* XM_EIFFEL_PARSER.utf8 */
extern T0* T139f189(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.is_string_mode_ascii */
extern T1 T139f187(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.onstring_ascii */
extern T0* T139f131(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_unicode */
extern T1 T139f185(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string */
extern T0* T139f142(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_string */
extern unsigned char ge1521os6694;
extern T0* ge1521ov6694;
extern T0* T139f195(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_uc */
extern unsigned char ge1521os6695;
extern T0* ge1521ov6695;
extern T0* T139f194(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_empty */
extern T0* T139f201(GE_context* ac, T0* C);
/* UC_UTF8_STRING.make_empty */
extern T0* T267c62(GE_context* ac);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].force */
extern void T196f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].fill_with */
extern void T198f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].extend */
extern void T198f10(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].aliased_resized_area */
extern T0* T196f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].aliased_resized_area */
extern T0* T198f4(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.namespace_force_last */
extern void T139f234(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER_NAME.force_last */
extern void T197f19(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.can_force_last */
extern T1 T197f12(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_namespace_name */
extern T0* T139f141(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.make_namespaces */
extern T0* T197c20(GE_context* ac);
/* XM_EIFFEL_PARSER.yy_push_last_value */
extern void T139f224(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.accept */
extern void T139f223(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yy_do_error_action */
extern void T139f221(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.report_eof_expected_error */
extern void T139f232(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.read_token */
extern void T139f220(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.process_attribute_entity */
extern void T139f231(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_entity_scanner */
extern void T139f257(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_start_condition */
extern void T223f231(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_start_condition */
extern void T226f235(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.apply_input_buffer */
extern void T223f230(GE_context* ac, T0* C);
/* KL_STRING_INPUT_STREAM.make */
extern T0* T413c9(GE_context* ac, T0* a1);
/* UC_UTF8_ROUTINES.to_utf8 */
extern T0* T266f32(GE_context* ac, T0* C, T0* a1);
extern T1 T266f32ot1(T0* a1, T0** a2);
/* XM_EIFFEL_ENTITY_DEF.utf8 */
extern T0* T223f68(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.fatal_error */
extern void T223f238(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.apply_input_buffer */
extern void T226f234(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.utf8 */
extern T0* T226f70(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.fatal_error */
extern void T226f242(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.is_literal */
extern T1 T223f63(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.is_external */
extern T1 T223f66(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_literal */
extern T1 T226f65(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_external */
extern T1 T226f68(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.process_entity */
extern void T139f230(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_pe_entity */
extern void T139f229(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.special_integer_ */
extern T0* T139f124(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yy_init_value_stacks */
extern void T139f219(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yy_clear_all */
extern void T139f228(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.clear_all */
extern void T139f256(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.clear_stacks */
extern void T139f262(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yy_clear_value_stacks */
extern void T139f263(GE_context* ac, T0* C);
/* SPECIAL [XM_EIFFEL_DECLARATION].keep_head */
extern void T220f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_DECLARATION].set_count */
extern void T220f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [BOOLEAN].keep_head */
extern void T96f12(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [BOOLEAN].set_count */
extern void T96f13(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].keep_head */
extern void T216f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].set_count */
extern void T216f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].keep_head */
extern void T213f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].set_count */
extern void T213f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].keep_head */
extern void T210f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].set_count */
extern void T210f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].keep_head */
extern void T207f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].set_count */
extern void T207f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].keep_head */
extern void T204f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].set_count */
extern void T204f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].keep_head */
extern void T201f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].set_count */
extern void T201f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].keep_head */
extern void T198f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].set_count */
extern void T198f9(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.abort */
extern void T139f222(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.on_start */
extern void T139f216(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.reset_error_state */
extern void T139f215(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.reset */
extern void T139f211(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].wipe_out */
extern void T189f37(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_wipe_out */
extern void T189f47(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_wipe_out */
extern void T189f46(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_wipe_out */
extern void T189f45(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_wipe_out */
extern void T189f44(GE_context* ac, T0* C);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].keep_head */
extern void T287f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].set_count */
extern void T287f9(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].move_all_cursors_after */
extern void T189f42(GE_context* ac, T0* C);
/* detachable DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].set_next_cursor */
extern void T290f8(GE_context* ac, T0* C, T0* a1);
/* detachable DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].set_after */
extern void T290f7(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.make_scanner */
extern void T139f209(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.make_scanner */
extern T0* T183c199(GE_context* ac);
/* XM_EIFFEL_SCANNER.reset */
extern void T183f207(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.reset */
extern void T183f207p1(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.reset */
extern void T183f207p0(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.make_with_buffer */
extern void T183f206(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_load_input_buffer */
extern void T183f215(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_set_content */
extern void T183f216(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_initialize */
extern void T183f214(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_initialize */
extern void T183f214p1(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_build_tables */
extern void T183f222(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_accept_template */
extern T0* T183f193(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_fixed_array */
extern T0* T183f196(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_meta_template */
extern T0* T183f192(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_ec_template */
extern T0* T183f191(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_def_template */
extern T0* T183f190(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_base_template */
extern T0* T183f189(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template */
extern T0* T183f188(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_6 */
extern void T183f234(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_array_subcopy */
extern void T183f235(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_SCANNER.integer_array_ */
extern T0* T183f198(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_5 */
extern void T183f233(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_4 */
extern void T183f232(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_3 */
extern void T183f231(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_2 */
extern void T183f230(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_1 */
extern void T183f229(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template */
extern T0* T183f187(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_nxt_template_6 */
extern void T183f228(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_5 */
extern void T183f227(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_4 */
extern void T183f226(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_3 */
extern void T183f225(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_2 */
extern void T183f224(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_1 */
extern void T183f223(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.special_integer_ */
extern T0* T183f51(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.empty_buffer */
extern T0* T183f70(GE_context* ac, T0* C);
/* GEANT_PROJECT_PARSER.make */
extern T0* T98c8(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.enable_position_table */
extern void T143f10(GE_context* ac, T0* C, T0* a1);
/* XM_POSITION_TABLE.make */
extern T0* T147c4(GE_context* ac);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T241c7(GE_context* ac);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].set_internal_cursor */
extern void T241f8(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.set_callbacks */
extern void T139f206(GE_context* ac, T0* C, T0* a1);
/* XM_TREE_CALLBACKS_PIPE.make */
extern T0* T140c10(GE_context* ac);
/* XM_TREE_CALLBACKS_PIPE.callbacks_pipe */
extern T0* T140f9(GE_context* ac, T0* C, T0* a1);
/* ARRAY [XM_CALLBACKS_FILTER].item */
extern T0* T229f4(GE_context* ac, T0* C, T6 a1);
/* XM_CALLBACKS_TO_TREE_FILTER.make_null */
extern T0* T143c9(GE_context* ac);
/* XM_CALLBACKS_TO_TREE_FILTER.make_next */
extern void T143f11(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.initialize */
extern void T143f12(GE_context* ac, T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_equal */
extern T0* T230c31(GE_context* ac, T6 a1);
/* detachable KL_EQUALITY_TESTER [XM_NAMESPACE].default_create */
extern T0* T304c2(GE_context* ac);
/* DS_HASH_SET [XM_NAMESPACE].make */
extern void T230f32(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].set_internal_cursor */
extern void T230f38(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].new_cursor */
extern T0* T230f24(GE_context* ac, T0* C);
/* DS_HASH_SET_CURSOR [XM_NAMESPACE].make */
extern T0* T305c4(GE_context* ac, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].unset_found_item */
extern void T230f37(GE_context* ac, T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_slots */
extern void T230f36(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_modulus */
extern T6 T230f21(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_clashes */
extern void T230f35(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_key_storage */
extern void T230f34(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_item_storage */
extern void T230f33(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].make */
extern T0* T306f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_NAMESPACE].make_empty */
extern T0* T307c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].default_create */
extern T0* T306c3(GE_context* ac);
/* XM_DOCUMENT.make */
extern T0* T144c10(GE_context* ac);
/* XM_DOCUMENT.make_with_root_named */
extern void T144f11(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_DOCUMENT.force_last */
extern void T144f12(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].force_last */
extern void T232f12(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].force_last */
extern void T232f12p1(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_DOCUMENT_NODE].put_right */
extern void T308f4(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_DOCUMENT_NODE].make */
extern T0* T308c3(GE_context* ac, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].before_addition */
extern void T232f14(GE_context* ac, T0* C, T0* a1);
/* XM_DOCUMENT.before_addition */
extern void T144f13(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.equality_delete */
extern void T145f27(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].remove */
extern void T236f14(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].remove_at_cursor */
extern void T239f17(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].move_all_cursors */
extern void T239f24(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].set_current_cell */
extern void T236f18(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_ELEMENT_NODE].put */
extern void T330f6(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_ELEMENT_NODE].put_right */
extern void T330f4(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].set_last_cell */
extern void T239f23(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_ELEMENT_NODE].forget_right */
extern void T330f5(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].remove_last */
extern void T239f22(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].move_last_cursors_after */
extern void T239f27(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].wipe_out */
extern void T239f25(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].move_all_cursors_after */
extern void T239f28(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].is_last */
extern T1 T236f7(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].cursor_is_last */
extern T1 T239f10(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].remove_first */
extern void T239f21(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].set_first_cell */
extern void T239f26(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].is_first */
extern T1 T236f6(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].cursor_is_first */
extern T1 T239f9(GE_context* ac, T0* C, T0* a1);
/* XM_DOCUMENT.equality_delete */
extern void T144f14(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].forth */
extern void T271f13(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_forth */
extern void T232f17(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].add_traversing_cursor */
extern void T232f18(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].set_next_cursor */
extern void T271f16(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].remove_traversing_cursor */
extern void T232f23(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].set */
extern void T271f15(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].remove */
extern void T271f12(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].remove_at_cursor */
extern void T232f16(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].move_all_cursors */
extern void T232f22(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].set_current_cell */
extern void T271f17(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_DOCUMENT_NODE].put */
extern void T308f6(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].set_last_cell */
extern void T232f21(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_DOCUMENT_NODE].forget_right */
extern void T308f5(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].remove_last */
extern void T232f20(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].move_last_cursors_after */
extern void T232f26(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].set_after */
extern void T271f18(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].wipe_out */
extern void T232f24(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].move_all_cursors_after */
extern void T232f27(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].is_last */
extern T1 T271f7(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_is_last */
extern T1 T232f10(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].remove_first */
extern void T232f19(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].set_first_cell */
extern void T232f25(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].is_first */
extern T1 T271f6(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_is_first */
extern T1 T232f9(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].item */
extern T0* T271f8(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].start */
extern void T271f11(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_start */
extern void T232f15(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_off */
extern T1 T232f8(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].off */
extern T1 T271f9(GE_context* ac, T0* C);
/* XM_DOCUMENT.new_cursor */
extern T0* T144f7(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].new_cursor */
extern T0* T232f5(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].make */
extern T0* T271c10(GE_context* ac, T0* a1);
/* XM_DOCUMENT.last */
extern T0* T144f6(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].last */
extern T0* T232f7(GE_context* ac, T0* C);
/* XM_DOCUMENT.is_empty */
extern T1 T144f5(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].is_empty */
extern T1 T232f6(GE_context* ac, T0* C);
/* XM_ELEMENT.make */
extern T0* T145c23(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].make */
extern T0* T239c11(GE_context* ac);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].set_internal_cursor */
extern void T239f12(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].make */
extern T0* T232c11(GE_context* ac);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].set_internal_cursor */
extern void T232f13(GE_context* ac, T0* C, T0* a1);
/* XM_DOCUMENT.default_ns */
extern unsigned char ge1476os7319;
extern T0* ge1476ov7319;
extern T0* T144f3(GE_context* ac, T0* C);
/* XM_NAMESPACE.make_default */
extern T0* T231c7(GE_context* ac);
/* XM_NAMESPACE.make */
extern void T231f8(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE.make */
extern T0* T231c8(GE_context* ac, T0* a1, T0* a2);
/* XM_CALLBACKS_TO_TREE_FILTER.null_callbacks */
extern T0* T143f7(GE_context* ac, T0* C);
/* XM_CALLBACKS_NULL.make */
extern T0* T188c1(GE_context* ac);
/* XM_TREE_CALLBACKS_PIPE.new_stop_on_error */
extern T0* T140f7(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.make_null */
extern T0* T146c5(GE_context* ac);
/* XM_STOP_ON_ERROR_FILTER.make_next */
extern void T146f6(GE_context* ac, T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.initialize */
extern void T146f7(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.null_callbacks */
extern T0* T146f4(GE_context* ac, T0* C);
/* XM_TREE_CALLBACKS_PIPE.new_namespace_resolver */
extern T0* T140f6(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.make_null */
extern T0* T227c26(GE_context* ac);
/* XM_NAMESPACE_RESOLVER.make_next */
extern void T227f37(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.initialize */
extern void T227f38(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_make */
extern void T227f42(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.new_string_queue */
extern T0* T227f20(GE_context* ac, T0* C);
/* DS_LINKED_QUEUE [STRING_8].make */
extern T0* T303c6(GE_context* ac);
/* XM_NAMESPACE_RESOLVER_CONTEXT.make */
extern T0* T301c10(GE_context* ac);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T408c8(GE_context* ac);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].set_internal_cursor */
extern void T408f11(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].new_cursor */
extern T0* T408f6(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T409c8(GE_context* ac, T0* a1);
/* XM_NAMESPACE_RESOLVER.null_callbacks */
extern T0* T227f13(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.set_string_mode_mixed */
extern void T139f205(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.make */
extern T0* T139c204(GE_context* ac);
/* XM_EIFFEL_PARSER.new_entities_table */
extern T0* T139f91(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].set_key_equality_tester */
extern void T189f39(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_map_default */
extern T0* T189c36(GE_context* ac);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_map */
extern void T189f41(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_with_equality_testers */
extern void T189f53(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_sparse_container */
extern void T189f58(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].set_internal_cursor */
extern void T189f63(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_cursor */
extern T0* T189f34(GE_context* ac, T0* C);
/* detachable DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T290c6(GE_context* ac, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_slots */
extern void T189f62(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_clashes */
extern void T189f61(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_key_storage */
extern void T189f60(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_item_storage */
extern void T189f59(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T291f2(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].make_empty */
extern T0* T287c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].default_create */
extern T0* T291c3(GE_context* ac);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].default_capacity */
extern T6 T189f30(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.make_parser */
extern void T139f210(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yy_build_parser_tables */
extern void T139f214(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yycheck_template */
extern unsigned char ge1517os6573;
extern T0* ge1517ov6573;
extern T0* T139f88(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yyfixed_array */
extern T0* T139f183(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytable_template */
extern unsigned char ge1517os6572;
extern T0* ge1517ov6572;
extern T0* T139f86(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yypgoto_template */
extern unsigned char ge1517os6571;
extern T0* ge1517ov6571;
extern T0* T139f84(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yypact_template */
extern unsigned char ge1517os6570;
extern T0* ge1517ov6570;
extern T0* T139f129(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yydefgoto_template */
extern unsigned char ge1517os6569;
extern T0* ge1517ov6569;
extern T0* T139f127(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yydefact_template */
extern unsigned char ge1517os6568;
extern T0* ge1517ov6568;
extern T0* T139f125(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yytypes2_template */
extern unsigned char ge1517os6567;
extern T0* ge1517ov6567;
extern T0* T139f123(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yytypes1_template */
extern unsigned char ge1517os6566;
extern T0* ge1517ov6566;
extern T0* T139f121(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yyr1_template */
extern unsigned char ge1517os6565;
extern T0* ge1517ov6565;
extern T0* T139f119(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yytranslate_template */
extern unsigned char ge1517os6564;
extern T0* ge1517ov6564;
extern T0* T139f106(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yy_create_value_stacks */
extern void T139f213(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].make */
extern T0* T218f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_DECLARATION].make_empty */
extern T0* T220c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].default_create */
extern T0* T218c3(GE_context* ac);
/* KL_SPECIAL_ROUTINES [BOOLEAN].make */
extern T0* T217f1(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].default_create */
extern T0* T217c5(GE_context* ac);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].make */
extern T0* T214f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].make_empty */
extern T0* T216c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].default_create */
extern T0* T214c3(GE_context* ac);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T211f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make_empty */
extern T0* T213c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].default_create */
extern T0* T211c3(GE_context* ac);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T208f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make_empty */
extern T0* T210c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].default_create */
extern T0* T208c3(GE_context* ac);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T205f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].make_empty */
extern T0* T207c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].default_create */
extern T0* T205c3(GE_context* ac);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].make */
extern T0* T202f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].make_empty */
extern T0* T204c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].default_create */
extern T0* T202c3(GE_context* ac);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T199f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make_empty */
extern T0* T201c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].default_create */
extern T0* T199c3(GE_context* ac);
/* XM_EIFFEL_PARSER.initialize */
extern void T139f208(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.null_dtd_callbacks */
extern T0* T139f112(GE_context* ac, T0* C);
/* XM_DTD_CALLBACKS_NULL.make */
extern T0* T193c1(GE_context* ac);
/* XM_EIFFEL_PARSER.null_callbacks */
extern T0* T139f104(GE_context* ac, T0* C);
/* XM_EXPAT_PARSER_FACTORY.new_expat_parser */
extern T0* T137f2(GE_context* ac, T0* C);
/* XM_EXPAT_PARSER_FACTORY.is_expat_parser_available */
extern T1 T137f1(GE_context* ac, T0* C);
/* XM_EXPAT_PARSER_FACTORY.default_create */
extern T0* T137c3(GE_context* ac);
/* KL_TEXT_INPUT_FILE.is_open_read */
extern T1 T97f28(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_read */
extern T1 T97f19(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T97f62(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.is_closed */
extern T1 T97f25(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.old_open_read */
extern void T97f68(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T97f68p1(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.file_open */
extern T14 T97f29(GE_context* ac, T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.old_is_readable */
extern T1 T97f24(GE_context* ac, T0* C);
/* FILE_INFO.is_readable */
extern T1 T119f10(GE_context* ac, T0* C);
/* FILE_INFO.file_eaccess */
extern T1 T119f7(GE_context* ac, T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.make */
extern void T97f60(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.make */
extern T0* T97c60(GE_context* ac, T0* a1);
/* KL_TEXT_INPUT_FILE.make */
extern void T97f60p1(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.old_make */
extern void T97f66(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.make_with_name */
extern void T97f69(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.set_name */
extern void T97f71(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.string_ */
extern T0* T97f22(GE_context* ac, T0* C);
/* GEANT_PROJECT_LOADER.make */
extern T0* T30c9(GE_context* ac, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_file_readable */
extern T1 T92f2(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.is_readable */
extern T1 T97f13(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.is_file_readable */
extern T1 T93f2(GE_context* ac, T0* C, T0* a1);
/* GEANT.default_build_filename */
extern unsigned char ge2os1954;
extern T0* ge2ov1954;
extern T0* T22f8(GE_context* ac, T0* C);
/* GEANT_PROJECT_OPTIONS.set_no_exec */
extern void T31f8(GE_context* ac, T0* C, T1 a1);
/* GEANT_PROJECT_OPTIONS.set_debug_mode */
extern void T31f7(GE_context* ac, T0* C, T1 a1);
/* GEANT_PROJECT_OPTIONS.set_verbose */
extern void T31f6(GE_context* ac, T0* C, T1 a1);
/* GEANT_PROJECT_OPTIONS.make */
extern T0* T31c5(GE_context* ac);
/* GEANT_PROJECT_VARIABLES.make */
extern T0* T32c58(GE_context* ac);
/* GEANT_PROJECT_VARIABLES.verbose_name */
extern unsigned char ge8os2422;
extern T0* ge8ov2422;
extern T0* T32f38(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.exe_name */
extern unsigned char ge8os2421;
extern T0* ge8ov2421;
extern T0* T32f35(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.path_separator_name */
extern unsigned char ge8os2420;
extern T0* ge8ov2420;
extern T0* T32f34(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.is_unix_name */
extern unsigned char ge8os2419;
extern T0* ge8ov2419;
extern T0* T32f30(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.is_windows_name */
extern unsigned char ge8os2418;
extern T0* ge8ov2418;
extern T0* T32f29(GE_context* ac, T0* C);
/* GEANT_VARIABLES.value */
extern T0* T36f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.default_builtin_variables */
extern unsigned char ge10os1960;
extern T0* ge10ov1960;
extern T0* T32f25(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.file_system */
extern T0* T32f40(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.unix_file_system */
extern T0* T32f43(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.windows_file_system */
extern T0* T32f42(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.operating_system */
extern T0* T32f39(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.gobo_os_name */
extern unsigned char ge8os2417;
extern T0* ge8ov2417;
extern T0* T32f24(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.project_variables_resolver */
extern T0* T32f23(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.make */
extern void T32f58p1(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.set_key_equality_tester */
extern void T32f61(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.make_map */
extern void T32f60(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_with_equality_testers */
extern void T32f63(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* GEANT_PROJECT_VARIABLES.make_sparse_container */
extern void T32f71(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.set_internal_cursor */
extern void T32f80(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.new_cursor */
extern T0* T32f36(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.unset_found_item */
extern void T32f64(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.make_slots */
extern void T32f79(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.new_modulus */
extern T6 T32f31(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_clashes */
extern void T32f78(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_key_storage */
extern void T32f77(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_item_storage */
extern void T32f76(GE_context* ac, T0* C, T6 a1);
/* GEANT.default_builtin_variables */
extern T0* T22f9(GE_context* ac, T0* C);
/* GEANT.file_system */
extern T0* T22f17(GE_context* ac, T0* C);
/* GEANT.unix_file_system */
extern T0* T22f19(GE_context* ac, T0* C);
/* GEANT.windows_file_system */
extern T0* T22f18(GE_context* ac, T0* C);
/* GEANT.operating_system */
extern T0* T22f16(GE_context* ac, T0* C);
/* GEANT.read_command_line */
extern void T22f21(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].first */
extern T0* T111f14(GE_context* ac, T0* C);
/* GEANT_VARIABLES.force */
extern void T36f48(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.key_storage_put */
extern void T36f57(GE_context* ac, T0* C, T0* a1, T6 a2);
/* GEANT_VARIABLES.slots_put */
extern void T36f56(GE_context* ac, T0* C, T6 a1, T6 a2);
/* GEANT_VARIABLES.clashes_put */
extern void T36f55(GE_context* ac, T0* C, T6 a1, T6 a2);
/* GEANT_VARIABLES.resize */
extern void T36f54(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.clashes_resize */
extern void T36f62(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.special_integer_ */
extern T0* T36f28(GE_context* ac, T0* C);
/* GEANT_VARIABLES.key_storage_resize */
extern void T36f61(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.item_storage_resize */
extern void T36f60(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.slots_resize */
extern void T36f59(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.new_capacity */
extern T6 T36f23(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.item_storage_put */
extern void T36f53(GE_context* ac, T0* C, T0* a1, T6 a2);
/* GEANT.commandline_variables */
extern T0* T22f12(GE_context* ac, T0* C);
/* AP_PARSER.final_error_action */
extern void T45f28(GE_context* ac, T0* C);
/* AP_PARSER.exceptions */
extern T0* T45f13(GE_context* ac, T0* C);
/* AP_ERROR_HANDLER.report_error_message */
extern void T52f9(GE_context* ac, T0* C, T0* a1);
/* AP_ERROR_HANDLER.report_error_message */
extern void T52f9p1(GE_context* ac, T0* C, T0* a1);
/* AP_ERROR_HANDLER.report_error */
extern void T52f8(GE_context* ac, T0* C, T0* a1);
/* AP_ERROR_HANDLER.message */
extern T0* T52f6(GE_context* ac, T0* C, T0* a1);
/* AP_ERROR.default_message */
extern T0* T47f17(GE_context* ac, T0* C);
/* AP_ERROR.message */
extern T0* T47f18(GE_context* ac, T0* C, T0* a1);
/* AP_ERROR.arguments */
extern unsigned char ge202os1982;
extern T0* ge202ov1982;
extern T0* T47f20(GE_context* ac, T0* C);
/* KL_ARGUMENTS.make */
extern T0* T34c5(GE_context* ac);
/* KL_ARGUMENTS.argument */
extern T0* T34f2(GE_context* ac, T0* C, T6 a1);
/* IMMUTABLE_STRING_32.as_string_8 */
extern T0* T125f6(GE_context* ac, T0* C);
/* ARGUMENTS_32.argument */
extern T0* T124f1(GE_context* ac, T0* C, T6 a1);
/* ARRAY [IMMUTABLE_STRING_32].item */
extern T0* T180f5(GE_context* ac, T0* C, T6 a1);
/* ARGUMENTS_32.internal_argument_array */
extern unsigned char ge2301os6301;
extern T0* ge2301ov6301;
extern T0* T124f3(GE_context* ac, T0* C);
/* ARRAY [IMMUTABLE_STRING_32].put */
extern void T180f8(GE_context* ac, T0* C, T0* a1, T6 a2);
/* ARGUMENTS_32.i_th_argument_string */
extern T0* T124f4(GE_context* ac, T0* C, T6 a1);
/* IMMUTABLE_STRING_32.make_from_string */
extern T0* T125c14(GE_context* ac, T0* a1);
/* STRING_32.area_lower */
extern T6 T18f6(GE_context* ac, T0* C);
/* NATIVE_STRING.set_shared_from_pointer */
extern void T181f10(GE_context* ac, T0* C, T14 a1);
/* NATIVE_STRING.set_shared_from_pointer_and_count */
extern void T181f13(GE_context* ac, T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.set_from_pointer */
extern void T118f17(GE_context* ac, T0* C, T14 a1, T6 a2);
/* ARGUMENTS_32.default_pointer */
extern T14 T124f6(GE_context* ac, T0* C);
/* ARRAY [IMMUTABLE_STRING_32].compare_objects */
extern void T180f7(GE_context* ac, T0* C);
/* ARRAY [IMMUTABLE_STRING_32].make_filled */
extern T0* T180c6(GE_context* ac, T0* a1, T6 a2, T6 a3);
/* ARRAY [IMMUTABLE_STRING_32].make_filled_area */
extern void T180f9(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [IMMUTABLE_STRING_32].make_filled */
extern T0* T179c4(GE_context* ac, T0* a1, T6 a2);
/* SPECIAL [IMMUTABLE_STRING_32].fill_with */
extern void T179f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [IMMUTABLE_STRING_32].extend */
extern void T179f8(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [IMMUTABLE_STRING_32].make_empty */
extern void T179f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [IMMUTABLE_STRING_32].make_empty */
extern T0* T179c6(GE_context* ac, T6 a1);
/* IMMUTABLE_STRING_32.make_empty */
extern T0* T125c13(GE_context* ac);
/* IMMUTABLE_STRING_32.make */
extern void T125f15(GE_context* ac, T0* C, T6 a1);
/* IMMUTABLE_STRING_32.make */
extern T0* T125c15(GE_context* ac, T6 a1);
/* KL_ARGUMENTS.internal_arguments */
extern unsigned char ge2300os3023;
extern T0* ge2300ov3023;
extern T0* T34f3(GE_context* ac, T0* C);
/* ARGUMENTS_32.default_create */
extern T0* T124c7(GE_context* ac);
/* ARRAY [STRING_8].valid_index */
extern T1 T40f5(GE_context* ac, T0* C, T6 a1);
/* AP_ERROR.string_ */
extern T0* T47f19(GE_context* ac, T0* C);
/* AP_ERROR.make_invalid_parameter_error */
extern T0* T47c21(GE_context* ac, T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.force */
extern void T41f47(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.search_position */
extern void T41f51(GE_context* ac, T0* C, T0* a1);
/* GEANT.set_show_target_info */
extern void T22f27(GE_context* ac, T0* C, T1 a1);
/* AP_STRING_OPTION.parameter */
extern T0* T44f14(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].last */
extern T0* T111f8(GE_context* ac, T0* C);
/* GEANT.set_debug_mode */
extern void T22f26(GE_context* ac, T0* C, T1 a1);
/* GEANT.set_no_exec */
extern void T22f25(GE_context* ac, T0* C, T1 a1);
/* GEANT.set_verbose */
extern void T22f24(GE_context* ac, T0* C, T1 a1);
/* GEANT.report_version_number */
extern void T22f23(GE_context* ac, T0* C);
/* UT_ERROR_HANDLER.report_info */
extern void T35f8(GE_context* ac, T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_info_message */
extern void T35f9(GE_context* ac, T0* C, T0* a1);
/* UT_VERSION_NUMBER.make */
extern T0* T56c8(GE_context* ac, T0* a1);
/* AP_PARSER.parse_arguments */
extern void T45f27(GE_context* ac, T0* C);
/* AP_PARSER.parse_list */
extern void T45f30(GE_context* ac, T0* C, T0* a1);
/* AP_PARSER.check_options_after_parsing */
extern void T45f33(GE_context* ac, T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.forth */
extern void T43f17(GE_context* ac, T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_forth */
extern void T43f19(GE_context* ac, T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.add_traversing_cursor */
extern void T43f20(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [AP_OPTION].set_next_cursor */
extern void T109f9(GE_context* ac, T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.remove_traversing_cursor */
extern void T43f21(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [AP_OPTION].set */
extern void T109f8(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* DS_ARRAYED_LIST [AP_OPTION].forth */
extern void T114f20(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_forth */
extern void T114f24(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].set_position */
extern void T153f10(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].add_traversing_cursor */
extern void T114f25(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].set_next_cursor */
extern void T153f11(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].remove_traversing_cursor */
extern void T114f26(GE_context* ac, T0* C, T0* a1);
/* AP_ERROR.make_surplus_option_error */
extern T0* T47c23(GE_context* ac, T0* a1);
/* AP_ERROR.make_missing_option_error */
extern T0* T47c22(GE_context* ac, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.item_for_iteration */
extern T0* T43f6(GE_context* ac, T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_item */
extern T0* T43f8(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].item_for_iteration */
extern T0* T114f7(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_item */
extern T0* T114f11(GE_context* ac, T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.after */
extern T1 T43f5(GE_context* ac, T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_after */
extern T1 T43f7(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].after */
extern T1 T114f9(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_after */
extern T1 T114f10(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].after */
extern T1 T153f5(GE_context* ac, T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.start */
extern void T43f16(GE_context* ac, T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_start */
extern void T43f18(GE_context* ac, T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_off */
extern T1 T43f9(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [AP_OPTION].off */
extern T1 T109f6(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].start */
extern void T114f19(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_start */
extern void T114f23(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].set_after */
extern void T153f9(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].is_empty */
extern T1 T114f15(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].off */
extern T1 T153f7(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].before */
extern T1 T153f6(GE_context* ac, T0* C);
/* AP_PARSER.parse_argument */
extern void T45f32(GE_context* ac, T0* C, T0* a1);
/* AP_PARSER.parse_short */
extern void T45f35(GE_context* ac, T0* C, T0* a1);
/* AP_ERROR.make_missing_parameter_error */
extern T0* T47c25(GE_context* ac, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].off */
extern T1 T111f7(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].cursor_off */
extern T1 T111f12(GE_context* ac, T0* C, T0* a1);
/* AP_ERROR.make_unknown_option_error */
extern T0* T47c24(GE_context* ac, T0* a1);
/* CHARACTER_8.out */
extern T0* T2f1(GE_context* ac, T2* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].forth */
extern void T115f17(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_forth */
extern void T115f21(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].set_position */
extern void T157f10(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].add_traversing_cursor */
extern void T115f22(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].set_next_cursor */
extern void T157f11(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].remove_traversing_cursor */
extern void T115f23(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].item_for_iteration */
extern T0* T115f6(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_item */
extern T0* T115f11(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].after */
extern T1 T115f7(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_after */
extern T1 T115f8(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].after */
extern T1 T157f5(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].start */
extern void T115f16(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_start */
extern void T115f20(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].set_after */
extern void T157f9(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].is_empty */
extern T1 T115f13(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].off */
extern T1 T157f7(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].before */
extern T1 T157f6(GE_context* ac, T0* C);
/* AP_PARSER.parse_long */
extern void T45f34(GE_context* ac, T0* C, T0* a1);
/* AP_ERROR.make_unnecessary_parameter_error */
extern T0* T47c26(GE_context* ac, T0* a1, T0* a2);
/* AP_PARSER.string_ */
extern T0* T45f22(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].forth */
extern void T111f25(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].item_for_iteration */
extern T0* T111f18(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].after */
extern T1 T111f13(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].cursor_after */
extern T1 T111f10(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].start */
extern void T111f24(GE_context* ac, T0* C);
/* AP_PARSER.reset_parser */
extern void T45f31(GE_context* ac, T0* C);
/* AP_PARSER.all_options */
extern T0* T45f16(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].has */
extern T1 T114f8(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].make */
extern T0* T114c17(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].set_internal_cursor */
extern void T114f21(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].new_cursor */
extern T0* T114f12(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].make */
extern T0* T153c8(GE_context* ac, T0* a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].make */
extern T0* T156f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [AP_OPTION].make_empty */
extern T0* T155c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].default_create */
extern T0* T156c3(GE_context* ac);
/* AP_ERROR_HANDLER.reset */
extern void T52f10(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].force */
extern void T111f23(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_ARGUMENTS.argument_count */
extern T6 T34f4(GE_context* ac, T0* C);
/* AP_PARSER.arguments */
extern T0* T45f11(GE_context* ac, T0* C);
/* AP_STRING_OPTION.make */
extern T0* T44c25(GE_context* ac, T2 a1, T0* a2);
/* AP_STRING_OPTION.set_long_form */
extern void T44f29(GE_context* ac, T0* C, T0* a1);
/* AP_STRING_OPTION.set_short_form */
extern void T44f27(GE_context* ac, T0* C, T2 a1);
/* AP_STRING_OPTION.initialize */
extern void T44f26(GE_context* ac, T0* C);
/* AP_STRING_OPTION.initialize */
extern void T44f26p1(GE_context* ac, T0* C);
/* AP_STRING_OPTION.initialize */
extern void T44f26p0(GE_context* ac, T0* C);
/* AP_FLAG.make */
extern T0* T42c19(GE_context* ac, T2 a1, T0* a2);
/* AP_FLAG.set_long_form */
extern void T42f21(GE_context* ac, T0* C, T0* a1);
/* AP_FLAG.set_short_form */
extern void T42f23(GE_context* ac, T0* C, T2 a1);
/* AP_FLAG.initialize */
extern void T42f20(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].force_last */
extern void T115f15(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].force */
extern void T159f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].fill_with */
extern void T158f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].extend */
extern void T158f8(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].resize */
extern void T115f19(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].aliased_resized_area */
extern T0* T159f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].aliased_resized_area */
extern T0* T158f4(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].new_capacity */
extern T6 T115f12(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].extendible */
extern T1 T115f10(GE_context* ac, T0* C, T6 a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.make */
extern T0* T43c11(GE_context* ac, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.old_make */
extern void T43f14(GE_context* ac, T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.set_internal_cursor */
extern void T43f15(GE_context* ac, T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.new_cursor */
extern T0* T43f10(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [AP_OPTION].make */
extern T0* T109c7(GE_context* ac, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.set_parameters_description */
extern void T43f13(GE_context* ac, T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.set_introduction_option */
extern void T43f12(GE_context* ac, T0* C, T0* a1);
/* AP_FLAG.set_description */
extern void T42f18(GE_context* ac, T0* C, T0* a1);
/* AP_FLAG.make_with_long_form */
extern T0* T42c17(GE_context* ac, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].force_last */
extern void T114f18(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].force */
extern void T156f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [AP_OPTION].fill_with */
extern void T155f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [AP_OPTION].extend */
extern void T155f8(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].resize */
extern void T114f22(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].aliased_resized_area */
extern T0* T156f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [AP_OPTION].aliased_resized_area */
extern T0* T155f4(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].new_capacity */
extern T6 T114f14(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].extendible */
extern T1 T114f13(GE_context* ac, T0* C, T6 a1);
/* AP_STRING_OPTION.set_parameter_description */
extern void T44f24(GE_context* ac, T0* C, T0* a1);
/* AP_STRING_OPTION.set_description */
extern void T44f23(GE_context* ac, T0* C, T0* a1);
/* AP_STRING_OPTION.make_with_short_form */
extern T0* T44c22(GE_context* ac, T2 a1);
/* AP_PARSER.set_parameters_description */
extern void T45f26(GE_context* ac, T0* C, T0* a1);
/* AP_PARSER.set_application_description */
extern void T45f25(GE_context* ac, T0* C, T0* a1);
/* AP_PARSER.make */
extern T0* T45c24(GE_context* ac);
/* AP_DISPLAY_HELP_FLAG.set_description */
extern void T113f36(GE_context* ac, T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.make */
extern T0* T113c35(GE_context* ac, T2 a1, T0* a2);
/* AP_DISPLAY_HELP_FLAG.set_long_form */
extern void T113f39(GE_context* ac, T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.set_short_form */
extern void T113f38(GE_context* ac, T0* C, T2 a1);
/* AP_DISPLAY_HELP_FLAG.initialize */
extern void T113f37(GE_context* ac, T0* C);
/* AP_PARSER.make_empty */
extern void T45f29(GE_context* ac, T0* C);
/* AP_ERROR_HANDLER.make_standard */
extern T0* T52c7(GE_context* ac);
/* AP_ERROR_HANDLER.std */
extern T0* T52f5(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T115c14(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].set_internal_cursor */
extern void T115f18(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].new_cursor */
extern T0* T115f9(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T157c8(GE_context* ac, T0* a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T159f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].make_empty */
extern T0* T158c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].default_create */
extern T0* T159c3(GE_context* ac);
/* UT_ERROR_HANDLER.make_standard */
extern T0* T35c7(GE_context* ac);
/* UT_ERROR_HANDLER.std */
extern T0* T35f4(GE_context* ac, T0* C);
/* KL_ARGUMENTS.set_program_name */
extern void T34f6(GE_context* ac, T0* C, T0* a1);
/* GEANT.arguments */
extern T0* T22f10(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.set_exception_data */
extern void T19f15(GE_context* ac, T0* C, T6 a1, T1 a2, T6 a3, T6 a4, T0* a5, T0* a6, T0* a7, T0* a8, T0* a9, T0* a10, T6 a11, T1 a12);
/* ISE_EXCEPTION_MANAGER.exception_from_data */
extern T0* T19f7(GE_context* ac, T0* C);
extern T1 T19f7ot1(T0* a1, T0** a2);
extern T1 T19f7ot2(T0* a1, T0** a2);
extern T1 T19f7ot3(T0* a1, T0** a2);
extern T1 T19f7ot4(T0* a1, T0** a2);
extern T1 T19f7ot5(T0* a1, T0** a2);
extern T1 T19f7ot6(T0* a1, T0** a2);
extern T1 T19f7ot7(T0* a1, T0** a2);
/* COM_FAILURE.set_exception_information */
extern void T69f16(GE_context* ac, T0* C, T0* a1);
/* COM_FAILURE.ccom_hresult_code */
extern T6 T69f10(GE_context* ac, T0* C, T6 a1);
/* COM_FAILURE.print */
extern void T69f21(GE_context* ac, T0* C, T0* a1);
/* STD_FILES.put_string */
extern void T177f5(GE_context* ac, T0* C, T0* a1);
/* CONSOLE.put_string */
extern void T327f13(GE_context* ac, T0* C, T0* a1);
/* CONSOLE.console_ps */
extern void T327f16(GE_context* ac, T0* C, T14 a1, T14 a2, T6 a3);
/* STD_FILES.standard_default */
extern T0* T177f2(GE_context* ac, T0* C);
/* STD_FILES.output */
extern unsigned char ge2371os7693;
extern T0* ge2371ov7693;
extern T0* T177f3(GE_context* ac, T0* C);
/* CONSOLE.make_open_stdout */
extern T0* T327c11(GE_context* ac, T0* a1);
/* CONSOLE.set_write_mode */
extern void T327f15(GE_context* ac, T0* C);
/* CONSOLE.console_def */
extern T14 T327f6(GE_context* ac, T0* C, T6 a1);
/* CONSOLE.make_with_name */
extern void T327f14(GE_context* ac, T0* C, T0* a1);
/* CONSOLE.default_pointer */
extern T14 T327f9(GE_context* ac, T0* C);
/* CONSOLE.set_name */
extern void T327f17(GE_context* ac, T0* C, T0* a1);
/* CONSOLE.buffered_file_info */
extern T0* T327f10(GE_context* ac, T0* C);
/* COM_FAILURE.io */
extern unsigned char ge2299os44;
extern T0* ge2299ov44;
extern T0* T69f12(GE_context* ac, T0* C);
/* STD_FILES.set_output_default */
extern void T177f6(GE_context* ac, T0* C);
/* STD_FILES.default_create */
extern T0* T177c4(GE_context* ac);
/* COM_FAILURE.ccom_hresult */
extern T6 T69f9(GE_context* ac, T0* C, T14 a1);
/* COM_FAILURE.ccom_hresult_to_string */
extern T0* T69f11(GE_context* ac, T0* C, T6 a1);
/* INTEGER_32.to_hex_string */
extern T0* T6f19(GE_context* ac, T6* C);
/* COM_FAILURE.set_hresult_code */
extern void T69f15(GE_context* ac, T0* C, T6 a1);
/* OPERATING_SYSTEM_FAILURE.set_error_code */
extern void T68f9(GE_context* ac, T0* C, T6 a1);
/* IO_FAILURE.set_error_code */
extern void T67f11(GE_context* ac, T0* C, T6 a1);
/* OPERATING_SYSTEM_SIGNAL_FAILURE.set_signal_code */
extern void T66f9(GE_context* ac, T0* C, T6 a1);
/* INVARIANT_VIOLATION.set_is_entry */
extern void T65f9(GE_context* ac, T0* C, T1 a1);
/* ROUTINE_FAILURE.set_class_name */
extern void T60f10(GE_context* ac, T0* C, T0* a1);
/* ROUTINE_FAILURE.set_routine_name */
extern void T60f9(GE_context* ac, T0* C, T0* a1);
/* ISE_EXCEPTION_MANAGER.exception_from_code */
extern T0* T19f10(GE_context* ac, T0* C, T6 a1);
/* SERIALIZATION_FAILURE.default_create */
extern T0* T89c6(GE_context* ac);
/* OLD_VIOLATION.default_create */
extern T0* T62c6(GE_context* ac);
/* COM_FAILURE.default_create */
extern T0* T69c13(GE_context* ac);
/* ADDRESS_APPLIED_TO_MELTED_FEATURE.default_create */
extern T0* T88c6(GE_context* ac);
/* MISMATCH_FAILURE.default_create */
extern T0* T86c6(GE_context* ac);
/* OPERATING_SYSTEM_FAILURE.default_create */
extern T0* T68c7(GE_context* ac);
/* IO_FAILURE.set_code */
extern void T67f9(GE_context* ac, T0* C, T6 a1);
/* IO_FAILURE.default_create */
extern T0* T67c8(GE_context* ac);
/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE.default_create */
extern T0* T85c6(GE_context* ac);
/* VOID_ASSIGNED_TO_EXPANDED.default_create */
extern T0* T84c6(GE_context* ac);
/* EXTERNAL_FAILURE.default_create */
extern T0* T83c6(GE_context* ac);
/* CREATE_ON_DEFERRED.default_create */
extern T0* T82c6(GE_context* ac);
/* RESUMPTION_FAILURE.default_create */
extern T0* T81c6(GE_context* ac);
/* RESCUE_FAILURE.default_create */
extern T0* T80c6(GE_context* ac);
/* EIFFEL_RUNTIME_PANIC.set_code */
extern void T70f9(GE_context* ac, T0* C, T6 a1);
/* EIFFEL_RUNTIME_PANIC.code */
extern T6 T70f7(GE_context* ac, T0* C);
/* EIFFEL_RUNTIME_PANIC.default_create */
extern T0* T70c8(GE_context* ac);
/* OPERATING_SYSTEM_SIGNAL_FAILURE.default_create */
extern T0* T66c7(GE_context* ac);
/* LOOP_INVARIANT_VIOLATION.default_create */
extern T0* T79c6(GE_context* ac);
/* VARIANT_VIOLATION.default_create */
extern T0* T78c6(GE_context* ac);
/* BAD_INSPECT_VALUE.default_create */
extern T0* T77c6(GE_context* ac);
/* ROUTINE_FAILURE.default_create */
extern T0* T60c8(GE_context* ac);
/* CHECK_VIOLATION.default_create */
extern T0* T76c6(GE_context* ac);
/* INVARIANT_VIOLATION.default_create */
extern T0* T65c7(GE_context* ac);
/* FLOATING_POINT_FAILURE.default_create */
extern T0* T75c6(GE_context* ac);
/* POSTCONDITION_VIOLATION.default_create */
extern T0* T74c6(GE_context* ac);
/* PRECONDITION_VIOLATION.default_create */
extern T0* T73c6(GE_context* ac);
/* NO_MORE_MEMORY.set_code */
extern void T64f10(GE_context* ac, T0* C, T6 a1);
/* NO_MORE_MEMORY.code */
extern T6 T64f7(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.no_memory_exception_object_cell */
extern unsigned char ge2584os1922;
extern T0* ge2584ov1922;
extern T0* T19f6(GE_context* ac, T0* C);
/* CELL [NO_MORE_MEMORY].put */
extern T0* T26c2(GE_context* ac, T0* a1);
/* NO_MORE_MEMORY.default_create */
extern T0* T64c8(GE_context* ac);
/* VOID_TARGET.default_create */
extern T0* T58c6(GE_context* ac);
/* ISE_EXCEPTION_MANAGER.exception_data */
extern T0* T19f9(GE_context* ac, T0* C);
/* CELL [detachable TUPLE [INTEGER_32, INTEGER_32, INTEGER_32, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, INTEGER_32, BOOLEAN]].put */
extern void T24f2(GE_context* ac, T0* C, T0* a1);
/* CELL [detachable TUPLE [INTEGER_32, INTEGER_32, INTEGER_32, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, INTEGER_32, BOOLEAN]].put */
extern T0* T24c2(GE_context* ac, T0* a1);
/* ISE_EXCEPTION_MANAGER.exception_data_cell */
extern unsigned char ge2584os1920;
extern T0* ge2584ov1920;
extern T0* T19f4(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.init_exception_manager */
extern void T19f14(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.unraisable_exceptions */
extern unsigned char ge2584os1918;
extern T0* ge2584ov1918;
extern T0* T19f3(GE_context* ac, T0* C);
/* HASH_TABLE [INTEGER_32, INTEGER_32].force */
extern void T23f36(GE_context* ac, T0* C, T6 a1, T6 a2);
/* HASH_TABLE [INTEGER_32, INTEGER_32].position */
extern T6 T23f22(GE_context* ac, T0* C);
/* SPECIAL [BOOLEAN].force */
extern void T96f7(GE_context* ac, T0* C, T1 a1, T6 a2);
/* HASH_TABLE [INTEGER_32, INTEGER_32].deleted_position */
extern T6 T23f21(GE_context* ac, T0* C, T6 a1);
/* HASH_TABLE [INTEGER_32, INTEGER_32].add_space */
extern void T23f38(GE_context* ac, T0* C);
/* HASH_TABLE [INTEGER_32, INTEGER_32].accommodate */
extern void T23f39(GE_context* ac, T0* C, T6 a1);
/* HASH_TABLE [INTEGER_32, INTEGER_32].set_indexes_map */
extern void T23f43(GE_context* ac, T0* C, T0* a1);
/* HASH_TABLE [INTEGER_32, INTEGER_32].set_deleted_marks */
extern void T23f42(GE_context* ac, T0* C, T0* a1);
/* HASH_TABLE [INTEGER_32, INTEGER_32].set_keys */
extern void T23f41(GE_context* ac, T0* C, T0* a1);
/* HASH_TABLE [INTEGER_32, INTEGER_32].set_content */
extern void T23f40(GE_context* ac, T0* C, T0* a1);
/* HASH_TABLE [INTEGER_32, INTEGER_32].put */
extern void T23f44(GE_context* ac, T0* C, T6 a1, T6 a2);
/* HASH_TABLE [INTEGER_32, INTEGER_32].set_conflict */
extern void T23f46(GE_context* ac, T0* C);
/* HASH_TABLE [INTEGER_32, INTEGER_32].found */
extern T1 T23f31(GE_context* ac, T0* C);
/* HASH_TABLE [INTEGER_32, INTEGER_32].occupied */
extern T1 T23f29(GE_context* ac, T0* C, T6 a1);
/* HASH_TABLE [INTEGER_32, INTEGER_32].empty_duplicate */
extern T0* T23f28(GE_context* ac, T0* C, T6 a1);
/* HASH_TABLE [INTEGER_32, INTEGER_32].compare_objects */
extern void T23f45(GE_context* ac, T0* C);
/* HASH_TABLE [INTEGER_32, INTEGER_32].soon_full */
extern T1 T23f20(GE_context* ac, T0* C);
/* HASH_TABLE [INTEGER_32, INTEGER_32].not_found */
extern T1 T23f19(GE_context* ac, T0* C);
/* HASH_TABLE [INTEGER_32, INTEGER_32].internal_search */
extern void T23f37(GE_context* ac, T0* C, T6 a1);
/* ISE_EXCEPTION_MANAGER.unignorable_exceptions */
extern unsigned char ge2584os1917;
extern T0* ge2584ov1917;
extern T0* T19f2(GE_context* ac, T0* C);
/* DIRECTORY.dispose */
extern void T617f20(GE_context* ac, T0* C);
/* DIRECTORY.close */
extern void T617f25(GE_context* ac, T0* C);
/* DIRECTORY.default_pointer */
extern T14 T617f9(GE_context* ac, T0* C);
/* DIRECTORY.dir_close */
extern void T617f30(GE_context* ac, T0* C, T14 a1);
/* DIRECTORY.is_closed */
extern T1 T617f12(GE_context* ac, T0* C);
/* RAW_FILE.dispose */
extern void T616f16(GE_context* ac, T0* C);
/* RAW_FILE.close */
extern void T616f20(GE_context* ac, T0* C);
/* RAW_FILE.default_pointer */
extern T14 T616f14(GE_context* ac, T0* C);
/* RAW_FILE.file_close */
extern void T616f22(GE_context* ac, T0* C, T14 a1);
/* RAW_FILE.is_closed */
extern T1 T616f13(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.dispose */
extern void T610f25(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.old_close */
extern void T610f30(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.default_pointer */
extern T14 T610f16(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.file_close */
extern void T610f34(GE_context* ac, T0* C, T14 a1);
/* KL_BINARY_OUTPUT_FILE.old_is_closed */
extern T1 T610f11(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.dispose */
extern void T609f37(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.old_close */
extern void T609f42(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.default_pointer */
extern T14 T609f23(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.file_close */
extern void T609f45(GE_context* ac, T0* C, T14 a1);
/* KL_BINARY_INPUT_FILE.old_is_closed */
extern T1 T609f12(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.dispose */
extern void T528f26(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.old_close */
extern void T528f32(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.default_pointer */
extern T14 T528f16(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.file_close */
extern void T528f38(GE_context* ac, T0* C, T14 a1);
/* KL_TEXT_OUTPUT_FILE.old_is_closed */
extern T1 T528f11(GE_context* ac, T0* C);
/* KL_DIRECTORY.dispose */
extern void T411f44(GE_context* ac, T0* C);
/* KL_DIRECTORY.old_close */
extern void T411f47(GE_context* ac, T0* C);
/* KL_DIRECTORY.default_pointer */
extern T14 T411f13(GE_context* ac, T0* C);
/* KL_DIRECTORY.dir_close */
extern void T411f49(GE_context* ac, T0* C, T14 a1);
/* KL_DIRECTORY.is_closed */
extern T1 T411f11(GE_context* ac, T0* C);
/* MANAGED_POINTER.dispose */
extern void T118f10(GE_context* ac, T0* C);
/* POINTER.memory_free */
extern void T14f11(GE_context* ac, T14* C);
/* POINTER.default_pointer */
extern T14 T14f8(GE_context* ac, T14* C);
/* POINTER.c_free */
extern void T14f13(GE_context* ac, T14* C, T14 a1);
/* KL_TEXT_INPUT_FILE.dispose */
extern void T97f61(GE_context* ac, T0* C);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].record */
extern void T633f5(GE_context* ac, T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.put */
extern void T602f12(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.put */
extern void T602f12p1(GE_context* ac, T0* C, T6 a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].record */
extern void T631f4(GE_context* ac, T0* C, T0* a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].record */
extern void T629f5(GE_context* ac, T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.add */
extern void T602f11(GE_context* ac, T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.add */
extern void T602f11p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.log_validation_messages */
extern void T385f34(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.validation_messages */
extern unsigned char ge10os1964;
extern T0* ge10ov1964;
extern T0* T385f16(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.log_validation_messages */
extern void T383f35(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.validation_messages */
extern T0* T383f13(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.log_validation_messages */
extern void T381f25(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.validation_messages */
extern T0* T381f5(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.log_validation_messages */
extern void T379f32(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.validation_messages */
extern T0* T379f13(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.log_validation_messages */
extern void T377f26(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.validation_messages */
extern T0* T377f7(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.log_validation_messages */
extern void T375f31(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.validation_messages */
extern T0* T375f13(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.log_validation_messages */
extern void T373f44(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.validation_messages */
extern T0* T373f23(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.log_validation_messages */
extern void T371f27(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.validation_messages */
extern T0* T371f8(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.log_validation_messages */
extern void T369f29(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.validation_messages */
extern T0* T369f11(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.log_validation_messages */
extern void T367f34(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.validation_messages */
extern T0* T367f13(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.log_validation_messages */
extern void T365f34(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.validation_messages */
extern T0* T365f13(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.log_validation_messages */
extern void T363f25(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.validation_messages */
extern T0* T363f5(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.log_validation_messages */
extern void T361f25(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.validation_messages */
extern T0* T361f5(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.log_validation_messages */
extern void T359f40(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.validation_messages */
extern T0* T359f20(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.log_validation_messages */
extern void T357f42(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.validation_messages */
extern T0* T357f22(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.log_validation_messages */
extern void T355f37(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.validation_messages */
extern T0* T355f16(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.log_validation_messages */
extern void T353f37(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.validation_messages */
extern T0* T353f15(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.log_validation_messages */
extern void T351f40(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.validation_messages */
extern T0* T351f18(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.log_validation_messages */
extern void T349f38(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.validation_messages */
extern T0* T349f16(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.log_validation_messages */
extern void T347f26(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.validation_messages */
extern T0* T347f7(GE_context* ac, T0* C);
/* GEANT_SET_TASK.log_validation_messages */
extern void T345f27(GE_context* ac, T0* C);
/* GEANT_SET_TASK.validation_messages */
extern T0* T345f8(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.log_validation_messages */
extern void T343f27(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.validation_messages */
extern T0* T343f8(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.log_validation_messages */
extern void T341f26(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.validation_messages */
extern T0* T341f6(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.log_validation_messages */
extern void T339f39(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.validation_messages */
extern T0* T339f17(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.log_validation_messages */
extern void T333f40(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.validation_messages */
extern T0* T333f18(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.execute */
extern void T385f40(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.execute */
extern void T482f40(GE_context* ac, T0* C);
/* GEANT_FILESET.forth */
extern void T433f50(GE_context* ac, T0* C);
/* GEANT_FILESET.update_project_variables */
extern void T433f55(GE_context* ac, T0* C);
/* GEANT_FILESET.remove_project_variables */
extern void T433f51(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.remove */
extern void T32f86(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.remove_position */
extern void T32f88(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.key_storage_put */
extern void T32f70(GE_context* ac, T0* C, T0* a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.item_storage_put */
extern void T32f66(GE_context* ac, T0* C, T0* a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.key_storage_keep_head */
extern void T32f92(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.item_storage_keep_head */
extern void T32f91(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.clashes_put */
extern void T32f68(GE_context* ac, T0* C, T6 a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.slots_put */
extern void T32f69(GE_context* ac, T0* C, T6 a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.move_cursors_forth */
extern void T32f90(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].set_position */
extern void T105f14(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].set_next_cursor */
extern void T105f15(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].set_after */
extern void T105f13(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.internal_set_key_equality_tester */
extern void T32f89(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET.off */
extern T1 T433f27(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].off */
extern T1 T516f35(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_off */
extern T1 T516f23(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].off */
extern T1 T554f5(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].forth */
extern void T516f39(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_forth */
extern void T516f44(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].add_traversing_cursor */
extern void T516f58(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].set_next_cursor */
extern void T554f10(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].set_position */
extern void T554f11(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].remove_traversing_cursor */
extern void T516f57(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].set_after */
extern void T554f9(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].clashes_item */
extern T6 T516f24(GE_context* ac, T0* C, T6 a1);
/* GEANT_REPLACE_COMMAND.create_directory_for_pathname */
extern void T482f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.file_system */
extern T0* T482f20(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.windows_file_system */
extern T0* T482f27(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.operating_system */
extern T0* T482f26(GE_context* ac, T0* C);
/* GEANT_FILESET.item_mapped_filename */
extern T0* T433f26(GE_context* ac, T0* C);
/* GEANT_FILESET_ENTRY.mapped_filename_converted */
extern T0* T544f6(GE_context* ac, T0* C);
/* GEANT_FILESET_ENTRY.unix_file_system */
extern T0* T544f9(GE_context* ac, T0* C);
/* GEANT_FILESET_ENTRY.file_system */
extern T0* T544f8(GE_context* ac, T0* C);
/* GEANT_FILESET_ENTRY.windows_file_system */
extern T0* T544f11(GE_context* ac, T0* C);
/* GEANT_FILESET_ENTRY.operating_system */
extern T0* T544f10(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_for_iteration */
extern T0* T516f32(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_item */
extern T0* T516f26(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_storage_item */
extern T0* T516f27(GE_context* ac, T0* C, T6 a1);
/* GEANT_FILESET.item_filename */
extern T0* T433f25(GE_context* ac, T0* C);
/* GEANT_FILESET_ENTRY.filename_converted */
extern T0* T544f5(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.unix_file_system */
extern T0* T482f19(GE_context* ac, T0* C);
/* GEANT_FILESET.is_in_gobo_31_format */
extern T1 T433f21(GE_context* ac, T0* C);
/* GEANT_FILESET.after */
extern T1 T433f20(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].after */
extern T1 T516f17(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_after */
extern T1 T516f18(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].after */
extern T1 T554f7(GE_context* ac, T0* C);
/* GEANT_FILESET.start */
extern void T433f49(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].start */
extern void T516f38(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_start */
extern void T516f43(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].is_empty */
extern T1 T516f22(GE_context* ac, T0* C);
/* GEANT_FILESET.execute */
extern void T433f48(GE_context* ac, T0* C);
/* GEANT_FILESET.remove_fileset_entry */
extern void T433f54(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].remove */
extern void T516f41(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].remove_position */
extern void T516f51(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_storage_put */
extern void T516f67(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_storage_put */
extern void T516f47(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].force */
extern void T557f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_FILESET_ENTRY].fill_with */
extern void T555f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_FILESET_ENTRY].extend */
extern void T555f10(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_storage_keep_head */
extern void T516f66(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_storage_keep_head */
extern void T516f65(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_FILESET_ENTRY].keep_head */
extern void T555f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_FILESET_ENTRY].set_count */
extern void T555f9(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].clashes_put */
extern void T516f49(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].slots_put */
extern void T516f50(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].move_cursors_forth */
extern void T516f64(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].internal_set_key_equality_tester */
extern void T516f63(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_equality_tester */
extern T0* T516f28(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].slots_item */
extern T6 T516f36(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].hash_position */
extern T6 T516f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ENTRY.hash_code */
extern T6 T544f3(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_storage_item */
extern T0* T516f29(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].search_position */
extern void T516f46(GE_context* ac, T0* C, T0* a1);
/* detachable KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY].test */
extern T1 T556f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_FILESET_ENTRY.is_equal */
extern T1 T544f4(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ENTRY.string_ */
extern T0* T544f7(GE_context* ac, T0* C);
/* GEANT_FILESET_ENTRY.make */
extern T0* T544c12(GE_context* ac, T0* a1, T0* a2);
/* DS_HASH_SET_CURSOR [STRING_8].forth */
extern void T543f11(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].cursor_forth */
extern void T518f51(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].add_traversing_cursor */
extern void T518f53(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_next_cursor */
extern void T543f14(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_position */
extern void T543f13(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].remove_traversing_cursor */
extern void T518f52(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_after */
extern void T543f12(GE_context* ac, T0* C);
/* GEANT_FILESET.add_fileset_entry_if_necessary */
extern void T433f53(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].force_last */
extern void T516f40(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].resize */
extern void T516f48(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].clashes_resize */
extern void T516f62(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].special_integer_ */
extern T0* T516f34(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_storage_resize */
extern void T516f61(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_storage_resize */
extern void T516f60(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].aliased_resized_area */
extern T0* T557f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_FILESET_ENTRY].aliased_resized_area */
extern T0* T555f4(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].slots_resize */
extern void T516f59(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].new_capacity */
extern T6 T516f30(GE_context* ac, T0* C, T6 a1);
/* GEANT_FILESET.is_file_outofdate */
extern T1 T433f29(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.file_time_stamp */
extern T6 T92f32(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.time_stamp */
extern T6 T97f43(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.date */
extern T6 T97f45(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.eif_file_date */
extern T6 T97f50(GE_context* ac, T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.file_time_stamp */
extern T6 T93f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_MAP.mapped_filename */
extern T0* T513f10(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.remove_tail */
extern void T267f90(GE_context* ac, T0* C, T6 a1);
/* STRING_8.remove_tail */
extern void T17f60(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.remove_head */
extern void T267f89(GE_context* ac, T0* C, T6 a1);
/* STRING_8.remove_head */
extern void T17f59(GE_context* ac, T0* C, T6 a1);
/* GEANT_MAP.glob_postfix */
extern T0* T513f16(GE_context* ac, T0* C, T0* a1);
/* GEANT_MAP.glob_prefix */
extern T0* T513f15(GE_context* ac, T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.replace_all */
extern T0* T548f231(GE_context* ac, T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_replace_all_to_string */
extern void T548f305(GE_context* ac, T0* C, T0* a1, T0* a2);
/* RX_PCRE_REGULAR_EXPRESSION.match_unbounded_substring */
extern void T548f319(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_substring */
extern void T548f317(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_it */
extern void T548f331(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_start */
extern T1 T548f151(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_internal */
extern T6 T548f233(GE_context* ac, T0* C, T6 a1, T1 a2, T1 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_type */
extern T6 T548f297(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3, T1 a4);
/* RX_PCRE_REGULAR_EXPRESSION.match_not_repeated_characters */
extern T6 T548f296(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3, T1 a4);
/* RX_PCRE_REGULAR_EXPRESSION.infinity */
extern unsigned char ge427os11406;
extern T6 ge427ov11406;
extern T6 T548f62(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.platform */
extern T0* T548f195(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_characters */
extern T6 T548f295(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3, T1 a4);
/* RX_BYTE_CODE.character_item */
extern T6 T568f8(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_classes */
extern T6 T548f294(GE_context* ac, T0* C, T6 a1);
/* RX_BYTE_CODE.character_set_has */
extern T1 T568f10(GE_context* ac, T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_refs */
extern T6 T548f293(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_ref */
extern T6 T548f299(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.space_set */
extern unsigned char ge433os11573;
extern T0* ge433ov11573;
extern T0* T548f152(GE_context* ac, T0* C);
/* RX_CHARACTER_SET.make */
extern T0* T569c5(GE_context* ac, T0* a1);
/* RX_CHARACTER_SET.add_string */
extern void T569f10(GE_context* ac, T0* C, T0* a1);
/* RX_CHARACTER_SET.add_character */
extern void T569f9(GE_context* ac, T0* C, T6 a1);
/* RX_CHARACTER_SET.make_empty */
extern void T569f4(GE_context* ac, T0* C);
/* RX_CHARACTER_SET.make_empty */
extern T0* T569c4(GE_context* ac);
/* KL_SPECIAL_ROUTINES [BOOLEAN].make_filled */
extern T0* T217f3(GE_context* ac, T0* C, T1 a1, T6 a2);
/* RX_CHARACTER_SET.special_boolean_ */
extern unsigned char ge127os2703;
extern T0* ge127ov2703;
extern T0* T569f3(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.digit_set */
extern unsigned char ge433os11565;
extern T0* ge433ov11565;
extern T0* T548f168(GE_context* ac, T0* C);
/* RX_CHARACTER_SET.has */
extern T1 T569f2(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_ims_options */
extern void T548f329(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_dotall */
extern T1 T548f87(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_multiline */
extern T1 T548f86(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_caseless */
extern T1 T548f85(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_match_count */
extern void T548f338(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_next_start */
extern void T548f337(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_recursive */
extern T6 T548f292(GE_context* ac, T0* C, T6 a1, T1 a2, T1 a3);
/* RX_BYTE_CODE.integer_item */
extern T6 T568f11(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.next_matching_alternate */
extern T6 T548f290(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_additional_bracket */
extern T6 T548f271(GE_context* ac, T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.opcode_item */
extern T6 T568f7(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.special_integer_ */
extern T0* T548f56(GE_context* ac, T0* C);
/* RX_CASE_MAPPING.flip_case */
extern T6 T570f4(GE_context* ac, T0* C, T6 a1);
/* RX_CASE_MAPPING.to_lower */
extern T6 T570f3(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_replacement_to_string */
extern void T548f318(GE_context* ac, T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.append_code */
extern void T267f91(GE_context* ac, T0* C, T10 a1);
/* UC_UTF8_STRING.append_item_code */
extern void T267f92(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_captured_substring_to_string */
extern void T548f332(GE_context* ac, T0* C, T0* a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.captured_end_position */
extern T6 T548f55(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.captured_start_position */
extern T6 T548f54(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.string_ */
extern T0* T548f57(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.has_matched */
extern T1 T548f72(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.match */
extern void T548f304(GE_context* ac, T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_compiled */
extern T1 T548f149(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.compile */
extern void T548f301(GE_context* ac, T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.compile */
extern void T548f301p1(GE_context* ac, T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_startline */
extern void T548f316(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.has_startline */
extern T1 T548f230(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.first_significant_code */
extern T6 T548f190(GE_context* ac, T0* C, T6 a1, T6 a2, T1 a3);
/* RX_PCRE_REGULAR_EXPRESSION.find_firstchar */
extern T6 T548f229(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_anchored */
extern void T548f315(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.can_anchored */
extern T1 T548f228(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.ims_options */
extern T6 T548f84(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_option_dotall */
extern T6 T548f133(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_option_multiline */
extern T6 T548f131(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_option_caseless */
extern T6 T548f129(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.compile_regexp */
extern void T548f314(GE_context* ac, T0* C, T6 a1, T1 a2, T1 a3, T6 a4);
/* RX_BYTE_CODE.set_count */
extern void T568f18(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.find_fixed_code_length */
extern T6 T548f67(GE_context* ac, T0* C, T6 a1);
/* RX_BYTE_CODE.put_integer */
extern void T568f17(GE_context* ac, T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.compile_branch */
extern void T548f330(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.meta_set */
extern unsigned char ge433os11574;
extern T0* ge433ov11574;
extern T0* T548f148(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.maxlit */
extern unsigned char ge427os11407;
extern T6 ge427ov11407;
extern T6 T548f147(GE_context* ac, T0* C);
/* RX_BYTE_CODE.append_character */
extern void T568f19(GE_context* ac, T0* C, T6 a1);
/* RX_BYTE_CODE.put_character */
extern void T568f25(GE_context* ac, T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.resize_byte_code */
extern void T568f24(GE_context* ac, T0* C, T6 a1);
/* RX_BYTE_CODE.special_integer_ */
extern T0* T568f9(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.scan_escape */
extern T6 T548f142(GE_context* ac, T0* C, T6 a1, T1 a2);
/* RX_PCRE_REGULAR_EXPRESSION.scan_hex_number */
extern T6 T548f223(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.xdigit_set */
extern unsigned char ge433os11567;
extern T0* ge433ov11567;
extern T0* T548f245(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.scan_octal_number */
extern T6 T548f222(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.escape_character */
extern T6 T548f218(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.to_option_ims */
extern T6 T548f136(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_ichanged */
extern void T548f328(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.unset_option_dotall */
extern T6 T548f134(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.unset_option_multiline */
extern T6 T548f132(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.unset_option_caseless */
extern T6 T548f130(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.scan_decimal_number */
extern T6 T548f111(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.compile_repeats */
extern void T548f335(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3, T6 a4, T6 a5);
/* RX_BYTE_CODE.append_subcopy */
extern void T568f23(GE_context* ac, T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.put_opcode */
extern void T568f22(GE_context* ac, T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.move_right */
extern void T568f21(GE_context* ac, T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.compile_single_repeat */
extern void T548f336(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3, T6 a4, T6 a5, T6 a6);
/* RX_PCRE_REGULAR_EXPRESSION.compile_character_class */
extern void T548f334(GE_context* ac, T0* C);
/* RX_BYTE_CODE.append_character_set */
extern void T568f20(GE_context* ac, T0* C, T0* a1, T1 a2);
/* RX_BYTE_CODE.resize_character_sets */
extern void T568f26(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].aliased_resized_area_with_default */
extern T0* T217f4(GE_context* ac, T0* C, T0* a1, T1 a2, T6 a3);
/* SPECIAL [BOOLEAN].aliased_resized_area_with_default */
extern T0* T96f5(GE_context* ac, T0* C, T1 a1, T6 a2);
/* RX_BYTE_CODE.special_boolean_ */
extern T0* T568f12(GE_context* ac, T0* C);
/* RX_CHARACTER_SET.add_set */
extern void T569f8(GE_context* ac, T0* C, T0* a1);
/* RX_CHARACTER_SET.add_negated_set */
extern void T569f7(GE_context* ac, T0* C, T0* a1);
/* ARRAY [RX_CHARACTER_SET].item */
extern T0* T573f4(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.class_sets */
extern unsigned char ge433os11576;
extern T0* ge433ov11576;
extern T0* T548f160(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.default_word_set */
extern unsigned char ge433os11561;
extern T0* ge433ov11561;
extern T0* T548f78(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.punct_set */
extern unsigned char ge433os11571;
extern T0* ge433ov11571;
extern T0* T548f244(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.print_set */
extern unsigned char ge433os11570;
extern T0* ge433ov11570;
extern T0* T548f243(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.graph_set */
extern unsigned char ge433os11569;
extern T0* ge433ov11569;
extern T0* T548f242(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.cntrl_set */
extern unsigned char ge433os11568;
extern T0* ge433ov11568;
extern T0* T548f241(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.ascii_set */
extern unsigned char ge433os11572;
extern T0* ge433ov11572;
extern T0* T548f240(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.alnum_set */
extern unsigned char ge433os11566;
extern T0* ge433ov11566;
extern T0* T548f239(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.upper_set */
extern unsigned char ge433os11562;
extern T0* ge433ov11562;
extern T0* T548f238(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.lower_set */
extern unsigned char ge433os11563;
extern T0* ge433ov11563;
extern T0* T548f237(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.alpha_set */
extern unsigned char ge433os11564;
extern T0* ge433ov11564;
extern T0* T548f235(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.check_posix_name */
extern T6 T548f158(GE_context* ac, T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.class_names */
extern unsigned char ge433os11575;
extern T0* ge433ov11575;
extern T0* T548f236(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.check_posix_syntax */
extern T6 T548f156(GE_context* ac, T0* C, T6 a1);
/* RX_CHARACTER_SET.wipe_out */
extern void T569f6(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.actual_set */
extern unsigned char ge427os11405;
extern T0* ge427ov11405;
extern T0* T548f153(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.compile_counted_repeats */
extern T1 T548f89(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.scan_comment */
extern void T548f333(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_undef */
extern T1 T548f64(GE_context* ac, T0* C, T6 a1);
/* RX_BYTE_CODE.append_integer */
extern void T568f16(GE_context* ac, T0* C, T6 a1);
/* RX_BYTE_CODE.append_opcode */
extern void T568f15(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_error */
extern void T548f313(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.set_default_internal_options */
extern void T548f312(GE_context* ac, T0* C);
/* RX_BYTE_CODE.wipe_out */
extern void T568f14(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.wipe_out */
extern void T548f311(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.wipe_out */
extern void T548f311p1(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.make */
extern T0* T548c300(GE_context* ac);
/* KL_SPECIAL_ROUTINES [INTEGER_32].make_filled */
extern T0* T106f5(GE_context* ac, T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.make */
extern void T548f300p1(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_default_options */
extern void T548f310(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_strict */
extern void T548f327(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_greedy */
extern void T548f326(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_eol */
extern void T548f325(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_bol */
extern void T548f324(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_dollar_endonly */
extern void T548f323(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_empty_allowed */
extern void T548f322(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_extended */
extern void T548f321(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_dotall */
extern void T548f320(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_multiline */
extern void T548f303(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_caseless */
extern void T548f302(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_word_set */
extern void T548f309(GE_context* ac, T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_character_case_mapping */
extern void T548f308(GE_context* ac, T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.default_character_case_mapping */
extern unsigned char ge433os11560;
extern T0* ge433ov11560;
extern T0* T548f77(GE_context* ac, T0* C);
/* RX_CASE_MAPPING.make */
extern T0* T570c6(GE_context* ac, T0* a1, T0* a2);
/* RX_CASE_MAPPING.add */
extern void T570f8(GE_context* ac, T0* C, T0* a1, T0* a2);
/* RX_CASE_MAPPING.make_default */
extern void T570f7(GE_context* ac, T0* C);
/* RX_CASE_MAPPING.clear */
extern void T570f9(GE_context* ac, T0* C);
/* RX_CASE_MAPPING.special_integer_ */
extern T0* T570f5(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.reset */
extern void T548f307(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.reset */
extern void T548f307p1(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.empty_pattern_buffer */
extern unsigned char ge427os11404;
extern T0* ge427ov11404;
extern T0* T548f76(GE_context* ac, T0* C);
/* RX_BYTE_CODE.make */
extern T0* T568c13(GE_context* ac, T6 a1);
/* GEANT_MAP.type_attribute_value_regexp */
extern unsigned char ge88os10657;
extern T0* ge88ov10657;
extern T0* T513f8(GE_context* ac, T0* C);
/* GEANT_MAP.type_attribute_value_merge */
extern unsigned char ge88os10655;
extern T0* ge88ov10655;
extern T0* T513f7(GE_context* ac, T0* C);
/* GEANT_MAP.unix_file_system */
extern T0* T513f14(GE_context* ac, T0* C);
/* GEANT_MAP.type_attribute_value_flat */
extern unsigned char ge88os10654;
extern T0* ge88ov10654;
extern T0* T513f6(GE_context* ac, T0* C);
/* GEANT_MAP.string_ */
extern T0* T513f12(GE_context* ac, T0* C);
/* GEANT_MAP.is_executable */
extern T1 T513f11(GE_context* ac, T0* C);
/* GEANT_MAP.type_attribute_value_glob */
extern unsigned char ge88os10656;
extern T0* ge88ov10656;
extern T0* T513f9(GE_context* ac, T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].item */
extern T0* T543f5(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].cursor_item */
extern T0* T518f29(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].after */
extern T1 T543f7(GE_context* ac, T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].start */
extern void T543f10(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].cursor_start */
extern void T518f50(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].cursor_off */
extern T1 T518f31(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].off */
extern T1 T543f8(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].is_empty */
extern T1 T518f30(GE_context* ac, T0* C);
/* GEANT_FILESET.scan_internal */
extern void T433f52(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.close */
extern void T411f53(GE_context* ac, T0* C);
/* LX_DFA_WILDCARD.recognizes */
extern T1 T520f12(GE_context* ac, T0* C, T0* a1);
/* LX_DFA_WILDCARD.longest_end_position */
extern T6 T520f14(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_readable */
extern T1 T92f31(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.is_readable */
extern T1 T411f31(GE_context* ac, T0* C);
/* KL_DIRECTORY.old_is_readable */
extern T1 T411f21(GE_context* ac, T0* C);
/* KL_DIRECTORY.eif_dir_is_readable */
extern T1 T411f32(GE_context* ac, T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.is_directory_readable */
extern T1 T93f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET.string_ */
extern T0* T433f28(GE_context* ac, T0* C);
/* KL_DIRECTORY.read_entry */
extern void T411f52(GE_context* ac, T0* C);
/* KL_DIRECTORY.readentry */
extern void T411f56(GE_context* ac, T0* C);
/* KL_DIRECTORY.eif_dir_next */
extern T14 T411f29(GE_context* ac, T0* C, T14 a1);
/* KL_DIRECTORY.old_end_of_input */
extern T1 T411f23(GE_context* ac, T0* C);
/* KL_DIRECTORY.is_open_read */
extern T1 T411f18(GE_context* ac, T0* C);
/* KL_DIRECTORY.open_read */
extern void T411f51(GE_context* ac, T0* C);
/* KL_DIRECTORY.old_open_read */
extern void T411f55(GE_context* ac, T0* C);
/* KL_DIRECTORY.dir_open */
extern T14 T411f26(GE_context* ac, T0* C, T14 a1);
/* GEANT_FILESET.unix_file_system */
extern T0* T433f24(GE_context* ac, T0* C);
/* GEANT_FILESET.file_system */
extern T0* T433f23(GE_context* ac, T0* C);
/* GEANT_FILESET.windows_file_system */
extern T0* T433f32(GE_context* ac, T0* C);
/* GEANT_FILESET.operating_system */
extern T0* T433f31(GE_context* ac, T0* C);
/* GEANT_FILESET.is_executable */
extern T1 T433f19(GE_context* ac, T0* C);
/* GEANT_FILESET.is_in_gobo_32_format */
extern T1 T433f22(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.execute_replace */
extern void T482f41(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_COMMAND.execute_replace_token */
extern void T482f45(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_TEXT_OUTPUT_FILE.close */
extern void T528f29(GE_context* ac, T0* C);
/* KL_STRING_ROUTINES.replaced_first_substring */
extern T0* T116f16(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* KL_STRING_ROUTINES.substring_index */
extern T6 T116f17(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* KL_STRING_ROUTINES.platform */
extern T0* T116f18(GE_context* ac, T0* C);
/* STRING_8.substring_index */
extern T6 T17f33(GE_context* ac, T0* C, T0* a1, T6 a2);
/* STRING_8_SEARCHER.substring_index */
extern T6 T657f2(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* STRING_8_SEARCHER.substring_index_with_deltas */
extern T6 T657f3(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* STRING_8_SEARCHER.internal_initialize_deltas */
extern void T657f6(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* STRING_8.string_searcher */
extern unsigned char ge2419os489;
extern T0* ge2419ov489;
extern T0* T17f34(GE_context* ac, T0* C);
/* STRING_8_SEARCHER.make */
extern T0* T657c5(GE_context* ac);
/* KL_STRING_ROUTINES.replaced_all_substrings */
extern T0* T116f15(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* GEANT_REPLACE_COMMAND.string_ */
extern T0* T482f25(GE_context* ac, T0* C);
/* UC_UTF8_STRING.has */
extern T1 T267f55(GE_context* ac, T0* C, T2 a1);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T528f28(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.is_closed */
extern T1 T528f13(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_write */
extern void T528f34(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T528f34p1(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.file_open */
extern T14 T528f19(GE_context* ac, T0* C, T14 a1, T6 a2);
/* KL_TEXT_OUTPUT_FILE.internal_name_pointer */
extern T0* T528f18(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.string_name */
extern T0* T528f12(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.reset */
extern void T528f42(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.make */
extern void T528f25(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.make */
extern T0* T528c25(GE_context* ac, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_make */
extern void T528f31(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.make_with_name */
extern void T528f37(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.set_name */
extern void T528f40(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.buffered_file_info */
extern T0* T528f24(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.tmp_output_file */
extern unsigned char ge42os10042;
extern T0* ge42ov10042;
extern T0* T482f24(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.read_string */
extern void T97f74(GE_context* ac, T0* C, T6 a1);
/* KL_TEXT_INPUT_FILE.read_to_string */
extern T6 T97f36(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
extern unsigned char ge157os4879;
extern T0* ge157ov4879;
extern T0* T97f41(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.any_ */
extern T0* T97f38(GE_context* ac, T0* C);
/* STRING_8.set_internal_hash_code */
extern void T17f61(GE_context* ac, T0* C, T6 a1);
/* KL_TEXT_INPUT_FILE.old_read_to_string */
extern T6 T97f40(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.file_gss */
extern T6 T97f42(GE_context* ac, T0* C, T14 a1, T14 a2, T6 a3);
/* SPECIAL [CHARACTER_8].item_address */
extern T14 T15f8(GE_context* ac, T0* C, T6 a1);
/* GEANT_REPLACE_COMMAND.tmp_input_file */
extern unsigned char ge42os10041;
extern T0* ge42ov10041;
extern T0* T482f22(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.execute_replace_regexp */
extern void T482f44(GE_context* ac, T0* C, T0* a1, T0* a2);
/* RX_PCRE_REGULAR_EXPRESSION.replace */
extern T0* T548f232(GE_context* ac, T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_replace_to_string */
extern void T548f306(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_COMMAND.execute_replace_variable_pattern */
extern void T482f43(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ARRAY [GEANT_VARIABLES].item */
extern T0* T551f4(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT.aggregated_variables_array */
extern T0* T29f27(GE_context* ac, T0* C);
/* ARRAY [GEANT_VARIABLES].put */
extern void T551f6(GE_context* ac, T0* C, T0* a1, T6 a2);
/* ARRAY [GEANT_VARIABLES].make_filled */
extern T0* T551c5(GE_context* ac, T0* a1, T6 a2, T6 a3);
/* ARRAY [GEANT_VARIABLES].make_filled_area */
extern void T551f7(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_VARIABLES].make_filled */
extern T0* T244c11(GE_context* ac, T0* a1, T6 a2);
/* UC_UTF8_STRING.occurrences */
extern T6 T267f54(GE_context* ac, T0* C, T2 a1);
/* UC_UTF8_STRING.code_occurrences */
extern T6 T267f56(GE_context* ac, T0* C, T6 a1);
/* STRING_8.occurrences */
extern T6 T17f32(GE_context* ac, T0* C, T2 a1);
/* GEANT_REPLACE_COMMAND.is_file_to_file_executable */
extern T1 T482f16(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.is_replace_executable */
extern T1 T482f18(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.exit_application */
extern void T385f41(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_REPLACE_TASK.exceptions */
extern T0* T385f27(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.std */
extern T0* T385f26(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.log_messages */
extern void T385f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.dir_attribute_name */
extern T0* T385f25(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.file_system */
extern T0* T385f24(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.unix_file_system */
extern T0* T385f30(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.windows_file_system */
extern T0* T385f29(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.operating_system */
extern T0* T385f28(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.execute */
extern void T383f41(GE_context* ac, T0* C);
/* GEANT_INPUT_COMMAND.execute */
extern void T480f23(GE_context* ac, T0* C);
/* GEANT_PROJECT.set_variable_value */
extern void T29f51(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT.is_local_variable */
extern T1 T29f26(GE_context* ac, T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.matches */
extern T1 T548f58(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].has */
extern T1 T298f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_COMMAND.string_ */
extern T0* T480f14(GE_context* ac, T0* C);
/* KL_STDIN_FILE.read_line */
extern void T550f20(GE_context* ac, T0* C);
/* KL_STDIN_FILE.unread_character */
extern void T550f23(GE_context* ac, T0* C, T2 a1);
/* detachable KL_LINKABLE [CHARACTER_8].put_right */
extern void T135f4(GE_context* ac, T0* C, T0* a1);
/* detachable KL_LINKABLE [CHARACTER_8].make */
extern T0* T135c3(GE_context* ac, T2 a1);
/* KL_STDIN_FILE.read_character */
extern void T550f22(GE_context* ac, T0* C);
/* KL_STDIN_FILE.old_read_character */
extern void T550f26(GE_context* ac, T0* C);
/* KL_STDIN_FILE.console_readchar */
extern T2 T550f13(GE_context* ac, T0* C, T14 a1);
/* KL_STDIN_FILE.old_end_of_file */
extern T1 T550f15(GE_context* ac, T0* C);
/* KL_STDIN_FILE.console_eof */
extern T1 T550f17(GE_context* ac, T0* C, T14 a1);
/* KL_STDIN_FILE.string_ */
extern T0* T550f14(GE_context* ac, T0* C);
/* GEANT_INPUT_COMMAND.input */
extern unsigned char ge168os3412;
extern T0* ge168ov3412;
extern T0* T480f13(GE_context* ac, T0* C);
/* KL_STDIN_FILE.make */
extern T0* T550c18(GE_context* ac);
/* KL_STDIN_FILE.make_open_stdin */
extern void T550f21(GE_context* ac, T0* C, T0* a1);
/* KL_STDIN_FILE.set_read_mode */
extern void T550f25(GE_context* ac, T0* C);
/* KL_STDIN_FILE.console_def */
extern T14 T550f9(GE_context* ac, T0* C, T6 a1);
/* KL_STDIN_FILE.make_with_name */
extern void T550f24(GE_context* ac, T0* C, T0* a1);
/* KL_STDIN_FILE.default_pointer */
extern T14 T550f11(GE_context* ac, T0* C);
/* KL_STDIN_FILE.set_name */
extern void T550f27(GE_context* ac, T0* C, T0* a1);
/* KL_STDIN_FILE.buffered_file_info */
extern T0* T550f16(GE_context* ac, T0* C);
/* GEANT_INPUT_COMMAND.output */
extern T0* T480f12(GE_context* ac, T0* C);
/* DS_LINKED_LIST [STRING_8].set_equality_tester */
extern void T298f15(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.exit_application */
extern void T383f42(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_INPUT_TASK.exceptions */
extern T0* T383f28(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.log_messages */
extern void T383f43(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.dir_attribute_name */
extern T0* T383f27(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.file_system */
extern T0* T383f26(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.unix_file_system */
extern T0* T383f31(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.windows_file_system */
extern T0* T383f30(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.operating_system */
extern T0* T383f29(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.execute */
extern void T381f31(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_COMMAND.execute */
extern void T478f19(GE_context* ac, T0* C);
/* GEANT_STRING_PROPERTY.non_empty_value_or_else */
extern T0* T429f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_STRING_PROPERTY.string_value */
extern T0* T429f4(GE_context* ac, T0* C);
/* GEANT_STRING_PROPERTY.is_defined */
extern T1 T429f5(GE_context* ac, T0* C);
/* GEANT_STRING_PROPERTY.value */
extern T0* T429f6(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.exit_application */
extern void T381f32(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_AVAILABLE_TASK.exceptions */
extern T0* T381f17(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.std */
extern T0* T381f16(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.log_messages */
extern void T381f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.project_variables_resolver */
extern T0* T381f10(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.dir_attribute_name */
extern T0* T381f15(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.file_system */
extern T0* T381f14(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.unix_file_system */
extern T0* T381f20(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.windows_file_system */
extern T0* T381f19(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.operating_system */
extern T0* T381f18(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.execute */
extern void T379f39(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_COMMAND.execute */
extern void T476f11(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.dir_attribute_name */
extern T0* T379f24(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.file_system */
extern T0* T379f23(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.unix_file_system */
extern T0* T379f27(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.windows_file_system */
extern T0* T379f26(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.operating_system */
extern T0* T379f25(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.execute */
extern void T377f32(GE_context* ac, T0* C);
/* GEANT_EXIT_COMMAND.execute */
extern void T474f10(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.exit_application */
extern void T377f33(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_EXIT_TASK.exceptions */
extern T0* T377f19(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.std */
extern T0* T377f18(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.log_messages */
extern void T377f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXIT_TASK.dir_attribute_name */
extern T0* T377f17(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.file_system */
extern T0* T377f16(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.unix_file_system */
extern T0* T377f22(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.windows_file_system */
extern T0* T377f21(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.operating_system */
extern T0* T377f20(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.execute */
extern void T375f37(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_COMMAND.execute */
extern void T472f28(GE_context* ac, T0* C);
/* GEANT_FILESET.go_after */
extern void T433f56(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].go_after */
extern void T516f68(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_go_after */
extern void T516f69(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.is_file_outofdate */
extern T1 T472f17(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_COMMAND.unix_file_system */
extern T0* T472f15(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_COMMAND.file_system */
extern T0* T472f14(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_COMMAND.windows_file_system */
extern T0* T472f19(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_COMMAND.operating_system */
extern T0* T472f18(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_file_executable */
extern T1 T472f12(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.exit_application */
extern void T375f38(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.exceptions */
extern T0* T375f24(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.std */
extern T0* T375f23(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.log_messages */
extern void T375f39(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.dir_attribute_name */
extern T0* T375f22(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.file_system */
extern T0* T375f21(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.unix_file_system */
extern T0* T375f27(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.windows_file_system */
extern T0* T375f26(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.operating_system */
extern T0* T375f25(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.execute */
extern void T373f50(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.execute */
extern void T469f41(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.execute_gexslt */
extern void T469f45(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_shell */
extern void T469f46(GE_context* ac, T0* C, T0* a1);
/* DP_SHELL_COMMAND.execute */
extern void T540f13(GE_context* ac, T0* C);
/* DP_SHELL_COMMAND.operating_system */
extern T0* T540f6(GE_context* ac, T0* C);
/* DP_SHELL_COMMAND.system */
extern void T540f14(GE_context* ac, T0* C, T0* a1);
/* DP_SHELL_COMMAND.system_call */
extern T6 T540f9(GE_context* ac, T0* C, T14 a1);
/* DP_SHELL_COMMAND.default_shell */
extern unsigned char ge2551os6453;
extern T0* ge2551ov6453;
extern T0* T540f8(GE_context* ac, T0* C);
/* STRING_32.make_empty */
extern T0* T18c23(GE_context* ac);
/* DP_SHELL_COMMAND.item */
extern T0* T540f10(GE_context* ac, T0* C, T0* a1);
/* DP_SHELL_COMMAND.eif_getenv */
extern T14 T540f11(GE_context* ac, T0* C, T14 a1);
/* DP_SHELL_COMMAND.make */
extern T0* T540c12(GE_context* ac, T0* a1);
/* DP_SHELL_COMMAND.string_ */
extern T0* T540f7(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].item */
extern T0* T470f9(GE_context* ac, T0* C, T6 a1);
/* GEANT_XSLT_COMMAND.string_ */
extern T0* T469f23(GE_context* ac, T0* C);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.set_variables */
extern void T547f5(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.make */
extern T0* T547c4(GE_context* ac);
/* GEANT_XSLT_COMMAND.execute_xsltproc */
extern void T469f44(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_xalan_java */
extern void T469f43(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_xalan_cpp */
extern void T469f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.is_file_outofdate */
extern T1 T469f22(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.put */
extern void T36f75(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_COMMAND.unix_file_system */
extern T0* T469f21(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.file_system */
extern T0* T469f20(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.windows_file_system */
extern T0* T469f25(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.operating_system */
extern T0* T469f24(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.exit_application */
extern void T373f51(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_XSLT_TASK.exceptions */
extern T0* T373f37(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.log_messages */
extern void T373f52(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.dir_attribute_name */
extern T0* T373f36(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.file_system */
extern T0* T373f35(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.unix_file_system */
extern T0* T373f40(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.windows_file_system */
extern T0* T373f39(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.operating_system */
extern T0* T373f38(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.execute */
extern void T371f33(GE_context* ac, T0* C);
/* GEANT_SETENV_COMMAND.execute */
extern void T466f13(GE_context* ac, T0* C);
/* KL_EXECUTION_ENVIRONMENT.set_variable_value */
extern void T150f6(GE_context* ac, T0* C, T0* a1, T0* a2);
/* EXECUTION_ENVIRONMENT.put */
extern void T130f14(GE_context* ac, T0* C, T0* a1, T0* a2);
/* EXECUTION_ENVIRONMENT.eif_putenv */
extern T6 T130f10(GE_context* ac, T0* C, T14 a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].force */
extern void T658f35(GE_context* ac, T0* C, T0* a1, T0* a2);
/* SPECIAL [NATIVE_STRING].force */
extern void T676f5(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [NATIVE_STRING].extend */
extern void T676f7(GE_context* ac, T0* C, T0* a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].position */
extern T6 T658f22(GE_context* ac, T0* C);
/* SPECIAL [IMMUTABLE_STRING_32].force */
extern void T179f9(GE_context* ac, T0* C, T0* a1, T6 a2);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].deleted_position */
extern T6 T658f21(GE_context* ac, T0* C, T6 a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].add_space */
extern void T658f37(GE_context* ac, T0* C);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].accommodate */
extern void T658f38(GE_context* ac, T0* C, T6 a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].set_indexes_map */
extern void T658f42(GE_context* ac, T0* C, T0* a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].set_deleted_marks */
extern void T658f41(GE_context* ac, T0* C, T0* a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].set_keys */
extern void T658f40(GE_context* ac, T0* C, T0* a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].set_content */
extern void T658f39(GE_context* ac, T0* C, T0* a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].put */
extern void T658f43(GE_context* ac, T0* C, T0* a1, T0* a2);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].set_conflict */
extern void T658f45(GE_context* ac, T0* C);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].found */
extern T1 T658f31(GE_context* ac, T0* C);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].occupied */
extern T1 T658f29(GE_context* ac, T0* C, T6 a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].empty_duplicate */
extern T0* T658f28(GE_context* ac, T0* C, T6 a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].compare_objects */
extern void T658f44(GE_context* ac, T0* C);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].make */
extern T0* T658c34(GE_context* ac, T6 a1);
/* SPECIAL [NATIVE_STRING].make_empty */
extern T0* T676c4(GE_context* ac, T6 a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].soon_full */
extern T1 T658f20(GE_context* ac, T0* C);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].not_found */
extern T1 T658f19(GE_context* ac, T0* C);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].internal_search */
extern void T658f36(GE_context* ac, T0* C, T0* a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].same_keys */
extern T1 T658f26(GE_context* ac, T0* C, T0* a1, T0* a2);
/* IMMUTABLE_STRING_32.is_equal */
extern T1 T125f12(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [CHARACTER_32].same_items */
extern T1 T16f6(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].hash_code_of */
extern T6 T658f25(GE_context* ac, T0* C, T0* a1);
/* IMMUTABLE_STRING_32.hash_code */
extern T6 T125f11(GE_context* ac, T0* C);
/* IMMUTABLE_STRING_32.make_from_string_general */
extern T0* T125c16(GE_context* ac, T0* a1);
/* UC_UTF8_STRING.to_string_32 */
extern T0* T267f57(GE_context* ac, T0* C);
/* STRING_8.to_string_32 */
extern T0* T17f35(GE_context* ac, T0* C);
/* IMMUTABLE_STRING_32.make_from_string_32 */
extern void T125f19(GE_context* ac, T0* C, T0* a1);
/* IMMUTABLE_STRING_32.make_from_string_8 */
extern void T125f18(GE_context* ac, T0* C, T0* a1);
/* IMMUTABLE_STRING_32.make_from_area_and_bounds */
extern void T125f17(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* IMMUTABLE_STRING_32.make_from_area_and_bounds */
extern T0* T125c17(GE_context* ac, T0* a1, T6 a2, T6 a3);
/* EXECUTION_ENVIRONMENT.environ */
extern unsigned char ge2551os6470;
extern T0* ge2551ov6470;
extern T0* T130f9(GE_context* ac, T0* C);
/* GEANT_SETENV_COMMAND.execution_environment */
extern T0* T466f8(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.exit_application */
extern void T371f34(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_SETENV_TASK.exceptions */
extern T0* T371f20(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.std */
extern T0* T371f19(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.log_messages */
extern void T371f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_SETENV_TASK.dir_attribute_name */
extern T0* T371f18(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.file_system */
extern T0* T371f17(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.unix_file_system */
extern T0* T371f23(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.windows_file_system */
extern T0* T371f22(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.operating_system */
extern T0* T371f21(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.execute */
extern void T369f35(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.execute */
extern void T464f23(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.create_directory_for_pathname */
extern void T464f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.file_system */
extern T0* T464f14(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.windows_file_system */
extern T0* T464f16(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.operating_system */
extern T0* T464f15(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.is_file_to_file_executable */
extern T1 T464f10(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.move_file */
extern void T464f25(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.same_physical_file */
extern T1 T92f33(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_TEXT_INPUT_FILE.same_physical_file */
extern T1 T97f44(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.change_name */
extern void T97f77(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.old_change_name */
extern void T97f79(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.rename_file */
extern void T97f81(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.file_rename */
extern void T97f82(GE_context* ac, T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.file_system */
extern T0* T97f49(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.unix_file_system */
extern T0* T97f55(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.windows_file_system */
extern T0* T97f54(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.operating_system */
extern T0* T97f53(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.count */
extern T6 T97f48(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.old_count */
extern T6 T97f52(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.file_size */
extern T6 T97f57(GE_context* ac, T0* C, T14 a1);
/* FILE_INFO.size */
extern T6 T119f18(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_write */
extern T1 T97f56(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.inode */
extern T6 T97f47(GE_context* ac, T0* C);
/* FILE_INFO.inode */
extern T6 T119f17(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.tmp_file1 */
extern unsigned char ge155os4900;
extern T0* ge155ov4900;
extern T0* T97f46(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.same_physical_file */
extern T1 T93f32(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.rename_file */
extern void T92f44(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_UNIX_FILE_SYSTEM.rename_file */
extern void T93f41(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_COMMAND.unix_file_system */
extern T0* T464f13(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.create_directory */
extern void T464f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.is_file_to_directory_executable */
extern T1 T464f11(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.exit_application */
extern void T369f36(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_MOVE_TASK.exceptions */
extern T0* T369f22(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.std */
extern T0* T369f21(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.log_messages */
extern void T369f37(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_TASK.dir_attribute_name */
extern T0* T369f20(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.file_system */
extern T0* T369f19(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.unix_file_system */
extern T0* T369f25(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.windows_file_system */
extern T0* T369f24(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.operating_system */
extern T0* T369f23(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.execute */
extern void T367f40(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.execute */
extern void T462f27(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.create_directory_for_pathname */
extern void T462f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_COMMAND.file_system */
extern T0* T462f16(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.windows_file_system */
extern T0* T462f19(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.operating_system */
extern T0* T462f18(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.is_file_to_file_executable */
extern T1 T462f12(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.copy_file */
extern void T462f29(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.copy_file */
extern void T92f43(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_TEXT_INPUT_FILE.copy_file */
extern void T97f76(GE_context* ac, T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.close */
extern void T609f40(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.close */
extern void T610f28(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.put_string */
extern void T610f27(GE_context* ac, T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.old_put_string */
extern void T610f32(GE_context* ac, T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.file_ps */
extern void T610f35(GE_context* ac, T0* C, T14 a1, T14 a2, T6 a3);
/* KL_BINARY_OUTPUT_FILE.string_ */
extern T0* T610f9(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.read_string */
extern void T609f39(GE_context* ac, T0* C, T6 a1);
/* KL_BINARY_INPUT_FILE.read_to_string */
extern T6 T609f20(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* KL_BINARY_INPUT_FILE.dummy_kl_character_buffer */
extern T0* T609f35(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.any_ */
extern T0* T609f33(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.old_read_to_string */
extern T6 T609f19(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* KL_BINARY_INPUT_FILE.file_gss */
extern T6 T609f32(GE_context* ac, T0* C, T14 a1, T14 a2, T6 a3);
/* KL_BINARY_INPUT_FILE.old_end_of_file */
extern T1 T609f18(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.file_feof */
extern T1 T609f31(GE_context* ac, T0* C, T14 a1);
/* KL_BINARY_OUTPUT_FILE.is_open_write */
extern T1 T610f14(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.old_is_open_write */
extern T1 T610f8(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.open_write */
extern void T610f26(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.is_closed */
extern T1 T610f13(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.old_open_write */
extern void T610f31(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.open_write */
extern void T610f31p1(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.file_open */
extern T14 T610f19(GE_context* ac, T0* C, T14 a1, T6 a2);
/* KL_BINARY_OUTPUT_FILE.internal_name_pointer */
extern T0* T610f18(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.string_name */
extern T0* T610f12(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.make */
extern T0* T610c24(GE_context* ac, T0* a1);
/* KL_BINARY_OUTPUT_FILE.old_make */
extern void T610f29(GE_context* ac, T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.make_with_name */
extern void T610f33(GE_context* ac, T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.set_name */
extern void T610f36(GE_context* ac, T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.buffered_file_info */
extern T0* T610f23(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.is_open_read */
extern T1 T609f14(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.old_is_open_read */
extern T1 T609f28(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.open_read */
extern void T609f38(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.is_closed */
extern T1 T609f17(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.old_open_read */
extern void T609f43(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.open_read */
extern void T609f43p1(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.file_open */
extern T14 T609f26(GE_context* ac, T0* C, T14 a1, T6 a2);
/* KL_BINARY_INPUT_FILE.internal_name_pointer */
extern T0* T609f25(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.old_is_readable */
extern T1 T609f16(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.buffered_file_info */
extern T0* T609f29(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.set_buffer */
extern void T609f47(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.old_exists */
extern T1 T609f15(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.file_exists */
extern T1 T609f30(GE_context* ac, T0* C, T14 a1);
/* KL_BINARY_INPUT_FILE.string_name */
extern T0* T609f13(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.make */
extern T0* T609c36(GE_context* ac, T0* a1);
/* KL_BINARY_INPUT_FILE.make */
extern void T609f36p1(GE_context* ac, T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.old_make */
extern void T609f41(GE_context* ac, T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.make_with_name */
extern void T609f44(GE_context* ac, T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.set_name */
extern void T609f46(GE_context* ac, T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.string_ */
extern T0* T609f10(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.copy_file */
extern void T93f40(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.is_file_outofdate */
extern T1 T462f17(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.unix_file_system */
extern T0* T462f15(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.create_directory */
extern void T462f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_COMMAND.is_file_to_directory_executable */
extern T1 T462f13(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.exit_application */
extern void T367f41(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_COPY_TASK.exceptions */
extern T0* T367f27(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.log_messages */
extern void T367f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.dir_attribute_name */
extern T0* T367f26(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.file_system */
extern T0* T367f25(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.unix_file_system */
extern T0* T367f30(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.windows_file_system */
extern T0* T367f29(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.operating_system */
extern T0* T367f28(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.execute */
extern void T365f40(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.execute */
extern void T459f28(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.forth */
extern void T460f31(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.update_project_variables */
extern void T460f35(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.item_directory_name */
extern T0* T460f14(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.after */
extern T1 T460f13(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.start */
extern void T460f30(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.execute */
extern void T460f29(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.remove_fileset_entry */
extern void T460f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET.add_fileset_entry_if_necessary */
extern void T460f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET.scan_internal */
extern void T460f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET.file_system */
extern T0* T460f18(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.windows_file_system */
extern T0* T460f20(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.operating_system */
extern T0* T460f19(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.string_ */
extern T0* T460f17(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.unix_file_system */
extern T0* T460f16(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.is_executable */
extern T1 T460f15(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.is_directoryset_executable */
extern T1 T459f15(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.is_fileset_executable */
extern T1 T459f14(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.delete_file */
extern void T92f39(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.delete */
extern void T97f75(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.old_delete */
extern void T97f78(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.file_unlink */
extern void T97f80(GE_context* ac, T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.delete_file */
extern void T93f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.is_file_executable */
extern T1 T459f12(GE_context* ac, T0* C);
/* KL_EXECUTION_ENVIRONMENT.sleep */
extern void T150f5(GE_context* ac, T0* C, T7 a1);
/* EXECUTION_ENVIRONMENT.sleep */
extern void T130f13(GE_context* ac, T0* C, T7 a1);
/* EXECUTION_ENVIRONMENT.eif_sleep */
extern void T130f15(GE_context* ac, T0* C, T7 a1);
/* GEANT_DELETE_COMMAND.execution_environment */
extern T0* T459f18(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.recursive_delete_directory */
extern void T92f41(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.recursive_delete */
extern void T411f60(GE_context* ac, T0* C);
/* KL_DIRECTORY.old_recursive_delete */
extern void T411f62(GE_context* ac, T0* C);
/* KL_DIRECTORY.old_delete */
extern void T411f63(GE_context* ac, T0* C);
/* KL_DIRECTORY.eif_dir_delete */
extern void T411f65(GE_context* ac, T0* C, T14 a1);
/* KL_DIRECTORY.old_is_empty */
extern T1 T411f38(GE_context* ac, T0* C);
/* KL_DIRECTORY.count */
extern T6 T411f42(GE_context* ac, T0* C);
/* DIRECTORY.readentry */
extern void T617f22(GE_context* ac, T0* C);
/* DIRECTORY.file_info */
extern T0* T617f11(GE_context* ac, T0* C);
/* DIRECTORY.eif_dir_next */
extern T14 T617f8(GE_context* ac, T0* C, T14 a1);
/* DIRECTORY.start */
extern void T617f21(GE_context* ac, T0* C);
/* DIRECTORY.dir_rewind */
extern T14 T617f7(GE_context* ac, T0* C, T14 a1, T14 a2);
/* DIRECTORY.internal_name_pointer */
extern T0* T617f18(GE_context* ac, T0* C);
/* DIRECTORY.make_open_read */
extern T0* T617c19(GE_context* ac, T0* a1);
/* DIRECTORY.open_read */
extern void T617f27(GE_context* ac, T0* C);
/* DIRECTORY.dir_open */
extern T14 T617f13(GE_context* ac, T0* C, T14 a1);
/* DIRECTORY.make */
extern void T617f26(GE_context* ac, T0* C, T0* a1);
/* DIRECTORY.make_with_name */
extern void T617f31(GE_context* ac, T0* C, T0* a1);
/* DIRECTORY.set_name */
extern void T617f33(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.delete_content */
extern void T411f64(GE_context* ac, T0* C);
/* KL_DIRECTORY.delete_content_with_action */
extern void T411f66(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* ARRAYED_LIST [READABLE_STRING_32].wipe_out */
extern void T618f9(GE_context* ac, T0* C);
/* SPECIAL [READABLE_STRING_32].wipe_out */
extern void T672f6(GE_context* ac, T0* C);
/* SPECIAL [READABLE_STRING_32].set_count */
extern void T672f7(GE_context* ac, T0* C, T6 a1);
/* ARRAYED_LIST [READABLE_STRING_32].extend */
extern void T618f8(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [READABLE_STRING_32].extend */
extern void T672f5(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [READABLE_STRING_32].aliased_resized_area */
extern T0* T672f3(GE_context* ac, T0* C, T6 a1);
/* ARRAYED_LIST [READABLE_STRING_32].additional_space */
extern T6 T618f4(GE_context* ac, T0* C);
/* ARRAYED_LIST [READABLE_STRING_32].capacity */
extern T6 T618f5(GE_context* ac, T0* C);
/* ARRAYED_LIST [READABLE_STRING_32].count */
extern T6 T618f3(GE_context* ac, T0* C);
/* RAW_FILE.delete */
extern void T616f18(GE_context* ac, T0* C);
/* RAW_FILE.file_unlink */
extern void T616f21(GE_context* ac, T0* C, T14 a1);
/* RAW_FILE.internal_name_pointer */
extern T0* T616f11(GE_context* ac, T0* C);
/* RAW_FILE.make_with_path */
extern T0* T616c15(GE_context* ac, T0* a1);
/* RAW_FILE.set_path */
extern void T616f19(GE_context* ac, T0* C, T0* a1);
/* PATH.to_pointer */
extern T0* T615f15(GE_context* ac, T0* C);
/* PATH.unit_size */
extern T6 T615f14(GE_context* ac, T0* C);
/* RAW_FILE.reset_path */
extern void T616f17(GE_context* ac, T0* C, T0* a1);
/* FILE_INFO.is_writable */
extern T1 T119f21(GE_context* ac, T0* C);
/* DIRECTORY.recursive_delete_with_action */
extern void T617f24(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* ARRAYED_LIST [READABLE_STRING_GENERAL].extend */
extern void T670f8(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [READABLE_STRING_GENERAL].extend */
extern void T677f5(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [READABLE_STRING_GENERAL].aliased_resized_area */
extern T0* T677f3(GE_context* ac, T0* C, T6 a1);
/* ARRAYED_LIST [READABLE_STRING_GENERAL].additional_space */
extern T6 T670f4(GE_context* ac, T0* C);
/* ARRAYED_LIST [READABLE_STRING_GENERAL].capacity */
extern T6 T670f5(GE_context* ac, T0* C);
/* ARRAYED_LIST [READABLE_STRING_GENERAL].count */
extern T6 T670f3(GE_context* ac, T0* C);
/* ARRAYED_LIST [READABLE_STRING_GENERAL].make */
extern T0* T670c7(GE_context* ac, T6 a1);
/* SPECIAL [READABLE_STRING_GENERAL].make_empty */
extern T0* T677c4(GE_context* ac, T6 a1);
/* DIRECTORY.delete */
extern void T617f29(GE_context* ac, T0* C);
/* DIRECTORY.eif_dir_delete */
extern void T617f32(GE_context* ac, T0* C, T14 a1);
/* DIRECTORY.delete_content_with_action */
extern void T617f28(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* DIRECTORY.path */
extern T0* T617f15(GE_context* ac, T0* C);
/* PATH.make_from_pointer */
extern T0* T615c17(GE_context* ac, T14 a1);
/* PATH.reset_internal_data */
extern void T615f21(GE_context* ac, T0* C);
/* PATH.normalize */
extern void T615f20(GE_context* ac, T0* C);
/* PATH.directory_separator */
extern T2 T615f5(GE_context* ac, T0* C);
/* PATH.root_end_position */
extern T6 T615f4(GE_context* ac, T0* C);
/* PATH.next_directory_separator */
extern T6 T615f10(GE_context* ac, T0* C, T6 a1);
/* CHARACTER_8.as_lower */
extern T2 T2f24(GE_context* ac, T2* C);
/* PATH.is_character */
extern T1 T615f8(GE_context* ac, T0* C, T0* a1, T6 a2, T2 a3);
/* PATH.pointer_length_in_bytes */
extern T6 T615f13(GE_context* ac, T0* C, T14 a1);
/* PATH.c_pointer_length_in_bytes */
extern T11 T615f16(GE_context* ac, T0* C, T14 a1);
/* DIRECTORY.make_with_path */
extern void T617f23(GE_context* ac, T0* C, T0* a1);
/* DIRECTORY.make_with_path */
extern T0* T617c23(GE_context* ac, T0* a1);
/* FILE_INFO.is_directory */
extern T1 T119f20(GE_context* ac, T0* C);
/* FILE_INFO.is_symlink */
extern T1 T119f19(GE_context* ac, T0* C);
/* FILE_INFO.update */
extern void T119f26(GE_context* ac, T0* C, T0* a1);
/* PATH.name */
extern T0* T615f6(GE_context* ac, T0* C);
/* UTF_CONVERTER.utf_8_string_8_to_escaped_string_32 */
extern T0* T127f10(GE_context* ac, T127* C, T0* a1);
/* UTF_CONVERTER.utf_8_string_8_into_escaped_string_32 */
extern void T127f22(GE_context* ac, T127* C, T0* a1, T0* a2);
/* UTF_CONVERTER.utf_16le_string_8_to_escaped_string_32 */
extern T0* T127f9(GE_context* ac, T127* C, T0* a1);
/* UTF_CONVERTER.utf_16le_string_8_into_escaped_string_32 */
extern void T127f21(GE_context* ac, T127* C, T0* a1, T0* a2);
/* PATH.extended */
extern T0* T615f12(GE_context* ac, T0* C, T0* a1);
/* PATH.make_from_storage */
extern T0* T615c19(GE_context* ac, T0* a1);
/* PATH.internal_append_into */
extern void T615f18(GE_context* ac, T0* C, T0* a1, T0* a2, T2 a3);
/* UTF_CONVERTER.escaped_utf_32_string_into_utf_8_string_8 */
extern void T127f20(GE_context* ac, T127* C, T0* a1, T0* a2);
/* STRING_8.extend */
extern void T17f63(GE_context* ac, T0* C, T2 a1);
/* STRING_8.grow */
extern void T17f62(GE_context* ac, T0* C, T6 a1);
/* UTF_CONVERTER.escaped_utf_32_string_into_utf_16le_string_8 */
extern void T127f19(GE_context* ac, T127* C, T0* a1, T0* a2);
/* KL_DIRECTORY.path */
extern T0* T411f39(GE_context* ac, T0* C);
/* FILE_INFO.set_is_following_symlinks */
extern void T119f25(GE_context* ac, T0* C, T1 a1);
/* ARRAYED_LIST [READABLE_STRING_32].make */
extern T0* T618c7(GE_context* ac, T6 a1);
/* SPECIAL [READABLE_STRING_32].make_empty */
extern T0* T672c4(GE_context* ac, T6 a1);
/* KL_UNIX_FILE_SYSTEM.recursive_delete_directory */
extern void T93f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.unix_file_system */
extern T0* T459f17(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.file_system */
extern T0* T459f16(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.windows_file_system */
extern T0* T459f20(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.operating_system */
extern T0* T459f19(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.is_directory_executable */
extern T1 T459f13(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.exit_application */
extern void T365f41(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_DELETE_TASK.exceptions */
extern T0* T365f27(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.log_messages */
extern void T365f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.dir_attribute_name */
extern T0* T365f26(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.file_system */
extern T0* T365f25(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.unix_file_system */
extern T0* T365f30(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.windows_file_system */
extern T0* T365f29(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.operating_system */
extern T0* T365f28(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.execute */
extern void T363f31(GE_context* ac, T0* C);
/* GEANT_MKDIR_COMMAND.execute */
extern void T456f16(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.exit_application */
extern void T363f32(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_MKDIR_TASK.exceptions */
extern T0* T363f17(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.std */
extern T0* T363f16(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.log_messages */
extern void T363f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_MKDIR_TASK.project_variables_resolver */
extern T0* T363f10(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.dir_attribute_name */
extern T0* T363f15(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.file_system */
extern T0* T363f14(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.unix_file_system */
extern T0* T363f20(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.windows_file_system */
extern T0* T363f19(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.operating_system */
extern T0* T363f18(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.execute */
extern void T361f31(GE_context* ac, T0* C);
/* GEANT_ECHO_COMMAND.execute */
extern void T454f16(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.open_append */
extern void T528f27(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_append */
extern void T528f33(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.open_append */
extern void T528f33p1(GE_context* ac, T0* C);
/* GEANT_BOOLEAN_PROPERTY.non_empty_value_or_else */
extern T1 T432f6(GE_context* ac, T0* C, T1 a1);
/* GEANT_BOOLEAN_PROPERTY.value */
extern T1 T432f5(GE_context* ac, T0* C);
/* GEANT_BOOLEAN_PROPERTY.boolean_value */
extern T1 T432f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_BOOLEAN_PROPERTY.false_attribute_value */
extern unsigned char ge19os10522;
extern T0* ge19ov10522;
extern T0* T432f11(GE_context* ac, T0* C);
/* GEANT_BOOLEAN_PROPERTY.true_attribute_value */
extern unsigned char ge19os10521;
extern T0* ge19ov10521;
extern T0* T432f10(GE_context* ac, T0* C);
/* GEANT_BOOLEAN_PROPERTY.string_ */
extern T0* T432f9(GE_context* ac, T0* C);
/* GEANT_BOOLEAN_PROPERTY.string_value */
extern T0* T432f4(GE_context* ac, T0* C);
/* GEANT_BOOLEAN_PROPERTY.is_defined */
extern T1 T432f7(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.exit_application */
extern void T361f32(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_ECHO_TASK.exceptions */
extern T0* T361f17(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.std */
extern T0* T361f16(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.log_messages */
extern void T361f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_ECHO_TASK.project_variables_resolver */
extern T0* T361f10(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.dir_attribute_name */
extern T0* T361f15(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.file_system */
extern T0* T361f14(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.unix_file_system */
extern T0* T361f20(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.windows_file_system */
extern T0* T361f19(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.operating_system */
extern T0* T361f18(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.execute */
extern void T359f47(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.execute */
extern void T452f34(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.execute_with_target */
extern void T452f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.is_fileset_executable */
extern T1 T452f21(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.execute_forked_with_target */
extern void T452f37(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.string_ */
extern T0* T452f19(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.execute_with_filename */
extern void T452f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.is_exported_to_project */
extern T1 T33f62(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT.has_parent_with_name */
extern T1 T29f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT.string_ */
extern T0* T29f29(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].item */
extern T0* T251f11(GE_context* ac, T0* C, T6 a1);
/* GEANT_GEANT_COMMAND.exit_application */
extern void T452f39(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_GEANT_COMMAND.exceptions */
extern T0* T452f23(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.std */
extern T0* T452f22(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.log_messages */
extern void T452f41(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.execute_forked_with_filename_and_target */
extern void T452f35(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_COMMAND.execute_shell */
extern void T452f40(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.options_and_arguments_for_cmdline */
extern T0* T452f20(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.put */
extern void T32f87(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_COMMAND.project_variables_resolver */
extern T0* T452f18(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.unix_file_system */
extern T0* T452f17(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.file_system */
extern T0* T452f16(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.windows_file_system */
extern T0* T452f25(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.operating_system */
extern T0* T452f24(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.is_filename_executable */
extern T1 T452f14(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.dir_attribute_name */
extern T0* T359f32(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.file_system */
extern T0* T359f31(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.unix_file_system */
extern T0* T359f35(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.windows_file_system */
extern T0* T359f34(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.operating_system */
extern T0* T359f33(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.execute */
extern void T357f48(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.execute */
extern void T450f34(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.execute_shell */
extern void T450f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.unix_file_system */
extern T0* T450f19(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.file_system */
extern T0* T450f18(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.windows_file_system */
extern T0* T450f21(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.operating_system */
extern T0* T450f20(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.string_ */
extern T0* T450f17(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.exit_application */
extern void T357f49(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_GETEST_TASK.exceptions */
extern T0* T357f35(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.log_messages */
extern void T357f50(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.dir_attribute_name */
extern T0* T357f34(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.file_system */
extern T0* T357f33(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.unix_file_system */
extern T0* T357f38(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.windows_file_system */
extern T0* T357f37(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.operating_system */
extern T0* T357f36(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.execute */
extern void T355f43(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.execute */
extern void T448f29(GE_context* ac, T0* C);
/* GEANT_FILESET.has_map */
extern T1 T433f30(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.execute_shell */
extern void T448f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.is_file_outofdate */
extern T1 T448f18(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_COMMAND.unix_file_system */
extern T0* T448f17(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.file_system */
extern T0* T448f16(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.windows_file_system */
extern T0* T448f20(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.operating_system */
extern T0* T448f19(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.is_file_executable */
extern T1 T448f13(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.create_directory */
extern void T448f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.string_ */
extern T0* T448f15(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.exit_application */
extern void T355f44(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_GEPP_TASK.exceptions */
extern T0* T355f30(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.log_messages */
extern void T355f45(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.dir_attribute_name */
extern T0* T355f29(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.file_system */
extern T0* T355f28(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.unix_file_system */
extern T0* T355f33(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.windows_file_system */
extern T0* T355f32(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.operating_system */
extern T0* T355f31(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.execute */
extern void T353f43(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.execute */
extern void T446f27(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.execute_shell */
extern void T446f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.string_ */
extern T0* T446f15(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.unix_file_system */
extern T0* T446f14(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.file_system */
extern T0* T446f13(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.windows_file_system */
extern T0* T446f17(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.operating_system */
extern T0* T446f16(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.exit_application */
extern void T353f44(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_GEYACC_TASK.exceptions */
extern T0* T353f30(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.log_messages */
extern void T353f45(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.dir_attribute_name */
extern T0* T353f29(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.file_system */
extern T0* T353f28(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.unix_file_system */
extern T0* T353f33(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.windows_file_system */
extern T0* T353f32(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.operating_system */
extern T0* T353f31(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.execute */
extern void T351f46(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.execute */
extern void T444f35(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.execute_shell */
extern void T444f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.unix_file_system */
extern T0* T444f19(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.file_system */
extern T0* T444f18(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.windows_file_system */
extern T0* T444f21(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.operating_system */
extern T0* T444f20(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.string_ */
extern T0* T444f17(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.exit_application */
extern void T351f47(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_GELEX_TASK.exceptions */
extern T0* T351f33(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.log_messages */
extern void T351f48(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.dir_attribute_name */
extern T0* T351f32(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.file_system */
extern T0* T351f31(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.unix_file_system */
extern T0* T351f36(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.windows_file_system */
extern T0* T351f35(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.operating_system */
extern T0* T351f34(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.execute */
extern void T349f44(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.execute */
extern void T442f32(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.execute_shell */
extern void T442f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.unix_file_system */
extern T0* T442f20(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.file_system */
extern T0* T442f19(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.windows_file_system */
extern T0* T442f22(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.operating_system */
extern T0* T442f21(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.is_library_executable */
extern T1 T442f17(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.is_system_executable */
extern T1 T442f16(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.is_validate_executable */
extern T1 T442f15(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.string_ */
extern T0* T442f18(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.exit_application */
extern void T349f45(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_GEXACE_TASK.exceptions */
extern T0* T349f31(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.log_messages */
extern void T349f46(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.dir_attribute_name */
extern T0* T349f30(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.file_system */
extern T0* T349f29(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.unix_file_system */
extern T0* T349f34(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.windows_file_system */
extern T0* T349f33(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.operating_system */
extern T0* T349f32(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.execute */
extern void T347f32(GE_context* ac, T0* C);
/* GEANT_UNSET_COMMAND.execute */
extern void T439f10(GE_context* ac, T0* C);
/* GEANT_PROJECT.unset_variable */
extern void T29f52(GE_context* ac, T0* C, T0* a1);
/* GEANT_UNSET_TASK.exit_application */
extern void T347f33(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_UNSET_TASK.exceptions */
extern T0* T347f19(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.std */
extern T0* T347f18(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.log_messages */
extern void T347f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_UNSET_TASK.dir_attribute_name */
extern T0* T347f17(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.file_system */
extern T0* T347f16(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.unix_file_system */
extern T0* T347f22(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.windows_file_system */
extern T0* T347f21(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.operating_system */
extern T0* T347f20(GE_context* ac, T0* C);
/* GEANT_SET_TASK.execute */
extern void T345f33(GE_context* ac, T0* C);
/* GEANT_SET_COMMAND.execute */
extern void T437f17(GE_context* ac, T0* C);
/* GEANT_SET_COMMAND.default_builtin_variables */
extern T0* T437f8(GE_context* ac, T0* C);
/* GEANT_SET_COMMAND.file_system */
extern T0* T437f10(GE_context* ac, T0* C);
/* GEANT_SET_COMMAND.unix_file_system */
extern T0* T437f12(GE_context* ac, T0* C);
/* GEANT_SET_COMMAND.windows_file_system */
extern T0* T437f11(GE_context* ac, T0* C);
/* GEANT_SET_COMMAND.operating_system */
extern T0* T437f9(GE_context* ac, T0* C);
/* GEANT_SET_TASK.exit_application */
extern void T345f34(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_SET_TASK.exceptions */
extern T0* T345f20(GE_context* ac, T0* C);
/* GEANT_SET_TASK.std */
extern T0* T345f19(GE_context* ac, T0* C);
/* GEANT_SET_TASK.log_messages */
extern void T345f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_SET_TASK.dir_attribute_name */
extern T0* T345f18(GE_context* ac, T0* C);
/* GEANT_SET_TASK.file_system */
extern T0* T345f17(GE_context* ac, T0* C);
/* GEANT_SET_TASK.unix_file_system */
extern T0* T345f23(GE_context* ac, T0* C);
/* GEANT_SET_TASK.windows_file_system */
extern T0* T345f22(GE_context* ac, T0* C);
/* GEANT_SET_TASK.operating_system */
extern T0* T345f21(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.execute */
extern void T343f33(GE_context* ac, T0* C);
/* GEANT_LCC_COMMAND.execute */
extern void T435f17(GE_context* ac, T0* C);
/* GEANT_LCC_COMMAND.execute_shell */
extern void T435f18(GE_context* ac, T0* C, T0* a1);
/* GEANT_LCC_COMMAND.string_ */
extern T0* T435f10(GE_context* ac, T0* C);
/* GEANT_LCC_COMMAND.unix_file_system */
extern T0* T435f9(GE_context* ac, T0* C);
/* GEANT_LCC_COMMAND.file_system */
extern T0* T435f8(GE_context* ac, T0* C);
/* GEANT_LCC_COMMAND.windows_file_system */
extern T0* T435f12(GE_context* ac, T0* C);
/* GEANT_LCC_COMMAND.operating_system */
extern T0* T435f11(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.exit_application */
extern void T343f34(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_LCC_TASK.exceptions */
extern T0* T343f20(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.std */
extern T0* T343f19(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.log_messages */
extern void T343f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_LCC_TASK.dir_attribute_name */
extern T0* T343f18(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.file_system */
extern T0* T343f17(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.unix_file_system */
extern T0* T343f23(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.windows_file_system */
extern T0* T343f22(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.operating_system */
extern T0* T343f21(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.execute */
extern void T341f32(GE_context* ac, T0* C);
/* GEANT_EXEC_COMMAND.execute */
extern void T428f16(GE_context* ac, T0* C);
/* GEANT_EXEC_COMMAND.project_variables_resolver */
extern T0* T428f11(GE_context* ac, T0* C);
/* GEANT_EXEC_COMMAND.execute_shell */
extern void T428f18(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXEC_TASK.exit_application */
extern void T341f33(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_EXEC_TASK.exceptions */
extern T0* T341f18(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.std */
extern T0* T341f17(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.log_messages */
extern void T341f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXEC_TASK.project_variables_resolver */
extern T0* T341f11(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.dir_attribute_name */
extern T0* T341f16(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.file_system */
extern T0* T341f15(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.unix_file_system */
extern T0* T341f21(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.windows_file_system */
extern T0* T341f20(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.operating_system */
extern T0* T341f19(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.execute */
extern void T339f45(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.execute */
extern void T425f32(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.execute_clean */
extern void T425f34(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.delete_directory */
extern void T92f42(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.delete */
extern void T411f61(GE_context* ac, T0* C);
/* KL_DIRECTORY.is_empty */
extern T1 T411f30(GE_context* ac, T0* C);
/* KL_DIRECTORY.tmp_directory */
extern unsigned char ge154os10274;
extern T0* ge154ov10274;
extern T0* T411f36(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.delete_directory */
extern void T93f39(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_empty */
extern T1 T92f30(GE_context* ac, T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.is_directory_empty */
extern T1 T93f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_COMMAND.eifgen_directory */
extern T0* T425f19(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.file_system */
extern T0* T425f16(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.unix_file_system */
extern T0* T425f17(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.windows_file_system */
extern T0* T425f21(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.operating_system */
extern T0* T425f20(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.execute_compile */
extern void T425f33(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.cd */
extern void T92f40(GE_context* ac, T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.cd */
extern void T93f37(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_COMMAND.execute_shell */
extern void T425f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_COMMAND.string_ */
extern T0* T425f18(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.is_compilable */
extern T1 T425f14(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.exit_application */
extern void T339f46(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_ISE_TASK.exceptions */
extern T0* T339f32(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.log_messages */
extern void T339f47(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.dir_attribute_name */
extern T0* T339f31(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.file_system */
extern T0* T339f30(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.unix_file_system */
extern T0* T339f35(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.windows_file_system */
extern T0* T339f34(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.operating_system */
extern T0* T339f33(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.execute */
extern void T333f46(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.execute */
extern void T421f37(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.execute_shell */
extern void T421f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_COMMAND.new_ace_cmdline */
extern T0* T421f19(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.string_ */
extern T0* T421f24(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.unix_file_system */
extern T0* T421f22(GE_context* ac, T0* C);
/* KL_INTEGER_ROUTINES.append_decimal_integer */
extern void T269f5(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_GEC_COMMAND.integer_ */
extern T0* T421f23(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.is_ace_configuration */
extern T1 T421f16(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.file_system */
extern T0* T421f18(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.windows_file_system */
extern T0* T421f21(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.operating_system */
extern T0* T421f20(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.is_cleanable */
extern T1 T421f17(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.exit_application */
extern void T333f47(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_GEC_TASK.exceptions */
extern T0* T333f33(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.log_messages */
extern void T333f48(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.dir_attribute_name */
extern T0* T333f32(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.file_system */
extern T0* T333f31(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.unix_file_system */
extern T0* T333f36(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.windows_file_system */
extern T0* T333f35(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.operating_system */
extern T0* T333f34(GE_context* ac, T0* C);
/* XM_CHARACTER_DATA.node_set_parent */
extern void T326f4(GE_context* ac, T0* C, T0* a1);
/* XM_ATTRIBUTE.node_set_parent */
extern void T257f6(GE_context* ac, T0* C, T0* a1);
/* XM_PROCESSING_INSTRUCTION.node_set_parent */
extern void T325f6(GE_context* ac, T0* C, T0* a1);
/* XM_COMMENT.node_set_parent */
extern void T324f5(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.node_set_parent */
extern void T145f24(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_stream */
extern void T226f236(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T226f243(GE_context* ac, T0* C, T0* a1);
/* YY_FILE_BUFFER.name */
extern T0* T280f14(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.name */
extern T0* T268f26(GE_context* ac, T0* C);
/* KL_STRING_INPUT_STREAM.name */
extern unsigned char ge172os4852;
extern T0* ge172ov4852;
extern T0* T413f6(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T226f243p1(GE_context* ac, T0* C, T0* a1);
/* YY_FILE_BUFFER.set_position */
extern void T280f19(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.set_index */
extern void T280f18(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.new_file_buffer */
extern T0* T226f73(GE_context* ac, T0* C, T0* a1);
/* YY_FILE_BUFFER.make */
extern T0* T280c17(GE_context* ac, T0* a1);
/* YY_FILE_BUFFER.make_with_size */
extern void T280f21(GE_context* ac, T0* C, T0* a1, T6 a2);
/* YY_FILE_BUFFER.set_file */
extern void T280f23(GE_context* ac, T0* C, T0* a1);
/* YY_FILE_BUFFER.set_file_with_size */
extern void T280f25(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_CHARACTER_BUFFER.resize */
extern void T414f11(GE_context* ac, T0* C, T6 a1);
/* YY_FILE_BUFFER.flush */
extern void T280f26(GE_context* ac, T0* C);
/* YY_FILE_BUFFER.new_default_buffer */
extern T0* T280f16(GE_context* ac, T0* C, T6 a1);
/* YY_FILE_BUFFER.default_capacity */
extern unsigned char ge2590os9232;
extern T6 ge2590ov9232;
extern T6 T280f13(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_input_stream */
extern void T224f202(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T224f211(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T224f211p1(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.new_file_buffer */
extern T0* T224f55(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_stream */
extern void T223f232(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T223f239(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T223f239p1(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.new_file_buffer */
extern T0* T223f71(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_stream */
extern void T183f200(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T183f208(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T183f208p1(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.new_file_buffer */
extern T0* T183f46(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T226f237(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T226f237p1(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T226f237p0(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_action */
extern void T226f247(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.from_hexadecimal */
extern void T278f10(GE_context* ac, T0* C, T0* a1);
/* KL_STRING_ROUTINES.hexadecimal_to_integer */
extern T6 T116f13(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_CHARACTER_ENTITY.string_ */
extern T0* T278f7(GE_context* ac, T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.to_utf8 */
extern T0* T278f3(GE_context* ac, T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.utf8 */
extern T0* T278f6(GE_context* ac, T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_ascii */
extern T1 T278f2(GE_context* ac, T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_valid */
extern T1 T278f5(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.valid_non_surrogate_code */
extern T1 T390f3(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.unicode */
extern T0* T278f4(GE_context* ac, T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.from_decimal */
extern void T278f9(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.has_normalized_newline */
extern T1 T226f203(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_substring */
extern T0* T226f183(GE_context* ac, T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_PE_ENTITY_DEF.text_count */
extern T6 T226f182(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.system_literal_text */
extern T0* T226f164(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_item */
extern T2 T226f209(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern T0* T226f123(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern unsigned char ge1525os7873;
extern T0* ge1525ov7873;
extern T0* T226f123p1(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_line_column */
extern void T226f251(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text */
extern T0* T226f107(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.pop_start_condition */
extern void T226f250(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition */
extern void T226f248(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_last_token */
extern void T226f249(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_eof_action */
extern void T226f246(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.wrap */
extern T1 T226f101(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_refill_input_buffer */
extern void T226f245(GE_context* ac, T0* C);
/* YY_FILE_BUFFER.fill */
extern void T280f20(GE_context* ac, T0* C);
/* KL_CHARACTER_BUFFER.fill_from_stream */
extern T6 T414f5(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T6 T268f27(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T6 T268f27p1(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STRING_INPUT_STREAM.read_to_string */
extern T6 T413f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.compact_left */
extern void T280f22(GE_context* ac, T0* C);
/* KL_CHARACTER_BUFFER.move_left */
extern void T414f10(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.resize */
extern void T280f24(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_null_trans_state */
extern T6 T226f100(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_previous_state */
extern T6 T226f99(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.terminate */
extern void T226f244(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T224f203(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T224f203p1(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_action */
extern void T224f217(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.has_normalized_newline */
extern T1 T224f183(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_substring */
extern T0* T224f163(GE_context* ac, T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_SCANNER_DTD.text_count */
extern T6 T224f162(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.system_literal_text */
extern T0* T224f144(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_item */
extern T2 T224f197(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.normalized_newline */
extern T0* T224f106(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_line_column */
extern void T224f223(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.text */
extern T0* T224f80(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.pop_start_condition */
extern void T224f222(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition */
extern void T224f218(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_eof_action */
extern void T224f216(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.wrap */
extern T1 T224f68(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_refill_input_buffer */
extern void T224f215(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_null_trans_state */
extern T6 T224f67(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_previous_state */
extern T6 T224f66(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.fatal_error */
extern void T224f214(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.terminate */
extern void T224f213(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_last_token */
extern void T224f212(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T223f233(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T223f233p1(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_action */
extern void T223f242(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.has_normalized_newline */
extern T1 T223f200(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_substring */
extern T0* T223f180(GE_context* ac, T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_ENTITY_DEF.text_count */
extern T6 T223f179(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.system_literal_text */
extern T0* T223f161(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_item */
extern T2 T223f207(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T223f120(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T223f120p1(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_line_column */
extern void T223f247(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.text */
extern T0* T223f104(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.pop_start_condition */
extern void T223f246(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition */
extern void T223f243(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.set_last_token */
extern void T223f245(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_eof_action */
extern void T223f241(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.terminate */
extern void T223f244(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.wrap */
extern T1 T223f98(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_refill_input_buffer */
extern void T223f240(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_null_trans_state */
extern T6 T223f97(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_previous_state */
extern T6 T223f96(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.read_token */
extern void T183f201(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_execute_action */
extern void T183f212(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.has_normalized_newline */
extern T1 T183f181(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.text_substring */
extern T0* T183f161(GE_context* ac, T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_SCANNER.text_count */
extern T6 T183f160(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.system_literal_text */
extern T0* T183f142(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.text_item */
extern T2 T183f195(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.normalized_newline */
extern T0* T183f101(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_set_line_column */
extern void T183f220(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.text */
extern T0* T183f75(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.pop_start_condition */
extern void T183f219(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.set_start_condition */
extern void T183f221(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.push_start_condition */
extern void T183f213(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.set_last_token */
extern void T183f218(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.yy_execute_eof_action */
extern void T183f211(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.terminate */
extern void T183f217(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.wrap */
extern T1 T183f63(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_refill_input_buffer */
extern void T183f210(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_null_trans_state */
extern T6 T183f62(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.yy_previous_state */
extern T6 T183f61(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.fatal_error */
extern void T183f209(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T226f239(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition_dtd_ignore */
extern void T224f205(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T223f235(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T183f203(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_encoding */
extern void T226f240(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.set_encoding */
extern void T268f30(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_encoding */
extern void T224f206(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_encoding */
extern void T223f236(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_encoding */
extern void T183f204(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_from_resolver */
extern void T226f241(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_from_resolver */
extern void T224f207(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_from_resolver */
extern void T223f237(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T183f205(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.close_input */
extern void T226f238(GE_context* ac, T0* C);
/* KL_STRING_INPUT_STREAM.close */
extern void T413f11(GE_context* ac, T0* C);
/* KL_STRING_INPUT_STREAM.is_closable */
extern T1 T413f7(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.is_closable */
extern T1 T97f30(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.close_input */
extern void T224f204(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.close_input */
extern void T223f234(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.close_input */
extern void T183f202(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.on_start */
extern void T227f27(GE_context* ac, T0* C);
/* XM_CALLBACKS_NULL.on_start */
extern void T188f2(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T146f9(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T146f9p1(GE_context* ac, T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start */
extern void T143f14(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.on_finish */
extern void T227f28(GE_context* ac, T0* C);
/* XM_CALLBACKS_NULL.on_finish */
extern void T188f3(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T146f10(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T146f10p1(GE_context* ac, T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_finish */
extern void T143f15(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.on_comment */
extern void T227f29(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_comment */
extern void T188f4(GE_context* ac, T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T146f11(GE_context* ac, T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T146f11p1(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_comment */
extern void T143f16(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.handle_position */
extern void T143f24(GE_context* ac, T0* C, T0* a1);
/* XM_POSITION_TABLE.put */
extern void T147f5(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].put_last */
extern void T241f9(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].put_right */
extern void T331f4(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T331c3(GE_context* ac, T0* a1);
/* DS_PAIR [XM_POSITION, XM_NODE].make */
extern T0* T273c3(GE_context* ac, T0* a1, T0* a2);
/* XM_COMMENT.make_last_in_document */
extern T0* T324c4(GE_context* ac, T0* a1, T0* a2);
/* XM_COMMENT.make_last */
extern T0* T324c3(GE_context* ac, T0* a1, T0* a2);
/* XM_ELEMENT.force_last */
extern void T145f28(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].force_last */
extern void T239f13(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].force_last */
extern void T239f13p1(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_ELEMENT_NODE].make */
extern T0* T330c3(GE_context* ac, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].before_addition */
extern void T239f18(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.before_addition */
extern void T145f29(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.last */
extern T0* T145f18(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].last */
extern T0* T239f8(GE_context* ac, T0* C);
/* XM_ELEMENT.is_empty */
extern T1 T145f17(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].is_empty */
extern T1 T239f7(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.on_processing_instruction */
extern void T227f30(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_NULL.on_processing_instruction */
extern void T188f5(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T146f12(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T146f12p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_TO_TREE_FILTER.on_processing_instruction */
extern void T143f17(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_PROCESSING_INSTRUCTION.make_last_in_document */
extern T0* T325c5(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* XM_PROCESSING_INSTRUCTION.make_last */
extern T0* T325c4(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER.on_content */
extern void T227f31(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_content */
extern void T188f6(GE_context* ac, T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T146f13(GE_context* ac, T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T146f13p1(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_content */
extern void T143f18(GE_context* ac, T0* C, T0* a1);
/* XM_CHARACTER_DATA.make_last */
extern T0* T326c3(GE_context* ac, T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_start_tag */
extern void T227f34(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.push */
extern void T301f12(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].force_last */
extern void T408f10(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].put_right */
extern void T502f5(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].attach_left */
extern void T502f6(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T502c4(GE_context* ac, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.new_string_string_table */
extern T0* T301f8(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_equality_tester */
extern void T123f42(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.string_equality_tester */
extern T0* T301f9(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map_default */
extern T0* T123c40(GE_context* ac);
/* DS_HASH_TABLE [STRING_8, STRING_8].default_capacity */
extern T6 T123f37(GE_context* ac, T0* C);
/* XM_CALLBACKS_NULL.on_start_tag */
extern void T188f9(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T146f14(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T146f14p1(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag */
extern void T143f19(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_root */
extern T0* T145c26(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* XM_DOCUMENT.set_root_element */
extern void T144f15(GE_context* ac, T0* C, T0* a1);
/* XM_DOCUMENT.remove_previous_root_element */
extern void T144f16(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].go_after */
extern void T271f14(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_go_after */
extern void T232f28(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.make_last */
extern T0* T145c25(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.new_namespace */
extern T0* T143f8(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_NAMESPACE].force_last */
extern void T230f39(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_put */
extern void T230f44(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].clashes_put */
extern void T230f43(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].slots_item */
extern T6 T230f22(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].hash_position */
extern T6 T230f20(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE.hash_code */
extern T6 T231f6(GE_context* ac, T0* C);
/* DS_HASH_SET [XM_NAMESPACE].resize */
extern void T230f42(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_resize */
extern void T230f48(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].special_integer_ */
extern T0* T230f29(GE_context* ac, T0* C);
/* DS_HASH_SET [XM_NAMESPACE].key_storage_resize */
extern void T230f47(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_resize */
extern void T230f46(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].aliased_resized_area */
extern T0* T306f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_NAMESPACE].aliased_resized_area */
extern T0* T307f4(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].key_storage_item */
extern T0* T230f28(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_item */
extern T0* T230f18(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_item */
extern T6 T230f26(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_resize */
extern void T230f45(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_capacity */
extern T6 T230f19(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_put */
extern void T230f41(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].force */
extern void T306f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_NAMESPACE].fill_with */
extern void T307f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_NAMESPACE].extend */
extern void T307f8(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].search_position */
extern void T230f40(GE_context* ac, T0* C, T0* a1);
/* detachable KL_EQUALITY_TESTER [XM_NAMESPACE].test */
extern T1 T304f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_NAMESPACE].key_equality_tester */
extern T0* T230f25(GE_context* ac, T0* C);
/* XM_NAMESPACE.same_prefix */
extern T1 T231f5(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].item */
extern T0* T230f17(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].has */
extern T1 T230f30(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T227f32(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T227f32p1(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve_default */
extern T0* T301f3(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_pseudo_prefix */
extern unsigned char ge1449os9279;
extern T0* ge1449ov9279;
extern T0* T301f7(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.string_ */
extern T0* T227f14(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.on_delayed_attributes */
extern void T227f39(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_remove */
extern void T227f43(GE_context* ac, T0* C);
/* DS_LINKED_QUEUE [STRING_8].remove */
extern void T303f8(GE_context* ac, T0* C);
/* DS_LINKED_QUEUE [STRING_8].wipe_out */
extern void T303f9(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.unprefixed_attribute_namespace */
extern T0* T227f19(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.default_namespace */
extern unsigned char ge1416os8327;
extern T0* ge1416ov8327;
extern T0* T227f24(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns_namespace */
extern unsigned char ge1416os8335;
extern T0* ge1416ov8335;
extern T0* T227f18(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.is_xmlns */
extern T1 T227f9(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.same_string */
extern T1 T227f22(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.string_equality_tester */
extern T0* T227f25(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns */
extern unsigned char ge1416os8328;
extern T0* ge1416ov8328;
extern T0* T227f21(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.xml_prefix_namespace */
extern unsigned char ge1416os8334;
extern T0* ge1416ov8334;
extern T0* T227f17(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.is_xml */
extern T1 T227f16(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.xml_prefix */
extern unsigned char ge1416os8329;
extern T0* ge1416ov8329;
extern T0* T227f23(GE_context* ac, T0* C);
/* DS_LINKED_QUEUE [STRING_8].item */
extern T0* T303f5(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_is_empty */
extern T1 T227f12(GE_context* ac, T0* C);
/* DS_LINKED_QUEUE [STRING_8].is_empty */
extern T1 T303f4(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve */
extern T0* T301f2(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].back */
extern void T409f11(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_back */
extern void T408f18(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].add_traversing_cursor */
extern void T408f19(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_next_cursor */
extern void T409f13(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_traversing_cursor */
extern void T408f20(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set */
extern void T409f14(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].go_before */
extern void T409f10(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_go_before */
extern void T408f17(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_before */
extern void T409f15(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_off */
extern T1 T408f7(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].off */
extern T1 T409f7(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].item */
extern T0* T123f22(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_item */
extern T0* T123f25(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].has */
extern T1 T123f21(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].item */
extern T0* T409f6(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].finish */
extern void T409f9(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_finish */
extern void T408f16(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_namespace */
extern unsigned char ge1449os9280;
extern T0* ge1449ov9280;
extern T0* T301f6(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.has */
extern T1 T301f5(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.has_prefix */
extern T1 T227f10(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_start_tag_finish */
extern void T188f7(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T146f15(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T146f15p1(GE_context* ac, T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag_finish */
extern void T143f20(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T227f33(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.pop */
extern void T301f11(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_last */
extern void T408f9(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].set_last_cell */
extern void T408f14(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].forget_right */
extern void T502f7(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_last_cursors_after */
extern void T408f13(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_after */
extern void T409f12(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].wipe_out */
extern void T408f12(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_all_cursors_after */
extern void T408f15(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T227f33p1(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_NULL.on_end_tag */
extern void T188f8(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T146f16(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T146f16p1(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_end_tag */
extern void T143f21(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.parent_element */
extern T0* T145f15(GE_context* ac, T0* C);
extern T1 T145f15ot1(T0* a1, T0** a2);
/* XM_ELEMENT.is_root_node */
extern T1 T145f16(GE_context* ac, T0* C);
/* XM_DOCUMENT.is_root_node */
extern T1 T144f8(GE_context* ac, T0* C);
/* XM_DOCUMENT.parent */
extern T0* T144f9(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.on_error */
extern void T227f36(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_error */
extern void T188f11(GE_context* ac, T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T146f17(GE_context* ac, T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T146f17p1(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_error */
extern void T143f22(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_attribute */
extern void T227f35(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add */
extern void T301f14(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force_new */
extern void T123f54(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].last */
extern T0* T408f5(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.shallow_has */
extern T1 T301f4(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.attributes_force */
extern void T227f40(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* DS_LINKED_QUEUE [STRING_8].force */
extern void T303f7(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add_default */
extern void T301f13(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_attribute */
extern void T188f10(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T146f18(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T146f18p1(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_CALLBACKS_TO_TREE_FILTER.on_attribute */
extern void T143f23(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_ATTRIBUTE.make_last */
extern T0* T257c5(GE_context* ac, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER.on_xml_declaration */
extern void T227f44(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* XM_CALLBACKS_NULL.on_xml_declaration */
extern void T188f12(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* XM_STOP_ON_ERROR_FILTER.on_xml_declaration */
extern void T146f19(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_xml_declaration */
extern void T143f25(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* XM_NAMESPACE_RESOLVER.set_next */
extern void T227f41(GE_context* ac, T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.set_next */
extern void T146f8(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.set_next */
extern void T143f13(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_start */
extern void T123f55(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].add_traversing_cursor */
extern void T123f64(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].remove_traversing_cursor */
extern void T123f63(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_off */
extern T1 T123f35(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].off */
extern T1 T105f9(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].is_empty */
extern T1 T123f34(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_VARIABLES.cursor_start */
extern void T41f69(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.add_traversing_cursor */
extern void T41f73(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.remove_traversing_cursor */
extern void T41f72(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_off */
extern T1 T41f40(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.is_empty */
extern T1 T41f39(GE_context* ac, T0* C);
/* GEANT_VARIABLES.cursor_start */
extern void T36f71(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.add_traversing_cursor */
extern void T36f74(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.remove_traversing_cursor */
extern void T36f73(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_off */
extern T1 T36f40(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.is_empty */
extern T1 T36f39(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.cursor_start */
extern void T32f82(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.add_traversing_cursor */
extern void T32f85(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.remove_traversing_cursor */
extern void T32f84(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_off */
extern T1 T32f52(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.is_empty */
extern T1 T32f51(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_forth */
extern void T123f56(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_forth */
extern void T41f70(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_forth */
extern void T36f72(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_forth */
extern void T32f83(GE_context* ac, T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.reset */
extern void T113f40(GE_context* ac, T0* C);
/* AP_STRING_OPTION.reset */
extern void T44f28(GE_context* ac, T0* C);
/* AP_FLAG.reset */
extern void T42f22(GE_context* ac, T0* C);
/* AP_DISPLAY_HELP_FLAG.record_occurrence */
extern void T113f41(GE_context* ac, T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.display_help */
extern void T113f42(GE_context* ac, T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.exceptions */
extern T0* T113f15(GE_context* ac, T0* C);
/* AP_ERROR_HANDLER.report_info_message */
extern void T52f11(GE_context* ac, T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.full_help_text */
extern T0* T113f14(GE_context* ac, T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.option_help_text */
extern T0* T113f23(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_QUICK_SORTER [AP_OPTION].sort */
extern void T320f3(GE_context* ac, T0* C, T0* a1);
/* DS_QUICK_SORTER [AP_OPTION].sort_with_comparator */
extern void T320f4(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_QUICK_SORTER [AP_OPTION].subsort_with_comparator */
extern void T320f5(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* ARRAY [INTEGER_32].force */
extern void T265f12(GE_context* ac, T0* C, T6 a1, T6 a2);
/* ARRAY [INTEGER_32].capacity */
extern T6 T265f7(GE_context* ac, T0* C);
/* ARRAY [INTEGER_32].set_area */
extern void T265f15(GE_context* ac, T0* C, T0* a1);
/* ARRAY [INTEGER_32].make_empty_area */
extern void T265f14(GE_context* ac, T0* C, T6 a1);
/* ARRAY [INTEGER_32].additional_space */
extern T6 T265f6(GE_context* ac, T0* C);
/* ARRAY [INTEGER_32].empty_area */
extern T1 T265f5(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].swap */
extern void T114f28(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [AP_OPTION].replace */
extern void T114f27(GE_context* ac, T0* C, T0* a1, T6 a2);
/* AP_OPTION_COMPARATOR.less_than */
extern T1 T319f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.three_way_comparison */
extern T6 T116f14(GE_context* ac, T0* C, T0* a1, T0* a2);
/* AP_OPTION_COMPARATOR.string_ */
extern T0* T319f2(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].item */
extern T0* T114f16(GE_context* ac, T0* C, T6 a1);
/* ST_WORD_WRAPPER.wrapped_string */
extern T0* T322f5(GE_context* ac, T0* C, T0* a1);
/* ST_WORD_WRAPPER.canonify_whitespace */
extern void T322f12(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.put */
extern void T267f88(GE_context* ac, T0* C, T2 a1, T6 a2);
/* ST_WORD_WRAPPER.is_space */
extern T1 T322f8(GE_context* ac, T0* C, T2 a1);
/* ST_WORD_WRAPPER.string_ */
extern T0* T322f4(GE_context* ac, T0* C);
/* ST_WORD_WRAPPER.set_new_line_indentation */
extern void T322f10(GE_context* ac, T0* C, T6 a1);
/* AP_DISPLAY_HELP_FLAG.wrapper */
extern unsigned char ge104os6031;
extern T0* ge104ov6031;
extern T0* T113f18(GE_context* ac, T0* C);
/* ST_WORD_WRAPPER.set_maximum_text_width */
extern void T322f11(GE_context* ac, T0* C, T6 a1);
/* ST_WORD_WRAPPER.make */
extern T0* T322c9(GE_context* ac);
/* AP_DISPLAY_HELP_FLAG.full_usage_instruction */
extern T0* T113f16(GE_context* ac, T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.alternative_usage_instruction */
extern T0* T113f25(GE_context* ac, T0* C, T0* a1, T0* a2);
/* AP_DISPLAY_HELP_FLAG.arguments */
extern T0* T113f29(GE_context* ac, T0* C);
/* AP_DISPLAY_HELP_FLAG.file_system */
extern T0* T113f28(GE_context* ac, T0* C);
/* AP_DISPLAY_HELP_FLAG.unix_file_system */
extern T0* T113f34(GE_context* ac, T0* C);
/* AP_DISPLAY_HELP_FLAG.windows_file_system */
extern T0* T113f33(GE_context* ac, T0* C);
/* AP_DISPLAY_HELP_FLAG.operating_system */
extern T0* T113f32(GE_context* ac, T0* C);
/* AP_DISPLAY_HELP_FLAG.usage_instruction */
extern T0* T113f24(GE_context* ac, T0* C, T0* a1);
/* DS_QUICK_SORTER [AP_OPTION].make */
extern T0* T320c2(GE_context* ac, T0* a1);
/* AP_OPTION_COMPARATOR.default_create */
extern T0* T319c3(GE_context* ac);
/* AP_STRING_OPTION.record_occurrence */
extern void T44f30(GE_context* ac, T0* C, T0* a1);
/* AP_FLAG.record_occurrence */
extern void T42f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.force_last */
extern void T41f68(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.force_last */
extern void T36f70(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.force_last */
extern void T32f93(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.resize */
extern void T32f67(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.clashes_resize */
extern void T32f75(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.special_integer_ */
extern T0* T32f37(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.key_storage_resize */
extern void T32f74(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.item_storage_resize */
extern void T32f73(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.slots_resize */
extern void T32f72(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.new_capacity */
extern T6 T32f32(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.search */
extern void T41f71(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.search */
extern void T36f69(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.search */
extern void T32f81(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.start */
extern void T41f77(GE_context* ac, T0* C);
/* GEANT_VARIABLES.start */
extern void T36f77(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.start */
extern void T32f95(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_VARIABLES.forth */
extern void T41f78(GE_context* ac, T0* C);
/* GEANT_VARIABLES.forth */
extern void T36f78(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.forth */
extern void T32f96(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_VARIABLES.set_variable_value */
extern void T41f75(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.set_variable_value */
extern void T36f47(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.set_variable_value */
extern void T32f59(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.force */
extern void T32f62(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.replace */
extern void T41f76(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.replace */
extern void T36f76(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.replace */
extern void T32f94(GE_context* ac, T0* C, T0* a1, T0* a2);
/* SERIALIZATION_FAILURE.set_throwing_exception */
extern void T89f7(GE_context* ac, T0* C, T0* a1);
/* ADDRESS_APPLIED_TO_MELTED_FEATURE.set_throwing_exception */
extern void T88f7(GE_context* ac, T0* C, T0* a1);
/* DEVELOPER_EXCEPTION.set_throwing_exception */
extern void T87f11(GE_context* ac, T0* C, T0* a1);
/* MISMATCH_FAILURE.set_throwing_exception */
extern void T86f7(GE_context* ac, T0* C, T0* a1);
/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE.set_throwing_exception */
extern void T85f7(GE_context* ac, T0* C, T0* a1);
/* VOID_ASSIGNED_TO_EXPANDED.set_throwing_exception */
extern void T84f7(GE_context* ac, T0* C, T0* a1);
/* EXTERNAL_FAILURE.set_throwing_exception */
extern void T83f7(GE_context* ac, T0* C, T0* a1);
/* CREATE_ON_DEFERRED.set_throwing_exception */
extern void T82f7(GE_context* ac, T0* C, T0* a1);
/* RESUMPTION_FAILURE.set_throwing_exception */
extern void T81f7(GE_context* ac, T0* C, T0* a1);
/* RESCUE_FAILURE.set_throwing_exception */
extern void T80f7(GE_context* ac, T0* C, T0* a1);
/* LOOP_INVARIANT_VIOLATION.set_throwing_exception */
extern void T79f7(GE_context* ac, T0* C, T0* a1);
/* VARIANT_VIOLATION.set_throwing_exception */
extern void T78f7(GE_context* ac, T0* C, T0* a1);
/* BAD_INSPECT_VALUE.set_throwing_exception */
extern void T77f7(GE_context* ac, T0* C, T0* a1);
/* CHECK_VIOLATION.set_throwing_exception */
extern void T76f7(GE_context* ac, T0* C, T0* a1);
/* FLOATING_POINT_FAILURE.set_throwing_exception */
extern void T75f7(GE_context* ac, T0* C, T0* a1);
/* POSTCONDITION_VIOLATION.set_throwing_exception */
extern void T74f7(GE_context* ac, T0* C, T0* a1);
/* PRECONDITION_VIOLATION.set_throwing_exception */
extern void T73f7(GE_context* ac, T0* C, T0* a1);
/* EIFFEL_RUNTIME_PANIC.set_throwing_exception */
extern void T70f10(GE_context* ac, T0* C, T0* a1);
/* COM_FAILURE.set_throwing_exception */
extern void T69f14(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_FAILURE.set_throwing_exception */
extern void T68f8(GE_context* ac, T0* C, T0* a1);
/* IO_FAILURE.set_throwing_exception */
extern void T67f10(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_SIGNAL_FAILURE.set_throwing_exception */
extern void T66f8(GE_context* ac, T0* C, T0* a1);
/* INVARIANT_VIOLATION.set_throwing_exception */
extern void T65f8(GE_context* ac, T0* C, T0* a1);
/* NO_MORE_MEMORY.set_throwing_exception */
extern void T64f11(GE_context* ac, T0* C, T0* a1);
/* OLD_VIOLATION.set_throwing_exception */
extern void T62f7(GE_context* ac, T0* C, T0* a1);
/* ROUTINE_FAILURE.set_throwing_exception */
extern void T60f11(GE_context* ac, T0* C, T0* a1);
/* VOID_TARGET.set_throwing_exception */
extern void T58f7(GE_context* ac, T0* C, T0* a1);
/* SERIALIZATION_FAILURE.set_exception_trace */
extern void T89f8(GE_context* ac, T0* C, T0* a1);
/* ADDRESS_APPLIED_TO_MELTED_FEATURE.set_exception_trace */
extern void T88f8(GE_context* ac, T0* C, T0* a1);
/* DEVELOPER_EXCEPTION.set_exception_trace */
extern void T87f12(GE_context* ac, T0* C, T0* a1);
/* MISMATCH_FAILURE.set_exception_trace */
extern void T86f8(GE_context* ac, T0* C, T0* a1);
/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE.set_exception_trace */
extern void T85f8(GE_context* ac, T0* C, T0* a1);
/* VOID_ASSIGNED_TO_EXPANDED.set_exception_trace */
extern void T84f8(GE_context* ac, T0* C, T0* a1);
/* EXTERNAL_FAILURE.set_exception_trace */
extern void T83f8(GE_context* ac, T0* C, T0* a1);
/* CREATE_ON_DEFERRED.set_exception_trace */
extern void T82f8(GE_context* ac, T0* C, T0* a1);
/* RESUMPTION_FAILURE.set_exception_trace */
extern void T81f8(GE_context* ac, T0* C, T0* a1);
/* RESCUE_FAILURE.set_exception_trace */
extern void T80f8(GE_context* ac, T0* C, T0* a1);
/* LOOP_INVARIANT_VIOLATION.set_exception_trace */
extern void T79f8(GE_context* ac, T0* C, T0* a1);
/* VARIANT_VIOLATION.set_exception_trace */
extern void T78f8(GE_context* ac, T0* C, T0* a1);
/* BAD_INSPECT_VALUE.set_exception_trace */
extern void T77f8(GE_context* ac, T0* C, T0* a1);
/* CHECK_VIOLATION.set_exception_trace */
extern void T76f8(GE_context* ac, T0* C, T0* a1);
/* FLOATING_POINT_FAILURE.set_exception_trace */
extern void T75f8(GE_context* ac, T0* C, T0* a1);
/* POSTCONDITION_VIOLATION.set_exception_trace */
extern void T74f8(GE_context* ac, T0* C, T0* a1);
/* PRECONDITION_VIOLATION.set_exception_trace */
extern void T73f8(GE_context* ac, T0* C, T0* a1);
/* EIFFEL_RUNTIME_PANIC.set_exception_trace */
extern void T70f11(GE_context* ac, T0* C, T0* a1);
/* COM_FAILURE.set_exception_trace */
extern void T69f17(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_FAILURE.set_exception_trace */
extern void T68f10(GE_context* ac, T0* C, T0* a1);
/* IO_FAILURE.set_exception_trace */
extern void T67f12(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_SIGNAL_FAILURE.set_exception_trace */
extern void T66f10(GE_context* ac, T0* C, T0* a1);
/* INVARIANT_VIOLATION.set_exception_trace */
extern void T65f10(GE_context* ac, T0* C, T0* a1);
/* NO_MORE_MEMORY.set_exception_trace */
extern void T64f9(GE_context* ac, T0* C, T0* a1);
/* OLD_VIOLATION.set_exception_trace */
extern void T62f8(GE_context* ac, T0* C, T0* a1);
/* ROUTINE_FAILURE.set_exception_trace */
extern void T60f12(GE_context* ac, T0* C, T0* a1);
/* VOID_TARGET.set_exception_trace */
extern void T58f8(GE_context* ac, T0* C, T0* a1);
/* SERIALIZATION_FAILURE.set_description */
extern void T89f9(GE_context* ac, T0* C, T0* a1);
/* C_STRING.set_count */
extern void T129f8(GE_context* ac, T0* C, T6 a1);
/* UTF_CONVERTER.utf_32_string_into_utf_8_0_pointer */
extern void T127f11(GE_context* ac, T127* C, T0* a1, T0* a2, T6 a3, T0* a4);
/* ADDRESS_APPLIED_TO_MELTED_FEATURE.set_description */
extern void T88f9(GE_context* ac, T0* C, T0* a1);
/* DEVELOPER_EXCEPTION.set_description */
extern void T87f13(GE_context* ac, T0* C, T0* a1);
/* MISMATCH_FAILURE.set_description */
extern void T86f9(GE_context* ac, T0* C, T0* a1);
/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE.set_description */
extern void T85f9(GE_context* ac, T0* C, T0* a1);
/* VOID_ASSIGNED_TO_EXPANDED.set_description */
extern void T84f9(GE_context* ac, T0* C, T0* a1);
/* EXTERNAL_FAILURE.set_description */
extern void T83f9(GE_context* ac, T0* C, T0* a1);
/* CREATE_ON_DEFERRED.set_description */
extern void T82f9(GE_context* ac, T0* C, T0* a1);
/* RESUMPTION_FAILURE.set_description */
extern void T81f9(GE_context* ac, T0* C, T0* a1);
/* RESCUE_FAILURE.set_description */
extern void T80f9(GE_context* ac, T0* C, T0* a1);
/* LOOP_INVARIANT_VIOLATION.set_description */
extern void T79f9(GE_context* ac, T0* C, T0* a1);
/* VARIANT_VIOLATION.set_description */
extern void T78f9(GE_context* ac, T0* C, T0* a1);
/* BAD_INSPECT_VALUE.set_description */
extern void T77f9(GE_context* ac, T0* C, T0* a1);
/* CHECK_VIOLATION.set_description */
extern void T76f9(GE_context* ac, T0* C, T0* a1);
/* FLOATING_POINT_FAILURE.set_description */
extern void T75f9(GE_context* ac, T0* C, T0* a1);
/* POSTCONDITION_VIOLATION.set_description */
extern void T74f9(GE_context* ac, T0* C, T0* a1);
/* PRECONDITION_VIOLATION.set_description */
extern void T73f9(GE_context* ac, T0* C, T0* a1);
/* EIFFEL_RUNTIME_PANIC.set_description */
extern void T70f12(GE_context* ac, T0* C, T0* a1);
/* COM_FAILURE.set_description */
extern void T69f18(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_FAILURE.set_description */
extern void T68f11(GE_context* ac, T0* C, T0* a1);
/* IO_FAILURE.set_description */
extern void T67f13(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_SIGNAL_FAILURE.set_description */
extern void T66f11(GE_context* ac, T0* C, T0* a1);
/* INVARIANT_VIOLATION.set_description */
extern void T65f11(GE_context* ac, T0* C, T0* a1);
/* NO_MORE_MEMORY.set_description */
extern void T64f12(GE_context* ac, T0* C, T0* a1);
/* OLD_VIOLATION.set_description */
extern void T62f9(GE_context* ac, T0* C, T0* a1);
/* ROUTINE_FAILURE.set_description */
extern void T60f13(GE_context* ac, T0* C, T0* a1);
/* VOID_TARGET.set_description */
extern void T58f9(GE_context* ac, T0* C, T0* a1);
/* SERIALIZATION_FAILURE.set_recipient_name */
extern void T89f10(GE_context* ac, T0* C, T0* a1);
/* ADDRESS_APPLIED_TO_MELTED_FEATURE.set_recipient_name */
extern void T88f10(GE_context* ac, T0* C, T0* a1);
/* DEVELOPER_EXCEPTION.set_recipient_name */
extern void T87f14(GE_context* ac, T0* C, T0* a1);
/* MISMATCH_FAILURE.set_recipient_name */
extern void T86f10(GE_context* ac, T0* C, T0* a1);
/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE.set_recipient_name */
extern void T85f10(GE_context* ac, T0* C, T0* a1);
/* VOID_ASSIGNED_TO_EXPANDED.set_recipient_name */
extern void T84f10(GE_context* ac, T0* C, T0* a1);
/* EXTERNAL_FAILURE.set_recipient_name */
extern void T83f10(GE_context* ac, T0* C, T0* a1);
/* CREATE_ON_DEFERRED.set_recipient_name */
extern void T82f10(GE_context* ac, T0* C, T0* a1);
/* RESUMPTION_FAILURE.set_recipient_name */
extern void T81f10(GE_context* ac, T0* C, T0* a1);
/* RESCUE_FAILURE.set_recipient_name */
extern void T80f10(GE_context* ac, T0* C, T0* a1);
/* LOOP_INVARIANT_VIOLATION.set_recipient_name */
extern void T79f10(GE_context* ac, T0* C, T0* a1);
/* VARIANT_VIOLATION.set_recipient_name */
extern void T78f10(GE_context* ac, T0* C, T0* a1);
/* BAD_INSPECT_VALUE.set_recipient_name */
extern void T77f10(GE_context* ac, T0* C, T0* a1);
/* CHECK_VIOLATION.set_recipient_name */
extern void T76f10(GE_context* ac, T0* C, T0* a1);
/* FLOATING_POINT_FAILURE.set_recipient_name */
extern void T75f10(GE_context* ac, T0* C, T0* a1);
/* POSTCONDITION_VIOLATION.set_recipient_name */
extern void T74f10(GE_context* ac, T0* C, T0* a1);
/* PRECONDITION_VIOLATION.set_recipient_name */
extern void T73f10(GE_context* ac, T0* C, T0* a1);
/* EIFFEL_RUNTIME_PANIC.set_recipient_name */
extern void T70f13(GE_context* ac, T0* C, T0* a1);
/* COM_FAILURE.set_recipient_name */
extern void T69f19(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_FAILURE.set_recipient_name */
extern void T68f12(GE_context* ac, T0* C, T0* a1);
/* IO_FAILURE.set_recipient_name */
extern void T67f14(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_SIGNAL_FAILURE.set_recipient_name */
extern void T66f12(GE_context* ac, T0* C, T0* a1);
/* INVARIANT_VIOLATION.set_recipient_name */
extern void T65f12(GE_context* ac, T0* C, T0* a1);
/* NO_MORE_MEMORY.set_recipient_name */
extern void T64f13(GE_context* ac, T0* C, T0* a1);
/* OLD_VIOLATION.set_recipient_name */
extern void T62f10(GE_context* ac, T0* C, T0* a1);
/* ROUTINE_FAILURE.set_recipient_name */
extern void T60f14(GE_context* ac, T0* C, T0* a1);
/* VOID_TARGET.set_recipient_name */
extern void T58f10(GE_context* ac, T0* C, T0* a1);
/* SERIALIZATION_FAILURE.set_type_name */
extern void T89f11(GE_context* ac, T0* C, T0* a1);
/* ADDRESS_APPLIED_TO_MELTED_FEATURE.set_type_name */
extern void T88f11(GE_context* ac, T0* C, T0* a1);
/* DEVELOPER_EXCEPTION.set_type_name */
extern void T87f15(GE_context* ac, T0* C, T0* a1);
/* MISMATCH_FAILURE.set_type_name */
extern void T86f11(GE_context* ac, T0* C, T0* a1);
/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE.set_type_name */
extern void T85f11(GE_context* ac, T0* C, T0* a1);
/* VOID_ASSIGNED_TO_EXPANDED.set_type_name */
extern void T84f11(GE_context* ac, T0* C, T0* a1);
/* EXTERNAL_FAILURE.set_type_name */
extern void T83f11(GE_context* ac, T0* C, T0* a1);
/* CREATE_ON_DEFERRED.set_type_name */
extern void T82f11(GE_context* ac, T0* C, T0* a1);
/* RESUMPTION_FAILURE.set_type_name */
extern void T81f11(GE_context* ac, T0* C, T0* a1);
/* RESCUE_FAILURE.set_type_name */
extern void T80f11(GE_context* ac, T0* C, T0* a1);
/* LOOP_INVARIANT_VIOLATION.set_type_name */
extern void T79f11(GE_context* ac, T0* C, T0* a1);
/* VARIANT_VIOLATION.set_type_name */
extern void T78f11(GE_context* ac, T0* C, T0* a1);
/* BAD_INSPECT_VALUE.set_type_name */
extern void T77f11(GE_context* ac, T0* C, T0* a1);
/* CHECK_VIOLATION.set_type_name */
extern void T76f11(GE_context* ac, T0* C, T0* a1);
/* FLOATING_POINT_FAILURE.set_type_name */
extern void T75f11(GE_context* ac, T0* C, T0* a1);
/* POSTCONDITION_VIOLATION.set_type_name */
extern void T74f11(GE_context* ac, T0* C, T0* a1);
/* PRECONDITION_VIOLATION.set_type_name */
extern void T73f11(GE_context* ac, T0* C, T0* a1);
/* EIFFEL_RUNTIME_PANIC.set_type_name */
extern void T70f14(GE_context* ac, T0* C, T0* a1);
/* COM_FAILURE.set_type_name */
extern void T69f20(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_FAILURE.set_type_name */
extern void T68f13(GE_context* ac, T0* C, T0* a1);
/* IO_FAILURE.set_type_name */
extern void T67f15(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_SIGNAL_FAILURE.set_type_name */
extern void T66f13(GE_context* ac, T0* C, T0* a1);
/* INVARIANT_VIOLATION.set_type_name */
extern void T65f13(GE_context* ac, T0* C, T0* a1);
/* NO_MORE_MEMORY.set_type_name */
extern void T64f14(GE_context* ac, T0* C, T0* a1);
/* OLD_VIOLATION.set_type_name */
extern void T62f11(GE_context* ac, T0* C, T0* a1);
/* ROUTINE_FAILURE.set_type_name */
extern void T60f15(GE_context* ac, T0* C, T0* a1);
/* VOID_TARGET.set_type_name */
extern void T58f11(GE_context* ac, T0* C, T0* a1);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T633f3(GE_context* ac, T0* C, T6 a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T631f2(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T629f3(GE_context* ac, T0* C, T6 a1);
/* GEANT_REPLACE_TASK.is_executable */
extern T1 T385f18(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.is_executable */
extern T1 T482f14(GE_context* ac, T0* C);
/* KL_BOOLEAN_ROUTINES.nxor */
extern T1 T545f1(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.is_fileset_to_directory_executable */
extern T1 T482f17(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.boolean_ */
extern unsigned char ge123os6545;
extern T0* ge123ov6545;
extern T0* T482f15(GE_context* ac, T0* C);
/* KL_BOOLEAN_ROUTINES.default_create */
extern T0* T545c2(GE_context* ac);
/* GEANT_INPUT_TASK.is_executable */
extern T1 T383f20(GE_context* ac, T0* C);
/* GEANT_INPUT_COMMAND.is_executable */
extern T1 T480f11(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.is_executable */
extern T1 T381f6(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_COMMAND.is_executable */
extern T1 T478f9(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_COMMAND.validate_condition */
extern void T478f20(GE_context* ac, T0* C, T1 a1, T0* a2, T0* a3);
/* GEANT_AVAILABLE_COMMAND.validation_messages */
extern T0* T478f16(GE_context* ac, T0* C);
/* DS_CELL [BOOLEAN].put */
extern void T541f3(GE_context* ac, T0* C, T1 a1);
/* DS_CELL [BOOLEAN].make */
extern T0* T541c2(GE_context* ac, T1 a1);
/* GEANT_PRECURSOR_TASK.is_executable */
extern T1 T379f17(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_COMMAND.is_executable */
extern T1 T476f7(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.is_executable */
extern T1 T377f10(GE_context* ac, T0* C);
/* GEANT_EXIT_COMMAND.is_executable */
extern T1 T474f6(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.is_executable */
extern T1 T375f15(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_executable */
extern T1 T472f11(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_fileset_executable */
extern T1 T472f13(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.is_executable */
extern T1 T373f29(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.is_executable */
extern T1 T469f17(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.is_executable */
extern T1 T371f11(GE_context* ac, T0* C);
/* GEANT_SETENV_COMMAND.is_executable */
extern T1 T466f7(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.is_executable */
extern T1 T369f13(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.is_executable */
extern T1 T464f9(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.is_fileset_to_directory_executable */
extern T1 T464f12(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.is_executable */
extern T1 T367f19(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.is_executable */
extern T1 T462f10(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.is_fileset_to_directory_executable */
extern T1 T462f14(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.boolean_ */
extern T0* T462f11(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.is_executable */
extern T1 T365f19(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.is_executable */
extern T1 T459f10(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.boolean_ */
extern T0* T459f11(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.is_executable */
extern T1 T363f6(GE_context* ac, T0* C);
/* GEANT_MKDIR_COMMAND.is_executable */
extern T1 T456f8(GE_context* ac, T0* C);
/* GEANT_MKDIR_COMMAND.validate_condition */
extern void T456f17(GE_context* ac, T0* C, T1 a1, T0* a2, T0* a3);
/* GEANT_MKDIR_COMMAND.validation_messages */
extern T0* T456f12(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.is_executable */
extern T1 T361f6(GE_context* ac, T0* C);
/* GEANT_ECHO_COMMAND.is_executable */
extern T1 T454f9(GE_context* ac, T0* C);
/* GEANT_ECHO_COMMAND.validate_condition */
extern void T454f17(GE_context* ac, T0* C, T1 a1, T0* a2, T0* a3);
/* GEANT_ECHO_COMMAND.validation_messages */
extern T0* T454f11(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.is_executable */
extern T1 T359f25(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.is_executable */
extern T1 T452f13(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.is_target_executable */
extern T1 T452f15(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.is_executable */
extern T1 T357f27(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.is_executable */
extern T1 T450f16(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.is_executable */
extern T1 T355f22(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.is_executable */
extern T1 T448f12(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.is_fileset_executable */
extern T1 T448f14(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.is_executable */
extern T1 T353f22(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.is_executable */
extern T1 T446f12(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.is_executable */
extern T1 T351f25(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.is_executable */
extern T1 T444f16(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.is_executable */
extern T1 T349f23(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.is_executable */
extern T1 T442f13(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.boolean_ */
extern T0* T442f14(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.is_executable */
extern T1 T347f10(GE_context* ac, T0* C);
/* GEANT_UNSET_COMMAND.is_executable */
extern T1 T439f6(GE_context* ac, T0* C);
/* GEANT_SET_TASK.is_executable */
extern T1 T345f11(GE_context* ac, T0* C);
/* GEANT_SET_COMMAND.is_executable */
extern T1 T437f7(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.is_executable */
extern T1 T343f11(GE_context* ac, T0* C);
/* GEANT_LCC_COMMAND.is_executable */
extern T1 T435f7(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.is_executable */
extern T1 T341f7(GE_context* ac, T0* C);
/* GEANT_EXEC_COMMAND.is_executable */
extern T1 T428f9(GE_context* ac, T0* C);
/* GEANT_EXEC_COMMAND.validate_condition */
extern void T428f17(GE_context* ac, T0* C, T1 a1, T0* a2, T0* a3);
/* GEANT_EXEC_COMMAND.validation_messages */
extern T0* T428f12(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.is_executable */
extern T1 T339f24(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.is_executable */
extern T1 T425f13(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.is_cleanable */
extern T1 T425f15(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.is_executable */
extern T1 T333f25(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.is_executable */
extern T1 T421f15(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.is_enabled */
extern T1 T385f19(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.unless_attribute_name */
extern T0* T385f23(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.if_attribute_name */
extern T0* T385f22(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.is_enabled */
extern T1 T383f21(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.unless_attribute_name */
extern T0* T383f25(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.if_attribute_name */
extern T0* T383f24(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.is_enabled */
extern T1 T381f7(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.unless_attribute_name */
extern T0* T381f13(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.has_attribute */
extern T1 T381f12(GE_context* ac, T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.if_attribute_name */
extern T0* T381f11(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.is_enabled */
extern T1 T379f18(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.unless_attribute_name */
extern T0* T379f22(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.if_attribute_name */
extern T0* T379f21(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.is_enabled */
extern T1 T377f11(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.unless_attribute_name */
extern T0* T377f15(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.if_attribute_name */
extern T0* T377f14(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.is_enabled */
extern T1 T375f16(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.unless_attribute_name */
extern T0* T375f20(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.if_attribute_name */
extern T0* T375f19(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.is_enabled */
extern T1 T373f30(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.unless_attribute_name */
extern T0* T373f34(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.if_attribute_name */
extern T0* T373f33(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.is_enabled */
extern T1 T371f12(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.unless_attribute_name */
extern T0* T371f16(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.if_attribute_name */
extern T0* T371f15(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.is_enabled */
extern T1 T369f14(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.unless_attribute_name */
extern T0* T369f18(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.if_attribute_name */
extern T0* T369f17(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.is_enabled */
extern T1 T367f20(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.unless_attribute_name */
extern T0* T367f24(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.if_attribute_name */
extern T0* T367f23(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.is_enabled */
extern T1 T365f20(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.unless_attribute_name */
extern T0* T365f24(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.if_attribute_name */
extern T0* T365f23(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.is_enabled */
extern T1 T363f7(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.unless_attribute_name */
extern T0* T363f13(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.has_attribute */
extern T1 T363f12(GE_context* ac, T0* C, T0* a1);
/* GEANT_MKDIR_TASK.if_attribute_name */
extern T0* T363f11(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.is_enabled */
extern T1 T361f7(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.unless_attribute_name */
extern T0* T361f13(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.has_attribute */
extern T1 T361f12(GE_context* ac, T0* C, T0* a1);
/* GEANT_ECHO_TASK.if_attribute_name */
extern T0* T361f11(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.is_enabled */
extern T1 T359f26(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.unless_attribute_name */
extern T0* T359f30(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.if_attribute_name */
extern T0* T359f29(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.is_enabled */
extern T1 T357f28(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.unless_attribute_name */
extern T0* T357f32(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.if_attribute_name */
extern T0* T357f31(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.is_enabled */
extern T1 T355f23(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.unless_attribute_name */
extern T0* T355f27(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.if_attribute_name */
extern T0* T355f26(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.is_enabled */
extern T1 T353f23(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.unless_attribute_name */
extern T0* T353f27(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.if_attribute_name */
extern T0* T353f26(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.is_enabled */
extern T1 T351f26(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.unless_attribute_name */
extern T0* T351f30(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.if_attribute_name */
extern T0* T351f29(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.is_enabled */
extern T1 T349f24(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.unless_attribute_name */
extern T0* T349f28(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.if_attribute_name */
extern T0* T349f27(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.is_enabled */
extern T1 T347f11(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.unless_attribute_name */
extern T0* T347f15(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.if_attribute_name */
extern T0* T347f14(GE_context* ac, T0* C);
/* GEANT_SET_TASK.is_enabled */
extern T1 T345f12(GE_context* ac, T0* C);
/* GEANT_SET_TASK.unless_attribute_name */
extern T0* T345f16(GE_context* ac, T0* C);
/* GEANT_SET_TASK.if_attribute_name */
extern T0* T345f15(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.is_enabled */
extern T1 T343f12(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.unless_attribute_name */
extern T0* T343f16(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.if_attribute_name */
extern T0* T343f15(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.is_enabled */
extern T1 T341f8(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.unless_attribute_name */
extern T0* T341f14(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.has_attribute */
extern T1 T341f13(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXEC_TASK.if_attribute_name */
extern T0* T341f12(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.is_enabled */
extern T1 T339f25(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.unless_attribute_name */
extern T0* T339f29(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.if_attribute_name */
extern T0* T339f28(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.is_enabled */
extern T1 T333f26(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.unless_attribute_name */
extern T0* T333f30(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.if_attribute_name */
extern T0* T333f29(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.is_exit_command */
extern T1 T385f20(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.is_exit_command */
extern T1 T482f13(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.is_exit_command */
extern T1 T383f22(GE_context* ac, T0* C);
/* GEANT_INPUT_COMMAND.is_exit_command */
extern T1 T480f10(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.is_exit_command */
extern T1 T381f8(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_COMMAND.is_exit_command */
extern T1 T478f10(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.is_exit_command */
extern T1 T379f19(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_COMMAND.is_exit_command */
extern T1 T476f6(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.is_exit_command */
extern T1 T377f12(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.is_exit_command */
extern T1 T375f17(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_exit_command */
extern T1 T472f16(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.is_exit_command */
extern T1 T373f31(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.is_exit_command */
extern T1 T469f18(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.is_exit_command */
extern T1 T371f13(GE_context* ac, T0* C);
/* GEANT_SETENV_COMMAND.is_exit_command */
extern T1 T466f6(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.is_exit_command */
extern T1 T369f15(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.is_exit_command */
extern T1 T464f8(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.is_exit_command */
extern T1 T367f21(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.is_exit_command */
extern T1 T462f9(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.is_exit_command */
extern T1 T365f21(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.is_exit_command */
extern T1 T459f9(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.is_exit_command */
extern T1 T363f8(GE_context* ac, T0* C);
/* GEANT_MKDIR_COMMAND.is_exit_command */
extern T1 T456f9(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.is_exit_command */
extern T1 T361f8(GE_context* ac, T0* C);
/* GEANT_ECHO_COMMAND.is_exit_command */
extern T1 T454f10(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.is_exit_command */
extern T1 T359f27(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.is_exit_command */
extern T1 T452f12(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.is_exit_command */
extern T1 T357f29(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.is_exit_command */
extern T1 T450f15(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.is_exit_command */
extern T1 T355f24(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.is_exit_command */
extern T1 T448f11(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.is_exit_command */
extern T1 T353f24(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.is_exit_command */
extern T1 T446f11(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.is_exit_command */
extern T1 T351f27(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.is_exit_command */
extern T1 T444f15(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.is_exit_command */
extern T1 T349f25(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.is_exit_command */
extern T1 T442f12(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.is_exit_command */
extern T1 T347f12(GE_context* ac, T0* C);
/* GEANT_UNSET_COMMAND.is_exit_command */
extern T1 T439f5(GE_context* ac, T0* C);
/* GEANT_SET_TASK.is_exit_command */
extern T1 T345f13(GE_context* ac, T0* C);
/* GEANT_SET_COMMAND.is_exit_command */
extern T1 T437f6(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.is_exit_command */
extern T1 T343f13(GE_context* ac, T0* C);
/* GEANT_LCC_COMMAND.is_exit_command */
extern T1 T435f6(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.is_exit_command */
extern T1 T341f9(GE_context* ac, T0* C);
/* GEANT_EXEC_COMMAND.is_exit_command */
extern T1 T428f10(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.is_exit_command */
extern T1 T339f26(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.is_exit_command */
extern T1 T425f12(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.is_exit_command */
extern T1 T333f27(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.is_exit_command */
extern T1 T421f14(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.exit_code */
extern T6 T385f21(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.exit_code */
extern T6 T383f23(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.exit_code */
extern T6 T381f9(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.exit_code */
extern T6 T379f20(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.exit_code */
extern T6 T377f13(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.exit_code */
extern T6 T375f18(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.exit_code */
extern T6 T373f32(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.exit_code */
extern T6 T371f14(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.exit_code */
extern T6 T369f16(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.exit_code */
extern T6 T367f22(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.exit_code */
extern T6 T365f22(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.exit_code */
extern T6 T363f9(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.exit_code */
extern T6 T361f9(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.exit_code */
extern T6 T359f28(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.exit_code */
extern T6 T357f30(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.exit_code */
extern T6 T355f25(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.exit_code */
extern T6 T353f25(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.exit_code */
extern T6 T351f28(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.exit_code */
extern T6 T349f26(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.exit_code */
extern T6 T347f13(GE_context* ac, T0* C);
/* GEANT_SET_TASK.exit_code */
extern T6 T345f14(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.exit_code */
extern T6 T343f14(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.exit_code */
extern T6 T341f10(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.exit_code */
extern T6 T339f27(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.exit_code */
extern T6 T333f28(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.error_position */
extern T0* T226f60(GE_context* ac, T0* C);
/* XM_DEFAULT_POSITION.make */
extern T0* T184c5(GE_context* ac, T0* a1, T6 a2, T6 a3, T6 a4);
/* XM_EIFFEL_SCANNER_DTD.error_position */
extern T0* T224f56(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.error_position */
extern T0* T223f58(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.error_position */
extern T0* T183f66(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.end_of_file */
extern T1 T226f62(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.end_of_file */
extern T1 T224f63(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.end_of_file */
extern T1 T223f60(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.end_of_file */
extern T1 T183f68(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_applicable_encoding */
extern T1 T226f63(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_applicable_encoding */
extern T1 T268f16(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_valid_encoding */
extern T1 T268f9(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.is_applicable_encoding */
extern T1 T224f49(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.is_applicable_encoding */
extern T1 T223f61(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.is_applicable_encoding */
extern T1 T183f69(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.start_condition */
extern T6 T226f64(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.start_condition */
extern T6 T224f51(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.start_condition */
extern T6 T223f62(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.start_condition */
extern T6 T183f44(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_item */
extern T0* T123f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_item */
extern T0* T41f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.item_storage_item */
extern T0* T41f38(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.cursor_item */
extern T0* T36f37(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_item */
extern T0* T32f45(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_key */
extern T0* T123f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_key */
extern T0* T41f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_key */
extern T0* T36f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_key */
extern T0* T32f46(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.character_32_item */
extern T3 T267f41(GE_context* ac, T0* C, T6 a1);
/* IMMUTABLE_STRING_32.item */
extern T3 T125f7(GE_context* ac, T0* C, T6 a1);
/* STRING_32.item */
extern T3 T18f10(GE_context* ac, T0* C, T6 a1);
/* STRING_8.character_32_item */
extern T3 T17f21(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.substring */
extern T0* T267f42(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.make_from_substring */
extern T0* T267c67(GE_context* ac, T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.make_from_substring_general */
extern void T267f80(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* IMMUTABLE_STRING_32.substring */
extern T0* T125f8(GE_context* ac, T0* C, T6 a1, T6 a2);
/* IMMUTABLE_STRING_32.empty_string */
extern unsigned char ge2413os6323;
extern T0* ge2413ov6323;
extern T0* T125f9(GE_context* ac, T0* C);
/* STRING_32.substring */
extern T0* T18f11(GE_context* ac, T0* C, T6 a1, T6 a2);
/* STRING_32.new_string */
extern T0* T18f12(GE_context* ac, T0* C, T6 a1);
/* STRING_8.substring */
extern T0* T17f11(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.code */
extern T10 T267f35(GE_context* ac, T0* C, T6 a1);
/* IMMUTABLE_STRING_32.code */
extern T10 T125f5(GE_context* ac, T0* C, T6 a1);
/* STRING_32.code */
extern T10 T18f5(GE_context* ac, T0* C, T6 a1);
/* STRING_8.code */
extern T10 T17f23(GE_context* ac, T0* C, T6 a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.default_message */
extern T0* T620f5(GE_context* ac, T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.message */
extern T0* T620f3(GE_context* ac, T0* C, T0* a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.arguments */
extern T0* T620f6(GE_context* ac, T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.string_ */
extern T0* T620f4(GE_context* ac, T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.default_message */
extern T0* T596f5(GE_context* ac, T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.message */
extern T0* T596f3(GE_context* ac, T0* C, T0* a1);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.arguments */
extern T0* T596f6(GE_context* ac, T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.string_ */
extern T0* T596f4(GE_context* ac, T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.default_message */
extern T0* T595f5(GE_context* ac, T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.message */
extern T0* T595f3(GE_context* ac, T0* C, T0* a1);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.arguments */
extern T0* T595f6(GE_context* ac, T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.string_ */
extern T0* T595f4(GE_context* ac, T0* C);
/* LX_FULL_AND_REJECT_ERROR.default_message */
extern T0* T594f5(GE_context* ac, T0* C);
/* LX_FULL_AND_REJECT_ERROR.message */
extern T0* T594f3(GE_context* ac, T0* C, T0* a1);
/* LX_FULL_AND_REJECT_ERROR.arguments */
extern T0* T594f6(GE_context* ac, T0* C);
/* LX_FULL_AND_REJECT_ERROR.string_ */
extern T0* T594f4(GE_context* ac, T0* C);
/* LX_FULL_AND_META_ERROR.default_message */
extern T0* T593f5(GE_context* ac, T0* C);
/* LX_FULL_AND_META_ERROR.message */
extern T0* T593f3(GE_context* ac, T0* C, T0* a1);
/* LX_FULL_AND_META_ERROR.arguments */
extern T0* T593f6(GE_context* ac, T0* C);
/* LX_FULL_AND_META_ERROR.string_ */
extern T0* T593f4(GE_context* ac, T0* C);
/* LX_BAD_CHARACTER_ERROR.default_message */
extern T0* T592f5(GE_context* ac, T0* C);
/* LX_BAD_CHARACTER_ERROR.message */
extern T0* T592f3(GE_context* ac, T0* C, T0* a1);
/* LX_BAD_CHARACTER_ERROR.arguments */
extern T0* T592f6(GE_context* ac, T0* C);
/* LX_BAD_CHARACTER_ERROR.string_ */
extern T0* T592f4(GE_context* ac, T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.default_message */
extern T0* T591f5(GE_context* ac, T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.message */
extern T0* T591f3(GE_context* ac, T0* C, T0* a1);
/* LX_BAD_CHARACTER_CLASS_ERROR.arguments */
extern T0* T591f6(GE_context* ac, T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.string_ */
extern T0* T591f4(GE_context* ac, T0* C);
/* LX_MISSING_QUOTE_ERROR.default_message */
extern T0* T590f5(GE_context* ac, T0* C);
/* LX_MISSING_QUOTE_ERROR.message */
extern T0* T590f3(GE_context* ac, T0* C, T0* a1);
/* LX_MISSING_QUOTE_ERROR.arguments */
extern T0* T590f6(GE_context* ac, T0* C);
/* LX_MISSING_QUOTE_ERROR.string_ */
extern T0* T590f4(GE_context* ac, T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.default_message */
extern T0* T589f5(GE_context* ac, T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.message */
extern T0* T589f3(GE_context* ac, T0* C, T0* a1);
/* LX_UNRECOGNIZED_RULE_ERROR.arguments */
extern T0* T589f6(GE_context* ac, T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.string_ */
extern T0* T589f4(GE_context* ac, T0* C);
/* UT_SYNTAX_ERROR.default_message */
extern T0* T587f5(GE_context* ac, T0* C);
/* UT_SYNTAX_ERROR.message */
extern T0* T587f3(GE_context* ac, T0* C, T0* a1);
/* UT_SYNTAX_ERROR.arguments */
extern T0* T587f6(GE_context* ac, T0* C);
/* UT_SYNTAX_ERROR.string_ */
extern T0* T587f4(GE_context* ac, T0* C);
/* UT_VERSION_NUMBER.default_message */
extern T0* T56f3(GE_context* ac, T0* C);
/* UT_VERSION_NUMBER.message */
extern T0* T56f5(GE_context* ac, T0* C, T0* a1);
/* UT_VERSION_NUMBER.arguments */
extern T0* T56f7(GE_context* ac, T0* C);
/* UT_VERSION_NUMBER.string_ */
extern T0* T56f6(GE_context* ac, T0* C);
/* AP_DISPLAY_HELP_FLAG.was_found */
extern T1 T113f10(GE_context* ac, T0* C);
/* AP_STRING_OPTION.was_found */
extern T1 T44f15(GE_context* ac, T0* C);
/* AP_FLAG.was_found */
extern T1 T42f9(GE_context* ac, T0* C);
/* AP_STRING_OPTION.occurrences */
extern T6 T44f17(GE_context* ac, T0* C);
/* AP_DISPLAY_HELP_FLAG.allows_parameter */
extern T1 T113f21(GE_context* ac, T0* C);
/* AP_STRING_OPTION.allows_parameter */
extern T1 T44f16(GE_context* ac, T0* C);
/* AP_FLAG.allows_parameter */
extern T1 T42f11(GE_context* ac, T0* C);
/* AP_DISPLAY_HELP_FLAG.needs_parameter */
extern T1 T113f9(GE_context* ac, T0* C);
/* AP_FLAG.needs_parameter */
extern T1 T42f10(GE_context* ac, T0* C);
/* AP_DISPLAY_HELP_FLAG.name */
extern T0* T113f11(GE_context* ac, T0* C);
/* AP_STRING_OPTION.name */
extern T0* T44f11(GE_context* ac, T0* C);
/* AP_FLAG.name */
extern T0* T42f14(GE_context* ac, T0* C);
/* AP_DISPLAY_HELP_FLAG.names */
extern T0* T113f22(GE_context* ac, T0* C);
/* AP_STRING_OPTION.names */
extern T0* T44f18(GE_context* ac, T0* C);
/* AP_STRING_OPTION.has_long_form */
extern T1 T44f20(GE_context* ac, T0* C);
/* AP_STRING_OPTION.names */
extern T0* T44f18p1(GE_context* ac, T0* C);
/* AP_FLAG.names */
extern T0* T42f15(GE_context* ac, T0* C);
/* AP_DISPLAY_HELP_FLAG.example */
extern T0* T113f27(GE_context* ac, T0* C);
/* AP_STRING_OPTION.example */
extern T0* T44f19(GE_context* ac, T0* C);
/* AP_FLAG.example */
extern T0* T42f16(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_VARIABLES.found */
extern T1 T41f36(GE_context* ac, T0* C);
/* GEANT_VARIABLES.found */
extern T1 T36f36(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.found */
extern T1 T32f44(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_VARIABLES.found_item */
extern T0* T41f41(GE_context* ac, T0* C);
/* GEANT_VARIABLES.found_item */
extern T0* T36f41(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.found_item */
extern T0* T32f53(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_VARIABLES.after */
extern T1 T41f42(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_VARIABLES.cursor_after */
extern T1 T41f45(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.after */
extern T1 T36f42(GE_context* ac, T0* C);
/* GEANT_VARIABLES.cursor_after */
extern T1 T36f45(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.after */
extern T1 T32f54(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.cursor_after */
extern T1 T32f57(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.key_for_iteration */
extern T0* T41f43(GE_context* ac, T0* C);
/* GEANT_VARIABLES.key_for_iteration */
extern T0* T36f43(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.key_for_iteration */
extern T0* T32f55(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_VARIABLES.item_for_iteration */
extern T0* T41f44(GE_context* ac, T0* C);
/* GEANT_VARIABLES.item_for_iteration */
extern T0* T36f44(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.item_for_iteration */
extern T0* T32f56(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_VARIABLES.has */
extern T1 T41f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.has */
extern T1 T36f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.has */
extern T1 T32f49(GE_context* ac, T0* C, T0* a1);
extern T0* GE_ma40(T6 c, T6 n, ...);
extern T0* GE_ma265(T6 c, T6 n, ...);
extern T0* GE_ma229(T6 c, T6 n, ...);
extern T0* GE_ma573(T6 c, T6 n, ...);
extern T0* GE_ma546(T6 c, T6 n, ...);
extern T0* GE_mt27(T6 a1, T6 a2, T6 a3, T0* a4, T0* a5, T0* a6, T0* a7, T0* a8, T0* a9, T6 a10, T1 a11);
extern T0* GE_mt619(T0* a1);
extern T0* GE_mt671(T0* a1);
extern T0* ge133ov6067;
extern T0* ge169ov3423;
extern T0* ge223ov7564;
extern T0* ge233ov9034;
extern T0* ge154ov10276;
extern T0* ge154ov10277;
extern T0* ge156ov4696;
extern T0* ge171ov3423;
extern T0* ge177ov4740;
extern T0* ge177ov4741;
extern T0* ge162ov5008;
extern T0* ge162ov5007;
extern T0* ge174ov4740;
extern T0* ge174ov4741;
extern T0* ge1511ov6529;
extern T0* ge1511ov6528;
extern T0* ge309ov12808;
extern T0* ge160ov3423;
extern T0* ge1363ov3408;
extern T0* ge424ov10722;
extern T0* ge155ov4899;
extern T0* ge457ov10413;
extern T0* ge260ov3423;
extern T0* ge1518ov6977;
extern T0* ge1518ov6939;
extern T0* ge1518ov6937;
extern T0* ge1518ov6978;
extern T0* ge1518ov6950;
extern T0* ge1518ov6949;
extern T0* ge1518ov6960;
extern T0* ge1518ov6954;
extern T0* ge1518ov6953;
extern T0* ge1518ov6952;
extern T0* ge1518ov6958;
extern T0* ge1518ov6957;
extern T0* ge1518ov6959;
extern T0* ge1518ov6936;
extern T0* ge1518ov6962;
extern T0* ge1518ov6971;
extern T0* ge1521ov6669;
extern T0* ge1521ov6667;
extern T0* ge1521ov6668;
extern T0* ge1518ov6972;
extern T0* ge1518ov6973;
extern T0* ge1518ov6976;
extern T0* ge1518ov6974;
extern T0* ge1518ov6975;
extern T0* ge1518ov6969;
extern T0* ge1514ov8655;
extern T0* ge1514ov8656;
extern T0* ge1518ov6942;
extern T0* ge1518ov6965;
extern T0* ge1518ov6985;
extern T0* ge1518ov6986;
extern T0* ge1518ov6987;
extern T0* ge1518ov6980;
extern T0* ge1518ov6963;
extern T0* ge1518ov6964;
extern T0* ge1518ov6966;
extern T0* ge1518ov6970;
extern T0* ge1468ov7276;
extern T0* ge177ov4751;
extern T0* ge174ov4751;
extern T0* ge103ov3104;
extern T0* ge106ov3390;
extern T0* ge106ov3397;
extern T0* ge193ov1955;
extern T0* ge106ov3393;
extern T0* ge106ov3400;
extern T0* ge106ov3391;
extern T0* ge106ov3398;
extern T0* ge106ov3392;
extern T0* ge106ov3399;
extern T0* ge106ov3394;
extern T0* ge106ov3401;
extern T0* ge106ov3395;
extern T0* ge106ov3402;
extern T0* ge103ov3099;
extern T0* ge103ov3098;
extern T0* ge103ov3106;
extern T0* ge103ov3105;
extern T0* ge428ov11482;
extern T0* ge428ov11519;
extern T0* ge428ov11504;
extern T0* ge428ov11497;
extern T0* ge428ov11507;
extern T0* ge428ov11500;
extern T0* ge428ov11508;
extern T0* ge428ov11517;
extern T0* ge428ov11510;
extern T0* ge428ov11506;
extern T0* ge428ov11494;
extern T0* ge428ov11495;
extern T0* ge428ov11509;
extern T0* ge428ov11496;
extern T0* ge428ov11483;
extern T0* ge428ov11484;
extern T0* ge428ov11485;
extern T0* ge428ov11491;
extern T0* ge428ov11493;
extern T0* ge428ov11488;
extern T0* ge428ov11513;
extern T0* ge428ov11512;
extern T0* ge428ov11489;
extern T0* ge428ov11490;
extern T0* ge428ov11487;
extern T0* ge428ov11486;
extern T0* ge42ov10043;
extern T0* ge157ov4878;
extern T0* ge155ov4901;
extern T0* ge2314ov10337;
extern T0* ge2314ov10338;
extern T0* ge154ov10275;
extern T0* ge1525ov7875;
extern T0* ge1525ov7876;
extern T0* ge1516ov9042;
extern T0* ge1516ov9044;
extern T0* ge1448ov8714;
extern T0* ge1448ov8715;
extern T0* ge104ov6019;
extern T0* ge104ov6020;
extern T0* ge104ov6021;
extern T0* ge104ov6018;
extern T0* ge1516ov9041;
extern T0* ge1516ov9043;
extern T0* ge294ov3406;
extern T0* ge280ov3406;
extern T0* ge286ov3406;
extern T0* ge285ov3406;
extern T0* ge284ov3406;
extern T0* ge275ov3406;
extern T0* ge274ov3406;
extern T0* ge291ov3406;
extern T0* ge304ov3406;
extern T0* ge1367ov3406;
extern T0* ge1372ov3406;
extern void GE_init_const1(void);
extern void GE_init_const2(void);
extern void GE_init_const(void);
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
	copyright: "Copyright (c) 2006-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_EXCEPT_H
#define EIF_EXCEPT_H

#include <errno.h>
#ifndef GE_EXCEPTION_H
#include <ge_exception.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
	Predefined exception codes.
 */
#define EN_VOID		GE_EX_VOID			/* Feature applied to void reference */
#define EN_MEM		GE_EX_MEM			/* No more memory */
#define EN_PRE		GE_EX_PRE			/* Pre-condition violated */
#define EN_POST		GE_EX_POST			/* Post-condition violated */
#define EN_FLOAT	GE_EX_FLOAT			/* Floating point exception (signal SIGFPE) */
#define EN_CINV		GE_EX_CINV			/* Class invariant violated */
#define EN_CHECK	GE_EX_CHECK			/* Assertion violated */
#define EN_FAIL		GE_EX_FAIL			/* Routine failure */
#define EN_WHEN		GE_EX_WHEN			/* Unmatched inspect value */
#define EN_VAR		GE_EX_VAR			/* Non-decreasing loop variant */
#define EN_LINV		GE_EX_LINV			/* Loop invariant violated */
#define EN_SIG		GE_EX_SIG			/* Operating system signal */
#define EN_BYE		GE_EX_BYE			/* Eiffel run-time panic */
#define EN_RESC		GE_EX_RESC			/* Exception in rescue clause */
#define EN_OMEM		GE_EX_OMEM			/* Out of memory (cannot be ignored) */
#define EN_RES		GE_EX_RES			/* Resumption failed (retry did not succeed) */
#define EN_CDEF		GE_EX_CDEF			/* Create on deferred */
#define EN_EXT		GE_EX_EXT			/* External event */
#define EN_VEXP		GE_EX_VEXP			/* Void assigned to expanded */
#define EN_HDLR		GE_EX_HDLR			/* Exception in signal handler */
#define EN_IO		GE_EX_IO			/* I/O error */
#define EN_SYS		GE_EX_SYS			/* Operating system error */
#define EN_RETR		GE_EX_RETR			/* Retrieval error */
#define EN_PROG		GE_EX_PROG			/* Developer exception */
#define EN_FATAL	GE_EX_FATAL			/* Eiffel run-time fatal error */
#define EN_DOL		GE_EX_DOL			/* $ applied to melted feature */
#define EN_ISE_IO	GE_EX_ISE_IO		/* I/O error raised by the ISE Eiffel runtime */
#define EN_COM		GE_EX_COM			/* COM error raised by EiffelCOM runtime */
#define EN_RT_CHECK	GE_EX_RT_CHECK		/* Runtime check error such as out-of-bound array access */
#define EN_OLD		GE_EX_OLD			/* Old violation */
#define EN_SEL		GE_EX_SEL			/* Serialization failure */
#define EN_DIRTY	GE_EX_DIRTY			/* SCOOP processor dirty exception. */
#define EN_NEX		GE_EX_NEX			/* Number of internal exceptions */

/*
	Raise an Eiffel exception.
*/
extern void eraise(const char* name, long code);

/*
	Raise an Eiffel exception of the given code with no associated tag.
*/
extern void xraise(int code);

/*
	Raise an "Operating system error" exception.
*/
extern void esys(void);

/*
	As a special case, an I/O error is raised when a system call which is I/O bound fails.
*/
extern void eise_io(const char* tag);

/*
	Raise a "No more memory" exception.
*/
extern void enomem(void);

/*
	Raise EiffelCOM exception.
*/
extern void com_eraise(const char* tag, long num);

/*
	Terminate execution with exit status 'code',
	without triggering an exception.
*/
extern void esdie(int code);

/*
	Exception tag associated with 'code'.
	This is a duplication from Eiffel classes, but still used for trace printing and in EiffelCom.
*/
extern EIF_REFERENCE eename(long except);

/*
	Is exception 'ex' defined?
	Used in EiffelCOM.
*/
extern char eedefined(long ex);

/*
	Enable/diable printing of the exception trace.
	Per thead information.
*/
extern void eetrace(char b);

/*
	Is current execution during rescue?
*/
extern EIF_BOOLEAN eif_is_in_rescue(void);

#ifdef EIF_WINDOWS
/*
	Set default exception handler.
*/
extern void set_windows_exception_filter();
#endif

/*
	Used in EiffelCOM.
*/
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
	copyright: "Copyright (c) 2007-2016, Eric Bezault and others"
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

/* THREAD_ENVIRONMENT */
#define eif_thr_thread_id() NULL

/* THREAD_CONTROL */
#define eif_thr_yield()
#define eif_thr_join_all()

/* THREAD */
#define eif_thr_create_with_attr(current_obj, init_func, attr)
#define eif_thr_wait(term)
#define eif_thr_wait_with_timeout(term,tms) EIF_FALSE
#define eif_thr_last_thread() NULL
#define eif_thr_exit()

/* THREAD_ATTRIBUTES */
#define eif_thr_default_priority() 0
#define eif_thr_min_priority() 0
#define eif_thr_max_priority() 0

/* MUTEX */
#define eif_thr_mutex_create() NULL
#define eif_thr_mutex_lock(a_mutex_pointer)
#define eif_thr_mutex_trylock(a_mutex_pointer) EIF_FALSE
#define eif_thr_mutex_unlock(a_mutex_pointer)
#define eif_thr_mutex_destroy(a_mutex_pointer)

/* CONDITION_VARIABLE */
#define eif_thr_cond_create() NULL
#define eif_thr_cond_broadcast(a_cond_ptr)
#define eif_thr_cond_signal(a_cond_ptr)
#define eif_thr_cond_wait(a_cond_ptr,a_mutex_ptr)
#define eif_thr_cond_wait_with_timeout(a_cond_ptr,a_mutex_ptr,a_timeout) 0
#define eif_thr_cond_destroy(a_mutex_ptr)

/* SEMAPHORE */
#define eif_thr_sem_create(count) NULL
#define eif_thr_sem_wait(a_sem_pointer)
#define eif_thr_sem_post(a_sem_pointer)
#define eif_thr_sem_trywait(a_sem_pointer) EIF_FALSE
#define eif_thr_sem_destroy(a_sem_pointer)

/* READ_WRITE_LOCK */
#define eif_thr_rwl_create() NULL
#define eif_thr_rwl_rdlock(an_item)
#define eif_thr_rwl_unlock(an_item)
#define eif_thr_rwl_wrlock(an_item)
#define eif_thr_rwl_destroy(an_item)

#define eif_thr_sleep(nanoseconds)

#else

/* THREAD_ENVIRONMENT */
#define eif_thr_thread_id() GE_thread_id()

/* THREAD_CONTROL */
#define eif_thr_yield() GE_thread_yield()
#define eif_thr_join_all() GE_thread_join_all()

/* THREAD */
#define eif_thr_create_with_attr(current_obj,init_func,attr) GE_thread_create_with_attr((current_obj),(init_func),(EIF_THR_ATTR_TYPE*)(attr))
#define eif_thr_wait(term) GE_thread_wait(term)
#define eif_thr_wait_with_timeout(term,tms) GE_thread_wait_with_timeout((term),(tms))
#define eif_thr_last_thread() GE_last_thread_created()
#define eif_thr_exit() GE_thread_exit()

/* THREAD_ATTRIBUTES */
#define eif_thr_default_priority() GE_thread_default_priority()
#define eif_thr_min_priority() GE_thread_min_priority()
#define eif_thr_max_priority() GE_thread_max_priority()

/* MUTEX */
#define eif_thr_mutex_create() GE_mutex_create()
#define eif_thr_mutex_lock(a_mutex_pointer) GE_mutex_lock(a_mutex_pointer)
#define eif_thr_mutex_trylock(a_mutex_pointer) GE_mutex_trylock(a_mutex_pointer)
#define eif_thr_mutex_unlock(a_mutex_pointer) GE_mutex_unlock(a_mutex_pointer)
#define eif_thr_mutex_destroy(a_mutex_pointer) GE_mutex_destroy(a_mutex_pointer)

/* CONDITION_VARIABLE */
#define eif_thr_cond_create() NULL
#define eif_thr_cond_broadcast(a_cond_ptr)
#define eif_thr_cond_signal(a_cond_ptr)
#define eif_thr_cond_wait(a_cond_ptr,a_mutex_ptr)
#define eif_thr_cond_wait_with_timeout(a_cond_ptr,a_mutex_ptr,a_timeout) 0
#define eif_thr_cond_destroy(a_mutex_ptr)

/* SEMAPHORE */
#define eif_thr_sem_create(count) NULL
#define eif_thr_sem_wait(a_sem_pointer)
#define eif_thr_sem_post(a_sem_pointer)
#define eif_thr_sem_trywait(a_sem_pointer) EIF_FALSE
#define eif_thr_sem_destroy(a_sem_pointer)

/* READ_WRITE_LOCK */
#define eif_thr_rwl_create() NULL
#define eif_thr_rwl_rdlock(an_item)
#define eif_thr_rwl_unlock(an_item)
#define eif_thr_rwl_wrlock(an_item)
#define eif_thr_rwl_destroy(an_item)

#define eif_thr_sleep(nanoseconds)

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
#include <string.h>
#include <stdlib.h>
