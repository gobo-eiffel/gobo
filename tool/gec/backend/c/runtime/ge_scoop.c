/*
	description:

		"C functions used to implement SCOOP facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2023-2026, Eric Bezault and others"
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
#ifndef GE_ONCE_H
#include "ge_once.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

/* 
 * Mutex to atomically deal with multiple SCOOP sessions.
 */
static EIF_MUTEX_TYPE* GE_scoop_multisessions_mutex;

/* 
 * Number SCOOP sessions not fully executed yet.
 *
 * Not thread-safe.
 * To be protected by:
 * - `GE_scoop_sessions_count_mutex`
 */
static uint32_t GE_unprotected_scoop_sessions_count;

/* 
 * Mutex to set and access `GE_unprotected_scoop_sessions_count'.
 */
static EIF_MUTEX_TYPE* GE_scoop_sessions_count_mutex;

/* 
 * Number SCOOP sessions not fully executed yet.
 *
 * Thread-safe.
 * Protected by:
 * - `GE_scoop_sessions_count_mutex`
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
 *
 * Thread-safe.
 * Protected by:
 * - `GE_scoop_sessions_count_mutex`
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
 *
 * Thread-safe.
 * Protected by:
 * - `GE_scoop_sessions_count_mutex`
 * - `mutex` of main region
 */
uint32_t GE_decrement_scoop_sessions_count()
{
	uint32_t l_result;
	GE_scoop_region* l_main_region;

	GE_mutex_lock((EIF_POINTER)GE_scoop_sessions_count_mutex);
	if (GE_unprotected_scoop_sessions_count > 0) {
		GE_unprotected_scoop_sessions_count--;
	}
	l_result = GE_unprotected_scoop_sessions_count;
	GE_mutex_unlock((EIF_POINTER)GE_scoop_sessions_count_mutex);
	if (l_result == 0) {
			/*
				No more SCOOP session to be executed.
				We can stop the process. Do that by
				exiting the SCOOP execution loop of
				the SCOOP processor of the main thread.
			*/
		l_main_region = GE_main_context->region;
		GE_mutex_lock((EIF_POINTER)l_main_region->mutex);
		GE_condition_variable_broadcast((EIF_POINTER)l_main_region->condition_variable);
		GE_mutex_unlock((EIF_POINTER)l_main_region->mutex);
	}
	return l_result;
}

/*
 * Initialize `process_onces' and `thread_onces' in `a_region'.
 */
