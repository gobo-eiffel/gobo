/*
	description:

		"C functions used to implement class MEMORY"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_MEMORY_H
#define EIF_MEMORY_H

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
	long ml_total;
	long ml_used;
	long ml_over;
};

/* TODO */
#define eif_is_in_final_collect EIF_FALSE

extern void eif_gc_stat(EIF_POINTER item, EIF_INTEGER type);
extern void eif_mem_stat(EIF_POINTER item, EIF_INTEGER type);
extern EIF_INTEGER eif_mem_tget(void);
extern long eif_mem_pget(void);
extern EIF_INTEGER eif_coalesce_period(void);
extern char eif_gc_ison(void);
extern EIF_INTEGER eif_mem_largest(void);
extern EIF_INTEGER eif_get_max_mem(void);
extern EIF_INTEGER eif_get_chunk_size(void);
extern EIF_INTEGER eif_tenure(void);
extern EIF_INTEGER eif_generation_object_limit(void);
extern EIF_INTEGER eif_scavenge_zone_size(void);
extern void eif_mem_speed(void);
extern void eif_gc_stop(void);
extern void eif_gc_run(void);
extern void eif_mem_slow(void);
extern void eif_mem_tiny(void);
extern void eif_mem_tset(long int value);
extern void eif_mem_pset(long int value);
extern void eif_set_coalesce_period (EIF_INTEGER p);
extern void eif_set_max_mem(EIF_INTEGER value);
extern void eif_mem_free(EIF_REFERENCE object);
extern void eif_mem_coalesc(void);
extern int collect(void);
extern void plsc(void);
extern void eif_gc_mon(char flag);

#ifdef __cplusplus
}
#endif

#endif
