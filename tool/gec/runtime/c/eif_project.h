/*
	description:

		"Part of ISE Eiffel runtime."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2013-2017, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef EIF_PROJECT_H
#define EIF_PROJECT_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_EIFFEL_H
#include "ge_eiffel.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

EIF_INTEGER egc_prof_enabled;	  /* Is the Eiffel profiler on */

#ifdef __cplusplus
}
#endif

#endif
