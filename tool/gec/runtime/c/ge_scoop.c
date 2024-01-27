/*
	description:

		"C functions used to implement SCOOP facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2023-2024, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef GE_SCOOP_C
#define GE_SCOOP_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifdef GE_USE_SCOOP

#ifndef GE_SCOOP_H
#include "ge_scoop.h"
#endif
#ifndef GE_GC_H
#include "ge_gc.h"
#endif
#ifndef GE_THREAD_H
#include "ge_thread.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif


/* 
 * Number SCOOP sessions not fully executed yet.
 */
static uint32_t GE_unprotected_scoop_sessions_count;

/* 
 * Mutex to access `GE_scoop_sessions_count'.
 */
static EIF_MUTEX_TYPE* GE_scoop_sessions_count_mutex;

/* 
 * Number SCOOP sessions not fully executed yet.
 */
static uint32_t GE_scoop_sessions_count()
{
	uint32_t l_result;

	GE_mutex_lock((EIF_POINTER)GE_scoop_sessions_count_mutex);
	l_result = GE_unprotected_scoop_sessions_count;
	GE_mutex_unlock((EIF_POINTER)GE_scoop_sessions_count_mutex);
	return l_result;
}

/* 
 * Increment number SCOOP sessions.
 */
uint32_t GE_increment_scoop_sessions_count()
{
	uint32_t l_result;

	GE_mutex_lock((EIF_POINTER)GE_scoop_sessions_count_mutex);
	GE_unprotected_scoop_sessions_count++;
	l_result = GE_unprotected_scoop_sessions_count;
	GE_mutex_unlock((EIF_POINTER)GE_scoop_sessions_count_mutex);
	return l_result;
}

/* 
 * Decrement number SCOOP sessions.
 */
uint32_t GE_decrement_scoop_sessions_count()
{
	uint32_t l_result;
	GE_scoop_processor* l_processor;

	GE_mutex_lock((EIF_POINTER)GE_scoop_sessions_count_mutex);
	GE_unprotected_scoop_sessions_count--;
	l_result = GE_unprotected_scoop_sessions_count;
	if (l_result <= 0) {
			/*
				No more SCOOP session to be executed.
				We can stop the process. Do that by
				exiting the SCOOP execution loop of
				the SCOOP processor of the main thread.
			*/
		l_processor = GE_main_context->scoop_processor;
		GE_mutex_lock((EIF_POINTER)l_processor->mutex);
		GE_condition_variable_broadcast((EIF_POINTER)l_processor->condition_variable);
		GE_mutex_unlock((EIF_POINTER)l_processor->mutex);
	}
	GE_mutex_unlock((EIF_POINTER)GE_scoop_sessions_count_mutex);
	return l_result;
}

/*
 * New of SCOOP processor.
 */
GE_scoop_processor* GE_new_scoop_processor(GE_context* a_context)
{
	GE_scoop_processor* l_processor;

	l_processor = (GE_scoop_processor*)GE_calloc_uncollectable(1, sizeof(GE_scoop_processor));
	l_processor->context = a_context;
	l_processor->mutex = (EIF_MUTEX_TYPE*)GE_mutex_create();
	l_processor->condition_variable = (EIF_COND_TYPE*)GE_condition_variable_create();
	l_processor->sync_mutex = (EIF_MUTEX_TYPE*)GE_mutex_create();
	l_processor->sync_condition_variable = (EIF_COND_TYPE*)GE_condition_variable_create();
	l_processor->is_impersonation_allowed = '\1';
	return l_processor;
}

/* 
 * New SCOOP session to register calls to be executed by `a_callee'.
 */
static GE_scoop_session* GE_new_scoop_session(GE_scoop_processor* a_callee)
{
	GE_scoop_session* l_session;

	l_session = (GE_scoop_session*)GE_calloc_uncollectable(1, sizeof(GE_scoop_session));
	l_session->callee = a_callee;
	l_session->mutex = (EIF_MUTEX_TYPE*)GE_mutex_create();
	l_session->condition_variable = (EIF_COND_TYPE*)GE_condition_variable_create();
	GE_increment_scoop_sessions_count();
	return l_session;
}

