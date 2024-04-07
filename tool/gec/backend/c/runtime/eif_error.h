/*
	description:

		"Part of ISE Eiffel runtime. Needed to compile the C code of the EiffelNet library."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef EIF_ERROR_H
#define EIF_ERROR_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef EIF_EXCEPT_H
#include "eif_except.h"
#endif

/* As a special case, an I/O error is raised when a system call which is
 * I/O bound fails.
 * Obsolete: use `eraise (NULL, EN_IO)' instead
 */
#define eio()	eraise(NULL, EN_IO)

#endif
