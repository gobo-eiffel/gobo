/*
	description:

		"Part of ISE Eiffel runtime. Needed to compile the EiffelCOM library."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2010-2017, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef EIF_PLUG_C
#define EIF_PLUG_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef EIF_PLUG_H
#include "eif_plug.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

int nstcall = 0;

#ifdef __cplusplus
}
#endif

#endif
