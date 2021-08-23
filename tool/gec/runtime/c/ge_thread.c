/*
	description:

		"C functions used to implement class THREAD and related threading facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2016-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_THREAD_C
#define GE_THREAD_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifdef GE_USE_THREADS

#ifndef GE_THREAD_H
#include "ge_thread.h"
#endif
#ifndef GE_GC_H
#include "ge_gc.h"
#endif
#ifndef GE_ONCE_H
#include "ge_once.h"
#endif
#ifndef GE_TIME_H
#include "ge_time.h"
#endif

#ifdef GE_USE_POSIX_THREADS
#include <limits.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Numbers of once-per-thread features.
 */
static unsigned int GE_thread_onces_boolean_count;
static unsigned int GE_thread_onces_character_8_count;
static unsigned int GE_thread_onces_character_32_count;
static unsigned int GE_thread_onces_integer_8_count;
static unsigned int GE_thread_onces_integer_16_count;
static unsigned int GE_thread_onces_integer_32_count;
static unsigned int GE_thread_onces_integer_64_count;
static unsigned int GE_thread_onces_natural_8_count;
static unsigned int GE_thread_onces_natural_16_count;
static unsigned int GE_thread_onces_natural_32_count;
static unsigned int GE_thread_onces_natural_64_count;
static unsigned int GE_thread_onces_pointer_count;
static unsigned int GE_thread_onces_real_32_count;
static unsigned int GE_thread_onces_real_64_count;
static unsigned int GE_thread_onces_reference_count;
static unsigned int GE_thread_onces_procedure_count;

/*
 * Mutexes used to protect the calls to once-per-process features.
 */
GE_once_mutexes* GE_process_once_mutexes;

/*
 * Create a new 'GE_once_mutexes' struct which can deal with the
 * numbers of once features passed as argument.
 */
GE_once_mutexes* GE_new_once_mutexes(
	unsigned int a_boolean_count,
	unsigned int a_character_8_count,
	unsigned int a_character_32_count,
	unsigned int a_integer_8_count,
	unsigned int a_integer_16_count,
	unsigned int a_integer_32_count,
	unsigned int a_integer_64_count,
	unsigned int a_natural_8_count,
	unsigned int a_natural_16_count,
	unsigned int a_natural_32_count,
	unsigned int a_natural_64_count,
	unsigned int a_pointer_count,
	unsigned int a_real_32_count,
	unsigned int a_real_64_count,
	unsigned int a_reference_count,
	unsigned int a_procedure_count)
{
	GE_once_mutexes* l_once_mutexes;
	unsigned int i;

	l_once_mutexes = (GE_once_mutexes*)GE_calloc_atomic_uncollectable(1, sizeof(GE_once_mutexes));
	if (a_boolean_count > 0) {
		l_once_mutexes->boolean_mutex = (EIF_POINTER*)GE_malloc_atomic_uncollectable(a_boolean_count * sizeof(EIF_POINTER));
		for (i = 0; i < a_boolean_count; i++) {
			l_once_mutexes->boolean_mutex[i] = GE_mutex_create();
		}
	}
	if (a_character_8_count > 0) {
		l_once_mutexes->character_8_mutex = (EIF_POINTER*)GE_malloc_atomic_uncollectable(a_character_8_count * sizeof(EIF_POINTER));
		for (i = 0; i < a_character_8_count; i++) {
			l_once_mutexes->character_8_mutex[i] = GE_mutex_create();
		}
	}
	if (a_character_32_count > 0) {
		l_once_mutexes->character_32_mutex = (EIF_POINTER*)GE_malloc_atomic_uncollectable(a_character_32_count * sizeof(EIF_POINTER));
		for (i = 0; i < a_character_32_count; i++) {
			l_once_mutexes->character_32_mutex[i] = GE_mutex_create();
		}
	}
	if (a_integer_8_count > 0) {
		l_once_mutexes->integer_8_mutex = (EIF_POINTER*)GE_malloc_atomic_uncollectable(a_integer_8_count * sizeof(EIF_POINTER));
		for (i = 0; i < a_integer_8_count; i++) {
			l_once_mutexes->integer_8_mutex[i] = GE_mutex_create();
		}
	}
	if (a_integer_16_count > 0) {
		l_once_mutexes->integer_16_mutex = (EIF_POINTER*)GE_malloc_atomic_uncollectable(a_integer_16_count * sizeof(EIF_POINTER));
		for (i = 0; i < a_integer_16_count; i++) {
			l_once_mutexes->integer_16_mutex[i] = GE_mutex_create();
		}
	}
	if (a_integer_32_count > 0) {
		l_once_mutexes->integer_32_mutex = (EIF_POINTER*)GE_malloc_atomic_uncollectable(a_integer_32_count * sizeof(EIF_POINTER));
		for (i = 0; i < a_integer_32_count; i++) {
			l_once_mutexes->integer_32_mutex[i] = GE_mutex_create();
		}
	}
	if (a_integer_64_count > 0) {
		l_once_mutexes->integer_64_mutex = (EIF_POINTER*)GE_malloc_atomic_uncollectable(a_integer_64_count * sizeof(EIF_POINTER));
		for (i = 0; i < a_integer_64_count; i++) {
			l_once_mutexes->integer_64_mutex[i] = GE_mutex_create();
		}
	}
	if (a_natural_8_count > 0) {
		l_once_mutexes->natural_8_mutex = (EIF_POINTER*)GE_malloc_atomic_uncollectable(a_natural_8_count * sizeof(EIF_POINTER));
		for (i = 0; i < a_natural_8_count; i++) {
			l_once_mutexes->natural_8_mutex[i] = GE_mutex_create();
		}
	}
	if (a_natural_16_count > 0) {
		l_once_mutexes->natural_16_mutex = (EIF_POINTER*)GE_malloc_atomic_uncollectable(a_natural_16_count * sizeof(EIF_POINTER));
		for (i = 0; i < a_natural_16_count; i++) {
			l_once_mutexes->natural_16_mutex[i] = GE_mutex_create();
		}
	}
	if (a_natural_32_count > 0) {
		l_once_mutexes->natural_32_mutex = (EIF_POINTER*)GE_malloc_atomic_uncollectable(a_natural_32_count * sizeof(EIF_POINTER));
		for (i = 0; i < a_natural_32_count; i++) {
			l_once_mutexes->natural_32_mutex[i] = GE_mutex_create();
		}
	}
	if (a_natural_64_count > 0) {
		l_once_mutexes->natural_64_mutex = (EIF_POINTER*)GE_malloc_atomic_uncollectable(a_natural_64_count * sizeof(EIF_POINTER));
		for (i = 0; i < a_natural_64_count; i++) {
			l_once_mutexes->natural_64_mutex[i] = GE_mutex_create();
		}
	}
	if (a_pointer_count > 0) {
		l_once_mutexes->pointer_mutex = (EIF_POINTER*)GE_malloc_atomic_uncollectable(a_pointer_count * sizeof(EIF_POINTER));
		for (i = 0; i < a_pointer_count; i++) {
			l_once_mutexes->pointer_mutex[i] = GE_mutex_create();
		}
	}
	if (a_real_32_count > 0) {
		l_once_mutexes->real_32_mutex = (EIF_POINTER*)GE_malloc_atomic_uncollectable(a_real_32_count * sizeof(EIF_POINTER));
		for (i = 0; i < a_real_32_count; i++) {
			l_once_mutexes->real_32_mutex[i] = GE_mutex_create();
		}
	}
	if (a_real_64_count > 0) {
		l_once_mutexes->real_64_mutex = (EIF_POINTER*)GE_malloc_atomic_uncollectable(a_real_64_count * sizeof(EIF_POINTER));
		for (i = 0; i < a_real_64_count; i++) {
			l_once_mutexes->real_64_mutex[i] = GE_mutex_create();
		}
	}
	if (a_reference_count > 0) {
		l_once_mutexes->reference_mutex = (EIF_POINTER*)GE_malloc_atomic_uncollectable(a_reference_count * sizeof(EIF_POINTER));
		for (i = 0; i < a_reference_count; i++) {
			l_once_mutexes->reference_mutex[i] = GE_mutex_create();
		}
	}
	if (a_procedure_count > 0) {
		l_once_mutexes->procedure_mutex = (EIF_POINTER*)GE_malloc_atomic_uncollectable(a_procedure_count * sizeof(EIF_POINTER));
		for (i = 0; i < a_procedure_count; i++) {
			l_once_mutexes->procedure_mutex[i] = GE_mutex_create();
		}
	}
	return l_once_mutexes;
}

