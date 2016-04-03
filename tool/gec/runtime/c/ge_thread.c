/*
	description:

		"C functions used to implement class THREAD and related threading facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_THREAD_C
#define GE_THREAD_C

#ifdef __cplusplus
extern "C" {
#endif

/* Key to access Thread Specific Data. */
EIF_TSD_TYPE GE_thread_context_key;

/* Pointer to current thread. */
static EIF_THR_TYPE GE_current_thread(void)
{
#ifdef EIF_POSIX_THREADS
	return pthread_self();
#elif defined EIF_WINDOWS
		/* On Windows, `GetCurrentThread' returns a pseudo handle to the Current thread, */
		/* so we have to do something special on Windows. */
	return OpenThread(THREAD_ALL_ACCESS, FALSE, GetCurrentThreadId());
#endif
}

/* Initialize context of current thread. */
static void GE_init_thread_context(GE_thread_context* context)
{
	context->thread_id = GE_current_thread();
	EIF_TSD_SET(GE_thread_context_key, context, "Couldn't bind thread context to TSD.");
}

/* Set priority level to thread. */
static void GE_thread_set_priority(EIF_THR_TYPE thread_id, unsigned int priority)
{
#ifdef EIF_POSIX_THREADS
	struct sched_param l_param;
	memset(&l_param, 0, sizeof(struct sched_param));
	l_param.sched_priority = priority;
	if (pthread_setschedparam(thread_id, SCHED_OTHER, &l_param) != 0) {
		GE_raise_with_message(GE_EX_EXT, "Cannot set priority to thread");
	}
#elif defined(EIF_WINDOWS)
	int l_win_priority;
	switch (priority) {
		case EIF_MIN_THR_PRIORITY:
			l_win_priority = THREAD_PRIORITY_LOWEST;
			break;
		case EIF_MAX_THR_PRIORITY:
			l_win_priority = THREAD_PRIORITY_HIGHEST;
			break;
		default:
			if (priority <= EIF_BELOW_NORMAL_THR_PRIORITY) {
				l_win_priority = THREAD_PRIORITY_BELOW_NORMAL;
			} else if (priority < EIF_ABOVE_NORMAL_THR_PRIORITY) {
				l_win_priority = THREAD_PRIORITY_NORMAL;
			} else {
				l_win_priority = THREAD_PRIORITY_ABOVE_NORMAL;
			}
	}
	if (!SetThreadPriority(thread_id, l_win_priority)) {
		GE_raise_with_message(GE_EX_EXT, "Cannot set priority to thread");
	}
#endif
}

/* Routine to be called from the new thread when created. */
#ifdef EIF_WINDOWS
static unsigned __stdcall GE_thread_routine(void* arg)
#else
static void* GE_thread_routine(void* arg)
#endif
{
	GE_thread_context* ge_thread_context = (GE_thread_context*) arg;
	GE_context ge_context = GE_default_context;

	ge_thread_context->context = &ge_context;
	ge_context.thread = ge_thread_context;
	GE_init_exception(&ge_context);
	GE_init_thread_context(ge_thread_context);
	GE_thread_set_priority(ge_thread_context->thread_id, ge_thread_context->initial_priority);
	ge_thread_context->routine(ge_thread_context->current);
	GE_thread_exit();
#ifdef EIF_WINDOWS
	return 0;
#else
	return NULL;
#endif
}

/* Initialize data to handle threads. */
/* To be called at the beginning of the main function. */
void GE_init_thread(GE_context* context)
{
	GE_thread_context* ge_thread_context;

	EIF_TSD_CREATE(GE_thread_context_key, "Couldn't create GE_thread_context_key");
	ge_thread_context = (GE_thread_context*) GE_calloc_uncollectable(1, sizeof(GE_thread_context));
	if (ge_thread_context) {
		GE_init_thread_context(ge_thread_context);
		ge_thread_context->context = context;
		context->thread = ge_thread_context;
	} else {
		GE_raise_with_message(GE_EX_EXT, "Cannot create thread context");
	}
}

