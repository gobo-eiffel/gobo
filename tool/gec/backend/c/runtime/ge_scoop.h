/*
	description:

		"C functions used to implement SCOOP facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2023-2026, Eric Bezault and others"
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
#ifndef GE_EXCEPTION_H
#include "ge_exception.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * A context keeps track of information about the execution of the thread,
 * like the execution trace, exception manager, once-per-thread status and 
 * results, etc.
 * 
 * In SCOOP, objects are part of SCOOP regions. A region can be active or
 * passive. If it's active, a SCOOP processor is associated with it. It
 * will execute features on objects belonging to this region. In the current
 * implementation a SCOOP processor is a thread, and therefore it has a
 * context. A passive region has no processor associated with it. The features
 * of its objects are executed by processor of another region on its behalf.
 * When a separate call is synchronous, the feature of the call may also
 * be executed by the processor of the caller, on behalf of the callee's
 * processor. This is known as impersonation.
 * 
 * The thread currently associated with a region is the thread that currently
 * executes calls whose targets belong to this region. This thread might be
 * the thread associated with the processor of this region, or the thread
 * associated with the processor of another region which executes the calls
 * on its behalf (see above).
 * 
 * A SCOOP region will contain sessions, which are sequences of separate
 * calls to be executed on objects of this region, and whose callers are
 * from the same region (different from the current region).
 */

/*
 * Struct for separate calls.
 *
 * - `caller` is the region of the caller of the call.
 * 
 * - `is_synchronous` indicates whether the caller has to wait for the call to be
 *   executed. It can be because the region of the callee is passive, or if the call
 *   is a query, or if one of its arguments is locked.
 * 
 * - `execute` is the feature to be executed. It can be null in case of a synchronous
 *   call.
 * 
 * - `next` is the next call to be executed in the enclosing session.
 *   It is set by the thread associated with the caller. It is accessed and cleared
 *   by the thread associated with the callee. It is protected by `mutex` of the
 *   enclosing session.
 */
typedef volatile struct GE_scoop_call_struct GE_scoop_call;
typedef volatile struct GE_scoop_session_struct GE_scoop_session;
struct GE_scoop_call_struct {
	GE_scoop_region* volatile caller;
	char volatile is_synchronous;
	void (*volatile execute)(GE_context*, GE_scoop_session*, GE_scoop_call*);
	GE_scoop_call* volatile next;
};

/*
 * Struct for separate sessions (i.e. separate call queues).
 *
 * - `callee` is the region of the targets of the calls.
 * 
 * - `is_synchronized` indicates whether `callee' synchronously triggered directly (=1)
 *   or indirectly (>1) the calls of this session. Needed in case of callbacks. It is
 *   not protected by a mutex.
 * 
 * - `is_open` is the number of times this session is being open. When 0, no more calls
 *   will be added. It is protected by `mutex'.
 * 
 * - `is_submitted` indicates whether this session has been submitted for execution
 *   to the processor of its callee's region. It can be set by any thread and
 *   is protected by `mutex'.
 * 
 * - `was_eiffel_called` indicates whether some Eiffel code been called as part of
 *   this session. It is protected by `mutex'.
 * 
 * - `no_wait_condition_notification` indicates whether no wait condition notification
 *   should be sent when closing this session. It is protected by `mutex'.
 * 
 * - `next_locked_session` is used to keep together sessions locked by the enclosing
 *   (caller) region. It is set and accessed by the thread currently associated with
 *   region of the caller, and therefore it is not protected by a mutex.
 * 
 * - `next_sibling_session` is used to keep together sesssions which are part of the
 *   same multisession (e.g. feature with several separate arguments). They form a
 *   cycle. It is set by the thread currently associated with region of the caller
 *   when opening the sessions (see `GE_scoop_session_open`) and then never modified.
 *   Therefore it is not protected by a mutex.
 * 
 * - `previous` and `next` are used to keep together sessions to be executed on objects
 *   of the same enclosing region. They can be set by any thread, and are protected by
 *   `mutex` of the enclosing region and also by `GE_scoop_multisessions_mutex` in case
 *   of pending sessions (in that case we need both mutex to set, and at least one mutex
 *   to access).
 * 
 * - `first_call` and `last_call` are the sequence of calls to be executed on objects
 *   of enclosing region. They are set by the thread associated with the caller. They
 *   are accessed and cleared by the thread associated with the callee. They are
 *   protected by `mutex`.
 */