/*
 * Keep track of the numbers of once-per-thread features.
 */
void GE_thread_onces_set_counts(
	unsigned int a_boolean_count,
	unsigned int a_character_8_count,
	unsigned int a_character_32_count,
	unsigned int a_integer_8_count,
	unsigned int a_integer_16_count,
	unsigned int a_integer_32_count,
	unsigned int a_integer_64_count,
	unsigned int a_natural_8_count,
	unsigned int a_natural_16_count,
	unsigned int a_natural_32_count,
	unsigned int a_natural_64_count,
	unsigned int a_pointer_count,
	unsigned int a_real_32_count,
	unsigned int a_real_64_count,
	unsigned int a_reference_count,
	unsigned int a_procedure_count)
{
	GE_thread_onces_boolean_count = a_boolean_count;
	GE_thread_onces_character_8_count = a_character_8_count;
	GE_thread_onces_character_32_count = a_character_32_count;
	GE_thread_onces_integer_8_count = a_integer_8_count;
	GE_thread_onces_integer_16_count = a_integer_16_count;
	GE_thread_onces_integer_32_count = a_integer_32_count;
	GE_thread_onces_integer_64_count = a_integer_64_count;
	GE_thread_onces_natural_8_count = a_natural_8_count;
	GE_thread_onces_natural_16_count = a_natural_16_count;
	GE_thread_onces_natural_32_count = a_natural_32_count;
	GE_thread_onces_natural_64_count = a_natural_64_count;
	GE_thread_onces_pointer_count = a_pointer_count;
	GE_thread_onces_real_32_count = a_real_32_count;
	GE_thread_onces_real_64_count = a_real_64_count;
	GE_thread_onces_reference_count = a_reference_count;
	GE_thread_onces_procedure_count = a_procedure_count;
}

/*
 * Initialize `process_onces' and `thread_onces' in `a_context'.
 */
static void GE_thread_init_onces(GE_context* a_context)
{
	a_context->process_onces = GE_new_onces(
		GE_process_onces->boolean_count,
		GE_process_onces->character_8_count,
		GE_process_onces->character_32_count,
		GE_process_onces->integer_8_count,
		GE_process_onces->integer_16_count,
		GE_process_onces->integer_32_count,
		GE_process_onces->integer_64_count,
		GE_process_onces->natural_8_count,
		GE_process_onces->natural_16_count,
		GE_process_onces->natural_32_count,
		GE_process_onces->natural_64_count,
		GE_process_onces->pointer_count,
		GE_process_onces->real_32_count,
		GE_process_onces->real_64_count,
		GE_process_onces->reference_count,
		GE_process_onces->procedure_count);
	a_context->thread_onces = GE_new_onces(
		GE_thread_onces_boolean_count,
		GE_thread_onces_character_8_count,
		GE_thread_onces_character_32_count,
		GE_thread_onces_integer_8_count,
		GE_thread_onces_integer_16_count,
		GE_thread_onces_integer_32_count,
		GE_thread_onces_integer_64_count,
		GE_thread_onces_natural_8_count,
		GE_thread_onces_natural_16_count,
		GE_thread_onces_natural_32_count,
		GE_thread_onces_natural_64_count,
		GE_thread_onces_pointer_count,
		GE_thread_onces_real_32_count,
		GE_thread_onces_real_64_count,
		GE_thread_onces_reference_count,
		GE_thread_onces_procedure_count);
}

/* Global mutex to protect creation of once-per-object data. */
EIF_POINTER GE_once_per_object_data_mutex;

/* Key to access Thread Specific Data. */
static EIF_TSD_TYPE GE_thread_context_key;

#define GE_THREAD_OK 1
#define GE_THREAD_BUSY 2
#define GE_THREAD_TIMEDOUT 3
#define GE_THREAD_ERROR 4

/*
 * Create a new mutex.
 * Do not raise an exception in case of error (just return a null pointer).
 */
static EIF_POINTER GE_unprotected_mutex_create(uintptr_t a_spin_count)
{
#ifdef GE_USE_POSIX_THREADS
	EIF_MUTEX_TYPE* l_mutex;

	l_mutex = (EIF_MUTEX_TYPE*)GE_unprotected_malloc_atomic_uncollectable(sizeof(EIF_MUTEX_TYPE));
	if (l_mutex) {
			/* Make the mutex recursive by default. */
			/* This allows a thread to lock the mutex several times without blocking itself. */
		pthread_mutexattr_t l_attr;
		pthread_mutexattr_init(&l_attr);
		pthread_mutexattr_settype(&l_attr, PTHREAD_MUTEX_RECURSIVE);
		if (pthread_mutex_init(l_mutex, &l_attr)) {
			GE_free(l_mutex);
			l_mutex = NULL;
		}
		pthread_mutexattr_destroy(&l_attr);
	}
	return (EIF_POINTER)l_mutex;
#elif defined EIF_WINDOWS
	EIF_CS_TYPE* l_section;

	l_section = (EIF_CS_TYPE*)GE_unprotected_malloc_atomic_uncollectable(sizeof(EIF_CS_TYPE));
	if (l_section) {
		if (!InitializeCriticalSectionAndSpinCount(l_section, (DWORD)a_spin_count)) {
			GE_free(l_section);
			l_section = NULL;
		}
	}
	return (EIF_POINTER)l_section;
#else
	return (EIF_POINTER)0;
#endif
}

/*
 * Create a new mutex.
 */
EIF_POINTER GE_mutex_create(void)
{
	EIF_POINTER l_mutex;

	l_mutex = GE_unprotected_mutex_create(4000);
	if (!l_mutex) {
		GE_raise_with_message(GE_EX_EXT, "Cannot create mutex");
	}
	return l_mutex;
}

/*
 * Lock mutex.
 * Do not raise an exception in case of error (just return a status).
 */
static int GE_unprotected_mutex_lock(EIF_POINTER a_mutex)
{
#ifdef GE_USE_POSIX_THREADS
	if (pthread_mutex_lock((EIF_MUTEX_TYPE*)a_mutex)) {
		return GE_THREAD_ERROR;
	}
	return GE_THREAD_OK;
#elif defined EIF_WINDOWS
	EnterCriticalSection((EIF_CS_TYPE*)a_mutex);
	return GE_THREAD_OK;
#else
	return GE_THREAD_ERROR;
	GE_raise_with_message(GE_EX_EXT, "Cannot lock mutex");
#endif
}

/*
 * Lock mutex.
 */
void GE_mutex_lock(EIF_POINTER a_mutex)
{
	if (GE_unprotected_mutex_lock(a_mutex) != GE_THREAD_OK) {
		GE_raise_with_message(GE_EX_EXT, "Cannot lock mutex");
	}
}

/*
 * Try to lock mutex.
 * Do not raise an exception in case of error (just return a status).
 */
static int GE_unprotected_mutex_try_lock(EIF_POINTER a_mutex)
{
#ifdef GE_USE_POSIX_THREADS
	switch (pthread_mutex_trylock((EIF_MUTEX_TYPE*)a_mutex)) {
	case EBUSY:
		return GE_THREAD_BUSY;
	case 0:
		return GE_THREAD_OK;
	default:
		return GE_THREAD_ERROR;
	}
#elif defined EIF_WINDOWS
	if (TryEnterCriticalSection((EIF_CS_TYPE*)a_mutex)) {
		return GE_THREAD_OK;
	} else {
		return GE_THREAD_BUSY;
	}
#else
	return GE_THREAD_ERROR;
#endif
}

/*
 * Try to lock mutex. Return True on success.
 */
EIF_BOOLEAN GE_mutex_try_lock(EIF_POINTER a_mutex)
{
	switch (GE_unprotected_mutex_try_lock(a_mutex)) {
	case GE_THREAD_OK:
		return EIF_TRUE;
	case GE_THREAD_BUSY:
		return EIF_FALSE;
	default:
		GE_raise_with_message(GE_EX_EXT, "Cannot lock mutex");
		return EIF_FALSE;
	}
}

/*
 * Unlock mutex.
 * Do not raise an exception in case of error (just return a status).
 */
static int GE_unprotected_mutex_unlock(EIF_POINTER a_mutex)
{
#ifdef GE_USE_POSIX_THREADS
	if (pthread_mutex_unlock((EIF_MUTEX_TYPE*)a_mutex)) {
		return GE_THREAD_ERROR;
	}
	return GE_THREAD_OK;
#elif defined EIF_WINDOWS
	LeaveCriticalSection((EIF_CS_TYPE*)a_mutex);
	return GE_THREAD_OK;
#else
	return GE_THREAD_ERROR;
#endif
}

