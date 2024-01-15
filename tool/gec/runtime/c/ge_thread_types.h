/*
	description:

		"C types used to implement class THREAD and related threading facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2017-2023, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef GE_THREAD_TYPES_H
#define GE_THREAD_TYPES_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifdef GE_USE_THREADS

#define EIF_THREADS
#ifdef GE_USE_POSIX_THREADS
#define EIF_POSIX_THREADS
#endif

#ifndef GE_EIFFEL_H
#include "ge_eiffel.h"
#endif

#ifdef GE_USE_POSIX_THREADS
#include <pthread.h>
#include <semaphore.h>
#elif defined EIF_WINDOWS
#include <windows.h>
#include <process.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifdef GE_USE_POSIX_THREADS

#define EIF_THR_TYPE            pthread_t
#define EIF_CS_TYPE				pthread_mutex_t
#define EIF_MUTEX_TYPE          pthread_mutex_t
#define EIF_COND_TYPE			pthread_cond_t
#define EIF_SEM_TYPE			sem_t
#define EIF_RWL_TYPE			pthread_rwlock_t

#elif defined EIF_WINDOWS

#define EIF_THR_TYPE            HANDLE
#define EIF_CS_TYPE				CRITICAL_SECTION
#define EIF_MUTEX_TYPE          CRITICAL_SECTION
#define EIF_SEM_TYPE            HANDLE

typedef struct {
		/* Semaphore used to queue up threads waiting for the condition to become signaled. */
	EIF_SEM_TYPE* semaphore;
		/* Serialize access to fields of Current. */
	EIF_CS_TYPE* csection;
		/* Number of waiters. */
	unsigned long num_waiting;
		/* Number of already awoken. */
	unsigned long num_wake;
		/* Number of time we signaled/broadcasted for improving fairness.
		 * This ensures one thread won't steal wakeups from other threads in queue. */
	unsigned long generation;
} EIF_COND_TYPE;

typedef struct {
	EIF_MUTEX_TYPE* m; /* Internal monitor lock. */
	int rwlock; /* >0 = # readers, <0 = writer, 0 = none */
	EIF_COND_TYPE* readers_ok; /* Start waiting readers. */
	unsigned int waiting_writers; /* Number of waiting writers. */
	EIF_COND_TYPE* writers_ok; /* Start a waiting writer. */
} EIF_RWL_TYPE;

#endif

typedef struct {
	unsigned int priority;
	unsigned int stack_size;
} EIF_THR_ATTR_TYPE;

/* Struct for thread context. */
typedef struct GE_thread_context_struct GE_thread_context;
struct GE_thread_context_struct {
	EIF_THR_TYPE thread_id; /* Thread identifier for associated thread. */
	EIF_REFERENCE current; /* Eiffel root object. */
	void (*routine)(EIF_REFERENCE, EIF_INTEGER); /* Eiffel routine. */
	void (*set_terminated)(EIF_REFERENCE, EIF_BOOLEAN); /* Eiffel routine to set {THREAD}.terminated. */
	unsigned int initial_priority; /* Initial priority. */
	EIF_THR_TYPE last_thread_id; /* Last thread created from current thread. */
	volatile int n_children; /* Number of direct thread children. */
	EIF_MUTEX_TYPE* children_mutex; /* Mutex to wait for thread children. */
	EIF_COND_TYPE* children_cond; /* Condition variable to wait for thread children. */
	GE_thread_context* parent_context;	/* Context of parent thread, NULL if main thread. */
	int thread_exiting; /* Has current thread already called GE_thread_exit? */
	volatile int is_alive; /* Is current thread still alive? */
#ifdef GE_USE_SCOOP
	int is_scoop_processor; /* Is current thread a SCOOP processor? */
#endif
};

#ifdef __cplusplus
}
#endif

#endif
#endif
