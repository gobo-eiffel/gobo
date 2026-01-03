/*
	description:

		"C functions used to access garbage collector facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2024, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef GE_GC_C
#define GE_GC_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_GC_H
#include "ge_gc.h"
#endif
#ifndef GE_TYPES_H
#include "ge_types.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Allocate memory that does not contain pointers to collectable objects.
 * The allocated memory is zeroed.
 * The allocated object is itself not collectable.
 * Do not raise an exception when no-more-memory.
 */
#ifdef GE_USE_BOEHM_GC
void* GE_unprotected_calloc_atomic_uncollectable(size_t nelem, size_t elsize)
{
	void* new_p;

	new_p = GC_malloc_atomic_uncollectable(nelem * elsize);
	if (new_p) {
		GE_memset(new_p, 0, nelem * elsize);
	}
	return new_p;
}
#endif

/*
 * Allocate more memory for the given pointer.
 * The reallocated pointer keeps the same properties (e.g. atomic or not, collectable or not).
 * The extra allocated memory is zeroed.
 * Do not raise an exception when no-more-memory.
 */
void* GE_unprotected_recalloc(void* p, size_t old_nelem, size_t new_nelem, size_t elsize)
{
	void* new_p;
	new_p = GE_unprotected_realloc(p, new_nelem * elsize);
	if (new_p) {
		GE_memset(((char*)new_p) + (old_nelem * elsize), 0, (new_nelem - old_nelem) * elsize);
	}
	return new_p;
}

#if defined(GE_WINDOWS) && defined(__clang__)
/*
 * Memory setting.
 * Workaround for crashes (illegal instruction signal) when calling 
 * `memset` in Azure Devops pipelines under Windows.
 */
void* GE_memset(void* str, int c, size_t n)
{
	size_t i;
	char volatile* s = (char*)str;

	for (i = 0; i < n; i++) {
		s[i] = (char)c;
	}
	return str;
}
#endif

#ifdef GE_USE_BOEHM_GC
/*
 * Call dispose routine on object `C'.
 */
void GE_boehm_dispose(void* C, void* disp) {
	GE_context* ac = GE_current_context();
	uint32_t volatile in_qualified_call = ac->in_qualified_call;
	ac->in_qualified_call = 0;
	((GE_types[((EIF_REFERENCE)C)->id][0]).dispose)(ac, (EIF_REFERENCE) C);
	ac->in_qualified_call = in_qualified_call;
}

/*
 * Call dispose routine `disp' on once-per-object data `data'.
 */
void GE_boehm_dispose_once_per_object_data(void* data, void* disp) {
	((void (*) (void*)) disp)(data);
}
#endif

/* The C side protects an object. */
EIF_OBJECT eif_protect(EIF_REFERENCE object)
{
#ifdef GE_USE_BOEHM_GC
	EIF_REFERENCE* result = (EIF_REFERENCE*)GC_malloc_uncollectable(sizeof(EIF_REFERENCE));
	*result = object;
	return (EIF_OBJECT)result;
#else
	return (EIF_OBJECT)object;
#endif
}

/* The C side weans adopted object. */
EIF_REFERENCE eif_wean(EIF_OBJECT object)
{
#ifdef GE_USE_BOEHM_GC
	EIF_REFERENCE result = eif_access(object);
	GE_free(object);
	return result;
#else
	return (EIF_REFERENCE)object;
#endif
}

#ifdef __cplusplus
}
#endif

#endif
