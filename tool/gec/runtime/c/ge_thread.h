/*
	description:

		"C functions used to implement class THREAD and related threading facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2016-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_THREAD_H
#define GE_THREAD_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifdef GE_USE_THREADS

#ifndef GE_EIFFEL_H
#include "ge_eiffel.h"
#endif
#ifndef GE_THREAD_TYPES_H
#include "ge_thread_types.h"
#endif
#ifndef GE_exception_H
#include "ge_exception.h"
#endif

/* Thread priority levels. */
#define EIF_MIN_THR_PRIORITY			0L
#define EIF_BELOW_NORMAL_THR_PRIORITY	100L
#define EIF_DEFAULT_THR_PRIORITY		127L
#define EIF_ABOVE_NORMAL_THR_PRIORITY	154L
#define EIF_MAX_THR_PRIORITY			255L

/*
 * Initialize data to handle threads.
 * To be called at the beginning of the main function.
 */
extern void GE_init_thread(GE_context* a_context);

/*
 * Create a new thread with attributes `attr' and execute
 * Eiffel routine `routine' on object `current'.
 */
extern void GE_thread_create_with_attr(EIF_REFERENCE current, void (*routine)(EIF_REFERENCE), EIF_THR_ATTR_TYPE* attr);

/*
 * Execution context of current thread.
 */
extern GE_context* GE_thread_current_context(void);

/*
 * Thead ID of current thread.
 */
extern EIF_POINTER GE_thread_id(void);

/*
 * Last thread created.
 */
extern EIF_POINTER GE_last_thread_created(void);

/*
 * Waits until a child thread sets `terminated' from `obj' to True,
 * which means it is terminated. The calling thread must be the
 * direct parent of the thread, or the function might loop indefinitely.
 */
extern void GE_thread_wait(EIF_REFERENCE obj);

/*
 * Waits until a child thread sets `terminated' from `obj' to True,
 * which means it is terminated, or reaching `a_timeout_ms'.
 * The calling thread must be the direct parent of the thread,
 * or the function might loop indefinitely.
 */
extern EIF_BOOLEAN GE_thread_wait_with_timeout(EIF_REFERENCE obj, EIF_NATURAL_64 a_timeout_ms);

/*
 * Yields execution to other threads.
 */
extern void GE_thread_yield(void);

/*
 * The calling thread waits for all other children threads to terminate.
 */
extern void GE_thread_join_all(void);

/*
 * Function called to terminate a thread launched by Eiffel with `GE_thread_create_with_attr'.
 * This function must be called from the thread itself (not the parent).
 */
extern void GE_thread_exit(void);

/*
 * Default thread priority level.
 */
extern EIF_INTEGER GE_thread_default_priority(void);

/*
 * Minimum thread priority level.
 */
extern EIF_INTEGER GE_thread_min_priority(void);

/*
 * Maximum thread priority level.
 */
extern EIF_INTEGER GE_thread_max_priority(void);

/*
 * Create a new mutex.
 */
extern EIF_POINTER GE_mutex_create(void);

/*
 * Lock mutex.
 */
extern void GE_mutex_lock(EIF_POINTER a_mutex);

/*
 * Try to lock mutex. Return True on success.
 */
extern EIF_BOOLEAN GE_mutex_trylock(EIF_POINTER a_mutex);

/*
 * Unlock mutex.
 */
extern void GE_mutex_unlock(EIF_POINTER a_mutex);

/*
 * Destroy and free all resources used by mutex.
 */
extern void GE_mutex_destroy(EIF_POINTER a_mutex);

#ifdef __cplusplus
}
#endif

#endif
#endif
