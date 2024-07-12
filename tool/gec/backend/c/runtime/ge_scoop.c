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
#ifndef GE_ONCE_H
#include "ge_once.h"
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
	GE_scoop_region* l_main_region;

	l_main_region = GE_main_context->region;
	GE_mutex_lock((EIF_POINTER)l_main_region->mutex);
	GE_mutex_lock((EIF_POINTER)GE_scoop_sessions_count_mutex);
	if (GE_unprotected_scoop_sessions_count > 0) {
		GE_unprotected_scoop_sessions_count--;
	}
	l_result = GE_unprotected_scoop_sessions_count;
	if (l_result == 0) {
			/*
				No more SCOOP session to be executed.
				We can stop the process. Do that by
				exiting the SCOOP execution loop of
				the SCOOP processor of the main thread.
			*/
		GE_condition_variable_broadcast((EIF_POINTER)l_main_region->condition_variable);
	}
	GE_mutex_unlock((EIF_POINTER)GE_scoop_sessions_count_mutex);
	GE_mutex_unlock((EIF_POINTER)l_main_region->mutex);
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
void GE_scoop_init_exception(GE_scoop_region* a_region)
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
	GE_free(a_region->last_session_keep_alive);
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
	/* Allocate `last_session_keep_alive' with `_uncollectable' to that we can keep
	 * alive the region if there are still some submitted sessions to be executed. */
	l_region->last_session_keep_alive = (GE_scoop_session**)GE_calloc_uncollectable(1, sizeof(GE_scoop_session*));
	l_region->mutex = (EIF_MUTEX_TYPE*)GE_mutex_create();
	l_region->condition_variable = (EIF_COND_TYPE*)GE_condition_variable_create();
	l_region->sync_mutex = (EIF_MUTEX_TYPE*)GE_mutex_create();
	l_region->sync_condition_variable = (EIF_COND_TYPE*)GE_condition_variable_create();
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
 * New SCOOP session to register calls to be executed by the processor of `a_callee'.
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
 * Mutex to atomically open multiple SCOOP sessions.
 */
static EIF_MUTEX_TYPE* GE_scoop_multisessions_open_mutex;

/*
 * Start opening multiple SCOOP sessions (for example in
 * a feature with several separate arguments.)
 */
void GE_scoop_multisessions_open_start()
{
	GE_mutex_lock((EIF_POINTER)GE_scoop_multisessions_open_mutex);
}

/*
 * Stop opening multiple SCOOP sessions (for example in
 * a feature with several separate arguments.)
 */
void GE_scoop_multisessions_open_stop()
{
	GE_mutex_unlock((EIF_POINTER)GE_scoop_multisessions_open_mutex);
}

/*
 * Add a synchronization call between the processor of `a_caller' and 
 * the processor of the callee of `a_session' if not synchronized yet.
 */
static void GE_scoop_session_add_condition(GE_scoop_region* a_caller, GE_scoop_session* a_session, GE_scoop_condition* a_condition)
{
	GE_scoop_condition_call* l_condition_call;
	GE_scoop_call* l_last_call;
	char l_already_added = 0;

	GE_mutex_lock((EIF_POINTER)a_session->mutex);
	l_last_call = a_session->last_call;
	if (l_last_call && l_last_call->is_condition) {
		l_already_added = (((GE_scoop_condition_call*)l_last_call)->condition == a_condition);
	}
	GE_mutex_unlock((EIF_POINTER)a_session->mutex);

	if (l_already_added) {
		GE_scoop_condition_decrement(a_condition);
	} else {
		l_condition_call = (GE_scoop_condition_call*)GE_new_scoop_call(a_caller, 0, 0, sizeof(GE_scoop_condition_call));
		l_condition_call->condition = a_condition;
		l_condition_call->is_condition = '\1';
		GE_mutex_lock((EIF_POINTER)a_condition->mutex);
		a_condition->trigger_counter++;
		GE_mutex_unlock((EIF_POINTER)a_condition->mutex);
		GE_scoop_session_add_call(a_session, (GE_scoop_call*)l_condition_call);
	}
}

/* 
 * Create (or reuse an existing) SCOOP session to register calls from
 * `a_caller' to be executed by `a_callee'.
 * Return NULL if `a_caller' and `a_callee' are the same SCOOP region.
 * To be executed by the processor of `a_caller' (or by other processors
 * which are synchronized with `a_caller').
 */