/*
 * Unlock mutex.
 */
void GE_mutex_unlock(EIF_POINTER a_mutex)
{
	if (GE_unprotected_mutex_unlock(a_mutex) != GE_THREAD_OK) {
		GE_raise_with_message(GE_EX_EXT, "Cannot unlock mutex");
	}
}

/*
 * Destroy and free all resources used by mutex.
 * Do not raise an exception in case of error (just return a status).
 */
static int GE_unprotected_mutex_destroy(EIF_POINTER a_mutex)
{
#ifdef GE_USE_POSIX_THREADS
	int l_result = GE_THREAD_OK;

	if (a_mutex) {
		if (pthread_mutex_destroy((EIF_MUTEX_TYPE*)a_mutex)) {
			l_result = GE_THREAD_ERROR;
		}
		GE_free(a_mutex);
	}
	return l_result;
#elif defined EIF_WINDOWS
	if (a_mutex) {
		DeleteCriticalSection((EIF_CS_TYPE*)a_mutex);
		GE_free(a_mutex);
	}
	return GE_THREAD_OK;
#else
	return GE_THREAD_ERROR;
#endif
}

/*
 * Destroy and free all resources used by mutex.
 */
void GE_mutex_destroy(EIF_POINTER a_mutex)
{
	GE_unprotected_mutex_destroy(a_mutex);
}

/*
 * Create a new semaphore allowing `a_count' threads
 * to go into a critical section.
 * Do not raise an exception in case of error (just return a null pointer).
 */
static EIF_POINTER GE_unprotected_semaphore_create(EIF_INTEGER a_count)
{
	EIF_SEM_TYPE* l_semaphore;

#ifdef GE_USE_POSIX_THREADS
	l_semaphore = (EIF_SEM_TYPE*)GE_unprotected_malloc_atomic_uncollectable(sizeof(EIF_SEM_TYPE));
	if (l_semaphore) {
		if (sem_init(l_semaphore, 0, a_count)) {
			GE_free(l_semaphore);
			l_semaphore = NULL;
		}
	}
	return (EIF_POINTER)l_semaphore;
#elif defined EIF_WINDOWS
	l_semaphore = CreateSemaphore(NULL, (LONG)a_count, (LONG)0x7fffffff, NULL);
	return (EIF_POINTER)l_semaphore;
#else
	return (EIF_POINTER)0;
#endif
}

/*
 * Create a new semaphore allowing `a_count' threads
 * to go into a critical section.
 */
EIF_POINTER GE_semaphore_create(EIF_INTEGER a_count)
{
	EIF_POINTER l_semaphore;

	l_semaphore = GE_unprotected_semaphore_create(a_count);
	if (!l_semaphore) {
		GE_raise_with_message(GE_EX_EXT, "Cannot create semaphore");
	}
	return l_semaphore;
}

/*
 * Decrement semaphore count, waiting if necessary
 * until that becomes possible.
 * Do not raise an exception in case of error (just return a status).
 */
static int GE_unprotected_semaphore_wait(EIF_POINTER a_semaphore)
{
#ifdef GE_USE_POSIX_THREADS
	if (sem_wait((EIF_SEM_TYPE*)a_semaphore)) {
		return GE_THREAD_ERROR;
	}
	return GE_THREAD_OK;
#elif defined EIF_WINDOWS
	switch (WaitForSingleObject((EIF_SEM_TYPE*)a_semaphore, INFINITE)) {
	case WAIT_FAILED:
	case WAIT_ABANDONED:
		return GE_THREAD_ERROR;
	}
	return GE_THREAD_OK;
#else
	return GE_THREAD_ERROR;
#endif
}

/*
 * Decrement semaphore count, waiting if necessary
 * until that becomes possible.
 */
void GE_semaphore_wait(EIF_POINTER a_semaphore)
{
	if (GE_unprotected_semaphore_wait(a_semaphore) != GE_THREAD_OK) {
		GE_raise_with_message(GE_EX_EXT, "Cannot wait on semaphore");
	}
}

/*
 * Has client been successful in decrementing semaphore
 * count without waiting?
 * Do not raise an exception in case of error (just return a status).
 */
static int GE_unprotected_semaphore_try_wait(EIF_POINTER a_semaphore)
{
#ifdef GE_USE_POSIX_THREADS
	if (sem_trywait((EIF_SEM_TYPE*)a_semaphore)) {
		switch (errno) {
		case EBUSY:
		case EAGAIN:
			return GE_THREAD_BUSY;
		case 0:
			return GE_THREAD_OK;
		default:
			return GE_THREAD_ERROR;
		}
	} else {
		return GE_THREAD_OK;
	}
#elif defined EIF_WINDOWS
	switch (WaitForSingleObject((EIF_SEM_TYPE*)a_semaphore, 0)) {
	case WAIT_FAILED:
	case WAIT_ABANDONED:
		return GE_THREAD_ERROR;
	case WAIT_TIMEOUT:
		return GE_THREAD_BUSY;
	default:
		return GE_THREAD_OK;
	}
#else
	return GE_THREAD_ERROR;
#endif
}

/*
 * Has client been successful in decrementing semaphore
 * count without waiting?
 */
EIF_BOOLEAN GE_semaphore_try_wait(EIF_POINTER a_semaphore)
{
	switch (GE_unprotected_semaphore_try_wait(a_semaphore)) {
	case GE_THREAD_OK:
		return EIF_TRUE;
	case GE_THREAD_BUSY:
		return EIF_FALSE;
	default:
		GE_raise_with_message(GE_EX_EXT, "Cannot try_wait on semaphore");
		return EIF_FALSE;
	}
}

/*
 * Increment semaphore count.
 * Do not raise an exception in case of error (just return a status).
 */
static int GE_unprotected_semaphore_post(EIF_POINTER a_semaphore)
{
#ifdef GE_USE_POSIX_THREADS
	if (sem_post((EIF_SEM_TYPE*)a_semaphore)) {
		return GE_THREAD_ERROR;
	}
	return GE_THREAD_OK;
#elif defined EIF_WINDOWS
	if (!ReleaseSemaphore((EIF_SEM_TYPE*)a_semaphore, 1, NULL)) {
		return GE_THREAD_ERROR;
	}
	return GE_THREAD_OK;
#else
	return GE_THREAD_ERROR;
#endif
}

/*
 * Increment semaphore count.
 */
void GE_semaphore_post(EIF_POINTER a_semaphore)
{
	if (GE_unprotected_semaphore_post(a_semaphore) != GE_THREAD_OK) {
		GE_raise_with_message(GE_EX_EXT, "Cannot post on semaphore");
	}
}

/*
 * Destroy and free all resources used by semaphore.
 * Do not raise an exception in case of error (just return a status).
 */
static int GE_unprotected_semaphore_destroy(EIF_POINTER a_semaphore)
{
#ifdef GE_USE_POSIX_THREADS
	int l_result = GE_THREAD_OK;

	if (a_semaphore) {
		if (sem_destroy((EIF_SEM_TYPE*)a_semaphore)) {
			l_result = GE_THREAD_ERROR;
		}
		GE_free(a_semaphore);
	}
	return l_result;
#elif defined EIF_WINDOWS
	int l_result = GE_THREAD_OK;

	if (a_semaphore) {
		if (!CloseHandle((EIF_SEM_TYPE*)a_semaphore)) {
			l_result = GE_THREAD_ERROR;
		}
	}
	return l_result;
#else
	return GE_THREAD_ERROR;
#endif
}

/*
 * Destroy and free all resources used by semaphore.
 */
void GE_semaphore_destroy(EIF_POINTER a_semaphore)
{
	GE_unprotected_semaphore_destroy(a_semaphore);
}

/*
 * Create a new condition variable.
 * Do not raise an exception in case of error (just return a null pointer).
 */
