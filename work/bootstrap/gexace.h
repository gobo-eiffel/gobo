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

/* GEXACE */
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

/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND] */
typedef struct S29 T29;

/* KL_ARGUMENTS */
typedef struct S30 T30;

/* DS_HASH_TABLE [STRING_8, STRING_8] */
typedef struct S31 T31;

/* UC_STRING_EQUALITY_TESTER */
typedef struct S32 T32;

/* DS_LINKED_LIST [GEXACE_COMMAND] */
typedef struct S34 T34;

/* ET_XACE_DEFAULT_ERROR_HANDLER */
typedef struct S35 T35;

/* KL_EXCEPTIONS */
typedef struct S37 T37;

/* DS_LINKED_LIST_CURSOR [STRING_8] */
typedef struct S38 T38;

/* DS_PAIR [STRING_8, STRING_8] */
typedef struct S39 T39;

/* DS_LINKED_LIST [STRING_8] */
typedef struct S40 T40;

/* UT_USAGE_MESSAGE */
typedef struct S41 T41;

/* GEXACE_SYSTEM_COMMAND */
typedef struct S43 T43;

/* GEXACE_LIBRARY_COMMAND */
typedef struct S47 T47;

/* GEXACE_VALIDATE_COMMAND */
typedef struct S48 T48;

/* ET_XACE_XACE_GENERATOR */
typedef struct S50 T50;

/* ET_XACE_ACE_GENERATOR */
typedef struct S51 T51;

/* ET_XACE_ECF_GENERATOR */
typedef struct S52 T52;

/* DS_LINKED_LIST [ET_XACE_GENERATOR] */
typedef struct S53 T53;

/* VOID_TARGET */
typedef struct S54 T54;

/* [attached] TYPE [VOID_TARGET] */
#define T55 EIF_TYPE_OBJ

/* ROUTINE_FAILURE */
typedef struct S56 T56;

/* [attached] TYPE [ROUTINE_FAILURE] */
#define T57 EIF_TYPE_OBJ

/* OLD_VIOLATION */
typedef struct S58 T58;

/* [attached] TYPE [OLD_VIOLATION] */
#define T59 EIF_TYPE_OBJ

/* NO_MORE_MEMORY */
typedef struct S60 T60;

/* INVARIANT_VIOLATION */
typedef struct S61 T61;

/* OPERATING_SYSTEM_SIGNAL_FAILURE */
typedef struct S62 T62;

/* IO_FAILURE */
typedef struct S63 T63;

/* OPERATING_SYSTEM_FAILURE */
typedef struct S64 T64;

/* COM_FAILURE */
typedef struct S65 T65;

/* EIFFEL_RUNTIME_PANIC */
typedef struct S66 T66;

/* PRECONDITION_VIOLATION */
typedef struct S69 T69;

/* POSTCONDITION_VIOLATION */
typedef struct S70 T70;

/* FLOATING_POINT_FAILURE */
typedef struct S71 T71;

/* CHECK_VIOLATION */
typedef struct S72 T72;

/* BAD_INSPECT_VALUE */
typedef struct S73 T73;

/* VARIANT_VIOLATION */
typedef struct S74 T74;

/* LOOP_INVARIANT_VIOLATION */
typedef struct S75 T75;

/* RESCUE_FAILURE */
typedef struct S76 T76;

/* RESUMPTION_FAILURE */
typedef struct S77 T77;

/* CREATE_ON_DEFERRED */
typedef struct S78 T78;

/* EXTERNAL_FAILURE */
typedef struct S79 T79;

/* VOID_ASSIGNED_TO_EXPANDED */
typedef struct S80 T80;

/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE */
typedef struct S81 T81;

/* MISMATCH_FAILURE */
typedef struct S82 T82;

/* DEVELOPER_EXCEPTION */
typedef struct S83 T83;

/* ADDRESS_APPLIED_TO_MELTED_FEATURE */
typedef struct S84 T84;

/* SERIALIZATION_FAILURE */
typedef struct S85 T85;

/* KL_STRING_ROUTINES */
typedef struct S86 T86;

/* PRIMES */
typedef struct S87 T87;

/* SPECIAL [INTEGER_32] */
typedef struct S88 T88;

/* SPECIAL [BOOLEAN] */
typedef struct S89 T89;

/* ARGUMENTS_32 */
typedef struct S90 T90;

/* IMMUTABLE_STRING_32 */
typedef struct S91 T91;

/* KL_SPECIAL_ROUTINES [STRING_8] */
typedef struct S93 T93;

/* SPECIAL [STRING_8] */
typedef struct S94 T94;

/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
typedef struct S95 T95;

/* KL_SPECIAL_ROUTINES [INTEGER_32] */
typedef struct S96 T96;

/* detachable DS_LINKABLE [GEXACE_COMMAND] */
typedef struct S97 T97;

/* KL_STANDARD_FILES */
typedef struct S99 T99;

/* KL_STDERR_FILE */
typedef struct S100 T100;

/* KL_STDOUT_FILE */
typedef struct S101 T101;

/* KL_NULL_TEXT_OUTPUT_STREAM */
typedef struct S102 T102;

/* detachable DS_LINKABLE [STRING_8] */
typedef struct S104 T104;

/* ARRAY [STRING_8] */
typedef struct S105 T105;

/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR] */
typedef struct S106 T106;

/* detachable DS_LINKABLE [ET_XACE_GENERATOR] */
typedef struct S107 T107;

/* UTF_CONVERTER */
typedef struct S109 T109;
extern T0* GE_boxed109(T109 a1);
typedef struct Sb109 Tb109;

/* CELL [INTEGER_32] */
typedef struct S110 T110;

/* C_STRING */
typedef struct S111 T111;

/* MANAGED_POINTER */
typedef struct S112 T112;

/* UC_STRING */
typedef struct S113 T113;

/* KL_ANY_ROUTINES */
typedef struct S114 T114;

/* ARRAY [IMMUTABLE_STRING_32] */
typedef struct S116 T116;

/* SPECIAL [IMMUTABLE_STRING_32] */
typedef struct S117 T117;

/* NATIVE_STRING */
typedef struct S118 T118;

/* READABLE_STRING_32 */
typedef struct S119 T119;

/* STRING_TO_INTEGER_CONVERTOR */
typedef struct S122 T122;

/* ET_XACE_SYSTEM_CONFIG_PARSER */
typedef struct S124 T124;

/* ET_XACE_SYSTEM_CONFIG */
typedef struct S125 T125;

/* KL_TEXT_INPUT_FILE */
typedef struct S126 T126;

/* KL_TEXT_OUTPUT_FILE */
typedef struct S128 T128;

/* ET_XACE_LIBRARY_CONFIG_PARSER */
typedef struct S129 T129;

/* ET_XACE_LIBRARY_CONFIG */
typedef struct S130 T130;

/* ET_XACE_PARSER */
typedef struct S131 T131;

/* STD_FILES */
typedef struct S132 T132;

/* EXCEPTIONS */
typedef struct S133 T133;

/* TYPED_POINTER [NATURAL_8] */
typedef struct S134 T134;
extern T0* GE_boxed134(T134 a1);
typedef struct Sb134 Tb134;

/* PLATFORM */
typedef struct S135 T135;

/* UT_CANNOT_READ_FILE_ERROR */
typedef struct S136 T136;

/* UT_CANNOT_WRITE_TO_FILE_ERROR */
typedef struct S137 T137;

/* TYPED_POINTER [NATURAL_16] */
typedef struct S138 T138;
extern T0* GE_boxed138(T138 a1);
typedef struct Sb138 Tb138;

/* INTEGER_OVERFLOW_CHECKER */
typedef struct S139 T139;

/* ET_XACE_AST_FACTORY */
typedef struct S140 T140;

/* XM_DOCUMENT */
typedef struct S141 T141;

/* XM_ELEMENT */
typedef struct S142 T142;

/* XM_POSITION_TABLE */
typedef struct S143 T143;

/* XM_TREE_CALLBACKS_PIPE */
typedef struct S145 T145;

/* XM_STOP_ON_ERROR_FILTER */
typedef struct S146 T146;

/* XM_CALLBACKS_TO_TREE_FILTER */
typedef struct S147 T147;

/* ET_XACE_VALIDATOR */
typedef struct S148 T148;

/* ET_XACE_PREPROCESSOR */
typedef struct S149 T149;

/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8] */
typedef struct S150 T150;

/* XM_EXPAT_PARSER_FACTORY */
typedef struct S151 T151;

/* XM_EIFFEL_PARSER */
typedef struct S152 T152;

/* FILE_INFO */
typedef struct S157 T157;

/* CONSOLE */
typedef struct S158 T158;

/* SPECIAL [NATURAL_8] */
typedef struct S159 T159;

/* UT_MESSAGE */
typedef struct S160 T160;

/* ET_XACE_NOT_XACE_FILE_ERROR */
typedef struct S161 T161;

/* ET_XACE_CLUSTERS */
typedef struct S162 T162;

/* ET_XACE_MOUNTED_LIBRARIES */
typedef struct S163 T163;

/* ET_XACE_OPTIONS */
typedef struct S164 T164;

/* DS_HASH_SET_CURSOR [STRING_8] */
typedef struct S165 T165;

/* DS_ARRAYED_LIST_CURSOR [STRING_8] */
typedef struct S166 T166;

/* DS_HASH_SET [STRING_8] */
typedef struct S167 T167;

/* DS_ARRAYED_LIST [STRING_8] */
typedef struct S168 T168;

/* DS_ARRAYED_LIST [ET_XACE_CLUSTER] */
typedef struct S169 T169;

/* ET_XACE_CLUSTER */
typedef struct S170 T170;

/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY] */
typedef struct S171 T171;

/* ET_XACE_MOUNTED_LIBRARY */
typedef struct S172 T172;

/* detachable DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS] */
typedef struct S173 T173;

/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS] */
typedef struct S174 T174;

/* ET_XACE_CLASS_OPTIONS */
typedef struct S175 T175;

/* detachable DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS] */
typedef struct S176 T176;

/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS] */
typedef struct S177 T177;

/* ET_XACE_FEATURE_OPTIONS */
typedef struct S178 T178;

/* ET_XACE_EXTERNALS */
typedef struct S179 T179;

/* ET_XACE_OPTION_NAMES */
typedef struct S180 T180;

/* DS_LINKED_LIST [ET_XACE_ASSEMBLY] */
typedef struct S181 T181;

/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY] */
typedef struct S182 T182;

/* ET_XACE_ASSEMBLY */
typedef struct S183 T183;

/* KL_UNIX_FILE_SYSTEM */
typedef struct S184 T184;

/* KL_EXECUTION_ENVIRONMENT */
typedef struct S185 T185;

/* DS_LINKED_LIST [ET_XACE_CLUSTER] */
typedef struct S186 T186;

/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER] */
typedef struct S187 T187;

/* [attached] TUPLE [ET_XACE_CLASS_OPTIONS] */
typedef struct S188 T188;

/* [attached] PROCEDURE [[attached] TUPLE [ET_XACE_CLASS_OPTIONS]] */
typedef struct S189 T189;

/* [attached] TUPLE [ET_XACE_ECF_GENERATOR, INTEGER_32, KI_TEXT_OUTPUT_STREAM] */
typedef struct S191 T191;

/* [attached] TUPLE [ET_XACE_FEATURE_OPTIONS] */
typedef struct S192 T192;

/* [attached] PROCEDURE [[attached] TUPLE [ET_XACE_FEATURE_OPTIONS]] */
typedef struct S193 T193;

/* [attached] TUPLE [ET_XACE_ECF_GENERATOR, STRING_8, INTEGER_32, KI_TEXT_OUTPUT_STREAM] */
typedef struct S194 T194;

/* ET_TOKEN_CONSTANTS */
typedef struct S196 T196;

/* ET_SYSTEM */
typedef struct S197 T197;

/* XM_ATTRIBUTE */
typedef struct S200 T200;

/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE] */
typedef struct S201 T201;

/* DS_HASH_TABLE [INTEGER_32, STRING_8] */
typedef struct S204 T204;

/* TYPED_POINTER [ANY] */
typedef struct S207 T207;
extern T0* GE_boxed207(T207 a1);
typedef struct Sb207 Tb207;

/* SPECIAL [NATURAL_64] */
typedef struct S208 T208;

/* XM_NAMESPACE_RESOLVER */
typedef struct S209 T209;

/* ARRAY [XM_CALLBACKS_FILTER] */
typedef struct S210 T210;

/* SPECIAL [XM_CALLBACKS_FILTER] */
typedef struct S211 T211;

/* XM_CALLBACKS_NULL */
typedef struct S212 T212;

/* DS_HASH_SET [XM_NAMESPACE] */
typedef struct S213 T213;

/* UT_TEMPLATE_EXPANDER */
typedef struct S217 T217;

/* detachable DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8] */
typedef struct S220 T220;

/* SPECIAL [ET_XACE_LIBRARY_CONFIG] */
typedef struct S221 T221;

/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY_CONFIG] */
typedef struct S222 T222;

/* XM_EIFFEL_SCANNER */
typedef struct S223 T223;

/* XM_DEFAULT_POSITION */
typedef struct S224 T224;

/* DS_BILINKED_LIST [XM_POSITION] */
typedef struct S226 T226;

/* DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
typedef struct S227 T227;

/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S228 T228;

/* XM_NULL_EXTERNAL_RESOLVER */
typedef struct S230 T230;

/* XM_DTD_CALLBACKS_NULL */
typedef struct S232 T232;

/* KL_SPECIAL_ROUTINES [detachable ANY] */
typedef struct S233 T233;

/* SPECIAL [detachable ANY] */
typedef struct S234 T234;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
typedef struct S235 T235;

/* XM_EIFFEL_PARSER_NAME */
typedef struct S236 T236;

/* SPECIAL [XM_EIFFEL_PARSER_NAME] */
typedef struct S237 T237;

/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S238 T238;

/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
typedef struct S239 T239;

/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S240 T240;

/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
typedef struct S241 T241;

/* XM_DTD_EXTERNAL_ID */
typedef struct S242 T242;

/* SPECIAL [XM_DTD_EXTERNAL_ID] */
typedef struct S243 T243;

/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
typedef struct S244 T244;

/* XM_DTD_ELEMENT_CONTENT */
typedef struct S245 T245;

/* SPECIAL [XM_DTD_ELEMENT_CONTENT] */
typedef struct S246 T246;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S247 T247;

/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S248 T248;

/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S249 T249;

/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S250 T250;

/* XM_DTD_ATTRIBUTE_CONTENT */
typedef struct S251 T251;

/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S252 T252;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
typedef struct S253 T253;

/* DS_BILINKED_LIST [STRING_8] */
typedef struct S254 T254;

/* SPECIAL [DS_BILINKED_LIST [STRING_8]] */
typedef struct S255 T255;

/* KL_SPECIAL_ROUTINES [BOOLEAN] */
typedef struct S256 T256;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
typedef struct S257 T257;

/* XM_EIFFEL_DECLARATION */
typedef struct S258 T258;

/* SPECIAL [XM_EIFFEL_DECLARATION] */
typedef struct S259 T259;

/* XM_EIFFEL_ENTITY_DEF */
typedef struct S263 T263;

/* XM_EIFFEL_SCANNER_DTD */
typedef struct S264 T264;

/* XM_EIFFEL_PE_ENTITY_DEF */
typedef struct S266 T266;

/* TYPED_POINTER [SPECIAL [NATURAL_8]] */
typedef struct S267 T267;
extern T0* GE_boxed267(T267 a1);
typedef struct Sb267 Tb267;

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR */
typedef struct S268 T268;

/* ET_XACE_BOOLEAN_EXPECTED_ERROR */
typedef struct S269 T269;

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR */
typedef struct S270 T270;

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR */
typedef struct S271 T271;

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR */
typedef struct S272 T272;

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING */
typedef struct S273 T273;

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR */
typedef struct S274 T274;

/* ET_XACE_MISSING_ATTRIBUTE_ERROR */
typedef struct S275 T275;

/* ET_XACE_MISSING_ELEMENT_ERROR */
typedef struct S276 T276;

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING */
typedef struct S277 T277;

/* ET_XACE_UNKNOWN_ELEMENT_ERROR */
typedef struct S278 T278;

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING */
typedef struct S279 T279;

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING */
typedef struct S280 T280;

/* KL_OPERATING_SYSTEM */
typedef struct S281 T281;

/* XM_NAMESPACE */
typedef struct S284 T284;

/* XM_LINKED_LIST [XM_DOCUMENT_NODE] */
typedef struct S285 T285;

/* XM_LINKED_LIST [XM_ELEMENT_NODE] */
typedef struct S287 T287;

/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S291 T291;

/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S292 T292;

/* DS_PAIR [XM_POSITION, XM_NODE] */
typedef struct S293 T293;

/* ARRAY [INTEGER_32] */
typedef struct S294 T294;

/* UC_UTF8_ROUTINES */
typedef struct S295 T295;

/* UC_UTF8_STRING */
typedef struct S296 T296;

/* XM_EIFFEL_INPUT_STREAM */
typedef struct S297 T297;

/* KL_INTEGER_ROUTINES */
typedef struct S298 T298;

/* KL_PLATFORM */
typedef struct S299 T299;

/* KL_ARRAY_ROUTINES [INTEGER_32] */
typedef struct S300 T300;

/* UT_TRISTATE */
typedef struct S301 T301;

/* SPECIAL [ET_XACE_CLUSTER] */
typedef struct S302 T302;

/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER] */
typedef struct S303 T303;

/* DS_ARRAYED_LIST_CURSOR [ET_XACE_CLUSTER] */
typedef struct S304 T304;

/* SPECIAL [ET_XACE_MOUNTED_LIBRARY] */
typedef struct S305 T305;

/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY] */
typedef struct S306 T306;

/* DS_ARRAYED_LIST_CURSOR [ET_XACE_MOUNTED_LIBRARY] */
typedef struct S307 T307;

/* detachable DS_LINKABLE [ET_XACE_CLASS_OPTIONS] */
typedef struct S308 T308;

/* detachable DS_LINKABLE [ET_XACE_FEATURE_OPTIONS] */
typedef struct S309 T309;

/* detachable DS_LINKABLE [ET_XACE_ASSEMBLY] */
typedef struct S310 T310;

/* EXECUTION_ENVIRONMENT */
typedef struct S311 T311;

/* detachable DS_LINKABLE [ET_XACE_CLUSTER] */
typedef struct S312 T312;

/* ET_ERROR_HANDLER */
typedef struct S313 T313;

/* ET_AST_FACTORY */
typedef struct S314 T314;

/* ET_AST_NULL_PROCESSOR */
typedef struct S315 T315;

/* ET_ADAPTED_LIBRARIES */
typedef struct S317 T317;

/* ET_CLUSTERS */
typedef struct S318 T318;

/* ET_ADAPTED_DOTNET_ASSEMBLIES */
typedef struct S319 T319;

/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME] */
typedef struct S320 T320;

/* ET_CLASS_NAME_TESTER */
typedef struct S321 T321;

/* ET_CLASS_TYPE */
typedef struct S323 T323;

/* ET_PARENT */
typedef struct S324 T324;

/* ET_PARENT_LIST */
typedef struct S325 T325;

/* ET_CLIENT_LIST */
typedef struct S326 T326;

/* ET_TUPLE_TYPE */
typedef struct S327 T327;

/* ET_ACTUAL_PARAMETER_LIST */
typedef struct S329 T329;

/* ET_BUILTIN_CONVERT_FEATURE */
typedef struct S330 T330;

/* ET_MASTER_CLASS */
typedef struct S332 T332;

/* ET_CLIENT */
typedef struct S333 T333;

/* ET_IMPLICIT_TYPE_MARK */
typedef struct S334 T334;

/* ET_KEYWORD */
typedef struct S337 T337;

/* ET_LIKE_CURRENT */
typedef struct S344 T344;

/* ET_UNFOLDED_EMPTY_TUPLE_ACTUAL_PARAMETERS */
typedef struct S346 T346;

/* ET_CLASS */
typedef struct S348 T348;

/* ET_NONE_GROUP */
typedef struct S349 T349;

/* DS_HASH_TABLE_CURSOR [INTEGER_32, STRING_8] */
typedef struct S352 T352;

/* XM_NAMESPACE_RESOLVER_CONTEXT */
typedef struct S353 T353;

/* DS_LINKED_QUEUE [STRING_8] */
typedef struct S355 T355;

/* detachable KL_EQUALITY_TESTER [XM_NAMESPACE] */
typedef struct S356 T356;

/* DS_HASH_SET_CURSOR [XM_NAMESPACE] */
typedef struct S357 T357;

/* KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
typedef struct S358 T358;

/* SPECIAL [XM_NAMESPACE] */
typedef struct S359 T359;

/* XM_EIFFEL_CHARACTER_ENTITY */
typedef struct S360 T360;

/* YY_BUFFER */
typedef struct S361 T361;

/* YY_FILE_BUFFER */
typedef struct S362 T362;

/* detachable DS_BILINKABLE [XM_POSITION] */
typedef struct S366 T366;

/* DS_BILINKED_LIST_CURSOR [XM_POSITION] */
typedef struct S367 T367;

/* detachable DS_LINKABLE [XM_EIFFEL_SCANNER] */
typedef struct S368 T368;

/* SPECIAL [XM_EIFFEL_ENTITY_DEF] */
typedef struct S369 T369;

/* detachable DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S372 T372;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
typedef struct S373 T373;

/* detachable KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
typedef struct S376 T376;

/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
typedef struct S377 T377;

/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
typedef struct S378 T378;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S379 T379;

/* detachable DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S380 T380;

/* DS_BILINKED_LIST_CURSOR [STRING_8] */
typedef struct S381 T381;

/* detachable DS_BILINKABLE [STRING_8] */
typedef struct S382 T382;

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING */
typedef struct S383 T383;

/* ET_XACE_INVALID_EXPRESSION_ERROR */
typedef struct S384 T384;

/* TYPE [DEVELOPER_EXCEPTION] */
#define T385 EIF_TYPE_OBJ

/* UC_UNICODE_ROUTINES */
typedef struct S387 T387;

/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER */
typedef struct S388 T388;

/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE] */
typedef struct S389 T389;

/* XM_COMMENT */
typedef struct S390 T390;

/* XM_PROCESSING_INSTRUCTION */
typedef struct S391 T391;

/* XM_CHARACTER_DATA */
typedef struct S392 T392;

/* detachable DS_LINKABLE [XM_DOCUMENT_NODE] */
typedef struct S395 T395;

/* DS_LINKED_QUEUE [CHARACTER_8] */
typedef struct S400 T400;

/* UC_UTF16_ROUTINES */
typedef struct S401 T401;

/* DS_ARRAYED_LIST [ET_ADAPTED_LIBRARY] */
typedef struct S402 T402;

/* DS_ARRAYED_LIST [ET_CLUSTER] */
typedef struct S403 T403;

/* DS_ARRAYED_LIST [ET_ADAPTED_DOTNET_ASSEMBLY] */
typedef struct S404 T404;

/* SPECIAL [ET_MASTER_CLASS] */
typedef struct S405 T405;

/* KL_SPECIAL_ROUTINES [ET_MASTER_CLASS] */
typedef struct S408 T408;

/* KL_SPECIAL_ROUTINES [ET_CLASS_NAME] */
typedef struct S409 T409;

/* SPECIAL [ET_CLASS_NAME] */
typedef struct S410 T410;

/* DS_HASH_TABLE_CURSOR [ET_MASTER_CLASS, ET_CLASS_NAME] */
typedef struct S411 T411;

/* SPECIAL [ET_PARENT_ITEM] */
typedef struct S413 T413;

/* KL_SPECIAL_ROUTINES [ET_PARENT_ITEM] */
typedef struct S414 T414;

/* SPECIAL [ET_CLIENT_ITEM] */
typedef struct S415 T415;

/* KL_SPECIAL_ROUTINES [ET_CLIENT_ITEM] */
typedef struct S416 T416;

/* ET_IDENTIFIER */
typedef struct S417 T417;

/* ET_SYMBOL */
typedef struct S418 T418;

/* ET_BRACKET_SYMBOL */
typedef struct S419 T419;

/* SPECIAL [ET_ACTUAL_PARAMETER_ITEM] */
typedef struct S421 T421;

/* KL_SPECIAL_ROUTINES [ET_ACTUAL_PARAMETER_ITEM] */
typedef struct S422 T422;

/* ET_BRACED_TYPE_LIST */
typedef struct S425 T425;

/* DS_ARRAYED_LIST [ET_CLASS] */
typedef struct S426 T426;

/* DS_ARRAYED_LIST [ET_MASTER_CLASS] */
typedef struct S427 T427;

/* [attached] TUPLE [ET_MASTER_CLASS] */
typedef struct S428 T428;

/* [attached] PROCEDURE [[attached] TUPLE [ET_MASTER_CLASS]] */
typedef struct S429 T429;

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S431 T431;

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S432 T432;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
typedef struct S433 T433;

/* attached DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
typedef struct S434 T434;

/* KL_WINDOWS_FILE_SYSTEM */
typedef struct S436 T436;

/* ET_UNKNOWN_GROUP */
typedef struct S438 T438;

/* detachable DS_LINKABLE [XM_ELEMENT_NODE] */
typedef struct S440 T440;

/* KL_STRING_INPUT_STREAM */
typedef struct S441 T441;

/* detachable DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S442 T442;

/* ET_CURRENT */
typedef struct S444 T444;

/* ET_BASE_TYPE_LIST */
typedef struct S445 T445;

/* ET_QUERY_LIST */
typedef struct S446 T446;

/* ET_PROCEDURE_LIST */
typedef struct S447 T447;

/* ET_CLASS_CODES */
typedef struct S448 T448;

/* KL_CHARACTER_BUFFER */
typedef struct S449 T449;

/* SPECIAL [ARRAY [INTEGER_32]] */
typedef struct S450 T450;

/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
typedef struct S451 T451;

/* detachable DS_LINKABLE [CHARACTER_8] */
typedef struct S452 T452;

/* KL_SPECIAL_ROUTINES [ET_ADAPTED_LIBRARY] */
typedef struct S453 T453;

/* SPECIAL [ET_ADAPTED_LIBRARY] */
typedef struct S455 T455;

/* DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_LIBRARY] */
typedef struct S456 T456;

/* KL_SPECIAL_ROUTINES [ET_CLUSTER] */
typedef struct S457 T457;

/* SPECIAL [ET_CLUSTER] */
typedef struct S458 T458;

/* DS_ARRAYED_LIST_CURSOR [ET_CLUSTER] */
typedef struct S459 T459;

/* KL_SPECIAL_ROUTINES [ET_ADAPTED_DOTNET_ASSEMBLY] */
typedef struct S460 T460;

/* SPECIAL [ET_ADAPTED_DOTNET_ASSEMBLY] */
typedef struct S462 T462;

/* DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_DOTNET_ASSEMBLY] */
typedef struct S463 T463;

/* SPECIAL [ET_TYPE_ITEM] */
typedef struct S465 T465;

/* KL_SPECIAL_ROUTINES [ET_TYPE_ITEM] */
typedef struct S466 T466;

/* KL_SPECIAL_ROUTINES [ET_CLASS] */
typedef struct S467 T467;

/* SPECIAL [ET_CLASS] */
typedef struct S468 T468;

/* DS_ARRAYED_LIST_CURSOR [ET_CLASS] */
typedef struct S469 T469;

/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S470 T470;

/* DS_ARRAYED_LIST_CURSOR [ET_MASTER_CLASS] */
typedef struct S472 T472;

/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME] */
typedef struct S473 T473;

/* STRING_8_SEARCHER */
typedef struct S474 T474;

/* SPECIAL [ET_BASE_TYPE] */
typedef struct S475 T475;

/* KL_SPECIAL_ROUTINES [ET_BASE_TYPE] */
typedef struct S476 T476;

/* SPECIAL [ET_QUERY] */
typedef struct S478 T478;

/* KL_SPECIAL_ROUTINES [ET_QUERY] */
typedef struct S479 T479;

/* SPECIAL [ET_PROCEDURE] */
typedef struct S481 T481;

/* KL_SPECIAL_ROUTINES [ET_PROCEDURE] */
typedef struct S482 T482;

/* KL_SPECIAL_ROUTINES [NATURAL_8] */
typedef struct S485 T485;

/* DS_HASH_TABLE_CURSOR [NATURAL_8, ET_CLASS_NAME] */
typedef struct S486 T486;

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
struct S109 {
	char dummy;
};

/* Struct for boxed version of type UTF_CONVERTER */
struct Sb109 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T109 z1; /* item */
};

/* Struct for type TYPED_POINTER [SPECIAL [NATURAL_8]] */
struct S267 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T14 a1; /* to_pointer */
};

/* Struct for boxed version of type TYPED_POINTER [SPECIAL [NATURAL_8]] */
struct Sb267 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T267 z1; /* item */
};

/* Struct for type TYPED_POINTER [ANY] */
struct S207 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T14 a1; /* to_pointer */
};

/* Struct for boxed version of type TYPED_POINTER [ANY] */
struct Sb207 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T207 z1; /* item */
};

/* Struct for type TYPED_POINTER [NATURAL_16] */
struct S138 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T14 a1; /* to_pointer */
};

/* Struct for boxed version of type TYPED_POINTER [NATURAL_16] */
struct Sb138 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T138 z1; /* item */
};

/* Struct for type TYPED_POINTER [NATURAL_8] */
struct S134 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T14 a1; /* to_pointer */
};

/* Struct for boxed version of type TYPED_POINTER [NATURAL_8] */
struct Sb134 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T134 z1; /* item */
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
	T6 a4; /* internal_case_insensitive_hash_code */
};

/* Struct for type STRING_32 */
struct S18 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* area */
	T6 a2; /* count */
	T6 a3; /* internal_hash_code */
	T6 a4; /* internal_case_insensitive_hash_code */
};

/* Struct for type ISE_EXCEPTION_MANAGER */
struct S19 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type GEXACE */
struct S22 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* variables */
	T0* a2; /* commands */
	T0* a3; /* error_handler */
	T6 a4; /* next_option_position */
	T1 a5; /* is_shallow */
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

/* Struct for type DS_LINKED_LIST_CURSOR [GEXACE_COMMAND] */
struct S29 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type KL_ARGUMENTS */
struct S30 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* program_name */
};

/* Struct for type DS_HASH_TABLE [STRING_8, STRING_8] */
struct S31 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* key_equality_tester */
	T0* a2; /* internal_keys */
	T6 a3; /* position */
	T6 a4; /* last_position */
	T6 a5; /* capacity */
	T6 a6; /* slots_position */
	T6 a7; /* count */
	T0* a8; /* equality_tester */
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

/* Struct for type UC_STRING_EQUALITY_TESTER */
struct S32 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_LINKED_LIST [GEXACE_COMMAND] */
struct S34 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* last_cell */
	T6 a2; /* count */
	T0* a3; /* first_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type ET_XACE_DEFAULT_ERROR_HANDLER */
struct S35 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* error_count */
	T0* a2; /* warning_file */
	T0* a3; /* info_file */
	T0* a4; /* error_file */
};

/* Struct for type KL_EXCEPTIONS */
struct S37 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_LINKED_LIST_CURSOR [STRING_8] */
struct S38 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_PAIR [STRING_8, STRING_8] */
struct S39 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* second */
	T0* a2; /* first */
};

/* Struct for type DS_LINKED_LIST [STRING_8] */
struct S40 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* last_cell */
	T6 a2; /* count */
	T0* a3; /* first_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type UT_USAGE_MESSAGE */
struct S41 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type GEXACE_SYSTEM_COMMAND */
struct S43 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* format */
	T0* a2; /* generators */
	T0* a3; /* variables */
	T0* a4; /* error_handler */
	T0* a5; /* xace_filename */
	T1 a6; /* is_shallow */
	T0* a7; /* output_filename */
	T1 a8; /* is_ve */
};

/* Struct for type GEXACE_LIBRARY_COMMAND */
struct S47 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* format */
	T0* a2; /* generators */
	T0* a3; /* variables */
	T0* a4; /* error_handler */
	T0* a5; /* xace_filename */
	T1 a6; /* is_shallow */
	T0* a7; /* output_filename */
	T1 a8; /* is_ve */
};

/* Struct for type GEXACE_VALIDATE_COMMAND */
struct S48 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* variables */
	T0* a2; /* error_handler */
	T0* a3; /* xace_filename */
	T1 a4; /* is_shallow */
};

/* Struct for type ET_XACE_XACE_GENERATOR */
struct S50 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* compiler */
	T0* a2; /* variables */
	T0* a3; /* error_handler */
	T1 a4; /* is_shallow */
};

/* Struct for type ET_XACE_ACE_GENERATOR */
struct S51 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* compiler */
	T0* a2; /* variables */
	T0* a3; /* error_handler */
	T1 a4; /* is_shallow */
};

/* Struct for type ET_XACE_ECF_GENERATOR */
struct S52 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* compiler */
	T0* a2; /* variables */
	T0* a3; /* error_handler */
	T1 a4; /* is_shallow */
};

/* Struct for type DS_LINKED_LIST [ET_XACE_GENERATOR] */
struct S53 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* last_cell */
	T0* a3; /* first_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type VOID_TARGET */
struct S54 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type ROUTINE_FAILURE */
struct S56 {
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
struct S58 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type NO_MORE_MEMORY */
struct S60 {
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
struct S61 {
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
struct S62 {
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
struct S63 {
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
struct S64 {
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
struct S65 {
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
struct S66 {
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
struct S69 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type POSTCONDITION_VIOLATION */
struct S70 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type FLOATING_POINT_FAILURE */
struct S71 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type CHECK_VIOLATION */
struct S72 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type BAD_INSPECT_VALUE */
struct S73 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type VARIANT_VIOLATION */
struct S74 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type LOOP_INVARIANT_VIOLATION */
struct S75 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type RESCUE_FAILURE */
struct S76 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type RESUMPTION_FAILURE */
struct S77 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type CREATE_ON_DEFERRED */
struct S78 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type EXTERNAL_FAILURE */
struct S79 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type VOID_ASSIGNED_TO_EXPANDED */
struct S80 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type EXCEPTION_IN_SIGNAL_HANDLER_FAILURE */
struct S81 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type MISMATCH_FAILURE */
struct S82 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type DEVELOPER_EXCEPTION */
struct S83 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type ADDRESS_APPLIED_TO_MELTED_FEATURE */
struct S84 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type SERIALIZATION_FAILURE */
struct S85 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* throwing_exception */
	T0* a2; /* internal_trace */
	T0* a3; /* c_description */
	T0* a4; /* recipient_name */
	T0* a5; /* type_name */
};

/* Struct for type KL_STRING_ROUTINES */
struct S86 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type PRIMES */
struct S87 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [INTEGER_32] */
struct S88 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T6 z2[1]; /* item */
};

/* Struct for type SPECIAL [BOOLEAN] */
struct S89 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T1 z2[1]; /* item */
};

/* Struct for type ARGUMENTS_32 */
struct S90 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type IMMUTABLE_STRING_32 */
struct S91 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* area */
	T6 a2; /* count */
	T6 a3; /* internal_hash_code */
	T6 a4; /* area_lower */
};

/* Struct for type KL_SPECIAL_ROUTINES [STRING_8] */
struct S93 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [STRING_8] */
struct S94 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
struct S95 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [INTEGER_32] */
struct S96 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type detachable DS_LINKABLE [GEXACE_COMMAND] */
struct S97 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type KL_STANDARD_FILES */
struct S99 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_STDERR_FILE */
struct S100 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_STDOUT_FILE */
struct S101 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_NULL_TEXT_OUTPUT_STREAM */
struct S102 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* name */
};

/* Struct for type detachable DS_LINKABLE [STRING_8] */
struct S104 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type ARRAY [STRING_8] */
struct S105 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR] */
struct S106 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type detachable DS_LINKABLE [ET_XACE_GENERATOR] */
struct S107 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type CELL [INTEGER_32] */
struct S110 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* item */
};

/* Struct for type C_STRING */
struct S111 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* managed_data */
	T6 a2; /* count */
};

/* Struct for type MANAGED_POINTER */
struct S112 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T14 a2; /* item */
	T1 a3; /* is_shared */
};

/* Struct for type UC_STRING */
struct S113 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* byte_count */
	T6 a3; /* internal_hash_code */
	T6 a4; /* internal_case_insensitive_hash_code */
	T0* a5; /* area */
	T6 a6; /* last_byte_index_input */
	T6 a7; /* last_byte_index_result */
};

/* Struct for type KL_ANY_ROUTINES */
struct S114 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type ARRAY [IMMUTABLE_STRING_32] */
struct S116 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
	T1 a4; /* object_comparison */
};

/* Struct for type SPECIAL [IMMUTABLE_STRING_32] */
struct S117 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type NATIVE_STRING */
struct S118 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* managed_data */
	T6 a2; /* unit_count */
};

/* Struct for type READABLE_STRING_32 */
struct S119 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type STRING_TO_INTEGER_CONVERTOR */
struct S122 {
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

/* Struct for type ET_XACE_SYSTEM_CONFIG_PARSER */
struct S124 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* last_system */
	T0* a2; /* ast_factory */
	T1 a3; /* is_shallow */
	T0* a4; /* library_parser */
	T1 a5; /* is_ve */
	T0* a6; /* xml_parser */
	T0* a7; /* tree_pipe */
	T0* a8; /* xml_validator */
	T0* a9; /* xml_preprocessor */
	T0* a10; /* parsed_libraries */
	T0* a11; /* error_handler */
};

/* Struct for type ET_XACE_SYSTEM_CONFIG */
struct S125 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* system_name */
	T0* a2; /* root_class_name */
	T0* a3; /* creation_procedure_name */
	T0* a4; /* options */
	T0* a5; /* clusters */
	T0* a6; /* libraries */
};

/* Struct for type KL_TEXT_INPUT_FILE */
struct S126 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* mode */
	T0* a2; /* last_string */
	T0* a3; /* name */
	T0* a4; /* character_buffer */
	T1 a5; /* end_of_file */
	T14 a6; /* file_pointer */
	T1 a7; /* descriptor_available */
	T0* a8; /* internal_name */
	T0* a9; /* internal_detachable_name_pointer */
	T2 a10; /* last_character */
};

/* Struct for type KL_TEXT_OUTPUT_FILE */
struct S128 {
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

/* Struct for type ET_XACE_LIBRARY_CONFIG_PARSER */
struct S129 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* last_library */
	T1 a2; /* is_shallow */
	T1 a3; /* is_ve */
	T0* a4; /* ast_factory */
	T0* a5; /* library_parser */
	T0* a6; /* xml_parser */
	T0* a7; /* tree_pipe */
	T0* a8; /* xml_validator */
	T0* a9; /* xml_preprocessor */
	T0* a10; /* parsed_libraries */
	T0* a11; /* error_handler */
};

/* Struct for type ET_XACE_LIBRARY_CONFIG */
struct S130 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* name */
	T0* a2; /* library_prefix */
	T0* a3; /* options */
	T0* a4; /* clusters */
	T0* a5; /* libraries */
};

/* Struct for type ET_XACE_PARSER */
struct S131 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* ast_factory */
	T0* a2; /* xml_parser */
	T0* a3; /* tree_pipe */
	T0* a4; /* xml_validator */
	T0* a5; /* xml_preprocessor */
	T0* a6; /* parsed_libraries */
	T0* a7; /* error_handler */
	T0* a8; /* library_parser */
	T1 a9; /* is_shallow */
	T1 a10; /* is_ve */
};

/* Struct for type STD_FILES */
struct S132 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* default_output */
};

/* Struct for type EXCEPTIONS */
struct S133 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type PLATFORM */
struct S135 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type UT_CANNOT_READ_FILE_ERROR */
struct S136 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type UT_CANNOT_WRITE_TO_FILE_ERROR */
struct S137 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type INTEGER_OVERFLOW_CHECKER */
struct S139 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* integer_overflow_state1 */
	T0* a2; /* integer_overflow_state2 */
	T0* a3; /* natural_overflow_state1 */
	T0* a4; /* natural_overflow_state2 */
};

/* Struct for type ET_XACE_AST_FACTORY */
struct S140 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type XM_DOCUMENT */
struct S141 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* root_element */
	T0* a2; /* children */
};

/* Struct for type XM_ELEMENT */
struct S142 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* name */
	T0* a2; /* parent */
	T0* a3; /* children */
	T0* a4; /* namespace */
};

/* Struct for type XM_POSITION_TABLE */
struct S143 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* table */
};

/* Struct for type XM_TREE_CALLBACKS_PIPE */
struct S145 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* error */
	T0* a2; /* tree */
	T0* a3; /* start */
	T0* a4; /* last */
};

/* Struct for type XM_STOP_ON_ERROR_FILTER */
struct S146 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* has_error */
	T0* a2; /* last_error */
	T0* a3; /* next */
};

/* Struct for type XM_CALLBACKS_TO_TREE_FILTER */
struct S147 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* last_position_table */
	T0* a2; /* document */
	T0* a3; /* source_parser */
	T0* a4; /* current_element */
	T0* a5; /* namespace_cache */
	T0* a6; /* next */
};

/* Struct for type ET_XACE_VALIDATOR */
struct S148 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* has_error */
	T0* a2; /* error_handler */
};

/* Struct for type ET_XACE_PREPROCESSOR */
struct S149 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* variables */
	T0* a2; /* error_handler */
};

/* Struct for type DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8] */
struct S150 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* last_position */
	T6 a3; /* free_slot */
	T6 a4; /* position */
	T0* a5; /* key_equality_tester */
	T0* a6; /* internal_keys */
	T0* a7; /* equality_tester */
	T0* a8; /* internal_cursor */
	T6 a9; /* found_position */
	T0* a10; /* item_storage */
	T0* a11; /* key_storage */
	T0* a12; /* clashes */
	T6 a13; /* modulus */
	T0* a14; /* slots */
	T6 a15; /* capacity */
	T0* a16; /* special_item_routines */
	T0* a17; /* special_key_routines */
	T6 a18; /* slots_position */
	T6 a19; /* clashes_previous_position */
	T0* a20; /* hash_function */
};

/* Struct for type XM_EXPAT_PARSER_FACTORY */
struct S151 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type XM_EIFFEL_PARSER */
struct S152 {
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

/* Struct for type FILE_INFO */
struct S157 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* buffered_file_info */
	T1 a2; /* is_following_symlinks */
	T1 a3; /* exists */
	T0* a4; /* internal_file_name */
	T0* a5; /* internal_name_pointer */
};

/* Struct for type CONSOLE */
struct S158 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T14 a1; /* file_pointer */
	T6 a2; /* mode */
	T0* a3; /* last_string */
	T0* a4; /* internal_name */
	T0* a5; /* internal_detachable_name_pointer */
};

/* Struct for type SPECIAL [NATURAL_8] */
struct S159 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T8 z2[1]; /* item */
};

/* Struct for type UT_MESSAGE */
struct S160 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_NOT_XACE_FILE_ERROR */
struct S161 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_CLUSTERS */
struct S162 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* clusters */
};

/* Struct for type ET_XACE_MOUNTED_LIBRARIES */
struct S163 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* libraries */
};

/* Struct for type ET_XACE_OPTIONS */
struct S164 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* declared_namespace */
	T0* a2; /* declared_assertion */
	T0* a3; /* declared_external_runtime */
	T0* a4; /* declared_metadata_cache_path */
	T0* a5; /* declared_msil_assembly_compatibility */
	T0* a6; /* declared_msil_clr_version */
	T0* a7; /* declared_msil_culture */
	T0* a8; /* declared_msil_key_file_name */
	T0* a9; /* declared_shared_library_definition */
	T0* a10; /* declared_override_cluster */
	T0* a11; /* declared_abstract */
	T0* a12; /* declared_recursive */
	T0* a13; /* declared_read_only */
	T0* a14; /* declared_address_expression */
	T0* a15; /* declared_arguments */
	T0* a16; /* declared_array_optimization */
	T0* a17; /* declared_assembly */
	T0* a18; /* declared_callback */
	T0* a19; /* declared_case_insensitive */
	T0* a20; /* declared_check_vape */
	T0* a21; /* declared_clean */
	T0* a22; /* declared_cls_compliant */
	T0* a23; /* declared_component */
	T0* a24; /* declared_console_application */
	T0* a25; /* declared_create_keyword_extension */
	T0* a26; /* declared_culture */
	T0* a27; /* declared_c_compiler_options */
	T0* a28; /* declared_dead_code_removal */
	T0* a29; /* declared_debug_option */
	T0* a30; /* declared_debug_tag */
	T0* a31; /* declared_debugger */
	T0* a32; /* declared_document */
	T0* a33; /* declared_dotnet_naming_convention */
	T0* a34; /* declared_dynamic_runtime */
	T0* a35; /* declared_exception_trace */
	T0* a36; /* declared_exclude */
	T0* a37; /* declared_export_option */
	T0* a38; /* declared_finalize_option */
	T0* a39; /* declared_flat_fst_optimization */
	T6 a40; /* declared_fst_expansion_factor */
	T0* a41; /* declared_fst_optimization */
	T0* a42; /* declared_garbage_collector */
	T0* a43; /* declared_gc_info */
	T0* a44; /* declared_header */
	T6 a45; /* declared_heap_size */
	T0* a46; /* declared_high_memory_compiler */
	T0* a47; /* declared_il_verifiable */
	T0* a48; /* declared_include */
	T0* a49; /* declared_inlining */
	T6 a50; /* declared_inlining_size */
	T0* a51; /* declared_jumps_optimization */
	T0* a52; /* declared_layout */
	T0* a53; /* declared_layout_optimization */
	T0* a54; /* declared_leaves_optimization */
	T0* a55; /* declared_line_generation */
	T0* a56; /* declared_link */
	T0* a57; /* declared_linker */
	T0* a58; /* declared_linux_fpu_double_precision */
	T0* a59; /* declared_manifest_string_trace */
	T0* a60; /* declared_map */
	T0* a61; /* declared_msil_generation */
	T0* a62; /* declared_msil_generation_version */
	T0* a63; /* declared_multithreaded */
	T0* a64; /* declared_no_default_lib */
	T0* a65; /* declared_portable_code_generation */
	T0* a66; /* declared_precompiled */
	T0* a67; /* declared_prefix_option */
	T0* a68; /* declared_profile */
	T0* a69; /* declared_public_key_token */
	T0* a70; /* declared_reloads_optimization */
	T0* a71; /* declared_split */
	T6 a72; /* declared_stack_size */
	T0* a73; /* declared_storable */
	T0* a74; /* declared_storable_filename */
	T0* a75; /* declared_strip_option */
	T0* a76; /* declared_target */
	T0* a77; /* declared_trace */
	T0* a78; /* declared_use_cluster_name_as_namespace */
	T0* a79; /* declared_use_full_cluster_name_as_namespace */
	T0* a80; /* declared_verbose */
	T0* a81; /* declared_version */
	T0* a82; /* declared_visible_filename */
	T0* a83; /* declared_warning */
	T0* a84; /* declared_wedit */
	T0* a85; /* declared_full_class_checking */
	T0* a86; /* declared_syntax */
	T0* a87; /* declared_attached_by_default */
	T0* a88; /* declared_void_safety */
	T0* a89; /* declared_automatic_backup */
	T0* a90; /* declared_check_generic_creation_constraint */
	T0* a91; /* declared_enforce_unique_class_names */
	T0* a92; /* declared_force_32bits */
	T6 a93; /* declared_msil_classes_per_module */
	T0* a94; /* declared_msil_use_optimized_precompile */
	T0* a95; /* declared_old_verbatim_strings */
	T0* a96; /* declared_ecf_library */
};

/* Struct for type DS_HASH_SET_CURSOR [STRING_8] */
struct S165 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [STRING_8] */
struct S166 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T0* a2; /* container */
	T0* a3; /* next_cursor */
};

/* Struct for type DS_HASH_SET [STRING_8] */
struct S167 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* position */
	T6 a3; /* capacity */
	T6 a4; /* modulus */
	T6 a5; /* last_position */
	T6 a6; /* free_slot */
	T0* a7; /* equality_tester */
	T6 a8; /* slots_position */
	T6 a9; /* clashes_previous_position */
	T0* a10; /* special_item_routines */
	T0* a11; /* item_storage */
	T0* a12; /* clashes */
	T0* a13; /* slots */
	T6 a14; /* found_position */
	T0* a15; /* internal_cursor */
	T0* a16; /* hash_function */
};

/* Struct for type DS_ARRAYED_LIST [STRING_8] */
struct S168 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* special_routines */
	T0* a3; /* storage */
	T6 a4; /* capacity */
	T0* a5; /* equality_tester */
	T0* a6; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST [ET_XACE_CLUSTER] */
struct S169 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type ET_XACE_CLUSTER */
struct S170 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* name */
	T0* a2; /* pathname */
	T1 a3; /* is_abstract */
	T0* a4; /* options */
	T0* a5; /* subclusters */
	T0* a6; /* libraries */
	T1 a7; /* is_relative */
	T0* a8; /* universe */
	T0* a9; /* library_prefix */
	T0* a10; /* cluster_prefix */
	T0* a11; /* class_options */
	T1 a12; /* is_recursive */
	T1 a13; /* is_read_only */
	T1 a14; /* overridden_constraint_enabled */
	T1 a15; /* scm_mapping_constraint_enabled */
	T1 a16; /* is_implicit */
	T1 a17; /* is_mounted */
	T0* a18; /* parent */
	T1 a19; /* is_override */
	T0* a20; /* provider_constraint */
	T0* a21; /* dependant_constraint */
};

/* Struct for type DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY] */
struct S171 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type ET_XACE_MOUNTED_LIBRARY */
struct S172 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* pathname */
	T0* a2; /* library_prefix */
	T0* a3; /* library */
	T0* a4; /* position */
	T1 a5; /* is_root */
};

/* Struct for type detachable DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS] */
struct S173 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* last_cell */
	T6 a2; /* count */
	T0* a3; /* first_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS] */
struct S174 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type ET_XACE_CLASS_OPTIONS */
struct S175 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* feature_options */
	T0* a2; /* class_name */
	T0* a3; /* options */
};

/* Struct for type detachable DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS] */
struct S176 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* last_cell */
	T0* a3; /* first_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS] */
struct S177 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type ET_XACE_FEATURE_OPTIONS */
struct S178 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* feature_name */
	T0* a2; /* options */
};

/* Struct for type ET_XACE_EXTERNALS */
struct S179 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* c_compiler_options */
	T0* a2; /* include_directories */
	T0* a3; /* link_libraries */
};

/* Struct for type ET_XACE_OPTION_NAMES */
struct S180 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_LINKED_LIST [ET_XACE_ASSEMBLY] */
struct S181 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* internal_cursor */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY] */
struct S182 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type ET_XACE_ASSEMBLY */
struct S183 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* tag */
	T0* a2; /* assembly_name */
	T0* a3; /* version */
	T0* a4; /* culture */
	T0* a5; /* public_key_token */
	T0* a6; /* class_prefix */
	T0* a7; /* assembly_pathname */
};

/* Struct for type KL_UNIX_FILE_SYSTEM */
struct S184 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_EXECUTION_ENVIRONMENT */
struct S185 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_LINKED_LIST [ET_XACE_CLUSTER] */
struct S186 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER] */
struct S187 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type [attached] TUPLE [ET_XACE_CLASS_OPTIONS] */
struct S188 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type [attached] PROCEDURE [[attached] TUPLE [ET_XACE_CLASS_OPTIONS]] */
struct S189 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(GE_context*, T0*, T0*);
};

/* Struct for type [attached] TUPLE [ET_XACE_ECF_GENERATOR, INTEGER_32, KI_TEXT_OUTPUT_STREAM] */
struct S191 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
	T6 z2;
	T0* z3;
};

/* Struct for type [attached] TUPLE [ET_XACE_FEATURE_OPTIONS] */
struct S192 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type [attached] PROCEDURE [[attached] TUPLE [ET_XACE_FEATURE_OPTIONS]] */
struct S193 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(GE_context*, T0*, T0*);
};

/* Struct for type [attached] TUPLE [ET_XACE_ECF_GENERATOR, STRING_8, INTEGER_32, KI_TEXT_OUTPUT_STREAM] */
struct S194 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
	T0* z2;
	T6 z3;
	T0* z4;
};

/* Struct for type ET_TOKEN_CONSTANTS */
struct S196 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type ET_SYSTEM */
struct S197 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* current_system */
	T0* a2; /* error_handler */
	T0* a3; /* ast_factory */
	T0* a4; /* external_include_pathnames */
	T0* a5; /* external_object_pathnames */
	T0* a6; /* external_library_pathnames */
	T1 a7; /* console_application_mode */
	T1 a8; /* alias_transition_mode */
	T1 a9; /* unknown_builtin_reported */
	T1 a10; /* qualified_anchored_types_enabled */
	T1 a11; /* qualified_anchored_types_cycle_detection_enabled */
	T0* a12; /* null_processor */
	T0* a13; /* eiffel_preparser */
	T0* a14; /* master_class_checker */
	T0* a15; /* eiffel_parser */
	T0* a16; /* provider_checker */
	T0* a17; /* ancestor_builder */
	T0* a18; /* feature_flattener */
	T0* a19; /* interface_checker */
	T0* a20; /* implementation_checker */
	T0* a21; /* flat_implementation_checker */
	T0* a22; /* universe */
	T0* a23; /* name */
	T0* a24; /* libraries */
	T0* a25; /* clusters */
	T0* a26; /* dotnet_assemblies */
	T0* a27; /* master_classes */
	T1 a28; /* preparse_shallow_mode */
	T1 a29; /* preparse_single_mode */
	T1 a30; /* preparse_multiple_mode */
	T0* a31; /* system_name */
	T0* a32; /* any_type */
	T0* a33; /* detachable_any_type */
	T0* a34; /* separate_any_type */
	T0* a35; /* any_parent */
	T0* a36; /* any_parents */
	T0* a37; /* any_clients */
	T0* a38; /* tuple_type */
	T0* a39; /* detachable_tuple_type */
	T0* a40; /* tuple_like_current_type */
	T0* a41; /* unfolded_empty_tuple_actual_parameters */
	T0* a42; /* array_any_type */
	T0* a43; /* array_detachable_any_type */
	T0* a44; /* array_like_current_type */
	T0* a45; /* boolean_type */
	T0* a46; /* character_type */
	T0* a47; /* character_8_type */
	T0* a48; /* character_8_convert_feature */
	T0* a49; /* character_32_type */
	T0* a50; /* character_32_convert_feature */
	T0* a51; /* double_type */
	T0* a52; /* exception_type */
	T0* a53; /* detachable_exception_type */
	T0* a54; /* exception_manager_type */
	T0* a55; /* function_type */
	T0* a56; /* integer_type */
	T0* a57; /* integer_8_type */
	T0* a58; /* integer_8_convert_feature */
	T0* a59; /* integer_16_type */
	T0* a60; /* integer_16_convert_feature */
	T0* a61; /* integer_32_type */
	T0* a62; /* integer_32_convert_feature */
	T0* a63; /* integer_64_type */
	T0* a64; /* integer_64_convert_feature */
	T0* a65; /* ise_exception_manager_type */
	T0* a66; /* iterable_detachable_any_type */
	T0* a67; /* natural_type */
	T0* a68; /* natural_8_type */
	T0* a69; /* natural_8_convert_feature */
	T0* a70; /* natural_16_type */
	T0* a71; /* natural_16_convert_feature */
	T0* a72; /* natural_32_type */
	T0* a73; /* natural_32_convert_feature */
	T0* a74; /* natural_64_type */
	T0* a75; /* natural_64_convert_feature */
	T0* a76; /* none_type */
	T0* a77; /* detachable_none_type */
	T0* a78; /* pointer_type */
	T0* a79; /* predicate_like_current_type */
	T0* a80; /* procedure_like_current_type */
	T0* a81; /* real_type */
	T0* a82; /* real_32_type */
	T0* a83; /* real_32_convert_feature */
	T0* a84; /* real_64_type */
	T0* a85; /* real_64_convert_feature */
	T0* a86; /* routine_type */
	T0* a87; /* special_any_type */
	T0* a88; /* special_detachable_any_type */
	T0* a89; /* string_type */
	T0* a90; /* detachable_string_type */
	T0* a91; /* string_8_type */
	T0* a92; /* string_8_convert_feature */
	T0* a93; /* string_32_type */
	T0* a94; /* string_32_convert_feature */
	T0* a95; /* system_object_type */
	T0* a96; /* system_object_parents */
	T0* a97; /* system_string_type */
	T0* a98; /* type_any_type */
	T0* a99; /* type_type_any_type */
	T0* a100; /* type_detachable_any_type */
	T0* a101; /* type_detachable_like_current_type */
	T0* a102; /* detachable_type_exception_type */
	T0* a103; /* type_detachable_exception_type */
	T0* a104; /* detachable_type_detachable_any_type */
	T0* a105; /* type_like_current_type */
	T0* a106; /* typed_pointer_any_type */
	T0* a107; /* typed_pointer_like_current_type */
	T0* a108; /* wide_character_type */
	T1 a109; /* is_read_only */
	T1 a110; /* use_attribute_keyword */
	T1 a111; /* use_note_keyword */
	T1 a112; /* use_reference_keyword */
	T1 a113; /* use_attached_keyword */
	T1 a114; /* use_detachable_keyword */
	T6 a115; /* registered_class_count */
};

/* Struct for type XM_ATTRIBUTE */
struct S200 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* name */
	T0* a2; /* namespace */
	T0* a3; /* value */
	T0* a4; /* parent */
};

/* Struct for type DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE] */
struct S201 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_HASH_TABLE [INTEGER_32, STRING_8] */
struct S204 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* found_position */
	T6 a2; /* position */
	T0* a3; /* item_storage */
	T0* a4; /* key_equality_tester */
	T0* a5; /* internal_keys */
	T6 a6; /* free_slot */
	T6 a7; /* last_position */
	T6 a8; /* count */
	T6 a9; /* modulus */
	T6 a10; /* slots_position */
	T6 a11; /* clashes_previous_position */
	T0* a12; /* equality_tester */
	T0* a13; /* clashes */
	T0* a14; /* slots */
	T0* a15; /* special_item_routines */
	T0* a16; /* special_key_routines */
	T0* a17; /* key_storage */
	T6 a18; /* capacity */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type SPECIAL [NATURAL_64] */
struct S208 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T11 z2[1]; /* item */
};

/* Struct for type XM_NAMESPACE_RESOLVER */
struct S209 {
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
struct S210 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type SPECIAL [XM_CALLBACKS_FILTER] */
struct S211 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type XM_CALLBACKS_NULL */
struct S212 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_HASH_SET [XM_NAMESPACE] */
struct S213 {
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

/* Struct for type UT_TEMPLATE_EXPANDER */
struct S217 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type detachable DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8] */
struct S220 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T6 a3; /* position */
};

/* Struct for type SPECIAL [ET_XACE_LIBRARY_CONFIG] */
struct S221 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY_CONFIG] */
struct S222 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type XM_EIFFEL_SCANNER */
struct S223 {
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
struct S224 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* source_name */
	T6 a2; /* row */
	T6 a3; /* column */
	T6 a4; /* byte_index */
};

/* Struct for type DS_BILINKED_LIST [XM_POSITION] */
struct S226 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* first_cell */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
struct S227 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* first_cell */
};

/* Struct for type DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S228 {
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
struct S230 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type XM_DTD_CALLBACKS_NULL */
struct S232 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_SPECIAL_ROUTINES [detachable ANY] */
struct S233 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [detachable ANY] */
struct S234 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
struct S235 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type XM_EIFFEL_PARSER_NAME */
struct S236 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* use_namespaces */
	T6 a2; /* count */
	T0* a3; /* first */
	T0* a4; /* second */
	T0* a5; /* tail */
};

/* Struct for type SPECIAL [XM_EIFFEL_PARSER_NAME] */
struct S237 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S238 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
struct S239 {
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
struct S240 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
struct S241 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type XM_DTD_EXTERNAL_ID */
struct S242 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* system_id */
	T0* a2; /* public_id */
};

/* Struct for type SPECIAL [XM_DTD_EXTERNAL_ID] */
struct S243 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
struct S244 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type XM_DTD_ELEMENT_CONTENT */
struct S245 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* items */
	T2 a2; /* repetition */
	T0* a3; /* name */
	T2 a4; /* type */
	T1 a5; /* is_character_data_allowed */
};

/* Struct for type SPECIAL [XM_DTD_ELEMENT_CONTENT] */
struct S246 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S247 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
struct S248 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* last_cell */
	T6 a2; /* count */
	T0* a3; /* first_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S249 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
struct S250 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type XM_DTD_ATTRIBUTE_CONTENT */
struct S251 {
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
struct S252 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
struct S253 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_BILINKED_LIST [STRING_8] */
struct S254 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* last_cell */
	T6 a2; /* count */
	T0* a3; /* first_cell */
	T0* a4; /* equality_tester */
	T0* a5; /* internal_cursor */
};

/* Struct for type SPECIAL [DS_BILINKED_LIST [STRING_8]] */
struct S255 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [BOOLEAN] */
struct S256 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
struct S257 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type XM_EIFFEL_DECLARATION */
struct S258 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* encoding */
	T0* a2; /* version */
	T1 a3; /* stand_alone */
};

/* Struct for type SPECIAL [XM_EIFFEL_DECLARATION] */
struct S259 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type XM_EIFFEL_ENTITY_DEF */
struct S263 {
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
struct S264 {
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
struct S266 {
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

/* Struct for type ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR */
struct S268 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_BOOLEAN_EXPECTED_ERROR */
struct S269 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR */
struct S270 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR */
struct S271 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR */
struct S272 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING */
struct S273 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_WRONG_ROOT_ELEMENT_ERROR */
struct S274 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_MISSING_ATTRIBUTE_ERROR */
struct S275 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_MISSING_ELEMENT_ERROR */
struct S276 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING */
struct S277 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_UNKNOWN_ELEMENT_ERROR */
struct S278 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING */
struct S279 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_UNKNOWN_OPTION_NAME_WARNING */
struct S280 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type KL_OPERATING_SYSTEM */
struct S281 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type XM_NAMESPACE */
struct S284 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* uri */
	T0* a2; /* ns_prefix */
};

/* Struct for type XM_LINKED_LIST [XM_DOCUMENT_NODE] */
struct S285 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* last_cell */
	T0* a3; /* first_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type XM_LINKED_LIST [XM_ELEMENT_NODE] */
struct S287 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* internal_cursor */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* first_cell */
};

/* Struct for type DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S291 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S292 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* internal_cursor */
	T0* a2; /* last_cell */
	T6 a3; /* count */
	T0* a4; /* first_cell */
};

/* Struct for type DS_PAIR [XM_POSITION, XM_NODE] */
struct S293 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* first */
	T0* a2; /* second */
};

/* Struct for type ARRAY [INTEGER_32] */
struct S294 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type UC_UTF8_ROUTINES */
struct S295 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type UC_UTF8_STRING */
struct S296 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* area */
	T6 a3; /* byte_count */
	T6 a4; /* internal_hash_code */
	T6 a5; /* last_byte_index_input */
	T6 a6; /* last_byte_index_result */
	T6 a7; /* internal_case_insensitive_hash_code */
};

/* Struct for type XM_EIFFEL_INPUT_STREAM */
struct S297 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* last_string */
	T6 a2; /* encoding */
	T0* a3; /* impl */
	T0* a4; /* utf_queue */
};

/* Struct for type KL_INTEGER_ROUTINES */
struct S298 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_PLATFORM */
struct S299 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_ARRAY_ROUTINES [INTEGER_32] */
struct S300 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type UT_TRISTATE */
struct S301 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T2 a1; /* value */
};

/* Struct for type SPECIAL [ET_XACE_CLUSTER] */
struct S302 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER] */
struct S303 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [ET_XACE_CLUSTER] */
struct S304 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type SPECIAL [ET_XACE_MOUNTED_LIBRARY] */
struct S305 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY] */
struct S306 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [ET_XACE_MOUNTED_LIBRARY] */
struct S307 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type detachable DS_LINKABLE [ET_XACE_CLASS_OPTIONS] */
struct S308 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type detachable DS_LINKABLE [ET_XACE_FEATURE_OPTIONS] */
struct S309 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type detachable DS_LINKABLE [ET_XACE_ASSEMBLY] */
struct S310 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type EXECUTION_ENVIRONMENT */
struct S311 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type detachable DS_LINKABLE [ET_XACE_CLUSTER] */
struct S312 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type ET_ERROR_HANDLER */
struct S313 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* error_file */
	T0* a2; /* warning_file */
	T0* a3; /* info_file */
};

/* Struct for type ET_AST_FACTORY */
struct S314 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type ET_AST_NULL_PROCESSOR */
struct S315 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type ET_ADAPTED_LIBRARIES */
struct S317 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* libraries */
};

/* Struct for type ET_CLUSTERS */
struct S318 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* clusters */
};

/* Struct for type ET_ADAPTED_DOTNET_ASSEMBLIES */
struct S319 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* dotnet_assemblies */
};

/* Struct for type DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME] */
struct S320 {
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

/* Struct for type ET_CLASS_NAME_TESTER */
struct S321 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type ET_CLASS_TYPE */
struct S323 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* type_mark */
	T0* a2; /* name */
	T0* a3; /* named_base_class */
	T0* a4; /* actual_parameters */
};

/* Struct for type ET_PARENT */
struct S324 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* type */
	T0* a2; /* renames */
	T0* a3; /* exports */
	T0* a4; /* undefines */
	T0* a5; /* redefines */
	T0* a6; /* selects */
	T0* a7; /* end_keyword */
};

/* Struct for type ET_PARENT_LIST */
struct S325 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* inherit_keyword */
	T6 a2; /* count */
	T0* a3; /* storage */
};

/* Struct for type ET_CLIENT_LIST */
struct S326 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* storage */
};

/* Struct for type ET_TUPLE_TYPE */
struct S327 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* type_mark */
	T0* a2; /* tuple_keyword */
	T0* a3; /* actual_parameters */
	T0* a4; /* named_base_class */
};

/* Struct for type ET_ACTUAL_PARAMETER_LIST */
struct S329 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* left_bracket */
	T0* a2; /* right_bracket */
	T6 a3; /* count */
	T0* a4; /* storage */
};

/* Struct for type ET_BUILTIN_CONVERT_FEATURE */
struct S330 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* name */
	T0* a2; /* types */
	T0* a3; /* type */
};

/* Struct for type ET_MASTER_CLASS */
struct S332 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* name */
	T0* a2; /* universe */
	T0* a3; /* other_local_override_classes */
	T0* a4; /* other_local_non_override_classes */
	T0* a5; /* other_local_ignored_classes */
	T0* a6; /* other_local_hidden_classes */
	T0* a7; /* other_imported_classes */
	T0* a8; /* other_overriding_classes */
	T0* a9; /* intrinsic_class */
	T0* a10; /* mapped_class */
	T1 a11; /* is_modified */
	T1 a12; /* is_marked */
	T0* a13; /* first_local_ignored_class */
	T0* a14; /* first_local_override_class */
	T0* a15; /* first_local_non_override_class */
	T0* a16; /* first_local_hidden_class */
	T0* a17; /* first_imported_class */
	T0* a18; /* first_overriding_class */
};

/* Struct for type ET_CLIENT */
struct S333 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* name */
	T0* a2; /* named_base_class */
};

/* Struct for type ET_IMPLICIT_TYPE_MARK */
struct S334 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* is_attached_mark */
	T1 a2; /* is_detachable_mark */
};

/* Struct for type ET_KEYWORD */
struct S337 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T2 a1; /* code */
	T0* a2; /* text */
	T6 a3; /* compressed_position */
};

/* Struct for type ET_LIKE_CURRENT */
struct S344 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* type_mark */
	T0* a2; /* like_keyword */
	T0* a3; /* current_keyword */
};

/* Struct for type ET_UNFOLDED_EMPTY_TUPLE_ACTUAL_PARAMETERS */
struct S346 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* tuple_type */
};

/* Struct for type ET_CLASS */
struct S348 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* name */
	T1 a2; /* is_ignored */
	T0* a3; /* group */
	T1 a4; /* is_parsed */
	T1 a5; /* has_syntax_error */
	T1 a6; /* ancestors_built */
	T1 a7; /* has_ancestors_error */
	T1 a8; /* features_flattened */
	T1 a9; /* has_flattening_error */
	T1 a10; /* interface_checked */
	T1 a11; /* has_interface_error */
	T1 a12; /* implementation_checked */
	T1 a13; /* has_implementation_error */
	T6 a14; /* id */
	T0* a15; /* ancestors */
	T0* a16; /* queries */
	T0* a17; /* procedures */
	T0* a18; /* class_keyword */
	T0* a19; /* end_keyword */
	T0* a20; /* named_base_class */
	T6 a21; /* time_stamp */
	T8 a22; /* class_code */
	T1 a23; /* tuple_actual_parameters_unfolded_1 */
	T1 a24; /* tuple_actual_parameters_unfolded_2 */
	T1 a25; /* is_marked */
};

/* Struct for type ET_NONE_GROUP */
struct S349 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* name */
	T0* a2; /* universe */
};

/* Struct for type DS_HASH_TABLE_CURSOR [INTEGER_32, STRING_8] */
struct S352 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type XM_NAMESPACE_RESOLVER_CONTEXT */
struct S353 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* context */
};

/* Struct for type DS_LINKED_QUEUE [STRING_8] */
struct S355 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* first_cell */
	T6 a2; /* count */
	T0* a3; /* last_cell */
};

/* Struct for type detachable KL_EQUALITY_TESTER [XM_NAMESPACE] */
struct S356 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_HASH_SET_CURSOR [XM_NAMESPACE] */
struct S357 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
struct S358 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [XM_NAMESPACE] */
struct S359 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type XM_EIFFEL_CHARACTER_ENTITY */
struct S360 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* code */
};

/* Struct for type YY_BUFFER */
struct S361 {
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
struct S362 {
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
struct S366 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_POSITION] */
struct S367 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type detachable DS_LINKABLE [XM_EIFFEL_SCANNER] */
struct S368 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type SPECIAL [XM_EIFFEL_ENTITY_DEF] */
struct S369 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type detachable DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S372 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T6 a3; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
struct S373 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type detachable KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
struct S376 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
struct S377 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
struct S378 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* first_cell */
	T6 a2; /* count */
	T0* a3; /* last_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
struct S379 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type detachable DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
struct S380 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [STRING_8] */
struct S381 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type detachable DS_BILINKABLE [STRING_8] */
struct S382 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING */
struct S383 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_INVALID_EXPRESSION_ERROR */
struct S384 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* parameters */
};

/* Struct for type UC_UNICODE_ROUTINES */
struct S387 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type HEXADECIMAL_STRING_TO_INTEGER_CONVERTER */
struct S388 {
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

/* Struct for type DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE] */
struct S389 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type XM_COMMENT */
struct S390 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* data */
	T0* a2; /* parent */
};

/* Struct for type XM_PROCESSING_INSTRUCTION */
struct S391 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* target */
	T0* a2; /* data */
	T0* a3; /* parent */
};

/* Struct for type XM_CHARACTER_DATA */
struct S392 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* content */
	T0* a2; /* parent */
};

/* Struct for type detachable DS_LINKABLE [XM_DOCUMENT_NODE] */
struct S395 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_LINKED_QUEUE [CHARACTER_8] */
struct S400 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
};

/* Struct for type UC_UTF16_ROUTINES */
struct S401 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_ARRAYED_LIST [ET_ADAPTED_LIBRARY] */
struct S402 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST [ET_CLUSTER] */
struct S403 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST [ET_ADAPTED_DOTNET_ASSEMBLY] */
struct S404 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
};

/* Struct for type SPECIAL [ET_MASTER_CLASS] */
struct S405 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_MASTER_CLASS] */
struct S408 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_CLASS_NAME] */
struct S409 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [ET_CLASS_NAME] */
struct S410 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [ET_MASTER_CLASS, ET_CLASS_NAME] */
struct S411 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type SPECIAL [ET_PARENT_ITEM] */
struct S413 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_PARENT_ITEM] */
struct S414 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [ET_CLIENT_ITEM] */
struct S415 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_CLIENT_ITEM] */
struct S416 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type ET_IDENTIFIER */
struct S417 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* hash_code */
	T0* a2; /* name */
	T6 a3; /* compressed_position */
};

/* Struct for type ET_SYMBOL */
struct S418 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T2 a1; /* code */
	T6 a2; /* compressed_position */
};

/* Struct for type ET_BRACKET_SYMBOL */
struct S419 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T2 a1; /* code */
	T6 a2; /* compressed_position */
};

/* Struct for type SPECIAL [ET_ACTUAL_PARAMETER_ITEM] */
struct S421 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_ACTUAL_PARAMETER_ITEM] */
struct S422 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type ET_BRACED_TYPE_LIST */
struct S425 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* left_brace */
	T0* a2; /* right_brace */
	T6 a3; /* count */
	T0* a4; /* storage */
};

/* Struct for type DS_ARRAYED_LIST [ET_CLASS] */
struct S426 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T6 a4; /* count */
	T0* a5; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST [ET_MASTER_CLASS] */
struct S427 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T6 a4; /* count */
	T0* a5; /* internal_cursor */
	T0* a6; /* equality_tester */
};

/* Struct for type [attached] TUPLE [ET_MASTER_CLASS] */
struct S428 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* z1;
};

/* Struct for type [attached] PROCEDURE [[attached] TUPLE [ET_MASTER_CLASS]] */
struct S429 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(GE_context*, T0*, T0*);
};

/* Struct for type DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S431 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* last_cell */
	T0* a3; /* first_cell */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S432 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* before */
	T0* a2; /* current_cell */
	T0* a3; /* next_cursor */
	T0* a4; /* container */
	T1 a5; /* after */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
struct S433 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type attached DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
struct S434 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type KL_WINDOWS_FILE_SYSTEM */
struct S436 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T2 a1; /* secondary_directory_separator */
};

/* Struct for type ET_UNKNOWN_GROUP */
struct S438 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* name */
};

/* Struct for type detachable DS_LINKABLE [XM_ELEMENT_NODE] */
struct S440 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* right */
	T0* a2; /* item */
};

/* Struct for type KL_STRING_INPUT_STREAM */
struct S441 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T1 a1; /* end_of_input */
	T2 a2; /* last_character */
	T0* a3; /* last_string */
	T0* a4; /* string */
	T6 a5; /* location */
};

/* Struct for type detachable DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S442 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type ET_CURRENT */
struct S444 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T2 a1; /* code */
	T0* a2; /* text */
	T6 a3; /* compressed_position */
};

/* Struct for type ET_BASE_TYPE_LIST */
struct S445 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* storage */
};

/* Struct for type ET_QUERY_LIST */
struct S446 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* storage */
};

/* Struct for type ET_PROCEDURE_LIST */
struct S447 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T0* a2; /* storage */
};

/* Struct for type ET_CLASS_CODES */
struct S448 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_CHARACTER_BUFFER */
struct S449 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* as_special */
	T0* a2; /* area */
};

/* Struct for type SPECIAL [ARRAY [INTEGER_32]] */
struct S450 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
struct S451 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type detachable DS_LINKABLE [CHARACTER_8] */
struct S452 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T2 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_ADAPTED_LIBRARY] */
struct S453 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [ET_ADAPTED_LIBRARY] */
struct S455 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_LIBRARY] */
struct S456 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_CLUSTER] */
struct S457 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [ET_CLUSTER] */
struct S458 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [ET_CLUSTER] */
struct S459 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_ADAPTED_DOTNET_ASSEMBLY] */
struct S460 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [ET_ADAPTED_DOTNET_ASSEMBLY] */
struct S462 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_DOTNET_ASSEMBLY] */
struct S463 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type SPECIAL [ET_TYPE_ITEM] */
struct S465 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_TYPE_ITEM] */
struct S466 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_CLASS] */
struct S467 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [ET_CLASS] */
struct S468 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [ET_CLASS] */
struct S469 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S470 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [ET_MASTER_CLASS] */
struct S472 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME] */
struct S473 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* found_position */
	T0* a2; /* item_storage */
	T6 a3; /* position */
	T0* a4; /* key_equality_tester */
	T0* a5; /* internal_keys */
	T6 a6; /* last_position */
	T6 a7; /* capacity */
	T6 a8; /* slots_position */
	T6 a9; /* count */
	T0* a10; /* equality_tester */
	T6 a11; /* modulus */
	T6 a12; /* clashes_previous_position */
	T0* a13; /* special_item_routines */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* special_key_routines */
	T0* a17; /* key_storage */
	T6 a18; /* free_slot */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type STRING_8_SEARCHER */
struct S474 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* deltas */
};

/* Struct for type SPECIAL [ET_BASE_TYPE] */
struct S475 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_BASE_TYPE] */
struct S476 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [ET_QUERY] */
struct S478 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_QUERY] */
struct S479 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type SPECIAL [ET_PROCEDURE] */
struct S481 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_PROCEDURE] */
struct S482 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type KL_SPECIAL_ROUTINES [NATURAL_8] */
struct S485 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
};

/* Struct for type DS_HASH_TABLE_CURSOR [NATURAL_8, ET_CLASS_NAME] */
struct S486 {
	EIF_TYPE_INDEX id;
	uint16_t flags;
	T0* a1; /* container */
	T6 a2; /* position */
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
extern T34 GE_default34;
extern T35 GE_default35;
extern T37 GE_default37;
extern T38 GE_default38;
extern T39 GE_default39;
extern T40 GE_default40;
extern T41 GE_default41;
extern T43 GE_default43;
extern T47 GE_default47;
extern T48 GE_default48;
extern T50 GE_default50;
extern T51 GE_default51;
extern T52 GE_default52;
extern T53 GE_default53;
extern T54 GE_default54;
extern T56 GE_default56;
extern T58 GE_default58;
extern T60 GE_default60;
extern T61 GE_default61;
extern T62 GE_default62;
extern T63 GE_default63;
extern T64 GE_default64;
extern T65 GE_default65;
extern T66 GE_default66;
extern T69 GE_default69;
extern T70 GE_default70;
extern T71 GE_default71;
extern T72 GE_default72;
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
extern T91 GE_default91;
extern T93 GE_default93;
extern T94 GE_default94;
extern T95 GE_default95;
extern T96 GE_default96;
extern T97 GE_default97;
extern T99 GE_default99;
extern T100 GE_default100;
extern T101 GE_default101;
extern T102 GE_default102;
extern T104 GE_default104;
extern T105 GE_default105;
extern T106 GE_default106;
extern T107 GE_default107;
extern T109 GE_default109;
extern T110 GE_default110;
extern T111 GE_default111;
extern T112 GE_default112;
extern T113 GE_default113;
extern T114 GE_default114;
extern T116 GE_default116;
extern T117 GE_default117;
extern T118 GE_default118;
extern T119 GE_default119;
extern T122 GE_default122;
extern T124 GE_default124;
extern T125 GE_default125;
extern T126 GE_default126;
extern T128 GE_default128;
extern T129 GE_default129;
extern T130 GE_default130;
extern T131 GE_default131;
extern T132 GE_default132;
extern T133 GE_default133;
extern T134 GE_default134;
extern T135 GE_default135;
extern T136 GE_default136;
extern T137 GE_default137;
extern T138 GE_default138;
extern T139 GE_default139;
extern T140 GE_default140;
extern T141 GE_default141;
extern T142 GE_default142;
extern T143 GE_default143;
extern T145 GE_default145;
extern T146 GE_default146;
extern T147 GE_default147;
extern T148 GE_default148;
extern T149 GE_default149;
extern T150 GE_default150;
extern T151 GE_default151;
extern T152 GE_default152;
extern T157 GE_default157;
extern T158 GE_default158;
extern T159 GE_default159;
extern T160 GE_default160;
extern T161 GE_default161;
extern T162 GE_default162;
extern T163 GE_default163;
extern T164 GE_default164;
extern T165 GE_default165;
extern T166 GE_default166;
extern T167 GE_default167;
extern T168 GE_default168;
extern T169 GE_default169;
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
extern T182 GE_default182;
extern T183 GE_default183;
extern T184 GE_default184;
extern T185 GE_default185;
extern T186 GE_default186;
extern T187 GE_default187;
extern T188 GE_default188;
extern T189 GE_default189;
extern T191 GE_default191;
extern T192 GE_default192;
extern T193 GE_default193;
extern T194 GE_default194;
extern T196 GE_default196;
extern T197 GE_default197;
extern T200 GE_default200;
extern T201 GE_default201;
extern T204 GE_default204;
extern T207 GE_default207;
extern T208 GE_default208;
extern T209 GE_default209;
extern T210 GE_default210;
extern T211 GE_default211;
extern T212 GE_default212;
extern T213 GE_default213;
extern T217 GE_default217;
extern T220 GE_default220;
extern T221 GE_default221;
extern T222 GE_default222;
extern T223 GE_default223;
extern T224 GE_default224;
extern T226 GE_default226;
extern T227 GE_default227;
extern T228 GE_default228;
extern T230 GE_default230;
extern T232 GE_default232;
extern T233 GE_default233;
extern T234 GE_default234;
extern T235 GE_default235;
extern T236 GE_default236;
extern T237 GE_default237;
extern T238 GE_default238;
extern T239 GE_default239;
extern T240 GE_default240;
extern T241 GE_default241;
extern T242 GE_default242;
extern T243 GE_default243;
extern T244 GE_default244;
extern T245 GE_default245;
extern T246 GE_default246;
extern T247 GE_default247;
extern T248 GE_default248;
extern T249 GE_default249;
extern T250 GE_default250;
extern T251 GE_default251;
extern T252 GE_default252;
extern T253 GE_default253;
extern T254 GE_default254;
extern T255 GE_default255;
extern T256 GE_default256;
extern T257 GE_default257;
extern T258 GE_default258;
extern T259 GE_default259;
extern T263 GE_default263;
extern T264 GE_default264;
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
extern T276 GE_default276;
extern T277 GE_default277;
extern T278 GE_default278;
extern T279 GE_default279;
extern T280 GE_default280;
extern T281 GE_default281;
extern T284 GE_default284;
extern T285 GE_default285;
extern T287 GE_default287;
extern T291 GE_default291;
extern T292 GE_default292;
extern T293 GE_default293;
extern T294 GE_default294;
extern T295 GE_default295;
extern T296 GE_default296;
extern T297 GE_default297;
extern T298 GE_default298;
extern T299 GE_default299;
extern T300 GE_default300;
extern T301 GE_default301;
extern T302 GE_default302;
extern T303 GE_default303;
extern T304 GE_default304;
extern T305 GE_default305;
extern T306 GE_default306;
extern T307 GE_default307;
extern T308 GE_default308;
extern T309 GE_default309;
extern T310 GE_default310;
extern T311 GE_default311;
extern T312 GE_default312;
extern T313 GE_default313;
extern T314 GE_default314;
extern T315 GE_default315;
extern T317 GE_default317;
extern T318 GE_default318;
extern T319 GE_default319;
extern T320 GE_default320;
extern T321 GE_default321;
extern T323 GE_default323;
extern T324 GE_default324;
extern T325 GE_default325;
extern T326 GE_default326;
extern T327 GE_default327;
extern T329 GE_default329;
extern T330 GE_default330;
extern T332 GE_default332;
extern T333 GE_default333;
extern T334 GE_default334;
extern T337 GE_default337;
extern T344 GE_default344;
extern T346 GE_default346;
extern T348 GE_default348;
extern T349 GE_default349;
extern T352 GE_default352;
extern T353 GE_default353;
extern T355 GE_default355;
extern T356 GE_default356;
extern T357 GE_default357;
extern T358 GE_default358;
extern T359 GE_default359;
extern T360 GE_default360;
extern T361 GE_default361;
extern T362 GE_default362;
extern T366 GE_default366;
extern T367 GE_default367;
extern T368 GE_default368;
extern T369 GE_default369;
extern T372 GE_default372;
extern T373 GE_default373;
extern T376 GE_default376;
extern T377 GE_default377;
extern T378 GE_default378;
extern T379 GE_default379;
extern T380 GE_default380;
extern T381 GE_default381;
extern T382 GE_default382;
extern T383 GE_default383;
extern T384 GE_default384;
extern T387 GE_default387;
extern T388 GE_default388;
extern T389 GE_default389;
extern T390 GE_default390;
extern T391 GE_default391;
extern T392 GE_default392;
extern T395 GE_default395;
extern T400 GE_default400;
extern T401 GE_default401;
extern T402 GE_default402;
extern T403 GE_default403;
extern T404 GE_default404;
extern T405 GE_default405;
extern T408 GE_default408;
extern T409 GE_default409;
extern T410 GE_default410;
extern T411 GE_default411;
extern T413 GE_default413;
extern T414 GE_default414;
extern T415 GE_default415;
extern T416 GE_default416;
extern T417 GE_default417;
extern T418 GE_default418;
extern T419 GE_default419;
extern T421 GE_default421;
extern T422 GE_default422;
extern T425 GE_default425;
extern T426 GE_default426;
extern T427 GE_default427;
extern T428 GE_default428;
extern T429 GE_default429;
extern T431 GE_default431;
extern T432 GE_default432;
extern T433 GE_default433;
extern T434 GE_default434;
extern T436 GE_default436;
extern T438 GE_default438;
extern T440 GE_default440;
extern T441 GE_default441;
extern T442 GE_default442;
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
extern T455 GE_default455;
extern T456 GE_default456;
extern T457 GE_default457;
extern T458 GE_default458;
extern T459 GE_default459;
extern T460 GE_default460;
extern T462 GE_default462;
extern T463 GE_default463;
extern T465 GE_default465;
extern T466 GE_default466;
extern T467 GE_default467;
extern T468 GE_default468;
extern T469 GE_default469;
extern T470 GE_default470;
extern T472 GE_default472;
extern T473 GE_default473;
extern T474 GE_default474;
extern T475 GE_default475;
extern T476 GE_default476;
extern T478 GE_default478;
extern T479 GE_default479;
extern T481 GE_default481;
extern T482 GE_default482;
extern T485 GE_default485;
extern T486 GE_default486;

extern T0* GE_ms8(const char *s, T6 c);
extern T0* GE_ms32(char* s, T6 c);
/* Call to UT_ERROR.default_message */
extern T0* T42x3913(GE_context* ac, T0* C);
/* Call to ET_XACE_GENERATOR.default_library_output_filename */
extern T0* T49x4106(GE_context* ac, T0* C);
/* Call to ET_XACE_GENERATOR.default_system_output_filename */
extern T0* T49x4105(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.start_condition */
extern T6 T223x15047(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.is_applicable_encoding */
extern T1 T223x14916T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.end_of_file */
extern T1 T223x15053(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.last_value */
extern T0* T223x14927(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.last_token */
extern T6 T223x15043(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.error_position */
extern T0* T223x14925(GE_context* ac, T0* C);
/* Call to XM_DOCUMENT_NODE.parent */
extern T0* T286x9378(GE_context* ac, T0* C);
/* Call to XM_ELEMENT_NODE.parent */
extern T0* T393x9378(GE_context* ac, T0* C);
/* Call to EXCEPTION.set_type_name */
extern void T28x2718T0(GE_context* ac, T0* C, T0* a1);
/* Call to EXCEPTION.set_recipient_name */
extern void T28x2714T0(GE_context* ac, T0* C, T0* a1);
/* Call to EXCEPTION.set_description */
extern void T28x2706T0(GE_context* ac, T0* C, T0* a1);
/* Call to EXCEPTION.set_exception_trace */
extern void T28x2720T0(GE_context* ac, T0* C, T0* a1);
/* Call to EXCEPTION.set_throwing_exception */
extern void T28x2713T0(GE_context* ac, T0* C, T0* a1);
/* Call to GEXACE_COMMAND.set_xace_filename */
extern void T36x3022T0(GE_context* ac, T0* C, T0* a1);
/* Call to GEXACE_COMMAND.execute */
extern void T36x3027(GE_context* ac, T0* C);
/* Call to ET_XACE_GENERATOR.generate_library */
extern void T49x4112T0T0(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Call to ET_XACE_GENERATOR.generate_system */
extern void T49x4111T0T0(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Call to ET_XACE_GENERATOR.set_shallow */
extern void T49x4110T1(GE_context* ac, T0* C, T1 a1);
/* Call to XM_CALLBACKS_FILTER.set_next */
extern void T153x9701T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_xml_declaration */
extern void T154x9651T0T0T1(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* Call to XM_CALLBACKS.on_error */
extern void T154x9652T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_start_tag_finish */
extern void T154x9657(GE_context* ac, T0* C);
/* Call to XM_CALLBACKS.on_finish */
extern void T154x9650(GE_context* ac, T0* C);
/* Call to XM_CALLBACKS.on_attribute */
extern void T154x9656T0T0T0T0(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* Call to XM_CALLBACKS.on_end_tag */
extern void T154x9658T0T0T0(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_start_tag */
extern void T154x9655T0T0T0(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_content */
extern void T154x9659T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_processing_instruction */
extern void T154x9653T0T0(GE_context* ac, T0* C, T0* a1, T0* a2);
/* Call to XM_CALLBACKS.on_comment */
extern void T154x9654T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_start */
extern void T154x9649(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.close_input */
extern void T223x14912(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T223x14911T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.set_encoding */
extern void T223x14917T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T223x14908(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.read_token */
extern void T223x15061(GE_context* ac, T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_stream */
extern void T223x14910T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_DOCUMENT_NODE.node_set_parent */
extern void T286x9401T0(GE_context* ac, T0* C, T0* a1);
/* Call to XM_ELEMENT_NODE.node_set_parent */
extern void T393x9401T0(GE_context* ac, T0* C, T0* a1);
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
/* New instance of type GEXACE */
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
/* New instance of type DS_LINKED_LIST_CURSOR [GEXACE_COMMAND] */
extern T0* GE_new29(T1 initialize);
/* New instance of type KL_ARGUMENTS */
extern T0* GE_new30(T1 initialize);
/* New instance of type DS_HASH_TABLE [STRING_8, STRING_8] */
extern T0* GE_new31(T1 initialize);
/* New instance of type UC_STRING_EQUALITY_TESTER */
extern T0* GE_new32(T1 initialize);
/* New instance of type DS_LINKED_LIST [GEXACE_COMMAND] */
extern T0* GE_new34(T1 initialize);
/* New instance of type ET_XACE_DEFAULT_ERROR_HANDLER */
extern T0* GE_new35(T1 initialize);
/* New instance of type KL_EXCEPTIONS */
extern T0* GE_new37(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [STRING_8] */
extern T0* GE_new38(T1 initialize);
/* New instance of type DS_PAIR [STRING_8, STRING_8] */
extern T0* GE_new39(T1 initialize);
/* New instance of type DS_LINKED_LIST [STRING_8] */
extern T0* GE_new40(T1 initialize);
/* New instance of type UT_USAGE_MESSAGE */
extern T0* GE_new41(T1 initialize);
/* New instance of type GEXACE_SYSTEM_COMMAND */
extern T0* GE_new43(T1 initialize);
/* New instance of type GEXACE_LIBRARY_COMMAND */
extern T0* GE_new47(T1 initialize);
/* New instance of type GEXACE_VALIDATE_COMMAND */
extern T0* GE_new48(T1 initialize);
/* New instance of type ET_XACE_XACE_GENERATOR */
extern T0* GE_new50(T1 initialize);
/* New instance of type ET_XACE_ACE_GENERATOR */
extern T0* GE_new51(T1 initialize);
/* New instance of type ET_XACE_ECF_GENERATOR */
extern T0* GE_new52(T1 initialize);
/* New instance of type DS_LINKED_LIST [ET_XACE_GENERATOR] */
extern T0* GE_new53(T1 initialize);
/* New instance of type VOID_TARGET */
extern T0* GE_new54(T1 initialize);
/* New instance of type ROUTINE_FAILURE */
extern T0* GE_new56(T1 initialize);
/* New instance of type OLD_VIOLATION */
extern T0* GE_new58(T1 initialize);
/* New instance of type NO_MORE_MEMORY */
extern T0* GE_new60(T1 initialize);
/* New instance of type INVARIANT_VIOLATION */
extern T0* GE_new61(T1 initialize);
/* New instance of type OPERATING_SYSTEM_SIGNAL_FAILURE */
extern T0* GE_new62(T1 initialize);
/* New instance of type IO_FAILURE */
extern T0* GE_new63(T1 initialize);
/* New instance of type OPERATING_SYSTEM_FAILURE */
extern T0* GE_new64(T1 initialize);
/* New instance of type COM_FAILURE */
extern T0* GE_new65(T1 initialize);
/* New instance of type EIFFEL_RUNTIME_PANIC */
extern T0* GE_new66(T1 initialize);
/* New instance of type PRECONDITION_VIOLATION */
extern T0* GE_new69(T1 initialize);
/* New instance of type POSTCONDITION_VIOLATION */
extern T0* GE_new70(T1 initialize);
/* New instance of type FLOATING_POINT_FAILURE */
extern T0* GE_new71(T1 initialize);
/* New instance of type CHECK_VIOLATION */
extern T0* GE_new72(T1 initialize);
/* New instance of type BAD_INSPECT_VALUE */
extern T0* GE_new73(T1 initialize);
/* New instance of type VARIANT_VIOLATION */
extern T0* GE_new74(T1 initialize);
/* New instance of type LOOP_INVARIANT_VIOLATION */
extern T0* GE_new75(T1 initialize);
/* New instance of type RESCUE_FAILURE */
extern T0* GE_new76(T1 initialize);
/* New instance of type RESUMPTION_FAILURE */
extern T0* GE_new77(T1 initialize);
/* New instance of type CREATE_ON_DEFERRED */
extern T0* GE_new78(T1 initialize);
/* New instance of type EXTERNAL_FAILURE */
extern T0* GE_new79(T1 initialize);
/* New instance of type VOID_ASSIGNED_TO_EXPANDED */
extern T0* GE_new80(T1 initialize);
/* New instance of type EXCEPTION_IN_SIGNAL_HANDLER_FAILURE */
extern T0* GE_new81(T1 initialize);
/* New instance of type MISMATCH_FAILURE */
extern T0* GE_new82(T1 initialize);
/* New instance of type DEVELOPER_EXCEPTION */
extern T0* GE_new83(T1 initialize);
/* New instance of type ADDRESS_APPLIED_TO_MELTED_FEATURE */
extern T0* GE_new84(T1 initialize);
/* New instance of type SERIALIZATION_FAILURE */
extern T0* GE_new85(T1 initialize);
/* New instance of type KL_STRING_ROUTINES */
extern T0* GE_new86(T1 initialize);
/* New instance of type PRIMES */
extern T0* GE_new87(T1 initialize);
/* New instance of type SPECIAL [INTEGER_32] */
extern T0* GE_new88(T6 a1, T1 initialize);
/* New instance of type SPECIAL [BOOLEAN] */
extern T0* GE_new89(T6 a1, T1 initialize);
/* New instance of type ARGUMENTS_32 */
extern T0* GE_new90(T1 initialize);
/* New instance of type IMMUTABLE_STRING_32 */
extern T0* GE_new91(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [STRING_8] */
extern T0* GE_new93(T1 initialize);
/* New instance of type SPECIAL [STRING_8] */
extern T0* GE_new94(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
extern T0* GE_new95(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [INTEGER_32] */
extern T0* GE_new96(T1 initialize);
/* New instance of type detachable DS_LINKABLE [GEXACE_COMMAND] */
extern T0* GE_new97(T1 initialize);
/* New instance of type KL_STANDARD_FILES */
extern T0* GE_new99(T1 initialize);
/* New instance of type KL_STDERR_FILE */
extern T0* GE_new100(T1 initialize);
/* New instance of type KL_STDOUT_FILE */
extern T0* GE_new101(T1 initialize);
/* New instance of type KL_NULL_TEXT_OUTPUT_STREAM */
extern T0* GE_new102(T1 initialize);
/* New instance of type detachable DS_LINKABLE [STRING_8] */
extern T0* GE_new104(T1 initialize);
/* New instance of type ARRAY [STRING_8] */
extern T0* GE_new105(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR] */
extern T0* GE_new106(T1 initialize);
/* New instance of type detachable DS_LINKABLE [ET_XACE_GENERATOR] */
extern T0* GE_new107(T1 initialize);
/* New instance of type CELL [INTEGER_32] */
extern T0* GE_new110(T1 initialize);
/* New instance of type C_STRING */
extern T0* GE_new111(T1 initialize);
/* New instance of type MANAGED_POINTER */
extern T0* GE_new112(T1 initialize);
/* New instance of type UC_STRING */
extern T0* GE_new113(T1 initialize);
/* New instance of type KL_ANY_ROUTINES */
extern T0* GE_new114(T1 initialize);
/* New instance of type ARRAY [IMMUTABLE_STRING_32] */
extern T0* GE_new116(T1 initialize);
/* New instance of type SPECIAL [IMMUTABLE_STRING_32] */
extern T0* GE_new117(T6 a1, T1 initialize);
/* New instance of type NATIVE_STRING */
extern T0* GE_new118(T1 initialize);
/* New instance of type READABLE_STRING_32 */
extern T0* GE_new119(T1 initialize);
/* New instance of type STRING_TO_INTEGER_CONVERTOR */
extern T0* GE_new122(T1 initialize);
/* New instance of type ET_XACE_SYSTEM_CONFIG_PARSER */
extern T0* GE_new124(T1 initialize);
/* New instance of type ET_XACE_SYSTEM_CONFIG */
extern T0* GE_new125(T1 initialize);
/* New instance of type KL_TEXT_INPUT_FILE */
extern T0* GE_new126(T1 initialize);
/* New instance of type KL_TEXT_OUTPUT_FILE */
extern T0* GE_new128(T1 initialize);
/* New instance of type ET_XACE_LIBRARY_CONFIG_PARSER */
extern T0* GE_new129(T1 initialize);
/* New instance of type ET_XACE_LIBRARY_CONFIG */
extern T0* GE_new130(T1 initialize);
/* New instance of type ET_XACE_PARSER */
extern T0* GE_new131(T1 initialize);
/* New instance of type STD_FILES */
extern T0* GE_new132(T1 initialize);
/* New instance of type EXCEPTIONS */
extern T0* GE_new133(T1 initialize);
/* New instance of type PLATFORM */
extern T0* GE_new135(T1 initialize);
/* New instance of type UT_CANNOT_READ_FILE_ERROR */
extern T0* GE_new136(T1 initialize);
/* New instance of type UT_CANNOT_WRITE_TO_FILE_ERROR */
extern T0* GE_new137(T1 initialize);
/* New instance of type INTEGER_OVERFLOW_CHECKER */
extern T0* GE_new139(T1 initialize);
/* New instance of type ET_XACE_AST_FACTORY */
extern T0* GE_new140(T1 initialize);
/* New instance of type XM_DOCUMENT */
extern T0* GE_new141(T1 initialize);
/* New instance of type XM_ELEMENT */
extern T0* GE_new142(T1 initialize);
/* New instance of type XM_POSITION_TABLE */
extern T0* GE_new143(T1 initialize);
/* New instance of type XM_TREE_CALLBACKS_PIPE */
extern T0* GE_new145(T1 initialize);
/* New instance of type XM_STOP_ON_ERROR_FILTER */
extern T0* GE_new146(T1 initialize);
/* New instance of type XM_CALLBACKS_TO_TREE_FILTER */
extern T0* GE_new147(T1 initialize);
/* New instance of type ET_XACE_VALIDATOR */
extern T0* GE_new148(T1 initialize);
/* New instance of type ET_XACE_PREPROCESSOR */
extern T0* GE_new149(T1 initialize);
/* New instance of type DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8] */
extern T0* GE_new150(T1 initialize);
/* New instance of type XM_EXPAT_PARSER_FACTORY */
extern T0* GE_new151(T1 initialize);
/* New instance of type XM_EIFFEL_PARSER */
extern T0* GE_new152(T1 initialize);
/* New instance of type FILE_INFO */
extern T0* GE_new157(T1 initialize);
/* New instance of type CONSOLE */
extern T0* GE_new158(T1 initialize);
/* New instance of type SPECIAL [NATURAL_8] */
extern T0* GE_new159(T6 a1, T1 initialize);
/* New instance of type UT_MESSAGE */
extern T0* GE_new160(T1 initialize);
/* New instance of type ET_XACE_NOT_XACE_FILE_ERROR */
extern T0* GE_new161(T1 initialize);
/* New instance of type ET_XACE_CLUSTERS */
extern T0* GE_new162(T1 initialize);
/* New instance of type ET_XACE_MOUNTED_LIBRARIES */
extern T0* GE_new163(T1 initialize);
/* New instance of type ET_XACE_OPTIONS */
extern T0* GE_new164(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [STRING_8] */
extern T0* GE_new165(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [STRING_8] */
extern T0* GE_new166(T1 initialize);
/* New instance of type DS_HASH_SET [STRING_8] */
extern T0* GE_new167(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [STRING_8] */
extern T0* GE_new168(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [ET_XACE_CLUSTER] */
extern T0* GE_new169(T1 initialize);
/* New instance of type ET_XACE_CLUSTER */
extern T0* GE_new170(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY] */
extern T0* GE_new171(T1 initialize);
/* New instance of type ET_XACE_MOUNTED_LIBRARY */
extern T0* GE_new172(T1 initialize);
/* New instance of type detachable DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS] */
extern T0* GE_new173(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS] */
extern T0* GE_new174(T1 initialize);
/* New instance of type ET_XACE_CLASS_OPTIONS */
extern T0* GE_new175(T1 initialize);
/* New instance of type detachable DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS] */
extern T0* GE_new176(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS] */
extern T0* GE_new177(T1 initialize);
/* New instance of type ET_XACE_FEATURE_OPTIONS */
extern T0* GE_new178(T1 initialize);
/* New instance of type ET_XACE_EXTERNALS */
extern T0* GE_new179(T1 initialize);
/* New instance of type ET_XACE_OPTION_NAMES */
extern T0* GE_new180(T1 initialize);
/* New instance of type DS_LINKED_LIST [ET_XACE_ASSEMBLY] */
extern T0* GE_new181(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY] */
extern T0* GE_new182(T1 initialize);
/* New instance of type ET_XACE_ASSEMBLY */
extern T0* GE_new183(T1 initialize);
/* New instance of type KL_UNIX_FILE_SYSTEM */
extern T0* GE_new184(T1 initialize);
/* New instance of type KL_EXECUTION_ENVIRONMENT */
extern T0* GE_new185(T1 initialize);
/* New instance of type DS_LINKED_LIST [ET_XACE_CLUSTER] */
extern T0* GE_new186(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER] */
extern T0* GE_new187(T1 initialize);
/* New instance of type [attached] TUPLE [ET_XACE_CLASS_OPTIONS] */
extern T0* GE_new188(T1 initialize);
/* New instance of type [attached] PROCEDURE [[attached] TUPLE [ET_XACE_CLASS_OPTIONS]] */
extern T0* GE_new189(T1 initialize);
/* New instance of type [attached] TUPLE [ET_XACE_ECF_GENERATOR, INTEGER_32, KI_TEXT_OUTPUT_STREAM] */
extern T0* GE_new191(T1 initialize);
/* New instance of type [attached] TUPLE [ET_XACE_FEATURE_OPTIONS] */
extern T0* GE_new192(T1 initialize);
/* New instance of type [attached] PROCEDURE [[attached] TUPLE [ET_XACE_FEATURE_OPTIONS]] */
extern T0* GE_new193(T1 initialize);
/* New instance of type [attached] TUPLE [ET_XACE_ECF_GENERATOR, STRING_8, INTEGER_32, KI_TEXT_OUTPUT_STREAM] */
extern T0* GE_new194(T1 initialize);
/* New instance of type ET_TOKEN_CONSTANTS */
extern T0* GE_new196(T1 initialize);
/* New instance of type ET_SYSTEM */
extern T0* GE_new197(T1 initialize);
/* New instance of type XM_ATTRIBUTE */
extern T0* GE_new200(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE] */
extern T0* GE_new201(T1 initialize);
/* New instance of type DS_HASH_TABLE [INTEGER_32, STRING_8] */
extern T0* GE_new204(T1 initialize);
/* New instance of type SPECIAL [NATURAL_64] */
extern T0* GE_new208(T6 a1, T1 initialize);
/* New instance of type XM_NAMESPACE_RESOLVER */
extern T0* GE_new209(T1 initialize);
/* New instance of type ARRAY [XM_CALLBACKS_FILTER] */
extern T0* GE_new210(T1 initialize);
/* New instance of type SPECIAL [XM_CALLBACKS_FILTER] */
extern T0* GE_new211(T6 a1, T1 initialize);
/* New instance of type XM_CALLBACKS_NULL */
extern T0* GE_new212(T1 initialize);
/* New instance of type DS_HASH_SET [XM_NAMESPACE] */
extern T0* GE_new213(T1 initialize);
/* New instance of type UT_TEMPLATE_EXPANDER */
extern T0* GE_new217(T1 initialize);
/* New instance of type detachable DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8] */
extern T0* GE_new220(T1 initialize);
/* New instance of type SPECIAL [ET_XACE_LIBRARY_CONFIG] */
extern T0* GE_new221(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY_CONFIG] */
extern T0* GE_new222(T1 initialize);
/* New instance of type XM_EIFFEL_SCANNER */
extern T0* GE_new223(T1 initialize);
/* New instance of type XM_DEFAULT_POSITION */
extern T0* GE_new224(T1 initialize);
/* New instance of type DS_BILINKED_LIST [XM_POSITION] */
extern T0* GE_new226(T1 initialize);
/* New instance of type DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
extern T0* GE_new227(T1 initialize);
/* New instance of type DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
extern T0* GE_new228(T1 initialize);
/* New instance of type XM_NULL_EXTERNAL_RESOLVER */
extern T0* GE_new230(T1 initialize);
/* New instance of type XM_DTD_CALLBACKS_NULL */
extern T0* GE_new232(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [detachable ANY] */
extern T0* GE_new233(T1 initialize);
/* New instance of type SPECIAL [detachable ANY] */
extern T0* GE_new234(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new235(T1 initialize);
/* New instance of type XM_EIFFEL_PARSER_NAME */
extern T0* GE_new236(T1 initialize);
/* New instance of type SPECIAL [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new237(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
extern T0* GE_new238(T1 initialize);
/* New instance of type DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new239(T1 initialize);
/* New instance of type SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
extern T0* GE_new240(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
extern T0* GE_new241(T1 initialize);
/* New instance of type XM_DTD_EXTERNAL_ID */
extern T0* GE_new242(T1 initialize);
/* New instance of type SPECIAL [XM_DTD_EXTERNAL_ID] */
extern T0* GE_new243(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new244(T1 initialize);
/* New instance of type XM_DTD_ELEMENT_CONTENT */
extern T0* GE_new245(T1 initialize);
/* New instance of type SPECIAL [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new246(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
extern T0* GE_new247(T1 initialize);
/* New instance of type DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new248(T1 initialize);
/* New instance of type SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
extern T0* GE_new249(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new250(T1 initialize);
/* New instance of type XM_DTD_ATTRIBUTE_CONTENT */
extern T0* GE_new251(T1 initialize);
/* New instance of type SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new252(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
extern T0* GE_new253(T1 initialize);
/* New instance of type DS_BILINKED_LIST [STRING_8] */
extern T0* GE_new254(T1 initialize);
/* New instance of type SPECIAL [DS_BILINKED_LIST [STRING_8]] */
extern T0* GE_new255(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [BOOLEAN] */
extern T0* GE_new256(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
extern T0* GE_new257(T1 initialize);
/* New instance of type XM_EIFFEL_DECLARATION */
extern T0* GE_new258(T1 initialize);
/* New instance of type SPECIAL [XM_EIFFEL_DECLARATION] */
extern T0* GE_new259(T6 a1, T1 initialize);
/* New instance of type XM_EIFFEL_ENTITY_DEF */
extern T0* GE_new263(T1 initialize);
/* New instance of type XM_EIFFEL_SCANNER_DTD */
extern T0* GE_new264(T1 initialize);
/* New instance of type XM_EIFFEL_PE_ENTITY_DEF */
extern T0* GE_new266(T1 initialize);
/* New instance of type ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR */
extern T0* GE_new268(T1 initialize);
/* New instance of type ET_XACE_BOOLEAN_EXPECTED_ERROR */
extern T0* GE_new269(T1 initialize);
/* New instance of type ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR */
extern T0* GE_new270(T1 initialize);
/* New instance of type ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR */
extern T0* GE_new271(T1 initialize);
/* New instance of type ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR */
extern T0* GE_new272(T1 initialize);
/* New instance of type ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING */
extern T0* GE_new273(T1 initialize);
/* New instance of type ET_XACE_WRONG_ROOT_ELEMENT_ERROR */
extern T0* GE_new274(T1 initialize);
/* New instance of type ET_XACE_MISSING_ATTRIBUTE_ERROR */
extern T0* GE_new275(T1 initialize);
/* New instance of type ET_XACE_MISSING_ELEMENT_ERROR */
extern T0* GE_new276(T1 initialize);
/* New instance of type ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING */
extern T0* GE_new277(T1 initialize);
/* New instance of type ET_XACE_UNKNOWN_ELEMENT_ERROR */
extern T0* GE_new278(T1 initialize);
/* New instance of type ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING */
extern T0* GE_new279(T1 initialize);
/* New instance of type ET_XACE_UNKNOWN_OPTION_NAME_WARNING */
extern T0* GE_new280(T1 initialize);
/* New instance of type KL_OPERATING_SYSTEM */
extern T0* GE_new281(T1 initialize);
/* New instance of type XM_NAMESPACE */
extern T0* GE_new284(T1 initialize);
/* New instance of type XM_LINKED_LIST [XM_DOCUMENT_NODE] */
extern T0* GE_new285(T1 initialize);
/* New instance of type XM_LINKED_LIST [XM_ELEMENT_NODE] */
extern T0* GE_new287(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
extern T0* GE_new291(T1 initialize);
/* New instance of type DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
extern T0* GE_new292(T1 initialize);
/* New instance of type DS_PAIR [XM_POSITION, XM_NODE] */
extern T0* GE_new293(T1 initialize);
/* New instance of type ARRAY [INTEGER_32] */
extern T0* GE_new294(T1 initialize);
/* New instance of type UC_UTF8_ROUTINES */
extern T0* GE_new295(T1 initialize);
/* New instance of type UC_UTF8_STRING */
extern T0* GE_new296(T1 initialize);
/* New instance of type XM_EIFFEL_INPUT_STREAM */
extern T0* GE_new297(T1 initialize);
/* New instance of type KL_INTEGER_ROUTINES */
extern T0* GE_new298(T1 initialize);
/* New instance of type KL_PLATFORM */
extern T0* GE_new299(T1 initialize);
/* New instance of type KL_ARRAY_ROUTINES [INTEGER_32] */
extern T0* GE_new300(T1 initialize);
/* New instance of type UT_TRISTATE */
extern T0* GE_new301(T1 initialize);
/* New instance of type SPECIAL [ET_XACE_CLUSTER] */
extern T0* GE_new302(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER] */
extern T0* GE_new303(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_XACE_CLUSTER] */
extern T0* GE_new304(T1 initialize);
/* New instance of type SPECIAL [ET_XACE_MOUNTED_LIBRARY] */
extern T0* GE_new305(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY] */
extern T0* GE_new306(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_XACE_MOUNTED_LIBRARY] */
extern T0* GE_new307(T1 initialize);
/* New instance of type detachable DS_LINKABLE [ET_XACE_CLASS_OPTIONS] */
extern T0* GE_new308(T1 initialize);
/* New instance of type detachable DS_LINKABLE [ET_XACE_FEATURE_OPTIONS] */
extern T0* GE_new309(T1 initialize);
/* New instance of type detachable DS_LINKABLE [ET_XACE_ASSEMBLY] */
extern T0* GE_new310(T1 initialize);
/* New instance of type EXECUTION_ENVIRONMENT */
extern T0* GE_new311(T1 initialize);
/* New instance of type detachable DS_LINKABLE [ET_XACE_CLUSTER] */
extern T0* GE_new312(T1 initialize);
/* New instance of type ET_ERROR_HANDLER */
extern T0* GE_new313(T1 initialize);
/* New instance of type ET_AST_FACTORY */
extern T0* GE_new314(T1 initialize);
/* New instance of type ET_AST_NULL_PROCESSOR */
extern T0* GE_new315(T1 initialize);
/* New instance of type ET_ADAPTED_LIBRARIES */
extern T0* GE_new317(T1 initialize);
/* New instance of type ET_CLUSTERS */
extern T0* GE_new318(T1 initialize);
/* New instance of type ET_ADAPTED_DOTNET_ASSEMBLIES */
extern T0* GE_new319(T1 initialize);
/* New instance of type DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME] */
extern T0* GE_new320(T1 initialize);
/* New instance of type ET_CLASS_NAME_TESTER */
extern T0* GE_new321(T1 initialize);
/* New instance of type ET_CLASS_TYPE */
extern T0* GE_new323(T1 initialize);
/* New instance of type ET_PARENT */
extern T0* GE_new324(T1 initialize);
/* New instance of type ET_PARENT_LIST */
extern T0* GE_new325(T1 initialize);
/* New instance of type ET_CLIENT_LIST */
extern T0* GE_new326(T1 initialize);
/* New instance of type ET_TUPLE_TYPE */
extern T0* GE_new327(T1 initialize);
/* New instance of type ET_ACTUAL_PARAMETER_LIST */
extern T0* GE_new329(T1 initialize);
/* New instance of type ET_BUILTIN_CONVERT_FEATURE */
extern T0* GE_new330(T1 initialize);
/* New instance of type ET_MASTER_CLASS */
extern T0* GE_new332(T1 initialize);
/* New instance of type ET_CLIENT */
extern T0* GE_new333(T1 initialize);
/* New instance of type ET_IMPLICIT_TYPE_MARK */
extern T0* GE_new334(T1 initialize);
/* New instance of type ET_KEYWORD */
extern T0* GE_new337(T1 initialize);
/* New instance of type ET_LIKE_CURRENT */
extern T0* GE_new344(T1 initialize);
/* New instance of type ET_UNFOLDED_EMPTY_TUPLE_ACTUAL_PARAMETERS */
extern T0* GE_new346(T1 initialize);
/* New instance of type ET_CLASS */
extern T0* GE_new348(T1 initialize);
/* New instance of type ET_NONE_GROUP */
extern T0* GE_new349(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [INTEGER_32, STRING_8] */
extern T0* GE_new352(T1 initialize);
/* New instance of type XM_NAMESPACE_RESOLVER_CONTEXT */
extern T0* GE_new353(T1 initialize);
/* New instance of type DS_LINKED_QUEUE [STRING_8] */
extern T0* GE_new355(T1 initialize);
/* New instance of type detachable KL_EQUALITY_TESTER [XM_NAMESPACE] */
extern T0* GE_new356(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [XM_NAMESPACE] */
extern T0* GE_new357(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
extern T0* GE_new358(T1 initialize);
/* New instance of type SPECIAL [XM_NAMESPACE] */
extern T0* GE_new359(T6 a1, T1 initialize);
/* New instance of type XM_EIFFEL_CHARACTER_ENTITY */
extern T0* GE_new360(T1 initialize);
/* New instance of type YY_BUFFER */
extern T0* GE_new361(T1 initialize);
/* New instance of type YY_FILE_BUFFER */
extern T0* GE_new362(T1 initialize);
/* New instance of type detachable DS_BILINKABLE [XM_POSITION] */
extern T0* GE_new366(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [XM_POSITION] */
extern T0* GE_new367(T1 initialize);
/* New instance of type detachable DS_LINKABLE [XM_EIFFEL_SCANNER] */
extern T0* GE_new368(T1 initialize);
/* New instance of type SPECIAL [XM_EIFFEL_ENTITY_DEF] */
extern T0* GE_new369(T6 a1, T1 initialize);
/* New instance of type detachable DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
extern T0* GE_new372(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
extern T0* GE_new373(T1 initialize);
/* New instance of type detachable KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new376(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new377(T1 initialize);
/* New instance of type DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new378(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new379(T1 initialize);
/* New instance of type detachable DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new380(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [STRING_8] */
extern T0* GE_new381(T1 initialize);
/* New instance of type detachable DS_BILINKABLE [STRING_8] */
extern T0* GE_new382(T1 initialize);
/* New instance of type ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING */
extern T0* GE_new383(T1 initialize);
/* New instance of type ET_XACE_INVALID_EXPRESSION_ERROR */
extern T0* GE_new384(T1 initialize);
/* New instance of type UC_UNICODE_ROUTINES */
extern T0* GE_new387(T1 initialize);
/* New instance of type HEXADECIMAL_STRING_TO_INTEGER_CONVERTER */
extern T0* GE_new388(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE] */
extern T0* GE_new389(T1 initialize);
/* New instance of type XM_COMMENT */
extern T0* GE_new390(T1 initialize);
/* New instance of type XM_PROCESSING_INSTRUCTION */
extern T0* GE_new391(T1 initialize);
/* New instance of type XM_CHARACTER_DATA */
extern T0* GE_new392(T1 initialize);
/* New instance of type detachable DS_LINKABLE [XM_DOCUMENT_NODE] */
extern T0* GE_new395(T1 initialize);
/* New instance of type DS_LINKED_QUEUE [CHARACTER_8] */
extern T0* GE_new400(T1 initialize);
/* New instance of type UC_UTF16_ROUTINES */
extern T0* GE_new401(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [ET_ADAPTED_LIBRARY] */
extern T0* GE_new402(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [ET_CLUSTER] */
extern T0* GE_new403(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [ET_ADAPTED_DOTNET_ASSEMBLY] */
extern T0* GE_new404(T1 initialize);
/* New instance of type SPECIAL [ET_MASTER_CLASS] */
extern T0* GE_new405(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_MASTER_CLASS] */
extern T0* GE_new408(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_CLASS_NAME] */
extern T0* GE_new409(T1 initialize);
/* New instance of type SPECIAL [ET_CLASS_NAME] */
extern T0* GE_new410(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [ET_MASTER_CLASS, ET_CLASS_NAME] */
extern T0* GE_new411(T1 initialize);
/* New instance of type SPECIAL [ET_PARENT_ITEM] */
extern T0* GE_new413(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_PARENT_ITEM] */
extern T0* GE_new414(T1 initialize);
/* New instance of type SPECIAL [ET_CLIENT_ITEM] */
extern T0* GE_new415(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_CLIENT_ITEM] */
extern T0* GE_new416(T1 initialize);
/* New instance of type ET_IDENTIFIER */
extern T0* GE_new417(T1 initialize);
/* New instance of type ET_SYMBOL */
extern T0* GE_new418(T1 initialize);
/* New instance of type ET_BRACKET_SYMBOL */
extern T0* GE_new419(T1 initialize);
/* New instance of type SPECIAL [ET_ACTUAL_PARAMETER_ITEM] */
extern T0* GE_new421(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_ACTUAL_PARAMETER_ITEM] */
extern T0* GE_new422(T1 initialize);
/* New instance of type ET_BRACED_TYPE_LIST */
extern T0* GE_new425(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [ET_CLASS] */
extern T0* GE_new426(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [ET_MASTER_CLASS] */
extern T0* GE_new427(T1 initialize);
/* New instance of type [attached] TUPLE [ET_MASTER_CLASS] */
extern T0* GE_new428(T1 initialize);
/* New instance of type [attached] PROCEDURE [[attached] TUPLE [ET_MASTER_CLASS]] */
extern T0* GE_new429(T1 initialize);
/* New instance of type DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
extern T0* GE_new431(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
extern T0* GE_new432(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new433(T1 initialize);
/* New instance of type attached DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new434(T1 initialize);
/* New instance of type KL_WINDOWS_FILE_SYSTEM */
extern T0* GE_new436(T1 initialize);
/* New instance of type ET_UNKNOWN_GROUP */
extern T0* GE_new438(T1 initialize);
/* New instance of type detachable DS_LINKABLE [XM_ELEMENT_NODE] */
extern T0* GE_new440(T1 initialize);
/* New instance of type KL_STRING_INPUT_STREAM */
extern T0* GE_new441(T1 initialize);
/* New instance of type detachable DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
extern T0* GE_new442(T1 initialize);
/* New instance of type ET_CURRENT */
extern T0* GE_new444(T1 initialize);
/* New instance of type ET_BASE_TYPE_LIST */
extern T0* GE_new445(T1 initialize);
/* New instance of type ET_QUERY_LIST */
extern T0* GE_new446(T1 initialize);
/* New instance of type ET_PROCEDURE_LIST */
extern T0* GE_new447(T1 initialize);
/* New instance of type ET_CLASS_CODES */
extern T0* GE_new448(T1 initialize);
/* New instance of type KL_CHARACTER_BUFFER */
extern T0* GE_new449(T1 initialize);
/* New instance of type SPECIAL [ARRAY [INTEGER_32]] */
extern T0* GE_new450(T6 a1, T1 initialize);
/* New instance of type SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
extern T0* GE_new451(T6 a1, T1 initialize);
/* New instance of type detachable DS_LINKABLE [CHARACTER_8] */
extern T0* GE_new452(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_ADAPTED_LIBRARY] */
extern T0* GE_new453(T1 initialize);
/* New instance of type SPECIAL [ET_ADAPTED_LIBRARY] */
extern T0* GE_new455(T6 a1, T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_LIBRARY] */
extern T0* GE_new456(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_CLUSTER] */
extern T0* GE_new457(T1 initialize);
/* New instance of type SPECIAL [ET_CLUSTER] */
extern T0* GE_new458(T6 a1, T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_CLUSTER] */
extern T0* GE_new459(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_ADAPTED_DOTNET_ASSEMBLY] */
extern T0* GE_new460(T1 initialize);
/* New instance of type SPECIAL [ET_ADAPTED_DOTNET_ASSEMBLY] */
extern T0* GE_new462(T6 a1, T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_DOTNET_ASSEMBLY] */
extern T0* GE_new463(T1 initialize);
/* New instance of type SPECIAL [ET_TYPE_ITEM] */
extern T0* GE_new465(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_TYPE_ITEM] */
extern T0* GE_new466(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_CLASS] */
extern T0* GE_new467(T1 initialize);
/* New instance of type SPECIAL [ET_CLASS] */
extern T0* GE_new468(T6 a1, T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_CLASS] */
extern T0* GE_new469(T1 initialize);
/* New instance of type detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
extern T0* GE_new470(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_MASTER_CLASS] */
extern T0* GE_new472(T1 initialize);
/* New instance of type DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME] */
extern T0* GE_new473(T1 initialize);
/* New instance of type STRING_8_SEARCHER */
extern T0* GE_new474(T1 initialize);
/* New instance of type SPECIAL [ET_BASE_TYPE] */
extern T0* GE_new475(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_BASE_TYPE] */
extern T0* GE_new476(T1 initialize);
/* New instance of type SPECIAL [ET_QUERY] */
extern T0* GE_new478(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_QUERY] */
extern T0* GE_new479(T1 initialize);
/* New instance of type SPECIAL [ET_PROCEDURE] */
extern T0* GE_new481(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_PROCEDURE] */
extern T0* GE_new482(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [NATURAL_8] */
extern T0* GE_new485(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [NATURAL_8, ET_CLASS_NAME] */
extern T0* GE_new486(T1 initialize);
/* GEXACE.make */
extern T0* T22c20(GE_context* ac);
/* KL_EXCEPTIONS.die */
extern void T37f2(GE_context* ac, T0* C, T6 a1);
/* GEXACE.exceptions */
extern unsigned char ge113os2767;
extern T0* ge113ov2767;
extern T0* T22f6(GE_context* ac, T0* C);
/* KL_EXCEPTIONS.default_create */
extern T0* T37c1(GE_context* ac);
/* ET_XACE_DEFAULT_ERROR_HANDLER.has_error */
extern T1 T35f5(GE_context* ac, T0* C);
/* INTEGER_32.is_greater */
extern T1 T6f4(GE_context* ac, T6* C, T6 a1);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].forth */
extern void T29f10(GE_context* ac, T0* C);
/* DS_LINKED_LIST [GEXACE_COMMAND].cursor_forth */
extern void T34f11(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [GEXACE_COMMAND].add_traversing_cursor */
extern void T34f12(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].set_next_cursor */
extern void T29f12(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [GEXACE_COMMAND].remove_traversing_cursor */
extern void T34f13(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].set */
extern void T29f11(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].item */
extern T0* T29f6(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].start */
extern void T29f9(GE_context* ac, T0* C);
/* DS_LINKED_LIST [GEXACE_COMMAND].cursor_start */
extern void T34f10(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [GEXACE_COMMAND].cursor_off */
extern T1 T34f6(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].off */
extern T1 T29f7(GE_context* ac, T0* C);
/* DS_LINKED_LIST [GEXACE_COMMAND].new_cursor */
extern T0* T34f5(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].make */
extern T0* T29c8(GE_context* ac, T0* a1);
/* GEXACE.process_arguments */
extern void T22f22(GE_context* ac, T0* C);
/* GEXACE.process_command */
extern void T22f26(GE_context* ac, T0* C);
/* GEXACE.report_usage_error */
extern void T22f29(GE_context* ac, T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_error */
extern void T35f11(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_error_message */
extern void T35f15(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_error_message */
extern void T35f15p1(GE_context* ac, T0* C, T0* a1);
/* KL_STDERR_FILE.put_line */
extern void T100f6(GE_context* ac, T0* C, T0* a1);
/* KL_STDERR_FILE.put_new_line */
extern void T100f8(GE_context* ac, T0* C);
/* KL_STDERR_FILE.put_string */
extern void T100f7(GE_context* ac, T0* C, T0* a1);
/* CONSOLE.put_string */
extern void T158f13(GE_context* ac, T0* C, T0* a1);
/* CONSOLE.console_ps */
extern void T158f17(GE_context* ac, T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STDERR_FILE.console */
extern unsigned char ge78os5558;
extern T0* ge78ov5558;
extern T0* T100f2(GE_context* ac, T0* C);
/* STD_FILES.error */
extern unsigned char ge2278os176;
extern T0* ge2278ov176;
extern T0* T132f2(GE_context* ac, T0* C);
/* CONSOLE.make_open_stderr */
extern T0* T158c11(GE_context* ac, T0* a1);
/* CONSOLE.set_write_mode */
extern void T158f16(GE_context* ac, T0* C);
/* CONSOLE.console_def */
extern T14 T158f6(GE_context* ac, T0* C, T6 a1);
/* CONSOLE.make_with_name */
extern void T158f15(GE_context* ac, T0* C, T0* a1);
/* STRING_8.make_empty */
extern T0* T17c53(GE_context* ac);
/* STRING_8.make */
extern void T17f36(GE_context* ac, T0* C, T6 a1);
/* STRING_8.make */
extern T0* T17c36(GE_context* ac, T6 a1);
/* SPECIAL [CHARACTER_8].make_filled */
extern T0* T15c11(GE_context* ac, T2 a1, T6 a2);
/* SPECIAL [CHARACTER_8].fill_with */
extern void T15f13(GE_context* ac, T0* C, T2 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].extend */
extern void T15f15(GE_context* ac, T0* C, T2 a1);
/* INTEGER_32.min */
extern T6 T6f11(GE_context* ac, T6* C, T6 a1);
/* INTEGER_32.is_less_equal */
extern T1 T6f6(GE_context* ac, T6* C, T6 a1);
/* SPECIAL [CHARACTER_8].make_empty */
extern void T15f12(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].make_empty */
extern T0* T15c12(GE_context* ac, T6 a1);
/* CONSOLE.default_pointer */
extern T14 T158f9(GE_context* ac, T0* C);
/* CONSOLE.set_name */
extern void T158f18(GE_context* ac, T0* C, T0* a1);
/* FILE_INFO.file_name_to_pointer */
extern T0* T157f11(GE_context* ac, T0* C, T0* a1, T0* a2);
/* C_STRING.set_string */
extern void T111f10(GE_context* ac, T0* C, T0* a1);
/* C_STRING.set_substring */
extern void T111f11(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* MANAGED_POINTER.put_natural_8 */
extern void T112f12(GE_context* ac, T0* C, T8 a1, T6 a2);
/* POINTER.memory_copy */
extern void T14f13(GE_context* ac, T14* C, T14 a1, T6 a2);
/* POINTER.c_memcpy */
extern void T14f17(GE_context* ac, T14* C, T14 a1, T14 a2, T6 a3);
/* NATURAL_32.to_natural_8 */
extern T8 T10f4(GE_context* ac, T10* C);
/* UC_UTF8_STRING.code */
extern T10 T296f10(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.item_code */
extern T6 T296f44(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.item_code_at_byte_index */
extern T6 T296f26(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_ROUTINES.encoded_next_value */
extern T6 T295f6(GE_context* ac, T0* C, T2 a1);
/* UC_UTF8_ROUTINES.encoded_byte_count */
extern T6 T295f3(GE_context* ac, T0* C, T2 a1);
/* CHARACTER_8.is_less_equal */
extern T1 T2f20(GE_context* ac, T2* C, T2 a1);
/* CHARACTER_8.is_less */
extern T1 T2f16(GE_context* ac, T2* C, T2 a1);
/* CHARACTER_8.natural_32_code */
extern T10 T2f17(GE_context* ac, T2* C);
/* INTEGER_32.to_natural_32 */
extern T10 T6f17(GE_context* ac, T6* C);
/* UC_UTF8_ROUTINES.encoded_first_value */
extern T6 T295f4(GE_context* ac, T0* C, T2 a1);
/* UC_UTF8_STRING.utf8 */
extern unsigned char ge129os5982;
extern T0* ge129ov5982;
extern T0* T296f33(GE_context* ac, T0* C);
/* UC_UTF8_ROUTINES.default_create */
extern T0* T295c36(GE_context* ac);
/* UC_UTF8_STRING.byte_index */
extern T6 T296f25(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.byte_item */
extern T2 T296f24(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.old_item */
extern T2 T296f37(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.set_count */
extern void T296f70(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.reset_byte_index_cache */
extern void T296f79(GE_context* ac, T0* C);
/* STRING_8.code */
extern T10 T17f18(GE_context* ac, T0* C, T6 a1);
/* C_STRING.make_shared_from_pointer_and_count */
extern void T111f12(GE_context* ac, T0* C, T14 a1, T6 a2);
/* C_STRING.make_shared_from_pointer_and_count */
extern T0* T111c12(GE_context* ac, T14 a1, T6 a2);
/* MANAGED_POINTER.share_from_pointer */
extern T0* T112c14(GE_context* ac, T14 a1, T6 a2);
/* MANAGED_POINTER.increment_counter */
extern void T112f13(GE_context* ac, T0* C);
/* UTF_CONVERTER.escaped_utf_32_substring_into_utf_8_0_pointer */
extern void T109f16(GE_context* ac, T109* C, T0* a1, T6 a2, T6 a3, T0* a4, T6 a5, T0* a6);
/* CELL [INTEGER_32].put */
extern void T110f2(GE_context* ac, T0* C, T6 a1);
/* CELL [INTEGER_32].put */
extern T0* T110c2(GE_context* ac, T6 a1);
/* NATURAL_32.is_less_equal */
extern T1 T10f3(GE_context* ac, T10* C, T10 a1);
/* UTF_CONVERTER.to_natural_32 */
extern T10 T109f7(GE_context* ac, T109* C, T0* a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.parsed_natural_32 */
extern T10 T388f12(GE_context* ac, T0* C);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.parse_string_with_type */
extern void T388f19(GE_context* ac, T0* C, T0* a1, T6 a2);
/* NATURAL_32.is_valid_character_8_code */
extern T1 T10f15(GE_context* ac, T10* C);
/* CHARACTER_32.is_character_8 */
extern T1 T3f3(GE_context* ac, T3* C);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.parse_character */
extern void T388f22(GE_context* ac, T0* C, T2 a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.overflowed */
extern T1 T388f16(GE_context* ac, T0* C);
/* INTEGER_OVERFLOW_CHECKER.will_overflow */
extern T1 T139f7(GE_context* ac, T0* C, T11 a1, T11 a2, T6 a3, T6 a4);
/* NATURAL_64.is_greater */
extern T1 T11f7(GE_context* ac, T11* C, T11 a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.overflow_checker */
extern unsigned char ge2319os5794;
extern T0* ge2319ov5794;
extern T0* T388f15(GE_context* ac, T0* C);
/* INTEGER_OVERFLOW_CHECKER.make */
extern T0* T139c13(GE_context* ac);
/* NATURAL_64.to_natural_64 */
extern T11 T11f10(GE_context* ac, T11* C);
/* NATURAL_32.to_natural_64 */
extern T11 T10f19(GE_context* ac, T10* C);
/* NATURAL_16.to_natural_64 */
extern T11 T9f12(GE_context* ac, T9* C);
/* NATURAL_8.to_natural_64 */
extern T11 T8f16(GE_context* ac, T8* C);
/* INTEGER_64.to_natural_64 */
extern T11 T7f7(GE_context* ac, T7* C);
/* INTEGER_16.to_natural_64 */
extern T11 T5f3(GE_context* ac, T5* C);
/* INTEGER_8.to_natural_64 */
extern T11 T4f3(GE_context* ac, T4* C);
/* SPECIAL [NATURAL_64].extend */
extern void T208f5(GE_context* ac, T0* C, T11 a1);
/* SPECIAL [NATURAL_64].make_empty */
extern T0* T208c4(GE_context* ac, T6 a1);
/* STRING_8.has */
extern T1 T17f29(GE_context* ac, T0* C, T2 a1);
/* STRING_8.area_lower */
extern T6 T17f19(GE_context* ac, T0* C);
/* INTEGER_32.to_natural_64 */
extern T11 T6f24(GE_context* ac, T6* C);
/* CHARACTER_8.is_greater_equal */
extern T1 T2f15(GE_context* ac, T2* C, T2 a1);
/* CHARACTER_8.is_hexa_digit */
extern T1 T2f22(GE_context* ac, T2* C);
/* NATURAL_8.is_greater */
extern T1 T8f9(GE_context* ac, T8* C, T8 a1);
/* CHARACTER_8.character_types */
extern T8 T2f4(GE_context* ac, T2* C, T6 a1);
/* CHARACTER_8.internal_character_types */
extern unsigned char ge2216os327;
extern T0* ge2216ov327;
extern T0* T2f6(GE_context* ac, T2* C);
/* SPECIAL [NATURAL_8].fill_with */
extern void T159f7(GE_context* ac, T0* C, T8 a1, T6 a2, T6 a3);
/* SPECIAL [NATURAL_8].extend */
extern void T159f6(GE_context* ac, T0* C, T8 a1);
/* SPECIAL [NATURAL_8].make_empty */
extern void T159f5(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [NATURAL_8].make_empty */
extern T0* T159c5(GE_context* ac, T6 a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.reset */
extern void T388f18(GE_context* ac, T0* C, T6 a1);
/* UTF_CONVERTER.ctoi_convertor */
extern unsigned char ge2289os5675;
extern T0* ge2289ov5675;
extern T0* T109f8(GE_context* ac, T109* C);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.set_trailing_separators_acceptable */
extern void T388f21(GE_context* ac, T0* C, T1 a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.set_leading_separators_acceptable */
extern void T388f20(GE_context* ac, T0* C, T1 a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.make */
extern T0* T388c17(GE_context* ac);
/* STRING_8.make_from_string */
extern T0* T17c52(GE_context* ac, T0* a1);
/* SPECIAL [CHARACTER_8].copy_data */
extern void T15f16(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [CHARACTER_8].force */
extern void T15f18(GE_context* ac, T0* C, T2 a1, T6 a2);
/* SPECIAL [CHARACTER_8].move_data */
extern void T15f17(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].overlapping_move */
extern void T15f20(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].non_overlapping_move */
extern void T15f19(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* UTF_CONVERTER.is_hexa_decimal */
extern T1 T109f6(GE_context* ac, T109* C, T0* a1);
/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.is_integral_integer */
extern T1 T388f14(GE_context* ac, T0* C);
/* UC_UTF8_STRING.substring */
extern T0* T296f12(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.make_from_substring */
extern T0* T296c65(GE_context* ac, T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.make_from_substring_general */
extern void T296f80(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.put_substring_at_byte_index */
extern void T296f76(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4, T6 a5);
extern T1 T296f76ot1(T0* a1, T0** a2);
extern T1 T296f76ot2(T0* a1, T0** a2);
extern T1 T296f76ot3(T0* a1, T0** a2);
/* NATURAL_32.to_integer_32 */
extern T6 T10f24(GE_context* ac, T10* C);
/* UC_UTF8_STRING.next_byte_index */
extern T6 T296f29(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.put_code_at_byte_index */
extern void T296f88(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* KL_INTEGER_ROUTINES.to_character */
extern T2 T298f2(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.integer_ */
extern unsigned char ge35os5336;
extern T0* ge35ov5336;
extern T0* T296f32(GE_context* ac, T0* C);
/* KL_INTEGER_ROUTINES.default_create */
extern T0* T298c4(GE_context* ac);
/* UC_UTF8_ROUTINES.code_byte_count */
extern T6 T295f24(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.put_character_at_byte_index */
extern void T296f75(GE_context* ac, T0* C, T2 a1, T6 a2, T6 a3);
/* UC_UTF8_ROUTINES.character_byte_count */
extern T6 T295f23(GE_context* ac, T0* C, T2 a1);
/* UC_UTF8_STRING.put_byte */
extern void T296f86(GE_context* ac, T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.old_put */
extern void T296f74(GE_context* ac, T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.reset_hash_codes */
extern void T296f77(GE_context* ac, T0* C);
/* UC_UTF8_STRING.item */
extern T2 T296f18(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.character_item_at_byte_index */
extern T2 T296f36(GE_context* ac, T0* C, T6 a1);
/* KL_PLATFORM.maximum_character_code */
extern unsigned char ge110os15556;
extern T6 ge110ov15556;
extern T6 T299f1(GE_context* ac, T0* C);
/* UC_UTF8_STRING.platform */
extern unsigned char ge117os5334;
extern T0* ge117ov5334;
extern T0* T296f28(GE_context* ac, T0* C);
/* KL_PLATFORM.default_create */
extern T0* T299c3(GE_context* ac);
/* STRING_8.item */
extern T2 T17f6(GE_context* ac, T0* C, T6 a1);
/* KL_ANY_ROUTINES.same_types */
extern T1 T114f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.any_ */
extern unsigned char ge30os3256;
extern T0* ge30ov3256;
extern T0* T296f45(GE_context* ac, T0* C);
/* KL_ANY_ROUTINES.default_create */
extern T0* T114c2(GE_context* ac);
/* UC_UTF8_ROUTINES.substring_byte_count */
extern T6 T295f22(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
extern T1 T295f22ot1(T0* a1, T0** a2);
extern T1 T295f22ot2(T0* a1, T0** a2);
/* UC_UTF8_STRING.shifted_byte_index */
extern T6 T296f50(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF8_ROUTINES.dummy_uc_string */
extern unsigned char ge142os6027;
extern T0* ge142ov6027;
extern T0* T295f27(GE_context* ac, T0* C);
/* UC_STRING.make_empty */
extern T0* T113c9(GE_context* ac);
/* UC_STRING.make */
extern void T113f10(GE_context* ac, T0* C, T6 a1);
/* UC_STRING.old_set_count */
extern void T113f13(GE_context* ac, T0* C, T6 a1);
/* UC_STRING.reset_hash_codes */
extern void T113f14(GE_context* ac, T0* C);
/* UC_STRING.set_count */
extern void T113f12(GE_context* ac, T0* C, T6 a1);
/* UC_STRING.byte_capacity */
extern T6 T113f8(GE_context* ac, T0* C);
/* UC_STRING.capacity */
extern T6 T113f8p1(GE_context* ac, T0* C);
/* UC_STRING.make */
extern void T113f10p1(GE_context* ac, T0* C, T6 a1);
/* UC_STRING.reset_byte_index_cache */
extern void T113f11(GE_context* ac, T0* C);
/* UC_UTF8_ROUTINES.any_ */
extern T0* T295f25(GE_context* ac, T0* C);
/* UC_UTF8_STRING.cloned_string */
extern T0* T296f43(GE_context* ac, T0* C);
/* UC_UTF8_STRING.twin */
extern T0* T296f20(GE_context* ac, T0* C);
/* UC_UTF8_STRING.copy */
extern void T296f69(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.copy */
extern void T296f69p1(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].resized_area */
extern T0* T15f5(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.make */
extern void T296f64(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.make */
extern T0* T296c64(GE_context* ac, T6 a1);
/* UC_UTF8_STRING.old_set_count */
extern void T296f62(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.byte_capacity */
extern T6 T296f42(GE_context* ac, T0* C);
/* UC_UTF8_STRING.capacity */
extern T6 T296f42p1(GE_context* ac, T0* C);
/* UC_UTF8_STRING.make */
extern void T296f64p1(GE_context* ac, T0* C, T6 a1);
/* STRING_8.substring */
extern T0* T17f22(GE_context* ac, T0* C, T6 a1, T6 a2);
/* STRING_8.set_count */
extern void T17f47(GE_context* ac, T0* C, T6 a1);
/* STRING_8.reset_hash_codes */
extern void T17f44(GE_context* ac, T0* C);
/* STRING_8.new_string */
extern T0* T17f17(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.character_32_item */
extern T3 T296f11(GE_context* ac, T0* C, T6 a1);
/* STRING_8.character_32_item */
extern T3 T17f13(GE_context* ac, T0* C, T6 a1);
/* INTEGER_32.is_greater_equal */
extern T1 T6f2(GE_context* ac, T6* C, T6 a1);
/* UTF_CONVERTER.utf_8_bytes_count */
extern T6 T109f1(GE_context* ac, T109* C, T0* a1, T6 a2, T6 a3);
/* FILE_INFO.multi_byte_to_utf_16 */
extern T6 T157f10(GE_context* ac, T0* C, T14 a1, T14 a2, T6 a3);
/* FILE_INFO.default_pointer */
extern T14 T157f9(GE_context* ac, T0* C);
/* C_STRING.item */
extern T14 T111f3(GE_context* ac, T0* C);
/* C_STRING.make */
extern T0* T111c9(GE_context* ac, T0* a1);
/* C_STRING.make_empty */
extern void T111f7(GE_context* ac, T0* C, T6 a1);
/* C_STRING.make_empty */
extern T0* T111c7(GE_context* ac, T6 a1);
/* UTF_CONVERTER.escaped_utf_32_substring_into_utf_16_0_pointer */
extern void T109f15(GE_context* ac, T109* C, T0* a1, T6 a2, T6 a3, T0* a4, T6 a5, T0* a6);
/* MANAGED_POINTER.put_natural_16 */
extern void T112f16(GE_context* ac, T0* C, T9 a1, T6 a2);
/* NATURAL_32.to_natural_16 */
extern T9 T10f23(GE_context* ac, T10* C);
/* NATURAL_32.is_greater */
extern T1 T10f22(GE_context* ac, T10* C, T10 a1);
/* UTF_CONVERTER.utf_16_bytes_count */
extern T6 T109f5(GE_context* ac, T109* C, T0* a1, T6 a2, T6 a3);
/* MANAGED_POINTER.resize */
extern void T112f11(GE_context* ac, T0* C, T6 a1);
/* POINTER.memory_set */
extern void T14f12(GE_context* ac, T14* C, T6 a1, T6 a2);
/* POINTER.c_memset */
extern void T14f16(GE_context* ac, T14* C, T14 a1, T6 a2, T6 a3);
/* EXCEPTIONS.raise */
extern void T133f2(GE_context* ac, T0* C, T0* a1);
/* DEVELOPER_EXCEPTION.raise */
extern void T83f16(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.raise */
extern void T19f17(GE_context* ac, T0* C, T0* a1);
/* DEVELOPER_EXCEPTION.code */
extern T6 T83f8(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.default_pointer */
extern T14 T19f12(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.set_last_exception */
extern void T19f16(GE_context* ac, T0* C, T0* a1);
/* CELL [detachable EXCEPTION].put */
extern void T25f2(GE_context* ac, T0* C, T0* a1);
/* CELL [detachable EXCEPTION].put */
extern T0* T25c2(GE_context* ac, T0* a1);
/* ISE_EXCEPTION_MANAGER.last_exception_cell */
extern unsigned char ge2503os2671;
extern T0* ge2503ov2671;
extern T0* T19f5(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.last_exception */
extern T0* T19f8(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.in_rescue */
extern T1 T19f11(GE_context* ac, T0* C);
/* DEVELOPER_EXCEPTION.is_ignored */
extern T1 T83f7(GE_context* ac, T0* C);
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
extern unsigned char ge2503os2666;
extern T0* ge2503ov2666;
extern T0* T19f1(GE_context* ac, T0* C);
/* HASH_TABLE [INTEGER_32, INTEGER_32].make */
extern T0* T23c35(GE_context* ac, T6 a1);
/* SPECIAL [INTEGER_32].make_filled */
extern T0* T88c7(GE_context* ac, T6 a1, T6 a2);
/* SPECIAL [INTEGER_32].fill_with */
extern void T88f10(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].extend */
extern void T88f11(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [BOOLEAN].make_filled */
extern T0* T89c5(GE_context* ac, T1 a1, T6 a2);
/* SPECIAL [BOOLEAN].fill_with */
extern void T89f8(GE_context* ac, T0* C, T1 a1, T6 a2, T6 a3);
/* SPECIAL [BOOLEAN].extend */
extern void T89f10(GE_context* ac, T0* C, T1 a1);
/* SPECIAL [BOOLEAN].make_empty */
extern void T89f7(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [BOOLEAN].make_empty */
extern T0* T89c7(GE_context* ac, T6 a1);
/* SPECIAL [INTEGER_32].make_empty */
extern void T88f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [INTEGER_32].make_empty */
extern T0* T88c6(GE_context* ac, T6 a1);
/* PRIMES.higher_prime */
extern T6 T87f1(GE_context* ac, T0* C, T6 a1);
/* PRIMES.is_prime */
extern T1 T87f3(GE_context* ac, T0* C, T6 a1);
/* PRIMES.default_create */
extern T0* T87c5(GE_context* ac);
/* DEVELOPER_EXCEPTION.generating_type */
extern T0* T83f9(GE_context* ac, T0* C);
/* DEVELOPER_EXCEPTION.exception_manager */
extern T0* T83f6(GE_context* ac, T0* C);
/* DEVELOPER_EXCEPTION.default_create */
extern T0* T83c10(GE_context* ac);
/* EXCEPTIONS.default_create */
extern T0* T133c1(GE_context* ac);
/* MANAGED_POINTER.default_pointer */
extern T14 T112f4(GE_context* ac, T0* C);
/* POINTER.memory_realloc */
extern T14 T14f2(GE_context* ac, T14* C, T6 a1);
/* POINTER.c_realloc */
extern T14 T14f6(GE_context* ac, T14* C, T14 a1, T6 a2);
/* INTEGER_32.max */
extern T6 T6f7(GE_context* ac, T6* C, T6 a1);
/* MANAGED_POINTER.make */
extern T0* T112c9(GE_context* ac, T6 a1);
/* POINTER.memory_calloc */
extern T14 T14f5(GE_context* ac, T14* C, T6 a1, T6 a2);
/* POINTER.c_calloc */
extern T14 T14f4(GE_context* ac, T14* C, T6 a1, T6 a2);
/* PLATFORM.is_windows */
extern T1 T135s1(GE_context* ac);
/* CONSOLE.buffered_file_info */
extern unsigned char ge2226os6241;
extern T0* ge2226ov6241;
extern T0* T158f10(GE_context* ac, T0* C);
/* FILE_INFO.make */
extern T0* T157c15(GE_context* ac);
/* FILE_INFO.make_filled_area */
extern void T157f17(GE_context* ac, T0* C, T8 a1, T6 a2);
/* SPECIAL [NATURAL_8].make_filled */
extern T0* T159c8(GE_context* ac, T8 a1, T6 a2);
/* FILE_INFO.stat_size */
extern T6 T157f7(GE_context* ac, T0* C);
/* KL_STDERR_FILE.io */
extern unsigned char ge2206os44;
extern T0* ge2206ov44;
extern T0* T100f4(GE_context* ac, T0* C);
/* STD_FILES.set_output_default */
extern void T132f5(GE_context* ac, T0* C);
/* STD_FILES.output */
extern unsigned char ge2278os175;
extern T0* ge2278ov175;
extern T0* T132f3(GE_context* ac, T0* C);
/* CONSOLE.make_open_stdout */
extern T0* T158c14(GE_context* ac, T0* a1);
/* STD_FILES.default_create */
extern T0* T132c4(GE_context* ac);
/* KL_STRING_ROUTINES.as_string */
extern T0* T86f10(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.string */
extern T0* T296f14(GE_context* ac, T0* C);
/* STRING_8.append_character */
extern void T17f37(GE_context* ac, T0* C, T2 a1);
/* STRING_8.resize */
extern void T17f43(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].aliased_resized_area_with_default */
extern T0* T15f6(GE_context* ac, T0* C, T2 a1, T6 a2);
/* SPECIAL [CHARACTER_8].aliased_resized_area */
extern T0* T15f7(GE_context* ac, T0* C, T6 a1);
/* STRING_8.additional_space */
extern T6 T17f21(GE_context* ac, T0* C);
/* STRING_8.capacity */
extern T6 T17f20(GE_context* ac, T0* C);
/* STRING_8.string */
extern T0* T17f25(GE_context* ac, T0* C);
/* UC_UTF8_STRING.as_string */
extern T0* T296f13(GE_context* ac, T0* C);
/* UC_UTF8_STRING.to_utf8 */
extern T0* T296f31(GE_context* ac, T0* C);
/* KL_STRING_ROUTINES.any_ */
extern T0* T86f5(GE_context* ac, T0* C);
/* KL_STDERR_FILE.string_ */
extern unsigned char ge37os2760;
extern T0* ge37ov2760;
extern T0* T100f1(GE_context* ac, T0* C);
/* KL_STRING_ROUTINES.default_create */
extern T0* T86c14(GE_context* ac);
/* ET_XACE_DEFAULT_ERROR_HANDLER.message */
extern T0* T35f6(GE_context* ac, T0* C, T0* a1);
/* GEXACE.usage_message */
extern unsigned char ge2os2747;
extern T0* ge2ov2747;
extern T0* T22f15(GE_context* ac, T0* C);
/* UT_USAGE_MESSAGE.make */
extern T0* T41c8(GE_context* ac, T0* a1);
/* ARRAY [STRING_8].put */
extern void T105f7(GE_context* ac, T0* C, T0* a1, T6 a2);
/* ARRAY [STRING_8].make_filled */
extern T0* T105c6(GE_context* ac, T0* a1, T6 a2, T6 a3);
/* ARRAY [STRING_8].make_filled_area */
extern void T105f8(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].make_filled */
extern T0* T94c9(GE_context* ac, T0* a1, T6 a2);
/* SPECIAL [STRING_8].fill_with */
extern void T94f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].extend */
extern void T94f8(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [STRING_8].make_empty */
extern void T94f5(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [STRING_8].make_empty */
extern T0* T94c5(GE_context* ac, T6 a1);
/* GEXACE.process_validate */
extern void T22f32(GE_context* ac, T0* C);
/* GEXACE.process_xace_file */
extern void T22f36(GE_context* ac, T0* C, T0* a1);
/* GEXACE.next_option */
extern T0* T22f17(GE_context* ac, T0* C);
/* KL_ARGUMENTS.argument */
extern T0* T30f4(GE_context* ac, T0* C, T6 a1);
/* IMMUTABLE_STRING_32.as_string_8 */
extern T0* T91f6(GE_context* ac, T0* C);
/* STRING_8.put_code */
extern void T17f48(GE_context* ac, T0* C, T10 a1, T6 a2);
/* STRING_8.valid_code */
extern T1 T17f28(GE_context* ac, T0* C, T10 a1);
/* IMMUTABLE_STRING_32.code */
extern T10 T91f5(GE_context* ac, T0* C, T6 a1);
/* ARGUMENTS_32.argument */
extern T0* T90f1(GE_context* ac, T0* C, T6 a1);
/* ARRAY [IMMUTABLE_STRING_32].item */
extern T0* T116f5(GE_context* ac, T0* C, T6 a1);
/* ARGUMENTS_32.internal_argument_array */
extern unsigned char ge2208os3483;
extern T0* ge2208ov3483;
extern T0* T90f3(GE_context* ac, T0* C);
/* ARRAY [IMMUTABLE_STRING_32].put */
extern void T116f8(GE_context* ac, T0* C, T0* a1, T6 a2);
/* ARGUMENTS_32.i_th_argument_string */
extern T0* T90f4(GE_context* ac, T0* C, T6 a1);
/* IMMUTABLE_STRING_32.make_from_string */
extern T0* T91c8(GE_context* ac, T0* a1);
/* SPECIAL [CHARACTER_32].copy_data */
extern void T16f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [CHARACTER_32].force */
extern void T16f10(GE_context* ac, T0* C, T3 a1, T6 a2);
/* SPECIAL [CHARACTER_32].extend */
extern void T16f15(GE_context* ac, T0* C, T3 a1);
/* SPECIAL [CHARACTER_32].move_data */
extern void T16f9(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_32].overlapping_move */
extern void T16f13(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_32].fill_with */
extern void T16f11(GE_context* ac, T0* C, T3 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_32].non_overlapping_move */
extern void T16f12(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_32.area_lower */
extern T6 T18f7(GE_context* ac, T0* C);
/* SPECIAL [CHARACTER_32].make_empty */
extern void T16f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [CHARACTER_32].make_empty */
extern T0* T16c6(GE_context* ac, T6 a1);
/* NATIVE_STRING.string */
extern T0* T118f4(GE_context* ac, T0* C);
/* UTF_CONVERTER.utf_8_0_pointer_to_escaped_string_32 */
extern T0* T109f3(GE_context* ac, T109* C, T0* a1);
/* UTF_CONVERTER.utf_8_0_pointer_into_escaped_string_32 */
extern void T109f11(GE_context* ac, T109* C, T0* a1, T0* a2);
/* UTF_CONVERTER.utf_8_0_subpointer_into_escaped_string_32 */
extern void T109f13(GE_context* ac, T109* C, T0* a1, T6 a2, T6 a3, T1 a4, T0* a5);
/* UTF_CONVERTER.escape_code_into */
extern void T109f14(GE_context* ac, T109* C, T0* a1, T9 a2);
/* NATURAL_16.to_hex_string */
extern T0* T9f4(GE_context* ac, T9* C);
/* STRING_8.put */
extern void T17f50(GE_context* ac, T0* C, T2 a1, T6 a2);
/* INTEGER_32.to_hex_character */
extern T2 T6f20(GE_context* ac, T6* C);
/* NATURAL_16.to_integer_32 */
extern T6 T9f8(GE_context* ac, T9* C);
/* STRING_8.fill_blank */
extern void T17f49(GE_context* ac, T0* C);
/* STRING_8.fill_character */
extern void T17f51(GE_context* ac, T0* C, T2 a1);
/* PLATFORM.default_create */
extern T0* T135c4(GE_context* ac);
/* STRING_32.append_string_general */
extern void T18f15(GE_context* ac, T0* C, T0* a1);
/* STRING_32.append */
extern void T18f15p1(GE_context* ac, T0* C, T0* a1);
/* STRING_32.reset_hash_codes */
extern void T18f17(GE_context* ac, T0* C);
/* STRING_32.set_count */
extern void T18f20(GE_context* ac, T0* C, T6 a1);
/* STRING_32.append_code */
extern void T18f19(GE_context* ac, T0* C, T10 a1);
/* STRING_32.put_code */
extern void T18f21(GE_context* ac, T0* C, T10 a1, T6 a2);
/* STRING_32.resize */
extern void T18f16(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [CHARACTER_32].aliased_resized_area_with_default */
extern T0* T16f4(GE_context* ac, T0* C, T3 a1, T6 a2);
/* SPECIAL [CHARACTER_32].aliased_resized_area */
extern T0* T16f5(GE_context* ac, T0* C, T6 a1);
/* STRING_32.capacity */
extern T6 T18f5(GE_context* ac, T0* C);
/* STRING_32.append */
extern void T18f18(GE_context* ac, T0* C, T0* a1);
/* STRING_32.additional_space */
extern T6 T18f6(GE_context* ac, T0* C);
/* NATURAL_8.to_hex_string */
extern T0* T8f8(GE_context* ac, T8* C);
/* NATURAL_8.to_integer_32 */
extern T6 T8f14(GE_context* ac, T8* C);
/* NATURAL_16.is_less_equal */
extern T1 T9f2(GE_context* ac, T9* C, T9 a1);
/* STRING_32.append_character */
extern void T18f14(GE_context* ac, T0* C, T3 a1);
/* NATURAL_8.to_natural_16 */
extern T9 T8f6(GE_context* ac, T8* C);
/* STRING_32.extend */
extern void T18f13(GE_context* ac, T0* C, T3 a1);
/* NATURAL_8.is_less_equal */
extern T1 T8f2(GE_context* ac, T8* C, T8 a1);
/* MANAGED_POINTER.read_natural_8 */
extern T8 T112f7(GE_context* ac, T0* C, T6 a1);
/* TYPED_POINTER [NATURAL_8].memory_copy */
extern void T134f2(GE_context* ac, T134* C, T14 a1, T6 a2);
/* TYPED_POINTER [NATURAL_8].c_memcpy */
extern void T134f3(GE_context* ac, T134* C, T14 a1, T14 a2, T6 a3);
/* STRING_32.grow */
extern void T18f12(GE_context* ac, T0* C, T6 a1);
/* STRING_32.make */
extern T0* T18c11(GE_context* ac, T6 a1);
/* SPECIAL [CHARACTER_32].make_filled */
extern T0* T16c8(GE_context* ac, T3 a1, T6 a2);
/* UTF_CONVERTER.utf_16_0_pointer_to_escaped_string_32 */
extern T0* T109f2(GE_context* ac, T109* C, T0* a1);
/* UTF_CONVERTER.utf_16_0_pointer_into_escaped_string_32 */
extern void T109f10(GE_context* ac, T109* C, T0* a1, T0* a2);
/* UTF_CONVERTER.utf_16_0_subpointer_into_escaped_string_32 */
extern void T109f12(GE_context* ac, T109* C, T0* a1, T6 a2, T6 a3, T1 a4, T0* a5);
/* NATURAL_32.is_greater_equal */
extern T1 T10f10(GE_context* ac, T10* C, T10 a1);
/* NATURAL_16.to_natural_32 */
extern T10 T9f7(GE_context* ac, T9* C);
/* MANAGED_POINTER.read_natural_16 */
extern T9 T112f6(GE_context* ac, T0* C, T6 a1);
/* TYPED_POINTER [NATURAL_16].memory_copy */
extern void T138f2(GE_context* ac, T138* C, T14 a1, T6 a2);
/* TYPED_POINTER [NATURAL_16].c_memcpy */
extern void T138f3(GE_context* ac, T138* C, T14 a1, T14 a2, T6 a3);
/* NATIVE_STRING.set_shared_from_pointer */
extern void T118f10(GE_context* ac, T0* C, T14 a1);
/* NATIVE_STRING.set_shared_from_pointer_and_count */
extern void T118f11(GE_context* ac, T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.set_from_pointer */
extern void T112f15(GE_context* ac, T0* C, T14 a1, T6 a2);
/* NATIVE_STRING.unit_size */
extern T6 T118f3(GE_context* ac, T0* C);
/* NATIVE_STRING.pointer_length_in_bytes */
extern T6 T118f5(GE_context* ac, T0* C, T14 a1);
/* NATURAL_64.to_integer_32 */
extern T6 T11f2(GE_context* ac, T11* C);
/* NATURAL_64.is_less_equal */
extern T1 T11f12(GE_context* ac, T11* C, T11 a1);
/* NATIVE_STRING.c_pointer_length_in_bytes */
extern T11 T118f6(GE_context* ac, T0* C, T14 a1);
/* ARGUMENTS_32.default_pointer */
extern T14 T90f6(GE_context* ac, T0* C);
/* NATIVE_STRING.make_empty */
extern void T118f9(GE_context* ac, T0* C, T6 a1);
/* NATIVE_STRING.make_empty */
extern T0* T118c9(GE_context* ac, T6 a1);
/* ARRAY [IMMUTABLE_STRING_32].compare_objects */
extern void T116f7(GE_context* ac, T0* C);
/* ARRAY [IMMUTABLE_STRING_32].make_filled */
extern T0* T116c6(GE_context* ac, T0* a1, T6 a2, T6 a3);
/* ARRAY [IMMUTABLE_STRING_32].make_filled_area */
extern void T116f9(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [IMMUTABLE_STRING_32].make_filled */
extern T0* T117c4(GE_context* ac, T0* a1, T6 a2);
/* SPECIAL [IMMUTABLE_STRING_32].fill_with */
extern void T117f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [IMMUTABLE_STRING_32].extend */
extern void T117f8(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [IMMUTABLE_STRING_32].make_empty */
extern void T117f6(GE_context* ac, T0* C, T6 a1);
/* IMMUTABLE_STRING_32.make_empty */
extern T0* T91c7(GE_context* ac);
/* IMMUTABLE_STRING_32.make */
extern void T91f9(GE_context* ac, T0* C, T6 a1);
/* KL_ARGUMENTS.internal_arguments */
extern unsigned char ge2207os3464;
extern T0* ge2207ov3464;
extern T0* T30f3(GE_context* ac, T0* C);
/* ARGUMENTS_32.default_create */
extern T0* T90c7(GE_context* ac);
/* GEXACE.has_next_option */
extern T1 T22f16(GE_context* ac, T0* C);
/* GEXACE.is_valid_option_position */
extern T1 T22f19(GE_context* ac, T0* C, T6 a1);
/* KL_ARGUMENTS.argument_count */
extern T6 T30f2(GE_context* ac, T0* C);
/* GEXACE.consume_option */
extern void T22f28(GE_context* ac, T0* C);
/* DS_LINKED_LIST [GEXACE_COMMAND].force_last */
extern void T34f8(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [GEXACE_COMMAND].put_right */
extern void T97f4(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [GEXACE_COMMAND].make */
extern T0* T97c3(GE_context* ac, T0* a1);
/* GEXACE_VALIDATE_COMMAND.set_shallow */
extern void T48f7(GE_context* ac, T0* C, T1 a1);
/* GEXACE_VALIDATE_COMMAND.make */
extern T0* T48c6(GE_context* ac, T0* a1, T0* a2);
/* GEXACE.process_library */
extern void T22f31(GE_context* ac, T0* C);
/* GEXACE.process_output */
extern void T22f35(GE_context* ac, T0* C, T0* a1);
/* GEXACE_LIBRARY_COMMAND.set_output_filename */
extern void T47f13(GE_context* ac, T0* C, T0* a1);
/* GEXACE_SYSTEM_COMMAND.set_output_filename */
extern void T43f13(GE_context* ac, T0* C, T0* a1);
/* GEXACE.process_compilers */
extern void T22f34(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].is_empty */
extern T1 T53f6(GE_context* ac, T0* C);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].force_last */
extern void T53f9(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [ET_XACE_GENERATOR].put_right */
extern void T107f4(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [ET_XACE_GENERATOR].make */
extern T0* T107c3(GE_context* ac, T0* a1);
/* STRING_8.is_equal */
extern T1 T17f27(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].same_items */
extern T1 T15f4(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* ET_XACE_ECF_GENERATOR.make */
extern T0* T52c23(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* ET_XACE_ACE_GENERATOR.make */
extern T0* T51c17(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* ET_XACE_XACE_GENERATOR.make */
extern T0* T50c17(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* STRING_8.same_string */
extern T1 T17f10(GE_context* ac, T0* C, T0* a1);
/* STRING_8.same_characters */
extern T1 T17f16(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* UC_UTF8_STRING.area_lower */
extern T6 T296f38(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].force_last */
extern void T31f39(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_put */
extern void T31f47(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [STRING_8].force */
extern void T93f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_put */
extern void T31f46(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_put */
extern void T31f45(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_item */
extern T6 T31f22(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].hash_position */
extern T6 T31f29(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.hash_code */
extern T6 T296f8(GE_context* ac, T0* C);
/* UC_UTF8_STRING.hash_code */
extern T6 T296f8p1(GE_context* ac, T0* C);
/* STRING_8.hash_code */
extern T6 T17f5(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].resize */
extern void T31f44(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_resize */
extern void T31f52(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].aliased_resized_area_with_default */
extern T0* T96f1(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].aliased_resized_area_with_default */
extern T0* T88f4(GE_context* ac, T0* C, T6 a1, T6 a2);
/* SPECIAL [INTEGER_32].aliased_resized_area */
extern T0* T88f5(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].special_integer_ */
extern unsigned char ge36os3687;
extern T0* ge36ov3687;
extern T0* T31f28(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [INTEGER_32].default_create */
extern T0* T96c5(GE_context* ac);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_resize */
extern void T31f51(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].aliased_resized_area */
extern T0* T93f1(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].aliased_resized_area */
extern T0* T94f3(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_resize */
extern void T31f50(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_item */
extern T0* T31f26(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_item */
extern T6 T31f24(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_resize */
extern void T31f49(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_modulus */
extern T6 T31f21(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_capacity */
extern T6 T31f23(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_put */
extern void T31f43(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].search_position */
extern void T31f42(GE_context* ac, T0* C, T0* a1);
/* UC_STRING_EQUALITY_TESTER.test */
extern T1 T32f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.same_string */
extern T1 T86f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* STRING_8.item_code */
extern T6 T17f7(GE_context* ac, T0* C, T6 a1);
/* KL_STRING_ROUTINES.elks_same_string */
extern T1 T86f7(GE_context* ac, T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.same_string */
extern T1 T296f39(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.substring_index */
extern T6 T296f22(GE_context* ac, T0* C, T0* a1, T6 a2);
/* UC_UTF8_STRING.as_string_8 */
extern T0* T296f9(GE_context* ac, T0* C);
/* UC_UTF8_STRING.put_code */
extern void T296f63(GE_context* ac, T0* C, T10 a1, T6 a2);
/* UC_UTF8_STRING.put_item_code */
extern void T296f78(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.move_bytes_right */
extern void T296f83(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.resize_byte_storage */
extern void T296f73(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.resize */
extern void T296f87(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.move_bytes_left */
extern void T296f82(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.valid_code */
extern T1 T296f30(GE_context* ac, T0* C, T10 a1);
/* STRING_8.as_string_8 */
extern T0* T17f31(GE_context* ac, T0* C);
/* UC_UTF8_STRING.same_unicode_string */
extern T1 T296f27(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.unicode_substring_index */
extern T6 T296f21(GE_context* ac, T0* C, T0* a1, T6 a2);
/* UC_STRING_EQUALITY_TESTER.string_ */
extern T0* T32f2(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].unset_found_item */
extern void T31f41(GE_context* ac, T0* C);
/* GEXACE.process_format */
extern void T22f33(GE_context* ac, T0* C, T0* a1);
/* GEXACE_LIBRARY_COMMAND.set_format */
extern void T47f12(GE_context* ac, T0* C, T0* a1);
/* GEXACE_SYSTEM_COMMAND.set_format */
extern void T43f12(GE_context* ac, T0* C, T0* a1);
/* GEXACE.next_option_value */
extern T0* T22f11(GE_context* ac, T0* C);
/* STRING_8.index_of */
extern T6 T17f26(GE_context* ac, T0* C, T2 a1, T6 a2);
/* GEXACE.has_next_option_value */
extern T1 T22f10(GE_context* ac, T0* C);
/* GEXACE.is_next_option_long_option */
extern T1 T22f9(GE_context* ac, T0* C);
/* GEXACE.string_ */
extern T0* T22f18(GE_context* ac, T0* C);
/* GEXACE_LIBRARY_COMMAND.set_shallow */
extern void T47f11(GE_context* ac, T0* C, T1 a1);
/* GEXACE_LIBRARY_COMMAND.make */
extern T0* T47c10(GE_context* ac, T0* a1, T0* a2);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].make */
extern T0* T53c8(GE_context* ac);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].set_internal_cursor */
extern void T53f10(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].new_cursor */
extern T0* T53f5(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].make */
extern T0* T106c8(GE_context* ac, T0* a1);
/* GEXACE.process_system */
extern void T22f30(GE_context* ac, T0* C);
/* GEXACE_SYSTEM_COMMAND.set_shallow */
extern void T43f11(GE_context* ac, T0* C, T1 a1);
/* GEXACE_SYSTEM_COMMAND.make */
extern T0* T43c10(GE_context* ac, T0* a1, T0* a2);
/* GEXACE.match_long_option */
extern T1 T22f8(GE_context* ac, T0* C, T0* a1);
/* GEXACE.process_options */
extern void T22f25(GE_context* ac, T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.enable_verbose */
extern void T35f10(GE_context* ac, T0* C);
/* KL_STANDARD_FILES.output */
extern unsigned char ge77os3884;
extern T0* ge77ov3884;
extern T0* T99f2(GE_context* ac, T0* C);
/* KL_STDOUT_FILE.make */
extern T0* T101c1(GE_context* ac);
/* KL_STANDARD_FILES.error */
extern unsigned char ge77os3885;
extern T0* ge77ov3885;
extern T0* T99f1(GE_context* ac, T0* C);
/* KL_STDERR_FILE.make */
extern T0* T100c5(GE_context* ac);
/* ET_XACE_DEFAULT_ERROR_HANDLER.std */
extern unsigned char ge75os3848;
extern T0* ge75ov3848;
extern T0* T35f7(GE_context* ac, T0* C);
/* KL_STANDARD_FILES.default_create */
extern T0* T99c3(GE_context* ac);
/* GEXACE.process_define */
extern void T22f24(GE_context* ac, T0* C);
/* GEXACE.process_define_string */
extern void T22f27(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].forth */
extern void T38f11(GE_context* ac, T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_forth */
extern void T40f13(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].add_traversing_cursor */
extern void T40f14(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T38f13(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].remove_traversing_cursor */
extern void T40f15(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].set */
extern void T38f12(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* GEXACE.split_on_first */
extern T0* T22f14(GE_context* ac, T0* C, T0* a1, T2 a2);
/* DS_PAIR [STRING_8, STRING_8].make */
extern T0* T39c3(GE_context* ac, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.new_empty_string */
extern T0* T86f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* UC_UTF8_STRING.old_wipe_out */
extern void T296f66(GE_context* ac, T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T296f81(GE_context* ac, T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T296f66p1(GE_context* ac, T0* C);
/* STRING_8.wipe_out */
extern void T17f38(GE_context* ac, T0* C);
/* KL_STRING_ROUTINES.cloned_string */
extern T0* T86f8(GE_context* ac, T0* C, T0* a1);
/* STRING_8.twin */
extern T0* T17f11(GE_context* ac, T0* C);
/* STRING_8.copy */
extern void T17f40(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.new_empty_string */
extern T0* T296f17(GE_context* ac, T0* C, T6 a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].item */
extern T0* T38f6(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].start */
extern void T38f10(GE_context* ac, T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_start */
extern void T40f12(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].cursor_off */
extern T1 T40f6(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].off */
extern T1 T38f7(GE_context* ac, T0* C);
/* DS_LINKED_LIST [STRING_8].new_cursor */
extern T0* T40f5(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].make */
extern T0* T38c9(GE_context* ac, T0* a1);
/* GEXACE.split_string */
extern T0* T22f13(GE_context* ac, T0* C, T0* a1, T2 a2);
/* DS_LINKED_LIST [STRING_8].put_last */
extern void T40f10(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [STRING_8].put_right */
extern void T104f4(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [STRING_8].make */
extern T0* T104c3(GE_context* ac, T0* a1);
/* DS_LINKED_LIST [STRING_8].make */
extern T0* T40c9(GE_context* ac);
/* DS_LINKED_LIST [STRING_8].set_internal_cursor */
extern void T40f11(GE_context* ac, T0* C, T0* a1);
/* GEXACE.make_command_line_parser */
extern void T22f21(GE_context* ac, T0* C);
/* GEXACE.reset */
extern void T22f23(GE_context* ac, T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.make */
extern T0* T35c9(GE_context* ac);
/* ET_XACE_DEFAULT_ERROR_HANDLER.set_warning_null */
extern void T35f14(GE_context* ac, T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.null_output_stream */
extern unsigned char ge76os3850;
extern T0* ge76ov3850;
extern T0* T35f8(GE_context* ac, T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.make */
extern T0* T102c3(GE_context* ac, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.set_info_null */
extern void T35f13(GE_context* ac, T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.make_standard */
extern void T35f12(GE_context* ac, T0* C);
/* DS_LINKED_LIST [GEXACE_COMMAND].make */
extern T0* T34c7(GE_context* ac);
/* DS_LINKED_LIST [GEXACE_COMMAND].set_internal_cursor */
extern void T34f9(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_key_equality_tester */
extern void T31f38(GE_context* ac, T0* C, T0* a1);
/* GEXACE.string_equality_tester */
extern unsigned char ge131os2766;
extern T0* ge131ov2766;
extern T0* T22f12(GE_context* ac, T0* C);
/* UC_STRING_EQUALITY_TESTER.default_create */
extern T0* T32c3(GE_context* ac);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map */
extern void T31f37(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map */
extern T0* T31c37(GE_context* ac, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_with_equality_testers */
extern void T31f40(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_sparse_container */
extern void T31f48(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_internal_cursor */
extern void T31f57(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_cursor */
extern T0* T31f27(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].make */
extern T0* T95c4(GE_context* ac, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_slots */
extern void T31f56(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_clashes */
extern void T31f55(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_key_storage */
extern void T31f54(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].make */
extern T0* T93f2(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].default_create */
extern T0* T93c3(GE_context* ac);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_item_storage */
extern void T31f53(GE_context* ac, T0* C, T6 a1);
/* KL_ARGUMENTS.set_program_name */
extern void T30f6(GE_context* ac, T0* C, T0* a1);
/* GEXACE.arguments */
extern unsigned char ge111os2759;
extern T0* ge111ov2759;
extern T0* T22f7(GE_context* ac, T0* C);
/* KL_ARGUMENTS.make */
extern T0* T30c5(GE_context* ac);
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
extern void T65f15(GE_context* ac, T0* C, T0* a1);
/* COM_FAILURE.ccom_hresult_to_string */
extern T0* T65f11(GE_context* ac, T0* C, T6 a1);
/* STRING_8.plus */
extern T0* T17f12(GE_context* ac, T0* C, T0* a1);
/* STRING_8.append_string_general */
extern void T17f42(GE_context* ac, T0* C, T0* a1);
/* STRING_8.append */
extern void T17f42p1(GE_context* ac, T0* C, T0* a1);
/* STRING_8.append_code */
extern void T17f46(GE_context* ac, T0* C, T10 a1);
/* STRING_8.append */
extern void T17f41(GE_context* ac, T0* C, T0* a1);
/* INTEGER_32.to_hex_string */
extern T0* T6f18(GE_context* ac, T6* C);
/* COM_FAILURE.set_hresult_code */
extern void T65f14(GE_context* ac, T0* C, T6 a1);
/* OPERATING_SYSTEM_FAILURE.set_error_code */
extern void T64f9(GE_context* ac, T0* C, T6 a1);
/* IO_FAILURE.set_error_code */
extern void T63f11(GE_context* ac, T0* C, T6 a1);
/* OPERATING_SYSTEM_SIGNAL_FAILURE.set_signal_code */
extern void T62f9(GE_context* ac, T0* C, T6 a1);
/* INVARIANT_VIOLATION.set_is_entry */
extern void T61f9(GE_context* ac, T0* C, T1 a1);
/* ROUTINE_FAILURE.set_class_name */
extern void T56f10(GE_context* ac, T0* C, T0* a1);
/* ROUTINE_FAILURE.set_routine_name */
extern void T56f9(GE_context* ac, T0* C, T0* a1);
/* ISE_EXCEPTION_MANAGER.exception_from_code */
extern T0* T19f10(GE_context* ac, T0* C, T6 a1);
/* SERIALIZATION_FAILURE.default_create */
extern T0* T85c6(GE_context* ac);
/* OLD_VIOLATION.default_create */
extern T0* T58c6(GE_context* ac);
/* COM_FAILURE.default_create */
extern T0* T65c12(GE_context* ac);
/* ADDRESS_APPLIED_TO_MELTED_FEATURE.default_create */
extern T0* T84c6(GE_context* ac);
/* MISMATCH_FAILURE.default_create */
extern T0* T82c6(GE_context* ac);
/* OPERATING_SYSTEM_FAILURE.default_create */
extern T0* T64c7(GE_context* ac);
/* IO_FAILURE.set_code */
extern void T63f9(GE_context* ac, T0* C, T6 a1);
/* IO_FAILURE.default_create */
extern T0* T63c8(GE_context* ac);
/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE.default_create */
extern T0* T81c6(GE_context* ac);
/* VOID_ASSIGNED_TO_EXPANDED.default_create */
extern T0* T80c6(GE_context* ac);
/* EXTERNAL_FAILURE.default_create */
extern T0* T79c6(GE_context* ac);
/* CREATE_ON_DEFERRED.default_create */
extern T0* T78c6(GE_context* ac);
/* RESUMPTION_FAILURE.default_create */
extern T0* T77c6(GE_context* ac);
/* RESCUE_FAILURE.default_create */
extern T0* T76c6(GE_context* ac);
/* EIFFEL_RUNTIME_PANIC.set_code */
extern void T66f9(GE_context* ac, T0* C, T6 a1);
/* EIFFEL_RUNTIME_PANIC.code */
extern T6 T66f7(GE_context* ac, T0* C);
/* EIFFEL_RUNTIME_PANIC.default_create */
extern T0* T66c8(GE_context* ac);
/* OPERATING_SYSTEM_SIGNAL_FAILURE.default_create */
extern T0* T62c7(GE_context* ac);
/* LOOP_INVARIANT_VIOLATION.default_create */
extern T0* T75c6(GE_context* ac);
/* VARIANT_VIOLATION.default_create */
extern T0* T74c6(GE_context* ac);
/* BAD_INSPECT_VALUE.default_create */
extern T0* T73c6(GE_context* ac);
/* ROUTINE_FAILURE.default_create */
extern T0* T56c8(GE_context* ac);
/* CHECK_VIOLATION.default_create */
extern T0* T72c6(GE_context* ac);
/* INVARIANT_VIOLATION.default_create */
extern T0* T61c7(GE_context* ac);
/* FLOATING_POINT_FAILURE.default_create */
extern T0* T71c6(GE_context* ac);
/* POSTCONDITION_VIOLATION.default_create */
extern T0* T70c6(GE_context* ac);
/* PRECONDITION_VIOLATION.default_create */
extern T0* T69c6(GE_context* ac);
/* NO_MORE_MEMORY.set_code */
extern void T60f10(GE_context* ac, T0* C, T6 a1);
/* NO_MORE_MEMORY.code */
extern T6 T60f7(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.no_memory_exception_object_cell */
extern unsigned char ge2503os2672;
extern T0* ge2503ov2672;
extern T0* T19f6(GE_context* ac, T0* C);
/* CELL [NO_MORE_MEMORY].put */
extern T0* T26c2(GE_context* ac, T0* a1);
/* NO_MORE_MEMORY.default_create */
extern T0* T60c8(GE_context* ac);
/* VOID_TARGET.default_create */
extern T0* T54c6(GE_context* ac);
/* ISE_EXCEPTION_MANAGER.exception_data */
extern T0* T19f9(GE_context* ac, T0* C);
/* CELL [detachable TUPLE [INTEGER_32, INTEGER_32, INTEGER_32, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, INTEGER_32, BOOLEAN]].put */
extern void T24f2(GE_context* ac, T0* C, T0* a1);
/* CELL [detachable TUPLE [INTEGER_32, INTEGER_32, INTEGER_32, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, INTEGER_32, BOOLEAN]].put */
extern T0* T24c2(GE_context* ac, T0* a1);
/* ISE_EXCEPTION_MANAGER.exception_data_cell */
extern unsigned char ge2503os2670;
extern T0* ge2503ov2670;
extern T0* T19f4(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.init_exception_manager */
extern void T19f14(GE_context* ac, T0* C);
/* ISE_EXCEPTION_MANAGER.unraisable_exceptions */
extern unsigned char ge2503os2668;
extern T0* ge2503ov2668;
extern T0* T19f3(GE_context* ac, T0* C);
/* HASH_TABLE [INTEGER_32, INTEGER_32].force */
extern void T23f36(GE_context* ac, T0* C, T6 a1, T6 a2);
/* HASH_TABLE [INTEGER_32, INTEGER_32].position */
extern T6 T23f22(GE_context* ac, T0* C);
/* SPECIAL [INTEGER_32].force */
extern void T88f9(GE_context* ac, T0* C, T6 a1, T6 a2);
/* SPECIAL [BOOLEAN].force */
extern void T89f6(GE_context* ac, T0* C, T1 a1, T6 a2);
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
extern unsigned char ge2503os2667;
extern T0* ge2503ov2667;
extern T0* T19f2(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.dispose */
extern void T128f26(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.old_close */
extern void T128f30(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.default_pointer */
extern T14 T128f16(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.file_close */
extern void T128f33(GE_context* ac, T0* C, T14 a1);
/* KL_TEXT_OUTPUT_FILE.old_is_closed */
extern T1 T128f11(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.dispose */
extern void T126f41(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.old_close */
extern void T126f45(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.default_pointer */
extern T14 T126f20(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.file_close */
extern void T126f48(GE_context* ac, T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.old_is_closed */
extern T1 T126f11(GE_context* ac, T0* C);
/* MANAGED_POINTER.dispose */
extern void T112f10(GE_context* ac, T0* C);
/* POINTER.memory_free */
extern void T14f11(GE_context* ac, T14* C);
/* POINTER.default_pointer */
extern T14 T14f7(GE_context* ac, T14* C);
/* POINTER.c_free */
extern void T14f14(GE_context* ac, T14* C, T14 a1);
/* XM_CHARACTER_DATA.node_set_parent */
extern void T392f4(GE_context* ac, T0* C, T0* a1);
/* XM_ATTRIBUTE.node_set_parent */
extern void T200f6(GE_context* ac, T0* C, T0* a1);
/* XM_PROCESSING_INSTRUCTION.node_set_parent */
extern void T391f6(GE_context* ac, T0* C, T0* a1);
/* XM_COMMENT.node_set_parent */
extern void T390f5(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.node_set_parent */
extern void T142f21(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_stream */
extern void T266f295(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T266f302(GE_context* ac, T0* C, T0* a1);
/* YY_FILE_BUFFER.name */
extern T0* T362f14(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.name */
extern T0* T297f26(GE_context* ac, T0* C);
/* KL_STRING_INPUT_STREAM.name */
extern unsigned char ge81os5520;
extern T0* ge81ov5520;
extern T0* T441f6(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T266f302p1(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_load_input_buffer */
extern void T266f217(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_content */
extern void T266f220(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].aliased_resized_area */
extern T0* T96f3(GE_context* ac, T0* C, T0* a1, T6 a2);
/* XM_EIFFEL_PE_ENTITY_DEF.special_integer_ */
extern T0* T266f56(GE_context* ac, T0* C);
/* KL_CHARACTER_BUFFER.count */
extern T6 T449f4(GE_context* ac, T0* C);
/* YY_FILE_BUFFER.set_position */
extern void T362f19(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* YY_BUFFER.set_position */
extern void T361f14(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.set_index */
extern void T362f18(GE_context* ac, T0* C, T6 a1);
/* YY_BUFFER.set_index */
extern void T361f13(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.new_file_buffer */
extern T0* T266f73(GE_context* ac, T0* C, T0* a1);
/* YY_FILE_BUFFER.make */
extern T0* T362c17(GE_context* ac, T0* a1);
/* YY_FILE_BUFFER.make_with_size */
extern void T362f21(GE_context* ac, T0* C, T0* a1, T6 a2);
/* YY_FILE_BUFFER.set_file */
extern void T362f23(GE_context* ac, T0* C, T0* a1);
/* YY_FILE_BUFFER.set_file_with_size */
extern void T362f25(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_CHARACTER_BUFFER.resize */
extern void T449f11(GE_context* ac, T0* C, T6 a1);
/* YY_FILE_BUFFER.flush */
extern void T362f26(GE_context* ac, T0* C);
/* KL_CHARACTER_BUFFER.put */
extern void T449f9(GE_context* ac, T0* C, T2 a1, T6 a2);
/* XM_EIFFEL_INPUT_STREAM.end_of_input */
extern T1 T297f18(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.end_of_input */
extern T1 T126f29(GE_context* ac, T0* C);
/* YY_FILE_BUFFER.new_default_buffer */
extern T0* T362f16(GE_context* ac, T0* C, T6 a1);
/* KL_CHARACTER_BUFFER.make */
extern T0* T449c7(GE_context* ac, T6 a1);
/* STRING_8.make_filled */
extern T0* T17c58(GE_context* ac, T2 a1, T6 a2);
/* YY_FILE_BUFFER.default_capacity */
extern unsigned char ge2509os15114;
extern T6 ge2509ov15114;
extern T6 T362f13(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.make_from_stream */
extern T0* T297c28(GE_context* ac, T0* a1);
/* DS_LINKED_QUEUE [CHARACTER_8].make */
extern T0* T400c5(GE_context* ac);
/* XM_EIFFEL_SCANNER_DTD.set_input_stream */
extern void T264f202(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T264f211(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T264f211p1(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_load_input_buffer */
extern void T264f220(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_content */
extern void T264f221(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.special_integer_ */
extern T0* T264f62(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.new_file_buffer */
extern T0* T264f55(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_stream */
extern void T263f291(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T263f298(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T263f298p1(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_load_input_buffer */
extern void T263f214(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_content */
extern void T263f216(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.special_integer_ */
extern T0* T263f70(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.new_file_buffer */
extern T0* T263f71(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_stream */
extern void T223f200(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T223f208(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T223f208p1(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_load_input_buffer */
extern void T223f215(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_set_content */
extern void T223f216(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.special_integer_ */
extern T0* T223f51(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.new_file_buffer */
extern T0* T223f46(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T266f296(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T266f296p1(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_external */
extern T1 T266f68(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T266f296p0(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_action */
extern void T266f306(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.from_hexadecimal */
extern void T360f10(GE_context* ac, T0* C, T0* a1);
/* KL_STRING_ROUTINES.hexadecimal_to_integer */
extern T6 T86f13(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_CHARACTER_ENTITY.string_ */
extern T0* T360f7(GE_context* ac, T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.to_utf8 */
extern T0* T360f3(GE_context* ac, T0* C);
/* UC_UTF8_ROUTINES.append_code_to_utf8 */
extern void T295f37(GE_context* ac, T0* C, T0* a1, T6 a2);
/* UC_UTF8_ROUTINES.integer_ */
extern T0* T295f29(GE_context* ac, T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.utf8 */
extern T0* T360f6(GE_context* ac, T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_ascii */
extern T1 T360f2(GE_context* ac, T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_valid */
extern T1 T360f5(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.valid_non_surrogate_code */
extern T1 T387f2(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.unicode */
extern unsigned char ge126os5337;
extern T0* ge126ov5337;
extern T0* T360f4(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.default_create */
extern T0* T387c29(GE_context* ac);
/* XM_EIFFEL_CHARACTER_ENTITY.from_decimal */
extern void T360f9(GE_context* ac, T0* C, T0* a1);
/* STRING_8.to_integer */
extern T6 T17f9(GE_context* ac, T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
extern T6 T122f13(GE_context* ac, T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
extern void T122f17(GE_context* ac, T0* C, T0* a1, T6 a2);
/* STRING_TO_INTEGER_CONVERTOR.parse_character */
extern void T122f23(GE_context* ac, T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflowed */
extern T1 T122f15(GE_context* ac, T0* C);
/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
extern unsigned char ge2336os1986;
extern T0* ge2336ov1986;
extern T0* T122f14(GE_context* ac, T0* C);
/* CHARACTER_8.is_digit */
extern T1 T2f2(GE_context* ac, T2* C);
/* STRING_TO_INTEGER_CONVERTOR.reset */
extern void T122f18(GE_context* ac, T0* C, T6 a1);
/* STRING_8.ctoi_convertor */
extern unsigned char ge2327os797;
extern T0* ge2327ov797;
extern T0* T17f15(GE_context* ac, T0* C);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
extern void T122f22(GE_context* ac, T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
extern void T122f21(GE_context* ac, T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
extern void T122f20(GE_context* ac, T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
extern void T122f19(GE_context* ac, T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.make */
extern T0* T122c16(GE_context* ac);
/* XM_EIFFEL_PE_ENTITY_DEF.has_normalized_newline */
extern T1 T266f203(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_literal */
extern T1 T266f65(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_substring */
extern T0* T266f183(GE_context* ac, T0* C, T6 a1, T6 a2);
/* KL_CHARACTER_BUFFER.substring */
extern T0* T449f3(GE_context* ac, T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_PE_ENTITY_DEF.text_count */
extern T6 T266f182(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.system_literal_text */
extern T0* T266f164(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_item */
extern T2 T266f209(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern T0* T266f123(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern unsigned char ge1432os14931;
extern T0* ge1432ov14931;
extern T0* T266f123p1(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_line_column */
extern void T266f310(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text */
extern T0* T266f107(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.pop_start_condition */
extern void T266f309(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_start_condition */
extern void T266f294(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition */
extern void T266f307(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_last_token */
extern void T266f308(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_eof_action */
extern void T266f305(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.wrap */
extern T1 T266f101(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_refill_input_buffer */
extern void T266f304(GE_context* ac, T0* C);
/* YY_FILE_BUFFER.fill */
extern void T362f20(GE_context* ac, T0* C);
/* KL_CHARACTER_BUFFER.fill_from_stream */
extern T6 T449f5(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T6 T297f27(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T6 T297f27p1(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STRING_INPUT_STREAM.read_to_string */
extern T6 T441f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STRING_INPUT_STREAM.read_character */
extern void T441f10(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.read_to_string */
extern T6 T126f34(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
extern unsigned char ge66os8473;
extern T0* ge66ov8473;
extern T0* T126f38(GE_context* ac, T0* C);
/* STRING_8.set_internal_hash_code */
extern void T17f60(GE_context* ac, T0* C, T6 a1);
/* KL_TEXT_INPUT_FILE.old_read_to_string */
extern T6 T126f37(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.file_gss */
extern T6 T126f39(GE_context* ac, T0* C, T14 a1, T14 a2, T6 a3);
/* SPECIAL [CHARACTER_8].item_address */
extern T14 T15f8(GE_context* ac, T0* C, T6 a1);
/* KL_TEXT_INPUT_FILE.any_ */
extern T0* T126f35(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.old_end_of_file */
extern T1 T126f31(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.file_feof */
extern T1 T126f33(GE_context* ac, T0* C, T14 a1);
/* XM_EIFFEL_INPUT_STREAM.last_character */
extern T2 T297f19(GE_context* ac, T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].item */
extern T2 T400f4(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.read_character */
extern void T297f31(GE_context* ac, T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].remove */
extern void T400f6(GE_context* ac, T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].wipe_out */
extern void T400f8(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.noqueue_read_character */
extern void T297f33(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf16_read_character */
extern void T297f35(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.append_character */
extern void T297f36(GE_context* ac, T0* C, T6 a1);
/* DS_LINKED_QUEUE [CHARACTER_8].force */
extern void T400f7(GE_context* ac, T0* C, T2 a1);
/* detachable DS_LINKABLE [CHARACTER_8].put_right */
extern void T452f4(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [CHARACTER_8].make */
extern T0* T452c3(GE_context* ac, T2 a1);
/* XM_EIFFEL_INPUT_STREAM.utf8 */
extern T0* T297f22(GE_context* ac, T0* C);
/* KL_STRING_ROUTINES.wipe_out */
extern void T86f16(GE_context* ac, T0* C, T0* a1);
/* STRING_8.keep_head */
extern void T17f57(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_INPUT_STREAM.string_ */
extern T0* T297f17(GE_context* ac, T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf8_buffer */
extern unsigned char ge1423os15321;
extern T0* ge1423ov15321;
extern T0* T297f25(GE_context* ac, T0* C);
/* UC_UTF16_ROUTINES.surrogate */
extern T6 T401f7(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_low_surrogate */
extern T1 T401f6(GE_context* ac, T0* C, T6 a1);
/* UC_UTF16_ROUTINES.least_10_bits */
extern T6 T401f5(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_high_surrogate */
extern T1 T401f4(GE_context* ac, T0* C, T6 a1);
/* UC_UTF16_ROUTINES.is_surrogate */
extern T1 T401f3(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16 */
extern unsigned char ge127os5338;
extern T0* ge127ov5338;
extern T0* T297f20(GE_context* ac, T0* C);
/* UC_UTF16_ROUTINES.default_create */
extern T0* T401c16(GE_context* ac);
/* XM_EIFFEL_INPUT_STREAM.least_significant */
extern T6 T297f24(GE_context* ac, T0* C, T2 a1, T2 a2);
/* XM_EIFFEL_INPUT_STREAM.most_significant */
extern T6 T297f23(GE_context* ac, T0* C, T2 a1, T2 a2);
/* XM_EIFFEL_INPUT_STREAM.latin1_read_character */
extern void T297f34(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.read_character */
extern void T126f51(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.old_read_character */
extern void T126f52(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.file_gc */
extern T2 T126f32(GE_context* ac, T0* C, T14 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16_detect_read_character */
extern void T297f32(GE_context* ac, T0* C);
/* UC_UTF8_ROUTINES.is_endian_detection_character */
extern T1 T295f31(GE_context* ac, T0* C, T2 a1, T2 a2, T2 a3);
/* UC_UTF8_ROUTINES.is_endian_detection_character_start */
extern T1 T295f30(GE_context* ac, T0* C, T2 a1, T2 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_least_first */
extern T1 T401f2(GE_context* ac, T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_most_first */
extern T1 T401f1(GE_context* ac, T0* C, T6 a1, T6 a2);
/* YY_FILE_BUFFER.compact_left */
extern void T362f22(GE_context* ac, T0* C);
/* KL_CHARACTER_BUFFER.move_left */
extern void T449f10(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.subcopy */
extern void T17f59(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* YY_FILE_BUFFER.resize */
extern void T362f24(GE_context* ac, T0* C);
/* YY_BUFFER.fill */
extern void T361f15(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_null_trans_state */
extern T6 T266f100(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_previous_state */
extern T6 T266f99(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.fatal_error */
extern void T266f301(GE_context* ac, T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.item */
extern T2 T449f6(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].force */
extern void T96f6(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_PE_ENTITY_DEF.terminate */
extern void T266f303(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T264f203(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T264f203p1(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_action */
extern void T264f217(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.has_normalized_newline */
extern T1 T264f183(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_substring */
extern T0* T264f163(GE_context* ac, T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_SCANNER_DTD.text_count */
extern T6 T264f162(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.system_literal_text */
extern T0* T264f144(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_item */
extern T2 T264f197(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.normalized_newline */
extern T0* T264f106(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_line_column */
extern void T264f223(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.text */
extern T0* T264f80(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.pop_start_condition */
extern void T264f222(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_start_condition */
extern void T264f208(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition */
extern void T264f218(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_eof_action */
extern void T264f216(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.wrap */
extern T1 T264f68(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_refill_input_buffer */
extern void T264f215(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_null_trans_state */
extern T6 T264f67(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_previous_state */
extern T6 T264f66(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.fatal_error */
extern void T264f214(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.terminate */
extern void T264f213(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_last_token */
extern void T264f212(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T263f292(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.is_external */
extern T1 T263f66(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T263f292p1(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_action */
extern void T263f301(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.has_normalized_newline */
extern T1 T263f200(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.is_literal */
extern T1 T263f63(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_substring */
extern T0* T263f180(GE_context* ac, T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_ENTITY_DEF.text_count */
extern T6 T263f179(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.system_literal_text */
extern T0* T263f161(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_item */
extern T2 T263f207(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T263f120(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T263f120p1(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_line_column */
extern void T263f306(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.text */
extern T0* T263f104(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.pop_start_condition */
extern void T263f305(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.set_start_condition */
extern void T263f290(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition */
extern void T263f302(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.set_last_token */
extern void T263f304(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_eof_action */
extern void T263f300(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.terminate */
extern void T263f303(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.wrap */
extern T1 T263f98(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_refill_input_buffer */
extern void T263f299(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_null_trans_state */
extern T6 T263f97(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_previous_state */
extern T6 T263f96(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.fatal_error */
extern void T263f297(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.read_token */
extern void T223f201(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_execute_action */
extern void T223f212(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.has_normalized_newline */
extern T1 T223f181(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.text_substring */
extern T0* T223f161(GE_context* ac, T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_SCANNER.text_count */
extern T6 T223f160(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.system_literal_text */
extern T0* T223f142(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.text_item */
extern T2 T223f195(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.normalized_newline */
extern T0* T223f101(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_set_line_column */
extern void T223f220(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.text */
extern T0* T223f75(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.pop_start_condition */
extern void T223f219(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.set_start_condition */
extern void T223f221(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.push_start_condition */
extern void T223f213(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.set_last_token */
extern void T223f218(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.yy_execute_eof_action */
extern void T223f211(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.terminate */
extern void T223f217(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.wrap */
extern T1 T223f63(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_refill_input_buffer */
extern void T223f210(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_null_trans_state */
extern T6 T223f62(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.yy_previous_state */
extern T6 T223f61(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.fatal_error */
extern void T223f209(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T266f298(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition_dtd_ignore */
extern void T264f205(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T263f294(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T223f203(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_encoding */
extern void T266f299(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.set_encoding */
extern void T297f30(GE_context* ac, T0* C, T0* a1);
/* KL_STRING_ROUTINES.same_case_insensitive */
extern T1 T86f11(GE_context* ac, T0* C, T0* a1, T0* a2);
/* CHARACTER_8.lower */
extern T2 T2f19(GE_context* ac, T2* C);
/* CHARACTER_8.is_upper */
extern T1 T2f21(GE_context* ac, T2* C);
/* UC_UNICODE_ROUTINES.lower_code */
extern T6 T387f1(GE_context* ac, T0* C, T6 a1);
/* ARRAY [INTEGER_32].item */
extern T6 T294f4(GE_context* ac, T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.lower_codes */
extern unsigned char ge145os19483;
extern T0* ge145ov19483;
extern T0* T387f3(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_plane */
extern unsigned char ge145os19482;
extern T0* ge145ov19482;
extern T0* T387f10(GE_context* ac, T0* C);
/* SPECIAL [ARRAY [INTEGER_32]].make_filled */
extern T0* T450c4(GE_context* ac, T0* a1, T6 a2);
/* SPECIAL [ARRAY [INTEGER_32]].fill_with */
extern void T450f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ARRAY [INTEGER_32]].extend */
extern void T450f8(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [ARRAY [INTEGER_32]].make_empty */
extern void T450f6(GE_context* ac, T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.empty_lower_code_segment */
extern unsigned char ge145os19469;
extern T0* ge145ov19469;
extern T0* T387f17(GE_context* ac, T0* C);
/* KL_INTEGER_ROUTINES.to_integer */
extern T6 T298f3(GE_context* ac, T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.integer_ */
extern T0* T387f28(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_1 */
extern unsigned char ge145os19481;
extern T0* ge145ov19481;
extern T0* T387f9(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_1_segment_4 */
extern unsigned char ge145os19480;
extern T0* ge145ov19480;
extern T0* T387f27(GE_context* ac, T0* C);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].make_filled */
extern T0* T451c4(GE_context* ac, T0* a1, T6 a2);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].fill_with */
extern void T451f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].extend */
extern void T451f8(GE_context* ac, T0* C, T0* a1);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].make_empty */
extern void T451f6(GE_context* ac, T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.lower_code_plane_0 */
extern unsigned char ge145os19479;
extern T0* ge145ov19479;
extern T0* T387f8(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_255 */
extern unsigned char ge145os19478;
extern T0* ge145ov19478;
extern T0* T387f26(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_167 */
extern unsigned char ge145os19477;
extern T0* ge145ov19477;
extern T0* T387f25(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_166 */
extern unsigned char ge145os19476;
extern T0* ge145ov19476;
extern T0* T387f24(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_44 */
extern unsigned char ge145os19475;
extern T0* ge145ov19475;
extern T0* T387f23(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_36 */
extern unsigned char ge145os19474;
extern T0* ge145ov19474;
extern T0* T387f22(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_33 */
extern unsigned char ge145os19473;
extern T0* ge145ov19473;
extern T0* T387f21(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_31 */
extern unsigned char ge145os19472;
extern T0* ge145ov19472;
extern T0* T387f20(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_30 */
extern unsigned char ge145os19471;
extern T0* ge145ov19471;
extern T0* T387f19(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_16 */
extern unsigned char ge145os19470;
extern T0* ge145ov19470;
extern T0* T387f18(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_5 */
extern unsigned char ge145os19468;
extern T0* ge145ov19468;
extern T0* T387f16(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_4 */
extern unsigned char ge145os19467;
extern T0* ge145ov19467;
extern T0* T387f15(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_3 */
extern unsigned char ge145os19466;
extern T0* ge145ov19466;
extern T0* T387f14(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_2 */
extern unsigned char ge145os19465;
extern T0* ge145ov19465;
extern T0* T387f13(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_1 */
extern unsigned char ge145os19464;
extern T0* ge145ov19464;
extern T0* T387f12(GE_context* ac, T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_0 */
extern unsigned char ge145os19463;
extern T0* ge145ov19463;
extern T0* T387f11(GE_context* ac, T0* C);
/* KL_STRING_ROUTINES.unicode */
extern T0* T86f12(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_encoding */
extern void T264f206(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_encoding */
extern void T263f295(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_encoding */
extern void T223f204(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_from_resolver */
extern void T266f300(GE_context* ac, T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.last_stream */
extern T0* T230f2(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_input_from_resolver */
extern void T264f207(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_from_resolver */
extern void T263f296(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T223f205(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.close_input */
extern void T266f297(GE_context* ac, T0* C);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_finish */
extern void T230f6(GE_context* ac, T0* C);
/* KL_STRING_INPUT_STREAM.close */
extern void T441f11(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.close */
extern void T126f43(GE_context* ac, T0* C);
/* KL_STRING_INPUT_STREAM.is_closable */
extern T1 T441f7(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.is_closable */
extern T1 T126f28(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.is_open_read */
extern T1 T126f24(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_read */
extern T1 T126f21(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.close_input */
extern void T264f204(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.close_input */
extern void T263f293(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.close_input */
extern void T223f202(GE_context* ac, T0* C);
/* XM_CALLBACKS_NULL.on_start */
extern void T212f2(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.on_start */
extern void T209f27(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.initialize */
extern void T209f38(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_make */
extern void T209f42(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.new_string_queue */
extern T0* T209f20(GE_context* ac, T0* C);
/* DS_LINKED_QUEUE [STRING_8].make */
extern T0* T355c6(GE_context* ac);
/* XM_NAMESPACE_RESOLVER_CONTEXT.make */
extern T0* T353c10(GE_context* ac);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T431c8(GE_context* ac);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].set_internal_cursor */
extern void T431f11(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].new_cursor */
extern T0* T431f6(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T432c8(GE_context* ac, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start */
extern void T147f14(GE_context* ac, T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.initialize */
extern void T147f12(GE_context* ac, T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_equal */
extern T0* T213c31(GE_context* ac, T6 a1);
/* detachable KL_EQUALITY_TESTER [XM_NAMESPACE].default_create */
extern T0* T356c2(GE_context* ac);
/* DS_HASH_SET [XM_NAMESPACE].make */
extern void T213f32(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].set_internal_cursor */
extern void T213f38(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].new_cursor */
extern T0* T213f24(GE_context* ac, T0* C);
/* DS_HASH_SET_CURSOR [XM_NAMESPACE].make */
extern T0* T357c4(GE_context* ac, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].unset_found_item */
extern void T213f37(GE_context* ac, T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_slots */
extern void T213f36(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_modulus */
extern T6 T213f21(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_clashes */
extern void T213f35(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_key_storage */
extern void T213f34(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_item_storage */
extern void T213f33(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].make */
extern T0* T358f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_NAMESPACE].make_empty */
extern T0* T359c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].default_create */
extern T0* T358c3(GE_context* ac);
/* XM_DOCUMENT.make */
extern T0* T141c10(GE_context* ac);
/* XM_DOCUMENT.make_with_root_named */
extern void T141f11(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_DOCUMENT.force_last */
extern void T141f12(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].force_last */
extern void T285f12(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].force_last */
extern void T285f12p1(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_DOCUMENT_NODE].put_right */
extern void T395f4(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_DOCUMENT_NODE].make */
extern T0* T395c3(GE_context* ac, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].before_addition */
extern void T285f14(GE_context* ac, T0* C, T0* a1);
/* XM_DOCUMENT.before_addition */
extern void T141f13(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.equality_delete */
extern void T142f25(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].forth */
extern void T201f12(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].cursor_forth */
extern void T287f15(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].add_traversing_cursor */
extern void T287f19(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].set_next_cursor */
extern void T201f17(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].remove_traversing_cursor */
extern void T287f20(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].set */
extern void T201f15(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].remove */
extern void T201f13(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].remove_at_cursor */
extern void T287f16(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].move_all_cursors */
extern void T287f24(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].set_current_cell */
extern void T201f18(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_ELEMENT_NODE].put */
extern void T440f6(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_ELEMENT_NODE].put_right */
extern void T440f4(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].set_last_cell */
extern void T287f23(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_ELEMENT_NODE].forget_right */
extern void T440f5(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].remove_last */
extern void T287f22(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].move_last_cursors_after */
extern void T287f27(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].set_after */
extern void T201f16(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].wipe_out */
extern void T287f25(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].move_all_cursors_after */
extern void T287f28(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].is_last */
extern T1 T201f7(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].cursor_is_last */
extern T1 T287f10(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].remove_first */
extern void T287f21(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].set_first_cell */
extern void T287f26(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].is_first */
extern T1 T201f6(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].cursor_is_first */
extern T1 T287f9(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].item */
extern T0* T201f8(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].start */
extern void T201f11(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].cursor_start */
extern void T287f14(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].cursor_off */
extern T1 T287f6(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].off */
extern T1 T201f9(GE_context* ac, T0* C);
/* XM_ELEMENT.new_cursor */
extern T0* T142f8(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].new_cursor */
extern T0* T287f5(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].make */
extern T0* T201c10(GE_context* ac, T0* a1);
/* XM_DOCUMENT.equality_delete */
extern void T141f14(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].forth */
extern void T389f13(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_forth */
extern void T285f17(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].add_traversing_cursor */
extern void T285f18(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].set_next_cursor */
extern void T389f16(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].remove_traversing_cursor */
extern void T285f23(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].set */
extern void T389f15(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].remove */
extern void T389f12(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].remove_at_cursor */
extern void T285f16(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].move_all_cursors */
extern void T285f22(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].set_current_cell */
extern void T389f17(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_DOCUMENT_NODE].put */
extern void T395f6(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].set_last_cell */
extern void T285f21(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_DOCUMENT_NODE].forget_right */
extern void T395f5(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].remove_last */
extern void T285f20(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].move_last_cursors_after */
extern void T285f26(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].set_after */
extern void T389f18(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].wipe_out */
extern void T285f24(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].move_all_cursors_after */
extern void T285f27(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].is_last */
extern T1 T389f7(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_is_last */
extern T1 T285f10(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].remove_first */
extern void T285f19(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].set_first_cell */
extern void T285f25(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].is_first */
extern T1 T389f6(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_is_first */
extern T1 T285f9(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].item */
extern T0* T389f8(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].start */
extern void T389f11(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_start */
extern void T285f15(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_off */
extern T1 T285f8(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].off */
extern T1 T389f9(GE_context* ac, T0* C);
/* XM_DOCUMENT.new_cursor */
extern T0* T141f7(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].new_cursor */
extern T0* T285f5(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].make */
extern T0* T389c10(GE_context* ac, T0* a1);
/* XM_DOCUMENT.last */
extern T0* T141f6(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].last */
extern T0* T285f7(GE_context* ac, T0* C);
/* XM_DOCUMENT.is_empty */
extern T1 T141f5(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].is_empty */
extern T1 T285f6(GE_context* ac, T0* C);
/* XM_ELEMENT.make */
extern T0* T142c20(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].make */
extern T0* T287c11(GE_context* ac);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].set_internal_cursor */
extern void T287f12(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].make */
extern T0* T285c11(GE_context* ac);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].set_internal_cursor */
extern void T285f13(GE_context* ac, T0* C, T0* a1);
/* XM_DOCUMENT.default_ns */
extern unsigned char ge1383os9387;
extern T0* ge1383ov9387;
extern T0* T141f3(GE_context* ac, T0* C);
/* XM_NAMESPACE.make_default */
extern T0* T284c7(GE_context* ac);
/* XM_NAMESPACE.make */
extern void T284f8(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE.make */
extern T0* T284c8(GE_context* ac, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T146f9(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T146f9p1(GE_context* ac, T0* C);
/* XM_CALLBACKS_NULL.on_comment */
extern void T212f4(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_comment */
extern void T209f29(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_comment */
extern void T147f16(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.handle_position */
extern void T147f24(GE_context* ac, T0* C, T0* a1);
/* XM_POSITION_TABLE.put */
extern void T143f5(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].put_last */
extern void T292f9(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].put_right */
extern void T442f4(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T442c3(GE_context* ac, T0* a1);
/* DS_PAIR [XM_POSITION, XM_NODE].make */
extern T0* T293c3(GE_context* ac, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.position */
extern T0* T152f128(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [XM_POSITION].first */
extern T0* T226f6(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.positions */
extern T0* T152f93(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.new_positions */
extern T0* T152f122(GE_context* ac, T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].remove */
extern void T227f7(GE_context* ac, T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].item */
extern T0* T227f4(GE_context* ac, T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].is_empty */
extern T1 T227f3(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [XM_POSITION].force_last */
extern void T226f8(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [XM_POSITION].put_right */
extern void T366f5(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [XM_POSITION].attach_left */
extern void T366f6(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [XM_POSITION].make */
extern T0* T366c4(GE_context* ac, T0* a1);
/* DS_BILINKED_LIST [XM_POSITION].make */
extern T0* T226c7(GE_context* ac);
/* DS_BILINKED_LIST [XM_POSITION].set_internal_cursor */
extern void T226f9(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_POSITION].new_cursor */
extern T0* T226f5(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_POSITION].make */
extern T0* T367c3(GE_context* ac, T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].copy */
extern void T227f6(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_EIFFEL_SCANNER].put_right */
extern void T368f4(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_EIFFEL_SCANNER].make */
extern T0* T368c3(GE_context* ac, T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].make */
extern T0* T227c5(GE_context* ac);
/* XM_EIFFEL_PARSER.is_correct */
extern T1 T152f120(GE_context* ac, T0* C);
/* XM_COMMENT.make_last_in_document */
extern T0* T390c4(GE_context* ac, T0* a1, T0* a2);
/* XM_COMMENT.make_last */
extern T0* T390c3(GE_context* ac, T0* a1, T0* a2);
/* XM_ELEMENT.force_last */
extern void T142f24(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].force_last */
extern void T287f13(GE_context* ac, T0* C, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].force_last */
extern void T287f13p1(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [XM_ELEMENT_NODE].make */
extern T0* T440c3(GE_context* ac, T0* a1);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].before_addition */
extern void T287f18(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.before_addition */
extern void T142f26(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.last */
extern T0* T142f19(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].last */
extern T0* T287f8(GE_context* ac, T0* C);
/* XM_ELEMENT.is_empty */
extern T1 T142f18(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].is_empty */
extern T1 T287f7(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T146f11(GE_context* ac, T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T146f11p1(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_processing_instruction */
extern void T212f5(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_processing_instruction */
extern void T209f30(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_TO_TREE_FILTER.on_processing_instruction */
extern void T147f17(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_PROCESSING_INSTRUCTION.make_last_in_document */
extern T0* T391c5(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* XM_PROCESSING_INSTRUCTION.make_last */
extern T0* T391c4(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T146f12(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T146f12p1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_NULL.on_content */
extern void T212f6(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_content */
extern void T209f31(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_content */
extern void T147f18(GE_context* ac, T0* C, T0* a1);
/* XM_CHARACTER_DATA.make_last */
extern T0* T392c3(GE_context* ac, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T146f13(GE_context* ac, T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T146f13p1(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_start_tag */
extern void T212f9(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER.on_start_tag */
extern void T209f34(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.push */
extern void T353f12(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].force_last */
extern void T431f10(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].put_right */
extern void T470f5(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].attach_left */
extern void T470f6(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T470c4(GE_context* ac, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.new_string_string_table */
extern T0* T353f8(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_equality_tester */
extern void T31f59(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.string_equality_tester */
extern T0* T353f9(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map_default */
extern T0* T31c58(GE_context* ac);
/* DS_HASH_TABLE [STRING_8, STRING_8].default_capacity */
extern T6 T31f35(GE_context* ac, T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag */
extern void T147f19(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_root */
extern T0* T142c23(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* XM_DOCUMENT.set_root_element */
extern void T141f15(GE_context* ac, T0* C, T0* a1);
/* XM_DOCUMENT.remove_previous_root_element */
extern void T141f16(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].go_after */
extern void T389f14(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_go_after */
extern void T285f28(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.make_last */
extern T0* T142c22(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.new_namespace */
extern T0* T147f8(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_NAMESPACE].force_last */
extern void T213f39(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_put */
extern void T213f44(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].clashes_put */
extern void T213f43(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].slots_item */
extern T6 T213f22(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].hash_position */
extern T6 T213f20(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE.hash_code */
extern T6 T284f6(GE_context* ac, T0* C);
/* DS_HASH_SET [XM_NAMESPACE].resize */
extern void T213f42(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_resize */
extern void T213f48(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].special_integer_ */
extern T0* T213f29(GE_context* ac, T0* C);
/* DS_HASH_SET [XM_NAMESPACE].key_storage_resize */
extern void T213f47(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_resize */
extern void T213f46(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].aliased_resized_area */
extern T0* T358f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_NAMESPACE].aliased_resized_area */
extern T0* T359f4(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].key_storage_item */
extern T0* T213f28(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_item */
extern T0* T213f18(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_item */
extern T6 T213f26(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_resize */
extern void T213f45(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_capacity */
extern T6 T213f19(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_put */
extern void T213f41(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].force */
extern void T358f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_NAMESPACE].fill_with */
extern void T359f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_NAMESPACE].extend */
extern void T359f8(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].search_position */
extern void T213f40(GE_context* ac, T0* C, T0* a1);
/* detachable KL_EQUALITY_TESTER [XM_NAMESPACE].test */
extern T1 T356f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE.is_equal */
extern T1 T284f4(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE.string_ */
extern T0* T284f3(GE_context* ac, T0* C);
/* DS_HASH_SET [XM_NAMESPACE].key_equality_tester */
extern T0* T213f25(GE_context* ac, T0* C);
/* XM_NAMESPACE.same_prefix */
extern T1 T284f5(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].item */
extern T0* T213f17(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].has */
extern T1 T213f30(GE_context* ac, T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T146f14(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T146f14p1(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_NULL.on_end_tag */
extern void T212f8(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T209f33(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.pop */
extern void T353f11(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_last */
extern void T431f9(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].set_last_cell */
extern void T431f14(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].forget_right */
extern void T470f7(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_last_cursors_after */
extern void T431f13(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_next_cursor */
extern void T432f13(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_after */
extern void T432f12(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].wipe_out */
extern void T431f12(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_all_cursors_after */
extern void T431f15(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve_default */
extern T0* T353f3(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_pseudo_prefix */
extern unsigned char ge1356os14903;
extern T0* ge1356ov14903;
extern T0* T353f7(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T209f33p1(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve */
extern T0* T353f2(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].back */
extern void T432f11(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_back */
extern void T431f18(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].add_traversing_cursor */
extern void T431f19(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_traversing_cursor */
extern void T431f20(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set */
extern void T432f14(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].go_before */
extern void T432f10(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_go_before */
extern void T431f17(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_before */
extern void T432f15(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_off */
extern T1 T431f7(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].off */
extern T1 T432f7(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].item */
extern T0* T31f33(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_item */
extern T0* T31f34(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].has */
extern T1 T31f32(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].item */
extern T0* T432f6(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].finish */
extern void T432f9(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_finish */
extern void T431f16(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_namespace */
extern unsigned char ge1356os14904;
extern T0* ge1356ov14904;
extern T0* T353f6(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.has_prefix */
extern T1 T209f10(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_end_tag */
extern void T147f21(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.parent_element */
extern T0* T142f16(GE_context* ac, T0* C);
extern T1 T142f16ot1(T0* a1, T0** a2);
/* XM_ELEMENT.is_root_node */
extern T1 T142f17(GE_context* ac, T0* C);
/* XM_DOCUMENT.is_root_node */
extern T1 T141f8(GE_context* ac, T0* C);
/* XM_DOCUMENT.parent */
extern T0* T141f9(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T146f16(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T146f16p1(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_NULL.on_attribute */
extern void T212f10(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER.on_attribute */
extern void T209f35(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add */
extern void T353f14(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force_new */
extern void T31f60(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].last */
extern T0* T431f5(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.shallow_has */
extern T1 T353f4(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.attributes_force */
extern void T209f40(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* DS_LINKED_QUEUE [STRING_8].force */
extern void T355f7(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add_default */
extern void T353f13(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.is_xmlns */
extern T1 T209f9(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.same_string */
extern T1 T209f22(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.string_equality_tester */
extern T0* T209f25(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns */
extern unsigned char ge1323os4428;
extern T0* ge1323ov4428;
extern T0* T209f21(GE_context* ac, T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_attribute */
extern void T147f23(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_ATTRIBUTE.make_last */
extern T0* T200c5(GE_context* ac, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T146f18(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T146f18p1(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_CALLBACKS_NULL.on_finish */
extern void T212f3(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.on_finish */
extern void T209f28(GE_context* ac, T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_finish */
extern void T147f15(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T146f10(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T146f10p1(GE_context* ac, T0* C);
/* XM_CALLBACKS_NULL.on_start_tag_finish */
extern void T212f7(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T209f32(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T209f32p1(GE_context* ac, T0* C);
/* KL_STRING_ROUTINES.appended_string */
extern T0* T86f4(GE_context* ac, T0* C, T0* a1, T0* a2);
/* STRING_8.append_string */
extern void T17f39(GE_context* ac, T0* C, T0* a1);
/* KL_STRING_ROUTINES.concat */
extern T0* T86f9(GE_context* ac, T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.prefixed_string */
extern T0* T296f16(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.plus */
extern T0* T296f15(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.append_string */
extern void T296f58(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.append */
extern void T296f72(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.dummy_uc_string */
extern unsigned char ge132os5972;
extern T0* ge132ov5972;
extern T0* T296f47(GE_context* ac, T0* C);
/* UC_UTF8_STRING.gobo_append_substring */
extern void T296f60(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.append */
extern void T296f72p1(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.additional_space */
extern T6 T296f48(GE_context* ac, T0* C);
/* ISE_RUNTIME.check_assert */
extern T1 T399s1(GE_context* ac, T1 a1);
/* XM_NAMESPACE_RESOLVER.string_ */
extern T0* T209f14(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.on_delayed_attributes */
extern void T209f39(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_remove */
extern void T209f43(GE_context* ac, T0* C);
/* DS_LINKED_QUEUE [STRING_8].remove */
extern void T355f8(GE_context* ac, T0* C);
/* DS_LINKED_QUEUE [STRING_8].wipe_out */
extern void T355f9(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.unprefixed_attribute_namespace */
extern T0* T209f19(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.default_namespace */
extern unsigned char ge1323os4427;
extern T0* ge1323ov4427;
extern T0* T209f24(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns_namespace */
extern unsigned char ge1323os4435;
extern T0* ge1323ov4435;
extern T0* T209f18(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.xml_prefix_namespace */
extern unsigned char ge1323os4434;
extern T0* ge1323ov4434;
extern T0* T209f17(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.is_xml */
extern T1 T209f16(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.xml_prefix */
extern unsigned char ge1323os4429;
extern T0* ge1323ov4429;
extern T0* T209f23(GE_context* ac, T0* C);
/* DS_LINKED_QUEUE [STRING_8].item */
extern T0* T355f5(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_is_empty */
extern T1 T209f12(GE_context* ac, T0* C);
/* DS_LINKED_QUEUE [STRING_8].is_empty */
extern T1 T355f4(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.has */
extern T1 T353f5(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag_finish */
extern void T147f20(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T146f15(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T146f15p1(GE_context* ac, T0* C);
/* XM_CALLBACKS_NULL.on_error */
extern void T212f11(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_error */
extern void T209f36(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_error */
extern void T147f22(GE_context* ac, T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T146f17(GE_context* ac, T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T146f17p1(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_xml_declaration */
extern void T212f12(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* XM_NAMESPACE_RESOLVER.on_xml_declaration */
extern void T209f44(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_xml_declaration */
extern void T147f25(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* XM_STOP_ON_ERROR_FILTER.on_xml_declaration */
extern void T146f19(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* XM_NAMESPACE_RESOLVER.set_next */
extern void T209f41(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.set_next */
extern void T147f13(GE_context* ac, T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.set_next */
extern void T146f8(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.set_shallow */
extern void T52f24(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_ACE_GENERATOR.set_shallow */
extern void T51f18(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_XACE_GENERATOR.set_shallow */
extern void T50f18(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_ECF_GENERATOR.generate_system */
extern void T52f25(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.print_ecf_system_file */
extern void T52f27(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.print_override_clusters */
extern void T52f41(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].forth */
extern void T187f10(GE_context* ac, T0* C);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].cursor_forth */
extern void T186f10(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].add_traversing_cursor */
extern void T186f11(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].set_next_cursor */
extern void T187f12(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].remove_traversing_cursor */
extern void T186f12(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].set */
extern void T187f11(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* ET_XACE_ECF_GENERATOR.print_override_cluster */
extern void T52f45(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* Creation of agent #1 in feature ET_XACE_ECF_GENERATOR.print_override_cluster */
extern T0* T52f45ac1(T0* a1, T6 a2, T0* a3);
/* Creation of agent #2 in feature ET_XACE_ECF_GENERATOR.print_override_cluster */
extern T0* T52f45ac2(T0* a1, T6 a2, T0* a3);
/* ET_XACE_ECF_GENERATOR.print_class_visible */
extern void T52f49(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* Creation of agent #1 in feature ET_XACE_ECF_GENERATOR.print_class_visible */
extern T0* T52f49ac1(T0* a1, T0* a2, T6 a3, T0* a4);
/* ET_XACE_ECF_GENERATOR.print_feature_visible */
extern void T52f50(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T0* a4);
/* detachable DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].do_all */
extern void T176f11(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.string_ */
extern T0* T52f10(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.export_option */
extern T0* T164f332(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_export_option */
extern unsigned char ge1226os5009;
extern T0* ge1226ov5009;
extern T0* T164f265(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_export_option_declared */
extern T1 T164f330(GE_context* ac, T0* C);
/* ET_XACE_ECF_GENERATOR.print_class_options */
extern void T52f48(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* DS_HASH_SET [STRING_8].has */
extern T1 T167f26(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].search_position */
extern void T167f39(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].hash_position */
extern T6 T167f17(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].key_storage_item */
extern T0* T167f22(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_item */
extern T0* T167f29(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].clashes_item */
extern T6 T167f32(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].key_equality_tester */
extern T0* T167f20(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].slots_item */
extern T6 T167f27(GE_context* ac, T0* C, T6 a1);
/* ET_XACE_OPTIONS.is_assertion_declared */
extern T1 T164f246(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].is_empty */
extern T1 T167f25(GE_context* ac, T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].forth */
extern void T165f11(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].cursor_forth */
extern void T167f62(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].add_traversing_cursor */
extern void T167f64(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_next_cursor */
extern void T165f14(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_position */
extern void T165f12(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].remove_traversing_cursor */
extern void T167f63(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_after */
extern void T165f13(GE_context* ac, T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].item */
extern T0* T165f4(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].cursor_item */
extern T0* T167f31(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].after */
extern T1 T165f6(GE_context* ac, T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].start */
extern void T165f10(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].cursor_start */
extern void T167f61(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].cursor_off */
extern T1 T167f33(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].off */
extern T1 T165f8(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].new_cursor */
extern T0* T167f23(GE_context* ac, T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].make */
extern T0* T165c9(GE_context* ac, T0* a1);
/* ET_XACE_OPTIONS.debug_tag */
extern T0* T164f300(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_debug_tag */
extern unsigned char ge1226os5000;
extern T0* ge1226ov5000;
extern T0* T164f251(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].set_equality_tester */
extern void T167f35(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.string_equality_tester */
extern T0* T164f207(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].make */
extern T0* T167c34(GE_context* ac, T6 a1);
/* DS_HASH_SET [STRING_8].set_internal_cursor */
extern void T167f45(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].unset_found_item */
extern void T167f44(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].make_slots */
extern void T167f43(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].new_modulus */
extern T6 T167f19(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_clashes */
extern void T167f42(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_key_storage */
extern void T167f41(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_item_storage */
extern void T167f40(GE_context* ac, T0* C, T6 a1);
/* ET_XACE_OPTIONS.is_debug_tag_declared */
extern T1 T164f298(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.syntax */
extern T0* T164f178(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_syntax */
extern unsigned char ge1226os5064;
extern T0* ge1226ov5064;
extern T0* T164f368(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.options */
extern unsigned char ge1214os4153;
extern T0* ge1214ov4153;
extern T0* T164f208(GE_context* ac, T0* C);
/* ET_XACE_OPTION_NAMES.default_create */
extern T0* T180c228(GE_context* ac);
/* ET_XACE_OPTIONS.is_syntax_declared */
extern T1 T164f177(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.full_class_checking */
extern T1 T164f176(GE_context* ac, T0* C);
/* UT_TRISTATE.is_true */
extern T1 T301f2(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_full_class_checking_declared */
extern T1 T164f175(GE_context* ac, T0* C);
/* UT_TRISTATE.is_undefined */
extern T1 T301f4(GE_context* ac, T0* C);
/* UT_TRISTATE.is_false */
extern T1 T301f3(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_namespace_declared */
extern T1 T164f128(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.warning */
extern T0* T164f171(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_warning */
extern unsigned char ge1226os5076;
extern T0* ge1226ov5076;
extern T0* T164f362(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.debug_option */
extern T1 T164f296(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.profile */
extern T1 T164f139(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.trace */
extern T1 T164f159(GE_context* ac, T0* C);
/* detachable DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].do_all */
extern void T173f10(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.print_file_rules */
extern void T52f47(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.exclude */
extern T0* T164f328(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_exclude */
extern unsigned char ge1226os5008;
extern T0* ge1226ov5008;
extern T0* T164f263(GE_context* ac, T0* C);
/* ET_XACE_ECF_GENERATOR.print_escaped_string */
extern void T52f42(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.print_escaped_character */
extern void T52f46(GE_context* ac, T0* C, T6 a1, T0* a2);
/* KL_TEXT_OUTPUT_FILE.put_integer */
extern void T128f39(GE_context* ac, T0* C, T6 a1);
/* KL_TEXT_OUTPUT_FILE.put_integer_64 */
extern void T128f42(GE_context* ac, T0* C, T7 a1);
/* INTEGER_32.to_integer_64 */
extern T7 T6f26(GE_context* ac, T6* C);
/* ET_XACE_ECF_GENERATOR.quot_entity */
extern unsigned char ge1323os4422;
extern T0* ge1323ov4422;
extern T0* T52f9(GE_context* ac, T0* C);
/* ET_XACE_ECF_GENERATOR.amp_entity */
extern unsigned char ge1323os4421;
extern T0* ge1323ov4421;
extern T0* T52f21(GE_context* ac, T0* C);
/* ET_XACE_ECF_GENERATOR.gt_entity */
extern unsigned char ge1323os4420;
extern T0* ge1323ov4420;
extern T0* T52f19(GE_context* ac, T0* C);
/* ET_XACE_ECF_GENERATOR.lt_entity */
extern unsigned char ge1323os4419;
extern T0* ge1323ov4419;
extern T0* T52f17(GE_context* ac, T0* C);
/* ET_XACE_ECF_GENERATOR.is_escaped */
extern T1 T52f15(GE_context* ac, T0* C, T6 a1);
/* ET_XACE_OPTIONS.include */
extern T0* T164f377(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_include */
extern unsigned char ge1226os5023;
extern T0* ge1226ov5023;
extern T0* T164f287(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_exclude_declared */
extern T1 T164f326(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_include_declared */
extern T1 T164f375(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_prefix_option_declared */
extern T1 T164f136(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.put_character */
extern void T128f38(GE_context* ac, T0* C, T2 a1);
/* KL_TEXT_OUTPUT_FILE.old_put_character */
extern void T128f41(GE_context* ac, T0* C, T2 a1);
/* KL_TEXT_OUTPUT_FILE.file_pc */
extern void T128f44(GE_context* ac, T0* C, T14 a1, T2 a2);
/* ET_XACE_CLUSTER.full_pathname */
extern T0* T170f22(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.pathname */
extern T0* T184f8(GE_context* ac, T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.append_character */
extern void T296f59(GE_context* ac, T0* C, T2 a1);
/* KL_UNIX_FILE_SYSTEM.string_ */
extern T0* T184f9(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.pathname */
extern T0* T436f5(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_separator */
extern T1 T436f3(GE_context* ac, T0* C, T2 a1);
/* KL_WINDOWS_FILE_SYSTEM.string_ */
extern T0* T436f2(GE_context* ac, T0* C);
/* ET_XACE_CLUSTER.file_system */
extern unsigned char ge74os2769;
extern T0* ge74ov2769;
extern T0* T170f26(GE_context* ac, T0* C);
/* ET_XACE_CLUSTER.unix_file_system */
extern unsigned char ge74os2772;
extern T0* ge74ov2772;
extern T0* T170f29(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.make */
extern T0* T184c10(GE_context* ac);
/* KL_OPERATING_SYSTEM.is_unix */
extern unsigned char ge108os2912;
extern T1 ge108ov2912;
extern T1 T281f5(GE_context* ac, T0* C);
/* KL_OPERATING_SYSTEM.current_working_directory */
extern T0* T281f3(GE_context* ac, T0* C);
/* EXECUTION_ENVIRONMENT.current_working_directory */
extern T0* T311f2(GE_context* ac, T0* C);
/* FILE_INFO.pointer_to_file_name_8 */
extern T0* T157f13(GE_context* ac, T0* C, T14 a1);
/* C_STRING.string */
extern T0* T111f5(GE_context* ac, T0* C);
/* C_STRING.c_strlen */
extern T6 T111f6(GE_context* ac, T0* C, T14 a1);
/* C_STRING.make_shared_from_pointer */
extern T0* T111c13(GE_context* ac, T14 a1);
/* C_STRING.substring */
extern T0* T111f4(GE_context* ac, T0* C, T6 a1, T6 a2);
/* C_STRING.read_substring_into */
extern void T111f14(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* NATURAL_8.to_natural_32 */
extern T10 T8f19(GE_context* ac, T8* C);
/* FILE_INFO.utf_16_to_multi_byte */
extern T6 T157f14(GE_context* ac, T0* C, T14 a1, T14 a2, T6 a3);
/* EXECUTION_ENVIRONMENT.file_info */
extern unsigned char ge2466os12187;
extern T0* ge2466ov12187;
extern T0* T311f5(GE_context* ac, T0* C);
/* EXECUTION_ENVIRONMENT.eif_dir_current */
extern T6 T311f4(GE_context* ac, T0* C, T14 a1, T6 a2);
/* KL_OPERATING_SYSTEM.execution_environment */
extern unsigned char ge108os2916;
extern T0* ge108ov2916;
extern T0* T281f4(GE_context* ac, T0* C);
/* EXECUTION_ENVIRONMENT.default_create */
extern T0* T311c7(GE_context* ac);
/* KL_OPERATING_SYSTEM.variable_value */
extern T0* T281f2(GE_context* ac, T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.get */
extern T0* T311f1(GE_context* ac, T0* C, T0* a1);
/* STRING_32.as_string_8 */
extern T0* T18f9(GE_context* ac, T0* C);
/* STRING_32.code */
extern T10 T18f10(GE_context* ac, T0* C, T6 a1);
/* EXECUTION_ENVIRONMENT.item */
extern T0* T311f3(GE_context* ac, T0* C, T0* a1);
/* NATIVE_STRING.make_from_pointer */
extern T0* T118c13(GE_context* ac, T14 a1);
/* MANAGED_POINTER.make_from_pointer */
extern T0* T112c17(GE_context* ac, T14 a1, T6 a2);
/* POINTER.memory_alloc */
extern T14 T14f9(GE_context* ac, T14* C, T6 a1);
/* POINTER.c_malloc */
extern T14 T14f10(GE_context* ac, T14* C, T6 a1);
/* EXECUTION_ENVIRONMENT.eif_getenv */
extern T14 T311f6(GE_context* ac, T0* C, T14 a1);
/* NATIVE_STRING.item */
extern T14 T118f7(GE_context* ac, T0* C);
/* NATIVE_STRING.make */
extern T0* T118c12(GE_context* ac, T0* a1);
/* NATIVE_STRING.set_string */
extern void T118f14(GE_context* ac, T0* C, T0* a1);
/* NATIVE_STRING.set_substring */
extern void T118f15(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* NATIVE_STRING.upper_cell */
extern unsigned char ge2323os6077;
extern T0* ge2323ov6077;
extern T0* T118f8(GE_context* ac, T0* C);
/* ET_XACE_CLUSTER.windows_file_system */
extern unsigned char ge74os2770;
extern T0* ge74ov2770;
extern T0* T170f28(GE_context* ac, T0* C);
/* KL_WINDOWS_FILE_SYSTEM.make */
extern T0* T436c6(GE_context* ac);
/* KL_OPERATING_SYSTEM.is_windows */
extern unsigned char ge108os2911;
extern T1 ge108ov2911;
extern T1 T281f1(GE_context* ac, T0* C);
/* ET_XACE_CLUSTER.operating_system */
extern unsigned char ge116os2773;
extern T0* ge116ov2773;
extern T0* T170f27(GE_context* ac, T0* C);
/* KL_OPERATING_SYSTEM.default_create */
extern T0* T281c6(GE_context* ac);
/* ET_XACE_CLUSTER.prefixed_name */
extern T0* T170f31(GE_context* ac, T0* C);
/* ET_XACE_CLUSTER.string_ */
extern T0* T170f25(GE_context* ac, T0* C);
/* ET_XACE_CLUSTER.is_fully_abstract */
extern T1 T170f30(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].item */
extern T0* T169f9(GE_context* ac, T0* C, T6 a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].item */
extern T0* T187f6(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].start */
extern void T187f9(GE_context* ac, T0* C);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].cursor_start */
extern void T186f9(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].cursor_off */
extern T1 T186f5(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].off */
extern T1 T187f7(GE_context* ac, T0* C);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].new_cursor */
extern T0* T186f6(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].make */
extern T0* T187c8(GE_context* ac, T0* a1);
/* ET_XACE_CLUSTERS.merge_override_clusters */
extern void T162f10(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_CLUSTER.merge_override_clusters */
extern void T170f47(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].force_last */
extern void T186f13(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [ET_XACE_CLUSTER].put_right */
extern void T312f4(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [ET_XACE_CLUSTER].make */
extern T0* T312c3(GE_context* ac, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].make */
extern T0* T186c7(GE_context* ac);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].set_internal_cursor */
extern void T186f8(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.print_clusters */
extern void T52f40(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_ECF_GENERATOR.print_cluster */
extern void T52f44(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* Creation of agent #1 in feature ET_XACE_ECF_GENERATOR.print_cluster */
extern T0* T52f44ac1(T0* a1, T6 a2, T0* a3);
/* Creation of agent #2 in feature ET_XACE_ECF_GENERATOR.print_cluster */
extern T0* T52f44ac2(T0* a1, T6 a2, T0* a3);
/* ET_XACE_CLUSTER.is_fully_ecf_abstract */
extern T1 T170f24(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_ecf_library_declared */
extern T1 T164f388(GE_context* ac, T0* C);
/* ET_XACE_ECF_GENERATOR.print_assemblies */
extern void T52f39(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].forth */
extern void T182f10(GE_context* ac, T0* C);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].cursor_forth */
extern void T181f11(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].add_traversing_cursor */
extern void T181f12(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].set_next_cursor */
extern void T182f12(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].remove_traversing_cursor */
extern void T181f13(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].set */
extern void T182f11(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* UC_UTF8_STRING.old_is_empty */
extern T1 T296f19(GE_context* ac, T0* C);
/* STRING_8.is_empty */
extern T1 T17f30(GE_context* ac, T0* C);
/* ET_XACE_ECF_GENERATOR.print_escaped_name */
extern void T52f43(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].item */
extern T0* T182f6(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].start */
extern void T182f9(GE_context* ac, T0* C);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].cursor_start */
extern void T181f10(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].cursor_off */
extern T1 T181f5(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].off */
extern T1 T182f7(GE_context* ac, T0* C);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].new_cursor */
extern T0* T181f7(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].make */
extern T0* T182c8(GE_context* ac, T0* a1);
/* ET_XACE_CLUSTERS.merge_assemblies */
extern void T162f8(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_CLUSTER.merge_assemblies */
extern void T170f45(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].force_last */
extern void T181f14(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [ET_XACE_ASSEMBLY].put_right */
extern void T310f4(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [ET_XACE_ASSEMBLY].make */
extern T0* T310c3(GE_context* ac, T0* a1);
/* ET_XACE_ASSEMBLY.set_assembly_pathname */
extern void T183f9(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_ASSEMBLY.make */
extern T0* T183c8(GE_context* ac, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5, T0* a6);
/* ET_XACE_OPTIONS.prefix_option */
extern T0* T164f137(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_prefix_option */
extern unsigned char ge1226os5052;
extern T0* ge1226ov5052;
extern T0* T164f329(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.public_key_token */
extern T0* T164f141(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_public_key_token */
extern unsigned char ge1226os5054;
extern T0* ge1226ov5054;
extern T0* T164f333(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.culture */
extern T0* T164f284(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_culture */
extern unsigned char ge1226os4996;
extern T0* ge1226ov4996;
extern T0* T164f243(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.version */
extern T0* T164f167(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_version */
extern unsigned char ge1226os5073;
extern T0* ge1226ov5073;
extern T0* T164f358(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.assembly */
extern T0* T164f244(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_assembly */
extern unsigned char ge1226os4983;
extern T0* ge1226ov4983;
extern T0* T164f224(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_assembly_declared */
extern T1 T164f242(GE_context* ac, T0* C);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].make */
extern T0* T181c8(GE_context* ac);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].set_internal_cursor */
extern void T181f9(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.print_ecf_clusters */
extern void T52f38(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_CLUSTERS.merge_ecf_clusters */
extern void T162f9(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_CLUSTER.merge_ecf_clusters */
extern void T170f46(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.print_mounted_libraries */
extern void T52f37(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* KL_UNIX_FILE_SYSTEM.dirname */
extern T0* T184f3(GE_context* ac, T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.root_directory */
extern unsigned char ge83os12101;
extern T0* ge83ov12101;
extern T0* T184f6(GE_context* ac, T0* C);
/* KL_UNIX_FILE_SYSTEM.is_root_directory */
extern T1 T184f5(GE_context* ac, T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.basename */
extern T0* T184f2(GE_context* ac, T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.interpreted_string */
extern T0* T185f2(GE_context* ac, T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.variable_value */
extern T0* T185f1(GE_context* ac, T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.environment_impl */
extern unsigned char ge101os2910;
extern T0* ge101ov2910;
extern T0* T185f3(GE_context* ac, T0* C);
/* KL_STRING_ROUTINES.append_substring_to_string */
extern void T86f15(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* KL_STRING_ROUTINES.appended_substring */
extern T0* T86f3(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* KL_EXECUTION_ENVIRONMENT.string_ */
extern T0* T185f4(GE_context* ac, T0* C);
/* ET_XACE_ECF_GENERATOR.execution_environment */
extern unsigned char ge114os2768;
extern T0* ge114ov2768;
extern T0* T52f14(GE_context* ac, T0* C);
/* KL_EXECUTION_ENVIRONMENT.default_create */
extern T0* T185c5(GE_context* ac);
/* UC_UTF8_STRING.remove_tail */
extern void T296f68(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.keep_head */
extern void T296f84(GE_context* ac, T0* C, T6 a1);
/* STRING_8.remove_tail */
extern void T17f55(GE_context* ac, T0* C, T6 a1);
/* KL_UNIX_FILE_SYSTEM.extension */
extern T0* T184f1(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.unix_file_system */
extern T0* T52f13(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].item */
extern T0* T171f10(GE_context* ac, T0* C, T6 a1);
/* ET_XACE_ECF_GENERATOR.print_external_libraries */
extern void T52f36(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_ECF_GENERATOR.replace_all_characters */
extern T0* T52f12(GE_context* ac, T0* C, T0* a1, T2 a2, T2 a3);
/* UC_UTF8_STRING.put */
extern void T296f67(GE_context* ac, T0* C, T2 a1, T6 a2);
/* ET_XACE_ECF_GENERATOR.is_windows */
extern T1 T52f11(GE_context* ac, T0* C);
/* ET_XACE_ECF_GENERATOR.operating_system */
extern T0* T52f22(GE_context* ac, T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].value */
extern T0* T31f31(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_EXTERNALS.has_link_libraries */
extern T1 T179f5(GE_context* ac, T0* C);
/* DS_LINKED_LIST [STRING_8].is_empty */
extern T1 T40f7(GE_context* ac, T0* C);
/* ET_XACE_ECF_GENERATOR.print_external_c_compiler_options */
extern void T52f35(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_EXTERNALS.has_c_compiler_options */
extern T1 T179f4(GE_context* ac, T0* C);
/* ET_XACE_ECF_GENERATOR.print_external_includes */
extern void T52f34(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_EXTERNALS.has_include_directories */
extern T1 T179f6(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG.merge_externals */
extern void T125f8(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_MOUNTED_LIBRARIES.merge_externals */
extern void T163f8(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_CLUSTERS.merge_externals */
extern void T162f11(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_CLUSTER.merge_externals */
extern void T170f48(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].forth */
extern void T166f11(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_forth */
extern void T168f18(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].set_position */
extern void T166f13(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].add_traversing_cursor */
extern void T168f19(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T166f14(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].remove_traversing_cursor */
extern void T168f20(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_EXTERNALS.put_link_library */
extern void T179f10(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].force_last */
extern void T40f16(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].item */
extern T0* T166f5(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_item */
extern T0* T168f11(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].after */
extern T1 T166f7(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].start */
extern void T166f10(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_start */
extern void T168f17(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].set_after */
extern void T166f12(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [STRING_8].is_empty */
extern T1 T168f10(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].off */
extern T1 T166f6(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].before */
extern T1 T166f8(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [STRING_8].new_cursor */
extern T0* T168f7(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].make */
extern T0* T166c9(GE_context* ac, T0* a1);
/* ET_XACE_OPTIONS.link */
extern T0* T164f107(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_link */
extern unsigned char ge1226os5031;
extern T0* ge1226ov5031;
extern T0* T164f303(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [STRING_8].set_equality_tester */
extern void T168f13(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].make */
extern T0* T168c12(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].set_internal_cursor */
extern void T168f15(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.is_link_declared */
extern T1 T164f106(GE_context* ac, T0* C);
/* ET_XACE_EXTERNALS.put_include_directory */
extern void T179f9(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.header */
extern T0* T164f361(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_header */
extern unsigned char ge1226os5020;
extern T0* ge1226ov5020;
extern T0* T164f279(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_header_declared */
extern T1 T164f359(GE_context* ac, T0* C);
/* ET_XACE_EXTERNALS.put_c_compiler_options */
extern void T179f8(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.c_compiler_options */
extern T0* T164f288(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_c_compiler_options */
extern unsigned char ge1226os4997;
extern T0* ge1226ov4997;
extern T0* T164f245(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_c_compiler_options_declared */
extern T1 T164f286(GE_context* ac, T0* C);
/* ET_XACE_EXTERNALS.make */
extern T0* T179c7(GE_context* ac);
/* ET_XACE_ECF_GENERATOR.print_settings */
extern void T52f33(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.use_full_cluster_name_as_namespace */
extern T1 T164f163(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_use_full_cluster_name_as_namespace_declared */
extern T1 T164f162(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.use_cluster_name_as_namespace */
extern T1 T164f161(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_use_cluster_name_as_namespace_declared */
extern T1 T164f160(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_shared_library_definition_declared */
extern T1 T164f144(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.old_verbatim_strings */
extern T1 T164f205(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_old_verbatim_strings_declared */
extern T1 T164f204(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.multithreaded */
extern T1 T164f127(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_multithreaded_declared */
extern T1 T164f126(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.msil_use_optimized_precompile */
extern T1 T164f203(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_msil_use_optimized_precompile_declared */
extern T1 T164f202(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_msil_key_file_name_declared */
extern T1 T164f200(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.target */
extern T0* T164f157(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_target */
extern unsigned char ge1226os5065;
extern T0* ge1226ov5065;
extern T0* T164f348(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_target_declared */
extern T1 T164f156(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.msil_generation */
extern T1 T164f123(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_msil_generation_declared */
extern T1 T164f122(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_msil_culture_declared */
extern T1 T164f198(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_msil_clr_version_declared */
extern T1 T164f120(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.msil_classes_per_module */
extern T6 T164f196(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_msil_classes_per_module_declared */
extern T1 T164f195(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_msil_assembly_compatibility_declared */
extern T1 T164f118(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_metadata_cache_path_declared */
extern T1 T164f116(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.line_generation */
extern T1 T164f105(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_line_generation_declared */
extern T1 T164f104(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.inlining_size */
extern T6 T164f385(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_inlining_size_declared */
extern T1 T164f383(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.inlining */
extern T0* T164f381(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_inlining */
extern unsigned char ge1226os5024;
extern T0* ge1226ov5024;
extern T0* T164f289(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].put_new */
extern void T167f37(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].item_storage_put */
extern void T167f46(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [STRING_8].slots_put */
extern void T167f49(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING_8].clashes_put */
extern void T167f48(GE_context* ac, T0* C, T6 a1, T6 a2);
/* ET_XACE_OPTIONS.is_inlining_declared */
extern T1 T164f379(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.il_verifiable */
extern T1 T164f373(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_il_verifiable_declared */
extern T1 T164f371(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.force_32bits */
extern T1 T164f192(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_force_32bits_declared */
extern T1 T164f191(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_external_runtime_declared */
extern T1 T164f189(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.exception_trace */
extern T1 T164f324(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_exception_trace_declared */
extern T1 T164f322(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.enforce_unique_class_names */
extern T1 T164f188(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_enforce_unique_class_names_declared */
extern T1 T164f187(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.dynamic_runtime */
extern T1 T164f319(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_dynamic_runtime_declared */
extern T1 T164f317(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.dotnet_naming_convention */
extern T1 T164f315(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_dotnet_naming_convention_declared */
extern T1 T164f310(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.dead_code_removal */
extern T0* T164f292(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_dead_code_removal */
extern unsigned char ge1226os4998;
extern T0* ge1226ov4998;
extern T0* T164f247(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_dead_code_removal_declared */
extern T1 T164f290(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.console_application */
extern T1 T164f276(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_console_application_declared */
extern T1 T164f274(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.cls_compliant */
extern T1 T164f268(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_cls_compliant_declared */
extern T1 T164f266(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.check_vape */
extern T1 T164f260(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_check_vape_declared */
extern T1 T164f258(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.check_generic_creation_constraint */
extern T1 T164f186(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_check_generic_creation_constraint_declared */
extern T1 T164f185(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.automatic_backup */
extern T1 T164f184(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_automatic_backup_declared */
extern T1 T164f183(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.array_optimization */
extern T1 T164f240(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_array_optimization_declared */
extern T1 T164f238(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.address_expression */
extern T1 T164f232(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_address_expression_declared */
extern T1 T164f230(GE_context* ac, T0* C);
/* ET_XACE_ECF_GENERATOR.print_options */
extern void T52f32(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.void_safety */
extern T0* T164f181(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_void_safety */
extern unsigned char ge1226os5075;
extern T0* ge1226ov5075;
extern T0* T164f372(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.attached_by_default */
extern T1 T164f180(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_attached_by_default_declared */
extern T1 T164f179(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.set_debug_option */
extern void T164f409(GE_context* ac, T0* C, T1 a1);
/* UT_TRISTATE.set_false */
extern void T301f7(GE_context* ac, T0* C);
/* UT_TRISTATE.set_true */
extern void T301f6(GE_context* ac, T0* C);
/* UT_TRISTATE.make_undefined */
extern T0* T301c5(GE_context* ac);
/* UT_TRISTATE.set_undefined */
extern void T301f8(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_debug_option_declared */
extern T1 T164f294(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.set_profile */
extern void T164f463(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.is_profile_declared */
extern T1 T164f138(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.set_trace */
extern void T164f475(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.is_trace_declared */
extern T1 T164f158(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.set_warning */
extern void T164f482(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.options */
extern T0* T52f7(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_warning_declared */
extern T1 T164f170(GE_context* ac, T0* C);
/* ET_XACE_ECF_GENERATOR.print_indentation */
extern void T52f31(GE_context* ac, T0* C, T6 a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.print_quote_escaped_string */
extern void T52f30(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.print_ecf_namespaces */
extern void T52f29(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.put_string */
extern void T128f37(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_put_string */
extern void T128f40(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_ps */
extern void T128f43(GE_context* ac, T0* C, T14 a1, T14 a2, T6 a3);
/* KL_TEXT_OUTPUT_FILE.string_ */
extern T0* T128f9(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.put_line */
extern void T128f35(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.put_new_line */
extern void T128f36(GE_context* ac, T0* C);
/* ET_XACE_ACE_GENERATOR.generate_system */
extern void T51f19(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_GENERATOR.print_ace_file */
extern void T51f21(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_GENERATOR.print_link_libraries */
extern void T51f29(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [STRING_8].is_last */
extern T1 T38f8(GE_context* ac, T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_is_last */
extern T1 T40f8(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_ACE_GENERATOR.replace_all_characters */
extern T0* T51f11(GE_context* ac, T0* C, T0* a1, T2 a2, T2 a3);
/* ET_XACE_ACE_GENERATOR.string_ */
extern T0* T51f9(GE_context* ac, T0* C);
/* ET_XACE_ACE_GENERATOR.is_windows */
extern T1 T51f10(GE_context* ac, T0* C);
/* ET_XACE_ACE_GENERATOR.operating_system */
extern T0* T51f16(GE_context* ac, T0* C);
/* ET_XACE_ACE_GENERATOR.execution_environment */
extern T0* T51f15(GE_context* ac, T0* C);
/* ET_XACE_ACE_GENERATOR.print_c_compiler_options_and_include_directories */
extern void T51f28(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_ACE_GENERATOR.print_assemblies */
extern void T51f27(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].is_empty */
extern T1 T181f6(GE_context* ac, T0* C);
/* ET_XACE_ACE_GENERATOR.print_clusters */
extern void T51f26(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_GENERATOR.print_cluster */
extern void T51f30(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_GENERATOR.print_class_options */
extern T1 T51f13(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].forth */
extern void T177f10(GE_context* ac, T0* C);
/* detachable DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].cursor_forth */
extern void T176f13(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].add_traversing_cursor */
extern void T176f14(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].set_next_cursor */
extern void T177f12(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].remove_traversing_cursor */
extern void T176f15(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].set */
extern void T177f11(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].item */
extern T0* T177f6(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].start */
extern void T177f9(GE_context* ac, T0* C);
/* detachable DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].cursor_start */
extern void T176f12(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].cursor_off */
extern T1 T176f7(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].off */
extern T1 T177f7(GE_context* ac, T0* C);
/* detachable DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].new_cursor */
extern T0* T176f5(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].make */
extern T0* T177c8(GE_context* ac, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].forth */
extern void T174f10(GE_context* ac, T0* C);
/* detachable DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].cursor_forth */
extern void T173f12(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].add_traversing_cursor */
extern void T173f13(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].set_next_cursor */
extern void T174f12(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].remove_traversing_cursor */
extern void T173f14(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].set */
extern void T174f11(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* ET_XACE_ACE_GENERATOR.options */
extern T0* T51f8(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.assertion */
extern T0* T164f248(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_assertion */
extern unsigned char ge1226os4984;
extern T0* ge1226ov4984;
extern T0* T164f225(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].item */
extern T0* T174f6(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].start */
extern void T174f9(GE_context* ac, T0* C);
/* detachable DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].cursor_start */
extern void T173f11(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].cursor_off */
extern T1 T173f6(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].off */
extern T1 T174f7(GE_context* ac, T0* C);
/* detachable DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].new_cursor */
extern T0* T173f5(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].make */
extern T0* T174c8(GE_context* ac, T0* a1);
/* ET_XACE_ACE_GENERATOR.print_cluster_options */
extern T1 T51f12(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.namespace */
extern T0* T164f129(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_namespace */
extern unsigned char ge1226os5046;
extern T0* ge1226ov5046;
extern T0* T164f321(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.document */
extern T0* T164f308(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_document */
extern unsigned char ge1226os5002;
extern T0* ge1226ov5002;
extern T0* T164f255(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_document_declared */
extern T1 T164f306(GE_context* ac, T0* C);
/* ET_XACE_ACE_GENERATOR.print_options */
extern void T51f25(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.shared_library_definition */
extern T0* T164f145(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_shared_library_definition */
extern unsigned char ge1226os5058;
extern T0* ge1226ov5058;
extern T0* T164f336(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.precompiled */
extern T0* T164f135(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_precompiled */
extern unsigned char ge1226os5051;
extern T0* ge1226ov5051;
extern T0* T164f327(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_precompiled_declared */
extern T1 T164f134(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.override_cluster */
extern T0* T164f215(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_override_cluster */
extern unsigned char ge1226os5049;
extern T0* ge1226ov5049;
extern T0* T164f210(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_override_cluster_declared */
extern T1 T164f213(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.msil_generation_version */
extern T0* T164f125(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_msil_generation_version */
extern unsigned char ge1226os5042;
extern T0* ge1226ov5042;
extern T0* T164f318(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_msil_generation_version_declared */
extern T1 T164f124(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.msil_clr_version */
extern T0* T164f121(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_msil_clr_version */
extern unsigned char ge1226os5039;
extern T0* ge1226ov5039;
extern T0* T164f314(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.msil_assembly_compatibility */
extern T0* T164f119(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_msil_assembly_compatibility */
extern unsigned char ge1226os5037;
extern T0* ge1226ov5037;
extern T0* T164f313(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.metadata_cache_path */
extern T0* T164f117(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_metadata_cache_path */
extern unsigned char ge1226os5036;
extern T0* ge1226ov5036;
extern T0* T164f312(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.arguments */
extern T0* T164f236(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_arguments */
extern unsigned char ge1226os4981;
extern T0* ge1226ov4981;
extern T0* T164f220(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_arguments_declared */
extern T1 T164f234(GE_context* ac, T0* C);
/* ET_XACE_ACE_GENERATOR.print_escaped_name */
extern void T51f24(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_GENERATOR.is_lace_keyword */
extern T1 T51f7(GE_context* ac, T0* C, T0* a1);
/* ARRAY [STRING_8].item */
extern T0* T105f5(GE_context* ac, T0* C, T6 a1);
/* ET_XACE_ACE_GENERATOR.lace_keywords */
extern unsigned char ge1250os5154;
extern T0* ge1250ov5154;
extern T0* T51f14(GE_context* ac, T0* C);
/* UC_UTF8_STRING.has */
extern T1 T296f49(GE_context* ac, T0* C, T2 a1);
/* UC_UTF8_STRING.index_of */
extern T6 T296f52(GE_context* ac, T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.index_of_item_code */
extern T6 T296f53(GE_context* ac, T0* C, T6 a1, T6 a2);
/* ET_XACE_ACE_GENERATOR.print_indentation */
extern void T51f23(GE_context* ac, T0* C, T6 a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.generate_system */
extern void T50f19(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.print_xace_system_file */
extern void T50f21(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.print_mounted_libraries */
extern void T50f28(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XACE_GENERATOR.print_clusters */
extern void T50f27(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XACE_GENERATOR.print_cluster */
extern void T50f30(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XACE_GENERATOR.print_class_options */
extern void T50f32(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XACE_GENERATOR.print_feature_options */
extern void T50f33(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XACE_GENERATOR.string_ */
extern T0* T50f10(GE_context* ac, T0* C);
/* ET_XACE_XACE_GENERATOR.print_console_application_option */
extern void T50f26(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XACE_GENERATOR.print_options */
extern void T50f25(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.wedit */
extern T1 T164f173(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_wedit_declared */
extern T1 T164f172(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.visible_filename */
extern T0* T164f169(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_visible_filename */
extern unsigned char ge1226os5074;
extern T0* ge1226ov5074;
extern T0* T164f360(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_visible_filename_declared */
extern T1 T164f168(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_version_declared */
extern T1 T164f166(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.verbose */
extern T1 T164f165(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_verbose_declared */
extern T1 T164f164(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.strip_option */
extern T1 T164f155(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_strip_option_declared */
extern T1 T164f154(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.storable_filename */
extern T0* T164f153(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_storable_filename */
extern unsigned char ge1226os5062;
extern T0* ge1226ov5062;
extern T0* T164f344(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_storable_filename_declared */
extern T1 T164f152(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.storable */
extern T1 T164f151(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_storable_declared */
extern T1 T164f150(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.stack_size */
extern T6 T164f149(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_stack_size_declared */
extern T1 T164f148(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.split */
extern T1 T164f147(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_split_declared */
extern T1 T164f146(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.reloads_optimization */
extern T1 T164f143(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_reloads_optimization_declared */
extern T1 T164f142(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.recursive */
extern T1 T164f223(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_recursive_declared */
extern T1 T164f221(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.read_only */
extern T1 T164f228(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_read_only_declared */
extern T1 T164f226(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_public_key_token_declared */
extern T1 T164f140(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.portable_code_generation */
extern T1 T164f133(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_portable_code_generation_declared */
extern T1 T164f132(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.no_default_lib */
extern T1 T164f131(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_no_default_lib_declared */
extern T1 T164f130(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.map */
extern T1 T164f115(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_map_declared */
extern T1 T164f114(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.manifest_string_trace */
extern T1 T164f113(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_manifest_string_trace_declared */
extern T1 T164f112(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.linux_fpu_double_precision */
extern T1 T164f111(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_linux_fpu_double_precision_declared */
extern T1 T164f110(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.linker */
extern T0* T164f109(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_linker */
extern unsigned char ge1226os5032;
extern T0* ge1226ov5032;
extern T0* T164f305(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_linker_declared */
extern T1 T164f108(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.leaves_optimization */
extern T1 T164f103(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_leaves_optimization_declared */
extern T1 T164f102(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.layout_optimization */
extern T1 T164f101(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_layout_optimization_declared */
extern T1 T164f100(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.layout */
extern T0* T164f99(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_layout */
extern unsigned char ge1226os5027;
extern T0* ge1226ov5027;
extern T0* T164f295(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_layout_declared */
extern T1 T164f98(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.jumps_optimization */
extern T1 T164f97(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_jumps_optimization_declared */
extern T1 T164f387(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.high_memory_compiler */
extern T1 T164f369(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_high_memory_compiler_declared */
extern T1 T164f367(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.heap_size */
extern T6 T164f365(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_heap_size_declared */
extern T1 T164f363(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.gc_info */
extern T1 T164f357(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_gc_info_declared */
extern T1 T164f355(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.garbage_collector */
extern T0* T164f353(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_garbage_collector */
extern unsigned char ge1226os5017;
extern T0* ge1226ov5017;
extern T0* T164f275(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_garbage_collector_declared */
extern T1 T164f351(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.fst_optimization */
extern T1 T164f349(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_fst_optimization_declared */
extern T1 T164f347(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.fst_expansion_factor */
extern T6 T164f345(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_fst_expansion_factor_declared */
extern T1 T164f343(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.flat_fst_optimization */
extern T1 T164f341(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_flat_fst_optimization_declared */
extern T1 T164f339(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.finalize_option */
extern T1 T164f337(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_finalize_option_declared */
extern T1 T164f334(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.debugger */
extern T1 T164f304(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_debugger_declared */
extern T1 T164f302(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_culture_declared */
extern T1 T164f282(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.create_keyword_extension */
extern T1 T164f280(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_create_keyword_extension_declared */
extern T1 T164f278(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.component */
extern T0* T164f272(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_component */
extern unsigned char ge1226os4993;
extern T0* ge1226ov4993;
extern T0* T164f237(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_component_declared */
extern T1 T164f270(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.clean */
extern T1 T164f264(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_clean_declared */
extern T1 T164f262(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.case_insensitive */
extern T1 T164f256(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_case_insensitive_declared */
extern T1 T164f254(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.callback */
extern T0* T164f252(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.default_callback */
extern unsigned char ge1226os4987;
extern T0* ge1226ov4987;
extern T0* T164f227(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_callback_declared */
extern T1 T164f250(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.abstract */
extern T1 T164f219(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.is_abstract_declared */
extern T1 T164f217(GE_context* ac, T0* C);
/* ET_XACE_XACE_GENERATOR.print_indentation */
extern void T50f24(GE_context* ac, T0* C, T6 a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.print_quote_escaped_string */
extern void T50f23(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.quot_entity */
extern T0* T50f8(GE_context* ac, T0* C);
/* ET_XACE_XACE_GENERATOR.print_escaped_string */
extern void T50f29(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.print_escaped_character */
extern void T50f31(GE_context* ac, T0* C, T6 a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.amp_entity */
extern T0* T50f16(GE_context* ac, T0* C);
/* ET_XACE_XACE_GENERATOR.gt_entity */
extern T0* T50f14(GE_context* ac, T0* C);
/* ET_XACE_XACE_GENERATOR.lt_entity */
extern T0* T50f12(GE_context* ac, T0* C);
/* ET_XACE_XACE_GENERATOR.is_escaped */
extern T1 T50f9(GE_context* ac, T0* C, T6 a1);
/* ET_XACE_ECF_GENERATOR.generate_library */
extern void T52f26(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.print_ecf_library_file */
extern void T52f28(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_CONFIG.merge_externals */
extern void T130f8(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_ACE_GENERATOR.generate_library */
extern void T51f20(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_GENERATOR.print_precompile_ace_file */
extern void T51f22(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.generate_library */
extern void T50f20(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.print_xace_library_file */
extern void T50f22(GE_context* ac, T0* C, T0* a1, T0* a2);
/* GEXACE_VALIDATE_COMMAND.execute */
extern void T48f9(GE_context* ac, T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_cannot_read_file_error */
extern void T35f16(GE_context* ac, T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.make */
extern T0* T136c8(GE_context* ac, T0* a1);
/* ET_XACE_PARSER.parse_file */
extern void T131f257(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.last_error_extended_description */
extern T0* T152f92(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.string_ */
extern T0* T152f89(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.last_error_description */
extern T0* T152f87(GE_context* ac, T0* C);
/* INTEGER_32.out */
extern T0* T6f28(GE_context* ac, T6* C);
/* STRING_8.append_integer */
extern void T17f54(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.safe_error_component */
extern T0* T152f140(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_safe_error_character */
extern T1 T152f97(GE_context* ac, T0* C, T2 a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_parser_error */
extern void T35f18(GE_context* ac, T0* C, T0* a1);
/* UT_MESSAGE.make */
extern T0* T160c8(GE_context* ac, T0* a1);
/* XM_TREE_CALLBACKS_PIPE.last_error */
extern T0* T145f8(GE_context* ac, T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_not_xace_file_error */
extern void T35f19(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_NOT_XACE_FILE_ERROR.make */
extern T0* T161c8(GE_context* ac, T0* a1);
/* ET_XACE_PARSER.new_library */
extern T0* T131f12(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_CONFIG.mount_libraries */
extern void T130f14(GE_context* ac, T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.mount_libraries */
extern void T163f9(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_CLUSTERS.mount_libraries */
extern void T162f16(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTERS.put_last */
extern void T162f6(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].force_last */
extern void T169f12(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER].force */
extern void T303f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [ET_XACE_CLUSTER].fill_with */
extern void T302f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ET_XACE_CLUSTER].extend */
extern void T302f8(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].resize */
extern void T169f14(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER].aliased_resized_area */
extern T0* T303f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_XACE_CLUSTER].aliased_resized_area */
extern T0* T302f4(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].new_capacity */
extern T6 T169f8(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].extendible */
extern T1 T169f7(GE_context* ac, T0* C, T6 a1);
/* ET_XACE_CLUSTER.set_library_prefix */
extern void T170f49(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_CLUSTERS.set_library_prefix */
extern void T162f13(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_mounted */
extern void T170f51(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_CLUSTERS.set_mounted */
extern void T162f17(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_CLUSTERS.make_empty */
extern T0* T162c12(GE_context* ac);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].make */
extern T0* T169c10(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].set_internal_cursor */
extern void T169f13(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].new_cursor */
extern T0* T169f6(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_XACE_CLUSTER].make */
extern T0* T304c3(GE_context* ac, T0* a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER].make */
extern T0* T303f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [ET_XACE_CLUSTER].make_empty */
extern T0* T302c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER].default_create */
extern T0* T303c3(GE_context* ac);
/* ET_XACE_PARSER.fill_library */
extern void T131f260(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
extern T1 T131f260ot1(T0* a1, T0** a2);
/* ET_XACE_LIBRARY_CONFIG.set_libraries */
extern void T130f13(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_LIBRARY_CONFIG.set_clusters */
extern void T130f12(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_LIBRARY_CONFIG.merge_libraries */
extern void T130f15(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_MOUNTED_LIBRARIES.merge_libraries */
extern void T163f10(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_MOUNTED_LIBRARY.set_root */
extern void T172f12(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_MOUNTED_LIBRARY.cloned_object */
extern T0* T172f8(GE_context* ac, T0* C);
/* ET_XACE_MOUNTED_LIBRARY.twin */
extern T0* T172f9(GE_context* ac, T0* C);
/* ET_XACE_MOUNTED_LIBRARY.copy */
extern void T172f13(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_MOUNTED_LIBRARIES.set_root */
extern void T163f7(GE_context* ac, T0* C, T1 a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].is_empty */
extern T1 T171f6(GE_context* ac, T0* C);
/* ET_XACE_CLUSTERS.merge_libraries */
extern void T162f7(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTER.merge_libraries */
extern void T170f44(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTER.set_override */
extern void T170f43(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_CLUSTERS.cluster_by_name */
extern T0* T162f2(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_CLUSTERS.string_ */
extern T0* T162f3(GE_context* ac, T0* C);
/* ET_XACE_PARSER.fill_externals */
extern void T131f263(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
extern T1 T131f263ot1(T0* a1, T0** a2);
/* ET_XACE_CLUSTER.put_class_option */
extern void T170f35(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].put_last */
extern void T173f8(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [ET_XACE_CLASS_OPTIONS].put_right */
extern void T308f4(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [ET_XACE_CLASS_OPTIONS].make */
extern T0* T308c3(GE_context* ac, T0* a1);
/* detachable DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].make */
extern T0* T173c7(GE_context* ac);
/* detachable DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].set_internal_cursor */
extern void T173f9(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_PARSER.new_export */
extern T0* T131f146(GE_context* ac, T0* C, T0* a1, T0* a2);
extern T1 T131f146ot1(T0* a1, T0** a2);
/* ET_XACE_OPTIONS.set_export_option */
extern void T164f419(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].is_empty */
extern T1 T176f6(GE_context* ac, T0* C);
/* ET_XACE_CLASS_OPTIONS.put_feature_option */
extern void T175f5(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].put_last */
extern void T176f9(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [ET_XACE_FEATURE_OPTIONS].put_right */
extern void T309f4(GE_context* ac, T0* C, T0* a1);
/* detachable DS_LINKABLE [ET_XACE_FEATURE_OPTIONS].make */
extern T0* T309c3(GE_context* ac, T0* a1);
/* detachable DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].make */
extern T0* T176c8(GE_context* ac);
/* detachable DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].set_internal_cursor */
extern void T176f10(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_PARSER.new_exported_feature */
extern T0* T131f253(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_AST_FACTORY.new_feature_options */
extern T0* T140f9(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_FEATURE_OPTIONS.make */
extern T0* T178c3(GE_context* ac, T0* a1, T0* a2);
/* ET_XACE_PARSER.uc_alias */
extern unsigned char ge1255os3877;
extern T0* ge1255ov3877;
extern T0* T131f255(GE_context* ac, T0* C);
/* ET_XACE_PARSER.uc_feature */
extern unsigned char ge1255os3878;
extern T0* ge1255ov3878;
extern T0* T131f252(GE_context* ac, T0* C);
/* ET_XACE_AST_FACTORY.new_class_options */
extern T0* T140f8(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_CLASS_OPTIONS.make */
extern T0* T175c4(GE_context* ac, T0* a1, T0* a2);
/* ET_XACE_PARSER.uc_class */
extern unsigned char ge1255os3853;
extern T0* ge1255ov3853;
extern T0* T131f27(GE_context* ac, T0* C);
/* ET_XACE_PARSER.uc_export */
extern unsigned char ge1255os3876;
extern T0* ge1255ov3876;
extern T0* T131f145(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.set_header */
extern void T164f430(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].force_last */
extern void T167f38(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].resize */
extern void T167f50(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].clashes_resize */
extern void T167f60(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].special_integer_ */
extern T0* T167f30(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].key_storage_resize */
extern void T167f59(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_resize */
extern void T167f58(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].slots_resize */
extern void T167f57(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].new_capacity */
extern T6 T167f18(GE_context* ac, T0* C, T6 a1);
/* ET_XACE_PARSER.uc_include_dir */
extern unsigned char ge1255os3875;
extern T0* ge1255ov3875;
extern T0* T131f144(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.set_link */
extern void T164f441(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].force_last */
extern void T168f14(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].resize */
extern void T168f16(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].new_capacity */
extern T6 T168f9(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].extendible */
extern T1 T168f8(GE_context* ac, T0* C, T6 a1);
/* ET_XACE_PARSER.uc_location */
extern unsigned char ge1255os3862;
extern T0* ge1255ov3862;
extern T0* T131f143(GE_context* ac, T0* C);
/* ET_XACE_PARSER.uc_link_library */
extern unsigned char ge1255os3879;
extern T0* ge1255ov3879;
extern T0* T131f142(GE_context* ac, T0* C);
/* ET_XACE_AST_FACTORY.new_options */
extern T0* T140f4(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.make */
extern T0* T164c389(GE_context* ac);
/* ET_XACE_PARSER.uc_external */
extern unsigned char ge1255os3866;
extern T0* ge1255ov3866;
extern T0* T131f25(GE_context* ac, T0* C);
/* ET_XACE_PARSER.new_options */
extern T0* T131f24(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_PARSER.fill_options */
extern void T131f262(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
extern T1 T131f262ot1(T0* a1, T0** a2);
/* ET_XACE_PARSER.uc_debug */
extern unsigned char ge1255os3873;
extern T0* ge1255ov3873;
extern T0* T131f141(GE_context* ac, T0* C);
/* ET_XACE_PARSER.uc_optimize */
extern unsigned char ge1255os3874;
extern T0* ge1255ov3874;
extern T0* T131f140(GE_context* ac, T0* C);
/* ET_XACE_PARSER.uc_check */
extern unsigned char ge1255os3872;
extern T0* ge1255ov3872;
extern T0* T131f138(GE_context* ac, T0* C);
/* ET_XACE_PARSER.uc_loop */
extern unsigned char ge1255os3871;
extern T0* ge1255ov3871;
extern T0* T131f135(GE_context* ac, T0* C);
/* ET_XACE_PARSER.uc_invariant */
extern unsigned char ge1255os3870;
extern T0* ge1255ov3870;
extern T0* T131f133(GE_context* ac, T0* C);
/* ET_XACE_PARSER.uc_ensure */
extern unsigned char ge1255os3869;
extern T0* ge1255ov3869;
extern T0* T131f131(GE_context* ac, T0* C);
/* ET_XACE_PARSER.uc_enable */
extern unsigned char ge1255os3867;
extern T0* ge1255ov3867;
extern T0* T131f129(GE_context* ac, T0* C);
/* ET_XACE_PARSER.uc_require */
extern unsigned char ge1255os3868;
extern T0* ge1255ov3868;
extern T0* T131f128(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.set_wedit */
extern void T164f483(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.valid_warning */
extern unsigned char ge1226os4882;
extern T0* ge1226ov4882;
extern T0* T164f211(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].put_last */
extern void T167f36(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].compress */
extern void T167f47(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].slots_wipe_out */
extern void T167f56(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].clashes_wipe_out */
extern void T167f55(GE_context* ac, T0* C);
/* DS_HASH_SET [STRING_8].key_storage_keep_head */
extern void T167f54(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_keep_head */
extern void T167f53(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [STRING_8].keep_head */
extern void T94f10(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [STRING_8].set_count */
extern void T94f11(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].move_all_cursors */
extern void T167f52(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING_8].key_storage_put */
extern void T167f51(GE_context* ac, T0* C, T0* a1, T6 a2);
/* ET_XACE_OPTIONS.set_void_safety */
extern void T164f481(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_void_safety */
extern unsigned char ge1226os4881;
extern T0* ge1226ov4881;
extern T0* T164f209(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.set_visible_filename */
extern void T164f480(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_version */
extern void T164f479(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_verbose */
extern void T164f478(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_use_full_cluster_name_as_namespace */
extern void T164f477(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_use_cluster_name_as_namespace */
extern void T164f476(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_target */
extern void T164f474(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_target */
extern unsigned char ge1226os4879;
extern T0* ge1226ov4879;
extern T0* T164f206(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.set_syntax */
extern void T164f473(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_syntax */
extern unsigned char ge1226os4878;
extern T0* ge1226ov4878;
extern T0* T164f201(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.set_strip_option */
extern void T164f472(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_storable_filename */
extern void T164f471(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_stack_size */
extern void T164f470(GE_context* ac, T0* C, T6 a1);
/* ET_XACE_OPTIONS.set_split */
extern void T164f469(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_shared_library_definition */
extern void T164f468(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_reloads_optimization */
extern void T164f467(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_recursive */
extern void T164f466(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_read_only */
extern void T164f465(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_public_key_token */
extern void T164f464(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_prefix_option */
extern void T164f462(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_precompiled */
extern void T164f461(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_portable_code_generation */
extern void T164f460(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_override_cluster */
extern void T164f459(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_old_verbatim_strings */
extern void T164f458(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_no_default_lib */
extern void T164f457(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_namespace */
extern void T164f456(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_multithreaded */
extern void T164f455(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_msil_use_optimized_precompile */
extern void T164f454(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_msil_key_file_name */
extern void T164f453(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_msil_generation_version */
extern void T164f452(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_msil_generation */
extern void T164f451(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_msil_culture */
extern void T164f450(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_msil_clr_version */
extern void T164f449(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_msil_classes_per_module */
extern void T164f448(GE_context* ac, T0* C, T6 a1);
/* ET_XACE_OPTIONS.set_msil_assembly_compatibility */
extern void T164f447(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_metadata_cache_path */
extern void T164f446(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_map */
extern void T164f445(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_manifest_string_trace */
extern void T164f444(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_linux_fpu_double_precision */
extern void T164f443(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_linker */
extern void T164f442(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_linker */
extern unsigned char ge1226os4877;
extern T0* ge1226ov4877;
extern T0* T164f199(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.set_line_generation */
extern void T164f440(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_leaves_optimization */
extern void T164f439(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_layout_optimization */
extern void T164f438(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_layout */
extern void T164f437(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_layout */
extern unsigned char ge1226os4876;
extern T0* ge1226ov4876;
extern T0* T164f197(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.set_jumps_optimization */
extern void T164f436(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_inlining_size */
extern void T164f435(GE_context* ac, T0* C, T6 a1);
/* ET_XACE_OPTIONS.set_inlining */
extern void T164f434(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_inlining */
extern unsigned char ge1226os4875;
extern T0* ge1226ov4875;
extern T0* T164f194(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.set_include */
extern void T164f433(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_il_verifiable */
extern void T164f432(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_high_memory_compiler */
extern void T164f431(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_heap_size */
extern void T164f429(GE_context* ac, T0* C, T6 a1);
/* ET_XACE_OPTIONS.set_gc_info */
extern void T164f428(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_garbage_collector */
extern void T164f427(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_garbage_collector */
extern unsigned char ge1226os4874;
extern T0* ge1226ov4874;
extern T0* T164f193(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.set_full_class_checking */
extern void T164f426(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_fst_optimization */
extern void T164f425(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_positive_integer_expected_error */
extern void T35f24(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.make */
extern T0* T272c8(GE_context* ac, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_DEFAULT_POSITION.out */
extern T0* T224f5(GE_context* ac, T0* C);
/* XM_DEFAULT_POSITION.string_ */
extern T0* T224f6(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.set_fst_expansion_factor */
extern void T164f424(GE_context* ac, T0* C, T6 a1);
/* UC_UTF8_STRING.to_integer */
extern T6 T296f35(GE_context* ac, T0* C);
/* UC_UTF8_STRING.ctoi_convertor */
extern T0* T296f41(GE_context* ac, T0* C);
/* UC_UTF8_STRING.is_integer */
extern T1 T296f34(GE_context* ac, T0* C);
/* UC_UTF8_STRING.is_valid_integer_or_natural */
extern T1 T296f40(GE_context* ac, T0* C, T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.is_integral_integer */
extern T1 T122f12(GE_context* ac, T0* C);
/* STRING_8.is_integer */
extern T1 T17f8(GE_context* ac, T0* C);
/* STRING_8.is_valid_integer_or_natural */
extern T1 T17f14(GE_context* ac, T0* C, T6 a1);
/* ET_XACE_OPTIONS.set_force_32bits */
extern void T164f423(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_flat_fst_optimization */
extern void T164f422(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_finalize_option */
extern void T164f421(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_external_runtime */
extern void T164f420(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_exclude */
extern void T164f418(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_exception_trace */
extern void T164f417(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_enforce_unique_class_names */
extern void T164f416(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_ecf_library */
extern void T164f415(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_dynamic_runtime */
extern void T164f414(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_dotnet_naming_convention */
extern void T164f413(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_document */
extern void T164f412(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_debugger */
extern void T164f411(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_debug_tag */
extern void T164f410(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_dead_code_removal */
extern void T164f408(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_dead_code_removal */
extern unsigned char ge1226os4873;
extern T0* ge1226ov4873;
extern T0* T164f190(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.set_c_compiler_options */
extern void T164f407(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_culture */
extern void T164f406(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_create_keyword_extension */
extern void T164f405(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_console_application */
extern void T164f404(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_component */
extern void T164f403(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_cls_compliant */
extern void T164f402(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_clean */
extern void T164f401(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_check_vape */
extern void T164f400(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_case_insensitive */
extern void T164f399(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_callback */
extern void T164f398(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_callback */
extern unsigned char ge1226os4872;
extern T0* ge1226ov4872;
extern T0* T164f182(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.set_automatic_backup */
extern void T164f397(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_attached_by_default */
extern void T164f396(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_wrong_attribute_value_error */
extern void T35f23(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.make */
extern T0* T271c8(GE_context* ac, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.string_ */
extern T0* T271f4(GE_context* ac, T0* C);
/* ET_XACE_OPTIONS.set_assertion */
extern void T164f395(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_assertion */
extern unsigned char ge1226os4871;
extern T0* ge1226ov4871;
extern T0* T164f174(GE_context* ac, T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_non_empty_attribute_expected_error */
extern void T35f22(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.make */
extern T0* T270c8(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* ET_XACE_OPTIONS.set_assembly */
extern void T164f394(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_array_optimization */
extern void T164f393(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_arguments */
extern void T164f392(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_address_expression */
extern void T164f391(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_boolean_expected_error */
extern void T35f21(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.make */
extern T0* T269c8(GE_context* ac, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_PARSER.is_false */
extern T1 T131f127(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_abstract */
extern void T164f390(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_PARSER.is_true */
extern T1 T131f126(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].found_item */
extern T6 T204f23(GE_context* ac, T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].item_storage_item */
extern T6 T204f33(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].found */
extern T1 T204f29(GE_context* ac, T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].search */
extern void T204f35(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].search_position */
extern void T204f38(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].hash_position */
extern T6 T204f26(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].key_storage_item */
extern T0* T204f22(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].clashes_item */
extern T6 T204f25(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].slots_item */
extern T6 T204f27(GE_context* ac, T0* C, T6 a1);
/* ET_XACE_PARSER.option_codes */
extern unsigned char ge1227os4346;
extern T0* ge1227ov4346;
extern T0* T131f30(GE_context* ac, T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].put_new */
extern void T204f37(GE_context* ac, T0* C, T6 a1, T0* a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].key_storage_put */
extern void T204f44(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].item_storage_put */
extern void T204f43(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].slots_put */
extern void T204f42(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].clashes_put */
extern void T204f41(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].unset_found_item */
extern void T204f40(GE_context* ac, T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].set_key_equality_tester */
extern void T204f36(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_PARSER.string_equality_tester */
extern T0* T131f14(GE_context* ac, T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_map */
extern T0* T204c34(GE_context* ac, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_with_equality_testers */
extern void T204f39(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_sparse_container */
extern void T204f45(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].set_internal_cursor */
extern void T204f50(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].new_cursor */
extern T0* T204f31(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [INTEGER_32, STRING_8].make */
extern T0* T352c4(GE_context* ac, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_slots */
extern void T204f49(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].new_modulus */
extern T6 T204f30(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_clashes */
extern void T204f48(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_key_storage */
extern void T204f47(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_item_storage */
extern void T204f46(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].make */
extern T0* T96f2(GE_context* ac, T0* C, T6 a1);
/* ET_XACE_PARSER.uc_value */
extern unsigned char ge1255os3858;
extern T0* ge1255ov3858;
extern T0* T131f29(GE_context* ac, T0* C);
/* ET_XACE_PARSER.uc_option */
extern unsigned char ge1255os3865;
extern T0* ge1255ov3865;
extern T0* T131f23(GE_context* ac, T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.put_last */
extern void T163f6(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].force_last */
extern void T171f12(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY].force */
extern void T306f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].fill_with */
extern void T305f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].extend */
extern void T305f8(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].resize */
extern void T171f14(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY].aliased_resized_area */
extern T0* T306f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].aliased_resized_area */
extern T0* T305f4(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].new_capacity */
extern T6 T171f9(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].extendible */
extern T1 T171f8(GE_context* ac, T0* C, T6 a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_multiple_library_prefix_error */
extern void T35f20(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.make */
extern T0* T268c8(GE_context* ac, T0* a1, T0* a2);
/* ET_XACE_MOUNTED_LIBRARY.same_library_prefix */
extern T1 T172f7(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_MOUNTED_LIBRARY.string_ */
extern T0* T172f6(GE_context* ac, T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.item */
extern T0* T163f2(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_MOUNTED_LIBRARIES.string_ */
extern T0* T163f3(GE_context* ac, T0* C);
/* ET_XACE_AST_FACTORY.new_mounted_libraries */
extern T0* T140f3(GE_context* ac, T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.make_empty */
extern T0* T163c5(GE_context* ac);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].make */
extern T0* T171c11(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].set_internal_cursor */
extern void T171f13(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].new_cursor */
extern T0* T171f7(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_XACE_MOUNTED_LIBRARY].make */
extern T0* T307c3(GE_context* ac, T0* a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY].make */
extern T0* T306f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].make_empty */
extern T0* T305c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY].default_create */
extern T0* T306c3(GE_context* ac);
/* ET_XACE_PARSER.new_mount */
extern T0* T131f22(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_MOUNTED_LIBRARY.set_library_prefix */
extern void T172f11(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_AST_FACTORY.new_mounted_library */
extern T0* T140f7(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_MOUNTED_LIBRARY.make */
extern T0* T172c10(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_CONFIG_PARSER.parse_library */
extern void T129f262(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_CONFIG_PARSER.fill_library */
extern void T129f259(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
extern T1 T129f259ot1(T0* a1, T0** a2);
/* ET_XACE_LIBRARY_CONFIG_PARSER.fill_externals */
extern void T129f261(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
extern T1 T129f261ot1(T0* a1, T0** a2);
/* ET_XACE_LIBRARY_CONFIG_PARSER.new_export */
extern T0* T129f143(GE_context* ac, T0* C, T0* a1, T0* a2);
extern T1 T129f143ot1(T0* a1, T0** a2);
/* ET_XACE_LIBRARY_CONFIG_PARSER.new_exported_feature */
extern T0* T129f249(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_alias */
extern T0* T129f251(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_feature */
extern T0* T129f248(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_class */
extern T0* T129f146(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_export */
extern T0* T129f142(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_include_dir */
extern T0* T129f141(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_location */
extern T0* T129f140(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_link_library */
extern T0* T129f139(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_external */
extern T0* T129f25(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.new_options */
extern T0* T129f24(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_CONFIG_PARSER.fill_options */
extern void T129f260(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
extern T1 T129f260ot1(T0* a1, T0** a2);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_debug */
extern T0* T129f138(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_optimize */
extern T0* T129f137(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_check */
extern T0* T129f135(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_loop */
extern T0* T129f132(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_invariant */
extern T0* T129f130(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_ensure */
extern T0* T129f128(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_enable */
extern T0* T129f126(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_require */
extern T0* T129f125(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.is_false */
extern T1 T129f124(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.is_true */
extern T1 T129f123(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.option_codes */
extern T0* T129f27(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.string_equality_tester */
extern T0* T129f13(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_value */
extern T0* T129f26(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_option */
extern T0* T129f23(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.new_mount */
extern T0* T129f22(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_CONFIG_PARSER.execution_environment */
extern T0* T129f148(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_mount */
extern unsigned char ge1255os3861;
extern T0* ge1255ov3861;
extern T0* T129f21(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_prefix */
extern unsigned char ge1255os3863;
extern T0* ge1255ov3863;
extern T0* T129f20(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.new_cluster */
extern T0* T129f19(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
extern T1 T129f19ot1(T0* a1, T0** a2);
/* ET_XACE_CLUSTER.set_libraries */
extern void T170f41(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_subclusters */
extern void T170f40(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_CLUSTERS.set_parent */
extern void T162f14(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_parent */
extern void T170f50(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_dependant_constraint */
extern void T170f53(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_CLUSTERS.set_dependant_constraint */
extern void T162f19(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_provider_constraint */
extern void T170f52(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_CLUSTERS.set_provider_constraint */
extern void T162f18(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_options */
extern void T170f39(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_read_only */
extern void T170f38(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_CLUSTER.set_recursive */
extern void T170f37(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_CLUSTER.set_abstract */
extern void T170f36(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.new_class */
extern T0* T129f147(GE_context* ac, T0* C, T0* a1, T0* a2);
extern T1 T129f147ot1(T0* a1, T0** a2);
/* ET_XACE_LIBRARY_CONFIG_PARSER.new_feature */
extern T0* T129f250(GE_context* ac, T0* C, T0* a1, T0* a2);
extern T1 T129f250ot1(T0* a1, T0** a2);
/* ET_XACE_CLUSTER.set_cluster_prefix */
extern void T170f34(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_relative */
extern void T170f33(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_relative */
extern unsigned char ge1255os3860;
extern T0* ge1255ov3860;
extern T0* T129f145(GE_context* ac, T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_attribute_obsoleted_by_element_warning */
extern void T35f35(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_warning */
extern void T35f33(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_warning_message */
extern void T35f34(GE_context* ac, T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_line */
extern void T102f4(GE_context* ac, T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_new_line */
extern void T102f6(GE_context* ac, T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_string */
extern void T102f5(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.make */
extern T0* T383c8(GE_context* ac, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_abstract */
extern unsigned char ge1255os3859;
extern T0* ge1255ov3859;
extern T0* T129f144(GE_context* ac, T0* C);
/* ET_XACE_AST_FACTORY.new_cluster */
extern T0* T140f6(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_CLUSTER.make */
extern T0* T170c32(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* ET_XACE_CLUSTER.set_scm_mapping_constraint_enabled */
extern void T170f42(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_CLUSTERS.set_scm_mapping_constraint_enabled */
extern void T162f15(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_cluster */
extern unsigned char ge1255os3856;
extern T0* ge1255ov3856;
extern T0* T129f17(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.string_ */
extern T0* T129f16(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_name */
extern unsigned char ge1255os3857;
extern T0* ge1255ov3857;
extern T0* T129f15(GE_context* ac, T0* C);
/* ET_XACE_PARSER.execution_environment */
extern T0* T131f152(GE_context* ac, T0* C);
/* UC_UTF8_STRING.has_substring */
extern T1 T296f54(GE_context* ac, T0* C, T0* a1);
/* STRING_8.has_substring */
extern T1 T17f32(GE_context* ac, T0* C, T0* a1);
/* STRING_8.substring_index */
extern T6 T17f34(GE_context* ac, T0* C, T0* a1, T6 a2);
/* STRING_8_SEARCHER.substring_index */
extern T6 T474f2(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* STRING_8_SEARCHER.substring_index_with_deltas */
extern T6 T474f3(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* STRING_8_SEARCHER.internal_initialize_deltas */
extern void T474f6(GE_context* ac, T0* C, T0* a1, T6 a2, T0* a3);
/* STRING_8.string_searcher */
extern unsigned char ge2326os795;
extern T0* ge2326ov795;
extern T0* T17f35(GE_context* ac, T0* C);
/* STRING_8_SEARCHER.make */
extern T0* T474c5(GE_context* ac);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].force_new */
extern void T150f52(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].key_storage_put */
extern void T150f58(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].item_storage_put */
extern void T150f57(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY_CONFIG].force */
extern void T222f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [ET_XACE_LIBRARY_CONFIG].fill_with */
extern void T221f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ET_XACE_LIBRARY_CONFIG].extend */
extern void T221f10(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].slots_put */
extern void T150f56(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].clashes_put */
extern void T150f55(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].slots_item */
extern T6 T150f28(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].hash_position */
extern T6 T150f27(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].clashes_item */
extern T6 T150f26(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].resize */
extern void T150f54(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].clashes_resize */
extern void T150f62(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].special_integer_ */
extern T0* T150f33(GE_context* ac, T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].key_storage_resize */
extern void T150f61(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].item_storage_resize */
extern void T150f60(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY_CONFIG].aliased_resized_area */
extern T0* T222f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_XACE_LIBRARY_CONFIG].aliased_resized_area */
extern T0* T221f4(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].key_storage_item */
extern T0* T150f32(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].slots_resize */
extern void T150f59(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].new_modulus */
extern T6 T150f34(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].new_capacity */
extern T6 T150f24(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].unset_found_item */
extern void T150f40(GE_context* ac, T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].found_item */
extern T0* T150f22(GE_context* ac, T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].item_storage_item */
extern T0* T150f23(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].found */
extern T1 T150f21(GE_context* ac, T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].search */
extern void T150f51(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].search_position */
extern void T150f53(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_PARSER.uc_mount */
extern T0* T131f21(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG.set_library_prefix */
extern void T130f11(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_PARSER.uc_prefix */
extern T0* T131f20(GE_context* ac, T0* C);
/* ET_XACE_AST_FACTORY.new_clusters */
extern T0* T140f2(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_CLUSTERS.make */
extern T0* T162c5(GE_context* ac, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].put_last */
extern void T169f11(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_LIBRARY_CONFIG.set_options */
extern void T130f10(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_PARSER.new_cluster */
extern T0* T131f19(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
extern T1 T131f19ot1(T0* a1, T0** a2);
/* ET_XACE_PARSER.new_class */
extern T0* T131f149(GE_context* ac, T0* C, T0* a1, T0* a2);
extern T1 T131f149ot1(T0* a1, T0** a2);
/* ET_XACE_PARSER.new_feature */
extern T0* T131f254(GE_context* ac, T0* C, T0* a1, T0* a2);
extern T1 T131f254ot1(T0* a1, T0** a2);
/* ET_XACE_PARSER.uc_relative */
extern T0* T131f148(GE_context* ac, T0* C);
/* ET_XACE_PARSER.uc_abstract */
extern T0* T131f147(GE_context* ac, T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_element_obsoleted_by_element_warning */
extern void T35f25(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.make */
extern T0* T273c8(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.position */
extern T0* T142f5(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.null_position */
extern unsigned char ge1383os9386;
extern T0* ge1383ov9386;
extern T0* T142f10(GE_context* ac, T0* C);
/* XM_DEFAULT_POSITION.make */
extern T0* T224c7(GE_context* ac, T0* a1, T6 a2, T6 a3, T6 a4);
/* XM_POSITION_TABLE.item */
extern T0* T143f2(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].forth */
extern void T291f11(GE_context* ac, T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_forth */
extern void T292f12(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].add_traversing_cursor */
extern void T292f13(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set_next_cursor */
extern void T291f14(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].remove_traversing_cursor */
extern void T292f14(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set */
extern void T291f12(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].go_after */
extern void T291f10(GE_context* ac, T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_go_after */
extern void T292f11(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set_after */
extern void T291f13(GE_context* ac, T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_off */
extern T1 T292f6(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].off */
extern T1 T291f7(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].item */
extern T0* T291f6(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].start */
extern void T291f9(GE_context* ac, T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_start */
extern void T292f10(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].new_cursor */
extern T0* T292f5(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T291c8(GE_context* ac, T0* a1);
/* XM_POSITION_TABLE.has */
extern T1 T143f3(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_LIBRARY_CONFIG.set_name */
extern void T130f9(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.attribute_by_name */
extern T0* T142f15(GE_context* ac, T0* C, T0* a1);
extern T1 T142f15ot1(T0* a1, T0** a2);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE].go_after */
extern void T201f14(GE_context* ac, T0* C);
/* XM_LINKED_LIST [XM_ELEMENT_NODE].cursor_go_after */
extern void T287f17(GE_context* ac, T0* C, T0* a1);
/* XM_ELEMENT.attribute_same_name */
extern T1 T142f9(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.same_string */
extern T1 T142f12(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.string_equality_tester */
extern T0* T142f14(GE_context* ac, T0* C);
/* ET_XACE_PARSER.uc_name */
extern T0* T131f17(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.unknown_system */
extern unsigned char ge905os7681;
extern T0* ge905ov7681;
extern T0* T196f1(GE_context* ac, T0* C);
/* ET_SYSTEM.make */
extern T0* T197c120(GE_context* ac, T0* a1);
/* ET_SYSTEM.set_default_class_mapping */
extern void T197f128(GE_context* ac, T0* C);
/* ET_SYSTEM.set_wide_character_ref_class_mapping */
extern void T197f186(GE_context* ac, T0* C, T0* a1);
/* ET_SYSTEM.set_class_mapping */
extern void T197f188(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_MASTER_CLASS.set_mapped_class */
extern void T332f24(GE_context* ac, T0* C, T0* a1);
/* ET_MASTER_CLASS.set_marked */
extern void T332f25(GE_context* ac, T0* C, T1 a1);
/* ET_CLASS.set_marked */
extern void T348f48(GE_context* ac, T0* C, T1 a1);
/* ET_CLASS.is_unknown */
extern T1 T348f29(GE_context* ac, T0* C);
/* ET_NONE_GROUP.is_unknown */
extern T1 T349f4(GE_context* ac, T0* C);
/* ET_MASTER_CLASS.actual_class */
extern T0* T332f20(GE_context* ac, T0* C);
/* ET_CLASS.actual_class */
extern T0* T348f32(GE_context* ac, T0* C);
/* ET_SYSTEM.master_class */
extern T0* T197f118(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].force_last_new */
extern void T320f37(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].key_storage_put */
extern void T320f45(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [ET_CLASS_NAME].force */
extern void T409f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [ET_CLASS_NAME].fill_with */
extern void T410f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ET_CLASS_NAME].extend */
extern void T410f8(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].item_storage_put */
extern void T320f44(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [ET_MASTER_CLASS].force */
extern void T408f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [ET_MASTER_CLASS].fill_with */
extern void T405f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ET_MASTER_CLASS].extend */
extern void T405f8(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].slots_put */
extern void T320f43(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].clashes_put */
extern void T320f42(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].slots_item */
extern T6 T320f25(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].hash_position */
extern T6 T320f24(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].resize */
extern void T320f41(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].clashes_resize */
extern void T320f50(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].special_integer_ */
extern T0* T320f31(GE_context* ac, T0* C);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].key_storage_resize */
extern void T320f49(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_CLASS_NAME].aliased_resized_area */
extern T0* T409f1(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_CLASS_NAME].aliased_resized_area */
extern T0* T410f3(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].item_storage_resize */
extern void T320f48(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_MASTER_CLASS].aliased_resized_area */
extern T0* T408f1(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_MASTER_CLASS].aliased_resized_area */
extern T0* T405f4(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].key_storage_item */
extern T0* T320f22(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].clashes_item */
extern T6 T320f33(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].slots_resize */
extern void T320f47(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].new_modulus */
extern T6 T320f23(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].new_capacity */
extern T6 T320f32(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].unset_found_item */
extern void T320f40(GE_context* ac, T0* C);
/* ET_MASTER_CLASS.make */
extern T0* T332c21(GE_context* ac, T0* a1, T0* a2);
/* ET_TOKEN_CONSTANTS.unknown_class */
extern unsigned char ge905os7676;
extern T0* ge905ov7676;
extern T0* T196f69(GE_context* ac, T0* C);
/* ET_CLASS.set_implementation_error */
extern void T348f45(GE_context* ac, T0* C);
/* ET_CLASS.set_implementation_checked */
extern void T348f44(GE_context* ac, T0* C);
/* ET_CLASS.set_interface_error */
extern void T348f43(GE_context* ac, T0* C);
/* ET_CLASS.set_interface_checked */
extern void T348f42(GE_context* ac, T0* C);
/* ET_CLASS.set_flattening_error */
extern void T348f41(GE_context* ac, T0* C);
/* ET_CLASS.set_features_flattened */
extern void T348f40(GE_context* ac, T0* C);
/* ET_CLASS.set_ancestors_error */
extern void T348f39(GE_context* ac, T0* C);
/* ET_CLASS.set_ancestors_built */
extern void T348f38(GE_context* ac, T0* C);
/* ET_CLASS.set_syntax_error */
extern void T348f37(GE_context* ac, T0* C);
/* ET_CLASS.set_parsed */
extern void T348f36(GE_context* ac, T0* C);
/* ET_CLASS.set_group */
extern void T348f35(GE_context* ac, T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.unknown_group */
extern unsigned char ge905os7680;
extern T0* ge905ov7680;
extern T0* T196f122(GE_context* ac, T0* C);
/* ET_UNKNOWN_GROUP.make */
extern T0* T438c6(GE_context* ac);
/* ET_CLASS.make_unknown */
extern T0* T348c34(GE_context* ac);
/* ET_CLASS.make */
extern void T348f46(GE_context* ac, T0* C, T0* a1);
/* ET_CLASS.make */
extern T0* T348c46(GE_context* ac, T0* a1);
/* ET_CLASS_CODES.class_code */
extern T8 T448f1(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].found_item */
extern T8 T473f28(GE_context* ac, T0* C);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].item_storage_item */
extern T8 T473f27(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].found */
extern T1 T473f29(GE_context* ac, T0* C);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].search */
extern void T473f35(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].search_position */
extern void T473f39(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].hash_position */
extern T6 T473f23(GE_context* ac, T0* C, T0* a1);
/* ET_CLASS_NAME_TESTER.test */
extern T1 T321f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_IDENTIFIER.same_class_name */
extern T1 T417f6(GE_context* ac, T0* C, T0* a1);
/* ET_IDENTIFIER.string_ */
extern T0* T417f4(GE_context* ac, T0* C);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].key_storage_item */
extern T0* T473f22(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].clashes_item */
extern T6 T473f33(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].slots_item */
extern T6 T473f26(GE_context* ac, T0* C, T6 a1);
/* ET_CLASS_CODES.codes_by_name */
extern unsigned char ge884os19402;
extern T0* ge884ov19402;
extern T0* T448f2(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.iteration_cursor_class_name */
extern unsigned char ge905os6638;
extern T0* ge905ov6638;
extern T0* T196f148(GE_context* ac, T0* C);
/* ET_IDENTIFIER.make */
extern T0* T417c7(GE_context* ac, T0* a1);
/* ET_IDENTIFIER.make_with_hash_code */
extern void T417f8(GE_context* ac, T0* C, T0* a1, T6 a2);
/* ET_IDENTIFIER.make_leaf */
extern void T417f9(GE_context* ac, T0* C);
/* ET_IDENTIFIER.new_hash_code */
extern T6 T417f5(GE_context* ac, T0* C, T0* a1);
/* CHARACTER_8.upper */
extern T2 T2f23(GE_context* ac, T2* C);
/* CHARACTER_8.is_lower */
extern T1 T2f24(GE_context* ac, T2* C);
/* ET_TOKEN_CONSTANTS.iterable_class_name */
extern unsigned char ge905os6637;
extern T0* ge905ov6637;
extern T0* T196f43(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.disposable_class_name */
extern unsigned char ge905os6622;
extern T0* ge905ov6622;
extern T0* T196f147(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.system_object_class_name */
extern unsigned char ge905os6659;
extern T0* ge905ov6659;
extern T0* T196f57(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.any_class_name */
extern unsigned char ge905os6614;
extern T0* ge905ov6614;
extern T0* T196f25(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.array_class_name */
extern unsigned char ge905os6616;
extern T0* ge905ov6616;
extern T0* T196f31(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.typed_pointer_class_name */
extern unsigned char ge905os6663;
extern T0* ge905ov6663;
extern T0* T196f61(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.type_class_name */
extern unsigned char ge905os6662;
extern T0* ge905ov6662;
extern T0* T196f59(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.special_class_name */
extern unsigned char ge905os6655;
extern T0* ge905ov6655;
extern T0* T196f54(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.routine_class_name */
extern unsigned char ge905os6654;
extern T0* ge905ov6654;
extern T0* T196f53(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.procedure_class_name */
extern unsigned char ge905os6650;
extern T0* ge905ov6650;
extern T0* T196f51(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.predicate_class_name */
extern unsigned char ge905os6649;
extern T0* ge905ov6649;
extern T0* T196f50(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.function_class_name */
extern unsigned char ge905os6627;
extern T0* ge905ov6627;
extern T0* T196f37(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.tuple_class_name */
extern unsigned char ge905os6661;
extern T0* ge905ov6661;
extern T0* T196f29(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.pointer_class_name */
extern unsigned char ge905os6648;
extern T0* ge905ov6648;
extern T0* T196f49(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.natural_64_class_name */
extern unsigned char ge905os6645;
extern T0* ge905ov6645;
extern T0* T196f47(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.natural_16_class_name */
extern unsigned char ge905os6643;
extern T0* ge905ov6643;
extern T0* T196f46(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.natural_8_class_name */
extern unsigned char ge905os6642;
extern T0* ge905ov6642;
extern T0* T196f45(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.integer_64_class_name */
extern unsigned char ge905os6633;
extern T0* ge905ov6633;
extern T0* T196f41(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.integer_16_class_name */
extern unsigned char ge905os6631;
extern T0* ge905ov6631;
extern T0* T196f40(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.integer_8_class_name */
extern unsigned char ge905os6630;
extern T0* ge905ov6630;
extern T0* T196f39(GE_context* ac, T0* C);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].force_last */
extern void T473f37(GE_context* ac, T0* C, T8 a1, T0* a2);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].key_storage_put */
extern void T473f45(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].slots_put */
extern void T473f44(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].clashes_put */
extern void T473f43(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].resize */
extern void T473f42(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].clashes_resize */
extern void T473f50(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].special_integer_ */
extern T0* T473f31(GE_context* ac, T0* C);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].key_storage_resize */
extern void T473f49(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].item_storage_resize */
extern void T473f48(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [NATURAL_8].aliased_resized_area */
extern T0* T485f1(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [NATURAL_8].aliased_resized_area */
extern T0* T159f4(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].slots_resize */
extern void T473f47(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].new_modulus */
extern T6 T473f24(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].new_capacity */
extern T6 T473f32(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].item_storage_put */
extern void T473f41(GE_context* ac, T0* C, T8 a1, T6 a2);
/* KL_SPECIAL_ROUTINES [NATURAL_8].force */
extern void T485f4(GE_context* ac, T0* C, T0* a1, T8 a2, T6 a3);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].unset_found_item */
extern void T473f40(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.boolean_class_name */
extern unsigned char ge905os6617;
extern T0* ge905ov6617;
extern T0* T196f32(GE_context* ac, T0* C);
/* ET_CLASS_CODES.tokens */
extern unsigned char ge898os6613;
extern T0* ge898ov6613;
extern T0* T448f6(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.default_create */
extern T0* T196c162(GE_context* ac);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].set_key_equality_tester */
extern void T473f36(GE_context* ac, T0* C, T0* a1);
/* ET_CLASS_CODES.class_name_tester */
extern unsigned char ge954os14244;
extern T0* ge954ov14244;
extern T0* T448f4(GE_context* ac, T0* C);
/* ET_CLASS_NAME_TESTER.default_create */
extern T0* T321c2(GE_context* ac);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].make_map */
extern T0* T473c34(GE_context* ac, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].make_with_equality_testers */
extern void T473f38(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].make_sparse_container */
extern void T473f46(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].set_internal_cursor */
extern void T473f55(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].new_cursor */
extern T0* T473f30(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [NATURAL_8, ET_CLASS_NAME].make */
extern T0* T486c4(GE_context* ac, T0* a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].make_slots */
extern void T473f54(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].make_clashes */
extern void T473f53(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].make_key_storage */
extern void T473f52(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_CLASS_NAME].make */
extern T0* T409f2(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [ET_CLASS_NAME].make_empty */
extern T0* T410c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_CLASS_NAME].default_create */
extern T0* T409c3(GE_context* ac);
/* DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME].make_item_storage */
extern void T473f51(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [NATURAL_8].make */
extern T0* T485f2(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [NATURAL_8].default_create */
extern T0* T485c3(GE_context* ac);
/* ET_CLASS.class_codes */
extern unsigned char ge896os19369;
extern T0* ge896ov19369;
extern T0* T348f30(GE_context* ac, T0* C);
/* ET_CLASS_CODES.default_create */
extern T0* T448c34(GE_context* ac);
/* ET_TOKEN_CONSTANTS.end_keyword */
extern unsigned char ge905os7079;
extern T0* ge905ov7079;
extern T0* T196f123(GE_context* ac, T0* C);
/* ET_KEYWORD.make_end */
extern T0* T337c9(GE_context* ac);
/* ET_KEYWORD.make_token */
extern void T337f7(GE_context* ac, T0* C, T0* a1);
/* ET_KEYWORD.make_leaf */
extern void T337f8(GE_context* ac, T0* C);
/* ET_KEYWORD.tokens */
extern T0* T337f4(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.class_keyword */
extern unsigned char ge905os7068;
extern T0* ge905ov7068;
extern T0* T196f144(GE_context* ac, T0* C);
/* ET_KEYWORD.make_class */
extern T0* T337c12(GE_context* ac);
/* ET_TOKEN_CONSTANTS.empty_procedures */
extern unsigned char ge905os7674;
extern T0* ge905ov7674;
extern T0* T196f143(GE_context* ac, T0* C);
/* ET_PROCEDURE_LIST.make_with_capacity */
extern T0* T447c4(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_PROCEDURE].make */
extern T0* T482f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [ET_PROCEDURE].make_empty */
extern T0* T481c3(GE_context* ac, T6 a1);
/* ET_PROCEDURE_LIST.fixed_array */
extern unsigned char ge788os19031;
extern T0* ge788ov19031;
extern T0* T447f3(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [ET_PROCEDURE].default_create */
extern T0* T482c2(GE_context* ac);
/* ET_TOKEN_CONSTANTS.empty_queries */
extern unsigned char ge905os7673;
extern T0* ge905ov7673;
extern T0* T196f142(GE_context* ac, T0* C);
/* ET_QUERY_LIST.make_with_capacity */
extern T0* T446c4(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_QUERY].make */
extern T0* T479f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [ET_QUERY].make_empty */
extern T0* T478c3(GE_context* ac, T6 a1);
/* ET_QUERY_LIST.fixed_array */
extern unsigned char ge790os19031;
extern T0* ge790ov19031;
extern T0* T446f3(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [ET_QUERY].default_create */
extern T0* T479c2(GE_context* ac);
/* ET_TOKEN_CONSTANTS.empty_ancestors */
extern unsigned char ge905os7670;
extern T0* ge905ov7670;
extern T0* T196f141(GE_context* ac, T0* C);
/* ET_BASE_TYPE_LIST.make_with_capacity */
extern T0* T445c4(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_BASE_TYPE].make */
extern T0* T476f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [ET_BASE_TYPE].make_empty */
extern T0* T475c3(GE_context* ac, T6 a1);
/* ET_BASE_TYPE_LIST.fixed_array */
extern unsigned char ge967os19298;
extern T0* ge967ov19298;
extern T0* T445f3(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [ET_BASE_TYPE].default_create */
extern T0* T476c2(GE_context* ac);
/* ET_TOKEN_CONSTANTS.unknown_class_name */
extern unsigned char ge905os6665;
extern T0* ge905ov6665;
extern T0* T196f140(GE_context* ac, T0* C);
/* ET_CLASS.tokens */
extern T0* T348f27(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.empty_master_classes */
extern unsigned char ge905os7688;
extern T0* ge905ov7688;
extern T0* T196f129(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].make */
extern T0* T427c13(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].set_internal_cursor */
extern void T427f15(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].new_cursor */
extern T0* T427f7(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_MASTER_CLASS].make */
extern T0* T472c5(GE_context* ac, T0* a1);
/* KL_SPECIAL_ROUTINES [ET_MASTER_CLASS].make */
extern T0* T408f2(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [ET_MASTER_CLASS].make_empty */
extern T0* T405c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_MASTER_CLASS].default_create */
extern T0* T408c3(GE_context* ac);
/* ET_TOKEN_CONSTANTS.empty_classes */
extern unsigned char ge905os7687;
extern T0* ge905ov7687;
extern T0* T196f128(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [ET_CLASS].make */
extern T0* T426c9(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [ET_CLASS].set_internal_cursor */
extern void T426f11(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_CLASS].new_cursor */
extern T0* T426f6(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_CLASS].make */
extern T0* T469c4(GE_context* ac, T0* a1);
/* KL_SPECIAL_ROUTINES [ET_CLASS].make */
extern T0* T467f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [ET_CLASS].make_empty */
extern T0* T468c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_CLASS].default_create */
extern T0* T467c3(GE_context* ac);
/* ET_MASTER_CLASS.tokens */
extern T0* T332f19(GE_context* ac, T0* C);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].found_item */
extern T0* T320f28(GE_context* ac, T0* C);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].item_storage_item */
extern T0* T320f27(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].found */
extern T1 T320f29(GE_context* ac, T0* C);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].search */
extern void T320f36(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].search_position */
extern void T320f39(GE_context* ac, T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.wide_character_ref_class_name */
extern unsigned char ge905os6685;
extern T0* ge905ov6685;
extern T0* T196f68(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.character_32_ref_class_name */
extern unsigned char ge905os6669;
extern T0* ge905ov6669;
extern T0* T196f24(GE_context* ac, T0* C);
/* ET_SYSTEM.set_wide_character_class_mapping */
extern void T197f185(GE_context* ac, T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.wide_character_class_name */
extern unsigned char ge905os6664;
extern T0* ge905ov6664;
extern T0* T196f62(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.character_32_class_name */
extern unsigned char ge905os6620;
extern T0* ge905ov6620;
extern T0* T196f23(GE_context* ac, T0* C);
/* ET_SYSTEM.set_string_class_mapping */
extern void T197f184(GE_context* ac, T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.string_class_name */
extern unsigned char ge905os6656;
extern T0* ge905ov6656;
extern T0* T196f56(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.string_8_class_name */
extern unsigned char ge905os6657;
extern T0* ge905ov6657;
extern T0* T196f22(GE_context* ac, T0* C);
/* ET_SYSTEM.set_real_ref_class_mapping */
extern void T197f183(GE_context* ac, T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.real_ref_class_name */
extern unsigned char ge905os6682;
extern T0* ge905ov6682;
extern T0* T196f67(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.real_32_ref_class_name */
extern unsigned char ge905os6683;
extern T0* ge905ov6683;
extern T0* T196f21(GE_context* ac, T0* C);
/* ET_SYSTEM.set_real_class_mapping */
extern void T197f182(GE_context* ac, T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.real_class_name */
extern unsigned char ge905os6651;
extern T0* ge905ov6651;
extern T0* T196f52(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.real_32_class_name */
extern unsigned char ge905os6652;
extern T0* ge905ov6652;
extern T0* T196f20(GE_context* ac, T0* C);
/* ET_SYSTEM.set_natural_ref_class_mapping */
extern void T197f181(GE_context* ac, T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.natural_ref_class_name */
extern unsigned char ge905os6676;
extern T0* ge905ov6676;
extern T0* T196f66(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.natural_32_ref_class_name */
extern unsigned char ge905os6679;
extern T0* ge905ov6679;
extern T0* T196f19(GE_context* ac, T0* C);
/* ET_SYSTEM.set_natural_class_mapping */
extern void T197f180(GE_context* ac, T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.natural_class_name */
extern unsigned char ge905os6641;
extern T0* ge905ov6641;
extern T0* T196f44(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.natural_32_class_name */
extern unsigned char ge905os6644;
extern T0* ge905ov6644;
extern T0* T196f18(GE_context* ac, T0* C);
/* ET_SYSTEM.set_integer_ref_class_mapping */
extern void T197f179(GE_context* ac, T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.integer_ref_class_name */
extern unsigned char ge905os6671;
extern T0* ge905ov6671;
extern T0* T196f65(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.integer_32_ref_class_name */
extern unsigned char ge905os6674;
extern T0* ge905ov6674;
extern T0* T196f17(GE_context* ac, T0* C);
/* ET_SYSTEM.set_integer_class_mapping */
extern void T197f178(GE_context* ac, T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.integer_class_name */
extern unsigned char ge905os6629;
extern T0* ge905ov6629;
extern T0* T196f38(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.integer_32_class_name */
extern unsigned char ge905os6632;
extern T0* ge905ov6632;
extern T0* T196f16(GE_context* ac, T0* C);
/* ET_SYSTEM.set_double_ref_class_mapping */
extern void T197f177(GE_context* ac, T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.double_ref_class_name */
extern unsigned char ge905os6670;
extern T0* ge905ov6670;
extern T0* T196f64(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.real_64_ref_class_name */
extern unsigned char ge905os6684;
extern T0* ge905ov6684;
extern T0* T196f15(GE_context* ac, T0* C);
/* ET_SYSTEM.set_double_class_mapping */
extern void T197f176(GE_context* ac, T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.double_class_name */
extern unsigned char ge905os6623;
extern T0* ge905ov6623;
extern T0* T196f34(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.real_64_class_name */
extern unsigned char ge905os6653;
extern T0* ge905ov6653;
extern T0* T196f14(GE_context* ac, T0* C);
/* ET_SYSTEM.set_character_ref_class_mapping */
extern void T197f175(GE_context* ac, T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.character_ref_class_name */
extern unsigned char ge905os6667;
extern T0* ge905ov6667;
extern T0* T196f63(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.character_8_ref_class_name */
extern unsigned char ge905os6668;
extern T0* ge905ov6668;
extern T0* T196f13(GE_context* ac, T0* C);
/* ET_SYSTEM.set_character_class_mapping */
extern void T197f174(GE_context* ac, T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.character_class_name */
extern unsigned char ge905os6618;
extern T0* ge905ov6618;
extern T0* T196f33(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.character_8_class_name */
extern unsigned char ge905os6619;
extern T0* ge905ov6619;
extern T0* T196f12(GE_context* ac, T0* C);
/* ET_SYSTEM.set_kernel_types */
extern void T197f127(GE_context* ac, T0* C);
/* ET_SYSTEM.set_wide_character_type */
extern void T197f173(GE_context* ac, T0* C);
/* ET_CLASS_TYPE.make */
extern T0* T323c5(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* ET_MASTER_CLASS.set_in_system */
extern void T332f22(GE_context* ac, T0* C, T1 a1);
/* ET_SYSTEM.set_typed_pointer_type */
extern void T197f172(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.like_current */
extern unsigned char ge905os7009;
extern T0* ge905ov7009;
extern T0* T196f30(GE_context* ac, T0* C);
/* ET_LIKE_CURRENT.make */
extern T0* T344c5(GE_context* ac, T0* a1);
/* ET_TOKEN_CONSTANTS.current_keyword */
extern unsigned char ge905os7072;
extern T0* ge905ov7072;
extern T0* T196f139(GE_context* ac, T0* C);
/* ET_CURRENT.make */
extern T0* T444c5(GE_context* ac);
/* ET_CURRENT.make_token */
extern void T444f6(GE_context* ac, T0* C, T0* a1);
/* ET_CURRENT.make_leaf */
extern void T444f7(GE_context* ac, T0* C);
/* ET_CURRENT.tokens */
extern T0* T444f4(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.like_keyword */
extern unsigned char ge905os7094;
extern T0* ge905ov7094;
extern T0* T196f138(GE_context* ac, T0* C);
/* ET_KEYWORD.make_like */
extern T0* T337c11(GE_context* ac);
/* ET_LIKE_CURRENT.tokens */
extern T0* T344f4(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.implicit_attached_type_mark */
extern unsigned char ge905os7015;
extern T0* ge905ov7015;
extern T0* T196f26(GE_context* ac, T0* C);
/* ET_IMPLICIT_TYPE_MARK.set_attached_mark */
extern void T334f4(GE_context* ac, T0* C, T1 a1);
/* ET_IMPLICIT_TYPE_MARK.make */
extern T0* T334c3(GE_context* ac);
/* ET_CLASS_TYPE.make_generic */
extern T0* T323c6(GE_context* ac, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_ACTUAL_PARAMETER_LIST.put_first */
extern void T329f8(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [ET_ACTUAL_PARAMETER_ITEM].force */
extern void T422f3(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [ET_ACTUAL_PARAMETER_ITEM].fill_with */
extern void T421f5(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ET_ACTUAL_PARAMETER_ITEM].extend */
extern void T421f6(GE_context* ac, T0* C, T0* a1);
/* ET_ACTUAL_PARAMETER_LIST.fixed_array */
extern unsigned char ge964os19031;
extern T0* ge964ov19031;
extern T0* T329f6(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [ET_ACTUAL_PARAMETER_ITEM].default_create */
extern T0* T422c2(GE_context* ac);
/* ET_ACTUAL_PARAMETER_LIST.make_with_capacity */
extern T0* T329c7(GE_context* ac, T6 a1);
/* ET_ACTUAL_PARAMETER_LIST.make_with_capacity */
extern void T329f7p1(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_ACTUAL_PARAMETER_ITEM].make */
extern T0* T422f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [ET_ACTUAL_PARAMETER_ITEM].make_empty */
extern T0* T421c3(GE_context* ac, T6 a1);
/* ET_TOKEN_CONSTANTS.right_bracket_symbol */
extern unsigned char ge905os7053;
extern T0* ge905ov7053;
extern T0* T196f127(GE_context* ac, T0* C);
/* ET_SYMBOL.make_right_bracket */
extern T0* T418c4(GE_context* ac);
/* ET_SYMBOL.make_leaf */
extern void T418f5(GE_context* ac, T0* C);
/* ET_SYMBOL.tokens */
extern T0* T418f3(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.left_bracket_symbol */
extern unsigned char ge905os7048;
extern T0* ge905ov7048;
extern T0* T196f126(GE_context* ac, T0* C);
/* ET_BRACKET_SYMBOL.make */
extern T0* T419c4(GE_context* ac);
/* ET_BRACKET_SYMBOL.make_leaf */
extern void T419f5(GE_context* ac, T0* C);
/* ET_BRACKET_SYMBOL.tokens */
extern T0* T419f3(GE_context* ac, T0* C);
/* ET_ACTUAL_PARAMETER_LIST.tokens */
extern T0* T329f5(GE_context* ac, T0* C);
/* ET_SYSTEM.set_type_type */
extern void T197f171(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.detachable_like_current */
extern unsigned char ge905os7011;
extern T0* ge905ov7011;
extern T0* T196f60(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.detachable_keyword */
extern unsigned char ge905os7075;
extern T0* ge905ov7075;
extern T0* T196f27(GE_context* ac, T0* C);
/* ET_KEYWORD.make_detachable */
extern T0* T337c5(GE_context* ac);
/* ET_SYSTEM.set_system_string_type */
extern void T197f170(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.system_string_class_name */
extern unsigned char ge905os6660;
extern T0* ge905ov6660;
extern T0* T196f58(GE_context* ac, T0* C);
/* ET_SYSTEM.set_system_object_type */
extern void T197f169(GE_context* ac, T0* C);
/* ET_PARENT_LIST.put_first */
extern void T325f7(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [ET_PARENT_ITEM].force */
extern void T414f3(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [ET_PARENT_ITEM].fill_with */
extern void T413f5(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ET_PARENT_ITEM].extend */
extern void T413f6(GE_context* ac, T0* C, T0* a1);
/* ET_PARENT_LIST.fixed_array */
extern unsigned char ge640os19031;
extern T0* ge640ov19031;
extern T0* T325f5(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [ET_PARENT_ITEM].default_create */
extern T0* T414c2(GE_context* ac);
/* ET_PARENT_LIST.make_with_capacity */
extern T0* T325c6(GE_context* ac, T6 a1);
/* ET_PARENT_LIST.make_with_capacity */
extern void T325f6p1(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_PARENT_ITEM].make */
extern T0* T414f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [ET_PARENT_ITEM].make_empty */
extern T0* T413c3(GE_context* ac, T6 a1);
/* ET_TOKEN_CONSTANTS.inherit_keyword */
extern unsigned char ge905os7090;
extern T0* ge905ov7090;
extern T0* T196f124(GE_context* ac, T0* C);
/* ET_KEYWORD.make_inherit */
extern T0* T337c10(GE_context* ac);
/* ET_PARENT_LIST.tokens */
extern T0* T325f4(GE_context* ac, T0* C);
/* ET_PARENT.make */
extern T0* T324c10(GE_context* ac, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5, T0* a6);
/* ET_PARENT.tokens */
extern T0* T324f9(GE_context* ac, T0* C);
/* ET_PARENT.has_feature_adaptation */
extern T1 T324f8(GE_context* ac, T0* C);
/* ET_SYSTEM.set_string_type */
extern void T197f168(GE_context* ac, T0* C);
/* ET_SYSTEM.set_string_32_type */
extern void T197f167(GE_context* ac, T0* C);
/* ET_BUILTIN_CONVERT_FEATURE.make */
extern T0* T330c4(GE_context* ac, T0* a1);
/* ET_BRACED_TYPE_LIST.make */
extern T0* T425c7(GE_context* ac);
/* ET_BRACED_TYPE_LIST.make */
extern void T425f7p1(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [ET_TYPE_ITEM].make */
extern T0* T466f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [ET_TYPE_ITEM].make_empty */
extern T0* T465c3(GE_context* ac, T6 a1);
/* ET_BRACED_TYPE_LIST.fixed_array */
extern unsigned char ge1003os19031;
extern T0* ge1003ov19031;
extern T0* T425f6(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [ET_TYPE_ITEM].default_create */
extern T0* T466c2(GE_context* ac);
/* ET_TOKEN_CONSTANTS.right_brace_symbol */
extern unsigned char ge905os7052;
extern T0* ge905ov7052;
extern T0* T196f146(GE_context* ac, T0* C);
/* ET_SYMBOL.make_right_brace */
extern T0* T418c7(GE_context* ac);
/* ET_TOKEN_CONSTANTS.left_brace_symbol */
extern unsigned char ge905os7047;
extern T0* ge905ov7047;
extern T0* T196f145(GE_context* ac, T0* C);
/* ET_SYMBOL.make_left_brace */
extern T0* T418c6(GE_context* ac);
/* ET_BRACED_TYPE_LIST.tokens */
extern T0* T425f5(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.string_32_class_name */
extern unsigned char ge905os6658;
extern T0* ge905ov6658;
extern T0* T196f55(GE_context* ac, T0* C);
/* ET_SYSTEM.set_string_8_type */
extern void T197f166(GE_context* ac, T0* C);
/* ET_SYSTEM.set_special_type */
extern void T197f165(GE_context* ac, T0* C);
/* ET_SYSTEM.set_routine_type */
extern void T197f164(GE_context* ac, T0* C);
/* ET_SYSTEM.set_real_64_type */
extern void T197f163(GE_context* ac, T0* C);
/* ET_SYSTEM.set_real_32_type */
extern void T197f162(GE_context* ac, T0* C);
/* ET_SYSTEM.set_real_type */
extern void T197f161(GE_context* ac, T0* C);
/* ET_SYSTEM.set_procedure_type */
extern void T197f160(GE_context* ac, T0* C);
/* ET_SYSTEM.set_predicate_type */
extern void T197f159(GE_context* ac, T0* C);
/* ET_SYSTEM.set_pointer_type */
extern void T197f158(GE_context* ac, T0* C);
/* ET_SYSTEM.set_none_type */
extern void T197f157(GE_context* ac, T0* C);
/* ET_MASTER_CLASS.add_first_local_class */
extern void T332f23(GE_context* ac, T0* C, T0* a1);
/* ET_MASTER_CLASS.add_first_local_non_override_class */
extern void T332f28(GE_context* ac, T0* C, T0* a1);
/* ET_MASTER_CLASS.update_intrinsic_class */
extern void T332f29(GE_context* ac, T0* C);
/* ET_MASTER_CLASS.set_intrinsic_class */
extern void T332f30(GE_context* ac, T0* C, T0* a1);
/* Creation of agent #1 in feature ET_MASTER_CLASS.set_intrinsic_class */
extern T0* T332f30ac1(T0* a1);
/* Creation of agent #2 in feature ET_MASTER_CLASS.set_intrinsic_class */
extern T0* T332f30ac2(T0* a1);
/* Creation of agent #3 in feature ET_MASTER_CLASS.set_intrinsic_class */
extern T0* T332f30ac3(T0* a1);
/* ET_MASTER_CLASS.mark_overridden */
extern void T332f32(GE_context* ac, T0* C, T0* a1);
/* ET_MASTER_CLASS.add_last_overriding_class */
extern void T332f34(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].force_last */
extern void T427f18(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].resize */
extern void T427f21(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].new_capacity */
extern T6 T427f12(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].extendible */
extern T1 T427f11(GE_context* ac, T0* C, T6 a1);
/* ET_CLASS.is_override */
extern T1 T348f31(GE_context* ac, T0* C, T0* a1);
/* ET_CLASS.universe */
extern T0* T348f26(GE_context* ac, T0* C);
/* ET_UNKNOWN_GROUP.universe */
extern T0* T438f3(GE_context* ac, T0* C);
/* ET_UNKNOWN_GROUP.tokens */
extern T0* T438f4(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].do_all */
extern void T427f14(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].item */
extern T0* T427f10(GE_context* ac, T0* C, T6 a1);
/* ET_MASTER_CLASS.unmark_overridden */
extern void T332f31(GE_context* ac, T0* C, T0* a1);
/* ET_MASTER_CLASS.remove_overriding_class */
extern void T332f33(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].remove_first */
extern void T427f17(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].remove */
extern void T427f20(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [ET_MASTER_CLASS].keep_head */
extern void T405f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [ET_MASTER_CLASS].set_count */
extern void T405f10(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].move_left */
extern void T427f24(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].move_cursors_left */
extern void T427f23(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST_CURSOR [ET_MASTER_CLASS].set_position */
extern void T472f8(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].remove_last */
extern void T427f22(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].move_last_cursors_after */
extern void T427f25(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_MASTER_CLASS].set_next_cursor */
extern void T472f7(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [ET_MASTER_CLASS].set_after */
extern void T472f6(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].first */
extern T0* T427f9(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].is_empty */
extern T1 T427f8(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].delete */
extern void T427f16(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_MASTER_CLASS].move_all_cursors_after */
extern void T427f19(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST [ET_CLASS].force_first */
extern void T426f10(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_CLASS].put */
extern void T426f13(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [ET_CLASS].move_cursors_right */
extern void T426f16(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [ET_CLASS].set_position */
extern void T469f5(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_CLASS].move_right */
extern void T426f15(GE_context* ac, T0* C, T6 a1, T6 a2);
/* KL_SPECIAL_ROUTINES [ET_CLASS].force */
extern void T467f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [ET_CLASS].fill_with */
extern void T468f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ET_CLASS].extend */
extern void T468f8(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_CLASS].put_last */
extern void T426f14(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_CLASS].resize */
extern void T426f12(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_CLASS].aliased_resized_area */
extern T0* T467f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_CLASS].aliased_resized_area */
extern T0* T468f4(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_CLASS].new_capacity */
extern T6 T426f7(GE_context* ac, T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_CLASS].extendible */
extern T1 T426f8(GE_context* ac, T0* C, T6 a1);
/* ET_MASTER_CLASS.add_first_local_override_class */
extern void T332f27(GE_context* ac, T0* C, T0* a1);
/* ET_CLASS.is_in_override_group */
extern T1 T348f33(GE_context* ac, T0* C);
/* ET_MASTER_CLASS.add_first_local_ignored_class */
extern void T332f26(GE_context* ac, T0* C, T0* a1);
/* ET_NONE_GROUP.make */
extern T0* T349c5(GE_context* ac, T0* a1);
/* ET_SYSTEM.register_class */
extern void T197f187(GE_context* ac, T0* C, T0* a1);
/* ET_CLASS.set_id */
extern void T348f47(GE_context* ac, T0* C, T6 a1);
/* ET_AST_FACTORY.new_class */
extern T0* T314f1(GE_context* ac, T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.none_class_name */
extern unsigned char ge905os6646;
extern T0* ge905ov6646;
extern T0* T196f48(GE_context* ac, T0* C);
/* ET_SYSTEM.set_natural_64_type */
extern void T197f156(GE_context* ac, T0* C);
/* ET_SYSTEM.set_natural_32_type */
extern void T197f155(GE_context* ac, T0* C);
/* ET_SYSTEM.set_natural_16_type */
extern void T197f154(GE_context* ac, T0* C);
/* ET_SYSTEM.set_natural_8_type */
extern void T197f153(GE_context* ac, T0* C);
/* ET_SYSTEM.set_natural_type */
extern void T197f152(GE_context* ac, T0* C);
/* ET_SYSTEM.set_iterable_type */
extern void T197f151(GE_context* ac, T0* C);
/* ET_SYSTEM.set_ise_exception_manager_type */
extern void T197f150(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.ise_exception_manager_class_name */
extern unsigned char ge905os6635;
extern T0* ge905ov6635;
extern T0* T196f42(GE_context* ac, T0* C);
/* ET_SYSTEM.set_integer_64_type */
extern void T197f149(GE_context* ac, T0* C);
/* ET_SYSTEM.set_integer_32_type */
extern void T197f148(GE_context* ac, T0* C);
/* ET_SYSTEM.set_integer_16_type */
extern void T197f147(GE_context* ac, T0* C);
/* ET_SYSTEM.set_integer_8_type */
extern void T197f146(GE_context* ac, T0* C);
/* ET_SYSTEM.set_integer_type */
extern void T197f145(GE_context* ac, T0* C);
/* ET_SYSTEM.set_function_type */
extern void T197f144(GE_context* ac, T0* C);
/* ET_SYSTEM.set_exception_manager_type */
extern void T197f143(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.exception_manager_class_name */
extern unsigned char ge905os6625;
extern T0* ge905ov6625;
extern T0* T196f36(GE_context* ac, T0* C);
/* ET_SYSTEM.set_exception_type */
extern void T197f142(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.exception_class_name */
extern unsigned char ge905os6624;
extern T0* ge905ov6624;
extern T0* T196f35(GE_context* ac, T0* C);
/* ET_SYSTEM.set_double_type */
extern void T197f141(GE_context* ac, T0* C);
/* ET_SYSTEM.set_character_32_type */
extern void T197f140(GE_context* ac, T0* C);
/* ET_SYSTEM.set_character_8_type */
extern void T197f139(GE_context* ac, T0* C);
/* ET_SYSTEM.set_character_type */
extern void T197f138(GE_context* ac, T0* C);
/* ET_SYSTEM.set_boolean_type */
extern void T197f137(GE_context* ac, T0* C);
/* ET_SYSTEM.set_array_type */
extern void T197f136(GE_context* ac, T0* C);
/* ET_SYSTEM.set_tuple_type */
extern void T197f135(GE_context* ac, T0* C);
/* ET_UNFOLDED_EMPTY_TUPLE_ACTUAL_PARAMETERS.make */
extern T0* T346c2(GE_context* ac, T0* a1);
/* ET_TUPLE_TYPE.make */
extern T0* T327c6(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* ET_TOKEN_CONSTANTS.tuple_keyword */
extern unsigned char ge905os7117;
extern T0* ge905ov7117;
extern T0* T196f125(GE_context* ac, T0* C);
/* ET_TUPLE_TYPE.tokens */
extern T0* T327f5(GE_context* ac, T0* C);
/* ET_SYSTEM.set_any_type */
extern void T197f134(GE_context* ac, T0* C);
/* ET_CLIENT_LIST.put_first */
extern void T326f5(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [ET_CLIENT_ITEM].force */
extern void T416f3(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [ET_CLIENT_ITEM].fill_with */
extern void T415f5(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [ET_CLIENT_ITEM].extend */
extern void T415f6(GE_context* ac, T0* C, T0* a1);
/* ET_CLIENT_LIST.fixed_array */
extern unsigned char ge605os19031;
extern T0* ge605ov19031;
extern T0* T326f3(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [ET_CLIENT_ITEM].default_create */
extern T0* T416c2(GE_context* ac);
/* ET_CLIENT.make */
extern T0* T333c3(GE_context* ac, T0* a1, T0* a2);
/* ET_CLIENT_LIST.make_with_capacity */
extern T0* T326c4(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_CLIENT_ITEM].make */
extern T0* T416f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [ET_CLIENT_ITEM].make_empty */
extern T0* T415c3(GE_context* ac, T6 a1);
/* ET_TOKEN_CONSTANTS.separate_keyword */
extern unsigned char ge905os7112;
extern T0* ge905ov7112;
extern T0* T196f28(GE_context* ac, T0* C);
/* ET_KEYWORD.make_separate */
extern T0* T337c6(GE_context* ac);
/* ET_SYSTEM.make_adapted */
extern void T197f126(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_SYSTEM.default_read_only_value */
extern unsigned char ge829os14243;
extern T1 ge829ov14243;
extern T1 T197f119(GE_context* ac, T0* C);
/* ET_SYSTEM.set_unknown_kernel_types */
extern void T197f125(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.unknown_convert_feature */
extern unsigned char ge905os7668;
extern T0* ge905ov7668;
extern T0* T196f11(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.unknown_generic_class_type */
extern unsigned char ge905os7678;
extern T0* ge905ov7678;
extern T0* T196f10(GE_context* ac, T0* C);
/* ET_ACTUAL_PARAMETER_LIST.make */
extern T0* T329c9(GE_context* ac);
/* ET_ACTUAL_PARAMETER_LIST.make */
extern void T329f9p1(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.empty_actual_parameters */
extern unsigned char ge905os7686;
extern T0* ge905ov7686;
extern T0* T196f9(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.unknown_tuple_type */
extern unsigned char ge905os7679;
extern T0* ge905ov7679;
extern T0* T196f8(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.empty_clients */
extern unsigned char ge905os7675;
extern T0* ge905ov7675;
extern T0* T196f7(GE_context* ac, T0* C);
/* ET_CLIENT_LIST.make */
extern T0* T326c6(GE_context* ac);
/* ET_TOKEN_CONSTANTS.unknown_parents */
extern unsigned char ge905os7672;
extern T0* ge905ov7672;
extern T0* T196f6(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.unknown_parent */
extern unsigned char ge905os7671;
extern T0* ge905ov7671;
extern T0* T196f5(GE_context* ac, T0* C);
/* ET_TOKEN_CONSTANTS.unknown_class_type */
extern unsigned char ge905os7677;
extern T0* ge905ov7677;
extern T0* T196f4(GE_context* ac, T0* C);
/* ET_SYSTEM.set_system_name */
extern void T197f124(GE_context* ac, T0* C, T0* a1);
/* ET_AST_NULL_PROCESSOR.make */
extern T0* T315c1(GE_context* ac);
/* ET_SYSTEM.set_preparse_shallow_mode */
extern void T197f123(GE_context* ac, T0* C);
/* ET_SYSTEM.set_default_keyword_usage */
extern void T197f122(GE_context* ac, T0* C);
/* ET_SYSTEM.set_use_detachable_keyword */
extern void T197f133(GE_context* ac, T0* C, T1 a1);
/* ET_SYSTEM.set_use_attached_keyword */
extern void T197f132(GE_context* ac, T0* C, T1 a1);
/* ET_SYSTEM.set_use_reference_keyword */
extern void T197f131(GE_context* ac, T0* C, T1 a1);
/* ET_SYSTEM.set_use_note_keyword */
extern void T197f130(GE_context* ac, T0* C, T1 a1);
/* ET_SYSTEM.set_use_attribute_keyword */
extern void T197f129(GE_context* ac, T0* C, T1 a1);
/* ET_SYSTEM.initialize */
extern void T197f121(GE_context* ac, T0* C);
/* ET_ADAPTED_DOTNET_ASSEMBLIES.make_empty */
extern T0* T319c3(GE_context* ac);
/* DS_ARRAYED_LIST [ET_ADAPTED_DOTNET_ASSEMBLY].make */
extern T0* T404c6(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [ET_ADAPTED_DOTNET_ASSEMBLY].set_internal_cursor */
extern void T404f7(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_ADAPTED_DOTNET_ASSEMBLY].new_cursor */
extern T0* T404f5(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_DOTNET_ASSEMBLY].make */
extern T0* T463c3(GE_context* ac, T0* a1);
/* KL_SPECIAL_ROUTINES [ET_ADAPTED_DOTNET_ASSEMBLY].make */
extern T0* T460f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [ET_ADAPTED_DOTNET_ASSEMBLY].make_empty */
extern T0* T462c3(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_ADAPTED_DOTNET_ASSEMBLY].default_create */
extern T0* T460c2(GE_context* ac);
/* ET_CLUSTERS.make_empty */
extern T0* T318c3(GE_context* ac);
/* DS_ARRAYED_LIST [ET_CLUSTER].make */
extern T0* T403c6(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [ET_CLUSTER].set_internal_cursor */
extern void T403f7(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_CLUSTER].new_cursor */
extern T0* T403f5(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_CLUSTER].make */
extern T0* T459c3(GE_context* ac, T0* a1);
/* KL_SPECIAL_ROUTINES [ET_CLUSTER].make */
extern T0* T457f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [ET_CLUSTER].make_empty */
extern T0* T458c3(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_CLUSTER].default_create */
extern T0* T457c2(GE_context* ac);
/* ET_ADAPTED_LIBRARIES.make_empty */
extern T0* T317c3(GE_context* ac);
/* DS_ARRAYED_LIST [ET_ADAPTED_LIBRARY].make */
extern T0* T402c6(GE_context* ac, T6 a1);
/* DS_ARRAYED_LIST [ET_ADAPTED_LIBRARY].set_internal_cursor */
extern void T402f7(GE_context* ac, T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_ADAPTED_LIBRARY].new_cursor */
extern T0* T402f5(GE_context* ac, T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_LIBRARY].make */
extern T0* T456c3(GE_context* ac, T0* a1);
/* KL_SPECIAL_ROUTINES [ET_ADAPTED_LIBRARY].make */
extern T0* T453f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [ET_ADAPTED_LIBRARY].make_empty */
extern T0* T455c3(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_ADAPTED_LIBRARY].default_create */
extern T0* T453c2(GE_context* ac);
/* ET_SYSTEM.initialize */
extern void T197f121p1(GE_context* ac, T0* C);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].set_key_equality_tester */
extern void T320f35(GE_context* ac, T0* C, T0* a1);
/* ET_SYSTEM.class_name_tester */
extern T0* T197f117(GE_context* ac, T0* C);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].make_map */
extern T0* T320c34(GE_context* ac, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].make_with_equality_testers */
extern void T320f38(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].make_sparse_container */
extern void T320f46(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].set_internal_cursor */
extern void T320f55(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].new_cursor */
extern T0* T320f30(GE_context* ac, T0* C);
/* DS_HASH_TABLE_CURSOR [ET_MASTER_CLASS, ET_CLASS_NAME].make */
extern T0* T411c4(GE_context* ac, T0* a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].make_slots */
extern void T320f54(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].make_clashes */
extern void T320f53(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].make_key_storage */
extern void T320f52(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME].make_item_storage */
extern void T320f51(GE_context* ac, T0* C, T6 a1);
/* ET_TOKEN_CONSTANTS.default_ast_factory */
extern unsigned char ge905os7685;
extern T0* ge905ov7685;
extern T0* T196f3(GE_context* ac, T0* C);
/* ET_AST_FACTORY.make */
extern T0* T314c2(GE_context* ac);
/* ET_TOKEN_CONSTANTS.standard_error_handler */
extern unsigned char ge905os7684;
extern T0* ge905ov7684;
extern T0* T196f2(GE_context* ac, T0* C);
/* ET_ERROR_HANDLER.make_standard */
extern T0* T313c5(GE_context* ac);
/* ET_ERROR_HANDLER.std */
extern T0* T313f4(GE_context* ac, T0* C);
/* ET_SYSTEM.tokens */
extern T0* T197f116(GE_context* ac, T0* C);
/* ET_XACE_PARSER.tokens */
extern T0* T131f16(GE_context* ac, T0* C);
/* ET_XACE_AST_FACTORY.new_library */
extern T0* T140f5(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG.make */
extern T0* T130c7(GE_context* ac);
/* ET_XACE_VALIDATOR.validate_library_doc */
extern void T148f32(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_wrong_root_element_error */
extern void T35f26(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.make */
extern T0* T274c8(GE_context* ac, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_named_cluster */
extern void T148f35(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_cluster */
extern void T148f37(GE_context* ac, T0* C, T0* a1, T0* a2);
extern T1 T148f37ot1(T0* a1, T0** a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_unknown_element_error */
extern void T35f30(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.make */
extern T0* T278c8(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* ET_XACE_VALIDATOR.validate_external */
extern void T148f40(GE_context* ac, T0* C, T0* a1, T0* a2);
extern T1 T148f40ot1(T0* a1, T0** a2);
/* ET_XACE_VALIDATOR.validate_export */
extern void T148f43(GE_context* ac, T0* C, T0* a1, T0* a2);
extern T1 T148f43ot1(T0* a1, T0** a2);
/* ET_XACE_VALIDATOR.uc_feature */
extern T0* T148f29(GE_context* ac, T0* C);
/* ET_XACE_VALIDATOR.uc_export */
extern T0* T148f28(GE_context* ac, T0* C);
/* ET_XACE_VALIDATOR.uc_link_library */
extern T0* T148f27(GE_context* ac, T0* C);
/* XM_ELEMENT.has_attribute_by_name */
extern T1 T142f6(GE_context* ac, T0* C, T0* a1);
extern T1 T142f6ot1(T0* a1, T0** a2);
/* ET_XACE_VALIDATOR.uc_location */
extern T0* T148f15(GE_context* ac, T0* C);
/* ET_XACE_VALIDATOR.uc_include_dir */
extern T0* T148f26(GE_context* ac, T0* C);
/* ET_XACE_VALIDATOR.uc_external */
extern T0* T148f12(GE_context* ac, T0* C);
/* ET_XACE_VALIDATOR.validate_class */
extern void T148f41(GE_context* ac, T0* C, T0* a1, T0* a2);
extern T1 T148f41ot1(T0* a1, T0** a2);
/* ET_XACE_VALIDATOR.validate_feature */
extern void T148f44(GE_context* ac, T0* C, T0* a1, T0* a2);
extern T1 T148f44ot1(T0* a1, T0** a2);
/* ET_XACE_VALIDATOR.uc_class */
extern T0* T148f13(GE_context* ac, T0* C);
/* ET_XACE_VALIDATOR.validate_option */
extern void T148f39(GE_context* ac, T0* C, T0* a1, T0* a2);
extern T1 T148f39ot1(T0* a1, T0** a2);
/* ET_XACE_VALIDATOR.uc_optimize */
extern T0* T148f25(GE_context* ac, T0* C);
/* ET_XACE_VALIDATOR.uc_debug */
extern T0* T148f24(GE_context* ac, T0* C);
/* ET_XACE_VALIDATOR.uc_check */
extern T0* T148f23(GE_context* ac, T0* C);
/* ET_XACE_VALIDATOR.uc_loop */
extern T0* T148f22(GE_context* ac, T0* C);
/* ET_XACE_VALIDATOR.uc_invariant */
extern T0* T148f21(GE_context* ac, T0* C);
/* ET_XACE_VALIDATOR.uc_ensure */
extern T0* T148f20(GE_context* ac, T0* C);
/* ET_XACE_VALIDATOR.uc_require */
extern T0* T148f19(GE_context* ac, T0* C);
/* ET_XACE_VALIDATOR.uc_value */
extern T0* T148f18(GE_context* ac, T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_unknown_option_warning */
extern void T35f32(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.make */
extern T0* T280c9(GE_context* ac, T0* a1, T0* a2);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.uc_name */
extern T0* T280f8(GE_context* ac, T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].has */
extern T1 T204f28(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OPTION_NAMES.option_codes */
extern T0* T180f18(GE_context* ac, T0* C);
/* ET_XACE_OPTION_NAMES.string_equality_tester */
extern T0* T180f35(GE_context* ac, T0* C);
/* ET_XACE_VALIDATOR.options */
extern T0* T148f17(GE_context* ac, T0* C);
/* ET_XACE_VALIDATOR.uc_option */
extern T0* T148f11(GE_context* ac, T0* C);
/* ET_XACE_VALIDATOR.validate_mount */
extern void T148f38(GE_context* ac, T0* C, T0* a1, T0* a2);
extern T1 T148f38ot1(T0* a1, T0** a2);
/* ET_XACE_VALIDATOR.validate_exclude */
extern void T148f42(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_obsolete_exclude_element_warning */
extern void T35f31(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.make */
extern T0* T279c8(GE_context* ac, T0* a1);
/* ET_XACE_VALIDATOR.uc_exclude */
extern unsigned char ge1255os3880;
extern T0* ge1255ov3880;
extern T0* T148f16(GE_context* ac, T0* C);
/* ET_XACE_VALIDATOR.uc_mount */
extern T0* T148f10(GE_context* ac, T0* C);
/* ET_XACE_VALIDATOR.uc_description */
extern unsigned char ge1255os3864;
extern T0* ge1255ov3864;
extern T0* T148f9(GE_context* ac, T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_missing_attribute_error */
extern void T35f27(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.make */
extern T0* T275c8(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* ET_XACE_VALIDATOR.uc_name */
extern T0* T148f7(GE_context* ac, T0* C);
/* ET_XACE_VALIDATOR.uc_cluster */
extern T0* T148f6(GE_context* ac, T0* C);
/* ET_XACE_VALIDATOR.validate_library */
extern void T148f34(GE_context* ac, T0* C, T0* a1, T0* a2);
extern T1 T148f34ot1(T0* a1, T0** a2);
/* ET_XACE_VALIDATOR.uc_library */
extern unsigned char ge1255os3855;
extern T0* ge1255ov3855;
extern T0* T148f5(GE_context* ac, T0* C);
/* ET_XACE_VALIDATOR.string_ */
extern T0* T148f3(GE_context* ac, T0* C);
/* ET_XACE_PARSER.uc_cluster */
extern T0* T131f11(GE_context* ac, T0* C);
/* ET_XACE_PARSER.uc_library */
extern T0* T131f151(GE_context* ac, T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].wipe_out */
extern void T150f36(GE_context* ac, T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].slots_wipe_out */
extern void T150f44(GE_context* ac, T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].clashes_wipe_out */
extern void T150f43(GE_context* ac, T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].key_storage_wipe_out */
extern void T150f42(GE_context* ac, T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].item_storage_wipe_out */
extern void T150f41(GE_context* ac, T0* C);
/* SPECIAL [ET_XACE_LIBRARY_CONFIG].keep_head */
extern void T221f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [ET_XACE_LIBRARY_CONFIG].set_count */
extern void T221f9(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].move_all_cursors_after */
extern void T150f39(GE_context* ac, T0* C);
/* detachable DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8].set_next_cursor */
extern void T220f8(GE_context* ac, T0* C, T0* a1);
/* detachable DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8].set_after */
extern void T220f7(GE_context* ac, T0* C);
/* ET_XACE_PARSER.new_system */
extern T0* T131f15(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_CONFIG.mount_libraries */
extern void T125f15(GE_context* ac, T0* C);
/* ET_XACE_PARSER.fill_system */
extern void T131f261(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
extern T1 T131f261ot1(T0* a1, T0** a2);
extern T1 T131f261ot2(T0* a1, T0** a2);
/* ET_XACE_SYSTEM_CONFIG.set_libraries */
extern void T125f14(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG.set_options */
extern void T125f13(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG.set_creation_procedure_name */
extern void T125f12(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG.set_root_class_name */
extern void T125f11(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG.set_system_name */
extern void T125f10(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG.set_clusters */
extern void T125f9(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_PARSER.uc_creation */
extern unsigned char ge1255os3854;
extern T0* ge1255ov3854;
extern T0* T131f28(GE_context* ac, T0* C);
/* XM_ELEMENT.element_by_name */
extern T0* T142f7(GE_context* ac, T0* C, T0* a1);
extern T1 T142f7ot1(T0* a1, T0** a2);
/* XM_ELEMENT.named_same_name */
extern T1 T142f11(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.same_namespace */
extern T1 T142f13(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_PARSER.uc_root */
extern unsigned char ge1255os3852;
extern T0* ge1255ov3852;
extern T0* T131f26(GE_context* ac, T0* C);
/* ET_XACE_AST_FACTORY.new_system */
extern T0* T140f1(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG.make */
extern T0* T125c7(GE_context* ac);
/* ET_XACE_PREPROCESSOR.preprocess_element */
extern void T149f11(GE_context* ac, T0* C, T0* a1, T0* a2);
extern T1 T149f11ot1(T0* a1, T0** a2);
/* ET_XACE_PREPROCESSOR.should_strip_element */
extern T1 T149f3(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_invalid_expression_error */
extern void T35f36(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_INVALID_EXPRESSION_ERROR.make */
extern T0* T384c8(GE_context* ac, T0* a1, T0* a2);
/* ET_XACE_PREPROCESSOR.is_expression_true */
extern T1 T149f8(GE_context* ac, T0* C, T0* a1);
/* UT_TEMPLATE_EXPANDER.expand_from_values */
extern T0* T217f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* UT_TEMPLATE_EXPANDER.string_ */
extern T0* T217f2(GE_context* ac, T0* C);
/* ET_XACE_PREPROCESSOR.template_expander */
extern unsigned char ge1263os10007;
extern T0* ge1263ov10007;
extern T0* T149f4(GE_context* ac, T0* C);
/* UT_TEMPLATE_EXPANDER.make */
extern T0* T217c3(GE_context* ac);
/* ET_XACE_PREPROCESSOR.string_ */
extern T0* T149f9(GE_context* ac, T0* C);
/* UC_UTF8_STRING.occurrences */
extern T6 T296f55(GE_context* ac, T0* C, T2 a1);
/* UC_UTF8_STRING.code_occurrences */
extern T6 T296f56(GE_context* ac, T0* C, T6 a1);
/* STRING_8.occurrences */
extern T6 T17f33(GE_context* ac, T0* C, T2 a1);
/* ET_XACE_PREPROCESSOR.is_valid_expression */
extern T1 T149f7(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_PREPROCESSOR.uc_unless */
extern unsigned char ge1255os3882;
extern T0* ge1255ov3882;
extern T0* T149f6(GE_context* ac, T0* C);
/* ET_XACE_PREPROCESSOR.uc_if */
extern unsigned char ge1255os3881;
extern T0* ge1255ov3881;
extern T0* T149f5(GE_context* ac, T0* C);
/* ET_XACE_PREPROCESSOR.expand_attribute_variables */
extern void T149f12(GE_context* ac, T0* C, T0* a1);
extern T1 T149f12ot1(T0* a1, T0** a2);
/* XM_ATTRIBUTE.set_value */
extern void T200f7(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_VALIDATOR.validate_system_doc */
extern void T148f31(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_system */
extern void T148f33(GE_context* ac, T0* C, T0* a1, T0* a2);
extern T1 T148f33ot1(T0* a1, T0** a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_obsolete_cluster_element_warning */
extern void T35f29(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.make */
extern T0* T277c8(GE_context* ac, T0* a1);
/* ET_XACE_VALIDATOR.validate_root */
extern void T148f36(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_creation */
extern T0* T148f14(GE_context* ac, T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_missing_element_error */
extern void T35f28(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_MISSING_ELEMENT_ERROR.make */
extern T0* T276c8(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* ET_XACE_VALIDATOR.uc_root */
extern T0* T148f8(GE_context* ac, T0* C);
/* ET_XACE_VALIDATOR.uc_system */
extern unsigned char ge1255os3851;
extern T0* ge1255ov3851;
extern T0* T148f4(GE_context* ac, T0* C);
/* ET_XACE_PARSER.uc_system */
extern T0* T131f13(GE_context* ac, T0* C);
/* ET_XACE_PARSER.string_ */
extern T0* T131f150(GE_context* ac, T0* C);
/* XM_TREE_CALLBACKS_PIPE.document */
extern T0* T145f5(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.parse_from_stream */
extern void T152f206(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.parse_with_events */
extern void T152f213(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.on_finish */
extern void T152f219(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.parse */
extern void T152f218(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yy_pop_last_value */
extern void T152f228(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.yy_push_error_value */
extern void T152f227(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [detachable ANY].force */
extern void T233f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [detachable ANY].fill_with */
extern void T234f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [detachable ANY].extend */
extern void T234f9(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [detachable ANY].aliased_resized_area */
extern T0* T233f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [detachable ANY].aliased_resized_area */
extern T0* T234f3(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.yy_do_action */
extern void T152f226(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.on_notation_declaration */
extern void T152f256(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_notation_declaration */
extern void T232f8(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.set_public */
extern void T242f5(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].aliased_resized_area */
extern T0* T241f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_EXTERNAL_ID].aliased_resized_area */
extern T0* T243f4(GE_context* ac, T0* C, T6 a1);
/* XM_DTD_EXTERNAL_ID.set_system */
extern void T242f4(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_dtd_external_id */
extern T0* T152f174(GE_context* ac, T0* C);
/* XM_DTD_EXTERNAL_ID.make */
extern T0* T242c3(GE_context* ac);
/* XM_EIFFEL_PARSER.when_pe_entity_declared */
extern void T152f255(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].force_new */
extern void T228f38(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_put */
extern void T228f52(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_put */
extern void T228f51(GE_context* ac, T0* C, T0* a1, T6 a2);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].force */
extern void T373f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].fill_with */
extern void T369f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].extend */
extern void T369f10(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_put */
extern void T228f50(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_put */
extern void T228f49(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_item */
extern T6 T228f28(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].hash_position */
extern T6 T228f27(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_item */
extern T6 T228f26(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].resize */
extern void T228f48(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_resize */
extern void T228f57(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].special_integer_ */
extern T0* T228f33(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_resize */
extern void T228f56(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_resize */
extern void T228f55(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].aliased_resized_area */
extern T0* T373f1(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].aliased_resized_area */
extern T0* T369f4(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_item */
extern T0* T228f23(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_resize */
extern void T228f54(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_modulus */
extern T6 T228f29(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_capacity */
extern T6 T228f24(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].unset_found_item */
extern void T228f43(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].has */
extern T1 T228f31(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].search_position */
extern void T228f40(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_def */
extern T0* T266c210(GE_context* ac, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_literal */
extern void T266f212(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.default_create */
extern T0* T230c3(GE_context* ac);
/* XM_EIFFEL_PE_ENTITY_DEF.make_scanner */
extern void T266f213(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T266f215(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset_sent */
extern void T266f218(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T266f215p1(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T266f215p0(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T266f215p2(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T266f215p3(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.make_with_buffer */
extern void T266f214(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_initialize */
extern void T266f216(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_initialize */
extern void T266f216p1(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_build_tables */
extern void T266f219(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template */
extern unsigned char ge1430os10832;
extern T0* ge1430ov10832;
extern T0* T266f54(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_fixed_array */
extern T0* T266f57(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].to_special */
extern T0* T96f4(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template_5 */
extern void T266f264(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_array_subcopy */
extern void T266f292(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* KL_ARRAY_ROUTINES [INTEGER_32].subcopy */
extern void T300f2(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* ARRAY [INTEGER_32].subcopy */
extern void T294f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER_32].copy_data */
extern void T88f12(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER_32].move_data */
extern void T88f13(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].overlapping_move */
extern void T88f15(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].non_overlapping_move */
extern void T88f14(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3);
/* XM_EIFFEL_PE_ENTITY_DEF.integer_array_ */
extern unsigned char ge31os4086;
extern T0* ge31ov4086;
extern T0* T266f59(GE_context* ac, T0* C);
/* KL_ARRAY_ROUTINES [INTEGER_32].default_create */
extern T0* T300c1(GE_context* ac);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template_4 */
extern void T266f263(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template_3 */
extern void T266f262(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template_2 */
extern void T266f261(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template_1 */
extern void T266f260(GE_context* ac, T0* C, T0* a1);
/* ARRAY [INTEGER_32].make_filled */
extern T0* T294c5(GE_context* ac, T6 a1, T6 a2, T6 a3);
/* ARRAY [INTEGER_32].make_filled_area */
extern void T294f6(GE_context* ac, T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_meta_template */
extern unsigned char ge1430os10831;
extern T0* ge1430ov10831;
extern T0* T266f52(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_ec_template */
extern unsigned char ge1430os10828;
extern T0* ge1430ov10828;
extern T0* T266f93(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_ec_template_2 */
extern void T266f232(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_ec_template_1 */
extern void T266f231(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template */
extern unsigned char ge1430os10822;
extern T0* ge1430ov10822;
extern T0* T266f71(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template_5 */
extern void T266f230(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template_4 */
extern void T266f229(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template_3 */
extern void T266f228(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template_2 */
extern void T266f227(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template_1 */
extern void T266f226(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template */
extern unsigned char ge1430os10816;
extern T0* ge1430ov10816;
extern T0* T266f61(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template_5 */
extern void T266f225(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template_4 */
extern void T266f224(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template_3 */
extern void T266f223(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template_2 */
extern void T266f222(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template_1 */
extern void T266f221(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template */
extern unsigned char ge1430os10788;
extern T0* ge1430ov10788;
extern T0* T266f55(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_27 */
extern void T266f291(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_26 */
extern void T266f290(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_25 */
extern void T266f289(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_24 */
extern void T266f288(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_23 */
extern void T266f287(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_22 */
extern void T266f286(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_21 */
extern void T266f285(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_20 */
extern void T266f284(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_19 */
extern void T266f283(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_18 */
extern void T266f282(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_17 */
extern void T266f281(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_16 */
extern void T266f280(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_15 */
extern void T266f279(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_14 */
extern void T266f278(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_13 */
extern void T266f277(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_12 */
extern void T266f276(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_11 */
extern void T266f275(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_10 */
extern void T266f274(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_9 */
extern void T266f273(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_8 */
extern void T266f272(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_7 */
extern void T266f271(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_6 */
extern void T266f270(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_5 */
extern void T266f269(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_4 */
extern void T266f268(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_3 */
extern void T266f267(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_2 */
extern void T266f266(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_1 */
extern void T266f265(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template */
extern unsigned char ge1430os10760;
extern T0* ge1430ov10760;
extern T0* T266f51(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_27 */
extern void T266f259(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_26 */
extern void T266f258(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_25 */
extern void T266f257(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_24 */
extern void T266f256(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_23 */
extern void T266f255(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_22 */
extern void T266f254(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_21 */
extern void T266f253(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_20 */
extern void T266f252(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_19 */
extern void T266f251(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_18 */
extern void T266f250(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_17 */
extern void T266f249(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_16 */
extern void T266f248(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_15 */
extern void T266f247(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_14 */
extern void T266f246(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_13 */
extern void T266f245(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_12 */
extern void T266f244(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_11 */
extern void T266f243(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_10 */
extern void T266f242(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_9 */
extern void T266f241(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_8 */
extern void T266f240(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_7 */
extern void T266f239(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_6 */
extern void T266f238(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_5 */
extern void T266f237(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_4 */
extern void T266f236(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_3 */
extern void T266f235(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_2 */
extern void T266f234(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_1 */
extern void T266f233(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.empty_buffer */
extern unsigned char ge2514os15076;
extern T0* ge2514ov15076;
extern T0* T266f53(GE_context* ac, T0* C);
/* YY_BUFFER.make */
extern T0* T361c12(GE_context* ac, T0* a1);
/* YY_BUFFER.make_from_buffer */
extern void T361f16(GE_context* ac, T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.fill_from_string */
extern void T449f8(GE_context* ac, T0* C, T0* a1, T6 a2);
/* YY_BUFFER.new_default_buffer */
extern T0* T361f11(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.make */
extern T0* T360c8(GE_context* ac);
/* XM_EIFFEL_PE_ENTITY_DEF.make_external */
extern void T266f211(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.new_external_entity */
extern T0* T152f173(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.make_external */
extern T0* T263c209(GE_context* ac, T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_scanner */
extern void T263f210(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T263f212(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T263f212p1(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T263f212p0(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T263f212p2(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.make_with_buffer */
extern void T263f211(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_initialize */
extern void T263f213(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_initialize */
extern void T263f213p1(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_build_tables */
extern void T263f215(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template */
extern T0* T263f52(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_fixed_array */
extern T0* T263f55(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template_5 */
extern void T263f260(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_array_subcopy */
extern void T263f288(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_ENTITY_DEF.integer_array_ */
extern T0* T263f57(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template_4 */
extern void T263f259(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template_3 */
extern void T263f258(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template_2 */
extern void T263f257(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template_1 */
extern void T263f256(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_meta_template */
extern T0* T263f50(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_ec_template */
extern T0* T263f90(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_ec_template_2 */
extern void T263f228(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_ec_template_1 */
extern void T263f227(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template */
extern T0* T263f69(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template_5 */
extern void T263f226(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template_4 */
extern void T263f225(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template_3 */
extern void T263f224(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template_2 */
extern void T263f223(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template_1 */
extern void T263f222(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template */
extern T0* T263f59(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template_5 */
extern void T263f221(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template_4 */
extern void T263f220(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template_3 */
extern void T263f219(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template_2 */
extern void T263f218(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template_1 */
extern void T263f217(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template */
extern T0* T263f53(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_27 */
extern void T263f287(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_26 */
extern void T263f286(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_25 */
extern void T263f285(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_24 */
extern void T263f284(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_23 */
extern void T263f283(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_22 */
extern void T263f282(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_21 */
extern void T263f281(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_20 */
extern void T263f280(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_19 */
extern void T263f279(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_18 */
extern void T263f278(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_17 */
extern void T263f277(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_16 */
extern void T263f276(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_15 */
extern void T263f275(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_14 */
extern void T263f274(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_13 */
extern void T263f273(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_12 */
extern void T263f272(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_11 */
extern void T263f271(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_10 */
extern void T263f270(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_9 */
extern void T263f269(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_8 */
extern void T263f268(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_7 */
extern void T263f267(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_6 */
extern void T263f266(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_5 */
extern void T263f265(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_4 */
extern void T263f264(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_3 */
extern void T263f263(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_2 */
extern void T263f262(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_1 */
extern void T263f261(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template */
extern T0* T263f49(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_27 */
extern void T263f255(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_26 */
extern void T263f254(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_25 */
extern void T263f253(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_24 */
extern void T263f252(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_23 */
extern void T263f251(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_22 */
extern void T263f250(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_21 */
extern void T263f249(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_20 */
extern void T263f248(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_19 */
extern void T263f247(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_18 */
extern void T263f246(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_17 */
extern void T263f245(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_16 */
extern void T263f244(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_15 */
extern void T263f243(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_14 */
extern void T263f242(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_13 */
extern void T263f241(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_12 */
extern void T263f240(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_11 */
extern void T263f239(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_10 */
extern void T263f238(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_9 */
extern void T263f237(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_8 */
extern void T263f236(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_7 */
extern void T263f235(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_6 */
extern void T263f234(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_5 */
extern void T263f233(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_4 */
extern void T263f232(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_3 */
extern void T263f231(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_2 */
extern void T263f230(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_1 */
extern void T263f229(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.empty_buffer */
extern T0* T263f65(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.on_entity_declaration */
extern void T152f254(GE_context* ac, T0* C, T0* a1, T1 a2, T0* a3, T0* a4, T0* a5);
/* XM_DTD_CALLBACKS_NULL.on_entity_declaration */
extern void T232f7(GE_context* ac, T0* C, T0* a1, T1 a2, T0* a3, T0* a4, T0* a5);
/* XM_EIFFEL_PARSER.when_entity_declared */
extern void T152f253(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.new_literal_entity */
extern T0* T152f172(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_literal */
extern T0* T263c208(GE_context* ac, T0* a1, T0* a2);
/* XM_DTD_ATTRIBUTE_CONTENT.set_default_value */
extern void T251f26(GE_context* ac, T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_fixed */
extern void T251f25(GE_context* ac, T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_implied */
extern void T251f24(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_required */
extern void T251f23(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].aliased_resized_area */
extern T0* T253f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].aliased_resized_area */
extern T0* T255f4(GE_context* ac, T0* C, T6 a1);
/* DS_BILINKED_LIST [STRING_8].force_last */
extern void T254f11(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [STRING_8].put_right */
extern void T382f5(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [STRING_8].attach_left */
extern void T382f6(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [STRING_8].make */
extern T0* T382c4(GE_context* ac, T0* a1);
/* XM_EIFFEL_PARSER.new_string_bilinked_list */
extern T0* T152f169(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [STRING_8].set_equality_tester */
extern void T254f12(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.string_equality_tester */
extern T0* T152f184(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [STRING_8].make */
extern T0* T254c10(GE_context* ac);
/* DS_BILINKED_LIST [STRING_8].set_internal_cursor */
extern void T254f13(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].new_cursor */
extern T0* T254f6(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].make */
extern T0* T381c8(GE_context* ac, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].force */
extern void T253f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].fill_with */
extern void T255f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].extend */
extern void T255f10(GE_context* ac, T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration_list */
extern void T251f22(GE_context* ac, T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration */
extern void T251f27(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.default_enumeration_list */
extern unsigned char ge1340os9590;
extern T0* ge1340ov9590;
extern T0* T251f11(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_notation */
extern void T251f21(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_token */
extern void T251f20(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_entity */
extern void T251f19(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_list_type */
extern void T251f18(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id_ref */
extern void T251f17(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id */
extern void T251f16(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_data */
extern void T251f15(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content */
extern T0* T152f168(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].aliased_resized_area */
extern T0* T250f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].aliased_resized_area */
extern T0* T252f4(GE_context* ac, T0* C, T6 a1);
/* XM_DTD_ATTRIBUTE_CONTENT.make */
extern T0* T251c12(GE_context* ac);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].force */
extern void T250f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].fill_with */
extern void T252f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].extend */
extern void T252f10(GE_context* ac, T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.copy_default */
extern void T251f14(GE_context* ac, T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_implied */
extern T1 T251f10(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_required */
extern T1 T251f9(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.has_default_value */
extern T1 T251f8(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_fixed */
extern T1 T251f7(GE_context* ac, T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_name */
extern void T251f13(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].force */
extern void T247f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].fill_with */
extern void T249f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].extend */
extern void T249f10(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].aliased_resized_area */
extern T0* T247f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].aliased_resized_area */
extern T0* T249f4(GE_context* ac, T0* C, T6 a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].force_last */
extern void T248f8(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].put_right */
extern void T380f5(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].attach_left */
extern void T380f6(GE_context* ac, T0* C, T0* a1);
/* detachable DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T380c4(GE_context* ac, T0* a1);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content_list */
extern T0* T152f166(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T248c7(GE_context* ac);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].set_internal_cursor */
extern void T248f9(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].new_cursor */
extern T0* T248f5(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T379c8(GE_context* ac, T0* a1);
/* XM_EIFFEL_PARSER.on_attribute_declarations */
extern void T152f252(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].forth */
extern void T379f10(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_forth */
extern void T248f11(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].add_traversing_cursor */
extern void T248f12(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set_next_cursor */
extern void T379f12(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].remove_traversing_cursor */
extern void T248f13(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set */
extern void T379f11(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* XM_EIFFEL_PARSER.on_attribute_declaration */
extern void T152f262(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_DTD_CALLBACKS_NULL.on_attribute_declaration */
extern void T232f9(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].item */
extern T0* T379f6(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].start */
extern void T379f9(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_start */
extern void T248f10(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_off */
extern T1 T248f6(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].off */
extern T1 T379f7(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_more */
extern void T245f11(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_mixed */
extern T0* T245c10(GE_context* ac);
/* XM_DTD_ELEMENT_CONTENT.set_content_mixed */
extern void T245f21(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_choice */
extern void T245f19(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_list */
extern void T245f16(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_default */
extern void T245f22(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one */
extern void T245f12(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_sequence */
extern void T245f20(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T378c6(GE_context* ac);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].set_internal_cursor */
extern void T378f9(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].new_cursor */
extern T0* T378f5(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T433c3(GE_context* ac, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_sequence */
extern T0* T245c9(GE_context* ac);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_last */
extern void T378f8(GE_context* ac, T0* C, T0* a1);
/* attached DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].put_right */
extern void T434f5(GE_context* ac, T0* C, T0* a1);
/* attached DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].attach_left */
extern void T434f6(GE_context* ac, T0* C, T0* a1);
/* attached DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T434c4(GE_context* ac, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_choice */
extern T0* T245c8(GE_context* ac);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_first */
extern void T378f7(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.element_name */
extern T0* T152f161(GE_context* ac, T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_name */
extern T0* T245c15(GE_context* ac, T0* a1);
/* XM_EIFFEL_PARSER.set_element_repetition */
extern void T152f251(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_one */
extern void T245f14(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one_or_more */
extern void T245f13(GE_context* ac, T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_any */
extern T0* T245c7(GE_context* ac);
/* XM_DTD_ELEMENT_CONTENT.set_content_any */
extern void T245f18(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].force */
extern void T244f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].fill_with */
extern void T246f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].extend */
extern void T246f10(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].aliased_resized_area */
extern T0* T244f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].aliased_resized_area */
extern T0* T246f4(GE_context* ac, T0* C, T6 a1);
/* XM_DTD_ELEMENT_CONTENT.make_empty */
extern T0* T245c6(GE_context* ac);
/* XM_DTD_ELEMENT_CONTENT.set_content_empty */
extern void T245f17(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.on_element_declaration */
extern void T152f250(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_element_declaration */
extern void T232f6(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_attribute */
extern void T152f249(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].has */
extern T1 T239f30(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].search_position */
extern void T239f33(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].hash_position */
extern T6 T239f24(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.hash_code */
extern T6 T236f16(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.item */
extern T0* T236f17(GE_context* ac, T0* C, T6 a1);
/* DS_BILINKED_LIST [STRING_8].item */
extern T0* T254f8(GE_context* ac, T0* C, T6 a1);
/* detachable KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].test */
extern T1 T376f1(GE_context* ac, T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_storage_item */
extern T0* T239f19(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_item */
extern T0* T239f29(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_item */
extern T6 T239f23(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_equality_tester */
extern T0* T239f17(GE_context* ac, T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_item */
extern T6 T239f25(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].force */
extern void T238f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].fill_with */
extern void T240f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].extend */
extern void T240f10(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].aliased_resized_area */
extern T0* T238f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].aliased_resized_area */
extern T0* T240f4(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].force_new */
extern void T239f32(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_put */
extern void T239f39(GE_context* ac, T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_put */
extern void T239f38(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_put */
extern void T239f37(GE_context* ac, T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].resize */
extern void T239f36(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_resize */
extern void T239f48(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].special_integer_ */
extern T0* T239f28(GE_context* ac, T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_storage_resize */
extern void T239f47(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_resize */
extern void T239f46(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_resize */
extern void T239f45(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_modulus */
extern T6 T239f20(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_capacity */
extern T6 T239f26(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].unset_found_item */
extern void T239f35(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.new_name_set */
extern T0* T152f154(GE_context* ac, T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_equal */
extern T0* T239c31(GE_context* ac, T6 a1);
/* detachable KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T376c2(GE_context* ac);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make */
extern void T239f34(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].set_internal_cursor */
extern void T239f44(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_cursor */
extern T0* T239f21(GE_context* ac, T0* C);
/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME].make */
extern T0* T377c4(GE_context* ac, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_slots */
extern void T239f43(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_clashes */
extern void T239f42(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_key_storage */
extern void T239f41(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_item_storage */
extern void T239f40(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].make */
extern T0* T235f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].make_empty */
extern T0* T237c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T235c3(GE_context* ac);
/* XM_EIFFEL_PARSER.on_start_tag */
extern void T152f248(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER.on_end_tag */
extern void T152f247(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER_NAME.local_part */
extern T0* T236f11(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].forth */
extern void T381f10(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [STRING_8].cursor_forth */
extern void T254f15(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].add_traversing_cursor */
extern void T254f16(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T381f12(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].remove_traversing_cursor */
extern void T254f17(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].set */
extern void T381f11(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [STRING_8].item */
extern T0* T381f6(GE_context* ac, T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].start */
extern void T381f9(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [STRING_8].cursor_start */
extern void T254f14(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].cursor_off */
extern T1 T254f9(GE_context* ac, T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].off */
extern T1 T381f7(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.string_ */
extern T0* T236f10(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.last */
extern T0* T236f9(GE_context* ac, T0* C);
/* DS_BILINKED_LIST [STRING_8].last */
extern T0* T254f7(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.ns_prefix */
extern T0* T236f8(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.is_namespace_name */
extern T1 T236f7(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern void T236f18(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern T0* T236c18(GE_context* ac);
/* XM_EIFFEL_PARSER_NAME.new_string_bilinked_list */
extern T0* T236f15(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.string_equality_tester */
extern T0* T236f14(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.on_start_tag_finish */
extern void T152f246(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.is_equal */
extern T1 T236f6(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.same_string */
extern T1 T236f13(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_SPECIAL_ROUTINES [BOOLEAN].force */
extern void T256f4(GE_context* ac, T0* C, T0* a1, T1 a2, T6 a3);
/* KL_SPECIAL_ROUTINES [BOOLEAN].aliased_resized_area */
extern T0* T256f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [BOOLEAN].aliased_resized_area */
extern T0* T89f4(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.when_external_dtd */
extern void T152f245(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern T0* T264c201(GE_context* ac);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern void T264f201p1(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T264f210(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T264f210p1(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T264f210p0(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_with_buffer */
extern void T264f209(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_initialize */
extern void T264f219(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_initialize */
extern void T264f219p1(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_build_tables */
extern void T264f224(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template */
extern T0* T264f195(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_fixed_array */
extern T0* T264f198(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template_5 */
extern void T264f295(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_array_subcopy */
extern void T264f296(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_SCANNER_DTD.integer_array_ */
extern T0* T264f200(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template_4 */
extern void T264f294(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template_3 */
extern void T264f293(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template_2 */
extern void T264f292(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template_1 */
extern void T264f291(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_meta_template */
extern T0* T264f194(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_ec_template */
extern T0* T264f193(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_ec_template_2 */
extern void T264f290(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_ec_template_1 */
extern void T264f289(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template */
extern T0* T264f192(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template_5 */
extern void T264f288(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template_4 */
extern void T264f287(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template_3 */
extern void T264f286(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template_2 */
extern void T264f285(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template_1 */
extern void T264f284(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template */
extern T0* T264f191(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template_5 */
extern void T264f283(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template_4 */
extern void T264f282(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template_3 */
extern void T264f281(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template_2 */
extern void T264f280(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template_1 */
extern void T264f279(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template */
extern T0* T264f190(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_27 */
extern void T264f278(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_26 */
extern void T264f277(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_25 */
extern void T264f276(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_24 */
extern void T264f275(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_23 */
extern void T264f274(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_22 */
extern void T264f273(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_21 */
extern void T264f272(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_20 */
extern void T264f271(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_19 */
extern void T264f270(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_18 */
extern void T264f269(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_17 */
extern void T264f268(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_16 */
extern void T264f267(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_15 */
extern void T264f266(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_14 */
extern void T264f265(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_13 */
extern void T264f264(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_12 */
extern void T264f263(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_11 */
extern void T264f262(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_10 */
extern void T264f261(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_9 */
extern void T264f260(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_8 */
extern void T264f259(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_7 */
extern void T264f258(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_6 */
extern void T264f257(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_5 */
extern void T264f256(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_4 */
extern void T264f255(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_3 */
extern void T264f254(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_2 */
extern void T264f253(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_1 */
extern void T264f252(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template */
extern T0* T264f189(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_27 */
extern void T264f251(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_26 */
extern void T264f250(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_25 */
extern void T264f249(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_24 */
extern void T264f248(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_23 */
extern void T264f247(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_22 */
extern void T264f246(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_21 */
extern void T264f245(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_20 */
extern void T264f244(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_19 */
extern void T264f243(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_18 */
extern void T264f242(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_17 */
extern void T264f241(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_16 */
extern void T264f240(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_15 */
extern void T264f239(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_14 */
extern void T264f238(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_13 */
extern void T264f237(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_12 */
extern void T264f236(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_11 */
extern void T264f235(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_10 */
extern void T264f234(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_9 */
extern void T264f233(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_8 */
extern void T264f232(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_7 */
extern void T264f231(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_6 */
extern void T264f230(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_5 */
extern void T264f229(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_4 */
extern void T264f228(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_3 */
extern void T264f227(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_2 */
extern void T264f226(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_1 */
extern void T264f225(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.empty_buffer */
extern T0* T264f50(GE_context* ac, T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].force */
extern void T227f8(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.null_resolver */
extern unsigned char ge1428os10142;
extern T0* ge1428ov10142;
extern T0* T152f94(GE_context* ac, T0* C);
/* XM_NULL_EXTERNAL_RESOLVER.last_error */
extern T0* T230f1(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.resolve_external_id */
extern void T152f261(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.resolve */
extern void T230f5(GE_context* ac, T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_public */
extern void T230f4(GE_context* ac, T0* C, T0* a1, T0* a2);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].force */
extern void T241f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_DTD_EXTERNAL_ID].fill_with */
extern void T243f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_EXTERNAL_ID].extend */
extern void T243f10(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_dtd_end */
extern void T152f244(GE_context* ac, T0* C);
/* XM_DTD_CALLBACKS_NULL.on_dtd_end */
extern void T232f5(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.on_doctype */
extern void T152f243(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* XM_DTD_CALLBACKS_NULL.on_doctype */
extern void T232f4(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* XM_EIFFEL_DECLARATION.set_encoding */
extern void T258f9(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_DECLARATION.set_stand_alone */
extern void T258f8(GE_context* ac, T0* C, T1 a1);
/* XM_EIFFEL_DECLARATION.set_version */
extern void T258f11(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].force */
extern void T257f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_EIFFEL_DECLARATION].fill_with */
extern void T259f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_DECLARATION].extend */
extern void T259f10(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].aliased_resized_area */
extern T0* T257f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_DECLARATION].aliased_resized_area */
extern T0* T259f4(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_DECLARATION.make */
extern T0* T258c7(GE_context* ac);
/* XM_EIFFEL_DECLARATION.process */
extern void T258f10(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_xml_declaration */
extern void T152f287(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3);
/* XM_EIFFEL_PARSER.apply_encoding */
extern void T152f242(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_content */
extern void T152f241(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_dtd_processing_instruction */
extern void T152f240(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_dtd_processing_instruction */
extern void T232f3(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_processing_instruction */
extern void T152f239(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_dtd_comment */
extern void T152f238(GE_context* ac, T0* C, T0* a1);
/* XM_DTD_CALLBACKS_NULL.on_dtd_comment */
extern void T232f2(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_comment */
extern void T152f237(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.entity_referenced_in_entity_value */
extern T0* T152f144(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.defined_entity_referenced */
extern T0* T152f196(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.external_entity_to_string */
extern T0* T152f202(GE_context* ac, T0* C, T0* a1);
/* STRING_8.remove */
extern void T17f56(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_INPUT_STREAM.read_string */
extern void T297f29(GE_context* ac, T0* C, T6 a1);
/* KL_PLATFORM.maximum_integer */
extern unsigned char ge110os15558;
extern T6 ge110ov15558;
extern T6 T299f2(GE_context* ac, T0* C);
/* KL_INTEGER_ROUTINES.platform */
extern T0* T298f1(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.integer_ */
extern T0* T152f203(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item */
extern T0* T228f21(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_item */
extern T0* T228f35(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.force_error */
extern void T152f236(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.report_error */
extern void T152f234(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_error */
extern void T152f260(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.setup_error_state */
extern void T152f259(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.onstring_utf8 */
extern T0* T152f133(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.maximum_item_code */
extern T6 T152f191(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_latin1 */
extern T1 T152f190(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_from_utf8 */
extern T0* T152f186(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_STRING.make_from_utf8 */
extern T0* T296c57(GE_context* ac, T0* a1);
/* UC_UTF8_STRING.append_utf8 */
extern void T296f71(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_ROUTINES.valid_utf8 */
extern T1 T295f1(GE_context* ac, T0* C, T0* a1);
/* UC_UTF8_ROUTINES.is_encoded_next_byte */
extern T1 T295f10(GE_context* ac, T0* C, T2 a1);
/* UC_UTF8_ROUTINES.is_encoded_second_byte */
extern T1 T295f5(GE_context* ac, T0* C, T2 a1, T2 a2);
/* UC_UTF8_ROUTINES.is_encoded_first_byte */
extern T1 T295f2(GE_context* ac, T0* C, T2 a1);
/* XM_EIFFEL_PARSER.utf8 */
extern T0* T152f189(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.is_string_mode_ascii */
extern T1 T152f187(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.onstring_ascii */
extern T0* T152f131(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_unicode */
extern T1 T152f185(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string */
extern T0* T152f142(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_string */
extern unsigned char ge1428os10209;
extern T0* ge1428ov10209;
extern T0* T152f195(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_uc */
extern unsigned char ge1428os10210;
extern T0* ge1428ov10210;
extern T0* T152f194(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_empty */
extern T0* T152f201(GE_context* ac, T0* C);
/* UC_UTF8_STRING.make_empty */
extern T0* T296c61(GE_context* ac);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].force */
extern void T235f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].fill_with */
extern void T237f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].extend */
extern void T237f10(GE_context* ac, T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].aliased_resized_area */
extern T0* T235f2(GE_context* ac, T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].aliased_resized_area */
extern T0* T237f4(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.namespace_force_last */
extern void T152f235(GE_context* ac, T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER_NAME.force_last */
extern void T236f19(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.can_force_last */
extern T1 T236f12(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_namespace_name */
extern T0* T152f141(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER_NAME.make_namespaces */
extern T0* T236c20(GE_context* ac);
/* XM_EIFFEL_PARSER.yy_push_last_value */
extern void T152f225(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.accept */
extern void T152f224(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yy_do_error_action */
extern void T152f222(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.report_eof_expected_error */
extern void T152f233(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.read_token */
extern void T152f221(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.process_attribute_entity */
extern void T152f232(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_entity_scanner */
extern void T152f258(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.apply_input_buffer */
extern void T263f289(GE_context* ac, T0* C);
/* KL_STRING_INPUT_STREAM.make */
extern T0* T441c9(GE_context* ac, T0* a1);
/* UC_UTF8_ROUTINES.to_utf8 */
extern T0* T295f32(GE_context* ac, T0* C, T0* a1);
extern T1 T295f32ot1(T0* a1, T0** a2);
/* XM_EIFFEL_ENTITY_DEF.utf8 */
extern T0* T263f68(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.apply_input_buffer */
extern void T266f293(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.utf8 */
extern T0* T266f70(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.process_entity */
extern void T152f231(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_pe_entity */
extern void T152f230(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.special_integer_ */
extern T0* T152f124(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yy_init_value_stacks */
extern void T152f220(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yy_clear_all */
extern void T152f229(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.clear_all */
extern void T152f257(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.clear_stacks */
extern void T152f263(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yy_clear_value_stacks */
extern void T152f264(GE_context* ac, T0* C);
/* SPECIAL [XM_EIFFEL_DECLARATION].keep_head */
extern void T259f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_DECLARATION].set_count */
extern void T259f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [BOOLEAN].keep_head */
extern void T89f11(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [BOOLEAN].set_count */
extern void T89f12(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].keep_head */
extern void T255f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].set_count */
extern void T255f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].keep_head */
extern void T252f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].set_count */
extern void T252f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].keep_head */
extern void T249f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].set_count */
extern void T249f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].keep_head */
extern void T246f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].set_count */
extern void T246f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].keep_head */
extern void T243f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].set_count */
extern void T243f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].keep_head */
extern void T240f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].set_count */
extern void T240f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].keep_head */
extern void T237f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].set_count */
extern void T237f9(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [detachable ANY].keep_head */
extern void T234f5(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [detachable ANY].set_count */
extern void T234f8(GE_context* ac, T0* C, T6 a1);
/* XM_EIFFEL_PARSER.abort */
extern void T152f223(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.on_start */
extern void T152f217(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.reset_error_state */
extern void T152f216(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.reset */
extern void T152f212(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].wipe_out */
extern void T228f37(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_wipe_out */
extern void T228f47(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_wipe_out */
extern void T228f46(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_wipe_out */
extern void T228f45(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_wipe_out */
extern void T228f44(GE_context* ac, T0* C);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].keep_head */
extern void T369f6(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].set_count */
extern void T369f9(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].move_all_cursors_after */
extern void T228f42(GE_context* ac, T0* C);
/* detachable DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].set_next_cursor */
extern void T372f8(GE_context* ac, T0* C, T0* a1);
/* detachable DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].set_after */
extern void T372f7(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.make_scanner */
extern void T152f210(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.make_scanner */
extern T0* T223c199(GE_context* ac);
/* XM_EIFFEL_SCANNER.reset */
extern void T223f207(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.reset */
extern void T223f207p1(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.reset */
extern void T223f207p0(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.make_with_buffer */
extern void T223f206(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_initialize */
extern void T223f214(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_initialize */
extern void T223f214p1(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_build_tables */
extern void T223f222(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_accept_template */
extern T0* T223f193(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_fixed_array */
extern T0* T223f196(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_accept_template_5 */
extern void T223f293(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_array_subcopy */
extern void T223f294(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_SCANNER.integer_array_ */
extern T0* T223f198(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_accept_template_4 */
extern void T223f292(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_accept_template_3 */
extern void T223f291(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_accept_template_2 */
extern void T223f290(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_accept_template_1 */
extern void T223f289(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_meta_template */
extern T0* T223f192(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_ec_template */
extern T0* T223f191(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_ec_template_2 */
extern void T223f288(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_ec_template_1 */
extern void T223f287(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_def_template */
extern T0* T223f190(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_def_template_5 */
extern void T223f286(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_def_template_4 */
extern void T223f285(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_def_template_3 */
extern void T223f284(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_def_template_2 */
extern void T223f283(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_def_template_1 */
extern void T223f282(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_base_template */
extern T0* T223f189(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_base_template_5 */
extern void T223f281(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_base_template_4 */
extern void T223f280(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_base_template_3 */
extern void T223f279(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_base_template_2 */
extern void T223f278(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_base_template_1 */
extern void T223f277(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template */
extern T0* T223f188(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_27 */
extern void T223f276(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_26 */
extern void T223f275(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_25 */
extern void T223f274(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_24 */
extern void T223f273(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_23 */
extern void T223f272(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_22 */
extern void T223f271(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_21 */
extern void T223f270(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_20 */
extern void T223f269(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_19 */
extern void T223f268(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_18 */
extern void T223f267(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_17 */
extern void T223f266(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_16 */
extern void T223f265(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_15 */
extern void T223f264(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_14 */
extern void T223f263(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_13 */
extern void T223f262(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_12 */
extern void T223f261(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_11 */
extern void T223f260(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_10 */
extern void T223f259(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_9 */
extern void T223f258(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_8 */
extern void T223f257(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_7 */
extern void T223f256(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_6 */
extern void T223f255(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_5 */
extern void T223f254(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_4 */
extern void T223f253(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_3 */
extern void T223f252(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_2 */
extern void T223f251(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_1 */
extern void T223f250(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template */
extern T0* T223f187(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.yy_nxt_template_27 */
extern void T223f249(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_26 */
extern void T223f248(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_25 */
extern void T223f247(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_24 */
extern void T223f246(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_23 */
extern void T223f245(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_22 */
extern void T223f244(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_21 */
extern void T223f243(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_20 */
extern void T223f242(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_19 */
extern void T223f241(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_18 */
extern void T223f240(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_17 */
extern void T223f239(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_16 */
extern void T223f238(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_15 */
extern void T223f237(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_14 */
extern void T223f236(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_13 */
extern void T223f235(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_12 */
extern void T223f234(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_11 */
extern void T223f233(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_10 */
extern void T223f232(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_9 */
extern void T223f231(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_8 */
extern void T223f230(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_7 */
extern void T223f229(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_6 */
extern void T223f228(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_5 */
extern void T223f227(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_4 */
extern void T223f226(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_3 */
extern void T223f225(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_2 */
extern void T223f224(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_1 */
extern void T223f223(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.empty_buffer */
extern T0* T223f70(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T126f42(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.is_closed */
extern T1 T126f17(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.old_open_read */
extern void T126f46(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T126f46p1(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.file_open */
extern T14 T126f23(GE_context* ac, T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.internal_name_pointer */
extern T0* T126f22(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.old_is_readable */
extern T1 T126f16(GE_context* ac, T0* C);
/* FILE_INFO.is_readable */
extern T1 T157f8(GE_context* ac, T0* C);
/* FILE_INFO.file_eaccess */
extern T1 T157f6(GE_context* ac, T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.buffered_file_info */
extern T0* T126f26(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.set_buffer */
extern void T126f50(GE_context* ac, T0* C);
/* FILE_INFO.fast_update */
extern void T157f16(GE_context* ac, T0* C, T0* a1, T0* a2);
/* FILE_INFO.eif_file_stat */
extern T6 T157f12(GE_context* ac, T0* C, T14 a1, T14 a2, T1 a3);
/* KL_TEXT_INPUT_FILE.old_exists */
extern T1 T126f15(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.file_exists */
extern T1 T126f27(GE_context* ac, T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.string_name */
extern T0* T126f12(GE_context* ac, T0* C);
/* KL_TEXT_INPUT_FILE.make */
extern T0* T126c40(GE_context* ac, T0* a1);
/* KL_TEXT_INPUT_FILE.make */
extern void T126f40p1(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.old_make */
extern void T126f44(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.make_with_name */
extern void T126f47(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.set_name */
extern void T126f49(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.string_ */
extern T0* T126f25(GE_context* ac, T0* C);
/* ET_XACE_PARSER.make_with_variables */
extern T0* T131c256(GE_context* ac, T0* a1, T0* a2);
/* ET_XACE_PARSER.make_with_variables_and_factory */
extern void T131f258(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_PARSER.create_library_parser */
extern void T131f259(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_CONFIG_PARSER.set_parsed_libraries */
extern void T129f257(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.make_with_variables_and_factory */
extern void T129f256(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_CONFIG_PARSER.make_with_variables_and_factory */
extern T0* T129c256(GE_context* ac, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_CONFIG_PARSER.create_library_parser */
extern void T129f258(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.enable_position_table */
extern void T147f10(GE_context* ac, T0* C, T0* a1);
/* XM_POSITION_TABLE.make */
extern T0* T143c4(GE_context* ac);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T292c7(GE_context* ac);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].set_internal_cursor */
extern void T292f8(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.set_callbacks */
extern void T152f208(GE_context* ac, T0* C, T0* a1);
/* XM_TREE_CALLBACKS_PIPE.make */
extern T0* T145c10(GE_context* ac);
/* XM_TREE_CALLBACKS_PIPE.callbacks_pipe */
extern T0* T145f9(GE_context* ac, T0* C, T0* a1);
/* ARRAY [XM_CALLBACKS_FILTER].item */
extern T0* T210f4(GE_context* ac, T0* C, T6 a1);
/* XM_CALLBACKS_TO_TREE_FILTER.make_null */
extern T0* T147c9(GE_context* ac);
/* XM_CALLBACKS_TO_TREE_FILTER.make_next */
extern void T147f11(GE_context* ac, T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.null_callbacks */
extern T0* T147f7(GE_context* ac, T0* C);
/* XM_CALLBACKS_NULL.make */
extern T0* T212c1(GE_context* ac);
/* XM_TREE_CALLBACKS_PIPE.new_stop_on_error */
extern T0* T145f7(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.make_null */
extern T0* T146c5(GE_context* ac);
/* XM_STOP_ON_ERROR_FILTER.make_next */
extern void T146f6(GE_context* ac, T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.initialize */
extern void T146f7(GE_context* ac, T0* C);
/* XM_STOP_ON_ERROR_FILTER.null_callbacks */
extern T0* T146f4(GE_context* ac, T0* C);
/* XM_TREE_CALLBACKS_PIPE.new_namespace_resolver */
extern T0* T145f6(GE_context* ac, T0* C);
/* XM_NAMESPACE_RESOLVER.make_null */
extern T0* T209c26(GE_context* ac);
/* XM_NAMESPACE_RESOLVER.make_next */
extern void T209f37(GE_context* ac, T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.null_callbacks */
extern T0* T209f13(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.set_string_mode_mixed */
extern void T152f207(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.make */
extern T0* T152c205(GE_context* ac);
/* XM_EIFFEL_PARSER.new_entities_table */
extern T0* T152f91(GE_context* ac, T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].set_key_equality_tester */
extern void T228f39(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_map_default */
extern T0* T228c36(GE_context* ac);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_map */
extern void T228f41(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_with_equality_testers */
extern void T228f53(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_sparse_container */
extern void T228f58(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].set_internal_cursor */
extern void T228f63(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_cursor */
extern T0* T228f34(GE_context* ac, T0* C);
/* detachable DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T372c6(GE_context* ac, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_slots */
extern void T228f62(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_clashes */
extern void T228f61(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_key_storage */
extern void T228f60(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_item_storage */
extern void T228f59(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T373f2(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].make_empty */
extern T0* T369c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].default_create */
extern T0* T373c3(GE_context* ac);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].default_capacity */
extern T6 T228f30(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.make_parser */
extern void T152f211(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yy_build_parser_tables */
extern void T152f215(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yycheck_template */
extern unsigned char ge1424os10084;
extern T0* ge1424ov10084;
extern T0* T152f88(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yyfixed_array */
extern T0* T152f183(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yycheck_template_4 */
extern void T152f272(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yyarray_subcopy */
extern void T152f286(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_PARSER.integer_array_ */
extern T0* T152f204(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yycheck_template_3 */
extern void T152f271(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yycheck_template_2 */
extern void T152f270(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yycheck_template_1 */
extern void T152f269(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytable_template */
extern unsigned char ge1424os10079;
extern T0* ge1424ov10079;
extern T0* T152f86(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yytable_template_4 */
extern void T152f268(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytable_template_3 */
extern void T152f267(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytable_template_2 */
extern void T152f266(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytable_template_1 */
extern void T152f265(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yypgoto_template */
extern unsigned char ge1424os10078;
extern T0* ge1424ov10078;
extern T0* T152f84(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yypact_template */
extern unsigned char ge1424os10074;
extern T0* ge1424ov10074;
extern T0* T152f129(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yypact_template_3 */
extern void T152f285(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yypact_template_2 */
extern void T152f284(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yypact_template_1 */
extern void T152f283(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yydefgoto_template */
extern unsigned char ge1424os10073;
extern T0* ge1424ov10073;
extern T0* T152f127(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yydefact_template */
extern unsigned char ge1424os10069;
extern T0* ge1424ov10069;
extern T0* T152f125(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yydefact_template_3 */
extern void T152f282(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yydefact_template_2 */
extern void T152f281(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yydefact_template_1 */
extern void T152f280(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytypes2_template */
extern unsigned char ge1424os10068;
extern T0* ge1424ov10068;
extern T0* T152f123(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yytypes1_template */
extern unsigned char ge1424os10064;
extern T0* ge1424ov10064;
extern T0* T152f121(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yytypes1_template_3 */
extern void T152f279(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytypes1_template_2 */
extern void T152f278(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytypes1_template_1 */
extern void T152f277(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yyr1_template */
extern unsigned char ge1424os10061;
extern T0* ge1424ov10061;
extern T0* T152f119(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yyr1_template_2 */
extern void T152f276(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yyr1_template_1 */
extern void T152f275(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytranslate_template */
extern unsigned char ge1424os10058;
extern T0* ge1424ov10058;
extern T0* T152f106(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.yytranslate_template_2 */
extern void T152f274(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytranslate_template_1 */
extern void T152f273(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yy_create_value_stacks */
extern void T152f214(GE_context* ac, T0* C);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].make */
extern T0* T257f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_DECLARATION].make_empty */
extern T0* T259c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].default_create */
extern T0* T257c3(GE_context* ac);
/* KL_SPECIAL_ROUTINES [BOOLEAN].make */
extern T0* T256f1(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].default_create */
extern T0* T256c3(GE_context* ac);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].make */
extern T0* T253f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].make_empty */
extern T0* T255c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].default_create */
extern T0* T253c3(GE_context* ac);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T250f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make_empty */
extern T0* T252c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].default_create */
extern T0* T250c3(GE_context* ac);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T247f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make_empty */
extern T0* T249c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].default_create */
extern T0* T247c3(GE_context* ac);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T244f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].make_empty */
extern T0* T246c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].default_create */
extern T0* T244c3(GE_context* ac);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].make */
extern T0* T241f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].make_empty */
extern T0* T243c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].default_create */
extern T0* T241c3(GE_context* ac);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T238f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make_empty */
extern T0* T240c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].default_create */
extern T0* T238c3(GE_context* ac);
/* KL_SPECIAL_ROUTINES [detachable ANY].make */
extern T0* T233f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [detachable ANY].make_empty */
extern T0* T234c4(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [detachable ANY].default_create */
extern T0* T233c3(GE_context* ac);
/* XM_EIFFEL_PARSER.initialize */
extern void T152f209(GE_context* ac, T0* C);
/* XM_EIFFEL_PARSER.null_dtd_callbacks */
extern T0* T152f112(GE_context* ac, T0* C);
/* XM_DTD_CALLBACKS_NULL.make */
extern T0* T232c1(GE_context* ac);
/* XM_EIFFEL_PARSER.null_callbacks */
extern T0* T152f104(GE_context* ac, T0* C);
/* XM_EXPAT_PARSER_FACTORY.new_expat_parser */
extern T0* T151f2(GE_context* ac, T0* C);
/* XM_EXPAT_PARSER_FACTORY.is_expat_parser_available */
extern T1 T151f1(GE_context* ac, T0* C);
/* XM_EXPAT_PARSER_FACTORY.default_create */
extern T0* T151c3(GE_context* ac);
/* ET_XACE_VALIDATOR.make */
extern T0* T148c30(GE_context* ac, T0* a1);
/* ET_XACE_PREPROCESSOR.make */
extern T0* T149c10(GE_context* ac, T0* a1, T0* a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].set_key_equality_tester */
extern void T150f37(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_map */
extern T0* T150c35(GE_context* ac, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_with_equality_testers */
extern void T150f38(GE_context* ac, T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_sparse_container */
extern void T150f45(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].set_internal_cursor */
extern void T150f50(GE_context* ac, T0* C, T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].new_cursor */
extern T0* T150f29(GE_context* ac, T0* C);
/* detachable DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8].make */
extern T0* T220c6(GE_context* ac, T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_slots */
extern void T150f49(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_clashes */
extern void T150f48(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_key_storage */
extern void T150f47(GE_context* ac, T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_item_storage */
extern void T150f46(GE_context* ac, T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY_CONFIG].make */
extern T0* T222f1(GE_context* ac, T0* C, T6 a1);
/* SPECIAL [ET_XACE_LIBRARY_CONFIG].make_empty */
extern T0* T221c5(GE_context* ac, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY_CONFIG].default_create */
extern T0* T222c3(GE_context* ac);
/* ET_XACE_AST_FACTORY.make */
extern T0* T140c10(GE_context* ac);
/* GEXACE_LIBRARY_COMMAND.execute */
extern void T47f15(GE_context* ac, T0* C);
/* GEXACE_LIBRARY_COMMAND.execute_generators */
extern void T47f16(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].forth */
extern void T106f10(GE_context* ac, T0* C);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].cursor_forth */
extern void T53f12(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].add_traversing_cursor */
extern void T53f13(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].set_next_cursor */
extern void T106f12(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].remove_traversing_cursor */
extern void T53f14(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].set */
extern void T106f11(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_cannot_write_file_error */
extern void T35f17(GE_context* ac, T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.make */
extern T0* T137c8(GE_context* ac, T0* a1);
/* KL_TEXT_OUTPUT_FILE.close */
extern void T128f28(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.is_open_write */
extern T1 T128f14(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
extern T1 T128f8(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T128f27(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.is_closed */
extern T1 T128f13(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_write */
extern void T128f31(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T128f31p1(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.file_open */
extern T14 T128f19(GE_context* ac, T0* C, T14 a1, T6 a2);
/* KL_TEXT_OUTPUT_FILE.internal_name_pointer */
extern T0* T128f18(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.string_name */
extern T0* T128f12(GE_context* ac, T0* C);
/* KL_TEXT_OUTPUT_FILE.make */
extern T0* T128c25(GE_context* ac, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_make */
extern void T128f29(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.make_with_name */
extern void T128f32(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.set_name */
extern void T128f34(GE_context* ac, T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.buffered_file_info */
extern T0* T128f23(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].item */
extern T0* T106f6(GE_context* ac, T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].start */
extern void T106f9(GE_context* ac, T0* C);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].cursor_start */
extern void T53f11(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].cursor_off */
extern T1 T53f7(GE_context* ac, T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].off */
extern T1 T106f7(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.parse_file */
extern void T129f255(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.new_library */
extern T0* T129f12(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_CONFIG_PARSER.tokens */
extern T0* T129f14(GE_context* ac, T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.set_ve */
extern void T129f254(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.set_shallow */
extern void T129f253(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.make_with_variables */
extern T0* T129c252(GE_context* ac, T0* a1, T0* a2);
/* GEXACE_SYSTEM_COMMAND.execute */
extern void T43f15(GE_context* ac, T0* C);
/* GEXACE_SYSTEM_COMMAND.execute_generators */
extern void T43f16(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG_PARSER.parse_file */
extern void T124f257(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG_PARSER.new_system */
extern T0* T124f12(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.fill_system */
extern void T124f260(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
extern T1 T124f260ot1(T0* a1, T0** a2);
extern T1 T124f260ot2(T0* a1, T0** a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.fill_externals */
extern void T124f262(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
extern T1 T124f262ot1(T0* a1, T0** a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.new_export */
extern T0* T124f145(GE_context* ac, T0* C, T0* a1, T0* a2);
extern T1 T124f145ot1(T0* a1, T0** a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.new_exported_feature */
extern T0* T124f251(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_alias */
extern T0* T124f253(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_feature */
extern T0* T124f250(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_export */
extern T0* T124f144(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_include_dir */
extern T0* T124f143(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_location */
extern T0* T124f142(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_link_library */
extern T0* T124f141(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_external */
extern T0* T124f27(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.new_options */
extern T0* T124f26(GE_context* ac, T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.fill_options */
extern void T124f261(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
extern T1 T124f261ot1(T0* a1, T0** a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_debug */
extern T0* T124f140(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_optimize */
extern T0* T124f139(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_check */
extern T0* T124f137(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_loop */
extern T0* T124f134(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_invariant */
extern T0* T124f132(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_ensure */
extern T0* T124f130(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_enable */
extern T0* T124f128(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_require */
extern T0* T124f127(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.is_false */
extern T1 T124f126(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG_PARSER.is_true */
extern T1 T124f125(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG_PARSER.option_codes */
extern T0* T124f29(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.string_equality_tester */
extern T0* T124f13(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_value */
extern T0* T124f28(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_option */
extern T0* T124f25(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.new_mount */
extern T0* T124f24(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_prefix */
extern T0* T124f148(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.execution_environment */
extern T0* T124f150(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_mount */
extern T0* T124f23(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.new_cluster */
extern T0* T124f22(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
extern T1 T124f22ot1(T0* a1, T0** a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.new_class */
extern T0* T124f149(GE_context* ac, T0* C, T0* a1, T0* a2);
extern T1 T124f149ot1(T0* a1, T0** a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.new_feature */
extern T0* T124f252(GE_context* ac, T0* C, T0* a1, T0* a2);
extern T1 T124f252ot1(T0* a1, T0** a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_relative */
extern T0* T124f147(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_abstract */
extern T0* T124f146(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_cluster */
extern T0* T124f20(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.string_ */
extern T0* T124f19(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_creation */
extern T0* T124f18(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_class */
extern T0* T124f17(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_root */
extern T0* T124f16(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_name */
extern T0* T124f15(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.tokens */
extern T0* T124f14(GE_context* ac, T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.set_ve */
extern void T124f256(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_SYSTEM_CONFIG_PARSER.set_shallow */
extern void T124f255(GE_context* ac, T0* C, T1 a1);
/* ET_XACE_SYSTEM_CONFIG_PARSER.make_with_variables */
extern T0* T124c254(GE_context* ac, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.make_with_variables_and_factory */
extern void T124f258(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_SYSTEM_CONFIG_PARSER.create_library_parser */
extern void T124f259(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3);
/* GEXACE_VALIDATE_COMMAND.set_xace_filename */
extern void T48f8(GE_context* ac, T0* C, T0* a1);
/* GEXACE_LIBRARY_COMMAND.set_xace_filename */
extern void T47f14(GE_context* ac, T0* C, T0* a1);
/* GEXACE_SYSTEM_COMMAND.set_xace_filename */
extern void T43f14(GE_context* ac, T0* C, T0* a1);
/* SERIALIZATION_FAILURE.set_throwing_exception */
extern void T85f7(GE_context* ac, T0* C, T0* a1);
/* ADDRESS_APPLIED_TO_MELTED_FEATURE.set_throwing_exception */
extern void T84f7(GE_context* ac, T0* C, T0* a1);
/* DEVELOPER_EXCEPTION.set_throwing_exception */
extern void T83f11(GE_context* ac, T0* C, T0* a1);
/* MISMATCH_FAILURE.set_throwing_exception */
extern void T82f7(GE_context* ac, T0* C, T0* a1);
/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE.set_throwing_exception */
extern void T81f7(GE_context* ac, T0* C, T0* a1);
/* VOID_ASSIGNED_TO_EXPANDED.set_throwing_exception */
extern void T80f7(GE_context* ac, T0* C, T0* a1);
/* EXTERNAL_FAILURE.set_throwing_exception */
extern void T79f7(GE_context* ac, T0* C, T0* a1);
/* CREATE_ON_DEFERRED.set_throwing_exception */
extern void T78f7(GE_context* ac, T0* C, T0* a1);
/* RESUMPTION_FAILURE.set_throwing_exception */
extern void T77f7(GE_context* ac, T0* C, T0* a1);
/* RESCUE_FAILURE.set_throwing_exception */
extern void T76f7(GE_context* ac, T0* C, T0* a1);
/* LOOP_INVARIANT_VIOLATION.set_throwing_exception */
extern void T75f7(GE_context* ac, T0* C, T0* a1);
/* VARIANT_VIOLATION.set_throwing_exception */
extern void T74f7(GE_context* ac, T0* C, T0* a1);
/* BAD_INSPECT_VALUE.set_throwing_exception */
extern void T73f7(GE_context* ac, T0* C, T0* a1);
/* CHECK_VIOLATION.set_throwing_exception */
extern void T72f7(GE_context* ac, T0* C, T0* a1);
/* FLOATING_POINT_FAILURE.set_throwing_exception */
extern void T71f7(GE_context* ac, T0* C, T0* a1);
/* POSTCONDITION_VIOLATION.set_throwing_exception */
extern void T70f7(GE_context* ac, T0* C, T0* a1);
/* PRECONDITION_VIOLATION.set_throwing_exception */
extern void T69f7(GE_context* ac, T0* C, T0* a1);
/* EIFFEL_RUNTIME_PANIC.set_throwing_exception */
extern void T66f10(GE_context* ac, T0* C, T0* a1);
/* COM_FAILURE.set_throwing_exception */
extern void T65f13(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_FAILURE.set_throwing_exception */
extern void T64f8(GE_context* ac, T0* C, T0* a1);
/* IO_FAILURE.set_throwing_exception */
extern void T63f10(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_SIGNAL_FAILURE.set_throwing_exception */
extern void T62f8(GE_context* ac, T0* C, T0* a1);
/* INVARIANT_VIOLATION.set_throwing_exception */
extern void T61f8(GE_context* ac, T0* C, T0* a1);
/* NO_MORE_MEMORY.set_throwing_exception */
extern void T60f11(GE_context* ac, T0* C, T0* a1);
/* OLD_VIOLATION.set_throwing_exception */
extern void T58f7(GE_context* ac, T0* C, T0* a1);
/* ROUTINE_FAILURE.set_throwing_exception */
extern void T56f11(GE_context* ac, T0* C, T0* a1);
/* VOID_TARGET.set_throwing_exception */
extern void T54f7(GE_context* ac, T0* C, T0* a1);
/* SERIALIZATION_FAILURE.set_exception_trace */
extern void T85f8(GE_context* ac, T0* C, T0* a1);
/* ADDRESS_APPLIED_TO_MELTED_FEATURE.set_exception_trace */
extern void T84f8(GE_context* ac, T0* C, T0* a1);
/* DEVELOPER_EXCEPTION.set_exception_trace */
extern void T83f12(GE_context* ac, T0* C, T0* a1);
/* MISMATCH_FAILURE.set_exception_trace */
extern void T82f8(GE_context* ac, T0* C, T0* a1);
/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE.set_exception_trace */
extern void T81f8(GE_context* ac, T0* C, T0* a1);
/* VOID_ASSIGNED_TO_EXPANDED.set_exception_trace */
extern void T80f8(GE_context* ac, T0* C, T0* a1);
/* EXTERNAL_FAILURE.set_exception_trace */
extern void T79f8(GE_context* ac, T0* C, T0* a1);
/* CREATE_ON_DEFERRED.set_exception_trace */
extern void T78f8(GE_context* ac, T0* C, T0* a1);
/* RESUMPTION_FAILURE.set_exception_trace */
extern void T77f8(GE_context* ac, T0* C, T0* a1);
/* RESCUE_FAILURE.set_exception_trace */
extern void T76f8(GE_context* ac, T0* C, T0* a1);
/* LOOP_INVARIANT_VIOLATION.set_exception_trace */
extern void T75f8(GE_context* ac, T0* C, T0* a1);
/* VARIANT_VIOLATION.set_exception_trace */
extern void T74f8(GE_context* ac, T0* C, T0* a1);
/* BAD_INSPECT_VALUE.set_exception_trace */
extern void T73f8(GE_context* ac, T0* C, T0* a1);
/* CHECK_VIOLATION.set_exception_trace */
extern void T72f8(GE_context* ac, T0* C, T0* a1);
/* FLOATING_POINT_FAILURE.set_exception_trace */
extern void T71f8(GE_context* ac, T0* C, T0* a1);
/* POSTCONDITION_VIOLATION.set_exception_trace */
extern void T70f8(GE_context* ac, T0* C, T0* a1);
/* PRECONDITION_VIOLATION.set_exception_trace */
extern void T69f8(GE_context* ac, T0* C, T0* a1);
/* EIFFEL_RUNTIME_PANIC.set_exception_trace */
extern void T66f11(GE_context* ac, T0* C, T0* a1);
/* COM_FAILURE.set_exception_trace */
extern void T65f16(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_FAILURE.set_exception_trace */
extern void T64f10(GE_context* ac, T0* C, T0* a1);
/* IO_FAILURE.set_exception_trace */
extern void T63f12(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_SIGNAL_FAILURE.set_exception_trace */
extern void T62f10(GE_context* ac, T0* C, T0* a1);
/* INVARIANT_VIOLATION.set_exception_trace */
extern void T61f10(GE_context* ac, T0* C, T0* a1);
/* NO_MORE_MEMORY.set_exception_trace */
extern void T60f9(GE_context* ac, T0* C, T0* a1);
/* OLD_VIOLATION.set_exception_trace */
extern void T58f8(GE_context* ac, T0* C, T0* a1);
/* ROUTINE_FAILURE.set_exception_trace */
extern void T56f12(GE_context* ac, T0* C, T0* a1);
/* VOID_TARGET.set_exception_trace */
extern void T54f8(GE_context* ac, T0* C, T0* a1);
/* SERIALIZATION_FAILURE.set_description */
extern void T85f9(GE_context* ac, T0* C, T0* a1);
/* C_STRING.set_count */
extern void T111f8(GE_context* ac, T0* C, T6 a1);
/* UTF_CONVERTER.utf_32_string_into_utf_8_0_pointer */
extern void T109f9(GE_context* ac, T109* C, T0* a1, T0* a2, T6 a3, T0* a4);
/* ADDRESS_APPLIED_TO_MELTED_FEATURE.set_description */
extern void T84f9(GE_context* ac, T0* C, T0* a1);
/* DEVELOPER_EXCEPTION.set_description */
extern void T83f13(GE_context* ac, T0* C, T0* a1);
/* MISMATCH_FAILURE.set_description */
extern void T82f9(GE_context* ac, T0* C, T0* a1);
/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE.set_description */
extern void T81f9(GE_context* ac, T0* C, T0* a1);
/* VOID_ASSIGNED_TO_EXPANDED.set_description */
extern void T80f9(GE_context* ac, T0* C, T0* a1);
/* EXTERNAL_FAILURE.set_description */
extern void T79f9(GE_context* ac, T0* C, T0* a1);
/* CREATE_ON_DEFERRED.set_description */
extern void T78f9(GE_context* ac, T0* C, T0* a1);
/* RESUMPTION_FAILURE.set_description */
extern void T77f9(GE_context* ac, T0* C, T0* a1);
/* RESCUE_FAILURE.set_description */
extern void T76f9(GE_context* ac, T0* C, T0* a1);
/* LOOP_INVARIANT_VIOLATION.set_description */
extern void T75f9(GE_context* ac, T0* C, T0* a1);
/* VARIANT_VIOLATION.set_description */
extern void T74f9(GE_context* ac, T0* C, T0* a1);
/* BAD_INSPECT_VALUE.set_description */
extern void T73f9(GE_context* ac, T0* C, T0* a1);
/* CHECK_VIOLATION.set_description */
extern void T72f9(GE_context* ac, T0* C, T0* a1);
/* FLOATING_POINT_FAILURE.set_description */
extern void T71f9(GE_context* ac, T0* C, T0* a1);
/* POSTCONDITION_VIOLATION.set_description */
extern void T70f9(GE_context* ac, T0* C, T0* a1);
/* PRECONDITION_VIOLATION.set_description */
extern void T69f9(GE_context* ac, T0* C, T0* a1);
/* EIFFEL_RUNTIME_PANIC.set_description */
extern void T66f12(GE_context* ac, T0* C, T0* a1);
/* COM_FAILURE.set_description */
extern void T65f17(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_FAILURE.set_description */
extern void T64f11(GE_context* ac, T0* C, T0* a1);
/* IO_FAILURE.set_description */
extern void T63f13(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_SIGNAL_FAILURE.set_description */
extern void T62f11(GE_context* ac, T0* C, T0* a1);
/* INVARIANT_VIOLATION.set_description */
extern void T61f11(GE_context* ac, T0* C, T0* a1);
/* NO_MORE_MEMORY.set_description */
extern void T60f12(GE_context* ac, T0* C, T0* a1);
/* OLD_VIOLATION.set_description */
extern void T58f9(GE_context* ac, T0* C, T0* a1);
/* ROUTINE_FAILURE.set_description */
extern void T56f13(GE_context* ac, T0* C, T0* a1);
/* VOID_TARGET.set_description */
extern void T54f9(GE_context* ac, T0* C, T0* a1);
/* SERIALIZATION_FAILURE.set_recipient_name */
extern void T85f10(GE_context* ac, T0* C, T0* a1);
/* ADDRESS_APPLIED_TO_MELTED_FEATURE.set_recipient_name */
extern void T84f10(GE_context* ac, T0* C, T0* a1);
/* DEVELOPER_EXCEPTION.set_recipient_name */
extern void T83f14(GE_context* ac, T0* C, T0* a1);
/* MISMATCH_FAILURE.set_recipient_name */
extern void T82f10(GE_context* ac, T0* C, T0* a1);
/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE.set_recipient_name */
extern void T81f10(GE_context* ac, T0* C, T0* a1);
/* VOID_ASSIGNED_TO_EXPANDED.set_recipient_name */
extern void T80f10(GE_context* ac, T0* C, T0* a1);
/* EXTERNAL_FAILURE.set_recipient_name */
extern void T79f10(GE_context* ac, T0* C, T0* a1);
/* CREATE_ON_DEFERRED.set_recipient_name */
extern void T78f10(GE_context* ac, T0* C, T0* a1);
/* RESUMPTION_FAILURE.set_recipient_name */
extern void T77f10(GE_context* ac, T0* C, T0* a1);
/* RESCUE_FAILURE.set_recipient_name */
extern void T76f10(GE_context* ac, T0* C, T0* a1);
/* LOOP_INVARIANT_VIOLATION.set_recipient_name */
extern void T75f10(GE_context* ac, T0* C, T0* a1);
/* VARIANT_VIOLATION.set_recipient_name */
extern void T74f10(GE_context* ac, T0* C, T0* a1);
/* BAD_INSPECT_VALUE.set_recipient_name */
extern void T73f10(GE_context* ac, T0* C, T0* a1);
/* CHECK_VIOLATION.set_recipient_name */
extern void T72f10(GE_context* ac, T0* C, T0* a1);
/* FLOATING_POINT_FAILURE.set_recipient_name */
extern void T71f10(GE_context* ac, T0* C, T0* a1);
/* POSTCONDITION_VIOLATION.set_recipient_name */
extern void T70f10(GE_context* ac, T0* C, T0* a1);
/* PRECONDITION_VIOLATION.set_recipient_name */
extern void T69f10(GE_context* ac, T0* C, T0* a1);
/* EIFFEL_RUNTIME_PANIC.set_recipient_name */
extern void T66f13(GE_context* ac, T0* C, T0* a1);
/* COM_FAILURE.set_recipient_name */
extern void T65f18(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_FAILURE.set_recipient_name */
extern void T64f12(GE_context* ac, T0* C, T0* a1);
/* IO_FAILURE.set_recipient_name */
extern void T63f14(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_SIGNAL_FAILURE.set_recipient_name */
extern void T62f12(GE_context* ac, T0* C, T0* a1);
/* INVARIANT_VIOLATION.set_recipient_name */
extern void T61f12(GE_context* ac, T0* C, T0* a1);
/* NO_MORE_MEMORY.set_recipient_name */
extern void T60f13(GE_context* ac, T0* C, T0* a1);
/* OLD_VIOLATION.set_recipient_name */
extern void T58f10(GE_context* ac, T0* C, T0* a1);
/* ROUTINE_FAILURE.set_recipient_name */
extern void T56f14(GE_context* ac, T0* C, T0* a1);
/* VOID_TARGET.set_recipient_name */
extern void T54f10(GE_context* ac, T0* C, T0* a1);
/* SERIALIZATION_FAILURE.set_type_name */
extern void T85f11(GE_context* ac, T0* C, T0* a1);
/* ADDRESS_APPLIED_TO_MELTED_FEATURE.set_type_name */
extern void T84f11(GE_context* ac, T0* C, T0* a1);
/* DEVELOPER_EXCEPTION.set_type_name */
extern void T83f15(GE_context* ac, T0* C, T0* a1);
/* MISMATCH_FAILURE.set_type_name */
extern void T82f11(GE_context* ac, T0* C, T0* a1);
/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE.set_type_name */
extern void T81f11(GE_context* ac, T0* C, T0* a1);
/* VOID_ASSIGNED_TO_EXPANDED.set_type_name */
extern void T80f11(GE_context* ac, T0* C, T0* a1);
/* EXTERNAL_FAILURE.set_type_name */
extern void T79f11(GE_context* ac, T0* C, T0* a1);
/* CREATE_ON_DEFERRED.set_type_name */
extern void T78f11(GE_context* ac, T0* C, T0* a1);
/* RESUMPTION_FAILURE.set_type_name */
extern void T77f11(GE_context* ac, T0* C, T0* a1);
/* RESCUE_FAILURE.set_type_name */
extern void T76f11(GE_context* ac, T0* C, T0* a1);
/* LOOP_INVARIANT_VIOLATION.set_type_name */
extern void T75f11(GE_context* ac, T0* C, T0* a1);
/* VARIANT_VIOLATION.set_type_name */
extern void T74f11(GE_context* ac, T0* C, T0* a1);
/* BAD_INSPECT_VALUE.set_type_name */
extern void T73f11(GE_context* ac, T0* C, T0* a1);
/* CHECK_VIOLATION.set_type_name */
extern void T72f11(GE_context* ac, T0* C, T0* a1);
/* FLOATING_POINT_FAILURE.set_type_name */
extern void T71f11(GE_context* ac, T0* C, T0* a1);
/* POSTCONDITION_VIOLATION.set_type_name */
extern void T70f11(GE_context* ac, T0* C, T0* a1);
/* PRECONDITION_VIOLATION.set_type_name */
extern void T69f11(GE_context* ac, T0* C, T0* a1);
/* EIFFEL_RUNTIME_PANIC.set_type_name */
extern void T66f14(GE_context* ac, T0* C, T0* a1);
/* COM_FAILURE.set_type_name */
extern void T65f19(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_FAILURE.set_type_name */
extern void T64f13(GE_context* ac, T0* C, T0* a1);
/* IO_FAILURE.set_type_name */
extern void T63f15(GE_context* ac, T0* C, T0* a1);
/* OPERATING_SYSTEM_SIGNAL_FAILURE.set_type_name */
extern void T62f13(GE_context* ac, T0* C, T0* a1);
/* INVARIANT_VIOLATION.set_type_name */
extern void T61f13(GE_context* ac, T0* C, T0* a1);
/* NO_MORE_MEMORY.set_type_name */
extern void T60f14(GE_context* ac, T0* C, T0* a1);
/* OLD_VIOLATION.set_type_name */
extern void T58f11(GE_context* ac, T0* C, T0* a1);
/* ROUTINE_FAILURE.set_type_name */
extern void T56f15(GE_context* ac, T0* C, T0* a1);
/* VOID_TARGET.set_type_name */
extern void T54f11(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.error_position */
extern T0* T266f60(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.error_position */
extern T0* T264f56(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.error_position */
extern T0* T263f58(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.error_position */
extern T0* T223f66(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.end_of_file */
extern T1 T266f62(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.end_of_file */
extern T1 T264f63(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.end_of_file */
extern T1 T263f60(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.end_of_file */
extern T1 T223f68(GE_context* ac, T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_applicable_encoding */
extern T1 T266f63(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_applicable_encoding */
extern T1 T297f16(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_valid_encoding */
extern T1 T297f9(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.is_applicable_encoding */
extern T1 T264f49(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.is_applicable_encoding */
extern T1 T263f61(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.is_applicable_encoding */
extern T1 T223f69(GE_context* ac, T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.start_condition */
extern T6 T266f64(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER_DTD.start_condition */
extern T6 T264f51(GE_context* ac, T0* C);
/* XM_EIFFEL_ENTITY_DEF.start_condition */
extern T6 T263f62(GE_context* ac, T0* C);
/* XM_EIFFEL_SCANNER.start_condition */
extern T6 T223f44(GE_context* ac, T0* C);
/* ET_XACE_ECF_GENERATOR.default_system_output_filename */
extern unsigned char ge1251os4105;
extern T0* ge1251ov4105;
extern T0* T52f5(GE_context* ac, T0* C);
/* ET_XACE_ACE_GENERATOR.default_system_output_filename */
extern unsigned char ge1250os4105;
extern T0* ge1250ov4105;
extern T0* T51f5(GE_context* ac, T0* C);
/* ET_XACE_XACE_GENERATOR.default_system_output_filename */
extern unsigned char ge1253os4105;
extern T0* ge1253ov4105;
extern T0* T50f5(GE_context* ac, T0* C);
/* ET_XACE_ECF_GENERATOR.default_library_output_filename */
extern unsigned char ge1251os4106;
extern T0* ge1251ov4106;
extern T0* T52f6(GE_context* ac, T0* C);
/* ET_XACE_ACE_GENERATOR.default_library_output_filename */
extern unsigned char ge1250os4106;
extern T0* ge1250ov4106;
extern T0* T51f6(GE_context* ac, T0* C);
/* ET_XACE_XACE_GENERATOR.default_library_output_filename */
extern unsigned char ge1253os4106;
extern T0* ge1253ov4106;
extern T0* T50f6(GE_context* ac, T0* C);
/* ET_XACE_INVALID_EXPRESSION_ERROR.default_message */
extern T0* T384f5(GE_context* ac, T0* C);
/* ET_XACE_INVALID_EXPRESSION_ERROR.message */
extern T0* T384f3(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_INVALID_EXPRESSION_ERROR.arguments */
extern T0* T384f6(GE_context* ac, T0* C);
/* ARRAY [STRING_8].valid_index */
extern T1 T105f4(GE_context* ac, T0* C, T6 a1);
/* ET_XACE_INVALID_EXPRESSION_ERROR.string_ */
extern T0* T384f4(GE_context* ac, T0* C);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.default_message */
extern T0* T383f5(GE_context* ac, T0* C);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.message */
extern T0* T383f3(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.arguments */
extern T0* T383f6(GE_context* ac, T0* C);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.string_ */
extern T0* T383f4(GE_context* ac, T0* C);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.default_message */
extern T0* T280f5(GE_context* ac, T0* C);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.message */
extern T0* T280f3(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.arguments */
extern T0* T280f6(GE_context* ac, T0* C);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.string_ */
extern T0* T280f4(GE_context* ac, T0* C);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.default_message */
extern T0* T279f5(GE_context* ac, T0* C);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.message */
extern T0* T279f3(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.arguments */
extern T0* T279f6(GE_context* ac, T0* C);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.string_ */
extern T0* T279f4(GE_context* ac, T0* C);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.default_message */
extern T0* T278f5(GE_context* ac, T0* C);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.message */
extern T0* T278f3(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.arguments */
extern T0* T278f6(GE_context* ac, T0* C);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.string_ */
extern T0* T278f4(GE_context* ac, T0* C);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.default_message */
extern T0* T277f5(GE_context* ac, T0* C);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.message */
extern T0* T277f3(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.arguments */
extern T0* T277f6(GE_context* ac, T0* C);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.string_ */
extern T0* T277f4(GE_context* ac, T0* C);
/* ET_XACE_MISSING_ELEMENT_ERROR.default_message */
extern T0* T276f5(GE_context* ac, T0* C);
/* ET_XACE_MISSING_ELEMENT_ERROR.message */
extern T0* T276f3(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_MISSING_ELEMENT_ERROR.arguments */
extern T0* T276f6(GE_context* ac, T0* C);
/* ET_XACE_MISSING_ELEMENT_ERROR.string_ */
extern T0* T276f4(GE_context* ac, T0* C);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.default_message */
extern T0* T275f5(GE_context* ac, T0* C);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.message */
extern T0* T275f3(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.arguments */
extern T0* T275f6(GE_context* ac, T0* C);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.string_ */
extern T0* T275f4(GE_context* ac, T0* C);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.default_message */
extern T0* T274f5(GE_context* ac, T0* C);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.message */
extern T0* T274f3(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.arguments */
extern T0* T274f6(GE_context* ac, T0* C);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.string_ */
extern T0* T274f4(GE_context* ac, T0* C);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.default_message */
extern T0* T273f5(GE_context* ac, T0* C);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.message */
extern T0* T273f3(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.arguments */
extern T0* T273f6(GE_context* ac, T0* C);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.string_ */
extern T0* T273f4(GE_context* ac, T0* C);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.default_message */
extern T0* T272f5(GE_context* ac, T0* C);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.message */
extern T0* T272f3(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.arguments */
extern T0* T272f6(GE_context* ac, T0* C);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.string_ */
extern T0* T272f4(GE_context* ac, T0* C);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.default_message */
extern T0* T271f5(GE_context* ac, T0* C);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.message */
extern T0* T271f3(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.arguments */
extern T0* T271f6(GE_context* ac, T0* C);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.default_message */
extern T0* T270f5(GE_context* ac, T0* C);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.message */
extern T0* T270f3(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.arguments */
extern T0* T270f6(GE_context* ac, T0* C);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.string_ */
extern T0* T270f4(GE_context* ac, T0* C);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.default_message */
extern T0* T269f5(GE_context* ac, T0* C);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.message */
extern T0* T269f3(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.arguments */
extern T0* T269f6(GE_context* ac, T0* C);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.string_ */
extern T0* T269f4(GE_context* ac, T0* C);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.default_message */
extern T0* T268f5(GE_context* ac, T0* C);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.message */
extern T0* T268f3(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.arguments */
extern T0* T268f6(GE_context* ac, T0* C);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.string_ */
extern T0* T268f4(GE_context* ac, T0* C);
/* ET_XACE_NOT_XACE_FILE_ERROR.default_message */
extern T0* T161f5(GE_context* ac, T0* C);
/* ET_XACE_NOT_XACE_FILE_ERROR.message */
extern T0* T161f3(GE_context* ac, T0* C, T0* a1);
/* ET_XACE_NOT_XACE_FILE_ERROR.arguments */
extern T0* T161f6(GE_context* ac, T0* C);
/* ET_XACE_NOT_XACE_FILE_ERROR.string_ */
extern T0* T161f4(GE_context* ac, T0* C);
/* UT_MESSAGE.default_message */
extern T0* T160f5(GE_context* ac, T0* C);
/* UT_MESSAGE.message */
extern T0* T160f3(GE_context* ac, T0* C, T0* a1);
/* UT_MESSAGE.arguments */
extern T0* T160f6(GE_context* ac, T0* C);
/* UT_MESSAGE.string_ */
extern T0* T160f4(GE_context* ac, T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
extern T0* T137f5(GE_context* ac, T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
extern T0* T137f3(GE_context* ac, T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.arguments */
extern T0* T137f6(GE_context* ac, T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
extern T0* T137f4(GE_context* ac, T0* C);
/* UT_CANNOT_READ_FILE_ERROR.default_message */
extern T0* T136f5(GE_context* ac, T0* C);
/* UT_CANNOT_READ_FILE_ERROR.message */
extern T0* T136f3(GE_context* ac, T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.arguments */
extern T0* T136f6(GE_context* ac, T0* C);
/* UT_CANNOT_READ_FILE_ERROR.string_ */
extern T0* T136f4(GE_context* ac, T0* C);
/* UT_USAGE_MESSAGE.default_message */
extern T0* T41f3(GE_context* ac, T0* C);
/* UT_USAGE_MESSAGE.message */
extern T0* T41f5(GE_context* ac, T0* C, T0* a1);
/* UT_USAGE_MESSAGE.arguments */
extern T0* T41f7(GE_context* ac, T0* C);
/* UT_USAGE_MESSAGE.string_ */
extern T0* T41f6(GE_context* ac, T0* C);
extern T0* GE_ma294(T6 c, T6 n, ...);
extern T0* GE_ma105(T6 c, T6 n, ...);
extern T0* GE_ma210(T6 c, T6 n, ...);
extern T0* GE_mt27(T6 a1, T6 a2, T6 a3, T0* a4, T0* a5, T0* a6, T0* a7, T0* a8, T0* a9, T6 a10, T1 a11);
extern T0* ge78ov3910;
extern T0* ge132ov5971;
extern T0* ge142ov6026;
extern T0* ge42ov2812;
extern T0* ge1270ov3916;
extern T0* ge4ov3028;
extern T0* ge4ov3029;
extern T0* ge1432ov14933;
extern T0* ge1432ov14934;
extern T0* ge66ov8472;
extern T0* ge1423ov15292;
extern T0* ge1423ov15294;
extern T0* ge1375ov9324;
extern T0* ge1355ov9844;
extern T0* ge1355ov9843;
extern T0* ge1227ov4356;
extern T0* ge1227ov4369;
extern T0* ge1227ov4373;
extern T0* ge1227ov4347;
extern T0* ge1227ov4377;
extern T0* ge1227ov4358;
extern T0* ge1227ov4351;
extern T0* ge1227ov4363;
extern T0* ge1227ov4365;
extern T0* ge1227ov4364;
extern T0* ge1227ov4378;
extern T0* ge83ov12099;
extern T0* ge1227ov4360;
extern T0* ge1227ov4348;
extern T0* ge1227ov4355;
extern T0* ge1227ov4371;
extern T0* ge1227ov4357;
extern T0* ge1227ov4359;
extern T0* ge1227ov4372;
extern T0* ge169ov3910;
extern T0* ge1227ov4361;
extern T0* ge1227ov4349;
extern T0* ge1227ov4362;
extern T0* ge1418ov8372;
extern T0* ge1418ov8371;
extern T0* ge1258ov6612;
extern T0* ge1227ov4376;
extern T0* ge1227ov4354;
extern T0* ge1227ov4353;
extern T0* ge1227ov4368;
extern T0* ge1227ov4370;
extern T0* ge1227ov4375;
extern T0* ge1227ov4367;
extern T0* ge1227ov4374;
extern T0* ge1227ov4350;
extern T0* ge1227ov4366;
extern T0* ge1227ov4352;
extern T0* ge1227ov4380;
extern T0* ge1258ov6611;
extern T0* ge1258ov6610;
extern T0* ge1227ov4154;
extern T0* ge1227ov4155;
extern T0* ge1227ov4156;
extern T0* ge1227ov4157;
extern T0* ge1227ov4158;
extern T0* ge1227ov4159;
extern T0* ge1227ov4160;
extern T0* ge1227ov4161;
extern T0* ge1227ov4162;
extern T0* ge1227ov4163;
extern T0* ge1227ov4164;
extern T0* ge1227ov4165;
extern T0* ge1227ov4166;
extern T0* ge1227ov4167;
extern T0* ge1227ov4168;
extern T0* ge1227ov4169;
extern T0* ge1227ov4170;
extern T0* ge1227ov4171;
extern T0* ge1227ov4172;
extern T0* ge1227ov4173;
extern T0* ge1227ov4174;
extern T0* ge1227ov4175;
extern T0* ge1227ov4176;
extern T0* ge1227ov4177;
extern T0* ge1227ov4178;
extern T0* ge1227ov4179;
extern T0* ge1227ov4180;
extern T0* ge1227ov4181;
extern T0* ge1227ov4182;
extern T0* ge1227ov4183;
extern T0* ge1227ov4184;
extern T0* ge1227ov4185;
extern T0* ge1227ov4186;
extern T0* ge1227ov4187;
extern T0* ge1227ov4188;
extern T0* ge1227ov4189;
extern T0* ge1227ov4190;
extern T0* ge1227ov4191;
extern T0* ge1227ov4192;
extern T0* ge1227ov4193;
extern T0* ge1227ov4194;
extern T0* ge1227ov4195;
extern T0* ge1227ov4196;
extern T0* ge1227ov4197;
extern T0* ge1227ov4198;
extern T0* ge1227ov4199;
extern T0* ge1227ov4200;
extern T0* ge1227ov4201;
extern T0* ge1227ov4202;
extern T0* ge1227ov4203;
extern T0* ge1227ov4204;
extern T0* ge1227ov4205;
extern T0* ge1227ov4206;
extern T0* ge1227ov4207;
extern T0* ge1227ov4208;
extern T0* ge1227ov4209;
extern T0* ge1227ov4210;
extern T0* ge1227ov4211;
extern T0* ge1227ov4212;
extern T0* ge1227ov4213;
extern T0* ge1227ov4214;
extern T0* ge1227ov4215;
extern T0* ge1227ov4216;
extern T0* ge1227ov4217;
extern T0* ge1227ov4218;
extern T0* ge1227ov4219;
extern T0* ge1227ov4220;
extern T0* ge1227ov4221;
extern T0* ge1227ov4222;
extern T0* ge1227ov4223;
extern T0* ge1227ov4224;
extern T0* ge1227ov4225;
extern T0* ge1227ov4226;
extern T0* ge1227ov4227;
extern T0* ge1227ov4228;
extern T0* ge1227ov4229;
extern T0* ge1227ov4230;
extern T0* ge1227ov4231;
extern T0* ge1227ov4232;
extern T0* ge1227ov4233;
extern T0* ge1227ov4234;
extern T0* ge1227ov4235;
extern T0* ge1227ov4236;
extern T0* ge1227ov4237;
extern T0* ge1227ov4238;
extern T0* ge1227ov4239;
extern T0* ge1227ov4240;
extern T0* ge1227ov4241;
extern T0* ge1227ov4242;
extern T0* ge1227ov4243;
extern T0* ge1227ov4244;
extern T0* ge1227ov4245;
extern T0* ge1227ov4246;
extern T0* ge1227ov4247;
extern T0* ge1227ov4248;
extern T0* ge1227ov4249;
extern T0* ge69ov3910;
extern T0* ge1217ov5119;
extern T0* ge905ov7148;
extern T0* ge905ov7147;
extern T0* ge905ov7132;
extern T0* ge905ov7169;
extern T0* ge905ov7124;
extern T0* ge905ov7126;
extern T0* ge905ov7173;
extern T0* ge905ov7172;
extern T0* ge905ov7165;
extern T0* ge905ov7164;
extern T0* ge905ov7160;
extern T0* ge905ov7159;
extern T0* ge905ov7137;
extern T0* ge905ov7171;
extern T0* ge905ov7158;
extern T0* ge905ov7155;
extern T0* ge905ov7153;
extern T0* ge905ov7152;
extern T0* ge905ov7143;
extern T0* ge905ov7141;
extern T0* ge905ov7140;
extern T0* ge905ov7127;
extern T0* ge905ov7505;
extern T0* ge905ov7494;
extern T0* ge905ov7175;
extern T0* ge905ov7622;
extern T0* ge905ov7606;
extern T0* ge905ov7174;
extern T0* ge905ov7130;
extern T0* ge905ov7166;
extern T0* ge905ov7167;
extern T0* ge905ov7619;
extern T0* ge905ov7620;
extern T0* ge905ov7161;
extern T0* ge905ov7162;
extern T0* ge905ov7613;
extern T0* ge905ov7616;
extern T0* ge905ov7151;
extern T0* ge905ov7154;
extern T0* ge905ov7608;
extern T0* ge905ov7611;
extern T0* ge905ov7139;
extern T0* ge905ov7142;
extern T0* ge905ov7607;
extern T0* ge905ov7621;
extern T0* ge905ov7133;
extern T0* ge905ov7163;
extern T0* ge905ov7604;
extern T0* ge905ov7605;
extern T0* ge905ov7128;
extern T0* ge905ov7129;
extern T0* ge905ov7476;
extern T0* ge905ov7522;
extern T0* ge905ov7501;
extern T0* ge905ov7170;
extern T0* ge905ov7518;
extern T0* ge905ov7168;
extern T0* ge905ov7156;
extern T0* ge905ov7145;
extern T0* ge905ov7135;
extern T0* ge905ov7134;
extern T0* ge905ov7542;
extern T0* ge1223ov4150;
extern T0* ge1425ov10454;
extern T0* ge1425ov10416;
extern T0* ge1425ov10414;
extern T0* ge1425ov10455;
extern T0* ge1425ov10427;
extern T0* ge1425ov10426;
extern T0* ge1425ov10437;
extern T0* ge1425ov10431;
extern T0* ge1425ov10430;
extern T0* ge1425ov10429;
extern T0* ge1425ov10435;
extern T0* ge1425ov10434;
extern T0* ge1425ov10436;
extern T0* ge1425ov10413;
extern T0* ge1425ov10439;
extern T0* ge1425ov10448;
extern T0* ge1428ov10184;
extern T0* ge1428ov10182;
extern T0* ge1428ov10183;
extern T0* ge1425ov10449;
extern T0* ge1425ov10450;
extern T0* ge1425ov10453;
extern T0* ge1425ov10451;
extern T0* ge1425ov10452;
extern T0* ge1425ov10446;
extern T0* ge1421ov10869;
extern T0* ge1421ov10870;
extern T0* ge1425ov10419;
extern T0* ge1425ov10442;
extern T0* ge1425ov10462;
extern T0* ge1425ov10463;
extern T0* ge1425ov10464;
extern T0* ge1425ov10457;
extern T0* ge1425ov10440;
extern T0* ge1425ov10441;
extern T0* ge1425ov10443;
extern T0* ge1425ov10447;
extern T0* ge64ov8493;
extern T0* ge1423ov15291;
extern T0* ge1423ov15293;
extern T0* ge1236ov3914;
extern T0* ge1230ov3914;
extern T0* ge1246ov3914;
extern T0* ge1243ov3914;
extern T0* ge1245ov3914;
extern T0* ge1242ov3914;
extern T0* ge1238ov3914;
extern T0* ge1237ov3914;
extern T0* ge1249ov3914;
extern T0* ge1233ov3914;
extern T0* ge1244ov3914;
extern T0* ge1248ov3914;
extern T0* ge1240ov3914;
extern T0* ge1231ov3914;
extern T0* ge1239ov3914;
extern T0* ge1241ov3914;
extern T0* ge1272ov3914;
extern T0* ge1269ov3914;
extern T0* ge1268ov3914;
extern T0* ge1278ov3914;
extern void GE_init_const1(void);
extern void GE_init_const2(void);
extern void GE_init_const3(void);
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
#include <string.h>
#include <stdlib.h>
