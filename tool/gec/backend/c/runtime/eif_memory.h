/*
	description:

		"C functions used to implement class MEMORY"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2026, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef EIF_MEMORY_H
#define EIF_MEMORY_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_EIFFEL_H
#include "ge_eiffel.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

struct gacstat {
	long count;
	long mem_used;
	long mem_collect;
	long mem_avg;
	long real_avg;
	long real_time;
	long real_iavg;
	long real_itime;
	double cpu_avg;
	double sys_avg;
	double cpu_iavg;
	double sys_iavg;
	double cpu_time;
	double sys_time;
	double cpu_itime;
	double sys_itime;
	double cpu_total_time;
	double sys_total_time;
};

struct emallinfo {
	int ml_chunk;
	uint64_t ml_total;
	uint64_t ml_used;
	uint64_t ml_over;
};

#define eif_is_in_final_collect EIF_FALSE

/*
 * Initialize `a_ptr used by GC_INFO to retrieve the
 * statistics frozen at the time of this call.
 */
extern void eif_gc_stat(EIF_POINTER a_ptr, EIF_INTEGER type);

/*
 * Initialize `a_ptr' used by MEM_INFO to retrieve the
 * statistics frozen at the time of this call.
 */
extern void eif_mem_stat(EIF_POINTER a_ptr, EIF_INTEGER type);

/*
 * Minimum amount of bytes to be allocated before
 * starting an automatic garbage collection.
 */
extern EIF_INTEGER eif_mem_tget(void);

/*
 * Period of full collection.
 * If the environment variable EIF_FULL_COLLECTION_PERIOD
 * is defined, it is set to the closest reasonable
 * value from it.
 * If null, no full collection is launched.
 */
extern EIF_INTEGER eif_mem_pget(void);

/*
 * Period of full coalesce (in number of collections)
 * If the environment variable EIF_FULL_COALESCE_PERIOD
 * is defined, it is set to the closest reasonable
 * value from it.
 * If null, no full coalescing is launched.
 */
extern EIF_INTEGER eif_coalesce_period(void);

/* Is garbage collection enabled? */
extern EIF_BOOLEAN eif_gc_ison(void);

/*
 * Size of largest coalesced block since last call to
 * `largest_coalesced'; 0 if none.
 */
extern EIF_INTEGER eif_mem_largest(void);

/* Maximum amount of bytes the run-time can allocate. */
extern EIF_INTEGER eif_get_max_mem(void);

/*
 * Minimal size of a memory chunk. The run-time always
 * allocates a multiple of this size.
 * If the environment variable EIF_MEMORY_CHUNK
 * is defined, it is set to the closest reasonable
 * value from it.
 */
extern EIF_INTEGER eif_get_chunk_size(void);

/*
 * Maximum age of object before being considered
 * as old (old objects are not scanned during
 * partial collection).
 * If the environment variable EIF_TENURE_MAX
 * is defined, it is set to the closest reasonable
 * value from it.
 */
extern EIF_INTEGER eif_tenure(void);

/*
 * Maximum size of object in generational scavenge zone.
 * If the environment variable EIF_GS_LIMIT
 * is defined, it is set to the closest reasonable
 * value from it.
 */
extern EIF_INTEGER eif_generation_object_limit(void);

/*
 * Size of generational scavenge zone.
 * If the environment variable EIF_MEMORY_SCAVENGE
 * is defined, it is set to the closest reasonable
 * value from it.
 */
extern EIF_INTEGER eif_scavenge_zone_size(void);

/* Disable garbage collection. */
extern void eif_gc_stop(void);

/* Enable garbage collection. */
extern void eif_gc_run(void);

/*
 * Enter `speed' mode: will optimize speed of memory
 * allocation rather than memory usage.
 */
extern void eif_mem_speed(void);

/*
 * Enter `memory' mode: will try to compact memory
 * before requesting more from the operating system.
 */
extern void eif_mem_slow(void);

/*
 * Enter `tiny' mode: will enter `memory' mode
 * after having freed as much memory as possible.
 */
extern void eif_mem_tiny(void);

/*
 * Set a new `memory_threshold' in bytes. Whenever the memory
 * allocated for Eiffel reaches this value, an automatic
 * collection is performed.
 */
extern void eif_mem_tset(EIF_INTEGER value);

/*
 * Set `collection_period'. Every `value' collection,
 * the Garbage collector will perform a collection
 * on the whole memory (full collection), otherwise
 * a simple partial collection is done.
 */
extern void eif_mem_pset(EIF_INTEGER value);

/*
 * Set `coalesce_period'. Every `value' collection,
 * the Garbage Collector will coalesce
 * the whole memory.
 */
extern void eif_set_coalesce_period (EIF_INTEGER p);

/* Set the maximum amount of memory the run-time can allocate. */
extern void eif_set_max_mem(EIF_INTEGER value);

/*
 * Free `object', by-passing garbage collection.
 * Erratic behavior will result if the object is still
 * referenced.
 */
extern void eif_mem_free(EIF_REFERENCE object);

/*
 * Coalesce the whole memory: merge adjacent free
 * blocks to reduce fragmentation. Useful, when
 * a lot of memory is allocated with garbage collector off.
 */
extern void eif_mem_coalesc(void);

/*
 * Force a partial collection cycle if garbage
 * collection is enabled; do nothing otherwise.
 */
extern int collect(void);

/*
 * Force a full collection cycle if garbage
 * collection is enabled; do nothing otherwise.
 */
extern void plsc(void);

/* Set up GC monitoring according to `flag'. */
extern void eif_gc_mon(EIF_BOOLEAN flag);

#ifdef __cplusplus
}
#endif

#endif
