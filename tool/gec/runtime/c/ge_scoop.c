/*
	description:

		"C functions used to implement SCOOP facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2023, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
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
 * Number SCOOP sessions not executed yet.
 */
static uint32_t GE_unprotected_scoop_sessions_count;

/* 
 * Mutex to access `GE_scoop_sessions_count'.
 */
static EIF_MUTEX_TYPE* GE_scoop_sessions_count_mutex;

/*
 * Linked list of all scoop processors.
 */
static GE_scoop_processor* GE_all_scoop_processors;

/* 
 * Number SCOOP sessions not executed yet.
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
				We can stop all SCOOP processors.
			*/
		l_processor = GE_all_scoop_processors;
		while (l_processor) {
			GE_mutex_lock((EIF_POINTER)l_processor->mutex);
			GE_condition_variable_broadcast((EIF_POINTER)l_processor->condition_variable);
			GE_mutex_unlock((EIF_POINTER)l_processor->mutex);
			l_processor = l_processor->next;
		}
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
	GE_mutex_lock((EIF_POINTER)GE_scoop_sessions_count_mutex);
	l_processor->next = GE_all_scoop_processors;
	GE_all_scoop_processors = l_processor;
	GE_mutex_unlock((EIF_POINTER)GE_scoop_sessions_count_mutex);
	return l_processor;
}

/* 
 * New SCOOP session to register calls from `a_caller' to be executed by `a_callee'.
 */
static GE_scoop_session* GE_new_scoop_session(GE_scoop_processor* a_callee, GE_scoop_processor* a_caller)
{
	GE_scoop_session* l_session;

	l_session = (GE_scoop_session*)GE_calloc_uncollectable(1, sizeof(GE_scoop_session));
	l_session->callee = a_callee;
	l_session->caller = a_caller;
	l_session->nested_level++;
	l_session->mutex = (EIF_MUTEX_TYPE*)GE_mutex_create();
	l_session->condition_variable = (EIF_COND_TYPE*)GE_condition_variable_create();
	return l_session;
}

/* 
 * Get SCOOP session to register calls from `a_caller' to be executed by `a_callee'.
 * Return NULL if `a_caller' and `a_callee' are the same SCOOP processor.
 */
GE_scoop_session* GE_get_scoop_session(GE_scoop_processor* a_callee, GE_scoop_processor* a_caller)
{
	GE_scoop_session* l_session;
	GE_scoop_session* l_new_session = 0;
	GE_scoop_session* l_last_session;

	if (a_callee != a_caller) {
		GE_mutex_lock((EIF_POINTER)a_callee->mutex);
		l_session = a_callee->last_session;
		while (l_session) {
			if (l_session->caller == a_caller) {
				GE_mutex_lock((EIF_POINTER)l_session->mutex);
				if (l_session->nested_level > 0) {
					l_session->nested_level++;
					GE_mutex_unlock((EIF_POINTER)l_session->mutex);
					GE_mutex_unlock((EIF_POINTER)a_callee->mutex);
					return l_session;
				} else {
					GE_mutex_unlock((EIF_POINTER)l_session->mutex);
					l_new_session = GE_new_scoop_session(a_callee, a_caller);
					l_session->next_same_caller = l_new_session;
					l_new_session->previous_same_caller = l_session;
					l_session = 0;
				}
			} else {
				l_session = l_session->previous;
			}
		}
		if (!l_new_session) {
			l_new_session = GE_new_scoop_session(a_callee, a_caller);
		}
		l_last_session = a_callee->last_session;
		if (l_last_session) {
			l_last_session->next = l_new_session;
			l_new_session->previous = l_last_session;
		} else {
			a_callee->first_session = l_new_session;
		}
		a_callee->last_session = l_new_session;
		GE_condition_variable_broadcast((EIF_POINTER)a_callee->condition_variable);
		GE_mutex_unlock((EIF_POINTER)a_callee->mutex);
		GE_increment_scoop_sessions_count();
		return l_new_session;
	} else {
		return 0;
	}
}

/* 
 * Exit from SCOOP session `a_session' at the end of a feature with arguments of separate type
 * or at the end of an inline separate instruction. Note that some enclosing feature or inline
 * separate instruction might still be using this session to register subsequent calls.
 */
void GE_exit_scoop_session(GE_scoop_session* a_session)
{
	GE_mutex_lock((EIF_POINTER)a_session->mutex);
	a_session->nested_level--;
	if (a_session->nested_level <= 0) {
		GE_condition_variable_broadcast((EIF_POINTER)a_session->condition_variable);
	}
	GE_mutex_unlock((EIF_POINTER)a_session->mutex);
}

/* 
 * Remove SCOOP session `a_session' from its processor.
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
	l_other_session = a_session->previous_same_caller;
	if (l_other_session) {
		l_other_session->next_same_caller = a_session->next_same_caller;
	}
	l_other_session = a_session->next_same_caller;
	if (l_other_session) {
		l_other_session->previous_same_caller = a_session->previous_same_caller;
	}
	GE_mutex_unlock((EIF_POINTER)l_processor->mutex);
}

/* 
 * New SCOOP call.
 */