/* Create a new thread with attributes 'attr' and execute Eiffel routine 'routine' on object 'current'. */
void GE_thread_create_with_attr (EIF_REFERENCE current, void (*routine)(EIF_REFERENCE), EIF_THR_ATTR_TYPE* attr)
{
	EIF_THR_TYPE thread_id;
	GE_thread_context* ge_thread_context;
	GE_thread_context* ge_new_thread_context;

	ge_new_thread_context = (GE_thread_context*) GE_calloc_uncollectable(1, sizeof(GE_thread_context));
	if (!ge_new_thread_context) {
		GE_raise_with_message(GE_EX_EXT, "Cannot create thread context");
	} else {
		ge_new_thread_context->current = current;
		ge_new_thread_context->routine = routine;
		ge_new_thread_context->initial_priority = attr->priority;
#ifdef EIF_POSIX_THREADS
		{
			pthread_attr_t l_attr;
			int res;

			res = pthread_attr_init (&l_attr);
			if (res == 0) {
					/* Initialize the stack size if more than the minimum. */
				if (thread_attr->stack_size >= PTHREAD_STACK_MIN) {
					pthread_attr_setstacksize (&l_attr, attr->stack_size);
				}
				if (attr->priority != EIF_DEFAULT_THR_PRIORITY) {
					struct sched_param l_param;
					memset(&l_param, 0, sizeof(struct sched_param));
					l_param.sched_priority = attr->priority;
					pthread_attr_setschedpolicy(&l_attr, SCHED_OTHER);
					pthread_attr_setschedparam(&l_attr, &l_param);
				}
					/* We always create threads detached. */
				pthread_attr_setdetachstate (&l_attr, PTHREAD_CREATE_DETACHED);

				res = pthread_create (&thread_id, &l_attr, GE_thread_routine, ge_new_thread_context);
				pthread_attr_destroy (&l_attr);
			}
			if (res != 0) {
				GE_free(ge_new_thread_context);
				GE_raise_with_message(GE_EX_EXT, "Cannot create thread");
			}
		}
#elif defined EIF_WINDOWS
		thread_id = (EIF_THR_TYPE) _beginthreadex(NULL, (unsigned int) attr->stack_size, GE_thread_routine, ge_new_thread_context, 0, NULL);
		if (thread_id == 0) {
			GE_free(ge_new_thread_context);
			GE_raise_with_message(GE_EX_EXT, "Cannot create thread");
		}
#endif
	}
}

/* Thread ID of current thread. */
EIF_POINTER GE_thread_id(void)
{
	GE_thread_context* volatile ge_thread_context;

	EIF_TSD_GET0(GE_thread_context*, GE_thread_context_key, ge_thread_context);
	return (EIF_POINTER) (ge_thread_context->thread_id);
}

/* Last thread created. */
EIF_POINTER GE_last_thread_created(void)
{
/* TODO */
	return NULL;
}

/* Waits until a thread sets `terminated' from `Current' to True, */
/* which means it is terminated. The calling thread must be the */
/* direct parent of the thread, or the function might loop indefinitely. */
void GE_thread_wait(EIF_REFERENCE obj)
{
/* TODO */
}

/* Waits until a thread sets `terminated' from `Current' to True, */
/* which means it is terminated, or reaching `a_timeout_ms'. */
/* The calling thread must be the direct parent of the thread, */
/* or the function might loop indefinitely. */
EIF_BOOLEAN GE_thread_wait_with_timeout(EIF_REFERENCE obj, EIF_NATURAL_64 timeout)
{
/* TODO */
	return EIF_FALSE;
}

/* Yields execution to other threads. */
void GE_thread_yield(void)
{
/* TODO */
}

/* The calling thread waits for all other children threads to terminate. */
void GE_thread_join_all(void)
{
/* TODO */
}

/* Function called to terminate a thread launched by Eiffel with GE_thread_create_with_attr(). */
/* This function must be called from the thread itself (not the parent). */
void GE_thread_exit(void)
{
	GE_thread_context* volatile ge_thread_context;
	EIF_THR_TYPE l_thread_id;

	EIF_TSD_GET0(GE_thread_context*, GE_thread_context_key, ge_thread_context);
	l_thread_id = ge_thread_context->thread_id;
	GE_free(ge_thread_context);
#ifdef EIF_POSIX_THREADS
	pthread_exit(NULL);
#elif defined EIF_WINDOWS
	if (!CloseHandle(l_thread_id)) {
		GE_raise_with_message(GE_EX_EXT, "Cannot close thread");
	}
	_endthreadex(0);
#endif
}

