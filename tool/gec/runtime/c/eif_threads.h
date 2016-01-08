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
#define eif_thr_create_with_attr(current_obj, init_func, attr) GE_thread_create_with_attr(current_obj, init_func, attr)
#define eif_thr_wait(term) GE_thread_wait(term)
#define eif_thr_wait_with_timeout(term,tms) GE_thread_wait_with_timeout(term,tms)
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
