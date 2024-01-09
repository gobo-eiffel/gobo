/*
	description:

		"C functions used to implement SCOOP facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2023-2024, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_SCOOP_H
#define GE_SCOOP_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifdef GE_USE_SCOOP

#ifndef GE_EIFFEL_H
#include "ge_eiffel.h"
#endif
#ifndef GE_THREAD_TYPES_H
#include "ge_exception.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

/* Struct for separate calls. */
typedef struct GE_scoop_call_struct GE_scoop_call;
typedef struct GE_scoop_session_struct GE_scoop_session;
struct GE_scoop_call_struct {
	GE_scoop_session* session;
	char is_synchronous; /* Should the caller wait for the call to be executed? */
	GE_scoop_call* next;
	void (*execute)(GE_context*, GE_scoop_call*);
};

/* Struct for separate sessions. */
struct GE_scoop_session_struct {
	GE_scoop_processor* callee;
	GE_scoop_processor* caller;
	int32_t nested_level;
	GE_scoop_session* previous;
	GE_scoop_session* next;
	GE_scoop_session* previous_same_caller;
	GE_scoop_session* next_same_caller;
	GE_scoop_call* first_call;
	GE_scoop_call* last_call;
	EIF_MUTEX_TYPE* mutex; /* To add, remove and access SCOOP calls . */
	EIF_COND_TYPE* condition_variable; /* To add, remove and access SCOOP calls . */
};

/* Struct for a SCOOP region and its processor if any. */
struct GE_scoop_processor_struct {
	GE_context* context;
	GE_scoop_processor* locked_by; /* Used in case of synchronous calls where `locked_by' is the direct caller. */
	uint32_t lock_level; /* How many times the current processor is locked by `locked_by' (in case of callbacks). */
	char is_impersonation_allowed;
	GE_scoop_processor* next;
	GE_scoop_session* first_session;
	GE_scoop_session* last_session;
	EIF_MUTEX_TYPE* mutex; /* To add, remove and access SCOOP sessions. */
	EIF_COND_TYPE* condition_variable; /* To add, remove and access SCOOP sessions. */
	EIF_MUTEX_TYPE* sync_mutex; /* For synchronization in case of synchronous calls. */
	EIF_COND_TYPE* sync_condition_variable; /* For synchronization in case of synchronous calls. */
	EIF_MUTEX_TYPE* lock_mutex; /* To modify the lock status . */
};

/*
 * Increment number SCOOP sessions.
 */
extern uint32_t GE_increment_scoop_sessions_count(void);

/* 
 * Decrement number SCOOP sessions.
 */
extern uint32_t GE_decrement_scoop_sessions_count(void);

/*
 * New of SCOOP processor.
 */
extern GE_scoop_processor* GE_new_scoop_processor(GE_context* a_context);

/* 
 * Get SCOOP session to register calls from `a_caller' to be executed by `a_callee'.
 * Return NULL if `a_caller' and `a_callee' are the same SCOOP processor.
 */
extern GE_scoop_session* GE_get_scoop_session(GE_scoop_processor* a_callee, GE_scoop_processor* a_caller);

/* 
 * Exit from SCOOP session `a_session' at the end of a feature with arguments of separate type
 * or at the end of an inline separate instruction. Note that some enclosing feature or inline
 * separate instruction might still be using this session to register subsequent calls.
 */
extern void GE_exit_scoop_session(GE_scoop_session* a_session);

/* 
 * New SCOOP call.
 */
extern GE_scoop_call* GE_new_scoop_call(size_t a_size);

/* 
 * Add SCOOP call `a_call' to `a_session'.
 */
extern void GE_add_scoop_call(GE_scoop_session* a_session, GE_scoop_call* a_call, char a_is_synchronous);

/* 
 * Add SCOOP synchronization call to `a_session'.
 */
extern void GE_add_scoop_sync_call(GE_scoop_session* a_session);

/*
 * Let the thread of `a_caller' execute the calls of `a_callee' and vice-versa.
 */
extern void GE_scoop_processor_impersonate(GE_scoop_processor* a_callee, GE_scoop_processor* a_caller);

/*
 * Let the thread of the caller of `a_caller' execute the calls of `a_callee' and vice-versa.
 */
#define GE_scoop_session_impersonate(a_session) GE_scoop_processor_impersonate((a_session)->callee, (a_session)->caller)

/*
 * Does `a_processor' allow the thread of callers to execute separate calls on its behalf?
 */
extern char GE_scoop_processor_is_impersonation_allowed(GE_scoop_processor* a_processor);

/*
 * Does the processor `a_session->callee' allow the thread of `a_session->caller' to execute separate calls on its behalf?
 */
#define GE_scoop_session_is_impersonation_allowed(a_session) GE_scoop_processor_is_impersonation_allowed((a_session)->callee)

/*
 * Indicate whether `a_processor' allow or not the thread of callers to execute separate calls on its behalf.
 */
extern void GE_scoop_processor_set_impersonation_allowed(GE_scoop_processor* a_processor, char a_value);

/*
 * Make sure that `a_caller' is locked by `a_callee'.
 */
extern void GE_scoop_processor_lock(GE_scoop_processor* a_callee, GE_scoop_processor* a_caller);

/*
 * Make sure that the caller of `a_session' is locked by its callee.
 */
#define GE_scoop_session_lock(a_session) GE_scoop_processor_lock((a_session)->callee, (a_session)->caller)

/*
 * Undo last call to `GE_scoop_processor_lock'.
 */
extern void GE_scoop_processor_unlock(GE_scoop_processor* a_callee, GE_scoop_processor* a_caller);

/*
 * Undo last call to `GE_soop_session_lock'.
 */
#define GE_scoop_session_unlock(a_session) GE_scoop_processor_unlock((a_session)->callee, (a_session)->caller)

/*
 * Is `a_caller' locked (directly or indirectly) by `a_callee'?
 */
extern char GE_scoop_processor_is_locked_by(GE_scoop_processor* a_callee, GE_scoop_processor* a_caller);

/*
 * Execute the main loop of the SCOOP processor `a_context->scoop_processor'.
 */
extern void GE_scoop_processor_run(GE_context* a_context);

/* 
 * Initialization of SCOOP.
 */
extern void GE_init_scoop(void);

/*
 * Free memory allocated by `a_call'.
 */
extern void GE_free_scoop_call(GE_scoop_call* a_call);

/*
 * Free memory allocated by `a_session'.
 */
extern void GE_free_scoop_session(GE_scoop_session* a_session);

/*
 * Free memory allocated by `a_processor'.
 */
extern void GE_free_scoop_processor(GE_scoop_processor* a_processor);

#ifdef __cplusplus
}
#endif

#endif
#endif