/* 
 * Create (or reuse an existing) SCOOP session to register calls from
 * `a_caller' to be executed by `a_callee'.
 * Return NULL if `a_caller' and `a_callee' are the same SCOOP processor.
 * To be executed by the processor of `a_caller' (or by other processors
 * which are synchronized with `a_caller').
 */
GE_scoop_session* GE_scoop_session_open(GE_scoop_processor* a_caller, GE_scoop_processor* a_callee)
{
	GE_scoop_session* l_session;
	GE_scoop_session* l_new_session;
	GE_scoop_session* l_last_session;

	if (a_callee == a_caller) {
		return 0;
	}
	l_session = a_caller->first_locked_session;
	while (l_session) {
		if (l_session->callee == a_callee) {
			GE_mutex_lock((EIF_POINTER)l_session->mutex);
			l_session->is_open++;
			GE_mutex_unlock((EIF_POINTER)l_session->mutex);
			return l_session;
		}
		l_session = l_session->next_locked_session;
	}
	l_new_session = GE_new_scoop_session(a_callee);
	l_new_session->is_open = 1;
	l_new_session->next_locked_session = a_caller->first_locked_session;
	a_caller->first_locked_session = l_new_session;
	return l_new_session;
}

/* 
 * Exit from SCOOP session `a_session' at the end of a feature with arguments of separate type
 * or at the end of an inline separate instruction. Note that some enclosing feature or inline
 * separate instruction might still be using this session to register subsequent calls.
 * To be executed from the processor of `a_caller' (or by other processors
 * which are synchronized with `a_caller').
 */
void GE_scoop_session_close(GE_scoop_processor* a_caller, GE_scoop_session* a_session)
{
	GE_scoop_session* l_locked_session;
	char l_to_be_freed = 0;

	GE_mutex_lock((EIF_POINTER)a_session->mutex);
	if (a_session->is_open) {
		a_session->is_open--;
		if (!a_session->is_open) {
			l_locked_session = a_caller->first_locked_session;
			if (a_session == l_locked_session) {
				a_caller->first_locked_session = a_session->next_locked_session;
			} else while (l_locked_session) {
				if (l_locked_session->next_locked_session == a_session) {
					l_locked_session->next_locked_session = a_session->next_locked_session;
					break;
				}
				l_locked_session = l_locked_session->next_locked_session;
			}
			a_session->next_locked_session = 0;
			if (!a_session->is_submitted) {
				l_to_be_freed = '\1';
			} else {
				GE_condition_variable_broadcast((EIF_POINTER)a_session->condition_variable);
			}
		}
	}
	GE_mutex_unlock((EIF_POINTER)a_session->mutex);
	if (l_to_be_freed) {
		GE_free_scoop_session(a_session);
	}
}

/* 
 * Add SCOOP session `a_session' from its callee processor.
 */
static void GE_add_scoop_session(GE_scoop_session* a_session)
{
	GE_scoop_processor* l_processor;
	GE_scoop_session* l_last_session;

	l_processor = a_session->callee;
	GE_mutex_lock((EIF_POINTER)l_processor->mutex);
	l_last_session = l_processor->last_session;
	if (l_last_session) {
		l_last_session->next = a_session;
		a_session->previous = l_last_session;
	} else {
		l_processor->first_session = a_session;
	}
	l_processor->last_session = a_session;
	GE_condition_variable_broadcast((EIF_POINTER)l_processor->condition_variable);
	GE_mutex_unlock((EIF_POINTER)l_processor->mutex);
}

/* 
 * Remove SCOOP session `a_session' from its callee processor.
 */
static void GE_remove_scoop_session(GE_scoop_session* a_session)
{
	GE_scoop_processor* l_processor;
	GE_scoop_session* l_other_session;

	l_processor = a_session->callee;
	GE_mutex_lock((EIF_POINTER)l_processor->mutex);
	l_other_session = a_session->previous;
	if (l_other_session) {
		l_other_session->next = a_session->next;
	} else {
		l_processor->first_session = a_session->next;
	}
	l_other_session = a_session->next;
	if (l_other_session) {
		l_other_session->previous = a_session->previous;
	} else {
		l_processor->last_session = a_session->previous;
	}
	GE_mutex_unlock((EIF_POINTER)l_processor->mutex);
	GE_free_scoop_session(a_session);
}