struct GE_scoop_session_struct {
	GE_scoop_region* volatile callee;
	uint32_t volatile is_synchronized;
	uint32_t volatile is_open;
	char volatile is_submitted;
	char volatile was_eiffel_called;
	char volatile no_wait_condition_notification;
	GE_scoop_session* volatile next_locked_session;
	GE_scoop_session* volatile next_sibling_session;
	GE_scoop_session* volatile previous;
	GE_scoop_session* volatile next;
	GE_scoop_call* volatile first_call;
	GE_scoop_call* volatile last_call;
	EIF_MUTEX_TYPE* volatile mutex; /* To add, remove and access SCOOP calls, and to update `is_open', `is_submitted' and `was_eiffel_called'. */
	EIF_COND_TYPE* volatile condition_variable; /* To add, remove and access SCOOP calls, and to update `is_open' and `is_submitted'. */
};

/*
 * Struct for a SCOOP region and its processor if any.
 *
 * - `context` contains information about the thread associated with current 
 *   region. May be null in case of a passive region not currently handled by
 *   the caller's processor.
 * 
 * - `is_passive` indicates whether current region is passive (with no associated
 *   processor) or not.
 * 
 * - `exception_manager` is the exception manager object which belongs to
 *   current region.
 * 
 * - `process_onces` is a cache for status and results of onces-per-process.
 * 
 * - `thread_onces` are status and results of onces-per-thread for current region.
 * 
 * - `is_impersonation_allowed` indicates whether the processor of another
 *   region can execute features on objects of current region on its behalf.
 *   It is protected by `mutex`.
 * 
 * - `is_dirty` indicates whether an unhandled exception been raised when
 *   executing features on objects of current region.
 *
 * - `progagate_exception` indicates whether an exception raised when
 *   executing features on objects of current region should be propagated
 *   to the caller's region (e.g. in case of synchronous calls).
 * 
 * - `keep_alive` makes sure that this region will not be garbage collected
 *   when there are still sessions to be executed. It can be set by any thread
 *   and is protected by `mutex`.
 * 
 * - `first_locked_session` (and their `next_locked_session`s) are the sessions
 *   on regions currently locked by current (caller) region. They are set and
 *   accessed by the thread currently associated with current region and therefore
 *   they are not protected by a mutex.
 * 
 * - `first_session` and `last_session` are the sequence of sessions to be
 *   executed on objects of current region. They can be set by any thread and are
 *   protected by `mutex`.
 * 
 * - `first_pending_session` and `last_pending_session` are the sequence of sessions
 *   which are part of multisessions (e.g. feature with several separate arguments)
 *   and which will be executed on objects of current region when all sibling sessions
 *   are ready to be executed by their respective callee's regions. They can be set by
 *   any thread, and are protected by `mutex` and also by `GE_scoop_multisessions_mutex`
 *   (in that case we need both mutex to set, and at least one mutex to access).
 */
