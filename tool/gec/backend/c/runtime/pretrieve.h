/*
	description:

		"Part of ISE Eiffel runtime. Needed to compile ISE's compiler."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef ISE_PRETRIEVE_H
#define ISE_PRETRIEVE_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_EIFFEL_H
#include "ge_eiffel.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

extern EIF_REFERENCE partial_retrieve(EIF_INTEGER f_desc, long position, long nb_obj);
extern EIF_REFERENCE retrieve_all(EIF_INTEGER f_desc, long position);
extern EIF_REFERENCE parsing_retrieve(EIF_INTEGER f_desc, EIF_INTEGER a_pos);

#ifdef __cplusplus
}
#endif

#endif