/* 
 * New SCOOP call.
 */
GE_scoop_call* GE_new_scoop_call(GE_scoop_processor* a_caller, char a_is_synchronous, void (*a_execute)(GE_context*, GE_scoop_session*, GE_scoop_call*), size_t a_size)
{
	GE_scoop_call* l_call;

	l_call = (GE_scoop_call*)GE_calloc_uncollectable(1, a_size);
	l_call->caller = a_caller;
	l_call->is_synchronous = a_is_synchronous;
	l_call->execute = a_execute;
	return l_call;
}

/* 
 * Add SCOOP call `a_call' to `a_session'.
 */
void GE_scoop_session_add_call(GE_scoop_session* a_session, GE_scoop_call* a_call)
{
	GE_scoop_call* l_last_call;
	GE_scoop_processor* l_caller = a_call->caller;
	char l_is_synchronous = a_call->is_synchronous;

	if (l_is_synchronous) {
		GE_mutex_lock((EIF_POINTER)l_caller->sync_mutex);
	}
	GE_mutex_lock((EIF_POINTER)a_session->mutex);
	l_last_call = a_session->last_call;
	a_session->last_call = a_call;
	if (l_last_call) {
		l_last_call->next = a_call;
	} else {
		a_session->first_call = a_call;
	}
	if (!a_session->is_submitted) {
		/* First call added to `a_session'. */
		a_session->is_submitted = '\1';
		GE_add_scoop_session(a_session);
	} else {
		GE_condition_variable_broadcast((EIF_POINTER)a_session->condition_variable);
	}
	GE_mutex_unlock((EIF_POINTER)a_session->mutex); 
	if (l_is_synchronous) {
		GE_condition_variable_wait((EIF_POINTER)l_caller->sync_condition_variable, (EIF_POINTER)l_caller->sync_mutex);
		GE_mutex_unlock((EIF_POINTER)l_caller->sync_mutex);
	}
}

/*
 * Add a synchronization call between `a_caller' and the callee of `a_session' if not synchronized yet.
 */
void GE_scoop_session_add_sync_call(GE_scoop_processor* a_caller, GE_scoop_session* a_session)
{
	GE_scoop_call* l_call;

	if (!GE_scoop_session_is_synchronized(a_session)) {
		l_call = GE_new_scoop_call(a_caller, '\1', 0, sizeof(GE_scoop_call));
		GE_scoop_session_add_call(a_session, l_call);
	}
}

/*
 * Let the thread of `a_caller' execute the calls of `a_callee' and vice-versa.
 */
void GE_scoop_processor_impersonate(GE_scoop_processor* a_caller, GE_scoop_processor* a_callee)
{
	GE_context* l_callee_context;
	GE_context* l_caller_context;
	GE_context l_temp_context;

	l_caller_context = a_caller->context;
	l_callee_context = a_callee->context;
	l_temp_context = *l_caller_context;
	*l_caller_context = *l_callee_context;
	*l_callee_context = l_temp_context;
	l_callee_context->thread = l_caller_context->thread;
	l_callee_context->scoop_processor->context = l_callee_context;
	l_caller_context->thread = l_temp_context.thread;
	l_caller_context->scoop_processor->context = l_caller_context;
}

/*
 * Does the callee processor of `a_session' allow the thread of its caller
 * to execute separate calls on its behalf?
 * Note that impersonation is forced when `a_session' is synchronized
 * (which means that we're calling back the callee in a synchronous call).
 */
char GE_scoop_session_is_impersonation_allowed(GE_scoop_session* a_session)
{
	char l_result;
	GE_scoop_processor* l_processor;

	if (GE_scoop_session_is_synchronized(a_session)) {
		return '\1';
	}
	l_processor = a_session->callee;
	GE_mutex_lock((EIF_POINTER)l_processor->mutex);
	l_result = l_processor->is_impersonation_allowed;
	GE_mutex_unlock((EIF_POINTER)l_processor->mutex);
	return l_result;
}

