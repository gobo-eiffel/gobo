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
	copyright: "Copyright (c) 2007, Eric Bezault and others"
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
#define GE_alloc(x) GE_null(GC_MALLOC(x))
#define GE_alloc_atomic(x) GE_null(GC_MALLOC_ATOMIC(x))

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
#define GE_alloc(x) GE_null(calloc((x),1))
#define GE_alloc_atomic(x) GE_null(calloc((x),1))

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

/* ET_XACE_ESD_GENERATOR */
typedef struct S46 T46;

/* ET_XACE_LOADPATH_GENERATOR */
typedef struct S47 T47;

/* ET_XACE_ACE_SE_GENERATOR */
typedef struct S48 T48;

/* ET_XACE_XACE_VE_GENERATOR */
typedef struct S49 T49;

/* DS_LINKED_LIST [ET_XACE_GENERATOR] */
typedef struct S50 T50;

/* KL_STRING_ROUTINES */
typedef struct S51 T51;

/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8] */
typedef struct S52 T52;

/* SPECIAL [STRING_8] */
typedef struct S54 T54;

/* SPECIAL [INTEGER_32] */
typedef struct S55 T55;

/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
typedef struct S56 T56;

/* KL_SPECIAL_ROUTINES [INTEGER_32] */
typedef struct S57 T57;

/* KL_SPECIAL_ROUTINES [STRING_8] */
typedef struct S58 T58;

/* DS_LINKABLE [GEXACE_COMMAND] */
typedef struct S59 T59;

/* KL_STANDARD_FILES */
typedef struct S61 T61;

/* KL_STDERR_FILE */
typedef struct S62 T62;

/* KL_STDOUT_FILE */
typedef struct S63 T63;

/* KL_NULL_TEXT_OUTPUT_STREAM */
typedef struct S64 T64;

/* DS_LINKABLE [STRING_8] */
typedef struct S66 T66;

/* ARRAY [STRING_8] */
typedef struct S67 T67;

/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR] */
typedef struct S68 T68;

/* DS_LINKABLE [ET_XACE_GENERATOR] */
typedef struct S69 T69;

/* UC_STRING */
typedef struct S71 T71;

/* KL_ANY_ROUTINES */
typedef struct S72 T72;

/* DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8] */
typedef struct S73 T73;

/* TO_SPECIAL [INTEGER_32] */
typedef struct S74 T74;

/* TO_SPECIAL [STRING_8] */
typedef struct S75 T75;

/* TYPED_POINTER [ANY] */
typedef struct S76 T76;

/* STRING_TO_INTEGER_CONVERTOR */
typedef struct S78 T78;

/* ET_XACE_SYSTEM_PARSER */
typedef struct S80 T80;

/* ET_XACE_SYSTEM */
typedef struct S81 T81;

/* KL_TEXT_INPUT_FILE */
typedef struct S82 T82;

/* KL_TEXT_OUTPUT_FILE */
typedef struct S84 T84;

/* ET_XACE_LIBRARY_PARSER */
typedef struct S85 T85;

/* ET_XACE_LIBRARY */
typedef struct S86 T86;

/* ET_XACE_PARSER */
typedef struct S87 T87;

/* UT_CANNOT_READ_FILE_ERROR */
typedef struct S89 T89;

/* UT_CANNOT_WRITE_TO_FILE_ERROR */
typedef struct S90 T90;

/* INTEGER_OVERFLOW_CHECKER */
typedef struct S91 T91;

/* ET_XACE_AST_FACTORY */
typedef struct S92 T92;

/* XM_DOCUMENT */
typedef struct S93 T93;

/* XM_ELEMENT */
typedef struct S94 T94;

/* XM_POSITION_TABLE */
typedef struct S95 T95;

/* XM_TREE_CALLBACKS_PIPE */
typedef struct S97 T97;

/* XM_STOP_ON_ERROR_FILTER */
typedef struct S98 T98;

/* XM_CALLBACKS_TO_TREE_FILTER */
typedef struct S99 T99;

/* ET_XACE_VALIDATOR */
typedef struct S100 T100;

/* ET_XACE_PREPROCESSOR */
typedef struct S101 T101;

/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8] */
typedef struct S102 T102;

/* XM_EXPAT_PARSER_FACTORY */
typedef struct S103 T103;

/* XM_EIFFEL_PARSER */
typedef struct S104 T104;

/* SPECIAL [NATURAL_8] */
typedef struct S109 T109;

/* UT_MESSAGE */
typedef struct S110 T110;

/* ET_XACE_NOT_XACE_FILE_ERROR */
typedef struct S111 T111;

/* ET_XACE_CLUSTERS */
typedef struct S112 T112;

/* ET_XACE_MOUNTED_LIBRARIES */
typedef struct S113 T113;

/* ET_XACE_OPTIONS */
typedef struct S114 T114;

/* DS_HASH_SET_CURSOR [STRING_8] */
typedef struct S115 T115;

/* DS_ARRAYED_LIST_CURSOR [STRING_8] */
typedef struct S116 T116;

/* DS_HASH_SET [STRING_8] */
typedef struct S117 T117;

/* DS_ARRAYED_LIST [STRING_8] */
typedef struct S118 T118;

/* DS_ARRAYED_LIST [ET_XACE_CLUSTER] */
typedef struct S119 T119;

/* ET_XACE_CLUSTER */
typedef struct S120 T120;

/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY] */
typedef struct S121 T121;

/* ET_XACE_MOUNTED_LIBRARY */
typedef struct S122 T122;

/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS] */
typedef struct S123 T123;

/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS] */
typedef struct S124 T124;

/* ET_XACE_CLASS_OPTIONS */
typedef struct S125 T125;

/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS] */
typedef struct S126 T126;

/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS] */
typedef struct S127 T127;

/* ET_XACE_FEATURE_OPTIONS */
typedef struct S128 T128;

/* ET_XACE_EXTERNALS */
typedef struct S129 T129;

/* ET_XACE_OPTION_NAMES */
typedef struct S130 T130;

/* DS_LINKED_LIST [ET_XACE_ASSEMBLY] */
typedef struct S131 T131;

/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY] */
typedef struct S132 T132;

/* ET_XACE_ASSEMBLY */
typedef struct S133 T133;

/* KL_UNIX_FILE_SYSTEM */
typedef struct S134 T134;

/* KL_EXECUTION_ENVIRONMENT */
typedef struct S135 T135;

/* DS_LINKED_LIST [ET_XACE_CLUSTER] */
typedef struct S136 T136;

/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER] */
typedef struct S137 T137;

/* TUPLE [ET_XACE_CLASS_OPTIONS] */
typedef struct S138 T138;

/* PROCEDURE [ET_XACE_ECF_GENERATOR, TUPLE [ET_XACE_CLASS_OPTIONS]] */
typedef struct S140 T140;

/* TUPLE [ET_XACE_ECF_GENERATOR, INTEGER_32, KI_TEXT_OUTPUT_STREAM] */
typedef struct S141 T141;

/* TUPLE [ET_XACE_FEATURE_OPTIONS] */
typedef struct S142 T142;

/* PROCEDURE [ET_XACE_ECF_GENERATOR, TUPLE [ET_XACE_FEATURE_OPTIONS]] */
typedef struct S143 T143;

/* TUPLE [ET_XACE_ECF_GENERATOR, STRING_8, INTEGER_32, KI_TEXT_OUTPUT_STREAM] */
typedef struct S144 T144;

/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8] */
typedef struct S146 T146;

/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING_8], STRING_8] */
typedef struct S147 T147;

/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE] */
typedef struct S148 T148;

/* ET_XACE_EXPORTED_FEATURE */
typedef struct S151 T151;

/* DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE] */
typedef struct S152 T152;

/* XM_ATTRIBUTE */
typedef struct S154 T154;

/* DS_LINKED_LIST_CURSOR [XM_NODE] */
typedef struct S155 T155;

/* DS_HASH_TABLE [INTEGER_32, STRING_8] */
typedef struct S157 T157;

/* UNIX_FILE_INFO */
typedef struct S160 T160;

/* SPECIAL [NATURAL_64] */
typedef struct S161 T161;

/* XM_NAMESPACE_RESOLVER */
typedef struct S162 T162;

/* SPECIAL [XM_CALLBACKS_FILTER] */
typedef struct S163 T163;

/* ARRAY [XM_CALLBACKS_FILTER] */
typedef struct S164 T164;

/* XM_CALLBACKS_NULL */
typedef struct S165 T165;

/* UT_TEMPLATE_EXPANDER */
typedef struct S167 T167;

/* DS_SPARSE_TABLE_KEYS [ET_XACE_LIBRARY, STRING_8] */
typedef struct S169 T169;

/* DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY, STRING_8] */
typedef struct S171 T171;

/* SPECIAL [ET_XACE_LIBRARY] */
typedef struct S172 T172;

/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY] */
typedef struct S173 T173;

/* XM_EIFFEL_SCANNER */
typedef struct S174 T174;

/* XM_DEFAULT_POSITION */
typedef struct S175 T175;

/* DS_BILINKED_LIST [XM_POSITION] */
typedef struct S177 T177;

/* DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
typedef struct S178 T178;

/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S179 T179;

/* XM_NULL_EXTERNAL_RESOLVER */
typedef struct S181 T181;

/* SPECIAL [ANY] */
typedef struct S182 T182;

/* KL_SPECIAL_ROUTINES [ANY] */
typedef struct S183 T183;

/* XM_EIFFEL_PARSER_NAME */
typedef struct S184 T184;

/* XM_EIFFEL_DECLARATION */
typedef struct S185 T185;

/* XM_DTD_EXTERNAL_ID */
typedef struct S186 T186;

/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
typedef struct S187 T187;

/* XM_DTD_ELEMENT_CONTENT */
typedef struct S188 T188;

/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S189 T189;

/* XM_DTD_ATTRIBUTE_CONTENT */
typedef struct S190 T190;

/* DS_BILINKED_LIST [STRING_8] */
typedef struct S191 T191;

/* SPECIAL [XM_EIFFEL_PARSER_NAME] */
typedef struct S192 T192;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
typedef struct S193 T193;

/* SPECIAL [XM_EIFFEL_DECLARATION] */
typedef struct S194 T194;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
typedef struct S195 T195;

/* SPECIAL [BOOLEAN] */
typedef struct S196 T196;

/* SPECIAL [XM_DTD_EXTERNAL_ID] */
typedef struct S197 T197;

/* KL_SPECIAL_ROUTINES [BOOLEAN] */
typedef struct S198 T198;

/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S199 T199;

/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S200 T200;

/* SPECIAL [XM_DTD_ELEMENT_CONTENT] */
typedef struct S201 T201;

/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
typedef struct S202 T202;

/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S204 T204;

/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S206 T206;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S207 T207;

/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S208 T208;

/* SPECIAL [DS_BILINKED_LIST [STRING_8]] */
typedef struct S209 T209;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
typedef struct S210 T210;

/* XM_EIFFEL_ENTITY_DEF */
typedef struct S211 T211;

/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
typedef struct S212 T212;

/* XM_DTD_CALLBACKS_NULL */
typedef struct S214 T214;

/* XM_EIFFEL_SCANNER_DTD */
typedef struct S215 T215;

/* XM_EIFFEL_PE_ENTITY_DEF */
typedef struct S217 T217;

/* ET_XACE_BOOLEAN_EXPECTED_ERROR */
typedef struct S218 T218;

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR */
typedef struct S219 T219;

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR */
typedef struct S220 T220;

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR */
typedef struct S221 T221;

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING */
typedef struct S222 T222;

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR */
typedef struct S223 T223;

/* ET_XACE_MISSING_ATTRIBUTE_ERROR */
typedef struct S224 T224;

/* ET_XACE_MISSING_ELEMENT_ERROR */
typedef struct S225 T225;

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING */
typedef struct S226 T226;

/* ET_XACE_UNKNOWN_ELEMENT_ERROR */
typedef struct S227 T227;

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING */
typedef struct S228 T228;

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING */
typedef struct S229 T229;

/* KL_OPERATING_SYSTEM */
typedef struct S230 T230;

/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S233 T233;

/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S234 T234;

/* DS_PAIR [XM_POSITION, XM_NODE] */
typedef struct S235 T235;

/* ARRAY [INTEGER_32] */
typedef struct S236 T236;

/* UC_UTF8_ROUTINES */
typedef struct S237 T237;

/* UC_UTF8_STRING */
typedef struct S239 T239;

/* XM_EIFFEL_INPUT_STREAM */
typedef struct S240 T240;

/* KL_INTEGER_ROUTINES */
typedef struct S241 T241;

/* KL_PLATFORM */
typedef struct S242 T242;

/* UT_TRISTATE */
typedef struct S243 T243;

/* SPECIAL [ET_XACE_CLUSTER] */
typedef struct S244 T244;

/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER] */
typedef struct S245 T245;

/* DS_ARRAYED_LIST_CURSOR [ET_XACE_CLUSTER] */
typedef struct S246 T246;

/* SPECIAL [ET_XACE_MOUNTED_LIBRARY] */
typedef struct S247 T247;

/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY] */
typedef struct S248 T248;

/* DS_ARRAYED_LIST_CURSOR [ET_XACE_MOUNTED_LIBRARY] */
typedef struct S249 T249;

/* DS_LINKABLE [ET_XACE_CLASS_OPTIONS] */
typedef struct S250 T250;

/* DS_LINKABLE [ET_XACE_FEATURE_OPTIONS] */
typedef struct S251 T251;

/* DS_LINKABLE [ET_XACE_ASSEMBLY] */
typedef struct S252 T252;

/* EXECUTION_ENVIRONMENT */
typedef struct S253 T253;

/* DS_LINKABLE [ET_XACE_CLUSTER] */
typedef struct S254 T254;

/* SPECIAL [DS_HASH_SET [STRING_8]] */
typedef struct S255 T255;

/* DS_SPARSE_TABLE_KEYS [DS_HASH_SET [STRING_8], STRING_8] */
typedef struct S257 T257;

/* KL_SPECIAL_ROUTINES [DS_HASH_SET [STRING_8]] */
typedef struct S259 T259;

/* DS_LINKABLE [ET_XACE_EXPORTED_FEATURE] */
typedef struct S260 T260;

/* DS_SPARSE_TABLE_KEYS [INTEGER_32, STRING_8] */
typedef struct S262 T262;

/* DS_HASH_TABLE_CURSOR [INTEGER_32, STRING_8] */
typedef struct S264 T264;

/* TYPED_POINTER [SPECIAL [CHARACTER_8]] */
typedef struct S265 T265;

/* XM_NAMESPACE_RESOLVER_CONTEXT */
typedef struct S266 T266;

/* DS_LINKED_QUEUE [STRING_8] */
typedef struct S268 T268;

/* DS_SPARSE_TABLE_KEYS_CURSOR [ET_XACE_LIBRARY, STRING_8] */
typedef struct S269 T269;

/* TO_SPECIAL [ET_XACE_LIBRARY] */
typedef struct S270 T270;

/* XM_EIFFEL_CHARACTER_ENTITY */
typedef struct S271 T271;

/* YY_BUFFER */
typedef struct S272 T272;

/* YY_FILE_BUFFER */
typedef struct S273 T273;

/* DS_LINKED_STACK [INTEGER_32] */
typedef struct S276 T276;

/* DS_BILINKABLE [XM_POSITION] */
typedef struct S277 T277;

/* DS_BILINKED_LIST_CURSOR [XM_POSITION] */
typedef struct S278 T278;

/* DS_LINKABLE [XM_EIFFEL_SCANNER] */
typedef struct S279 T279;

/* SPECIAL [XM_EIFFEL_ENTITY_DEF] */
typedef struct S280 T280;

/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S281 T281;

/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S283 T283;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
typedef struct S285 T285;

/* TO_SPECIAL [ANY] */
typedef struct S286 T286;

/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
typedef struct S287 T287;

/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
typedef struct S288 T288;

/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
typedef struct S289 T289;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S290 T290;

/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S291 T291;

/* DS_BILINKED_LIST_CURSOR [STRING_8] */
typedef struct S292 T292;

/* DS_BILINKABLE [STRING_8] */
typedef struct S293 T293;

/* TO_SPECIAL [XM_EIFFEL_PARSER_NAME] */
typedef struct S294 T294;

/* TO_SPECIAL [XM_EIFFEL_DECLARATION] */
typedef struct S295 T295;

/* TO_SPECIAL [BOOLEAN] */
typedef struct S296 T296;

/* TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S297 T297;

/* TO_SPECIAL [XM_DTD_ELEMENT_CONTENT] */
typedef struct S298 T298;

/* TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S299 T299;

/* TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S300 T300;

/* TO_SPECIAL [DS_BILINKED_LIST [STRING_8]] */
typedef struct S301 T301;

/* TO_SPECIAL [XM_DTD_EXTERNAL_ID] */
typedef struct S302 T302;

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING */
typedef struct S303 T303;

/* ET_XACE_INVALID_EXPRESSION_ERROR */
typedef struct S304 T304;

/* UC_UNICODE_ROUTINES */
typedef struct S305 T305;

/* KL_ARRAY_ROUTINES [INTEGER_32] */
typedef struct S306 T306;

/* DS_LINKED_QUEUE [CHARACTER_8] */
typedef struct S310 T310;

/* UC_UTF16_ROUTINES */
typedef struct S311 T311;

/* TO_SPECIAL [ET_XACE_CLUSTER] */
typedef struct S312 T312;

/* TO_SPECIAL [ET_XACE_MOUNTED_LIBRARY] */
typedef struct S313 T313;

/* DS_SPARSE_TABLE_KEYS_CURSOR [DS_HASH_SET [STRING_8], STRING_8] */
typedef struct S314 T314;

/* TO_SPECIAL [DS_HASH_SET [STRING_8]] */
typedef struct S315 T315;

/* DS_SPARSE_TABLE_KEYS_CURSOR [INTEGER_32, STRING_8] */
typedef struct S316 T316;

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S318 T318;

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S319 T319;

/* DS_LINKABLE [INTEGER_32] */
typedef struct S321 T321;

/* DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S322 T322;

/* TO_SPECIAL [XM_EIFFEL_ENTITY_DEF] */
typedef struct S323 T323;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
typedef struct S324 T324;

/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
typedef struct S325 T325;

/* C_STRING */
typedef struct S326 T326;

/* DS_HASH_SET [XM_NAMESPACE] */
typedef struct S327 T327;

/* XM_COMMENT */
typedef struct S328 T328;

/* XM_PROCESSING_INSTRUCTION */
typedef struct S329 T329;

/* XM_CHARACTER_DATA */
typedef struct S330 T330;

/* XM_NAMESPACE */
typedef struct S331 T331;

/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S333 T333;

/* KL_CHARACTER_BUFFER */
typedef struct S334 T334;

/* SPECIAL [ARRAY [INTEGER_32]] */
typedef struct S335 T335;

/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
typedef struct S336 T336;

/* DS_LINKABLE [CHARACTER_8] */
typedef struct S337 T337;

/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S341 T341;

/* DS_LINKABLE [XM_NODE] */
typedef struct S344 T344;

/* XM_NODE_TYPER */
typedef struct S346 T346;

/* KL_WINDOWS_FILE_SYSTEM */
typedef struct S352 T352;

/* KL_STRING_INPUT_STREAM */
typedef struct S355 T355;

/* MANAGED_POINTER */
typedef struct S356 T356;

/* SPECIAL [XM_NAMESPACE] */
typedef struct S357 T357;

/* KL_EQUALITY_TESTER [XM_NAMESPACE] */
typedef struct S358 T358;

/* DS_HASH_SET_CURSOR [XM_NAMESPACE] */
typedef struct S359 T359;

/* KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
typedef struct S360 T360;

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR */
typedef struct S361 T361;

/* TYPED_POINTER [NATURAL_8] */
typedef struct S363 T363;

/* EXCEPTIONS */
typedef struct S364 T364;

/* TO_SPECIAL [XM_NAMESPACE] */
typedef struct S365 T365;

/* PLATFORM */
typedef struct S366 T366;

/* STRING_SEARCHER */
typedef struct S367 T367;

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
struct S76 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type TYPED_POINTER [SPECIAL [CHARACTER_8]] */
struct S265 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type TYPED_POINTER [NATURAL_8] */
struct S363 {
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
	T1 a7; /* is_ve */
	T0* a8; /* output_filename */
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
	T1 a7; /* is_ve */
	T0* a8; /* output_filename */
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

/* Struct for type ET_XACE_ESD_GENERATOR */
struct S46 {
	int id;
	T0* a1; /* compiler */
	T0* a2; /* variables */
	T0* a3; /* error_handler */
	T1 a4; /* is_shallow */
};

/* Struct for type ET_XACE_LOADPATH_GENERATOR */
struct S47 {
	int id;
	T0* a1; /* compiler */
	T0* a2; /* variables */
	T0* a3; /* error_handler */
	T1 a4; /* is_shallow */
};

/* Struct for type ET_XACE_ACE_SE_GENERATOR */
struct S48 {
	int id;
	T0* a1; /* compiler */
	T0* a2; /* variables */
	T0* a3; /* error_handler */
	T1 a4; /* is_shallow */
};

/* Struct for type ET_XACE_XACE_VE_GENERATOR */
struct S49 {
	int id;
	T0* a1; /* compiler */
	T0* a2; /* variables */
	T0* a3; /* error_handler */
	T1 a4; /* is_shallow */
};

/* Struct for type DS_LINKED_LIST [ET_XACE_GENERATOR] */
struct S50 {
	int id;
	T6 a1; /* count */
	T0* a2; /* internal_cursor */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
};

/* Struct for type KL_STRING_ROUTINES */
struct S51 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8] */
struct S52 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type SPECIAL [STRING_8] */
struct S54 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [INTEGER_32] */
struct S55 {
	int id;
	T6 z1; /* count */
	T6 z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
struct S56 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [INTEGER_32] */
struct S57 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [STRING_8] */
struct S58 {
	int id;
};

/* Struct for type DS_LINKABLE [GEXACE_COMMAND] */
struct S59 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type KL_STANDARD_FILES */
struct S61 {
	int id;
};

/* Struct for type KL_STDERR_FILE */
struct S62 {
	int id;
	T14 a1; /* file_pointer */
	T0* a2; /* name */
	T6 a3; /* mode */
};

/* Struct for type KL_STDOUT_FILE */
struct S63 {
	int id;
	T14 a1; /* file_pointer */
	T0* a2; /* name */
	T6 a3; /* mode */
};

/* Struct for type KL_NULL_TEXT_OUTPUT_STREAM */
struct S64 {
	int id;
	T0* a1; /* name */
};

/* Struct for type DS_LINKABLE [STRING_8] */
struct S66 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type ARRAY [STRING_8] */
struct S67 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR] */
struct S68 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_LINKABLE [ET_XACE_GENERATOR] */
struct S69 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type UC_STRING */
struct S71 {
	int id;
	T6 a1; /* count */
	T6 a2; /* byte_count */
	T6 a3; /* internal_hash_code */
	T6 a4; /* last_byte_index_input */
	T6 a5; /* last_byte_index_result */
	T0* a6; /* area */
};

/* Struct for type KL_ANY_ROUTINES */
struct S72 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8] */
struct S73 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [INTEGER_32] */
struct S74 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [STRING_8] */
struct S75 {
	int id;
	T0* a1; /* area */
};

/* Struct for type STRING_TO_INTEGER_CONVERTOR */
struct S78 {
	int id;
	T6 a1; /* sign */
	T11 a2; /* part1 */
	T11 a3; /* part2 */
	T6 a4; /* last_state */
	T1 a5; /* internal_overflowed */
	T6 a6; /* conversion_type */
	T0* a7; /* leading_separators */
	T0* a8; /* trailing_separators */
	T1 a9; /* leading_separators_acceptable */
	T1 a10; /* trailing_separators_acceptable */
};

