/*
	description:

		"C functions used to implement class THREAD and related threading facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_THREAD_H
#define GE_THREAD_H
#ifdef EIF_THREADS

#ifdef EIF_POSIX_THREADS
#include <pthread.h>
#elif defined EIF_WINDOWS
#include <windows.h>
#include <process.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_POSIX_THREADS
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
	EIF_SEM_TYPE *semaphore;
		/* Serialize access to fields of Current. */
	EIF_CS_TYPE *csection;
		/* Number of waiters. */
	unsigned long num_waiting;
		/* Number of already awoken. */
	unsigned long num_wake;
		/* Number of time we signaled/broadcasted for improving fairness.
		 * This ensures one thread won't steal wakeups from other threads in queue. */
	unsigned long generation;
} EIF_COND_TYPE;
typedef struct {
	EIF_MUTEX_TYPE *m; /* Internal monitor lock. */
	int rwlock; /* >0 = # readers, <0 = writer, 0 = none */
	EIF_COND_TYPE *readers_ok; /* Start waiting readers. */
	unsigned int waiting_writers; /* Number of waiting writers. */
	EIF_COND_TYPE *writers_ok; /* Start a waiting writer. */
} EIF_RWL_TYPE;
#endif

typedef struct {
	unsigned int priority;
	unsigned int stack_size;
} EIF_THR_ATTR_TYPE;

#ifdef EIF_POSIX_THREADS
#	define EIF_TSD_VAL_TYPE        void*
#	define EIF_TSD_TYPE            pthread_key_t
#	define EIF_TSD_CREATE(key,msg) \
		if (pthread_key_create(&(key),NULL)) \
	        GE_raise_with_message(GE_EX_EXT, msg)
#	define EIF_TSD_SET(key,val,msg) \
		if (pthread_setspecific ((key), (EIF_TSD_VAL_TYPE)(val))) \
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

/* Struct for thread context. */
typedef struct GE_thread_context_struct GE_thread_context;
struct GE_thread_context_struct {
	EIF_THR_TYPE thread_id; /* Thread identifier for associated thread. */
	EIF_REFERENCE current; /* Eiffel root object. */
	void (*routine)(EIF_REFERENCE); /* Eiffel routine. */
	unsigned int initial_priority; /* Initial priority. */
	GE_context* context; /* Eiffel execution context. */
};

/* Key to access Thread Specific Data. */
extern EIF_TSD_TYPE GE_thread_context_key;

/* Thread priority levels. */
#define EIF_MIN_THR_PRIORITY			0L
#define EIF_BELOW_NORMAL_THR_PRIORITY	100L
#define EIF_DEFAULT_THR_PRIORITY		127L
#define EIF_ABOVE_NORMAL_THR_PRIORITY	154L
#define EIF_MAX_THR_PRIORITY			255L

/* Initialize data to handle threads. */
/* To be called at the beginning of the main function. */
extern void GE_init_thread(GE_context* context);

/* Create a new thread with attributes 'attr' and execute Eiffel routine 'routine' on object 'current'. */
extern void GE_thread_create_with_attr (EIF_REFERENCE current, void (*routine)(EIF_REFERENCE), EIF_THR_ATTR_TYPE* attr);

/* Thead ID of current thread. */
extern EIF_POINTER GE_thread_id(void);

/* Last thread created. */
extern EIF_POINTER GE_last_thread_created(void);

/* Waits until a child thread sets `terminated' from `Current' to True, */
/* which means it is terminated. The calling thread must be the */
/* direct parent of the thread, or the function might loop indefinitely. */
extern void GE_thread_wait(EIF_REFERENCE obj);

/* Waits until a child thread sets `terminated' from `Current' to True, */
/* which means it is terminated, or reaching `a_timeout_ms'. */
/* The calling thread must be the direct parent of the thread, */
/* or the function might loop indefinitely. */
extern EIF_BOOLEAN GE_thread_wait_with_timeout(EIF_REFERENCE obj, EIF_NATURAL_64 timeout);

/* Yields execution to other threads. */
extern void GE_thread_yield(void);

/* The calling thread waits for all other children threads to terminate. */
extern void GE_thread_join_all(void);

/* Function called to terminate a thread launched by Eiffel with GE_thread_create_with_attr(). */
/* This function must be called from the thread itself (not the parent). */
extern void GE_thread_exit(void);

/* Default thread priority level. */
extern EIF_INTEGER GE_thread_default_priority(void);

/* Minimum thread priority level. */
extern EIF_INTEGER GE_thread_min_priority(void);

/* Maximum thread priority level. */
extern EIF_INTEGER GE_thread_max_priority(void);

/* Create a new mutex. */
extern EIF_POINTER GE_mutex_create(void);

/* Lock mutex. */
extern void GE_mutex_lock(EIF_POINTER mutex);

/* Try to lock mutex. Return True on success. */
extern EIF_BOOLEAN GE_mutex_trylock(EIF_POINTER mutex);

/* Unlock mutex. */
extern void GE_mutex_unlock(EIF_POINTER mutex);

/* Destroy and free all resources used by mutex. */
extern void GE_mutex_destroy(EIF_POINTER mutex);

#ifdef __cplusplus
}
#endif

#endif
#endif
