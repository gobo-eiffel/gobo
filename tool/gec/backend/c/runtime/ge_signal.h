/*
	description:

		"C functions used to handle signals"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef GE_SIGNAL_H
#define GE_SIGNAL_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_EIFFEL_H
#include "ge_eiffel.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Set signal handlers.
 * To be called at the beginning of the main thread.
 */
extern void GE_init_signal(void);

/* Initialize `GE_ignored_signals_mutex'. */
extern void GE_init_ignored_signals_mutex(void);

/* Description of sinal `a_sig'. */
extern char *GE_signal_name(EIF_INTEGER a_sig);

/* Is signal `a_sig' defined? */
extern char GE_is_signal_defined(EIF_INTEGER a_sig);

/* C signal code for signal of index `idx'. */
extern EIF_INTEGER GE_signal_map(EIF_INTEGER idx);

/*
 * Catch signal `a_sig'.
 * Check that the signal is defined.
 */
extern void GE_catch_signal(EIF_INTEGER a_sig);

/* 
 * Ignore signal `a_sig'.
 * Check that the signal is defined.
 */
extern void GE_ignore_signal(EIF_INTEGER a_sig);

/*
 * Is signal of number `a_sig' caught?
 * Check that the signal is defined.
 */
extern char GE_is_signal_caught(EIF_INTEGER a_sig);

/* Reset all the signals to their default handling. */
extern void GE_reset_all_signals(void);

/* Reset signal `a_sig' to its default handling. */
extern void GE_reset_signal_to_default(EIF_INTEGER a_sig);

/* Number of last signal. */
extern EIF_INTEGER GE_signal_number();

#ifdef __cplusplus
}
#endif

#endif
