/*
	description:

		"Part of ISE Eiffel runtime. Needed to compile class ISE_SCOOP_RUNTIME."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2022-2023, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_SCOOP_H
#define EIF_SCOOP_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_EIFFEL_H
#include "ge_eiffel.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

#define EIF_NULL_PROCESSOR (EIF_SCP_PID)-1
#define eif_scoop_set_is_impersonation_allowed(x,y) /* */

#ifdef __cplusplus
}
#endif

#endif