/*
 * Indicate whether `a_processor' allow or not the thread of callers to execute separate calls on its behalf.
 */
void GE_scoop_processor_set_impersonation_allowed(GE_scoop_processor* a_processor, char a_value)
{
	GE_mutex_lock((EIF_POINTER)a_processor->mutex);
	a_processor->is_impersonation_allowed = a_value;
	GE_mutex_unlock((EIF_POINTER)a_processor->mutex);
}

/*
 * Is `a_callee' locked (directly or indirectly) by `a_caller'?
 */
char GE_scoop_processor_has_lock_on(GE_scoop_processor* a_caller, GE_scoop_processor* a_callee)
{
	GE_scoop_session* l_session;

	if (a_caller == a_callee) {
		return '\1';
	}
	l_session = a_caller->first_locked_session;
	while (l_session) {
		if (l_session->callee == a_callee) {
			return '\1';
		}
		l_session = l_session->next_locked_session;
	}
	return 0;
}

/*
 * Execute `a_call'.
 */
static void GE_scoop_call_execute(GE_context* a_context, GE_scoop_session* a_session, GE_scoop_call* a_call)
{
	GE_scoop_processor* l_caller;
	char l_is_synchronous = a_call->is_synchronous;
	GE_rescue r;
	uint32_t tr = a_context->in_rescue;

	if (a_call->execute) {
		if (l_is_synchronous) {
			GE_scoop_processor_pass_locks(a_call->caller, a_session->callee);
		}
		if (GE_setjmp(r.jb) != 0) {
			a_context->in_rescue = tr + 1;
			if (l_is_synchronous) {
				l_caller = a_call->caller;
				GE_scoop_processor_release_locks(l_caller, a_session->callee);
				GE_mutex_lock((EIF_POINTER)l_caller->sync_mutex);
				GE_condition_variable_broadcast((EIF_POINTER)l_caller->sync_condition_variable);
				GE_mutex_unlock((EIF_POINTER)l_caller->sync_mutex);
			}
			GE_jump_to_last_rescue(a_context);
		}
		r.previous = a_context->last_rescue;
		a_context->last_rescue = &r;
		a_call->execute(a_context, a_session, a_call);
		a_context->last_rescue = r.previous;
		if (l_is_synchronous) {
			GE_scoop_processor_release_locks(a_call->caller, a_session->callee);
		}
	}
	if (l_is_synchronous) {
		l_caller = a_call->caller;
		GE_mutex_lock((EIF_POINTER)l_caller->sync_mutex);
		GE_condition_variable_broadcast((EIF_POINTER)l_caller->sync_condition_variable);
		GE_mutex_unlock((EIF_POINTER)l_caller->sync_mutex);
	}
}

/*
 * Execute `a_session'.
 */
static void GE_scoop_session_execute(GE_context* a_context, GE_scoop_session* a_session)
{
	GE_scoop_call* l_call;
	GE_scoop_call* l_next_call;

	while (1) {
		GE_mutex_lock((EIF_POINTER)a_session->mutex);
		l_call = a_session->first_call;
		if (l_call) {
			GE_mutex_unlock((EIF_POINTER)a_session->mutex);
			GE_scoop_call_execute(a_context, a_session, l_call);
			GE_mutex_lock((EIF_POINTER)a_session->mutex);
			l_next_call = l_call->next;
			a_session->first_call = l_next_call;
			if (!l_next_call) {
				a_session->last_call = l_next_call;
			}
			GE_mutex_unlock((EIF_POINTER)a_session->mutex);
			GE_free_scoop_call(l_call);
		} else if (a_session->is_open) {
				/* The session is not finished. New calls may still be registered. */
			GE_condition_variable_wait((EIF_POINTER)a_session->condition_variable, (EIF_POINTER)a_session->mutex);
			GE_mutex_unlock((EIF_POINTER)a_session->mutex);
		} else {
			GE_mutex_unlock((EIF_POINTER)a_session->mutex);
			break;
		}
	}
}

/*
 * Perform lock passing from `a_caller' to `a_callee' in case of a synchronous call.
 */