GE_scoop_call* GE_new_scoop_call(size_t a_size)
{
	GE_scoop_call* l_call;

	l_call = (GE_scoop_call*)GE_calloc_uncollectable(1, a_size);
	return l_call;
}

/* 
 * Add SCOOP call `a_call' to `a_session'.
 */
void GE_add_scoop_call(GE_scoop_session* a_session, GE_scoop_call* a_call)
{
	GE_scoop_call* l_last_call;

	GE_mutex_lock((EIF_POINTER)a_session->mutex);
	l_last_call = a_session->last_call;
	a_session->last_call = a_call;
	if (l_last_call) {
		l_last_call->next = a_call;
	} else {
		a_session->first_call = a_call;
	}
	GE_condition_variable_broadcast((EIF_POINTER)a_session->condition_variable);
	GE_mutex_unlock((EIF_POINTER)a_session->mutex);
}

/*
 * Function to synchronize with the caller processor.
 */
static void GE_synchronize_scoop_call(GE_context* ac, GE_scoop_call* sc)
{
	GE_scoop_processor* l_processor = *(GE_scoop_processor**)(((char*)(sc))+sizeof(GE_scoop_call));
	GE_mutex_lock((EIF_POINTER)l_processor->sync_mutex);
	GE_condition_variable_broadcast((EIF_POINTER)l_processor->sync_condition_variable);
	GE_mutex_unlock((EIF_POINTER)l_processor->sync_mutex);
}

/* 
 * Add SCOOP synchronization call to `a_session'.
 */
void GE_add_scoop_sync_call(GE_scoop_session* a_session)
{
	GE_scoop_call* l_call;
	GE_scoop_processor* l_caller;

	l_call = GE_new_scoop_call(sizeof(GE_scoop_call) + sizeof(GE_scoop_processor*));
	l_call->execute = (void (*)(GE_context*, GE_scoop_call*))&GE_synchronize_scoop_call;
	l_caller = a_session->caller;
	*(GE_scoop_processor**)(((char*)(l_call))+sizeof(GE_scoop_call)) = l_caller;
	GE_mutex_lock((EIF_POINTER)l_caller->sync_mutex);
	GE_add_scoop_call(a_session, l_call);
	GE_condition_variable_wait((EIF_POINTER)l_caller->sync_condition_variable, (EIF_POINTER)l_caller->sync_mutex);
	GE_mutex_unlock((EIF_POINTER)l_caller->sync_mutex);
}

/*
 * Let the thread of `a_caller' execute the calls of `a_callee' and vice-versa.
 */
void GE_impersonate_scoop_processor(GE_scoop_processor* a_callee, GE_scoop_processor* a_caller)
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
 * Execute `a_call'.
 */
static void GE_execute_scoop_call(GE_context* a_context, GE_scoop_call* a_call)
{
	a_call->execute(a_context, a_call);
}

/*
 * Execute `a_session'.
 */
static void GE_execute_scoop_session(GE_context* a_context, GE_scoop_session* a_session)
{
	GE_scoop_call* l_call;
	GE_scoop_call* l_next_call;

	while (1) {
		GE_mutex_lock((EIF_POINTER)a_session->mutex);
		l_call = a_session->first_call;
		if (l_call) {
			GE_mutex_unlock((EIF_POINTER)a_session->mutex);
			GE_execute_scoop_call(a_context, l_call);
			GE_mutex_lock((EIF_POINTER)a_session->mutex);
			l_next_call = l_call->next;
			a_session->first_call = l_next_call;
			if (!l_next_call) {
				a_session->last_call = l_next_call;
			}
			GE_mutex_unlock((EIF_POINTER)a_session->mutex);
			GE_free_scoop_call(l_call);
		} else if (a_session->nested_level > 0) {
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
 * Execute the main loop of the SCOOP processor `a_context->scoop_processor'.
 */
void GE_scoop_processor_run(GE_context* a_context)
{
	GE_scoop_processor* l_processor;
	GE_scoop_session* l_session;
	GE_scoop_session* l_next_session;

	l_processor = a_context->scoop_processor;
	while (1) {
		GE_mutex_lock((EIF_POINTER)l_processor->mutex);
		l_session = l_processor->first_session;
		if (l_session) {

		} else if (GE_scoop_sessions_count() <= 0) {
			GE_mutex_unlock((EIF_POINTER)l_processor->mutex);
			break;
		} else {
			GE_condition_variable_wait((EIF_POINTER)l_processor->condition_variable, (EIF_POINTER)l_processor->mutex);
			if (!l_processor->first_session && GE_scoop_sessions_count() <= 0) {
				GE_mutex_unlock((EIF_POINTER)l_processor->mutex);
				break;
			}
		}
		GE_mutex_unlock((EIF_POINTER)l_processor->mutex);
		if (l_session) {
			GE_execute_scoop_session(a_context, l_session);
			GE_remove_scoop_session(l_session);
			GE_free_scoop_session(l_session);
			GE_decrement_scoop_sessions_count();
		}
	}
}

/* 
 * Initialization of SCOOP.
 */
void GE_init_scoop()
{
	GE_unprotected_scoop_sessions_count = 0;
	GE_all_scoop_processors = 0;
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
