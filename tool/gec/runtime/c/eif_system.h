/*
	description:

		""Part of ISE Eiffel runtime. Needed to compile class EXECUTION_ENVIRONMENT"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2018-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_SYSTEM_H
#define EIF_SYSTEM_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifdef EIF_WINDOWS
#include "Winbase.h"
#elif defined(EIF_VMS) || defined(EIF_MACOSX)
#include "sysctl.conf"
#else
#include <unistd.h>
#endif

#endif