static void GE_scoop_init_onces(GE_scoop_region* a_region)
{
	a_region->process_onces = GE_new_onces(
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
	a_region->thread_onces = GE_new_onces(
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

/*
 * Initialization of exception handling for `a_region'.
 */
static void GE_scoop_init_exception(GE_scoop_region* a_region)
{
	EIF_REFERENCE l_exception_manager;
	GE_context* l_context = a_region->context;

	l_exception_manager = GE_new_exception_manager(l_context, EIF_TRUE);
	a_region->exception_manager = l_exception_manager;
	GE_init_exception_manager(l_context);
}

/* Free and destroy uncollectable data in `a_region'. */
static void GE_scoop_region_destroy(GE_scoop_region* a_region)
{
	GE_mutex_destroy((EIF_POINTER)a_region->mutex);
	GE_condition_variable_destroy((EIF_POINTER)a_region->condition_variable);
	GE_mutex_destroy((EIF_POINTER)a_region->sync_mutex);
	GE_condition_variable_destroy((EIF_POINTER)a_region->sync_condition_variable);
	GE_mutex_destroy((EIF_POINTER)a_region->precondition_mutex);
	GE_condition_variable_destroy((EIF_POINTER)a_region->precondition_condition_variable);
	GE_free(a_region->keep_alive);
}

#ifdef GE_USE_BOEHM_GC
/*
 * To be called by the GC when there is no Eiffel objects
 * in the SCOOP region `a_region' anymore.
 */
static void GE_scoop_region_dispose(void* a_region, void* data)
{
	GE_scoop_region* l_region = (GE_scoop_region*)a_region;
	GE_context* l_context = l_region->context;

	if (l_context && l_context->region == l_region) {
		l_context->is_region_alive = 0;
		if (GE_mutex_try_lock((EIF_POINTER)l_region->mutex)) {
			GE_condition_variable_broadcast((EIF_POINTER)l_region->condition_variable);
			GE_mutex_unlock((EIF_POINTER)l_region->mutex);
		}
	} else if (l_region->is_passive) {
		GE_scoop_region_destroy(l_region);
	}
}
#endif

/*
 * New of SCOOP region.
 */
GE_scoop_region* GE_new_scoop_region(GE_context* a_context, char a_is_passive)
{
	GE_scoop_region* l_region;

	l_region = (GE_scoop_region*)GE_calloc(1, sizeof(GE_scoop_region));
	/* Allocate `keep_alive' with `_uncollectable' so that we can keep alive the 
	current region if there are still some submitted sessions to be executed. */
	l_region->keep_alive = (GE_scoop_region**)GE_calloc_uncollectable(1, sizeof(GE_scoop_region*));
	l_region->mutex = (EIF_MUTEX_TYPE*)GE_mutex_create();
	l_region->condition_variable = (EIF_COND_TYPE*)GE_condition_variable_create();
	l_region->sync_mutex = (EIF_MUTEX_TYPE*)GE_mutex_create();
	l_region->sync_condition_variable = (EIF_COND_TYPE*)GE_condition_variable_create();
	l_region->precondition_mutex = (EIF_MUTEX_TYPE*)GE_mutex_create();
	l_region->precondition_condition_variable = (EIF_COND_TYPE*)GE_condition_variable_create();
	l_region->is_impersonation_allowed = '\1';
	l_region->is_passive = a_is_passive;
	GE_scoop_region_set_context(l_region, a_context);
	GE_scoop_init_onces(l_region);
	a_context->process_onces = l_region->process_onces;
	a_context->thread_onces = l_region->thread_onces;
	GE_scoop_init_exception(l_region);
	a_context->exception_manager = l_region->exception_manager;
#ifdef GE_USE_BOEHM_GC
	GC_REGISTER_FINALIZER_NO_ORDER((void*)(l_region), (void (*) (void*, void*))&GE_scoop_region_dispose, NULL, NULL, NULL);
#endif
	return l_region;
}

/*
 * Indicate to the callers of all preconditions waiting for some activity in `a_callee'
 * that such activity just occurred.
 *
 * To be executed by the thread associated with `a_callee'.
 * 
 * Thread-safe.
 * Protected by:
 * - `a_callee->mutex`.
 */
static void GE_scoop_region_notify_preconditions(GE_scoop_region* a_callee)
{
	GE_scoop_precondition* l_precondition;
	GE_scoop_region* l_caller;

	GE_mutex_lock((EIF_POINTER)a_callee->mutex);
	l_precondition = a_callee->first_precondition;
	while (l_precondition) {
		l_caller = l_precondition->caller;
		GE_mutex_lock((EIF_POINTER)l_caller->precondition_mutex);
		GE_condition_variable_broadcast((EIF_POINTER)l_caller->precondition_condition_variable);
		GE_mutex_unlock((EIF_POINTER)l_caller->precondition_mutex);
		l_precondition = l_precondition->next;
	}
	GE_mutex_unlock((EIF_POINTER)a_callee->mutex);
}

/* 
 * New SCOOP session to register calls to be executed on objects of
 * the region `a_callee'.
 */
static GE_scoop_session* GE_new_scoop_session(GE_scoop_region* a_callee)
{
	GE_scoop_session* l_session;

	l_session = (GE_scoop_session*)GE_calloc(1, sizeof(GE_scoop_session));
	l_session->callee = a_callee;
	l_session->mutex = (EIF_MUTEX_TYPE*)GE_mutex_create();
	l_session->condition_variable = (EIF_COND_TYPE*)GE_condition_variable_create();
	return l_session;
}

/*
 * Free memory allocated by `a_session'.
 */
static void GE_free_scoop_session(GE_scoop_session* a_session)
{
	GE_mutex_destroy((EIF_POINTER)a_session->mutex);
	GE_condition_variable_destroy((EIF_POINTER)a_session->condition_variable);
	GE_free(a_session);
}

/* 
 * Add SCOOP session `a_session' to the list of sessions to be executed by the processor of its callee.
 *
 * To be executed by the thread associated with the caller of `a_session'.
 * 
 * Not thread-safe.
 * Need to be protected by:
 * - `a_session->callee->mutex`.
 */
static void GE_unprotected_add_scoop_session(GE_scoop_session* a_session)
{
	GE_scoop_region* l_region;
	GE_scoop_session* l_last_session;

	l_region = a_session->callee;
	l_last_session = l_region->last_session;
	if (l_last_session) {
		l_last_session->next = a_session;
		a_session->previous = l_last_session;
	} else {
		l_region->first_session = a_session;
	}
	l_region->last_session = a_session;
	*(l_region->keep_alive) = l_region;
	/* If the processor of `l_region` was waiting for a session to execute,
	 * then wake it up. */
	GE_condition_variable_broadcast((EIF_POINTER)l_region->condition_variable);
}

/* 
 * Add all SCOOP sessions being part of the same multisession as `a_session'
 * to the list of sessions to be executed by the processor of their respective
 * callees.
 *
 * To be executed by the thread associated with the caller of `a_session'.
 * 
 * Thread-safe.
 * Protected by:
 * - `GE_scoop_multisessions_mutex`.
 * - `mutex` of the callee of each session being part of the same
 *   multisession as `a_session'.
 * - `mutex` of each session being part of the same multisession as
 *   `a_session' to set their `is_submitted`.
 */
static void GE_add_scoop_multisession(GE_scoop_session* a_session)
{
	uint32_t i, l_count = 0;
	GE_scoop_session* l_sibling;
	GE_scoop_region* l_region;

	GE_mutex_lock((EIF_POINTER)GE_scoop_multisessions_mutex);
	l_sibling = a_session;
	while (1) {
		l_region = l_sibling->callee;
		GE_mutex_lock((EIF_POINTER)l_region->mutex);
		l_count++;
		l_sibling = l_sibling->next_sibling_session;
		if (l_sibling == a_session) {
			break;
		}
	}
	l_sibling = a_session;
	for (i = 0; i < l_count; i++) {
		GE_increment_scoop_sessions_count();
		GE_unprotected_add_scoop_session(l_sibling);
		GE_mutex_lock((EIF_POINTER)l_sibling->mutex);
		l_sibling->is_submitted = '\1';
		GE_mutex_unlock((EIF_POINTER)l_sibling->mutex);
		GE_mutex_unlock((EIF_POINTER)l_sibling->callee->mutex);
		l_sibling = l_sibling->next_sibling_session;
	}
	GE_mutex_unlock((EIF_POINTER)GE_scoop_multisessions_mutex);
}

/* 
 * Add SCOOP session `a_session' to the list of sessions to be executed by the processor of its callee.
 *
 * To be executed by the thread associated with the caller of `a_session'.
 * 
 * Thread-safe.
 * Protected by:
 * - `a_session->callee->mutex`.
 * - `a_session->mutex` to set `a_session->is_submitted`.
 */
void GE_add_scoop_session(GE_scoop_session* a_session)
{
	GE_scoop_region* l_region;

	if (a_session->next_sibling_session == a_session) {
		GE_increment_scoop_sessions_count();
		l_region = a_session->callee;
		GE_mutex_lock((EIF_POINTER)l_region->mutex);
		GE_unprotected_add_scoop_session(a_session);
		GE_mutex_lock((EIF_POINTER)a_session->mutex);
		a_session->is_submitted = '\1';
		GE_mutex_unlock((EIF_POINTER)a_session->mutex);
		GE_mutex_unlock((EIF_POINTER)l_region->mutex);
	} else {
		GE_add_scoop_multisession(a_session);
	}
}

/* 
 * Remove SCOOP session `a_session' from the list of sessions to be executed by the processor of its callee.
 *
 * To be executed by the thread associated with the callee of `a_session'.
 * 
 * Thread-safe.
 * Protected by:
 * - `a_session->callee->mutex`.
 */
static void GE_remove_scoop_session(GE_scoop_session* a_session)
{
	GE_scoop_region* l_region;
	GE_scoop_session* l_other_session;
	char l_no_wait_condition_notification;

	l_region = a_session->callee;
	GE_mutex_lock((EIF_POINTER)l_region->mutex);
	l_other_session = a_session->previous;
	if (l_other_session) {
		l_other_session->next = a_session->next;
	} else {
		l_region->first_session = a_session->next;
	}
	l_other_session = a_session->next;
	if (l_other_session) {
		l_other_session->previous = a_session->previous;
	} else {
		l_region->last_session = a_session->previous;
	}
	if (!l_region->first_session) {
		*(l_region->keep_alive) = 0;
	}
	GE_mutex_unlock((EIF_POINTER)l_region->mutex);
	l_no_wait_condition_notification = a_session->no_wait_condition_notification;
	GE_free_scoop_session(a_session);
	GE_decrement_scoop_sessions_count();
	if (!l_no_wait_condition_notification) {
		GE_scoop_region_notify_preconditions(l_region);
	}
}

/* 
 * Move SCOOP session `a_session' to the first position in the list of sessions 
 * to be executed by the processor of its callee.
 *
 * To be executed by any thread.
 * 
 * No thread-safe.
 * To be protected by:
 * - `a_session->callee->mutex`.
 */
static void GE_unprotected_move_scoop_session_to_first(GE_scoop_session* a_session)
{
	GE_scoop_region* l_region;
	GE_scoop_session* l_other_session;

	l_region = a_session->callee;
	if (a_session == l_region->first_session) {
		/* Done */
	} else if (a_session == l_region->last_session) {
		l_region->last_session = a_session->previous;
		l_region->last_session->next = 0;
		a_session->previous = 0;
		a_session->next = l_region->first_session;
		l_region->first_session = a_session;
	} else {
		a_session->previous->next = a_session->next;
		a_session->next->previous = a_session->previous;
		a_session->previous = 0;
		a_session->next = l_region->first_session;
		l_region->first_session = a_session;
	}
}

/* 
 * Check whether one of the sessions of `a_region`, and the sessions being part
 * of the same multisession if any, could be immediately executed by the processors
 * of the callee regions. If so, move them to the first position in the list of
 * sessions of their respective region and mark them as ready for execution.
 * 
 * To be executed by the thread associated with `a_region'.
 * 
 * Thread-safe.
 * Protected by:
 * -`GE_scoop_multisessions_mutex`.
 * - `mutex` of the callee of each session being part of the same
 *   multisession as candidate sessions of `a_region`.
 */
static void GE_promote_scoop_session(GE_scoop_region* a_region)
{
	GE_scoop_session* l_session;
	char l_ready = '\1';
	uint32_t i, l_count = 0;
	GE_scoop_session* l_sibling;
	GE_scoop_region* l_sibling_region;

	GE_mutex_lock((EIF_POINTER)GE_scoop_multisessions_mutex);
	GE_mutex_lock((EIF_POINTER)a_region->mutex);
	l_session = a_region->first_session;
	while (l_session) {
		if ((l_session->next_sibling_session == l_session) || l_session->is_running) {
			GE_unprotected_move_scoop_session_to_first(l_session);
			l_session->is_running = '\1';
			break;
		} else {
			l_sibling = l_session->next_sibling_session;
			l_count = 1;
			l_ready = '\1';
			while (l_sibling != l_session) {
				l_sibling_region = l_sibling->callee;
				GE_mutex_lock((EIF_POINTER)l_sibling_region->mutex);
				l_count++;
				if ((l_sibling != l_sibling_region->first_session) && l_sibling_region->first_session->is_running) {
					l_ready = 0;
					break;
				}
				l_sibling = l_sibling->next_sibling_session;
			}
			l_sibling = l_session;
			for (i = 0; i < l_count; i++) {
				if (l_ready) {
					GE_unprotected_move_scoop_session_to_first(l_sibling);
					l_sibling->is_running = '\1';
				}
				if (l_sibling != l_session) {
					l_sibling_region = l_sibling->callee;
					GE_condition_variable_broadcast((EIF_POINTER)l_sibling_region->condition_variable);
					GE_mutex_unlock((EIF_POINTER)l_sibling_region->mutex);
				}
				l_sibling = l_sibling->next_sibling_session;
			}
			if (l_ready) {
				break;
			}
			l_session = l_session->next;
		}
	}
	GE_mutex_unlock((EIF_POINTER)a_region->mutex);
	GE_mutex_unlock((EIF_POINTER)GE_scoop_multisessions_mutex);
}

/*
 * Is `a_session` the first session submitted for execution to the processor of its callee's region?
 *
 * To be executed by the thread associated with the caller of `a_session'.
 *
 * Thread-safe.
 * Protected by:
 * - `a_session->callee->mutex`.
 */
static char GE_scoop_session_is_first(GE_scoop_session* a_session)
{
	char l_result;
	GE_scoop_region* l_callee = a_session->callee;

	GE_mutex_lock((EIF_POINTER)l_callee->mutex);
	l_result = (l_callee->first_session == a_session);
	GE_mutex_unlock((EIF_POINTER)l_callee->mutex);
	return l_result;
}

/* 
 * New SCOOP call.
 */
GE_scoop_call* GE_new_scoop_call(GE_scoop_region* a_caller, char a_is_synchronous, void (*a_execute)(GE_context*, GE_scoop_session*, GE_scoop_call*), size_t a_size)
{
	GE_scoop_call* l_call;

	l_call = (GE_scoop_call*)GE_calloc(1, a_size);
	l_call->caller = a_caller;
	l_call->is_synchronous = a_is_synchronous;
	l_call->execute = a_execute;
	return l_call;
}

/*
 * Free memory allocated by `a_call'.
 */
static void GE_free_scoop_call(GE_scoop_call* a_call)
{
	GE_free(a_call);
}

/* 
 * Add SCOOP call `a_call' to `a_session'.
 *
 * To be executed by the thread associated with the caller of `a_session'.
 * 
 * Thread-safe.
 */
void GE_scoop_session_add_call(GE_scoop_session* a_session, GE_scoop_call* a_call)
{
	GE_scoop_call* l_last_call;
	GE_scoop_region* l_caller = a_call->caller;
	GE_scoop_region* l_callee = a_session->callee;
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
		GE_mutex_unlock((EIF_POINTER)a_session->mutex);
		GE_add_scoop_session(a_session);
	} else {
		GE_condition_variable_broadcast((EIF_POINTER)a_session->condition_variable);
		GE_mutex_unlock((EIF_POINTER)a_session->mutex);
	} 
	if (l_is_synchronous) {
		char l_wait = '\1';
		if (l_callee->is_passive) {
			l_wait = !GE_scoop_session_is_first(a_session);
		}
		if (l_wait) {
			GE_condition_variable_wait((EIF_POINTER)l_caller->sync_condition_variable, (EIF_POINTER)l_caller->sync_mutex);
		}
		GE_mutex_unlock((EIF_POINTER)l_caller->sync_mutex);
		if (l_callee->progagate_exception) {
			l_callee->progagate_exception = 0;
			/* The exception is propagated to the caller region. */
			GE_jump_to_last_rescue(l_caller->context);
		}
		if (l_callee->is_dirty) {
			l_callee->is_dirty = 0;
			GE_raise(GE_EX_DIRTY);
		}
	}
}

/*
 * Add a synchronization call between `a_caller' and the callee of `a_session' if not synchronized yet.
 *
 * To be executed by the thread associated with `a_caller'.
 * 
 * Thread-safe.
 */
void GE_scoop_session_add_sync_call(GE_scoop_region* a_caller, GE_scoop_session* a_session)
{
	GE_scoop_call* l_call;

	if (!GE_scoop_session_is_synchronized(a_session) && (!a_session->callee->is_passive || !GE_scoop_session_is_submitted(a_session))) {
		l_call = GE_new_scoop_call(a_caller, '\1', 0, sizeof(GE_scoop_call));
		GE_scoop_session_add_call(a_session, l_call);
	}
}

/*
 * Let `a_context' become the new context of `a_region'.
 * Note that `a_context' may be NULL (in case of a passive region).
 */
void GE_scoop_region_set_context(GE_scoop_region* a_region, GE_context* a_context)
{
	a_region->context = a_context;
	if (a_context) {
		a_context->region = a_region;
		a_context->is_region_alive = '\1';
		a_context->exception_manager = a_region->exception_manager;
		a_context->process_onces = a_region->process_onces;
		a_context->thread_onces = a_region->thread_onces;
	}
}

/*
 * Let the processor of `a_caller' execute the calls of `a_callee' and vice-versa.
 *
 * To be executed by the thread associated with the caller of `a_session', or
 * by a thead synchronized with it.
 * 
 * Thread-safe.
 */
void GE_scoop_region_impersonate(GE_scoop_region* a_caller, GE_scoop_region* a_callee)
{
	GE_context* l_callee_context;
	GE_context* l_caller_context;

	l_caller_context = a_caller->context;
	l_callee_context = a_callee->context;
	GE_scoop_region_set_context(a_caller, l_callee_context);
	GE_scoop_region_set_context(a_callee, l_caller_context);
}

/*
 * Does the callee's region of `a_session' allow the procesor of its caller's region
 * to execute separate calls on behalf of the processor of the callee's region?
 * Note that impersonation is forced when `a_session' is synchronized
 * (which means that we're calling back the callee in a synchronous call).
 * 
 * To be executed by the thread associated with the caller of `a_session', or
 * by a thead synchronized with it.
 * 
 * Thread-safe.
 * Protected by:
 * - `a_session->callee->mutex`.
 */
char GE_scoop_session_is_impersonation_allowed(GE_scoop_session* a_session)
{
	char l_result;
	GE_scoop_region* l_region;

	l_region = a_session->callee;
	if (GE_scoop_session_is_synchronized(a_session) || l_region->is_passive) {
		return '\1';
	}
	GE_mutex_lock((EIF_POINTER)l_region->mutex);
	l_result = l_region->is_impersonation_allowed;
	GE_mutex_unlock((EIF_POINTER)l_region->mutex);
	return l_result;
}

/*
 * Indicate whether `a_region' allows or not the processors of the regions of callers
 * to execute separate calls on behalf of its processor.
 * 
 * Thread-safe.
 * Protected by:
 * - `a_region->mutex`
 */
void GE_scoop_region_set_impersonation_allowed(GE_scoop_region* a_region, char a_value)
{
	GE_mutex_lock((EIF_POINTER)a_region->mutex);
	a_region->is_impersonation_allowed = a_value;
	GE_mutex_unlock((EIF_POINTER)a_region->mutex);
}

/*
 * New of SCOOP precondition to indicate that `a_caller' failed to satisfy
 * a wait precondition.
 */
GE_scoop_precondition* GE_new_scoop_precondition(GE_scoop_region* a_caller)
{
	GE_scoop_precondition* l_precondition;

	l_precondition = (GE_scoop_precondition*)GE_calloc(1, sizeof(GE_scoop_precondition));
	l_precondition->caller = a_caller;
	return l_precondition;
}

/*
 * Indicate that some preconditions in `a_precondition->caller' are waiting for
 * some activity in `a_callee'.
 *
 * To be executed by the thread associated with `a_precondition->a_caller'.
 * 
 * Thread-safe.
 * Protected by:
 * - `a_callee->mutex`.
 */
void GE_scoop_region_add_precondition(GE_scoop_precondition* a_precondition, GE_scoop_region* a_callee)
{
	GE_scoop_precondition* l_last_precondition;

	GE_mutex_lock((EIF_POINTER)a_callee->mutex);
	l_last_precondition = a_callee->last_precondition;
	a_callee->last_precondition = a_precondition;
	if (l_last_precondition) {
		l_last_precondition->next = a_precondition;
	} else {
		a_callee->first_precondition = a_precondition;
	}
	GE_mutex_unlock((EIF_POINTER)a_callee->mutex);
}

/*
 * Indicate that the preconditions in `a_precondition->caller' are not
 * waiting for some activity in `a_callee' anymore.
 *
 * To be executed by the thread associated with `a_precondition->a_caller'.
 * 
 * Thread-safe.
 * Protected by:
 * - `a_callee->mutex`.
 */
void GE_scoop_region_remove_precondition(GE_scoop_precondition* a_precondition, GE_scoop_region* a_callee)
{
	GE_scoop_precondition* l_previous_precondition;
	GE_scoop_precondition* l_precondition;

	GE_mutex_lock((EIF_POINTER)a_callee->mutex);
	if (!a_callee->first_precondition) {
		/* done */
	} else if (a_callee->first_precondition == a_precondition) {
		l_precondition = a_precondition->next;
		a_callee->first_precondition = l_precondition;
		if (!l_precondition) {
			a_callee->last_precondition = 0;
		}
	} else {
		l_previous_precondition = a_callee->first_precondition;
		l_precondition = l_previous_precondition->next;
		while (l_precondition) {
			if (l_precondition == a_precondition) {
				l_previous_precondition->next = l_precondition->next;
				if (a_callee->last_precondition == l_precondition)  {
					a_callee->last_precondition = l_previous_precondition;
				}
				break;
			} else {
				l_previous_precondition = l_precondition;
				l_precondition = l_precondition->next;
			}
		}
	}
	GE_free(a_precondition);
	GE_mutex_unlock((EIF_POINTER)a_callee->mutex);
}

/*
 * Indicate that `a_caller' is starting to wait for any activity to occur on the callees
 * of the preconditions recently added.
 *
 * To be executed by the thread associated with `a_caller'.
 * 
 * Thread-safe.
 */
void GE_scoop_region_wait_preconditions(GE_scoop_region* a_caller)
{
	GE_mutex_lock((EIF_POINTER)a_caller->precondition_mutex);
	/* Wake up after 1 second to check that no event was missed. */
	GE_condition_variable_wait_with_timeout((EIF_POINTER)a_caller->precondition_condition_variable, (EIF_POINTER)a_caller->precondition_mutex, 1000);
	GE_mutex_unlock((EIF_POINTER)a_caller->precondition_mutex);
}

/*
 * Has some Eiffel code been called within `a_session'?
 *
 * Thread-safe.
 * Protected by:
 * - `a_session->mutex`.
 */
char GE_scoop_session_was_eiffel_called(GE_scoop_session* a_session)
{
	char l_result;

	GE_mutex_lock((EIF_POINTER)a_session->mutex);
	l_result = a_session->was_eiffel_called;
	GE_mutex_unlock((EIF_POINTER)a_session->mutex);
	return l_result;
}

/*
 * Indicate that some Eiffel code been called or not within `a_session'.
 *
 * Thread-safe.
 * Protected by:
 * - `a_session->mutex`.
 */
void GE_scoop_session_set_eiffel_called(GE_scoop_session* a_session, char a_value)
{
	GE_mutex_lock((EIF_POINTER)a_session->mutex);
	a_session->was_eiffel_called = a_value;
	GE_mutex_unlock((EIF_POINTER)a_session->mutex);
}

/*
 * Number of times `a_session` is being open. When 0, no more calls will be added.
 *
 * To be executed by the thread associated with the caller of `a_session'.
 *
 * Thread-safe.
 * Protected by:
 * - `a_session->mutex`.
 */
uint32_t GE_scoop_session_is_open(GE_scoop_session* a_session)
{
	uint32_t l_result;

	GE_mutex_lock((EIF_POINTER)a_session->mutex);
	l_result = a_session->is_open;
	GE_mutex_unlock((EIF_POINTER)a_session->mutex);
	return l_result;
}

/*
 * Has `a_session` been submitted for execution to the processor of its callee's region?
 *
 * To be executed by the thread associated with the caller of `a_session'.
 * 
 * Thread-safe.
 * Protected by:
 * - `a_session->mutex`.
 */
char GE_scoop_session_is_submitted(GE_scoop_session* a_session)
{
	char l_result;

	GE_mutex_lock((EIF_POINTER)a_session->mutex);
	l_result = a_session->is_submitted;
	GE_mutex_unlock((EIF_POINTER)a_session->mutex);
	return l_result;
}

/*
 * Is `a_callee' locked (directly or indirectly) by the processor of `a_caller'?
 *
 * To be executed by the thread associated with `a_caller'.
 *
 * Thread-safe.
 */
char GE_scoop_region_has_lock_on(GE_scoop_region* a_caller, GE_scoop_region* a_callee)
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
	GE_scoop_region* l_caller;
	GE_scoop_region* l_callee;
	GE_context* l_caller_context;
	GE_context l_old_context;
	char l_is_synchronous = a_call->is_synchronous;
	GE_rescue r;

	l_caller = a_call->caller;
	l_callee = a_session->callee;
	if (a_call->execute && a_context) {
		if (!l_callee->is_dirty) {
			l_old_context = *a_context;
			if (l_is_synchronous) {
				GE_scoop_region_pass_locks(l_caller, l_callee);
				l_caller_context = l_caller->context;
				a_context->call = l_caller_context->call;
			}
			r.previous = a_context->last_rescue;
			a_context->last_rescue = &r;
			if (GE_setjmp(r.jb) != 0) {
				a_context->last_rescue = &r;
				if (l_is_synchronous) {
					/* The exception will be propagated to the caller region. */
					GE_append_to_exception_trace_buffer(&l_caller_context->last_exception_trace, a_context->last_exception_trace.area);
					GE_append_to_exception_trace_buffer(&l_caller_context->exception_trace_buffer, a_context->exception_trace_buffer.area);
					*a_context = l_old_context;
					GE_wipe_out_exception_trace_buffer(&a_context->last_exception_trace);
					GE_wipe_out_exception_trace_buffer(&a_context->exception_trace_buffer);
					GE_scoop_region_release_locks(l_caller, l_callee);
					l_callee->progagate_exception = '\1';
					GE_mutex_lock((EIF_POINTER)l_caller->sync_mutex);
					GE_condition_variable_broadcast((EIF_POINTER)l_caller->sync_condition_variable);
					GE_mutex_unlock((EIF_POINTER)l_caller->sync_mutex);
				} else {
					l_callee->is_dirty = '\1';
#ifdef GE_SCOOP_EXCEPTIONS_STOP_WHEN_DIRTY
					a_context->last_rescue = r.previous;
					GE_jump_to_last_rescue(a_context);
#endif
					*a_context = l_old_context;
					GE_wipe_out_exception_trace_buffer(&a_context->last_exception_trace);
					GE_wipe_out_exception_trace_buffer(&a_context->exception_trace_buffer);
				}
				a_context->last_rescue = r.previous;
				return;
			}
			a_call->execute(a_context, a_session, a_call);
			a_context->last_rescue = r.previous;
			*a_context = l_old_context;
			if (l_is_synchronous) {
				GE_scoop_region_release_locks(l_caller, l_callee);
			}
			GE_scoop_session_set_eiffel_called(a_session, '\1');
		}
	}
	if (l_is_synchronous) {
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
				a_session->last_call = 0;
			}
			GE_mutex_unlock((EIF_POINTER)a_session->mutex);
			GE_free_scoop_call(l_call);
		} else if (a_session->is_open && !a_session->callee->is_passive) {
				/* The session is not finished. New calls may still be registered. */
			GE_condition_variable_wait((EIF_POINTER)a_session->condition_variable, (EIF_POINTER)a_session->mutex);
			GE_mutex_unlock((EIF_POINTER)a_session->mutex);
		} else {
			a_session->callee->is_dirty = 0;
			GE_mutex_unlock((EIF_POINTER)a_session->mutex);
			break;
		}
	}
}