void GE_scoop_processor_pass_locks(GE_scoop_processor* a_caller, GE_scoop_processor* a_callee)
{
	GE_scoop_session* l_session;
	GE_scoop_session* l_caller_session = 0;

	if (a_callee != a_caller) {
		a_callee->first_locked_session = a_caller->first_locked_session;
		a_caller->first_locked_session = 0;
		l_session = a_callee->first_locked_session;
		while (l_session) {
			GE_mutex_lock((EIF_POINTER)l_session->mutex);
			l_session->is_open++;
			GE_mutex_unlock((EIF_POINTER)l_session->mutex);
			if (l_session->callee == a_caller) {
				l_caller_session = l_session;
			} else if (l_session->is_synchronized) {
				l_session->is_synchronized++;
			}
			l_session = l_session->next_locked_session;
		}
		if (!l_caller_session) {
			l_caller_session = GE_scoop_session_open(a_callee, a_caller);
		}
		l_caller_session->is_synchronized++;
	}
}

/*
 * Release locks which were passed from `a_caller' to `a_callee' in case of a synchronous call.
 */
void GE_scoop_processor_release_locks(GE_scoop_processor* a_caller, GE_scoop_processor* a_callee)
{
	GE_scoop_session* l_session;
	GE_scoop_session* l_next_session;

	if (a_callee != a_caller) {
		l_session = a_callee->first_locked_session;
		while (l_session) {
			if (l_session->is_synchronized) {
				l_session->is_synchronized--;
			}
			l_next_session = l_session->next_locked_session;
			GE_scoop_session_close(a_callee, l_session);
			l_session = l_next_session;
		}
		a_caller->first_locked_session = a_callee->first_locked_session;
		a_callee->first_locked_session = 0;
	}
}

/*
 * Execute the main loop of the SCOOP processor `a_context->scoop_processor'.
 */
void GE_scoop_processor_run(GE_context* a_context)
{
	GE_scoop_session* l_session;
	EIF_POINTER l_mutex = (EIF_POINTER)a_context->scoop_processor->mutex;
	EIF_POINTER l_condition_variable = (EIF_POINTER)a_context->scoop_processor->condition_variable;

	while (a_context->scoop_processor) {
		GE_mutex_lock(l_mutex);
		l_session = a_context->scoop_processor->first_session;
		if (l_session) {
			GE_mutex_unlock(l_mutex);
			GE_scoop_session_execute(a_context, l_session);
			GE_remove_scoop_session(l_session);
		} else if (GE_scoop_sessions_count() <= 0) {
			GE_mutex_unlock(l_mutex);
			break;
		} else {
			GE_condition_variable_wait(l_condition_variable, l_mutex);
			GE_mutex_unlock(l_mutex);
		}
	}
}

/* 
 * Initialization of SCOOP.
 */
void GE_init_scoop()
{
	GE_unprotected_scoop_sessions_count = 0;
	GE_scoop_sessions_count_mutex = (EIF_MUTEX_TYPE*)GE_mutex_create();
}

/*
 * Free memory allocated by `a_call'.
 */
void GE_free_scoop_call(GE_scoop_call* a_call)
{
	GE_free(a_call);
}

/*
 * Free memory allocated by `a_session'.
 */
void GE_free_scoop_session(GE_scoop_session* a_session)
{
	GE_mutex_destroy((EIF_POINTER)a_session->mutex);
	GE_condition_variable_destroy((EIF_POINTER)a_session->condition_variable);
	GE_free(a_session);
	GE_decrement_scoop_sessions_count();
}

/*
 * Free memory allocated by `a_processor'.
 */
void GE_free_scoop_processor(GE_scoop_processor* a_processor)
{
	GE_mutex_destroy((EIF_POINTER)a_processor->mutex);
	GE_condition_variable_destroy((EIF_POINTER)a_processor->condition_variable);
	GE_mutex_destroy((EIF_POINTER)a_processor->sync_mutex);
	GE_condition_variable_destroy((EIF_POINTER)a_processor->sync_condition_variable);
	GE_free(a_processor);
}

#ifdef __cplusplus
}
#endif

#endif
#endif
