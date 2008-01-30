/*
	description:

		"C functions used to access garbage collector facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_GC_H
#define GE_GC_H

#ifdef EIF_BOEHM_GC

/*
	Use the Boehm garbage collector.
	See:
		http://en.wikipedia.org/wiki/Boehm_GC
		http://www.hpl.hp.com/personal/Hans_Boehm/gc/
*/

#include "gc.h"

/*
	GC initialization.
*/
#define GE_init_gc() GC_INIT(); GC_enable_incremental()

/*
	Memory allocation.
*/
#define GE_alloc(x) GE_null(GC_MALLOC(x))
#define GE_alloc_atomic(x) GE_null(GC_MALLOC_ATOMIC(x))

/*
	Dispose
*/

/*
 * Call dispose routine `disp' on object `C'.
 */
extern void GE_boehm_dispose(EIF_REFERENCE, void (*)(EIF_REFERENCE));
/*
 * Register dispose routine `disp' to be called on object `obj' when it will be collected.
 */
#define GE_register_dispose(obj, disp) GC_register_finalizer((void*)(obj), (void (*) (void*, void*)) &GE_boehm_dispose, (void*)(disp), NULL, NULL)

#else

/*
	No garbage collector.
*/

/*
	GC initialization.
*/
#define GE_init_gc() /* do nothing */

/*
	Memory allocation.
*/
#define GE_alloc(x) GE_null(calloc((x),1))
#define GE_alloc_atomic(x) GE_null(calloc((x),1))

/*
	Dispose
*/

/*
 * Register dispose routine `disp' to be called on object `obj' when it will be collected.
 */
#define GE_register_dispose(obj, disp) /* do nothing */

#endif


/*
	Access to objects, useful with GCs which move objects in memory.
	This is not the case here, since the Boehm GC is not a moving GC.
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
