/*
	description:

		"C functions used to implement class ARGUMENTS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2024, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef GE_ARGUMENTS_C
#define GE_ARGUMENTS_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_ARGUMENTS_H
#include "ge_arguments.h"
#endif
#ifndef GE_CONSOLE_H
#include "ge_console.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

int GE_argc;
EIF_NATIVE_CHAR** GE_argv;

	/* Clean up function */
typedef void (* EIF_CLEANUP)(EIF_BOOLEAN);
void eif_register_cleanup(EIF_CLEANUP f)
{
	/* TODO: Needed to compile EiffelNet */
}

#ifdef __cplusplus
}
#endif

#endif
