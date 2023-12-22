/*
	description:

		"C functions used to implement SCOOP facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2023, Eric Bezault and others"
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
struct GE_scoop_call_struct {
	GE_scoop_call* next;
	void (*execute)(GE_context*, GE_scoop_call*);
};

/* Struct for separate sessions. */
typedef struct GE_scoop_session_struct GE_scoop_session;
struct GE_scoop_session_struct {
	GE_scoop_session* next;
	GE_scoop_call* first_call;
	GE_scoop_call* last_call;
};

/* Struct for a SCOOP region and its processor if any. */
struct GE_scoop_processor_struct {
	GE_scoop_session* first_session;
	GE_scoop_session* last_session;
	EIF_MUTEX_TYPE* session_mutex;
	EIF_COND_TYPE* session_condition_variable;
	GE_scoop_processor* next;
};

/* 
 * Initialization of SCOOP.
 */
extern void GE_init_scoop(void);

/* 
 * Initialization of SCOOP processor.
 */
extern void GE_init_scoop_processor(GE_context* a_context);

/* 
 * New SCOOP call.
 */
extern GE_scoop_call* GE_new_scoop_call(size_t a_size);

/* 
 * New SCOOP session.
 */
extern GE_scoop_session* GE_new_scoop_session(void);

/* 
 * Get SCOOP session to register calls from `a_caller' to be executed by `a_callee'.
 * Return NULL if `a_caller' and `a_callee' are the same SCOOP processor.
 */
extern GE_scoop_session* GE_get_scoop_session(GE_scoop_processor* a_callee, GE_scoop_processor* a_caller);

/* 
 * Exit from SCOOP session `a_session' at the end of a feature with arguments of separate type
 * or at the end of an inline separate instruction. Note that some emclosing feature or inline
 * separate instruction might still be using this session to register subsequent calls.
 */
extern void GE_exit_scoop_session(GE_scoop_session* a_session);

/* 
 * Add SCOOP call.
 */
extern void GE_add_scoop_call(GE_scoop_session* a_session, GE_scoop_call* a_call);

/* 
 * Add SCOOP session.
 */
extern void GE_add_scoop_session(GE_scoop_processor* a_processor, GE_scoop_session* a_session);

/* 
 * Number SCOOP sessions not executed yet.
 */
extern uint32_t GE_scoop_sessions_count(void);

/* 
 * Increment number SCOOP sessions.
 */
extern uint32_t GE_increment_scoop_sessions_count(void);

/* 
 * Decrement number SCOOP sessions.
 */
extern uint32_t GE_decrement_scoop_sessions_count(void);

/*
 * Execute `a_call'.
 */
extern void GE_execute_scoop_call(GE_context* a_context, GE_scoop_call* a_call);

/*
 * Execute `a_session'.
 */
extern void GE_execute_scoop_session(GE_context* a_context, GE_scoop_session* a_session);

/*
 * Execute the main loop of the SCOOP processor `a_context->scoop_processor'.
 */
extern void GE_scoop_processor_run(GE_context* a_context);

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
