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

#elif defined(EIF_VMS) || defined(EIF_MACOSX)
#include "sysctl.conf"

#elif EIF_OS == EIF_OS_DARWIN
#include <unistd.h>
#include <mach-o/dyld.h>
#include <limits.h>

#elif EIF_OS == EIF_OS_FREEBSD
#include <unistd.h>
#include <sys/types.h>
#include <sys/sysctl.h>

#elif defined(EIF_SOLARIS)
#include <unistd.h>
#include <stdlib.h>
#include <limits.h>

#else
#include <unistd.h>
#include <limits.h>

#endif

#endif
