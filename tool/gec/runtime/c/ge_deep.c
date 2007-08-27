/*
	description:

		"C functions used to implement features `deep_twin' and `is_deep_equal' from class ANY"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_DEEP_C
#define GE_DEEP_C

#ifdef __cplusplus
extern "C" {
#endif

/* Number of reference to Eiffel objects that can be held in a chunk in 'gedeep'. */
#define GEDEEP_CAPACITY 512

/* Allocated memory for a new 'gedeep' struct. */
gedeep* gedeep_new(void)
{
	gedeep* d;
	d = (gedeep*)malloc(sizeof(gedeep));
	d->from = (void**)calloc(GEDEEP_CAPACITY + 1, sizeof(void*));
	d->to = (void**)calloc(GEDEEP_CAPACITY + 1, sizeof(void*));
	d->top = 0;
	return d;
}

/* Free memory for 'gedeep' struct `d'. */
void gedeep_free(gedeep* d)
{
	void** p1;
	void** p2;
	p1 = d->from;
	while (p1) {
		p2 = p1[0];
		free(p1);
		p1 = p2;
	}
	p1 = d->to;
	while (p1) {
		p2 = p1[0];
		free(p1);
		p1 = p2;
	}
	free(d);
}

/* Eiffel object associated with `obj' in `d', if any. */
T0* gedeep_item(T0* obj, gedeep* d)
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
		i = GEDEEP_CAPACITY;
	}
	return 0;
}

/* Associated `obj1' with `obj2' in `d'. */
void gedeep_put(T0* obj1, T0* obj2, gedeep* d)
{
	int t = d->top + 1;
	if (t > GEDEEP_CAPACITY) {
		void** p;
		p = (void**)calloc(GEDEEP_CAPACITY + 1, sizeof(void*));
		p[0] = d->from;
		d->from = p;
		p = (void**)calloc(GEDEEP_CAPACITY + 1, sizeof(void*));
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
