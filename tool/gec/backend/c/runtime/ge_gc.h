/*
	description:

		"C functions used to access garbage collector facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2024, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef GE_GC_H
#define GE_GC_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_EXCEPTION_H
#include "ge_exception.h"
#endif

#ifdef GE_USE_BOEHM_GC
/*
 *	Use the Boehm garbage collector.
 *	See:
 *		http://en.wikipedia.org/wiki/Boehm_GC
 *		http://www.hpl.hp.com/personal/Hans_Boehm/gc/
 */

/* 
 * In the case of multithreaded code, gc.h should be included after the threads header file, 
 * and after defining the appropriate GC_XXXX_THREADS macro. (For 6.2alpha4 and later, 
 * simply defining GC_THREADS should suffice.) The header file gc.h must be included in files 
 * that use either GC or threads primitives, since threads primitives will be redefined to 
 * cooperate with the GC on many platforms. 
 * See: https://hboehm.info/gc/gcinterface.html
*/
#ifdef GE_USE_THREADS

#	ifndef GE_THREAD_TYPES_H
#		include "ge_thread_types.h"
#	endif

#	define GC_THREADS
#	define PARALLEL_MARK
#	define THREAD_LOCAL_ALLOC
#	define GC_ENABLE_SUSPEND_THREAD

#	if defined(GE_WINDOWS)
#		undef GC_NO_THREAD_DECLS
#		undef GC_NO_THREAD_REDIRECTS
#	elif !defined(GE_MACOS)
#		define GC_PTHREAD_START_STANDALONE
#		if defined(__clang__)
#			define HAVE_PTHREAD_SIGMASK
#		endif
#	endif /* GE_WINDOWS || !GE_MACOS */
#endif /* GE_USE_THREADS */

#define GC_NOT_DLL
#define ALL_INTERIOR_POINTERS
#define ENABLE_DISCLAIM
#define GC_ATOMIC_UNCOLLECTABLE
#define GC_GCJ_SUPPORT
#define JAVA_FINALIZATION
#define NO_EXECUTE_PERMISSION
#define USE_MMAP
#define USE_MUNMAP

#if defined(__clang__) || defined(__GNUC__) || defined(__MINGW32__) || defined(__MINGW64__)
#	define GC_BUILTIN_ATOMIC
#endif

#if defined(GE_WINDOWS)
#	define EMPTY_GETENV_RESULTS
#	define DONT_USE_USER32_DLL
#else
#	ifndef _REENTRANT
#		define _REENTRANT
#	endif
#	define HANDLE_FORK
#endif

#if defined(__clang__)
#	define HAVE_DL_ITERATE_PHDR
#	define GC_REQUIRE_WCSDUP
#	define HAVE_DLADDR
#	define HAVE_SYS_TYPES_H
#	define HAVE_UNISTD_H
#	if defined(GE_MACOS)
#		define HAVE_PTHREAD_SETNAME_NP_WITHOUT_TID
#	elif !defined(GE_WINDOWS)
#		define HAVE_PTHREAD_SETNAME_NP_WITH_TID
#		define NO_GETCONTEXT
#	endif
#endif

#include "gc.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * GC initialization.
 */

#ifdef GE_USE_BOEHM_GC
#ifdef GE_USE_THREADS
#define GE_init_gc() \
	GC_INIT(); \
	GC_allow_register_threads(); \
	GC_enable_incremental()
#else
#define GE_init_gc() \
	GC_INIT(); \
	GC_enable_incremental()
#endif
#else /* No GC */
#define GE_init_gc() /* do nothing */
#endif

/*
 * Memory allocation.
 */

/*
 * Allocate memory that can contain pointers to collectable objects.
 * The allocated memory is not necessarily zeroed (unless `GE_malloc_cleared' is_defined).
 * The allocated object is itself collectable.
 * Do not raise an exception when no-more-memory.
 */
#ifdef GE_USE_BOEHM_GC
#define GE_unprotected_malloc(size) GC_MALLOC(size)
#else /* No GC */
#define GE_unprotected_malloc(size) malloc(size)
#endif

/*
 * Allocate memory that can contain pointers to collectable objects.
 * The allocated memory is not necessarily zeroed (unless `GE_malloc_cleared' is_defined).
 * The allocated object is itself collectable.
 * Raise an exception when no-more-memory.
 */
#define GE_malloc(size) GE_null(GE_unprotected_malloc(size))

/*
 * Allocate memory that does not contain pointers to collectable objects.
 * The allocated memory is not necessarily zeroed (unless `GE_malloc_atomic_cleared' is_defined).
 * The allocated object is itself collectable.
 * Do not raise an exception when no-more-memory.
 */
#ifdef GE_USE_BOEHM_GC
#define GE_unprotected_malloc_atomic(size) GC_MALLOC_ATOMIC(size)
#else /* No GC */
#define GE_unprotected_malloc_atomic(size) GE_unprotected_malloc(size)
#endif

