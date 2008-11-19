/*
	description:

		"C declarations for the Gobo Eiffel runtime."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2005-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_EIFFEL_H
#define GE_EIFFEL_H

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

/* Basic Eiffel types */
typedef struct {int id;} EIF_ANY;
#define EIF_REFERENCE EIF_ANY*
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

#define EIF_VOID ((EIF_REFERENCE)0)
#define EIF_FALSE ((EIF_BOOLEAN)'\0')
#define EIF_TRUE ((EIF_BOOLEAN)'\1')
#define EIF_TEST(x) ((x) ? EIF_TRUE : EIF_FALSE)

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

#ifdef _MSC_VER /* MSVC */
/* MSVC does not support ISO C 99's 'snprintf' from stdio.h */
#define snprintf(a,b,c,d) sprintf(a,c,d)
#endif

/*
	Interoperability with ISE.
*/
#define RTI64C(x) GE_int64(x)
#define EIF_PROCEDURE EIF_POINTER
#define EIF_OBJECT EIF_REFERENCE
#define EIF_OBJ EIF_OBJECT
/* Function pointer call to make sure all arguments are correctly pushed onto stack. */
/* FUNCTION_CAST is for standard C calls. */
/* FUNCTION_CAST_TYPE is for non-standard C calls. */
#define FUNCTION_CAST(r_type,arg_types) (r_type (*) arg_types)
#define FUNCTION_CAST_TYPE(r_type,call_type,arg_types) (r_type (call_type *) arg_types)

#ifdef __cplusplus
}
#endif

#endif

/*
	description:

		"C functions used to implement class ARGUMENTS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
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
extern char** GE_argv;

#ifdef __cplusplus
}
#endif

#endif

/*
	description:

		"C functions used to implement class EXCEPTION"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_EXCEPTION_H
#define GE_EXCEPTION_H

#include <setjmp.h>

/*
	On Linux glibc systems, we need to use sig* versions of jmp_buf,
	setjmp and longjmp to preserve the signal handling context.
	One way to detect this is if _SIGSET_H_types has
	been defined in /usr/include/setjmp.h.
	NOTE: ANSI only recognizes the non-sig versions.
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
	Information about the feature being executed.
*/
typedef struct GE_call_struct GE_call;
struct GE_call_struct {
	char* feature_name;
	char* type_name;
	GE_call* caller; /* previous feature in the call chain */
};

/*
	Context of features containing a rescue clause.
*/
typedef struct GE_rescue_struct GE_rescue;
struct GE_rescue_struct {
	GE_jmp_buf jb;
	GE_rescue* previous; /* previous context in the call chain */
};

/*
	Context of last feature entered containing a rescue clause.
	Warning: this is not thread-safe.
*/
extern GE_rescue* GE_last_rescue;

/*
	Raise an exception with code 'code'.
*/
extern void GE_raise(int code);

/*
	Check whether the type id of 'obj' is not in 'type_ids'.
	If it is, then raise a CAT-call exception. Don't do anything if 'obj' is Void.
	'nb' is the number of ids in 'type_ids' and is expected to be >0.
	'type_ids' is sorted in increasing order.
	Return 'obj'.
*/
#define GE_catcall(obj,type_ids,nb) GE_check_catcall((obj),(type_ids),(nb))
EIF_REFERENCE GE_check_catcall(EIF_REFERENCE obj, int type_ids[], int nb);

/*
	Check whether 'obj' is Void.
	If it is, then raise a call-on-void-target exception.
	Return 'obj'
*/
#define GE_void(obj) (!(obj)?GE_check_void(obj):(obj))
extern EIF_REFERENCE GE_check_void(EIF_REFERENCE obj);

/*
	Check whether 'ptr' is a null pointer.
	If it is, then raise a no-more-memory exception.
	Return 'ptr'
*/
#define GE_null(ptr) GE_check_null(ptr)
extern void* GE_check_null(void* ptr);

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
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_MAIN_H
#define GE_MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_WINDOWS

#include <windows.h>

/*
	Main entry point when compiling a Windows application.
	See:
		http://en.wikipedia.org/wiki/WinMain
		http://msdn2.microsoft.com/en-us/library/ms633559.aspx
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
	copyright: "Copyright (c) 2007-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_GC_H
#define GE_GC_H

#ifdef EIF_BOEHM_GC

/*
	Use the Boehm garbage collector.
	See:
		http://en.wikipedia.org/wiki/Boehm_GC
		http://www.hpl.hp.com/personal/Hans_Boehm/gc/
*/

#include "gc.h"

/*
	GC initialization.
*/
#define GE_init_gc() GC_INIT(); GC_enable_incremental()

/*
	Memory allocation.
*/

/*
 * GE_alloc allocates memory that can contain pointers to collectable objects.
 */
#define GE_alloc(x) GE_null(GC_MALLOC(x))

/*
 * When defined, GE_alloc_cleared means that GE_alloc makes sure that the allocated memory is zeroed.
 */
#define GE_alloc_cleared

/*
 * GE_alloc_atomic allocates memory that does not contain pointers to collectable objects.
 */
#define GE_alloc_atomic(x) GE_null(GC_MALLOC_ATOMIC(x))

/*
 * When defined, GE_alloc_atomic_cleared means that GE_alloc_atomic makes sure that the allocated memory is zeroed.
 */
/* #define GE_alloc_atomic_cleared */

/*
	Dispose
*/

/*
 * Call dispose routine `disp' on object `C'.
 */
extern void GE_boehm_dispose(void*, void*);

/*
 * Register dispose routine `disp' to be called on object `obj' when it will be collected.
 */
#define GE_register_dispose(obj, disp) GC_REGISTER_FINALIZER((void*)(obj), (void (*) (void*, void*)) &GE_boehm_dispose, NULL, NULL, NULL)

#else

/*
	No garbage collector.
*/

/*
	GC initialization.
*/
#define GE_init_gc() /* do nothing */

/*
	Memory allocation.
*/

/*
 * GE_alloc allocates memory that can contain pointers to collectable objects.
 */
#define GE_alloc(x) GE_null(malloc(x))

/*
 * When defined, GE_alloc_cleared means that GE_alloc makes sure that the allocated memory is zeroed.
 */
/* #define GE_alloc_cleared */

/*
 * GE_alloc_atomic allocates memory that does not contain pointers to collectable objects.
 */
#define GE_alloc_atomic(x) GE_null(malloc(x))

/*
 * When defined, GE_alloc_atomic_cleared means that GE_alloc_atomic makes sure that the allocated memory is zeroed.
 */
/* #define GE_alloc_atomic_cleared */

/*
	Dispose
*/

/*
 * Register dispose routine `disp' to be called on object `obj' when it will be collected.
 */
#define GE_register_dispose(obj, disp) /* do nothing */

#endif


/*
	Access to objects, useful with GCs which move objects in memory.
	This is not the case here, since the Boehm GC is not a moving GC.
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

/* STRING_8 */
typedef struct S17 T17;

/* GEXACE */
typedef struct S21 T21;

/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND] */
typedef struct S22 T22;

/* KL_ARGUMENTS */
typedef struct S23 T23;

/* DS_HASH_TABLE [STRING_8, STRING_8] */
typedef struct S24 T24;

/* UC_STRING_EQUALITY_TESTER */
typedef struct S25 T25;

/* DS_LINKED_LIST [GEXACE_COMMAND] */
typedef struct S27 T27;

/* ET_XACE_DEFAULT_ERROR_HANDLER */
typedef struct S28 T28;

/* KL_EXCEPTIONS */
typedef struct S30 T30;

/* DS_LINKED_LIST_CURSOR [STRING_8] */
typedef struct S31 T31;

/* DS_PAIR [STRING_8, STRING_8] */
typedef struct S32 T32;

/* DS_LINKED_LIST [STRING_8] */
typedef struct S33 T33;

/* UT_USAGE_MESSAGE */
typedef struct S34 T34;

/* GEXACE_SYSTEM_COMMAND */
typedef struct S36 T36;

/* GEXACE_LIBRARY_COMMAND */
typedef struct S40 T40;

/* GEXACE_VALIDATE_COMMAND */
typedef struct S41 T41;

/* ET_XACE_XACE_GENERATOR */
typedef struct S43 T43;

/* ET_XACE_ACE_GENERATOR */
typedef struct S44 T44;

/* ET_XACE_ECF_GENERATOR */
typedef struct S45 T45;

/* DS_LINKED_LIST [ET_XACE_GENERATOR] */
typedef struct S46 T46;

/* KL_STRING_ROUTINES */
typedef struct S47 T47;

/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8] */
typedef struct S48 T48;

/* SPECIAL [STRING_8] */
typedef struct S50 T50;

/* SPECIAL [INTEGER_32] */
typedef struct S51 T51;

/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
typedef struct S52 T52;

/* KL_SPECIAL_ROUTINES [INTEGER_32] */
typedef struct S53 T53;

/* KL_SPECIAL_ROUTINES [STRING_8] */
typedef struct S54 T54;

/* DS_LINKABLE [GEXACE_COMMAND] */
typedef struct S55 T55;

/* KL_STANDARD_FILES */
typedef struct S57 T57;

/* KL_STDERR_FILE */
typedef struct S58 T58;

/* KL_STDOUT_FILE */
typedef struct S59 T59;

/* KL_NULL_TEXT_OUTPUT_STREAM */
typedef struct S60 T60;

/* DS_LINKABLE [STRING_8] */
typedef struct S62 T62;

/* ARRAY [STRING_8] */
typedef struct S63 T63;

/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR] */
typedef struct S64 T64;

/* DS_LINKABLE [ET_XACE_GENERATOR] */
typedef struct S65 T65;

/* UC_STRING */
typedef struct S69 T69;

/* KL_ANY_ROUTINES */
typedef struct S70 T70;

/* DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8] */
typedef struct S71 T71;

/* TO_SPECIAL [INTEGER_32] */
typedef struct S72 T72;

/* TO_SPECIAL [STRING_8] */
typedef struct S73 T73;

/* TYPED_POINTER [ANY] */
typedef struct S74 T74;

/* STRING_TO_INTEGER_CONVERTOR */
typedef struct S76 T76;

/* ET_XACE_SYSTEM_CONFIG_PARSER */
typedef struct S77 T77;

/* ET_XACE_SYSTEM_CONFIG */
typedef struct S78 T78;

/* KL_TEXT_INPUT_FILE */
typedef struct S79 T79;

/* KL_TEXT_OUTPUT_FILE */
typedef struct S81 T81;

/* ET_XACE_LIBRARY_CONFIG_PARSER */
typedef struct S82 T82;

/* ET_XACE_LIBRARY_CONFIG */
typedef struct S83 T83;

/* ET_XACE_PARSER */
typedef struct S84 T84;

/* UT_CANNOT_READ_FILE_ERROR */
typedef struct S86 T86;

/* UT_CANNOT_WRITE_TO_FILE_ERROR */
typedef struct S87 T87;

/* INTEGER_OVERFLOW_CHECKER */
typedef struct S88 T88;

/* ET_XACE_AST_FACTORY */
typedef struct S89 T89;

/* XM_DOCUMENT */
typedef struct S90 T90;

/* XM_ELEMENT */
typedef struct S91 T91;

/* XM_POSITION_TABLE */
typedef struct S92 T92;

/* XM_TREE_CALLBACKS_PIPE */
typedef struct S94 T94;

/* XM_STOP_ON_ERROR_FILTER */
typedef struct S95 T95;

/* XM_CALLBACKS_TO_TREE_FILTER */
typedef struct S96 T96;

/* ET_XACE_VALIDATOR */
typedef struct S97 T97;

/* ET_XACE_PREPROCESSOR */
typedef struct S98 T98;

/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8] */
typedef struct S99 T99;

/* XM_EXPAT_PARSER_FACTORY */
typedef struct S100 T100;

/* XM_EIFFEL_PARSER */
typedef struct S101 T101;

/* SPECIAL [NATURAL_8] */
typedef struct S106 T106;

/* UT_MESSAGE */
typedef struct S107 T107;

/* ET_XACE_NOT_XACE_FILE_ERROR */
typedef struct S108 T108;

/* ET_XACE_CLUSTERS */
typedef struct S109 T109;

/* ET_XACE_MOUNTED_LIBRARIES */
typedef struct S110 T110;

/* ET_XACE_OPTIONS */
typedef struct S111 T111;

/* DS_HASH_SET_CURSOR [STRING_8] */
typedef struct S112 T112;

/* DS_ARRAYED_LIST_CURSOR [STRING_8] */
typedef struct S113 T113;

/* DS_HASH_SET [STRING_8] */
typedef struct S114 T114;

/* DS_ARRAYED_LIST [STRING_8] */
typedef struct S115 T115;

/* DS_ARRAYED_LIST [ET_XACE_CLUSTER] */
typedef struct S116 T116;

/* ET_XACE_CLUSTER */
typedef struct S117 T117;

/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY] */
typedef struct S118 T118;

/* ET_XACE_MOUNTED_LIBRARY */
typedef struct S119 T119;

/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS] */
typedef struct S120 T120;

/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS] */
typedef struct S121 T121;

/* ET_XACE_CLASS_OPTIONS */
typedef struct S122 T122;

/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS] */
typedef struct S123 T123;

/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS] */
typedef struct S124 T124;

/* ET_XACE_FEATURE_OPTIONS */
typedef struct S125 T125;

/* ET_XACE_EXTERNALS */
typedef struct S126 T126;

/* ET_XACE_OPTION_NAMES */
typedef struct S127 T127;

/* DS_LINKED_LIST [ET_XACE_ASSEMBLY] */
typedef struct S128 T128;

/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY] */
typedef struct S129 T129;

/* ET_XACE_ASSEMBLY */
typedef struct S130 T130;

/* KL_UNIX_FILE_SYSTEM */
typedef struct S131 T131;

/* KL_EXECUTION_ENVIRONMENT */
typedef struct S132 T132;

/* DS_LINKED_LIST [ET_XACE_CLUSTER] */
typedef struct S133 T133;

/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER] */
typedef struct S134 T134;

/* TUPLE [ET_XACE_CLASS_OPTIONS] */
typedef struct S135 T135;

/* PROCEDURE [ET_XACE_ECF_GENERATOR, TUPLE [ET_XACE_CLASS_OPTIONS]] */
typedef struct S137 T137;

/* TUPLE [ET_XACE_ECF_GENERATOR, INTEGER_32, KI_TEXT_OUTPUT_STREAM] */
typedef struct S138 T138;

/* TUPLE [ET_XACE_FEATURE_OPTIONS] */
typedef struct S139 T139;

/* PROCEDURE [ET_XACE_ECF_GENERATOR, TUPLE [ET_XACE_FEATURE_OPTIONS]] */
typedef struct S140 T140;

/* TUPLE [ET_XACE_ECF_GENERATOR, STRING_8, INTEGER_32, KI_TEXT_OUTPUT_STREAM] */
typedef struct S141 T141;

/* ET_TOKEN_CONSTANTS */
typedef struct S142 T142;

/* ET_SYSTEM */
typedef struct S143 T143;

/* XM_ATTRIBUTE */
typedef struct S146 T146;

/* DS_LINKED_LIST_CURSOR [XM_NODE] */
typedef struct S147 T147;

/* DS_HASH_TABLE [INTEGER_32, STRING_8] */
typedef struct S150 T150;

/* UNIX_FILE_INFO */
typedef struct S153 T153;

/* SPECIAL [NATURAL_64] */
typedef struct S154 T154;

/* XM_NAMESPACE_RESOLVER */
typedef struct S155 T155;

/* SPECIAL [XM_CALLBACKS_FILTER] */
typedef struct S156 T156;

/* ARRAY [XM_CALLBACKS_FILTER] */
typedef struct S157 T157;

/* XM_CALLBACKS_NULL */
typedef struct S158 T158;

/* UT_TEMPLATE_EXPANDER */
typedef struct S160 T160;

/* DS_SPARSE_TABLE_KEYS [ET_XACE_LIBRARY_CONFIG, STRING_8] */
typedef struct S162 T162;

/* DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8] */
typedef struct S164 T164;

/* SPECIAL [ET_XACE_LIBRARY_CONFIG] */
typedef struct S165 T165;

/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY_CONFIG] */
typedef struct S166 T166;

/* XM_EIFFEL_SCANNER */
typedef struct S167 T167;

/* XM_DEFAULT_POSITION */
typedef struct S168 T168;

/* DS_BILINKED_LIST [XM_POSITION] */
typedef struct S170 T170;

/* DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
typedef struct S171 T171;

/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S172 T172;

/* XM_NULL_EXTERNAL_RESOLVER */
typedef struct S174 T174;

/* SPECIAL [ANY] */
typedef struct S175 T175;

/* KL_SPECIAL_ROUTINES [ANY] */
typedef struct S176 T176;

/* XM_EIFFEL_PARSER_NAME */
typedef struct S177 T177;

/* XM_EIFFEL_DECLARATION */
typedef struct S178 T178;

/* XM_DTD_EXTERNAL_ID */
typedef struct S179 T179;

/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
typedef struct S180 T180;

/* XM_DTD_ELEMENT_CONTENT */
typedef struct S181 T181;

/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S182 T182;

/* XM_DTD_ATTRIBUTE_CONTENT */
typedef struct S183 T183;

/* DS_BILINKED_LIST [STRING_8] */
typedef struct S184 T184;

/* SPECIAL [XM_EIFFEL_PARSER_NAME] */
typedef struct S185 T185;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
typedef struct S186 T186;

/* SPECIAL [XM_EIFFEL_DECLARATION] */
typedef struct S187 T187;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
typedef struct S188 T188;

/* SPECIAL [BOOLEAN] */
typedef struct S189 T189;

/* SPECIAL [XM_DTD_EXTERNAL_ID] */
typedef struct S190 T190;

/* KL_SPECIAL_ROUTINES [BOOLEAN] */
typedef struct S191 T191;

/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S192 T192;

/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S193 T193;

/* SPECIAL [XM_DTD_ELEMENT_CONTENT] */
typedef struct S194 T194;

/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
typedef struct S195 T195;

/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S197 T197;

/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S199 T199;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S200 T200;

/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S201 T201;

/* SPECIAL [DS_BILINKED_LIST [STRING_8]] */
typedef struct S202 T202;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
typedef struct S203 T203;

/* XM_EIFFEL_ENTITY_DEF */
typedef struct S204 T204;

/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
typedef struct S205 T205;

/* XM_DTD_CALLBACKS_NULL */
typedef struct S207 T207;

/* XM_EIFFEL_SCANNER_DTD */
typedef struct S208 T208;

/* XM_EIFFEL_PE_ENTITY_DEF */
typedef struct S210 T210;

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR */
typedef struct S211 T211;

/* ET_XACE_BOOLEAN_EXPECTED_ERROR */
typedef struct S212 T212;

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR */
typedef struct S213 T213;

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR */
typedef struct S214 T214;

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR */
typedef struct S215 T215;

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING */
typedef struct S216 T216;

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR */
typedef struct S217 T217;

/* ET_XACE_MISSING_ATTRIBUTE_ERROR */
typedef struct S218 T218;

/* ET_XACE_MISSING_ELEMENT_ERROR */
typedef struct S219 T219;

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING */
typedef struct S220 T220;

/* ET_XACE_UNKNOWN_ELEMENT_ERROR */
typedef struct S221 T221;

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING */
typedef struct S222 T222;

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING */
typedef struct S223 T223;

/* KL_OPERATING_SYSTEM */
typedef struct S224 T224;

/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S227 T227;

/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S228 T228;

/* DS_PAIR [XM_POSITION, XM_NODE] */
typedef struct S229 T229;

/* ARRAY [INTEGER_32] */
typedef struct S230 T230;

/* UC_UTF8_ROUTINES */
typedef struct S231 T231;

/* UC_UTF8_STRING */
typedef struct S233 T233;

/* XM_EIFFEL_INPUT_STREAM */
typedef struct S235 T235;

/* KL_INTEGER_ROUTINES */
typedef struct S236 T236;

/* KL_PLATFORM */
typedef struct S237 T237;

/* UT_TRISTATE */
typedef struct S238 T238;

/* SPECIAL [ET_XACE_CLUSTER] */
typedef struct S239 T239;

/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER] */
typedef struct S240 T240;

/* DS_ARRAYED_LIST_CURSOR [ET_XACE_CLUSTER] */
typedef struct S241 T241;

/* SPECIAL [ET_XACE_MOUNTED_LIBRARY] */
typedef struct S242 T242;

/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY] */
typedef struct S243 T243;

/* DS_ARRAYED_LIST_CURSOR [ET_XACE_MOUNTED_LIBRARY] */
typedef struct S244 T244;

/* DS_LINKABLE [ET_XACE_CLASS_OPTIONS] */
typedef struct S245 T245;

/* DS_LINKABLE [ET_XACE_FEATURE_OPTIONS] */
typedef struct S246 T246;

/* DS_LINKABLE [ET_XACE_ASSEMBLY] */
typedef struct S247 T247;

/* EXECUTION_ENVIRONMENT */
typedef struct S248 T248;

/* DS_LINKABLE [ET_XACE_CLUSTER] */
typedef struct S249 T249;

/* ET_ERROR_HANDLER */
typedef struct S250 T250;

/* ET_AST_FACTORY */
typedef struct S251 T251;

/* ET_AST_NULL_PROCESSOR */
typedef struct S252 T252;

/* ET_ADAPTED_LIBRARIES */
typedef struct S254 T254;

/* ET_CLUSTERS */
typedef struct S255 T255;

/* ET_ADAPTED_DOTNET_ASSEMBLIES */
typedef struct S256 T256;

/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME] */
typedef struct S257 T257;

/* ET_CLASS_NAME_TESTER */
typedef struct S258 T258;

/* ET_CLASS */
typedef struct S260 T260;

/* ET_NONE_GROUP */
typedef struct S261 T261;

/* ET_TUPLE_TYPE */
typedef struct S263 T263;

/* ET_ACTUAL_PARAMETER_LIST */
typedef struct S265 T265;

/* ET_CLASS_TYPE */
typedef struct S266 T266;

/* ET_CLIENT */
typedef struct S267 T267;

/* ET_PARENT */
typedef struct S268 T268;

/* ET_PARENT_LIST */
typedef struct S273 T273;

/* ET_CLIENT_LIST */
typedef struct S275 T275;

/* ET_GENERIC_CLASS_TYPE */
typedef struct S278 T278;

/* ET_BUILTIN_CONVERT_FEATURE */
typedef struct S279 T279;

/* DS_SPARSE_TABLE_KEYS [INTEGER_32, STRING_8] */
typedef struct S282 T282;

/* DS_HASH_TABLE_CURSOR [INTEGER_32, STRING_8] */
typedef struct S284 T284;

/* TYPED_POINTER [SPECIAL [CHARACTER_8]] */
typedef struct S285 T285;

/* XM_NAMESPACE_RESOLVER_CONTEXT */
typedef struct S286 T286;

/* DS_LINKED_QUEUE [STRING_8] */
typedef struct S288 T288;

/* DS_SPARSE_TABLE_KEYS_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8] */
typedef struct S289 T289;

/* TO_SPECIAL [ET_XACE_LIBRARY_CONFIG] */
typedef struct S290 T290;

/* XM_EIFFEL_CHARACTER_ENTITY */
typedef struct S291 T291;

/* YY_BUFFER */
typedef struct S292 T292;

/* YY_FILE_BUFFER */
typedef struct S293 T293;

/* DS_LINKED_STACK [INTEGER_32] */
typedef struct S296 T296;

/* DS_BILINKABLE [XM_POSITION] */
typedef struct S297 T297;

/* DS_BILINKED_LIST_CURSOR [XM_POSITION] */
typedef struct S298 T298;

/* DS_LINKABLE [XM_EIFFEL_SCANNER] */
typedef struct S299 T299;

/* SPECIAL [XM_EIFFEL_ENTITY_DEF] */
typedef struct S300 T300;

/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S301 T301;

/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S303 T303;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
typedef struct S305 T305;

/* TO_SPECIAL [ANY] */
typedef struct S306 T306;

/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
typedef struct S307 T307;

/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
typedef struct S308 T308;

/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
typedef struct S309 T309;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S310 T310;

/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S311 T311;

/* DS_BILINKED_LIST_CURSOR [STRING_8] */
typedef struct S312 T312;

/* DS_BILINKABLE [STRING_8] */
typedef struct S313 T313;

/* TO_SPECIAL [XM_EIFFEL_PARSER_NAME] */
typedef struct S314 T314;

/* TO_SPECIAL [XM_EIFFEL_DECLARATION] */
typedef struct S315 T315;

/* TO_SPECIAL [BOOLEAN] */
typedef struct S316 T316;

/* TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S317 T317;

/* TO_SPECIAL [XM_DTD_ELEMENT_CONTENT] */
typedef struct S318 T318;

/* TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S319 T319;

/* TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S320 T320;

/* TO_SPECIAL [DS_BILINKED_LIST [STRING_8]] */
typedef struct S321 T321;

/* TO_SPECIAL [XM_DTD_EXTERNAL_ID] */
typedef struct S322 T322;

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING */
typedef struct S323 T323;

/* ET_XACE_INVALID_EXPRESSION_ERROR */
typedef struct S324 T324;

/* UC_UNICODE_ROUTINES */
typedef struct S325 T325;

/* KL_ARRAY_ROUTINES [INTEGER_32] */
typedef struct S326 T326;

/* DS_LINKED_QUEUE [CHARACTER_8] */
typedef struct S330 T330;

/* UC_UTF16_ROUTINES */
typedef struct S331 T331;

/* TO_SPECIAL [ET_XACE_CLUSTER] */
typedef struct S332 T332;

/* TO_SPECIAL [ET_XACE_MOUNTED_LIBRARY] */
typedef struct S333 T333;

/* DS_ARRAYED_LIST [ET_ADAPTED_LIBRARY] */
typedef struct S334 T334;

/* DS_ARRAYED_LIST [ET_CLUSTER] */
typedef struct S335 T335;

/* DS_ARRAYED_LIST [ET_ADAPTED_DOTNET_ASSEMBLY] */
typedef struct S336 T336;

/* DS_SPARSE_TABLE_KEYS [ET_CLASS, ET_CLASS_NAME] */
typedef struct S338 T338;

/* DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME] */
typedef struct S340 T340;

/* SPECIAL [ET_CLASS] */
typedef struct S341 T341;

/* SPECIAL [ET_CLASS_NAME] */
typedef struct S342 T342;

/* KL_SPECIAL_ROUTINES [ET_CLASS] */
typedef struct S343 T343;

/* KL_SPECIAL_ROUTINES [ET_CLASS_NAME] */
typedef struct S344 T344;

/* ET_IDENTIFIER */
typedef struct S345 T345;

/* ET_SYMBOL */
typedef struct S346 T346;

/* ET_BRACKET_SYMBOL */
typedef struct S347 T347;

/* SPECIAL [ET_ACTUAL_PARAMETER_ITEM] */
typedef struct S349 T349;

/* KL_SPECIAL_ROUTINES [ET_ACTUAL_PARAMETER_ITEM] */
typedef struct S350 T350;

/* ET_KEYWORD */
typedef struct S351 T351;

/* SPECIAL [ET_PARENT_ITEM] */
typedef struct S353 T353;

/* KL_SPECIAL_ROUTINES [ET_PARENT_ITEM] */
typedef struct S354 T354;

/* SPECIAL [ET_CLIENT_ITEM] */
typedef struct S355 T355;

/* KL_SPECIAL_ROUTINES [ET_CLIENT_ITEM] */
typedef struct S356 T356;

/* ET_BRACED_TYPE_LIST */
typedef struct S359 T359;

/* DS_SPARSE_TABLE_KEYS_CURSOR [INTEGER_32, STRING_8] */
typedef struct S360 T360;

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S362 T362;

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S363 T363;

/* DS_LINKABLE [INTEGER_32] */
typedef struct S365 T365;

/* DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S366 T366;

/* TO_SPECIAL [XM_EIFFEL_ENTITY_DEF] */
typedef struct S367 T367;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
typedef struct S368 T368;

/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
typedef struct S369 T369;

/* C_STRING */
typedef struct S370 T370;

/* DS_HASH_SET [XM_NAMESPACE] */
typedef struct S371 T371;

/* XM_COMMENT */
typedef struct S372 T372;

/* XM_PROCESSING_INSTRUCTION */
typedef struct S373 T373;

/* XM_CHARACTER_DATA */
typedef struct S374 T374;

/* XM_NAMESPACE */
typedef struct S375 T375;

/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S377 T377;

/* ET_BASE_TYPE_LIST */
typedef struct S381 T381;

/* ET_QUERY_LIST */
typedef struct S382 T382;

/* ET_PROCEDURE_LIST */
typedef struct S383 T383;

/* KL_CHARACTER_BUFFER */
typedef struct S384 T384;

/* SPECIAL [ARRAY [INTEGER_32]] */
typedef struct S385 T385;

/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
typedef struct S386 T386;

/* DS_LINKABLE [CHARACTER_8] */
typedef struct S387 T387;

/* KL_SPECIAL_ROUTINES [ET_ADAPTED_LIBRARY] */
typedef struct S389 T389;

/* SPECIAL [ET_ADAPTED_LIBRARY] */
typedef struct S391 T391;

/* DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_LIBRARY] */
typedef struct S392 T392;

/* KL_SPECIAL_ROUTINES [ET_CLUSTER] */
typedef struct S393 T393;

/* SPECIAL [ET_CLUSTER] */
typedef struct S394 T394;

/* DS_ARRAYED_LIST_CURSOR [ET_CLUSTER] */
typedef struct S395 T395;

/* KL_SPECIAL_ROUTINES [ET_ADAPTED_DOTNET_ASSEMBLY] */
typedef struct S396 T396;

/* SPECIAL [ET_ADAPTED_DOTNET_ASSEMBLY] */
typedef struct S398 T398;

/* DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_DOTNET_ASSEMBLY] */
typedef struct S399 T399;

/* DS_SPARSE_TABLE_KEYS_CURSOR [ET_CLASS, ET_CLASS_NAME] */
typedef struct S400 T400;

/* TO_SPECIAL [ET_CLASS] */
typedef struct S401 T401;

/* TO_SPECIAL [ET_CLASS_NAME] */
typedef struct S402 T402;

/* TO_SPECIAL [ET_ACTUAL_PARAMETER_ITEM] */
typedef struct S403 T403;

/* TO_SPECIAL [ET_PARENT_ITEM] */
typedef struct S404 T404;

/* TO_SPECIAL [ET_CLIENT_ITEM] */
typedef struct S405 T405;

/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S409 T409;

/* DS_LINKABLE [XM_NODE] */
typedef struct S412 T412;

/* XM_NODE_TYPER */
typedef struct S414 T414;

/* KL_WINDOWS_FILE_SYSTEM */
typedef struct S418 T418;

/* KL_STRING_INPUT_STREAM */
typedef struct S421 T421;

/* MANAGED_POINTER */
typedef struct S422 T422;

/* SPECIAL [XM_NAMESPACE] */
typedef struct S423 T423;

/* KL_EQUALITY_TESTER [XM_NAMESPACE] */
typedef struct S424 T424;

/* DS_HASH_SET_CURSOR [XM_NAMESPACE] */
typedef struct S425 T425;

/* KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
typedef struct S426 T426;

/* TO_SPECIAL [ET_ADAPTED_LIBRARY] */
typedef struct S427 T427;

/* TO_SPECIAL [ET_CLUSTER] */
typedef struct S428 T428;

/* TO_SPECIAL [ET_ADAPTED_DOTNET_ASSEMBLY] */
typedef struct S429 T429;

/* SPECIAL [ET_BASE_TYPE] */
typedef struct S432 T432;

/* KL_SPECIAL_ROUTINES [ET_BASE_TYPE] */
typedef struct S433 T433;

/* SPECIAL [ET_QUERY] */
typedef struct S435 T435;

/* KL_SPECIAL_ROUTINES [ET_QUERY] */
typedef struct S436 T436;

/* SPECIAL [ET_PROCEDURE] */
typedef struct S438 T438;

/* KL_SPECIAL_ROUTINES [ET_PROCEDURE] */
typedef struct S439 T439;

/* TYPED_POINTER [NATURAL_8] */
typedef struct S440 T440;

/* EXCEPTIONS */
typedef struct S441 T441;

/* TO_SPECIAL [XM_NAMESPACE] */
typedef struct S442 T442;

/* PLATFORM */
typedef struct S443 T443;

/* TO_SPECIAL [ET_BASE_TYPE] */
typedef struct S444 T444;

/* TO_SPECIAL [ET_QUERY] */
typedef struct S445 T445;

/* TO_SPECIAL [ET_PROCEDURE] */
typedef struct S446 T446;

/* STRING_SEARCHER */
typedef struct S447 T447;

/* Struct for boxed version of type BOOLEAN */
struct Sb1 {
	int id;
	T1 z1; /* item */
};

/* Struct for boxed version of type CHARACTER_8 */
struct Sb2 {
	int id;
	T2 z1; /* item */
};

/* Struct for boxed version of type CHARACTER_32 */
struct Sb3 {
	int id;
	T3 z1; /* item */
};

/* Struct for boxed version of type INTEGER_8 */
struct Sb4 {
	int id;
	T4 z1; /* item */
};

/* Struct for boxed version of type INTEGER_16 */
struct Sb5 {
	int id;
	T5 z1; /* item */
};

/* Struct for boxed version of type INTEGER_32 */
struct Sb6 {
	int id;
	T6 z1; /* item */
};

/* Struct for boxed version of type INTEGER_64 */
struct Sb7 {
	int id;
	T7 z1; /* item */
};

/* Struct for boxed version of type NATURAL_8 */
struct Sb8 {
	int id;
	T8 z1; /* item */
};

/* Struct for boxed version of type NATURAL_16 */
struct Sb9 {
	int id;
	T9 z1; /* item */
};

/* Struct for boxed version of type NATURAL_32 */
struct Sb10 {
	int id;
	T10 z1; /* item */
};

/* Struct for boxed version of type NATURAL_64 */
struct Sb11 {
	int id;
	T11 z1; /* item */
};

/* Struct for boxed version of type REAL_32 */
struct Sb12 {
	int id;
	T12 z1; /* item */
};

/* Struct for boxed version of type REAL_64 */
struct Sb13 {
	int id;
	T13 z1; /* item */
};

/* Struct for boxed version of type POINTER */
struct Sb14 {
	int id;
	T14 z1; /* item */
};

/* Struct for type TYPED_POINTER [ANY] */
struct S74 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type TYPED_POINTER [SPECIAL [CHARACTER_8]] */
struct S285 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type TYPED_POINTER [NATURAL_8] */
struct S440 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type SPECIAL [CHARACTER_8] */
struct S15 {
	int id;
	T6 z1; /* count */
	T2 z2[1]; /* item */
};

/* Struct for type STRING_8 */
struct S17 {
	int id;
	T0* a1; /* area */
	T6 a2; /* count */
	T6 a3; /* internal_hash_code */
};

/* Struct for type GEXACE */
struct S21 {
	int id;
	T0* a1; /* variables */
	T0* a2; /* commands */
	T0* a3; /* error_handler */
	T6 a4; /* next_option_position */
	T1 a5; /* is_shallow */
};

/* Struct for type DS_LINKED_LIST_CURSOR [GEXACE_COMMAND] */
struct S22 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type KL_ARGUMENTS */
struct S23 {
	int id;
	T0* a1; /* program_name */
};

/* Struct for type DS_HASH_TABLE [STRING_8, STRING_8] */
struct S24 {
	int id;
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
	T0* a12; /* item_storage */
	T0* a13; /* clashes */
	T0* a14; /* slots */
	T0* a15; /* key_storage */
	T6 a16; /* free_slot */
	T0* a17; /* internal_cursor */
	T0* a18; /* special_item_routines */
	T0* a19; /* special_key_routines */
	T0* a20; /* hash_function */
};

/* Struct for type UC_STRING_EQUALITY_TESTER */
struct S25 {
	int id;
};

/* Struct for type DS_LINKED_LIST [GEXACE_COMMAND] */
struct S27 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type ET_XACE_DEFAULT_ERROR_HANDLER */
struct S28 {
	int id;
	T6 a1; /* error_count */
	T0* a2; /* warning_file */
	T0* a3; /* info_file */
	T0* a4; /* error_file */
};

/* Struct for type KL_EXCEPTIONS */
struct S30 {
	int id;
};

/* Struct for type DS_LINKED_LIST_CURSOR [STRING_8] */
struct S31 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_PAIR [STRING_8, STRING_8] */
struct S32 {
	int id;
	T0* a1; /* second */
	T0* a2; /* first */
};

/* Struct for type DS_LINKED_LIST [STRING_8] */
struct S33 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type UT_USAGE_MESSAGE */
struct S34 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type GEXACE_SYSTEM_COMMAND */
struct S36 {
	int id;
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
struct S40 {
	int id;
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
struct S41 {
	int id;
	T0* a1; /* variables */
	T0* a2; /* error_handler */
	T0* a3; /* xace_filename */
	T1 a4; /* is_shallow */
};

/* Struct for type ET_XACE_XACE_GENERATOR */
struct S43 {
	int id;
	T0* a1; /* compiler */
	T0* a2; /* variables */
	T0* a3; /* error_handler */
	T1 a4; /* is_shallow */
};

/* Struct for type ET_XACE_ACE_GENERATOR */
struct S44 {
	int id;
	T0* a1; /* compiler */
	T0* a2; /* variables */
	T0* a3; /* error_handler */
	T1 a4; /* is_shallow */
};

/* Struct for type ET_XACE_ECF_GENERATOR */
struct S45 {
	int id;
	T0* a1; /* compiler */
	T0* a2; /* variables */
	T0* a3; /* error_handler */
	T1 a4; /* is_shallow */
};

/* Struct for type DS_LINKED_LIST [ET_XACE_GENERATOR] */
struct S46 {
	int id;
	T6 a1; /* count */
	T0* a2; /* internal_cursor */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
};

/* Struct for type KL_STRING_ROUTINES */
struct S47 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8] */
struct S48 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type SPECIAL [STRING_8] */
struct S50 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [INTEGER_32] */
struct S51 {
	int id;
	T6 z1; /* count */
	T6 z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
struct S52 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [INTEGER_32] */
struct S53 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [STRING_8] */
struct S54 {
	int id;
};

/* Struct for type DS_LINKABLE [GEXACE_COMMAND] */
struct S55 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type KL_STANDARD_FILES */
struct S57 {
	int id;
};

/* Struct for type KL_STDERR_FILE */
struct S58 {
	int id;
	T14 a1; /* file_pointer */
	T0* a2; /* name */
	T6 a3; /* mode */
};

/* Struct for type KL_STDOUT_FILE */
struct S59 {
	int id;
	T14 a1; /* file_pointer */
	T0* a2; /* name */
	T6 a3; /* mode */
};

/* Struct for type KL_NULL_TEXT_OUTPUT_STREAM */
struct S60 {
	int id;
	T0* a1; /* name */
};

/* Struct for type DS_LINKABLE [STRING_8] */
struct S62 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type ARRAY [STRING_8] */
struct S63 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR] */
struct S64 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_LINKABLE [ET_XACE_GENERATOR] */
struct S65 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type UC_STRING */
struct S69 {
	int id;
	T6 a1; /* count */
	T6 a2; /* byte_count */
	T6 a3; /* internal_hash_code */
	T0* a4; /* area */
	T6 a5; /* last_byte_index_input */
	T6 a6; /* last_byte_index_result */
};

/* Struct for type KL_ANY_ROUTINES */
struct S70 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8] */
struct S71 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [INTEGER_32] */
struct S72 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [STRING_8] */
struct S73 {
	int id;
	T0* a1; /* area */
};

/* Struct for type STRING_TO_INTEGER_CONVERTOR */
struct S76 {
	int id;
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
struct S77 {
	int id;
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
struct S78 {
	int id;
	T0* a1; /* system_name */
	T0* a2; /* root_class_name */
	T0* a3; /* creation_procedure_name */
	T0* a4; /* options */
	T0* a5; /* clusters */
	T0* a6; /* libraries */
};

/* Struct for type KL_TEXT_INPUT_FILE */
struct S79 {
	int id;
	T6 a1; /* mode */
	T0* a2; /* name */
	T0* a3; /* string_name */
	T0* a4; /* character_buffer */
	T1 a5; /* end_of_file */
	T14 a6; /* file_pointer */
	T1 a7; /* descriptor_available */
	T2 a8; /* last_character */
};

/* Struct for type KL_TEXT_OUTPUT_FILE */
struct S81 {
	int id;
	T6 a1; /* mode */
	T0* a2; /* name */
	T0* a3; /* string_name */
	T14 a4; /* file_pointer */
	T1 a5; /* descriptor_available */
};

/* Struct for type ET_XACE_LIBRARY_CONFIG_PARSER */
struct S82 {
	int id;
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
struct S83 {
	int id;
	T0* a1; /* name */
	T0* a2; /* library_prefix */
	T0* a3; /* options */
	T0* a4; /* clusters */
	T0* a5; /* libraries */
};

/* Struct for type ET_XACE_PARSER */
struct S84 {
	int id;
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

/* Struct for type UT_CANNOT_READ_FILE_ERROR */
struct S86 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type UT_CANNOT_WRITE_TO_FILE_ERROR */
struct S87 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type INTEGER_OVERFLOW_CHECKER */
struct S88 {
	int id;
	T0* a1; /* integer_overflow_state1 */
	T0* a2; /* integer_overflow_state2 */
	T0* a3; /* natural_overflow_state1 */
	T0* a4; /* natural_overflow_state2 */
};

/* Struct for type ET_XACE_AST_FACTORY */
struct S89 {
	int id;
};

/* Struct for type XM_DOCUMENT */
struct S90 {
	int id;
	T0* a1; /* root_element */
	T0* a2; /* internal_cursor */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
	T6 a5; /* count */
	T0* a6; /* parent */
};

/* Struct for type XM_ELEMENT */
struct S91 {
	int id;
	T0* a1; /* parent */
	T0* a2; /* name */
	T0* a3; /* namespace */
	T0* a4; /* first_cell */
	T0* a5; /* last_cell */
	T6 a6; /* count */
	T0* a7; /* internal_cursor */
};

/* Struct for type XM_POSITION_TABLE */
struct S92 {
	int id;
	T0* a1; /* table */
};

/* Struct for type XM_TREE_CALLBACKS_PIPE */
struct S94 {
	int id;
	T0* a1; /* error */
	T0* a2; /* tree */
	T0* a3; /* start */
	T0* a4; /* last */
};

/* Struct for type XM_STOP_ON_ERROR_FILTER */
struct S95 {
	int id;
	T1 a1; /* has_error */
	T0* a2; /* last_error */
	T0* a3; /* next */
};

/* Struct for type XM_CALLBACKS_TO_TREE_FILTER */
struct S96 {
	int id;
	T0* a1; /* last_position_table */
	T0* a2; /* document */
	T0* a3; /* next */
	T0* a4; /* source_parser */
	T0* a5; /* current_element */
	T0* a6; /* namespace_cache */
};

/* Struct for type ET_XACE_VALIDATOR */
struct S97 {
	int id;
	T1 a1; /* has_error */
	T0* a2; /* error_handler */
};

/* Struct for type ET_XACE_PREPROCESSOR */
struct S98 {
	int id;
	T0* a1; /* variables */
	T0* a2; /* error_handler */
};

/* Struct for type DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8] */
struct S99 {
	int id;
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
struct S100 {
	int id;
};

/* Struct for type XM_EIFFEL_PARSER */
struct S101 {
	int id;
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
	T0* a13; /* yyss */
	T0* a14; /* yytranslate */
	T0* a15; /* yyr1 */
	T0* a16; /* yytypes1 */
	T0* a17; /* yytypes2 */
	T0* a18; /* yydefact */
	T0* a19; /* yydefgoto */
	T0* a20; /* yypact */
	T0* a21; /* yypgoto */
	T0* a22; /* yytable */
	T0* a23; /* yycheck */
	T6 a24; /* yy_parsing_status */
	T6 a25; /* yy_suspended_yystacksize */
	T6 a26; /* yy_suspended_yystate */
	T6 a27; /* yy_suspended_yyn */
	T6 a28; /* yy_suspended_yychar1 */
	T6 a29; /* yy_suspended_index */
	T6 a30; /* yy_suspended_yyss_top */
	T6 a31; /* yy_suspended_yy_goto */
	T6 a32; /* yyssp */
	T6 a33; /* error_count */
	T1 a34; /* yy_lookahead_needed */
	T6 a35; /* yyerrstatus */
	T6 a36; /* last_token */
	T6 a37; /* yyvsp1 */
	T6 a38; /* yyvsp2 */
	T6 a39; /* yyvsp3 */
	T6 a40; /* yyvsp4 */
	T6 a41; /* yyvsp5 */
	T6 a42; /* yyvsp6 */
	T6 a43; /* yyvsp7 */
	T6 a44; /* yyvsp8 */
	T6 a45; /* yyvsp9 */
	T6 a46; /* yyvsp10 */
	T6 a47; /* yyvsp11 */
	T0* a48; /* last_string_value */
	T6 a49; /* yyvsc1 */
	T0* a50; /* yyvs1 */
	T0* a51; /* yyspecial_routines1 */
	T0* a52; /* last_any_value */
	T6 a53; /* yyvsc4 */
	T0* a54; /* yyvs4 */
	T0* a55; /* yyspecial_routines4 */
	T6 a56; /* yyvsc2 */
	T0* a57; /* yyvs2 */
	T0* a58; /* yyspecial_routines2 */
	T0* a59; /* yyvs11 */
	T6 a60; /* yyvsc11 */
	T0* a61; /* yyspecial_routines11 */
	T0* a62; /* yyvs10 */
	T0* a63; /* yyvs5 */
	T6 a64; /* yyvsc10 */
	T0* a65; /* yyspecial_routines10 */
	T6 a66; /* yyvsc3 */
	T0* a67; /* yyvs3 */
	T0* a68; /* yyspecial_routines3 */
	T0* a69; /* yyvs6 */
	T6 a70; /* yyvsc6 */
	T0* a71; /* yyspecial_routines6 */
	T0* a72; /* yyvs8 */
	T0* a73; /* yyvs7 */
	T6 a74; /* yyvsc8 */
	T0* a75; /* yyspecial_routines8 */
	T6 a76; /* yyvsc7 */
	T0* a77; /* yyspecial_routines7 */
	T0* a78; /* yyvs9 */
	T6 a79; /* yyvsc9 */
	T0* a80; /* yyspecial_routines9 */
	T6 a81; /* yyvsc5 */
	T0* a82; /* yyspecial_routines5 */
	T0* a83; /* dtd_callbacks */
};

/* Struct for type SPECIAL [NATURAL_8] */
struct S106 {
	int id;
	T6 z1; /* count */
	T8 z2[1]; /* item */
};

/* Struct for type UT_MESSAGE */
struct S107 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_NOT_XACE_FILE_ERROR */
struct S108 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_CLUSTERS */
struct S109 {
	int id;
	T0* a1; /* clusters */
};

/* Struct for type ET_XACE_MOUNTED_LIBRARIES */
struct S110 {
	int id;
	T0* a1; /* libraries */
};

/* Struct for type ET_XACE_OPTIONS */
struct S111 {
	int id;
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
	T0* a86; /* declared_automatic_backup */
	T0* a87; /* declared_check_generic_creation_constraint */
	T0* a88; /* declared_enforce_unique_class_names */
	T0* a89; /* declared_force_32bits */
	T6 a90; /* declared_msil_classes_per_module */
	T0* a91; /* declared_msil_use_optimized_precompile */
	T0* a92; /* declared_old_verbatim_strings */
	T0* a93; /* declared_ecf_library */
};

/* Struct for type DS_HASH_SET_CURSOR [STRING_8] */
struct S112 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [STRING_8] */
struct S113 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type DS_HASH_SET [STRING_8] */
struct S114 {
	int id;
	T6 a1; /* count */
	T6 a2; /* position */
	T6 a3; /* capacity */
	T6 a4; /* modulus */
	T6 a5; /* last_position */
	T6 a6; /* free_slot */
	T0* a7; /* internal_cursor */
	T0* a8; /* equality_tester */
	T6 a9; /* slots_position */
	T6 a10; /* clashes_previous_position */
	T0* a11; /* special_item_routines */
	T0* a12; /* item_storage */
	T0* a13; /* clashes */
	T0* a14; /* slots */
	T6 a15; /* found_position */
	T0* a16; /* hash_function */
};

/* Struct for type DS_ARRAYED_LIST [STRING_8] */
struct S115 {
	int id;
	T6 a1; /* count */
	T0* a2; /* special_routines */
	T0* a3; /* storage */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
	T0* a6; /* equality_tester */
};

/* Struct for type DS_ARRAYED_LIST [ET_XACE_CLUSTER] */
struct S116 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type ET_XACE_CLUSTER */
struct S117 {
	int id;
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
	T1 a15; /* is_implicit */
	T1 a16; /* is_mounted */
	T0* a17; /* parent */
	T1 a18; /* is_override */
	T0* a19; /* provider_constraint */
	T0* a20; /* dependant_constraint */
};

/* Struct for type DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY] */
struct S118 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type ET_XACE_MOUNTED_LIBRARY */
struct S119 {
	int id;
	T0* a1; /* pathname */
	T0* a2; /* library_prefix */
	T0* a3; /* library */
	T0* a4; /* position */
	T1 a5; /* is_root */
};

/* Struct for type DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS] */
struct S120 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS] */
struct S121 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type ET_XACE_CLASS_OPTIONS */
struct S122 {
	int id;
	T0* a1; /* feature_options */
	T0* a2; /* class_name */
	T0* a3; /* options */
};

/* Struct for type DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS] */
struct S123 {
	int id;
	T6 a1; /* count */
	T0* a2; /* internal_cursor */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS] */
struct S124 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type ET_XACE_FEATURE_OPTIONS */
struct S125 {
	int id;
	T0* a1; /* feature_name */
	T0* a2; /* options */
};

/* Struct for type ET_XACE_EXTERNALS */
struct S126 {
	int id;
	T0* a1; /* c_compiler_options */
	T0* a2; /* include_directories */
	T0* a3; /* link_libraries */
};

/* Struct for type ET_XACE_OPTION_NAMES */
struct S127 {
	int id;
};

/* Struct for type DS_LINKED_LIST [ET_XACE_ASSEMBLY] */
struct S128 {
	int id;
	T6 a1; /* count */
	T0* a2; /* internal_cursor */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY] */
struct S129 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type ET_XACE_ASSEMBLY */
struct S130 {
	int id;
	T0* a1; /* tag */
	T0* a2; /* assembly_name */
	T0* a3; /* version */
	T0* a4; /* culture */
	T0* a5; /* public_key_token */
	T0* a6; /* class_prefix */
	T0* a7; /* assembly_pathname */
};

/* Struct for type KL_UNIX_FILE_SYSTEM */
struct S131 {
	int id;
};

/* Struct for type KL_EXECUTION_ENVIRONMENT */
struct S132 {
	int id;
};

/* Struct for type DS_LINKED_LIST [ET_XACE_CLUSTER] */
struct S133 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER] */
struct S134 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type TUPLE [ET_XACE_CLASS_OPTIONS] */
struct S135 {
	int id;
	T0* z1;
};

/* Struct for type PROCEDURE [ET_XACE_ECF_GENERATOR, TUPLE [ET_XACE_CLASS_OPTIONS]] */
struct S137 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*, T0*);
};

/* Struct for type TUPLE [ET_XACE_ECF_GENERATOR, INTEGER_32, KI_TEXT_OUTPUT_STREAM] */
struct S138 {
	int id;
	T0* z1;
	T6 z2;
	T0* z3;
};

/* Struct for type TUPLE [ET_XACE_FEATURE_OPTIONS] */
struct S139 {
	int id;
	T0* z1;
};

/* Struct for type PROCEDURE [ET_XACE_ECF_GENERATOR, TUPLE [ET_XACE_FEATURE_OPTIONS]] */
struct S140 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*, T0*);
};

/* Struct for type TUPLE [ET_XACE_ECF_GENERATOR, STRING_8, INTEGER_32, KI_TEXT_OUTPUT_STREAM] */
struct S141 {
	int id;
	T0* z1;
	T0* z2;
	T6 z3;
	T0* z4;
};

/* Struct for type ET_TOKEN_CONSTANTS */
struct S142 {
	int id;
};

/* Struct for type ET_SYSTEM */
struct S143 {
	int id;
	T0* a1; /* current_system */
	T0* a2; /* error_handler */
	T0* a3; /* ast_factory */
	T0* a4; /* external_include_pathnames */
	T0* a5; /* external_object_pathnames */
	T0* a6; /* external_library_pathnames */
	T1 a7; /* console_application_mode */
	T1 a8; /* unknown_builtin_reported */
	T0* a9; /* null_processor */
	T0* a10; /* eiffel_preparser */
	T0* a11; /* eiffel_parser */
	T0* a12; /* provider_checker */
	T0* a13; /* ancestor_builder */
	T0* a14; /* feature_flattener */
	T0* a15; /* interface_checker */
	T0* a16; /* implementation_checker */
	T0* a17; /* flat_implementation_checker */
	T0* a18; /* libraries */
	T0* a19; /* clusters */
	T0* a20; /* dotnet_assemblies */
	T0* a21; /* classes */
	T0* a22; /* mapped_classes */
	T1 a23; /* preparse_shallow_mode */
	T1 a24; /* preparse_single_mode */
	T1 a25; /* preparse_multiple_mode */
	T0* a26; /* array_class */
	T0* a27; /* arguments_class */
	T0* a28; /* bit_class */
	T0* a29; /* boolean_class */
	T0* a30; /* boolean_ref_class */
	T0* a31; /* character_8_ref_class */
	T0* a32; /* character_32_ref_class */
	T0* a33; /* disposable_class */
	T0* a34; /* function_class */
	T0* a35; /* identified_routines_class */
	T0* a36; /* integer_8_ref_class */
	T0* a37; /* integer_16_ref_class */
	T0* a38; /* integer_32_ref_class */
	T0* a39; /* integer_64_ref_class */
	T0* a40; /* native_array_class */
	T0* a41; /* natural_8_ref_class */
	T0* a42; /* natural_16_ref_class */
	T0* a43; /* natural_32_ref_class */
	T0* a44; /* natural_64_ref_class */
	T0* a45; /* platform_class */
	T0* a46; /* pointer_class */
	T0* a47; /* pointer_ref_class */
	T0* a48; /* predicate_class */
	T0* a49; /* procedure_class */
	T0* a50; /* real_32_ref_class */
	T0* a51; /* real_64_ref_class */
	T0* a52; /* routine_class */
	T0* a53; /* special_class */
	T0* a54; /* system_string_class */
	T0* a55; /* tuple_class */
	T0* a56; /* tuple_type */
	T0* a57; /* type_class */
	T0* a58; /* typed_pointer_class */
	T0* a59; /* character_class */
	T0* a60; /* character_8_class */
	T0* a61; /* character_type */
	T0* a62; /* character_ref_class */
	T0* a63; /* double_class */
	T0* a64; /* real_64_class */
	T0* a65; /* double_type */
	T0* a66; /* double_ref_class */
	T0* a67; /* integer_class */
	T0* a68; /* integer_32_class */
	T0* a69; /* integer_type */
	T0* a70; /* integer_ref_class */
	T0* a71; /* natural_class */
	T0* a72; /* natural_32_class */
	T0* a73; /* natural_type */
	T0* a74; /* natural_ref_class */
	T0* a75; /* real_class */
	T0* a76; /* real_32_class */
	T0* a77; /* real_type */
	T0* a78; /* real_ref_class */
	T0* a79; /* string_class */
	T0* a80; /* string_8_class */
	T0* a81; /* string_type */
	T0* a82; /* wide_character_class */
	T0* a83; /* character_32_class */
	T0* a84; /* wide_character_ref_class */
	T1 a85; /* use_attribute_keyword */
	T1 a86; /* use_reference_keyword */
	T6 a87; /* registered_class_count */
	T0* a88; /* any_class */
	T0* a89; /* any_type */
	T0* a90; /* any_parent */
	T0* a91; /* any_parents */
	T0* a92; /* any_clients */
	T0* a93; /* array_any_type */
	T0* a94; /* character_8_convert_feature */
	T0* a95; /* character_32_convert_feature */
	T0* a96; /* integer_8_class */
	T0* a97; /* integer_8_convert_feature */
	T0* a98; /* integer_16_class */
	T0* a99; /* integer_16_convert_feature */
	T0* a100; /* integer_32_convert_feature */
	T0* a101; /* integer_64_class */
	T0* a102; /* integer_64_convert_feature */
	T0* a103; /* natural_8_class */
	T0* a104; /* natural_8_convert_feature */
	T0* a105; /* natural_16_class */
	T0* a106; /* natural_16_convert_feature */
	T0* a107; /* natural_32_convert_feature */
	T0* a108; /* natural_64_class */
	T0* a109; /* natural_64_convert_feature */
	T0* a110; /* none_class */
	T0* a111; /* none_type */
	T0* a112; /* array_none_type */
	T0* a113; /* real_32_convert_feature */
	T0* a114; /* real_64_convert_feature */
	T0* a115; /* string_8_convert_feature */
	T0* a116; /* string_32_class */
	T0* a117; /* string_32_convert_feature */
	T0* a118; /* system_object_class */
	T0* a119; /* system_object_parents */
};

/* Struct for type XM_ATTRIBUTE */
struct S146 {
	int id;
	T0* a1; /* name */
	T0* a2; /* namespace */
	T0* a3; /* value */
	T0* a4; /* parent */
};

/* Struct for type DS_LINKED_LIST_CURSOR [XM_NODE] */
struct S147 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* next_cursor */
	T0* a4; /* container */
	T1 a5; /* before */
};

/* Struct for type DS_HASH_TABLE [INTEGER_32, STRING_8] */
struct S150 {
	int id;
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
	T0* a15; /* key_storage */
	T6 a16; /* capacity */
	T0* a17; /* internal_cursor */
	T0* a18; /* special_item_routines */
	T0* a19; /* special_key_routines */
	T0* a20; /* hash_function */
};

/* Struct for type UNIX_FILE_INFO */
struct S153 {
	int id;
	T0* a1; /* buffered_file_info */
	T0* a2; /* file_name */
};

/* Struct for type SPECIAL [NATURAL_64] */
struct S154 {
	int id;
	T6 z1; /* count */
	T11 z2[1]; /* item */
};

/* Struct for type XM_NAMESPACE_RESOLVER */
struct S155 {
	int id;
	T0* a1; /* next */
	T0* a2; /* context */
	T0* a3; /* element_prefix */
	T0* a4; /* element_local_part */
	T1 a5; /* forward_xmlns */
	T0* a6; /* attributes_prefix */
	T0* a7; /* attributes_local_part */
	T0* a8; /* attributes_value */
};

/* Struct for type SPECIAL [XM_CALLBACKS_FILTER] */
struct S156 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [XM_CALLBACKS_FILTER] */
struct S157 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type XM_CALLBACKS_NULL */
struct S158 {
	int id;
};

/* Struct for type UT_TEMPLATE_EXPANDER */
struct S160 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [ET_XACE_LIBRARY_CONFIG, STRING_8] */
struct S162 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8] */
struct S164 {
	int id;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T6 a3; /* position */
};

/* Struct for type SPECIAL [ET_XACE_LIBRARY_CONFIG] */
struct S165 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY_CONFIG] */
struct S166 {
	int id;
};

/* Struct for type XM_EIFFEL_SCANNER */
struct S167 {
	int id;
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
	T0* a22; /* yy_ec */
	T0* a23; /* yy_content_area */
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
	T0* a40; /* last_error */
	T0* a41; /* start_conditions */
};

/* Struct for type XM_DEFAULT_POSITION */
struct S168 {
	int id;
	T0* a1; /* source_name */
	T6 a2; /* row */
	T6 a3; /* column */
	T6 a4; /* byte_index */
};

/* Struct for type DS_BILINKED_LIST [XM_POSITION] */
struct S170 {
	int id;
	T0* a1; /* first_cell */
	T0* a2; /* internal_cursor */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
struct S171 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
};

/* Struct for type DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S172 {
	int id;
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
	T0* a17; /* equality_tester */
	T0* a18; /* special_item_routines */
	T0* a19; /* special_key_routines */
	T0* a20; /* hash_function */
};

/* Struct for type XM_NULL_EXTERNAL_RESOLVER */
struct S174 {
	int id;
};

/* Struct for type SPECIAL [ANY] */
struct S175 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ANY] */
struct S176 {
	int id;
};

/* Struct for type XM_EIFFEL_PARSER_NAME */
struct S177 {
	int id;
	T1 a1; /* use_namespaces */
	T6 a2; /* count */
	T0* a3; /* first */
	T0* a4; /* second */
	T0* a5; /* tail */
};

/* Struct for type XM_EIFFEL_DECLARATION */
struct S178 {
	int id;
	T0* a1; /* version */
	T0* a2; /* encoding */
	T1 a3; /* stand_alone */
};

/* Struct for type XM_DTD_EXTERNAL_ID */
struct S179 {
	int id;
	T0* a1; /* system_id */
	T0* a2; /* public_id */
};

/* Struct for type DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
struct S180 {
	int id;
	T6 a1; /* position */
	T0* a2; /* equality_tester */
	T6 a3; /* count */
	T6 a4; /* capacity */
	T6 a5; /* free_slot */
	T6 a6; /* last_position */
	T6 a7; /* modulus */
	T6 a8; /* slots_position */
	T6 a9; /* clashes_previous_position */
	T0* a10; /* internal_cursor */
	T6 a11; /* found_position */
	T0* a12; /* clashes */
	T0* a13; /* slots */
	T0* a14; /* item_storage */
	T0* a15; /* special_item_routines */
	T0* a16; /* hash_function */
};

/* Struct for type XM_DTD_ELEMENT_CONTENT */
struct S181 {
	int id;
	T0* a1; /* items */
	T2 a2; /* repetition */
	T0* a3; /* name */
	T2 a4; /* type */
	T1 a5; /* is_character_data_allowed */
};

/* Struct for type DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
struct S182 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type XM_DTD_ATTRIBUTE_CONTENT */
struct S183 {
	int id;
	T0* a1; /* name */
	T2 a2; /* type */
	T1 a3; /* is_list_type */
	T0* a4; /* enumeration_list */
	T2 a5; /* value */
	T0* a6; /* default_value */
};

/* Struct for type DS_BILINKED_LIST [STRING_8] */
struct S184 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
	T0* a5; /* equality_tester */
};

/* Struct for type SPECIAL [XM_EIFFEL_PARSER_NAME] */
struct S185 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
struct S186 {
	int id;
};

/* Struct for type SPECIAL [XM_EIFFEL_DECLARATION] */
struct S187 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
struct S188 {
	int id;
};

/* Struct for type SPECIAL [BOOLEAN] */
struct S189 {
	int id;
	T6 z1; /* count */
	T1 z2[1]; /* item */
};

/* Struct for type SPECIAL [XM_DTD_EXTERNAL_ID] */
struct S190 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [BOOLEAN] */
struct S191 {
	int id;
};

/* Struct for type SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S192 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S193 {
	int id;
};

/* Struct for type SPECIAL [XM_DTD_ELEMENT_CONTENT] */
struct S194 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
struct S195 {
	int id;
};

/* Struct for type SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S197 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
struct S199 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S200 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
struct S201 {
	int id;
};

/* Struct for type SPECIAL [DS_BILINKED_LIST [STRING_8]] */
struct S202 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
struct S203 {
	int id;
};

/* Struct for type XM_EIFFEL_ENTITY_DEF */
struct S204 {
	int id;
	T0* a1; /* literal_name */
	T0* a2; /* value */
	T0* a3; /* resolver */
	T0* a4; /* external_id */
	T0* a5; /* character_entity */
	T0* a6; /* input_buffer */
	T1 a7; /* in_use */
	T0* a8; /* input_name */
	T0* a9; /* last_error */
	T0* a10; /* start_conditions */
	T6 a11; /* yy_start_state */
	T6 a12; /* yy_line */
	T6 a13; /* yy_column */
	T6 a14; /* yy_position */
	T6 a15; /* line */
	T6 a16; /* column */
	T6 a17; /* position */
	T1 a18; /* yy_more_flag */
	T6 a19; /* yy_more_len */
	T6 a20; /* yy_last_accepting_state */
	T6 a21; /* yy_last_accepting_cpos */
	T1 a22; /* yy_rejected */
	T6 a23; /* yy_state_count */
	T6 a24; /* yy_full_match */
	T6 a25; /* yy_lp */
	T6 a26; /* yy_looking_for_trail_begin */
	T6 a27; /* yy_full_lp */
	T6 a28; /* yy_full_state */
	T0* a29; /* yy_state_stack */
	T6 a30; /* yy_end */
	T6 a31; /* yy_start */
	T0* a32; /* yy_nxt */
	T0* a33; /* yy_chk */
	T0* a34; /* yy_base */
	T0* a35; /* yy_def */
	T0* a36; /* yy_ec */
	T0* a37; /* yy_meta */
	T0* a38; /* yy_accept */
	T0* a39; /* yy_content */
	T0* a40; /* yy_content_area */
	T6 a41; /* last_token */
	T0* a42; /* last_value */
	T0* a43; /* input_filter */
	T0* a44; /* input_stream */
	T0* a45; /* input_resolver */
	T0* a46; /* yy_acclist */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
struct S205 {
	int id;
};

/* Struct for type XM_DTD_CALLBACKS_NULL */
struct S207 {
	int id;
};

/* Struct for type XM_EIFFEL_SCANNER_DTD */
struct S208 {
	int id;
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
	T0* a24; /* yy_ec */
	T0* a25; /* yy_content_area */
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
	T0* a42; /* last_error */
	T0* a43; /* start_conditions */
};

/* Struct for type XM_EIFFEL_PE_ENTITY_DEF */
struct S210 {
	int id;
	T0* a1; /* resolver */
	T0* a2; /* external_id */
	T0* a3; /* literal_name */
	T0* a4; /* value */
	T0* a5; /* character_entity */
	T0* a6; /* input_buffer */
	T1 a7; /* in_use */
	T0* a8; /* input_name */
	T0* a9; /* last_error */
	T0* a10; /* start_conditions */
	T6 a11; /* yy_start_state */
	T6 a12; /* yy_line */
	T6 a13; /* yy_column */
	T6 a14; /* yy_position */
	T6 a15; /* line */
	T6 a16; /* column */
	T6 a17; /* position */
	T1 a18; /* yy_more_flag */
	T6 a19; /* yy_more_len */
	T6 a20; /* yy_last_accepting_state */
	T6 a21; /* yy_last_accepting_cpos */
	T1 a22; /* yy_rejected */
	T6 a23; /* yy_state_count */
	T6 a24; /* yy_full_match */
	T6 a25; /* yy_lp */
	T6 a26; /* yy_looking_for_trail_begin */
	T6 a27; /* yy_full_lp */
	T6 a28; /* yy_full_state */
	T0* a29; /* yy_state_stack */
	T6 a30; /* yy_end */
	T6 a31; /* yy_start */
	T1 a32; /* pre_sent */
	T1 a33; /* post_sent */
	T0* a34; /* yy_nxt */
	T0* a35; /* yy_chk */
	T0* a36; /* yy_base */
	T0* a37; /* yy_def */
	T0* a38; /* yy_ec */
	T0* a39; /* yy_meta */
	T0* a40; /* yy_accept */
	T0* a41; /* yy_content */
	T0* a42; /* yy_content_area */
	T6 a43; /* last_token */
	T0* a44; /* last_value */
	T0* a45; /* input_filter */
	T0* a46; /* input_stream */
	T0* a47; /* input_resolver */
	T0* a48; /* yy_acclist */
};

/* Struct for type ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR */
struct S211 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_BOOLEAN_EXPECTED_ERROR */
struct S212 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR */
struct S213 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR */
struct S214 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR */
struct S215 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING */
struct S216 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_WRONG_ROOT_ELEMENT_ERROR */
struct S217 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_MISSING_ATTRIBUTE_ERROR */
struct S218 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_MISSING_ELEMENT_ERROR */
struct S219 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING */
struct S220 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_UNKNOWN_ELEMENT_ERROR */
struct S221 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING */
struct S222 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_UNKNOWN_OPTION_NAME_WARNING */
struct S223 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type KL_OPERATING_SYSTEM */
struct S224 {
	int id;
};

/* Struct for type DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S227 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S228 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_PAIR [XM_POSITION, XM_NODE] */
struct S229 {
	int id;
	T0* a1; /* first */
	T0* a2; /* second */
};

/* Struct for type ARRAY [INTEGER_32] */
struct S230 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type UC_UTF8_ROUTINES */
struct S231 {
	int id;
};

/* Struct for type UC_UTF8_STRING */
struct S233 {
	int id;
	T6 a1; /* count */
	T0* a2; /* area */
	T6 a3; /* byte_count */
	T6 a4; /* internal_hash_code */
	T6 a5; /* last_byte_index_input */
	T6 a6; /* last_byte_index_result */
};

/* Struct for type XM_EIFFEL_INPUT_STREAM */
struct S235 {
	int id;
	T0* a1; /* last_string */
	T6 a2; /* encoding */
	T0* a3; /* impl */
	T0* a4; /* utf_queue */
};

/* Struct for type KL_INTEGER_ROUTINES */
struct S236 {
	int id;
};

/* Struct for type KL_PLATFORM */
struct S237 {
	int id;
};

/* Struct for type UT_TRISTATE */
struct S238 {
	int id;
	T2 a1; /* value */
};

/* Struct for type SPECIAL [ET_XACE_CLUSTER] */
struct S239 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER] */
struct S240 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [ET_XACE_CLUSTER] */
struct S241 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type SPECIAL [ET_XACE_MOUNTED_LIBRARY] */
struct S242 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY] */
struct S243 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [ET_XACE_MOUNTED_LIBRARY] */
struct S244 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_LINKABLE [ET_XACE_CLASS_OPTIONS] */
struct S245 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_LINKABLE [ET_XACE_FEATURE_OPTIONS] */
struct S246 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_LINKABLE [ET_XACE_ASSEMBLY] */
struct S247 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type EXECUTION_ENVIRONMENT */
struct S248 {
	int id;
};

/* Struct for type DS_LINKABLE [ET_XACE_CLUSTER] */
struct S249 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type ET_ERROR_HANDLER */
struct S250 {
	int id;
	T0* a1; /* error_file */
	T0* a2; /* warning_file */
	T0* a3; /* info_file */
};

/* Struct for type ET_AST_FACTORY */
struct S251 {
	int id;
};

/* Struct for type ET_AST_NULL_PROCESSOR */
struct S252 {
	int id;
};

/* Struct for type ET_ADAPTED_LIBRARIES */
struct S254 {
	int id;
	T0* a1; /* libraries */
};

/* Struct for type ET_CLUSTERS */
struct S255 {
	int id;
	T0* a1; /* clusters */
};

/* Struct for type ET_ADAPTED_DOTNET_ASSEMBLIES */
struct S256 {
	int id;
	T0* a1; /* dotnet_assemblies */
};

/* Struct for type DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME] */
struct S257 {
	int id;
	T0* a1; /* key_equality_tester */
	T0* a2; /* internal_keys */
	T6 a3; /* count */
	T6 a4; /* last_position */
	T6 a5; /* free_slot */
	T6 a6; /* position */
	T6 a7; /* capacity */
	T6 a8; /* slots_position */
	T0* a9; /* equality_tester */
	T0* a10; /* internal_cursor */
	T6 a11; /* found_position */
	T0* a12; /* item_storage */
	T0* a13; /* key_storage */
	T0* a14; /* clashes */
	T6 a15; /* modulus */
	T0* a16; /* slots */
	T6 a17; /* clashes_previous_position */
	T0* a18; /* special_item_routines */
	T0* a19; /* special_key_routines */
	T0* a20; /* hash_function */
};

/* Struct for type ET_CLASS_NAME_TESTER */
struct S258 {
	int id;
};

/* Struct for type ET_CLASS */
struct S260 {
	int id;
	T0* a1; /* name */
	T0* a2; /* formal_parameters */
	T6 a3; /* id */
	T0* a4; /* ancestors */
	T0* a5; /* queries */
	T0* a6; /* procedures */
	T0* a7; /* class_keyword */
	T0* a8; /* end_keyword */
	T0* a9; /* base_class */
	T0* a10; /* master_class */
	T6 a11; /* time_stamp */
	T1 a12; /* in_system */
	T1 a13; /* is_basic */
	T0* a14; /* group */
};

/* Struct for type ET_NONE_GROUP */
struct S261 {
	int id;
	T0* a1; /* name */
	T0* a2; /* universe */
};

/* Struct for type ET_TUPLE_TYPE */
struct S263 {
	int id;
	T0* a1; /* type_mark */
	T0* a2; /* tuple_keyword */
	T0* a3; /* actual_parameters */
	T0* a4; /* base_class */
};

/* Struct for type ET_ACTUAL_PARAMETER_LIST */
struct S265 {
	int id;
	T0* a1; /* left_bracket */
	T0* a2; /* right_bracket */
	T6 a3; /* count */
	T0* a4; /* storage */
};

/* Struct for type ET_CLASS_TYPE */
struct S266 {
	int id;
	T0* a1; /* type_mark */
	T0* a2; /* name */
	T0* a3; /* base_class */
};

/* Struct for type ET_CLIENT */
struct S267 {
	int id;
	T0* a1; /* name */
	T0* a2; /* base_class */
};

/* Struct for type ET_PARENT */
struct S268 {
	int id;
	T0* a1; /* type */
	T0* a2; /* actual_parameters */
	T0* a3; /* renames */
	T0* a4; /* exports */
	T0* a5; /* undefines */
	T0* a6; /* redefines */
	T0* a7; /* selects */
	T0* a8; /* end_keyword */
};

/* Struct for type ET_PARENT_LIST */
struct S273 {
	int id;
	T0* a1; /* inherit_keyword */
	T6 a2; /* count */
	T0* a3; /* storage */
};

/* Struct for type ET_CLIENT_LIST */
struct S275 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
};

/* Struct for type ET_GENERIC_CLASS_TYPE */
struct S278 {
	int id;
	T0* a1; /* type_mark */
	T0* a2; /* name */
	T0* a3; /* actual_parameters */
	T0* a4; /* base_class */
};

/* Struct for type ET_BUILTIN_CONVERT_FEATURE */
struct S279 {
	int id;
	T0* a1; /* name */
	T0* a2; /* types */
	T0* a3; /* type */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [INTEGER_32, STRING_8] */
struct S282 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [INTEGER_32, STRING_8] */
struct S284 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type XM_NAMESPACE_RESOLVER_CONTEXT */
struct S286 {
	int id;
	T0* a1; /* context */
};

/* Struct for type DS_LINKED_QUEUE [STRING_8] */
struct S288 {
	int id;
	T0* a1; /* first_cell */
	T6 a2; /* count */
	T0* a3; /* last_cell */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8] */
struct S289 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [ET_XACE_LIBRARY_CONFIG] */
struct S290 {
	int id;
	T0* a1; /* area */
};

/* Struct for type XM_EIFFEL_CHARACTER_ENTITY */
struct S291 {
	int id;
	T6 a1; /* code */
};

/* Struct for type YY_BUFFER */
struct S292 {
	int id;
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
struct S293 {
	int id;
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

/* Struct for type DS_LINKED_STACK [INTEGER_32] */
struct S296 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
};

/* Struct for type DS_BILINKABLE [XM_POSITION] */
struct S297 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_POSITION] */
struct S298 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type DS_LINKABLE [XM_EIFFEL_SCANNER] */
struct S299 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type SPECIAL [XM_EIFFEL_ENTITY_DEF] */
struct S300 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S301 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S303 {
	int id;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T6 a3; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
struct S305 {
	int id;
};

/* Struct for type TO_SPECIAL [ANY] */
struct S306 {
	int id;
	T0* a1; /* area */
};

/* Struct for type KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
struct S307 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
struct S308 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
struct S309 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
struct S310 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
struct S311 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [STRING_8] */
struct S312 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_BILINKABLE [STRING_8] */
struct S313 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type TO_SPECIAL [XM_EIFFEL_PARSER_NAME] */
struct S314 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_EIFFEL_DECLARATION] */
struct S315 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [BOOLEAN] */
struct S316 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S317 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_DTD_ELEMENT_CONTENT] */
struct S318 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S319 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
struct S320 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [DS_BILINKED_LIST [STRING_8]] */
struct S321 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_DTD_EXTERNAL_ID] */
struct S322 {
	int id;
	T0* a1; /* area */
};

/* Struct for type ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING */
struct S323 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_INVALID_EXPRESSION_ERROR */
struct S324 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type UC_UNICODE_ROUTINES */
struct S325 {
	int id;
};

/* Struct for type KL_ARRAY_ROUTINES [INTEGER_32] */
struct S326 {
	int id;
};

/* Struct for type DS_LINKED_QUEUE [CHARACTER_8] */
struct S330 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
};

/* Struct for type UC_UTF16_ROUTINES */
struct S331 {
	int id;
};

/* Struct for type TO_SPECIAL [ET_XACE_CLUSTER] */
struct S332 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [ET_XACE_MOUNTED_LIBRARY] */
struct S333 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_ARRAYED_LIST [ET_ADAPTED_LIBRARY] */
struct S334 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST [ET_CLUSTER] */
struct S335 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST [ET_ADAPTED_DOTNET_ASSEMBLY] */
struct S336 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [ET_CLASS, ET_CLASS_NAME] */
struct S338 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME] */
struct S340 {
	int id;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T6 a3; /* position */
};

/* Struct for type SPECIAL [ET_CLASS] */
struct S341 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [ET_CLASS_NAME] */
struct S342 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_CLASS] */
struct S343 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_CLASS_NAME] */
struct S344 {
	int id;
};

/* Struct for type ET_IDENTIFIER */
struct S345 {
	int id;
	T6 a1; /* hash_code */
	T0* a2; /* name */
	T6 a3; /* compressed_position */
};

/* Struct for type ET_SYMBOL */
struct S346 {
	int id;
	T2 a1; /* code */
	T6 a2; /* compressed_position */
};

/* Struct for type ET_BRACKET_SYMBOL */
struct S347 {
	int id;
	T2 a1; /* code */
	T6 a2; /* compressed_position */
};

/* Struct for type SPECIAL [ET_ACTUAL_PARAMETER_ITEM] */
struct S349 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_ACTUAL_PARAMETER_ITEM] */
struct S350 {
	int id;
};

/* Struct for type ET_KEYWORD */
struct S351 {
	int id;
	T2 a1; /* code */
	T0* a2; /* text */
	T6 a3; /* compressed_position */
};

/* Struct for type SPECIAL [ET_PARENT_ITEM] */
struct S353 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_PARENT_ITEM] */
struct S354 {
	int id;
};

/* Struct for type SPECIAL [ET_CLIENT_ITEM] */
struct S355 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_CLIENT_ITEM] */
struct S356 {
	int id;
};

/* Struct for type ET_BRACED_TYPE_LIST */
struct S359 {
	int id;
	T0* a1; /* left_brace */
	T0* a2; /* right_brace */
	T6 a3; /* count */
	T0* a4; /* storage */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [INTEGER_32, STRING_8] */
struct S360 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S362 {
	int id;
	T6 a1; /* count */
	T0* a2; /* last_cell */
	T0* a3; /* internal_cursor */
	T0* a4; /* first_cell */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S363 {
	int id;
	T1 a1; /* before */
	T0* a2; /* current_cell */
	T0* a3; /* next_cursor */
	T0* a4; /* container */
	T1 a5; /* after */
};

/* Struct for type DS_LINKABLE [INTEGER_32] */
struct S365 {
	int id;
	T6 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S366 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [XM_EIFFEL_ENTITY_DEF] */
struct S367 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
struct S368 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
struct S369 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type C_STRING */
struct S370 {
	int id;
	T6 a1; /* count */
	T0* a2; /* managed_data */
};

/* Struct for type DS_HASH_SET [XM_NAMESPACE] */
struct S371 {
	int id;
	T6 a1; /* position */
	T0* a2; /* item_storage */
	T0* a3; /* equality_tester */
	T6 a4; /* last_position */
	T6 a5; /* capacity */
	T6 a6; /* slots_position */
	T6 a7; /* count */
	T6 a8; /* modulus */
	T6 a9; /* clashes_previous_position */
	T6 a10; /* free_slot */
	T0* a11; /* internal_cursor */
	T6 a12; /* found_position */
	T0* a13; /* clashes */
	T0* a14; /* slots */
	T0* a15; /* special_item_routines */
	T0* a16; /* hash_function */
};

/* Struct for type XM_COMMENT */
struct S372 {
	int id;
	T0* a1; /* data */
	T0* a2; /* parent */
};

/* Struct for type XM_PROCESSING_INSTRUCTION */
struct S373 {
	int id;
	T0* a1; /* target */
	T0* a2; /* data */
	T0* a3; /* parent */
};

/* Struct for type XM_CHARACTER_DATA */
struct S374 {
	int id;
	T0* a1; /* content */
	T0* a2; /* parent */
};

/* Struct for type XM_NAMESPACE */
struct S375 {
	int id;
	T0* a1; /* uri */
	T0* a2; /* ns_prefix */
};

/* Struct for type DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S377 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type ET_BASE_TYPE_LIST */
struct S381 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
};

/* Struct for type ET_QUERY_LIST */
struct S382 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
};

/* Struct for type ET_PROCEDURE_LIST */
struct S383 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
};

/* Struct for type KL_CHARACTER_BUFFER */
struct S384 {
	int id;
	T0* a1; /* as_special */
	T0* a2; /* area */
};

/* Struct for type SPECIAL [ARRAY [INTEGER_32]] */
struct S385 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
struct S386 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_LINKABLE [CHARACTER_8] */
struct S387 {
	int id;
	T2 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_ADAPTED_LIBRARY] */
struct S389 {
	int id;
};

/* Struct for type SPECIAL [ET_ADAPTED_LIBRARY] */
struct S391 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_LIBRARY] */
struct S392 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_CLUSTER] */
struct S393 {
	int id;
};

/* Struct for type SPECIAL [ET_CLUSTER] */
struct S394 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [ET_CLUSTER] */
struct S395 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_ADAPTED_DOTNET_ASSEMBLY] */
struct S396 {
	int id;
};

/* Struct for type SPECIAL [ET_ADAPTED_DOTNET_ASSEMBLY] */
struct S398 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_DOTNET_ASSEMBLY] */
struct S399 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [ET_CLASS, ET_CLASS_NAME] */
struct S400 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [ET_CLASS] */
struct S401 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [ET_CLASS_NAME] */
struct S402 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [ET_ACTUAL_PARAMETER_ITEM] */
struct S403 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [ET_PARENT_ITEM] */
struct S404 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [ET_CLIENT_ITEM] */
struct S405 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S409 {
	int id;
	T0* a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
};

/* Struct for type DS_LINKABLE [XM_NODE] */
struct S412 {
	int id;
	T0* a1; /* right */
	T0* a2; /* item */
};

/* Struct for type XM_NODE_TYPER */
struct S414 {
	int id;
	T0* a1; /* xml_attribute */
	T0* a2; /* element */
	T0* a3; /* composite */
	T0* a4; /* document */
	T0* a5; /* character_data */
	T0* a6; /* processing_instruction */
	T0* a7; /* comment */
};

/* Struct for type KL_WINDOWS_FILE_SYSTEM */
struct S418 {
	int id;
	T2 a1; /* secondary_directory_separator */
};

/* Struct for type KL_STRING_INPUT_STREAM */
struct S421 {
	int id;
	T1 a1; /* end_of_input */
	T2 a2; /* last_character */
	T0* a3; /* string */
	T6 a4; /* location */
};

/* Struct for type MANAGED_POINTER */
struct S422 {
	int id;
	T1 a1; /* is_shared */
	T14 a2; /* item */
	T6 a3; /* count */
};

/* Struct for type SPECIAL [XM_NAMESPACE] */
struct S423 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_EQUALITY_TESTER [XM_NAMESPACE] */
struct S424 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [XM_NAMESPACE] */
struct S425 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
struct S426 {
	int id;
};

/* Struct for type TO_SPECIAL [ET_ADAPTED_LIBRARY] */
struct S427 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [ET_CLUSTER] */
struct S428 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [ET_ADAPTED_DOTNET_ASSEMBLY] */
struct S429 {
	int id;
	T0* a1; /* area */
};

/* Struct for type SPECIAL [ET_BASE_TYPE] */
struct S432 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_BASE_TYPE] */
struct S433 {
	int id;
};

/* Struct for type SPECIAL [ET_QUERY] */
struct S435 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_QUERY] */
struct S436 {
	int id;
};

/* Struct for type SPECIAL [ET_PROCEDURE] */
struct S438 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_PROCEDURE] */
struct S439 {
	int id;
};

/* Struct for type EXCEPTIONS */
struct S441 {
	int id;
};

/* Struct for type TO_SPECIAL [XM_NAMESPACE] */
struct S442 {
	int id;
	T0* a1; /* area */
};

/* Struct for type PLATFORM */
struct S443 {
	int id;
};

/* Struct for type TO_SPECIAL [ET_BASE_TYPE] */
struct S444 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [ET_QUERY] */
struct S445 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [ET_PROCEDURE] */
struct S446 {
	int id;
	T0* a1; /* area */
};

/* Struct for type STRING_SEARCHER */
struct S447 {
	int id;
	T0* a1; /* deltas */
};

typedef struct {
	int id;
	EIF_INTEGER type_id;
	EIF_BOOLEAN is_special;
	void (*dispose) (EIF_REFERENCE);
} EIF_TYPE;


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
extern T17 GE_default17;
extern T21 GE_default21;
extern T22 GE_default22;
extern T23 GE_default23;
extern T24 GE_default24;
extern T25 GE_default25;
extern T27 GE_default27;
extern T28 GE_default28;
extern T30 GE_default30;
extern T31 GE_default31;
extern T32 GE_default32;
extern T33 GE_default33;
extern T34 GE_default34;
extern T36 GE_default36;
extern T40 GE_default40;
extern T41 GE_default41;
extern T43 GE_default43;
extern T44 GE_default44;
extern T45 GE_default45;
extern T46 GE_default46;
extern T47 GE_default47;
extern T48 GE_default48;
extern T50 GE_default50;
extern T51 GE_default51;
extern T52 GE_default52;
extern T53 GE_default53;
extern T54 GE_default54;
extern T55 GE_default55;
extern T57 GE_default57;
extern T58 GE_default58;
extern T59 GE_default59;
extern T60 GE_default60;
extern T62 GE_default62;
extern T63 GE_default63;
extern T64 GE_default64;
extern T65 GE_default65;
extern T69 GE_default69;
extern T70 GE_default70;
extern T71 GE_default71;
extern T72 GE_default72;
extern T73 GE_default73;
extern T74 GE_default74;
extern T76 GE_default76;
extern T77 GE_default77;
extern T78 GE_default78;
extern T79 GE_default79;
extern T81 GE_default81;
extern T82 GE_default82;
extern T83 GE_default83;
extern T84 GE_default84;
extern T86 GE_default86;
extern T87 GE_default87;
extern T88 GE_default88;
extern T89 GE_default89;
extern T90 GE_default90;
extern T91 GE_default91;
extern T92 GE_default92;
extern T94 GE_default94;
extern T95 GE_default95;
extern T96 GE_default96;
extern T97 GE_default97;
extern T98 GE_default98;
extern T99 GE_default99;
extern T100 GE_default100;
extern T101 GE_default101;
extern T106 GE_default106;
extern T107 GE_default107;
extern T108 GE_default108;
extern T109 GE_default109;
extern T110 GE_default110;
extern T111 GE_default111;
extern T112 GE_default112;
extern T113 GE_default113;
extern T114 GE_default114;
extern T115 GE_default115;
extern T116 GE_default116;
extern T117 GE_default117;
extern T118 GE_default118;
extern T119 GE_default119;
extern T120 GE_default120;
extern T121 GE_default121;
extern T122 GE_default122;
extern T123 GE_default123;
extern T124 GE_default124;
extern T125 GE_default125;
extern T126 GE_default126;
extern T127 GE_default127;
extern T128 GE_default128;
extern T129 GE_default129;
extern T130 GE_default130;
extern T131 GE_default131;
extern T132 GE_default132;
extern T133 GE_default133;
extern T134 GE_default134;
extern T135 GE_default135;
extern T137 GE_default137;
extern T138 GE_default138;
extern T139 GE_default139;
extern T140 GE_default140;
extern T141 GE_default141;
extern T142 GE_default142;
extern T143 GE_default143;
extern T146 GE_default146;
extern T147 GE_default147;
extern T150 GE_default150;
extern T153 GE_default153;
extern T154 GE_default154;
extern T155 GE_default155;
extern T156 GE_default156;
extern T157 GE_default157;
extern T158 GE_default158;
extern T160 GE_default160;
extern T162 GE_default162;
extern T164 GE_default164;
extern T165 GE_default165;
extern T166 GE_default166;
extern T167 GE_default167;
extern T168 GE_default168;
extern T170 GE_default170;
extern T171 GE_default171;
extern T172 GE_default172;
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
extern T190 GE_default190;
extern T191 GE_default191;
extern T192 GE_default192;
extern T193 GE_default193;
extern T194 GE_default194;
extern T195 GE_default195;
extern T197 GE_default197;
extern T199 GE_default199;
extern T200 GE_default200;
extern T201 GE_default201;
extern T202 GE_default202;
extern T203 GE_default203;
extern T204 GE_default204;
extern T205 GE_default205;
extern T207 GE_default207;
extern T208 GE_default208;
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
extern T221 GE_default221;
extern T222 GE_default222;
extern T223 GE_default223;
extern T224 GE_default224;
extern T227 GE_default227;
extern T228 GE_default228;
extern T229 GE_default229;
extern T230 GE_default230;
extern T231 GE_default231;
extern T233 GE_default233;
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
extern T254 GE_default254;
extern T255 GE_default255;
extern T256 GE_default256;
extern T257 GE_default257;
extern T258 GE_default258;
extern T260 GE_default260;
extern T261 GE_default261;
extern T263 GE_default263;
extern T265 GE_default265;
extern T266 GE_default266;
extern T267 GE_default267;
extern T268 GE_default268;
extern T273 GE_default273;
extern T275 GE_default275;
extern T278 GE_default278;
extern T279 GE_default279;
extern T282 GE_default282;
extern T284 GE_default284;
extern T285 GE_default285;
extern T286 GE_default286;
extern T288 GE_default288;
extern T289 GE_default289;
extern T290 GE_default290;
extern T291 GE_default291;
extern T292 GE_default292;
extern T293 GE_default293;
extern T296 GE_default296;
extern T297 GE_default297;
extern T298 GE_default298;
extern T299 GE_default299;
extern T300 GE_default300;
extern T301 GE_default301;
extern T303 GE_default303;
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
extern T316 GE_default316;
extern T317 GE_default317;
extern T318 GE_default318;
extern T319 GE_default319;
extern T320 GE_default320;
extern T321 GE_default321;
extern T322 GE_default322;
extern T323 GE_default323;
extern T324 GE_default324;
extern T325 GE_default325;
extern T326 GE_default326;
extern T330 GE_default330;
extern T331 GE_default331;
extern T332 GE_default332;
extern T333 GE_default333;
extern T334 GE_default334;
extern T335 GE_default335;
extern T336 GE_default336;
extern T338 GE_default338;
extern T340 GE_default340;
extern T341 GE_default341;
extern T342 GE_default342;
extern T343 GE_default343;
extern T344 GE_default344;
extern T345 GE_default345;
extern T346 GE_default346;
extern T347 GE_default347;
extern T349 GE_default349;
extern T350 GE_default350;
extern T351 GE_default351;
extern T353 GE_default353;
extern T354 GE_default354;
extern T355 GE_default355;
extern T356 GE_default356;
extern T359 GE_default359;
extern T360 GE_default360;
extern T362 GE_default362;
extern T363 GE_default363;
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
extern T377 GE_default377;
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
extern T398 GE_default398;
extern T399 GE_default399;
extern T400 GE_default400;
extern T401 GE_default401;
extern T402 GE_default402;
extern T403 GE_default403;
extern T404 GE_default404;
extern T405 GE_default405;
extern T409 GE_default409;
extern T412 GE_default412;
extern T414 GE_default414;
extern T418 GE_default418;
extern T421 GE_default421;
extern T422 GE_default422;
extern T423 GE_default423;
extern T424 GE_default424;
extern T425 GE_default425;
extern T426 GE_default426;
extern T427 GE_default427;
extern T428 GE_default428;
extern T429 GE_default429;
extern T432 GE_default432;
extern T433 GE_default433;
extern T435 GE_default435;
extern T436 GE_default436;
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

extern T0* GE_ms8(char* s, T6 c);
extern T0* GE_ms32(char* s, T6 c);
/* Call to ANY.same_type */
extern T1 T19x27T0(T0* C, T0* a1);
/* Call to UT_ERROR.default_message */
extern T0* T35x2658(T0* C);
/* Call to ET_XACE_GENERATOR.default_library_output_filename */
extern T0* T42x2682(T0* C);
/* Call to ET_XACE_GENERATOR.default_system_output_filename */
extern T0* T42x2681(T0* C);
/* Call to XM_NODE.parent */
extern T0* T148x5430(T0* C);
/* Call to XM_EIFFEL_SCANNER.start_condition */
extern T6 T167x9488(T0* C);
/* Call to XM_EIFFEL_SCANNER.is_applicable_encoding */
extern T1 T167x9363T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.end_of_file */
extern T1 T167x9493(T0* C);
/* Call to XM_EIFFEL_SCANNER.last_value */
extern T0* T167x9374(T0* C);
/* Call to XM_EIFFEL_SCANNER.last_token */
extern T6 T167x9484(T0* C);
/* Call to XM_EIFFEL_SCANNER.error_position */
extern T0* T167x9372(T0* C);
/* Call to GEXACE_COMMAND.set_xace_filename */
extern void T29x2115T0(T0* C, T0* a1);
/* Call to GEXACE_COMMAND.execute */
extern void T29x2120(T0* C);
/* Call to ET_XACE_GENERATOR.generate_library */
extern void T42x2688T0T0(T0* C, T0* a1, T0* a2);
/* Call to ET_XACE_GENERATOR.generate_system */
extern void T42x2687T0T0(T0* C, T0* a1, T0* a2);
/* Call to ET_XACE_GENERATOR.set_shallow */
extern void T42x2686T1(T0* C, T1 a1);
/* Call to XM_CALLBACKS_FILTER.set_next */
extern void T102x5647T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_xml_declaration */
extern void T103x5703T0T0T1(T0* C, T0* a1, T0* a2, T1 a3);
/* Call to XM_CALLBACKS.on_error */
extern void T103x5704T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_start_tag_finish */
extern void T103x5709(T0* C);
/* Call to XM_CALLBACKS.on_finish */
extern void T103x5702(T0* C);
/* Call to XM_CALLBACKS.on_attribute */
extern void T103x5708T0T0T0T0(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* Call to XM_CALLBACKS.on_end_tag */
extern void T103x5710T0T0T0(T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_start_tag */
extern void T103x5707T0T0T0(T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_content */
extern void T103x5711T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_processing_instruction */
extern void T103x5705T0T0(T0* C, T0* a1, T0* a2);
/* Call to XM_CALLBACKS.on_comment */
extern void T103x5706T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_start */
extern void T103x5701(T0* C);
/* Call to XM_NODE.node_set_parent */
extern void T148x5438T0(T0* C, T0* a1);
/* Call to XM_NODE.process */
extern void T148x5440T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.close_input */
extern void T167x9359(T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T167x9358T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.set_encoding */
extern void T167x9364T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T167x9355(T0* C);
/* Call to XM_EIFFEL_SCANNER.read_token */
extern void T167x9499(T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_stream */
extern void T167x9357T0(T0* C, T0* a1);
/* New instance of type SPECIAL [CHARACTER_8] */
extern T0* GE_new15(T6 a1, T1 initialize);
/* New instance of type STRING_8 */
extern T0* GE_new17(T1 initialize);
/* New instance of type GEXACE */
extern T0* GE_new21(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [GEXACE_COMMAND] */
extern T0* GE_new22(T1 initialize);
/* New instance of type KL_ARGUMENTS */
extern T0* GE_new23(T1 initialize);
/* New instance of type DS_HASH_TABLE [STRING_8, STRING_8] */
extern T0* GE_new24(T1 initialize);
/* New instance of type UC_STRING_EQUALITY_TESTER */
extern T0* GE_new25(T1 initialize);
/* New instance of type DS_LINKED_LIST [GEXACE_COMMAND] */
extern T0* GE_new27(T1 initialize);
/* New instance of type ET_XACE_DEFAULT_ERROR_HANDLER */
extern T0* GE_new28(T1 initialize);
/* New instance of type KL_EXCEPTIONS */
extern T0* GE_new30(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [STRING_8] */
extern T0* GE_new31(T1 initialize);
/* New instance of type DS_PAIR [STRING_8, STRING_8] */
extern T0* GE_new32(T1 initialize);
/* New instance of type DS_LINKED_LIST [STRING_8] */
extern T0* GE_new33(T1 initialize);
/* New instance of type UT_USAGE_MESSAGE */
extern T0* GE_new34(T1 initialize);
/* New instance of type GEXACE_SYSTEM_COMMAND */
extern T0* GE_new36(T1 initialize);
/* New instance of type GEXACE_LIBRARY_COMMAND */
extern T0* GE_new40(T1 initialize);
/* New instance of type GEXACE_VALIDATE_COMMAND */
extern T0* GE_new41(T1 initialize);
/* New instance of type ET_XACE_XACE_GENERATOR */
extern T0* GE_new43(T1 initialize);
/* New instance of type ET_XACE_ACE_GENERATOR */
extern T0* GE_new44(T1 initialize);
/* New instance of type ET_XACE_ECF_GENERATOR */
extern T0* GE_new45(T1 initialize);
/* New instance of type DS_LINKED_LIST [ET_XACE_GENERATOR] */
extern T0* GE_new46(T1 initialize);
/* New instance of type KL_STRING_ROUTINES */
extern T0* GE_new47(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8] */
extern T0* GE_new48(T1 initialize);
/* New instance of type SPECIAL [STRING_8] */
extern T0* GE_new50(T6 a1, T1 initialize);
/* New instance of type SPECIAL [INTEGER_32] */
extern T0* GE_new51(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
extern T0* GE_new52(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [INTEGER_32] */
extern T0* GE_new53(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [STRING_8] */
extern T0* GE_new54(T1 initialize);
/* New instance of type DS_LINKABLE [GEXACE_COMMAND] */
extern T0* GE_new55(T1 initialize);
/* New instance of type KL_STANDARD_FILES */
extern T0* GE_new57(T1 initialize);
/* New instance of type KL_STDERR_FILE */
extern T0* GE_new58(T1 initialize);
/* New instance of type KL_STDOUT_FILE */
extern T0* GE_new59(T1 initialize);
/* New instance of type KL_NULL_TEXT_OUTPUT_STREAM */
extern T0* GE_new60(T1 initialize);
/* New instance of type DS_LINKABLE [STRING_8] */
extern T0* GE_new62(T1 initialize);
/* New instance of type ARRAY [STRING_8] */
extern T0* GE_new63(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR] */
extern T0* GE_new64(T1 initialize);
/* New instance of type DS_LINKABLE [ET_XACE_GENERATOR] */
extern T0* GE_new65(T1 initialize);
/* New instance of type UC_STRING */
extern T0* GE_new69(T1 initialize);
/* New instance of type KL_ANY_ROUTINES */
extern T0* GE_new70(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8] */
extern T0* GE_new71(T1 initialize);
/* New instance of type TO_SPECIAL [INTEGER_32] */
extern T0* GE_new72(T1 initialize);
/* New instance of type TO_SPECIAL [STRING_8] */
extern T0* GE_new73(T1 initialize);
/* New instance of type STRING_TO_INTEGER_CONVERTOR */
extern T0* GE_new76(T1 initialize);
/* New instance of type ET_XACE_SYSTEM_CONFIG_PARSER */
extern T0* GE_new77(T1 initialize);
/* New instance of type ET_XACE_SYSTEM_CONFIG */
extern T0* GE_new78(T1 initialize);
/* New instance of type KL_TEXT_INPUT_FILE */
extern T0* GE_new79(T1 initialize);
/* New instance of type KL_TEXT_OUTPUT_FILE */
extern T0* GE_new81(T1 initialize);
/* New instance of type ET_XACE_LIBRARY_CONFIG_PARSER */
extern T0* GE_new82(T1 initialize);
/* New instance of type ET_XACE_LIBRARY_CONFIG */
extern T0* GE_new83(T1 initialize);
/* New instance of type ET_XACE_PARSER */
extern T0* GE_new84(T1 initialize);
/* New instance of type UT_CANNOT_READ_FILE_ERROR */
extern T0* GE_new86(T1 initialize);
/* New instance of type UT_CANNOT_WRITE_TO_FILE_ERROR */
extern T0* GE_new87(T1 initialize);
/* New instance of type INTEGER_OVERFLOW_CHECKER */
extern T0* GE_new88(T1 initialize);
/* New instance of type ET_XACE_AST_FACTORY */
extern T0* GE_new89(T1 initialize);
/* New instance of type XM_DOCUMENT */
extern T0* GE_new90(T1 initialize);
/* New instance of type XM_ELEMENT */
extern T0* GE_new91(T1 initialize);
/* New instance of type XM_POSITION_TABLE */
extern T0* GE_new92(T1 initialize);
/* New instance of type XM_TREE_CALLBACKS_PIPE */
extern T0* GE_new94(T1 initialize);
/* New instance of type XM_STOP_ON_ERROR_FILTER */
extern T0* GE_new95(T1 initialize);
/* New instance of type XM_CALLBACKS_TO_TREE_FILTER */
extern T0* GE_new96(T1 initialize);
/* New instance of type ET_XACE_VALIDATOR */
extern T0* GE_new97(T1 initialize);
/* New instance of type ET_XACE_PREPROCESSOR */
extern T0* GE_new98(T1 initialize);
/* New instance of type DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8] */
extern T0* GE_new99(T1 initialize);
/* New instance of type XM_EXPAT_PARSER_FACTORY */
extern T0* GE_new100(T1 initialize);
/* New instance of type XM_EIFFEL_PARSER */
extern T0* GE_new101(T1 initialize);
/* New instance of type SPECIAL [NATURAL_8] */
extern T0* GE_new106(T6 a1, T1 initialize);
/* New instance of type UT_MESSAGE */
extern T0* GE_new107(T1 initialize);
/* New instance of type ET_XACE_NOT_XACE_FILE_ERROR */
extern T0* GE_new108(T1 initialize);
/* New instance of type ET_XACE_CLUSTERS */
extern T0* GE_new109(T1 initialize);
/* New instance of type ET_XACE_MOUNTED_LIBRARIES */
extern T0* GE_new110(T1 initialize);
/* New instance of type ET_XACE_OPTIONS */
extern T0* GE_new111(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [STRING_8] */
extern T0* GE_new112(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [STRING_8] */
extern T0* GE_new113(T1 initialize);
/* New instance of type DS_HASH_SET [STRING_8] */
extern T0* GE_new114(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [STRING_8] */
extern T0* GE_new115(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [ET_XACE_CLUSTER] */
extern T0* GE_new116(T1 initialize);
/* New instance of type ET_XACE_CLUSTER */
extern T0* GE_new117(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY] */
extern T0* GE_new118(T1 initialize);
/* New instance of type ET_XACE_MOUNTED_LIBRARY */
extern T0* GE_new119(T1 initialize);
/* New instance of type DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS] */
extern T0* GE_new120(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS] */
extern T0* GE_new121(T1 initialize);
/* New instance of type ET_XACE_CLASS_OPTIONS */
extern T0* GE_new122(T1 initialize);
/* New instance of type DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS] */
extern T0* GE_new123(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS] */
extern T0* GE_new124(T1 initialize);
/* New instance of type ET_XACE_FEATURE_OPTIONS */
extern T0* GE_new125(T1 initialize);
/* New instance of type ET_XACE_EXTERNALS */
extern T0* GE_new126(T1 initialize);
/* New instance of type ET_XACE_OPTION_NAMES */
extern T0* GE_new127(T1 initialize);
/* New instance of type DS_LINKED_LIST [ET_XACE_ASSEMBLY] */
extern T0* GE_new128(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY] */
extern T0* GE_new129(T1 initialize);
/* New instance of type ET_XACE_ASSEMBLY */
extern T0* GE_new130(T1 initialize);
/* New instance of type KL_UNIX_FILE_SYSTEM */
extern T0* GE_new131(T1 initialize);
/* New instance of type KL_EXECUTION_ENVIRONMENT */
extern T0* GE_new132(T1 initialize);
/* New instance of type DS_LINKED_LIST [ET_XACE_CLUSTER] */
extern T0* GE_new133(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER] */
extern T0* GE_new134(T1 initialize);
/* New instance of type TUPLE [ET_XACE_CLASS_OPTIONS] */
extern T0* GE_new135(T1 initialize);
/* New instance of type PROCEDURE [ET_XACE_ECF_GENERATOR, TUPLE [ET_XACE_CLASS_OPTIONS]] */
extern T0* GE_new137(T1 initialize);
/* New instance of type TUPLE [ET_XACE_ECF_GENERATOR, INTEGER_32, KI_TEXT_OUTPUT_STREAM] */
extern T0* GE_new138(T1 initialize);
/* New instance of type TUPLE [ET_XACE_FEATURE_OPTIONS] */
extern T0* GE_new139(T1 initialize);
/* New instance of type PROCEDURE [ET_XACE_ECF_GENERATOR, TUPLE [ET_XACE_FEATURE_OPTIONS]] */
extern T0* GE_new140(T1 initialize);
/* New instance of type TUPLE [ET_XACE_ECF_GENERATOR, STRING_8, INTEGER_32, KI_TEXT_OUTPUT_STREAM] */
extern T0* GE_new141(T1 initialize);
/* New instance of type ET_TOKEN_CONSTANTS */
extern T0* GE_new142(T1 initialize);
/* New instance of type ET_SYSTEM */
extern T0* GE_new143(T1 initialize);
/* New instance of type XM_ATTRIBUTE */
extern T0* GE_new146(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [XM_NODE] */
extern T0* GE_new147(T1 initialize);
/* New instance of type DS_HASH_TABLE [INTEGER_32, STRING_8] */
extern T0* GE_new150(T1 initialize);
/* New instance of type UNIX_FILE_INFO */
extern T0* GE_new153(T1 initialize);
/* New instance of type SPECIAL [NATURAL_64] */
extern T0* GE_new154(T6 a1, T1 initialize);
/* New instance of type XM_NAMESPACE_RESOLVER */
extern T0* GE_new155(T1 initialize);
/* New instance of type SPECIAL [XM_CALLBACKS_FILTER] */
extern T0* GE_new156(T6 a1, T1 initialize);
/* New instance of type ARRAY [XM_CALLBACKS_FILTER] */
extern T0* GE_new157(T1 initialize);
/* New instance of type XM_CALLBACKS_NULL */
extern T0* GE_new158(T1 initialize);
/* New instance of type UT_TEMPLATE_EXPANDER */
extern T0* GE_new160(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [ET_XACE_LIBRARY_CONFIG, STRING_8] */
extern T0* GE_new162(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8] */
extern T0* GE_new164(T1 initialize);
/* New instance of type SPECIAL [ET_XACE_LIBRARY_CONFIG] */
extern T0* GE_new165(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY_CONFIG] */
extern T0* GE_new166(T1 initialize);
/* New instance of type XM_EIFFEL_SCANNER */
extern T0* GE_new167(T1 initialize);
/* New instance of type XM_DEFAULT_POSITION */
extern T0* GE_new168(T1 initialize);
/* New instance of type DS_BILINKED_LIST [XM_POSITION] */
extern T0* GE_new170(T1 initialize);
/* New instance of type DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
extern T0* GE_new171(T1 initialize);
/* New instance of type DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
extern T0* GE_new172(T1 initialize);
/* New instance of type XM_NULL_EXTERNAL_RESOLVER */
extern T0* GE_new174(T1 initialize);
/* New instance of type SPECIAL [ANY] */
extern T0* GE_new175(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ANY] */
extern T0* GE_new176(T1 initialize);
/* New instance of type XM_EIFFEL_PARSER_NAME */
extern T0* GE_new177(T1 initialize);
/* New instance of type XM_EIFFEL_DECLARATION */
extern T0* GE_new178(T1 initialize);
/* New instance of type XM_DTD_EXTERNAL_ID */
extern T0* GE_new179(T1 initialize);
/* New instance of type DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new180(T1 initialize);
/* New instance of type XM_DTD_ELEMENT_CONTENT */
extern T0* GE_new181(T1 initialize);
/* New instance of type DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new182(T1 initialize);
/* New instance of type XM_DTD_ATTRIBUTE_CONTENT */
extern T0* GE_new183(T1 initialize);
/* New instance of type DS_BILINKED_LIST [STRING_8] */
extern T0* GE_new184(T1 initialize);
/* New instance of type SPECIAL [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new185(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new186(T1 initialize);
/* New instance of type SPECIAL [XM_EIFFEL_DECLARATION] */
extern T0* GE_new187(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
extern T0* GE_new188(T1 initialize);
/* New instance of type SPECIAL [BOOLEAN] */
extern T0* GE_new189(T6 a1, T1 initialize);
/* New instance of type SPECIAL [XM_DTD_EXTERNAL_ID] */
extern T0* GE_new190(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [BOOLEAN] */
extern T0* GE_new191(T1 initialize);
/* New instance of type SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
extern T0* GE_new192(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
extern T0* GE_new193(T1 initialize);
/* New instance of type SPECIAL [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new194(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new195(T1 initialize);
/* New instance of type SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
extern T0* GE_new197(T6 a1, T1 initialize);
/* New instance of type SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new199(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
extern T0* GE_new200(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new201(T1 initialize);
/* New instance of type SPECIAL [DS_BILINKED_LIST [STRING_8]] */
extern T0* GE_new202(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
extern T0* GE_new203(T1 initialize);
/* New instance of type XM_EIFFEL_ENTITY_DEF */
extern T0* GE_new204(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
extern T0* GE_new205(T1 initialize);
/* New instance of type XM_DTD_CALLBACKS_NULL */
extern T0* GE_new207(T1 initialize);
/* New instance of type XM_EIFFEL_SCANNER_DTD */
extern T0* GE_new208(T1 initialize);
/* New instance of type XM_EIFFEL_PE_ENTITY_DEF */
extern T0* GE_new210(T1 initialize);
/* New instance of type ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR */
extern T0* GE_new211(T1 initialize);
/* New instance of type ET_XACE_BOOLEAN_EXPECTED_ERROR */
extern T0* GE_new212(T1 initialize);
/* New instance of type ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR */
extern T0* GE_new213(T1 initialize);
/* New instance of type ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR */
extern T0* GE_new214(T1 initialize);
/* New instance of type ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR */
extern T0* GE_new215(T1 initialize);
/* New instance of type ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING */
extern T0* GE_new216(T1 initialize);
/* New instance of type ET_XACE_WRONG_ROOT_ELEMENT_ERROR */
extern T0* GE_new217(T1 initialize);
/* New instance of type ET_XACE_MISSING_ATTRIBUTE_ERROR */
extern T0* GE_new218(T1 initialize);
/* New instance of type ET_XACE_MISSING_ELEMENT_ERROR */
extern T0* GE_new219(T1 initialize);
/* New instance of type ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING */
extern T0* GE_new220(T1 initialize);
/* New instance of type ET_XACE_UNKNOWN_ELEMENT_ERROR */
extern T0* GE_new221(T1 initialize);
/* New instance of type ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING */
extern T0* GE_new222(T1 initialize);
/* New instance of type ET_XACE_UNKNOWN_OPTION_NAME_WARNING */
extern T0* GE_new223(T1 initialize);
/* New instance of type KL_OPERATING_SYSTEM */
extern T0* GE_new224(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
extern T0* GE_new227(T1 initialize);
/* New instance of type DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
extern T0* GE_new228(T1 initialize);
/* New instance of type DS_PAIR [XM_POSITION, XM_NODE] */
extern T0* GE_new229(T1 initialize);
/* New instance of type ARRAY [INTEGER_32] */
extern T0* GE_new230(T1 initialize);
/* New instance of type UC_UTF8_ROUTINES */
extern T0* GE_new231(T1 initialize);
/* New instance of type UC_UTF8_STRING */
extern T0* GE_new233(T1 initialize);
/* New instance of type XM_EIFFEL_INPUT_STREAM */
extern T0* GE_new235(T1 initialize);
/* New instance of type KL_INTEGER_ROUTINES */
extern T0* GE_new236(T1 initialize);
/* New instance of type KL_PLATFORM */
extern T0* GE_new237(T1 initialize);
/* New instance of type UT_TRISTATE */
extern T0* GE_new238(T1 initialize);
/* New instance of type SPECIAL [ET_XACE_CLUSTER] */
extern T0* GE_new239(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER] */
extern T0* GE_new240(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_XACE_CLUSTER] */
extern T0* GE_new241(T1 initialize);
/* New instance of type SPECIAL [ET_XACE_MOUNTED_LIBRARY] */
extern T0* GE_new242(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY] */
extern T0* GE_new243(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_XACE_MOUNTED_LIBRARY] */
extern T0* GE_new244(T1 initialize);
/* New instance of type DS_LINKABLE [ET_XACE_CLASS_OPTIONS] */
extern T0* GE_new245(T1 initialize);
/* New instance of type DS_LINKABLE [ET_XACE_FEATURE_OPTIONS] */
extern T0* GE_new246(T1 initialize);
/* New instance of type DS_LINKABLE [ET_XACE_ASSEMBLY] */
extern T0* GE_new247(T1 initialize);
/* New instance of type EXECUTION_ENVIRONMENT */
extern T0* GE_new248(T1 initialize);
/* New instance of type DS_LINKABLE [ET_XACE_CLUSTER] */
extern T0* GE_new249(T1 initialize);
/* New instance of type ET_ERROR_HANDLER */
extern T0* GE_new250(T1 initialize);
/* New instance of type ET_AST_FACTORY */
extern T0* GE_new251(T1 initialize);
/* New instance of type ET_AST_NULL_PROCESSOR */
extern T0* GE_new252(T1 initialize);
/* New instance of type ET_ADAPTED_LIBRARIES */
extern T0* GE_new254(T1 initialize);
/* New instance of type ET_CLUSTERS */
extern T0* GE_new255(T1 initialize);
/* New instance of type ET_ADAPTED_DOTNET_ASSEMBLIES */
extern T0* GE_new256(T1 initialize);
/* New instance of type DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME] */
extern T0* GE_new257(T1 initialize);
/* New instance of type ET_CLASS_NAME_TESTER */
extern T0* GE_new258(T1 initialize);
/* New instance of type ET_CLASS */
extern T0* GE_new260(T1 initialize);
/* New instance of type ET_NONE_GROUP */
extern T0* GE_new261(T1 initialize);
/* New instance of type ET_TUPLE_TYPE */
extern T0* GE_new263(T1 initialize);
/* New instance of type ET_ACTUAL_PARAMETER_LIST */
extern T0* GE_new265(T1 initialize);
/* New instance of type ET_CLASS_TYPE */
extern T0* GE_new266(T1 initialize);
/* New instance of type ET_CLIENT */
extern T0* GE_new267(T1 initialize);
/* New instance of type ET_PARENT */
extern T0* GE_new268(T1 initialize);
/* New instance of type ET_PARENT_LIST */
extern T0* GE_new273(T1 initialize);
/* New instance of type ET_CLIENT_LIST */
extern T0* GE_new275(T1 initialize);
/* New instance of type ET_GENERIC_CLASS_TYPE */
extern T0* GE_new278(T1 initialize);
/* New instance of type ET_BUILTIN_CONVERT_FEATURE */
extern T0* GE_new279(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [INTEGER_32, STRING_8] */
extern T0* GE_new282(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [INTEGER_32, STRING_8] */
extern T0* GE_new284(T1 initialize);
/* New instance of type XM_NAMESPACE_RESOLVER_CONTEXT */
extern T0* GE_new286(T1 initialize);
/* New instance of type DS_LINKED_QUEUE [STRING_8] */
extern T0* GE_new288(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8] */
extern T0* GE_new289(T1 initialize);
/* New instance of type TO_SPECIAL [ET_XACE_LIBRARY_CONFIG] */
extern T0* GE_new290(T1 initialize);
/* New instance of type XM_EIFFEL_CHARACTER_ENTITY */
extern T0* GE_new291(T1 initialize);
/* New instance of type YY_BUFFER */
extern T0* GE_new292(T1 initialize);
/* New instance of type YY_FILE_BUFFER */
extern T0* GE_new293(T1 initialize);
/* New instance of type DS_LINKED_STACK [INTEGER_32] */
extern T0* GE_new296(T1 initialize);
/* New instance of type DS_BILINKABLE [XM_POSITION] */
extern T0* GE_new297(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [XM_POSITION] */
extern T0* GE_new298(T1 initialize);
/* New instance of type DS_LINKABLE [XM_EIFFEL_SCANNER] */
extern T0* GE_new299(T1 initialize);
/* New instance of type SPECIAL [XM_EIFFEL_ENTITY_DEF] */
extern T0* GE_new300(T6 a1, T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8] */
extern T0* GE_new301(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
extern T0* GE_new303(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
extern T0* GE_new305(T1 initialize);
/* New instance of type TO_SPECIAL [ANY] */
extern T0* GE_new306(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new307(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new308(T1 initialize);
/* New instance of type DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new309(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new310(T1 initialize);
/* New instance of type DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new311(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [STRING_8] */
extern T0* GE_new312(T1 initialize);
/* New instance of type DS_BILINKABLE [STRING_8] */
extern T0* GE_new313(T1 initialize);
/* New instance of type TO_SPECIAL [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new314(T1 initialize);
/* New instance of type TO_SPECIAL [XM_EIFFEL_DECLARATION] */
extern T0* GE_new315(T1 initialize);
/* New instance of type TO_SPECIAL [BOOLEAN] */
extern T0* GE_new316(T1 initialize);
/* New instance of type TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
extern T0* GE_new317(T1 initialize);
/* New instance of type TO_SPECIAL [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new318(T1 initialize);
/* New instance of type TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
extern T0* GE_new319(T1 initialize);
/* New instance of type TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new320(T1 initialize);
/* New instance of type TO_SPECIAL [DS_BILINKED_LIST [STRING_8]] */
extern T0* GE_new321(T1 initialize);
/* New instance of type TO_SPECIAL [XM_DTD_EXTERNAL_ID] */
extern T0* GE_new322(T1 initialize);
/* New instance of type ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING */
extern T0* GE_new323(T1 initialize);
/* New instance of type ET_XACE_INVALID_EXPRESSION_ERROR */
extern T0* GE_new324(T1 initialize);
/* New instance of type UC_UNICODE_ROUTINES */
extern T0* GE_new325(T1 initialize);
/* New instance of type KL_ARRAY_ROUTINES [INTEGER_32] */
extern T0* GE_new326(T1 initialize);
/* New instance of type DS_LINKED_QUEUE [CHARACTER_8] */
extern T0* GE_new330(T1 initialize);
/* New instance of type UC_UTF16_ROUTINES */
extern T0* GE_new331(T1 initialize);
/* New instance of type TO_SPECIAL [ET_XACE_CLUSTER] */
extern T0* GE_new332(T1 initialize);
/* New instance of type TO_SPECIAL [ET_XACE_MOUNTED_LIBRARY] */
extern T0* GE_new333(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [ET_ADAPTED_LIBRARY] */
extern T0* GE_new334(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [ET_CLUSTER] */
extern T0* GE_new335(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [ET_ADAPTED_DOTNET_ASSEMBLY] */
extern T0* GE_new336(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [ET_CLASS, ET_CLASS_NAME] */
extern T0* GE_new338(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME] */
extern T0* GE_new340(T1 initialize);
/* New instance of type SPECIAL [ET_CLASS] */
extern T0* GE_new341(T6 a1, T1 initialize);
/* New instance of type SPECIAL [ET_CLASS_NAME] */
extern T0* GE_new342(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_CLASS] */
extern T0* GE_new343(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_CLASS_NAME] */
extern T0* GE_new344(T1 initialize);
/* New instance of type ET_IDENTIFIER */
extern T0* GE_new345(T1 initialize);
/* New instance of type ET_SYMBOL */
extern T0* GE_new346(T1 initialize);
/* New instance of type ET_BRACKET_SYMBOL */
extern T0* GE_new347(T1 initialize);
/* New instance of type SPECIAL [ET_ACTUAL_PARAMETER_ITEM] */
extern T0* GE_new349(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_ACTUAL_PARAMETER_ITEM] */
extern T0* GE_new350(T1 initialize);
/* New instance of type ET_KEYWORD */
extern T0* GE_new351(T1 initialize);
/* New instance of type SPECIAL [ET_PARENT_ITEM] */
extern T0* GE_new353(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_PARENT_ITEM] */
extern T0* GE_new354(T1 initialize);
/* New instance of type SPECIAL [ET_CLIENT_ITEM] */
extern T0* GE_new355(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_CLIENT_ITEM] */
extern T0* GE_new356(T1 initialize);
/* New instance of type ET_BRACED_TYPE_LIST */
extern T0* GE_new359(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [INTEGER_32, STRING_8] */
extern T0* GE_new360(T1 initialize);
/* New instance of type DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
extern T0* GE_new362(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
extern T0* GE_new363(T1 initialize);
/* New instance of type DS_LINKABLE [INTEGER_32] */
extern T0* GE_new365(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
extern T0* GE_new366(T1 initialize);
/* New instance of type TO_SPECIAL [XM_EIFFEL_ENTITY_DEF] */
extern T0* GE_new367(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new368(T1 initialize);
/* New instance of type DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new369(T1 initialize);
/* New instance of type C_STRING */
extern T0* GE_new370(T1 initialize);
/* New instance of type DS_HASH_SET [XM_NAMESPACE] */
extern T0* GE_new371(T1 initialize);
/* New instance of type XM_COMMENT */
extern T0* GE_new372(T1 initialize);
/* New instance of type XM_PROCESSING_INSTRUCTION */
extern T0* GE_new373(T1 initialize);
/* New instance of type XM_CHARACTER_DATA */
extern T0* GE_new374(T1 initialize);
/* New instance of type XM_NAMESPACE */
extern T0* GE_new375(T1 initialize);
/* New instance of type DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
extern T0* GE_new377(T1 initialize);
/* New instance of type ET_BASE_TYPE_LIST */
extern T0* GE_new381(T1 initialize);
/* New instance of type ET_QUERY_LIST */
extern T0* GE_new382(T1 initialize);
/* New instance of type ET_PROCEDURE_LIST */
extern T0* GE_new383(T1 initialize);
/* New instance of type KL_CHARACTER_BUFFER */
extern T0* GE_new384(T1 initialize);
/* New instance of type SPECIAL [ARRAY [INTEGER_32]] */
extern T0* GE_new385(T6 a1, T1 initialize);
/* New instance of type SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
extern T0* GE_new386(T6 a1, T1 initialize);
/* New instance of type DS_LINKABLE [CHARACTER_8] */
extern T0* GE_new387(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_ADAPTED_LIBRARY] */
extern T0* GE_new389(T1 initialize);
/* New instance of type SPECIAL [ET_ADAPTED_LIBRARY] */
extern T0* GE_new391(T6 a1, T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_LIBRARY] */
extern T0* GE_new392(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_CLUSTER] */
extern T0* GE_new393(T1 initialize);
/* New instance of type SPECIAL [ET_CLUSTER] */
extern T0* GE_new394(T6 a1, T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_CLUSTER] */
extern T0* GE_new395(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_ADAPTED_DOTNET_ASSEMBLY] */
extern T0* GE_new396(T1 initialize);
/* New instance of type SPECIAL [ET_ADAPTED_DOTNET_ASSEMBLY] */
extern T0* GE_new398(T6 a1, T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_DOTNET_ASSEMBLY] */
extern T0* GE_new399(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [ET_CLASS, ET_CLASS_NAME] */
extern T0* GE_new400(T1 initialize);
/* New instance of type TO_SPECIAL [ET_CLASS] */
extern T0* GE_new401(T1 initialize);
/* New instance of type TO_SPECIAL [ET_CLASS_NAME] */
extern T0* GE_new402(T1 initialize);
/* New instance of type TO_SPECIAL [ET_ACTUAL_PARAMETER_ITEM] */
extern T0* GE_new403(T1 initialize);
/* New instance of type TO_SPECIAL [ET_PARENT_ITEM] */
extern T0* GE_new404(T1 initialize);
/* New instance of type TO_SPECIAL [ET_CLIENT_ITEM] */
extern T0* GE_new405(T1 initialize);
/* New instance of type DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
extern T0* GE_new409(T1 initialize);
/* New instance of type DS_LINKABLE [XM_NODE] */
extern T0* GE_new412(T1 initialize);
/* New instance of type XM_NODE_TYPER */
extern T0* GE_new414(T1 initialize);
/* New instance of type KL_WINDOWS_FILE_SYSTEM */
extern T0* GE_new418(T1 initialize);
/* New instance of type KL_STRING_INPUT_STREAM */
extern T0* GE_new421(T1 initialize);
/* New instance of type MANAGED_POINTER */
extern T0* GE_new422(T1 initialize);
/* New instance of type SPECIAL [XM_NAMESPACE] */
extern T0* GE_new423(T6 a1, T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [XM_NAMESPACE] */
extern T0* GE_new424(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [XM_NAMESPACE] */
extern T0* GE_new425(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
extern T0* GE_new426(T1 initialize);
/* New instance of type TO_SPECIAL [ET_ADAPTED_LIBRARY] */
extern T0* GE_new427(T1 initialize);
/* New instance of type TO_SPECIAL [ET_CLUSTER] */
extern T0* GE_new428(T1 initialize);
/* New instance of type TO_SPECIAL [ET_ADAPTED_DOTNET_ASSEMBLY] */
extern T0* GE_new429(T1 initialize);
/* New instance of type SPECIAL [ET_BASE_TYPE] */
extern T0* GE_new432(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_BASE_TYPE] */
extern T0* GE_new433(T1 initialize);
/* New instance of type SPECIAL [ET_QUERY] */
extern T0* GE_new435(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_QUERY] */
extern T0* GE_new436(T1 initialize);
/* New instance of type SPECIAL [ET_PROCEDURE] */
extern T0* GE_new438(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ET_PROCEDURE] */
extern T0* GE_new439(T1 initialize);
/* New instance of type EXCEPTIONS */
extern T0* GE_new441(T1 initialize);
/* New instance of type TO_SPECIAL [XM_NAMESPACE] */
extern T0* GE_new442(T1 initialize);
/* New instance of type PLATFORM */
extern T0* GE_new443(T1 initialize);
/* New instance of type TO_SPECIAL [ET_BASE_TYPE] */
extern T0* GE_new444(T1 initialize);
/* New instance of type TO_SPECIAL [ET_QUERY] */
extern T0* GE_new445(T1 initialize);
/* New instance of type TO_SPECIAL [ET_PROCEDURE] */
extern T0* GE_new446(T1 initialize);
/* New instance of type STRING_SEARCHER */
extern T0* GE_new447(T1 initialize);
/* GEXACE.make */
extern T0* T21c20(void);
/* KL_EXCEPTIONS.die */
extern void T30f2(T0* C, T6 a1);
/* GEXACE.exceptions */
extern unsigned char ge169os1793;
extern T0* ge169ov1793;
extern T0* T21f6(T0* C);
/* KL_EXCEPTIONS.default_create */
extern T0* T30c1(void);
/* ET_XACE_DEFAULT_ERROR_HANDLER.has_error */
extern T1 T28f5(T0* C);
/* INTEGER_32.infix ">" */
extern T1 T6f4(T6* C, T6 a1);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].forth */
extern void T22f9(T0* C);
/* DS_LINKED_LIST [GEXACE_COMMAND].cursor_forth */
extern void T27f11(T0* C, T0* a1);
/* DS_LINKED_LIST [GEXACE_COMMAND].add_traversing_cursor */
extern void T27f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].set_next_cursor */
extern void T22f11(T0* C, T0* a1);
/* DS_LINKED_LIST [GEXACE_COMMAND].remove_traversing_cursor */
extern void T27f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].set */
extern void T22f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].item */
extern T0* T22f6(T0* C);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].start */
extern void T22f8(T0* C);
/* DS_LINKED_LIST [GEXACE_COMMAND].cursor_start */
extern void T27f10(T0* C, T0* a1);
/* DS_LINKED_LIST [GEXACE_COMMAND].cursor_off */
extern T1 T27f7(T0* C, T0* a1);
/* DS_LINKED_LIST [GEXACE_COMMAND].new_cursor */
extern T0* T27f6(T0* C);
/* DS_LINKED_LIST_CURSOR [GEXACE_COMMAND].make */
extern T0* T22c7(T0* a1);
/* GEXACE.process_arguments */
extern void T21f22(T0* C);
/* GEXACE.process_command */
extern void T21f26(T0* C);
/* GEXACE.report_usage_error */
extern void T21f29(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_error */
extern void T28f11(T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_error_message */
extern void T28f15(T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_error_message */
extern void T28f15p1(T0* C, T0* a1);
/* KL_STDERR_FILE.put_line */
extern void T58f11(T0* C, T0* a1);
/* KL_STDERR_FILE.put_new_line */
extern void T58f14(T0* C);
/* KL_STDERR_FILE.put_string */
extern void T58f13(T0* C, T0* a1);
/* KL_STDERR_FILE.old_put_string */
extern void T58f17(T0* C, T0* a1);
/* KL_STDERR_FILE.console_ps */
extern void T58f18(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STRING_ROUTINES.as_string */
extern T0* T47f10(T0* C, T0* a1);
/* UC_UTF8_STRING.string */
extern T0* T233f38(T0* C);
/* UC_UTF8_STRING.next_byte_index */
extern T6 T233f25(T0* C, T6 a1);
/* UC_UTF8_ROUTINES.encoded_byte_count */
extern T6 T231f3(T0* C, T2 a1);
/* CHARACTER_8.infix "<=" */
extern T1 T2f17(T2* C, T2 a1);
/* CHARACTER_8.infix "<" */
extern T1 T2f15(T2* C, T2 a1);
/* UC_UTF8_STRING.utf8 */
extern unsigned char ge185os3981;
extern T0* ge185ov3981;
extern T0* T233f26(T0* C);
/* UC_UTF8_ROUTINES.default_create */
extern T0* T231c36(void);
/* KL_INTEGER_ROUTINES.to_character */
extern T2 T236f2(T0* C, T6 a1);
/* UC_UTF8_STRING.integer_ */
extern unsigned char ge87os2960;
extern T0* ge87ov2960;
extern T0* T233f24(T0* C);
/* KL_INTEGER_ROUTINES.default_create */
extern T0* T236c4(void);
/* INTEGER_32.infix "<=" */
extern T1 T6f6(T6* C, T6 a1);
/* KL_PLATFORM.maximum_character_code */
extern unsigned char ge166os10213;
extern T6 ge166ov10213;
extern T6 T237f1(T0* C);
/* UC_UTF8_STRING.platform */
extern unsigned char ge173os2957;
extern T0* ge173ov2957;
extern T0* T233f23(T0* C);
/* KL_PLATFORM.default_create */
extern T0* T237c3(void);
/* UC_UTF8_STRING.item_code_at_byte_index */
extern T6 T233f22(T0* C, T6 a1);
/* UC_UTF8_ROUTINES.encoded_next_value */
extern T6 T231f6(T0* C, T2 a1);
/* UC_UTF8_ROUTINES.encoded_first_value */
extern T6 T231f4(T0* C, T2 a1);
/* STRING_8.append_character */
extern void T17f36(T0* C, T2 a1);
/* STRING_8.resize */
extern void T17f41(T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].aliased_resized_area */
extern T0* T15f5(T0* C, T6 a1);
/* INTEGER_32.infix ">=" */
extern T1 T6f2(T6* C, T6 a1);
/* STRING_8.additional_space */
extern T6 T17f23(T0* C);
/* INTEGER_32.max */
extern T6 T6f14(T6* C, T6 a1);
/* STRING_8.capacity */
extern T6 T17f22(T0* C);
/* UC_UTF8_STRING.byte_item */
extern T2 T233f21(T0* C, T6 a1);
/* UC_UTF8_STRING.old_item */
extern T2 T233f34(T0* C, T6 a1);
/* UC_UTF8_STRING.set_count */
extern void T233f64(T0* C, T6 a1);
/* UC_UTF8_STRING.reset_byte_index_cache */
extern void T233f71(T0* C);
/* STRING_8.make */
extern void T17f34(T0* C, T6 a1);
/* STRING_8.make */
extern T0* T17c34(T6 a1);
/* SPECIAL [CHARACTER_8].make */
extern T0* T15c10(T6 a1);
/* STRING_8.string */
extern T0* T17f25(T0* C);
/* STRING_8.make_from_string */
extern T0* T17c43(T0* a1);
/* SPECIAL [CHARACTER_8].twin */
extern T0* T15f4(T0* C);
/* UC_UTF8_STRING.as_string */
extern T0* T233f37(T0* C);
/* UC_UTF8_STRING.to_utf8 */
extern T0* T233f19(T0* C);
/* KL_ANY_ROUTINES.same_types */
extern T1 T70f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.any_ */
extern unsigned char ge79os1878;
extern T0* ge79ov1878;
extern T0* T47f5(T0* C);
/* KL_ANY_ROUTINES.default_create */
extern T0* T70c3(void);
/* KL_STDERR_FILE.string_ */
extern unsigned char ge92os1786;
extern T0* ge92ov1786;
extern T0* T58f6(T0* C);
/* KL_STRING_ROUTINES.default_create */
extern T0* T47c14(void);
/* ET_XACE_DEFAULT_ERROR_HANDLER.message */
extern T0* T28f6(T0* C, T0* a1);
/* GEXACE.usage_message */
extern unsigned char ge50os1773;
extern T0* ge50ov1773;
extern T0* T21f15(T0* C);
/* UT_USAGE_MESSAGE.make */
extern T0* T34c7(T0* a1);
/* ARRAY [STRING_8].put */
extern void T63f7(T0* C, T0* a1, T6 a2);
/* ARRAY [STRING_8].make */
extern T0* T63c6(T6 a1, T6 a2);
/* ARRAY [STRING_8].make_area */
extern void T63f8(T0* C, T6 a1);
/* SPECIAL [STRING_8].make */
extern T0* T50c4(T6 a1);
/* GEXACE.process_validate */
extern void T21f32(T0* C);
/* GEXACE.process_xace_file */
extern void T21f36(T0* C, T0* a1);
/* GEXACE.next_option */
extern T0* T21f17(T0* C);
/* KL_ARGUMENTS.argument */
extern T0* T23f3(T0* C, T6 a1);
/* GEXACE.has_next_option */
extern T1 T21f16(T0* C);
/* GEXACE.is_valid_option_position */
extern T1 T21f19(T0* C, T6 a1);
/* GEXACE.consume_option */
extern void T21f28(T0* C);
/* DS_LINKED_LIST [GEXACE_COMMAND].force_last */
extern void T27f9(T0* C, T0* a1);
/* DS_LINKABLE [GEXACE_COMMAND].put_right */
extern void T55f4(T0* C, T0* a1);
/* DS_LINKABLE [GEXACE_COMMAND].make */
extern T0* T55c3(T0* a1);
/* DS_LINKED_LIST [GEXACE_COMMAND].is_empty */
extern T1 T27f5(T0* C);
/* GEXACE_VALIDATE_COMMAND.set_shallow */
extern void T41f7(T0* C, T1 a1);
/* GEXACE_VALIDATE_COMMAND.make */
extern T0* T41c6(T0* a1, T0* a2);
/* GEXACE.process_library */
extern void T21f31(T0* C);
/* GEXACE.process_output */
extern void T21f35(T0* C, T0* a1);
/* GEXACE_LIBRARY_COMMAND.set_output_filename */
extern void T40f13(T0* C, T0* a1);
/* GEXACE_SYSTEM_COMMAND.set_output_filename */
extern void T36f13(T0* C, T0* a1);
/* GEXACE.process_compilers */
extern void T21f34(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].is_empty */
extern T1 T46f5(T0* C);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].force_last */
extern void T46f9(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_GENERATOR].put_right */
extern void T65f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_GENERATOR].make */
extern T0* T65c3(T0* a1);
/* STRING_8.is_equal */
extern T1 T17f8(T0* C, T0* a1);
/* STRING_8.str_strict_cmp */
extern T6 T17f11(T0* C, T0* a1, T0* a2, T6 a3);
/* ET_XACE_ECF_GENERATOR.make */
extern T0* T45c23(T0* a1, T0* a2, T0* a3);
/* ET_XACE_ACE_GENERATOR.make */
extern T0* T44c17(T0* a1, T0* a2, T0* a3);
/* ET_XACE_XACE_GENERATOR.make */
extern T0* T43c17(T0* a1, T0* a2, T0* a3);
/* STRING_8.same_string */
extern T1 T17f7(T0* C, T0* a1);
/* STRING_8.same_string_general */
extern T1 T17f10(T0* C, T0* a1);
/* UC_UTF8_STRING.code */
extern T10 T233f12(T0* C, T6 a1);
/* UC_UTF8_STRING.item_code */
extern T6 T233f13(T0* C, T6 a1);
/* UC_UTF8_STRING.byte_index */
extern T6 T233f31(T0* C, T6 a1);
/* STRING_8.code */
extern T10 T17f12(T0* C, T6 a1);
/* INTEGER_32.to_natural_32 */
extern T10 T6f7(T6* C);
/* SPECIAL [CHARACTER_8].same_items */
extern T1 T15f2(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* DS_HASH_TABLE [STRING_8, STRING_8].force_last */
extern void T24f40(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_put */
extern void T24f48(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_put */
extern void T24f47(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_put */
extern void T24f46(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_item */
extern T6 T24f22(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].hash_position */
extern T6 T24f28(T0* C, T0* a1);
/* UC_UTF8_STRING.hash_code */
extern T6 T233f14(T0* C);
/* UC_UTF8_STRING.hash_code */
extern T6 T233f14p1(T0* C);
/* INTEGER_32.infix "|<<" */
extern T6 T6f12(T6* C, T6 a1);
/* STRING_8.hash_code */
extern T6 T17f14(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].resize */
extern void T24f45(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_resize */
extern void T24f53(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].resize */
extern T0* T53f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [INTEGER_32].aliased_resized_area */
extern T0* T51f3(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].special_integer_ */
extern unsigned char ge90os2340;
extern T0* ge90ov2340;
extern T0* T24f27(T0* C);
/* KL_SPECIAL_ROUTINES [INTEGER_32].default_create */
extern T0* T53c4(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_resize */
extern void T24f52(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].resize */
extern T0* T54f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].aliased_resized_area */
extern T0* T50f3(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_resize */
extern void T24f51(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_item */
extern T0* T24f24(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_item */
extern T6 T24f25(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_resize */
extern void T24f50(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_modulus */
extern T6 T24f29(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_capacity */
extern T6 T24f23(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_put */
extern void T24f44(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].search_position */
extern void T24f43(T0* C, T0* a1);
/* UC_STRING_EQUALITY_TESTER.test */
extern T1 T25f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.same_string */
extern T1 T47f1(T0* C, T0* a1, T0* a2);
/* STRING_8.item_code */
extern T6 T17f15(T0* C, T6 a1);
/* KL_STRING_ROUTINES.elks_same_string */
extern T1 T47f7(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.same_string */
extern T1 T233f11(T0* C, T0* a1);
/* UC_UTF8_STRING.substring_index */
extern T6 T233f30(T0* C, T0* a1, T6 a2);
/* UC_UTF8_STRING.item */
extern T2 T233f15(T0* C, T6 a1);
/* UC_UTF8_STRING.character_item_at_byte_index */
extern T2 T233f33(T0* C, T6 a1);
/* STRING_8.item */
extern T2 T17f13(T0* C, T6 a1);
/* UC_UTF8_STRING.same_unicode_string */
extern T1 T233f10(T0* C, T0* a1);
/* UC_UTF8_STRING.unicode_substring_index */
extern T6 T233f29(T0* C, T0* a1, T6 a2);
/* NATURAL_32.to_integer_32 */
extern T6 T10f7(T10* C);
/* UC_STRING_EQUALITY_TESTER.string_ */
extern T0* T25f2(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].unset_found_item */
extern void T24f42(T0* C);
/* GEXACE.process_format */
extern void T21f33(T0* C, T0* a1);
/* GEXACE_LIBRARY_COMMAND.set_format */
extern void T40f12(T0* C, T0* a1);
/* GEXACE_SYSTEM_COMMAND.set_format */
extern void T36f12(T0* C, T0* a1);
/* GEXACE.next_option_value */
extern T0* T21f11(T0* C);
/* STRING_8.substring */
extern T0* T17f4(T0* C, T6 a1, T6 a2);
/* STRING_8.set_count */
extern void T17f35(T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].copy_data */
extern void T15f9(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [CHARACTER_8].move_data */
extern void T15f11(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].overlapping_move */
extern void T15f14(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].non_overlapping_move */
extern void T15f13(T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.new_string */
extern T0* T17f6(T0* C, T6 a1);
/* STRING_8.index_of */
extern T6 T17f5(T0* C, T2 a1, T6 a2);
/* GEXACE.has_next_option_value */
extern T1 T21f10(T0* C);
/* GEXACE.is_next_option_long_option */
extern T1 T21f9(T0* C);
/* GEXACE.string_ */
extern T0* T21f18(T0* C);
/* GEXACE_LIBRARY_COMMAND.set_shallow */
extern void T40f11(T0* C, T1 a1);
/* GEXACE_LIBRARY_COMMAND.make */
extern T0* T40c10(T0* a1, T0* a2);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].make */
extern T0* T46c8(void);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].new_cursor */
extern T0* T46f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].make */
extern T0* T64c7(T0* a1);
/* GEXACE.process_system */
extern void T21f30(T0* C);
/* GEXACE_SYSTEM_COMMAND.set_shallow */
extern void T36f11(T0* C, T1 a1);
/* GEXACE_SYSTEM_COMMAND.make */
extern T0* T36c10(T0* a1, T0* a2);
/* GEXACE.match_long_option */
extern T1 T21f8(T0* C, T0* a1);
/* GEXACE.process_options */
extern void T21f25(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.enable_verbose */
extern void T28f10(T0* C);
/* KL_STANDARD_FILES.output */
extern unsigned char ge138os3041;
extern T0* ge138ov3041;
extern T0* T57f2(T0* C);
/* KL_STDOUT_FILE.make */
extern T0* T59c7(void);
/* KL_STDOUT_FILE.make_open_stdout */
extern void T59f9(T0* C, T0* a1);
/* KL_STDOUT_FILE.set_write_mode */
extern void T59f11(T0* C);
/* KL_STDOUT_FILE.console_def */
extern T14 T59f4(T0* C, T6 a1);
/* KL_STDOUT_FILE.old_make */
extern void T59f10(T0* C, T0* a1);
/* KL_STANDARD_FILES.error */
extern unsigned char ge138os3042;
extern T0* ge138ov3042;
extern T0* T57f1(T0* C);
/* KL_STDERR_FILE.make */
extern T0* T58c9(void);
/* KL_STDERR_FILE.make_open_stderr */
extern void T58f12(T0* C, T0* a1);
/* KL_STDERR_FILE.set_write_mode */
extern void T58f16(T0* C);
/* KL_STDERR_FILE.console_def */
extern T14 T58f5(T0* C, T6 a1);
/* KL_STDERR_FILE.old_make */
extern void T58f15(T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.std */
extern unsigned char ge136os2466;
extern T0* ge136ov2466;
extern T0* T28f7(T0* C);
/* KL_STANDARD_FILES.default_create */
extern T0* T57c3(void);
/* GEXACE.process_define */
extern void T21f24(T0* C);
/* GEXACE.process_define_string */
extern void T21f27(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].forth */
extern void T31f10(T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_forth */
extern void T33f12(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].add_traversing_cursor */
extern void T33f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T31f12(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].remove_traversing_cursor */
extern void T33f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].set */
extern void T31f11(T0* C, T0* a1, T1 a2, T1 a3);
/* GEXACE.split_on_first */
extern T0* T21f14(T0* C, T0* a1, T2 a2);
/* DS_PAIR [STRING_8, STRING_8].make */
extern T0* T32c3(T0* a1, T0* a2);
/* KL_STRING_ROUTINES.new_empty_string */
extern T0* T47f2(T0* C, T0* a1, T6 a2);
/* UC_UTF8_STRING.old_wipe_out */
extern void T233f59(T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T233f73(T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T233f59p1(T0* C);
/* STRING_8.wipe_out */
extern void T17f37(T0* C);
/* KL_STRING_ROUTINES.cloned_string */
extern T0* T47f8(T0* C, T0* a1);
/* UC_UTF8_STRING.twin */
extern T0* T233f18(T0* C);
/* UC_UTF8_STRING.copy */
extern void T233f63(T0* C, T0* a1);
/* UC_UTF8_STRING.copy */
extern void T233f63p1(T0* C, T0* a1);
/* STRING_8.twin */
extern T0* T17f18(T0* C);
/* STRING_8.copy */
extern void T17f39(T0* C, T0* a1);
/* UC_UTF8_STRING.new_empty_string */
extern T0* T233f9(T0* C, T6 a1);
/* UC_UTF8_STRING.make */
extern void T233f58(T0* C, T6 a1);
/* UC_UTF8_STRING.make */
extern T0* T233c58(T6 a1);
/* UC_UTF8_STRING.old_set_count */
extern void T233f72(T0* C, T6 a1);
/* UC_UTF8_STRING.byte_capacity */
extern T6 T233f39(T0* C);
/* UC_UTF8_STRING.capacity */
extern T6 T233f39p1(T0* C);
/* UC_UTF8_STRING.make */
extern void T233f58p1(T0* C, T6 a1);
/* UC_UTF8_STRING.substring */
extern T0* T233f17(T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.make_from_substring */
extern T0* T233c60(T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.make_from_substring_general */
extern void T233f74(T0* C, T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.put_substring_at_byte_index */
extern void T233f70(T0* C, T0* a1, T6 a2, T6 a3, T6 a4, T6 a5);
/* UC_UTF8_STRING.put_code_at_byte_index */
extern void T233f81(T0* C, T6 a1, T6 a2, T6 a3);
/* UC_UTF8_ROUTINES.code_byte_count */
extern T6 T231f24(T0* C, T6 a1);
/* UC_UTF8_STRING.put_character_at_byte_index */
extern void T233f69(T0* C, T2 a1, T6 a2, T6 a3);
/* UC_UTF8_ROUTINES.character_byte_count */
extern T6 T231f23(T0* C, T2 a1);
/* UC_UTF8_STRING.put_byte */
extern void T233f79(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.old_put */
extern void T233f68(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.any_ */
extern T0* T233f41(T0* C);
/* UC_UTF8_ROUTINES.substring_byte_count */
extern T6 T231f22(T0* C, T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.shifted_byte_index */
extern T6 T233f45(T0* C, T6 a1, T6 a2);
/* UC_UTF8_ROUTINES.dummy_uc_string */
extern unsigned char ge198os10118;
extern T0* ge198ov10118;
extern T0* T231f27(T0* C);
/* UC_STRING.make_empty */
extern T0* T69c8(void);
/* UC_STRING.make */
extern void T69f9(T0* C, T6 a1);
/* UC_STRING.old_set_count */
extern void T69f12(T0* C, T6 a1);
/* UC_STRING.set_count */
extern void T69f11(T0* C, T6 a1);
/* UC_STRING.byte_capacity */
extern T6 T69f7(T0* C);
/* UC_STRING.capacity */
extern T6 T69f7p1(T0* C);
/* UC_STRING.make */
extern void T69f9p1(T0* C, T6 a1);
/* UC_STRING.reset_byte_index_cache */
extern void T69f10(T0* C);
/* UC_UTF8_ROUTINES.any_ */
extern T0* T231f25(T0* C);
/* UC_UTF8_STRING.cloned_string */
extern T0* T233f40(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].item */
extern T0* T31f6(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].start */
extern void T31f9(T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_start */
extern void T33f11(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].cursor_off */
extern T1 T33f7(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].new_cursor */
extern T0* T33f6(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].make */
extern T0* T31c8(T0* a1);
/* GEXACE.split_string */
extern T0* T21f13(T0* C, T0* a1, T2 a2);
/* DS_LINKED_LIST [STRING_8].put_last */
extern void T33f10(T0* C, T0* a1);
/* DS_LINKABLE [STRING_8].put_right */
extern void T62f4(T0* C, T0* a1);
/* DS_LINKABLE [STRING_8].make */
extern T0* T62c3(T0* a1);
/* DS_LINKED_LIST [STRING_8].is_empty */
extern T1 T33f5(T0* C);
/* DS_LINKED_LIST [STRING_8].make */
extern T0* T33c9(void);
/* GEXACE.make_command_line_parser */
extern void T21f21(T0* C);
/* GEXACE.reset */
extern void T21f23(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.make */
extern T0* T28c9(void);
/* ET_XACE_DEFAULT_ERROR_HANDLER.set_warning_null */
extern void T28f14(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.null_output_stream */
extern unsigned char ge137os2467;
extern T0* ge137ov2467;
extern T0* T28f8(T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.make */
extern T0* T60c3(T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.set_info_null */
extern void T28f13(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.make_standard */
extern void T28f12(T0* C);
/* DS_LINKED_LIST [GEXACE_COMMAND].make */
extern T0* T27c8(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_key_equality_tester */
extern void T24f39(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].internal_set_equality_tester */
extern void T48f6(T0* C, T0* a1);
/* GEXACE.string_equality_tester */
extern unsigned char ge187os1792;
extern T0* ge187ov1792;
extern T0* T21f12(T0* C);
/* UC_STRING_EQUALITY_TESTER.default_create */
extern T0* T25c3(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map */
extern void T24f38(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map */
extern T0* T24c38(T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_with_equality_testers */
extern void T24f41(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].make */
extern T0* T48c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].new_cursor */
extern T0* T48f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8].make */
extern T0* T71c3(T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_cursor */
extern T0* T24f26(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].make */
extern T0* T52c3(T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_sparse_container */
extern void T24f49(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_slots */
extern void T24f57(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].make */
extern T0* T53f2(T0* C, T6 a1);
/* TO_SPECIAL [INTEGER_32].make_area */
extern T0* T72c2(T6 a1);
/* SPECIAL [INTEGER_32].make */
extern T0* T51c4(T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_clashes */
extern void T24f56(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_key_storage */
extern void T24f55(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].make */
extern T0* T54f2(T0* C, T6 a1);
/* TO_SPECIAL [STRING_8].make_area */
extern T0* T73c2(T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].default_create */
extern T0* T54c3(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_item_storage */
extern void T24f54(T0* C, T6 a1);
/* KL_ARGUMENTS.set_program_name */
extern void T23f5(T0* C, T0* a1);
/* GEXACE.arguments */
extern unsigned char ge167os1785;
extern T0* ge167ov1785;
extern T0* T21f7(T0* C);
/* KL_ARGUMENTS.make */
extern T0* T23c4(void);
/* MANAGED_POINTER.dispose */
extern void T422f8(T0* C);
/* POINTER.memory_free */
extern void T14f6(T14* C);
/* POINTER.default_pointer */
extern T14 T14f5(T14* C);
/* POINTER.c_free */
extern void T14f7(T14* C, T14 a1);
/* KL_TEXT_OUTPUT_FILE.dispose */
extern void T81f21(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_close */
extern void T81f25(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_close */
extern void T81f27(T0* C, T14 a1);
/* KL_TEXT_OUTPUT_FILE.old_is_closed */
extern T1 T81f11(T0* C);
/* KL_TEXT_INPUT_FILE.dispose */
extern void T79f37(T0* C);
/* KL_TEXT_INPUT_FILE.old_close */
extern void T79f41(T0* C);
/* KL_TEXT_INPUT_FILE.file_close */
extern void T79f43(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.old_is_closed */
extern T1 T79f10(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_stream */
extern void T210f234(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T210f241(T0* C, T0* a1);
/* YY_FILE_BUFFER.name */
extern T0* T293f14(T0* C);
/* XM_EIFFEL_INPUT_STREAM.name */
extern T0* T235f26(T0* C);
/* KL_STRING_INPUT_STREAM.name */
extern unsigned char ge142os4754;
extern T0* ge142ov4754;
extern T0* T421f6(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T210f241p1(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_load_input_buffer */
extern void T210f215(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_content */
extern void T210f218(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.special_integer_ */
extern T0* T210f70(T0* C);
/* KL_CHARACTER_BUFFER.count */
extern T6 T384f4(T0* C);
/* YY_FILE_BUFFER.set_position */
extern void T293f19(T0* C, T6 a1, T6 a2, T6 a3);
/* YY_BUFFER.set_position */
extern void T292f14(T0* C, T6 a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.set_index */
extern void T293f18(T0* C, T6 a1);
/* YY_BUFFER.set_index */
extern void T292f13(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.new_file_buffer */
extern T0* T210f71(T0* C, T0* a1);
/* YY_FILE_BUFFER.make */
extern T0* T293c17(T0* a1);
/* YY_FILE_BUFFER.make_with_size */
extern void T293f21(T0* C, T0* a1, T6 a2);
/* YY_FILE_BUFFER.set_file */
extern void T293f23(T0* C, T0* a1);
/* YY_FILE_BUFFER.flush */
extern void T293f25(T0* C);
/* KL_CHARACTER_BUFFER.put */
extern void T384f10(T0* C, T2 a1, T6 a2);
/* STRING_8.put */
extern void T17f46(T0* C, T2 a1, T6 a2);
/* XM_EIFFEL_INPUT_STREAM.end_of_input */
extern T1 T235f18(T0* C);
/* KL_TEXT_INPUT_FILE.end_of_input */
extern T1 T79f25(T0* C);
/* YY_FILE_BUFFER.new_default_buffer */
extern T0* T293f16(T0* C, T6 a1);
/* KL_CHARACTER_BUFFER.make */
extern T0* T384c8(T6 a1);
/* KL_OPERATING_SYSTEM.is_dotnet */
extern unsigned char ge164os3051;
extern T1 ge164ov3051;
extern T1 T224f6(T0* C);
/* PLATFORM.default_create */
extern T0* T443c2(void);
/* KL_CHARACTER_BUFFER.operating_system */
extern unsigned char ge172os1800;
extern T0* ge172ov1800;
extern T0* T384f7(T0* C);
/* KL_OPERATING_SYSTEM.default_create */
extern T0* T224c7(void);
/* YY_FILE_BUFFER.default_capacity */
extern unsigned char ge312os12475;
extern T6 ge312ov12475;
extern T6 T293f13(T0* C);
/* XM_EIFFEL_INPUT_STREAM.make_from_stream */
extern T0* T235c28(T0* a1);
/* DS_LINKED_QUEUE [CHARACTER_8].make */
extern T0* T330c6(void);
/* XM_EIFFEL_SCANNER_DTD.set_input_stream */
extern void T208f199(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T208f208(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T208f208p1(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_load_input_buffer */
extern void T208f217(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_content */
extern void T208f218(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.special_integer_ */
extern T0* T208f184(T0* C);
/* XM_EIFFEL_SCANNER_DTD.new_file_buffer */
extern T0* T208f54(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_stream */
extern void T204f230(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T204f237(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T204f237p1(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_load_input_buffer */
extern void T204f212(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_content */
extern void T204f214(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.special_integer_ */
extern T0* T204f57(T0* C);
/* XM_EIFFEL_ENTITY_DEF.new_file_buffer */
extern T0* T204f69(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_stream */
extern void T167f197(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T167f205(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T167f205p1(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_load_input_buffer */
extern void T167f212(T0* C);
/* XM_EIFFEL_SCANNER.yy_set_content */
extern void T167f213(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.special_integer_ */
extern T0* T167f182(T0* C);
/* XM_EIFFEL_SCANNER.new_file_buffer */
extern T0* T167f45(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T210f235(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T210f235p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_external */
extern T1 T210f66(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T210f235p0(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_action */
extern void T210f245(T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.from_hexadecimal */
extern void T291f10(T0* C, T0* a1);
/* KL_STRING_ROUTINES.hexadecimal_to_integer */
extern T6 T47f13(T0* C, T0* a1);
/* XM_EIFFEL_CHARACTER_ENTITY.string_ */
extern T0* T291f7(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.to_utf8 */
extern T0* T291f3(T0* C);
/* UC_UTF8_ROUTINES.append_code_to_utf8 */
extern void T231f37(T0* C, T0* a1, T6 a2);
/* UC_UTF8_ROUTINES.integer_ */
extern T0* T231f29(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.utf8 */
extern T0* T291f6(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_ascii */
extern T1 T291f2(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_valid */
extern T1 T291f5(T0* C);
/* UC_UNICODE_ROUTINES.valid_non_surrogate_code */
extern T1 T325f2(T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.unicode */
extern unsigned char ge182os2961;
extern T0* ge182ov2961;
extern T0* T291f4(T0* C);
/* UC_UNICODE_ROUTINES.default_create */
extern T0* T325c29(void);
/* XM_EIFFEL_CHARACTER_ENTITY.from_decimal */
extern void T291f9(T0* C, T0* a1);
/* STRING_8.to_integer */
extern T6 T17f17(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
extern T6 T76f13(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
extern void T76f17(T0* C, T0* a1, T6 a2);
/* STRING_TO_INTEGER_CONVERTOR.parse_character */
extern void T76f23(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflowed */
extern T1 T76f15(T0* C);
/* INTEGER_OVERFLOW_CHECKER.will_overflow */
extern T1 T88f7(T0* C, T11 a1, T11 a2, T6 a3, T6 a4);
/* NATURAL_64.infix ">" */
extern T1 T11f4(T11* C, T11 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
extern unsigned char ge2273os4160;
extern T0* ge2273ov4160;
extern T0* T76f14(T0* C);
/* INTEGER_OVERFLOW_CHECKER.make */
extern T0* T88c13(void);
/* NATURAL_64.to_natural_64 */
extern T11 T11f7(T11* C);
/* NATURAL_32.to_natural_64 */
extern T11 T10f4(T10* C);
/* NATURAL_16.to_natural_64 */
extern T11 T9f3(T9* C);
/* NATURAL_8.to_natural_64 */
extern T11 T8f9(T8* C);
/* INTEGER_64.to_natural_64 */
extern T11 T7f3(T7* C);
/* INTEGER_16.to_natural_64 */
extern T11 T5f3(T5* C);
/* INTEGER_8.to_natural_64 */
extern T11 T4f3(T4* C);
/* SPECIAL [NATURAL_64].make */
extern T0* T154c2(T6 a1);
/* STRING_8.has */
extern T1 T17f26(T0* C, T2 a1);
/* INTEGER_32.to_natural_64 */
extern T11 T6f16(T6* C);
/* CHARACTER_8.is_digit */
extern T1 T2f2(T2* C);
/* NATURAL_8.infix ">" */
extern T1 T8f2(T8* C, T8 a1);
/* NATURAL_8.infix "&" */
extern T8 T8f1(T8* C, T8 a1);
/* CHARACTER_8.character_types */
extern T8 T2f4(T2* C, T6 a1);
/* CHARACTER_8.internal_character_types */
extern unsigned char ge8os92;
extern T0* ge8ov92;
extern T0* T2f6(T2* C);
/* NATURAL_8.infix "|" */
extern T8 T8f3(T8* C, T8 a1);
/* SPECIAL [NATURAL_8].make */
extern T0* T106c2(T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.reset */
extern void T76f18(T0* C, T6 a1);
/* STRING_8.ctoi_convertor */
extern unsigned char ge2265os1267;
extern T0* ge2265ov1267;
extern T0* T17f21(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
extern void T76f22(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
extern void T76f21(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
extern void T76f20(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
extern void T76f19(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.make */
extern T0* T76c16(void);
/* XM_EIFFEL_PE_ENTITY_DEF.has_normalized_newline */
extern T1 T210f201(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_literal */
extern T1 T210f63(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_substring */
extern T0* T210f181(T0* C, T6 a1, T6 a2);
/* KL_CHARACTER_BUFFER.substring */
extern T0* T384f3(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_PE_ENTITY_DEF.text_count */
extern T6 T210f180(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.system_literal_text */
extern T0* T210f162(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_item */
extern T2 T210f207(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern T0* T210f121(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern unsigned char ge1455os9381;
extern T0* ge1455ov9381;
extern T0* T210f121p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_line_column */
extern void T210f249(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text */
extern T0* T210f105(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.pop_start_condition */
extern void T210f248(T0* C);
/* DS_LINKED_STACK [INTEGER_32].remove */
extern void T296f7(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_start_condition */
extern void T210f233(T0* C, T6 a1);
/* DS_LINKED_STACK [INTEGER_32].item */
extern T6 T296f4(T0* C);
/* DS_LINKED_STACK [INTEGER_32].is_empty */
extern T1 T296f3(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition */
extern void T210f246(T0* C, T6 a1);
/* DS_LINKED_STACK [INTEGER_32].force */
extern void T296f6(T0* C, T6 a1);
/* DS_LINKABLE [INTEGER_32].put_right */
extern void T365f4(T0* C, T0* a1);
/* DS_LINKABLE [INTEGER_32].make */
extern T0* T365c3(T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_last_token */
extern void T210f247(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_eof_action */
extern void T210f244(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.wrap */
extern T1 T210f99(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_refill_input_buffer */
extern void T210f243(T0* C);
/* YY_FILE_BUFFER.fill */
extern void T293f20(T0* C);
/* KL_CHARACTER_BUFFER.fill_from_stream */
extern T6 T384f5(T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T6 T235f27(T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T6 T235f27p1(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STRING_INPUT_STREAM.read_to_string */
extern T6 T421f5(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STRING_INPUT_STREAM.read_character */
extern void T421f9(T0* C);
/* KL_TEXT_INPUT_FILE.read_to_string */
extern T6 T79f30(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
extern unsigned char ge125os4776;
extern T0* ge125ov4776;
extern T0* T79f34(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_to_string */
extern T6 T79f33(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.file_gss */
extern T6 T79f35(T0* C, T14 a1, T14 a2, T6 a3);
/* SPECIAL [CHARACTER_8].item_address */
extern T14 T15f6(T0* C, T6 a1);
/* KL_TEXT_INPUT_FILE.any_ */
extern T0* T79f31(T0* C);
/* KL_TEXT_INPUT_FILE.old_end_of_file */
extern T1 T79f27(T0* C);
/* KL_TEXT_INPUT_FILE.file_feof */
extern T1 T79f29(T0* C, T14 a1);
/* XM_EIFFEL_INPUT_STREAM.last_character */
extern T2 T235f19(T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].item */
extern T2 T330f5(T0* C);
/* XM_EIFFEL_INPUT_STREAM.read_character */
extern void T235f31(T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].remove */
extern void T330f7(T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].wipe_out */
extern void T330f9(T0* C);
/* XM_EIFFEL_INPUT_STREAM.noqueue_read_character */
extern void T235f33(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf16_read_character */
extern void T235f35(T0* C);
/* XM_EIFFEL_INPUT_STREAM.append_character */
extern void T235f36(T0* C, T6 a1);
/* DS_LINKED_QUEUE [CHARACTER_8].force */
extern void T330f8(T0* C, T2 a1);
/* DS_LINKABLE [CHARACTER_8].put_right */
extern void T387f4(T0* C, T0* a1);
/* DS_LINKED_QUEUE [CHARACTER_8].is_empty */
extern T1 T330f4(T0* C);
/* DS_LINKABLE [CHARACTER_8].make */
extern T0* T387c3(T2 a1);
/* XM_EIFFEL_INPUT_STREAM.utf8 */
extern T0* T235f22(T0* C);
/* KL_STRING_ROUTINES.wipe_out */
extern void T47f16(T0* C, T0* a1);
/* STRING_8.clear_all */
extern void T17f51(T0* C);
/* XM_EIFFEL_INPUT_STREAM.string_ */
extern T0* T235f17(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf8_buffer */
extern unsigned char ge1446os10154;
extern T0* ge1446ov10154;
extern T0* T235f25(T0* C);
/* UC_UTF16_ROUTINES.surrogate */
extern T6 T331f7(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_low_surrogate */
extern T1 T331f6(T0* C, T6 a1);
/* UC_UTF16_ROUTINES.least_10_bits */
extern T6 T331f5(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_high_surrogate */
extern T1 T331f4(T0* C, T6 a1);
/* UC_UTF16_ROUTINES.is_surrogate */
extern T1 T331f3(T0* C, T6 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16 */
extern unsigned char ge183os2962;
extern T0* ge183ov2962;
extern T0* T235f20(T0* C);
/* UC_UTF16_ROUTINES.default_create */
extern T0* T331c16(void);
/* XM_EIFFEL_INPUT_STREAM.least_significant */
extern T6 T235f24(T0* C, T2 a1, T2 a2);
/* XM_EIFFEL_INPUT_STREAM.most_significant */
extern T6 T235f23(T0* C, T2 a1, T2 a2);
/* XM_EIFFEL_INPUT_STREAM.latin1_read_character */
extern void T235f34(T0* C);
/* KL_TEXT_INPUT_FILE.read_character */
extern void T79f45(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_character */
extern void T79f46(T0* C);
/* KL_TEXT_INPUT_FILE.file_gc */
extern T2 T79f28(T0* C, T14 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16_detect_read_character */
extern void T235f32(T0* C);
/* UC_UTF8_ROUTINES.is_endian_detection_character */
extern T1 T231f31(T0* C, T2 a1, T2 a2, T2 a3);
/* UC_UTF8_ROUTINES.is_endian_detection_character_start */
extern T1 T231f30(T0* C, T2 a1, T2 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_least_first */
extern T1 T331f2(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_most_first */
extern T1 T331f1(T0* C, T6 a1, T6 a2);
/* YY_FILE_BUFFER.compact_left */
extern void T293f22(T0* C);
/* KL_CHARACTER_BUFFER.move_left */
extern void T384f11(T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.subcopy */
extern void T17f52(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* YY_FILE_BUFFER.resize */
extern void T293f24(T0* C);
/* KL_CHARACTER_BUFFER.resize */
extern void T384f12(T0* C, T6 a1);
/* YY_BUFFER.fill */
extern void T292f15(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_null_trans_state */
extern T6 T210f98(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_previous_state */
extern T6 T210f97(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.fatal_error */
extern void T210f240(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.item */
extern T2 T384f6(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.terminate */
extern void T210f242(T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T208f200(T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T208f200p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_action */
extern void T208f214(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.has_normalized_newline */
extern T1 T208f179(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_substring */
extern T0* T208f159(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_SCANNER_DTD.text_count */
extern T6 T208f158(T0* C);
/* XM_EIFFEL_SCANNER_DTD.system_literal_text */
extern T0* T208f140(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_item */
extern T2 T208f194(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.normalized_newline */
extern T0* T208f102(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_line_column */
extern void T208f220(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text */
extern T0* T208f76(T0* C);
/* XM_EIFFEL_SCANNER_DTD.pop_start_condition */
extern void T208f219(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_start_condition */
extern void T208f205(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition */
extern void T208f215(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_eof_action */
extern void T208f213(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.wrap */
extern T1 T208f67(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_refill_input_buffer */
extern void T208f212(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_null_trans_state */
extern T6 T208f66(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_previous_state */
extern T6 T208f65(T0* C);
/* XM_EIFFEL_SCANNER_DTD.fatal_error */
extern void T208f211(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.terminate */
extern void T208f210(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_last_token */
extern void T208f209(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T204f231(T0* C);
/* XM_EIFFEL_ENTITY_DEF.is_external */
extern T1 T204f51(T0* C);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T204f231p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_action */
extern void T204f240(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.has_normalized_newline */
extern T1 T204f198(T0* C);
/* XM_EIFFEL_ENTITY_DEF.is_literal */
extern T1 T204f62(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_substring */
extern T0* T204f178(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_ENTITY_DEF.text_count */
extern T6 T204f177(T0* C);
/* XM_EIFFEL_ENTITY_DEF.system_literal_text */
extern T0* T204f159(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_item */
extern T2 T204f205(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T204f118(T0* C);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T204f118p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_line_column */
extern void T204f245(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text */
extern T0* T204f102(T0* C);
/* XM_EIFFEL_ENTITY_DEF.pop_start_condition */
extern void T204f244(T0* C);
/* XM_EIFFEL_ENTITY_DEF.set_start_condition */
extern void T204f229(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition */
extern void T204f241(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.set_last_token */
extern void T204f243(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_eof_action */
extern void T204f239(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.terminate */
extern void T204f242(T0* C);
/* XM_EIFFEL_ENTITY_DEF.wrap */
extern T1 T204f96(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_refill_input_buffer */
extern void T204f238(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_null_trans_state */
extern T6 T204f95(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_previous_state */
extern T6 T204f94(T0* C);
/* XM_EIFFEL_ENTITY_DEF.fatal_error */
extern void T204f236(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.read_token */
extern void T167f198(T0* C);
/* XM_EIFFEL_SCANNER.yy_execute_action */
extern void T167f209(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.has_normalized_newline */
extern T1 T167f177(T0* C);
/* XM_EIFFEL_SCANNER.text_substring */
extern T0* T167f157(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_SCANNER.text_count */
extern T6 T167f156(T0* C);
/* XM_EIFFEL_SCANNER.system_literal_text */
extern T0* T167f138(T0* C);
/* XM_EIFFEL_SCANNER.text_item */
extern T2 T167f192(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.normalized_newline */
extern T0* T167f97(T0* C);
/* XM_EIFFEL_SCANNER.yy_set_line_column */
extern void T167f217(T0* C);
/* XM_EIFFEL_SCANNER.text */
extern T0* T167f71(T0* C);
/* XM_EIFFEL_SCANNER.pop_start_condition */
extern void T167f216(T0* C);
/* XM_EIFFEL_SCANNER.set_start_condition */
extern void T167f218(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.push_start_condition */
extern void T167f210(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.set_last_token */
extern void T167f215(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.yy_execute_eof_action */
extern void T167f208(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.terminate */
extern void T167f214(T0* C);
/* XM_EIFFEL_SCANNER.wrap */
extern T1 T167f62(T0* C);
/* XM_EIFFEL_SCANNER.yy_refill_input_buffer */
extern void T167f207(T0* C);
/* XM_EIFFEL_SCANNER.yy_null_trans_state */
extern T6 T167f61(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.yy_previous_state */
extern T6 T167f60(T0* C);
/* XM_EIFFEL_SCANNER.fatal_error */
extern void T167f206(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T210f237(T0* C);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition_dtd_ignore */
extern void T208f202(T0* C);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T204f233(T0* C);
/* XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T167f200(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_encoding */
extern void T210f238(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.set_encoding */
extern void T235f30(T0* C, T0* a1);
/* KL_STRING_ROUTINES.same_case_insensitive */
extern T1 T47f11(T0* C, T0* a1, T0* a2);
/* CHARACTER_8.lower */
extern T2 T2f16(T2* C);
/* CHARACTER_8.is_upper */
extern T1 T2f19(T2* C);
/* UC_UNICODE_ROUTINES.lower_code */
extern T6 T325f1(T0* C, T6 a1);
/* ARRAY [INTEGER_32].item */
extern T6 T230f4(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.lower_codes */
extern unsigned char ge209os12545;
extern T0* ge209ov12545;
extern T0* T325f3(T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_plane */
extern unsigned char ge209os12544;
extern T0* ge209ov12544;
extern T0* T325f10(T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_segment */
extern unsigned char ge209os12531;
extern T0* ge209ov12531;
extern T0* T325f17(T0* C);
/* KL_INTEGER_ROUTINES.to_integer */
extern T6 T236f3(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.integer_ */
extern T0* T325f28(T0* C);
/* SPECIAL [ARRAY [INTEGER_32]].make */
extern T0* T385c2(T6 a1);
/* UC_UNICODE_ROUTINES.lower_code_plane_1 */
extern unsigned char ge209os12543;
extern T0* ge209ov12543;
extern T0* T325f9(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_1_segment_4 */
extern unsigned char ge209os12542;
extern T0* ge209ov12542;
extern T0* T325f27(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0 */
extern unsigned char ge209os12541;
extern T0* ge209ov12541;
extern T0* T325f8(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_255 */
extern unsigned char ge209os12540;
extern T0* ge209ov12540;
extern T0* T325f26(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_167 */
extern unsigned char ge209os12539;
extern T0* ge209ov12539;
extern T0* T325f25(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_166 */
extern unsigned char ge209os12538;
extern T0* ge209ov12538;
extern T0* T325f24(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_44 */
extern unsigned char ge209os12537;
extern T0* ge209ov12537;
extern T0* T325f23(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_36 */
extern unsigned char ge209os12536;
extern T0* ge209ov12536;
extern T0* T325f22(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_33 */
extern unsigned char ge209os12535;
extern T0* ge209ov12535;
extern T0* T325f21(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_31 */
extern unsigned char ge209os12534;
extern T0* ge209ov12534;
extern T0* T325f20(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_30 */
extern unsigned char ge209os12533;
extern T0* ge209ov12533;
extern T0* T325f19(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_16 */
extern unsigned char ge209os12532;
extern T0* ge209ov12532;
extern T0* T325f18(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_5 */
extern unsigned char ge209os12530;
extern T0* ge209ov12530;
extern T0* T325f16(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_4 */
extern unsigned char ge209os12529;
extern T0* ge209ov12529;
extern T0* T325f15(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_3 */
extern unsigned char ge209os12528;
extern T0* ge209ov12528;
extern T0* T325f14(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_2 */
extern unsigned char ge209os12527;
extern T0* ge209ov12527;
extern T0* T325f13(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_1 */
extern unsigned char ge209os12526;
extern T0* ge209ov12526;
extern T0* T325f12(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_0 */
extern unsigned char ge209os12525;
extern T0* ge209ov12525;
extern T0* T325f11(T0* C);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].make */
extern T0* T386c2(T6 a1);
/* KL_STRING_ROUTINES.unicode */
extern T0* T47f12(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_encoding */
extern void T208f203(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_encoding */
extern void T204f234(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_encoding */
extern void T167f201(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_from_resolver */
extern void T210f239(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.last_stream */
extern T0* T174f3(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_input_from_resolver */
extern void T208f204(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_from_resolver */
extern void T204f235(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T167f202(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.close_input */
extern void T210f236(T0* C);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_finish */
extern void T174f7(T0* C);
/* KL_STRING_INPUT_STREAM.close */
extern void T421f10(T0* C);
/* KL_TEXT_INPUT_FILE.close */
extern void T79f39(T0* C);
/* KL_STRING_INPUT_STREAM.is_closable */
extern T1 T421f7(T0* C);
/* KL_TEXT_INPUT_FILE.is_closable */
extern T1 T79f24(T0* C);
/* KL_TEXT_INPUT_FILE.is_open_read */
extern T1 T79f11(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_read */
extern T1 T79f19(T0* C);
/* XM_EIFFEL_SCANNER_DTD.close_input */
extern void T208f201(T0* C);
/* XM_EIFFEL_ENTITY_DEF.close_input */
extern void T204f232(T0* C);
/* XM_EIFFEL_SCANNER.close_input */
extern void T167f199(T0* C);
/* XM_CHARACTER_DATA.process */
extern void T374f5(T0* C, T0* a1);
/* XM_NODE_TYPER.process_character_data */
extern void T414f17(T0* C, T0* a1);
/* XM_NODE_TYPER.reset */
extern void T414f13(T0* C);
/* XM_PROCESSING_INSTRUCTION.process */
extern void T373f7(T0* C, T0* a1);
/* XM_NODE_TYPER.process_processing_instruction */
extern void T414f16(T0* C, T0* a1);
/* XM_COMMENT.process */
extern void T372f6(T0* C, T0* a1);
/* XM_NODE_TYPER.process_comment */
extern void T414f15(T0* C, T0* a1);
/* XM_ATTRIBUTE.process */
extern void T146f8(T0* C, T0* a1);
/* XM_NODE_TYPER.process_attribute */
extern void T414f14(T0* C, T0* a1);
/* XM_ELEMENT.process */
extern void T91f39(T0* C, T0* a1);
/* XM_NODE_TYPER.process_element */
extern void T414f11(T0* C, T0* a1);
/* XM_CHARACTER_DATA.node_set_parent */
extern void T374f4(T0* C, T0* a1);
/* XM_PROCESSING_INSTRUCTION.node_set_parent */
extern void T373f6(T0* C, T0* a1);
/* XM_COMMENT.node_set_parent */
extern void T372f5(T0* C, T0* a1);
/* XM_ATTRIBUTE.node_set_parent */
extern void T146f6(T0* C, T0* a1);
/* XM_ELEMENT.node_set_parent */
extern void T91f31(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_start */
extern void T158f2(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start */
extern void T155f26(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_make */
extern void T155f36(T0* C);
/* XM_NAMESPACE_RESOLVER.new_string_queue */
extern T0* T155f12(T0* C);
/* DS_LINKED_QUEUE [STRING_8].make */
extern T0* T288c6(void);
/* XM_NAMESPACE_RESOLVER_CONTEXT.make */
extern T0* T286c10(void);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T362c9(void);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].new_cursor */
extern T0* T362f7(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T363c7(T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start */
extern void T96f12(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_equal */
extern T0* T371c32(T6 a1);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].default_create */
extern T0* T424c3(void);
/* DS_HASH_SET [XM_NAMESPACE].make */
extern void T371f35(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_cursor */
extern T0* T371f23(T0* C);
/* DS_HASH_SET_CURSOR [XM_NAMESPACE].make */
extern T0* T425c3(T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].unset_found_item */
extern void T371f36(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_slots */
extern void T371f44(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].special_integer_ */
extern T0* T371f29(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].new_modulus */
extern T6 T371f20(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_clashes */
extern void T371f43(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_key_storage */
extern void T371f42(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_item_storage */
extern void T371f41(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].make */
extern T0* T426f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_NAMESPACE].make_area */
extern T0* T442c2(T6 a1);
/* SPECIAL [XM_NAMESPACE].make */
extern T0* T423c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].default_create */
extern T0* T426c3(void);
/* XM_DOCUMENT.make */
extern T0* T90c15(void);
/* XM_DOCUMENT.make_with_root_named */
extern void T90f16(T0* C, T0* a1, T0* a2);
/* XM_DOCUMENT.force_last */
extern void T90f18(T0* C, T0* a1);
/* XM_DOCUMENT.force_last */
extern void T90f18p1(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].put_right */
extern void T412f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].make */
extern T0* T412c3(T0* a1);
/* XM_DOCUMENT.is_empty */
extern T1 T90f13(T0* C);
/* XM_DOCUMENT.before_addition */
extern void T90f19(T0* C, T0* a1);
/* XM_ELEMENT.equality_delete */
extern void T91f38(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].forth */
extern void T147f11(T0* C);
/* XM_DOCUMENT.cursor_forth */
extern void T90f24(T0* C, T0* a1);
/* XM_DOCUMENT.add_traversing_cursor */
extern void T90f28(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_next_cursor */
extern void T147f16(T0* C, T0* a1);
/* XM_DOCUMENT.remove_traversing_cursor */
extern void T90f29(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set */
extern void T147f17(T0* C, T0* a1, T1 a2, T1 a3);
/* XM_ELEMENT.cursor_forth */
extern void T91f45(T0* C, T0* a1);
/* XM_ELEMENT.add_traversing_cursor */
extern void T91f47(T0* C, T0* a1);
/* XM_ELEMENT.remove_traversing_cursor */
extern void T91f48(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].remove */
extern void T147f14(T0* C);
/* XM_DOCUMENT.remove_at_cursor */
extern void T90f26(T0* C, T0* a1);
/* XM_DOCUMENT.move_all_cursors */
extern void T90f33(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_current_cell */
extern void T147f13(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].put */
extern void T412f6(T0* C, T0* a1);
/* XM_DOCUMENT.set_last_cell */
extern void T90f32(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].forget_right */
extern void T412f5(T0* C);
/* XM_DOCUMENT.remove_last */
extern void T90f31(T0* C);
/* XM_DOCUMENT.move_last_cursors_after */
extern void T90f36(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_after */
extern void T147f15(T0* C);
/* XM_DOCUMENT.wipe_out */
extern void T90f34(T0* C);
/* XM_DOCUMENT.move_all_cursors_after */
extern void T90f37(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].is_last */
extern T1 T147f7(T0* C);
/* XM_DOCUMENT.cursor_is_last */
extern T1 T90f11(T0* C, T0* a1);
/* XM_ELEMENT.cursor_is_last */
extern T1 T91f23(T0* C, T0* a1);
/* XM_DOCUMENT.remove_first */
extern void T90f30(T0* C);
/* XM_DOCUMENT.set_first_cell */
extern void T90f35(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].is_first */
extern T1 T147f6(T0* C);
/* XM_DOCUMENT.cursor_is_first */
extern T1 T90f12(T0* C, T0* a1);
/* XM_ELEMENT.cursor_is_first */
extern T1 T91f24(T0* C, T0* a1);
/* XM_ELEMENT.remove_at_cursor */
extern void T91f30(T0* C, T0* a1);
/* XM_ELEMENT.move_all_cursors */
extern void T91f37(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.set_last_cell */
extern void T91f36(T0* C, T0* a1);
/* XM_ELEMENT.remove_last */
extern void T91f35(T0* C);
/* XM_ELEMENT.move_last_cursors_after */
extern void T91f42(T0* C);
/* XM_ELEMENT.wipe_out */
extern void T91f40(T0* C);
/* XM_ELEMENT.move_all_cursors_after */
extern void T91f43(T0* C);
/* XM_ELEMENT.remove_first */
extern void T91f34(T0* C);
/* XM_ELEMENT.set_first_cell */
extern void T91f41(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].item */
extern T0* T147f8(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].start */
extern void T147f10(T0* C);
/* XM_DOCUMENT.cursor_start */
extern void T90f23(T0* C, T0* a1);
/* XM_DOCUMENT.cursor_off */
extern T1 T90f14(T0* C, T0* a1);
/* XM_ELEMENT.cursor_start */
extern void T91f44(T0* C, T0* a1);
/* XM_ELEMENT.cursor_off */
extern T1 T91f25(T0* C, T0* a1);
/* XM_ELEMENT.new_cursor */
extern T0* T91f21(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].make */
extern T0* T147c9(T0* a1);
/* XM_DOCUMENT.equality_delete */
extern void T90f21(T0* C, T0* a1);
/* XM_DOCUMENT.new_cursor */
extern T0* T90f9(T0* C);
/* XM_DOCUMENT.list_make */
extern void T90f17(T0* C);
/* XM_ELEMENT.make */
extern T0* T91c29(T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.list_make */
extern void T91f32(T0* C);
/* XM_DOCUMENT.default_ns */
extern unsigned char ge1406os5439;
extern T0* ge1406ov5439;
extern T0* T90f7(T0* C);
/* XM_NAMESPACE.make_default */
extern T0* T375c9(void);
/* XM_NAMESPACE.make */
extern void T375f8(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE.make */
extern T0* T375c8(T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T95f6(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T95f6p1(T0* C);
/* XM_CALLBACKS_NULL.make */
extern T0* T158c1(void);
/* XM_CALLBACKS_NULL.on_comment */
extern void T158f4(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_comment */
extern void T155f28(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_comment */
extern void T96f14(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.handle_position */
extern void T96f22(T0* C, T0* a1);
/* XM_POSITION_TABLE.put */
extern void T92f4(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].put_last */
extern void T228f14(T0* C, T0* a1);
/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].put_right */
extern void T377f4(T0* C, T0* a1);
/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T377c3(T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].is_empty */
extern T1 T228f5(T0* C);
/* DS_PAIR [XM_POSITION, XM_NODE].make */
extern T0* T229c3(T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.position */
extern T0* T101f137(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].first */
extern T0* T170f6(T0* C);
/* XM_EIFFEL_PARSER.positions */
extern T0* T101f91(T0* C);
/* XM_EIFFEL_PARSER.new_positions */
extern T0* T101f135(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].remove */
extern void T171f7(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].item */
extern T0* T171f4(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].is_empty */
extern T1 T171f3(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].force_last */
extern void T170f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].put_right */
extern void T297f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].attach_left */
extern void T297f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].make */
extern T0* T297c4(T0* a1);
/* DS_BILINKED_LIST [XM_POSITION].is_empty */
extern T1 T170f5(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].make */
extern T0* T170c8(void);
/* DS_BILINKED_LIST [XM_POSITION].new_cursor */
extern T0* T170f7(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_POSITION].make */
extern T0* T298c3(T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].copy */
extern void T171f6(T0* C, T0* a1);
/* DS_LINKABLE [XM_EIFFEL_SCANNER].put_right */
extern void T299f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_EIFFEL_SCANNER].make */
extern T0* T299c3(T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].make */
extern T0* T171c5(void);
/* XM_EIFFEL_PARSER.is_correct */
extern T1 T101f121(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.is_position_table_enabled */
extern T1 T96f8(T0* C);
/* XM_COMMENT.make_last */
extern T0* T372c4(T0* a1, T0* a2);
/* XM_ELEMENT.force_last */
extern void T91f28(T0* C, T0* a1);
/* XM_ELEMENT.force_last */
extern void T91f28p1(T0* C, T0* a1);
/* XM_ELEMENT.force_last */
extern void T91f28p0(T0* C, T0* a1);
/* XM_ELEMENT.before_addition */
extern void T91f33(T0* C, T0* a1);
/* XM_ELEMENT.last */
extern T0* T91f17(T0* C);
/* XM_ELEMENT.is_empty */
extern T1 T91f16(T0* C);
/* XM_COMMENT.make_last_in_document */
extern T0* T372c3(T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T95f8(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T95f8p1(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_processing_instruction */
extern void T158f5(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_processing_instruction */
extern void T155f29(T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_TO_TREE_FILTER.on_processing_instruction */
extern void T96f15(T0* C, T0* a1, T0* a2);
/* XM_PROCESSING_INSTRUCTION.make_last */
extern T0* T373c5(T0* a1, T0* a2, T0* a3);
/* XM_PROCESSING_INSTRUCTION.make_last_in_document */
extern T0* T373c4(T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T95f9(T0* C, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T95f9p1(T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_NULL.on_content */
extern void T158f6(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_content */
extern void T155f30(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_content */
extern void T96f16(T0* C, T0* a1);
/* XM_CHARACTER_DATA.make_last */
extern T0* T374c3(T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T95f10(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T95f10p1(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_start_tag */
extern void T158f9(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER.on_start_tag */
extern void T155f33(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.push */
extern void T286f12(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].force_last */
extern void T362f11(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].put_right */
extern void T409f5(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].attach_left */
extern void T409f6(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T409c4(T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].is_empty */
extern T1 T362f6(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.new_string_string_table */
extern T0* T286f8(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_equality_tester */
extern void T24f59(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.string_equality_tester */
extern T0* T286f9(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map_default */
extern T0* T24c58(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].default_capacity */
extern T6 T24f36(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag */
extern void T96f17(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_last */
extern T0* T91c27(T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_root */
extern T0* T91c26(T0* a1, T0* a2, T0* a3);
/* XM_DOCUMENT.set_root_element */
extern void T90f20(T0* C, T0* a1);
/* XM_DOCUMENT.remove_previous_root_element */
extern void T90f27(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].go_after */
extern void T147f12(T0* C);
/* XM_DOCUMENT.cursor_go_after */
extern void T90f25(T0* C, T0* a1);
/* XM_ELEMENT.cursor_go_after */
extern void T91f46(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.new_namespace */
extern T0* T96f7(T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_NAMESPACE].force_last */
extern void T371f33(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_put */
extern void T371f40(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].clashes_put */
extern void T371f39(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].slots_item */
extern T6 T371f26(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].hash_position */
extern T6 T371f22(T0* C, T0* a1);
/* XM_NAMESPACE.hash_code */
extern T6 T375f5(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].resize */
extern void T371f38(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_resize */
extern void T371f48(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].key_storage_resize */
extern void T371f47(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_resize */
extern void T371f46(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].resize */
extern T0* T426f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_NAMESPACE].aliased_resized_area */
extern T0* T423f3(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].key_storage_item */
extern T0* T371f18(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_item */
extern T0* T371f30(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_item */
extern T6 T371f19(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_resize */
extern void T371f45(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_capacity */
extern T6 T371f21(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_put */
extern void T371f37(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].search_position */
extern void T371f34(T0* C, T0* a1);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].test */
extern T1 T424f1(T0* C, T0* a1, T0* a2);
/* KL_ANY_ROUTINES.equal_objects */
extern T1 T70f2(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE.is_equal */
extern T1 T375f4(T0* C, T0* a1);
/* XM_NAMESPACE.string_ */
extern T0* T375f3(T0* C);
/* XM_EIFFEL_PARSER_NAME.is_equal */
extern T1 T177f10(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].forth */
extern void T312f9(T0* C);
/* DS_BILINKED_LIST [STRING_8].cursor_forth */
extern void T184f15(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].add_traversing_cursor */
extern void T184f16(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T312f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].remove_traversing_cursor */
extern void T184f17(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].set */
extern void T312f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [STRING_8].item */
extern T0* T312f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].start */
extern void T312f8(T0* C);
/* DS_BILINKED_LIST [STRING_8].cursor_start */
extern void T184f14(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].cursor_off */
extern T1 T184f10(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].new_cursor */
extern T0* T184f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].make */
extern T0* T312c7(T0* a1);
/* XM_EIFFEL_PARSER_NAME.same_string */
extern T1 T177f15(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER_NAME.string_equality_tester */
extern T0* T177f8(T0* C);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].any_ */
extern T0* T424f2(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].key_equality_tester */
extern T0* T371f17(T0* C);
/* XM_NAMESPACE.same_prefix */
extern T1 T375f7(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].item */
extern T0* T371f24(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].has */
extern T1 T371f27(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T95f11(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T95f11p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_NULL.on_end_tag */
extern void T158f8(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T155f32(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.pop */
extern void T286f11(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_last */
extern void T362f10(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].set_last_cell */
extern void T362f14(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].forget_right */
extern void T409f7(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_last_cursors_after */
extern void T362f13(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_next_cursor */
extern void T363f12(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_after */
extern void T363f11(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].wipe_out */
extern void T362f12(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_all_cursors_after */
extern void T362f15(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve_default */
extern T0* T286f3(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_pseudo_prefix */
extern unsigned char ge1380os12388;
extern T0* ge1380ov12388;
extern T0* T286f7(T0* C);
/* STRING_8.make_empty */
extern T0* T17c44(void);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T155f32p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve */
extern T0* T286f2(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].back */
extern void T363f10(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_back */
extern void T362f18(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].add_traversing_cursor */
extern void T362f19(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_traversing_cursor */
extern void T362f20(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set */
extern void T363f13(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].go_before */
extern void T363f9(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_go_before */
extern void T362f17(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_before */
extern void T363f14(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_off */
extern T1 T362f8(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item */
extern T0* T24f34(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_item */
extern T0* T24f35(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].has */
extern T1 T24f33(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].item */
extern T0* T363f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].finish */
extern void T363f8(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_finish */
extern void T362f16(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_namespace */
extern unsigned char ge1380os12389;
extern T0* ge1380ov12389;
extern T0* T286f6(T0* C);
/* XM_NAMESPACE_RESOLVER.has_prefix */
extern T1 T155f9(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_end_tag */
extern void T96f19(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.parent_element */
extern T0* T91f8(T0* C);
/* XM_DOCUMENT.process */
extern void T90f22(T0* C, T0* a1);
/* XM_NODE_TYPER.process_document */
extern void T414f12(T0* C, T0* a1);
/* XM_NODE_TYPER.default_create */
extern T0* T414c10(void);
/* XM_ELEMENT.is_root_node */
extern T1 T91f22(T0* C);
/* XM_DOCUMENT.is_root_node */
extern T1 T90f10(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T95f13(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T95f13p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_NULL.on_attribute */
extern void T158f10(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER.on_attribute */
extern void T155f34(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add */
extern void T286f14(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force_new */
extern void T24f60(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].last */
extern T0* T362f5(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.shallow_has */
extern T1 T286f4(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.attributes_force */
extern void T155f38(T0* C, T0* a1, T0* a2, T0* a3);
/* DS_LINKED_QUEUE [STRING_8].force */
extern void T288f7(T0* C, T0* a1);
/* DS_LINKED_QUEUE [STRING_8].is_empty */
extern T1 T288f4(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add_default */
extern void T286f13(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.is_xmlns */
extern T1 T155f14(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.same_string */
extern T1 T155f21(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.string_equality_tester */
extern T0* T155f24(T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns */
extern unsigned char ge1347os2740;
extern T0* ge1347ov2740;
extern T0* T155f20(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_attribute */
extern void T96f21(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_ATTRIBUTE.make_last */
extern T0* T146c5(T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T95f15(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T95f15p1(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_CALLBACKS_NULL.on_finish */
extern void T158f3(T0* C);
/* XM_NAMESPACE_RESOLVER.on_finish */
extern void T155f27(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_finish */
extern void T96f13(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T95f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T95f7p1(T0* C);
/* XM_CALLBACKS_NULL.on_start_tag_finish */
extern void T158f7(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T155f31(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T155f31p1(T0* C);
/* KL_STRING_ROUTINES.appended_string */
extern T0* T47f4(T0* C, T0* a1, T0* a2);
/* STRING_8.append_string */
extern void T17f38(T0* C, T0* a1);
/* STRING_8.append */
extern void T17f40(T0* C, T0* a1);
/* KL_STRING_ROUTINES.concat */
extern T0* T47f9(T0* C, T0* a1, T0* a2);
/* STRING_8.infix "+" */
extern T0* T17f19(T0* C, T0* a1);
/* UC_UTF8_STRING.prefixed_string */
extern T0* T233f8(T0* C, T0* a1);
/* UC_UTF8_STRING.infix "+" */
extern T0* T233f7(T0* C, T0* a1);
/* UC_UTF8_STRING.append_string */
extern void T233f54(T0* C, T0* a1);
/* UC_UTF8_STRING.append */
extern void T233f66(T0* C, T0* a1);
/* UC_UTF8_STRING.dummy_uc_string */
extern unsigned char ge188os3971;
extern T0* ge188ov3971;
extern T0* T233f43(T0* C);
/* UC_UTF8_STRING.append_substring */
extern void T233f56(T0* C, T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.resize_byte_storage */
extern void T233f67(T0* C, T6 a1);
/* UC_UTF8_STRING.resize */
extern void T233f80(T0* C, T6 a1);
/* UC_UTF8_STRING.append */
extern void T233f66p1(T0* C, T0* a1);
/* UC_UTF8_STRING.additional_space */
extern T6 T233f44(T0* C);
/* ISE_RUNTIME.check_assert */
extern T1 T329s1(T1 a1);
/* XM_NAMESPACE_RESOLVER.string_ */
extern T0* T155f11(T0* C);
/* XM_NAMESPACE_RESOLVER.on_delayed_attributes */
extern void T155f37(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_remove */
extern void T155f39(T0* C);
/* DS_LINKED_QUEUE [STRING_8].remove */
extern void T288f8(T0* C);
/* DS_LINKED_QUEUE [STRING_8].wipe_out */
extern void T288f9(T0* C);
/* XM_NAMESPACE_RESOLVER.unprefixed_attribute_namespace */
extern T0* T155f19(T0* C);
/* XM_NAMESPACE_RESOLVER.default_namespace */
extern unsigned char ge1347os2739;
extern T0* ge1347ov2739;
extern T0* T155f23(T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns_namespace */
extern unsigned char ge1347os2747;
extern T0* ge1347ov2747;
extern T0* T155f18(T0* C);
/* XM_NAMESPACE_RESOLVER.xml_prefix_namespace */
extern unsigned char ge1347os2746;
extern T0* ge1347ov2746;
extern T0* T155f17(T0* C);
/* XM_NAMESPACE_RESOLVER.is_xml */
extern T1 T155f16(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.xml_prefix */
extern unsigned char ge1347os2741;
extern T0* ge1347ov2741;
extern T0* T155f22(T0* C);
/* DS_LINKED_QUEUE [STRING_8].item */
extern T0* T288f5(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_is_empty */
extern T1 T155f15(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.has */
extern T1 T286f5(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag_finish */
extern void T96f18(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T95f12(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T95f12p1(T0* C);
/* XM_CALLBACKS_NULL.on_error */
extern void T158f11(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_error */
extern void T155f35(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_error */
extern void T96f20(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T95f14(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T95f14p1(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_xml_declaration */
extern void T158f12(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_NAMESPACE_RESOLVER.on_xml_declaration */
extern void T155f41(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_xml_declaration */
extern void T96f23(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_STOP_ON_ERROR_FILTER.on_xml_declaration */
extern void T95f16(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_NAMESPACE_RESOLVER.set_next */
extern void T155f40(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.set_next */
extern void T96f11(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.set_next */
extern void T95f5(T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.set_shallow */
extern void T45f24(T0* C, T1 a1);
/* ET_XACE_ACE_GENERATOR.set_shallow */
extern void T44f18(T0* C, T1 a1);
/* ET_XACE_XACE_GENERATOR.set_shallow */
extern void T43f18(T0* C, T1 a1);
/* ET_XACE_ECF_GENERATOR.generate_system */
extern void T45f25(T0* C, T0* a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.print_ecf_system_file */
extern void T45f27(T0* C, T0* a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.print_override_clusters */
extern void T45f41(T0* C, T0* a1, T6 a2, T0* a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].forth */
extern void T134f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].cursor_forth */
extern void T133f10(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].add_traversing_cursor */
extern void T133f11(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].set_next_cursor */
extern void T134f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].remove_traversing_cursor */
extern void T133f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].set */
extern void T134f10(T0* C, T0* a1, T1 a2, T1 a3);
/* ET_XACE_ECF_GENERATOR.print_override_cluster */
extern void T45f45(T0* C, T0* a1, T6 a2, T0* a3);
/* Creation of agent #1 in feature ET_XACE_ECF_GENERATOR.print_override_cluster */
extern T0* T45f45ac1(T0* a1, T6 a2, T0* a3);
/* Creation of agent #2 in feature ET_XACE_ECF_GENERATOR.print_override_cluster */
extern T0* T45f45ac2(T0* a1, T6 a2, T0* a3);
/* ET_XACE_ECF_GENERATOR.print_class_visible */
extern void T45f49(T0* C, T0* a1, T6 a2, T0* a3);
/* Creation of agent #1 in feature ET_XACE_ECF_GENERATOR.print_class_visible */
extern T0* T45f49ac1(T0* a1, T0* a2, T6 a3, T0* a4);
/* ET_XACE_ECF_GENERATOR.print_feature_visible */
extern void T45f50(T0* C, T0* a1, T0* a2, T6 a3, T0* a4);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].do_all */
extern void T123f10(T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.string_ */
extern T0* T45f10(T0* C);
/* ET_XACE_OPTIONS.export_option */
extern T0* T111f319(T0* C);
/* ET_XACE_OPTIONS.default_export_option */
extern unsigned char ge1250os7135;
extern T0* ge1250ov7135;
extern T0* T111f256(T0* C);
/* ET_XACE_OPTIONS.is_export_option_declared */
extern T1 T111f317(T0* C);
/* ET_XACE_ECF_GENERATOR.print_class_options */
extern void T45f48(T0* C, T0* a1, T6 a2, T0* a3);
/* DS_HASH_SET [STRING_8].has */
extern T1 T114f25(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].search_position */
extern void T114f42(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].clashes_item */
extern T6 T114f17(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].hash_position */
extern T6 T114f18(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].key_storage_item */
extern T0* T114f22(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_item */
extern T0* T114f30(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].key_equality_tester */
extern T0* T114f21(T0* C);
/* DS_HASH_SET [STRING_8].slots_item */
extern T6 T114f28(T0* C, T6 a1);
/* ET_XACE_OPTIONS.is_assertion_declared */
extern T1 T111f233(T0* C);
/* DS_HASH_SET [STRING_8].is_empty */
extern T1 T114f24(T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].forth */
extern void T112f8(T0* C);
/* DS_HASH_SET [STRING_8].cursor_forth */
extern void T114f62(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].add_traversing_cursor */
extern void T114f64(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_next_cursor */
extern void T112f10(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].remove_traversing_cursor */
extern void T114f63(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_position */
extern void T112f9(T0* C, T6 a1);
/* DS_HASH_SET_CURSOR [STRING_8].item */
extern T0* T112f4(T0* C);
/* DS_HASH_SET [STRING_8].cursor_item */
extern T0* T114f32(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].after */
extern T1 T112f5(T0* C);
/* DS_HASH_SET [STRING_8].cursor_after */
extern T1 T114f31(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].start */
extern void T112f7(T0* C);
/* DS_HASH_SET [STRING_8].cursor_start */
extern void T114f61(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].cursor_off */
extern T1 T114f36(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].new_cursor */
extern T0* T114f20(T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].make */
extern T0* T112c6(T0* a1);
/* ET_XACE_OPTIONS.debug_tag */
extern T0* T111f287(T0* C);
/* ET_XACE_OPTIONS.default_debug_tag */
extern unsigned char ge1250os7126;
extern T0* ge1250ov7126;
extern T0* T111f242(T0* C);
/* DS_HASH_SET [STRING_8].set_equality_tester */
extern void T114f38(T0* C, T0* a1);
/* ET_XACE_OPTIONS.string_equality_tester */
extern T0* T111f356(T0* C);
/* DS_HASH_SET [STRING_8].make */
extern T0* T114c37(T6 a1);
/* DS_HASH_SET [STRING_8].unset_found_item */
extern void T114f47(T0* C);
/* DS_HASH_SET [STRING_8].make_slots */
extern void T114f46(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].special_integer_ */
extern T0* T114f26(T0* C);
/* DS_HASH_SET [STRING_8].new_modulus */
extern T6 T114f27(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_clashes */
extern void T114f45(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_key_storage */
extern void T114f44(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_item_storage */
extern void T114f43(T0* C, T6 a1);
/* ET_XACE_OPTIONS.is_debug_tag_declared */
extern T1 T111f285(T0* C);
/* ET_XACE_OPTIONS.full_class_checking */
extern T1 T111f174(T0* C);
/* UT_TRISTATE.is_true */
extern T1 T238f2(T0* C);
/* ET_XACE_OPTIONS.is_full_class_checking_declared */
extern T1 T111f173(T0* C);
/* UT_TRISTATE.is_undefined */
extern T1 T238f4(T0* C);
/* UT_TRISTATE.is_false */
extern T1 T238f3(T0* C);
/* ET_XACE_OPTIONS.is_namespace_declared */
extern T1 T111f126(T0* C);
/* ET_XACE_OPTIONS.warning */
extern T0* T111f169(T0* C);
/* ET_XACE_OPTIONS.default_warning */
extern unsigned char ge1250os7200;
extern T0* ge1250ov7200;
extern T0* T111f353(T0* C);
/* ET_XACE_OPTIONS.options */
extern unsigned char ge1238os2692;
extern T0* ge1238ov2692;
extern T0* T111f357(T0* C);
/* ET_XACE_OPTION_NAMES.default_create */
extern T0* T127c217(void);
/* ET_XACE_OPTIONS.debug_option */
extern T1 T111f283(T0* C);
/* ET_XACE_OPTIONS.profile */
extern T1 T111f137(T0* C);
/* ET_XACE_OPTIONS.trace */
extern T1 T111f157(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].do_all */
extern void T120f10(T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.print_file_rules */
extern void T45f47(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.exclude */
extern T0* T111f315(T0* C);
/* ET_XACE_OPTIONS.default_exclude */
extern unsigned char ge1250os7134;
extern T0* ge1250ov7134;
extern T0* T111f254(T0* C);
/* ET_XACE_ECF_GENERATOR.print_escaped_string */
extern void T45f42(T0* C, T0* a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.print_escaped_character */
extern void T45f46(T0* C, T6 a1, T0* a2);
/* KL_TEXT_OUTPUT_FILE.put_integer */
extern void T81f32(T0* C, T6 a1);
/* ET_XACE_ECF_GENERATOR.quot_entity */
extern unsigned char ge1347os2734;
extern T0* ge1347ov2734;
extern T0* T45f9(T0* C);
/* ET_XACE_ECF_GENERATOR.amp_entity */
extern unsigned char ge1347os2733;
extern T0* ge1347ov2733;
extern T0* T45f21(T0* C);
/* ET_XACE_ECF_GENERATOR.gt_entity */
extern unsigned char ge1347os2732;
extern T0* ge1347ov2732;
extern T0* T45f19(T0* C);
/* ET_XACE_ECF_GENERATOR.lt_entity */
extern unsigned char ge1347os2731;
extern T0* ge1347ov2731;
extern T0* T45f17(T0* C);
/* ET_XACE_ECF_GENERATOR.is_escaped */
extern T1 T45f15(T0* C, T6 a1);
/* ET_XACE_OPTIONS.include */
extern T0* T111f366(T0* C);
/* ET_XACE_OPTIONS.default_include */
extern unsigned char ge1250os7149;
extern T0* ge1250ov7149;
extern T0* T111f278(T0* C);
/* ET_XACE_OPTIONS.is_exclude_declared */
extern T1 T111f313(T0* C);
/* ET_XACE_OPTIONS.is_include_declared */
extern T1 T111f364(T0* C);
/* ET_XACE_OPTIONS.is_prefix_option_declared */
extern T1 T111f134(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_character */
extern void T81f31(T0* C, T2 a1);
/* KL_TEXT_OUTPUT_FILE.old_put_character */
extern void T81f34(T0* C, T2 a1);
/* KL_TEXT_OUTPUT_FILE.file_pc */
extern void T81f36(T0* C, T14 a1, T2 a2);
/* ET_XACE_CLUSTER.full_pathname */
extern T0* T117f21(T0* C);
/* KL_UNIX_FILE_SYSTEM.pathname */
extern T0* T131f8(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.append_character */
extern void T233f55(T0* C, T2 a1);
/* KL_UNIX_FILE_SYSTEM.string_ */
extern T0* T131f9(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.pathname */
extern T0* T418f5(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_separator */
extern T1 T418f3(T0* C, T2 a1);
/* KL_WINDOWS_FILE_SYSTEM.string_ */
extern T0* T418f2(T0* C);
/* ET_XACE_CLUSTER.file_system */
extern unsigned char ge135os1796;
extern T0* ge135ov1796;
extern T0* T117f25(T0* C);
/* ET_XACE_CLUSTER.unix_file_system */
extern unsigned char ge135os1799;
extern T0* ge135ov1799;
extern T0* T117f28(T0* C);
/* KL_UNIX_FILE_SYSTEM.make */
extern T0* T131c10(void);
/* KL_OPERATING_SYSTEM.is_unix */
extern unsigned char ge164os3050;
extern T1 ge164ov3050;
extern T1 T224f5(T0* C);
/* KL_OPERATING_SYSTEM.current_working_directory */
extern T0* T224f3(T0* C);
/* EXECUTION_ENVIRONMENT.current_working_directory */
extern T0* T248f2(T0* C);
/* KL_OPERATING_SYSTEM.execution_environment */
extern unsigned char ge164os3054;
extern T0* ge164ov3054;
extern T0* T224f4(T0* C);
/* EXECUTION_ENVIRONMENT.default_create */
extern T0* T248c4(void);
/* KL_OPERATING_SYSTEM.variable_value */
extern T0* T224f2(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.get */
extern T0* T248f1(T0* C, T0* a1);
/* STRING_8.make_from_c_pointer */
extern T0* T17c50(T14 a1);
/* C_STRING.read_substring_into_character_8_area */
extern void T370f6(T0* C, T0* a1, T6 a2, T6 a3);
/* MANAGED_POINTER.read_natural_8 */
extern T8 T422f6(T0* C, T6 a1);
/* TYPED_POINTER [NATURAL_8].memory_copy */
extern void T440f2(T440* C, T14 a1, T6 a2);
/* TYPED_POINTER [NATURAL_8].c_memcpy */
extern void T440f3(T440* C, T14 a1, T14 a2, T6 a3);
/* C_STRING.set_shared_from_pointer */
extern void T370f5(T0* C, T14 a1);
/* C_STRING.set_shared_from_pointer_and_count */
extern void T370f7(T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.set_from_pointer */
extern void T422f10(T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.share_from_pointer */
extern T0* T422c9(T14 a1, T6 a2);
/* C_STRING.c_strlen */
extern T6 T370f3(T0* C, T14 a1);
/* STRING_8.c_string_provider */
extern unsigned char ge2265os1266;
extern T0* ge2265ov1266;
extern T0* T17f29(T0* C);
/* C_STRING.make_empty */
extern T0* T370c4(T6 a1);
/* MANAGED_POINTER.make */
extern T0* T422c7(T6 a1);
/* EXCEPTIONS.raise */
extern void T441f3(T0* C, T0* a1);
/* EXCEPTIONS.eraise */
extern void T441f4(T0* C, T14 a1, T6 a2);
/* EXCEPTIONS.default_create */
extern T0* T441c2(void);
/* MANAGED_POINTER.default_pointer */
extern T14 T422f5(T0* C);
/* POINTER.memory_calloc */
extern T14 T14f2(T14* C, T6 a1, T6 a2);
/* POINTER.c_calloc */
extern T14 T14f3(T14* C, T6 a1, T6 a2);
/* EXECUTION_ENVIRONMENT.eif_getenv */
extern T14 T248f3(T0* C, T14 a1);
/* UC_UTF8_STRING.to_c */
extern T0* T233f32(T0* C);
/* STRING_8.to_c */
extern T0* T17f27(T0* C);
/* ET_XACE_CLUSTER.windows_file_system */
extern unsigned char ge135os1797;
extern T0* ge135ov1797;
extern T0* T117f27(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.make */
extern T0* T418c6(void);
/* KL_OPERATING_SYSTEM.is_windows */
extern unsigned char ge164os3049;
extern T1 ge164ov3049;
extern T1 T224f1(T0* C);
/* ET_XACE_CLUSTER.operating_system */
extern T0* T117f26(T0* C);
/* ET_XACE_CLUSTER.prefixed_name */
extern T0* T117f30(T0* C);
/* ET_XACE_CLUSTER.string_ */
extern T0* T117f24(T0* C);
/* ET_XACE_CLUSTER.is_fully_abstract */
extern T1 T117f29(T0* C);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].item */
extern T0* T116f6(T0* C, T6 a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].item */
extern T0* T134f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].start */
extern void T134f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].cursor_start */
extern void T133f9(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].cursor_off */
extern T1 T133f6(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].new_cursor */
extern T0* T133f7(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].make */
extern T0* T134c7(T0* a1);
/* ET_XACE_CLUSTERS.merge_override_clusters */
extern void T109f10(T0* C, T0* a1);
/* ET_XACE_CLUSTER.merge_override_clusters */
extern void T117f46(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].force_last */
extern void T133f13(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_CLUSTER].put_right */
extern void T249f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_CLUSTER].make */
extern T0* T249c3(T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].is_empty */
extern T1 T133f5(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].make */
extern T0* T133c8(void);
/* ET_XACE_ECF_GENERATOR.print_clusters */
extern void T45f40(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_ECF_GENERATOR.print_cluster */
extern void T45f44(T0* C, T0* a1, T6 a2, T0* a3);
/* Creation of agent #1 in feature ET_XACE_ECF_GENERATOR.print_cluster */
extern T0* T45f44ac1(T0* a1, T6 a2, T0* a3);
/* Creation of agent #2 in feature ET_XACE_ECF_GENERATOR.print_cluster */
extern T0* T45f44ac2(T0* a1, T6 a2, T0* a3);
/* ET_XACE_CLUSTER.is_fully_ecf_abstract */
extern T1 T117f23(T0* C);
/* ET_XACE_OPTIONS.is_ecf_library_declared */
extern T1 T111f375(T0* C);
/* ET_XACE_ECF_GENERATOR.print_assemblies */
extern void T45f39(T0* C, T0* a1, T6 a2, T0* a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].forth */
extern void T129f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].cursor_forth */
extern void T128f10(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].add_traversing_cursor */
extern void T128f11(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].set_next_cursor */
extern void T129f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].remove_traversing_cursor */
extern void T128f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].set */
extern void T129f10(T0* C, T0* a1, T1 a2, T1 a3);
/* UC_UTF8_STRING.old_is_empty */
extern T1 T233f16(T0* C);
/* STRING_8.is_empty */
extern T1 T17f28(T0* C);
/* ET_XACE_ECF_GENERATOR.print_escaped_name */
extern void T45f43(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].item */
extern T0* T129f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].start */
extern void T129f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].cursor_start */
extern void T128f9(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].cursor_off */
extern T1 T128f5(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].new_cursor */
extern T0* T128f7(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].make */
extern T0* T129c7(T0* a1);
/* ET_XACE_CLUSTERS.merge_assemblies */
extern void T109f8(T0* C, T0* a1);
/* ET_XACE_CLUSTER.merge_assemblies */
extern void T117f44(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].force_last */
extern void T128f13(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_ASSEMBLY].put_right */
extern void T247f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_ASSEMBLY].make */
extern T0* T247c3(T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].is_empty */
extern T1 T128f6(T0* C);
/* ET_XACE_ASSEMBLY.set_assembly_pathname */
extern void T130f9(T0* C, T0* a1);
/* ET_XACE_ASSEMBLY.make */
extern T0* T130c8(T0* a1, T0* a2, T0* a3, T0* a4, T0* a5, T0* a6);
/* ET_XACE_OPTIONS.prefix_option */
extern T0* T111f135(T0* C);
/* ET_XACE_OPTIONS.default_prefix_option */
extern unsigned char ge1250os7178;
extern T0* ge1250ov7178;
extern T0* T111f320(T0* C);
/* ET_XACE_OPTIONS.public_key_token */
extern T0* T111f139(T0* C);
/* ET_XACE_OPTIONS.default_public_key_token */
extern unsigned char ge1250os7180;
extern T0* ge1250ov7180;
extern T0* T111f324(T0* C);
/* ET_XACE_OPTIONS.is_public_key_token_declared */
extern T1 T111f138(T0* C);
/* ET_XACE_OPTIONS.culture */
extern T0* T111f271(T0* C);
/* ET_XACE_OPTIONS.default_culture */
extern unsigned char ge1250os7122;
extern T0* ge1250ov7122;
extern T0* T111f234(T0* C);
/* ET_XACE_OPTIONS.is_culture_declared */
extern T1 T111f269(T0* C);
/* ET_XACE_OPTIONS.version */
extern T0* T111f165(T0* C);
/* ET_XACE_OPTIONS.default_version */
extern unsigned char ge1250os7198;
extern T0* ge1250ov7198;
extern T0* T111f349(T0* C);
/* ET_XACE_OPTIONS.is_version_declared */
extern T1 T111f164(T0* C);
/* ET_XACE_OPTIONS.assembly */
extern T0* T111f231(T0* C);
/* ET_XACE_OPTIONS.default_assembly */
extern unsigned char ge1250os7110;
extern T0* ge1250ov7110;
extern T0* T111f215(T0* C);
/* ET_XACE_OPTIONS.is_assembly_declared */
extern T1 T111f229(T0* C);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].make */
extern T0* T128c8(void);
/* ET_XACE_ECF_GENERATOR.print_ecf_clusters */
extern void T45f38(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_CLUSTERS.merge_ecf_clusters */
extern void T109f9(T0* C, T0* a1);
/* ET_XACE_CLUSTER.merge_ecf_clusters */
extern void T117f45(T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.print_mounted_libraries */
extern void T45f37(T0* C, T0* a1, T6 a2, T0* a3);
/* KL_UNIX_FILE_SYSTEM.dirname */
extern T0* T131f3(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.root_directory */
extern unsigned char ge144os7556;
extern T0* ge144ov7556;
extern T0* T131f6(T0* C);
/* KL_UNIX_FILE_SYSTEM.is_root_directory */
extern T1 T131f5(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.basename */
extern T0* T131f2(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.interpreted_string */
extern T0* T132f2(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.variable_value */
extern T0* T132f1(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.environment_impl */
extern unsigned char ge230os7668;
extern T0* ge230ov7668;
extern T0* T132f3(T0* C);
/* KL_STRING_ROUTINES.append_substring_to_string */
extern void T47f15(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* KL_STRING_ROUTINES.appended_substring */
extern T0* T47f3(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* KL_EXECUTION_ENVIRONMENT.string_ */
extern T0* T132f4(T0* C);
/* ET_XACE_ECF_GENERATOR.execution_environment */
extern unsigned char ge170os1795;
extern T0* ge170ov1795;
extern T0* T45f14(T0* C);
/* KL_EXECUTION_ENVIRONMENT.default_create */
extern T0* T132c5(void);
/* UC_UTF8_STRING.remove_tail */
extern void T233f62(T0* C, T6 a1);
/* UC_UTF8_STRING.keep_head */
extern void T233f77(T0* C, T6 a1);
/* STRING_8.remove_tail */
extern void T17f47(T0* C, T6 a1);
/* STRING_8.keep_head */
extern void T17f48(T0* C, T6 a1);
/* KL_UNIX_FILE_SYSTEM.extension */
extern T0* T131f1(T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.unix_file_system */
extern T0* T45f13(T0* C);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].item */
extern T0* T118f7(T0* C, T6 a1);
/* ET_XACE_ECF_GENERATOR.print_external_libraries */
extern void T45f36(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_ECF_GENERATOR.replace_all_characters */
extern T0* T45f12(T0* C, T0* a1, T2 a2, T2 a3);
/* UC_UTF8_STRING.put */
extern void T233f61(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.move_bytes_right */
extern void T233f76(T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.move_bytes_left */
extern void T233f75(T0* C, T6 a1, T6 a2);
/* ET_XACE_ECF_GENERATOR.is_windows */
extern T1 T45f11(T0* C);
/* ET_XACE_ECF_GENERATOR.operating_system */
extern T0* T45f22(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].value */
extern T0* T24f32(T0* C, T0* a1);
/* ET_XACE_EXTERNALS.has_link_libraries */
extern T1 T126f5(T0* C);
/* ET_XACE_ECF_GENERATOR.print_external_c_compiler_options */
extern void T45f35(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_EXTERNALS.has_c_compiler_options */
extern T1 T126f4(T0* C);
/* ET_XACE_ECF_GENERATOR.print_external_includes */
extern void T45f34(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_EXTERNALS.has_include_directories */
extern T1 T126f6(T0* C);
/* ET_XACE_SYSTEM_CONFIG.merge_externals */
extern void T78f8(T0* C, T0* a1);
/* ET_XACE_MOUNTED_LIBRARIES.merge_externals */
extern void T110f8(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.merge_externals */
extern void T109f11(T0* C, T0* a1);
/* ET_XACE_CLUSTER.merge_externals */
extern void T117f47(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].forth */
extern void T113f9(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_forth */
extern void T115f22(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].set_position */
extern void T113f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].add_traversing_cursor */
extern void T115f23(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T113f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].remove_traversing_cursor */
extern void T115f24(T0* C, T0* a1);
/* ET_XACE_EXTERNALS.put_link_library */
extern void T126f10(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].force_last */
extern void T33f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].item */
extern T0* T113f4(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_item */
extern T0* T115f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].item */
extern T0* T115f14(T0* C, T6 a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].after */
extern T1 T113f6(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_after */
extern T1 T115f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].start */
extern void T113f8(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_start */
extern void T115f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].is_empty */
extern T1 T115f8(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].off */
extern T1 T113f5(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_off */
extern T1 T115f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].cursor_before */
extern T1 T115f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].new_cursor */
extern T0* T115f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].make */
extern T0* T113c7(T0* a1);
/* ET_XACE_OPTIONS.link */
extern T0* T111f105(T0* C);
/* ET_XACE_OPTIONS.default_link */
extern unsigned char ge1250os7157;
extern T0* ge1250ov7157;
extern T0* T111f294(T0* C);
/* DS_ARRAYED_LIST [STRING_8].set_equality_tester */
extern void T115f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].make */
extern T0* T115c17(T6 a1);
/* ET_XACE_OPTIONS.is_link_declared */
extern T1 T111f104(T0* C);
/* ET_XACE_EXTERNALS.put_include_directory */
extern void T126f9(T0* C, T0* a1);
/* ET_XACE_OPTIONS.header */
extern T0* T111f348(T0* C);
/* ET_XACE_OPTIONS.default_header */
extern unsigned char ge1250os7146;
extern T0* ge1250ov7146;
extern T0* T111f270(T0* C);
/* ET_XACE_OPTIONS.is_header_declared */
extern T1 T111f346(T0* C);
/* ET_XACE_EXTERNALS.put_c_compiler_options */
extern void T126f8(T0* C, T0* a1);
/* ET_XACE_OPTIONS.c_compiler_options */
extern T0* T111f275(T0* C);
/* ET_XACE_OPTIONS.default_c_compiler_options */
extern unsigned char ge1250os7123;
extern T0* ge1250ov7123;
extern T0* T111f236(T0* C);
/* ET_XACE_OPTIONS.is_c_compiler_options_declared */
extern T1 T111f273(T0* C);
/* ET_XACE_EXTERNALS.make */
extern T0* T126c7(void);
/* ET_XACE_ECF_GENERATOR.print_settings */
extern void T45f33(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.use_full_cluster_name_as_namespace */
extern T1 T111f161(T0* C);
/* ET_XACE_OPTIONS.is_use_full_cluster_name_as_namespace_declared */
extern T1 T111f160(T0* C);
/* ET_XACE_OPTIONS.use_cluster_name_as_namespace */
extern T1 T111f159(T0* C);
/* ET_XACE_OPTIONS.is_use_cluster_name_as_namespace_declared */
extern T1 T111f158(T0* C);
/* ET_XACE_OPTIONS.is_shared_library_definition_declared */
extern T1 T111f142(T0* C);
/* ET_XACE_OPTIONS.old_verbatim_strings */
extern T1 T111f198(T0* C);
/* ET_XACE_OPTIONS.is_old_verbatim_strings_declared */
extern T1 T111f197(T0* C);
/* ET_XACE_OPTIONS.multithreaded */
extern T1 T111f125(T0* C);
/* ET_XACE_OPTIONS.is_multithreaded_declared */
extern T1 T111f124(T0* C);
/* ET_XACE_OPTIONS.msil_use_optimized_precompile */
extern T1 T111f196(T0* C);
/* ET_XACE_OPTIONS.is_msil_use_optimized_precompile_declared */
extern T1 T111f195(T0* C);
/* ET_XACE_OPTIONS.is_msil_key_file_name_declared */
extern T1 T111f193(T0* C);
/* ET_XACE_OPTIONS.target */
extern T0* T111f155(T0* C);
/* ET_XACE_OPTIONS.default_target */
extern unsigned char ge1250os7190;
extern T0* ge1250ov7190;
extern T0* T111f339(T0* C);
/* ET_XACE_OPTIONS.is_target_declared */
extern T1 T111f154(T0* C);
/* ET_XACE_OPTIONS.msil_generation */
extern T1 T111f121(T0* C);
/* ET_XACE_OPTIONS.is_msil_generation_declared */
extern T1 T111f120(T0* C);
/* ET_XACE_OPTIONS.is_msil_culture_declared */
extern T1 T111f191(T0* C);
/* ET_XACE_OPTIONS.is_msil_clr_version_declared */
extern T1 T111f118(T0* C);
/* ET_XACE_OPTIONS.msil_classes_per_module */
extern T6 T111f189(T0* C);
/* ET_XACE_OPTIONS.is_msil_classes_per_module_declared */
extern T1 T111f188(T0* C);
/* ET_XACE_OPTIONS.is_msil_assembly_compatibility_declared */
extern T1 T111f116(T0* C);
/* ET_XACE_OPTIONS.is_metadata_cache_path_declared */
extern T1 T111f114(T0* C);
/* ET_XACE_OPTIONS.line_generation */
extern T1 T111f103(T0* C);
/* ET_XACE_OPTIONS.is_line_generation_declared */
extern T1 T111f102(T0* C);
/* ET_XACE_OPTIONS.inlining_size */
extern T6 T111f374(T0* C);
/* ET_XACE_OPTIONS.is_inlining_size_declared */
extern T1 T111f372(T0* C);
/* ET_XACE_OPTIONS.inlining */
extern T0* T111f370(T0* C);
/* ET_XACE_OPTIONS.default_inlining */
extern unsigned char ge1250os7150;
extern T0* ge1250ov7150;
extern T0* T111f280(T0* C);
/* DS_HASH_SET [STRING_8].put_new */
extern void T114f40(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].item_storage_put */
extern void T114f48(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [STRING_8].slots_put */
extern void T114f51(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING_8].clashes_put */
extern void T114f50(T0* C, T6 a1, T6 a2);
/* ET_XACE_OPTIONS.is_inlining_declared */
extern T1 T111f368(T0* C);
/* ET_XACE_OPTIONS.il_verifiable */
extern T1 T111f362(T0* C);
/* ET_XACE_OPTIONS.is_il_verifiable_declared */
extern T1 T111f360(T0* C);
/* ET_XACE_OPTIONS.force_32bits */
extern T1 T111f185(T0* C);
/* ET_XACE_OPTIONS.is_force_32bits_declared */
extern T1 T111f184(T0* C);
/* ET_XACE_OPTIONS.is_external_runtime_declared */
extern T1 T111f182(T0* C);
/* ET_XACE_OPTIONS.exception_trace */
extern T1 T111f310(T0* C);
/* ET_XACE_OPTIONS.is_exception_trace_declared */
extern T1 T111f308(T0* C);
/* ET_XACE_OPTIONS.enforce_unique_class_names */
extern T1 T111f181(T0* C);
/* ET_XACE_OPTIONS.is_enforce_unique_class_names_declared */
extern T1 T111f180(T0* C);
/* ET_XACE_OPTIONS.dynamic_runtime */
extern T1 T111f306(T0* C);
/* ET_XACE_OPTIONS.is_dynamic_runtime_declared */
extern T1 T111f301(T0* C);
/* ET_XACE_OPTIONS.dotnet_naming_convention */
extern T1 T111f299(T0* C);
/* ET_XACE_OPTIONS.is_dotnet_naming_convention_declared */
extern T1 T111f297(T0* C);
/* ET_XACE_OPTIONS.dead_code_removal */
extern T0* T111f279(T0* C);
/* ET_XACE_OPTIONS.default_dead_code_removal */
extern unsigned char ge1250os7124;
extern T0* ge1250ov7124;
extern T0* T111f238(T0* C);
/* ET_XACE_OPTIONS.is_dead_code_removal_declared */
extern T1 T111f277(T0* C);
/* ET_XACE_OPTIONS.console_application */
extern T1 T111f263(T0* C);
/* ET_XACE_OPTIONS.is_console_application_declared */
extern T1 T111f261(T0* C);
/* ET_XACE_OPTIONS.cls_compliant */
extern T1 T111f255(T0* C);
/* ET_XACE_OPTIONS.is_cls_compliant_declared */
extern T1 T111f253(T0* C);
/* ET_XACE_OPTIONS.check_vape */
extern T1 T111f247(T0* C);
/* ET_XACE_OPTIONS.is_check_vape_declared */
extern T1 T111f245(T0* C);
/* ET_XACE_OPTIONS.check_generic_creation_constraint */
extern T1 T111f179(T0* C);
/* ET_XACE_OPTIONS.is_check_generic_creation_constraint_declared */
extern T1 T111f178(T0* C);
/* ET_XACE_OPTIONS.automatic_backup */
extern T1 T111f177(T0* C);
/* ET_XACE_OPTIONS.is_automatic_backup_declared */
extern T1 T111f176(T0* C);
/* ET_XACE_OPTIONS.array_optimization */
extern T1 T111f227(T0* C);
/* ET_XACE_OPTIONS.is_array_optimization_declared */
extern T1 T111f225(T0* C);
/* ET_XACE_OPTIONS.address_expression */
extern T1 T111f219(T0* C);
/* ET_XACE_OPTIONS.is_address_expression_declared */
extern T1 T111f217(T0* C);
/* ET_XACE_ECF_GENERATOR.print_options */
extern void T45f32(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.set_debug_option */
extern void T111f395(T0* C, T1 a1);
/* UT_TRISTATE.set_false */
extern void T238f7(T0* C);
/* UT_TRISTATE.set_true */
extern void T238f6(T0* C);
/* UT_TRISTATE.make_undefined */
extern T0* T238c5(void);
/* UT_TRISTATE.set_undefined */
extern void T238f8(T0* C);
/* ET_XACE_OPTIONS.is_debug_option_declared */
extern T1 T111f281(T0* C);
/* ET_XACE_OPTIONS.set_profile */
extern void T111f449(T0* C, T1 a1);
/* ET_XACE_OPTIONS.is_profile_declared */
extern T1 T111f136(T0* C);
/* ET_XACE_OPTIONS.set_trace */
extern void T111f460(T0* C, T1 a1);
/* ET_XACE_OPTIONS.is_trace_declared */
extern T1 T111f156(T0* C);
/* ET_XACE_OPTIONS.set_warning */
extern void T111f466(T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.options */
extern T0* T45f7(T0* C);
/* ET_XACE_OPTIONS.is_warning_declared */
extern T1 T111f168(T0* C);
/* ET_XACE_ECF_GENERATOR.print_indentation */
extern void T45f31(T0* C, T6 a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.print_quote_escaped_string */
extern void T45f30(T0* C, T0* a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.print_ecf_namespaces */
extern void T45f29(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.put_string */
extern void T81f30(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_put_string */
extern void T81f33(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_ps */
extern void T81f35(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_TEXT_OUTPUT_FILE.string_ */
extern T0* T81f9(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_line */
extern void T81f28(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.put_new_line */
extern void T81f29(T0* C);
/* ET_XACE_ACE_GENERATOR.generate_system */
extern void T44f19(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_GENERATOR.print_ace_file */
extern void T44f21(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_GENERATOR.print_link_libraries */
extern void T44f29(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [STRING_8].is_last */
extern T1 T31f7(T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_is_last */
extern T1 T33f8(T0* C, T0* a1);
/* ET_XACE_ACE_GENERATOR.replace_all_characters */
extern T0* T44f11(T0* C, T0* a1, T2 a2, T2 a3);
/* ET_XACE_ACE_GENERATOR.string_ */
extern T0* T44f9(T0* C);
/* ET_XACE_ACE_GENERATOR.is_windows */
extern T1 T44f10(T0* C);
/* ET_XACE_ACE_GENERATOR.operating_system */
extern T0* T44f16(T0* C);
/* ET_XACE_ACE_GENERATOR.execution_environment */
extern T0* T44f15(T0* C);
/* ET_XACE_ACE_GENERATOR.print_c_compiler_options_and_include_directories */
extern void T44f28(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_ACE_GENERATOR.print_assemblies */
extern void T44f27(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_GENERATOR.print_clusters */
extern void T44f26(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_GENERATOR.print_cluster */
extern void T44f30(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_GENERATOR.print_class_options */
extern T1 T44f13(T0* C, T0* a1, T6 a2, T0* a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].forth */
extern void T124f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].cursor_forth */
extern void T123f12(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].add_traversing_cursor */
extern void T123f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].set_next_cursor */
extern void T124f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].remove_traversing_cursor */
extern void T123f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].set */
extern void T124f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].item */
extern T0* T124f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].start */
extern void T124f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].cursor_start */
extern void T123f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].cursor_off */
extern T1 T123f7(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].new_cursor */
extern T0* T123f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].make */
extern T0* T124c7(T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].forth */
extern void T121f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].cursor_forth */
extern void T120f12(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].add_traversing_cursor */
extern void T120f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].set_next_cursor */
extern void T121f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].remove_traversing_cursor */
extern void T120f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].set */
extern void T121f10(T0* C, T0* a1, T1 a2, T1 a3);
/* ET_XACE_ACE_GENERATOR.options */
extern T0* T44f8(T0* C);
/* ET_XACE_OPTIONS.assertion */
extern T0* T111f235(T0* C);
/* ET_XACE_OPTIONS.default_assertion */
extern unsigned char ge1250os7111;
extern T0* ge1250ov7111;
extern T0* T111f216(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].item */
extern T0* T121f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].start */
extern void T121f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].cursor_start */
extern void T120f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].cursor_off */
extern T1 T120f7(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].new_cursor */
extern T0* T120f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].make */
extern T0* T121c7(T0* a1);
/* ET_XACE_ACE_GENERATOR.print_cluster_options */
extern T1 T44f12(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.namespace */
extern T0* T111f127(T0* C);
/* ET_XACE_OPTIONS.default_namespace */
extern unsigned char ge1250os7172;
extern T0* ge1250ov7172;
extern T0* T111f312(T0* C);
/* ET_XACE_OPTIONS.document */
extern T0* T111f295(T0* C);
/* ET_XACE_OPTIONS.default_document */
extern unsigned char ge1250os7128;
extern T0* ge1250ov7128;
extern T0* T111f246(T0* C);
/* ET_XACE_OPTIONS.is_document_declared */
extern T1 T111f293(T0* C);
/* ET_XACE_ACE_GENERATOR.print_options */
extern void T44f25(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.shared_library_definition */
extern T0* T111f143(T0* C);
/* ET_XACE_OPTIONS.default_shared_library_definition */
extern unsigned char ge1250os7184;
extern T0* ge1250ov7184;
extern T0* T111f327(T0* C);
/* ET_XACE_OPTIONS.precompiled */
extern T0* T111f133(T0* C);
/* ET_XACE_OPTIONS.default_precompiled */
extern unsigned char ge1250os7177;
extern T0* ge1250ov7177;
extern T0* T111f318(T0* C);
/* ET_XACE_OPTIONS.is_precompiled_declared */
extern T1 T111f132(T0* C);
/* ET_XACE_OPTIONS.override_cluster */
extern T0* T111f202(T0* C);
/* ET_XACE_OPTIONS.default_override_cluster */
extern unsigned char ge1250os7175;
extern T0* ge1250ov7175;
extern T0* T111f201(T0* C);
/* ET_XACE_OPTIONS.is_override_cluster_declared */
extern T1 T111f200(T0* C);
/* ET_XACE_OPTIONS.msil_generation_version */
extern T0* T111f123(T0* C);
/* ET_XACE_OPTIONS.default_msil_generation_version */
extern unsigned char ge1250os7168;
extern T0* ge1250ov7168;
extern T0* T111f309(T0* C);
/* ET_XACE_OPTIONS.is_msil_generation_version_declared */
extern T1 T111f122(T0* C);
/* ET_XACE_OPTIONS.msil_clr_version */
extern T0* T111f119(T0* C);
/* ET_XACE_OPTIONS.default_msil_clr_version */
extern unsigned char ge1250os7165;
extern T0* ge1250ov7165;
extern T0* T111f305(T0* C);
/* ET_XACE_OPTIONS.msil_assembly_compatibility */
extern T0* T111f117(T0* C);
/* ET_XACE_OPTIONS.default_msil_assembly_compatibility */
extern unsigned char ge1250os7163;
extern T0* ge1250ov7163;
extern T0* T111f304(T0* C);
/* ET_XACE_OPTIONS.metadata_cache_path */
extern T0* T111f115(T0* C);
/* ET_XACE_OPTIONS.default_metadata_cache_path */
extern unsigned char ge1250os7162;
extern T0* ge1250ov7162;
extern T0* T111f303(T0* C);
/* ET_XACE_OPTIONS.arguments */
extern T0* T111f223(T0* C);
/* ET_XACE_OPTIONS.default_arguments */
extern unsigned char ge1250os7108;
extern T0* ge1250ov7108;
extern T0* T111f211(T0* C);
/* ET_XACE_OPTIONS.is_arguments_declared */
extern T1 T111f221(T0* C);
/* ET_XACE_ACE_GENERATOR.print_escaped_name */
extern void T44f24(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_GENERATOR.is_lace_keyword */
extern T1 T44f7(T0* C, T0* a1);
/* ARRAY [STRING_8].item */
extern T0* T63f5(T0* C, T6 a1);
/* ET_XACE_ACE_GENERATOR.lace_keywords */
extern unsigned char ge1274os2814;
extern T0* ge1274ov2814;
extern T0* T44f14(T0* C);
/* UC_UTF8_STRING.has */
extern T1 T233f47(T0* C, T2 a1);
/* UC_UTF8_STRING.index_of */
extern T6 T233f48(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.index_of_item_code */
extern T6 T233f49(T0* C, T6 a1, T6 a2);
/* ET_XACE_ACE_GENERATOR.print_indentation */
extern void T44f23(T0* C, T6 a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.generate_system */
extern void T43f19(T0* C, T0* a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.print_xace_system_file */
extern void T43f21(T0* C, T0* a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.print_mounted_libraries */
extern void T43f28(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XACE_GENERATOR.print_clusters */
extern void T43f27(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XACE_GENERATOR.print_cluster */
extern void T43f30(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XACE_GENERATOR.print_class_options */
extern void T43f32(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XACE_GENERATOR.print_feature_options */
extern void T43f33(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XACE_GENERATOR.string_ */
extern T0* T43f10(T0* C);
/* ET_XACE_XACE_GENERATOR.print_console_application_option */
extern void T43f26(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XACE_GENERATOR.print_options */
extern void T43f25(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.wedit */
extern T1 T111f171(T0* C);
/* ET_XACE_OPTIONS.is_wedit_declared */
extern T1 T111f170(T0* C);
/* ET_XACE_OPTIONS.visible_filename */
extern T0* T111f167(T0* C);
/* ET_XACE_OPTIONS.default_visible_filename */
extern unsigned char ge1250os7199;
extern T0* ge1250ov7199;
extern T0* T111f351(T0* C);
/* ET_XACE_OPTIONS.is_visible_filename_declared */
extern T1 T111f166(T0* C);
/* ET_XACE_OPTIONS.verbose */
extern T1 T111f163(T0* C);
/* ET_XACE_OPTIONS.is_verbose_declared */
extern T1 T111f162(T0* C);
/* ET_XACE_OPTIONS.strip_option */
extern T1 T111f153(T0* C);
/* ET_XACE_OPTIONS.is_strip_option_declared */
extern T1 T111f152(T0* C);
/* ET_XACE_OPTIONS.storable_filename */
extern T0* T111f151(T0* C);
/* ET_XACE_OPTIONS.default_storable_filename */
extern unsigned char ge1250os7188;
extern T0* ge1250ov7188;
extern T0* T111f335(T0* C);
/* ET_XACE_OPTIONS.is_storable_filename_declared */
extern T1 T111f150(T0* C);
/* ET_XACE_OPTIONS.storable */
extern T1 T111f149(T0* C);
/* ET_XACE_OPTIONS.is_storable_declared */
extern T1 T111f148(T0* C);
/* ET_XACE_OPTIONS.stack_size */
extern T6 T111f147(T0* C);
/* ET_XACE_OPTIONS.is_stack_size_declared */
extern T1 T111f146(T0* C);
/* ET_XACE_OPTIONS.split */
extern T1 T111f145(T0* C);
/* ET_XACE_OPTIONS.is_split_declared */
extern T1 T111f144(T0* C);
/* ET_XACE_OPTIONS.reloads_optimization */
extern T1 T111f141(T0* C);
/* ET_XACE_OPTIONS.is_reloads_optimization_declared */
extern T1 T111f140(T0* C);
/* ET_XACE_OPTIONS.recursive */
extern T1 T111f210(T0* C);
/* ET_XACE_OPTIONS.is_recursive_declared */
extern T1 T111f208(T0* C);
/* ET_XACE_OPTIONS.read_only */
extern T1 T111f214(T0* C);
/* ET_XACE_OPTIONS.is_read_only_declared */
extern T1 T111f212(T0* C);
/* ET_XACE_OPTIONS.portable_code_generation */
extern T1 T111f131(T0* C);
/* ET_XACE_OPTIONS.is_portable_code_generation_declared */
extern T1 T111f130(T0* C);
/* ET_XACE_OPTIONS.no_default_lib */
extern T1 T111f129(T0* C);
/* ET_XACE_OPTIONS.is_no_default_lib_declared */
extern T1 T111f128(T0* C);
/* ET_XACE_OPTIONS.map */
extern T1 T111f113(T0* C);
/* ET_XACE_OPTIONS.is_map_declared */
extern T1 T111f112(T0* C);
/* ET_XACE_OPTIONS.manifest_string_trace */
extern T1 T111f111(T0* C);
/* ET_XACE_OPTIONS.is_manifest_string_trace_declared */
extern T1 T111f110(T0* C);
/* ET_XACE_OPTIONS.linux_fpu_double_precision */
extern T1 T111f109(T0* C);
/* ET_XACE_OPTIONS.is_linux_fpu_double_precision_declared */
extern T1 T111f108(T0* C);
/* ET_XACE_OPTIONS.linker */
extern T0* T111f107(T0* C);
/* ET_XACE_OPTIONS.default_linker */
extern unsigned char ge1250os7158;
extern T0* ge1250ov7158;
extern T0* T111f296(T0* C);
/* ET_XACE_OPTIONS.is_linker_declared */
extern T1 T111f106(T0* C);
/* ET_XACE_OPTIONS.leaves_optimization */
extern T1 T111f101(T0* C);
/* ET_XACE_OPTIONS.is_leaves_optimization_declared */
extern T1 T111f100(T0* C);
/* ET_XACE_OPTIONS.layout_optimization */
extern T1 T111f99(T0* C);
/* ET_XACE_OPTIONS.is_layout_optimization_declared */
extern T1 T111f98(T0* C);
/* ET_XACE_OPTIONS.layout */
extern T0* T111f97(T0* C);
/* ET_XACE_OPTIONS.default_layout */
extern unsigned char ge1250os7153;
extern T0* ge1250ov7153;
extern T0* T111f286(T0* C);
/* ET_XACE_OPTIONS.is_layout_declared */
extern T1 T111f96(T0* C);
/* ET_XACE_OPTIONS.jumps_optimization */
extern T1 T111f95(T0* C);
/* ET_XACE_OPTIONS.is_jumps_optimization_declared */
extern T1 T111f94(T0* C);
/* ET_XACE_OPTIONS.high_memory_compiler */
extern T1 T111f358(T0* C);
/* ET_XACE_OPTIONS.is_high_memory_compiler_declared */
extern T1 T111f354(T0* C);
/* ET_XACE_OPTIONS.heap_size */
extern T6 T111f352(T0* C);
/* ET_XACE_OPTIONS.is_heap_size_declared */
extern T1 T111f350(T0* C);
/* ET_XACE_OPTIONS.gc_info */
extern T1 T111f344(T0* C);
/* ET_XACE_OPTIONS.is_gc_info_declared */
extern T1 T111f342(T0* C);
/* ET_XACE_OPTIONS.garbage_collector */
extern T0* T111f340(T0* C);
/* ET_XACE_OPTIONS.default_garbage_collector */
extern unsigned char ge1250os7143;
extern T0* ge1250ov7143;
extern T0* T111f266(T0* C);
/* ET_XACE_OPTIONS.is_garbage_collector_declared */
extern T1 T111f338(T0* C);
/* ET_XACE_OPTIONS.fst_optimization */
extern T1 T111f336(T0* C);
/* ET_XACE_OPTIONS.is_fst_optimization_declared */
extern T1 T111f334(T0* C);
/* ET_XACE_OPTIONS.fst_expansion_factor */
extern T6 T111f332(T0* C);
/* ET_XACE_OPTIONS.is_fst_expansion_factor_declared */
extern T1 T111f330(T0* C);
/* ET_XACE_OPTIONS.flat_fst_optimization */
extern T1 T111f328(T0* C);
/* ET_XACE_OPTIONS.is_flat_fst_optimization_declared */
extern T1 T111f325(T0* C);
/* ET_XACE_OPTIONS.finalize_option */
extern T1 T111f323(T0* C);
/* ET_XACE_OPTIONS.is_finalize_option_declared */
extern T1 T111f321(T0* C);
/* ET_XACE_OPTIONS.debugger */
extern T1 T111f291(T0* C);
/* ET_XACE_OPTIONS.is_debugger_declared */
extern T1 T111f289(T0* C);
/* ET_XACE_OPTIONS.create_keyword_extension */
extern T1 T111f267(T0* C);
/* ET_XACE_OPTIONS.is_create_keyword_extension_declared */
extern T1 T111f265(T0* C);
/* ET_XACE_OPTIONS.component */
extern T0* T111f259(T0* C);
/* ET_XACE_OPTIONS.default_component */
extern unsigned char ge1250os7119;
extern T0* ge1250ov7119;
extern T0* T111f228(T0* C);
/* ET_XACE_OPTIONS.is_component_declared */
extern T1 T111f257(T0* C);
/* ET_XACE_OPTIONS.clean */
extern T1 T111f251(T0* C);
/* ET_XACE_OPTIONS.is_clean_declared */
extern T1 T111f249(T0* C);
/* ET_XACE_OPTIONS.case_insensitive */
extern T1 T111f243(T0* C);
/* ET_XACE_OPTIONS.is_case_insensitive_declared */
extern T1 T111f241(T0* C);
/* ET_XACE_OPTIONS.callback */
extern T0* T111f239(T0* C);
/* ET_XACE_OPTIONS.default_callback */
extern unsigned char ge1250os7113;
extern T0* ge1250ov7113;
extern T0* T111f218(T0* C);
/* ET_XACE_OPTIONS.is_callback_declared */
extern T1 T111f237(T0* C);
/* ET_XACE_OPTIONS.abstract */
extern T1 T111f206(T0* C);
/* ET_XACE_OPTIONS.is_abstract_declared */
extern T1 T111f204(T0* C);
/* ET_XACE_XACE_GENERATOR.print_indentation */
extern void T43f24(T0* C, T6 a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.print_quote_escaped_string */
extern void T43f23(T0* C, T0* a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.quot_entity */
extern T0* T43f8(T0* C);
/* ET_XACE_XACE_GENERATOR.print_escaped_string */
extern void T43f29(T0* C, T0* a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.print_escaped_character */
extern void T43f31(T0* C, T6 a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.amp_entity */
extern T0* T43f16(T0* C);
/* ET_XACE_XACE_GENERATOR.gt_entity */
extern T0* T43f14(T0* C);
/* ET_XACE_XACE_GENERATOR.lt_entity */
extern T0* T43f12(T0* C);
/* ET_XACE_XACE_GENERATOR.is_escaped */
extern T1 T43f9(T0* C, T6 a1);
/* ET_XACE_ECF_GENERATOR.generate_library */
extern void T45f26(T0* C, T0* a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.print_ecf_library_file */
extern void T45f28(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_CONFIG.merge_externals */
extern void T83f8(T0* C, T0* a1);
/* ET_XACE_ACE_GENERATOR.generate_library */
extern void T44f20(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_GENERATOR.print_precompile_ace_file */
extern void T44f22(T0* C, T0* a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.generate_library */
extern void T43f20(T0* C, T0* a1, T0* a2);
/* ET_XACE_XACE_GENERATOR.print_xace_library_file */
extern void T43f22(T0* C, T0* a1, T0* a2);
/* GEXACE_VALIDATE_COMMAND.execute */
extern void T41f9(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_cannot_read_file_error */
extern void T28f16(T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.make */
extern T0* T86c7(T0* a1);
/* ET_XACE_PARSER.parse_file */
extern void T84f251(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.last_error_extended_description */
extern T0* T101f89(T0* C);
/* XM_EIFFEL_PARSER.string_ */
extern T0* T101f85(T0* C);
/* XM_EIFFEL_PARSER.last_error_description */
extern T0* T101f177(T0* C);
/* INTEGER_32.out */
extern T0* T6f20(T6* C);
/* STRING_8.append_integer */
extern void T17f45(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.safe_error_component */
extern T0* T101f170(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_safe_error_character */
extern T1 T101f109(T0* C, T2 a1);
/* CHARACTER_8.infix ">=" */
extern T1 T2f14(T2* C, T2 a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_parser_error */
extern void T28f18(T0* C, T0* a1);
/* UT_MESSAGE.make */
extern T0* T107c7(T0* a1);
/* XM_TREE_CALLBACKS_PIPE.last_error */
extern T0* T94f8(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_not_xace_file_error */
extern void T28f19(T0* C, T0* a1);
/* ET_XACE_NOT_XACE_FILE_ERROR.make */
extern T0* T108c7(T0* a1);
/* ET_XACE_PARSER.new_library */
extern T0* T84f12(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_CONFIG.mount_libraries */
extern void T83f14(T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.mount_libraries */
extern void T110f9(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.mount_libraries */
extern void T109f16(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTERS.put_last */
extern void T109f6(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].force_last */
extern void T116f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].resize */
extern void T116f13(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER].resize */
extern T0* T240f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_XACE_CLUSTER].aliased_resized_area */
extern T0* T239f3(T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].new_capacity */
extern T6 T116f9(T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].extendible */
extern T1 T116f8(T0* C, T6 a1);
/* ET_XACE_CLUSTER.set_library_prefix */
extern void T117f48(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.set_library_prefix */
extern void T109f13(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_mounted */
extern void T117f50(T0* C, T1 a1);
/* ET_XACE_CLUSTERS.set_mounted */
extern void T109f17(T0* C, T1 a1);
/* ET_XACE_CLUSTERS.make_empty */
extern T0* T109c12(void);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].make */
extern T0* T116c10(T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].new_cursor */
extern T0* T116f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_XACE_CLUSTER].make */
extern T0* T241c3(T0* a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER].make */
extern T0* T240f1(T0* C, T6 a1);
/* TO_SPECIAL [ET_XACE_CLUSTER].make_area */
extern T0* T332c2(T6 a1);
/* SPECIAL [ET_XACE_CLUSTER].make */
extern T0* T239c4(T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER].default_create */
extern T0* T240c3(void);
/* ET_XACE_PARSER.fill_library */
extern void T84f253(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_LIBRARY_CONFIG.set_libraries */
extern void T83f13(T0* C, T0* a1);
/* ET_XACE_LIBRARY_CONFIG.set_clusters */
extern void T83f12(T0* C, T0* a1);
/* ET_XACE_LIBRARY_CONFIG.merge_libraries */
extern void T83f15(T0* C, T0* a1, T0* a2);
/* ET_XACE_MOUNTED_LIBRARIES.merge_libraries */
extern void T110f10(T0* C, T0* a1, T0* a2);
/* ET_XACE_MOUNTED_LIBRARY.set_root */
extern void T119f12(T0* C, T1 a1);
/* ET_XACE_MOUNTED_LIBRARY.cloned_object */
extern T0* T119f8(T0* C);
/* ET_XACE_MOUNTED_LIBRARY.twin */
extern T0* T119f9(T0* C);
/* ET_XACE_MOUNTED_LIBRARY.copy */
extern void T119f13(T0* C, T0* a1);
/* ET_XACE_MOUNTED_LIBRARIES.set_root */
extern void T110f7(T0* C, T1 a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].is_empty */
extern T1 T118f6(T0* C);
/* ET_XACE_CLUSTERS.merge_libraries */
extern void T109f7(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTER.merge_libraries */
extern void T117f43(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTER.set_override */
extern void T117f42(T0* C, T1 a1);
/* ET_XACE_CLUSTERS.cluster_by_name */
extern T0* T109f2(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.string_ */
extern T0* T109f3(T0* C);
/* ET_XACE_PARSER.fill_externals */
extern void T84f256(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_CLUSTER.put_class_option */
extern void T117f34(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].put_last */
extern void T120f9(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_CLASS_OPTIONS].put_right */
extern void T245f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_CLASS_OPTIONS].make */
extern T0* T245c3(T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].is_empty */
extern T1 T120f5(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].make */
extern T0* T120c8(void);
/* ET_XACE_PARSER.new_export */
extern T0* T84f143(T0* C, T0* a1, T0* a2);
/* ET_XACE_OPTIONS.set_export_option */
extern void T111f405(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].is_empty */
extern T1 T123f5(T0* C);
/* ET_XACE_CLASS_OPTIONS.put_feature_option */
extern void T122f5(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].put_last */
extern void T123f9(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_FEATURE_OPTIONS].put_right */
extern void T246f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_FEATURE_OPTIONS].make */
extern T0* T246c3(T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].make */
extern T0* T123c8(void);
/* ET_XACE_PARSER.new_exported_feature */
extern T0* T84f247(T0* C, T0* a1, T0* a2);
/* ET_XACE_AST_FACTORY.new_feature_options */
extern T0* T89f9(T0* C, T0* a1, T0* a2);
/* ET_XACE_FEATURE_OPTIONS.make */
extern T0* T125c3(T0* a1, T0* a2);
/* ET_XACE_PARSER.uc_alias */
extern unsigned char ge1279os2513;
extern T0* ge1279ov2513;
extern T0* T84f249(T0* C);
/* ET_XACE_PARSER.uc_feature */
extern unsigned char ge1279os2514;
extern T0* ge1279ov2514;
extern T0* T84f246(T0* C);
/* ET_XACE_AST_FACTORY.new_class_options */
extern T0* T89f8(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLASS_OPTIONS.make */
extern T0* T122c4(T0* a1, T0* a2);
/* ET_XACE_PARSER.uc_class */
extern unsigned char ge1279os2489;
extern T0* ge1279ov2489;
extern T0* T84f27(T0* C);
/* ET_XACE_PARSER.uc_export */
extern unsigned char ge1279os2512;
extern T0* ge1279ov2512;
extern T0* T84f142(T0* C);
/* ET_XACE_OPTIONS.set_header */
extern void T111f416(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].force_last */
extern void T114f41(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].resize */
extern void T114f52(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].clashes_resize */
extern void T114f60(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].key_storage_resize */
extern void T114f59(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_resize */
extern void T114f58(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].slots_resize */
extern void T114f57(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].new_capacity */
extern T6 T114f19(T0* C, T6 a1);
/* ET_XACE_PARSER.uc_include_dir */
extern unsigned char ge1279os2511;
extern T0* ge1279ov2511;
extern T0* T84f141(T0* C);
/* ET_XACE_OPTIONS.set_link */
extern void T111f427(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].force_last */
extern void T115f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].resize */
extern void T115f20(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].new_capacity */
extern T6 T115f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].extendible */
extern T1 T115f9(T0* C, T6 a1);
/* ET_XACE_PARSER.uc_location */
extern unsigned char ge1279os2498;
extern T0* ge1279ov2498;
extern T0* T84f140(T0* C);
/* ET_XACE_PARSER.uc_link_library */
extern unsigned char ge1279os2515;
extern T0* ge1279ov2515;
extern T0* T84f139(T0* C);
/* ET_XACE_AST_FACTORY.new_options */
extern T0* T89f4(T0* C);
/* ET_XACE_OPTIONS.make */
extern T0* T111c376(void);
/* ET_XACE_PARSER.uc_external */
extern unsigned char ge1279os2502;
extern T0* ge1279ov2502;
extern T0* T84f25(T0* C);
/* ET_XACE_PARSER.new_options */
extern T0* T84f24(T0* C, T0* a1, T0* a2);
/* ET_XACE_PARSER.fill_options */
extern void T84f255(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_PARSER.uc_debug */
extern unsigned char ge1279os2509;
extern T0* ge1279ov2509;
extern T0* T84f138(T0* C);
/* ET_XACE_PARSER.uc_optimize */
extern unsigned char ge1279os2510;
extern T0* ge1279ov2510;
extern T0* T84f137(T0* C);
/* ET_XACE_PARSER.uc_check */
extern unsigned char ge1279os2508;
extern T0* ge1279ov2508;
extern T0* T84f135(T0* C);
/* ET_XACE_PARSER.uc_loop */
extern unsigned char ge1279os2507;
extern T0* ge1279ov2507;
extern T0* T84f132(T0* C);
/* ET_XACE_PARSER.uc_invariant */
extern unsigned char ge1279os2506;
extern T0* ge1279ov2506;
extern T0* T84f130(T0* C);
/* ET_XACE_PARSER.uc_ensure */
extern unsigned char ge1279os2505;
extern T0* ge1279ov2505;
extern T0* T84f128(T0* C);
/* ET_XACE_PARSER.uc_enable */
extern unsigned char ge1279os2503;
extern T0* ge1279ov2503;
extern T0* T84f126(T0* C);
/* ET_XACE_PARSER.uc_require */
extern unsigned char ge1279os2504;
extern T0* ge1279ov2504;
extern T0* T84f125(T0* C);
/* ET_XACE_OPTIONS.set_wedit */
extern void T111f467(T0* C, T1 a1);
/* ET_XACE_OPTIONS.valid_warning */
extern unsigned char ge1250os7012;
extern T0* ge1250ov7012;
extern T0* T111f199(T0* C);
/* DS_HASH_SET [STRING_8].put_last */
extern void T114f39(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].compress */
extern void T114f49(T0* C);
/* DS_HASH_SET [STRING_8].slots_wipe_out */
extern void T114f56(T0* C);
/* DS_HASH_SET [STRING_8].clashes_wipe_out */
extern void T114f55(T0* C);
/* DS_HASH_SET [STRING_8].move_all_cursors */
extern void T114f54(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING_8].key_storage_put */
extern void T114f53(T0* C, T0* a1, T6 a2);
/* ET_XACE_OPTIONS.set_visible_filename */
extern void T111f465(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_version */
extern void T111f464(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_verbose */
extern void T111f463(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_use_full_cluster_name_as_namespace */
extern void T111f462(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_use_cluster_name_as_namespace */
extern void T111f461(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_target */
extern void T111f459(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_target */
extern unsigned char ge1250os7010;
extern T0* ge1250ov7010;
extern T0* T111f194(T0* C);
/* ET_XACE_OPTIONS.set_strip_option */
extern void T111f458(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_storable_filename */
extern void T111f457(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_stack_size */
extern void T111f456(T0* C, T6 a1);
/* ET_XACE_OPTIONS.set_split */
extern void T111f455(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_shared_library_definition */
extern void T111f454(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_reloads_optimization */
extern void T111f453(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_recursive */
extern void T111f452(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_read_only */
extern void T111f451(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_public_key_token */
extern void T111f450(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_prefix_option */
extern void T111f448(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_precompiled */
extern void T111f447(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_portable_code_generation */
extern void T111f446(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_override_cluster */
extern void T111f445(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_old_verbatim_strings */
extern void T111f444(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_no_default_lib */
extern void T111f443(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_namespace */
extern void T111f442(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_multithreaded */
extern void T111f441(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_msil_use_optimized_precompile */
extern void T111f440(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_msil_key_file_name */
extern void T111f439(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_msil_generation_version */
extern void T111f438(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_msil_generation */
extern void T111f437(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_msil_culture */
extern void T111f436(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_msil_clr_version */
extern void T111f435(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_msil_classes_per_module */
extern void T111f434(T0* C, T6 a1);
/* ET_XACE_OPTIONS.set_msil_assembly_compatibility */
extern void T111f433(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_metadata_cache_path */
extern void T111f432(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_map */
extern void T111f431(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_manifest_string_trace */
extern void T111f430(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_linux_fpu_double_precision */
extern void T111f429(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_linker */
extern void T111f428(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_linker */
extern unsigned char ge1250os7009;
extern T0* ge1250ov7009;
extern T0* T111f192(T0* C);
/* ET_XACE_OPTIONS.set_line_generation */
extern void T111f426(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_leaves_optimization */
extern void T111f425(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_layout_optimization */
extern void T111f424(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_layout */
extern void T111f423(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_layout */
extern unsigned char ge1250os7008;
extern T0* ge1250ov7008;
extern T0* T111f190(T0* C);
/* ET_XACE_OPTIONS.set_jumps_optimization */
extern void T111f422(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_inlining_size */
extern void T111f421(T0* C, T6 a1);
/* ET_XACE_OPTIONS.set_inlining */
extern void T111f420(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_inlining */
extern unsigned char ge1250os7007;
extern T0* ge1250ov7007;
extern T0* T111f187(T0* C);
/* ET_XACE_OPTIONS.set_include */
extern void T111f419(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_il_verifiable */
extern void T111f418(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_high_memory_compiler */
extern void T111f417(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_heap_size */
extern void T111f415(T0* C, T6 a1);
/* ET_XACE_OPTIONS.set_gc_info */
extern void T111f414(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_garbage_collector */
extern void T111f413(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_garbage_collector */
extern unsigned char ge1250os7006;
extern T0* ge1250ov7006;
extern T0* T111f186(T0* C);
/* ET_XACE_OPTIONS.set_full_class_checking */
extern void T111f412(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_fst_optimization */
extern void T111f411(T0* C, T1 a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_positive_integer_expected_error */
extern void T28f24(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.make */
extern T0* T215c7(T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_DEFAULT_POSITION.out */
extern T0* T168f5(T0* C);
/* XM_DEFAULT_POSITION.string_ */
extern T0* T168f6(T0* C);
/* ET_XACE_OPTIONS.set_fst_expansion_factor */
extern void T111f410(T0* C, T6 a1);
/* UC_UTF8_STRING.to_integer */
extern T6 T233f28(T0* C);
/* UC_UTF8_STRING.ctoi_convertor */
extern T0* T233f36(T0* C);
/* UC_UTF8_STRING.is_integer */
extern T1 T233f27(T0* C);
/* UC_UTF8_STRING.is_valid_integer_or_natural */
extern T1 T233f35(T0* C, T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.is_integral_integer */
extern T1 T76f12(T0* C);
/* STRING_8.is_integer */
extern T1 T17f16(T0* C);
/* STRING_8.is_valid_integer_or_natural */
extern T1 T17f20(T0* C, T6 a1);
/* ET_XACE_OPTIONS.set_force_32bits */
extern void T111f409(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_flat_fst_optimization */
extern void T111f408(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_finalize_option */
extern void T111f407(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_external_runtime */
extern void T111f406(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_exclude */
extern void T111f404(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_exception_trace */
extern void T111f403(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_enforce_unique_class_names */
extern void T111f402(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_ecf_library */
extern void T111f401(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_dynamic_runtime */
extern void T111f400(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_dotnet_naming_convention */
extern void T111f399(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_document */
extern void T111f398(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_debugger */
extern void T111f397(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_debug_tag */
extern void T111f396(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_dead_code_removal */
extern void T111f394(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_dead_code_removal */
extern unsigned char ge1250os7005;
extern T0* ge1250ov7005;
extern T0* T111f183(T0* C);
/* ET_XACE_OPTIONS.set_c_compiler_options */
extern void T111f393(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_culture */
extern void T111f392(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_create_keyword_extension */
extern void T111f391(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_console_application */
extern void T111f390(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_component */
extern void T111f389(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_cls_compliant */
extern void T111f388(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_clean */
extern void T111f387(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_check_vape */
extern void T111f386(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_case_insensitive */
extern void T111f385(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_callback */
extern void T111f384(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_callback */
extern unsigned char ge1250os7004;
extern T0* ge1250ov7004;
extern T0* T111f175(T0* C);
/* ET_XACE_OPTIONS.set_automatic_backup */
extern void T111f383(T0* C, T1 a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_wrong_attribute_value_error */
extern void T28f23(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.make */
extern T0* T214c7(T0* a1, T0* a2, T0* a3, T0* a4, T0* a5);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.string_ */
extern T0* T214f4(T0* C);
/* ET_XACE_OPTIONS.set_assertion */
extern void T111f382(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_assertion */
extern unsigned char ge1250os7003;
extern T0* ge1250ov7003;
extern T0* T111f172(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_non_empty_attribute_expected_error */
extern void T28f22(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.make */
extern T0* T213c7(T0* a1, T0* a2, T0* a3);
/* ET_XACE_OPTIONS.set_assembly */
extern void T111f381(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_array_optimization */
extern void T111f380(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_arguments */
extern void T111f379(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_address_expression */
extern void T111f378(T0* C, T1 a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_boolean_expected_error */
extern void T28f21(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.make */
extern T0* T212c7(T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_PARSER.is_false */
extern T1 T84f124(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_abstract */
extern void T111f377(T0* C, T1 a1);
/* ET_XACE_PARSER.is_true */
extern T1 T84f123(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].found_item */
extern T6 T150f22(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].item_storage_item */
extern T6 T150f33(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].found */
extern T1 T150f30(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].search */
extern void T150f36(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].search_position */
extern void T150f39(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].clashes_item */
extern T6 T150f24(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].hash_position */
extern T6 T150f25(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].key_storage_item */
extern T0* T150f21(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].slots_item */
extern T6 T150f26(T0* C, T6 a1);
/* ET_XACE_PARSER.option_codes */
extern unsigned char ge1251os4412;
extern T0* ge1251ov4412;
extern T0* T84f30(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].put_new */
extern void T150f38(T0* C, T6 a1, T0* a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].key_storage_put */
extern void T150f45(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].item_storage_put */
extern void T150f44(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].slots_put */
extern void T150f43(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].clashes_put */
extern void T150f42(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].unset_found_item */
extern void T150f41(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].set_key_equality_tester */
extern void T150f37(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [INTEGER_32, STRING_8].internal_set_equality_tester */
extern void T282f6(T0* C, T0* a1);
/* ET_XACE_PARSER.string_equality_tester */
extern T0* T84f14(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_map */
extern T0* T150c35(T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_with_equality_testers */
extern void T150f40(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [INTEGER_32, STRING_8].make */
extern T0* T282c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [INTEGER_32, STRING_8].new_cursor */
extern T0* T282f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [INTEGER_32, STRING_8].make */
extern T0* T360c3(T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].new_cursor */
extern T0* T150f29(T0* C);
/* DS_HASH_TABLE_CURSOR [INTEGER_32, STRING_8].make */
extern T0* T284c3(T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_sparse_container */
extern void T150f46(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_slots */
extern void T150f50(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].special_integer_ */
extern T0* T150f32(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].new_modulus */
extern T6 T150f27(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_clashes */
extern void T150f49(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_key_storage */
extern void T150f48(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_item_storage */
extern void T150f47(T0* C, T6 a1);
/* ET_XACE_PARSER.uc_value */
extern unsigned char ge1279os2494;
extern T0* ge1279ov2494;
extern T0* T84f29(T0* C);
/* ET_XACE_PARSER.uc_option */
extern unsigned char ge1279os2501;
extern T0* ge1279ov2501;
extern T0* T84f23(T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.put_last */
extern void T110f6(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].force_last */
extern void T118f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].resize */
extern void T118f13(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY].resize */
extern T0* T243f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].aliased_resized_area */
extern T0* T242f3(T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].new_capacity */
extern T6 T118f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].extendible */
extern T1 T118f9(T0* C, T6 a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_multiple_library_prefix_error */
extern void T28f20(T0* C, T0* a1, T0* a2);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.make */
extern T0* T211c7(T0* a1, T0* a2);
/* ET_XACE_MOUNTED_LIBRARY.same_library_prefix */
extern T1 T119f7(T0* C, T0* a1);
/* ET_XACE_MOUNTED_LIBRARY.string_ */
extern T0* T119f6(T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.item */
extern T0* T110f2(T0* C, T0* a1);
/* ET_XACE_MOUNTED_LIBRARIES.string_ */
extern T0* T110f3(T0* C);
/* ET_XACE_AST_FACTORY.new_mounted_libraries */
extern T0* T89f3(T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.make_empty */
extern T0* T110c5(void);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].make */
extern T0* T118c11(T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].new_cursor */
extern T0* T118f8(T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_XACE_MOUNTED_LIBRARY].make */
extern T0* T244c3(T0* a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY].make */
extern T0* T243f1(T0* C, T6 a1);
/* TO_SPECIAL [ET_XACE_MOUNTED_LIBRARY].make_area */
extern T0* T333c2(T6 a1);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].make */
extern T0* T242c4(T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY].default_create */
extern T0* T243c3(void);
/* ET_XACE_PARSER.new_mount */
extern T0* T84f22(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_MOUNTED_LIBRARY.set_library_prefix */
extern void T119f11(T0* C, T0* a1);
/* ET_XACE_AST_FACTORY.new_mounted_library */
extern T0* T89f7(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_MOUNTED_LIBRARY.make */
extern T0* T119c10(T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_CONFIG_PARSER.parse_library */
extern void T82f255(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_CONFIG_PARSER.fill_library */
extern void T82f252(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_LIBRARY_CONFIG_PARSER.fill_externals */
extern void T82f254(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_LIBRARY_CONFIG_PARSER.new_export */
extern T0* T82f140(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_CONFIG_PARSER.new_exported_feature */
extern T0* T82f243(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_alias */
extern T0* T82f245(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_feature */
extern T0* T82f242(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_class */
extern T0* T82f143(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_export */
extern T0* T82f139(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_include_dir */
extern T0* T82f138(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_location */
extern T0* T82f137(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_link_library */
extern T0* T82f136(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_external */
extern T0* T82f25(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.new_options */
extern T0* T82f24(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_CONFIG_PARSER.fill_options */
extern void T82f253(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_debug */
extern T0* T82f135(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_optimize */
extern T0* T82f134(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_check */
extern T0* T82f132(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_loop */
extern T0* T82f129(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_invariant */
extern T0* T82f127(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_ensure */
extern T0* T82f125(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_enable */
extern T0* T82f123(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_require */
extern T0* T82f122(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.is_false */
extern T1 T82f121(T0* C, T0* a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.is_true */
extern T1 T82f120(T0* C, T0* a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.option_codes */
extern T0* T82f27(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.string_equality_tester */
extern T0* T82f13(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_value */
extern T0* T82f26(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_option */
extern T0* T82f23(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.new_mount */
extern T0* T82f22(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_CONFIG_PARSER.execution_environment */
extern T0* T82f145(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_mount */
extern unsigned char ge1279os2497;
extern T0* ge1279ov2497;
extern T0* T82f21(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_prefix */
extern unsigned char ge1279os2499;
extern T0* ge1279ov2499;
extern T0* T82f20(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.new_cluster */
extern T0* T82f19(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_CLUSTER.set_libraries */
extern void T117f40(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_subclusters */
extern void T117f39(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.set_parent */
extern void T109f14(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_parent */
extern void T117f49(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_dependant_constraint */
extern void T117f52(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.set_dependant_constraint */
extern void T109f19(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_provider_constraint */
extern void T117f51(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.set_provider_constraint */
extern void T109f18(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_options */
extern void T117f38(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_read_only */
extern void T117f37(T0* C, T1 a1);
/* ET_XACE_CLUSTER.set_recursive */
extern void T117f36(T0* C, T1 a1);
/* ET_XACE_CLUSTER.set_abstract */
extern void T117f35(T0* C, T1 a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.new_class */
extern T0* T82f144(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_CONFIG_PARSER.new_feature */
extern T0* T82f244(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTER.set_cluster_prefix */
extern void T117f33(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_relative */
extern void T117f32(T0* C, T1 a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_relative */
extern unsigned char ge1279os2496;
extern T0* ge1279ov2496;
extern T0* T82f142(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_attribute_obsoleted_by_element_warning */
extern void T28f35(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_warning */
extern void T28f33(T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_warning_message */
extern void T28f34(T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_line */
extern void T60f4(T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_new_line */
extern void T60f6(T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_string */
extern void T60f5(T0* C, T0* a1);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.make */
extern T0* T323c7(T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_abstract */
extern unsigned char ge1279os2495;
extern T0* ge1279ov2495;
extern T0* T82f141(T0* C);
/* ET_XACE_AST_FACTORY.new_cluster */
extern T0* T89f6(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_CLUSTER.make */
extern T0* T117c31(T0* a1, T0* a2, T0* a3);
/* ET_XACE_CLUSTER.set_overridden_constraint_enabled */
extern void T117f41(T0* C, T1 a1);
/* ET_XACE_CLUSTERS.set_overridden_constraint_enabled */
extern void T109f15(T0* C, T1 a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_cluster */
extern unsigned char ge1279os2492;
extern T0* ge1279ov2492;
extern T0* T82f17(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.string_ */
extern T0* T82f16(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.uc_name */
extern unsigned char ge1279os2493;
extern T0* ge1279ov2493;
extern T0* T82f15(T0* C);
/* ET_XACE_PARSER.execution_environment */
extern T0* T84f149(T0* C);
/* UC_UTF8_STRING.has_substring */
extern T1 T233f50(T0* C, T0* a1);
/* STRING_8.has_substring */
extern T1 T17f30(T0* C, T0* a1);
/* STRING_8.substring_index */
extern T6 T17f32(T0* C, T0* a1, T6 a2);
/* STRING_SEARCHER.substring_index */
extern T6 T447f2(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* STRING_SEARCHER.substring_index_with_deltas */
extern T6 T447f3(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* STRING_SEARCHER.internal_initialize_deltas */
extern void T447f6(T0* C, T0* a1, T6 a2, T0* a3);
/* SPECIAL [INTEGER_32].fill_with */
extern void T51f10(T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.string_searcher */
extern unsigned char ge2265os1265;
extern T0* ge2265ov1265;
extern T0* T17f33(T0* C);
/* STRING_SEARCHER.make */
extern T0* T447c5(void);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].force_new */
extern void T99f53(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].key_storage_put */
extern void T99f59(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].item_storage_put */
extern void T99f58(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].slots_put */
extern void T99f57(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].clashes_put */
extern void T99f56(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].slots_item */
extern T6 T99f30(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].hash_position */
extern T6 T99f29(T0* C, T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].clashes_item */
extern T6 T99f28(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].resize */
extern void T99f55(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].clashes_resize */
extern void T99f63(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].special_integer_ */
extern T0* T99f22(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].key_storage_resize */
extern void T99f62(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].item_storage_resize */
extern void T99f61(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY_CONFIG].resize */
extern T0* T166f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_XACE_LIBRARY_CONFIG].aliased_resized_area */
extern T0* T165f3(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].key_storage_item */
extern T0* T99f33(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].slots_resize */
extern void T99f60(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].new_modulus */
extern T6 T99f31(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].new_capacity */
extern T6 T99f26(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].unset_found_item */
extern void T99f42(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].found_item */
extern T0* T99f24(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].item_storage_item */
extern T0* T99f25(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].found */
extern T1 T99f23(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].search */
extern void T99f52(T0* C, T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].search_position */
extern void T99f54(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_mount */
extern T0* T84f21(T0* C);
/* ET_XACE_LIBRARY_CONFIG.set_library_prefix */
extern void T83f11(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_prefix */
extern T0* T84f20(T0* C);
/* ET_XACE_AST_FACTORY.new_clusters */
extern T0* T89f2(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.make */
extern T0* T109c5(T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].put_last */
extern void T116f11(T0* C, T0* a1);
/* ET_XACE_LIBRARY_CONFIG.set_options */
extern void T83f10(T0* C, T0* a1);
/* ET_XACE_PARSER.new_cluster */
extern T0* T84f19(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_PARSER.new_class */
extern T0* T84f146(T0* C, T0* a1, T0* a2);
/* ET_XACE_PARSER.new_feature */
extern T0* T84f248(T0* C, T0* a1, T0* a2);
/* ET_XACE_PARSER.uc_relative */
extern T0* T84f145(T0* C);
/* ET_XACE_PARSER.uc_abstract */
extern T0* T84f144(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_element_obsoleted_by_element_warning */
extern void T28f25(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.make */
extern T0* T216c7(T0* a1, T0* a2, T0* a3);
/* XM_POSITION_TABLE.item */
extern T0* T92f2(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].forth */
extern void T227f10(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_forth */
extern void T228f11(T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].add_traversing_cursor */
extern void T228f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set_next_cursor */
extern void T227f13(T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].remove_traversing_cursor */
extern void T228f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set */
extern void T227f11(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].go_after */
extern void T227f9(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_go_after */
extern void T228f10(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set_after */
extern void T227f12(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_off */
extern T1 T228f6(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].item */
extern T0* T227f6(T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].start */
extern void T227f8(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_start */
extern void T228f9(T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].new_cursor */
extern T0* T228f7(T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T227c7(T0* a1);
/* ET_XACE_LIBRARY_CONFIG.set_name */
extern void T83f9(T0* C, T0* a1);
/* XM_ELEMENT.attribute_by_name */
extern T0* T91f18(T0* C, T0* a1);
/* XM_ELEMENT.attribute_same_name */
extern T1 T91f9(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.same_string */
extern T1 T91f11(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.string_equality_tester */
extern T0* T91f13(T0* C);
/* XM_NODE_TYPER.is_attribute */
extern T1 T414f8(T0* C);
/* XM_ELEMENT.has_attribute_by_name */
extern T1 T91f15(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_name */
extern T0* T84f17(T0* C);
/* ET_TOKEN_CONSTANTS.empty_system */
extern unsigned char ge957os8443;
extern T0* ge957ov8443;
extern T0* T142f1(T0* C);
/* ET_SYSTEM.make */
extern T0* T143c123(void);
/* ET_AST_NULL_PROCESSOR.make */
extern T0* T252c1(void);
/* ET_SYSTEM.set_default_class_mapping */
extern void T143f128(T0* C);
/* ET_TOKEN_CONSTANTS.wide_character_ref_class_name */
extern unsigned char ge957os7865;
extern T0* ge957ov7865;
extern T0* T142f65(T0* C);
/* ET_IDENTIFIER.make */
extern T0* T345c7(T0* a1);
/* ET_IDENTIFIER.make_with_hash_code */
extern void T345f8(T0* C, T0* a1, T6 a2);
/* ET_IDENTIFIER.make_leaf */
extern void T345f9(T0* C);
/* ET_IDENTIFIER.new_hash_code */
extern T6 T345f5(T0* C, T0* a1);
/* CHARACTER_8.upper */
extern T2 T2f20(T2* C);
/* CHARACTER_8.is_lower */
extern T1 T2f21(T2* C);
/* ET_TOKEN_CONSTANTS.wide_character_class_name */
extern unsigned char ge957os7844;
extern T0* ge957ov7844;
extern T0* T142f64(T0* C);
/* ET_TOKEN_CONSTANTS.string_class_name */
extern unsigned char ge957os7836;
extern T0* ge957ov7836;
extern T0* T142f63(T0* C);
/* ET_TOKEN_CONSTANTS.real_ref_class_name */
extern unsigned char ge957os7862;
extern T0* ge957ov7862;
extern T0* T142f62(T0* C);
/* ET_TOKEN_CONSTANTS.real_class_name */
extern unsigned char ge957os7831;
extern T0* ge957ov7831;
extern T0* T142f61(T0* C);
/* ET_TOKEN_CONSTANTS.natural_ref_class_name */
extern unsigned char ge957os7856;
extern T0* ge957ov7856;
extern T0* T142f60(T0* C);
/* ET_TOKEN_CONSTANTS.natural_class_name */
extern unsigned char ge957os7821;
extern T0* ge957ov7821;
extern T0* T142f59(T0* C);
/* ET_TOKEN_CONSTANTS.integer_ref_class_name */
extern unsigned char ge957os7851;
extern T0* ge957ov7851;
extern T0* T142f58(T0* C);
/* ET_TOKEN_CONSTANTS.integer_class_name */
extern unsigned char ge957os7814;
extern T0* ge957ov7814;
extern T0* T142f57(T0* C);
/* ET_TOKEN_CONSTANTS.double_ref_class_name */
extern unsigned char ge957os7850;
extern T0* ge957ov7850;
extern T0* T142f56(T0* C);
/* ET_TOKEN_CONSTANTS.double_class_name */
extern unsigned char ge957os7811;
extern T0* ge957ov7811;
extern T0* T142f55(T0* C);
/* ET_TOKEN_CONSTANTS.character_ref_class_name */
extern unsigned char ge957os7847;
extern T0* ge957ov7847;
extern T0* T142f54(T0* C);
/* ET_CLASS_TYPE.make */
extern T0* T266c5(T0* a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].force_last */
extern void T257f36(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].key_storage_put */
extern void T257f49(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].slots_put */
extern void T257f48(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].clashes_put */
extern void T257f47(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].slots_item */
extern T6 T257f22(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].hash_position */
extern T6 T257f30(T0* C, T0* a1);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].resize */
extern void T257f46(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].clashes_resize */
extern void T257f54(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].special_integer_ */
extern T0* T257f28(T0* C);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].key_storage_resize */
extern void T257f53(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_CLASS_NAME].resize */
extern T0* T344f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_CLASS_NAME].aliased_resized_area */
extern T0* T342f2(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].item_storage_resize */
extern void T257f52(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_CLASS].resize */
extern T0* T343f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_CLASS].aliased_resized_area */
extern T0* T341f2(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].key_storage_item */
extern T0* T257f23(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].clashes_item */
extern T6 T257f24(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].slots_resize */
extern void T257f51(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].new_modulus */
extern T6 T257f25(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].new_capacity */
extern T6 T257f29(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].item_storage_put */
extern void T257f45(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].search_position */
extern void T257f44(T0* C, T0* a1);
/* ET_CLASS_NAME_TESTER.test */
extern T1 T258f1(T0* C, T0* a1, T0* a2);
/* ET_IDENTIFIER.same_class_name */
extern T1 T345f6(T0* C, T0* a1);
/* ET_IDENTIFIER.string_ */
extern T0* T345f4(T0* C);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].unset_found_item */
extern void T257f39(T0* C);
/* ET_TOKEN_CONSTANTS.character_class_name */
extern unsigned char ge957os7807;
extern T0* ge957ov7807;
extern T0* T142f53(T0* C);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].wipe_out */
extern void T257f35(T0* C);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].slots_wipe_out */
extern void T257f43(T0* C);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].clashes_wipe_out */
extern void T257f42(T0* C);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].key_storage_wipe_out */
extern void T257f41(T0* C);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].item_storage_wipe_out */
extern void T257f40(T0* C);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].move_all_cursors_after */
extern void T257f38(T0* C);
/* DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME].set_next_cursor */
extern void T340f6(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME].set_position */
extern void T340f5(T0* C, T6 a1);
/* ET_SYSTEM.set_basic_classes */
extern void T143f127(T0* C);
/* ET_TOKEN_CONSTANTS.typed_pointer_class_name */
extern unsigned char ge957os7843;
extern T0* ge957ov7843;
extern T0* T142f52(T0* C);
/* ET_TOKEN_CONSTANTS.type_class_name */
extern unsigned char ge957os7842;
extern T0* ge957ov7842;
extern T0* T142f51(T0* C);
/* ET_TUPLE_TYPE.make */
extern T0* T263c6(T0* a1, T0* a2, T0* a3);
/* ET_TOKEN_CONSTANTS.tuple_keyword */
extern unsigned char ge957os8092;
extern T0* ge957ov8092;
extern T0* T142f128(T0* C);
/* ET_TUPLE_TYPE.tokens */
extern unsigned char ge952os4442;
extern T0* ge952ov4442;
extern T0* T263f5(T0* C);
/* ET_TOKEN_CONSTANTS.default_create */
extern T0* T142c149(void);
/* ET_TOKEN_CONSTANTS.tuple_class_name */
extern unsigned char ge957os7841;
extern T0* ge957ov7841;
extern T0* T142f50(T0* C);
/* ET_TOKEN_CONSTANTS.system_string_class_name */
extern unsigned char ge957os7840;
extern T0* ge957ov7840;
extern T0* T142f49(T0* C);
/* ET_SYSTEM.set_system_object_class */
extern void T143f148(T0* C, T0* a1);
/* ET_PARENT_LIST.put_first */
extern void T273f7(T0* C, T0* a1);
/* ET_PARENT_LIST.make_with_capacity */
extern T0* T273c6(T6 a1);
/* ET_PARENT_LIST.make_with_capacity */
extern void T273f6p1(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_PARENT_ITEM].make */
extern T0* T354f1(T0* C, T6 a1);
/* TO_SPECIAL [ET_PARENT_ITEM].make_area */
extern T0* T404c2(T6 a1);
/* SPECIAL [ET_PARENT_ITEM].make */
extern T0* T353c1(T6 a1);
/* ET_PARENT_LIST.fixed_array */
extern unsigned char ge735os12057;
extern T0* ge735ov12057;
extern T0* T273f5(T0* C);
/* KL_SPECIAL_ROUTINES [ET_PARENT_ITEM].default_create */
extern T0* T354c2(void);
/* ET_TOKEN_CONSTANTS.inherit_keyword */
extern unsigned char ge957os8068;
extern T0* ge957ov8068;
extern T0* T142f132(T0* C);
/* ET_KEYWORD.make_inherit */
extern T0* T351c6(void);
/* ET_KEYWORD.make_token */
extern void T351f7(T0* C, T0* a1);
/* ET_KEYWORD.make_leaf */
extern void T351f8(T0* C);
/* ET_KEYWORD.tokens */
extern T0* T351f4(T0* C);
/* ET_PARENT_LIST.tokens */
extern T0* T273f4(T0* C);
/* ET_PARENT.make */
extern T0* T268c11(T0* a1, T0* a2, T0* a3, T0* a4, T0* a5, T0* a6);
/* ET_TOKEN_CONSTANTS.end_keyword */
extern unsigned char ge957os8057;
extern T0* ge957ov8057;
extern T0* T142f131(T0* C);
/* ET_KEYWORD.make_end */
extern T0* T351c5(void);
/* ET_PARENT.tokens */
extern T0* T268f10(T0* C);
/* ET_PARENT.has_feature_adaptation */
extern T1 T268f9(T0* C);
/* ET_CLASS_TYPE.actual_parameters */
extern T0* T266f4(T0* C);
/* ET_TOKEN_CONSTANTS.system_object_class_name */
extern unsigned char ge957os7839;
extern T0* ge957ov7839;
extern T0* T142f48(T0* C);
/* ET_SYSTEM.set_string_32_class */
extern void T143f147(T0* C, T0* a1);
/* ET_BUILTIN_CONVERT_FEATURE.make */
extern T0* T279c4(T0* a1);
/* ET_BRACED_TYPE_LIST.make */
extern T0* T359c6(void);
/* ET_BRACED_TYPE_LIST.make */
extern void T359f6p1(T0* C);
/* ET_TOKEN_CONSTANTS.right_brace_symbol */
extern unsigned char ge957os8032;
extern T0* ge957ov8032;
extern T0* T142f138(T0* C);
/* ET_SYMBOL.make_right_brace */
extern T0* T346c7(void);
/* ET_SYMBOL.make_leaf */
extern void T346f5(T0* C);
/* ET_SYMBOL.tokens */
extern T0* T346f3(T0* C);
/* ET_TOKEN_CONSTANTS.left_brace_symbol */
extern unsigned char ge957os8027;
extern T0* ge957ov8027;
extern T0* T142f137(T0* C);
/* ET_SYMBOL.make_left_brace */
extern T0* T346c6(void);
/* ET_BRACED_TYPE_LIST.tokens */
extern T0* T359f5(T0* C);
/* ET_TOKEN_CONSTANTS.string_32_class_name */
extern unsigned char ge957os7838;
extern T0* ge957ov7838;
extern T0* T142f47(T0* C);
/* ET_SYSTEM.set_string_8_class */
extern void T143f146(T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.string_8_class_name */
extern unsigned char ge957os7837;
extern T0* ge957ov7837;
extern T0* T142f46(T0* C);
/* ET_TOKEN_CONSTANTS.special_class_name */
extern unsigned char ge957os7835;
extern T0* ge957ov7835;
extern T0* T142f45(T0* C);
/* ET_TOKEN_CONSTANTS.routine_class_name */
extern unsigned char ge957os7834;
extern T0* ge957ov7834;
extern T0* T142f44(T0* C);
/* ET_TOKEN_CONSTANTS.real_64_ref_class_name */
extern unsigned char ge957os7864;
extern T0* ge957ov7864;
extern T0* T142f43(T0* C);
/* ET_SYSTEM.set_real_64_class */
extern void T143f145(T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.real_64_class_name */
extern unsigned char ge957os7833;
extern T0* ge957ov7833;
extern T0* T142f42(T0* C);
/* ET_TOKEN_CONSTANTS.real_32_ref_class_name */
extern unsigned char ge957os7863;
extern T0* ge957ov7863;
extern T0* T142f41(T0* C);
/* ET_SYSTEM.set_real_32_class */
extern void T143f144(T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.real_32_class_name */
extern unsigned char ge957os7832;
extern T0* ge957ov7832;
extern T0* T142f40(T0* C);
/* ET_TOKEN_CONSTANTS.procedure_class_name */
extern unsigned char ge957os7830;
extern T0* ge957ov7830;
extern T0* T142f39(T0* C);
/* ET_TOKEN_CONSTANTS.predicate_class_name */
extern unsigned char ge957os7829;
extern T0* ge957ov7829;
extern T0* T142f38(T0* C);
/* ET_TOKEN_CONSTANTS.pointer_ref_class_name */
extern unsigned char ge957os7861;
extern T0* ge957ov7861;
extern T0* T142f37(T0* C);
/* ET_TOKEN_CONSTANTS.pointer_class_name */
extern unsigned char ge957os7828;
extern T0* ge957ov7828;
extern T0* T142f36(T0* C);
/* ET_TOKEN_CONSTANTS.platform_class_name */
extern unsigned char ge957os7827;
extern T0* ge957ov7827;
extern T0* T142f35(T0* C);
/* ET_SYSTEM.set_none_class */
extern void T143f143(T0* C, T0* a1);
/* ET_GENERIC_CLASS_TYPE.make */
extern T0* T278c5(T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_ACTUAL_PARAMETER_LIST.put_first */
extern void T265f8(T0* C, T0* a1);
/* ET_ACTUAL_PARAMETER_LIST.make_with_capacity */
extern T0* T265c7(T6 a1);
/* ET_ACTUAL_PARAMETER_LIST.make_with_capacity */
extern void T265f7p1(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_ACTUAL_PARAMETER_ITEM].make */
extern T0* T350f1(T0* C, T6 a1);
/* TO_SPECIAL [ET_ACTUAL_PARAMETER_ITEM].make_area */
extern T0* T403c2(T6 a1);
/* SPECIAL [ET_ACTUAL_PARAMETER_ITEM].make */
extern T0* T349c1(T6 a1);
/* ET_ACTUAL_PARAMETER_LIST.fixed_array */
extern unsigned char ge1010os12057;
extern T0* ge1010ov12057;
extern T0* T265f6(T0* C);
/* KL_SPECIAL_ROUTINES [ET_ACTUAL_PARAMETER_ITEM].default_create */
extern T0* T350c2(void);
/* ET_TOKEN_CONSTANTS.right_bracket_symbol */
extern unsigned char ge957os8033;
extern T0* ge957ov8033;
extern T0* T142f130(T0* C);
/* ET_SYMBOL.make_right_bracket */
extern T0* T346c4(void);
/* ET_TOKEN_CONSTANTS.left_bracket_symbol */
extern unsigned char ge957os8028;
extern T0* ge957ov8028;
extern T0* T142f129(T0* C);
/* ET_BRACKET_SYMBOL.make */
extern T0* T347c4(void);
/* ET_BRACKET_SYMBOL.make_leaf */
extern void T347f5(T0* C);
/* ET_BRACKET_SYMBOL.tokens */
extern T0* T347f3(T0* C);
/* ET_ACTUAL_PARAMETER_LIST.tokens */
extern T0* T265f5(T0* C);
/* ET_CLASS.set_group */
extern void T260f21(T0* C, T0* a1);
/* ET_NONE_GROUP.make */
extern T0* T261c3(T0* a1);
/* ET_TOKEN_CONSTANTS.none_class_name */
extern unsigned char ge957os7826;
extern T0* ge957ov7826;
extern T0* T142f34(T0* C);
/* ET_TOKEN_CONSTANTS.natural_64_ref_class_name */
extern unsigned char ge957os7860;
extern T0* ge957ov7860;
extern T0* T142f33(T0* C);
/* ET_SYSTEM.set_natural_64_class */
extern void T143f142(T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.natural_64_class_name */
extern unsigned char ge957os7825;
extern T0* ge957ov7825;
extern T0* T142f32(T0* C);
/* ET_TOKEN_CONSTANTS.natural_32_ref_class_name */
extern unsigned char ge957os7859;
extern T0* ge957ov7859;
extern T0* T142f31(T0* C);
/* ET_SYSTEM.set_natural_32_class */
extern void T143f141(T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.natural_32_class_name */
extern unsigned char ge957os7824;
extern T0* ge957ov7824;
extern T0* T142f30(T0* C);
/* ET_TOKEN_CONSTANTS.natural_16_ref_class_name */
extern unsigned char ge957os7858;
extern T0* ge957ov7858;
extern T0* T142f29(T0* C);
/* ET_SYSTEM.set_natural_16_class */
extern void T143f140(T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.natural_16_class_name */
extern unsigned char ge957os7823;
extern T0* ge957ov7823;
extern T0* T142f28(T0* C);
/* ET_TOKEN_CONSTANTS.natural_8_ref_class_name */
extern unsigned char ge957os7857;
extern T0* ge957ov7857;
extern T0* T142f27(T0* C);
/* ET_SYSTEM.set_natural_8_class */
extern void T143f139(T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.natural_8_class_name */
extern unsigned char ge957os7822;
extern T0* ge957ov7822;
extern T0* T142f26(T0* C);
/* ET_TOKEN_CONSTANTS.native_array_class_name */
extern unsigned char ge957os7820;
extern T0* ge957ov7820;
extern T0* T142f25(T0* C);
/* ET_TOKEN_CONSTANTS.integer_64_ref_class_name */
extern unsigned char ge957os7855;
extern T0* ge957ov7855;
extern T0* T142f24(T0* C);
/* ET_SYSTEM.set_integer_64_class */
extern void T143f138(T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.integer_64_class_name */
extern unsigned char ge957os7818;
extern T0* ge957ov7818;
extern T0* T142f23(T0* C);
/* ET_TOKEN_CONSTANTS.integer_32_ref_class_name */
extern unsigned char ge957os7854;
extern T0* ge957ov7854;
extern T0* T142f22(T0* C);
/* ET_SYSTEM.set_integer_32_class */
extern void T143f137(T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.integer_32_class_name */
extern unsigned char ge957os7817;
extern T0* ge957ov7817;
extern T0* T142f21(T0* C);
/* ET_TOKEN_CONSTANTS.integer_16_ref_class_name */
extern unsigned char ge957os7853;
extern T0* ge957ov7853;
extern T0* T142f20(T0* C);
/* ET_SYSTEM.set_integer_16_class */
extern void T143f136(T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.integer_16_class_name */
extern unsigned char ge957os7816;
extern T0* ge957ov7816;
extern T0* T142f19(T0* C);
/* ET_TOKEN_CONSTANTS.integer_8_ref_class_name */
extern unsigned char ge957os7852;
extern T0* ge957ov7852;
extern T0* T142f18(T0* C);
/* ET_SYSTEM.set_integer_8_class */
extern void T143f135(T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.integer_8_class_name */
extern unsigned char ge957os7815;
extern T0* ge957ov7815;
extern T0* T142f17(T0* C);
/* ET_TOKEN_CONSTANTS.identified_routines_class_name */
extern unsigned char ge957os7813;
extern T0* ge957ov7813;
extern T0* T142f16(T0* C);
/* ET_TOKEN_CONSTANTS.function_class_name */
extern unsigned char ge957os7812;
extern T0* ge957ov7812;
extern T0* T142f15(T0* C);
/* ET_TOKEN_CONSTANTS.disposable_class_name */
extern unsigned char ge957os7810;
extern T0* ge957ov7810;
extern T0* T142f14(T0* C);
/* ET_TOKEN_CONSTANTS.character_32_ref_class_name */
extern unsigned char ge957os7849;
extern T0* ge957ov7849;
extern T0* T142f13(T0* C);
/* ET_SYSTEM.set_character_32_class */
extern void T143f134(T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.character_32_class_name */
extern unsigned char ge957os7809;
extern T0* ge957ov7809;
extern T0* T142f12(T0* C);
/* ET_TOKEN_CONSTANTS.character_8_ref_class_name */
extern unsigned char ge957os7848;
extern T0* ge957ov7848;
extern T0* T142f11(T0* C);
/* ET_SYSTEM.set_character_8_class */
extern void T143f133(T0* C, T0* a1);
/* ET_TOKEN_CONSTANTS.character_8_class_name */
extern unsigned char ge957os7808;
extern T0* ge957ov7808;
extern T0* T142f10(T0* C);
/* ET_TOKEN_CONSTANTS.boolean_ref_class_name */
extern unsigned char ge957os7846;
extern T0* ge957ov7846;
extern T0* T142f9(T0* C);
/* ET_TOKEN_CONSTANTS.boolean_class_name */
extern unsigned char ge957os7806;
extern T0* ge957ov7806;
extern T0* T142f8(T0* C);
/* ET_CLASS.set_basic */
extern void T260f20(T0* C, T1 a1);
/* ET_TOKEN_CONSTANTS.bit_class_name */
extern unsigned char ge957os7805;
extern T0* ge957ov7805;
extern T0* T142f7(T0* C);
/* ET_TOKEN_CONSTANTS.arguments_class_name */
extern unsigned char ge957os7803;
extern T0* ge957ov7803;
extern T0* T142f6(T0* C);
/* ET_SYSTEM.set_any_class */
extern void T143f132(T0* C, T0* a1);
/* ET_CLIENT_LIST.put_first */
extern void T275f5(T0* C, T0* a1);
/* ET_CLIENT.make */
extern T0* T267c3(T0* a1, T0* a2);
/* ET_CLIENT_LIST.make_with_capacity */
extern T0* T275c4(T6 a1);
/* KL_SPECIAL_ROUTINES [ET_CLIENT_ITEM].make */
extern T0* T356f1(T0* C, T6 a1);
/* TO_SPECIAL [ET_CLIENT_ITEM].make_area */
extern T0* T405c2(T6 a1);
/* SPECIAL [ET_CLIENT_ITEM].make */
extern T0* T355c1(T6 a1);
/* ET_CLIENT_LIST.fixed_array */
extern unsigned char ge702os12057;
extern T0* ge702ov12057;
extern T0* T275f3(T0* C);
/* KL_SPECIAL_ROUTINES [ET_CLIENT_ITEM].default_create */
extern T0* T356c2(void);
/* ET_TOKEN_CONSTANTS.any_class_name */
extern unsigned char ge957os7802;
extern T0* ge957ov7802;
extern T0* T142f5(T0* C);
/* ET_CLASS.set_in_system */
extern void T260f19(T0* C, T1 a1);
/* ET_SYSTEM.register_class */
extern void T143f131(T0* C, T0* a1);
/* ET_CLASS.set_id */
extern void T260f18(T0* C, T6 a1);
/* ET_AST_FACTORY.new_class */
extern T0* T251f1(T0* C, T0* a1);
/* ET_CLASS.make */
extern T0* T260c17(T0* a1);
/* ET_TOKEN_CONSTANTS.class_keyword */
extern unsigned char ge957os8047;
extern T0* ge957ov8047;
extern T0* T142f136(T0* C);
/* ET_KEYWORD.make_class */
extern T0* T351c9(void);
/* ET_TOKEN_CONSTANTS.empty_procedures */
extern unsigned char ge957os8440;
extern T0* ge957ov8440;
extern T0* T142f135(T0* C);
/* ET_PROCEDURE_LIST.make_with_capacity */
extern T0* T383c4(T6 a1);
/* KL_SPECIAL_ROUTINES [ET_PROCEDURE].make */
extern T0* T439f1(T0* C, T6 a1);
/* TO_SPECIAL [ET_PROCEDURE].make_area */
extern T0* T446c2(T6 a1);
/* SPECIAL [ET_PROCEDURE].make */
extern T0* T438c1(T6 a1);
/* ET_PROCEDURE_LIST.fixed_array */
extern unsigned char ge869os12057;
extern T0* ge869ov12057;
extern T0* T383f3(T0* C);
/* KL_SPECIAL_ROUTINES [ET_PROCEDURE].default_create */
extern T0* T439c2(void);
/* ET_TOKEN_CONSTANTS.empty_queries */
extern unsigned char ge957os8439;
extern T0* ge957ov8439;
extern T0* T142f134(T0* C);
/* ET_QUERY_LIST.make_with_capacity */
extern T0* T382c4(T6 a1);
/* KL_SPECIAL_ROUTINES [ET_QUERY].make */
extern T0* T436f1(T0* C, T6 a1);
/* TO_SPECIAL [ET_QUERY].make_area */
extern T0* T445c2(T6 a1);
/* SPECIAL [ET_QUERY].make */
extern T0* T435c1(T6 a1);
/* ET_QUERY_LIST.fixed_array */
extern unsigned char ge871os12057;
extern T0* ge871ov12057;
extern T0* T382f3(T0* C);
/* KL_SPECIAL_ROUTINES [ET_QUERY].default_create */
extern T0* T436c2(void);
/* ET_TOKEN_CONSTANTS.empty_ancestors */
extern unsigned char ge957os8438;
extern T0* ge957ov8438;
extern T0* T142f133(T0* C);
/* ET_BASE_TYPE_LIST.make_with_capacity */
extern T0* T381c4(T6 a1);
/* KL_SPECIAL_ROUTINES [ET_BASE_TYPE].make */
extern T0* T433f1(T0* C, T6 a1);
/* TO_SPECIAL [ET_BASE_TYPE].make_area */
extern T0* T444c2(T6 a1);
/* SPECIAL [ET_BASE_TYPE].make */
extern T0* T432c1(T6 a1);
/* ET_BASE_TYPE_LIST.fixed_array */
extern unsigned char ge1012os13341;
extern T0* ge1012ov13341;
extern T0* T381f3(T0* C);
/* KL_SPECIAL_ROUTINES [ET_BASE_TYPE].default_create */
extern T0* T433c2(void);
/* ET_CLASS.tokens */
extern T0* T260f16(T0* C);
/* ET_TOKEN_CONSTANTS.array_class_name */
extern unsigned char ge957os7804;
extern T0* ge957ov7804;
extern T0* T142f4(T0* C);
/* ET_SYSTEM.set_preparse_shallow_mode */
extern void T143f126(T0* C);
/* ET_SYSTEM.set_default_keyword_usage */
extern void T143f125(T0* C);
/* ET_SYSTEM.set_use_reference_keyword */
extern void T143f130(T0* C, T1 a1);
/* ET_SYSTEM.set_use_attribute_keyword */
extern void T143f129(T0* C, T1 a1);
/* ET_SYSTEM.initialize */
extern void T143f124(T0* C);
/* ET_ADAPTED_DOTNET_ASSEMBLIES.make_empty */
extern T0* T256c3(void);
/* DS_ARRAYED_LIST [ET_ADAPTED_DOTNET_ASSEMBLY].make */
extern T0* T336c6(T6 a1);
/* DS_ARRAYED_LIST [ET_ADAPTED_DOTNET_ASSEMBLY].new_cursor */
extern T0* T336f5(T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_DOTNET_ASSEMBLY].make */
extern T0* T399c3(T0* a1);
/* KL_SPECIAL_ROUTINES [ET_ADAPTED_DOTNET_ASSEMBLY].make */
extern T0* T396f1(T0* C, T6 a1);
/* TO_SPECIAL [ET_ADAPTED_DOTNET_ASSEMBLY].make_area */
extern T0* T429c2(T6 a1);
/* SPECIAL [ET_ADAPTED_DOTNET_ASSEMBLY].make */
extern T0* T398c1(T6 a1);
/* KL_SPECIAL_ROUTINES [ET_ADAPTED_DOTNET_ASSEMBLY].default_create */
extern T0* T396c2(void);
/* ET_CLUSTERS.make_empty */
extern T0* T255c3(void);
/* DS_ARRAYED_LIST [ET_CLUSTER].make */
extern T0* T335c6(T6 a1);
/* DS_ARRAYED_LIST [ET_CLUSTER].new_cursor */
extern T0* T335f5(T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_CLUSTER].make */
extern T0* T395c3(T0* a1);
/* KL_SPECIAL_ROUTINES [ET_CLUSTER].make */
extern T0* T393f1(T0* C, T6 a1);
/* TO_SPECIAL [ET_CLUSTER].make_area */
extern T0* T428c2(T6 a1);
/* SPECIAL [ET_CLUSTER].make */
extern T0* T394c1(T6 a1);
/* KL_SPECIAL_ROUTINES [ET_CLUSTER].default_create */
extern T0* T393c2(void);
/* ET_ADAPTED_LIBRARIES.make_empty */
extern T0* T254c3(void);
/* DS_ARRAYED_LIST [ET_ADAPTED_LIBRARY].make */
extern T0* T334c6(T6 a1);
/* DS_ARRAYED_LIST [ET_ADAPTED_LIBRARY].new_cursor */
extern T0* T334f5(T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_LIBRARY].make */
extern T0* T392c3(T0* a1);
/* KL_SPECIAL_ROUTINES [ET_ADAPTED_LIBRARY].make */
extern T0* T389f1(T0* C, T6 a1);
/* TO_SPECIAL [ET_ADAPTED_LIBRARY].make_area */
extern T0* T427c2(T6 a1);
/* SPECIAL [ET_ADAPTED_LIBRARY].make */
extern T0* T391c1(T6 a1);
/* KL_SPECIAL_ROUTINES [ET_ADAPTED_LIBRARY].default_create */
extern T0* T389c2(void);
/* ET_SYSTEM.initialize */
extern void T143f124p1(T0* C);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].set_key_equality_tester */
extern void T257f34(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [ET_CLASS, ET_CLASS_NAME].internal_set_equality_tester */
extern void T338f6(T0* C, T0* a1);
/* ET_SYSTEM.class_name_tester */
extern unsigned char ge1001os9048;
extern T0* ge1001ov9048;
extern T0* T143f122(T0* C);
/* ET_CLASS_NAME_TESTER.default_create */
extern T0* T258c2(void);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].make_map */
extern T0* T257c33(T6 a1);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].make_with_equality_testers */
extern void T257f37(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [ET_CLASS, ET_CLASS_NAME].make */
extern T0* T338c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [ET_CLASS, ET_CLASS_NAME].new_cursor */
extern T0* T338f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [ET_CLASS, ET_CLASS_NAME].make */
extern T0* T400c3(T0* a1);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].new_cursor */
extern T0* T257f27(T0* C);
/* DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME].make */
extern T0* T340c4(T0* a1);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].make_sparse_container */
extern void T257f50(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].make_slots */
extern void T257f58(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].make_clashes */
extern void T257f57(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].make_key_storage */
extern void T257f56(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_CLASS_NAME].make */
extern T0* T344f2(T0* C, T6 a1);
/* TO_SPECIAL [ET_CLASS_NAME].make_area */
extern T0* T402c2(T6 a1);
/* SPECIAL [ET_CLASS_NAME].make */
extern T0* T342c4(T6 a1);
/* KL_SPECIAL_ROUTINES [ET_CLASS_NAME].default_create */
extern T0* T344c3(void);
/* DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME].make_item_storage */
extern void T257f55(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_CLASS].make */
extern T0* T343f2(T0* C, T6 a1);
/* TO_SPECIAL [ET_CLASS].make_area */
extern T0* T401c2(T6 a1);
/* SPECIAL [ET_CLASS].make */
extern T0* T341c3(T6 a1);
/* KL_SPECIAL_ROUTINES [ET_CLASS].default_create */
extern T0* T343c3(void);
/* ET_TOKEN_CONSTANTS.default_ast_factory */
extern unsigned char ge957os8446;
extern T0* ge957ov8446;
extern T0* T142f3(T0* C);
/* ET_AST_FACTORY.make */
extern T0* T251c2(void);
/* ET_TOKEN_CONSTANTS.standard_error_handler */
extern unsigned char ge957os8445;
extern T0* ge957ov8445;
extern T0* T142f2(T0* C);
/* ET_ERROR_HANDLER.make_standard */
extern T0* T250c5(void);
/* ET_ERROR_HANDLER.std */
extern T0* T250f4(T0* C);
/* ET_SYSTEM.tokens */
extern T0* T143f120(T0* C);
/* ET_XACE_PARSER.tokens */
extern T0* T84f16(T0* C);
/* ET_XACE_AST_FACTORY.new_library */
extern T0* T89f5(T0* C);
/* ET_XACE_LIBRARY_CONFIG.make */
extern T0* T83c7(void);
/* ET_XACE_VALIDATOR.validate_library_doc */
extern void T97f32(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_wrong_root_element_error */
extern void T28f26(T0* C, T0* a1, T0* a2);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.make */
extern T0* T217c7(T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_named_cluster */
extern void T97f35(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_cluster */
extern void T97f37(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_unknown_element_error */
extern void T28f30(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.make */
extern T0* T221c7(T0* a1, T0* a2, T0* a3);
/* ET_XACE_VALIDATOR.validate_external */
extern void T97f40(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_export */
extern void T97f43(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_feature */
extern T0* T97f29(T0* C);
/* ET_XACE_VALIDATOR.uc_export */
extern T0* T97f28(T0* C);
/* ET_XACE_VALIDATOR.uc_link_library */
extern T0* T97f27(T0* C);
/* ET_XACE_VALIDATOR.uc_location */
extern T0* T97f15(T0* C);
/* ET_XACE_VALIDATOR.uc_include_dir */
extern T0* T97f26(T0* C);
/* ET_XACE_VALIDATOR.uc_external */
extern T0* T97f12(T0* C);
/* ET_XACE_VALIDATOR.validate_class */
extern void T97f41(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_feature */
extern void T97f44(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_class */
extern T0* T97f13(T0* C);
/* ET_XACE_VALIDATOR.validate_option */
extern void T97f39(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_optimize */
extern T0* T97f25(T0* C);
/* ET_XACE_VALIDATOR.uc_debug */
extern T0* T97f24(T0* C);
/* ET_XACE_VALIDATOR.uc_check */
extern T0* T97f23(T0* C);
/* ET_XACE_VALIDATOR.uc_loop */
extern T0* T97f22(T0* C);
/* ET_XACE_VALIDATOR.uc_invariant */
extern T0* T97f21(T0* C);
/* ET_XACE_VALIDATOR.uc_ensure */
extern T0* T97f20(T0* C);
/* ET_XACE_VALIDATOR.uc_require */
extern T0* T97f19(T0* C);
/* ET_XACE_VALIDATOR.uc_value */
extern T0* T97f18(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_unknown_option_warning */
extern void T28f32(T0* C, T0* a1, T0* a2);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.make */
extern T0* T223c8(T0* a1, T0* a2);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.uc_name */
extern T0* T223f7(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].has */
extern T1 T150f28(T0* C, T0* a1);
/* ET_XACE_OPTION_NAMES.option_codes */
extern T0* T127f17(T0* C);
/* ET_XACE_OPTION_NAMES.string_equality_tester */
extern T0* T127f30(T0* C);
/* ET_XACE_VALIDATOR.options */
extern T0* T97f17(T0* C);
/* ET_XACE_VALIDATOR.uc_option */
extern T0* T97f11(T0* C);
/* ET_XACE_VALIDATOR.validate_mount */
extern void T97f38(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_exclude */
extern void T97f42(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_obsolete_exclude_element_warning */
extern void T28f31(T0* C, T0* a1);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.make */
extern T0* T222c7(T0* a1);
/* ET_XACE_VALIDATOR.uc_exclude */
extern unsigned char ge1279os2516;
extern T0* ge1279ov2516;
extern T0* T97f16(T0* C);
/* ET_XACE_VALIDATOR.uc_mount */
extern T0* T97f10(T0* C);
/* ET_XACE_VALIDATOR.uc_description */
extern unsigned char ge1279os2500;
extern T0* ge1279ov2500;
extern T0* T97f9(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_missing_attribute_error */
extern void T28f27(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.make */
extern T0* T218c7(T0* a1, T0* a2, T0* a3);
/* ET_XACE_VALIDATOR.uc_name */
extern T0* T97f7(T0* C);
/* ET_XACE_VALIDATOR.uc_cluster */
extern T0* T97f6(T0* C);
/* ET_XACE_VALIDATOR.validate_library */
extern void T97f34(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_library */
extern unsigned char ge1279os2491;
extern T0* ge1279ov2491;
extern T0* T97f5(T0* C);
/* ET_XACE_VALIDATOR.string_ */
extern T0* T97f3(T0* C);
/* ET_XACE_PARSER.uc_cluster */
extern T0* T84f11(T0* C);
/* ET_XACE_PARSER.uc_library */
extern T0* T84f148(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].wipe_out */
extern void T99f38(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].slots_wipe_out */
extern void T99f46(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].clashes_wipe_out */
extern void T99f45(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].key_storage_wipe_out */
extern void T99f44(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].item_storage_wipe_out */
extern void T99f43(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].move_all_cursors_after */
extern void T99f41(T0* C);
/* DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8].set_next_cursor */
extern void T164f6(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8].set_position */
extern void T164f5(T0* C, T6 a1);
/* ET_XACE_PARSER.new_system */
extern T0* T84f15(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_CONFIG.mount_libraries */
extern void T78f15(T0* C);
/* ET_XACE_PARSER.fill_system */
extern void T84f254(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_SYSTEM_CONFIG.set_libraries */
extern void T78f14(T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG.set_options */
extern void T78f13(T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG.set_creation_procedure_name */
extern void T78f12(T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG.set_root_class_name */
extern void T78f11(T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG.set_system_name */
extern void T78f10(T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG.set_clusters */
extern void T78f9(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_creation */
extern unsigned char ge1279os2490;
extern T0* ge1279ov2490;
extern T0* T84f28(T0* C);
/* XM_ELEMENT.element_by_name */
extern T0* T91f20(T0* C, T0* a1);
/* XM_ELEMENT.named_same_name */
extern T1 T91f10(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.same_namespace */
extern T1 T91f12(T0* C, T0* a1);
/* XM_ELEMENT.has_namespace */
extern T1 T91f14(T0* C);
/* XM_NODE_TYPER.is_element */
extern T1 T414f9(T0* C);
/* XM_ELEMENT.has_element_by_name */
extern T1 T91f19(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_root */
extern unsigned char ge1279os2488;
extern T0* ge1279ov2488;
extern T0* T84f26(T0* C);
/* ET_XACE_AST_FACTORY.new_system */
extern T0* T89f1(T0* C);
/* ET_XACE_SYSTEM_CONFIG.make */
extern T0* T78c7(void);
/* ET_XACE_PREPROCESSOR.preprocess_element */
extern void T98f11(T0* C, T0* a1, T0* a2);
/* ET_XACE_PREPROCESSOR.should_strip_element */
extern T1 T98f3(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_invalid_expression_error */
extern void T28f36(T0* C, T0* a1, T0* a2);
/* ET_XACE_INVALID_EXPRESSION_ERROR.make */
extern T0* T324c7(T0* a1, T0* a2);
/* ET_XACE_PREPROCESSOR.is_expression_true */
extern T1 T98f8(T0* C, T0* a1);
/* UT_TEMPLATE_EXPANDER.expand_from_values */
extern T0* T160f1(T0* C, T0* a1, T0* a2);
/* UT_TEMPLATE_EXPANDER.string_ */
extern T0* T160f2(T0* C);
/* ET_XACE_PREPROCESSOR.template_expander */
extern unsigned char ge1287os5824;
extern T0* ge1287ov5824;
extern T0* T98f4(T0* C);
/* UT_TEMPLATE_EXPANDER.make */
extern T0* T160c3(void);
/* ET_XACE_PREPROCESSOR.string_ */
extern T0* T98f9(T0* C);
/* UC_UTF8_STRING.occurrences */
extern T6 T233f51(T0* C, T2 a1);
/* UC_UTF8_STRING.code_occurrences */
extern T6 T233f52(T0* C, T6 a1);
/* STRING_8.occurrences */
extern T6 T17f31(T0* C, T2 a1);
/* ET_XACE_PREPROCESSOR.is_valid_expression */
extern T1 T98f7(T0* C, T0* a1);
/* ET_XACE_PREPROCESSOR.uc_unless */
extern unsigned char ge1279os2518;
extern T0* ge1279ov2518;
extern T0* T98f6(T0* C);
/* ET_XACE_PREPROCESSOR.uc_if */
extern unsigned char ge1279os2517;
extern T0* ge1279ov2517;
extern T0* T98f5(T0* C);
/* ET_XACE_PREPROCESSOR.expand_attribute_variables */
extern void T98f12(T0* C, T0* a1);
/* XM_ATTRIBUTE.set_value */
extern void T146f7(T0* C, T0* a1);
/* ET_XACE_VALIDATOR.validate_system_doc */
extern void T97f31(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_system */
extern void T97f33(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_obsolete_cluster_element_warning */
extern void T28f29(T0* C, T0* a1);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.make */
extern T0* T220c7(T0* a1);
/* ET_XACE_VALIDATOR.validate_root */
extern void T97f36(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_creation */
extern T0* T97f14(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_missing_element_error */
extern void T28f28(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_MISSING_ELEMENT_ERROR.make */
extern T0* T219c7(T0* a1, T0* a2, T0* a3);
/* ET_XACE_VALIDATOR.uc_root */
extern T0* T97f8(T0* C);
/* ET_XACE_VALIDATOR.uc_system */
extern unsigned char ge1279os2487;
extern T0* ge1279ov2487;
extern T0* T97f4(T0* C);
/* ET_XACE_PARSER.uc_system */
extern T0* T84f13(T0* C);
/* ET_XACE_PARSER.string_ */
extern T0* T84f147(T0* C);
/* XM_TREE_CALLBACKS_PIPE.document */
extern T0* T94f5(T0* C);
/* XM_EIFFEL_PARSER.parse_from_stream */
extern void T101f203(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.parse_with_events */
extern void T101f209(T0* C);
/* XM_EIFFEL_PARSER.on_finish */
extern void T101f215(T0* C);
/* XM_EIFFEL_PARSER.parse */
extern void T101f214(T0* C);
/* XM_EIFFEL_PARSER.yy_pop_last_value */
extern void T101f224(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.yy_push_error_value */
extern void T101f223(T0* C);
/* KL_SPECIAL_ROUTINES [ANY].resize */
extern T0* T176f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ANY].aliased_resized_area */
extern T0* T175f2(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].make */
extern T0* T176f1(T0* C, T6 a1);
/* TO_SPECIAL [ANY].make_area */
extern T0* T306c2(T6 a1);
/* SPECIAL [ANY].make */
extern T0* T175c3(T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].default_create */
extern T0* T176c3(void);
/* XM_EIFFEL_PARSER.yy_do_action */
extern void T101f222(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.on_notation_declaration */
extern void T101f252(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_notation_declaration */
extern void T207f8(T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.set_public */
extern void T179f6(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].resize */
extern T0* T205f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_EXTERNAL_ID].aliased_resized_area */
extern T0* T190f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].make */
extern T0* T205f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_DTD_EXTERNAL_ID].make_area */
extern T0* T322c2(T6 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].make */
extern T0* T190c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].default_create */
extern T0* T205c3(void);
/* XM_DTD_EXTERNAL_ID.set_system */
extern void T179f5(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_dtd_external_id */
extern T0* T101f169(T0* C);
/* XM_DTD_EXTERNAL_ID.make */
extern T0* T179c4(void);
/* XM_EIFFEL_PARSER.when_pe_entity_declared */
extern void T101f251(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].force_new */
extern void T172f40(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_put */
extern void T172f54(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_put */
extern void T172f53(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_put */
extern void T172f52(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_put */
extern void T172f51(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_item */
extern T6 T172f28(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].hash_position */
extern T6 T172f27(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_item */
extern T6 T172f26(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].resize */
extern void T172f50(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_resize */
extern void T172f59(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].special_integer_ */
extern T0* T172f32(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_resize */
extern void T172f58(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_resize */
extern void T172f57(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].resize */
extern T0* T305f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].aliased_resized_area */
extern T0* T300f3(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_item */
extern T0* T172f22(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_resize */
extern void T172f56(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_modulus */
extern T6 T172f29(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_capacity */
extern T6 T172f23(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].unset_found_item */
extern void T172f45(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].has */
extern T1 T172f33(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].search_position */
extern void T172f42(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_def */
extern T0* T210c208(T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_literal */
extern void T210f210(T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.default_create */
extern T0* T174c4(void);
/* XM_EIFFEL_PE_ENTITY_DEF.make_scanner */
extern void T210f211(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T210f213(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset_sent */
extern void T210f216(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T210f213p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T210f213p0(T0* C);
/* DS_LINKED_STACK [INTEGER_32].make */
extern T0* T296c5(void);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T210f213p2(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.make_with_buffer */
extern void T210f212(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_initialize */
extern void T210f214(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_build_tables */
extern void T210f217(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template */
extern unsigned char ge1453os9322;
extern T0* ge1453ov9322;
extern T0* T210f50(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_fixed_array */
extern T0* T210f54(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].to_special */
extern T0* T53f3(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_meta_template */
extern unsigned char ge1453os9321;
extern T0* ge1453ov9321;
extern T0* T210f91(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_ec_template */
extern unsigned char ge1453os9320;
extern T0* ge1453ov9320;
extern T0* T210f69(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template */
extern unsigned char ge1453os9319;
extern T0* ge1453ov9319;
extern T0* T210f59(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template */
extern unsigned char ge1453os9318;
extern T0* ge1453ov9318;
extern T0* T210f52(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template */
extern unsigned char ge1453os9311;
extern T0* ge1453ov9311;
extern T0* T210f49(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_6 */
extern void T210f230(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_array_subcopy */
extern void T210f231(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* KL_ARRAY_ROUTINES [INTEGER_32].subcopy */
extern void T326f2(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* ARRAY [INTEGER_32].subcopy */
extern void T230f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER_32].copy_data */
extern void T51f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER_32].move_data */
extern void T51f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].overlapping_move */
extern void T51f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].non_overlapping_move */
extern void T51f8(T0* C, T6 a1, T6 a2, T6 a3);
/* XM_EIFFEL_PE_ENTITY_DEF.integer_array_ */
extern unsigned char ge80os2662;
extern T0* ge80ov2662;
extern T0* T210f55(T0* C);
/* KL_ARRAY_ROUTINES [INTEGER_32].default_create */
extern T0* T326c1(void);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_5 */
extern void T210f229(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_4 */
extern void T210f228(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_3 */
extern void T210f227(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_2 */
extern void T210f226(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_1 */
extern void T210f225(T0* C, T0* a1);
/* ARRAY [INTEGER_32].make */
extern T0* T230c5(T6 a1, T6 a2);
/* ARRAY [INTEGER_32].make_area */
extern void T230f6(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template */
extern unsigned char ge1453os9304;
extern T0* ge1453ov9304;
extern T0* T210f65(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_6 */
extern void T210f224(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_5 */
extern void T210f223(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_4 */
extern void T210f222(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_3 */
extern void T210f221(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_2 */
extern void T210f220(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_1 */
extern void T210f219(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.empty_buffer */
extern unsigned char ge317os9514;
extern T0* ge317ov9514;
extern T0* T210f58(T0* C);
/* YY_BUFFER.make */
extern T0* T292c12(T0* a1);
/* YY_BUFFER.make_from_buffer */
extern void T292f16(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.fill_from_string */
extern void T384f9(T0* C, T0* a1, T6 a2);
/* YY_BUFFER.new_default_buffer */
extern T0* T292f11(T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.make */
extern T0* T291c8(void);
/* XM_EIFFEL_PE_ENTITY_DEF.make_external */
extern void T210f209(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.new_external_entity */
extern T0* T101f168(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.make_external */
extern T0* T204c207(T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_scanner */
extern void T204f208(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T204f210(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T204f210p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T204f210p0(T0* C);
/* XM_EIFFEL_ENTITY_DEF.make_with_buffer */
extern void T204f209(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_initialize */
extern void T204f211(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_build_tables */
extern void T204f213(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template */
extern T0* T204f48(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_fixed_array */
extern T0* T204f53(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_meta_template */
extern T0* T204f88(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_ec_template */
extern T0* T204f67(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template */
extern T0* T204f58(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template */
extern T0* T204f50(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template */
extern T0* T204f47(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_6 */
extern void T204f226(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_array_subcopy */
extern void T204f227(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_ENTITY_DEF.integer_array_ */
extern T0* T204f54(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_5 */
extern void T204f225(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_4 */
extern void T204f224(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_3 */
extern void T204f223(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_2 */
extern void T204f222(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_1 */
extern void T204f221(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template */
extern T0* T204f64(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_6 */
extern void T204f220(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_5 */
extern void T204f219(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_4 */
extern void T204f218(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_3 */
extern void T204f217(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_2 */
extern void T204f216(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_1 */
extern void T204f215(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.empty_buffer */
extern T0* T204f49(T0* C);
/* XM_EIFFEL_PARSER.on_entity_declaration */
extern void T101f250(T0* C, T0* a1, T1 a2, T0* a3, T0* a4, T0* a5);
/* XM_DTD_CALLBACKS_NULL.on_entity_declaration */
extern void T207f7(T0* C, T0* a1, T1 a2, T0* a3, T0* a4, T0* a5);
/* XM_EIFFEL_PARSER.when_entity_declared */
extern void T101f249(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.new_literal_entity */
extern T0* T101f167(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_literal */
extern T0* T204c206(T0* a1, T0* a2);
/* XM_DTD_ATTRIBUTE_CONTENT.set_default_value */
extern void T183f26(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_fixed */
extern void T183f25(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_implied */
extern void T183f24(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_required */
extern void T183f23(T0* C);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].resize */
extern T0* T203f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].aliased_resized_area */
extern T0* T202f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].make */
extern T0* T203f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_BILINKED_LIST [STRING_8]].make_area */
extern T0* T321c2(T6 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].make */
extern T0* T202c4(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].default_create */
extern T0* T203c3(void);
/* DS_BILINKED_LIST [STRING_8].force_last */
extern void T184f12(T0* C, T0* a1);
/* DS_BILINKABLE [STRING_8].put_right */
extern void T313f5(T0* C, T0* a1);
/* DS_BILINKABLE [STRING_8].attach_left */
extern void T313f6(T0* C, T0* a1);
/* DS_BILINKABLE [STRING_8].make */
extern T0* T313c4(T0* a1);
/* DS_BILINKED_LIST [STRING_8].is_empty */
extern T1 T184f7(T0* C);
/* XM_EIFFEL_PARSER.new_string_bilinked_list */
extern T0* T101f162(T0* C);
/* DS_BILINKED_LIST [STRING_8].set_equality_tester */
extern void T184f13(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.string_equality_tester */
extern T0* T101f182(T0* C);
/* DS_BILINKED_LIST [STRING_8].make */
extern T0* T184c11(void);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration_list */
extern void T183f22(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration */
extern void T183f27(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.default_enumeration_list */
extern unsigned char ge1364os9952;
extern T0* ge1364ov9952;
extern T0* T183f7(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_notation */
extern void T183f21(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_token */
extern void T183f20(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_entity */
extern void T183f19(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_list_type */
extern void T183f18(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id_ref */
extern void T183f17(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id */
extern void T183f16(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_data */
extern void T183f15(T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content */
extern T0* T101f160(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.make */
extern T0* T183c12(void);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].resize */
extern T0* T201f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].aliased_resized_area */
extern T0* T199f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T201f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make_area */
extern T0* T320c2(T6 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T199c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].default_create */
extern T0* T201c3(void);
/* XM_DTD_ATTRIBUTE_CONTENT.copy_default */
extern void T183f14(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_implied */
extern T1 T183f11(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_required */
extern T1 T183f10(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.has_default_value */
extern T1 T183f9(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_fixed */
extern T1 T183f8(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_name */
extern void T183f13(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].resize */
extern T0* T200f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].aliased_resized_area */
extern T0* T197f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T200f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make_area */
extern T0* T319c2(T6 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T197c4(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].default_create */
extern T0* T200c3(void);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].force_last */
extern void T182f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].put_right */
extern void T311f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].attach_left */
extern void T311f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T311c4(T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].is_empty */
extern T1 T182f5(T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content_list */
extern T0* T101f153(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T182c8(void);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].new_cursor */
extern T0* T182f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T310c7(T0* a1);
/* XM_EIFFEL_PARSER.on_attribute_declarations */
extern void T101f248(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].forth */
extern void T310f9(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_forth */
extern void T182f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].add_traversing_cursor */
extern void T182f12(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set_next_cursor */
extern void T310f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].remove_traversing_cursor */
extern void T182f13(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set */
extern void T310f10(T0* C, T0* a1, T1 a2, T1 a3);
/* XM_EIFFEL_PARSER.on_attribute_declaration */
extern void T101f258(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_DTD_CALLBACKS_NULL.on_attribute_declaration */
extern void T207f9(T0* C, T0* a1, T0* a2, T0* a3);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].item */
extern T0* T310f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].start */
extern void T310f8(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_start */
extern void T182f10(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_off */
extern T1 T182f7(T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_more */
extern void T181f11(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_mixed */
extern T0* T181c10(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_mixed */
extern void T181f21(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_choice */
extern void T181f19(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_list */
extern void T181f16(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_default */
extern void T181f22(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one */
extern void T181f12(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_sequence */
extern void T181f20(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T309c7(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].new_cursor */
extern T0* T309f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T368c3(T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_sequence */
extern T0* T181c9(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_last */
extern void T309f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].put_right */
extern void T369f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].attach_left */
extern void T369f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T369c4(T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].is_empty */
extern T1 T309f5(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_choice */
extern T0* T181c8(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_first */
extern void T309f8(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.element_name */
extern T0* T101f147(T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_name */
extern T0* T181c15(T0* a1);
/* XM_EIFFEL_PARSER.set_element_repetition */
extern void T101f247(T0* C, T0* a1, T0* a2);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_one */
extern void T181f14(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one_or_more */
extern void T181f13(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_any */
extern T0* T181c7(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_any */
extern void T181f18(T0* C);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].resize */
extern T0* T195f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].aliased_resized_area */
extern T0* T194f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T195f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_DTD_ELEMENT_CONTENT].make_area */
extern T0* T318c2(T6 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T194c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].default_create */
extern T0* T195c3(void);
/* XM_DTD_ELEMENT_CONTENT.make_empty */
extern T0* T181c6(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_empty */
extern void T181f17(T0* C);
/* XM_EIFFEL_PARSER.on_element_declaration */
extern void T101f246(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_element_declaration */
extern void T207f6(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_attribute */
extern void T101f245(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].has */
extern T1 T180f30(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].search_position */
extern void T180f34(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_item */
extern T6 T180f22(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].hash_position */
extern T6 T180f24(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.hash_code */
extern T6 T177f9(T0* C);
/* XM_EIFFEL_PARSER_NAME.item */
extern T0* T177f14(T0* C, T6 a1);
/* DS_BILINKED_LIST [STRING_8].item */
extern T0* T184f8(T0* C, T6 a1);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].test */
extern T1 T307f1(T0* C, T0* a1, T0* a2);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].any_ */
extern T0* T307f2(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_storage_item */
extern T0* T180f18(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_item */
extern T0* T180f29(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_equality_tester */
extern T0* T180f17(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_item */
extern T6 T180f25(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].resize */
extern T0* T193f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].aliased_resized_area */
extern T0* T192f2(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T193f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make_area */
extern T0* T317c2(T6 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T192c4(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].default_create */
extern T0* T193c3(void);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].force_new */
extern void T180f33(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_put */
extern void T180f40(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_put */
extern void T180f39(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_put */
extern void T180f38(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].resize */
extern void T180f37(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_resize */
extern void T180f48(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].special_integer_ */
extern T0* T180f28(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_storage_resize */
extern void T180f47(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_resize */
extern void T180f46(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_resize */
extern void T180f45(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_modulus */
extern T6 T180f19(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_capacity */
extern T6 T180f26(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].unset_found_item */
extern void T180f36(T0* C);
/* XM_EIFFEL_PARSER.new_name_set */
extern T0* T101f134(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_equal */
extern T0* T180c32(T6 a1);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T307c3(void);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make */
extern void T180f35(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_cursor */
extern T0* T180f21(T0* C);
/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME].make */
extern T0* T308c3(T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_slots */
extern void T180f44(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_clashes */
extern void T180f43(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_key_storage */
extern void T180f42(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_item_storage */
extern void T180f41(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.on_start_tag */
extern void T101f244(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER.on_end_tag */
extern void T101f243(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER_NAME.local_part */
extern T0* T177f12(T0* C);
/* XM_EIFFEL_PARSER_NAME.string_ */
extern T0* T177f18(T0* C);
/* XM_EIFFEL_PARSER_NAME.last */
extern T0* T177f17(T0* C);
/* DS_BILINKED_LIST [STRING_8].last */
extern T0* T184f9(T0* C);
/* XM_EIFFEL_PARSER_NAME.ns_prefix */
extern T0* T177f11(T0* C);
/* XM_EIFFEL_PARSER_NAME.is_namespace_name */
extern T1 T177f16(T0* C);
/* XM_EIFFEL_PARSER.on_start_tag_finish */
extern void T101f242(T0* C);
/* KL_SPECIAL_ROUTINES [BOOLEAN].resize */
extern T0* T191f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [BOOLEAN].aliased_resized_area */
extern T0* T189f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].make */
extern T0* T191f1(T0* C, T6 a1);
/* TO_SPECIAL [BOOLEAN].make_area */
extern T0* T316c2(T6 a1);
/* SPECIAL [BOOLEAN].make */
extern T0* T189c4(T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].default_create */
extern T0* T191c3(void);
/* XM_EIFFEL_PARSER.when_external_dtd */
extern void T101f241(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.last_error */
extern T0* T174f2(T0* C);
/* XM_EIFFEL_PARSER.null_resolver */
extern unsigned char ge1451os5934;
extern T0* ge1451ov5934;
extern T0* T101f103(T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern T0* T208c198(void);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern void T208f198p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T208f207(T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T208f207p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_with_buffer */
extern void T208f206(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_initialize */
extern void T208f216(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_build_tables */
extern void T208f221(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template */
extern T0* T208f192(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_fixed_array */
extern T0* T208f195(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_meta_template */
extern T0* T208f191(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_ec_template */
extern T0* T208f190(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template */
extern T0* T208f189(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template */
extern T0* T208f188(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template */
extern T0* T208f187(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_6 */
extern void T208f233(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_array_subcopy */
extern void T208f234(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_SCANNER_DTD.integer_array_ */
extern T0* T208f197(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_5 */
extern void T208f232(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_4 */
extern void T208f231(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_3 */
extern void T208f230(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_2 */
extern void T208f229(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_1 */
extern void T208f228(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template */
extern T0* T208f186(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_6 */
extern void T208f227(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_5 */
extern void T208f226(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_4 */
extern void T208f225(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_3 */
extern void T208f224(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_2 */
extern void T208f223(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_1 */
extern void T208f222(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.empty_buffer */
extern T0* T208f49(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].force */
extern void T171f8(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.has_error */
extern T1 T174f1(T0* C);
/* XM_EIFFEL_PARSER.resolve_external_id */
extern void T101f257(T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.resolve */
extern void T174f6(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_public */
extern void T174f5(T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.is_public */
extern T1 T179f3(T0* C);
/* XM_EIFFEL_PARSER.on_dtd_end */
extern void T101f240(T0* C);
/* XM_DTD_CALLBACKS_NULL.on_dtd_end */
extern void T207f5(T0* C);
/* XM_EIFFEL_PARSER.on_doctype */
extern void T101f239(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_DTD_CALLBACKS_NULL.on_doctype */
extern void T207f4(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_DTD_CALLBACKS_NULL.make */
extern T0* T207c1(void);
/* XM_EIFFEL_DECLARATION.set_encoding */
extern void T178f9(T0* C, T0* a1);
/* XM_EIFFEL_DECLARATION.set_stand_alone */
extern void T178f8(T0* C, T1 a1);
/* XM_EIFFEL_DECLARATION.set_version */
extern void T178f11(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].resize */
extern T0* T188f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_DECLARATION].aliased_resized_area */
extern T0* T187f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].make */
extern T0* T188f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_EIFFEL_DECLARATION].make_area */
extern T0* T315c2(T6 a1);
/* SPECIAL [XM_EIFFEL_DECLARATION].make */
extern T0* T187c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].default_create */
extern T0* T188c3(void);
/* XM_EIFFEL_DECLARATION.make */
extern T0* T178c7(void);
/* XM_EIFFEL_DECLARATION.process */
extern void T178f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_xml_declaration */
extern void T101f261(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_EIFFEL_PARSER.apply_encoding */
extern void T101f238(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_content */
extern void T101f237(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_dtd_processing_instruction */
extern void T101f236(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_dtd_processing_instruction */
extern void T207f3(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_processing_instruction */
extern void T101f235(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_dtd_comment */
extern void T101f234(T0* C, T0* a1);
/* XM_DTD_CALLBACKS_NULL.on_dtd_comment */
extern void T207f2(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_comment */
extern void T101f233(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.entity_referenced_in_entity_value */
extern T0* T101f117(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.defined_entity_referenced */
extern T0* T101f194(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.external_entity_to_string */
extern T0* T101f200(T0* C, T0* a1);
/* STRING_8.remove */
extern void T17f49(T0* C, T6 a1);
/* XM_EIFFEL_INPUT_STREAM.read_string */
extern void T235f29(T0* C, T6 a1);
/* KL_PLATFORM.maximum_integer */
extern unsigned char ge166os10215;
extern T6 ge166ov10215;
extern T6 T237f2(T0* C);
/* KL_INTEGER_ROUTINES.platform */
extern T0* T236f1(T0* C);
/* XM_EIFFEL_PARSER.integer_ */
extern T0* T101f201(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item */
extern T0* T172f21(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_item */
extern T0* T172f36(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.force_error */
extern void T101f232(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.report_error */
extern void T101f230(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_error */
extern void T101f256(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.setup_error_state */
extern void T101f255(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.onstring_utf8 */
extern T0* T101f96(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.maximum_item_code */
extern T6 T101f189(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_latin1 */
extern T1 T101f188(T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_from_utf8 */
extern T0* T101f184(T0* C, T0* a1);
/* UC_UTF8_STRING.make_from_utf8 */
extern T0* T233c53(T0* a1);
/* UC_UTF8_STRING.append_utf8 */
extern void T233f65(T0* C, T0* a1);
/* UC_UTF8_ROUTINES.valid_utf8 */
extern T1 T231f1(T0* C, T0* a1);
/* UC_UTF8_ROUTINES.is_encoded_next_byte */
extern T1 T231f10(T0* C, T2 a1);
/* UC_UTF8_ROUTINES.is_encoded_second_byte */
extern T1 T231f5(T0* C, T2 a1, T2 a2);
/* UC_UTF8_ROUTINES.is_encoded_first_byte */
extern T1 T231f2(T0* C, T2 a1);
/* XM_EIFFEL_PARSER.utf8 */
extern T0* T101f187(T0* C);
/* XM_EIFFEL_PARSER.is_string_mode_ascii */
extern T1 T101f185(T0* C);
/* XM_EIFFEL_PARSER.onstring_ascii */
extern T0* T101f94(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_unicode */
extern T1 T101f183(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string */
extern T0* T101f115(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_string */
extern unsigned char ge1451os6002;
extern T0* ge1451ov6002;
extern T0* T101f193(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_uc */
extern unsigned char ge1451os6003;
extern T0* ge1451ov6003;
extern T0* T101f192(T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_empty */
extern T0* T101f199(T0* C);
/* UC_UTF8_STRING.make_empty */
extern T0* T233c57(void);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].resize */
extern T0* T186f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].aliased_resized_area */
extern T0* T185f2(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].make */
extern T0* T186f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_EIFFEL_PARSER_NAME].make_area */
extern T0* T314c2(T6 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].make */
extern T0* T185c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T186c3(void);
/* XM_EIFFEL_PARSER.namespace_force_last */
extern void T101f231(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER_NAME.force_last */
extern void T177f20(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.new_string_bilinked_list */
extern T0* T177f7(T0* C);
/* XM_EIFFEL_PARSER_NAME.can_force_last */
extern T1 T177f6(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_namespace_name */
extern T0* T101f111(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern void T177f21(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern T0* T177c21(void);
/* XM_EIFFEL_PARSER_NAME.make_namespaces */
extern T0* T177c19(void);
/* XM_EIFFEL_PARSER.yy_push_last_value */
extern void T101f221(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.accept */
extern void T101f220(T0* C);
/* XM_EIFFEL_PARSER.yy_do_error_action */
extern void T101f218(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.report_eof_expected_error */
extern void T101f229(T0* C);
/* XM_EIFFEL_PARSER.read_token */
extern void T101f217(T0* C);
/* XM_EIFFEL_PARSER.process_attribute_entity */
extern void T101f228(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_entity_scanner */
extern void T101f254(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.has_error */
extern T1 T204f55(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.has_error */
extern T1 T210f56(T0* C);
/* XM_EIFFEL_ENTITY_DEF.apply_input_buffer */
extern void T204f228(T0* C);
/* KL_STRING_INPUT_STREAM.make */
extern T0* T421c8(T0* a1);
/* UC_UTF8_ROUTINES.to_utf8 */
extern T0* T231f35(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.utf8 */
extern T0* T204f66(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.apply_input_buffer */
extern void T210f232(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.utf8 */
extern T0* T210f68(T0* C);
/* XM_EIFFEL_PARSER.process_entity */
extern void T101f227(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_pe_entity */
extern void T101f226(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.special_integer_ */
extern T0* T101f113(T0* C);
/* XM_EIFFEL_PARSER.yy_init_value_stacks */
extern void T101f216(T0* C);
/* XM_EIFFEL_PARSER.yy_clear_all */
extern void T101f225(T0* C);
/* XM_EIFFEL_PARSER.clear_all */
extern void T101f253(T0* C);
/* XM_EIFFEL_PARSER.clear_stacks */
extern void T101f259(T0* C);
/* XM_EIFFEL_PARSER.yy_clear_value_stacks */
extern void T101f260(T0* C);
/* SPECIAL [XM_EIFFEL_DECLARATION].clear_all */
extern void T187f6(T0* C);
/* SPECIAL [XM_EIFFEL_DECLARATION].put_default */
extern void T187f7(T0* C, T6 a1);
/* SPECIAL [BOOLEAN].clear_all */
extern void T189f6(T0* C);
/* SPECIAL [BOOLEAN].put_default */
extern void T189f7(T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].clear_all */
extern void T202f6(T0* C);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].put_default */
extern void T202f7(T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].clear_all */
extern void T197f6(T0* C);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].put_default */
extern void T197f7(T0* C, T6 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].clear_all */
extern void T199f6(T0* C);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].put_default */
extern void T199f7(T0* C, T6 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].clear_all */
extern void T194f6(T0* C);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].put_default */
extern void T194f7(T0* C, T6 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].clear_all */
extern void T190f6(T0* C);
/* SPECIAL [XM_DTD_EXTERNAL_ID].put_default */
extern void T190f7(T0* C, T6 a1);
/* SPECIAL [STRING_8].clear_all */
extern void T50f6(T0* C);
/* SPECIAL [STRING_8].put_default */
extern void T50f7(T0* C, T6 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].clear_all */
extern void T192f6(T0* C);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].put_default */
extern void T192f7(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].clear_all */
extern void T185f6(T0* C);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].put_default */
extern void T185f7(T0* C, T6 a1);
/* SPECIAL [ANY].clear_all */
extern void T175f5(T0* C);
/* SPECIAL [ANY].put_default */
extern void T175f6(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.abort */
extern void T101f219(T0* C);
/* XM_EIFFEL_PARSER.on_start */
extern void T101f213(T0* C);
/* XM_EIFFEL_PARSER.reset_error_state */
extern void T101f212(T0* C);
/* XM_EIFFEL_PARSER.reset */
extern void T101f208(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].wipe_out */
extern void T172f39(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_wipe_out */
extern void T172f49(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_wipe_out */
extern void T172f48(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_wipe_out */
extern void T172f47(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_wipe_out */
extern void T172f46(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].move_all_cursors_after */
extern void T172f44(T0* C);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].set_next_cursor */
extern void T303f6(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].set_position */
extern void T303f5(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.make_scanner */
extern void T101f206(T0* C);
/* XM_EIFFEL_SCANNER.make_scanner */
extern T0* T167c196(void);
/* XM_EIFFEL_SCANNER.reset */
extern void T167f204(T0* C);
/* XM_EIFFEL_SCANNER.reset */
extern void T167f204p1(T0* C);
/* XM_EIFFEL_SCANNER.make_with_buffer */
extern void T167f203(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_initialize */
extern void T167f211(T0* C);
/* XM_EIFFEL_SCANNER.yy_build_tables */
extern void T167f219(T0* C);
/* XM_EIFFEL_SCANNER.yy_accept_template */
extern T0* T167f190(T0* C);
/* XM_EIFFEL_SCANNER.yy_fixed_array */
extern T0* T167f193(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_meta_template */
extern T0* T167f189(T0* C);
/* XM_EIFFEL_SCANNER.yy_ec_template */
extern T0* T167f188(T0* C);
/* XM_EIFFEL_SCANNER.yy_def_template */
extern T0* T167f187(T0* C);
/* XM_EIFFEL_SCANNER.yy_base_template */
extern T0* T167f186(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template */
extern T0* T167f185(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_6 */
extern void T167f231(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_array_subcopy */
extern void T167f232(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_SCANNER.integer_array_ */
extern T0* T167f195(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_5 */
extern void T167f230(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_4 */
extern void T167f229(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_3 */
extern void T167f228(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_2 */
extern void T167f227(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_1 */
extern void T167f226(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template */
extern T0* T167f184(T0* C);
/* XM_EIFFEL_SCANNER.yy_nxt_template_6 */
extern void T167f225(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_5 */
extern void T167f224(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_4 */
extern void T167f223(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_3 */
extern void T167f222(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_2 */
extern void T167f221(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_1 */
extern void T167f220(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.empty_buffer */
extern T0* T167f42(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T79f38(T0* C);
/* KL_TEXT_INPUT_FILE.is_closed */
extern T1 T79f16(T0* C);
/* KL_TEXT_INPUT_FILE.old_open_read */
extern void T79f42(T0* C);
/* KL_TEXT_INPUT_FILE.default_pointer */
extern T14 T79f20(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T79f42p1(T0* C);
/* KL_TEXT_INPUT_FILE.file_open */
extern T14 T79f21(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.old_is_readable */
extern T1 T79f15(T0* C);
/* UNIX_FILE_INFO.is_readable */
extern T1 T153f5(T0* C);
/* UNIX_FILE_INFO.file_eaccess */
extern T1 T153f3(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.buffered_file_info */
extern unsigned char ge2244os3310;
extern T0* ge2244ov3310;
extern T0* T79f23(T0* C);
/* UNIX_FILE_INFO.make */
extern T0* T153c6(void);
/* UNIX_FILE_INFO.make_buffered_file_info */
extern void T153f8(T0* C, T6 a1);
/* UNIX_FILE_INFO.stat_size */
extern T6 T153f4(T0* C);
/* KL_TEXT_INPUT_FILE.set_buffer */
extern void T79f44(T0* C);
/* UNIX_FILE_INFO.update */
extern void T153f7(T0* C, T0* a1);
/* UNIX_FILE_INFO.file_stat */
extern void T153f9(T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.old_exists */
extern T1 T79f14(T0* C);
/* KL_TEXT_INPUT_FILE.file_exists */
extern T1 T79f22(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.make */
extern T0* T79c36(T0* a1);
/* KL_TEXT_INPUT_FILE.old_make */
extern void T79f40(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.string_ */
extern T0* T79f26(T0* C);
/* ET_XACE_PARSER.make_with_variables */
extern T0* T84c250(T0* a1, T0* a2);
/* ET_XACE_PARSER.make_with_variables_and_factory */
extern void T84f252(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.enable_position_table */
extern void T96f10(T0* C, T0* a1);
/* XM_POSITION_TABLE.make */
extern T0* T92c3(void);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T228c8(void);
/* XM_EIFFEL_PARSER.set_callbacks */
extern void T101f205(T0* C, T0* a1);
/* XM_TREE_CALLBACKS_PIPE.make */
extern T0* T94c10(void);
/* XM_TREE_CALLBACKS_PIPE.callbacks_pipe */
extern T0* T94f9(T0* C, T0* a1);
/* ARRAY [XM_CALLBACKS_FILTER].item */
extern T0* T157f4(T0* C, T6 a1);
/* XM_CALLBACKS_TO_TREE_FILTER.make_null */
extern T0* T96c9(void);
/* XM_TREE_CALLBACKS_PIPE.new_stop_on_error */
extern T0* T94f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.make_null */
extern T0* T95c4(void);
/* XM_TREE_CALLBACKS_PIPE.new_namespace_resolver */
extern T0* T94f6(T0* C);
/* XM_NAMESPACE_RESOLVER.make_null */
extern T0* T155c25(void);
/* XM_EIFFEL_PARSER.set_string_mode_mixed */
extern void T101f204(T0* C);
/* XM_EIFFEL_PARSER.make */
extern T0* T101c202(void);
/* XM_EIFFEL_PARSER.new_entities_table */
extern T0* T101f87(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].set_key_equality_tester */
extern void T172f41(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8].internal_set_equality_tester */
extern void T301f6(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_map_default */
extern T0* T172c38(void);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_map */
extern void T172f43(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_with_equality_testers */
extern void T172f55(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T301c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8].new_cursor */
extern T0* T301f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T366c3(T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_cursor */
extern T0* T172f35(T0* C);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T303c4(T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_sparse_container */
extern void T172f60(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_slots */
extern void T172f64(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_clashes */
extern void T172f63(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_key_storage */
extern void T172f62(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_item_storage */
extern void T172f61(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T305f2(T0* C, T6 a1);
/* TO_SPECIAL [XM_EIFFEL_ENTITY_DEF].make_area */
extern T0* T367c2(T6 a1);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T300c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].default_create */
extern T0* T305c3(void);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].default_capacity */
extern T6 T172f31(T0* C);
/* XM_EIFFEL_PARSER.make_parser */
extern void T101f207(T0* C);
/* XM_EIFFEL_PARSER.yy_build_parser_tables */
extern void T101f211(T0* C);
/* XM_EIFFEL_PARSER.yycheck_template */
extern unsigned char ge1447os5881;
extern T0* ge1447ov5881;
extern T0* T101f104(T0* C);
/* XM_EIFFEL_PARSER.yyfixed_array */
extern T0* T101f181(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytable_template */
extern unsigned char ge1447os5880;
extern T0* ge1447ov5880;
extern T0* T101f92(T0* C);
/* XM_EIFFEL_PARSER.yypgoto_template */
extern unsigned char ge1447os5879;
extern T0* ge1447ov5879;
extern T0* T101f90(T0* C);
/* XM_EIFFEL_PARSER.yypact_template */
extern unsigned char ge1447os5878;
extern T0* ge1447ov5878;
extern T0* T101f88(T0* C);
/* XM_EIFFEL_PARSER.yydefgoto_template */
extern unsigned char ge1447os5877;
extern T0* ge1447ov5877;
extern T0* T101f86(T0* C);
/* XM_EIFFEL_PARSER.yydefact_template */
extern unsigned char ge1447os5876;
extern T0* ge1447ov5876;
extern T0* T101f84(T0* C);
/* XM_EIFFEL_PARSER.yytypes2_template */
extern unsigned char ge1447os5875;
extern T0* ge1447ov5875;
extern T0* T101f171(T0* C);
/* XM_EIFFEL_PARSER.yytypes1_template */
extern unsigned char ge1447os5874;
extern T0* ge1447ov5874;
extern T0* T101f155(T0* C);
/* XM_EIFFEL_PARSER.yyr1_template */
extern unsigned char ge1447os5873;
extern T0* ge1447ov5873;
extern T0* T101f136(T0* C);
/* XM_EIFFEL_PARSER.yytranslate_template */
extern unsigned char ge1447os5872;
extern T0* ge1447ov5872;
extern T0* T101f125(T0* C);
/* XM_EIFFEL_PARSER.yy_create_value_stacks */
extern void T101f210(T0* C);
/* XM_EXPAT_PARSER_FACTORY.new_expat_parser */
extern T0* T100f2(T0* C);
/* XM_EXPAT_PARSER_FACTORY.is_expat_parser_available */
extern T1 T100f1(T0* C);
/* XM_EXPAT_PARSER_FACTORY.default_create */
extern T0* T100c3(void);
/* ET_XACE_VALIDATOR.make */
extern T0* T97c30(T0* a1);
/* ET_XACE_PREPROCESSOR.make */
extern T0* T98c10(T0* a1, T0* a2);
/* ET_XACE_LIBRARY_CONFIG_PARSER.set_parsed_libraries */
extern void T82f251(T0* C, T0* a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.make_with_variables_and_factory */
extern void T82f250(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_CONFIG_PARSER.make_with_variables_and_factory */
extern T0* T82c250(T0* a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].set_key_equality_tester */
extern void T99f39(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [ET_XACE_LIBRARY_CONFIG, STRING_8].internal_set_equality_tester */
extern void T162f6(T0* C, T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_map */
extern T0* T99c37(T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_with_equality_testers */
extern void T99f40(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [ET_XACE_LIBRARY_CONFIG, STRING_8].make */
extern T0* T162c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [ET_XACE_LIBRARY_CONFIG, STRING_8].new_cursor */
extern T0* T162f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8].make */
extern T0* T289c3(T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].new_cursor */
extern T0* T99f32(T0* C);
/* DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY_CONFIG, STRING_8].make */
extern T0* T164c4(T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_sparse_container */
extern void T99f47(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_slots */
extern void T99f51(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_clashes */
extern void T99f50(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_key_storage */
extern void T99f49(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_item_storage */
extern void T99f48(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY_CONFIG].make */
extern T0* T166f1(T0* C, T6 a1);
/* TO_SPECIAL [ET_XACE_LIBRARY_CONFIG].make_area */
extern T0* T290c2(T6 a1);
/* SPECIAL [ET_XACE_LIBRARY_CONFIG].make */
extern T0* T165c4(T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY_CONFIG].default_create */
extern T0* T166c3(void);
/* ET_XACE_AST_FACTORY.make */
extern T0* T89c10(void);
/* GEXACE_LIBRARY_COMMAND.execute */
extern void T40f15(T0* C);
/* GEXACE_LIBRARY_COMMAND.execute_generators */
extern void T40f16(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].forth */
extern void T64f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].cursor_forth */
extern void T46f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].add_traversing_cursor */
extern void T46f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].set_next_cursor */
extern void T64f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].remove_traversing_cursor */
extern void T46f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].set */
extern void T64f10(T0* C, T0* a1, T1 a2, T1 a3);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_cannot_write_file_error */
extern void T28f17(T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.make */
extern T0* T87c7(T0* a1);
/* KL_TEXT_OUTPUT_FILE.close */
extern void T81f23(T0* C);
/* KL_TEXT_OUTPUT_FILE.is_open_write */
extern T1 T81f12(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
extern T1 T81f8(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T81f22(T0* C);
/* KL_TEXT_OUTPUT_FILE.is_closed */
extern T1 T81f13(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_write */
extern void T81f26(T0* C);
/* KL_TEXT_OUTPUT_FILE.default_pointer */
extern T14 T81f17(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T81f26p1(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_open */
extern T14 T81f18(T0* C, T14 a1, T6 a2);
/* KL_TEXT_OUTPUT_FILE.make */
extern T0* T81c20(T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_make */
extern void T81f24(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].item */
extern T0* T64f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].start */
extern void T64f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].cursor_start */
extern void T46f10(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].cursor_off */
extern T1 T46f7(T0* C, T0* a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.parse_file */
extern void T82f249(T0* C, T0* a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.new_library */
extern T0* T82f12(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_CONFIG_PARSER.tokens */
extern T0* T82f14(T0* C);
/* ET_XACE_LIBRARY_CONFIG_PARSER.set_ve */
extern void T82f248(T0* C, T1 a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.set_shallow */
extern void T82f247(T0* C, T1 a1);
/* ET_XACE_LIBRARY_CONFIG_PARSER.make_with_variables */
extern T0* T82c246(T0* a1, T0* a2);
/* GEXACE_SYSTEM_COMMAND.execute */
extern void T36f15(T0* C);
/* GEXACE_SYSTEM_COMMAND.execute_generators */
extern void T36f16(T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG_PARSER.parse_file */
extern void T77f251(T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG_PARSER.new_system */
extern T0* T77f12(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.fill_system */
extern void T77f253(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_SYSTEM_CONFIG_PARSER.fill_externals */
extern void T77f255(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_SYSTEM_CONFIG_PARSER.new_export */
extern T0* T77f142(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.new_exported_feature */
extern T0* T77f245(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_alias */
extern T0* T77f247(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_feature */
extern T0* T77f244(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_export */
extern T0* T77f141(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_include_dir */
extern T0* T77f140(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_location */
extern T0* T77f139(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_link_library */
extern T0* T77f138(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_external */
extern T0* T77f27(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.new_options */
extern T0* T77f26(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.fill_options */
extern void T77f254(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_debug */
extern T0* T77f137(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_optimize */
extern T0* T77f136(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_check */
extern T0* T77f134(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_loop */
extern T0* T77f131(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_invariant */
extern T0* T77f129(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_ensure */
extern T0* T77f127(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_enable */
extern T0* T77f125(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_require */
extern T0* T77f124(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.is_false */
extern T1 T77f123(T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG_PARSER.is_true */
extern T1 T77f122(T0* C, T0* a1);
/* ET_XACE_SYSTEM_CONFIG_PARSER.option_codes */
extern T0* T77f29(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.string_equality_tester */
extern T0* T77f13(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_value */
extern T0* T77f28(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_option */
extern T0* T77f25(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.new_mount */
extern T0* T77f24(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_SYSTEM_CONFIG_PARSER.execution_environment */
extern T0* T77f147(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_prefix */
extern T0* T77f145(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_mount */
extern T0* T77f23(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.new_cluster */
extern T0* T77f22(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_SYSTEM_CONFIG_PARSER.new_class */
extern T0* T77f146(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.new_feature */
extern T0* T77f246(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_relative */
extern T0* T77f144(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_abstract */
extern T0* T77f143(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_cluster */
extern T0* T77f20(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.string_ */
extern T0* T77f19(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_creation */
extern T0* T77f18(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_class */
extern T0* T77f17(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_root */
extern T0* T77f16(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_name */
extern T0* T77f15(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.tokens */
extern T0* T77f14(T0* C);
/* ET_XACE_SYSTEM_CONFIG_PARSER.set_ve */
extern void T77f250(T0* C, T1 a1);
/* ET_XACE_SYSTEM_CONFIG_PARSER.set_shallow */
extern void T77f249(T0* C, T1 a1);
/* ET_XACE_SYSTEM_CONFIG_PARSER.make_with_variables */
extern T0* T77c248(T0* a1, T0* a2);
/* ET_XACE_SYSTEM_CONFIG_PARSER.make_with_variables_and_factory */
extern void T77f252(T0* C, T0* a1, T0* a2, T0* a3);
/* GEXACE_VALIDATE_COMMAND.set_xace_filename */
extern void T41f8(T0* C, T0* a1);
/* GEXACE_LIBRARY_COMMAND.set_xace_filename */
extern void T40f14(T0* C, T0* a1);
/* GEXACE_SYSTEM_COMMAND.set_xace_filename */
extern void T36f14(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.error_position */
extern T0* T210f57(T0* C);
/* XM_DEFAULT_POSITION.make */
extern T0* T168c7(T0* a1, T6 a2, T6 a3, T6 a4);
/* XM_EIFFEL_SCANNER_DTD.error_position */
extern T0* T208f55(T0* C);
/* XM_EIFFEL_ENTITY_DEF.error_position */
extern T0* T204f56(T0* C);
/* XM_EIFFEL_SCANNER.error_position */
extern T0* T167f63(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.end_of_file */
extern T1 T210f60(T0* C);
/* XM_EIFFEL_SCANNER_DTD.end_of_file */
extern T1 T208f61(T0* C);
/* XM_EIFFEL_ENTITY_DEF.end_of_file */
extern T1 T204f59(T0* C);
/* XM_EIFFEL_SCANNER.end_of_file */
extern T1 T167f65(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_applicable_encoding */
extern T1 T210f61(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_applicable_encoding */
extern T1 T235f16(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_valid_encoding */
extern T1 T235f9(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.is_applicable_encoding */
extern T1 T208f48(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.is_applicable_encoding */
extern T1 T204f60(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.is_applicable_encoding */
extern T1 T167f66(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.start_condition */
extern T6 T210f62(T0* C);
/* XM_EIFFEL_SCANNER_DTD.start_condition */
extern T6 T208f50(T0* C);
/* XM_EIFFEL_ENTITY_DEF.start_condition */
extern T6 T204f61(T0* C);
/* XM_EIFFEL_SCANNER.start_condition */
extern T6 T167f43(T0* C);
/* ET_XACE_ECF_GENERATOR.default_system_output_filename */
extern unsigned char ge1275os2681;
extern T0* ge1275ov2681;
extern T0* T45f5(T0* C);
/* ET_XACE_ACE_GENERATOR.default_system_output_filename */
extern unsigned char ge1274os2681;
extern T0* ge1274ov2681;
extern T0* T44f5(T0* C);
/* ET_XACE_XACE_GENERATOR.default_system_output_filename */
extern unsigned char ge1277os2681;
extern T0* ge1277ov2681;
extern T0* T43f5(T0* C);
/* ET_XACE_ECF_GENERATOR.default_library_output_filename */
extern unsigned char ge1275os2682;
extern T0* ge1275ov2682;
extern T0* T45f6(T0* C);
/* ET_XACE_ACE_GENERATOR.default_library_output_filename */
extern unsigned char ge1274os2682;
extern T0* ge1274ov2682;
extern T0* T44f6(T0* C);
/* ET_XACE_XACE_GENERATOR.default_library_output_filename */
extern unsigned char ge1277os2682;
extern T0* ge1277ov2682;
extern T0* T43f6(T0* C);
/* ET_XACE_INVALID_EXPRESSION_ERROR.default_message */
extern T0* T324f5(T0* C);
/* ET_XACE_INVALID_EXPRESSION_ERROR.message */
extern T0* T324f3(T0* C, T0* a1);
/* ET_XACE_INVALID_EXPRESSION_ERROR.arguments */
extern T0* T324f6(T0* C);
/* ARRAY [STRING_8].valid_index */
extern T1 T63f4(T0* C, T6 a1);
/* ET_XACE_INVALID_EXPRESSION_ERROR.string_ */
extern T0* T324f4(T0* C);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.default_message */
extern T0* T323f5(T0* C);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.message */
extern T0* T323f3(T0* C, T0* a1);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.arguments */
extern T0* T323f6(T0* C);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.string_ */
extern T0* T323f4(T0* C);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.default_message */
extern T0* T223f5(T0* C);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.message */
extern T0* T223f3(T0* C, T0* a1);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.arguments */
extern T0* T223f6(T0* C);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.string_ */
extern T0* T223f4(T0* C);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.default_message */
extern T0* T222f5(T0* C);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.message */
extern T0* T222f3(T0* C, T0* a1);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.arguments */
extern T0* T222f6(T0* C);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.string_ */
extern T0* T222f4(T0* C);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.default_message */
extern T0* T221f5(T0* C);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.message */
extern T0* T221f3(T0* C, T0* a1);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.arguments */
extern T0* T221f6(T0* C);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.string_ */
extern T0* T221f4(T0* C);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.default_message */
extern T0* T220f5(T0* C);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.message */
extern T0* T220f3(T0* C, T0* a1);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.arguments */
extern T0* T220f6(T0* C);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.string_ */
extern T0* T220f4(T0* C);
/* ET_XACE_MISSING_ELEMENT_ERROR.default_message */
extern T0* T219f5(T0* C);
/* ET_XACE_MISSING_ELEMENT_ERROR.message */
extern T0* T219f3(T0* C, T0* a1);
/* ET_XACE_MISSING_ELEMENT_ERROR.arguments */
extern T0* T219f6(T0* C);
/* ET_XACE_MISSING_ELEMENT_ERROR.string_ */
extern T0* T219f4(T0* C);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.default_message */
extern T0* T218f5(T0* C);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.message */
extern T0* T218f3(T0* C, T0* a1);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.arguments */
extern T0* T218f6(T0* C);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.string_ */
extern T0* T218f4(T0* C);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.default_message */
extern T0* T217f5(T0* C);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.message */
extern T0* T217f3(T0* C, T0* a1);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.arguments */
extern T0* T217f6(T0* C);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.string_ */
extern T0* T217f4(T0* C);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.default_message */
extern T0* T216f5(T0* C);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.message */
extern T0* T216f3(T0* C, T0* a1);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.arguments */
extern T0* T216f6(T0* C);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.string_ */
extern T0* T216f4(T0* C);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.default_message */
extern T0* T215f5(T0* C);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.message */
extern T0* T215f3(T0* C, T0* a1);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.arguments */
extern T0* T215f6(T0* C);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.string_ */
extern T0* T215f4(T0* C);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.default_message */
extern T0* T214f5(T0* C);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.message */
extern T0* T214f3(T0* C, T0* a1);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.arguments */
extern T0* T214f6(T0* C);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.default_message */
extern T0* T213f5(T0* C);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.message */
extern T0* T213f3(T0* C, T0* a1);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.arguments */
extern T0* T213f6(T0* C);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.string_ */
extern T0* T213f4(T0* C);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.default_message */
extern T0* T212f5(T0* C);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.message */
extern T0* T212f3(T0* C, T0* a1);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.arguments */
extern T0* T212f6(T0* C);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.string_ */
extern T0* T212f4(T0* C);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.default_message */
extern T0* T211f5(T0* C);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.message */
extern T0* T211f3(T0* C, T0* a1);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.arguments */
extern T0* T211f6(T0* C);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.string_ */
extern T0* T211f4(T0* C);
/* ET_XACE_NOT_XACE_FILE_ERROR.default_message */
extern T0* T108f5(T0* C);
/* ET_XACE_NOT_XACE_FILE_ERROR.message */
extern T0* T108f3(T0* C, T0* a1);
/* ET_XACE_NOT_XACE_FILE_ERROR.arguments */
extern T0* T108f6(T0* C);
/* ET_XACE_NOT_XACE_FILE_ERROR.string_ */
extern T0* T108f4(T0* C);
/* UT_MESSAGE.default_message */
extern T0* T107f5(T0* C);
/* UT_MESSAGE.message */
extern T0* T107f3(T0* C, T0* a1);
/* UT_MESSAGE.arguments */
extern T0* T107f6(T0* C);
/* UT_MESSAGE.string_ */
extern T0* T107f4(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
extern T0* T87f5(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
extern T0* T87f3(T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.arguments */
extern T0* T87f6(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
extern T0* T87f4(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.default_message */
extern T0* T86f5(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.message */
extern T0* T86f3(T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.arguments */
extern T0* T86f6(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.string_ */
extern T0* T86f4(T0* C);
/* UT_USAGE_MESSAGE.default_message */
extern T0* T34f2(T0* C);
/* UT_USAGE_MESSAGE.message */
extern T0* T34f4(T0* C, T0* a1);
/* UT_USAGE_MESSAGE.arguments */
extern T0* T34f6(T0* C);
/* UT_USAGE_MESSAGE.string_ */
extern T0* T34f5(T0* C);
extern T0* GE_ma230(T6 c, T6 n, ...);
extern T0* GE_ma63(T6 c, T6 n, ...);
extern T0* GE_ma157(T6 c, T6 n, ...);
extern T0* ge139ov3023;
extern T0* ge99ov2953;
extern T0* ge52ov2121;
extern T0* ge52ov2122;
extern T0* ge188ov3970;
extern T0* ge198ov10117;
extern T0* ge1455ov9383;
extern T0* ge1455ov9384;
extern T0* ge125ov4775;
extern T0* ge1446ov10125;
extern T0* ge1446ov10127;
extern T0* ge1398ov5405;
extern T0* ge1379ov9228;
extern T0* ge1379ov9227;
extern T0* ge1251ov4421;
extern T0* ge1251ov4434;
extern T0* ge1251ov4436;
extern T0* ge1251ov4413;
extern T0* ge1251ov4439;
extern T0* ge1251ov4423;
extern T0* ge1251ov4417;
extern T0* ge1251ov4428;
extern T0* ge1251ov4430;
extern T0* ge1251ov4429;
extern T0* ge144ov7554;
extern T0* ge1251ov4425;
extern T0* ge1251ov4414;
extern T0* ge1251ov4420;
extern T0* ge1251ov4435;
extern T0* ge1251ov4422;
extern T0* ge1251ov4424;
extern T0* ge232ov3023;
extern T0* ge1251ov4426;
extern T0* ge1251ov4415;
extern T0* ge1251ov4427;
extern T0* ge1441ov5628;
extern T0* ge1441ov5627;
extern T0* ge1282ov4225;
extern T0* ge1251ov4438;
extern T0* ge1251ov4419;
extern T0* ge1251ov4433;
extern T0* ge1251ov4432;
extern T0* ge1251ov4437;
extern T0* ge1251ov4416;
extern T0* ge1251ov4431;
extern T0* ge1251ov4418;
extern T0* ge1251ov4441;
extern T0* ge1282ov4224;
extern T0* ge1282ov4223;
extern T0* ge1251ov4226;
extern T0* ge1251ov4227;
extern T0* ge1251ov4228;
extern T0* ge1251ov4229;
extern T0* ge1251ov4230;
extern T0* ge1251ov4231;
extern T0* ge1251ov4232;
extern T0* ge1251ov4233;
extern T0* ge1251ov4234;
extern T0* ge1251ov4235;
extern T0* ge1251ov4236;
extern T0* ge1251ov4237;
extern T0* ge1251ov4238;
extern T0* ge1251ov4239;
extern T0* ge1251ov4240;
extern T0* ge1251ov4241;
extern T0* ge1251ov4242;
extern T0* ge1251ov4243;
extern T0* ge1251ov4244;
extern T0* ge1251ov4245;
extern T0* ge1251ov4246;
extern T0* ge1251ov4247;
extern T0* ge1251ov4248;
extern T0* ge1251ov4249;
extern T0* ge1251ov4250;
extern T0* ge1251ov4251;
extern T0* ge1251ov4252;
extern T0* ge1251ov4253;
extern T0* ge1251ov4254;
extern T0* ge1251ov4255;
extern T0* ge1251ov4256;
extern T0* ge1251ov4257;
extern T0* ge1251ov4258;
extern T0* ge1251ov4259;
extern T0* ge1251ov4260;
extern T0* ge1251ov4261;
extern T0* ge1251ov4262;
extern T0* ge1251ov4263;
extern T0* ge1251ov4264;
extern T0* ge1251ov4265;
extern T0* ge1251ov4266;
extern T0* ge1251ov4267;
extern T0* ge1251ov4268;
extern T0* ge1251ov4269;
extern T0* ge1251ov4270;
extern T0* ge1251ov4271;
extern T0* ge1251ov4272;
extern T0* ge1251ov4273;
extern T0* ge1251ov4274;
extern T0* ge1251ov4275;
extern T0* ge1251ov4276;
extern T0* ge1251ov4277;
extern T0* ge1251ov4278;
extern T0* ge1251ov4279;
extern T0* ge1251ov4280;
extern T0* ge1251ov4281;
extern T0* ge1251ov4282;
extern T0* ge1251ov4283;
extern T0* ge1251ov4284;
extern T0* ge1251ov4285;
extern T0* ge1251ov4286;
extern T0* ge1251ov4287;
extern T0* ge1251ov4288;
extern T0* ge1251ov4289;
extern T0* ge1251ov4290;
extern T0* ge1251ov4291;
extern T0* ge1251ov4292;
extern T0* ge1251ov4293;
extern T0* ge1251ov4294;
extern T0* ge1251ov4295;
extern T0* ge1251ov4296;
extern T0* ge1251ov4297;
extern T0* ge1251ov4298;
extern T0* ge1251ov4299;
extern T0* ge1251ov4300;
extern T0* ge1251ov4301;
extern T0* ge1251ov4302;
extern T0* ge1251ov4303;
extern T0* ge1251ov4304;
extern T0* ge1251ov4305;
extern T0* ge1251ov4306;
extern T0* ge1251ov4307;
extern T0* ge1251ov4308;
extern T0* ge1251ov4309;
extern T0* ge1251ov4310;
extern T0* ge1251ov4311;
extern T0* ge1251ov4312;
extern T0* ge1251ov4313;
extern T0* ge1251ov4314;
extern T0* ge1251ov4315;
extern T0* ge1251ov4316;
extern T0* ge1251ov4317;
extern T0* ge1251ov4318;
extern T0* ge129ov3023;
extern T0* ge1241ov6547;
extern T0* ge957ov8392;
extern T0* ge957ov8141;
extern T0* ge957ov8133;
extern T0* ge957ov8389;
extern T0* ge957ov8128;
extern T0* ge957ov8383;
extern T0* ge957ov8118;
extern T0* ge957ov8378;
extern T0* ge957ov8111;
extern T0* ge957ov8377;
extern T0* ge957ov8107;
extern T0* ge957ov8374;
extern T0* ge957ov8104;
extern T0* ge957ov8140;
extern T0* ge957ov8139;
extern T0* ge957ov8138;
extern T0* ge957ov8137;
extern T0* ge957ov8303;
extern T0* ge957ov8290;
extern T0* ge957ov8136;
extern T0* ge957ov8135;
extern T0* ge957ov8134;
extern T0* ge957ov8132;
extern T0* ge957ov8131;
extern T0* ge957ov8391;
extern T0* ge957ov8130;
extern T0* ge957ov8390;
extern T0* ge957ov8129;
extern T0* ge957ov8127;
extern T0* ge957ov8126;
extern T0* ge957ov8388;
extern T0* ge957ov8125;
extern T0* ge957ov8124;
extern T0* ge957ov8123;
extern T0* ge957ov8387;
extern T0* ge957ov8122;
extern T0* ge957ov8386;
extern T0* ge957ov8121;
extern T0* ge957ov8385;
extern T0* ge957ov8120;
extern T0* ge957ov8384;
extern T0* ge957ov8119;
extern T0* ge957ov8117;
extern T0* ge957ov8382;
extern T0* ge957ov8115;
extern T0* ge957ov8381;
extern T0* ge957ov8114;
extern T0* ge957ov8380;
extern T0* ge957ov8113;
extern T0* ge957ov8379;
extern T0* ge957ov8112;
extern T0* ge957ov8110;
extern T0* ge957ov8109;
extern T0* ge957ov8108;
extern T0* ge957ov8376;
extern T0* ge957ov8106;
extern T0* ge957ov8375;
extern T0* ge957ov8105;
extern T0* ge957ov8373;
extern T0* ge957ov8103;
extern T0* ge957ov8102;
extern T0* ge957ov8100;
extern T0* ge957ov8099;
extern T0* ge957ov8280;
extern T0* ge957ov8101;
extern T0* ge1247ov5380;
extern T0* ge1448ov6254;
extern T0* ge1448ov6216;
extern T0* ge1448ov6214;
extern T0* ge1448ov6255;
extern T0* ge1448ov6227;
extern T0* ge1448ov6226;
extern T0* ge1448ov6237;
extern T0* ge1448ov6231;
extern T0* ge1448ov6230;
extern T0* ge1448ov6229;
extern T0* ge1448ov6235;
extern T0* ge1448ov6234;
extern T0* ge1448ov6236;
extern T0* ge1448ov6213;
extern T0* ge1448ov6239;
extern T0* ge1448ov6248;
extern T0* ge1451ov5977;
extern T0* ge1451ov5975;
extern T0* ge1451ov5976;
extern T0* ge1448ov6249;
extern T0* ge1448ov6250;
extern T0* ge1448ov6253;
extern T0* ge1448ov6251;
extern T0* ge1448ov6252;
extern T0* ge1448ov6246;
extern T0* ge1444ov9832;
extern T0* ge1444ov9833;
extern T0* ge1448ov6219;
extern T0* ge1448ov6242;
extern T0* ge1448ov6262;
extern T0* ge1448ov6263;
extern T0* ge1448ov6264;
extern T0* ge1448ov6257;
extern T0* ge1448ov6240;
extern T0* ge1448ov6241;
extern T0* ge1448ov6243;
extern T0* ge1448ov6247;
extern T0* ge121ov4795;
extern T0* ge1446ov10124;
extern T0* ge1446ov10126;
extern T0* ge1260ov2659;
extern T0* ge1254ov2659;
extern T0* ge1270ov2659;
extern T0* ge1267ov2659;
extern T0* ge1269ov2659;
extern T0* ge1266ov2659;
extern T0* ge1262ov2659;
extern T0* ge1261ov2659;
extern T0* ge1273ov2659;
extern T0* ge1257ov2659;
extern T0* ge1268ov2659;
extern T0* ge1272ov2659;
extern T0* ge1264ov2659;
extern T0* ge1255ov2659;
extern T0* ge1263ov2659;
extern T0* ge1265ov2659;
extern T0* ge1294ov2659;
extern T0* ge1291ov2659;
extern T0* ge1290ov2659;
extern T0* ge1300ov2659;
extern void GE_const_init(void);
extern EIF_TYPE GE_types[];

#ifdef __cplusplus
}
#endif


/*
	description:

		"C functions used to implement class EXCEPTIONS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_EXCEPT_H
#define EIF_EXCEPT_H

#include <errno.h>

#ifdef __cplusplus
extern "C" {
#endif

extern void eraise(char* name, long code);
extern void esdie(int code);
extern EIF_REFERENCE eename(long except);
extern char* eeltag(void);
extern char* eelrout(void);
extern char* eelclass(void);
extern long eelcode(void);
extern EIF_REFERENCE stack_trace_string(void);
extern char* eeotag(void);
extern long eeocode(void);
extern char* eeorout(void);
extern char* eeoclass(void);
extern void eecatch(long code);
extern void eeignore(long code);
extern void eetrace(char b);

#ifdef EIF_WINDOWS
/* Needed to compile some code at AXAR */
extern void set_windows_exception_filter();
#endif

/* Raises an Eiffel exception of the given code with no associated tag. */
extern void xraise(int code);
/* Raise 'Operating system error' exception. */
extern void esys(void);
/* As a special case, an I/O error is raised when a system call which is I/O bound fails. */
extern void eise_io(char *tag);

/*
 * Predefined exception numbers. Value cannot start at 0 because this may need
 * a propagation via longjmp and USG implementations turn out a 0 to be 1.
 */
#define EN_VOID		1			/* Feature applied to void reference */
#define EN_MEM		2			/* No more memory */
#define EN_PRE		3			/* Pre-condition violated */
#define EN_POST		4			/* Post-condition violated */
#define EN_FLOAT	5			/* Floating point exception (signal SIGFPE) */
#define EN_CINV		6			/* Class invariant violated */
#define EN_CHECK	7			/* Assertion violated */
#define EN_FAIL		8			/* Routine failure */
#define EN_WHEN		9			/* Unmatched inspect value */
#define EN_VAR		10			/* Non-decreasing loop variant */
#define EN_LINV		11			/* Loop invariant violated */
#define EN_SIG		12			/* Operating system signal */
#define EN_BYE		13			/* Eiffel run-time panic */
#define EN_RESC		14			/* Exception in rescue clause */
#define EN_OMEM		15			/* Out of memory (cannot be ignored) */
#define EN_RES		16			/* Resumption failed (retry did not succeed) */
#define EN_CDEF		17			/* Create on deferred */
#define EN_EXT		18			/* External event */
#define EN_VEXP		19			/* Void assigned to expanded */
#define EN_HDLR		20			/* Exception in signal handler */
#define EN_IO		21			/* I/O error */
#define EN_SYS		22			/* Operating system error */
#define EN_RETR		23			/* Retrieval error */
#define EN_PROG		24			/* Developer exception */
#define EN_FATAL	25			/* Eiffel run-time fatal error */
#define EN_DOL		26			/* $ applied to melted feature */
#define EN_ISE_IO	27			/* I/O error raised by the ISE Eiffel runtime */
#define EN_COM		28			/* COM error raised by EiffelCOM runtime */
#define EN_RT_CHECK	29			/* Runtime check error such as out-of-bound array access */

#ifdef __cplusplus
}
#endif

#endif
/*
	description:

		"C functions used to implement class FILE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2007, Eric Bezault and others"
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

/*
 * Create directory `dirname'.
 */
extern void file_mkdir(char* dirname);

/*
 * Rename file `from' into `to'.
 */
extern void file_rename(char* from, char* to);

/*
 * Link file `from' into `to'.
 */
extern void file_link(char *from, char *to);

/*
 * Delete file or directory `name'.
 */
extern void file_unlink(char *name);

/*
 * Open file `name' with the corresponding type `how'.
 */
extern EIF_POINTER file_open(char *name, int how);

/*
 * Open file `fd' with the corresponding type `how'.
 */
extern EIF_POINTER file_dopen(int fd, int how);

/*
 * Reopen file `name' with the corresponding type `how' and substitute that
 * to the old stream described by `old'. This is useful to redirect 'stdout'
 * to another place, for instance.
 */
extern EIF_POINTER file_reopen(char *name, int how, FILE *old);

/*
 * Close the file.
 */
extern void file_close(FILE *fp);

/*
 * Flush data held in stdio buffer.
 */
extern void file_flush(FILE *fp);

/*
 * Return the associated file descriptor.
 */
extern EIF_INTEGER file_fd(FILE *f);

/*
 * Get a character from `f'.
 */
extern EIF_CHARACTER file_gc(FILE *f);

/*
 * Get a string from `f' and fill it into `s' (at most `bound' characters),
 * with `start' being the amount of bytes already stored within s. This
 * means we really have to read (bound - start) characters.
 */
extern EIF_INTEGER file_gs(FILE *f, char *s, EIF_INTEGER bound, EIF_INTEGER start);

/*
 * Read min (bound, remaining bytes in file) characters into `s' and
 * return the number of characters read.
 */
extern EIF_INTEGER file_gss(FILE *f, char *s, EIF_INTEGER bound);

/*
 * Get a word from `f' and fill it into `s' (at most `bound' characters),
 * with `start' being the amount of bytes already stored within s. This
 * means we really have to read (bound - start) characters. Any leading
 * spaces are skipped.
 */
extern EIF_INTEGER file_gw(FILE *f, char *s, EIF_INTEGER bound, EIF_INTEGER start);

/*
 * Look ahead one character. If EOF, return 0.
 */
extern EIF_CHARACTER file_lh(FILE *f);

/*
 * Size of file `fp'.
 */
extern EIF_INTEGER eif_file_size(FILE *fp);

/*
 * Read upto next input line.
 */
extern void file_tnil(FILE *f);

/*
 * Current position within file.
 */
extern EIF_INTEGER file_tell(FILE *f);

/*
 * Touch file `name' by setting both access and modification time to the
 * current time stamp. This external function exists only because there
 * is no way within UNIX_FILE to get the current time stamp. Otherwise,
 * we could simply call file_utime.
 */
extern void file_touch(char *name);

/*
 * Modify the modification and/or the access time stored in the file's
 * inode. The 'how' parameter tells which attributes should be set.
 */
extern void file_utime(char *name, time_t stamp, int how);

/*
 * This is an encapsulation of the stat() system call. The routine either
 * succeeds and returns or fails and raises the appropriate exception.
 */
extern void file_stat(char *path, struct stat *buf);

/*
 * Change permissions of file `name', using an interface like chmod(1).
 * The flag is true if permissions are to be added, 0 to remove them.
 */
extern void file_perm(char *name, char *who, char *what, int flag);

/*
 * Change permission mode on file `path'.
 */
extern void file_chmod(char *path, int mode);

/*
 * Change the owner of the file to `uid'.
 */
extern void file_chown(char *name, int uid);

/*
 * Change the group of the file to `gid'.
 */
extern void file_chgrp(char *name, int gid);

/*
 * Put new_line onto `f'.
 */
extern void file_tnwl(FILE *f);

/*
 * Append a copy of `other' to `f'.
 */
extern void file_append(FILE *f, FILE *other, EIF_INTEGER l);

/*
 * Write string `str' on `f'.
 */
extern void file_ps(FILE *f, char *str, EIF_INTEGER len);

/*
 * Write character `c' on `f'.
 */
extern void file_pc(FILE *f, char c);

/*
 * Go to absolute position `pos' counted from start.
 */
extern void file_go(FILE *f, EIF_INTEGER pos);

/*
 * Go to absolute position `pos' counted from end.
 */
extern void file_recede(FILE *f, EIF_INTEGER pos);

/*
 * Go to absolute position `pos' counted from current position.
 */
extern void file_move(FILE *f, EIF_INTEGER pos);

/*
 * End of file.
 */
extern EIF_BOOLEAN file_feof(FILE *fp);

/*
 * Test whether file exists or not. If `name' represents a symbolic link,
 * it will check that pointed file does exist.
 */
extern EIF_BOOLEAN file_exists(char *name);

/*
 * Test whether file exists or not without following the symbolic link
 * if `name' represents one.
 */
extern EIF_BOOLEAN file_path_exists(char *name);

/*
 * Check whether access permission `op' are possible on file `name' using
 * real UID and real GID. This is probably only useful to setuid or setgid
 * programs.
 */
extern EIF_BOOLEAN file_access(char *name, EIF_INTEGER op);

/*
 * Check whether the file `path' may be created: we need write permissions
 * in the parent directory and there must not be any file bearing that name
 * with no write permissions...
 */
extern EIF_BOOLEAN file_creatable(char *path, EIF_INTEGER length);

/*
 * Get an integer from `f'.
 */
extern EIF_INTEGER file_gi(FILE *f);

/*
 * Get a real from `f'.
 */
extern EIF_REAL_32 file_gr(FILE *f);

/*
 * Get a double from `f'.
 */
extern EIF_REAL_64 file_gd(FILE *f);

/*
 * Write `number' on `f'.
 */
extern void file_pi(FILE *f, EIF_INTEGER number);

/*
 * Write `number' on `f'.
 */
extern void file_pr(FILE *f, EIF_REAL_32 number);

/*
 * Write double `val' onto `f'.
 */
extern void file_pd(FILE *f, EIF_REAL_64 val);

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
extern EIF_BOOLEAN file_eaccess(struct stat *buf, int op);

/*
 * Perform the field dereferencing from the appropriate stat structure,
 * which Eiffel cannot do directly.
 */
extern EIF_INTEGER file_info(struct stat *buf, int op);

/*
 * Return the Eiffel string filled in with the name associated with `uid'
 * if found in /etc/passwd. Otherwise, return fill it in with the numeric
 * value.
 */
extern EIF_REFERENCE file_owner(int uid);

/*
 * Return the Eiffel string filled in with the name associated with `gid'
 * if found in /etc/group. Otherwise, return fill it in with the numeric
 * value.
 */
extern EIF_REFERENCE file_group(int gid);

/*
 * Get an integer from `f'.
 */
extern EIF_INTEGER file_gib(FILE* f);

/*
 * Get a real from `f'.
 */
extern EIF_REAL_32 file_grb(FILE* f);

/*
 * Get a double from `f'.
 */
extern EIF_REAL_64 file_gdb(FILE* f);

/*
 * Open file `name' with the corresponding type `how'.
 */
extern EIF_POINTER file_binary_open(char* name, int how);

/*
 * Open file `fd' with the corresponding type `how'.
 */
extern EIF_POINTER file_binary_dopen(int fd, int how);

/*
 * Reopen file `name' with the corresponding type `how' and substitute that
 * to the old stream described by `old'. This is useful to redirect 'stdout'
 * to another place, for instance.
 */
extern EIF_POINTER file_binary_reopen(char* name, int how, FILE* old);

/*
 * Write `number' on `f'.
 */
extern void file_pib(FILE* f, EIF_INTEGER number);

/*
 * Write `number' on `f'.
 */
extern void file_prb(FILE* f, EIF_REAL_32 number);

/*
 * Write double `val' onto `f'.
 */
extern void file_pdb(FILE* f, EIF_REAL_64 val);

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
extern EIF_CHARACTER console_separator(FILE* f);
extern void console_ps(FILE* f, char* str, EIF_INTEGER len);
extern void console_pr(FILE* f, EIF_REAL_32 number);
extern void console_pc(FILE* f, EIF_CHARACTER c);
extern void console_pd(FILE* f, EIF_REAL_64 val);
extern void console_pi(FILE* f, EIF_INTEGER number);
extern void console_tnwl(FILE* f);
extern EIF_CHARACTER console_readchar(FILE* f);
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

		"C functions used to implement class DIRECTORY"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_DIR_H
#define EIF_DIR_H

#ifdef __cplusplus
extern "C" {
#endif

extern void* dir_open (char* dirname);
extern EIF_REFERENCE dir_next (void* dir);
extern void dir_rewind (void* dir);
extern void dir_close (void* dir);
extern EIF_BOOLEAN eif_dir_exists (char* dirname);
extern EIF_BOOLEAN eif_dir_is_readable (char* dirname);
extern EIF_BOOLEAN eif_dir_is_writable (char* dirname);
extern EIF_BOOLEAN eif_dir_is_executable (char* dirname);
extern void eif_dir_delete (char* dirname);
extern EIF_CHARACTER eif_dir_separator(void);
extern EIF_REFERENCE dir_current(void);
extern EIF_INTEGER eif_chdir(char* path);

#ifdef __cplusplus
}
#endif

#endif
/*
	description:

		"C functions used to implement the main function"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_MAIN_H
#define EIF_MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_WINDOWS

#include <windows.h>

/*
	Used in WEL.
*/
extern HINSTANCE eif_hInstance;

#endif

/*
	Used by the ISE runtime to figure out whether the application
	was launched from EiffelStudio in workbench mode or not.
*/
extern int debug_mode;

#ifdef __cplusplus
}
#endif

#endif
#include <stdlib.h>
#include <string.h>
