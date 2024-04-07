/*
	description:

		"C functions used to implement Thread support"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef EIF_THREADS_C
#define EIF_THREADS_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef EIF_THREADS_H
#include "eif_threads.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifdef GE_USE_THREADS

/* To compile the C code of EiffelNet. */
int socket_fides;

#endif

#ifdef __cplusplus
}
#endif

#endif
