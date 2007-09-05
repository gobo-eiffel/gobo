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

/*
 * Access to objects, useful with GCs which move objects in memory.
 * This is not the case here, since we don't have a GC.
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
