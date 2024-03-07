/*
	description:

		""Part of ISE Eiffel runtime. Needed to compile class EXECUTION_ENVIRONMENT"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2018-2020, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef EIF_SYSTEM_H
#define EIF_SYSTEM_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifdef EIF_WINDOWS
#include "Winbase.h"
# include <stdlib.h>

#elif defined(EIF_VMS)
#include "sysctl.conf"

#elif defined(EIF_MACOSX)
#include "sysctl.conf"
#include <mach-o/dyld.h>

#elif defined(__FreeBSD__)
#include <unistd.h>
#include <sys/types.h>
#include <sys/sysctl.h>

#elif defined(EIF_SOLARIS)
#include <unistd.h>
#include <stdlib.h>

#else
#include <unistd.h>

#endif

#endif
