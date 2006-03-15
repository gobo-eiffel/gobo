/*
	description:

		"C functions used to implement class MEMORY"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_MEMORY_H
#define EIF_MEMORY_H

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
};

struct emallinfo {
	int ml_chunk;
	long ml_total;
	long ml_used;
	long ml_over;
};

/* TODO */
#define eif_is_in_final_collect EIF_FALSE

extern void gc_stat(EIF_POINTER item, EIF_INTEGER type);
extern void mem_stat(EIF_POINTER item, EIF_INTEGER type);
extern EIF_INTEGER mem_tget(void);
extern long mem_pget(void);
extern EIF_INTEGER eif_coalesce_period(void);
extern char gc_ison(void);
extern EIF_INTEGER mem_largest(void);
extern EIF_INTEGER eif_get_max_mem(void);
extern EIF_INTEGER eif_get_chunk_size(void);
extern EIF_INTEGER eif_tenure(void);
extern EIF_INTEGER eif_generation_object_limit(void);
extern EIF_INTEGER eif_scavenge_zone_size(void);
extern void mem_speed(void);
extern void gc_stop(void);
extern void gc_run(void);
extern void mem_slow(void);
extern void mem_tiny(void);
extern void mem_tset(long int value);
extern void mem_pset(long int value);
extern void eif_set_coalesce_period (EIF_INTEGER p);
extern void eif_set_max_mem(EIF_INTEGER value);
extern void mem_free(EIF_REFERENCE object);
extern void mem_coalesc(void);
extern int collect(void);
extern void plsc(void);
extern void gc_mon(char flag);

#endif
