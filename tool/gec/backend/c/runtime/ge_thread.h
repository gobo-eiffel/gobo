/*
	description:

		"C functions used to implement class THREAD and related threading facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2016-2024, Eric Bezault and others"
	license: "MIT License"
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
#ifndef GE_EXCEPTION_H
#include "ge_exception.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifdef GE_USE_POSIX_THREADS
#include <unistd.h>
#endif

#ifdef GE_USE_POSIX_THREADS
#	define EIF_TSD_VAL_TYPE        void*
#	define EIF_TSD_TYPE            pthread_key_t
#	define EIF_TSD_CREATE(key,msg) \
		if (pthread_key_create(&(key),NULL)) \
			GE_raise_with_message(GE_EX_EXT, msg)
#	define EIF_TSD_SET(key,val,msg) \
		if (pthread_setspecific((key), (EIF_TSD_VAL_TYPE)(val))) \
			GE_raise_with_message(GE_EX_EXT, msg)
#	define EIF_TSD_GET0(val_type,key,val) (val = pthread_getspecific(key))
#	define EIF_TSD_GET(val_type,key,val,msg) \
		if (EIF_TSD_GET0(val_type,key,val) == (void*) 0) GE_raise_with_message(GE_EX_EXT, msg)
#	define EIF_TSD_DESTROY(key,msg) if (pthread_key_delete(key)) GE_raise_with_message(GE_EX_EXT, msg)
#elif defined EIF_WINDOWS
#	define EIF_TSD_VAL_TYPE        LPVOID
#	define EIF_TSD_TYPE            DWORD
#	define EIF_TSD_CREATE(key,msg) \
		if ((key=TlsAlloc())==TLS_OUT_OF_INDEXES) GE_raise_with_message(GE_EX_EXT, msg)
#	define EIF_TSD_SET(key,val,msg) \
		if (!TlsSetValue((key),(EIF_TSD_VAL_TYPE)(val))) GE_raise_with_message(GE_EX_EXT, msg)
#	define EIF_TSD_GET0(val_type,key,val) \
		val=(val_type) TlsGetValue(key)
#	define EIF_TSD_GET(val_type,key,val,msg) \
		EIF_TSD_GET0(val_type,key,val); \
		if (GetLastError() != NO_ERROR) GE_raise_with_message(GE_EX_EXT, msg)
#	define EIF_TSD_DESTROY(key,msg) \
		if (!TlsFree(key)) GE_raise_with_message(GE_EX_EXT, msg)
#endif

/* Thread priority levels. */
#define EIF_MIN_THR_PRIORITY			0L
#define EIF_BELOW_NORMAL_THR_PRIORITY	100L
#define EIF_DEFAULT_THR_PRIORITY		127L
#define EIF_ABOVE_NORMAL_THR_PRIORITY	154L
#define EIF_MAX_THR_PRIORITY			255L

/*
 * Mutexes used to protect the calls to once-per-process features.
 */
typedef volatile struct {
	EIF_POINTER* volatile boolean_mutex;
	EIF_POINTER* volatile character_8_mutex;
	EIF_POINTER* volatile character_32_mutex;
	EIF_POINTER* volatile integer_8_mutex;
	EIF_POINTER* volatile integer_16_mutex;
	EIF_POINTER* volatile integer_32_mutex;
	EIF_POINTER* volatile integer_64_mutex;
	EIF_POINTER* volatile natural_8_mutex;
	EIF_POINTER* volatile natural_16_mutex;
	EIF_POINTER* volatile natural_32_mutex;
	EIF_POINTER* volatile natural_64_mutex;
	EIF_POINTER* volatile pointer_mutex;
	EIF_POINTER* volatile real_32_mutex;
	EIF_POINTER* volatile real_64_mutex;
	EIF_POINTER* volatile reference_mutex;
	EIF_POINTER* volatile procedure_mutex;
} GE_once_mutexes;

/*
 * Mutexes used to protect the calls to once-per-process features.
 */
extern GE_once_mutexes* GE_process_once_mutexes;