typedef volatile struct GE_scoop_precondition_struct GE_scoop_precondition;
struct GE_scoop_region_struct {
	GE_context* volatile context;
	char volatile is_passive;
	EIF_REFERENCE volatile exception_manager;
	GE_onces* volatile process_onces;
	GE_onces* volatile thread_onces;
	char volatile is_impersonation_allowed;
	char volatile is_dirty;
	char volatile progagate_exception;
	GE_scoop_region** volatile keep_alive;
	GE_scoop_session* volatile first_locked_session;
	GE_scoop_session* volatile first_session;
	GE_scoop_session* volatile last_session;
	GE_scoop_session* volatile first_pending_session;
	GE_scoop_session* volatile last_pending_session;
	GE_scoop_precondition* volatile first_precondition; /* Other regions whose preconditions are waiting for some activity of current region. Protected by `mutex'. */
	GE_scoop_precondition* volatile last_precondition; /* Other regions whose preconditions are waiting for some activity of current region. Protected by `mutex'. */
	EIF_MUTEX_TYPE* volatile mutex; /* To add, remove and access SCOOP sessions, and to access `is_impersonation_allowed'. */
	EIF_COND_TYPE* volatile condition_variable; /* To add, remove and access SCOOP sessions, and to access `is_impersonation_allowed'. */
	EIF_MUTEX_TYPE* volatile sync_mutex; /* For synchronization in case of synchronous calls. */
	EIF_COND_TYPE* volatile sync_condition_variable; /* For synchronization in case of synchronous calls. */
	EIF_MUTEX_TYPE* volatile precondition_mutex; /* To make preconditions of current region wait for some activity on other regions. */
	EIF_COND_TYPE* volatile precondition_condition_variable; /* To make preconditions of current region wait for some activity on other regions. */
};

/* Struct for SCOOP waiting precondition. */
struct GE_scoop_precondition_struct {
	GE_scoop_region* volatile caller; /* Region of the caller of the precondition. */
	GE_scoop_precondition* volatile next; /* Protected by `mutex' of enclosing region. */
};

/* 
 * Increment number SCOOP sessions.
 *
 * Thread-safe.
 * Protected by:
 * - `GE_scoop_sessions_count_mutex`
 */
extern uint32_t GE_increment_scoop_sessions_count(void);

/* 
 * Decrement number SCOOP sessions.
 *
 * Thread-safe.
 * Protected by:
 * - `GE_scoop_sessions_count_mutex`
 * - `mutex` of main region
 */
extern uint32_t GE_decrement_scoop_sessions_count(void);

/*
 * New of SCOOP region.
 */
extern GE_scoop_region* GE_new_scoop_region(GE_context* a_context, char a_is_passive);

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
extern GE_scoop_session* GE_scoop_session_open(GE_scoop_region* a_caller, GE_scoop_region* a_callee, GE_scoop_session* a_sibling);

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
extern void GE_scoop_session_close(GE_scoop_region* a_caller, GE_scoop_session* a_session, char a_no_wait_condition_notification);

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
extern void GE_add_scoop_session(GE_scoop_session* a_session);

/* 
 * New SCOOP call.
 */
extern GE_scoop_call* GE_new_scoop_call(GE_scoop_region* a_caller, char a_is_synchronous, void (*a_execute)(GE_context*, GE_scoop_session*, GE_scoop_call*), size_t a_size);

/* 
 * Add SCOOP call `a_call' to `a_session'.
 *
 * To be executed by the thread associated with the caller of `a_session'.
 * 
 * Thread-safe.
 */
extern void GE_scoop_session_add_call(GE_scoop_session* a_session, GE_scoop_call* a_call);

/*
 * Add a synchronization call between `a_caller' and the callee of `a_session' if not synchronized yet.
 *
 * To be executed by the thread associated with `a_caller'.
 * 
 * Thread-safe.
 */
extern void GE_scoop_session_add_sync_call(GE_scoop_region* a_caller, GE_scoop_session* a_session);

/*
 * New of SCOOP precondition to indicate that `a_caller' failed to satisfy
 * a wait precondition.
 */
extern GE_scoop_precondition* GE_new_scoop_precondition(GE_scoop_region* a_caller);

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
extern void GE_scoop_region_add_precondition(GE_scoop_precondition* a_precondition, GE_scoop_region* a_callee);

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
extern void GE_scoop_region_remove_precondition(GE_scoop_precondition* a_precondition, GE_scoop_region* a_callee);