/*
 * Allocate memory that does not contain pointers to collectable objects.
 * The allocated memory is not necessarily zeroed (unless `GE_malloc_atomic_cleared' is_defined).
 * The allocated object is itself collectable.
 * Raise an exception when no-more-memory.
 */
#define GE_malloc_atomic(size) GE_null(GE_unprotected_malloc_atomic(size))

/*
 * Allocate memory that can contain pointers to collectable objects.
 * The allocated memory is zeroed.
 * The allocated object is itself collectable.
 * Do not raise an exception when no-more-memory.
 */
#ifdef GE_USE_BOEHM_GC
#define GE_unprotected_calloc(nelem, elsize) GC_MALLOC((nelem) * (elsize))
#else /* No GC */
#define GE_unprotected_calloc(nelem, elsize) calloc((nelem), (elsize))
#endif

/*
 * Allocate memory that can contain pointers to collectable objects.
 * The allocated memory is zeroed.
 * The allocated object is itself collectable.
 * Raise an exception when no-more-memory.
 */
#define GE_calloc(nelem, elsize) GE_null(GE_unprotected_calloc((nelem), (elsize)))

/*
 * Allocate memory that does not contain pointers to collectable objects.
 * The allocated memory is zeroed.
 * The allocated object is itself collectable.
 * Raise an exception when no-more-memory.
 */
#ifdef GE_USE_BOEHM_GC
#define GE_calloc_atomic(nelem, elsize) memset(GE_null(GC_MALLOC_ATOMIC((nelem) * (elsize))), 0, (nelem) * (elsize))
#else /* No GC */
#define GE_calloc_atomic(nelem, elsize) GE_calloc((nelem), (elsize))
#endif

/*
 * Allocate memory that can contain pointers to collectable objects.
 * The allocated memory is not necessarily zeroed (unless `GE_malloc_cleared' is_defined).
 * The allocated object is itself not collectable.
 * Do not raise an exception when no-more-memory.
 */
#ifdef GE_USE_BOEHM_GC
#define GE_unprotected_malloc_uncollectable(size) GC_MALLOC_UNCOLLECTABLE(size)
#else /* No GC */
#define GE_unprotected_malloc_uncollectable(size) malloc(size)
#endif

/*
 * Allocate memory that can contain pointers to collectable objects.
 * The allocated memory is not necessarily zeroed (unless `GE_malloc_cleared' is_defined).
 * The allocated object is itself not collectable.
 * Raise an exception when no-more-memory.
 */
#define GE_malloc_uncollectable(size) GE_null(GE_unprotected_malloc_uncollectable(size))

/*
 * Allocate memory that does not contain pointers to collectable objects.
 * The allocated memory is not necessarily zeroed (unless `GE_malloc_atomic_cleared' is_defined).
 * The allocated object is itself not collectable.
 * Do not raise an exception when no-more-memory.
 */
#ifdef GE_USE_BOEHM_GC
#define GE_unprotected_malloc_atomic_uncollectable(size) GC_malloc_atomic_uncollectable(size)
#else /* No GC */
#define GE_unprotected_malloc_atomic_uncollectable(size) malloc(size)
#endif

/*
 * Allocate memory that does not contain pointers to collectable objects.
 * The allocated memory is not necessarily zeroed (unless `GE_malloc_atomic_cleared' is_defined).
 * The allocated object is itself not collectable.
 * Raise an exception when no-more-memory.
 */
#define GE_malloc_atomic_uncollectable(size) GE_null(GE_unprotected_malloc_atomic_uncollectable(size))
/*
 * Allocate memory that can contain pointers to collectable objects.
 * The allocated memory is zeroed.
 * The allocated object is itself not collectable.
 * Do not raise an exception when no-more-memory.
 */
#ifdef GE_USE_BOEHM_GC
#define GE_unprotected_calloc_uncollectable(nelem, elsize) GC_MALLOC_UNCOLLECTABLE((nelem) * (elsize))
#else /* No GC */
#define GE_unprotected_calloc_uncollectable(nelem, elsize) calloc((nelem), (elsize))
#endif

/*
 * Allocate memory that can contain pointers to collectable objects.
 * The allocated memory is zeroed.
 * The allocated object is itself not collectable.
 * Raise an exception when no-more-memory.
 */
#define GE_calloc_uncollectable(nelem, elsize) GE_null(GE_unprotected_calloc_uncollectable((nelem), (elsize)))


/*
 * Allocate memory that does not contain pointers to collectable objects.
 * The allocated memory is zeroed.
 * The allocated object is itself not collectable.
 * Do not raise an exception when no-more-memory.
 */
#ifdef GE_USE_BOEHM_GC
extern void* GE_unprotected_calloc_atomic_uncollectable(size_t nelem, size_t elsize);
#else /* No GC */
#define GE_unprotected_calloc_atomic_uncollectable(nelem, elsize) GE_unprotected_calloc((nelem), (elsize))
#endif