/*
 * Numbers of once-per-thread features.
 */
extern uint32_t GE_thread_onces_boolean_count;
extern uint32_t GE_thread_onces_character_8_count;
extern uint32_t GE_thread_onces_character_32_count;
extern uint32_t GE_thread_onces_integer_8_count;
extern uint32_t GE_thread_onces_integer_16_count;
extern uint32_t GE_thread_onces_integer_32_count;
extern uint32_t GE_thread_onces_integer_64_count;
extern uint32_t GE_thread_onces_natural_8_count;
extern uint32_t GE_thread_onces_natural_16_count;
extern uint32_t GE_thread_onces_natural_32_count;
extern uint32_t GE_thread_onces_natural_64_count;
extern uint32_t GE_thread_onces_pointer_count;
extern uint32_t GE_thread_onces_real_32_count;
extern uint32_t GE_thread_onces_real_64_count;
extern uint32_t GE_thread_onces_reference_count;
extern uint32_t GE_thread_onces_procedure_count;

/*
 * Create a new 'GE_once_mutexes' struct which can deal with the
 * numbers of once features passed as argument.
 */
extern GE_once_mutexes* GE_new_once_mutexes(
	uint32_t a_boolean_count,
	uint32_t a_character_8_count,
	uint32_t a_character_32_count,
	uint32_t a_integer_8_count,
	uint32_t a_integer_16_count,
	uint32_t a_integer_32_count,
	uint32_t a_integer_64_count,
	uint32_t a_natural_8_count,
	uint32_t a_natural_16_count,
	uint32_t a_natural_32_count,
	uint32_t a_natural_64_count,
	uint32_t a_pointer_count,
	uint32_t a_real_32_count,
	uint32_t a_real_64_count,
	uint32_t a_reference_count,
	uint32_t a_procedure_count);

/*
 * Keep track of the numbers of once-per-thread features.
 */
extern void GE_thread_onces_set_counts(
	uint32_t a_boolean_count,
	uint32_t a_character_8_count,
	uint32_t a_character_32_count,
	uint32_t a_integer_8_count,
	uint32_t a_integer_16_count,
	uint32_t a_integer_32_count,
	uint32_t a_integer_64_count,
	uint32_t a_natural_8_count,
	uint32_t a_natural_16_count,
	uint32_t a_natural_32_count,
	uint32_t a_natural_64_count,
	uint32_t a_pointer_count,
	uint32_t a_real_32_count,
	uint32_t a_real_64_count,
	uint32_t a_reference_count,
	uint32_t a_procedure_count);

/*
 * Initialize `process_onces' and `thread_onces' in `a_context'.
 */
extern void GE_thread_init_onces(GE_context* a_context);

/* Global mutex to protect creation of once-per-object data. */
extern EIF_POINTER GE_once_per_object_data_mutex;

/*
 * Initialize data to handle threads.
 * To be called at the beginning of the main function
 * on the main thread.
 */
extern void GE_init_thread(GE_context* a_context);

/*
 * Create a new thread with attributes `attr' and execute
 * Eiffel routine `routine' on object `current'.
 */
extern void GE_thread_create_with_attr(EIF_REFERENCE current, void (*routine)(EIF_REFERENCE, EIF_INTEGER), void (*set_terminated)(EIF_REFERENCE,EIF_BOOLEAN), EIF_THR_ATTR_TYPE* attr, int is_scoop_processor);

/*
 * Execution context of current thread.
 */
extern GE_context* GE_thread_current_context(void);

/*
 * Execution context of current thread.
 * Return Null in case of non-Eiffel threads.
 */
extern GE_context* GE_unprotected_thread_current_context(void);

/*
 * Thead ID of current thread.
 */
extern EIF_POINTER GE_thread_id(void);

/*
 * Thread ID of last thread created from current thread.
 */
extern EIF_POINTER GE_last_thread_created(void);

#ifdef EIF_WINDOWS
/*
 * Support for Windows GUI that requires that all GUI operations are performed in the same thread.
 * Allocate new structure of the given size `a_size', assign it to `wel_per_thread_data'.
 * Return newly allocated memory block. It will be freed automatically on thread termination.
 */