/* 
 * Create (or reuse an existing) SCOOP session to register calls from
 * `a_caller' to be executed by `a_callee'.
 * Return NULL if `a_caller' and `a_callee' are the same SCOOP region.
 * If not NULL, update the value of `is_open` of the returned session.
 * `a_sibling`, if not null, the one of the sessions which is part of
 * the same multisession (e.g. feature with several separate arguments).
 * 
 * To be executed by the thread associated with `a_caller' or by a thread
 * synchronized with it.
 * 
 * Thread-safe.
 * Protected by:
 * - `mutex` of the returned session to update its `is_open`.
 */
GE_scoop_session* GE_scoop_session_open(GE_scoop_region* a_caller, GE_scoop_region* a_callee, GE_scoop_session* a_sibling)
{
	GE_scoop_session* l_session;
	GE_scoop_session* l_last_session;
	char l_has_lock = 0;

	if (a_callee == a_caller) {
		l_session = 0;
	} else {
		l_session = a_caller->first_locked_session;
		while (l_session) {
			if (l_session->callee == a_callee) {
				GE_mutex_lock((EIF_POINTER)l_session->mutex);
				l_session->is_open++;
				GE_mutex_unlock((EIF_POINTER)l_session->mutex);
				l_has_lock = '\1';
				break;
			}
			l_session = l_session->next_locked_session;
		}
		if (!l_has_lock) {
			l_session = GE_new_scoop_session(a_callee);
			l_session->is_open = 1;
			l_session->next_locked_session = a_caller->first_locked_session;
			a_caller->first_locked_session = l_session;
			if (a_sibling) {
				l_session->next_sibling_session = a_sibling->next_sibling_session;
				a_sibling->next_sibling_session = l_session;
			} else {
				l_session->next_sibling_session = l_session;
			}
		}
	}
	return l_session;
}	

