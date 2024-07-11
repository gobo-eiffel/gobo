/*
	description:

		"C functions used to implement SCOOP facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2023-2024, Eric Bezault and others"
	license: "MIT License"
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
typedef volatile struct GE_scoop_call_struct GE_scoop_call;
typedef volatile struct GE_scoop_session_struct GE_scoop_session;
struct GE_scoop_call_struct {
	GE_scoop_region* volatile caller; /* Region of the caller of the call. */
	char volatile is_synchronous; /* Should the caller wait for the call to be executed? */
	char volatile is_condition; /* Is the current call as condition call? */
	void (*volatile execute)(GE_context*, GE_scoop_session*, GE_scoop_call*);
	GE_scoop_call* volatile next; /* Protected by `mutex' of enclosing session. */
};

/* Struct for separate sessions (i.e. separate call queues). */
struct GE_scoop_session_struct {
	GE_scoop_region* volatile callee; /* Region of the targets of the calls. */
	uint32_t volatile is_synchronized; /* Did `callee' synchronously trigger directly (=1) or indirectly (>1) the calls of this session? Needed in case of callbacks. Not protected by a mutex. */
	uint32_t volatile is_open; /* Number of times this session is being open. When 0, no more calls will be added. Protected by `mutex'. */
	char volatile is_submitted; /* Has this sesssion been submitted for execution to the processor of its callee's region? Protected by `mutex'. */
	GE_scoop_session* volatile next_locked_session; /* Not protected by a mutex. */
	GE_scoop_session* volatile previous; /* Protected by `mutex' of enclosing region. */
	GE_scoop_session* volatile next; /* Protected by `mutex' of enclosing region. */
	GE_scoop_call* volatile first_call; /* Protected by `mutex'. */
	GE_scoop_call* volatile last_call; /* Protected by `mutex'. */
	EIF_MUTEX_TYPE* volatile mutex; /* To add, remove and access SCOOP calls, and to update `is_open' and `is_submitted'. */
	EIF_COND_TYPE* volatile condition_variable; /* To add, remove and access SCOOP calls, and to update `is_open' and `is_submitted'. */
};

/* Struct for a SCOOP region and its processor if any. */
struct GE_scoop_region_struct {
	GE_context* volatile context; /* May be null in case of a passive region not currently handled by the caller's prpcessor. */
	char volatile is_passive; /* Is it a passive region (with no associated processor)? */
	EIF_REFERENCE volatile exception_manager; /* Exception manager */
	GE_onces* volatile process_onces; /* Cache for status and results of onces-per-process */
	GE_onces* volatile thread_onces; /* Status and results of onces-per-thread */
	GE_scoop_session* volatile first_locked_session; /* Not protected by a mutex. */
	char volatile is_impersonation_allowed; /* Protected by `mutex'. */
	char volatile is_dirty; /* Has an unhandled exception been raised? */
	char volatile progagate_exception; /* Should an exception be propagated to the caller region? */
	GE_scoop_session* volatile first_session; /* Protected by `mutex'. */
	GE_scoop_session* volatile last_session; /* Protected by `mutex'. */
	GE_scoop_session** volatile last_session_keep_alive; /* To keep alive the last submitted session not executed yet, and hence its region. Protected by `mutex'. */
	EIF_MUTEX_TYPE* volatile mutex; /* To add, remove and access SCOOP sessions, and to access `is_impersonation_allowed'. */
	EIF_COND_TYPE* volatile condition_variable; /* To add, remove and access SCOOP sessions, and to access `is_impersonation_allowed'. */
	EIF_MUTEX_TYPE* volatile sync_mutex; /* For synchronization in case of synchronous calls. */
	EIF_COND_TYPE* volatile sync_condition_variable; /* For synchronization in case of synchronous calls. */
};

/* Struct for SCOOP processor availability condition. */
typedef volatile struct {
	uint32_t volatile wait_counter; /* Number of SCOOP processors which are not available yet. */
	uint32_t volatile trigger_counter; /* Number of condition calls currently using current condition. (Useful to free the condition when not used anymore). */
	EIF_MUTEX_TYPE* volatile mutex; /* To access `counter'. */
	EIF_COND_TYPE* volatile condition_variable; /* To access `counter'. */
} GE_scoop_condition;

/* Struct for SCOOP call containing a condition. */
typedef volatile struct {
	GE_scoop_region* volatile caller; /* Region of the caller of the call. */
	char volatile is_synchronous; /* Should the caller wait for the call to be executed? */
	char volatile is_condition; /* Is the current call as condition call? */
	void (*volatile execute)(GE_context*, GE_scoop_session*, GE_scoop_call*);
	GE_scoop_call* volatile next; /* Protected by `mutex' of enclosing session. */
	GE_scoop_condition* volatile condition;
} GE_scoop_condition_call;

/*
 * Increment number SCOOP sessions.
 */
extern uint32_t GE_increment_scoop_sessions_count(void);

/* 
 * Decrement number SCOOP sessions.
 */
extern uint32_t GE_decrement_scoop_sessions_count(void);

/*
 * New of SCOOP region.
 */