/* Struct for type ET_XACE_SYSTEM_PARSER */
struct S80 {
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

/* Struct for type ET_XACE_SYSTEM */
struct S81 {
	int id;
	T0* a1; /* system_name */
	T0* a2; /* root_class_name */
	T0* a3; /* creation_procedure_name */
	T0* a4; /* options */
	T0* a5; /* clusters */
	T0* a6; /* libraries */
};

/* Struct for type KL_TEXT_INPUT_FILE */
struct S82 {
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
struct S84 {
	int id;
	T6 a1; /* mode */
	T0* a2; /* name */
	T0* a3; /* string_name */
	T14 a4; /* file_pointer */
	T1 a5; /* descriptor_available */
};

/* Struct for type ET_XACE_LIBRARY_PARSER */
struct S85 {
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

/* Struct for type ET_XACE_LIBRARY */
struct S86 {
	int id;
	T0* a1; /* name */
	T0* a2; /* library_prefix */
	T0* a3; /* options */
	T0* a4; /* clusters */
	T0* a5; /* libraries */
};

/* Struct for type ET_XACE_PARSER */
struct S87 {
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
struct S89 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type UT_CANNOT_WRITE_TO_FILE_ERROR */
struct S90 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type INTEGER_OVERFLOW_CHECKER */
struct S91 {
	int id;
	T0* a1; /* integer_overflow_state1 */
	T0* a2; /* integer_overflow_state2 */
	T0* a3; /* natural_overflow_state1 */
	T0* a4; /* natural_overflow_state2 */
};

/* Struct for type ET_XACE_AST_FACTORY */
struct S92 {
	int id;
};

/* Struct for type XM_DOCUMENT */
struct S93 {
	int id;
	T0* a1; /* root_element */
	T0* a2; /* internal_cursor */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
	T6 a5; /* count */
	T0* a6; /* parent */
};

/* Struct for type XM_ELEMENT */
struct S94 {
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
struct S95 {
	int id;
	T0* a1; /* table */
};

/* Struct for type XM_TREE_CALLBACKS_PIPE */
struct S97 {
	int id;
	T0* a1; /* error */
	T0* a2; /* tree */
	T0* a3; /* start */
	T0* a4; /* last */
};

/* Struct for type XM_STOP_ON_ERROR_FILTER */
struct S98 {
	int id;
	T1 a1; /* has_error */
	T0* a2; /* last_error */
	T0* a3; /* next */
};

/* Struct for type XM_CALLBACKS_TO_TREE_FILTER */
struct S99 {
	int id;
	T0* a1; /* last_position_table */
	T0* a2; /* document */
	T0* a3; /* next */
	T0* a4; /* source_parser */
	T0* a5; /* current_element */
	T0* a6; /* namespace_cache */
};

/* Struct for type ET_XACE_VALIDATOR */
struct S100 {
	int id;
	T1 a1; /* has_error */
	T0* a2; /* error_handler */
};

/* Struct for type ET_XACE_PREPROCESSOR */
struct S101 {
	int id;
	T0* a1; /* variables */
	T0* a2; /* error_handler */
};

/* Struct for type DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8] */
struct S102 {
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
struct S103 {
	int id;
};

/* Struct for type XM_EIFFEL_PARSER */
struct S104 {
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
	T6 a32; /* error_count */
	T1 a33; /* yy_lookahead_needed */
	T6 a34; /* yyerrstatus */
	T6 a35; /* yyssp */
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
struct S109 {
	int id;
	T6 z1; /* count */
	T8 z2[1]; /* item */
};

/* Struct for type UT_MESSAGE */
struct S110 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_NOT_XACE_FILE_ERROR */
struct S111 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_CLUSTERS */
struct S112 {
	int id;
	T0* a1; /* clusters */
};

/* Struct for type ET_XACE_MOUNTED_LIBRARIES */
struct S113 {
	int id;
	T0* a1; /* libraries */
};

/* Struct for type ET_XACE_OPTIONS */
struct S114 {
	int id;
	T0* a1; /* declared_namespace */
	T0* a2; /* declared_assertion */
	T0* a3; /* declared_metadata_cache_path */
	T0* a4; /* declared_msil_assembly_compatibility */
	T0* a5; /* declared_msil_clr_version */
	T0* a6; /* declared_shared_library_definition */
	T0* a7; /* declared_abstract */
	T0* a8; /* declared_recursive */
	T0* a9; /* declared_read_only */
	T0* a10; /* declared_address_expression */
	T0* a11; /* declared_arguments */
	T0* a12; /* declared_array_optimization */
	T0* a13; /* declared_assembly */
	T0* a14; /* declared_callback */
	T0* a15; /* declared_case_insensitive */
	T0* a16; /* declared_check_vape */
	T0* a17; /* declared_clean */
	T0* a18; /* declared_cls_compliant */
	T0* a19; /* declared_component */
	T0* a20; /* declared_console_application */
	T0* a21; /* declared_create_keyword_extension */
	T0* a22; /* declared_culture */
	T0* a23; /* declared_c_compiler_options */
	T0* a24; /* declared_dead_code_removal */
	T0* a25; /* declared_debug_option */
	T0* a26; /* declared_debug_tag */
	T0* a27; /* declared_debugger */
	T0* a28; /* declared_document */
	T0* a29; /* declared_dotnet_naming_convention */
	T0* a30; /* declared_dynamic_runtime */
	T0* a31; /* declared_exception_trace */
	T0* a32; /* declared_exclude */
	T0* a33; /* declared_export_option */
	T0* a34; /* declared_finalize_option */
	T0* a35; /* declared_flat_fst_optimization */
	T6 a36; /* declared_fst_expansion_factor */
	T0* a37; /* declared_fst_optimization */
	T0* a38; /* declared_garbage_collector */
	T0* a39; /* declared_gc_info */
	T0* a40; /* declared_header */
	T6 a41; /* declared_heap_size */
	T0* a42; /* declared_high_memory_compiler */
	T0* a43; /* declared_il_verifiable */
	T0* a44; /* declared_include */
	T0* a45; /* declared_inlining */
	T6 a46; /* declared_inlining_size */
	T0* a47; /* declared_jumps_optimization */
	T0* a48; /* declared_layout */
	T0* a49; /* declared_layout_optimization */
	T0* a50; /* declared_leaves_optimization */
	T0* a51; /* declared_line_generation */
	T0* a52; /* declared_link */
	T0* a53; /* declared_linker */
	T0* a54; /* declared_linux_fpu_double_precision */
	T0* a55; /* declared_manifest_string_trace */
	T0* a56; /* declared_map */
	T0* a57; /* declared_msil_generation */
	T0* a58; /* declared_msil_generation_version */
	T0* a59; /* declared_multithreaded */
	T0* a60; /* declared_no_default_lib */
	T0* a61; /* declared_override_cluster */
	T0* a62; /* declared_portable_code_generation */
	T0* a63; /* declared_precompiled */
	T0* a64; /* declared_prefix_option */
	T0* a65; /* declared_profile */
	T0* a66; /* declared_public_key_token */
	T0* a67; /* declared_reloads_optimization */
	T0* a68; /* declared_split */
	T6 a69; /* declared_stack_size */
	T0* a70; /* declared_storable */
	T0* a71; /* declared_storable_filename */
	T0* a72; /* declared_strip_option */
	T0* a73; /* declared_target */
	T0* a74; /* declared_trace */
	T0* a75; /* declared_use_cluster_name_as_namespace */
	T0* a76; /* declared_use_full_cluster_name_as_namespace */
	T0* a77; /* declared_verbose */
	T0* a78; /* declared_version */
	T0* a79; /* declared_visible_filename */
	T0* a80; /* declared_warning */
	T0* a81; /* declared_wedit */
	T0* a82; /* declared_ecf_library */
};

/* Struct for type DS_HASH_SET_CURSOR [STRING_8] */
struct S115 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [STRING_8] */
struct S116 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type DS_HASH_SET [STRING_8] */
struct S117 {
	int id;
	T6 a1; /* count */
	T6 a2; /* position */
	T0* a3; /* equality_tester */
	T6 a4; /* capacity */
	T6 a5; /* slots_position */
	T6 a6; /* free_slot */
	T6 a7; /* last_position */
	T6 a8; /* modulus */
	T0* a9; /* internal_cursor */
	T6 a10; /* clashes_previous_position */
	T6 a11; /* found_position */
	T0* a12; /* item_storage */
	T0* a13; /* clashes */
	T0* a14; /* slots */
	T0* a15; /* special_item_routines */
	T0* a16; /* hash_function */
};

/* Struct for type DS_ARRAYED_LIST [STRING_8] */
struct S118 {
	int id;
	T6 a1; /* count */
	T0* a2; /* special_routines */
	T0* a3; /* storage */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
	T0* a6; /* equality_tester */
};

/* Struct for type DS_ARRAYED_LIST [ET_XACE_CLUSTER] */
struct S119 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type ET_XACE_CLUSTER */
struct S120 {
	int id;
	T0* a1; /* name */
	T0* a2; /* pathname */
	T1 a3; /* is_abstract */
	T0* a4; /* options */
	T0* a5; /* subclusters */
	T0* a6; /* libraries */
	T1 a7; /* is_relative */
	T0* a8; /* library_prefix */
	T0* a9; /* cluster_prefix */
	T0* a10; /* class_options */
	T1 a11; /* is_recursive */
	T1 a12; /* is_read_only */
	T1 a13; /* overridden_constraint_enabled */
	T1 a14; /* is_implicit */
	T1 a15; /* is_mounted */
	T0* a16; /* parent */
	T1 a17; /* is_override */
	T0* a18; /* provider_constraint */
	T0* a19; /* dependant_constraint */
};

/* Struct for type DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY] */
struct S121 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type ET_XACE_MOUNTED_LIBRARY */
struct S122 {
	int id;
	T0* a1; /* pathname */
	T0* a2; /* library */
	T0* a3; /* position */
	T0* a4; /* library_prefix */
	T1 a5; /* is_root */
};

/* Struct for type DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS] */
struct S123 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS] */
struct S124 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type ET_XACE_CLASS_OPTIONS */
struct S125 {
	int id;
	T0* a1; /* feature_options */
	T0* a2; /* class_name */
	T0* a3; /* options */
};

/* Struct for type DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS] */
struct S126 {
	int id;
	T6 a1; /* count */
	T0* a2; /* internal_cursor */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS] */
struct S127 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type ET_XACE_FEATURE_OPTIONS */
struct S128 {
	int id;
	T0* a1; /* feature_name */
	T0* a2; /* options */
};

/* Struct for type ET_XACE_EXTERNALS */
struct S129 {
	int id;
	T0* a1; /* c_compiler_options */
	T0* a2; /* include_directories */
	T0* a3; /* link_libraries */
};

/* Struct for type ET_XACE_OPTION_NAMES */
struct S130 {
	int id;
};

/* Struct for type DS_LINKED_LIST [ET_XACE_ASSEMBLY] */
struct S131 {
	int id;
	T6 a1; /* count */
	T0* a2; /* internal_cursor */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY] */
struct S132 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type ET_XACE_ASSEMBLY */
struct S133 {
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
struct S134 {
	int id;
};

/* Struct for type KL_EXECUTION_ENVIRONMENT */
struct S135 {
	int id;
};

/* Struct for type DS_LINKED_LIST [ET_XACE_CLUSTER] */
struct S136 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER] */
struct S137 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type TUPLE [ET_XACE_CLASS_OPTIONS] */
struct S138 {
	int id;
	T0* z1;
};

/* Struct for type PROCEDURE [ET_XACE_ECF_GENERATOR, TUPLE [ET_XACE_CLASS_OPTIONS]] */
struct S140 {
	int id;
	T0* a1; /* closed_operands */
	void (*f)(T0*, T0*);
};

/* Struct for type TUPLE [ET_XACE_ECF_GENERATOR, INTEGER_32, KI_TEXT_OUTPUT_STREAM] */
struct S141 {
	int id;
	T0* z1;
	T6 z2;
	T0* z3;
};

/* Struct for type TUPLE [ET_XACE_FEATURE_OPTIONS] */
struct S142 {
	int id;
	T0* z1;
};

/* Struct for type PROCEDURE [ET_XACE_ECF_GENERATOR, TUPLE [ET_XACE_FEATURE_OPTIONS]] */
struct S143 {
	int id;
	T0* a1; /* closed_operands */
	void (*f)(T0*, T0*);
};

/* Struct for type TUPLE [ET_XACE_ECF_GENERATOR, STRING_8, INTEGER_32, KI_TEXT_OUTPUT_STREAM] */
struct S144 {
	int id;
	T0* z1;
	T0* z2;
	T6 z3;
	T0* z4;
};

/* Struct for type DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8] */
struct S146 {
	int id;
	T6 a1; /* count */
	T6 a2; /* position */
	T0* a3; /* item_storage */
	T0* a4; /* key_equality_tester */
	T0* a5; /* internal_keys */
	T6 a6; /* capacity */
	T6 a7; /* slots_position */
	T6 a8; /* free_slot */
	T6 a9; /* last_position */
	T6 a10; /* modulus */
	T6 a11; /* clashes_previous_position */
	T0* a12; /* equality_tester */
	T6 a13; /* found_position */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* key_storage */
	T0* a17; /* internal_cursor */
	T0* a18; /* special_item_routines */
	T0* a19; /* special_key_routines */
	T0* a20; /* hash_function */
};

/* Struct for type DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING_8], STRING_8] */
struct S147 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE] */
struct S148 {
	int id;
	T6 a1; /* count */
	T0* a2; /* internal_cursor */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
};

/* Struct for type ET_XACE_EXPORTED_FEATURE */
struct S151 {
	int id;
	T0* a1; /* class_name */
	T0* a2; /* feature_name */
	T0* a3; /* external_name */
};

/* Struct for type DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE] */
struct S152 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type XM_ATTRIBUTE */
struct S154 {
	int id;
	T0* a1; /* name */
	T0* a2; /* namespace */
	T0* a3; /* value */
	T0* a4; /* parent */
};

/* Struct for type DS_LINKED_LIST_CURSOR [XM_NODE] */
struct S155 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* next_cursor */
	T0* a4; /* container */
	T1 a5; /* before */
};

/* Struct for type DS_HASH_TABLE [INTEGER_32, STRING_8] */
struct S157 {
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
struct S160 {
	int id;
	T0* a1; /* buffered_file_info */
	T0* a2; /* file_name */
};

/* Struct for type SPECIAL [NATURAL_64] */
struct S161 {
	int id;
	T6 z1; /* count */
	T11 z2[1]; /* item */
};

/* Struct for type XM_NAMESPACE_RESOLVER */
struct S162 {
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
struct S163 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [XM_CALLBACKS_FILTER] */
struct S164 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type XM_CALLBACKS_NULL */
struct S165 {
	int id;
};

/* Struct for type UT_TEMPLATE_EXPANDER */
struct S167 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [ET_XACE_LIBRARY, STRING_8] */
struct S169 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY, STRING_8] */
struct S171 {
	int id;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T6 a3; /* position */
};

/* Struct for type SPECIAL [ET_XACE_LIBRARY] */
struct S172 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY] */
struct S173 {
	int id;
};

/* Struct for type XM_EIFFEL_SCANNER */
struct S174 {
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
struct S175 {
	int id;
	T0* a1; /* source_name */
	T6 a2; /* row */
	T6 a3; /* column */
	T6 a4; /* byte_index */
};

/* Struct for type DS_BILINKED_LIST [XM_POSITION] */
struct S177 {
	int id;
	T0* a1; /* first_cell */
	T0* a2; /* internal_cursor */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
struct S178 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
};

/* Struct for type DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S179 {
	int id;
	T6 a1; /* position */
	T0* a2; /* item_storage */
	T6 a3; /* count */
	T6 a4; /* last_position */
	T6 a5; /* free_slot */
	T6 a6; /* capacity */
	T6 a7; /* slots_position */
	T0* a8; /* key_equality_tester */
	T0* a9; /* internal_keys */
	T6 a10; /* modulus */
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
struct S181 {
	int id;
};

/* Struct for type SPECIAL [ANY] */
struct S182 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ANY] */
struct S183 {
	int id;
};

/* Struct for type XM_EIFFEL_PARSER_NAME */
struct S184 {
	int id;
	T1 a1; /* use_namespaces */
	T6 a2; /* count */
	T0* a3; /* first */
	T0* a4; /* second */
	T0* a5; /* tail */
};

/* Struct for type XM_EIFFEL_DECLARATION */
struct S185 {
	int id;
	T0* a1; /* version */
	T0* a2; /* encoding */
	T1 a3; /* stand_alone */
};

/* Struct for type XM_DTD_EXTERNAL_ID */
struct S186 {
	int id;
	T0* a1; /* system_id */
	T0* a2; /* public_id */
};

/* Struct for type DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
struct S187 {
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
struct S188 {
	int id;
	T0* a1; /* items */
	T2 a2; /* repetition */
	T0* a3; /* name */
	T2 a4; /* type */
	T1 a5; /* is_character_data_allowed */
};

/* Struct for type DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
struct S189 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type XM_DTD_ATTRIBUTE_CONTENT */
struct S190 {
	int id;
	T0* a1; /* name */
	T2 a2; /* type */
	T1 a3; /* is_list_type */
	T0* a4; /* enumeration_list */
	T2 a5; /* value */
	T0* a6; /* default_value */
};

/* Struct for type DS_BILINKED_LIST [STRING_8] */
struct S191 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
	T0* a5; /* equality_tester */
};

/* Struct for type SPECIAL [XM_EIFFEL_PARSER_NAME] */
struct S192 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
struct S193 {
	int id;
};

/* Struct for type SPECIAL [XM_EIFFEL_DECLARATION] */
struct S194 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
struct S195 {
	int id;
};

/* Struct for type SPECIAL [BOOLEAN] */
struct S196 {
	int id;
	T6 z1; /* count */
	T1 z2[1]; /* item */
};

/* Struct for type SPECIAL [XM_DTD_EXTERNAL_ID] */
struct S197 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [BOOLEAN] */
struct S198 {
	int id;
};

/* Struct for type SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S199 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S200 {
	int id;
};

/* Struct for type SPECIAL [XM_DTD_ELEMENT_CONTENT] */
struct S201 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
struct S202 {
	int id;
};

/* Struct for type SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S204 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
struct S206 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S207 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
struct S208 {
	int id;
};

/* Struct for type SPECIAL [DS_BILINKED_LIST [STRING_8]] */
struct S209 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
struct S210 {
	int id;
};

/* Struct for type XM_EIFFEL_ENTITY_DEF */
struct S211 {
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
struct S212 {
	int id;
};

/* Struct for type XM_DTD_CALLBACKS_NULL */
struct S214 {
	int id;
};

/* Struct for type XM_EIFFEL_SCANNER_DTD */
struct S215 {
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
struct S217 {
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

/* Struct for type ET_XACE_BOOLEAN_EXPECTED_ERROR */
struct S218 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR */
struct S219 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR */
struct S220 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR */
struct S221 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING */
struct S222 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_WRONG_ROOT_ELEMENT_ERROR */
struct S223 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_MISSING_ATTRIBUTE_ERROR */
struct S224 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_MISSING_ELEMENT_ERROR */
struct S225 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING */
struct S226 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_UNKNOWN_ELEMENT_ERROR */
struct S227 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING */
struct S228 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_UNKNOWN_OPTION_NAME_WARNING */
struct S229 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type KL_OPERATING_SYSTEM */
struct S230 {
	int id;
};

/* Struct for type DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S233 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S234 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_PAIR [XM_POSITION, XM_NODE] */
struct S235 {
	int id;
	T0* a1; /* first */
	T0* a2; /* second */
};

/* Struct for type ARRAY [INTEGER_32] */
struct S236 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type UC_UTF8_ROUTINES */
struct S237 {
	int id;
};

/* Struct for type UC_UTF8_STRING */
struct S239 {
	int id;
	T6 a1; /* count */
	T0* a2; /* area */
	T6 a3; /* byte_count */
	T6 a4; /* internal_hash_code */
	T6 a5; /* last_byte_index_input */
	T6 a6; /* last_byte_index_result */
};

/* Struct for type XM_EIFFEL_INPUT_STREAM */
struct S240 {
	int id;
	T0* a1; /* last_string */
	T6 a2; /* encoding */
	T0* a3; /* impl */
	T0* a4; /* utf_queue */
};

/* Struct for type KL_INTEGER_ROUTINES */
struct S241 {
	int id;
};

/* Struct for type KL_PLATFORM */
struct S242 {
	int id;
};

/* Struct for type UT_TRISTATE */
struct S243 {
	int id;
	T2 a1; /* value */
};

/* Struct for type SPECIAL [ET_XACE_CLUSTER] */
struct S244 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER] */
struct S245 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [ET_XACE_CLUSTER] */
struct S246 {
	int id;
	T0* a1; /* container */
};

/* Struct for type SPECIAL [ET_XACE_MOUNTED_LIBRARY] */
struct S247 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY] */
struct S248 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [ET_XACE_MOUNTED_LIBRARY] */
struct S249 {
	int id;
	T0* a1; /* container */
};

/* Struct for type DS_LINKABLE [ET_XACE_CLASS_OPTIONS] */
struct S250 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_LINKABLE [ET_XACE_FEATURE_OPTIONS] */
struct S251 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_LINKABLE [ET_XACE_ASSEMBLY] */
struct S252 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type EXECUTION_ENVIRONMENT */
struct S253 {
	int id;
};

/* Struct for type DS_LINKABLE [ET_XACE_CLUSTER] */
struct S254 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type SPECIAL [DS_HASH_SET [STRING_8]] */
struct S255 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [DS_HASH_SET [STRING_8], STRING_8] */
struct S257 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_HASH_SET [STRING_8]] */
struct S259 {
	int id;
};

/* Struct for type DS_LINKABLE [ET_XACE_EXPORTED_FEATURE] */
struct S260 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [INTEGER_32, STRING_8] */
struct S262 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [INTEGER_32, STRING_8] */
struct S264 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type XM_NAMESPACE_RESOLVER_CONTEXT */
struct S266 {
	int id;
	T0* a1; /* context */
};

/* Struct for type DS_LINKED_QUEUE [STRING_8] */
struct S268 {
	int id;
	T0* a1; /* first_cell */
	T6 a2; /* count */
	T0* a3; /* last_cell */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [ET_XACE_LIBRARY, STRING_8] */
struct S269 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [ET_XACE_LIBRARY] */
struct S270 {
	int id;
	T0* a1; /* area */
};

/* Struct for type XM_EIFFEL_CHARACTER_ENTITY */
struct S271 {
	int id;
	T6 a1; /* code */
};

/* Struct for type YY_BUFFER */
struct S272 {
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
struct S273 {
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
struct S276 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
};

/* Struct for type DS_BILINKABLE [XM_POSITION] */
struct S277 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_POSITION] */
struct S278 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type DS_LINKABLE [XM_EIFFEL_SCANNER] */
struct S279 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type SPECIAL [XM_EIFFEL_ENTITY_DEF] */
struct S280 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S281 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S283 {
	int id;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T6 a3; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
struct S285 {
	int id;
};

/* Struct for type TO_SPECIAL [ANY] */
struct S286 {
	int id;
	T0* a1; /* area */
};

/* Struct for type KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
struct S287 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
struct S288 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
struct S289 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
struct S290 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
struct S291 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [STRING_8] */
struct S292 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_BILINKABLE [STRING_8] */
struct S293 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type TO_SPECIAL [XM_EIFFEL_PARSER_NAME] */
struct S294 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_EIFFEL_DECLARATION] */
struct S295 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [BOOLEAN] */
struct S296 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S297 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_DTD_ELEMENT_CONTENT] */
struct S298 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S299 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
struct S300 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [DS_BILINKED_LIST [STRING_8]] */
struct S301 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_DTD_EXTERNAL_ID] */
struct S302 {
	int id;
	T0* a1; /* area */
};

/* Struct for type ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING */
struct S303 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ET_XACE_INVALID_EXPRESSION_ERROR */
struct S304 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type UC_UNICODE_ROUTINES */
struct S305 {
	int id;
};

/* Struct for type KL_ARRAY_ROUTINES [INTEGER_32] */
struct S306 {
	int id;
};

/* Struct for type DS_LINKED_QUEUE [CHARACTER_8] */
struct S310 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
};

/* Struct for type UC_UTF16_ROUTINES */
struct S311 {
	int id;
};