static EIF_POINTER GE_unprotected_condition_variable_create(void)
{
	EIF_COND_TYPE* l_condition_variable;

#ifdef GE_USE_POSIX_THREADS
	l_condition_variable = (EIF_COND_TYPE*)GE_unprotected_malloc_atomic_uncollectable(sizeof(EIF_COND_TYPE));
	if (l_condition_variable) {
		if (pthread_cond_init(l_condition_variable, NULL)) {
			GE_free(l_condition_variable);
			l_condition_variable = NULL;
		}
	}
	return (EIF_POINTER)l_condition_variable;
#elif defined EIF_WINDOWS
	EIF_SEM_TYPE* l_semaphore;
	EIF_CS_TYPE* l_section;

	l_condition_variable = (EIF_COND_TYPE*)GE_unprotected_malloc_atomic_uncollectable(sizeof(EIF_COND_TYPE));
	if (l_condition_variable) {
		memset(l_condition_variable, 0, sizeof(EIF_COND_TYPE));
		l_semaphore = (EIF_SEM_TYPE*)GE_unprotected_semaphore_create(0);
		if (l_semaphore) {
			l_condition_variable->semaphore = l_semaphore;
			l_section = (EIF_CS_TYPE*)GE_unprotected_mutex_create(100);
			if (l_section) {
				l_condition_variable->csection = l_section;
			} else {
				GE_unprotected_semaphore_destroy((EIF_POINTER)l_semaphore);
				GE_free(l_condition_variable);
				l_condition_variable = NULL;
			}
		} else {
			GE_free(l_condition_variable);
			l_condition_variable = NULL;
		}
	}
	return (EIF_POINTER)l_condition_variable;
#else
	return (EIF_POINTER)0;
#endif
}

/*
 * Create a new condition variable.
 */
EIF_POINTER GE_condition_variable_create(void)
{
	EIF_POINTER l_condition_variable;

	l_condition_variable = GE_unprotected_condition_variable_create();
	if (!l_condition_variable) {
		GE_raise_with_message(GE_EX_EXT, "Cannot create condition variable");
	}
	return l_condition_variable;
}

/*
 * Unblock all threads blocked on condition variable.
 * Do not raise an exception in case of error (just return a status).
 */
static int GE_unprotected_condition_variable_broadcast(EIF_POINTER a_condition_variable)
{
#ifdef GE_USE_POSIX_THREADS
	if (pthread_cond_broadcast((EIF_COND_TYPE*)a_condition_variable)) {
		return GE_THREAD_ERROR;
	}
	return GE_THREAD_OK;
#elif defined EIF_WINDOWS
	EIF_COND_TYPE* l_condition_variable;
	unsigned long l_num_wake = 0;
	int l_result = GE_THREAD_OK;

	l_condition_variable = (EIF_COND_TYPE*)a_condition_variable;
	l_result = GE_unprotected_mutex_lock((EIF_POINTER)l_condition_variable->csection);
	if (l_result == GE_THREAD_OK) {
		if (l_condition_variable->num_waiting > l_condition_variable->num_wake) {
			l_num_wake = l_condition_variable->num_waiting - l_condition_variable->num_wake;
			l_condition_variable->num_wake = l_condition_variable->num_waiting;
			l_condition_variable->generation++;
		}
		l_result = GE_unprotected_mutex_unlock((EIF_POINTER)l_condition_variable->csection);
		while ((l_result == GE_THREAD_OK) && l_num_wake) {
			l_result = GE_unprotected_semaphore_post((EIF_POINTER)l_condition_variable->semaphore);
			l_num_wake--;
		}
	}
	return l_result;
#else
	return GE_THREAD_ERROR;
#endif
}

/*
 * Unblock all threads blocked on condition variable.
 */
void GE_condition_variable_broadcast(EIF_POINTER a_condition_variable)
{
	if (GE_unprotected_condition_variable_broadcast(a_condition_variable) != GE_THREAD_OK) {
		GE_raise_with_message(GE_EX_EXT, "Cannot broadcast on condition variable");
	}
}

/*
 * Unblock one thread blocked on condition variable.
 * Do not raise an exception in case of error (just return a status).
 */
static int GE_unprotected_condition_variable_signal(EIF_POINTER a_condition_variable)
{
#ifdef GE_USE_POSIX_THREADS
	if (pthread_cond_signal((EIF_COND_TYPE*)a_condition_variable)) {
		return GE_THREAD_ERROR;
	}
	return GE_THREAD_OK;
#elif defined EIF_WINDOWS
	EIF_COND_TYPE* l_condition_variable;
	unsigned int l_wake = 0;
	int l_result = GE_THREAD_OK;

	l_condition_variable = (EIF_COND_TYPE*)a_condition_variable;
	l_result = GE_unprotected_mutex_lock((EIF_POINTER)l_condition_variable->csection);
	if (l_result == GE_THREAD_OK) {
			/* Do nothing if they are more signaled ones than awaiting threads. */
		if (l_condition_variable->num_waiting > l_condition_variable->num_wake) {
			l_wake = 1;
			l_condition_variable->num_wake++;
			l_condition_variable->generation++;
		}
		l_result = GE_unprotected_mutex_unlock((EIF_POINTER)l_condition_variable->csection);
		if ((l_result == GE_THREAD_OK) && l_wake) {
			l_result = GE_unprotected_semaphore_post((EIF_POINTER)l_condition_variable->semaphore);
		}
	}
	return l_result;
#else
	return GE_THREAD_ERROR;
#endif
}

/*
 * Unblock one thread blocked on condition variable.
 */
void GE_condition_variable_signal(EIF_POINTER a_condition_variable)
{
	if (GE_unprotected_condition_variable_signal(a_condition_variable) != GE_THREAD_OK) {
		GE_raise_with_message(GE_EX_EXT, "Cannot signal on condition variable");
	}
}

#ifdef GE_USE_POSIX_THREADS
/*
 * Given a timeout in milliseconds, computes a timespec structure equivalent.
 * `a_timeout': Timeout to convert in milliseconds.
 *
 */
static struct timespec GE_timeout_to_timespec(uintptr_t a_timeout)
{
	time_t l_seconds = a_timeout / 1000;	/* `a_timeout' is in millisecond */
	long l_nano_seconds = (a_timeout % 1000) * 1000000;	/* Reminder in nanoseconds */
	struct timespec tspec;
	struct timeval now;
	GE_ftime(&now);
	tspec.tv_sec = now.tv_sec + l_seconds;
	l_nano_seconds += (now.tv_usec * 1000);
	tspec.tv_nsec = l_nano_seconds;
		/* If `l_nano_seconds' is greater than 1 second, we need to update `tspec'
		 * accordingly otherwise we may get EINVAL on some platforms. */
	if (l_nano_seconds > 1000000000) {
		tspec.tv_sec++;
		tspec.tv_nsec -= 1000000000;
	}
	return tspec;
}
#endif

/*
 * Block calling thread on condition variable for at most `a_timeout' milliseconds.
 * Do not raise an exception in case of error (just return a status).
 */
static int GE_unprotected_condition_variable_wait_with_timeout(EIF_POINTER a_condition_variable, EIF_POINTER a_mutex, uintptr_t a_timeout)
{
#ifdef GE_USE_POSIX_THREADS
	struct timespec l_tspec = GE_timeout_to_timespec(a_timeout);
	switch (pthread_cond_timedwait((EIF_COND_TYPE*)a_condition_variable, (EIF_MUTEX_TYPE*)a_mutex, &l_tspec)) {
	case 0:
		return GE_THREAD_OK;
	case ETIMEDOUT:
		return GE_THREAD_TIMEDOUT;
	default:
		return GE_THREAD_ERROR;
	}
#elif defined EIF_WINDOWS
	EIF_COND_TYPE* l_condition_variable;
	unsigned int l_wake = 0;
	unsigned long l_generation;

	l_condition_variable = (EIF_COND_TYPE*)a_condition_variable;
	GE_unprotected_mutex_lock((EIF_POINTER)l_condition_variable->csection);
	l_condition_variable->num_waiting++;
	l_generation = l_condition_variable->generation;
	GE_unprotected_mutex_unlock((EIF_POINTER)l_condition_variable->csection);
	GE_unprotected_mutex_unlock(a_mutex);
	for (;;) {
		switch (WaitForSingleObject(l_condition_variable->semaphore, (DWORD)a_timeout)) {
		case WAIT_FAILED:
		case WAIT_ABANDONED:
			GE_unprotected_mutex_lock(a_mutex);
			return GE_THREAD_ERROR;
		case WAIT_TIMEOUT:
			GE_unprotected_mutex_lock((EIF_POINTER)l_condition_variable->csection);
			l_condition_variable->num_waiting--;
			GE_unprotected_mutex_unlock((EIF_POINTER)l_condition_variable->csection);
			GE_unprotected_mutex_lock(a_mutex);
			return GE_THREAD_TIMEDOUT;
		default:
			GE_unprotected_mutex_lock((EIF_POINTER)l_condition_variable->csection);
			if (l_condition_variable->num_wake) {
				if (l_condition_variable->generation != l_generation) {
					l_condition_variable->num_wake--;
					l_condition_variable->num_waiting--;
					GE_unprotected_mutex_unlock((EIF_POINTER)l_condition_variable->csection);
					GE_unprotected_mutex_lock(a_mutex);
					return GE_THREAD_OK;
				} else {
					l_wake = 1;
				}
			}
			GE_unprotected_mutex_unlock((EIF_POINTER)l_condition_variable->csection);
			if (l_wake) {
				l_wake = 0;
				GE_unprotected_semaphore_post((EIF_POINTER)l_condition_variable->semaphore);
			}
		}
	}
#else
	return GE_THREAD_ERROR;
#endif
}

