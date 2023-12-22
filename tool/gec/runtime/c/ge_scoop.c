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
 * New SCOOP call.
 */
GE_scoop_call* GE_new_scoop_call(size_t a_size)
{
	GE_scoop_call* l_call;

	l_call = (GE_scoop_call*)GE_calloc_uncollectable(1, a_size);
	return l_call;
}

/* 
 * New SCOOP session.
 */
GE_scoop_session* GE_new_scoop_session()
{
	GE_scoop_session* l_session;

	l_session = (GE_scoop_session*)GE_calloc_uncollectable(1, sizeof(GE_scoop_session));
	return l_session;
}

/* 
 * Get SCOOP session to register calls from `a_caller' to be executed by `a_callee'.
 * Return NULL if `a_caller' and `a_callee' are the same SCOOP processor.
 */
GE_scoop_session* GE_get_scoop_session(GE_scoop_processor* a_callee, GE_scoop_processor* a_caller)
{
	if (a_callee != a_caller) {
		return GE_new_scoop_session();
	} else {
		return 0;
	}
}

/* 
 * Exit from SCOOP session `a_session' at the end of a feature with arguments of separate type
 * or at the end of an inline separate instruction. Note that some emclosing feature or inline
 * separate instruction might still be using this session to register subsequent calls.
 */
void GE_exit_scoop_session(GE_scoop_session* a_session)
{

}

/* 
 * Add SCOOP call.
 */
void GE_add_scoop_call(GE_scoop_session* a_session, GE_scoop_call* a_call)
{
	GE_scoop_call* l_last_call;

	l_last_call = a_session->last_call;
	a_session->last_call = a_call;
	if (l_last_call) {
		l_last_call->next = a_call;
	} else {
		a_session->first_call = a_call;
	}
}

/* 
 * Add SCOOP session.
 */
void GE_add_scoop_session(GE_scoop_processor* a_processor, GE_scoop_session* a_session)
{
	GE_scoop_session* l_last_session;

	GE_mutex_lock((EIF_POINTER)a_processor->session_mutex);
	l_last_session = a_processor->last_session;
	a_processor->last_session = a_session;
	if (l_last_session) {
		l_last_session->next = a_session;
	} else {
		a_processor->first_session = a_session;
	}
	GE_condition_variable_broadcast((EIF_POINTER)a_processor->session_condition_variable);
	GE_mutex_unlock((EIF_POINTER)a_processor->session_mutex);
	GE_increment_scoop_sessions_count();
}

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
uint32_t GE_scoop_sessions_count()
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
			GE_mutex_lock((EIF_POINTER)l_processor->session_mutex);
			GE_condition_variable_broadcast((EIF_POINTER)l_processor->session_condition_variable);
			GE_mutex_unlock((EIF_POINTER)l_processor->session_mutex);
			l_processor = l_processor->next;
		}
	}
	GE_mutex_unlock((EIF_POINTER)GE_scoop_sessions_count_mutex);
	return l_result;
}

/*
 * Execute `a_call'.
 */
void GE_execute_scoop_call(GE_context* a_context, GE_scoop_call* a_call)
{
	a_call->execute(a_context, a_call);
}

/*
 * Execute `a_session'.
 */
void GE_execute_scoop_session(GE_context* a_context, GE_scoop_session* a_session)
{
	GE_scoop_call* l_call;
	GE_scoop_call* l_next_call;

	l_call = a_session->first_call;
	while (l_call) {
		l_next_call = l_call->next;
		a_session->first_call = l_next_call;
		if (!l_next_call) {
			a_session->last_call = l_next_call;
		}
		GE_execute_scoop_call(a_context, l_call);
		GE_free_scoop_call(l_call);
		l_call = l_next_call;
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
		GE_mutex_lock((EIF_POINTER)l_processor->session_mutex);
		l_session = l_processor->first_session;
		if (l_session) {
			l_next_session = l_session->next;
			l_processor->first_session = l_next_session;
			if (!l_next_session) {
				l_processor->last_session = l_next_session;
			}
		} else if (GE_scoop_sessions_count() <= 0) {
			break;
		} else {
			GE_condition_variable_wait((EIF_POINTER)l_processor->session_condition_variable, (EIF_POINTER)l_processor->session_mutex);
			if (!l_processor->first_session && GE_scoop_sessions_count() <= 0) {
				break;
			}
		}
		GE_mutex_unlock((EIF_POINTER)l_processor->session_mutex);
		if (l_session) {
			GE_execute_scoop_session(a_context, l_session);
			GE_free_scoop_session(l_session);
			if (GE_decrement_scoop_sessions_count() <= 0) {
				break;
			}
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
 * Initialization of SCOOP processor.
 */
void GE_init_scoop_processor(GE_context* a_context)
{
	GE_scoop_processor* l_processor;
	EIF_MUTEX_TYPE* l_session_mutex;
	EIF_COND_TYPE* l_session_condition_variable;

	l_processor = (GE_scoop_processor*)GE_calloc_uncollectable(1, sizeof(GE_scoop_processor));
	l_session_mutex = (EIF_MUTEX_TYPE*)GE_mutex_create();
	l_session_condition_variable = (EIF_COND_TYPE*)GE_condition_variable_create();
	l_processor->session_mutex = l_session_mutex;
	l_processor->session_condition_variable = l_session_condition_variable;
	a_context->scoop_processor = l_processor;
	GE_mutex_lock((EIF_POINTER)GE_scoop_sessions_count_mutex);
	l_processor->next = GE_all_scoop_processors;
	GE_all_scoop_processors = l_processor;
	GE_mutex_unlock((EIF_POINTER)GE_scoop_sessions_count_mutex);
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
	GE_free(a_session);
}

/*
 * Free memory allocated by `a_processor'.
 */
void GE_free_scoop_processor(GE_scoop_processor* a_processor)
{
	GE_mutex_destroy((EIF_POINTER)a_processor->session_mutex);
	GE_condition_variable_destroy((EIF_POINTER)a_processor->session_condition_variable);
	GE_free(a_processor);
}

#ifdef __cplusplus
}
#endif

#endif
#endif
