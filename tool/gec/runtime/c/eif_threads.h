/*
	description:

		"C functions used to implement Thread support"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_THREADS_H
#define EIF_THREADS_H

#ifdef __cplusplus
extern "C" {
#endif

#ifndef EIF_THREADS

/* Empty stubs for EiffelThread library so that it may be compiled against a non-multithreaded run-time */

#define eif_thr_mutex_create() NULL
#define eif_thr_mutex_lock(a_mutex_pointer)
#define eif_thr_mutex_unlock(a_mutex_pointer)
#define eif_thr_mutex_trylock(a_mutex_pointer) EIF_FALSE
#define eif_thr_mutex_destroy(a_mutex_pointer)

#endif

#ifdef __cplusplus
}
#endif

#endif