/*
 * Block calling thread on condition variable for at most `a_timeout' milliseconds.
 * Return 1 is we got the condition variable on time, otherwise return 0.
 */
EIF_INTEGER GE_condition_variable_wait_with_timeout(EIF_POINTER a_condition_variable, EIF_POINTER a_mutex, EIF_INTEGER a_timeout)
{
	switch (GE_unprotected_condition_variable_wait_with_timeout(a_condition_variable, a_mutex, (uintptr_t)a_timeout)) {
	case GE_THREAD_OK:
		return 1;
	case GE_THREAD_TIMEDOUT:
		return 0;
	default:
		GE_raise_with_message(GE_EX_EXT, "Cannot wait with timeout on condition variable");
		return -1;
	}
}

/*
 * Block calling thread on condition variable.
 * Do not raise an exception in case of error (just return a status).
 */
static int GE_unprotected_condition_variable_wait(EIF_POINTER a_condition_variable, EIF_POINTER a_mutex)
{
#ifdef GE_USE_POSIX_THREADS
	if (pthread_cond_wait((EIF_COND_TYPE*)a_condition_variable, (EIF_MUTEX_TYPE*)a_mutex)) {
		return GE_THREAD_ERROR;
	}
	return GE_THREAD_OK;
#elif defined EIF_WINDOWS
	return GE_unprotected_condition_variable_wait_with_timeout(a_condition_variable, a_mutex, (uintptr_t)INFINITE);
#else
	return GE_THREAD_ERROR;
#endif
}

/*
 * Block calling thread on condition variable.
 */
void GE_condition_variable_wait(EIF_POINTER a_condition_variable, EIF_POINTER a_mutex)
{
	if (GE_unprotected_condition_variable_wait(a_condition_variable, a_mutex) != GE_THREAD_OK) {
		GE_raise_with_message(GE_EX_EXT, "Cannot wait on condition variable");
	}
}

/*
 * Destroy and free all resources used by condition variable.
 * Do not raise an exception in case of error (just return a status).
 */
static int GE_unprotected_condition_variable_destroy(EIF_POINTER a_condition_variable)
{
#ifdef GE_USE_POSIX_THREADS
	int l_result = GE_THREAD_OK;

	if (a_condition_variable) {
		if (pthread_cond_destroy((EIF_COND_TYPE*)a_condition_variable)) {
			l_result = GE_THREAD_ERROR;
		}
		GE_free(a_condition_variable);
	}
	return l_result;
#elif defined EIF_WINDOWS
	EIF_COND_TYPE* l_condition_variable;
	EIF_CS_TYPE* l_section;
	int l_result = GE_THREAD_OK;
	int l_other_result;

	if (a_condition_variable) {
		l_condition_variable = (EIF_COND_TYPE*)a_condition_variable;
		l_other_result = GE_unprotected_semaphore_destroy((EIF_POINTER)l_condition_variable->semaphore);
		if (l_other_result != GE_THREAD_OK) {
			l_result = l_other_result;
		}
		l_other_result = GE_unprotected_mutex_destroy((EIF_POINTER)l_condition_variable->csection);
		if (l_other_result != GE_THREAD_OK) {
			l_result = l_other_result;
		}
		GE_free(a_condition_variable);
	}
	return l_result;
#else
	return GE_THREAD_ERROR;
#endif
}

/*
 * Destroy and free all resources used by condition variable.
 */
void GE_condition_variable_destroy(EIF_POINTER a_condition_variable)
{
	GE_unprotected_condition_variable_destroy(a_condition_variable);
}

/*
 * Create a new read-write lock.
 * Do not raise an exception in case of error (just return a null pointer).
 */
static EIF_POINTER GE_unprotected_read_write_lock_create(void)
{
	EIF_RWL_TYPE* l_read_write_lock;

#ifdef GE_USE_POSIX_THREADS
	l_read_write_lock = (EIF_RWL_TYPE*)GE_unprotected_malloc_atomic_uncollectable(sizeof(EIF_RWL_TYPE));
	if (l_read_write_lock) {
		if (pthread_rwlock_init(l_read_write_lock, NULL)) {
			GE_free(l_read_write_lock);
			l_read_write_lock = NULL;
		}
	}
	return (EIF_POINTER)l_read_write_lock;
#elif defined EIF_WINDOWS
	EIF_MUTEX_TYPE* l_mutex;
	EIF_COND_TYPE* l_readers_ok;
	EIF_COND_TYPE* l_writers_ok;

	l_read_write_lock = (EIF_RWL_TYPE*)GE_unprotected_malloc_atomic_uncollectable(sizeof(EIF_RWL_TYPE));
	if (l_read_write_lock) {
		l_mutex = (EIF_MUTEX_TYPE*)GE_unprotected_mutex_create(4000);
		if (l_mutex) {
			l_readers_ok = (EIF_COND_TYPE*)GE_unprotected_condition_variable_create();
			if (l_readers_ok) {
				l_writers_ok = (EIF_COND_TYPE*)GE_unprotected_condition_variable_create();
				if (l_writers_ok) {
					l_read_write_lock->m = l_mutex;
					l_read_write_lock->readers_ok = l_readers_ok;
					l_read_write_lock->writers_ok = l_writers_ok;
					l_read_write_lock->rwlock = 0;
					l_read_write_lock->waiting_writers = 0;
				} else {
					GE_unprotected_condition_variable_destroy((EIF_POINTER)l_readers_ok);
					GE_unprotected_mutex_destroy((EIF_POINTER)l_mutex);
					GE_free(l_read_write_lock);
					l_read_write_lock = NULL;
				}
			} else {
				GE_unprotected_mutex_destroy((EIF_POINTER)l_mutex);
				GE_free(l_read_write_lock);
				l_read_write_lock = NULL;
			}
		} else {
			GE_free(l_read_write_lock);
			l_read_write_lock = NULL;
		}
	}
	return (EIF_POINTER)l_read_write_lock;
#else
	return (EIF_POINTER)0;
#endif
}

/*
 * Create a new read-write lock.
 */
EIF_POINTER GE_read_write_lock_create(void)
{
	EIF_POINTER l_read_write_lock;

	l_read_write_lock = GE_unprotected_read_write_lock_create();
	if (!l_read_write_lock) {
		GE_raise_with_message(GE_EX_EXT, "Cannot create read-write lock variable");
	}
	return l_read_write_lock;
}

/*
 * Acquire a read lock. Multiple readers can go if there are no writer.
 * Do not raise an exception in case of error (just return a status).
 */
static int GE_unprotected_read_write_lock_read_lock(EIF_POINTER a_read_write_lock)
{
#ifdef GE_USE_POSIX_THREADS
	if (pthread_rwlock_rdlock((EIF_RWL_TYPE*)a_read_write_lock)) {
		return GE_THREAD_ERROR;
	}
	return GE_THREAD_OK;
#elif defined EIF_WINDOWS
	EIF_RWL_TYPE* l_read_write_lock;
	int l_result;

	l_read_write_lock = (EIF_RWL_TYPE*)a_read_write_lock;
	l_result = GE_unprotected_mutex_lock((EIF_POINTER)l_read_write_lock->m);
	if (l_result == GE_THREAD_OK) {
		while ((l_read_write_lock->rwlock < 0 || l_read_write_lock->waiting_writers) && (l_result == GE_THREAD_OK)) {
			l_result = GE_unprotected_condition_variable_wait((EIF_POINTER)l_read_write_lock->readers_ok, (EIF_POINTER)l_read_write_lock->m);
		}
		if (l_result == GE_THREAD_OK) {
			l_read_write_lock->rwlock++;
		}
		l_result = GE_unprotected_mutex_unlock((EIF_POINTER)l_read_write_lock->m);
	}
	return l_result;
#else
	return GE_THREAD_ERROR;
#endif
}

/*
 * Acquire a read lock. Multiple readers can go if there are no writer.
 */