/* 
 * Exit from SCOOP session `a_session' at the end of a feature with arguments of separate type
 * or at the end of an inline separate instruction. Note that some enclosing feature or inline
 * separate instruction might still be using this session to register subsequent calls.
 * 
 * To be executed by the thread associated with `a_caller' or by a thread
 * synchronized with it.
 * 
 * Thread-safe.
 * Protected by:
 * - `a_session->mutex`.
 * - `a_session->callee->mutex` when it is a passive region.
 */
void GE_scoop_session_close(GE_scoop_region* a_caller, GE_scoop_session* a_session, char a_no_wait_condition_notification)
{
	GE_scoop_session* l_locked_session;
	GE_scoop_session* l_next_session;
	GE_scoop_session* l_next_pending_session;
	GE_scoop_region* l_callee;
	char l_to_be_freed = 0;
	char l_mutex_unlocked = 0;

	GE_mutex_lock((EIF_POINTER)a_session->mutex);
	if (a_session->is_open) {
		a_session->is_open--;
		if (!a_session->is_open) {
			a_session->no_wait_condition_notification = a_no_wait_condition_notification;
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
			} else if (a_session->callee->is_passive) {
				/* A passive region as no associated processor. Its sessions are synchronously 
				 * executed by the processor of their callers. So the caller's processor has
				 * to do the house cleaning (e.g. call to `GE_remove_scoop_session`).
				 */
				l_callee = a_session->callee;
				GE_mutex_unlock((EIF_POINTER)a_session->mutex);
				l_mutex_unlocked = '\1';
				GE_remove_scoop_session(a_session);
				/* It also has to tell any subsequent caller processor waiting for this region
				 * to be available that we don't use it anymore. 
				 * When the session's callee is passive, `GE_scoop_session_execute` just wakes
				 * up its caller's processor and exits. */
				GE_mutex_lock(l_callee->mutex);
				l_next_session = l_callee->first_session;
				if (l_next_session && !l_next_session->is_running && (l_next_session->next_sibling_session != l_next_session)) {
					GE_mutex_unlock(l_callee->mutex);
					GE_promote_scoop_session(l_callee);
					GE_mutex_lock(l_callee->mutex);
					l_next_session = l_callee->first_session;
					if (!l_next_session->is_running && (l_next_session->next_sibling_session != l_next_session)) {
						l_next_session = 0;
					}
				}
				if (l_next_session) {
					l_next_session->is_running = '\1';
					GE_mutex_unlock(l_callee->mutex);
					GE_scoop_session_execute(0, l_next_session);
				} else {
					GE_mutex_unlock(l_callee->mutex);
				}
			} else {
				/* Wake up the callee's processor if needed to tell it that there is no call
				 * to be added anymore. */
				GE_condition_variable_broadcast((EIF_POINTER)a_session->condition_variable);
			}
		}
	}
	if (!l_mutex_unlocked) {
		GE_mutex_unlock((EIF_POINTER)a_session->mutex);
	}
	if (l_to_be_freed) {
		GE_free_scoop_session(a_session);
	}
}