/* Struct for type TO_SPECIAL [ET_XACE_CLUSTER] */
struct S312 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [ET_XACE_MOUNTED_LIBRARY] */
struct S313 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [DS_HASH_SET [STRING_8], STRING_8] */
struct S314 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [DS_HASH_SET [STRING_8]] */
struct S315 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [INTEGER_32, STRING_8] */
struct S316 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S318 {
	int id;
	T6 a1; /* count */
	T0* a2; /* last_cell */
	T0* a3; /* internal_cursor */
	T0* a4; /* first_cell */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S319 {
	int id;
	T1 a1; /* before */
	T0* a2; /* current_cell */
	T0* a3; /* next_cursor */
	T0* a4; /* container */
	T1 a5; /* after */
};

/* Struct for type DS_LINKABLE [INTEGER_32] */
struct S321 {
	int id;
	T6 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S322 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [XM_EIFFEL_ENTITY_DEF] */
struct S323 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
struct S324 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
struct S325 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type C_STRING */
struct S326 {
	int id;
	T6 a1; /* count */
	T0* a2; /* managed_data */
};

/* Struct for type DS_HASH_SET [XM_NAMESPACE] */
struct S327 {
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
struct S328 {
	int id;
	T0* a1; /* data */
	T0* a2; /* parent */
};

/* Struct for type XM_PROCESSING_INSTRUCTION */
struct S329 {
	int id;
	T0* a1; /* target */
	T0* a2; /* data */
	T0* a3; /* parent */
};

/* Struct for type XM_CHARACTER_DATA */
struct S330 {
	int id;
	T0* a1; /* content */
	T0* a2; /* parent */
};

/* Struct for type XM_NAMESPACE */
struct S331 {
	int id;
	T0* a1; /* uri */
	T0* a2; /* ns_prefix */
};

/* Struct for type DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S333 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type KL_CHARACTER_BUFFER */
struct S334 {
	int id;
	T0* a1; /* as_special */
	T0* a2; /* area */
};

/* Struct for type SPECIAL [ARRAY [INTEGER_32]] */
struct S335 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
struct S336 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_LINKABLE [CHARACTER_8] */
struct S337 {
	int id;
	T2 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S341 {
	int id;
	T0* a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
};

/* Struct for type DS_LINKABLE [XM_NODE] */
struct S344 {
	int id;
	T0* a1; /* right */
	T0* a2; /* item */
};

/* Struct for type XM_NODE_TYPER */
struct S346 {
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
struct S352 {
	int id;
	T2 a1; /* secondary_directory_separator */
};

/* Struct for type KL_STRING_INPUT_STREAM */
struct S355 {
	int id;
	T1 a1; /* end_of_input */
	T2 a2; /* last_character */
	T0* a3; /* string */
	T6 a4; /* location */
};

/* Struct for type MANAGED_POINTER */
struct S356 {
	int id;
	T1 a1; /* is_shared */
	T14 a2; /* item */
	T6 a3; /* count */
};

/* Struct for type SPECIAL [XM_NAMESPACE] */
struct S357 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_EQUALITY_TESTER [XM_NAMESPACE] */
struct S358 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [XM_NAMESPACE] */
struct S359 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
struct S360 {
	int id;
};

/* Struct for type ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR */
struct S361 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type EXCEPTIONS */
struct S364 {
	int id;
};

/* Struct for type TO_SPECIAL [XM_NAMESPACE] */
struct S365 {
	int id;
	T0* a1; /* area */
};

/* Struct for type PLATFORM */
struct S366 {
	int id;
};

/* Struct for type STRING_SEARCHER */
struct S367 {
	int id;
	T0* a1; /* deltas */
};

typedef struct {
	int id;
	EIF_INTEGER type_id;
	EIF_BOOLEAN is_special;
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
extern T49 GE_default49;
extern T50 GE_default50;
extern T51 GE_default51;
extern T52 GE_default52;
extern T54 GE_default54;
extern T55 GE_default55;
extern T56 GE_default56;
extern T57 GE_default57;
extern T58 GE_default58;
extern T59 GE_default59;
extern T61 GE_default61;
extern T62 GE_default62;
extern T63 GE_default63;
extern T64 GE_default64;
extern T66 GE_default66;
extern T67 GE_default67;
extern T68 GE_default68;
extern T69 GE_default69;
extern T71 GE_default71;
extern T72 GE_default72;
extern T73 GE_default73;
extern T74 GE_default74;
extern T75 GE_default75;
extern T76 GE_default76;
extern T78 GE_default78;
extern T80 GE_default80;
extern T81 GE_default81;
extern T82 GE_default82;
extern T84 GE_default84;
extern T85 GE_default85;
extern T86 GE_default86;
extern T87 GE_default87;
extern T89 GE_default89;
extern T90 GE_default90;
extern T91 GE_default91;
extern T92 GE_default92;
extern T93 GE_default93;
extern T94 GE_default94;
extern T95 GE_default95;
extern T97 GE_default97;
extern T98 GE_default98;
extern T99 GE_default99;
extern T100 GE_default100;
extern T101 GE_default101;
extern T102 GE_default102;
extern T103 GE_default103;
extern T104 GE_default104;
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
extern T136 GE_default136;
extern T137 GE_default137;
extern T138 GE_default138;
extern T140 GE_default140;
extern T141 GE_default141;
extern T142 GE_default142;
extern T143 GE_default143;
extern T144 GE_default144;
extern T146 GE_default146;
extern T147 GE_default147;
extern T148 GE_default148;
extern T151 GE_default151;
extern T152 GE_default152;
extern T154 GE_default154;
extern T155 GE_default155;
extern T157 GE_default157;
extern T160 GE_default160;
extern T161 GE_default161;
extern T162 GE_default162;
extern T163 GE_default163;
extern T164 GE_default164;
extern T165 GE_default165;
extern T167 GE_default167;
extern T169 GE_default169;
extern T171 GE_default171;
extern T172 GE_default172;
extern T173 GE_default173;
extern T174 GE_default174;
extern T175 GE_default175;
extern T177 GE_default177;
extern T178 GE_default178;
extern T179 GE_default179;
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
extern T196 GE_default196;
extern T197 GE_default197;
extern T198 GE_default198;
extern T199 GE_default199;
extern T200 GE_default200;
extern T201 GE_default201;
extern T202 GE_default202;
extern T204 GE_default204;
extern T206 GE_default206;
extern T207 GE_default207;
extern T208 GE_default208;
extern T209 GE_default209;
extern T210 GE_default210;
extern T211 GE_default211;
extern T212 GE_default212;
extern T214 GE_default214;
extern T215 GE_default215;
extern T217 GE_default217;
extern T218 GE_default218;
extern T219 GE_default219;
extern T220 GE_default220;
extern T221 GE_default221;
extern T222 GE_default222;
extern T223 GE_default223;
extern T224 GE_default224;
extern T225 GE_default225;
extern T226 GE_default226;
extern T227 GE_default227;
extern T228 GE_default228;
extern T229 GE_default229;
extern T230 GE_default230;
extern T233 GE_default233;
extern T234 GE_default234;
extern T235 GE_default235;
extern T236 GE_default236;
extern T237 GE_default237;
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
extern T257 GE_default257;
extern T259 GE_default259;
extern T260 GE_default260;
extern T262 GE_default262;
extern T264 GE_default264;
extern T265 GE_default265;
extern T266 GE_default266;
extern T268 GE_default268;
extern T269 GE_default269;
extern T270 GE_default270;
extern T271 GE_default271;
extern T272 GE_default272;
extern T273 GE_default273;
extern T276 GE_default276;
extern T277 GE_default277;
extern T278 GE_default278;
extern T279 GE_default279;
extern T280 GE_default280;
extern T281 GE_default281;
extern T283 GE_default283;
extern T285 GE_default285;
extern T286 GE_default286;
extern T287 GE_default287;
extern T288 GE_default288;
extern T289 GE_default289;
extern T290 GE_default290;
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
extern T310 GE_default310;
extern T311 GE_default311;
extern T312 GE_default312;
extern T313 GE_default313;
extern T314 GE_default314;
extern T315 GE_default315;
extern T316 GE_default316;
extern T318 GE_default318;
extern T319 GE_default319;
extern T321 GE_default321;
extern T322 GE_default322;
extern T323 GE_default323;
extern T324 GE_default324;
extern T325 GE_default325;
extern T326 GE_default326;
extern T327 GE_default327;
extern T328 GE_default328;
extern T329 GE_default329;
extern T330 GE_default330;
extern T331 GE_default331;
extern T333 GE_default333;
extern T334 GE_default334;
extern T335 GE_default335;
extern T336 GE_default336;
extern T337 GE_default337;
extern T341 GE_default341;
extern T344 GE_default344;
extern T346 GE_default346;
extern T352 GE_default352;
extern T355 GE_default355;
extern T356 GE_default356;
extern T357 GE_default357;
extern T358 GE_default358;
extern T359 GE_default359;
extern T360 GE_default360;
extern T361 GE_default361;
extern T363 GE_default363;
extern T364 GE_default364;
extern T365 GE_default365;
extern T366 GE_default366;
extern T367 GE_default367;

extern T0* GE_ms(char* s, T6 c);
/* Call to ANY.same_type */
extern T1 T19x28T0(T0* C, T0* a1);
/* Call to UT_ERROR.default_message */
extern T0* T35x2482(T0* C);
/* Call to ET_XACE_GENERATOR.default_library_output_filename */
extern T0* T42x2506(T0* C);
/* Call to ET_XACE_GENERATOR.default_system_output_filename */
extern T0* T42x2505(T0* C);
/* Call to XM_NODE.parent */
extern T0* T156x5404(T0* C);
/* Call to XM_EIFFEL_SCANNER.start_condition */
extern T6 T174x8239(T0* C);
/* Call to XM_EIFFEL_SCANNER.is_applicable_encoding */
extern T1 T174x8114T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.end_of_file */
extern T1 T174x8244(T0* C);
/* Call to XM_EIFFEL_SCANNER.last_value */
extern T0* T174x8125(T0* C);
/* Call to XM_EIFFEL_SCANNER.last_token */
extern T6 T174x8235(T0* C);
/* Call to XM_EIFFEL_SCANNER.error_position */
extern T0* T174x8123(T0* C);
/* Call to GEXACE_COMMAND.set_xace_filename */
extern void T29x2048T0(T0* C, T0* a1);
/* Call to GEXACE_COMMAND.execute */
extern void T29x2053(T0* C);
/* Call to ET_XACE_GENERATOR.generate_library */
extern void T42x2512T0T0(T0* C, T0* a1, T0* a2);
/* Call to ET_XACE_GENERATOR.generate_system */
extern void T42x2511T0T0(T0* C, T0* a1, T0* a2);
/* Call to ET_XACE_GENERATOR.set_shallow */
extern void T42x2510T1(T0* C, T1 a1);
/* Call to XM_CALLBACKS_FILTER.set_next */
extern void T105x5688T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_xml_declaration */
extern void T106x5744T0T0T1(T0* C, T0* a1, T0* a2, T1 a3);
/* Call to XM_CALLBACKS.on_error */
extern void T106x5745T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_start_tag_finish */
extern void T106x5750(T0* C);
/* Call to XM_CALLBACKS.on_finish */
extern void T106x5743(T0* C);
/* Call to XM_CALLBACKS.on_attribute */
extern void T106x5749T0T0T0T0(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* Call to XM_CALLBACKS.on_end_tag */
extern void T106x5751T0T0T0(T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_start_tag */
extern void T106x5748T0T0T0(T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_content */
extern void T106x5752T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_processing_instruction */
extern void T106x5746T0T0(T0* C, T0* a1, T0* a2);
/* Call to XM_CALLBACKS.on_comment */
extern void T106x5747T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_start */
extern void T106x5742(T0* C);
/* Call to XM_NODE.node_set_parent */
extern void T156x5412T0(T0* C, T0* a1);
/* Call to XM_NODE.process */
extern void T156x5414T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.close_input */
extern void T174x8110(T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T174x8109T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.set_encoding */
extern void T174x8115T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T174x8106(T0* C);
/* Call to XM_EIFFEL_SCANNER.read_token */
extern void T174x8250(T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_stream */
extern void T174x8108T0(T0* C, T0* a1);
/* GEXACE.make */
extern T0* T21c20(void);
/* KL_EXCEPTIONS.die */
extern void T30f2(T0* C, T6 a1);
/* GEXACE.exceptions */
extern unsigned char ge134os1727;
extern T0* ge134ov1727;
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
extern void T62f10(T0* C, T0* a1);
/* KL_STDERR_FILE.put_new_line */
extern void T62f13(T0* C);
/* KL_STDERR_FILE.put_string */
extern void T62f12(T0* C, T0* a1);
/* KL_STDERR_FILE.old_put_string */
extern void T62f16(T0* C, T0* a1);
/* KL_STDERR_FILE.console_ps */
extern void T62f17(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STRING_ROUTINES.as_string */
extern T0* T51f10(T0* C, T0* a1);
/* UC_UTF8_STRING.string */
extern T0* T239f37(T0* C);
/* UC_UTF8_STRING.next_byte_index */
extern T6 T239f24(T0* C, T6 a1);
/* UC_UTF8_ROUTINES.encoded_byte_count */
extern T6 T237f3(T0* C, T2 a1);
/* CHARACTER_8.infix "<=" */
extern T1 T2f17(T2* C, T2 a1);
/* CHARACTER_8.infix "<" */
extern T1 T2f15(T2* C, T2 a1);
/* UC_UTF8_STRING.utf8 */
extern unsigned char ge147os3949;
extern T0* ge147ov3949;
extern T0* T239f25(T0* C);
/* UC_UTF8_ROUTINES.default_create */
extern T0* T237c36(void);
/* KL_INTEGER_ROUTINES.to_character */
extern T2 T241f2(T0* C, T6 a1);
/* UC_UTF8_STRING.integer_ */
extern unsigned char ge83os2832;
extern T0* ge83ov2832;
extern T0* T239f23(T0* C);
/* KL_INTEGER_ROUTINES.default_create */
extern T0* T241c4(void);
/* INTEGER_32.infix "<=" */
extern T1 T6f6(T6* C, T6 a1);
/* KL_PLATFORM.maximum_character_code */
extern unsigned char ge217os8955;
extern T6 ge217ov8955;
extern T6 T242f1(T0* C);
/* KL_PLATFORM.old_maximum_character_code */
extern T6 T242f3(T0* C);
/* UC_UTF8_STRING.platform */
extern unsigned char ge137os2829;
extern T0* ge137ov2829;
extern T0* T239f22(T0* C);
/* KL_PLATFORM.default_create */
extern T0* T242c5(void);
/* UC_UTF8_STRING.item_code_at_byte_index */
extern T6 T239f21(T0* C, T6 a1);
/* UC_UTF8_ROUTINES.encoded_next_value */
extern T6 T237f6(T0* C, T2 a1);
/* UC_UTF8_ROUTINES.encoded_first_value */
extern T6 T237f4(T0* C, T2 a1);
/* STRING_8.append_character */
extern void T17f36(T0* C, T2 a1);
/* STRING_8.resize */
extern void T17f41(T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].aliased_resized_area */
extern T0* T15f4(T0* C, T6 a1);
/* INTEGER_32.infix ">=" */
extern T1 T6f2(T6* C, T6 a1);
/* STRING_8.additional_space */
extern T6 T17f21(T0* C);
/* INTEGER_32.max */
extern T6 T6f12(T6* C, T6 a1);
/* STRING_8.capacity */
extern T6 T17f20(T0* C);
/* UC_UTF8_STRING.byte_item */
extern T2 T239f20(T0* C, T6 a1);
/* UC_UTF8_STRING.old_item */
extern T2 T239f33(T0* C, T6 a1);
/* UC_UTF8_STRING.set_count */
extern void T239f65(T0* C, T6 a1);
/* UC_UTF8_STRING.reset_byte_index_cache */
extern void T239f73(T0* C);
/* STRING_8.make */
extern void T17f33(T0* C, T6 a1);
/* STRING_8.make */
extern T0* T17c33(T6 a1);
/* STRING_8.make_area */
extern void T17f35(T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].make */
extern T0* T15c8(T6 a1);
/* STRING_8.string */
extern T0* T17f23(T0* C);
/* STRING_8.append */
extern void T17f40(T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].copy_data */
extern void T15f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [CHARACTER_8].move_data */
extern void T15f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].overlapping_move */
extern void T15f12(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].non_overlapping_move */
extern void T15f11(T0* C, T6 a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.as_string */
extern T0* T239f36(T0* C);
/* UC_UTF8_STRING.to_utf8 */
extern T0* T239f18(T0* C);
/* KL_ANY_ROUTINES.same_types */
extern T1 T72f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.any_ */
extern unsigned char ge78os1812;
extern T0* ge78ov1812;
extern T0* T51f5(T0* C);
/* KL_ANY_ROUTINES.default_create */
extern T0* T72c3(void);
/* KL_STDERR_FILE.string_ */
extern unsigned char ge86os1720;
extern T0* ge86ov1720;
extern T0* T62f6(T0* C);
/* KL_STRING_ROUTINES.default_create */
extern T0* T51c14(void);
/* ET_XACE_DEFAULT_ERROR_HANDLER.message */
extern T0* T28f6(T0* C, T0* a1);
/* GEXACE.usage_message */
extern unsigned char ge54os1707;
extern T0* ge54ov1707;
extern T0* T21f15(T0* C);
/* UT_USAGE_MESSAGE.make */
extern T0* T34c7(T0* a1);
/* ARRAY [STRING_8].put */
extern void T67f7(T0* C, T0* a1, T6 a2);
/* ARRAY [STRING_8].make */
extern T0* T67c6(T6 a1, T6 a2);
/* ARRAY [STRING_8].make_area */
extern void T67f8(T0* C, T6 a1);
/* SPECIAL [STRING_8].make */
extern T0* T54c4(T6 a1);
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
extern void T59f4(T0* C, T0* a1);
/* DS_LINKABLE [GEXACE_COMMAND].make */
extern T0* T59c3(T0* a1);
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
extern void T40f14(T0* C, T0* a1);
/* GEXACE_SYSTEM_COMMAND.set_output_filename */
extern void T36f14(T0* C, T0* a1);
/* GEXACE.process_compilers */
extern void T21f34(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].is_empty */
extern T1 T50f5(T0* C);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].force_last */
extern void T50f9(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_GENERATOR].put_right */
extern void T69f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_GENERATOR].make */
extern T0* T69c3(T0* a1);
/* GEXACE_LIBRARY_COMMAND.set_ve */
extern void T40f13(T0* C, T1 a1);
/* GEXACE_SYSTEM_COMMAND.set_ve */
extern void T36f13(T0* C, T1 a1);
/* ET_XACE_XACE_VE_GENERATOR.make */
extern T0* T49c17(T0* a1, T0* a2, T0* a3);
/* ET_XACE_ACE_SE_GENERATOR.make */
extern T0* T48c12(T0* a1, T0* a2, T0* a3);
/* STRING_8.is_equal */
extern T1 T17f8(T0* C, T0* a1);
/* STRING_8.str_strict_cmp */
extern T6 T17f10(T0* C, T0* a1, T0* a2, T6 a3);
/* ET_XACE_LOADPATH_GENERATOR.make */
extern T0* T47c7(T0* a1, T0* a2, T0* a3);
/* ET_XACE_ESD_GENERATOR.make */
extern T0* T46c11(T0* a1, T0* a2, T0* a3);
/* ET_XACE_ECF_GENERATOR.make */
extern T0* T45c23(T0* a1, T0* a2, T0* a3);
/* ET_XACE_ACE_GENERATOR.make */
extern T0* T44c17(T0* a1, T0* a2, T0* a3);
/* ET_XACE_XACE_GENERATOR.make */
extern T0* T43c17(T0* a1, T0* a2, T0* a3);
/* STRING_8.same_string */
extern T1 T17f7(T0* C, T0* a1);
/* UC_UTF8_STRING.item */
extern T2 T239f12(T0* C, T6 a1);
/* UC_UTF8_STRING.character_item_at_byte_index */
extern T2 T239f31(T0* C, T6 a1);
/* UC_UTF8_STRING.byte_index */
extern T6 T239f30(T0* C, T6 a1);
/* STRING_8.item */
extern T2 T17f11(T0* C, T6 a1);
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
extern T6 T239f14(T0* C);
/* UC_UTF8_STRING.hash_code */
extern T6 T239f14p1(T0* C);
/* INTEGER_32.infix "|<<" */
extern T6 T6f10(T6* C, T6 a1);
/* STRING_8.hash_code */
extern T6 T17f12(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].resize */
extern void T24f45(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_resize */
extern void T24f53(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].resize */
extern T0* T57f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [INTEGER_32].resized_area */
extern T0* T55f3(T0* C, T6 a1);
/* SPECIAL [INTEGER_32].copy_data */
extern void T55f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER_32].move_data */
extern void T55f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].overlapping_move */
extern void T55f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].non_overlapping_move */
extern void T55f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].make */
extern T0* T55c4(T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].special_integer_ */
extern unsigned char ge84os2260;
extern T0* ge84ov2260;
extern T0* T24f27(T0* C);
/* KL_SPECIAL_ROUTINES [INTEGER_32].default_create */
extern T0* T57c4(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_resize */
extern void T24f52(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].resize */
extern T0* T58f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].resized_area */
extern T0* T54f3(T0* C, T6 a1);
/* SPECIAL [STRING_8].copy_data */
extern void T54f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [STRING_8].move_data */
extern void T54f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].overlapping_move */
extern void T54f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].non_overlapping_move */
extern void T54f8(T0* C, T6 a1, T6 a2, T6 a3);
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
extern T1 T51f1(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.item_code */
extern T6 T239f13(T0* C, T6 a1);
/* STRING_8.item_code */
extern T6 T17f13(T0* C, T6 a1);
/* KL_STRING_ROUTINES.elks_same_string */
extern T1 T51f7(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.same_string */
extern T1 T239f11(T0* C, T0* a1);
/* UC_UTF8_STRING.substring_index */
extern T6 T239f29(T0* C, T0* a1, T6 a2);
/* UC_UTF8_STRING.same_unicode_string */
extern T1 T239f10(T0* C, T0* a1);
/* UC_UTF8_STRING.unicode_substring_index */
extern T6 T239f28(T0* C, T0* a1, T6 a2);
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
extern void T17f34(T0* C, T6 a1);
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
extern T0* T50c8(void);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].new_cursor */
extern T0* T50f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].make */
extern T0* T68c7(T0* a1);
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
extern unsigned char ge118os2943;
extern T0* ge118ov2943;
extern T0* T61f2(T0* C);
/* KL_STDOUT_FILE.make */
extern T0* T63c7(void);
/* KL_STDOUT_FILE.make_open_stdout */
extern void T63f8(T0* C, T0* a1);
/* KL_STDOUT_FILE.set_write_mode */
extern void T63f10(T0* C);
/* KL_STDOUT_FILE.console_def */
extern T14 T63f4(T0* C, T6 a1);
/* KL_STDOUT_FILE.old_make */
extern void T63f9(T0* C, T0* a1);
/* KL_STANDARD_FILES.error */
extern unsigned char ge118os2944;
extern T0* ge118ov2944;
extern T0* T61f1(T0* C);
/* KL_STDERR_FILE.make */
extern T0* T62c9(void);
/* KL_STDERR_FILE.make_open_stderr */
extern void T62f11(T0* C, T0* a1);
/* KL_STDERR_FILE.set_write_mode */
extern void T62f15(T0* C);
/* KL_STDERR_FILE.console_def */
extern T14 T62f5(T0* C, T6 a1);
/* KL_STDERR_FILE.old_make */
extern void T62f14(T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.std */
extern unsigned char ge116os2358;
extern T0* ge116ov2358;
extern T0* T28f7(T0* C);
/* KL_STANDARD_FILES.default_create */
extern T0* T61c3(void);
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
extern T0* T51f2(T0* C, T0* a1, T6 a2);
/* UC_UTF8_STRING.old_wipe_out */
extern void T239f59(T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T239f75(T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T239f59p1(T0* C);
/* STRING_8.wipe_out */
extern void T17f37(T0* C);
/* KL_STRING_ROUTINES.cloned_string */
extern T0* T51f8(T0* C, T0* a1);
/* UC_UTF8_STRING.twin */
extern T0* T239f17(T0* C);
/* UC_UTF8_STRING.copy */
extern void T239f64(T0* C, T0* a1);
/* UC_UTF8_STRING.copy */
extern void T239f64p1(T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].twin */
extern T0* T15f3(T0* C);
/* STRING_8.twin */
extern T0* T17f16(T0* C);
/* STRING_8.copy */
extern void T17f39(T0* C, T0* a1);
/* UC_UTF8_STRING.new_empty_string */
extern T0* T239f9(T0* C, T6 a1);
/* UC_UTF8_STRING.make */
extern void T239f58(T0* C, T6 a1);
/* UC_UTF8_STRING.make */
extern T0* T239c58(T6 a1);
/* UC_UTF8_STRING.old_set_count */
extern void T239f67(T0* C, T6 a1);
/* UC_UTF8_STRING.byte_capacity */
extern T6 T239f41(T0* C);
/* UC_UTF8_STRING.capacity */
extern T6 T239f41p1(T0* C);
/* UC_UTF8_STRING.make */
extern void T239f58p1(T0* C, T6 a1);
/* UC_UTF8_STRING.make_area */
extern void T239f74(T0* C, T6 a1);
/* UC_UTF8_STRING.substring */
extern T0* T239f16(T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.make_from_substring */
extern T0* T239c60(T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.put_substring_at_byte_index */
extern void T239f72(T0* C, T0* a1, T6 a2, T6 a3, T6 a4, T6 a5);
/* UC_UTF8_STRING.put_code_at_byte_index */
extern void T239f82(T0* C, T6 a1, T6 a2, T6 a3);
/* UC_UTF8_ROUTINES.code_byte_count */
extern T6 T237f24(T0* C, T6 a1);
/* UC_UTF8_STRING.put_character_at_byte_index */
extern void T239f71(T0* C, T2 a1, T6 a2, T6 a3);
/* UC_UTF8_ROUTINES.character_byte_count */
extern T6 T237f23(T0* C, T2 a1);
/* UC_UTF8_STRING.put_byte */
extern void T239f80(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.old_put */
extern void T239f70(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.any_ */
extern T0* T239f39(T0* C);
/* UC_UTF8_ROUTINES.substring_byte_count */
extern T6 T237f22(T0* C, T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.shifted_byte_index */
extern T6 T239f45(T0* C, T6 a1, T6 a2);
/* UC_UTF8_ROUTINES.dummy_uc_string */
extern unsigned char ge159os8860;
extern T0* ge159ov8860;
extern T0* T237f27(T0* C);
/* UC_STRING.make_empty */
extern T0* T71c8(void);
/* UC_STRING.make */
extern void T71f9(T0* C, T6 a1);
/* UC_STRING.old_set_count */
extern void T71f12(T0* C, T6 a1);
/* UC_STRING.set_count */
extern void T71f11(T0* C, T6 a1);
/* UC_STRING.byte_capacity */
extern T6 T71f7(T0* C);
/* UC_STRING.capacity */
extern T6 T71f7p1(T0* C);
/* UC_STRING.make */
extern void T71f9p1(T0* C, T6 a1);
/* UC_STRING.make_area */
extern void T71f13(T0* C, T6 a1);
/* UC_STRING.reset_byte_index_cache */
extern void T71f10(T0* C);
/* UC_UTF8_ROUTINES.any_ */
extern T0* T237f25(T0* C);
/* UC_UTF8_STRING.cloned_string */
extern T0* T239f43(T0* C);
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
extern void T66f4(T0* C, T0* a1);
/* DS_LINKABLE [STRING_8].make */
extern T0* T66c3(T0* a1);
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
extern unsigned char ge117os2359;
extern T0* ge117ov2359;
extern T0* T28f8(T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.make */
extern T0* T64c3(T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.set_info_null */
extern void T28f13(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.make_standard */
extern void T28f12(T0* C);
/* DS_LINKED_LIST [GEXACE_COMMAND].make */
extern T0* T27c8(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_key_equality_tester */
extern void T24f39(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].internal_set_equality_tester */
extern void T52f6(T0* C, T0* a1);
/* GEXACE.string_equality_tester */
extern unsigned char ge149os1726;
extern T0* ge149ov1726;
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
extern T0* T52c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].new_cursor */
extern T0* T52f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8].make */
extern T0* T73c3(T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_cursor */
extern T0* T24f26(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].make */
extern T0* T56c3(T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_sparse_container */
extern void T24f49(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_slots */
extern void T24f57(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].make */
extern T0* T57f2(T0* C, T6 a1);
/* TO_SPECIAL [INTEGER_32].make_area */
extern T0* T74c2(T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_clashes */
extern void T24f56(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_key_storage */
extern void T24f55(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].make */
extern T0* T58f2(T0* C, T6 a1);
/* TO_SPECIAL [STRING_8].make_area */
extern T0* T75c2(T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].default_create */
extern T0* T58c3(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_item_storage */
extern void T24f54(T0* C, T6 a1);
/* KL_ARGUMENTS.set_program_name */
extern void T23f5(T0* C, T0* a1);
/* GEXACE.arguments */
extern unsigned char ge132os1719;
extern T0* ge132ov1719;
extern T0* T21f7(T0* C);
/* KL_ARGUMENTS.make */
extern T0* T23c4(void);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_stream */
extern void T217f234(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T217f241(T0* C, T0* a1);
/* YY_FILE_BUFFER.name */
extern T0* T273f14(T0* C);
/* XM_EIFFEL_INPUT_STREAM.name */
extern T0* T240f26(T0* C);
/* KL_STRING_INPUT_STREAM.name */
extern unsigned char ge119os4731;
extern T0* ge119ov4731;
extern T0* T355f6(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T217f241p1(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_load_input_buffer */
extern void T217f215(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_content */
extern void T217f218(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.special_integer_ */
extern T0* T217f70(T0* C);
/* KL_CHARACTER_BUFFER.count */
extern T6 T334f4(T0* C);
/* YY_FILE_BUFFER.set_position */
extern void T273f19(T0* C, T6 a1, T6 a2, T6 a3);
/* YY_BUFFER.set_position */
extern void T272f14(T0* C, T6 a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.set_index */
extern void T273f18(T0* C, T6 a1);
/* YY_BUFFER.set_index */
extern void T272f13(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.new_file_buffer */
extern T0* T217f71(T0* C, T0* a1);
/* YY_FILE_BUFFER.make */
extern T0* T273c17(T0* a1);
/* YY_FILE_BUFFER.make_with_size */
extern void T273f21(T0* C, T0* a1, T6 a2);
/* YY_FILE_BUFFER.set_file */
extern void T273f23(T0* C, T0* a1);
/* YY_FILE_BUFFER.flush */
extern void T273f25(T0* C);
/* KL_CHARACTER_BUFFER.put */
extern void T334f10(T0* C, T2 a1, T6 a2);
/* STRING_8.put */
extern void T17f46(T0* C, T2 a1, T6 a2);
/* XM_EIFFEL_INPUT_STREAM.end_of_input */
extern T1 T240f18(T0* C);
/* KL_TEXT_INPUT_FILE.end_of_input */
extern T1 T82f25(T0* C);
/* YY_FILE_BUFFER.new_default_buffer */
extern T0* T273f16(T0* C, T6 a1);
/* KL_CHARACTER_BUFFER.make */
extern T0* T334c8(T6 a1);
/* KL_OPERATING_SYSTEM.is_dotnet */
extern unsigned char ge214os2970;
extern T1 ge214ov2970;
extern T1 T230f6(T0* C);
/* PLATFORM.default_create */
extern T0* T366c2(void);
/* KL_CHARACTER_BUFFER.operating_system */
extern unsigned char ge136os1734;
extern T0* ge136ov1734;
extern T0* T334f7(T0* C);
/* KL_OPERATING_SYSTEM.default_create */
extern T0* T230c7(void);
/* YY_FILE_BUFFER.default_capacity */
extern unsigned char ge310os9148;
extern T6 ge310ov9148;
extern T6 T273f13(T0* C);
/* XM_EIFFEL_INPUT_STREAM.make_from_stream */
extern T0* T240c28(T0* a1);
/* DS_LINKED_QUEUE [CHARACTER_8].make */
extern T0* T310c6(void);
/* XM_EIFFEL_SCANNER_DTD.set_input_stream */
extern void T215f199(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T215f208(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T215f208p1(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_load_input_buffer */
extern void T215f217(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_content */
extern void T215f218(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.special_integer_ */
extern T0* T215f184(T0* C);
/* XM_EIFFEL_SCANNER_DTD.new_file_buffer */
extern T0* T215f54(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_stream */
extern void T211f230(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T211f237(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T211f237p1(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_load_input_buffer */
extern void T211f212(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_content */
extern void T211f214(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.special_integer_ */
extern T0* T211f57(T0* C);
/* XM_EIFFEL_ENTITY_DEF.new_file_buffer */
extern T0* T211f69(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_stream */
extern void T174f197(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T174f205(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T174f205p1(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_load_input_buffer */
extern void T174f212(T0* C);
/* XM_EIFFEL_SCANNER.yy_set_content */
extern void T174f213(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.special_integer_ */
extern T0* T174f182(T0* C);
/* XM_EIFFEL_SCANNER.new_file_buffer */
extern T0* T174f45(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T217f235(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T217f235p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_external */
extern T1 T217f66(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T217f235p0(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_action */
extern void T217f245(T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.from_hexadecimal */
extern void T271f10(T0* C, T0* a1);
/* KL_STRING_ROUTINES.hexadecimal_to_integer */
extern T6 T51f13(T0* C, T0* a1);
/* XM_EIFFEL_CHARACTER_ENTITY.string_ */
extern T0* T271f7(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.to_utf8 */
extern T0* T271f3(T0* C);
/* UC_UTF8_ROUTINES.append_code_to_utf8 */
extern void T237f37(T0* C, T0* a1, T6 a2);
/* UC_UTF8_ROUTINES.integer_ */
extern T0* T237f29(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.utf8 */
extern T0* T271f6(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_ascii */
extern T1 T271f2(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_valid */
extern T1 T271f5(T0* C);
/* UC_UNICODE_ROUTINES.valid_non_surrogate_code */
extern T1 T305f2(T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.unicode */
extern unsigned char ge144os2833;
extern T0* ge144ov2833;
extern T0* T271f4(T0* C);
/* UC_UNICODE_ROUTINES.default_create */
extern T0* T305c27(void);
/* XM_EIFFEL_CHARACTER_ENTITY.from_decimal */
extern void T271f9(T0* C, T0* a1);
/* STRING_8.to_integer */
extern T6 T17f15(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
extern T6 T78f13(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
extern void T78f17(T0* C, T0* a1, T6 a2);
/* UC_UTF8_STRING.code */
extern T10 T239f38(T0* C, T6 a1);
/* STRING_8.code */
extern T10 T17f24(T0* C, T6 a1);
/* INTEGER_32.to_natural_32 */
extern T10 T6f16(T6* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_character */
extern void T78f23(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflowed */
extern T1 T78f15(T0* C);
/* INTEGER_OVERFLOW_CHECKER.will_overflow */
extern T1 T91f7(T0* C, T11 a1, T11 a2, T6 a3, T6 a4);
/* NATURAL_64.infix ">" */
extern T1 T11f4(T11* C, T11 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
extern unsigned char ge2146os4183;
extern T0* ge2146ov4183;
extern T0* T78f14(T0* C);
/* INTEGER_OVERFLOW_CHECKER.make */
extern T0* T91c13(void);
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
extern T0* T161c2(T6 a1);
/* STRING_8.has */
extern T1 T17f25(T0* C, T2 a1);
/* INTEGER_32.to_natural_64 */
extern T11 T6f14(T6* C);
/* CHARACTER_8.is_digit */
extern T1 T2f2(T2* C);
/* NATURAL_8.infix ">" */
extern T1 T8f2(T8* C, T8 a1);
/* NATURAL_8.infix "&" */
extern T8 T8f1(T8* C, T8 a1);
/* CHARACTER_8.character_types */
extern T8 T2f4(T2* C, T6 a1);
/* CHARACTER_8.internal_character_types */
extern unsigned char ge37os93;
extern T0* ge37ov93;
extern T0* T2f6(T2* C);
/* NATURAL_8.infix "|" */
extern T8 T8f3(T8* C, T8 a1);
/* SPECIAL [NATURAL_8].make */
extern T0* T109c2(T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.reset */
extern void T78f18(T0* C, T6 a1);
/* STRING_8.ctoi_convertor */
extern unsigned char ge2143os1258;
extern T0* ge2143ov1258;
extern T0* T17f19(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
extern void T78f22(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
extern void T78f21(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
extern void T78f20(T0* C, T0* a1);
/* STRING_8.make_from_string */
extern T0* T17c43(T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
extern void T78f19(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.make */
extern T0* T78c16(void);
/* XM_EIFFEL_PE_ENTITY_DEF.has_normalized_newline */
extern T1 T217f201(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_literal */
extern T1 T217f63(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_substring */
extern T0* T217f181(T0* C, T6 a1, T6 a2);
/* KL_CHARACTER_BUFFER.substring */
extern T0* T334f3(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_PE_ENTITY_DEF.text_count */
extern T6 T217f180(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.system_literal_text */
extern T0* T217f162(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_item */
extern T2 T217f207(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern T0* T217f121(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern unsigned char ge1337os8132;
extern T0* ge1337ov8132;
extern T0* T217f121p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_line_column */
extern void T217f249(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text */
extern T0* T217f105(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.pop_start_condition */
extern void T217f248(T0* C);
/* DS_LINKED_STACK [INTEGER_32].remove */
extern void T276f7(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_start_condition */
extern void T217f233(T0* C, T6 a1);
/* DS_LINKED_STACK [INTEGER_32].item */
extern T6 T276f4(T0* C);
/* DS_LINKED_STACK [INTEGER_32].is_empty */
extern T1 T276f3(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition */
extern void T217f246(T0* C, T6 a1);
/* DS_LINKED_STACK [INTEGER_32].force */
extern void T276f6(T0* C, T6 a1);
/* DS_LINKABLE [INTEGER_32].put_right */
extern void T321f4(T0* C, T0* a1);
/* DS_LINKABLE [INTEGER_32].make */
extern T0* T321c3(T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_last_token */
extern void T217f247(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_eof_action */
extern void T217f244(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.wrap */
extern T1 T217f99(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_refill_input_buffer */
extern void T217f243(T0* C);
/* YY_FILE_BUFFER.fill */
extern void T273f20(T0* C);
/* KL_CHARACTER_BUFFER.fill_from_stream */
extern T6 T334f5(T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T6 T240f27(T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T6 T240f27p1(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STRING_INPUT_STREAM.read_to_string */
extern T6 T355f5(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STRING_INPUT_STREAM.read_character */
extern void T355f9(T0* C);
/* KL_TEXT_INPUT_FILE.read_to_string */
extern T6 T82f30(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
extern unsigned char ge208os4753;
extern T0* ge208ov4753;
extern T0* T82f34(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_to_string */
extern T6 T82f33(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.file_gss */
extern T6 T82f35(T0* C, T14 a1, T14 a2, T6 a3);
/* SPECIAL [CHARACTER_8].item_address */
extern T14 T15f5(T0* C, T6 a1);
/* KL_TEXT_INPUT_FILE.any_ */
extern T0* T82f31(T0* C);
/* KL_TEXT_INPUT_FILE.old_end_of_file */
extern T1 T82f27(T0* C);
/* KL_TEXT_INPUT_FILE.file_feof */
extern T1 T82f29(T0* C, T14 a1);
/* XM_EIFFEL_INPUT_STREAM.last_character */
extern T2 T240f19(T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].item */
extern T2 T310f5(T0* C);
/* XM_EIFFEL_INPUT_STREAM.read_character */
extern void T240f31(T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].remove */
extern void T310f7(T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].wipe_out */
extern void T310f9(T0* C);
/* XM_EIFFEL_INPUT_STREAM.noqueue_read_character */
extern void T240f33(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf16_read_character */
extern void T240f35(T0* C);
/* XM_EIFFEL_INPUT_STREAM.append_character */
extern void T240f36(T0* C, T6 a1);
/* DS_LINKED_QUEUE [CHARACTER_8].force */
extern void T310f8(T0* C, T2 a1);
/* DS_LINKABLE [CHARACTER_8].put_right */
extern void T337f4(T0* C, T0* a1);
/* DS_LINKED_QUEUE [CHARACTER_8].is_empty */
extern T1 T310f4(T0* C);
/* DS_LINKABLE [CHARACTER_8].make */
extern T0* T337c3(T2 a1);
/* XM_EIFFEL_INPUT_STREAM.utf8 */
extern T0* T240f22(T0* C);
/* KL_STRING_ROUTINES.wipe_out */
extern void T51f16(T0* C, T0* a1);
/* STRING_8.clear_all */
extern void T17f52(T0* C);
/* XM_EIFFEL_INPUT_STREAM.string_ */
extern T0* T240f17(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf8_buffer */
extern unsigned char ge1328os8896;
extern T0* ge1328ov8896;
extern T0* T240f25(T0* C);
/* UC_UTF16_ROUTINES.surrogate */
extern T6 T311f7(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_low_surrogate */
extern T1 T311f6(T0* C, T6 a1);
/* UC_UTF16_ROUTINES.least_10_bits */
extern T6 T311f5(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_high_surrogate */
extern T1 T311f4(T0* C, T6 a1);
/* UC_UTF16_ROUTINES.is_surrogate */
extern T1 T311f3(T0* C, T6 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16 */
extern unsigned char ge145os2834;
extern T0* ge145ov2834;
extern T0* T240f20(T0* C);
/* UC_UTF16_ROUTINES.default_create */
extern T0* T311c16(void);
/* XM_EIFFEL_INPUT_STREAM.least_significant */
extern T6 T240f24(T0* C, T2 a1, T2 a2);
/* XM_EIFFEL_INPUT_STREAM.most_significant */
extern T6 T240f23(T0* C, T2 a1, T2 a2);
/* XM_EIFFEL_INPUT_STREAM.latin1_read_character */
extern void T240f34(T0* C);
/* KL_TEXT_INPUT_FILE.read_character */
extern void T82f44(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_character */
extern void T82f45(T0* C);
/* KL_TEXT_INPUT_FILE.file_gc */
extern T2 T82f28(T0* C, T14 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16_detect_read_character */
extern void T240f32(T0* C);
/* UC_UTF8_ROUTINES.is_endian_detection_character */
extern T1 T237f31(T0* C, T2 a1, T2 a2, T2 a3);
/* UC_UTF8_ROUTINES.is_endian_detection_character_start */
extern T1 T237f30(T0* C, T2 a1, T2 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_least_first */
extern T1 T311f2(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_most_first */
extern T1 T311f1(T0* C, T6 a1, T6 a2);
/* YY_FILE_BUFFER.compact_left */
extern void T273f22(T0* C);
/* KL_CHARACTER_BUFFER.move_left */
extern void T334f11(T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.subcopy */
extern void T17f54(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* YY_FILE_BUFFER.resize */
extern void T273f24(T0* C);
/* KL_CHARACTER_BUFFER.resize */
extern void T334f12(T0* C, T6 a1);
/* YY_BUFFER.fill */
extern void T272f15(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_null_trans_state */
extern T6 T217f98(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_previous_state */
extern T6 T217f97(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.fatal_error */
extern void T217f240(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.item */
extern T2 T334f6(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.terminate */
extern void T217f242(T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T215f200(T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T215f200p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_action */
extern void T215f214(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.has_normalized_newline */
extern T1 T215f179(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_substring */
extern T0* T215f159(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_SCANNER_DTD.text_count */
extern T6 T215f158(T0* C);
/* XM_EIFFEL_SCANNER_DTD.system_literal_text */
extern T0* T215f140(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_item */
extern T2 T215f194(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.normalized_newline */
extern T0* T215f102(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_line_column */
extern void T215f220(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text */
extern T0* T215f76(T0* C);
/* XM_EIFFEL_SCANNER_DTD.pop_start_condition */
extern void T215f219(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_start_condition */
extern void T215f205(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition */
extern void T215f215(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_eof_action */
extern void T215f213(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.wrap */
extern T1 T215f67(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_refill_input_buffer */
extern void T215f212(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_null_trans_state */
extern T6 T215f66(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_previous_state */
extern T6 T215f65(T0* C);
/* XM_EIFFEL_SCANNER_DTD.fatal_error */
extern void T215f211(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.terminate */
extern void T215f210(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_last_token */
extern void T215f209(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T211f231(T0* C);
/* XM_EIFFEL_ENTITY_DEF.is_external */
extern T1 T211f51(T0* C);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T211f231p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_action */
extern void T211f240(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.has_normalized_newline */
extern T1 T211f198(T0* C);
/* XM_EIFFEL_ENTITY_DEF.is_literal */
extern T1 T211f62(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_substring */
extern T0* T211f178(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_ENTITY_DEF.text_count */
extern T6 T211f177(T0* C);
/* XM_EIFFEL_ENTITY_DEF.system_literal_text */
extern T0* T211f159(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_item */
extern T2 T211f205(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T211f118(T0* C);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T211f118p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_line_column */
extern void T211f245(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text */
extern T0* T211f102(T0* C);
/* XM_EIFFEL_ENTITY_DEF.pop_start_condition */
extern void T211f244(T0* C);
/* XM_EIFFEL_ENTITY_DEF.set_start_condition */
extern void T211f229(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition */
extern void T211f241(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.set_last_token */
extern void T211f243(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_eof_action */
extern void T211f239(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.terminate */
extern void T211f242(T0* C);
/* XM_EIFFEL_ENTITY_DEF.wrap */
extern T1 T211f96(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_refill_input_buffer */
extern void T211f238(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_null_trans_state */
extern T6 T211f95(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_previous_state */
extern T6 T211f94(T0* C);
/* XM_EIFFEL_ENTITY_DEF.fatal_error */
extern void T211f236(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.read_token */
extern void T174f198(T0* C);
/* XM_EIFFEL_SCANNER.yy_execute_action */
extern void T174f209(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.has_normalized_newline */
extern T1 T174f177(T0* C);
/* XM_EIFFEL_SCANNER.text_substring */
extern T0* T174f157(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_SCANNER.text_count */
extern T6 T174f156(T0* C);
/* XM_EIFFEL_SCANNER.system_literal_text */
extern T0* T174f138(T0* C);
/* XM_EIFFEL_SCANNER.text_item */
extern T2 T174f192(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.normalized_newline */
extern T0* T174f97(T0* C);
/* XM_EIFFEL_SCANNER.yy_set_line_column */
extern void T174f217(T0* C);
/* XM_EIFFEL_SCANNER.text */
extern T0* T174f71(T0* C);
/* XM_EIFFEL_SCANNER.pop_start_condition */
extern void T174f216(T0* C);
/* XM_EIFFEL_SCANNER.set_start_condition */
extern void T174f218(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.push_start_condition */
extern void T174f210(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.set_last_token */
extern void T174f215(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.yy_execute_eof_action */
extern void T174f208(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.terminate */
extern void T174f214(T0* C);
/* XM_EIFFEL_SCANNER.wrap */
extern T1 T174f62(T0* C);
/* XM_EIFFEL_SCANNER.yy_refill_input_buffer */
extern void T174f207(T0* C);
/* XM_EIFFEL_SCANNER.yy_null_trans_state */
extern T6 T174f61(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.yy_previous_state */
extern T6 T174f60(T0* C);
/* XM_EIFFEL_SCANNER.fatal_error */
extern void T174f206(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T217f237(T0* C);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition_dtd_ignore */
extern void T215f202(T0* C);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T211f233(T0* C);
/* XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T174f200(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_encoding */
extern void T217f238(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.set_encoding */
extern void T240f30(T0* C, T0* a1);
/* KL_STRING_ROUTINES.same_case_insensitive */
extern T1 T51f11(T0* C, T0* a1, T0* a2);
/* CHARACTER_8.lower */
extern T2 T2f16(T2* C);
/* CHARACTER_8.is_upper */
extern T1 T2f19(T2* C);
/* UC_UNICODE_ROUTINES.lower_code */
extern T6 T305f1(T0* C, T6 a1);
/* ARRAY [INTEGER_32].item */
extern T6 T236f4(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.lower_codes */
extern unsigned char ge166os9220;
extern T0* ge166ov9220;
extern T0* T305f3(T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_plane */
extern unsigned char ge166os9219;
extern T0* ge166ov9219;
extern T0* T305f10(T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_segment */
extern unsigned char ge166os9208;
extern T0* ge166ov9208;
extern T0* T305f17(T0* C);
/* KL_INTEGER_ROUTINES.to_integer */
extern T6 T241f3(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.integer_ */
extern T0* T305f26(T0* C);
/* SPECIAL [ARRAY [INTEGER_32]].make */
extern T0* T335c2(T6 a1);
/* UC_UNICODE_ROUTINES.lower_code_plane_1 */
extern unsigned char ge166os9218;
extern T0* ge166ov9218;
extern T0* T305f9(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_1_segment_4 */
extern unsigned char ge166os9217;
extern T0* ge166ov9217;
extern T0* T305f25(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0 */
extern unsigned char ge166os9216;
extern T0* ge166ov9216;
extern T0* T305f8(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_255 */
extern unsigned char ge166os9215;
extern T0* ge166ov9215;
extern T0* T305f24(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_44 */
extern unsigned char ge166os9214;
extern T0* ge166ov9214;
extern T0* T305f23(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_36 */
extern unsigned char ge166os9213;
extern T0* ge166ov9213;
extern T0* T305f22(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_33 */
extern unsigned char ge166os9212;
extern T0* ge166ov9212;
extern T0* T305f21(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_31 */
extern unsigned char ge166os9211;
extern T0* ge166ov9211;
extern T0* T305f20(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_30 */
extern unsigned char ge166os9210;
extern T0* ge166ov9210;
extern T0* T305f19(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_16 */
extern unsigned char ge166os9209;
extern T0* ge166ov9209;
extern T0* T305f18(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_5 */
extern unsigned char ge166os9207;
extern T0* ge166ov9207;
extern T0* T305f16(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_4 */
extern unsigned char ge166os9206;
extern T0* ge166ov9206;
extern T0* T305f15(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_3 */
extern unsigned char ge166os9205;
extern T0* ge166ov9205;
extern T0* T305f14(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_2 */
extern unsigned char ge166os9204;
extern T0* ge166ov9204;
extern T0* T305f13(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_1 */
extern unsigned char ge166os9203;
extern T0* ge166ov9203;
extern T0* T305f12(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_0 */
extern unsigned char ge166os9202;
extern T0* ge166ov9202;
extern T0* T305f11(T0* C);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].make */
extern T0* T336c2(T6 a1);
/* KL_STRING_ROUTINES.unicode */
extern T0* T51f12(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_encoding */
extern void T215f203(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_encoding */
extern void T211f234(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_encoding */
extern void T174f201(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_from_resolver */
extern void T217f239(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.last_stream */
extern T0* T181f3(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_input_from_resolver */
extern void T215f204(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_from_resolver */
extern void T211f235(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T174f202(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.close_input */
extern void T217f236(T0* C);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_finish */
extern void T181f7(T0* C);
/* KL_STRING_INPUT_STREAM.close */
extern void T355f10(T0* C);
/* KL_TEXT_INPUT_FILE.close */
extern void T82f38(T0* C);
/* KL_TEXT_INPUT_FILE.old_close */
extern void T82f41(T0* C);
/* KL_TEXT_INPUT_FILE.file_close */
extern void T82f42(T0* C, T14 a1);
/* KL_STRING_INPUT_STREAM.is_closable */
extern T1 T355f7(T0* C);
/* KL_TEXT_INPUT_FILE.is_closable */
extern T1 T82f24(T0* C);
/* KL_TEXT_INPUT_FILE.is_open_read */
extern T1 T82f10(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_read */
extern T1 T82f19(T0* C);
/* XM_EIFFEL_SCANNER_DTD.close_input */
extern void T215f201(T0* C);
/* XM_EIFFEL_ENTITY_DEF.close_input */
extern void T211f232(T0* C);
/* XM_EIFFEL_SCANNER.close_input */
extern void T174f199(T0* C);
/* XM_CHARACTER_DATA.process */
extern void T330f5(T0* C, T0* a1);
/* XM_NODE_TYPER.process_character_data */
extern void T346f17(T0* C, T0* a1);
/* XM_NODE_TYPER.reset */
extern void T346f13(T0* C);
/* XM_PROCESSING_INSTRUCTION.process */
extern void T329f7(T0* C, T0* a1);
/* XM_NODE_TYPER.process_processing_instruction */
extern void T346f16(T0* C, T0* a1);
/* XM_COMMENT.process */
extern void T328f6(T0* C, T0* a1);
/* XM_NODE_TYPER.process_comment */
extern void T346f15(T0* C, T0* a1);
/* XM_ATTRIBUTE.process */
extern void T154f8(T0* C, T0* a1);
/* XM_NODE_TYPER.process_attribute */
extern void T346f14(T0* C, T0* a1);
/* XM_ELEMENT.process */
extern void T94f39(T0* C, T0* a1);
/* XM_NODE_TYPER.process_element */
extern void T346f11(T0* C, T0* a1);
/* XM_CHARACTER_DATA.node_set_parent */
extern void T330f4(T0* C, T0* a1);
/* XM_PROCESSING_INSTRUCTION.node_set_parent */
extern void T329f6(T0* C, T0* a1);
/* XM_COMMENT.node_set_parent */
extern void T328f5(T0* C, T0* a1);
/* XM_ATTRIBUTE.node_set_parent */
extern void T154f6(T0* C, T0* a1);
/* XM_ELEMENT.node_set_parent */
extern void T94f31(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_start */
extern void T165f2(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start */
extern void T162f26(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_make */
extern void T162f36(T0* C);
/* XM_NAMESPACE_RESOLVER.new_string_queue */
extern T0* T162f12(T0* C);
/* DS_LINKED_QUEUE [STRING_8].make */
extern T0* T268c6(void);
/* XM_NAMESPACE_RESOLVER_CONTEXT.make */
extern T0* T266c10(void);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T318c9(void);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].new_cursor */
extern T0* T318f7(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T319c7(T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start */
extern void T99f12(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_equal */
extern T0* T327c32(T6 a1);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].default_create */
extern T0* T358c3(void);
/* DS_HASH_SET [XM_NAMESPACE].make */
extern void T327f35(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_cursor */
extern T0* T327f23(T0* C);
/* DS_HASH_SET_CURSOR [XM_NAMESPACE].make */
extern T0* T359c3(T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].unset_found_item */
extern void T327f36(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_slots */
extern void T327f44(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].special_integer_ */
extern T0* T327f29(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].new_modulus */
extern T6 T327f20(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_clashes */
extern void T327f43(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_key_storage */
extern void T327f42(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_item_storage */
extern void T327f41(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].make */
extern T0* T360f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_NAMESPACE].make_area */
extern T0* T365c2(T6 a1);
/* SPECIAL [XM_NAMESPACE].make */
extern T0* T357c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].default_create */
extern T0* T360c3(void);
/* XM_DOCUMENT.make */
extern T0* T93c15(void);
/* XM_DOCUMENT.make_with_root_named */
extern void T93f16(T0* C, T0* a1, T0* a2);
/* XM_DOCUMENT.force_last */
extern void T93f18(T0* C, T0* a1);
/* XM_DOCUMENT.force_last */
extern void T93f18p1(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].put_right */
extern void T344f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].make */
extern T0* T344c3(T0* a1);
/* XM_DOCUMENT.is_empty */
extern T1 T93f13(T0* C);
/* XM_DOCUMENT.before_addition */
extern void T93f19(T0* C, T0* a1);
/* XM_ELEMENT.equality_delete */
extern void T94f38(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].forth */
extern void T155f11(T0* C);
/* XM_DOCUMENT.cursor_forth */
extern void T93f24(T0* C, T0* a1);
/* XM_DOCUMENT.add_traversing_cursor */
extern void T93f28(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_next_cursor */
extern void T155f16(T0* C, T0* a1);
/* XM_DOCUMENT.remove_traversing_cursor */
extern void T93f29(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set */
extern void T155f17(T0* C, T0* a1, T1 a2, T1 a3);
/* XM_ELEMENT.cursor_forth */
extern void T94f45(T0* C, T0* a1);
/* XM_ELEMENT.add_traversing_cursor */
extern void T94f47(T0* C, T0* a1);
/* XM_ELEMENT.remove_traversing_cursor */
extern void T94f48(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].remove */
extern void T155f14(T0* C);
/* XM_DOCUMENT.remove_at_cursor */
extern void T93f26(T0* C, T0* a1);
/* XM_DOCUMENT.move_all_cursors */
extern void T93f33(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_current_cell */
extern void T155f13(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].put */
extern void T344f6(T0* C, T0* a1);
/* XM_DOCUMENT.set_last_cell */
extern void T93f32(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].forget_right */
extern void T344f5(T0* C);
/* XM_DOCUMENT.remove_last */
extern void T93f31(T0* C);
/* XM_DOCUMENT.move_last_cursors_after */
extern void T93f36(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_after */
extern void T155f15(T0* C);
/* XM_DOCUMENT.wipe_out */
extern void T93f34(T0* C);
/* XM_DOCUMENT.move_all_cursors_after */
extern void T93f37(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].is_last */
extern T1 T155f7(T0* C);
/* XM_DOCUMENT.cursor_is_last */
extern T1 T93f11(T0* C, T0* a1);
/* XM_ELEMENT.cursor_is_last */
extern T1 T94f23(T0* C, T0* a1);
/* XM_DOCUMENT.remove_first */
extern void T93f30(T0* C);
/* XM_DOCUMENT.set_first_cell */
extern void T93f35(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].is_first */
extern T1 T155f6(T0* C);
/* XM_DOCUMENT.cursor_is_first */
extern T1 T93f12(T0* C, T0* a1);
/* XM_ELEMENT.cursor_is_first */
extern T1 T94f24(T0* C, T0* a1);
/* XM_ELEMENT.remove_at_cursor */
extern void T94f30(T0* C, T0* a1);
/* XM_ELEMENT.move_all_cursors */
extern void T94f37(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.set_last_cell */
extern void T94f36(T0* C, T0* a1);
/* XM_ELEMENT.remove_last */
extern void T94f35(T0* C);
/* XM_ELEMENT.move_last_cursors_after */
extern void T94f42(T0* C);
/* XM_ELEMENT.wipe_out */
extern void T94f40(T0* C);
/* XM_ELEMENT.move_all_cursors_after */
extern void T94f43(T0* C);
/* XM_ELEMENT.remove_first */
extern void T94f34(T0* C);
/* XM_ELEMENT.set_first_cell */
extern void T94f41(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].item */
extern T0* T155f8(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].start */
extern void T155f10(T0* C);
/* XM_DOCUMENT.cursor_start */
extern void T93f23(T0* C, T0* a1);
/* XM_DOCUMENT.cursor_off */
extern T1 T93f14(T0* C, T0* a1);
/* XM_ELEMENT.cursor_start */
extern void T94f44(T0* C, T0* a1);
/* XM_ELEMENT.cursor_off */
extern T1 T94f25(T0* C, T0* a1);
/* XM_ELEMENT.new_cursor */
extern T0* T94f21(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].make */
extern T0* T155c9(T0* a1);
/* XM_DOCUMENT.equality_delete */
extern void T93f21(T0* C, T0* a1);
/* XM_DOCUMENT.new_cursor */
extern T0* T93f9(T0* C);
/* XM_DOCUMENT.list_make */
extern void T93f17(T0* C);
/* XM_ELEMENT.make */
extern T0* T94c29(T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.list_make */
extern void T94f32(T0* C);
/* XM_DOCUMENT.default_ns */
extern unsigned char ge1288os5413;
extern T0* ge1288ov5413;
extern T0* T93f7(T0* C);
/* XM_NAMESPACE.make_default */
extern T0* T331c9(void);
/* XM_NAMESPACE.make */
extern void T331f8(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE.make */
extern T0* T331c8(T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T98f6(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T98f6p1(T0* C);
/* XM_CALLBACKS_NULL.make */
extern T0* T165c1(void);
/* XM_CALLBACKS_NULL.on_comment */
extern void T165f4(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_comment */
extern void T162f28(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_comment */
extern void T99f14(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.handle_position */
extern void T99f22(T0* C, T0* a1);
/* XM_POSITION_TABLE.put */
extern void T95f4(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].put_last */
extern void T234f14(T0* C, T0* a1);
/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].put_right */
extern void T333f4(T0* C, T0* a1);
/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T333c3(T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].is_empty */
extern T1 T234f5(T0* C);
/* DS_PAIR [XM_POSITION, XM_NODE].make */
extern T0* T235c3(T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.position */
extern T0* T104f128(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].first */
extern T0* T177f6(T0* C);
/* XM_EIFFEL_PARSER.positions */
extern T0* T104f91(T0* C);
/* XM_EIFFEL_PARSER.new_positions */
extern T0* T104f125(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].remove */
extern void T178f7(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].item */
extern T0* T178f4(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].is_empty */
extern T1 T178f3(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].force_last */
extern void T177f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].put_right */
extern void T277f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].attach_left */
extern void T277f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].make */
extern T0* T277c4(T0* a1);
/* DS_BILINKED_LIST [XM_POSITION].is_empty */
extern T1 T177f5(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].make */
extern T0* T177c8(void);
/* DS_BILINKED_LIST [XM_POSITION].new_cursor */
extern T0* T177f7(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_POSITION].make */
extern T0* T278c3(T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].copy */
extern void T178f6(T0* C, T0* a1);
/* DS_LINKABLE [XM_EIFFEL_SCANNER].put_right */
extern void T279f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_EIFFEL_SCANNER].make */
extern T0* T279c3(T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].make */
extern T0* T178c5(void);
/* XM_EIFFEL_PARSER.is_correct */
extern T1 T104f121(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.is_position_table_enabled */
extern T1 T99f8(T0* C);
/* XM_COMMENT.make_last */
extern T0* T328c4(T0* a1, T0* a2);
/* XM_ELEMENT.force_last */
extern void T94f28(T0* C, T0* a1);
/* XM_ELEMENT.force_last */
extern void T94f28p1(T0* C, T0* a1);
/* XM_ELEMENT.force_last */
extern void T94f28p0(T0* C, T0* a1);
/* XM_ELEMENT.before_addition */
extern void T94f33(T0* C, T0* a1);
/* XM_ELEMENT.last */
extern T0* T94f17(T0* C);
/* XM_ELEMENT.is_empty */
extern T1 T94f16(T0* C);
/* XM_COMMENT.make_last_in_document */
extern T0* T328c3(T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T98f8(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T98f8p1(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_processing_instruction */
extern void T165f5(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_processing_instruction */
extern void T162f29(T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_TO_TREE_FILTER.on_processing_instruction */
extern void T99f15(T0* C, T0* a1, T0* a2);
/* XM_PROCESSING_INSTRUCTION.make_last */
extern T0* T329c5(T0* a1, T0* a2, T0* a3);
/* XM_PROCESSING_INSTRUCTION.make_last_in_document */
extern T0* T329c4(T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T98f9(T0* C, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T98f9p1(T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_NULL.on_content */
extern void T165f6(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_content */
extern void T162f30(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_content */
extern void T99f16(T0* C, T0* a1);
/* XM_CHARACTER_DATA.make_last */
extern T0* T330c3(T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T98f10(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T98f10p1(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_start_tag */
extern void T165f9(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER.on_start_tag */
extern void T162f33(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.push */
extern void T266f12(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].force_last */
extern void T318f11(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].put_right */
extern void T341f5(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].attach_left */
extern void T341f6(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T341c4(T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].is_empty */
extern T1 T318f6(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.new_string_string_table */
extern T0* T266f8(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_equality_tester */
extern void T24f59(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.string_equality_tester */
extern T0* T266f9(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map_default */
extern T0* T24c58(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].default_capacity */
extern T6 T24f36(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag */
extern void T99f17(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_last */
extern T0* T94c27(T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_root */
extern T0* T94c26(T0* a1, T0* a2, T0* a3);
/* XM_DOCUMENT.set_root_element */
extern void T93f20(T0* C, T0* a1);
/* XM_DOCUMENT.remove_previous_root_element */
extern void T93f27(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].go_after */
extern void T155f12(T0* C);
/* XM_DOCUMENT.cursor_go_after */
extern void T93f25(T0* C, T0* a1);
/* XM_ELEMENT.cursor_go_after */
extern void T94f46(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.new_namespace */
extern T0* T99f7(T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_NAMESPACE].force_last */
extern void T327f33(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_put */
extern void T327f40(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].clashes_put */
extern void T327f39(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].slots_item */
extern T6 T327f26(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].hash_position */
extern T6 T327f22(T0* C, T0* a1);
/* XM_NAMESPACE.hash_code */
extern T6 T331f5(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].resize */
extern void T327f38(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_resize */
extern void T327f48(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].key_storage_resize */
extern void T327f47(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_resize */
extern void T327f46(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].resize */
extern T0* T360f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_NAMESPACE].resized_area */
extern T0* T357f3(T0* C, T6 a1);
/* SPECIAL [XM_NAMESPACE].copy_data */
extern void T357f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_NAMESPACE].move_data */
extern void T357f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_NAMESPACE].overlapping_move */
extern void T357f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_NAMESPACE].non_overlapping_move */
extern void T357f8(T0* C, T6 a1, T6 a2, T6 a3);
/* DS_HASH_SET [XM_NAMESPACE].key_storage_item */
extern T0* T327f18(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_item */
extern T0* T327f30(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_item */
extern T6 T327f19(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_resize */
extern void T327f45(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_capacity */
extern T6 T327f21(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_put */
extern void T327f37(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].search_position */
extern void T327f34(T0* C, T0* a1);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].test */
extern T1 T358f1(T0* C, T0* a1, T0* a2);
/* KL_ANY_ROUTINES.equal_objects */
extern T1 T72f2(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE.is_equal */
extern T1 T331f4(T0* C, T0* a1);
/* XM_NAMESPACE.string_ */
extern T0* T331f3(T0* C);
/* XM_EIFFEL_PARSER_NAME.is_equal */
extern T1 T184f10(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].forth */
extern void T292f9(T0* C);
/* DS_BILINKED_LIST [STRING_8].cursor_forth */
extern void T191f15(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].add_traversing_cursor */
extern void T191f16(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T292f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].remove_traversing_cursor */
extern void T191f17(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].set */
extern void T292f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [STRING_8].item */
extern T0* T292f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].start */
extern void T292f8(T0* C);
/* DS_BILINKED_LIST [STRING_8].cursor_start */
extern void T191f14(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].cursor_off */
extern T1 T191f10(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].new_cursor */
extern T0* T191f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].make */
extern T0* T292c7(T0* a1);
/* XM_EIFFEL_PARSER_NAME.same_string */
extern T1 T184f15(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER_NAME.string_equality_tester */
extern T0* T184f8(T0* C);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].any_ */
extern T0* T358f2(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].key_equality_tester */
extern T0* T327f17(T0* C);
/* XM_NAMESPACE.same_prefix */
extern T1 T331f7(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].item */
extern T0* T327f24(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].has */
extern T1 T327f27(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T98f11(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T98f11p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_NULL.on_end_tag */
extern void T165f8(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T162f32(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.pop */
extern void T266f11(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_last */
extern void T318f10(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].set_last_cell */
extern void T318f14(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].forget_right */
extern void T341f7(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_last_cursors_after */
extern void T318f13(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_next_cursor */
extern void T319f12(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_after */
extern void T319f11(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].wipe_out */
extern void T318f12(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_all_cursors_after */
extern void T318f15(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve_default */
extern T0* T266f3(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_pseudo_prefix */
extern unsigned char ge1262os9065;
extern T0* ge1262ov9065;
extern T0* T266f7(T0* C);
/* STRING_8.make_empty */
extern T0* T17c44(void);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T162f32p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve */
extern T0* T266f2(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].back */
extern void T319f10(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_back */
extern void T318f18(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].add_traversing_cursor */
extern void T318f19(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_traversing_cursor */
extern void T318f20(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set */
extern void T319f13(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].go_before */
extern void T319f9(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_go_before */
extern void T318f17(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_before */
extern void T319f14(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_off */
extern T1 T318f8(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item */
extern T0* T24f34(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_item */
extern T0* T24f35(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].has */
extern T1 T24f33(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].item */
extern T0* T319f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].finish */
extern void T319f8(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_finish */
extern void T318f16(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_namespace */
extern unsigned char ge1262os9066;
extern T0* ge1262ov9066;
extern T0* T266f6(T0* C);
/* XM_NAMESPACE_RESOLVER.has_prefix */
extern T1 T162f9(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_end_tag */
extern void T99f19(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.parent_element */
extern T0* T94f8(T0* C);
/* XM_DOCUMENT.process */
extern void T93f22(T0* C, T0* a1);
/* XM_NODE_TYPER.process_document */
extern void T346f12(T0* C, T0* a1);
/* XM_NODE_TYPER.default_create */
extern T0* T346c10(void);
/* XM_ELEMENT.is_root_node */
extern T1 T94f22(T0* C);
/* XM_DOCUMENT.is_root_node */
extern T1 T93f10(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T98f13(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T98f13p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_NULL.on_attribute */
extern void T165f10(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER.on_attribute */
extern void T162f34(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add */
extern void T266f14(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force_new */
extern void T24f60(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].last */
extern T0* T318f5(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.shallow_has */
extern T1 T266f4(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.attributes_force */
extern void T162f38(T0* C, T0* a1, T0* a2, T0* a3);
/* DS_LINKED_QUEUE [STRING_8].force */
extern void T268f7(T0* C, T0* a1);
/* DS_LINKED_QUEUE [STRING_8].is_empty */
extern T1 T268f4(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add_default */
extern void T266f13(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.is_xmlns */
extern T1 T162f14(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.same_string */
extern T1 T162f21(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.string_equality_tester */
extern T0* T162f24(T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns */
extern unsigned char ge1229os2564;
extern T0* ge1229ov2564;
extern T0* T162f20(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_attribute */
extern void T99f21(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_ATTRIBUTE.make_last */
extern T0* T154c5(T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T98f15(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T98f15p1(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_CALLBACKS_NULL.on_finish */
extern void T165f3(T0* C);
/* XM_NAMESPACE_RESOLVER.on_finish */
extern void T162f27(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_finish */
extern void T99f13(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T98f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T98f7p1(T0* C);
/* XM_CALLBACKS_NULL.on_start_tag_finish */
extern void T165f7(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T162f31(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T162f31p1(T0* C);
/* KL_STRING_ROUTINES.appended_string */
extern T0* T51f4(T0* C, T0* a1, T0* a2);
/* STRING_8.append_string */
extern void T17f38(T0* C, T0* a1);
/* KL_STRING_ROUTINES.concat */
extern T0* T51f9(T0* C, T0* a1, T0* a2);
/* STRING_8.infix "+" */
extern T0* T17f17(T0* C, T0* a1);
/* UC_UTF8_STRING.prefixed_string */
extern T0* T239f8(T0* C, T0* a1);
/* UC_UTF8_STRING.infix "+" */
extern T0* T239f7(T0* C, T0* a1);
/* UC_UTF8_STRING.append_string */
extern void T239f54(T0* C, T0* a1);
/* UC_UTF8_STRING.dummy_uc_string */
extern unsigned char ge230os3887;
extern T0* ge230ov3887;
extern T0* T239f42(T0* C);
/* UC_UTF8_STRING.append_substring */
extern void T239f56(T0* C, T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.resize_byte_storage */
extern void T239f69(T0* C, T6 a1);
/* UC_UTF8_STRING.resize */
extern void T239f81(T0* C, T6 a1);
/* UC_UTF8_STRING.append_string */
extern void T239f54p1(T0* C, T0* a1);
/* UC_UTF8_STRING.append */
extern void T239f68(T0* C, T0* a1);
/* UC_UTF8_STRING.additional_space */
extern T6 T239f44(T0* C);
/* ISE_RUNTIME.check_assert */
extern T1 T309s1(T1 a1);
/* XM_NAMESPACE_RESOLVER.string_ */
extern T0* T162f11(T0* C);
/* XM_NAMESPACE_RESOLVER.on_delayed_attributes */
extern void T162f37(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_remove */
extern void T162f39(T0* C);
/* DS_LINKED_QUEUE [STRING_8].remove */
extern void T268f8(T0* C);
/* DS_LINKED_QUEUE [STRING_8].wipe_out */
extern void T268f9(T0* C);
/* XM_NAMESPACE_RESOLVER.unprefixed_attribute_namespace */
extern T0* T162f19(T0* C);
/* XM_NAMESPACE_RESOLVER.default_namespace */
extern unsigned char ge1229os2563;
extern T0* ge1229ov2563;
extern T0* T162f23(T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns_namespace */
extern unsigned char ge1229os2571;
extern T0* ge1229ov2571;
extern T0* T162f18(T0* C);
/* XM_NAMESPACE_RESOLVER.xml_prefix_namespace */
extern unsigned char ge1229os2570;
extern T0* ge1229ov2570;
extern T0* T162f17(T0* C);
/* XM_NAMESPACE_RESOLVER.is_xml */
extern T1 T162f16(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.xml_prefix */
extern unsigned char ge1229os2565;
extern T0* ge1229ov2565;
extern T0* T162f22(T0* C);
/* DS_LINKED_QUEUE [STRING_8].item */
extern T0* T268f5(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_is_empty */
extern T1 T162f15(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.has */
extern T1 T266f5(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag_finish */
extern void T99f18(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T98f12(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T98f12p1(T0* C);
/* XM_CALLBACKS_NULL.on_error */
extern void T165f11(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_error */
extern void T162f35(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_error */
extern void T99f20(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T98f14(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T98f14p1(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_xml_declaration */
extern void T165f12(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_NAMESPACE_RESOLVER.on_xml_declaration */
extern void T162f41(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_xml_declaration */
extern void T99f23(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_STOP_ON_ERROR_FILTER.on_xml_declaration */
extern void T98f16(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_NAMESPACE_RESOLVER.set_next */
extern void T162f40(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.set_next */
extern void T99f11(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.set_next */
extern void T98f5(T0* C, T0* a1);
/* ET_XACE_XACE_VE_GENERATOR.set_shallow */
extern void T49f18(T0* C, T1 a1);
/* ET_XACE_ACE_SE_GENERATOR.set_shallow */
extern void T48f13(T0* C, T1 a1);
/* ET_XACE_LOADPATH_GENERATOR.set_shallow */
extern void T47f8(T0* C, T1 a1);
/* ET_XACE_ESD_GENERATOR.set_shallow */
extern void T46f12(T0* C, T1 a1);
/* ET_XACE_ECF_GENERATOR.set_shallow */
extern void T45f24(T0* C, T1 a1);
/* ET_XACE_ACE_GENERATOR.set_shallow */
extern void T44f18(T0* C, T1 a1);
/* ET_XACE_XACE_GENERATOR.set_shallow */
extern void T43f18(T0* C, T1 a1);
/* ET_XACE_XACE_VE_GENERATOR.generate_system */
extern void T49f19(T0* C, T0* a1, T0* a2);
/* ET_XACE_XACE_VE_GENERATOR.print_xace_system_file */
extern void T49f21(T0* C, T0* a1, T0* a2);
/* ET_XACE_XACE_VE_GENERATOR.print_mounted_libraries */
extern void T49f28(T0* C, T0* a1, T6 a2, T0* a3);
/* UC_UTF8_STRING.has_substring */
extern T1 T239f50(T0* C, T0* a1);
/* STRING_8.has_substring */
extern T1 T17f29(T0* C, T0* a1);
/* STRING_8.substring_index */
extern T6 T17f31(T0* C, T0* a1, T6 a2);
/* STRING_SEARCHER.substring_index */
extern T6 T367f2(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* STRING_SEARCHER.substring_index_with_deltas */
extern T6 T367f3(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* NATURAL_32.to_integer_32 */
extern T6 T10f7(T10* C);
/* STRING_SEARCHER.internal_initialize_deltas */
extern void T367f6(T0* C, T0* a1, T6 a2, T0* a3);
/* SPECIAL [INTEGER_32].fill_with */
extern void T55f10(T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.string_searcher */
extern unsigned char ge2143os1256;
extern T0* ge2143ov1256;
extern T0* T17f32(T0* C);
/* STRING_SEARCHER.make */
extern T0* T367c5(void);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].item */
extern T0* T121f7(T0* C, T6 a1);
/* ET_XACE_XACE_VE_GENERATOR.print_clusters */
extern void T49f27(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XACE_VE_GENERATOR.print_cluster */
extern void T49f30(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_XACE_VE_GENERATOR.print_class_options */
extern void T49f32(T0* C, T0* a1, T6 a2, T0* a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].forth */
extern void T124f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].cursor_forth */
extern void T123f12(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].add_traversing_cursor */
extern void T123f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].set_next_cursor */
extern void T124f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].remove_traversing_cursor */
extern void T123f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].set */
extern void T124f10(T0* C, T0* a1, T1 a2, T1 a3);
/* ET_XACE_XACE_VE_GENERATOR.print_feature_options */
extern void T49f33(T0* C, T0* a1, T6 a2, T0* a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].forth */
extern void T127f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].cursor_forth */
extern void T126f12(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].add_traversing_cursor */
extern void T126f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].set_next_cursor */
extern void T127f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].remove_traversing_cursor */
extern void T126f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].set */
extern void T127f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].item */
extern T0* T127f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].start */
extern void T127f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].cursor_start */
extern void T126f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].cursor_off */
extern T1 T126f7(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].new_cursor */
extern T0* T126f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_FEATURE_OPTIONS].make */
extern T0* T127c7(T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].item */
extern T0* T124f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].start */
extern void T124f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].cursor_start */
extern void T123f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].cursor_off */
extern T1 T123f7(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].new_cursor */
extern T0* T123f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLASS_OPTIONS].make */
extern T0* T124c7(T0* a1);
/* UC_UTF8_STRING.old_is_empty */
extern T1 T239f15(T0* C);
/* STRING_8.is_empty */
extern T1 T17f27(T0* C);
/* ET_XACE_XACE_VE_GENERATOR.string_ */
extern T0* T49f10(T0* C);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].item */
extern T0* T119f6(T0* C, T6 a1);
/* ET_XACE_XACE_VE_GENERATOR.print_console_application_option */
extern void T49f26(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.is_console_application_declared */
extern T1 T114f243(T0* C);
/* UT_TRISTATE.is_undefined */
extern T1 T243f4(T0* C);
/* UT_TRISTATE.is_false */
extern T1 T243f3(T0* C);
/* UT_TRISTATE.is_true */
extern T1 T243f2(T0* C);
/* ET_XACE_XACE_VE_GENERATOR.print_options */
extern void T49f25(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.wedit */
extern T1 T114f171(T0* C);
/* ET_XACE_OPTIONS.is_wedit_declared */
extern T1 T114f170(T0* C);
/* ET_XACE_OPTIONS.warning */
extern T0* T114f169(T0* C);
/* ET_XACE_OPTIONS.default_warning */
extern unsigned char ge1130os7157;
extern T0* ge1130ov7157;
extern T0* T114f333(T0* C);
/* ET_XACE_OPTIONS.options */
extern unsigned char ge1118os2516;
extern T0* ge1118ov2516;
extern T0* T114f179(T0* C);
/* ET_XACE_OPTION_NAMES.default_create */
extern T0* T130c195(void);
/* ET_XACE_OPTIONS.is_warning_declared */
extern T1 T114f168(T0* C);
/* ET_XACE_OPTIONS.visible_filename */
extern T0* T114f167(T0* C);
/* ET_XACE_OPTIONS.default_visible_filename */
extern unsigned char ge1130os7156;
extern T0* ge1130ov7156;
extern T0* T114f331(T0* C);
/* ET_XACE_OPTIONS.is_visible_filename_declared */
extern T1 T114f166(T0* C);
/* ET_XACE_OPTIONS.version */
extern T0* T114f165(T0* C);
/* ET_XACE_OPTIONS.default_version */
extern unsigned char ge1130os7155;
extern T0* ge1130ov7155;
extern T0* T114f329(T0* C);
/* ET_XACE_OPTIONS.is_version_declared */
extern T1 T114f164(T0* C);
/* ET_XACE_OPTIONS.verbose */
extern T1 T114f163(T0* C);
/* ET_XACE_OPTIONS.is_verbose_declared */
extern T1 T114f162(T0* C);
/* ET_XACE_OPTIONS.use_full_cluster_name_as_namespace */
extern T1 T114f161(T0* C);
/* ET_XACE_OPTIONS.is_use_full_cluster_name_as_namespace_declared */
extern T1 T114f160(T0* C);
/* ET_XACE_OPTIONS.use_cluster_name_as_namespace */
extern T1 T114f159(T0* C);
/* ET_XACE_OPTIONS.is_use_cluster_name_as_namespace_declared */
extern T1 T114f158(T0* C);
/* ET_XACE_OPTIONS.trace */
extern T1 T114f157(T0* C);
/* ET_XACE_OPTIONS.is_trace_declared */
extern T1 T114f156(T0* C);
/* ET_XACE_OPTIONS.target */
extern T0* T114f155(T0* C);
/* ET_XACE_OPTIONS.default_target */
extern unsigned char ge1130os7147;
extern T0* ge1130ov7147;
extern T0* T114f319(T0* C);
/* ET_XACE_OPTIONS.is_target_declared */
extern T1 T114f154(T0* C);
/* ET_XACE_OPTIONS.strip_option */
extern T1 T114f153(T0* C);
/* ET_XACE_OPTIONS.is_strip_option_declared */
extern T1 T114f152(T0* C);
/* ET_XACE_OPTIONS.storable_filename */
extern T0* T114f151(T0* C);
/* ET_XACE_OPTIONS.default_storable_filename */
extern unsigned char ge1130os7145;
extern T0* ge1130ov7145;
extern T0* T114f315(T0* C);
/* ET_XACE_OPTIONS.is_storable_filename_declared */
extern T1 T114f150(T0* C);
/* ET_XACE_OPTIONS.storable */
extern T1 T114f149(T0* C);
/* ET_XACE_OPTIONS.is_storable_declared */
extern T1 T114f148(T0* C);
/* ET_XACE_OPTIONS.stack_size */
extern T6 T114f147(T0* C);
/* ET_XACE_OPTIONS.is_stack_size_declared */
extern T1 T114f146(T0* C);
/* ET_XACE_OPTIONS.split */
extern T1 T114f145(T0* C);
/* ET_XACE_OPTIONS.is_split_declared */
extern T1 T114f144(T0* C);
/* ET_XACE_OPTIONS.shared_library_definition */
extern T0* T114f143(T0* C);
/* ET_XACE_OPTIONS.default_shared_library_definition */
extern unsigned char ge1130os7141;
extern T0* ge1130ov7141;
extern T0* T114f307(T0* C);
/* ET_XACE_OPTIONS.is_shared_library_definition_declared */
extern T1 T114f142(T0* C);
/* ET_XACE_OPTIONS.reloads_optimization */
extern T1 T114f141(T0* C);
/* ET_XACE_OPTIONS.is_reloads_optimization_declared */
extern T1 T114f140(T0* C);
/* ET_XACE_OPTIONS.recursive */
extern T1 T114f192(T0* C);
/* ET_XACE_OPTIONS.is_recursive_declared */
extern T1 T114f190(T0* C);
/* ET_XACE_OPTIONS.read_only */
extern T1 T114f197(T0* C);
/* ET_XACE_OPTIONS.is_read_only_declared */
extern T1 T114f195(T0* C);
/* ET_XACE_OPTIONS.public_key_token */
extern T0* T114f139(T0* C);
/* ET_XACE_OPTIONS.default_public_key_token */
extern unsigned char ge1130os7137;
extern T0* ge1130ov7137;
extern T0* T114f304(T0* C);
/* ET_XACE_OPTIONS.is_public_key_token_declared */
extern T1 T114f138(T0* C);
/* ET_XACE_OPTIONS.profile */
extern T1 T114f137(T0* C);
/* ET_XACE_OPTIONS.is_profile_declared */
extern T1 T114f136(T0* C);
/* ET_XACE_OPTIONS.prefix_option */
extern T0* T114f135(T0* C);
/* ET_XACE_OPTIONS.default_prefix_option */
extern unsigned char ge1130os7135;
extern T0* ge1130ov7135;
extern T0* T114f300(T0* C);
/* ET_XACE_OPTIONS.is_prefix_option_declared */
extern T1 T114f134(T0* C);
/* ET_XACE_OPTIONS.precompiled */
extern T0* T114f133(T0* C);
/* ET_XACE_OPTIONS.default_precompiled */
extern unsigned char ge1130os7134;
extern T0* ge1130ov7134;
extern T0* T114f298(T0* C);
/* ET_XACE_OPTIONS.is_precompiled_declared */
extern T1 T114f132(T0* C);
/* ET_XACE_OPTIONS.portable_code_generation */
extern T1 T114f131(T0* C);
/* ET_XACE_OPTIONS.is_portable_code_generation_declared */
extern T1 T114f130(T0* C);
/* ET_XACE_OPTIONS.override_cluster */
extern T0* T114f129(T0* C);
/* ET_XACE_OPTIONS.default_override_cluster */
extern unsigned char ge1130os7132;
extern T0* ge1130ov7132;
extern T0* T114f294(T0* C);
/* ET_XACE_OPTIONS.is_override_cluster_declared */
extern T1 T114f128(T0* C);
/* ET_XACE_OPTIONS.no_default_lib */
extern T1 T114f127(T0* C);
/* ET_XACE_OPTIONS.is_no_default_lib_declared */
extern T1 T114f126(T0* C);
/* ET_XACE_OPTIONS.namespace */
extern T0* T114f125(T0* C);
/* ET_XACE_OPTIONS.default_namespace */
extern unsigned char ge1130os7130;
extern T0* ge1130ov7130;
extern T0* T114f290(T0* C);
/* ET_XACE_OPTIONS.is_namespace_declared */
extern T1 T114f124(T0* C);
/* ET_XACE_OPTIONS.multithreaded */
extern T1 T114f123(T0* C);
/* ET_XACE_OPTIONS.is_multithreaded_declared */
extern T1 T114f122(T0* C);
/* ET_XACE_OPTIONS.msil_generation_version */
extern T0* T114f121(T0* C);
/* ET_XACE_OPTIONS.default_msil_generation_version */
extern unsigned char ge1130os7128;
extern T0* ge1130ov7128;
extern T0* T114f287(T0* C);
/* ET_XACE_OPTIONS.is_msil_generation_version_declared */
extern T1 T114f120(T0* C);
/* ET_XACE_OPTIONS.msil_generation */
extern T1 T114f119(T0* C);
/* ET_XACE_OPTIONS.is_msil_generation_declared */
extern T1 T114f118(T0* C);
/* ET_XACE_OPTIONS.msil_clr_version */
extern T0* T114f117(T0* C);
/* ET_XACE_OPTIONS.default_msil_clr_version */
extern unsigned char ge1130os7126;
extern T0* ge1130ov7126;
extern T0* T114f283(T0* C);
/* ET_XACE_OPTIONS.is_msil_clr_version_declared */
extern T1 T114f116(T0* C);
/* ET_XACE_OPTIONS.msil_assembly_compatibility */
extern T0* T114f115(T0* C);
/* ET_XACE_OPTIONS.default_msil_assembly_compatibility */
extern unsigned char ge1130os7125;
extern T0* ge1130ov7125;
extern T0* T114f282(T0* C);
/* ET_XACE_OPTIONS.is_msil_assembly_compatibility_declared */
extern T1 T114f114(T0* C);
/* ET_XACE_OPTIONS.metadata_cache_path */
extern T0* T114f113(T0* C);
/* ET_XACE_OPTIONS.default_metadata_cache_path */
extern unsigned char ge1130os7124;
extern T0* ge1130ov7124;
extern T0* T114f281(T0* C);
/* ET_XACE_OPTIONS.is_metadata_cache_path_declared */
extern T1 T114f112(T0* C);
/* ET_XACE_OPTIONS.map */
extern T1 T114f111(T0* C);
/* ET_XACE_OPTIONS.is_map_declared */
extern T1 T114f110(T0* C);
/* ET_XACE_OPTIONS.manifest_string_trace */
extern T1 T114f109(T0* C);
/* ET_XACE_OPTIONS.is_manifest_string_trace_declared */
extern T1 T114f108(T0* C);
/* ET_XACE_OPTIONS.linux_fpu_double_precision */
extern T1 T114f107(T0* C);
/* ET_XACE_OPTIONS.is_linux_fpu_double_precision_declared */
extern T1 T114f106(T0* C);
/* ET_XACE_OPTIONS.linker */
extern T0* T114f105(T0* C);
/* ET_XACE_OPTIONS.default_linker */
extern unsigned char ge1130os7120;
extern T0* ge1130ov7120;
extern T0* T114f274(T0* C);
/* ET_XACE_OPTIONS.is_linker_declared */
extern T1 T114f104(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].forth */
extern void T116f9(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_forth */
extern void T118f22(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].set_position */
extern void T116f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].add_traversing_cursor */
extern void T118f23(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T116f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].remove_traversing_cursor */
extern void T118f24(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].item */
extern T0* T116f4(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_item */
extern T0* T118f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].item */
extern T0* T118f14(T0* C, T6 a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].after */
extern T1 T116f6(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_after */
extern T1 T118f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].start */
extern void T116f8(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_start */
extern void T118f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].is_empty */
extern T1 T118f8(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].off */
extern T1 T116f5(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_off */
extern T1 T118f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].cursor_before */
extern T1 T118f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].new_cursor */
extern T0* T118f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].make */
extern T0* T116c7(T0* a1);
/* ET_XACE_OPTIONS.link */
extern T0* T114f103(T0* C);
/* ET_XACE_OPTIONS.default_link */
extern unsigned char ge1130os7119;
extern T0* ge1130ov7119;
extern T0* T114f272(T0* C);
/* DS_ARRAYED_LIST [STRING_8].set_equality_tester */
extern void T118f18(T0* C, T0* a1);
/* ET_XACE_OPTIONS.string_equality_tester */
extern T0* T114f178(T0* C);
/* DS_ARRAYED_LIST [STRING_8].make */
extern T0* T118c17(T6 a1);
/* ET_XACE_OPTIONS.is_link_declared */
extern T1 T114f102(T0* C);
/* ET_XACE_OPTIONS.line_generation */
extern T1 T114f101(T0* C);
/* ET_XACE_OPTIONS.is_line_generation_declared */
extern T1 T114f100(T0* C);
/* ET_XACE_OPTIONS.leaves_optimization */
extern T1 T114f99(T0* C);
/* ET_XACE_OPTIONS.is_leaves_optimization_declared */
extern T1 T114f98(T0* C);
/* ET_XACE_OPTIONS.layout_optimization */
extern T1 T114f97(T0* C);
/* ET_XACE_OPTIONS.is_layout_optimization_declared */
extern T1 T114f96(T0* C);
/* ET_XACE_OPTIONS.layout */
extern T0* T114f95(T0* C);
/* ET_XACE_OPTIONS.default_layout */
extern unsigned char ge1130os7115;
extern T0* ge1130ov7115;
extern T0* T114f264(T0* C);
/* ET_XACE_OPTIONS.is_layout_declared */
extern T1 T114f94(T0* C);
/* ET_XACE_OPTIONS.jumps_optimization */
extern T1 T114f93(T0* C);
/* ET_XACE_OPTIONS.is_jumps_optimization_declared */
extern T1 T114f92(T0* C);
/* ET_XACE_OPTIONS.inlining_size */
extern T6 T114f91(T0* C);
/* ET_XACE_OPTIONS.is_inlining_size_declared */
extern T1 T114f90(T0* C);
/* ET_XACE_OPTIONS.inlining */
extern T0* T114f89(T0* C);
/* ET_XACE_OPTIONS.default_inlining */
extern unsigned char ge1130os7112;
extern T0* ge1130ov7112;
extern T0* T114f258(T0* C);
/* DS_HASH_SET [STRING_8].put_new */
extern void T117f43(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].item_storage_put */
extern void T117f47(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [STRING_8].slots_put */
extern void T117f50(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING_8].clashes_put */
extern void T117f49(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING_8].slots_item */
extern T6 T117f17(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].hash_position */
extern T6 T117f24(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].clashes_item */
extern T6 T117f35(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].unset_found_item */
extern void T117f46(T0* C);
/* DS_HASH_SET [STRING_8].set_equality_tester */
extern void T117f39(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].make */
extern void T117f41(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make */
extern T0* T117c41(T6 a1);
/* DS_HASH_SET [STRING_8].make_slots */
extern void T117f54(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].special_integer_ */
extern T0* T117f30(T0* C);
/* DS_HASH_SET [STRING_8].new_modulus */
extern T6 T117f19(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_clashes */
extern void T117f53(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_key_storage */
extern void T117f52(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_item_storage */
extern void T117f51(T0* C, T6 a1);
/* ET_XACE_OPTIONS.is_inlining_declared */
extern T1 T114f88(T0* C);
/* DS_HASH_SET [STRING_8].is_empty */
extern T1 T117f20(T0* C);
/* ET_XACE_OPTIONS.include */
extern T0* T114f87(T0* C);
/* ET_XACE_OPTIONS.default_include */
extern unsigned char ge1130os7111;
extern T0* ge1130ov7111;
extern T0* T114f256(T0* C);
/* ET_XACE_OPTIONS.is_include_declared */
extern T1 T114f86(T0* C);
/* ET_XACE_OPTIONS.il_verifiable */
extern T1 T114f85(T0* C);
/* ET_XACE_OPTIONS.is_il_verifiable_declared */
extern T1 T114f84(T0* C);
/* ET_XACE_OPTIONS.high_memory_compiler */
extern T1 T114f83(T0* C);
/* ET_XACE_OPTIONS.is_high_memory_compiler_declared */
extern T1 T114f336(T0* C);
/* ET_XACE_OPTIONS.heap_size */
extern T6 T114f334(T0* C);
/* ET_XACE_OPTIONS.is_heap_size_declared */
extern T1 T114f332(T0* C);
/* ET_XACE_OPTIONS.header */
extern T0* T114f330(T0* C);
/* ET_XACE_OPTIONS.default_header */
extern unsigned char ge1130os7108;
extern T0* ge1130ov7108;
extern T0* T114f248(T0* C);
/* ET_XACE_OPTIONS.is_header_declared */
extern T1 T114f328(T0* C);
/* ET_XACE_OPTIONS.gc_info */
extern T1 T114f326(T0* C);
/* ET_XACE_OPTIONS.is_gc_info_declared */
extern T1 T114f324(T0* C);
/* ET_XACE_OPTIONS.garbage_collector */
extern T0* T114f322(T0* C);
/* ET_XACE_OPTIONS.default_garbage_collector */
extern unsigned char ge1130os7105;
extern T0* ge1130ov7105;
extern T0* T114f244(T0* C);
/* ET_XACE_OPTIONS.is_garbage_collector_declared */
extern T1 T114f320(T0* C);
/* ET_XACE_OPTIONS.fst_optimization */
extern T1 T114f318(T0* C);
/* ET_XACE_OPTIONS.is_fst_optimization_declared */
extern T1 T114f316(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_integer */
extern void T84f31(T0* C, T6 a1);
/* KL_TEXT_OUTPUT_FILE.put_character */
extern void T84f30(T0* C, T2 a1);
/* KL_TEXT_OUTPUT_FILE.old_put_character */
extern void T84f33(T0* C, T2 a1);
/* KL_TEXT_OUTPUT_FILE.file_pc */
extern void T84f35(T0* C, T14 a1, T2 a2);
/* ET_XACE_OPTIONS.fst_expansion_factor */
extern T6 T114f314(T0* C);
/* ET_XACE_OPTIONS.is_fst_expansion_factor_declared */
extern T1 T114f312(T0* C);
/* ET_XACE_OPTIONS.flat_fst_optimization */
extern T1 T114f310(T0* C);
/* ET_XACE_OPTIONS.is_flat_fst_optimization_declared */
extern T1 T114f308(T0* C);
/* ET_XACE_OPTIONS.finalize_option */
extern T1 T114f305(T0* C);
/* ET_XACE_OPTIONS.is_finalize_option_declared */
extern T1 T114f303(T0* C);
/* ET_XACE_OPTIONS.export_option */
extern T0* T114f301(T0* C);
/* ET_XACE_OPTIONS.default_export_option */
extern unsigned char ge1130os7100;
extern T0* ge1130ov7100;
extern T0* T114f234(T0* C);
/* ET_XACE_OPTIONS.is_export_option_declared */
extern T1 T114f299(T0* C);
/* ET_XACE_OPTIONS.exclude */
extern T0* T114f297(T0* C);
/* ET_XACE_OPTIONS.default_exclude */
extern unsigned char ge1130os7099;
extern T0* ge1130ov7099;
extern T0* T114f232(T0* C);
/* ET_XACE_OPTIONS.is_exclude_declared */
extern T1 T114f295(T0* C);
/* ET_XACE_OPTIONS.exception_trace */
extern T1 T114f293(T0* C);
/* ET_XACE_OPTIONS.is_exception_trace_declared */
extern T1 T114f291(T0* C);
/* ET_XACE_OPTIONS.dynamic_runtime */
extern T1 T114f288(T0* C);
/* ET_XACE_OPTIONS.is_dynamic_runtime_declared */
extern T1 T114f286(T0* C);
/* ET_XACE_OPTIONS.dotnet_naming_convention */
extern T1 T114f284(T0* C);
/* ET_XACE_OPTIONS.is_dotnet_naming_convention_declared */
extern T1 T114f279(T0* C);
/* ET_XACE_OPTIONS.document */
extern T0* T114f277(T0* C);
/* ET_XACE_OPTIONS.default_document */
extern unsigned char ge1130os7094;
extern T0* ge1130ov7094;
extern T0* T114f224(T0* C);
/* ET_XACE_OPTIONS.is_document_declared */
extern T1 T114f275(T0* C);
/* ET_XACE_OPTIONS.debugger */
extern T1 T114f273(T0* C);
/* ET_XACE_OPTIONS.is_debugger_declared */
extern T1 T114f271(T0* C);
/* ET_XACE_OPTIONS.debug_tag */
extern T0* T114f269(T0* C);
/* ET_XACE_OPTIONS.default_debug_tag */
extern unsigned char ge1130os7092;
extern T0* ge1130ov7092;
extern T0* T114f220(T0* C);
/* ET_XACE_OPTIONS.is_debug_tag_declared */
extern T1 T114f267(T0* C);
/* ET_XACE_OPTIONS.debug_option */
extern T1 T114f265(T0* C);
/* ET_XACE_OPTIONS.is_debug_option_declared */
extern T1 T114f263(T0* C);
/* ET_XACE_OPTIONS.dead_code_removal */
extern T0* T114f261(T0* C);
/* ET_XACE_OPTIONS.default_dead_code_removal */
extern unsigned char ge1130os7090;
extern T0* ge1130ov7090;
extern T0* T114f216(T0* C);
/* ET_XACE_OPTIONS.is_dead_code_removal_declared */
extern T1 T114f259(T0* C);
/* ET_XACE_OPTIONS.c_compiler_options */
extern T0* T114f257(T0* C);
/* ET_XACE_OPTIONS.default_c_compiler_options */
extern unsigned char ge1130os7089;
extern T0* ge1130ov7089;
extern T0* T114f214(T0* C);
/* ET_XACE_OPTIONS.is_c_compiler_options_declared */
extern T1 T114f255(T0* C);
/* ET_XACE_OPTIONS.culture */
extern T0* T114f253(T0* C);
/* ET_XACE_OPTIONS.default_culture */
extern unsigned char ge1130os7088;
extern T0* ge1130ov7088;
extern T0* T114f212(T0* C);
/* ET_XACE_OPTIONS.is_culture_declared */
extern T1 T114f251(T0* C);
/* ET_XACE_OPTIONS.create_keyword_extension */
extern T1 T114f249(T0* C);
/* ET_XACE_OPTIONS.is_create_keyword_extension_declared */
extern T1 T114f247(T0* C);
/* ET_XACE_OPTIONS.console_application */
extern T1 T114f245(T0* C);
/* ET_XACE_OPTIONS.component */
extern T0* T114f241(T0* C);
/* ET_XACE_OPTIONS.default_component */
extern unsigned char ge1130os7085;
extern T0* ge1130ov7085;
extern T0* T114f206(T0* C);
/* ET_XACE_OPTIONS.is_component_declared */
extern T1 T114f239(T0* C);
/* ET_XACE_OPTIONS.cls_compliant */
extern T1 T114f237(T0* C);
/* ET_XACE_OPTIONS.is_cls_compliant_declared */
extern T1 T114f235(T0* C);
/* ET_XACE_OPTIONS.clean */
extern T1 T114f233(T0* C);
/* ET_XACE_OPTIONS.is_clean_declared */
extern T1 T114f231(T0* C);
/* ET_XACE_OPTIONS.check_vape */
extern T1 T114f229(T0* C);
/* ET_XACE_OPTIONS.is_check_vape_declared */
extern T1 T114f227(T0* C);
/* ET_XACE_OPTIONS.case_insensitive */
extern T1 T114f225(T0* C);
/* ET_XACE_OPTIONS.is_case_insensitive_declared */
extern T1 T114f223(T0* C);
/* ET_XACE_OPTIONS.callback */
extern T0* T114f221(T0* C);
/* ET_XACE_OPTIONS.default_callback */
extern unsigned char ge1130os7080;
extern T0* ge1130ov7080;
extern T0* T114f196(T0* C);
/* ET_XACE_OPTIONS.is_callback_declared */
extern T1 T114f219(T0* C);
/* ET_XACE_OPTIONS.assertion */
extern T0* T114f217(T0* C);
/* ET_XACE_OPTIONS.default_assertion */
extern unsigned char ge1130os7079;
extern T0* ge1130ov7079;
extern T0* T114f194(T0* C);
/* ET_XACE_OPTIONS.is_assertion_declared */
extern T1 T114f215(T0* C);
/* ET_XACE_OPTIONS.assembly */
extern T0* T114f213(T0* C);
/* ET_XACE_OPTIONS.default_assembly */
extern unsigned char ge1130os7078;
extern T0* ge1130ov7078;
extern T0* T114f193(T0* C);
/* ET_XACE_OPTIONS.is_assembly_declared */
extern T1 T114f211(T0* C);
/* ET_XACE_OPTIONS.array_optimization */
extern T1 T114f209(T0* C);
/* ET_XACE_OPTIONS.is_array_optimization_declared */
extern T1 T114f207(T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].forth */
extern void T115f8(T0* C);
/* DS_HASH_SET [STRING_8].cursor_forth */
extern void T117f65(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].add_traversing_cursor */
extern void T117f67(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_next_cursor */
extern void T115f10(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].remove_traversing_cursor */
extern void T117f66(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_position */
extern void T115f9(T0* C, T6 a1);
/* DS_HASH_SET_CURSOR [STRING_8].item */
extern T0* T115f4(T0* C);
/* DS_HASH_SET [STRING_8].cursor_item */
extern T0* T117f33(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].item_storage_item */
extern T0* T117f31(T0* C, T6 a1);
/* DS_HASH_SET_CURSOR [STRING_8].after */
extern T1 T115f5(T0* C);
/* DS_HASH_SET [STRING_8].cursor_after */
extern T1 T117f32(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].start */
extern void T115f7(T0* C);
/* DS_HASH_SET [STRING_8].cursor_start */
extern void T117f64(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].cursor_off */
extern T1 T117f37(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].new_cursor */
extern T0* T117f25(T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].make */
extern T0* T115c6(T0* a1);
/* ET_XACE_OPTIONS.arguments */
extern T0* T114f205(T0* C);
/* ET_XACE_OPTIONS.default_arguments */
extern unsigned char ge1130os7076;
extern T0* ge1130ov7076;
extern T0* T114f189(T0* C);
/* ET_XACE_OPTIONS.is_arguments_declared */
extern T1 T114f203(T0* C);
/* ET_XACE_OPTIONS.address_expression */
extern T1 T114f201(T0* C);
/* ET_XACE_OPTIONS.is_address_expression_declared */
extern T1 T114f199(T0* C);
/* ET_XACE_OPTIONS.abstract */
extern T1 T114f188(T0* C);
/* ET_XACE_OPTIONS.is_abstract_declared */
extern T1 T114f186(T0* C);
/* ET_XACE_XACE_VE_GENERATOR.print_indentation */
extern void T49f24(T0* C, T6 a1, T0* a2);
/* ET_XACE_XACE_VE_GENERATOR.print_quote_escaped_string */
extern void T49f23(T0* C, T0* a1, T0* a2);
/* ET_XACE_XACE_VE_GENERATOR.quot_entity */
extern unsigned char ge1229os2558;
extern T0* ge1229ov2558;
extern T0* T49f8(T0* C);
/* ET_XACE_XACE_VE_GENERATOR.print_escaped_string */
extern void T49f29(T0* C, T0* a1, T0* a2);
/* ET_XACE_XACE_VE_GENERATOR.print_escaped_character */
extern void T49f31(T0* C, T6 a1, T0* a2);
/* ET_XACE_XACE_VE_GENERATOR.amp_entity */
extern unsigned char ge1229os2557;
extern T0* ge1229ov2557;
extern T0* T49f16(T0* C);
/* ET_XACE_XACE_VE_GENERATOR.gt_entity */
extern unsigned char ge1229os2556;
extern T0* ge1229ov2556;
extern T0* T49f14(T0* C);
/* ET_XACE_XACE_VE_GENERATOR.lt_entity */
extern unsigned char ge1229os2555;
extern T0* ge1229ov2555;
extern T0* T49f12(T0* C);
/* ET_XACE_XACE_VE_GENERATOR.is_escaped */
extern T1 T49f9(T0* C, T6 a1);
/* KL_TEXT_OUTPUT_FILE.put_string */
extern void T84f29(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_put_string */
extern void T84f32(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_ps */
extern void T84f34(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_TEXT_OUTPUT_FILE.string_ */
extern T0* T84f9(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_new_line */
extern void T84f28(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_line */
extern void T84f27(T0* C, T0* a1);
/* ET_XACE_ACE_SE_GENERATOR.generate_system */
extern void T48f14(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_SE_GENERATOR.print_ace_file */
extern void T48f16(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_SE_GENERATOR.print_c_compiler_options */
extern void T48f26(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [STRING_8].is_last */
extern T1 T31f7(T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_is_last */
extern T1 T33f8(T0* C, T0* a1);
/* ET_XACE_ACE_SE_GENERATOR.print_generate */
extern void T48f25(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_ACE_SE_GENERATOR.options */
extern T0* T48f8(T0* C);
/* ET_XACE_ACE_SE_GENERATOR.string_ */
extern T0* T48f9(T0* C);
/* ET_XACE_ACE_SE_GENERATOR.print_link_libraries */
extern void T48f24(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_SE_GENERATOR.print_include_directories */
extern void T48f23(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_SE_GENERATOR.generate_cecil_file */
extern void T48f22(T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_cannot_write_file_error */
extern void T28f17(T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.make */
extern T0* T90c7(T0* a1);
/* KL_TEXT_OUTPUT_FILE.close */
extern void T84f22(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_close */
extern void T84f25(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_close */
extern void T84f26(T0* C, T14 a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE].forth */
extern void T152f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].cursor_forth */
extern void T148f10(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].add_traversing_cursor */
extern void T148f11(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE].set_next_cursor */
extern void T152f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].remove_traversing_cursor */
extern void T148f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE].set */
extern void T152f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE].item */
extern T0* T152f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE].start */
extern void T152f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].cursor_start */
extern void T148f9(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].cursor_off */
extern T1 T148f5(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].new_cursor */
extern T0* T148f7(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_EXPORTED_FEATURE].make */
extern T0* T152c7(T0* a1);
/* KL_TEXT_OUTPUT_FILE.is_open_write */
extern T1 T84f11(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
extern T1 T84f8(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T84f21(T0* C);
/* KL_TEXT_OUTPUT_FILE.is_closed */
extern T1 T84f12(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_closed */
extern T1 T84f18(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_write */
extern void T84f24(T0* C);
/* KL_TEXT_OUTPUT_FILE.default_pointer */
extern T14 T84f15(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T84f24p1(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_open */
extern T14 T84f17(T0* C, T14 a1, T6 a2);
/* UC_UTF8_STRING.to_c */
extern T0* T239f32(T0* C);
/* STRING_8.to_c */
extern T0* T17f26(T0* C);
/* KL_TEXT_OUTPUT_FILE.make */
extern T0* T84c20(T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_make */
extern void T84f23(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].is_empty */
extern T1 T148f6(T0* C);
/* ET_XACE_EXTERNALS.is_empty */
extern T1 T129f7(T0* C);
/* ET_XACE_SYSTEM.merge_exported_features */
extern void T81f9(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.merge_exported_features */
extern void T112f10(T0* C, T0* a1);
/* ET_XACE_CLUSTER.merge_exported_features */
extern void T120f46(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].force_last */
extern void T148f13(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_EXPORTED_FEATURE].put_right */
extern void T260f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_EXPORTED_FEATURE].make */
extern T0* T260c3(T0* a1);
/* ET_XACE_EXPORTED_FEATURE.make */
extern T0* T151c4(T0* a1, T0* a2, T0* a3);
/* DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE].make */
extern T0* T148c8(void);
/* ET_XACE_SYSTEM.merge_externals */
extern void T81f8(T0* C, T0* a1);
/* ET_XACE_MOUNTED_LIBRARIES.merge_externals */
extern void T113f8(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.merge_externals */
extern void T112f9(T0* C, T0* a1);
/* ET_XACE_CLUSTER.merge_externals */
extern void T120f45(T0* C, T0* a1);
/* ET_XACE_EXTERNALS.put_link_library */
extern void T129f11(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].force_last */
extern void T33f15(T0* C, T0* a1);
/* ET_XACE_EXTERNALS.put_include_directory */
extern void T129f10(T0* C, T0* a1);
/* ET_XACE_EXTERNALS.put_c_compiler_options */
extern void T129f9(T0* C, T0* a1);
/* ET_XACE_EXTERNALS.make */
extern T0* T129c8(void);
/* ET_XACE_ACE_SE_GENERATOR.print_clusters */
extern void T48f21(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_SE_GENERATOR.print_cluster */
extern void T48f27(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_SE_GENERATOR.print_class_options */
extern T1 T48f11(T0* C, T0* a1, T6 a2, T0* a3);
/* DS_HASH_SET [STRING_8].has */
extern T1 T117f18(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].search_position */
extern void T117f45(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].key_storage_item */
extern T0* T117f23(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].key_equality_tester */
extern T0* T117f22(T0* C);
/* ET_XACE_ACE_SE_GENERATOR.print_cluster_options */
extern T1 T48f10(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_CLUSTER.full_pathname */
extern T0* T120f20(T0* C);
/* KL_UNIX_FILE_SYSTEM.pathname */
extern T0* T134f8(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.append_character */
extern void T239f55(T0* C, T2 a1);
/* KL_UNIX_FILE_SYSTEM.string_ */
extern T0* T134f9(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.pathname */
extern T0* T352f5(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_separator */
extern T1 T352f3(T0* C, T2 a1);
/* KL_WINDOWS_FILE_SYSTEM.string_ */
extern T0* T352f2(T0* C);
/* ET_XACE_CLUSTER.file_system */
extern unsigned char ge115os1730;
extern T0* ge115ov1730;
extern T0* T120f23(T0* C);
/* ET_XACE_CLUSTER.unix_file_system */
extern unsigned char ge115os1733;
extern T0* ge115ov1733;
extern T0* T120f27(T0* C);
/* KL_UNIX_FILE_SYSTEM.make */
extern T0* T134c10(void);
/* KL_OPERATING_SYSTEM.is_unix */
extern unsigned char ge214os2969;
extern T1 ge214ov2969;
extern T1 T230f5(T0* C);
/* KL_OPERATING_SYSTEM.current_working_directory */
extern T0* T230f3(T0* C);
/* EXECUTION_ENVIRONMENT.current_working_directory */
extern T0* T253f2(T0* C);
/* KL_OPERATING_SYSTEM.execution_environment */
extern unsigned char ge214os2973;
extern T0* ge214ov2973;
extern T0* T230f4(T0* C);
/* EXECUTION_ENVIRONMENT.default_create */
extern T0* T253c4(void);
/* KL_OPERATING_SYSTEM.variable_value */
extern T0* T230f2(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.get */
extern T0* T253f1(T0* C, T0* a1);
/* STRING_8.make_from_c */
extern T0* T17c50(T14 a1);
/* STRING_8.from_c */
extern void T17f51(T0* C, T14 a1);
/* C_STRING.read_string_into */
extern void T326f6(T0* C, T0* a1);
/* C_STRING.read_substring_into */
extern void T326f8(T0* C, T0* a1, T6 a2, T6 a3);
/* STRING_8.put_code */
extern void T17f53(T0* C, T10 a1, T6 a2);
/* NATURAL_8.to_natural_32 */
extern T10 T8f12(T8* C);
/* MANAGED_POINTER.read_natural_8 */
extern T8 T356f6(T0* C, T6 a1);
/* TYPED_POINTER [NATURAL_8].memory_copy */
extern void T363f2(T363* C, T14 a1, T6 a2);
/* TYPED_POINTER [NATURAL_8].c_memcpy */
extern void T363f3(T363* C, T14 a1, T14 a2, T6 a3);
/* C_STRING.share_from_pointer */
extern void T326f5(T0* C, T14 a1);
/* C_STRING.share_from_pointer_and_count */
extern void T326f7(T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.set_from_pointer */
extern void T356f9(T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.share_from_pointer */
extern T0* T356c8(T14 a1, T6 a2);
/* C_STRING.c_strlen */
extern T6 T326f3(T0* C, T14 a1);
/* STRING_8.c_string_provider */
extern unsigned char ge2143os1257;
extern T0* ge2143ov1257;
extern T0* T17f28(T0* C);
/* C_STRING.make_empty */
extern T0* T326c4(T6 a1);
/* MANAGED_POINTER.make */
extern T0* T356c7(T6 a1);
/* EXCEPTIONS.raise */
extern void T364f3(T0* C, T0* a1);
/* EXCEPTIONS.eraise */
extern void T364f4(T0* C, T14 a1, T6 a2);
/* EXCEPTIONS.default_create */
extern T0* T364c2(void);
/* MANAGED_POINTER.default_pointer */
extern T14 T356f5(T0* C);
/* POINTER.memory_calloc */
extern T14 T14f2(T14* C, T6 a1, T6 a2);
/* POINTER.c_calloc */
extern T14 T14f3(T14* C, T6 a1, T6 a2);
/* EXECUTION_ENVIRONMENT.eif_getenv */
extern T14 T253f3(T0* C, T14 a1);
/* ET_XACE_CLUSTER.windows_file_system */
extern unsigned char ge115os1731;
extern T0* ge115ov1731;
extern T0* T120f26(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.make */
extern T0* T352c6(void);
/* KL_OPERATING_SYSTEM.is_windows */
extern unsigned char ge214os2968;
extern T1 ge214ov2968;
extern T1 T230f1(T0* C);
/* ET_XACE_CLUSTER.operating_system */
extern T0* T120f25(T0* C);
/* ET_XACE_CLUSTER.prefixed_name */
extern T0* T120f29(T0* C);
/* ET_XACE_CLUSTER.string_ */
extern T0* T120f22(T0* C);
/* ET_XACE_ACE_SE_GENERATOR.print_options */
extern void T48f20(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_ACE_SE_GENERATOR.print_escaped_name */
extern void T48f19(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.has */
extern T1 T239f47(T0* C, T2 a1);
/* UC_UTF8_STRING.index_of */
extern T6 T239f48(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.index_of_item_code */
extern T6 T239f49(T0* C, T6 a1, T6 a2);
/* ET_XACE_ACE_SE_GENERATOR.print_indentation */
extern void T48f18(T0* C, T6 a1, T0* a2);
/* ET_XACE_LOADPATH_GENERATOR.generate_system */
extern void T47f9(T0* C, T0* a1, T0* a2);
/* ET_XACE_LOADPATH_GENERATOR.print_clusters */
extern void T47f11(T0* C, T0* a1, T0* a2);
/* ET_XACE_LOADPATH_GENERATOR.print_cluster */
extern void T47f12(T0* C, T0* a1, T0* a2);
/* ET_XACE_ESD_GENERATOR.generate_system */
extern void T46f13(T0* C, T0* a1, T0* a2);
/* ET_XACE_ESD_GENERATOR.print_esd_file */
extern void T46f15(T0* C, T0* a1, T0* a2);
/* ET_XACE_ESD_GENERATOR.print_options */
extern void T46f23(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_ESD_GENERATOR.string_ */
extern T0* T46f10(T0* C);
/* ET_XACE_ESD_GENERATOR.options */
extern T0* T46f9(T0* C);
/* ET_XACE_ESD_GENERATOR.print_link_libraries */
extern void T46f22(T0* C, T0* a1, T0* a2);
/* ET_XACE_ESD_GENERATOR.remove_all_characters */
extern T0* T46f8(T0* C, T0* a1, T2 a2);
/* UC_UTF8_STRING.remove */
extern void T239f63(T0* C, T6 a1);
/* UC_UTF8_STRING.move_bytes_left */
extern void T239f76(T0* C, T6 a1, T6 a2);
/* STRING_8.remove */
extern void T17f48(T0* C, T6 a1);
/* ET_XACE_EXTERNALS.has_link_libraries */
extern T1 T129f5(T0* C);
/* ET_XACE_ESD_GENERATOR.print_callbacks */
extern void T46f21(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING_8], STRING_8].forth */
extern void T147f9(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].cursor_forth */
extern void T146f63(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].add_traversing_cursor */
extern void T146f65(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING_8], STRING_8].set_next_cursor */
extern void T147f11(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].remove_traversing_cursor */
extern void T146f64(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING_8], STRING_8].set_position */
extern void T147f10(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].clashes_item */
extern T6 T146f32(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING_8], STRING_8].item */
extern T0* T147f6(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].cursor_item */
extern T0* T146f36(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].item_storage_item */
extern T0* T146f27(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING_8], STRING_8].key */
extern T0* T147f5(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].cursor_key */
extern T0* T146f35(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].key_storage_item */
extern T0* T146f22(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING_8], STRING_8].after */
extern T1 T147f4(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].cursor_after */
extern T1 T146f34(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING_8], STRING_8].start */
extern void T147f8(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].cursor_start */
extern void T146f62(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].cursor_off */
extern T1 T146f41(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].is_empty */
extern T1 T146f40(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].new_cursor */
extern T0* T146f38(T0* C);
/* DS_HASH_TABLE_CURSOR [DS_HASH_SET [STRING_8], STRING_8].make */
extern T0* T147c7(T0* a1);
/* ET_XACE_ESD_GENERATOR.merge_callbacks */
extern void T46f26(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].force */
extern void T146f44(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].key_storage_put */
extern void T146f52(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].slots_put */
extern void T146f51(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].clashes_put */
extern void T146f50(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].slots_item */
extern T6 T146f33(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].hash_position */
extern T6 T146f24(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].resize */
extern void T146f49(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].clashes_resize */
extern void T146f57(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].special_integer_ */
extern T0* T146f31(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].key_storage_resize */
extern void T146f56(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].item_storage_resize */
extern void T146f55(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [STRING_8]].resize */
extern T0* T259f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_HASH_SET [STRING_8]].resized_area */
extern T0* T255f3(T0* C, T6 a1);
/* SPECIAL [DS_HASH_SET [STRING_8]].copy_data */
extern void T255f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [DS_HASH_SET [STRING_8]].move_data */
extern void T255f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_HASH_SET [STRING_8]].overlapping_move */
extern void T255f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_HASH_SET [STRING_8]].non_overlapping_move */
extern void T255f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_HASH_SET [STRING_8]].make */
extern T0* T255c4(T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].slots_resize */
extern void T146f54(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].new_modulus */
extern T6 T146f25(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].new_capacity */
extern T6 T146f23(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].item_storage_put */
extern void T146f48(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].search_position */
extern void T146f45(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].unset_found_item */
extern void T146f47(T0* C);
/* DS_HASH_SET [STRING_8].force */
extern void T117f40(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].resize */
extern void T117f48(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].clashes_resize */
extern void T117f59(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].key_storage_resize */
extern void T117f58(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_resize */
extern void T117f57(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].slots_resize */
extern void T117f56(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].new_capacity */
extern T6 T117f21(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_default */
extern T0* T117c38(void);
/* DS_HASH_SET [STRING_8].default_capacity */
extern T6 T117f28(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].item */
extern T0* T146f29(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].has */
extern T1 T146f28(T0* C, T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].set_key_equality_tester */
extern void T146f43(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [DS_HASH_SET [STRING_8], STRING_8].internal_set_equality_tester */
extern void T257f6(T0* C, T0* a1);
/* ET_XACE_ESD_GENERATOR.string_equality_tester */
extern T0* T46f7(T0* C);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].make_map */
extern T0* T146c42(T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].make_with_equality_testers */
extern void T146f46(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [DS_HASH_SET [STRING_8], STRING_8].make */
extern T0* T257c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [DS_HASH_SET [STRING_8], STRING_8].new_cursor */
extern T0* T257f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [DS_HASH_SET [STRING_8], STRING_8].make */
extern T0* T314c3(T0* a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].make_sparse_container */
extern void T146f53(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].make_slots */
extern void T146f61(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].make_clashes */
extern void T146f60(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].make_key_storage */
extern void T146f59(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_HASH_SET [STRING_8], STRING_8].make_item_storage */
extern void T146f58(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [STRING_8]].make */
extern T0* T259f2(T0* C, T6 a1);
/* TO_SPECIAL [DS_HASH_SET [STRING_8]].make_area */
extern T0* T315c2(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [STRING_8]].default_create */
extern T0* T259c3(void);
/* ET_XACE_ESD_GENERATOR.print_interface_classes */
extern void T46f20(T0* C, T0* a1, T0* a2);
/* ET_XACE_ESD_GENERATOR.merge_interface_classes */
extern void T46f25(T0* C, T0* a1, T0* a2);
/* ET_XACE_ESD_GENERATOR.print_clusters */
extern void T46f19(T0* C, T0* a1, T0* a2);
/* ET_XACE_ESD_GENERATOR.print_cluster */
extern void T46f24(T0* C, T0* a1, T0* a2);
/* ET_XACE_ESD_GENERATOR.print_escaped_name */
extern void T46f18(T0* C, T0* a1, T0* a2);
/* ET_XACE_ESD_GENERATOR.print_indentation */
extern void T46f17(T0* C, T6 a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.generate_system */
extern void T45f25(T0* C, T0* a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.print_ecf_system_file */
extern void T45f27(T0* C, T0* a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.print_override_clusters */
extern void T45f41(T0* C, T0* a1, T6 a2, T0* a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].forth */
extern void T137f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].cursor_forth */
extern void T136f10(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].add_traversing_cursor */
extern void T136f11(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].set_next_cursor */
extern void T137f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].remove_traversing_cursor */
extern void T136f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].set */
extern void T137f10(T0* C, T0* a1, T1 a2, T1 a3);
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
extern void T126f10(T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.string_ */
extern T0* T45f10(T0* C);
/* ET_XACE_ECF_GENERATOR.print_class_options */
extern void T45f48(T0* C, T0* a1, T6 a2, T0* a3);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].do_all */
extern void T123f10(T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.print_file_rules */
extern void T45f47(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_ECF_GENERATOR.print_escaped_string */
extern void T45f42(T0* C, T0* a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.print_escaped_character */
extern void T45f46(T0* C, T6 a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.quot_entity */
extern T0* T45f9(T0* C);
/* ET_XACE_ECF_GENERATOR.amp_entity */
extern T0* T45f21(T0* C);
/* ET_XACE_ECF_GENERATOR.gt_entity */
extern T0* T45f19(T0* C);
/* ET_XACE_ECF_GENERATOR.lt_entity */
extern T0* T45f17(T0* C);
/* ET_XACE_ECF_GENERATOR.is_escaped */
extern T1 T45f15(T0* C, T6 a1);
/* ET_XACE_CLUSTER.is_fully_abstract */
extern T1 T120f28(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].item */
extern T0* T137f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].start */
extern void T137f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].cursor_start */
extern void T136f9(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].cursor_off */
extern T1 T136f6(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].new_cursor */
extern T0* T136f7(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER].make */
extern T0* T137c7(T0* a1);
/* ET_XACE_CLUSTERS.merge_override_clusters */
extern void T112f8(T0* C, T0* a1);
/* ET_XACE_CLUSTER.merge_override_clusters */
extern void T120f44(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].force_last */
extern void T136f13(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_CLUSTER].put_right */
extern void T254f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_CLUSTER].make */
extern T0* T254c3(T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].is_empty */
extern T1 T136f5(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLUSTER].make */
extern T0* T136c8(void);
/* ET_XACE_ECF_GENERATOR.print_clusters */
extern void T45f40(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_ECF_GENERATOR.print_cluster */
extern void T45f44(T0* C, T0* a1, T6 a2, T0* a3);
/* Creation of agent #1 in feature ET_XACE_ECF_GENERATOR.print_cluster */
extern T0* T45f44ac1(T0* a1, T6 a2, T0* a3);
/* Creation of agent #2 in feature ET_XACE_ECF_GENERATOR.print_cluster */
extern T0* T45f44ac2(T0* a1, T6 a2, T0* a3);
/* ET_XACE_CLUSTER.is_fully_ecf_abstract */
extern T1 T120f21(T0* C);
/* ET_XACE_OPTIONS.is_ecf_library_declared */
extern T1 T114f337(T0* C);
/* ET_XACE_ECF_GENERATOR.print_assemblies */
extern void T45f39(T0* C, T0* a1, T6 a2, T0* a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].forth */
extern void T132f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].cursor_forth */
extern void T131f10(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].add_traversing_cursor */
extern void T131f11(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].set_next_cursor */
extern void T132f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].remove_traversing_cursor */
extern void T131f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].set */
extern void T132f10(T0* C, T0* a1, T1 a2, T1 a3);
/* ET_XACE_ECF_GENERATOR.print_escaped_name */
extern void T45f43(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].item */
extern T0* T132f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].start */
extern void T132f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].cursor_start */
extern void T131f9(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].cursor_off */
extern T1 T131f5(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].new_cursor */
extern T0* T131f7(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY].make */
extern T0* T132c7(T0* a1);
/* ET_XACE_CLUSTERS.merge_assemblies */
extern void T112f6(T0* C, T0* a1);
/* ET_XACE_CLUSTER.merge_assemblies */
extern void T120f42(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].force_last */
extern void T131f13(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_ASSEMBLY].put_right */
extern void T252f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_ASSEMBLY].make */
extern T0* T252c3(T0* a1);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].is_empty */
extern T1 T131f6(T0* C);
/* ET_XACE_ASSEMBLY.set_assembly_pathname */
extern void T133f9(T0* C, T0* a1);
/* ET_XACE_ASSEMBLY.make */
extern T0* T133c8(T0* a1, T0* a2, T0* a3, T0* a4, T0* a5, T0* a6);
/* DS_LINKED_LIST [ET_XACE_ASSEMBLY].make */
extern T0* T131c8(void);
/* ET_XACE_ECF_GENERATOR.print_ecf_clusters */
extern void T45f38(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_CLUSTERS.merge_ecf_clusters */
extern void T112f7(T0* C, T0* a1);
/* ET_XACE_CLUSTER.merge_ecf_clusters */
extern void T120f43(T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.print_mounted_libraries */
extern void T45f37(T0* C, T0* a1, T6 a2, T0* a3);
/* KL_UNIX_FILE_SYSTEM.dirname */
extern T0* T134f3(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.root_directory */
extern unsigned char ge121os7573;
extern T0* ge121ov7573;
extern T0* T134f6(T0* C);
/* KL_UNIX_FILE_SYSTEM.is_root_directory */
extern T1 T134f5(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.basename */
extern T0* T134f2(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.interpreted_string */
extern T0* T135f2(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.variable_value */
extern T0* T135f1(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.environment_impl */
extern unsigned char ge196os7686;
extern T0* ge196ov7686;
extern T0* T135f3(T0* C);
/* KL_STRING_ROUTINES.append_substring_to_string */
extern void T51f15(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* KL_STRING_ROUTINES.appended_substring */
extern T0* T51f3(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* KL_EXECUTION_ENVIRONMENT.string_ */
extern T0* T135f4(T0* C);
/* ET_XACE_ECF_GENERATOR.execution_environment */
extern unsigned char ge135os1729;
extern T0* ge135ov1729;
extern T0* T45f14(T0* C);
/* KL_EXECUTION_ENVIRONMENT.default_create */
extern T0* T135c5(void);
/* UC_UTF8_STRING.remove_tail */
extern void T239f62(T0* C, T6 a1);
/* UC_UTF8_STRING.keep_head */
extern void T239f78(T0* C, T6 a1);
/* STRING_8.remove_tail */
extern void T17f47(T0* C, T6 a1);
/* STRING_8.keep_head */
extern void T17f49(T0* C, T6 a1);
/* KL_UNIX_FILE_SYSTEM.extension */
extern T0* T134f1(T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.unix_file_system */
extern T0* T45f13(T0* C);
/* ET_XACE_ECF_GENERATOR.print_external_libraries */
extern void T45f36(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_ECF_GENERATOR.replace_all_characters */
extern T0* T45f12(T0* C, T0* a1, T2 a2, T2 a3);
/* UC_UTF8_STRING.put */
extern void T239f61(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.move_bytes_right */
extern void T239f77(T0* C, T6 a1, T6 a2);
/* ET_XACE_ECF_GENERATOR.is_windows */
extern T1 T45f11(T0* C);
/* ET_XACE_ECF_GENERATOR.operating_system */
extern T0* T45f22(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].value */
extern T0* T24f32(T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.print_external_c_compiler_options */
extern void T45f35(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_EXTERNALS.has_c_compiler_options */
extern T1 T129f4(T0* C);
/* ET_XACE_ECF_GENERATOR.print_external_includes */
extern void T45f34(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_EXTERNALS.has_include_directories */
extern T1 T129f6(T0* C);
/* ET_XACE_ECF_GENERATOR.print_settings */
extern void T45f33(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_ECF_GENERATOR.print_options */
extern void T45f32(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_OPTIONS.set_debug_option */
extern void T114f356(T0* C, T1 a1);
/* UT_TRISTATE.set_false */
extern void T243f7(T0* C);
/* UT_TRISTATE.set_true */
extern void T243f6(T0* C);
/* UT_TRISTATE.make_undefined */
extern T0* T243c5(void);
/* UT_TRISTATE.set_undefined */
extern void T243f8(T0* C);
/* ET_XACE_OPTIONS.set_profile */
extern void T114f401(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_trace */
extern void T114f412(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_warning */
extern void T114f418(T0* C, T0* a1);
/* ET_XACE_ECF_GENERATOR.options */
extern T0* T45f7(T0* C);
/* ET_XACE_ECF_GENERATOR.print_indentation */
extern void T45f31(T0* C, T6 a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.print_quote_escaped_string */
extern void T45f30(T0* C, T0* a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.print_ecf_namespaces */
extern void T45f29(T0* C, T0* a1);
/* ET_XACE_ACE_GENERATOR.generate_system */
extern void T44f19(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_GENERATOR.print_ace_file */
extern void T44f21(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_GENERATOR.print_link_libraries */
extern void T44f29(T0* C, T0* a1, T0* a2);
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
/* ET_XACE_ACE_GENERATOR.options */
extern T0* T44f8(T0* C);
/* ET_XACE_ACE_GENERATOR.print_cluster_options */
extern T1 T44f12(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_ACE_GENERATOR.print_options */
extern void T44f25(T0* C, T0* a1, T6 a2, T0* a3);
/* ET_XACE_ACE_GENERATOR.print_escaped_name */
extern void T44f24(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_GENERATOR.is_lace_keyword */
extern T1 T44f7(T0* C, T0* a1);
/* ARRAY [STRING_8].item */
extern T0* T67f5(T0* C, T6 a1);
/* ET_XACE_ACE_GENERATOR.lace_keywords */
extern unsigned char ge1153os2638;
extern T0* ge1153ov2638;
extern T0* T44f14(T0* C);
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
/* ET_XACE_XACE_VE_GENERATOR.generate_library */
extern void T49f20(T0* C, T0* a1, T0* a2);
/* ET_XACE_XACE_VE_GENERATOR.print_xace_library_file */
extern void T49f22(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_SE_GENERATOR.generate_library */
extern void T48f15(T0* C, T0* a1, T0* a2);
/* ET_XACE_ACE_SE_GENERATOR.print_precompile_ace_file */
extern void T48f17(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY.merge_exported_features */
extern void T86f9(T0* C, T0* a1);
/* ET_XACE_LIBRARY.merge_externals */
extern void T86f8(T0* C, T0* a1);
/* ET_XACE_LOADPATH_GENERATOR.generate_library */
extern void T47f10(T0* C, T0* a1, T0* a2);
/* ET_XACE_ESD_GENERATOR.generate_library */
extern void T46f14(T0* C, T0* a1, T0* a2);
/* ET_XACE_ESD_GENERATOR.print_eld_file */
extern void T46f16(T0* C, T0* a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.generate_library */
extern void T45f26(T0* C, T0* a1, T0* a2);
/* ET_XACE_ECF_GENERATOR.print_ecf_library_file */
extern void T45f28(T0* C, T0* a1, T0* a2);
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
extern T0* T89c7(T0* a1);
/* ET_XACE_PARSER.parse_file */
extern void T87f228(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.last_error_extended_description */
extern T0* T104f89(T0* C);
/* XM_EIFFEL_PARSER.string_ */
extern T0* T104f85(T0* C);
/* XM_EIFFEL_PARSER.last_error_description */
extern T0* T104f177(T0* C);
/* INTEGER_32.out */
extern T0* T6f19(T6* C);
/* STRING_8.append_integer */
extern void T17f45(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.safe_error_component */
extern T0* T104f170(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_safe_error_character */
extern T1 T104f109(T0* C, T2 a1);
/* CHARACTER_8.infix ">=" */
extern T1 T2f14(T2* C, T2 a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_parser_error */
extern void T28f18(T0* C, T0* a1);
/* UT_MESSAGE.make */
extern T0* T110c7(T0* a1);
/* XM_TREE_CALLBACKS_PIPE.last_error */
extern T0* T97f8(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_not_xace_file_error */
extern void T28f19(T0* C, T0* a1);
/* ET_XACE_NOT_XACE_FILE_ERROR.make */
extern T0* T111c7(T0* a1);
/* ET_XACE_PARSER.new_library */
extern T0* T87f12(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY.mount_libraries */
extern void T86f15(T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.mount_libraries */
extern void T113f9(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.mount_libraries */
extern void T112f15(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTERS.put_last */
extern void T112f4(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].force_last */
extern void T119f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].resize */
extern void T119f13(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER].resize */
extern T0* T245f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_XACE_CLUSTER].resized_area */
extern T0* T244f3(T0* C, T6 a1);
/* SPECIAL [ET_XACE_CLUSTER].copy_data */
extern void T244f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [ET_XACE_CLUSTER].move_data */
extern void T244f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ET_XACE_CLUSTER].overlapping_move */
extern void T244f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ET_XACE_CLUSTER].non_overlapping_move */
extern void T244f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ET_XACE_CLUSTER].make */
extern T0* T244c4(T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].new_capacity */
extern T6 T119f9(T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].extendible */
extern T1 T119f8(T0* C, T6 a1);
/* ET_XACE_CLUSTER.set_library_prefix */
extern void T120f47(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.set_library_prefix */
extern void T112f12(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_mounted */
extern void T120f49(T0* C, T1 a1);
/* ET_XACE_CLUSTERS.set_mounted */
extern void T112f16(T0* C, T1 a1);
/* ET_XACE_CLUSTERS.make_empty */
extern T0* T112c11(void);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].make */
extern T0* T119c10(T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].new_cursor */
extern T0* T119f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_XACE_CLUSTER].make */
extern T0* T246c2(T0* a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER].make */
extern T0* T245f1(T0* C, T6 a1);
/* TO_SPECIAL [ET_XACE_CLUSTER].make_area */
extern T0* T312c2(T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_CLUSTER].default_create */
extern T0* T245c3(void);
/* ET_XACE_PARSER.fill_library */
extern void T87f230(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY.set_libraries */
extern void T86f14(T0* C, T0* a1);
/* ET_XACE_LIBRARY.set_clusters */
extern void T86f13(T0* C, T0* a1);
/* ET_XACE_LIBRARY.merge_libraries */
extern void T86f16(T0* C, T0* a1, T0* a2);
/* ET_XACE_MOUNTED_LIBRARIES.merge_libraries */
extern void T113f10(T0* C, T0* a1, T0* a2);
/* ET_XACE_MOUNTED_LIBRARY.set_root */
extern void T122f10(T0* C, T1 a1);
/* ET_XACE_MOUNTED_LIBRARY.cloned_object */
extern T0* T122f6(T0* C);
/* ET_XACE_MOUNTED_LIBRARY.twin */
extern T0* T122f7(T0* C);
/* ET_XACE_MOUNTED_LIBRARY.copy */
extern void T122f11(T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_multiple_library_prefix_error */
extern void T28f36(T0* C, T0* a1, T0* a2);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.make */
extern T0* T361c7(T0* a1, T0* a2);
/* XM_DEFAULT_POSITION.out */
extern T0* T175f5(T0* C);
/* XM_DEFAULT_POSITION.string_ */
extern T0* T175f6(T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.string_ */
extern T0* T113f4(T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.item */
extern T0* T113f3(T0* C, T0* a1);
/* ET_XACE_MOUNTED_LIBRARIES.set_root */
extern void T113f7(T0* C, T1 a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].is_empty */
extern T1 T121f6(T0* C);
/* ET_XACE_CLUSTERS.merge_libraries */
extern void T112f5(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTER.merge_libraries */
extern void T120f41(T0* C, T0* a1, T0* a2);
/* ET_XACE_PARSER.fill_externals */
extern void T87f233(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_CLUSTER.put_class_option */
extern void T120f33(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].put_last */
extern void T123f9(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_CLASS_OPTIONS].put_right */
extern void T250f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_CLASS_OPTIONS].make */
extern T0* T250c3(T0* a1);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].is_empty */
extern T1 T123f5(T0* C);
/* DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS].make */
extern T0* T123c8(void);
/* ET_XACE_PARSER.new_export */
extern T0* T87f131(T0* C, T0* a1, T0* a2);
/* ET_XACE_OPTIONS.set_export_option */
extern void T114f365(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].is_empty */
extern T1 T126f5(T0* C);
/* ET_XACE_CLASS_OPTIONS.put_feature_option */
extern void T125f5(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].put_last */
extern void T126f9(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_FEATURE_OPTIONS].put_right */
extern void T251f4(T0* C, T0* a1);
/* DS_LINKABLE [ET_XACE_FEATURE_OPTIONS].make */
extern T0* T251c3(T0* a1);
/* DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS].make */
extern T0* T126c8(void);
/* ET_XACE_PARSER.new_exported_feature */
extern T0* T87f224(T0* C, T0* a1, T0* a2);
/* ET_XACE_AST_FACTORY.new_feature_options */
extern T0* T92f9(T0* C, T0* a1, T0* a2);
/* ET_XACE_FEATURE_OPTIONS.make */
extern T0* T128c3(T0* a1, T0* a2);
/* ET_XACE_PARSER.uc_alias */
extern unsigned char ge1162os2405;
extern T0* ge1162ov2405;
extern T0* T87f226(T0* C);
/* ET_XACE_PARSER.uc_feature */
extern unsigned char ge1162os2406;
extern T0* ge1162ov2406;
extern T0* T87f223(T0* C);
/* ET_XACE_AST_FACTORY.new_class_options */
extern T0* T92f8(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLASS_OPTIONS.make */
extern T0* T125c4(T0* a1, T0* a2);
/* ET_XACE_PARSER.uc_class */
extern unsigned char ge1162os2381;
extern T0* ge1162ov2381;
extern T0* T87f26(T0* C);
/* ET_XACE_PARSER.uc_export */
extern unsigned char ge1162os2404;
extern T0* ge1162ov2404;
extern T0* T87f130(T0* C);
/* ET_XACE_OPTIONS.set_header */
extern void T114f373(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].force_last */
extern void T117f44(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_include_dir */
extern unsigned char ge1162os2403;
extern T0* ge1162ov2403;
extern T0* T87f129(T0* C);
/* ET_XACE_OPTIONS.set_link */
extern void T114f384(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].force_last */
extern void T118f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].resize */
extern void T118f20(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].new_capacity */
extern T6 T118f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].extendible */
extern T1 T118f9(T0* C, T6 a1);
/* ET_XACE_PARSER.uc_location */
extern unsigned char ge1162os2390;
extern T0* ge1162ov2390;
extern T0* T87f128(T0* C);
/* ET_XACE_PARSER.uc_link_library */
extern unsigned char ge1162os2407;
extern T0* ge1162ov2407;
extern T0* T87f127(T0* C);
/* ET_XACE_AST_FACTORY.new_options */
extern T0* T92f4(T0* C);
/* ET_XACE_OPTIONS.make */
extern T0* T114c338(void);
/* ET_XACE_PARSER.uc_external */
extern unsigned char ge1162os2394;
extern T0* ge1162ov2394;
extern T0* T87f24(T0* C);
/* ET_XACE_PARSER.new_options */
extern T0* T87f23(T0* C, T0* a1, T0* a2);
/* ET_XACE_PARSER.fill_options */
extern void T87f232(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_PARSER.uc_debug */
extern unsigned char ge1162os2401;
extern T0* ge1162ov2401;
extern T0* T87f126(T0* C);
/* ET_XACE_PARSER.uc_optimize */
extern unsigned char ge1162os2402;
extern T0* ge1162ov2402;
extern T0* T87f125(T0* C);
/* ET_XACE_PARSER.uc_check */
extern unsigned char ge1162os2400;
extern T0* ge1162ov2400;
extern T0* T87f123(T0* C);
/* ET_XACE_PARSER.uc_loop */
extern unsigned char ge1162os2399;
extern T0* ge1162ov2399;
extern T0* T87f120(T0* C);
/* ET_XACE_PARSER.uc_invariant */
extern unsigned char ge1162os2398;
extern T0* ge1162ov2398;
extern T0* T87f118(T0* C);
/* ET_XACE_PARSER.uc_ensure */
extern unsigned char ge1162os2397;
extern T0* ge1162ov2397;
extern T0* T87f116(T0* C);
/* ET_XACE_PARSER.uc_enable */
extern unsigned char ge1162os2395;
extern T0* ge1162ov2395;
extern T0* T87f114(T0* C);
/* ET_XACE_PARSER.uc_require */
extern unsigned char ge1162os2396;
extern T0* ge1162ov2396;
extern T0* T87f113(T0* C);
/* ET_XACE_OPTIONS.set_wedit */
extern void T114f419(T0* C, T1 a1);
/* ET_XACE_OPTIONS.valid_warning */
extern unsigned char ge1130os6991;
extern T0* ge1130ov6991;
extern T0* T114f184(T0* C);
/* DS_HASH_SET [STRING_8].put_last */
extern void T117f42(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].compress */
extern void T117f55(T0* C);
/* DS_HASH_SET [STRING_8].slots_wipe_out */
extern void T117f63(T0* C);
/* DS_HASH_SET [STRING_8].clashes_wipe_out */
extern void T117f62(T0* C);
/* DS_HASH_SET [STRING_8].move_all_cursors */
extern void T117f61(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING_8].key_storage_put */
extern void T117f60(T0* C, T0* a1, T6 a2);
/* ET_XACE_OPTIONS.set_visible_filename */
extern void T114f417(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_version */
extern void T114f416(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_verbose */
extern void T114f415(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_use_full_cluster_name_as_namespace */
extern void T114f414(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_use_cluster_name_as_namespace */
extern void T114f413(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_target */
extern void T114f411(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_target */
extern unsigned char ge1130os6989;
extern T0* ge1130ov6989;
extern T0* T114f182(T0* C);
/* ET_XACE_OPTIONS.set_strip_option */
extern void T114f410(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_storable_filename */
extern void T114f409(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_stack_size */
extern void T114f408(T0* C, T6 a1);
/* ET_XACE_OPTIONS.set_split */
extern void T114f407(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_shared_library_definition */
extern void T114f406(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_reloads_optimization */
extern void T114f405(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_recursive */
extern void T114f404(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_read_only */
extern void T114f403(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_public_key_token */
extern void T114f402(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_prefix_option */
extern void T114f400(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_precompiled */
extern void T114f399(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_portable_code_generation */
extern void T114f398(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_override_cluster */
extern void T114f397(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_no_default_lib */
extern void T114f396(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_namespace */
extern void T114f395(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_multithreaded */
extern void T114f394(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_msil_generation_version */
extern void T114f393(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_msil_generation */
extern void T114f392(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_msil_clr_version */
extern void T114f391(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_msil_assembly_compatibility */
extern void T114f390(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_metadata_cache_path */
extern void T114f389(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_map */
extern void T114f388(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_manifest_string_trace */
extern void T114f387(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_linux_fpu_double_precision */
extern void T114f386(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_linker */
extern void T114f385(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_linker */
extern unsigned char ge1130os6988;
extern T0* ge1130ov6988;
extern T0* T114f180(T0* C);
/* ET_XACE_OPTIONS.set_line_generation */
extern void T114f383(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_leaves_optimization */
extern void T114f382(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_layout_optimization */
extern void T114f381(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_layout */
extern void T114f380(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_layout */
extern unsigned char ge1130os6987;
extern T0* ge1130ov6987;
extern T0* T114f177(T0* C);
/* ET_XACE_OPTIONS.set_jumps_optimization */
extern void T114f379(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_inlining_size */
extern void T114f378(T0* C, T6 a1);
/* ET_XACE_OPTIONS.set_inlining */
extern void T114f377(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_inlining */
extern unsigned char ge1130os6986;
extern T0* ge1130ov6986;
extern T0* T114f176(T0* C);
/* ET_XACE_OPTIONS.set_include */
extern void T114f376(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_il_verifiable */
extern void T114f375(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_high_memory_compiler */
extern void T114f374(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_heap_size */
extern void T114f372(T0* C, T6 a1);
/* ET_XACE_OPTIONS.set_gc_info */
extern void T114f371(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_garbage_collector */
extern void T114f370(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_garbage_collector */
extern unsigned char ge1130os6985;
extern T0* ge1130ov6985;
extern T0* T114f175(T0* C);
/* ET_XACE_OPTIONS.set_fst_optimization */
extern void T114f369(T0* C, T1 a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_positive_integer_expected_error */
extern void T28f23(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.make */
extern T0* T221c7(T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_OPTIONS.set_fst_expansion_factor */
extern void T114f368(T0* C, T6 a1);
/* UC_UTF8_STRING.to_integer */
extern T6 T239f27(T0* C);
/* UC_UTF8_STRING.ctoi_convertor */
extern T0* T239f35(T0* C);
/* UC_UTF8_STRING.is_integer */
extern T1 T239f26(T0* C);
/* UC_UTF8_STRING.is_valid_integer_or_natural */
extern T1 T239f34(T0* C, T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.is_integral_integer */
extern T1 T78f12(T0* C);
/* STRING_8.is_integer */
extern T1 T17f14(T0* C);
/* STRING_8.is_valid_integer_or_natural */
extern T1 T17f18(T0* C, T6 a1);
/* ET_XACE_OPTIONS.set_flat_fst_optimization */
extern void T114f367(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_finalize_option */
extern void T114f366(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_exclude */
extern void T114f364(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_exception_trace */
extern void T114f363(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_ecf_library */
extern void T114f362(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_dynamic_runtime */
extern void T114f361(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_dotnet_naming_convention */
extern void T114f360(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_document */
extern void T114f359(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_debugger */
extern void T114f358(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_debug_tag */
extern void T114f357(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_dead_code_removal */
extern void T114f355(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_dead_code_removal */
extern unsigned char ge1130os6984;
extern T0* ge1130ov6984;
extern T0* T114f174(T0* C);
/* ET_XACE_OPTIONS.set_c_compiler_options */
extern void T114f354(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_culture */
extern void T114f353(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_create_keyword_extension */
extern void T114f352(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_console_application */
extern void T114f351(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_component */
extern void T114f350(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_cls_compliant */
extern void T114f349(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_clean */
extern void T114f348(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_check_vape */
extern void T114f347(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_case_insensitive */
extern void T114f346(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_callback */
extern void T114f345(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_callback */
extern unsigned char ge1130os6983;
extern T0* ge1130ov6983;
extern T0* T114f173(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_wrong_attribute_value_error */
extern void T28f22(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.make */
extern T0* T220c7(T0* a1, T0* a2, T0* a3, T0* a4, T0* a5);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.string_ */
extern T0* T220f4(T0* C);
/* ET_XACE_OPTIONS.set_assertion */
extern void T114f344(T0* C, T0* a1);
/* ET_XACE_OPTIONS.valid_assertion */
extern unsigned char ge1130os6982;
extern T0* ge1130ov6982;
extern T0* T114f172(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_non_empty_attribute_expected_error */
extern void T28f21(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.make */
extern T0* T219c7(T0* a1, T0* a2, T0* a3);
/* ET_XACE_OPTIONS.set_assembly */
extern void T114f343(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_array_optimization */
extern void T114f342(T0* C, T1 a1);
/* ET_XACE_OPTIONS.set_arguments */
extern void T114f341(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_address_expression */
extern void T114f340(T0* C, T1 a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_boolean_expected_error */
extern void T28f20(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.make */
extern T0* T218c7(T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_PARSER.is_false */
extern T1 T87f112(T0* C, T0* a1);
/* ET_XACE_OPTIONS.set_abstract */
extern void T114f339(T0* C, T1 a1);
/* ET_XACE_PARSER.is_true */
extern T1 T87f111(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].found_item */
extern T6 T157f22(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].item_storage_item */
extern T6 T157f33(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].found */
extern T1 T157f30(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].search */
extern void T157f36(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].search_position */
extern void T157f39(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].clashes_item */
extern T6 T157f24(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].hash_position */
extern T6 T157f25(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].key_storage_item */
extern T0* T157f21(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].slots_item */
extern T6 T157f26(T0* C, T6 a1);
/* ET_XACE_PARSER.option_codes */
extern unsigned char ge1131os4413;
extern T0* ge1131ov4413;
extern T0* T87f29(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].put_new */
extern void T157f38(T0* C, T6 a1, T0* a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].key_storage_put */
extern void T157f45(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].item_storage_put */
extern void T157f44(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].slots_put */
extern void T157f43(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].clashes_put */
extern void T157f42(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].unset_found_item */
extern void T157f41(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].set_key_equality_tester */
extern void T157f37(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [INTEGER_32, STRING_8].internal_set_equality_tester */
extern void T262f6(T0* C, T0* a1);
/* ET_XACE_PARSER.string_equality_tester */
extern T0* T87f14(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_map */
extern T0* T157c35(T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_with_equality_testers */
extern void T157f40(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [INTEGER_32, STRING_8].make */
extern T0* T262c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [INTEGER_32, STRING_8].new_cursor */
extern T0* T262f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [INTEGER_32, STRING_8].make */
extern T0* T316c3(T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].new_cursor */
extern T0* T157f29(T0* C);
/* DS_HASH_TABLE_CURSOR [INTEGER_32, STRING_8].make */
extern T0* T264c3(T0* a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_sparse_container */
extern void T157f46(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_slots */
extern void T157f50(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].special_integer_ */
extern T0* T157f32(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].new_modulus */
extern T6 T157f27(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_clashes */
extern void T157f49(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_key_storage */
extern void T157f48(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].make_item_storage */
extern void T157f47(T0* C, T6 a1);
/* ET_XACE_PARSER.uc_value */
extern unsigned char ge1162os2386;
extern T0* ge1162ov2386;
extern T0* T87f28(T0* C);
/* ET_XACE_PARSER.uc_option */
extern unsigned char ge1162os2393;
extern T0* ge1162ov2393;
extern T0* T87f22(T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.put_last */
extern void T113f6(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].force_last */
extern void T121f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].resize */
extern void T121f13(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY].resize */
extern T0* T248f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].resized_area */
extern T0* T247f3(T0* C, T6 a1);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].copy_data */
extern void T247f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].move_data */
extern void T247f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].overlapping_move */
extern void T247f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].non_overlapping_move */
extern void T247f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ET_XACE_MOUNTED_LIBRARY].make */
extern T0* T247c4(T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].new_capacity */
extern T6 T121f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].extendible */
extern T1 T121f9(T0* C, T6 a1);
/* ET_XACE_AST_FACTORY.new_mounted_libraries */
extern T0* T92f3(T0* C);
/* ET_XACE_MOUNTED_LIBRARIES.make_empty */
extern T0* T113c5(void);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].make */
extern T0* T121c11(T6 a1);
/* DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY].new_cursor */
extern T0* T121f8(T0* C);
/* DS_ARRAYED_LIST_CURSOR [ET_XACE_MOUNTED_LIBRARY].make */
extern T0* T249c2(T0* a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY].make */
extern T0* T248f1(T0* C, T6 a1);
/* TO_SPECIAL [ET_XACE_MOUNTED_LIBRARY].make_area */
extern T0* T313c2(T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_MOUNTED_LIBRARY].default_create */
extern T0* T248c3(void);
/* ET_XACE_PARSER.new_mount */
extern T0* T87f21(T0* C, T0* a1, T0* a2);
/* ET_XACE_MOUNTED_LIBRARY.set_library_prefix */
extern void T122f9(T0* C, T0* a1);
/* ET_XACE_AST_FACTORY.new_mounted_library */
extern T0* T92f7(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_MOUNTED_LIBRARY.make */
extern T0* T122c8(T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_PARSER.parse_library */
extern void T85f232(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.fill_library */
extern void T85f229(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_PARSER.fill_externals */
extern void T85f231(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_LIBRARY_PARSER.new_export */
extern T0* T85f128(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.new_exported_feature */
extern T0* T85f220(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.uc_alias */
extern T0* T85f222(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_feature */
extern T0* T85f219(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_class */
extern T0* T85f131(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_export */
extern T0* T85f127(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_include_dir */
extern T0* T85f126(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_location */
extern T0* T85f125(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_link_library */
extern T0* T85f124(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_external */
extern T0* T85f24(T0* C);
/* ET_XACE_LIBRARY_PARSER.new_options */
extern T0* T85f23(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.fill_options */
extern void T85f230(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_PARSER.uc_debug */
extern T0* T85f123(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_optimize */
extern T0* T85f122(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_check */
extern T0* T85f120(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_loop */
extern T0* T85f117(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_invariant */
extern T0* T85f115(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_ensure */
extern T0* T85f113(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_enable */
extern T0* T85f111(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_require */
extern T0* T85f110(T0* C);
/* ET_XACE_LIBRARY_PARSER.is_false */
extern T1 T85f109(T0* C, T0* a1);
/* ET_XACE_LIBRARY_PARSER.is_true */
extern T1 T85f108(T0* C, T0* a1);
/* ET_XACE_LIBRARY_PARSER.option_codes */
extern T0* T85f26(T0* C);
/* ET_XACE_LIBRARY_PARSER.string_equality_tester */
extern T0* T85f13(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_value */
extern T0* T85f25(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_option */
extern T0* T85f22(T0* C);
/* ET_XACE_LIBRARY_PARSER.new_mount */
extern T0* T85f21(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.execution_environment */
extern T0* T85f133(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_mount */
extern unsigned char ge1162os2389;
extern T0* ge1162ov2389;
extern T0* T85f20(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_prefix */
extern unsigned char ge1162os2391;
extern T0* ge1162ov2391;
extern T0* T85f19(T0* C);
/* ET_XACE_LIBRARY_PARSER.new_cluster */
extern T0* T85f18(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_CLUSTER.set_libraries */
extern void T120f39(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_subclusters */
extern void T120f38(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.set_parent */
extern void T112f13(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_parent */
extern void T120f48(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_dependant_constraint */
extern void T120f51(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.set_dependant_constraint */
extern void T112f18(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_provider_constraint */
extern void T120f50(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.set_provider_constraint */
extern void T112f17(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_options */
extern void T120f37(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_read_only */
extern void T120f36(T0* C, T1 a1);
/* ET_XACE_CLUSTER.set_recursive */
extern void T120f35(T0* C, T1 a1);
/* ET_XACE_CLUSTER.set_abstract */
extern void T120f34(T0* C, T1 a1);
/* ET_XACE_LIBRARY_PARSER.new_class */
extern T0* T85f132(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.new_feature */
extern T0* T85f221(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTER.set_cluster_prefix */
extern void T120f32(T0* C, T0* a1);
/* ET_XACE_CLUSTER.set_relative */
extern void T120f31(T0* C, T1 a1);
/* ET_XACE_LIBRARY_PARSER.uc_relative */
extern unsigned char ge1162os2388;
extern T0* ge1162ov2388;
extern T0* T85f130(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_attribute_obsoleted_by_element_warning */
extern void T28f34(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_warning */
extern void T28f32(T0* C, T0* a1);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_warning_message */
extern void T28f33(T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_line */
extern void T64f4(T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_new_line */
extern void T64f6(T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_string */
extern void T64f5(T0* C, T0* a1);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.make */
extern T0* T303c7(T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_LIBRARY_PARSER.uc_abstract */
extern unsigned char ge1162os2387;
extern T0* ge1162ov2387;
extern T0* T85f129(T0* C);
/* ET_XACE_AST_FACTORY.new_cluster */
extern T0* T92f6(T0* C, T0* a1, T0* a2);
/* ET_XACE_CLUSTER.make */
extern T0* T120c30(T0* a1, T0* a2);
/* ET_XACE_CLUSTER.set_overridden_constraint_enabled */
extern void T120f40(T0* C, T1 a1);
/* ET_XACE_CLUSTERS.set_overridden_constraint_enabled */
extern void T112f14(T0* C, T1 a1);
/* ET_XACE_LIBRARY_PARSER.uc_cluster */
extern unsigned char ge1162os2384;
extern T0* ge1162ov2384;
extern T0* T85f16(T0* C);
/* ET_XACE_LIBRARY_PARSER.string_ */
extern T0* T85f15(T0* C);
/* ET_XACE_LIBRARY_PARSER.uc_name */
extern unsigned char ge1162os2385;
extern T0* ge1162ov2385;
extern T0* T85f14(T0* C);
/* ET_XACE_PARSER.execution_environment */
extern T0* T87f137(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].force_new */
extern void T102f53(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].key_storage_put */
extern void T102f59(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].item_storage_put */
extern void T102f58(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].slots_put */
extern void T102f57(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].clashes_put */
extern void T102f56(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].slots_item */
extern T6 T102f30(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].hash_position */
extern T6 T102f29(T0* C, T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].clashes_item */
extern T6 T102f28(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].resize */
extern void T102f55(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].clashes_resize */
extern void T102f63(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].special_integer_ */
extern T0* T102f22(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].key_storage_resize */
extern void T102f62(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].item_storage_resize */
extern void T102f61(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY].resize */
extern T0* T173f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ET_XACE_LIBRARY].resized_area */
extern T0* T172f3(T0* C, T6 a1);
/* SPECIAL [ET_XACE_LIBRARY].copy_data */
extern void T172f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [ET_XACE_LIBRARY].move_data */
extern void T172f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ET_XACE_LIBRARY].overlapping_move */
extern void T172f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ET_XACE_LIBRARY].non_overlapping_move */
extern void T172f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ET_XACE_LIBRARY].make */
extern T0* T172c4(T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].key_storage_item */
extern T0* T102f33(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].slots_resize */
extern void T102f60(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].new_modulus */
extern T6 T102f31(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].new_capacity */
extern T6 T102f26(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].unset_found_item */
extern void T102f42(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].found_item */
extern T0* T102f24(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].item_storage_item */
extern T0* T102f25(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].found */
extern T1 T102f23(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].search */
extern void T102f52(T0* C, T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].search_position */
extern void T102f54(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_mount */
extern T0* T87f20(T0* C);
/* ET_XACE_LIBRARY.set_library_prefix */
extern void T86f12(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_prefix */
extern T0* T87f19(T0* C);
/* ET_XACE_AST_FACTORY.new_clusters */
extern T0* T92f2(T0* C, T0* a1);
/* ET_XACE_CLUSTERS.make */
extern T0* T112c3(T0* a1);
/* DS_ARRAYED_LIST [ET_XACE_CLUSTER].put_last */
extern void T119f11(T0* C, T0* a1);
/* ET_XACE_LIBRARY.set_options */
extern void T86f11(T0* C, T0* a1);
/* ET_XACE_PARSER.new_cluster */
extern T0* T87f18(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_PARSER.new_class */
extern T0* T87f134(T0* C, T0* a1, T0* a2);
/* ET_XACE_PARSER.new_feature */
extern T0* T87f225(T0* C, T0* a1, T0* a2);
/* ET_XACE_PARSER.uc_relative */
extern T0* T87f133(T0* C);
/* ET_XACE_PARSER.uc_abstract */
extern T0* T87f132(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_element_obsoleted_by_element_warning */
extern void T28f24(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.make */
extern T0* T222c7(T0* a1, T0* a2, T0* a3);
/* XM_POSITION_TABLE.item */
extern T0* T95f2(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].forth */
extern void T233f10(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_forth */
extern void T234f11(T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].add_traversing_cursor */
extern void T234f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set_next_cursor */
extern void T233f13(T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].remove_traversing_cursor */
extern void T234f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set */
extern void T233f11(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].go_after */
extern void T233f9(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_go_after */
extern void T234f10(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set_after */
extern void T233f12(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_off */
extern T1 T234f6(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].item */
extern T0* T233f6(T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].start */
extern void T233f8(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_start */
extern void T234f9(T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].new_cursor */
extern T0* T234f7(T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T233c7(T0* a1);
/* ET_XACE_LIBRARY.set_name */
extern void T86f10(T0* C, T0* a1);
/* XM_ELEMENT.attribute_by_name */
extern T0* T94f18(T0* C, T0* a1);
/* XM_ELEMENT.attribute_same_name */
extern T1 T94f9(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.same_string */
extern T1 T94f11(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.string_equality_tester */
extern T0* T94f13(T0* C);
/* XM_NODE_TYPER.is_attribute */
extern T1 T346f8(T0* C);
/* XM_ELEMENT.has_attribute_by_name */
extern T1 T94f15(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_name */
extern T0* T87f16(T0* C);
/* ET_XACE_AST_FACTORY.new_library */
extern T0* T92f5(T0* C);
/* ET_XACE_LIBRARY.make */
extern T0* T86c7(void);
/* ET_XACE_VALIDATOR.validate_library_doc */
extern void T100f32(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_wrong_root_element_error */
extern void T28f25(T0* C, T0* a1, T0* a2);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.make */
extern T0* T223c7(T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_named_cluster */
extern void T100f35(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_cluster */
extern void T100f37(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_unknown_element_error */
extern void T28f29(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.make */
extern T0* T227c7(T0* a1, T0* a2, T0* a3);
/* ET_XACE_VALIDATOR.validate_external */
extern void T100f40(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_export */
extern void T100f43(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_feature */
extern T0* T100f29(T0* C);
/* ET_XACE_VALIDATOR.uc_export */
extern T0* T100f28(T0* C);
/* ET_XACE_VALIDATOR.uc_link_library */
extern T0* T100f27(T0* C);
/* ET_XACE_VALIDATOR.uc_location */
extern T0* T100f15(T0* C);
/* ET_XACE_VALIDATOR.uc_include_dir */
extern T0* T100f26(T0* C);
/* ET_XACE_VALIDATOR.uc_external */
extern T0* T100f12(T0* C);
/* ET_XACE_VALIDATOR.validate_class */
extern void T100f41(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_feature */
extern void T100f44(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_class */
extern T0* T100f13(T0* C);
/* ET_XACE_VALIDATOR.validate_option */
extern void T100f39(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_optimize */
extern T0* T100f25(T0* C);
/* ET_XACE_VALIDATOR.uc_debug */
extern T0* T100f24(T0* C);
/* ET_XACE_VALIDATOR.uc_check */
extern T0* T100f23(T0* C);
/* ET_XACE_VALIDATOR.uc_loop */
extern T0* T100f22(T0* C);
/* ET_XACE_VALIDATOR.uc_invariant */
extern T0* T100f21(T0* C);
/* ET_XACE_VALIDATOR.uc_ensure */
extern T0* T100f20(T0* C);
/* ET_XACE_VALIDATOR.uc_require */
extern T0* T100f19(T0* C);
/* ET_XACE_VALIDATOR.uc_value */
extern T0* T100f18(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_unknown_option_warning */
extern void T28f31(T0* C, T0* a1, T0* a2);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.make */
extern T0* T229c8(T0* a1, T0* a2);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.uc_name */
extern T0* T229f7(T0* C);
/* DS_HASH_TABLE [INTEGER_32, STRING_8].has */
extern T1 T157f28(T0* C, T0* a1);
/* ET_XACE_OPTION_NAMES.option_codes */
extern T0* T130f26(T0* C);
/* ET_XACE_OPTION_NAMES.string_equality_tester */
extern T0* T130f30(T0* C);
/* ET_XACE_VALIDATOR.options */
extern T0* T100f17(T0* C);
/* ET_XACE_VALIDATOR.uc_option */
extern T0* T100f11(T0* C);
/* ET_XACE_VALIDATOR.validate_mount */
extern void T100f38(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_exclude */
extern void T100f42(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_obsolete_exclude_element_warning */
extern void T28f30(T0* C, T0* a1);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.make */
extern T0* T228c7(T0* a1);
/* ET_XACE_VALIDATOR.uc_exclude */
extern unsigned char ge1162os2408;
extern T0* ge1162ov2408;
extern T0* T100f16(T0* C);
/* ET_XACE_VALIDATOR.uc_mount */
extern T0* T100f10(T0* C);
/* ET_XACE_VALIDATOR.uc_description */
extern unsigned char ge1162os2392;
extern T0* ge1162ov2392;
extern T0* T100f9(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_missing_attribute_error */
extern void T28f26(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.make */
extern T0* T224c7(T0* a1, T0* a2, T0* a3);
/* ET_XACE_VALIDATOR.uc_name */
extern T0* T100f7(T0* C);
/* ET_XACE_VALIDATOR.uc_cluster */
extern T0* T100f6(T0* C);
/* ET_XACE_VALIDATOR.validate_library */
extern void T100f34(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_library */
extern unsigned char ge1162os2383;
extern T0* ge1162ov2383;
extern T0* T100f5(T0* C);
/* ET_XACE_VALIDATOR.string_ */
extern T0* T100f3(T0* C);
/* ET_XACE_PARSER.uc_cluster */
extern T0* T87f11(T0* C);
/* ET_XACE_PARSER.uc_library */
extern T0* T87f136(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].wipe_out */
extern void T102f38(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].slots_wipe_out */
extern void T102f46(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].clashes_wipe_out */
extern void T102f45(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].key_storage_wipe_out */
extern void T102f44(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].item_storage_wipe_out */
extern void T102f43(T0* C);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].move_all_cursors_after */
extern void T102f41(T0* C);
/* DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY, STRING_8].set_next_cursor */
extern void T171f6(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY, STRING_8].set_position */
extern void T171f5(T0* C, T6 a1);
/* ET_XACE_PARSER.new_system */
extern T0* T87f15(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM.mount_libraries */
extern void T81f16(T0* C);
/* ET_XACE_PARSER.fill_system */
extern void T87f231(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_SYSTEM.set_libraries */
extern void T81f15(T0* C, T0* a1);
/* ET_XACE_SYSTEM.set_options */
extern void T81f14(T0* C, T0* a1);
/* ET_XACE_SYSTEM.set_creation_procedure_name */
extern void T81f13(T0* C, T0* a1);
/* ET_XACE_SYSTEM.set_root_class_name */
extern void T81f12(T0* C, T0* a1);
/* ET_XACE_SYSTEM.set_system_name */
extern void T81f11(T0* C, T0* a1);
/* ET_XACE_SYSTEM.set_clusters */
extern void T81f10(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_creation */
extern unsigned char ge1162os2382;
extern T0* ge1162ov2382;
extern T0* T87f27(T0* C);
/* XM_ELEMENT.element_by_name */
extern T0* T94f20(T0* C, T0* a1);
/* XM_ELEMENT.named_same_name */
extern T1 T94f10(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.same_namespace */
extern T1 T94f12(T0* C, T0* a1);
/* XM_ELEMENT.has_namespace */
extern T1 T94f14(T0* C);
/* XM_NODE_TYPER.is_element */
extern T1 T346f9(T0* C);
/* XM_ELEMENT.has_element_by_name */
extern T1 T94f19(T0* C, T0* a1);
/* ET_XACE_PARSER.uc_root */
extern unsigned char ge1162os2380;
extern T0* ge1162ov2380;
extern T0* T87f25(T0* C);
/* ET_XACE_AST_FACTORY.new_system */
extern T0* T92f1(T0* C, T0* a1);
/* ET_XACE_SYSTEM.make */
extern T0* T81c7(T0* a1);
/* ET_XACE_PREPROCESSOR.preprocess_element */
extern void T101f11(T0* C, T0* a1, T0* a2);
/* ET_XACE_PREPROCESSOR.should_strip_element */
extern T1 T101f3(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_invalid_expression_error */
extern void T28f35(T0* C, T0* a1, T0* a2);
/* ET_XACE_INVALID_EXPRESSION_ERROR.make */
extern T0* T304c7(T0* a1, T0* a2);
/* ET_XACE_PREPROCESSOR.is_expression_true */
extern T1 T101f8(T0* C, T0* a1);
/* UT_TEMPLATE_EXPANDER.expand_from_values */
extern T0* T167f1(T0* C, T0* a1, T0* a2);
/* UT_TEMPLATE_EXPANDER.string_ */
extern T0* T167f2(T0* C);
/* ET_XACE_PREPROCESSOR.template_expander */
extern unsigned char ge1169os5865;
extern T0* ge1169ov5865;
extern T0* T101f4(T0* C);
/* UT_TEMPLATE_EXPANDER.make */
extern T0* T167c3(void);
/* ET_XACE_PREPROCESSOR.string_ */
extern T0* T101f9(T0* C);
/* UC_UTF8_STRING.occurrences */
extern T6 T239f51(T0* C, T2 a1);
/* UC_UTF8_STRING.code_occurrences */
extern T6 T239f52(T0* C, T6 a1);
/* STRING_8.occurrences */
extern T6 T17f30(T0* C, T2 a1);
/* ET_XACE_PREPROCESSOR.is_valid_expression */
extern T1 T101f7(T0* C, T0* a1);
/* ET_XACE_PREPROCESSOR.uc_unless */
extern unsigned char ge1162os2410;
extern T0* ge1162ov2410;
extern T0* T101f6(T0* C);
/* ET_XACE_PREPROCESSOR.uc_if */
extern unsigned char ge1162os2409;
extern T0* ge1162ov2409;
extern T0* T101f5(T0* C);
/* ET_XACE_PREPROCESSOR.expand_attribute_variables */
extern void T101f12(T0* C, T0* a1);
/* XM_ATTRIBUTE.set_value */
extern void T154f7(T0* C, T0* a1);
/* ET_XACE_VALIDATOR.validate_system_doc */
extern void T100f31(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.validate_system */
extern void T100f33(T0* C, T0* a1, T0* a2);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_obsolete_cluster_element_warning */
extern void T28f28(T0* C, T0* a1);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.make */
extern T0* T226c7(T0* a1);
/* ET_XACE_VALIDATOR.validate_root */
extern void T100f36(T0* C, T0* a1, T0* a2);
/* ET_XACE_VALIDATOR.uc_creation */
extern T0* T100f14(T0* C);
/* ET_XACE_DEFAULT_ERROR_HANDLER.report_missing_element_error */
extern void T28f27(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_MISSING_ELEMENT_ERROR.make */
extern T0* T225c7(T0* a1, T0* a2, T0* a3);
/* ET_XACE_VALIDATOR.uc_root */
extern T0* T100f8(T0* C);
/* ET_XACE_VALIDATOR.uc_system */
extern unsigned char ge1162os2379;
extern T0* ge1162ov2379;
extern T0* T100f4(T0* C);
/* ET_XACE_PARSER.uc_system */
extern T0* T87f13(T0* C);
/* ET_XACE_PARSER.string_ */
extern T0* T87f135(T0* C);
/* XM_TREE_CALLBACKS_PIPE.document */
extern T0* T97f5(T0* C);
/* XM_EIFFEL_PARSER.parse_from_stream */
extern void T104f203(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.parse_with_events */
extern void T104f209(T0* C);
/* XM_EIFFEL_PARSER.on_finish */
extern void T104f215(T0* C);
/* XM_EIFFEL_PARSER.parse */
extern void T104f214(T0* C);
/* XM_EIFFEL_PARSER.yy_pop_last_value */
extern void T104f224(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.yy_push_error_value */
extern void T104f223(T0* C);
/* KL_SPECIAL_ROUTINES [ANY].resize */
extern T0* T183f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ANY].resized_area */
extern T0* T182f2(T0* C, T6 a1);
/* SPECIAL [ANY].copy_data */
extern void T182f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [ANY].move_data */
extern void T182f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ANY].overlapping_move */
extern void T182f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ANY].non_overlapping_move */
extern void T182f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ANY].make */
extern T0* T182c4(T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].make */
extern T0* T183f1(T0* C, T6 a1);
/* TO_SPECIAL [ANY].make_area */
extern T0* T286c2(T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].default_create */
extern T0* T183c3(void);
/* XM_EIFFEL_PARSER.yy_do_action */
extern void T104f222(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.on_notation_declaration */
extern void T104f252(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_notation_declaration */
extern void T214f8(T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.set_public */
extern void T186f6(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].resize */
extern T0* T212f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_EXTERNAL_ID].resized_area */
extern T0* T197f3(T0* C, T6 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].copy_data */
extern void T197f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_DTD_EXTERNAL_ID].move_data */
extern void T197f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_EXTERNAL_ID].overlapping_move */
extern void T197f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_EXTERNAL_ID].non_overlapping_move */
extern void T197f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_EXTERNAL_ID].make */
extern T0* T197c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].make */
extern T0* T212f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_DTD_EXTERNAL_ID].make_area */
extern T0* T302c2(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].default_create */
extern T0* T212c3(void);
/* XM_DTD_EXTERNAL_ID.set_system */
extern void T186f5(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_dtd_external_id */
extern T0* T104f169(T0* C);
/* XM_DTD_EXTERNAL_ID.make */
extern T0* T186c4(void);
/* XM_EIFFEL_PARSER.when_pe_entity_declared */
extern void T104f251(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].force */
extern void T179f40(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_put */
extern void T179f54(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_put */
extern void T179f53(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_put */
extern void T179f52(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_item */
extern T6 T179f31(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_item */
extern T6 T179f28(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].hash_position */
extern T6 T179f25(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].resize */
extern void T179f51(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_resize */
extern void T179f59(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].special_integer_ */
extern T0* T179f32(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_resize */
extern void T179f58(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_resize */
extern void T179f57(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].resize */
extern T0* T285f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].resized_area */
extern T0* T280f3(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].copy_data */
extern void T280f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].move_data */
extern void T280f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].overlapping_move */
extern void T280f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].non_overlapping_move */
extern void T280f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T280c4(T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_item */
extern T0* T179f22(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_resize */
extern void T179f56(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_modulus */
extern T6 T179f29(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_capacity */
extern T6 T179f23(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_put */
extern void T179f50(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].search_position */
extern void T179f42(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].unset_found_item */
extern void T179f45(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].has */
extern T1 T179f33(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_def */
extern T0* T217c208(T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_literal */
extern void T217f210(T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.default_create */
extern T0* T181c4(void);
/* XM_EIFFEL_PE_ENTITY_DEF.make_scanner */
extern void T217f211(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T217f213(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset_sent */
extern void T217f216(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T217f213p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T217f213p0(T0* C);
/* DS_LINKED_STACK [INTEGER_32].make */
extern T0* T276c5(void);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T217f213p2(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.make_with_buffer */
extern void T217f212(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_initialize */
extern void T217f214(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_build_tables */
extern void T217f217(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template */
extern unsigned char ge1335os8073;
extern T0* ge1335ov8073;
extern T0* T217f50(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_fixed_array */
extern T0* T217f54(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].to_special */
extern T0* T57f3(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_meta_template */
extern unsigned char ge1335os8072;
extern T0* ge1335ov8072;
extern T0* T217f91(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_ec_template */
extern unsigned char ge1335os8071;
extern T0* ge1335ov8071;
extern T0* T217f69(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template */
extern unsigned char ge1335os8070;
extern T0* ge1335ov8070;
extern T0* T217f59(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template */
extern unsigned char ge1335os8069;
extern T0* ge1335ov8069;
extern T0* T217f52(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template */
extern unsigned char ge1335os8062;
extern T0* ge1335ov8062;
extern T0* T217f49(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_6 */
extern void T217f230(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_array_subcopy */
extern void T217f231(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* KL_ARRAY_ROUTINES [INTEGER_32].subcopy */
extern void T306f2(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* ARRAY [INTEGER_32].subcopy */
extern void T236f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* XM_EIFFEL_PE_ENTITY_DEF.integer_array_ */
extern unsigned char ge79os2486;
extern T0* ge79ov2486;
extern T0* T217f55(T0* C);
/* KL_ARRAY_ROUTINES [INTEGER_32].default_create */
extern T0* T306c1(void);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_5 */
extern void T217f229(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_4 */
extern void T217f228(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_3 */
extern void T217f227(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_2 */
extern void T217f226(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_1 */
extern void T217f225(T0* C, T0* a1);
/* ARRAY [INTEGER_32].make */
extern T0* T236c5(T6 a1, T6 a2);
/* ARRAY [INTEGER_32].make_area */
extern void T236f6(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template */
extern unsigned char ge1335os8055;
extern T0* ge1335ov8055;
extern T0* T217f65(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_6 */
extern void T217f224(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_5 */
extern void T217f223(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_4 */
extern void T217f222(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_3 */
extern void T217f221(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_2 */
extern void T217f220(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_1 */
extern void T217f219(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.empty_buffer */
extern unsigned char ge315os8265;
extern T0* ge315ov8265;
extern T0* T217f58(T0* C);
/* YY_BUFFER.make */
extern T0* T272c12(T0* a1);
/* YY_BUFFER.make_from_buffer */
extern void T272f16(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.fill_from_string */
extern void T334f9(T0* C, T0* a1, T6 a2);
/* YY_BUFFER.new_default_buffer */
extern T0* T272f11(T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.make */
extern T0* T271c8(void);
/* XM_EIFFEL_PE_ENTITY_DEF.make_external */
extern void T217f209(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.new_external_entity */
extern T0* T104f168(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.make_external */
extern T0* T211c207(T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_scanner */
extern void T211f208(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T211f210(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T211f210p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T211f210p0(T0* C);
/* XM_EIFFEL_ENTITY_DEF.make_with_buffer */
extern void T211f209(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_initialize */
extern void T211f211(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_build_tables */
extern void T211f213(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template */
extern T0* T211f48(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_fixed_array */
extern T0* T211f53(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_meta_template */
extern T0* T211f88(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_ec_template */
extern T0* T211f67(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template */
extern T0* T211f58(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template */
extern T0* T211f50(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template */
extern T0* T211f47(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_6 */
extern void T211f226(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_array_subcopy */
extern void T211f227(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_ENTITY_DEF.integer_array_ */
extern T0* T211f54(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_5 */
extern void T211f225(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_4 */
extern void T211f224(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_3 */
extern void T211f223(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_2 */
extern void T211f222(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_1 */
extern void T211f221(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template */
extern T0* T211f64(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_6 */
extern void T211f220(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_5 */
extern void T211f219(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_4 */
extern void T211f218(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_3 */
extern void T211f217(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_2 */
extern void T211f216(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_1 */
extern void T211f215(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.empty_buffer */
extern T0* T211f49(T0* C);
/* XM_EIFFEL_PARSER.on_entity_declaration */
extern void T104f250(T0* C, T0* a1, T1 a2, T0* a3, T0* a4, T0* a5);
/* XM_DTD_CALLBACKS_NULL.on_entity_declaration */
extern void T214f7(T0* C, T0* a1, T1 a2, T0* a3, T0* a4, T0* a5);
/* XM_EIFFEL_PARSER.when_entity_declared */
extern void T104f249(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.new_literal_entity */
extern T0* T104f167(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_literal */
extern T0* T211c206(T0* a1, T0* a2);
/* XM_DTD_ATTRIBUTE_CONTENT.set_default_value */
extern void T190f26(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_fixed */
extern void T190f25(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_implied */
extern void T190f24(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_required */
extern void T190f23(T0* C);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].resize */
extern T0* T210f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].resized_area */
extern T0* T209f3(T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].copy_data */
extern void T209f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].move_data */
extern void T209f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].overlapping_move */
extern void T209f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].non_overlapping_move */
extern void T209f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].make */
extern T0* T209c4(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].make */
extern T0* T210f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_BILINKED_LIST [STRING_8]].make_area */
extern T0* T301c2(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].default_create */
extern T0* T210c3(void);
/* DS_BILINKED_LIST [STRING_8].force_last */
extern void T191f12(T0* C, T0* a1);
/* DS_BILINKABLE [STRING_8].put_right */
extern void T293f5(T0* C, T0* a1);
/* DS_BILINKABLE [STRING_8].attach_left */
extern void T293f6(T0* C, T0* a1);
/* DS_BILINKABLE [STRING_8].make */
extern T0* T293c4(T0* a1);
/* DS_BILINKED_LIST [STRING_8].is_empty */
extern T1 T191f7(T0* C);
/* XM_EIFFEL_PARSER.new_string_bilinked_list */
extern T0* T104f162(T0* C);
/* DS_BILINKED_LIST [STRING_8].set_equality_tester */
extern void T191f13(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.string_equality_tester */
extern T0* T104f182(T0* C);
/* DS_BILINKED_LIST [STRING_8].make */
extern T0* T191c11(void);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration_list */
extern void T190f22(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration */
extern void T190f27(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.default_enumeration_list */
extern unsigned char ge1246os8697;
extern T0* ge1246ov8697;
extern T0* T190f7(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_notation */
extern void T190f21(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_token */
extern void T190f20(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_entity */
extern void T190f19(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_list_type */
extern void T190f18(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id_ref */
extern void T190f17(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id */
extern void T190f16(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_data */
extern void T190f15(T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content */
extern T0* T104f160(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.make */
extern T0* T190c12(void);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].resize */
extern T0* T208f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].resized_area */
extern T0* T206f3(T0* C, T6 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].copy_data */
extern void T206f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].move_data */
extern void T206f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].overlapping_move */
extern void T206f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].non_overlapping_move */
extern void T206f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T206c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T208f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make_area */
extern T0* T300c2(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].default_create */
extern T0* T208c3(void);
/* XM_DTD_ATTRIBUTE_CONTENT.copy_default */
extern void T190f14(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_implied */
extern T1 T190f11(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_required */
extern T1 T190f10(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.has_default_value */
extern T1 T190f9(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_fixed */
extern T1 T190f8(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_name */
extern void T190f13(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].resize */
extern T0* T207f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].resized_area */
extern T0* T204f3(T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].copy_data */
extern void T204f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].move_data */
extern void T204f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].overlapping_move */
extern void T204f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].non_overlapping_move */
extern void T204f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T204c4(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T207f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make_area */
extern T0* T299c2(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].default_create */
extern T0* T207c3(void);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].force_last */
extern void T189f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].put_right */
extern void T291f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].attach_left */
extern void T291f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T291c4(T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].is_empty */
extern T1 T189f5(T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content_list */
extern T0* T104f153(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T189c8(void);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].new_cursor */
extern T0* T189f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T290c7(T0* a1);
/* XM_EIFFEL_PARSER.on_attribute_declarations */
extern void T104f248(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].forth */
extern void T290f9(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_forth */
extern void T189f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].add_traversing_cursor */
extern void T189f12(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set_next_cursor */
extern void T290f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].remove_traversing_cursor */
extern void T189f13(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set */
extern void T290f10(T0* C, T0* a1, T1 a2, T1 a3);
/* XM_EIFFEL_PARSER.on_attribute_declaration */
extern void T104f258(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_DTD_CALLBACKS_NULL.on_attribute_declaration */
extern void T214f9(T0* C, T0* a1, T0* a2, T0* a3);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].item */
extern T0* T290f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].start */
extern void T290f8(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_start */
extern void T189f10(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_off */
extern T1 T189f7(T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_more */
extern void T188f11(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_mixed */
extern T0* T188c10(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_mixed */
extern void T188f21(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_choice */
extern void T188f19(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_list */
extern void T188f16(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_default */
extern void T188f22(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one */
extern void T188f12(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_sequence */
extern void T188f20(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T289c7(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].new_cursor */
extern T0* T289f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T324c3(T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_sequence */
extern T0* T188c9(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_last */
extern void T289f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].put_right */
extern void T325f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].attach_left */
extern void T325f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T325c4(T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].is_empty */
extern T1 T289f5(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_choice */
extern T0* T188c8(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_first */
extern void T289f8(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.element_name */
extern T0* T104f147(T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_name */
extern T0* T188c15(T0* a1);
/* XM_EIFFEL_PARSER.set_element_repetition */
extern void T104f247(T0* C, T0* a1, T0* a2);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_one */
extern void T188f14(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one_or_more */
extern void T188f13(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_any */
extern T0* T188c7(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_any */
extern void T188f18(T0* C);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].resize */
extern T0* T202f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].resized_area */
extern T0* T201f3(T0* C, T6 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].copy_data */
extern void T201f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].move_data */
extern void T201f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].overlapping_move */
extern void T201f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].non_overlapping_move */
extern void T201f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T201c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T202f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_DTD_ELEMENT_CONTENT].make_area */
extern T0* T298c2(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].default_create */
extern T0* T202c3(void);
/* XM_DTD_ELEMENT_CONTENT.make_empty */
extern T0* T188c6(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_empty */
extern void T188f17(T0* C);
/* XM_EIFFEL_PARSER.on_element_declaration */
extern void T104f246(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_element_declaration */
extern void T214f6(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_attribute */
extern void T104f245(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].has */
extern T1 T187f30(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].search_position */
extern void T187f34(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_item */
extern T6 T187f22(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].hash_position */
extern T6 T187f24(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.hash_code */
extern T6 T184f9(T0* C);
/* XM_EIFFEL_PARSER_NAME.item */
extern T0* T184f14(T0* C, T6 a1);
/* DS_BILINKED_LIST [STRING_8].item */
extern T0* T191f8(T0* C, T6 a1);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].test */
extern T1 T287f1(T0* C, T0* a1, T0* a2);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].any_ */
extern T0* T287f2(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_storage_item */
extern T0* T187f18(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_item */
extern T0* T187f29(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_equality_tester */
extern T0* T187f17(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_item */
extern T6 T187f25(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].resize */
extern T0* T200f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].resized_area */
extern T0* T199f2(T0* C, T6 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].copy_data */
extern void T199f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].move_data */
extern void T199f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].overlapping_move */
extern void T199f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].non_overlapping_move */
extern void T199f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T199c4(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T200f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make_area */
extern T0* T297c2(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].default_create */
extern T0* T200c3(void);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].force_new */
extern void T187f33(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_put */
extern void T187f40(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_put */
extern void T187f39(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_put */
extern void T187f38(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].resize */
extern void T187f37(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_resize */
extern void T187f48(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].special_integer_ */
extern T0* T187f28(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_storage_resize */
extern void T187f47(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_resize */
extern void T187f46(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_resize */
extern void T187f45(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_modulus */
extern T6 T187f19(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_capacity */
extern T6 T187f26(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].unset_found_item */
extern void T187f36(T0* C);
/* XM_EIFFEL_PARSER.new_name_set */
extern T0* T104f134(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_equal */
extern T0* T187c32(T6 a1);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T287c3(void);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make */
extern void T187f35(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_cursor */
extern T0* T187f21(T0* C);
/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME].make */
extern T0* T288c3(T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_slots */
extern void T187f44(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_clashes */
extern void T187f43(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_key_storage */
extern void T187f42(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_item_storage */
extern void T187f41(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.on_start_tag */
extern void T104f244(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER.on_end_tag */
extern void T104f243(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER_NAME.local_part */
extern T0* T184f12(T0* C);
/* XM_EIFFEL_PARSER_NAME.string_ */
extern T0* T184f18(T0* C);
/* XM_EIFFEL_PARSER_NAME.last */
extern T0* T184f17(T0* C);
/* DS_BILINKED_LIST [STRING_8].last */
extern T0* T191f9(T0* C);
/* XM_EIFFEL_PARSER_NAME.ns_prefix */
extern T0* T184f11(T0* C);
/* XM_EIFFEL_PARSER_NAME.is_namespace_name */
extern T1 T184f16(T0* C);
/* XM_EIFFEL_PARSER.on_start_tag_finish */
extern void T104f242(T0* C);
/* KL_SPECIAL_ROUTINES [BOOLEAN].resize */
extern T0* T198f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [BOOLEAN].resized_area */
extern T0* T196f3(T0* C, T6 a1);
/* SPECIAL [BOOLEAN].copy_data */
extern void T196f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [BOOLEAN].move_data */
extern void T196f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [BOOLEAN].overlapping_move */
extern void T196f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [BOOLEAN].non_overlapping_move */
extern void T196f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [BOOLEAN].make */
extern T0* T196c4(T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].make */
extern T0* T198f1(T0* C, T6 a1);
/* TO_SPECIAL [BOOLEAN].make_area */
extern T0* T296c2(T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].default_create */
extern T0* T198c3(void);
/* XM_EIFFEL_PARSER.when_external_dtd */
extern void T104f241(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.last_error */
extern T0* T181f2(T0* C);
/* XM_EIFFEL_PARSER.null_resolver */
extern unsigned char ge1333os5975;
extern T0* ge1333ov5975;
extern T0* T104f103(T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern T0* T215c198(void);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern void T215f198p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T215f207(T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T215f207p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_with_buffer */
extern void T215f206(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_initialize */
extern void T215f216(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_build_tables */
extern void T215f221(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template */
extern T0* T215f192(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_fixed_array */
extern T0* T215f195(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_meta_template */
extern T0* T215f191(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_ec_template */
extern T0* T215f190(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template */
extern T0* T215f189(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template */
extern T0* T215f188(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template */
extern T0* T215f187(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_6 */
extern void T215f233(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_array_subcopy */
extern void T215f234(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_SCANNER_DTD.integer_array_ */
extern T0* T215f197(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_5 */
extern void T215f232(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_4 */
extern void T215f231(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_3 */
extern void T215f230(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_2 */
extern void T215f229(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_1 */
extern void T215f228(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template */
extern T0* T215f186(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_6 */
extern void T215f227(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_5 */
extern void T215f226(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_4 */
extern void T215f225(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_3 */
extern void T215f224(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_2 */
extern void T215f223(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_1 */
extern void T215f222(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.empty_buffer */
extern T0* T215f49(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].force */
extern void T178f8(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.has_error */
extern T1 T181f1(T0* C);
/* XM_EIFFEL_PARSER.resolve_external_id */
extern void T104f257(T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.resolve */
extern void T181f6(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_public */
extern void T181f5(T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.is_public */
extern T1 T186f3(T0* C);
/* XM_EIFFEL_PARSER.on_dtd_end */
extern void T104f240(T0* C);
/* XM_DTD_CALLBACKS_NULL.on_dtd_end */
extern void T214f5(T0* C);
/* XM_EIFFEL_PARSER.on_doctype */
extern void T104f239(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_DTD_CALLBACKS_NULL.on_doctype */
extern void T214f4(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_DTD_CALLBACKS_NULL.make */
extern T0* T214c1(void);
/* XM_EIFFEL_DECLARATION.set_encoding */
extern void T185f9(T0* C, T0* a1);
/* XM_EIFFEL_DECLARATION.set_stand_alone */
extern void T185f8(T0* C, T1 a1);
/* XM_EIFFEL_DECLARATION.set_version */
extern void T185f11(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].resize */
extern T0* T195f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_DECLARATION].resized_area */
extern T0* T194f3(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_DECLARATION].copy_data */
extern void T194f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_EIFFEL_DECLARATION].move_data */
extern void T194f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_DECLARATION].overlapping_move */
extern void T194f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_DECLARATION].non_overlapping_move */
extern void T194f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_DECLARATION].make */
extern T0* T194c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].make */
extern T0* T195f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_EIFFEL_DECLARATION].make_area */
extern T0* T295c2(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].default_create */
extern T0* T195c3(void);
/* XM_EIFFEL_DECLARATION.make */
extern T0* T185c7(void);
/* XM_EIFFEL_DECLARATION.process */
extern void T185f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_xml_declaration */
extern void T104f261(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_EIFFEL_PARSER.apply_encoding */
extern void T104f238(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_content */
extern void T104f237(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_dtd_processing_instruction */
extern void T104f236(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_dtd_processing_instruction */
extern void T214f3(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_processing_instruction */
extern void T104f235(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_dtd_comment */
extern void T104f234(T0* C, T0* a1);
/* XM_DTD_CALLBACKS_NULL.on_dtd_comment */
extern void T214f2(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_comment */
extern void T104f233(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.entity_referenced_in_entity_value */
extern T0* T104f117(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.defined_entity_referenced */
extern T0* T104f194(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.external_entity_to_string */
extern T0* T104f200(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.read_string */
extern void T240f29(T0* C, T6 a1);
/* KL_PLATFORM.maximum_integer */
extern unsigned char ge217os8957;
extern T6 ge217ov8957;
extern T6 T242f2(T0* C);
/* KL_PLATFORM.old_maximum_integer */
extern T6 T242f4(T0* C);
/* KL_INTEGER_ROUTINES.platform */
extern T0* T241f1(T0* C);
/* XM_EIFFEL_PARSER.integer_ */
extern T0* T104f201(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item */
extern T0* T179f21(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_item */
extern T0* T179f36(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.force_error */
extern void T104f232(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.report_error */
extern void T104f230(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_error */
extern void T104f256(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.setup_error_state */
extern void T104f255(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.onstring_utf8 */
extern T0* T104f96(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.maximum_item_code */
extern T6 T104f189(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_latin1 */
extern T1 T104f188(T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_from_utf8 */
extern T0* T104f184(T0* C, T0* a1);
/* UC_UTF8_STRING.make_from_utf8 */
extern T0* T239c53(T0* a1);
/* UC_UTF8_STRING.append_utf8 */
extern void T239f66(T0* C, T0* a1);
/* UC_UTF8_ROUTINES.valid_utf8 */
extern T1 T237f1(T0* C, T0* a1);
/* UC_UTF8_ROUTINES.is_encoded_next_byte */
extern T1 T237f10(T0* C, T2 a1);
/* UC_UTF8_ROUTINES.is_encoded_second_byte */
extern T1 T237f5(T0* C, T2 a1, T2 a2);
/* UC_UTF8_ROUTINES.is_encoded_first_byte */
extern T1 T237f2(T0* C, T2 a1);
/* XM_EIFFEL_PARSER.utf8 */
extern T0* T104f187(T0* C);
/* XM_EIFFEL_PARSER.is_string_mode_ascii */
extern T1 T104f185(T0* C);
/* XM_EIFFEL_PARSER.onstring_ascii */
extern T0* T104f94(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_unicode */
extern T1 T104f183(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string */
extern T0* T104f115(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_string */
extern unsigned char ge1333os6043;
extern T0* ge1333ov6043;
extern T0* T104f193(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_uc */
extern unsigned char ge1333os6044;
extern T0* ge1333ov6044;
extern T0* T104f192(T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_empty */
extern T0* T104f199(T0* C);
/* UC_UTF8_STRING.make_empty */
extern T0* T239c57(void);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].resize */
extern T0* T193f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].resized_area */
extern T0* T192f2(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].copy_data */
extern void T192f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].move_data */
extern void T192f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].overlapping_move */
extern void T192f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].non_overlapping_move */
extern void T192f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].make */
extern T0* T192c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].make */
extern T0* T193f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_EIFFEL_PARSER_NAME].make_area */
extern T0* T294c2(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T193c3(void);
/* XM_EIFFEL_PARSER.namespace_force_last */
extern void T104f231(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER_NAME.force_last */
extern void T184f20(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.new_string_bilinked_list */
extern T0* T184f7(T0* C);
/* XM_EIFFEL_PARSER_NAME.can_force_last */
extern T1 T184f6(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_namespace_name */
extern T0* T104f111(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern void T184f21(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern T0* T184c21(void);
/* XM_EIFFEL_PARSER_NAME.make_namespaces */
extern T0* T184c19(void);
/* XM_EIFFEL_PARSER.yy_push_last_value */
extern void T104f221(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.accept */
extern void T104f220(T0* C);
/* XM_EIFFEL_PARSER.yy_do_error_action */
extern void T104f218(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.report_eof_expected_error */
extern void T104f229(T0* C);
/* XM_EIFFEL_PARSER.read_token */
extern void T104f217(T0* C);
/* XM_EIFFEL_PARSER.process_attribute_entity */
extern void T104f228(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_entity_scanner */
extern void T104f254(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.has_error */
extern T1 T211f55(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.has_error */
extern T1 T217f56(T0* C);
/* XM_EIFFEL_ENTITY_DEF.apply_input_buffer */
extern void T211f228(T0* C);
/* KL_STRING_INPUT_STREAM.make */
extern T0* T355c8(T0* a1);
/* UC_UTF8_ROUTINES.to_utf8 */
extern T0* T237f35(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.utf8 */
extern T0* T211f66(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.apply_input_buffer */
extern void T217f232(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.utf8 */
extern T0* T217f68(T0* C);
/* XM_EIFFEL_PARSER.process_entity */
extern void T104f227(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_pe_entity */
extern void T104f226(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.special_integer_ */
extern T0* T104f113(T0* C);
/* XM_EIFFEL_PARSER.yy_init_value_stacks */
extern void T104f216(T0* C);
/* XM_EIFFEL_PARSER.yy_clear_all */
extern void T104f225(T0* C);
/* XM_EIFFEL_PARSER.clear_all */
extern void T104f253(T0* C);
/* XM_EIFFEL_PARSER.clear_stacks */
extern void T104f259(T0* C);
/* XM_EIFFEL_PARSER.yy_clear_value_stacks */
extern void T104f260(T0* C);
/* SPECIAL [XM_EIFFEL_DECLARATION].clear_all */
extern void T194f6(T0* C);
/* SPECIAL [BOOLEAN].clear_all */
extern void T196f6(T0* C);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].clear_all */
extern void T209f6(T0* C);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].clear_all */
extern void T204f6(T0* C);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].clear_all */
extern void T206f6(T0* C);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].clear_all */
extern void T201f6(T0* C);
/* SPECIAL [XM_DTD_EXTERNAL_ID].clear_all */
extern void T197f6(T0* C);
/* SPECIAL [STRING_8].clear_all */
extern void T54f10(T0* C);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].clear_all */
extern void T199f6(T0* C);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].clear_all */
extern void T192f6(T0* C);
/* SPECIAL [ANY].clear_all */
extern void T182f6(T0* C);
/* XM_EIFFEL_PARSER.abort */
extern void T104f219(T0* C);
/* XM_EIFFEL_PARSER.on_start */
extern void T104f213(T0* C);
/* XM_EIFFEL_PARSER.reset_error_state */
extern void T104f212(T0* C);
/* XM_EIFFEL_PARSER.reset */
extern void T104f208(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].wipe_out */
extern void T179f39(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_wipe_out */
extern void T179f49(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_wipe_out */
extern void T179f48(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_wipe_out */
extern void T179f47(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_wipe_out */
extern void T179f46(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].move_all_cursors_after */
extern void T179f44(T0* C);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].set_next_cursor */
extern void T283f6(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].set_position */
extern void T283f5(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.make_scanner */
extern void T104f206(T0* C);
/* XM_EIFFEL_SCANNER.make_scanner */
extern T0* T174c196(void);
/* XM_EIFFEL_SCANNER.reset */
extern void T174f204(T0* C);
/* XM_EIFFEL_SCANNER.reset */
extern void T174f204p1(T0* C);
/* XM_EIFFEL_SCANNER.make_with_buffer */
extern void T174f203(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_initialize */
extern void T174f211(T0* C);
/* XM_EIFFEL_SCANNER.yy_build_tables */
extern void T174f219(T0* C);
/* XM_EIFFEL_SCANNER.yy_accept_template */
extern T0* T174f190(T0* C);
/* XM_EIFFEL_SCANNER.yy_fixed_array */
extern T0* T174f193(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_meta_template */
extern T0* T174f189(T0* C);
/* XM_EIFFEL_SCANNER.yy_ec_template */
extern T0* T174f188(T0* C);
/* XM_EIFFEL_SCANNER.yy_def_template */
extern T0* T174f187(T0* C);
/* XM_EIFFEL_SCANNER.yy_base_template */
extern T0* T174f186(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template */
extern T0* T174f185(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_6 */
extern void T174f231(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_array_subcopy */
extern void T174f232(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_SCANNER.integer_array_ */
extern T0* T174f195(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_5 */
extern void T174f230(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_4 */
extern void T174f229(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_3 */
extern void T174f228(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_2 */
extern void T174f227(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_1 */
extern void T174f226(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template */
extern T0* T174f184(T0* C);
/* XM_EIFFEL_SCANNER.yy_nxt_template_6 */
extern void T174f225(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_5 */
extern void T174f224(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_4 */
extern void T174f223(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_3 */
extern void T174f222(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_2 */
extern void T174f221(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_1 */
extern void T174f220(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.empty_buffer */
extern T0* T174f42(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T82f37(T0* C);
/* KL_TEXT_INPUT_FILE.is_closed */
extern T1 T82f15(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_closed */
extern T1 T82f23(T0* C);
/* KL_TEXT_INPUT_FILE.old_open_read */
extern void T82f40(T0* C);
/* KL_TEXT_INPUT_FILE.default_pointer */
extern T14 T82f18(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T82f40p1(T0* C);
/* KL_TEXT_INPUT_FILE.file_open */
extern T14 T82f20(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.old_is_readable */
extern T1 T82f14(T0* C);
/* UNIX_FILE_INFO.is_readable */
extern T1 T160f5(T0* C);
/* UNIX_FILE_INFO.file_eaccess */
extern T1 T160f3(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.buffered_file_info */
extern unsigned char ge2126os3223;
extern T0* ge2126ov3223;
extern T0* T82f22(T0* C);
/* UNIX_FILE_INFO.make */
extern T0* T160c6(void);
/* UNIX_FILE_INFO.make_buffered_file_info */
extern void T160f8(T0* C, T6 a1);
/* UNIX_FILE_INFO.stat_size */
extern T6 T160f4(T0* C);
/* KL_TEXT_INPUT_FILE.set_buffer */
extern void T82f43(T0* C);
/* UNIX_FILE_INFO.update */
extern void T160f7(T0* C, T0* a1);
/* UNIX_FILE_INFO.file_stat */
extern void T160f9(T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.old_exists */
extern T1 T82f13(T0* C);
/* KL_TEXT_INPUT_FILE.file_exists */
extern T1 T82f21(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.make */
extern T0* T82c36(T0* a1);
/* KL_TEXT_INPUT_FILE.old_make */
extern void T82f39(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.string_ */
extern T0* T82f26(T0* C);
/* ET_XACE_PARSER.make_with_variables */
extern T0* T87c227(T0* a1, T0* a2);
/* ET_XACE_PARSER.make_with_variables_and_factory */
extern void T87f229(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.enable_position_table */
extern void T99f10(T0* C, T0* a1);
/* XM_POSITION_TABLE.make */
extern T0* T95c3(void);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T234c8(void);
/* XM_EIFFEL_PARSER.set_callbacks */
extern void T104f205(T0* C, T0* a1);
/* XM_TREE_CALLBACKS_PIPE.make */
extern T0* T97c10(void);
/* XM_TREE_CALLBACKS_PIPE.callbacks_pipe */
extern T0* T97f9(T0* C, T0* a1);
/* ARRAY [XM_CALLBACKS_FILTER].item */
extern T0* T164f4(T0* C, T6 a1);
/* XM_CALLBACKS_TO_TREE_FILTER.make_null */
extern T0* T99c9(void);
/* XM_TREE_CALLBACKS_PIPE.new_stop_on_error */
extern T0* T97f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.make_null */
extern T0* T98c4(void);
/* XM_TREE_CALLBACKS_PIPE.new_namespace_resolver */
extern T0* T97f6(T0* C);
/* XM_NAMESPACE_RESOLVER.make_null */
extern T0* T162c25(void);
/* XM_EIFFEL_PARSER.set_string_mode_mixed */
extern void T104f204(T0* C);
/* XM_EIFFEL_PARSER.make */
extern T0* T104c202(void);
/* XM_EIFFEL_PARSER.new_entities_table */
extern T0* T104f87(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].set_key_equality_tester */
extern void T179f41(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8].internal_set_equality_tester */
extern void T281f6(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_map_default */
extern T0* T179c38(void);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_map */
extern void T179f43(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_with_equality_testers */
extern void T179f55(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T281c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8].new_cursor */
extern T0* T281f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T322c3(T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_cursor */
extern T0* T179f35(T0* C);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T283c4(T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_sparse_container */
extern void T179f60(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_slots */
extern void T179f64(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_clashes */
extern void T179f63(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_key_storage */
extern void T179f62(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_item_storage */
extern void T179f61(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T285f2(T0* C, T6 a1);
/* TO_SPECIAL [XM_EIFFEL_ENTITY_DEF].make_area */
extern T0* T323c2(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].default_create */
extern T0* T285c3(void);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].default_capacity */
extern T6 T179f26(T0* C);
/* XM_EIFFEL_PARSER.make_parser */
extern void T104f207(T0* C);
/* XM_EIFFEL_PARSER.yy_build_parser_tables */
extern void T104f211(T0* C);
/* XM_EIFFEL_PARSER.yycheck_template */
extern unsigned char ge1329os5922;
extern T0* ge1329ov5922;
extern T0* T104f104(T0* C);
/* XM_EIFFEL_PARSER.yyfixed_array */
extern T0* T104f181(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytable_template */
extern unsigned char ge1329os5921;
extern T0* ge1329ov5921;
extern T0* T104f92(T0* C);
/* XM_EIFFEL_PARSER.yypgoto_template */
extern unsigned char ge1329os5920;
extern T0* ge1329ov5920;
extern T0* T104f90(T0* C);
/* XM_EIFFEL_PARSER.yypact_template */
extern unsigned char ge1329os5919;
extern T0* ge1329ov5919;
extern T0* T104f88(T0* C);
/* XM_EIFFEL_PARSER.yydefgoto_template */
extern unsigned char ge1329os5918;
extern T0* ge1329ov5918;
extern T0* T104f86(T0* C);
/* XM_EIFFEL_PARSER.yydefact_template */
extern unsigned char ge1329os5917;
extern T0* ge1329ov5917;
extern T0* T104f84(T0* C);
/* XM_EIFFEL_PARSER.yytypes2_template */
extern unsigned char ge1329os5916;
extern T0* ge1329ov5916;
extern T0* T104f171(T0* C);
/* XM_EIFFEL_PARSER.yytypes1_template */
extern unsigned char ge1329os5915;
extern T0* ge1329ov5915;
extern T0* T104f151(T0* C);
/* XM_EIFFEL_PARSER.yyr1_template */
extern unsigned char ge1329os5914;
extern T0* ge1329ov5914;
extern T0* T104f126(T0* C);
/* XM_EIFFEL_PARSER.yytranslate_template */
extern unsigned char ge1329os5913;
extern T0* ge1329ov5913;
extern T0* T104f123(T0* C);
/* XM_EIFFEL_PARSER.yy_create_value_stacks */
extern void T104f210(T0* C);
/* XM_EXPAT_PARSER_FACTORY.new_expat_parser */
extern T0* T103f2(T0* C);
/* XM_EXPAT_PARSER_FACTORY.is_expat_parser_available */
extern T1 T103f1(T0* C);
/* XM_EXPAT_PARSER_FACTORY.default_create */
extern T0* T103c3(void);
/* ET_XACE_VALIDATOR.make */
extern T0* T100c30(T0* a1);
/* ET_XACE_PREPROCESSOR.make */
extern T0* T101c10(T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.set_parsed_libraries */
extern void T85f228(T0* C, T0* a1);
/* ET_XACE_LIBRARY_PARSER.make_with_variables_and_factory */
extern void T85f227(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_LIBRARY_PARSER.make_with_variables_and_factory */
extern T0* T85c227(T0* a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].set_key_equality_tester */
extern void T102f39(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [ET_XACE_LIBRARY, STRING_8].internal_set_equality_tester */
extern void T169f6(T0* C, T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].make_map */
extern T0* T102c37(T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].make_with_equality_testers */
extern void T102f40(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [ET_XACE_LIBRARY, STRING_8].make */
extern T0* T169c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [ET_XACE_LIBRARY, STRING_8].new_cursor */
extern T0* T169f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [ET_XACE_LIBRARY, STRING_8].make */
extern T0* T269c3(T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].new_cursor */
extern T0* T102f32(T0* C);
/* DS_HASH_TABLE_CURSOR [ET_XACE_LIBRARY, STRING_8].make */
extern T0* T171c4(T0* a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].make_sparse_container */
extern void T102f47(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].make_slots */
extern void T102f51(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].make_clashes */
extern void T102f50(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].make_key_storage */
extern void T102f49(T0* C, T6 a1);
/* DS_HASH_TABLE [ET_XACE_LIBRARY, STRING_8].make_item_storage */
extern void T102f48(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY].make */
extern T0* T173f1(T0* C, T6 a1);
/* TO_SPECIAL [ET_XACE_LIBRARY].make_area */
extern T0* T270c2(T6 a1);
/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY].default_create */
extern T0* T173c3(void);
/* ET_XACE_AST_FACTORY.make */
extern T0* T92c10(void);
/* GEXACE_LIBRARY_COMMAND.execute */
extern void T40f16(T0* C);
/* GEXACE_LIBRARY_COMMAND.execute_generators */
extern void T40f17(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].forth */
extern void T68f9(T0* C);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].cursor_forth */
extern void T50f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].add_traversing_cursor */
extern void T50f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].set_next_cursor */
extern void T68f11(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].remove_traversing_cursor */
extern void T50f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].set */
extern void T68f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].item */
extern T0* T68f6(T0* C);
/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].start */
extern void T68f8(T0* C);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].cursor_start */
extern void T50f10(T0* C, T0* a1);
/* DS_LINKED_LIST [ET_XACE_GENERATOR].cursor_off */
extern T1 T50f7(T0* C, T0* a1);
/* ET_XACE_LIBRARY_PARSER.parse_file */
extern void T85f226(T0* C, T0* a1);
/* ET_XACE_LIBRARY_PARSER.new_library */
extern T0* T85f12(T0* C, T0* a1, T0* a2);
/* ET_XACE_LIBRARY_PARSER.set_ve */
extern void T85f225(T0* C, T1 a1);
/* ET_XACE_LIBRARY_PARSER.set_shallow */
extern void T85f224(T0* C, T1 a1);
/* ET_XACE_LIBRARY_PARSER.make_with_variables */
extern T0* T85c223(T0* a1, T0* a2);
/* GEXACE_SYSTEM_COMMAND.execute */
extern void T36f16(T0* C);
/* GEXACE_SYSTEM_COMMAND.execute_generators */
extern void T36f17(T0* C, T0* a1);
/* ET_XACE_SYSTEM_PARSER.parse_file */
extern void T80f228(T0* C, T0* a1);
/* ET_XACE_SYSTEM_PARSER.new_system */
extern T0* T80f12(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_PARSER.fill_system */
extern void T80f230(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_SYSTEM_PARSER.fill_externals */
extern void T80f232(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* ET_XACE_SYSTEM_PARSER.new_export */
extern T0* T80f130(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_PARSER.new_exported_feature */
extern T0* T80f222(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_PARSER.uc_alias */
extern T0* T80f224(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_feature */
extern T0* T80f221(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_export */
extern T0* T80f129(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_include_dir */
extern T0* T80f128(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_location */
extern T0* T80f127(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_link_library */
extern T0* T80f126(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_external */
extern T0* T80f26(T0* C);
/* ET_XACE_SYSTEM_PARSER.new_options */
extern T0* T80f25(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_PARSER.fill_options */
extern void T80f231(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_SYSTEM_PARSER.uc_debug */
extern T0* T80f125(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_optimize */
extern T0* T80f124(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_check */
extern T0* T80f122(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_loop */
extern T0* T80f119(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_invariant */
extern T0* T80f117(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_ensure */
extern T0* T80f115(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_enable */
extern T0* T80f113(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_require */
extern T0* T80f112(T0* C);
/* ET_XACE_SYSTEM_PARSER.is_false */
extern T1 T80f111(T0* C, T0* a1);
/* ET_XACE_SYSTEM_PARSER.is_true */
extern T1 T80f110(T0* C, T0* a1);
/* ET_XACE_SYSTEM_PARSER.option_codes */
extern T0* T80f28(T0* C);
/* ET_XACE_SYSTEM_PARSER.string_equality_tester */
extern T0* T80f13(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_value */
extern T0* T80f27(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_option */
extern T0* T80f24(T0* C);
/* ET_XACE_SYSTEM_PARSER.new_mount */
extern T0* T80f23(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_PARSER.execution_environment */
extern T0* T80f135(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_prefix */
extern T0* T80f133(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_mount */
extern T0* T80f22(T0* C);
/* ET_XACE_SYSTEM_PARSER.new_cluster */
extern T0* T80f21(T0* C, T0* a1, T0* a2, T0* a3);
/* ET_XACE_SYSTEM_PARSER.new_class */
extern T0* T80f134(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_PARSER.new_feature */
extern T0* T80f223(T0* C, T0* a1, T0* a2);
/* ET_XACE_SYSTEM_PARSER.uc_relative */
extern T0* T80f132(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_abstract */
extern T0* T80f131(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_cluster */
extern T0* T80f19(T0* C);
/* ET_XACE_SYSTEM_PARSER.string_ */
extern T0* T80f18(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_creation */
extern T0* T80f17(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_class */
extern T0* T80f16(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_root */
extern T0* T80f15(T0* C);
/* ET_XACE_SYSTEM_PARSER.uc_name */
extern T0* T80f14(T0* C);
/* ET_XACE_SYSTEM_PARSER.set_ve */
extern void T80f227(T0* C, T1 a1);
/* ET_XACE_SYSTEM_PARSER.set_shallow */
extern void T80f226(T0* C, T1 a1);
/* ET_XACE_SYSTEM_PARSER.make_with_variables */
extern T0* T80c225(T0* a1, T0* a2);
/* ET_XACE_SYSTEM_PARSER.make_with_variables_and_factory */
extern void T80f229(T0* C, T0* a1, T0* a2, T0* a3);
/* GEXACE_VALIDATE_COMMAND.set_xace_filename */
extern void T41f8(T0* C, T0* a1);
/* GEXACE_LIBRARY_COMMAND.set_xace_filename */
extern void T40f15(T0* C, T0* a1);
/* GEXACE_SYSTEM_COMMAND.set_xace_filename */
extern void T36f15(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.error_position */
extern T0* T217f57(T0* C);
/* XM_DEFAULT_POSITION.make */
extern T0* T175c7(T0* a1, T6 a2, T6 a3, T6 a4);
/* XM_EIFFEL_SCANNER_DTD.error_position */
extern T0* T215f55(T0* C);
/* XM_EIFFEL_ENTITY_DEF.error_position */
extern T0* T211f56(T0* C);
/* XM_EIFFEL_SCANNER.error_position */
extern T0* T174f63(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.end_of_file */
extern T1 T217f60(T0* C);
/* XM_EIFFEL_SCANNER_DTD.end_of_file */
extern T1 T215f61(T0* C);
/* XM_EIFFEL_ENTITY_DEF.end_of_file */
extern T1 T211f59(T0* C);
/* XM_EIFFEL_SCANNER.end_of_file */
extern T1 T174f65(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_applicable_encoding */
extern T1 T217f61(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_applicable_encoding */
extern T1 T240f16(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_valid_encoding */
extern T1 T240f9(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.is_applicable_encoding */
extern T1 T215f48(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.is_applicable_encoding */
extern T1 T211f60(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.is_applicable_encoding */
extern T1 T174f66(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.start_condition */
extern T6 T217f62(T0* C);
/* XM_EIFFEL_SCANNER_DTD.start_condition */
extern T6 T215f50(T0* C);
/* XM_EIFFEL_ENTITY_DEF.start_condition */
extern T6 T211f61(T0* C);
/* XM_EIFFEL_SCANNER.start_condition */
extern T6 T174f43(T0* C);
/* ET_XACE_XACE_VE_GENERATOR.default_system_output_filename */
extern unsigned char ge1159os2505;
extern T0* ge1159ov2505;
extern T0* T49f5(T0* C);
/* ET_XACE_ACE_SE_GENERATOR.default_system_output_filename */
extern unsigned char ge1154os2505;
extern T0* ge1154ov2505;
extern T0* T48f5(T0* C);
/* ET_XACE_ESD_GENERATOR.default_system_output_filename */
extern unsigned char ge1156os2505;
extern T0* ge1156ov2505;
extern T0* T46f5(T0* C);
/* ET_XACE_ECF_GENERATOR.default_system_output_filename */
extern unsigned char ge1155os2505;
extern T0* ge1155ov2505;
extern T0* T45f5(T0* C);
/* ET_XACE_ACE_GENERATOR.default_system_output_filename */
extern unsigned char ge1153os2505;
extern T0* ge1153ov2505;
extern T0* T44f5(T0* C);
/* ET_XACE_XACE_GENERATOR.default_system_output_filename */
extern T0* T43f5(T0* C);
/* ET_XACE_XACE_VE_GENERATOR.default_library_output_filename */
extern unsigned char ge1159os2506;
extern T0* ge1159ov2506;
extern T0* T49f6(T0* C);
/* ET_XACE_ACE_SE_GENERATOR.default_library_output_filename */
extern unsigned char ge1154os2506;
extern T0* ge1154ov2506;
extern T0* T48f6(T0* C);
/* ET_XACE_ESD_GENERATOR.default_library_output_filename */
extern unsigned char ge1156os2506;
extern T0* ge1156ov2506;
extern T0* T46f6(T0* C);
/* ET_XACE_ECF_GENERATOR.default_library_output_filename */
extern unsigned char ge1155os2506;
extern T0* ge1155ov2506;
extern T0* T45f6(T0* C);
/* ET_XACE_ACE_GENERATOR.default_library_output_filename */
extern unsigned char ge1153os2506;
extern T0* ge1153ov2506;
extern T0* T44f6(T0* C);
/* ET_XACE_XACE_GENERATOR.default_library_output_filename */
extern T0* T43f6(T0* C);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.default_message */
extern T0* T361f5(T0* C);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.message */
extern T0* T361f3(T0* C, T0* a1);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.arguments */
extern T0* T361f6(T0* C);
/* ARRAY [STRING_8].valid_index */
extern T1 T67f4(T0* C, T6 a1);
/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.string_ */
extern T0* T361f4(T0* C);
/* ET_XACE_INVALID_EXPRESSION_ERROR.default_message */
extern T0* T304f5(T0* C);
/* ET_XACE_INVALID_EXPRESSION_ERROR.message */
extern T0* T304f3(T0* C, T0* a1);
/* ET_XACE_INVALID_EXPRESSION_ERROR.arguments */
extern T0* T304f6(T0* C);
/* ET_XACE_INVALID_EXPRESSION_ERROR.string_ */
extern T0* T304f4(T0* C);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.default_message */
extern T0* T303f5(T0* C);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.message */
extern T0* T303f3(T0* C, T0* a1);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.arguments */
extern T0* T303f6(T0* C);
/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.string_ */
extern T0* T303f4(T0* C);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.default_message */
extern T0* T229f5(T0* C);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.message */
extern T0* T229f3(T0* C, T0* a1);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.arguments */
extern T0* T229f6(T0* C);
/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.string_ */
extern T0* T229f4(T0* C);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.default_message */
extern T0* T228f5(T0* C);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.message */
extern T0* T228f3(T0* C, T0* a1);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.arguments */
extern T0* T228f6(T0* C);
/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.string_ */
extern T0* T228f4(T0* C);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.default_message */
extern T0* T227f5(T0* C);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.message */
extern T0* T227f3(T0* C, T0* a1);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.arguments */
extern T0* T227f6(T0* C);
/* ET_XACE_UNKNOWN_ELEMENT_ERROR.string_ */
extern T0* T227f4(T0* C);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.default_message */
extern T0* T226f5(T0* C);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.message */
extern T0* T226f3(T0* C, T0* a1);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.arguments */
extern T0* T226f6(T0* C);
/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.string_ */
extern T0* T226f4(T0* C);
/* ET_XACE_MISSING_ELEMENT_ERROR.default_message */
extern T0* T225f5(T0* C);
/* ET_XACE_MISSING_ELEMENT_ERROR.message */
extern T0* T225f3(T0* C, T0* a1);
/* ET_XACE_MISSING_ELEMENT_ERROR.arguments */
extern T0* T225f6(T0* C);
/* ET_XACE_MISSING_ELEMENT_ERROR.string_ */
extern T0* T225f4(T0* C);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.default_message */
extern T0* T224f5(T0* C);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.message */
extern T0* T224f3(T0* C, T0* a1);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.arguments */
extern T0* T224f6(T0* C);
/* ET_XACE_MISSING_ATTRIBUTE_ERROR.string_ */
extern T0* T224f4(T0* C);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.default_message */
extern T0* T223f5(T0* C);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.message */
extern T0* T223f3(T0* C, T0* a1);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.arguments */
extern T0* T223f6(T0* C);
/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.string_ */
extern T0* T223f4(T0* C);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.default_message */
extern T0* T222f5(T0* C);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.message */
extern T0* T222f3(T0* C, T0* a1);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.arguments */
extern T0* T222f6(T0* C);
/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.string_ */
extern T0* T222f4(T0* C);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.default_message */
extern T0* T221f5(T0* C);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.message */
extern T0* T221f3(T0* C, T0* a1);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.arguments */
extern T0* T221f6(T0* C);
/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.string_ */
extern T0* T221f4(T0* C);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.default_message */
extern T0* T220f5(T0* C);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.message */
extern T0* T220f3(T0* C, T0* a1);
/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.arguments */
extern T0* T220f6(T0* C);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.default_message */
extern T0* T219f5(T0* C);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.message */
extern T0* T219f3(T0* C, T0* a1);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.arguments */
extern T0* T219f6(T0* C);
/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.string_ */
extern T0* T219f4(T0* C);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.default_message */
extern T0* T218f5(T0* C);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.message */
extern T0* T218f3(T0* C, T0* a1);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.arguments */
extern T0* T218f6(T0* C);
/* ET_XACE_BOOLEAN_EXPECTED_ERROR.string_ */
extern T0* T218f4(T0* C);
/* ET_XACE_NOT_XACE_FILE_ERROR.default_message */
extern T0* T111f5(T0* C);
/* ET_XACE_NOT_XACE_FILE_ERROR.message */
extern T0* T111f3(T0* C, T0* a1);
/* ET_XACE_NOT_XACE_FILE_ERROR.arguments */
extern T0* T111f6(T0* C);
/* ET_XACE_NOT_XACE_FILE_ERROR.string_ */
extern T0* T111f4(T0* C);
/* UT_MESSAGE.default_message */
extern T0* T110f5(T0* C);
/* UT_MESSAGE.message */
extern T0* T110f3(T0* C, T0* a1);
/* UT_MESSAGE.arguments */
extern T0* T110f6(T0* C);
/* UT_MESSAGE.string_ */
extern T0* T110f4(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
extern T0* T90f5(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
extern T0* T90f3(T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.arguments */
extern T0* T90f6(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
extern T0* T90f4(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.default_message */
extern T0* T89f5(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.message */
extern T0* T89f3(T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.arguments */
extern T0* T89f6(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.string_ */
extern T0* T89f4(T0* C);
/* UT_USAGE_MESSAGE.default_message */
extern T0* T34f2(T0* C);
/* UT_USAGE_MESSAGE.message */
extern T0* T34f4(T0* C, T0* a1);
/* UT_USAGE_MESSAGE.arguments */
extern T0* T34f6(T0* C);
/* UT_USAGE_MESSAGE.string_ */
extern T0* T34f5(T0* C);
extern T0* GE_ma236(T6 c, ...);
extern T0* GE_ma67(T6 c, ...);
extern T0* GE_ma164(T6 c, ...);
extern T0* ge1158ov2506;
extern T0* ge1158ov2505;
extern T0* ge220ov2953;
extern T0* ge224ov2825;
extern T0* ge56ov2054;
extern T0* ge56ov2055;
extern T0* ge230ov3886;
extern T0* ge159ov8859;
extern T0* ge1337ov8134;
extern T0* ge1337ov8135;
extern T0* ge208ov4752;
extern T0* ge1328ov8867;
extern T0* ge1328ov8869;
extern T0* ge1280ov5379;
extern T0* ge1261ov7979;
extern T0* ge1261ov7978;
extern T0* ge1131ov4422;
extern T0* ge1131ov4425;
extern T0* ge1131ov4416;
extern T0* ge1131ov4435;
extern T0* ge1131ov4428;
extern T0* ge1131ov4414;
extern T0* ge1131ov4437;
extern T0* ge227ov2953;
extern T0* ge1154ov2753;
extern T0* ge197ov4772;
extern T0* ge1131ov4418;
extern T0* ge1131ov4431;
extern T0* ge1131ov4430;
extern T0* ge1131ov4429;
extern T0* ge1131ov4424;
extern T0* ge1131ov4427;
extern T0* ge1131ov4439;
extern T0* ge1131ov4432;
extern T0* ge1131ov4426;
extern T0* ge1131ov4419;
extern T0* ge1131ov4415;
extern T0* ge1131ov4421;
extern T0* ge1131ov4436;
extern T0* ge1131ov4433;
extern T0* ge1131ov4423;
extern T0* ge1131ov4420;
extern T0* ge1131ov4442;
extern T0* ge1131ov4438;
extern T0* ge1131ov4440;
extern T0* ge121ov7571;
extern T0* ge1323ov5669;
extern T0* ge1323ov5668;
extern T0* ge1165ov4248;
extern T0* ge1131ov4434;
extern T0* ge1131ov4417;
extern T0* ge1165ov4247;
extern T0* ge1165ov4246;
extern T0* ge1131ov4249;
extern T0* ge1131ov4250;
extern T0* ge1131ov4251;
extern T0* ge1131ov4252;
extern T0* ge1131ov4253;
extern T0* ge1131ov4254;
extern T0* ge1131ov4255;
extern T0* ge1131ov4256;
extern T0* ge1131ov4257;
extern T0* ge1131ov4258;
extern T0* ge1131ov4259;
extern T0* ge1131ov4260;
extern T0* ge1131ov4261;
extern T0* ge1131ov4262;
extern T0* ge1131ov4263;
extern T0* ge1131ov4264;
extern T0* ge1131ov4265;
extern T0* ge1131ov4266;
extern T0* ge1131ov4267;
extern T0* ge1131ov4268;
extern T0* ge1131ov4269;
extern T0* ge1131ov4270;
extern T0* ge1131ov4271;
extern T0* ge1131ov4272;
extern T0* ge1131ov4273;
extern T0* ge1131ov4274;
extern T0* ge1131ov4275;
extern T0* ge1131ov4276;
extern T0* ge1131ov4277;
extern T0* ge1131ov4278;
extern T0* ge1131ov4279;
extern T0* ge1131ov4280;
extern T0* ge1131ov4281;
extern T0* ge1131ov4282;
extern T0* ge1131ov4283;
extern T0* ge1131ov4284;
extern T0* ge1131ov4285;
extern T0* ge1131ov4286;
extern T0* ge1131ov4287;
extern T0* ge1131ov4288;
extern T0* ge1131ov4289;
extern T0* ge1131ov4290;
extern T0* ge1131ov4291;
extern T0* ge1131ov4292;
extern T0* ge1131ov4293;
extern T0* ge1131ov4294;
extern T0* ge1131ov4295;
extern T0* ge1131ov4296;
extern T0* ge1131ov4297;
extern T0* ge1131ov4298;
extern T0* ge1131ov4299;
extern T0* ge1131ov4300;
extern T0* ge1131ov4301;
extern T0* ge1131ov4302;
extern T0* ge1131ov4303;
extern T0* ge1131ov4304;
extern T0* ge1131ov4305;
extern T0* ge1131ov4306;
extern T0* ge1131ov4307;
extern T0* ge1131ov4308;
extern T0* ge1131ov4309;
extern T0* ge1131ov4310;
extern T0* ge1131ov4311;
extern T0* ge1131ov4312;
extern T0* ge1131ov4313;
extern T0* ge1131ov4314;
extern T0* ge1131ov4315;
extern T0* ge1131ov4316;
extern T0* ge1131ov4317;
extern T0* ge1131ov4318;
extern T0* ge1131ov4319;
extern T0* ge1131ov4320;
extern T0* ge1131ov4321;
extern T0* ge1131ov4322;
extern T0* ge1131ov4323;
extern T0* ge1131ov4324;
extern T0* ge1131ov4325;
extern T0* ge1131ov4326;
extern T0* ge1131ov4327;
extern T0* ge1131ov4328;
extern T0* ge1131ov4329;
extern T0* ge1131ov4330;
extern T0* ge111ov2953;
extern T0* ge1121ov6578;
extern T0* ge1127ov5354;
extern T0* ge1330ov6294;
extern T0* ge1330ov6256;
extern T0* ge1330ov6254;
extern T0* ge1330ov6295;
extern T0* ge1330ov6267;
extern T0* ge1330ov6266;
extern T0* ge1330ov6277;
extern T0* ge1330ov6271;
extern T0* ge1330ov6270;
extern T0* ge1330ov6269;
extern T0* ge1330ov6275;
extern T0* ge1330ov6274;
extern T0* ge1330ov6276;
extern T0* ge1330ov6253;
extern T0* ge1330ov6279;
extern T0* ge1330ov6288;
extern T0* ge1333ov6018;
extern T0* ge1333ov6016;
extern T0* ge1333ov6017;
extern T0* ge1330ov6289;
extern T0* ge1330ov6290;
extern T0* ge1330ov6293;
extern T0* ge1330ov6291;
extern T0* ge1330ov6292;
extern T0* ge1330ov6286;
extern T0* ge1326ov8577;
extern T0* ge1326ov8578;
extern T0* ge1330ov6259;
extern T0* ge1330ov6282;
extern T0* ge1330ov6302;
extern T0* ge1330ov6303;
extern T0* ge1330ov6304;
extern T0* ge1330ov6297;
extern T0* ge1330ov6280;
extern T0* ge1330ov6281;
extern T0* ge1330ov6283;
extern T0* ge1330ov6287;
extern T0* ge1328ov8866;
extern T0* ge1328ov8868;
extern T0* ge1142ov2483;
extern T0* ge1139ov2483;
extern T0* ge1133ov2483;
extern T0* ge1149ov2483;
extern T0* ge1146ov2483;
extern T0* ge1148ov2483;
extern T0* ge1145ov2483;
extern T0* ge1141ov2483;
extern T0* ge1140ov2483;
extern T0* ge1152ov2483;
extern T0* ge1136ov2483;
extern T0* ge1147ov2483;
extern T0* ge1151ov2483;
extern T0* ge1143ov2483;
extern T0* ge1134ov2483;
extern T0* ge1144ov2483;
extern T0* ge1178ov2483;
extern T0* ge1175ov2483;
extern T0* ge1174ov2483;
extern T0* ge1184ov2483;
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
#include <string.h>
#include <stdlib.h>