void GE_read_write_lock_read_lock(EIF_POINTER a_read_write_lock)
{
	if (GE_unprotected_read_write_lock_read_lock(a_read_write_lock) != GE_THREAD_OK) {
		GE_raise_with_message(GE_EX_EXT, "Cannot read lock");
	}
}

/*
 * Acquire a write lock. Only a single write can proceed.
 * Do not raise an exception in case of error (just return a status).
 */
static int GE_unprotected_read_write_lock_write_lock(EIF_POINTER a_read_write_lock)
{
#ifdef GE_USE_POSIX_THREADS
	if (pthread_rwlock_wrlock((EIF_RWL_TYPE*)a_read_write_lock)) {
		return GE_THREAD_ERROR;
	}
	return GE_THREAD_OK;
#elif defined EIF_WINDOWS
	EIF_RWL_TYPE* l_read_write_lock;
	int l_result;

	l_read_write_lock = (EIF_RWL_TYPE*)a_read_write_lock;
	l_result = GE_unprotected_mutex_lock((EIF_POINTER)l_read_write_lock->m);
	if (l_result == GE_THREAD_OK) {
		while ((l_read_write_lock->rwlock != 0) && (l_result == GE_THREAD_OK)) {
			l_read_write_lock->waiting_writers++;
			l_result = GE_unprotected_condition_variable_wait((EIF_POINTER)l_read_write_lock->writers_ok, (EIF_POINTER)l_read_write_lock->m);
			l_read_write_lock->waiting_writers--;
		}
		if (l_result == GE_THREAD_OK) {
			l_read_write_lock->rwlock = -1;
		}
		l_result = GE_unprotected_mutex_unlock((EIF_POINTER)l_read_write_lock->m);
	}
	return l_result;
#else
	return GE_THREAD_ERROR;
#endif
}

/*
 * Acquire a write lock. Only a single write can proceed.
 */
void GE_read_write_lock_write_lock(EIF_POINTER a_read_write_lock)
{
	if (GE_unprotected_read_write_lock_write_lock(a_read_write_lock) != GE_THREAD_OK) {
		GE_raise_with_message(GE_EX_EXT, "Cannot write lock");
	}
}

/*
 * Unlock a read or write lock.
 * Do not raise an exception in case of error (just return a status).
 */
static int GE_unprotected_read_write_lock_unlock(EIF_POINTER a_read_write_lock)
{
#ifdef GE_USE_POSIX_THREADS
	if (pthread_rwlock_unlock((EIF_RWL_TYPE*)a_read_write_lock)) {
		return GE_THREAD_ERROR;
	}
	return GE_THREAD_OK;
#elif defined EIF_WINDOWS
	EIF_RWL_TYPE* l_read_write_lock;
	int l_result;
	int ww, wr;

	l_read_write_lock = (EIF_RWL_TYPE*)a_read_write_lock;
	l_result = GE_unprotected_mutex_lock((EIF_POINTER)l_read_write_lock->m);
	if (l_result == GE_THREAD_OK) {
			/* rwlock < 0 iflocked for writing */
		if (l_read_write_lock->rwlock < 0) {
			l_read_write_lock->rwlock = 0;
		} else {
			l_read_write_lock->rwlock--;
		}

			/* Keep flags that show if there are waiting readers or writers
			 * so that we can wake them up outside the mocitor lock. */
		ww = (l_read_write_lock->waiting_writers && l_read_write_lock->rwlock == 0);
		wr = (l_read_write_lock->waiting_writers == 0);

		l_result = GE_unprotected_mutex_unlock((EIF_POINTER)l_read_write_lock->m);
		if (l_result == GE_THREAD_OK) {
				/* Wake up a waiting writer first. Otherwise wake up all readers. */
			if (ww) {
				l_result = GE_unprotected_condition_variable_signal((EIF_POINTER)l_read_write_lock->writers_ok);
			} else if (wr) {
				l_result = GE_unprotected_condition_variable_broadcast((EIF_POINTER)l_read_write_lock->readers_ok);
			}
		}
	}
	return l_result;
#else
	return GE_THREAD_ERROR;
#endif
}

/*
 * Unlock a read or write lock.
 */
void GE_read_write_lock_unlock(EIF_POINTER a_read_write_lock)
{
	if (GE_unprotected_read_write_lock_unlock(a_read_write_lock) != GE_THREAD_OK) {
		GE_raise_with_message(GE_EX_EXT, "Cannot unlock read-write lock");
	}
}

/*
 * Destroy and free all resources used by read-write lock.
 * Do not raise an exception in case of error (just return a status).
 */
static int GE_unprotected_read_write_lock_destroy(EIF_POINTER a_read_write_lock)
{
#ifdef GE_USE_POSIX_THREADS
	int l_result = GE_THREAD_OK;

	if (a_read_write_lock) {
		if (pthread_rwlock_destroy((EIF_RWL_TYPE*)a_read_write_lock)) {
			l_result = GE_THREAD_ERROR;
		}
		GE_free(a_read_write_lock);
	}
	return l_result;
#elif defined EIF_WINDOWS
	EIF_RWL_TYPE* l_read_write_lock;
	int l_result = GE_THREAD_OK;
	int l_other_result;

	if (a_read_write_lock) {
		l_read_write_lock = (EIF_RWL_TYPE*)a_read_write_lock;
		l_other_result = GE_unprotected_mutex_destroy((EIF_POINTER)l_read_write_lock->m);
		if (l_other_result != GE_THREAD_OK) {
			l_result = l_other_result;
		}
		l_other_result = GE_unprotected_condition_variable_destroy((EIF_POINTER)l_read_write_lock->readers_ok);
		if (l_other_result != GE_THREAD_OK) {
			l_result = l_other_result;
		}
		l_other_result = GE_unprotected_condition_variable_destroy((EIF_POINTER)l_read_write_lock->writers_ok);
		if (l_other_result != GE_THREAD_OK) {
			l_result = l_other_result;
		}
		GE_free(l_read_write_lock);
	}
	return l_result;
#else
	return GE_THREAD_ERROR;
#endif
}

/*
 * Destroy and free all resources used by read-write lock.
 */
void GE_read_write_lock_destroy(EIF_POINTER a_read_write_lock)
{
	GE_unprotected_read_write_lock_destroy(a_read_write_lock);
}

/*
 * Pointer to current thread.
 */
static EIF_THR_TYPE GE_current_thread(void)
{
#ifdef GE_USE_POSIX_THREADS
	return pthread_self();
#elif defined EIF_WINDOWS
		/* On Windows, `GetCurrentThread' returns a pseudo handle to the Current thread, */
		/* so we have to do something special on Windows. */
	return OpenThread(THREAD_ALL_ACCESS, FALSE, GetCurrentThreadId());
#endif
}

/*
 * Register context of current thread.
 */
static void GE_register_thread_context(GE_context* a_context)
{
	EIF_TSD_SET(GE_thread_context_key, a_context, "Cannot bind thread context to TSD.");
}

/*
 * Set priority level to thread.
 */
static void GE_thread_set_priority(EIF_THR_TYPE a_thread_id, unsigned int a_priority)
{
#ifdef GE_USE_POSIX_THREADS
	struct sched_param l_param;
	memset(&l_param, 0, sizeof(struct sched_param));
	l_param.sched_priority = a_priority;
	pthread_setschedparam(a_thread_id, SCHED_OTHER, &l_param);
#elif defined(EIF_WINDOWS)
	int l_win_priority;
	switch (a_priority) {
		case EIF_MIN_THR_PRIORITY:
			l_win_priority = THREAD_PRIORITY_LOWEST;
			break;
		case EIF_MAX_THR_PRIORITY:
			l_win_priority = THREAD_PRIORITY_HIGHEST;
			break;
		default:
			if (a_priority <= EIF_BELOW_NORMAL_THR_PRIORITY) {
				l_win_priority = THREAD_PRIORITY_BELOW_NORMAL;
			} else if (a_priority < EIF_ABOVE_NORMAL_THR_PRIORITY) {
				l_win_priority = THREAD_PRIORITY_NORMAL;
			} else {
				l_win_priority = THREAD_PRIORITY_ABOVE_NORMAL;
			}
	}
	SetThreadPriority(a_thread_id, l_win_priority);
#endif
}

/*
 * Routine to be called from the new thread when created.
 */
