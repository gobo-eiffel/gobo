/*
	description:

		"C declarations for the Gobo Eiffel runtime."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2005-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_EIFFEL_H
#define GE_EIFFEL_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#if defined(__USE_POSIX) || defined(__unix__) || defined(_POSIX_C_SOURCE)
#include <unistd.h>
#endif
#if !defined(WIN32) && \
	(defined(WINVER) || defined(_WIN32_WINNT) || defined(_WIN32) || \
	defined(__WIN32__) || defined(__TOS_WIN__) || defined(_MSC_VER) || \
	defined(__MINGW32__))
#define WIN32 1
#endif
#ifdef WIN32
#define EIF_WINDOWS 1
#include <windows.h>
#endif

#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include <stddef.h>

/* Platform definition */
/* Unix definition */
#define EIF_IS_UNIX EIF_TRUE
/* Windows definition */
#ifdef EIF_WINDOWS
#define EIF_IS_WINDOWS EIF_TRUE
#undef EIF_IS_UNIX
#define EIF_IS_UNIX EIF_FALSE
#else
#define EIF_IS_WINDOWS EIF_FALSE
#endif
/* VMS definition */
#ifdef EIF_VMS
#define EIF_IS_VMS EIF_TRUE
#undef EIF_IS_UNIX
#define EIF_IS_UNIX EIF_FALSE
#else
#define EIF_IS_VMS EIF_FALSE
#endif
/* MAC definition */
#ifdef EIF_MAC
#define EIF_IS_MAC EIF_TRUE
#undef EIF_IS_UNIX
#define EIF_IS_UNIX EIF_FALSE
#else
#define EIF_IS_MAC EIF_FALSE
#endif
/* VxWorks definition */
#ifdef EIF_VXWORKS
#define EIF_IS_VXWORKS EIF_TRUE
#undef EIF_IS_UNIX
#define EIF_IS_UNIX EIF_FALSE
#else
#define EIF_IS_VXWORKS EIF_FALSE
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifdef _MSC_VER /* MSVC */
typedef signed char int8_t;
typedef signed short int16_t;
typedef signed int int32_t;
typedef signed __int64 int64_t;
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
typedef unsigned __int64 uint64_t;
#else
#if defined (__BORLANDC__) && (__BORLANDC__ < 0x600) /* Borland before 6.0 */
typedef signed char int8_t;
typedef signed short int16_t;
typedef signed long int int32_t;
typedef signed __int64 int64_t;
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned __int64 uint64_t;
#else
#include <inttypes.h>
#endif
#endif

/* Portable integer pointers */
#ifdef EIF_WINDOWS
#ifndef _INTPTR_T_DEFINED
#define _INTPTR_T_DEFINED
#ifdef _WIN64
typedef __int64 intptr_t;
#else
typedef int intptr_t;
#endif
#endif
#endif

/* C type for underlying integer type identifying object's dynamic type. */
typedef uint16_t	EIF_TYPE_INDEX;

/*
 * Abstraction representing an Eiffel type.
 * It is made of a compiler type-id,
 * and of some annotations (attached/detachable/separate/variant/frozen).
 */
typedef struct eif_type {
	EIF_TYPE_INDEX id;
	EIF_TYPE_INDEX annotations;
} EIF_TYPE;

/*
 * Since EIF_TYPE and EIF_ENCODED_TYPE have the same size, the encoded version
 * is basically a memcpy version of the EIF_TYPE representation.
 * It is used to provide backward compatibility to most Eiffel and
 * C APIs manipulating types as an INTEGER.
 */
typedef int32_t	EIF_ENCODED_TYPE;
typedef EIF_ENCODED_TYPE	EIF_TYPE_ID;
#define EIF_NO_TYPE (EIF_TYPE_ID)(-1)

/* Basic Eiffel types */
typedef char EIF_BOOLEAN;
typedef unsigned char EIF_CHARACTER_8;
typedef uint32_t EIF_CHARACTER_32;
typedef int8_t EIF_INTEGER_8;
typedef int16_t EIF_INTEGER_16;
typedef int32_t EIF_INTEGER_32;
typedef int64_t EIF_INTEGER_64;
typedef uint8_t EIF_NATURAL_8;
typedef uint16_t EIF_NATURAL_16;
typedef uint32_t EIF_NATURAL_32;
typedef uint64_t EIF_NATURAL_64;
typedef void* EIF_POINTER;
typedef float EIF_REAL_32;
typedef double EIF_REAL_64;
typedef struct {EIF_TYPE_INDEX id; uint16_t flags;} EIF_ANY;
typedef EIF_ANY* EIF_REFERENCE;
typedef struct {EIF_TYPE_INDEX id; uint16_t flags; EIF_INTEGER_32 count; EIF_INTEGER_32 capacity;} EIF_SPECIAL;

#ifdef EIF_WINDOWS
typedef wchar_t EIF_NATIVE_CHAR;
#else
typedef char EIF_NATIVE_CHAR;
#endif
typedef EIF_NATIVE_CHAR* EIF_FILENAME;

#define EIF_VOID ((EIF_REFERENCE)0)
#define EIF_FALSE ((EIF_BOOLEAN)'\0')
#define EIF_TRUE ((EIF_BOOLEAN)'\1')
#define EIF_TEST(x) ((x) ? EIF_TRUE : EIF_FALSE)

#define EIF_IS_WORKBENCH EIF_FALSE
#define EIF_POINTER_DISPLAY "lX"

/* For INTEGER and NATURAL manifest constants */
#define GE_int8(x) x
#define GE_nat8(x) x
#define GE_int16(x) x
#define GE_nat16(x) x
#define GE_int32(x) x##L
#define GE_nat32(x) x##U
#if defined (_MSC_VER) && (_MSC_VER < 1400) /* MSC older than v8 */
#define GE_int64(x) x##i64
#define GE_nat64(x) x##ui64
#else
#if defined (__BORLANDC__) && (__BORLANDC__ < 0x600) /* Borland before 6.0 */
#define GE_int64(x) x##i64
#define GE_nat64(x) x##ui64
#else /* ISO C 99 */
#define GE_int64(x) x##LL
#define GE_nat64(x) x##ULL
#endif
#endif

extern EIF_REFERENCE GE_ms8(const char *s, EIF_INTEGER_32 c);
#define GE_str8(s) GE_ms8((s),strlen(s))

#ifdef _MSC_VER /* MSVC */
/* MSVC does not support ISO C 99's 'snprintf' from stdio.h */
#define snprintf(a,b,c,d) sprintf(a,c,d)
#endif

/*
 * Gobo compiler version.
 * Starts with 6080 (looks like GOBO) followed by 5 digits.
 */
#define GE_compiler_version() 608000001

/*
	Interoperability with ISE.
*/
#define RTI64C(x) GE_int64(x)
#define EIF_OBJECT EIF_REFERENCE
#define EIF_OBJ EIF_OBJECT
#define EIF_INTEGER EIF_INTEGER_32
#define EIF_CHARACTER EIF_CHARACTER_8
#define EIF_REAL EIF_REAL_32
#define EIF_DOUBLE EIF_REAL_64
/* Function pointer call to make sure all arguments are correctly pushed onto stack. */
/* FUNCTION_CAST is for standard C calls. */
/* FUNCTION_CAST_TYPE is for non-standard C calls. */
#define FUNCTION_CAST(r_type,arg_types) (r_type (*) arg_types)
#define FUNCTION_CAST_TYPE(r_type,call_type,arg_types) (r_type (call_type *) arg_types)
#define SIGBLOCK
#define SIGRESUME
#define rt_public				/* default C scope */
#define rt_private static		/* static outside a block means private */
#define rt_shared				/* data shared between modules, but not public */
#define RTMS(s) GE_str8(s)
#define RTMS_EX(s,c) GE_ms8((s),(c))

#ifdef __cplusplus
}
#endif

#endif

/*
	description:

		"C functions used to manipulate native strings"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_NATIVE_STRING_H
#define GE_NATIVE_STRING_H

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#include <string.h>
#ifndef EIF_WINDOWS
#include <sys/types.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_WINDOWS

	/* Macro used to manipulate native string, i.e: (wchar_t*) */
#define GE_nstrlen wcslen /* size of string */
#define GE_nstrncpy wcsncpy /* Copy n characters of one string to another */
#define GE_nstrcpy wcscpy /* Copy one string to another */
#define GE_nstrncat wcsncat /* Append characters of a string */
#define GE_nstrcat wcscat /* Append a string */
#define GE_nstrstr wcsstr /* Return a pointer to the first occurrence of a search string in a string. */
#define GE_nmakestr(quote) L##quote /* Manifest Native string declaration */
#define GE_nstr_fopen	_wfopen /* Open file using native string name */
#define GE_nstrcmp wcscmp /* Compare two strings. */
#define GE_nstrdup _wcsdup /* Duplicate string. */

#define GE_nstr_cat_ascii(dest, src) { 						\
		int i;													\
		size_t dest_len, src_len;								\
		dest_len = rt_nstrlen (dest);							\
		src_len = strlen (src);									\
		for (i = 0; i < src_len; i++) {							\
			dest[dest_len + i] = (EIF_NATIVE_CHAR) src[i];		\
		}														\
		dest[dest_len + src_len] = (EIF_NATIVE_CHAR) 0;			\
	}

#else /* not EIF_WINDOWS */

	/* Macro used to manipulate native string, i.e: (char*) */
#define GE_nstrlen  strlen /* size of string */
#define GE_nstrncpy strncpy /* Copy n characters of one string to another */
#define GE_nstrcpy strcpy /* Copy one string to another */
#define GE_nstrncat strncat /* Append characters of a string */
#define GE_nstrcat strcat /* Append a string */
#define GE_nstrstr strstr /* Return a pointer to the first occurrence of a search string in a string. */
#define GE_nmakestr(quote) quote /* Manifest Native string declaration */
#define GE_nstr_fopen	fopen /* Open file using native string name */
#define GE_nstrcmp strcmp /* Compare two strings. */
#define GE_nstrdup strdup /* Duplicate string. */

#define GE_nstr_cat_ascii strcat

#endif


#ifdef __cplusplus
}
#endif

#endif

/*
	description:

		"C functions used to implement class ARGUMENTS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_ARGUMENTS_H
#define GE_ARGUMENTS_H

#ifdef __cplusplus
extern "C" {
#endif

extern int GE_argc;
extern EIF_NATIVE_CHAR** GE_argv;

#ifdef __cplusplus
}
#endif

#endif

/*
	description:

		"C functions used to implement class EXCEPTION"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_EXCEPTION_H
#define GE_EXCEPTION_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_EIFFEL_H
#include "ge_eiffel.h"
#endif
#include <setjmp.h>

/*
 * On Linux glibc systems, we need to use sig* versions of jmp_buf,
 * setjmp and longjmp to preserve the signal handling context.
 * One way to detect this is if _SIGSET_H_types has
 * been defined in /usr/include/setjmp.h.
 * NOTE: ANSI only recognizes the non-sig versions.
 */
#if (defined(_SIGSET_H_types) && !defined(__STRICT_ANSI__))
#define GE_jmp_buf sigjmp_buf
#define GE_setjmp(x) sigsetjmp((x),1)
#define GE_longjmp(x,y) siglongjmp((x),(y))
#else
#define GE_jmp_buf jmp_buf
#define GE_setjmp(x) setjmp((x))
#define GE_longjmp(x,y) longjmp((x),(y))
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Predefined exception codes.
 */
#define GE_EX_VOID		1			/* Feature applied to void reference */
#define GE_EX_MEM		2			/* No more memory */
#define GE_EX_PRE		3			/* Pre-condition violated */
#define GE_EX_POST		4			/* Post-condition violated */
#define GE_EX_FLOAT		5			/* Floating point exception (signal SIGFPE) */
#define GE_EX_CINV		6			/* Class invariant violated */
#define GE_EX_CHECK		7			/* Check instruction violated */
#define GE_EX_FAIL		8			/* Routine failure */
#define GE_EX_WHEN		9			/* Unmatched inspect value */
#define GE_EX_VAR		10			/* Non-decreasing loop variant */
#define GE_EX_LINV		11			/* Loop invariant violated */
#define GE_EX_SIG		12			/* Operating system signal */
#define GE_EX_BYE		13			/* Eiffel run-time panic */
#define GE_EX_RESC		14			/* Exception in rescue clause */
#define GE_EX_OMEM		15			/* Out of memory (cannot be ignored) */
#define GE_EX_RES		16			/* Resumption failed (retry did not succeed) */
#define GE_EX_CDEF		17			/* Create on deferred */
#define GE_EX_EXT		18			/* External event */
#define GE_EX_VEXP		19			/* Void assigned to expanded */
#define GE_EX_HDLR		20			/* Exception in signal handler */
#define GE_EX_IO		21			/* I/O error */
#define GE_EX_SYS		22			/* Operating system error */
#define GE_EX_RETR		23			/* Retrieval error */
#define GE_EX_PROG		24			/* Developer exception */
#define GE_EX_FATAL		25			/* Eiffel run-time fatal error */
#define GE_EX_DOL		26			/* $ applied to melted feature */
#define GE_EX_ISE_IO	27			/* I/O error raised by the ISE Eiffel runtime */
#define GE_EX_COM		28			/* COM error raised by EiffelCOM runtime */
#define GE_EX_RT_CHECK	29			/* Runtime check error such as out-of-bound array access */
#define GE_EX_OLD		30			/* Old violation */
#define GE_EX_SEL		31			/* Serialization failure */
#define GE_EX_DIRTY		32			/* SCOOP processor dirty exception. */
#define GE_EX_NEX		32			/* Number of internal exceptions */

/*
 * String buffer used to build the exception trace.
 */
typedef struct GE_exception_trace_buffer_struct GE_exception_trace_buffer;
struct GE_exception_trace_buffer_struct {
	char* area;
	uint32_t count;
	uint32_t capacity;
};

/*
 * Information about the feature being executed.
 */
typedef struct GE_call_struct GE_call;
struct GE_call_struct {
#ifdef EIF_CURRENT_IN_EXCEPTION_TRACE
	void* object; /* Current object */
#endif
	const char* class_name;
	const char* feature_name;
	GE_call* caller; /* previous feature in the call chain */
};

/*
 * Context of features containing a rescue clause.
 */
typedef struct GE_rescue_struct GE_rescue;
struct GE_rescue_struct {
	GE_jmp_buf jb;
	GE_rescue* previous; /* previous context in the call chain */
};

/*
 * Information about the execution context.
 * One such struct per thread.
 */
typedef struct GE_thread_context_struct GE_thread_context;
typedef struct GE_context_struct GE_context;
struct GE_context_struct {
	GE_call* call; /* Call stack */
	uint32_t in_assertion; /* Is an assertion evaluated? */
	GE_rescue* last_rescue; /* Context of last feature entered containing a rescue clause */
	uint32_t in_rescue; /* Number of rescue clauses currently being executed */
	EIF_REFERENCE exception_manager; /* Exception manager */
	char raising_exception; /* Is an exception currently being raised? */
	char exception_trace_enabled; /* Should exception trace be displayed? */
	long exception_code; /* Code of the exception currently being raised, 0 otherwise */
	const char* exception_tag; /* Tag of the exception currently being raised, NULL otherwise */
	GE_exception_trace_buffer exception_trace_buffer; /* String buffer used to build the exception trace */
	GE_exception_trace_buffer last_exception_trace; /* Last non-routine-failure exception trace */
	int pre_ecma_mapping_status; /* Do we map old names to new name? (i.e. STRING to STRING_8, INTEGER to INTEGER_32, ...). */
#ifdef EIF_THREADS
	GE_thread_context* thread; /* Thread context */
#endif
};

/*
 * Default initialization for `GE_context'.
 */
extern GE_context GE_default_context;

/*
 * Execution context of main thread.
 */
extern GE_context* GE_main_context;

/*
 * Execution context of current thread.
 */
extern GE_context* GE_current_context();

/*
 * Initialization of exception handling.
 */
extern void GE_init_exception(GE_context* context);

/*
 * Pointer to function to create a new exception manager object.
 */
extern EIF_REFERENCE (*GE_new_exception_manager)(EIF_BOOLEAN);

/*
 * Pointer to Eiffel routine EXCEPTION_MANAGER.init_exception_manager.
 */
extern void (*GE_init_exception_manager)(GE_context*, EIF_REFERENCE);

/*
 * Pointer to Eiffel routine EXCEPTION_MANAGER.set_exception_data.
 */
extern void (*GE_set_exception_data)(GE_context*, EIF_REFERENCE, EIF_INTEGER_32, EIF_BOOLEAN, EIF_INTEGER_32, EIF_INTEGER_32, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_INTEGER_32, EIF_BOOLEAN);

/*
 * Exception tag associated with `code'.
 */
extern char* GE_exception_tag(long code);

/*
 * Raise an exception with code `code'.
 */
extern void GE_raise(long code);

/*
 * Raise an exception with code `code' and message `msg'.
 */
extern void GE_raise_with_message(long code, const char* msg);

/*
 * Raise an exception from EXCEPTION_MANAGER.
 */
extern void GE_developer_raise(long code, char* meaning, char* message);

/*
 * Set `in_assertion' to 'not b'.
 * Return the opposite of previous value.
 */
extern EIF_BOOLEAN GE_check_assert(EIF_BOOLEAN b);

/*
 * Check whether the type id of `obj' is not in `type_ids'.
 * If it is, then raise a CAT-call exception. Don't do anything if `obj' is Void.
 * `nb' is the number of ids in `type_ids' and is expected to be >0.
 * `type_ids' is sorted in increasing order.
 * Return `obj'.
 */
#define GE_catcall(obj,type_ids,nb) GE_check_catcall((obj),(type_ids),(nb))
extern EIF_REFERENCE GE_check_catcall(EIF_REFERENCE obj, EIF_TYPE_INDEX type_ids[], int nb);

/*
 * Check whether `obj' is Void.
 * If it is, then raise a call-on-void-target exception.
 * Return `obj'.
 */
#define GE_void(obj) (!(obj)?GE_check_void(obj):(obj))
extern EIF_REFERENCE GE_check_void(EIF_REFERENCE obj);

/*
 * Check whether `ptr' is a null pointer.
 * If it is, then raise a no-more-memory exception.
 * Return `ptr'.
 */
#define GE_null(ptr) GE_check_null(ptr)
extern void* GE_check_null(void* ptr);

#ifdef EIF_WINDOWS
/*
 * Set default exception handler.
 */
extern void GE_set_windows_exception_filter();
#endif

#ifdef __cplusplus
}
#endif

#endif

/*
	description:

		"C functions used to implement type information"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_TYPES_H
#define GE_TYPES_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_EIFFEL_H
#include "ge_eiffel.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Type annotations.
 * When a type has no annotation, it means a detachable, non-separate, variant type.
 * In all other cases, there will be an annotation.
 */
#define ANNOTATION_MASK			0x007F	/* All possible annotations. */
#define ATTACHED_FLAG			0x0001
#define DETACHABLE_FLAG			0x0002	/* Only present when overriding an attached type. */
#define SEPARATE_FLAG			0x0004
#define VARIANT_FLAG			0x0008	/* Only present when overriding a frozen/poly type. */
#define UNUSABLE_FLAG			0x0010	/* Reserved for backward compatibility for storables. */
#define FROZEN_FLAG				0x0020
#define POLY_FLAG				0x0040

/*
 * Type flags.
 */
#define GE_TYPE_FLAG_SPECIAL		0x10
#define GE_TYPE_FLAG_TUPLE			0x20
#define GE_TYPE_FLAG_EXPANDED		0x40
#define GE_TYPE_FLAG_NONE			0x80
#define GE_TYPE_FLAG_BASIC_MASK		0x0F /* One of "BOOLEAN", "CHARACTER_8", "CHARACTER_32", "INTEGER_8", "INTEGER_16", "INTEGER_32", "INTEGER_64", "NATURAL_8", "NATURAL_16", "NATURAL_32", "NATURAL_64", "POINTER", "REAL_32", "REAL_64" */
#define GE_TYPE_FLAG_BOOLEAN		0x01
#define GE_TYPE_FLAG_CHARACTER_8	0x02
#define GE_TYPE_FLAG_CHARACTER_32	0x03
#define GE_TYPE_FLAG_INTEGER_8		0x04
#define GE_TYPE_FLAG_INTEGER_16		0x05
#define GE_TYPE_FLAG_INTEGER_32		0x06
#define GE_TYPE_FLAG_INTEGER_64		0x07
#define GE_TYPE_FLAG_NATURAL_8		0x08
#define GE_TYPE_FLAG_NATURAL_16		0x09
#define GE_TYPE_FLAG_NATURAL_32		0x0A
#define GE_TYPE_FLAG_NATURAL_64		0x0B
#define GE_TYPE_FLAG_POINTER		0x0C
#define GE_TYPE_FLAG_REAL_32		0x0D
#define GE_TYPE_FLAG_REAL_64		0x0E

/*
 * Convention for attribute types.
 * The values are in sync with REFLECTOR_CONSTANTS.
 */
#define GE_TYPE_KIND_INVALID		-1
#define GE_TYPE_KIND_POINTER		0
#define GE_TYPE_KIND_REFERENCE		1
#define GE_TYPE_KIND_CHARACTER_8	2
#define GE_TYPE_KIND_BOOLEAN		3
#define GE_TYPE_KIND_INTEGER_32		4
#define GE_TYPE_KIND_REAL_32		5
#define GE_TYPE_KIND_REAL_64		6
#define GE_TYPE_KIND_EXPANDED		7
#define GE_TYPE_KIND_INTEGER_8		9
#define GE_TYPE_KIND_INTEGER_16		10
#define GE_TYPE_KIND_INTEGER_64 	11
#define GE_TYPE_KIND_CHARACTER_32	12
#define GE_TYPE_KIND_NATURAL_8		13
#define GE_TYPE_KIND_NATURAL_16		14
#define GE_TYPE_KIND_NATURAL_32 	15
#define GE_TYPE_KIND_NATURAL_64 	16

/*
 * Object flags.
 */
#define GE_OBJECT_FLAG_MARKED		0x0001

/*
 * Ancestor relationship between two types X and Y.
 */
#ifdef GE_USE_ANCESTORS
typedef struct {
	EIF_TYPE_INDEX type_id; /* Type id of Y */
	EIF_BOOLEAN conforms; /* Does X conform to Y? */
	void (**qualified_calls)(); /* Function pointers, indexed by call id, when the static type of the target is Y and the dynamic type is X */
} GE_ancestor;
#endif

/*
 * Attribute.
 */
#ifdef GE_USE_ATTRIBUTES
typedef struct {
#ifdef GE_USE_ATTRIBUTE_NAME
	const char* name; /* Attribute name */
#endif
#ifdef GE_USE_ATTRIBUTE_TYPE_ID
	EIF_ENCODED_TYPE type_id; /* Static type id */
#endif
#ifdef GE_USE_ATTRIBUTE_OFFSET
	uint32_t offset; /* Address offset in object */
#endif
} GE_attribute;
#endif

/*
 * Type information.
 */
typedef struct {
	EIF_TYPE_INDEX type_id;
	uint8_t flags;
#ifdef GE_USE_TYPE_GENERATOR
	const char* generator; /* Generator class name */
#endif
#ifdef GE_USE_TYPE_NAME
	const char* name; /* Full type name */
#endif
#ifdef GE_USE_TYPE_GENERIC_PARAMETERS
	EIF_ENCODED_TYPE* generic_parameters;
	uint32_t generic_parameter_count;
#endif
#ifdef GE_USE_ANCESTORS
	GE_ancestor** ancestors;
	uint32_t ancestor_count;
#endif
#ifdef GE_USE_ATTRIBUTES
	GE_attribute** attributes;
	uint32_t attribute_count;
#endif
#ifdef GE_USE_TYPE_OBJECT_SIZE
	uint64_t object_size;
#endif
	EIF_REFERENCE (*new_instance)();
	void (*dispose)(GE_context*, EIF_REFERENCE);
} GE_type_info;

typedef struct {
	EIF_TYPE_INDEX id; /* Type id of the "TYPE [X]" object */
	EIF_INTEGER type_id; /* Type id of the type "X" */
	EIF_BOOLEAN is_special;
	void (*dispose)(GE_context*, EIF_REFERENCE);
	EIF_REFERENCE a1; /* runtime_name */
} EIF_TYPE_OBJ;

/*
 * Types indexed by type id.
 * Generated by the compiler.
 */
extern EIF_TYPE_OBJ GE_types[];
extern GE_type_info GE_type_infos[];

/*
 * Number of type infos in `GE_type_infos'.
 * Do not take into account the fake item at index 0.
 */
extern int GE_type_info_count;

/*
 * Encode a EIF_TYPE into a EIF_ENCODED_TYPE.
 * The lower part of EIF_ENCODED_TYPE contains the .id field,
 * and the upper part the .annotations.
 */
extern EIF_ENCODED_TYPE GE_encoded_type(EIF_TYPE a_type);

/*
 * Decode a EIF_ENCODED_TYPE into a EIF_TYPE.
 * The lower part of EIF_ENCODED_TYPE contains the .id field,
 * and the upper part the .annotations.
 */
extern EIF_TYPE GE_decoded_type(EIF_ENCODED_TYPE a_type);

/*
 * Type with `a_id' and `a_annotations'.
 */
extern EIF_TYPE GE_new_type(EIF_TYPE_INDEX a_id, EIF_TYPE_INDEX a_annotations);

/*
 * Type of object `obj'.
 */
#define GE_object_type(obj)	GE_new_type(((EIF_REFERENCE)(obj))->id, 0x0)
#define GE_object_encoded_type(obj) GE_encoded_type(GE_object_type(obj))

/*
 * Attachment status of `a_type'.
 */
#define GE_is_attached_type(a_type) EIF_TEST((a_type).annotations & ATTACHED_FLAG)
#define GE_is_attached_encoded_type(a_type) GE_is_attached_type(GE_decoded_type(a_type))

/*
 * Associated detachable type of `a_type' if any,
 * otherwise `a_type'.
 */
extern EIF_TYPE GE_non_attached_type(EIF_TYPE a_type);
#define GE_non_attached_encoded_type(a_type) GE_encoded_type(GE_non_attached_type(GE_decoded_type(a_type)))

/*
 * Associated attached type of `a_type' if any,
 * otherwise `a_type'.
 */
extern EIF_TYPE GE_attached_type(EIF_TYPE a_type);
#define GE_attached_encoded_type(t) GE_encoded_type(GE_attached_type(GE_decoded_type(t)))

/*
 * Is `a_type' a SPECIAL type?
 */
#define GE_is_special_type_index(a_type) EIF_TEST(GE_type_infos[a_type].flags & GE_TYPE_FLAG_SPECIAL)
#define GE_is_special_encoded_type(a_type) GE_is_special_type_index(GE_decoded_type(a_type).id)
#define GE_is_special_object(obj) GE_is_special_type_index(((EIF_REFERENCE)(obj))->id)

/*
 * Is `a_type' a SPECIAL type of user-defined expanded type?
 */
extern EIF_BOOLEAN GE_is_special_of_expanded_type_index(EIF_TYPE_INDEX a_type);
#define GE_is_special_of_expanded_encoded_type(a_type) GE_is_special_of_expanded_type_index(GE_decoded_type(a_type).id)
#define GE_is_special_of_expanded_object(obj) GE_is_special_of_expanded_type_index(((EIF_REFERENCE)(obj))->id)

/*
 * Is `a_type' a SPECIAL type of reference type?
 */
extern EIF_BOOLEAN GE_is_special_of_reference_type_index(EIF_TYPE_INDEX a_type);
#define GE_is_special_of_reference_encoded_type(a_type) GE_is_special_of_reference_type_index(GE_decoded_type(a_type).id)
#define GE_is_special_of_reference_object(obj) GE_is_special_of_reference_type_index(((EIF_REFERENCE)(obj))->id)

/*
 * Is `a_type' a SPECIAL type of reference type or basic expanded type?
 * (Note that user-defined expanded types are excluded.)
 */
extern EIF_BOOLEAN GE_is_special_of_reference_or_basic_expanded_type_index(EIF_TYPE_INDEX a_type);
#define GE_is_special_of_reference_or_basic_expanded_encoded_type(a_type) GE_is_special_of_reference_or_basic_expanded_type_index(GE_decoded_type(a_type).id)
#define GE_is_special_of_reference_or_basic_expanded_object(obj) GE_is_special_of_reference_or_basic_expanded_type_index(((EIF_REFERENCE)(obj))->id)

/*
 * Is `a_type' a TUPLE type?
 */
#define GE_is_tuple_type_index(a_type) EIF_TEST(GE_type_infos[a_type].flags & GE_TYPE_FLAG_TUPLE)
#define GE_is_tuple_encoded_type(a_type) GE_is_tuple_type_index(GE_decoded_type(a_type).id)
#define GE_is_tuple_object(obj) GE_is_tuple_type_index(((EIF_REFERENCE)(obj))->id)

/*
 * Is `a_type' an expanded type?
 */
#define GE_is_expanded_type_index(a_type) EIF_TEST(GE_type_infos[a_type].flags & GE_TYPE_FLAG_EXPANDED)
#define GE_is_expanded_encoded_type(a_type) GE_is_expanded_type_index(GE_decoded_type(a_type).id)
#define GE_is_expanded_object(obj) GE_is_expanded_type_index(((EIF_REFERENCE)(obj))->id)

/*
 * Does `i'-th field of `a_object + a_physical_offset' (which is expected to be reference)
 * denote a reference with copy semantics?
 */
extern EIF_BOOLEAN GE_is_copy_semantics_field(EIF_INTEGER i, EIF_POINTER a_object, EIF_INTEGER a_physical_offset);

/*
 * Does `i'-th item of special `a_object' (which is expected to be reference)
 * denote a reference with copy semantics?
 */
extern EIF_BOOLEAN GE_is_special_copy_semantics_item(EIF_INTEGER i, EIF_POINTER a_object);

/*
 * Generator class name of `a_type'.
 */
extern EIF_REFERENCE GE_generator_of_type_index(EIF_TYPE_INDEX a_type);
#define GE_generator_of_encoded_type(a_type) GE_generator_of_type_index(GE_decoded_type(a_type).id)

/*
 * Full name of `a_type'.
 */
extern EIF_REFERENCE GE_generating_type_of_encoded_type(EIF_ENCODED_TYPE a_type);

/*
 * Encoded type whose name is `a_name'.
 * -1 if no such type.
 */
extern EIF_ENCODED_TYPE GE_encoded_type_from_name(EIF_POINTER a_name);

/*
 * Does `a_type_1' conform to `a_type_2'?
 */
extern EIF_BOOLEAN GE_encoded_type_conforms_to(EIF_ENCODED_TYPE a_type_1, EIF_ENCODED_TYPE a_type_2);

/*
 * Number of generic parameters.
 */
extern EIF_INTEGER GE_generic_parameter_count_of_type_index(EIF_TYPE_INDEX a_type);
#define GE_generic_parameter_count_of_encoded_type(a_type) GE_generic_parameter_count_of_type_index(GE_decoded_type(a_type).id)

/*
 * Type of `i'-th generic parameter of `a_type'.
 */
extern EIF_INTEGER GE_generic_parameter_of_type_index(EIF_TYPE_INDEX a_type, EIF_INTEGER i);
#define GE_generic_parameter_of_encoded_type(a_type,i) GE_generic_parameter_of_type_index(GE_decoded_type(a_type).id, (i))

/*
 * Number of fields of an object of dynamic type `a_type'.
 */
extern EIF_INTEGER GE_field_count_of_type_index(EIF_TYPE_INDEX a_type);
#define GE_field_count_of_encoded_type(a_type) GE_field_count_of_type_index(GE_decoded_type(a_type).id)

/*
 * Physical offset of the `i'-th field for an object of dynamic type `a_type'.
 */
extern EIF_INTEGER GE_field_offset_of_type_index(EIF_INTEGER i, EIF_TYPE_INDEX a_type);
#define GE_field_offset_of_encoded_type(i, a_type) GE_field_offset_of_type_index((i), GE_decoded_type(a_type).id)

/*
 * Name of the `i'-th field for an object of dynamic type `a_type'.
 */
extern EIF_POINTER GE_field_name_of_type_index(EIF_INTEGER i, EIF_TYPE_INDEX a_type);
#define GE_field_name_of_encoded_type(i, a_type) GE_field_name_of_type_index((i), GE_decoded_type(a_type).id)

/*
 * Static type of the `i'-th field for an object of dynamic type `a_type'.
 */
extern EIF_INTEGER GE_field_static_type_of_type_index(EIF_INTEGER i, EIF_TYPE_INDEX a_type);
#define GE_field_static_type_of_encoded_type(i, a_type) GE_field_static_type_of_type_index((i), GE_decoded_type(a_type).id)

/*
 * Kind of type of the `i'-th field for an object of dynamic type `a_type'.
 */
extern EIF_INTEGER GE_field_type_kind_of_type_index(EIF_INTEGER i, EIF_TYPE_INDEX a_type);
#define GE_field_type_kind_of_encoded_type(i, a_type) GE_field_type_kind_of_type_index((i), GE_decoded_type(a_type).id)

/*
 * Physical size of `a_object'.
 */
extern EIF_NATURAL_64 GE_object_size(EIF_POINTER a_object);

/*
 * Is `i'-th field of objects of type `a_type' a user-defined expanded attribute?
 */
extern EIF_BOOLEAN GE_is_field_expanded_of_type_index(EIF_INTEGER i, EIF_TYPE_INDEX a_type);
#define GE_is_field_expanded_of_encoded_type(i, a_type) GE_is_field_expanded_of_type_index((i), GE_decoded_type(a_type).id)

#define GE_field_address_at(a_field_offset, a_object, a_physical_offset) ((char*)(a_object) + (a_physical_offset) + (a_field_offset))
#define GE_object_at_offset(a_enclosing, a_physical_offset) (EIF_REFERENCE)(GE_field_address_at(0, (a_enclosing), (a_physical_offset)))
#define GE_raw_object_at_offset(a_enclosing, a_physical_offset) (EIF_POINTER)(GE_field_address_at(0, (a_enclosing), (a_physical_offset)))
#define GE_object_encoded_type_at_offset(a_enclosing, a_physical_offset) GE_object_encoded_type(GE_raw_object_at_offset((a_enclosing), (a_physical_offset)))
#define GE_boolean_field_at(a_field_offset, a_object, a_physical_offset) *(EIF_BOOLEAN*)(GE_field_address_at((a_field_offset), (a_object), (a_physical_offset)))
#define GE_character_8_field_at(a_field_offset, a_object, a_physical_offset) *(EIF_CHARACTER_8*)(GE_field_address_at((a_field_offset), (a_object), (a_physical_offset)))
#define GE_character_32_field_at(a_field_offset, a_object, a_physical_offset) *(EIF_CHARACTER_32*)(GE_field_address_at((a_field_offset), (a_object), (a_physical_offset)))
#define GE_integer_8_field_at(a_field_offset, a_object, a_physical_offset) *(EIF_INTEGER_8*)(GE_field_address_at((a_field_offset), (a_object), (a_physical_offset)))
#define GE_integer_16_field_at(a_field_offset, a_object, a_physical_offset) *(EIF_INTEGER_16*)(GE_field_address_at((a_field_offset), (a_object), (a_physical_offset)))
#define GE_integer_32_field_at(a_field_offset, a_object, a_physical_offset) *(EIF_INTEGER_32*)(GE_field_address_at((a_field_offset), (a_object), (a_physical_offset)))
#define GE_integer_64_field_at(a_field_offset, a_object, a_physical_offset) *(EIF_INTEGER_64*)(GE_field_address_at((a_field_offset), (a_object), (a_physical_offset)))
#define GE_natural_8_field_at(a_field_offset, a_object, a_physical_offset) *(EIF_NATURAL_8*)(GE_field_address_at((a_field_offset), (a_object), (a_physical_offset)))
#define GE_natural_16_field_at(a_field_offset, a_object, a_physical_offset) *(EIF_NATURAL_16*)(GE_field_address_at((a_field_offset), (a_object), (a_physical_offset)))
#define GE_natural_32_field_at(a_field_offset, a_object, a_physical_offset) *(EIF_NATURAL_32*)(GE_field_address_at((a_field_offset), (a_object), (a_physical_offset)))
#define GE_natural_64_field_at(a_field_offset, a_object, a_physical_offset) *(EIF_NATURAL_64*)(GE_field_address_at((a_field_offset), (a_object), (a_physical_offset)))
#define GE_pointer_field_at(a_field_offset, a_object, a_physical_offset) *(EIF_POINTER*)(GE_field_address_at((a_field_offset), (a_object), (a_physical_offset)))
#define GE_real_32_field_at(a_field_offset, a_object, a_physical_offset) *(EIF_REAL_32*)(GE_field_address_at((a_field_offset), (a_object), (a_physical_offset)))
#define GE_real_64_field_at(a_field_offset, a_object, a_physical_offset) *(EIF_REAL_64*)(GE_field_address_at((a_field_offset), (a_object), (a_physical_offset)))
#define GE_raw_reference_field_at(a_field_offset, a_object, a_physical_offset) (EIF_POINTER)*(EIF_REFERENCE*)(GE_field_address_at((a_field_offset), (a_object), (a_physical_offset)))
#define GE_reference_field_at(a_field_offset, a_object, a_physical_offset) *(EIF_REFERENCE*)(GE_field_address_at((a_field_offset), (a_object), (a_physical_offset)))
#define GE_set_boolean_field_at(a_field_offset, a_object, a_physical_offset, a_value) GE_boolean_field_at((a_field_offset), (a_object), (a_physical_offset)) = a_value
#define GE_set_character_8_field_at(a_field_offset, a_object, a_physical_offset, a_value) GE_character_8_field_at((a_field_offset), (a_object), (a_physical_offset)) = a_value
#define GE_set_character_32_field_at(a_field_offset, a_object, a_physical_offset, a_value) GE_character_32_field_at((a_field_offset), (a_object), (a_physical_offset)) = a_value
#define GE_set_integer_8_field_at(a_field_offset, a_object, a_physical_offset, a_value) GE_integer_8_field_at((a_field_offset), (a_object), (a_physical_offset)) = a_value
#define GE_set_integer_16_field_at(a_field_offset, a_object, a_physical_offset, a_value) GE_integer_16_field_at((a_field_offset), (a_object), (a_physical_offset)) = a_value
#define GE_set_integer_32_field_at(a_field_offset, a_object, a_physical_offset, a_value) GE_integer_32_field_at((a_field_offset), (a_object), (a_physical_offset)) = a_value
#define GE_set_integer_64_field_at(a_field_offset, a_object, a_physical_offset, a_value) GE_integer_64_field_at((a_field_offset), (a_object), (a_physical_offset)) = a_value
#define GE_set_natural_8_field_at(a_field_offset, a_object, a_physical_offset, a_value) GE_natural_8_field_at((a_field_offset), (a_object), (a_physical_offset)) = a_value
#define GE_set_natural_16_field_at(a_field_offset, a_object, a_physical_offset, a_value) GE_natural_16_field_at((a_field_offset), (a_object), (a_physical_offset)) = a_value
#define GE_set_natural_32_field_at(a_field_offset, a_object, a_physical_offset, a_value) GE_natural_32_field_at((a_field_offset), (a_object), (a_physical_offset)) = a_value
#define GE_set_natural_64_field_at(a_field_offset, a_object, a_physical_offset, a_value) GE_natural_64_field_at((a_field_offset), (a_object), (a_physical_offset)) = a_value
#define GE_set_pointer_field_at(a_field_offset, a_object, a_physical_offset, a_value) GE_pointer_field_at((a_field_offset), (a_object), (a_physical_offset)) = a_value
#define GE_set_real_32_field_at(a_field_offset, a_object, a_physical_offset, a_value) GE_real_32_field_at((a_field_offset), (a_object), (a_physical_offset)) = a_value
#define GE_set_real_64_field_at(a_field_offset, a_object, a_physical_offset, a_value) GE_real_64_field_at((a_field_offset), (a_object), (a_physical_offset)) = a_value
#define GE_set_reference_field_at(a_field_offset, a_object, a_physical_offset, a_value) GE_reference_field_at((a_field_offset), (a_object), (a_physical_offset)) = a_value

#if defined(GE_USE_ATTRIBUTES) && defined(GE_USE_ATTRIBUTE_OFFSET)
#define GE_field_address(i, a_object, a_physical_offset) GE_field_address_at(GE_type_infos[((EIF_REFERENCE)(a_object))->id].attributes[(i) - 1]->offset, (a_object), (a_physical_offset))
#define GE_boolean_field(i, a_object, a_physical_offset) *(EIF_BOOLEAN*)(GE_field_address((i), (a_object), (a_physical_offset)))
#define GE_character_8_field(i, a_object, a_physical_offset) *(EIF_CHARACTER_8*)(GE_field_address((i), (a_object), (a_physical_offset)))
#define GE_character_32_field(i, a_object, a_physical_offset) *(EIF_CHARACTER_32*)(GE_field_address((i), (a_object), (a_physical_offset)))
#define GE_integer_8_field(i, a_object, a_physical_offset) *(EIF_INTEGER_8*)(GE_field_address((i), (a_object), (a_physical_offset)))
#define GE_integer_16_field(i, a_object, a_physical_offset) *(EIF_INTEGER_16*)(GE_field_address((i), (a_object), (a_physical_offset)))
#define GE_integer_32_field(i, a_object, a_physical_offset) *(EIF_INTEGER_32*)(GE_field_address((i), (a_object), (a_physical_offset)))
#define GE_integer_64_field(i, a_object, a_physical_offset) *(EIF_INTEGER_64*)(GE_field_address((i), (a_object), (a_physical_offset)))
#define GE_natural_8_field(i, a_object, a_physical_offset) *(EIF_NATURAL_8*)(GE_field_address((i), (a_object), (a_physical_offset)))
#define GE_natural_16_field(i, a_object, a_physical_offset) *(EIF_NATURAL_16*)(GE_field_address((i), (a_object), (a_physical_offset)))
#define GE_natural_32_field(i, a_object, a_physical_offset) *(EIF_NATURAL_32*)(GE_field_address((i), (a_object), (a_physical_offset)))
#define GE_natural_64_field(i, a_object, a_physical_offset) *(EIF_NATURAL_64*)(GE_field_address((i), (a_object), (a_physical_offset)))
#define GE_pointer_field(i, a_object, a_physical_offset) *(EIF_POINTER*)(GE_field_address((i), (a_object), (a_physical_offset)))
#define GE_real_32_field(i, a_object, a_physical_offset) *(EIF_REAL_32*)(GE_field_address((i), (a_object), (a_physical_offset)))
#define GE_real_64_field(i, a_object, a_physical_offset) *(EIF_REAL_64*)(GE_field_address((i), (a_object), (a_physical_offset)))
#define GE_reference_field(i, a_object, a_physical_offset) *(EIF_REFERENCE*)(GE_field_address((i), (a_object), (a_physical_offset)))
#define GE_set_boolean_field(i, a_object, a_physical_offset, a_value) GE_boolean_field((i), (a_object), (a_physical_offset)) = (a_value)
#define GE_set_character_8_field(i, a_object, a_physical_offset, a_value) GE_character_8_field((i), (a_object), (a_physical_offset)) = (a_value)
#define GE_set_character_32_field(i, a_object, a_physical_offset, a_value) GE_character_32_field((i), (a_object), (a_physical_offset)) = (a_value)
#define GE_set_integer_8_field(i, a_object, a_physical_offset, a_value) GE_integer_8_field((i), (a_object), (a_physical_offset)) = (a_value)
#define GE_set_integer_16_field(i, a_object, a_physical_offset, a_value) GE_integer_16_field((i), (a_object), (a_physical_offset)) = (a_value)
#define GE_set_integer_32_field(i, a_object, a_physical_offset, a_value) GE_integer_32_field((i), (a_object), (a_physical_offset)) = (a_value)
#define GE_set_integer_64_field(i, a_object, a_physical_offset, a_value) GE_integer_64_field((i), (a_object), (a_physical_offset)) = (a_value)
#define GE_set_natural_8_field(i, a_object, a_physical_offset, a_value) GE_natural_8_field((i), (a_object), (a_physical_offset)) = (a_value)
#define GE_set_natural_16_field(i, a_object, a_physical_offset, a_value) GE_natural_16_field((i), (a_object), (a_physical_offset)) = (a_value)
#define GE_set_natural_32_field(i, a_object, a_physical_offset, a_value) GE_natural_32_field((i), (a_object), (a_physical_offset)) = (a_value)
#define GE_set_natural_64_field(i, a_object, a_physical_offset, a_value) GE_natural_64_field((i), (a_object), (a_physical_offset)) = (a_value)
#define GE_set_pointer_field(i, a_object, a_physical_offset, a_value) GE_pointer_field((i), (a_object), (a_physical_offset)) = (a_value)
#define GE_set_real_32_field(i, a_object, a_physical_offset, a_value) GE_real_32_field((i), (a_object), (a_physical_offset)) = (a_value)
#define GE_set_real_64_field(i, a_object, a_physical_offset, a_value) GE_real_64_field((i), (a_object), (a_physical_offset)) = (a_value)
#define GE_set_reference_field(i, a_object, a_physical_offset, a_value) GE_reference_field((i), (a_object), (a_physical_offset)) = (a_value)
#else
#define GE_boolean_field(i, a_object, a_physical_offset) (EIF_BOOLEAN)0
#define GE_character_8_field(i, a_object, a_physical_offset) (EIF_CHARACTER_8)0
#define GE_character_32_field(i, a_object, a_physical_offset) (EIF_CHARACTER_32)0
#define GE_integer_8_field(i, a_object, a_physical_offset) (EIF_INTEGER_8)0
#define GE_integer_16_field(i, a_object, a_physical_offset) (EIF_INTEGER_16)0
#define GE_integer_32_field(i, a_object, a_physical_offset) (EIF_INTEGER_32)0
#define GE_integer_64_field(i, a_object, a_physical_offset) (EIF_INTEGER_64)0
#define GE_natural_8_field(i, a_object, a_physical_offset) (EIF_NATURAL_8)0
#define GE_natural_16_field(i, a_object, a_physical_offset) (EIF_NATURAL_16)0
#define GE_natural_32_field(i, a_object, a_physical_offset) (EIF_NATURAL_32)0
#define GE_natural_64_field(i, a_object, a_physical_offset) (EIF_NATURAL_64)0
#define GE_pointer_field(i, a_object, a_physical_offset) (EIF_POINTER)0
#define GE_real_32_field(i, a_object, a_physical_offset) (EIF_REAL_32)0
#define GE_real_64_field(i, a_object, a_physical_offset) (EIF_REAL_64)0
#define GE_reference_field(i, a_object, a_physical_offset) (EIF_REFERENCE)0
#define GE_set_boolean_field(i, a_object, a_physical_offset, a_value)
#define GE_set_character_8_field(i, a_object, a_physical_offset, a_value)
#define GE_set_character_32_field(i, a_object, a_physical_offset, a_value)
#define GE_set_integer_8_field(i, a_object, a_physical_offset, a_value)
#define GE_set_integer_16_field(i, a_object, a_physical_offset, a_value)
#define GE_set_integer_32_field(i, a_object, a_physical_offset, a_value)
#define GE_set_integer_64_field(i, a_object, a_physical_offset, a_value)
#define GE_set_natural_8_field(i, a_object, a_physical_offset, a_value)
#define GE_set_natural_16_field(i, a_object, a_physical_offset, a_value)
#define GE_set_natural_32_field(i, a_object, a_physical_offset, a_value)
#define GE_set_natural_64_field(i, a_object, a_physical_offset, a_value)
#define GE_set_pointer_field(i, a_object, a_physical_offset, a_value)
#define GE_set_real_32_field(i, a_object, a_physical_offset, a_value)
#define GE_set_real_64_field(i, a_object, a_physical_offset, a_value)
#define GE_set_reference_field(i, a_object, a_physical_offset, a_value)
#endif

/*
 * Number of non-transient fields of an object of dynamic type `a_type'.
 * TODO: storable not implemented yet.
 */
#define GE_persistent_field_count_of_type_index(a_type) GE_field_count_of_type_index(a_type)
#define GE_persistent_field_count_of_encoded_type(a_type) GE_persistent_field_count_of_type_index(GE_decoded_type(a_type).id)

/*
 * Is `i'-th field of objects of type `a_type' a transient field?
 * TODO: storable not implemented yet.
 */
#define GE_is_field_transient_of_type_index(i, a_type) EIF_FALSE
#define GE_is_field_transient_of_encoded_type(i, a_type) GE_is_field_transient_of_type_index((i), GE_decoded_type(a_type).id)

/*
 * Storable version of objects of type `a_type'.
 * TODO: storable not implemented yet.
 */
#define GE_storable_version_of_type_index(a_type) EIF_VOID
#define GE_storable_version_of_encoded_type(a_type) GE_storable_version_of_type_index(GE_decoded_type(a_type).id)

/*
 * Get a lock on `GE_mark_object' and `GE_unmark_object' routines so that
 * 2 threads cannot `GE_mark_object' and `GE_unmark_object' at the same time.
 */
extern void GE_lock_marking();

/*
 * Release a lock on `GE_mark_object' and `GE_unmark_object', so that another
 * thread can use `GE_mark_object' and `GE_unmark_object'.
 */
extern void GE_unlock_marking();

/*
 * Is `obj' marked?
 */
extern EIF_BOOLEAN GE_is_object_marked(EIF_POINTER obj);

/*
 * Mark `obj'.
 */
extern void GE_mark_object(EIF_POINTER obj);

/*
 * Unmark `obj'.
 */
extern void GE_unmark_object(EIF_POINTER obj);

/*
 * New instance of dynamic `a_type'.
 * Note: returned object is not initialized and may
 * hence violate its invariant.
 * `a_type' cannot represent a SPECIAL type, use
 * `GE_new_special_instance_of_special_type_index' instead.
 */
extern EIF_REFERENCE GE_new_instance_of_type_index(EIF_TYPE_INDEX a_type);
#define GE_new_instance_of_encoded_type(a_type) GE_new_instance_of_type_index(GE_decoded_type(a_type).id)

/*
 * New instance of dynamic `a_type' that represents
 * a SPECIAL with can contain `a_capacity' element. To create a SPECIAL of
 * basic type, use `SPECIAL'.
 */
extern EIF_REFERENCE GE_new_special_any_instance_of_type_index(EIF_TYPE_INDEX a_type, EIF_INTEGER a_capacity);
#define GE_new_special_any_instance_of_encoded_type(a_type, a_capacity) GE_new_special_instance_of_type_index(GE_decoded_type(a_type).id, (a_capacity))

/*
 * New instance of tuple of type `a_type'.
 * Note: returned object is not initialized and may
 * hence violate its invariant.
 */
#define GE_new_tuple_instance_of_type_index(a_type) GE_new_instance_of_type_index(a_type)
#define GE_new_tuple_instance_of_encoded_type(a_type) GE_new_tuple_instance_of_type_index(GE_decoded_type(a_type).id)

/*
 * New instance of TYPE for object of type `a_type'.
 */
extern EIF_REFERENCE GE_new_type_instance_of_encoded_type(EIF_ENCODED_TYPE a_type);

#ifdef __cplusplus
}
#endif

#endif

/*
	description:

		"C functions used to implement class CONSOLE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_CONSOLE_H
#define GE_CONSOLE_H

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_WINDOWS

/*
	Create a new DOS console if needed (i.e. in case of a Windows application).
*/
extern void GE_show_console(void);

#endif

#ifdef __cplusplus
}
#endif

#endif

/*
	description:

		"C functions used to implement the program initialization"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_MAIN_H
#define GE_MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

extern int GE_main(int argc, EIF_NATIVE_CHAR** argv);

/*
 * System name.
 */
extern char* GE_system_name;

/*
 * Root class name.
 */
extern char* GE_root_class_name;

#ifdef EIF_WINDOWS

#include <windows.h>

/*
 * Used in WEL.
 */
extern HINSTANCE eif_hInstance;
extern HINSTANCE eif_hPrevInstance;
extern LPWSTR eif_lpCmdLine;
extern int eif_nCmdShow;

/*
 * Main entry point when compiling a Windows application.
 * See:
 *    http://en.wikipedia.org/wiki/WinMain
 *    http://msdn2.microsoft.com/en-us/library/ms633559.aspx
 */
extern int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow);

#endif

#ifdef __cplusplus
}
#endif

#endif

/*
	description:

		"C functions used to access garbage collector facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_GC_H
#define GE_GC_H

#ifdef EIF_BOEHM_GC
/*
 *	Use the Boehm garbage collector.
 *	See:
 *		http://en.wikipedia.org/wiki/Boehm_GC
 *		http://www.hpl.hp.com/personal/Hans_Boehm/gc/
 */

#define GC_IGNORE_WARN
#include "gc.h"
#endif


/*
 * GC initialization.
 */

#ifdef EIF_BOEHM_GC
#define GE_init_gc() GC_INIT(); GC_enable_incremental()
#else /* No GC */
#define GE_init_gc() /* do nothing */
#endif


/*
 * Memory allocation.
 */

/*
 * GE_alloc allocates memory that can contain pointers to collectable objects.
 * Raise an exception when no-more-memory.
 */
#ifdef EIF_BOEHM_GC
#define GE_alloc(x) GE_null(GC_MALLOC(x))
#else /* No GC */
#define GE_alloc(x) GE_null(malloc(x))
#endif

/*
 * When defined, GE_alloc_cleared means that GE_alloc makes sure that the allocated memory is zeroed.
 */
#ifdef EIF_BOEHM_GC
#define GE_alloc_cleared
#else /* No GC */
#endif

/*
 * GE_alloc_atomic allocates memory that does not contain pointers to collectable objects.
 * Raise an exception when no-more-memory.
 */
#ifdef EIF_BOEHM_GC
#define GE_alloc_atomic(x) GE_null(GC_MALLOC_ATOMIC(x))
#else /* No GC */
#define GE_alloc_atomic(x) GE_null(malloc(x))
#endif

/*
 * When defined, GE_alloc_atomic_cleared means that GE_alloc_atomic makes sure that the allocated memory is zeroed.
 */
/* #define GE_alloc_atomic_cleared */






/*
 * Allocate memory that can contain pointers to collectable objects.
 * The allocated memory is not necessarily zeroed.
 * The allocated object is itself collectable.
 * Raise an exception when no-more-memory.
 */
#ifdef EIF_BOEHM_GC
#define GE_malloc(size) GE_null(GC_MALLOC(size))
#else /* No GC */
#define GE_malloc(size) GE_null(malloc(size))
#endif

/*
 * Allocate memory that does not contain pointers to collectable objects.
 * The allocated memory is not necessarily zeroed.
 * The allocated object is itself collectable.
 */
#ifdef EIF_BOEHM_GC
#define GE_malloc_atomic(size) GE_null(GC_MALLOC_ATOMIC(size))
#else /* No GC */
#define GE_malloc_atomic(size) GE_null(malloc(size))
#endif

/*
 * Allocate memory that can contain pointers to collectable objects.
 * The allocated memory is zeroed.
 * The allocated object is itself collectable.
 * Raise an exception when no-more-memory.
 */
#ifdef EIF_BOEHM_GC
#define GE_calloc(nelem, elsize) GE_null(GC_MALLOC((nelem) * (elsize)))
#else /* No GC */
#define GE_calloc(nelem, elsize) GE_null(calloc((nelem), (elsize)))
#endif

/*
 * Allocate memory that does not contain pointers to collectable objects.
 * The allocated memory is zeroed.
 * The allocated object is itself collectable.
 * Raise an exception when no-more-memory.
 */
#ifdef EIF_BOEHM_GC
#define GE_calloc_atomic(nelem, elsize) memset(GE_null(GC_MALLOC_ATOMIC((nelem) * (elsize))), 0, (nelem) * (elsize))
#else /* No GC */
#define GE_calloc(nelem, elsize) GE_null(calloc((nelem), (elsize)))
#endif

/*
 * Allocate memory that can contain pointers to collectable objects.
 * The allocated memory is not necessarily zeroed.
 * The allocated object is itself not collectable.
 * Raise an exception when no-more-memory.
 */
#ifdef EIF_BOEHM_GC
#define GE_malloc_uncollectable(size) GE_null(GC_MALLOC_UNCOLLECTABLE(size))
#else /* No GC */
#define GE_malloc_uncollectable(size) GE_null(malloc(size))
#endif

/*
 * Allocate memory that does not contain pointers to collectable objects.
 * The allocated memory is not necessarily zeroed.
 * The allocated object is itself not collectable.
 * Raise an exception when no-more-memory.
 */
#ifdef EIF_BOEHM_GC
#define GE_malloc_atomic_uncollectable(size) GE_null(GC_malloc_atomic_uncollectable(size))
#else /* No GC */
#define GE_malloc_uncollectable(size) GE_null(malloc(size))
#endif

/*
 * Allocate memory that can contain pointers to collectable objects.
 * The allocated memory is zeroed.
 * The allocated object is itself not collectable.
 * Raise an exception when no-more-memory.
 */
#ifdef EIF_BOEHM_GC
#define GE_calloc_uncollectable(nelem, elsize) GE_null(GC_MALLOC_UNCOLLECTABLE((nelem) * (elsize)))
#else /* No GC */
#define GE_calloc_uncollectable(nelem, elsize) GE_null(calloc((nelem), (elsize)))
#endif

/*
 * Allocate memory that does not contain pointers to collectable objects.
 * The allocated memory is zeroed.
 * The allocated object is itself not collectable.
 * Raise an exception when no-more-memory.
 */
#ifdef EIF_BOEHM_GC
#define GE_calloc_atomic_uncollectable(nelem, elsize) memset(GE_null(GC_malloc_atomic_uncollectable((nelem) * (elsize))), 0, (nelem) * (elsize))
#else /* No GC */
#define GE_calloc_atomic_uncollectable(nelem, elsize) GE_null(calloc((nelem), (elsize)))
#endif

/*
 * Allocate memory that does not contain pointers to collectable objects.
 * The allocated memory is zeroed.
 * The allocated object is itself not collectable.
 * Do not raise an exception when no-more-memory.
 */
#ifdef EIF_BOEHM_GC
extern void* GE_raw_calloc_atomic_uncollectable(size_t nelem, size_t elsize);
#else /* No GC */
#define GE_raw_calloc_atomic_uncollectable(nelem, elsize) calloc((nelem), (elsize))
#endif

/*
 * Allocate more memory for the given pointer.
 * The reallocated pointer keeps the same properties (e.g. atomic or not, collectable or not).
 * The extra allocated memory is not necessarily zeroed.
 * The allocated object is itself collectable.
 * Raise an exception when no-more-memory.
 */
#ifdef EIF_BOEHM_GC
#define GE_realloc(p, size) GE_null(GC_REALLOC((p), (size)))
#else /* No GC */
#define GE_realloc(p, size) GE_null(realloc((p), (size)))
#endif

/*
 * Allocate more memory for the given pointer.
 * The reallocated pointer keeps the same properties (e.g. atomic or not, collectable or not).
 * The extra allocated memory is zeroed.
 * The allocated object is itself collectable.
 * Raise an exception when no-more-memory.
 */
extern void* GE_recalloc(void* p, size_t old_nelem, size_t new_nelem, size_t elsize);

/*
 * Allocate more memory for the given pointer.
 * The reallocated pointer keeps the same properties (e.g. atomic or not, collectable or not).
 * The extra allocated memory is zeroed.
 * The allocated object is itself collectable.
 * Do not raise an exception when no-more-memory.
 */
extern void* GE_raw_recalloc(void* p, size_t old_nelem, size_t new_nelem, size_t elsize);

/*
 * Explicitly deallocate an object.
 */
#ifdef EIF_BOEHM_GC
#define GE_free(p) GC_FREE(p)
#else /* No GC */
#define GE_free(p) free(p)
#endif

/*
 * When defined, GE_malloc_cleared means that GE_malloc and GE_malloc_uncollectable
 * make sure that the allocated memory is zeroed.
 */
#ifdef EIF_BOEHM_GC
#define GE_malloc_cleared
#else /* No GC */
#endif

/*
 * When defined, GE_malloc_atomic_cleared means that GE_malloc_atomic and
 * GE_malloc_atomic_uncollectable make sure that the allocated memory is zeroed.
 */
#ifdef EIF_BOEHM_GC
/* #define GE_malloc_atomic_cleared */
#else /* No GC */
#endif


/*
 * Dispose
 */

/*
 * Register dispose routine `disp' to be called on object `obj' when it will be collected.
 */
#ifdef EIF_BOEHM_GC
extern void GE_boehm_dispose(void* C, void* disp); /* Call dispose routine `disp' on object `C'. */
#define GE_register_dispose(obj, disp) GC_REGISTER_FINALIZER_NO_ORDER((void*)(obj), (void (*) (void*, void*)) &GE_boehm_dispose, NULL, NULL, NULL)
#else /* No GC */
#define GE_register_dispose(obj, disp) /* do nothing */
#endif


/*
 * Access to objects, useful with GCs which move objects in memory.
 * This is not the case here, since the Boehm GC is not a moving GC.
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

/*
	description:

		"C functions used to implement class IDENTIFIED"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_IDENTIFIED_H
#define GE_IDENTIFIED_H

#ifdef __cplusplus
extern "C" {
#endif

/*
	Initialize data to keep track of object ids.
*/
extern void GE_init_identified(void);

/*
	Get a new id for `object', assuming it is NOT in the stack.
*/
extern EIF_INTEGER_32 GE_object_id(EIF_OBJECT object);

/*
	Return the object associated with `id'.
*/
extern EIF_REFERENCE GE_id_object(EIF_INTEGER_32 id);

/*
	Remove the object associated with `id' from the stack.
*/
extern void GE_object_id_free(EIF_INTEGER_32 id);

#ifdef __cplusplus
}
#endif

#endif

#ifdef __cplusplus
extern "C" {
#endif

#define T0 EIF_ANY

/* CHARACTER */
#define EIF_CHARACTER EIF_CHARACTER_8

/* WIDE_CHARACTER */
#define EIF_WIDE_CHAR EIF_CHARACTER_32

/* INTEGER */
#define EIF_INTEGER EIF_INTEGER_32

/* NATURAL */
#define EIF_NATURAL EIF_NATURAL_32

/* REAL */
#define EIF_REAL EIF_REAL_32

/* DOUBLE */
#define EIF_DOUBLE EIF_REAL_64

/* BOOLEAN */
#define T1 EIF_BOOLEAN
extern T0* GE_boxed1(T1 a1);
typedef struct Sb1 Tb1;

/* CHARACTER_8 */
#define T2 EIF_CHARACTER_8
extern T0* GE_boxed2(T2 a1);
typedef struct Sb2 Tb2;

/* CHARACTER_32 */
#define T3 EIF_CHARACTER_32
extern T0* GE_boxed3(T3 a1);
typedef struct Sb3 Tb3;

/* INTEGER_8 */
#define T4 EIF_INTEGER_8
extern T0* GE_boxed4(T4 a1);
typedef struct Sb4 Tb4;

/* INTEGER_16 */
#define T5 EIF_INTEGER_16
extern T0* GE_boxed5(T5 a1);
typedef struct Sb5 Tb5;

/* INTEGER_32 */
#define T6 EIF_INTEGER_32
extern T0* GE_boxed6(T6 a1);
typedef struct Sb6 Tb6;

/* INTEGER_64 */
#define T7 EIF_INTEGER_64
extern T0* GE_boxed7(T7 a1);
typedef struct Sb7 Tb7;

/* NATURAL_8 */
#define T8 EIF_NATURAL_8
extern T0* GE_boxed8(T8 a1);
typedef struct Sb8 Tb8;

/* NATURAL_16 */
#define T9 EIF_NATURAL_16
extern T0* GE_boxed9(T9 a1);
typedef struct Sb9 Tb9;

/* NATURAL_32 */
#define T10 EIF_NATURAL_32
extern T0* GE_boxed10(T10 a1);
typedef struct Sb10 Tb10;

/* NATURAL_64 */
#define T11 EIF_NATURAL_64
extern T0* GE_boxed11(T11 a1);
typedef struct Sb11 Tb11;

/* REAL_32 */
#define T12 EIF_REAL_32
extern T0* GE_boxed12(T12 a1);
typedef struct Sb12 Tb12;

/* REAL_64 */
#define T13 EIF_REAL_64
extern T0* GE_boxed13(T13 a1);
typedef struct Sb13 Tb13;

/* POINTER */
#define T14 EIF_POINTER
extern T0* GE_boxed14(T14 a1);
typedef struct Sb14 Tb14;

/* SPECIAL [CHARACTER_8] */
typedef struct S15 T15;

/* SPECIAL [CHARACTER_32] */
typedef struct S16 T16;

/* STRING_8 */
typedef struct S17 T17;

/* STRING_32 */
typedef struct S18 T18;

/* ISE_EXCEPTION_MANAGER */
typedef struct S19 T19;

/* GEANT */
typedef struct S22 T22;

/* HASH_TABLE [INTEGER_32, INTEGER_32] */
typedef struct S23 T23;

/* CELL [detachable TUPLE [INTEGER_32, INTEGER_32, INTEGER_32, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, INTEGER_32, BOOLEAN]] */
typedef struct S24 T24;

/* CELL [detachable EXCEPTION] */
typedef struct S25 T25;

/* CELL [NO_MORE_MEMORY] */
typedef struct S26 T26;

/* [attached] TUPLE [INTEGER_32, INTEGER_32, INTEGER_32, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, INTEGER_32, BOOLEAN] */
typedef struct S27 T27;

/* GEANT_PROJECT */
typedef struct S29 T29;

/* GEANT_PROJECT_LOADER */
typedef struct S30 T30;

/* GEANT_PROJECT_OPTIONS */
typedef struct S31 T31;

/* GEANT_PROJECT_VARIABLES */
typedef struct S32 T32;

/* GEANT_TARGET */
typedef struct S33 T33;

/* KL_ARGUMENTS */
typedef struct S34 T34;

/* UT_ERROR_HANDLER */
typedef struct S35 T35;

/* GEANT_VARIABLES */
typedef struct S36 T36;

/* GEANT_PROJECT_ELEMENT */
typedef struct S37 T37;

/* DS_HASH_TABLE [GEANT_TARGET, STRING_8] */
typedef struct S38 T38;

/* ARRAY [STRING_8] */
typedef struct S39 T39;

/* SPECIAL [STRING_8] */
typedef struct S40 T40;

/* GEANT_ARGUMENT_VARIABLES */
typedef struct S41 T41;

/* AP_FLAG */
typedef struct S42 T42;

/* AP_ALTERNATIVE_OPTIONS_LIST */
typedef struct S43 T43;

/* AP_STRING_OPTION */
typedef struct S44 T44;

/* AP_PARSER */
typedef struct S45 T45;

/* AP_ERROR */
typedef struct S47 T47;

/* AP_ERROR_HANDLER */
typedef struct S52 T52;

/* KL_STANDARD_FILES */
typedef struct S53 T53;

/* KL_STDERR_FILE */
typedef struct S54 T54;

/* KL_EXCEPTIONS */
typedef struct S55 T55;

/* UT_VERSION_NUMBER */
typedef struct S56 T56;

/* VOID_TARGET */
typedef struct S58 T58;

/* [attached] TYPE [VOID_TARGET] */
#define T59 EIF_TYPE_OBJ

/* ROUTINE_FAILURE */
typedef struct S60 T60;

/* [attached] TYPE [ROUTINE_FAILURE] */
#define T61 EIF_TYPE_OBJ

/* OLD_VIOLATION */
typedef struct S62 T62;

/* [attached] TYPE [OLD_VIOLATION] */
#define T63 EIF_TYPE_OBJ

/* NO_MORE_MEMORY */
typedef struct S64 T64;

/* INVARIANT_VIOLATION */
typedef struct S65 T65;

/* OPERATING_SYSTEM_SIGNAL_FAILURE */
typedef struct S66 T66;

/* IO_FAILURE */
typedef struct S67 T67;

/* OPERATING_SYSTEM_FAILURE */
typedef struct S68 T68;

/* COM_FAILURE */
typedef struct S69 T69;

/* EIFFEL_RUNTIME_PANIC */
typedef struct S70 T70;

/* PRECONDITION_VIOLATION */
typedef struct S73 T73;

/* POSTCONDITION_VIOLATION */
typedef struct S74 T74;

/* FLOATING_POINT_FAILURE */
typedef struct S75 T75;

/* CHECK_VIOLATION */
typedef struct S76 T76;

/* BAD_INSPECT_VALUE */
typedef struct S77 T77;

/* VARIANT_VIOLATION */
typedef struct S78 T78;

/* LOOP_INVARIANT_VIOLATION */
typedef struct S79 T79;

/* RESCUE_FAILURE */
typedef struct S80 T80;

/* RESUMPTION_FAILURE */
typedef struct S81 T81;

/* CREATE_ON_DEFERRED */
typedef struct S82 T82;

/* EXTERNAL_FAILURE */
typedef struct S83 T83;

/* VOID_ASSIGNED_TO_EXPANDED */
typedef struct S84 T84;

/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE */
typedef struct S85 T85;

/* MISMATCH_FAILURE */
typedef struct S86 T86;

/* DEVELOPER_EXCEPTION */
typedef struct S87 T87;

/* ADDRESS_APPLIED_TO_MELTED_FEATURE */
typedef struct S88 T88;

/* SERIALIZATION_FAILURE */
typedef struct S89 T89;

/* KL_OPERATING_SYSTEM */
typedef struct S90 T90;

/* KL_WINDOWS_FILE_SYSTEM */
typedef struct S92 T92;

/* KL_UNIX_FILE_SYSTEM */
typedef struct S93 T93;

/* PRIMES */
typedef struct S94 T94;

/* SPECIAL [INTEGER_32] */
typedef struct S95 T95;

/* SPECIAL [BOOLEAN] */
typedef struct S96 T96;

/* KL_TEXT_INPUT_FILE */
typedef struct S97 T97;

/* GEANT_PROJECT_PARSER */
typedef struct S98 T98;

/* GEANT_PROJECT_VARIABLE_RESOLVER */
typedef struct S100 T100;

/* UC_STRING_EQUALITY_TESTER */
typedef struct S101 T101;

/* KL_SPECIAL_ROUTINES [STRING_8] */
typedef struct S104 T104;

/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
typedef struct S105 T105;

/* KL_SPECIAL_ROUTINES [INTEGER_32] */
typedef struct S106 T106;

/* KL_STDOUT_FILE */
typedef struct S108 T108;

/* DS_LINKED_LIST_CURSOR [AP_OPTION] */
typedef struct S109 T109;

/* DS_ARRAYED_LIST [detachable STRING_8] */
typedef struct S110 T110;

/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8] */
typedef struct S111 T111;

/* AP_DISPLAY_HELP_FLAG */
typedef struct S112 T112;

/* DS_ARRAYED_LIST [AP_OPTION] */
typedef struct S113 T113;

/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S114 T114;

/* KL_STRING_ROUTINES */
typedef struct S115 T115;

/* DS_HASH_TABLE [STRING_8, STRING_8] */
typedef struct S120 T120;

/* ARGUMENTS_32 */
typedef struct S121 T121;

/* IMMUTABLE_STRING_32 */
typedef struct S122 T122;

/* STD_FILES */
typedef struct S124 T124;

/* UTF_CONVERTER */
typedef struct S125 T125;
extern T0* GE_boxed125(T125 a1);
typedef struct Sb125 Tb125;

/* CELL [INTEGER_32] */
typedef struct S126 T126;

/* C_STRING */
typedef struct S127 T127;

/* MANAGED_POINTER */
typedef struct S128 T128;

/* EXECUTION_ENVIRONMENT */
typedef struct S129 T129;

/* KL_ANY_ROUTINES */
typedef struct S130 T130;

/* KL_PATHNAME */
typedef struct S132 T132;

/* FILE_INFO */
typedef struct S133 T133;

/* detachable KL_LINKABLE [CHARACTER_8] */
typedef struct S135 T135;

/* XM_EXPAT_PARSER_FACTORY */
typedef struct S136 T136;

/* XM_EIFFEL_PARSER */
typedef struct S138 T138;

/* XM_TREE_CALLBACKS_PIPE */
typedef struct S139 T139;

/* XM_CALLBACKS_TO_TREE_FILTER */
typedef struct S142 T142;

/* XM_DOCUMENT */
typedef struct S143 T143;

/* XM_ELEMENT */
typedef struct S144 T144;

/* XM_STOP_ON_ERROR_FILTER */
typedef struct S145 T145;

/* XM_POSITION_TABLE */
typedef struct S146 T146;

/* KL_EXECUTION_ENVIRONMENT */
typedef struct S149 T149;

/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES] */
typedef struct S150 T150;

/* DS_ARRAYED_STACK [GEANT_VARIABLES] */
typedef struct S151 T151;

/* DS_ARRAYED_LIST_CURSOR [AP_OPTION] */
typedef struct S152 T152;

/* SPECIAL [AP_OPTION] */
typedef struct S154 T154;

/* KL_SPECIAL_ROUTINES [AP_OPTION] */
typedef struct S155 T155;

/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S156 T156;

/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S157 T157;

/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S158 T158;

/* UC_STRING */
typedef struct S159 T159;

/* STRING_TO_INTEGER_CONVERTOR */
typedef struct S161 T161;

/* DS_LINKED_LIST [XM_ELEMENT] */
typedef struct S163 T163;

/* DS_LINKED_LIST_CURSOR [XM_ELEMENT] */
typedef struct S164 T164;

/* GEANT_INHERIT_ELEMENT */
typedef struct S165 T165;

/* GEANT_INHERIT */
typedef struct S166 T166;

/* SPECIAL [GEANT_TARGET] */
typedef struct S167 T167;

/* KL_SPECIAL_ROUTINES [GEANT_TARGET] */
typedef struct S170 T170;

/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8] */
typedef struct S171 T171;

/* ARRAY [IMMUTABLE_STRING_32] */
typedef struct S172 T172;

/* SPECIAL [IMMUTABLE_STRING_32] */
typedef struct S173 T173;

/* NATIVE_STRING */
typedef struct S174 T174;

/* READABLE_STRING_32 */
typedef struct S175 T175;

/* CONSOLE */
typedef struct S176 T176;

/* EXCEPTIONS */
typedef struct S177 T177;

/* TYPED_POINTER [NATURAL_8] */
typedef struct S178 T178;
extern T0* GE_boxed178(T178 a1);
typedef struct Sb178 Tb178;

/* SPECIAL [NATURAL_8] */
typedef struct S179 T179;

/* TYPED_POINTER [SPECIAL [NATURAL_8]] */
typedef struct S180 T180;
extern T0* GE_boxed180(T180 a1);
typedef struct Sb180 Tb180;

/* PLATFORM */
typedef struct S181 T181;

/* XM_EIFFEL_SCANNER */
typedef struct S183 T183;

/* XM_DEFAULT_POSITION */
typedef struct S184 T184;

/* DS_BILINKED_LIST [XM_POSITION] */
typedef struct S186 T186;

/* DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
typedef struct S187 T187;

/* XM_CALLBACKS_NULL */
typedef struct S188 T188;

/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S189 T189;

/* XM_NULL_EXTERNAL_RESOLVER */
typedef struct S191 T191;

/* XM_DTD_CALLBACKS_NULL */
typedef struct S193 T193;

/* KL_SPECIAL_ROUTINES [detachable ANY] */
typedef struct S194 T194;

/* SPECIAL [detachable ANY] */
typedef struct S195 T195;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
typedef struct S196 T196;

/* XM_EIFFEL_PARSER_NAME */
typedef struct S197 T197;

/* SPECIAL [XM_EIFFEL_PARSER_NAME] */
typedef struct S198 T198;

/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S199 T199;

/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
typedef struct S200 T200;

/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S201 T201;

/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
typedef struct S202 T202;

/* XM_DTD_EXTERNAL_ID */
typedef struct S203 T203;

/* SPECIAL [XM_DTD_EXTERNAL_ID] */
typedef struct S204 T204;

/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
typedef struct S205 T205;

/* XM_DTD_ELEMENT_CONTENT */
typedef struct S206 T206;

/* SPECIAL [XM_DTD_ELEMENT_CONTENT] */
typedef struct S207 T207;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S208 T208;

/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S209 T209;

/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S210 T210;

/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S211 T211;

/* XM_DTD_ATTRIBUTE_CONTENT */
typedef struct S212 T212;

/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S213 T213;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
typedef struct S214 T214;

/* DS_BILINKED_LIST [STRING_8] */
typedef struct S215 T215;

/* SPECIAL [DS_BILINKED_LIST [STRING_8]] */
typedef struct S216 T216;

/* KL_SPECIAL_ROUTINES [BOOLEAN] */
typedef struct S217 T217;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
typedef struct S218 T218;

/* XM_EIFFEL_DECLARATION */
typedef struct S219 T219;

/* SPECIAL [XM_EIFFEL_DECLARATION] */
typedef struct S220 T220;

/* XM_EIFFEL_ENTITY_DEF */
typedef struct S223 T223;

/* XM_EIFFEL_SCANNER_DTD */
typedef struct S224 T224;

/* XM_EIFFEL_PE_ENTITY_DEF */
typedef struct S226 T226;

/* XM_NAMESPACE_RESOLVER */
typedef struct S227 T227;

/* ARRAY [XM_CALLBACKS_FILTER] */
typedef struct S228 T228;

/* SPECIAL [XM_CALLBACKS_FILTER] */
typedef struct S229 T229;

/* DS_HASH_SET [XM_NAMESPACE] */
typedef struct S230 T230;

/* XM_NAMESPACE */
typedef struct S231 T231;

/* XM_LINKED_LIST [XM_DOCUMENT_NODE] */
typedef struct S232 T232;

/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE] */
typedef struct S236 T236;

/* XM_LINKED_LIST [XM_ELEMENT_NODE] */
typedef struct S239 T239;

/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S241 T241;

/* SPECIAL [GEANT_ARGUMENT_VARIABLES] */
typedef struct S242 T242;

/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES] */
typedef struct S243 T243;

/* SPECIAL [GEANT_VARIABLES] */
typedef struct S244 T244;

/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES] */
typedef struct S245 T245;

/* DS_ARRAYED_STACK [GEANT_TARGET] */
typedef struct S247 T247;

/* GEANT_TASK_FACTORY */
typedef struct S248 T248;

/* GEANT_PARENT */
typedef struct S249 T249;

/* DS_ARRAYED_LIST [GEANT_PARENT] */
typedef struct S251 T251;

/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT] */
typedef struct S252 T252;

/* GEANT_INTERPRETING_ELEMENT */
typedef struct S253 T253;

/* GEANT_ARGUMENT_ELEMENT */
typedef struct S254 T254;

/* GEANT_LOCAL_ELEMENT */
typedef struct S255 T255;

/* GEANT_GLOBAL_ELEMENT */
typedef struct S256 T256;

/* XM_ATTRIBUTE */
typedef struct S257 T257;

/* GEANT_GROUP */
typedef struct S258 T258;

/* [attached] TYPE [STRING_8] */
#define T260 EIF_TYPE_OBJ

/* TYPED_POINTER [NATURAL_16] */
typedef struct S262 T262;
extern T0* GE_boxed262(T262 a1);
typedef struct Sb262 Tb262;

/* ARRAY [INTEGER_32] */
typedef struct S263 T263;

/* UC_UTF8_ROUTINES */
typedef struct S264 T264;

/* UC_UTF8_STRING */
typedef struct S265 T265;

/* XM_EIFFEL_INPUT_STREAM */
typedef struct S266 T266;

/* KL_INTEGER_ROUTINES */
typedef struct S267 T267;

/* KL_PLATFORM */
typedef struct S268 T268;

/* KL_ARRAY_ROUTINES [INTEGER_32] */
typedef struct S269 T269;

/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE] */
typedef struct S270 T270;

/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S271 T271;

/* DS_PAIR [XM_POSITION, XM_NODE] */
typedef struct S272 T272;

/* INTEGER_OVERFLOW_CHECKER */
typedef struct S273 T273;

/* detachable DS_LINKABLE [XM_ELEMENT] */
typedef struct S274 T274;

/* GEANT_PARENT_ELEMENT */
typedef struct S275 T275;

/* TYPED_POINTER [ANY] */
typedef struct S277 T277;
extern T0* GE_boxed277(T277 a1);
typedef struct Sb277 Tb277;

/* XM_EIFFEL_CHARACTER_ENTITY */
typedef struct S278 T278;

/* YY_BUFFER */
typedef struct S279 T279;

/* YY_FILE_BUFFER */
typedef struct S280 T280;

/* detachable DS_BILINKABLE [XM_POSITION] */
typedef struct S284 T284;

/* DS_BILINKED_LIST_CURSOR [XM_POSITION] */
typedef struct S285 T285;

/* detachable DS_LINKABLE [XM_EIFFEL_SCANNER] */
typedef struct S286 T286;

/* SPECIAL [XM_EIFFEL_ENTITY_DEF] */
typedef struct S287 T287;

/* detachable DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S290 T290;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
typedef struct S291 T291;

/* detachable KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
typedef struct S293 T293;

/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
typedef struct S294 T294;

/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
typedef struct S295 T295;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S296 T296;

/* detachable DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S297 T297;

/* DS_LINKED_LIST [STRING_8] */
typedef struct S298 T298;

/* DS_BILINKED_LIST_CURSOR [STRING_8] */
typedef struct S299 T299;

/* detachable DS_BILINKABLE [STRING_8] */
typedef struct S300 T300;

/* XM_NAMESPACE_RESOLVER_CONTEXT */
typedef struct S301 T301;

/* DS_LINKED_QUEUE [STRING_8] */
typedef struct S303 T303;

/* detachable KL_EQUALITY_TESTER [XM_NAMESPACE] */
typedef struct S304 T304;

/* DS_HASH_SET_CURSOR [XM_NAMESPACE] */
typedef struct S305 T305;

/* KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
typedef struct S306 T306;

/* SPECIAL [XM_NAMESPACE] */
typedef struct S307 T307;

/* detachable DS_LINKABLE [XM_DOCUMENT_NODE] */
typedef struct S308 T308;

/* GEANT_STRING_INTERPRETER */
typedef struct S312 T312;

/* GEANT_NAME_VALUE_ELEMENT */
typedef struct S314 T314;

/* [attached] TYPE [GEANT_TARGET] */
#define T316 EIF_TYPE_OBJ

/* KL_ARRAY_ROUTINES [detachable STRING_8] */
typedef struct S318 T318;

/* AP_OPTION_COMPARATOR */
typedef struct S319 T319;

/* DS_QUICK_SORTER [AP_OPTION] */
typedef struct S320 T320;

/* ST_WORD_WRAPPER */
typedef struct S322 T322;

/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER */
typedef struct S324 T324;

/* XM_COMMENT */
typedef struct S325 T325;

/* XM_PROCESSING_INSTRUCTION */
typedef struct S326 T326;

/* XM_CHARACTER_DATA */
typedef struct S327 T327;

/* detachable DS_LINKABLE [XM_ELEMENT_NODE] */
typedef struct S329 T329;

/* detachable DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S330 T330;

/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
typedef struct S331 T331;

/* GEANT_GEC_TASK */
typedef struct S332 T332;

/* [attached] TUPLE [XM_ELEMENT] */
typedef struct S333 T333;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEC_TASK] */
typedef struct S334 T334;

/* detachable TUPLE */
typedef struct S335 T335;

/* [attached] TUPLE [GEANT_TASK_FACTORY] */
typedef struct S336 T336;

/* GEANT_ISE_TASK */
typedef struct S338 T338;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_ISE_TASK] */
typedef struct S339 T339;

/* GEANT_EXEC_TASK */
typedef struct S340 T340;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_EXEC_TASK] */
typedef struct S341 T341;

/* GEANT_LCC_TASK */
typedef struct S342 T342;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_LCC_TASK] */
typedef struct S343 T343;

/* GEANT_SET_TASK */
typedef struct S344 T344;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_SET_TASK] */
typedef struct S345 T345;

/* GEANT_UNSET_TASK */
typedef struct S346 T346;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_UNSET_TASK] */
typedef struct S347 T347;

/* GEANT_GEXACE_TASK */
typedef struct S348 T348;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEXACE_TASK] */
typedef struct S349 T349;

/* GEANT_GELEX_TASK */
typedef struct S350 T350;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GELEX_TASK] */
typedef struct S351 T351;

/* GEANT_GEYACC_TASK */
typedef struct S352 T352;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEYACC_TASK] */
typedef struct S353 T353;

/* GEANT_GEPP_TASK */
typedef struct S354 T354;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEPP_TASK] */
typedef struct S355 T355;

/* GEANT_GETEST_TASK */
typedef struct S356 T356;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GETEST_TASK] */
typedef struct S357 T357;

/* GEANT_GEANT_TASK */
typedef struct S358 T358;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEANT_TASK] */
typedef struct S359 T359;

/* GEANT_ECHO_TASK */
typedef struct S360 T360;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_ECHO_TASK] */
typedef struct S361 T361;

/* GEANT_MKDIR_TASK */
typedef struct S362 T362;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_MKDIR_TASK] */
typedef struct S363 T363;

/* GEANT_DELETE_TASK */
typedef struct S364 T364;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_DELETE_TASK] */
typedef struct S365 T365;

/* GEANT_COPY_TASK */
typedef struct S366 T366;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_COPY_TASK] */
typedef struct S367 T367;

/* GEANT_MOVE_TASK */
typedef struct S368 T368;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_MOVE_TASK] */
typedef struct S369 T369;

/* GEANT_SETENV_TASK */
typedef struct S370 T370;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_SETENV_TASK] */
typedef struct S371 T371;

/* GEANT_XSLT_TASK */
typedef struct S372 T372;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_XSLT_TASK] */
typedef struct S373 T373;

/* GEANT_OUTOFDATE_TASK */
typedef struct S374 T374;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_OUTOFDATE_TASK] */
typedef struct S375 T375;

/* GEANT_EXIT_TASK */
typedef struct S376 T376;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_EXIT_TASK] */
typedef struct S377 T377;

/* GEANT_PRECURSOR_TASK */
typedef struct S378 T378;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_PRECURSOR_TASK] */
typedef struct S379 T379;

/* GEANT_AVAILABLE_TASK */
typedef struct S380 T380;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_AVAILABLE_TASK] */
typedef struct S381 T381;

/* GEANT_INPUT_TASK */
typedef struct S382 T382;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_INPUT_TASK] */
typedef struct S383 T383;

/* GEANT_REPLACE_TASK */
typedef struct S384 T384;

/* [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_REPLACE_TASK] */
typedef struct S385 T385;

/* KL_SPECIAL_ROUTINES [GEANT_PARENT] */
typedef struct S386 T386;

/* SPECIAL [GEANT_PARENT] */
typedef struct S387 T387;

/* UC_UNICODE_ROUTINES */
typedef struct S389 T389;

/* DS_LINKED_QUEUE [CHARACTER_8] */
typedef struct S391 T391;

/* UC_UTF16_ROUTINES */
typedef struct S392 T392;

/* SPECIAL [NATURAL_64] */
typedef struct S393 T393;

/* GEANT_RENAME_ELEMENT */
typedef struct S394 T394;

/* GEANT_REDEFINE_ELEMENT */
typedef struct S395 T395;

/* GEANT_SELECT_ELEMENT */
typedef struct S396 T396;

/* GEANT_RENAME */
typedef struct S397 T397;

/* DS_HASH_TABLE [GEANT_RENAME, STRING_8] */
typedef struct S398 T398;

/* GEANT_REDEFINE */
typedef struct S399 T399;

/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8] */
typedef struct S400 T400;

/* GEANT_SELECT */
typedef struct S401 T401;

/* DS_HASH_TABLE [GEANT_SELECT, STRING_8] */
typedef struct S402 T402;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
typedef struct S403 T403;

/* attached DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
typedef struct S404 T404;

/* DS_LINKED_LIST_CURSOR [STRING_8] */
typedef struct S405 T405;

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S407 T407;

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S408 T408;

/* detachable DS_LINKABLE [STRING_8] */
typedef struct S409 T409;

/* KL_DIRECTORY */
typedef struct S410 T410;

/* ST_SPLITTER */
typedef struct S411 T411;

/* KL_STRING_INPUT_STREAM */
typedef struct S412 T412;

/* KL_CHARACTER_BUFFER */
typedef struct S413 T413;

/* KL_ARRAY [detachable STRING_8] */
typedef struct S414 T414;

/* SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
typedef struct S415 T415;

/* KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
typedef struct S418 T418;

/* DS_HASH_TABLE_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
typedef struct S419 T419;

/* GEANT_GEC_COMMAND */
typedef struct S420 T420;

/* DS_CELL [PROCEDURE [ANY, TUPLE]] */
typedef struct S421 T421;

/* [attached] PROCEDURE [[attached] NONE, [attached] TUPLE] */
typedef struct S422 T422;

/* [attached] TUPLE [GEANT_GEC_TASK] */
typedef struct S423 T423;

/* GEANT_ISE_COMMAND */
typedef struct S424 T424;

/* [attached] TUPLE [GEANT_ISE_TASK] */
typedef struct S425 T425;

/* GEANT_FILESET_ELEMENT */
typedef struct S426 T426;

/* GEANT_EXEC_COMMAND */
typedef struct S427 T427;

/* GEANT_STRING_PROPERTY */
typedef struct S428 T428;

/* [attached] FUNCTION [GEANT_INTERPRETING_ELEMENT, [attached] TUPLE, STRING_8] */
typedef struct S429 T429;

/* [attached] TUPLE [GEANT_INTERPRETING_ELEMENT, STRING_8] */
typedef struct S430 T430;

/* GEANT_BOOLEAN_PROPERTY */
typedef struct S431 T431;

/* GEANT_FILESET */
typedef struct S432 T432;

/* [attached] TUPLE [GEANT_EXEC_TASK] */
typedef struct S433 T433;

/* GEANT_LCC_COMMAND */
typedef struct S434 T434;

/* [attached] TUPLE [GEANT_LCC_TASK] */
typedef struct S435 T435;

/* GEANT_SET_COMMAND */
typedef struct S436 T436;

/* [attached] TUPLE [GEANT_SET_TASK] */
typedef struct S437 T437;

/* GEANT_UNSET_COMMAND */
typedef struct S438 T438;

/* [attached] TUPLE [GEANT_UNSET_TASK] */
typedef struct S439 T439;

/* GEANT_DEFINE_ELEMENT */
typedef struct S440 T440;

/* GEANT_GEXACE_COMMAND */
typedef struct S441 T441;

/* [attached] TUPLE [GEANT_GEXACE_TASK] */
typedef struct S442 T442;

/* GEANT_GELEX_COMMAND */
typedef struct S443 T443;

/* [attached] TUPLE [GEANT_GELEX_TASK] */
typedef struct S444 T444;

/* GEANT_GEYACC_COMMAND */
typedef struct S445 T445;

/* [attached] TUPLE [GEANT_GEYACC_TASK] */
typedef struct S446 T446;

/* GEANT_GEPP_COMMAND */
typedef struct S447 T447;

/* [attached] TUPLE [GEANT_GEPP_TASK] */
typedef struct S448 T448;

/* GEANT_GETEST_COMMAND */
typedef struct S449 T449;

/* [attached] TUPLE [GEANT_GETEST_TASK] */
typedef struct S450 T450;

/* GEANT_GEANT_COMMAND */
typedef struct S451 T451;

/* [attached] TUPLE [GEANT_GEANT_TASK] */
typedef struct S452 T452;

/* GEANT_ECHO_COMMAND */
typedef struct S453 T453;

/* [attached] TUPLE [GEANT_ECHO_TASK] */
typedef struct S454 T454;

/* GEANT_MKDIR_COMMAND */
typedef struct S455 T455;

/* [attached] TUPLE [GEANT_MKDIR_TASK] */
typedef struct S456 T456;

/* GEANT_DIRECTORYSET_ELEMENT */
typedef struct S457 T457;

/* GEANT_DELETE_COMMAND */
typedef struct S458 T458;

/* GEANT_DIRECTORYSET */
typedef struct S459 T459;

/* [attached] TUPLE [GEANT_DELETE_TASK] */
typedef struct S460 T460;

/* GEANT_COPY_COMMAND */
typedef struct S461 T461;

/* [attached] TUPLE [GEANT_COPY_TASK] */
typedef struct S462 T462;

/* GEANT_MOVE_COMMAND */
typedef struct S463 T463;

/* [attached] TUPLE [GEANT_MOVE_TASK] */
typedef struct S464 T464;

/* GEANT_SETENV_COMMAND */
typedef struct S465 T465;

/* [attached] TUPLE [GEANT_SETENV_TASK] */
typedef struct S466 T466;

/* DS_PAIR [STRING_8, STRING_8] */
typedef struct S467 T467;

/* GEANT_XSLT_COMMAND */
typedef struct S468 T468;

/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S469 T469;

/* [attached] TUPLE [GEANT_XSLT_TASK] */
typedef struct S470 T470;

/* GEANT_OUTOFDATE_COMMAND */
typedef struct S471 T471;

/* [attached] TUPLE [GEANT_OUTOFDATE_TASK] */
typedef struct S472 T472;

/* GEANT_EXIT_COMMAND */
typedef struct S473 T473;

/* [attached] TUPLE [GEANT_EXIT_TASK] */
typedef struct S474 T474;

/* GEANT_PRECURSOR_COMMAND */
typedef struct S475 T475;

/* [attached] TUPLE [GEANT_PRECURSOR_TASK] */
typedef struct S476 T476;

/* GEANT_AVAILABLE_COMMAND */
typedef struct S477 T477;

/* [attached] TUPLE [GEANT_AVAILABLE_TASK] */
typedef struct S478 T478;

/* GEANT_INPUT_COMMAND */
typedef struct S479 T479;

/* [attached] TUPLE [GEANT_INPUT_TASK] */
typedef struct S480 T480;

/* GEANT_REPLACE_COMMAND */
typedef struct S481 T481;

/* [attached] TUPLE [GEANT_REPLACE_TASK] */
typedef struct S482 T482;

/* SPECIAL [ARRAY [INTEGER_32]] */
typedef struct S483 T483;

/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
typedef struct S484 T484;

/* detachable DS_LINKABLE [CHARACTER_8] */
typedef struct S485 T485;

/* detachable KL_EQUALITY_TESTER [GEANT_RENAME] */
typedef struct S486 T486;

/* KL_SPECIAL_ROUTINES [GEANT_RENAME] */
typedef struct S488 T488;

/* SPECIAL [GEANT_RENAME] */
typedef struct S489 T489;

/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8] */
typedef struct S490 T490;

/* detachable KL_EQUALITY_TESTER [GEANT_REDEFINE] */
typedef struct S491 T491;

/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE] */
typedef struct S493 T493;

/* SPECIAL [GEANT_REDEFINE] */
typedef struct S494 T494;

/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8] */
typedef struct S495 T495;

/* detachable KL_EQUALITY_TESTER [GEANT_SELECT] */
typedef struct S496 T496;

/* KL_SPECIAL_ROUTINES [GEANT_SELECT] */
typedef struct S498 T498;

/* SPECIAL [GEANT_SELECT] */
typedef struct S499 T499;

/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8] */
typedef struct S500 T500;

/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S501 T501;

/* TYPE [DEVELOPER_EXCEPTION] */
#define T502 EIF_TYPE_OBJ

/* [attached] TYPE [INTEGER_32] */
#define T507 EIF_TYPE_OBJ

/* DS_HASH_SET [INTEGER_32] */
typedef struct S508 T508;

/* GEANT_MAP_ELEMENT */
typedef struct S511 T511;

/* GEANT_MAP */
typedef struct S512 T512;

/* DS_HASH_SET [GEANT_FILESET_ENTRY] */
typedef struct S515 T515;

/* DS_HASH_SET [STRING_8] */
typedef struct S517 T517;

/* LX_DFA_WILDCARD */
typedef struct S519 T519;

/* DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8]]] */
typedef struct S521 T521;

/* [attached] TUPLE [STRING_8] */
typedef struct S522 T522;

/* [attached] PROCEDURE [[attached] NONE, [attached] TUPLE [STRING_8]] */
typedef struct S523 T523;

/* [attached] TUPLE [GEANT_ECHO_COMMAND] */
typedef struct S524 T524;

/* DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]]] */
typedef struct S526 T526;

/* KL_TEXT_OUTPUT_FILE */
typedef struct S527 T527;

/* [attached] TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN] */
typedef struct S528 T528;

/* [attached] PROCEDURE [[attached] NONE, [attached] TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]] */
typedef struct S529 T529;

/* [attached] TUPLE [GEANT_MKDIR_COMMAND] */
typedef struct S531 T531;

/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S532 T532;

/* SPECIAL [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S533 T533;

/* DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S534 T534;

/* DS_CELL [FUNCTION [ANY, TUPLE [STRING_8], BOOLEAN]] */
typedef struct S535 T535;

/* [attached] PREDICATE [[attached] NONE, [attached] TUPLE [STRING_8]] */
typedef struct S536 T536;

/* [attached] TUPLE [GEANT_AVAILABLE_COMMAND] */
typedef struct S537 T537;

/* DP_SHELL_COMMAND */
typedef struct S539 T539;

/* DS_CELL [BOOLEAN] */
typedef struct S540 T540;

/* DS_HASH_SET_CURSOR [STRING_8] */
typedef struct S542 T542;

/* GEANT_FILESET_ENTRY */
typedef struct S543 T543;

/* KL_BOOLEAN_ROUTINES */
typedef struct S544 T544;

/* ARRAY [BOOLEAN] */
typedef struct S545 T545;

/* GEANT_VARIABLES_VARIABLE_RESOLVER */
typedef struct S546 T546;

/* RX_PCRE_REGULAR_EXPRESSION */
typedef struct S547 T547;

/* KL_STRING_EQUALITY_TESTER */
typedef struct S548 T548;

/* KL_STDIN_FILE */
typedef struct S549 T549;

/* ARRAY [GEANT_VARIABLES] */
typedef struct S550 T550;

/* DS_HASH_SET_CURSOR [INTEGER_32] */
typedef struct S551 T551;

/* detachable KL_EQUALITY_TESTER [INTEGER_32] */
typedef struct S552 T552;

/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY] */
typedef struct S553 T553;

/* SPECIAL [GEANT_FILESET_ENTRY] */
typedef struct S554 T554;

/* detachable KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY] */
typedef struct S555 T555;

/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY] */
typedef struct S556 T556;

/* [attached] TYPE [GEANT_FILESET_ENTRY] */
#define T557 EIF_TYPE_OBJ

/* LX_WILDCARD_PARSER */
typedef struct S558 T558;

/* LX_DESCRIPTION */
typedef struct S559 T559;

/* LX_FULL_DFA */
typedef struct S560 T560;

/* KL_NULL_TEXT_OUTPUT_STREAM */
typedef struct S562 T562;

/* RX_BYTE_CODE */
typedef struct S567 T567;

/* RX_CHARACTER_SET */
typedef struct S568 T568;

/* RX_CASE_MAPPING */
typedef struct S569 T569;

/* ARRAY [RX_CHARACTER_SET] */
typedef struct S571 T571;

/* SPECIAL [RX_CHARACTER_SET] */
typedef struct S572 T572;

/* DS_ARRAYED_LIST [LX_RULE] */
typedef struct S573 T573;

/* LX_START_CONDITIONS */
typedef struct S574 T574;

/* LX_ACTION_FACTORY */
typedef struct S575 T575;

/* DS_ARRAYED_STACK [INTEGER_32] */
typedef struct S576 T576;

/* LX_SYMBOL_CLASS */
typedef struct S577 T577;

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8] */
typedef struct S578 T578;

/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS] */
typedef struct S579 T579;

/* SPECIAL [LX_SYMBOL_CLASS] */
typedef struct S580 T580;

/* KL_SPECIAL_ROUTINES [LX_NFA] */
typedef struct S581 T581;

/* LX_NFA */
typedef struct S582 T582;

/* SPECIAL [LX_NFA] */
typedef struct S583 T583;

/* LX_EQUIVALENCE_CLASSES */
typedef struct S584 T584;

/* LX_RULE */
typedef struct S585 T585;

/* UT_SYNTAX_ERROR */
typedef struct S586 T586;

/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
typedef struct S587 T587;

/* LX_UNRECOGNIZED_RULE_ERROR */
typedef struct S588 T588;

/* LX_MISSING_QUOTE_ERROR */
typedef struct S589 T589;

/* LX_BAD_CHARACTER_CLASS_ERROR */
typedef struct S590 T590;

/* LX_BAD_CHARACTER_ERROR */
typedef struct S591 T591;

/* LX_FULL_AND_META_ERROR */
typedef struct S592 T592;

/* LX_FULL_AND_REJECT_ERROR */
typedef struct S593 T593;

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR */
typedef struct S594 T594;

/* LX_CHARACTER_OUT_OF_RANGE_ERROR */
typedef struct S595 T595;

/* ARRAY [LX_RULE] */
typedef struct S596 T596;

/* SPECIAL [LX_RULE] */
typedef struct S597 T597;

/* LX_DFA_STATE */
typedef struct S598 T598;

/* DS_ARRAYED_LIST [LX_NFA_STATE] */
typedef struct S599 T599;

/* DS_ARRAYED_LIST [LX_DFA_STATE] */
typedef struct S600 T600;

/* LX_SYMBOL_PARTITIONS */
typedef struct S601 T601;

/* KL_ARRAY_ROUTINES [LX_RULE] */
typedef struct S602 T602;

/* LX_START_CONDITION */
typedef struct S603 T603;

/* LX_TRANSITION_TABLE [LX_DFA_STATE] */
typedef struct S604 T604;

/* DS_ARRAYED_LIST [LX_NFA] */
typedef struct S605 T605;

/* DS_HASH_TABLE [LX_NFA, INTEGER_32] */
typedef struct S606 T606;

/* LX_NFA_STATE */
typedef struct S607 T607;

/* KL_BINARY_INPUT_FILE */
typedef struct S608 T608;

/* KL_BINARY_OUTPUT_FILE */
typedef struct S609 T609;

/* PATH */
typedef struct S614 T614;

/* RAW_FILE */
typedef struct S615 T615;

/* DIRECTORY */
typedef struct S616 T616;

/* ARRAYED_LIST [READABLE_STRING_32] */
typedef struct S617 T617;

/* [attached] TUPLE [ARRAYED_LIST [READABLE_STRING_32]] */
typedef struct S618 T618;

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR */
typedef struct S619 T619;

/* KL_SPECIAL_ROUTINES [LX_RULE] */
typedef struct S620 T620;

/* DS_ARRAYED_LIST_CURSOR [LX_RULE] */
typedef struct S621 T621;

/* SPECIAL [LX_START_CONDITION] */
typedef struct S622 T622;

/* KL_SPECIAL_ROUTINES [LX_START_CONDITION] */
typedef struct S623 T623;

/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION] */
typedef struct S624 T624;

/* DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
typedef struct S625 T625;

/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE] */
typedef struct S628 T628;

/* LX_EPSILON_TRANSITION [LX_NFA_STATE] */
typedef struct S630 T630;

/* LX_SYMBOL_TRANSITION [LX_NFA_STATE] */
typedef struct S632 T632;

/* ARRAY [DS_BILINKABLE [INTEGER_32]] */
typedef struct S633 T633;

/* DS_BILINKABLE [INTEGER_32] */
typedef struct S634 T634;

/* SPECIAL [DS_BILINKABLE [INTEGER_32]] */
typedef struct S635 T635;

/* LX_ACTION */
typedef struct S637 T637;

/* DS_BUBBLE_SORTER [LX_NFA_STATE] */
typedef struct S638 T638;

/* DS_BUBBLE_SORTER [LX_RULE] */
typedef struct S640 T640;

/* SPECIAL [LX_NFA_STATE] */
typedef struct S642 T642;

/* KL_SPECIAL_ROUTINES [LX_NFA_STATE] */
typedef struct S644 T644;

/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE] */
typedef struct S645 T645;

/* SPECIAL [LX_DFA_STATE] */
typedef struct S647 T647;

/* KL_SPECIAL_ROUTINES [LX_DFA_STATE] */
typedef struct S648 T648;

/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE] */
typedef struct S649 T649;

/* KL_ARRAY [LX_RULE] */
typedef struct S650 T650;

/* ARRAY [detachable LX_DFA_STATE] */
typedef struct S651 T651;

/* KL_ARRAY_ROUTINES [detachable LX_DFA_STATE] */
typedef struct S652 T652;

/* DS_ARRAYED_LIST_CURSOR [LX_NFA] */
typedef struct S653 T653;

/* DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32] */
typedef struct S655 T655;

/* STRING_8_SEARCHER */
typedef struct S656 T656;

/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32] */
typedef struct S657 T657;

/* [attached] TYPE [BOOLEAN] */
#define T658 EIF_TYPE_OBJ

/* DS_SHELL_SORTER [INTEGER_32] */
typedef struct S661 T661;

/* KL_COMPARABLE_COMPARATOR [LX_RULE] */
typedef struct S663 T663;

/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE] */
typedef struct S666 T666;

/* ARRAYED_LIST [READABLE_STRING_GENERAL] */
typedef struct S669 T669;

/* [attached] TUPLE [ARRAYED_LIST [READABLE_STRING_GENERAL]] */
typedef struct S670 T670;

/* SPECIAL [READABLE_STRING_32] */
typedef struct S671 T671;

/* KL_COMPARABLE_COMPARATOR [INTEGER_32] */
typedef struct S672 T672;

/* SPECIAL [NATIVE_STRING] */
typedef struct S675 T675;

/* SPECIAL [READABLE_STRING_GENERAL] */
typedef struct S676 T676;

/* Struct for boxed version of type BOOLEAN */
struct Sb1 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 z1; /* item */
};

/* Struct for boxed version of type CHARACTER_8 */
struct Sb2 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T2 z1; /* item */
};

/* Struct for boxed version of type CHARACTER_32 */
struct Sb3 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T3 z1; /* item */
};

/* Struct for boxed version of type INTEGER_8 */
struct Sb4 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T4 z1; /* item */
};

/* Struct for boxed version of type INTEGER_16 */
struct Sb5 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T5 z1; /* item */
};

/* Struct for boxed version of type INTEGER_32 */
struct Sb6 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 z1; /* item */
};

/* Struct for boxed version of type INTEGER_64 */
struct Sb7 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T7 z1; /* item */
};

/* Struct for boxed version of type NATURAL_8 */
struct Sb8 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T8 z1; /* item */
};

/* Struct for boxed version of type NATURAL_16 */
struct Sb9 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T9 z1; /* item */
};

/* Struct for boxed version of type NATURAL_32 */
struct Sb10 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T10 z1; /* item */
};

/* Struct for boxed version of type NATURAL_64 */
struct Sb11 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T11 z1; /* item */
};

/* Struct for boxed version of type REAL_32 */
struct Sb12 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T12 z1; /* item */
};

/* Struct for boxed version of type REAL_64 */
struct Sb13 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T13 z1; /* item */
};

/* Struct for boxed version of type POINTER */
struct Sb14 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T14 z1; /* item */
};

/* Struct for type UTF_CONVERTER */
struct S125 {
	char dummy;
};

/* Struct for boxed version of type UTF_CONVERTER */
struct Sb125 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T125 z1; /* item */
};

/* Struct for type TYPED_POINTER [ANY] */
struct S277 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T14 a1; /* to_pointer */
};

/* Struct for boxed version of type TYPED_POINTER [ANY] */
struct Sb277 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T277 z1; /* item */
};

/* Struct for type TYPED_POINTER [NATURAL_16] */
struct S262 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T14 a1; /* to_pointer */
};

/* Struct for boxed version of type TYPED_POINTER [NATURAL_16] */
struct Sb262 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T262 z1; /* item */
};

/* Struct for type TYPED_POINTER [SPECIAL [NATURAL_8]] */
struct S180 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T14 a1; /* to_pointer */
};

/* Struct for boxed version of type TYPED_POINTER [SPECIAL [NATURAL_8]] */
struct Sb180 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T180 z1; /* item */
};

/* Struct for type TYPED_POINTER [NATURAL_8] */
struct S178 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T14 a1; /* to_pointer */
};

/* Struct for boxed version of type TYPED_POINTER [NATURAL_8] */
struct Sb178 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T178 z1; /* item */
};

/* Struct for type SPECIAL [CHARACTER_8] */
struct S15 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T2 z2[1]; /* item */
};

/* Struct for type SPECIAL [CHARACTER_32] */
struct S16 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T3 z2[1]; /* item */
};

/* Struct for type STRING_8 */
struct S17 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* area */
	T6 a2; /* count */
	T6 a3; /* internal_hash_code */
};

/* Struct for type STRING_32 */
struct S18 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* area */
	T6 a2; /* count */
	T6 a3; /* internal_hash_code */
};

/* Struct for type ISE_EXCEPTION_MANAGER */
struct S19 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type GEANT */
struct S22 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* error_handler */
	T1 a2; /* verbose */
	T1 a3; /* debug_mode */
	T1 a4; /* no_exec */
	T0* a5; /* build_filename */
	T0* a6; /* start_target_name */
	T1 a7; /* show_target_info */
};

/* Struct for type HASH_TABLE [INTEGER_32, INTEGER_32] */
struct S23 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* capacity */
	T0* a2; /* content */
	T0* a3; /* keys */
	T0* a4; /* deleted_marks */
	T0* a5; /* indexes_map */
	T6 a6; /* iteration_position */
	T6 a7; /* count */
	T6 a8; /* deleted_item_position */
	T6 a9; /* control */
	T6 a10; /* found_item */
	T1 a11; /* has_default */
	T6 a12; /* item_position */
	T6 a13; /* ht_lowest_deleted_position */
	T6 a14; /* ht_deleted_item */
	T6 a15; /* ht_deleted_key */
	T1 a16; /* object_comparison */
};

/* Struct for type CELL [detachable TUPLE [INTEGER_32, INTEGER_32, INTEGER_32, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, INTEGER_32, BOOLEAN]] */
struct S24 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
};

/* Struct for type CELL [detachable EXCEPTION] */
struct S25 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
};

/* Struct for type CELL [NO_MORE_MEMORY] */
struct S26 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
};

/* Struct for type [attached] TUPLE [INTEGER_32, INTEGER_32, INTEGER_32, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, INTEGER_32, BOOLEAN] */
struct S27 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 z1;
	T6 z2;
	T6 z3;
	T0* z4;
	T0* z5;
	T0* z6;
	T0* z7;
	T0* z8;
	T0* z9;
	T6 z10;
	T1 z11;
};

/* Struct for type GEANT_PROJECT */
struct S29 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* targets */
	T0* a2; /* name */
	T1 a3; /* build_successful */
	T0* a4; /* start_target_name */
	T0* a5; /* default_target_name */
	T0* a6; /* output_file */
	T0* a7; /* selected_targets */
	T0* a8; /* targets_stack */
	T0* a9; /* task_factory */
	T0* a10; /* options */
	T0* a11; /* inherit_clause */
	T0* a12; /* position_table */
	T0* a13; /* description */
	T1 a14; /* old_inherit */
	T0* a15; /* variables */
};

/* Struct for type GEANT_PROJECT_LOADER */
struct S30 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* project_element */
	T0* a2; /* build_filename */
};

/* Struct for type GEANT_PROJECT_OPTIONS */
struct S31 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* verbose */
	T1 a2; /* debug_mode */
	T1 a3; /* no_exec */
	T1 a4; /* variable_local_by_default */
};

/* Struct for type GEANT_PROJECT_VARIABLES */
struct S32 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* key_equality_tester */
	T0* a2; /* internal_keys */
	T6 a3; /* position */
	T6 a4; /* count */
	T6 a5; /* capacity */
	T6 a6; /* slots_position */
	T6 a7; /* free_slot */
	T6 a8; /* last_position */
	T0* a9; /* equality_tester */
	T6 a10; /* found_position */
	T6 a11; /* modulus */
	T6 a12; /* clashes_previous_position */
	T0* a13; /* special_item_routines */
	T0* a14; /* item_storage */
	T0* a15; /* clashes */
	T0* a16; /* slots */
	T0* a17; /* special_key_routines */
	T0* a18; /* key_storage */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type GEANT_TARGET */
struct S33 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* name */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
	T0* a5; /* formal_arguments */
	T0* a6; /* formal_locals */
	T0* a7; /* formal_globals */
	T0* a8; /* obsolete_message */
	T0* a9; /* exports */
	T1 a10; /* execute_once */
	T0* a11; /* description */
	T1 a12; /* is_executed */
	T0* a13; /* redefining_target */
	T0* a14; /* precursor_target */
};

/* Struct for type KL_ARGUMENTS */
struct S34 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* program_name */
};

/* Struct for type UT_ERROR_HANDLER */
struct S35 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* error_file */
	T0* a2; /* warning_file */
	T0* a3; /* info_file */
};

/* Struct for type GEANT_VARIABLES */
struct S36 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T6 a2; /* count */
	T6 a3; /* capacity */
	T6 a4; /* slots_position */
	T6 a5; /* free_slot */
	T6 a6; /* last_position */
	T0* a7; /* key_equality_tester */
	T0* a8; /* internal_keys */
	T6 a9; /* found_position */
	T6 a10; /* modulus */
	T6 a11; /* clashes_previous_position */
	T0* a12; /* special_item_routines */
	T0* a13; /* item_storage */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* special_key_routines */
	T0* a17; /* key_storage */
	T0* a18; /* equality_tester */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type GEANT_PROJECT_ELEMENT */
struct S37 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* project */
	T0* a2; /* xml_element */
};

/* Struct for type DS_HASH_TABLE [GEANT_TARGET, STRING_8] */
struct S38 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* found_position */
	T0* a2; /* item_storage */
	T0* a3; /* key_equality_tester */
	T0* a4; /* internal_keys */
	T6 a5; /* position */
	T6 a6; /* last_position */
	T6 a7; /* capacity */
	T6 a8; /* count */
	T0* a9; /* equality_tester */
	T6 a10; /* modulus */
	T6 a11; /* slots_position */
	T6 a12; /* clashes_previous_position */
	T0* a13; /* clashes */
	T0* a14; /* slots */
	T0* a15; /* special_item_routines */
	T0* a16; /* special_key_routines */
	T0* a17; /* key_storage */
	T6 a18; /* free_slot */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type ARRAY [STRING_8] */
struct S39 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type SPECIAL [STRING_8] */
struct S40 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type GEANT_ARGUMENT_VARIABLES */
struct S41 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T6 a2; /* count */
	T6 a3; /* capacity */
	T6 a4; /* slots_position */
	T6 a5; /* free_slot */
	T6 a6; /* last_position */
	T0* a7; /* key_equality_tester */
	T0* a8; /* internal_keys */
	T6 a9; /* found_position */
	T6 a10; /* modulus */
	T6 a11; /* clashes_previous_position */
	T0* a12; /* special_item_routines */
	T0* a13; /* item_storage */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* special_key_routines */
	T0* a17; /* key_storage */
	T0* a18; /* equality_tester */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type AP_FLAG */
struct S42 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* occurrences */
	T0* a2; /* description */
	T0* a3; /* long_form */
	T2 a4; /* short_form */
	T1 a5; /* has_short_form */
	T1 a6; /* is_mandatory */
	T6 a7; /* maximum_occurrences */
	T1 a8; /* is_hidden */
};

/* Struct for type AP_ALTERNATIVE_OPTIONS_LIST */
struct S43 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* introduction_option */
	T0* a2; /* parameters_description */
	T0* a3; /* internal_cursor */
	T0* a4; /* first_cell */
};

/* Struct for type AP_STRING_OPTION */
struct S44 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
	T0* a2; /* default_parameter */
	T0* a3; /* description */
	T0* a4; /* parameter_description */
	T1 a5; /* needs_parameter */
	T2 a6; /* short_form */
	T1 a7; /* has_short_form */
	T0* a8; /* long_form */
	T1 a9; /* is_mandatory */
	T6 a10; /* maximum_occurrences */
	T1 a11; /* is_hidden */
};

/* Struct for type AP_PARSER */
struct S45 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* options */
	T0* a2; /* alternative_options_lists */
	T0* a3; /* error_handler */
	T0* a4; /* parameters */
	T0* a5; /* help_option */
	T0* a6; /* application_description */
	T0* a7; /* parameters_description */
	T0* a8; /* current_options */
	T1 a9; /* is_first_option */
	T0* a10; /* last_option_parameter */
};

/* Struct for type AP_ERROR */
struct S47 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
	T0* a2; /* default_template */
	T0* a3; /* code */
};

/* Struct for type AP_ERROR_HANDLER */
struct S52 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* has_error */
	T0* a2; /* error_file */
	T0* a3; /* warning_file */
	T0* a4; /* info_file */
};

/* Struct for type KL_STANDARD_FILES */
struct S53 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_STDERR_FILE */
struct S54 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_EXCEPTIONS */
struct S55 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type UT_VERSION_NUMBER */
struct S56 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type VOID_TARGET */
struct S58 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type ROUTINE_FAILURE */
struct S60 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* routine_name */
	T0* a2; /* class_name */
	T0* a3; /* throwing_exception */
	T0* a4; /* internal_trace */
	T0* a5; /* c_description */
	T0* a6; /* recipient_name */
	T0* a7; /* type_name */
};

/* Struct for type OLD_VIOLATION */
struct S62 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type NO_MORE_MEMORY */
struct S64 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* internal_trace */
	T6 a2; /* internal_code */
	T0* a3; /* throwing_exception */
	T0* a4; /* c_description */
	T0* a5; /* recipient_name */
	T0* a6; /* type_name */
};

/* Struct for type INVARIANT_VIOLATION */
struct S65 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T1 a2; /* is_entry */
	T0* a3; /* internal_trace */
	T0* a4; /* c_description */
	T0* a5; /* recipient_name */
	T0* a6; /* type_name */
};

/* Struct for type OPERATING_SYSTEM_SIGNAL_FAILURE */
struct S66 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T6 a2; /* signal_code */
	T0* a3; /* internal_trace */
	T0* a4; /* c_description */
	T0* a5; /* recipient_name */
	T0* a6; /* type_name */
};

/* Struct for type IO_FAILURE */
struct S67 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* internal_code */
	T0* a2; /* throwing_exception */
	T6 a3; /* error_code */
	T0* a4; /* internal_trace */
	T0* a5; /* c_description */
	T0* a6; /* recipient_name */
	T0* a7; /* type_name */
};

/* Struct for type OPERATING_SYSTEM_FAILURE */
struct S68 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T6 a2; /* error_code */
	T0* a3; /* internal_trace */
	T0* a4; /* c_description */
	T0* a5; /* recipient_name */
	T0* a6; /* type_name */
};

/* Struct for type COM_FAILURE */
struct S69 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T6 a2; /* hresult_code */
	T0* a3; /* exception_information */
	T6 a4; /* hresult */
	T0* a5; /* internal_trace */
	T0* a6; /* c_description */
	T0* a7; /* recipient_name */
	T0* a8; /* type_name */
};

/* Struct for type EIFFEL_RUNTIME_PANIC */
struct S70 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* internal_code */
	T0* a2; /* throwing_exception */
	T0* a3; /* internal_trace */
	T0* a4; /* c_description */
	T0* a5; /* recipient_name */
	T0* a6; /* type_name */
};

/* Struct for type PRECONDITION_VIOLATION */
struct S73 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type POSTCONDITION_VIOLATION */
struct S74 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type FLOATING_POINT_FAILURE */
struct S75 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type CHECK_VIOLATION */
struct S76 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type BAD_INSPECT_VALUE */
struct S77 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type VARIANT_VIOLATION */
struct S78 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type LOOP_INVARIANT_VIOLATION */
struct S79 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type RESCUE_FAILURE */
struct S80 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type RESUMPTION_FAILURE */
struct S81 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type CREATE_ON_DEFERRED */
struct S82 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type EXTERNAL_FAILURE */
struct S83 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type VOID_ASSIGNED_TO_EXPANDED */
struct S84 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type EXCEPTION_IN_SIGNAL_HANDLER_FAILURE */
struct S85 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type MISMATCH_FAILURE */
struct S86 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type DEVELOPER_EXCEPTION */
struct S87 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type ADDRESS_APPLIED_TO_MELTED_FEATURE */
struct S88 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type SERIALIZATION_FAILURE */
struct S89 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type KL_OPERATING_SYSTEM */
struct S90 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_WINDOWS_FILE_SYSTEM */
struct S92 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T2 a1; /* secondary_directory_separator */
};

/* Struct for type KL_UNIX_FILE_SYSTEM */
struct S93 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type PRIMES */
struct S94 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [INTEGER_32] */
struct S95 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T6 z2[1]; /* item */
};

/* Struct for type SPECIAL [BOOLEAN] */
struct S96 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T1 z2[1]; /* item */
};

/* Struct for type KL_TEXT_INPUT_FILE */
struct S97 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* mode */
	T0* a2; /* internal_name */
	T0* a3; /* internal_detachable_name_pointer */
	T0* a4; /* last_string */
	T0* a5; /* name */
	T0* a6; /* character_buffer */
	T1 a7; /* end_of_file */
	T14 a8; /* file_pointer */
	T1 a9; /* descriptor_available */
	T2 a10; /* last_character */
};

/* Struct for type GEANT_PROJECT_PARSER */
struct S98 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* last_project_element */
	T0* a2; /* variables */
	T0* a3; /* options */
	T0* a4; /* build_filename */
	T0* a5; /* xml_parser */
	T0* a6; /* tree_pipe */
};

/* Struct for type GEANT_PROJECT_VARIABLE_RESOLVER */
struct S100 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* variables */
};

/* Struct for type UC_STRING_EQUALITY_TESTER */
struct S101 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_SPECIAL_ROUTINES [STRING_8] */
struct S104 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
struct S105 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [INTEGER_32] */
struct S106 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_STDOUT_FILE */
struct S108 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_LINKED_LIST_CURSOR [AP_OPTION] */
struct S109 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_ARRAYED_LIST [detachable STRING_8] */
struct S110 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* internal_cursor */
	T0* a4; /* special_routines */
	T6 a5; /* capacity */
	T0* a6; /* equality_tester */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [detachable STRING_8] */
struct S111 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type AP_DISPLAY_HELP_FLAG */
struct S112 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* description */
	T2 a2; /* short_form */
	T1 a3; /* has_short_form */
	T0* a4; /* long_form */
	T6 a5; /* occurrences */
	T1 a6; /* is_mandatory */
	T6 a7; /* maximum_occurrences */
	T1 a8; /* is_hidden */
};

/* Struct for type DS_ARRAYED_LIST [AP_OPTION] */
struct S113 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* internal_cursor */
	T6 a2; /* count */
	T0* a3; /* equality_tester */
	T0* a4; /* storage */
	T0* a5; /* special_routines */
	T6 a6; /* capacity */
};

/* Struct for type DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S114 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* internal_cursor */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T6 a5; /* count */
};

/* Struct for type KL_STRING_ROUTINES */
struct S115 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_HASH_TABLE [STRING_8, STRING_8] */
struct S120 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* key_equality_tester */
	T0* a2; /* internal_keys */
	T0* a3; /* equality_tester */
	T6 a4; /* capacity */
	T6 a5; /* modulus */
	T6 a6; /* last_position */
	T6 a7; /* free_slot */
	T6 a8; /* position */
	T0* a9; /* special_item_routines */
	T0* a10; /* item_storage */
	T0* a11; /* special_key_routines */
	T0* a12; /* key_storage */
	T0* a13; /* clashes */
	T0* a14; /* slots */
	T6 a15; /* found_position */
	T0* a16; /* internal_cursor */
	T6 a17; /* slots_position */
	T6 a18; /* count */
	T6 a19; /* clashes_previous_position */
	T0* a20; /* hash_function */
};

/* Struct for type ARGUMENTS_32 */
struct S121 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type IMMUTABLE_STRING_32 */
struct S122 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* area */
	T6 a2; /* count */
	T6 a3; /* internal_hash_code */
	T6 a4; /* area_lower */
};

/* Struct for type STD_FILES */
struct S124 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* default_output */
};

/* Struct for type CELL [INTEGER_32] */
struct S126 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* item */
};

/* Struct for type C_STRING */
struct S127 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* managed_data */
	T6 a2; /* count */
};

/* Struct for type MANAGED_POINTER */
struct S128 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T14 a2; /* item */
	T1 a3; /* is_shared */
};

/* Struct for type EXECUTION_ENVIRONMENT */
struct S129 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* return_code */
};

/* Struct for type KL_ANY_ROUTINES */
struct S130 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_PATHNAME */
struct S132 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* drive */
	T0* a3; /* hostname */
	T0* a4; /* sharename */
	T1 a5; /* is_relative */
	T0* a6; /* components */
};

/* Struct for type FILE_INFO */
struct S133 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* buffered_file_info */
	T1 a2; /* is_following_symlinks */
	T1 a3; /* exists */
	T0* a4; /* internal_file_name */
	T0* a5; /* internal_name_pointer */
};

/* Struct for type detachable KL_LINKABLE [CHARACTER_8] */
struct S135 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T2 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type XM_EXPAT_PARSER_FACTORY */
struct S136 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type XM_EIFFEL_PARSER */
struct S138 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* internal_last_error_description */
	T0* a2; /* scanner */
	T0* a3; /* error_positions */
	T0* a4; /* scanners */
	T1 a5; /* in_external_dtd */
	T0* a6; /* callbacks */
	T0* a7; /* entities */
	T0* a8; /* pe_entities */
	T0* a9; /* dtd_resolver */
	T0* a10; /* entity_resolver */
	T1 a11; /* use_namespaces */
	T6 a12; /* string_mode */
	T0* a13; /* dtd_callbacks */
	T0* a14; /* last_string_value */
	T0* a15; /* yyss */
	T0* a16; /* yyspecial_routines1 */
	T6 a17; /* yyvsc1 */
	T0* a18; /* yyvs1 */
	T0* a19; /* yyspecial_routines2 */
	T6 a20; /* yyvsc2 */
	T0* a21; /* yyvs2 */
	T0* a22; /* yyspecial_routines3 */
	T6 a23; /* yyvsc3 */
	T0* a24; /* yyvs3 */
	T0* a25; /* yyspecial_routines4 */
	T6 a26; /* yyvsc4 */
	T0* a27; /* yyvs4 */
	T0* a28; /* yyspecial_routines5 */
	T6 a29; /* yyvsc5 */
	T0* a30; /* yyvs5 */
	T0* a31; /* yyspecial_routines6 */
	T6 a32; /* yyvsc6 */
	T0* a33; /* yyvs6 */
	T0* a34; /* yyspecial_routines7 */
	T6 a35; /* yyvsc7 */
	T0* a36; /* yyvs7 */
	T0* a37; /* yyspecial_routines8 */
	T6 a38; /* yyvsc8 */
	T0* a39; /* yyvs8 */
	T0* a40; /* yyspecial_routines9 */
	T6 a41; /* yyvsc9 */
	T0* a42; /* yyvs9 */
	T0* a43; /* yyspecial_routines10 */
	T6 a44; /* yyvsc10 */
	T0* a45; /* yyvs10 */
	T0* a46; /* yyspecial_routines11 */
	T6 a47; /* yyvsc11 */
	T0* a48; /* yyvs11 */
	T0* a49; /* yytranslate */
	T0* a50; /* yyr1 */
	T0* a51; /* yytypes1 */
	T0* a52; /* yytypes2 */
	T0* a53; /* yydefact */
	T0* a54; /* yydefgoto */
	T0* a55; /* yypact */
	T0* a56; /* yypgoto */
	T0* a57; /* yytable */
	T0* a58; /* yycheck */
	T6 a59; /* yy_parsing_status */
	T6 a60; /* yy_suspended_yystacksize */
	T6 a61; /* yy_suspended_yystate */
	T6 a62; /* yy_suspended_yyn */
	T6 a63; /* yy_suspended_yychar1 */
	T6 a64; /* yy_suspended_index */
	T6 a65; /* yy_suspended_yyss_top */
	T6 a66; /* yy_suspended_yy_goto */
	T6 a67; /* yyssp */
	T6 a68; /* error_count */
	T1 a69; /* yy_lookahead_needed */
	T6 a70; /* yyerrstatus */
	T6 a71; /* last_token */
	T6 a72; /* yyvsp1 */
	T6 a73; /* yyvsp2 */
	T6 a74; /* yyvsp3 */
	T6 a75; /* yyvsp4 */
	T6 a76; /* yyvsp5 */
	T6 a77; /* yyvsp6 */
	T6 a78; /* yyvsp7 */
	T6 a79; /* yyvsp8 */
	T6 a80; /* yyvsp9 */
	T6 a81; /* yyvsp10 */
	T6 a82; /* yyvsp11 */
	T0* a83; /* last_detachable_any_value */
};

/* Struct for type XM_TREE_CALLBACKS_PIPE */
struct S139 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* start */
	T0* a2; /* tree */
	T0* a3; /* error */
	T0* a4; /* last */
};

/* Struct for type XM_CALLBACKS_TO_TREE_FILTER */
struct S142 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* last_position_table */
	T0* a2; /* document */
	T0* a3; /* source_parser */
	T0* a4; /* current_element */
	T0* a5; /* namespace_cache */
	T0* a6; /* next */
};

/* Struct for type XM_DOCUMENT */
struct S143 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* root_element */
	T0* a2; /* children */
};

/* Struct for type XM_ELEMENT */
struct S144 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parent */
	T0* a2; /* children */
	T0* a3; /* namespace */
	T0* a4; /* name */
};

/* Struct for type XM_STOP_ON_ERROR_FILTER */
struct S145 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* has_error */
	T0* a2; /* last_error */
	T0* a3; /* next */
};

/* Struct for type XM_POSITION_TABLE */
struct S146 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* table */
};

/* Struct for type KL_EXECUTION_ENVIRONMENT */
struct S149 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES] */
struct S150 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type DS_ARRAYED_STACK [GEANT_VARIABLES] */
struct S151 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [AP_OPTION] */
struct S152 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [AP_OPTION] */
struct S154 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [AP_OPTION] */
struct S155 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S156 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S157 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S158 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type UC_STRING */
struct S159 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* byte_count */
	T6 a3; /* internal_hash_code */
	T0* a4; /* area */
	T6 a5; /* last_byte_index_input */
	T6 a6; /* last_byte_index_result */
};

/* Struct for type STRING_TO_INTEGER_CONVERTOR */
struct S161 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* sign */
	T11 a2; /* part1 */
	T11 a3; /* part2 */
	T6 a4; /* last_state */
	T1 a5; /* internal_overflowed */
	T0* a6; /* leading_separators */
	T0* a7; /* trailing_separators */
	T6 a8; /* conversion_type */
	T1 a9; /* leading_separators_acceptable */
	T1 a10; /* trailing_separators_acceptable */
};

/* Struct for type DS_LINKED_LIST [XM_ELEMENT] */
struct S163 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* last_cell */
	T0* a3; /* first_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_LINKED_LIST_CURSOR [XM_ELEMENT] */
struct S164 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type GEANT_INHERIT_ELEMENT */
struct S165 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* geant_inherit */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_INHERIT */
struct S166 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parents */
	T0* a2; /* project */
};

/* Struct for type SPECIAL [GEANT_TARGET] */
struct S167 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_TARGET] */
struct S170 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8] */
struct S171 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T0* a2; /* container */
	T0* a3; /* next_cursor */
};

/* Struct for type ARRAY [IMMUTABLE_STRING_32] */
struct S172 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
	T1 a4; /* object_comparison */
};

/* Struct for type SPECIAL [IMMUTABLE_STRING_32] */
struct S173 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type NATIVE_STRING */
struct S174 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* managed_data */
	T6 a2; /* unit_count */
};

/* Struct for type READABLE_STRING_32 */
struct S175 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type CONSOLE */
struct S176 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T14 a1; /* file_pointer */
	T6 a2; /* mode */
	T0* a3; /* last_string */
	T0* a4; /* internal_name */
	T0* a5; /* internal_detachable_name_pointer */
	T2 a6; /* last_character */
};

/* Struct for type EXCEPTIONS */
struct S177 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [NATURAL_8] */
struct S179 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T8 z2[1]; /* item */
};

/* Struct for type PLATFORM */
struct S181 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type XM_EIFFEL_SCANNER */
struct S183 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* last_token */
	T0* a2; /* last_value */
	T0* a3; /* input_name */
	T6 a4; /* position */
	T6 a5; /* column */
	T6 a6; /* line */
	T0* a7; /* input_filter */
	T6 a8; /* yy_start_state */
	T0* a9; /* character_entity */
	T0* a10; /* input_stream */
	T0* a11; /* input_resolver */
	T1 a12; /* yy_more_flag */
	T6 a13; /* yy_more_len */
	T6 a14; /* yy_end */
	T6 a15; /* yy_start */
	T6 a16; /* yy_line */
	T6 a17; /* yy_column */
	T6 a18; /* yy_position */
	T0* a19; /* input_buffer */
	T0* a20; /* yy_state_stack */
	T6 a21; /* yy_state_count */
	T0* a22; /* yy_content_area */
	T0* a23; /* yy_ec */
	T0* a24; /* yy_content */
	T0* a25; /* yy_accept */
	T6 a26; /* yy_last_accepting_state */
	T6 a27; /* yy_last_accepting_cpos */
	T0* a28; /* yy_chk */
	T0* a29; /* yy_base */
	T0* a30; /* yy_def */
	T0* a31; /* yy_meta */
	T0* a32; /* yy_nxt */
	T6 a33; /* yy_lp */
	T0* a34; /* yy_acclist */
	T6 a35; /* yy_looking_for_trail_begin */
	T6 a36; /* yy_full_match */
	T6 a37; /* yy_full_state */
	T6 a38; /* yy_full_lp */
	T1 a39; /* yy_rejected */
	T0* a40; /* yy_pushed_start_conditions */
	T0* a41; /* last_string_value */
	T0* a42; /* last_error */
	T6 a43; /* pushed_start_condition_count */
};

/* Struct for type XM_DEFAULT_POSITION */
struct S184 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* source_name */
	T6 a2; /* row */
	T6 a3; /* column */
	T6 a4; /* byte_index */
};

/* Struct for type DS_BILINKED_LIST [XM_POSITION] */
struct S186 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* first_cell */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
struct S187 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* first_cell */
};

/* Struct for type XM_CALLBACKS_NULL */
struct S188 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S189 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T0* a2; /* item_storage */
	T6 a3; /* count */
	T6 a4; /* last_position */
	T6 a5; /* free_slot */
	T6 a6; /* capacity */
	T0* a7; /* key_equality_tester */
	T0* a8; /* internal_keys */
	T6 a9; /* modulus */
	T6 a10; /* slots_position */
	T6 a11; /* clashes_previous_position */
	T0* a12; /* internal_cursor */
	T6 a13; /* found_position */
	T0* a14; /* key_storage */
	T0* a15; /* clashes */
	T0* a16; /* slots */
	T0* a17; /* special_item_routines */
	T0* a18; /* special_key_routines */
	T0* a19; /* equality_tester */
	T0* a20; /* hash_function */
};

/* Struct for type XM_NULL_EXTERNAL_RESOLVER */
struct S191 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type XM_DTD_CALLBACKS_NULL */
struct S193 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_SPECIAL_ROUTINES [detachable ANY] */
struct S194 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [detachable ANY] */
struct S195 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
struct S196 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type XM_EIFFEL_PARSER_NAME */
struct S197 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* use_namespaces */
	T6 a2; /* count */
	T0* a3; /* first */
	T0* a4; /* second */
	T0* a5; /* tail */
};

/* Struct for type SPECIAL [XM_EIFFEL_PARSER_NAME] */
struct S198 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S199 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
struct S200 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T0* a2; /* equality_tester */
	T6 a3; /* count */
	T6 a4; /* capacity */
	T6 a5; /* free_slot */
	T6 a6; /* last_position */
	T6 a7; /* modulus */
	T6 a8; /* slots_position */
	T6 a9; /* clashes_previous_position */
	T6 a10; /* found_position */
	T0* a11; /* clashes */
	T0* a12; /* slots */
	T0* a13; /* special_item_routines */
	T0* a14; /* item_storage */
	T0* a15; /* internal_cursor */
	T0* a16; /* hash_function */
};

/* Struct for type SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S201 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
struct S202 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type XM_DTD_EXTERNAL_ID */
struct S203 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* system_id */
	T0* a2; /* public_id */
};

/* Struct for type SPECIAL [XM_DTD_EXTERNAL_ID] */
struct S204 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
struct S205 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type XM_DTD_ELEMENT_CONTENT */
struct S206 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* items */
	T2 a2; /* repetition */
	T0* a3; /* name */
	T2 a4; /* type */
	T1 a5; /* is_character_data_allowed */
};

/* Struct for type SPECIAL [XM_DTD_ELEMENT_CONTENT] */
struct S207 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S208 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
struct S209 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* last_cell */
	T6 a2; /* count */
	T0* a3; /* first_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S210 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
struct S211 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type XM_DTD_ATTRIBUTE_CONTENT */
struct S212 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* name */
	T0* a2; /* default_value */
	T2 a3; /* type */
	T1 a4; /* is_list_type */
	T0* a5; /* enumeration_list */
	T2 a6; /* value */
};

/* Struct for type SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
struct S213 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
struct S214 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_BILINKED_LIST [STRING_8] */
struct S215 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* last_cell */
	T6 a2; /* count */
	T0* a3; /* first_cell */
	T0* a4; /* equality_tester */
	T0* a5; /* internal_cursor */
};

/* Struct for type SPECIAL [DS_BILINKED_LIST [STRING_8]] */
struct S216 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [BOOLEAN] */
struct S217 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
struct S218 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type XM_EIFFEL_DECLARATION */
struct S219 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* encoding */
	T0* a2; /* version */
	T1 a3; /* stand_alone */
};

/* Struct for type SPECIAL [XM_EIFFEL_DECLARATION] */
struct S220 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type XM_EIFFEL_ENTITY_DEF */
struct S223 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* literal_name */
	T0* a2; /* value */
	T0* a3; /* resolver */
	T0* a4; /* external_id */
	T0* a5; /* character_entity */
	T0* a6; /* yy_pushed_start_conditions */
	T0* a7; /* input_buffer */
	T1 a8; /* in_use */
	T0* a9; /* input_name */
	T0* a10; /* last_value */
	T0* a11; /* last_string_value */
	T0* a12; /* last_error */
	T1 a13; /* yy_rejected */
	T6 a14; /* yy_state_count */
	T6 a15; /* yy_full_match */
	T6 a16; /* yy_lp */
	T6 a17; /* yy_looking_for_trail_begin */
	T6 a18; /* yy_full_lp */
	T6 a19; /* yy_full_state */
	T6 a20; /* pushed_start_condition_count */
	T6 a21; /* yy_start_state */
	T6 a22; /* yy_line */
	T6 a23; /* yy_column */
	T6 a24; /* yy_position */
	T6 a25; /* yy_start */
	T6 a26; /* yy_end */
	T6 a27; /* line */
	T6 a28; /* column */
	T6 a29; /* position */
	T1 a30; /* yy_more_flag */
	T6 a31; /* yy_more_len */
	T6 a32; /* yy_last_accepting_state */
	T6 a33; /* yy_last_accepting_cpos */
	T0* a34; /* yy_state_stack */
	T0* a35; /* yy_nxt */
	T0* a36; /* yy_chk */
	T0* a37; /* yy_base */
	T0* a38; /* yy_def */
	T0* a39; /* yy_ec */
	T0* a40; /* yy_meta */
	T0* a41; /* yy_accept */
	T0* a42; /* yy_content */
	T0* a43; /* yy_content_area */
	T6 a44; /* last_token */
	T0* a45; /* input_filter */
	T0* a46; /* input_stream */
	T0* a47; /* input_resolver */
	T0* a48; /* yy_acclist */
};

/* Struct for type XM_EIFFEL_SCANNER_DTD */
struct S224 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* last_token */
	T0* a2; /* last_value */
	T0* a3; /* input_name */
	T6 a4; /* position */
	T6 a5; /* column */
	T6 a6; /* line */
	T0* a7; /* input_filter */
	T6 a8; /* yy_start_state */
	T0* a9; /* character_entity */
	T0* a10; /* input_stream */
	T0* a11; /* input_resolver */
	T1 a12; /* decl_start_sent */
	T1 a13; /* decl_end_sent */
	T1 a14; /* yy_more_flag */
	T6 a15; /* yy_more_len */
	T6 a16; /* yy_end */
	T6 a17; /* yy_start */
	T6 a18; /* yy_line */
	T6 a19; /* yy_column */
	T6 a20; /* yy_position */
	T0* a21; /* input_buffer */
	T0* a22; /* yy_state_stack */
	T6 a23; /* yy_state_count */
	T0* a24; /* yy_content_area */
	T0* a25; /* yy_ec */
	T0* a26; /* yy_content */
	T0* a27; /* yy_accept */
	T6 a28; /* yy_last_accepting_state */
	T6 a29; /* yy_last_accepting_cpos */
	T0* a30; /* yy_chk */
	T0* a31; /* yy_base */
	T0* a32; /* yy_def */
	T0* a33; /* yy_meta */
	T0* a34; /* yy_nxt */
	T6 a35; /* yy_lp */
	T0* a36; /* yy_acclist */
	T6 a37; /* yy_looking_for_trail_begin */
	T6 a38; /* yy_full_match */
	T6 a39; /* yy_full_state */
	T6 a40; /* yy_full_lp */
	T1 a41; /* yy_rejected */
	T0* a42; /* yy_pushed_start_conditions */
	T0* a43; /* last_string_value */
	T0* a44; /* last_error */
	T6 a45; /* pushed_start_condition_count */
};

/* Struct for type XM_EIFFEL_PE_ENTITY_DEF */
struct S226 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* resolver */
	T0* a2; /* external_id */
	T0* a3; /* literal_name */
	T0* a4; /* value */
	T0* a5; /* character_entity */
	T0* a6; /* yy_pushed_start_conditions */
	T0* a7; /* input_buffer */
	T1 a8; /* in_use */
	T0* a9; /* input_name */
	T0* a10; /* last_value */
	T0* a11; /* last_string_value */
	T0* a12; /* last_error */
	T1 a13; /* yy_rejected */
	T6 a14; /* yy_state_count */
	T6 a15; /* yy_full_match */
	T6 a16; /* yy_lp */
	T6 a17; /* yy_looking_for_trail_begin */
	T6 a18; /* yy_full_lp */
	T6 a19; /* yy_full_state */
	T6 a20; /* pushed_start_condition_count */
	T6 a21; /* yy_start_state */
	T6 a22; /* yy_line */
	T6 a23; /* yy_column */
	T6 a24; /* yy_position */
	T6 a25; /* yy_start */
	T6 a26; /* yy_end */
	T6 a27; /* line */
	T6 a28; /* column */
	T6 a29; /* position */
	T1 a30; /* yy_more_flag */
	T6 a31; /* yy_more_len */
	T6 a32; /* yy_last_accepting_state */
	T6 a33; /* yy_last_accepting_cpos */
	T0* a34; /* yy_state_stack */
	T1 a35; /* pre_sent */
	T1 a36; /* post_sent */
	T0* a37; /* yy_nxt */
	T0* a38; /* yy_chk */
	T0* a39; /* yy_base */
	T0* a40; /* yy_def */
	T0* a41; /* yy_ec */
	T0* a42; /* yy_meta */
	T0* a43; /* yy_accept */
	T0* a44; /* yy_content */
	T0* a45; /* yy_content_area */
	T6 a46; /* last_token */
	T0* a47; /* input_filter */
	T0* a48; /* input_stream */
	T0* a49; /* input_resolver */
	T0* a50; /* yy_acclist */
};

/* Struct for type XM_NAMESPACE_RESOLVER */
struct S227 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* next */
	T0* a2; /* element_local_part */
	T0* a3; /* element_prefix */
	T0* a4; /* context */
	T1 a5; /* forward_xmlns */
	T0* a6; /* attributes_prefix */
	T0* a7; /* attributes_local_part */
	T0* a8; /* attributes_value */
};

/* Struct for type ARRAY [XM_CALLBACKS_FILTER] */
struct S228 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type SPECIAL [XM_CALLBACKS_FILTER] */
struct S229 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_SET [XM_NAMESPACE] */
struct S230 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* equality_tester */
	T6 a2; /* capacity */
	T6 a3; /* modulus */
	T6 a4; /* last_position */
	T6 a5; /* free_slot */
	T6 a6; /* position */
	T0* a7; /* special_item_routines */
	T0* a8; /* item_storage */
	T0* a9; /* clashes */
	T0* a10; /* slots */
	T6 a11; /* found_position */
	T0* a12; /* internal_cursor */
	T6 a13; /* slots_position */
	T6 a14; /* count */
	T6 a15; /* clashes_previous_position */
	T0* a16; /* hash_function */
};

/* Struct for type XM_NAMESPACE */
struct S231 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* uri */
	T0* a2; /* ns_prefix */
};

/* Struct for type XM_LINKED_LIST [XM_DOCUMENT_NODE] */
struct S232 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* last_cell */
	T0* a3; /* first_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE] */
struct S236 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type XM_LINKED_LIST [XM_ELEMENT_NODE] */
struct S239 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* internal_cursor */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* first_cell */
};

/* Struct for type DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S241 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* internal_cursor */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* first_cell */
};

/* Struct for type SPECIAL [GEANT_ARGUMENT_VARIABLES] */
struct S242 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES] */
struct S243 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [GEANT_VARIABLES] */
struct S244 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_VARIABLES] */
struct S245 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_ARRAYED_STACK [GEANT_TARGET] */
struct S247 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type GEANT_TASK_FACTORY */
struct S248 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* project */
	T0* a2; /* builders */
};

/* Struct for type GEANT_PARENT */
struct S249 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* renames */
	T0* a2; /* parent_project */
	T0* a3; /* redefines */
	T0* a4; /* selects */
	T0* a5; /* project */
	T0* a6; /* unchanged_targets */
	T0* a7; /* renamed_targets */
	T0* a8; /* redefined_targets */
};

/* Struct for type DS_ARRAYED_LIST [GEANT_PARENT] */
struct S251 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T6 a4; /* count */
	T0* a5; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [GEANT_PARENT] */
struct S252 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T0* a2; /* container */
	T0* a3; /* next_cursor */
};

/* Struct for type GEANT_INTERPRETING_ELEMENT */
struct S253 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* project */
	T0* a2; /* xml_element */
	T0* a3; /* position */
};

/* Struct for type GEANT_ARGUMENT_ELEMENT */
struct S254 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* xml_element */
};

/* Struct for type GEANT_LOCAL_ELEMENT */
struct S255 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* xml_element */
};

/* Struct for type GEANT_GLOBAL_ELEMENT */
struct S256 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* xml_element */
};

/* Struct for type XM_ATTRIBUTE */
struct S257 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* name */
	T0* a2; /* namespace */
	T0* a3; /* value */
	T0* a4; /* parent */
};

/* Struct for type GEANT_GROUP */
struct S258 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* project */
	T0* a2; /* xml_element */
	T0* a3; /* position */
	T0* a4; /* parent */
	T0* a5; /* description */
};

/* Struct for type ARRAY [INTEGER_32] */
struct S263 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type UC_UTF8_ROUTINES */
struct S264 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type UC_UTF8_STRING */
struct S265 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* area */
	T6 a3; /* byte_count */
	T6 a4; /* internal_hash_code */
	T6 a5; /* last_byte_index_input */
	T6 a6; /* last_byte_index_result */
};

/* Struct for type XM_EIFFEL_INPUT_STREAM */
struct S266 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* last_string */
	T6 a2; /* encoding */
	T0* a3; /* impl */
	T0* a4; /* utf_queue */
};

/* Struct for type KL_INTEGER_ROUTINES */
struct S267 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_PLATFORM */
struct S268 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_ARRAY_ROUTINES [INTEGER_32] */
struct S269 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE] */
struct S270 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S271 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_PAIR [XM_POSITION, XM_NODE] */
struct S272 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* first */
	T0* a2; /* second */
};

/* Struct for type INTEGER_OVERFLOW_CHECKER */
struct S273 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* integer_overflow_state1 */
	T0* a2; /* integer_overflow_state2 */
	T0* a3; /* natural_overflow_state1 */
	T0* a4; /* natural_overflow_state2 */
};

/* Struct for type detachable DS_LINKABLE [XM_ELEMENT] */
struct S274 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type GEANT_PARENT_ELEMENT */
struct S275 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parent */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type XM_EIFFEL_CHARACTER_ENTITY */
struct S278 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* code */
};

/* Struct for type YY_BUFFER */
struct S279 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* beginning_of_line */
	T6 a2; /* count */
	T1 a3; /* filled */
	T0* a4; /* content */
	T6 a5; /* index */
	T6 a6; /* line */
	T6 a7; /* column */
	T6 a8; /* position */
	T6 a9; /* capacity */
};

/* Struct for type YY_FILE_BUFFER */
struct S280 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* beginning_of_line */
	T6 a2; /* count */
	T1 a3; /* filled */
	T0* a4; /* content */
	T6 a5; /* index */
	T6 a6; /* line */
	T6 a7; /* column */
	T6 a8; /* position */
	T0* a9; /* file */
	T1 a10; /* end_of_file */
	T6 a11; /* capacity */
	T1 a12; /* interactive */
};

/* Struct for type detachable DS_BILINKABLE [XM_POSITION] */
struct S284 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_POSITION] */
struct S285 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type detachable DS_LINKABLE [XM_EIFFEL_SCANNER] */
struct S286 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type SPECIAL [XM_EIFFEL_ENTITY_DEF] */
struct S287 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type detachable DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S290 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T6 a3; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
struct S291 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type detachable KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
struct S293 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
struct S294 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
struct S295 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* first_cell */
	T6 a2; /* count */
	T0* a3; /* last_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
struct S296 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type detachable DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
struct S297 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_LINKED_LIST [STRING_8] */
struct S298 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* internal_cursor */
	T6 a2; /* count */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
	T0* a5; /* equality_tester */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [STRING_8] */
struct S299 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type detachable DS_BILINKABLE [STRING_8] */
struct S300 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type XM_NAMESPACE_RESOLVER_CONTEXT */
struct S301 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* context */
};

/* Struct for type DS_LINKED_QUEUE [STRING_8] */
struct S303 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* first_cell */
	T6 a2; /* count */
	T0* a3; /* last_cell */
};

/* Struct for type detachable KL_EQUALITY_TESTER [XM_NAMESPACE] */
struct S304 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_HASH_SET_CURSOR [XM_NAMESPACE] */
struct S305 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
struct S306 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [XM_NAMESPACE] */
struct S307 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type detachable DS_LINKABLE [XM_DOCUMENT_NODE] */
struct S308 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type GEANT_STRING_INTERPRETER */
struct S312 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* variable_resolver */
};

/* Struct for type GEANT_NAME_VALUE_ELEMENT */
struct S314 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* xml_element */
};

/* Struct for type KL_ARRAY_ROUTINES [detachable STRING_8] */
struct S318 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type AP_OPTION_COMPARATOR */
struct S319 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_QUICK_SORTER [AP_OPTION] */
struct S320 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* comparator */
};

/* Struct for type ST_WORD_WRAPPER */
struct S322 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* new_line_indentation */
	T6 a2; /* broken_words */
	T6 a3; /* maximum_text_width */
};

/* Struct for type HEXADECIMAL_STRING_TO_INTEGER_CONVERTER */
struct S324 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* last_state */
	T1 a2; /* internal_overflowed */
	T11 a3; /* part1 */
	T11 a4; /* part2 */
	T0* a5; /* leading_separators */
	T0* a6; /* trailing_separators */
	T6 a7; /* sign */
	T6 a8; /* conversion_type */
	T2 a9; /* internal_lookahead */
	T1 a10; /* leading_separators_acceptable */
	T1 a11; /* trailing_separators_acceptable */
};

/* Struct for type XM_COMMENT */
struct S325 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* data */
	T0* a2; /* parent */
};

/* Struct for type XM_PROCESSING_INSTRUCTION */
struct S326 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* target */
	T0* a2; /* data */
	T0* a3; /* parent */
};

/* Struct for type XM_CHARACTER_DATA */
struct S327 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* content */
	T0* a2; /* parent */
};

/* Struct for type detachable DS_LINKABLE [XM_ELEMENT_NODE] */
struct S329 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* right */
	T0* a2; /* item */
};

/* Struct for type detachable DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S330 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
struct S331 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T0* a2; /* item_storage */
	T0* a3; /* key_equality_tester */
	T0* a4; /* internal_keys */
	T6 a5; /* count */
	T6 a6; /* capacity */
	T6 a7; /* free_slot */
	T6 a8; /* last_position */
	T6 a9; /* modulus */
	T6 a10; /* slots_position */
	T6 a11; /* clashes_previous_position */
	T0* a12; /* equality_tester */
	T6 a13; /* found_position */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* special_item_routines */
	T0* a17; /* special_key_routines */
	T0* a18; /* key_storage */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type GEANT_GEC_TASK */
struct S332 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] TUPLE [XM_ELEMENT] */
struct S333 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEC_TASK] */
struct S334 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type detachable TUPLE */
struct S335 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type [attached] TUPLE [GEANT_TASK_FACTORY] */
struct S336 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type GEANT_ISE_TASK */
struct S338 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_ISE_TASK] */
struct S339 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_EXEC_TASK */
struct S340 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_EXEC_TASK] */
struct S341 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_LCC_TASK */
struct S342 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_LCC_TASK] */
struct S343 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_SET_TASK */
struct S344 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_SET_TASK] */
struct S345 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_UNSET_TASK */
struct S346 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_UNSET_TASK] */
struct S347 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_GEXACE_TASK */
struct S348 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* position */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEXACE_TASK] */
struct S349 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_GELEX_TASK */
struct S350 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GELEX_TASK] */
struct S351 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_GEYACC_TASK */
struct S352 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEYACC_TASK] */
struct S353 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_GEPP_TASK */
struct S354 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEPP_TASK] */
struct S355 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_GETEST_TASK */
struct S356 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* position */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GETEST_TASK] */
struct S357 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_GEANT_TASK */
struct S358 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEANT_TASK] */
struct S359 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_ECHO_TASK */
struct S360 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_ECHO_TASK] */
struct S361 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_MKDIR_TASK */
struct S362 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_MKDIR_TASK] */
struct S363 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_DELETE_TASK */
struct S364 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_DELETE_TASK] */
struct S365 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_COPY_TASK */
struct S366 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_COPY_TASK] */
struct S367 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_MOVE_TASK */
struct S368 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_MOVE_TASK] */
struct S369 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_SETENV_TASK */
struct S370 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_SETENV_TASK] */
struct S371 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_XSLT_TASK */
struct S372 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* position */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_XSLT_TASK] */
struct S373 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_OUTOFDATE_TASK */
struct S374 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_OUTOFDATE_TASK] */
struct S375 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_EXIT_TASK */
struct S376 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_EXIT_TASK] */
struct S377 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_PRECURSOR_TASK */
struct S378 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* position */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_PRECURSOR_TASK] */
struct S379 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_AVAILABLE_TASK */
struct S380 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_AVAILABLE_TASK] */
struct S381 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_INPUT_TASK */
struct S382 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_INPUT_TASK] */
struct S383 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type GEANT_REPLACE_TASK */
struct S384 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_REPLACE_TASK] */
struct S385 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*, T0*);
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_PARENT] */
struct S386 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [GEANT_PARENT] */
struct S387 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type UC_UNICODE_ROUTINES */
struct S389 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_LINKED_QUEUE [CHARACTER_8] */
struct S391 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
};

/* Struct for type UC_UTF16_ROUTINES */
struct S392 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [NATURAL_64] */
struct S393 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T11 z2[1]; /* item */
};

/* Struct for type GEANT_RENAME_ELEMENT */
struct S394 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* rename_clause */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_REDEFINE_ELEMENT */
struct S395 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* redefine_clause */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_SELECT_ELEMENT */
struct S396 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* select_clause */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_RENAME */
struct S397 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* original_name */
	T0* a2; /* new_name */
};

/* Struct for type DS_HASH_TABLE [GEANT_RENAME, STRING_8] */
struct S398 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T0* a2; /* equality_tester */
	T6 a3; /* last_position */
	T6 a4; /* capacity */
	T6 a5; /* slots_position */
	T6 a6; /* count */
	T0* a7; /* key_equality_tester */
	T0* a8; /* internal_keys */
	T6 a9; /* modulus */
	T6 a10; /* clashes_previous_position */
	T6 a11; /* found_position */
	T0* a12; /* special_item_routines */
	T0* a13; /* item_storage */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* special_key_routines */
	T0* a17; /* key_storage */
	T6 a18; /* free_slot */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type GEANT_REDEFINE */
struct S399 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* name */
};

/* Struct for type DS_HASH_TABLE [GEANT_REDEFINE, STRING_8] */
struct S400 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* equality_tester */
	T6 a2; /* position */
	T6 a3; /* last_position */
	T6 a4; /* capacity */
	T6 a5; /* slots_position */
	T6 a6; /* count */
	T0* a7; /* key_equality_tester */
	T0* a8; /* internal_keys */
	T6 a9; /* found_position */
	T6 a10; /* modulus */
	T6 a11; /* clashes_previous_position */
	T0* a12; /* special_item_routines */
	T0* a13; /* item_storage */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* special_key_routines */
	T0* a17; /* key_storage */
	T6 a18; /* free_slot */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type GEANT_SELECT */
struct S401 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* name */
};

/* Struct for type DS_HASH_TABLE [GEANT_SELECT, STRING_8] */
struct S402 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* equality_tester */
	T6 a2; /* position */
	T6 a3; /* last_position */
	T6 a4; /* capacity */
	T6 a5; /* slots_position */
	T6 a6; /* count */
	T0* a7; /* key_equality_tester */
	T0* a8; /* internal_keys */
	T6 a9; /* found_position */
	T6 a10; /* modulus */
	T6 a11; /* clashes_previous_position */
	T0* a12; /* special_item_routines */
	T0* a13; /* item_storage */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* special_key_routines */
	T0* a17; /* key_storage */
	T6 a18; /* free_slot */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
struct S403 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type attached DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
struct S404 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_LINKED_LIST_CURSOR [STRING_8] */
struct S405 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S407 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* last_cell */
	T0* a3; /* first_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S408 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* before */
	T0* a2; /* current_cell */
	T0* a3; /* next_cursor */
	T0* a4; /* container */
	T1 a5; /* after */
};

/* Struct for type detachable DS_LINKABLE [STRING_8] */
struct S409 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type KL_DIRECTORY */
struct S410 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* name */
	T0* a2; /* internal_detachable_name_pointer */
	T0* a3; /* last_entry */
	T14 a4; /* directory_pointer */
	T6 a5; /* mode */
	T0* a6; /* internal_name */
	T1 a7; /* end_of_input */
	T0* a8; /* entry_buffer */
	T0* a9; /* lastentry */
	T14 a10; /* last_entry_pointer */
};

/* Struct for type ST_SPLITTER */
struct S411 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* has_escape_character */
	T2 a2; /* escape_character */
	T0* a3; /* separator_codes */
	T0* a4; /* separators */
};

/* Struct for type KL_STRING_INPUT_STREAM */
struct S412 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* end_of_input */
	T2 a2; /* last_character */
	T0* a3; /* last_string */
	T0* a4; /* string */
	T6 a5; /* location */
};

/* Struct for type KL_CHARACTER_BUFFER */
struct S413 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* as_special */
	T0* a2; /* area */
};

/* Struct for type KL_ARRAY [detachable STRING_8] */
struct S414 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
struct S415 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
struct S418 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_HASH_TABLE_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
struct S419 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type GEANT_GEC_COMMAND */
struct S420 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T1 a3; /* c_compile */
	T1 a4; /* split_mode */
	T0* a5; /* ace_filename */
	T0* a6; /* clean */
	T1 a7; /* finalize */
	T1 a8; /* gelint */
	T0* a9; /* catcall_mode */
	T6 a10; /* split_size */
	T0* a11; /* garbage_collector */
	T0* a12; /* exit_code_variable_name */
	T6 a13; /* exit_code */
};

/* Struct for type DS_CELL [PROCEDURE [ANY, TUPLE]] */
struct S421 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
};

/* Struct for type [attached] PROCEDURE [[attached] NONE, [attached] TUPLE] */
struct S422 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(GE_context*, T0*);
};

/* Struct for type [attached] TUPLE [GEANT_GEC_TASK] */
struct S423 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type GEANT_ISE_COMMAND */
struct S424 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* ace_filename */
	T0* a4; /* system_name */
	T0* a5; /* clean */
	T1 a6; /* compatible_mode */
	T1 a7; /* finalize_mode */
	T1 a8; /* finish_freezing */
	T0* a9; /* project_path */
	T0* a10; /* exit_code_variable_name */
	T6 a11; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_ISE_TASK] */
struct S425 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type GEANT_FILESET_ELEMENT */
struct S426 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* fileset */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_EXEC_COMMAND */
struct S427 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* command_line */
	T0* a2; /* exit_code_variable_name */
	T0* a3; /* accept_errors */
	T0* a4; /* log_validation_messages_agent_cell */
	T0* a5; /* project */
	T0* a6; /* fileset */
	T6 a7; /* exit_code */
	T1 a8; /* single_execution_mode */
};

/* Struct for type GEANT_STRING_PROPERTY */
struct S428 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* string_value_agent */
	T1 a2; /* has_been_retrieved */
	T0* a3; /* retrieved_string_value */
};

/* Struct for type [attached] FUNCTION [GEANT_INTERPRETING_ELEMENT, [attached] TUPLE, STRING_8] */
struct S429 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(GE_context*, T0*);
};

/* Struct for type [attached] TUPLE [GEANT_INTERPRETING_ELEMENT, STRING_8] */
struct S430 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
	T0* z2;
};

/* Struct for type GEANT_BOOLEAN_PROPERTY */
struct S431 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* string_value_agent */
	T1 a2; /* has_been_retrieved */
	T0* a3; /* retrieved_string_value */
};

/* Struct for type GEANT_FILESET */
struct S432 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* project */
	T0* a2; /* filenames */
	T0* a3; /* single_includes */
	T0* a4; /* single_excludes */
	T1 a5; /* force */
	T0* a6; /* dir_name */
	T0* a7; /* directory_name */
	T0* a8; /* include_wc_string */
	T0* a9; /* include_wildcard */
	T0* a10; /* exclude_wc_string */
	T0* a11; /* exclude_wildcard */
	T1 a12; /* concat */
	T0* a13; /* filename_variable_name */
	T0* a14; /* mapped_filename_variable_name */
	T0* a15; /* filename_directory_name */
	T0* a16; /* mapped_filename_directory_name */
	T1 a17; /* convert_to_filesystem */
	T0* a18; /* map */
};

/* Struct for type [attached] TUPLE [GEANT_EXEC_TASK] */
struct S433 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type GEANT_LCC_COMMAND */
struct S434 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* executable */
	T0* a4; /* source_filename */
	T6 a5; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_LCC_TASK] */
struct S435 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type GEANT_SET_COMMAND */
struct S436 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* name */
	T0* a4; /* value */
	T6 a5; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_SET_TASK] */
struct S437 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type GEANT_UNSET_COMMAND */
struct S438 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* name */
	T6 a4; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_UNSET_TASK] */
struct S439 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type GEANT_DEFINE_ELEMENT */
struct S440 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* project */
	T0* a2; /* xml_element */
	T0* a3; /* position */
};

/* Struct for type GEANT_GEXACE_COMMAND */
struct S441 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* defines */
	T0* a2; /* log_validation_messages_agent_cell */
	T0* a3; /* project */
	T1 a4; /* verbose */
	T1 a5; /* validate_command */
	T0* a6; /* system_command */
	T0* a7; /* library_command */
	T0* a8; /* format */
	T0* a9; /* xace_filename */
	T0* a10; /* output_filename */
	T6 a11; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_GEXACE_TASK] */
struct S442 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type GEANT_GELEX_COMMAND */
struct S443 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* output_filename */
	T0* a4; /* input_filename */
	T0* a5; /* array_size */
	T1 a6; /* ecs */
	T1 a7; /* meta_ecs */
	T0* a8; /* inspect_actions */
	T1 a9; /* backup */
	T1 a10; /* full */
	T1 a11; /* case_insensitive */
	T1 a12; /* no_default */
	T1 a13; /* no_warn */
	T1 a14; /* separate_actions */
	T6 a15; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_GELEX_TASK] */
struct S444 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type GEANT_GEYACC_COMMAND */
struct S445 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* output_filename */
	T0* a4; /* input_filename */
	T0* a5; /* array_size */
	T1 a6; /* rescue_on_abort */
	T1 a7; /* separate_actions */
	T0* a8; /* verbose_filename */
	T0* a9; /* tokens_classname */
	T0* a10; /* tokens_filename */
	T6 a11; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_GEYACC_TASK] */
struct S446 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type GEANT_GEPP_COMMAND */
struct S447 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* defines */
	T0* a2; /* log_validation_messages_agent_cell */
	T0* a3; /* project */
	T0* a4; /* input_filename */
	T0* a5; /* output_filename */
	T1 a6; /* empty_lines */
	T0* a7; /* to_directory */
	T1 a8; /* force */
	T0* a9; /* fileset */
	T6 a10; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_GEPP_TASK] */
struct S448 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type GEANT_GETEST_COMMAND */
struct S449 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* defines */
	T0* a2; /* log_validation_messages_agent_cell */
	T0* a3; /* project */
	T1 a4; /* generation */
	T1 a5; /* compilation */
	T1 a6; /* execution */
	T1 a7; /* verbose */
	T0* a8; /* config_filename */
	T0* a9; /* compile */
	T0* a10; /* class_regexp */
	T0* a11; /* feature_regexp */
	T1 a12; /* default_test_included */
	T1 a13; /* abort */
	T6 a14; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_GETEST_TASK] */
struct S450 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type GEANT_GEANT_COMMAND */
struct S451 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* arguments */
	T0* a2; /* log_validation_messages_agent_cell */
	T0* a3; /* project */
	T0* a4; /* start_target_name */
	T1 a5; /* reuse_variables */
	T0* a6; /* filename */
	T1 a7; /* fork */
	T1 a8; /* has_fork_been_set */
	T0* a9; /* fileset */
	T0* a10; /* exit_code_variable_name */
	T6 a11; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_GEANT_TASK] */
struct S452 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type GEANT_ECHO_COMMAND */
struct S453 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* message_property */
	T0* a2; /* to_file_property */
	T0* a3; /* append_property */
	T0* a4; /* log_validation_messages_agent_cell */
	T0* a5; /* project */
	T0* a6; /* message_only_agent_cell */
	T0* a7; /* message_with_file_agent_cell */
	T6 a8; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_ECHO_TASK] */
struct S454 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type GEANT_MKDIR_COMMAND */
struct S455 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* directory */
	T0* a2; /* log_validation_messages_agent_cell */
	T0* a3; /* project */
	T0* a4; /* mkdir_agent_cell */
	T6 a5; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_MKDIR_TASK] */
struct S456 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type GEANT_DIRECTORYSET_ELEMENT */
struct S457 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* directoryset */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_DELETE_COMMAND */
struct S458 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T1 a3; /* fail_on_error */
	T0* a4; /* directory */
	T0* a5; /* file */
	T0* a6; /* fileset */
	T0* a7; /* directoryset */
	T6 a8; /* exit_code */
};

/* Struct for type GEANT_DIRECTORYSET */
struct S459 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* project */
	T0* a2; /* directory_names */
	T0* a3; /* single_includes */
	T0* a4; /* single_excludes */
	T0* a5; /* directory_name */
	T0* a6; /* include_wc_string */
	T0* a7; /* include_wildcard */
	T0* a8; /* exclude_wc_string */
	T0* a9; /* exclude_wildcard */
	T1 a10; /* concat */
	T0* a11; /* directory_name_variable_name */
	T1 a12; /* convert_to_filesystem */
};

/* Struct for type [attached] TUPLE [GEANT_DELETE_TASK] */
struct S460 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type GEANT_COPY_COMMAND */
struct S461 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* file */
	T0* a4; /* to_file */
	T0* a5; /* to_directory */
	T1 a6; /* force */
	T0* a7; /* fileset */
	T6 a8; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_COPY_TASK] */
struct S462 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type GEANT_MOVE_COMMAND */
struct S463 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* file */
	T0* a4; /* to_file */
	T0* a5; /* to_directory */
	T0* a6; /* fileset */
	T6 a7; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_MOVE_TASK] */
struct S464 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type GEANT_SETENV_COMMAND */
struct S465 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* name */
	T0* a4; /* value */
	T6 a5; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_SETENV_TASK] */
struct S466 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type DS_PAIR [STRING_8, STRING_8] */
struct S467 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* first */
	T0* a2; /* second */
};

/* Struct for type GEANT_XSLT_COMMAND */
struct S468 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
	T0* a2; /* log_validation_messages_agent_cell */
	T0* a3; /* project */
	T0* a4; /* input_filename */
	T0* a5; /* output_filename */
	T6 a6; /* processor */
	T0* a7; /* stylesheet_filename */
	T1 a8; /* force */
	T0* a9; /* indent */
	T0* a10; /* format */
	T0* a11; /* extdirs */
	T0* a12; /* classpath */
	T6 a13; /* exit_code */
};

/* Struct for type DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]] */
struct S469 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T6 a4; /* count */
	T0* a5; /* internal_cursor */
};

/* Struct for type [attached] TUPLE [GEANT_XSLT_TASK] */
struct S470 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type GEANT_OUTOFDATE_COMMAND */
struct S471 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* source_filename */
	T0* a4; /* target_filename */
	T0* a5; /* true_value */
	T0* a6; /* false_value */
	T0* a7; /* variable_name */
	T0* a8; /* fileset */
	T6 a9; /* exit_code */
	T1 a10; /* is_out_of_date */
};

/* Struct for type [attached] TUPLE [GEANT_OUTOFDATE_TASK] */
struct S472 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type GEANT_EXIT_COMMAND */
struct S473 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T6 a3; /* code */
	T6 a4; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_EXIT_TASK] */
struct S474 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type GEANT_PRECURSOR_COMMAND */
struct S475 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* arguments */
	T0* a2; /* log_validation_messages_agent_cell */
	T0* a3; /* project */
	T0* a4; /* parent */
	T6 a5; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_PRECURSOR_TASK] */
struct S476 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type GEANT_AVAILABLE_COMMAND */
struct S477 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* resource_name */
	T0* a2; /* variable_name */
	T0* a3; /* true_value */
	T0* a4; /* false_value */
	T0* a5; /* log_validation_messages_agent_cell */
	T0* a6; /* project */
	T0* a7; /* available_agent_cell */
	T6 a8; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_AVAILABLE_TASK] */
struct S478 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type GEANT_INPUT_COMMAND */
struct S479 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* variable */
	T0* a4; /* message */
	T0* a5; /* default_value */
	T0* a6; /* validargs */
	T0* a7; /* validregexp */
	T1 a8; /* answer_required */
	T6 a9; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_INPUT_TASK] */
struct S480 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type GEANT_REPLACE_COMMAND */
struct S481 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* file */
	T0* a4; /* to_file */
	T0* a5; /* to_directory */
	T0* a6; /* match */
	T0* a7; /* token */
	T0* a8; /* variable_pattern */
	T0* a9; /* replace */
	T0* a10; /* flags */
	T0* a11; /* fileset */
	T6 a12; /* exit_code */
};

/* Struct for type [attached] TUPLE [GEANT_REPLACE_TASK] */
struct S482 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type SPECIAL [ARRAY [INTEGER_32]] */
struct S483 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
struct S484 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type detachable DS_LINKABLE [CHARACTER_8] */
struct S485 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T2 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type detachable KL_EQUALITY_TESTER [GEANT_RENAME] */
struct S486 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_RENAME] */
struct S488 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [GEANT_RENAME] */
struct S489 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8] */
struct S490 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T0* a2; /* container */
	T0* a3; /* next_cursor */
};

/* Struct for type detachable KL_EQUALITY_TESTER [GEANT_REDEFINE] */
struct S491 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_REDEFINE] */
struct S493 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [GEANT_REDEFINE] */
struct S494 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8] */
struct S495 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T0* a2; /* container */
	T0* a3; /* next_cursor */
};

/* Struct for type detachable KL_EQUALITY_TESTER [GEANT_SELECT] */
struct S496 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_SELECT] */
struct S498 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [GEANT_SELECT] */
struct S499 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8] */
struct S500 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T0* a2; /* container */
	T0* a3; /* next_cursor */
};

/* Struct for type detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S501 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
};

/* Struct for type DS_HASH_SET [INTEGER_32] */
struct S508 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T6 a2; /* capacity */
	T6 a3; /* modulus */
	T6 a4; /* last_position */
	T6 a5; /* free_slot */
	T6 a6; /* slots_position */
	T6 a7; /* count */
	T6 a8; /* clashes_previous_position */
	T0* a9; /* special_item_routines */
	T0* a10; /* item_storage */
	T0* a11; /* clashes */
	T0* a12; /* slots */
	T6 a13; /* found_position */
	T0* a14; /* internal_cursor */
	T0* a15; /* equality_tester */
	T0* a16; /* hash_function */
};

/* Struct for type GEANT_MAP_ELEMENT */
struct S511 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* map */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_MAP */
struct S512 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* type */
	T0* a2; /* project */
	T0* a3; /* source_pattern */
	T0* a4; /* target_pattern */
	T0* a5; /* map */
};

/* Struct for type DS_HASH_SET [GEANT_FILESET_ENTRY] */
struct S515 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* internal_cursor */
	T0* a2; /* item_storage */
	T0* a3; /* equality_tester */
	T6 a4; /* position */
	T6 a5; /* last_position */
	T6 a6; /* capacity */
	T6 a7; /* slots_position */
	T6 a8; /* count */
	T6 a9; /* modulus */
	T6 a10; /* free_slot */
	T6 a11; /* found_position */
	T6 a12; /* clashes_previous_position */
	T0* a13; /* special_item_routines */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* hash_function */
};

/* Struct for type DS_HASH_SET [STRING_8] */
struct S517 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* capacity */
	T6 a2; /* modulus */
	T6 a3; /* last_position */
	T6 a4; /* free_slot */
	T6 a5; /* position */
	T0* a6; /* equality_tester */
	T6 a7; /* slots_position */
	T6 a8; /* count */
	T0* a9; /* special_item_routines */
	T0* a10; /* item_storage */
	T0* a11; /* clashes */
	T0* a12; /* slots */
	T6 a13; /* found_position */
	T0* a14; /* internal_cursor */
	T6 a15; /* clashes_previous_position */
	T0* a16; /* hash_function */
};

/* Struct for type LX_DFA_WILDCARD */
struct S519 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* yy_nxt */
	T0* a2; /* yy_accept */
	T0* a3; /* subject */
	T6 a4; /* subject_start */
	T6 a5; /* subject_end */
	T6 a6; /* match_count */
	T6 a7; /* matched_start */
	T6 a8; /* matched_end */
	T6 a9; /* yyNb_rows */
	T0* a10; /* pattern */
	T1 a11; /* is_case_insensitive */
};

/* Struct for type DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8]]] */
struct S521 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
};

/* Struct for type [attached] TUPLE [STRING_8] */
struct S522 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type [attached] PROCEDURE [[attached] NONE, [attached] TUPLE [STRING_8]] */
struct S523 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(GE_context*, T0*, T0*);
};

/* Struct for type [attached] TUPLE [GEANT_ECHO_COMMAND] */
struct S524 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]]] */
struct S526 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
};

/* Struct for type KL_TEXT_OUTPUT_FILE */
struct S527 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* name */
	T6 a2; /* mode */
	T14 a3; /* file_pointer */
	T1 a4; /* descriptor_available */
	T0* a5; /* last_string */
	T0* a6; /* internal_name */
	T0* a7; /* internal_detachable_name_pointer */
};

/* Struct for type [attached] TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN] */
struct S528 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
	T0* z2;
	T1 z3;
};

/* Struct for type [attached] PROCEDURE [[attached] NONE, [attached] TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]] */
struct S529 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(GE_context*, T0*, T0*, T0*, T1);
};

/* Struct for type [attached] TUPLE [GEANT_MKDIR_COMMAND] */
struct S531 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]] */
struct S532 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [DS_PAIR [STRING_8, STRING_8]] */
struct S533 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING_8, STRING_8]] */
struct S534 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_CELL [FUNCTION [ANY, TUPLE [STRING_8], BOOLEAN]] */
struct S535 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
};

/* Struct for type [attached] PREDICATE [[attached] NONE, [attached] TUPLE [STRING_8]] */
struct S536 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T1 (*f)(GE_context*, T0*, T0*);
};

/* Struct for type [attached] TUPLE [GEANT_AVAILABLE_COMMAND] */
struct S537 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type DP_SHELL_COMMAND */
struct S539 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* exit_code */
	T0* a2; /* string_command */
	T0* a3; /* command */
	T6 a4; /* return_code */
	T1 a5; /* is_system_code */
};

/* Struct for type DS_CELL [BOOLEAN] */
struct S540 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* item */
};

/* Struct for type DS_HASH_SET_CURSOR [STRING_8] */
struct S542 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T0* a2; /* container */
	T0* a3; /* next_cursor */
};

/* Struct for type GEANT_FILESET_ENTRY */
struct S543 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* filename */
	T0* a2; /* mapped_filename */
};

/* Struct for type KL_BOOLEAN_ROUTINES */
struct S544 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type ARRAY [BOOLEAN] */
struct S545 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type GEANT_VARIABLES_VARIABLE_RESOLVER */
struct S546 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* variables */
};

/* Struct for type RX_PCRE_REGULAR_EXPRESSION */
struct S547 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* match_count */
	T0* a2; /* error_message */
	T0* a3; /* subject */
	T6 a4; /* subject_end */
	T6 a5; /* subject_start */
	T0* a6; /* offset_vector */
	T6 a7; /* offset_vector_count */
	T6 a8; /* brastart_capacity */
	T0* a9; /* brastart_vector */
	T6 a10; /* brastart_lower */
	T6 a11; /* brastart_count */
	T6 a12; /* eptr_capacity */
	T0* a13; /* eptr_vector */
	T6 a14; /* eptr_lower */
	T6 a15; /* eptr_upper */
	T0* a16; /* byte_code */
	T0* a17; /* internal_start_bits */
	T0* a18; /* pattern_buffer */
	T6 a19; /* subexpression_count */
	T0* a20; /* pattern */
	T6 a21; /* pattern_count */
	T6 a22; /* pattern_position */
	T6 a23; /* code_index */
	T6 a24; /* maxbackrefs */
	T6 a25; /* optchanged */
	T6 a26; /* first_character */
	T6 a27; /* required_character */
	T6 a28; /* regexp_countlits */
	T0* a29; /* start_bits */
	T1 a30; /* is_anchored */
	T1 a31; /* is_caseless */
	T1 a32; /* is_multiline */
	T0* a33; /* character_case_mapping */
	T0* a34; /* word_set */
	T6 a35; /* subject_next_start */
	T6 a36; /* error_code */
	T6 a37; /* error_position */
	T1 a38; /* is_startline */
	T1 a39; /* is_bol */
	T1 a40; /* is_eol */
	T1 a41; /* is_dotall */
	T1 a42; /* is_extended */
	T1 a43; /* is_empty_allowed */
	T1 a44; /* is_dollar_endonly */
	T1 a45; /* is_greedy */
	T1 a46; /* is_strict */
	T1 a47; /* is_ichanged */
	T6 a48; /* first_matched_index */
	T6 a49; /* eptr */
	T6 a50; /* offset_top */
	T1 a51; /* is_matching_caseless */
	T1 a52; /* is_matching_multiline */
	T1 a53; /* is_matching_dotall */
};

/* Struct for type KL_STRING_EQUALITY_TESTER */
struct S548 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_STDIN_FILE */
struct S549 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* last_string */
	T1 a2; /* end_of_file */
	T2 a3; /* last_character */
	T0* a4; /* character_buffer */
};

/* Struct for type ARRAY [GEANT_VARIABLES] */
struct S550 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_HASH_SET_CURSOR [INTEGER_32] */
struct S551 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type detachable KL_EQUALITY_TESTER [INTEGER_32] */
struct S552 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY] */
struct S553 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [GEANT_FILESET_ENTRY] */
struct S554 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type detachable KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY] */
struct S555 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY] */
struct S556 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type LX_WILDCARD_PARSER */
struct S558 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* successful */
	T0* a2; /* pending_rules */
	T0* a3; /* start_condition_stack */
	T0* a4; /* action_factory */
	T0* a5; /* old_singleton_lines */
	T0* a6; /* old_singleton_columns */
	T0* a7; /* old_singleton_counts */
	T0* a8; /* old_regexp_lines */
	T0* a9; /* old_regexp_columns */
	T0* a10; /* old_regexp_counts */
	T0* a11; /* description */
	T0* a12; /* last_string_value */
	T0* a13; /* last_lx_symbol_class_value */
	T0* a14; /* error_handler */
	T0* a15; /* name_definitions */
	T0* a16; /* character_classes */
	T6 a17; /* line_nb */
	T0* a18; /* yyss */
	T0* a19; /* input_buffer */
	T6 a20; /* yy_end */
	T6 a21; /* yy_position */
	T6 a22; /* yy_line */
	T6 a23; /* yy_column */
	T6 a24; /* yy_parsing_status */
	T6 a25; /* yy_suspended_yystacksize */
	T6 a26; /* yy_suspended_yystate */
	T6 a27; /* yy_suspended_yyn */
	T6 a28; /* yy_suspended_yychar1 */
	T6 a29; /* yy_suspended_index */
	T6 a30; /* yy_suspended_yyss_top */
	T6 a31; /* yy_suspended_yy_goto */
	T0* a32; /* yyr1 */
	T6 a33; /* yyssp */
	T0* a34; /* yypgoto */
	T0* a35; /* yycheck */
	T0* a36; /* yytable */
	T0* a37; /* yydefgoto */
	T6 a38; /* error_count */
	T1 a39; /* yy_lookahead_needed */
	T6 a40; /* yyerrstatus */
	T0* a41; /* yypact */
	T6 a42; /* last_token */
	T0* a43; /* yytranslate */
	T0* a44; /* yydefact */
	T0* a45; /* yy_pushed_start_conditions */
	T0* a46; /* yyspecial_routines1 */
	T6 a47; /* yyvsc1 */
	T0* a48; /* yyvs1 */
	T0* a49; /* yyspecial_routines2 */
	T6 a50; /* yyvsc2 */
	T0* a51; /* yyvs2 */
	T0* a52; /* yyspecial_routines3 */
	T6 a53; /* yyvsc3 */
	T0* a54; /* yyvs3 */
	T0* a55; /* yyspecial_routines4 */
	T6 a56; /* yyvsc4 */
	T0* a57; /* yyvs4 */
	T0* a58; /* yyspecial_routines5 */
	T6 a59; /* yyvsc5 */
	T0* a60; /* yyvs5 */
	T0* a61; /* yytypes1 */
	T0* a62; /* yytypes2 */
	T6 a63; /* yy_start */
	T6 a64; /* yyvsp1 */
	T6 a65; /* yyvsp2 */
	T6 a66; /* yyvsp3 */
	T6 a67; /* yyvsp4 */
	T6 a68; /* yyvsp5 */
	T1 a69; /* yy_more_flag */
	T6 a70; /* yy_more_len */
	T6 a71; /* line */
	T6 a72; /* column */
	T6 a73; /* position */
	T6 a74; /* yy_start_state */
	T0* a75; /* yy_state_stack */
	T6 a76; /* yy_state_count */
	T0* a77; /* yy_content_area */
	T0* a78; /* yy_ec */
	T0* a79; /* yy_content */
	T0* a80; /* yy_accept */
	T6 a81; /* yy_last_accepting_state */
	T6 a82; /* yy_last_accepting_cpos */
	T0* a83; /* yy_chk */
	T0* a84; /* yy_base */
	T0* a85; /* yy_def */
	T0* a86; /* yy_meta */
	T0* a87; /* yy_nxt */
	T6 a88; /* yy_lp */
	T0* a89; /* yy_acclist */
	T6 a90; /* yy_looking_for_trail_begin */
	T6 a91; /* yy_full_match */
	T6 a92; /* yy_full_state */
	T6 a93; /* yy_full_lp */
	T1 a94; /* yy_rejected */
	T0* a95; /* last_detachable_any_value */
	T6 a96; /* last_integer_value */
	T1 a97; /* in_trail_context */
	T0* a98; /* rule */
	T1 a99; /* has_trail_context */
	T6 a100; /* head_count */
	T6 a101; /* head_line */
	T6 a102; /* head_column */
	T6 a103; /* trail_count */
	T6 a104; /* rule_line_nb */
};

/* Struct for type LX_DESCRIPTION */
struct S559 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* equiv_classes */
	T1 a2; /* equiv_classes_used */
	T1 a3; /* full_table */
	T1 a4; /* meta_equiv_classes_used */
	T1 a5; /* reject_used */
	T1 a6; /* variable_trail_context */
	T0* a7; /* rules */
	T0* a8; /* start_conditions */
	T6 a9; /* characters_count */
	T6 a10; /* array_size */
	T1 a11; /* line_pragma */
	T1 a12; /* inspect_used */
	T0* a13; /* eof_rules */
	T0* a14; /* eiffel_header */
	T1 a15; /* case_insensitive */
	T0* a16; /* input_filename */
	T1 a17; /* actions_separated */
	T0* a18; /* eiffel_code */
	T1 a19; /* bol_needed */
	T1 a20; /* pre_action_used */
	T1 a21; /* post_action_used */
	T1 a22; /* pre_eof_action_used */
	T1 a23; /* post_eof_action_used */
	T1 a24; /* line_used */
	T1 a25; /* position_used */
};

/* Struct for type LX_FULL_DFA */
struct S560 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* yy_nxt */
	T0* a2; /* yy_accept */
	T6 a3; /* yyNb_rows */
	T0* a4; /* input_filename */
	T6 a5; /* characters_count */
	T6 a6; /* array_size */
	T1 a7; /* inspect_used */
	T1 a8; /* actions_separated */
	T0* a9; /* eiffel_code */
	T0* a10; /* eiffel_header */
	T1 a11; /* bol_needed */
	T1 a12; /* pre_action_used */
	T1 a13; /* post_action_used */
	T1 a14; /* pre_eof_action_used */
	T1 a15; /* post_eof_action_used */
	T1 a16; /* line_pragma */
	T0* a17; /* yy_start_conditions */
	T0* a18; /* yy_ec */
	T6 a19; /* yyNull_equiv_class */
	T6 a20; /* yyNb_rules */
	T0* a21; /* yy_rules */
	T6 a22; /* yyEnd_of_buffer */
	T1 a23; /* yyLine_used */
	T1 a24; /* yyPosition_used */
	T6 a25; /* minimum_symbol */
	T6 a26; /* maximum_symbol */
	T0* a27; /* states */
	T6 a28; /* backing_up_count */
	T0* a29; /* partitions */
	T6 a30; /* start_states_count */
	T1 a31; /* yyBacking_up */
	T0* a32; /* yy_eof_rules */
};

/* Struct for type KL_NULL_TEXT_OUTPUT_STREAM */
struct S562 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* name */
};

/* Struct for type RX_BYTE_CODE */
struct S567 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* byte_code */
	T0* a3; /* character_sets */
	T6 a4; /* capacity */
	T6 a5; /* character_sets_count */
	T6 a6; /* character_sets_capacity */
};

/* Struct for type RX_CHARACTER_SET */
struct S568 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* set */
};

/* Struct for type RX_CASE_MAPPING */
struct S569 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* lower_table */
	T0* a2; /* flip_table */
};

/* Struct for type ARRAY [RX_CHARACTER_SET] */
struct S571 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type SPECIAL [RX_CHARACTER_SET] */
struct S572 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type DS_ARRAYED_LIST [LX_RULE] */
struct S573 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type LX_START_CONDITIONS */
struct S574 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type LX_ACTION_FACTORY */
struct S575 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_ARRAYED_STACK [INTEGER_32] */
struct S576 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
};

/* Struct for type LX_SYMBOL_CLASS */
struct S577 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T1 a4; /* sort_needed */
	T1 a5; /* negated */
	T0* a6; /* internal_cursor */
	T6 a7; /* count */
	T0* a8; /* equality_tester */
};

/* Struct for type DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8] */
struct S578 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T6 a2; /* found_position */
	T0* a3; /* item_storage */
	T0* a4; /* key_equality_tester */
	T0* a5; /* internal_keys */
	T6 a6; /* count */
	T6 a7; /* capacity */
	T6 a8; /* slots_position */
	T6 a9; /* free_slot */
	T6 a10; /* last_position */
	T6 a11; /* modulus */
	T6 a12; /* clashes_previous_position */
	T0* a13; /* equality_tester */
	T0* a14; /* special_item_routines */
	T0* a15; /* clashes */
	T0* a16; /* slots */
	T0* a17; /* special_key_routines */
	T0* a18; /* key_storage */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS] */
struct S579 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [LX_SYMBOL_CLASS] */
struct S580 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_NFA] */
struct S581 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type LX_NFA */
struct S582 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* in_trail_context */
	T0* a2; /* states */
};

/* Struct for type SPECIAL [LX_NFA] */
struct S583 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type LX_EQUIVALENCE_CLASSES */
struct S584 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* storage */
};

/* Struct for type LX_RULE */
struct S585 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* id */
	T0* a2; /* pattern */
	T0* a3; /* action */
	T6 a4; /* head_count */
	T6 a5; /* trail_count */
	T6 a6; /* line_count */
	T6 a7; /* column_count */
	T6 a8; /* line_nb */
	T1 a9; /* has_trail_context */
	T1 a10; /* is_useful */
};

/* Struct for type UT_SYNTAX_ERROR */
struct S586 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
struct S587 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T0* a2; /* container */
	T0* a3; /* next_cursor */
};

/* Struct for type LX_UNRECOGNIZED_RULE_ERROR */
struct S588 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type LX_MISSING_QUOTE_ERROR */
struct S589 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type LX_BAD_CHARACTER_CLASS_ERROR */
struct S590 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type LX_BAD_CHARACTER_ERROR */
struct S591 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type LX_FULL_AND_META_ERROR */
struct S592 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type LX_FULL_AND_REJECT_ERROR */
struct S593 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR */
struct S594 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type LX_CHARACTER_OUT_OF_RANGE_ERROR */
struct S595 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type ARRAY [LX_RULE] */
struct S596 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type SPECIAL [LX_RULE] */
struct S597 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type LX_DFA_STATE */
struct S598 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* accepted_rules */
	T0* a2; /* states */
	T0* a3; /* transitions */
	T0* a4; /* accepted_head_rules */
	T6 a5; /* code */
	T6 a6; /* id */
};

/* Struct for type DS_ARRAYED_LIST [LX_NFA_STATE] */
struct S599 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* equality_tester */
	T0* a4; /* special_routines */
	T6 a5; /* capacity */
	T0* a6; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST [LX_DFA_STATE] */
struct S600 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T0* a5; /* internal_cursor */
};

/* Struct for type LX_SYMBOL_PARTITIONS */
struct S601 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* symbols */
	T0* a2; /* storage */
	T6 a3; /* count */
};

/* Struct for type KL_ARRAY_ROUTINES [LX_RULE] */
struct S602 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type LX_START_CONDITION */
struct S603 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* name */
	T6 a2; /* id */
	T1 a3; /* is_exclusive */
	T0* a4; /* patterns */
	T0* a5; /* bol_patterns */
};

/* Struct for type LX_TRANSITION_TABLE [LX_DFA_STATE] */
struct S604 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* storage */
	T0* a2; /* array_routines */
	T6 a3; /* count */
};

/* Struct for type DS_ARRAYED_LIST [LX_NFA] */
struct S605 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T6 a5; /* count */
};

/* Struct for type DS_HASH_TABLE [LX_NFA, INTEGER_32] */
struct S606 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T0* a2; /* item_storage */
	T0* a3; /* key_equality_tester */
	T6 a4; /* count */
	T6 a5; /* capacity */
	T6 a6; /* slots_position */
	T6 a7; /* free_slot */
	T6 a8; /* last_position */
	T6 a9; /* modulus */
	T6 a10; /* clashes_previous_position */
	T0* a11; /* equality_tester */
	T6 a12; /* found_position */
	T0* a13; /* special_item_routines */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* special_key_routines */
	T0* a17; /* key_storage */
	T0* a18; /* internal_cursor */
	T0* a19; /* hash_function */
};

/* Struct for type LX_NFA_STATE */
struct S607 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* in_trail_context */
	T0* a2; /* transition */
	T0* a3; /* epsilon_transition */
	T6 a4; /* id */
	T0* a5; /* accepted_rule */
};

/* Struct for type KL_BINARY_INPUT_FILE */
struct S608 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* end_of_file */
	T0* a2; /* last_string */
	T6 a3; /* mode */
	T0* a4; /* name */
	T0* a5; /* character_buffer */
	T14 a6; /* file_pointer */
	T1 a7; /* descriptor_available */
	T0* a8; /* internal_name */
	T0* a9; /* internal_detachable_name_pointer */
};

/* Struct for type KL_BINARY_OUTPUT_FILE */
struct S609 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* mode */
	T0* a2; /* name */
	T14 a3; /* file_pointer */
	T1 a4; /* descriptor_available */
	T0* a5; /* last_string */
	T0* a6; /* internal_name */
	T0* a7; /* internal_detachable_name_pointer */
};

/* Struct for type PATH */
struct S614 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* storage */
	T0* a2; /* internal_name */
	T1 a3; /* is_normalized */
};

/* Struct for type RAW_FILE */
struct S615 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* mode */
	T14 a2; /* file_pointer */
	T0* a3; /* last_string */
	T6 a4; /* last_integer */
	T12 a5; /* last_real */
	T13 a6; /* last_double */
	T2 a7; /* last_character */
	T0* a8; /* internal_name */
	T0* a9; /* internal_detachable_name_pointer */
	T1 a10; /* descriptor_available */
};

/* Struct for type DIRECTORY */
struct S616 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T14 a1; /* last_entry_pointer */
	T6 a2; /* mode */
	T14 a3; /* directory_pointer */
	T0* a4; /* lastentry */
	T0* a5; /* internal_name */
	T0* a6; /* internal_detachable_name_pointer */
};

/* Struct for type ARRAYED_LIST [READABLE_STRING_32] */
struct S617 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* index */
	T0* a2; /* area_v2 */
};

/* Struct for type [attached] TUPLE [ARRAYED_LIST [READABLE_STRING_32]] */
struct S618 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR */
struct S619 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_RULE] */
struct S620 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_RULE] */
struct S621 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [LX_START_CONDITION] */
struct S622 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_START_CONDITION] */
struct S623 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION] */
struct S624 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
struct S625 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE] */
struct S628 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* label */
	T0* a2; /* target */
};

/* Struct for type LX_EPSILON_TRANSITION [LX_NFA_STATE] */
struct S630 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* target */
};

/* Struct for type LX_SYMBOL_TRANSITION [LX_NFA_STATE] */
struct S632 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* label */
	T0* a2; /* target */
};

/* Struct for type ARRAY [DS_BILINKABLE [INTEGER_32]] */
struct S633 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_BILINKABLE [INTEGER_32] */
struct S634 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
};

/* Struct for type SPECIAL [DS_BILINKABLE [INTEGER_32]] */
struct S635 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type LX_ACTION */
struct S637 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* text */
};

/* Struct for type DS_BUBBLE_SORTER [LX_NFA_STATE] */
struct S638 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* comparator */
};

/* Struct for type DS_BUBBLE_SORTER [LX_RULE] */
struct S640 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* comparator */
};

/* Struct for type SPECIAL [LX_NFA_STATE] */
struct S642 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_NFA_STATE] */
struct S644 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE] */
struct S645 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [LX_DFA_STATE] */
struct S647 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_DFA_STATE] */
struct S648 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE] */
struct S649 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_ARRAY [LX_RULE] */
struct S650 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [detachable LX_DFA_STATE] */
struct S651 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type KL_ARRAY_ROUTINES [detachable LX_DFA_STATE] */
struct S652 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_NFA] */
struct S653 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32] */
struct S655 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type STRING_8_SEARCHER */
struct S656 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* deltas */
};

/* Struct for type HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32] */
struct S657 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* capacity */
	T0* a2; /* content */
	T0* a3; /* keys */
	T0* a4; /* deleted_marks */
	T0* a5; /* indexes_map */
	T6 a6; /* iteration_position */
	T6 a7; /* count */
	T6 a8; /* deleted_item_position */
	T6 a9; /* control */
	T0* a10; /* found_item */
	T1 a11; /* has_default */
	T6 a12; /* item_position */
	T6 a13; /* ht_lowest_deleted_position */
	T0* a14; /* ht_deleted_item */
	T0* a15; /* ht_deleted_key */
	T1 a16; /* object_comparison */
};

/* Struct for type DS_SHELL_SORTER [INTEGER_32] */
struct S661 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* comparator */
};

/* Struct for type KL_COMPARABLE_COMPARATOR [LX_RULE] */
struct S663 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_COMPARABLE_COMPARATOR [LX_NFA_STATE] */
struct S666 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type ARRAYED_LIST [READABLE_STRING_GENERAL] */
struct S669 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* index */
	T0* a2; /* area_v2 */
};

/* Struct for type [attached] TUPLE [ARRAYED_LIST [READABLE_STRING_GENERAL]] */
struct S670 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type SPECIAL [READABLE_STRING_32] */
struct S671 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_COMPARABLE_COMPARATOR [INTEGER_32] */
struct S672 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [NATIVE_STRING] */
struct S675 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [READABLE_STRING_GENERAL] */
struct S676 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};


extern T1 GE_default1;
extern T2 GE_default2;
extern T3 GE_default3;
extern T4 GE_default4;
extern T5 GE_default5;
extern T6 GE_default6;
extern T7 GE_default7;
extern T8 GE_default8;
extern T9 GE_default9;
extern T10 GE_default10;
extern T11 GE_default11;
extern T12 GE_default12;
extern T13 GE_default13;
extern T14 GE_default14;
extern T15 GE_default15;
extern T16 GE_default16;
extern T17 GE_default17;
extern T18 GE_default18;
extern T19 GE_default19;
extern T22 GE_default22;
extern T23 GE_default23;
extern T24 GE_default24;
extern T25 GE_default25;
extern T26 GE_default26;
extern T27 GE_default27;
extern T29 GE_default29;
extern T30 GE_default30;
extern T31 GE_default31;
extern T32 GE_default32;
extern T33 GE_default33;
extern T34 GE_default34;
extern T35 GE_default35;
extern T36 GE_default36;
extern T37 GE_default37;
extern T38 GE_default38;
extern T39 GE_default39;
extern T40 GE_default40;
extern T41 GE_default41;
extern T42 GE_default42;
extern T43 GE_default43;
extern T44 GE_default44;
extern T45 GE_default45;
extern T47 GE_default47;
extern T52 GE_default52;
extern T53 GE_default53;
extern T54 GE_default54;
extern T55 GE_default55;
extern T56 GE_default56;
extern T58 GE_default58;
extern T60 GE_default60;
extern T62 GE_default62;
extern T64 GE_default64;
extern T65 GE_default65;
extern T66 GE_default66;
extern T67 GE_default67;
extern T68 GE_default68;
extern T69 GE_default69;
extern T70 GE_default70;
extern T73 GE_default73;
extern T74 GE_default74;
extern T75 GE_default75;
extern T76 GE_default76;
extern T77 GE_default77;
extern T78 GE_default78;
extern T79 GE_default79;
extern T80 GE_default80;
extern T81 GE_default81;
extern T82 GE_default82;
extern T83 GE_default83;
extern T84 GE_default84;
extern T85 GE_default85;
extern T86 GE_default86;
extern T87 GE_default87;
extern T88 GE_default88;
extern T89 GE_default89;
extern T90 GE_default90;
extern T92 GE_default92;
extern T93 GE_default93;
extern T94 GE_default94;
extern T95 GE_default95;
extern T96 GE_default96;
extern T97 GE_default97;
extern T98 GE_default98;
extern T100 GE_default100;
extern T101 GE_default101;
extern T104 GE_default104;
extern T105 GE_default105;
extern T106 GE_default106;
extern T108 GE_default108;
extern T109 GE_default109;
extern T110 GE_default110;
extern T111 GE_default111;
extern T112 GE_default112;
extern T113 GE_default113;
extern T114 GE_default114;
extern T115 GE_default115;
extern T120 GE_default120;
extern T121 GE_default121;
extern T122 GE_default122;
extern T124 GE_default124;
extern T125 GE_default125;
extern T126 GE_default126;
extern T127 GE_default127;
extern T128 GE_default128;
extern T129 GE_default129;
extern T130 GE_default130;
extern T132 GE_default132;
extern T133 GE_default133;
extern T135 GE_default135;
extern T136 GE_default136;
extern T138 GE_default138;
extern T139 GE_default139;
extern T142 GE_default142;
extern T143 GE_default143;
extern T144 GE_default144;
extern T145 GE_default145;
extern T146 GE_default146;
extern T149 GE_default149;
extern T150 GE_default150;
extern T151 GE_default151;
extern T152 GE_default152;
extern T154 GE_default154;
extern T155 GE_default155;
extern T156 GE_default156;
extern T157 GE_default157;
extern T158 GE_default158;
extern T159 GE_default159;
extern T161 GE_default161;
extern T163 GE_default163;
extern T164 GE_default164;
extern T165 GE_default165;
extern T166 GE_default166;
extern T167 GE_default167;
extern T170 GE_default170;
extern T171 GE_default171;
extern T172 GE_default172;
extern T173 GE_default173;
extern T174 GE_default174;
extern T175 GE_default175;
extern T176 GE_default176;
extern T177 GE_default177;
extern T178 GE_default178;
extern T179 GE_default179;
extern T180 GE_default180;
extern T181 GE_default181;
extern T183 GE_default183;
extern T184 GE_default184;
extern T186 GE_default186;
extern T187 GE_default187;
extern T188 GE_default188;
extern T189 GE_default189;
extern T191 GE_default191;
extern T193 GE_default193;
extern T194 GE_default194;
extern T195 GE_default195;
extern T196 GE_default196;
extern T197 GE_default197;
extern T198 GE_default198;
extern T199 GE_default199;
extern T200 GE_default200;
extern T201 GE_default201;
extern T202 GE_default202;
extern T203 GE_default203;
extern T204 GE_default204;
extern T205 GE_default205;
extern T206 GE_default206;
extern T207 GE_default207;
extern T208 GE_default208;
extern T209 GE_default209;
extern T210 GE_default210;
extern T211 GE_default211;
extern T212 GE_default212;
extern T213 GE_default213;
extern T214 GE_default214;
extern T215 GE_default215;
extern T216 GE_default216;
extern T217 GE_default217;
extern T218 GE_default218;
extern T219 GE_default219;
extern T220 GE_default220;
extern T223 GE_default223;
extern T224 GE_default224;
extern T226 GE_default226;
extern T227 GE_default227;
extern T228 GE_default228;
extern T229 GE_default229;
extern T230 GE_default230;
extern T231 GE_default231;
extern T232 GE_default232;
extern T236 GE_default236;
extern T239 GE_default239;
extern T241 GE_default241;
extern T242 GE_default242;
extern T243 GE_default243;
extern T244 GE_default244;
extern T245 GE_default245;
extern T247 GE_default247;
extern T248 GE_default248;
extern T249 GE_default249;
extern T251 GE_default251;
extern T252 GE_default252;
extern T253 GE_default253;
extern T254 GE_default254;
extern T255 GE_default255;
extern T256 GE_default256;
extern T257 GE_default257;
extern T258 GE_default258;
extern T262 GE_default262;
extern T263 GE_default263;
extern T264 GE_default264;
extern T265 GE_default265;
extern T266 GE_default266;
extern T267 GE_default267;
extern T268 GE_default268;
extern T269 GE_default269;
extern T270 GE_default270;
extern T271 GE_default271;
extern T272 GE_default272;
extern T273 GE_default273;
extern T274 GE_default274;
extern T275 GE_default275;
extern T277 GE_default277;
extern T278 GE_default278;
extern T279 GE_default279;
extern T280 GE_default280;
extern T284 GE_default284;
extern T285 GE_default285;
extern T286 GE_default286;
extern T287 GE_default287;
extern T290 GE_default290;
extern T291 GE_default291;
extern T293 GE_default293;
extern T294 GE_default294;
extern T295 GE_default295;
extern T296 GE_default296;
extern T297 GE_default297;
extern T298 GE_default298;
extern T299 GE_default299;
extern T300 GE_default300;
extern T301 GE_default301;
extern T303 GE_default303;
extern T304 GE_default304;
extern T305 GE_default305;
extern T306 GE_default306;
extern T307 GE_default307;
extern T308 GE_default308;
extern T312 GE_default312;
extern T314 GE_default314;
extern T318 GE_default318;
extern T319 GE_default319;
extern T320 GE_default320;
extern T322 GE_default322;
extern T324 GE_default324;
extern T325 GE_default325;
extern T326 GE_default326;
extern T327 GE_default327;
extern T329 GE_default329;
extern T330 GE_default330;
extern T331 GE_default331;
extern T332 GE_default332;
extern T333 GE_default333;
extern T334 GE_default334;
extern T335 GE_default335;
extern T336 GE_default336;
extern T338 GE_default338;
extern T339 GE_default339;
extern T340 GE_default340;
extern T341 GE_default341;
extern T342 GE_default342;
extern T343 GE_default343;
extern T344 GE_default344;
extern T345 GE_default345;
extern T346 GE_default346;
extern T347 GE_default347;
extern T348 GE_default348;
extern T349 GE_default349;
extern T350 GE_default350;
extern T351 GE_default351;
extern T352 GE_default352;
extern T353 GE_default353;
extern T354 GE_default354;
extern T355 GE_default355;
extern T356 GE_default356;
extern T357 GE_default357;
extern T358 GE_default358;
extern T359 GE_default359;
extern T360 GE_default360;
extern T361 GE_default361;
extern T362 GE_default362;
extern T363 GE_default363;
extern T364 GE_default364;
extern T365 GE_default365;
extern T366 GE_default366;
extern T367 GE_default367;
extern T368 GE_default368;
extern T369 GE_default369;
extern T370 GE_default370;
extern T371 GE_default371;
extern T372 GE_default372;
extern T373 GE_default373;
extern T374 GE_default374;
extern T375 GE_default375;
extern T376 GE_default376;
extern T377 GE_default377;
extern T378 GE_default378;
extern T379 GE_default379;
extern T380 GE_default380;
extern T381 GE_default381;
extern T382 GE_default382;
extern T383 GE_default383;
extern T384 GE_default384;
extern T385 GE_default385;
extern T386 GE_default386;
extern T387 GE_default387;
extern T389 GE_default389;
extern T391 GE_default391;
extern T392 GE_default392;
extern T393 GE_default393;
extern T394 GE_default394;
extern T395 GE_default395;
extern T396 GE_default396;
extern T397 GE_default397;
extern T398 GE_default398;
extern T399 GE_default399;
extern T400 GE_default400;
extern T401 GE_default401;
extern T402 GE_default402;
extern T403 GE_default403;
extern T404 GE_default404;
extern T405 GE_default405;
extern T407 GE_default407;
extern T408 GE_default408;
extern T409 GE_default409;
extern T410 GE_default410;
extern T411 GE_default411;
extern T412 GE_default412;
extern T413 GE_default413;
extern T414 GE_default414;
extern T415 GE_default415;
extern T418 GE_default418;
extern T419 GE_default419;
extern T420 GE_default420;
extern T421 GE_default421;
extern T422 GE_default422;
extern T423 GE_default423;
extern T424 GE_default424;
extern T425 GE_default425;
extern T426 GE_default426;
extern T427 GE_default427;
extern T428 GE_default428;
extern T429 GE_default429;
extern T430 GE_default430;
extern T431 GE_default431;
extern T432 GE_default432;
extern T433 GE_default433;
extern T434 GE_default434;
extern T435 GE_default435;
extern T436 GE_default436;
extern T437 GE_default437;
extern T438 GE_default438;
extern T439 GE_default439;
extern T440 GE_default440;
extern T441 GE_default441;
extern T442 GE_default442;
extern T443 GE_default443;
extern T444 GE_default444;
extern T445 GE_default445;
extern T446 GE_default446;
extern T447 GE_default447;
extern T448 GE_default448;
extern T449 GE_default449;
extern T450 GE_default450;
extern T451 GE_default451;
extern T452 GE_default452;
extern T453 GE_default453;
extern T454 GE_default454;
extern T455 GE_default455;
extern T456 GE_default456;
extern T457 GE_default457;
extern T458 GE_default458;
extern T459 GE_default459;
extern T460 GE_default460;
extern T461 GE_default461;
extern T462 GE_default462;
extern T463 GE_default463;
extern T464 GE_default464;
extern T465 GE_default465;
extern T466 GE_default466;
extern T467 GE_default467;
extern T468 GE_default468;
extern T469 GE_default469;
extern T470 GE_default470;
extern T471 GE_default471;
extern T472 GE_default472;
extern T473 GE_default473;
extern T474 GE_default474;
extern T475 GE_default475;
extern T476 GE_default476;
extern T477 GE_default477;
extern T478 GE_default478;
extern T479 GE_default479;
extern T480 GE_default480;
extern T481 GE_default481;
extern T482 GE_default482;
extern T483 GE_default483;
extern T484 GE_default484;
extern T485 GE_default485;
extern T486 GE_default486;
extern T488 GE_default488;
extern T489 GE_default489;
extern T490 GE_default490;
extern T491 GE_default491;
extern T493 GE_default493;
extern T494 GE_default494;
extern T495 GE_default495;
extern T496 GE_default496;
extern T498 GE_default498;
extern T499 GE_default499;
extern T500 GE_default500;
extern T501 GE_default501;
extern T508 GE_default508;
extern T511 GE_default511;
extern T512 GE_default512;
extern T515 GE_default515;
extern T517 GE_default517;
extern T519 GE_default519;
extern T521 GE_default521;
extern T522 GE_default522;
extern T523 GE_default523;
extern T524 GE_default524;
extern T526 GE_default526;
extern T527 GE_default527;
extern T528 GE_default528;
extern T529 GE_default529;
extern T531 GE_default531;
extern T532 GE_default532;
extern T533 GE_default533;
extern T534 GE_default534;
extern T535 GE_default535;
extern T536 GE_default536;
extern T537 GE_default537;
extern T539 GE_default539;
extern T540 GE_default540;
extern T542 GE_default542;
extern T543 GE_default543;
extern T544 GE_default544;
extern T545 GE_default545;
extern T546 GE_default546;
extern T547 GE_default547;
extern T548 GE_default548;
extern T549 GE_default549;
extern T550 GE_default550;
extern T551 GE_default551;
extern T552 GE_default552;
extern T553 GE_default553;
extern T554 GE_default554;
extern T555 GE_default555;
extern T556 GE_default556;
extern T558 GE_default558;
extern T559 GE_default559;
extern T560 GE_default560;
extern T562 GE_default562;
extern T567 GE_default567;
extern T568 GE_default568;
extern T569 GE_default569;
extern T571 GE_default571;
extern T572 GE_default572;
extern T573 GE_default573;
extern T574 GE_default574;
extern T575 GE_default575;
extern T576 GE_default576;
extern T577 GE_default577;
extern T578 GE_default578;
extern T579 GE_default579;
extern T580 GE_default580;
extern T581 GE_default581;
extern T582 GE_default582;
extern T583 GE_default583;
extern T584 GE_default584;
extern T585 GE_default585;
extern T586 GE_default586;
extern T587 GE_default587;
extern T588 GE_default588;
extern T589 GE_default589;
extern T590 GE_default590;
extern T591 GE_default591;
extern T592 GE_default592;
extern T593 GE_default593;
extern T594 GE_default594;
extern T595 GE_default595;
extern T596 GE_default596;
extern T597 GE_default597;
extern T598 GE_default598;
extern T599 GE_default599;
extern T600 GE_default600;
extern T601 GE_default601;
extern T602 GE_default602;
extern T603 GE_default603;
extern T604 GE_default604;
extern T605 GE_default605;
extern T606 GE_default606;
extern T607 GE_default607;
extern T608 GE_default608;
extern T609 GE_default609;
extern T614 GE_default614;
extern T615 GE_default615;
extern T616 GE_default616;
extern T617 GE_default617;
extern T618 GE_default618;
extern T619 GE_default619;
extern T620 GE_default620;
extern T621 GE_default621;
extern T622 GE_default622;
extern T623 GE_default623;
extern T624 GE_default624;
extern T625 GE_default625;
extern T628 GE_default628;
extern T630 GE_default630;
extern T632 GE_default632;
extern T633 GE_default633;
extern T634 GE_default634;
extern T635 GE_default635;
extern T637 GE_default637;
extern T638 GE_default638;
extern T640 GE_default640;
extern T642 GE_default642;
extern T644 GE_default644;
extern T645 GE_default645;
extern T647 GE_default647;
extern T648 GE_default648;
extern T649 GE_default649;
extern T650 GE_default650;
extern T651 GE_default651;
extern T652 GE_default652;
extern T653 GE_default653;
extern T655 GE_default655;
extern T656 GE_default656;
extern T657 GE_default657;
extern T661 GE_default661;
extern T663 GE_default663;
extern T666 GE_default666;
extern T669 GE_default669;
extern T670 GE_default670;
extern T671 GE_default671;
extern T672 GE_default672;
extern T675 GE_default675;
extern T676 GE_default676;

extern T0* GE_ms8(const char *s, T6 c);
extern T0* GE_ms32(char* s, T6 c);
/* Call to ANY.same_type */
extern T1 T20x27T0(GE_context* ac, T0* C, T0* a1);
/* Call to GEANT_VARIABLES.has */
extern T1 T36x2517T0(GE_context* ac, T0* C, T0* a1);
/* Call to GEANT_VARIABLES.item_for_iteration */
extern T0* T36x2584(GE_context* ac, T0* C);
/* Call to GEANT_VARIABLES.key_for_iteration */
extern T0* T36x2509(GE_context* ac, T0* C);
/* Call to GEANT_VARIABLES.after */
extern T1 T36x2564(GE_context* ac, T0* C);
/* Call to GEANT_VARIABLES.found_item */
extern T0* T36x2607(GE_context* ac, T0* C);
/* Call to GEANT_VARIABLES.found */
extern T1 T36x2615(GE_context* ac, T0* C);
/* Call to AP_OPTION.short_form */
extern T2 T49x3078(GE_context* ac, T0* C);
/* Call to AP_OPTION.long_form */
extern T0* T49x3073(GE_context* ac, T0* C);
/* Call to AP_OPTION.example */
extern T0* T49x3072(GE_context* ac, T0* C);
/* Call to AP_OPTION.is_hidden */
extern T1 T49x3082(GE_context* ac, T0* C);
/* Call to AP_OPTION.description */
extern T0* T49x3071(GE_context* ac, T0* C);
/* Call to AP_OPTION.names */
extern T0* T49x3075(GE_context* ac, T0* C);
/* Call to AP_OPTION.name */
extern T0* T49x3074(GE_context* ac, T0* C);
/* Call to AP_OPTION.needs_parameter */
extern T1 T49x3084(GE_context* ac, T0* C);
/* Call to AP_OPTION.has_short_form */
extern T1 T49x3081(GE_context* ac, T0* C);
/* Call to AP_OPTION.allows_parameter */
extern T1 T49x3079(GE_context* ac, T0* C);
/* Call to AP_OPTION.maximum_occurrences */
extern T6 T49x3077(GE_context* ac, T0* C);
/* Call to AP_OPTION.occurrences */
extern T6 T49x3076(GE_context* ac, T0* C);
/* Call to AP_OPTION.was_found */
extern T1 T49x3086(GE_context* ac, T0* C);
/* Call to AP_OPTION.is_mandatory */
extern T1 T49x3083(GE_context* ac, T0* C);
/* Call to UT_ERROR.default_message */
extern T0* T57x3407(GE_context* ac, T0* C);
/* Call to READABLE_STRING_GENERAL.code */
extern T10 T72x404T6(GE_context* ac, T0* C, T6 a1);
/* Call to READABLE_STRING_GENERAL.count */
extern T6 T72x442(GE_context* ac, T0* C);
/* Call to READABLE_STRING_GENERAL.substring */
extern T0* T72x483T6T6(GE_context* ac, T0* C, T6 a1, T6 a2);
/* Call to READABLE_STRING_GENERAL.item */
extern T3 T72x405T6(GE_context* ac, T0* C, T6 a1);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_key */
extern T0* T120x2511T0(GE_context* ac, T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_item */
extern T0* T120x2592T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.start_condition */
extern T6 T183x7347(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.is_applicable_encoding */
extern T1 T183x7216T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.end_of_file */
extern T1 T183x7353(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.last_value */
extern T0* T183x7227(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.last_token */
extern T6 T183x7343(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.error_position */
extern T0* T183x7225(GE_context* ac, T0* C);
/* Call to XM_DOCUMENT_NODE.parent */
extern T0* T234x6483(GE_context* ac, T0* C);
/* Call to XM_ELEMENT_NODE.parent */
extern T0* T311x6483(GE_context* ac, T0* C);
/* Call to GEANT_TASK.exit_code */
extern T6 T315x8692(GE_context* ac, T0* C);
/* Call to GEANT_TASK.is_exit_command */
extern T1 T315x8693(GE_context* ac, T0* C);
/* Call to GEANT_TASK.is_enabled */
extern T1 T315x2901(GE_context* ac, T0* C);
/* Call to GEANT_TASK.is_executable */
extern T1 T315x8691(GE_context* ac, T0* C);
/* Call to FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK].item with a manifest tuple argument of type [attached] TUPLE [XM_ELEMENT] */
extern T0* T337xmt8784T333(GE_context* ac, T0* C, T0* a1);
/* Call to detachable LX_TRANSITION [LX_NFA_STATE].target */
extern T0* T629x13287(GE_context* ac, T0* C);
/* Call to detachable LX_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T629x13290T6(GE_context* ac, T0* C, T6 a1);
/* Call to EXCEPTION.set_type_name */
extern void T28x2316T0(GE_context* ac, T0* C, T0* a1);
/* Call to EXCEPTION.set_recipient_name */
extern void T28x2312T0(GE_context* ac, T0* C, T0* a1);
/* Call to EXCEPTION.set_description */
extern void T28x2304T0(GE_context* ac, T0* C, T0* a1);
/* Call to EXCEPTION.set_exception_trace */
extern void T28x2318T0(GE_context* ac, T0* C, T0* a1);
/* Call to EXCEPTION.set_throwing_exception */
extern void T28x2311T0(GE_context* ac, T0* C, T0* a1);
/* Call to GEANT_VARIABLES.replace */
extern void T36x2519T0T0(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Call to GEANT_VARIABLES.set_variable_value */
extern void T36x2425T0T0(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Call to GEANT_VARIABLES.forth */
extern void T36x2568(GE_context* ac, T0* C);
/* Call to GEANT_VARIABLES.start */
extern void T36x2567(GE_context* ac, T0* C);
/* Call to GEANT_VARIABLES.search */
extern void T36x2624T0(GE_context* ac, T0* C, T0* a1);
/* Call to GEANT_VARIABLES.force_last */
extern void T36x2494T0T0(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Call to AP_OPTION.record_occurrence */
extern void T49x3097T0(GE_context* ac, T0* C, T0* a1);
/* Call to AP_OPTION.reset */
extern void T49x3098(GE_context* ac, T0* C);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_forth */
extern void T120x2581T0(GE_context* ac, T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_start */
extern void T120x2580T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_CALLBACKS_FILTER.set_next */
extern void T140x5680T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_xml_declaration */
extern void T141x5869T0T0T1(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* Call to XM_CALLBACKS.on_attribute */
extern void T141x5874T0T0T0T0(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* Call to XM_CALLBACKS.on_error */
extern void T141x5870T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_end_tag */
extern void T141x5876T0T0T0(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_start_tag_finish */
extern void T141x5875(GE_context* ac, T0* C);
/* Call to XM_CALLBACKS.on_start_tag */
extern void T141x5873T0T0T0(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_content */
extern void T141x5877T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_processing_instruction */
extern void T141x5871T0T0(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Call to XM_CALLBACKS.on_comment */
extern void T141x5872T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_finish */
extern void T141x5868(GE_context* ac, T0* C);
/* Call to XM_CALLBACKS.on_start */
extern void T141x5867(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.close_input */
extern void T183x7212(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T183x7211T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.set_encoding */
extern void T183x7217T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T183x7208(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.read_token */
extern void T183x7361(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_stream */
extern void T183x7210T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_DOCUMENT_NODE.node_set_parent */
extern void T234x6496T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_ELEMENT_NODE.node_set_parent */
extern void T311x6496T0(GE_context* ac, T0* C, T0* a1);
/* Call to GEANT_TASK.execute */
extern void T315x8695(GE_context* ac, T0* C);
/* Call to GEANT_TASK.log_validation_messages */
extern void T315x8696(GE_context* ac, T0* C);
/* Call to detachable LX_TRANSITION [LX_NFA_STATE].record */
extern void T629x13291T0(GE_context* ac, T0* C, T0* a1);
/* New instance of type SPECIAL [CHARACTER_8] */
extern T0* GE_new15(T6 a1, T1 initialize);
/* New instance of type SPECIAL [CHARACTER_32] */
extern T0* GE_new16(T6 a1, T1 initialize);
/* New instance of type STRING_8 */
extern T0* GE_new17(T1 initialize);
/* New instance of type STRING_32 */
extern T0* GE_new18(T1 initialize);
/* New instance of type ISE_EXCEPTION_MANAGER */
extern T0* GE_new19(T1 initialize);
/* New instance of type GEANT */
extern T0* GE_new22(T1 initialize);
/* New instance of type HASH_TABLE [INTEGER_32, INTEGER_32] */
extern T0* GE_new23(T1 initialize);
/* New instance of type CELL [detachable TUPLE [INTEGER_32, INTEGER_32, INTEGER_32, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, INTEGER_32, BOOLEAN]] */
extern T0* GE_new24(T1 initialize);
/* New instance of type CELL [detachable EXCEPTION] */
extern T0* GE_new25(T1 initialize);
/* New instance of type CELL [NO_MORE_MEMORY] */
extern T0* GE_new26(T1 initialize);
/* New instance of type [attached] TUPLE [INTEGER_32, INTEGER_32, INTEGER_32, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, INTEGER_32, BOOLEAN] */
extern T0* GE_new27(T1 initialize);
/* New instance of type GEANT_PROJECT */
extern T0* GE_new29(T1 initialize);
/* New instance of type GEANT_PROJECT_LOADER */
extern T0* GE_new30(T1 initialize);
/* New instance of type GEANT_PROJECT_OPTIONS */
extern T0* GE_new31(T1 initialize);
/* New instance of type GEANT_PROJECT_VARIABLES */
extern T0* GE_new32(T1 initialize);
/* New instance of type GEANT_TARGET */
extern T0* GE_new33(T1 initialize);
/* New instance of type KL_ARGUMENTS */
extern T0* GE_new34(T1 initialize);
/* New instance of type UT_ERROR_HANDLER */
extern T0* GE_new35(T1 initialize);
/* New instance of type GEANT_VARIABLES */
extern T0* GE_new36(T1 initialize);
/* New instance of type GEANT_PROJECT_ELEMENT */
extern T0* GE_new37(T1 initialize);
/* New instance of type DS_HASH_TABLE [GEANT_TARGET, STRING_8] */
extern T0* GE_new38(T1 initialize);
/* New instance of type ARRAY [STRING_8] */
extern T0* GE_new39(T1 initialize);
/* New instance of type SPECIAL [STRING_8] */
extern T0* GE_new40(T6 a1, T1 initialize);
/* New instance of type GEANT_ARGUMENT_VARIABLES */
extern T0* GE_new41(T1 initialize);
/* New instance of type AP_FLAG */
extern T0* GE_new42(T1 initialize);
/* New instance of type AP_ALTERNATIVE_OPTIONS_LIST */
extern T0* GE_new43(T1 initialize);
/* New instance of type AP_STRING_OPTION */
extern T0* GE_new44(T1 initialize);
/* New instance of type AP_PARSER */
extern T0* GE_new45(T1 initialize);
/* New instance of type AP_ERROR */
extern T0* GE_new47(T1 initialize);
/* New instance of type AP_ERROR_HANDLER */
extern T0* GE_new52(T1 initialize);
/* New instance of type KL_STANDARD_FILES */
extern T0* GE_new53(T1 initialize);
/* New instance of type KL_STDERR_FILE */
extern T0* GE_new54(T1 initialize);
/* New instance of type KL_EXCEPTIONS */
extern T0* GE_new55(T1 initialize);
/* New instance of type UT_VERSION_NUMBER */
extern T0* GE_new56(T1 initialize);
/* New instance of type VOID_TARGET */
extern T0* GE_new58(T1 initialize);
/* New instance of type ROUTINE_FAILURE */
extern T0* GE_new60(T1 initialize);
/* New instance of type OLD_VIOLATION */
extern T0* GE_new62(T1 initialize);
/* New instance of type NO_MORE_MEMORY */
extern T0* GE_new64(T1 initialize);
/* New instance of type INVARIANT_VIOLATION */
extern T0* GE_new65(T1 initialize);
/* New instance of type OPERATING_SYSTEM_SIGNAL_FAILURE */
extern T0* GE_new66(T1 initialize);
/* New instance of type IO_FAILURE */
extern T0* GE_new67(T1 initialize);
/* New instance of type OPERATING_SYSTEM_FAILURE */
extern T0* GE_new68(T1 initialize);
/* New instance of type COM_FAILURE */
extern T0* GE_new69(T1 initialize);
/* New instance of type EIFFEL_RUNTIME_PANIC */
extern T0* GE_new70(T1 initialize);
/* New instance of type PRECONDITION_VIOLATION */
extern T0* GE_new73(T1 initialize);
/* New instance of type POSTCONDITION_VIOLATION */
extern T0* GE_new74(T1 initialize);
/* New instance of type FLOATING_POINT_FAILURE */
extern T0* GE_new75(T1 initialize);
/* New instance of type CHECK_VIOLATION */
extern T0* GE_new76(T1 initialize);
/* New instance of type BAD_INSPECT_VALUE */
extern T0* GE_new77(T1 initialize);
/* New instance of type VARIANT_VIOLATION */
extern T0* GE_new78(T1 initialize);
/* New instance of type LOOP_INVARIANT_VIOLATION */
extern T0* GE_new79(T1 initialize);
/* New instance of type RESCUE_FAILURE */
extern T0* GE_new80(T1 initialize);
/* New instance of type RESUMPTION_FAILURE */
extern T0* GE_new81(T1 initialize);
/* New instance of type CREATE_ON_DEFERRED */
extern T0* GE_new82(T1 initialize);
/* New instance of type EXTERNAL_FAILURE */
extern T0* GE_new83(T1 initialize);
/* New instance of type VOID_ASSIGNED_TO_EXPANDED */
extern T0* GE_new84(T1 initialize);
/* New instance of type EXCEPTION_IN_SIGNAL_HANDLER_FAILURE */
extern T0* GE_new85(T1 initialize);
/* New instance of type MISMATCH_FAILURE */
extern T0* GE_new86(T1 initialize);
/* New instance of type DEVELOPER_EXCEPTION */
extern T0* GE_new87(T1 initialize);
/* New instance of type ADDRESS_APPLIED_TO_MELTED_FEATURE */
extern T0* GE_new88(T1 initialize);
/* New instance of type SERIALIZATION_FAILURE */
extern T0* GE_new89(T1 initialize);
/* New instance of type KL_OPERATING_SYSTEM */
extern T0* GE_new90(T1 initialize);
/* New instance of type KL_WINDOWS_FILE_SYSTEM */
extern T0* GE_new92(T1 initialize);
/* New instance of type KL_UNIX_FILE_SYSTEM */
extern T0* GE_new93(T1 initialize);
/* New instance of type PRIMES */
extern T0* GE_new94(T1 initialize);
/* New instance of type SPECIAL [INTEGER_32] */
extern T0* GE_new95(T6 a1, T1 initialize);
/* New instance of type SPECIAL [BOOLEAN] */
extern T0* GE_new96(T6 a1, T1 initialize);
/* New instance of type KL_TEXT_INPUT_FILE */
extern T0* GE_new97(T1 initialize);
/* New instance of type GEANT_PROJECT_PARSER */
extern T0* GE_new98(T1 initialize);
/* New instance of type GEANT_PROJECT_VARIABLE_RESOLVER */
extern T0* GE_new100(T1 initialize);
/* New instance of type UC_STRING_EQUALITY_TESTER */
extern T0* GE_new101(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [STRING_8] */
extern T0* GE_new104(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
extern T0* GE_new105(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [INTEGER_32] */
extern T0* GE_new106(T1 initialize);
/* New instance of type KL_STDOUT_FILE */
extern T0* GE_new108(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [AP_OPTION] */
extern T0* GE_new109(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [detachable STRING_8] */
extern T0* GE_new110(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [detachable STRING_8] */
extern T0* GE_new111(T1 initialize);
/* New instance of type AP_DISPLAY_HELP_FLAG */
extern T0* GE_new112(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [AP_OPTION] */
extern T0* GE_new113(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST] */
extern T0* GE_new114(T1 initialize);
/* New instance of type KL_STRING_ROUTINES */
extern T0* GE_new115(T1 initialize);
/* New instance of type DS_HASH_TABLE [STRING_8, STRING_8] */
extern T0* GE_new120(T1 initialize);
/* New instance of type ARGUMENTS_32 */
extern T0* GE_new121(T1 initialize);
/* New instance of type IMMUTABLE_STRING_32 */
extern T0* GE_new122(T1 initialize);
/* New instance of type STD_FILES */
extern T0* GE_new124(T1 initialize);
/* New instance of type CELL [INTEGER_32] */
extern T0* GE_new126(T1 initialize);
/* New instance of type C_STRING */
extern T0* GE_new127(T1 initialize);
/* New instance of type MANAGED_POINTER */
extern T0* GE_new128(T1 initialize);
/* New instance of type EXECUTION_ENVIRONMENT */
extern T0* GE_new129(T1 initialize);
/* New instance of type KL_ANY_ROUTINES */
extern T0* GE_new130(T1 initialize);
/* New instance of type KL_PATHNAME */
extern T0* GE_new132(T1 initialize);
/* New instance of type FILE_INFO */
extern T0* GE_new133(T1 initialize);
/* New instance of type detachable KL_LINKABLE [CHARACTER_8] */
extern T0* GE_new135(T1 initialize);
/* New instance of type XM_EXPAT_PARSER_FACTORY */
extern T0* GE_new136(T1 initialize);
/* New instance of type XM_EIFFEL_PARSER */
extern T0* GE_new138(T1 initialize);
/* New instance of type XM_TREE_CALLBACKS_PIPE */
extern T0* GE_new139(T1 initialize);
/* New instance of type XM_CALLBACKS_TO_TREE_FILTER */
extern T0* GE_new142(T1 initialize);
/* New instance of type XM_DOCUMENT */
extern T0* GE_new143(T1 initialize);
/* New instance of type XM_ELEMENT */
extern T0* GE_new144(T1 initialize);
/* New instance of type XM_STOP_ON_ERROR_FILTER */
extern T0* GE_new145(T1 initialize);
/* New instance of type XM_POSITION_TABLE */
extern T0* GE_new146(T1 initialize);
/* New instance of type KL_EXECUTION_ENVIRONMENT */
extern T0* GE_new149(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES] */
extern T0* GE_new150(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [GEANT_VARIABLES] */
extern T0* GE_new151(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [AP_OPTION] */
extern T0* GE_new152(T1 initialize);
/* New instance of type SPECIAL [AP_OPTION] */
extern T0* GE_new154(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [AP_OPTION] */
extern T0* GE_new155(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST] */
extern T0* GE_new156(T1 initialize);
/* New instance of type SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
extern T0* GE_new157(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST] */
extern T0* GE_new158(T1 initialize);
/* New instance of type UC_STRING */
extern T0* GE_new159(T1 initialize);
/* New instance of type STRING_TO_INTEGER_CONVERTOR */
extern T0* GE_new161(T1 initialize);
/* New instance of type DS_LINKED_LIST [XM_ELEMENT] */
extern T0* GE_new163(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [XM_ELEMENT] */
extern T0* GE_new164(T1 initialize);
/* New instance of type GEANT_INHERIT_ELEMENT */
extern T0* GE_new165(T1 initialize);
/* New instance of type GEANT_INHERIT */
extern T0* GE_new166(T1 initialize);
/* New instance of type SPECIAL [GEANT_TARGET] */
extern T0* GE_new167(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_TARGET] */
extern T0* GE_new170(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8] */
extern T0* GE_new171(T1 initialize);
/* New instance of type ARRAY [IMMUTABLE_STRING_32] */
extern T0* GE_new172(T1 initialize);
/* New instance of type SPECIAL [IMMUTABLE_STRING_32] */
extern T0* GE_new173(T6 a1, T1 initialize);
/* New instance of type NATIVE_STRING */
extern T0* GE_new174(T1 initialize);
/* New instance of type READABLE_STRING_32 */
extern T0* GE_new175(T1 initialize);
/* New instance of type CONSOLE */
extern T0* GE_new176(T1 initialize);
/* New instance of type EXCEPTIONS */
extern T0* GE_new177(T1 initialize);
/* New instance of type SPECIAL [NATURAL_8] */
extern T0* GE_new179(T6 a1, T1 initialize);
/* New instance of type PLATFORM */
extern T0* GE_new181(T1 initialize);
/* New instance of type XM_EIFFEL_SCANNER */
extern T0* GE_new183(T1 initialize);
/* New instance of type XM_DEFAULT_POSITION */
extern T0* GE_new184(T1 initialize);
/* New instance of type DS_BILINKED_LIST [XM_POSITION] */
extern T0* GE_new186(T1 initialize);
/* New instance of type DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
extern T0* GE_new187(T1 initialize);
/* New instance of type XM_CALLBACKS_NULL */
extern T0* GE_new188(T1 initialize);
/* New instance of type DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
extern T0* GE_new189(T1 initialize);
/* New instance of type XM_NULL_EXTERNAL_RESOLVER */
extern T0* GE_new191(T1 initialize);
/* New instance of type XM_DTD_CALLBACKS_NULL */
extern T0* GE_new193(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [detachable ANY] */
extern T0* GE_new194(T1 initialize);
/* New instance of type SPECIAL [detachable ANY] */
extern T0* GE_new195(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new196(T1 initialize);
/* New instance of type XM_EIFFEL_PARSER_NAME */
extern T0* GE_new197(T1 initialize);
/* New instance of type SPECIAL [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new198(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
extern T0* GE_new199(T1 initialize);
/* New instance of type DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new200(T1 initialize);
/* New instance of type SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
extern T0* GE_new201(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
extern T0* GE_new202(T1 initialize);
/* New instance of type XM_DTD_EXTERNAL_ID */
extern T0* GE_new203(T1 initialize);
/* New instance of type SPECIAL [XM_DTD_EXTERNAL_ID] */
extern T0* GE_new204(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new205(T1 initialize);
/* New instance of type XM_DTD_ELEMENT_CONTENT */
extern T0* GE_new206(T1 initialize);
/* New instance of type SPECIAL [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new207(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
extern T0* GE_new208(T1 initialize);
/* New instance of type DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new209(T1 initialize);
/* New instance of type SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
extern T0* GE_new210(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new211(T1 initialize);
/* New instance of type XM_DTD_ATTRIBUTE_CONTENT */
extern T0* GE_new212(T1 initialize);
/* New instance of type SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new213(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
extern T0* GE_new214(T1 initialize);
/* New instance of type DS_BILINKED_LIST [STRING_8] */
extern T0* GE_new215(T1 initialize);
/* New instance of type SPECIAL [DS_BILINKED_LIST [STRING_8]] */
extern T0* GE_new216(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [BOOLEAN] */
extern T0* GE_new217(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
extern T0* GE_new218(T1 initialize);
/* New instance of type XM_EIFFEL_DECLARATION */
extern T0* GE_new219(T1 initialize);
/* New instance of type SPECIAL [XM_EIFFEL_DECLARATION] */
extern T0* GE_new220(T6 a1, T1 initialize);
/* New instance of type XM_EIFFEL_ENTITY_DEF */
extern T0* GE_new223(T1 initialize);
/* New instance of type XM_EIFFEL_SCANNER_DTD */
extern T0* GE_new224(T1 initialize);
/* New instance of type XM_EIFFEL_PE_ENTITY_DEF */
extern T0* GE_new226(T1 initialize);
/* New instance of type XM_NAMESPACE_RESOLVER */
extern T0* GE_new227(T1 initialize);
/* New instance of type ARRAY [XM_CALLBACKS_FILTER] */
extern T0* GE_new228(T1 initialize);
/* New instance of type SPECIAL [XM_CALLBACKS_FILTER] */
extern T0* GE_new229(T6 a1, T1 initialize);
/* New instance of type DS_HASH_SET [XM_NAMESPACE] */
extern T0* GE_new230(T1 initialize);
/* New instance of type XM_NAMESPACE */
extern T0* GE_new231(T1 initialize);
/* New instance of type XM_LINKED_LIST [XM_DOCUMENT_NODE] */
extern T0* GE_new232(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE] */
extern T0* GE_new236(T1 initialize);
/* New instance of type XM_LINKED_LIST [XM_ELEMENT_NODE] */
extern T0* GE_new239(T1 initialize);
/* New instance of type DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
extern T0* GE_new241(T1 initialize);
/* New instance of type SPECIAL [GEANT_ARGUMENT_VARIABLES] */
extern T0* GE_new242(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES] */
extern T0* GE_new243(T1 initialize);
/* New instance of type SPECIAL [GEANT_VARIABLES] */
extern T0* GE_new244(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_VARIABLES] */
extern T0* GE_new245(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [GEANT_TARGET] */
extern T0* GE_new247(T1 initialize);
/* New instance of type GEANT_TASK_FACTORY */
extern T0* GE_new248(T1 initialize);
/* New instance of type GEANT_PARENT */
extern T0* GE_new249(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [GEANT_PARENT] */
extern T0* GE_new251(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [GEANT_PARENT] */
extern T0* GE_new252(T1 initialize);
/* New instance of type GEANT_INTERPRETING_ELEMENT */
extern T0* GE_new253(T1 initialize);
/* New instance of type GEANT_ARGUMENT_ELEMENT */
extern T0* GE_new254(T1 initialize);
/* New instance of type GEANT_LOCAL_ELEMENT */
extern T0* GE_new255(T1 initialize);
/* New instance of type GEANT_GLOBAL_ELEMENT */
extern T0* GE_new256(T1 initialize);
/* New instance of type XM_ATTRIBUTE */
extern T0* GE_new257(T1 initialize);
/* New instance of type GEANT_GROUP */
extern T0* GE_new258(T1 initialize);
/* New instance of type ARRAY [INTEGER_32] */
extern T0* GE_new263(T1 initialize);
/* New instance of type UC_UTF8_ROUTINES */
extern T0* GE_new264(T1 initialize);
/* New instance of type UC_UTF8_STRING */
extern T0* GE_new265(T1 initialize);
/* New instance of type XM_EIFFEL_INPUT_STREAM */
extern T0* GE_new266(T1 initialize);
/* New instance of type KL_INTEGER_ROUTINES */
extern T0* GE_new267(T1 initialize);
/* New instance of type KL_PLATFORM */
extern T0* GE_new268(T1 initialize);
/* New instance of type KL_ARRAY_ROUTINES [INTEGER_32] */
extern T0* GE_new269(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE] */
extern T0* GE_new270(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
extern T0* GE_new271(T1 initialize);
/* New instance of type DS_PAIR [XM_POSITION, XM_NODE] */
extern T0* GE_new272(T1 initialize);
/* New instance of type INTEGER_OVERFLOW_CHECKER */
extern T0* GE_new273(T1 initialize);
/* New instance of type detachable DS_LINKABLE [XM_ELEMENT] */
extern T0* GE_new274(T1 initialize);
/* New instance of type GEANT_PARENT_ELEMENT */
extern T0* GE_new275(T1 initialize);
/* New instance of type XM_EIFFEL_CHARACTER_ENTITY */
extern T0* GE_new278(T1 initialize);
/* New instance of type YY_BUFFER */
extern T0* GE_new279(T1 initialize);
/* New instance of type YY_FILE_BUFFER */
extern T0* GE_new280(T1 initialize);
/* New instance of type detachable DS_BILINKABLE [XM_POSITION] */
extern T0* GE_new284(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [XM_POSITION] */
extern T0* GE_new285(T1 initialize);
/* New instance of type detachable DS_LINKABLE [XM_EIFFEL_SCANNER] */
extern T0* GE_new286(T1 initialize);
/* New instance of type SPECIAL [XM_EIFFEL_ENTITY_DEF] */
extern T0* GE_new287(T6 a1, T1 initialize);
/* New instance of type detachable DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
extern T0* GE_new290(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
extern T0* GE_new291(T1 initialize);
/* New instance of type detachable KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new293(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new294(T1 initialize);
/* New instance of type DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new295(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new296(T1 initialize);
/* New instance of type detachable DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new297(T1 initialize);
/* New instance of type DS_LINKED_LIST [STRING_8] */
extern T0* GE_new298(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [STRING_8] */
extern T0* GE_new299(T1 initialize);
/* New instance of type detachable DS_BILINKABLE [STRING_8] */
extern T0* GE_new300(T1 initialize);
/* New instance of type XM_NAMESPACE_RESOLVER_CONTEXT */
extern T0* GE_new301(T1 initialize);
/* New instance of type DS_LINKED_QUEUE [STRING_8] */
extern T0* GE_new303(T1 initialize);
/* New instance of type detachable KL_EQUALITY_TESTER [XM_NAMESPACE] */
extern T0* GE_new304(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [XM_NAMESPACE] */
extern T0* GE_new305(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
extern T0* GE_new306(T1 initialize);
/* New instance of type SPECIAL [XM_NAMESPACE] */
extern T0* GE_new307(T6 a1, T1 initialize);
/* New instance of type detachable DS_LINKABLE [XM_DOCUMENT_NODE] */
extern T0* GE_new308(T1 initialize);
/* New instance of type GEANT_STRING_INTERPRETER */
extern T0* GE_new312(T1 initialize);
/* New instance of type GEANT_NAME_VALUE_ELEMENT */
extern T0* GE_new314(T1 initialize);
/* New instance of type KL_ARRAY_ROUTINES [detachable STRING_8] */
extern T0* GE_new318(T1 initialize);
/* New instance of type AP_OPTION_COMPARATOR */
extern T0* GE_new319(T1 initialize);
/* New instance of type DS_QUICK_SORTER [AP_OPTION] */
extern T0* GE_new320(T1 initialize);
/* New instance of type ST_WORD_WRAPPER */
extern T0* GE_new322(T1 initialize);
/* New instance of type HEXADECIMAL_STRING_TO_INTEGER_CONVERTER */
extern T0* GE_new324(T1 initialize);
/* New instance of type XM_COMMENT */
extern T0* GE_new325(T1 initialize);
/* New instance of type XM_PROCESSING_INSTRUCTION */
extern T0* GE_new326(T1 initialize);
/* New instance of type XM_CHARACTER_DATA */
extern T0* GE_new327(T1 initialize);
/* New instance of type detachable DS_LINKABLE [XM_ELEMENT_NODE] */
extern T0* GE_new329(T1 initialize);
/* New instance of type detachable DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
extern T0* GE_new330(T1 initialize);
/* New instance of type DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
extern T0* GE_new331(T1 initialize);
/* New instance of type GEANT_GEC_TASK */
extern T0* GE_new332(T1 initialize);
/* New instance of type [attached] TUPLE [XM_ELEMENT] */
extern T0* GE_new333(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEC_TASK] */
extern T0* GE_new334(T1 initialize);
/* New instance of type detachable TUPLE */
extern T0* GE_new335(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_TASK_FACTORY] */
extern T0* GE_new336(T1 initialize);
/* New instance of type GEANT_ISE_TASK */
extern T0* GE_new338(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_ISE_TASK] */
extern T0* GE_new339(T1 initialize);
/* New instance of type GEANT_EXEC_TASK */
extern T0* GE_new340(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_EXEC_TASK] */
extern T0* GE_new341(T1 initialize);
/* New instance of type GEANT_LCC_TASK */
extern T0* GE_new342(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_LCC_TASK] */
extern T0* GE_new343(T1 initialize);
/* New instance of type GEANT_SET_TASK */
extern T0* GE_new344(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_SET_TASK] */
extern T0* GE_new345(T1 initialize);
/* New instance of type GEANT_UNSET_TASK */
extern T0* GE_new346(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_UNSET_TASK] */
extern T0* GE_new347(T1 initialize);
/* New instance of type GEANT_GEXACE_TASK */
extern T0* GE_new348(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEXACE_TASK] */
extern T0* GE_new349(T1 initialize);
/* New instance of type GEANT_GELEX_TASK */
extern T0* GE_new350(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GELEX_TASK] */
extern T0* GE_new351(T1 initialize);
/* New instance of type GEANT_GEYACC_TASK */
extern T0* GE_new352(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEYACC_TASK] */
extern T0* GE_new353(T1 initialize);
/* New instance of type GEANT_GEPP_TASK */
extern T0* GE_new354(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEPP_TASK] */
extern T0* GE_new355(T1 initialize);
/* New instance of type GEANT_GETEST_TASK */
extern T0* GE_new356(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GETEST_TASK] */
extern T0* GE_new357(T1 initialize);
/* New instance of type GEANT_GEANT_TASK */
extern T0* GE_new358(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_GEANT_TASK] */
extern T0* GE_new359(T1 initialize);
/* New instance of type GEANT_ECHO_TASK */
extern T0* GE_new360(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_ECHO_TASK] */
extern T0* GE_new361(T1 initialize);
/* New instance of type GEANT_MKDIR_TASK */
extern T0* GE_new362(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_MKDIR_TASK] */
extern T0* GE_new363(T1 initialize);
/* New instance of type GEANT_DELETE_TASK */
extern T0* GE_new364(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_DELETE_TASK] */
extern T0* GE_new365(T1 initialize);
/* New instance of type GEANT_COPY_TASK */
extern T0* GE_new366(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_COPY_TASK] */
extern T0* GE_new367(T1 initialize);
/* New instance of type GEANT_MOVE_TASK */
extern T0* GE_new368(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_MOVE_TASK] */
extern T0* GE_new369(T1 initialize);
/* New instance of type GEANT_SETENV_TASK */
extern T0* GE_new370(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_SETENV_TASK] */
extern T0* GE_new371(T1 initialize);
/* New instance of type GEANT_XSLT_TASK */
extern T0* GE_new372(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_XSLT_TASK] */
extern T0* GE_new373(T1 initialize);
/* New instance of type GEANT_OUTOFDATE_TASK */
extern T0* GE_new374(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_OUTOFDATE_TASK] */
extern T0* GE_new375(T1 initialize);
/* New instance of type GEANT_EXIT_TASK */
extern T0* GE_new376(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_EXIT_TASK] */
extern T0* GE_new377(T1 initialize);
/* New instance of type GEANT_PRECURSOR_TASK */
extern T0* GE_new378(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_PRECURSOR_TASK] */
extern T0* GE_new379(T1 initialize);
/* New instance of type GEANT_AVAILABLE_TASK */
extern T0* GE_new380(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_AVAILABLE_TASK] */
extern T0* GE_new381(T1 initialize);
/* New instance of type GEANT_INPUT_TASK */
extern T0* GE_new382(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_INPUT_TASK] */
extern T0* GE_new383(T1 initialize);
/* New instance of type GEANT_REPLACE_TASK */
extern T0* GE_new384(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_TASK_FACTORY, [attached] TUPLE [XM_ELEMENT], GEANT_REPLACE_TASK] */
extern T0* GE_new385(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_PARENT] */
extern T0* GE_new386(T1 initialize);
/* New instance of type SPECIAL [GEANT_PARENT] */
extern T0* GE_new387(T6 a1, T1 initialize);
/* New instance of type UC_UNICODE_ROUTINES */
extern T0* GE_new389(T1 initialize);
/* New instance of type DS_LINKED_QUEUE [CHARACTER_8] */
extern T0* GE_new391(T1 initialize);
/* New instance of type UC_UTF16_ROUTINES */
extern T0* GE_new392(T1 initialize);
/* New instance of type SPECIAL [NATURAL_64] */
extern T0* GE_new393(T6 a1, T1 initialize);
/* New instance of type GEANT_RENAME_ELEMENT */
extern T0* GE_new394(T1 initialize);
/* New instance of type GEANT_REDEFINE_ELEMENT */
extern T0* GE_new395(T1 initialize);
/* New instance of type GEANT_SELECT_ELEMENT */
extern T0* GE_new396(T1 initialize);
/* New instance of type GEANT_RENAME */
extern T0* GE_new397(T1 initialize);
/* New instance of type DS_HASH_TABLE [GEANT_RENAME, STRING_8] */
extern T0* GE_new398(T1 initialize);
/* New instance of type GEANT_REDEFINE */
extern T0* GE_new399(T1 initialize);
/* New instance of type DS_HASH_TABLE [GEANT_REDEFINE, STRING_8] */
extern T0* GE_new400(T1 initialize);
/* New instance of type GEANT_SELECT */
extern T0* GE_new401(T1 initialize);
/* New instance of type DS_HASH_TABLE [GEANT_SELECT, STRING_8] */
extern T0* GE_new402(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new403(T1 initialize);
/* New instance of type attached DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new404(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [STRING_8] */
extern T0* GE_new405(T1 initialize);
/* New instance of type DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
extern T0* GE_new407(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
extern T0* GE_new408(T1 initialize);
/* New instance of type detachable DS_LINKABLE [STRING_8] */
extern T0* GE_new409(T1 initialize);
/* New instance of type KL_DIRECTORY */
extern T0* GE_new410(T1 initialize);
/* New instance of type ST_SPLITTER */
extern T0* GE_new411(T1 initialize);
/* New instance of type KL_STRING_INPUT_STREAM */
extern T0* GE_new412(T1 initialize);
/* New instance of type KL_CHARACTER_BUFFER */
extern T0* GE_new413(T1 initialize);
/* New instance of type KL_ARRAY [detachable STRING_8] */
extern T0* GE_new414(T1 initialize);
/* New instance of type SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
extern T0* GE_new415(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
extern T0* GE_new418(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
extern T0* GE_new419(T1 initialize);
/* New instance of type GEANT_GEC_COMMAND */
extern T0* GE_new420(T1 initialize);
/* New instance of type DS_CELL [PROCEDURE [ANY, TUPLE]] */
extern T0* GE_new421(T1 initialize);
/* New instance of type [attached] PROCEDURE [[attached] NONE, [attached] TUPLE] */
extern T0* GE_new422(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GEC_TASK] */
extern T0* GE_new423(T1 initialize);
/* New instance of type GEANT_ISE_COMMAND */
extern T0* GE_new424(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_ISE_TASK] */
extern T0* GE_new425(T1 initialize);
/* New instance of type GEANT_FILESET_ELEMENT */
extern T0* GE_new426(T1 initialize);
/* New instance of type GEANT_EXEC_COMMAND */
extern T0* GE_new427(T1 initialize);
/* New instance of type GEANT_STRING_PROPERTY */
extern T0* GE_new428(T1 initialize);
/* New instance of type [attached] FUNCTION [GEANT_INTERPRETING_ELEMENT, [attached] TUPLE, STRING_8] */
extern T0* GE_new429(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_INTERPRETING_ELEMENT, STRING_8] */
extern T0* GE_new430(T1 initialize);
/* New instance of type GEANT_BOOLEAN_PROPERTY */
extern T0* GE_new431(T1 initialize);
/* New instance of type GEANT_FILESET */
extern T0* GE_new432(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_EXEC_TASK] */
extern T0* GE_new433(T1 initialize);
/* New instance of type GEANT_LCC_COMMAND */
extern T0* GE_new434(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_LCC_TASK] */
extern T0* GE_new435(T1 initialize);
/* New instance of type GEANT_SET_COMMAND */
extern T0* GE_new436(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_SET_TASK] */
extern T0* GE_new437(T1 initialize);
/* New instance of type GEANT_UNSET_COMMAND */
extern T0* GE_new438(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_UNSET_TASK] */
extern T0* GE_new439(T1 initialize);
/* New instance of type GEANT_DEFINE_ELEMENT */
extern T0* GE_new440(T1 initialize);
/* New instance of type GEANT_GEXACE_COMMAND */
extern T0* GE_new441(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GEXACE_TASK] */
extern T0* GE_new442(T1 initialize);
/* New instance of type GEANT_GELEX_COMMAND */
extern T0* GE_new443(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GELEX_TASK] */
extern T0* GE_new444(T1 initialize);
/* New instance of type GEANT_GEYACC_COMMAND */
extern T0* GE_new445(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GEYACC_TASK] */
extern T0* GE_new446(T1 initialize);
/* New instance of type GEANT_GEPP_COMMAND */
extern T0* GE_new447(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GEPP_TASK] */
extern T0* GE_new448(T1 initialize);
/* New instance of type GEANT_GETEST_COMMAND */
extern T0* GE_new449(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GETEST_TASK] */
extern T0* GE_new450(T1 initialize);
/* New instance of type GEANT_GEANT_COMMAND */
extern T0* GE_new451(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_GEANT_TASK] */
extern T0* GE_new452(T1 initialize);
/* New instance of type GEANT_ECHO_COMMAND */
extern T0* GE_new453(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_ECHO_TASK] */
extern T0* GE_new454(T1 initialize);
/* New instance of type GEANT_MKDIR_COMMAND */
extern T0* GE_new455(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_MKDIR_TASK] */
extern T0* GE_new456(T1 initialize);
/* New instance of type GEANT_DIRECTORYSET_ELEMENT */
extern T0* GE_new457(T1 initialize);
/* New instance of type GEANT_DELETE_COMMAND */
extern T0* GE_new458(T1 initialize);
/* New instance of type GEANT_DIRECTORYSET */
extern T0* GE_new459(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_DELETE_TASK] */
extern T0* GE_new460(T1 initialize);
/* New instance of type GEANT_COPY_COMMAND */
extern T0* GE_new461(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_COPY_TASK] */
extern T0* GE_new462(T1 initialize);
/* New instance of type GEANT_MOVE_COMMAND */
extern T0* GE_new463(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_MOVE_TASK] */
extern T0* GE_new464(T1 initialize);
/* New instance of type GEANT_SETENV_COMMAND */
extern T0* GE_new465(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_SETENV_TASK] */
extern T0* GE_new466(T1 initialize);
/* New instance of type DS_PAIR [STRING_8, STRING_8] */
extern T0* GE_new467(T1 initialize);
/* New instance of type GEANT_XSLT_COMMAND */
extern T0* GE_new468(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]] */
extern T0* GE_new469(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_XSLT_TASK] */
extern T0* GE_new470(T1 initialize);
/* New instance of type GEANT_OUTOFDATE_COMMAND */
extern T0* GE_new471(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_OUTOFDATE_TASK] */
extern T0* GE_new472(T1 initialize);
/* New instance of type GEANT_EXIT_COMMAND */
extern T0* GE_new473(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_EXIT_TASK] */
extern T0* GE_new474(T1 initialize);
/* New instance of type GEANT_PRECURSOR_COMMAND */
extern T0* GE_new475(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_PRECURSOR_TASK] */
extern T0* GE_new476(T1 initialize);
/* New instance of type GEANT_AVAILABLE_COMMAND */
extern T0* GE_new477(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_AVAILABLE_TASK] */
extern T0* GE_new478(T1 initialize);
/* New instance of type GEANT_INPUT_COMMAND */
extern T0* GE_new479(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_INPUT_TASK] */
extern T0* GE_new480(T1 initialize);
/* New instance of type GEANT_REPLACE_COMMAND */
extern T0* GE_new481(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_REPLACE_TASK] */
extern T0* GE_new482(T1 initialize);
/* New instance of type SPECIAL [ARRAY [INTEGER_32]] */
extern T0* GE_new483(T6 a1, T1 initialize);
/* New instance of type SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
extern T0* GE_new484(T6 a1, T1 initialize);
/* New instance of type detachable DS_LINKABLE [CHARACTER_8] */
extern T0* GE_new485(T1 initialize);
/* New instance of type detachable KL_EQUALITY_TESTER [GEANT_RENAME] */
extern T0* GE_new486(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_RENAME] */
extern T0* GE_new488(T1 initialize);
/* New instance of type SPECIAL [GEANT_RENAME] */
extern T0* GE_new489(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8] */
extern T0* GE_new490(T1 initialize);
/* New instance of type detachable KL_EQUALITY_TESTER [GEANT_REDEFINE] */
extern T0* GE_new491(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_REDEFINE] */
extern T0* GE_new493(T1 initialize);
/* New instance of type SPECIAL [GEANT_REDEFINE] */
extern T0* GE_new494(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8] */
extern T0* GE_new495(T1 initialize);
/* New instance of type detachable KL_EQUALITY_TESTER [GEANT_SELECT] */
extern T0* GE_new496(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_SELECT] */
extern T0* GE_new498(T1 initialize);
/* New instance of type SPECIAL [GEANT_SELECT] */
extern T0* GE_new499(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8] */
extern T0* GE_new500(T1 initialize);
/* New instance of type detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
extern T0* GE_new501(T1 initialize);
/* New instance of type DS_HASH_SET [INTEGER_32] */
extern T0* GE_new508(T1 initialize);
/* New instance of type GEANT_MAP_ELEMENT */
extern T0* GE_new511(T1 initialize);
/* New instance of type GEANT_MAP */
extern T0* GE_new512(T1 initialize);
/* New instance of type DS_HASH_SET [GEANT_FILESET_ENTRY] */
extern T0* GE_new515(T1 initialize);
/* New instance of type DS_HASH_SET [STRING_8] */
extern T0* GE_new517(T1 initialize);
/* New instance of type LX_DFA_WILDCARD */
extern T0* GE_new519(T1 initialize);
/* New instance of type DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8]]] */
extern T0* GE_new521(T1 initialize);
/* New instance of type [attached] TUPLE [STRING_8] */
extern T0* GE_new522(T1 initialize);
/* New instance of type [attached] PROCEDURE [[attached] NONE, [attached] TUPLE [STRING_8]] */
extern T0* GE_new523(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_ECHO_COMMAND] */
extern T0* GE_new524(T1 initialize);
/* New instance of type DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]]] */
extern T0* GE_new526(T1 initialize);
/* New instance of type KL_TEXT_OUTPUT_FILE */
extern T0* GE_new527(T1 initialize);
/* New instance of type [attached] TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN] */
extern T0* GE_new528(T1 initialize);
/* New instance of type [attached] PROCEDURE [[attached] NONE, [attached] TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]] */
extern T0* GE_new529(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_MKDIR_COMMAND] */
extern T0* GE_new531(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]] */
extern T0* GE_new532(T1 initialize);
/* New instance of type SPECIAL [DS_PAIR [STRING_8, STRING_8]] */
extern T0* GE_new533(T6 a1, T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING_8, STRING_8]] */
extern T0* GE_new534(T1 initialize);
/* New instance of type DS_CELL [FUNCTION [ANY, TUPLE [STRING_8], BOOLEAN]] */
extern T0* GE_new535(T1 initialize);
/* New instance of type [attached] PREDICATE [[attached] NONE, [attached] TUPLE [STRING_8]] */
extern T0* GE_new536(T1 initialize);
/* New instance of type [attached] TUPLE [GEANT_AVAILABLE_COMMAND] */
extern T0* GE_new537(T1 initialize);
/* New instance of type DP_SHELL_COMMAND */
extern T0* GE_new539(T1 initialize);
/* New instance of type DS_CELL [BOOLEAN] */
extern T0* GE_new540(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [STRING_8] */
extern T0* GE_new542(T1 initialize);
/* New instance of type GEANT_FILESET_ENTRY */
extern T0* GE_new543(T1 initialize);
/* New instance of type KL_BOOLEAN_ROUTINES */
extern T0* GE_new544(T1 initialize);
/* New instance of type ARRAY [BOOLEAN] */
extern T0* GE_new545(T1 initialize);
/* New instance of type GEANT_VARIABLES_VARIABLE_RESOLVER */
extern T0* GE_new546(T1 initialize);
/* New instance of type RX_PCRE_REGULAR_EXPRESSION */
extern T0* GE_new547(T1 initialize);
/* New instance of type KL_STRING_EQUALITY_TESTER */
extern T0* GE_new548(T1 initialize);
/* New instance of type KL_STDIN_FILE */
extern T0* GE_new549(T1 initialize);
/* New instance of type ARRAY [GEANT_VARIABLES] */
extern T0* GE_new550(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [INTEGER_32] */
extern T0* GE_new551(T1 initialize);
/* New instance of type detachable KL_EQUALITY_TESTER [INTEGER_32] */
extern T0* GE_new552(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY] */
extern T0* GE_new553(T1 initialize);
/* New instance of type SPECIAL [GEANT_FILESET_ENTRY] */
extern T0* GE_new554(T6 a1, T1 initialize);
/* New instance of type detachable KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY] */
extern T0* GE_new555(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY] */
extern T0* GE_new556(T1 initialize);
/* New instance of type LX_WILDCARD_PARSER */
extern T0* GE_new558(T1 initialize);
/* New instance of type LX_DESCRIPTION */
extern T0* GE_new559(T1 initialize);
/* New instance of type LX_FULL_DFA */
extern T0* GE_new560(T1 initialize);
/* New instance of type KL_NULL_TEXT_OUTPUT_STREAM */
extern T0* GE_new562(T1 initialize);
/* New instance of type RX_BYTE_CODE */
extern T0* GE_new567(T1 initialize);
/* New instance of type RX_CHARACTER_SET */
extern T0* GE_new568(T1 initialize);
/* New instance of type RX_CASE_MAPPING */
extern T0* GE_new569(T1 initialize);
/* New instance of type ARRAY [RX_CHARACTER_SET] */
extern T0* GE_new571(T1 initialize);
/* New instance of type SPECIAL [RX_CHARACTER_SET] */
extern T0* GE_new572(T6 a1, T1 initialize);
/* New instance of type DS_ARRAYED_LIST [LX_RULE] */
extern T0* GE_new573(T1 initialize);
/* New instance of type LX_START_CONDITIONS */
extern T0* GE_new574(T1 initialize);
/* New instance of type LX_ACTION_FACTORY */
extern T0* GE_new575(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [INTEGER_32] */
extern T0* GE_new576(T1 initialize);
/* New instance of type LX_SYMBOL_CLASS */
extern T0* GE_new577(T1 initialize);
/* New instance of type DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8] */
extern T0* GE_new578(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS] */
extern T0* GE_new579(T1 initialize);
/* New instance of type SPECIAL [LX_SYMBOL_CLASS] */
extern T0* GE_new580(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_NFA] */
extern T0* GE_new581(T1 initialize);
/* New instance of type LX_NFA */
extern T0* GE_new582(T1 initialize);
/* New instance of type SPECIAL [LX_NFA] */
extern T0* GE_new583(T6 a1, T1 initialize);
/* New instance of type LX_EQUIVALENCE_CLASSES */
extern T0* GE_new584(T1 initialize);
/* New instance of type LX_RULE */
extern T0* GE_new585(T1 initialize);
/* New instance of type UT_SYNTAX_ERROR */
extern T0* GE_new586(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
extern T0* GE_new587(T1 initialize);
/* New instance of type LX_UNRECOGNIZED_RULE_ERROR */
extern T0* GE_new588(T1 initialize);
/* New instance of type LX_MISSING_QUOTE_ERROR */
extern T0* GE_new589(T1 initialize);
/* New instance of type LX_BAD_CHARACTER_CLASS_ERROR */
extern T0* GE_new590(T1 initialize);
/* New instance of type LX_BAD_CHARACTER_ERROR */
extern T0* GE_new591(T1 initialize);
/* New instance of type LX_FULL_AND_META_ERROR */
extern T0* GE_new592(T1 initialize);
/* New instance of type LX_FULL_AND_REJECT_ERROR */
extern T0* GE_new593(T1 initialize);
/* New instance of type LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR */
extern T0* GE_new594(T1 initialize);
/* New instance of type LX_CHARACTER_OUT_OF_RANGE_ERROR */
extern T0* GE_new595(T1 initialize);
/* New instance of type ARRAY [LX_RULE] */
extern T0* GE_new596(T1 initialize);
/* New instance of type SPECIAL [LX_RULE] */
extern T0* GE_new597(T6 a1, T1 initialize);
/* New instance of type LX_DFA_STATE */
extern T0* GE_new598(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [LX_NFA_STATE] */
extern T0* GE_new599(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [LX_DFA_STATE] */
extern T0* GE_new600(T1 initialize);
/* New instance of type LX_SYMBOL_PARTITIONS */
extern T0* GE_new601(T1 initialize);
/* New instance of type KL_ARRAY_ROUTINES [LX_RULE] */
extern T0* GE_new602(T1 initialize);
/* New instance of type LX_START_CONDITION */
extern T0* GE_new603(T1 initialize);
/* New instance of type LX_TRANSITION_TABLE [LX_DFA_STATE] */
extern T0* GE_new604(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [LX_NFA] */
extern T0* GE_new605(T1 initialize);
/* New instance of type DS_HASH_TABLE [LX_NFA, INTEGER_32] */
extern T0* GE_new606(T1 initialize);
/* New instance of type LX_NFA_STATE */
extern T0* GE_new607(T1 initialize);
/* New instance of type KL_BINARY_INPUT_FILE */
extern T0* GE_new608(T1 initialize);
/* New instance of type KL_BINARY_OUTPUT_FILE */
extern T0* GE_new609(T1 initialize);
/* New instance of type PATH */
extern T0* GE_new614(T1 initialize);
/* New instance of type RAW_FILE */
extern T0* GE_new615(T1 initialize);
/* New instance of type DIRECTORY */
extern T0* GE_new616(T1 initialize);
/* New instance of type ARRAYED_LIST [READABLE_STRING_32] */
extern T0* GE_new617(T1 initialize);
/* New instance of type [attached] TUPLE [ARRAYED_LIST [READABLE_STRING_32]] */
extern T0* GE_new618(T1 initialize);
/* New instance of type LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR */
extern T0* GE_new619(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_RULE] */
extern T0* GE_new620(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_RULE] */
extern T0* GE_new621(T1 initialize);
/* New instance of type SPECIAL [LX_START_CONDITION] */
extern T0* GE_new622(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_START_CONDITION] */
extern T0* GE_new623(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION] */
extern T0* GE_new624(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
extern T0* GE_new625(T1 initialize);
/* New instance of type LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE] */
extern T0* GE_new628(T1 initialize);
/* New instance of type LX_EPSILON_TRANSITION [LX_NFA_STATE] */
extern T0* GE_new630(T1 initialize);
/* New instance of type LX_SYMBOL_TRANSITION [LX_NFA_STATE] */
extern T0* GE_new632(T1 initialize);
/* New instance of type ARRAY [DS_BILINKABLE [INTEGER_32]] */
extern T0* GE_new633(T1 initialize);
/* New instance of type DS_BILINKABLE [INTEGER_32] */
extern T0* GE_new634(T1 initialize);
/* New instance of type SPECIAL [DS_BILINKABLE [INTEGER_32]] */
extern T0* GE_new635(T6 a1, T1 initialize);
/* New instance of type LX_ACTION */
extern T0* GE_new637(T1 initialize);
/* New instance of type DS_BUBBLE_SORTER [LX_NFA_STATE] */
extern T0* GE_new638(T1 initialize);
/* New instance of type DS_BUBBLE_SORTER [LX_RULE] */
extern T0* GE_new640(T1 initialize);
/* New instance of type SPECIAL [LX_NFA_STATE] */
extern T0* GE_new642(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_NFA_STATE] */
extern T0* GE_new644(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE] */
extern T0* GE_new645(T1 initialize);
/* New instance of type SPECIAL [LX_DFA_STATE] */
extern T0* GE_new647(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_DFA_STATE] */
extern T0* GE_new648(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE] */
extern T0* GE_new649(T1 initialize);
/* New instance of type KL_ARRAY [LX_RULE] */
extern T0* GE_new650(T1 initialize);
/* New instance of type ARRAY [detachable LX_DFA_STATE] */
extern T0* GE_new651(T1 initialize);
/* New instance of type KL_ARRAY_ROUTINES [detachable LX_DFA_STATE] */
extern T0* GE_new652(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_NFA] */
extern T0* GE_new653(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32] */
extern T0* GE_new655(T1 initialize);
/* New instance of type STRING_8_SEARCHER */
extern T0* GE_new656(T1 initialize);
/* New instance of type HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32] */
extern T0* GE_new657(T1 initialize);
/* New instance of type DS_SHELL_SORTER [INTEGER_32] */
extern T0* GE_new661(T1 initialize);
/* New instance of type KL_COMPARABLE_COMPARATOR [LX_RULE] */
extern T0* GE_new663(T1 initialize);
/* New instance of type KL_COMPARABLE_COMPARATOR [LX_NFA_STATE] */
extern T0* GE_new666(T1 initialize);
/* New instance of type ARRAYED_LIST [READABLE_STRING_GENERAL] */
extern T0* GE_new669(T1 initialize);
/* New instance of type [attached] TUPLE [ARRAYED_LIST [READABLE_STRING_GENERAL]] */
extern T0* GE_new670(T1 initialize);
/* New instance of type SPECIAL [READABLE_STRING_32] */
extern T0* GE_new671(T6 a1, T1 initialize);
/* New instance of type KL_COMPARABLE_COMPARATOR [INTEGER_32] */
extern T0* GE_new672(T1 initialize);
/* New instance of type SPECIAL [NATIVE_STRING] */
extern T0* GE_new675(T6 a1, T1 initialize);
/* New instance of type SPECIAL [READABLE_STRING_GENERAL] */
extern T0* GE_new676(T6 a1, T1 initialize);
/* GEANT.make */
extern T0* T22c20(GE_context* ac);
/* GEANT_PROJECT.build */
extern void T29f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT.build_target */
extern void T29f46(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].remove */
extern void T150f10(GE_context* ac, T0* C);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].keep_head */
extern void T242f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].set_count */
extern void T242f7(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].remove */
extern void T247f11(GE_context* ac, T0* C);
/* SPECIAL [GEANT_TARGET].keep_head */
extern void T167f8(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_TARGET].set_count */
extern void T167f10(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT.execute_target */
extern void T29f49(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3, T1 a4);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].remove */
extern void T151f10(GE_context* ac, T0* C);
/* SPECIAL [GEANT_VARIABLES].keep_head */
extern void T244f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_VARIABLES].set_count */
extern void T244f7(GE_context* ac, T0* C, T6 a1);
/* GEANT_TARGET.execute */
extern void T33f75(GE_context* ac, T0* C);
/* GEANT_TARGET.set_executed */
extern void T33f78(GE_context* ac, T0* C, T1 a1);
/* GEANT_TARGET.execute */
extern void T33f75p1(GE_context* ac, T0* C);
/* GEANT_TARGET.has_attribute */
extern T1 T33f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.execute_nested_tasks */
extern void T33f80(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].forth */
extern void T236f13(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].cursor_forth */
extern void T239f16(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].add_traversing_cursor */
extern void T239f19(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].set_next_cursor */
extern void T236f17(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].remove_traversing_cursor */
extern void T239f20(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].set */
extern void T236f15(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* GEANT_TARGET.execute_element */
extern void T33f82(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.obsolete_element_name */
extern unsigned char ge12os2874;
extern T0* ge12ov2874;
extern T0* T33f17(GE_context* ac, T0* C);
/* GEANT_TARGET.argument_element_name */
extern unsigned char ge12os2875;
extern T0* ge12ov2875;
extern T0* T33f15(GE_context* ac, T0* C);
/* GEANT_TARGET.description_element_name */
extern unsigned char ge78os2924;
extern T0* ge78ov2924;
extern T0* T33f22(GE_context* ac, T0* C);
/* GEANT_TARGET.execute_task */
extern void T33f83(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT.new_task */
extern T0* T29f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_task */
extern T0* T248f54(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].item */
extern T0* T331f33(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].item_storage_item */
extern T0* T331f30(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].search_position */
extern void T331f38(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].hash_position */
extern T6 T331f28(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.hash_code */
extern T6 T265f18(GE_context* ac, T0* C);
/* UC_UTF8_STRING.string */
extern T0* T265f7(GE_context* ac, T0* C);
/* KL_INTEGER_ROUTINES.to_character */
extern T2 T267f2(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.integer_ */
extern unsigned char ge126os5129;
extern T0* ge126ov5129;
extern T0* T265f27(GE_context* ac, T0* C);
/* KL_INTEGER_ROUTINES.default_create */
extern T0* T267c4(GE_context* ac);
/* STRING_8.append_character */
extern void T17f37(GE_context* ac, T0* C, T2 a1);
/* STRING_8.resize */
extern void T17f39(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].aliased_resized_area_with_default */
extern T0* T15f3(GE_context* ac, T0* C, T2 a1, T6 a2);
/* SPECIAL [CHARACTER_8].fill_with */
extern void T15f14(GE_context* ac, T0* C, T2 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].extend */
extern void T15f18(GE_context* ac, T0* C, T2 a1);
/* INTEGER_32.min */
extern T6 T6f11(GE_context* ac, T6* C, T6 a1);
/* SPECIAL [CHARACTER_8].aliased_resized_area */
extern T0* T15f4(GE_context* ac, T0* C, T6 a1);
/* STRING_8.additional_space */
extern T6 T17f6(GE_context* ac, T0* C);
/* INTEGER_32.max */
extern T6 T6f5(GE_context* ac, T6* C, T6 a1);
/* INTEGER_32.is_greater_equal */
extern T1 T6f8(GE_context* ac, T6* C, T6 a1);
/* STRING_8.capacity */
extern T6 T17f5(GE_context* ac, T0* C);
/* UC_UTF8_STRING.byte_item */
extern T2 T265f24(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.old_item */
extern T2 T265f40(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.set_count */
extern void T265f71(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.reset_byte_index_cache */
extern void T265f78(GE_context* ac, T0* C);
/* STRING_8.make */
extern void T17f36(GE_context* ac, T0* C, T6 a1);
/* STRING_8.make */
extern T0* T17c36(GE_context* ac, T6 a1);
/* SPECIAL [CHARACTER_8].make_filled */
extern T0* T15c11(GE_context* ac, T2 a1, T6 a2);
/* SPECIAL [CHARACTER_8].make_empty */
extern void T15f15(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].make_empty */
extern T0* T15c15(GE_context* ac, T6 a1);
/* UC_UTF8_STRING.next_byte_index */
extern T6 T265f28(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_ROUTINES.encoded_byte_count */
extern T6 T264f3(GE_context* ac, T0* C, T2 a1);
/* CHARACTER_8.is_less_equal */
extern T1 T2f20(GE_context* ac, T2* C, T2 a1);
/* CHARACTER_8.is_less */
extern T1 T2f6(GE_context* ac, T2* C, T2 a1);
/* CHARACTER_8.natural_32_code */
extern T10 T2f7(GE_context* ac, T2* C);
/* INTEGER_32.to_natural_32 */
extern T10 T6f17(GE_context* ac, T6* C);
/* UC_UTF8_STRING.utf8 */
extern unsigned char ge220os6151;
extern T0* ge220ov6151;
extern T0* T265f29(GE_context* ac, T0* C);
/* UC_UTF8_ROUTINES.default_create */
extern T0* T264c36(GE_context* ac);
/* KL_PLATFORM.maximum_character_code */
extern unsigned char ge201os8462;
extern T6 ge201ov8462;
extern T6 T268f1(GE_context* ac, T0* C);
/* UC_UTF8_STRING.platform */
extern unsigned char ge208os3895;
extern T0* ge208ov3895;
extern T0* T265f26(GE_context* ac, T0* C);
/* KL_PLATFORM.default_create */
extern T0* T268c3(GE_context* ac);
/* UC_UTF8_STRING.item_code_at_byte_index */
extern T6 T265f25(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_ROUTINES.encoded_next_value */
extern T6 T264f6(GE_context* ac, T0* C, T2 a1);
/* UC_UTF8_ROUTINES.encoded_first_value */
extern T6 T264f4(GE_context* ac, T0* C, T2 a1);
/* UC_UTF8_STRING.hash_code */
extern T6 T265f18p1(GE_context* ac, T0* C);
/* STRING_8.hash_code */
extern T6 T17f8(GE_context* ac, T0* C);
/* UC_STRING_EQUALITY_TESTER.test */
extern T1 T101f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* UC_STRING_EQUALITY_TESTER.string_ */
extern unsigned char ge128os1973;
extern T0* ge128ov1973;
extern T0* T101f2(GE_context* ac, T0* C);
/* KL_STRING_ROUTINES.default_create */
extern T0* T115c19(GE_context* ac);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].key_storage_item */
extern T0* T331f22(GE_context* ac, T0* C, T6 a1);
/* INTEGER_32.is_less_equal */
extern T1 T6f10(GE_context* ac, T6* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].clashes_item */
extern T6 T331f27(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].slots_item */
extern T6 T331f29(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].has */
extern T1 T331f23(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.set_name */
extern void T144f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.set_attribute_name */
extern unsigned char ge12os2877;
extern T0* ge12ov2877;
extern T0* T33f51(GE_context* ac, T0* C);
/* XM_ELEMENT.cloned_object */
extern T0* T144f20(GE_context* ac, T0* C);
/* XM_ELEMENT.twin */
extern T0* T144f22(GE_context* ac, T0* C);
/* XM_ELEMENT.copy */
extern void T144f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_NAME_VALUE_ELEMENT.has_value */
extern T1 T314f4(GE_context* ac, T0* C);
/* GEANT_NAME_VALUE_ELEMENT.has_attribute */
extern T1 T314f3(GE_context* ac, T0* C, T0* a1);
/* GEANT_NAME_VALUE_ELEMENT.value_attribute_name */
extern unsigned char ge90os8271;
extern T0* ge90ov8271;
extern T0* T314f2(GE_context* ac, T0* C);
/* GEANT_NAME_VALUE_ELEMENT.make */
extern T0* T314c5(GE_context* ac, T0* a1);
/* GEANT_NAME_VALUE_ELEMENT.set_xml_element */
extern void T314f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.global_element_name */
extern unsigned char ge4os2897;
extern T0* ge4ov2897;
extern T0* T33f21(GE_context* ac, T0* C);
/* GEANT_TARGET.local_element_name */
extern unsigned char ge4os2898;
extern T0* ge4ov2898;
extern T0* T33f19(GE_context* ac, T0* C);
/* GEANT_TARGET.execute_group_element */
extern void T33f81(GE_context* ac, T0* C, T0* a1);
/* GEANT_GROUP.execute */
extern void T258f26(GE_context* ac, T0* C);
/* GEANT_GROUP.has_attribute */
extern T1 T258f18(GE_context* ac, T0* C, T0* a1);
/* GEANT_GROUP.execute_nested_tasks */
extern void T258f32(GE_context* ac, T0* C);
/* GEANT_GROUP.execute_element */
extern void T258f37(GE_context* ac, T0* C, T0* a1);
/* GEANT_GROUP.execute_task */
extern void T258f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_GROUP.description_element_name */
extern T0* T258f13(GE_context* ac, T0* C);
/* GEANT_GROUP.global_element_name */
extern T0* T258f20(GE_context* ac, T0* C);
/* GEANT_GROUP.local_element_name */
extern T0* T258f19(GE_context* ac, T0* C);
/* GEANT_GROUP.execute_group_element */
extern void T258f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_GROUP.group_element_name */
extern unsigned char ge4os2896;
extern T0* ge4ov2896;
extern T0* T258f17(GE_context* ac, T0* C);
/* GEANT_GROUP.string_ */
extern T0* T258f16(GE_context* ac, T0* C);
/* GEANT_GROUP.prepare_variables_before_execution */
extern void T258f31(GE_context* ac, T0* C);
/* GEANT_GROUP.exit_application */
extern void T258f30(GE_context* ac, T0* C, T6 a1, T0* a2);
/* KL_EXCEPTIONS.die */
extern void T55f2(GE_context* ac, T0* C, T6 a1);
/* GEANT_GROUP.exceptions */
extern unsigned char ge204os1975;
extern T0* ge204ov1975;
extern T0* T258f15(GE_context* ac, T0* C);
/* KL_EXCEPTIONS.default_create */
extern T0* T55c1(GE_context* ac);
/* KL_STDERR_FILE.put_line */
extern void T54f7(GE_context* ac, T0* C, T0* a1);
/* KL_STDERR_FILE.put_string */
extern void T54f8(GE_context* ac, T0* C, T0* a1);
/* CONSOLE.put_string */
extern void T176f18(GE_context* ac, T0* C, T0* a1);
/* CONSOLE.console_ps */
extern void T176f24(GE_context* ac, T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STDERR_FILE.console */
extern unsigned char ge169os3424;
extern T0* ge169ov3424;
extern T0* T54f3(GE_context* ac, T0* C);
/* STD_FILES.error */
extern unsigned char ge2369os5201;
extern T0* ge2369ov5201;
extern T0* T124f3(GE_context* ac, T0* C);
/* CONSOLE.make_open_stderr */
extern T0* T176c16(GE_context* ac, T0* a1);
/* CONSOLE.set_write_mode */
extern void T176f23(GE_context* ac, T0* C);
/* CONSOLE.console_def */
extern T14 T176f12(GE_context* ac, T0* C, T6 a1);
/* CONSOLE.make_with_name */
extern void T176f22(GE_context* ac, T0* C, T0* a1);
/* STRING_8.make_empty */
extern T0* T17c40(GE_context* ac);
/* CONSOLE.default_pointer */
extern T14 T176f9(GE_context* ac, T0* C);
/* CONSOLE.set_name */
extern void T176f27(GE_context* ac, T0* C, T0* a1);
/* FILE_INFO.file_name_to_pointer */
extern T0* T133f13(GE_context* ac, T0* C, T0* a1, T0* a2);
extern T1 T133f13ot1(T0* a1);
extern T1 T133f13ot2(T0* a1);
/* C_STRING.set_string */
extern void T127f10(GE_context* ac, T0* C, T0* a1);
/* C_STRING.set_substring */
extern void T127f11(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* MANAGED_POINTER.put_natural_8 */
extern void T128f12(GE_context* ac, T0* C, T8 a1, T6 a2);
/* POINTER.memory_copy */
extern void T14f13(GE_context* ac, T14* C, T14 a1, T6 a2);
/* POINTER.c_memcpy */
extern void T14f17(GE_context* ac, T14* C, T14 a1, T14 a2, T6 a3);
/* NATURAL_32.to_natural_8 */
extern T8 T10f4(GE_context* ac, T10* C);
/* C_STRING.make_shared_from_pointer_and_count */
extern void T127f12(GE_context* ac, T0* C, T14 a1, T6 a2);
/* C_STRING.make_shared_from_pointer_and_count */
extern T0* T127c12(GE_context* ac, T14 a1, T6 a2);
/* MANAGED_POINTER.share_from_pointer */
extern T0* T128c15(GE_context* ac, T14 a1, T6 a2);
/* MANAGED_POINTER.increment_counter */
extern void T128f13(GE_context* ac, T0* C);
/* UTF_CONVERTER.escaped_utf_32_substring_into_utf_8_0_pointer */
extern void T125f13(GE_context* ac, T125* C, T0* a1, T6 a2, T6 a3, T0* a4, T6 a5, T0* a6);
/* CELL [INTEGER_32].put */
extern void T126f2(GE_context* ac, T0* C, T6 a1);
/* CELL [INTEGER_32].put */
extern T0* T126c2(GE_context* ac, T6 a1);
/* NATURAL_32.is_less_equal */
extern T1 T10f2(GE_context* ac, T10* C, T10 a1);
/* UTF_CONVERTER.to_natural_32 */
extern T10 T125f5(GE_context* ac, T125* C, T0* a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.parsed_natural_32 */
extern T10 T324f12(GE_context* ac, T0* C);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.parse_string_with_type */
extern void T324f19(GE_context* ac, T0* C, T0* a1, T6 a2);
extern T1 T324f19ot1(T0* a1, T0** a2);
extern T1 T324f19ot2(T0* a1, T0** a2);
/* NATURAL_32.is_valid_character_8_code */
extern T1 T10f13(GE_context* ac, T10* C);
/* CHARACTER_32.is_character_8 */
extern T1 T3f3(GE_context* ac, T3* C);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.parse_character */
extern void T324f22(GE_context* ac, T0* C, T2 a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.overflowed */
extern T1 T324f16(GE_context* ac, T0* C);
/* INTEGER_OVERFLOW_CHECKER.will_overflow */
extern T1 T273f7(GE_context* ac, T0* C, T11 a1, T11 a2, T6 a3, T6 a4);
/* NATURAL_64.is_greater */
extern T1 T11f6(GE_context* ac, T11* C, T11 a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.overflow_checker */
extern unsigned char ge2410os8760;
extern T0* ge2410ov8760;
extern T0* T324f15(GE_context* ac, T0* C);
/* INTEGER_OVERFLOW_CHECKER.make */
extern T0* T273c13(GE_context* ac);
/* NATURAL_64.to_natural_64 */
extern T11 T11f9(GE_context* ac, T11* C);
/* NATURAL_32.to_natural_64 */
extern T11 T10f23(GE_context* ac, T10* C);
/* NATURAL_16.to_natural_64 */
extern T11 T9f7(GE_context* ac, T9* C);
/* NATURAL_8.to_natural_64 */
extern T11 T8f14(GE_context* ac, T8* C);
/* INTEGER_64.to_natural_64 */
extern T11 T7f3(GE_context* ac, T7* C);
/* INTEGER_16.to_natural_64 */
extern T11 T5f3(GE_context* ac, T5* C);
/* INTEGER_8.to_natural_64 */
extern T11 T4f3(GE_context* ac, T4* C);
/* SPECIAL [NATURAL_64].extend */
extern void T393f5(GE_context* ac, T0* C, T11 a1);
/* SPECIAL [NATURAL_64].make_empty */
extern T0* T393c4(GE_context* ac, T6 a1);
/* STRING_8.has */
extern T1 T17f29(GE_context* ac, T0* C, T2 a1);
/* STRING_8.area_lower */
extern T6 T17f7(GE_context* ac, T0* C);
/* INTEGER_32.to_natural_64 */
extern T11 T6f25(GE_context* ac, T6* C);
/* CHARACTER_8.is_greater_equal */
extern T1 T2f5(GE_context* ac, T2* C, T2 a1);
/* CHARACTER_8.is_hexa_digit */
extern T1 T2f22(GE_context* ac, T2* C);
/* NATURAL_8.is_greater */
extern T1 T8f3(GE_context* ac, T8* C, T8 a1);
/* CHARACTER_8.character_types */
extern T8 T2f10(GE_context* ac, T2* C, T6 a1);
/* CHARACTER_8.internal_character_types */
extern unsigned char ge2307os93;
extern T0* ge2307ov93;
extern T0* T2f12(GE_context* ac, T2* C);
/* SPECIAL [NATURAL_8].fill_with */
extern void T179f6(GE_context* ac, T0* C, T8 a1, T6 a2, T6 a3);
/* SPECIAL [NATURAL_8].extend */
extern void T179f8(GE_context* ac, T0* C, T8 a1);
/* SPECIAL [NATURAL_8].make_empty */
extern void T179f5(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [NATURAL_8].make_empty */
extern T0* T179c5(GE_context* ac, T6 a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.reset */
extern void T324f18(GE_context* ac, T0* C, T6 a1);
/* UTF_CONVERTER.ctoi_convertor */
extern unsigned char ge2380os5343;
extern T0* ge2380ov5343;
extern T0* T125f8(GE_context* ac, T125* C);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.set_trailing_separators_acceptable */
extern void T324f21(GE_context* ac, T0* C, T1 a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.set_leading_separators_acceptable */
extern void T324f20(GE_context* ac, T0* C, T1 a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.make */
extern T0* T324c17(GE_context* ac);
/* STRING_8.make_from_string */
extern T0* T17c45(GE_context* ac, T0* a1);
/* SPECIAL [CHARACTER_8].copy_data */
extern void T15f13(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [CHARACTER_8].force */
extern void T15f17(GE_context* ac, T0* C, T2 a1, T6 a2);
/* SPECIAL [CHARACTER_8].move_data */
extern void T15f16(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].overlapping_move */
extern void T15f20(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].non_overlapping_move */
extern void T15f19(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* UTF_CONVERTER.is_hexa_decimal */
extern T1 T125f4(GE_context* ac, T125* C, T0* a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.is_integral_integer */
extern T1 T324f14(GE_context* ac, T0* C);
/* UTF_CONVERTER.utf_8_bytes_count */
extern T6 T125f1(GE_context* ac, T125* C, T0* a1, T6 a2, T6 a3);
/* FILE_INFO.multi_byte_to_utf_16 */
extern T6 T133f9(GE_context* ac, T0* C, T14 a1, T14 a2, T6 a3);
/* FILE_INFO.default_pointer */
extern T14 T133f8(GE_context* ac, T0* C);
/* C_STRING.item */
extern T14 T127f3(GE_context* ac, T0* C);
/* C_STRING.make */
extern T0* T127c9(GE_context* ac, T0* a1);
/* C_STRING.make_empty */
extern void T127f7(GE_context* ac, T0* C, T6 a1);
/* C_STRING.make_empty */
extern T0* T127c7(GE_context* ac, T6 a1);
/* UTF_CONVERTER.escaped_utf_32_substring_into_utf_16_0_pointer */
extern void T125f12(GE_context* ac, T125* C, T0* a1, T6 a2, T6 a3, T0* a4, T6 a5, T0* a6);
/* MANAGED_POINTER.put_natural_16 */
extern void T128f14(GE_context* ac, T0* C, T9 a1, T6 a2);
/* NATURAL_32.to_natural_16 */
extern T9 T10f11(GE_context* ac, T10* C);
/* NATURAL_32.is_greater */
extern T1 T10f10(GE_context* ac, T10* C, T10 a1);
/* UTF_CONVERTER.utf_16_bytes_count */
extern T6 T125f2(GE_context* ac, T125* C, T0* a1, T6 a2, T6 a3);
/* MANAGED_POINTER.resize */
extern void T128f11(GE_context* ac, T0* C, T6 a1);
/* POINTER.memory_set */
extern void T14f12(GE_context* ac, T14* C, T6 a1, T6 a2);
/* POINTER.c_memset */
extern void T14f16(GE_context* ac, T14* C, T14 a1, T6 a2, T6 a3);
/* EXCEPTIONS.raise */
extern void T177f2(GE_context* ac, T0* C, T0* a1);
/* DEVELOPER_EXCEPTION.raise */
extern void T87f16(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.raise */
extern void T19f17(GE_context* ac, T0* C, T0* a1);
/* DEVELOPER_EXCEPTION.code */
extern T6 T87f8(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.default_pointer */
extern T14 T19f12(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.set_last_exception */
extern void T19f16(GE_context* ac, T0* C, T0* a1);
/* CELL [detachable EXCEPTION].put */
extern void T25f2(GE_context* ac, T0* C, T0* a1);
/* CELL [detachable EXCEPTION].put */
extern T0* T25c2(GE_context* ac, T0* a1);
/* ISE_EXCEPTION_MANAGER.last_exception_cell */
extern unsigned char ge2586os1921;
extern T0* ge2586ov1921;
extern T0* T19f5(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.last_exception */
extern T0* T19f8(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.in_rescue */
extern T1 T19f11(GE_context* ac, T0* C);
/* DEVELOPER_EXCEPTION.is_ignored */
extern T1 T87f7(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.is_ignored */
extern T1 T19f13(GE_context* ac, T0* C, T0* a1);
/* HASH_TABLE [INTEGER_32, INTEGER_32].has */
extern T1 T23f34(GE_context* ac, T0* C, T6 a1);
/* HASH_TABLE [INTEGER_32, INTEGER_32].same_keys */
extern T1 T23f26(GE_context* ac, T0* C, T6 a1, T6 a2);
/* HASH_TABLE [INTEGER_32, INTEGER_32].hash_code_of */
extern T6 T23f25(GE_context* ac, T0* C, T6 a1);
/* INTEGER_32.hash_code */
extern T6 T6f12(GE_context* ac, T6* C);
/* ISE_EXCEPTION_MANAGER.ignored_exceptions */
extern unsigned char ge2586os1916;
extern T0* ge2586ov1916;
extern T0* T19f1(GE_context* ac, T0* C);
/* HASH_TABLE [INTEGER_32, INTEGER_32].make */
extern T0* T23c35(GE_context* ac, T6 a1);
/* SPECIAL [INTEGER_32].make_filled */
extern T0* T95c7(GE_context* ac, T6 a1, T6 a2);
/* SPECIAL [INTEGER_32].fill_with */
extern void T95f10(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].extend */
extern void T95f11(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [BOOLEAN].make_filled */
extern T0* T96c6(GE_context* ac, T1 a1, T6 a2);
/* SPECIAL [BOOLEAN].fill_with */
extern void T96f9(GE_context* ac, T0* C, T1 a1, T6 a2, T6 a3);
/* SPECIAL [BOOLEAN].extend */
extern void T96f11(GE_context* ac, T0* C, T1 a1);
/* SPECIAL [BOOLEAN].make_empty */
extern void T96f8(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [BOOLEAN].make_empty */
extern T0* T96c8(GE_context* ac, T6 a1);
/* SPECIAL [INTEGER_32].make_empty */
extern void T95f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [INTEGER_32].make_empty */
extern T0* T95c6(GE_context* ac, T6 a1);
/* PRIMES.higher_prime */
extern T6 T94f1(GE_context* ac, T0* C, T6 a1);
/* PRIMES.is_prime */
extern T1 T94f3(GE_context* ac, T0* C, T6 a1);
/* PRIMES.default_create */
extern T0* T94c5(GE_context* ac);
/* DEVELOPER_EXCEPTION.generating_type */
extern T0* T87f9(GE_context* ac, T0* C);
/* DEVELOPER_EXCEPTION.exception_manager */
extern T0* T87f6(GE_context* ac, T0* C);
/* DEVELOPER_EXCEPTION.default_create */
extern T0* T87c10(GE_context* ac);
/* EXCEPTIONS.default_create */
extern T0* T177c1(GE_context* ac);
/* MANAGED_POINTER.default_pointer */
extern T14 T128f4(GE_context* ac, T0* C);
/* POINTER.memory_realloc */
extern T14 T14f2(GE_context* ac, T14* C, T6 a1);
/* POINTER.c_realloc */
extern T14 T14f7(GE_context* ac, T14* C, T14 a1, T6 a2);
/* MANAGED_POINTER.make */
extern T0* T128c9(GE_context* ac, T6 a1);
/* POINTER.memory_calloc */
extern T14 T14f6(GE_context* ac, T14* C, T6 a1, T6 a2);
/* POINTER.c_calloc */
extern T14 T14f5(GE_context* ac, T14* C, T6 a1, T6 a2);
/* PLATFORM.is_windows */
extern T1 T181s1(GE_context* ac);
/* CONSOLE.buffered_file_info */
extern unsigned char ge2317os4164;
extern T0* ge2317ov4164;
extern T0* T176f10(GE_context* ac, T0* C);
/* FILE_INFO.make */
extern T0* T133c22(GE_context* ac);
/* FILE_INFO.make_filled_area */
extern void T133f24(GE_context* ac, T0* C, T8 a1, T6 a2);
/* SPECIAL [NATURAL_8].make_filled */
extern T0* T179c4(GE_context* ac, T8 a1, T6 a2);
/* FILE_INFO.stat_size */
extern T6 T133f11(GE_context* ac, T0* C);
/* KL_STDERR_FILE.io */
extern unsigned char ge2297os44;
extern T0* ge2297ov44;
extern T0* T54f4(GE_context* ac, T0* C);
/* STD_FILES.set_output_default */
extern void T124f6(GE_context* ac, T0* C);
/* STD_FILES.output */
extern unsigned char ge2369os5200;
extern T0* ge2369ov5200;
extern T0* T124f2(GE_context* ac, T0* C);
/* CONSOLE.make_open_stdout */
extern T0* T176c20(GE_context* ac, T0* a1);
/* STD_FILES.default_create */
extern T0* T124c5(GE_context* ac);
/* KL_STRING_ROUTINES.as_string */
extern T0* T115f2(GE_context* ac, T0* C, T0* a1);
/* STRING_8.string */
extern T0* T17f15(GE_context* ac, T0* C);
/* UC_UTF8_STRING.as_string */
extern T0* T265f42(GE_context* ac, T0* C);
/* UC_UTF8_STRING.to_utf8 */
extern T0* T265f22(GE_context* ac, T0* C);
/* KL_ANY_ROUTINES.same_types */
extern T1 T130f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.any_ */
extern unsigned char ge121os2544;
extern T0* ge121ov2544;
extern T0* T115f8(GE_context* ac, T0* C);
/* KL_ANY_ROUTINES.default_create */
extern T0* T130c2(GE_context* ac);
/* KL_STDERR_FILE.string_ */
extern T0* T54f2(GE_context* ac, T0* C);
/* KL_STDERR_FILE.put_new_line */
extern void T54f6(GE_context* ac, T0* C);
/* KL_STANDARD_FILES.error */
extern unsigned char ge168os3416;
extern T0* ge168ov3416;
extern T0* T53f1(GE_context* ac, T0* C);
/* KL_STDERR_FILE.make */
extern T0* T54c5(GE_context* ac);
/* GEANT_GROUP.std */
extern unsigned char ge166os1976;
extern T0* ge166ov1976;
extern T0* T258f14(GE_context* ac, T0* C);
/* KL_STANDARD_FILES.default_create */
extern T0* T53c3(GE_context* ac);
/* GEANT_GROUP.log_messages */
extern void T258f35(GE_context* ac, T0* C, T0* a1);
/* ARRAY [STRING_8].item */
extern T0* T39f4(GE_context* ac, T0* C, T6 a1);
/* GEANT_GROUP.associated_target */
extern T0* T258f12(GE_context* ac, T0* C);
/* GEANT_GROUP.file_system */
extern unsigned char ge165os1977;
extern T0* ge165ov1977;
extern T0* T258f11(GE_context* ac, T0* C);
/* GEANT_GROUP.unix_file_system */
extern unsigned char ge165os1980;
extern T0* ge165ov1980;
extern T0* T258f23(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.make */
extern T0* T93c33(GE_context* ac);
/* KL_OPERATING_SYSTEM.is_unix */
extern unsigned char ge199os3704;
extern T1 ge199ov3704;
extern T1 T90f2(GE_context* ac, T0* C);
/* STRING_8.item */
extern T2 T17f10(GE_context* ac, T0* C, T6 a1);
/* KL_OPERATING_SYSTEM.current_working_directory */
extern T0* T90f4(GE_context* ac, T0* C);
/* EXECUTION_ENVIRONMENT.current_working_directory */
extern T0* T129f2(GE_context* ac, T0* C);
/* FILE_INFO.pointer_to_file_name_8 */
extern T0* T133f14(GE_context* ac, T0* C, T14 a1);
/* C_STRING.string */
extern T0* T127f5(GE_context* ac, T0* C);
/* C_STRING.c_strlen */
extern T6 T127f6(GE_context* ac, T0* C, T14 a1);
/* C_STRING.make_shared_from_pointer */
extern T0* T127c13(GE_context* ac, T14 a1);
/* C_STRING.substring */
extern T0* T127f4(GE_context* ac, T0* C, T6 a1, T6 a2);
/* C_STRING.read_substring_into */
extern void T127f14(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* STRING_8.put_code */
extern void T17f44(GE_context* ac, T0* C, T10 a1, T6 a2);
/* NATURAL_8.to_natural_32 */
extern T10 T8f18(GE_context* ac, T8* C);
/* MANAGED_POINTER.read_natural_8 */
extern T8 T128f6(GE_context* ac, T0* C, T6 a1);
/* TYPED_POINTER [NATURAL_8].memory_copy */
extern void T178f2(GE_context* ac, T178* C, T14 a1, T6 a2);
/* TYPED_POINTER [NATURAL_8].c_memcpy */
extern void T178f3(GE_context* ac, T178* C, T14 a1, T14 a2, T6 a3);
/* STRING_8.set_count */
extern void T17f43(GE_context* ac, T0* C, T6 a1);
/* FILE_INFO.utf_16_to_multi_byte */
extern T6 T133f10(GE_context* ac, T0* C, T14 a1, T14 a2, T6 a3);
/* EXECUTION_ENVIRONMENT.file_info */
extern unsigned char ge2549os5544;
extern T0* ge2549ov5544;
extern T0* T129f5(GE_context* ac, T0* C);
/* EXECUTION_ENVIRONMENT.eif_dir_current */
extern T6 T129f4(GE_context* ac, T0* C, T14 a1, T6 a2);
/* KL_OPERATING_SYSTEM.execution_environment */
extern unsigned char ge199os3708;
extern T0* ge199ov3708;
extern T0* T90f5(GE_context* ac, T0* C);
/* EXECUTION_ENVIRONMENT.default_create */
extern T0* T129c11(GE_context* ac);
/* STRING_8.is_equal */
extern T1 T17f31(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].same_items */
extern T1 T15f6(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* KL_OPERATING_SYSTEM.variable_value */
extern T0* T90f3(GE_context* ac, T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.get */
extern T0* T129f7(GE_context* ac, T0* C, T0* a1);
/* STRING_32.as_string_8 */
extern T0* T18f4(GE_context* ac, T0* C);
/* STRING_8.valid_code */
extern T1 T17f24(GE_context* ac, T0* C, T10 a1);
/* EXECUTION_ENVIRONMENT.item */
extern T0* T129f3(GE_context* ac, T0* C, T0* a1);
/* NATIVE_STRING.string */
extern T0* T174f3(GE_context* ac, T0* C);
/* UTF_CONVERTER.utf_8_0_pointer_to_escaped_string_32 */
extern T0* T125f7(GE_context* ac, T125* C, T0* a1);
/* UTF_CONVERTER.utf_8_0_pointer_into_escaped_string_32 */
extern void T125f15(GE_context* ac, T125* C, T0* a1, T0* a2);
/* UTF_CONVERTER.utf_8_0_subpointer_into_escaped_string_32 */
extern void T125f17(GE_context* ac, T125* C, T0* a1, T6 a2, T6 a3, T1 a4, T0* a5);
/* UTF_CONVERTER.escape_code_into */
extern void T125f18(GE_context* ac, T125* C, T0* a1, T9 a2);
/* NATURAL_16.to_hex_string */
extern T0* T9f4(GE_context* ac, T9* C);
/* STRING_8.put */
extern void T17f52(GE_context* ac, T0* C, T2 a1, T6 a2);
/* INTEGER_32.to_hex_character */
extern T2 T6f21(GE_context* ac, T6* C);
/* NATURAL_16.to_integer_32 */
extern T6 T9f12(GE_context* ac, T9* C);
/* STRING_8.fill_blank */
extern void T17f51(GE_context* ac, T0* C);
/* STRING_8.fill_character */
extern void T17f53(GE_context* ac, T0* C, T2 a1);
/* PLATFORM.default_create */
extern T0* T181c4(GE_context* ac);
/* STRING_32.append_string_general */
extern void T18f17(GE_context* ac, T0* C, T0* a1);
/* STRING_32.append */
extern void T18f17p1(GE_context* ac, T0* C, T0* a1);
/* STRING_32.set_count */
extern void T18f21(GE_context* ac, T0* C, T6 a1);
/* STRING_32.append_code */
extern void T18f20(GE_context* ac, T0* C, T10 a1);
/* STRING_32.put_code */
extern void T18f22(GE_context* ac, T0* C, T10 a1, T6 a2);
/* STRING_32.resize */
extern void T18f18(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [CHARACTER_32].aliased_resized_area_with_default */
extern T0* T16f4(GE_context* ac, T0* C, T3 a1, T6 a2);
/* SPECIAL [CHARACTER_32].fill_with */
extern void T16f12(GE_context* ac, T0* C, T3 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_32].extend */
extern void T16f16(GE_context* ac, T0* C, T3 a1);
/* SPECIAL [CHARACTER_32].aliased_resized_area */
extern T0* T16f5(GE_context* ac, T0* C, T6 a1);
/* STRING_32.capacity */
extern T6 T18f7(GE_context* ac, T0* C);
/* STRING_32.append */
extern void T18f19(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [CHARACTER_32].copy_data */
extern void T16f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [CHARACTER_32].force */
extern void T16f11(GE_context* ac, T0* C, T3 a1, T6 a2);
/* SPECIAL [CHARACTER_32].move_data */
extern void T16f10(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_32].overlapping_move */
extern void T16f14(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_32].non_overlapping_move */
extern void T16f13(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_32.additional_space */
extern T6 T18f8(GE_context* ac, T0* C);
/* NATURAL_8.to_hex_string */
extern T0* T8f12(GE_context* ac, T8* C);
/* NATURAL_8.to_integer_32 */
extern T6 T8f7(GE_context* ac, T8* C);
/* NATURAL_16.is_less_equal */
extern T1 T9f2(GE_context* ac, T9* C, T9 a1);
/* STRING_32.append_character */
extern void T18f16(GE_context* ac, T0* C, T3 a1);
/* NATURAL_8.to_natural_16 */
extern T9 T8f10(GE_context* ac, T8* C);
/* STRING_32.extend */
extern void T18f15(GE_context* ac, T0* C, T3 a1);
/* NATURAL_8.is_less_equal */
extern T1 T8f8(GE_context* ac, T8* C, T8 a1);
/* STRING_32.grow */
extern void T18f14(GE_context* ac, T0* C, T6 a1);
/* STRING_32.make */
extern void T18f13(GE_context* ac, T0* C, T6 a1);
/* STRING_32.make */
extern T0* T18c13(GE_context* ac, T6 a1);
/* SPECIAL [CHARACTER_32].make_filled */
extern T0* T16c9(GE_context* ac, T3 a1, T6 a2);
/* SPECIAL [CHARACTER_32].make_empty */
extern void T16f7(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [CHARACTER_32].make_empty */
extern T0* T16c7(GE_context* ac, T6 a1);
/* UTF_CONVERTER.utf_16_0_pointer_to_escaped_string_32 */
extern T0* T125f6(GE_context* ac, T125* C, T0* a1);
/* UTF_CONVERTER.utf_16_0_pointer_into_escaped_string_32 */
extern void T125f14(GE_context* ac, T125* C, T0* a1, T0* a2);
/* UTF_CONVERTER.utf_16_0_subpointer_into_escaped_string_32 */
extern void T125f16(GE_context* ac, T125* C, T0* a1, T6 a2, T6 a3, T1 a4, T0* a5);
/* NATURAL_32.is_greater_equal */
extern T1 T10f16(GE_context* ac, T10* C, T10 a1);
/* NATURAL_16.to_natural_32 */
extern T10 T9f11(GE_context* ac, T9* C);
/* MANAGED_POINTER.read_natural_16 */
extern T9 T128f8(GE_context* ac, T0* C, T6 a1);
/* TYPED_POINTER [NATURAL_16].memory_copy */
extern void T262f2(GE_context* ac, T262* C, T14 a1, T6 a2);
/* TYPED_POINTER [NATURAL_16].c_memcpy */
extern void T262f3(GE_context* ac, T262* C, T14 a1, T14 a2, T6 a3);
/* NATIVE_STRING.make_from_pointer */
extern T0* T174c12(GE_context* ac, T14 a1);
/* MANAGED_POINTER.make_from_pointer */
extern T0* T128c16(GE_context* ac, T14 a1, T6 a2);
/* POINTER.memory_alloc */
extern T14 T14f9(GE_context* ac, T14* C, T6 a1);
/* POINTER.c_malloc */
extern T14 T14f10(GE_context* ac, T14* C, T6 a1);
/* NATIVE_STRING.unit_size */
extern T6 T174f4(GE_context* ac, T0* C);
/* NATIVE_STRING.pointer_length_in_bytes */
extern T6 T174f6(GE_context* ac, T0* C, T14 a1);
/* NATURAL_64.to_integer_32 */
extern T6 T11f5(GE_context* ac, T11* C);
/* NATURAL_64.is_less_equal */
extern T1 T11f4(GE_context* ac, T11* C, T11 a1);
/* NATIVE_STRING.c_pointer_length_in_bytes */
extern T11 T174f8(GE_context* ac, T0* C, T14 a1);
/* EXECUTION_ENVIRONMENT.eif_getenv */
extern T14 T129f6(GE_context* ac, T0* C, T14 a1);
/* NATIVE_STRING.item */
extern T14 T174f5(GE_context* ac, T0* C);
/* NATIVE_STRING.make */
extern T0* T174c11(GE_context* ac, T0* a1);
/* NATIVE_STRING.set_string */
extern void T174f14(GE_context* ac, T0* C, T0* a1);
/* NATIVE_STRING.set_substring */
extern void T174f15(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* NATIVE_STRING.upper_cell */
extern unsigned char ge2414os6885;
extern T0* ge2414ov6885;
extern T0* T174f7(GE_context* ac, T0* C);
/* NATIVE_STRING.make_empty */
extern void T174f9(GE_context* ac, T0* C, T6 a1);
/* NATIVE_STRING.make_empty */
extern T0* T174c9(GE_context* ac, T6 a1);
/* GEANT_GROUP.windows_file_system */
extern unsigned char ge165os1978;
extern T0* ge165ov1978;
extern T0* T258f22(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.make */
extern T0* T92c36(GE_context* ac);
/* KL_OPERATING_SYSTEM.is_windows */
extern unsigned char ge199os3703;
extern T1 ge199ov3703;
extern T1 T90f1(GE_context* ac, T0* C);
/* GEANT_GROUP.operating_system */
extern unsigned char ge207os1981;
extern T0* ge207ov1981;
extern T0* T258f21(GE_context* ac, T0* C);
/* KL_OPERATING_SYSTEM.default_create */
extern T0* T90c6(GE_context* ac);
/* GEANT_GROUP.project_variables_resolver */
extern unsigned char ge10os1963;
extern T0* ge10ov1963;
extern T0* T258f6(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.make */
extern T0* T100c18(GE_context* ac);
/* GEANT_GROUP.dir_attribute_name */
extern unsigned char ge86os2906;
extern T0* ge86ov2906;
extern T0* T258f10(GE_context* ac, T0* C);
/* GEANT_GROUP.is_enabled */
extern T1 T258f8(GE_context* ac, T0* C);
/* GEANT_GROUP.unless_attribute_name */
extern unsigned char ge86os2908;
extern T0* ge86ov2908;
extern T0* T258f7(GE_context* ac, T0* C);
/* BOOLEAN.out */
extern T0* T1f6(GE_context* ac, T1* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.boolean_condition_value */
extern T1 T100f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.exit_application */
extern void T100f20(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_PROJECT_VARIABLE_RESOLVER.exceptions */
extern T0* T100f12(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.std */
extern T0* T100f11(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.log_messages */
extern void T100f21(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.has */
extern T1 T100f6(GE_context* ac, T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.variable_value */
extern T0* T149f1(GE_context* ac, T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.string_ */
extern T0* T149f3(GE_context* ac, T0* C);
/* KL_EXECUTION_ENVIRONMENT.environment_impl */
extern unsigned char ge192os6578;
extern T0* ge192ov6578;
extern T0* T149f2(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.execution_environment */
extern unsigned char ge205os1974;
extern T0* ge205ov1974;
extern T0* T100f7(GE_context* ac, T0* C);
/* KL_EXECUTION_ENVIRONMENT.default_create */
extern T0* T149c4(GE_context* ac);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].item */
extern T0* T151f5(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.target_locals_stack */
extern unsigned char ge10os1966;
extern T0* ge10ov1966;
extern T0* T100f5(GE_context* ac, T0* C);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].make */
extern T0* T151c8(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES].make */
extern T0* T245f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_VARIABLES].make_empty */
extern void T244f5(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_VARIABLES].make_empty */
extern T0* T244c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES].default_create */
extern T0* T245c3(GE_context* ac);
/* GEANT_PROJECT_VARIABLE_RESOLVER.commandline_variables */
extern unsigned char ge10os1956;
extern T0* ge10ov1956;
extern T0* T100f4(GE_context* ac, T0* C);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].item */
extern T0* T150f5(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.target_arguments_stack */
extern unsigned char ge10os1965;
extern T0* ge10ov1965;
extern T0* T100f3(GE_context* ac, T0* C);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].make */
extern T0* T150c8(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].make */
extern T0* T243f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].make_empty */
extern T0* T242c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].default_create */
extern T0* T243c3(GE_context* ac);
/* UC_UTF8_STRING.item */
extern T2 T265f12(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.character_item_at_byte_index */
extern T2 T265f31(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.byte_index */
extern T6 T265f30(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.true_attribute_value */
extern unsigned char ge9os4882;
extern T0* ge9ov4882;
extern T0* T100f10(GE_context* ac, T0* C);
/* KL_STRING_ROUTINES.same_case_insensitive */
extern T1 T115f11(GE_context* ac, T0* C, T0* a1, T0* a2);
/* CHARACTER_8.lower */
extern T2 T2f21(GE_context* ac, T2* C);
/* CHARACTER_8.is_upper */
extern T1 T2f23(GE_context* ac, T2* C);
/* UC_UNICODE_ROUTINES.lower_code */
extern T6 T389f4(GE_context* ac, T0* C, T6 a1);
/* ARRAY [INTEGER_32].item */
extern T6 T263f4(GE_context* ac, T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.lower_codes */
extern unsigned char ge236os9443;
extern T0* ge236ov9443;
extern T0* T389f9(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_plane */
extern unsigned char ge236os9442;
extern T0* ge236ov9442;
extern T0* T389f12(GE_context* ac, T0* C);
/* SPECIAL [ARRAY [INTEGER_32]].make_filled */
extern T0* T483c4(GE_context* ac, T0* a1, T6 a2);
/* SPECIAL [ARRAY [INTEGER_32]].fill_with */
extern void T483f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ARRAY [INTEGER_32]].extend */
extern void T483f8(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [ARRAY [INTEGER_32]].make_empty */
extern void T483f6(GE_context* ac, T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.empty_lower_code_segment */
extern unsigned char ge236os9429;
extern T0* ge236ov9429;
extern T0* T389f19(GE_context* ac, T0* C);
/* KL_INTEGER_ROUTINES.to_integer */
extern T6 T267f3(GE_context* ac, T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.integer_ */
extern T0* T389f30(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_1 */
extern unsigned char ge236os9441;
extern T0* ge236ov9441;
extern T0* T389f11(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_1_segment_4 */
extern unsigned char ge236os9440;
extern T0* ge236ov9440;
extern T0* T389f29(GE_context* ac, T0* C);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].make_filled */
extern T0* T484c4(GE_context* ac, T0* a1, T6 a2);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].fill_with */
extern void T484f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].extend */
extern void T484f8(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].make_empty */
extern void T484f6(GE_context* ac, T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.lower_code_plane_0 */
extern unsigned char ge236os9439;
extern T0* ge236ov9439;
extern T0* T389f10(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_255 */
extern unsigned char ge236os9438;
extern T0* ge236ov9438;
extern T0* T389f28(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_167 */
extern unsigned char ge236os9437;
extern T0* ge236ov9437;
extern T0* T389f27(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_166 */
extern unsigned char ge236os9436;
extern T0* ge236ov9436;
extern T0* T389f26(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_44 */
extern unsigned char ge236os9435;
extern T0* ge236ov9435;
extern T0* T389f25(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_36 */
extern unsigned char ge236os9434;
extern T0* ge236ov9434;
extern T0* T389f24(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_33 */
extern unsigned char ge236os9433;
extern T0* ge236ov9433;
extern T0* T389f23(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_31 */
extern unsigned char ge236os9432;
extern T0* ge236ov9432;
extern T0* T389f22(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_30 */
extern unsigned char ge236os9431;
extern T0* ge236ov9431;
extern T0* T389f21(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_16 */
extern unsigned char ge236os9430;
extern T0* ge236ov9430;
extern T0* T389f20(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_5 */
extern unsigned char ge236os9428;
extern T0* ge236ov9428;
extern T0* T389f18(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_4 */
extern unsigned char ge236os9427;
extern T0* ge236ov9427;
extern T0* T389f17(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_3 */
extern unsigned char ge236os9426;
extern T0* ge236ov9426;
extern T0* T389f16(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_2 */
extern unsigned char ge236os9425;
extern T0* ge236ov9425;
extern T0* T389f15(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_1 */
extern unsigned char ge236os9424;
extern T0* ge236ov9424;
extern T0* T389f14(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_0 */
extern unsigned char ge236os9423;
extern T0* ge236ov9423;
extern T0* T389f13(GE_context* ac, T0* C);
/* KL_STRING_ROUTINES.unicode */
extern unsigned char ge217os5130;
extern T0* ge217ov5130;
extern T0* T115f12(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.default_create */
extern T0* T389c31(GE_context* ac);
/* UC_UTF8_STRING.item_code */
extern T6 T265f17(GE_context* ac, T0* C, T6 a1);
/* STRING_8.item_code */
extern T6 T17f14(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.false_attribute_value */
extern unsigned char ge9os4883;
extern T0* ge9ov4883;
extern T0* T100f9(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.string_ */
extern T0* T100f2(GE_context* ac, T0* C);
/* DS_LINKED_LIST [STRING_8].item */
extern T0* T298f6(GE_context* ac, T0* C, T6 a1);
/* ST_SPLITTER.split_greedy */
extern T0* T411f9(GE_context* ac, T0* C, T0* a1);
/* ST_SPLITTER.do_split */
extern T0* T411f7(GE_context* ac, T0* C, T0* a1, T1 a2);
/* DS_LINKED_LIST [STRING_8].force_last */
extern void T298f12(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [STRING_8].put_right */
extern void T409f4(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [STRING_8].make */
extern T0* T409c3(GE_context* ac, T0* a1);
/* DS_HASH_SET [INTEGER_32].has */
extern T1 T508f25(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].search_position */
extern void T508f31(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].hash_position */
extern T6 T508f19(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].key_storage_item */
extern T6 T508f18(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].item_storage_item */
extern T6 T508f27(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].clashes_item */
extern T6 T508f22(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].key_equality_tester */
extern T0* T508f28(GE_context* ac, T0* C);
/* DS_HASH_SET [INTEGER_32].slots_item */
extern T6 T508f24(GE_context* ac, T0* C, T6 a1);
/* KL_STRING_ROUTINES.appended_substring */
extern T0* T115f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* UC_UTF8_STRING.append_character */
extern void T265f60(GE_context* ac, T0* C, T2 a1);
/* UC_UTF8_STRING.put_character_at_byte_index */
extern void T265f76(GE_context* ac, T0* C, T2 a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.put_code_at_byte_index */
extern void T265f86(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.put_byte */
extern void T265f84(GE_context* ac, T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.old_put */
extern void T265f75(GE_context* ac, T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.resize_byte_storage */
extern void T265f74(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.old_set_count */
extern void T265f66(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.resize */
extern void T265f85(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.byte_capacity */
extern T6 T265f45(GE_context* ac, T0* C);
/* UC_UTF8_STRING.capacity */
extern T6 T265f45p1(GE_context* ac, T0* C);
/* UC_UTF8_ROUTINES.character_byte_count */
extern T6 T264f23(GE_context* ac, T0* C, T2 a1);
/* UC_UTF8_STRING.append_string */
extern void T265f59(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.append */
extern void T265f73(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.dummy_uc_string */
extern unsigned char ge223os6738;
extern T0* ge223ov6738;
extern T0* T265f49(GE_context* ac, T0* C);
/* UC_STRING.make_empty */
extern T0* T159c8(GE_context* ac);
/* UC_STRING.make */
extern void T159f9(GE_context* ac, T0* C, T6 a1);
/* UC_STRING.old_set_count */
extern void T159f12(GE_context* ac, T0* C, T6 a1);
/* UC_STRING.set_count */
extern void T159f11(GE_context* ac, T0* C, T6 a1);
/* UC_STRING.byte_capacity */
extern T6 T159f7(GE_context* ac, T0* C);
/* UC_STRING.capacity */
extern T6 T159f7p1(GE_context* ac, T0* C);
/* UC_STRING.make */
extern void T159f9p1(GE_context* ac, T0* C, T6 a1);
/* UC_STRING.reset_byte_index_cache */
extern void T159f10(GE_context* ac, T0* C);
/* UC_UTF8_STRING.append */
extern void T265f73p1(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.area_lower */
extern T6 T265f14(GE_context* ac, T0* C);
/* UC_UTF8_STRING.additional_space */
extern T6 T265f50(GE_context* ac, T0* C);
/* ISE_RUNTIME.check_assert */
extern T1 T390s1(GE_context* ac, T1 a1);
/* UC_UTF8_ROUTINES.substring_byte_count */
extern T6 T264f22(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
extern T1 T264f22ot1(T0* a1, T0** a2);
extern T1 T264f22ot2(T0* a1, T0** a2);
/* UC_UTF8_ROUTINES.code_byte_count */
extern T6 T264f24(GE_context* ac, T0* C, T6 a1);
/* NATURAL_32.to_integer_32 */
extern T6 T10f19(GE_context* ac, T10* C);
/* UC_UTF8_STRING.shifted_byte_index */
extern T6 T265f51(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF8_ROUTINES.dummy_uc_string */
extern unsigned char ge233os8367;
extern T0* ge233ov8367;
extern T0* T264f27(GE_context* ac, T0* C);
/* UC_UTF8_ROUTINES.any_ */
extern T0* T264f25(GE_context* ac, T0* C);
/* UC_UTF8_STRING.as_string_8 */
extern T0* T265f13(GE_context* ac, T0* C);
/* UC_UTF8_STRING.put_code */
extern void T265f67(GE_context* ac, T0* C, T10 a1, T6 a2);
/* UC_UTF8_STRING.put_item_code */
extern void T265f80(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.move_bytes_right */
extern void T265f87(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.move_bytes_left */
extern void T265f82(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.valid_code */
extern T1 T265f32(GE_context* ac, T0* C, T10 a1);
/* STRING_8.as_string_8 */
extern T0* T17f12(GE_context* ac, T0* C);
/* UC_UTF8_STRING.any_ */
extern T0* T265f47(GE_context* ac, T0* C);
/* UC_UTF8_STRING.new_empty_string */
extern T0* T265f11(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.make */
extern void T265f64(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.make */
extern T0* T265c64(GE_context* ac, T6 a1);
/* UC_UTF8_STRING.make */
extern void T265f64p1(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.gobo_append_substring */
extern void T265f61(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.put_substring_at_byte_index */
extern void T265f77(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4, T6 a5);
extern T1 T265f77ot1(T0* a1, T0** a2);
extern T1 T265f77ot2(T0* a1, T0** a2);
extern T1 T265f77ot3(T0* a1, T0** a2);
/* UC_UTF8_STRING.cloned_string */
extern T0* T265f46(GE_context* ac, T0* C);
/* UC_UTF8_STRING.twin */
extern T0* T265f21(GE_context* ac, T0* C);
/* UC_UTF8_STRING.copy */
extern void T265f70(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.copy */
extern void T265f70p1(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].resized_area */
extern T0* T15f7(GE_context* ac, T0* C, T6 a1);
/* ST_SPLITTER.string_ */
extern T0* T411f6(GE_context* ac, T0* C);
/* DS_LINKED_LIST [STRING_8].make */
extern T0* T298c10(GE_context* ac);
/* DS_LINKED_LIST [STRING_8].set_internal_cursor */
extern void T298f11(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].new_cursor */
extern T0* T298f8(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].make */
extern T0* T405c8(GE_context* ac, T0* a1);
/* ST_SPLITTER.make_with_separators */
extern T0* T411c10(GE_context* ac, T0* a1);
/* ST_SPLITTER.set_separators */
extern void T411f12(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [INTEGER_32].put */
extern void T508f30(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].slots_put */
extern void T508f40(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [INTEGER_32].clashes_put */
extern void T508f39(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [INTEGER_32].item_storage_put */
extern void T508f38(GE_context* ac, T0* C, T6 a1, T6 a2);
/* KL_SPECIAL_ROUTINES [INTEGER_32].force */
extern void T106f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* DS_HASH_SET [INTEGER_32].unset_found_item */
extern void T508f36(GE_context* ac, T0* C);
/* DS_HASH_SET [INTEGER_32].make */
extern T0* T508c29(GE_context* ac, T6 a1);
/* DS_HASH_SET [INTEGER_32].set_internal_cursor */
extern void T508f37(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [INTEGER_32].new_cursor */
extern T0* T508f20(GE_context* ac, T0* C);
/* DS_HASH_SET_CURSOR [INTEGER_32].make */
extern T0* T551c4(GE_context* ac, T0* a1);
/* DS_HASH_SET [INTEGER_32].make_slots */
extern void T508f35(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].new_modulus */
extern T6 T508f23(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].make_clashes */
extern void T508f34(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].make_key_storage */
extern void T508f33(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].make_item_storage */
extern void T508f32(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].make */
extern T0* T106f2(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].default_create */
extern T0* T106c6(GE_context* ac);
/* GEANT_GROUP.if_attribute_name */
extern unsigned char ge86os2907;
extern T0* ge86ov2907;
extern T0* T258f9(GE_context* ac, T0* C);
/* GEANT_GROUP.set_parent */
extern void T258f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_GROUP.make */
extern T0* T258c24(GE_context* ac, T0* a1, T0* a2);
/* GEANT_GROUP.initialize */
extern void T258f27(GE_context* ac, T0* C);
/* GEANT_GROUP.set_description */
extern void T258f33(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.text */
extern T0* T144f19(GE_context* ac, T0* C);
extern T1 T144f19ot1(T0* a1, T0** a2);
/* KL_STRING_ROUTINES.appended_string */
extern T0* T115f5(GE_context* ac, T0* C, T0* a1, T0* a2);
/* STRING_8.append_string */
extern void T17f42(GE_context* ac, T0* C, T0* a1);
/* STRING_8.append */
extern void T17f38(GE_context* ac, T0* C, T0* a1);
/* KL_STRING_ROUTINES.concat */
extern T0* T115f6(GE_context* ac, T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.prefixed_string */
extern T0* T265f10(GE_context* ac, T0* C, T0* a1);
/* KL_STRING_ROUTINES.cloned_string */
extern T0* T115f7(GE_context* ac, T0* C, T0* a1);
/* STRING_8.twin */
extern T0* T17f18(GE_context* ac, T0* C);
/* STRING_8.copy */
extern void T17f46(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.string_ */
extern T0* T144f21(GE_context* ac, T0* C);
/* XM_ELEMENT.element_by_name */
extern T0* T144f6(GE_context* ac, T0* C, T0* a1);
extern T1 T144f6ot1(T0* a1, T0** a2);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].go_after */
extern void T236f12(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].cursor_go_after */
extern void T239f15(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].set_after */
extern void T236f16(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].cursor_off */
extern T1 T239f6(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].off */
extern T1 T236f9(GE_context* ac, T0* C);
/* XM_ELEMENT.named_same_name */
extern T1 T144f5(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.same_namespace */
extern T1 T144f8(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE.is_equal */
extern T1 T231f4(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE.string_ */
extern T0* T231f3(GE_context* ac, T0* C);
/* XM_ELEMENT.same_string */
extern T1 T144f7(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.string_equality_tester */
extern unsigned char ge222os2707;
extern T0* ge222ov2707;
extern T0* T144f9(GE_context* ac, T0* C);
/* UC_STRING_EQUALITY_TESTER.default_create */
extern T0* T101c3(GE_context* ac);
/* GEANT_GROUP.make */
extern void T258f24p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_POSITION_TABLE.item */
extern T0* T146f3(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].forth */
extern void T271f11(GE_context* ac, T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_forth */
extern void T241f12(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].add_traversing_cursor */
extern void T241f13(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set_next_cursor */
extern void T271f14(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].remove_traversing_cursor */
extern void T241f14(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set */
extern void T271f12(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].go_after */
extern void T271f10(GE_context* ac, T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_go_after */
extern void T241f11(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set_after */
extern void T271f13(GE_context* ac, T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_off */
extern T1 T241f6(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].off */
extern T1 T271f7(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].item */
extern T0* T271f6(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].start */
extern void T271f9(GE_context* ac, T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_start */
extern void T241f10(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].new_cursor */
extern T0* T241f5(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T271c8(GE_context* ac, T0* a1);
/* XM_POSITION_TABLE.has */
extern T1 T146f2(GE_context* ac, T0* C, T0* a1);
/* GEANT_GROUP.set_project */
extern void T258f29(GE_context* ac, T0* C, T0* a1);
/* GEANT_GROUP.element_make */
extern void T258f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_GROUP.set_xml_element */
extern void T258f34(GE_context* ac, T0* C, T0* a1);
/* KL_STRING_ROUTINES.same_string */
extern T1 T115f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.elks_same_string */
extern T1 T115f10(GE_context* ac, T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.same_string */
extern T1 T265f16(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.substring_index */
extern T6 T265f34(GE_context* ac, T0* C, T0* a1, T6 a2);
/* STRING_8.same_string */
extern T1 T17f19(GE_context* ac, T0* C, T0* a1);
/* STRING_8.same_characters */
extern T1 T17f27(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* UC_UTF8_STRING.same_unicode_string */
extern T1 T265f15(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.unicode_substring_index */
extern T6 T265f33(GE_context* ac, T0* C, T0* a1, T6 a2);
/* GEANT_TARGET.group_element_name */
extern T0* T33f50(GE_context* ac, T0* C);
/* GEANT_TARGET.string_ */
extern T0* T33f35(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].item */
extern T0* T236f8(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].start */
extern void T236f11(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].cursor_start */
extern void T239f14(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.new_cursor */
extern T0* T144f11(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].new_cursor */
extern T0* T239f5(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].make */
extern T0* T236c10(GE_context* ac, T0* a1);
/* GEANT_TARGET.prepare_variables_before_execution */
extern void T33f79(GE_context* ac, T0* C);
/* GEANT_TARGET.prepare_variables_before_execution */
extern void T33f79p1(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].forth */
extern void T105f12(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].key */
extern T0* T105f6(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].item */
extern T0* T105f5(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].after */
extern T1 T105f4(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].start */
extern void T105f11(GE_context* ac, T0* C);
/* GEANT_VARIABLES.new_cursor */
extern T0* T36f29(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].make */
extern T0* T105c10(GE_context* ac, T0* a1);
/* GEANT_TARGET.target_locals_stack */
extern T0* T33f49(GE_context* ac, T0* C);
/* GEANT_TARGET.prepared_arguments_from_formal_arguments */
extern T0* T33f48(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.has_same_keys */
extern T1 T41f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.new_cursor */
extern T0* T41f29(GE_context* ac, T0* C);
/* GEANT_TARGET.named_from_numbered_arguments */
extern T0* T33f58(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.has_numbered_keys */
extern T1 T41f37(GE_context* ac, T0* C);
/* INTEGER_32.out */
extern T0* T6f18(GE_context* ac, T6* C);
/* STRING_8.append_integer */
extern void T17f50(GE_context* ac, T0* C, T6 a1);
/* GEANT_TARGET.target_arguments_stack */
extern T0* T33f47(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.set_current_working_directory */
extern void T93f34(GE_context* ac, T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.change_working_directory */
extern void T129f12(GE_context* ac, T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.eif_chdir */
extern T6 T129f8(GE_context* ac, T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.execution_environment */
extern unsigned char ge156os3736;
extern T0* ge156ov3736;
extern T0* T93f18(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.string_ */
extern T0* T93f13(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.set_current_working_directory */
extern void T92f37(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.execution_environment */
extern T0* T92f20(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.string_ */
extern T0* T92f12(GE_context* ac, T0* C);
/* GEANT_TARGET.exit_application */
extern void T33f67(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_TARGET.exceptions */
extern T0* T33f24(GE_context* ac, T0* C);
/* GEANT_TARGET.std */
extern T0* T33f23(GE_context* ac, T0* C);
/* GEANT_TARGET.log_messages */
extern void T33f74(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.associated_target */
extern T0* T33f46(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.directory_exists */
extern T1 T93f24(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.exists */
extern T1 T410f16(GE_context* ac, T0* C);
/* KL_DIRECTORY.old_exists */
extern T1 T410f19(GE_context* ac, T0* C);
/* KL_DIRECTORY.eif_dir_exists */
extern T1 T410f14(GE_context* ac, T0* C, T14 a1);
/* KL_DIRECTORY.internal_name_pointer */
extern T0* T410f12(GE_context* ac, T0* C);
/* KL_DIRECTORY.reset */
extern void T410f45(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.make */
extern void T410f43(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.make */
extern T0* T410c43(GE_context* ac, T0* a1);
/* KL_DIRECTORY.old_make */
extern void T410f46(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.make_with_name */
extern void T410f48(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.set_name */
extern void T410f50(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.file_info */
extern unsigned char ge2312os9813;
extern T0* ge2312ov9813;
extern T0* T410f17(GE_context* ac, T0* C);
/* KL_DIRECTORY.string_ */
extern T0* T410f22(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.tmp_directory */
extern unsigned char ge156os3734;
extern T0* ge156ov3734;
extern T0* T93f25(GE_context* ac, T0* C);
/* UC_UTF8_STRING.old_is_empty */
extern T1 T265f53(GE_context* ac, T0* C);
/* STRING_8.is_empty */
extern T1 T17f30(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.directory_exists */
extern T1 T92f27(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.tmp_directory */
extern T0* T92f28(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.current_working_directory */
extern T0* T93f23(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.current_working_directory */
extern T0* T92f26(GE_context* ac, T0* C);
/* GEANT_TARGET.file_system */
extern T0* T33f45(GE_context* ac, T0* C);
/* GEANT_TARGET.unix_file_system */
extern T0* T33f57(GE_context* ac, T0* C);
/* GEANT_TARGET.windows_file_system */
extern T0* T33f56(GE_context* ac, T0* C);
/* GEANT_TARGET.operating_system */
extern T0* T33f55(GE_context* ac, T0* C);
/* GEANT_STRING_INTERPRETER.interpreted_string */
extern T0* T312f5(GE_context* ac, T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.variable_value */
extern T0* T312f3(GE_context* ac, T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.expanded_variable_value */
extern T0* T312f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.value */
extern T0* T546f2(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.item */
extern T0* T36f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.item_storage_item */
extern T0* T36f35(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.search_position */
extern void T36f52(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.hash_position */
extern T6 T36f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.key_storage_item */
extern T0* T36f30(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.clashes_item */
extern T6 T36f26(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.slots_item */
extern T6 T36f33(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.value */
extern T0* T100f13(GE_context* ac, T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.cwd */
extern T0* T93f10(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.cwd */
extern T0* T92f10(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.file_system */
extern T0* T100f14(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.unix_file_system */
extern T0* T100f17(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.windows_file_system */
extern T0* T100f16(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.operating_system */
extern T0* T100f15(GE_context* ac, T0* C);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.has */
extern T1 T546f3(GE_context* ac, T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.default_variable_value */
extern T0* T312f4(GE_context* ac, T0* C, T0* a1);
/* KL_STRING_ROUTINES.append_substring_to_string */
extern void T115f20(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* KL_STRING_ROUTINES.new_empty_string */
extern T0* T115f3(GE_context* ac, T0* C, T0* a1, T6 a2);
/* UC_UTF8_STRING.old_wipe_out */
extern void T265f68(GE_context* ac, T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T265f81(GE_context* ac, T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T265f68p1(GE_context* ac, T0* C);
/* STRING_8.wipe_out */
extern void T17f41(GE_context* ac, T0* C);
/* GEANT_STRING_INTERPRETER.string_ */
extern T0* T312f2(GE_context* ac, T0* C);
/* UC_UTF8_STRING.out */
extern T0* T265f19(GE_context* ac, T0* C);
/* UC_UTF8_STRING.unicode */
extern T0* T265f36(GE_context* ac, T0* C);
/* STRING_8.out */
extern T0* T17f4(GE_context* ac, T0* C);
/* XM_ELEMENT.attribute_by_name */
extern T0* T144f13(GE_context* ac, T0* C, T0* a1);
extern T1 T144f13ot1(T0* a1, T0** a2);
/* XM_ELEMENT.attribute_same_name */
extern T1 T144f14(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_STRING_INTERPRETER.set_variable_resolver */
extern void T312f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.set_variables */
extern void T100f19(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.project_variables_resolver */
extern T0* T33f41(GE_context* ac, T0* C);
/* GEANT_STRING_INTERPRETER.make */
extern T0* T312c7(GE_context* ac);
/* XM_ELEMENT.has_attribute_by_name */
extern T1 T144f12(GE_context* ac, T0* C, T0* a1);
extern T1 T144f12ot1(T0* a1, T0** a2);
/* GEANT_TARGET.dir_attribute_name */
extern T0* T33f44(GE_context* ac, T0* C);
/* GEANT_PROJECT.log */
extern void T29f50(GE_context* ac, T0* C, T0* a1);
/* KL_STDOUT_FILE.flush */
extern void T108f9(GE_context* ac, T0* C);
/* CONSOLE.flush */
extern void T176f21(GE_context* ac, T0* C);
/* CONSOLE.file_flush */
extern void T176f26(GE_context* ac, T0* C, T14 a1);
/* KL_STDOUT_FILE.console */
extern unsigned char ge171os4969;
extern T0* ge171ov4969;
extern T0* T108f2(GE_context* ac, T0* C);
/* KL_STDOUT_FILE.io */
extern T0* T108f4(GE_context* ac, T0* C);
/* KL_STDOUT_FILE.put_new_line */
extern void T108f8(GE_context* ac, T0* C);
/* KL_STDOUT_FILE.put_string */
extern void T108f7(GE_context* ac, T0* C, T0* a1);
/* KL_STDOUT_FILE.string_ */
extern T0* T108f1(GE_context* ac, T0* C);
/* GEANT_PROJECT.target_name */
extern T0* T29f24(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].forth */
extern void T171f13(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_forth */
extern void T38f66(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].add_traversing_cursor */
extern void T38f71(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].set_next_cursor */
extern void T171f20(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].set_position */
extern void T171f18(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].remove_traversing_cursor */
extern void T38f70(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].set_after */
extern void T171f17(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].clashes_item */
extern T6 T38f35(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].go_after */
extern void T171f16(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_go_after */
extern void T38f76(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_off */
extern T1 T38f39(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].off */
extern T1 T171f10(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].key */
extern T0* T171f9(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_key */
extern T0* T38f37(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].key_storage_item */
extern T0* T38f22(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].item */
extern T0* T171f7(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_item */
extern T0* T38f36(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item_storage_item */
extern T0* T38f27(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].after */
extern T1 T171f5(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].start */
extern void T171f12(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_start */
extern void T38f65(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].is_empty */
extern T1 T38f38(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].new_cursor */
extern T0* T38f30(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].make */
extern T0* T171c11(GE_context* ac, T0* a1);
/* GEANT_TARGET.is_enabled */
extern T1 T33f43(GE_context* ac, T0* C);
/* GEANT_TARGET.unless_attribute_name */
extern T0* T33f54(GE_context* ac, T0* C);
/* GEANT_TARGET.if_attribute_name */
extern T0* T33f53(GE_context* ac, T0* C);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].force */
extern void T151f9(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES].force */
extern void T245f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_VARIABLES].fill_with */
extern void T244f9(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_VARIABLES].extend */
extern void T244f10(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].resize */
extern void T151f11(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES].aliased_resized_area */
extern T0* T245f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_VARIABLES].aliased_resized_area */
extern T0* T244f4(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].new_capacity */
extern T6 T151f7(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].extendible */
extern T1 T151f6(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.make */
extern T0* T36c46(GE_context* ac);
/* GEANT_VARIABLES.set_key_equality_tester */
extern void T36f50(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.make_map */
extern void T36f49(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.make_with_equality_testers */
extern void T36f58(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* GEANT_VARIABLES.make_sparse_container */
extern void T36f63(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.set_internal_cursor */
extern void T36f68(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.unset_found_item */
extern void T36f51(GE_context* ac, T0* C);
/* GEANT_VARIABLES.make_slots */
extern void T36f67(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.new_modulus */
extern T6 T36f22(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.make_clashes */
extern void T36f66(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.make_key_storage */
extern void T36f65(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].make */
extern T0* T104f2(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [STRING_8].make_empty */
extern void T40f7(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [STRING_8].make_empty */
extern T0* T40c7(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].default_create */
extern T0* T104c3(GE_context* ac);
/* GEANT_VARIABLES.make_item_storage */
extern void T36f64(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT.target_locals_stack */
extern T0* T29f23(GE_context* ac, T0* C);
/* GEANT_TARGET.final_target */
extern T0* T33f32(GE_context* ac, T0* C);
/* GEANT_PROJECT.current_target */
extern T0* T29f22(GE_context* ac, T0* C);
/* DS_ARRAYED_STACK [GEANT_TARGET].is_empty */
extern T1 T247f5(GE_context* ac, T0* C);
/* GEANT_PROJECT.trace_debug */
extern void T29f39(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].item */
extern T0* T247f6(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_VARIABLES.make */
extern T0* T41c46(GE_context* ac);
/* GEANT_ARGUMENT_VARIABLES.set_key_equality_tester */
extern void T41f49(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.make_map */
extern void T41f48(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_with_equality_testers */
extern void T41f57(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* GEANT_ARGUMENT_VARIABLES.make_sparse_container */
extern void T41f62(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.set_internal_cursor */
extern void T41f67(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.unset_found_item */
extern void T41f50(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_VARIABLES.make_slots */
extern void T41f66(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.new_modulus */
extern T6 T41f22(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_clashes */
extern void T41f65(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_key_storage */
extern void T41f64(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_item_storage */
extern void T41f63(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT.calculate_depend_order */
extern void T29f48(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.dependent_targets */
extern T0* T33f52(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].item */
extern T0* T110f21(GE_context* ac, T0* C, T6 a1);
/* GEANT_TARGET.show_dependent_targets */
extern void T33f84(GE_context* ac, T0* C, T0* a1);
/* KL_STDOUT_FILE.put_line */
extern void T108f6(GE_context* ac, T0* C, T0* a1);
/* KL_STANDARD_FILES.output */
extern unsigned char ge168os3415;
extern T0* ge168ov3415;
extern T0* T53f2(GE_context* ac, T0* C);
/* KL_STDOUT_FILE.make */
extern T0* T108c5(GE_context* ac);
/* GEANT_TARGET.string_tokens */
extern T0* T33f25(GE_context* ac, T0* C, T0* a1, T2 a2);
/* DS_ARRAYED_LIST [detachable STRING_8].force_last */
extern void T110f26(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [STRING_8].force */
extern void T104f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [STRING_8].fill_with */
extern void T40f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].extend */
extern void T40f9(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].resize */
extern void T110f28(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].aliased_resized_area */
extern T0* T104f1(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].aliased_resized_area */
extern T0* T40f4(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [detachable STRING_8].new_capacity */
extern T6 T110f17(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [detachable STRING_8].extendible */
extern T1 T110f16(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.index_of */
extern T6 T265f20(GE_context* ac, T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.index_of_item_code */
extern T6 T265f37(GE_context* ac, T0* C, T6 a1, T6 a2);
/* STRING_8.index_of */
extern T6 T17f13(GE_context* ac, T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.keep_head */
extern void T265f63(GE_context* ac, T0* C, T6 a1);
/* STRING_8.keep_head */
extern void T17f56(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.keep_tail */
extern void T265f69(GE_context* ac, T0* C, T6 a1);
/* STRING_8.keep_tail */
extern void T17f55(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [detachable STRING_8].make */
extern T0* T110c22(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [detachable STRING_8].set_internal_cursor */
extern void T110f27(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].new_cursor */
extern T0* T110f14(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].make */
extern T0* T111c9(GE_context* ac, T0* a1);
/* GEANT_TARGET.dependencies */
extern T0* T33f60(GE_context* ac, T0* C);
/* GEANT_TARGET.depend_attribute_name */
extern unsigned char ge12os2878;
extern T0* ge12ov2878;
extern T0* T33f61(GE_context* ac, T0* C);
/* GEANT_TARGET.has_dependencies */
extern T1 T33f59(GE_context* ac, T0* C);
/* DS_ARRAYED_STACK [GEANT_TARGET].force */
extern void T247f10(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].force */
extern void T170f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_TARGET].fill_with */
extern void T167f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_TARGET].extend */
extern void T167f9(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].resize */
extern void T247f12(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].aliased_resized_area */
extern T0* T170f1(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_TARGET].aliased_resized_area */
extern T0* T167f4(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].new_capacity */
extern T6 T247f8(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].extendible */
extern T1 T247f7(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].make */
extern T0* T247c9(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].make */
extern T0* T170f2(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_TARGET].make_empty */
extern T0* T167c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].default_create */
extern T0* T170c3(GE_context* ac);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].force */
extern void T150f9(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].force */
extern void T243f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].fill_with */
extern void T242f9(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].extend */
extern void T242f10(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].resize */
extern void T150f11(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].aliased_resized_area */
extern T0* T243f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].aliased_resized_area */
extern T0* T242f4(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].new_capacity */
extern T6 T150f7(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].extendible */
extern T1 T150f6(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT.target_arguments_stack */
extern T0* T29f21(GE_context* ac, T0* C);
/* GEANT_PROJECT.trace */
extern void T29f31(GE_context* ac, T0* C, T0* a1);
/* GEANT.commandline_arguments */
extern unsigned char ge10os1957;
extern T0* ge10ov1957;
extern T0* T22f11(GE_context* ac, T0* C);
/* GEANT_PROJECT.start_target */
extern T0* T29f17(GE_context* ac, T0* C);
/* GEANT_PROJECT.exit_application */
extern void T29f43(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_PROJECT.exceptions */
extern T0* T29f19(GE_context* ac, T0* C);
/* GEANT_PROJECT.std */
extern T0* T29f18(GE_context* ac, T0* C);
/* GEANT_PROJECT.log_messages */
extern void T29f47(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT.preferred_start_target */
extern T0* T29f20(GE_context* ac, T0* C);
/* GEANT_PROJECT.default_target */
extern T0* T29f16(GE_context* ac, T0* C);
/* GEANT_PROJECT.show_target_info */
extern void T29f34(GE_context* ac, T0* C);
/* GEANT_PROJECT.set_start_target_name */
extern void T29f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.full_name */
extern T0* T33f29(GE_context* ac, T0* C);
/* GEANT_TARGET.is_exported_to_any */
extern T1 T33f30(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].has */
extern T1 T110f19(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.project_name_any */
extern unsigned char ge12os2881;
extern T0* ge12ov2881;
extern T0* T33f26(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item */
extern T0* T38f34(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].search_position */
extern void T38f47(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].hash_position */
extern T6 T38f24(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].slots_item */
extern T6 T38f25(GE_context* ac, T0* C, T6 a1);
/* GEANT.exit_application */
extern void T22f22(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT.exceptions */
extern T0* T22f14(GE_context* ac, T0* C);
/* GEANT.std */
extern T0* T22f13(GE_context* ac, T0* C);
/* GEANT.log_messages */
extern void T22f28(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.plus */
extern T0* T265f9(GE_context* ac, T0* C, T0* a1);
/* STRING_8.plus */
extern T0* T17f9(GE_context* ac, T0* C, T0* a1);
/* STRING_8.append_string_general */
extern void T17f47(GE_context* ac, T0* C, T0* a1);
/* STRING_8.append */
extern void T17f47p1(GE_context* ac, T0* C, T0* a1);
/* STRING_8.append_code */
extern void T17f49(GE_context* ac, T0* C, T10 a1);
/* STRING_8.new_string */
extern T0* T17f22(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].has */
extern T1 T38f33(GE_context* ac, T0* C, T0* a1);
/* INTEGER_32.is_greater */
extern T1 T6f14(GE_context* ac, T6* C, T6 a1);
/* GEANT_PROJECT.merge_in_parent_projects */
extern void T29f32(GE_context* ac, T0* C);
/* GEANT_TARGET.show_precursors */
extern void T33f77(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].to_array */
extern T0* T110f20(GE_context* ac, T0* C);
/* ARRAY [STRING_8].put */
extern void T39f12(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].after */
extern T1 T111f8(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].forth */
extern void T111f11(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].cursor_forth */
extern void T110f31(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].set_position */
extern void T111f13(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [detachable STRING_8].add_traversing_cursor */
extern void T110f35(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].set_next_cursor */
extern void T111f14(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].remove_traversing_cursor */
extern void T110f36(GE_context* ac, T0* C, T0* a1);
/* ARRAY [STRING_8].make_filled */
extern T0* T39c11(GE_context* ac, T0* a1, T6 a2, T6 a3);
/* ARRAY [STRING_8].make_filled_area */
extern void T39f13(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].make_filled */
extern T0* T40c6(GE_context* ac, T0* a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].item */
extern T0* T111f6(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].cursor_item */
extern T0* T110f12(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].start */
extern void T111f10(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].cursor_start */
extern void T110f30(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].set_after */
extern void T111f12(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].off */
extern T1 T111f4(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [detachable STRING_8].before */
extern T1 T111f7(GE_context* ac, T0* C);
/* KL_ARRAY_ROUTINES [detachable STRING_8].make_empty_with_lower */
extern T0* T318f1(GE_context* ac, T0* C, T6 a1);
/* ARRAY [STRING_8].make_from_array */
extern T0* T39c18(GE_context* ac, T0* a1);
/* ARRAY [STRING_8].set_area */
extern void T39f16(GE_context* ac, T0* C, T0* a1);
/* KL_ARRAY [detachable STRING_8].new_rebase */
extern void T414f5(GE_context* ac, T0* C, T6 a1);
/* KL_ARRAY [detachable STRING_8].make_empty */
extern T0* T414c4(GE_context* ac);
/* KL_ARRAY [detachable STRING_8].make_empty_area */
extern void T414f6(GE_context* ac, T0* C, T6 a1);
/* ARRAY [STRING_8].make_empty */
extern T0* T39c17(GE_context* ac);
/* ARRAY [STRING_8].make_empty_area */
extern void T39f15(GE_context* ac, T0* C, T6 a1);
/* KL_ARRAY_ROUTINES [detachable STRING_8].default_create */
extern T0* T318c2(GE_context* ac);
/* DS_ARRAYED_LIST [detachable STRING_8].is_empty */
extern T1 T110f9(GE_context* ac, T0* C);
/* GEANT_INHERIT.apply_selects */
extern void T166f8(GE_context* ac, T0* C);
/* GEANT_INHERIT.check_targets_for_conflicts */
extern void T166f14(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].back */
extern void T171f15(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_back */
extern void T38f68(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].set_before */
extern void T171f19(GE_context* ac, T0* C);
/* GEANT_INHERIT.exit_application */
extern void T166f15(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_INHERIT.exceptions */
extern T0* T166f5(GE_context* ac, T0* C);
/* GEANT_INHERIT.std */
extern T0* T166f4(GE_context* ac, T0* C);
/* GEANT_INHERIT.log_messages */
extern void T166f16(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.conflicts_with */
extern T1 T33f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.seed */
extern T0* T33f40(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].before */
extern T1 T171f4(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].finish */
extern void T171f14(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_finish */
extern void T38f67(GE_context* ac, T0* C, T0* a1);
/* GEANT_INHERIT.sort_out_selected_targets */
extern void T166f13(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].remove */
extern void T38f64(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].remove_position */
extern void T38f69(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].key_storage_put */
extern void T38f53(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item_storage_put */
extern void T38f52(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].key_storage_keep_head */
extern void T38f75(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [STRING_8].keep_head */
extern void T40f10(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [STRING_8].set_count */
extern void T40f12(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item_storage_keep_head */
extern void T38f74(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].clashes_put */
extern void T38f50(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].slots_put */
extern void T38f51(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].move_cursors_forth */
extern void T38f73(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].internal_set_key_equality_tester */
extern void T38f72(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].unset_found_item */
extern void T38f48(GE_context* ac, T0* C);
/* GEANT_TARGET.set_redefining_target */
extern void T33f85(GE_context* ac, T0* C, T0* a1);
/* GEANT_INHERIT.validate_parent_selects */
extern void T166f12(GE_context* ac, T0* C);
/* GEANT_INHERIT.merge_in_parent_project */
extern void T166f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_INHERIT.merge_in_unchanged_targets */
extern void T166f11(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].force_last_new */
extern void T38f45(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].resize */
extern void T38f49(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].clashes_resize */
extern void T38f58(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].aliased_resized_area_with_default */
extern T0* T106f1(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].aliased_resized_area_with_default */
extern T0* T95f4(GE_context* ac, T0* C, T6 a1, T6 a2);
/* SPECIAL [INTEGER_32].aliased_resized_area */
extern T0* T95f5(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].special_integer_ */
extern unsigned char ge127os2705;
extern T0* ge127ov2705;
extern T0* T38f31(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].key_storage_resize */
extern void T38f57(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item_storage_resize */
extern void T38f56(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].slots_resize */
extern void T38f55(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].new_modulus */
extern T6 T38f23(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].new_capacity */
extern T6 T38f32(GE_context* ac, T0* C, T6 a1);
/* GEANT_INHERIT.string_ */
extern T0* T166f3(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].found_item */
extern T0* T38f28(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].found */
extern T1 T38f29(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].search */
extern void T38f44(GE_context* ac, T0* C, T0* a1);
/* GEANT_INHERIT.merge_in_renamed_targets */
extern void T166f10(GE_context* ac, T0* C, T0* a1);
/* GEANT_INHERIT.merge_in_redefined_targets */
extern void T166f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.set_precursor_target */
extern void T33f76(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.formal_arguments_match */
extern T1 T33f33(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].forth */
extern void T252f11(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_forth */
extern void T251f17(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].set_position */
extern void T252f13(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].add_traversing_cursor */
extern void T251f18(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].set_next_cursor */
extern void T252f14(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].remove_traversing_cursor */
extern void T251f19(GE_context* ac, T0* C, T0* a1);
/* GEANT_PARENT.prepare_project */
extern void T249f14(GE_context* ac, T0* C);
/* GEANT_PARENT.apply_selects */
extern void T249f19(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].forth */
extern void T500f11(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_forth */
extern void T402f57(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].add_traversing_cursor */
extern void T402f59(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].set_next_cursor */
extern void T500f14(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].set_position */
extern void T500f13(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].remove_traversing_cursor */
extern void T402f58(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].set_after */
extern void T500f12(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].clashes_item */
extern T6 T402f24(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].force_last */
extern void T38f77(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_PARENT.exit_application */
extern void T249f20(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_PARENT.exceptions */
extern T0* T249f11(GE_context* ac, T0* C);
/* GEANT_PARENT.std */
extern T0* T249f10(GE_context* ac, T0* C);
/* GEANT_PARENT.log_messages */
extern void T249f21(GE_context* ac, T0* C, T0* a1);
/* GEANT_SELECT.is_executable */
extern T1 T401f2(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].item */
extern T0* T500f5(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_item */
extern T0* T402f31(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].item_storage_item */
extern T0* T402f32(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].after */
extern T1 T500f7(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].start */
extern void T500f10(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_start */
extern void T402f56(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_off */
extern T1 T402f34(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].off */
extern T1 T500f8(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].is_empty */
extern T1 T402f33(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].new_cursor */
extern T0* T402f27(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].make */
extern T0* T500c9(GE_context* ac, T0* a1);
/* GEANT_PARENT.apply_undeclared_redefines */
extern void T249f18(GE_context* ac, T0* C);
/* GEANT_PARENT.apply_unchangeds */
extern void T249f17(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].has_item */
extern T1 T38f41(GE_context* ac, T0* C, T0* a1);
/* GEANT_PARENT.apply_redefines */
extern void T249f16(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].forth */
extern void T495f11(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_forth */
extern void T400f57(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].add_traversing_cursor */
extern void T400f59(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].set_next_cursor */
extern void T495f14(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].set_position */
extern void T495f13(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].remove_traversing_cursor */
extern void T400f58(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].set_after */
extern void T495f12(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].clashes_item */
extern T6 T400f24(GE_context* ac, T0* C, T6 a1);
/* GEANT_REDEFINE.is_executable */
extern T1 T399f2(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].item */
extern T0* T495f5(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_item */
extern T0* T400f31(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].item_storage_item */
extern T0* T400f32(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].after */
extern T1 T495f7(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].start */
extern void T495f10(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_start */
extern void T400f56(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_off */
extern T1 T400f34(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].off */
extern T1 T495f8(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].is_empty */
extern T1 T400f33(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].new_cursor */
extern T0* T400f27(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].make */
extern T0* T495c9(GE_context* ac, T0* a1);
/* GEANT_PARENT.apply_renames */
extern void T249f15(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].back */
extern void T490f11(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_back */
extern void T398f58(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].add_traversing_cursor */
extern void T398f60(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].set_next_cursor */
extern void T490f14(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].set_position */
extern void T490f13(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].remove_traversing_cursor */
extern void T398f59(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].set_before */
extern void T490f12(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].clashes_item */
extern T6 T398f25(GE_context* ac, T0* C, T6 a1);
/* GEANT_RENAME.is_executable */
extern T1 T397f3(GE_context* ac, T0* C);
/* GEANT_RENAME.string_ */
extern T0* T397f4(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].item */
extern T0* T490f5(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_item */
extern T0* T398f32(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].item_storage_item */
extern T0* T398f33(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].before */
extern T1 T490f7(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].finish */
extern void T490f10(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_finish */
extern void T398f57(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_off */
extern T1 T398f35(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].off */
extern T1 T490f8(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].is_empty */
extern T1 T398f34(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].new_cursor */
extern T0* T398f28(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].make */
extern T0* T490c9(GE_context* ac, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].item */
extern T0* T252f5(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_item */
extern T0* T251f9(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].after */
extern T1 T252f7(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].start */
extern void T252f10(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_start */
extern void T251f16(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].set_after */
extern void T252f12(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].is_empty */
extern T1 T251f10(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].off */
extern T1 T252f6(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].before */
extern T1 T252f8(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].new_cursor */
extern T0* T251f6(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].make */
extern T0* T252c9(GE_context* ac, T0* a1);
/* GEANT_PROJECT_LOADER.load */
extern void T30f10(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_LOADER.exit_application */
extern void T30f11(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_PROJECT_LOADER.exceptions */
extern T0* T30f6(GE_context* ac, T0* C);
/* GEANT_PROJECT_LOADER.log_messages */
extern void T30f12(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.absolute_pathname */
extern T0* T92f4(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.current_drive */
extern T0* T92f13(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_separator */
extern T1 T92f19(GE_context* ac, T0* C, T2 a1);
/* KL_WINDOWS_FILE_SYSTEM.pathname */
extern T0* T92f11(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.is_relative_pathname */
extern T1 T92f9(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_absolute_pathname */
extern T1 T92f8(GE_context* ac, T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.absolute_pathname */
extern T0* T93f4(GE_context* ac, T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.pathname */
extern T0* T93f11(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_UNIX_FILE_SYSTEM.is_absolute_pathname */
extern T1 T93f9(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.pathname_from_file_system */
extern T0* T92f3(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.pathname_to_string */
extern T0* T92f7(GE_context* ac, T0* C, T0* a1);
/* KL_PATHNAME.item */
extern T0* T132f8(GE_context* ac, T0* C, T6 a1);
/* KL_PATHNAME.is_parent */
extern T1 T132f7(GE_context* ac, T0* C, T6 a1);
/* KL_PATHNAME.is_current */
extern T1 T132f11(GE_context* ac, T0* C, T6 a1);
/* KL_WINDOWS_FILE_SYSTEM.root_directory */
extern unsigned char ge177os3781;
extern T0* ge177ov3781;
extern T0* T92f16(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.string_to_pathname */
extern T0* T93f5(GE_context* ac, T0* C, T0* a1);
/* KL_PATHNAME.append_name */
extern void T132f17(GE_context* ac, T0* C, T0* a1);
/* ARRAY [STRING_8].force */
extern void T39f14(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].move_data */
extern void T40f11(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].overlapping_move */
extern void T40f14(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].force */
extern void T40f15(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].non_overlapping_move */
extern void T40f13(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* ARRAY [STRING_8].capacity */
extern T6 T39f8(GE_context* ac, T0* C);
/* ARRAY [STRING_8].additional_space */
extern T6 T39f7(GE_context* ac, T0* C);
/* ARRAY [STRING_8].empty_area */
extern T1 T39f6(GE_context* ac, T0* C);
/* KL_PATHNAME.append_parent */
extern void T132f16(GE_context* ac, T0* C);
/* KL_PATHNAME.append_current */
extern void T132f15(GE_context* ac, T0* C);
/* KL_PATHNAME.set_relative */
extern void T132f14(GE_context* ac, T0* C, T1 a1);
/* KL_PATHNAME.make */
extern T0* T132c13(GE_context* ac);
/* KL_WINDOWS_FILE_SYSTEM.any_ */
extern T0* T92f6(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.pathname_from_file_system */
extern T0* T93f3(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_UNIX_FILE_SYSTEM.pathname_to_string */
extern T0* T93f8(GE_context* ac, T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.root_directory */
extern unsigned char ge174os3781;
extern T0* ge174ov3781;
extern T0* T93f17(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.any_ */
extern T0* T93f7(GE_context* ac, T0* C);
/* GEANT_PROJECT_LOADER.unix_file_system */
extern T0* T30f4(GE_context* ac, T0* C);
/* GEANT_PROJECT_LOADER.file_system */
extern T0* T30f3(GE_context* ac, T0* C);
/* GEANT_PROJECT_LOADER.windows_file_system */
extern T0* T30f8(GE_context* ac, T0* C);
/* GEANT_PROJECT_LOADER.operating_system */
extern T0* T30f7(GE_context* ac, T0* C);
/* KL_STDERR_FILE.put_character */
extern void T54f9(GE_context* ac, T0* C, T2 a1);
/* CONSOLE.put_character */
extern void T176f19(GE_context* ac, T0* C, T2 a1);
/* CONSOLE.console_pc */
extern void T176f25(GE_context* ac, T0* C, T14 a1, T2 a2);
/* GEANT_PROJECT_LOADER.std */
extern T0* T30f5(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.close */
extern void T97f63(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.old_close */
extern void T97f67(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.default_pointer */
extern T14 T97f27(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.file_close */
extern void T97f70(GE_context* ac, T0* C, T14 a1);
/* GEANT_PROJECT_PARSER.parse_file */
extern void T98f9(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.last_error_extended_description */
extern T0* T138f92(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.string_ */
extern T0* T138f89(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.last_error_description */
extern T0* T138f87(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.safe_error_component */
extern T0* T138f140(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_safe_error_character */
extern T1 T138f97(GE_context* ac, T0* C, T2 a1);
/* XM_EIFFEL_PARSER.position */
extern T0* T138f128(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [XM_POSITION].first */
extern T0* T186f6(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.positions */
extern T0* T138f93(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.new_positions */
extern T0* T138f122(GE_context* ac, T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].remove */
extern void T187f7(GE_context* ac, T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].item */
extern T0* T187f4(GE_context* ac, T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].is_empty */
extern T1 T187f3(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [XM_POSITION].force_last */
extern void T186f8(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [XM_POSITION].put_right */
extern void T284f5(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [XM_POSITION].attach_left */
extern void T284f6(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [XM_POSITION].make */
extern T0* T284c4(GE_context* ac, T0* a1);
/* DS_BILINKED_LIST [XM_POSITION].make */
extern T0* T186c7(GE_context* ac);
/* DS_BILINKED_LIST [XM_POSITION].set_internal_cursor */
extern void T186f9(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_POSITION].new_cursor */
extern T0* T186f5(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_POSITION].make */
extern T0* T285c3(GE_context* ac, T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].copy */
extern void T187f6(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_EIFFEL_SCANNER].put_right */
extern void T286f4(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_EIFFEL_SCANNER].make */
extern T0* T286c3(GE_context* ac, T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].make */
extern T0* T187c5(GE_context* ac);
/* KL_STDERR_FILE.flush */
extern void T54f10(GE_context* ac, T0* C);
/* XM_TREE_CALLBACKS_PIPE.last_error */
extern T0* T139f5(GE_context* ac, T0* C);
/* GEANT_PROJECT_PARSER.std */
extern T0* T98f7(GE_context* ac, T0* C);
/* GEANT_PROJECT.set_position_table */
extern void T29f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.make */
extern T0* T37c20(GE_context* ac, T0* a1, T0* a2, T0* a3, T0* a4);
/* GEANT_PROJECT_ELEMENT.load_parent_projects */
extern void T37f23(GE_context* ac, T0* C);
/* GEANT_INHERIT_ELEMENT.make */
extern T0* T165c11(GE_context* ac, T0* a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.exit_application */
extern void T165f13(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.exceptions */
extern T0* T165f8(GE_context* ac, T0* C);
/* GEANT_INHERIT_ELEMENT.std */
extern T0* T165f7(GE_context* ac, T0* C);
/* GEANT_INHERIT_ELEMENT.log_messages */
extern void T165f16(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].force_last */
extern void T251f13(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].force */
extern void T386f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_PARENT].fill_with */
extern void T387f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_PARENT].extend */
extern void T387f8(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].resize */
extern void T251f15(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].aliased_resized_area */
extern T0* T386f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_PARENT].aliased_resized_area */
extern T0* T387f4(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].new_capacity */
extern T6 T251f7(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].extendible */
extern T1 T251f8(GE_context* ac, T0* C, T6 a1);
/* GEANT_PARENT.is_executable */
extern T1 T249f9(GE_context* ac, T0* C);
/* GEANT_PARENT_ELEMENT.make */
extern T0* T275c22(GE_context* ac, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].force_last */
extern void T402f36(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].key_storage_put */
extern void T402f45(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].slots_put */
extern void T402f44(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].clashes_put */
extern void T402f43(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].slots_item */
extern T6 T402f30(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].hash_position */
extern T6 T402f23(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].resize */
extern void T402f42(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].clashes_resize */
extern void T402f50(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].special_integer_ */
extern T0* T402f28(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].key_storage_resize */
extern void T402f49(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].item_storage_resize */
extern void T402f48(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].aliased_resized_area */
extern T0* T498f1(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_SELECT].aliased_resized_area */
extern T0* T499f3(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].key_storage_item */
extern T0* T402f26(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].slots_resize */
extern void T402f47(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].new_modulus */
extern T6 T402f21(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].new_capacity */
extern T6 T402f22(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].item_storage_put */
extern void T402f41(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].force */
extern void T498f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_SELECT].fill_with */
extern void T499f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_SELECT].extend */
extern void T499f8(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].search_position */
extern void T402f40(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].unset_found_item */
extern void T402f39(GE_context* ac, T0* C);
/* GEANT_SELECT_ELEMENT.make */
extern T0* T396c9(GE_context* ac, T0* a1, T0* a2);
/* GEANT_SELECT.set_name */
extern void T401f4(GE_context* ac, T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.attribute_value */
extern T0* T396f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.project_variables_resolver */
extern T0* T396f8(GE_context* ac, T0* C);
/* GEANT_SELECT_ELEMENT.has_attribute */
extern T1 T396f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.target_attribute_name */
extern unsigned char ge100os9704;
extern T0* ge100ov9704;
extern T0* T396f5(GE_context* ac, T0* C);
/* GEANT_SELECT.make */
extern T0* T401c3(GE_context* ac);
/* GEANT_SELECT_ELEMENT.interpreting_element_make */
extern void T396f10(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_SELECT_ELEMENT.set_project */
extern void T396f12(GE_context* ac, T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.element_make */
extern void T396f11(GE_context* ac, T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.set_xml_element */
extern void T396f13(GE_context* ac, T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.select_element_name */
extern unsigned char ge92os8536;
extern T0* ge92ov8536;
extern T0* T275f11(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].force_last */
extern void T400f36(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].key_storage_put */
extern void T400f45(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].slots_put */
extern void T400f44(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].clashes_put */
extern void T400f43(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].slots_item */
extern T6 T400f30(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].hash_position */
extern T6 T400f23(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].resize */
extern void T400f42(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].clashes_resize */
extern void T400f50(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].special_integer_ */
extern T0* T400f28(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].key_storage_resize */
extern void T400f49(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].item_storage_resize */
extern void T400f48(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].aliased_resized_area */
extern T0* T493f1(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_REDEFINE].aliased_resized_area */
extern T0* T494f3(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].key_storage_item */
extern T0* T400f26(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].slots_resize */
extern void T400f47(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].new_modulus */
extern T6 T400f21(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].new_capacity */
extern T6 T400f22(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].item_storage_put */
extern void T400f41(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].force */
extern void T493f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_REDEFINE].fill_with */
extern void T494f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_REDEFINE].extend */
extern void T494f8(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].search_position */
extern void T400f40(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].unset_found_item */
extern void T400f39(GE_context* ac, T0* C);
/* GEANT_REDEFINE_ELEMENT.make */
extern T0* T395c9(GE_context* ac, T0* a1, T0* a2);
/* GEANT_REDEFINE.set_name */
extern void T399f4(GE_context* ac, T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.attribute_value */
extern T0* T395f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.project_variables_resolver */
extern T0* T395f8(GE_context* ac, T0* C);
/* GEANT_REDEFINE_ELEMENT.has_attribute */
extern T1 T395f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.target_attribute_name */
extern unsigned char ge96os9700;
extern T0* ge96ov9700;
extern T0* T395f5(GE_context* ac, T0* C);
/* GEANT_REDEFINE.make */
extern T0* T399c3(GE_context* ac);
/* GEANT_REDEFINE_ELEMENT.interpreting_element_make */
extern void T395f10(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_REDEFINE_ELEMENT.set_project */
extern void T395f12(GE_context* ac, T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.element_make */
extern void T395f11(GE_context* ac, T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.set_xml_element */
extern void T395f13(GE_context* ac, T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.redefine_element_name */
extern unsigned char ge92os8535;
extern T0* ge92ov8535;
extern T0* T275f10(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].force_last */
extern void T398f37(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].key_storage_put */
extern void T398f46(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].slots_put */
extern void T398f45(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].clashes_put */
extern void T398f44(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].slots_item */
extern T6 T398f24(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].hash_position */
extern T6 T398f21(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].resize */
extern void T398f43(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].clashes_resize */
extern void T398f51(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].special_integer_ */
extern T0* T398f29(GE_context* ac, T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].key_storage_resize */
extern void T398f50(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].item_storage_resize */
extern void T398f49(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].aliased_resized_area */
extern T0* T488f1(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_RENAME].aliased_resized_area */
extern T0* T489f3(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].key_storage_item */
extern T0* T398f27(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].slots_resize */
extern void T398f48(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].new_modulus */
extern T6 T398f22(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].new_capacity */
extern T6 T398f31(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].item_storage_put */
extern void T398f42(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].force */
extern void T488f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_RENAME].fill_with */
extern void T489f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_RENAME].extend */
extern void T489f8(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].search_position */
extern void T398f39(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].unset_found_item */
extern void T398f41(GE_context* ac, T0* C);
/* GEANT_PARENT_ELEMENT.exit_application */
extern void T275f24(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_PARENT_ELEMENT.exceptions */
extern T0* T275f15(GE_context* ac, T0* C);
/* GEANT_PARENT_ELEMENT.std */
extern T0* T275f14(GE_context* ac, T0* C);
/* GEANT_PARENT_ELEMENT.log_messages */
extern void T275f27(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].put_last */
extern void T110f32(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].has */
extern T1 T398f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.make */
extern T0* T394c10(GE_context* ac, T0* a1, T0* a2);
/* GEANT_RENAME.set_new_name */
extern void T397f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.as_attribute_name */
extern unsigned char ge98os9696;
extern T0* ge98ov9696;
extern T0* T394f5(GE_context* ac, T0* C);
/* GEANT_RENAME.set_original_name */
extern void T397f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.attribute_value */
extern T0* T394f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.project_variables_resolver */
extern T0* T394f9(GE_context* ac, T0* C);
/* GEANT_RENAME_ELEMENT.has_attribute */
extern T1 T394f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.target_attribute_name */
extern unsigned char ge98os9695;
extern T0* ge98ov9695;
extern T0* T394f6(GE_context* ac, T0* C);
/* GEANT_RENAME.make */
extern T0* T397c5(GE_context* ac);
/* GEANT_RENAME_ELEMENT.interpreting_element_make */
extern void T394f11(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_RENAME_ELEMENT.set_project */
extern void T394f13(GE_context* ac, T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.element_make */
extern void T394f12(GE_context* ac, T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.set_xml_element */
extern void T394f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.elements_by_name */
extern T0* T275f9(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].force_last */
extern void T163f8(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_ELEMENT].put_right */
extern void T274f4(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_ELEMENT].make */
extern T0* T274c3(GE_context* ac, T0* a1);
/* GEANT_PARENT_ELEMENT.string_ */
extern T0* T275f19(GE_context* ac, T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].make */
extern T0* T163c7(GE_context* ac);
/* DS_LINKED_LIST [XM_ELEMENT].set_internal_cursor */
extern void T163f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.rename_element_name */
extern unsigned char ge92os8534;
extern T0* ge92ov8534;
extern T0* T275f8(GE_context* ac, T0* C);
/* GEANT_PARENT.set_parent_project */
extern void T249f13(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.value */
extern T0* T32f47(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.item */
extern T0* T32f50(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.item_storage_item */
extern T0* T32f48(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.search_position */
extern void T32f65(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.hash_position */
extern T6 T32f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.key_storage_item */
extern T0* T32f28(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.clashes_item */
extern T6 T32f21(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.slots_item */
extern T6 T32f22(GE_context* ac, T0* C, T6 a1);
/* KL_UNIX_FILE_SYSTEM.is_relative_pathname */
extern T1 T93f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.file_system */
extern T0* T275f7(GE_context* ac, T0* C);
/* GEANT_PARENT_ELEMENT.unix_file_system */
extern T0* T275f18(GE_context* ac, T0* C);
/* GEANT_PARENT_ELEMENT.windows_file_system */
extern T0* T275f17(GE_context* ac, T0* C);
/* GEANT_PARENT_ELEMENT.operating_system */
extern T0* T275f16(GE_context* ac, T0* C);
/* GEANT_PARENT_ELEMENT.attribute_value */
extern T0* T275f12(GE_context* ac, T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.project_variables_resolver */
extern T0* T275f20(GE_context* ac, T0* C);
/* GEANT_PARENT_ELEMENT.has_attribute */
extern T1 T275f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.location_attribute_name */
extern unsigned char ge92os8532;
extern T0* ge92ov8532;
extern T0* T275f5(GE_context* ac, T0* C);
/* GEANT_PARENT.make */
extern T0* T249c12(GE_context* ac, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].set_key_equality_tester */
extern void T402f37(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_map_equal */
extern T0* T402c35(GE_context* ac, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_with_equality_testers */
extern void T402f38(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_sparse_container */
extern void T402f46(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].set_internal_cursor */
extern void T402f55(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_slots */
extern void T402f54(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_clashes */
extern void T402f53(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_key_storage */
extern void T402f52(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_item_storage */
extern void T402f51(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].make */
extern T0* T498f2(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_SELECT].make_empty */
extern T0* T499c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].default_create */
extern T0* T498c3(GE_context* ac);
/* detachable KL_EQUALITY_TESTER [GEANT_SELECT].default_create */
extern T0* T496c1(GE_context* ac);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].set_key_equality_tester */
extern void T400f37(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_map_equal */
extern T0* T400c35(GE_context* ac, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_with_equality_testers */
extern void T400f38(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_sparse_container */
extern void T400f46(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].set_internal_cursor */
extern void T400f55(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_slots */
extern void T400f54(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_clashes */
extern void T400f53(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_key_storage */
extern void T400f52(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_item_storage */
extern void T400f51(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].make */
extern T0* T493f2(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_REDEFINE].make_empty */
extern T0* T494c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].default_create */
extern T0* T493c3(GE_context* ac);
/* detachable KL_EQUALITY_TESTER [GEANT_REDEFINE].default_create */
extern T0* T491c1(GE_context* ac);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].set_key_equality_tester */
extern void T398f38(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_map_equal */
extern T0* T398c36(GE_context* ac, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_with_equality_testers */
extern void T398f40(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_sparse_container */
extern void T398f47(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].set_internal_cursor */
extern void T398f56(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_slots */
extern void T398f55(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_clashes */
extern void T398f54(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_key_storage */
extern void T398f53(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_item_storage */
extern void T398f52(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].make */
extern T0* T488f2(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_RENAME].make_empty */
extern T0* T489c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].default_create */
extern T0* T488c3(GE_context* ac);
/* detachable KL_EQUALITY_TESTER [GEANT_RENAME].default_create */
extern T0* T486c1(GE_context* ac);
/* GEANT_PARENT_ELEMENT.interpreting_element_make */
extern void T275f23(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.set_project */
extern void T275f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.element_make */
extern void T275f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.set_xml_element */
extern void T275f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.elements_by_name */
extern T0* T165f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.string_ */
extern T0* T165f9(GE_context* ac, T0* C);
/* GEANT_INHERIT_ELEMENT.parent_element_name */
extern unsigned char ge85os6835;
extern T0* ge85ov6835;
extern T0* T165f5(GE_context* ac, T0* C);
/* GEANT_INHERIT.make */
extern T0* T166c6(GE_context* ac, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].make */
extern T0* T251c12(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].set_internal_cursor */
extern void T251f14(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].make */
extern T0* T386f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_PARENT].make_empty */
extern T0* T387c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].default_create */
extern T0* T386c3(GE_context* ac);
/* GEANT_INHERIT_ELEMENT.interpreting_element_make */
extern void T165f12(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.set_project */
extern void T165f15(GE_context* ac, T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.element_make */
extern void T165f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.set_xml_element */
extern void T165f17(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.inherit_element_name */
extern unsigned char ge93os3057;
extern T0* ge93ov3057;
extern T0* T37f16(GE_context* ac, T0* C);
/* GEANT_PROJECT.set_inherit_clause */
extern void T29f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.make_old */
extern T0* T165c10(GE_context* ac, T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.make_old */
extern T0* T275c21(GE_context* ac, T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.inherit_attribute_name */
extern unsigned char ge92os8533;
extern T0* ge92ov8533;
extern T0* T275f13(GE_context* ac, T0* C);
/* GEANT_PROJECT.set_old_inherit */
extern void T29f41(GE_context* ac, T0* C, T1 a1);
/* GEANT_PROJECT_ELEMENT.has_inherit_element */
extern T1 T37f15(GE_context* ac, T0* C);
/* GEANT_PROJECT_ELEMENT.inherit_attribute_name */
extern unsigned char ge93os3056;
extern T0* ge93ov3056;
extern T0* T37f14(GE_context* ac, T0* C);
/* GEANT_PROJECT.set_targets */
extern void T29f40(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].forth */
extern void T164f10(GE_context* ac, T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_forth */
extern void T163f11(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].add_traversing_cursor */
extern void T163f12(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].set_next_cursor */
extern void T164f12(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].remove_traversing_cursor */
extern void T163f13(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].set */
extern void T164f11(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* GEANT_TARGET.make */
extern T0* T33c63(GE_context* ac, T0* a1, T0* a2);
/* GEANT_TARGET.initialize */
extern void T33f64(GE_context* ac, T0* C);
/* GEANT_TARGET.initialize */
extern void T33f64p1(GE_context* ac, T0* C);
/* GEANT_TARGET.set_description */
extern void T33f72(GE_context* ac, T0* C, T0* a1);
/* GEANT_GLOBAL_ELEMENT.name */
extern T0* T256f2(GE_context* ac, T0* C);
/* GEANT_GLOBAL_ELEMENT.attribute_value */
extern T0* T256f5(GE_context* ac, T0* C, T0* a1);
/* GEANT_GLOBAL_ELEMENT.name_attribute_name */
extern unsigned char ge90os8270;
extern T0* ge90ov8270;
extern T0* T256f3(GE_context* ac, T0* C);
/* GEANT_GLOBAL_ELEMENT.has_name */
extern T1 T256f6(GE_context* ac, T0* C);
/* GEANT_GLOBAL_ELEMENT.has_attribute */
extern T1 T256f4(GE_context* ac, T0* C, T0* a1);
/* GEANT_GLOBAL_ELEMENT.make */
extern T0* T256c7(GE_context* ac, T0* a1);
/* GEANT_GLOBAL_ELEMENT.set_xml_element */
extern void T256f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_LOCAL_ELEMENT.name */
extern T0* T255f2(GE_context* ac, T0* C);
/* GEANT_LOCAL_ELEMENT.attribute_value */
extern T0* T255f5(GE_context* ac, T0* C, T0* a1);
/* GEANT_LOCAL_ELEMENT.name_attribute_name */
extern T0* T255f3(GE_context* ac, T0* C);
/* GEANT_LOCAL_ELEMENT.has_name */
extern T1 T255f6(GE_context* ac, T0* C);
/* GEANT_LOCAL_ELEMENT.has_attribute */
extern T1 T255f4(GE_context* ac, T0* C, T0* a1);
/* GEANT_LOCAL_ELEMENT.make */
extern T0* T255c7(GE_context* ac, T0* a1);
/* GEANT_LOCAL_ELEMENT.set_xml_element */
extern void T255f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.empty_variables */
extern unsigned char ge10os1958;
extern T0* ge10ov1958;
extern T0* T33f18(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_ELEMENT.name */
extern T0* T254f2(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_ELEMENT.attribute_value */
extern T0* T254f5(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_ELEMENT.name_attribute_name */
extern T0* T254f3(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_ELEMENT.has_name */
extern T1 T254f6(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_ELEMENT.has_attribute */
extern T1 T254f4(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_ELEMENT.make */
extern T0* T254c7(GE_context* ac, T0* a1);
/* GEANT_ARGUMENT_ELEMENT.set_xml_element */
extern void T254f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.elements_by_name */
extern T0* T33f16(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.empty_argument_variables */
extern unsigned char ge10os1959;
extern T0* ge10ov1959;
extern T0* T33f42(GE_context* ac, T0* C);
/* GEANT_TARGET.set_execute_once */
extern void T33f71(GE_context* ac, T0* C, T1 a1);
/* GEANT_TARGET.boolean_value */
extern T1 T33f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.false_attribute_value */
extern unsigned char ge78os2926;
extern T0* ge78ov2926;
extern T0* T33f38(GE_context* ac, T0* C);
/* GEANT_TARGET.true_attribute_value */
extern unsigned char ge78os2925;
extern T0* ge78ov2925;
extern T0* T33f37(GE_context* ac, T0* C);
/* GEANT_TARGET.attribute_value */
extern T0* T33f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.once_attribute_name */
extern unsigned char ge12os2880;
extern T0* ge12ov2880;
extern T0* T33f27(GE_context* ac, T0* C);
/* GEANT_TARGET.set_exports */
extern void T33f70(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].set_equality_tester */
extern void T110f37(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].put */
extern void T110f29(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [detachable STRING_8].move_cursors_right */
extern void T110f34(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [detachable STRING_8].move_right */
extern void T110f33(GE_context* ac, T0* C, T6 a1, T6 a2);
/* GEANT_TARGET.export_attribute_name */
extern unsigned char ge12os2879;
extern T0* ge12ov2879;
extern T0* T33f20(GE_context* ac, T0* C);
/* GEANT_TARGET.set_obsolete_message */
extern void T33f69(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.set_name */
extern void T33f68(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.name_attribute_name */
extern unsigned char ge12os2876;
extern T0* ge12ov2876;
extern T0* T33f39(GE_context* ac, T0* C);
/* GEANT_TARGET.make */
extern void T33f63p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_TARGET.set_project */
extern void T33f66(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.element_make */
extern void T33f65(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.set_xml_element */
extern void T33f73(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].item */
extern T0* T164f6(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].start */
extern void T164f9(GE_context* ac, T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_start */
extern void T163f10(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_off */
extern T1 T163f6(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].off */
extern T1 T164f7(GE_context* ac, T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].new_cursor */
extern T0* T163f5(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].make */
extern T0* T164c8(GE_context* ac, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].set_key_equality_tester */
extern void T38f43(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_map */
extern T0* T38c42(GE_context* ac, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_with_equality_testers */
extern void T38f46(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_sparse_container */
extern void T38f54(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].set_internal_cursor */
extern void T38f63(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_slots */
extern void T38f62(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_clashes */
extern void T38f61(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_key_storage */
extern void T38f60(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_item_storage */
extern void T38f59(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_ELEMENT.elements_by_name */
extern T0* T37f11(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.string_ */
extern T0* T37f19(GE_context* ac, T0* C);
/* GEANT_PROJECT_ELEMENT.target_element_name */
extern unsigned char ge93os3059;
extern T0* ge93ov3059;
extern T0* T37f10(GE_context* ac, T0* C);
/* GEANT_PROJECT.set_default_target_name */
extern void T29f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.default_attribute_name */
extern unsigned char ge93os3055;
extern T0* ge93ov3055;
extern T0* T37f9(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.basename */
extern T0* T92f24(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_root_directory */
extern T1 T92f25(GE_context* ac, T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.basename */
extern T0* T93f21(GE_context* ac, T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.is_root_directory */
extern T1 T93f22(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.dirname */
extern T0* T92f23(GE_context* ac, T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.dirname */
extern T0* T93f20(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.unix_file_system */
extern T0* T37f8(GE_context* ac, T0* C);
/* GEANT_PROJECT_ELEMENT.file_system */
extern T0* T37f7(GE_context* ac, T0* C);
/* GEANT_PROJECT_ELEMENT.windows_file_system */
extern T0* T37f18(GE_context* ac, T0* C);
/* GEANT_PROJECT_ELEMENT.operating_system */
extern T0* T37f17(GE_context* ac, T0* C);
/* GEANT_PROJECT.set_description */
extern void T29f37(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.has_element_by_name */
extern T1 T144f10(GE_context* ac, T0* C, T0* a1);
extern T1 T144f10ot1(T0* a1, T0** a2);
/* GEANT_PROJECT_ELEMENT.description_element_name */
extern T0* T37f6(GE_context* ac, T0* C);
/* GEANT_PROJECT_ELEMENT.attribute_value */
extern T0* T37f4(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.exit_application */
extern void T37f22(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_PROJECT_ELEMENT.exceptions */
extern T0* T37f13(GE_context* ac, T0* C);
/* GEANT_PROJECT_ELEMENT.std */
extern T0* T37f12(GE_context* ac, T0* C);
/* GEANT_PROJECT_ELEMENT.log_messages */
extern void T37f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.has_attribute */
extern T1 T37f3(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.name_attribute_name */
extern unsigned char ge93os3054;
extern T0* ge93ov3054;
extern T0* T37f5(GE_context* ac, T0* C);
/* GEANT_PROJECT.make */
extern T0* T29c30(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* GEANT_TASK_FACTORY.make */
extern T0* T248c55(GE_context* ac, T0* a1);
/* GEANT_TASK_FACTORY.create_builders */
extern void T248f56(GE_context* ac, T0* C);
/* Creation of agent #1 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac1(T0* a1);
/* Creation of agent #2 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac2(T0* a1);
/* Creation of agent #3 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac3(T0* a1);
/* Creation of agent #4 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac4(T0* a1);
/* Creation of agent #5 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac5(T0* a1);
/* Creation of agent #6 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac6(T0* a1);
/* Creation of agent #7 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac7(T0* a1);
/* Creation of agent #8 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac8(T0* a1);
/* Creation of agent #9 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac9(T0* a1);
/* Creation of agent #10 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac10(T0* a1);
/* Creation of agent #11 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac11(T0* a1);
/* Creation of agent #12 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac12(T0* a1);
/* Creation of agent #13 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac13(T0* a1);
/* Creation of agent #14 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac14(T0* a1);
/* Creation of agent #15 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac15(T0* a1);
/* Creation of agent #16 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac16(T0* a1);
/* Creation of agent #17 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac17(T0* a1);
/* Creation of agent #18 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac18(T0* a1);
/* Creation of agent #19 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac19(T0* a1);
/* Creation of agent #20 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac20(T0* a1);
/* Creation of agent #21 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac21(T0* a1);
/* Creation of agent #22 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac22(T0* a1);
/* Creation of agent #23 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac23(T0* a1);
/* Creation of agent #24 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac24(T0* a1);
/* Creation of agent #25 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T248f56ac25(T0* a1);
/* GEANT_TASK_FACTORY.new_replace_task */
extern T0* T248f52(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.make */
extern T0* T384c31(GE_context* ac, T0* a1, T0* a2);
/* GEANT_REPLACE_COMMAND.set_fileset */
extern void T481f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.make */
extern T0* T426c29(GE_context* ac, T0* a1, T0* a2);
/* GEANT_FILESET.set_map */
extern void T432f47(GE_context* ac, T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.make */
extern T0* T511c12(GE_context* ac, T0* a1, T0* a2);
/* GEANT_MAP.set_map */
extern void T512f21(GE_context* ac, T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.map_element_name */
extern unsigned char ge89os10113;
extern T0* ge89ov10113;
extern T0* T511f9(GE_context* ac, T0* C);
/* GEANT_MAP.set_target_pattern */
extern void T512f20(GE_context* ac, T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.to_attribute_name */
extern unsigned char ge89os10112;
extern T0* ge89ov10112;
extern T0* T511f7(GE_context* ac, T0* C);
/* GEANT_MAP.set_source_pattern */
extern void T512f19(GE_context* ac, T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.from_attribute_name */
extern unsigned char ge89os10111;
extern T0* ge89ov10111;
extern T0* T511f6(GE_context* ac, T0* C);
/* GEANT_MAP.set_type */
extern void T512f18(GE_context* ac, T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.attribute_value */
extern T0* T511f5(GE_context* ac, T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.project_variables_resolver */
extern T0* T511f11(GE_context* ac, T0* C);
/* GEANT_MAP_ELEMENT.has_attribute */
extern T1 T511f10(GE_context* ac, T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.type_attribute_name */
extern unsigned char ge89os10110;
extern T0* ge89ov10110;
extern T0* T511f8(GE_context* ac, T0* C);
/* GEANT_MAP.make */
extern T0* T512c17(GE_context* ac, T0* a1);
/* GEANT_MAP.type_attribute_value_identity */
extern unsigned char ge88os10126;
extern T0* ge88ov10126;
extern T0* T512f13(GE_context* ac, T0* C);
/* GEANT_MAP_ELEMENT.make */
extern void T511f12p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_MAP_ELEMENT.set_project */
extern void T511f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.element_make */
extern void T511f13(GE_context* ac, T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.set_xml_element */
extern void T511f15(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.map_element_name */
extern unsigned char ge81os9964;
extern T0* ge81ov9964;
extern T0* T426f21(GE_context* ac, T0* C);
/* GEANT_FILESET.add_single_exclude */
extern void T432f46(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].force_last */
extern void T517f34(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].slots_put */
extern void T517f45(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING_8].clashes_put */
extern void T517f44(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING_8].slots_item */
extern T6 T517f19(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].hash_position */
extern T6 T517f17(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].resize */
extern void T517f43(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].clashes_resize */
extern void T517f49(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].special_integer_ */
extern T0* T517f26(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].key_storage_resize */
extern void T517f48(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_resize */
extern void T517f47(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].key_storage_item */
extern T0* T517f25(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_item */
extern T0* T517f28(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].clashes_item */
extern T6 T517f23(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].slots_resize */
extern void T517f46(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].new_modulus */
extern T6 T517f18(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].new_capacity */
extern T6 T517f27(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_put */
extern void T517f42(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [STRING_8].search_position */
extern void T517f41(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].key_equality_tester */
extern T0* T517f22(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].unset_found_item */
extern void T517f39(GE_context* ac, T0* C);
/* GEANT_FILESET_ELEMENT.exclude_element_name */
extern unsigned char ge81os9963;
extern T0* ge81ov9963;
extern T0* T426f19(GE_context* ac, T0* C);
/* GEANT_FILESET.add_single_include */
extern void T432f45(GE_context* ac, T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.name */
extern T0* T440f4(GE_context* ac, T0* C);
/* GEANT_DEFINE_ELEMENT.attribute_value */
extern T0* T440f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.project_variables_resolver */
extern T0* T440f6(GE_context* ac, T0* C);
/* GEANT_DEFINE_ELEMENT.name_attribute_name */
extern T0* T440f13(GE_context* ac, T0* C);
/* GEANT_DEFINE_ELEMENT.has_name */
extern T1 T440f10(GE_context* ac, T0* C);
/* GEANT_DEFINE_ELEMENT.has_attribute */
extern T1 T440f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.is_enabled */
extern T1 T440f7(GE_context* ac, T0* C);
/* GEANT_DEFINE_ELEMENT.unless_attribute_name */
extern T0* T440f11(GE_context* ac, T0* C);
/* GEANT_DEFINE_ELEMENT.if_attribute_name */
extern T0* T440f8(GE_context* ac, T0* C);
/* GEANT_DEFINE_ELEMENT.make */
extern T0* T440c16(GE_context* ac, T0* a1, T0* a2);
/* GEANT_DEFINE_ELEMENT.set_project */
extern void T440f18(GE_context* ac, T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.element_make */
extern void T440f17(GE_context* ac, T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.set_xml_element */
extern void T440f19(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.elements_by_name */
extern T0* T426f18(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.string_ */
extern T0* T426f26(GE_context* ac, T0* C);
/* GEANT_FILESET_ELEMENT.include_element_name */
extern unsigned char ge81os9962;
extern T0* ge81ov9962;
extern T0* T426f17(GE_context* ac, T0* C);
/* GEANT_FILESET.set_convert_to_filesystem */
extern void T432f44(GE_context* ac, T0* C, T1 a1);
/* GEANT_FILESET_ELEMENT.convert_attribute_name */
extern unsigned char ge81os9960;
extern T0* ge81ov9960;
extern T0* T426f16(GE_context* ac, T0* C);
/* GEANT_FILESET.set_mapped_filename_directory_name */
extern void T432f43(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET.set_filename_directory_name */
extern void T432f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET.set_mapped_filename_variable_name */
extern void T432f41(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.mapped_filename_variable_name_attribute_name */
extern unsigned char ge81os9958;
extern T0* ge81ov9958;
extern T0* T426f15(GE_context* ac, T0* C);
/* GEANT_FILESET.set_filename_variable_name */
extern void T432f40(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.filename_variable_name_attribute_name */
extern unsigned char ge81os9957;
extern T0* ge81ov9957;
extern T0* T426f14(GE_context* ac, T0* C);
/* GEANT_FILESET.set_concat */
extern void T432f39(GE_context* ac, T0* C, T1 a1);
/* GEANT_FILESET.set_force */
extern void T432f38(GE_context* ac, T0* C, T1 a1);
/* GEANT_FILESET_ELEMENT.boolean_value */
extern T1 T426f13(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.std */
extern T0* T426f23(GE_context* ac, T0* C);
/* GEANT_FILESET_ELEMENT.false_attribute_value */
extern T0* T426f28(GE_context* ac, T0* C);
/* GEANT_FILESET_ELEMENT.true_attribute_value */
extern T0* T426f27(GE_context* ac, T0* C);
/* GEANT_FILESET_ELEMENT.force_attribute_name */
extern unsigned char ge81os9955;
extern T0* ge81ov9955;
extern T0* T426f12(GE_context* ac, T0* C);
/* GEANT_FILESET.set_exclude_wc_string */
extern void T432f37(GE_context* ac, T0* C, T0* a1);
/* LX_DFA_WILDCARD.is_compiled */
extern T1 T519f13(GE_context* ac, T0* C);
/* LX_DFA_WILDCARD.compile */
extern T0* T519c16(GE_context* ac, T0* a1, T1 a2);
/* LX_FULL_DFA.make */
extern T0* T560c37(GE_context* ac, T0* a1);
/* LX_FULL_DFA.build */
extern void T560f40(GE_context* ac, T0* C);
/* LX_FULL_DFA.build_accept_table */
extern void T560f46(GE_context* ac, T0* C);
/* ARRAY [INTEGER_32].put */
extern void T263f12(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [LX_RULE].first */
extern T0* T573f6(GE_context* ac, T0* C);
/* ARRAY [INTEGER_32].make_filled */
extern T0* T263c9(GE_context* ac, T6 a1, T6 a2, T6 a3);
/* ARRAY [INTEGER_32].make_filled_area */
extern void T263f10(GE_context* ac, T0* C, T6 a1, T6 a2);
/* LX_FULL_DFA.build_nxt_table */
extern void T560f45(GE_context* ac, T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].target */
extern T0* T604f6(GE_context* ac, T0* C, T6 a1);
/* ARRAY [detachable LX_DFA_STATE].item */
extern T0* T651f4(GE_context* ac, T0* C, T6 a1);
/* LX_DFA_STATE.is_accepting */
extern T1 T598f10(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [LX_RULE].is_empty */
extern T1 T573f11(GE_context* ac, T0* C);
/* LX_FULL_DFA.build_transitions */
extern void T560f44(GE_context* ac, T0* C, T0* a1);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].set_target */
extern void T604f8(GE_context* ac, T0* C, T0* a1, T6 a2);
/* ARRAY [detachable LX_DFA_STATE].put */
extern void T651f7(GE_context* ac, T0* C, T0* a1, T6 a2);
/* LX_SYMBOL_PARTITIONS.previous_symbol */
extern T6 T601f4(GE_context* ac, T0* C, T6 a1);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].item */
extern T0* T633f4(GE_context* ac, T0* C, T6 a1);
/* LX_FULL_DFA.new_state */
extern T0* T560f36(GE_context* ac, T0* C, T0* a1);
/* LX_DFA_STATE.set_id */
extern void T598f17(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].put_last */
extern void T600f9(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].force */
extern void T648f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [LX_DFA_STATE].fill_with */
extern void T647f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [LX_DFA_STATE].extend */
extern void T647f9(GE_context* ac, T0* C, T0* a1);
/* LX_DFA_STATE.is_equal */
extern T1 T598f11(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].is_equal */
extern T1 T599f16(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].any_ */
extern T0* T599f17(GE_context* ac, T0* C);
/* LX_DFA_STATE.any_ */
extern T0* T598f14(GE_context* ac, T0* C);
/* LX_DFA_STATE.new_state */
extern T0* T598f9(GE_context* ac, T0* C, T6 a1);
/* LX_DFA_STATE.make */
extern T0* T598c16(GE_context* ac, T0* a1, T6 a2, T6 a3);
extern T1 T598f16ot1(T0* a1, T0** a2);
/* LX_RULE.set_useful */
extern void T585f22(GE_context* ac, T0* C, T1 a1);
/* DS_ARRAYED_LIST [LX_RULE].sort */
extern void T573f17(GE_context* ac, T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_RULE].sort */
extern void T640f3(GE_context* ac, T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_RULE].sort_with_comparator */
extern void T640f4(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [LX_RULE].subsort_with_comparator */
extern void T640f5(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* DS_ARRAYED_LIST [LX_RULE].replace */
extern void T573f22(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [LX_RULE].less_than */
extern T1 T663f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* LX_RULE.is_less */
extern T1 T585f13(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].item */
extern T0* T573f10(GE_context* ac, T0* C, T6 a1);
/* LX_DFA_STATE.rule_sorter */
extern unsigned char ge263os11990;
extern T0* ge263ov11990;
extern T0* T598f7(GE_context* ac, T0* C);
/* DS_BUBBLE_SORTER [LX_RULE].make */
extern T0* T640c2(GE_context* ac, T0* a1);
/* KL_COMPARABLE_COMPARATOR [LX_RULE].make */
extern T0* T663c2(GE_context* ac);
/* DS_ARRAYED_LIST [LX_NFA_STATE].sort */
extern void T599f25(GE_context* ac, T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].sort */
extern void T638f3(GE_context* ac, T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].sort_with_comparator */
extern void T638f4(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].subsort_with_comparator */
extern void T638f5(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* DS_ARRAYED_LIST [LX_NFA_STATE].replace */
extern void T599f22(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE].less_than */
extern T1 T666f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* LX_NFA_STATE.is_less */
extern T1 T607f9(GE_context* ac, T0* C, T0* a1);
/* LX_DFA_STATE.bubble_sorter */
extern unsigned char ge263os11989;
extern T0* ge263ov11989;
extern T0* T598f8(GE_context* ac, T0* C);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].make */
extern T0* T638c2(GE_context* ac, T0* a1);
/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE].make */
extern T0* T666c2(GE_context* ac);
/* DS_ARRAYED_LIST [LX_NFA_STATE].last */
extern T0* T599f9(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].is_empty */
extern T1 T599f8(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [LX_RULE].force_last */
extern void T573f13(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].force */
extern void T620f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [LX_RULE].fill_with */
extern void T597f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [LX_RULE].extend */
extern void T597f9(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].resize */
extern void T573f15(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].aliased_resized_area */
extern T0* T620f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_RULE].aliased_resized_area */
extern T0* T597f4(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].new_capacity */
extern T6 T573f9(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].extendible */
extern T1 T573f8(GE_context* ac, T0* C, T6 a1);
/* LX_NFA_STATE.is_accepting_head */
extern T1 T607f6(GE_context* ac, T0* C);
/* LX_NFA_STATE.has_transition */
extern T1 T607f8(GE_context* ac, T0* C);
/* LX_NFA_STATE.is_accepting */
extern T1 T607f7(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].has */
extern T1 T599f7(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].force_last */
extern void T599f23(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].force */
extern void T644f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [LX_NFA_STATE].fill_with */
extern void T642f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [LX_NFA_STATE].extend */
extern void T642f8(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].resize */
extern void T599f28(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].aliased_resized_area */
extern T0* T644f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_NFA_STATE].aliased_resized_area */
extern T0* T642f4(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].new_capacity */
extern T6 T599f12(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].extendible */
extern T1 T599f11(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].make */
extern T0* T573c12(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].set_internal_cursor */
extern void T573f14(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].new_cursor */
extern T0* T573f7(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_RULE].make */
extern T0* T621c4(GE_context* ac, T0* a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].make */
extern T0* T620f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [LX_RULE].make_empty */
extern void T597f7(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [LX_RULE].make_empty */
extern T0* T597c7(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].default_create */
extern T0* T620c3(GE_context* ac);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].make */
extern T0* T604c7(GE_context* ac, T6 a1, T6 a2);
/* KL_ARRAY_ROUTINES [detachable LX_DFA_STATE].default_create */
extern T0* T652c1(GE_context* ac);
/* ARRAY [detachable LX_DFA_STATE].make_filled */
extern T0* T651c5(GE_context* ac, T0* a1, T6 a2, T6 a3);
/* ARRAY [detachable LX_DFA_STATE].make_filled_area */
extern void T651f6(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_DFA_STATE].make_filled */
extern T0* T647c8(GE_context* ac, T0* a1, T6 a2);
/* SPECIAL [LX_DFA_STATE].make_empty */
extern void T647f5(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [LX_DFA_STATE].make_empty */
extern T0* T647c5(GE_context* ac, T6 a1);
/* LX_DFA_STATE.maximum_symbol */
extern T6 T598f13(GE_context* ac, T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].upper */
extern T6 T604f5(GE_context* ac, T0* C);
/* LX_DFA_STATE.minimum_symbol */
extern T6 T598f12(GE_context* ac, T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].lower */
extern T6 T604f4(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put_last */
extern void T599f20(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].item */
extern T0* T599f13(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].make */
extern T0* T599c19(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].set_internal_cursor */
extern void T599f26(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].new_cursor */
extern T0* T599f10(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].make */
extern T0* T645c9(GE_context* ac, T0* a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].make */
extern T0* T644f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [LX_NFA_STATE].make_empty */
extern T0* T642c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].default_create */
extern T0* T644c3(GE_context* ac);
/* LX_SYMBOL_PARTITIONS.is_representative */
extern T1 T601f8(GE_context* ac, T0* C, T6 a1);
/* ARRAY [BOOLEAN].item */
extern T1 T545f4(GE_context* ac, T0* C, T6 a1);
/* LX_DFA_STATE.partition */
extern void T598f18(GE_context* ac, T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.initialize */
extern void T601f10(GE_context* ac, T0* C);
/* ARRAY [BOOLEAN].clear_all */
extern void T545f7(GE_context* ac, T0* C);
/* LX_SYMBOL_PARTITIONS.initialize */
extern void T601f10p1(GE_context* ac, T0* C);
/* DS_BILINKABLE [INTEGER_32].put_left */
extern void T634f9(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].attach_right */
extern void T634f10(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].put */
extern void T634f5(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.lower */
extern T6 T601f7(GE_context* ac, T0* C);
/* LX_SYMBOL_PARTITIONS.upper */
extern T6 T601f6(GE_context* ac, T0* C);
/* LX_FULL_DFA.resize */
extern void T560f49(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].resize */
extern void T600f10(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].aliased_resized_area */
extern T0* T648f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_DFA_STATE].aliased_resized_area */
extern T0* T647f4(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.capacity */
extern T6 T601f5(GE_context* ac, T0* C);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].count */
extern T6 T633f5(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [LX_DFA_STATE].item */
extern T0* T600f7(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.make */
extern T0* T601c9(GE_context* ac, T6 a1, T6 a2);
/* LX_SYMBOL_PARTITIONS.make */
extern void T601f9p1(GE_context* ac, T0* C, T6 a1, T6 a2);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].put */
extern void T633f7(GE_context* ac, T0* C, T0* a1, T6 a2);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].make_filled */
extern T0* T633c6(GE_context* ac, T0* a1, T6 a2, T6 a3);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].make_filled_area */
extern void T633f8(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKABLE [INTEGER_32]].make_filled */
extern T0* T635c4(GE_context* ac, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKABLE [INTEGER_32]].fill_with */
extern void T635f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKABLE [INTEGER_32]].extend */
extern void T635f8(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [DS_BILINKABLE [INTEGER_32]].make_empty */
extern void T635f6(GE_context* ac, T0* C, T6 a1);
/* DS_BILINKABLE [INTEGER_32].make */
extern T0* T634c4(GE_context* ac, T6 a1);
/* ARRAY [BOOLEAN].make_filled */
extern T0* T545c5(GE_context* ac, T1 a1, T6 a2, T6 a3);
/* ARRAY [BOOLEAN].make_filled_area */
extern void T545f8(GE_context* ac, T0* C, T1 a1, T6 a2);
/* LX_FULL_DFA.put_eob_state */
extern void T560f39(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [LX_RULE].force_first */
extern void T573f16(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].put */
extern void T573f18(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [LX_RULE].move_cursors_right */
extern void T573f21(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_RULE].set_position */
extern void T621f5(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].move_right */
extern void T573f20(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [LX_RULE].put_last */
extern void T573f19(GE_context* ac, T0* C, T0* a1);
/* LX_RULE.make_default */
extern T0* T585c14(GE_context* ac, T6 a1);
/* LX_RULE.dummy_action */
extern unsigned char ge343os12295;
extern T0* ge343ov12295;
extern T0* T585f11(GE_context* ac, T0* C);
/* LX_ACTION.make */
extern T0* T637c2(GE_context* ac, T0* a1);
/* LX_RULE.dummy_pattern */
extern unsigned char ge343os12294;
extern T0* ge343ov12294;
extern T0* T585f12(GE_context* ac, T0* C);
/* LX_NFA.make_epsilon */
extern T0* T582c12(GE_context* ac, T1 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put_first */
extern void T599f21(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put */
extern void T599f27(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [LX_NFA_STATE].move_cursors_right */
extern void T599f31(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_position */
extern void T645f10(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].move_right */
extern void T599f30(GE_context* ac, T0* C, T6 a1, T6 a2);
/* LX_NFA_STATE.set_transition */
extern void T607f11(GE_context* ac, T0* C, T0* a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].make */
extern T0* T630c3(GE_context* ac, T0* a1);
/* LX_NFA_STATE.make */
extern T0* T607c10(GE_context* ac, T1 a1);
/* LX_FULL_DFA.initialize */
extern void T560f38(GE_context* ac, T0* C, T0* a1);
/* LX_FULL_DFA.initialize_dfa */
extern void T560f43(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* LX_FULL_DFA.put_start_condition */
extern void T560f48(GE_context* ac, T0* C, T0* a1);
/* LX_NFA.start_state */
extern T0* T582f4(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].first */
extern T0* T599f14(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [LX_NFA].item */
extern T0* T605f7(GE_context* ac, T0* C, T6 a1);
/* LX_START_CONDITIONS.item */
extern T0* T574f9(GE_context* ac, T0* C, T6 a1);
/* LX_FULL_DFA.set_nfa_state_ids */
extern void T560f47(GE_context* ac, T0* C, T0* a1);
/* LX_NFA_STATE.set_id */
extern void T607f14(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].force */
extern void T606f35(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].key_storage_put */
extern void T606f43(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].slots_put */
extern void T606f42(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].clashes_put */
extern void T606f41(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].slots_item */
extern T6 T606f29(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].clashes_item */
extern T6 T606f28(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].hash_position */
extern T6 T606f22(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].resize */
extern void T606f40(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].clashes_resize */
extern void T606f48(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].special_integer_ */
extern T0* T606f31(GE_context* ac, T0* C);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].key_storage_resize */
extern void T606f47(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].aliased_resized_area */
extern T0* T106f3(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item_storage_resize */
extern void T606f46(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].aliased_resized_area */
extern T0* T581f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_NFA].aliased_resized_area */
extern T0* T583f4(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].key_storage_item */
extern T6 T606f21(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].slots_resize */
extern void T606f45(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].new_modulus */
extern T6 T606f25(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].new_capacity */
extern T6 T606f33(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item_storage_put */
extern void T606f39(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [LX_NFA].force */
extern void T581f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [LX_NFA].fill_with */
extern void T583f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [LX_NFA].extend */
extern void T583f10(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].search_position */
extern void T606f36(GE_context* ac, T0* C, T6 a1);
/* detachable KL_EQUALITY_TESTER [INTEGER_32].test */
extern T1 T552f1(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].unset_found_item */
extern void T606f38(GE_context* ac, T0* C);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item */
extern T0* T606f23(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item_storage_item */
extern T0* T606f32(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].has */
extern T1 T606f24(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make */
extern T0* T606c34(GE_context* ac, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_with_equality_testers */
extern void T606f37(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_sparse_container */
extern void T606f44(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].set_internal_cursor */
extern void T606f53(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].new_cursor */
extern T0* T606f30(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32].make */
extern T0* T655c4(GE_context* ac, T0* a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_slots */
extern void T606f52(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_clashes */
extern void T606f51(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_key_storage */
extern void T606f50(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_item_storage */
extern void T606f49(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].make */
extern T0* T581f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [LX_NFA].make_empty */
extern T0* T583c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].default_create */
extern T0* T581c3(GE_context* ac);
/* detachable KL_EQUALITY_TESTER [INTEGER_32].default_create */
extern T0* T552c2(GE_context* ac);
/* DS_ARRAYED_LIST [LX_DFA_STATE].make */
extern T0* T600c8(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].set_internal_cursor */
extern void T600f11(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].new_cursor */
extern T0* T600f6(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].make */
extern T0* T649c3(GE_context* ac, T0* a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].make */
extern T0* T648f1(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].default_create */
extern T0* T648c3(GE_context* ac);
/* LX_EQUIVALENCE_CLASSES.to_array */
extern T0* T584f6(GE_context* ac, T0* C, T6 a1, T6 a2);
/* LX_EQUIVALENCE_CLASSES.lower */
extern T6 T584f5(GE_context* ac, T0* C);
/* LX_EQUIVALENCE_CLASSES.upper */
extern T6 T584f4(GE_context* ac, T0* C);
/* LX_EQUIVALENCE_CLASSES.built */
extern T1 T584f3(GE_context* ac, T0* C);
/* LX_FULL_DFA.build_eof_rules */
extern void T560f42(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* ARRAY [LX_RULE].put */
extern void T596f5(GE_context* ac, T0* C, T0* a1, T6 a2);
/* ARRAY [LX_RULE].make_filled */
extern T0* T596c4(GE_context* ac, T0* a1, T6 a2, T6 a3);
/* ARRAY [LX_RULE].make_filled_area */
extern void T596f6(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_RULE].make_filled */
extern T0* T597c5(GE_context* ac, T0* a1, T6 a2);
/* ARRAY [STRING_8].count */
extern T6 T39f10(GE_context* ac, T0* C);
/* LX_FULL_DFA.build_rules */
extern void T560f41(GE_context* ac, T0* C, T0* a1);
/* KL_ARRAY_ROUTINES [LX_RULE].make_empty_with_lower */
extern T0* T602f1(GE_context* ac, T0* C, T6 a1);
/* ARRAY [LX_RULE].make_from_array */
extern T0* T596c8(GE_context* ac, T0* a1);
/* ARRAY [LX_RULE].set_area */
extern void T596f10(GE_context* ac, T0* C, T0* a1);
/* KL_ARRAY [LX_RULE].new_rebase */
extern void T650f5(GE_context* ac, T0* C, T6 a1);
/* KL_ARRAY [LX_RULE].make_empty */
extern T0* T650c4(GE_context* ac);
/* KL_ARRAY [LX_RULE].make_empty_area */
extern void T650f6(GE_context* ac, T0* C, T6 a1);
/* ARRAY [LX_RULE].make_empty */
extern T0* T596c7(GE_context* ac);
/* ARRAY [LX_RULE].make_empty_area */
extern void T596f9(GE_context* ac, T0* C, T6 a1);
/* KL_ARRAY_ROUTINES [LX_RULE].default_create */
extern T0* T602c2(GE_context* ac);
/* LX_START_CONDITIONS.names */
extern T0* T574f7(GE_context* ac, T0* C);
/* LX_START_CONDITIONS.first */
extern T0* T574f6(GE_context* ac, T0* C);
/* LX_START_CONDITIONS.string_array_routines */
extern unsigned char ge122os3378;
extern T0* ge122ov3378;
extern T0* T574f11(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.parse_string */
extern void T558f222(GE_context* ac, T0* C, T0* a1);
/* LX_WILDCARD_PARSER.parse */
extern void T558f226(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_pop_last_value */
extern void T558f239(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_push_error_value */
extern void T558f238(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [detachable ANY].force */
extern void T194f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [detachable ANY].fill_with */
extern void T195f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [detachable ANY].extend */
extern void T195f9(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [detachable ANY].aliased_resized_area */
extern T0* T194f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [detachable ANY].aliased_resized_area */
extern T0* T195f3(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_do_action */
extern void T558f237(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.append_character_to_string */
extern T0* T558f172(GE_context* ac, T0* C, T6 a1, T0* a2);
/* LX_WILDCARD_PARSER.new_symbol_nfa */
extern T0* T558f217(GE_context* ac, T0* C, T6 a1);
/* LX_NFA.make_symbol */
extern T0* T582c13(GE_context* ac, T6 a1, T1 a2);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].make */
extern T0* T632c4(GE_context* ac, T6 a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].force_new */
extern void T578f44(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].key_storage_put */
extern void T578f52(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item_storage_put */
extern void T578f48(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].slots_put */
extern void T578f51(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].clashes_put */
extern void T578f50(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].slots_item */
extern T6 T578f22(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].hash_position */
extern T6 T578f31(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].clashes_item */
extern T6 T578f21(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].resize */
extern void T578f49(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].clashes_resize */
extern void T578f57(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].special_integer_ */
extern T0* T578f34(GE_context* ac, T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].key_storage_resize */
extern void T578f56(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item_storage_resize */
extern void T578f55(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].key_storage_item */
extern T0* T578f26(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].slots_resize */
extern void T578f54(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].new_modulus */
extern T6 T578f29(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].new_capacity */
extern T6 T578f30(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].unset_found_item */
extern void T578f47(GE_context* ac, T0* C);
/* LX_EQUIVALENCE_CLASSES.add */
extern void T584f11(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].forget_right */
extern void T634f7(GE_context* ac, T0* C);
/* DS_BILINKABLE [INTEGER_32].forget_left */
extern void T634f8(GE_context* ac, T0* C);
/* ARRAY [BOOLEAN].put */
extern void T545f6(GE_context* ac, T0* C, T1 a1, T6 a2);
/* DS_BILINKABLE [INTEGER_32].put_right */
extern void T634f6(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].attach_left */
extern void T634f11(GE_context* ac, T0* C, T0* a1);
/* LX_SYMBOL_CLASS.item */
extern T6 T577f14(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_CLASS.put */
extern void T577f19(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_CLASS.force_last */
extern void T577f22(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_CLASS.resize */
extern void T577f23(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_CLASS.new_capacity */
extern T6 T577f13(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_CLASS.extendible */
extern T1 T577f11(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_CLASS.last */
extern T6 T577f12(GE_context* ac, T0* C);
/* LX_SYMBOL_CLASS.is_empty */
extern T1 T577f10(GE_context* ac, T0* C);
/* LX_SYMBOL_CLASS.has */
extern T1 T577f9(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_CLASS.arrayed_has */
extern T1 T577f15(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_CLASS.make */
extern T0* T577c18(GE_context* ac, T6 a1);
/* LX_SYMBOL_CLASS.set_internal_cursor */
extern void T577f21(GE_context* ac, T0* C, T0* a1);
/* LX_SYMBOL_CLASS.new_cursor */
extern T0* T577f16(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [INTEGER_32].make */
extern T0* T625c3(GE_context* ac, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].found_item */
extern T0* T578f24(GE_context* ac, T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item_storage_item */
extern T0* T578f32(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].found */
extern T1 T578f23(GE_context* ac, T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].search */
extern void T578f43(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].search_position */
extern void T578f45(GE_context* ac, T0* C, T0* a1);
/* KL_STRING_EQUALITY_TESTER.test */
extern T1 T548f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* LX_WILDCARD_PARSER.new_epsilon_nfa */
extern T0* T558f171(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.append_character_set_to_character_class */
extern T0* T558f170(GE_context* ac, T0* C, T6 a1, T6 a2, T0* a3);
/* LX_WILDCARD_PARSER.report_negative_range_in_character_class_error */
extern void T558f272(GE_context* ac, T0* C);
/* UT_ERROR_HANDLER.report_error */
extern void T35f11(GE_context* ac, T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_error_message */
extern void T35f12(GE_context* ac, T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_line */
extern void T562f4(GE_context* ac, T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_new_line */
extern void T562f6(GE_context* ac, T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_string */
extern void T562f5(GE_context* ac, T0* C, T0* a1);
/* UT_ERROR_HANDLER.message */
extern T0* T35f5(GE_context* ac, T0* C, T0* a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.make */
extern T0* T619c8(GE_context* ac, T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.filename */
extern T0* T558f190(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].aliased_resized_area */
extern T0* T579f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_SYMBOL_CLASS].aliased_resized_area */
extern T0* T580f4(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.append_character_to_character_class */
extern T0* T558f169(GE_context* ac, T0* C, T6 a1, T0* a2);
/* LX_WILDCARD_PARSER.new_character_class */
extern T0* T558f168(GE_context* ac, T0* C);
/* LX_SYMBOL_CLASS.set_negated */
extern void T577f20(GE_context* ac, T0* C, T1 a1);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].force */
extern void T579f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [LX_SYMBOL_CLASS].fill_with */
extern void T580f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [LX_SYMBOL_CLASS].extend */
extern void T580f10(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].force */
extern void T578f42(GE_context* ac, T0* C, T0* a1, T0* a2);
/* LX_WILDCARD_PARSER.new_nfa_from_character_class */
extern T0* T558f167(GE_context* ac, T0* C, T0* a1);
/* LX_SYMBOL_CLASS.sort */
extern void T577f24(GE_context* ac, T0* C);
/* LX_SYMBOL_CLASS.arrayed_sort */
extern void T577f25(GE_context* ac, T0* C, T0* a1);
/* DS_SHELL_SORTER [INTEGER_32].sort */
extern void T661f3(GE_context* ac, T0* C, T0* a1);
/* DS_SHELL_SORTER [INTEGER_32].sort_with_comparator */
extern void T661f4(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_SHELL_SORTER [INTEGER_32].subsort_with_comparator */
extern void T661f5(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* LX_SYMBOL_CLASS.replace */
extern void T577f27(GE_context* ac, T0* C, T6 a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [INTEGER_32].less_than */
extern T1 T672f1(GE_context* ac, T0* C, T6 a1, T6 a2);
/* LX_SYMBOL_CLASS.sorter */
extern unsigned char ge268os12329;
extern T0* ge268ov12329;
extern T0* T577f17(GE_context* ac, T0* C);
/* DS_SHELL_SORTER [INTEGER_32].make */
extern T0* T661c2(GE_context* ac, T0* a1);
/* KL_COMPARABLE_COMPARATOR [INTEGER_32].make */
extern T0* T672c2(GE_context* ac);
/* LX_WILDCARD_PARSER.new_symbol_class_nfa */
extern T0* T558f165(GE_context* ac, T0* C, T0* a1);
/* LX_NFA.make_symbol_class */
extern T0* T582c6(GE_context* ac, T0* a1, T1 a2);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].make */
extern T0* T628c4(GE_context* ac, T0* a1, T0* a2);
/* LX_WILDCARD_PARSER.question_character_class */
extern T0* T558f164(GE_context* ac, T0* C);
/* LX_NFA.build_optional */
extern void T582f11(GE_context* ac, T0* C);
/* LX_NFA_STATE.set_epsilon_transition */
extern void T607f12(GE_context* ac, T0* C, T0* a1);
/* LX_NFA.final_state */
extern T0* T582f5(GE_context* ac, T0* C);
/* LX_NFA.build_positive_closure */
extern void T582f10(GE_context* ac, T0* C);
/* LX_NFA.build_closure */
extern void T582f9(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.new_nfa_from_character */
extern T0* T558f163(GE_context* ac, T0* C, T6 a1);
/* LX_NFA.build_concatenation */
extern void T582f8(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].append_last */
extern void T599f24(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].extend_last */
extern void T599f29(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].forth */
extern void T645f12(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_forth */
extern void T599f33(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].add_traversing_cursor */
extern void T599f34(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_next_cursor */
extern void T645f14(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].remove_traversing_cursor */
extern void T599f35(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].item */
extern T0* T645f4(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_item */
extern T0* T599f15(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].after */
extern T1 T645f6(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].start */
extern void T645f11(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_start */
extern void T599f32(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_after */
extern void T645f13(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].off */
extern T1 T645f7(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].before */
extern T1 T645f8(GE_context* ac, T0* C);
/* LX_NFA.build_union */
extern void T582f7(GE_context* ac, T0* C, T0* a1);
/* LX_WILDCARD_PARSER.report_unrecognized_rule_error */
extern void T558f252(GE_context* ac, T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.make */
extern T0* T588c8(GE_context* ac, T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.process_rule */
extern void T558f251(GE_context* ac, T0* C, T0* a1);
/* LX_START_CONDITIONS.add_nfa_to_all */
extern void T574f13(GE_context* ac, T0* C, T0* a1);
/* LX_START_CONDITION.put_nfa */
extern void T603f7(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA].force_last */
extern void T605f12(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA].resize */
extern void T605f13(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA].new_capacity */
extern T6 T605f9(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA].extendible */
extern T1 T605f8(GE_context* ac, T0* C, T6 a1);
/* LX_START_CONDITIONS.add_nfa_to_non_exclusive */
extern void T574f15(GE_context* ac, T0* C, T0* a1);
/* LX_START_CONDITIONS.is_empty */
extern T1 T574f8(GE_context* ac, T0* C);
/* LX_DESCRIPTION.set_variable_trail_context */
extern void T559f35(GE_context* ac, T0* C, T1 a1);
/* LX_RULE.set_column_count */
extern void T585f21(GE_context* ac, T0* C, T6 a1);
/* LX_RULE.set_line_count */
extern void T585f20(GE_context* ac, T0* C, T6 a1);
/* LX_RULE.set_trail_count */
extern void T585f19(GE_context* ac, T0* C, T6 a1);
/* LX_RULE.set_head_count */
extern void T585f18(GE_context* ac, T0* C, T6 a1);
/* LX_RULE.set_trail_context */
extern void T585f17(GE_context* ac, T0* C, T1 a1);
/* LX_RULE.set_line_nb */
extern void T585f16(GE_context* ac, T0* C, T6 a1);
/* LX_RULE.set_pattern */
extern void T585f15(GE_context* ac, T0* C, T0* a1);
/* LX_NFA.set_accepted_rule */
extern void T582f14(GE_context* ac, T0* C, T0* a1);
/* LX_NFA_STATE.set_accepted_rule */
extern void T607f13(GE_context* ac, T0* C, T0* a1);
/* LX_DESCRIPTION.create_equiv_classes */
extern void T559f34(GE_context* ac, T0* C);
/* LX_EQUIVALENCE_CLASSES.make */
extern T0* T584c9(GE_context* ac, T6 a1, T6 a2);
/* LX_EQUIVALENCE_CLASSES.initialize */
extern void T584f12(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.check_options */
extern void T558f250(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.report_full_and_variable_trailing_context_error */
extern void T558f265(GE_context* ac, T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.make */
extern T0* T594c8(GE_context* ac);
/* LX_WILDCARD_PARSER.report_full_and_reject_error */
extern void T558f264(GE_context* ac, T0* C);
/* LX_FULL_AND_REJECT_ERROR.make */
extern T0* T593c8(GE_context* ac);
/* LX_WILDCARD_PARSER.report_full_and_meta_equiv_classes_error */
extern void T558f263(GE_context* ac, T0* C);
/* LX_FULL_AND_META_ERROR.make */
extern T0* T592c8(GE_context* ac);
/* LX_WILDCARD_PARSER.build_equiv_classes */
extern void T558f249(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].forth */
extern void T587f11(GE_context* ac, T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_forth */
extern void T578f64(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].add_traversing_cursor */
extern void T578f66(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].set_next_cursor */
extern void T587f14(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].set_position */
extern void T587f13(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].remove_traversing_cursor */
extern void T578f65(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].set_after */
extern void T587f12(GE_context* ac, T0* C);
/* LX_SYMBOL_CLASS.convert_to_equivalence */
extern void T577f26(GE_context* ac, T0* C, T0* a1);
/* LX_EQUIVALENCE_CLASSES.equivalence_class */
extern T6 T584f8(GE_context* ac, T0* C, T6 a1);
/* LX_EQUIVALENCE_CLASSES.is_representative */
extern T1 T584f7(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].item */
extern T0* T587f5(GE_context* ac, T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_item */
extern T0* T578f36(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].after */
extern T1 T587f7(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].start */
extern void T587f10(GE_context* ac, T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_start */
extern void T578f63(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_off */
extern T1 T578f39(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].off */
extern T1 T587f8(GE_context* ac, T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].is_empty */
extern T1 T578f38(GE_context* ac, T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].new_cursor */
extern T0* T578f35(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].make */
extern T0* T587c9(GE_context* ac, T0* a1);
/* LX_EQUIVALENCE_CLASSES.build */
extern void T584f10(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_push_last_value */
extern void T558f236(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.accept */
extern void T558f235(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_do_error_action */
extern void T558f233(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.report_error */
extern void T558f248(GE_context* ac, T0* C, T0* a1);
/* UT_SYNTAX_ERROR.make */
extern T0* T586c8(GE_context* ac, T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.report_eof_expected_error */
extern void T558f247(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.read_token */
extern void T558f232(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_execute_action */
extern void T558f246(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.report_bad_character_error */
extern void T558f262(GE_context* ac, T0* C, T0* a1);
/* LX_BAD_CHARACTER_ERROR.make */
extern T0* T591c8(GE_context* ac, T0* a1, T6 a2, T0* a3);
/* LX_WILDCARD_PARSER.report_bad_character_class_error */
extern void T558f261(GE_context* ac, T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.make */
extern T0* T590c8(GE_context* ac, T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.start_condition */
extern T6 T558f185(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.process_escaped_character */
extern void T558f260(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.text_count */
extern T6 T558f206(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.report_missing_quote_error */
extern void T558f259(GE_context* ac, T0* C);
/* LX_MISSING_QUOTE_ERROR.make */
extern T0* T589c8(GE_context* ac, T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.process_character */
extern void T558f258(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.report_character_out_of_range_error */
extern void T558f268(GE_context* ac, T0* C, T0* a1);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.make */
extern T0* T595c8(GE_context* ac, T0* a1, T6 a2, T0* a3);
/* LX_WILDCARD_PARSER.text_item */
extern T2 T558f182(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.less */
extern void T558f257(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_set_line_column */
extern void T558f267(GE_context* ac, T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item */
extern T0* T578f33(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].has */
extern T1 T578f27(GE_context* ac, T0* C, T0* a1);
/* LX_WILDCARD_PARSER.text */
extern T0* T558f176(GE_context* ac, T0* C);
/* KL_CHARACTER_BUFFER.substring */
extern T0* T413f3(GE_context* ac, T0* C, T6 a1, T6 a2);
/* LX_WILDCARD_PARSER.set_start_condition */
extern void T558f256(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_execute_eof_action */
extern void T558f245(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.terminate */
extern void T558f255(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.wrap */
extern T1 T558f149(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_refill_input_buffer */
extern void T558f244(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_set_content */
extern void T558f242(GE_context* ac, T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.count */
extern T6 T413f4(GE_context* ac, T0* C);
/* YY_BUFFER.fill */
extern void T279f15(GE_context* ac, T0* C);
/* YY_BUFFER.set_index */
extern void T279f13(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_null_trans_state */
extern T6 T558f148(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_previous_state */
extern T6 T558f147(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.fatal_error */
extern void T558f243(GE_context* ac, T0* C, T0* a1);
/* LX_WILDCARD_PARSER.std */
extern T0* T558f173(GE_context* ac, T0* C);
/* KL_CHARACTER_BUFFER.item */
extern T2 T413f6(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.special_integer_ */
extern T0* T558f129(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_init_value_stacks */
extern void T558f231(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_clear_all */
extern void T558f240(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.clear_all */
extern void T558f253(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.clear_stacks */
extern void T558f266(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_clear_value_stacks */
extern void T558f269(GE_context* ac, T0* C);
/* SPECIAL [LX_NFA].keep_head */
extern void T583f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [LX_NFA].set_count */
extern void T583f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [LX_SYMBOL_CLASS].keep_head */
extern void T580f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [LX_SYMBOL_CLASS].set_count */
extern void T580f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [INTEGER_32].keep_head */
extern void T95f16(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [INTEGER_32].set_count */
extern void T95f17(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [detachable ANY].keep_head */
extern void T195f5(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [detachable ANY].set_count */
extern void T195f8(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.abort */
extern void T558f234(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.set_input_buffer */
extern void T558f225(GE_context* ac, T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_load_input_buffer */
extern void T558f230(GE_context* ac, T0* C);
/* YY_BUFFER.set_position */
extern void T279f14(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* LX_WILDCARD_PARSER.new_string_buffer */
extern T0* T558f131(GE_context* ac, T0* C, T0* a1);
/* YY_BUFFER.make */
extern T0* T279c12(GE_context* ac, T0* a1);
/* YY_BUFFER.make_from_buffer */
extern void T279f16(GE_context* ac, T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.put */
extern void T413f9(GE_context* ac, T0* C, T2 a1, T6 a2);
/* KL_CHARACTER_BUFFER.fill_from_string */
extern void T413f8(GE_context* ac, T0* C, T0* a1, T6 a2);
/* STRING_8.subcopy */
extern void T17f58(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* YY_BUFFER.new_default_buffer */
extern T0* T279f11(GE_context* ac, T0* C, T6 a1);
/* KL_CHARACTER_BUFFER.make */
extern T0* T413c7(GE_context* ac, T6 a1);
/* STRING_8.make_filled */
extern T0* T17c57(GE_context* ac, T2 a1, T6 a2);
/* LX_WILDCARD_PARSER.make_from_description */
extern T0* T558c221(GE_context* ac, T0* a1, T0* a2);
/* DS_ARRAYED_STACK [INTEGER_32].make */
extern T0* T576c4(GE_context* ac, T6 a1);
/* LX_ACTION_FACTORY.make */
extern T0* T575c1(GE_context* ac);
/* LX_START_CONDITIONS.make */
extern void T574f12(GE_context* ac, T0* C, T6 a1);
/* LX_START_CONDITIONS.make */
extern T0* T574c12(GE_context* ac, T6 a1);
/* LX_START_CONDITIONS.set_internal_cursor */
extern void T574f16(GE_context* ac, T0* C, T0* a1);
/* LX_START_CONDITIONS.new_cursor */
extern T0* T574f10(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].make */
extern T0* T624c4(GE_context* ac, T0* a1);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].make */
extern T0* T623f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [LX_START_CONDITION].make_empty */
extern T0* T622c4(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].default_create */
extern T0* T623c2(GE_context* ac);
/* LX_WILDCARD_PARSER.make_parser_skeleton */
extern void T558f224(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_build_parser_tables */
extern void T558f229(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yycheck_template */
extern unsigned char ge328os11486;
extern T0* ge328ov11486;
extern T0* T558f160(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yyfixed_array */
extern T0* T558f211(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].to_special */
extern T0* T106f4(GE_context* ac, T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yytable_template */
extern unsigned char ge328os11485;
extern T0* ge328ov11485;
extern T0* T558f158(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yypgoto_template */
extern unsigned char ge328os11484;
extern T0* ge328ov11484;
extern T0* T558f157(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yypact_template */
extern unsigned char ge328os11483;
extern T0* ge328ov11483;
extern T0* T558f156(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yydefgoto_template */
extern unsigned char ge328os11482;
extern T0* ge328ov11482;
extern T0* T558f155(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yydefact_template */
extern unsigned char ge328os11481;
extern T0* ge328ov11481;
extern T0* T558f154(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yytypes2_template */
extern unsigned char ge328os11480;
extern T0* ge328ov11480;
extern T0* T558f153(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yytypes1_template */
extern unsigned char ge328os11479;
extern T0* ge328ov11479;
extern T0* T558f144(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yyr1_template */
extern unsigned char ge328os11478;
extern T0* ge328ov11478;
extern T0* T558f142(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yytranslate_template */
extern unsigned char ge328os11475;
extern T0* ge328ov11475;
extern T0* T558f140(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yytranslate_template_2 */
extern void T558f271(GE_context* ac, T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yyarray_subcopy */
extern void T558f275(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* KL_ARRAY_ROUTINES [INTEGER_32].subcopy */
extern void T269f2(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* ARRAY [INTEGER_32].subcopy */
extern void T263f11(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER_32].copy_data */
extern void T95f12(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER_32].force */
extern void T95f9(GE_context* ac, T0* C, T6 a1, T6 a2);
/* SPECIAL [INTEGER_32].move_data */
extern void T95f13(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].overlapping_move */
extern void T95f15(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].non_overlapping_move */
extern void T95f14(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* LX_WILDCARD_PARSER.integer_array_ */
extern unsigned char ge122os3375;
extern T0* ge122ov3375;
extern T0* T558f220(GE_context* ac, T0* C);
/* KL_ARRAY_ROUTINES [INTEGER_32].default_create */
extern T0* T269c1(GE_context* ac);
/* LX_WILDCARD_PARSER.yytranslate_template_1 */
extern void T558f270(GE_context* ac, T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_create_value_stacks */
extern void T558f228(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].make */
extern T0* T579f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [LX_SYMBOL_CLASS].make_empty */
extern T0* T580c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].default_create */
extern T0* T579c3(GE_context* ac);
/* KL_SPECIAL_ROUTINES [detachable ANY].make */
extern T0* T194f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [detachable ANY].make_empty */
extern T0* T195c4(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [detachable ANY].default_create */
extern T0* T194c3(GE_context* ac);
/* LX_WILDCARD_PARSER.make_lex_scanner_from_description */
extern void T558f223(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].set_key_equality_tester */
extern void T578f41(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_map */
extern T0* T578c40(GE_context* ac, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_with_equality_testers */
extern void T578f46(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_sparse_container */
extern void T578f53(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].set_internal_cursor */
extern void T578f62(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_slots */
extern void T578f61(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_clashes */
extern void T578f60(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_key_storage */
extern void T578f59(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_item_storage */
extern void T578f58(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_key_equality_tester */
extern void T120f41(GE_context* ac, T0* C, T0* a1);
/* LX_WILDCARD_PARSER.string_equality_tester */
extern unsigned char ge130os3372;
extern T0* ge130ov3372;
extern T0* T558f117(GE_context* ac, T0* C);
/* KL_STRING_EQUALITY_TESTER.default_create */
extern T0* T548c2(GE_context* ac);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map */
extern void T120f43(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map */
extern T0* T120c43(GE_context* ac, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_with_equality_testers */
extern void T120f44(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_sparse_container */
extern void T120f45(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_internal_cursor */
extern void T120f51(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_cursor */
extern T0* T120f39(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].unset_found_item */
extern void T120f50(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_slots */
extern void T120f49(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_modulus */
extern T6 T120f31(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_clashes */
extern void T120f48(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_key_storage */
extern void T120f47(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_item_storage */
extern void T120f46(GE_context* ac, T0* C, T6 a1);
/* LX_WILDCARD_PARSER.make_with_buffer */
extern void T558f227(GE_context* ac, T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_initialize */
extern void T558f241(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_initialize */
extern void T558f241p1(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_build_tables */
extern void T558f254(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_accept_template */
extern unsigned char ge329os11660;
extern T0* ge329ov11660;
extern T0* T558f198(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_fixed_array */
extern T0* T558f219(GE_context* ac, T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_meta_template */
extern unsigned char ge329os11659;
extern T0* ge329ov11659;
extern T0* T558f197(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_ec_template */
extern unsigned char ge329os11656;
extern T0* ge329ov11656;
extern T0* T558f196(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_ec_template_2 */
extern void T558f274(GE_context* ac, T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_array_subcopy */
extern void T558f276(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* LX_WILDCARD_PARSER.yy_ec_template_1 */
extern void T558f273(GE_context* ac, T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_def_template */
extern unsigned char ge329os11655;
extern T0* ge329ov11655;
extern T0* T558f195(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_base_template */
extern unsigned char ge329os11654;
extern T0* ge329ov11654;
extern T0* T558f194(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_chk_template */
extern unsigned char ge329os11653;
extern T0* ge329ov11653;
extern T0* T558f193(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.yy_nxt_template */
extern unsigned char ge329os11652;
extern T0* ge329ov11652;
extern T0* T558f192(GE_context* ac, T0* C);
/* LX_WILDCARD_PARSER.empty_buffer */
extern unsigned char ge2597os7376;
extern T0* ge2597ov7376;
extern T0* T558f119(GE_context* ac, T0* C);
/* LX_DESCRIPTION.set_case_insensitive */
extern void T559f33(GE_context* ac, T0* C, T1 a1);
/* LX_DESCRIPTION.set_full_table */
extern void T559f32(GE_context* ac, T0* C, T1 a1);
/* LX_DESCRIPTION.set_meta_equiv_classes_used */
extern void T559f31(GE_context* ac, T0* C, T1 a1);
/* LX_DESCRIPTION.set_equiv_classes_used */
extern void T559f30(GE_context* ac, T0* C, T1 a1);
/* LX_DESCRIPTION.make */
extern T0* T559c29(GE_context* ac);
/* LX_START_CONDITIONS.make_with_initial */
extern T0* T574c14(GE_context* ac, T6 a1);
/* LX_START_CONDITIONS.put_first */
extern void T574f17(GE_context* ac, T0* C, T0* a1);
/* LX_START_CONDITIONS.put */
extern void T574f18(GE_context* ac, T0* C, T0* a1, T6 a2);
/* LX_START_CONDITIONS.move_cursors_right */
extern void T574f21(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].set_position */
extern void T624f5(GE_context* ac, T0* C, T6 a1);
/* LX_START_CONDITIONS.move_right */
extern void T574f20(GE_context* ac, T0* C, T6 a1, T6 a2);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].force */
extern void T623f3(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [LX_START_CONDITION].fill_with */
extern void T622f6(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [LX_START_CONDITION].extend */
extern void T622f7(GE_context* ac, T0* C, T0* a1);
/* LX_START_CONDITIONS.put_last */
extern void T574f19(GE_context* ac, T0* C, T0* a1);
/* LX_START_CONDITION.make */
extern T0* T603c6(GE_context* ac, T0* a1, T6 a2, T1 a3);
/* DS_ARRAYED_LIST [LX_NFA].make */
extern T0* T605c10(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA].set_internal_cursor */
extern void T605f11(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA].new_cursor */
extern T0* T605f6(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA].make */
extern T0* T653c3(GE_context* ac, T0* a1);
/* UT_ERROR_HANDLER.make_null */
extern T0* T35c10(GE_context* ac);
/* UT_ERROR_HANDLER.null_output_stream */
extern unsigned char ge167os3048;
extern T0* ge167ov3048;
extern T0* T35f6(GE_context* ac, T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.make */
extern T0* T562c3(GE_context* ac, T0* a1);
/* LX_DFA_WILDCARD.wipe_out */
extern void T519f17(GE_context* ac, T0* C);
/* GEANT_FILESET_ELEMENT.exclude_attribute_name */
extern unsigned char ge81os9954;
extern T0* ge81ov9954;
extern T0* T426f11(GE_context* ac, T0* C);
/* GEANT_FILESET.set_include_wc_string */
extern void T432f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.include_attribute_name */
extern unsigned char ge81os9953;
extern T0* ge81ov9953;
extern T0* T426f10(GE_context* ac, T0* C);
/* GEANT_FILESET.set_directory_name */
extern void T432f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET.set_dir_name */
extern void T432f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.attribute_value */
extern T0* T426f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.project_variables_resolver */
extern T0* T426f25(GE_context* ac, T0* C);
/* GEANT_FILESET_ELEMENT.dir_attribute_name */
extern T0* T426f8(GE_context* ac, T0* C);
/* GEANT_FILESET.make */
extern T0* T432c33(GE_context* ac, T0* a1);
/* DS_HASH_SET [STRING_8].set_equality_tester */
extern void T517f33(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].make */
extern T0* T517c32(GE_context* ac, T6 a1);
/* DS_HASH_SET [STRING_8].set_internal_cursor */
extern void T517f40(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].new_cursor */
extern T0* T517f20(GE_context* ac, T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].make */
extern T0* T542c9(GE_context* ac, T0* a1);
/* DS_HASH_SET [STRING_8].make_slots */
extern void T517f38(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_clashes */
extern void T517f37(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_key_storage */
extern void T517f36(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_item_storage */
extern void T517f35(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_equal */
extern T0* T515c37(GE_context* ac, T6 a1);
/* detachable KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY].default_create */
extern T0* T555c2(GE_context* ac);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make */
extern void T515f42(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].set_internal_cursor */
extern void T515f56(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].new_cursor */
extern T0* T515f21(GE_context* ac, T0* C);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].make */
extern T0* T553c8(GE_context* ac, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].unset_found_item */
extern void T515f45(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_slots */
extern void T515f55(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].new_modulus */
extern T6 T515f19(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_clashes */
extern void T515f54(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_key_storage */
extern void T515f53(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_item_storage */
extern void T515f52(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].make */
extern T0* T556f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_FILESET_ENTRY].make_empty */
extern T0* T554c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].default_create */
extern T0* T556c3(GE_context* ac);
/* GEANT_FILESET_ELEMENT.exit_application */
extern void T426f30(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_FILESET_ELEMENT.exceptions */
extern T0* T426f24(GE_context* ac, T0* C);
/* GEANT_FILESET_ELEMENT.log_messages */
extern void T426f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.mapped_filename_directory_attribute_name */
extern unsigned char ge81os9961;
extern T0* ge81ov9961;
extern T0* T426f6(GE_context* ac, T0* C);
/* GEANT_FILESET_ELEMENT.filename_directory_attribute_name */
extern unsigned char ge81os9959;
extern T0* ge81ov9959;
extern T0* T426f5(GE_context* ac, T0* C);
/* GEANT_FILESET_ELEMENT.directory_attribute_name */
extern unsigned char ge81os9952;
extern T0* ge81ov9952;
extern T0* T426f22(GE_context* ac, T0* C);
/* GEANT_FILESET_ELEMENT.has_attribute */
extern T1 T426f20(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.concat_attribute_name */
extern unsigned char ge81os9956;
extern T0* ge81ov9956;
extern T0* T426f7(GE_context* ac, T0* C);
/* GEANT_FILESET_ELEMENT.make */
extern void T426f29p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_FILESET_ELEMENT.set_project */
extern void T426f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.element_make */
extern void T426f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.set_xml_element */
extern void T426f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.fileset_element_name */
extern unsigned char ge68os9378;
extern T0* ge68ov9378;
extern T0* T384f13(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.set_flags */
extern void T481f37(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.flags_attribute_name */
extern unsigned char ge68os9377;
extern T0* ge68ov9377;
extern T0* T384f12(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.set_replace */
extern void T481f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.replace_attribute_name */
extern unsigned char ge68os9376;
extern T0* ge68ov9376;
extern T0* T384f11(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.set_variable_pattern */
extern void T481f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.variable_pattern_attribute_name */
extern unsigned char ge68os9375;
extern T0* ge68ov9375;
extern T0* T384f9(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.set_token */
extern void T481f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.token_attribute_name */
extern unsigned char ge68os9374;
extern T0* ge68ov9374;
extern T0* T384f8(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.set_match */
extern void T481f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.match_attribute_name */
extern unsigned char ge68os9373;
extern T0* ge68ov9373;
extern T0* T384f7(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.set_to_directory */
extern void T481f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.to_directory_attribute_name */
extern unsigned char ge68os9372;
extern T0* ge68ov9372;
extern T0* T384f6(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.set_to_file */
extern void T481f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.to_file_attribute_name */
extern unsigned char ge68os9371;
extern T0* ge68ov9371;
extern T0* T384f5(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.set_file */
extern void T481f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.attribute_value */
extern T0* T384f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.project_variables_resolver */
extern T0* T384f17(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.has_attribute */
extern T1 T384f10(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.file_attribute_name */
extern unsigned char ge68os9370;
extern T0* ge68ov9370;
extern T0* T384f15(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.make */
extern void T384f31p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_REPLACE_TASK.make */
extern T0* T384f31p1ac1(T0* a1);
/* DS_CELL [PROCEDURE [ANY, TUPLE]].put */
extern void T421f3(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.make_with_command */
extern void T384f33(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_TASK.interpreting_element_make */
extern void T384f36(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_TASK.set_project */
extern void T384f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.element_make */
extern void T384f37(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.set_xml_element */
extern void T384f39(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.set_command */
extern void T384f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.build_command */
extern void T384f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.make */
extern T0* T481c29(GE_context* ac, T0* a1);
/* DS_CELL [PROCEDURE [ANY, TUPLE]].make */
extern T0* T421c2(GE_context* ac, T0* a1);
/* GEANT_REPLACE_COMMAND.set_project */
extern void T481f39(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_input_task */
extern T0* T248f50(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.make */
extern T0* T382c32(GE_context* ac, T0* a1, T0* a2);
/* GEANT_INPUT_COMMAND.set_answer_required */
extern void T479f21(GE_context* ac, T0* C, T1 a1);
/* GEANT_INPUT_TASK.boolean_value */
extern T1 T382f10(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.std */
extern T0* T382f18(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.false_attribute_value */
extern T0* T382f17(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.true_attribute_value */
extern T0* T382f16(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.string_ */
extern T0* T382f15(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.answer_required_attribute_name */
extern unsigned char ge61os9352;
extern T0* ge61ov9352;
extern T0* T382f9(GE_context* ac, T0* C);
/* GEANT_INPUT_COMMAND.set_validregexp */
extern void T479f20(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.validregexp_attribute_name */
extern unsigned char ge61os9351;
extern T0* ge61ov9351;
extern T0* T382f8(GE_context* ac, T0* C);
/* GEANT_INPUT_COMMAND.set_validargs */
extern void T479f19(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.validargs_attribute_name */
extern unsigned char ge61os9350;
extern T0* ge61ov9350;
extern T0* T382f7(GE_context* ac, T0* C);
/* GEANT_INPUT_COMMAND.set_default_value */
extern void T479f18(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.defaultvalue_attribute_name */
extern unsigned char ge61os9349;
extern T0* ge61ov9349;
extern T0* T382f6(GE_context* ac, T0* C);
/* GEANT_INPUT_COMMAND.set_message */
extern void T479f17(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.message_attribute_name */
extern unsigned char ge61os9348;
extern T0* ge61ov9348;
extern T0* T382f5(GE_context* ac, T0* C);
/* GEANT_INPUT_COMMAND.set_variable */
extern void T479f16(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.attribute_value */
extern T0* T382f12(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.project_variables_resolver */
extern T0* T382f19(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.has_attribute */
extern T1 T382f11(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.variable_attribute_name */
extern unsigned char ge61os9347;
extern T0* ge61ov9347;
extern T0* T382f14(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.make */
extern void T382f32p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_INPUT_TASK.make */
extern T0* T382f32p1ac1(T0* a1);
/* GEANT_INPUT_TASK.make_with_command */
extern void T382f34(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_INPUT_TASK.interpreting_element_make */
extern void T382f37(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_INPUT_TASK.set_project */
extern void T382f39(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.element_make */
extern void T382f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.set_xml_element */
extern void T382f40(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.set_command */
extern void T382f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.build_command */
extern void T382f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_COMMAND.make */
extern T0* T479c15(GE_context* ac, T0* a1);
/* GEANT_INPUT_COMMAND.set_project */
extern void T479f22(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_available_task */
extern T0* T248f48(GE_context* ac, T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T380c21(GE_context* ac, T0* a1);
/* Creation of agent #1 in feature GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T380f21ac1(T0* a1, T0* a2);
/* Creation of agent #2 in feature GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T380f21ac2(T0* a1, T0* a2);
/* Creation of agent #3 in feature GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T380f21ac3(T0* a1, T0* a2);
/* Creation of agent #4 in feature GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T380f21ac4(T0* a1, T0* a2);
/* GEANT_INTERPRETING_ELEMENT.attribute_value_if_existing */
extern T0* T253f5(GE_context* ac, T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.has_attribute */
extern T1 T253f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.attribute_value */
extern T0* T253f4(GE_context* ac, T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.project_variables_resolver */
extern T0* T253f7(GE_context* ac, T0* C);
/* GEANT_STRING_PROPERTY.set_string_value_agent */
extern void T428f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern void T380f21p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.make */
extern void T380f22(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_AVAILABLE_TASK.make */
extern T0* T380f22ac1(T0* a1);
/* GEANT_AVAILABLE_TASK.make_with_command */
extern void T380f24(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_AVAILABLE_TASK.interpreting_element_make */
extern void T380f27(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_AVAILABLE_TASK.set_project */
extern void T380f29(GE_context* ac, T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.element_make */
extern void T380f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.set_xml_element */
extern void T380f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.set_command */
extern void T380f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.build_command */
extern void T380f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_AVAILABLE_COMMAND.make */
extern T0* T477c17(GE_context* ac, T0* a1);
/* Creation of agent #1 in feature GEANT_AVAILABLE_COMMAND.make */
extern T0* T477f17ac1(T0* a1);
/* GEANT_AVAILABLE_COMMAND.is_resource_existing */
extern T1 T477f11(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.file_exists */
extern T1 T92f29(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.exists */
extern T1 T97f37(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.is_plain */
extern T1 T97f26(GE_context* ac, T0* C);
/* FILE_INFO.is_plain */
extern T1 T133f12(GE_context* ac, T0* C);
/* FILE_INFO.file_info */
extern T6 T133f7(GE_context* ac, T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.buffered_file_info */
extern T0* T97f17(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.set_buffer */
extern void T97f65(GE_context* ac, T0* C);
/* FILE_INFO.fast_update */
extern void T133f23(GE_context* ac, T0* C, T0* a1, T0* a2);
/* FILE_INFO.eif_file_stat */
extern T6 T133f16(GE_context* ac, T0* C, T14 a1, T14 a2, T1 a3);
/* KL_TEXT_INPUT_FILE.internal_name_pointer */
extern T0* T97f15(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.old_exists */
extern T1 T97f23(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.file_exists */
extern T1 T97f16(GE_context* ac, T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.old_is_closed */
extern T1 T97f14(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.string_name */
extern T0* T97f20(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.reset */
extern void T97f64(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.tmp_file */
extern unsigned char ge156os3733;
extern T0* ge156ov3733;
extern T0* T92f5(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.file_exists */
extern T1 T93f27(GE_context* ac, T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.tmp_file */
extern T0* T93f6(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_COMMAND.unix_file_system */
extern T0* T477f13(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_COMMAND.file_system */
extern T0* T477f12(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_COMMAND.windows_file_system */
extern T0* T477f15(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_COMMAND.operating_system */
extern T0* T477f14(GE_context* ac, T0* C);
/* DS_CELL [FUNCTION [ANY, TUPLE [STRING_8], BOOLEAN]].make */
extern T0* T535c2(GE_context* ac, T0* a1);
/* GEANT_STRING_PROPERTY.make */
extern T0* T428c8(GE_context* ac);
/* GEANT_AVAILABLE_COMMAND.make */
extern void T477f17p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_AVAILABLE_COMMAND.set_project */
extern void T477f18(GE_context* ac, T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.make */
extern T0* T253c12(GE_context* ac, T0* a1, T0* a2);
/* GEANT_INTERPRETING_ELEMENT.set_project */
extern void T253f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.element_make */
extern void T253f13(GE_context* ac, T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.set_xml_element */
extern void T253f15(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_precursor_task */
extern T0* T248f46(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.make */
extern T0* T378c28(GE_context* ac, T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.force_last_new */
extern void T41f74(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.key_storage_put */
extern void T41f56(GE_context* ac, T0* C, T0* a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.item_storage_put */
extern void T41f52(GE_context* ac, T0* C, T0* a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.slots_put */
extern void T41f55(GE_context* ac, T0* C, T6 a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.clashes_put */
extern void T41f54(GE_context* ac, T0* C, T6 a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.slots_item */
extern T6 T41f31(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.hash_position */
extern T6 T41f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.resize */
extern void T41f53(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.clashes_resize */
extern void T41f61(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.special_integer_ */
extern T0* T41f28(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_VARIABLES.key_storage_resize */
extern void T41f60(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.item_storage_resize */
extern void T41f59(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.key_storage_item */
extern T0* T41f30(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.clashes_item */
extern T6 T41f26(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.slots_resize */
extern void T41f58(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.new_capacity */
extern T6 T41f23(GE_context* ac, T0* C, T6 a1);
/* GEANT_DEFINE_ELEMENT.value */
extern T0* T440f5(GE_context* ac, T0* C);
/* GEANT_DEFINE_ELEMENT.value_attribute_name */
extern T0* T440f12(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].forth */
extern void T405f10(GE_context* ac, T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_forth */
extern void T298f14(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].add_traversing_cursor */
extern void T298f16(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T405f12(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].remove_traversing_cursor */
extern void T298f17(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].set */
extern void T405f11(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [STRING_8].item */
extern T0* T405f6(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].start */
extern void T405f9(GE_context* ac, T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_start */
extern void T298f13(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].cursor_off */
extern T1 T298f9(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].off */
extern T1 T405f7(GE_context* ac, T0* C);
/* ST_SPLITTER.split */
extern T0* T411f5(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.arguments_string_splitter */
extern unsigned char ge10os1961;
extern T0* ge10ov1961;
extern T0* T378f8(GE_context* ac, T0* C);
/* ST_SPLITTER.make */
extern T0* T411c11(GE_context* ac);
/* GEANT_PRECURSOR_TASK.exit_application */
extern void T378f29(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_PRECURSOR_TASK.exceptions */
extern T0* T378f11(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.std */
extern T0* T378f10(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.log_messages */
extern void T378f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.arguments_attribute_name */
extern unsigned char ge67os9325;
extern T0* ge67ov9325;
extern T0* T378f7(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.elements_by_name */
extern T0* T378f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.string_ */
extern T0* T378f15(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.argument_element_name */
extern unsigned char ge67os9324;
extern T0* ge67ov9324;
extern T0* T378f5(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_COMMAND.set_parent */
extern void T475f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.attribute_value */
extern T0* T378f12(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.project_variables_resolver */
extern T0* T378f16(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.has_attribute */
extern T1 T378f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.parent_attribute_name */
extern unsigned char ge67os9323;
extern T0* ge67ov9323;
extern T0* T378f14(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.make */
extern void T378f28p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_PRECURSOR_TASK.make */
extern T0* T378f28p1ac1(T0* a1);
/* GEANT_PRECURSOR_TASK.make_with_command */
extern void T378f31(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_PRECURSOR_TASK.interpreting_element_make */
extern void T378f35(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_PRECURSOR_TASK.set_project */
extern void T378f37(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.element_make */
extern void T378f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.set_xml_element */
extern void T378f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.set_command */
extern void T378f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.build_command */
extern void T378f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_COMMAND.make */
extern T0* T475c8(GE_context* ac, T0* a1);
/* GEANT_PRECURSOR_COMMAND.make */
extern void T475f8p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_PRECURSOR_COMMAND.set_project */
extern void T475f10(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_exit_task */
extern T0* T248f44(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXIT_TASK.make */
extern T0* T376c23(GE_context* ac, T0* a1, T0* a2);
/* UC_UTF8_STRING.to_integer */
extern T6 T265f39(GE_context* ac, T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
extern T6 T161f13(GE_context* ac, T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
extern void T161f17(GE_context* ac, T0* C, T0* a1, T6 a2);
/* STRING_TO_INTEGER_CONVERTOR.parse_character */
extern void T161f23(GE_context* ac, T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflowed */
extern T1 T161f15(GE_context* ac, T0* C);
/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
extern unsigned char ge2427os6809;
extern T0* ge2427ov6809;
extern T0* T161f14(GE_context* ac, T0* C);
/* CHARACTER_8.is_digit */
extern T1 T2f9(GE_context* ac, T2* C);
/* STRING_TO_INTEGER_CONVERTOR.reset */
extern void T161f18(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.ctoi_convertor */
extern unsigned char ge2418os491;
extern T0* ge2418ov491;
extern T0* T265f44(GE_context* ac, T0* C);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
extern void T161f22(GE_context* ac, T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
extern void T161f21(GE_context* ac, T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
extern void T161f20(GE_context* ac, T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
extern void T161f19(GE_context* ac, T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.make */
extern T0* T161c16(GE_context* ac);
/* STRING_8.to_integer */
extern T6 T17f17(GE_context* ac, T0* C);
/* STRING_8.ctoi_convertor */
extern T0* T17f26(GE_context* ac, T0* C);
/* GEANT_EXIT_COMMAND.set_code */
extern void T473f8(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.is_integer */
extern T1 T265f38(GE_context* ac, T0* C);
/* UC_UTF8_STRING.is_valid_integer_or_natural */
extern T1 T265f43(GE_context* ac, T0* C, T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.is_integral_integer */
extern T1 T161f12(GE_context* ac, T0* C);
/* STRING_8.is_integer */
extern T1 T17f16(GE_context* ac, T0* C);
/* STRING_8.is_valid_integer_or_natural */
extern T1 T17f25(GE_context* ac, T0* C, T6 a1);
/* GEANT_EXIT_TASK.attribute_value */
extern T0* T376f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXIT_TASK.project_variables_resolver */
extern T0* T376f9(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.has_attribute */
extern T1 T376f5(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXIT_TASK.code_attribute_name */
extern unsigned char ge53os9314;
extern T0* ge53ov9314;
extern T0* T376f8(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.make */
extern void T376f23p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_EXIT_TASK.make */
extern T0* T376f23p1ac1(T0* a1);
/* GEANT_EXIT_TASK.make_with_command */
extern void T376f25(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_EXIT_TASK.interpreting_element_make */
extern void T376f28(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_EXIT_TASK.set_project */
extern void T376f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXIT_TASK.element_make */
extern void T376f29(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXIT_TASK.set_xml_element */
extern void T376f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXIT_TASK.set_command */
extern void T376f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXIT_TASK.build_command */
extern void T376f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXIT_COMMAND.make */
extern T0* T473c7(GE_context* ac, T0* a1);
/* GEANT_EXIT_COMMAND.set_project */
extern void T473f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_outofdate_task */
extern T0* T248f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.make */
extern T0* T374c28(GE_context* ac, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_COMMAND.set_fileset */
extern void T471f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.fileset_element_name */
extern unsigned char ge66os9293;
extern T0* ge66ov9293;
extern T0* T374f10(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_variable_name */
extern void T471f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.variable_attribute_name */
extern unsigned char ge66os9290;
extern T0* ge66ov9290;
extern T0* T374f8(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.false_value_attribute_name */
extern unsigned char ge66os9292;
extern T0* ge66ov9292;
extern T0* T374f7(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_false_value */
extern void T471f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.true_value_attribute_name */
extern unsigned char ge66os9291;
extern T0* ge66ov9291;
extern T0* T374f6(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_true_value */
extern void T471f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.set_target_filename */
extern void T471f22(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.target_attribute_name */
extern unsigned char ge66os9289;
extern T0* ge66ov9289;
extern T0* T374f5(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_source_filename */
extern void T471f21(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.attribute_value */
extern T0* T374f11(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.project_variables_resolver */
extern T0* T374f14(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.has_attribute */
extern T1 T374f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.source_attribute_name */
extern unsigned char ge66os9288;
extern T0* ge66ov9288;
extern T0* T374f12(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.make */
extern void T374f28p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_OUTOFDATE_TASK.make */
extern T0* T374f28p1ac1(T0* a1);
/* GEANT_OUTOFDATE_TASK.make_with_command */
extern void T374f30(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.interpreting_element_make */
extern void T374f33(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.set_project */
extern void T374f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.element_make */
extern void T374f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.set_xml_element */
extern void T374f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.set_command */
extern void T374f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.build_command */
extern void T374f29(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.make */
extern T0* T471c20(GE_context* ac, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.set_project */
extern void T471f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_xslt_task */
extern T0* T248f40(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.make */
extern T0* T372c41(GE_context* ac, T0* a1, T0* a2);
/* GEANT_XSLT_COMMAND.set_classpath */
extern void T468f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.classpath_attribute_name */
extern unsigned char ge73os9248;
extern T0* ge73ov9248;
extern T0* T372f21(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.set_extdirs */
extern void T468f37(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.extdirs_attribute_name */
extern unsigned char ge73os9247;
extern T0* ge73ov9247;
extern T0* T372f20(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.set_format */
extern void T468f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.format_attribute_name */
extern unsigned char ge73os9245;
extern T0* ge73ov9245;
extern T0* T372f19(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].force_last */
extern void T469f11(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]].force */
extern void T532f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [DS_PAIR [STRING_8, STRING_8]].fill_with */
extern void T533f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_PAIR [STRING_8, STRING_8]].extend */
extern void T533f8(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].resize */
extern void T469f13(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]].aliased_resized_area */
extern T0* T532f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_PAIR [STRING_8, STRING_8]].aliased_resized_area */
extern T0* T533f4(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].new_capacity */
extern T6 T469f7(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].extendible */
extern T1 T469f8(GE_context* ac, T0* C, T6 a1);
/* DS_PAIR [STRING_8, STRING_8].make */
extern T0* T467c3(GE_context* ac, T0* a1, T0* a2);
/* GEANT_DEFINE_ELEMENT.has_value */
extern T1 T440f15(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.elements_by_name */
extern T0* T372f17(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.parameter_element_name */
extern unsigned char ge73os9249;
extern T0* ge73ov9249;
extern T0* T372f16(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.set_indent */
extern void T468f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.indent_attribute_name */
extern unsigned char ge73os9246;
extern T0* ge73ov9246;
extern T0* T372f15(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.set_force */
extern void T468f34(GE_context* ac, T0* C, T1 a1);
/* GEANT_XSLT_TASK.boolean_value */
extern T1 T372f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.std */
extern T0* T372f27(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.false_attribute_value */
extern T0* T372f26(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.true_attribute_value */
extern T0* T372f25(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.force_attribute_name */
extern unsigned char ge73os9239;
extern T0* ge73ov9239;
extern T0* T372f13(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.set_stylesheet_filename */
extern void T468f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.stylesheet_filename_attribute_name */
extern unsigned char ge73os9238;
extern T0* ge73ov9238;
extern T0* T372f12(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.set_output_filename */
extern void T468f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.output_filename_attribute_name */
extern unsigned char ge73os9237;
extern T0* ge73ov9237;
extern T0* T372f11(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.set_input_filename */
extern void T468f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.input_filename_attribute_name */
extern unsigned char ge73os9236;
extern T0* ge73ov9236;
extern T0* T372f10(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.set_processor_gexslt */
extern void T468f30(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.set_processor */
extern void T468f40(GE_context* ac, T0* C, T6 a1);
/* GEANT_XSLT_TASK.processor_attribute_value_gexslt */
extern unsigned char ge73os9244;
extern T0* ge73ov9244;
extern T0* T372f9(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xsltproc */
extern void T468f29(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xsltproc */
extern unsigned char ge73os9243;
extern T0* ge73ov9243;
extern T0* T372f8(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xalan_java */
extern void T468f28(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xalan_java */
extern unsigned char ge73os9242;
extern T0* ge73ov9242;
extern T0* T372f7(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xalan_cpp */
extern void T468f27(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xalan_cpp */
extern unsigned char ge73os9241;
extern T0* ge73ov9241;
extern T0* T372f5(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.string_ */
extern T0* T372f24(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.attribute_value */
extern T0* T372f22(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.project_variables_resolver */
extern T0* T372f28(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.has_attribute */
extern T1 T372f18(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.processor_attribute_name */
extern unsigned char ge73os9240;
extern T0* ge73ov9240;
extern T0* T372f6(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.make */
extern void T372f41p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_XSLT_TASK.make */
extern T0* T372f41p1ac1(T0* a1);
/* GEANT_XSLT_TASK.make_with_command */
extern void T372f43(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_TASK.interpreting_element_make */
extern void T372f46(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_TASK.set_project */
extern void T372f48(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.element_make */
extern void T372f47(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.set_xml_element */
extern void T372f49(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.set_command */
extern void T372f45(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.build_command */
extern void T372f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.make */
extern T0* T468c26(GE_context* ac, T0* a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].make */
extern T0* T469c10(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].set_internal_cursor */
extern void T469f12(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].new_cursor */
extern T0* T469f6(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING_8, STRING_8]].make */
extern T0* T534c3(GE_context* ac, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]].make */
extern T0* T532f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_PAIR [STRING_8, STRING_8]].make_empty */
extern T0* T533c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]].default_create */
extern T0* T532c3(GE_context* ac);
/* GEANT_XSLT_COMMAND.make */
extern void T468f26p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.set_project */
extern void T468f39(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_setenv_task */
extern T0* T248f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_SETENV_TASK.make */
extern T0* T370c24(GE_context* ac, T0* a1, T0* a2);
/* GEANT_SETENV_COMMAND.set_value */
extern void T465f11(GE_context* ac, T0* C, T0* a1);
/* GEANT_SETENV_TASK.value_attribute_name */
extern unsigned char ge69os9226;
extern T0* ge69ov9226;
extern T0* T370f5(GE_context* ac, T0* C);
/* GEANT_SETENV_COMMAND.set_name */
extern void T465f10(GE_context* ac, T0* C, T0* a1);
/* GEANT_SETENV_TASK.attribute_value */
extern T0* T370f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_SETENV_TASK.project_variables_resolver */
extern T0* T370f10(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.has_attribute */
extern T1 T370f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_SETENV_TASK.name_attribute_name */
extern unsigned char ge69os9225;
extern T0* ge69ov9225;
extern T0* T370f9(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.make */
extern void T370f24p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_SETENV_TASK.make */
extern T0* T370f24p1ac1(T0* a1);
/* GEANT_SETENV_TASK.make_with_command */
extern void T370f26(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_SETENV_TASK.interpreting_element_make */
extern void T370f29(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_SETENV_TASK.set_project */
extern void T370f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_SETENV_TASK.element_make */
extern void T370f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_SETENV_TASK.set_xml_element */
extern void T370f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_SETENV_TASK.set_command */
extern void T370f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_SETENV_TASK.build_command */
extern void T370f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_SETENV_COMMAND.make */
extern T0* T465c9(GE_context* ac, T0* a1);
/* GEANT_SETENV_COMMAND.set_project */
extern void T465f12(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_move_task */
extern T0* T248f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_TASK.make */
extern T0* T368c26(GE_context* ac, T0* a1, T0* a2);
/* GEANT_MOVE_COMMAND.set_fileset */
extern void T463f21(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_TASK.fileset_element_name */
extern unsigned char ge65os9207;
extern T0* ge65ov9207;
extern T0* T368f8(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.set_to_directory */
extern void T463f20(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_TASK.to_directory_attribute_name */
extern unsigned char ge65os9206;
extern T0* ge65ov9206;
extern T0* T368f6(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.set_to_file */
extern void T463f19(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_TASK.to_file_attribute_name */
extern unsigned char ge65os9205;
extern T0* ge65ov9205;
extern T0* T368f5(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.set_file */
extern void T463f18(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_TASK.attribute_value */
extern T0* T368f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_TASK.project_variables_resolver */
extern T0* T368f12(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.has_attribute */
extern T1 T368f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_TASK.file_attribute_name */
extern unsigned char ge65os9204;
extern T0* ge65ov9204;
extern T0* T368f10(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.make */
extern void T368f26p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_MOVE_TASK.make */
extern T0* T368f26p1ac1(T0* a1);
/* GEANT_MOVE_TASK.make_with_command */
extern void T368f28(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_TASK.interpreting_element_make */
extern void T368f31(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_TASK.set_project */
extern void T368f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_TASK.element_make */
extern void T368f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_TASK.set_xml_element */
extern void T368f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_TASK.set_command */
extern void T368f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_TASK.build_command */
extern void T368f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.make */
extern T0* T463c17(GE_context* ac, T0* a1);
/* GEANT_MOVE_COMMAND.set_project */
extern void T463f22(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_copy_task */
extern T0* T248f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.make */
extern T0* T366c31(GE_context* ac, T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.set_fileset */
extern void T461f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.fileset_element_name */
extern unsigned char ge49os9184;
extern T0* ge49ov9184;
extern T0* T366f10(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.set_force */
extern void T461f24(GE_context* ac, T0* C, T1 a1);
/* GEANT_COPY_TASK.boolean_value */
extern T1 T366f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.std */
extern T0* T366f17(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.false_attribute_value */
extern T0* T366f16(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.true_attribute_value */
extern T0* T366f15(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.string_ */
extern T0* T366f14(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.force_attribute_name */
extern unsigned char ge49os9183;
extern T0* ge49ov9183;
extern T0* T366f7(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.set_to_directory */
extern void T461f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.to_directory_attribute_name */
extern unsigned char ge49os9182;
extern T0* ge49ov9182;
extern T0* T366f6(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.set_to_file */
extern void T461f22(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.to_file_attribute_name */
extern unsigned char ge49os9181;
extern T0* ge49ov9181;
extern T0* T366f5(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.set_file */
extern void T461f21(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.attribute_value */
extern T0* T366f11(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.project_variables_resolver */
extern T0* T366f18(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.has_attribute */
extern T1 T366f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.file_attribute_name */
extern unsigned char ge49os9180;
extern T0* ge49ov9180;
extern T0* T366f12(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.make */
extern void T366f31p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_COPY_TASK.make */
extern T0* T366f31p1ac1(T0* a1);
/* GEANT_COPY_TASK.make_with_command */
extern void T366f33(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_COPY_TASK.interpreting_element_make */
extern void T366f36(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_COPY_TASK.set_project */
extern void T366f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.element_make */
extern void T366f37(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.set_xml_element */
extern void T366f39(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.set_command */
extern void T366f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.build_command */
extern void T366f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_COMMAND.make */
extern T0* T461c20(GE_context* ac, T0* a1);
/* GEANT_COPY_COMMAND.set_project */
extern void T461f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_delete_task */
extern T0* T248f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.make */
extern T0* T364c31(GE_context* ac, T0* a1, T0* a2);
/* GEANT_DELETE_COMMAND.set_directoryset */
extern void T458f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.make */
extern T0* T457c20(GE_context* ac, T0* a1, T0* a2);
/* GEANT_DIRECTORYSET.add_single_exclude */
extern void T459f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.exclude_element_name */
extern unsigned char ge77os10064;
extern T0* ge77ov10064;
extern T0* T457f12(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.add_single_include */
extern void T459f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.elements_by_name */
extern T0* T457f11(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.string_ */
extern T0* T457f16(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.include_element_name */
extern unsigned char ge77os10063;
extern T0* ge77ov10063;
extern T0* T457f10(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.set_concat */
extern void T459f25(GE_context* ac, T0* C, T1 a1);
/* GEANT_DIRECTORYSET_ELEMENT.boolean_value */
extern T1 T457f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.std */
extern T0* T457f19(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.false_attribute_value */
extern T0* T457f18(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.true_attribute_value */
extern T0* T457f17(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.concat_attribute_name */
extern unsigned char ge77os10062;
extern T0* ge77ov10062;
extern T0* T457f8(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.set_exclude_wc_string */
extern void T459f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.exclude_attribute_name */
extern unsigned char ge77os10061;
extern T0* ge77ov10061;
extern T0* T457f7(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.set_include_wc_string */
extern void T459f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.include_attribute_name */
extern unsigned char ge77os10060;
extern T0* ge77ov10060;
extern T0* T457f6(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.set_directory_name */
extern void T459f22(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.attribute_value */
extern T0* T457f5(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.project_variables_resolver */
extern T0* T457f15(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.has_attribute */
extern T1 T457f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.directory_attribute_name */
extern unsigned char ge77os10059;
extern T0* ge77ov10059;
extern T0* T457f13(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.make */
extern T0* T459c21(GE_context* ac, T0* a1);
/* GEANT_DIRECTORYSET.set_directory_name_variable_name */
extern void T459f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.make */
extern void T457f20p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_DIRECTORYSET_ELEMENT.set_project */
extern void T457f22(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.element_make */
extern void T457f21(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.set_xml_element */
extern void T457f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.directoryset_element_name */
extern unsigned char ge50os9158;
extern T0* ge50ov9158;
extern T0* T364f11(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.set_fileset */
extern void T458f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.fileset_element_name */
extern unsigned char ge50os9157;
extern T0* ge50ov9157;
extern T0* T364f9(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.set_fail_on_error */
extern void T458f24(GE_context* ac, T0* C, T1 a1);
/* GEANT_DELETE_TASK.boolean_value */
extern T1 T364f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.std */
extern T0* T364f17(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.false_attribute_value */
extern T0* T364f16(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.true_attribute_value */
extern T0* T364f15(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.string_ */
extern T0* T364f14(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.fail_on_error_attribute_name */
extern unsigned char ge50os9159;
extern T0* ge50ov9159;
extern T0* T364f6(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.set_file */
extern void T458f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.file_attribute_name */
extern unsigned char ge50os9156;
extern T0* ge50ov9156;
extern T0* T364f5(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.set_directory */
extern void T458f22(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.attribute_value */
extern T0* T364f10(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.project_variables_resolver */
extern T0* T364f18(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.has_attribute */
extern T1 T364f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.directory_attribute_name */
extern unsigned char ge50os9155;
extern T0* ge50ov9155;
extern T0* T364f12(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.make */
extern void T364f31p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_DELETE_TASK.make */
extern T0* T364f31p1ac1(T0* a1);
/* GEANT_DELETE_TASK.make_with_command */
extern void T364f33(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_DELETE_TASK.interpreting_element_make */
extern void T364f36(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_DELETE_TASK.set_project */
extern void T364f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.element_make */
extern void T364f37(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.set_xml_element */
extern void T364f39(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.set_command */
extern void T364f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.build_command */
extern void T364f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.make */
extern T0* T458c21(GE_context* ac, T0* a1);
/* GEANT_DELETE_COMMAND.make */
extern void T458f21p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.set_project */
extern void T458f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_mkdir_task */
extern T0* T248f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_MKDIR_TASK.make_from_interpreting_element */
extern T0* T362c21(GE_context* ac, T0* a1);
/* Creation of agent #1 in feature GEANT_MKDIR_TASK.make_from_interpreting_element */
extern T0* T362f21ac1(T0* a1, T0* a2);
/* GEANT_MKDIR_TASK.make_from_interpreting_element */
extern void T362f21p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_MKDIR_TASK.make */
extern void T362f22(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_MKDIR_TASK.make */
extern T0* T362f22ac1(T0* a1);
/* GEANT_MKDIR_TASK.make_with_command */
extern void T362f24(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_MKDIR_TASK.interpreting_element_make */
extern void T362f27(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_MKDIR_TASK.set_project */
extern void T362f29(GE_context* ac, T0* C, T0* a1);
/* GEANT_MKDIR_TASK.element_make */
extern void T362f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_MKDIR_TASK.set_xml_element */
extern void T362f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_MKDIR_TASK.set_command */
extern void T362f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_MKDIR_TASK.build_command */
extern void T362f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_MKDIR_COMMAND.make */
extern T0* T455c13(GE_context* ac, T0* a1);
/* Creation of agent #1 in feature GEANT_MKDIR_COMMAND.make */
extern T0* T455f13ac1(T0* a1);
/* GEANT_MKDIR_COMMAND.create_directory */
extern void T455f14(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.recursive_create_directory */
extern void T92f38(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.recursive_create_directory */
extern void T410f54(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.canonical_pathname */
extern T0* T93f29(GE_context* ac, T0* C, T0* a1);
/* KL_PATHNAME.set_canonical */
extern void T132f18(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.canonical_pathname */
extern T0* T92f34(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.string_to_pathname */
extern T0* T92f35(GE_context* ac, T0* C, T0* a1);
/* KL_PATHNAME.set_drive */
extern void T132f21(GE_context* ac, T0* C, T0* a1);
/* KL_PATHNAME.set_sharename */
extern void T132f20(GE_context* ac, T0* C, T0* a1);
/* KL_PATHNAME.set_hostname */
extern void T132f19(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.string_name */
extern T0* T410f25(GE_context* ac, T0* C);
/* KL_DIRECTORY.file_system */
extern T0* T410f24(GE_context* ac, T0* C);
/* KL_DIRECTORY.unix_file_system */
extern T0* T410f35(GE_context* ac, T0* C);
/* KL_DIRECTORY.windows_file_system */
extern T0* T410f34(GE_context* ac, T0* C);
/* KL_DIRECTORY.operating_system */
extern T0* T410f33(GE_context* ac, T0* C);
/* KL_DIRECTORY.create_directory */
extern void T410f57(GE_context* ac, T0* C);
/* KL_DIRECTORY.create_dir */
extern void T410f58(GE_context* ac, T0* C);
/* KL_DIRECTORY.file_mkdir */
extern void T410f59(GE_context* ac, T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.recursive_create_directory */
extern void T93f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_MKDIR_COMMAND.unix_file_system */
extern T0* T455f7(GE_context* ac, T0* C);
/* GEANT_MKDIR_COMMAND.file_system */
extern T0* T455f6(GE_context* ac, T0* C);
/* GEANT_MKDIR_COMMAND.windows_file_system */
extern T0* T455f11(GE_context* ac, T0* C);
/* GEANT_MKDIR_COMMAND.operating_system */
extern T0* T455f10(GE_context* ac, T0* C);
/* DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8]]].make */
extern T0* T521c2(GE_context* ac, T0* a1);
/* GEANT_MKDIR_COMMAND.make */
extern void T455f13p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_MKDIR_COMMAND.set_project */
extern void T455f15(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_echo_task */
extern T0* T248f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_ECHO_TASK.make_from_interpreting_element */
extern T0* T360c21(GE_context* ac, T0* a1);
/* Creation of agent #1 in feature GEANT_ECHO_TASK.make_from_interpreting_element */
extern T0* T360f21ac1(T0* a1, T0* a2);
/* Creation of agent #2 in feature GEANT_ECHO_TASK.make_from_interpreting_element */
extern T0* T360f21ac2(T0* a1, T0* a2);
/* Creation of agent #3 in feature GEANT_ECHO_TASK.make_from_interpreting_element */
extern T0* T360f21ac3(T0* a1, T0* a2);
/* GEANT_INTERPRETING_ELEMENT.attribute_or_content_value */
extern T0* T253f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.exit_application */
extern void T253f17(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_INTERPRETING_ELEMENT.exceptions */
extern T0* T253f11(GE_context* ac, T0* C);
/* GEANT_INTERPRETING_ELEMENT.std */
extern T0* T253f10(GE_context* ac, T0* C);
/* GEANT_INTERPRETING_ELEMENT.log_messages */
extern void T253f16(GE_context* ac, T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.content */
extern T0* T253f9(GE_context* ac, T0* C);
/* GEANT_BOOLEAN_PROPERTY.set_string_value_agent */
extern void T431f13(GE_context* ac, T0* C, T0* a1);
/* GEANT_ECHO_TASK.make_from_interpreting_element */
extern void T360f21p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_ECHO_TASK.make */
extern void T360f22(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_ECHO_TASK.make */
extern T0* T360f22ac1(T0* a1);
/* GEANT_ECHO_TASK.make_with_command */
extern void T360f24(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_ECHO_TASK.interpreting_element_make */
extern void T360f27(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_ECHO_TASK.set_project */
extern void T360f29(GE_context* ac, T0* C, T0* a1);
/* GEANT_ECHO_TASK.element_make */
extern void T360f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_ECHO_TASK.set_xml_element */
extern void T360f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_ECHO_TASK.set_command */
extern void T360f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_ECHO_TASK.build_command */
extern void T360f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_ECHO_COMMAND.make */
extern T0* T453c12(GE_context* ac, T0* a1);
/* Creation of agent #1 in feature GEANT_ECHO_COMMAND.make */
extern T0* T453f12ac1(T0* a1);
/* Creation of agent #2 in feature GEANT_ECHO_COMMAND.make */
extern T0* T453f12ac2(T0* a1);
/* GEANT_ECHO_COMMAND.write_message_to_file */
extern void T453f14(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* KL_TEXT_OUTPUT_FILE.put_line */
extern void T527f30(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.put_new_line */
extern void T527f36(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.put_string */
extern void T527f35(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_put_string */
extern void T527f39(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_ps */
extern void T527f41(GE_context* ac, T0* C, T14 a1, T14 a2, T6 a3);
/* KL_TEXT_OUTPUT_FILE.string_ */
extern T0* T527f9(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.is_open_write */
extern T1 T527f17(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
extern T1 T527f14(GE_context* ac, T0* C);
/* GEANT_ECHO_COMMAND.write_message */
extern void T453f13(GE_context* ac, T0* C, T0* a1);
/* DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]]].make */
extern T0* T526c2(GE_context* ac, T0* a1);
/* GEANT_BOOLEAN_PROPERTY.make */
extern T0* T431c12(GE_context* ac);
/* GEANT_ECHO_COMMAND.make */
extern void T453f12p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_ECHO_COMMAND.set_project */
extern void T453f15(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_geant_task */
extern T0* T248f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.make */
extern T0* T358c36(GE_context* ac, T0* a1, T0* a2);
/* GEANT_GEANT_TASK.arguments_string_splitter */
extern T0* T358f16(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.exit_application */
extern void T358f37(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_GEANT_TASK.exceptions */
extern T0* T358f18(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.std */
extern T0* T358f17(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.log_messages */
extern void T358f41(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.arguments_attribute_name */
extern unsigned char ge54os9103;
extern T0* ge54ov9103;
extern T0* T358f15(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.elements_by_name */
extern T0* T358f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.string_ */
extern T0* T358f21(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.argument_element_name */
extern unsigned char ge54os9102;
extern T0* ge54ov9102;
extern T0* T358f13(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.set_exit_code_variable_name */
extern void T451f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.exit_code_variable_attribute_name */
extern unsigned char ge54os9104;
extern T0* ge54ov9104;
extern T0* T358f12(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.fork_attribute_name */
extern unsigned char ge54os9100;
extern T0* ge54ov9100;
extern T0* T358f11(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.set_fileset */
extern void T451f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.fileset_element_name */
extern unsigned char ge54os9101;
extern T0* ge54ov9101;
extern T0* T358f9(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.set_fork */
extern void T451f30(GE_context* ac, T0* C, T1 a1);
/* GEANT_GEANT_COMMAND.set_filename */
extern void T451f29(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.filename_attribute_name */
extern unsigned char ge54os9097;
extern T0* ge54ov9097;
extern T0* T358f7(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.set_reuse_variables */
extern void T451f28(GE_context* ac, T0* C, T1 a1);
/* GEANT_GEANT_TASK.boolean_value */
extern T1 T358f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.false_attribute_value */
extern T0* T358f23(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.true_attribute_value */
extern T0* T358f22(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.reuse_variables_attribute_name */
extern unsigned char ge54os9099;
extern T0* ge54ov9099;
extern T0* T358f5(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.set_start_target_name */
extern void T451f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.attribute_value */
extern T0* T358f10(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.project_variables_resolver */
extern T0* T358f24(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.has_attribute */
extern T1 T358f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.start_target_attribute_name */
extern unsigned char ge54os9098;
extern T0* ge54ov9098;
extern T0* T358f19(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.make */
extern void T358f36p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEANT_TASK.make */
extern T0* T358f36p1ac1(T0* a1);
/* GEANT_GEANT_TASK.make_with_command */
extern void T358f39(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_TASK.interpreting_element_make */
extern void T358f43(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_TASK.set_project */
extern void T358f45(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.element_make */
extern void T358f44(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.set_xml_element */
extern void T358f46(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.set_command */
extern void T358f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_TASK.build_command */
extern void T358f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.make */
extern T0* T451c26(GE_context* ac, T0* a1);
/* GEANT_GEANT_COMMAND.make */
extern void T451f26p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.set_project */
extern void T451f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_getest_task */
extern T0* T248f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.make */
extern T0* T356c39(GE_context* ac, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force */
extern void T120f53(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_put */
extern void T120f62(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_put */
extern void T120f61(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_put */
extern void T120f60(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_item */
extern T6 T120f30(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_item */
extern T6 T120f33(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].hash_position */
extern T6 T120f28(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].resize */
extern void T120f59(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_resize */
extern void T120f68(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].special_integer_ */
extern T0* T120f38(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_resize */
extern void T120f67(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_resize */
extern void T120f66(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_item */
extern T0* T120f26(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_resize */
extern void T120f65(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_capacity */
extern T6 T120f27(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_put */
extern void T120f58(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].search_position */
extern void T120f57(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.define_element_name */
extern unsigned char ge58os9068;
extern T0* ge58ov9068;
extern T0* T356f20(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.true_attribute_value */
extern T0* T356f19(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.string_ */
extern T0* T356f18(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.elements_by_name */
extern T0* T356f16(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.attribute_element_name */
extern unsigned char ge58os9067;
extern T0* ge58ov9067;
extern T0* T356f15(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.set_abort */
extern void T449f32(GE_context* ac, T0* C, T1 a1);
/* GEANT_GETEST_TASK.abort_attribute_name */
extern unsigned char ge58os9066;
extern T0* ge58ov9066;
extern T0* T356f14(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.set_execution */
extern void T449f31(GE_context* ac, T0* C, T1 a1);
/* GEANT_GETEST_TASK.execution_attribute_name */
extern unsigned char ge58os9065;
extern T0* ge58ov9065;
extern T0* T356f13(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.set_compilation */
extern void T449f30(GE_context* ac, T0* C, T1 a1);
/* GEANT_GETEST_TASK.compilation_attribute_name */
extern unsigned char ge58os9064;
extern T0* ge58ov9064;
extern T0* T356f12(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.set_generation */
extern void T449f29(GE_context* ac, T0* C, T1 a1);
/* GEANT_GETEST_TASK.generation_attribute_name */
extern unsigned char ge58os9063;
extern T0* ge58ov9063;
extern T0* T356f11(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.set_default_test_included */
extern void T449f28(GE_context* ac, T0* C, T1 a1);
/* GEANT_GETEST_TASK.default_test_attribute_name */
extern unsigned char ge58os9062;
extern T0* ge58ov9062;
extern T0* T356f10(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.set_feature_regexp */
extern void T449f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.feature_attribute_name */
extern unsigned char ge58os9061;
extern T0* ge58ov9061;
extern T0* T356f9(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.set_class_regexp */
extern void T449f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.class_attribute_name */
extern unsigned char ge58os9060;
extern T0* ge58ov9060;
extern T0* T356f8(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.set_compile */
extern void T449f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.compile_attribute_name */
extern unsigned char ge58os9059;
extern T0* ge58ov9059;
extern T0* T356f7(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.set_config_filename */
extern void T449f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.attribute_value */
extern T0* T356f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.project_variables_resolver */
extern T0* T356f24(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.config_filename_attribute_name */
extern unsigned char ge58os9058;
extern T0* ge58ov9058;
extern T0* T356f5(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.set_verbose */
extern void T449f23(GE_context* ac, T0* C, T1 a1);
/* GEANT_GETEST_TASK.boolean_value */
extern T1 T356f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.std */
extern T0* T356f26(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.false_attribute_value */
extern T0* T356f25(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.has_attribute */
extern T1 T356f17(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.verbose_attribute_name */
extern unsigned char ge58os9057;
extern T0* ge58ov9057;
extern T0* T356f21(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.make */
extern void T356f39p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GETEST_TASK.make */
extern T0* T356f39p1ac1(T0* a1);
/* GEANT_GETEST_TASK.make_with_command */
extern void T356f41(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GETEST_TASK.interpreting_element_make */
extern void T356f44(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GETEST_TASK.set_project */
extern void T356f46(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.element_make */
extern void T356f45(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.set_xml_element */
extern void T356f47(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.set_command */
extern void T356f43(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.build_command */
extern void T356f40(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.make */
extern T0* T449c22(GE_context* ac, T0* a1);
/* GEANT_GETEST_COMMAND.make */
extern void T449f22p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.set_project */
extern void T449f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_gepp_task */
extern T0* T248f22(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.make */
extern T0* T354c34(GE_context* ac, T0* a1, T0* a2);
/* GEANT_GEPP_COMMAND.set_fileset */
extern void T447f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.fileset_element_name */
extern unsigned char ge57os9032;
extern T0* ge57ov9032;
extern T0* T354f14(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.set_force */
extern void T447f26(GE_context* ac, T0* C, T1 a1);
/* GEANT_GEPP_TASK.force_attribute_name */
extern unsigned char ge57os9031;
extern T0* ge57ov9031;
extern T0* T354f12(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.set_to_directory */
extern void T447f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.to_directory_attribute_name */
extern unsigned char ge57os9030;
extern T0* ge57ov9030;
extern T0* T354f11(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.elements_by_name */
extern T0* T354f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.string_ */
extern T0* T354f17(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.define_element_name */
extern unsigned char ge57os9029;
extern T0* ge57ov9029;
extern T0* T354f8(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.set_empty_lines */
extern void T447f24(GE_context* ac, T0* C, T1 a1);
/* GEANT_GEPP_TASK.boolean_value */
extern T1 T354f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.std */
extern T0* T354f20(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.false_attribute_value */
extern T0* T354f19(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.true_attribute_value */
extern T0* T354f18(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.lines_attribute_name */
extern unsigned char ge57os9028;
extern T0* ge57ov9028;
extern T0* T354f6(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.set_output_filename */
extern void T447f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.output_filename_attribute_name */
extern unsigned char ge57os9027;
extern T0* ge57ov9027;
extern T0* T354f5(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.set_input_filename */
extern void T447f22(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.attribute_value */
extern T0* T354f13(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.project_variables_resolver */
extern T0* T354f21(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.has_attribute */
extern T1 T354f10(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.input_filename_attribute_name */
extern unsigned char ge57os9026;
extern T0* ge57ov9026;
extern T0* T354f15(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.make */
extern void T354f34p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEPP_TASK.make */
extern T0* T354f34p1ac1(T0* a1);
/* GEANT_GEPP_TASK.make_with_command */
extern void T354f36(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_TASK.interpreting_element_make */
extern void T354f39(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_TASK.set_project */
extern void T354f41(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.element_make */
extern void T354f40(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.set_xml_element */
extern void T354f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.set_command */
extern void T354f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.build_command */
extern void T354f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.make */
extern T0* T447c21(GE_context* ac, T0* a1);
/* GEANT_GEPP_COMMAND.make */
extern void T447f21p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.set_project */
extern void T447f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_geyacc_task */
extern T0* T248f20(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.make */
extern T0* T352c35(GE_context* ac, T0* a1, T0* a2);
/* GEANT_GEYACC_COMMAND.set_input_filename */
extern void T445f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.input_filename_attribute_name */
extern unsigned char ge60os9002;
extern T0* ge60ov9002;
extern T0* T352f13(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.set_output_filename */
extern void T445f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.output_filename_attribute_name */
extern unsigned char ge60os9001;
extern T0* ge60ov9001;
extern T0* T352f12(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.set_tokens_filename */
extern void T445f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.tokens_filename_attribute_name */
extern unsigned char ge60os9000;
extern T0* ge60ov9000;
extern T0* T352f11(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.set_tokens_classname */
extern void T445f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.tokens_classname_attribute_name */
extern unsigned char ge60os8999;
extern T0* ge60ov8999;
extern T0* T352f10(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.new_typing_attribute_name */
extern unsigned char ge60os9003;
extern T0* ge60ov9003;
extern T0* T352f9(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.set_verbose_filename */
extern void T445f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.verbose_filename_attribute_name */
extern unsigned char ge60os8998;
extern T0* ge60ov8998;
extern T0* T352f8(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.set_separate_actions */
extern void T445f22(GE_context* ac, T0* C, T1 a1);
/* GEANT_GEYACC_TASK.separate_actions_attribute_name */
extern unsigned char ge60os8997;
extern T0* ge60ov8997;
extern T0* T352f7(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.set_rescue_on_abort */
extern void T445f21(GE_context* ac, T0* C, T1 a1);
/* GEANT_GEYACC_TASK.boolean_value */
extern T1 T352f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.std */
extern T0* T352f21(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.false_attribute_value */
extern T0* T352f20(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.true_attribute_value */
extern T0* T352f19(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.string_ */
extern T0* T352f18(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.rescue_on_abort_attribute_name */
extern unsigned char ge60os8996;
extern T0* ge60ov8996;
extern T0* T352f5(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.set_array_size */
extern void T445f20(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.attribute_value */
extern T0* T352f15(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.project_variables_resolver */
extern T0* T352f22(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.has_attribute */
extern T1 T352f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.array_size_attribute_name */
extern unsigned char ge60os8995;
extern T0* ge60ov8995;
extern T0* T352f17(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.make */
extern void T352f35p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEYACC_TASK.make */
extern T0* T352f35p1ac1(T0* a1);
/* GEANT_GEYACC_TASK.make_with_command */
extern void T352f37(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEYACC_TASK.interpreting_element_make */
extern void T352f40(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEYACC_TASK.set_project */
extern void T352f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.element_make */
extern void T352f41(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.set_xml_element */
extern void T352f43(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.set_command */
extern void T352f39(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.build_command */
extern void T352f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.make */
extern T0* T445c19(GE_context* ac, T0* a1);
/* GEANT_GEYACC_COMMAND.make */
extern void T445f19p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.set_project */
extern void T445f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_gelex_task */
extern T0* T248f18(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.make */
extern T0* T350c39(GE_context* ac, T0* a1, T0* a2);
/* GEANT_GELEX_COMMAND.set_input_filename */
extern void T443f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.input_filename_attribute_name */
extern unsigned char ge56os8964;
extern T0* ge56ov8964;
extern T0* T350f17(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.set_output_filename */
extern void T443f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.output_filename_attribute_name */
extern unsigned char ge56os8963;
extern T0* ge56ov8963;
extern T0* T350f16(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.set_inspect_actions */
extern void T443f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.inspect_actions_attribute_name */
extern unsigned char ge56os8954;
extern T0* ge56ov8954;
extern T0* T350f15(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.set_separate_actions */
extern void T443f32(GE_context* ac, T0* C, T1 a1);
/* GEANT_GELEX_TASK.separate_actions_attribute_name */
extern unsigned char ge56os8962;
extern T0* ge56ov8962;
extern T0* T350f14(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.set_no_warn */
extern void T443f31(GE_context* ac, T0* C, T1 a1);
/* GEANT_GELEX_TASK.no_warn_attribute_name */
extern unsigned char ge56os8961;
extern T0* ge56ov8961;
extern T0* T350f13(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.set_no_default */
extern void T443f30(GE_context* ac, T0* C, T1 a1);
/* GEANT_GELEX_TASK.no_default_attribute_name */
extern unsigned char ge56os8960;
extern T0* ge56ov8960;
extern T0* T350f12(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.set_meta_ecs */
extern void T443f29(GE_context* ac, T0* C, T1 a1);
/* GEANT_GELEX_TASK.meta_ecs_attribute_name */
extern unsigned char ge56os8959;
extern T0* ge56ov8959;
extern T0* T350f11(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.set_case_insensitive */
extern void T443f28(GE_context* ac, T0* C, T1 a1);
/* GEANT_GELEX_TASK.case_insensitive_attribute_name */
extern unsigned char ge56os8958;
extern T0* ge56ov8958;
extern T0* T350f10(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.set_full */
extern void T443f27(GE_context* ac, T0* C, T1 a1);
/* GEANT_GELEX_TASK.full_attribute_name */
extern unsigned char ge56os8957;
extern T0* ge56ov8957;
extern T0* T350f9(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.set_ecs */
extern void T443f26(GE_context* ac, T0* C, T1 a1);
/* GEANT_GELEX_TASK.ecs_attribute_name */
extern unsigned char ge56os8956;
extern T0* ge56ov8956;
extern T0* T350f8(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.set_backup */
extern void T443f25(GE_context* ac, T0* C, T1 a1);
/* GEANT_GELEX_TASK.boolean_value */
extern T1 T350f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.std */
extern T0* T350f25(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.false_attribute_value */
extern T0* T350f24(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.true_attribute_value */
extern T0* T350f23(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.string_ */
extern T0* T350f22(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.backup_attribute_name */
extern unsigned char ge56os8955;
extern T0* ge56ov8955;
extern T0* T350f6(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.array_size_attribute_name */
extern unsigned char ge56os8953;
extern T0* ge56ov8953;
extern T0* T350f5(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.set_array_size */
extern void T443f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.attribute_value */
extern T0* T350f19(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.project_variables_resolver */
extern T0* T350f26(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.has_attribute */
extern T1 T350f18(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.size_attribute_name */
extern unsigned char ge56os8952;
extern T0* ge56ov8952;
extern T0* T350f21(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.make */
extern void T350f39p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GELEX_TASK.make */
extern T0* T350f39p1ac1(T0* a1);
/* GEANT_GELEX_TASK.make_with_command */
extern void T350f41(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GELEX_TASK.interpreting_element_make */
extern void T350f44(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GELEX_TASK.set_project */
extern void T350f46(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.element_make */
extern void T350f45(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.set_xml_element */
extern void T350f47(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.set_command */
extern void T350f43(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.build_command */
extern void T350f40(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.make */
extern T0* T443c23(GE_context* ac, T0* a1);
/* GEANT_GELEX_COMMAND.make */
extern void T443f23p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.set_project */
extern void T443f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_gexace_task */
extern T0* T248f16(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.make */
extern T0* T348c35(GE_context* ac, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force_last */
extern void T120f52(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.elements_by_name */
extern T0* T348f13(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.string_ */
extern T0* T348f19(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.define_element_name */
extern unsigned char ge59os8926;
extern T0* ge59ov8926;
extern T0* T348f12(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.set_output_filename */
extern void T441f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.output_filename_attribute_name */
extern unsigned char ge59os8925;
extern T0* ge59ov8925;
extern T0* T348f11(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.set_xace_filename */
extern void T441f29(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.xace_filename_attribute_name */
extern unsigned char ge59os8924;
extern T0* ge59ov8924;
extern T0* T348f10(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.set_format */
extern void T441f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.format_attribute_name */
extern unsigned char ge59os8923;
extern T0* ge59ov8923;
extern T0* T348f9(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.set_library_command */
extern void T441f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.library_attribute_name */
extern unsigned char ge59os8922;
extern T0* ge59ov8922;
extern T0* T348f8(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.set_system_command */
extern void T441f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.attribute_value */
extern T0* T348f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.project_variables_resolver */
extern T0* T348f18(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.system_attribute_name */
extern unsigned char ge59os8921;
extern T0* ge59ov8921;
extern T0* T348f6(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.set_validate_command */
extern void T441f25(GE_context* ac, T0* C, T1 a1);
/* GEANT_GEXACE_TASK.validate_attribute_name */
extern unsigned char ge59os8920;
extern T0* ge59ov8920;
extern T0* T348f5(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.set_verbose */
extern void T441f24(GE_context* ac, T0* C, T1 a1);
/* GEANT_GEXACE_TASK.boolean_value */
extern T1 T348f17(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.std */
extern T0* T348f22(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.false_attribute_value */
extern T0* T348f21(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.true_attribute_value */
extern T0* T348f20(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.has_attribute */
extern T1 T348f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.verbose_attribute_name */
extern unsigned char ge59os8919;
extern T0* ge59ov8919;
extern T0* T348f15(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.make */
extern void T348f35p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEXACE_TASK.make */
extern T0* T348f35p1ac1(T0* a1);
/* GEANT_GEXACE_TASK.make_with_command */
extern void T348f37(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.interpreting_element_make */
extern void T348f40(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.set_project */
extern void T348f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.element_make */
extern void T348f41(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.set_xml_element */
extern void T348f43(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.set_command */
extern void T348f39(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.build_command */
extern void T348f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.make */
extern T0* T441c23(GE_context* ac, T0* a1);
/* GEANT_GEXACE_COMMAND.make */
extern void T441f23p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.set_project */
extern void T441f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_unset_task */
extern T0* T248f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_UNSET_TASK.make */
extern T0* T346c23(GE_context* ac, T0* a1, T0* a2);
/* GEANT_UNSET_COMMAND.set_name */
extern void T438f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_UNSET_TASK.attribute_value */
extern T0* T346f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_UNSET_TASK.project_variables_resolver */
extern T0* T346f9(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.has_attribute */
extern T1 T346f5(GE_context* ac, T0* C, T0* a1);
/* GEANT_UNSET_TASK.name_attribute_name */
extern unsigned char ge72os8911;
extern T0* ge72ov8911;
extern T0* T346f8(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.make */
extern void T346f23p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_UNSET_TASK.make */
extern T0* T346f23p1ac1(T0* a1);
/* GEANT_UNSET_TASK.make_with_command */
extern void T346f25(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_UNSET_TASK.interpreting_element_make */
extern void T346f28(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_UNSET_TASK.set_project */
extern void T346f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_UNSET_TASK.element_make */
extern void T346f29(GE_context* ac, T0* C, T0* a1);
/* GEANT_UNSET_TASK.set_xml_element */
extern void T346f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_UNSET_TASK.set_command */
extern void T346f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_UNSET_TASK.build_command */
extern void T346f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_UNSET_COMMAND.make */
extern T0* T438c7(GE_context* ac, T0* a1);
/* GEANT_UNSET_COMMAND.set_project */
extern void T438f9(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_set_task */
extern T0* T248f12(GE_context* ac, T0* C, T0* a1);
/* GEANT_SET_TASK.make */
extern T0* T344c24(GE_context* ac, T0* a1, T0* a2);
/* GEANT_SET_COMMAND.set_value */
extern void T436f15(GE_context* ac, T0* C, T0* a1);
/* GEANT_SET_TASK.value_attribute_name */
extern unsigned char ge70os8901;
extern T0* ge70ov8901;
extern T0* T344f5(GE_context* ac, T0* C);
/* GEANT_SET_COMMAND.set_name */
extern void T436f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_SET_TASK.attribute_value */
extern T0* T344f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_SET_TASK.project_variables_resolver */
extern T0* T344f10(GE_context* ac, T0* C);
/* GEANT_SET_TASK.has_attribute */
extern T1 T344f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_SET_TASK.name_attribute_name */
extern unsigned char ge70os8900;
extern T0* ge70ov8900;
extern T0* T344f9(GE_context* ac, T0* C);
/* GEANT_SET_TASK.make */
extern void T344f24p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_SET_TASK.make */
extern T0* T344f24p1ac1(T0* a1);
/* GEANT_SET_TASK.make_with_command */
extern void T344f26(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_SET_TASK.interpreting_element_make */
extern void T344f29(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_SET_TASK.set_project */
extern void T344f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_SET_TASK.element_make */
extern void T344f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_SET_TASK.set_xml_element */
extern void T344f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_SET_TASK.set_command */
extern void T344f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_SET_TASK.build_command */
extern void T344f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_SET_COMMAND.make */
extern T0* T436c13(GE_context* ac, T0* a1);
/* GEANT_SET_COMMAND.set_project */
extern void T436f16(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_lcc_task */
extern T0* T248f10(GE_context* ac, T0* C, T0* a1);
/* GEANT_LCC_TASK.make */
extern T0* T342c24(GE_context* ac, T0* a1, T0* a2);
/* GEANT_LCC_COMMAND.set_source_filename */
extern void T434f15(GE_context* ac, T0* C, T0* a1);
/* GEANT_LCC_TASK.source_filename_attribute_name */
extern unsigned char ge63os8890;
extern T0* ge63ov8890;
extern T0* T342f5(GE_context* ac, T0* C);
/* GEANT_LCC_COMMAND.set_executable */
extern void T434f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_LCC_TASK.attribute_value */
extern T0* T342f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_LCC_TASK.project_variables_resolver */
extern T0* T342f10(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.has_attribute */
extern T1 T342f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_LCC_TASK.executable_attribute_name */
extern unsigned char ge63os8889;
extern T0* ge63ov8889;
extern T0* T342f9(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.make */
extern void T342f24p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_LCC_TASK.make */
extern T0* T342f24p1ac1(T0* a1);
/* GEANT_LCC_TASK.make_with_command */
extern void T342f26(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_LCC_TASK.interpreting_element_make */
extern void T342f29(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_LCC_TASK.set_project */
extern void T342f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_LCC_TASK.element_make */
extern void T342f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_LCC_TASK.set_xml_element */
extern void T342f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_LCC_TASK.set_command */
extern void T342f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_LCC_TASK.build_command */
extern void T342f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_LCC_COMMAND.make */
extern T0* T434c13(GE_context* ac, T0* a1);
/* GEANT_LCC_COMMAND.set_project */
extern void T434f16(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_exec_task */
extern T0* T248f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXEC_TASK.make_from_interpreting_element */
extern T0* T340c22(GE_context* ac, T0* a1);
/* Creation of agent #1 in feature GEANT_EXEC_TASK.make_from_interpreting_element */
extern T0* T340f22ac1(T0* a1, T0* a2);
/* Creation of agent #2 in feature GEANT_EXEC_TASK.make_from_interpreting_element */
extern T0* T340f22ac2(T0* a1, T0* a2);
/* Creation of agent #3 in feature GEANT_EXEC_TASK.make_from_interpreting_element */
extern T0* T340f22ac3(T0* a1, T0* a2);
/* GEANT_EXEC_COMMAND.set_fileset */
extern void T427f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXEC_TASK.fileset_element_name */
extern unsigned char ge52os8876;
extern T0* ge52ov8876;
extern T0* T340f5(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.make_from_interpreting_element */
extern void T340f22p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXEC_TASK.make */
extern void T340f23(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_EXEC_TASK.make */
extern T0* T340f23ac1(T0* a1);
/* GEANT_EXEC_TASK.make_with_command */
extern void T340f25(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_EXEC_TASK.interpreting_element_make */
extern void T340f28(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_EXEC_TASK.set_project */
extern void T340f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXEC_TASK.element_make */
extern void T340f29(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXEC_TASK.set_xml_element */
extern void T340f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXEC_TASK.set_command */
extern void T340f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXEC_TASK.build_command */
extern void T340f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXEC_COMMAND.make */
extern T0* T427c13(GE_context* ac, T0* a1);
/* GEANT_EXEC_COMMAND.make */
extern void T427f13p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXEC_COMMAND.set_project */
extern void T427f15(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_ise_task */
extern T0* T248f6(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.make */
extern T0* T338c36(GE_context* ac, T0* a1, T0* a2);
/* GEANT_ISE_COMMAND.set_exit_code_variable_name */
extern void T424f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.attribute_value */
extern T0* T338f14(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.project_variables_resolver */
extern T0* T338f23(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.exit_code_variable_attribute_name */
extern unsigned char ge62os8849;
extern T0* ge62ov8849;
extern T0* T338f13(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.old_project_path_attribute_name */
extern unsigned char ge62os8848;
extern T0* ge62ov8848;
extern T0* T338f12(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.set_project_path */
extern void T424f29(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.project_path_attribute_name */
extern unsigned char ge62os8847;
extern T0* ge62ov8847;
extern T0* T338f11(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.set_finish_freezing */
extern void T424f28(GE_context* ac, T0* C, T1 a1);
/* GEANT_ISE_TASK.finish_freezing_attribute_name */
extern unsigned char ge62os8845;
extern T0* ge62ov8845;
extern T0* T338f10(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.set_finalize_mode */
extern void T424f27(GE_context* ac, T0* C, T1 a1);
/* GEANT_ISE_TASK.finalize_attribute_name */
extern unsigned char ge62os8844;
extern T0* ge62ov8844;
extern T0* T338f9(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.set_compatible_mode */
extern void T424f26(GE_context* ac, T0* C, T1 a1);
/* GEANT_ISE_TASK.boolean_value */
extern T1 T338f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.std */
extern T0* T338f22(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.false_attribute_value */
extern T0* T338f21(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.true_attribute_value */
extern T0* T338f20(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.string_ */
extern T0* T338f19(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.compatible_attribute_name */
extern unsigned char ge62os8843;
extern T0* ge62ov8843;
extern T0* T338f7(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.set_clean */
extern void T424f25(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.clean_attribute_name */
extern unsigned char ge62os8846;
extern T0* ge62ov8846;
extern T0* T338f6(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.set_system_name */
extern void T424f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.system_attribute_name */
extern unsigned char ge62os8842;
extern T0* ge62ov8842;
extern T0* T338f5(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.set_ace_filename */
extern void T424f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.attribute_value_or_default */
extern T0* T338f16(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.has_attribute */
extern T1 T338f15(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.ace_attribute_name */
extern unsigned char ge62os8841;
extern T0* ge62ov8841;
extern T0* T338f18(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.make */
extern void T338f36p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_ISE_TASK.make */
extern T0* T338f36p1ac1(T0* a1);
/* GEANT_ISE_TASK.make_with_command */
extern void T338f38(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.interpreting_element_make */
extern void T338f41(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.set_project */
extern void T338f43(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.element_make */
extern void T338f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.set_xml_element */
extern void T338f44(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.set_command */
extern void T338f40(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.build_command */
extern void T338f37(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_COMMAND.make */
extern T0* T424c22(GE_context* ac, T0* a1);
/* GEANT_ISE_COMMAND.set_project */
extern void T424f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_gec_task */
extern T0* T248f4(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.make */
extern T0* T332c37(GE_context* ac, T0* a1, T0* a2);
/* GEANT_GEC_COMMAND.set_exit_code_variable_name */
extern void T420f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.exit_code_variable_attribute_name */
extern unsigned char ge55os8795;
extern T0* ge55ov8795;
extern T0* T332f15(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.set_garbage_collector */
extern void T420f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.gc_attribute_name */
extern unsigned char ge55os8797;
extern T0* ge55ov8797;
extern T0* T332f14(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.set_split_size */
extern void T420f33(GE_context* ac, T0* C, T6 a1);
/* GEANT_GEC_TASK.split_size_attribute_name */
extern unsigned char ge55os8800;
extern T0* ge55ov8800;
extern T0* T332f13(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.set_split_mode */
extern void T420f32(GE_context* ac, T0* C, T1 a1);
/* GEANT_GEC_TASK.split_attribute_name */
extern unsigned char ge55os8799;
extern T0* ge55ov8799;
extern T0* T332f12(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.set_catcall_mode */
extern void T420f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.attribute_value */
extern T0* T332f11(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.project_variables_resolver */
extern T0* T332f24(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.catcall_attribute_name */
extern unsigned char ge55os8793;
extern T0* ge55ov8793;
extern T0* T332f10(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.set_gelint */
extern void T420f30(GE_context* ac, T0* C, T1 a1);
/* GEANT_GEC_TASK.gelint_attribute_name */
extern unsigned char ge55os8798;
extern T0* ge55ov8798;
extern T0* T332f9(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.set_finalize */
extern void T420f29(GE_context* ac, T0* C, T1 a1);
/* GEANT_GEC_TASK.finalize_attribute_name */
extern unsigned char ge55os8796;
extern T0* ge55ov8796;
extern T0* T332f8(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.set_c_compile */
extern void T420f28(GE_context* ac, T0* C, T1 a1);
/* GEANT_GEC_TASK.boolean_value */
extern T1 T332f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.std */
extern T0* T332f23(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.false_attribute_value */
extern T0* T332f22(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.true_attribute_value */
extern T0* T332f21(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.string_ */
extern T0* T332f20(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.c_compile_attribute_name */
extern unsigned char ge55os8792;
extern T0* ge55ov8792;
extern T0* T332f6(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.set_clean */
extern void T420f27(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.clean_attribute_name */
extern unsigned char ge55os8794;
extern T0* ge55ov8794;
extern T0* T332f5(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.set_ace_filename */
extern void T420f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.attribute_value_or_default */
extern T0* T332f17(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.has_attribute */
extern T1 T332f16(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.ace_attribute_name */
extern unsigned char ge55os8791;
extern T0* ge55ov8791;
extern T0* T332f19(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.make */
extern void T332f37p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEC_TASK.make */
extern T0* T332f37p1ac1(T0* a1);
/* GEANT_GEC_TASK.make_with_command */
extern void T332f39(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.interpreting_element_make */
extern void T332f42(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.set_project */
extern void T332f44(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.element_make */
extern void T332f43(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.set_xml_element */
extern void T332f45(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.set_command */
extern void T332f41(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.build_command */
extern void T332f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_COMMAND.make */
extern T0* T420c25(GE_context* ac, T0* a1);
/* GEANT_GEC_COMMAND.make */
extern void T420f25p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_COMMAND.set_project */
extern void T420f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.replace_task_name */
extern unsigned char ge79os2953;
extern T0* ge79ov2953;
extern T0* T248f53(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.input_task_name */
extern unsigned char ge79os2952;
extern T0* ge79ov2952;
extern T0* T248f51(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.available_task_name */
extern unsigned char ge79os2951;
extern T0* ge79ov2951;
extern T0* T248f49(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.precursor_task_name */
extern unsigned char ge79os2950;
extern T0* ge79ov2950;
extern T0* T248f47(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.exit_task_name */
extern unsigned char ge79os2949;
extern T0* ge79ov2949;
extern T0* T248f45(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.outofdate_task_name */
extern unsigned char ge79os2948;
extern T0* ge79ov2948;
extern T0* T248f43(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.xslt_task_name */
extern unsigned char ge79os2947;
extern T0* ge79ov2947;
extern T0* T248f41(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.setenv_task_name */
extern unsigned char ge79os2946;
extern T0* ge79ov2946;
extern T0* T248f39(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.move_task_name */
extern unsigned char ge79os2945;
extern T0* ge79ov2945;
extern T0* T248f37(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.copy_task_name */
extern unsigned char ge79os2944;
extern T0* ge79ov2944;
extern T0* T248f35(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.delete_task_name */
extern unsigned char ge79os2943;
extern T0* ge79ov2943;
extern T0* T248f33(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.mkdir_task_name */
extern unsigned char ge79os2942;
extern T0* ge79ov2942;
extern T0* T248f31(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.echo_task_name */
extern unsigned char ge79os2941;
extern T0* ge79ov2941;
extern T0* T248f29(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.geant_task_name */
extern unsigned char ge79os2940;
extern T0* ge79ov2940;
extern T0* T248f27(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.getest_task_name */
extern unsigned char ge79os2939;
extern T0* ge79ov2939;
extern T0* T248f25(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.gepp_task_name */
extern unsigned char ge79os2938;
extern T0* ge79ov2938;
extern T0* T248f23(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.geyacc_task_name */
extern unsigned char ge79os2937;
extern T0* ge79ov2937;
extern T0* T248f21(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.gelex_task_name */
extern unsigned char ge79os2936;
extern T0* ge79ov2936;
extern T0* T248f19(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.gexace_task_name */
extern unsigned char ge79os2935;
extern T0* ge79ov2935;
extern T0* T248f17(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.unset_task_name */
extern unsigned char ge79os2934;
extern T0* ge79ov2934;
extern T0* T248f15(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.set_task_name */
extern unsigned char ge79os2933;
extern T0* ge79ov2933;
extern T0* T248f13(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.lcc_task_name */
extern unsigned char ge79os2932;
extern T0* ge79ov2932;
extern T0* T248f11(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.exec_task_name */
extern unsigned char ge79os2931;
extern T0* ge79ov2931;
extern T0* T248f9(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.ise_task_name */
extern unsigned char ge79os2930;
extern T0* ge79ov2930;
extern T0* T248f7(GE_context* ac, T0* C);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].force_new */
extern void T331f37(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].key_storage_put */
extern void T331f45(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].item_storage_put */
extern void T331f44(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].force */
extern void T418f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].fill_with */
extern void T415f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].extend */
extern void T415f8(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].slots_put */
extern void T331f43(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].clashes_put */
extern void T331f42(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].resize */
extern void T331f41(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].clashes_resize */
extern void T331f50(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].special_integer_ */
extern T0* T331f32(GE_context* ac, T0* C);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].key_storage_resize */
extern void T331f49(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].item_storage_resize */
extern void T331f48(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].aliased_resized_area */
extern T0* T418f1(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].aliased_resized_area */
extern T0* T415f4(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].slots_resize */
extern void T331f47(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].new_modulus */
extern T6 T331f25(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].new_capacity */
extern T6 T331f34(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].unset_found_item */
extern void T331f40(GE_context* ac, T0* C);
/* GEANT_TASK_FACTORY.gec_task_name */
extern unsigned char ge79os2929;
extern T0* ge79ov2929;
extern T0* T248f5(GE_context* ac, T0* C);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].set_key_equality_tester */
extern void T331f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_TASK_FACTORY.string_equality_tester */
extern T0* T248f3(GE_context* ac, T0* C);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_map */
extern T0* T331c35(GE_context* ac, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_with_equality_testers */
extern void T331f39(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_sparse_container */
extern void T331f46(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].set_internal_cursor */
extern void T331f55(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].new_cursor */
extern T0* T331f31(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make */
extern T0* T419c4(GE_context* ac, T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_slots */
extern void T331f54(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_clashes */
extern void T331f53(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_key_storage */
extern void T331f52(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_item_storage */
extern void T331f51(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].make */
extern T0* T418f2(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].make_empty */
extern T0* T415c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].default_create */
extern T0* T418c3(GE_context* ac);
/* GEANT_PROJECT.set_options */
extern void T29f45(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT.set_variables */
extern void T29f44(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.element_make */
extern void T37f21(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.set_xml_element */
extern void T37f24(GE_context* ac, T0* C, T0* a1);
/* XM_TREE_CALLBACKS_PIPE.document */
extern T0* T139f8(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.is_correct */
extern T1 T138f120(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.parse_from_stream */
extern void T138f208(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.parse_with_events */
extern void T138f213(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.on_finish */
extern void T138f219(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.parse */
extern void T138f218(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yy_pop_last_value */
extern void T138f228(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.yy_push_error_value */
extern void T138f227(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yy_do_action */
extern void T138f226(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.on_notation_declaration */
extern void T138f256(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_notation_declaration */
extern void T193f8(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.set_public */
extern void T203f5(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].aliased_resized_area */
extern T0* T202f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_EXTERNAL_ID].aliased_resized_area */
extern T0* T204f4(GE_context* ac, T0* C, T6 a1);
/* XM_DTD_EXTERNAL_ID.set_system */
extern void T203f4(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_dtd_external_id */
extern T0* T138f174(GE_context* ac, T0* C);
/* XM_DTD_EXTERNAL_ID.make */
extern T0* T203c3(GE_context* ac);
/* XM_EIFFEL_PARSER.when_pe_entity_declared */
extern void T138f255(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].force_new */
extern void T189f38(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_put */
extern void T189f52(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_put */
extern void T189f51(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].force */
extern void T291f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].fill_with */
extern void T287f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].extend */
extern void T287f10(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_put */
extern void T189f50(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_put */
extern void T189f49(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_item */
extern T6 T189f28(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].hash_position */
extern T6 T189f27(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_item */
extern T6 T189f26(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].resize */
extern void T189f48(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_resize */
extern void T189f57(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].special_integer_ */
extern T0* T189f33(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_resize */
extern void T189f56(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_resize */
extern void T189f55(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].aliased_resized_area */
extern T0* T291f1(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].aliased_resized_area */
extern T0* T287f4(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_item */
extern T0* T189f23(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_resize */
extern void T189f54(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_modulus */
extern T6 T189f29(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_capacity */
extern T6 T189f24(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].unset_found_item */
extern void T189f43(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].has */
extern T1 T189f31(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].search_position */
extern void T189f40(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_def */
extern T0* T226c210(GE_context* ac, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_literal */
extern void T226f212(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.default_create */
extern T0* T191c3(GE_context* ac);
/* XM_EIFFEL_PE_ENTITY_DEF.make_scanner */
extern void T226f213(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T226f215(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset_sent */
extern void T226f218(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T226f215p1(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T226f215p0(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T226f215p2(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T226f215p3(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.make_with_buffer */
extern void T226f214(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_load_input_buffer */
extern void T226f217(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_content */
extern void T226f220(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_initialize */
extern void T226f216(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_initialize */
extern void T226f216p1(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_build_tables */
extern void T226f219(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template */
extern unsigned char ge1521os7170;
extern T0* ge1521ov7170;
extern T0* T226f54(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_fixed_array */
extern T0* T226f57(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template_5 */
extern void T226f264(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_array_subcopy */
extern void T226f292(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_PE_ENTITY_DEF.integer_array_ */
extern T0* T226f59(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template_4 */
extern void T226f263(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template_3 */
extern void T226f262(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template_2 */
extern void T226f261(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template_1 */
extern void T226f260(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_meta_template */
extern unsigned char ge1521os7169;
extern T0* ge1521ov7169;
extern T0* T226f52(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_ec_template */
extern unsigned char ge1521os7166;
extern T0* ge1521ov7166;
extern T0* T226f93(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_ec_template_2 */
extern void T226f232(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_ec_template_1 */
extern void T226f231(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template */
extern unsigned char ge1521os7160;
extern T0* ge1521ov7160;
extern T0* T226f71(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template_5 */
extern void T226f230(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template_4 */
extern void T226f229(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template_3 */
extern void T226f228(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template_2 */
extern void T226f227(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template_1 */
extern void T226f226(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template */
extern unsigned char ge1521os7154;
extern T0* ge1521ov7154;
extern T0* T226f61(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template_5 */
extern void T226f225(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template_4 */
extern void T226f224(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template_3 */
extern void T226f223(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template_2 */
extern void T226f222(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template_1 */
extern void T226f221(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template */
extern unsigned char ge1521os7126;
extern T0* ge1521ov7126;
extern T0* T226f55(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_27 */
extern void T226f291(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_26 */
extern void T226f290(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_25 */
extern void T226f289(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_24 */
extern void T226f288(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_23 */
extern void T226f287(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_22 */
extern void T226f286(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_21 */
extern void T226f285(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_20 */
extern void T226f284(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_19 */
extern void T226f283(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_18 */
extern void T226f282(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_17 */
extern void T226f281(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_16 */
extern void T226f280(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_15 */
extern void T226f279(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_14 */
extern void T226f278(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_13 */
extern void T226f277(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_12 */
extern void T226f276(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_11 */
extern void T226f275(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_10 */
extern void T226f274(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_9 */
extern void T226f273(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_8 */
extern void T226f272(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_7 */
extern void T226f271(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_6 */
extern void T226f270(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_5 */
extern void T226f269(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_4 */
extern void T226f268(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_3 */
extern void T226f267(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_2 */
extern void T226f266(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_1 */
extern void T226f265(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template */
extern unsigned char ge1521os7098;
extern T0* ge1521ov7098;
extern T0* T226f51(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_27 */
extern void T226f259(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_26 */
extern void T226f258(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_25 */
extern void T226f257(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_24 */
extern void T226f256(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_23 */
extern void T226f255(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_22 */
extern void T226f254(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_21 */
extern void T226f253(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_20 */
extern void T226f252(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_19 */
extern void T226f251(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_18 */
extern void T226f250(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_17 */
extern void T226f249(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_16 */
extern void T226f248(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_15 */
extern void T226f247(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_14 */
extern void T226f246(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_13 */
extern void T226f245(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_12 */
extern void T226f244(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_11 */
extern void T226f243(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_10 */
extern void T226f242(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_9 */
extern void T226f241(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_8 */
extern void T226f240(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_7 */
extern void T226f239(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_6 */
extern void T226f238(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_5 */
extern void T226f237(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_4 */
extern void T226f236(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_3 */
extern void T226f235(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_2 */
extern void T226f234(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_1 */
extern void T226f233(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.special_integer_ */
extern T0* T226f56(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.empty_buffer */
extern T0* T226f53(GE_context* ac, T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.make */
extern T0* T278c8(GE_context* ac);
/* XM_EIFFEL_PE_ENTITY_DEF.make_external */
extern void T226f211(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.new_external_entity */
extern T0* T138f173(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.make_external */
extern T0* T223c209(GE_context* ac, T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_scanner */
extern void T223f210(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T223f212(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T223f212p1(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T223f212p0(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T223f212p2(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.make_with_buffer */
extern void T223f211(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_load_input_buffer */
extern void T223f214(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_content */
extern void T223f216(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_initialize */
extern void T223f213(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_initialize */
extern void T223f213p1(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_build_tables */
extern void T223f215(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template */
extern T0* T223f52(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_fixed_array */
extern T0* T223f55(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template_5 */
extern void T223f260(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_array_subcopy */
extern void T223f288(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_ENTITY_DEF.integer_array_ */
extern T0* T223f57(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template_4 */
extern void T223f259(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template_3 */
extern void T223f258(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template_2 */
extern void T223f257(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template_1 */
extern void T223f256(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_meta_template */
extern T0* T223f50(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_ec_template */
extern T0* T223f90(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_ec_template_2 */
extern void T223f228(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_ec_template_1 */
extern void T223f227(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template */
extern T0* T223f69(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template_5 */
extern void T223f226(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template_4 */
extern void T223f225(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template_3 */
extern void T223f224(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template_2 */
extern void T223f223(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template_1 */
extern void T223f222(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template */
extern T0* T223f59(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template_5 */
extern void T223f221(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template_4 */
extern void T223f220(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template_3 */
extern void T223f219(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template_2 */
extern void T223f218(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template_1 */
extern void T223f217(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template */
extern T0* T223f53(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_27 */
extern void T223f287(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_26 */
extern void T223f286(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_25 */
extern void T223f285(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_24 */
extern void T223f284(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_23 */
extern void T223f283(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_22 */
extern void T223f282(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_21 */
extern void T223f281(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_20 */
extern void T223f280(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_19 */
extern void T223f279(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_18 */
extern void T223f278(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_17 */
extern void T223f277(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_16 */
extern void T223f276(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_15 */
extern void T223f275(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_14 */
extern void T223f274(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_13 */
extern void T223f273(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_12 */
extern void T223f272(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_11 */
extern void T223f271(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_10 */
extern void T223f270(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_9 */
extern void T223f269(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_8 */
extern void T223f268(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_7 */
extern void T223f267(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_6 */
extern void T223f266(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_5 */
extern void T223f265(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_4 */
extern void T223f264(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_3 */
extern void T223f263(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_2 */
extern void T223f262(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_1 */
extern void T223f261(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template */
extern T0* T223f49(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_27 */
extern void T223f255(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_26 */
extern void T223f254(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_25 */
extern void T223f253(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_24 */
extern void T223f252(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_23 */
extern void T223f251(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_22 */
extern void T223f250(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_21 */
extern void T223f249(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_20 */
extern void T223f248(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_19 */
extern void T223f247(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_18 */
extern void T223f246(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_17 */
extern void T223f245(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_16 */
extern void T223f244(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_15 */
extern void T223f243(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_14 */
extern void T223f242(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_13 */
extern void T223f241(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_12 */
extern void T223f240(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_11 */
extern void T223f239(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_10 */
extern void T223f238(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_9 */
extern void T223f237(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_8 */
extern void T223f236(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_7 */
extern void T223f235(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_6 */
extern void T223f234(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_5 */
extern void T223f233(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_4 */
extern void T223f232(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_3 */
extern void T223f231(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_2 */
extern void T223f230(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_1 */
extern void T223f229(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.special_integer_ */
extern T0* T223f70(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.empty_buffer */
extern T0* T223f65(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.on_entity_declaration */
extern void T138f254(GE_context* ac, T0* C, T0* a1, T1 a2, T0* a3, T0* a4, T0* a5);
/* XM_DTD_CALLBACKS_NULL.on_entity_declaration */
extern void T193f7(GE_context* ac, T0* C, T0* a1, T1 a2, T0* a3, T0* a4, T0* a5);
/* XM_EIFFEL_PARSER.when_entity_declared */
extern void T138f253(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.new_literal_entity */
extern T0* T138f172(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_literal */
extern T0* T223c208(GE_context* ac, T0* a1, T0* a2);
/* XM_DTD_ATTRIBUTE_CONTENT.set_default_value */
extern void T212f26(GE_context* ac, T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_fixed */
extern void T212f25(GE_context* ac, T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_implied */
extern void T212f24(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_required */
extern void T212f23(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].aliased_resized_area */
extern T0* T214f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].aliased_resized_area */
extern T0* T216f4(GE_context* ac, T0* C, T6 a1);
/* DS_BILINKED_LIST [STRING_8].force_last */
extern void T215f11(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [STRING_8].put_right */
extern void T300f5(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [STRING_8].attach_left */
extern void T300f6(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [STRING_8].make */
extern T0* T300c4(GE_context* ac, T0* a1);
/* XM_EIFFEL_PARSER.new_string_bilinked_list */
extern T0* T138f169(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [STRING_8].set_equality_tester */
extern void T215f12(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.string_equality_tester */
extern T0* T138f184(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [STRING_8].make */
extern T0* T215c10(GE_context* ac);
/* DS_BILINKED_LIST [STRING_8].set_internal_cursor */
extern void T215f13(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].new_cursor */
extern T0* T215f6(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].make */
extern T0* T299c8(GE_context* ac, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].force */
extern void T214f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].fill_with */
extern void T216f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].extend */
extern void T216f10(GE_context* ac, T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration_list */
extern void T212f22(GE_context* ac, T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration */
extern void T212f27(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.default_enumeration_list */
extern unsigned char ge1431os7996;
extern T0* ge1431ov7996;
extern T0* T212f11(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_notation */
extern void T212f21(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_token */
extern void T212f20(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_entity */
extern void T212f19(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_list_type */
extern void T212f18(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id_ref */
extern void T212f17(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id */
extern void T212f16(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_data */
extern void T212f15(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content */
extern T0* T138f168(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].aliased_resized_area */
extern T0* T211f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].aliased_resized_area */
extern T0* T213f4(GE_context* ac, T0* C, T6 a1);
/* XM_DTD_ATTRIBUTE_CONTENT.make */
extern T0* T212c12(GE_context* ac);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].force */
extern void T211f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].fill_with */
extern void T213f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].extend */
extern void T213f10(GE_context* ac, T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.copy_default */
extern void T212f14(GE_context* ac, T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_implied */
extern T1 T212f10(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_required */
extern T1 T212f9(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.has_default_value */
extern T1 T212f8(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_fixed */
extern T1 T212f7(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_name */
extern void T212f13(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].force */
extern void T208f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].fill_with */
extern void T210f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].extend */
extern void T210f10(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].aliased_resized_area */
extern T0* T208f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].aliased_resized_area */
extern T0* T210f4(GE_context* ac, T0* C, T6 a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].force_last */
extern void T209f8(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].put_right */
extern void T297f5(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].attach_left */
extern void T297f6(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T297c4(GE_context* ac, T0* a1);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content_list */
extern T0* T138f166(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T209c7(GE_context* ac);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].set_internal_cursor */
extern void T209f9(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].new_cursor */
extern T0* T209f5(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T296c8(GE_context* ac, T0* a1);
/* XM_EIFFEL_PARSER.on_attribute_declarations */
extern void T138f252(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].forth */
extern void T296f10(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_forth */
extern void T209f11(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].add_traversing_cursor */
extern void T209f12(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set_next_cursor */
extern void T296f12(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].remove_traversing_cursor */
extern void T209f13(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set */
extern void T296f11(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* XM_EIFFEL_PARSER.on_attribute_declaration */
extern void T138f262(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_DTD_CALLBACKS_NULL.on_attribute_declaration */
extern void T193f9(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].item */
extern T0* T296f6(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].start */
extern void T296f9(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_start */
extern void T209f10(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_off */
extern T1 T209f6(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].off */
extern T1 T296f7(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_more */
extern void T206f11(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_mixed */
extern T0* T206c10(GE_context* ac);
/* XM_DTD_ELEMENT_CONTENT.set_content_mixed */
extern void T206f21(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_choice */
extern void T206f19(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_list */
extern void T206f16(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_default */
extern void T206f22(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one */
extern void T206f12(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_sequence */
extern void T206f20(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T295c6(GE_context* ac);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].set_internal_cursor */
extern void T295f9(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].new_cursor */
extern T0* T295f5(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T403c3(GE_context* ac, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_sequence */
extern T0* T206c9(GE_context* ac);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_last */
extern void T295f8(GE_context* ac, T0* C, T0* a1);
/* attached DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].put_right */
extern void T404f5(GE_context* ac, T0* C, T0* a1);
/* attached DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].attach_left */
extern void T404f6(GE_context* ac, T0* C, T0* a1);
/* attached DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T404c4(GE_context* ac, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_choice */
extern T0* T206c8(GE_context* ac);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_first */
extern void T295f7(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.element_name */
extern T0* T138f161(GE_context* ac, T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_name */
extern T0* T206c15(GE_context* ac, T0* a1);
/* XM_EIFFEL_PARSER.set_element_repetition */
extern void T138f251(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_one */
extern void T206f14(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one_or_more */
extern void T206f13(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_any */
extern T0* T206c7(GE_context* ac);
/* XM_DTD_ELEMENT_CONTENT.set_content_any */
extern void T206f18(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].force */
extern void T205f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].fill_with */
extern void T207f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].extend */
extern void T207f10(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].aliased_resized_area */
extern T0* T205f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].aliased_resized_area */
extern T0* T207f4(GE_context* ac, T0* C, T6 a1);
/* XM_DTD_ELEMENT_CONTENT.make_empty */
extern T0* T206c6(GE_context* ac);
/* XM_DTD_ELEMENT_CONTENT.set_content_empty */
extern void T206f17(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.on_element_declaration */
extern void T138f250(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_element_declaration */
extern void T193f6(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_attribute */
extern void T138f249(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].has */
extern T1 T200f30(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].search_position */
extern void T200f33(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].hash_position */
extern T6 T200f24(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.hash_code */
extern T6 T197f16(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.item */
extern T0* T197f17(GE_context* ac, T0* C, T6 a1);
/* DS_BILINKED_LIST [STRING_8].item */
extern T0* T215f8(GE_context* ac, T0* C, T6 a1);
/* detachable KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].test */
extern T1 T293f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_storage_item */
extern T0* T200f19(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_item */
extern T0* T200f29(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_item */
extern T6 T200f23(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_equality_tester */
extern T0* T200f17(GE_context* ac, T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_item */
extern T6 T200f25(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].force */
extern void T199f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].fill_with */
extern void T201f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].extend */
extern void T201f10(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].aliased_resized_area */
extern T0* T199f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].aliased_resized_area */
extern T0* T201f4(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].force_new */
extern void T200f32(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_put */
extern void T200f39(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_put */
extern void T200f38(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_put */
extern void T200f37(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].resize */
extern void T200f36(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_resize */
extern void T200f48(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].special_integer_ */
extern T0* T200f28(GE_context* ac, T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_storage_resize */
extern void T200f47(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_resize */
extern void T200f46(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_resize */
extern void T200f45(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_modulus */
extern T6 T200f20(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_capacity */
extern T6 T200f26(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].unset_found_item */
extern void T200f35(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.new_name_set */
extern T0* T138f154(GE_context* ac, T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_equal */
extern T0* T200c31(GE_context* ac, T6 a1);
/* detachable KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T293c2(GE_context* ac);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make */
extern void T200f34(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].set_internal_cursor */
extern void T200f44(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_cursor */
extern T0* T200f21(GE_context* ac, T0* C);
/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME].make */
extern T0* T294c4(GE_context* ac, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_slots */
extern void T200f43(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_clashes */
extern void T200f42(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_key_storage */
extern void T200f41(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_item_storage */
extern void T200f40(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].make */
extern T0* T196f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].make_empty */
extern T0* T198c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T196c3(GE_context* ac);
/* XM_EIFFEL_PARSER.on_start_tag */
extern void T138f248(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER.on_end_tag */
extern void T138f247(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER_NAME.local_part */
extern T0* T197f11(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].forth */
extern void T299f10(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [STRING_8].cursor_forth */
extern void T215f15(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].add_traversing_cursor */
extern void T215f16(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T299f12(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].remove_traversing_cursor */
extern void T215f17(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].set */
extern void T299f11(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [STRING_8].item */
extern T0* T299f6(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].start */
extern void T299f9(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [STRING_8].cursor_start */
extern void T215f14(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].cursor_off */
extern T1 T215f9(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].off */
extern T1 T299f7(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.string_ */
extern T0* T197f10(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.last */
extern T0* T197f9(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [STRING_8].last */
extern T0* T215f7(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.ns_prefix */
extern T0* T197f8(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.is_namespace_name */
extern T1 T197f7(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern void T197f18(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern T0* T197c18(GE_context* ac);
/* XM_EIFFEL_PARSER_NAME.new_string_bilinked_list */
extern T0* T197f15(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.string_equality_tester */
extern T0* T197f14(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.on_start_tag_finish */
extern void T138f246(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.is_equal */
extern T1 T197f6(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.same_string */
extern T1 T197f13(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_SPECIAL_ROUTINES [BOOLEAN].force */
extern void T217f6(GE_context* ac, T0* C, T0* a1, T1 a2, T6 a3);
/* KL_SPECIAL_ROUTINES [BOOLEAN].aliased_resized_area */
extern T0* T217f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [BOOLEAN].aliased_resized_area */
extern T0* T96f4(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.when_external_dtd */
extern void T138f245(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern T0* T224c201(GE_context* ac);
/* XM_EIFFEL_SCANNER_DTD.set_start_condition */
extern void T224f208(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern void T224f201p1(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T224f210(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T224f210p1(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T224f210p0(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_with_buffer */
extern void T224f209(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_load_input_buffer */
extern void T224f220(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_content */
extern void T224f221(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_initialize */
extern void T224f219(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_initialize */
extern void T224f219p1(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_build_tables */
extern void T224f224(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template */
extern T0* T224f195(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_fixed_array */
extern T0* T224f198(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template_5 */
extern void T224f295(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_array_subcopy */
extern void T224f296(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_SCANNER_DTD.integer_array_ */
extern T0* T224f200(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template_4 */
extern void T224f294(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template_3 */
extern void T224f293(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template_2 */
extern void T224f292(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template_1 */
extern void T224f291(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_meta_template */
extern T0* T224f194(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_ec_template */
extern T0* T224f193(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_ec_template_2 */
extern void T224f290(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_ec_template_1 */
extern void T224f289(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template */
extern T0* T224f192(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template_5 */
extern void T224f288(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template_4 */
extern void T224f287(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template_3 */
extern void T224f286(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template_2 */
extern void T224f285(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template_1 */
extern void T224f284(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template */
extern T0* T224f191(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template_5 */
extern void T224f283(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template_4 */
extern void T224f282(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template_3 */
extern void T224f281(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template_2 */
extern void T224f280(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template_1 */
extern void T224f279(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template */
extern T0* T224f190(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_27 */
extern void T224f278(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_26 */
extern void T224f277(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_25 */
extern void T224f276(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_24 */
extern void T224f275(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_23 */
extern void T224f274(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_22 */
extern void T224f273(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_21 */
extern void T224f272(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_20 */
extern void T224f271(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_19 */
extern void T224f270(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_18 */
extern void T224f269(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_17 */
extern void T224f268(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_16 */
extern void T224f267(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_15 */
extern void T224f266(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_14 */
extern void T224f265(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_13 */
extern void T224f264(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_12 */
extern void T224f263(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_11 */
extern void T224f262(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_10 */
extern void T224f261(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_9 */
extern void T224f260(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_8 */
extern void T224f259(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_7 */
extern void T224f258(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_6 */
extern void T224f257(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_5 */
extern void T224f256(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_4 */
extern void T224f255(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_3 */
extern void T224f254(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_2 */
extern void T224f253(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_1 */
extern void T224f252(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template */
extern T0* T224f189(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_27 */
extern void T224f251(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_26 */
extern void T224f250(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_25 */
extern void T224f249(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_24 */
extern void T224f248(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_23 */
extern void T224f247(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_22 */
extern void T224f246(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_21 */
extern void T224f245(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_20 */
extern void T224f244(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_19 */
extern void T224f243(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_18 */
extern void T224f242(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_17 */
extern void T224f241(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_16 */
extern void T224f240(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_15 */
extern void T224f239(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_14 */
extern void T224f238(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_13 */
extern void T224f237(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_12 */
extern void T224f236(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_11 */
extern void T224f235(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_10 */
extern void T224f234(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_9 */
extern void T224f233(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_8 */
extern void T224f232(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_7 */
extern void T224f231(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_6 */
extern void T224f230(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_5 */
extern void T224f229(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_4 */
extern void T224f228(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_3 */
extern void T224f227(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_2 */
extern void T224f226(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_1 */
extern void T224f225(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.special_integer_ */
extern T0* T224f62(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.empty_buffer */
extern T0* T224f50(GE_context* ac, T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].force */
extern void T187f8(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.null_resolver */
extern unsigned char ge1519os5780;
extern T0* ge1519ov5780;
extern T0* T138f94(GE_context* ac, T0* C);
/* XM_NULL_EXTERNAL_RESOLVER.last_error */
extern T0* T191f1(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.resolve_external_id */
extern void T138f261(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.resolve */
extern void T191f5(GE_context* ac, T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_public */
extern void T191f4(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].force */
extern void T202f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_DTD_EXTERNAL_ID].fill_with */
extern void T204f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_EXTERNAL_ID].extend */
extern void T204f10(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_dtd_end */
extern void T138f244(GE_context* ac, T0* C);
/* XM_DTD_CALLBACKS_NULL.on_dtd_end */
extern void T193f5(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.on_doctype */
extern void T138f243(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* XM_DTD_CALLBACKS_NULL.on_doctype */
extern void T193f4(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* XM_EIFFEL_DECLARATION.set_encoding */
extern void T219f9(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_DECLARATION.set_stand_alone */
extern void T219f8(GE_context* ac, T0* C, T1 a1);
/* XM_EIFFEL_DECLARATION.set_version */
extern void T219f11(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].force */
extern void T218f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_EIFFEL_DECLARATION].fill_with */
extern void T220f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_DECLARATION].extend */
extern void T220f10(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].aliased_resized_area */
extern T0* T218f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_DECLARATION].aliased_resized_area */
extern T0* T220f4(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_DECLARATION.make */
extern T0* T219c7(GE_context* ac);
/* XM_EIFFEL_DECLARATION.process */
extern void T219f10(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_xml_declaration */
extern void T138f287(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* XM_EIFFEL_PARSER.apply_encoding */
extern void T138f242(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_content */
extern void T138f241(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_dtd_processing_instruction */
extern void T138f240(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_dtd_processing_instruction */
extern void T193f3(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_processing_instruction */
extern void T138f239(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_dtd_comment */
extern void T138f238(GE_context* ac, T0* C, T0* a1);
/* XM_DTD_CALLBACKS_NULL.on_dtd_comment */
extern void T193f2(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_comment */
extern void T138f237(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.entity_referenced_in_entity_value */
extern T0* T138f144(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.defined_entity_referenced */
extern T0* T138f196(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.external_entity_to_string */
extern T0* T138f202(GE_context* ac, T0* C, T0* a1);
/* STRING_8.remove */
extern void T17f54(GE_context* ac, T0* C, T6 a1);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_finish */
extern void T191f6(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.read_string */
extern void T266f29(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_INPUT_STREAM.last_character */
extern T2 T266f19(GE_context* ac, T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].item */
extern T2 T391f4(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.end_of_input */
extern T1 T266f18(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.end_of_input */
extern T1 T97f31(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.read_character */
extern void T266f31(GE_context* ac, T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].remove */
extern void T391f6(GE_context* ac, T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].wipe_out */
extern void T391f8(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.noqueue_read_character */
extern void T266f33(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf16_read_character */
extern void T266f35(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.append_character */
extern void T266f36(GE_context* ac, T0* C, T6 a1);
/* DS_LINKED_QUEUE [CHARACTER_8].force */
extern void T391f7(GE_context* ac, T0* C, T2 a1);
/* detachable DS_LINKABLE [CHARACTER_8].put_right */
extern void T485f4(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [CHARACTER_8].make */
extern T0* T485c3(GE_context* ac, T2 a1);
/* UC_UTF8_ROUTINES.append_code_to_utf8 */
extern void T264f37(GE_context* ac, T0* C, T0* a1, T6 a2);
/* UC_UTF8_ROUTINES.integer_ */
extern T0* T264f29(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf8 */
extern T0* T266f22(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf8_buffer */
extern unsigned char ge1514os8403;
extern T0* ge1514ov8403;
extern T0* T266f25(GE_context* ac, T0* C);
/* UC_UTF16_ROUTINES.surrogate */
extern T6 T392f7(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_low_surrogate */
extern T1 T392f6(GE_context* ac, T0* C, T6 a1);
/* UC_UTF16_ROUTINES.least_10_bits */
extern T6 T392f5(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_high_surrogate */
extern T1 T392f4(GE_context* ac, T0* C, T6 a1);
/* UC_UTF16_ROUTINES.is_surrogate */
extern T1 T392f3(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16 */
extern unsigned char ge218os5131;
extern T0* ge218ov5131;
extern T0* T266f20(GE_context* ac, T0* C);
/* UC_UTF16_ROUTINES.default_create */
extern T0* T392c16(GE_context* ac);
/* XM_EIFFEL_INPUT_STREAM.least_significant */
extern T6 T266f24(GE_context* ac, T0* C, T2 a1, T2 a2);
/* XM_EIFFEL_INPUT_STREAM.most_significant */
extern T6 T266f23(GE_context* ac, T0* C, T2 a1, T2 a2);
/* XM_EIFFEL_INPUT_STREAM.latin1_read_character */
extern void T266f34(GE_context* ac, T0* C);
/* KL_STRING_INPUT_STREAM.read_character */
extern void T412f10(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.read_character */
extern void T97f72(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.old_read_character */
extern void T97f73(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.file_gc */
extern T2 T97f34(GE_context* ac, T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.old_end_of_file */
extern T1 T97f33(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.file_feof */
extern T1 T97f35(GE_context* ac, T0* C, T14 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16_detect_read_character */
extern void T266f32(GE_context* ac, T0* C);
/* UC_UTF8_ROUTINES.is_endian_detection_character */
extern T1 T264f31(GE_context* ac, T0* C, T2 a1, T2 a2, T2 a3);
/* UC_UTF8_ROUTINES.is_endian_detection_character_start */
extern T1 T264f30(GE_context* ac, T0* C, T2 a1, T2 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_least_first */
extern T1 T392f2(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_most_first */
extern T1 T392f1(GE_context* ac, T0* C, T6 a1, T6 a2);
/* KL_STRING_ROUTINES.wipe_out */
extern void T115f21(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.string_ */
extern T0* T266f17(GE_context* ac, T0* C);
/* KL_PLATFORM.maximum_integer */
extern unsigned char ge201os8464;
extern T6 ge201ov8464;
extern T6 T268f2(GE_context* ac, T0* C);
/* KL_INTEGER_ROUTINES.platform */
extern T0* T267f1(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.integer_ */
extern T0* T138f203(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.make_from_stream */
extern T0* T266c28(GE_context* ac, T0* a1);
/* DS_LINKED_QUEUE [CHARACTER_8].make */
extern T0* T391c5(GE_context* ac);
/* XM_NULL_EXTERNAL_RESOLVER.last_stream */
extern T0* T191f2(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item */
extern T0* T189f21(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_item */
extern T0* T189f35(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.force_error */
extern void T138f236(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.report_error */
extern void T138f234(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_error */
extern void T138f260(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.setup_error_state */
extern void T138f259(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.onstring_utf8 */
extern T0* T138f133(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.maximum_item_code */
extern T6 T138f191(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_latin1 */
extern T1 T138f190(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_from_utf8 */
extern T0* T138f186(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.make_from_utf8 */
extern T0* T265c58(GE_context* ac, T0* a1);
/* UC_UTF8_STRING.append_utf8 */
extern void T265f72(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_ROUTINES.valid_utf8 */
extern T1 T264f1(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_ROUTINES.is_encoded_next_byte */
extern T1 T264f10(GE_context* ac, T0* C, T2 a1);
/* UC_UTF8_ROUTINES.is_encoded_second_byte */
extern T1 T264f5(GE_context* ac, T0* C, T2 a1, T2 a2);
/* UC_UTF8_ROUTINES.is_encoded_first_byte */
extern T1 T264f2(GE_context* ac, T0* C, T2 a1);
/* XM_EIFFEL_PARSER.utf8 */
extern T0* T138f189(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.is_string_mode_ascii */
extern T1 T138f187(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.onstring_ascii */
extern T0* T138f131(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_unicode */
extern T1 T138f185(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string */
extern T0* T138f142(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_string */
extern unsigned char ge1519os5847;
extern T0* ge1519ov5847;
extern T0* T138f195(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_uc */
extern unsigned char ge1519os5848;
extern T0* ge1519ov5848;
extern T0* T138f194(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_empty */
extern T0* T138f201(GE_context* ac, T0* C);
/* UC_UTF8_STRING.make_empty */
extern T0* T265c62(GE_context* ac);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].force */
extern void T196f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].fill_with */
extern void T198f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].extend */
extern void T198f10(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].aliased_resized_area */
extern T0* T196f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].aliased_resized_area */
extern T0* T198f4(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.namespace_force_last */
extern void T138f235(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER_NAME.force_last */
extern void T197f19(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.can_force_last */
extern T1 T197f12(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_namespace_name */
extern T0* T138f141(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.make_namespaces */
extern T0* T197c20(GE_context* ac);
/* XM_EIFFEL_PARSER.yy_push_last_value */
extern void T138f225(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.accept */
extern void T138f224(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yy_do_error_action */
extern void T138f222(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.report_eof_expected_error */
extern void T138f233(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.read_token */
extern void T138f221(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.process_attribute_entity */
extern void T138f232(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_entity_scanner */
extern void T138f258(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_start_condition */
extern void T223f290(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_start_condition */
extern void T226f294(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.apply_input_buffer */
extern void T223f289(GE_context* ac, T0* C);
/* KL_STRING_INPUT_STREAM.make */
extern T0* T412c9(GE_context* ac, T0* a1);
/* UC_UTF8_ROUTINES.to_utf8 */
extern T0* T264f32(GE_context* ac, T0* C, T0* a1);
extern T1 T264f32ot1(T0* a1, T0** a2);
/* XM_EIFFEL_ENTITY_DEF.utf8 */
extern T0* T223f68(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.fatal_error */
extern void T223f297(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.apply_input_buffer */
extern void T226f293(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.utf8 */
extern T0* T226f70(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.fatal_error */
extern void T226f301(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.is_literal */
extern T1 T223f63(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.is_external */
extern T1 T223f66(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_literal */
extern T1 T226f65(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_external */
extern T1 T226f68(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.process_entity */
extern void T138f231(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_pe_entity */
extern void T138f230(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.special_integer_ */
extern T0* T138f124(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yy_init_value_stacks */
extern void T138f220(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yy_clear_all */
extern void T138f229(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.clear_all */
extern void T138f257(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.clear_stacks */
extern void T138f263(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yy_clear_value_stacks */
extern void T138f264(GE_context* ac, T0* C);
/* SPECIAL [XM_EIFFEL_DECLARATION].keep_head */
extern void T220f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_DECLARATION].set_count */
extern void T220f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [BOOLEAN].keep_head */
extern void T96f12(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [BOOLEAN].set_count */
extern void T96f13(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].keep_head */
extern void T216f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].set_count */
extern void T216f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].keep_head */
extern void T213f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].set_count */
extern void T213f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].keep_head */
extern void T210f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].set_count */
extern void T210f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].keep_head */
extern void T207f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].set_count */
extern void T207f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].keep_head */
extern void T204f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].set_count */
extern void T204f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].keep_head */
extern void T201f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].set_count */
extern void T201f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].keep_head */
extern void T198f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].set_count */
extern void T198f9(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.abort */
extern void T138f223(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.on_start */
extern void T138f217(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.reset_error_state */
extern void T138f216(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.reset */
extern void T138f212(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].wipe_out */
extern void T189f37(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_wipe_out */
extern void T189f47(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_wipe_out */
extern void T189f46(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_wipe_out */
extern void T189f45(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_wipe_out */
extern void T189f44(GE_context* ac, T0* C);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].keep_head */
extern void T287f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].set_count */
extern void T287f9(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].move_all_cursors_after */
extern void T189f42(GE_context* ac, T0* C);
/* detachable DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].set_next_cursor */
extern void T290f8(GE_context* ac, T0* C, T0* a1);
/* detachable DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].set_after */
extern void T290f7(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.make_scanner */
extern void T138f210(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.make_scanner */
extern T0* T183c199(GE_context* ac);
/* XM_EIFFEL_SCANNER.reset */
extern void T183f207(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.reset */
extern void T183f207p1(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.reset */
extern void T183f207p0(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.make_with_buffer */
extern void T183f206(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_load_input_buffer */
extern void T183f215(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_set_content */
extern void T183f216(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_initialize */
extern void T183f214(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_initialize */
extern void T183f214p1(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_build_tables */
extern void T183f222(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_accept_template */
extern T0* T183f193(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_fixed_array */
extern T0* T183f196(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_accept_template_5 */
extern void T183f293(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_array_subcopy */
extern void T183f294(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_SCANNER.integer_array_ */
extern T0* T183f198(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_accept_template_4 */
extern void T183f292(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_accept_template_3 */
extern void T183f291(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_accept_template_2 */
extern void T183f290(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_accept_template_1 */
extern void T183f289(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_meta_template */
extern T0* T183f192(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_ec_template */
extern T0* T183f191(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_ec_template_2 */
extern void T183f288(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_ec_template_1 */
extern void T183f287(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_def_template */
extern T0* T183f190(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_def_template_5 */
extern void T183f286(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_def_template_4 */
extern void T183f285(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_def_template_3 */
extern void T183f284(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_def_template_2 */
extern void T183f283(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_def_template_1 */
extern void T183f282(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_base_template */
extern T0* T183f189(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_base_template_5 */
extern void T183f281(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_base_template_4 */
extern void T183f280(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_base_template_3 */
extern void T183f279(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_base_template_2 */
extern void T183f278(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_base_template_1 */
extern void T183f277(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template */
extern T0* T183f188(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_27 */
extern void T183f276(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_26 */
extern void T183f275(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_25 */
extern void T183f274(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_24 */
extern void T183f273(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_23 */
extern void T183f272(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_22 */
extern void T183f271(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_21 */
extern void T183f270(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_20 */
extern void T183f269(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_19 */
extern void T183f268(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_18 */
extern void T183f267(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_17 */
extern void T183f266(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_16 */
extern void T183f265(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_15 */
extern void T183f264(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_14 */
extern void T183f263(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_13 */
extern void T183f262(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_12 */
extern void T183f261(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_11 */
extern void T183f260(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_10 */
extern void T183f259(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_9 */
extern void T183f258(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_8 */
extern void T183f257(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_7 */
extern void T183f256(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_6 */
extern void T183f255(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_5 */
extern void T183f254(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_4 */
extern void T183f253(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_3 */
extern void T183f252(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_2 */
extern void T183f251(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_1 */
extern void T183f250(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template */
extern T0* T183f187(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_nxt_template_27 */
extern void T183f249(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_26 */
extern void T183f248(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_25 */
extern void T183f247(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_24 */
extern void T183f246(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_23 */
extern void T183f245(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_22 */
extern void T183f244(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_21 */
extern void T183f243(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_20 */
extern void T183f242(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_19 */
extern void T183f241(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_18 */
extern void T183f240(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_17 */
extern void T183f239(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_16 */
extern void T183f238(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_15 */
extern void T183f237(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_14 */
extern void T183f236(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_13 */
extern void T183f235(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_12 */
extern void T183f234(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_11 */
extern void T183f233(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_10 */
extern void T183f232(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_9 */
extern void T183f231(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_8 */
extern void T183f230(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_7 */
extern void T183f229(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_6 */
extern void T183f228(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_5 */
extern void T183f227(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_4 */
extern void T183f226(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_3 */
extern void T183f225(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_2 */
extern void T183f224(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_1 */
extern void T183f223(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.special_integer_ */
extern T0* T183f51(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.empty_buffer */
extern T0* T183f70(GE_context* ac, T0* C);
/* GEANT_PROJECT_PARSER.make */
extern T0* T98c8(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.enable_position_table */
extern void T142f10(GE_context* ac, T0* C, T0* a1);
/* XM_POSITION_TABLE.make */
extern T0* T146c4(GE_context* ac);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T241c7(GE_context* ac);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].set_internal_cursor */
extern void T241f8(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.set_callbacks */
extern void T138f207(GE_context* ac, T0* C, T0* a1);
/* XM_TREE_CALLBACKS_PIPE.make */
extern T0* T139c10(GE_context* ac);
/* XM_TREE_CALLBACKS_PIPE.callbacks_pipe */
extern T0* T139f9(GE_context* ac, T0* C, T0* a1);
/* ARRAY [XM_CALLBACKS_FILTER].item */
extern T0* T228f4(GE_context* ac, T0* C, T6 a1);
/* XM_CALLBACKS_TO_TREE_FILTER.make_null */
extern T0* T142c9(GE_context* ac);
/* XM_CALLBACKS_TO_TREE_FILTER.make_next */
extern void T142f11(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.initialize */
extern void T142f12(GE_context* ac, T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_equal */
extern T0* T230c31(GE_context* ac, T6 a1);
/* detachable KL_EQUALITY_TESTER [XM_NAMESPACE].default_create */
extern T0* T304c2(GE_context* ac);
/* DS_HASH_SET [XM_NAMESPACE].make */
extern void T230f32(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].set_internal_cursor */
extern void T230f38(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].new_cursor */
extern T0* T230f24(GE_context* ac, T0* C);
/* DS_HASH_SET_CURSOR [XM_NAMESPACE].make */
extern T0* T305c4(GE_context* ac, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].unset_found_item */
extern void T230f37(GE_context* ac, T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_slots */
extern void T230f36(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_modulus */
extern T6 T230f21(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_clashes */
extern void T230f35(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_key_storage */
extern void T230f34(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_item_storage */
extern void T230f33(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].make */
extern T0* T306f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_NAMESPACE].make_empty */
extern T0* T307c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].default_create */
extern T0* T306c3(GE_context* ac);
/* XM_DOCUMENT.make */
extern T0* T143c10(GE_context* ac);
/* XM_DOCUMENT.make_with_root_named */
extern void T143f11(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_DOCUMENT.force_last */
extern void T143f12(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].force_last */
extern void T232f12(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].force_last */
extern void T232f12p1(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_DOCUMENT_NODE].put_right */
extern void T308f4(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_DOCUMENT_NODE].make */
extern T0* T308c3(GE_context* ac, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].before_addition */
extern void T232f14(GE_context* ac, T0* C, T0* a1);
/* XM_DOCUMENT.before_addition */
extern void T143f13(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.equality_delete */
extern void T144f27(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].remove */
extern void T236f14(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].remove_at_cursor */
extern void T239f17(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].move_all_cursors */
extern void T239f24(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].set_current_cell */
extern void T236f18(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_ELEMENT_NODE].put */
extern void T329f6(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_ELEMENT_NODE].put_right */
extern void T329f4(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].set_last_cell */
extern void T239f23(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_ELEMENT_NODE].forget_right */
extern void T329f5(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].remove_last */
extern void T239f22(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].move_last_cursors_after */
extern void T239f27(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].wipe_out */
extern void T239f25(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].move_all_cursors_after */
extern void T239f28(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].is_last */
extern T1 T236f7(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].cursor_is_last */
extern T1 T239f10(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].remove_first */
extern void T239f21(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].set_first_cell */
extern void T239f26(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].is_first */
extern T1 T236f6(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].cursor_is_first */
extern T1 T239f9(GE_context* ac, T0* C, T0* a1);
/* XM_DOCUMENT.equality_delete */
extern void T143f14(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].forth */
extern void T270f13(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_forth */
extern void T232f17(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].add_traversing_cursor */
extern void T232f18(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].set_next_cursor */
extern void T270f16(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].remove_traversing_cursor */
extern void T232f23(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].set */
extern void T270f15(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].remove */
extern void T270f12(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].remove_at_cursor */
extern void T232f16(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].move_all_cursors */
extern void T232f22(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].set_current_cell */
extern void T270f17(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_DOCUMENT_NODE].put */
extern void T308f6(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].set_last_cell */
extern void T232f21(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_DOCUMENT_NODE].forget_right */
extern void T308f5(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].remove_last */
extern void T232f20(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].move_last_cursors_after */
extern void T232f26(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].set_after */
extern void T270f18(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].wipe_out */
extern void T232f24(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].move_all_cursors_after */
extern void T232f27(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].is_last */
extern T1 T270f7(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_is_last */
extern T1 T232f10(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].remove_first */
extern void T232f19(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].set_first_cell */
extern void T232f25(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].is_first */
extern T1 T270f6(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_is_first */
extern T1 T232f9(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].item */
extern T0* T270f8(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].start */
extern void T270f11(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_start */
extern void T232f15(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_off */
extern T1 T232f8(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].off */
extern T1 T270f9(GE_context* ac, T0* C);
/* XM_DOCUMENT.new_cursor */
extern T0* T143f7(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].new_cursor */
extern T0* T232f5(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].make */
extern T0* T270c10(GE_context* ac, T0* a1);
/* XM_DOCUMENT.last */
extern T0* T143f6(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].last */
extern T0* T232f7(GE_context* ac, T0* C);
/* XM_DOCUMENT.is_empty */
extern T1 T143f5(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].is_empty */
extern T1 T232f6(GE_context* ac, T0* C);
/* XM_ELEMENT.make */
extern T0* T144c23(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].make */
extern T0* T239c11(GE_context* ac);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].set_internal_cursor */
extern void T239f12(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].make */
extern T0* T232c11(GE_context* ac);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].set_internal_cursor */
extern void T232f13(GE_context* ac, T0* C, T0* a1);
/* XM_DOCUMENT.default_ns */
extern unsigned char ge1474os6492;
extern T0* ge1474ov6492;
extern T0* T143f3(GE_context* ac, T0* C);
/* XM_NAMESPACE.make_default */
extern T0* T231c7(GE_context* ac);
/* XM_NAMESPACE.make */
extern void T231f8(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE.make */
extern T0* T231c8(GE_context* ac, T0* a1, T0* a2);
/* XM_CALLBACKS_TO_TREE_FILTER.null_callbacks */
extern T0* T142f7(GE_context* ac, T0* C);
/* XM_CALLBACKS_NULL.make */
extern T0* T188c1(GE_context* ac);
/* XM_TREE_CALLBACKS_PIPE.new_stop_on_error */
extern T0* T139f7(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.make_null */
extern T0* T145c5(GE_context* ac);
/* XM_STOP_ON_ERROR_FILTER.make_next */
extern void T145f6(GE_context* ac, T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.initialize */
extern void T145f7(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.null_callbacks */
extern T0* T145f4(GE_context* ac, T0* C);
/* XM_TREE_CALLBACKS_PIPE.new_namespace_resolver */
extern T0* T139f6(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.make_null */
extern T0* T227c26(GE_context* ac);
/* XM_NAMESPACE_RESOLVER.make_next */
extern void T227f37(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.initialize */
extern void T227f38(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_make */
extern void T227f42(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.new_string_queue */
extern T0* T227f20(GE_context* ac, T0* C);
/* DS_LINKED_QUEUE [STRING_8].make */
extern T0* T303c6(GE_context* ac);
/* XM_NAMESPACE_RESOLVER_CONTEXT.make */
extern T0* T301c10(GE_context* ac);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T407c8(GE_context* ac);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].set_internal_cursor */
extern void T407f11(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].new_cursor */
extern T0* T407f6(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T408c8(GE_context* ac, T0* a1);
/* XM_NAMESPACE_RESOLVER.null_callbacks */
extern T0* T227f13(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.set_string_mode_mixed */
extern void T138f206(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.make */
extern T0* T138c205(GE_context* ac);
/* XM_EIFFEL_PARSER.new_entities_table */
extern T0* T138f91(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].set_key_equality_tester */
extern void T189f39(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_map_default */
extern T0* T189c36(GE_context* ac);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_map */
extern void T189f41(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_with_equality_testers */
extern void T189f53(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_sparse_container */
extern void T189f58(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].set_internal_cursor */
extern void T189f63(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_cursor */
extern T0* T189f34(GE_context* ac, T0* C);
/* detachable DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T290c6(GE_context* ac, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_slots */
extern void T189f62(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_clashes */
extern void T189f61(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_key_storage */
extern void T189f60(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_item_storage */
extern void T189f59(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T291f2(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].make_empty */
extern T0* T287c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].default_create */
extern T0* T291c3(GE_context* ac);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].default_capacity */
extern T6 T189f30(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.make_parser */
extern void T138f211(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yy_build_parser_tables */
extern void T138f215(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yycheck_template */
extern unsigned char ge1515os5722;
extern T0* ge1515ov5722;
extern T0* T138f88(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yyfixed_array */
extern T0* T138f183(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yycheck_template_4 */
extern void T138f272(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yyarray_subcopy */
extern void T138f286(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_PARSER.integer_array_ */
extern T0* T138f204(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yycheck_template_3 */
extern void T138f271(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yycheck_template_2 */
extern void T138f270(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yycheck_template_1 */
extern void T138f269(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytable_template */
extern unsigned char ge1515os5717;
extern T0* ge1515ov5717;
extern T0* T138f86(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yytable_template_4 */
extern void T138f268(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytable_template_3 */
extern void T138f267(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytable_template_2 */
extern void T138f266(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytable_template_1 */
extern void T138f265(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yypgoto_template */
extern unsigned char ge1515os5716;
extern T0* ge1515ov5716;
extern T0* T138f84(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yypact_template */
extern unsigned char ge1515os5712;
extern T0* ge1515ov5712;
extern T0* T138f129(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yypact_template_3 */
extern void T138f285(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yypact_template_2 */
extern void T138f284(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yypact_template_1 */
extern void T138f283(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yydefgoto_template */
extern unsigned char ge1515os5711;
extern T0* ge1515ov5711;
extern T0* T138f127(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yydefact_template */
extern unsigned char ge1515os5707;
extern T0* ge1515ov5707;
extern T0* T138f125(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yydefact_template_3 */
extern void T138f282(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yydefact_template_2 */
extern void T138f281(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yydefact_template_1 */
extern void T138f280(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytypes2_template */
extern unsigned char ge1515os5706;
extern T0* ge1515ov5706;
extern T0* T138f123(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yytypes1_template */
extern unsigned char ge1515os5702;
extern T0* ge1515ov5702;
extern T0* T138f121(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yytypes1_template_3 */
extern void T138f279(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytypes1_template_2 */
extern void T138f278(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytypes1_template_1 */
extern void T138f277(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yyr1_template */
extern unsigned char ge1515os5699;
extern T0* ge1515ov5699;
extern T0* T138f119(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yyr1_template_2 */
extern void T138f276(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yyr1_template_1 */
extern void T138f275(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytranslate_template */
extern unsigned char ge1515os5696;
extern T0* ge1515ov5696;
extern T0* T138f106(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yytranslate_template_2 */
extern void T138f274(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytranslate_template_1 */
extern void T138f273(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yy_create_value_stacks */
extern void T138f214(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].make */
extern T0* T218f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_DECLARATION].make_empty */
extern T0* T220c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].default_create */
extern T0* T218c3(GE_context* ac);
/* KL_SPECIAL_ROUTINES [BOOLEAN].make */
extern T0* T217f1(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].default_create */
extern T0* T217c5(GE_context* ac);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].make */
extern T0* T214f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].make_empty */
extern T0* T216c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].default_create */
extern T0* T214c3(GE_context* ac);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T211f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make_empty */
extern T0* T213c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].default_create */
extern T0* T211c3(GE_context* ac);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T208f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make_empty */
extern T0* T210c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].default_create */
extern T0* T208c3(GE_context* ac);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T205f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].make_empty */
extern T0* T207c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].default_create */
extern T0* T205c3(GE_context* ac);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].make */
extern T0* T202f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].make_empty */
extern T0* T204c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].default_create */
extern T0* T202c3(GE_context* ac);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T199f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make_empty */
extern T0* T201c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].default_create */
extern T0* T199c3(GE_context* ac);
/* XM_EIFFEL_PARSER.initialize */
extern void T138f209(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.null_dtd_callbacks */
extern T0* T138f112(GE_context* ac, T0* C);
/* XM_DTD_CALLBACKS_NULL.make */
extern T0* T193c1(GE_context* ac);
/* XM_EIFFEL_PARSER.null_callbacks */
extern T0* T138f104(GE_context* ac, T0* C);
/* XM_EXPAT_PARSER_FACTORY.new_expat_parser */
extern T0* T136f2(GE_context* ac, T0* C);
/* XM_EXPAT_PARSER_FACTORY.is_expat_parser_available */
extern T1 T136f1(GE_context* ac, T0* C);
/* XM_EXPAT_PARSER_FACTORY.default_create */
extern T0* T136c3(GE_context* ac);
/* KL_TEXT_INPUT_FILE.is_open_read */
extern T1 T97f28(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_read */
extern T1 T97f19(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T97f62(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.is_closed */
extern T1 T97f25(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.old_open_read */
extern void T97f68(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T97f68p1(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.file_open */
extern T14 T97f29(GE_context* ac, T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.old_is_readable */
extern T1 T97f24(GE_context* ac, T0* C);
/* FILE_INFO.is_readable */
extern T1 T133f15(GE_context* ac, T0* C);
/* FILE_INFO.file_eaccess */
extern T1 T133f6(GE_context* ac, T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.make */
extern void T97f60(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.make */
extern T0* T97c60(GE_context* ac, T0* a1);
/* KL_TEXT_INPUT_FILE.make */
extern void T97f60p1(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.old_make */
extern void T97f66(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.make_with_name */
extern void T97f69(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.set_name */
extern void T97f71(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.string_ */
extern T0* T97f22(GE_context* ac, T0* C);
/* GEANT_PROJECT_LOADER.make */
extern T0* T30c9(GE_context* ac, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_file_readable */
extern T1 T92f2(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.is_readable */
extern T1 T97f13(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.is_file_readable */
extern T1 T93f2(GE_context* ac, T0* C, T0* a1);
/* GEANT.default_build_filename */
extern unsigned char ge2os1954;
extern T0* ge2ov1954;
extern T0* T22f8(GE_context* ac, T0* C);
/* GEANT_PROJECT_OPTIONS.set_no_exec */
extern void T31f8(GE_context* ac, T0* C, T1 a1);
/* GEANT_PROJECT_OPTIONS.set_debug_mode */
extern void T31f7(GE_context* ac, T0* C, T1 a1);
/* GEANT_PROJECT_OPTIONS.set_verbose */
extern void T31f6(GE_context* ac, T0* C, T1 a1);
/* GEANT_PROJECT_OPTIONS.make */
extern T0* T31c5(GE_context* ac);
/* GEANT_PROJECT_VARIABLES.make */
extern T0* T32c58(GE_context* ac);
/* GEANT_PROJECT_VARIABLES.verbose_name */
extern unsigned char ge8os2422;
extern T0* ge8ov2422;
extern T0* T32f38(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.exe_name */
extern unsigned char ge8os2421;
extern T0* ge8ov2421;
extern T0* T32f35(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.path_separator_name */
extern unsigned char ge8os2420;
extern T0* ge8ov2420;
extern T0* T32f34(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.is_unix_name */
extern unsigned char ge8os2419;
extern T0* ge8ov2419;
extern T0* T32f30(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.is_windows_name */
extern unsigned char ge8os2418;
extern T0* ge8ov2418;
extern T0* T32f29(GE_context* ac, T0* C);
/* GEANT_VARIABLES.value */
extern T0* T36f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.default_builtin_variables */
extern unsigned char ge10os1960;
extern T0* ge10ov1960;
extern T0* T32f25(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.file_system */
extern T0* T32f40(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.unix_file_system */
extern T0* T32f43(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.windows_file_system */
extern T0* T32f42(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.operating_system */
extern T0* T32f39(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.gobo_os_name */
extern unsigned char ge8os2417;
extern T0* ge8ov2417;
extern T0* T32f24(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.project_variables_resolver */
extern T0* T32f23(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.make */
extern void T32f58p1(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.set_key_equality_tester */
extern void T32f61(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.make_map */
extern void T32f60(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_with_equality_testers */
extern void T32f63(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* GEANT_PROJECT_VARIABLES.make_sparse_container */
extern void T32f71(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.set_internal_cursor */
extern void T32f80(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.new_cursor */
extern T0* T32f36(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.unset_found_item */
extern void T32f64(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.make_slots */
extern void T32f79(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.new_modulus */
extern T6 T32f31(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_clashes */
extern void T32f78(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_key_storage */
extern void T32f77(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_item_storage */
extern void T32f76(GE_context* ac, T0* C, T6 a1);
/* GEANT.default_builtin_variables */
extern T0* T22f9(GE_context* ac, T0* C);
/* GEANT.file_system */
extern T0* T22f17(GE_context* ac, T0* C);
/* GEANT.unix_file_system */
extern T0* T22f19(GE_context* ac, T0* C);
/* GEANT.windows_file_system */
extern T0* T22f18(GE_context* ac, T0* C);
/* GEANT.operating_system */
extern T0* T22f16(GE_context* ac, T0* C);
/* GEANT.read_command_line */
extern void T22f21(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].first */
extern T0* T110f18(GE_context* ac, T0* C);
/* GEANT_VARIABLES.force */
extern void T36f48(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.key_storage_put */
extern void T36f57(GE_context* ac, T0* C, T0* a1, T6 a2);
/* GEANT_VARIABLES.slots_put */
extern void T36f56(GE_context* ac, T0* C, T6 a1, T6 a2);
/* GEANT_VARIABLES.clashes_put */
extern void T36f55(GE_context* ac, T0* C, T6 a1, T6 a2);
/* GEANT_VARIABLES.resize */
extern void T36f54(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.clashes_resize */
extern void T36f62(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.special_integer_ */
extern T0* T36f28(GE_context* ac, T0* C);
/* GEANT_VARIABLES.key_storage_resize */
extern void T36f61(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.item_storage_resize */
extern void T36f60(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.slots_resize */
extern void T36f59(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.new_capacity */
extern T6 T36f23(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.item_storage_put */
extern void T36f53(GE_context* ac, T0* C, T0* a1, T6 a2);
/* GEANT.commandline_variables */
extern T0* T22f12(GE_context* ac, T0* C);
/* AP_PARSER.final_error_action */
extern void T45f28(GE_context* ac, T0* C);
/* AP_PARSER.exceptions */
extern T0* T45f13(GE_context* ac, T0* C);
/* AP_ERROR_HANDLER.report_error_message */
extern void T52f9(GE_context* ac, T0* C, T0* a1);
/* AP_ERROR_HANDLER.report_error_message */
extern void T52f9p1(GE_context* ac, T0* C, T0* a1);
/* AP_ERROR_HANDLER.report_error */
extern void T52f8(GE_context* ac, T0* C, T0* a1);
/* AP_ERROR_HANDLER.message */
extern T0* T52f6(GE_context* ac, T0* C, T0* a1);
/* AP_ERROR.default_message */
extern T0* T47f17(GE_context* ac, T0* C);
/* AP_ERROR.message */
extern T0* T47f18(GE_context* ac, T0* C, T0* a1);
/* AP_ERROR.arguments */
extern unsigned char ge202os1982;
extern T0* ge202ov1982;
extern T0* T47f20(GE_context* ac, T0* C);
/* KL_ARGUMENTS.make */
extern T0* T34c5(GE_context* ac);
/* KL_ARGUMENTS.argument */
extern T0* T34f2(GE_context* ac, T0* C, T6 a1);
/* IMMUTABLE_STRING_32.as_string_8 */
extern T0* T122f6(GE_context* ac, T0* C);
/* ARGUMENTS_32.argument */
extern T0* T121f1(GE_context* ac, T0* C, T6 a1);
/* ARRAY [IMMUTABLE_STRING_32].item */
extern T0* T172f5(GE_context* ac, T0* C, T6 a1);
/* ARGUMENTS_32.internal_argument_array */
extern unsigned char ge2299os5152;
extern T0* ge2299ov5152;
extern T0* T121f3(GE_context* ac, T0* C);
/* ARRAY [IMMUTABLE_STRING_32].put */
extern void T172f8(GE_context* ac, T0* C, T0* a1, T6 a2);
/* ARGUMENTS_32.i_th_argument_string */
extern T0* T121f4(GE_context* ac, T0* C, T6 a1);
/* IMMUTABLE_STRING_32.make_from_string */
extern T0* T122c14(GE_context* ac, T0* a1);
/* STRING_32.area_lower */
extern T6 T18f6(GE_context* ac, T0* C);
/* NATIVE_STRING.set_shared_from_pointer */
extern void T174f10(GE_context* ac, T0* C, T14 a1);
/* NATIVE_STRING.set_shared_from_pointer_and_count */
extern void T174f13(GE_context* ac, T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.set_from_pointer */
extern void T128f17(GE_context* ac, T0* C, T14 a1, T6 a2);
/* ARGUMENTS_32.default_pointer */
extern T14 T121f6(GE_context* ac, T0* C);
/* ARRAY [IMMUTABLE_STRING_32].compare_objects */
extern void T172f7(GE_context* ac, T0* C);
/* ARRAY [IMMUTABLE_STRING_32].make_filled */
extern T0* T172c6(GE_context* ac, T0* a1, T6 a2, T6 a3);
/* ARRAY [IMMUTABLE_STRING_32].make_filled_area */
extern void T172f9(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [IMMUTABLE_STRING_32].make_filled */
extern T0* T173c4(GE_context* ac, T0* a1, T6 a2);
/* SPECIAL [IMMUTABLE_STRING_32].fill_with */
extern void T173f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [IMMUTABLE_STRING_32].extend */
extern void T173f8(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [IMMUTABLE_STRING_32].make_empty */
extern void T173f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [IMMUTABLE_STRING_32].make_empty */
extern T0* T173c6(GE_context* ac, T6 a1);
/* IMMUTABLE_STRING_32.make_empty */
extern T0* T122c13(GE_context* ac);
/* IMMUTABLE_STRING_32.make */
extern void T122f15(GE_context* ac, T0* C, T6 a1);
/* IMMUTABLE_STRING_32.make */
extern T0* T122c15(GE_context* ac, T6 a1);
/* KL_ARGUMENTS.internal_arguments */
extern unsigned char ge2298os3024;
extern T0* ge2298ov3024;
extern T0* T34f3(GE_context* ac, T0* C);
/* ARGUMENTS_32.default_create */
extern T0* T121c7(GE_context* ac);
/* ARRAY [STRING_8].valid_index */
extern T1 T39f5(GE_context* ac, T0* C, T6 a1);
/* AP_ERROR.string_ */
extern T0* T47f19(GE_context* ac, T0* C);
/* AP_ERROR.make_invalid_parameter_error */
extern T0* T47c21(GE_context* ac, T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.force */
extern void T41f47(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.search_position */
extern void T41f51(GE_context* ac, T0* C, T0* a1);
/* GEANT.set_show_target_info */
extern void T22f27(GE_context* ac, T0* C, T1 a1);
/* AP_STRING_OPTION.parameter */
extern T0* T44f16(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].last */
extern T0* T110f10(GE_context* ac, T0* C);
/* GEANT.set_debug_mode */
extern void T22f26(GE_context* ac, T0* C, T1 a1);
/* GEANT.set_no_exec */
extern void T22f25(GE_context* ac, T0* C, T1 a1);
/* GEANT.set_verbose */
extern void T22f24(GE_context* ac, T0* C, T1 a1);
/* GEANT.report_version_number */
extern void T22f23(GE_context* ac, T0* C);
/* UT_ERROR_HANDLER.report_info */
extern void T35f8(GE_context* ac, T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_info_message */
extern void T35f9(GE_context* ac, T0* C, T0* a1);
/* UT_VERSION_NUMBER.make */
extern T0* T56c8(GE_context* ac, T0* a1);
/* AP_PARSER.parse_arguments */
extern void T45f27(GE_context* ac, T0* C);
/* AP_PARSER.parse_list */
extern void T45f30(GE_context* ac, T0* C, T0* a1);
/* AP_PARSER.check_options_after_parsing */
extern void T45f33(GE_context* ac, T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.forth */
extern void T43f17(GE_context* ac, T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_forth */
extern void T43f19(GE_context* ac, T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.add_traversing_cursor */
extern void T43f20(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [AP_OPTION].set_next_cursor */
extern void T109f9(GE_context* ac, T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.remove_traversing_cursor */
extern void T43f21(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [AP_OPTION].set */
extern void T109f8(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* DS_ARRAYED_LIST [AP_OPTION].forth */
extern void T113f20(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_forth */
extern void T113f24(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].set_position */
extern void T152f10(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].add_traversing_cursor */
extern void T113f25(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].set_next_cursor */
extern void T152f11(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].remove_traversing_cursor */
extern void T113f26(GE_context* ac, T0* C, T0* a1);
/* AP_ERROR.make_surplus_option_error */
extern T0* T47c23(GE_context* ac, T0* a1);
/* AP_ERROR.make_missing_option_error */
extern T0* T47c22(GE_context* ac, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.item_for_iteration */
extern T0* T43f6(GE_context* ac, T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_item */
extern T0* T43f8(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].item_for_iteration */
extern T0* T113f7(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_item */
extern T0* T113f11(GE_context* ac, T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.after */
extern T1 T43f5(GE_context* ac, T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_after */
extern T1 T43f7(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].after */
extern T1 T113f9(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_after */
extern T1 T113f10(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].after */
extern T1 T152f5(GE_context* ac, T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.start */
extern void T43f16(GE_context* ac, T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_start */
extern void T43f18(GE_context* ac, T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_off */
extern T1 T43f9(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [AP_OPTION].off */
extern T1 T109f6(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].start */
extern void T113f19(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_start */
extern void T113f23(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].set_after */
extern void T152f9(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].is_empty */
extern T1 T113f15(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].off */
extern T1 T152f7(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].before */
extern T1 T152f6(GE_context* ac, T0* C);
/* AP_PARSER.parse_argument */
extern void T45f32(GE_context* ac, T0* C, T0* a1);
/* AP_PARSER.parse_short */
extern void T45f35(GE_context* ac, T0* C, T0* a1);
/* AP_ERROR.make_missing_parameter_error */
extern T0* T47c25(GE_context* ac, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].off */
extern T1 T110f8(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].cursor_off */
extern T1 T110f13(GE_context* ac, T0* C, T0* a1);
/* AP_ERROR.make_unknown_option_error */
extern T0* T47c24(GE_context* ac, T0* a1);
/* CHARACTER_8.out */
extern T0* T2f2(GE_context* ac, T2* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].forth */
extern void T114f17(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_forth */
extern void T114f21(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].set_position */
extern void T156f10(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].add_traversing_cursor */
extern void T114f22(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].set_next_cursor */
extern void T156f11(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].remove_traversing_cursor */
extern void T114f23(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].item_for_iteration */
extern T0* T114f6(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_item */
extern T0* T114f11(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].after */
extern T1 T114f7(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_after */
extern T1 T114f8(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].after */
extern T1 T156f5(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].start */
extern void T114f16(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_start */
extern void T114f20(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].set_after */
extern void T156f9(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].is_empty */
extern T1 T114f13(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].off */
extern T1 T156f7(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].before */
extern T1 T156f6(GE_context* ac, T0* C);
/* AP_PARSER.parse_long */
extern void T45f34(GE_context* ac, T0* C, T0* a1);
/* AP_ERROR.make_unnecessary_parameter_error */
extern T0* T47c26(GE_context* ac, T0* a1, T0* a2);
/* AP_PARSER.string_ */
extern T0* T45f22(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].forth */
extern void T110f25(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].item_for_iteration */
extern T0* T110f7(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].after */
extern T1 T110f15(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].cursor_after */
extern T1 T110f11(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [detachable STRING_8].start */
extern void T110f24(GE_context* ac, T0* C);
/* AP_PARSER.reset_parser */
extern void T45f31(GE_context* ac, T0* C);
/* AP_PARSER.all_options */
extern T0* T45f16(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].has */
extern T1 T113f8(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].make */
extern T0* T113c17(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].set_internal_cursor */
extern void T113f21(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].new_cursor */
extern T0* T113f12(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].make */
extern T0* T152c8(GE_context* ac, T0* a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].make */
extern T0* T155f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [AP_OPTION].make_empty */
extern T0* T154c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].default_create */
extern T0* T155c3(GE_context* ac);
/* AP_ERROR_HANDLER.reset */
extern void T52f10(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [detachable STRING_8].force */
extern void T110f23(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_ARGUMENTS.argument_count */
extern T6 T34f4(GE_context* ac, T0* C);
/* AP_PARSER.arguments */
extern T0* T45f11(GE_context* ac, T0* C);
/* AP_STRING_OPTION.make */
extern T0* T44c26(GE_context* ac, T2 a1, T0* a2);
/* AP_STRING_OPTION.set_long_form */
extern void T44f30(GE_context* ac, T0* C, T0* a1);
/* AP_STRING_OPTION.set_short_form */
extern void T44f28(GE_context* ac, T0* C, T2 a1);
/* AP_STRING_OPTION.initialize */
extern void T44f27(GE_context* ac, T0* C);
/* AP_STRING_OPTION.initialize */
extern void T44f27p1(GE_context* ac, T0* C);
/* AP_FLAG.make */
extern T0* T42c19(GE_context* ac, T2 a1, T0* a2);
/* AP_FLAG.set_long_form */
extern void T42f21(GE_context* ac, T0* C, T0* a1);
/* AP_FLAG.set_short_form */
extern void T42f23(GE_context* ac, T0* C, T2 a1);
/* AP_FLAG.initialize */
extern void T42f20(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].force_last */
extern void T114f15(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].force */
extern void T158f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].fill_with */
extern void T157f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].extend */
extern void T157f8(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].resize */
extern void T114f19(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].aliased_resized_area */
extern T0* T158f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].aliased_resized_area */
extern T0* T157f4(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].new_capacity */
extern T6 T114f12(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].extendible */
extern T1 T114f10(GE_context* ac, T0* C, T6 a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.make */
extern T0* T43c11(GE_context* ac, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.old_make */
extern void T43f14(GE_context* ac, T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.set_internal_cursor */
extern void T43f15(GE_context* ac, T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.new_cursor */
extern T0* T43f10(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [AP_OPTION].make */
extern T0* T109c7(GE_context* ac, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.set_parameters_description */
extern void T43f13(GE_context* ac, T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.set_introduction_option */
extern void T43f12(GE_context* ac, T0* C, T0* a1);
/* AP_FLAG.set_description */
extern void T42f18(GE_context* ac, T0* C, T0* a1);
/* AP_FLAG.make_with_long_form */
extern T0* T42c17(GE_context* ac, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].force_last */
extern void T113f18(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].force */
extern void T155f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [AP_OPTION].fill_with */
extern void T154f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [AP_OPTION].extend */
extern void T154f8(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].resize */
extern void T113f22(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].aliased_resized_area */
extern T0* T155f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [AP_OPTION].aliased_resized_area */
extern T0* T154f4(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].new_capacity */
extern T6 T113f14(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].extendible */
extern T1 T113f13(GE_context* ac, T0* C, T6 a1);
/* AP_STRING_OPTION.set_parameter_description */
extern void T44f25(GE_context* ac, T0* C, T0* a1);
/* AP_STRING_OPTION.set_description */
extern void T44f24(GE_context* ac, T0* C, T0* a1);
/* AP_STRING_OPTION.make_with_short_form */
extern T0* T44c23(GE_context* ac, T2 a1);
/* AP_PARSER.set_parameters_description */
extern void T45f26(GE_context* ac, T0* C, T0* a1);
/* AP_PARSER.set_application_description */
extern void T45f25(GE_context* ac, T0* C, T0* a1);
/* AP_PARSER.make */
extern T0* T45c24(GE_context* ac);
/* AP_DISPLAY_HELP_FLAG.set_description */
extern void T112f36(GE_context* ac, T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.make */
extern T0* T112c35(GE_context* ac, T2 a1, T0* a2);
/* AP_DISPLAY_HELP_FLAG.set_long_form */
extern void T112f39(GE_context* ac, T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.set_short_form */
extern void T112f38(GE_context* ac, T0* C, T2 a1);
/* AP_DISPLAY_HELP_FLAG.initialize */
extern void T112f37(GE_context* ac, T0* C);
/* AP_PARSER.make_empty */
extern void T45f29(GE_context* ac, T0* C);
/* AP_ERROR_HANDLER.make_standard */
extern T0* T52c7(GE_context* ac);
/* AP_ERROR_HANDLER.std */
extern T0* T52f5(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T114c14(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].set_internal_cursor */
extern void T114f18(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].new_cursor */
extern T0* T114f9(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T156c8(GE_context* ac, T0* a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T158f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].make_empty */
extern T0* T157c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].default_create */
extern T0* T158c3(GE_context* ac);
/* UT_ERROR_HANDLER.make_standard */
extern T0* T35c7(GE_context* ac);
/* UT_ERROR_HANDLER.std */
extern T0* T35f4(GE_context* ac, T0* C);
/* KL_ARGUMENTS.set_program_name */
extern void T34f6(GE_context* ac, T0* C, T0* a1);
/* GEANT.arguments */
extern T0* T22f10(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.set_exception_data */
extern void T19f15(GE_context* ac, T0* C, T6 a1, T1 a2, T6 a3, T6 a4, T0* a5, T0* a6, T0* a7, T0* a8, T0* a9, T0* a10, T6 a11, T1 a12);
/* ISE_EXCEPTION_MANAGER.exception_from_data */
extern T0* T19f7(GE_context* ac, T0* C);
extern T1 T19f7ot1(T0* a1, T0** a2);
extern T1 T19f7ot2(T0* a1, T0** a2);
extern T1 T19f7ot3(T0* a1, T0** a2);
extern T1 T19f7ot4(T0* a1, T0** a2);
extern T1 T19f7ot5(T0* a1, T0** a2);
extern T1 T19f7ot6(T0* a1, T0** a2);
extern T1 T19f7ot7(T0* a1, T0** a2);
/* COM_FAILURE.set_exception_information */
extern void T69f15(GE_context* ac, T0* C, T0* a1);
/* COM_FAILURE.ccom_hresult_to_string */
extern T0* T69f11(GE_context* ac, T0* C, T6 a1);
/* INTEGER_32.to_hex_string */
extern T0* T6f19(GE_context* ac, T6* C);
/* COM_FAILURE.set_hresult_code */
extern void T69f14(GE_context* ac, T0* C, T6 a1);
/* OPERATING_SYSTEM_FAILURE.set_error_code */
extern void T68f9(GE_context* ac, T0* C, T6 a1);
/* IO_FAILURE.set_error_code */
extern void T67f11(GE_context* ac, T0* C, T6 a1);
/* OPERATING_SYSTEM_SIGNAL_FAILURE.set_signal_code */
extern void T66f9(GE_context* ac, T0* C, T6 a1);
/* INVARIANT_VIOLATION.set_is_entry */
extern void T65f9(GE_context* ac, T0* C, T1 a1);
/* ROUTINE_FAILURE.set_class_name */
extern void T60f10(GE_context* ac, T0* C, T0* a1);
/* ROUTINE_FAILURE.set_routine_name */
extern void T60f9(GE_context* ac, T0* C, T0* a1);
/* ISE_EXCEPTION_MANAGER.exception_from_code */
extern T0* T19f10(GE_context* ac, T0* C, T6 a1);
/* SERIALIZATION_FAILURE.default_create */
extern T0* T89c6(GE_context* ac);
/* OLD_VIOLATION.default_create */
extern T0* T62c6(GE_context* ac);
/* COM_FAILURE.default_create */
extern T0* T69c12(GE_context* ac);
/* ADDRESS_APPLIED_TO_MELTED_FEATURE.default_create */
extern T0* T88c6(GE_context* ac);
/* MISMATCH_FAILURE.default_create */
extern T0* T86c6(GE_context* ac);
/* OPERATING_SYSTEM_FAILURE.default_create */
extern T0* T68c7(GE_context* ac);
/* IO_FAILURE.set_code */
extern void T67f9(GE_context* ac, T0* C, T6 a1);
/* IO_FAILURE.default_create */
extern T0* T67c8(GE_context* ac);
/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE.default_create */
extern T0* T85c6(GE_context* ac);
/* VOID_ASSIGNED_TO_EXPANDED.default_create */
extern T0* T84c6(GE_context* ac);
/* EXTERNAL_FAILURE.default_create */
extern T0* T83c6(GE_context* ac);
/* CREATE_ON_DEFERRED.default_create */
extern T0* T82c6(GE_context* ac);
/* RESUMPTION_FAILURE.default_create */
extern T0* T81c6(GE_context* ac);
/* RESCUE_FAILURE.default_create */
extern T0* T80c6(GE_context* ac);
/* EIFFEL_RUNTIME_PANIC.set_code */
extern void T70f9(GE_context* ac, T0* C, T6 a1);
/* EIFFEL_RUNTIME_PANIC.code */
extern T6 T70f7(GE_context* ac, T0* C);
/* EIFFEL_RUNTIME_PANIC.default_create */
extern T0* T70c8(GE_context* ac);
/* OPERATING_SYSTEM_SIGNAL_FAILURE.default_create */
extern T0* T66c7(GE_context* ac);
/* LOOP_INVARIANT_VIOLATION.default_create */
extern T0* T79c6(GE_context* ac);
/* VARIANT_VIOLATION.default_create */
extern T0* T78c6(GE_context* ac);
/* BAD_INSPECT_VALUE.default_create */
extern T0* T77c6(GE_context* ac);
/* ROUTINE_FAILURE.default_create */
extern T0* T60c8(GE_context* ac);
/* CHECK_VIOLATION.default_create */
extern T0* T76c6(GE_context* ac);
/* INVARIANT_VIOLATION.default_create */
extern T0* T65c7(GE_context* ac);
/* FLOATING_POINT_FAILURE.default_create */
extern T0* T75c6(GE_context* ac);
/* POSTCONDITION_VIOLATION.default_create */
extern T0* T74c6(GE_context* ac);
/* PRECONDITION_VIOLATION.default_create */
extern T0* T73c6(GE_context* ac);
/* NO_MORE_MEMORY.set_code */
extern void T64f10(GE_context* ac, T0* C, T6 a1);
/* NO_MORE_MEMORY.code */
extern T6 T64f7(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.no_memory_exception_object_cell */
extern unsigned char ge2586os1922;
extern T0* ge2586ov1922;
extern T0* T19f6(GE_context* ac, T0* C);
/* CELL [NO_MORE_MEMORY].put */
extern T0* T26c2(GE_context* ac, T0* a1);
/* NO_MORE_MEMORY.default_create */
extern T0* T64c8(GE_context* ac);
/* VOID_TARGET.default_create */
extern T0* T58c6(GE_context* ac);
/* ISE_EXCEPTION_MANAGER.exception_data */
extern T0* T19f9(GE_context* ac, T0* C);
/* CELL [detachable TUPLE [INTEGER_32, INTEGER_32, INTEGER_32, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, INTEGER_32, BOOLEAN]].put */
extern void T24f2(GE_context* ac, T0* C, T0* a1);
/* CELL [detachable TUPLE [INTEGER_32, INTEGER_32, INTEGER_32, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, INTEGER_32, BOOLEAN]].put */
extern T0* T24c2(GE_context* ac, T0* a1);
/* ISE_EXCEPTION_MANAGER.exception_data_cell */
extern unsigned char ge2586os1920;
extern T0* ge2586ov1920;
extern T0* T19f4(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.init_exception_manager */
extern void T19f14(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.unraisable_exceptions */
extern unsigned char ge2586os1918;
extern T0* ge2586ov1918;
extern T0* T19f3(GE_context* ac, T0* C);
/* HASH_TABLE [INTEGER_32, INTEGER_32].force */
extern void T23f36(GE_context* ac, T0* C, T6 a1, T6 a2);
/* HASH_TABLE [INTEGER_32, INTEGER_32].position */
extern T6 T23f22(GE_context* ac, T0* C);
/* SPECIAL [BOOLEAN].force */
extern void T96f7(GE_context* ac, T0* C, T1 a1, T6 a2);
/* HASH_TABLE [INTEGER_32, INTEGER_32].deleted_position */
extern T6 T23f21(GE_context* ac, T0* C, T6 a1);
/* HASH_TABLE [INTEGER_32, INTEGER_32].add_space */
extern void T23f38(GE_context* ac, T0* C);
/* HASH_TABLE [INTEGER_32, INTEGER_32].accommodate */
extern void T23f39(GE_context* ac, T0* C, T6 a1);
/* HASH_TABLE [INTEGER_32, INTEGER_32].set_indexes_map */
extern void T23f43(GE_context* ac, T0* C, T0* a1);
/* HASH_TABLE [INTEGER_32, INTEGER_32].set_deleted_marks */
extern void T23f42(GE_context* ac, T0* C, T0* a1);
/* HASH_TABLE [INTEGER_32, INTEGER_32].set_keys */
extern void T23f41(GE_context* ac, T0* C, T0* a1);
/* HASH_TABLE [INTEGER_32, INTEGER_32].set_content */
extern void T23f40(GE_context* ac, T0* C, T0* a1);
/* HASH_TABLE [INTEGER_32, INTEGER_32].put */
extern void T23f44(GE_context* ac, T0* C, T6 a1, T6 a2);
/* HASH_TABLE [INTEGER_32, INTEGER_32].set_conflict */
extern void T23f46(GE_context* ac, T0* C);
/* HASH_TABLE [INTEGER_32, INTEGER_32].found */
extern T1 T23f31(GE_context* ac, T0* C);
/* HASH_TABLE [INTEGER_32, INTEGER_32].occupied */
extern T1 T23f29(GE_context* ac, T0* C, T6 a1);
/* HASH_TABLE [INTEGER_32, INTEGER_32].empty_duplicate */
extern T0* T23f28(GE_context* ac, T0* C, T6 a1);
/* HASH_TABLE [INTEGER_32, INTEGER_32].compare_objects */
extern void T23f45(GE_context* ac, T0* C);
/* HASH_TABLE [INTEGER_32, INTEGER_32].soon_full */
extern T1 T23f20(GE_context* ac, T0* C);
/* HASH_TABLE [INTEGER_32, INTEGER_32].not_found */
extern T1 T23f19(GE_context* ac, T0* C);
/* HASH_TABLE [INTEGER_32, INTEGER_32].internal_search */
extern void T23f37(GE_context* ac, T0* C, T6 a1);
/* ISE_EXCEPTION_MANAGER.unignorable_exceptions */
extern unsigned char ge2586os1917;
extern T0* ge2586ov1917;
extern T0* T19f2(GE_context* ac, T0* C);
/* DIRECTORY.dispose */
extern void T616f20(GE_context* ac, T0* C);
/* DIRECTORY.close */
extern void T616f25(GE_context* ac, T0* C);
/* DIRECTORY.default_pointer */
extern T14 T616f9(GE_context* ac, T0* C);
/* DIRECTORY.dir_close */
extern void T616f30(GE_context* ac, T0* C, T14 a1);
/* DIRECTORY.is_closed */
extern T1 T616f12(GE_context* ac, T0* C);
/* RAW_FILE.dispose */
extern void T615f16(GE_context* ac, T0* C);
/* RAW_FILE.close */
extern void T615f20(GE_context* ac, T0* C);
/* RAW_FILE.default_pointer */
extern T14 T615f14(GE_context* ac, T0* C);
/* RAW_FILE.file_close */
extern void T615f22(GE_context* ac, T0* C, T14 a1);
/* RAW_FILE.is_closed */
extern T1 T615f13(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.dispose */
extern void T609f25(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.old_close */
extern void T609f30(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.default_pointer */
extern T14 T609f16(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.file_close */
extern void T609f34(GE_context* ac, T0* C, T14 a1);
/* KL_BINARY_OUTPUT_FILE.old_is_closed */
extern T1 T609f11(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.dispose */
extern void T608f37(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.old_close */
extern void T608f42(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.default_pointer */
extern T14 T608f23(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.file_close */
extern void T608f45(GE_context* ac, T0* C, T14 a1);
/* KL_BINARY_INPUT_FILE.old_is_closed */
extern T1 T608f12(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.dispose */
extern void T527f26(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.old_close */
extern void T527f32(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.default_pointer */
extern T14 T527f16(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.file_close */
extern void T527f38(GE_context* ac, T0* C, T14 a1);
/* KL_TEXT_OUTPUT_FILE.old_is_closed */
extern T1 T527f11(GE_context* ac, T0* C);
/* KL_DIRECTORY.dispose */
extern void T410f44(GE_context* ac, T0* C);
/* KL_DIRECTORY.old_close */
extern void T410f47(GE_context* ac, T0* C);
/* KL_DIRECTORY.default_pointer */
extern T14 T410f13(GE_context* ac, T0* C);
/* KL_DIRECTORY.dir_close */
extern void T410f49(GE_context* ac, T0* C, T14 a1);
/* KL_DIRECTORY.is_closed */
extern T1 T410f11(GE_context* ac, T0* C);
/* MANAGED_POINTER.dispose */
extern void T128f10(GE_context* ac, T0* C);
/* POINTER.memory_free */
extern void T14f11(GE_context* ac, T14* C);
/* POINTER.default_pointer */
extern T14 T14f8(GE_context* ac, T14* C);
/* POINTER.c_free */
extern void T14f14(GE_context* ac, T14* C, T14 a1);
/* KL_TEXT_INPUT_FILE.dispose */
extern void T97f61(GE_context* ac, T0* C);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].record */
extern void T632f5(GE_context* ac, T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.put */
extern void T601f12(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.put */
extern void T601f12p1(GE_context* ac, T0* C, T6 a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].record */
extern void T630f4(GE_context* ac, T0* C, T0* a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].record */
extern void T628f5(GE_context* ac, T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.add */
extern void T601f11(GE_context* ac, T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.add */
extern void T601f11p1(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.log_validation_messages */
extern void T384f34(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.validation_messages */
extern unsigned char ge10os1964;
extern T0* ge10ov1964;
extern T0* T384f16(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.log_validation_messages */
extern void T382f35(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.validation_messages */
extern T0* T382f13(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.log_validation_messages */
extern void T380f25(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.validation_messages */
extern T0* T380f5(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.log_validation_messages */
extern void T378f32(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.validation_messages */
extern T0* T378f13(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.log_validation_messages */
extern void T376f26(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.validation_messages */
extern T0* T376f7(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.log_validation_messages */
extern void T374f31(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.validation_messages */
extern T0* T374f13(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.log_validation_messages */
extern void T372f44(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.validation_messages */
extern T0* T372f23(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.log_validation_messages */
extern void T370f27(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.validation_messages */
extern T0* T370f8(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.log_validation_messages */
extern void T368f29(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.validation_messages */
extern T0* T368f11(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.log_validation_messages */
extern void T366f34(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.validation_messages */
extern T0* T366f13(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.log_validation_messages */
extern void T364f34(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.validation_messages */
extern T0* T364f13(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.log_validation_messages */
extern void T362f25(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.validation_messages */
extern T0* T362f5(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.log_validation_messages */
extern void T360f25(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.validation_messages */
extern T0* T360f5(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.log_validation_messages */
extern void T358f40(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.validation_messages */
extern T0* T358f20(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.log_validation_messages */
extern void T356f42(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.validation_messages */
extern T0* T356f22(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.log_validation_messages */
extern void T354f37(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.validation_messages */
extern T0* T354f16(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.log_validation_messages */
extern void T352f38(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.validation_messages */
extern T0* T352f16(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.log_validation_messages */
extern void T350f42(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.validation_messages */
extern T0* T350f20(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.log_validation_messages */
extern void T348f38(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.validation_messages */
extern T0* T348f16(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.log_validation_messages */
extern void T346f26(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.validation_messages */
extern T0* T346f7(GE_context* ac, T0* C);
/* GEANT_SET_TASK.log_validation_messages */
extern void T344f27(GE_context* ac, T0* C);
/* GEANT_SET_TASK.validation_messages */
extern T0* T344f8(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.log_validation_messages */
extern void T342f27(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.validation_messages */
extern T0* T342f8(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.log_validation_messages */
extern void T340f26(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.validation_messages */
extern T0* T340f6(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.log_validation_messages */
extern void T338f39(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.validation_messages */
extern T0* T338f17(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.log_validation_messages */
extern void T332f40(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.validation_messages */
extern T0* T332f18(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.execute */
extern void T384f40(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.execute */
extern void T481f40(GE_context* ac, T0* C);
/* GEANT_FILESET.forth */
extern void T432f50(GE_context* ac, T0* C);
/* GEANT_FILESET.update_project_variables */
extern void T432f55(GE_context* ac, T0* C);
/* GEANT_FILESET.remove_project_variables */
extern void T432f51(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.remove */
extern void T32f86(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.remove_position */
extern void T32f88(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.key_storage_put */
extern void T32f70(GE_context* ac, T0* C, T0* a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.item_storage_put */
extern void T32f66(GE_context* ac, T0* C, T0* a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.key_storage_keep_head */
extern void T32f92(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.item_storage_keep_head */
extern void T32f91(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.clashes_put */
extern void T32f68(GE_context* ac, T0* C, T6 a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.slots_put */
extern void T32f69(GE_context* ac, T0* C, T6 a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.move_cursors_forth */
extern void T32f90(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].set_position */
extern void T105f14(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].set_next_cursor */
extern void T105f15(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].set_after */
extern void T105f13(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.internal_set_key_equality_tester */
extern void T32f89(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET.off */
extern T1 T432f27(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].off */
extern T1 T515f35(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_off */
extern T1 T515f23(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].off */
extern T1 T553f5(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].forth */
extern void T515f39(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_forth */
extern void T515f44(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].add_traversing_cursor */
extern void T515f58(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].set_next_cursor */
extern void T553f10(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].set_position */
extern void T553f11(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].remove_traversing_cursor */
extern void T515f57(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].set_after */
extern void T553f9(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].clashes_item */
extern T6 T515f24(GE_context* ac, T0* C, T6 a1);
/* GEANT_REPLACE_COMMAND.create_directory_for_pathname */
extern void T481f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.file_system */
extern T0* T481f20(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.windows_file_system */
extern T0* T481f27(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.operating_system */
extern T0* T481f26(GE_context* ac, T0* C);
/* GEANT_FILESET.item_mapped_filename */
extern T0* T432f26(GE_context* ac, T0* C);
/* GEANT_FILESET_ENTRY.mapped_filename_converted */
extern T0* T543f6(GE_context* ac, T0* C);
/* GEANT_FILESET_ENTRY.unix_file_system */
extern T0* T543f9(GE_context* ac, T0* C);
/* GEANT_FILESET_ENTRY.file_system */
extern T0* T543f8(GE_context* ac, T0* C);
/* GEANT_FILESET_ENTRY.windows_file_system */
extern T0* T543f11(GE_context* ac, T0* C);
/* GEANT_FILESET_ENTRY.operating_system */
extern T0* T543f10(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_for_iteration */
extern T0* T515f32(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_item */
extern T0* T515f26(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_storage_item */
extern T0* T515f27(GE_context* ac, T0* C, T6 a1);
/* GEANT_FILESET.item_filename */
extern T0* T432f25(GE_context* ac, T0* C);
/* GEANT_FILESET_ENTRY.filename_converted */
extern T0* T543f5(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.unix_file_system */
extern T0* T481f19(GE_context* ac, T0* C);
/* GEANT_FILESET.is_in_gobo_31_format */
extern T1 T432f21(GE_context* ac, T0* C);
/* GEANT_FILESET.after */
extern T1 T432f20(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].after */
extern T1 T515f17(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_after */
extern T1 T515f18(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].after */
extern T1 T553f7(GE_context* ac, T0* C);
/* GEANT_FILESET.start */
extern void T432f49(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].start */
extern void T515f38(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_start */
extern void T515f43(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].is_empty */
extern T1 T515f22(GE_context* ac, T0* C);
/* GEANT_FILESET.execute */
extern void T432f48(GE_context* ac, T0* C);
/* GEANT_FILESET.remove_fileset_entry */
extern void T432f54(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].remove */
extern void T515f41(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].remove_position */
extern void T515f51(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_storage_put */
extern void T515f67(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_storage_put */
extern void T515f47(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].force */
extern void T556f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [GEANT_FILESET_ENTRY].fill_with */
extern void T554f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_FILESET_ENTRY].extend */
extern void T554f10(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_storage_keep_head */
extern void T515f66(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_storage_keep_head */
extern void T515f65(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_FILESET_ENTRY].keep_head */
extern void T554f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [GEANT_FILESET_ENTRY].set_count */
extern void T554f9(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].clashes_put */
extern void T515f49(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].slots_put */
extern void T515f50(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].move_cursors_forth */
extern void T515f64(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].internal_set_key_equality_tester */
extern void T515f63(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_equality_tester */
extern T0* T515f28(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].slots_item */
extern T6 T515f36(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].hash_position */
extern T6 T515f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ENTRY.hash_code */
extern T6 T543f3(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_storage_item */
extern T0* T515f29(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].search_position */
extern void T515f46(GE_context* ac, T0* C, T0* a1);
/* detachable KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY].test */
extern T1 T555f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_FILESET_ENTRY.is_equal */
extern T1 T543f4(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET_ENTRY.string_ */
extern T0* T543f7(GE_context* ac, T0* C);
/* GEANT_FILESET_ENTRY.make */
extern T0* T543c12(GE_context* ac, T0* a1, T0* a2);
/* DS_HASH_SET_CURSOR [STRING_8].forth */
extern void T542f11(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].cursor_forth */
extern void T517f51(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].add_traversing_cursor */
extern void T517f53(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_next_cursor */
extern void T542f14(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_position */
extern void T542f13(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].remove_traversing_cursor */
extern void T517f52(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_after */
extern void T542f12(GE_context* ac, T0* C);
/* GEANT_FILESET.add_fileset_entry_if_necessary */
extern void T432f53(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].force_last */
extern void T515f40(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].resize */
extern void T515f48(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].clashes_resize */
extern void T515f62(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].special_integer_ */
extern T0* T515f34(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_storage_resize */
extern void T515f61(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_storage_resize */
extern void T515f60(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].aliased_resized_area */
extern T0* T556f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_FILESET_ENTRY].aliased_resized_area */
extern T0* T554f4(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].slots_resize */
extern void T515f59(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].new_capacity */
extern T6 T515f30(GE_context* ac, T0* C, T6 a1);
/* GEANT_FILESET.is_file_outofdate */
extern T1 T432f29(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.file_time_stamp */
extern T6 T92f32(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.time_stamp */
extern T6 T97f43(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.date */
extern T6 T97f45(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.eif_file_date */
extern T6 T97f50(GE_context* ac, T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.file_time_stamp */
extern T6 T93f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_MAP.mapped_filename */
extern T0* T512f10(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.remove_tail */
extern void T265f90(GE_context* ac, T0* C, T6 a1);
/* STRING_8.remove_tail */
extern void T17f60(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.remove_head */
extern void T265f89(GE_context* ac, T0* C, T6 a1);
/* STRING_8.remove_head */
extern void T17f59(GE_context* ac, T0* C, T6 a1);
/* GEANT_MAP.glob_postfix */
extern T0* T512f16(GE_context* ac, T0* C, T0* a1);
/* GEANT_MAP.glob_prefix */
extern T0* T512f15(GE_context* ac, T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.replace_all */
extern T0* T547f231(GE_context* ac, T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_replace_all_to_string */
extern void T547f305(GE_context* ac, T0* C, T0* a1, T0* a2);
/* RX_PCRE_REGULAR_EXPRESSION.match_unbounded_substring */
extern void T547f319(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_substring */
extern void T547f317(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_it */
extern void T547f331(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_start */
extern T1 T547f151(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_internal */
extern T6 T547f233(GE_context* ac, T0* C, T6 a1, T1 a2, T1 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_type */
extern T6 T547f297(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3, T1 a4);
/* RX_PCRE_REGULAR_EXPRESSION.match_not_repeated_characters */
extern T6 T547f296(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3, T1 a4);
/* RX_PCRE_REGULAR_EXPRESSION.infinity */
extern unsigned char ge427os10879;
extern T6 ge427ov10879;
extern T6 T547f62(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.platform */
extern T0* T547f195(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_characters */
extern T6 T547f295(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3, T1 a4);
/* RX_BYTE_CODE.character_item */
extern T6 T567f8(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_classes */
extern T6 T547f294(GE_context* ac, T0* C, T6 a1);
/* RX_BYTE_CODE.character_set_has */
extern T1 T567f10(GE_context* ac, T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_refs */
extern T6 T547f293(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_ref */
extern T6 T547f299(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.space_set */
extern unsigned char ge433os11046;
extern T0* ge433ov11046;
extern T0* T547f152(GE_context* ac, T0* C);
/* RX_CHARACTER_SET.make */
extern T0* T568c5(GE_context* ac, T0* a1);
/* RX_CHARACTER_SET.add_string */
extern void T568f10(GE_context* ac, T0* C, T0* a1);
/* RX_CHARACTER_SET.add_character */
extern void T568f9(GE_context* ac, T0* C, T6 a1);
/* RX_CHARACTER_SET.make_empty */
extern void T568f4(GE_context* ac, T0* C);
/* RX_CHARACTER_SET.make_empty */
extern T0* T568c4(GE_context* ac);
/* KL_SPECIAL_ROUTINES [BOOLEAN].make_filled */
extern T0* T217f3(GE_context* ac, T0* C, T1 a1, T6 a2);
/* RX_CHARACTER_SET.special_boolean_ */
extern unsigned char ge127os2703;
extern T0* ge127ov2703;
extern T0* T568f3(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.digit_set */
extern unsigned char ge433os11038;
extern T0* ge433ov11038;
extern T0* T547f168(GE_context* ac, T0* C);
/* RX_CHARACTER_SET.has */
extern T1 T568f2(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_ims_options */
extern void T547f329(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_dotall */
extern T1 T547f87(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_multiline */
extern T1 T547f86(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_caseless */
extern T1 T547f85(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_match_count */
extern void T547f338(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_next_start */
extern void T547f337(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_recursive */
extern T6 T547f292(GE_context* ac, T0* C, T6 a1, T1 a2, T1 a3);
/* RX_BYTE_CODE.integer_item */
extern T6 T567f11(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.next_matching_alternate */
extern T6 T547f290(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_additional_bracket */
extern T6 T547f271(GE_context* ac, T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.opcode_item */
extern T6 T567f7(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.special_integer_ */
extern T0* T547f56(GE_context* ac, T0* C);
/* RX_CASE_MAPPING.flip_case */
extern T6 T569f4(GE_context* ac, T0* C, T6 a1);
/* RX_CASE_MAPPING.to_lower */
extern T6 T569f3(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_replacement_to_string */
extern void T547f318(GE_context* ac, T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.append_code */
extern void T265f91(GE_context* ac, T0* C, T10 a1);
/* UC_UTF8_STRING.append_item_code */
extern void T265f92(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_captured_substring_to_string */
extern void T547f332(GE_context* ac, T0* C, T0* a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.captured_end_position */
extern T6 T547f55(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.captured_start_position */
extern T6 T547f54(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.string_ */
extern T0* T547f57(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.has_matched */
extern T1 T547f72(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.match */
extern void T547f304(GE_context* ac, T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_compiled */
extern T1 T547f149(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.compile */
extern void T547f301(GE_context* ac, T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.compile */
extern void T547f301p1(GE_context* ac, T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_startline */
extern void T547f316(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.has_startline */
extern T1 T547f230(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.first_significant_code */
extern T6 T547f190(GE_context* ac, T0* C, T6 a1, T6 a2, T1 a3);
/* RX_PCRE_REGULAR_EXPRESSION.find_firstchar */
extern T6 T547f229(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_anchored */
extern void T547f315(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.can_anchored */
extern T1 T547f228(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.ims_options */
extern T6 T547f84(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_option_dotall */
extern T6 T547f133(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_option_multiline */
extern T6 T547f131(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_option_caseless */
extern T6 T547f129(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.compile_regexp */
extern void T547f314(GE_context* ac, T0* C, T6 a1, T1 a2, T1 a3, T6 a4);
/* RX_BYTE_CODE.set_count */
extern void T567f18(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.find_fixed_code_length */
extern T6 T547f67(GE_context* ac, T0* C, T6 a1);
/* RX_BYTE_CODE.put_integer */
extern void T567f17(GE_context* ac, T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.compile_branch */
extern void T547f330(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.meta_set */
extern unsigned char ge433os11047;
extern T0* ge433ov11047;
extern T0* T547f148(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.maxlit */
extern unsigned char ge427os10880;
extern T6 ge427ov10880;
extern T6 T547f147(GE_context* ac, T0* C);
/* RX_BYTE_CODE.append_character */
extern void T567f19(GE_context* ac, T0* C, T6 a1);
/* RX_BYTE_CODE.put_character */
extern void T567f25(GE_context* ac, T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.resize_byte_code */
extern void T567f24(GE_context* ac, T0* C, T6 a1);
/* RX_BYTE_CODE.special_integer_ */
extern T0* T567f9(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.scan_escape */
extern T6 T547f142(GE_context* ac, T0* C, T6 a1, T1 a2);
/* RX_PCRE_REGULAR_EXPRESSION.scan_hex_number */
extern T6 T547f223(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.xdigit_set */
extern unsigned char ge433os11040;
extern T0* ge433ov11040;
extern T0* T547f245(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.scan_octal_number */
extern T6 T547f222(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.escape_character */
extern T6 T547f218(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.to_option_ims */
extern T6 T547f136(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_ichanged */
extern void T547f328(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.unset_option_dotall */
extern T6 T547f134(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.unset_option_multiline */
extern T6 T547f132(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.unset_option_caseless */
extern T6 T547f130(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.scan_decimal_number */
extern T6 T547f111(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.compile_repeats */
extern void T547f335(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3, T6 a4, T6 a5);
/* RX_BYTE_CODE.append_subcopy */
extern void T567f23(GE_context* ac, T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.put_opcode */
extern void T567f22(GE_context* ac, T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.move_right */
extern void T567f21(GE_context* ac, T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.compile_single_repeat */
extern void T547f336(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3, T6 a4, T6 a5, T6 a6);
/* RX_PCRE_REGULAR_EXPRESSION.compile_character_class */
extern void T547f334(GE_context* ac, T0* C);
/* RX_BYTE_CODE.append_character_set */
extern void T567f20(GE_context* ac, T0* C, T0* a1, T1 a2);
/* RX_BYTE_CODE.resize_character_sets */
extern void T567f26(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].aliased_resized_area_with_default */
extern T0* T217f4(GE_context* ac, T0* C, T0* a1, T1 a2, T6 a3);
/* SPECIAL [BOOLEAN].aliased_resized_area_with_default */
extern T0* T96f5(GE_context* ac, T0* C, T1 a1, T6 a2);
/* RX_BYTE_CODE.special_boolean_ */
extern T0* T567f12(GE_context* ac, T0* C);
/* RX_CHARACTER_SET.add_set */
extern void T568f8(GE_context* ac, T0* C, T0* a1);
/* RX_CHARACTER_SET.add_negated_set */
extern void T568f7(GE_context* ac, T0* C, T0* a1);
/* ARRAY [RX_CHARACTER_SET].item */
extern T0* T571f4(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.class_sets */
extern unsigned char ge433os11049;
extern T0* ge433ov11049;
extern T0* T547f160(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.default_word_set */
extern unsigned char ge433os11034;
extern T0* ge433ov11034;
extern T0* T547f78(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.punct_set */
extern unsigned char ge433os11044;
extern T0* ge433ov11044;
extern T0* T547f244(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.print_set */
extern unsigned char ge433os11043;
extern T0* ge433ov11043;
extern T0* T547f243(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.graph_set */
extern unsigned char ge433os11042;
extern T0* ge433ov11042;
extern T0* T547f242(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.cntrl_set */
extern unsigned char ge433os11041;
extern T0* ge433ov11041;
extern T0* T547f241(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.ascii_set */
extern unsigned char ge433os11045;
extern T0* ge433ov11045;
extern T0* T547f240(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.alnum_set */
extern unsigned char ge433os11039;
extern T0* ge433ov11039;
extern T0* T547f239(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.upper_set */
extern unsigned char ge433os11035;
extern T0* ge433ov11035;
extern T0* T547f238(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.lower_set */
extern unsigned char ge433os11036;
extern T0* ge433ov11036;
extern T0* T547f237(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.alpha_set */
extern unsigned char ge433os11037;
extern T0* ge433ov11037;
extern T0* T547f235(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.check_posix_name */
extern T6 T547f158(GE_context* ac, T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.class_names */
extern unsigned char ge433os11048;
extern T0* ge433ov11048;
extern T0* T547f236(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.check_posix_syntax */
extern T6 T547f156(GE_context* ac, T0* C, T6 a1);
/* RX_CHARACTER_SET.wipe_out */
extern void T568f6(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.actual_set */
extern unsigned char ge427os10878;
extern T0* ge427ov10878;
extern T0* T547f153(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.compile_counted_repeats */
extern T1 T547f89(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.scan_comment */
extern void T547f333(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_undef */
extern T1 T547f64(GE_context* ac, T0* C, T6 a1);
/* RX_BYTE_CODE.append_integer */
extern void T567f16(GE_context* ac, T0* C, T6 a1);
/* RX_BYTE_CODE.append_opcode */
extern void T567f15(GE_context* ac, T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_error */
extern void T547f313(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.set_default_internal_options */
extern void T547f312(GE_context* ac, T0* C);
/* RX_BYTE_CODE.wipe_out */
extern void T567f14(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.wipe_out */
extern void T547f311(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.wipe_out */
extern void T547f311p1(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.make */
extern T0* T547c300(GE_context* ac);
/* KL_SPECIAL_ROUTINES [INTEGER_32].make_filled */
extern T0* T106f5(GE_context* ac, T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.make */
extern void T547f300p1(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_default_options */
extern void T547f310(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_strict */
extern void T547f327(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_greedy */
extern void T547f326(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_eol */
extern void T547f325(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_bol */
extern void T547f324(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_dollar_endonly */
extern void T547f323(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_empty_allowed */
extern void T547f322(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_extended */
extern void T547f321(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_dotall */
extern void T547f320(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_multiline */
extern void T547f303(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_caseless */
extern void T547f302(GE_context* ac, T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_word_set */
extern void T547f309(GE_context* ac, T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_character_case_mapping */
extern void T547f308(GE_context* ac, T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.default_character_case_mapping */
extern unsigned char ge433os11033;
extern T0* ge433ov11033;
extern T0* T547f77(GE_context* ac, T0* C);
/* RX_CASE_MAPPING.make */
extern T0* T569c6(GE_context* ac, T0* a1, T0* a2);
/* RX_CASE_MAPPING.add */
extern void T569f8(GE_context* ac, T0* C, T0* a1, T0* a2);
/* RX_CASE_MAPPING.make_default */
extern void T569f7(GE_context* ac, T0* C);
/* RX_CASE_MAPPING.clear */
extern void T569f9(GE_context* ac, T0* C);
/* RX_CASE_MAPPING.special_integer_ */
extern T0* T569f5(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.reset */
extern void T547f307(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.reset */
extern void T547f307p1(GE_context* ac, T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.empty_pattern_buffer */
extern unsigned char ge427os10877;
extern T0* ge427ov10877;
extern T0* T547f76(GE_context* ac, T0* C);
/* RX_BYTE_CODE.make */
extern T0* T567c13(GE_context* ac, T6 a1);
/* GEANT_MAP.type_attribute_value_regexp */
extern unsigned char ge88os10130;
extern T0* ge88ov10130;
extern T0* T512f8(GE_context* ac, T0* C);
/* GEANT_MAP.type_attribute_value_merge */
extern unsigned char ge88os10128;
extern T0* ge88ov10128;
extern T0* T512f7(GE_context* ac, T0* C);
/* GEANT_MAP.unix_file_system */
extern T0* T512f14(GE_context* ac, T0* C);
/* GEANT_MAP.type_attribute_value_flat */
extern unsigned char ge88os10127;
extern T0* ge88ov10127;
extern T0* T512f6(GE_context* ac, T0* C);
/* GEANT_MAP.string_ */
extern T0* T512f12(GE_context* ac, T0* C);
/* GEANT_MAP.is_executable */
extern T1 T512f11(GE_context* ac, T0* C);
/* GEANT_MAP.type_attribute_value_glob */
extern unsigned char ge88os10129;
extern T0* ge88ov10129;
extern T0* T512f9(GE_context* ac, T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].item */
extern T0* T542f5(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].cursor_item */
extern T0* T517f29(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].after */
extern T1 T542f7(GE_context* ac, T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].start */
extern void T542f10(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].cursor_start */
extern void T517f50(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].cursor_off */
extern T1 T517f31(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].off */
extern T1 T542f8(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].is_empty */
extern T1 T517f30(GE_context* ac, T0* C);
/* GEANT_FILESET.scan_internal */
extern void T432f52(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.close */
extern void T410f53(GE_context* ac, T0* C);
/* LX_DFA_WILDCARD.recognizes */
extern T1 T519f12(GE_context* ac, T0* C, T0* a1);
/* LX_DFA_WILDCARD.longest_end_position */
extern T6 T519f14(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_readable */
extern T1 T92f31(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.is_readable */
extern T1 T410f31(GE_context* ac, T0* C);
/* KL_DIRECTORY.old_is_readable */
extern T1 T410f21(GE_context* ac, T0* C);
/* KL_DIRECTORY.eif_dir_is_readable */
extern T1 T410f32(GE_context* ac, T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.is_directory_readable */
extern T1 T93f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_FILESET.string_ */
extern T0* T432f28(GE_context* ac, T0* C);
/* KL_DIRECTORY.read_entry */
extern void T410f52(GE_context* ac, T0* C);
/* KL_DIRECTORY.readentry */
extern void T410f56(GE_context* ac, T0* C);
/* KL_DIRECTORY.eif_dir_next */
extern T14 T410f29(GE_context* ac, T0* C, T14 a1);
/* KL_DIRECTORY.old_end_of_input */
extern T1 T410f23(GE_context* ac, T0* C);
/* KL_DIRECTORY.is_open_read */
extern T1 T410f18(GE_context* ac, T0* C);
/* KL_DIRECTORY.open_read */
extern void T410f51(GE_context* ac, T0* C);
/* KL_DIRECTORY.old_open_read */
extern void T410f55(GE_context* ac, T0* C);
/* KL_DIRECTORY.dir_open */
extern T14 T410f26(GE_context* ac, T0* C, T14 a1);
/* GEANT_FILESET.unix_file_system */
extern T0* T432f24(GE_context* ac, T0* C);
/* GEANT_FILESET.file_system */
extern T0* T432f23(GE_context* ac, T0* C);
/* GEANT_FILESET.windows_file_system */
extern T0* T432f32(GE_context* ac, T0* C);
/* GEANT_FILESET.operating_system */
extern T0* T432f31(GE_context* ac, T0* C);
/* GEANT_FILESET.is_executable */
extern T1 T432f19(GE_context* ac, T0* C);
/* GEANT_FILESET.is_in_gobo_32_format */
extern T1 T432f22(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.execute_replace */
extern void T481f41(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_COMMAND.execute_replace_token */
extern void T481f45(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_TEXT_OUTPUT_FILE.close */
extern void T527f29(GE_context* ac, T0* C);
/* KL_STRING_ROUTINES.replaced_first_substring */
extern T0* T115f16(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* KL_STRING_ROUTINES.substring_index */
extern T6 T115f17(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* KL_STRING_ROUTINES.platform */
extern T0* T115f18(GE_context* ac, T0* C);
/* STRING_8.substring_index */
extern T6 T17f33(GE_context* ac, T0* C, T0* a1, T6 a2);
/* STRING_8_SEARCHER.substring_index */
extern T6 T656f2(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* STRING_8_SEARCHER.substring_index_with_deltas */
extern T6 T656f3(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* STRING_8_SEARCHER.internal_initialize_deltas */
extern void T656f6(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* STRING_8.string_searcher */
extern unsigned char ge2417os489;
extern T0* ge2417ov489;
extern T0* T17f34(GE_context* ac, T0* C);
/* STRING_8_SEARCHER.make */
extern T0* T656c5(GE_context* ac);
/* KL_STRING_ROUTINES.replaced_all_substrings */
extern T0* T115f15(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* GEANT_REPLACE_COMMAND.string_ */
extern T0* T481f25(GE_context* ac, T0* C);
/* UC_UTF8_STRING.has */
extern T1 T265f55(GE_context* ac, T0* C, T2 a1);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T527f28(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.is_closed */
extern T1 T527f13(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_write */
extern void T527f34(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T527f34p1(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.file_open */
extern T14 T527f19(GE_context* ac, T0* C, T14 a1, T6 a2);
/* KL_TEXT_OUTPUT_FILE.internal_name_pointer */
extern T0* T527f18(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.string_name */
extern T0* T527f12(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.reset */
extern void T527f42(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.make */
extern void T527f25(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.make */
extern T0* T527c25(GE_context* ac, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_make */
extern void T527f31(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.make_with_name */
extern void T527f37(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.set_name */
extern void T527f40(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.buffered_file_info */
extern T0* T527f24(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.tmp_output_file */
extern unsigned char ge42os9407;
extern T0* ge42ov9407;
extern T0* T481f24(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.read_string */
extern void T97f74(GE_context* ac, T0* C, T6 a1);
/* KL_TEXT_INPUT_FILE.read_to_string */
extern T6 T97f36(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
extern unsigned char ge157os3918;
extern T0* ge157ov3918;
extern T0* T97f41(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.any_ */
extern T0* T97f38(GE_context* ac, T0* C);
/* STRING_8.set_internal_hash_code */
extern void T17f61(GE_context* ac, T0* C, T6 a1);
/* KL_TEXT_INPUT_FILE.old_read_to_string */
extern T6 T97f40(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.file_gss */
extern T6 T97f42(GE_context* ac, T0* C, T14 a1, T14 a2, T6 a3);
/* SPECIAL [CHARACTER_8].item_address */
extern T14 T15f8(GE_context* ac, T0* C, T6 a1);
/* GEANT_REPLACE_COMMAND.tmp_input_file */
extern unsigned char ge42os9406;
extern T0* ge42ov9406;
extern T0* T481f22(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.execute_replace_regexp */
extern void T481f44(GE_context* ac, T0* C, T0* a1, T0* a2);
/* RX_PCRE_REGULAR_EXPRESSION.replace */
extern T0* T547f232(GE_context* ac, T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_replace_to_string */
extern void T547f306(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_COMMAND.execute_replace_variable_pattern */
extern void T481f43(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ARRAY [GEANT_VARIABLES].item */
extern T0* T550f4(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT.aggregated_variables_array */
extern T0* T29f27(GE_context* ac, T0* C);
/* ARRAY [GEANT_VARIABLES].put */
extern void T550f6(GE_context* ac, T0* C, T0* a1, T6 a2);
/* ARRAY [GEANT_VARIABLES].make_filled */
extern T0* T550c5(GE_context* ac, T0* a1, T6 a2, T6 a3);
/* ARRAY [GEANT_VARIABLES].make_filled_area */
extern void T550f7(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_VARIABLES].make_filled */
extern T0* T244c11(GE_context* ac, T0* a1, T6 a2);
/* UC_UTF8_STRING.occurrences */
extern T6 T265f54(GE_context* ac, T0* C, T2 a1);
/* UC_UTF8_STRING.code_occurrences */
extern T6 T265f56(GE_context* ac, T0* C, T6 a1);
/* STRING_8.occurrences */
extern T6 T17f32(GE_context* ac, T0* C, T2 a1);
/* GEANT_REPLACE_COMMAND.is_file_to_file_executable */
extern T1 T481f16(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.is_replace_executable */
extern T1 T481f18(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.exit_application */
extern void T384f41(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_REPLACE_TASK.exceptions */
extern T0* T384f27(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.std */
extern T0* T384f26(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.log_messages */
extern void T384f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_TASK.dir_attribute_name */
extern T0* T384f25(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.file_system */
extern T0* T384f24(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.unix_file_system */
extern T0* T384f30(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.windows_file_system */
extern T0* T384f29(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.operating_system */
extern T0* T384f28(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.execute */
extern void T382f41(GE_context* ac, T0* C);
/* GEANT_INPUT_COMMAND.execute */
extern void T479f23(GE_context* ac, T0* C);
/* GEANT_PROJECT.set_variable_value */
extern void T29f51(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT.is_local_variable */
extern T1 T29f26(GE_context* ac, T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.matches */
extern T1 T547f58(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].has */
extern T1 T298f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_COMMAND.string_ */
extern T0* T479f14(GE_context* ac, T0* C);
/* KL_STDIN_FILE.read_line */
extern void T549f9(GE_context* ac, T0* C);
/* KL_STDIN_FILE.unread_character */
extern void T549f11(GE_context* ac, T0* C, T2 a1);
/* detachable KL_LINKABLE [CHARACTER_8].put_right */
extern void T135f4(GE_context* ac, T0* C, T0* a1);
/* detachable KL_LINKABLE [CHARACTER_8].make */
extern T0* T135c3(GE_context* ac, T2 a1);
/* KL_STDIN_FILE.read_character */
extern void T549f10(GE_context* ac, T0* C);
/* CONSOLE.read_character */
extern void T176f29(GE_context* ac, T0* C);
/* CONSOLE.console_readchar */
extern T2 T176f14(GE_context* ac, T0* C, T14 a1);
/* CONSOLE.end_of_file */
extern T1 T176f11(GE_context* ac, T0* C);
/* CONSOLE.console_eof */
extern T1 T176f13(GE_context* ac, T0* C, T14 a1);
/* KL_STDIN_FILE.console */
extern unsigned char ge170os11463;
extern T0* ge170ov11463;
extern T0* T549f6(GE_context* ac, T0* C);
/* STD_FILES.input */
extern unsigned char ge2369os5199;
extern T0* ge2369ov5199;
extern T0* T124f4(GE_context* ac, T0* C);
/* CONSOLE.make_open_stdin */
extern T0* T176c28(GE_context* ac, T0* a1);
/* CONSOLE.set_read_mode */
extern void T176f30(GE_context* ac, T0* C);
/* KL_STDIN_FILE.io */
extern T0* T549f7(GE_context* ac, T0* C);
/* KL_STDIN_FILE.string_ */
extern T0* T549f5(GE_context* ac, T0* C);
/* GEANT_INPUT_COMMAND.input */
extern unsigned char ge168os3414;
extern T0* ge168ov3414;
extern T0* T479f13(GE_context* ac, T0* C);
/* KL_STDIN_FILE.make */
extern T0* T549c8(GE_context* ac);
/* GEANT_INPUT_COMMAND.output */
extern T0* T479f12(GE_context* ac, T0* C);
/* DS_LINKED_LIST [STRING_8].set_equality_tester */
extern void T298f15(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.exit_application */
extern void T382f42(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_INPUT_TASK.exceptions */
extern T0* T382f28(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.log_messages */
extern void T382f43(GE_context* ac, T0* C, T0* a1);
/* GEANT_INPUT_TASK.dir_attribute_name */
extern T0* T382f27(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.file_system */
extern T0* T382f26(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.unix_file_system */
extern T0* T382f31(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.windows_file_system */
extern T0* T382f30(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.operating_system */
extern T0* T382f29(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.execute */
extern void T380f31(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_COMMAND.execute */
extern void T477f19(GE_context* ac, T0* C);
/* GEANT_STRING_PROPERTY.non_empty_value_or_else */
extern T0* T428f7(GE_context* ac, T0* C, T0* a1);
/* GEANT_STRING_PROPERTY.string_value */
extern T0* T428f4(GE_context* ac, T0* C);
/* GEANT_STRING_PROPERTY.is_defined */
extern T1 T428f5(GE_context* ac, T0* C);
/* GEANT_STRING_PROPERTY.value */
extern T0* T428f6(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.exit_application */
extern void T380f32(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_AVAILABLE_TASK.exceptions */
extern T0* T380f17(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.std */
extern T0* T380f16(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.log_messages */
extern void T380f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.project_variables_resolver */
extern T0* T380f10(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.dir_attribute_name */
extern T0* T380f15(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.file_system */
extern T0* T380f14(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.unix_file_system */
extern T0* T380f20(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.windows_file_system */
extern T0* T380f19(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.operating_system */
extern T0* T380f18(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.execute */
extern void T378f39(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_COMMAND.execute */
extern void T475f11(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.dir_attribute_name */
extern T0* T378f24(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.file_system */
extern T0* T378f23(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.unix_file_system */
extern T0* T378f27(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.windows_file_system */
extern T0* T378f26(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.operating_system */
extern T0* T378f25(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.execute */
extern void T376f32(GE_context* ac, T0* C);
/* GEANT_EXIT_COMMAND.execute */
extern void T473f10(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.exit_application */
extern void T376f33(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_EXIT_TASK.exceptions */
extern T0* T376f19(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.std */
extern T0* T376f18(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.log_messages */
extern void T376f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXIT_TASK.dir_attribute_name */
extern T0* T376f17(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.file_system */
extern T0* T376f16(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.unix_file_system */
extern T0* T376f22(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.windows_file_system */
extern T0* T376f21(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.operating_system */
extern T0* T376f20(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.execute */
extern void T374f37(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_COMMAND.execute */
extern void T471f28(GE_context* ac, T0* C);
/* GEANT_FILESET.go_after */
extern void T432f56(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].go_after */
extern void T515f68(GE_context* ac, T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_go_after */
extern void T515f69(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.is_file_outofdate */
extern T1 T471f17(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_COMMAND.unix_file_system */
extern T0* T471f15(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_COMMAND.file_system */
extern T0* T471f14(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_COMMAND.windows_file_system */
extern T0* T471f19(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_COMMAND.operating_system */
extern T0* T471f18(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_file_executable */
extern T1 T471f12(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.exit_application */
extern void T374f38(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.exceptions */
extern T0* T374f24(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.std */
extern T0* T374f23(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.log_messages */
extern void T374f39(GE_context* ac, T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.dir_attribute_name */
extern T0* T374f22(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.file_system */
extern T0* T374f21(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.unix_file_system */
extern T0* T374f27(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.windows_file_system */
extern T0* T374f26(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.operating_system */
extern T0* T374f25(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.execute */
extern void T372f50(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.execute */
extern void T468f41(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.execute_gexslt */
extern void T468f45(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_shell */
extern void T468f46(GE_context* ac, T0* C, T0* a1);
/* DP_SHELL_COMMAND.execute */
extern void T539f13(GE_context* ac, T0* C);
/* DP_SHELL_COMMAND.operating_system */
extern T0* T539f6(GE_context* ac, T0* C);
/* DP_SHELL_COMMAND.system */
extern void T539f14(GE_context* ac, T0* C, T0* a1);
/* DP_SHELL_COMMAND.system_call */
extern T6 T539f9(GE_context* ac, T0* C, T14 a1);
/* DP_SHELL_COMMAND.default_shell */
extern unsigned char ge2549os5524;
extern T0* ge2549ov5524;
extern T0* T539f8(GE_context* ac, T0* C);
/* STRING_32.make_empty */
extern T0* T18c23(GE_context* ac);
/* DP_SHELL_COMMAND.item */
extern T0* T539f10(GE_context* ac, T0* C, T0* a1);
/* DP_SHELL_COMMAND.eif_getenv */
extern T14 T539f11(GE_context* ac, T0* C, T14 a1);
/* DP_SHELL_COMMAND.make */
extern T0* T539c12(GE_context* ac, T0* a1);
/* DP_SHELL_COMMAND.string_ */
extern T0* T539f7(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].item */
extern T0* T469f9(GE_context* ac, T0* C, T6 a1);
/* GEANT_XSLT_COMMAND.string_ */
extern T0* T468f23(GE_context* ac, T0* C);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.set_variables */
extern void T546f5(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.make */
extern T0* T546c4(GE_context* ac);
/* GEANT_XSLT_COMMAND.execute_xsltproc */
extern void T468f44(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_xalan_java */
extern void T468f43(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_xalan_cpp */
extern void T468f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.is_file_outofdate */
extern T1 T468f22(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.put */
extern void T36f75(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_COMMAND.unix_file_system */
extern T0* T468f21(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.file_system */
extern T0* T468f20(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.windows_file_system */
extern T0* T468f25(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.operating_system */
extern T0* T468f24(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.exit_application */
extern void T372f51(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_XSLT_TASK.exceptions */
extern T0* T372f37(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.log_messages */
extern void T372f52(GE_context* ac, T0* C, T0* a1);
/* GEANT_XSLT_TASK.dir_attribute_name */
extern T0* T372f36(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.file_system */
extern T0* T372f35(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.unix_file_system */
extern T0* T372f40(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.windows_file_system */
extern T0* T372f39(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.operating_system */
extern T0* T372f38(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.execute */
extern void T370f33(GE_context* ac, T0* C);
/* GEANT_SETENV_COMMAND.execute */
extern void T465f13(GE_context* ac, T0* C);
/* KL_EXECUTION_ENVIRONMENT.set_variable_value */
extern void T149f6(GE_context* ac, T0* C, T0* a1, T0* a2);
/* EXECUTION_ENVIRONMENT.put */
extern void T129f14(GE_context* ac, T0* C, T0* a1, T0* a2);
/* EXECUTION_ENVIRONMENT.eif_putenv */
extern T6 T129f10(GE_context* ac, T0* C, T14 a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].force */
extern void T657f35(GE_context* ac, T0* C, T0* a1, T0* a2);
/* SPECIAL [NATIVE_STRING].force */
extern void T675f5(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [NATIVE_STRING].extend */
extern void T675f7(GE_context* ac, T0* C, T0* a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].position */
extern T6 T657f22(GE_context* ac, T0* C);
/* SPECIAL [IMMUTABLE_STRING_32].force */
extern void T173f9(GE_context* ac, T0* C, T0* a1, T6 a2);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].deleted_position */
extern T6 T657f21(GE_context* ac, T0* C, T6 a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].add_space */
extern void T657f37(GE_context* ac, T0* C);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].accommodate */
extern void T657f38(GE_context* ac, T0* C, T6 a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].set_indexes_map */
extern void T657f42(GE_context* ac, T0* C, T0* a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].set_deleted_marks */
extern void T657f41(GE_context* ac, T0* C, T0* a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].set_keys */
extern void T657f40(GE_context* ac, T0* C, T0* a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].set_content */
extern void T657f39(GE_context* ac, T0* C, T0* a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].put */
extern void T657f43(GE_context* ac, T0* C, T0* a1, T0* a2);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].set_conflict */
extern void T657f45(GE_context* ac, T0* C);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].found */
extern T1 T657f31(GE_context* ac, T0* C);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].occupied */
extern T1 T657f29(GE_context* ac, T0* C, T6 a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].empty_duplicate */
extern T0* T657f28(GE_context* ac, T0* C, T6 a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].compare_objects */
extern void T657f44(GE_context* ac, T0* C);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].make */
extern T0* T657c34(GE_context* ac, T6 a1);
/* SPECIAL [NATIVE_STRING].make_empty */
extern T0* T675c4(GE_context* ac, T6 a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].soon_full */
extern T1 T657f20(GE_context* ac, T0* C);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].not_found */
extern T1 T657f19(GE_context* ac, T0* C);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].internal_search */
extern void T657f36(GE_context* ac, T0* C, T0* a1);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].same_keys */
extern T1 T657f26(GE_context* ac, T0* C, T0* a1, T0* a2);
/* IMMUTABLE_STRING_32.is_equal */
extern T1 T122f12(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [CHARACTER_32].same_items */
extern T1 T16f6(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32].hash_code_of */
extern T6 T657f25(GE_context* ac, T0* C, T0* a1);
/* IMMUTABLE_STRING_32.hash_code */
extern T6 T122f11(GE_context* ac, T0* C);
/* IMMUTABLE_STRING_32.make_from_string_general */
extern T0* T122c16(GE_context* ac, T0* a1);
/* UC_UTF8_STRING.to_string_32 */
extern T0* T265f57(GE_context* ac, T0* C);
/* STRING_8.to_string_32 */
extern T0* T17f35(GE_context* ac, T0* C);
/* IMMUTABLE_STRING_32.make_from_string_32 */
extern void T122f19(GE_context* ac, T0* C, T0* a1);
/* IMMUTABLE_STRING_32.make_from_string_8 */
extern void T122f18(GE_context* ac, T0* C, T0* a1);
/* IMMUTABLE_STRING_32.make_from_area_and_bounds */
extern void T122f17(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* IMMUTABLE_STRING_32.make_from_area_and_bounds */
extern T0* T122c17(GE_context* ac, T0* a1, T6 a2, T6 a3);
/* EXECUTION_ENVIRONMENT.environ */
extern unsigned char ge2549os5541;
extern T0* ge2549ov5541;
extern T0* T129f9(GE_context* ac, T0* C);
/* GEANT_SETENV_COMMAND.execution_environment */
extern T0* T465f8(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.exit_application */
extern void T370f34(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_SETENV_TASK.exceptions */
extern T0* T370f20(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.std */
extern T0* T370f19(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.log_messages */
extern void T370f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_SETENV_TASK.dir_attribute_name */
extern T0* T370f18(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.file_system */
extern T0* T370f17(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.unix_file_system */
extern T0* T370f23(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.windows_file_system */
extern T0* T370f22(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.operating_system */
extern T0* T370f21(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.execute */
extern void T368f35(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.execute */
extern void T463f23(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.create_directory_for_pathname */
extern void T463f26(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.file_system */
extern T0* T463f14(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.windows_file_system */
extern T0* T463f16(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.operating_system */
extern T0* T463f15(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.is_file_to_file_executable */
extern T1 T463f10(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.move_file */
extern void T463f25(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.same_physical_file */
extern T1 T92f33(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_TEXT_INPUT_FILE.same_physical_file */
extern T1 T97f44(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.change_name */
extern void T97f77(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.old_change_name */
extern void T97f79(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.rename_file */
extern void T97f81(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.file_rename */
extern void T97f82(GE_context* ac, T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.file_system */
extern T0* T97f49(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.unix_file_system */
extern T0* T97f55(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.windows_file_system */
extern T0* T97f54(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.operating_system */
extern T0* T97f53(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.count */
extern T6 T97f48(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.old_count */
extern T6 T97f52(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.file_size */
extern T6 T97f57(GE_context* ac, T0* C, T14 a1);
/* FILE_INFO.size */
extern T6 T133f18(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_write */
extern T1 T97f56(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.inode */
extern T6 T97f47(GE_context* ac, T0* C);
/* FILE_INFO.inode */
extern T6 T133f17(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.tmp_file1 */
extern unsigned char ge155os3939;
extern T0* ge155ov3939;
extern T0* T97f46(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.same_physical_file */
extern T1 T93f32(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.rename_file */
extern void T92f44(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_UNIX_FILE_SYSTEM.rename_file */
extern void T93f41(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_COMMAND.unix_file_system */
extern T0* T463f13(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.create_directory */
extern void T463f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.is_file_to_directory_executable */
extern T1 T463f11(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.exit_application */
extern void T368f36(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_MOVE_TASK.exceptions */
extern T0* T368f22(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.std */
extern T0* T368f21(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.log_messages */
extern void T368f37(GE_context* ac, T0* C, T0* a1);
/* GEANT_MOVE_TASK.dir_attribute_name */
extern T0* T368f20(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.file_system */
extern T0* T368f19(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.unix_file_system */
extern T0* T368f25(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.windows_file_system */
extern T0* T368f24(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.operating_system */
extern T0* T368f23(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.execute */
extern void T366f40(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.execute */
extern void T461f27(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.create_directory_for_pathname */
extern void T461f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_COMMAND.file_system */
extern T0* T461f16(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.windows_file_system */
extern T0* T461f19(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.operating_system */
extern T0* T461f18(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.is_file_to_file_executable */
extern T1 T461f12(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.copy_file */
extern void T461f29(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.copy_file */
extern void T92f43(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_TEXT_INPUT_FILE.copy_file */
extern void T97f76(GE_context* ac, T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.close */
extern void T608f40(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.close */
extern void T609f28(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.put_string */
extern void T609f27(GE_context* ac, T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.old_put_string */
extern void T609f32(GE_context* ac, T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.file_ps */
extern void T609f35(GE_context* ac, T0* C, T14 a1, T14 a2, T6 a3);
/* KL_BINARY_OUTPUT_FILE.string_ */
extern T0* T609f9(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.read_string */
extern void T608f39(GE_context* ac, T0* C, T6 a1);
/* KL_BINARY_INPUT_FILE.read_to_string */
extern T6 T608f20(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* KL_BINARY_INPUT_FILE.dummy_kl_character_buffer */
extern T0* T608f35(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.any_ */
extern T0* T608f33(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.old_read_to_string */
extern T6 T608f19(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* KL_BINARY_INPUT_FILE.file_gss */
extern T6 T608f32(GE_context* ac, T0* C, T14 a1, T14 a2, T6 a3);
/* KL_BINARY_INPUT_FILE.old_end_of_file */
extern T1 T608f18(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.file_feof */
extern T1 T608f31(GE_context* ac, T0* C, T14 a1);
/* KL_BINARY_OUTPUT_FILE.is_open_write */
extern T1 T609f14(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.old_is_open_write */
extern T1 T609f8(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.open_write */
extern void T609f26(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.is_closed */
extern T1 T609f13(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.old_open_write */
extern void T609f31(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.open_write */
extern void T609f31p1(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.file_open */
extern T14 T609f19(GE_context* ac, T0* C, T14 a1, T6 a2);
/* KL_BINARY_OUTPUT_FILE.internal_name_pointer */
extern T0* T609f18(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.string_name */
extern T0* T609f12(GE_context* ac, T0* C);
/* KL_BINARY_OUTPUT_FILE.make */
extern T0* T609c24(GE_context* ac, T0* a1);
/* KL_BINARY_OUTPUT_FILE.old_make */
extern void T609f29(GE_context* ac, T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.make_with_name */
extern void T609f33(GE_context* ac, T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.set_name */
extern void T609f36(GE_context* ac, T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.buffered_file_info */
extern T0* T609f23(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.is_open_read */
extern T1 T608f14(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.old_is_open_read */
extern T1 T608f28(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.open_read */
extern void T608f38(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.is_closed */
extern T1 T608f17(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.old_open_read */
extern void T608f43(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.open_read */
extern void T608f43p1(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.file_open */
extern T14 T608f26(GE_context* ac, T0* C, T14 a1, T6 a2);
/* KL_BINARY_INPUT_FILE.internal_name_pointer */
extern T0* T608f25(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.old_is_readable */
extern T1 T608f16(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.buffered_file_info */
extern T0* T608f29(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.set_buffer */
extern void T608f47(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.old_exists */
extern T1 T608f15(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.file_exists */
extern T1 T608f30(GE_context* ac, T0* C, T14 a1);
/* KL_BINARY_INPUT_FILE.string_name */
extern T0* T608f13(GE_context* ac, T0* C);
/* KL_BINARY_INPUT_FILE.make */
extern T0* T608c36(GE_context* ac, T0* a1);
/* KL_BINARY_INPUT_FILE.make */
extern void T608f36p1(GE_context* ac, T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.old_make */
extern void T608f41(GE_context* ac, T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.make_with_name */
extern void T608f44(GE_context* ac, T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.set_name */
extern void T608f46(GE_context* ac, T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.string_ */
extern T0* T608f10(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.copy_file */
extern void T93f40(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.is_file_outofdate */
extern T1 T461f17(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.unix_file_system */
extern T0* T461f15(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.create_directory */
extern void T461f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_COMMAND.is_file_to_directory_executable */
extern T1 T461f13(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.exit_application */
extern void T366f41(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_COPY_TASK.exceptions */
extern T0* T366f27(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.log_messages */
extern void T366f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_COPY_TASK.dir_attribute_name */
extern T0* T366f26(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.file_system */
extern T0* T366f25(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.unix_file_system */
extern T0* T366f30(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.windows_file_system */
extern T0* T366f29(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.operating_system */
extern T0* T366f28(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.execute */
extern void T364f40(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.execute */
extern void T458f28(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.forth */
extern void T459f31(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.update_project_variables */
extern void T459f35(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.item_directory_name */
extern T0* T459f14(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.after */
extern T1 T459f13(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.start */
extern void T459f30(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.execute */
extern void T459f29(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.remove_fileset_entry */
extern void T459f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET.add_fileset_entry_if_necessary */
extern void T459f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET.scan_internal */
extern void T459f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_DIRECTORYSET.file_system */
extern T0* T459f18(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.windows_file_system */
extern T0* T459f20(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.operating_system */
extern T0* T459f19(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.string_ */
extern T0* T459f17(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.unix_file_system */
extern T0* T459f16(GE_context* ac, T0* C);
/* GEANT_DIRECTORYSET.is_executable */
extern T1 T459f15(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.is_directoryset_executable */
extern T1 T458f15(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.is_fileset_executable */
extern T1 T458f14(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.delete_file */
extern void T92f39(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.delete */
extern void T97f75(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.old_delete */
extern void T97f78(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.file_unlink */
extern void T97f80(GE_context* ac, T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.delete_file */
extern void T93f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.is_file_executable */
extern T1 T458f12(GE_context* ac, T0* C);
/* KL_EXECUTION_ENVIRONMENT.sleep */
extern void T149f5(GE_context* ac, T0* C, T7 a1);
/* EXECUTION_ENVIRONMENT.sleep */
extern void T129f13(GE_context* ac, T0* C, T7 a1);
/* EXECUTION_ENVIRONMENT.eif_sleep */
extern void T129f15(GE_context* ac, T0* C, T7 a1);
/* GEANT_DELETE_COMMAND.execution_environment */
extern T0* T458f18(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.recursive_delete_directory */
extern void T92f41(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.recursive_delete */
extern void T410f60(GE_context* ac, T0* C);
/* KL_DIRECTORY.old_recursive_delete */
extern void T410f62(GE_context* ac, T0* C);
/* KL_DIRECTORY.old_delete */
extern void T410f63(GE_context* ac, T0* C);
/* KL_DIRECTORY.eif_dir_delete */
extern void T410f65(GE_context* ac, T0* C, T14 a1);
/* KL_DIRECTORY.old_is_empty */
extern T1 T410f38(GE_context* ac, T0* C);
/* KL_DIRECTORY.count */
extern T6 T410f42(GE_context* ac, T0* C);
/* DIRECTORY.readentry */
extern void T616f22(GE_context* ac, T0* C);
/* DIRECTORY.file_info */
extern T0* T616f11(GE_context* ac, T0* C);
/* DIRECTORY.eif_dir_next */
extern T14 T616f8(GE_context* ac, T0* C, T14 a1);
/* DIRECTORY.start */
extern void T616f21(GE_context* ac, T0* C);
/* DIRECTORY.dir_rewind */
extern T14 T616f7(GE_context* ac, T0* C, T14 a1, T14 a2);
/* DIRECTORY.internal_name_pointer */
extern T0* T616f18(GE_context* ac, T0* C);
/* DIRECTORY.make_open_read */
extern T0* T616c19(GE_context* ac, T0* a1);
/* DIRECTORY.open_read */
extern void T616f27(GE_context* ac, T0* C);
/* DIRECTORY.dir_open */
extern T14 T616f13(GE_context* ac, T0* C, T14 a1);
/* DIRECTORY.make */
extern void T616f26(GE_context* ac, T0* C, T0* a1);
/* DIRECTORY.make_with_name */
extern void T616f31(GE_context* ac, T0* C, T0* a1);
/* DIRECTORY.set_name */
extern void T616f33(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.delete_content */
extern void T410f64(GE_context* ac, T0* C);
/* KL_DIRECTORY.delete_content_with_action */
extern void T410f66(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* ARRAYED_LIST [READABLE_STRING_32].wipe_out */
extern void T617f9(GE_context* ac, T0* C);
/* SPECIAL [READABLE_STRING_32].wipe_out */
extern void T671f6(GE_context* ac, T0* C);
/* SPECIAL [READABLE_STRING_32].set_count */
extern void T671f7(GE_context* ac, T0* C, T6 a1);
/* ARRAYED_LIST [READABLE_STRING_32].extend */
extern void T617f8(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [READABLE_STRING_32].extend */
extern void T671f5(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [READABLE_STRING_32].aliased_resized_area */
extern T0* T671f3(GE_context* ac, T0* C, T6 a1);
/* ARRAYED_LIST [READABLE_STRING_32].additional_space */
extern T6 T617f4(GE_context* ac, T0* C);
/* ARRAYED_LIST [READABLE_STRING_32].capacity */
extern T6 T617f5(GE_context* ac, T0* C);
/* ARRAYED_LIST [READABLE_STRING_32].count */
extern T6 T617f3(GE_context* ac, T0* C);
/* RAW_FILE.delete */
extern void T615f18(GE_context* ac, T0* C);
/* RAW_FILE.file_unlink */
extern void T615f21(GE_context* ac, T0* C, T14 a1);
/* RAW_FILE.internal_name_pointer */
extern T0* T615f11(GE_context* ac, T0* C);
/* RAW_FILE.make_with_path */
extern T0* T615c15(GE_context* ac, T0* a1);
/* RAW_FILE.set_path */
extern void T615f19(GE_context* ac, T0* C, T0* a1);
/* PATH.to_pointer */
extern T0* T614f15(GE_context* ac, T0* C);
/* PATH.unit_size */
extern T6 T614f14(GE_context* ac, T0* C);
/* RAW_FILE.reset_path */
extern void T615f17(GE_context* ac, T0* C, T0* a1);
/* FILE_INFO.is_writable */
extern T1 T133f21(GE_context* ac, T0* C);
/* DIRECTORY.recursive_delete_with_action */
extern void T616f24(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* ARRAYED_LIST [READABLE_STRING_GENERAL].extend */
extern void T669f8(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [READABLE_STRING_GENERAL].extend */
extern void T676f5(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [READABLE_STRING_GENERAL].aliased_resized_area */
extern T0* T676f3(GE_context* ac, T0* C, T6 a1);
/* ARRAYED_LIST [READABLE_STRING_GENERAL].additional_space */
extern T6 T669f4(GE_context* ac, T0* C);
/* ARRAYED_LIST [READABLE_STRING_GENERAL].capacity */
extern T6 T669f5(GE_context* ac, T0* C);
/* ARRAYED_LIST [READABLE_STRING_GENERAL].count */
extern T6 T669f3(GE_context* ac, T0* C);
/* ARRAYED_LIST [READABLE_STRING_GENERAL].make */
extern T0* T669c7(GE_context* ac, T6 a1);
/* SPECIAL [READABLE_STRING_GENERAL].make_empty */
extern T0* T676c4(GE_context* ac, T6 a1);
/* DIRECTORY.delete */
extern void T616f29(GE_context* ac, T0* C);
/* DIRECTORY.eif_dir_delete */
extern void T616f32(GE_context* ac, T0* C, T14 a1);
/* DIRECTORY.delete_content_with_action */
extern void T616f28(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* DIRECTORY.path */
extern T0* T616f15(GE_context* ac, T0* C);
/* PATH.make_from_pointer */
extern T0* T614c17(GE_context* ac, T14 a1);
/* PATH.reset_internal_data */
extern void T614f21(GE_context* ac, T0* C);
/* PATH.normalize */
extern void T614f20(GE_context* ac, T0* C);
/* PATH.directory_separator */
extern T2 T614f5(GE_context* ac, T0* C);
/* PATH.root_end_position */
extern T6 T614f4(GE_context* ac, T0* C);
/* PATH.next_directory_separator */
extern T6 T614f10(GE_context* ac, T0* C, T6 a1);
/* CHARACTER_8.as_lower */
extern T2 T2f24(GE_context* ac, T2* C);
/* PATH.is_character */
extern T1 T614f8(GE_context* ac, T0* C, T0* a1, T6 a2, T2 a3);
/* PATH.pointer_length_in_bytes */
extern T6 T614f13(GE_context* ac, T0* C, T14 a1);
/* PATH.c_pointer_length_in_bytes */
extern T11 T614f16(GE_context* ac, T0* C, T14 a1);
/* DIRECTORY.make_with_path */
extern void T616f23(GE_context* ac, T0* C, T0* a1);
/* DIRECTORY.make_with_path */
extern T0* T616c23(GE_context* ac, T0* a1);
/* FILE_INFO.is_directory */
extern T1 T133f20(GE_context* ac, T0* C);
/* FILE_INFO.is_symlink */
extern T1 T133f19(GE_context* ac, T0* C);
/* FILE_INFO.update */
extern void T133f26(GE_context* ac, T0* C, T0* a1);
/* PATH.name */
extern T0* T614f6(GE_context* ac, T0* C);
/* UTF_CONVERTER.utf_8_string_8_to_escaped_string_32 */
extern T0* T125f10(GE_context* ac, T125* C, T0* a1);
/* UTF_CONVERTER.utf_8_string_8_into_escaped_string_32 */
extern void T125f22(GE_context* ac, T125* C, T0* a1, T0* a2);
/* UTF_CONVERTER.utf_16le_string_8_to_escaped_string_32 */
extern T0* T125f9(GE_context* ac, T125* C, T0* a1);
/* UTF_CONVERTER.utf_16le_string_8_into_escaped_string_32 */
extern void T125f21(GE_context* ac, T125* C, T0* a1, T0* a2);
/* PATH.extended */
extern T0* T614f12(GE_context* ac, T0* C, T0* a1);
/* PATH.make_from_storage */
extern T0* T614c19(GE_context* ac, T0* a1);
/* PATH.internal_append_into */
extern void T614f18(GE_context* ac, T0* C, T0* a1, T0* a2, T2 a3);
/* UTF_CONVERTER.escaped_utf_32_string_into_utf_8_string_8 */
extern void T125f20(GE_context* ac, T125* C, T0* a1, T0* a2);
/* STRING_8.extend */
extern void T17f63(GE_context* ac, T0* C, T2 a1);
/* STRING_8.grow */
extern void T17f62(GE_context* ac, T0* C, T6 a1);
/* UTF_CONVERTER.escaped_utf_32_string_into_utf_16le_string_8 */
extern void T125f19(GE_context* ac, T125* C, T0* a1, T0* a2);
/* KL_DIRECTORY.path */
extern T0* T410f39(GE_context* ac, T0* C);
/* FILE_INFO.set_is_following_symlinks */
extern void T133f25(GE_context* ac, T0* C, T1 a1);
/* ARRAYED_LIST [READABLE_STRING_32].make */
extern T0* T617c7(GE_context* ac, T6 a1);
/* SPECIAL [READABLE_STRING_32].make_empty */
extern T0* T671c4(GE_context* ac, T6 a1);
/* KL_UNIX_FILE_SYSTEM.recursive_delete_directory */
extern void T93f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.unix_file_system */
extern T0* T458f17(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.file_system */
extern T0* T458f16(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.windows_file_system */
extern T0* T458f20(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.operating_system */
extern T0* T458f19(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.is_directory_executable */
extern T1 T458f13(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.exit_application */
extern void T364f41(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_DELETE_TASK.exceptions */
extern T0* T364f27(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.log_messages */
extern void T364f42(GE_context* ac, T0* C, T0* a1);
/* GEANT_DELETE_TASK.dir_attribute_name */
extern T0* T364f26(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.file_system */
extern T0* T364f25(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.unix_file_system */
extern T0* T364f30(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.windows_file_system */
extern T0* T364f29(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.operating_system */
extern T0* T364f28(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.execute */
extern void T362f31(GE_context* ac, T0* C);
/* GEANT_MKDIR_COMMAND.execute */
extern void T455f16(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.exit_application */
extern void T362f32(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_MKDIR_TASK.exceptions */
extern T0* T362f17(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.std */
extern T0* T362f16(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.log_messages */
extern void T362f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_MKDIR_TASK.project_variables_resolver */
extern T0* T362f10(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.dir_attribute_name */
extern T0* T362f15(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.file_system */
extern T0* T362f14(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.unix_file_system */
extern T0* T362f20(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.windows_file_system */
extern T0* T362f19(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.operating_system */
extern T0* T362f18(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.execute */
extern void T360f31(GE_context* ac, T0* C);
/* GEANT_ECHO_COMMAND.execute */
extern void T453f16(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.open_append */
extern void T527f27(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_append */
extern void T527f33(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.open_append */
extern void T527f33p1(GE_context* ac, T0* C);
/* GEANT_BOOLEAN_PROPERTY.non_empty_value_or_else */
extern T1 T431f6(GE_context* ac, T0* C, T1 a1);
/* GEANT_BOOLEAN_PROPERTY.value */
extern T1 T431f5(GE_context* ac, T0* C);
/* GEANT_BOOLEAN_PROPERTY.boolean_value */
extern T1 T431f8(GE_context* ac, T0* C, T0* a1);
/* GEANT_BOOLEAN_PROPERTY.false_attribute_value */
extern unsigned char ge19os9995;
extern T0* ge19ov9995;
extern T0* T431f11(GE_context* ac, T0* C);
/* GEANT_BOOLEAN_PROPERTY.true_attribute_value */
extern unsigned char ge19os9994;
extern T0* ge19ov9994;
extern T0* T431f10(GE_context* ac, T0* C);
/* GEANT_BOOLEAN_PROPERTY.string_ */
extern T0* T431f9(GE_context* ac, T0* C);
/* GEANT_BOOLEAN_PROPERTY.string_value */
extern T0* T431f4(GE_context* ac, T0* C);
/* GEANT_BOOLEAN_PROPERTY.is_defined */
extern T1 T431f7(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.exit_application */
extern void T360f32(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_ECHO_TASK.exceptions */
extern T0* T360f17(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.std */
extern T0* T360f16(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.log_messages */
extern void T360f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_ECHO_TASK.project_variables_resolver */
extern T0* T360f10(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.dir_attribute_name */
extern T0* T360f15(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.file_system */
extern T0* T360f14(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.unix_file_system */
extern T0* T360f20(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.windows_file_system */
extern T0* T360f19(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.operating_system */
extern T0* T360f18(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.execute */
extern void T358f47(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.execute */
extern void T451f34(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.execute_with_target */
extern void T451f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.is_fileset_executable */
extern T1 T451f21(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.execute_forked_with_target */
extern void T451f37(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.string_ */
extern T0* T451f19(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.execute_with_filename */
extern void T451f36(GE_context* ac, T0* C, T0* a1);
/* GEANT_TARGET.is_exported_to_project */
extern T1 T33f62(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT.has_parent_with_name */
extern T1 T29f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT.string_ */
extern T0* T29f29(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].item */
extern T0* T251f11(GE_context* ac, T0* C, T6 a1);
/* GEANT_GEANT_COMMAND.exit_application */
extern void T451f39(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_GEANT_COMMAND.exceptions */
extern T0* T451f23(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.std */
extern T0* T451f22(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.log_messages */
extern void T451f41(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.execute_forked_with_filename_and_target */
extern void T451f35(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_COMMAND.execute_shell */
extern void T451f40(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.options_and_arguments_for_cmdline */
extern T0* T451f20(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.put */
extern void T32f87(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_COMMAND.project_variables_resolver */
extern T0* T451f18(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.unix_file_system */
extern T0* T451f17(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.file_system */
extern T0* T451f16(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.windows_file_system */
extern T0* T451f25(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.operating_system */
extern T0* T451f24(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.is_filename_executable */
extern T1 T451f14(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.dir_attribute_name */
extern T0* T358f32(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.file_system */
extern T0* T358f31(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.unix_file_system */
extern T0* T358f35(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.windows_file_system */
extern T0* T358f34(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.operating_system */
extern T0* T358f33(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.execute */
extern void T356f48(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.execute */
extern void T449f34(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.execute_shell */
extern void T449f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.unix_file_system */
extern T0* T449f19(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.file_system */
extern T0* T449f18(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.windows_file_system */
extern T0* T449f21(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.operating_system */
extern T0* T449f20(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.string_ */
extern T0* T449f17(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.exit_application */
extern void T356f49(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_GETEST_TASK.exceptions */
extern T0* T356f35(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.log_messages */
extern void T356f50(GE_context* ac, T0* C, T0* a1);
/* GEANT_GETEST_TASK.dir_attribute_name */
extern T0* T356f34(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.file_system */
extern T0* T356f33(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.unix_file_system */
extern T0* T356f38(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.windows_file_system */
extern T0* T356f37(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.operating_system */
extern T0* T356f36(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.execute */
extern void T354f43(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.execute */
extern void T447f29(GE_context* ac, T0* C);
/* GEANT_FILESET.has_map */
extern T1 T432f30(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.execute_shell */
extern void T447f31(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.is_file_outofdate */
extern T1 T447f18(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_COMMAND.unix_file_system */
extern T0* T447f17(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.file_system */
extern T0* T447f16(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.windows_file_system */
extern T0* T447f20(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.operating_system */
extern T0* T447f19(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.is_file_executable */
extern T1 T447f13(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.create_directory */
extern void T447f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.string_ */
extern T0* T447f15(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.exit_application */
extern void T354f44(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_GEPP_TASK.exceptions */
extern T0* T354f30(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.log_messages */
extern void T354f45(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEPP_TASK.dir_attribute_name */
extern T0* T354f29(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.file_system */
extern T0* T354f28(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.unix_file_system */
extern T0* T354f33(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.windows_file_system */
extern T0* T354f32(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.operating_system */
extern T0* T354f31(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.execute */
extern void T352f44(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.execute */
extern void T445f29(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.execute_shell */
extern void T445f30(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.unix_file_system */
extern T0* T445f16(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.file_system */
extern T0* T445f15(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.windows_file_system */
extern T0* T445f18(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.operating_system */
extern T0* T445f17(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.string_ */
extern T0* T445f14(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.exit_application */
extern void T352f45(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_GEYACC_TASK.exceptions */
extern T0* T352f31(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.log_messages */
extern void T352f46(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEYACC_TASK.dir_attribute_name */
extern T0* T352f30(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.file_system */
extern T0* T352f29(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.unix_file_system */
extern T0* T352f34(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.windows_file_system */
extern T0* T352f33(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.operating_system */
extern T0* T352f32(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.execute */
extern void T350f48(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.execute */
extern void T443f37(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.execute_shell */
extern void T443f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.unix_file_system */
extern T0* T443f20(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.file_system */
extern T0* T443f19(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.windows_file_system */
extern T0* T443f22(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.operating_system */
extern T0* T443f21(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.string_ */
extern T0* T443f18(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.exit_application */
extern void T350f49(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_GELEX_TASK.exceptions */
extern T0* T350f35(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.log_messages */
extern void T350f50(GE_context* ac, T0* C, T0* a1);
/* GEANT_GELEX_TASK.dir_attribute_name */
extern T0* T350f34(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.file_system */
extern T0* T350f33(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.unix_file_system */
extern T0* T350f38(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.windows_file_system */
extern T0* T350f37(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.operating_system */
extern T0* T350f36(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.execute */
extern void T348f44(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.execute */
extern void T441f32(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.execute_shell */
extern void T441f33(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.unix_file_system */
extern T0* T441f20(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.file_system */
extern T0* T441f19(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.windows_file_system */
extern T0* T441f22(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.operating_system */
extern T0* T441f21(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.is_library_executable */
extern T1 T441f17(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.is_system_executable */
extern T1 T441f16(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.is_validate_executable */
extern T1 T441f15(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.string_ */
extern T0* T441f18(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.exit_application */
extern void T348f45(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_GEXACE_TASK.exceptions */
extern T0* T348f31(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.log_messages */
extern void T348f46(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEXACE_TASK.dir_attribute_name */
extern T0* T348f30(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.file_system */
extern T0* T348f29(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.unix_file_system */
extern T0* T348f34(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.windows_file_system */
extern T0* T348f33(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.operating_system */
extern T0* T348f32(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.execute */
extern void T346f32(GE_context* ac, T0* C);
/* GEANT_UNSET_COMMAND.execute */
extern void T438f10(GE_context* ac, T0* C);
/* GEANT_PROJECT.unset_variable */
extern void T29f52(GE_context* ac, T0* C, T0* a1);
/* GEANT_UNSET_TASK.exit_application */
extern void T346f33(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_UNSET_TASK.exceptions */
extern T0* T346f19(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.std */
extern T0* T346f18(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.log_messages */
extern void T346f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_UNSET_TASK.dir_attribute_name */
extern T0* T346f17(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.file_system */
extern T0* T346f16(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.unix_file_system */
extern T0* T346f22(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.windows_file_system */
extern T0* T346f21(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.operating_system */
extern T0* T346f20(GE_context* ac, T0* C);
/* GEANT_SET_TASK.execute */
extern void T344f33(GE_context* ac, T0* C);
/* GEANT_SET_COMMAND.execute */
extern void T436f17(GE_context* ac, T0* C);
/* GEANT_SET_COMMAND.default_builtin_variables */
extern T0* T436f8(GE_context* ac, T0* C);
/* GEANT_SET_COMMAND.file_system */
extern T0* T436f10(GE_context* ac, T0* C);
/* GEANT_SET_COMMAND.unix_file_system */
extern T0* T436f12(GE_context* ac, T0* C);
/* GEANT_SET_COMMAND.windows_file_system */
extern T0* T436f11(GE_context* ac, T0* C);
/* GEANT_SET_COMMAND.operating_system */
extern T0* T436f9(GE_context* ac, T0* C);
/* GEANT_SET_TASK.exit_application */
extern void T344f34(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_SET_TASK.exceptions */
extern T0* T344f20(GE_context* ac, T0* C);
/* GEANT_SET_TASK.std */
extern T0* T344f19(GE_context* ac, T0* C);
/* GEANT_SET_TASK.log_messages */
extern void T344f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_SET_TASK.dir_attribute_name */
extern T0* T344f18(GE_context* ac, T0* C);
/* GEANT_SET_TASK.file_system */
extern T0* T344f17(GE_context* ac, T0* C);
/* GEANT_SET_TASK.unix_file_system */
extern T0* T344f23(GE_context* ac, T0* C);
/* GEANT_SET_TASK.windows_file_system */
extern T0* T344f22(GE_context* ac, T0* C);
/* GEANT_SET_TASK.operating_system */
extern T0* T344f21(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.execute */
extern void T342f33(GE_context* ac, T0* C);
/* GEANT_LCC_COMMAND.execute */
extern void T434f17(GE_context* ac, T0* C);
/* GEANT_LCC_COMMAND.execute_shell */
extern void T434f18(GE_context* ac, T0* C, T0* a1);
/* GEANT_LCC_COMMAND.string_ */
extern T0* T434f10(GE_context* ac, T0* C);
/* GEANT_LCC_COMMAND.unix_file_system */
extern T0* T434f9(GE_context* ac, T0* C);
/* GEANT_LCC_COMMAND.file_system */
extern T0* T434f8(GE_context* ac, T0* C);
/* GEANT_LCC_COMMAND.windows_file_system */
extern T0* T434f12(GE_context* ac, T0* C);
/* GEANT_LCC_COMMAND.operating_system */
extern T0* T434f11(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.exit_application */
extern void T342f34(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_LCC_TASK.exceptions */
extern T0* T342f20(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.std */
extern T0* T342f19(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.log_messages */
extern void T342f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_LCC_TASK.dir_attribute_name */
extern T0* T342f18(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.file_system */
extern T0* T342f17(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.unix_file_system */
extern T0* T342f23(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.windows_file_system */
extern T0* T342f22(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.operating_system */
extern T0* T342f21(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.execute */
extern void T340f32(GE_context* ac, T0* C);
/* GEANT_EXEC_COMMAND.execute */
extern void T427f16(GE_context* ac, T0* C);
/* GEANT_EXEC_COMMAND.project_variables_resolver */
extern T0* T427f11(GE_context* ac, T0* C);
/* GEANT_EXEC_COMMAND.execute_shell */
extern void T427f18(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXEC_TASK.exit_application */
extern void T340f33(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_EXEC_TASK.exceptions */
extern T0* T340f18(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.std */
extern T0* T340f17(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.log_messages */
extern void T340f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXEC_TASK.project_variables_resolver */
extern T0* T340f11(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.dir_attribute_name */
extern T0* T340f16(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.file_system */
extern T0* T340f15(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.unix_file_system */
extern T0* T340f21(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.windows_file_system */
extern T0* T340f20(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.operating_system */
extern T0* T340f19(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.execute */
extern void T338f45(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.execute */
extern void T424f32(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.execute_clean */
extern void T424f34(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.delete_directory */
extern void T92f42(GE_context* ac, T0* C, T0* a1);
/* KL_DIRECTORY.delete */
extern void T410f61(GE_context* ac, T0* C);
/* KL_DIRECTORY.is_empty */
extern T1 T410f30(GE_context* ac, T0* C);
/* KL_DIRECTORY.tmp_directory */
extern unsigned char ge154os9747;
extern T0* ge154ov9747;
extern T0* T410f36(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.delete_directory */
extern void T93f39(GE_context* ac, T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_empty */
extern T1 T92f30(GE_context* ac, T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.is_directory_empty */
extern T1 T93f28(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_COMMAND.eifgen_directory */
extern T0* T424f19(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.file_system */
extern T0* T424f16(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.unix_file_system */
extern T0* T424f17(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.windows_file_system */
extern T0* T424f21(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.operating_system */
extern T0* T424f20(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.execute_compile */
extern void T424f33(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.cd */
extern void T92f40(GE_context* ac, T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.cd */
extern void T93f37(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_COMMAND.execute_shell */
extern void T424f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_COMMAND.string_ */
extern T0* T424f18(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.is_compilable */
extern T1 T424f14(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.exit_application */
extern void T338f46(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_ISE_TASK.exceptions */
extern T0* T338f32(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.log_messages */
extern void T338f47(GE_context* ac, T0* C, T0* a1);
/* GEANT_ISE_TASK.dir_attribute_name */
extern T0* T338f31(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.file_system */
extern T0* T338f30(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.unix_file_system */
extern T0* T338f35(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.windows_file_system */
extern T0* T338f34(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.operating_system */
extern T0* T338f33(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.execute */
extern void T332f46(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.execute */
extern void T420f37(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.execute_shell */
extern void T420f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_COMMAND.new_ace_cmdline */
extern T0* T420f19(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.string_ */
extern T0* T420f24(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.unix_file_system */
extern T0* T420f22(GE_context* ac, T0* C);
/* KL_INTEGER_ROUTINES.append_decimal_integer */
extern void T267f5(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_GEC_COMMAND.integer_ */
extern T0* T420f23(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.is_ace_configuration */
extern T1 T420f16(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.file_system */
extern T0* T420f18(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.windows_file_system */
extern T0* T420f21(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.operating_system */
extern T0* T420f20(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.is_cleanable */
extern T1 T420f17(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.exit_application */
extern void T332f47(GE_context* ac, T0* C, T6 a1, T0* a2);
/* GEANT_GEC_TASK.exceptions */
extern T0* T332f33(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.log_messages */
extern void T332f48(GE_context* ac, T0* C, T0* a1);
/* GEANT_GEC_TASK.dir_attribute_name */
extern T0* T332f32(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.file_system */
extern T0* T332f31(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.unix_file_system */
extern T0* T332f36(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.windows_file_system */
extern T0* T332f35(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.operating_system */
extern T0* T332f34(GE_context* ac, T0* C);
/* XM_CHARACTER_DATA.node_set_parent */
extern void T327f4(GE_context* ac, T0* C, T0* a1);
/* XM_ATTRIBUTE.node_set_parent */
extern void T257f6(GE_context* ac, T0* C, T0* a1);
/* XM_PROCESSING_INSTRUCTION.node_set_parent */
extern void T326f6(GE_context* ac, T0* C, T0* a1);
/* XM_COMMENT.node_set_parent */
extern void T325f5(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.node_set_parent */
extern void T144f24(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_stream */
extern void T226f295(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T226f302(GE_context* ac, T0* C, T0* a1);
/* YY_FILE_BUFFER.name */
extern T0* T280f14(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.name */
extern T0* T266f26(GE_context* ac, T0* C);
/* KL_STRING_INPUT_STREAM.name */
extern unsigned char ge172os3891;
extern T0* ge172ov3891;
extern T0* T412f6(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T226f302p1(GE_context* ac, T0* C, T0* a1);
/* YY_FILE_BUFFER.set_position */
extern void T280f19(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.set_index */
extern void T280f18(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.new_file_buffer */
extern T0* T226f73(GE_context* ac, T0* C, T0* a1);
/* YY_FILE_BUFFER.make */
extern T0* T280c17(GE_context* ac, T0* a1);
/* YY_FILE_BUFFER.make_with_size */
extern void T280f21(GE_context* ac, T0* C, T0* a1, T6 a2);
/* YY_FILE_BUFFER.set_file */
extern void T280f23(GE_context* ac, T0* C, T0* a1);
/* YY_FILE_BUFFER.set_file_with_size */
extern void T280f25(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_CHARACTER_BUFFER.resize */
extern void T413f11(GE_context* ac, T0* C, T6 a1);
/* YY_FILE_BUFFER.flush */
extern void T280f26(GE_context* ac, T0* C);
/* YY_FILE_BUFFER.new_default_buffer */
extern T0* T280f16(GE_context* ac, T0* C, T6 a1);
/* YY_FILE_BUFFER.default_capacity */
extern unsigned char ge2592os8572;
extern T6 ge2592ov8572;
extern T6 T280f13(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_input_stream */
extern void T224f202(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T224f211(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T224f211p1(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.new_file_buffer */
extern T0* T224f55(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_stream */
extern void T223f291(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T223f298(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T223f298p1(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.new_file_buffer */
extern T0* T223f71(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_stream */
extern void T183f200(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T183f208(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T183f208p1(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.new_file_buffer */
extern T0* T183f46(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T226f296(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T226f296p1(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T226f296p0(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_action */
extern void T226f306(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.from_hexadecimal */
extern void T278f10(GE_context* ac, T0* C, T0* a1);
/* KL_STRING_ROUTINES.hexadecimal_to_integer */
extern T6 T115f13(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_CHARACTER_ENTITY.string_ */
extern T0* T278f7(GE_context* ac, T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.to_utf8 */
extern T0* T278f3(GE_context* ac, T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.utf8 */
extern T0* T278f6(GE_context* ac, T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_ascii */
extern T1 T278f2(GE_context* ac, T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_valid */
extern T1 T278f5(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.valid_non_surrogate_code */
extern T1 T389f3(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.unicode */
extern T0* T278f4(GE_context* ac, T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.from_decimal */
extern void T278f9(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.has_normalized_newline */
extern T1 T226f203(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_substring */
extern T0* T226f183(GE_context* ac, T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_PE_ENTITY_DEF.text_count */
extern T6 T226f182(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.system_literal_text */
extern T0* T226f164(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_item */
extern T2 T226f209(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern T0* T226f123(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern unsigned char ge1523os7231;
extern T0* ge1523ov7231;
extern T0* T226f123p1(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_line_column */
extern void T226f310(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text */
extern T0* T226f107(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.pop_start_condition */
extern void T226f309(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition */
extern void T226f307(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_last_token */
extern void T226f308(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_eof_action */
extern void T226f305(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.wrap */
extern T1 T226f101(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_refill_input_buffer */
extern void T226f304(GE_context* ac, T0* C);
/* YY_FILE_BUFFER.fill */
extern void T280f20(GE_context* ac, T0* C);
/* KL_CHARACTER_BUFFER.fill_from_stream */
extern T6 T413f5(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T6 T266f27(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T6 T266f27p1(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STRING_INPUT_STREAM.read_to_string */
extern T6 T412f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.compact_left */
extern void T280f22(GE_context* ac, T0* C);
/* KL_CHARACTER_BUFFER.move_left */
extern void T413f10(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.resize */
extern void T280f24(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_null_trans_state */
extern T6 T226f100(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_previous_state */
extern T6 T226f99(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.terminate */
extern void T226f303(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T224f203(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T224f203p1(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_action */
extern void T224f217(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.has_normalized_newline */
extern T1 T224f183(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_substring */
extern T0* T224f163(GE_context* ac, T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_SCANNER_DTD.text_count */
extern T6 T224f162(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.system_literal_text */
extern T0* T224f144(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_item */
extern T2 T224f197(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.normalized_newline */
extern T0* T224f106(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_line_column */
extern void T224f223(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.text */
extern T0* T224f80(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.pop_start_condition */
extern void T224f222(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition */
extern void T224f218(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_eof_action */
extern void T224f216(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.wrap */
extern T1 T224f68(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_refill_input_buffer */
extern void T224f215(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_null_trans_state */
extern T6 T224f67(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_previous_state */
extern T6 T224f66(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.fatal_error */
extern void T224f214(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.terminate */
extern void T224f213(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_last_token */
extern void T224f212(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T223f292(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T223f292p1(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_action */
extern void T223f301(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.has_normalized_newline */
extern T1 T223f200(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_substring */
extern T0* T223f180(GE_context* ac, T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_ENTITY_DEF.text_count */
extern T6 T223f179(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.system_literal_text */
extern T0* T223f161(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_item */
extern T2 T223f207(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T223f120(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T223f120p1(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_line_column */
extern void T223f306(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.text */
extern T0* T223f104(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.pop_start_condition */
extern void T223f305(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition */
extern void T223f302(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.set_last_token */
extern void T223f304(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_eof_action */
extern void T223f300(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.terminate */
extern void T223f303(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.wrap */
extern T1 T223f98(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_refill_input_buffer */
extern void T223f299(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_null_trans_state */
extern T6 T223f97(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_previous_state */
extern T6 T223f96(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.read_token */
extern void T183f201(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_execute_action */
extern void T183f212(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.has_normalized_newline */
extern T1 T183f181(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.text_substring */
extern T0* T183f161(GE_context* ac, T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_SCANNER.text_count */
extern T6 T183f160(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.system_literal_text */
extern T0* T183f142(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.text_item */
extern T2 T183f195(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.normalized_newline */
extern T0* T183f101(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_set_line_column */
extern void T183f220(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.text */
extern T0* T183f75(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.pop_start_condition */
extern void T183f219(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.set_start_condition */
extern void T183f221(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.push_start_condition */
extern void T183f213(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.set_last_token */
extern void T183f218(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.yy_execute_eof_action */
extern void T183f211(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.terminate */
extern void T183f217(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.wrap */
extern T1 T183f63(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_refill_input_buffer */
extern void T183f210(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_null_trans_state */
extern T6 T183f62(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.yy_previous_state */
extern T6 T183f61(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.fatal_error */
extern void T183f209(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T226f298(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition_dtd_ignore */
extern void T224f205(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T223f294(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T183f203(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_encoding */
extern void T226f299(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.set_encoding */
extern void T266f30(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_encoding */
extern void T224f206(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_encoding */
extern void T223f295(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_encoding */
extern void T183f204(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_from_resolver */
extern void T226f300(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_from_resolver */
extern void T224f207(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_from_resolver */
extern void T223f296(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T183f205(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.close_input */
extern void T226f297(GE_context* ac, T0* C);
/* KL_STRING_INPUT_STREAM.close */
extern void T412f11(GE_context* ac, T0* C);
/* KL_STRING_INPUT_STREAM.is_closable */
extern T1 T412f7(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.is_closable */
extern T1 T97f30(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.close_input */
extern void T224f204(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.close_input */
extern void T223f293(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.close_input */
extern void T183f202(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.on_start */
extern void T227f27(GE_context* ac, T0* C);
/* XM_CALLBACKS_NULL.on_start */
extern void T188f2(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T145f9(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T145f9p1(GE_context* ac, T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start */
extern void T142f14(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.on_finish */
extern void T227f28(GE_context* ac, T0* C);
/* XM_CALLBACKS_NULL.on_finish */
extern void T188f3(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T145f10(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T145f10p1(GE_context* ac, T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_finish */
extern void T142f15(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.on_comment */
extern void T227f29(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_comment */
extern void T188f4(GE_context* ac, T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T145f11(GE_context* ac, T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T145f11p1(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_comment */
extern void T142f16(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.handle_position */
extern void T142f24(GE_context* ac, T0* C, T0* a1);
/* XM_POSITION_TABLE.put */
extern void T146f5(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].put_last */
extern void T241f9(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].put_right */
extern void T330f4(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T330c3(GE_context* ac, T0* a1);
/* DS_PAIR [XM_POSITION, XM_NODE].make */
extern T0* T272c3(GE_context* ac, T0* a1, T0* a2);
/* XM_COMMENT.make_last_in_document */
extern T0* T325c4(GE_context* ac, T0* a1, T0* a2);
/* XM_COMMENT.make_last */
extern T0* T325c3(GE_context* ac, T0* a1, T0* a2);
/* XM_ELEMENT.force_last */
extern void T144f28(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].force_last */
extern void T239f13(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].force_last */
extern void T239f13p1(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_ELEMENT_NODE].make */
extern T0* T329c3(GE_context* ac, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].before_addition */
extern void T239f18(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.before_addition */
extern void T144f29(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.last */
extern T0* T144f18(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].last */
extern T0* T239f8(GE_context* ac, T0* C);
/* XM_ELEMENT.is_empty */
extern T1 T144f17(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].is_empty */
extern T1 T239f7(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.on_processing_instruction */
extern void T227f30(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_NULL.on_processing_instruction */
extern void T188f5(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T145f12(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T145f12p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_TO_TREE_FILTER.on_processing_instruction */
extern void T142f17(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_PROCESSING_INSTRUCTION.make_last_in_document */
extern T0* T326c5(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* XM_PROCESSING_INSTRUCTION.make_last */
extern T0* T326c4(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER.on_content */
extern void T227f31(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_content */
extern void T188f6(GE_context* ac, T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T145f13(GE_context* ac, T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T145f13p1(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_content */
extern void T142f18(GE_context* ac, T0* C, T0* a1);
/* XM_CHARACTER_DATA.make_last */
extern T0* T327c3(GE_context* ac, T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_start_tag */
extern void T227f34(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.push */
extern void T301f12(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].force_last */
extern void T407f10(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].put_right */
extern void T501f5(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].attach_left */
extern void T501f6(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T501c4(GE_context* ac, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.new_string_string_table */
extern T0* T301f8(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_equality_tester */
extern void T120f42(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.string_equality_tester */
extern T0* T301f9(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map_default */
extern T0* T120c40(GE_context* ac);
/* DS_HASH_TABLE [STRING_8, STRING_8].default_capacity */
extern T6 T120f37(GE_context* ac, T0* C);
/* XM_CALLBACKS_NULL.on_start_tag */
extern void T188f9(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T145f14(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T145f14p1(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag */
extern void T142f19(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_root */
extern T0* T144c26(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* XM_DOCUMENT.set_root_element */
extern void T143f15(GE_context* ac, T0* C, T0* a1);
/* XM_DOCUMENT.remove_previous_root_element */
extern void T143f16(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].go_after */
extern void T270f14(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_go_after */
extern void T232f28(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.make_last */
extern T0* T144c25(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.new_namespace */
extern T0* T142f8(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_NAMESPACE].force_last */
extern void T230f39(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_put */
extern void T230f44(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].clashes_put */
extern void T230f43(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].slots_item */
extern T6 T230f22(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].hash_position */
extern T6 T230f20(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE.hash_code */
extern T6 T231f6(GE_context* ac, T0* C);
/* DS_HASH_SET [XM_NAMESPACE].resize */
extern void T230f42(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_resize */
extern void T230f48(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].special_integer_ */
extern T0* T230f29(GE_context* ac, T0* C);
/* DS_HASH_SET [XM_NAMESPACE].key_storage_resize */
extern void T230f47(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_resize */
extern void T230f46(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].aliased_resized_area */
extern T0* T306f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_NAMESPACE].aliased_resized_area */
extern T0* T307f4(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].key_storage_item */
extern T0* T230f28(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_item */
extern T0* T230f18(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_item */
extern T6 T230f26(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_resize */
extern void T230f45(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_capacity */
extern T6 T230f19(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_put */
extern void T230f41(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].force */
extern void T306f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_NAMESPACE].fill_with */
extern void T307f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_NAMESPACE].extend */
extern void T307f8(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].search_position */
extern void T230f40(GE_context* ac, T0* C, T0* a1);
/* detachable KL_EQUALITY_TESTER [XM_NAMESPACE].test */
extern T1 T304f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_NAMESPACE].key_equality_tester */
extern T0* T230f25(GE_context* ac, T0* C);
/* XM_NAMESPACE.same_prefix */
extern T1 T231f5(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].item */
extern T0* T230f17(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].has */
extern T1 T230f30(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T227f32(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T227f32p1(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve_default */
extern T0* T301f3(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_pseudo_prefix */
extern unsigned char ge1447os8619;
extern T0* ge1447ov8619;
extern T0* T301f7(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.string_ */
extern T0* T227f14(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.on_delayed_attributes */
extern void T227f39(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_remove */
extern void T227f43(GE_context* ac, T0* C);
/* DS_LINKED_QUEUE [STRING_8].remove */
extern void T303f8(GE_context* ac, T0* C);
/* DS_LINKED_QUEUE [STRING_8].wipe_out */
extern void T303f9(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.unprefixed_attribute_namespace */
extern T0* T227f19(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.default_namespace */
extern unsigned char ge1414os7685;
extern T0* ge1414ov7685;
extern T0* T227f24(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns_namespace */
extern unsigned char ge1414os7693;
extern T0* ge1414ov7693;
extern T0* T227f18(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.is_xmlns */
extern T1 T227f9(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.same_string */
extern T1 T227f22(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.string_equality_tester */
extern T0* T227f25(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns */
extern unsigned char ge1414os7686;
extern T0* ge1414ov7686;
extern T0* T227f21(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.xml_prefix_namespace */
extern unsigned char ge1414os7692;
extern T0* ge1414ov7692;
extern T0* T227f17(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.is_xml */
extern T1 T227f16(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.xml_prefix */
extern unsigned char ge1414os7687;
extern T0* ge1414ov7687;
extern T0* T227f23(GE_context* ac, T0* C);
/* DS_LINKED_QUEUE [STRING_8].item */
extern T0* T303f5(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_is_empty */
extern T1 T227f12(GE_context* ac, T0* C);
/* DS_LINKED_QUEUE [STRING_8].is_empty */
extern T1 T303f4(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve */
extern T0* T301f2(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].back */
extern void T408f11(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_back */
extern void T407f18(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].add_traversing_cursor */
extern void T407f19(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_next_cursor */
extern void T408f13(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_traversing_cursor */
extern void T407f20(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set */
extern void T408f14(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].go_before */
extern void T408f10(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_go_before */
extern void T407f17(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_before */
extern void T408f15(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_off */
extern T1 T407f7(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].off */
extern T1 T408f7(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].item */
extern T0* T120f22(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_item */
extern T0* T120f25(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].has */
extern T1 T120f21(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].item */
extern T0* T408f6(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].finish */
extern void T408f9(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_finish */
extern void T407f16(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_namespace */
extern unsigned char ge1447os8620;
extern T0* ge1447ov8620;
extern T0* T301f6(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.has */
extern T1 T301f5(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.has_prefix */
extern T1 T227f10(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_start_tag_finish */
extern void T188f7(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T145f15(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T145f15p1(GE_context* ac, T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag_finish */
extern void T142f20(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T227f33(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.pop */
extern void T301f11(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_last */
extern void T407f9(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].set_last_cell */
extern void T407f14(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].forget_right */
extern void T501f7(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_last_cursors_after */
extern void T407f13(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_after */
extern void T408f12(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].wipe_out */
extern void T407f12(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_all_cursors_after */
extern void T407f15(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T227f33p1(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_NULL.on_end_tag */
extern void T188f8(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T145f16(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T145f16p1(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_end_tag */
extern void T142f21(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.parent_element */
extern T0* T144f15(GE_context* ac, T0* C);
extern T1 T144f15ot1(T0* a1, T0** a2);
/* XM_ELEMENT.is_root_node */
extern T1 T144f16(GE_context* ac, T0* C);
/* XM_DOCUMENT.is_root_node */
extern T1 T143f8(GE_context* ac, T0* C);
/* XM_DOCUMENT.parent */
extern T0* T143f9(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.on_error */
extern void T227f36(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_error */
extern void T188f11(GE_context* ac, T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T145f17(GE_context* ac, T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T145f17p1(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_error */
extern void T142f22(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_attribute */
extern void T227f35(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add */
extern void T301f14(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force_new */
extern void T120f54(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].last */
extern T0* T407f5(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.shallow_has */
extern T1 T301f4(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.attributes_force */
extern void T227f40(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* DS_LINKED_QUEUE [STRING_8].force */
extern void T303f7(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add_default */
extern void T301f13(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_attribute */
extern void T188f10(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T145f18(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T145f18p1(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_CALLBACKS_TO_TREE_FILTER.on_attribute */
extern void T142f23(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_ATTRIBUTE.make_last */
extern T0* T257c5(GE_context* ac, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER.on_xml_declaration */
extern void T227f44(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* XM_CALLBACKS_NULL.on_xml_declaration */
extern void T188f12(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* XM_STOP_ON_ERROR_FILTER.on_xml_declaration */
extern void T145f19(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_xml_declaration */
extern void T142f25(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* XM_NAMESPACE_RESOLVER.set_next */
extern void T227f41(GE_context* ac, T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.set_next */
extern void T145f8(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.set_next */
extern void T142f13(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_start */
extern void T120f55(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].add_traversing_cursor */
extern void T120f64(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].remove_traversing_cursor */
extern void T120f63(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_off */
extern T1 T120f35(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].off */
extern T1 T105f9(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].is_empty */
extern T1 T120f34(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_VARIABLES.cursor_start */
extern void T41f69(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.add_traversing_cursor */
extern void T41f73(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.remove_traversing_cursor */
extern void T41f72(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_off */
extern T1 T41f40(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.is_empty */
extern T1 T41f39(GE_context* ac, T0* C);
/* GEANT_VARIABLES.cursor_start */
extern void T36f71(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.add_traversing_cursor */
extern void T36f74(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.remove_traversing_cursor */
extern void T36f73(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_off */
extern T1 T36f40(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.is_empty */
extern T1 T36f39(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.cursor_start */
extern void T32f82(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.add_traversing_cursor */
extern void T32f85(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.remove_traversing_cursor */
extern void T32f84(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_off */
extern T1 T32f52(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.is_empty */
extern T1 T32f51(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_forth */
extern void T120f56(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_forth */
extern void T41f70(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_forth */
extern void T36f72(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_forth */
extern void T32f83(GE_context* ac, T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.reset */
extern void T112f40(GE_context* ac, T0* C);
/* AP_STRING_OPTION.reset */
extern void T44f29(GE_context* ac, T0* C);
/* AP_FLAG.reset */
extern void T42f22(GE_context* ac, T0* C);
/* AP_DISPLAY_HELP_FLAG.record_occurrence */
extern void T112f41(GE_context* ac, T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.display_help */
extern void T112f42(GE_context* ac, T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.exceptions */
extern T0* T112f15(GE_context* ac, T0* C);
/* AP_ERROR_HANDLER.report_info_message */
extern void T52f11(GE_context* ac, T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.full_help_text */
extern T0* T112f14(GE_context* ac, T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.option_help_text */
extern T0* T112f23(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_QUICK_SORTER [AP_OPTION].sort */
extern void T320f3(GE_context* ac, T0* C, T0* a1);
/* DS_QUICK_SORTER [AP_OPTION].sort_with_comparator */
extern void T320f4(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_QUICK_SORTER [AP_OPTION].subsort_with_comparator */
extern void T320f5(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* ARRAY [INTEGER_32].force */
extern void T263f13(GE_context* ac, T0* C, T6 a1, T6 a2);
/* ARRAY [INTEGER_32].capacity */
extern T6 T263f7(GE_context* ac, T0* C);
/* ARRAY [INTEGER_32].set_area */
extern void T263f15(GE_context* ac, T0* C, T0* a1);
/* ARRAY [INTEGER_32].make_empty_area */
extern void T263f14(GE_context* ac, T0* C, T6 a1);
/* ARRAY [INTEGER_32].additional_space */
extern T6 T263f6(GE_context* ac, T0* C);
/* ARRAY [INTEGER_32].empty_area */
extern T1 T263f5(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].swap */
extern void T113f28(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [AP_OPTION].replace */
extern void T113f27(GE_context* ac, T0* C, T0* a1, T6 a2);
/* AP_OPTION_COMPARATOR.less_than */
extern T1 T319f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.three_way_comparison */
extern T6 T115f14(GE_context* ac, T0* C, T0* a1, T0* a2);
/* AP_OPTION_COMPARATOR.string_ */
extern T0* T319f2(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].item */
extern T0* T113f16(GE_context* ac, T0* C, T6 a1);
/* ST_WORD_WRAPPER.wrapped_string */
extern T0* T322f5(GE_context* ac, T0* C, T0* a1);
/* ST_WORD_WRAPPER.canonify_whitespace */
extern void T322f12(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.put */
extern void T265f88(GE_context* ac, T0* C, T2 a1, T6 a2);
/* ST_WORD_WRAPPER.is_space */
extern T1 T322f8(GE_context* ac, T0* C, T2 a1);
/* ST_WORD_WRAPPER.string_ */
extern T0* T322f4(GE_context* ac, T0* C);
/* ST_WORD_WRAPPER.set_new_line_indentation */
extern void T322f10(GE_context* ac, T0* C, T6 a1);
/* AP_DISPLAY_HELP_FLAG.wrapper */
extern unsigned char ge104os5088;
extern T0* ge104ov5088;
extern T0* T112f18(GE_context* ac, T0* C);
/* ST_WORD_WRAPPER.set_maximum_text_width */
extern void T322f11(GE_context* ac, T0* C, T6 a1);
/* ST_WORD_WRAPPER.make */
extern T0* T322c9(GE_context* ac);
/* AP_DISPLAY_HELP_FLAG.full_usage_instruction */
extern T0* T112f16(GE_context* ac, T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.alternative_usage_instruction */
extern T0* T112f25(GE_context* ac, T0* C, T0* a1, T0* a2);
/* AP_DISPLAY_HELP_FLAG.arguments */
extern T0* T112f29(GE_context* ac, T0* C);
/* AP_DISPLAY_HELP_FLAG.file_system */
extern T0* T112f28(GE_context* ac, T0* C);
/* AP_DISPLAY_HELP_FLAG.unix_file_system */
extern T0* T112f34(GE_context* ac, T0* C);
/* AP_DISPLAY_HELP_FLAG.windows_file_system */
extern T0* T112f33(GE_context* ac, T0* C);
/* AP_DISPLAY_HELP_FLAG.operating_system */
extern T0* T112f32(GE_context* ac, T0* C);
/* AP_DISPLAY_HELP_FLAG.usage_instruction */
extern T0* T112f24(GE_context* ac, T0* C, T0* a1);
/* DS_QUICK_SORTER [AP_OPTION].make */
extern T0* T320c2(GE_context* ac, T0* a1);
/* AP_OPTION_COMPARATOR.default_create */
extern T0* T319c3(GE_context* ac);
/* AP_STRING_OPTION.record_occurrence */
extern void T44f31(GE_context* ac, T0* C, T0* a1);
/* AP_FLAG.record_occurrence */
extern void T42f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.force_last */
extern void T41f68(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.force_last */
extern void T36f70(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.force_last */
extern void T32f93(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.resize */
extern void T32f67(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.clashes_resize */
extern void T32f75(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.special_integer_ */
extern T0* T32f37(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.key_storage_resize */
extern void T32f74(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.item_storage_resize */
extern void T32f73(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.slots_resize */
extern void T32f72(GE_context* ac, T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.new_capacity */
extern T6 T32f32(GE_context* ac, T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.search */
extern void T41f71(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.search */
extern void T36f69(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.search */
extern void T32f81(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.start */
extern void T41f77(GE_context* ac, T0* C);
/* GEANT_VARIABLES.start */
extern void T36f77(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.start */
extern void T32f95(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_VARIABLES.forth */
extern void T41f78(GE_context* ac, T0* C);
/* GEANT_VARIABLES.forth */
extern void T36f78(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.forth */
extern void T32f96(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_VARIABLES.set_variable_value */
extern void T41f75(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.set_variable_value */
extern void T36f47(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.set_variable_value */
extern void T32f59(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.force */
extern void T32f62(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.replace */
extern void T41f76(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.replace */
extern void T36f76(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.replace */
extern void T32f94(GE_context* ac, T0* C, T0* a1, T0* a2);
/* SERIALIZATION_FAILURE.set_throwing_exception */
extern void T89f7(GE_context* ac, T0* C, T0* a1);
/* ADDRESS_APPLIED_TO_MELTED_FEATURE.set_throwing_exception */
extern void T88f7(GE_context* ac, T0* C, T0* a1);
/* DEVELOPER_EXCEPTION.set_throwing_exception */
extern void T87f11(GE_context* ac, T0* C, T0* a1);
/* MISMATCH_FAILURE.set_throwing_exception */
extern void T86f7(GE_context* ac, T0* C, T0* a1);
/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE.set_throwing_exception */
extern void T85f7(GE_context* ac, T0* C, T0* a1);
/* VOID_ASSIGNED_TO_EXPANDED.set_throwing_exception */
extern void T84f7(GE_context* ac, T0* C, T0* a1);
/* EXTERNAL_FAILURE.set_throwing_exception */
extern void T83f7(GE_context* ac, T0* C, T0* a1);
/* CREATE_ON_DEFERRED.set_throwing_exception */
extern void T82f7(GE_context* ac, T0* C, T0* a1);
/* RESUMPTION_FAILURE.set_throwing_exception */
extern void T81f7(GE_context* ac, T0* C, T0* a1);
/* RESCUE_FAILURE.set_throwing_exception */
extern void T80f7(GE_context* ac, T0* C, T0* a1);
/* LOOP_INVARIANT_VIOLATION.set_throwing_exception */
extern void T79f7(GE_context* ac, T0* C, T0* a1);
/* VARIANT_VIOLATION.set_throwing_exception */
extern void T78f7(GE_context* ac, T0* C, T0* a1);
/* BAD_INSPECT_VALUE.set_throwing_exception */
extern void T77f7(GE_context* ac, T0* C, T0* a1);
/* CHECK_VIOLATION.set_throwing_exception */
extern void T76f7(GE_context* ac, T0* C, T0* a1);
/* FLOATING_POINT_FAILURE.set_throwing_exception */
extern void T75f7(GE_context* ac, T0* C, T0* a1);
/* POSTCONDITION_VIOLATION.set_throwing_exception */
extern void T74f7(GE_context* ac, T0* C, T0* a1);
/* PRECONDITION_VIOLATION.set_throwing_exception */
extern void T73f7(GE_context* ac, T0* C, T0* a1);
/* EIFFEL_RUNTIME_PANIC.set_throwing_exception */
extern void T70f10(GE_context* ac, T0* C, T0* a1);
/* COM_FAILURE.set_throwing_exception */
extern void T69f13(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_FAILURE.set_throwing_exception */
extern void T68f8(GE_context* ac, T0* C, T0* a1);
/* IO_FAILURE.set_throwing_exception */
extern void T67f10(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_SIGNAL_FAILURE.set_throwing_exception */
extern void T66f8(GE_context* ac, T0* C, T0* a1);
/* INVARIANT_VIOLATION.set_throwing_exception */
extern void T65f8(GE_context* ac, T0* C, T0* a1);
/* NO_MORE_MEMORY.set_throwing_exception */
extern void T64f11(GE_context* ac, T0* C, T0* a1);
/* OLD_VIOLATION.set_throwing_exception */
extern void T62f7(GE_context* ac, T0* C, T0* a1);
/* ROUTINE_FAILURE.set_throwing_exception */
extern void T60f11(GE_context* ac, T0* C, T0* a1);
/* VOID_TARGET.set_throwing_exception */
extern void T58f7(GE_context* ac, T0* C, T0* a1);
/* SERIALIZATION_FAILURE.set_exception_trace */
extern void T89f8(GE_context* ac, T0* C, T0* a1);
/* ADDRESS_APPLIED_TO_MELTED_FEATURE.set_exception_trace */
extern void T88f8(GE_context* ac, T0* C, T0* a1);
/* DEVELOPER_EXCEPTION.set_exception_trace */
extern void T87f12(GE_context* ac, T0* C, T0* a1);
/* MISMATCH_FAILURE.set_exception_trace */
extern void T86f8(GE_context* ac, T0* C, T0* a1);
/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE.set_exception_trace */
extern void T85f8(GE_context* ac, T0* C, T0* a1);
/* VOID_ASSIGNED_TO_EXPANDED.set_exception_trace */
extern void T84f8(GE_context* ac, T0* C, T0* a1);
/* EXTERNAL_FAILURE.set_exception_trace */
extern void T83f8(GE_context* ac, T0* C, T0* a1);
/* CREATE_ON_DEFERRED.set_exception_trace */
extern void T82f8(GE_context* ac, T0* C, T0* a1);
/* RESUMPTION_FAILURE.set_exception_trace */
extern void T81f8(GE_context* ac, T0* C, T0* a1);
/* RESCUE_FAILURE.set_exception_trace */
extern void T80f8(GE_context* ac, T0* C, T0* a1);
/* LOOP_INVARIANT_VIOLATION.set_exception_trace */
extern void T79f8(GE_context* ac, T0* C, T0* a1);
/* VARIANT_VIOLATION.set_exception_trace */
extern void T78f8(GE_context* ac, T0* C, T0* a1);
/* BAD_INSPECT_VALUE.set_exception_trace */
extern void T77f8(GE_context* ac, T0* C, T0* a1);
/* CHECK_VIOLATION.set_exception_trace */
extern void T76f8(GE_context* ac, T0* C, T0* a1);
/* FLOATING_POINT_FAILURE.set_exception_trace */
extern void T75f8(GE_context* ac, T0* C, T0* a1);
/* POSTCONDITION_VIOLATION.set_exception_trace */
extern void T74f8(GE_context* ac, T0* C, T0* a1);
/* PRECONDITION_VIOLATION.set_exception_trace */
extern void T73f8(GE_context* ac, T0* C, T0* a1);
/* EIFFEL_RUNTIME_PANIC.set_exception_trace */
extern void T70f11(GE_context* ac, T0* C, T0* a1);
/* COM_FAILURE.set_exception_trace */
extern void T69f16(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_FAILURE.set_exception_trace */
extern void T68f10(GE_context* ac, T0* C, T0* a1);
/* IO_FAILURE.set_exception_trace */
extern void T67f12(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_SIGNAL_FAILURE.set_exception_trace */
extern void T66f10(GE_context* ac, T0* C, T0* a1);
/* INVARIANT_VIOLATION.set_exception_trace */
extern void T65f10(GE_context* ac, T0* C, T0* a1);
/* NO_MORE_MEMORY.set_exception_trace */
extern void T64f9(GE_context* ac, T0* C, T0* a1);
/* OLD_VIOLATION.set_exception_trace */
extern void T62f8(GE_context* ac, T0* C, T0* a1);
/* ROUTINE_FAILURE.set_exception_trace */
extern void T60f12(GE_context* ac, T0* C, T0* a1);
/* VOID_TARGET.set_exception_trace */
extern void T58f8(GE_context* ac, T0* C, T0* a1);
/* SERIALIZATION_FAILURE.set_description */
extern void T89f9(GE_context* ac, T0* C, T0* a1);
/* C_STRING.set_count */
extern void T127f8(GE_context* ac, T0* C, T6 a1);
/* UTF_CONVERTER.utf_32_string_into_utf_8_0_pointer */
extern void T125f11(GE_context* ac, T125* C, T0* a1, T0* a2, T6 a3, T0* a4);
/* ADDRESS_APPLIED_TO_MELTED_FEATURE.set_description */
extern void T88f9(GE_context* ac, T0* C, T0* a1);
/* DEVELOPER_EXCEPTION.set_description */
extern void T87f13(GE_context* ac, T0* C, T0* a1);
/* MISMATCH_FAILURE.set_description */
extern void T86f9(GE_context* ac, T0* C, T0* a1);
/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE.set_description */
extern void T85f9(GE_context* ac, T0* C, T0* a1);
/* VOID_ASSIGNED_TO_EXPANDED.set_description */
extern void T84f9(GE_context* ac, T0* C, T0* a1);
/* EXTERNAL_FAILURE.set_description */
extern void T83f9(GE_context* ac, T0* C, T0* a1);
/* CREATE_ON_DEFERRED.set_description */
extern void T82f9(GE_context* ac, T0* C, T0* a1);
/* RESUMPTION_FAILURE.set_description */
extern void T81f9(GE_context* ac, T0* C, T0* a1);
/* RESCUE_FAILURE.set_description */
extern void T80f9(GE_context* ac, T0* C, T0* a1);
/* LOOP_INVARIANT_VIOLATION.set_description */
extern void T79f9(GE_context* ac, T0* C, T0* a1);
/* VARIANT_VIOLATION.set_description */
extern void T78f9(GE_context* ac, T0* C, T0* a1);
/* BAD_INSPECT_VALUE.set_description */
extern void T77f9(GE_context* ac, T0* C, T0* a1);
/* CHECK_VIOLATION.set_description */
extern void T76f9(GE_context* ac, T0* C, T0* a1);
/* FLOATING_POINT_FAILURE.set_description */
extern void T75f9(GE_context* ac, T0* C, T0* a1);
/* POSTCONDITION_VIOLATION.set_description */
extern void T74f9(GE_context* ac, T0* C, T0* a1);
/* PRECONDITION_VIOLATION.set_description */
extern void T73f9(GE_context* ac, T0* C, T0* a1);
/* EIFFEL_RUNTIME_PANIC.set_description */
extern void T70f12(GE_context* ac, T0* C, T0* a1);
/* COM_FAILURE.set_description */
extern void T69f17(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_FAILURE.set_description */
extern void T68f11(GE_context* ac, T0* C, T0* a1);
/* IO_FAILURE.set_description */
extern void T67f13(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_SIGNAL_FAILURE.set_description */
extern void T66f11(GE_context* ac, T0* C, T0* a1);
/* INVARIANT_VIOLATION.set_description */
extern void T65f11(GE_context* ac, T0* C, T0* a1);
/* NO_MORE_MEMORY.set_description */
extern void T64f12(GE_context* ac, T0* C, T0* a1);
/* OLD_VIOLATION.set_description */
extern void T62f9(GE_context* ac, T0* C, T0* a1);
/* ROUTINE_FAILURE.set_description */
extern void T60f13(GE_context* ac, T0* C, T0* a1);
/* VOID_TARGET.set_description */
extern void T58f9(GE_context* ac, T0* C, T0* a1);
/* SERIALIZATION_FAILURE.set_recipient_name */
extern void T89f10(GE_context* ac, T0* C, T0* a1);
/* ADDRESS_APPLIED_TO_MELTED_FEATURE.set_recipient_name */
extern void T88f10(GE_context* ac, T0* C, T0* a1);
/* DEVELOPER_EXCEPTION.set_recipient_name */
extern void T87f14(GE_context* ac, T0* C, T0* a1);
/* MISMATCH_FAILURE.set_recipient_name */
extern void T86f10(GE_context* ac, T0* C, T0* a1);
/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE.set_recipient_name */
extern void T85f10(GE_context* ac, T0* C, T0* a1);
/* VOID_ASSIGNED_TO_EXPANDED.set_recipient_name */
extern void T84f10(GE_context* ac, T0* C, T0* a1);
/* EXTERNAL_FAILURE.set_recipient_name */
extern void T83f10(GE_context* ac, T0* C, T0* a1);
/* CREATE_ON_DEFERRED.set_recipient_name */
extern void T82f10(GE_context* ac, T0* C, T0* a1);
/* RESUMPTION_FAILURE.set_recipient_name */
extern void T81f10(GE_context* ac, T0* C, T0* a1);
/* RESCUE_FAILURE.set_recipient_name */
extern void T80f10(GE_context* ac, T0* C, T0* a1);
/* LOOP_INVARIANT_VIOLATION.set_recipient_name */
extern void T79f10(GE_context* ac, T0* C, T0* a1);
/* VARIANT_VIOLATION.set_recipient_name */
extern void T78f10(GE_context* ac, T0* C, T0* a1);
/* BAD_INSPECT_VALUE.set_recipient_name */
extern void T77f10(GE_context* ac, T0* C, T0* a1);
/* CHECK_VIOLATION.set_recipient_name */
extern void T76f10(GE_context* ac, T0* C, T0* a1);
/* FLOATING_POINT_FAILURE.set_recipient_name */
extern void T75f10(GE_context* ac, T0* C, T0* a1);
/* POSTCONDITION_VIOLATION.set_recipient_name */
extern void T74f10(GE_context* ac, T0* C, T0* a1);
/* PRECONDITION_VIOLATION.set_recipient_name */
extern void T73f10(GE_context* ac, T0* C, T0* a1);
/* EIFFEL_RUNTIME_PANIC.set_recipient_name */
extern void T70f13(GE_context* ac, T0* C, T0* a1);
/* COM_FAILURE.set_recipient_name */
extern void T69f18(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_FAILURE.set_recipient_name */
extern void T68f12(GE_context* ac, T0* C, T0* a1);
/* IO_FAILURE.set_recipient_name */
extern void T67f14(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_SIGNAL_FAILURE.set_recipient_name */
extern void T66f12(GE_context* ac, T0* C, T0* a1);
/* INVARIANT_VIOLATION.set_recipient_name */
extern void T65f12(GE_context* ac, T0* C, T0* a1);
/* NO_MORE_MEMORY.set_recipient_name */
extern void T64f13(GE_context* ac, T0* C, T0* a1);
/* OLD_VIOLATION.set_recipient_name */
extern void T62f10(GE_context* ac, T0* C, T0* a1);
/* ROUTINE_FAILURE.set_recipient_name */
extern void T60f14(GE_context* ac, T0* C, T0* a1);
/* VOID_TARGET.set_recipient_name */
extern void T58f10(GE_context* ac, T0* C, T0* a1);
/* SERIALIZATION_FAILURE.set_type_name */
extern void T89f11(GE_context* ac, T0* C, T0* a1);
/* ADDRESS_APPLIED_TO_MELTED_FEATURE.set_type_name */
extern void T88f11(GE_context* ac, T0* C, T0* a1);
/* DEVELOPER_EXCEPTION.set_type_name */
extern void T87f15(GE_context* ac, T0* C, T0* a1);
/* MISMATCH_FAILURE.set_type_name */
extern void T86f11(GE_context* ac, T0* C, T0* a1);
/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE.set_type_name */
extern void T85f11(GE_context* ac, T0* C, T0* a1);
/* VOID_ASSIGNED_TO_EXPANDED.set_type_name */
extern void T84f11(GE_context* ac, T0* C, T0* a1);
/* EXTERNAL_FAILURE.set_type_name */
extern void T83f11(GE_context* ac, T0* C, T0* a1);
/* CREATE_ON_DEFERRED.set_type_name */
extern void T82f11(GE_context* ac, T0* C, T0* a1);
/* RESUMPTION_FAILURE.set_type_name */
extern void T81f11(GE_context* ac, T0* C, T0* a1);
/* RESCUE_FAILURE.set_type_name */
extern void T80f11(GE_context* ac, T0* C, T0* a1);
/* LOOP_INVARIANT_VIOLATION.set_type_name */
extern void T79f11(GE_context* ac, T0* C, T0* a1);
/* VARIANT_VIOLATION.set_type_name */
extern void T78f11(GE_context* ac, T0* C, T0* a1);
/* BAD_INSPECT_VALUE.set_type_name */
extern void T77f11(GE_context* ac, T0* C, T0* a1);
/* CHECK_VIOLATION.set_type_name */
extern void T76f11(GE_context* ac, T0* C, T0* a1);
/* FLOATING_POINT_FAILURE.set_type_name */
extern void T75f11(GE_context* ac, T0* C, T0* a1);
/* POSTCONDITION_VIOLATION.set_type_name */
extern void T74f11(GE_context* ac, T0* C, T0* a1);
/* PRECONDITION_VIOLATION.set_type_name */
extern void T73f11(GE_context* ac, T0* C, T0* a1);
/* EIFFEL_RUNTIME_PANIC.set_type_name */
extern void T70f14(GE_context* ac, T0* C, T0* a1);
/* COM_FAILURE.set_type_name */
extern void T69f19(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_FAILURE.set_type_name */
extern void T68f13(GE_context* ac, T0* C, T0* a1);
/* IO_FAILURE.set_type_name */
extern void T67f15(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_SIGNAL_FAILURE.set_type_name */
extern void T66f13(GE_context* ac, T0* C, T0* a1);
/* INVARIANT_VIOLATION.set_type_name */
extern void T65f13(GE_context* ac, T0* C, T0* a1);
/* NO_MORE_MEMORY.set_type_name */
extern void T64f14(GE_context* ac, T0* C, T0* a1);
/* OLD_VIOLATION.set_type_name */
extern void T62f11(GE_context* ac, T0* C, T0* a1);
/* ROUTINE_FAILURE.set_type_name */
extern void T60f15(GE_context* ac, T0* C, T0* a1);
/* VOID_TARGET.set_type_name */
extern void T58f11(GE_context* ac, T0* C, T0* a1);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T632f3(GE_context* ac, T0* C, T6 a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T630f2(GE_context* ac, T0* C, T6 a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T628f3(GE_context* ac, T0* C, T6 a1);
/* GEANT_REPLACE_TASK.is_executable */
extern T1 T384f18(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.is_executable */
extern T1 T481f14(GE_context* ac, T0* C);
/* KL_BOOLEAN_ROUTINES.nxor */
extern T1 T544f1(GE_context* ac, T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.is_fileset_to_directory_executable */
extern T1 T481f17(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.boolean_ */
extern unsigned char ge123os5677;
extern T0* ge123ov5677;
extern T0* T481f15(GE_context* ac, T0* C);
/* KL_BOOLEAN_ROUTINES.default_create */
extern T0* T544c2(GE_context* ac);
/* GEANT_INPUT_TASK.is_executable */
extern T1 T382f20(GE_context* ac, T0* C);
/* GEANT_INPUT_COMMAND.is_executable */
extern T1 T479f11(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.is_executable */
extern T1 T380f6(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_COMMAND.is_executable */
extern T1 T477f9(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_COMMAND.validate_condition */
extern void T477f20(GE_context* ac, T0* C, T1 a1, T0* a2, T0* a3);
/* GEANT_AVAILABLE_COMMAND.validation_messages */
extern T0* T477f16(GE_context* ac, T0* C);
/* DS_CELL [BOOLEAN].put */
extern void T540f3(GE_context* ac, T0* C, T1 a1);
/* DS_CELL [BOOLEAN].make */
extern T0* T540c2(GE_context* ac, T1 a1);
/* GEANT_PRECURSOR_TASK.is_executable */
extern T1 T378f17(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_COMMAND.is_executable */
extern T1 T475f7(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.is_executable */
extern T1 T376f10(GE_context* ac, T0* C);
/* GEANT_EXIT_COMMAND.is_executable */
extern T1 T473f6(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.is_executable */
extern T1 T374f15(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_executable */
extern T1 T471f11(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_fileset_executable */
extern T1 T471f13(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.is_executable */
extern T1 T372f29(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.is_executable */
extern T1 T468f17(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.is_executable */
extern T1 T370f11(GE_context* ac, T0* C);
/* GEANT_SETENV_COMMAND.is_executable */
extern T1 T465f7(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.is_executable */
extern T1 T368f13(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.is_executable */
extern T1 T463f9(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.is_fileset_to_directory_executable */
extern T1 T463f12(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.is_executable */
extern T1 T366f19(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.is_executable */
extern T1 T461f10(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.is_fileset_to_directory_executable */
extern T1 T461f14(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.boolean_ */
extern T0* T461f11(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.is_executable */
extern T1 T364f19(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.is_executable */
extern T1 T458f10(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.boolean_ */
extern T0* T458f11(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.is_executable */
extern T1 T362f6(GE_context* ac, T0* C);
/* GEANT_MKDIR_COMMAND.is_executable */
extern T1 T455f8(GE_context* ac, T0* C);
/* GEANT_MKDIR_COMMAND.validate_condition */
extern void T455f17(GE_context* ac, T0* C, T1 a1, T0* a2, T0* a3);
/* GEANT_MKDIR_COMMAND.validation_messages */
extern T0* T455f12(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.is_executable */
extern T1 T360f6(GE_context* ac, T0* C);
/* GEANT_ECHO_COMMAND.is_executable */
extern T1 T453f9(GE_context* ac, T0* C);
/* GEANT_ECHO_COMMAND.validate_condition */
extern void T453f17(GE_context* ac, T0* C, T1 a1, T0* a2, T0* a3);
/* GEANT_ECHO_COMMAND.validation_messages */
extern T0* T453f11(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.is_executable */
extern T1 T358f25(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.is_executable */
extern T1 T451f13(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.is_target_executable */
extern T1 T451f15(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.is_executable */
extern T1 T356f27(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.is_executable */
extern T1 T449f16(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.is_executable */
extern T1 T354f22(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.is_executable */
extern T1 T447f12(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.is_fileset_executable */
extern T1 T447f14(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.is_executable */
extern T1 T352f23(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.is_executable */
extern T1 T445f13(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.is_executable */
extern T1 T350f27(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.is_executable */
extern T1 T443f17(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.is_executable */
extern T1 T348f23(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.is_executable */
extern T1 T441f13(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.boolean_ */
extern T0* T441f14(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.is_executable */
extern T1 T346f10(GE_context* ac, T0* C);
/* GEANT_UNSET_COMMAND.is_executable */
extern T1 T438f6(GE_context* ac, T0* C);
/* GEANT_SET_TASK.is_executable */
extern T1 T344f11(GE_context* ac, T0* C);
/* GEANT_SET_COMMAND.is_executable */
extern T1 T436f7(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.is_executable */
extern T1 T342f11(GE_context* ac, T0* C);
/* GEANT_LCC_COMMAND.is_executable */
extern T1 T434f7(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.is_executable */
extern T1 T340f7(GE_context* ac, T0* C);
/* GEANT_EXEC_COMMAND.is_executable */
extern T1 T427f9(GE_context* ac, T0* C);
/* GEANT_EXEC_COMMAND.validate_condition */
extern void T427f17(GE_context* ac, T0* C, T1 a1, T0* a2, T0* a3);
/* GEANT_EXEC_COMMAND.validation_messages */
extern T0* T427f12(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.is_executable */
extern T1 T338f24(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.is_executable */
extern T1 T424f13(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.is_cleanable */
extern T1 T424f15(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.is_executable */
extern T1 T332f25(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.is_executable */
extern T1 T420f15(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.is_enabled */
extern T1 T384f19(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.unless_attribute_name */
extern T0* T384f23(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.if_attribute_name */
extern T0* T384f22(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.is_enabled */
extern T1 T382f21(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.unless_attribute_name */
extern T0* T382f25(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.if_attribute_name */
extern T0* T382f24(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.is_enabled */
extern T1 T380f7(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.unless_attribute_name */
extern T0* T380f13(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.has_attribute */
extern T1 T380f12(GE_context* ac, T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.if_attribute_name */
extern T0* T380f11(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.is_enabled */
extern T1 T378f18(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.unless_attribute_name */
extern T0* T378f22(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.if_attribute_name */
extern T0* T378f21(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.is_enabled */
extern T1 T376f11(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.unless_attribute_name */
extern T0* T376f15(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.if_attribute_name */
extern T0* T376f14(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.is_enabled */
extern T1 T374f16(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.unless_attribute_name */
extern T0* T374f20(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.if_attribute_name */
extern T0* T374f19(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.is_enabled */
extern T1 T372f30(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.unless_attribute_name */
extern T0* T372f34(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.if_attribute_name */
extern T0* T372f33(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.is_enabled */
extern T1 T370f12(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.unless_attribute_name */
extern T0* T370f16(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.if_attribute_name */
extern T0* T370f15(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.is_enabled */
extern T1 T368f14(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.unless_attribute_name */
extern T0* T368f18(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.if_attribute_name */
extern T0* T368f17(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.is_enabled */
extern T1 T366f20(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.unless_attribute_name */
extern T0* T366f24(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.if_attribute_name */
extern T0* T366f23(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.is_enabled */
extern T1 T364f20(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.unless_attribute_name */
extern T0* T364f24(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.if_attribute_name */
extern T0* T364f23(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.is_enabled */
extern T1 T362f7(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.unless_attribute_name */
extern T0* T362f13(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.has_attribute */
extern T1 T362f12(GE_context* ac, T0* C, T0* a1);
/* GEANT_MKDIR_TASK.if_attribute_name */
extern T0* T362f11(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.is_enabled */
extern T1 T360f7(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.unless_attribute_name */
extern T0* T360f13(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.has_attribute */
extern T1 T360f12(GE_context* ac, T0* C, T0* a1);
/* GEANT_ECHO_TASK.if_attribute_name */
extern T0* T360f11(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.is_enabled */
extern T1 T358f26(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.unless_attribute_name */
extern T0* T358f30(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.if_attribute_name */
extern T0* T358f29(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.is_enabled */
extern T1 T356f28(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.unless_attribute_name */
extern T0* T356f32(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.if_attribute_name */
extern T0* T356f31(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.is_enabled */
extern T1 T354f23(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.unless_attribute_name */
extern T0* T354f27(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.if_attribute_name */
extern T0* T354f26(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.is_enabled */
extern T1 T352f24(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.unless_attribute_name */
extern T0* T352f28(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.if_attribute_name */
extern T0* T352f27(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.is_enabled */
extern T1 T350f28(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.unless_attribute_name */
extern T0* T350f32(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.if_attribute_name */
extern T0* T350f31(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.is_enabled */
extern T1 T348f24(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.unless_attribute_name */
extern T0* T348f28(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.if_attribute_name */
extern T0* T348f27(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.is_enabled */
extern T1 T346f11(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.unless_attribute_name */
extern T0* T346f15(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.if_attribute_name */
extern T0* T346f14(GE_context* ac, T0* C);
/* GEANT_SET_TASK.is_enabled */
extern T1 T344f12(GE_context* ac, T0* C);
/* GEANT_SET_TASK.unless_attribute_name */
extern T0* T344f16(GE_context* ac, T0* C);
/* GEANT_SET_TASK.if_attribute_name */
extern T0* T344f15(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.is_enabled */
extern T1 T342f12(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.unless_attribute_name */
extern T0* T342f16(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.if_attribute_name */
extern T0* T342f15(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.is_enabled */
extern T1 T340f8(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.unless_attribute_name */
extern T0* T340f14(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.has_attribute */
extern T1 T340f13(GE_context* ac, T0* C, T0* a1);
/* GEANT_EXEC_TASK.if_attribute_name */
extern T0* T340f12(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.is_enabled */
extern T1 T338f25(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.unless_attribute_name */
extern T0* T338f29(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.if_attribute_name */
extern T0* T338f28(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.is_enabled */
extern T1 T332f26(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.unless_attribute_name */
extern T0* T332f30(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.if_attribute_name */
extern T0* T332f29(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.is_exit_command */
extern T1 T384f20(GE_context* ac, T0* C);
/* GEANT_REPLACE_COMMAND.is_exit_command */
extern T1 T481f13(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.is_exit_command */
extern T1 T382f22(GE_context* ac, T0* C);
/* GEANT_INPUT_COMMAND.is_exit_command */
extern T1 T479f10(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.is_exit_command */
extern T1 T380f8(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_COMMAND.is_exit_command */
extern T1 T477f10(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.is_exit_command */
extern T1 T378f19(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_COMMAND.is_exit_command */
extern T1 T475f6(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.is_exit_command */
extern T1 T376f12(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.is_exit_command */
extern T1 T374f17(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_exit_command */
extern T1 T471f16(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.is_exit_command */
extern T1 T372f31(GE_context* ac, T0* C);
/* GEANT_XSLT_COMMAND.is_exit_command */
extern T1 T468f18(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.is_exit_command */
extern T1 T370f13(GE_context* ac, T0* C);
/* GEANT_SETENV_COMMAND.is_exit_command */
extern T1 T465f6(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.is_exit_command */
extern T1 T368f15(GE_context* ac, T0* C);
/* GEANT_MOVE_COMMAND.is_exit_command */
extern T1 T463f8(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.is_exit_command */
extern T1 T366f21(GE_context* ac, T0* C);
/* GEANT_COPY_COMMAND.is_exit_command */
extern T1 T461f9(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.is_exit_command */
extern T1 T364f21(GE_context* ac, T0* C);
/* GEANT_DELETE_COMMAND.is_exit_command */
extern T1 T458f9(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.is_exit_command */
extern T1 T362f8(GE_context* ac, T0* C);
/* GEANT_MKDIR_COMMAND.is_exit_command */
extern T1 T455f9(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.is_exit_command */
extern T1 T360f8(GE_context* ac, T0* C);
/* GEANT_ECHO_COMMAND.is_exit_command */
extern T1 T453f10(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.is_exit_command */
extern T1 T358f27(GE_context* ac, T0* C);
/* GEANT_GEANT_COMMAND.is_exit_command */
extern T1 T451f12(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.is_exit_command */
extern T1 T356f29(GE_context* ac, T0* C);
/* GEANT_GETEST_COMMAND.is_exit_command */
extern T1 T449f15(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.is_exit_command */
extern T1 T354f24(GE_context* ac, T0* C);
/* GEANT_GEPP_COMMAND.is_exit_command */
extern T1 T447f11(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.is_exit_command */
extern T1 T352f25(GE_context* ac, T0* C);
/* GEANT_GEYACC_COMMAND.is_exit_command */
extern T1 T445f12(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.is_exit_command */
extern T1 T350f29(GE_context* ac, T0* C);
/* GEANT_GELEX_COMMAND.is_exit_command */
extern T1 T443f16(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.is_exit_command */
extern T1 T348f25(GE_context* ac, T0* C);
/* GEANT_GEXACE_COMMAND.is_exit_command */
extern T1 T441f12(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.is_exit_command */
extern T1 T346f12(GE_context* ac, T0* C);
/* GEANT_UNSET_COMMAND.is_exit_command */
extern T1 T438f5(GE_context* ac, T0* C);
/* GEANT_SET_TASK.is_exit_command */
extern T1 T344f13(GE_context* ac, T0* C);
/* GEANT_SET_COMMAND.is_exit_command */
extern T1 T436f6(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.is_exit_command */
extern T1 T342f13(GE_context* ac, T0* C);
/* GEANT_LCC_COMMAND.is_exit_command */
extern T1 T434f6(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.is_exit_command */
extern T1 T340f9(GE_context* ac, T0* C);
/* GEANT_EXEC_COMMAND.is_exit_command */
extern T1 T427f10(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.is_exit_command */
extern T1 T338f26(GE_context* ac, T0* C);
/* GEANT_ISE_COMMAND.is_exit_command */
extern T1 T424f12(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.is_exit_command */
extern T1 T332f27(GE_context* ac, T0* C);
/* GEANT_GEC_COMMAND.is_exit_command */
extern T1 T420f14(GE_context* ac, T0* C);
/* GEANT_REPLACE_TASK.exit_code */
extern T6 T384f21(GE_context* ac, T0* C);
/* GEANT_INPUT_TASK.exit_code */
extern T6 T382f23(GE_context* ac, T0* C);
/* GEANT_AVAILABLE_TASK.exit_code */
extern T6 T380f9(GE_context* ac, T0* C);
/* GEANT_PRECURSOR_TASK.exit_code */
extern T6 T378f20(GE_context* ac, T0* C);
/* GEANT_EXIT_TASK.exit_code */
extern T6 T376f13(GE_context* ac, T0* C);
/* GEANT_OUTOFDATE_TASK.exit_code */
extern T6 T374f18(GE_context* ac, T0* C);
/* GEANT_XSLT_TASK.exit_code */
extern T6 T372f32(GE_context* ac, T0* C);
/* GEANT_SETENV_TASK.exit_code */
extern T6 T370f14(GE_context* ac, T0* C);
/* GEANT_MOVE_TASK.exit_code */
extern T6 T368f16(GE_context* ac, T0* C);
/* GEANT_COPY_TASK.exit_code */
extern T6 T366f22(GE_context* ac, T0* C);
/* GEANT_DELETE_TASK.exit_code */
extern T6 T364f22(GE_context* ac, T0* C);
/* GEANT_MKDIR_TASK.exit_code */
extern T6 T362f9(GE_context* ac, T0* C);
/* GEANT_ECHO_TASK.exit_code */
extern T6 T360f9(GE_context* ac, T0* C);
/* GEANT_GEANT_TASK.exit_code */
extern T6 T358f28(GE_context* ac, T0* C);
/* GEANT_GETEST_TASK.exit_code */
extern T6 T356f30(GE_context* ac, T0* C);
/* GEANT_GEPP_TASK.exit_code */
extern T6 T354f25(GE_context* ac, T0* C);
/* GEANT_GEYACC_TASK.exit_code */
extern T6 T352f26(GE_context* ac, T0* C);
/* GEANT_GELEX_TASK.exit_code */
extern T6 T350f30(GE_context* ac, T0* C);
/* GEANT_GEXACE_TASK.exit_code */
extern T6 T348f26(GE_context* ac, T0* C);
/* GEANT_UNSET_TASK.exit_code */
extern T6 T346f13(GE_context* ac, T0* C);
/* GEANT_SET_TASK.exit_code */
extern T6 T344f14(GE_context* ac, T0* C);
/* GEANT_LCC_TASK.exit_code */
extern T6 T342f14(GE_context* ac, T0* C);
/* GEANT_EXEC_TASK.exit_code */
extern T6 T340f10(GE_context* ac, T0* C);
/* GEANT_ISE_TASK.exit_code */
extern T6 T338f27(GE_context* ac, T0* C);
/* GEANT_GEC_TASK.exit_code */
extern T6 T332f28(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.error_position */
extern T0* T226f60(GE_context* ac, T0* C);
/* XM_DEFAULT_POSITION.make */
extern T0* T184c5(GE_context* ac, T0* a1, T6 a2, T6 a3, T6 a4);
/* XM_EIFFEL_SCANNER_DTD.error_position */
extern T0* T224f56(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.error_position */
extern T0* T223f58(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.error_position */
extern T0* T183f66(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.end_of_file */
extern T1 T226f62(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.end_of_file */
extern T1 T224f63(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.end_of_file */
extern T1 T223f60(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.end_of_file */
extern T1 T183f68(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_applicable_encoding */
extern T1 T226f63(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_applicable_encoding */
extern T1 T266f16(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_valid_encoding */
extern T1 T266f9(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.is_applicable_encoding */
extern T1 T224f49(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.is_applicable_encoding */
extern T1 T223f61(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.is_applicable_encoding */
extern T1 T183f69(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.start_condition */
extern T6 T226f64(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.start_condition */
extern T6 T224f51(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.start_condition */
extern T6 T223f62(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.start_condition */
extern T6 T183f44(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_item */
extern T0* T120f23(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_item */
extern T0* T41f34(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.item_storage_item */
extern T0* T41f38(GE_context* ac, T0* C, T6 a1);
/* GEANT_VARIABLES.cursor_item */
extern T0* T36f37(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_item */
extern T0* T32f45(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_key */
extern T0* T120f24(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_key */
extern T0* T41f35(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_key */
extern T0* T36f38(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_key */
extern T0* T32f46(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.character_32_item */
extern T3 T265f35(GE_context* ac, T0* C, T6 a1);
/* IMMUTABLE_STRING_32.item */
extern T3 T122f7(GE_context* ac, T0* C, T6 a1);
/* STRING_32.item */
extern T3 T18f10(GE_context* ac, T0* C, T6 a1);
/* STRING_8.character_32_item */
extern T3 T17f21(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.substring */
extern T0* T265f41(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.make_from_substring */
extern T0* T265c65(GE_context* ac, T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.make_from_substring_general */
extern void T265f79(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* IMMUTABLE_STRING_32.substring */
extern T0* T122f8(GE_context* ac, T0* C, T6 a1, T6 a2);
/* IMMUTABLE_STRING_32.empty_string */
extern unsigned char ge2411os5174;
extern T0* ge2411ov5174;
extern T0* T122f9(GE_context* ac, T0* C);
/* STRING_32.substring */
extern T0* T18f11(GE_context* ac, T0* C, T6 a1, T6 a2);
/* STRING_32.new_string */
extern T0* T18f12(GE_context* ac, T0* C, T6 a1);
/* STRING_8.substring */
extern T0* T17f11(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.code */
extern T10 T265f23(GE_context* ac, T0* C, T6 a1);
/* IMMUTABLE_STRING_32.code */
extern T10 T122f5(GE_context* ac, T0* C, T6 a1);
/* STRING_32.code */
extern T10 T18f5(GE_context* ac, T0* C, T6 a1);
/* STRING_8.code */
extern T10 T17f23(GE_context* ac, T0* C, T6 a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.default_message */
extern T0* T619f5(GE_context* ac, T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.message */
extern T0* T619f3(GE_context* ac, T0* C, T0* a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.arguments */
extern T0* T619f6(GE_context* ac, T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.string_ */
extern T0* T619f4(GE_context* ac, T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.default_message */
extern T0* T595f5(GE_context* ac, T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.message */
extern T0* T595f3(GE_context* ac, T0* C, T0* a1);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.arguments */
extern T0* T595f6(GE_context* ac, T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.string_ */
extern T0* T595f4(GE_context* ac, T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.default_message */
extern T0* T594f5(GE_context* ac, T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.message */
extern T0* T594f3(GE_context* ac, T0* C, T0* a1);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.arguments */
extern T0* T594f6(GE_context* ac, T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.string_ */
extern T0* T594f4(GE_context* ac, T0* C);
/* LX_FULL_AND_REJECT_ERROR.default_message */
extern T0* T593f5(GE_context* ac, T0* C);
/* LX_FULL_AND_REJECT_ERROR.message */
extern T0* T593f3(GE_context* ac, T0* C, T0* a1);
/* LX_FULL_AND_REJECT_ERROR.arguments */
extern T0* T593f6(GE_context* ac, T0* C);
/* LX_FULL_AND_REJECT_ERROR.string_ */
extern T0* T593f4(GE_context* ac, T0* C);
/* LX_FULL_AND_META_ERROR.default_message */
extern T0* T592f5(GE_context* ac, T0* C);
/* LX_FULL_AND_META_ERROR.message */
extern T0* T592f3(GE_context* ac, T0* C, T0* a1);
/* LX_FULL_AND_META_ERROR.arguments */
extern T0* T592f6(GE_context* ac, T0* C);
/* LX_FULL_AND_META_ERROR.string_ */
extern T0* T592f4(GE_context* ac, T0* C);
/* LX_BAD_CHARACTER_ERROR.default_message */
extern T0* T591f5(GE_context* ac, T0* C);
/* LX_BAD_CHARACTER_ERROR.message */
extern T0* T591f3(GE_context* ac, T0* C, T0* a1);
/* LX_BAD_CHARACTER_ERROR.arguments */
extern T0* T591f6(GE_context* ac, T0* C);
/* LX_BAD_CHARACTER_ERROR.string_ */
extern T0* T591f4(GE_context* ac, T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.default_message */
extern T0* T590f5(GE_context* ac, T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.message */
extern T0* T590f3(GE_context* ac, T0* C, T0* a1);
/* LX_BAD_CHARACTER_CLASS_ERROR.arguments */
extern T0* T590f6(GE_context* ac, T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.string_ */
extern T0* T590f4(GE_context* ac, T0* C);
/* LX_MISSING_QUOTE_ERROR.default_message */
extern T0* T589f5(GE_context* ac, T0* C);
/* LX_MISSING_QUOTE_ERROR.message */
extern T0* T589f3(GE_context* ac, T0* C, T0* a1);
/* LX_MISSING_QUOTE_ERROR.arguments */
extern T0* T589f6(GE_context* ac, T0* C);
/* LX_MISSING_QUOTE_ERROR.string_ */
extern T0* T589f4(GE_context* ac, T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.default_message */
extern T0* T588f5(GE_context* ac, T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.message */
extern T0* T588f3(GE_context* ac, T0* C, T0* a1);
/* LX_UNRECOGNIZED_RULE_ERROR.arguments */
extern T0* T588f6(GE_context* ac, T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.string_ */
extern T0* T588f4(GE_context* ac, T0* C);
/* UT_SYNTAX_ERROR.default_message */
extern T0* T586f5(GE_context* ac, T0* C);
/* UT_SYNTAX_ERROR.message */
extern T0* T586f3(GE_context* ac, T0* C, T0* a1);
/* UT_SYNTAX_ERROR.arguments */
extern T0* T586f6(GE_context* ac, T0* C);
/* UT_SYNTAX_ERROR.string_ */
extern T0* T586f4(GE_context* ac, T0* C);
/* UT_VERSION_NUMBER.default_message */
extern T0* T56f3(GE_context* ac, T0* C);
/* UT_VERSION_NUMBER.message */
extern T0* T56f5(GE_context* ac, T0* C, T0* a1);
/* UT_VERSION_NUMBER.arguments */
extern T0* T56f7(GE_context* ac, T0* C);
/* UT_VERSION_NUMBER.string_ */
extern T0* T56f6(GE_context* ac, T0* C);
/* AP_DISPLAY_HELP_FLAG.was_found */
extern T1 T112f10(GE_context* ac, T0* C);
/* AP_STRING_OPTION.was_found */
extern T1 T44f15(GE_context* ac, T0* C);
/* AP_FLAG.was_found */
extern T1 T42f9(GE_context* ac, T0* C);
/* AP_STRING_OPTION.occurrences */
extern T6 T44f18(GE_context* ac, T0* C);
/* AP_DISPLAY_HELP_FLAG.allows_parameter */
extern T1 T112f21(GE_context* ac, T0* C);
/* AP_STRING_OPTION.allows_parameter */
extern T1 T44f17(GE_context* ac, T0* C);
/* AP_FLAG.allows_parameter */
extern T1 T42f11(GE_context* ac, T0* C);
/* AP_DISPLAY_HELP_FLAG.needs_parameter */
extern T1 T112f9(GE_context* ac, T0* C);
/* AP_FLAG.needs_parameter */
extern T1 T42f10(GE_context* ac, T0* C);
/* AP_DISPLAY_HELP_FLAG.name */
extern T0* T112f11(GE_context* ac, T0* C);
/* AP_STRING_OPTION.name */
extern T0* T44f12(GE_context* ac, T0* C);
/* AP_FLAG.name */
extern T0* T42f14(GE_context* ac, T0* C);
/* AP_DISPLAY_HELP_FLAG.names */
extern T0* T112f22(GE_context* ac, T0* C);
/* AP_STRING_OPTION.names */
extern T0* T44f19(GE_context* ac, T0* C);
/* AP_STRING_OPTION.has_long_form */
extern T1 T44f21(GE_context* ac, T0* C);
/* AP_STRING_OPTION.names */
extern T0* T44f19p1(GE_context* ac, T0* C);
/* AP_FLAG.names */
extern T0* T42f15(GE_context* ac, T0* C);
/* AP_DISPLAY_HELP_FLAG.example */
extern T0* T112f27(GE_context* ac, T0* C);
/* AP_STRING_OPTION.example */
extern T0* T44f20(GE_context* ac, T0* C);
/* AP_FLAG.example */
extern T0* T42f16(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_VARIABLES.found */
extern T1 T41f36(GE_context* ac, T0* C);
/* GEANT_VARIABLES.found */
extern T1 T36f36(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.found */
extern T1 T32f44(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_VARIABLES.found_item */
extern T0* T41f41(GE_context* ac, T0* C);
/* GEANT_VARIABLES.found_item */
extern T0* T36f41(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.found_item */
extern T0* T32f53(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_VARIABLES.after */
extern T1 T41f42(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_VARIABLES.cursor_after */
extern T1 T41f45(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.after */
extern T1 T36f42(GE_context* ac, T0* C);
/* GEANT_VARIABLES.cursor_after */
extern T1 T36f45(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.after */
extern T1 T32f54(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.cursor_after */
extern T1 T32f57(GE_context* ac, T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.key_for_iteration */
extern T0* T41f43(GE_context* ac, T0* C);
/* GEANT_VARIABLES.key_for_iteration */
extern T0* T36f43(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.key_for_iteration */
extern T0* T32f55(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_VARIABLES.item_for_iteration */
extern T0* T41f44(GE_context* ac, T0* C);
/* GEANT_VARIABLES.item_for_iteration */
extern T0* T36f44(GE_context* ac, T0* C);
/* GEANT_PROJECT_VARIABLES.item_for_iteration */
extern T0* T32f56(GE_context* ac, T0* C);
/* GEANT_ARGUMENT_VARIABLES.has */
extern T1 T41f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_VARIABLES.has */
extern T1 T36f32(GE_context* ac, T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.has */
extern T1 T32f49(GE_context* ac, T0* C, T0* a1);
extern T0* GE_ma39(T6 c, T6 n, ...);
extern T0* GE_ma263(T6 c, T6 n, ...);
extern T0* GE_ma228(T6 c, T6 n, ...);
extern T0* GE_ma571(T6 c, T6 n, ...);
extern T0* GE_ma545(T6 c, T6 n, ...);
extern T0* GE_mt27(T6 a1, T6 a2, T6 a3, T0* a4, T0* a5, T0* a6, T0* a7, T0* a8, T0* a9, T6 a10, T1 a11);
extern T0* GE_mt618(T0* a1);
extern T0* GE_mt670(T0* a1);
extern T0* ge133ov5124;
extern T0* ge169ov3427;
extern T0* ge223ov6737;
extern T0* ge233ov8366;
extern T0* ge154ov9749;
extern T0* ge154ov9750;
extern T0* ge156ov3735;
extern T0* ge171ov3427;
extern T0* ge177ov3779;
extern T0* ge177ov3780;
extern T0* ge162ov4361;
extern T0* ge162ov4360;
extern T0* ge174ov3779;
extern T0* ge174ov3780;
extern T0* ge1509ov5661;
extern T0* ge1509ov5660;
extern T0* ge309ov11935;
extern T0* ge160ov3427;
extern T0* ge1361ov3410;
extern T0* ge424ov10195;
extern T0* ge155ov3938;
extern T0* ge457ov9886;
extern T0* ge260ov3427;
extern T0* ge1516ov6130;
extern T0* ge1516ov6092;
extern T0* ge1516ov6090;
extern T0* ge1516ov6131;
extern T0* ge1516ov6103;
extern T0* ge1516ov6102;
extern T0* ge1516ov6113;
extern T0* ge1516ov6107;
extern T0* ge1516ov6106;
extern T0* ge1516ov6105;
extern T0* ge1516ov6111;
extern T0* ge1516ov6110;
extern T0* ge1516ov6112;
extern T0* ge1516ov6089;
extern T0* ge1516ov6115;
extern T0* ge1516ov6124;
extern T0* ge1519ov5822;
extern T0* ge1519ov5820;
extern T0* ge1519ov5821;
extern T0* ge1516ov6125;
extern T0* ge1516ov6126;
extern T0* ge1516ov6129;
extern T0* ge1516ov6127;
extern T0* ge1516ov6128;
extern T0* ge1516ov6122;
extern T0* ge1512ov8013;
extern T0* ge1512ov8014;
extern T0* ge1516ov6095;
extern T0* ge1516ov6118;
extern T0* ge1516ov6138;
extern T0* ge1516ov6139;
extern T0* ge1516ov6140;
extern T0* ge1516ov6133;
extern T0* ge1516ov6116;
extern T0* ge1516ov6117;
extern T0* ge1516ov6119;
extern T0* ge1516ov6123;
extern T0* ge1466ov6429;
extern T0* ge177ov3790;
extern T0* ge174ov3790;
extern T0* ge103ov3105;
extern T0* ge106ov3392;
extern T0* ge106ov3399;
extern T0* ge193ov1955;
extern T0* ge106ov3395;
extern T0* ge106ov3402;
extern T0* ge106ov3393;
extern T0* ge106ov3400;
extern T0* ge106ov3394;
extern T0* ge106ov3401;
extern T0* ge106ov3396;
extern T0* ge106ov3403;
extern T0* ge106ov3397;
extern T0* ge106ov3404;
extern T0* ge103ov3100;
extern T0* ge103ov3099;
extern T0* ge103ov3107;
extern T0* ge103ov3106;
extern T0* ge428ov10955;
extern T0* ge428ov10992;
extern T0* ge428ov10977;
extern T0* ge428ov10970;
extern T0* ge428ov10980;
extern T0* ge428ov10973;
extern T0* ge428ov10981;
extern T0* ge428ov10990;
extern T0* ge428ov10983;
extern T0* ge428ov10979;
extern T0* ge428ov10967;
extern T0* ge428ov10968;
extern T0* ge428ov10982;
extern T0* ge428ov10969;
extern T0* ge428ov10956;
extern T0* ge428ov10957;
extern T0* ge428ov10958;
extern T0* ge428ov10964;
extern T0* ge428ov10966;
extern T0* ge428ov10961;
extern T0* ge428ov10986;
extern T0* ge428ov10985;
extern T0* ge428ov10962;
extern T0* ge428ov10963;
extern T0* ge428ov10960;
extern T0* ge428ov10959;
extern T0* ge42ov9408;
extern T0* ge157ov3917;
extern T0* ge155ov3940;
extern T0* ge2312ov9810;
extern T0* ge2312ov9811;
extern T0* ge154ov9748;
extern T0* ge1523ov7233;
extern T0* ge1523ov7234;
extern T0* ge1514ov8374;
extern T0* ge1514ov8376;
extern T0* ge1446ov8072;
extern T0* ge1446ov8073;
extern T0* ge104ov5076;
extern T0* ge104ov5077;
extern T0* ge104ov5078;
extern T0* ge104ov5075;
extern T0* ge1514ov8373;
extern T0* ge1514ov8375;
extern T0* ge294ov3408;
extern T0* ge280ov3408;
extern T0* ge286ov3408;
extern T0* ge285ov3408;
extern T0* ge284ov3408;
extern T0* ge275ov3408;
extern T0* ge274ov3408;
extern T0* ge291ov3408;
extern T0* ge304ov3408;
extern T0* ge1365ov3408;
extern T0* ge1370ov3408;
extern void GE_init_const1(void);
extern void GE_init_const2(void);
extern void GE_init_const(void);

#ifdef __cplusplus
}
#endif


/*
	description:

		"Part of ISE Eiffel runtime. Needed to compile the EiffelCOM library."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_CECIL_H
#define EIF_CECIL_H

#ifdef __cplusplus
extern "C" {
#endif

typedef void (*EIF_PROCEDURE)(EIF_REFERENCE, ...);
#define EIF_PROC EIF_PROCEDURE
typedef EIF_INTEGER_32 (*EIF_INTEGER_32_FUNCTION)(EIF_REFERENCE, ...); /* Returns an Eiffel Integer 32 bits */
#define EIF_INTEGER_FUNCTION EIF_INTEGER_32_FUNCTION
typedef EIF_REFERENCE (*EIF_REFERENCE_FUNCTION)(EIF_REFERENCE, ...); /* Returns an Eiffel Reference */
typedef EIF_POINTER (*EIF_POINTER_FUNCTION)(EIF_REFERENCE, ...); /* Returns an Eiffel Pointer */
typedef EIF_BOOLEAN (*EIF_BOOLEAN_FUNCTION)(EIF_REFERENCE, ...); /* Returns an Eiffel Boolean */
typedef EIF_CHARACTER_8 (*EIF_CHARACTER_8_FUNCTION)(EIF_REFERENCE, ...); /* Returns char */
#define EIF_CHARACTER_FUNCTION EIF_CHARACTER_8_FUNCTION
typedef EIF_REAL_64 (*EIF_REAL_64_FUNCTION)(EIF_REFERENCE, ...); /* Returns an Eiffel Double */
#define EIF_DOUBLE_FUNCTION EIF_REAL_64_FUNCTION
typedef EIF_REAL_32 (*EIF_REAL_32_FUNCTION)(EIF_REFERENCE, ...); /* Returns an Eiffel Real */
#define EIF_REAL_FUNCTION EIF_REAL_32_FUNCTION

extern EIF_PROCEDURE eif_procedure(char* rout, EIF_TYPE_ID cid);
#define eif_proc eif_procedure /* Use `eif_procedure' instead */
extern EIF_INTEGER_FUNCTION eif_integer_function(char* rout, EIF_TYPE_ID cid);
extern EIF_REFERENCE_FUNCTION eif_reference_function(char* rout, EIF_TYPE_ID cid);
extern EIF_POINTER_FUNCTION eif_pointer_function(char* rout, EIF_TYPE_ID cid);
extern EIF_BOOLEAN_FUNCTION eif_boolean_function(char* rout, EIF_TYPE_ID cid);
extern EIF_REAL_64_FUNCTION eif_real_64_function(char* rout, EIF_TYPE_ID cid);
#define eif_double_function(rout,cid) eif_real_64_function((rout),(cid))
extern EIF_REAL_32_FUNCTION eif_real_32_function(char* rout, EIF_TYPE_ID cid);
#define eif_real_function(rout,cid) eif_real_32_function((rout),(cid))
extern EIF_CHARACTER_8_FUNCTION eif_character_8_function(char* rout, EIF_TYPE_ID cid);
#define eif_character_function(rout,cid) eif_character_8_function((rout),(cid))
extern EIF_OBJECT eif_create(EIF_TYPE_ID cid);
extern EIF_TYPE_ID eif_type_id(char* type_string);
extern EIF_INTEGER eifaddr_offset(EIF_REFERENCE object, char *name, int * const ret);
#define eif_string(s) RTMS(s)
#define makestr(s,c) RTMS_EX((s),(c))
#define eifaddr(object,name,ret) ((void *) ((char *) object + eifaddr_offset (object, name, ret)))
#define eif_field(object,name,type) *(type *)(eifaddr(object,name, NULL)) /* Obsolete. Use "eif_attribute" instead. */
#define eif_attribute(object,name,type,ret) *(type *)(eifaddr(object,name,ret)) /* Returns the attribute of an object. Return status in "ret".*/

/* Miscellaneous useful functions. */

/* Make an Eiffel array from a C array:
 * `eif_array' is the direct reference to the Eiffel array.
 * `c_array' is the C array.
 * `nelts' the number of elements to copy in the eiffel array, it has to
 * be equal to `eif_array.count'.
 * type is an Eiffel type.
 */
#define eif_make_from_c(eif_array, c_array, nelts, type) \
	{ \
		EIF_REFERENCE area = eif_field (eif_array, \
										"area", EIF_REFERENCE); \
		memcpy ((type *) area, c_array, nelts * sizeof (type));\
	}

#define eif_type eiftype /* Dynamic type ID */
extern EIF_TYPE_ID eiftype(EIF_OBJECT object); /* Give dynamic type of EIF_OBJECT. Obsolete, use "eif_type_by_object". */
extern EIF_TYPE_ID eif_type_by_reference (EIF_REFERENCE object);
extern EIF_TYPE_INDEX eif_gen_param_id(EIF_TYPE_INDEX dftype, uint32_t pos);

#ifdef __cplusplus
}
#endif

#endif
/*
	description:

		"Part of ISE Eiffel runtime. Needed to compile the EiffelCOM library."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_PLUG_H
#define EIF_PLUG_H

#ifdef __cplusplus
extern "C" {
#endif

#ifndef EIF_THREADS
extern int nstcall;	/* Nested call global variable: signals a nested call and
					 * trigger an invariant check in generated C routines  */
#endif

#ifdef __cplusplus
}
#endif

#endif
/*
	description:

		"C functions used to implement class EXCEPTIONS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_EXCEPT_H
#define EIF_EXCEPT_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_EXCEPTION_H
#include "ge_exception.h"
#endif
#include <errno.h>

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Predefined exception codes.
 */
#define EN_VOID		GE_EX_VOID			/* Feature applied to void reference */
#define EN_MEM		GE_EX_MEM			/* No more memory */
#define EN_PRE		GE_EX_PRE			/* Pre-condition violated */
#define EN_POST		GE_EX_POST			/* Post-condition violated */
#define EN_FLOAT	GE_EX_FLOAT			/* Floating point exception (signal SIGFPE) */
#define EN_CINV		GE_EX_CINV			/* Class invariant violated */
#define EN_CHECK	GE_EX_CHECK			/* Assertion violated */
#define EN_FAIL		GE_EX_FAIL			/* Routine failure */
#define EN_WHEN		GE_EX_WHEN			/* Unmatched inspect value */
#define EN_VAR		GE_EX_VAR			/* Non-decreasing loop variant */
#define EN_LINV		GE_EX_LINV			/* Loop invariant violated */
#define EN_SIG		GE_EX_SIG			/* Operating system signal */
#define EN_BYE		GE_EX_BYE			/* Eiffel run-time panic */
#define EN_RESC		GE_EX_RESC			/* Exception in rescue clause */
#define EN_OMEM		GE_EX_OMEM			/* Out of memory (cannot be ignored) */
#define EN_RES		GE_EX_RES			/* Resumption failed (retry did not succeed) */
#define EN_CDEF		GE_EX_CDEF			/* Create on deferred */
#define EN_EXT		GE_EX_EXT			/* External event */
#define EN_VEXP		GE_EX_VEXP			/* Void assigned to expanded */
#define EN_HDLR		GE_EX_HDLR			/* Exception in signal handler */
#define EN_IO		GE_EX_IO			/* I/O error */
#define EN_SYS		GE_EX_SYS			/* Operating system error */
#define EN_RETR		GE_EX_RETR			/* Retrieval error */
#define EN_PROG		GE_EX_PROG			/* Developer exception */
#define EN_FATAL	GE_EX_FATAL			/* Eiffel run-time fatal error */
#define EN_DOL		GE_EX_DOL			/* $ applied to melted feature */
#define EN_ISE_IO	GE_EX_ISE_IO		/* I/O error raised by the ISE Eiffel runtime */
#define EN_COM		GE_EX_COM			/* COM error raised by EiffelCOM runtime */
#define EN_RT_CHECK	GE_EX_RT_CHECK		/* Runtime check error such as out-of-bound array access */
#define EN_OLD		GE_EX_OLD			/* Old violation */
#define EN_SEL		GE_EX_SEL			/* Serialization failure */
#define EN_DIRTY	GE_EX_DIRTY			/* SCOOP processor dirty exception. */
#define EN_NEX		GE_EX_NEX			/* Number of internal exceptions */

/*
 * Raise an Eiffel exception.
 */
extern void eraise(const char* name, long code);

/*
 * Raise an Eiffel exception of the given code with no associated tag.
 */
extern void xraise(int code);

/*
 * Raise an "Operating system error" exception.
 */
extern void esys(void);

/*
 * As a special case, an I/O error is raised when a system call which is I/O bound fails.
 */
extern void eise_io(const char* tag);

/*
 * Raise a "No more memory" exception.
 */
extern void enomem(void);

/*
 * Raise EiffelCOM exception.
 */
extern void com_eraise(const char* tag, long num);

/*
 * Terminate execution with exit status `code',
 * without triggering an exception.
 */
extern void esdie(int code);

/*
 * Exception tag associated with `code'.
 * This is a duplication from Eiffel classes, but still used for trace printing and in EiffelCom.
 */
extern EIF_REFERENCE eename(long except);

/*
 * Is exception `ex' defined?
 * Used in EiffelCOM.
 */
extern char eedefined(long ex);

/*
 * Enable/diable printing of the exception trace.
 * Per thead information.
 */
extern void eetrace(char b);

/*
 * Is current execution during rescue?
 */
extern EIF_BOOLEAN eif_is_in_rescue(void);

#ifdef EIF_WINDOWS
/*
 * Set default exception handler.
 */
extern void set_windows_exception_filter();
#endif

/*
 * Used in EiffelCOM.
 */
#define echval GE_current_context()->exception_code
#define echtg GE_current_context()->exception_tag

#ifdef __cplusplus
}
#endif

#endif
/*
	description:

		"C functions used to implement class REAL"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_REAL_H
#define GE_REAL_H

#include <math.h>

#ifndef GE_power
#define GE_power(x,y) pow((x),(y))
#endif
#define GE_ceiling(x) ceil(x)
#define GE_floor(x) floor(x)

extern EIF_NATURAL_32 GE_real_32_to_bits (EIF_REAL_32 v);
extern EIF_NATURAL_64 GE_real_64_to_bits (EIF_REAL_64 v);
extern EIF_REAL_32 GE_real_32_from_bits (EIF_NATURAL_32 v);
extern EIF_REAL_64 GE_real_64_from_bits (EIF_NATURAL_64 v);

#define GE_real_32_is_nan(v) ((v)!=(v) ? EIF_TRUE : ((GE_real_32_to_bits(v) & ~GE_nat32(0x80000000)) > GE_nat32(0x7FF00000)))
#define GE_real_64_is_nan(v) ((v)!=(v) ? EIF_TRUE : ((GE_real_64_to_bits(v) & ~GE_nat64(0x8000000000000000)) > GE_nat64(0x7FF0000000000000)))
#define GE_real_32_is_negative_infinity(v) (GE_real_32_to_bits(v) == GE_nat32(0xFF800000))
#define GE_real_64_is_negative_infinity(v) (GE_real_64_to_bits(v) == GE_nat64(0xFFF0000000000000))
#define GE_real_32_is_positive_infinity(v) (GE_real_32_to_bits(v) == GE_nat32(0x7F800000))
#define GE_real_64_is_positive_infinity(v) (GE_real_64_to_bits(v) == GE_nat64(0x7FF0000000000000))
#define GE_real_32_nan GE_real_32_from_bits(GE_nat32(0x7FC00000))
#define GE_real_64_nan GE_real_64_from_bits(GE_nat64(0x7FF8000000000000))
#define GE_real_32_negative_infinity GE_real_32_from_bits(GE_nat32(0xFF800000))
#define GE_real_64_negative_infinity GE_real_64_from_bits(GE_nat64(0xFFF0000000000000))
#define GE_real_32_positive_infinity GE_real_32_from_bits(GE_nat32(0x7F800000))
#define GE_real_64_positive_infinity GE_real_64_from_bits(GE_nat64(0x7FF0000000000000))

#endif
/*
	description:

		"C functions used to implement class FILE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_FILE_H
#define EIF_FILE_H

#include <time.h>
#include <sys/stat.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Let's define the stat structure for our platforms. */
/* The definition is the same for both ANSI and Unicode versions on Windows. */
#ifdef EIF_WINDOWS
#	ifdef EIF_64_BITS
#		define rt_stat_buf	struct _stat64
#	else
#		define rt_stat_buf	struct _stat64i32
#	endif
#else
#	define rt_stat_buf		struct stat
#endif

/*
 * Create directory `dirname'.
 */
extern void eif_file_mkdir(EIF_FILENAME dirname);

/*
 * Rename file `from' into `to'.
 */
extern void eif_file_rename(EIF_FILENAME from, EIF_FILENAME  to);

/*
 * Link file `from' into `to'.
 */
extern void eif_file_link(EIF_FILENAME from, EIF_FILENAME to);

/*
 * Delete file or directory `name'.
 */
extern void eif_file_unlink(EIF_FILENAME name);

/*
 * Open file `name' with the corresponding type `how'.
 */
extern EIF_POINTER eif_file_open(EIF_FILENAME name, int how);

/*
 * Open file `fd' with the corresponding type `how'.
 */
extern EIF_POINTER eif_file_dopen(int fd, int how);

/*
 * Reopen file `name' with the corresponding type `how' and substitute that
 * to the old stream described by `old'. This is useful to redirect 'stdout'
 * to another place, for instance.
 */
extern EIF_POINTER eif_file_reopen( EIF_FILENAME name, int how, FILE *old);

/*
 * Close the file.
 */
extern void eif_file_close(FILE *fp);

/*
 * Flush data held in stdio buffer.
 */
extern void eif_file_flush(FILE *fp);

/*
 * Return the associated file descriptor.
 */
extern EIF_INTEGER eif_file_fd(FILE *f);

/*
 * Get a character from `f'.
 */
extern EIF_CHARACTER_8 eif_file_gc(FILE *f);

/*
 * Get a string from `f' and fill it into `s' (at most `bound' characters),
 * with `start' being the amount of bytes already stored within s. This
 * means we really have to read (bound - start) characters.
 */
extern EIF_INTEGER eif_file_gs(FILE *f, char *s, EIF_INTEGER bound, EIF_INTEGER start);

/*
 * Read min (bound, remaining bytes in file) characters into `s' and
 * return the number of characters read.
 */
extern EIF_INTEGER eif_file_gss(FILE *f, char *s, EIF_INTEGER bound);

/*
 * Get a word from `f' and fill it into `s' (at most `bound' characters),
 * with `start' being the amount of bytes already stored within s. This
 * means we really have to read (bound - start) characters. Any leading
 * spaces are skipped.
 */
extern EIF_INTEGER eif_file_gw(FILE *f, char *s, EIF_INTEGER bound, EIF_INTEGER start);

/*
 * Look ahead one character. If EOF, return 0.
 */
extern EIF_CHARACTER_8 eif_file_lh(FILE *f);

/*
 * Size of file `fp'.
 */
extern EIF_INTEGER eif_file_size(FILE *fp);

/*
 * Read upto next input line.
 */
extern void eif_file_tnil(FILE *f);

/*
 * Current position within file.
 */
extern EIF_INTEGER eif_file_tell(FILE *f);

/*
 * Touch file `name' by setting both access and modification time to the
 * current time stamp. This external function exists only because there
 * is no way within UNIX_FILE to get the current time stamp. Otherwise,
 * we could simply call file_utime.
 */
extern void eif_file_touch(EIF_FILENAME name);

/*
 * Modify the modification and/or the access time stored in the file's
 * inode. The 'how' parameter tells which attributes should be set.
 */
extern void eif_file_utime(EIF_FILENAME name, time_t stamp, int how);

/*
 * This is an encapsulation of the stat() system call. The routine either
 * succeeds and returns or fails and raises the appropriate exception.
 */
extern int eif_file_stat(EIF_FILENAME path, rt_stat_buf *buf, int follow);

/*
 * Change permissions of file `name', using an interface like chmod(1).
 * The flag is true if permissions are to be added, 0 to remove them.
 */
extern void eif_file_perm(EIF_FILENAME name, char *who, char *what, int flag);

/*
 * Change permission mode on file `path'.
 */
extern void eif_file_chmod(EIF_FILENAME path, int mode);

/*
 * Change the owner of the file to `uid'.
 */
extern void eif_file_chown(EIF_FILENAME name, int uid);

/*
 * Change the group of the file to `gid'.
 */
extern void eif_file_chgrp(EIF_FILENAME name, int gid);

/*
 * Put new_line onto `f'.
 */
extern void eif_file_tnwl(FILE *f);

/*
 * Append a copy of `other' to `f'.
 */
extern void eif_file_append(FILE *f, FILE *other, EIF_INTEGER l);

/*
 * Write string `str' on `f'.
 */
extern void eif_file_ps(FILE *f, char *str, EIF_INTEGER len);

/*
 * Write character `c' on `f'.
 */
extern void eif_file_pc(FILE *f, char c);

/*
 * Go to absolute position `pos' counted from start.
 */
extern void eif_file_go(FILE *f, EIF_INTEGER pos);

/*
 * Go to absolute position `pos' counted from end.
 */
extern void eif_file_recede(FILE *f, EIF_INTEGER pos);

/*
 * Go to absolute position `pos' counted from current position.
 */
extern void eif_file_move(FILE *f, EIF_INTEGER pos);

/*
 * End of file.
 */
extern EIF_BOOLEAN eif_file_feof(FILE *fp);

/*
 * Test whether file exists or not. If `name' represents a symbolic link,
 * it will check that pointed file does exist.
 */
extern EIF_BOOLEAN eif_file_exists(EIF_FILENAME name);

/*
 * Test whether file exists or not without following the symbolic link
 * if `name' represents one.
 */
extern EIF_BOOLEAN eif_file_path_exists(EIF_FILENAME name);

/*
 * Check whether access permission `op' are possible on file `name' using
 * real UID and real GID. This is probably only useful to setuid or setgid
 * programs.
 */
extern EIF_BOOLEAN eif_file_access(EIF_FILENAME name, EIF_INTEGER op);

/*
 * Check whether the file `path' may be created: we need write permissions
 * in the parent directory and there must not be any file bearing that name
 * with no write permissions...
 */
extern EIF_BOOLEAN eif_file_creatable(EIF_FILENAME path, EIF_INTEGER nbytes);

/*
 * Get an integer from `f'.
 */
extern EIF_INTEGER eif_file_gi(FILE *f);

/*
 * Get a real from `f'.
 */
extern EIF_REAL_32 eif_file_gr(FILE *f);

/*
 * Get a double from `f'.
 */
extern EIF_REAL_64 eif_file_gd(FILE *f);

/*
 * Write `number' on `f'.
 */
extern void eif_file_pi(FILE *f, EIF_INTEGER number);

/*
 * Write `number' on `f'.
 */
extern void eif_file_pr(FILE *f, EIF_REAL_32 number);

/*
 * Write double `val' onto `f'.
 */
extern void eif_file_pd(FILE *f, EIF_REAL_64 val);

/*
 * Size of the stat structure. This is used by the Eiffel side to create
 * the area (special object) which will play the role of a stat buffer
 * structure.
 */
extern EIF_INTEGER stat_size(void);

/*
 * Check file permissions using effective UID and effective GID. The
 * current permission mode is held in the st_mode field of the stat()
 * buffer structure `buf'.
 */
extern EIF_BOOLEAN eif_file_eaccess(rt_stat_buf *buf, int op);

/*
 * Perform the field dereferencing from the appropriate stat structure,
 * which Eiffel cannot do directly.
 */
extern EIF_INTEGER eif_file_info(rt_stat_buf *buf, int op);

/*
 * Return the Eiffel string filled in with the name associated with `uid'
 * if found in /etc/passwd. Otherwise, return fill it in with the numeric
 * value.
 */
extern EIF_REFERENCE eif_file_owner(int uid);

/*
 * Return the Eiffel string filled in with the name associated with `gid'
 * if found in /etc/group. Otherwise, return fill it in with the numeric
 * value.
 */
extern EIF_REFERENCE eif_file_group(int gid);

/*
 * Get an integer from `f'.
 */
extern EIF_INTEGER eif_file_gib(FILE* f);

/*
 * Get a real from `f'.
 */
extern EIF_REAL_32 eif_file_grb(FILE* f);

/*
 * Get a double from `f'.
 */
extern EIF_REAL_64 eif_file_gdb(FILE* f);

/*
 * Open file `name' with the corresponding type `how'.
 */
extern EIF_POINTER eif_file_binary_open(EIF_FILENAME name, int how);

/*
 * Open file `fd' with the corresponding type `how'.
 */
extern EIF_POINTER eif_file_binary_dopen(int fd, int how);

/*
 * Reopen file `name' with the corresponding type `how' and substitute that
 * to the old stream described by `old'. This is useful to redirect 'stdout'
 * to another place, for instance.
 */
extern EIF_POINTER eif_file_binary_reopen(EIF_FILENAME name, int how, FILE* old);

/*
 * Write `number' on `f'.
 */
extern void eif_file_pib(FILE* f, EIF_INTEGER number);

/*
 * Write `number' on `f'.
 */
extern void eif_file_prb(FILE* f, EIF_REAL_32 number);

/*
 * Write double `val' onto `f'.
 */
extern void eif_file_pdb(FILE* f, EIF_REAL_64 val);

/*
 * Modification time of a file.
 * Seconds since epoch (01 January 1970) in UTC or 0 if time cannot be retrieved.
 */
extern EIF_INTEGER eif_file_date (EIF_FILENAME  name);

/*
 * Access time of a file.
 * Seconds since epoch (01 January 1970) in UTC or 0 if time cannot be retrieved.
 */
extern EIF_INTEGER eif_file_access_date (EIF_FILENAME  name);

#ifdef __cplusplus
}
#endif

#endif
/*
	description:

		"C functions used to implement class CONSOLE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_CONSOLE_H
#define EIF_CONSOLE_H

#ifdef __cplusplus
extern "C" {
#endif

extern EIF_POINTER console_def(EIF_INTEGER file);
extern EIF_BOOLEAN console_eof(FILE* fp);
extern EIF_CHARACTER_8 console_separator(FILE* f);
extern void console_ps(FILE* f, char* str, EIF_INTEGER len);
extern void console_pr(FILE* f, EIF_REAL_32 number);
extern void console_pc(FILE* f, EIF_CHARACTER_8 c);
extern void console_pd(FILE* f, EIF_REAL_64 val);
extern void console_pi(FILE* f, EIF_INTEGER number);
extern void console_tnwl(FILE* f);
extern EIF_CHARACTER_8 console_readchar(FILE* f);
extern EIF_REAL_32 console_readreal(FILE* f);
extern EIF_INTEGER console_readint(FILE* f);
extern EIF_REAL_64 console_readdouble(FILE* f);
extern EIF_INTEGER console_readword(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start);
extern EIF_INTEGER console_readline(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start);
extern void console_next_line(FILE* f);
extern EIF_INTEGER console_readstream(FILE* f, char* s, EIF_INTEGER bound);
extern void console_file_close (FILE* f);

#ifdef __cplusplus
}
#endif

#endif
/*
	description:

		"C functions used to implement Thread support"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_THREADS_H
#define EIF_THREADS_H

#ifndef EIF_CECIL_H
#include "eif_cecil.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifndef EIF_THREADS

/*
	Empty stubs for EiffelThread library so that it may be compiled against a non-multithreaded run-time.
*/

/* THREAD_ENVIRONMENT */
#define eif_thr_thread_id() NULL

/* THREAD_CONTROL */
#define eif_thr_yield()
#define eif_thr_join_all()

/* THREAD */
#define eif_thr_create_with_attr(current_obj, init_func, attr)
#define eif_thr_wait(term)
#define eif_thr_wait_with_timeout(term,tms) EIF_FALSE
#define eif_thr_last_thread() NULL
#define eif_thr_exit()

/* THREAD_ATTRIBUTES */
#define eif_thr_default_priority() 0
#define eif_thr_min_priority() 0
#define eif_thr_max_priority() 0

/* MUTEX */
#define eif_thr_mutex_create() NULL
#define eif_thr_mutex_lock(a_mutex_pointer)
#define eif_thr_mutex_trylock(a_mutex_pointer) EIF_FALSE
#define eif_thr_mutex_unlock(a_mutex_pointer)
#define eif_thr_mutex_destroy(a_mutex_pointer)

/* CONDITION_VARIABLE */
#define eif_thr_cond_create() NULL
#define eif_thr_cond_broadcast(a_cond_ptr)
#define eif_thr_cond_signal(a_cond_ptr)
#define eif_thr_cond_wait(a_cond_ptr,a_mutex_ptr)
#define eif_thr_cond_wait_with_timeout(a_cond_ptr,a_mutex_ptr,a_timeout) 0
#define eif_thr_cond_destroy(a_mutex_ptr)

/* SEMAPHORE */
#define eif_thr_sem_create(count) NULL
#define eif_thr_sem_wait(a_sem_pointer)
#define eif_thr_sem_post(a_sem_pointer)
#define eif_thr_sem_trywait(a_sem_pointer) EIF_FALSE
#define eif_thr_sem_destroy(a_sem_pointer)

/* READ_WRITE_LOCK */
#define eif_thr_rwl_create() NULL
#define eif_thr_rwl_rdlock(an_item)
#define eif_thr_rwl_unlock(an_item)
#define eif_thr_rwl_wrlock(an_item)
#define eif_thr_rwl_destroy(an_item)

#define eif_thr_sleep(nanoseconds)

#else

/* THREAD_ENVIRONMENT */
#define eif_thr_thread_id() GE_thread_id()

/* THREAD_CONTROL */
#define eif_thr_yield() GE_thread_yield()
#define eif_thr_join_all() GE_thread_join_all()

/* THREAD */
#define eif_thr_create_with_attr(current_obj,init_func,attr) GE_thread_create_with_attr((current_obj),(init_func),(EIF_THR_ATTR_TYPE*)(attr))
#define eif_thr_wait(term) GE_thread_wait(term)
#define eif_thr_wait_with_timeout(term,tms) GE_thread_wait_with_timeout((term),(tms))
#define eif_thr_last_thread() GE_last_thread_created()
#define eif_thr_exit() GE_thread_exit()

/* THREAD_ATTRIBUTES */
#define eif_thr_default_priority() GE_thread_default_priority()
#define eif_thr_min_priority() GE_thread_min_priority()
#define eif_thr_max_priority() GE_thread_max_priority()

/* MUTEX */
#define eif_thr_mutex_create() GE_mutex_create()
#define eif_thr_mutex_lock(a_mutex_pointer) GE_mutex_lock(a_mutex_pointer)
#define eif_thr_mutex_trylock(a_mutex_pointer) GE_mutex_trylock(a_mutex_pointer)
#define eif_thr_mutex_unlock(a_mutex_pointer) GE_mutex_unlock(a_mutex_pointer)
#define eif_thr_mutex_destroy(a_mutex_pointer) GE_mutex_destroy(a_mutex_pointer)

/* CONDITION_VARIABLE */
#define eif_thr_cond_create() NULL
#define eif_thr_cond_broadcast(a_cond_ptr)
#define eif_thr_cond_signal(a_cond_ptr)
#define eif_thr_cond_wait(a_cond_ptr,a_mutex_ptr)
#define eif_thr_cond_wait_with_timeout(a_cond_ptr,a_mutex_ptr,a_timeout) 0
#define eif_thr_cond_destroy(a_mutex_ptr)

/* SEMAPHORE */
#define eif_thr_sem_create(count) NULL
#define eif_thr_sem_wait(a_sem_pointer)
#define eif_thr_sem_post(a_sem_pointer)
#define eif_thr_sem_trywait(a_sem_pointer) EIF_FALSE
#define eif_thr_sem_destroy(a_sem_pointer)

/* READ_WRITE_LOCK */
#define eif_thr_rwl_create() NULL
#define eif_thr_rwl_rdlock(an_item)
#define eif_thr_rwl_unlock(an_item)
#define eif_thr_rwl_wrlock(an_item)
#define eif_thr_rwl_destroy(an_item)

#define eif_thr_sleep(nanoseconds)

#endif

#ifdef __cplusplus
}
#endif

#endif
/*
	description:

		"Part of ISE Eiffel runtime. Needed to compile the EiffelCOM library."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2010-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_GLOBALS_H
#define EIF_GLOBALS_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef EIF_THREADS_H
#include "eif_threads.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

#define EIF_GET_CONTEXT
#define GTCX EIF_GET_CONTEXT

#ifdef __cplusplus
}
#endif

#endif
/*
	description:

		"C declarations for the ISE Eiffel runtime."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_EIFFEL_H
#define EIF_EIFFEL_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef EIF_GLOBALS_H
#include "eif_globals.h"
#endif
#ifndef EIF_EXCEPT_H
#include "eif_except.h"
#endif

#endif
/*
	description:

		"C functions used to implement class DIRECTORY"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_DIR_H
#define EIF_DIR_H

#ifdef __cplusplus
extern "C" {
#endif

extern EIF_POINTER eif_dir_open (EIF_FILENAME dirname);
extern EIF_POINTER eif_dir_next (EIF_POINTER dir);
extern EIF_POINTER eif_dir_rewind (EIF_POINTER d, EIF_FILENAME dir_name);
extern void eif_dir_close (EIF_POINTER dir);
extern EIF_BOOLEAN eif_dir_exists (EIF_FILENAME dirname);
extern EIF_BOOLEAN eif_dir_is_readable (EIF_FILENAME dirname);
extern EIF_BOOLEAN eif_dir_is_writable (EIF_FILENAME dirname);
extern EIF_BOOLEAN eif_dir_is_executable (EIF_FILENAME dirname);
extern EIF_BOOLEAN eif_dir_is_deletable (EIF_FILENAME name);
extern EIF_CHARACTER_8 eif_dir_separator(void);
extern EIF_INTEGER eif_dir_current (EIF_FILENAME a_buffer, EIF_INTEGER a_count);
extern EIF_INTEGER eif_chdir (EIF_FILENAME path);

#ifdef __cplusplus
}
#endif

#endif
/*
	description:

		"C functions used to implement class COM_FAILURE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_COM_FAILURE_H
#define GE_COM_FAILURE_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_EIFFEL_H
#include "ge_eiffel.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

extern EIF_INTEGER GE_ccom_hresult(EIF_POINTER an_exception_code);

extern EIF_INTEGER GE_ccom_hresult_code(EIF_INTEGER an_hresult);

extern EIF_INTEGER GE_ccom_hresult_facility(EIF_INTEGER an_hresult);

/*
 * Get text from error `a_code'. It is up to the caller to free
 * the returned buffer using `GE_ccom_local_free'.
 */
extern EIF_POINTER GE_ccom_error_text(EIF_INTEGER a_code);

/*
 * Number of characters in `ptr'.
 */
extern EIF_INTEGER_32 GE_ccom_strlen(EIF_POINTER ptr);

/*
 * Number of bytes occupied by a TCHAR.
 */
extern EIF_INTEGER_32 GE_ccom_character_size();

/*
 * Free `a_ptr' using LocalFree.
 */
extern void GE_ccom_local_free(EIF_POINTER a_ptr);

#ifdef __cplusplus
}
#endif

#endif
/*
	description:

		"C functions used to access DLLs"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_DLL_H
#define GE_DLL_H

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_WINDOWS

#include <windows.h>

/* DLL declarations */
#define GE_load_dll(name) LoadLibraryA((LPCSTR)name)

#endif

#ifdef __cplusplus
}
#endif

#endif
/*
	description:

		"C functions used to implement class EXECUTION_ENVIRONMENT"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_MISC_H
#define EIF_MISC_H

#ifdef __cplusplus
extern "C" {
#endif

extern EIF_INTEGER eif_system(EIF_NATIVE_CHAR* s);
extern void eif_system_asynchronous(EIF_NATIVE_CHAR* cmd);
extern void eif_sleep(EIF_INTEGER_64);

#ifdef EIF_WINDOWS
/* DLL declarations */
#define eif_load_dll(name) GE_load_dll(name)
#endif

#ifdef __cplusplus
}
#endif

#endif
#include <string.h>
#include <stdlib.h>