/*
 * Perform lock passing from the processor of `a_caller' to the processor of `a_callee' 
 * in case of a synchronous call.
 * 
 * To be executed by the thread associated with `a_caller' or by a thread
 * synchronized with it.
 * 
 * Thread-safe.
 */
void GE_scoop_region_pass_locks(GE_scoop_region* a_caller, GE_scoop_region* a_callee)
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
			l_caller_session = GE_scoop_session_open(a_callee, a_caller, 0);
		}
		l_caller_session->is_synchronized++;
	}
}

/*
 * Release locks which were passed from the processor of `a_caller' to the processor of `a_callee'
 * in case of a synchronous call.
 * 
 * To be executed by the thread associated with `a_caller' or by a thread
 * synchronized with it.
 * 
 * Thread-safe.
 */
void GE_scoop_region_release_locks(GE_scoop_region* a_caller, GE_scoop_region* a_callee)
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
			GE_scoop_session_close(a_callee, l_session, 0);
			l_session = l_next_session;
		}
		a_caller->first_locked_session = a_callee->first_locked_session;
		a_callee->first_locked_session = 0;
	}
}

/*
 * Mutex to be used in `GE_scoop_processor_run'.
 *
 * Note that this function is outside of `GE_scoop_processor_run' to
 * make sure that there is no register or something on the function
 * stack keeping the region alive.
 */