#ifdef EIF_WINDOWS
static unsigned __stdcall GE_thread_routine(void* arg)
#else
static void* GE_thread_routine(void* arg)
#endif
{
	GE_thread_context* l_thread_context = (GE_thread_context*)arg;
	GE_context l_context = GE_default_context;

	SIGBLOCK;
	GE_unprotected_mutex_lock((EIF_POINTER)l_thread_context->parent_context->children_mutex);
	/* Wait for the parent thread to set the thread id. */
	GE_unprotected_mutex_unlock((EIF_POINTER)l_thread_context->parent_context->children_mutex);
	l_context.thread = l_thread_context;
	GE_thread_init_onces(&l_context);
	GE_init_exception(&l_context);
	GE_register_thread_context(&l_context);
	GE_thread_set_priority(l_thread_context->thread_id, l_thread_context->initial_priority);
	SIGRESUME;
	l_thread_context->routine(l_thread_context->current);
	GE_thread_exit();
#ifdef EIF_WINDOWS
	return 0;
#else
	return NULL;
#endif
}

/*
 * Initialize data to handle threads.
 * To be called at the beginning of the main function
 * on the main thread.
 */
void GE_init_thread(GE_context* a_context)
{
	GE_thread_context* l_thread_context;

	EIF_TSD_CREATE(GE_thread_context_key, "Cannot create GE_thread_context_key");
	l_thread_context = (GE_thread_context*)GE_unprotected_calloc_uncollectable(1, sizeof(GE_thread_context));
	if (l_thread_context) {
		a_context->thread = l_thread_context;
		l_thread_context->thread_id = GE_current_thread();
		l_thread_context->is_alive = 1;
		GE_thread_init_onces(a_context);
		GE_register_thread_context(a_context);
	} else {
		GE_raise_with_message(GE_EX_EXT, "Cannot create thread context");
	}
}

/*
 * Create a new thread with attributes `attr' and execute
 * Eiffel routine `routine' on object `current'.
 */
void GE_thread_create_with_attr(EIF_REFERENCE current, void (*routine)(EIF_REFERENCE), void (*set_terminated)(EIF_REFERENCE,EIF_BOOLEAN), EIF_THR_ATTR_TYPE* attr)
{
	EIF_THR_TYPE l_thread_id;
	GE_thread_context* l_thread_context;
	GE_thread_context* l_current_thread_context;
	EIF_MUTEX_TYPE* l_mutex;
	EIF_COND_TYPE* l_condition_variable;
	int l_raise_error = 0;

	l_thread_context = (GE_thread_context*)GE_unprotected_calloc_uncollectable(1, sizeof(GE_thread_context));
	if (!l_thread_context) {
		l_raise_error = 1;
	} else {
		l_thread_context->current = current;
		l_thread_context->routine = routine;
		l_thread_context->set_terminated = set_terminated;
		l_thread_context->initial_priority = attr->priority;
		l_thread_context->is_alive = 1;
		l_current_thread_context = GE_thread_current_context()->thread;
		l_thread_context->parent_context = l_current_thread_context;
		if (!l_current_thread_context->children_mutex) {
				/* This is the first thread that we create from this thread. */
			l_mutex = (EIF_MUTEX_TYPE*)GE_unprotected_mutex_create(4000);
			if (l_mutex) {
				l_condition_variable = (EIF_COND_TYPE*)GE_unprotected_condition_variable_create();
				if (l_condition_variable) {
					l_current_thread_context->children_mutex = l_mutex;
					l_current_thread_context->children_cond = l_condition_variable;
					l_current_thread_context->n_children = 1;
				} else {
					GE_unprotected_mutex_destroy((EIF_POINTER)l_mutex);
					GE_free(l_thread_context);
					GE_raise_with_message(GE_EX_EXT, "Cannot create thread children condition variable");
				}
			} else {
				GE_free(l_thread_context);
				GE_raise_with_message(GE_EX_EXT, "Cannot create thread children mutex");
			}
		} else {
			SIGBLOCK;
			GE_unprotected_mutex_lock((EIF_POINTER)l_current_thread_context->children_mutex);
			l_current_thread_context->n_children++;
			GE_unprotected_mutex_unlock((EIF_POINTER)l_current_thread_context->children_mutex);
			SIGRESUME;
		}
#ifdef GE_USE_POSIX_THREADS
		{
			pthread_attr_t l_attr;
			int res;

			if (pthread_attr_init(&l_attr) == 0) {
					/* Initialize the stack size if more than the minimum. */
				if (attr->stack_size >= PTHREAD_STACK_MIN) {
					pthread_attr_setstacksize(&l_attr, attr->stack_size);
				}
				if (attr->priority != EIF_DEFAULT_THR_PRIORITY) {
					struct sched_param l_param;
					memset(&l_param, 0, sizeof(struct sched_param));
					l_param.sched_priority = attr->priority;
					pthread_attr_setschedpolicy(&l_attr, SCHED_OTHER);
					pthread_attr_setschedparam(&l_attr, &l_param);
				}
					/* We always create threads detached. */
				pthread_attr_setdetachstate(&l_attr, PTHREAD_CREATE_DETACHED);

				SIGBLOCK;
				GE_unprotected_mutex_lock((EIF_POINTER)l_current_thread_context->children_mutex);
					/* Use the mutex even it case of success to force the thread being created to wait for its thread id to be set. */
				if (pthread_create(&l_thread_id, &l_attr, GE_thread_routine, l_thread_context) == 0) {
					l_thread_context->thread_id = l_thread_id;
					l_current_thread_context->last_thread_id = l_thread_id;
					pthread_attr_destroy(&l_attr);
				} else {
					pthread_attr_destroy(&l_attr);
					GE_free(l_thread_context);
					l_current_thread_context->n_children--;
					l_raise_error = 1;
				}
				GE_unprotected_mutex_unlock((EIF_POINTER)l_current_thread_context->children_mutex);
				SIGRESUME;
			}
		}
#elif defined EIF_WINDOWS
		SIGBLOCK;
		GE_unprotected_mutex_lock((EIF_POINTER)l_current_thread_context->children_mutex);
			/* Use the mutex even it case of success to force the thread being created to wait for its thread id to be set. */
		l_thread_id = (EIF_THR_TYPE)_beginthreadex(NULL, (unsigned int)attr->stack_size, GE_thread_routine, l_thread_context, 0, NULL);
		if (l_thread_id == 0) {
			GE_free(l_thread_context);
			l_current_thread_context->n_children--;
			l_raise_error = 1;
		} else {
			l_thread_context->thread_id = l_thread_id;
			l_current_thread_context->last_thread_id = l_thread_id;
		}
		GE_unprotected_mutex_unlock((EIF_POINTER)l_current_thread_context->children_mutex);
		SIGRESUME;
#else
		GE_free(l_thread_context);
		SIGBLOCK;
		GE_unprotected_mutex_lock((EIF_POINTER)l_current_thread_context->children_mutex);
		l_current_thread_context->n_children--;
		GE_unprotected_mutex_unlock((EIF_POINTER)l_current_thread_context->children_mutex);
		SIGRESUME;
		l_raise_error = 1;
#endif
	}
	if (l_raise_error) {
		GE_raise_with_message(GE_EX_EXT, "Cannot create thread");
	}
}

/*
 * Execution context of current thread.
 */
GE_context* GE_thread_current_context(void)
{
	GE_context* volatile l_context;

	EIF_TSD_GET(GE_context*, GE_thread_context_key, l_context, "Cannot get execution context for current thread");
	return l_context;
}

/*
 * Thread ID of current thread.
 */
EIF_POINTER GE_thread_id(void)
{
	GE_context* volatile l_context;

	EIF_TSD_GET(GE_context*, GE_thread_context_key, l_context, "Cannot get execution context for current thread");
	return (EIF_POINTER)(l_context->thread->thread_id);
}

/*
 * Thread ID of last thread created from current thread.
 */
EIF_POINTER GE_last_thread_created(void)
{
	GE_context* volatile l_context;

	EIF_TSD_GET(GE_context*, GE_thread_context_key, l_context, "Cannot get execution context for current thread");
	return (EIF_POINTER)(l_context->thread->last_thread_id);
}

#ifdef EIF_WINDOWS
/*
 * Support for Windows GUI that requires that all GUI operations are performed in the same thread.
 * Allocate new structure of the given size `a_size', assign it to `wel_per_thread_data'.
 * Return newly allocated memory block. It will be freed automatically on thread termination.
 */
void* GE_thread_create_wel_per_thread_data(size_t a_size)
{
	void* l_result;
	GE_context* volatile l_context;

	EIF_TSD_GET(GE_context*, GE_thread_context_key, l_context, "Cannot get execution context for current thread");
	l_result = (void*)GE_calloc_uncollectable(1, a_size);
	l_context->wel_per_thread_data = l_result;
	return l_result;
}
#endif

