/*
	description:

		"C functions used to implement class MEMORY"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_MEMORY_C
#define EIF_MEMORY_C

void gc_stat(EIF_POINTER item, EIF_INTEGER type) {
	/* TODO */
}

void mem_stat(EIF_POINTER item, EIF_INTEGER type) {
	/* TODO */
}

EIF_INTEGER mem_tget(void) {
	/* TODO */
	return (EIF_INTEGER)0;
}

long mem_pget(void) {
	/* TODO */
	return 0;
}

EIF_INTEGER eif_coalesce_period(void) {
	/* TODO */
	return (EIF_INTEGER)0;
}

char gc_ison(void) {
	/* TODO */
	return '\0';
}

EIF_INTEGER mem_largest(void) {
	/* TODO */
	return (EIF_INTEGER)0;
}

EIF_INTEGER eif_get_max_mem(void) {
	/* TODO */
	return (EIF_INTEGER)0;
}

EIF_INTEGER eif_get_chunk_size(void) {
	/* TODO */
	return (EIF_INTEGER)0;
}

EIF_INTEGER eif_tenure(void) {
	/* TODO */
	return (EIF_INTEGER)0;
}

EIF_INTEGER eif_generation_object_limit(void) {
	/* TODO */
	return (EIF_INTEGER)0;
}

EIF_INTEGER eif_scavenge_zone_size(void) {
	/* TODO */
	return (EIF_INTEGER)0;
}

void mem_speed(void) {
	/* TODO */
}

void gc_stop(void) {
	/* TODO */
}

void gc_run(void) {
	/* TODO */
}

void mem_slow(void) {
	/* TODO */
}

void mem_tiny(void) {
	/* TODO */
}

void mem_tset(long int value) {
	/* TODO */
}

void mem_pset(long int value) {
	/* TODO */
}

void eif_set_coalesce_period (EIF_INTEGER p) {
	/* TODO */
}

void eif_set_max_mem(EIF_INTEGER value) {
	/* TODO */
}

void mem_free(EIF_REFERENCE object) {
	/* TODO */
}

void mem_coalesc(void) {
	/* TODO */
}

int collect(void) {
	/* TODO */
}

void plsc(void) {
	/* TODO */
}

void gc_mon(char flag) {
	/* TODO */
}

#endif
