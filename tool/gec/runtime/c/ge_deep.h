/*
	description:

		"C functions used to implement features `deep_twin' and `is_deep_equal' from class ANY"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_DEEP_H
#define GE_DEEP_H

#ifdef __cplusplus
extern "C" {
#endif

/* Struct used to implement `deep_twin' and `is_deep_equal'.
 * It is used to keep track of already traversed objects.
 * The struct is using linear traversing. A better implementation could use a hash-table.
 * 'from' contains the objects already twined, or already compared.
 * 'to' contains, at the same index, their twined version, or the object to which they are equal.
 * 'from' and 'to' are made up of chunks. They point to the chunk being filled.
 * Other chunks (already filled) are linked together using index 0.
 * Indexes from 1 to capacity store actual Eiffel objects.
 */
typedef struct {
	void** from;
	void** to;
	int top;
} gedeep;

/* Allocated memory for a new 'gedeep' struct. */
extern gedeep* gedeep_new(void);

/* Free memory for 'gedeep' struct `d'. */
extern void gedeep_free(gedeep* d);

/* Eiffel object associated with `obj' in `d', if any. */
extern T0* gedeep_item(T0* obj, gedeep* d);

/* Associated `obj1' with `obj2' in `d'. */
extern void gedeep_put(T0* obj1, T0* obj2, gedeep* d);

#ifdef __cplusplus
}
#endif

#endif
