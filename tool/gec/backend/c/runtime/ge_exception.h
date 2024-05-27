/*
	description:

		"C functions used to implement class EXCEPTION"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2024, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef GE_EXCEPTION_H
#define GE_EXCEPTION_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_EIFFEL_H
#include "ge_eiffel.h"
#endif
#ifndef GE_ONCE_H
#include "ge_once.h"
#endif
#ifdef GE_USE_THREADS
#ifndef GE_THREAD_TYPES_H
#include "ge_thread_types.h"
#endif
#endif

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
#ifdef GE_USE_CURRENT_IN_EXCEPTION_TRACE
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
typedef struct GE_context_struct GE_context;
struct GE_context_struct {
	GE_call* call; /* Call stack */
	uint32_t in_assertion; /* Is an assertion evaluated? */
	GE_rescue* last_rescue; /* Context of last feature entered containing a rescue clause */
	uint32_t in_rescue; /* Number of rescue clauses currently being executed */
	EIF_REFERENCE exception_manager; /* Exception manager */
	char raising_exception; /* Is an exception currently being raised? */
	char exception_trace_enabled; /* Should exception trace be displayed? */
	long exception_code; /* Code of the exception currently being raised, 0 otherwise */
	const char* exception_tag; /* Tag of the exception currently being raised, NULL otherwise */
	GE_exception_trace_buffer exception_trace_buffer; /* String buffer used to build the exception trace */
	GE_exception_trace_buffer last_exception_trace; /* Last non-routine-failure exception trace */
	int signal_number; /* Number of last signal received */
	int pre_ecma_mapping_status; /* Do we map old names to new name? (i.e. STRING to STRING_8, INTEGER to INTEGER_32, ...). */
#ifdef GE_USE_THREADS
	GE_thread_context* thread; /* Thread context */
	GE_onces* process_onces; /* Cache for status and results of onces-per-process */
	GE_onces* thread_onces; /* Status and results of onces-per-thread */
#endif
#ifdef GE_USE_SCOOP
	GE_scoop_region* region; /* SCOOP region whose processor is executing the current code */
	volatile char is_region_alive;
#endif
};
#define TC GE_context

/*
 * Default initialization for `GE_context'.
 */
extern GE_context GE_default_context;

/*
 * Execution context of main thread.
 */
extern GE_context* GE_main_context;

/*
 * Execution context of current thread.
 */
extern GE_context* GE_current_context(void);

/*
 * Initialization of exception handling.
 */
extern void GE_init_exception(GE_context* context);

/*
 * Free memory allocated in `a_context' for exception handling.
 */
extern void GE_free_exception(GE_context* a_context);

/*
 * Pointer to function to create a new exception manager object
 * (of type ISE_EXCEPTION_MANAGER).
 */
extern EIF_REFERENCE (*GE_new_exception_manager)(GE_context*, EIF_BOOLEAN);

/*
 * Pointer to Eiffel routine ISE_EXCEPTION_MANAGER.init_exception_manager.
 */
extern void (*GE_init_exception_manager)(GE_context*);

/*
 * Pointer to Eiffel routine ISE_EXCEPTION_MANAGER.last_exception.
 */
extern EIF_REFERENCE (*GE_last_exception)(GE_context*);

/*
 * Pointer to Eiffel routine ISE_EXCEPTION_MANAGER.once_raise.
 */
extern void (*GE_once_raise)(GE_context*, EIF_REFERENCE);

/*
 * Pointer to Eiffel routine ISE_EXCEPTION_MANAGER.set_exception_data.
 */
extern void (*GE_set_exception_data)(GE_context*, EIF_INTEGER_32, EIF_BOOLEAN, EIF_INTEGER_32, EIF_INTEGER_32, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_INTEGER_32, EIF_BOOLEAN);

/*
 * Exception tag associated with `a_code'.
 */
extern char* GE_exception_tag(long a_code);

/*
 * Append `a_string' to `a_trace'.
 * Resize area if needed.
 */
extern void GE_append_to_exception_trace_buffer(GE_exception_trace_buffer* a_trace, char* a_string);

/*
 * Wipe out `a_trace'.
 */
extern void GE_wipe_out_exception_trace_buffer(GE_exception_trace_buffer* a_trace);

/*
 * Raise an exception with code `a_code'.
 */
extern void GE_raise(long a_code);

/*
 * Raise an exception with code `a_code' and message `msg'.
 */
extern void GE_raise_with_message(long a_code, const char* msg);

/*
 * Raise an exception from EXCEPTION_MANAGER.
 */
extern void GE_developer_raise(long a_code, char* a_meaning, char* a_message);

/*
 * Raise exception which was raised the first time a once routine
 * was executed when executing it again.
 */
extern void GE_raise_once_exception(GE_context* a_context, EIF_REFERENCE a_exception);

/*
 * Exception, if any, which was last raised in `a_context'.
 */
extern EIF_REFERENCE GE_last_exception_raised(GE_context* a_context);

/*
 * Jump to execute the rescue of the last routine with a rescue
 * in the call stack.
 */
extern void GE_jump_to_last_rescue(GE_context* a_context);

/*
 * Set `in_assertion' to 'not b'.
 * Return the opposite of previous value.
 */
extern EIF_BOOLEAN GE_check_assert(EIF_BOOLEAN b);

/*
 * Check whether the type id of `obj' is not in `type_ids'.
 * If it is, then raise a CAT-call exception. Don't do anything if `obj' is Void.
 * `nb' is the number of ids in `type_ids' and is expected to be >0.
 * `type_ids' is sorted in increasing order.
 * Return `obj'.
 */
#define GE_catcall(obj,type_ids,nb) GE_check_catcall((obj),(type_ids),(nb))
extern EIF_REFERENCE GE_check_catcall(EIF_REFERENCE obj, EIF_TYPE_INDEX type_ids[], int nb);

/*
 * Check whether `obj' is Void.
 * If it is, then raise a call-on-void-target exception.
 * If `i' is provided, then include it in the message displayed
 * in the console to make debugging easier when `obj' is Void.
 * Return `obj'.
 */
#define GE_void(obj) ((obj)?(obj):GE_check_void(obj))
extern EIF_REFERENCE GE_check_void(EIF_REFERENCE obj);
#ifdef GE_DEBUG
#define GE_void2(obj,i) ((obj)?(obj):GE_check_void2((obj),(i)))
extern EIF_REFERENCE GE_check_void2(EIF_REFERENCE obj, EIF_INTEGER i);
#else
#define GE_void2(obj,i) ((obj)?(obj):GE_check_void(obj))
#endif

/*
 * Check whether `ptr' is a null pointer.
 * If it is, then raise a no-more-memory exception.
 * Return `ptr'.
 */
#define GE_null(ptr) GE_check_null(ptr)
extern void* GE_check_null(void* ptr);

#ifdef EIF_WINDOWS
/*
 * Set default exception handler.
 */
extern void GE_set_windows_exception_filter(void);
#endif

#ifdef __cplusplus
}
#endif

#endif
