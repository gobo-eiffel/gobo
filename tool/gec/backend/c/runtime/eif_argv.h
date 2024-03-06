/*
	description:

		"Part of ISE Eiffel runtime. Needed to compile the EiffelVision2 library with GTK."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef EIF_ARGV_H
#define EIF_ARGV_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_ARGUMENTS_H
#include "ge_arguments.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

#define eif_argc GE_argc
#define eif_argv GE_argv

#ifdef __cplusplus
}
#endif

#endif