/*
 * Indicate that `a_caller' is starting to wait for any activity to occur on the callees
 * of the preconditions recently added.
 *
 * To be executed by the thread associated with `a_caller'.
 * 
 * Thread-safe.
 */
extern void GE_scoop_region_wait_preconditions(GE_scoop_region* a_caller);

/*
 * Let `a_context' become the new context of `a_region'.
 * Note that `a_context' may be NULL (in case of a passive region).
 */
extern void GE_scoop_region_set_context(GE_scoop_region* a_region, GE_context* a_context);

/*
 * Let the processor of `a_caller' execute the calls of `a_callee' and vice-versa.
 *
 * To be executed by the thread associated with the caller of `a_session', or
 * by a thead synchronized with it.
 * 
 * Thread-safe.
 */
extern void GE_scoop_region_impersonate(GE_scoop_region* a_caller, GE_scoop_region* a_callee);

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
extern char GE_scoop_session_is_impersonation_allowed(GE_scoop_session* a_session);

/*
 * Indicate whether `a_region' allows or not the processors of the regions of callers
 * to execute separate calls on behalf of its processor.
 * 
 * Thread-safe.
 * Protected by:
 * - `a_region->mutex`
 */
extern void GE_scoop_region_set_impersonation_allowed(GE_scoop_region* a_region, char a_value);

/*
 * Is `a_callee' locked (directly or indirectly) by the processor of `a_caller'?
 *
 * To be executed by the thread associated with `a_caller'.
 *
 * Thread-safe.
 */
extern char GE_scoop_region_has_lock_on(GE_scoop_region* a_caller, GE_scoop_region* a_callee);

/*
 * Did the processor of the callee's region of `a_session' synchronously
 * trigger directly or indirectly the calls of this session? 
 * Needed in case of callbacks.
 * 
 * To be executed by the thread associated with the caller of `a_session', or
 * by a thead synchronized with it.
 * 
 * Thread-safe.
 */
#define GE_scoop_session_is_synchronized(a_session) (a_session)->is_synchronized

/*
 * Has some Eiffel code been called within `a_session'?
 *
 * Thread-safe.
 * Protected by:
 * - `a_session->mutex`.
 */
extern char GE_scoop_session_was_eiffel_called(GE_scoop_session* a_session);

/*
 * Indicate that some Eiffel code been called or not within `a_session'.
 *
 * Thread-safe.
 * Protected by:
 * - `a_session->mutex`.
 */
extern void GE_scoop_session_set_eiffel_called(GE_scoop_session* a_session, char a_value);

/*
 * Number of times `a_session` is being open. When 0, no more calls will be added.
 *
 * To be executed by the thread associated with the caller of `a_session'.
 *
 * Thread-safe.
 * Protected by:
 * - `a_session->mutex`.
 */
extern uint32_t GE_scoop_session_is_open(GE_scoop_session* a_session);

/*
 * Has `a_session` been submitted for execution to the processor of its callee's region?
 *
 * To be executed by the thread associated with the caller of `a_session'.
 * 
 * Thread-safe.
 * Protected by:
 * - `a_session->mutex`.
 */
extern char GE_scoop_session_is_submitted(GE_scoop_session* a_session);

/*
 * Perform lock passing from the processor of `a_caller' to the processor of `a_callee' 
 * in case of a synchronous call.
 * 
 * To be executed by the thread associated with `a_caller' or by a thread
 * synchronized with it.
 * 
 * Thread-safe.
 */
extern void GE_scoop_region_pass_locks(GE_scoop_region* a_caller, GE_scoop_region* a_callee);

/*
 * Release locks which were passed from the processor of `a_caller' to the processor of `a_callee'
 * in case of a synchronous call.
 * 
 * To be executed by the thread associated with `a_caller' or by a thread
 * synchronized with it.
 * 
 * Thread-safe.
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

#ifdef __cplusplus
}
#endif

#endif
#endif
