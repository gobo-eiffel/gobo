/*
	description:

		"C functions used to implement class IDENTIFIED"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2017, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef GE_IDENTIFIED_H
#define GE_IDENTIFIED_H
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
 * Initialize data to keep track of object ids.
 */
extern void GE_init_identified(void);

/*
 * Get a new id for `object', assuming it is NOT in the stack.
 */
extern EIF_INTEGER_32 GE_object_id(EIF_REFERENCE object);

/*
 * Return the object associated with `id'.
 */
extern EIF_REFERENCE GE_id_object(EIF_INTEGER_32 id);

/*
 * Remove the object associated with `id' from the stack.
 */
extern void GE_object_id_free(EIF_INTEGER_32 id);

#ifdef __cplusplus
}
#endif

#endif
