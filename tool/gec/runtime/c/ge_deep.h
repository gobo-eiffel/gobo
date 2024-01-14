/*
	description:

		"C functions used to implement features 'deep_twin' and 'is_deep_equal' from class ANY"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2017, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef GE_DEEP_H
#define GE_DEEP_H
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
 * Struct used to implement 'deep_twin' and 'is_deep_equal'.
 * It is used to keep track of already traversed objects.
 * The struct is using linear traversing. A better implementation could use a hash-table.
 * `from' contains the objects already twined, or already compared.
 * `to' contains, at the same index, their twined version, or the object to which they are equal.
 * `from' and `to' are made up of chunks. They point to the chunk being filled.
 * Other chunks (already filled) are linked together using index 0.
 * Indexes from 1 to capacity store actual Eiffel objects.
 */
typedef struct {
	void** from;
	void** to;
	int top;
} GE_deep;

/*
 * Allocated memory for a new GE_deep struct.
 */
extern GE_deep* GE_deep_new(void);

/*
 * memory for GE_deep struct `d'.
 */
extern void GE_deep_free(GE_deep* d);

/*
 *  Eiffel object associated with `obj' in `d', if any.
 */
extern T0* GE_deep_item(T0* obj, GE_deep* d);

/*
 *  Associated `obj1' with `obj2' in `d'.
 */
extern void GE_deep_put(T0* obj1, T0* obj2, GE_deep* d);

#ifdef __cplusplus
}
#endif

#endif