/* Default thread priority level. */
EIF_INTEGER GE_thread_default_priority(void)
{
	return EIF_DEFAULT_THR_PRIORITY;
}

/* Minimum thread priority level. */
EIF_INTEGER GE_thread_min_priority(void)
{
	return EIF_MIN_THR_PRIORITY;
}

/* Maximum thread priority level. */
EIF_INTEGER GE_thread_max_priority(void)
{
	return EIF_MAX_THR_PRIORITY;
}

/* Create a new mutex. */
EIF_POINTER GE_mutex_create(void)
{
#ifdef EIF_POSIX_THREAD
	EIF_MUTEX_TYPE* mutex;
	int Result;

	mutex = (EIF_MUTEX_TYPE*) GE_malloc(sizeof(EIF_MUTEX_TYPE));
	if (mutex) {
			/* Make the mutex recursive by default. */
			/* This allows a thread to lock the mutex several times without blocking itself. */
		pthread_mutexattr_t attr;
		pthread_mutexattr_init(&attr);
		pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
		if (!pthread_mutex_init(*mutex, &attr)) {
			GE_free(mutex);
			mutex = NULL;
		}
		pthread_mutexattr_destroy(&attr);
	}
	if (!mutex) {
		GE_raise_with_message(GE_EX_EXT, "Cannot create mutex");
	}
	return (EIF_POINTER) mutex;
#elif defined EIF_WINDOWS
	EIF_CS_TYPE *section;

	section = (EIF_CS_TYPE*) GE_malloc(sizeof(EIF_CS_TYPE));
	if (section) {
		if (!InitializeCriticalSectionAndSpinCount(section, (DWORD) 4000)) {
			GE_free(section);
			section = NULL;
		}
	}
	if (!section) {
		GE_raise_with_message(GE_EX_EXT, "Cannot create mutex");
	}
	return (EIF_POINTER) section;
#else
	return (EIF_POINTER) 0;
#endif
}

/* Lock mutex. */
void GE_mutex_lock(EIF_POINTER mutex)
{
#ifdef EIF_POSIX_THREADS
	if (!pthread_mutex_lock((EIF_MUTEX_TYPE*) mutex)) {
		GE_raise_with_message(GE_EX_EXT, "Cannot lock mutex");
	}
#elif defined EIF_WINDOWS
	EnterCriticalSection((EIF_CS_TYPE*) mutex);
#endif
}

/* Try to lock mutex. Return True on success. */
EIF_BOOLEAN GE_mutex_trylock(EIF_POINTER mutex)
{
#ifdef EIF_POSIX_THREADS
	int res;
	res = pthread_mutex_trylock((EIF_MUTEX_TYPE*) mutex);
	if (res == EBUSY) {
		return EIF_FALSE;
	} else if (res == 0) {
		return EIF_TRUE;
	} else {
		GE_raise_with_message(GE_EX_EXT, "Cannot lock mutex");
		return EIF_FALSE;
	}
#elif defined EIF_WINDOWS
	if (TryEnterCriticalSection((EIF_CS_TYPE*) mutex)) {
		return EIF_TRUE;
	} else {
		return EIF_FALSE;
	}
#else
	return EIF_FALSE;
#endif
}

/* Unlock mutex. */
void GE_mutex_unlock(EIF_POINTER mutex)
{
#ifdef EIF_POSIX_THREADS
	if (!pthread_mutex_unlock((EIF_MUTEX_TYPE*) mutex)) {
		GE_raise_with_message(GE_EX_EXT, "Cannot unlock mutex");
	}
#elif defined EIF_WINDOWS
	LeaveCriticalSection((EIF_CS_TYPE*) mutex);
#endif
}

/* Destroy and free all resources used by mutex. */
void GE_mutex_destroy(EIF_POINTER mutex)
{
	if (mutex) {
#ifdef EIF_POSIX_THREADS
		if (!pthread_mutex_destroy((EIF_MUTEX_TYPE*) mutex)) {
			GE_raise_with_message(GE_EX_EXT, "Cannot destory mutex");
		}
#elif defined EIF_WINDOWS
		DeleteCriticalSection((EIF_CS_TYPE*) mutex);
#endif
		GE_free(mutex);
	}
}

#ifdef __cplusplus
}
#endif

#endif