GE_scoop_session* GE_scoop_session_open(GE_scoop_region* a_caller, GE_scoop_region* a_callee, GE_scoop_condition* a_condition)
{
	GE_scoop_session* l_session;
	GE_scoop_session* l_new_session;
	GE_scoop_session* l_last_session;
	char l_found = 0;

	if (a_callee == a_caller) {
		l_session = 0;
	} else {
		l_session = a_caller->first_locked_session;
		while (l_session) {
			if (l_session->callee == a_callee) {
				GE_mutex_lock((EIF_POINTER)l_session->mutex);
				l_session->is_open++;
				GE_mutex_unlock((EIF_POINTER)l_session->mutex);
				l_found = '\1';
				break;
			}
			l_session = l_session->next_locked_session;
		}
		if (!l_found) {
			l_new_session = GE_new_scoop_session(a_callee);
			l_new_session->is_open = 1;
			l_new_session->next_locked_session = a_caller->first_locked_session;
			a_caller->first_locked_session = l_new_session;
			l_session = l_new_session;
		}
	}
	if (a_condition) {
		if (l_session) {
			GE_scoop_session_add_condition(a_caller, l_session, a_condition);
		} else {
			GE_scoop_condition_decrement(a_condition);
		}
	}
	return l_session;
}	

/* 
 * Exit from SCOOP session `a_session' at the end of a feature with arguments of separate type
 * or at the end of an inline separate instruction. Note that some enclosing feature or inline
 * separate instruction might still be using this session to register subsequent calls.
 * To be executed from the processor of `a_caller' (or by other processors
 * which are synchronized with `a_caller').
 */
void GE_scoop_session_close(GE_scoop_region* a_caller, GE_scoop_session* a_session)
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
 * Add SCOOP session `a_session' to the list of sessions to be executed by the processor of its callee.
 */
static void GE_add_scoop_session(GE_scoop_session* a_session)
{
	GE_scoop_region* l_region;
	GE_scoop_session* l_last_session;

	GE_increment_scoop_sessions_count();
	l_region = a_session->callee;
	GE_mutex_lock((EIF_POINTER)l_region->mutex);
	l_last_session = l_region->last_session;
	if (l_last_session) {
		l_last_session->next = a_session;
		a_session->previous = l_last_session;
	} else {
		l_region->first_session = a_session;
	}
	l_region->last_session = a_session;
	*(l_region->last_session_keep_alive) = a_session;
	GE_condition_variable_broadcast((EIF_POINTER)l_region->condition_variable);
	GE_mutex_unlock((EIF_POINTER)l_region->mutex);
}

/* 
 * Remove SCOOP session `a_session' from the list of sessions to be executed by the processor of its callee.
 */
static void GE_remove_scoop_session(GE_scoop_session* a_session)
{
	GE_scoop_region* l_region;
	GE_scoop_session* l_other_session;

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
		*(l_region->last_session_keep_alive) = l_region->last_session;
	}
	GE_mutex_unlock((EIF_POINTER)l_region->mutex);
	GE_decrement_scoop_sessions_count();
	GE_free_scoop_session(a_session);
}

/*
 * New SCOOP condition.
 * `a_counter' is the initial wait counter of the condition.
 */
GE_scoop_condition* GE_new_scoop_condition(uint32_t a_counter)
{
	GE_scoop_condition* l_condition;

	l_condition = (GE_scoop_condition*)GE_malloc(sizeof(GE_scoop_condition));
	l_condition->wait_counter = a_counter;
	l_condition->trigger_counter = 0;
	l_condition->mutex = (EIF_MUTEX_TYPE*)GE_mutex_create();
	l_condition->condition_variable = (EIF_COND_TYPE*)GE_condition_variable_create();
	return l_condition;
}

/*
 * Decrement the wait counter of `a_condition' and broadcast information
 * when all required processors are available.
 */