static EIF_POINTER GE_scoop_processor_run_mutex(GE_context* a_context)
{
	return (EIF_POINTER)a_context->region->mutex;
}

/*
 * Condition variable to be used in `GE_scoop_processor_run'.
 *
 * Note that this function is outside of `GE_scoop_processor_run' to
 * make sure that there is no register or something on the function
 * stack keeping the region alive.
 */
static EIF_POINTER GE_scoop_processor_run_condition_variable(GE_context* a_context)
{
	return (EIF_POINTER)a_context->region->condition_variable;
}

/*
 * Lock `a_context->region->mutex'.
 * If there is at least one session in the region, unlock the mutex.
 * execute this session, and return 1.
 * Otherwise, keep the mutex locked and return 0.
 *
 * Note that this function is outside of `GE_scoop_processor_run' to
 * make sure that there is no register or something on the function
 * stack keeping the region alive.
 */
static int GE_scoop_processor_run_one_iteration(GE_context* a_context)
{
	GE_scoop_region* l_region = a_context->region;
	EIF_POINTER l_mutex = l_region->mutex;
	GE_scoop_session* l_session;

	GE_mutex_lock(l_mutex);
	l_session = l_region->first_session;
	if (l_session && !l_session->is_running && (l_session->next_sibling_session != l_session)) {
		GE_mutex_unlock(l_mutex);
		GE_promote_scoop_session(l_region);
		GE_mutex_lock(l_mutex);
		l_session = l_region->first_session;
		if (!l_session->is_running && (l_session->next_sibling_session != l_session)) {
			l_session = 0;
		}
	}
	if (l_session) {
		l_session->is_running = '\1';
		GE_mutex_unlock(l_mutex);
		GE_scoop_session_execute(a_context, l_session);
		GE_remove_scoop_session(l_session);
		return 1;
	}
	return 0;
}