/*
 * Allocate memory that does not contain pointers to collectable objects.
 * The allocated memory is zeroed.
 * The allocated object is itself not collectable.
 * Raise an exception when no-more-memory.
 */
#define GE_calloc_atomic_uncollectable(nelem, elsize) GE_null(GE_unprotected_calloc_atomic_uncollectable((nelem), (elsize)))

/*
 * Allocate more memory for the given pointer.
 * The reallocated pointer keeps the same properties (e.g. atomic or not, collectable or not).
 * The extra allocated memory is not necessarily zeroed.
 * Do not raise an exception when no-more-memory.
 */
#ifdef GE_USE_BOEHM_GC
#define GE_unprotected_realloc(p, size) GC_REALLOC((p), (size))
#else /* No GC */
#define GE_unprotected_realloc(p, size) realloc((p), (size))
#endif

/*
 * Allocate more memory for the given pointer.
 * The reallocated pointer keeps the same properties (e.g. atomic or not, collectable or not).
 * The extra allocated memory is not necessarily zeroed.
 * Raise an exception when no-more-memory.
 */
#define GE_realloc(p, size) GE_null(GE_unprotected_realloc((p), (size)))

/*
 * Allocate more memory for the given pointer.
 * The reallocated pointer keeps the same properties (e.g. atomic or not, collectable or not).
 * The extra allocated memory is zeroed.
 * Do not raise an exception when no-more-memory.
 */
extern void* GE_unprotected_recalloc(void* p, size_t old_nelem, size_t new_nelem, size_t elsize);

/*
 * Allocate more memory for the given pointer.
 * The reallocated pointer keeps the same properties (e.g. atomic or not, collectable or not).
 * The extra allocated memory is zeroed.
 * Raise an exception when no-more-memory.
 */
#define GE_recalloc(p, old_nelem, new_nelem, elsize) GE_null(GE_unprotected_recalloc((p), (old_nelem), (new_nelem), (elsize)))

/*
 * Explicitly deallocate an object.
 */
#ifdef GE_USE_BOEHM_GC
#define GE_free(p) GC_FREE(p)
#else /* No GC */
#define GE_free(p) free(p)
#endif

/*
 * When defined, `GE_malloc_cleared' means that `GE_malloc' and
 * `GE_malloc_uncollectable' make sure that the allocated memory
 * is zeroed.
 */
#ifdef GE_USE_BOEHM_GC
#define GE_malloc_cleared
#else /* No GC */
#endif

/*
 * When defined, `GE_malloc_atomic_cleared' means that `GE_malloc_atomic'
 * and `GE_malloc_atomic_uncollectable' make sure that the allocated memory
 * is zeroed.
 */
#ifdef GE_USE_BOEHM_GC
/* #define GE_malloc_atomic_cleared */
#else /* No GC */
#endif

/*
 * Dispose
 */

/*
 * Register dispose routine `disp' to be called on object `obj' when it will be collected.
 */
#ifdef GE_USE_BOEHM_GC
extern void GE_boehm_dispose(void* C, void* disp); /* Call dispose routine on object `C'. */
#define GE_register_dispose(obj, disp) GC_REGISTER_FINALIZER_NO_ORDER((void*)(obj), (void (*) (void*, void*)) &GE_boehm_dispose, (void*)(disp), NULL, NULL)
#else /* No GC */
#define GE_register_dispose(obj, disp) /* do nothing */
#endif

/*
 * Register dispose routine `disp' to be called on once-per-object `data' when it will be collected.
 */
#ifdef GE_USE_BOEHM_GC
extern void GE_boehm_dispose_once_per_object_data(void* data, void* disp); /* Call dispose routine `disp' on once-per-object data `data'. */
#define GE_register_dispose_once_per_object_data(data, disp) GC_REGISTER_FINALIZER_NO_ORDER((void*)(data), (void (*) (void*, void*)) &GE_boehm_dispose_once_per_object_data, (void*)(disp), NULL, NULL)
#else /* No GC */
#define GE_register_dispose_once_per_object_data(data, disp) /* do nothing */
#endif

/*
 * Access to objects, useful with GCs which move objects in memory.
 * This is not the case here, since the Boehm GC is not a moving GC.
 */

/* Access object through hector. */
#define eif_access(obj) (obj)
/* Freeze memory address. */
#define eif_freeze(obj) (obj)
/* The C side adopts an object. */
#define eif_adopt(obj) (obj)
/* The C side protects an object. */
#define eif_protect(obj) (obj)
/* The C side weans adopted object. */
#define eif_wean(obj) (obj)
/* Forget a frozen memory address. */
#define eif_unfreeze(obj)
/* Always frozen since they do not move. */
#define eif_frozen(obj) 1
/* Always frozen since they do not move. */
#define spfrozen(obj) 1

#ifdef __cplusplus
}
#endif

#endif
