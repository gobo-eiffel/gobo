/*
	description:

		"C functions used to implement Thread support"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2024, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef EIF_THREADS_H
#define EIF_THREADS_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef EIF_CECIL_H
#include "eif_cecil.h"
#endif
#ifndef GE_EIFFEL_H
#include "ge_eiffel.h"
#endif
#ifdef GE_USE_THREADS
#ifndef GE_THREAD_H
#include "ge_thread.h"
#endif
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifndef GE_USE_THREADS

/*
 * Empty stubs for EiffelThread library so that it may be compiled against a non-multithreaded run-time.
 */

/* THREAD_ENVIRONMENT */
#define eif_thr_thread_id() NULL

/* THREAD_CONTROL */
#define eif_thr_yield()
#define eif_thr_join_all()

/* THREAD */
#define eif_thr_create_with_attr(current_obj, init_func, set_terminated_func, attr)
#define eif_thr_wait(obj,get_terminated)
#define eif_thr_wait_with_timeout(obj,get_terminated,tms) EIF_TRUE
#define eif_thr_last_thread() NULL
#define eif_thr_exit()

/* THREAD_ATTRIBUTES */
#define eif_thr_default_priority() 0
#define eif_thr_min_priority() 0
#define eif_thr_max_priority() 0

/* MUTEX */
#define eif_thr_mutex_create() NULL
#define eif_thr_mutex_lock(a_mutex_pointer)
#define eif_thr_mutex_trylock(a_mutex_pointer) EIF_TRUE
#define eif_thr_mutex_unlock(a_mutex_pointer)
#define eif_thr_mutex_destroy(a_mutex_pointer)

/* CONDITION_VARIABLE */
#define eif_thr_cond_create() NULL
#define eif_thr_cond_broadcast(a_cond_ptr)
#define eif_thr_cond_signal(a_cond_ptr)
#define eif_thr_cond_wait(a_cond_ptr,a_mutex_ptr)
#define eif_thr_cond_wait_with_timeout(a_cond_ptr,a_mutex_ptr,a_timeout) 1
#define eif_thr_cond_destroy(a_cond_ptr)

/* SEMAPHORE */
#define eif_thr_sem_create(a_count) NULL
#define eif_thr_sem_wait(a_sem_pointer)
#define eif_thr_sem_post(a_sem_pointer)
#define eif_thr_sem_trywait(a_sem_pointer) EIF_TRUE
#define eif_thr_sem_destroy(a_sem_pointer)

/* READ_WRITE_LOCK */
#define eif_thr_rwl_create() NULL
#define eif_thr_rwl_rdlock(a_read_write_lock_pointer)
#define eif_thr_rwl_unlock(a_read_write_lock_pointer)
#define eif_thr_rwl_wrlock(a_read_write_lock_pointer)
#define eif_thr_rwl_destroy(a_read_write_lock_pointer)

#else

/* THREAD_ENVIRONMENT */
#define eif_thr_thread_id() GE_thread_id()

/* THREAD_CONTROL */
#define eif_thr_yield() GE_thread_yield()
#define eif_thr_join_all() GE_thread_join_all()

/* THREAD */
#define eif_thr_create_with_attr(current_obj,init_func,set_terminated_func,attr) GE_thread_create_with_attr((current_obj),(void (*)(EIF_REFERENCE,EIF_INTEGER))(init_func),(void (*)(EIF_REFERENCE,EIF_BOOLEAN))(set_terminated_func),(EIF_THR_ATTR_TYPE*)(attr),0)
#define eif_thr_wait(obj,get_terminated) GE_thread_wait((obj),(EIF_BOOLEAN (*)(EIF_REFERENCE))(get_terminated))
#define eif_thr_wait_with_timeout(obj,get_terminated,tms) GE_thread_wait_with_timeout((obj),(EIF_BOOLEAN (*)(EIF_REFERENCE))(get_terminated),(tms))
#define eif_thr_last_thread() GE_last_thread_created()
#define eif_thr_exit() GE_thread_exit()

/* THREAD_ATTRIBUTES */
#define eif_thr_default_priority() GE_thread_default_priority()
#define eif_thr_min_priority() GE_thread_min_priority()
#define eif_thr_max_priority() GE_thread_max_priority()

/* MUTEX */
#define eif_thr_mutex_create() GE_mutex_create()
#define eif_thr_mutex_lock(a_mutex_pointer) GE_mutex_lock(a_mutex_pointer)
#define eif_thr_mutex_trylock(a_mutex_pointer) GE_mutex_try_lock(a_mutex_pointer)
#define eif_thr_mutex_unlock(a_mutex_pointer) GE_mutex_unlock(a_mutex_pointer)
#define eif_thr_mutex_destroy(a_mutex_pointer) GE_mutex_destroy(a_mutex_pointer)

/* CONDITION_VARIABLE */
#define eif_thr_cond_create() GE_condition_variable_create()
#define eif_thr_cond_broadcast(a_cond_ptr) GE_condition_variable_broadcast(a_cond_ptr)
#define eif_thr_cond_signal(a_cond_ptr) GE_condition_variable_signal(a_cond_ptr)
#define eif_thr_cond_wait(a_cond_ptr,a_mutex_ptr) GE_condition_variable_wait((a_cond_ptr),(a_mutex_ptr))
#define eif_thr_cond_wait_with_timeout(a_cond_ptr,a_mutex_ptr,a_timeout) GE_condition_variable_wait_with_timeout((a_cond_ptr),(a_mutex_ptr),(a_timeout))
#define eif_thr_cond_destroy(a_cond_ptr) GE_condition_variable_destroy(a_cond_ptr)

/* SEMAPHORE */
#define eif_thr_sem_create(a_count) GE_semaphore_create(a_count)
#define eif_thr_sem_wait(a_sem_pointer) GE_semaphore_wait(a_sem_pointer)
#define eif_thr_sem_post(a_sem_pointer) GE_semaphore_post(a_sem_pointer)
#define eif_thr_sem_trywait(a_sem_pointer) GE_semaphore_try_wait(a_sem_pointer)
#define eif_thr_sem_destroy(a_sem_pointer) GE_semaphore_destroy(a_sem_pointer)

/* READ_WRITE_LOCK */
#define eif_thr_rwl_create() GE_read_write_lock_create()
#define eif_thr_rwl_rdlock(a_read_write_lock_pointer) GE_read_write_lock_read_lock(a_read_write_lock_pointer)
#define eif_thr_rwl_unlock(a_read_write_lock_pointer) GE_read_write_lock_unlock(a_read_write_lock_pointer)
#define eif_thr_rwl_wrlock(a_read_write_lock_pointer) GE_read_write_lock_write_lock(a_read_write_lock_pointer)
#define eif_thr_rwl_destroy(a_read_write_lock_pointer) GE_read_write_lock_destroy(a_read_write_lock_pointer)

/* WEL */
#ifdef EIF_WINDOWS
#define eif_thr_create_wel_per_thread_data(a_size) GE_thread_create_wel_per_thread_data(a_size)
#endif

/* To compile the C code of EiffelNet. */
extern int socket_fides;

#endif

#ifdef __cplusplus
}
#endif

#endif