/*
 * Waits until a thread sets `terminated' from `obj' to True,
 * which means it is terminated. The calling thread must be the
 * direct parent of the thread, or the function might loop indefinitely.
 */
void GE_thread_wait(EIF_REFERENCE obj, EIF_BOOLEAN (*get_terminated)(EIF_REFERENCE))
{
	GE_context* volatile l_context;
	GE_thread_context* l_thread_context;

	EIF_TSD_GET(GE_context*, GE_thread_context_key, l_context, "Cannot get execution context for current thread");
	l_thread_context = l_context->thread;
		/* If no thread has been launched, the mutex isn't initialized. */
	if (l_thread_context->children_mutex) {
		SIGBLOCK;
		GE_unprotected_mutex_lock((EIF_POINTER)l_thread_context->children_mutex);
		while (get_terminated(obj) == EIF_FALSE) {
			GE_unprotected_condition_variable_wait((EIF_POINTER)l_thread_context->children_cond, (EIF_POINTER)l_thread_context->children_mutex);
		}
		GE_unprotected_mutex_unlock((EIF_POINTER)l_thread_context->children_mutex);
		SIGRESUME;
	}
}

/*
 * Waits until a thread sets `terminated' from `obj' to True,
 * which means it is terminated, or reaching `a_timeout_ms'.
 * The calling thread must be the direct parent of the thread,
 * or the function might loop indefinitely.
 */
EIF_BOOLEAN GE_thread_wait_with_timeout(EIF_REFERENCE obj, EIF_BOOLEAN (*get_terminated)(EIF_REFERENCE), EIF_NATURAL_64 a_timeout_ms)
{
	GE_context* volatile l_context;
	GE_thread_context* l_thread_context;
	int l_result = GE_THREAD_OK;

	EIF_TSD_GET(GE_context*, GE_thread_context_key, l_context, "Cannot get execution context for current thread");
	l_thread_context = l_context->thread;
		/* If no thread has been launched, the mutex isn't initialized. */
	if (l_thread_context->children_mutex) {
		SIGBLOCK;
		GE_unprotected_mutex_lock((EIF_POINTER)l_thread_context->children_mutex);
		while ((get_terminated(obj) == EIF_FALSE) && (l_result == GE_THREAD_OK)) {
			l_result = GE_unprotected_condition_variable_wait_with_timeout((EIF_POINTER)l_thread_context->children_cond, (EIF_POINTER)l_thread_context->children_mutex, a_timeout_ms);
		}
		GE_unprotected_mutex_unlock((EIF_POINTER)l_thread_context->children_mutex);
		SIGRESUME;
	}
	return (l_result == GE_THREAD_TIMEDOUT ? EIF_FALSE : EIF_TRUE);
}

/*
 * Yields execution to other threads.
 */
void GE_thread_yield(void)
{
#ifdef GE_USE_POSIX_THREADS
#ifdef _POSIX_PRIORITY_SCHEDULING
	sched_yield();
#else
	usleep(1);
#endif
#elif defined EIF_WINDOWS
	if (SwitchToThread()) {
			/* We are able to give our timeslice to another thread of equal priority running on the same processor. */
	} else {
			/* There are no waiting threads on the current processor with the same thread priority so Sleep(0) yields to any available threads on any processor.
			 * However the current thread is still marked as runnable so if there are no threads of the same thread priority in a waiting state then it will return
			 * immediately and not relinquish our timeslice, which Sleep(1) will do but unfortunately the timer resolution may be up to 15ms on multicore systems before returning. */
		Sleep(0);
	}
#endif
}

/*
 * The calling thread waits for all other children threads to terminate.
 */
void GE_thread_join_all(void)
{
	GE_context* volatile l_context;
	GE_thread_context* l_thread_context;

	EIF_TSD_GET(GE_context*, GE_thread_context_key, l_context, "Cannot get execution context for current thread");
	l_thread_context = l_context->thread;
		/* If no thread has been launched, the mutex isn't initialized. */
	if (l_thread_context->children_mutex) {
		SIGBLOCK;
		GE_unprotected_mutex_lock((EIF_POINTER)l_thread_context->children_mutex);
		while (l_thread_context->n_children != 0) {
			GE_unprotected_condition_variable_wait((EIF_POINTER)l_thread_context->children_cond, (EIF_POINTER)l_thread_context->children_mutex);
		}
		GE_unprotected_mutex_unlock((EIF_POINTER)l_thread_context->children_mutex);
		SIGRESUME;
	}
}

/*
 * Function called to terminate a thread launched by Eiffel with `GE_thread_create_with_attr'.
 * This function must be called from the thread itself (not the parent).
 */
void GE_thread_exit(void)
{
	GE_context* volatile l_context;
	GE_thread_context* l_thread_context;
	GE_thread_context* l_parent_thread_context;
	EIF_THR_TYPE l_thread_id;
	int l_free_thread_context;

	EIF_TSD_GET(GE_context*, GE_thread_context_key, l_context, "Cannot get execution context for current thread");
	l_thread_context = l_context->thread;
	if (!l_thread_context->thread_exiting) {
		l_thread_context->thread_exiting = 1;
		if (l_thread_context->current) {
			if (l_thread_context->set_terminated) {
				l_thread_context->set_terminated(l_thread_context->current, EIF_TRUE);
			}
			l_thread_context->current = EIF_VOID;
		}
		l_parent_thread_context = l_thread_context->parent_context;
		if (l_parent_thread_context) {
			SIGBLOCK;
			GE_unprotected_mutex_lock((EIF_POINTER)l_parent_thread_context->children_mutex);
			l_parent_thread_context->n_children--;
			l_free_thread_context = (!l_parent_thread_context->is_alive) && (l_parent_thread_context->n_children == 0);
			GE_unprotected_condition_variable_broadcast((EIF_POINTER)l_parent_thread_context->children_cond);
			GE_unprotected_mutex_unlock((EIF_POINTER)l_parent_thread_context->children_mutex);
			SIGRESUME;
			if (l_free_thread_context) {
				GE_unprotected_mutex_destroy((EIF_POINTER)l_parent_thread_context->children_mutex);
				GE_unprotected_condition_variable_destroy((EIF_POINTER)l_parent_thread_context->children_cond);
				GE_free(l_parent_thread_context);
				l_thread_context->parent_context = NULL;
			}
		}
		l_thread_id = l_thread_context->thread_id;
		if (l_thread_context->children_mutex) {
			SIGBLOCK;
			GE_unprotected_mutex_lock((EIF_POINTER)l_thread_context->children_mutex);
			l_free_thread_context = (l_thread_context->n_children == 0);
			if (!l_free_thread_context) {
					/* We cannot destroy ourself because we still have some running children
					 * threads, we therefore need to mark ourself dead. */
				l_thread_context->is_alive = 0;
			}
			GE_unprotected_mutex_unlock((EIF_POINTER)l_thread_context->children_mutex);
			SIGRESUME;
		} else {
			l_free_thread_context = 1;
		}
		if (l_free_thread_context) {
			if (l_thread_context->children_mutex) {
				GE_unprotected_mutex_destroy((EIF_POINTER)l_thread_context->children_mutex);
				GE_unprotected_condition_variable_destroy((EIF_POINTER)l_thread_context->children_cond);
			}
			GE_free(l_thread_context);
		}
#ifdef EIF_WINDOWS
		if (!CloseHandle(l_thread_id)) {
			GE_raise_with_message(GE_EX_EXT, "Cannot close thread");
		}
#endif
		EIF_TSD_SET(GE_thread_context_key, 0, "Cannot remove thread context to TSD.");
		GE_free_onces(l_context->process_onces);
		GE_free_onces(l_context->thread_onces);
		GE_free_exception(l_context);
		if (l_context->wel_per_thread_data) {
			GE_free(l_context->wel_per_thread_data);
			l_context->wel_per_thread_data = 0;
		}
#ifdef GE_USE_POSIX_THREADS
		pthread_exit(NULL);
#elif defined EIF_WINDOWS
		_endthreadex(0);
#endif
	}
}

/*
 * Default thread priority level.
 */
EIF_INTEGER GE_thread_default_priority(void)
{
	return EIF_DEFAULT_THR_PRIORITY;
}

/*
 * Minimum thread priority level.
 */
EIF_INTEGER GE_thread_min_priority(void)
{
	return EIF_MIN_THR_PRIORITY;
}

/*
 * Maximum thread priority level.
 */
EIF_INTEGER GE_thread_max_priority(void)
{
	return EIF_MAX_THR_PRIORITY;
}

#ifdef __cplusplus
}
#endif

#endif
#endif
