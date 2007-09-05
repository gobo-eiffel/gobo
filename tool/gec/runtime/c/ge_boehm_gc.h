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

/*
 * Access to objects, useful with GCs which move objects in memory.
 * This is not the case here, since the Boehm GC is not a movign GC.
 */

/* Access object through hector */
#define eif_access(obj) (obj)
/* Freeze memory address */
#define eif_freeze(obj) (obj)
/* The C side adopts an object */
#define eif_adopt(obj) (obj)
/* The C side protects an object */
#define eif_protect(obj) (obj)
/* The C side weans adopted object */
#define eif_wean(obj) (obj)
/* Forget a frozen memory address */
#define eif_unfreeze(obj)
/* Always frozen since they do not move */
#define eif_frozen(obj) 1
/* Always frozen since they do not move */
#define spfrozen(obj) 1

#endif
