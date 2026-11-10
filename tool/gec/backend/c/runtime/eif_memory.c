/*
	description:

		"C functions used to implement class MEMORY"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2026, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef EIF_MEMORY_C
#define EIF_MEMORY_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef EIF_MEMORY_H
#include "eif_memory.h"
#endif
#ifndef GE_GC_H
#include "ge_gc.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Initialize `a_ptr used by GC_INFO to retrieve the
 * statistics frozen at the time of this call.
 */
void eif_gc_stat(EIF_POINTER a_ptr, EIF_INTEGER type)
{
	GE_memset((void*)a_ptr, 0, sizeof(struct gacstat));
}

/*
 * Initialize `a_ptr' used by MEM_INFO to retrieve the
 * statistics frozen at the time of this call.
 */
void eif_mem_stat(EIF_POINTER a_ptr, EIF_INTEGER type)
{
	GE_memset((void*)a_ptr, 0, sizeof(struct emallinfo));
}

/*
 * Minimum amount of bytes to be allocated before
 * starting an automatic garbage collection.
 */
EIF_INTEGER eif_mem_tget(void)
{
	return (EIF_INTEGER)0;
}

/*
 * Period of full collection.
 * If the environment variable EIF_FULL_COLLECTION_PERIOD
 * is defined, it is set to the closest reasonable
 * value from it.
 * If null, no full collection is launched.
 */
EIF_INTEGER eif_mem_pget(void)
{
	return (EIF_INTEGER)0;
}

/*
 * Period of full coalesce (in number of collections)
 * If the environment variable EIF_FULL_COALESCE_PERIOD
 * is defined, it is set to the closest reasonable
 * value from it.
 * If null, no full coalescing is launched.
 */
EIF_INTEGER eif_coalesce_period(void)
{
	return (EIF_INTEGER)0;
}

/* Is garbage collection enabled? */
EIF_BOOLEAN eif_gc_ison(void)
{
#ifdef GE_USE_BOEHM_GC
	if (!GC_is_disabled()) {
		return EIF_TRUE;
	}
#endif
	return EIF_FALSE;
}

/*
 * Size of largest coalesced block since last call to
 * `largest_coalesced'; 0 if none.
 */
EIF_INTEGER eif_mem_largest(void)
{
	return (EIF_INTEGER)0;
}

/* Maximum amount of bytes the run-time can allocate. */
EIF_INTEGER eif_get_max_mem(void)
{
	return (EIF_INTEGER)0;
}

/*
 * Minimal size of a memory chunk. The run-time always
 * allocates a multiple of this size.
 * If the environment variable EIF_MEMORY_CHUNK
 * is defined, it is set to the closest reasonable
 * value from it.
 */
EIF_INTEGER eif_get_chunk_size(void)
{
	return (EIF_INTEGER)0;
}

/*
 * Maximum age of object before being considered
 * as old (old objects are not scanned during
 * partial collection).
 * If the environment variable EIF_TENURE_MAX
 * is defined, it is set to the closest reasonable
 * value from it.
 */
EIF_INTEGER eif_tenure(void)
{
	return (EIF_INTEGER)0;
}

/*
 * Maximum size of object in generational scavenge zone.
 * If the environment variable EIF_GS_LIMIT
 * is defined, it is set to the closest reasonable
 * value from it.
 */
EIF_INTEGER eif_generation_object_limit(void)
{
	return (EIF_INTEGER)0;
}

/*
 * Size of generational scavenge zone.
 * If the environment variable EIF_MEMORY_SCAVENGE
 * is defined, it is set to the closest reasonable
 * value from it.
 */
EIF_INTEGER eif_scavenge_zone_size(void)
{
	return (EIF_INTEGER)0;
}

/* Disable garbage collection. */
void eif_gc_stop(void)
{
#ifdef GE_USE_BOEHM_GC
	if (!GC_is_disabled()) {
		GC_disable();
	}
#endif
}

/* Enable garbage collection. */
void eif_gc_run(void)
{
#ifdef GE_USE_BOEHM_GC
	while (GC_is_disabled()) {
		GC_enable();
	}
#endif
}

/*
 * Enter `speed' mode: will optimize speed of memory
 * allocation rather than memory usage.
 */
void eif_mem_speed(void)
{
}

/*
 * Enter `memory' mode: will try to compact memory
 * before requesting more from the operating system.
 */
void eif_mem_slow(void)
{
}

/*
 * Enter `tiny' mode: will enter `memory' mode
 * after having freed as much memory as possible.
 */
void eif_mem_tiny(void)
{
}

/*
 * Set a new `memory_threshold' in bytes. Whenever the memory
 * allocated for Eiffel reaches this value, an automatic
 * collection is performed.
 */
void eif_mem_tset(EIF_INTEGER value)
{
}

/*
 * Set `collection_period'. Every `value' collection,
 * the Garbage collector will perform a collection
 * on the whole memory (full collection), otherwise
 * a simple partial collection is done.
 */
void eif_mem_pset(EIF_INTEGER value)
{
}

/*
 * Set `coalesce_period'. Every `value' collection,
 * the Garbage Collector will coalesce
 * the whole memory.
 */
void eif_set_coalesce_period(EIF_INTEGER p)
{
}

/* Set the maximum amount of memory the run-time can allocate. */
void eif_set_max_mem(EIF_INTEGER value)
{
}

/*
 * Free `object', by-passing garbage collection.
 * Erratic behavior will result if the object is still
 * referenced.
 */
void eif_mem_free(EIF_REFERENCE object)
{
	GE_free(object);
}

/*
 * Coalesce the whole memory: merge adjacent free
 * blocks to reduce fragmentation. Useful, when
 * a lot of memory is allocated with garbage collector off.
 */
void eif_mem_coalesc(void)
{
}

/*
 * Force a partial collection cycle if garbage
 * collection is enabled; do nothing otherwise.
 */
int collect(void)
{
#ifdef GE_USE_BOEHM_GC
	GC_gcollect();
#endif
	return 0;
}

/*
 * Force a full collection cycle if garbage
 * collection is enabled; do nothing otherwise.
 */
void plsc(void)
{
#ifdef GE_USE_BOEHM_GC
	GC_gcollect();
#endif
}

/* Set up GC monitoring according to `flag'. */
void eif_gc_mon(EIF_BOOLEAN flag)
{
}

#ifdef __cplusplus
}
#endif

#endif
