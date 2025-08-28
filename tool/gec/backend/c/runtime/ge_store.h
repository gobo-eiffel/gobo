/*
	description:

		"C functions used to implement Storable facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef GE_STORE_H
#define GE_STORE_H
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
 * Store `a_object' to Storable file `a_file_desc'.
 */
extern void GE_storable_store_to_file(EIF_REFERENCE a_object, EIF_INTEGER a_file_desc);

#ifdef __cplusplus
}
#endif

#endif