extern GE_scoop_region* GE_new_scoop_region(GE_context* a_context, char a_is_passive);

/*
 * Start opening multiple SCOOP sessions (for example in
 * a feature with several separate arguments.)
 */
extern void GE_scoop_multisessions_open_start(void);

/*
 * Stop opening multiple SCOOP sessions (for example in
 * a feature with several separate arguments.)
 */
extern void GE_scoop_multisessions_open_stop(void);

/* 
 * Create (or reuse an existing) SCOOP session to register calls from
 * `a_caller' to be executed by `a_callee'.
 * Return NULL if `a_caller' and `a_callee' are the same SCOOP region.
 * To be executed by the processor of `a_caller' (or by other processors
 * which are synchronized with `a_caller').
 */
extern GE_scoop_session* GE_scoop_session_open(GE_scoop_region* a_caller, GE_scoop_region* a_callee, GE_scoop_condition* a_condition);

/* 
 * Exit from SCOOP session `a_session' at the end of a feature with arguments of separate type
 * or at the end of an inline separate instruction. Note that some enclosing feature or inline
 * separate instruction might still be using this session to register subsequent calls.
 * To be executed from the processor of `a_caller' (or by other processors
 * which are synchronized with `a_caller').
 */
extern void GE_scoop_session_close(GE_scoop_region* a_caller, GE_scoop_session* a_session);

/*
 * New SCOOP condition.
 * `a_counter' is the initial wait counter of the condition.
 */
extern GE_scoop_condition* GE_new_scoop_condition(uint32_t a_counter);

/*
 * Decrement the wait counter of `a_condition' and broadcast information
 * when all required processors are available.
 */
extern void GE_scoop_condition_decrement(GE_scoop_condition* a_condition);

/* 
 * New SCOOP call.
 */
extern GE_scoop_call* GE_new_scoop_call(GE_scoop_region* a_caller, char a_is_synchronous, void (*a_execute)(GE_context*, GE_scoop_session*, GE_scoop_call*), size_t a_size);

/* 
 * Add SCOOP call `a_call' to `a_session'.
 */
extern void GE_scoop_session_add_call(GE_scoop_session* a_session, GE_scoop_call* a_call);

/*
 * Add a synchronization call between `a_caller' and the callee of `a_session' if not synchronized yet.
 */
extern void GE_scoop_session_add_sync_call(GE_scoop_region* a_caller, GE_scoop_session* a_session);

/*
 * Let `a_context' become the new context of `a_region'.
 * Note that `a_context' may be NULL (in case of a passive region).
 */
extern void GE_scoop_region_set_context(GE_scoop_region* a_region, GE_context* a_context);

/*
 * Let the processor of `a_caller' execute the calls of `a_callee' and vice-versa.
 */
extern void GE_scoop_region_impersonate(GE_scoop_region* a_caller, GE_scoop_region* a_callee);

/*
 * Does the callee's region of `a_session' allow the procesor of its caller's region
 * to execute separate calls on behalf of the processor of the callee's region?
 * Note that impersonation is forced when `a_session' is synchronized
 * (which means that we're calling back the callee in a synchronous call).
 */
extern char GE_scoop_session_is_impersonation_allowed(GE_scoop_session* a_session);

/*
 * Indicate whether `a_region' allow or not the processors of the regions of callers
 * to execute separate calls on behalf of its processor.
 */
extern void GE_scoop_region_set_impersonation_allowed(GE_scoop_region* a_region, char a_value);

/*
 * Is `a_callee' locked (directly or indirectly) by the processor of `a_caller'?
 */
extern char GE_scoop_region_has_lock_on(GE_scoop_region* a_caller, GE_scoop_region* a_callee);

/*
 * Did the processor of the callee's region of `a_session' synchronously
 * trigger directly or indirectly the calls of this session? 
 * Needed in case of callbacks.
 */
#define GE_scoop_session_is_synchronized(a_session) (a_session)->is_synchronized

/*
 * Perform lock passing from the processor of `a_caller' to the processor of `a_callee' 
 * in case of a synchronous call.
 */
extern void GE_scoop_region_pass_locks(GE_scoop_region* a_caller, GE_scoop_region* a_callee);

/*
 * Release locks which were passed from the processor of `a_caller' to the processor of `a_callee'
 * in case of a synchronous call.
 */
extern void GE_scoop_region_release_locks(GE_scoop_region* a_caller, GE_scoop_region* a_callee);

/*
 * Execute the main loop of the SCOOP processor of `a_context->region'.
 */
extern void GE_scoop_processor_run(GE_context* a_context);

/* 
 * Initialization of SCOOP.
 */
extern void GE_init_scoop(void);

/*
 * Free memory allocated by `a_condition'.
 */
extern void GE_free_scoop_condition(GE_scoop_condition* a_condition);

/*
 * Free memory allocated by `a_call'.
 */
extern void GE_free_scoop_call(GE_scoop_call* a_call);

/*
 * Free memory allocated by `a_session'.
 */
extern void GE_free_scoop_session(GE_scoop_session* a_session);

#ifdef __cplusplus
}
#endif

#endif
#endif
