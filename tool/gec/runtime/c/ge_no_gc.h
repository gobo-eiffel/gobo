/*
	description:

		"C functions used when there is no garbage collector"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_NO_GC_H
#define GE_NO_GC_H

/* GC initialization */
#define geinit_gc() /* do nothing */

/* Memory allocation */
#define gealloc(x) calloc((x),1)
#define gealloc_atomic(x) calloc((x),1)

#endif
