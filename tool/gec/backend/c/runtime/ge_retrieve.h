/*
	description:

		"C functions used to implement Storable facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef GE_RETRIEVE_H
#define GE_RETRIEVE_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_EIFFEL_H
#include "ge_eiffel.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Object retrieved fron Storable file `a_file_desc'.
 */
extern EIF_REFERENCE GE_storable_retrieved_from_file(EIF_INTEGER a_file_desc);

#ifdef __cplusplus
}
#endif

#endif
