/*
	description:

		"Part of ISE Eiffel runtime. Needed to compile class ISE_SCOOP_RUNTIME."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2022-2024, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef EIF_SCOOP_H
#define EIF_SCOOP_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_EIFFEL_H
#include "ge_eiffel.h"
#endif
#ifdef GE_USE_SCOOP
#ifndef GE_SCOOP_H
#include "ge_scoop.h"
#endif
#endif

#ifdef __cplusplus
extern "C" {
#endif

#define EIF_NULL_PROCESSOR (EIF_SCP_PID)-1
#ifdef GE_USE_SCOOP
#define eif_scoop_set_is_impersonation_allowed(x,y) GE_scoop_processor_set_impersonation_allowed(GE_current_context()->scoop_processor,(y));
#else
#define eif_scoop_set_is_impersonation_allowed(x,y) /* */
#endif

#ifdef __cplusplus
}
#endif

#endif
