/*
	description:

		"C functions used to implement features 'deep_twin' and 'is_deep_equal' from class ANY"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_DEEP_C
#define GE_DEEP_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_DEEP_H
#include "ge_deep.h"
#endif
#ifndef GE_GC_H
#include "ge_gc.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Number of reference to Eiffel objects that can be held in a chunk in `GE_deep'.
 */
#define GE_DEEP_CAPACITY 512

/*
 * Allocated memory for a new GE_deep struct.
 */
GE_deep* GE_deep_new(void)
{
	GE_deep* d;
	d = (GE_deep*)GE_malloc_uncollectable(sizeof(GE_deep));
	d->from = (void**)GE_calloc_uncollectable(GE_DEEP_CAPACITY + 1, sizeof(void*));
	d->to = (void**)GE_calloc_uncollectable(GE_DEEP_CAPACITY + 1, sizeof(void*));
	d->top = 0;
	return d;
}

/*
 * Free memory for GE_deep struct `d'.
 */
void GE_deep_free(GE_deep* d)
{
	void** p1;
	void** p2;
	p1 = d->from;
	while (p1) {
		p2 = p1[0];
		GE_free(p1);
		p1 = p2;
	}
	p1 = d->to;
	while (p1) {
		p2 = p1[0];
		GE_free(p1);
		p1 = p2;
	}
	GE_free(d);
}

/*
 * Eiffel object associated with `obj' in `d', if any.
 */
T0* GE_deep_item(T0* obj, GE_deep* d)
{
	int i = d->top;
	void** p1 = d->from;
	void** p2 = d->to;
	while (p1) {
		while (i) {
			if (p1[i] == obj) {
				return ((T0*)p2[i]);
			}
			i--;
		}
		p1 = p1[0];
		p2 = p2[0];
		i = GE_DEEP_CAPACITY;
	}
	return 0;
}

/*
 * Associated `obj1' with `obj2' in `d'.
 */
void GE_deep_put(T0* obj1, T0* obj2, GE_deep* d)
{
	int t = d->top + 1;
	if (t > GE_DEEP_CAPACITY) {
		void** p;
		p = (void**)GE_calloc_uncollectable(GE_DEEP_CAPACITY + 1, sizeof(void*));
		p[0] = d->from;
		d->from = p;
		p = (void**)GE_calloc_uncollectable(GE_DEEP_CAPACITY + 1, sizeof(void*));
		p[0] = d->to;
		d->to = p;
		t = 1;
	}
	d->from[t] = obj1;
	d->to[t] = obj2;
	d->top = t;
}

#ifdef __cplusplus
}
#endif

#endif
