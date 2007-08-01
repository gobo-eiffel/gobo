/*
	description:

		"C functions used when the application is compiled with the Boehm garbage collector"

	see: "[
		http://en.wikipedia.org/wiki/Boehm_GC
		http://www.hpl.hp.com/personal/Hans_Boehm/gc/
	]"
	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_BOEHM_GC_H
#define GE_BOEHM_GC_H

#include "gc.h"

/* GC initialization */
#define geinit_gc() GC_INIT(); GC_enable_incremental()

/* Memory allocation */
#define gealloc(x) GC_MALLOC(x)
#define gealloc_atomic(x) GC_MALLOC_ATOMIC(x)

#endif