extern void* GE_thread_create_wel_per_thread_data(size_t a_size);
#endif

/*
 * Waits until a child thread sets `terminated' from `obj' to True,
 * which means it is terminated. The calling thread must be the
 * direct parent of the thread, or the function might loop indefinitely.
 */
extern void GE_thread_wait(EIF_REFERENCE obj, EIF_BOOLEAN (*get_terminated)(EIF_REFERENCE));

/*
 * Waits until a child thread sets `terminated' from `obj' to True,
 * which means it is terminated, or reaching `a_timeout_ms'.
 * The calling thread must be the direct parent of the thread,
 * or the function might loop indefinitely.
 */
extern EIF_BOOLEAN GE_thread_wait_with_timeout(EIF_REFERENCE obj, EIF_BOOLEAN (*get_terminated)(EIF_REFERENCE), EIF_NATURAL_64 a_timeout_ms);

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
extern EIF_BOOLEAN GE_mutex_try_lock(EIF_POINTER a_mutex);

/*
 * Unlock mutex.
 */
extern void GE_mutex_unlock(EIF_POINTER a_mutex);

/*
 * Destroy and free all resources used by mutex.
 */
extern void GE_mutex_destroy(EIF_POINTER a_mutex);

/*
 * Create a new semaphore allowing `a_count' threads
 * to go into a critical section.
 */
extern EIF_POINTER GE_semaphore_create(EIF_INTEGER a_count);

/*
 * Decrement semaphore count, waiting if necessary
 * until that becomes possible.
 */
extern void GE_semaphore_wait(EIF_POINTER a_semaphore);

/*
 * Has client been successful in decrementing semaphore
 * count without waiting?
 */
extern EIF_BOOLEAN GE_semaphore_try_wait(EIF_POINTER a_semaphore);

/*
 * Increment semaphore count.
 */
extern void GE_semaphore_post(EIF_POINTER a_semaphore);

/*
 * Destroy and free all resources used by semaphore.
 */
extern void GE_semaphore_destroy(EIF_POINTER a_semaphore);

/*
 * Create a new condition variable.
 */
extern EIF_POINTER GE_condition_variable_create(void);

/*
 * Unblock all threads blocked on condition variable.
 */
extern void GE_condition_variable_broadcast(EIF_POINTER a_condition_variable);

/*
 * Unblock one thread blocked on condition variable.
 */
extern void GE_condition_variable_signal(EIF_POINTER a_condition_variable);

/*
 * Block calling thread on condition variable.
 */
extern void GE_condition_variable_wait(EIF_POINTER a_condition_variable, EIF_POINTER a_mutex);

/*
 * Block calling thread on condition variable for at most `a_timeout' milliseconds.
 * Return 1 is we got the condition variable on time, otherwise return 0.
 */
extern EIF_INTEGER GE_condition_variable_wait_with_timeout(EIF_POINTER a_condition_variable, EIF_POINTER a_mutex, EIF_INTEGER a_timeout);

/*
 * Destroy and free all resources used by condition variable.
 */
extern void GE_condition_variable_destroy(EIF_POINTER a_condition_variable);

/*
 * Create a new read-write lock.
 */
extern EIF_POINTER GE_read_write_lock_create(void);

/*
 * Acquire a read lock. Multiple readers can go if there are no writer.
 */
extern void GE_read_write_lock_read_lock(EIF_POINTER a_read_write_lock);

/*
 * Acquire a write lock. Only a single write can proceed.
 */
extern void GE_read_write_lock_write_lock(EIF_POINTER a_read_write_lock);

/*
 * Unlock a read or write lock.
 */
extern void GE_read_write_lock_unlock(EIF_POINTER a_read_write_lock);

/*
 * Destroy and free all resources used by read-write lock.
 */
extern void GE_read_write_lock_destroy(EIF_POINTER a_read_write_lock);

#ifdef __cplusplus
}
#endif

#endif
#endif
