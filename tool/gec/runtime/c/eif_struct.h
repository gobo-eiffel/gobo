/*
	description:

		"Part of ISE Eiffel runtime. Needed to compile the ISE's compiler."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2018, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef EIF_STRUCT_H
#define EIF_STRUCT_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifdef __cplusplus
extern "C" {
#endif

typedef char *(*fnptr)(EIF_REFERENCE, ...); /* The function pointer type */

#ifdef __cplusplus
}
#endif

#endif