/*
 * Execute the main loop of the SCOOP processor of `a_context->region'.
 */
void GE_scoop_processor_run(GE_context* a_context)
{
	EIF_POINTER l_mutex = GE_scoop_processor_run_mutex(a_context);
	EIF_POINTER l_condition_variable = GE_scoop_processor_run_condition_variable(a_context);

	while (1) {
		if (a_context->is_region_alive) {
			if (GE_scoop_processor_run_one_iteration(a_context)) {
			} else if (GE_scoop_sessions_count() == 0) {
				GE_mutex_unlock(l_mutex);
				break;
			} else {
#ifdef GE_USE_BOEHM_GC
				/* Use timeout in case `GE_scoop_region_dispose' was not able to wake it up. */
				GE_condition_variable_wait_with_timeout(l_condition_variable, l_mutex, 2000);
#else
				GE_condition_variable_wait(l_condition_variable, l_mutex);
#endif
				GE_mutex_unlock(l_mutex);
			}
		} else {
			GE_scoop_region_destroy(a_context->region);
			a_context->region = 0;
			a_context->exception_manager = EIF_VOID;
			a_context->process_onces = 0;
			a_context->thread_onces = 0;
			break;
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
	GE_scoop_multisessions_mutex = (EIF_MUTEX_TYPE*)GE_mutex_create();
}

#ifdef __cplusplus
}
#endif

#endif
#endif