void GE_scoop_condition_decrement(GE_scoop_condition* a_condition)
{
	char l_to_be_freed = 0;

	GE_mutex_lock((EIF_POINTER)a_condition->mutex);
	if (a_condition->wait_counter > 0) {
		a_condition->wait_counter--;
	}
	if (a_condition->wait_counter == 0) {
		if (a_condition->trigger_counter == 0) {
			/* No session to wake-up. */
			l_to_be_freed = '\1';
		} else {
			GE_condition_variable_broadcast((EIF_POINTER)a_condition->condition_variable);
		}
	}
	GE_mutex_unlock((EIF_POINTER)a_condition->mutex);
	if (l_to_be_freed) {
		GE_free_scoop_condition(a_condition);
	}
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
	l_call->is_condition = 0;
	l_call->execute = a_execute;
	return l_call;
}

/* 
 * Add SCOOP call `a_call' to `a_session'.
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
		a_session->is_submitted = '\1';
		GE_add_scoop_session(a_session);
	} else {
		GE_condition_variable_broadcast((EIF_POINTER)a_session->condition_variable);
	}
	GE_mutex_unlock((EIF_POINTER)a_session->mutex); 
	if (l_is_synchronous) {
		GE_condition_variable_wait((EIF_POINTER)l_caller->sync_condition_variable, (EIF_POINTER)l_caller->sync_mutex);
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
 */
void GE_scoop_session_add_sync_call(GE_scoop_region* a_caller, GE_scoop_session* a_session)
{
	GE_scoop_call* l_call;

	if (!GE_scoop_session_is_synchronized(a_session) && !a_session->callee->is_passive) {
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
 * Indicate whether `a_region' allow or not the processors of the regions of callers
 * to execute separate calls on behalf of its processor.
 */
void GE_scoop_region_set_impersonation_allowed(GE_scoop_region* a_region, char a_value)
{
	GE_mutex_lock((EIF_POINTER)a_region->mutex);
	a_region->is_impersonation_allowed = a_value;
	GE_mutex_unlock((EIF_POINTER)a_region->mutex);
}

/*
 * Is `a_callee' locked (directly or indirectly) by the processor of `a_caller'?
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
	char l_to_be_freed = 0;

	l_caller = a_call->caller;
	l_callee = a_session->callee;
	if (a_call->execute) {
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
		}
	} else if (a_call->is_condition) {
		GE_scoop_condition* l_condition = ((GE_scoop_condition_call*)a_call)->condition;
		GE_scoop_condition_decrement(l_condition);
		GE_mutex_lock(l_condition->mutex);
		if (l_condition->wait_counter > 0) {
			GE_condition_variable_wait((EIF_POINTER)l_condition->condition_variable, (EIF_POINTER)l_condition->mutex);
			if (l_condition->trigger_counter > 0) {
				l_condition->trigger_counter--;
			}
			if (l_condition->trigger_counter == 0) {
				/* No more session to wake-up. */
				l_to_be_freed = '\1';
			}
		}
		GE_mutex_unlock(l_condition->mutex);
		if (l_to_be_freed) {
			GE_free_scoop_condition(l_condition);
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
				a_session->last_call = l_next_call;
			}
			GE_mutex_unlock((EIF_POINTER)a_session->mutex);
			GE_free_scoop_call(l_call);
		} else if (a_session->is_open) {
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
 * Perform lock passing from the processor of `a_caller' to the processor of `a_callee' 
 * in case of a synchronous call.
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
			GE_scoop_session_close(a_callee, l_session);
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
	EIF_POINTER l_mutex = GE_scoop_processor_run_mutex(a_context);
	GE_scoop_session* l_session;

	GE_mutex_lock(l_mutex);
	l_session = l_region->first_session;
	if (l_session) {
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
	GE_scoop_multisessions_open_mutex = (EIF_MUTEX_TYPE*)GE_mutex_create();
}

/*
 * Free memory allocated by `a_condition'.
 */
void GE_free_scoop_condition(GE_scoop_condition* a_condition)
{
	GE_mutex_destroy((EIF_POINTER)a_condition->mutex);
	GE_condition_variable_destroy((EIF_POINTER)a_condition->condition_variable);
	GE_free(a_condition);
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

#ifdef __cplusplus
}
#endif

#endif
#endif
