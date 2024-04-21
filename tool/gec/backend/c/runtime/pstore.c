/*
	description:

		"Part of ISE Eiffel runtime. Needed to compile ISE's compiler."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef ISE_PSTORE_C
#define ISE_PSTORE_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef ISE_PSTORE_H
#include "pstore.h"
#endif
#ifndef EIF_EXCEPT_H
#include "eif_except.h"
#endif
#ifndef GE_GC_H
#include "ge_gc.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Size of inner arrays in `GE_pstore_objects'.
 */
#define GE_PSTORE_CHUNK_SIZE 512

/*
 * Number of slots to be added to the outer array of
 * `GE_pstore_objects' when resizing it.
 */
#define GE_PSTORE_CAPACITY_INCREMENT 512

/*
 * Array of arrays of stored objects. Each inner array has the same size
 * (GE_PSTORE_CHUNK_SIZE). Given an id, the object if any, is at index
 * (id % GE_PSTORE_CHUNK_SIZE) in the inner array located at index
 * (id / GE_PSTORE_CHUNK_SIZE) in the outer array.
 */
static EIF_REFERENCE** GE_pstore_objects;

/*
 * Capacity of the outer array of `GE_pstore_objects'.
 */
static EIF_INTEGER_32 GE_pstore_objects_capacity;

/*
 * Last id associated with an object.
 */
static EIF_INTEGER_32 GE_last_pstore_object_id;

/*
 * Initialize data to keep track of pstore object ids.
 */
void parsing_store_initialize()
{
	GE_pstore_objects = (EIF_REFERENCE**)0;
	GE_pstore_objects_capacity = 0;
	GE_last_pstore_object_id = 0;
}

void parsing_retrieve_initialize()
{
/* Already initialized by `parsing_store_initialize'. */
}

long store_append(EIF_INTEGER f_desc, EIF_REFERENCE o, fnptr mid, fnptr nid, EIF_REFERENCE s)
{
	EIF_REFERENCE* pstore_chunk;
	EIF_INTEGER_32 i;
	EIF_INTEGER_32 l_old_capacity;

	GE_last_pstore_object_id++;
	i = GE_last_pstore_object_id / GE_PSTORE_CHUNK_SIZE;
	if (i >= GE_pstore_objects_capacity) {
		l_old_capacity = GE_pstore_objects_capacity;
		GE_pstore_objects_capacity = GE_pstore_objects_capacity + GE_PSTORE_CAPACITY_INCREMENT;
		if (GE_pstore_objects == 0) {
			GE_pstore_objects = GE_calloc(GE_pstore_objects_capacity, sizeof(EIF_REFERENCE*));
		} else {
			GE_pstore_objects = GE_recalloc(GE_pstore_objects, l_old_capacity, GE_pstore_objects_capacity, sizeof(EIF_REFERENCE*));
		}
	}
	pstore_chunk = GE_pstore_objects[i];
	if (pstore_chunk == 0) {
		pstore_chunk = GE_calloc(GE_PSTORE_CHUNK_SIZE, sizeof(EIF_REFERENCE));
		GE_pstore_objects[i] = pstore_chunk;
	}
	i = GE_last_pstore_object_id % GE_PSTORE_CHUNK_SIZE;
	pstore_chunk[i] = o;
	if (mid && nid && nid(s, o)) {
		mid(s, o, GE_last_pstore_object_id, 1);
	}
	return GE_last_pstore_object_id;
}

void parsing_store(EIF_INTEGER file_desc, EIF_REFERENCE object)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'parsing_store' in 'pstore.h' not implemented\n");
}

EIF_REFERENCE partial_retrieve(EIF_INTEGER f_desc, long position, long nb_obj)
{
	return retrieve_all(f_desc, position);
}

EIF_REFERENCE retrieve_all(EIF_INTEGER f_desc, long position)
{
	EIF_REFERENCE* pstore_chunk;
	EIF_INTEGER_32 i;

	if (position > GE_last_pstore_object_id) {
		return (EIF_REFERENCE) 0;
	}
	i = position / GE_PSTORE_CHUNK_SIZE;
	pstore_chunk = GE_pstore_objects[i];
	i = position % GE_PSTORE_CHUNK_SIZE;
	return pstore_chunk[i];
}

EIF_REFERENCE parsing_retrieve(EIF_INTEGER f_desc, EIF_INTEGER a_pos)
{
	/* TODO */
	GE_show_console();
	fprintf(stderr, "'parsing_retrieve' in 'pstore.h' not implemented\n");
	return 0;
}

void parsing_store_dispose()
{
	EIF_REFERENCE* pstore_chunk;
	EIF_INTEGER_32 i;

	if (GE_pstore_objects) {
		for (i = 0; i < GE_pstore_objects_capacity; i++) {
			pstore_chunk = GE_pstore_objects[i];
			if (pstore_chunk) {
				GE_free(pstore_chunk);
			}
		}
		GE_free(GE_pstore_objects);
	}
	GE_pstore_objects = (EIF_REFERENCE**)0;
	GE_pstore_objects_capacity = 0;
	GE_last_pstore_object_id = 0;
}

void ca_store(EIF_POINTER area, EIF_INTEGER siz, EIF_POINTER fil)
{
	if (fwrite((char *)area, sizeof(char), (size_t)siz, (FILE *)fil) != (size_t) siz)
		xraise(EN_IO);
}

void write_int(FILE *file, EIF_INTEGER_32 val)
{
	fwrite(&val, sizeof(EIF_INTEGER_32), 1, file);
}

#ifdef __cplusplus
}
#endif

#endif
