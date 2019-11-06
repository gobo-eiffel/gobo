/*
	description:

		"Part of ISE Eiffel runtime. Needed to compile the EiffelCOM library."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2010-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_GLOBALS_H
#define EIF_GLOBALS_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_EXCEPTION_H
#include "ge_exception.h"
#endif
#ifndef EIF_THREADS_H
#include "eif_threads.h"
#endif
#ifndef EIF_SIZE_H
#include "eif_size.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifdef GE_USE_THREADS
#define EIF_GET_CONTEXT \
	GE_context* eif_globals = GE_current_context();
#else
#define EIF_GET_CONTEXT
#endif

#define GTCX EIF_GET_CONTEXT

#ifdef __cplusplus
}
#endif

#endif
