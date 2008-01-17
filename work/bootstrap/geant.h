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

/* GEANT */
typedef struct S21 T21;

/* GEANT_PROJECT */
typedef struct S22 T22;

/* GEANT_PROJECT_LOADER */
typedef struct S23 T23;

/* GEANT_PROJECT_OPTIONS */
typedef struct S24 T24;

/* GEANT_PROJECT_VARIABLES */
typedef struct S25 T25;

/* GEANT_TARGET */
typedef struct S26 T26;

/* KL_ARGUMENTS */
typedef struct S27 T27;

/* UT_ERROR_HANDLER */
typedef struct S28 T28;

/* GEANT_VARIABLES */
typedef struct S29 T29;

/* GEANT_PROJECT_ELEMENT */
typedef struct S30 T30;

/* DS_HASH_TABLE [GEANT_TARGET, STRING_8] */
typedef struct S31 T31;

/* SPECIAL [STRING_8] */
typedef struct S32 T32;

/* ARRAY [STRING_8] */
typedef struct S33 T33;

/* GEANT_ARGUMENT_VARIABLES */
typedef struct S34 T34;

/* AP_FLAG */
typedef struct S35 T35;

/* AP_ALTERNATIVE_OPTIONS_LIST */
typedef struct S36 T36;

/* AP_STRING_OPTION */
typedef struct S37 T37;

/* AP_PARSER */
typedef struct S38 T38;

/* AP_ERROR */
typedef struct S40 T40;

/* AP_ERROR_HANDLER */
typedef struct S45 T45;

/* KL_STANDARD_FILES */
typedef struct S46 T46;

/* KL_STDERR_FILE */
typedef struct S47 T47;

/* KL_EXCEPTIONS */
typedef struct S48 T48;

/* UT_VERSION_NUMBER */
typedef struct S49 T49;

/* KL_OPERATING_SYSTEM */
typedef struct S51 T51;

/* KL_WINDOWS_FILE_SYSTEM */
typedef struct S53 T53;

/* KL_UNIX_FILE_SYSTEM */
typedef struct S54 T54;

/* KL_TEXT_INPUT_FILE */
typedef struct S55 T55;

/* GEANT_PROJECT_PARSER */
typedef struct S56 T56;

/* GEANT_PROJECT_VARIABLE_RESOLVER */
typedef struct S58 T58;

/* UC_STRING_EQUALITY_TESTER */
typedef struct S59 T59;

/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8] */
typedef struct S61 T61;

/* SPECIAL [INTEGER_32] */
typedef struct S63 T63;

/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
typedef struct S64 T64;

/* KL_SPECIAL_ROUTINES [INTEGER_32] */
typedef struct S65 T65;

/* KL_SPECIAL_ROUTINES [STRING_8] */
typedef struct S66 T66;

/* KL_STDOUT_FILE */
typedef struct S68 T68;

/* DS_LINKED_LIST_CURSOR [AP_OPTION] */
typedef struct S69 T69;

/* DS_ARRAYED_LIST [STRING_8] */
typedef struct S71 T71;

/* DS_ARRAYED_LIST_CURSOR [STRING_8] */
typedef struct S72 T72;

/* AP_DISPLAY_HELP_FLAG */
typedef struct S73 T73;

/* DS_ARRAYED_LIST [AP_OPTION] */
typedef struct S74 T74;

/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S75 T75;

/* KL_STRING_ROUTINES */
typedef struct S76 T76;

/* TYPED_POINTER [ANY] */
typedef struct S77 T77;

/* DS_HASH_TABLE [STRING_8, STRING_8] */
typedef struct S80 T80;

/* EXECUTION_ENVIRONMENT */
typedef struct S82 T82;

/* KL_ANY_ROUTINES */
typedef struct S83 T83;

/* KL_PATHNAME */
typedef struct S85 T85;

/* UNIX_FILE_INFO */
typedef struct S86 T86;

/* KL_LINKABLE [CHARACTER_8] */
typedef struct S87 T87;

/* XM_EXPAT_PARSER_FACTORY */
typedef struct S89 T89;

/* XM_EIFFEL_PARSER */
typedef struct S91 T91;

/* XM_TREE_CALLBACKS_PIPE */
typedef struct S92 T92;

/* XM_CALLBACKS_TO_TREE_FILTER */
typedef struct S95 T95;

/* XM_DOCUMENT */
typedef struct S96 T96;

/* XM_ELEMENT */
typedef struct S97 T97;

/* XM_STOP_ON_ERROR_FILTER */
typedef struct S98 T98;

/* KL_EXECUTION_ENVIRONMENT */
typedef struct S100 T100;

/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES] */
typedef struct S101 T101;

/* DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8] */
typedef struct S102 T102;

/* TO_SPECIAL [INTEGER_32] */
typedef struct S103 T103;

/* TO_SPECIAL [STRING_8] */
typedef struct S104 T104;

/* DS_ARRAYED_LIST_CURSOR [AP_OPTION] */
typedef struct S105 T105;

/* SPECIAL [AP_OPTION] */
typedef struct S107 T107;

/* KL_SPECIAL_ROUTINES [AP_OPTION] */
typedef struct S108 T108;

/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S109 T109;

/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S110 T110;

/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S111 T111;

/* UC_STRING */
typedef struct S112 T112;

/* STRING_TO_INTEGER_CONVERTOR */
typedef struct S114 T114;

/* DS_LINKED_LIST [XM_ELEMENT] */
typedef struct S116 T116;

/* DS_LINKED_LIST_CURSOR [XM_ELEMENT] */
typedef struct S117 T117;

/* GEANT_INHERIT_ELEMENT */
typedef struct S118 T118;

/* GEANT_INHERIT */
typedef struct S119 T119;

/* SPECIAL [GEANT_TARGET] */
typedef struct S120 T120;

/* DS_SPARSE_TABLE_KEYS [GEANT_TARGET, STRING_8] */
typedef struct S122 T122;

/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8] */
typedef struct S124 T124;

/* KL_SPECIAL_ROUTINES [GEANT_TARGET] */
typedef struct S125 T125;

/* TYPED_POINTER [SPECIAL [CHARACTER_8]] */
typedef struct S126 T126;

/* XM_EIFFEL_SCANNER */
typedef struct S128 T128;

/* XM_DEFAULT_POSITION */
typedef struct S129 T129;

/* DS_BILINKED_LIST [XM_POSITION] */
typedef struct S131 T131;

/* DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
typedef struct S132 T132;

/* XM_CALLBACKS_NULL */
typedef struct S133 T133;

/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S134 T134;

/* XM_NULL_EXTERNAL_RESOLVER */
typedef struct S136 T136;

/* SPECIAL [ANY] */
typedef struct S137 T137;

/* KL_SPECIAL_ROUTINES [ANY] */
typedef struct S138 T138;

/* XM_EIFFEL_PARSER_NAME */
typedef struct S139 T139;

/* XM_EIFFEL_DECLARATION */
typedef struct S140 T140;

/* XM_DTD_EXTERNAL_ID */
typedef struct S141 T141;

/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
typedef struct S142 T142;

/* XM_DTD_ELEMENT_CONTENT */
typedef struct S143 T143;

/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S144 T144;

/* XM_DTD_ATTRIBUTE_CONTENT */
typedef struct S145 T145;

/* DS_BILINKED_LIST [STRING_8] */
typedef struct S146 T146;

/* SPECIAL [XM_EIFFEL_PARSER_NAME] */
typedef struct S147 T147;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
typedef struct S148 T148;

/* SPECIAL [XM_EIFFEL_DECLARATION] */
typedef struct S149 T149;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
typedef struct S150 T150;

/* SPECIAL [BOOLEAN] */
typedef struct S151 T151;

/* SPECIAL [XM_DTD_EXTERNAL_ID] */
typedef struct S152 T152;

/* KL_SPECIAL_ROUTINES [BOOLEAN] */
typedef struct S153 T153;

/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S154 T154;

/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S155 T155;

/* SPECIAL [XM_DTD_ELEMENT_CONTENT] */
typedef struct S156 T156;

/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
typedef struct S157 T157;

/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S159 T159;

/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S161 T161;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S162 T162;

/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S163 T163;

/* SPECIAL [DS_BILINKED_LIST [STRING_8]] */
typedef struct S164 T164;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
typedef struct S165 T165;

/* XM_EIFFEL_ENTITY_DEF */
typedef struct S166 T166;

/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
typedef struct S167 T167;

/* XM_DTD_CALLBACKS_NULL */
typedef struct S169 T169;

/* XM_EIFFEL_SCANNER_DTD */
typedef struct S170 T170;

/* XM_EIFFEL_PE_ENTITY_DEF */
typedef struct S172 T172;

/* XM_NAMESPACE_RESOLVER */
typedef struct S173 T173;

/* SPECIAL [XM_CALLBACKS_FILTER] */
typedef struct S174 T174;

/* ARRAY [XM_CALLBACKS_FILTER] */
typedef struct S175 T175;

/* XM_POSITION_TABLE */
typedef struct S176 T176;

/* SPECIAL [GEANT_ARGUMENT_VARIABLES] */
typedef struct S177 T177;

/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES] */
typedef struct S178 T178;

/* TO_SPECIAL [AP_OPTION] */
typedef struct S180 T180;

/* TO_SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S181 T181;

/* C_STRING */
typedef struct S182 T182;

/* GEANT_PARENT */
typedef struct S183 T183;

/* DS_ARRAYED_LIST [GEANT_PARENT] */
typedef struct S185 T185;

/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT] */
typedef struct S186 T186;

/* DS_ARRAYED_STACK [GEANT_TARGET] */
typedef struct S187 T187;

/* GEANT_ARGUMENT_ELEMENT */
typedef struct S188 T188;

/* XM_ATTRIBUTE */
typedef struct S190 T190;

/* DS_LINKED_LIST_CURSOR [XM_NODE] */
typedef struct S191 T191;

/* ARRAY [INTEGER_32] */
typedef struct S193 T193;

/* UC_UTF8_ROUTINES */
typedef struct S194 T194;

/* UC_UTF8_STRING */
typedef struct S195 T195;

/* XM_EIFFEL_INPUT_STREAM */
typedef struct S196 T196;

/* KL_INTEGER_ROUTINES */
typedef struct S197 T197;

/* KL_PLATFORM */
typedef struct S198 T198;

/* INTEGER_OVERFLOW_CHECKER */
typedef struct S199 T199;

/* DS_LINKABLE [XM_ELEMENT] */
typedef struct S200 T200;

/* GEANT_PARENT_ELEMENT */
typedef struct S201 T201;

/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_TARGET, STRING_8] */
typedef struct S203 T203;

/* TO_SPECIAL [GEANT_TARGET] */
typedef struct S204 T204;

/* XM_EIFFEL_CHARACTER_ENTITY */
typedef struct S205 T205;

/* YY_BUFFER */
typedef struct S206 T206;

/* YY_FILE_BUFFER */
typedef struct S207 T207;

/* DS_LINKED_STACK [INTEGER_32] */
typedef struct S210 T210;

/* DS_BILINKABLE [XM_POSITION] */
typedef struct S211 T211;

/* DS_BILINKED_LIST_CURSOR [XM_POSITION] */
typedef struct S212 T212;

/* DS_LINKABLE [XM_EIFFEL_SCANNER] */
typedef struct S213 T213;

/* SPECIAL [XM_EIFFEL_ENTITY_DEF] */
typedef struct S214 T214;

/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S215 T215;

/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S217 T217;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
typedef struct S219 T219;

/* TO_SPECIAL [ANY] */
typedef struct S220 T220;

/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
typedef struct S221 T221;

/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
typedef struct S222 T222;

/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
typedef struct S223 T223;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S224 T224;

/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S225 T225;

/* DS_LINKED_LIST [STRING_8] */
typedef struct S226 T226;

/* DS_BILINKED_LIST_CURSOR [STRING_8] */
typedef struct S227 T227;

/* DS_BILINKABLE [STRING_8] */
typedef struct S228 T228;

/* TO_SPECIAL [XM_EIFFEL_PARSER_NAME] */
typedef struct S229 T229;

/* TO_SPECIAL [XM_EIFFEL_DECLARATION] */
typedef struct S230 T230;

/* TO_SPECIAL [BOOLEAN] */
typedef struct S231 T231;

/* TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S232 T232;

/* TO_SPECIAL [XM_DTD_ELEMENT_CONTENT] */
typedef struct S233 T233;

/* TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S234 T234;

/* TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S235 T235;

/* TO_SPECIAL [DS_BILINKED_LIST [STRING_8]] */
typedef struct S236 T236;

/* TO_SPECIAL [XM_DTD_EXTERNAL_ID] */
typedef struct S237 T237;

/* XM_NAMESPACE_RESOLVER_CONTEXT */
typedef struct S238 T238;

/* DS_LINKED_QUEUE [STRING_8] */
typedef struct S240 T240;

/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S241 T241;

/* TO_SPECIAL [GEANT_ARGUMENT_VARIABLES] */
typedef struct S242 T242;

/* SPECIAL [NATURAL_8] */
typedef struct S243 T243;

/* GEANT_STRING_INTERPRETER */
typedef struct S244 T244;

/* GEANT_VARIABLES_VARIABLE_RESOLVER */
typedef struct S245 T245;

/* KL_ARRAY_ROUTINES [INTEGER_32] */
typedef struct S248 T248;

/* MANAGED_POINTER */
typedef struct S250 T250;

/* KL_SPECIAL_ROUTINES [GEANT_PARENT] */
typedef struct S251 T251;

/* SPECIAL [GEANT_PARENT] */
typedef struct S252 T252;

/* UC_UNICODE_ROUTINES */
typedef struct S253 T253;

/* DS_LINKED_QUEUE [CHARACTER_8] */
typedef struct S255 T255;

/* UC_UTF16_ROUTINES */
typedef struct S256 T256;

/* SPECIAL [NATURAL_64] */
typedef struct S257 T257;

/* GEANT_RENAME_ELEMENT */
typedef struct S258 T258;

/* GEANT_REDEFINE_ELEMENT */
typedef struct S259 T259;

/* GEANT_SELECT_ELEMENT */
typedef struct S260 T260;

/* GEANT_RENAME */
typedef struct S261 T261;

/* DS_HASH_TABLE [GEANT_RENAME, STRING_8] */
typedef struct S262 T262;

/* GEANT_REDEFINE */
typedef struct S263 T263;

/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8] */
typedef struct S264 T264;

/* GEANT_SELECT */
typedef struct S265 T265;

/* DS_HASH_TABLE [GEANT_SELECT, STRING_8] */
typedef struct S266 T266;

/* DS_LINKABLE [INTEGER_32] */
typedef struct S268 T268;

/* DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S269 T269;

/* TO_SPECIAL [XM_EIFFEL_ENTITY_DEF] */
typedef struct S270 T270;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
typedef struct S271 T271;

/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
typedef struct S272 T272;

/* DS_LINKED_LIST_CURSOR [STRING_8] */
typedef struct S273 T273;

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S275 T275;

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S276 T276;

/* DS_LINKABLE [STRING_8] */
typedef struct S277 T277;

/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S278 T278;

/* GEANT_GEC_TASK */
typedef struct S280 T280;

/* GEANT_SE_TASK */
typedef struct S281 T281;

/* GEANT_ISE_TASK */
typedef struct S282 T282;

/* GEANT_VE_TASK */
typedef struct S283 T283;

/* GEANT_EXEC_TASK */
typedef struct S284 T284;

/* GEANT_LCC_TASK */
typedef struct S285 T285;

/* GEANT_SET_TASK */
typedef struct S286 T286;

/* GEANT_UNSET_TASK */
typedef struct S287 T287;

/* GEANT_GEXACE_TASK */
typedef struct S288 T288;

/* GEANT_GELEX_TASK */
typedef struct S289 T289;

/* GEANT_GEYACC_TASK */
typedef struct S290 T290;

/* GEANT_GEPP_TASK */
typedef struct S291 T291;

/* GEANT_GETEST_TASK */
typedef struct S292 T292;

/* GEANT_GEANT_TASK */
typedef struct S293 T293;

/* GEANT_ECHO_TASK */
typedef struct S294 T294;

/* GEANT_MKDIR_TASK */
typedef struct S295 T295;

/* GEANT_DELETE_TASK */
typedef struct S296 T296;

/* GEANT_COPY_TASK */
typedef struct S297 T297;

/* GEANT_MOVE_TASK */
typedef struct S298 T298;

/* GEANT_SETENV_TASK */
typedef struct S299 T299;

/* GEANT_XSLT_TASK */
typedef struct S300 T300;

/* GEANT_OUTOFDATE_TASK */
typedef struct S301 T301;

/* GEANT_EXIT_TASK */
typedef struct S302 T302;

/* GEANT_PRECURSOR_TASK */
typedef struct S303 T303;

/* GEANT_AVAILABLE_TASK */
typedef struct S304 T304;

/* GEANT_INPUT_TASK */
typedef struct S305 T305;

/* GEANT_REPLACE_TASK */
typedef struct S306 T306;

/* AP_OPTION_COMPARATOR */
typedef struct S307 T307;

/* DS_QUICK_SORTER [AP_OPTION] */
typedef struct S308 T308;

/* ST_WORD_WRAPPER */
typedef struct S310 T310;

/* DS_HASH_SET [XM_NAMESPACE] */
typedef struct S312 T312;

/* XM_COMMENT */
typedef struct S313 T313;

/* XM_PROCESSING_INSTRUCTION */
typedef struct S314 T314;

/* XM_CHARACTER_DATA */
typedef struct S315 T315;

/* XM_NAMESPACE */
typedef struct S316 T316;

/* DS_LINKABLE [XM_NODE] */
typedef struct S319 T319;

/* XM_NODE_TYPER */
typedef struct S320 T320;

/* DS_PAIR [XM_POSITION, XM_NODE] */
typedef struct S325 T325;

/* KL_CHARACTER_BUFFER */
typedef struct S326 T326;

/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S327 T327;

/* TYPED_POINTER [NATURAL_8] */
typedef struct S328 T328;

/* EXCEPTIONS */
typedef struct S329 T329;

/* TO_SPECIAL [GEANT_PARENT] */
typedef struct S330 T330;

/* SPECIAL [ARRAY [INTEGER_32]] */
typedef struct S331 T331;

/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
typedef struct S332 T332;

/* DS_LINKABLE [CHARACTER_8] */
typedef struct S333 T333;

/* KL_EQUALITY_TESTER [GEANT_RENAME] */
typedef struct S334 T334;

/* DS_SPARSE_TABLE_KEYS [GEANT_RENAME, STRING_8] */
typedef struct S335 T335;

/* SPECIAL [GEANT_RENAME] */
typedef struct S337 T337;

/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8] */
typedef struct S338 T338;

/* KL_SPECIAL_ROUTINES [GEANT_RENAME] */
typedef struct S339 T339;

/* KL_EQUALITY_TESTER [GEANT_REDEFINE] */
typedef struct S340 T340;

/* DS_SPARSE_TABLE_KEYS [GEANT_REDEFINE, STRING_8] */
typedef struct S341 T341;

/* SPECIAL [GEANT_REDEFINE] */
typedef struct S343 T343;

/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8] */
typedef struct S344 T344;

/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE] */
typedef struct S345 T345;

/* KL_EQUALITY_TESTER [GEANT_SELECT] */
typedef struct S346 T346;

/* DS_SPARSE_TABLE_KEYS [GEANT_SELECT, STRING_8] */
typedef struct S347 T347;

/* SPECIAL [GEANT_SELECT] */
typedef struct S349 T349;

/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8] */
typedef struct S350 T350;

/* KL_SPECIAL_ROUTINES [GEANT_SELECT] */
typedef struct S351 T351;

/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S353 T353;

/* KL_DIRECTORY */
typedef struct S354 T354;

/* KL_STRING_INPUT_STREAM */
typedef struct S355 T355;

/* GEANT_GEC_COMMAND */
typedef struct S356 T356;

/* GEANT_SE_COMMAND */
typedef struct S357 T357;

/* GEANT_ISE_COMMAND */
typedef struct S358 T358;

/* GEANT_VE_COMMAND */
typedef struct S359 T359;

/* GEANT_EXEC_COMMAND */
typedef struct S360 T360;

/* GEANT_FILESET_ELEMENT */
typedef struct S361 T361;

/* GEANT_FILESET */
typedef struct S362 T362;

/* GEANT_LCC_COMMAND */
typedef struct S363 T363;

/* GEANT_SET_COMMAND */
typedef struct S364 T364;

/* GEANT_UNSET_COMMAND */
typedef struct S365 T365;

/* GEANT_GEXACE_COMMAND */
typedef struct S366 T366;

/* GEANT_DEFINE_ELEMENT */
typedef struct S367 T367;

/* GEANT_GELEX_COMMAND */
typedef struct S368 T368;

/* GEANT_GEYACC_COMMAND */
typedef struct S369 T369;

/* GEANT_GEPP_COMMAND */
typedef struct S370 T370;

/* GEANT_GETEST_COMMAND */
typedef struct S371 T371;

/* GEANT_GEANT_COMMAND */
typedef struct S372 T372;

/* ST_SPLITTER */
typedef struct S373 T373;

/* GEANT_ECHO_COMMAND */
typedef struct S374 T374;

/* GEANT_MKDIR_COMMAND */
typedef struct S375 T375;

/* GEANT_DELETE_COMMAND */
typedef struct S376 T376;

/* GEANT_DIRECTORYSET_ELEMENT */
typedef struct S377 T377;

/* GEANT_DIRECTORYSET */
typedef struct S378 T378;

/* GEANT_COPY_COMMAND */
typedef struct S379 T379;

/* GEANT_MOVE_COMMAND */
typedef struct S380 T380;

/* GEANT_SETENV_COMMAND */
typedef struct S381 T381;

/* GEANT_XSLT_COMMAND */
typedef struct S382 T382;

/* DS_PAIR [STRING_8, STRING_8] */
typedef struct S383 T383;

/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S384 T384;

/* GEANT_OUTOFDATE_COMMAND */
typedef struct S385 T385;

/* GEANT_EXIT_COMMAND */
typedef struct S386 T386;

/* GEANT_PRECURSOR_COMMAND */
typedef struct S387 T387;

/* GEANT_AVAILABLE_COMMAND */
typedef struct S388 T388;

/* GEANT_INPUT_COMMAND */
typedef struct S389 T389;

/* GEANT_REPLACE_COMMAND */
typedef struct S390 T390;

/* SPECIAL [XM_NAMESPACE] */
typedef struct S391 T391;

/* KL_EQUALITY_TESTER [XM_NAMESPACE] */
typedef struct S392 T392;

/* DS_HASH_SET_CURSOR [XM_NAMESPACE] */
typedef struct S393 T393;

/* KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
typedef struct S394 T394;

/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_RENAME, STRING_8] */
typedef struct S395 T395;

/* TO_SPECIAL [GEANT_RENAME] */
typedef struct S396 T396;

/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_REDEFINE, STRING_8] */
typedef struct S397 T397;

/* TO_SPECIAL [GEANT_REDEFINE] */
typedef struct S398 T398;

/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_SELECT, STRING_8] */
typedef struct S399 T399;

/* TO_SPECIAL [GEANT_SELECT] */
typedef struct S400 T400;

/* DP_SHELL_COMMAND */
typedef struct S405 T405;

/* GEANT_MAP_ELEMENT */
typedef struct S406 T406;

/* GEANT_MAP */
typedef struct S407 T407;

/* DS_HASH_SET [GEANT_FILESET_ENTRY] */
typedef struct S410 T410;

/* DS_HASH_SET [STRING_8] */
typedef struct S412 T412;

/* DS_HASH_SET_CURSOR [STRING_8] */
typedef struct S414 T414;

/* LX_DFA_WILDCARD */
typedef struct S415 T415;

/* GEANT_FILESET_ENTRY */
typedef struct S416 T416;

/* KL_BOOLEAN_ROUTINES */
typedef struct S417 T417;

/* ARRAY [BOOLEAN] */
typedef struct S418 T418;

/* DS_HASH_SET [INTEGER_32] */
typedef struct S420 T420;

/* KL_TEXT_OUTPUT_FILE */
typedef struct S421 T421;

/* SPECIAL [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S422 T422;

/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S423 T423;

/* DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S424 T424;

/* RX_PCRE_REGULAR_EXPRESSION */
typedef struct S425 T425;

/* KL_STRING_EQUALITY_TESTER */
typedef struct S426 T426;

/* KL_STDIN_FILE */
typedef struct S427 T427;

/* TO_SPECIAL [XM_NAMESPACE] */
typedef struct S428 T428;

/* PLATFORM */
typedef struct S432 T432;

/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY] */
typedef struct S434 T434;

/* SPECIAL [GEANT_FILESET_ENTRY] */
typedef struct S435 T435;

/* KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY] */
typedef struct S436 T436;

/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY] */
typedef struct S437 T437;

/* LX_WILDCARD_PARSER */
typedef struct S438 T438;

/* LX_DESCRIPTION */
typedef struct S439 T439;

/* LX_FULL_DFA */
typedef struct S440 T440;

/* DS_HASH_SET_CURSOR [INTEGER_32] */
typedef struct S442 T442;

/* KL_EQUALITY_TESTER [INTEGER_32] */
typedef struct S443 T443;

/* TO_SPECIAL [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S444 T444;

/* RX_BYTE_CODE */
typedef struct S446 T446;

/* RX_CASE_MAPPING */
typedef struct S447 T447;

/* RX_CHARACTER_SET */
typedef struct S448 T448;

/* SPECIAL [RX_CHARACTER_SET] */
typedef struct S450 T450;

/* ARRAY [RX_CHARACTER_SET] */
typedef struct S451 T451;

/* KL_NULL_TEXT_OUTPUT_STREAM */
typedef struct S452 T452;

/* KL_BINARY_INPUT_FILE */
typedef struct S453 T453;

/* KL_BINARY_OUTPUT_FILE */
typedef struct S454 T454;

/* GE_HASH_TABLE [C_STRING, STRING_8] */
typedef struct S455 T455;

/* FILE_NAME */
typedef struct S457 T457;

/* RAW_FILE */
typedef struct S458 T458;

/* DIRECTORY */
typedef struct S459 T459;

/* ARRAYED_LIST [STRING_8] */
typedef struct S460 T460;

/* TO_SPECIAL [GEANT_FILESET_ENTRY] */
typedef struct S463 T463;

/* DS_ARRAYED_LIST [LX_RULE] */
typedef struct S464 T464;

/* LX_START_CONDITIONS */
typedef struct S465 T465;

/* LX_ACTION_FACTORY */
typedef struct S466 T466;

/* DS_ARRAYED_STACK [INTEGER_32] */
typedef struct S467 T467;

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8] */
typedef struct S468 T468;

/* LX_SYMBOL_CLASS */
typedef struct S469 T469;

/* SPECIAL [LX_SYMBOL_CLASS] */
typedef struct S470 T470;

/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS] */
typedef struct S471 T471;

/* LX_NFA */
typedef struct S472 T472;

/* LX_EQUIVALENCE_CLASSES */
typedef struct S473 T473;

/* LX_RULE */
typedef struct S474 T474;

/* SPECIAL [LX_NFA] */
typedef struct S475 T475;

/* KL_SPECIAL_ROUTINES [LX_NFA] */
typedef struct S476 T476;

/* UT_SYNTAX_ERROR */
typedef struct S477 T477;

/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
typedef struct S478 T478;

/* LX_UNRECOGNIZED_RULE_ERROR */
typedef struct S479 T479;

/* LX_MISSING_QUOTE_ERROR */
typedef struct S480 T480;

/* LX_BAD_CHARACTER_CLASS_ERROR */
typedef struct S481 T481;

/* LX_BAD_CHARACTER_ERROR */
typedef struct S482 T482;

/* LX_FULL_AND_META_ERROR */
typedef struct S483 T483;

/* LX_FULL_AND_REJECT_ERROR */
typedef struct S484 T484;

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR */
typedef struct S485 T485;

/* LX_CHARACTER_OUT_OF_RANGE_ERROR */
typedef struct S486 T486;

/* SPECIAL [LX_RULE] */
typedef struct S487 T487;

/* ARRAY [LX_RULE] */
typedef struct S488 T488;

/* LX_DFA_STATE */
typedef struct S489 T489;

/* DS_ARRAYED_LIST [LX_NFA_STATE] */
typedef struct S490 T490;

/* DS_ARRAYED_LIST [LX_DFA_STATE] */
typedef struct S491 T491;

/* LX_SYMBOL_PARTITIONS */
typedef struct S492 T492;

/* LX_START_CONDITION */
typedef struct S493 T493;

/* LX_TRANSITION_TABLE [LX_DFA_STATE] */
typedef struct S494 T494;

/* DS_ARRAYED_LIST [LX_NFA] */
typedef struct S495 T495;

/* DS_HASH_TABLE [LX_NFA, INTEGER_32] */
typedef struct S496 T496;

/* LX_NFA_STATE */
typedef struct S497 T497;

/* STRING_SEARCHER */
typedef struct S498 T498;

/* GE_STRING_EQUALITY_TESTER */
typedef struct S499 T499;

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR */
typedef struct S501 T501;

/* PRIMES */
typedef struct S503 T503;

/* SPECIAL [C_STRING] */
typedef struct S504 T504;

/* TYPED_POINTER [FILE_NAME] */
typedef struct S505 T505;

/* KL_SPECIAL_ROUTINES [LX_RULE] */
typedef struct S506 T506;

/* DS_ARRAYED_LIST_CURSOR [LX_RULE] */
typedef struct S507 T507;

/* SPECIAL [LX_START_CONDITION] */
typedef struct S508 T508;

/* KL_SPECIAL_ROUTINES [LX_START_CONDITION] */
typedef struct S509 T509;

/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION] */
typedef struct S510 T510;

/* DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING_8] */
typedef struct S512 T512;

/* DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
typedef struct S514 T514;

/* TO_SPECIAL [LX_SYMBOL_CLASS] */
typedef struct S515 T515;

/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE] */
typedef struct S516 T516;

/* LX_EPSILON_TRANSITION [LX_NFA_STATE] */
typedef struct S518 T518;

/* LX_SYMBOL_TRANSITION [LX_NFA_STATE] */
typedef struct S520 T520;

/* DS_BILINKABLE [INTEGER_32] */
typedef struct S521 T521;

/* SPECIAL [DS_BILINKABLE [INTEGER_32]] */
typedef struct S522 T522;

/* ARRAY [DS_BILINKABLE [INTEGER_32]] */
typedef struct S523 T523;

/* LX_ACTION */
typedef struct S525 T525;

/* TO_SPECIAL [LX_NFA] */
typedef struct S526 T526;

/* DS_BUBBLE_SORTER [LX_NFA_STATE] */
typedef struct S527 T527;

/* DS_BUBBLE_SORTER [LX_RULE] */
typedef struct S529 T529;

/* SPECIAL [LX_NFA_STATE] */
typedef struct S531 T531;

/* KL_SPECIAL_ROUTINES [LX_NFA_STATE] */
typedef struct S533 T533;

/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE] */
typedef struct S534 T534;

/* SPECIAL [LX_DFA_STATE] */
typedef struct S536 T536;

/* KL_SPECIAL_ROUTINES [LX_DFA_STATE] */
typedef struct S537 T537;

/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE] */
typedef struct S538 T538;

/* ARRAY [LX_DFA_STATE] */
typedef struct S539 T539;

/* KL_ARRAY_ROUTINES [LX_DFA_STATE] */
typedef struct S540 T540;

/* DS_ARRAYED_LIST_CURSOR [LX_NFA] */
typedef struct S541 T541;

/* DS_SPARSE_TABLE_KEYS [LX_NFA, INTEGER_32] */
typedef struct S543 T543;

/* DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32] */
typedef struct S545 T545;

/* KL_COMPARABLE_COMPARATOR [LX_RULE] */
typedef struct S548 T548;

/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE] */
typedef struct S551 T551;

/* TO_SPECIAL [LX_RULE] */
typedef struct S554 T554;

/* TO_SPECIAL [LX_START_CONDITION] */
typedef struct S555 T555;

/* DS_SPARSE_TABLE_KEYS_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
typedef struct S556 T556;

/* TO_SPECIAL [LX_NFA_STATE] */
typedef struct S557 T557;

/* TO_SPECIAL [LX_DFA_STATE] */
typedef struct S558 T558;

/* DS_SPARSE_TABLE_KEYS_CURSOR [LX_NFA, INTEGER_32] */
typedef struct S559 T559;

/* DS_SHELL_SORTER [INTEGER_32] */
typedef struct S560 T560;

/* KL_COMPARABLE_COMPARATOR [INTEGER_32] */
typedef struct S564 T564;

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
struct S77 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type TYPED_POINTER [SPECIAL [CHARACTER_8]] */
struct S126 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type TYPED_POINTER [NATURAL_8] */
struct S328 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type TYPED_POINTER [FILE_NAME] */
struct S505 {
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

/* Struct for type GEANT */
struct S21 {
	int id;
	T0* a1; /* error_handler */
	T1 a2; /* verbose */
	T1 a3; /* debug_mode */
	T1 a4; /* no_exec */
	T0* a5; /* build_filename */
	T0* a6; /* start_target_name */
	T1 a7; /* show_target_info */
};

/* Struct for type GEANT_PROJECT */
struct S22 {
	int id;
	T0* a1; /* targets */
	T0* a2; /* name */
	T1 a3; /* build_successful */
	T0* a4; /* start_target_name */
	T0* a5; /* default_target_name */
	T0* a6; /* output_file */
	T0* a7; /* variables */
	T0* a8; /* selected_targets */
	T0* a9; /* options */
	T0* a10; /* inherit_clause */
	T0* a11; /* description */
	T1 a12; /* old_inherit */
	T0* a13; /* current_target */
};

/* Struct for type GEANT_PROJECT_LOADER */
struct S23 {
	int id;
	T0* a1; /* project_element */
	T0* a2; /* build_filename */
};

/* Struct for type GEANT_PROJECT_OPTIONS */
struct S24 {
	int id;
	T1 a1; /* verbose */
	T1 a2; /* debug_mode */
	T1 a3; /* no_exec */
};

/* Struct for type GEANT_PROJECT_VARIABLES */
struct S25 {
	int id;
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
	T0* a13; /* item_storage */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* key_storage */
	T0* a17; /* internal_cursor */
	T0* a18; /* special_item_routines */
	T0* a19; /* special_key_routines */
	T0* a20; /* hash_function */
};

/* Struct for type GEANT_TARGET */
struct S26 {
	int id;
	T0* a1; /* name */
	T0* a2; /* xml_element */
	T0* a3; /* formal_arguments */
	T0* a4; /* project */
	T0* a5; /* obsolete_message */
	T0* a6; /* description */
	T0* a7; /* exports */
	T1 a8; /* execute_once */
	T1 a9; /* is_executed */
	T0* a10; /* precursor_target */
	T0* a11; /* redefining_target */
};

/* Struct for type KL_ARGUMENTS */
struct S27 {
	int id;
	T0* a1; /* program_name */
};

/* Struct for type UT_ERROR_HANDLER */
struct S28 {
	int id;
	T0* a1; /* error_file */
	T0* a2; /* warning_file */
	T0* a3; /* info_file */
};

/* Struct for type GEANT_VARIABLES */
struct S29 {
	int id;
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
	T0* a12; /* item_storage */
	T0* a13; /* clashes */
	T0* a14; /* slots */
	T0* a15; /* key_storage */
	T0* a16; /* equality_tester */
	T0* a17; /* special_item_routines */
	T0* a18; /* special_key_routines */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type GEANT_PROJECT_ELEMENT */
struct S30 {
	int id;
	T0* a1; /* project */
	T0* a2; /* xml_element */
};

/* Struct for type DS_HASH_TABLE [GEANT_TARGET, STRING_8] */
struct S31 {
	int id;
	T6 a1; /* position */
	T0* a2; /* item_storage */
	T0* a3; /* key_equality_tester */
	T0* a4; /* internal_keys */
	T6 a5; /* last_position */
	T6 a6; /* capacity */
	T6 a7; /* slots_position */
	T6 a8; /* count */
	T6 a9; /* modulus */
	T6 a10; /* clashes_previous_position */
	T0* a11; /* equality_tester */
	T6 a12; /* found_position */
	T0* a13; /* clashes */
	T0* a14; /* slots */
	T0* a15; /* key_storage */
	T6 a16; /* free_slot */
	T0* a17; /* internal_cursor */
	T0* a18; /* special_item_routines */
	T0* a19; /* special_key_routines */
	T0* a20; /* hash_function */
};

/* Struct for type SPECIAL [STRING_8] */
struct S32 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [STRING_8] */
struct S33 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type GEANT_ARGUMENT_VARIABLES */
struct S34 {
	int id;
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
	T0* a12; /* item_storage */
	T0* a13; /* clashes */
	T0* a14; /* slots */
	T0* a15; /* key_storage */
	T0* a16; /* equality_tester */
	T0* a17; /* special_item_routines */
	T0* a18; /* special_key_routines */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type AP_FLAG */
struct S35 {
	int id;
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
struct S36 {
	int id;
	T0* a1; /* introduction_option */
	T0* a2; /* parameters_description */
	T0* a3; /* internal_cursor */
	T0* a4; /* first_cell */
};

/* Struct for type AP_STRING_OPTION */
struct S37 {
	int id;
	T0* a1; /* parameters */
	T0* a2; /* description */
	T0* a3; /* parameter_description */
	T1 a4; /* needs_parameter */
	T2 a5; /* short_form */
	T1 a6; /* has_short_form */
	T0* a7; /* long_form */
	T1 a8; /* is_mandatory */
	T6 a9; /* maximum_occurrences */
	T1 a10; /* is_hidden */
};

/* Struct for type AP_PARSER */
struct S38 {
	int id;
	T0* a1; /* options */
	T0* a2; /* alternative_options_lists */
	T0* a3; /* error_handler */
	T0* a4; /* parameters */
	T0* a5; /* help_option */
	T0* a6; /* application_description */
	T0* a7; /* parameters_description */
	T0* a8; /* argument_list */
	T0* a9; /* current_options */
	T1 a10; /* is_first_option */
	T0* a11; /* last_option_parameter */
};

/* Struct for type AP_ERROR */
struct S40 {
	int id;
	T0* a1; /* parameters */
	T0* a2; /* default_template */
	T0* a3; /* code */
};

/* Struct for type AP_ERROR_HANDLER */
struct S45 {
	int id;
	T1 a1; /* has_error */
	T0* a2; /* error_file */
	T0* a3; /* warning_file */
	T0* a4; /* info_file */
};

/* Struct for type KL_STANDARD_FILES */
struct S46 {
	int id;
};

/* Struct for type KL_STDERR_FILE */
struct S47 {
	int id;
	T14 a1; /* file_pointer */
	T0* a2; /* name */
	T6 a3; /* mode */
};

/* Struct for type KL_EXCEPTIONS */
struct S48 {
	int id;
};

/* Struct for type UT_VERSION_NUMBER */
struct S49 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type KL_OPERATING_SYSTEM */
struct S51 {
	int id;
};

/* Struct for type KL_WINDOWS_FILE_SYSTEM */
struct S53 {
	int id;
	T2 a1; /* secondary_directory_separator */
};

/* Struct for type KL_UNIX_FILE_SYSTEM */
struct S54 {
	int id;
};

/* Struct for type KL_TEXT_INPUT_FILE */
struct S55 {
	int id;
	T0* a1; /* string_name */
	T6 a2; /* mode */
	T0* a3; /* name */
	T0* a4; /* character_buffer */
	T1 a5; /* end_of_file */
	T14 a6; /* file_pointer */
	T1 a7; /* descriptor_available */
	T2 a8; /* last_character */
	T0* a9; /* last_string */
};

/* Struct for type GEANT_PROJECT_PARSER */
struct S56 {
	int id;
	T0* a1; /* last_project_element */
	T0* a2; /* variables */
	T0* a3; /* options */
	T0* a4; /* build_filename */
	T0* a5; /* xml_parser */
	T0* a6; /* tree_pipe */
};

/* Struct for type GEANT_PROJECT_VARIABLE_RESOLVER */
struct S58 {
	int id;
	T0* a1; /* variables */
};

/* Struct for type UC_STRING_EQUALITY_TESTER */
struct S59 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8] */
struct S61 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type SPECIAL [INTEGER_32] */
struct S63 {
	int id;
	T6 z1; /* count */
	T6 z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
struct S64 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [INTEGER_32] */
struct S65 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [STRING_8] */
struct S66 {
	int id;
};

/* Struct for type KL_STDOUT_FILE */
struct S68 {
	int id;
	T14 a1; /* file_pointer */
	T0* a2; /* name */
	T6 a3; /* mode */
};

/* Struct for type DS_LINKED_LIST_CURSOR [AP_OPTION] */
struct S69 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_ARRAYED_LIST [STRING_8] */
struct S71 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* internal_cursor */
	T0* a4; /* special_routines */
	T6 a5; /* capacity */
	T0* a6; /* equality_tester */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [STRING_8] */
struct S72 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type AP_DISPLAY_HELP_FLAG */
struct S73 {
	int id;
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
struct S74 {
	int id;
	T0* a1; /* internal_cursor */
	T6 a2; /* count */
	T0* a3; /* equality_tester */
	T0* a4; /* storage */
	T0* a5; /* special_routines */
	T6 a6; /* capacity */
};

/* Struct for type DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S75 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T6 a5; /* count */
};

/* Struct for type KL_STRING_ROUTINES */
struct S76 {
	int id;
};

/* Struct for type DS_HASH_TABLE [STRING_8, STRING_8] */
struct S80 {
	int id;
	T0* a1; /* key_equality_tester */
	T0* a2; /* internal_keys */
	T0* a3; /* equality_tester */
	T6 a4; /* capacity */
	T6 a5; /* modulus */
	T6 a6; /* last_position */
	T6 a7; /* free_slot */
	T6 a8; /* position */
	T0* a9; /* internal_cursor */
	T0* a10; /* special_item_routines */
	T0* a11; /* item_storage */
	T0* a12; /* special_key_routines */
	T0* a13; /* key_storage */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T6 a16; /* found_position */
	T6 a17; /* count */
	T6 a18; /* slots_position */
	T6 a19; /* clashes_previous_position */
	T0* a20; /* hash_function */
};

/* Struct for type EXECUTION_ENVIRONMENT */
struct S82 {
	int id;
	T6 a1; /* return_code */
};

/* Struct for type KL_ANY_ROUTINES */
struct S83 {
	int id;
};

/* Struct for type KL_PATHNAME */
struct S85 {
	int id;
	T6 a1; /* count */
	T0* a2; /* drive */
	T0* a3; /* hostname */
	T0* a4; /* sharename */
	T1 a5; /* is_relative */
	T0* a6; /* components */
};

/* Struct for type UNIX_FILE_INFO */
struct S86 {
	int id;
	T0* a1; /* buffered_file_info */
	T0* a2; /* file_name */
};

/* Struct for type KL_LINKABLE [CHARACTER_8] */
struct S87 {
	int id;
	T2 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type XM_EXPAT_PARSER_FACTORY */
struct S89 {
	int id;
};

/* Struct for type XM_EIFFEL_PARSER */
struct S91 {
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

/* Struct for type XM_TREE_CALLBACKS_PIPE */
struct S92 {
	int id;
	T0* a1; /* start */
	T0* a2; /* tree */
	T0* a3; /* error */
	T0* a4; /* last */
};

/* Struct for type XM_CALLBACKS_TO_TREE_FILTER */
struct S95 {
	int id;
	T0* a1; /* document */
	T0* a2; /* next */
	T0* a3; /* source_parser */
	T0* a4; /* last_position_table */
	T0* a5; /* current_element */
	T0* a6; /* namespace_cache */
};

/* Struct for type XM_DOCUMENT */
struct S96 {
	int id;
	T0* a1; /* root_element */
	T0* a2; /* internal_cursor */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
	T6 a5; /* count */
	T0* a6; /* parent */
};

/* Struct for type XM_ELEMENT */
struct S97 {
	int id;
	T0* a1; /* parent */
	T0* a2; /* namespace */
	T0* a3; /* name */
	T0* a4; /* internal_cursor */
	T0* a5; /* first_cell */
	T0* a6; /* last_cell */
	T6 a7; /* count */
};

/* Struct for type XM_STOP_ON_ERROR_FILTER */
struct S98 {
	int id;
	T1 a1; /* has_error */
	T0* a2; /* last_error */
	T0* a3; /* next */
};

/* Struct for type KL_EXECUTION_ENVIRONMENT */
struct S100 {
	int id;
	T6 a1; /* return_code */
};

/* Struct for type DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES] */
struct S101 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8] */
struct S102 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [INTEGER_32] */
struct S103 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [STRING_8] */
struct S104 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [AP_OPTION] */
struct S105 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [AP_OPTION] */
struct S107 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [AP_OPTION] */
struct S108 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S109 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S110 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S111 {
	int id;
};

/* Struct for type UC_STRING */
struct S112 {
	int id;
	T6 a1; /* count */
	T6 a2; /* byte_count */
	T6 a3; /* internal_hash_code */
	T6 a4; /* last_byte_index_input */
	T6 a5; /* last_byte_index_result */
	T0* a6; /* area */
};

/* Struct for type STRING_TO_INTEGER_CONVERTOR */
struct S114 {
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

/* Struct for type DS_LINKED_LIST [XM_ELEMENT] */
struct S116 {
	int id;
	T6 a1; /* count */
	T0* a2; /* internal_cursor */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
};

/* Struct for type DS_LINKED_LIST_CURSOR [XM_ELEMENT] */
struct S117 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type GEANT_INHERIT_ELEMENT */
struct S118 {
	int id;
	T0* a1; /* geant_inherit */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_INHERIT */
struct S119 {
	int id;
	T0* a1; /* parents */
	T0* a2; /* project */
};

/* Struct for type SPECIAL [GEANT_TARGET] */
struct S120 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [GEANT_TARGET, STRING_8] */
struct S122 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8] */
struct S124 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_TARGET] */
struct S125 {
	int id;
};

/* Struct for type XM_EIFFEL_SCANNER */
struct S128 {
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
struct S129 {
	int id;
	T0* a1; /* source_name */
	T6 a2; /* row */
	T6 a3; /* column */
	T6 a4; /* byte_index */
};

/* Struct for type DS_BILINKED_LIST [XM_POSITION] */
struct S131 {
	int id;
	T0* a1; /* first_cell */
	T0* a2; /* internal_cursor */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
struct S132 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
};

/* Struct for type XM_CALLBACKS_NULL */
struct S133 {
	int id;
};

/* Struct for type DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S134 {
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
struct S136 {
	int id;
};

/* Struct for type SPECIAL [ANY] */
struct S137 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ANY] */
struct S138 {
	int id;
};

/* Struct for type XM_EIFFEL_PARSER_NAME */
struct S139 {
	int id;
	T1 a1; /* use_namespaces */
	T6 a2; /* count */
	T0* a3; /* first */
	T0* a4; /* second */
	T0* a5; /* tail */
};

/* Struct for type XM_EIFFEL_DECLARATION */
struct S140 {
	int id;
	T0* a1; /* version */
	T0* a2; /* encoding */
	T1 a3; /* stand_alone */
};

/* Struct for type XM_DTD_EXTERNAL_ID */
struct S141 {
	int id;
	T0* a1; /* system_id */
	T0* a2; /* public_id */
};

/* Struct for type DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
struct S142 {
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
struct S143 {
	int id;
	T0* a1; /* items */
	T2 a2; /* repetition */
	T0* a3; /* name */
	T2 a4; /* type */
	T1 a5; /* is_character_data_allowed */
};

/* Struct for type DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
struct S144 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type XM_DTD_ATTRIBUTE_CONTENT */
struct S145 {
	int id;
	T0* a1; /* name */
	T2 a2; /* type */
	T1 a3; /* is_list_type */
	T0* a4; /* enumeration_list */
	T2 a5; /* value */
	T0* a6; /* default_value */
};

/* Struct for type DS_BILINKED_LIST [STRING_8] */
struct S146 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
	T0* a5; /* equality_tester */
};

/* Struct for type SPECIAL [XM_EIFFEL_PARSER_NAME] */
struct S147 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
struct S148 {
	int id;
};

/* Struct for type SPECIAL [XM_EIFFEL_DECLARATION] */
struct S149 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
struct S150 {
	int id;
};

/* Struct for type SPECIAL [BOOLEAN] */
struct S151 {
	int id;
	T6 z1; /* count */
	T1 z2[1]; /* item */
};

/* Struct for type SPECIAL [XM_DTD_EXTERNAL_ID] */
struct S152 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [BOOLEAN] */
struct S153 {
	int id;
};

/* Struct for type SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S154 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S155 {
	int id;
};

/* Struct for type SPECIAL [XM_DTD_ELEMENT_CONTENT] */
struct S156 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
struct S157 {
	int id;
};

/* Struct for type SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S159 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
struct S161 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S162 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
struct S163 {
	int id;
};

/* Struct for type SPECIAL [DS_BILINKED_LIST [STRING_8]] */
struct S164 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
struct S165 {
	int id;
};

/* Struct for type XM_EIFFEL_ENTITY_DEF */
struct S166 {
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
struct S167 {
	int id;
};

/* Struct for type XM_DTD_CALLBACKS_NULL */
struct S169 {
	int id;
};

/* Struct for type XM_EIFFEL_SCANNER_DTD */
struct S170 {
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
struct S172 {
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

/* Struct for type XM_NAMESPACE_RESOLVER */
struct S173 {
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
struct S174 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [XM_CALLBACKS_FILTER] */
struct S175 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type XM_POSITION_TABLE */
struct S176 {
	int id;
	T0* a1; /* table */
};

/* Struct for type SPECIAL [GEANT_ARGUMENT_VARIABLES] */
struct S177 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES] */
struct S178 {
	int id;
};

/* Struct for type TO_SPECIAL [AP_OPTION] */
struct S180 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S181 {
	int id;
	T0* a1; /* area */
};

/* Struct for type C_STRING */
struct S182 {
	int id;
	T6 a1; /* count */
	T0* a2; /* managed_data */
};

/* Struct for type GEANT_PARENT */
struct S183 {
	int id;
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
struct S185 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T6 a5; /* count */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [GEANT_PARENT] */
struct S186 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type DS_ARRAYED_STACK [GEANT_TARGET] */
struct S187 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type GEANT_ARGUMENT_ELEMENT */
struct S188 {
	int id;
	T0* a1; /* xml_element */
};

/* Struct for type XM_ATTRIBUTE */
struct S190 {
	int id;
	T0* a1; /* name */
	T0* a2; /* namespace */
	T0* a3; /* value */
	T0* a4; /* parent */
};

/* Struct for type DS_LINKED_LIST_CURSOR [XM_NODE] */
struct S191 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type ARRAY [INTEGER_32] */
struct S193 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type UC_UTF8_ROUTINES */
struct S194 {
	int id;
};

/* Struct for type UC_UTF8_STRING */
struct S195 {
	int id;
	T6 a1; /* count */
	T0* a2; /* area */
	T6 a3; /* byte_count */
	T6 a4; /* internal_hash_code */
	T6 a5; /* last_byte_index_input */
	T6 a6; /* last_byte_index_result */
};

/* Struct for type XM_EIFFEL_INPUT_STREAM */
struct S196 {
	int id;
	T0* a1; /* last_string */
	T6 a2; /* encoding */
	T0* a3; /* impl */
	T0* a4; /* utf_queue */
};

/* Struct for type KL_INTEGER_ROUTINES */
struct S197 {
	int id;
};

/* Struct for type KL_PLATFORM */
struct S198 {
	int id;
};

/* Struct for type INTEGER_OVERFLOW_CHECKER */
struct S199 {
	int id;
	T0* a1; /* integer_overflow_state1 */
	T0* a2; /* integer_overflow_state2 */
	T0* a3; /* natural_overflow_state1 */
	T0* a4; /* natural_overflow_state2 */
};

/* Struct for type DS_LINKABLE [XM_ELEMENT] */
struct S200 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type GEANT_PARENT_ELEMENT */
struct S201 {
	int id;
	T0* a1; /* parent */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_TARGET, STRING_8] */
struct S203 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [GEANT_TARGET] */
struct S204 {
	int id;
	T0* a1; /* area */
};

/* Struct for type XM_EIFFEL_CHARACTER_ENTITY */
struct S205 {
	int id;
	T6 a1; /* code */
};

/* Struct for type YY_BUFFER */
struct S206 {
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
struct S207 {
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
struct S210 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
};

/* Struct for type DS_BILINKABLE [XM_POSITION] */
struct S211 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_POSITION] */
struct S212 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type DS_LINKABLE [XM_EIFFEL_SCANNER] */
struct S213 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type SPECIAL [XM_EIFFEL_ENTITY_DEF] */
struct S214 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S215 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S217 {
	int id;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T6 a3; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
struct S219 {
	int id;
};

/* Struct for type TO_SPECIAL [ANY] */
struct S220 {
	int id;
	T0* a1; /* area */
};

/* Struct for type KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
struct S221 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
struct S222 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
struct S223 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
struct S224 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
struct S225 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_LINKED_LIST [STRING_8] */
struct S226 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* equality_tester */
	T0* a4; /* last_cell */
	T6 a5; /* count */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [STRING_8] */
struct S227 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_BILINKABLE [STRING_8] */
struct S228 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type TO_SPECIAL [XM_EIFFEL_PARSER_NAME] */
struct S229 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_EIFFEL_DECLARATION] */
struct S230 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [BOOLEAN] */
struct S231 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S232 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_DTD_ELEMENT_CONTENT] */
struct S233 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S234 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
struct S235 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [DS_BILINKED_LIST [STRING_8]] */
struct S236 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_DTD_EXTERNAL_ID] */
struct S237 {
	int id;
	T0* a1; /* area */
};

/* Struct for type XM_NAMESPACE_RESOLVER_CONTEXT */
struct S238 {
	int id;
	T0* a1; /* context */
};

/* Struct for type DS_LINKED_QUEUE [STRING_8] */
struct S240 {
	int id;
	T0* a1; /* first_cell */
	T6 a2; /* count */
	T0* a3; /* last_cell */
};

/* Struct for type DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S241 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type TO_SPECIAL [GEANT_ARGUMENT_VARIABLES] */
struct S242 {
	int id;
	T0* a1; /* area */
};

/* Struct for type SPECIAL [NATURAL_8] */
struct S243 {
	int id;
	T6 z1; /* count */
	T8 z2[1]; /* item */
};

/* Struct for type GEANT_STRING_INTERPRETER */
struct S244 {
	int id;
	T0* a1; /* variable_resolver */
};

/* Struct for type GEANT_VARIABLES_VARIABLE_RESOLVER */
struct S245 {
	int id;
	T0* a1; /* variables */
};

/* Struct for type KL_ARRAY_ROUTINES [INTEGER_32] */
struct S248 {
	int id;
};

/* Struct for type MANAGED_POINTER */
struct S250 {
	int id;
	T1 a1; /* is_shared */
	T14 a2; /* item */
	T6 a3; /* count */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_PARENT] */
struct S251 {
	int id;
};

/* Struct for type SPECIAL [GEANT_PARENT] */
struct S252 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type UC_UNICODE_ROUTINES */
struct S253 {
	int id;
};

/* Struct for type DS_LINKED_QUEUE [CHARACTER_8] */
struct S255 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
};

/* Struct for type UC_UTF16_ROUTINES */
struct S256 {
	int id;
};

/* Struct for type SPECIAL [NATURAL_64] */
struct S257 {
	int id;
	T6 z1; /* count */
	T11 z2[1]; /* item */
};

/* Struct for type GEANT_RENAME_ELEMENT */
struct S258 {
	int id;
	T0* a1; /* rename_clause */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_REDEFINE_ELEMENT */
struct S259 {
	int id;
	T0* a1; /* redefine_clause */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_SELECT_ELEMENT */
struct S260 {
	int id;
	T0* a1; /* select_clause */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_RENAME */
struct S261 {
	int id;
	T0* a1; /* original_name */
	T0* a2; /* new_name */
};

/* Struct for type DS_HASH_TABLE [GEANT_RENAME, STRING_8] */
struct S262 {
	int id;
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

/* Struct for type GEANT_REDEFINE */
struct S263 {
	int id;
	T0* a1; /* name */
};

/* Struct for type DS_HASH_TABLE [GEANT_REDEFINE, STRING_8] */
struct S264 {
	int id;
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

/* Struct for type GEANT_SELECT */
struct S265 {
	int id;
	T0* a1; /* name */
};

/* Struct for type DS_HASH_TABLE [GEANT_SELECT, STRING_8] */
struct S266 {
	int id;
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

/* Struct for type DS_LINKABLE [INTEGER_32] */
struct S268 {
	int id;
	T6 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S269 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [XM_EIFFEL_ENTITY_DEF] */
struct S270 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
struct S271 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
struct S272 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_LINKED_LIST_CURSOR [STRING_8] */
struct S273 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S275 {
	int id;
	T6 a1; /* count */
	T0* a2; /* last_cell */
	T0* a3; /* internal_cursor */
	T0* a4; /* first_cell */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S276 {
	int id;
	T1 a1; /* before */
	T0* a2; /* current_cell */
	T0* a3; /* next_cursor */
	T0* a4; /* container */
	T1 a5; /* after */
};

/* Struct for type DS_LINKABLE [STRING_8] */
struct S277 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S278 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type GEANT_GEC_TASK */
struct S280 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_SE_TASK */
struct S281 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_ISE_TASK */
struct S282 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_VE_TASK */
struct S283 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_EXEC_TASK */
struct S284 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_LCC_TASK */
struct S285 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_SET_TASK */
struct S286 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_UNSET_TASK */
struct S287 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_GEXACE_TASK */
struct S288 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_GELEX_TASK */
struct S289 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_GEYACC_TASK */
struct S290 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_GEPP_TASK */
struct S291 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_GETEST_TASK */
struct S292 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_GEANT_TASK */
struct S293 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_ECHO_TASK */
struct S294 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_MKDIR_TASK */
struct S295 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_DELETE_TASK */
struct S296 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_COPY_TASK */
struct S297 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_MOVE_TASK */
struct S298 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_SETENV_TASK */
struct S299 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_XSLT_TASK */
struct S300 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_OUTOFDATE_TASK */
struct S301 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_EXIT_TASK */
struct S302 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_PRECURSOR_TASK */
struct S303 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_AVAILABLE_TASK */
struct S304 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_INPUT_TASK */
struct S305 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_REPLACE_TASK */
struct S306 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type AP_OPTION_COMPARATOR */
struct S307 {
	int id;
};

/* Struct for type DS_QUICK_SORTER [AP_OPTION] */
struct S308 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type ST_WORD_WRAPPER */
struct S310 {
	int id;
	T6 a1; /* new_line_indentation */
	T6 a2; /* broken_words */
	T6 a3; /* maximum_text_width */
};

/* Struct for type DS_HASH_SET [XM_NAMESPACE] */
struct S312 {
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
struct S313 {
	int id;
	T0* a1; /* data */
	T0* a2; /* parent */
};

/* Struct for type XM_PROCESSING_INSTRUCTION */
struct S314 {
	int id;
	T0* a1; /* target */
	T0* a2; /* data */
	T0* a3; /* parent */
};

/* Struct for type XM_CHARACTER_DATA */
struct S315 {
	int id;
	T0* a1; /* content */
	T0* a2; /* parent */
};

/* Struct for type XM_NAMESPACE */
struct S316 {
	int id;
	T0* a1; /* uri */
	T0* a2; /* ns_prefix */
};

/* Struct for type DS_LINKABLE [XM_NODE] */
struct S319 {
	int id;
	T0* a1; /* right */
	T0* a2; /* item */
};

/* Struct for type XM_NODE_TYPER */
struct S320 {
	int id;
	T0* a1; /* element */
	T0* a2; /* xml_attribute */
	T0* a3; /* composite */
	T0* a4; /* document */
	T0* a5; /* character_data */
	T0* a6; /* processing_instruction */
	T0* a7; /* comment */
};

/* Struct for type DS_PAIR [XM_POSITION, XM_NODE] */
struct S325 {
	int id;
	T0* a1; /* first */
	T0* a2; /* second */
};

/* Struct for type KL_CHARACTER_BUFFER */
struct S326 {
	int id;
	T0* a1; /* as_special */
	T0* a2; /* area */
};

/* Struct for type DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S327 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type EXCEPTIONS */
struct S329 {
	int id;
};

/* Struct for type TO_SPECIAL [GEANT_PARENT] */
struct S330 {
	int id;
	T0* a1; /* area */
};

/* Struct for type SPECIAL [ARRAY [INTEGER_32]] */
struct S331 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
struct S332 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_LINKABLE [CHARACTER_8] */
struct S333 {
	int id;
	T2 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type KL_EQUALITY_TESTER [GEANT_RENAME] */
struct S334 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [GEANT_RENAME, STRING_8] */
struct S335 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type SPECIAL [GEANT_RENAME] */
struct S337 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8] */
struct S338 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_RENAME] */
struct S339 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [GEANT_REDEFINE] */
struct S340 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [GEANT_REDEFINE, STRING_8] */
struct S341 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type SPECIAL [GEANT_REDEFINE] */
struct S343 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8] */
struct S344 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_REDEFINE] */
struct S345 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [GEANT_SELECT] */
struct S346 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [GEANT_SELECT, STRING_8] */
struct S347 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type SPECIAL [GEANT_SELECT] */
struct S349 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8] */
struct S350 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_SELECT] */
struct S351 {
	int id;
};

/* Struct for type DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S353 {
	int id;
	T0* a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
};

/* Struct for type KL_DIRECTORY */
struct S354 {
	int id;
	T0* a1; /* string_name */
	T0* a2; /* name */
	T6 a3; /* mode */
	T1 a4; /* end_of_input */
	T0* a5; /* last_entry */
	T0* a6; /* entry_buffer */
	T0* a7; /* lastentry */
	T14 a8; /* directory_pointer */
};

/* Struct for type KL_STRING_INPUT_STREAM */
struct S355 {
	int id;
	T1 a1; /* end_of_input */
	T2 a2; /* last_character */
	T0* a3; /* string */
	T6 a4; /* location */
};

/* Struct for type GEANT_GEC_COMMAND */
struct S356 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* project */
	T0* a3; /* exit_code_variable_name */
	T0* a4; /* ace_filename */
	T0* a5; /* clean */
	T1 a6; /* c_compile */
	T1 a7; /* split_mode */
	T1 a8; /* finalize */
	T0* a9; /* catcall_mode */
	T6 a10; /* split_size */
	T0* a11; /* garbage_collector */
};

/* Struct for type GEANT_SE_COMMAND */
struct S357 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* project */
	T0* a3; /* exit_code_variable_name */
	T0* a4; /* ace_filename */
	T0* a5; /* root_class */
	T0* a6; /* executable */
	T0* a7; /* clean */
	T0* a8; /* creation_procedure */
	T1 a9; /* case_insensitive */
	T1 a10; /* no_style_warning */
};

/* Struct for type GEANT_ISE_COMMAND */
struct S358 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* project */
	T0* a3; /* exit_code_variable_name */
	T0* a4; /* system_name */
	T0* a5; /* clean */
	T0* a6; /* ace_filename */
	T1 a7; /* finalize_mode */
	T1 a8; /* finish_freezing */
};

/* Struct for type GEANT_VE_COMMAND */
struct S359 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* project */
	T0* a3; /* exit_code_variable_name */
	T0* a4; /* esd_filename */
	T0* a5; /* xace_filename */
	T0* a6; /* clean */
	T0* a7; /* tuned_system */
	T1 a8; /* recursive_clean */
	T0* a9; /* tuning_level */
};

/* Struct for type GEANT_EXEC_COMMAND */
struct S360 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* project */
	T0* a3; /* command_line */
	T0* a4; /* fileset */
	T0* a5; /* exit_code_variable_name */
	T1 a6; /* accept_errors */
};

/* Struct for type GEANT_FILESET_ELEMENT */
struct S361 {
	int id;
	T0* a1; /* fileset */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_FILESET */
struct S362 {
	int id;
	T0* a1; /* directory_name */
	T0* a2; /* project */
	T0* a3; /* include_wildcard */
	T0* a4; /* exclude_wildcard */
	T0* a5; /* map */
	T0* a6; /* filenames */
	T0* a7; /* filename_directory_name */
	T0* a8; /* mapped_filename_directory_name */
	T0* a9; /* dir_name */
	T1 a10; /* concat */
	T0* a11; /* single_includes */
	T0* a12; /* single_excludes */
	T1 a13; /* force */
	T1 a14; /* convert_to_filesystem */
	T0* a15; /* include_wc_string */
	T0* a16; /* exclude_wc_string */
	T0* a17; /* filename_variable_name */
	T0* a18; /* mapped_filename_variable_name */
};

/* Struct for type GEANT_LCC_COMMAND */
struct S363 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* project */
	T0* a3; /* executable */
	T0* a4; /* source_filename */
};

/* Struct for type GEANT_SET_COMMAND */
struct S364 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* project */
	T0* a3; /* name */
	T0* a4; /* value */
};

/* Struct for type GEANT_UNSET_COMMAND */
struct S365 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* project */
	T0* a3; /* name */
};

/* Struct for type GEANT_GEXACE_COMMAND */
struct S366 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* defines */
	T0* a3; /* project */
	T1 a4; /* validate_command */
	T0* a5; /* output_filename */
	T0* a6; /* system_command */
	T0* a7; /* library_command */
	T1 a8; /* verbose */
	T0* a9; /* format */
	T0* a10; /* xace_filename */
};

/* Struct for type GEANT_DEFINE_ELEMENT */
struct S367 {
	int id;
	T0* a1; /* project */
	T0* a2; /* xml_element */
};

/* Struct for type GEANT_GELEX_COMMAND */
struct S368 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* project */
	T0* a3; /* input_filename */
	T1 a4; /* full */
	T1 a5; /* meta_ecs */
	T0* a6; /* output_filename */
	T0* a7; /* size */
	T1 a8; /* ecs */
	T1 a9; /* backup */
	T1 a10; /* case_insensitive */
	T1 a11; /* no_default */
	T1 a12; /* no_warn */
	T1 a13; /* separate_actions */
};

/* Struct for type GEANT_GEYACC_COMMAND */
struct S369 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* project */
	T0* a3; /* input_filename */
	T0* a4; /* output_filename */
	T1 a5; /* separate_actions */
	T0* a6; /* verbose_filename */
	T1 a7; /* old_typing */
	T1 a8; /* new_typing */
	T0* a9; /* tokens_classname */
	T0* a10; /* tokens_filename */
};

/* Struct for type GEANT_GEPP_COMMAND */
struct S370 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* defines */
	T0* a3; /* project */
	T0* a4; /* input_filename */
	T0* a5; /* output_filename */
	T0* a6; /* fileset */
	T1 a7; /* empty_lines */
	T0* a8; /* to_directory */
	T1 a9; /* force */
};

/* Struct for type GEANT_GETEST_COMMAND */
struct S371 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* defines */
	T0* a3; /* project */
	T0* a4; /* config_filename */
	T1 a5; /* generation */
	T1 a6; /* compilation */
	T1 a7; /* execution */
	T1 a8; /* verbose */
	T0* a9; /* compile */
	T0* a10; /* class_regexp */
	T0* a11; /* feature_regexp */
	T1 a12; /* default_test_included */
	T1 a13; /* abort */
};

/* Struct for type GEANT_GEANT_COMMAND */
struct S372 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* arguments */
	T0* a3; /* project */
	T0* a4; /* filename */
	T0* a5; /* start_target_name */
	T1 a6; /* reuse_variables */
	T1 a7; /* fork */
	T1 a8; /* has_fork_been_set */
	T0* a9; /* fileset */
};

/* Struct for type ST_SPLITTER */
struct S373 {
	int id;
	T1 a1; /* has_escape_character */
	T2 a2; /* escape_character */
	T0* a3; /* separator_codes */
	T0* a4; /* separators */
};

/* Struct for type GEANT_ECHO_COMMAND */
struct S374 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* project */
	T0* a3; /* message */
	T0* a4; /* to_file */
	T1 a5; /* append */
};

/* Struct for type GEANT_MKDIR_COMMAND */
struct S375 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* project */
	T0* a3; /* directory */
};

/* Struct for type GEANT_DELETE_COMMAND */
struct S376 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* project */
	T0* a3; /* file */
	T0* a4; /* directory */
	T0* a5; /* fileset */
	T0* a6; /* directoryset */
};

/* Struct for type GEANT_DIRECTORYSET_ELEMENT */
struct S377 {
	int id;
	T0* a1; /* directoryset */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_DIRECTORYSET */
struct S378 {
	int id;
	T0* a1; /* directory_name */
	T0* a2; /* project */
	T0* a3; /* include_wildcard */
	T0* a4; /* exclude_wildcard */
	T0* a5; /* directory_names */
	T1 a6; /* convert_to_filesystem */
	T0* a7; /* single_includes */
	T0* a8; /* single_excludes */
	T0* a9; /* include_wc_string */
	T0* a10; /* exclude_wc_string */
	T1 a11; /* concat */
	T0* a12; /* directory_name_variable_name */
};

/* Struct for type GEANT_COPY_COMMAND */
struct S379 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* project */
	T0* a3; /* file */
	T0* a4; /* to_file */
	T0* a5; /* to_directory */
	T0* a6; /* fileset */
	T1 a7; /* force */
};

/* Struct for type GEANT_MOVE_COMMAND */
struct S380 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* project */
	T0* a3; /* file */
	T0* a4; /* to_file */
	T0* a5; /* to_directory */
	T0* a6; /* fileset */
};

/* Struct for type GEANT_SETENV_COMMAND */
struct S381 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* project */
	T0* a3; /* name */
	T0* a4; /* value */
};

/* Struct for type GEANT_XSLT_COMMAND */
struct S382 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* parameters */
	T0* a3; /* project */
	T0* a4; /* input_filename */
	T0* a5; /* output_filename */
	T0* a6; /* stylesheet_filename */
	T6 a7; /* processor */
	T1 a8; /* force */
	T0* a9; /* indent */
	T0* a10; /* format */
	T0* a11; /* extdirs */
	T0* a12; /* classpath */
};

/* Struct for type DS_PAIR [STRING_8, STRING_8] */
struct S383 {
	int id;
	T0* a1; /* first */
	T0* a2; /* second */
};

/* Struct for type DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]] */
struct S384 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type GEANT_OUTOFDATE_COMMAND */
struct S385 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* project */
	T0* a3; /* source_filename */
	T0* a4; /* target_filename */
	T0* a5; /* fileset */
	T0* a6; /* true_value */
	T0* a7; /* false_value */
	T0* a8; /* variable_name */
	T1 a9; /* is_out_of_date */
};

/* Struct for type GEANT_EXIT_COMMAND */
struct S386 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* project */
	T6 a3; /* code */
};

/* Struct for type GEANT_PRECURSOR_COMMAND */
struct S387 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* arguments */
	T0* a3; /* project */
	T0* a4; /* parent */
};

/* Struct for type GEANT_AVAILABLE_COMMAND */
struct S388 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* project */
	T0* a3; /* resource_name */
	T0* a4; /* true_value */
	T0* a5; /* false_value */
	T0* a6; /* variable_name */
};

/* Struct for type GEANT_INPUT_COMMAND */
struct S389 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* project */
	T0* a3; /* variable */
	T0* a4; /* message */
	T0* a5; /* default_value */
	T0* a6; /* validargs */
	T0* a7; /* validregexp */
	T1 a8; /* answer_required */
};

/* Struct for type GEANT_REPLACE_COMMAND */
struct S390 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* project */
	T0* a3; /* file */
	T0* a4; /* to_file */
	T0* a5; /* fileset */
	T0* a6; /* match */
	T0* a7; /* token */
	T0* a8; /* variable_pattern */
	T0* a9; /* to_directory */
	T0* a10; /* replace */
	T0* a11; /* flags */
};

/* Struct for type SPECIAL [XM_NAMESPACE] */
struct S391 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_EQUALITY_TESTER [XM_NAMESPACE] */
struct S392 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [XM_NAMESPACE] */
struct S393 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
struct S394 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_RENAME, STRING_8] */
struct S395 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [GEANT_RENAME] */
struct S396 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_REDEFINE, STRING_8] */
struct S397 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [GEANT_REDEFINE] */
struct S398 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_SELECT, STRING_8] */
struct S399 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [GEANT_SELECT] */
struct S400 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DP_SHELL_COMMAND */
struct S405 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* string_command */
	T0* a3; /* command */
	T6 a4; /* return_code */
	T1 a5; /* is_system_code */
};

/* Struct for type GEANT_MAP_ELEMENT */
struct S406 {
	int id;
	T0* a1; /* map */
	T0* a2; /* project */
	T0* a3; /* xml_element */
};

/* Struct for type GEANT_MAP */
struct S407 {
	int id;
	T0* a1; /* type */
	T0* a2; /* project */
	T0* a3; /* source_pattern */
	T0* a4; /* target_pattern */
	T0* a5; /* map */
};

/* Struct for type DS_HASH_SET [GEANT_FILESET_ENTRY] */
struct S410 {
	int id;
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
	T0* a13; /* clashes */
	T0* a14; /* slots */
	T0* a15; /* special_item_routines */
	T0* a16; /* hash_function */
};

/* Struct for type DS_HASH_SET [STRING_8] */
struct S412 {
	int id;
	T6 a1; /* capacity */
	T6 a2; /* modulus */
	T6 a3; /* last_position */
	T6 a4; /* free_slot */
	T6 a5; /* position */
	T0* a6; /* internal_cursor */
	T0* a7; /* equality_tester */
	T6 a8; /* slots_position */
	T6 a9; /* count */
	T0* a10; /* special_item_routines */
	T0* a11; /* item_storage */
	T0* a12; /* clashes */
	T0* a13; /* slots */
	T6 a14; /* found_position */
	T6 a15; /* clashes_previous_position */
	T0* a16; /* hash_function */
};

/* Struct for type DS_HASH_SET_CURSOR [STRING_8] */
struct S414 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type LX_DFA_WILDCARD */
struct S415 {
	int id;
	T0* a1; /* yy_nxt */
	T0* a2; /* subject */
	T6 a3; /* subject_start */
	T6 a4; /* subject_end */
	T6 a5; /* match_count */
	T6 a6; /* matched_start */
	T6 a7; /* matched_end */
	T0* a8; /* yy_accept */
	T6 a9; /* yyNb_rows */
};

/* Struct for type GEANT_FILESET_ENTRY */
struct S416 {
	int id;
	T0* a1; /* filename */
	T0* a2; /* mapped_filename */
};

/* Struct for type KL_BOOLEAN_ROUTINES */
struct S417 {
	int id;
};

/* Struct for type ARRAY [BOOLEAN] */
struct S418 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_HASH_SET [INTEGER_32] */
struct S420 {
	int id;
	T6 a1; /* position */
	T6 a2; /* capacity */
	T6 a3; /* modulus */
	T6 a4; /* last_position */
	T6 a5; /* free_slot */
	T0* a6; /* internal_cursor */
	T6 a7; /* slots_position */
	T6 a8; /* count */
	T6 a9; /* clashes_previous_position */
	T0* a10; /* special_item_routines */
	T0* a11; /* item_storage */
	T0* a12; /* clashes */
	T0* a13; /* slots */
	T6 a14; /* found_position */
	T0* a15; /* equality_tester */
	T0* a16; /* hash_function */
};

/* Struct for type KL_TEXT_OUTPUT_FILE */
struct S421 {
	int id;
	T0* a1; /* name */
	T6 a2; /* mode */
	T0* a3; /* string_name */
	T14 a4; /* file_pointer */
	T1 a5; /* descriptor_available */
};

/* Struct for type SPECIAL [DS_PAIR [STRING_8, STRING_8]] */
struct S422 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]] */
struct S423 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING_8, STRING_8]] */
struct S424 {
	int id;
	T0* a1; /* container */
};

/* Struct for type RX_PCRE_REGULAR_EXPRESSION */
struct S425 {
	int id;
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
	T0* a17; /* pattern */
	T6 a18; /* subexpression_count */
	T6 a19; /* pattern_count */
	T6 a20; /* pattern_position */
	T6 a21; /* code_index */
	T6 a22; /* maxbackrefs */
	T6 a23; /* optchanged */
	T6 a24; /* first_character */
	T6 a25; /* required_character */
	T6 a26; /* regexp_countlits */
	T0* a27; /* start_bits */
	T1 a28; /* is_anchored */
	T1 a29; /* is_caseless */
	T1 a30; /* is_multiline */
	T0* a31; /* character_case_mapping */
	T0* a32; /* word_set */
	T6 a33; /* subject_next_start */
	T6 a34; /* error_code */
	T6 a35; /* error_position */
	T1 a36; /* is_startline */
	T1 a37; /* is_dotall */
	T1 a38; /* is_extended */
	T1 a39; /* is_empty_allowed */
	T1 a40; /* is_dollar_endonly */
	T1 a41; /* is_bol */
	T1 a42; /* is_eol */
	T1 a43; /* is_greedy */
	T1 a44; /* is_strict */
	T1 a45; /* is_ichanged */
	T6 a46; /* first_matched_index */
	T6 a47; /* eptr */
	T6 a48; /* offset_top */
	T1 a49; /* is_matching_caseless */
	T1 a50; /* is_matching_multiline */
	T1 a51; /* is_matching_dotall */
};

/* Struct for type KL_STRING_EQUALITY_TESTER */
struct S426 {
	int id;
};

/* Struct for type KL_STDIN_FILE */
struct S427 {
	int id;
	T0* a1; /* last_string */
	T1 a2; /* end_of_file */
	T2 a3; /* last_character */
	T14 a4; /* file_pointer */
	T0* a5; /* character_buffer */
	T0* a6; /* name */
	T6 a7; /* mode */
};

/* Struct for type TO_SPECIAL [XM_NAMESPACE] */
struct S428 {
	int id;
	T0* a1; /* area */
};

/* Struct for type PLATFORM */
struct S432 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY] */
struct S434 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [GEANT_FILESET_ENTRY] */
struct S435 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY] */
struct S436 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY] */
struct S437 {
	int id;
};

/* Struct for type LX_WILDCARD_PARSER */
struct S438 {
	int id;
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
	T0* a12; /* error_handler */
	T0* a13; /* name_definitions */
	T0* a14; /* character_classes */
	T6 a15; /* line_nb */
	T0* a16; /* yyss */
	T0* a17; /* input_buffer */
	T6 a18; /* yy_end */
	T6 a19; /* yy_position */
	T6 a20; /* yy_line */
	T6 a21; /* yy_column */
	T6 a22; /* yy_parsing_status */
	T6 a23; /* yy_suspended_yystacksize */
	T6 a24; /* yy_suspended_yystate */
	T6 a25; /* yy_suspended_yyn */
	T6 a26; /* yy_suspended_yychar1 */
	T6 a27; /* yy_suspended_index */
	T6 a28; /* yy_suspended_yyss_top */
	T6 a29; /* yy_suspended_yy_goto */
	T6 a30; /* error_count */
	T1 a31; /* yy_lookahead_needed */
	T6 a32; /* yyerrstatus */
	T6 a33; /* yyssp */
	T0* a34; /* yypact */
	T6 a35; /* last_token */
	T0* a36; /* yytranslate */
	T0* a37; /* yycheck */
	T0* a38; /* yytable */
	T0* a39; /* yydefact */
	T0* a40; /* yyr1 */
	T0* a41; /* yypgoto */
	T0* a42; /* yydefgoto */
	T0* a43; /* yytypes1 */
	T0* a44; /* yytypes2 */
	T6 a45; /* yy_start */
	T6 a46; /* yyvsp1 */
	T6 a47; /* yyvsp2 */
	T6 a48; /* yyvsp3 */
	T6 a49; /* yyvsp4 */
	T6 a50; /* yyvsp5 */
	T1 a51; /* yy_more_flag */
	T6 a52; /* yy_more_len */
	T6 a53; /* line */
	T6 a54; /* column */
	T6 a55; /* position */
	T6 a56; /* yy_start_state */
	T0* a57; /* yy_state_stack */
	T6 a58; /* yy_state_count */
	T0* a59; /* yy_ec */
	T0* a60; /* yy_content_area */
	T0* a61; /* yy_content */
	T0* a62; /* yy_accept */
	T6 a63; /* yy_last_accepting_state */
	T6 a64; /* yy_last_accepting_cpos */
	T0* a65; /* yy_chk */
	T0* a66; /* yy_base */
	T0* a67; /* yy_def */
	T0* a68; /* yy_meta */
	T0* a69; /* yy_nxt */
	T6 a70; /* yy_lp */
	T0* a71; /* yy_acclist */
	T6 a72; /* yy_looking_for_trail_begin */
	T6 a73; /* yy_full_match */
	T6 a74; /* yy_full_state */
	T6 a75; /* yy_full_lp */
	T1 a76; /* yy_rejected */
	T6 a77; /* yyvsc1 */
	T0* a78; /* yyvs1 */
	T0* a79; /* yyspecial_routines1 */
	T0* a80; /* last_any_value */
	T6 a81; /* yyvsc2 */
	T0* a82; /* yyvs2 */
	T0* a83; /* yyspecial_routines2 */
	T6 a84; /* last_integer_value */
	T6 a85; /* yyvsc3 */
	T0* a86; /* yyvs3 */
	T0* a87; /* yyspecial_routines3 */
	T0* a88; /* last_lx_symbol_class_value */
	T6 a89; /* yyvsc4 */
	T0* a90; /* yyvs4 */
	T0* a91; /* yyspecial_routines4 */
	T0* a92; /* last_string_value */
	T1 a93; /* in_trail_context */
	T0* a94; /* rule */
	T0* a95; /* yyvs5 */
	T1 a96; /* has_trail_context */
	T6 a97; /* head_count */
	T6 a98; /* head_line */
	T6 a99; /* head_column */
	T6 a100; /* trail_count */
	T6 a101; /* yyvsc5 */
	T0* a102; /* yyspecial_routines5 */
	T0* a103; /* last_string */
	T6 a104; /* rule_line_nb */
};

/* Struct for type LX_DESCRIPTION */
struct S439 {
	int id;
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
	T0* a12; /* eof_rules */
	T0* a13; /* eiffel_header */
	T1 a14; /* case_insensitive */
	T0* a15; /* input_filename */
	T1 a16; /* inspect_used */
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
struct S440 {
	int id;
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

/* Struct for type DS_HASH_SET_CURSOR [INTEGER_32] */
struct S442 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_EQUALITY_TESTER [INTEGER_32] */
struct S443 {
	int id;
};

/* Struct for type TO_SPECIAL [DS_PAIR [STRING_8, STRING_8]] */
struct S444 {
	int id;
	T0* a1; /* area */
};

/* Struct for type RX_BYTE_CODE */
struct S446 {
	int id;
	T6 a1; /* count */
	T0* a2; /* byte_code */
	T0* a3; /* character_sets */
	T6 a4; /* capacity */
	T6 a5; /* character_sets_count */
	T6 a6; /* character_sets_capacity */
};

/* Struct for type RX_CASE_MAPPING */
struct S447 {
	int id;
	T0* a1; /* lower_table */
	T0* a2; /* flip_table */
};

/* Struct for type RX_CHARACTER_SET */
struct S448 {
	int id;
	T0* a1; /* set */
};

/* Struct for type SPECIAL [RX_CHARACTER_SET] */
struct S450 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [RX_CHARACTER_SET] */
struct S451 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type KL_NULL_TEXT_OUTPUT_STREAM */
struct S452 {
	int id;
	T0* a1; /* name */
};

/* Struct for type KL_BINARY_INPUT_FILE */
struct S453 {
	int id;
	T1 a1; /* end_of_file */
	T0* a2; /* last_string */
	T6 a3; /* mode */
	T0* a4; /* name */
	T0* a5; /* string_name */
	T0* a6; /* character_buffer */
	T14 a7; /* file_pointer */
	T1 a8; /* descriptor_available */
};

/* Struct for type KL_BINARY_OUTPUT_FILE */
struct S454 {
	int id;
	T6 a1; /* mode */
	T0* a2; /* name */
	T0* a3; /* string_name */
	T14 a4; /* file_pointer */
	T1 a5; /* descriptor_available */
};

/* Struct for type GE_HASH_TABLE [C_STRING, STRING_8] */
struct S455 {
	int id;
	T6 a1; /* capacity */
	T0* a2; /* content */
	T0* a3; /* keys */
	T0* a4; /* deleted_marks */
	T6 a5; /* iteration_position */
	T6 a6; /* count */
	T6 a7; /* deleted_position */
	T6 a8; /* control */
	T0* a9; /* found_item */
	T1 a10; /* has_default */
	T6 a11; /* position */
	T6 a12; /* used_slot_count */
	T0* a13; /* key_equality_tester */
};

/* Struct for type FILE_NAME */
struct S457 {
	int id;
	T6 a1; /* count */
	T6 a2; /* internal_hash_code */
	T0* a3; /* area */
};

/* Struct for type RAW_FILE */
struct S458 {
	int id;
	T0* a1; /* name */
	T6 a2; /* mode */
};

/* Struct for type DIRECTORY */
struct S459 {
	int id;
	T0* a1; /* lastentry */
	T0* a2; /* name */
	T6 a3; /* mode */
	T14 a4; /* directory_pointer */
};

/* Struct for type ARRAYED_LIST [STRING_8] */
struct S460 {
	int id;
	T6 a1; /* index */
	T6 a2; /* count */
	T0* a3; /* area */
	T6 a4; /* lower */
	T6 a5; /* upper */
};

/* Struct for type TO_SPECIAL [GEANT_FILESET_ENTRY] */
struct S463 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_ARRAYED_LIST [LX_RULE] */
struct S464 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type LX_START_CONDITIONS */
struct S465 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type LX_ACTION_FACTORY */
struct S466 {
	int id;
};

/* Struct for type DS_ARRAYED_STACK [INTEGER_32] */
struct S467 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
};

/* Struct for type DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8] */
struct S468 {
	int id;
	T6 a1; /* position */
	T0* a2; /* item_storage */
	T0* a3; /* key_equality_tester */
	T0* a4; /* internal_keys */
	T6 a5; /* count */
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

/* Struct for type LX_SYMBOL_CLASS */
struct S469 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T1 a5; /* sort_needed */
	T1 a6; /* negated */
	T6 a7; /* count */
	T0* a8; /* equality_tester */
};

/* Struct for type SPECIAL [LX_SYMBOL_CLASS] */
struct S470 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS] */
struct S471 {
	int id;
};

/* Struct for type LX_NFA */
struct S472 {
	int id;
	T1 a1; /* in_trail_context */
	T0* a2; /* states */
};

/* Struct for type LX_EQUIVALENCE_CLASSES */
struct S473 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
};

/* Struct for type LX_RULE */
struct S474 {
	int id;
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

/* Struct for type SPECIAL [LX_NFA] */
struct S475 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_NFA] */
struct S476 {
	int id;
};

/* Struct for type UT_SYNTAX_ERROR */
struct S477 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
struct S478 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type LX_UNRECOGNIZED_RULE_ERROR */
struct S479 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_MISSING_QUOTE_ERROR */
struct S480 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_BAD_CHARACTER_CLASS_ERROR */
struct S481 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_BAD_CHARACTER_ERROR */
struct S482 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_FULL_AND_META_ERROR */
struct S483 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_FULL_AND_REJECT_ERROR */
struct S484 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR */
struct S485 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_CHARACTER_OUT_OF_RANGE_ERROR */
struct S486 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type SPECIAL [LX_RULE] */
struct S487 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [LX_RULE] */
struct S488 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type LX_DFA_STATE */
struct S489 {
	int id;
	T0* a1; /* accepted_rules */
	T0* a2; /* states */
	T0* a3; /* transitions */
	T0* a4; /* accepted_head_rules */
	T6 a5; /* code */
	T6 a6; /* id */
};

/* Struct for type DS_ARRAYED_LIST [LX_NFA_STATE] */
struct S490 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* equality_tester */
	T0* a4; /* special_routines */
	T6 a5; /* capacity */
	T0* a6; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST [LX_DFA_STATE] */
struct S491 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T0* a5; /* internal_cursor */
};

/* Struct for type LX_SYMBOL_PARTITIONS */
struct S492 {
	int id;
	T0* a1; /* symbols */
	T0* a2; /* storage */
	T6 a3; /* count */
};

/* Struct for type LX_START_CONDITION */
struct S493 {
	int id;
	T0* a1; /* name */
	T6 a2; /* id */
	T1 a3; /* is_exclusive */
	T0* a4; /* patterns */
	T0* a5; /* bol_patterns */
};

/* Struct for type LX_TRANSITION_TABLE [LX_DFA_STATE] */
struct S494 {
	int id;
	T0* a1; /* storage */
	T0* a2; /* array_routines */
	T6 a3; /* count */
};

/* Struct for type DS_ARRAYED_LIST [LX_NFA] */
struct S495 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T6 a5; /* count */
};

/* Struct for type DS_HASH_TABLE [LX_NFA, INTEGER_32] */
struct S496 {
	int id;
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
	T0* a12; /* internal_keys */
	T6 a13; /* found_position */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* key_storage */
	T0* a17; /* internal_cursor */
	T0* a18; /* special_item_routines */
	T0* a19; /* special_key_routines */
	T0* a20; /* hash_function */
};

/* Struct for type LX_NFA_STATE */
struct S497 {
	int id;
	T1 a1; /* in_trail_context */
	T0* a2; /* transition */
	T0* a3; /* epsilon_transition */
	T6 a4; /* id */
	T0* a5; /* accepted_rule */
};

/* Struct for type STRING_SEARCHER */
struct S498 {
	int id;
	T0* a1; /* deltas */
};

/* Struct for type GE_STRING_EQUALITY_TESTER */
struct S499 {
	int id;
};

/* Struct for type LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR */
struct S501 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PRIMES */
struct S503 {
	int id;
};

/* Struct for type SPECIAL [C_STRING] */
struct S504 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_RULE] */
struct S506 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_RULE] */
struct S507 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [LX_START_CONDITION] */
struct S508 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_START_CONDITION] */
struct S509 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION] */
struct S510 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING_8] */
struct S512 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
struct S514 {
	int id;
	T0* a1; /* container */
};

/* Struct for type TO_SPECIAL [LX_SYMBOL_CLASS] */
struct S515 {
	int id;
	T0* a1; /* area */
};

/* Struct for type LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE] */
struct S516 {
	int id;
	T0* a1; /* label */
	T0* a2; /* target */
};

/* Struct for type LX_EPSILON_TRANSITION [LX_NFA_STATE] */
struct S518 {
	int id;
	T0* a1; /* target */
};

/* Struct for type LX_SYMBOL_TRANSITION [LX_NFA_STATE] */
struct S520 {
	int id;
	T6 a1; /* label */
	T0* a2; /* target */
};

/* Struct for type DS_BILINKABLE [INTEGER_32] */
struct S521 {
	int id;
	T6 a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
};

/* Struct for type SPECIAL [DS_BILINKABLE [INTEGER_32]] */
struct S522 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [DS_BILINKABLE [INTEGER_32]] */
struct S523 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type LX_ACTION */
struct S525 {
	int id;
	T0* a1; /* text */
};

/* Struct for type TO_SPECIAL [LX_NFA] */
struct S526 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_BUBBLE_SORTER [LX_NFA_STATE] */
struct S527 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type DS_BUBBLE_SORTER [LX_RULE] */
struct S529 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type SPECIAL [LX_NFA_STATE] */
struct S531 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_NFA_STATE] */
struct S533 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE] */
struct S534 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [LX_DFA_STATE] */
struct S536 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_DFA_STATE] */
struct S537 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE] */
struct S538 {
	int id;
	T0* a1; /* container */
};

/* Struct for type ARRAY [LX_DFA_STATE] */
struct S539 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type KL_ARRAY_ROUTINES [LX_DFA_STATE] */
struct S540 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_NFA] */
struct S541 {
	int id;
	T0* a1; /* container */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [LX_NFA, INTEGER_32] */
struct S543 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32] */
struct S545 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_COMPARABLE_COMPARATOR [LX_RULE] */
struct S548 {
	int id;
};

/* Struct for type KL_COMPARABLE_COMPARATOR [LX_NFA_STATE] */
struct S551 {
	int id;
};

/* Struct for type TO_SPECIAL [LX_RULE] */
struct S554 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [LX_START_CONDITION] */
struct S555 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
struct S556 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [LX_NFA_STATE] */
struct S557 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [LX_DFA_STATE] */
struct S558 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [LX_NFA, INTEGER_32] */
struct S559 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type DS_SHELL_SORTER [INTEGER_32] */
struct S560 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type KL_COMPARABLE_COMPARATOR [INTEGER_32] */
struct S564 {
	int id;
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
extern T26 GE_default26;
extern T27 GE_default27;
extern T28 GE_default28;
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
extern T40 GE_default40;
extern T45 GE_default45;
extern T46 GE_default46;
extern T47 GE_default47;
extern T48 GE_default48;
extern T49 GE_default49;
extern T51 GE_default51;
extern T53 GE_default53;
extern T54 GE_default54;
extern T55 GE_default55;
extern T56 GE_default56;
extern T58 GE_default58;
extern T59 GE_default59;
extern T61 GE_default61;
extern T63 GE_default63;
extern T64 GE_default64;
extern T65 GE_default65;
extern T66 GE_default66;
extern T68 GE_default68;
extern T69 GE_default69;
extern T71 GE_default71;
extern T72 GE_default72;
extern T73 GE_default73;
extern T74 GE_default74;
extern T75 GE_default75;
extern T76 GE_default76;
extern T77 GE_default77;
extern T80 GE_default80;
extern T82 GE_default82;
extern T83 GE_default83;
extern T85 GE_default85;
extern T86 GE_default86;
extern T87 GE_default87;
extern T89 GE_default89;
extern T91 GE_default91;
extern T92 GE_default92;
extern T95 GE_default95;
extern T96 GE_default96;
extern T97 GE_default97;
extern T98 GE_default98;
extern T100 GE_default100;
extern T101 GE_default101;
extern T102 GE_default102;
extern T103 GE_default103;
extern T104 GE_default104;
extern T105 GE_default105;
extern T107 GE_default107;
extern T108 GE_default108;
extern T109 GE_default109;
extern T110 GE_default110;
extern T111 GE_default111;
extern T112 GE_default112;
extern T114 GE_default114;
extern T116 GE_default116;
extern T117 GE_default117;
extern T118 GE_default118;
extern T119 GE_default119;
extern T120 GE_default120;
extern T122 GE_default122;
extern T124 GE_default124;
extern T125 GE_default125;
extern T126 GE_default126;
extern T128 GE_default128;
extern T129 GE_default129;
extern T131 GE_default131;
extern T132 GE_default132;
extern T133 GE_default133;
extern T134 GE_default134;
extern T136 GE_default136;
extern T137 GE_default137;
extern T138 GE_default138;
extern T139 GE_default139;
extern T140 GE_default140;
extern T141 GE_default141;
extern T142 GE_default142;
extern T143 GE_default143;
extern T144 GE_default144;
extern T145 GE_default145;
extern T146 GE_default146;
extern T147 GE_default147;
extern T148 GE_default148;
extern T149 GE_default149;
extern T150 GE_default150;
extern T151 GE_default151;
extern T152 GE_default152;
extern T153 GE_default153;
extern T154 GE_default154;
extern T155 GE_default155;
extern T156 GE_default156;
extern T157 GE_default157;
extern T159 GE_default159;
extern T161 GE_default161;
extern T162 GE_default162;
extern T163 GE_default163;
extern T164 GE_default164;
extern T165 GE_default165;
extern T166 GE_default166;
extern T167 GE_default167;
extern T169 GE_default169;
extern T170 GE_default170;
extern T172 GE_default172;
extern T173 GE_default173;
extern T174 GE_default174;
extern T175 GE_default175;
extern T176 GE_default176;
extern T177 GE_default177;
extern T178 GE_default178;
extern T180 GE_default180;
extern T181 GE_default181;
extern T182 GE_default182;
extern T183 GE_default183;
extern T185 GE_default185;
extern T186 GE_default186;
extern T187 GE_default187;
extern T188 GE_default188;
extern T190 GE_default190;
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
extern T203 GE_default203;
extern T204 GE_default204;
extern T205 GE_default205;
extern T206 GE_default206;
extern T207 GE_default207;
extern T210 GE_default210;
extern T211 GE_default211;
extern T212 GE_default212;
extern T213 GE_default213;
extern T214 GE_default214;
extern T215 GE_default215;
extern T217 GE_default217;
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
extern T231 GE_default231;
extern T232 GE_default232;
extern T233 GE_default233;
extern T234 GE_default234;
extern T235 GE_default235;
extern T236 GE_default236;
extern T237 GE_default237;
extern T238 GE_default238;
extern T240 GE_default240;
extern T241 GE_default241;
extern T242 GE_default242;
extern T243 GE_default243;
extern T244 GE_default244;
extern T245 GE_default245;
extern T248 GE_default248;
extern T250 GE_default250;
extern T251 GE_default251;
extern T252 GE_default252;
extern T253 GE_default253;
extern T255 GE_default255;
extern T256 GE_default256;
extern T257 GE_default257;
extern T258 GE_default258;
extern T259 GE_default259;
extern T260 GE_default260;
extern T261 GE_default261;
extern T262 GE_default262;
extern T263 GE_default263;
extern T264 GE_default264;
extern T265 GE_default265;
extern T266 GE_default266;
extern T268 GE_default268;
extern T269 GE_default269;
extern T270 GE_default270;
extern T271 GE_default271;
extern T272 GE_default272;
extern T273 GE_default273;
extern T275 GE_default275;
extern T276 GE_default276;
extern T277 GE_default277;
extern T278 GE_default278;
extern T280 GE_default280;
extern T281 GE_default281;
extern T282 GE_default282;
extern T283 GE_default283;
extern T284 GE_default284;
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
extern T307 GE_default307;
extern T308 GE_default308;
extern T310 GE_default310;
extern T312 GE_default312;
extern T313 GE_default313;
extern T314 GE_default314;
extern T315 GE_default315;
extern T316 GE_default316;
extern T319 GE_default319;
extern T320 GE_default320;
extern T325 GE_default325;
extern T326 GE_default326;
extern T327 GE_default327;
extern T328 GE_default328;
extern T329 GE_default329;
extern T330 GE_default330;
extern T331 GE_default331;
extern T332 GE_default332;
extern T333 GE_default333;
extern T334 GE_default334;
extern T335 GE_default335;
extern T337 GE_default337;
extern T338 GE_default338;
extern T339 GE_default339;
extern T340 GE_default340;
extern T341 GE_default341;
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
extern T388 GE_default388;
extern T389 GE_default389;
extern T390 GE_default390;
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
extern T405 GE_default405;
extern T406 GE_default406;
extern T407 GE_default407;
extern T410 GE_default410;
extern T412 GE_default412;
extern T414 GE_default414;
extern T415 GE_default415;
extern T416 GE_default416;
extern T417 GE_default417;
extern T418 GE_default418;
extern T420 GE_default420;
extern T421 GE_default421;
extern T422 GE_default422;
extern T423 GE_default423;
extern T424 GE_default424;
extern T425 GE_default425;
extern T426 GE_default426;
extern T427 GE_default427;
extern T428 GE_default428;
extern T432 GE_default432;
extern T434 GE_default434;
extern T435 GE_default435;
extern T436 GE_default436;
extern T437 GE_default437;
extern T438 GE_default438;
extern T439 GE_default439;
extern T440 GE_default440;
extern T442 GE_default442;
extern T443 GE_default443;
extern T444 GE_default444;
extern T446 GE_default446;
extern T447 GE_default447;
extern T448 GE_default448;
extern T450 GE_default450;
extern T451 GE_default451;
extern T452 GE_default452;
extern T453 GE_default453;
extern T454 GE_default454;
extern T455 GE_default455;
extern T457 GE_default457;
extern T458 GE_default458;
extern T459 GE_default459;
extern T460 GE_default460;
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
extern T487 GE_default487;
extern T488 GE_default488;
extern T489 GE_default489;
extern T490 GE_default490;
extern T491 GE_default491;
extern T492 GE_default492;
extern T493 GE_default493;
extern T494 GE_default494;
extern T495 GE_default495;
extern T496 GE_default496;
extern T497 GE_default497;
extern T498 GE_default498;
extern T499 GE_default499;
extern T501 GE_default501;
extern T503 GE_default503;
extern T504 GE_default504;
extern T505 GE_default505;
extern T506 GE_default506;
extern T507 GE_default507;
extern T508 GE_default508;
extern T509 GE_default509;
extern T510 GE_default510;
extern T512 GE_default512;
extern T514 GE_default514;
extern T515 GE_default515;
extern T516 GE_default516;
extern T518 GE_default518;
extern T520 GE_default520;
extern T521 GE_default521;
extern T522 GE_default522;
extern T523 GE_default523;
extern T525 GE_default525;
extern T526 GE_default526;
extern T527 GE_default527;
extern T529 GE_default529;
extern T531 GE_default531;
extern T533 GE_default533;
extern T534 GE_default534;
extern T536 GE_default536;
extern T537 GE_default537;
extern T538 GE_default538;
extern T539 GE_default539;
extern T540 GE_default540;
extern T541 GE_default541;
extern T543 GE_default543;
extern T545 GE_default545;
extern T548 GE_default548;
extern T551 GE_default551;
extern T554 GE_default554;
extern T555 GE_default555;
extern T556 GE_default556;
extern T557 GE_default557;
extern T558 GE_default558;
extern T559 GE_default559;
extern T560 GE_default560;
extern T564 GE_default564;

extern T0* GE_ms(char* s, T6 c);
/* Call to STRING_8.to_c */
extern T0* T17x1216(T0* C);
/* Call to STRING_8.area */
extern T0* T17x1300(T0* C);
/* Call to STRING_8.count */
extern T6 T17x1235(T0* C);
/* Call to ANY.is_equal */
extern T1 T19x29T0(T0* C, T0* a1);
/* Call to ANY.same_type */
extern T1 T19x28T0(T0* C, T0* a1);
/* Call to AP_OPTION.short_form */
extern T2 T42x2565(T0* C);
/* Call to AP_OPTION.long_form */
extern T0* T42x2560(T0* C);
/* Call to AP_OPTION.has_long_form */
extern T1 T42x2567(T0* C);
/* Call to AP_OPTION.example */
extern T0* T42x2559(T0* C);
/* Call to AP_OPTION.is_hidden */
extern T1 T42x2569(T0* C);
/* Call to AP_OPTION.description */
extern T0* T42x2558(T0* C);
/* Call to AP_OPTION.names */
extern T0* T42x2562(T0* C);
/* Call to AP_OPTION.name */
extern T0* T42x2561(T0* C);
/* Call to AP_OPTION.needs_parameter */
extern T1 T42x2571(T0* C);
/* Call to AP_OPTION.has_short_form */
extern T1 T42x2568(T0* C);
/* Call to AP_OPTION.allows_parameter */
extern T1 T42x2566(T0* C);
/* Call to AP_OPTION.maximum_occurrences */
extern T6 T42x2564(T0* C);
/* Call to AP_OPTION.occurrences */
extern T6 T42x2563(T0* C);
/* Call to AP_OPTION.was_found */
extern T1 T42x2573(T0* C);
/* Call to AP_OPTION.is_mandatory */
extern T1 T42x2570(T0* C);
/* Call to UT_ERROR.default_message */
extern T0* T50x3118(T0* C);
/* Call to DS_SPARSE_TABLE [STRING_8, STRING_8].new_cursor */
extern T0* T62x2056(T0* C);
/* Call to DS_SPARSE_TABLE [STRING_8, STRING_8].key_equality_tester */
extern T0* T62x1959(T0* C);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_item */
extern T0* T80x2066T0(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_key */
extern T0* T80x1909T0(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_after */
extern T1 T80x2050T0(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].before_position */
extern T6 T80x2014(T0* C);
/* Call to XM_EIFFEL_SCANNER.start_condition */
extern T6 T128x6902(T0* C);
/* Call to XM_EIFFEL_SCANNER.is_applicable_encoding */
extern T1 T128x6777T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.end_of_file */
extern T1 T128x6907(T0* C);
/* Call to XM_EIFFEL_SCANNER.last_value */
extern T0* T128x6788(T0* C);
/* Call to XM_EIFFEL_SCANNER.last_token */
extern T6 T128x6898(T0* C);
/* Call to XM_EIFFEL_SCANNER.error_position */
extern T0* T128x6786(T0* C);
/* Call to XM_NODE.parent */
extern T0* T192x5866(T0* C);
/* Call to GEANT_TASK.exit_code */
extern T6 T279x8545(T0* C);
/* Call to GEANT_TASK.is_exit_command */
extern T1 T279x8546(T0* C);
/* Call to GEANT_TASK.is_enabled */
extern T1 T279x2378(T0* C);
/* Call to GEANT_TASK.is_executable */
extern T1 T279x8544(T0* C);
/* Call to LX_TRANSITION [LX_NFA_STATE].target */
extern T0* T517x13301(T0* C);
/* Call to LX_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T517x13304T6(T0* C, T6 a1);
/* Call to AP_OPTION.record_occurrence */
extern void T42x2584T0(T0* C, T0* a1);
/* Call to AP_OPTION.reset */
extern void T42x2585(T0* C);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_forth */
extern void T80x2052T0(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_start */
extern void T80x2051T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS_FILTER.set_next */
extern void T93x5270T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_xml_declaration */
extern void T94x5287T0T0T1(T0* C, T0* a1, T0* a2, T1 a3);
/* Call to XM_CALLBACKS.on_attribute */
extern void T94x5292T0T0T0T0(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* Call to XM_CALLBACKS.on_error */
extern void T94x5288T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_end_tag */
extern void T94x5294T0T0T0(T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_start_tag_finish */
extern void T94x5293(T0* C);
/* Call to XM_CALLBACKS.on_start_tag */
extern void T94x5291T0T0T0(T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_content */
extern void T94x5295T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_processing_instruction */
extern void T94x5289T0T0(T0* C, T0* a1, T0* a2);
/* Call to XM_CALLBACKS.on_comment */
extern void T94x5290T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_finish */
extern void T94x5286(T0* C);
/* Call to XM_CALLBACKS.on_start */
extern void T94x5285(T0* C);
/* Call to XM_EIFFEL_SCANNER.close_input */
extern void T128x6773(T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T128x6772T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.set_encoding */
extern void T128x6778T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T128x6769(T0* C);
/* Call to XM_EIFFEL_SCANNER.read_token */
extern void T128x6913(T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_stream */
extern void T128x6771T0(T0* C, T0* a1);
/* Call to XM_NODE.process */
extern void T192x5876T0(T0* C, T0* a1);
/* Call to XM_NODE.node_set_parent */
extern void T192x5874T0(T0* C, T0* a1);
/* Call to GEANT_TASK.execute */
extern void T279x8548(T0* C);
/* Call to LX_TRANSITION [LX_NFA_STATE].record */
extern void T517x13305T0(T0* C, T0* a1);
/* GEANT.make */
extern T0* T21c20(void);
/* GEANT_PROJECT.build */
extern void T22f28(T0* C, T0* a1);
/* GEANT_PROJECT.build_target */
extern void T22f38(T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].remove */
extern void T101f10(T0* C);
/* DS_ARRAYED_STACK [GEANT_TARGET].remove */
extern void T187f10(T0* C);
/* GEANT_PROJECT.execute_target */
extern void T22f40(T0* C, T0* a1, T0* a2, T1 a3, T1 a4);
/* GEANT_TARGET.execute */
extern void T26f90(T0* C);
/* GEANT_TARGET.set_executed */
extern void T26f95(T0* C, T1 a1);
/* GEANT_TARGET.has_attribute */
extern T1 T26f35(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].forth */
extern void T191f11(T0* C);
/* XM_DOCUMENT.cursor_forth */
extern void T96f24(T0* C, T0* a1);
/* XM_DOCUMENT.add_traversing_cursor */
extern void T96f28(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_next_cursor */
extern void T191f16(T0* C, T0* a1);
/* XM_DOCUMENT.remove_traversing_cursor */
extern void T96f29(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set */
extern void T191f14(T0* C, T0* a1, T1 a2, T1 a3);
/* XM_ELEMENT.cursor_forth */
extern void T97f38(T0* C, T0* a1);
/* XM_ELEMENT.add_traversing_cursor */
extern void T97f41(T0* C, T0* a1);
/* XM_ELEMENT.remove_traversing_cursor */
extern void T97f42(T0* C, T0* a1);
/* GEANT_TARGET.execute_task */
extern void T26f94(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.make */
extern T0* T306c30(T0* a1, T0* a2);
/* GEANT_REPLACE_COMMAND.set_fileset */
extern void T390f37(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.make */
extern T0* T361c29(T0* a1, T0* a2);
/* GEANT_FILESET.set_map */
extern void T362f50(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.make */
extern T0* T406c12(T0* a1, T0* a2);
/* GEANT_MAP.set_map */
extern void T407f21(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.map_element_name */
extern unsigned char ge138os9679;
extern T0* ge138ov9679;
extern T0* T406f9(T0* C);
/* GEANT_MAP.set_target_pattern */
extern void T407f20(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.to_attribute_name */
extern unsigned char ge138os9678;
extern T0* ge138ov9678;
extern T0* T406f7(T0* C);
/* GEANT_MAP.set_source_pattern */
extern void T407f19(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.from_attribute_name */
extern unsigned char ge138os9677;
extern T0* ge138ov9677;
extern T0* T406f6(T0* C);
/* GEANT_MAP.set_type */
extern void T407f18(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.attribute_value */
extern T0* T406f5(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.project_variables_resolver */
extern unsigned char ge61os1712;
extern T0* ge61ov1712;
extern T0* T406f11(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.make */
extern T0* T58c16(void);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.set_variables */
extern void T245f5(T0* C, T0* a1);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.make */
extern T0* T245c4(void);
/* GEANT_MAP_ELEMENT.target_arguments_stack */
extern unsigned char ge61os1713;
extern T0* ge61ov1713;
extern T0* T406f10(T0* C);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].make */
extern T0* T101c8(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].make */
extern T0* T178f1(T0* C, T6 a1);
/* TO_SPECIAL [GEANT_ARGUMENT_VARIABLES].make_area */
extern T0* T242c2(T6 a1);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].make */
extern T0* T177c4(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].default_create */
extern T0* T178c3(void);
/* GEANT_MAP_ELEMENT.has_attribute */
extern T1 T406f4(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.type_attribute_name */
extern unsigned char ge138os9676;
extern T0* ge138ov9676;
extern T0* T406f8(T0* C);
/* GEANT_MAP.make */
extern T0* T407c17(T0* a1);
/* GEANT_MAP.type_attribute_value_identity */
extern unsigned char ge137os9692;
extern T0* ge137ov9692;
extern T0* T407f13(T0* C);
/* GEANT_MAP_ELEMENT.make */
extern void T406f12p1(T0* C, T0* a1, T0* a2);
/* GEANT_MAP_ELEMENT.set_project */
extern void T406f14(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.element_make */
extern void T406f13(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.set_xml_element */
extern void T406f15(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.map_element_name */
extern unsigned char ge132os9517;
extern T0* ge132ov9517;
extern T0* T361f21(T0* C);
/* GEANT_FILESET.add_single_exclude */
extern void T362f49(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].force_last */
extern void T412f37(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].slots_put */
extern void T412f47(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING_8].clashes_put */
extern void T412f46(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING_8].slots_item */
extern T6 T412f21(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].hash_position */
extern T6 T412f18(T0* C, T0* a1);
/* UC_UTF8_STRING.hash_code */
extern T6 T195f15(T0* C);
/* UC_UTF8_STRING.string */
extern T0* T195f34(T0* C);
/* KL_INTEGER_ROUTINES.to_character */
extern T2 T197f2(T0* C, T6 a1);
/* UC_UTF8_STRING.integer_ */
extern unsigned char ge171os4950;
extern T0* ge171ov4950;
extern T0* T195f23(T0* C);
/* KL_INTEGER_ROUTINES.default_create */
extern T0* T197c4(void);
/* INTEGER_32.infix "<=" */
extern T1 T6f9(T6* C, T6 a1);
/* STRING_8.append_character */
extern void T17f34(T0* C, T2 a1);
/* STRING_8.resize */
extern void T17f37(T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].aliased_resized_area */
extern T0* T15f2(T0* C, T6 a1);
/* INTEGER_32.infix ">=" */
extern T1 T6f5(T6* C, T6 a1);
/* STRING_8.additional_space */
extern T6 T17f6(T0* C);
/* INTEGER_32.max */
extern T6 T6f10(T6* C, T6 a1);
/* STRING_8.capacity */
extern T6 T17f5(T0* C);
/* UC_UTF8_STRING.byte_item */
extern T2 T195f20(T0* C, T6 a1);
/* UC_UTF8_STRING.old_item */
extern T2 T195f33(T0* C, T6 a1);
/* UC_UTF8_STRING.set_count */
extern void T195f61(T0* C, T6 a1);
/* UC_UTF8_STRING.reset_byte_index_cache */
extern void T195f69(T0* C);
/* STRING_8.make */
extern void T17f33(T0* C, T6 a1);
/* STRING_8.make */
extern T0* T17c33(T6 a1);
/* STRING_8.make_area */
extern void T17f36(T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].make */
extern T0* T15c9(T6 a1);
/* UC_UTF8_STRING.next_byte_index */
extern T6 T195f24(T0* C, T6 a1);
/* UC_UTF8_ROUTINES.encoded_byte_count */
extern T6 T194f3(T0* C, T2 a1);
/* CHARACTER_8.infix "<=" */
extern T1 T2f17(T2* C, T2 a1);
/* CHARACTER_8.infix "<" */
extern T1 T2f5(T2* C, T2 a1);
/* UC_UTF8_STRING.utf8 */
extern unsigned char ge235os5566;
extern T0* ge235ov5566;
extern T0* T195f25(T0* C);
/* UC_UTF8_ROUTINES.default_create */
extern T0* T194c36(void);
/* KL_PLATFORM.maximum_character_code */
extern unsigned char ge305os7984;
extern T6 ge305ov7984;
extern T6 T198f1(T0* C);
/* KL_PLATFORM.old_maximum_character_code */
extern T6 T198f3(T0* C);
/* UC_UTF8_STRING.platform */
extern unsigned char ge225os4079;
extern T0* ge225ov4079;
extern T0* T195f22(T0* C);
/* KL_PLATFORM.default_create */
extern T0* T198c5(void);
/* UC_UTF8_STRING.item_code_at_byte_index */
extern T6 T195f21(T0* C, T6 a1);
/* UC_UTF8_ROUTINES.encoded_next_value */
extern T6 T194f6(T0* C, T2 a1);
/* UC_UTF8_ROUTINES.encoded_first_value */
extern T6 T194f4(T0* C, T2 a1);
/* UC_UTF8_STRING.hash_code */
extern T6 T195f15p1(T0* C);
/* INTEGER_32.infix "|<<" */
extern T6 T6f11(T6* C, T6 a1);
/* STRING_8.hash_code */
extern T6 T17f7(T0* C);
/* DS_HASH_SET [STRING_8].resize */
extern void T412f45(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].clashes_resize */
extern void T412f51(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].resize */
extern T0* T65f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [INTEGER_32].resized_area */
extern T0* T63f3(T0* C, T6 a1);
/* SPECIAL [INTEGER_32].copy_data */
extern void T63f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER_32].move_data */
extern void T63f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].overlapping_move */
extern void T63f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].non_overlapping_move */
extern void T63f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].make */
extern T0* T63c5(T6 a1);
/* DS_HASH_SET [STRING_8].special_integer_ */
extern unsigned char ge172os2089;
extern T0* ge172ov2089;
extern T0* T412f19(T0* C);
/* KL_SPECIAL_ROUTINES [INTEGER_32].default_create */
extern T0* T65c4(void);
/* DS_HASH_SET [STRING_8].key_storage_resize */
extern void T412f50(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_resize */
extern void T412f49(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].resize */
extern T0* T66f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].resized_area */
extern T0* T32f3(T0* C, T6 a1);
/* SPECIAL [STRING_8].copy_data */
extern void T32f8(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [STRING_8].move_data */
extern void T32f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].overlapping_move */
extern void T32f11(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].non_overlapping_move */
extern void T32f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].make */
extern T0* T32c6(T6 a1);
/* DS_HASH_SET [STRING_8].key_storage_item */
extern T0* T412f24(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_item */
extern T0* T412f31(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].clashes_item */
extern T6 T412f25(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].slots_resize */
extern void T412f48(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].new_modulus */
extern T6 T412f22(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].new_capacity */
extern T6 T412f17(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_put */
extern void T412f44(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [STRING_8].search_position */
extern void T412f43(T0* C, T0* a1);
/* UC_STRING_EQUALITY_TESTER.test */
extern T1 T59f1(T0* C, T0* a1, T0* a2);
/* UC_STRING_EQUALITY_TESTER.string_ */
extern unsigned char ge174os1718;
extern T0* ge174ov1718;
extern T0* T59f2(T0* C);
/* KL_STRING_ROUTINES.default_create */
extern T0* T76c19(void);
/* DS_HASH_SET [STRING_8].key_equality_tester */
extern T0* T412f23(T0* C);
/* DS_HASH_SET [STRING_8].unset_found_item */
extern void T412f42(T0* C);
/* GEANT_FILESET_ELEMENT.exclude_element_name */
extern unsigned char ge132os9516;
extern T0* ge132ov9516;
extern T0* T361f19(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].forth */
extern void T117f9(T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_forth */
extern void T116f11(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].add_traversing_cursor */
extern void T116f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].set_next_cursor */
extern void T117f11(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].remove_traversing_cursor */
extern void T116f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].set */
extern void T117f10(T0* C, T0* a1, T1 a2, T1 a3);
/* GEANT_FILESET.add_single_include */
extern void T362f48(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.name */
extern T0* T367f4(T0* C);
/* GEANT_DEFINE_ELEMENT.attribute_value */
extern T0* T367f14(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.project_variables_resolver */
extern T0* T367f6(T0* C);
/* GEANT_DEFINE_ELEMENT.target_arguments_stack */
extern T0* T367f15(T0* C);
/* GEANT_DEFINE_ELEMENT.name_attribute_name */
extern unsigned char ge139os7792;
extern T0* ge139ov7792;
extern T0* T367f13(T0* C);
/* GEANT_DEFINE_ELEMENT.has_name */
extern T1 T367f10(T0* C);
/* GEANT_DEFINE_ELEMENT.has_attribute */
extern T1 T367f9(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.is_enabled */
extern T1 T367f7(T0* C);
/* GEANT_DEFINE_ELEMENT.unless_attribute_name */
extern unsigned char ge136os2384;
extern T0* ge136ov2384;
extern T0* T367f11(T0* C);
/* BOOLEAN.out */
extern T0* T1f6(T1* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.boolean_condition_value */
extern T1 T58f8(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.string_ */
extern T0* T58f2(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.exit_application */
extern void T58f18(T0* C, T6 a1, T0* a2);
/* KL_EXCEPTIONS.die */
extern void T48f2(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.exceptions */
extern unsigned char ge222os1720;
extern T0* ge222ov1720;
extern T0* T58f15(T0* C);
/* KL_EXCEPTIONS.default_create */
extern T0* T48c1(void);
/* KL_STDERR_FILE.put_line */
extern void T47f12(T0* C, T0* a1);
/* KL_STDERR_FILE.put_new_line */
extern void T47f11(T0* C);
/* KL_STDERR_FILE.put_string */
extern void T47f10(T0* C, T0* a1);
/* KL_STDERR_FILE.old_put_string */
extern void T47f14(T0* C, T0* a1);
/* KL_STDERR_FILE.console_ps */
extern void T47f17(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STRING_ROUTINES.as_string */
extern T0* T76f2(T0* C, T0* a1);
/* STRING_8.string */
extern T0* T17f13(T0* C);
/* STRING_8.append */
extern void T17f35(T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].copy_data */
extern void T15f8(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [CHARACTER_8].move_data */
extern void T15f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].overlapping_move */
extern void T15f12(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].non_overlapping_move */
extern void T15f11(T0* C, T6 a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.as_string */
extern T0* T195f30(T0* C);
/* UC_UTF8_STRING.to_utf8 */
extern T0* T195f18(T0* C);
/* KL_ANY_ROUTINES.same_types */
extern T1 T83f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.any_ */
extern unsigned char ge166os1926;
extern T0* ge166ov1926;
extern T0* T76f8(T0* C);
/* KL_ANY_ROUTINES.default_create */
extern T0* T83c3(void);
/* KL_STDERR_FILE.string_ */
extern T0* T47f6(T0* C);
/* ARRAY [STRING_8].item */
extern T0* T33f4(T0* C, T6 a1);
/* KL_STANDARD_FILES.error */
extern unsigned char ge206os3126;
extern T0* ge206ov3126;
extern T0* T46f1(T0* C);
/* KL_STDERR_FILE.make */
extern T0* T47c9(void);
/* KL_STDERR_FILE.make_open_stderr */
extern void T47f13(T0* C, T0* a1);
/* KL_STDERR_FILE.set_write_mode */
extern void T47f16(T0* C);
/* KL_STDERR_FILE.console_def */
extern T14 T47f4(T0* C, T6 a1);
/* KL_STDERR_FILE.old_make */
extern void T47f15(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.std */
extern unsigned char ge204os1722;
extern T0* ge204ov1722;
extern T0* T58f14(T0* C);
/* KL_STANDARD_FILES.default_create */
extern T0* T46c3(void);
/* GEANT_PROJECT_VARIABLE_RESOLVER.has */
extern T1 T58f5(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.variable_value */
extern T0* T100f5(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.get */
extern T0* T82f4(T0* C, T0* a1);
/* STRING_8.make_from_c */
extern T0* T17c43(T14 a1);
/* STRING_8.from_c */
extern void T17f46(T0* C, T14 a1);
/* C_STRING.read_string_into */
extern void T182f7(T0* C, T0* a1);
/* C_STRING.read_substring_into */
extern void T182f9(T0* C, T0* a1, T6 a2, T6 a3);
/* STRING_8.put_code */
extern void T17f50(T0* C, T10 a1, T6 a2);
/* NATURAL_8.to_natural_32 */
extern T10 T8f7(T8* C);
/* MANAGED_POINTER.read_natural_8 */
extern T8 T250f6(T0* C, T6 a1);
/* TYPED_POINTER [NATURAL_8].memory_copy */
extern void T328f2(T328* C, T14 a1, T6 a2);
/* TYPED_POINTER [NATURAL_8].c_memcpy */
extern void T328f3(T328* C, T14 a1, T14 a2, T6 a3);
/* C_STRING.share_from_pointer */
extern void T182f6(T0* C, T14 a1);
/* C_STRING.share_from_pointer_and_count */
extern void T182f8(T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.set_from_pointer */
extern void T250f9(T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.share_from_pointer */
extern T0* T250c8(T14 a1, T6 a2);
/* C_STRING.c_strlen */
extern T6 T182f3(T0* C, T14 a1);
/* STRING_8.c_string_provider */
extern unsigned char ge2231os1257;
extern T0* ge2231ov1257;
extern T0* T17f26(T0* C);
/* C_STRING.make_empty */
extern void T182f5(T0* C, T6 a1);
/* C_STRING.make_empty */
extern T0* T182c5(T6 a1);
/* MANAGED_POINTER.make */
extern T0* T250c7(T6 a1);
/* EXCEPTIONS.raise */
extern void T329f3(T0* C, T0* a1);
/* EXCEPTIONS.eraise */
extern void T329f4(T0* C, T14 a1, T6 a2);
/* EXCEPTIONS.default_create */
extern T0* T329c2(void);
/* MANAGED_POINTER.default_pointer */
extern T14 T250f5(T0* C);
/* POINTER.memory_calloc */
extern T14 T14f2(T14* C, T6 a1, T6 a2);
/* POINTER.c_calloc */
extern T14 T14f3(T14* C, T6 a1, T6 a2);
/* EXECUTION_ENVIRONMENT.eif_getenv */
extern T14 T82f3(T0* C, T14 a1);
/* KL_EXECUTION_ENVIRONMENT.string_ */
extern T0* T100f3(T0* C);
/* KL_EXECUTION_ENVIRONMENT.environment_impl */
extern unsigned char ge284os6114;
extern T0* ge284ov6114;
extern T0* T100f2(T0* C);
/* EXECUTION_ENVIRONMENT.default_create */
extern T0* T82c6(void);
/* GEANT_PROJECT_VARIABLE_RESOLVER.execution_environment */
extern unsigned char ge223os1719;
extern T0* ge223ov1719;
extern T0* T58f6(T0* C);
/* KL_EXECUTION_ENVIRONMENT.default_create */
extern T0* T100c7(void);
/* GEANT_PROJECT_VARIABLES.found */
extern T1 T25f44(T0* C);
/* GEANT_PROJECT_VARIABLES.search */
extern void T25f80(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.search_position */
extern void T25f65(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.clashes_item */
extern T6 T25f21(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.hash_position */
extern T6 T25f33(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.key_storage_item */
extern T0* T25f27(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.slots_item */
extern T6 T25f22(T0* C, T6 a1);
/* GEANT_VARIABLES.found */
extern T1 T29f36(T0* C);
/* GEANT_VARIABLES.search */
extern void T29f67(T0* C, T0* a1);
/* GEANT_VARIABLES.search_position */
extern void T29f51(T0* C, T0* a1);
/* GEANT_VARIABLES.clashes_item */
extern T6 T29f27(T0* C, T6 a1);
/* GEANT_VARIABLES.hash_position */
extern T6 T29f24(T0* C, T0* a1);
/* GEANT_VARIABLES.key_storage_item */
extern T0* T29f28(T0* C, T6 a1);
/* GEANT_VARIABLES.slots_item */
extern T6 T29f29(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.commandline_variables */
extern unsigned char ge61os1705;
extern T0* ge61ov1705;
extern T0* T58f4(T0* C);
/* GEANT_VARIABLES.make */
extern T0* T29c45(void);
/* GEANT_VARIABLES.set_key_equality_tester */
extern void T29f49(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].internal_set_equality_tester */
extern void T61f6(T0* C, T0* a1);
/* UC_STRING_EQUALITY_TESTER.default_create */
extern T0* T59c3(void);
/* GEANT_VARIABLES.make_map */
extern void T29f48(T0* C, T6 a1);
/* GEANT_VARIABLES.make_with_equality_testers */
extern void T29f57(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].make */
extern T0* T61c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].new_cursor */
extern T0* T61f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8].make */
extern T0* T102c3(T0* a1);
/* GEANT_VARIABLES.make_sparse_container */
extern void T29f62(T0* C, T6 a1);
/* GEANT_VARIABLES.unset_found_item */
extern void T29f50(T0* C);
/* GEANT_VARIABLES.make_slots */
extern void T29f66(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].make */
extern T0* T65f2(T0* C, T6 a1);
/* TO_SPECIAL [INTEGER_32].make_area */
extern T0* T103c2(T6 a1);
/* GEANT_VARIABLES.special_integer_ */
extern T0* T29f26(T0* C);
/* GEANT_VARIABLES.new_modulus */
extern T6 T29f33(T0* C, T6 a1);
/* GEANT_VARIABLES.make_clashes */
extern void T29f65(T0* C, T6 a1);
/* GEANT_VARIABLES.make_key_storage */
extern void T29f64(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].make */
extern T0* T66f2(T0* C, T6 a1);
/* TO_SPECIAL [STRING_8].make_area */
extern T0* T104c2(T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].default_create */
extern T0* T66c3(void);
/* GEANT_VARIABLES.make_item_storage */
extern void T29f63(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.found */
extern T1 T34f33(T0* C);
/* GEANT_ARGUMENT_VARIABLES.search */
extern void T34f68(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.search_position */
extern void T34f51(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.clashes_item */
extern T6 T34f27(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.hash_position */
extern T6 T34f24(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.key_storage_item */
extern T0* T34f28(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.slots_item */
extern T6 T34f29(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.target_arguments_stack */
extern T0* T58f3(T0* C);
/* UC_UTF8_STRING.substring */
extern T0* T195f11(T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.make_from_substring */
extern T0* T195c60(T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.put_substring_at_byte_index */
extern void T195f68(T0* C, T0* a1, T6 a2, T6 a3, T6 a4, T6 a5);
/* UC_UTF8_STRING.item_code */
extern T6 T195f14(T0* C, T6 a1);
/* STRING_8.item_code */
extern T6 T17f12(T0* C, T6 a1);
/* UC_UTF8_STRING.put_code_at_byte_index */
extern void T195f73(T0* C, T6 a1, T6 a2, T6 a3);
/* UC_UTF8_ROUTINES.code_byte_count */
extern T6 T194f24(T0* C, T6 a1);
/* UC_UTF8_STRING.byte_index */
extern T6 T195f26(T0* C, T6 a1);
/* UC_UTF8_STRING.put_character_at_byte_index */
extern void T195f67(T0* C, T2 a1, T6 a2, T6 a3);
/* UC_UTF8_ROUTINES.character_byte_count */
extern T6 T194f23(T0* C, T2 a1);
/* UC_UTF8_STRING.put_byte */
extern void T195f71(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.old_put */
extern void T195f66(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.any_ */
extern T0* T195f36(T0* C);
/* UC_UTF8_ROUTINES.substring_byte_count */
extern T6 T194f22(T0* C, T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.shifted_byte_index */
extern T6 T195f43(T0* C, T6 a1, T6 a2);
/* UC_UTF8_ROUTINES.dummy_uc_string */
extern unsigned char ge247os7889;
extern T0* ge247ov7889;
extern T0* T194f27(T0* C);
/* UC_STRING.make_empty */
extern T0* T112c8(void);
/* UC_STRING.make */
extern void T112f9(T0* C, T6 a1);
/* UC_STRING.old_set_count */
extern void T112f12(T0* C, T6 a1);
/* UC_STRING.set_count */
extern void T112f11(T0* C, T6 a1);
/* UC_STRING.byte_capacity */
extern T6 T112f7(T0* C);
/* UC_STRING.capacity */
extern T6 T112f7p1(T0* C);
/* UC_STRING.make */
extern void T112f9p1(T0* C, T6 a1);
/* UC_STRING.make_area */
extern void T112f13(T0* C, T6 a1);
/* UC_STRING.reset_byte_index_cache */
extern void T112f10(T0* C);
/* UC_UTF8_ROUTINES.any_ */
extern T0* T194f25(T0* C);
/* UC_UTF8_STRING.cloned_string */
extern T0* T195f40(T0* C);
/* UC_UTF8_STRING.twin */
extern T0* T195f42(T0* C);
/* UC_UTF8_STRING.copy */
extern void T195f77(T0* C, T0* a1);
/* UC_UTF8_STRING.copy */
extern void T195f77p1(T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].twin */
extern T0* T15f4(T0* C);
/* UC_UTF8_STRING.make */
extern void T195f59(T0* C, T6 a1);
/* UC_UTF8_STRING.make */
extern T0* T195c59(T6 a1);
/* UC_UTF8_STRING.old_set_count */
extern void T195f63(T0* C, T6 a1);
/* UC_UTF8_STRING.byte_capacity */
extern T6 T195f38(T0* C);
/* UC_UTF8_STRING.capacity */
extern T6 T195f38p1(T0* C);
/* UC_UTF8_STRING.make */
extern void T195f59p1(T0* C, T6 a1);
/* UC_UTF8_STRING.make_area */
extern void T195f70(T0* C, T6 a1);
/* STRING_8.substring */
extern T0* T17f10(T0* C, T6 a1, T6 a2);
/* STRING_8.set_count */
extern void T17f41(T0* C, T6 a1);
/* STRING_8.new_string */
extern T0* T17f19(T0* C, T6 a1);
/* UC_UTF8_STRING.item */
extern T2 T195f10(T0* C, T6 a1);
/* UC_UTF8_STRING.character_item_at_byte_index */
extern T2 T195f27(T0* C, T6 a1);
/* STRING_8.item */
extern T2 T17f9(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].item */
extern T0* T71f14(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.string_tokens */
extern T0* T58f10(T0* C, T0* a1, T2 a2);
/* DS_ARRAYED_LIST [STRING_8].force_last */
extern void T71f27(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].resize */
extern void T71f28(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].new_capacity */
extern T6 T71f19(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].extendible */
extern T1 T71f18(T0* C, T6 a1);
/* UC_UTF8_STRING.index_of */
extern T6 T195f17(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.index_of_item_code */
extern T6 T195f32(T0* C, T6 a1, T6 a2);
/* STRING_8.index_of */
extern T6 T17f24(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.keep_head */
extern void T195f74(T0* C, T6 a1);
/* STRING_8.keep_head */
extern void T17f49(T0* C, T6 a1);
/* UC_UTF8_STRING.keep_tail */
extern void T195f76(T0* C, T6 a1);
/* UC_UTF8_STRING.move_bytes_left */
extern void T195f79(T0* C, T6 a1, T6 a2);
/* STRING_8.keep_tail */
extern void T17f48(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].make */
extern T0* T71c23(T6 a1);
/* DS_ARRAYED_LIST [STRING_8].new_cursor */
extern T0* T71f9(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].make */
extern T0* T72c7(T0* a1);
/* KL_STRING_ROUTINES.cloned_string */
extern T0* T76f7(T0* C, T0* a1);
/* STRING_8.twin */
extern T0* T17f16(T0* C);
/* STRING_8.copy */
extern void T17f40(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.if_attribute_name */
extern unsigned char ge136os2383;
extern T0* ge136ov2383;
extern T0* T367f8(T0* C);
/* GEANT_DEFINE_ELEMENT.make */
extern T0* T367c16(T0* a1, T0* a2);
/* GEANT_DEFINE_ELEMENT.set_project */
extern void T367f18(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.element_make */
extern void T367f17(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.set_xml_element */
extern void T367f19(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].item */
extern T0* T117f6(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].start */
extern void T117f8(T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_start */
extern void T116f10(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_off */
extern T1 T116f7(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].new_cursor */
extern T0* T116f5(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].make */
extern T0* T117c7(T0* a1);
/* GEANT_FILESET_ELEMENT.elements_by_name */
extern T0* T361f18(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].force_last */
extern void T116f9(T0* C, T0* a1);
/* DS_LINKABLE [XM_ELEMENT].put_right */
extern void T200f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_ELEMENT].make */
extern T0* T200c3(T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].is_empty */
extern T1 T116f6(T0* C);
/* GEANT_FILESET_ELEMENT.string_ */
extern T0* T361f26(T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].make */
extern T0* T116c8(void);
/* GEANT_FILESET_ELEMENT.include_element_name */
extern unsigned char ge132os9515;
extern T0* ge132ov9515;
extern T0* T361f17(T0* C);
/* GEANT_FILESET.set_convert_to_filesystem */
extern void T362f34(T0* C, T1 a1);
/* GEANT_FILESET_ELEMENT.convert_attribute_name */
extern unsigned char ge132os9513;
extern T0* ge132ov9513;
extern T0* T361f16(T0* C);
/* GEANT_FILESET.set_mapped_filename_directory_name */
extern void T362f47(T0* C, T0* a1);
/* GEANT_FILESET.set_filename_directory_name */
extern void T362f46(T0* C, T0* a1);
/* GEANT_FILESET.set_mapped_filename_variable_name */
extern void T362f45(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.mapped_filename_variable_name_attribute_name */
extern unsigned char ge132os9511;
extern T0* ge132ov9511;
extern T0* T361f15(T0* C);
/* GEANT_FILESET.set_filename_variable_name */
extern void T362f44(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.filename_variable_name_attribute_name */
extern unsigned char ge132os9510;
extern T0* ge132ov9510;
extern T0* T361f14(T0* C);
/* GEANT_FILESET.set_concat */
extern void T362f43(T0* C, T1 a1);
/* GEANT_FILESET.set_force */
extern void T362f42(T0* C, T1 a1);
/* GEANT_FILESET_ELEMENT.boolean_value */
extern T1 T361f13(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.std */
extern T0* T361f22(T0* C);
/* GEANT_FILESET_ELEMENT.false_attribute_value */
extern unsigned char ge129os2397;
extern T0* ge129ov2397;
extern T0* T361f28(T0* C);
/* GEANT_FILESET_ELEMENT.true_attribute_value */
extern unsigned char ge129os2396;
extern T0* ge129ov2396;
extern T0* T361f27(T0* C);
/* GEANT_FILESET_ELEMENT.force_attribute_name */
extern unsigned char ge132os9508;
extern T0* ge132ov9508;
extern T0* T361f12(T0* C);
/* GEANT_FILESET.set_exclude_wc_string */
extern void T362f41(T0* C, T0* a1);
/* LX_DFA_WILDCARD.is_compiled */
extern T1 T415f11(T0* C);
/* LX_DFA_WILDCARD.compile */
extern T0* T415c14(T0* a1, T1 a2);
/* LX_FULL_DFA.make */
extern T0* T440c37(T0* a1);
/* LX_FULL_DFA.build */
extern void T440f40(T0* C);
/* LX_FULL_DFA.build_accept_table */
extern void T440f46(T0* C);
/* ARRAY [INTEGER_32].put */
extern void T193f12(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [LX_RULE].first */
extern T0* T464f11(T0* C);
/* ARRAY [INTEGER_32].make */
extern T0* T193c9(T6 a1, T6 a2);
/* ARRAY [INTEGER_32].make_area */
extern void T193f10(T0* C, T6 a1);
/* LX_FULL_DFA.build_nxt_table */
extern void T440f45(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].target */
extern T0* T494f6(T0* C, T6 a1);
/* ARRAY [LX_DFA_STATE].item */
extern T0* T539f4(T0* C, T6 a1);
/* LX_DFA_STATE.is_accepting */
extern T1 T489f10(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].is_empty */
extern T1 T464f10(T0* C);
/* LX_FULL_DFA.build_transitions */
extern void T440f44(T0* C, T0* a1);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].set_target */
extern void T494f8(T0* C, T0* a1, T6 a2);
/* ARRAY [LX_DFA_STATE].put */
extern void T539f7(T0* C, T0* a1, T6 a2);
/* LX_SYMBOL_PARTITIONS.previous_symbol */
extern T6 T492f4(T0* C, T6 a1);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].item */
extern T0* T523f4(T0* C, T6 a1);
/* LX_FULL_DFA.new_state */
extern T0* T440f36(T0* C, T0* a1);
/* LX_DFA_STATE.set_id */
extern void T489f17(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].put_last */
extern void T491f9(T0* C, T0* a1);
/* LX_DFA_STATE.is_equal */
extern T1 T489f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].is_equal */
extern T1 T490f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].any_ */
extern T0* T490f21(T0* C);
/* LX_DFA_STATE.any_ */
extern T0* T489f14(T0* C);
/* LX_DFA_STATE.new_state */
extern T0* T489f9(T0* C, T6 a1);
/* LX_DFA_STATE.make */
extern T0* T489c16(T0* a1, T6 a2, T6 a3);
/* LX_RULE.set_useful */
extern void T474f22(T0* C, T1 a1);
/* DS_ARRAYED_LIST [LX_RULE].sort */
extern void T464f16(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_RULE].sort */
extern void T529f3(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_RULE].sort_with_comparator */
extern void T529f4(T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [LX_RULE].subsort_with_comparator */
extern void T529f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* DS_ARRAYED_LIST [LX_RULE].replace */
extern void T464f21(T0* C, T0* a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [LX_RULE].less_than */
extern T1 T548f1(T0* C, T0* a1, T0* a2);
/* LX_RULE.infix "<" */
extern T1 T474f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].item */
extern T0* T464f6(T0* C, T6 a1);
/* LX_DFA_STATE.rule_sorter */
extern unsigned char ge321os11487;
extern T0* ge321ov11487;
extern T0* T489f7(T0* C);
/* DS_BUBBLE_SORTER [LX_RULE].make */
extern T0* T529c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [LX_RULE].make */
extern T0* T548c2(void);
/* DS_ARRAYED_LIST [LX_NFA_STATE].sort */
extern void T490f29(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].sort */
extern void T527f3(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].sort_with_comparator */
extern void T527f4(T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].subsort_with_comparator */
extern void T527f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* DS_ARRAYED_LIST [LX_NFA_STATE].replace */
extern void T490f26(T0* C, T0* a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE].less_than */
extern T1 T551f1(T0* C, T0* a1, T0* a2);
/* LX_NFA_STATE.infix "<" */
extern T1 T497f8(T0* C, T0* a1);
/* LX_DFA_STATE.bubble_sorter */
extern unsigned char ge321os11486;
extern T0* ge321ov11486;
extern T0* T489f8(T0* C);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].make */
extern T0* T527c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE].make */
extern T0* T551c2(void);
/* DS_ARRAYED_LIST [LX_NFA_STATE].last */
extern T0* T490f9(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].is_empty */
extern T1 T490f8(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].force_last */
extern void T464f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].resize */
extern void T464f14(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].resize */
extern T0* T506f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_RULE].resized_area */
extern T0* T487f3(T0* C, T6 a1);
/* SPECIAL [LX_RULE].copy_data */
extern void T487f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [LX_RULE].move_data */
extern void T487f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_RULE].overlapping_move */
extern void T487f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_RULE].non_overlapping_move */
extern void T487f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_RULE].make */
extern T0* T487c4(T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].new_capacity */
extern T6 T464f9(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].extendible */
extern T1 T464f8(T0* C, T6 a1);
/* LX_NFA_STATE.is_accepting_head */
extern T1 T497f6(T0* C);
/* LX_NFA_STATE.has_transition */
extern T1 T497f9(T0* C);
/* LX_NFA_STATE.is_accepting */
extern T1 T497f7(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].has */
extern T1 T490f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].force_last */
extern void T490f27(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].resize */
extern void T490f31(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].resize */
extern T0* T533f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_NFA_STATE].resized_area */
extern T0* T531f3(T0* C, T6 a1);
/* SPECIAL [LX_NFA_STATE].copy_data */
extern void T531f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [LX_NFA_STATE].move_data */
extern void T531f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_NFA_STATE].overlapping_move */
extern void T531f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_NFA_STATE].non_overlapping_move */
extern void T531f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_NFA_STATE].make */
extern T0* T531c4(T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].new_capacity */
extern T6 T490f13(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].extendible */
extern T1 T490f12(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].make */
extern T0* T464c12(T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].new_cursor */
extern T0* T464f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_RULE].make */
extern T0* T507c4(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].make */
extern T0* T506f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_RULE].make_area */
extern T0* T554c2(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].default_create */
extern T0* T506c3(void);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].make */
extern T0* T494c7(T6 a1, T6 a2);
/* KL_ARRAY_ROUTINES [LX_DFA_STATE].default_create */
extern T0* T540c1(void);
/* ARRAY [LX_DFA_STATE].make */
extern T0* T539c5(T6 a1, T6 a2);
/* ARRAY [LX_DFA_STATE].make_area */
extern void T539f6(T0* C, T6 a1);
/* SPECIAL [LX_DFA_STATE].make */
extern T0* T536c4(T6 a1);
/* LX_DFA_STATE.maximum_symbol */
extern T6 T489f13(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].upper */
extern T6 T494f5(T0* C);
/* LX_DFA_STATE.minimum_symbol */
extern T6 T489f12(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].lower */
extern T6 T494f4(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put_last */
extern void T490f24(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].item */
extern T0* T490f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].make */
extern T0* T490c23(T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].new_cursor */
extern T0* T490f11(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].make */
extern T0* T534c7(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].make */
extern T0* T533f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_NFA_STATE].make_area */
extern T0* T557c2(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].default_create */
extern T0* T533c3(void);
/* LX_SYMBOL_PARTITIONS.is_representative */
extern T1 T492f8(T0* C, T6 a1);
/* ARRAY [BOOLEAN].item */
extern T1 T418f4(T0* C, T6 a1);
/* LX_DFA_STATE.partition */
extern void T489f18(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.initialize */
extern void T492f10(T0* C);
/* ARRAY [BOOLEAN].clear_all */
extern void T418f7(T0* C);
/* SPECIAL [BOOLEAN].clear_all */
extern void T151f6(T0* C);
/* LX_SYMBOL_PARTITIONS.initialize */
extern void T492f10p1(T0* C);
/* DS_BILINKABLE [INTEGER_32].put_left */
extern void T521f9(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].attach_right */
extern void T521f10(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].put */
extern void T521f5(T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.lower */
extern T6 T492f7(T0* C);
/* LX_SYMBOL_PARTITIONS.upper */
extern T6 T492f6(T0* C);
/* LX_FULL_DFA.resize */
extern void T440f49(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].resize */
extern void T491f10(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].resize */
extern T0* T537f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_DFA_STATE].resized_area */
extern T0* T536f3(T0* C, T6 a1);
/* SPECIAL [LX_DFA_STATE].copy_data */
extern void T536f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [LX_DFA_STATE].move_data */
extern void T536f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_DFA_STATE].overlapping_move */
extern void T536f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_DFA_STATE].non_overlapping_move */
extern void T536f8(T0* C, T6 a1, T6 a2, T6 a3);
/* LX_SYMBOL_PARTITIONS.capacity */
extern T6 T492f5(T0* C);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].count */
extern T6 T523f5(T0* C);
/* DS_ARRAYED_LIST [LX_DFA_STATE].item */
extern T0* T491f6(T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.make */
extern T0* T492c9(T6 a1, T6 a2);
/* LX_SYMBOL_PARTITIONS.make */
extern void T492f9p1(T0* C, T6 a1, T6 a2);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].put */
extern void T523f7(T0* C, T0* a1, T6 a2);
/* DS_BILINKABLE [INTEGER_32].make */
extern T0* T521c4(T6 a1);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].make */
extern T0* T523c6(T6 a1, T6 a2);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].make_area */
extern void T523f8(T0* C, T6 a1);
/* SPECIAL [DS_BILINKABLE [INTEGER_32]].make */
extern T0* T522c2(T6 a1);
/* ARRAY [BOOLEAN].make */
extern T0* T418c5(T6 a1, T6 a2);
/* ARRAY [BOOLEAN].make_area */
extern void T418f8(T0* C, T6 a1);
/* SPECIAL [BOOLEAN].make */
extern T0* T151c4(T6 a1);
/* LX_FULL_DFA.put_eob_state */
extern void T440f39(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].force_first */
extern void T464f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].put */
extern void T464f17(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [LX_RULE].move_cursors_right */
extern void T464f20(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_RULE].set_position */
extern void T507f5(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].move_right */
extern void T464f19(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [LX_RULE].put_last */
extern void T464f18(T0* C, T0* a1);
/* LX_RULE.make_default */
extern T0* T474c14(T6 a1);
/* LX_RULE.dummy_action */
extern unsigned char ge408os13095;
extern T0* ge408ov13095;
extern T0* T474f11(T0* C);
/* LX_ACTION.make */
extern T0* T525c2(T0* a1);
/* LX_RULE.dummy_pattern */
extern unsigned char ge408os13094;
extern T0* ge408ov13094;
extern T0* T474f13(T0* C);
/* LX_NFA.make_epsilon */
extern T0* T472c12(T1 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put_first */
extern void T490f25(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put */
extern void T490f30(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [LX_NFA_STATE].move_cursors_right */
extern void T490f34(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_position */
extern void T534f8(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].move_right */
extern void T490f33(T0* C, T6 a1, T6 a2);
/* LX_NFA_STATE.set_transition */
extern void T497f11(T0* C, T0* a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].make */
extern T0* T518c3(T0* a1);
/* LX_NFA_STATE.make */
extern T0* T497c10(T1 a1);
/* LX_FULL_DFA.initialize */
extern void T440f38(T0* C, T0* a1);
/* LX_FULL_DFA.initialize_dfa */
extern void T440f43(T0* C, T0* a1, T6 a2, T6 a3);
/* LX_FULL_DFA.put_start_condition */
extern void T440f48(T0* C, T0* a1);
/* LX_NFA.start_state */
extern T0* T472f4(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].first */
extern T0* T490f14(T0* C);
/* DS_ARRAYED_LIST [LX_NFA].item */
extern T0* T495f7(T0* C, T6 a1);
/* LX_START_CONDITIONS.item */
extern T0* T465f7(T0* C, T6 a1);
/* LX_FULL_DFA.set_nfa_state_ids */
extern void T440f47(T0* C, T0* a1);
/* LX_NFA_STATE.set_id */
extern void T497f14(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].force */
extern void T496f37(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].key_storage_put */
extern void T496f45(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].slots_put */
extern void T496f44(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].clashes_put */
extern void T496f43(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].slots_item */
extern T6 T496f29(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].clashes_item */
extern T6 T496f28(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].hash_position */
extern T6 T496f21(T0* C, T6 a1);
/* INTEGER_32.hash_code */
extern T6 T6f24(T6* C);
/* INTEGER_32.infix "&" */
extern T6 T6f25(T6* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].resize */
extern void T496f42(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].clashes_resize */
extern void T496f50(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].special_integer_ */
extern T0* T496f31(T0* C);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].key_storage_resize */
extern void T496f49(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item_storage_resize */
extern void T496f48(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].resize */
extern T0* T476f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_NFA].resized_area */
extern T0* T475f3(T0* C, T6 a1);
/* SPECIAL [LX_NFA].copy_data */
extern void T475f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [LX_NFA].move_data */
extern void T475f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_NFA].overlapping_move */
extern void T475f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_NFA].non_overlapping_move */
extern void T475f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_NFA].make */
extern T0* T475c4(T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].key_storage_item */
extern T6 T496f34(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].slots_resize */
extern void T496f47(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].new_modulus */
extern T6 T496f24(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].new_capacity */
extern T6 T496f33(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item_storage_put */
extern void T496f41(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].search_position */
extern void T496f38(T0* C, T6 a1);
/* KL_EQUALITY_TESTER [INTEGER_32].test */
extern T1 T443f1(T0* C, T6 a1, T6 a2);
/* KL_ANY_ROUTINES.equal_objects */
extern T1 T83f2(T0* C, T0* a1, T0* a2);
/* KL_EQUALITY_TESTER [INTEGER_32].any_ */
extern T0* T443f2(T0* C);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].unset_found_item */
extern void T496f40(T0* C);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item */
extern T0* T496f22(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item_storage_item */
extern T0* T496f32(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].has */
extern T1 T496f23(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make */
extern T0* T496c36(T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_with_equality_testers */
extern void T496f39(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [LX_NFA, INTEGER_32].make */
extern T0* T543c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [LX_NFA, INTEGER_32].new_cursor */
extern T0* T543f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [LX_NFA, INTEGER_32].make */
extern T0* T559c3(T0* a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].new_cursor */
extern T0* T496f30(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32].make */
extern T0* T545c3(T0* a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_sparse_container */
extern void T496f46(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_slots */
extern void T496f54(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_clashes */
extern void T496f53(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_key_storage */
extern void T496f52(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_item_storage */
extern void T496f51(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].make */
extern T0* T476f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_NFA].make_area */
extern T0* T526c2(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].default_create */
extern T0* T476c3(void);
/* KL_EQUALITY_TESTER [INTEGER_32].default_create */
extern T0* T443c3(void);
/* DS_ARRAYED_LIST [LX_DFA_STATE].make */
extern T0* T491c8(T6 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].new_cursor */
extern T0* T491f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].make */
extern T0* T538c2(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].make */
extern T0* T537f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_DFA_STATE].make_area */
extern T0* T558c2(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].default_create */
extern T0* T537c3(void);
/* ARRAY [INTEGER_32].item */
extern T6 T193f4(T0* C, T6 a1);
/* LX_EQUIVALENCE_CLASSES.to_array */
extern T0* T473f6(T0* C, T6 a1, T6 a2);
/* LX_EQUIVALENCE_CLASSES.lower */
extern T6 T473f5(T0* C);
/* INTEGER_32.min */
extern T6 T6f18(T6* C, T6 a1);
/* LX_EQUIVALENCE_CLASSES.upper */
extern T6 T473f4(T0* C);
/* LX_EQUIVALENCE_CLASSES.built */
extern T1 T473f3(T0* C);
/* LX_FULL_DFA.build_eof_rules */
extern void T440f42(T0* C, T0* a1, T6 a2, T6 a3);
/* ARRAY [LX_RULE].put */
extern void T488f5(T0* C, T0* a1, T6 a2);
/* ARRAY [LX_RULE].make */
extern T0* T488c4(T6 a1, T6 a2);
/* ARRAY [LX_RULE].make_area */
extern void T488f6(T0* C, T6 a1);
/* ARRAY [STRING_8].count */
extern T6 T33f10(T0* C);
/* LX_FULL_DFA.build_rules */
extern void T440f41(T0* C, T0* a1);
/* LX_START_CONDITIONS.names */
extern T0* T465f8(T0* C);
/* ARRAY [STRING_8].put */
extern void T33f12(T0* C, T0* a1, T6 a2);
/* ARRAY [STRING_8].make */
extern T0* T33c11(T6 a1, T6 a2);
/* ARRAY [STRING_8].make_area */
extern void T33f13(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.parse_string */
extern void T438f220(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.parse */
extern void T438f224(T0* C);
/* LX_WILDCARD_PARSER.yy_pop_last_value */
extern void T438f237(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_push_error_value */
extern void T438f236(T0* C);
/* KL_SPECIAL_ROUTINES [ANY].resize */
extern T0* T138f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ANY].resized_area */
extern T0* T137f2(T0* C, T6 a1);
/* SPECIAL [ANY].copy_data */
extern void T137f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [ANY].move_data */
extern void T137f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ANY].overlapping_move */
extern void T137f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ANY].non_overlapping_move */
extern void T137f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ANY].make */
extern T0* T137c4(T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].make */
extern T0* T138f1(T0* C, T6 a1);
/* TO_SPECIAL [ANY].make_area */
extern T0* T220c2(T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].default_create */
extern T0* T138c3(void);
/* LX_WILDCARD_PARSER.yy_do_action */
extern void T438f235(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.append_character_to_string */
extern T0* T438f170(T0* C, T6 a1, T0* a2);
/* LX_WILDCARD_PARSER.new_symbol_nfa */
extern T0* T438f216(T0* C, T6 a1);
/* LX_NFA.make_symbol */
extern T0* T472c13(T6 a1, T1 a2);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].make */
extern T0* T520c4(T6 a1, T0* a2);
/* LX_EQUIVALENCE_CLASSES.add */
extern void T473f11(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].forget_right */
extern void T521f7(T0* C);
/* DS_BILINKABLE [INTEGER_32].forget_left */
extern void T521f8(T0* C);
/* ARRAY [BOOLEAN].put */
extern void T418f6(T0* C, T1 a1, T6 a2);
/* DS_BILINKABLE [INTEGER_32].put_right */
extern void T521f6(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].attach_left */
extern void T521f11(T0* C, T0* a1);
/* LX_SYMBOL_CLASS.item */
extern T6 T469f14(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.put */
extern void T469f19(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.force_last */
extern void T469f21(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.resize */
extern void T469f22(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.new_capacity */
extern T6 T469f13(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.extendible */
extern T1 T469f11(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.last */
extern T6 T469f16(T0* C);
/* LX_SYMBOL_CLASS.is_empty */
extern T1 T469f12(T0* C);
/* LX_SYMBOL_CLASS.has */
extern T1 T469f10(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.arrayed_has */
extern T1 T469f15(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.make */
extern T0* T469c18(T6 a1);
/* LX_SYMBOL_CLASS.new_cursor */
extern T0* T469f9(T0* C);
/* DS_ARRAYED_LIST_CURSOR [INTEGER_32].make */
extern T0* T514c2(T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item */
extern T0* T468f27(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item_storage_item */
extern T0* T468f21(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].search_position */
extern void T468f44(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].clashes_item */
extern T6 T468f32(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].hash_position */
extern T6 T468f24(T0* C, T0* a1);
/* KL_STRING_EQUALITY_TESTER.test */
extern T1 T426f1(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].key_storage_item */
extern T0* T468f22(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].slots_item */
extern T6 T468f33(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].has */
extern T1 T468f29(T0* C, T0* a1);
/* INTEGER_32.out */
extern T0* T6f12(T6* C);
/* STRING_8.append_integer */
extern void T17f45(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.new_epsilon_nfa */
extern T0* T438f169(T0* C);
/* LX_WILDCARD_PARSER.append_character_set_to_character_class */
extern T0* T438f168(T0* C, T6 a1, T6 a2, T0* a3);
/* LX_WILDCARD_PARSER.report_negative_range_in_character_class_error */
extern void T438f268(T0* C);
/* UT_ERROR_HANDLER.report_error */
extern void T28f11(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_error_message */
extern void T28f12(T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_line */
extern void T452f4(T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_new_line */
extern void T452f6(T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_string */
extern void T452f5(T0* C, T0* a1);
/* UT_ERROR_HANDLER.message */
extern T0* T28f5(T0* C, T0* a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.make */
extern T0* T501c7(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.filename */
extern T0* T438f189(T0* C);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].resize */
extern T0* T471f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_SYMBOL_CLASS].resized_area */
extern T0* T470f2(T0* C, T6 a1);
/* SPECIAL [LX_SYMBOL_CLASS].copy_data */
extern void T470f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [LX_SYMBOL_CLASS].move_data */
extern void T470f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_SYMBOL_CLASS].overlapping_move */
extern void T470f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_SYMBOL_CLASS].non_overlapping_move */
extern void T470f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_SYMBOL_CLASS].make */
extern T0* T470c4(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].make */
extern T0* T471f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_SYMBOL_CLASS].make_area */
extern T0* T515c2(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].default_create */
extern T0* T471c3(void);
/* LX_WILDCARD_PARSER.append_character_to_character_class */
extern T0* T438f167(T0* C, T6 a1, T0* a2);
/* LX_WILDCARD_PARSER.new_character_class */
extern T0* T438f166(T0* C);
/* LX_SYMBOL_CLASS.set_negated */
extern void T469f20(T0* C, T1 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].force */
extern void T468f43(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].key_storage_put */
extern void T468f51(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].slots_put */
extern void T468f50(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].clashes_put */
extern void T468f49(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].resize */
extern void T468f48(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].clashes_resize */
extern void T468f56(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].special_integer_ */
extern T0* T468f31(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].key_storage_resize */
extern void T468f55(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item_storage_resize */
extern void T468f54(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].slots_resize */
extern void T468f53(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].new_modulus */
extern T6 T468f25(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].new_capacity */
extern T6 T468f23(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item_storage_put */
extern void T468f47(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].unset_found_item */
extern void T468f46(T0* C);
/* LX_WILDCARD_PARSER.new_nfa_from_character_class */
extern T0* T438f165(T0* C, T0* a1);
/* LX_SYMBOL_CLASS.sort */
extern void T469f24(T0* C);
/* LX_SYMBOL_CLASS.arrayed_sort */
extern void T469f26(T0* C, T0* a1);
/* DS_SHELL_SORTER [INTEGER_32].sort */
extern void T560f3(T0* C, T0* a1);
/* DS_SHELL_SORTER [INTEGER_32].sort_with_comparator */
extern void T560f4(T0* C, T0* a1, T0* a2);
/* DS_SHELL_SORTER [INTEGER_32].subsort_with_comparator */
extern void T560f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* LX_SYMBOL_CLASS.replace */
extern void T469f25(T0* C, T6 a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [INTEGER_32].less_than */
extern T1 T564f1(T0* C, T6 a1, T6 a2);
/* LX_SYMBOL_CLASS.sorter */
extern unsigned char ge326os12827;
extern T0* ge326ov12827;
extern T0* T469f17(T0* C);
/* DS_SHELL_SORTER [INTEGER_32].make */
extern T0* T560c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [INTEGER_32].make */
extern T0* T564c2(void);
/* LX_WILDCARD_PARSER.new_symbol_class_nfa */
extern T0* T438f163(T0* C, T0* a1);
/* LX_NFA.make_symbol_class */
extern T0* T472c6(T0* a1, T1 a2);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].make */
extern T0* T516c4(T0* a1, T0* a2);
/* LX_WILDCARD_PARSER.question_character_class */
extern T0* T438f162(T0* C);
/* LX_NFA.build_optional */
extern void T472f11(T0* C);
/* LX_NFA_STATE.set_epsilon_transition */
extern void T497f12(T0* C, T0* a1);
/* LX_NFA.final_state */
extern T0* T472f5(T0* C);
/* LX_NFA.build_positive_closure */
extern void T472f10(T0* C);
/* LX_NFA.build_closure */
extern void T472f9(T0* C);
/* LX_WILDCARD_PARSER.new_nfa_from_character */
extern T0* T438f159(T0* C, T6 a1);
/* LX_NFA.build_concatenation */
extern void T472f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].append_last */
extern void T490f28(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].extend_last */
extern void T490f32(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].forth */
extern void T534f10(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_forth */
extern void T490f36(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].add_traversing_cursor */
extern void T490f37(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_next_cursor */
extern void T534f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].remove_traversing_cursor */
extern void T490f38(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].item */
extern T0* T534f4(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_item */
extern T0* T490f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].after */
extern T1 T534f5(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_after */
extern T1 T490f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].start */
extern void T534f9(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_start */
extern void T490f35(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].off */
extern T1 T534f6(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_off */
extern T1 T490f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_before */
extern T1 T490f20(T0* C, T0* a1);
/* LX_NFA.build_union */
extern void T472f7(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.report_unrecognized_rule_error */
extern void T438f250(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.make */
extern T0* T479c7(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.process_rule */
extern void T438f249(T0* C, T0* a1);
/* LX_START_CONDITIONS.add_nfa_to_all */
extern void T465f11(T0* C, T0* a1);
/* LX_START_CONDITION.put_nfa */
extern void T493f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA].force_last */
extern void T495f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA].resize */
extern void T495f12(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA].new_capacity */
extern T6 T495f9(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA].extendible */
extern T1 T495f8(T0* C, T6 a1);
/* LX_START_CONDITIONS.add_nfa_to_non_exclusive */
extern void T465f13(T0* C, T0* a1);
/* LX_START_CONDITIONS.is_empty */
extern T1 T465f6(T0* C);
/* LX_DESCRIPTION.set_variable_trail_context */
extern void T439f34(T0* C, T1 a1);
/* LX_RULE.set_column_count */
extern void T474f21(T0* C, T6 a1);
/* LX_RULE.set_line_count */
extern void T474f20(T0* C, T6 a1);
/* LX_RULE.set_trail_count */
extern void T474f19(T0* C, T6 a1);
/* LX_RULE.set_head_count */
extern void T474f18(T0* C, T6 a1);
/* LX_RULE.set_trail_context */
extern void T474f17(T0* C, T1 a1);
/* LX_RULE.set_line_nb */
extern void T474f16(T0* C, T6 a1);
/* LX_RULE.set_pattern */
extern void T474f15(T0* C, T0* a1);
/* LX_NFA.set_accepted_rule */
extern void T472f14(T0* C, T0* a1);
/* LX_NFA_STATE.set_accepted_rule */
extern void T497f13(T0* C, T0* a1);
/* LX_DESCRIPTION.create_equiv_classes */
extern void T439f33(T0* C);
/* LX_EQUIVALENCE_CLASSES.make */
extern T0* T473c9(T6 a1, T6 a2);
/* LX_EQUIVALENCE_CLASSES.initialize */
extern void T473f12(T0* C);
/* LX_WILDCARD_PARSER.check_options */
extern void T438f248(T0* C);
/* LX_WILDCARD_PARSER.report_full_and_variable_trailing_context_error */
extern void T438f263(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.make */
extern T0* T485c7(void);
/* LX_WILDCARD_PARSER.report_full_and_reject_error */
extern void T438f262(T0* C);
/* LX_FULL_AND_REJECT_ERROR.make */
extern T0* T484c7(void);
/* LX_WILDCARD_PARSER.report_full_and_meta_equiv_classes_error */
extern void T438f261(T0* C);
/* LX_FULL_AND_META_ERROR.make */
extern T0* T483c7(void);
/* LX_WILDCARD_PARSER.build_equiv_classes */
extern void T438f247(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].forth */
extern void T478f8(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_forth */
extern void T468f62(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].add_traversing_cursor */
extern void T468f64(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].set_next_cursor */
extern void T478f10(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].remove_traversing_cursor */
extern void T468f63(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].set_position */
extern void T478f9(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.convert_to_equivalence */
extern void T469f23(T0* C, T0* a1);
/* LX_EQUIVALENCE_CLASSES.equivalence_class */
extern T6 T473f8(T0* C, T6 a1);
/* LX_EQUIVALENCE_CLASSES.is_representative */
extern T1 T473f7(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].item */
extern T0* T478f4(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_item */
extern T0* T468f35(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].after */
extern T1 T478f5(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_after */
extern T1 T468f34(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].start */
extern void T478f7(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_start */
extern void T468f61(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_off */
extern T1 T468f40(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].is_empty */
extern T1 T468f39(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].new_cursor */
extern T0* T468f28(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].make */
extern T0* T478c6(T0* a1);
/* LX_EQUIVALENCE_CLASSES.build */
extern void T473f10(T0* C);
/* LX_WILDCARD_PARSER.yy_push_last_value */
extern void T438f234(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.accept */
extern void T438f233(T0* C);
/* LX_WILDCARD_PARSER.yy_do_error_action */
extern void T438f231(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.report_error */
extern void T438f246(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.make */
extern T0* T477c7(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.report_eof_expected_error */
extern void T438f245(T0* C);
/* LX_WILDCARD_PARSER.read_token */
extern void T438f230(T0* C);
/* LX_WILDCARD_PARSER.yy_execute_action */
extern void T438f244(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.report_bad_character_error */
extern void T438f260(T0* C, T0* a1);
/* LX_BAD_CHARACTER_ERROR.make */
extern T0* T482c7(T0* a1, T6 a2, T0* a3);
/* LX_WILDCARD_PARSER.report_bad_character_class_error */
extern void T438f259(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.make */
extern T0* T481c7(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.start_condition */
extern T6 T438f184(T0* C);
/* LX_WILDCARD_PARSER.process_escaped_character */
extern void T438f258(T0* C);
/* LX_WILDCARD_PARSER.text_count */
extern T6 T438f205(T0* C);
/* LX_WILDCARD_PARSER.report_missing_quote_error */
extern void T438f257(T0* C);
/* LX_MISSING_QUOTE_ERROR.make */
extern T0* T480c7(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.process_character */
extern void T438f256(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.report_character_out_of_range_error */
extern void T438f266(T0* C, T0* a1);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.make */
extern T0* T486c7(T0* a1, T6 a2, T0* a3);
/* LX_WILDCARD_PARSER.text_item */
extern T2 T438f181(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.less */
extern void T438f255(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_set_line_column */
extern void T438f265(T0* C);
/* LX_WILDCARD_PARSER.text */
extern T0* T438f175(T0* C);
/* KL_CHARACTER_BUFFER.substring */
extern T0* T326f3(T0* C, T6 a1, T6 a2);
/* LX_WILDCARD_PARSER.set_start_condition */
extern void T438f254(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_execute_eof_action */
extern void T438f243(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.terminate */
extern void T438f253(T0* C);
/* LX_WILDCARD_PARSER.wrap */
extern T1 T438f129(T0* C);
/* LX_WILDCARD_PARSER.yy_refill_input_buffer */
extern void T438f242(T0* C);
/* LX_WILDCARD_PARSER.yy_set_content */
extern void T438f240(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.count */
extern T6 T326f4(T0* C);
/* YY_BUFFER.fill */
extern void T206f15(T0* C);
/* YY_BUFFER.set_index */
extern void T206f13(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_null_trans_state */
extern T6 T438f128(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_previous_state */
extern T6 T438f127(T0* C);
/* LX_WILDCARD_PARSER.fatal_error */
extern void T438f241(T0* C, T0* a1);
/* KL_STDERR_FILE.put_character */
extern void T47f18(T0* C, T2 a1);
/* KL_STDERR_FILE.old_put_character */
extern void T47f19(T0* C, T2 a1);
/* KL_STDERR_FILE.console_pc */
extern void T47f20(T0* C, T14 a1, T2 a2);
/* LX_WILDCARD_PARSER.std */
extern T0* T438f171(T0* C);
/* KL_CHARACTER_BUFFER.item */
extern T2 T326f6(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.special_integer_ */
extern T0* T438f160(T0* C);
/* LX_WILDCARD_PARSER.yy_init_value_stacks */
extern void T438f229(T0* C);
/* LX_WILDCARD_PARSER.yy_clear_all */
extern void T438f238(T0* C);
/* LX_WILDCARD_PARSER.clear_all */
extern void T438f251(T0* C);
/* LX_WILDCARD_PARSER.clear_stacks */
extern void T438f264(T0* C);
/* LX_WILDCARD_PARSER.yy_clear_value_stacks */
extern void T438f267(T0* C);
/* SPECIAL [LX_NFA].clear_all */
extern void T475f6(T0* C);
/* SPECIAL [STRING_8].clear_all */
extern void T32f7(T0* C);
/* SPECIAL [LX_SYMBOL_CLASS].clear_all */
extern void T470f6(T0* C);
/* SPECIAL [INTEGER_32].clear_all */
extern void T63f12(T0* C);
/* SPECIAL [ANY].clear_all */
extern void T137f6(T0* C);
/* LX_WILDCARD_PARSER.abort */
extern void T438f232(T0* C);
/* LX_WILDCARD_PARSER.set_input_buffer */
extern void T438f223(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_load_input_buffer */
extern void T438f228(T0* C);
/* YY_BUFFER.set_position */
extern void T206f14(T0* C, T6 a1, T6 a2, T6 a3);
/* LX_WILDCARD_PARSER.new_string_buffer */
extern T0* T438f120(T0* C, T0* a1);
/* YY_BUFFER.make */
extern T0* T206c12(T0* a1);
/* YY_BUFFER.make_from_buffer */
extern void T206f16(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.put */
extern void T326f10(T0* C, T2 a1, T6 a2);
/* STRING_8.put */
extern void T17f52(T0* C, T2 a1, T6 a2);
/* KL_CHARACTER_BUFFER.fill_from_string */
extern void T326f9(T0* C, T0* a1, T6 a2);
/* STRING_8.subcopy */
extern void T17f56(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* YY_BUFFER.new_default_buffer */
extern T0* T206f11(T0* C, T6 a1);
/* KL_CHARACTER_BUFFER.make */
extern T0* T326c8(T6 a1);
/* KL_OPERATING_SYSTEM.is_dotnet */
extern unsigned char ge302os3152;
extern T1 ge302ov3152;
extern T1 T51f6(T0* C);
/* PLATFORM.default_create */
extern T0* T432c2(void);
/* KL_CHARACTER_BUFFER.operating_system */
extern unsigned char ge224os1727;
extern T0* ge224ov1727;
extern T0* T326f7(T0* C);
/* KL_OPERATING_SYSTEM.default_create */
extern T0* T51c7(void);
/* LX_WILDCARD_PARSER.make_from_description */
extern T0* T438c219(T0* a1, T0* a2);
/* DS_ARRAYED_STACK [INTEGER_32].make */
extern T0* T467c4(T6 a1);
/* LX_ACTION_FACTORY.make */
extern T0* T466c1(void);
/* LX_START_CONDITIONS.make */
extern void T465f10(T0* C, T6 a1);
/* LX_START_CONDITIONS.make */
extern T0* T465c10(T6 a1);
/* LX_START_CONDITIONS.new_cursor */
extern T0* T465f9(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].make */
extern T0* T510c4(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].make */
extern T0* T509f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_START_CONDITION].make_area */
extern T0* T555c2(T6 a1);
/* SPECIAL [LX_START_CONDITION].make */
extern T0* T508c2(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].default_create */
extern T0* T509c2(void);
/* LX_WILDCARD_PARSER.make_parser_skeleton */
extern void T438f222(T0* C);
/* LX_WILDCARD_PARSER.yy_build_parser_tables */
extern void T438f227(T0* C);
/* LX_WILDCARD_PARSER.yycheck_template */
extern unsigned char ge386os10991;
extern T0* ge386ov10991;
extern T0* T438f138(T0* C);
/* LX_WILDCARD_PARSER.yyfixed_array */
extern T0* T438f211(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].to_special */
extern T0* T65f3(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yytable_template */
extern unsigned char ge386os10990;
extern T0* ge386ov10990;
extern T0* T438f137(T0* C);
/* LX_WILDCARD_PARSER.yypgoto_template */
extern unsigned char ge386os10989;
extern T0* ge386ov10989;
extern T0* T438f135(T0* C);
/* LX_WILDCARD_PARSER.yypact_template */
extern unsigned char ge386os10988;
extern T0* ge386ov10988;
extern T0* T438f134(T0* C);
/* LX_WILDCARD_PARSER.yydefgoto_template */
extern unsigned char ge386os10987;
extern T0* ge386ov10987;
extern T0* T438f133(T0* C);
/* LX_WILDCARD_PARSER.yydefact_template */
extern unsigned char ge386os10986;
extern T0* ge386ov10986;
extern T0* T438f130(T0* C);
/* LX_WILDCARD_PARSER.yytypes2_template */
extern unsigned char ge386os10985;
extern T0* ge386ov10985;
extern T0* T438f124(T0* C);
/* LX_WILDCARD_PARSER.yytypes1_template */
extern unsigned char ge386os10984;
extern T0* ge386ov10984;
extern T0* T438f122(T0* C);
/* LX_WILDCARD_PARSER.yyr1_template */
extern unsigned char ge386os10983;
extern T0* ge386ov10983;
extern T0* T438f117(T0* C);
/* LX_WILDCARD_PARSER.yytranslate_template */
extern unsigned char ge386os10982;
extern T0* ge386ov10982;
extern T0* T438f116(T0* C);
/* LX_WILDCARD_PARSER.yy_create_value_stacks */
extern void T438f226(T0* C);
/* LX_WILDCARD_PARSER.make_lex_scanner_from_description */
extern void T438f221(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].set_key_equality_tester */
extern void T468f42(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING_8].internal_set_equality_tester */
extern void T512f6(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_map */
extern T0* T468c41(T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_with_equality_testers */
extern void T468f45(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING_8].make */
extern T0* T512c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING_8].new_cursor */
extern T0* T512f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [LX_SYMBOL_CLASS, STRING_8].make */
extern T0* T556c3(T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_sparse_container */
extern void T468f52(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_slots */
extern void T468f60(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_clashes */
extern void T468f59(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_key_storage */
extern void T468f58(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_item_storage */
extern void T468f57(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_key_equality_tester */
extern void T80f44(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.string_equality_tester */
extern unsigned char ge175os3089;
extern T0* ge175ov3089;
extern T0* T438f112(T0* C);
/* KL_STRING_EQUALITY_TESTER.default_create */
extern T0* T426c2(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map */
extern void T80f46(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map */
extern T0* T80c46(T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_with_equality_testers */
extern void T80f47(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_sparse_container */
extern void T80f48(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].unset_found_item */
extern void T80f53(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_slots */
extern void T80f52(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].special_integer_ */
extern T0* T80f41(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_modulus */
extern T6 T80f21(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_clashes */
extern void T80f51(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_key_storage */
extern void T80f50(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_item_storage */
extern void T80f49(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.make_with_buffer */
extern void T438f225(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_initialize */
extern void T438f239(T0* C);
/* LX_WILDCARD_PARSER.yy_build_tables */
extern void T438f252(T0* C);
/* LX_WILDCARD_PARSER.yy_accept_template */
extern unsigned char ge387os11159;
extern T0* ge387ov11159;
extern T0* T438f197(T0* C);
/* LX_WILDCARD_PARSER.yy_fixed_array */
extern T0* T438f218(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_meta_template */
extern unsigned char ge387os11158;
extern T0* ge387ov11158;
extern T0* T438f196(T0* C);
/* LX_WILDCARD_PARSER.yy_ec_template */
extern unsigned char ge387os11157;
extern T0* ge387ov11157;
extern T0* T438f195(T0* C);
/* LX_WILDCARD_PARSER.yy_def_template */
extern unsigned char ge387os11156;
extern T0* ge387ov11156;
extern T0* T438f194(T0* C);
/* LX_WILDCARD_PARSER.yy_base_template */
extern unsigned char ge387os11155;
extern T0* ge387ov11155;
extern T0* T438f193(T0* C);
/* LX_WILDCARD_PARSER.yy_chk_template */
extern unsigned char ge387os11154;
extern T0* ge387ov11154;
extern T0* T438f192(T0* C);
/* LX_WILDCARD_PARSER.yy_nxt_template */
extern unsigned char ge387os11153;
extern T0* ge387ov11153;
extern T0* T438f191(T0* C);
/* LX_WILDCARD_PARSER.empty_buffer */
extern unsigned char ge403os6928;
extern T0* ge403ov6928;
extern T0* T438f154(T0* C);
/* LX_DESCRIPTION.set_case_insensitive */
extern void T439f32(T0* C, T1 a1);
/* LX_DESCRIPTION.set_full_table */
extern void T439f31(T0* C, T1 a1);
/* LX_DESCRIPTION.set_meta_equiv_classes_used */
extern void T439f30(T0* C, T1 a1);
/* LX_DESCRIPTION.set_equiv_classes_used */
extern void T439f29(T0* C, T1 a1);
/* LX_DESCRIPTION.make */
extern T0* T439c28(void);
/* LX_START_CONDITIONS.make_with_initial */
extern T0* T465c12(T6 a1);
/* LX_START_CONDITIONS.put_first */
extern void T465f14(T0* C, T0* a1);
/* LX_START_CONDITIONS.put */
extern void T465f15(T0* C, T0* a1, T6 a2);
/* LX_START_CONDITIONS.move_cursors_right */
extern void T465f18(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].set_position */
extern void T510f5(T0* C, T6 a1);
/* LX_START_CONDITIONS.move_right */
extern void T465f17(T0* C, T6 a1, T6 a2);
/* LX_START_CONDITIONS.put_last */
extern void T465f16(T0* C, T0* a1);
/* LX_START_CONDITION.make */
extern T0* T493c6(T0* a1, T6 a2, T1 a3);
/* DS_ARRAYED_LIST [LX_NFA].make */
extern T0* T495c10(T6 a1);
/* DS_ARRAYED_LIST [LX_NFA].new_cursor */
extern T0* T495f6(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA].make */
extern T0* T541c2(T0* a1);
/* UT_ERROR_HANDLER.make_null */
extern T0* T28c10(void);
/* UT_ERROR_HANDLER.null_output_stream */
extern unsigned char ge205os2522;
extern T0* ge205ov2522;
extern T0* T28f6(T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.make */
extern T0* T452c3(T0* a1);
/* LX_DFA_WILDCARD.wipe_out */
extern void T415f15(T0* C);
/* GEANT_FILESET_ELEMENT.exclude_attribute_name */
extern unsigned char ge132os9507;
extern T0* ge132ov9507;
extern T0* T361f11(T0* C);
/* GEANT_FILESET.set_include_wc_string */
extern void T362f40(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.include_attribute_name */
extern unsigned char ge132os9506;
extern T0* ge132ov9506;
extern T0* T361f10(T0* C);
/* GEANT_FILESET.set_directory_name */
extern void T362f39(T0* C, T0* a1);
/* GEANT_FILESET.set_dir_name */
extern void T362f38(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.attribute_value */
extern T0* T361f9(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.project_variables_resolver */
extern T0* T361f25(T0* C);
/* GEANT_FILESET_ELEMENT.target_arguments_stack */
extern T0* T361f24(T0* C);
/* GEANT_FILESET_ELEMENT.dir_attribute_name */
extern unsigned char ge136os2382;
extern T0* ge136ov2382;
extern T0* T361f8(T0* C);
/* GEANT_FILESET.make */
extern T0* T362c33(T0* a1);
/* DS_HASH_SET [STRING_8].set_equality_tester */
extern void T412f36(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].make */
extern T0* T412c35(T6 a1);
/* DS_HASH_SET [STRING_8].new_cursor */
extern T0* T412f20(T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].make */
extern T0* T414c6(T0* a1);
/* DS_HASH_SET [STRING_8].make_slots */
extern void T412f41(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_clashes */
extern void T412f40(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_key_storage */
extern void T412f39(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_item_storage */
extern void T412f38(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_equal */
extern T0* T410c39(T6 a1);
/* KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY].default_create */
extern T0* T436c3(void);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make */
extern void T410f44(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].new_cursor */
extern T0* T410f24(T0* C);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].make */
extern T0* T434c4(T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].unset_found_item */
extern void T410f47(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_slots */
extern void T410f57(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].special_integer_ */
extern T0* T410f37(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].new_modulus */
extern T6 T410f22(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_clashes */
extern void T410f56(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_key_storage */
extern void T410f55(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_item_storage */
extern void T410f54(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].make */
extern T0* T437f1(T0* C, T6 a1);
/* TO_SPECIAL [GEANT_FILESET_ENTRY].make_area */
extern T0* T463c2(T6 a1);
/* SPECIAL [GEANT_FILESET_ENTRY].make */
extern T0* T435c4(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].default_create */
extern T0* T437c3(void);
/* GEANT_FILESET_ELEMENT.exit_application */
extern void T361f30(T0* C, T6 a1, T0* a2);
/* GEANT_FILESET_ELEMENT.exceptions */
extern T0* T361f23(T0* C);
/* GEANT_FILESET_ELEMENT.mapped_filename_directory_attribute_name */
extern unsigned char ge132os9514;
extern T0* ge132ov9514;
extern T0* T361f6(T0* C);
/* GEANT_FILESET_ELEMENT.filename_directory_attribute_name */
extern unsigned char ge132os9512;
extern T0* ge132ov9512;
extern T0* T361f5(T0* C);
/* GEANT_FILESET_ELEMENT.directory_attribute_name */
extern unsigned char ge132os9505;
extern T0* ge132ov9505;
extern T0* T361f4(T0* C);
/* GEANT_FILESET_ELEMENT.has_attribute */
extern T1 T361f20(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.concat_attribute_name */
extern unsigned char ge132os9509;
extern T0* ge132ov9509;
extern T0* T361f7(T0* C);
/* GEANT_FILESET_ELEMENT.make */
extern void T361f29p1(T0* C, T0* a1, T0* a2);
/* GEANT_FILESET_ELEMENT.set_project */
extern void T361f32(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.element_make */
extern void T361f31(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.set_xml_element */
extern void T361f33(T0* C, T0* a1);
/* XM_ELEMENT.element_by_name */
extern T0* T97f16(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].go_after */
extern void T191f12(T0* C);
/* XM_DOCUMENT.cursor_go_after */
extern void T96f25(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_after */
extern void T191f15(T0* C);
/* XM_DOCUMENT.cursor_off */
extern T1 T96f12(T0* C, T0* a1);
/* XM_ELEMENT.cursor_go_after */
extern void T97f39(T0* C, T0* a1);
/* XM_ELEMENT.cursor_off */
extern T1 T97f23(T0* C, T0* a1);
/* XM_ELEMENT.named_same_name */
extern T1 T97f8(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.same_namespace */
extern T1 T97f11(T0* C, T0* a1);
/* XM_ELEMENT.has_namespace */
extern T1 T97f13(T0* C);
/* XM_ELEMENT.same_string */
extern T1 T97f10(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.string_equality_tester */
extern unsigned char ge237os2091;
extern T0* ge237ov2091;
extern T0* T97f12(T0* C);
/* XM_NODE_TYPER.is_element */
extern T1 T320f8(T0* C);
/* XM_NODE_TYPER.default_create */
extern T0* T320c11(void);
/* GEANT_REPLACE_TASK.fileset_element_name */
extern unsigned char ge117os9192;
extern T0* ge117ov9192;
extern T0* T306f21(T0* C);
/* GEANT_REPLACE_COMMAND.set_flags */
extern void T390f36(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.flags_attribute_name */
extern unsigned char ge117os9191;
extern T0* ge117ov9191;
extern T0* T306f20(T0* C);
/* GEANT_REPLACE_COMMAND.set_replace */
extern void T390f35(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.replace_attribute_name */
extern unsigned char ge117os9190;
extern T0* ge117ov9190;
extern T0* T306f19(T0* C);
/* GEANT_REPLACE_COMMAND.set_variable_pattern */
extern void T390f34(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.variable_pattern_attribute_name */
extern unsigned char ge117os9189;
extern T0* ge117ov9189;
extern T0* T306f18(T0* C);
/* GEANT_REPLACE_COMMAND.set_token */
extern void T390f33(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.token_attribute_name */
extern unsigned char ge117os9188;
extern T0* ge117ov9188;
extern T0* T306f17(T0* C);
/* GEANT_REPLACE_COMMAND.set_match */
extern void T390f32(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.match_attribute_name */
extern unsigned char ge117os9187;
extern T0* ge117ov9187;
extern T0* T306f16(T0* C);
/* GEANT_REPLACE_COMMAND.set_to_directory */
extern void T390f31(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.to_directory_attribute_name */
extern unsigned char ge117os9186;
extern T0* ge117ov9186;
extern T0* T306f15(T0* C);
/* GEANT_REPLACE_COMMAND.set_to_file */
extern void T390f30(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.to_file_attribute_name */
extern unsigned char ge117os9185;
extern T0* ge117ov9185;
extern T0* T306f14(T0* C);
/* GEANT_REPLACE_COMMAND.set_file */
extern void T390f29(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.attribute_value */
extern T0* T306f13(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.project_variables_resolver */
extern T0* T306f6(T0* C);
/* GEANT_REPLACE_TASK.target_arguments_stack */
extern T0* T306f26(T0* C);
/* GEANT_REPLACE_TASK.has_attribute */
extern T1 T306f9(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.file_attribute_name */
extern unsigned char ge117os9184;
extern T0* ge117ov9184;
extern T0* T306f12(T0* C);
/* GEANT_REPLACE_TASK.task_make */
extern void T306f32(T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_TASK.interpreting_element_make */
extern void T306f35(T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_TASK.set_project */
extern void T306f37(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.element_make */
extern void T306f36(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.set_xml_element */
extern void T306f38(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.set_command */
extern void T306f34(T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.make */
extern T0* T390c28(T0* a1);
/* GEANT_REPLACE_COMMAND.set_project */
extern void T390f39(T0* C, T0* a1);
/* GEANT_TARGET.replace_task_name */
extern unsigned char ge130os2426;
extern T0* ge130ov2426;
extern T0* T26f72(T0* C);
/* GEANT_INPUT_TASK.make */
extern T0* T305c31(T0* a1, T0* a2);
/* GEANT_INPUT_COMMAND.set_answer_required */
extern void T389f20(T0* C, T1 a1);
/* GEANT_INPUT_TASK.boolean_value */
extern T1 T305f19(T0* C, T0* a1);
/* GEANT_INPUT_TASK.std */
extern T0* T305f22(T0* C);
/* GEANT_INPUT_TASK.false_attribute_value */
extern T0* T305f27(T0* C);
/* GEANT_INPUT_TASK.true_attribute_value */
extern T0* T305f26(T0* C);
/* GEANT_INPUT_TASK.string_ */
extern T0* T305f25(T0* C);
/* GEANT_INPUT_TASK.answer_required_attribute_name */
extern unsigned char ge110os9166;
extern T0* ge110ov9166;
extern T0* T305f18(T0* C);
/* GEANT_INPUT_COMMAND.set_validregexp */
extern void T389f19(T0* C, T0* a1);
/* GEANT_INPUT_TASK.validregexp_attribute_name */
extern unsigned char ge110os9165;
extern T0* ge110ov9165;
extern T0* T305f17(T0* C);
/* GEANT_INPUT_COMMAND.set_validargs */
extern void T389f18(T0* C, T0* a1);
/* GEANT_INPUT_TASK.validargs_attribute_name */
extern unsigned char ge110os9164;
extern T0* ge110ov9164;
extern T0* T305f16(T0* C);
/* GEANT_INPUT_COMMAND.set_default_value */
extern void T389f17(T0* C, T0* a1);
/* GEANT_INPUT_TASK.defaultvalue_attribute_name */
extern unsigned char ge110os9163;
extern T0* ge110ov9163;
extern T0* T305f15(T0* C);
/* GEANT_INPUT_COMMAND.set_message */
extern void T389f16(T0* C, T0* a1);
/* GEANT_INPUT_TASK.message_attribute_name */
extern unsigned char ge110os9162;
extern T0* ge110ov9162;
extern T0* T305f14(T0* C);
/* GEANT_INPUT_COMMAND.set_variable */
extern void T389f15(T0* C, T0* a1);
/* GEANT_INPUT_TASK.attribute_value */
extern T0* T305f13(T0* C, T0* a1);
/* GEANT_INPUT_TASK.project_variables_resolver */
extern T0* T305f6(T0* C);
/* GEANT_INPUT_TASK.target_arguments_stack */
extern T0* T305f24(T0* C);
/* GEANT_INPUT_TASK.has_attribute */
extern T1 T305f9(T0* C, T0* a1);
/* GEANT_INPUT_TASK.variable_attribute_name */
extern unsigned char ge110os9161;
extern T0* ge110ov9161;
extern T0* T305f12(T0* C);
/* GEANT_INPUT_TASK.task_make */
extern void T305f33(T0* C, T0* a1, T0* a2);
/* GEANT_INPUT_TASK.interpreting_element_make */
extern void T305f36(T0* C, T0* a1, T0* a2);
/* GEANT_INPUT_TASK.set_project */
extern void T305f38(T0* C, T0* a1);
/* GEANT_INPUT_TASK.element_make */
extern void T305f37(T0* C, T0* a1);
/* GEANT_INPUT_TASK.set_xml_element */
extern void T305f39(T0* C, T0* a1);
/* GEANT_INPUT_TASK.set_command */
extern void T305f35(T0* C, T0* a1);
/* GEANT_INPUT_COMMAND.make */
extern T0* T389c14(T0* a1);
/* GEANT_INPUT_COMMAND.set_project */
extern void T389f22(T0* C, T0* a1);
/* GEANT_TARGET.input_task_name */
extern unsigned char ge130os2425;
extern T0* ge130ov2425;
extern T0* T26f71(T0* C);
/* GEANT_AVAILABLE_TASK.make */
extern T0* T304c25(T0* a1, T0* a2);
/* GEANT_AVAILABLE_COMMAND.set_variable_name */
extern void T388f18(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.variable_attribute_name */
extern unsigned char ge97os9144;
extern T0* ge97ov9144;
extern T0* T304f16(T0* C);
/* GEANT_AVAILABLE_TASK.false_value_attribute_name */
extern unsigned char ge97os9146;
extern T0* ge97ov9146;
extern T0* T304f15(T0* C);
/* GEANT_AVAILABLE_COMMAND.set_false_value */
extern void T388f17(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.true_value_attribute_name */
extern unsigned char ge97os9145;
extern T0* ge97ov9145;
extern T0* T304f14(T0* C);
/* GEANT_AVAILABLE_COMMAND.set_true_value */
extern void T388f16(T0* C, T0* a1);
/* GEANT_AVAILABLE_COMMAND.set_resource_name */
extern void T388f15(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.attribute_value */
extern T0* T304f13(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.project_variables_resolver */
extern T0* T304f6(T0* C);
/* GEANT_AVAILABLE_TASK.target_arguments_stack */
extern T0* T304f21(T0* C);
/* GEANT_AVAILABLE_TASK.has_attribute */
extern T1 T304f9(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.resource_attribute_name */
extern unsigned char ge97os9143;
extern T0* ge97ov9143;
extern T0* T304f12(T0* C);
/* GEANT_AVAILABLE_TASK.task_make */
extern void T304f27(T0* C, T0* a1, T0* a2);
/* GEANT_AVAILABLE_TASK.interpreting_element_make */
extern void T304f30(T0* C, T0* a1, T0* a2);
/* GEANT_AVAILABLE_TASK.set_project */
extern void T304f32(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.element_make */
extern void T304f31(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.set_xml_element */
extern void T304f33(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.set_command */
extern void T304f29(T0* C, T0* a1);
/* GEANT_AVAILABLE_COMMAND.make */
extern T0* T388c14(T0* a1);
/* GEANT_AVAILABLE_COMMAND.set_project */
extern void T388f20(T0* C, T0* a1);
/* GEANT_TARGET.available_task_name */
extern unsigned char ge130os2424;
extern T0* ge130ov2424;
extern T0* T26f70(T0* C);
/* GEANT_PRECURSOR_TASK.make */
extern T0* T303c27(T0* a1, T0* a2);
/* GEANT_DEFINE_ELEMENT.value */
extern T0* T367f5(T0* C);
/* GEANT_DEFINE_ELEMENT.value_attribute_name */
extern unsigned char ge139os7793;
extern T0* ge139ov7793;
extern T0* T367f12(T0* C);
/* GEANT_ARGUMENT_VARIABLES.has */
extern T1 T34f37(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].forth */
extern void T273f9(T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_forth */
extern void T226f14(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].add_traversing_cursor */
extern void T226f15(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T273f11(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].remove_traversing_cursor */
extern void T226f16(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].set */
extern void T273f10(T0* C, T0* a1, T1 a2, T1 a3);
/* GEANT_ARGUMENT_VARIABLES.force_last */
extern void T34f67(T0* C, T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.key_storage_put */
extern void T34f56(T0* C, T0* a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.slots_put */
extern void T34f55(T0* C, T6 a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.clashes_put */
extern void T34f54(T0* C, T6 a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.resize */
extern void T34f53(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.clashes_resize */
extern void T34f61(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.special_integer_ */
extern T0* T34f26(T0* C);
/* GEANT_ARGUMENT_VARIABLES.key_storage_resize */
extern void T34f60(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.item_storage_resize */
extern void T34f59(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.slots_resize */
extern void T34f58(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.new_modulus */
extern T6 T34f31(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.new_capacity */
extern T6 T34f23(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.item_storage_put */
extern void T34f52(T0* C, T0* a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.unset_found_item */
extern void T34f50(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].item */
extern T0* T273f6(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].start */
extern void T273f8(T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_start */
extern void T226f13(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].cursor_off */
extern T1 T226f9(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].new_cursor */
extern T0* T226f7(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].make */
extern T0* T273c7(T0* a1);
/* ST_SPLITTER.split */
extern T0* T373f6(T0* C, T0* a1);
/* ST_SPLITTER.do_split */
extern T0* T373f8(T0* C, T0* a1, T1 a2);
/* DS_LINKED_LIST [STRING_8].force_last */
extern void T226f11(T0* C, T0* a1);
/* DS_LINKABLE [STRING_8].put_right */
extern void T277f4(T0* C, T0* a1);
/* DS_LINKABLE [STRING_8].make */
extern T0* T277c3(T0* a1);
/* DS_LINKED_LIST [STRING_8].is_empty */
extern T1 T226f6(T0* C);
/* DS_HASH_SET [INTEGER_32].has */
extern T1 T420f24(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].search_position */
extern void T420f32(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].clashes_item */
extern T6 T420f22(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].hash_position */
extern T6 T420f19(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].key_storage_item */
extern T6 T420f18(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].item_storage_item */
extern T6 T420f27(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].key_equality_tester */
extern T0* T420f17(T0* C);
/* DS_HASH_SET [INTEGER_32].slots_item */
extern T6 T420f25(T0* C, T6 a1);
/* KL_STRING_ROUTINES.appended_substring */
extern T0* T76f4(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* UC_UTF8_STRING.append_character */
extern void T195f56(T0* C, T2 a1);
/* UC_UTF8_STRING.resize_byte_storage */
extern void T195f65(T0* C, T6 a1);
/* UC_UTF8_STRING.resize */
extern void T195f72(T0* C, T6 a1);
/* UC_UTF8_STRING.append_string */
extern void T195f55(T0* C, T0* a1);
/* UC_UTF8_STRING.dummy_uc_string */
extern unsigned char ge318os6413;
extern T0* ge318ov6413;
extern T0* T195f39(T0* C);
/* UC_UTF8_STRING.append_string */
extern void T195f55p1(T0* C, T0* a1);
/* UC_UTF8_STRING.append */
extern void T195f64(T0* C, T0* a1);
/* UC_UTF8_STRING.additional_space */
extern T6 T195f41(T0* C);
/* ISE_RUNTIME.check_assert */
extern T1 T254s1(T1 a1);
/* UC_UTF8_STRING.new_empty_string */
extern T0* T195f9(T0* C, T6 a1);
/* UC_UTF8_STRING.append_substring */
extern void T195f57(T0* C, T0* a1, T6 a2, T6 a3);
/* ST_SPLITTER.string_ */
extern T0* T373f5(T0* C);
/* DS_LINKED_LIST [STRING_8].make */
extern T0* T226c10(void);
/* GEANT_PRECURSOR_TASK.arguments_string_splitter */
extern unsigned char ge61os1710;
extern T0* ge61ov1710;
extern T0* T303f17(T0* C);
/* ST_SPLITTER.set_separators */
extern void T373f10(T0* C, T0* a1);
/* DS_HASH_SET [INTEGER_32].put */
extern void T420f31(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].slots_put */
extern void T420f40(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [INTEGER_32].clashes_put */
extern void T420f39(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [INTEGER_32].item_storage_put */
extern void T420f38(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [INTEGER_32].unset_found_item */
extern void T420f37(T0* C);
/* DS_HASH_SET [INTEGER_32].make */
extern T0* T420c30(T6 a1);
/* DS_HASH_SET [INTEGER_32].new_cursor */
extern T0* T420f20(T0* C);
/* DS_HASH_SET_CURSOR [INTEGER_32].make */
extern T0* T442c3(T0* a1);
/* DS_HASH_SET [INTEGER_32].make_slots */
extern void T420f36(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].special_integer_ */
extern T0* T420f23(T0* C);
/* DS_HASH_SET [INTEGER_32].new_modulus */
extern T6 T420f28(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].make_clashes */
extern void T420f35(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].make_key_storage */
extern void T420f34(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].make_item_storage */
extern void T420f33(T0* C, T6 a1);
/* ST_SPLITTER.make */
extern T0* T373c9(void);
/* GEANT_PRECURSOR_TASK.exit_application */
extern void T303f30(T0* C, T6 a1, T0* a2);
/* GEANT_PRECURSOR_TASK.exceptions */
extern T0* T303f21(T0* C);
/* GEANT_PRECURSOR_TASK.std */
extern T0* T303f20(T0* C);
/* GEANT_PRECURSOR_TASK.arguments_attribute_name */
extern unsigned char ge116os9133;
extern T0* ge116ov9133;
extern T0* T303f16(T0* C);
/* GEANT_PRECURSOR_TASK.elements_by_name */
extern T0* T303f15(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.string_ */
extern T0* T303f23(T0* C);
/* GEANT_PRECURSOR_TASK.argument_element_name */
extern unsigned char ge116os9132;
extern T0* ge116ov9132;
extern T0* T303f14(T0* C);
/* GEANT_PRECURSOR_COMMAND.set_parent */
extern void T387f8(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.attribute_value */
extern T0* T303f13(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.project_variables_resolver */
extern T0* T303f6(T0* C);
/* GEANT_PRECURSOR_TASK.target_arguments_stack */
extern T0* T303f22(T0* C);
/* GEANT_PRECURSOR_TASK.has_attribute */
extern T1 T303f9(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.parent_attribute_name */
extern unsigned char ge116os9131;
extern T0* ge116ov9131;
extern T0* T303f12(T0* C);
/* GEANT_PRECURSOR_TASK.task_make */
extern void T303f29(T0* C, T0* a1, T0* a2);
/* GEANT_PRECURSOR_TASK.interpreting_element_make */
extern void T303f32(T0* C, T0* a1, T0* a2);
/* GEANT_PRECURSOR_TASK.set_project */
extern void T303f34(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.element_make */
extern void T303f33(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.set_xml_element */
extern void T303f35(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.set_command */
extern void T303f31(T0* C, T0* a1);
/* GEANT_PRECURSOR_COMMAND.make */
extern T0* T387c7(T0* a1);
/* GEANT_PRECURSOR_COMMAND.make */
extern void T387f7p1(T0* C, T0* a1);
/* GEANT_PRECURSOR_COMMAND.set_project */
extern void T387f10(T0* C, T0* a1);
/* GEANT_TARGET.precursor_task_name */
extern unsigned char ge130os2423;
extern T0* ge130ov2423;
extern T0* T26f69(T0* C);
/* GEANT_EXIT_TASK.make */
extern T0* T302c22(T0* a1, T0* a2);
/* UC_UTF8_STRING.to_integer */
extern T6 T195f46(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
extern T6 T114f13(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
extern void T114f17(T0* C, T0* a1, T6 a2);
/* UC_UTF8_STRING.code */
extern T10 T195f49(T0* C, T6 a1);
/* STRING_8.code */
extern T10 T17f27(T0* C, T6 a1);
/* INTEGER_32.to_natural_32 */
extern T10 T6f21(T6* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_character */
extern void T114f23(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflowed */
extern T1 T114f15(T0* C);
/* INTEGER_OVERFLOW_CHECKER.will_overflow */
extern T1 T199f7(T0* C, T11 a1, T11 a2, T6 a3, T6 a4);
/* NATURAL_64.infix ">" */
extern T1 T11f4(T11* C, T11 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
extern unsigned char ge2234os6654;
extern T0* ge2234ov6654;
extern T0* T114f14(T0* C);
/* INTEGER_OVERFLOW_CHECKER.make */
extern T0* T199c13(void);
/* NATURAL_64.to_natural_64 */
extern T11 T11f7(T11* C);
/* NATURAL_32.to_natural_64 */
extern T11 T10f4(T10* C);
/* NATURAL_16.to_natural_64 */
extern T11 T9f3(T9* C);
/* NATURAL_8.to_natural_64 */
extern T11 T8f10(T8* C);
/* INTEGER_64.to_natural_64 */
extern T11 T7f3(T7* C);
/* INTEGER_16.to_natural_64 */
extern T11 T5f3(T5* C);
/* INTEGER_8.to_natural_64 */
extern T11 T4f3(T4* C);
/* SPECIAL [NATURAL_64].make */
extern T0* T257c2(T6 a1);
/* STRING_8.has */
extern T1 T17f28(T0* C, T2 a1);
/* INTEGER_32.to_natural_64 */
extern T11 T6f19(T6* C);
/* CHARACTER_8.is_digit */
extern T1 T2f6(T2* C);
/* NATURAL_8.infix ">" */
extern T1 T8f2(T8* C, T8 a1);
/* NATURAL_8.infix "&" */
extern T8 T8f1(T8* C, T8 a1);
/* CHARACTER_8.character_types */
extern T8 T2f7(T2* C, T6 a1);
/* CHARACTER_8.internal_character_types */
extern unsigned char ge37os93;
extern T0* ge37ov93;
extern T0* T2f9(T2* C);
/* NATURAL_8.infix "|" */
extern T8 T8f3(T8* C, T8 a1);
/* SPECIAL [NATURAL_8].make */
extern T0* T243c2(T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.reset */
extern void T114f18(T0* C, T6 a1);
/* UC_UTF8_STRING.ctoi_convertor */
extern unsigned char ge2231os1258;
extern T0* ge2231ov1258;
extern T0* T195f48(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
extern void T114f22(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
extern void T114f21(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
extern void T114f20(T0* C, T0* a1);
/* STRING_8.make_from_string */
extern T0* T17c47(T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
extern void T114f19(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.make */
extern T0* T114c16(void);
/* STRING_8.to_integer */
extern T6 T17f15(T0* C);
/* STRING_8.ctoi_convertor */
extern T0* T17f21(T0* C);
/* GEANT_EXIT_COMMAND.set_code */
extern void T386f7(T0* C, T6 a1);
/* UC_UTF8_STRING.is_integer */
extern T1 T195f45(T0* C);
/* UC_UTF8_STRING.is_valid_integer_or_natural */
extern T1 T195f47(T0* C, T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.is_integral_integer */
extern T1 T114f12(T0* C);
/* STRING_8.is_integer */
extern T1 T17f14(T0* C);
/* STRING_8.is_valid_integer_or_natural */
extern T1 T17f20(T0* C, T6 a1);
/* GEANT_EXIT_TASK.attribute_value */
extern T0* T302f13(T0* C, T0* a1);
/* GEANT_EXIT_TASK.project_variables_resolver */
extern T0* T302f6(T0* C);
/* GEANT_EXIT_TASK.target_arguments_stack */
extern T0* T302f18(T0* C);
/* GEANT_EXIT_TASK.has_attribute */
extern T1 T302f9(T0* C, T0* a1);
/* GEANT_EXIT_TASK.code_attribute_name */
extern unsigned char ge102os9122;
extern T0* ge102ov9122;
extern T0* T302f12(T0* C);
/* GEANT_EXIT_TASK.task_make */
extern void T302f24(T0* C, T0* a1, T0* a2);
/* GEANT_EXIT_TASK.interpreting_element_make */
extern void T302f27(T0* C, T0* a1, T0* a2);
/* GEANT_EXIT_TASK.set_project */
extern void T302f29(T0* C, T0* a1);
/* GEANT_EXIT_TASK.element_make */
extern void T302f28(T0* C, T0* a1);
/* GEANT_EXIT_TASK.set_xml_element */
extern void T302f30(T0* C, T0* a1);
/* GEANT_EXIT_TASK.set_command */
extern void T302f26(T0* C, T0* a1);
/* GEANT_EXIT_COMMAND.make */
extern T0* T386c6(T0* a1);
/* GEANT_EXIT_COMMAND.set_project */
extern void T386f9(T0* C, T0* a1);
/* GEANT_TARGET.exit_task_name */
extern unsigned char ge130os2422;
extern T0* ge130ov2422;
extern T0* T26f68(T0* C);
/* GEANT_OUTOFDATE_TASK.make */
extern T0* T301c27(T0* a1, T0* a2);
/* GEANT_OUTOFDATE_COMMAND.set_fileset */
extern void T385f25(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.fileset_element_name */
extern unsigned char ge115os9101;
extern T0* ge115ov9101;
extern T0* T301f18(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_variable_name */
extern void T385f24(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.variable_attribute_name */
extern unsigned char ge115os9098;
extern T0* ge115ov9098;
extern T0* T301f17(T0* C);
/* GEANT_OUTOFDATE_TASK.false_value_attribute_name */
extern unsigned char ge115os9100;
extern T0* ge115ov9100;
extern T0* T301f16(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_false_value */
extern void T385f23(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.true_value_attribute_name */
extern unsigned char ge115os9099;
extern T0* ge115ov9099;
extern T0* T301f15(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_true_value */
extern void T385f22(T0* C, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.set_target_filename */
extern void T385f21(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.target_attribute_name */
extern unsigned char ge115os9097;
extern T0* ge115ov9097;
extern T0* T301f14(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_source_filename */
extern void T385f20(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.attribute_value */
extern T0* T301f13(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.project_variables_resolver */
extern T0* T301f6(T0* C);
/* GEANT_OUTOFDATE_TASK.target_arguments_stack */
extern T0* T301f23(T0* C);
/* GEANT_OUTOFDATE_TASK.has_attribute */
extern T1 T301f9(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.source_attribute_name */
extern unsigned char ge115os9096;
extern T0* ge115ov9096;
extern T0* T301f12(T0* C);
/* GEANT_OUTOFDATE_TASK.task_make */
extern void T301f29(T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.interpreting_element_make */
extern void T301f32(T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.set_project */
extern void T301f34(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.element_make */
extern void T301f33(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.set_xml_element */
extern void T301f35(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.set_command */
extern void T301f31(T0* C, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.make */
extern T0* T385c19(T0* a1);
/* GEANT_OUTOFDATE_COMMAND.set_project */
extern void T385f27(T0* C, T0* a1);
/* GEANT_TARGET.outofdate_task_name */
extern unsigned char ge130os2421;
extern T0* ge130ov2421;
extern T0* T26f67(T0* C);
/* GEANT_XSLT_TASK.make */
extern T0* T300c40(T0* a1, T0* a2);
/* GEANT_XSLT_COMMAND.set_classpath */
extern void T382f37(T0* C, T0* a1);
/* GEANT_XSLT_TASK.classpath_attribute_name */
extern unsigned char ge124os9056;
extern T0* ge124ov9056;
extern T0* T300f29(T0* C);
/* GEANT_XSLT_COMMAND.set_extdirs */
extern void T382f36(T0* C, T0* a1);
/* GEANT_XSLT_TASK.extdirs_attribute_name */
extern unsigned char ge124os9055;
extern T0* ge124ov9055;
extern T0* T300f28(T0* C);
/* GEANT_XSLT_COMMAND.set_format */
extern void T382f35(T0* C, T0* a1);
/* GEANT_XSLT_TASK.format_attribute_name */
extern unsigned char ge124os9053;
extern T0* ge124ov9053;
extern T0* T300f27(T0* C);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].force_last */
extern void T384f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].resize */
extern void T384f12(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]].resize */
extern T0* T423f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_PAIR [STRING_8, STRING_8]].resized_area */
extern T0* T422f3(T0* C, T6 a1);
/* SPECIAL [DS_PAIR [STRING_8, STRING_8]].copy_data */
extern void T422f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [DS_PAIR [STRING_8, STRING_8]].move_data */
extern void T422f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_PAIR [STRING_8, STRING_8]].overlapping_move */
extern void T422f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_PAIR [STRING_8, STRING_8]].non_overlapping_move */
extern void T422f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_PAIR [STRING_8, STRING_8]].make */
extern T0* T422c4(T6 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].new_capacity */
extern T6 T384f9(T0* C, T6 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].extendible */
extern T1 T384f8(T0* C, T6 a1);
/* DS_PAIR [STRING_8, STRING_8].make */
extern T0* T383c3(T0* a1, T0* a2);
/* GEANT_DEFINE_ELEMENT.has_value */
extern T1 T367f3(T0* C);
/* GEANT_XSLT_TASK.elements_by_name */
extern T0* T300f26(T0* C, T0* a1);
/* GEANT_XSLT_TASK.parameter_element_name */
extern unsigned char ge124os9057;
extern T0* ge124ov9057;
extern T0* T300f25(T0* C);
/* GEANT_XSLT_COMMAND.set_indent */
extern void T382f34(T0* C, T0* a1);
/* GEANT_XSLT_TASK.indent_attribute_name */
extern unsigned char ge124os9054;
extern T0* ge124ov9054;
extern T0* T300f24(T0* C);
/* GEANT_XSLT_COMMAND.set_force */
extern void T382f33(T0* C, T1 a1);
/* GEANT_XSLT_TASK.boolean_value */
extern T1 T300f23(T0* C, T0* a1);
/* GEANT_XSLT_TASK.std */
extern T0* T300f32(T0* C);
/* GEANT_XSLT_TASK.false_attribute_value */
extern T0* T300f36(T0* C);
/* GEANT_XSLT_TASK.true_attribute_value */
extern T0* T300f35(T0* C);
/* GEANT_XSLT_TASK.force_attribute_name */
extern unsigned char ge124os9047;
extern T0* ge124ov9047;
extern T0* T300f22(T0* C);
/* GEANT_XSLT_COMMAND.set_stylesheet_filename */
extern void T382f32(T0* C, T0* a1);
/* GEANT_XSLT_TASK.stylesheet_filename_attribute_name */
extern unsigned char ge124os9046;
extern T0* ge124ov9046;
extern T0* T300f21(T0* C);
/* GEANT_XSLT_COMMAND.set_output_filename */
extern void T382f31(T0* C, T0* a1);
/* GEANT_XSLT_TASK.output_filename_attribute_name */
extern unsigned char ge124os9045;
extern T0* ge124ov9045;
extern T0* T300f20(T0* C);
/* GEANT_XSLT_COMMAND.set_input_filename */
extern void T382f30(T0* C, T0* a1);
/* GEANT_XSLT_TASK.input_filename_attribute_name */
extern unsigned char ge124os9044;
extern T0* ge124ov9044;
extern T0* T300f19(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_gexslt */
extern void T382f29(T0* C);
/* GEANT_XSLT_COMMAND.set_processor */
extern void T382f40(T0* C, T6 a1);
/* GEANT_XSLT_TASK.processor_attribute_value_gexslt */
extern unsigned char ge124os9052;
extern T0* ge124ov9052;
extern T0* T300f18(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xsltproc */
extern void T382f28(T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xsltproc */
extern unsigned char ge124os9051;
extern T0* ge124ov9051;
extern T0* T300f17(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xalan_java */
extern void T382f27(T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xalan_java */
extern unsigned char ge124os9050;
extern T0* ge124ov9050;
extern T0* T300f16(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xalan_cpp */
extern void T382f26(T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xalan_cpp */
extern unsigned char ge124os9049;
extern T0* ge124ov9049;
extern T0* T300f15(T0* C);
/* GEANT_XSLT_TASK.string_ */
extern T0* T300f14(T0* C);
/* GEANT_XSLT_TASK.attribute_value */
extern T0* T300f13(T0* C, T0* a1);
/* GEANT_XSLT_TASK.project_variables_resolver */
extern T0* T300f6(T0* C);
/* GEANT_XSLT_TASK.target_arguments_stack */
extern T0* T300f34(T0* C);
/* GEANT_XSLT_TASK.has_attribute */
extern T1 T300f9(T0* C, T0* a1);
/* GEANT_XSLT_TASK.processor_attribute_name */
extern unsigned char ge124os9048;
extern T0* ge124ov9048;
extern T0* T300f12(T0* C);
/* GEANT_XSLT_TASK.task_make */
extern void T300f42(T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_TASK.interpreting_element_make */
extern void T300f45(T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_TASK.set_project */
extern void T300f47(T0* C, T0* a1);
/* GEANT_XSLT_TASK.element_make */
extern void T300f46(T0* C, T0* a1);
/* GEANT_XSLT_TASK.set_xml_element */
extern void T300f48(T0* C, T0* a1);
/* GEANT_XSLT_TASK.set_command */
extern void T300f44(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.make */
extern T0* T382c25(T0* a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].make */
extern T0* T384c10(T6 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].new_cursor */
extern T0* T384f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING_8, STRING_8]].make */
extern T0* T424c2(T0* a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]].make */
extern T0* T423f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_PAIR [STRING_8, STRING_8]].make_area */
extern T0* T444c2(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]].default_create */
extern T0* T423c3(void);
/* GEANT_XSLT_COMMAND.make */
extern void T382f25p1(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.set_project */
extern void T382f39(T0* C, T0* a1);
/* GEANT_TARGET.xslt_task_name */
extern unsigned char ge130os2420;
extern T0* ge130ov2420;
extern T0* T26f66(T0* C);
/* GEANT_SETENV_TASK.make */
extern T0* T299c23(T0* a1, T0* a2);
/* GEANT_SETENV_COMMAND.set_value */
extern void T381f10(T0* C, T0* a1);
/* GEANT_SETENV_TASK.value_attribute_name */
extern unsigned char ge118os9034;
extern T0* ge118ov9034;
extern T0* T299f14(T0* C);
/* GEANT_SETENV_COMMAND.set_name */
extern void T381f9(T0* C, T0* a1);
/* GEANT_SETENV_TASK.attribute_value */
extern T0* T299f13(T0* C, T0* a1);
/* GEANT_SETENV_TASK.project_variables_resolver */
extern T0* T299f6(T0* C);
/* GEANT_SETENV_TASK.target_arguments_stack */
extern T0* T299f19(T0* C);
/* GEANT_SETENV_TASK.has_attribute */
extern T1 T299f9(T0* C, T0* a1);
/* GEANT_SETENV_TASK.name_attribute_name */
extern unsigned char ge118os9033;
extern T0* ge118ov9033;
extern T0* T299f12(T0* C);
/* GEANT_SETENV_TASK.task_make */
extern void T299f25(T0* C, T0* a1, T0* a2);
/* GEANT_SETENV_TASK.interpreting_element_make */
extern void T299f28(T0* C, T0* a1, T0* a2);
/* GEANT_SETENV_TASK.set_project */
extern void T299f30(T0* C, T0* a1);
/* GEANT_SETENV_TASK.element_make */
extern void T299f29(T0* C, T0* a1);
/* GEANT_SETENV_TASK.set_xml_element */
extern void T299f31(T0* C, T0* a1);
/* GEANT_SETENV_TASK.set_command */
extern void T299f27(T0* C, T0* a1);
/* GEANT_SETENV_COMMAND.make */
extern T0* T381c8(T0* a1);
/* GEANT_SETENV_COMMAND.set_project */
extern void T381f12(T0* C, T0* a1);
/* GEANT_TARGET.setenv_task_name */
extern unsigned char ge130os2419;
extern T0* ge130ov2419;
extern T0* T26f65(T0* C);
/* GEANT_MOVE_TASK.make */
extern T0* T298c25(T0* a1, T0* a2);
/* GEANT_MOVE_COMMAND.set_fileset */
extern void T380f20(T0* C, T0* a1);
/* GEANT_MOVE_TASK.fileset_element_name */
extern unsigned char ge114os9015;
extern T0* ge114ov9015;
extern T0* T298f16(T0* C);
/* GEANT_MOVE_COMMAND.set_to_directory */
extern void T380f19(T0* C, T0* a1);
/* GEANT_MOVE_TASK.to_directory_attribute_name */
extern unsigned char ge114os9014;
extern T0* ge114ov9014;
extern T0* T298f15(T0* C);
/* GEANT_MOVE_COMMAND.set_to_file */
extern void T380f18(T0* C, T0* a1);
/* GEANT_MOVE_TASK.to_file_attribute_name */
extern unsigned char ge114os9013;
extern T0* ge114ov9013;
extern T0* T298f14(T0* C);
/* GEANT_MOVE_COMMAND.set_file */
extern void T380f17(T0* C, T0* a1);
/* GEANT_MOVE_TASK.attribute_value */
extern T0* T298f13(T0* C, T0* a1);
/* GEANT_MOVE_TASK.project_variables_resolver */
extern T0* T298f6(T0* C);
/* GEANT_MOVE_TASK.target_arguments_stack */
extern T0* T298f21(T0* C);
/* GEANT_MOVE_TASK.has_attribute */
extern T1 T298f9(T0* C, T0* a1);
/* GEANT_MOVE_TASK.file_attribute_name */
extern unsigned char ge114os9012;
extern T0* ge114ov9012;
extern T0* T298f12(T0* C);
/* GEANT_MOVE_TASK.task_make */
extern void T298f27(T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_TASK.interpreting_element_make */
extern void T298f30(T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_TASK.set_project */
extern void T298f32(T0* C, T0* a1);
/* GEANT_MOVE_TASK.element_make */
extern void T298f31(T0* C, T0* a1);
/* GEANT_MOVE_TASK.set_xml_element */
extern void T298f33(T0* C, T0* a1);
/* GEANT_MOVE_TASK.set_command */
extern void T298f29(T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.make */
extern T0* T380c16(T0* a1);
/* GEANT_MOVE_COMMAND.set_project */
extern void T380f22(T0* C, T0* a1);
/* GEANT_TARGET.move_task_name */
extern unsigned char ge130os2418;
extern T0* ge130ov2418;
extern T0* T26f64(T0* C);
/* GEANT_COPY_TASK.make */
extern T0* T297c30(T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.set_fileset */
extern void T379f24(T0* C, T0* a1);
/* GEANT_COPY_TASK.fileset_element_name */
extern unsigned char ge98os8992;
extern T0* ge98ov8992;
extern T0* T297f18(T0* C);
/* GEANT_COPY_COMMAND.set_force */
extern void T379f23(T0* C, T1 a1);
/* GEANT_COPY_TASK.boolean_value */
extern T1 T297f17(T0* C, T0* a1);
/* GEANT_COPY_TASK.std */
extern T0* T297f21(T0* C);
/* GEANT_COPY_TASK.false_attribute_value */
extern T0* T297f26(T0* C);
/* GEANT_COPY_TASK.true_attribute_value */
extern T0* T297f25(T0* C);
/* GEANT_COPY_TASK.string_ */
extern T0* T297f24(T0* C);
/* GEANT_COPY_TASK.force_attribute_name */
extern unsigned char ge98os8991;
extern T0* ge98ov8991;
extern T0* T297f16(T0* C);
/* GEANT_COPY_COMMAND.set_to_directory */
extern void T379f22(T0* C, T0* a1);
/* GEANT_COPY_TASK.to_directory_attribute_name */
extern unsigned char ge98os8990;
extern T0* ge98ov8990;
extern T0* T297f15(T0* C);
/* GEANT_COPY_COMMAND.set_to_file */
extern void T379f21(T0* C, T0* a1);
/* GEANT_COPY_TASK.to_file_attribute_name */
extern unsigned char ge98os8989;
extern T0* ge98ov8989;
extern T0* T297f14(T0* C);
/* GEANT_COPY_COMMAND.set_file */
extern void T379f20(T0* C, T0* a1);
/* GEANT_COPY_TASK.attribute_value */
extern T0* T297f13(T0* C, T0* a1);
/* GEANT_COPY_TASK.project_variables_resolver */
extern T0* T297f6(T0* C);
/* GEANT_COPY_TASK.target_arguments_stack */
extern T0* T297f23(T0* C);
/* GEANT_COPY_TASK.has_attribute */
extern T1 T297f9(T0* C, T0* a1);
/* GEANT_COPY_TASK.file_attribute_name */
extern unsigned char ge98os8988;
extern T0* ge98ov8988;
extern T0* T297f12(T0* C);
/* GEANT_COPY_TASK.task_make */
extern void T297f32(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_TASK.interpreting_element_make */
extern void T297f35(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_TASK.set_project */
extern void T297f37(T0* C, T0* a1);
/* GEANT_COPY_TASK.element_make */
extern void T297f36(T0* C, T0* a1);
/* GEANT_COPY_TASK.set_xml_element */
extern void T297f38(T0* C, T0* a1);
/* GEANT_COPY_TASK.set_command */
extern void T297f34(T0* C, T0* a1);
/* GEANT_COPY_COMMAND.make */
extern T0* T379c19(T0* a1);
/* GEANT_COPY_COMMAND.set_project */
extern void T379f26(T0* C, T0* a1);
/* GEANT_TARGET.copy_task_name */
extern unsigned char ge130os2417;
extern T0* ge130ov2417;
extern T0* T26f63(T0* C);
/* GEANT_DELETE_TASK.make */
extern T0* T296c25(T0* a1, T0* a2);
/* GEANT_DELETE_COMMAND.set_directoryset */
extern void T376f22(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.make */
extern T0* T377c20(T0* a1, T0* a2);
/* GEANT_DIRECTORYSET.add_single_exclude */
extern void T378f30(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.exclude_element_name */
extern unsigned char ge128os9605;
extern T0* ge128ov9605;
extern T0* T377f12(T0* C);
/* GEANT_DIRECTORYSET.add_single_include */
extern void T378f29(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.elements_by_name */
extern T0* T377f11(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.string_ */
extern T0* T377f16(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.include_element_name */
extern unsigned char ge128os9604;
extern T0* ge128ov9604;
extern T0* T377f10(T0* C);
/* GEANT_DIRECTORYSET.set_concat */
extern void T378f28(T0* C, T1 a1);
/* GEANT_DIRECTORYSET_ELEMENT.boolean_value */
extern T1 T377f9(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.std */
extern T0* T377f19(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.false_attribute_value */
extern T0* T377f18(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.true_attribute_value */
extern T0* T377f17(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.concat_attribute_name */
extern unsigned char ge128os9603;
extern T0* ge128ov9603;
extern T0* T377f8(T0* C);
/* GEANT_DIRECTORYSET.set_exclude_wc_string */
extern void T378f27(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.exclude_attribute_name */
extern unsigned char ge128os9602;
extern T0* ge128ov9602;
extern T0* T377f7(T0* C);
/* GEANT_DIRECTORYSET.set_include_wc_string */
extern void T378f26(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.include_attribute_name */
extern unsigned char ge128os9601;
extern T0* ge128ov9601;
extern T0* T377f6(T0* C);
/* GEANT_DIRECTORYSET.set_directory_name */
extern void T378f25(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.attribute_value */
extern T0* T377f5(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.project_variables_resolver */
extern T0* T377f15(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.target_arguments_stack */
extern T0* T377f14(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.has_attribute */
extern T1 T377f4(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.directory_attribute_name */
extern unsigned char ge128os9600;
extern T0* ge128ov9600;
extern T0* T377f13(T0* C);
/* GEANT_DIRECTORYSET.make */
extern T0* T378c21(T0* a1);
/* GEANT_DIRECTORYSET.set_directory_name_variable_name */
extern void T378f31(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.make */
extern void T377f20p1(T0* C, T0* a1, T0* a2);
/* GEANT_DIRECTORYSET_ELEMENT.set_project */
extern void T377f22(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.element_make */
extern void T377f21(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.set_xml_element */
extern void T377f23(T0* C, T0* a1);
/* GEANT_DELETE_TASK.directoryset_element_name */
extern unsigned char ge99os8970;
extern T0* ge99ov8970;
extern T0* T296f16(T0* C);
/* GEANT_DELETE_COMMAND.set_fileset */
extern void T376f21(T0* C, T0* a1);
/* GEANT_DELETE_TASK.fileset_element_name */
extern unsigned char ge99os8969;
extern T0* ge99ov8969;
extern T0* T296f15(T0* C);
/* GEANT_DELETE_COMMAND.set_file */
extern void T376f20(T0* C, T0* a1);
/* GEANT_DELETE_TASK.file_attribute_name */
extern unsigned char ge99os8968;
extern T0* ge99ov8968;
extern T0* T296f14(T0* C);
/* GEANT_DELETE_COMMAND.set_directory */
extern void T376f19(T0* C, T0* a1);
/* GEANT_DELETE_TASK.attribute_value */
extern T0* T296f13(T0* C, T0* a1);
/* GEANT_DELETE_TASK.project_variables_resolver */
extern T0* T296f6(T0* C);
/* GEANT_DELETE_TASK.target_arguments_stack */
extern T0* T296f21(T0* C);
/* GEANT_DELETE_TASK.has_attribute */
extern T1 T296f9(T0* C, T0* a1);
/* GEANT_DELETE_TASK.directory_attribute_name */
extern unsigned char ge99os8967;
extern T0* ge99ov8967;
extern T0* T296f12(T0* C);
/* GEANT_DELETE_TASK.task_make */
extern void T296f27(T0* C, T0* a1, T0* a2);
/* GEANT_DELETE_TASK.interpreting_element_make */
extern void T296f30(T0* C, T0* a1, T0* a2);
/* GEANT_DELETE_TASK.set_project */
extern void T296f32(T0* C, T0* a1);
/* GEANT_DELETE_TASK.element_make */
extern void T296f31(T0* C, T0* a1);
/* GEANT_DELETE_TASK.set_xml_element */
extern void T296f33(T0* C, T0* a1);
/* GEANT_DELETE_TASK.set_command */
extern void T296f29(T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.make */
extern T0* T376c18(T0* a1);
/* GEANT_DELETE_COMMAND.set_project */
extern void T376f24(T0* C, T0* a1);
/* GEANT_TARGET.delete_task_name */
extern unsigned char ge130os2416;
extern T0* ge130ov2416;
extern T0* T26f62(T0* C);
/* GEANT_MKDIR_TASK.make */
extern T0* T295c22(T0* a1, T0* a2);
/* GEANT_MKDIR_COMMAND.set_directory */
extern void T375f11(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.attribute_value */
extern T0* T295f13(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.project_variables_resolver */
extern T0* T295f6(T0* C);
/* GEANT_MKDIR_TASK.target_arguments_stack */
extern T0* T295f18(T0* C);
/* GEANT_MKDIR_TASK.has_attribute */
extern T1 T295f9(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.directory_attribute_name */
extern unsigned char ge113os8959;
extern T0* ge113ov8959;
extern T0* T295f12(T0* C);
/* GEANT_MKDIR_TASK.task_make */
extern void T295f24(T0* C, T0* a1, T0* a2);
/* GEANT_MKDIR_TASK.interpreting_element_make */
extern void T295f27(T0* C, T0* a1, T0* a2);
/* GEANT_MKDIR_TASK.set_project */
extern void T295f29(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.element_make */
extern void T295f28(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.set_xml_element */
extern void T295f30(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.set_command */
extern void T295f26(T0* C, T0* a1);
/* GEANT_MKDIR_COMMAND.make */
extern T0* T375c10(T0* a1);
/* GEANT_MKDIR_COMMAND.set_project */
extern void T375f13(T0* C, T0* a1);
/* GEANT_TARGET.mkdir_task_name */
extern unsigned char ge130os2415;
extern T0* ge130ov2415;
extern T0* T26f61(T0* C);
/* GEANT_ECHO_TASK.make */
extern T0* T294c28(T0* a1, T0* a2);
/* GEANT_ECHO_COMMAND.set_append */
extern void T374f11(T0* C, T1 a1);
/* GEANT_ECHO_TASK.boolean_value */
extern T1 T294f16(T0* C, T0* a1);
/* GEANT_ECHO_TASK.std */
extern T0* T294f19(T0* C);
/* GEANT_ECHO_TASK.false_attribute_value */
extern T0* T294f24(T0* C);
/* GEANT_ECHO_TASK.true_attribute_value */
extern T0* T294f23(T0* C);
/* GEANT_ECHO_TASK.string_ */
extern T0* T294f22(T0* C);
/* GEANT_ECHO_TASK.append_attribute_name */
extern unsigned char ge100os8947;
extern T0* ge100ov8947;
extern T0* T294f15(T0* C);
/* GEANT_ECHO_COMMAND.set_to_file */
extern void T374f10(T0* C, T0* a1);
/* GEANT_ECHO_TASK.to_file_attribute_name */
extern unsigned char ge100os8946;
extern T0* ge100ov8946;
extern T0* T294f14(T0* C);
/* GEANT_ECHO_COMMAND.set_message */
extern void T374f9(T0* C, T0* a1);
/* GEANT_ECHO_TASK.attribute_value */
extern T0* T294f13(T0* C, T0* a1);
/* GEANT_ECHO_TASK.project_variables_resolver */
extern T0* T294f6(T0* C);
/* GEANT_ECHO_TASK.target_arguments_stack */
extern T0* T294f21(T0* C);
/* GEANT_ECHO_TASK.exit_application */
extern void T294f31(T0* C, T6 a1, T0* a2);
/* GEANT_ECHO_TASK.exceptions */
extern T0* T294f20(T0* C);
/* GEANT_ECHO_TASK.has_attribute */
extern T1 T294f9(T0* C, T0* a1);
/* GEANT_ECHO_TASK.message_attribute_name */
extern unsigned char ge100os8945;
extern T0* ge100ov8945;
extern T0* T294f12(T0* C);
/* UC_UTF8_STRING.old_is_empty */
extern T1 T195f50(T0* C);
/* STRING_8.is_empty */
extern T1 T17f29(T0* C);
/* XM_ELEMENT.text */
extern T0* T97f26(T0* C);
/* KL_STRING_ROUTINES.appended_string */
extern T0* T76f5(T0* C, T0* a1, T0* a2);
/* STRING_8.append_string */
extern void T17f39(T0* C, T0* a1);
/* KL_STRING_ROUTINES.concat */
extern T0* T76f6(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.prefixed_string */
extern T0* T195f8(T0* C, T0* a1);
/* XM_ELEMENT.string_ */
extern T0* T97f27(T0* C);
/* XM_NODE_TYPER.is_character_data */
extern T1 T320f10(T0* C);
/* GEANT_ECHO_TASK.task_make */
extern void T294f30(T0* C, T0* a1, T0* a2);
/* GEANT_ECHO_TASK.interpreting_element_make */
extern void T294f33(T0* C, T0* a1, T0* a2);
/* GEANT_ECHO_TASK.set_project */
extern void T294f35(T0* C, T0* a1);
/* GEANT_ECHO_TASK.element_make */
extern void T294f34(T0* C, T0* a1);
/* GEANT_ECHO_TASK.set_xml_element */
extern void T294f36(T0* C, T0* a1);
/* GEANT_ECHO_TASK.set_command */
extern void T294f32(T0* C, T0* a1);
/* GEANT_ECHO_COMMAND.make */
extern T0* T374c8(T0* a1);
/* GEANT_ECHO_COMMAND.set_project */
extern void T374f13(T0* C, T0* a1);
/* GEANT_TARGET.echo_task_name */
extern unsigned char ge130os2414;
extern T0* ge130ov2414;
extern T0* T26f60(T0* C);
/* GEANT_GEANT_TASK.make */
extern T0* T293c34(T0* a1, T0* a2);
/* GEANT_GEANT_TASK.arguments_string_splitter */
extern T0* T293f22(T0* C);
/* GEANT_GEANT_TASK.exit_application */
extern void T293f37(T0* C, T6 a1, T0* a2);
/* GEANT_GEANT_TASK.exceptions */
extern T0* T293f26(T0* C);
/* GEANT_GEANT_TASK.std */
extern T0* T293f25(T0* C);
/* GEANT_GEANT_TASK.arguments_attribute_name */
extern unsigned char ge103os8918;
extern T0* ge103ov8918;
extern T0* T293f21(T0* C);
/* GEANT_GEANT_TASK.elements_by_name */
extern T0* T293f20(T0* C, T0* a1);
/* GEANT_GEANT_TASK.string_ */
extern T0* T293f28(T0* C);
/* GEANT_GEANT_TASK.argument_element_name */
extern unsigned char ge103os8917;
extern T0* ge103ov8917;
extern T0* T293f19(T0* C);
/* GEANT_GEANT_TASK.fork_attribute_name */
extern unsigned char ge103os8915;
extern T0* ge103ov8915;
extern T0* T293f18(T0* C);
/* GEANT_GEANT_COMMAND.set_fileset */
extern void T372f29(T0* C, T0* a1);
/* GEANT_GEANT_TASK.fileset_element_name */
extern unsigned char ge103os8916;
extern T0* ge103ov8916;
extern T0* T293f17(T0* C);
/* GEANT_GEANT_COMMAND.set_fork */
extern void T372f28(T0* C, T1 a1);
/* GEANT_GEANT_COMMAND.set_filename */
extern void T372f27(T0* C, T0* a1);
/* GEANT_GEANT_TASK.filename_attribute_name */
extern unsigned char ge103os8912;
extern T0* ge103ov8912;
extern T0* T293f16(T0* C);
/* GEANT_GEANT_COMMAND.set_reuse_variables */
extern void T372f26(T0* C, T1 a1);
/* GEANT_GEANT_TASK.boolean_value */
extern T1 T293f15(T0* C, T0* a1);
/* GEANT_GEANT_TASK.false_attribute_value */
extern T0* T293f30(T0* C);
/* GEANT_GEANT_TASK.true_attribute_value */
extern T0* T293f29(T0* C);
/* GEANT_GEANT_TASK.reuse_variables_attribute_name */
extern unsigned char ge103os8914;
extern T0* ge103ov8914;
extern T0* T293f14(T0* C);
/* GEANT_GEANT_COMMAND.set_start_target_name */
extern void T372f25(T0* C, T0* a1);
/* GEANT_GEANT_TASK.attribute_value */
extern T0* T293f13(T0* C, T0* a1);
/* GEANT_GEANT_TASK.project_variables_resolver */
extern T0* T293f6(T0* C);
/* GEANT_GEANT_TASK.target_arguments_stack */
extern T0* T293f27(T0* C);
/* GEANT_GEANT_TASK.has_attribute */
extern T1 T293f9(T0* C, T0* a1);
/* GEANT_GEANT_TASK.start_target_attribute_name */
extern unsigned char ge103os8913;
extern T0* ge103ov8913;
extern T0* T293f12(T0* C);
/* GEANT_GEANT_TASK.task_make */
extern void T293f36(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_TASK.interpreting_element_make */
extern void T293f39(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_TASK.set_project */
extern void T293f41(T0* C, T0* a1);
/* GEANT_GEANT_TASK.element_make */
extern void T293f40(T0* C, T0* a1);
/* GEANT_GEANT_TASK.set_xml_element */
extern void T293f42(T0* C, T0* a1);
/* GEANT_GEANT_TASK.set_command */
extern void T293f38(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.make */
extern T0* T372c24(T0* a1);
/* GEANT_GEANT_COMMAND.make */
extern void T372f24p1(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.set_project */
extern void T372f31(T0* C, T0* a1);
/* GEANT_TARGET.geant_task_name */
extern unsigned char ge130os2413;
extern T0* ge130ov2413;
extern T0* T26f59(T0* C);
/* GEANT_GETEST_TASK.make */
extern T0* T292c38(T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force */
extern void T80f70(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_put */
extern void T80f62(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_put */
extern void T80f60(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_put */
extern void T80f59(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_item */
extern T6 T80f36(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_item */
extern T6 T80f34(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].hash_position */
extern T6 T80f35(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].resize */
extern void T80f58(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_resize */
extern void T80f68(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_resize */
extern void T80f67(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_resize */
extern void T80f66(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_item */
extern T0* T80f30(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_resize */
extern void T80f65(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_capacity */
extern T6 T80f32(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_put */
extern void T80f61(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].search_position */
extern void T80f57(T0* C, T0* a1);
/* GEANT_GETEST_TASK.define_element_name */
extern unsigned char ge107os8883;
extern T0* ge107ov8883;
extern T0* T292f28(T0* C);
/* GEANT_GETEST_TASK.true_attribute_value */
extern T0* T292f27(T0* C);
/* GEANT_GETEST_TASK.string_ */
extern T0* T292f26(T0* C);
/* GEANT_GETEST_TASK.elements_by_name */
extern T0* T292f25(T0* C, T0* a1);
/* GEANT_GETEST_TASK.attribute_element_name */
extern unsigned char ge107os8882;
extern T0* ge107ov8882;
extern T0* T292f24(T0* C);
/* GEANT_GETEST_COMMAND.set_abort */
extern void T371f31(T0* C, T1 a1);
/* GEANT_GETEST_TASK.abort_attribute_name */
extern unsigned char ge107os8881;
extern T0* ge107ov8881;
extern T0* T292f23(T0* C);
/* GEANT_GETEST_COMMAND.set_execution */
extern void T371f30(T0* C, T1 a1);
/* GEANT_GETEST_TASK.execution_attribute_name */
extern unsigned char ge107os8880;
extern T0* ge107ov8880;
extern T0* T292f22(T0* C);
/* GEANT_GETEST_COMMAND.set_compilation */
extern void T371f29(T0* C, T1 a1);
/* GEANT_GETEST_TASK.compilation_attribute_name */
extern unsigned char ge107os8879;
extern T0* ge107ov8879;
extern T0* T292f21(T0* C);
/* GEANT_GETEST_COMMAND.set_generation */
extern void T371f28(T0* C, T1 a1);
/* GEANT_GETEST_TASK.generation_attribute_name */
extern unsigned char ge107os8878;
extern T0* ge107ov8878;
extern T0* T292f20(T0* C);
/* GEANT_GETEST_COMMAND.set_default_test_included */
extern void T371f27(T0* C, T1 a1);
/* GEANT_GETEST_TASK.default_test_attribute_name */
extern unsigned char ge107os8877;
extern T0* ge107ov8877;
extern T0* T292f19(T0* C);
/* GEANT_GETEST_COMMAND.set_feature_regexp */
extern void T371f26(T0* C, T0* a1);
/* GEANT_GETEST_TASK.feature_attribute_name */
extern unsigned char ge107os8876;
extern T0* ge107ov8876;
extern T0* T292f18(T0* C);
/* GEANT_GETEST_COMMAND.set_class_regexp */
extern void T371f25(T0* C, T0* a1);
/* GEANT_GETEST_TASK.class_attribute_name */
extern unsigned char ge107os8875;
extern T0* ge107ov8875;
extern T0* T292f17(T0* C);
/* GEANT_GETEST_COMMAND.set_compile */
extern void T371f24(T0* C, T0* a1);
/* GEANT_GETEST_TASK.compile_attribute_name */
extern unsigned char ge107os8874;
extern T0* ge107ov8874;
extern T0* T292f16(T0* C);
/* GEANT_GETEST_COMMAND.set_config_filename */
extern void T371f23(T0* C, T0* a1);
/* GEANT_GETEST_TASK.attribute_value */
extern T0* T292f15(T0* C, T0* a1);
/* GEANT_GETEST_TASK.project_variables_resolver */
extern T0* T292f6(T0* C);
/* GEANT_GETEST_TASK.target_arguments_stack */
extern T0* T292f34(T0* C);
/* GEANT_GETEST_TASK.config_filename_attribute_name */
extern unsigned char ge107os8873;
extern T0* ge107ov8873;
extern T0* T292f14(T0* C);
/* GEANT_GETEST_COMMAND.set_verbose */
extern void T371f22(T0* C, T1 a1);
/* GEANT_GETEST_TASK.boolean_value */
extern T1 T292f13(T0* C, T0* a1);
/* GEANT_GETEST_TASK.std */
extern T0* T292f31(T0* C);
/* GEANT_GETEST_TASK.false_attribute_value */
extern T0* T292f33(T0* C);
/* GEANT_GETEST_TASK.has_attribute */
extern T1 T292f9(T0* C, T0* a1);
/* GEANT_GETEST_TASK.verbose_attribute_name */
extern unsigned char ge107os8872;
extern T0* ge107ov8872;
extern T0* T292f12(T0* C);
/* GEANT_GETEST_TASK.task_make */
extern void T292f40(T0* C, T0* a1, T0* a2);
/* GEANT_GETEST_TASK.interpreting_element_make */
extern void T292f43(T0* C, T0* a1, T0* a2);
/* GEANT_GETEST_TASK.set_project */
extern void T292f45(T0* C, T0* a1);
/* GEANT_GETEST_TASK.element_make */
extern void T292f44(T0* C, T0* a1);
/* GEANT_GETEST_TASK.set_xml_element */
extern void T292f46(T0* C, T0* a1);
/* GEANT_GETEST_TASK.set_command */
extern void T292f42(T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.make */
extern T0* T371c21(T0* a1);
/* GEANT_GETEST_COMMAND.make */
extern void T371f21p1(T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.set_project */
extern void T371f33(T0* C, T0* a1);
/* GEANT_TARGET.getest_task_name */
extern unsigned char ge130os2412;
extern T0* ge130ov2412;
extern T0* T26f58(T0* C);
/* GEANT_GEPP_TASK.make */
extern T0* T291c33(T0* a1, T0* a2);
/* GEANT_GEPP_COMMAND.set_fileset */
extern void T370f26(T0* C, T0* a1);
/* GEANT_GEPP_TASK.fileset_element_name */
extern unsigned char ge106os8847;
extern T0* ge106ov8847;
extern T0* T291f21(T0* C);
/* GEANT_GEPP_COMMAND.set_force */
extern void T370f25(T0* C, T1 a1);
/* GEANT_GEPP_TASK.force_attribute_name */
extern unsigned char ge106os8846;
extern T0* ge106ov8846;
extern T0* T291f20(T0* C);
/* GEANT_GEPP_COMMAND.set_to_directory */
extern void T370f24(T0* C, T0* a1);
/* GEANT_GEPP_TASK.to_directory_attribute_name */
extern unsigned char ge106os8845;
extern T0* ge106ov8845;
extern T0* T291f19(T0* C);
/* GEANT_GEPP_TASK.elements_by_name */
extern T0* T291f18(T0* C, T0* a1);
/* GEANT_GEPP_TASK.string_ */
extern T0* T291f27(T0* C);
/* GEANT_GEPP_TASK.define_element_name */
extern unsigned char ge106os8844;
extern T0* ge106ov8844;
extern T0* T291f17(T0* C);
/* GEANT_GEPP_COMMAND.set_empty_lines */
extern void T370f23(T0* C, T1 a1);
/* GEANT_GEPP_TASK.boolean_value */
extern T1 T291f16(T0* C, T0* a1);
/* GEANT_GEPP_TASK.std */
extern T0* T291f24(T0* C);
/* GEANT_GEPP_TASK.false_attribute_value */
extern T0* T291f29(T0* C);
/* GEANT_GEPP_TASK.true_attribute_value */
extern T0* T291f28(T0* C);
/* GEANT_GEPP_TASK.lines_attribute_name */
extern unsigned char ge106os8843;
extern T0* ge106ov8843;
extern T0* T291f15(T0* C);
/* GEANT_GEPP_COMMAND.set_output_filename */
extern void T370f22(T0* C, T0* a1);
/* GEANT_GEPP_TASK.output_filename_attribute_name */
extern unsigned char ge106os8842;
extern T0* ge106ov8842;
extern T0* T291f14(T0* C);
/* GEANT_GEPP_COMMAND.set_input_filename */
extern void T370f21(T0* C, T0* a1);
/* GEANT_GEPP_TASK.attribute_value */
extern T0* T291f13(T0* C, T0* a1);
/* GEANT_GEPP_TASK.project_variables_resolver */
extern T0* T291f6(T0* C);
/* GEANT_GEPP_TASK.target_arguments_stack */
extern T0* T291f26(T0* C);
/* GEANT_GEPP_TASK.has_attribute */
extern T1 T291f9(T0* C, T0* a1);
/* GEANT_GEPP_TASK.input_filename_attribute_name */
extern unsigned char ge106os8841;
extern T0* ge106ov8841;
extern T0* T291f12(T0* C);
/* GEANT_GEPP_TASK.task_make */
extern void T291f35(T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_TASK.interpreting_element_make */
extern void T291f38(T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_TASK.set_project */
extern void T291f40(T0* C, T0* a1);
/* GEANT_GEPP_TASK.element_make */
extern void T291f39(T0* C, T0* a1);
/* GEANT_GEPP_TASK.set_xml_element */
extern void T291f41(T0* C, T0* a1);
/* GEANT_GEPP_TASK.set_command */
extern void T291f37(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.make */
extern T0* T370c20(T0* a1);
/* GEANT_GEPP_COMMAND.make */
extern void T370f20p1(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.set_project */
extern void T370f28(T0* C, T0* a1);
/* GEANT_TARGET.gepp_task_name */
extern unsigned char ge130os2411;
extern T0* ge130ov2411;
extern T0* T26f57(T0* C);
/* GEANT_GEYACC_TASK.make */
extern T0* T290c33(T0* a1, T0* a2);
/* GEANT_GEYACC_COMMAND.set_input_filename */
extern void T369f26(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.input_filename_attribute_name */
extern unsigned char ge109os8816;
extern T0* ge109ov8816;
extern T0* T290f21(T0* C);
/* GEANT_GEYACC_COMMAND.set_output_filename */
extern void T369f25(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.output_filename_attribute_name */
extern unsigned char ge109os8815;
extern T0* ge109ov8815;
extern T0* T290f20(T0* C);
/* GEANT_GEYACC_COMMAND.set_tokens_filename */
extern void T369f24(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.tokens_filename_attribute_name */
extern unsigned char ge109os8814;
extern T0* ge109ov8814;
extern T0* T290f19(T0* C);
/* GEANT_GEYACC_COMMAND.set_tokens_classname */
extern void T369f23(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.tokens_classname_attribute_name */
extern unsigned char ge109os8813;
extern T0* ge109ov8813;
extern T0* T290f18(T0* C);
/* GEANT_GEYACC_COMMAND.set_new_typing */
extern void T369f22(T0* C, T1 a1);
/* GEANT_GEYACC_TASK.new_typing_attribute_name */
extern unsigned char ge109os8818;
extern T0* ge109ov8818;
extern T0* T290f17(T0* C);
/* GEANT_GEYACC_COMMAND.set_old_typing */
extern void T369f21(T0* C, T1 a1);
/* GEANT_GEYACC_TASK.old_typing_attribute_name */
extern unsigned char ge109os8817;
extern T0* ge109ov8817;
extern T0* T290f16(T0* C);
/* GEANT_GEYACC_COMMAND.set_verbose_filename */
extern void T369f20(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.attribute_value */
extern T0* T290f15(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.project_variables_resolver */
extern T0* T290f6(T0* C);
/* GEANT_GEYACC_TASK.target_arguments_stack */
extern T0* T290f29(T0* C);
/* GEANT_GEYACC_TASK.verbose_filename_attribute_name */
extern unsigned char ge109os8812;
extern T0* ge109ov8812;
extern T0* T290f14(T0* C);
/* GEANT_GEYACC_COMMAND.set_separate_actions */
extern void T369f19(T0* C, T1 a1);
/* GEANT_GEYACC_TASK.boolean_value */
extern T1 T290f13(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.std */
extern T0* T290f24(T0* C);
/* GEANT_GEYACC_TASK.false_attribute_value */
extern T0* T290f28(T0* C);
/* GEANT_GEYACC_TASK.true_attribute_value */
extern T0* T290f27(T0* C);
/* GEANT_GEYACC_TASK.string_ */
extern T0* T290f26(T0* C);
/* GEANT_GEYACC_TASK.has_attribute */
extern T1 T290f9(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.separate_actions_attribute_name */
extern unsigned char ge109os8811;
extern T0* ge109ov8811;
extern T0* T290f12(T0* C);
/* GEANT_GEYACC_TASK.task_make */
extern void T290f35(T0* C, T0* a1, T0* a2);
/* GEANT_GEYACC_TASK.interpreting_element_make */
extern void T290f38(T0* C, T0* a1, T0* a2);
/* GEANT_GEYACC_TASK.set_project */
extern void T290f40(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.element_make */
extern void T290f39(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.set_xml_element */
extern void T290f41(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.set_command */
extern void T290f37(T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.make */
extern T0* T369c18(T0* a1);
/* GEANT_GEYACC_COMMAND.make */
extern void T369f18p1(T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.set_project */
extern void T369f28(T0* C, T0* a1);
/* GEANT_TARGET.geyacc_task_name */
extern unsigned char ge130os2410;
extern T0* ge130ov2410;
extern T0* T26f56(T0* C);
/* GEANT_GELEX_TASK.make */
extern T0* T289c36(T0* a1, T0* a2);
/* GEANT_GELEX_COMMAND.set_input_filename */
extern void T368f32(T0* C, T0* a1);
/* GEANT_GELEX_TASK.input_filename_attribute_name */
extern unsigned char ge105os8782;
extern T0* ge105ov8782;
extern T0* T289f24(T0* C);
/* GEANT_GELEX_COMMAND.set_output_filename */
extern void T368f31(T0* C, T0* a1);
/* GEANT_GELEX_TASK.output_filename_attribute_name */
extern unsigned char ge105os8781;
extern T0* ge105ov8781;
extern T0* T289f23(T0* C);
/* GEANT_GELEX_COMMAND.set_separate_actions */
extern void T368f30(T0* C, T1 a1);
/* GEANT_GELEX_TASK.separate_actions_attribute_name */
extern unsigned char ge105os8780;
extern T0* ge105ov8780;
extern T0* T289f22(T0* C);
/* GEANT_GELEX_COMMAND.set_no_warn */
extern void T368f29(T0* C, T1 a1);
/* GEANT_GELEX_TASK.no_warn_attribute_name */
extern unsigned char ge105os8779;
extern T0* ge105ov8779;
extern T0* T289f21(T0* C);
/* GEANT_GELEX_COMMAND.set_no_default */
extern void T368f28(T0* C, T1 a1);
/* GEANT_GELEX_TASK.no_default_attribute_name */
extern unsigned char ge105os8778;
extern T0* ge105ov8778;
extern T0* T289f20(T0* C);
/* GEANT_GELEX_COMMAND.set_meta_ecs */
extern void T368f27(T0* C, T1 a1);
/* GEANT_GELEX_TASK.meta_ecs_attribute_name */
extern unsigned char ge105os8777;
extern T0* ge105ov8777;
extern T0* T289f19(T0* C);
/* GEANT_GELEX_COMMAND.set_case_insensitive */
extern void T368f26(T0* C, T1 a1);
/* GEANT_GELEX_TASK.case_insensitive_attribute_name */
extern unsigned char ge105os8776;
extern T0* ge105ov8776;
extern T0* T289f18(T0* C);
/* GEANT_GELEX_COMMAND.set_full */
extern void T368f25(T0* C, T1 a1);
/* GEANT_GELEX_TASK.full_attribute_name */
extern unsigned char ge105os8775;
extern T0* ge105ov8775;
extern T0* T289f17(T0* C);
/* GEANT_GELEX_COMMAND.set_ecs */
extern void T368f24(T0* C, T1 a1);
/* GEANT_GELEX_TASK.ecs_attribute_name */
extern unsigned char ge105os8774;
extern T0* ge105ov8774;
extern T0* T289f16(T0* C);
/* GEANT_GELEX_COMMAND.set_backup */
extern void T368f23(T0* C, T1 a1);
/* GEANT_GELEX_TASK.boolean_value */
extern T1 T289f15(T0* C, T0* a1);
/* GEANT_GELEX_TASK.std */
extern T0* T289f27(T0* C);
/* GEANT_GELEX_TASK.false_attribute_value */
extern T0* T289f32(T0* C);
/* GEANT_GELEX_TASK.true_attribute_value */
extern T0* T289f31(T0* C);
/* GEANT_GELEX_TASK.string_ */
extern T0* T289f30(T0* C);
/* GEANT_GELEX_TASK.backup_attribute_name */
extern unsigned char ge105os8773;
extern T0* ge105ov8773;
extern T0* T289f14(T0* C);
/* GEANT_GELEX_COMMAND.set_size */
extern void T368f22(T0* C, T0* a1);
/* GEANT_GELEX_TASK.attribute_value */
extern T0* T289f13(T0* C, T0* a1);
/* GEANT_GELEX_TASK.project_variables_resolver */
extern T0* T289f6(T0* C);
/* GEANT_GELEX_TASK.target_arguments_stack */
extern T0* T289f29(T0* C);
/* GEANT_GELEX_TASK.has_attribute */
extern T1 T289f9(T0* C, T0* a1);
/* GEANT_GELEX_TASK.size_attribute_name */
extern unsigned char ge105os8772;
extern T0* ge105ov8772;
extern T0* T289f12(T0* C);
/* GEANT_GELEX_TASK.task_make */
extern void T289f38(T0* C, T0* a1, T0* a2);
/* GEANT_GELEX_TASK.interpreting_element_make */
extern void T289f41(T0* C, T0* a1, T0* a2);
/* GEANT_GELEX_TASK.set_project */
extern void T289f43(T0* C, T0* a1);
/* GEANT_GELEX_TASK.element_make */
extern void T289f42(T0* C, T0* a1);
/* GEANT_GELEX_TASK.set_xml_element */
extern void T289f44(T0* C, T0* a1);
/* GEANT_GELEX_TASK.set_command */
extern void T289f40(T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.make */
extern T0* T368c21(T0* a1);
/* GEANT_GELEX_COMMAND.make */
extern void T368f21p1(T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.set_project */
extern void T368f34(T0* C, T0* a1);
/* GEANT_TARGET.gelex_task_name */
extern unsigned char ge130os2409;
extern T0* ge130ov2409;
extern T0* T26f55(T0* C);
/* GEANT_GEXACE_TASK.make */
extern T0* T288c34(T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force_last */
extern void T80f69(T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.elements_by_name */
extern T0* T288f22(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.string_ */
extern T0* T288f27(T0* C);
/* GEANT_GEXACE_TASK.define_element_name */
extern unsigned char ge108os8746;
extern T0* ge108ov8746;
extern T0* T288f21(T0* C);
/* GEANT_GEXACE_COMMAND.set_output_filename */
extern void T366f29(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.output_filename_attribute_name */
extern unsigned char ge108os8745;
extern T0* ge108ov8745;
extern T0* T288f20(T0* C);
/* GEANT_GEXACE_COMMAND.set_xace_filename */
extern void T366f28(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.xace_filename_attribute_name */
extern unsigned char ge108os8744;
extern T0* ge108ov8744;
extern T0* T288f19(T0* C);
/* GEANT_GEXACE_COMMAND.set_format */
extern void T366f27(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.format_attribute_name */
extern unsigned char ge108os8743;
extern T0* ge108ov8743;
extern T0* T288f18(T0* C);
/* GEANT_GEXACE_COMMAND.set_library_command */
extern void T366f26(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.library_attribute_name */
extern unsigned char ge108os8742;
extern T0* ge108ov8742;
extern T0* T288f17(T0* C);
/* GEANT_GEXACE_COMMAND.set_system_command */
extern void T366f25(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.attribute_value */
extern T0* T288f16(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.project_variables_resolver */
extern T0* T288f6(T0* C);
/* GEANT_GEXACE_TASK.target_arguments_stack */
extern T0* T288f30(T0* C);
/* GEANT_GEXACE_TASK.system_attribute_name */
extern unsigned char ge108os8741;
extern T0* ge108ov8741;
extern T0* T288f15(T0* C);
/* GEANT_GEXACE_COMMAND.set_validate_command */
extern void T366f24(T0* C, T1 a1);
/* GEANT_GEXACE_TASK.validate_attribute_name */
extern unsigned char ge108os8740;
extern T0* ge108ov8740;
extern T0* T288f14(T0* C);
/* GEANT_GEXACE_COMMAND.set_verbose */
extern void T366f23(T0* C, T1 a1);
/* GEANT_GEXACE_TASK.boolean_value */
extern T1 T288f13(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.std */
extern T0* T288f25(T0* C);
/* GEANT_GEXACE_TASK.false_attribute_value */
extern T0* T288f29(T0* C);
/* GEANT_GEXACE_TASK.true_attribute_value */
extern T0* T288f28(T0* C);
/* GEANT_GEXACE_TASK.has_attribute */
extern T1 T288f9(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.verbose_attribute_name */
extern unsigned char ge108os8739;
extern T0* ge108ov8739;
extern T0* T288f12(T0* C);
/* GEANT_GEXACE_TASK.task_make */
extern void T288f36(T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.interpreting_element_make */
extern void T288f39(T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.set_project */
extern void T288f41(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.element_make */
extern void T288f40(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.set_xml_element */
extern void T288f42(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.set_command */
extern void T288f38(T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.make */
extern T0* T366c22(T0* a1);
/* GEANT_GEXACE_COMMAND.make */
extern void T366f22p1(T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.set_project */
extern void T366f31(T0* C, T0* a1);
/* GEANT_TARGET.gexace_task_name */
extern unsigned char ge130os2408;
extern T0* ge130ov2408;
extern T0* T26f54(T0* C);
/* GEANT_UNSET_TASK.make */
extern T0* T287c22(T0* a1, T0* a2);
/* GEANT_UNSET_COMMAND.set_name */
extern void T365f7(T0* C, T0* a1);
/* GEANT_UNSET_TASK.attribute_value */
extern T0* T287f13(T0* C, T0* a1);
/* GEANT_UNSET_TASK.project_variables_resolver */
extern T0* T287f6(T0* C);
/* GEANT_UNSET_TASK.target_arguments_stack */
extern T0* T287f18(T0* C);
/* GEANT_UNSET_TASK.has_attribute */
extern T1 T287f9(T0* C, T0* a1);
/* GEANT_UNSET_TASK.name_attribute_name */
extern unsigned char ge122os8731;
extern T0* ge122ov8731;
extern T0* T287f12(T0* C);
/* GEANT_UNSET_TASK.task_make */
extern void T287f24(T0* C, T0* a1, T0* a2);
/* GEANT_UNSET_TASK.interpreting_element_make */
extern void T287f27(T0* C, T0* a1, T0* a2);
/* GEANT_UNSET_TASK.set_project */
extern void T287f29(T0* C, T0* a1);
/* GEANT_UNSET_TASK.element_make */
extern void T287f28(T0* C, T0* a1);
/* GEANT_UNSET_TASK.set_xml_element */
extern void T287f30(T0* C, T0* a1);
/* GEANT_UNSET_TASK.set_command */
extern void T287f26(T0* C, T0* a1);
/* GEANT_UNSET_COMMAND.make */
extern T0* T365c6(T0* a1);
/* GEANT_UNSET_COMMAND.set_project */
extern void T365f9(T0* C, T0* a1);
/* GEANT_TARGET.unset_task_name */
extern unsigned char ge130os2407;
extern T0* ge130ov2407;
extern T0* T26f53(T0* C);
/* GEANT_SET_TASK.make */
extern T0* T286c23(T0* a1, T0* a2);
/* GEANT_SET_COMMAND.set_value */
extern void T364f9(T0* C, T0* a1);
/* GEANT_SET_TASK.value_attribute_name */
extern unsigned char ge119os8721;
extern T0* ge119ov8721;
extern T0* T286f14(T0* C);
/* GEANT_SET_COMMAND.set_name */
extern void T364f8(T0* C, T0* a1);
/* GEANT_SET_TASK.attribute_value */
extern T0* T286f13(T0* C, T0* a1);
/* GEANT_SET_TASK.project_variables_resolver */
extern T0* T286f6(T0* C);
/* GEANT_SET_TASK.target_arguments_stack */
extern T0* T286f19(T0* C);
/* GEANT_SET_TASK.has_attribute */
extern T1 T286f9(T0* C, T0* a1);
/* GEANT_SET_TASK.name_attribute_name */
extern unsigned char ge119os8720;
extern T0* ge119ov8720;
extern T0* T286f12(T0* C);
/* GEANT_SET_TASK.task_make */
extern void T286f25(T0* C, T0* a1, T0* a2);
/* GEANT_SET_TASK.interpreting_element_make */
extern void T286f28(T0* C, T0* a1, T0* a2);
/* GEANT_SET_TASK.set_project */
extern void T286f30(T0* C, T0* a1);
/* GEANT_SET_TASK.element_make */
extern void T286f29(T0* C, T0* a1);
/* GEANT_SET_TASK.set_xml_element */
extern void T286f31(T0* C, T0* a1);
/* GEANT_SET_TASK.set_command */
extern void T286f27(T0* C, T0* a1);
/* GEANT_SET_COMMAND.make */
extern T0* T364c7(T0* a1);
/* GEANT_SET_COMMAND.set_project */
extern void T364f11(T0* C, T0* a1);
/* GEANT_TARGET.set_task_name */
extern unsigned char ge130os2406;
extern T0* ge130ov2406;
extern T0* T26f52(T0* C);
/* GEANT_LCC_TASK.make */
extern T0* T285c23(T0* a1, T0* a2);
/* GEANT_LCC_COMMAND.set_source_filename */
extern void T363f14(T0* C, T0* a1);
/* GEANT_LCC_TASK.source_filename_attribute_name */
extern unsigned char ge112os8710;
extern T0* ge112ov8710;
extern T0* T285f14(T0* C);
/* GEANT_LCC_COMMAND.set_executable */
extern void T363f13(T0* C, T0* a1);
/* GEANT_LCC_TASK.attribute_value */
extern T0* T285f13(T0* C, T0* a1);
/* GEANT_LCC_TASK.project_variables_resolver */
extern T0* T285f6(T0* C);
/* GEANT_LCC_TASK.target_arguments_stack */
extern T0* T285f19(T0* C);
/* GEANT_LCC_TASK.has_attribute */
extern T1 T285f9(T0* C, T0* a1);
/* GEANT_LCC_TASK.executable_attribute_name */
extern unsigned char ge112os8709;
extern T0* ge112ov8709;
extern T0* T285f12(T0* C);
/* GEANT_LCC_TASK.task_make */
extern void T285f25(T0* C, T0* a1, T0* a2);
/* GEANT_LCC_TASK.interpreting_element_make */
extern void T285f28(T0* C, T0* a1, T0* a2);
/* GEANT_LCC_TASK.set_project */
extern void T285f30(T0* C, T0* a1);
/* GEANT_LCC_TASK.element_make */
extern void T285f29(T0* C, T0* a1);
/* GEANT_LCC_TASK.set_xml_element */
extern void T285f31(T0* C, T0* a1);
/* GEANT_LCC_TASK.set_command */
extern void T285f27(T0* C, T0* a1);
/* GEANT_LCC_COMMAND.make */
extern T0* T363c12(T0* a1);
/* GEANT_LCC_COMMAND.set_project */
extern void T363f16(T0* C, T0* a1);
/* GEANT_TARGET.lcc_task_name */
extern unsigned char ge130os2405;
extern T0* ge130ov2405;
extern T0* T26f51(T0* C);
/* GEANT_EXEC_TASK.make */
extern T0* T284c29(T0* a1, T0* a2);
/* GEANT_EXEC_COMMAND.set_fileset */
extern void T360f16(T0* C, T0* a1);
/* GEANT_EXEC_TASK.fileset_element_name */
extern unsigned char ge101os8693;
extern T0* ge101ov8693;
extern T0* T284f17(T0* C);
/* GEANT_EXEC_COMMAND.set_accept_errors */
extern void T360f15(T0* C, T1 a1);
/* GEANT_EXEC_TASK.boolean_value */
extern T1 T284f16(T0* C, T0* a1);
/* GEANT_EXEC_TASK.std */
extern T0* T284f20(T0* C);
/* GEANT_EXEC_TASK.false_attribute_value */
extern T0* T284f25(T0* C);
/* GEANT_EXEC_TASK.true_attribute_value */
extern T0* T284f24(T0* C);
/* GEANT_EXEC_TASK.string_ */
extern T0* T284f23(T0* C);
/* GEANT_EXEC_TASK.accept_errors_attribute_name */
extern unsigned char ge101os8691;
extern T0* ge101ov8691;
extern T0* T284f15(T0* C);
/* GEANT_EXEC_COMMAND.set_exit_code_variable_name */
extern void T360f14(T0* C, T0* a1);
/* GEANT_EXEC_TASK.exit_code_variable_attribute_name */
extern unsigned char ge101os8692;
extern T0* ge101ov8692;
extern T0* T284f14(T0* C);
/* GEANT_EXEC_COMMAND.set_command_line */
extern void T360f13(T0* C, T0* a1);
/* GEANT_EXEC_TASK.attribute_value */
extern T0* T284f13(T0* C, T0* a1);
/* GEANT_EXEC_TASK.project_variables_resolver */
extern T0* T284f6(T0* C);
/* GEANT_EXEC_TASK.target_arguments_stack */
extern T0* T284f22(T0* C);
/* GEANT_EXEC_TASK.has_attribute */
extern T1 T284f9(T0* C, T0* a1);
/* GEANT_EXEC_TASK.executable_attribute_name */
extern unsigned char ge101os8690;
extern T0* ge101ov8690;
extern T0* T284f12(T0* C);
/* GEANT_EXEC_TASK.task_make */
extern void T284f31(T0* C, T0* a1, T0* a2);
/* GEANT_EXEC_TASK.interpreting_element_make */
extern void T284f34(T0* C, T0* a1, T0* a2);
/* GEANT_EXEC_TASK.set_project */
extern void T284f36(T0* C, T0* a1);
/* GEANT_EXEC_TASK.element_make */
extern void T284f35(T0* C, T0* a1);
/* GEANT_EXEC_TASK.set_xml_element */
extern void T284f37(T0* C, T0* a1);
/* GEANT_EXEC_TASK.set_command */
extern void T284f33(T0* C, T0* a1);
/* GEANT_EXEC_COMMAND.make */
extern T0* T360c12(T0* a1);
/* GEANT_EXEC_COMMAND.set_project */
extern void T360f18(T0* C, T0* a1);
/* GEANT_TARGET.exec_task_name */
extern unsigned char ge130os2404;
extern T0* ge130ov2404;
extern T0* T26f50(T0* C);
/* GEANT_VE_TASK.make */
extern T0* T283c33(T0* a1, T0* a2);
/* GEANT_VE_COMMAND.set_exit_code_variable_name */
extern void T359f27(T0* C, T0* a1);
/* GEANT_VE_TASK.attribute_value */
extern T0* T283f21(T0* C, T0* a1);
/* GEANT_VE_TASK.project_variables_resolver */
extern T0* T283f6(T0* C);
/* GEANT_VE_TASK.target_arguments_stack */
extern T0* T283f29(T0* C);
/* GEANT_VE_TASK.exit_code_variable_attribute_name */
extern unsigned char ge123os8665;
extern T0* ge123ov8665;
extern T0* T283f20(T0* C);
/* GEANT_VE_COMMAND.set_tuning_level */
extern void T359f26(T0* C, T0* a1);
/* GEANT_VE_TASK.level_attribute_name */
extern unsigned char ge123os8664;
extern T0* ge123ov8664;
extern T0* T283f19(T0* C);
/* GEANT_VE_COMMAND.set_tuned_system */
extern void T359f25(T0* C, T0* a1);
/* GEANT_VE_TASK.tune_attribute_name */
extern unsigned char ge123os8663;
extern T0* ge123ov8663;
extern T0* T283f18(T0* C);
/* GEANT_VE_COMMAND.set_recursive_clean */
extern void T359f24(T0* C, T1 a1);
/* GEANT_VE_TASK.boolean_value */
extern T1 T283f17(T0* C, T0* a1);
/* GEANT_VE_TASK.std */
extern T0* T283f24(T0* C);
/* GEANT_VE_TASK.false_attribute_value */
extern T0* T283f28(T0* C);
/* GEANT_VE_TASK.true_attribute_value */
extern T0* T283f27(T0* C);
/* GEANT_VE_TASK.string_ */
extern T0* T283f26(T0* C);
/* GEANT_VE_TASK.recursive_attribute_name */
extern unsigned char ge123os8662;
extern T0* ge123ov8662;
extern T0* T283f16(T0* C);
/* GEANT_VE_COMMAND.set_clean */
extern void T359f23(T0* C, T0* a1);
/* GEANT_VE_TASK.clean_attribute_name */
extern unsigned char ge123os8661;
extern T0* ge123ov8661;
extern T0* T283f15(T0* C);
/* GEANT_VE_COMMAND.set_xace_filename */
extern void T359f22(T0* C, T0* a1);
/* GEANT_VE_TASK.xace_attribute_name */
extern unsigned char ge123os8660;
extern T0* ge123ov8660;
extern T0* T283f14(T0* C);
/* GEANT_VE_COMMAND.set_esd_filename */
extern void T359f21(T0* C, T0* a1);
/* GEANT_VE_TASK.attribute_value_or_default */
extern T0* T283f13(T0* C, T0* a1, T0* a2);
/* GEANT_VE_TASK.has_attribute */
extern T1 T283f9(T0* C, T0* a1);
/* GEANT_VE_TASK.esd_attribute_name */
extern unsigned char ge123os8659;
extern T0* ge123ov8659;
extern T0* T283f12(T0* C);
/* GEANT_VE_TASK.task_make */
extern void T283f35(T0* C, T0* a1, T0* a2);
/* GEANT_VE_TASK.interpreting_element_make */
extern void T283f38(T0* C, T0* a1, T0* a2);
/* GEANT_VE_TASK.set_project */
extern void T283f40(T0* C, T0* a1);
/* GEANT_VE_TASK.element_make */
extern void T283f39(T0* C, T0* a1);
/* GEANT_VE_TASK.set_xml_element */
extern void T283f41(T0* C, T0* a1);
/* GEANT_VE_TASK.set_command */
extern void T283f37(T0* C, T0* a1);
/* GEANT_VE_COMMAND.make */
extern T0* T359c20(T0* a1);
/* GEANT_VE_COMMAND.set_project */
extern void T359f29(T0* C, T0* a1);
/* GEANT_TARGET.ve_task_name */
extern unsigned char ge130os2403;
extern T0* ge130ov2403;
extern T0* T26f49(T0* C);
/* GEANT_ISE_TASK.make */
extern T0* T282c32(T0* a1, T0* a2);
/* GEANT_ISE_COMMAND.set_exit_code_variable_name */
extern void T358f24(T0* C, T0* a1);
/* GEANT_ISE_TASK.attribute_value */
extern T0* T282f20(T0* C, T0* a1);
/* GEANT_ISE_TASK.project_variables_resolver */
extern T0* T282f6(T0* C);
/* GEANT_ISE_TASK.target_arguments_stack */
extern T0* T282f28(T0* C);
/* GEANT_ISE_TASK.exit_code_variable_attribute_name */
extern unsigned char ge111os8637;
extern T0* ge111ov8637;
extern T0* T282f19(T0* C);
/* GEANT_ISE_COMMAND.set_finish_freezing */
extern void T358f23(T0* C, T1 a1);
/* GEANT_ISE_TASK.finish_freezing_attribute_name */
extern unsigned char ge111os8635;
extern T0* ge111ov8635;
extern T0* T282f18(T0* C);
/* GEANT_ISE_COMMAND.set_finalize_mode */
extern void T358f22(T0* C, T1 a1);
/* GEANT_ISE_TASK.boolean_value */
extern T1 T282f17(T0* C, T0* a1);
/* GEANT_ISE_TASK.std */
extern T0* T282f23(T0* C);
/* GEANT_ISE_TASK.false_attribute_value */
extern T0* T282f27(T0* C);
/* GEANT_ISE_TASK.true_attribute_value */
extern T0* T282f26(T0* C);
/* GEANT_ISE_TASK.string_ */
extern T0* T282f25(T0* C);
/* GEANT_ISE_TASK.finalize_attribute_name */
extern unsigned char ge111os8634;
extern T0* ge111ov8634;
extern T0* T282f16(T0* C);
/* GEANT_ISE_COMMAND.set_clean */
extern void T358f21(T0* C, T0* a1);
/* GEANT_ISE_TASK.clean_attribute_name */
extern unsigned char ge111os8636;
extern T0* ge111ov8636;
extern T0* T282f15(T0* C);
/* GEANT_ISE_COMMAND.set_system_name */
extern void T358f20(T0* C, T0* a1);
/* GEANT_ISE_TASK.system_attribute_name */
extern unsigned char ge111os8633;
extern T0* ge111ov8633;
extern T0* T282f14(T0* C);
/* GEANT_ISE_COMMAND.set_ace_filename */
extern void T358f19(T0* C, T0* a1);
/* GEANT_ISE_TASK.attribute_value_or_default */
extern T0* T282f13(T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.has_attribute */
extern T1 T282f9(T0* C, T0* a1);
/* GEANT_ISE_TASK.ace_attribute_name */
extern unsigned char ge111os8632;
extern T0* ge111ov8632;
extern T0* T282f12(T0* C);
/* GEANT_ISE_TASK.task_make */
extern void T282f34(T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.interpreting_element_make */
extern void T282f37(T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.set_project */
extern void T282f39(T0* C, T0* a1);
/* GEANT_ISE_TASK.element_make */
extern void T282f38(T0* C, T0* a1);
/* GEANT_ISE_TASK.set_xml_element */
extern void T282f40(T0* C, T0* a1);
/* GEANT_ISE_TASK.set_command */
extern void T282f36(T0* C, T0* a1);
/* GEANT_ISE_COMMAND.make */
extern T0* T358c18(T0* a1);
/* GEANT_ISE_COMMAND.set_project */
extern void T358f26(T0* C, T0* a1);
/* GEANT_TARGET.ise_task_name */
extern unsigned char ge130os2402;
extern T0* ge130ov2402;
extern T0* T26f48(T0* C);
/* GEANT_SE_TASK.make */
extern T0* T281c34(T0* a1, T0* a2);
/* GEANT_SE_COMMAND.set_exit_code_variable_name */
extern void T357f32(T0* C, T0* a1);
/* GEANT_SE_TASK.exit_code_variable_attribute_name */
extern unsigned char ge120os8604;
extern T0* ge120ov8604;
extern T0* T281f22(T0* C);
/* GEANT_SE_COMMAND.set_no_style_warning */
extern void T357f31(T0* C, T1 a1);
/* GEANT_SE_TASK.no_style_warning_attribute_name */
extern unsigned char ge120os8602;
extern T0* ge120ov8602;
extern T0* T281f21(T0* C);
/* GEANT_SE_COMMAND.set_case_insensitive */
extern void T357f30(T0* C, T1 a1);
/* GEANT_SE_TASK.boolean_value */
extern T1 T281f20(T0* C, T0* a1);
/* GEANT_SE_TASK.std */
extern T0* T281f25(T0* C);
/* GEANT_SE_TASK.false_attribute_value */
extern T0* T281f30(T0* C);
/* GEANT_SE_TASK.true_attribute_value */
extern T0* T281f29(T0* C);
/* GEANT_SE_TASK.string_ */
extern T0* T281f28(T0* C);
/* GEANT_SE_TASK.case_insensitive_attribute_name */
extern unsigned char ge120os8601;
extern T0* ge120ov8601;
extern T0* T281f19(T0* C);
/* GEANT_SE_COMMAND.set_executable */
extern void T357f29(T0* C, T0* a1);
/* GEANT_SE_TASK.executable_attribute_name */
extern unsigned char ge120os8600;
extern T0* ge120ov8600;
extern T0* T281f18(T0* C);
/* GEANT_SE_COMMAND.set_creation_procedure */
extern void T357f28(T0* C, T0* a1);
/* GEANT_SE_TASK.creation_procedure_attribute_name */
extern unsigned char ge120os8599;
extern T0* ge120ov8599;
extern T0* T281f17(T0* C);
/* GEANT_SE_COMMAND.set_root_class */
extern void T357f27(T0* C, T0* a1);
/* GEANT_SE_TASK.attribute_value */
extern T0* T281f16(T0* C, T0* a1);
/* GEANT_SE_TASK.project_variables_resolver */
extern T0* T281f6(T0* C);
/* GEANT_SE_TASK.target_arguments_stack */
extern T0* T281f27(T0* C);
/* GEANT_SE_TASK.root_class_attribute_name */
extern unsigned char ge120os8598;
extern T0* ge120ov8598;
extern T0* T281f15(T0* C);
/* GEANT_SE_COMMAND.set_clean */
extern void T357f26(T0* C, T0* a1);
/* GEANT_SE_TASK.clean_attribute_name */
extern unsigned char ge120os8603;
extern T0* ge120ov8603;
extern T0* T281f14(T0* C);
/* GEANT_SE_COMMAND.set_ace_filename */
extern void T357f25(T0* C, T0* a1);
/* GEANT_SE_TASK.attribute_value_or_default */
extern T0* T281f13(T0* C, T0* a1, T0* a2);
/* GEANT_SE_TASK.has_attribute */
extern T1 T281f9(T0* C, T0* a1);
/* GEANT_SE_TASK.ace_attribute_name */
extern unsigned char ge120os8597;
extern T0* ge120ov8597;
extern T0* T281f12(T0* C);
/* GEANT_SE_TASK.task_make */
extern void T281f36(T0* C, T0* a1, T0* a2);
/* GEANT_SE_TASK.interpreting_element_make */
extern void T281f39(T0* C, T0* a1, T0* a2);
/* GEANT_SE_TASK.set_project */
extern void T281f41(T0* C, T0* a1);
/* GEANT_SE_TASK.element_make */
extern void T281f40(T0* C, T0* a1);
/* GEANT_SE_TASK.set_xml_element */
extern void T281f42(T0* C, T0* a1);
/* GEANT_SE_TASK.set_command */
extern void T281f38(T0* C, T0* a1);
/* GEANT_SE_COMMAND.make */
extern T0* T357c24(T0* a1);
/* GEANT_SE_COMMAND.set_project */
extern void T357f34(T0* C, T0* a1);
/* GEANT_TARGET.se_task_name */
extern unsigned char ge130os2401;
extern T0* ge130ov2401;
extern T0* T26f47(T0* C);
/* GEANT_GEC_TASK.make */
extern T0* T280c35(T0* a1, T0* a2);
/* GEANT_GEC_COMMAND.set_exit_code_variable_name */
extern void T356f32(T0* C, T0* a1);
/* GEANT_GEC_TASK.exit_code_variable_attribute_name */
extern unsigned char ge104os8556;
extern T0* ge104ov8556;
extern T0* T280f23(T0* C);
/* GEANT_GEC_COMMAND.set_garbage_collector */
extern void T356f31(T0* C, T0* a1);
/* GEANT_GEC_TASK.gc_attribute_name */
extern unsigned char ge104os8558;
extern T0* ge104ov8558;
extern T0* T280f22(T0* C);
/* GEANT_GEC_COMMAND.set_split_size */
extern void T356f30(T0* C, T6 a1);
/* GEANT_GEC_TASK.split_size_attribute_name */
extern unsigned char ge104os8560;
extern T0* ge104ov8560;
extern T0* T280f21(T0* C);
/* GEANT_GEC_COMMAND.set_split_mode */
extern void T356f29(T0* C, T1 a1);
/* GEANT_GEC_TASK.split_attribute_name */
extern unsigned char ge104os8559;
extern T0* ge104ov8559;
extern T0* T280f20(T0* C);
/* GEANT_GEC_COMMAND.set_catcall_mode */
extern void T356f28(T0* C, T0* a1);
/* GEANT_GEC_TASK.attribute_value */
extern T0* T280f19(T0* C, T0* a1);
/* GEANT_GEC_TASK.project_variables_resolver */
extern T0* T280f6(T0* C);
/* GEANT_GEC_TASK.target_arguments_stack */
extern T0* T280f31(T0* C);
/* GEANT_GEC_TASK.catcall_attribute_name */
extern unsigned char ge104os8554;
extern T0* ge104ov8554;
extern T0* T280f18(T0* C);
/* GEANT_GEC_COMMAND.set_finalize */
extern void T356f27(T0* C, T1 a1);
/* GEANT_GEC_TASK.finalize_attribute_name */
extern unsigned char ge104os8557;
extern T0* ge104ov8557;
extern T0* T280f17(T0* C);
/* GEANT_GEC_COMMAND.set_c_compile */
extern void T356f26(T0* C, T1 a1);
/* GEANT_GEC_TASK.boolean_value */
extern T1 T280f16(T0* C, T0* a1);
/* GEANT_GEC_TASK.std */
extern T0* T280f26(T0* C);
/* GEANT_GEC_TASK.false_attribute_value */
extern T0* T280f30(T0* C);
/* GEANT_GEC_TASK.true_attribute_value */
extern T0* T280f29(T0* C);
/* GEANT_GEC_TASK.string_ */
extern T0* T280f28(T0* C);
/* GEANT_GEC_TASK.c_compile_attribute_name */
extern unsigned char ge104os8553;
extern T0* ge104ov8553;
extern T0* T280f15(T0* C);
/* GEANT_GEC_COMMAND.set_clean */
extern void T356f25(T0* C, T0* a1);
/* GEANT_GEC_TASK.clean_attribute_name */
extern unsigned char ge104os8555;
extern T0* ge104ov8555;
extern T0* T280f14(T0* C);
/* GEANT_GEC_COMMAND.set_ace_filename */
extern void T356f24(T0* C, T0* a1);
/* GEANT_GEC_TASK.attribute_value_or_default */
extern T0* T280f13(T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.has_attribute */
extern T1 T280f9(T0* C, T0* a1);
/* GEANT_GEC_TASK.ace_attribute_name */
extern unsigned char ge104os8552;
extern T0* ge104ov8552;
extern T0* T280f12(T0* C);
/* GEANT_GEC_TASK.task_make */
extern void T280f37(T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.interpreting_element_make */
extern void T280f40(T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.set_project */
extern void T280f42(T0* C, T0* a1);
/* GEANT_GEC_TASK.element_make */
extern void T280f41(T0* C, T0* a1);
/* GEANT_GEC_TASK.set_xml_element */
extern void T280f43(T0* C, T0* a1);
/* GEANT_GEC_TASK.set_command */
extern void T280f39(T0* C, T0* a1);
/* GEANT_GEC_COMMAND.make */
extern T0* T356c23(T0* a1);
/* GEANT_GEC_COMMAND.make */
extern void T356f23p1(T0* C, T0* a1);
/* GEANT_GEC_COMMAND.set_project */
extern void T356f34(T0* C, T0* a1);
/* GEANT_TARGET.gec_task_name */
extern unsigned char ge130os2400;
extern T0* ge130ov2400;
extern T0* T26f46(T0* C);
/* GEANT_TARGET.obsolete_element_name */
extern unsigned char ge63os2369;
extern T0* ge63ov2369;
extern T0* T26f16(T0* C);
/* GEANT_TARGET.argument_element_name */
extern unsigned char ge63os2370;
extern T0* ge63ov2370;
extern T0* T26f14(T0* C);
/* KL_STRING_ROUTINES.same_string */
extern T1 T76f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.elks_same_string */
extern T1 T76f10(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.same_string */
extern T1 T195f13(T0* C, T0* a1);
/* UC_UTF8_STRING.substring_index */
extern T6 T195f29(T0* C, T0* a1, T6 a2);
/* STRING_8.same_string */
extern T1 T17f17(T0* C, T0* a1);
/* UC_UTF8_STRING.same_unicode_string */
extern T1 T195f12(T0* C, T0* a1);
/* UC_UTF8_STRING.unicode_substring_index */
extern T6 T195f28(T0* C, T0* a1, T6 a2);
/* GEANT_TARGET.description_element_name */
extern unsigned char ge129os2395;
extern T0* ge129ov2395;
extern T0* T26f19(T0* C);
/* GEANT_TARGET.string_ */
extern T0* T26f24(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].item */
extern T0* T191f8(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].start */
extern void T191f10(T0* C);
/* XM_DOCUMENT.cursor_start */
extern void T96f23(T0* C, T0* a1);
/* XM_ELEMENT.cursor_start */
extern void T97f37(T0* C, T0* a1);
/* XM_ELEMENT.new_cursor */
extern T0* T97f19(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].make */
extern T0* T191c9(T0* a1);
/* GEANT_TARGET.prepared_arguments_from_formal_arguments */
extern T0* T26f45(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.has_same_keys */
extern T1 T34f34(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].forth */
extern void T64f9(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].key */
extern T0* T64f4(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].after */
extern T1 T64f5(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].start */
extern void T64f8(T0* C);
/* GEANT_TARGET.named_from_numbered_arguments */
extern T0* T26f78(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].item */
extern T0* T64f6(T0* C);
/* GEANT_ARGUMENT_VARIABLES.has_numbered_keys */
extern T1 T34f39(T0* C);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].item */
extern T0* T101f5(T0* C);
/* GEANT_TARGET.target_arguments_stack */
extern T0* T26f27(T0* C);
/* KL_UNIX_FILE_SYSTEM.set_current_working_directory */
extern void T54f33(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.change_working_directory */
extern void T82f7(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.eif_chdir */
extern T6 T82f5(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.execution_environment */
extern unsigned char ge286os3935;
extern T0* ge286ov3935;
extern T0* T54f18(T0* C);
/* KL_UNIX_FILE_SYSTEM.string_ */
extern T0* T54f13(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.set_current_working_directory */
extern void T53f37(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.execution_environment */
extern T0* T53f20(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.string_ */
extern T0* T53f12(T0* C);
/* GEANT_TARGET.exit_application */
extern void T26f81(T0* C, T6 a1, T0* a2);
/* GEANT_TARGET.exceptions */
extern T0* T26f18(T0* C);
/* GEANT_TARGET.std */
extern T0* T26f17(T0* C);
/* KL_UNIX_FILE_SYSTEM.directory_exists */
extern T1 T54f24(T0* C, T0* a1);
/* KL_DIRECTORY.exists */
extern T1 T354f11(T0* C);
/* KL_DIRECTORY.old_exists */
extern T1 T354f15(T0* C);
/* KL_DIRECTORY.eif_dir_exists */
extern T1 T354f10(T0* C, T14 a1);
/* KL_DIRECTORY.reset */
extern void T354f36(T0* C, T0* a1);
/* KL_DIRECTORY.make */
extern void T354f35(T0* C, T0* a1);
/* KL_DIRECTORY.make */
extern T0* T354c35(T0* a1);
/* KL_DIRECTORY.old_make */
extern void T354f37(T0* C, T0* a1);
/* KL_DIRECTORY.string_ */
extern T0* T354f13(T0* C);
/* KL_UNIX_FILE_SYSTEM.tmp_directory */
extern unsigned char ge286os3933;
extern T0* ge286ov3933;
extern T0* T54f25(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.directory_exists */
extern T1 T53f27(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.tmp_directory */
extern T0* T53f28(T0* C);
/* KL_UNIX_FILE_SYSTEM.current_working_directory */
extern T0* T54f23(T0* C);
/* EXECUTION_ENVIRONMENT.current_working_directory */
extern T0* T82f2(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.current_working_directory */
extern T0* T53f26(T0* C);
/* GEANT_TARGET.file_system */
extern unsigned char ge203os1723;
extern T0* ge203ov1723;
extern T0* T26f44(T0* C);
/* GEANT_TARGET.unix_file_system */
extern unsigned char ge203os1726;
extern T0* ge203ov1726;
extern T0* T26f77(T0* C);
/* KL_UNIX_FILE_SYSTEM.make */
extern T0* T54c32(void);
/* KL_OPERATING_SYSTEM.is_unix */
extern unsigned char ge302os3151;
extern T1 ge302ov3151;
extern T1 T51f2(T0* C);
/* KL_OPERATING_SYSTEM.current_working_directory */
extern T0* T51f4(T0* C);
/* KL_OPERATING_SYSTEM.execution_environment */
extern unsigned char ge302os3155;
extern T0* ge302ov3155;
extern T0* T51f5(T0* C);
/* STRING_8.is_equal */
extern T1 T17f23(T0* C, T0* a1);
/* STRING_8.str_strict_cmp */
extern T6 T17f25(T0* C, T0* a1, T0* a2, T6 a3);
/* KL_OPERATING_SYSTEM.variable_value */
extern T0* T51f3(T0* C, T0* a1);
/* GEANT_TARGET.windows_file_system */
extern unsigned char ge203os1724;
extern T0* ge203ov1724;
extern T0* T26f76(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.make */
extern T0* T53c36(void);
/* KL_OPERATING_SYSTEM.is_windows */
extern unsigned char ge302os3150;
extern T1 ge302ov3150;
extern T1 T51f1(T0* C);
/* GEANT_TARGET.operating_system */
extern T0* T26f75(T0* C);
/* GEANT_STRING_INTERPRETER.interpreted_string */
extern T0* T244f5(T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.variable_value */
extern T0* T244f3(T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.expanded_variable_value */
extern T0* T244f6(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.value */
extern T0* T58f7(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.found_item */
extern T0* T25f51(T0* C);
/* GEANT_PROJECT_VARIABLES.item_storage_item */
extern T0* T25f53(T0* C, T6 a1);
/* GEANT_VARIABLES.found_item */
extern T0* T29f43(T0* C);
/* GEANT_VARIABLES.item_storage_item */
extern T0* T29f35(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.found_item */
extern T0* T34f44(T0* C);
/* GEANT_ARGUMENT_VARIABLES.item_storage_item */
extern T0* T34f41(T0* C, T6 a1);
/* KL_UNIX_FILE_SYSTEM.cwd */
extern T0* T54f10(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.cwd */
extern T0* T53f10(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.file_system */
extern T0* T58f9(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.unix_file_system */
extern T0* T58f13(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.windows_file_system */
extern T0* T58f12(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.operating_system */
extern T0* T58f11(T0* C);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.value */
extern T0* T245f2(T0* C, T0* a1);
/* GEANT_VARIABLES.item */
extern T0* T29f34(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.item */
extern T0* T34f38(T0* C, T0* a1);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.has */
extern T1 T245f3(T0* C, T0* a1);
/* GEANT_VARIABLES.has */
extern T1 T29f32(T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.default_variable_value */
extern T0* T244f4(T0* C, T0* a1);
/* KL_STRING_ROUTINES.append_substring_to_string */
extern void T76f20(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* KL_STRING_ROUTINES.new_empty_string */
extern T0* T76f3(T0* C, T0* a1, T6 a2);
/* UC_UTF8_STRING.old_wipe_out */
extern void T195f75(T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T195f78(T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T195f75p1(T0* C);
/* STRING_8.wipe_out */
extern void T17f38(T0* C);
/* GEANT_STRING_INTERPRETER.string_ */
extern T0* T244f2(T0* C);
/* UC_UTF8_STRING.out */
extern T0* T195f16(T0* C);
/* UC_UTF8_STRING.unicode */
extern unsigned char ge232os4951;
extern T0* ge232ov4951;
extern T0* T195f31(T0* C);
/* UC_UNICODE_ROUTINES.default_create */
extern T0* T253c29(void);
/* STRING_8.out */
extern T0* T17f4(T0* C);
/* XM_ELEMENT.attribute_by_name */
extern T0* T97f21(T0* C, T0* a1);
/* XM_ELEMENT.attribute_same_name */
extern T1 T97f9(T0* C, T0* a1, T0* a2);
/* XM_NODE_TYPER.is_attribute */
extern T1 T320f9(T0* C);
/* GEANT_STRING_INTERPRETER.set_variable_resolver */
extern void T244f8(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.set_variables */
extern void T58f17(T0* C, T0* a1);
/* GEANT_TARGET.project_variables_resolver */
extern T0* T26f28(T0* C);
/* GEANT_STRING_INTERPRETER.make */
extern T0* T244c7(void);
/* XM_ELEMENT.has_attribute_by_name */
extern T1 T97f20(T0* C, T0* a1);
/* GEANT_TARGET.dir_attribute_name */
extern T0* T26f43(T0* C);
/* GEANT_PROJECT.log */
extern void T22f41(T0* C, T0* a1);
/* KL_STDOUT_FILE.flush */
extern void T68f18(T0* C);
/* KL_STDOUT_FILE.old_flush */
extern void T68f19(T0* C);
/* KL_STDOUT_FILE.file_flush */
extern void T68f20(T0* C, T14 a1);
/* KL_STDOUT_FILE.put_new_line */
extern void T68f13(T0* C);
/* KL_STDOUT_FILE.put_string */
extern void T68f12(T0* C, T0* a1);
/* KL_STDOUT_FILE.old_put_string */
extern void T68f16(T0* C, T0* a1);
/* KL_STDOUT_FILE.console_ps */
extern void T68f17(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STDOUT_FILE.string_ */
extern T0* T68f6(T0* C);
/* GEANT_PROJECT.target_name */
extern T0* T22f20(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].forth */
extern void T124f10(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_forth */
extern void T31f66(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].add_traversing_cursor */
extern void T31f71(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].set_next_cursor */
extern void T124f15(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].remove_traversing_cursor */
extern void T31f70(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].set_position */
extern void T124f14(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].clashes_item */
extern T6 T31f32(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].go_after */
extern void T124f13(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_go_after */
extern void T31f76(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_off */
extern T1 T31f41(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].key */
extern T0* T124f7(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_key */
extern T0* T31f36(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].key_storage_item */
extern T0* T31f31(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].item */
extern T0* T124f6(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_item */
extern T0* T31f35(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item_storage_item */
extern T0* T31f27(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].after */
extern T1 T124f5(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_after */
extern T1 T31f34(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].start */
extern void T124f9(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_start */
extern void T31f65(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].is_empty */
extern T1 T31f40(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].new_cursor */
extern T0* T31f29(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].make */
extern T0* T124c8(T0* a1);
/* GEANT_TARGET.is_enabled */
extern T1 T26f42(T0* C);
/* GEANT_TARGET.unless_attribute_name */
extern T0* T26f74(T0* C);
/* GEANT_TARGET.if_attribute_name */
extern T0* T26f73(T0* C);
/* GEANT_TARGET.final_target */
extern T0* T26f32(T0* C);
/* GEANT_PROJECT.trace_debug */
extern void T22f31(T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].item */
extern T0* T187f5(T0* C);
/* GEANT_ARGUMENT_VARIABLES.make */
extern T0* T34c46(void);
/* GEANT_ARGUMENT_VARIABLES.set_key_equality_tester */
extern void T34f49(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.make_map */
extern void T34f48(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_with_equality_testers */
extern void T34f57(T0* C, T6 a1, T0* a2, T0* a3);
/* GEANT_ARGUMENT_VARIABLES.make_sparse_container */
extern void T34f62(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_slots */
extern void T34f66(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_clashes */
extern void T34f65(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_key_storage */
extern void T34f64(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_item_storage */
extern void T34f63(T0* C, T6 a1);
/* GEANT_PROJECT.calculate_depend_order */
extern void T22f39(T0* C, T0* a1);
/* GEANT_TARGET.dependent_targets */
extern T0* T26f36(T0* C);
/* GEANT_TARGET.show_dependent_targets */
extern void T26f93(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_line */
extern void T68f10(T0* C, T0* a1);
/* KL_STANDARD_FILES.output */
extern unsigned char ge206os3125;
extern T0* ge206ov3125;
extern T0* T46f2(T0* C);
/* KL_STDOUT_FILE.make */
extern T0* T68c9(void);
/* KL_STDOUT_FILE.make_open_stdout */
extern void T68f11(T0* C, T0* a1);
/* KL_STDOUT_FILE.set_write_mode */
extern void T68f15(T0* C);
/* KL_STDOUT_FILE.console_def */
extern T14 T68f5(T0* C, T6 a1);
/* KL_STDOUT_FILE.old_make */
extern void T68f14(T0* C, T0* a1);
/* GEANT_TARGET.string_tokens */
extern T0* T26f21(T0* C, T0* a1, T2 a2);
/* GEANT_TARGET.dependencies */
extern T0* T26f40(T0* C);
/* GEANT_TARGET.depend_attribute_name */
extern unsigned char ge63os2372;
extern T0* ge63ov2372;
extern T0* T26f41(T0* C);
/* GEANT_TARGET.has_dependencies */
extern T1 T26f39(T0* C);
/* DS_ARRAYED_STACK [GEANT_TARGET].force */
extern void T187f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].resize */
extern void T187f11(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].resize */
extern T0* T125f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_TARGET].resized_area */
extern T0* T120f3(T0* C, T6 a1);
/* SPECIAL [GEANT_TARGET].copy_data */
extern void T120f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [GEANT_TARGET].move_data */
extern void T120f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_TARGET].overlapping_move */
extern void T120f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_TARGET].non_overlapping_move */
extern void T120f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_TARGET].make */
extern T0* T120c4(T6 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].new_capacity */
extern T6 T187f7(T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].extendible */
extern T1 T187f6(T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].make */
extern T0* T187c8(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].make */
extern T0* T125f2(T0* C, T6 a1);
/* TO_SPECIAL [GEANT_TARGET].make_area */
extern T0* T204c2(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].default_create */
extern T0* T125c3(void);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].force */
extern void T101f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].resize */
extern void T101f11(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].resize */
extern T0* T178f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].resized_area */
extern T0* T177f3(T0* C, T6 a1);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].copy_data */
extern void T177f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].move_data */
extern void T177f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].overlapping_move */
extern void T177f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].non_overlapping_move */
extern void T177f8(T0* C, T6 a1, T6 a2, T6 a3);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].new_capacity */
extern T6 T101f7(T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].extendible */
extern T1 T101f6(T0* C, T6 a1);
/* GEANT_PROJECT.target_arguments_stack */
extern T0* T22f18(T0* C);
/* GEANT_PROJECT.trace */
extern void T22f24(T0* C, T0* a1);
/* GEANT.commandline_arguments */
extern unsigned char ge61os1706;
extern T0* ge61ov1706;
extern T0* T21f11(T0* C);
/* GEANT_PROJECT.start_target */
extern T0* T22f19(T0* C);
/* GEANT_PROJECT.exit_application */
extern void T22f35(T0* C, T6 a1, T0* a2);
/* GEANT_PROJECT.exceptions */
extern T0* T22f17(T0* C);
/* GEANT_PROJECT.std */
extern T0* T22f14(T0* C);
/* GEANT_PROJECT.preferred_start_target */
extern T0* T22f15(T0* C);
/* GEANT_PROJECT.default_target */
extern T0* T22f16(T0* C);
/* GEANT_PROJECT.show_target_info */
extern void T22f27(T0* C);
/* GEANT_PROJECT.set_start_target_name */
extern void T22f26(T0* C, T0* a1);
/* GEANT_TARGET.full_name */
extern T0* T26f30(T0* C);
/* GEANT_TARGET.is_exported_to_any */
extern T1 T26f29(T0* C);
/* DS_ARRAYED_LIST [STRING_8].has */
extern T1 T71f22(T0* C, T0* a1);
/* GEANT_TARGET.project_name_any */
extern unsigned char ge63os2375;
extern T0* ge63ov2375;
extern T0* T26f22(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item */
extern T0* T31f28(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].search_position */
extern void T31f47(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].hash_position */
extern T6 T31f21(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].slots_item */
extern T6 T31f25(T0* C, T6 a1);
/* GEANT.exit_application */
extern void T21f22(T0* C, T6 a1, T0* a2);
/* GEANT.exceptions */
extern T0* T21f14(T0* C);
/* GEANT.std */
extern T0* T21f13(T0* C);
/* UC_UTF8_STRING.infix "+" */
extern T0* T195f7(T0* C, T0* a1);
/* STRING_8.infix "+" */
extern T0* T17f8(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].has */
extern T1 T31f24(T0* C, T0* a1);
/* INTEGER_32.infix ">" */
extern T1 T6f1(T6* C, T6 a1);
/* GEANT_PROJECT.merge_in_parent_projects */
extern void T22f25(T0* C);
/* GEANT_TARGET.show_precursors */
extern void T26f92(T0* C);
/* ARRAY [STRING_8].force */
extern void T33f14(T0* C, T0* a1, T6 a2);
/* ARRAY [STRING_8].auto_resize */
extern void T33f15(T0* C, T6 a1, T6 a2);
/* SPECIAL [STRING_8].fill_with */
extern void T32f12(T0* C, T0* a1, T6 a2, T6 a3);
/* ARRAY [STRING_8].capacity */
extern T6 T33f8(T0* C);
/* SPECIAL [STRING_8].aliased_resized_area */
extern T0* T32f4(T0* C, T6 a1);
/* ARRAY [STRING_8].additional_space */
extern T6 T33f7(T0* C);
/* ARRAY [STRING_8].empty_area */
extern T1 T33f6(T0* C);
/* GEANT_INHERIT.apply_selects */
extern void T119f8(T0* C);
/* GEANT_INHERIT.check_targets_for_conflicts */
extern void T119f14(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].back */
extern void T124f12(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_back */
extern void T31f68(T0* C, T0* a1);
/* GEANT_INHERIT.exit_application */
extern void T119f15(T0* C, T6 a1, T0* a2);
/* GEANT_INHERIT.exceptions */
extern T0* T119f5(T0* C);
/* GEANT_INHERIT.std */
extern T0* T119f4(T0* C);
/* GEANT_TARGET.conflicts_with */
extern T1 T26f34(T0* C, T0* a1);
/* GEANT_TARGET.seed */
extern T0* T26f38(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].before */
extern T1 T124f4(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_before */
extern T1 T31f37(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].finish */
extern void T124f11(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_finish */
extern void T31f67(T0* C, T0* a1);
/* GEANT_INHERIT.sort_out_selected_targets */
extern void T119f13(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].remove */
extern void T31f64(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].remove_position */
extern void T31f69(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].key_storage_put */
extern void T31f54(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item_storage_put */
extern void T31f50(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].clashes_put */
extern void T31f52(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].slots_put */
extern void T31f53(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].move_cursors_forth */
extern void T31f73(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].move_all_cursors */
extern void T31f75(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].move_cursors_after */
extern void T31f74(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].internal_set_key_equality_tester */
extern void T31f72(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_TARGET, STRING_8].internal_set_equality_tester */
extern void T122f6(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].unset_found_item */
extern void T31f49(T0* C);
/* GEANT_TARGET.set_redefining_target */
extern void T26f96(T0* C, T0* a1);
/* GEANT_INHERIT.validate_parent_selects */
extern void T119f12(T0* C);
/* GEANT_INHERIT.merge_in_parent_project */
extern void T119f7(T0* C, T0* a1);
/* GEANT_INHERIT.merge_in_unchanged_targets */
extern void T119f11(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].force_last */
extern void T31f46(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].resize */
extern void T31f51(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].clashes_resize */
extern void T31f59(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].special_integer_ */
extern T0* T31f30(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].key_storage_resize */
extern void T31f58(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item_storage_resize */
extern void T31f57(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].slots_resize */
extern void T31f56(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].new_modulus */
extern T6 T31f22(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].new_capacity */
extern T6 T31f33(T0* C, T6 a1);
/* GEANT_INHERIT.string_ */
extern T0* T119f3(T0* C);
/* GEANT_INHERIT.merge_in_renamed_targets */
extern void T119f10(T0* C, T0* a1);
/* GEANT_INHERIT.merge_in_redefined_targets */
extern void T119f9(T0* C, T0* a1);
/* GEANT_TARGET.set_precursor_target */
extern void T26f91(T0* C, T0* a1);
/* GEANT_TARGET.formal_arguments_match */
extern T1 T26f33(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].forth */
extern void T186f9(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_forth */
extern void T185f20(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].set_position */
extern void T186f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].add_traversing_cursor */
extern void T185f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].set_next_cursor */
extern void T186f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].remove_traversing_cursor */
extern void T185f22(T0* C, T0* a1);
/* GEANT_PARENT.prepare_project */
extern void T183f14(T0* C);
/* GEANT_PARENT.apply_selects */
extern void T183f19(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].forth */
extern void T350f8(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_forth */
extern void T266f59(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].add_traversing_cursor */
extern void T266f61(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].set_next_cursor */
extern void T350f10(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].remove_traversing_cursor */
extern void T266f60(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].set_position */
extern void T350f9(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].clashes_item */
extern T6 T266f25(T0* C, T6 a1);
/* GEANT_PARENT.exit_application */
extern void T183f20(T0* C, T6 a1, T0* a2);
/* GEANT_PARENT.exceptions */
extern T0* T183f11(T0* C);
/* GEANT_PARENT.std */
extern T0* T183f10(T0* C);
/* GEANT_SELECT.is_executable */
extern T1 T265f2(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].item */
extern T0* T350f4(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_item */
extern T0* T266f33(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].item_storage_item */
extern T0* T266f35(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].after */
extern T1 T350f5(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_after */
extern T1 T266f32(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].start */
extern void T350f7(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_start */
extern void T266f58(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_off */
extern T1 T266f37(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].is_empty */
extern T1 T266f36(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].new_cursor */
extern T0* T266f26(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].make */
extern T0* T350c6(T0* a1);
/* GEANT_PARENT.apply_undeclared_redefines */
extern void T183f18(T0* C);
/* GEANT_PARENT.apply_unchangeds */
extern void T183f17(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].has_item */
extern T1 T31f43(T0* C, T0* a1);
/* GEANT_PARENT.apply_redefines */
extern void T183f16(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].forth */
extern void T344f8(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_forth */
extern void T264f59(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].add_traversing_cursor */
extern void T264f61(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].set_next_cursor */
extern void T344f10(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].remove_traversing_cursor */
extern void T264f60(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].set_position */
extern void T344f9(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].clashes_item */
extern T6 T264f25(T0* C, T6 a1);
/* GEANT_REDEFINE.is_executable */
extern T1 T263f2(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].item */
extern T0* T344f4(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_item */
extern T0* T264f33(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].item_storage_item */
extern T0* T264f35(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].after */
extern T1 T344f5(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_after */
extern T1 T264f32(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].start */
extern void T344f7(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_start */
extern void T264f58(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_off */
extern T1 T264f37(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].is_empty */
extern T1 T264f36(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].new_cursor */
extern T0* T264f26(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].make */
extern T0* T344c6(T0* a1);
/* GEANT_PARENT.apply_renames */
extern void T183f15(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].back */
extern void T338f8(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_back */
extern void T262f60(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].add_traversing_cursor */
extern void T262f62(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].set_next_cursor */
extern void T338f10(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].remove_traversing_cursor */
extern void T262f61(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].set_position */
extern void T338f9(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].clashes_item */
extern T6 T262f26(T0* C, T6 a1);
/* GEANT_RENAME.is_executable */
extern T1 T261f3(T0* C);
/* GEANT_RENAME.string_ */
extern T0* T261f4(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].item */
extern T0* T338f4(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_item */
extern T0* T262f34(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].item_storage_item */
extern T0* T262f35(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].before */
extern T1 T338f5(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_before */
extern T1 T262f33(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].finish */
extern void T338f7(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_finish */
extern void T262f59(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_off */
extern T1 T262f37(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].is_empty */
extern T1 T262f36(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].new_cursor */
extern T0* T262f27(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].make */
extern T0* T338c6(T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].item */
extern T0* T186f4(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_item */
extern T0* T185f10(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].item */
extern T0* T185f12(T0* C, T6 a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].after */
extern T1 T186f6(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_after */
extern T1 T185f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].start */
extern void T186f8(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_start */
extern void T185f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].is_empty */
extern T1 T185f13(T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].off */
extern T1 T186f5(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_off */
extern T1 T185f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_before */
extern T1 T185f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].new_cursor */
extern T0* T185f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].make */
extern T0* T186c7(T0* a1);
/* GEANT_PROJECT_LOADER.load */
extern void T23f10(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_LOADER.exit_application */
extern void T23f11(T0* C, T6 a1, T0* a2);
/* GEANT_PROJECT_LOADER.exceptions */
extern T0* T23f6(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.absolute_pathname */
extern T0* T53f4(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.current_drive */
extern T0* T53f13(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_separator */
extern T1 T53f19(T0* C, T2 a1);
/* KL_WINDOWS_FILE_SYSTEM.pathname */
extern T0* T53f11(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.is_relative_pathname */
extern T1 T53f9(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_absolute_pathname */
extern T1 T53f8(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.absolute_pathname */
extern T0* T54f4(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.pathname */
extern T0* T54f11(T0* C, T0* a1, T0* a2);
/* KL_UNIX_FILE_SYSTEM.is_absolute_pathname */
extern T1 T54f9(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.pathname_from_file_system */
extern T0* T53f3(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.pathname_to_string */
extern T0* T53f7(T0* C, T0* a1);
/* KL_PATHNAME.item */
extern T0* T85f8(T0* C, T6 a1);
/* KL_PATHNAME.is_parent */
extern T1 T85f7(T0* C, T6 a1);
/* KL_PATHNAME.is_current */
extern T1 T85f11(T0* C, T6 a1);
/* KL_WINDOWS_FILE_SYSTEM.root_directory */
extern unsigned char ge211os3974;
extern T0* ge211ov3974;
extern T0* T53f16(T0* C);
/* KL_UNIX_FILE_SYSTEM.string_to_pathname */
extern T0* T54f5(T0* C, T0* a1);
/* KL_PATHNAME.append_name */
extern void T85f17(T0* C, T0* a1);
/* KL_PATHNAME.append_parent */
extern void T85f16(T0* C);
/* KL_PATHNAME.append_current */
extern void T85f15(T0* C);
/* KL_PATHNAME.set_relative */
extern void T85f14(T0* C, T1 a1);
/* KL_PATHNAME.make */
extern T0* T85c13(void);
/* KL_WINDOWS_FILE_SYSTEM.any_ */
extern T0* T53f6(T0* C);
/* KL_UNIX_FILE_SYSTEM.pathname_from_file_system */
extern T0* T54f3(T0* C, T0* a1, T0* a2);
/* KL_UNIX_FILE_SYSTEM.pathname_to_string */
extern T0* T54f8(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.root_directory */
extern unsigned char ge209os3974;
extern T0* ge209ov3974;
extern T0* T54f17(T0* C);
/* KL_UNIX_FILE_SYSTEM.any_ */
extern T0* T54f7(T0* C);
/* GEANT_PROJECT_LOADER.unix_file_system */
extern T0* T23f4(T0* C);
/* GEANT_PROJECT_LOADER.file_system */
extern T0* T23f3(T0* C);
/* GEANT_PROJECT_LOADER.windows_file_system */
extern T0* T23f8(T0* C);
/* GEANT_PROJECT_LOADER.operating_system */
extern T0* T23f7(T0* C);
/* GEANT_PROJECT_LOADER.std */
extern T0* T23f5(T0* C);
/* KL_TEXT_INPUT_FILE.close */
extern void T55f58(T0* C);
/* KL_TEXT_INPUT_FILE.old_close */
extern void T55f63(T0* C);
/* KL_TEXT_INPUT_FILE.file_close */
extern void T55f64(T0* C, T14 a1);
/* GEANT_PROJECT_PARSER.parse_file */
extern void T56f9(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.last_error_extended_description */
extern T0* T91f89(T0* C);
/* XM_EIFFEL_PARSER.string_ */
extern T0* T91f85(T0* C);
/* XM_EIFFEL_PARSER.last_error_description */
extern T0* T91f177(T0* C);
/* XM_EIFFEL_PARSER.safe_error_component */
extern T0* T91f170(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_safe_error_character */
extern T1 T91f109(T0* C, T2 a1);
/* CHARACTER_8.infix ">=" */
extern T1 T2f4(T2* C, T2 a1);
/* STRING_8.make_empty */
extern T0* T17c44(void);
/* XM_EIFFEL_PARSER.position */
extern T0* T91f128(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].first */
extern T0* T131f6(T0* C);
/* XM_EIFFEL_PARSER.positions */
extern T0* T91f91(T0* C);
/* XM_EIFFEL_PARSER.new_positions */
extern T0* T91f125(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].remove */
extern void T132f7(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].item */
extern T0* T132f4(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].is_empty */
extern T1 T132f3(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].force_last */
extern void T131f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].put_right */
extern void T211f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].attach_left */
extern void T211f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].make */
extern T0* T211c4(T0* a1);
/* DS_BILINKED_LIST [XM_POSITION].is_empty */
extern T1 T131f5(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].make */
extern T0* T131c8(void);
/* DS_BILINKED_LIST [XM_POSITION].new_cursor */
extern T0* T131f7(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_POSITION].make */
extern T0* T212c3(T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].copy */
extern void T132f6(T0* C, T0* a1);
/* DS_LINKABLE [XM_EIFFEL_SCANNER].put_right */
extern void T213f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_EIFFEL_SCANNER].make */
extern T0* T213c3(T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].make */
extern T0* T132c5(void);
/* KL_STDERR_FILE.flush */
extern void T47f21(T0* C);
/* KL_STDERR_FILE.old_flush */
extern void T47f22(T0* C);
/* KL_STDERR_FILE.file_flush */
extern void T47f23(T0* C, T14 a1);
/* XM_TREE_CALLBACKS_PIPE.last_error */
extern T0* T92f5(T0* C);
/* GEANT_PROJECT_PARSER.std */
extern T0* T56f7(T0* C);
/* GEANT_PROJECT_ELEMENT.make */
extern T0* T30c20(T0* a1, T0* a2, T0* a3, T0* a4);
/* GEANT_PROJECT_ELEMENT.load_parent_projects */
extern void T30f23(T0* C);
/* GEANT_INHERIT_ELEMENT.make */
extern T0* T118c10(T0* a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.exit_application */
extern void T118f12(T0* C, T6 a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.exceptions */
extern T0* T118f6(T0* C);
/* GEANT_INHERIT_ELEMENT.std */
extern T0* T118f5(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].force_last */
extern void T185f17(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].resize */
extern void T185f18(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].resize */
extern T0* T251f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_PARENT].resized_area */
extern T0* T252f2(T0* C, T6 a1);
/* SPECIAL [GEANT_PARENT].copy_data */
extern void T252f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [GEANT_PARENT].move_data */
extern void T252f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_PARENT].overlapping_move */
extern void T252f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_PARENT].non_overlapping_move */
extern void T252f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_PARENT].make */
extern T0* T252c4(T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].new_capacity */
extern T6 T185f8(T0* C, T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].extendible */
extern T1 T185f6(T0* C, T6 a1);
/* GEANT_PARENT.is_executable */
extern T1 T183f9(T0* C);
/* GEANT_PARENT_ELEMENT.make */
extern T0* T201c18(T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].force_last */
extern void T266f39(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].key_storage_put */
extern void T266f48(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].slots_put */
extern void T266f47(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].clashes_put */
extern void T266f46(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].slots_item */
extern T6 T266f21(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].hash_position */
extern T6 T266f23(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].resize */
extern void T266f45(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].clashes_resize */
extern void T266f53(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].special_integer_ */
extern T0* T266f27(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].key_storage_resize */
extern void T266f52(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].item_storage_resize */
extern void T266f51(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].resize */
extern T0* T351f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_SELECT].resized_area */
extern T0* T349f2(T0* C, T6 a1);
/* SPECIAL [GEANT_SELECT].copy_data */
extern void T349f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [GEANT_SELECT].move_data */
extern void T349f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_SELECT].overlapping_move */
extern void T349f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_SELECT].non_overlapping_move */
extern void T349f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_SELECT].make */
extern T0* T349c4(T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].key_storage_item */
extern T0* T266f24(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].slots_resize */
extern void T266f50(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].new_modulus */
extern T6 T266f29(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].new_capacity */
extern T6 T266f22(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].item_storage_put */
extern void T266f44(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].search_position */
extern void T266f43(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].unset_found_item */
extern void T266f42(T0* C);
/* GEANT_SELECT_ELEMENT.make */
extern T0* T260c9(T0* a1, T0* a2);
/* GEANT_SELECT.set_name */
extern void T265f4(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.attribute_value */
extern T0* T260f4(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.project_variables_resolver */
extern T0* T260f8(T0* C);
/* GEANT_SELECT_ELEMENT.target_arguments_stack */
extern T0* T260f7(T0* C);
/* GEANT_SELECT_ELEMENT.has_attribute */
extern T1 T260f6(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.target_attribute_name */
extern unsigned char ge149os8526;
extern T0* ge149ov8526;
extern T0* T260f5(T0* C);
/* GEANT_SELECT.make */
extern T0* T265c3(void);
/* GEANT_SELECT_ELEMENT.interpreting_element_make */
extern void T260f10(T0* C, T0* a1, T0* a2);
/* GEANT_SELECT_ELEMENT.set_project */
extern void T260f12(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.element_make */
extern void T260f11(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.set_xml_element */
extern void T260f13(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.select_element_name */
extern unsigned char ge141os8086;
extern T0* ge141ov8086;
extern T0* T201f10(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].force_last */
extern void T264f39(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].key_storage_put */
extern void T264f48(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].slots_put */
extern void T264f47(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].clashes_put */
extern void T264f46(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].slots_item */
extern T6 T264f21(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].hash_position */
extern T6 T264f23(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].resize */
extern void T264f45(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].clashes_resize */
extern void T264f53(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].special_integer_ */
extern T0* T264f27(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].key_storage_resize */
extern void T264f52(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].item_storage_resize */
extern void T264f51(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].resize */
extern T0* T345f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_REDEFINE].resized_area */
extern T0* T343f2(T0* C, T6 a1);
/* SPECIAL [GEANT_REDEFINE].copy_data */
extern void T343f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [GEANT_REDEFINE].move_data */
extern void T343f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_REDEFINE].overlapping_move */
extern void T343f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_REDEFINE].non_overlapping_move */
extern void T343f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_REDEFINE].make */
extern T0* T343c4(T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].key_storage_item */
extern T0* T264f24(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].slots_resize */
extern void T264f50(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].new_modulus */
extern T6 T264f29(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].new_capacity */
extern T6 T264f22(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].item_storage_put */
extern void T264f44(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].search_position */
extern void T264f43(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].unset_found_item */
extern void T264f42(T0* C);
/* GEANT_REDEFINE_ELEMENT.make */
extern T0* T259c9(T0* a1, T0* a2);
/* GEANT_REDEFINE.set_name */
extern void T263f4(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.attribute_value */
extern T0* T259f4(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.project_variables_resolver */
extern T0* T259f8(T0* C);
/* GEANT_REDEFINE_ELEMENT.target_arguments_stack */
extern T0* T259f7(T0* C);
/* GEANT_REDEFINE_ELEMENT.has_attribute */
extern T1 T259f6(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.target_attribute_name */
extern unsigned char ge145os8522;
extern T0* ge145ov8522;
extern T0* T259f5(T0* C);
/* GEANT_REDEFINE.make */
extern T0* T263c3(void);
/* GEANT_REDEFINE_ELEMENT.interpreting_element_make */
extern void T259f10(T0* C, T0* a1, T0* a2);
/* GEANT_REDEFINE_ELEMENT.set_project */
extern void T259f12(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.element_make */
extern void T259f11(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.set_xml_element */
extern void T259f13(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.redefine_element_name */
extern unsigned char ge141os8085;
extern T0* ge141ov8085;
extern T0* T201f9(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].force_last */
extern void T262f40(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].key_storage_put */
extern void T262f49(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].slots_put */
extern void T262f48(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].clashes_put */
extern void T262f47(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].slots_item */
extern T6 T262f24(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].hash_position */
extern T6 T262f22(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].resize */
extern void T262f46(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].clashes_resize */
extern void T262f54(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].special_integer_ */
extern T0* T262f28(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].key_storage_resize */
extern void T262f53(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].item_storage_resize */
extern void T262f52(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].resize */
extern T0* T339f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_RENAME].resized_area */
extern T0* T337f2(T0* C, T6 a1);
/* SPECIAL [GEANT_RENAME].copy_data */
extern void T337f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [GEANT_RENAME].move_data */
extern void T337f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_RENAME].overlapping_move */
extern void T337f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_RENAME].non_overlapping_move */
extern void T337f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_RENAME].make */
extern T0* T337c4(T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].key_storage_item */
extern T0* T262f25(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].slots_resize */
extern void T262f51(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].new_modulus */
extern T6 T262f31(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].new_capacity */
extern T6 T262f30(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].item_storage_put */
extern void T262f45(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].search_position */
extern void T262f42(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].unset_found_item */
extern void T262f44(T0* C);
/* GEANT_PARENT_ELEMENT.exit_application */
extern void T201f20(T0* C, T6 a1, T0* a2);
/* GEANT_PARENT_ELEMENT.exceptions */
extern T0* T201f12(T0* C);
/* GEANT_PARENT_ELEMENT.std */
extern T0* T201f11(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].has */
extern T1 T262f29(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.make */
extern T0* T258c10(T0* a1, T0* a2);
/* GEANT_RENAME.set_new_name */
extern void T261f7(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.as_attribute_name */
extern unsigned char ge147os8518;
extern T0* ge147ov8518;
extern T0* T258f5(T0* C);
/* GEANT_RENAME.set_original_name */
extern void T261f6(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.attribute_value */
extern T0* T258f4(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.project_variables_resolver */
extern T0* T258f9(T0* C);
/* GEANT_RENAME_ELEMENT.target_arguments_stack */
extern T0* T258f8(T0* C);
/* GEANT_RENAME_ELEMENT.has_attribute */
extern T1 T258f7(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.target_attribute_name */
extern unsigned char ge147os8517;
extern T0* ge147ov8517;
extern T0* T258f6(T0* C);
/* GEANT_RENAME.make */
extern T0* T261c5(void);
/* GEANT_RENAME_ELEMENT.interpreting_element_make */
extern void T258f11(T0* C, T0* a1, T0* a2);
/* GEANT_RENAME_ELEMENT.set_project */
extern void T258f13(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.element_make */
extern void T258f12(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.set_xml_element */
extern void T258f14(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.elements_by_name */
extern T0* T201f8(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.string_ */
extern T0* T201f14(T0* C);
/* GEANT_PARENT_ELEMENT.rename_element_name */
extern unsigned char ge141os8084;
extern T0* ge141ov8084;
extern T0* T201f7(T0* C);
/* GEANT_PARENT.set_parent_project */
extern void T183f13(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.attribute_value */
extern T0* T201f13(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.project_variables_resolver */
extern T0* T201f16(T0* C);
/* GEANT_PARENT_ELEMENT.target_arguments_stack */
extern T0* T201f15(T0* C);
/* GEANT_PARENT_ELEMENT.has_attribute */
extern T1 T201f6(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.location_attribute_name */
extern unsigned char ge141os8082;
extern T0* ge141ov8082;
extern T0* T201f5(T0* C);
/* GEANT_PARENT.make */
extern T0* T183c12(T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].set_key_equality_tester */
extern void T266f40(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_SELECT, STRING_8].internal_set_equality_tester */
extern void T347f6(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_map_equal */
extern T0* T266c38(T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_with_equality_testers */
extern void T266f41(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [GEANT_SELECT, STRING_8].make */
extern T0* T347c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_SELECT, STRING_8].new_cursor */
extern T0* T347f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_SELECT, STRING_8].make */
extern T0* T399c3(T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_sparse_container */
extern void T266f49(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_slots */
extern void T266f57(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_clashes */
extern void T266f56(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_key_storage */
extern void T266f55(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_item_storage */
extern void T266f54(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].make */
extern T0* T351f2(T0* C, T6 a1);
/* TO_SPECIAL [GEANT_SELECT].make_area */
extern T0* T400c2(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].default_create */
extern T0* T351c3(void);
/* KL_EQUALITY_TESTER [GEANT_SELECT].default_create */
extern T0* T346c1(void);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].set_key_equality_tester */
extern void T264f40(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_REDEFINE, STRING_8].internal_set_equality_tester */
extern void T341f6(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_map_equal */
extern T0* T264c38(T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_with_equality_testers */
extern void T264f41(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [GEANT_REDEFINE, STRING_8].make */
extern T0* T341c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_REDEFINE, STRING_8].new_cursor */
extern T0* T341f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_REDEFINE, STRING_8].make */
extern T0* T397c3(T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_sparse_container */
extern void T264f49(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_slots */
extern void T264f57(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_clashes */
extern void T264f56(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_key_storage */
extern void T264f55(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_item_storage */
extern void T264f54(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].make */
extern T0* T345f2(T0* C, T6 a1);
/* TO_SPECIAL [GEANT_REDEFINE].make_area */
extern T0* T398c2(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].default_create */
extern T0* T345c3(void);
/* KL_EQUALITY_TESTER [GEANT_REDEFINE].default_create */
extern T0* T340c1(void);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].set_key_equality_tester */
extern void T262f41(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_RENAME, STRING_8].internal_set_equality_tester */
extern void T335f6(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_map_equal */
extern T0* T262c39(T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_with_equality_testers */
extern void T262f43(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [GEANT_RENAME, STRING_8].make */
extern T0* T335c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_RENAME, STRING_8].new_cursor */
extern T0* T335f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_RENAME, STRING_8].make */
extern T0* T395c3(T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_sparse_container */
extern void T262f50(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_slots */
extern void T262f58(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_clashes */
extern void T262f57(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_key_storage */
extern void T262f56(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_item_storage */
extern void T262f55(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].make */
extern T0* T339f2(T0* C, T6 a1);
/* TO_SPECIAL [GEANT_RENAME].make_area */
extern T0* T396c2(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].default_create */
extern T0* T339c3(void);
/* KL_EQUALITY_TESTER [GEANT_RENAME].default_create */
extern T0* T334c1(void);
/* GEANT_PARENT_ELEMENT.interpreting_element_make */
extern void T201f19(T0* C, T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.set_project */
extern void T201f22(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.element_make */
extern void T201f21(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.set_xml_element */
extern void T201f23(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.elements_by_name */
extern T0* T118f4(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.string_ */
extern T0* T118f8(T0* C);
/* GEANT_INHERIT_ELEMENT.parent_element_name */
extern unsigned char ge135os6680;
extern T0* ge135ov6680;
extern T0* T118f7(T0* C);
/* GEANT_INHERIT.make */
extern T0* T119c6(T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].make */
extern T0* T185c16(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].make */
extern T0* T251f1(T0* C, T6 a1);
/* TO_SPECIAL [GEANT_PARENT].make_area */
extern T0* T330c2(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].default_create */
extern T0* T251c3(void);
/* GEANT_INHERIT_ELEMENT.interpreting_element_make */
extern void T118f11(T0* C, T0* a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.set_project */
extern void T118f14(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.element_make */
extern void T118f13(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.set_xml_element */
extern void T118f15(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.inherit_element_name */
extern unsigned char ge142os2531;
extern T0* ge142ov2531;
extern T0* T30f16(T0* C);
/* GEANT_PROJECT.set_inherit_clause */
extern void T22f34(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.make_old */
extern T0* T118c9(T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.make_old */
extern T0* T201c17(T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.inherit_attribute_name */
extern unsigned char ge141os8083;
extern T0* ge141ov8083;
extern T0* T201f4(T0* C);
/* GEANT_PROJECT.set_old_inherit */
extern void T22f33(T0* C, T1 a1);
/* GEANT_PROJECT_ELEMENT.has_inherit_element */
extern T1 T30f15(T0* C);
/* GEANT_PROJECT_ELEMENT.inherit_attribute_name */
extern unsigned char ge142os2530;
extern T0* ge142ov2530;
extern T0* T30f14(T0* C);
/* GEANT_PROJECT.set_targets */
extern void T22f32(T0* C, T0* a1);
/* GEANT_TARGET.make */
extern T0* T26c80(T0* a1, T0* a2);
/* GEANT_ARGUMENT_ELEMENT.name */
extern T0* T188f2(T0* C);
/* GEANT_ARGUMENT_ELEMENT.attribute_value */
extern T0* T188f5(T0* C, T0* a1);
/* GEANT_ARGUMENT_ELEMENT.name_attribute_name */
extern T0* T188f3(T0* C);
/* GEANT_ARGUMENT_ELEMENT.has_name */
extern T1 T188f6(T0* C);
/* GEANT_ARGUMENT_ELEMENT.has_attribute */
extern T1 T188f4(T0* C, T0* a1);
/* GEANT_ARGUMENT_ELEMENT.make */
extern T0* T188c7(T0* a1);
/* GEANT_ARGUMENT_ELEMENT.set_xml_element */
extern void T188f8(T0* C, T0* a1);
/* GEANT_TARGET.elements_by_name */
extern T0* T26f15(T0* C, T0* a1);
/* GEANT_TARGET.empty_argument_variables */
extern unsigned char ge61os1708;
extern T0* ge61ov1708;
extern T0* T26f13(T0* C);
/* GEANT_TARGET.set_execute_once */
extern void T26f86(T0* C, T1 a1);
/* GEANT_TARGET.boolean_value */
extern T1 T26f37(T0* C, T0* a1);
/* GEANT_TARGET.false_attribute_value */
extern T0* T26f26(T0* C);
/* GEANT_TARGET.true_attribute_value */
extern T0* T26f25(T0* C);
/* GEANT_TARGET.attribute_value */
extern T0* T26f23(T0* C, T0* a1);
/* GEANT_TARGET.once_attribute_name */
extern unsigned char ge63os2374;
extern T0* ge63ov2374;
extern T0* T26f31(T0* C);
/* GEANT_TARGET.set_exports */
extern void T26f85(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].set_equality_tester */
extern void T71f37(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].put */
extern void T71f29(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [STRING_8].move_cursors_right */
extern void T71f34(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].set_position */
extern void T72f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].move_right */
extern void T71f33(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [STRING_8].put_last */
extern void T71f32(T0* C, T0* a1);
/* GEANT_TARGET.export_attribute_name */
extern unsigned char ge63os2373;
extern T0* ge63ov2373;
extern T0* T26f20(T0* C);
/* GEANT_TARGET.set_description */
extern void T26f84(T0* C, T0* a1);
/* GEANT_TARGET.set_obsolete_message */
extern void T26f83(T0* C, T0* a1);
/* GEANT_TARGET.set_name */
extern void T26f82(T0* C, T0* a1);
/* GEANT_TARGET.name_attribute_name */
extern unsigned char ge63os2371;
extern T0* ge63ov2371;
extern T0* T26f12(T0* C);
/* GEANT_TARGET.make */
extern void T26f80p1(T0* C, T0* a1, T0* a2);
/* GEANT_TARGET.set_project */
extern void T26f88(T0* C, T0* a1);
/* GEANT_TARGET.element_make */
extern void T26f87(T0* C, T0* a1);
/* GEANT_TARGET.set_xml_element */
extern void T26f89(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].set_key_equality_tester */
extern void T31f45(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_map */
extern T0* T31c44(T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_with_equality_testers */
extern void T31f48(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [GEANT_TARGET, STRING_8].make */
extern T0* T122c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_TARGET, STRING_8].new_cursor */
extern T0* T122f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_TARGET, STRING_8].make */
extern T0* T203c3(T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_sparse_container */
extern void T31f55(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_slots */
extern void T31f63(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_clashes */
extern void T31f62(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_key_storage */
extern void T31f61(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_item_storage */
extern void T31f60(T0* C, T6 a1);
/* GEANT_PROJECT_ELEMENT.elements_by_name */
extern T0* T30f11(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.string_ */
extern T0* T30f19(T0* C);
/* GEANT_PROJECT_ELEMENT.target_element_name */
extern unsigned char ge142os2533;
extern T0* ge142ov2533;
extern T0* T30f10(T0* C);
/* GEANT_PROJECT.set_default_target_name */
extern void T22f30(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.default_attribute_name */
extern unsigned char ge142os2529;
extern T0* ge142ov2529;
extern T0* T30f9(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.basename */
extern T0* T53f24(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_root_directory */
extern T1 T53f25(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.basename */
extern T0* T54f21(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.is_root_directory */
extern T1 T54f22(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.set_variable_value */
extern void T25f59(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.force */
extern void T25f62(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.key_storage_put */
extern void T25f70(T0* C, T0* a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.slots_put */
extern void T25f69(T0* C, T6 a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.clashes_put */
extern void T25f68(T0* C, T6 a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.resize */
extern void T25f67(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.clashes_resize */
extern void T25f75(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.special_integer_ */
extern T0* T25f36(T0* C);
/* GEANT_PROJECT_VARIABLES.key_storage_resize */
extern void T25f74(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.item_storage_resize */
extern void T25f73(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.slots_resize */
extern void T25f72(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.new_modulus */
extern T6 T25f29(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.new_capacity */
extern T6 T25f32(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.item_storage_put */
extern void T25f66(T0* C, T0* a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.unset_found_item */
extern void T25f64(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.dirname */
extern T0* T53f23(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.dirname */
extern T0* T54f20(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.unix_file_system */
extern T0* T30f8(T0* C);
/* GEANT_PROJECT_ELEMENT.file_system */
extern T0* T30f7(T0* C);
/* GEANT_PROJECT_ELEMENT.windows_file_system */
extern T0* T30f18(T0* C);
/* GEANT_PROJECT_ELEMENT.operating_system */
extern T0* T30f17(T0* C);
/* GEANT_PROJECT.set_description */
extern void T22f29(T0* C, T0* a1);
/* XM_ELEMENT.has_element_by_name */
extern T1 T97f15(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.description_element_name */
extern T0* T30f6(T0* C);
/* GEANT_PROJECT_ELEMENT.attribute_value */
extern T0* T30f4(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.exit_application */
extern void T30f22(T0* C, T6 a1, T0* a2);
/* GEANT_PROJECT_ELEMENT.exceptions */
extern T0* T30f13(T0* C);
/* GEANT_PROJECT_ELEMENT.std */
extern T0* T30f12(T0* C);
/* GEANT_PROJECT_ELEMENT.has_attribute */
extern T1 T30f3(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.name_attribute_name */
extern unsigned char ge142os2528;
extern T0* ge142ov2528;
extern T0* T30f5(T0* C);
/* GEANT_PROJECT.make */
extern T0* T22c23(T0* a1, T0* a2, T0* a3);
/* GEANT_PROJECT.set_options */
extern void T22f37(T0* C, T0* a1);
/* GEANT_PROJECT.set_variables */
extern void T22f36(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.element_make */
extern void T30f21(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.set_xml_element */
extern void T30f24(T0* C, T0* a1);
/* XM_TREE_CALLBACKS_PIPE.document */
extern T0* T92f8(T0* C);
/* XM_EIFFEL_PARSER.is_correct */
extern T1 T91f121(T0* C);
/* XM_EIFFEL_PARSER.parse_from_stream */
extern void T91f205(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.parse_with_events */
extern void T91f209(T0* C);
/* XM_EIFFEL_PARSER.on_finish */
extern void T91f215(T0* C);
/* XM_EIFFEL_PARSER.parse */
extern void T91f214(T0* C);
/* XM_EIFFEL_PARSER.yy_pop_last_value */
extern void T91f224(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.yy_push_error_value */
extern void T91f223(T0* C);
/* XM_EIFFEL_PARSER.yy_do_action */
extern void T91f222(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.on_notation_declaration */
extern void T91f252(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_notation_declaration */
extern void T169f8(T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.set_public */
extern void T141f6(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].resize */
extern T0* T167f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_EXTERNAL_ID].resized_area */
extern T0* T152f3(T0* C, T6 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].copy_data */
extern void T152f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_DTD_EXTERNAL_ID].move_data */
extern void T152f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_EXTERNAL_ID].overlapping_move */
extern void T152f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_EXTERNAL_ID].non_overlapping_move */
extern void T152f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_EXTERNAL_ID].make */
extern T0* T152c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].make */
extern T0* T167f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_DTD_EXTERNAL_ID].make_area */
extern T0* T237c2(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].default_create */
extern T0* T167c3(void);
/* XM_DTD_EXTERNAL_ID.set_system */
extern void T141f5(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_dtd_external_id */
extern T0* T91f169(T0* C);
/* XM_DTD_EXTERNAL_ID.make */
extern T0* T141c4(void);
/* XM_EIFFEL_PARSER.when_pe_entity_declared */
extern void T91f251(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].force */
extern void T134f40(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_put */
extern void T134f54(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_put */
extern void T134f53(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_put */
extern void T134f52(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_item */
extern T6 T134f31(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_item */
extern T6 T134f28(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].hash_position */
extern T6 T134f25(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].resize */
extern void T134f51(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_resize */
extern void T134f59(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].special_integer_ */
extern T0* T134f32(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_resize */
extern void T134f58(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_resize */
extern void T134f57(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].resize */
extern T0* T219f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].resized_area */
extern T0* T214f3(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].copy_data */
extern void T214f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].move_data */
extern void T214f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].overlapping_move */
extern void T214f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].non_overlapping_move */
extern void T214f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T214c4(T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_item */
extern T0* T134f22(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_resize */
extern void T134f56(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_modulus */
extern T6 T134f29(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_capacity */
extern T6 T134f23(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_put */
extern void T134f50(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].search_position */
extern void T134f42(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].unset_found_item */
extern void T134f45(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].has */
extern T1 T134f33(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_def */
extern T0* T172c208(T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_literal */
extern void T172f210(T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.default_create */
extern T0* T136c4(void);
/* XM_EIFFEL_PE_ENTITY_DEF.make_scanner */
extern void T172f211(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T172f213(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset_sent */
extern void T172f216(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T172f213p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T172f213p0(T0* C);
/* DS_LINKED_STACK [INTEGER_32].make */
extern T0* T210c5(void);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T172f213p2(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.make_with_buffer */
extern void T172f212(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_load_input_buffer */
extern void T172f215(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_content */
extern void T172f218(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.special_integer_ */
extern T0* T172f70(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_initialize */
extern void T172f214(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_build_tables */
extern void T172f217(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template */
extern unsigned char ge1423os6736;
extern T0* ge1423ov6736;
extern T0* T172f50(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_fixed_array */
extern T0* T172f54(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_meta_template */
extern unsigned char ge1423os6735;
extern T0* ge1423ov6735;
extern T0* T172f91(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_ec_template */
extern unsigned char ge1423os6734;
extern T0* ge1423ov6734;
extern T0* T172f69(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template */
extern unsigned char ge1423os6733;
extern T0* ge1423ov6733;
extern T0* T172f59(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template */
extern unsigned char ge1423os6732;
extern T0* ge1423ov6732;
extern T0* T172f52(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template */
extern unsigned char ge1423os6725;
extern T0* ge1423ov6725;
extern T0* T172f49(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_6 */
extern void T172f230(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_array_subcopy */
extern void T172f231(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* KL_ARRAY_ROUTINES [INTEGER_32].subcopy */
extern void T248f2(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* ARRAY [INTEGER_32].subcopy */
extern void T193f11(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* XM_EIFFEL_PE_ENTITY_DEF.integer_array_ */
extern unsigned char ge167os3092;
extern T0* ge167ov3092;
extern T0* T172f55(T0* C);
/* KL_ARRAY_ROUTINES [INTEGER_32].default_create */
extern T0* T248c1(void);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_5 */
extern void T172f229(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_4 */
extern void T172f228(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_3 */
extern void T172f227(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_2 */
extern void T172f226(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_1 */
extern void T172f225(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template */
extern unsigned char ge1423os6718;
extern T0* ge1423ov6718;
extern T0* T172f65(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_6 */
extern void T172f224(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_5 */
extern void T172f223(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_4 */
extern void T172f222(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_3 */
extern void T172f221(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_2 */
extern void T172f220(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_1 */
extern void T172f219(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.empty_buffer */
extern T0* T172f58(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.make */
extern T0* T205c8(void);
/* XM_EIFFEL_PE_ENTITY_DEF.make_external */
extern void T172f209(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.is_external */
extern T1 T166f51(T0* C);
/* XM_EIFFEL_PARSER.new_external_entity */
extern T0* T91f168(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.make_external */
extern T0* T166c207(T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_scanner */
extern void T166f208(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T166f210(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T166f210p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T166f210p0(T0* C);
/* XM_EIFFEL_ENTITY_DEF.make_with_buffer */
extern void T166f209(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_load_input_buffer */
extern void T166f212(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_content */
extern void T166f214(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.special_integer_ */
extern T0* T166f57(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_initialize */
extern void T166f211(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_build_tables */
extern void T166f213(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template */
extern T0* T166f48(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_fixed_array */
extern T0* T166f53(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_meta_template */
extern T0* T166f88(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_ec_template */
extern T0* T166f67(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template */
extern T0* T166f58(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template */
extern T0* T166f50(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template */
extern T0* T166f47(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_6 */
extern void T166f226(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_array_subcopy */
extern void T166f227(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_ENTITY_DEF.integer_array_ */
extern T0* T166f54(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_5 */
extern void T166f225(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_4 */
extern void T166f224(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_3 */
extern void T166f223(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_2 */
extern void T166f222(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_1 */
extern void T166f221(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template */
extern T0* T166f64(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_6 */
extern void T166f220(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_5 */
extern void T166f219(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_4 */
extern void T166f218(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_3 */
extern void T166f217(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_2 */
extern void T166f216(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_1 */
extern void T166f215(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.empty_buffer */
extern T0* T166f49(T0* C);
/* XM_EIFFEL_PARSER.on_entity_declaration */
extern void T91f250(T0* C, T0* a1, T1 a2, T0* a3, T0* a4, T0* a5);
/* XM_DTD_CALLBACKS_NULL.on_entity_declaration */
extern void T169f7(T0* C, T0* a1, T1 a2, T0* a3, T0* a4, T0* a5);
/* XM_EIFFEL_PARSER.when_entity_declared */
extern void T91f249(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.new_literal_entity */
extern T0* T91f167(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_literal */
extern T0* T166c206(T0* a1, T0* a2);
/* XM_DTD_ATTRIBUTE_CONTENT.set_default_value */
extern void T145f26(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_fixed */
extern void T145f25(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_implied */
extern void T145f24(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_required */
extern void T145f23(T0* C);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].resize */
extern T0* T165f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].resized_area */
extern T0* T164f3(T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].copy_data */
extern void T164f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].move_data */
extern void T164f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].overlapping_move */
extern void T164f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].non_overlapping_move */
extern void T164f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].make */
extern T0* T164c4(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].make */
extern T0* T165f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_BILINKED_LIST [STRING_8]].make_area */
extern T0* T236c2(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].default_create */
extern T0* T165c3(void);
/* DS_BILINKED_LIST [STRING_8].force_last */
extern void T146f12(T0* C, T0* a1);
/* DS_BILINKABLE [STRING_8].put_right */
extern void T228f5(T0* C, T0* a1);
/* DS_BILINKABLE [STRING_8].attach_left */
extern void T228f6(T0* C, T0* a1);
/* DS_BILINKABLE [STRING_8].make */
extern T0* T228c4(T0* a1);
/* DS_BILINKED_LIST [STRING_8].is_empty */
extern T1 T146f7(T0* C);
/* XM_EIFFEL_PARSER.new_string_bilinked_list */
extern T0* T91f162(T0* C);
/* DS_BILINKED_LIST [STRING_8].set_equality_tester */
extern void T146f13(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.string_equality_tester */
extern T0* T91f182(T0* C);
/* DS_BILINKED_LIST [STRING_8].make */
extern T0* T146c11(void);
/* DS_BILINKED_LIST [STRING_8].new_cursor */
extern T0* T146f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].make */
extern T0* T227c7(T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration_list */
extern void T145f22(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration */
extern void T145f27(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.default_enumeration_list */
extern unsigned char ge1334os7597;
extern T0* ge1334ov7597;
extern T0* T145f7(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_notation */
extern void T145f21(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_token */
extern void T145f20(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_entity */
extern void T145f19(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_list_type */
extern void T145f18(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id_ref */
extern void T145f17(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id */
extern void T145f16(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_data */
extern void T145f15(T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content */
extern T0* T91f160(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.make */
extern T0* T145c12(void);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].resize */
extern T0* T163f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].resized_area */
extern T0* T161f3(T0* C, T6 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].copy_data */
extern void T161f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].move_data */
extern void T161f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].overlapping_move */
extern void T161f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].non_overlapping_move */
extern void T161f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T161c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T163f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make_area */
extern T0* T235c2(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].default_create */
extern T0* T163c3(void);
/* XM_DTD_ATTRIBUTE_CONTENT.copy_default */
extern void T145f14(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_implied */
extern T1 T145f11(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_required */
extern T1 T145f10(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.has_default_value */
extern T1 T145f9(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_fixed */
extern T1 T145f8(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_name */
extern void T145f13(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].resize */
extern T0* T162f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].resized_area */
extern T0* T159f3(T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].copy_data */
extern void T159f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].move_data */
extern void T159f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].overlapping_move */
extern void T159f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].non_overlapping_move */
extern void T159f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T159c4(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T162f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make_area */
extern T0* T234c2(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].default_create */
extern T0* T162c3(void);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].force_last */
extern void T144f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].put_right */
extern void T225f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].attach_left */
extern void T225f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T225c4(T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].is_empty */
extern T1 T144f5(T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content_list */
extern T0* T91f153(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T144c8(void);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].new_cursor */
extern T0* T144f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T224c7(T0* a1);
/* XM_EIFFEL_PARSER.on_attribute_declarations */
extern void T91f248(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].forth */
extern void T224f9(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_forth */
extern void T144f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].add_traversing_cursor */
extern void T144f12(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set_next_cursor */
extern void T224f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].remove_traversing_cursor */
extern void T144f13(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set */
extern void T224f10(T0* C, T0* a1, T1 a2, T1 a3);
/* XM_EIFFEL_PARSER.on_attribute_declaration */
extern void T91f258(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_DTD_CALLBACKS_NULL.on_attribute_declaration */
extern void T169f9(T0* C, T0* a1, T0* a2, T0* a3);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].item */
extern T0* T224f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].start */
extern void T224f8(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_start */
extern void T144f10(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_off */
extern T1 T144f7(T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_more */
extern void T143f11(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_mixed */
extern T0* T143c10(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_mixed */
extern void T143f21(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_choice */
extern void T143f19(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_list */
extern void T143f16(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_default */
extern void T143f22(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one */
extern void T143f12(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_sequence */
extern void T143f20(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T223c7(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].new_cursor */
extern T0* T223f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T271c3(T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_sequence */
extern T0* T143c9(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_last */
extern void T223f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].put_right */
extern void T272f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].attach_left */
extern void T272f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T272c4(T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].is_empty */
extern T1 T223f5(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_choice */
extern T0* T143c8(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_first */
extern void T223f8(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.element_name */
extern T0* T91f147(T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_name */
extern T0* T143c15(T0* a1);
/* XM_EIFFEL_PARSER.set_element_repetition */
extern void T91f247(T0* C, T0* a1, T0* a2);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_one */
extern void T143f14(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one_or_more */
extern void T143f13(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_any */
extern T0* T143c7(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_any */
extern void T143f18(T0* C);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].resize */
extern T0* T157f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].resized_area */
extern T0* T156f3(T0* C, T6 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].copy_data */
extern void T156f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].move_data */
extern void T156f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].overlapping_move */
extern void T156f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].non_overlapping_move */
extern void T156f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T156c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T157f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_DTD_ELEMENT_CONTENT].make_area */
extern T0* T233c2(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].default_create */
extern T0* T157c3(void);
/* XM_DTD_ELEMENT_CONTENT.make_empty */
extern T0* T143c6(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_empty */
extern void T143f17(T0* C);
/* XM_EIFFEL_PARSER.on_element_declaration */
extern void T91f246(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_element_declaration */
extern void T169f6(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_attribute */
extern void T91f245(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].has */
extern T1 T142f30(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].search_position */
extern void T142f34(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_item */
extern T6 T142f22(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].hash_position */
extern T6 T142f24(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.hash_code */
extern T6 T139f9(T0* C);
/* XM_EIFFEL_PARSER_NAME.item */
extern T0* T139f14(T0* C, T6 a1);
/* DS_BILINKED_LIST [STRING_8].item */
extern T0* T146f8(T0* C, T6 a1);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].test */
extern T1 T221f1(T0* C, T0* a1, T0* a2);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].any_ */
extern T0* T221f2(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_storage_item */
extern T0* T142f18(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_item */
extern T0* T142f29(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_equality_tester */
extern T0* T142f17(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_item */
extern T6 T142f25(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].resize */
extern T0* T155f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].resized_area */
extern T0* T154f2(T0* C, T6 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].copy_data */
extern void T154f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].move_data */
extern void T154f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].overlapping_move */
extern void T154f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].non_overlapping_move */
extern void T154f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T154c4(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T155f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make_area */
extern T0* T232c2(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].default_create */
extern T0* T155c3(void);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].force_new */
extern void T142f33(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_put */
extern void T142f40(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_put */
extern void T142f39(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_put */
extern void T142f38(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].resize */
extern void T142f37(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_resize */
extern void T142f48(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].special_integer_ */
extern T0* T142f28(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_storage_resize */
extern void T142f47(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_resize */
extern void T142f46(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_resize */
extern void T142f45(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_modulus */
extern T6 T142f19(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_capacity */
extern T6 T142f26(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].unset_found_item */
extern void T142f36(T0* C);
/* XM_EIFFEL_PARSER.new_name_set */
extern T0* T91f134(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_equal */
extern T0* T142c32(T6 a1);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T221c3(void);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make */
extern void T142f35(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_cursor */
extern T0* T142f21(T0* C);
/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME].make */
extern T0* T222c3(T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_slots */
extern void T142f44(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_clashes */
extern void T142f43(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_key_storage */
extern void T142f42(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_item_storage */
extern void T142f41(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.on_start_tag */
extern void T91f244(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER.on_end_tag */
extern void T91f243(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER_NAME.local_part */
extern T0* T139f12(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].forth */
extern void T227f9(T0* C);
/* DS_BILINKED_LIST [STRING_8].cursor_forth */
extern void T146f15(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].add_traversing_cursor */
extern void T146f16(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T227f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].remove_traversing_cursor */
extern void T146f17(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].set */
extern void T227f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [STRING_8].item */
extern T0* T227f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].start */
extern void T227f8(T0* C);
/* DS_BILINKED_LIST [STRING_8].cursor_start */
extern void T146f14(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].cursor_off */
extern T1 T146f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.string_ */
extern T0* T139f18(T0* C);
/* XM_EIFFEL_PARSER_NAME.last */
extern T0* T139f17(T0* C);
/* DS_BILINKED_LIST [STRING_8].last */
extern T0* T146f9(T0* C);
/* XM_EIFFEL_PARSER_NAME.ns_prefix */
extern T0* T139f11(T0* C);
/* XM_EIFFEL_PARSER_NAME.is_namespace_name */
extern T1 T139f16(T0* C);
/* XM_EIFFEL_PARSER.on_start_tag_finish */
extern void T91f242(T0* C);
/* KL_SPECIAL_ROUTINES [BOOLEAN].resize */
extern T0* T153f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [BOOLEAN].resized_area */
extern T0* T151f3(T0* C, T6 a1);
/* SPECIAL [BOOLEAN].copy_data */
extern void T151f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [BOOLEAN].move_data */
extern void T151f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [BOOLEAN].overlapping_move */
extern void T151f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [BOOLEAN].non_overlapping_move */
extern void T151f9(T0* C, T6 a1, T6 a2, T6 a3);
/* KL_SPECIAL_ROUTINES [BOOLEAN].make */
extern T0* T153f1(T0* C, T6 a1);
/* TO_SPECIAL [BOOLEAN].make_area */
extern T0* T231c2(T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].default_create */
extern T0* T153c3(void);
/* XM_EIFFEL_PARSER.when_external_dtd */
extern void T91f241(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.last_error */
extern T0* T136f2(T0* C);
/* XM_EIFFEL_PARSER.null_resolver */
extern unsigned char ge1421os5149;
extern T0* ge1421ov5149;
extern T0* T91f103(T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern T0* T170c198(void);
/* XM_EIFFEL_SCANNER_DTD.set_start_condition */
extern void T170f205(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern void T170f198p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T170f207(T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T170f207p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_with_buffer */
extern void T170f206(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_load_input_buffer */
extern void T170f217(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_content */
extern void T170f218(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.special_integer_ */
extern T0* T170f184(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_initialize */
extern void T170f216(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_build_tables */
extern void T170f221(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template */
extern T0* T170f192(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_fixed_array */
extern T0* T170f195(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_meta_template */
extern T0* T170f191(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_ec_template */
extern T0* T170f190(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template */
extern T0* T170f189(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template */
extern T0* T170f188(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template */
extern T0* T170f187(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_6 */
extern void T170f233(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_array_subcopy */
extern void T170f234(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_SCANNER_DTD.integer_array_ */
extern T0* T170f197(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_5 */
extern void T170f232(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_4 */
extern void T170f231(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_3 */
extern void T170f230(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_2 */
extern void T170f229(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_1 */
extern void T170f228(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template */
extern T0* T170f186(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_6 */
extern void T170f227(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_5 */
extern void T170f226(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_4 */
extern void T170f225(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_3 */
extern void T170f224(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_2 */
extern void T170f223(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_1 */
extern void T170f222(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.empty_buffer */
extern T0* T170f49(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].force */
extern void T132f8(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.has_error */
extern T1 T136f1(T0* C);
/* XM_EIFFEL_PARSER.resolve_external_id */
extern void T91f257(T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.resolve */
extern void T136f6(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_public */
extern void T136f5(T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.is_public */
extern T1 T141f3(T0* C);
/* XM_EIFFEL_PARSER.on_dtd_end */
extern void T91f240(T0* C);
/* XM_DTD_CALLBACKS_NULL.on_dtd_end */
extern void T169f5(T0* C);
/* XM_EIFFEL_PARSER.on_doctype */
extern void T91f239(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_DTD_CALLBACKS_NULL.on_doctype */
extern void T169f4(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_DTD_CALLBACKS_NULL.make */
extern T0* T169c1(void);
/* XM_EIFFEL_DECLARATION.set_encoding */
extern void T140f9(T0* C, T0* a1);
/* XM_EIFFEL_DECLARATION.set_stand_alone */
extern void T140f8(T0* C, T1 a1);
/* XM_EIFFEL_DECLARATION.set_version */
extern void T140f11(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].resize */
extern T0* T150f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_DECLARATION].resized_area */
extern T0* T149f3(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_DECLARATION].copy_data */
extern void T149f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_EIFFEL_DECLARATION].move_data */
extern void T149f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_DECLARATION].overlapping_move */
extern void T149f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_DECLARATION].non_overlapping_move */
extern void T149f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_DECLARATION].make */
extern T0* T149c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].make */
extern T0* T150f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_EIFFEL_DECLARATION].make_area */
extern T0* T230c2(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].default_create */
extern T0* T150c3(void);
/* XM_EIFFEL_DECLARATION.make */
extern T0* T140c7(void);
/* XM_EIFFEL_DECLARATION.process */
extern void T140f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_xml_declaration */
extern void T91f261(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_EIFFEL_PARSER.apply_encoding */
extern void T91f238(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_content */
extern void T91f237(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_dtd_processing_instruction */
extern void T91f236(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_dtd_processing_instruction */
extern void T169f3(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_processing_instruction */
extern void T91f235(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_dtd_comment */
extern void T91f234(T0* C, T0* a1);
/* XM_DTD_CALLBACKS_NULL.on_dtd_comment */
extern void T169f2(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_comment */
extern void T91f233(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.entity_referenced_in_entity_value */
extern T0* T91f117(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.defined_entity_referenced */
extern T0* T91f194(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.external_entity_to_string */
extern T0* T91f200(T0* C, T0* a1);
/* STRING_8.remove */
extern void T17f51(T0* C, T6 a1);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_finish */
extern void T136f7(T0* C);
/* XM_EIFFEL_INPUT_STREAM.read_string */
extern void T196f29(T0* C, T6 a1);
/* XM_EIFFEL_INPUT_STREAM.last_character */
extern T2 T196f19(T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].item */
extern T2 T255f5(T0* C);
/* XM_EIFFEL_INPUT_STREAM.end_of_input */
extern T1 T196f18(T0* C);
/* KL_TEXT_INPUT_FILE.end_of_input */
extern T1 T55f27(T0* C);
/* XM_EIFFEL_INPUT_STREAM.read_character */
extern void T196f31(T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].remove */
extern void T255f7(T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].wipe_out */
extern void T255f9(T0* C);
/* XM_EIFFEL_INPUT_STREAM.noqueue_read_character */
extern void T196f33(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf16_read_character */
extern void T196f35(T0* C);
/* XM_EIFFEL_INPUT_STREAM.append_character */
extern void T196f36(T0* C, T6 a1);
/* DS_LINKED_QUEUE [CHARACTER_8].force */
extern void T255f8(T0* C, T2 a1);
/* DS_LINKABLE [CHARACTER_8].put_right */
extern void T333f4(T0* C, T0* a1);
/* DS_LINKED_QUEUE [CHARACTER_8].is_empty */
extern T1 T255f4(T0* C);
/* DS_LINKABLE [CHARACTER_8].make */
extern T0* T333c3(T2 a1);
/* UC_UTF8_ROUTINES.append_code_to_utf8 */
extern void T194f37(T0* C, T0* a1, T6 a2);
/* UC_UTF8_ROUTINES.integer_ */
extern T0* T194f29(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf8 */
extern T0* T196f22(T0* C);
/* KL_STRING_ROUTINES.wipe_out */
extern void T76f21(T0* C, T0* a1);
/* UC_UTF8_STRING.old_clear_all */
extern void T195f85(T0* C);
/* STRING_8.clear_all */
extern void T17f54(T0* C);
/* XM_EIFFEL_INPUT_STREAM.string_ */
extern T0* T196f17(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf8_buffer */
extern unsigned char ge1416os7925;
extern T0* ge1416ov7925;
extern T0* T196f25(T0* C);
/* UC_UTF16_ROUTINES.surrogate */
extern T6 T256f7(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_low_surrogate */
extern T1 T256f6(T0* C, T6 a1);
/* UC_UTF16_ROUTINES.least_10_bits */
extern T6 T256f5(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_high_surrogate */
extern T1 T256f4(T0* C, T6 a1);
/* UC_UTF16_ROUTINES.is_surrogate */
extern T1 T256f3(T0* C, T6 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16 */
extern unsigned char ge233os4952;
extern T0* ge233ov4952;
extern T0* T196f20(T0* C);
/* UC_UTF16_ROUTINES.default_create */
extern T0* T256c16(void);
/* XM_EIFFEL_INPUT_STREAM.least_significant */
extern T6 T196f24(T0* C, T2 a1, T2 a2);
/* XM_EIFFEL_INPUT_STREAM.most_significant */
extern T6 T196f23(T0* C, T2 a1, T2 a2);
/* XM_EIFFEL_INPUT_STREAM.latin1_read_character */
extern void T196f34(T0* C);
/* KL_STRING_INPUT_STREAM.read_character */
extern void T355f9(T0* C);
/* KL_TEXT_INPUT_FILE.read_character */
extern void T55f65(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_character */
extern void T55f66(T0* C);
/* KL_TEXT_INPUT_FILE.file_gc */
extern T2 T55f30(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.old_end_of_file */
extern T1 T55f29(T0* C);
/* KL_TEXT_INPUT_FILE.file_feof */
extern T1 T55f31(T0* C, T14 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16_detect_read_character */
extern void T196f32(T0* C);
/* UC_UTF8_ROUTINES.is_endian_detection_character */
extern T1 T194f31(T0* C, T2 a1, T2 a2, T2 a3);
/* UC_UTF8_ROUTINES.is_endian_detection_character_start */
extern T1 T194f30(T0* C, T2 a1, T2 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_least_first */
extern T1 T256f2(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_most_first */
extern T1 T256f1(T0* C, T6 a1, T6 a2);
/* KL_PLATFORM.maximum_integer */
extern unsigned char ge305os7986;
extern T6 ge305ov7986;
extern T6 T198f2(T0* C);
/* KL_PLATFORM.old_maximum_integer */
extern T6 T198f4(T0* C);
/* KL_INTEGER_ROUTINES.platform */
extern T0* T197f1(T0* C);
/* XM_EIFFEL_PARSER.integer_ */
extern T0* T91f201(T0* C);
/* XM_EIFFEL_INPUT_STREAM.make_from_stream */
extern T0* T196c28(T0* a1);
/* DS_LINKED_QUEUE [CHARACTER_8].make */
extern T0* T255c6(void);
/* XM_NULL_EXTERNAL_RESOLVER.last_stream */
extern T0* T136f3(T0* C);
/* XM_EIFFEL_ENTITY_DEF.is_literal */
extern T1 T166f62(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_literal */
extern T1 T172f63(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_external */
extern T1 T172f66(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item */
extern T0* T134f21(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_item */
extern T0* T134f36(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.force_error */
extern void T91f232(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.report_error */
extern void T91f230(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_error */
extern void T91f256(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.setup_error_state */
extern void T91f255(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.onstring_utf8 */
extern T0* T91f96(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.maximum_item_code */
extern T6 T91f189(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_latin1 */
extern T1 T91f188(T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_from_utf8 */
extern T0* T91f184(T0* C, T0* a1);
/* UC_UTF8_STRING.make_from_utf8 */
extern T0* T195c54(T0* a1);
/* UC_UTF8_STRING.append_utf8 */
extern void T195f62(T0* C, T0* a1);
/* UC_UTF8_ROUTINES.valid_utf8 */
extern T1 T194f1(T0* C, T0* a1);
/* UC_UTF8_ROUTINES.is_encoded_next_byte */
extern T1 T194f10(T0* C, T2 a1);
/* UC_UTF8_ROUTINES.is_encoded_second_byte */
extern T1 T194f5(T0* C, T2 a1, T2 a2);
/* UC_UTF8_ROUTINES.is_encoded_first_byte */
extern T1 T194f2(T0* C, T2 a1);
/* XM_EIFFEL_PARSER.utf8 */
extern T0* T91f187(T0* C);
/* XM_EIFFEL_PARSER.is_string_mode_ascii */
extern T1 T91f185(T0* C);
/* XM_EIFFEL_PARSER.onstring_ascii */
extern T0* T91f94(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_unicode */
extern T1 T91f183(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string */
extern T0* T91f115(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_string */
extern unsigned char ge1421os5217;
extern T0* ge1421ov5217;
extern T0* T91f193(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_uc */
extern unsigned char ge1421os5218;
extern T0* ge1421ov5218;
extern T0* T91f192(T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_empty */
extern T0* T91f199(T0* C);
/* UC_UTF8_STRING.make_empty */
extern T0* T195c58(void);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].resize */
extern T0* T148f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].resized_area */
extern T0* T147f2(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].copy_data */
extern void T147f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].move_data */
extern void T147f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].overlapping_move */
extern void T147f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].non_overlapping_move */
extern void T147f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].make */
extern T0* T147c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].make */
extern T0* T148f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_EIFFEL_PARSER_NAME].make_area */
extern T0* T229c2(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T148c3(void);
/* XM_EIFFEL_PARSER.namespace_force_last */
extern void T91f231(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER_NAME.force_last */
extern void T139f20(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.new_string_bilinked_list */
extern T0* T139f7(T0* C);
/* XM_EIFFEL_PARSER_NAME.string_equality_tester */
extern T0* T139f8(T0* C);
/* XM_EIFFEL_PARSER_NAME.can_force_last */
extern T1 T139f6(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_namespace_name */
extern T0* T91f111(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern void T139f21(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern T0* T139c21(void);
/* XM_EIFFEL_PARSER_NAME.make_namespaces */
extern T0* T139c19(void);
/* XM_EIFFEL_PARSER.yy_push_last_value */
extern void T91f221(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.accept */
extern void T91f220(T0* C);
/* XM_EIFFEL_PARSER.yy_do_error_action */
extern void T91f218(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.report_eof_expected_error */
extern void T91f229(T0* C);
/* XM_EIFFEL_PARSER.read_token */
extern void T91f217(T0* C);
/* XM_EIFFEL_PARSER.process_attribute_entity */
extern void T91f228(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_entity_scanner */
extern void T91f254(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_start_condition */
extern void T166f229(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_start_condition */
extern void T172f233(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.has_error */
extern T1 T166f55(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.has_error */
extern T1 T172f56(T0* C);
/* XM_EIFFEL_ENTITY_DEF.apply_input_buffer */
extern void T166f228(T0* C);
/* KL_STRING_INPUT_STREAM.make */
extern T0* T355c8(T0* a1);
/* UC_UTF8_ROUTINES.to_utf8 */
extern T0* T194f35(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.utf8 */
extern T0* T166f66(T0* C);
/* XM_EIFFEL_ENTITY_DEF.fatal_error */
extern void T166f236(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.apply_input_buffer */
extern void T172f232(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.utf8 */
extern T0* T172f68(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.fatal_error */
extern void T172f240(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_entity */
extern void T91f227(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_pe_entity */
extern void T91f226(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.special_integer_ */
extern T0* T91f113(T0* C);
/* XM_EIFFEL_PARSER.yy_init_value_stacks */
extern void T91f216(T0* C);
/* XM_EIFFEL_PARSER.yy_clear_all */
extern void T91f225(T0* C);
/* XM_EIFFEL_PARSER.clear_all */
extern void T91f253(T0* C);
/* XM_EIFFEL_PARSER.clear_stacks */
extern void T91f259(T0* C);
/* XM_EIFFEL_PARSER.yy_clear_value_stacks */
extern void T91f260(T0* C);
/* SPECIAL [XM_EIFFEL_DECLARATION].clear_all */
extern void T149f6(T0* C);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].clear_all */
extern void T164f6(T0* C);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].clear_all */
extern void T159f6(T0* C);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].clear_all */
extern void T161f6(T0* C);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].clear_all */
extern void T156f6(T0* C);
/* SPECIAL [XM_DTD_EXTERNAL_ID].clear_all */
extern void T152f6(T0* C);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].clear_all */
extern void T154f6(T0* C);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].clear_all */
extern void T147f6(T0* C);
/* XM_EIFFEL_PARSER.abort */
extern void T91f219(T0* C);
/* XM_EIFFEL_PARSER.on_start */
extern void T91f213(T0* C);
/* XM_CALLBACKS_NULL.make */
extern T0* T133c1(void);
/* XM_EIFFEL_PARSER.reset_error_state */
extern void T91f212(T0* C);
/* XM_EIFFEL_PARSER.reset */
extern void T91f208(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].wipe_out */
extern void T134f39(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_wipe_out */
extern void T134f49(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_wipe_out */
extern void T134f48(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_wipe_out */
extern void T134f47(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_wipe_out */
extern void T134f46(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].move_all_cursors_after */
extern void T134f44(T0* C);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].set_next_cursor */
extern void T217f6(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].set_position */
extern void T217f5(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.make_scanner */
extern void T91f206(T0* C);
/* XM_EIFFEL_SCANNER.make_scanner */
extern T0* T128c196(void);
/* XM_EIFFEL_SCANNER.reset */
extern void T128f204(T0* C);
/* XM_EIFFEL_SCANNER.reset */
extern void T128f204p1(T0* C);
/* XM_EIFFEL_SCANNER.make_with_buffer */
extern void T128f203(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_load_input_buffer */
extern void T128f212(T0* C);
/* XM_EIFFEL_SCANNER.yy_set_content */
extern void T128f213(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.special_integer_ */
extern T0* T128f182(T0* C);
/* XM_EIFFEL_SCANNER.yy_initialize */
extern void T128f211(T0* C);
/* XM_EIFFEL_SCANNER.yy_build_tables */
extern void T128f219(T0* C);
/* XM_EIFFEL_SCANNER.yy_accept_template */
extern T0* T128f190(T0* C);
/* XM_EIFFEL_SCANNER.yy_fixed_array */
extern T0* T128f193(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_meta_template */
extern T0* T128f189(T0* C);
/* XM_EIFFEL_SCANNER.yy_ec_template */
extern T0* T128f188(T0* C);
/* XM_EIFFEL_SCANNER.yy_def_template */
extern T0* T128f187(T0* C);
/* XM_EIFFEL_SCANNER.yy_base_template */
extern T0* T128f186(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template */
extern T0* T128f185(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_6 */
extern void T128f231(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_array_subcopy */
extern void T128f232(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_SCANNER.integer_array_ */
extern T0* T128f195(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_5 */
extern void T128f230(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_4 */
extern void T128f229(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_3 */
extern void T128f228(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_2 */
extern void T128f227(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_1 */
extern void T128f226(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template */
extern T0* T128f184(T0* C);
/* XM_EIFFEL_SCANNER.yy_nxt_template_6 */
extern void T128f225(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_5 */
extern void T128f224(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_4 */
extern void T128f223(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_3 */
extern void T128f222(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_2 */
extern void T128f221(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_1 */
extern void T128f220(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.empty_buffer */
extern T0* T128f42(T0* C);
/* GEANT_PROJECT_PARSER.make */
extern T0* T56c8(T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.enable_position_table */
extern void T95f10(T0* C, T0* a1);
/* XM_POSITION_TABLE.make */
extern T0* T176c2(void);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T241c7(void);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].new_cursor */
extern T0* T241f6(T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T278c3(T0* a1);
/* XM_EIFFEL_PARSER.set_callbacks */
extern void T91f204(T0* C, T0* a1);
/* XM_TREE_CALLBACKS_PIPE.make */
extern T0* T92c10(void);
/* XM_TREE_CALLBACKS_PIPE.callbacks_pipe */
extern T0* T92f9(T0* C, T0* a1);
/* ARRAY [XM_CALLBACKS_FILTER].item */
extern T0* T175f4(T0* C, T6 a1);
/* XM_CALLBACKS_TO_TREE_FILTER.make_null */
extern T0* T95c9(void);
/* XM_TREE_CALLBACKS_PIPE.new_stop_on_error */
extern T0* T92f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.make_null */
extern T0* T98c4(void);
/* XM_TREE_CALLBACKS_PIPE.new_namespace_resolver */
extern T0* T92f6(T0* C);
/* XM_NAMESPACE_RESOLVER.make_null */
extern T0* T173c25(void);
/* XM_EIFFEL_PARSER.set_string_mode_mixed */
extern void T91f203(T0* C);
/* XM_EIFFEL_PARSER.make */
extern T0* T91c202(void);
/* XM_EIFFEL_PARSER.new_entities_table */
extern T0* T91f87(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].set_key_equality_tester */
extern void T134f41(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8].internal_set_equality_tester */
extern void T215f6(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_map_default */
extern T0* T134c38(void);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_map */
extern void T134f43(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_with_equality_testers */
extern void T134f55(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T215c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8].new_cursor */
extern T0* T215f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T269c3(T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_cursor */
extern T0* T134f35(T0* C);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T217c4(T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_sparse_container */
extern void T134f60(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_slots */
extern void T134f64(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_clashes */
extern void T134f63(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_key_storage */
extern void T134f62(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_item_storage */
extern void T134f61(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T219f2(T0* C, T6 a1);
/* TO_SPECIAL [XM_EIFFEL_ENTITY_DEF].make_area */
extern T0* T270c2(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].default_create */
extern T0* T219c3(void);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].default_capacity */
extern T6 T134f26(T0* C);
/* XM_EIFFEL_PARSER.make_parser */
extern void T91f207(T0* C);
/* XM_EIFFEL_PARSER.yy_build_parser_tables */
extern void T91f211(T0* C);
/* XM_EIFFEL_PARSER.yycheck_template */
extern unsigned char ge1417os5096;
extern T0* ge1417ov5096;
extern T0* T91f104(T0* C);
/* XM_EIFFEL_PARSER.yyfixed_array */
extern T0* T91f181(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytable_template */
extern unsigned char ge1417os5095;
extern T0* ge1417ov5095;
extern T0* T91f92(T0* C);
/* XM_EIFFEL_PARSER.yypgoto_template */
extern unsigned char ge1417os5094;
extern T0* ge1417ov5094;
extern T0* T91f90(T0* C);
/* XM_EIFFEL_PARSER.yypact_template */
extern unsigned char ge1417os5093;
extern T0* ge1417ov5093;
extern T0* T91f88(T0* C);
/* XM_EIFFEL_PARSER.yydefgoto_template */
extern unsigned char ge1417os5092;
extern T0* ge1417ov5092;
extern T0* T91f86(T0* C);
/* XM_EIFFEL_PARSER.yydefact_template */
extern unsigned char ge1417os5091;
extern T0* ge1417ov5091;
extern T0* T91f84(T0* C);
/* XM_EIFFEL_PARSER.yytypes2_template */
extern unsigned char ge1417os5090;
extern T0* ge1417ov5090;
extern T0* T91f171(T0* C);
/* XM_EIFFEL_PARSER.yytypes1_template */
extern unsigned char ge1417os5089;
extern T0* ge1417ov5089;
extern T0* T91f151(T0* C);
/* XM_EIFFEL_PARSER.yyr1_template */
extern unsigned char ge1417os5088;
extern T0* ge1417ov5088;
extern T0* T91f126(T0* C);
/* XM_EIFFEL_PARSER.yytranslate_template */
extern unsigned char ge1417os5087;
extern T0* ge1417ov5087;
extern T0* T91f123(T0* C);
/* XM_EIFFEL_PARSER.yy_create_value_stacks */
extern void T91f210(T0* C);
/* XM_EXPAT_PARSER_FACTORY.new_expat_parser */
extern T0* T89f2(T0* C);
/* XM_EXPAT_PARSER_FACTORY.is_expat_parser_available */
extern T1 T89f1(T0* C);
/* XM_EXPAT_PARSER_FACTORY.default_create */
extern T0* T89c3(void);
/* KL_TEXT_INPUT_FILE.is_open_read */
extern T1 T55f17(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_read */
extern T1 T55f15(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T55f57(T0* C);
/* KL_TEXT_INPUT_FILE.is_closed */
extern T1 T55f19(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_closed */
extern T1 T55f25(T0* C);
/* KL_TEXT_INPUT_FILE.old_open_read */
extern void T55f62(T0* C);
/* KL_TEXT_INPUT_FILE.default_pointer */
extern T14 T55f22(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T55f62p1(T0* C);
/* KL_TEXT_INPUT_FILE.file_open */
extern T14 T55f24(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.old_is_readable */
extern T1 T55f23(T0* C);
/* UNIX_FILE_INFO.is_readable */
extern T1 T86f3(T0* C);
/* UNIX_FILE_INFO.file_eaccess */
extern T1 T86f4(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.buffered_file_info */
extern unsigned char ge2214os3405;
extern T0* ge2214ov3405;
extern T0* T55f14(T0* C);
/* UNIX_FILE_INFO.make */
extern T0* T86c14(void);
/* UNIX_FILE_INFO.make_buffered_file_info */
extern void T86f16(T0* C, T6 a1);
/* UNIX_FILE_INFO.stat_size */
extern T6 T86f6(T0* C);
/* KL_TEXT_INPUT_FILE.set_buffer */
extern void T55f60(T0* C);
/* UNIX_FILE_INFO.update */
extern void T86f15(T0* C, T0* a1);
/* UNIX_FILE_INFO.file_stat */
extern void T86f17(T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.old_exists */
extern T1 T55f21(T0* C);
/* KL_TEXT_INPUT_FILE.file_exists */
extern T1 T55f13(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.make */
extern void T55f56(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.make */
extern T0* T55c56(T0* a1);
/* KL_TEXT_INPUT_FILE.old_make */
extern void T55f61(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.string_ */
extern T0* T55f16(T0* C);
/* GEANT_PROJECT_LOADER.make */
extern T0* T23c9(T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_file_readable */
extern T1 T53f2(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.is_readable */
extern T1 T55f38(T0* C);
/* KL_TEXT_INPUT_FILE.is_plain */
extern T1 T55f28(T0* C);
/* UNIX_FILE_INFO.is_plain */
extern T1 T86f7(T0* C);
/* UNIX_FILE_INFO.file_info */
extern T6 T86f5(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.reset */
extern void T55f59(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.tmp_file */
extern unsigned char ge286os3932;
extern T0* ge286ov3932;
extern T0* T53f5(T0* C);
/* KL_UNIX_FILE_SYSTEM.is_file_readable */
extern T1 T54f2(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.tmp_file */
extern T0* T54f6(T0* C);
/* GEANT.default_build_filename */
extern unsigned char ge54os1703;
extern T0* ge54ov1703;
extern T0* T21f8(T0* C);
/* GEANT_PROJECT_OPTIONS.set_no_exec */
extern void T24f7(T0* C, T1 a1);
/* GEANT_PROJECT_OPTIONS.set_debug_mode */
extern void T24f6(T0* C, T1 a1);
/* GEANT_PROJECT_OPTIONS.set_verbose */
extern void T24f5(T0* C, T1 a1);
/* GEANT_PROJECT_OPTIONS.make */
extern T0* T24c4(void);
/* GEANT_PROJECT_VARIABLES.make */
extern T0* T25c58(void);
/* GEANT_PROJECT_VARIABLES.verbose_name */
extern unsigned char ge59os1837;
extern T0* ge59ov1837;
extern T0* T25f38(T0* C);
/* GEANT_PROJECT_VARIABLES.exe_name */
extern unsigned char ge59os1836;
extern T0* ge59ov1836;
extern T0* T25f37(T0* C);
/* GEANT_PROJECT_VARIABLES.path_separator_name */
extern unsigned char ge59os1835;
extern T0* ge59ov1835;
extern T0* T25f34(T0* C);
/* GEANT_PROJECT_VARIABLES.is_unix_name */
extern unsigned char ge59os1834;
extern T0* ge59ov1834;
extern T0* T25f31(T0* C);
/* GEANT_PROJECT_VARIABLES.is_windows_name */
extern unsigned char ge59os1833;
extern T0* ge59ov1833;
extern T0* T25f28(T0* C);
/* GEANT_VARIABLES.value */
extern T0* T29f31(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.default_builtin_variables */
extern unsigned char ge61os1709;
extern T0* ge61ov1709;
extern T0* T25f25(T0* C);
/* GEANT_PROJECT_VARIABLES.file_system */
extern T0* T25f40(T0* C);
/* GEANT_PROJECT_VARIABLES.unix_file_system */
extern T0* T25f43(T0* C);
/* GEANT_PROJECT_VARIABLES.windows_file_system */
extern T0* T25f42(T0* C);
/* GEANT_PROJECT_VARIABLES.operating_system */
extern T0* T25f39(T0* C);
/* GEANT_PROJECT_VARIABLES.gobo_os_name */
extern unsigned char ge59os1832;
extern T0* ge59ov1832;
extern T0* T25f24(T0* C);
/* GEANT_PROJECT_VARIABLES.project_variables_resolver */
extern T0* T25f23(T0* C);
/* GEANT_PROJECT_VARIABLES.make */
extern void T25f58p1(T0* C);
/* GEANT_PROJECT_VARIABLES.set_key_equality_tester */
extern void T25f61(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.make_map */
extern void T25f60(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_with_equality_testers */
extern void T25f63(T0* C, T6 a1, T0* a2, T0* a3);
/* GEANT_PROJECT_VARIABLES.make_sparse_container */
extern void T25f71(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_slots */
extern void T25f79(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_clashes */
extern void T25f78(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_key_storage */
extern void T25f77(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_item_storage */
extern void T25f76(T0* C, T6 a1);
/* GEANT_VARIABLES.set_variable_value */
extern void T29f46(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.force */
extern void T29f47(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.key_storage_put */
extern void T29f56(T0* C, T0* a1, T6 a2);
/* GEANT_VARIABLES.slots_put */
extern void T29f55(T0* C, T6 a1, T6 a2);
/* GEANT_VARIABLES.clashes_put */
extern void T29f54(T0* C, T6 a1, T6 a2);
/* GEANT_VARIABLES.resize */
extern void T29f53(T0* C, T6 a1);
/* GEANT_VARIABLES.clashes_resize */
extern void T29f61(T0* C, T6 a1);
/* GEANT_VARIABLES.key_storage_resize */
extern void T29f60(T0* C, T6 a1);
/* GEANT_VARIABLES.item_storage_resize */
extern void T29f59(T0* C, T6 a1);
/* GEANT_VARIABLES.slots_resize */
extern void T29f58(T0* C, T6 a1);
/* GEANT_VARIABLES.new_capacity */
extern T6 T29f23(T0* C, T6 a1);
/* GEANT_VARIABLES.item_storage_put */
extern void T29f52(T0* C, T0* a1, T6 a2);
/* GEANT.default_builtin_variables */
extern T0* T21f9(T0* C);
/* GEANT.file_system */
extern T0* T21f17(T0* C);
/* GEANT.unix_file_system */
extern T0* T21f19(T0* C);
/* GEANT.windows_file_system */
extern T0* T21f18(T0* C);
/* GEANT.operating_system */
extern T0* T21f16(T0* C);
/* GEANT.read_command_line */
extern void T21f21(T0* C);
/* DS_ARRAYED_LIST [STRING_8].first */
extern T0* T71f17(T0* C);
/* GEANT.commandline_variables */
extern T0* T21f12(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].forth */
extern void T72f9(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_forth */
extern void T71f31(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].add_traversing_cursor */
extern void T71f35(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T72f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].remove_traversing_cursor */
extern void T71f36(T0* C, T0* a1);
/* AP_PARSER.final_error_action */
extern void T38f29(T0* C);
/* AP_PARSER.exceptions */
extern T0* T38f13(T0* C);
/* AP_ERROR_HANDLER.report_error_message */
extern void T45f9(T0* C, T0* a1);
/* AP_ERROR_HANDLER.report_error_message */
extern void T45f9p1(T0* C, T0* a1);
/* AP_ERROR_HANDLER.report_error */
extern void T45f8(T0* C, T0* a1);
/* AP_ERROR_HANDLER.message */
extern T0* T45f6(T0* C, T0* a1);
/* AP_ERROR.default_message */
extern T0* T40f16(T0* C);
/* AP_ERROR.message */
extern T0* T40f17(T0* C, T0* a1);
/* AP_ERROR.arguments */
extern unsigned char ge220os1728;
extern T0* ge220ov1728;
extern T0* T40f19(T0* C);
/* KL_ARGUMENTS.make */
extern T0* T27c4(void);
/* KL_ARGUMENTS.argument */
extern T0* T27f2(T0* C, T6 a1);
/* ARRAY [STRING_8].valid_index */
extern T1 T33f5(T0* C, T6 a1);
/* AP_ERROR.string_ */
extern T0* T40f18(T0* C);
/* AP_ERROR.make_invalid_parameter_error */
extern T0* T40c20(T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.force */
extern void T34f47(T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].item */
extern T0* T72f5(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_item */
extern T0* T71f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].after */
extern T1 T72f6(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_after */
extern T1 T71f10(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].start */
extern void T72f8(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_start */
extern void T71f30(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].is_empty */
extern T1 T71f20(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].off */
extern T1 T72f4(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_off */
extern T1 T71f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].cursor_before */
extern T1 T71f15(T0* C, T0* a1);
/* GEANT.set_show_target_info */
extern void T21f27(T0* C, T1 a1);
/* AP_STRING_OPTION.parameter */
extern T0* T37f15(T0* C);
/* DS_ARRAYED_LIST [STRING_8].last */
extern T0* T71f8(T0* C);
/* GEANT.set_debug_mode */
extern void T21f26(T0* C, T1 a1);
/* GEANT.set_no_exec */
extern void T21f25(T0* C, T1 a1);
/* GEANT.set_verbose */
extern void T21f24(T0* C, T1 a1);
/* GEANT.report_version_number */
extern void T21f23(T0* C);
/* UT_ERROR_HANDLER.report_info */
extern void T28f8(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_info_message */
extern void T28f9(T0* C, T0* a1);
/* UT_VERSION_NUMBER.make */
extern T0* T49c7(T0* a1);
/* AP_PARSER.parse_arguments */
extern void T38f28(T0* C);
/* AP_PARSER.parse_list */
extern void T38f31(T0* C, T0* a1);
/* AP_PARSER.check_options_after_parsing */
extern void T38f34(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.forth */
extern void T36f16(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_forth */
extern void T36f18(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.add_traversing_cursor */
extern void T36f19(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [AP_OPTION].set_next_cursor */
extern void T69f8(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.remove_traversing_cursor */
extern void T36f20(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [AP_OPTION].set */
extern void T69f7(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_ARRAYED_LIST [AP_OPTION].forth */
extern void T74f23(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_forth */
extern void T74f26(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].set_position */
extern void T105f6(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].add_traversing_cursor */
extern void T74f27(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].set_next_cursor */
extern void T105f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].remove_traversing_cursor */
extern void T74f28(T0* C, T0* a1);
/* AP_ERROR.make_surplus_option_error */
extern T0* T40c22(T0* a1);
/* AP_ERROR.make_missing_option_error */
extern T0* T40c21(T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.item_for_iteration */
extern T0* T36f6(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_item */
extern T0* T36f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].item_for_iteration */
extern T0* T74f7(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_item */
extern T0* T74f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].item */
extern T0* T74f11(T0* C, T6 a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.after */
extern T1 T36f5(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_after */
extern T1 T36f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].after */
extern T1 T74f9(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_after */
extern T1 T74f12(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.start */
extern void T36f15(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_start */
extern void T36f17(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_off */
extern T1 T36f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].start */
extern void T74f22(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_start */
extern void T74f25(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].is_empty */
extern T1 T74f17(T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].off */
extern T1 T105f4(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_off */
extern T1 T74f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_before */
extern T1 T74f19(T0* C, T0* a1);
/* AP_PARSER.parse_argument */
extern void T38f33(T0* C);
/* AP_PARSER.parse_short */
extern void T38f36(T0* C);
/* AP_ERROR.make_missing_parameter_error */
extern T0* T40c24(T0* a1);
/* DS_ARRAYED_LIST [STRING_8].off */
extern T1 T71f7(T0* C);
/* AP_ERROR.make_unknown_option_error */
extern T0* T40c23(T0* a1);
/* CHARACTER_8.out */
extern T0* T2f1(T2* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].forth */
extern void T75f21(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_forth */
extern void T75f24(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].set_position */
extern void T109f6(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].add_traversing_cursor */
extern void T75f25(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].set_next_cursor */
extern void T109f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].remove_traversing_cursor */
extern void T75f26(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].item_for_iteration */
extern T0* T75f8(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_item */
extern T0* T75f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].item */
extern T0* T75f7(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].after */
extern T1 T75f9(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_after */
extern T1 T75f10(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].start */
extern void T75f20(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_start */
extern void T75f23(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].is_empty */
extern T1 T75f15(T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].off */
extern T1 T109f4(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_off */
extern T1 T75f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_before */
extern T1 T75f17(T0* C, T0* a1);
/* AP_PARSER.parse_long */
extern void T38f35(T0* C);
/* AP_ERROR.make_unnecessary_parameter_error */
extern T0* T40c25(T0* a1, T0* a2);
/* AP_PARSER.string_ */
extern T0* T38f23(T0* C);
/* DS_ARRAYED_LIST [STRING_8].forth */
extern void T71f26(T0* C);
/* DS_ARRAYED_LIST [STRING_8].item_for_iteration */
extern T0* T71f21(T0* C);
/* DS_ARRAYED_LIST [STRING_8].after */
extern T1 T71f16(T0* C);
/* DS_ARRAYED_LIST [STRING_8].start */
extern void T71f25(T0* C);
/* AP_PARSER.reset_parser */
extern void T38f32(T0* C);
/* AP_PARSER.all_options */
extern T0* T38f17(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].has */
extern T1 T74f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].make */
extern T0* T74c20(T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].new_cursor */
extern T0* T74f14(T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].make */
extern T0* T105c5(T0* a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].make */
extern T0* T108f1(T0* C, T6 a1);
/* TO_SPECIAL [AP_OPTION].make_area */
extern T0* T180c2(T6 a1);
/* SPECIAL [AP_OPTION].make */
extern T0* T107c4(T6 a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].default_create */
extern T0* T108c3(void);
/* AP_ERROR_HANDLER.reset */
extern void T45f10(T0* C);
/* DS_ARRAYED_LIST [STRING_8].force */
extern void T71f24(T0* C, T0* a1, T6 a2);
/* AP_PARSER.arguments */
extern T0* T38f24(T0* C);
/* AP_STRING_OPTION.make */
extern T0* T37c25(T2 a1, T0* a2);
/* AP_STRING_OPTION.set_long_form */
extern void T37f29(T0* C, T0* a1);
/* AP_STRING_OPTION.set_short_form */
extern void T37f27(T0* C, T2 a1);
/* AP_STRING_OPTION.initialize */
extern void T37f26(T0* C);
/* AP_STRING_OPTION.initialize */
extern void T37f26p1(T0* C);
/* AP_STRING_OPTION.initialize */
extern void T37f26p0(T0* C);
/* AP_FLAG.make */
extern T0* T35c20(T2 a1, T0* a2);
/* AP_FLAG.set_long_form */
extern void T35f22(T0* C, T0* a1);
/* AP_FLAG.set_short_form */
extern void T35f24(T0* C, T2 a1);
/* AP_FLAG.initialize */
extern void T35f21(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].force_last */
extern void T75f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].resize */
extern void T75f22(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].resize */
extern T0* T111f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].resized_area */
extern T0* T110f3(T0* C, T6 a1);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].copy_data */
extern void T110f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].move_data */
extern void T110f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].overlapping_move */
extern void T110f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].non_overlapping_move */
extern void T110f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T110c4(T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].new_capacity */
extern T6 T75f14(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].extendible */
extern T1 T75f12(T0* C, T6 a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.make */
extern T0* T36c11(T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.old_make */
extern void T36f14(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.new_cursor */
extern T0* T36f10(T0* C);
/* DS_LINKED_LIST_CURSOR [AP_OPTION].make */
extern T0* T69c6(T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.set_parameters_description */
extern void T36f13(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.set_introduction_option */
extern void T36f12(T0* C, T0* a1);
/* AP_FLAG.set_description */
extern void T35f19(T0* C, T0* a1);
/* AP_FLAG.make_with_long_form */
extern T0* T35c18(T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].force_last */
extern void T74f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].resize */
extern void T74f24(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].resize */
extern T0* T108f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [AP_OPTION].resized_area */
extern T0* T107f3(T0* C, T6 a1);
/* SPECIAL [AP_OPTION].copy_data */
extern void T107f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [AP_OPTION].move_data */
extern void T107f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [AP_OPTION].overlapping_move */
extern void T107f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [AP_OPTION].non_overlapping_move */
extern void T107f8(T0* C, T6 a1, T6 a2, T6 a3);
/* DS_ARRAYED_LIST [AP_OPTION].new_capacity */
extern T6 T74f16(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].extendible */
extern T1 T74f15(T0* C, T6 a1);
/* AP_STRING_OPTION.set_parameter_description */
extern void T37f24(T0* C, T0* a1);
/* AP_STRING_OPTION.set_description */
extern void T37f23(T0* C, T0* a1);
/* AP_STRING_OPTION.make_with_short_form */
extern T0* T37c22(T2 a1);
/* AP_PARSER.set_parameters_description */
extern void T38f27(T0* C, T0* a1);
/* AP_PARSER.set_application_description */
extern void T38f26(T0* C, T0* a1);
/* AP_PARSER.make */
extern T0* T38c25(void);
/* AP_DISPLAY_HELP_FLAG.set_description */
extern void T73f37(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.make */
extern T0* T73c36(T2 a1, T0* a2);
/* AP_DISPLAY_HELP_FLAG.set_long_form */
extern void T73f40(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.set_short_form */
extern void T73f39(T0* C, T2 a1);
/* AP_DISPLAY_HELP_FLAG.initialize */
extern void T73f38(T0* C);
/* AP_PARSER.make_empty */
extern void T38f30(T0* C);
/* AP_ERROR_HANDLER.make_standard */
extern T0* T45c7(void);
/* AP_ERROR_HANDLER.std */
extern T0* T45f5(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T75c18(T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].new_cursor */
extern T0* T75f11(T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T109c5(T0* a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T111f1(T0* C, T6 a1);
/* TO_SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].make_area */
extern T0* T181c2(T6 a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].default_create */
extern T0* T111c3(void);
/* UT_ERROR_HANDLER.make_standard */
extern T0* T28c7(void);
/* UT_ERROR_HANDLER.std */
extern T0* T28f4(T0* C);
/* KL_ARGUMENTS.set_program_name */
extern void T27f5(T0* C, T0* a1);
/* GEANT.arguments */
extern T0* T21f10(T0* C);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].record */
extern void T520f5(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.put */
extern void T492f12(T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.put */
extern void T492f12p1(T0* C, T6 a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].record */
extern void T518f4(T0* C, T0* a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].record */
extern void T516f5(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.add */
extern void T492f11(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.add */
extern void T492f11p1(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.execute */
extern void T306f31(T0* C);
/* GEANT_REPLACE_COMMAND.execute */
extern void T390f38(T0* C);
/* GEANT_FILESET.forth */
extern void T362f37(T0* C);
/* GEANT_FILESET.update_project_variables */
extern void T362f55(T0* C);
/* GEANT_FILESET.remove_project_variables */
extern void T362f51(T0* C);
/* GEANT_PROJECT_VARIABLES.remove */
extern void T25f85(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.remove_position */
extern void T25f89(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.move_cursors_forth */
extern void T25f91(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.move_all_cursors */
extern void T25f93(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].set_position */
extern void T64f10(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.move_cursors_after */
extern void T25f92(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].set_next_cursor */
extern void T64f11(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.internal_set_key_equality_tester */
extern void T25f90(T0* C, T0* a1);
/* GEANT_FILESET.off */
extern T1 T362f24(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].off */
extern T1 T410f29(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_off */
extern T1 T410f18(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].forth */
extern void T410f41(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_forth */
extern void T410f46(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].add_traversing_cursor */
extern void T410f59(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].set_next_cursor */
extern void T434f6(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].remove_traversing_cursor */
extern void T410f58(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].set_position */
extern void T434f5(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].clashes_item */
extern T6 T410f26(T0* C, T6 a1);
/* GEANT_REPLACE_COMMAND.create_directory_for_pathname */
extern void T390f41(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.recursive_create_directory */
extern void T53f42(T0* C, T0* a1);
/* KL_DIRECTORY.recursive_create_directory */
extern void T354f47(T0* C);
/* KL_UNIX_FILE_SYSTEM.canonical_pathname */
extern T0* T54f28(T0* C, T0* a1);
/* KL_PATHNAME.set_canonical */
extern void T85f18(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.canonical_pathname */
extern T0* T53f34(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.string_to_pathname */
extern T0* T53f35(T0* C, T0* a1);
/* KL_PATHNAME.set_drive */
extern void T85f21(T0* C, T0* a1);
/* KL_PATHNAME.set_sharename */
extern void T85f20(T0* C, T0* a1);
/* KL_PATHNAME.set_hostname */
extern void T85f19(T0* C, T0* a1);
/* KL_DIRECTORY.file_system */
extern T0* T354f26(T0* C);
/* KL_DIRECTORY.unix_file_system */
extern T0* T354f30(T0* C);
/* KL_DIRECTORY.windows_file_system */
extern T0* T354f29(T0* C);
/* KL_DIRECTORY.operating_system */
extern T0* T354f28(T0* C);
/* KL_DIRECTORY.create_directory */
extern void T354f50(T0* C);
/* KL_DIRECTORY.create_dir */
extern void T354f53(T0* C);
/* KL_DIRECTORY.file_mkdir */
extern void T354f54(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.recursive_create_directory */
extern void T54f38(T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.file_system */
extern T0* T390f19(T0* C);
/* GEANT_REPLACE_COMMAND.windows_file_system */
extern T0* T390f26(T0* C);
/* GEANT_REPLACE_COMMAND.operating_system */
extern T0* T390f25(T0* C);
/* GEANT_FILESET.item_mapped_filename */
extern T0* T362f23(T0* C);
/* GEANT_FILESET_ENTRY.mapped_filename_converted */
extern T0* T416f8(T0* C);
/* GEANT_FILESET_ENTRY.unix_file_system */
extern T0* T416f10(T0* C);
/* GEANT_FILESET_ENTRY.file_system */
extern T0* T416f9(T0* C);
/* GEANT_FILESET_ENTRY.windows_file_system */
extern T0* T416f12(T0* C);
/* GEANT_FILESET_ENTRY.operating_system */
extern T0* T416f11(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_for_iteration */
extern T0* T410f23(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_item */
extern T0* T410f36(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_storage_item */
extern T0* T410f21(T0* C, T6 a1);
/* GEANT_FILESET.item_filename */
extern T0* T362f22(T0* C);
/* GEANT_FILESET_ENTRY.filename_converted */
extern T0* T416f7(T0* C);
/* GEANT_REPLACE_COMMAND.unix_file_system */
extern T0* T390f18(T0* C);
/* GEANT_FILESET.is_in_gobo_31_format */
extern T1 T362f20(T0* C);
/* GEANT_FILESET.after */
extern T1 T362f27(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].after */
extern T1 T410f30(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_after */
extern T1 T410f34(T0* C, T0* a1);
/* GEANT_FILESET.start */
extern void T362f36(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].start */
extern void T410f40(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_start */
extern void T410f45(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].is_empty */
extern T1 T410f25(T0* C);
/* GEANT_FILESET.execute */
extern void T362f35(T0* C);
/* GEANT_FILESET.remove_fileset_entry */
extern void T362f54(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].remove */
extern void T410f43(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].remove_position */
extern void T410f53(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_storage_put */
extern void T410f66(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_storage_put */
extern void T410f49(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].clashes_put */
extern void T410f51(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].slots_put */
extern void T410f52(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].move_cursors_forth */
extern void T410f65(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].move_all_cursors */
extern void T410f68(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].move_cursors_after */
extern void T410f67(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].internal_set_key_equality_tester */
extern void T410f64(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_equality_tester */
extern T0* T410f31(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].slots_item */
extern T6 T410f19(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].hash_position */
extern T6 T410f17(T0* C, T0* a1);
/* GEANT_FILESET_ENTRY.hash_code */
extern T6 T416f3(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_storage_item */
extern T0* T410f32(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].search_position */
extern void T410f48(T0* C, T0* a1);
/* KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY].test */
extern T1 T436f1(T0* C, T0* a1, T0* a2);
/* KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY].any_ */
extern T0* T436f2(T0* C);
/* GEANT_FILESET_ENTRY.make */
extern T0* T416c13(T0* a1, T0* a2);
/* DS_HASH_SET_CURSOR [STRING_8].forth */
extern void T414f8(T0* C);
/* DS_HASH_SET [STRING_8].cursor_forth */
extern void T412f53(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].add_traversing_cursor */
extern void T412f55(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_next_cursor */
extern void T414f10(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].remove_traversing_cursor */
extern void T412f54(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_position */
extern void T414f9(T0* C, T6 a1);
/* GEANT_FILESET.add_fileset_entry_if_necessary */
extern void T362f53(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].force_last */
extern void T410f42(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].resize */
extern void T410f50(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].clashes_resize */
extern void T410f63(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_storage_resize */
extern void T410f62(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_storage_resize */
extern void T410f61(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].resize */
extern T0* T437f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_FILESET_ENTRY].resized_area */
extern T0* T435f3(T0* C, T6 a1);
/* SPECIAL [GEANT_FILESET_ENTRY].copy_data */
extern void T435f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [GEANT_FILESET_ENTRY].move_data */
extern void T435f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_FILESET_ENTRY].overlapping_move */
extern void T435f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [GEANT_FILESET_ENTRY].non_overlapping_move */
extern void T435f8(T0* C, T6 a1, T6 a2, T6 a3);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].slots_resize */
extern void T410f60(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].new_capacity */
extern T6 T410f38(T0* C, T6 a1);
/* GEANT_FILESET.is_file_outofdate */
extern T1 T362f29(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.file_time_stamp */
extern T6 T53f32(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.time_stamp */
extern T6 T55f40(T0* C);
/* KL_TEXT_INPUT_FILE.date */
extern T6 T55f42(T0* C);
/* UNIX_FILE_INFO.date */
extern T6 T86f8(T0* C);
/* KL_UNIX_FILE_SYSTEM.file_time_stamp */
extern T6 T54f30(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.file_exists */
extern T1 T53f29(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.exists */
extern T1 T55f39(T0* C);
/* KL_UNIX_FILE_SYSTEM.file_exists */
extern T1 T54f26(T0* C, T0* a1);
/* GEANT_MAP.mapped_filename */
extern T0* T407f10(T0* C, T0* a1);
/* UC_UTF8_STRING.remove_tail */
extern void T195f84(T0* C, T6 a1);
/* STRING_8.remove_tail */
extern void T17f58(T0* C, T6 a1);
/* UC_UTF8_STRING.remove_head */
extern void T195f83(T0* C, T6 a1);
/* STRING_8.remove_head */
extern void T17f57(T0* C, T6 a1);
/* GEANT_MAP.glob_postfix */
extern T0* T407f16(T0* C, T0* a1);
/* GEANT_MAP.glob_prefix */
extern T0* T407f15(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.replace_all */
extern T0* T425f54(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_replace_all_to_string */
extern void T425f303(T0* C, T0* a1, T0* a2);
/* RX_PCRE_REGULAR_EXPRESSION.match_substring */
extern void T425f315(T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_it */
extern void T425f328(T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_start */
extern T1 T425f149(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_internal */
extern T6 T425f231(T0* C, T6 a1, T1 a2, T1 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_type */
extern T6 T425f295(T0* C, T6 a1, T6 a2, T6 a3, T1 a4);
/* RX_PCRE_REGULAR_EXPRESSION.match_not_repeated_characters */
extern T6 T425f294(T0* C, T6 a1, T6 a2, T6 a3, T1 a4);
/* RX_PCRE_REGULAR_EXPRESSION.infinity */
extern unsigned char ge494os10281;
extern T6 ge494ov10281;
extern T6 T425f60(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.platform */
extern T0* T425f193(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_characters */
extern T6 T425f293(T0* C, T6 a1, T6 a2, T6 a3, T1 a4);
/* RX_BYTE_CODE.character_item */
extern T6 T446f8(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_classes */
extern T6 T425f292(T0* C, T6 a1);
/* RX_BYTE_CODE.character_set_has */
extern T1 T446f10(T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_refs */
extern T6 T425f291(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_ref */
extern T6 T425f297(T0* C, T6 a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.space_set */
extern unsigned char ge500os10448;
extern T0* ge500ov10448;
extern T0* T425f150(T0* C);
/* RX_CHARACTER_SET.make */
extern T0* T448c4(T0* a1);
/* RX_CHARACTER_SET.add_string */
extern void T448f10(T0* C, T0* a1);
/* RX_CHARACTER_SET.add_character */
extern void T448f9(T0* C, T6 a1);
/* RX_CHARACTER_SET.make_empty */
extern void T448f5(T0* C);
/* RX_CHARACTER_SET.make_empty */
extern T0* T448c5(void);
/* RX_CHARACTER_SET.special_boolean_ */
extern unsigned char ge172os2087;
extern T0* ge172ov2087;
extern T0* T448f3(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.digit_set */
extern unsigned char ge500os10440;
extern T0* ge500ov10440;
extern T0* T425f166(T0* C);
/* RX_CHARACTER_SET.has */
extern T1 T448f2(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_ims_options */
extern void T425f326(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_dotall */
extern T1 T425f84(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_multiline */
extern T1 T425f83(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_caseless */
extern T1 T425f82(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_match_count */
extern void T425f335(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_next_start */
extern void T425f334(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_recursive */
extern T6 T425f290(T0* C, T6 a1, T1 a2, T1 a3);
/* RX_BYTE_CODE.integer_item */
extern T6 T446f11(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.next_matching_alternate */
extern T6 T425f288(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_additional_bracket */
extern T6 T425f269(T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.opcode_item */
extern T6 T446f7(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.special_integer_ */
extern T0* T425f56(T0* C);
/* RX_CASE_MAPPING.flip_case */
extern T6 T447f4(T0* C, T6 a1);
/* RX_CASE_MAPPING.to_lower */
extern T6 T447f3(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.captured_end_position */
extern T6 T425f53(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_replacement_to_string */
extern void T425f316(T0* C, T0* a1, T0* a2);
/* RX_PCRE_REGULAR_EXPRESSION.append_captured_substring_to_string */
extern void T425f329(T0* C, T0* a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.captured_start_position */
extern T6 T425f52(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.string_ */
extern T0* T425f58(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.has_matched */
extern T1 T425f229(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.match */
extern void T425f302(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_compiled */
extern T1 T425f230(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.compile */
extern void T425f299(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.compile */
extern void T425f299p1(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_startline */
extern void T425f314(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.has_startline */
extern T1 T425f228(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.first_significant_code */
extern T6 T425f188(T0* C, T6 a1, T6 a2, T1 a3);
/* RX_PCRE_REGULAR_EXPRESSION.find_firstchar */
extern T6 T425f227(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_anchored */
extern void T425f313(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.can_anchored */
extern T1 T425f226(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.ims_options */
extern T6 T425f81(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_option_dotall */
extern T6 T425f130(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_option_multiline */
extern T6 T425f128(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_option_caseless */
extern T6 T425f126(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.compile_regexp */
extern void T425f312(T0* C, T6 a1, T1 a2, T1 a3, T6 a4);
/* RX_BYTE_CODE.set_count */
extern void T446f18(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.find_fixed_code_length */
extern T6 T425f65(T0* C, T6 a1);
/* RX_BYTE_CODE.put_integer */
extern void T446f17(T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.compile_branch */
extern void T425f327(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.meta_set */
extern unsigned char ge500os10449;
extern T0* ge500ov10449;
extern T0* T425f146(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.maxlit */
extern unsigned char ge494os10282;
extern T6 ge494ov10282;
extern T6 T425f145(T0* C);
/* RX_BYTE_CODE.append_character */
extern void T446f19(T0* C, T6 a1);
/* RX_BYTE_CODE.put_character */
extern void T446f25(T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.resize_byte_code */
extern void T446f24(T0* C, T6 a1);
/* RX_BYTE_CODE.special_integer_ */
extern T0* T446f9(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.scan_escape */
extern T6 T425f140(T0* C, T6 a1, T1 a2);
/* RX_PCRE_REGULAR_EXPRESSION.scan_hex_number */
extern T6 T425f221(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.xdigit_set */
extern unsigned char ge500os10442;
extern T0* ge500ov10442;
extern T0* T425f243(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.scan_octal_number */
extern T6 T425f220(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.escape_character */
extern T6 T425f216(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.to_option_ims */
extern T6 T425f133(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_ichanged */
extern void T425f325(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.unset_option_dotall */
extern T6 T425f131(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.unset_option_multiline */
extern T6 T425f129(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.unset_option_caseless */
extern T6 T425f127(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.scan_decimal_number */
extern T6 T425f108(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.compile_repeats */
extern void T425f332(T0* C, T6 a1, T6 a2, T6 a3, T6 a4, T6 a5);
/* RX_BYTE_CODE.append_subcopy */
extern void T446f23(T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.put_opcode */
extern void T446f22(T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.move_right */
extern void T446f21(T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.compile_single_repeat */
extern void T425f333(T0* C, T6 a1, T6 a2, T6 a3, T6 a4, T6 a5, T6 a6);
/* RX_PCRE_REGULAR_EXPRESSION.compile_character_class */
extern void T425f331(T0* C);
/* RX_BYTE_CODE.append_character_set */
extern void T446f20(T0* C, T0* a1, T1 a2);
/* RX_BYTE_CODE.resize_character_sets */
extern void T446f26(T0* C, T6 a1);
/* RX_BYTE_CODE.special_boolean_ */
extern T0* T446f12(T0* C);
/* RX_CHARACTER_SET.add_set */
extern void T448f8(T0* C, T0* a1);
/* RX_CHARACTER_SET.add_negated_set */
extern void T448f7(T0* C, T0* a1);
/* ARRAY [RX_CHARACTER_SET].item */
extern T0* T451f4(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.class_sets */
extern unsigned char ge500os10451;
extern T0* ge500ov10451;
extern T0* T425f158(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.default_word_set */
extern unsigned char ge500os10436;
extern T0* ge500ov10436;
extern T0* T425f147(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.punct_set */
extern unsigned char ge500os10446;
extern T0* ge500ov10446;
extern T0* T425f242(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.print_set */
extern unsigned char ge500os10445;
extern T0* ge500ov10445;
extern T0* T425f241(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.graph_set */
extern unsigned char ge500os10444;
extern T0* ge500ov10444;
extern T0* T425f240(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.cntrl_set */
extern unsigned char ge500os10443;
extern T0* ge500ov10443;
extern T0* T425f239(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.ascii_set */
extern unsigned char ge500os10447;
extern T0* ge500ov10447;
extern T0* T425f238(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.alnum_set */
extern unsigned char ge500os10441;
extern T0* ge500ov10441;
extern T0* T425f237(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.upper_set */
extern unsigned char ge500os10437;
extern T0* ge500ov10437;
extern T0* T425f236(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.lower_set */
extern unsigned char ge500os10438;
extern T0* ge500ov10438;
extern T0* T425f235(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.alpha_set */
extern unsigned char ge500os10439;
extern T0* ge500ov10439;
extern T0* T425f233(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.check_posix_name */
extern T6 T425f156(T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.class_names */
extern unsigned char ge500os10450;
extern T0* ge500ov10450;
extern T0* T425f234(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.check_posix_syntax */
extern T6 T425f154(T0* C, T6 a1);
/* RX_CHARACTER_SET.wipe_out */
extern void T448f6(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.actual_set */
extern unsigned char ge494os10280;
extern T0* ge494ov10280;
extern T0* T425f151(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.compile_counted_repeats */
extern T1 T425f86(T0* C, T6 a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.scan_comment */
extern void T425f330(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_undef */
extern T1 T425f62(T0* C, T6 a1);
/* RX_BYTE_CODE.append_integer */
extern void T446f16(T0* C, T6 a1);
/* RX_BYTE_CODE.append_opcode */
extern void T446f15(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_error */
extern void T425f311(T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.set_default_internal_options */
extern void T425f310(T0* C);
/* RX_BYTE_CODE.wipe_out */
extern void T446f14(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.wipe_out */
extern void T425f309(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.wipe_out */
extern void T425f309p1(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.make */
extern T0* T425c298(void);
/* RX_PCRE_REGULAR_EXPRESSION.make */
extern void T425f298p1(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_default_options */
extern void T425f308(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_strict */
extern void T425f324(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_greedy */
extern void T425f323(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_eol */
extern void T425f322(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_bol */
extern void T425f321(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_dollar_endonly */
extern void T425f320(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_empty_allowed */
extern void T425f319(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_extended */
extern void T425f318(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_dotall */
extern void T425f317(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_multiline */
extern void T425f301(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_caseless */
extern void T425f300(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_word_set */
extern void T425f307(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_character_case_mapping */
extern void T425f306(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.default_character_case_mapping */
extern unsigned char ge500os10435;
extern T0* ge500ov10435;
extern T0* T425f75(T0* C);
/* RX_CASE_MAPPING.make */
extern T0* T447c6(T0* a1, T0* a2);
/* RX_CASE_MAPPING.add */
extern void T447f8(T0* C, T0* a1, T0* a2);
/* RX_CASE_MAPPING.make_default */
extern void T447f7(T0* C);
/* RX_CASE_MAPPING.clear */
extern void T447f9(T0* C);
/* RX_CASE_MAPPING.special_integer_ */
extern T0* T447f5(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.reset */
extern void T425f305(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.reset */
extern void T425f305p1(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.empty_pattern */
extern unsigned char ge494os10279;
extern T0* ge494ov10279;
extern T0* T425f74(T0* C);
/* RX_BYTE_CODE.make */
extern T0* T446c13(T6 a1);
/* GEANT_MAP.type_attribute_value_regexp */
extern unsigned char ge137os9696;
extern T0* ge137ov9696;
extern T0* T407f8(T0* C);
/* GEANT_MAP.type_attribute_value_merge */
extern unsigned char ge137os9694;
extern T0* ge137ov9694;
extern T0* T407f7(T0* C);
/* GEANT_MAP.unix_file_system */
extern T0* T407f14(T0* C);
/* GEANT_MAP.type_attribute_value_flat */
extern unsigned char ge137os9693;
extern T0* ge137ov9693;
extern T0* T407f6(T0* C);
/* GEANT_MAP.string_ */
extern T0* T407f12(T0* C);
/* GEANT_MAP.is_executable */
extern T1 T407f11(T0* C);
/* GEANT_MAP.type_attribute_value_glob */
extern unsigned char ge137os9695;
extern T0* ge137ov9695;
extern T0* T407f9(T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].item */
extern T0* T414f4(T0* C);
/* DS_HASH_SET [STRING_8].cursor_item */
extern T0* T412f28(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].after */
extern T1 T414f5(T0* C);
/* DS_HASH_SET [STRING_8].cursor_after */
extern T1 T412f27(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].start */
extern void T414f7(T0* C);
/* DS_HASH_SET [STRING_8].cursor_start */
extern void T412f52(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].cursor_off */
extern T1 T412f34(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].is_empty */
extern T1 T412f33(T0* C);
/* GEANT_FILESET.scan_internal */
extern void T362f52(T0* C, T0* a1);
/* KL_DIRECTORY.close */
extern void T354f40(T0* C);
/* KL_DIRECTORY.old_close */
extern void T354f43(T0* C);
/* KL_DIRECTORY.default_pointer */
extern T14 T354f22(T0* C);
/* KL_DIRECTORY.dir_close */
extern void T354f44(T0* C, T14 a1);
/* LX_DFA_WILDCARD.recognizes */
extern T1 T415f12(T0* C, T0* a1);
/* LX_DFA_WILDCARD.longest_end_position */
extern T6 T415f10(T0* C, T0* a1, T6 a2);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_readable */
extern T1 T53f31(T0* C, T0* a1);
/* KL_DIRECTORY.is_readable */
extern T1 T354f24(T0* C);
/* KL_DIRECTORY.old_is_readable */
extern T1 T354f14(T0* C);
/* KL_DIRECTORY.eif_dir_is_readable */
extern T1 T354f25(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.is_directory_readable */
extern T1 T54f29(T0* C, T0* a1);
/* GEANT_FILESET.string_ */
extern T0* T362f28(T0* C);
/* KL_DIRECTORY.read_entry */
extern void T354f39(T0* C);
/* KL_DIRECTORY.readentry */
extern void T354f42(T0* C);
/* KL_DIRECTORY.dir_next */
extern T0* T354f21(T0* C, T14 a1);
/* KL_DIRECTORY.old_end_of_input */
extern T1 T354f17(T0* C);
/* KL_DIRECTORY.is_open_read */
extern T1 T354f9(T0* C);
/* KL_DIRECTORY.is_closed */
extern T1 T354f12(T0* C);
/* KL_DIRECTORY.open_read */
extern void T354f38(T0* C);
/* KL_DIRECTORY.old_open_read */
extern void T354f41(T0* C);
/* KL_DIRECTORY.dir_open */
extern T14 T354f19(T0* C, T14 a1);
/* GEANT_FILESET.unix_file_system */
extern T0* T362f21(T0* C);
/* GEANT_FILESET.file_system */
extern T0* T362f19(T0* C);
/* GEANT_FILESET.windows_file_system */
extern T0* T362f32(T0* C);
/* GEANT_FILESET.operating_system */
extern T0* T362f31(T0* C);
/* GEANT_FILESET.is_executable */
extern T1 T362f26(T0* C);
/* GEANT_FILESET.is_in_gobo_32_format */
extern T1 T362f25(T0* C);
/* GEANT_REPLACE_COMMAND.execute_replace */
extern void T390f40(T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_COMMAND.execute_replace_token */
extern void T390f44(T0* C, T0* a1, T0* a2);
/* KL_TEXT_OUTPUT_FILE.close */
extern void T421f24(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_close */
extern void T421f31(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_close */
extern void T421f33(T0* C, T14 a1);
/* KL_TEXT_OUTPUT_FILE.put_string */
extern void T421f26(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_put_string */
extern void T421f32(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_ps */
extern void T421f34(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_TEXT_OUTPUT_FILE.string_ */
extern T0* T421f9(T0* C);
/* KL_STRING_ROUTINES.replaced_first_substring */
extern T0* T76f16(T0* C, T0* a1, T0* a2, T0* a3);
/* KL_STRING_ROUTINES.substring_index */
extern T6 T76f17(T0* C, T0* a1, T0* a2, T6 a3);
/* KL_STRING_ROUTINES.platform */
extern T0* T76f18(T0* C);
/* STRING_8.substring_index */
extern T6 T17f31(T0* C, T0* a1, T6 a2);
/* STRING_SEARCHER.substring_index */
extern T6 T498f2(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* STRING_SEARCHER.substring_index_with_deltas */
extern T6 T498f3(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* NATURAL_32.to_integer_32 */
extern T6 T10f9(T10* C);
/* STRING_SEARCHER.internal_initialize_deltas */
extern void T498f6(T0* C, T0* a1, T6 a2, T0* a3);
/* SPECIAL [INTEGER_32].fill_with */
extern void T63f11(T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.string_searcher */
extern unsigned char ge2231os1256;
extern T0* ge2231ov1256;
extern T0* T17f32(T0* C);
/* STRING_SEARCHER.make */
extern T0* T498c5(void);
/* KL_STRING_ROUTINES.replaced_all_substrings */
extern T0* T76f15(T0* C, T0* a1, T0* a2, T0* a3);
/* GEANT_REPLACE_COMMAND.string_ */
extern T0* T390f24(T0* C);
/* UC_UTF8_STRING.has */
extern T1 T195f52(T0* C, T2 a1);
/* KL_TEXT_OUTPUT_FILE.is_open_write */
extern T1 T421f14(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
extern T1 T421f11(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T421f22(T0* C);
/* KL_TEXT_OUTPUT_FILE.is_closed */
extern T1 T421f12(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_closed */
extern T1 T421f19(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_write */
extern void T421f29(T0* C);
/* KL_TEXT_OUTPUT_FILE.default_pointer */
extern T14 T421f15(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T421f29p1(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_open */
extern T14 T421f17(T0* C, T14 a1, T6 a2);
/* KL_TEXT_OUTPUT_FILE.reset */
extern void T421f25(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.make */
extern void T421f20(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.make */
extern T0* T421c20(T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_make */
extern void T421f27(T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.tmp_output_file */
extern unsigned char ge90os9222;
extern T0* ge90ov9222;
extern T0* T390f23(T0* C);
/* KL_TEXT_INPUT_FILE.read_string */
extern void T55f67(T0* C, T6 a1);
/* KL_TEXT_INPUT_FILE.read_to_string */
extern T6 T55f32(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
extern unsigned char ge296os4103;
extern T0* ge296ov4103;
extern T0* T55f36(T0* C);
/* KL_TEXT_INPUT_FILE.any_ */
extern T0* T55f33(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_to_string */
extern T6 T55f35(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.file_gss */
extern T6 T55f37(T0* C, T14 a1, T14 a2, T6 a3);
/* SPECIAL [CHARACTER_8].item_address */
extern T14 T15f5(T0* C, T6 a1);
/* GEANT_REPLACE_COMMAND.tmp_input_file */
extern unsigned char ge90os9221;
extern T0* ge90ov9221;
extern T0* T390f21(T0* C);
/* GEANT_REPLACE_COMMAND.execute_replace_regexp */
extern void T390f43(T0* C, T0* a1, T0* a2);
/* RX_PCRE_REGULAR_EXPRESSION.replace */
extern T0* T425f55(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_replace_to_string */
extern void T425f304(T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_COMMAND.execute_replace_variable_pattern */
extern void T390f42(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.forth */
extern void T25f88(T0* C);
/* GEANT_PROJECT_VARIABLES.item_for_iteration */
extern T0* T25f57(T0* C);
/* GEANT_PROJECT_VARIABLES.key_for_iteration */
extern T0* T25f56(T0* C);
/* GEANT_PROJECT_VARIABLES.after */
extern T1 T25f55(T0* C);
/* GEANT_PROJECT_VARIABLES.start */
extern void T25f87(T0* C);
/* UC_UTF8_STRING.occurrences */
extern T6 T195f51(T0* C, T2 a1);
/* UC_UTF8_STRING.code_occurrences */
extern T6 T195f53(T0* C, T6 a1);
/* STRING_8.occurrences */
extern T6 T17f30(T0* C, T2 a1);
/* GEANT_REPLACE_COMMAND.is_file_to_file_executable */
extern T1 T390f12(T0* C);
/* GEANT_REPLACE_COMMAND.is_replace_executable */
extern T1 T390f16(T0* C);
/* GEANT_REPLACE_TASK.exit_application */
extern void T306f33(T0* C, T6 a1, T0* a2);
/* GEANT_REPLACE_TASK.exceptions */
extern T0* T306f25(T0* C);
/* GEANT_REPLACE_TASK.std */
extern T0* T306f24(T0* C);
/* GEANT_REPLACE_TASK.dir_attribute_name */
extern T0* T306f23(T0* C);
/* GEANT_REPLACE_TASK.file_system */
extern T0* T306f22(T0* C);
/* GEANT_REPLACE_TASK.unix_file_system */
extern T0* T306f29(T0* C);
/* GEANT_REPLACE_TASK.windows_file_system */
extern T0* T306f28(T0* C);
/* GEANT_REPLACE_TASK.operating_system */
extern T0* T306f27(T0* C);
/* GEANT_INPUT_TASK.execute */
extern void T305f32(T0* C);
/* GEANT_INPUT_COMMAND.execute */
extern void T389f21(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.matches */
extern T1 T425f70(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].has */
extern T1 T226f8(T0* C, T0* a1);
/* GEANT_INPUT_COMMAND.string_ */
extern T0* T389f13(T0* C);
/* KL_STDIN_FILE.read_line */
extern void T427f15(T0* C);
/* KL_STDIN_FILE.unread_character */
extern void T427f18(T0* C, T2 a1);
/* KL_LINKABLE [CHARACTER_8].put_right */
extern void T87f4(T0* C, T0* a1);
/* KL_LINKABLE [CHARACTER_8].make */
extern T0* T87c3(T2 a1);
/* KL_STDIN_FILE.read_character */
extern void T427f17(T0* C);
/* KL_STDIN_FILE.old_read_character */
extern void T427f21(T0* C);
/* KL_STDIN_FILE.console_readchar */
extern T2 T427f12(T0* C, T14 a1);
/* KL_STDIN_FILE.old_end_of_file */
extern T1 T427f9(T0* C);
/* KL_STDIN_FILE.console_eof */
extern T1 T427f13(T0* C, T14 a1);
/* GEANT_INPUT_COMMAND.input */
extern unsigned char ge206os3124;
extern T0* ge206ov3124;
extern T0* T389f12(T0* C);
/* KL_STDIN_FILE.make */
extern T0* T427c14(void);
/* KL_STDIN_FILE.make_open_stdin */
extern void T427f16(T0* C, T0* a1);
/* KL_STDIN_FILE.set_read_mode */
extern void T427f20(T0* C);
/* KL_STDIN_FILE.console_def */
extern T14 T427f8(T0* C, T6 a1);
/* KL_STDIN_FILE.old_make */
extern void T427f19(T0* C, T0* a1);
/* GEANT_INPUT_COMMAND.output */
extern T0* T389f11(T0* C);
/* DS_LINKED_LIST [STRING_8].set_equality_tester */
extern void T226f12(T0* C, T0* a1);
/* ST_SPLITTER.make_with_separators */
extern T0* T373c11(T0* a1);
/* GEANT_INPUT_TASK.exit_application */
extern void T305f34(T0* C, T6 a1, T0* a2);
/* GEANT_INPUT_TASK.exceptions */
extern T0* T305f23(T0* C);
/* GEANT_INPUT_TASK.dir_attribute_name */
extern T0* T305f21(T0* C);
/* GEANT_INPUT_TASK.file_system */
extern T0* T305f20(T0* C);
/* GEANT_INPUT_TASK.unix_file_system */
extern T0* T305f30(T0* C);
/* GEANT_INPUT_TASK.windows_file_system */
extern T0* T305f29(T0* C);
/* GEANT_INPUT_TASK.operating_system */
extern T0* T305f28(T0* C);
/* GEANT_AVAILABLE_TASK.execute */
extern void T304f26(T0* C);
/* GEANT_AVAILABLE_COMMAND.execute */
extern void T388f19(T0* C);
/* GEANT_AVAILABLE_COMMAND.unix_file_system */
extern T0* T388f11(T0* C);
/* GEANT_AVAILABLE_COMMAND.file_system */
extern T0* T388f10(T0* C);
/* GEANT_AVAILABLE_COMMAND.windows_file_system */
extern T0* T388f13(T0* C);
/* GEANT_AVAILABLE_COMMAND.operating_system */
extern T0* T388f12(T0* C);
/* GEANT_AVAILABLE_TASK.exit_application */
extern void T304f28(T0* C, T6 a1, T0* a2);
/* GEANT_AVAILABLE_TASK.exceptions */
extern T0* T304f20(T0* C);
/* GEANT_AVAILABLE_TASK.std */
extern T0* T304f19(T0* C);
/* GEANT_AVAILABLE_TASK.dir_attribute_name */
extern T0* T304f18(T0* C);
/* GEANT_AVAILABLE_TASK.file_system */
extern T0* T304f17(T0* C);
/* GEANT_AVAILABLE_TASK.unix_file_system */
extern T0* T304f24(T0* C);
/* GEANT_AVAILABLE_TASK.windows_file_system */
extern T0* T304f23(T0* C);
/* GEANT_AVAILABLE_TASK.operating_system */
extern T0* T304f22(T0* C);
/* GEANT_PRECURSOR_TASK.execute */
extern void T303f28(T0* C);
/* GEANT_PRECURSOR_COMMAND.execute */
extern void T387f9(T0* C);
/* GEANT_PRECURSOR_TASK.dir_attribute_name */
extern T0* T303f19(T0* C);
/* GEANT_PRECURSOR_TASK.file_system */
extern T0* T303f18(T0* C);
/* GEANT_PRECURSOR_TASK.unix_file_system */
extern T0* T303f26(T0* C);
/* GEANT_PRECURSOR_TASK.windows_file_system */
extern T0* T303f25(T0* C);
/* GEANT_PRECURSOR_TASK.operating_system */
extern T0* T303f24(T0* C);
/* GEANT_EXIT_TASK.execute */
extern void T302f23(T0* C);
/* GEANT_EXIT_COMMAND.execute */
extern void T386f8(T0* C);
/* GEANT_EXIT_TASK.exit_application */
extern void T302f25(T0* C, T6 a1, T0* a2);
/* GEANT_EXIT_TASK.exceptions */
extern T0* T302f17(T0* C);
/* GEANT_EXIT_TASK.std */
extern T0* T302f16(T0* C);
/* GEANT_EXIT_TASK.dir_attribute_name */
extern T0* T302f15(T0* C);
/* GEANT_EXIT_TASK.file_system */
extern T0* T302f14(T0* C);
/* GEANT_EXIT_TASK.unix_file_system */
extern T0* T302f21(T0* C);
/* GEANT_EXIT_TASK.windows_file_system */
extern T0* T302f20(T0* C);
/* GEANT_EXIT_TASK.operating_system */
extern T0* T302f19(T0* C);
/* GEANT_OUTOFDATE_TASK.execute */
extern void T301f28(T0* C);
/* GEANT_OUTOFDATE_COMMAND.execute */
extern void T385f26(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_file_outofdate */
extern T1 T385f16(T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_COMMAND.unix_file_system */
extern T0* T385f14(T0* C);
/* GEANT_OUTOFDATE_COMMAND.file_system */
extern T0* T385f13(T0* C);
/* GEANT_OUTOFDATE_COMMAND.windows_file_system */
extern T0* T385f18(T0* C);
/* GEANT_OUTOFDATE_COMMAND.operating_system */
extern T0* T385f17(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_file_executable */
extern T1 T385f15(T0* C);
/* GEANT_OUTOFDATE_TASK.exit_application */
extern void T301f30(T0* C, T6 a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.exceptions */
extern T0* T301f22(T0* C);
/* GEANT_OUTOFDATE_TASK.std */
extern T0* T301f21(T0* C);
/* GEANT_OUTOFDATE_TASK.dir_attribute_name */
extern T0* T301f20(T0* C);
/* GEANT_OUTOFDATE_TASK.file_system */
extern T0* T301f19(T0* C);
/* GEANT_OUTOFDATE_TASK.unix_file_system */
extern T0* T301f26(T0* C);
/* GEANT_OUTOFDATE_TASK.windows_file_system */
extern T0* T301f25(T0* C);
/* GEANT_OUTOFDATE_TASK.operating_system */
extern T0* T301f24(T0* C);
/* GEANT_XSLT_TASK.execute */
extern void T300f41(T0* C);
/* GEANT_XSLT_COMMAND.execute */
extern void T382f38(T0* C);
/* GEANT_XSLT_COMMAND.execute_gexslt */
extern void T382f44(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_shell */
extern void T382f45(T0* C, T0* a1);
/* DP_SHELL_COMMAND.execute */
extern void T405f13(T0* C);
/* DP_SHELL_COMMAND.operating_system */
extern T0* T405f6(T0* C);
/* DP_SHELL_COMMAND.system */
extern void T405f14(T0* C, T0* a1);
/* DP_SHELL_COMMAND.system_call */
extern T6 T405f9(T0* C, T14 a1);
/* DP_SHELL_COMMAND.default_shell */
extern unsigned char ge2350os4957;
extern T0* ge2350ov4957;
extern T0* T405f8(T0* C);
/* DP_SHELL_COMMAND.get */
extern T0* T405f10(T0* C, T0* a1);
/* DP_SHELL_COMMAND.eif_getenv */
extern T14 T405f11(T0* C, T14 a1);
/* DP_SHELL_COMMAND.make */
extern T0* T405c12(T0* a1);
/* DP_SHELL_COMMAND.string_ */
extern T0* T405f7(T0* C);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].item */
extern T0* T384f6(T0* C, T6 a1);
/* GEANT_XSLT_COMMAND.string_ */
extern T0* T382f22(T0* C);
/* GEANT_XSLT_COMMAND.execute_xsltproc */
extern void T382f43(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_xalan_java */
extern void T382f42(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_xalan_cpp */
extern void T382f41(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.is_file_outofdate */
extern T1 T382f21(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.put */
extern void T29f72(T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_COMMAND.unix_file_system */
extern T0* T382f20(T0* C);
/* GEANT_XSLT_COMMAND.file_system */
extern T0* T382f19(T0* C);
/* GEANT_XSLT_COMMAND.windows_file_system */
extern T0* T382f24(T0* C);
/* GEANT_XSLT_COMMAND.operating_system */
extern T0* T382f23(T0* C);
/* GEANT_XSLT_TASK.exit_application */
extern void T300f43(T0* C, T6 a1, T0* a2);
/* GEANT_XSLT_TASK.exceptions */
extern T0* T300f33(T0* C);
/* GEANT_XSLT_TASK.dir_attribute_name */
extern T0* T300f31(T0* C);
/* GEANT_XSLT_TASK.file_system */
extern T0* T300f30(T0* C);
/* GEANT_XSLT_TASK.unix_file_system */
extern T0* T300f39(T0* C);
/* GEANT_XSLT_TASK.windows_file_system */
extern T0* T300f38(T0* C);
/* GEANT_XSLT_TASK.operating_system */
extern T0* T300f37(T0* C);
/* GEANT_SETENV_TASK.execute */
extern void T299f24(T0* C);
/* GEANT_SETENV_COMMAND.execute */
extern void T381f11(T0* C);
/* KL_EXECUTION_ENVIRONMENT.set_variable_value */
extern void T100f8(T0* C, T0* a1, T0* a2);
/* KL_EXECUTION_ENVIRONMENT.put */
extern void T100f9(T0* C, T0* a1, T0* a2);
/* KL_EXECUTION_ENVIRONMENT.eif_putenv */
extern T6 T100f6(T0* C, T14 a1);
/* C_STRING.item */
extern T14 T182f4(T0* C);
/* GE_HASH_TABLE [C_STRING, STRING_8].force */
extern void T455f25(T0* C, T0* a1, T0* a2);
/* GE_HASH_TABLE [C_STRING, STRING_8].add_space */
extern void T455f28(T0* C);
/* GE_HASH_TABLE [C_STRING, STRING_8].accommodate */
extern void T455f29(T0* C, T6 a1);
/* GE_HASH_TABLE [C_STRING, STRING_8].set_deleted_marks */
extern void T455f33(T0* C, T0* a1);
/* GE_HASH_TABLE [C_STRING, STRING_8].set_keys */
extern void T455f32(T0* C, T0* a1);
/* GE_HASH_TABLE [C_STRING, STRING_8].set_content */
extern void T455f31(T0* C, T0* a1);
/* GE_HASH_TABLE [C_STRING, STRING_8].put */
extern void T455f30(T0* C, T0* a1, T0* a2);
/* GE_HASH_TABLE [C_STRING, STRING_8].set_conflict */
extern void T455f34(T0* C);
/* GE_HASH_TABLE [C_STRING, STRING_8].found */
extern T1 T455f21(T0* C);
/* GE_HASH_TABLE [C_STRING, STRING_8].occupied */
extern T1 T455f20(T0* C, T6 a1);
/* GE_HASH_TABLE [C_STRING, STRING_8].set_key_equality_tester */
extern void T455f26(T0* C, T0* a1);
/* GE_HASH_TABLE [C_STRING, STRING_8].make_map */
extern T0* T455c24(T6 a1);
/* GE_HASH_TABLE [C_STRING, STRING_8].make */
extern void T455f24p1(T0* C, T6 a1);
/* SPECIAL [C_STRING].make */
extern T0* T504c2(T6 a1);
/* PRIMES.higher_prime */
extern T6 T503f1(T0* C, T6 a1);
/* PRIMES.is_prime */
extern T1 T503f3(T0* C, T6 a1);
/* PRIMES.default_create */
extern T0* T503c5(void);
/* GE_HASH_TABLE [C_STRING, STRING_8].soon_full */
extern T1 T455f15(T0* C);
/* GE_HASH_TABLE [C_STRING, STRING_8].not_found */
extern T1 T455f14(T0* C);
/* GE_HASH_TABLE [C_STRING, STRING_8].internal_search */
extern void T455f27(T0* C, T0* a1);
/* GE_STRING_EQUALITY_TESTER.test */
extern T1 T499f1(T0* C, T0* a1, T0* a2);
/* KL_EXECUTION_ENVIRONMENT.environ */
extern unsigned char ge2200os4967;
extern T0* ge2200ov4967;
extern T0* T100f4(T0* C);
/* GE_STRING_EQUALITY_TESTER.default_create */
extern T0* T499c2(void);
/* C_STRING.make */
extern T0* T182c10(T0* a1);
/* C_STRING.set_string */
extern void T182f11(T0* C, T0* a1);
/* C_STRING.set_substring */
extern void T182f12(T0* C, T0* a1, T6 a2, T6 a3);
/* MANAGED_POINTER.put_natural_8 */
extern void T250f11(T0* C, T8 a1, T6 a2);
/* POINTER.memory_copy */
extern void T14f8(T14* C, T14 a1, T6 a2);
/* POINTER.c_memcpy */
extern void T14f10(T14* C, T14 a1, T14 a2, T6 a3);
/* NATURAL_32.to_natural_8 */
extern T8 T10f7(T10* C);
/* MANAGED_POINTER.resize */
extern void T250f10(T0* C, T6 a1);
/* POINTER.memory_set */
extern void T14f7(T14* C, T6 a1, T6 a2);
/* POINTER.c_memset */
extern void T14f9(T14* C, T14 a1, T6 a2, T6 a3);
/* POINTER.memory_realloc */
extern T14 T14f4(T14* C, T6 a1);
/* POINTER.c_realloc */
extern T14 T14f6(T14* C, T14 a1, T6 a2);
/* GEANT_SETENV_COMMAND.execution_environment */
extern T0* T381f7(T0* C);
/* GEANT_SETENV_TASK.exit_application */
extern void T299f26(T0* C, T6 a1, T0* a2);
/* GEANT_SETENV_TASK.exceptions */
extern T0* T299f18(T0* C);
/* GEANT_SETENV_TASK.std */
extern T0* T299f17(T0* C);
/* GEANT_SETENV_TASK.dir_attribute_name */
extern T0* T299f16(T0* C);
/* GEANT_SETENV_TASK.file_system */
extern T0* T299f15(T0* C);
/* GEANT_SETENV_TASK.unix_file_system */
extern T0* T299f22(T0* C);
/* GEANT_SETENV_TASK.windows_file_system */
extern T0* T299f21(T0* C);
/* GEANT_SETENV_TASK.operating_system */
extern T0* T299f20(T0* C);
/* GEANT_MOVE_TASK.execute */
extern void T298f26(T0* C);
/* GEANT_MOVE_COMMAND.execute */
extern void T380f21(T0* C);
/* GEANT_MOVE_COMMAND.create_directory_for_pathname */
extern void T380f25(T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.file_system */
extern T0* T380f13(T0* C);
/* GEANT_MOVE_COMMAND.windows_file_system */
extern T0* T380f15(T0* C);
/* GEANT_MOVE_COMMAND.operating_system */
extern T0* T380f14(T0* C);
/* GEANT_MOVE_COMMAND.is_file_to_file_executable */
extern T1 T380f10(T0* C);
/* GEANT_MOVE_COMMAND.move_file */
extern void T380f24(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.same_physical_file */
extern T1 T53f33(T0* C, T0* a1, T0* a2);
/* KL_TEXT_INPUT_FILE.same_physical_file */
extern T1 T55f41(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.old_change_name */
extern void T55f71(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.file_rename */
extern void T55f73(T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.file_system */
extern T0* T55f46(T0* C);
/* KL_TEXT_INPUT_FILE.unix_file_system */
extern T0* T55f51(T0* C);
/* KL_TEXT_INPUT_FILE.windows_file_system */
extern T0* T55f50(T0* C);
/* KL_TEXT_INPUT_FILE.operating_system */
extern T0* T55f49(T0* C);
/* KL_TEXT_INPUT_FILE.count */
extern T6 T55f45(T0* C);
/* KL_TEXT_INPUT_FILE.old_count */
extern T6 T55f48(T0* C);
/* KL_TEXT_INPUT_FILE.file_size */
extern T6 T55f53(T0* C, T14 a1);
/* UNIX_FILE_INFO.size */
extern T6 T86f10(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_write */
extern T1 T55f52(T0* C);
/* KL_TEXT_INPUT_FILE.inode */
extern T6 T55f44(T0* C);
/* UNIX_FILE_INFO.inode */
extern T6 T86f9(T0* C);
/* KL_TEXT_INPUT_FILE.tmp_file1 */
extern unsigned char ge285os4123;
extern T0* ge285ov4123;
extern T0* T55f43(T0* C);
/* KL_UNIX_FILE_SYSTEM.same_physical_file */
extern T1 T54f31(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.rename_file */
extern void T53f44(T0* C, T0* a1, T0* a2);
/* KL_TEXT_INPUT_FILE.change_name */
extern void T55f70(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.rename_file */
extern void T54f40(T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_COMMAND.unix_file_system */
extern T0* T380f12(T0* C);
/* GEANT_MOVE_COMMAND.create_directory */
extern void T380f23(T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.is_file_to_directory_executable */
extern T1 T380f11(T0* C);
/* GEANT_MOVE_TASK.exit_application */
extern void T298f28(T0* C, T6 a1, T0* a2);
/* GEANT_MOVE_TASK.exceptions */
extern T0* T298f20(T0* C);
/* GEANT_MOVE_TASK.std */
extern T0* T298f19(T0* C);
/* GEANT_MOVE_TASK.dir_attribute_name */
extern T0* T298f18(T0* C);
/* GEANT_MOVE_TASK.file_system */
extern T0* T298f17(T0* C);
/* GEANT_MOVE_TASK.unix_file_system */
extern T0* T298f24(T0* C);
/* GEANT_MOVE_TASK.windows_file_system */
extern T0* T298f23(T0* C);
/* GEANT_MOVE_TASK.operating_system */
extern T0* T298f22(T0* C);
/* GEANT_COPY_TASK.execute */
extern void T297f31(T0* C);
/* GEANT_COPY_COMMAND.execute */
extern void T379f25(T0* C);
/* GEANT_COPY_COMMAND.create_directory_for_pathname */
extern void T379f29(T0* C, T0* a1);
/* GEANT_COPY_COMMAND.file_system */
extern T0* T379f15(T0* C);
/* GEANT_COPY_COMMAND.windows_file_system */
extern T0* T379f18(T0* C);
/* GEANT_COPY_COMMAND.operating_system */
extern T0* T379f17(T0* C);
/* GEANT_COPY_COMMAND.is_file_to_file_executable */
extern T1 T379f12(T0* C);
/* GEANT_COPY_COMMAND.copy_file */
extern void T379f28(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.copy_file */
extern void T53f43(T0* C, T0* a1, T0* a2);
/* KL_TEXT_INPUT_FILE.copy_file */
extern void T55f69(T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.close */
extern void T453f36(T0* C);
/* KL_BINARY_INPUT_FILE.old_close */
extern void T453f39(T0* C);
/* KL_BINARY_INPUT_FILE.file_close */
extern void T453f40(T0* C, T14 a1);
/* KL_BINARY_OUTPUT_FILE.close */
extern void T454f22(T0* C);
/* KL_BINARY_OUTPUT_FILE.old_close */
extern void T454f26(T0* C);
/* KL_BINARY_OUTPUT_FILE.file_close */
extern void T454f28(T0* C, T14 a1);
/* KL_BINARY_OUTPUT_FILE.put_string */
extern void T454f21(T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.old_put_string */
extern void T454f25(T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.file_ps */
extern void T454f27(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_BINARY_OUTPUT_FILE.string_ */
extern T0* T454f9(T0* C);
/* KL_BINARY_INPUT_FILE.read_string */
extern void T453f35(T0* C, T6 a1);
/* KL_BINARY_INPUT_FILE.read_to_string */
extern T6 T453f19(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_BINARY_INPUT_FILE.dummy_kl_character_buffer */
extern T0* T453f32(T0* C);
/* KL_BINARY_INPUT_FILE.any_ */
extern T0* T453f30(T0* C);
/* KL_BINARY_INPUT_FILE.old_read_to_string */
extern T6 T453f18(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_BINARY_INPUT_FILE.file_gss */
extern T6 T453f29(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_BINARY_INPUT_FILE.old_end_of_file */
extern T1 T453f17(T0* C);
/* KL_BINARY_INPUT_FILE.file_feof */
extern T1 T453f28(T0* C, T14 a1);
/* KL_BINARY_OUTPUT_FILE.is_open_write */
extern T1 T454f11(T0* C);
/* KL_BINARY_OUTPUT_FILE.old_is_open_write */
extern T1 T454f8(T0* C);
/* KL_BINARY_OUTPUT_FILE.open_write */
extern void T454f20(T0* C);
/* KL_BINARY_OUTPUT_FILE.is_closed */
extern T1 T454f12(T0* C);
/* KL_BINARY_OUTPUT_FILE.old_is_closed */
extern T1 T454f18(T0* C);
/* KL_BINARY_OUTPUT_FILE.old_open_write */
extern void T454f24(T0* C);
/* KL_BINARY_OUTPUT_FILE.default_pointer */
extern T14 T454f15(T0* C);
/* KL_BINARY_OUTPUT_FILE.open_write */
extern void T454f24p1(T0* C);
/* KL_BINARY_OUTPUT_FILE.file_open */
extern T14 T454f17(T0* C, T14 a1, T6 a2);
/* KL_BINARY_OUTPUT_FILE.make */
extern T0* T454c19(T0* a1);
/* KL_BINARY_OUTPUT_FILE.old_make */
extern void T454f23(T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.is_open_read */
extern T1 T453f12(T0* C);
/* KL_BINARY_INPUT_FILE.old_is_open_read */
extern T1 T453f9(T0* C);
/* KL_BINARY_INPUT_FILE.open_read */
extern void T453f34(T0* C);
/* KL_BINARY_INPUT_FILE.is_closed */
extern T1 T453f16(T0* C);
/* KL_BINARY_INPUT_FILE.old_is_closed */
extern T1 T453f27(T0* C);
/* KL_BINARY_INPUT_FILE.old_open_read */
extern void T453f38(T0* C);
/* KL_BINARY_INPUT_FILE.default_pointer */
extern T14 T453f22(T0* C);
/* KL_BINARY_INPUT_FILE.open_read */
extern void T453f38p1(T0* C);
/* KL_BINARY_INPUT_FILE.file_open */
extern T14 T453f24(T0* C, T14 a1, T6 a2);
/* KL_BINARY_INPUT_FILE.old_is_readable */
extern T1 T453f15(T0* C);
/* KL_BINARY_INPUT_FILE.buffered_file_info */
extern T0* T453f26(T0* C);
/* KL_BINARY_INPUT_FILE.set_buffer */
extern void T453f41(T0* C);
/* KL_BINARY_INPUT_FILE.old_exists */
extern T1 T453f14(T0* C);
/* KL_BINARY_INPUT_FILE.file_exists */
extern T1 T453f25(T0* C, T14 a1);
/* KL_BINARY_INPUT_FILE.make */
extern T0* T453c33(T0* a1);
/* KL_BINARY_INPUT_FILE.old_make */
extern void T453f37(T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.string_ */
extern T0* T453f10(T0* C);
/* KL_UNIX_FILE_SYSTEM.copy_file */
extern void T54f39(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.is_file_outofdate */
extern T1 T379f16(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.unix_file_system */
extern T0* T379f14(T0* C);
/* GEANT_COPY_COMMAND.create_directory */
extern void T379f27(T0* C, T0* a1);
/* GEANT_COPY_COMMAND.is_file_to_directory_executable */
extern T1 T379f13(T0* C);
/* GEANT_COPY_TASK.exit_application */
extern void T297f33(T0* C, T6 a1, T0* a2);
/* GEANT_COPY_TASK.exceptions */
extern T0* T297f22(T0* C);
/* GEANT_COPY_TASK.dir_attribute_name */
extern T0* T297f20(T0* C);
/* GEANT_COPY_TASK.file_system */
extern T0* T297f19(T0* C);
/* GEANT_COPY_TASK.unix_file_system */
extern T0* T297f29(T0* C);
/* GEANT_COPY_TASK.windows_file_system */
extern T0* T297f28(T0* C);
/* GEANT_COPY_TASK.operating_system */
extern T0* T297f27(T0* C);
/* GEANT_DELETE_TASK.execute */
extern void T296f26(T0* C);
/* GEANT_DELETE_COMMAND.execute */
extern void T376f23(T0* C);
/* GEANT_DIRECTORYSET.forth */
extern void T378f24(T0* C);
/* GEANT_DIRECTORYSET.update_project_variables */
extern void T378f35(T0* C);
/* GEANT_DIRECTORYSET.item_directory_name */
extern T0* T378f16(T0* C);
/* GEANT_DIRECTORYSET.after */
extern T1 T378f15(T0* C);
/* GEANT_DIRECTORYSET.start */
extern void T378f23(T0* C);
/* GEANT_DIRECTORYSET.execute */
extern void T378f22(T0* C);
/* GEANT_DIRECTORYSET.remove_fileset_entry */
extern void T378f34(T0* C, T0* a1);
/* GEANT_DIRECTORYSET.add_fileset_entry_if_necessary */
extern void T378f33(T0* C, T0* a1);
/* GEANT_DIRECTORYSET.scan_internal */
extern void T378f32(T0* C, T0* a1);
/* GEANT_DIRECTORYSET.file_system */
extern T0* T378f18(T0* C);
/* GEANT_DIRECTORYSET.windows_file_system */
extern T0* T378f20(T0* C);
/* GEANT_DIRECTORYSET.operating_system */
extern T0* T378f19(T0* C);
/* GEANT_DIRECTORYSET.string_ */
extern T0* T378f17(T0* C);
/* GEANT_DIRECTORYSET.unix_file_system */
extern T0* T378f13(T0* C);
/* GEANT_DIRECTORYSET.is_executable */
extern T1 T378f14(T0* C);
/* GEANT_DELETE_COMMAND.is_directoryset_executable */
extern T1 T376f9(T0* C);
/* GEANT_DELETE_COMMAND.is_fileset_executable */
extern T1 T376f8(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.delete_file */
extern void T53f38(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.delete */
extern void T55f68(T0* C);
/* KL_TEXT_INPUT_FILE.old_delete */
extern void T55f72(T0* C);
/* KL_TEXT_INPUT_FILE.file_unlink */
extern void T55f74(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.delete_file */
extern void T54f34(T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.is_file_executable */
extern T1 T376f13(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.recursive_delete_directory */
extern void T53f40(T0* C, T0* a1);
/* KL_DIRECTORY.recursive_delete */
extern void T354f45(T0* C);
/* KL_DIRECTORY.old_recursive_delete */
extern void T354f48(T0* C);
/* KL_DIRECTORY.old_delete */
extern void T354f49(T0* C);
/* KL_DIRECTORY.eif_dir_delete */
extern void T354f52(T0* C, T14 a1);
/* KL_DIRECTORY.old_is_empty */
extern T1 T354f32(T0* C);
/* KL_DIRECTORY.count */
extern T6 T354f34(T0* C);
/* DIRECTORY.close */
extern void T459f18(T0* C);
/* DIRECTORY.default_pointer */
extern T14 T459f8(T0* C);
/* DIRECTORY.dir_close */
extern void T459f23(T0* C, T14 a1);
/* DIRECTORY.readentry */
extern void T459f17(T0* C);
/* DIRECTORY.dir_next */
extern T0* T459f7(T0* C, T14 a1);
/* DIRECTORY.start */
extern void T459f16(T0* C);
/* DIRECTORY.dir_rewind */
extern void T459f22(T0* C, T14 a1);
/* DIRECTORY.make_open_read */
extern T0* T459c15(T0* a1);
/* DIRECTORY.open_read */
extern void T459f21(T0* C);
/* DIRECTORY.dir_open */
extern T14 T459f10(T0* C, T14 a1);
/* DIRECTORY.make */
extern void T459f13(T0* C, T0* a1);
/* DIRECTORY.make */
extern T0* T459c13(T0* a1);
/* KL_DIRECTORY.delete_content */
extern void T354f51(T0* C);
/* ARRAYED_LIST [STRING_8].forth */
extern void T460f14(T0* C);
/* RAW_FILE.delete */
extern void T458f11(T0* C);
/* RAW_FILE.file_unlink */
extern void T458f13(T0* C, T14 a1);
/* RAW_FILE.is_writable */
extern T1 T458f4(T0* C);
/* UNIX_FILE_INFO.is_writable */
extern T1 T86f13(T0* C);
/* RAW_FILE.buffered_file_info */
extern T0* T458f7(T0* C);
/* RAW_FILE.set_buffer */
extern void T458f12(T0* C);
/* DIRECTORY.recursive_delete */
extern void T459f14(T0* C);
/* DIRECTORY.delete */
extern void T459f20(T0* C);
/* DIRECTORY.eif_dir_delete */
extern void T459f24(T0* C, T14 a1);
/* DIRECTORY.is_empty */
extern T1 T459f5(T0* C);
/* DIRECTORY.count */
extern T6 T459f12(T0* C);
/* DIRECTORY.delete_content */
extern void T459f19(T0* C);
/* DIRECTORY.linear_representation */
extern T0* T459f9(T0* C);
/* ARRAYED_LIST [STRING_8].extend */
extern void T460f15(T0* C, T0* a1);
/* ARRAYED_LIST [STRING_8].force_i_th */
extern void T460f18(T0* C, T0* a1, T6 a2);
/* ARRAYED_LIST [STRING_8].put_i_th */
extern void T460f21(T0* C, T0* a1, T6 a2);
/* ARRAYED_LIST [STRING_8].auto_resize */
extern void T460f20(T0* C, T6 a1, T6 a2);
/* ARRAYED_LIST [STRING_8].capacity */
extern T6 T460f10(T0* C);
/* ARRAYED_LIST [STRING_8].make_area */
extern void T460f19(T0* C, T6 a1);
/* ARRAYED_LIST [STRING_8].additional_space */
extern T6 T460f9(T0* C);
/* ARRAYED_LIST [STRING_8].empty_area */
extern T1 T460f8(T0* C);
/* ARRAYED_LIST [STRING_8].set_count */
extern void T460f16(T0* C, T6 a1);
/* ARRAYED_LIST [STRING_8].make */
extern T0* T460c12(T6 a1);
/* ARRAYED_LIST [STRING_8].array_make */
extern void T460f17(T0* C, T6 a1, T6 a2);
/* RAW_FILE.is_directory */
extern T1 T458f3(T0* C);
/* UNIX_FILE_INFO.is_directory */
extern T1 T86f12(T0* C);
/* RAW_FILE.is_symlink */
extern T1 T458f8(T0* C);
/* UNIX_FILE_INFO.is_symlink */
extern T1 T86f11(T0* C);
/* RAW_FILE.exists */
extern T1 T458f5(T0* C);
/* RAW_FILE.file_exists */
extern T1 T458f6(T0* C, T14 a1);
/* RAW_FILE.make */
extern T0* T458c10(T0* a1);
/* FILE_NAME.set_file_name */
extern void T457f10(T0* C, T0* a1);
/* FILE_NAME.set_count */
extern void T457f15(T0* C, T6 a1);
/* FILE_NAME.c_strlen */
extern T6 T457f4(T0* C, T14 a1);
/* FILE_NAME.eif_append_file_name */
extern void T457f14(T0* C, T14 a1, T14 a2, T14 a3);
/* FILE_NAME.resize */
extern void T457f13(T0* C, T6 a1);
/* FILE_NAME.capacity */
extern T6 T457f5(T0* C);
/* FILE_NAME.make_from_string */
extern T0* T457c9(T0* a1);
/* FILE_NAME.append */
extern void T457f12(T0* C, T0* a1);
/* FILE_NAME.additional_space */
extern T6 T457f6(T0* C);
/* FILE_NAME.string_make */
extern void T457f11(T0* C, T6 a1);
/* FILE_NAME.make_area */
extern void T457f16(T0* C, T6 a1);
/* ARRAYED_LIST [STRING_8].item */
extern T0* T460f6(T0* C);
/* ARRAYED_LIST [STRING_8].after */
extern T1 T460f7(T0* C);
/* ARRAYED_LIST [STRING_8].start */
extern void T460f13(T0* C);
/* KL_DIRECTORY.linear_representation */
extern T0* T354f33(T0* C);
/* KL_UNIX_FILE_SYSTEM.recursive_delete_directory */
extern void T54f36(T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.unix_file_system */
extern T0* T376f15(T0* C);
/* GEANT_DELETE_COMMAND.file_system */
extern T0* T376f14(T0* C);
/* GEANT_DELETE_COMMAND.windows_file_system */
extern T0* T376f17(T0* C);
/* GEANT_DELETE_COMMAND.operating_system */
extern T0* T376f16(T0* C);
/* GEANT_DELETE_COMMAND.is_directory_executable */
extern T1 T376f7(T0* C);
/* GEANT_DELETE_TASK.exit_application */
extern void T296f28(T0* C, T6 a1, T0* a2);
/* GEANT_DELETE_TASK.exceptions */
extern T0* T296f20(T0* C);
/* GEANT_DELETE_TASK.std */
extern T0* T296f19(T0* C);
/* GEANT_DELETE_TASK.dir_attribute_name */
extern T0* T296f18(T0* C);
/* GEANT_DELETE_TASK.file_system */
extern T0* T296f17(T0* C);
/* GEANT_DELETE_TASK.unix_file_system */
extern T0* T296f24(T0* C);
/* GEANT_DELETE_TASK.windows_file_system */
extern T0* T296f23(T0* C);
/* GEANT_DELETE_TASK.operating_system */
extern T0* T296f22(T0* C);
/* GEANT_MKDIR_TASK.execute */
extern void T295f23(T0* C);
/* GEANT_MKDIR_COMMAND.execute */
extern void T375f12(T0* C);
/* GEANT_MKDIR_COMMAND.unix_file_system */
extern T0* T375f7(T0* C);
/* GEANT_MKDIR_COMMAND.file_system */
extern T0* T375f6(T0* C);
/* GEANT_MKDIR_COMMAND.windows_file_system */
extern T0* T375f9(T0* C);
/* GEANT_MKDIR_COMMAND.operating_system */
extern T0* T375f8(T0* C);
/* GEANT_MKDIR_TASK.exit_application */
extern void T295f25(T0* C, T6 a1, T0* a2);
/* GEANT_MKDIR_TASK.exceptions */
extern T0* T295f17(T0* C);
/* GEANT_MKDIR_TASK.std */
extern T0* T295f16(T0* C);
/* GEANT_MKDIR_TASK.dir_attribute_name */
extern T0* T295f15(T0* C);
/* GEANT_MKDIR_TASK.file_system */
extern T0* T295f14(T0* C);
/* GEANT_MKDIR_TASK.unix_file_system */
extern T0* T295f21(T0* C);
/* GEANT_MKDIR_TASK.windows_file_system */
extern T0* T295f20(T0* C);
/* GEANT_MKDIR_TASK.operating_system */
extern T0* T295f19(T0* C);
/* GEANT_ECHO_TASK.execute */
extern void T294f29(T0* C);
/* GEANT_ECHO_COMMAND.execute */
extern void T374f12(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_line */
extern void T421f23(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.put_new_line */
extern void T421f30(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_append */
extern void T421f21(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_append */
extern void T421f28(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_append */
extern void T421f28p1(T0* C);
/* GEANT_ECHO_TASK.dir_attribute_name */
extern T0* T294f18(T0* C);
/* GEANT_ECHO_TASK.file_system */
extern T0* T294f17(T0* C);
/* GEANT_ECHO_TASK.unix_file_system */
extern T0* T294f27(T0* C);
/* GEANT_ECHO_TASK.windows_file_system */
extern T0* T294f26(T0* C);
/* GEANT_ECHO_TASK.operating_system */
extern T0* T294f25(T0* C);
/* GEANT_GEANT_TASK.execute */
extern void T293f35(T0* C);
/* GEANT_GEANT_COMMAND.execute */
extern void T372f30(T0* C);
/* GEANT_GEANT_COMMAND.execute_with_target */
extern void T372f35(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.is_fileset_executable */
extern T1 T372f19(T0* C);
/* GEANT_GEANT_COMMAND.execute_forked_with_target */
extern void T372f34(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.item */
extern T0* T25f54(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.string_ */
extern T0* T372f17(T0* C);
/* GEANT_GEANT_COMMAND.execute_with_filename */
extern void T372f33(T0* C, T0* a1);
/* GEANT_TARGET.is_exported_to_project */
extern T1 T26f79(T0* C, T0* a1);
/* GEANT_PROJECT.has_parent_with_name */
extern T1 T22f21(T0* C, T0* a1);
/* GEANT_PROJECT.string_ */
extern T0* T22f22(T0* C);
/* GEANT_GEANT_COMMAND.exit_application */
extern void T372f36(T0* C, T6 a1, T0* a2);
/* GEANT_GEANT_COMMAND.exceptions */
extern T0* T372f21(T0* C);
/* GEANT_GEANT_COMMAND.std */
extern T0* T372f20(T0* C);
/* GEANT_GEANT_COMMAND.execute_forked_with_filename_and_target */
extern void T372f32(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_COMMAND.execute_shell */
extern void T372f37(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.options_and_arguments_for_cmdline */
extern T0* T372f18(T0* C);
/* GEANT_PROJECT_VARIABLES.put */
extern void T25f86(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_COMMAND.project_variables_resolver */
extern T0* T372f16(T0* C);
/* GEANT_GEANT_COMMAND.unix_file_system */
extern T0* T372f15(T0* C);
/* GEANT_GEANT_COMMAND.file_system */
extern T0* T372f14(T0* C);
/* GEANT_GEANT_COMMAND.windows_file_system */
extern T0* T372f23(T0* C);
/* GEANT_GEANT_COMMAND.operating_system */
extern T0* T372f22(T0* C);
/* GEANT_GEANT_COMMAND.is_filename_executable */
extern T1 T372f10(T0* C);
/* GEANT_GEANT_TASK.dir_attribute_name */
extern T0* T293f24(T0* C);
/* GEANT_GEANT_TASK.file_system */
extern T0* T293f23(T0* C);
/* GEANT_GEANT_TASK.unix_file_system */
extern T0* T293f33(T0* C);
/* GEANT_GEANT_TASK.windows_file_system */
extern T0* T293f32(T0* C);
/* GEANT_GEANT_TASK.operating_system */
extern T0* T293f31(T0* C);
/* GEANT_GETEST_TASK.execute */
extern void T292f39(T0* C);
/* GEANT_GETEST_COMMAND.execute */
extern void T371f32(T0* C);
/* GEANT_GETEST_COMMAND.execute_shell */
extern void T371f34(T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.unix_file_system */
extern T0* T371f18(T0* C);
/* GEANT_GETEST_COMMAND.file_system */
extern T0* T371f17(T0* C);
/* GEANT_GETEST_COMMAND.windows_file_system */
extern T0* T371f20(T0* C);
/* GEANT_GETEST_COMMAND.operating_system */
extern T0* T371f19(T0* C);
/* GEANT_GETEST_COMMAND.string_ */
extern T0* T371f16(T0* C);
/* GEANT_GETEST_TASK.exit_application */
extern void T292f41(T0* C, T6 a1, T0* a2);
/* GEANT_GETEST_TASK.exceptions */
extern T0* T292f32(T0* C);
/* GEANT_GETEST_TASK.dir_attribute_name */
extern T0* T292f30(T0* C);
/* GEANT_GETEST_TASK.file_system */
extern T0* T292f29(T0* C);
/* GEANT_GETEST_TASK.unix_file_system */
extern T0* T292f37(T0* C);
/* GEANT_GETEST_TASK.windows_file_system */
extern T0* T292f36(T0* C);
/* GEANT_GETEST_TASK.operating_system */
extern T0* T292f35(T0* C);
/* GEANT_GEPP_TASK.execute */
extern void T291f34(T0* C);
/* GEANT_GEPP_COMMAND.execute */
extern void T370f27(T0* C);
/* GEANT_FILESET.has_map */
extern T1 T362f30(T0* C);
/* GEANT_GEPP_COMMAND.execute_shell */
extern void T370f30(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.is_file_outofdate */
extern T1 T370f17(T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_COMMAND.unix_file_system */
extern T0* T370f16(T0* C);
/* GEANT_GEPP_COMMAND.file_system */
extern T0* T370f15(T0* C);
/* GEANT_GEPP_COMMAND.windows_file_system */
extern T0* T370f19(T0* C);
/* GEANT_GEPP_COMMAND.operating_system */
extern T0* T370f18(T0* C);
/* GEANT_GEPP_COMMAND.is_file_executable */
extern T1 T370f10(T0* C);
/* GEANT_GEPP_COMMAND.create_directory */
extern void T370f29(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.string_ */
extern T0* T370f14(T0* C);
/* GEANT_GEPP_TASK.exit_application */
extern void T291f36(T0* C, T6 a1, T0* a2);
/* GEANT_GEPP_TASK.exceptions */
extern T0* T291f25(T0* C);
/* GEANT_GEPP_TASK.dir_attribute_name */
extern T0* T291f23(T0* C);
/* GEANT_GEPP_TASK.file_system */
extern T0* T291f22(T0* C);
/* GEANT_GEPP_TASK.unix_file_system */
extern T0* T291f32(T0* C);
/* GEANT_GEPP_TASK.windows_file_system */
extern T0* T291f31(T0* C);
/* GEANT_GEPP_TASK.operating_system */
extern T0* T291f30(T0* C);
/* GEANT_GEYACC_TASK.execute */
extern void T290f34(T0* C);
/* GEANT_GEYACC_COMMAND.execute */
extern void T369f27(T0* C);
/* GEANT_GEYACC_COMMAND.execute_shell */
extern void T369f29(T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.string_ */
extern T0* T369f15(T0* C);
/* GEANT_GEYACC_COMMAND.unix_file_system */
extern T0* T369f14(T0* C);
/* GEANT_GEYACC_COMMAND.file_system */
extern T0* T369f13(T0* C);
/* GEANT_GEYACC_COMMAND.windows_file_system */
extern T0* T369f17(T0* C);
/* GEANT_GEYACC_COMMAND.operating_system */
extern T0* T369f16(T0* C);
/* GEANT_GEYACC_TASK.exit_application */
extern void T290f36(T0* C, T6 a1, T0* a2);
/* GEANT_GEYACC_TASK.exceptions */
extern T0* T290f25(T0* C);
/* GEANT_GEYACC_TASK.dir_attribute_name */
extern T0* T290f23(T0* C);
/* GEANT_GEYACC_TASK.file_system */
extern T0* T290f22(T0* C);
/* GEANT_GEYACC_TASK.unix_file_system */
extern T0* T290f32(T0* C);
/* GEANT_GEYACC_TASK.windows_file_system */
extern T0* T290f31(T0* C);
/* GEANT_GEYACC_TASK.operating_system */
extern T0* T290f30(T0* C);
/* GEANT_GELEX_TASK.execute */
extern void T289f37(T0* C);
/* GEANT_GELEX_COMMAND.execute */
extern void T368f33(T0* C);
/* GEANT_GELEX_COMMAND.execute_shell */
extern void T368f35(T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.unix_file_system */
extern T0* T368f18(T0* C);
/* GEANT_GELEX_COMMAND.file_system */
extern T0* T368f17(T0* C);
/* GEANT_GELEX_COMMAND.windows_file_system */
extern T0* T368f20(T0* C);
/* GEANT_GELEX_COMMAND.operating_system */
extern T0* T368f19(T0* C);
/* GEANT_GELEX_COMMAND.string_ */
extern T0* T368f16(T0* C);
/* GEANT_GELEX_TASK.exit_application */
extern void T289f39(T0* C, T6 a1, T0* a2);
/* GEANT_GELEX_TASK.exceptions */
extern T0* T289f28(T0* C);
/* GEANT_GELEX_TASK.dir_attribute_name */
extern T0* T289f26(T0* C);
/* GEANT_GELEX_TASK.file_system */
extern T0* T289f25(T0* C);
/* GEANT_GELEX_TASK.unix_file_system */
extern T0* T289f35(T0* C);
/* GEANT_GELEX_TASK.windows_file_system */
extern T0* T289f34(T0* C);
/* GEANT_GELEX_TASK.operating_system */
extern T0* T289f33(T0* C);
/* GEANT_GEXACE_TASK.execute */
extern void T288f35(T0* C);
/* GEANT_GEXACE_COMMAND.execute */
extern void T366f30(T0* C);
/* GEANT_GEXACE_COMMAND.execute_shell */
extern void T366f32(T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.unix_file_system */
extern T0* T366f19(T0* C);
/* GEANT_GEXACE_COMMAND.file_system */
extern T0* T366f18(T0* C);
/* GEANT_GEXACE_COMMAND.windows_file_system */
extern T0* T366f21(T0* C);
/* GEANT_GEXACE_COMMAND.operating_system */
extern T0* T366f20(T0* C);
/* GEANT_GEXACE_COMMAND.is_library_executable */
extern T1 T366f15(T0* C);
/* GEANT_GEXACE_COMMAND.is_system_executable */
extern T1 T366f14(T0* C);
/* GEANT_GEXACE_COMMAND.is_validate_executable */
extern T1 T366f13(T0* C);
/* GEANT_GEXACE_COMMAND.string_ */
extern T0* T366f17(T0* C);
/* GEANT_GEXACE_TASK.exit_application */
extern void T288f37(T0* C, T6 a1, T0* a2);
/* GEANT_GEXACE_TASK.exceptions */
extern T0* T288f26(T0* C);
/* GEANT_GEXACE_TASK.dir_attribute_name */
extern T0* T288f24(T0* C);
/* GEANT_GEXACE_TASK.file_system */
extern T0* T288f23(T0* C);
/* GEANT_GEXACE_TASK.unix_file_system */
extern T0* T288f33(T0* C);
/* GEANT_GEXACE_TASK.windows_file_system */
extern T0* T288f32(T0* C);
/* GEANT_GEXACE_TASK.operating_system */
extern T0* T288f31(T0* C);
/* GEANT_UNSET_TASK.execute */
extern void T287f23(T0* C);
/* GEANT_UNSET_COMMAND.execute */
extern void T365f8(T0* C);
/* GEANT_UNSET_TASK.exit_application */
extern void T287f25(T0* C, T6 a1, T0* a2);
/* GEANT_UNSET_TASK.exceptions */
extern T0* T287f17(T0* C);
/* GEANT_UNSET_TASK.std */
extern T0* T287f16(T0* C);
/* GEANT_UNSET_TASK.dir_attribute_name */
extern T0* T287f15(T0* C);
/* GEANT_UNSET_TASK.file_system */
extern T0* T287f14(T0* C);
/* GEANT_UNSET_TASK.unix_file_system */
extern T0* T287f21(T0* C);
/* GEANT_UNSET_TASK.windows_file_system */
extern T0* T287f20(T0* C);
/* GEANT_UNSET_TASK.operating_system */
extern T0* T287f19(T0* C);
/* GEANT_SET_TASK.execute */
extern void T286f24(T0* C);
/* GEANT_SET_COMMAND.execute */
extern void T364f10(T0* C);
/* GEANT_SET_TASK.exit_application */
extern void T286f26(T0* C, T6 a1, T0* a2);
/* GEANT_SET_TASK.exceptions */
extern T0* T286f18(T0* C);
/* GEANT_SET_TASK.std */
extern T0* T286f17(T0* C);
/* GEANT_SET_TASK.dir_attribute_name */
extern T0* T286f16(T0* C);
/* GEANT_SET_TASK.file_system */
extern T0* T286f15(T0* C);
/* GEANT_SET_TASK.unix_file_system */
extern T0* T286f22(T0* C);
/* GEANT_SET_TASK.windows_file_system */
extern T0* T286f21(T0* C);
/* GEANT_SET_TASK.operating_system */
extern T0* T286f20(T0* C);
/* GEANT_LCC_TASK.execute */
extern void T285f24(T0* C);
/* GEANT_LCC_COMMAND.execute */
extern void T363f15(T0* C);
/* GEANT_LCC_COMMAND.execute_shell */
extern void T363f17(T0* C, T0* a1);
/* GEANT_LCC_COMMAND.string_ */
extern T0* T363f9(T0* C);
/* GEANT_LCC_COMMAND.unix_file_system */
extern T0* T363f8(T0* C);
/* GEANT_LCC_COMMAND.file_system */
extern T0* T363f7(T0* C);
/* GEANT_LCC_COMMAND.windows_file_system */
extern T0* T363f11(T0* C);
/* GEANT_LCC_COMMAND.operating_system */
extern T0* T363f10(T0* C);
/* GEANT_LCC_TASK.exit_application */
extern void T285f26(T0* C, T6 a1, T0* a2);
/* GEANT_LCC_TASK.exceptions */
extern T0* T285f18(T0* C);
/* GEANT_LCC_TASK.std */
extern T0* T285f17(T0* C);
/* GEANT_LCC_TASK.dir_attribute_name */
extern T0* T285f16(T0* C);
/* GEANT_LCC_TASK.file_system */
extern T0* T285f15(T0* C);
/* GEANT_LCC_TASK.unix_file_system */
extern T0* T285f22(T0* C);
/* GEANT_LCC_TASK.windows_file_system */
extern T0* T285f21(T0* C);
/* GEANT_LCC_TASK.operating_system */
extern T0* T285f20(T0* C);
/* GEANT_EXEC_TASK.execute */
extern void T284f30(T0* C);
/* GEANT_EXEC_COMMAND.execute */
extern void T360f17(T0* C);
/* GEANT_EXEC_COMMAND.project_variables_resolver */
extern T0* T360f11(T0* C);
/* GEANT_EXEC_COMMAND.execute_shell */
extern void T360f19(T0* C, T0* a1);
/* GEANT_EXEC_COMMAND.is_commandline_executable */
extern T1 T360f9(T0* C);
/* GEANT_EXEC_TASK.exit_application */
extern void T284f32(T0* C, T6 a1, T0* a2);
/* GEANT_EXEC_TASK.exceptions */
extern T0* T284f21(T0* C);
/* GEANT_EXEC_TASK.dir_attribute_name */
extern T0* T284f19(T0* C);
/* GEANT_EXEC_TASK.file_system */
extern T0* T284f18(T0* C);
/* GEANT_EXEC_TASK.unix_file_system */
extern T0* T284f28(T0* C);
/* GEANT_EXEC_TASK.windows_file_system */
extern T0* T284f27(T0* C);
/* GEANT_EXEC_TASK.operating_system */
extern T0* T284f26(T0* C);
/* GEANT_VE_TASK.execute */
extern void T283f34(T0* C);
/* GEANT_VE_COMMAND.execute */
extern void T359f28(T0* C);
/* GEANT_VE_COMMAND.execute_clean */
extern void T359f32(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.cd */
extern void T53f39(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.cd */
extern void T54f35(T0* C, T0* a1);
/* GEANT_VE_COMMAND.execute_tuner */
extern void T359f31(T0* C);
/* GEANT_VE_COMMAND.operating_system */
extern T0* T359f18(T0* C);
/* GEANT_VE_COMMAND.is_tunable */
extern T1 T359f12(T0* C);
/* GEANT_VE_COMMAND.execute_shell */
extern void T359f30(T0* C, T0* a1);
/* GEANT_VE_COMMAND.string_ */
extern T0* T359f17(T0* C);
/* GEANT_VE_COMMAND.unix_file_system */
extern T0* T359f16(T0* C);
/* GEANT_VE_COMMAND.file_system */
extern T0* T359f15(T0* C);
/* GEANT_VE_COMMAND.windows_file_system */
extern T0* T359f19(T0* C);
/* GEANT_VE_COMMAND.is_compilable */
extern T1 T359f10(T0* C);
/* GEANT_VE_TASK.exit_application */
extern void T283f36(T0* C, T6 a1, T0* a2);
/* GEANT_VE_TASK.exceptions */
extern T0* T283f25(T0* C);
/* GEANT_VE_TASK.dir_attribute_name */
extern T0* T283f23(T0* C);
/* GEANT_VE_TASK.file_system */
extern T0* T283f22(T0* C);
/* GEANT_VE_TASK.unix_file_system */
extern T0* T283f32(T0* C);
/* GEANT_VE_TASK.windows_file_system */
extern T0* T283f31(T0* C);
/* GEANT_VE_TASK.operating_system */
extern T0* T283f30(T0* C);
/* GEANT_ISE_TASK.execute */
extern void T282f33(T0* C);
/* GEANT_ISE_COMMAND.execute */
extern void T358f25(T0* C);
/* GEANT_ISE_COMMAND.execute_clean */
extern void T358f28(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.delete_directory */
extern void T53f41(T0* C, T0* a1);
/* KL_DIRECTORY.delete */
extern void T354f46(T0* C);
/* KL_DIRECTORY.is_empty */
extern T1 T354f23(T0* C);
/* KL_DIRECTORY.tmp_directory */
extern unsigned char ge281os9367;
extern T0* ge281ov9367;
extern T0* T354f27(T0* C);
/* KL_UNIX_FILE_SYSTEM.delete_directory */
extern void T54f37(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_empty */
extern T1 T53f30(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.is_directory_empty */
extern T1 T54f27(T0* C, T0* a1);
/* GEANT_ISE_COMMAND.file_system */
extern T0* T358f13(T0* C);
/* GEANT_ISE_COMMAND.unix_file_system */
extern T0* T358f14(T0* C);
/* GEANT_ISE_COMMAND.windows_file_system */
extern T0* T358f17(T0* C);
/* GEANT_ISE_COMMAND.operating_system */
extern T0* T358f16(T0* C);
/* GEANT_ISE_COMMAND.execute_compile */
extern void T358f27(T0* C);
/* GEANT_ISE_COMMAND.execute_shell */
extern void T358f29(T0* C, T0* a1);
/* GEANT_ISE_COMMAND.string_ */
extern T0* T358f15(T0* C);
/* GEANT_ISE_COMMAND.is_compilable */
extern T1 T358f9(T0* C);
/* GEANT_ISE_TASK.exit_application */
extern void T282f35(T0* C, T6 a1, T0* a2);
/* GEANT_ISE_TASK.exceptions */
extern T0* T282f24(T0* C);
/* GEANT_ISE_TASK.dir_attribute_name */
extern T0* T282f22(T0* C);
/* GEANT_ISE_TASK.file_system */
extern T0* T282f21(T0* C);
/* GEANT_ISE_TASK.unix_file_system */
extern T0* T282f31(T0* C);
/* GEANT_ISE_TASK.windows_file_system */
extern T0* T282f30(T0* C);
/* GEANT_ISE_TASK.operating_system */
extern T0* T282f29(T0* C);
/* GEANT_SE_TASK.execute */
extern void T281f35(T0* C);
/* GEANT_SE_COMMAND.execute */
extern void T357f33(T0* C);
/* GEANT_SE_COMMAND.new_traditional_cmdline */
extern T0* T357f19(T0* C);
/* GEANT_SE_COMMAND.unix_file_system */
extern T0* T357f23(T0* C);
/* GEANT_SE_COMMAND.string_ */
extern T0* T357f20(T0* C);
/* GEANT_SE_COMMAND.new_ace_cmdline */
extern T0* T357f18(T0* C);
/* GEANT_SE_COMMAND.is_ace_configuration */
extern T1 T357f15(T0* C);
/* GEANT_SE_COMMAND.execute_shell */
extern void T357f35(T0* C, T0* a1);
/* GEANT_SE_COMMAND.file_system */
extern T0* T357f17(T0* C);
/* GEANT_SE_COMMAND.windows_file_system */
extern T0* T357f22(T0* C);
/* GEANT_SE_COMMAND.operating_system */
extern T0* T357f21(T0* C);
/* GEANT_SE_COMMAND.new_clean_cmdline */
extern T0* T357f16(T0* C);
/* GEANT_SE_COMMAND.is_cleanable */
extern T1 T357f12(T0* C);
/* GEANT_SE_TASK.exit_application */
extern void T281f37(T0* C, T6 a1, T0* a2);
/* GEANT_SE_TASK.exceptions */
extern T0* T281f26(T0* C);
/* GEANT_SE_TASK.dir_attribute_name */
extern T0* T281f24(T0* C);
/* GEANT_SE_TASK.file_system */
extern T0* T281f23(T0* C);
/* GEANT_SE_TASK.unix_file_system */
extern T0* T281f33(T0* C);
/* GEANT_SE_TASK.windows_file_system */
extern T0* T281f32(T0* C);
/* GEANT_SE_TASK.operating_system */
extern T0* T281f31(T0* C);
/* GEANT_GEC_TASK.execute */
extern void T280f36(T0* C);
/* GEANT_GEC_COMMAND.execute */
extern void T356f33(T0* C);
/* GEANT_GEC_COMMAND.execute_shell */
extern void T356f35(T0* C, T0* a1);
/* GEANT_GEC_COMMAND.new_ace_cmdline */
extern T0* T356f17(T0* C);
/* GEANT_GEC_COMMAND.string_ */
extern T0* T356f22(T0* C);
/* GEANT_GEC_COMMAND.unix_file_system */
extern T0* T356f20(T0* C);
/* KL_INTEGER_ROUTINES.append_decimal_integer */
extern void T197f5(T0* C, T6 a1, T0* a2);
/* GEANT_GEC_COMMAND.integer_ */
extern T0* T356f21(T0* C);
/* GEANT_GEC_COMMAND.is_ace_configuration */
extern T1 T356f13(T0* C);
/* GEANT_GEC_COMMAND.file_system */
extern T0* T356f16(T0* C);
/* GEANT_GEC_COMMAND.windows_file_system */
extern T0* T356f19(T0* C);
/* GEANT_GEC_COMMAND.operating_system */
extern T0* T356f18(T0* C);
/* GEANT_GEC_COMMAND.is_cleanable */
extern T1 T356f14(T0* C);
/* GEANT_GEC_TASK.exit_application */
extern void T280f38(T0* C, T6 a1, T0* a2);
/* GEANT_GEC_TASK.exceptions */
extern T0* T280f27(T0* C);
/* GEANT_GEC_TASK.dir_attribute_name */
extern T0* T280f25(T0* C);
/* GEANT_GEC_TASK.file_system */
extern T0* T280f24(T0* C);
/* GEANT_GEC_TASK.unix_file_system */
extern T0* T280f34(T0* C);
/* GEANT_GEC_TASK.windows_file_system */
extern T0* T280f33(T0* C);
/* GEANT_GEC_TASK.operating_system */
extern T0* T280f32(T0* C);
/* XM_CHARACTER_DATA.node_set_parent */
extern void T315f4(T0* C, T0* a1);
/* XM_PROCESSING_INSTRUCTION.node_set_parent */
extern void T314f6(T0* C, T0* a1);
/* XM_COMMENT.node_set_parent */
extern void T313f5(T0* C, T0* a1);
/* XM_ATTRIBUTE.node_set_parent */
extern void T190f6(T0* C, T0* a1);
/* XM_ELEMENT.node_set_parent */
extern void T97f31(T0* C, T0* a1);
/* XM_CHARACTER_DATA.process */
extern void T315f5(T0* C, T0* a1);
/* XM_NODE_TYPER.process_character_data */
extern void T320f18(T0* C, T0* a1);
/* XM_NODE_TYPER.reset */
extern void T320f14(T0* C);
/* XM_PROCESSING_INSTRUCTION.process */
extern void T314f7(T0* C, T0* a1);
/* XM_NODE_TYPER.process_processing_instruction */
extern void T320f17(T0* C, T0* a1);
/* XM_COMMENT.process */
extern void T313f6(T0* C, T0* a1);
/* XM_NODE_TYPER.process_comment */
extern void T320f16(T0* C, T0* a1);
/* XM_ATTRIBUTE.process */
extern void T190f7(T0* C, T0* a1);
/* XM_NODE_TYPER.process_attribute */
extern void T320f15(T0* C, T0* a1);
/* XM_ELEMENT.process */
extern void T97f36(T0* C, T0* a1);
/* XM_NODE_TYPER.process_element */
extern void T320f12(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_stream */
extern void T172f234(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T172f241(T0* C, T0* a1);
/* YY_FILE_BUFFER.name */
extern T0* T207f14(T0* C);
/* XM_EIFFEL_INPUT_STREAM.name */
extern T0* T196f26(T0* C);
/* KL_STRING_INPUT_STREAM.name */
extern unsigned char ge207os4075;
extern T0* ge207ov4075;
extern T0* T355f6(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T172f241p1(T0* C, T0* a1);
/* YY_FILE_BUFFER.set_position */
extern void T207f19(T0* C, T6 a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.set_index */
extern void T207f18(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.new_file_buffer */
extern T0* T172f71(T0* C, T0* a1);
/* YY_FILE_BUFFER.make */
extern T0* T207c17(T0* a1);
/* YY_FILE_BUFFER.make_with_size */
extern void T207f21(T0* C, T0* a1, T6 a2);
/* YY_FILE_BUFFER.set_file */
extern void T207f23(T0* C, T0* a1);
/* YY_FILE_BUFFER.flush */
extern void T207f25(T0* C);
/* YY_FILE_BUFFER.new_default_buffer */
extern T0* T207f16(T0* C, T6 a1);
/* YY_FILE_BUFFER.default_capacity */
extern unsigned char ge398os8123;
extern T6 ge398ov8123;
extern T6 T207f13(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_input_stream */
extern void T170f199(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T170f208(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T170f208p1(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.new_file_buffer */
extern T0* T170f54(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_stream */
extern void T166f230(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T166f237(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T166f237p1(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.new_file_buffer */
extern T0* T166f69(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_stream */
extern void T128f197(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T128f205(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T128f205p1(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.new_file_buffer */
extern T0* T128f45(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T172f235(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T172f235p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T172f235p0(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_action */
extern void T172f245(T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.from_hexadecimal */
extern void T205f10(T0* C, T0* a1);
/* KL_STRING_ROUTINES.hexadecimal_to_integer */
extern T6 T76f13(T0* C, T0* a1);
/* XM_EIFFEL_CHARACTER_ENTITY.string_ */
extern T0* T205f7(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.to_utf8 */
extern T0* T205f3(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.utf8 */
extern T0* T205f6(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_ascii */
extern T1 T205f2(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_valid */
extern T1 T205f5(T0* C);
/* UC_UNICODE_ROUTINES.valid_non_surrogate_code */
extern T1 T253f3(T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.unicode */
extern T0* T205f4(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.from_decimal */
extern void T205f9(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.has_normalized_newline */
extern T1 T172f201(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_substring */
extern T0* T172f181(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_PE_ENTITY_DEF.text_count */
extern T6 T172f180(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.system_literal_text */
extern T0* T172f162(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_item */
extern T2 T172f207(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern T0* T172f121(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern unsigned char ge1425os6795;
extern T0* ge1425ov6795;
extern T0* T172f121p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_line_column */
extern void T172f249(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text */
extern T0* T172f105(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.pop_start_condition */
extern void T172f248(T0* C);
/* DS_LINKED_STACK [INTEGER_32].remove */
extern void T210f7(T0* C);
/* DS_LINKED_STACK [INTEGER_32].item */
extern T6 T210f4(T0* C);
/* DS_LINKED_STACK [INTEGER_32].is_empty */
extern T1 T210f3(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition */
extern void T172f246(T0* C, T6 a1);
/* DS_LINKED_STACK [INTEGER_32].force */
extern void T210f6(T0* C, T6 a1);
/* DS_LINKABLE [INTEGER_32].put_right */
extern void T268f4(T0* C, T0* a1);
/* DS_LINKABLE [INTEGER_32].make */
extern T0* T268c3(T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_last_token */
extern void T172f247(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_eof_action */
extern void T172f244(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.wrap */
extern T1 T172f99(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_refill_input_buffer */
extern void T172f243(T0* C);
/* YY_FILE_BUFFER.fill */
extern void T207f20(T0* C);
/* KL_CHARACTER_BUFFER.fill_from_stream */
extern T6 T326f5(T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T6 T196f27(T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T6 T196f27p1(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STRING_INPUT_STREAM.read_to_string */
extern T6 T355f5(T0* C, T0* a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.compact_left */
extern void T207f22(T0* C);
/* KL_CHARACTER_BUFFER.move_left */
extern void T326f11(T0* C, T6 a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.resize */
extern void T207f24(T0* C);
/* KL_CHARACTER_BUFFER.resize */
extern void T326f12(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_null_trans_state */
extern T6 T172f98(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_previous_state */
extern T6 T172f97(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.terminate */
extern void T172f242(T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T170f200(T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T170f200p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_action */
extern void T170f214(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.has_normalized_newline */
extern T1 T170f179(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_substring */
extern T0* T170f159(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_SCANNER_DTD.text_count */
extern T6 T170f158(T0* C);
/* XM_EIFFEL_SCANNER_DTD.system_literal_text */
extern T0* T170f140(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_item */
extern T2 T170f194(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.normalized_newline */
extern T0* T170f102(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_line_column */
extern void T170f220(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text */
extern T0* T170f76(T0* C);
/* XM_EIFFEL_SCANNER_DTD.pop_start_condition */
extern void T170f219(T0* C);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition */
extern void T170f215(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_eof_action */
extern void T170f213(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.wrap */
extern T1 T170f67(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_refill_input_buffer */
extern void T170f212(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_null_trans_state */
extern T6 T170f66(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_previous_state */
extern T6 T170f65(T0* C);
/* XM_EIFFEL_SCANNER_DTD.fatal_error */
extern void T170f211(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.terminate */
extern void T170f210(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_last_token */
extern void T170f209(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T166f231(T0* C);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T166f231p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_action */
extern void T166f240(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.has_normalized_newline */
extern T1 T166f198(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_substring */
extern T0* T166f178(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_ENTITY_DEF.text_count */
extern T6 T166f177(T0* C);
/* XM_EIFFEL_ENTITY_DEF.system_literal_text */
extern T0* T166f159(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_item */
extern T2 T166f205(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T166f118(T0* C);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T166f118p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_line_column */
extern void T166f245(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text */
extern T0* T166f102(T0* C);
/* XM_EIFFEL_ENTITY_DEF.pop_start_condition */
extern void T166f244(T0* C);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition */
extern void T166f241(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.set_last_token */
extern void T166f243(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_eof_action */
extern void T166f239(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.terminate */
extern void T166f242(T0* C);
/* XM_EIFFEL_ENTITY_DEF.wrap */
extern T1 T166f96(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_refill_input_buffer */
extern void T166f238(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_null_trans_state */
extern T6 T166f95(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_previous_state */
extern T6 T166f94(T0* C);
/* XM_EIFFEL_SCANNER.read_token */
extern void T128f198(T0* C);
/* XM_EIFFEL_SCANNER.yy_execute_action */
extern void T128f209(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.has_normalized_newline */
extern T1 T128f177(T0* C);
/* XM_EIFFEL_SCANNER.text_substring */
extern T0* T128f157(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_SCANNER.text_count */
extern T6 T128f156(T0* C);
/* XM_EIFFEL_SCANNER.system_literal_text */
extern T0* T128f138(T0* C);
/* XM_EIFFEL_SCANNER.text_item */
extern T2 T128f192(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.normalized_newline */
extern T0* T128f97(T0* C);
/* XM_EIFFEL_SCANNER.yy_set_line_column */
extern void T128f217(T0* C);
/* XM_EIFFEL_SCANNER.text */
extern T0* T128f71(T0* C);
/* XM_EIFFEL_SCANNER.pop_start_condition */
extern void T128f216(T0* C);
/* XM_EIFFEL_SCANNER.set_start_condition */
extern void T128f218(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.push_start_condition */
extern void T128f210(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.set_last_token */
extern void T128f215(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.yy_execute_eof_action */
extern void T128f208(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.terminate */
extern void T128f214(T0* C);
/* XM_EIFFEL_SCANNER.wrap */
extern T1 T128f62(T0* C);
/* XM_EIFFEL_SCANNER.yy_refill_input_buffer */
extern void T128f207(T0* C);
/* XM_EIFFEL_SCANNER.yy_null_trans_state */
extern T6 T128f61(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.yy_previous_state */
extern T6 T128f60(T0* C);
/* XM_EIFFEL_SCANNER.fatal_error */
extern void T128f206(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T172f237(T0* C);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition_dtd_ignore */
extern void T170f202(T0* C);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T166f233(T0* C);
/* XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T128f200(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_encoding */
extern void T172f238(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.set_encoding */
extern void T196f30(T0* C, T0* a1);
/* KL_STRING_ROUTINES.same_case_insensitive */
extern T1 T76f11(T0* C, T0* a1, T0* a2);
/* CHARACTER_8.lower */
extern T2 T2f19(T2* C);
/* CHARACTER_8.is_upper */
extern T1 T2f20(T2* C);
/* UC_UNICODE_ROUTINES.lower_code */
extern T6 T253f4(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.lower_codes */
extern unsigned char ge254os8377;
extern T0* ge254ov8377;
extern T0* T253f9(T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_plane */
extern unsigned char ge254os8376;
extern T0* ge254ov8376;
extern T0* T253f12(T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_segment */
extern unsigned char ge254os8365;
extern T0* ge254ov8365;
extern T0* T253f19(T0* C);
/* KL_INTEGER_ROUTINES.to_integer */
extern T6 T197f3(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.integer_ */
extern T0* T253f28(T0* C);
/* SPECIAL [ARRAY [INTEGER_32]].make */
extern T0* T331c2(T6 a1);
/* UC_UNICODE_ROUTINES.lower_code_plane_1 */
extern unsigned char ge254os8375;
extern T0* ge254ov8375;
extern T0* T253f11(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_1_segment_4 */
extern unsigned char ge254os8374;
extern T0* ge254ov8374;
extern T0* T253f27(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0 */
extern unsigned char ge254os8373;
extern T0* ge254ov8373;
extern T0* T253f10(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_255 */
extern unsigned char ge254os8372;
extern T0* ge254ov8372;
extern T0* T253f26(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_44 */
extern unsigned char ge254os8371;
extern T0* ge254ov8371;
extern T0* T253f25(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_36 */
extern unsigned char ge254os8370;
extern T0* ge254ov8370;
extern T0* T253f24(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_33 */
extern unsigned char ge254os8369;
extern T0* ge254ov8369;
extern T0* T253f23(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_31 */
extern unsigned char ge254os8368;
extern T0* ge254ov8368;
extern T0* T253f22(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_30 */
extern unsigned char ge254os8367;
extern T0* ge254ov8367;
extern T0* T253f21(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_16 */
extern unsigned char ge254os8366;
extern T0* ge254ov8366;
extern T0* T253f20(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_5 */
extern unsigned char ge254os8364;
extern T0* ge254ov8364;
extern T0* T253f18(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_4 */
extern unsigned char ge254os8363;
extern T0* ge254ov8363;
extern T0* T253f17(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_3 */
extern unsigned char ge254os8362;
extern T0* ge254ov8362;
extern T0* T253f16(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_2 */
extern unsigned char ge254os8361;
extern T0* ge254ov8361;
extern T0* T253f15(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_1 */
extern unsigned char ge254os8360;
extern T0* ge254ov8360;
extern T0* T253f14(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_0 */
extern unsigned char ge254os8359;
extern T0* ge254ov8359;
extern T0* T253f13(T0* C);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].make */
extern T0* T332c2(T6 a1);
/* KL_STRING_ROUTINES.unicode */
extern T0* T76f12(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_encoding */
extern void T170f203(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_encoding */
extern void T166f234(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_encoding */
extern void T128f201(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_from_resolver */
extern void T172f239(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_from_resolver */
extern void T170f204(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_from_resolver */
extern void T166f235(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T128f202(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.close_input */
extern void T172f236(T0* C);
/* KL_STRING_INPUT_STREAM.close */
extern void T355f10(T0* C);
/* KL_STRING_INPUT_STREAM.is_closable */
extern T1 T355f7(T0* C);
/* KL_TEXT_INPUT_FILE.is_closable */
extern T1 T55f26(T0* C);
/* XM_EIFFEL_SCANNER_DTD.close_input */
extern void T170f201(T0* C);
/* XM_EIFFEL_ENTITY_DEF.close_input */
extern void T166f232(T0* C);
/* XM_EIFFEL_SCANNER.close_input */
extern void T128f199(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start */
extern void T173f26(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_make */
extern void T173f36(T0* C);
/* XM_NAMESPACE_RESOLVER.new_string_queue */
extern T0* T173f12(T0* C);
/* DS_LINKED_QUEUE [STRING_8].make */
extern T0* T240c6(void);
/* XM_NAMESPACE_RESOLVER_CONTEXT.make */
extern T0* T238c10(void);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T275c9(void);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].new_cursor */
extern T0* T275f7(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T276c7(T0* a1);
/* XM_CALLBACKS_NULL.on_start */
extern void T133f2(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T98f6(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T98f6p1(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start */
extern void T95f12(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_equal */
extern T0* T312c32(T6 a1);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].default_create */
extern T0* T392c3(void);
/* DS_HASH_SET [XM_NAMESPACE].make */
extern void T312f35(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_cursor */
extern T0* T312f23(T0* C);
/* DS_HASH_SET_CURSOR [XM_NAMESPACE].make */
extern T0* T393c3(T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].unset_found_item */
extern void T312f36(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_slots */
extern void T312f44(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].special_integer_ */
extern T0* T312f29(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].new_modulus */
extern T6 T312f20(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_clashes */
extern void T312f43(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_key_storage */
extern void T312f42(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_item_storage */
extern void T312f41(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].make */
extern T0* T394f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_NAMESPACE].make_area */
extern T0* T428c2(T6 a1);
/* SPECIAL [XM_NAMESPACE].make */
extern T0* T391c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].default_create */
extern T0* T394c3(void);
/* XM_DOCUMENT.make */
extern T0* T96c15(void);
/* XM_DOCUMENT.make_with_root_named */
extern void T96f16(T0* C, T0* a1, T0* a2);
/* XM_DOCUMENT.force_last */
extern void T96f18(T0* C, T0* a1);
/* XM_DOCUMENT.force_last */
extern void T96f18p1(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].put_right */
extern void T319f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].make */
extern T0* T319c3(T0* a1);
/* XM_DOCUMENT.is_empty */
extern T1 T96f11(T0* C);
/* XM_DOCUMENT.before_addition */
extern void T96f19(T0* C, T0* a1);
/* XM_ELEMENT.equality_delete */
extern void T97f35(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].remove */
extern void T191f13(T0* C);
/* XM_DOCUMENT.remove_at_cursor */
extern void T96f26(T0* C, T0* a1);
/* XM_DOCUMENT.move_all_cursors */
extern void T96f33(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_current_cell */
extern void T191f17(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].put */
extern void T319f6(T0* C, T0* a1);
/* XM_DOCUMENT.set_last_cell */
extern void T96f32(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].forget_right */
extern void T319f5(T0* C);
/* XM_DOCUMENT.remove_last */
extern void T96f31(T0* C);
/* XM_DOCUMENT.move_last_cursors_after */
extern void T96f36(T0* C);
/* XM_DOCUMENT.wipe_out */
extern void T96f34(T0* C);
/* XM_DOCUMENT.move_all_cursors_after */
extern void T96f37(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].is_last */
extern T1 T191f7(T0* C);
/* XM_DOCUMENT.cursor_is_last */
extern T1 T96f14(T0* C, T0* a1);
/* XM_ELEMENT.cursor_is_last */
extern T1 T97f25(T0* C, T0* a1);
/* XM_DOCUMENT.remove_first */
extern void T96f30(T0* C);
/* XM_DOCUMENT.set_first_cell */
extern void T96f35(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].is_first */
extern T1 T191f6(T0* C);
/* XM_DOCUMENT.cursor_is_first */
extern T1 T96f13(T0* C, T0* a1);
/* XM_ELEMENT.cursor_is_first */
extern T1 T97f24(T0* C, T0* a1);
/* XM_ELEMENT.remove_at_cursor */
extern void T97f40(T0* C, T0* a1);
/* XM_ELEMENT.move_all_cursors */
extern void T97f46(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.set_last_cell */
extern void T97f45(T0* C, T0* a1);
/* XM_ELEMENT.remove_last */
extern void T97f44(T0* C);
/* XM_ELEMENT.move_last_cursors_after */
extern void T97f49(T0* C);
/* XM_ELEMENT.wipe_out */
extern void T97f47(T0* C);
/* XM_ELEMENT.move_all_cursors_after */
extern void T97f50(T0* C);
/* XM_ELEMENT.remove_first */
extern void T97f43(T0* C);
/* XM_ELEMENT.set_first_cell */
extern void T97f48(T0* C, T0* a1);
/* XM_DOCUMENT.equality_delete */
extern void T96f21(T0* C, T0* a1);
/* XM_DOCUMENT.new_cursor */
extern T0* T96f9(T0* C);
/* XM_DOCUMENT.list_make */
extern void T96f17(T0* C);
/* XM_ELEMENT.make */
extern T0* T97c30(T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.list_make */
extern void T97f32(T0* C);
/* XM_DOCUMENT.default_ns */
extern unsigned char ge1376os5875;
extern T0* ge1376ov5875;
extern T0* T96f7(T0* C);
/* XM_NAMESPACE.make_default */
extern T0* T316c9(void);
/* XM_NAMESPACE.make */
extern void T316f8(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE.make */
extern T0* T316c8(T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_finish */
extern void T173f27(T0* C);
/* XM_CALLBACKS_NULL.on_finish */
extern void T133f3(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T98f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T98f7p1(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_finish */
extern void T95f13(T0* C);
/* XM_NAMESPACE_RESOLVER.on_comment */
extern void T173f28(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_comment */
extern void T133f4(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T98f8(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T98f8p1(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_comment */
extern void T95f14(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.handle_position */
extern void T95f22(T0* C, T0* a1);
/* XM_POSITION_TABLE.put */
extern void T176f3(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].put_last */
extern void T241f8(T0* C, T0* a1);
/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].put_right */
extern void T327f4(T0* C, T0* a1);
/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T327c3(T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].is_empty */
extern T1 T241f5(T0* C);
/* DS_PAIR [XM_POSITION, XM_NODE].make */
extern T0* T325c3(T0* a1, T0* a2);
/* XM_CALLBACKS_TO_TREE_FILTER.is_position_table_enabled */
extern T1 T95f8(T0* C);
/* XM_COMMENT.make_last */
extern T0* T313c4(T0* a1, T0* a2);
/* XM_ELEMENT.force_last */
extern void T97f33(T0* C, T0* a1);
/* XM_ELEMENT.force_last */
extern void T97f33p1(T0* C, T0* a1);
/* XM_ELEMENT.force_last */
extern void T97f33p0(T0* C, T0* a1);
/* XM_ELEMENT.before_addition */
extern void T97f34(T0* C, T0* a1);
/* XM_ELEMENT.last */
extern T0* T97f18(T0* C);
/* XM_ELEMENT.is_empty */
extern T1 T97f17(T0* C);
/* XM_COMMENT.make_last_in_document */
extern T0* T313c3(T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_processing_instruction */
extern void T173f29(T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_NULL.on_processing_instruction */
extern void T133f5(T0* C, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T98f9(T0* C, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T98f9p1(T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_TO_TREE_FILTER.on_processing_instruction */
extern void T95f15(T0* C, T0* a1, T0* a2);
/* XM_PROCESSING_INSTRUCTION.make_last */
extern T0* T314c5(T0* a1, T0* a2, T0* a3);
/* XM_PROCESSING_INSTRUCTION.make_last_in_document */
extern T0* T314c4(T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER.on_content */
extern void T173f30(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_content */
extern void T133f6(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T98f10(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T98f10p1(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_content */
extern void T95f16(T0* C, T0* a1);
/* XM_CHARACTER_DATA.make_last */
extern T0* T315c3(T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_start_tag */
extern void T173f33(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.push */
extern void T238f12(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].force_last */
extern void T275f11(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].put_right */
extern void T353f5(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].attach_left */
extern void T353f6(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T353c4(T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].is_empty */
extern T1 T275f6(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.new_string_string_table */
extern T0* T238f8(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_equality_tester */
extern void T80f45(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.string_equality_tester */
extern T0* T238f9(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map_default */
extern T0* T80c43(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].default_capacity */
extern T6 T80f31(T0* C);
/* XM_CALLBACKS_NULL.on_start_tag */
extern void T133f9(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T98f11(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T98f11p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag */
extern void T95f17(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_last */
extern T0* T97c29(T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_root */
extern T0* T97c28(T0* a1, T0* a2, T0* a3);
/* XM_DOCUMENT.set_root_element */
extern void T96f20(T0* C, T0* a1);
/* XM_DOCUMENT.remove_previous_root_element */
extern void T96f27(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.new_namespace */
extern T0* T95f7(T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_NAMESPACE].force_last */
extern void T312f33(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_put */
extern void T312f40(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].clashes_put */
extern void T312f39(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].slots_item */
extern T6 T312f26(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].hash_position */
extern T6 T312f22(T0* C, T0* a1);
/* XM_NAMESPACE.hash_code */
extern T6 T316f5(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].resize */
extern void T312f38(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_resize */
extern void T312f48(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].key_storage_resize */
extern void T312f47(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_resize */
extern void T312f46(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].resize */
extern T0* T394f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_NAMESPACE].resized_area */
extern T0* T391f3(T0* C, T6 a1);
/* SPECIAL [XM_NAMESPACE].copy_data */
extern void T391f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [XM_NAMESPACE].move_data */
extern void T391f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_NAMESPACE].overlapping_move */
extern void T391f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [XM_NAMESPACE].non_overlapping_move */
extern void T391f8(T0* C, T6 a1, T6 a2, T6 a3);
/* DS_HASH_SET [XM_NAMESPACE].key_storage_item */
extern T0* T312f18(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_item */
extern T0* T312f30(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_item */
extern T6 T312f19(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_resize */
extern void T312f45(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_capacity */
extern T6 T312f21(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_put */
extern void T312f37(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].search_position */
extern void T312f34(T0* C, T0* a1);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].test */
extern T1 T392f1(T0* C, T0* a1, T0* a2);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].any_ */
extern T0* T392f2(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].key_equality_tester */
extern T0* T312f17(T0* C);
/* XM_NAMESPACE.same_prefix */
extern T1 T316f7(T0* C, T0* a1);
/* XM_NAMESPACE.string_ */
extern T0* T316f3(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].item */
extern T0* T312f24(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].has */
extern T1 T312f27(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T173f31(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T173f31p1(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve_default */
extern T0* T238f3(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_pseudo_prefix */
extern unsigned char ge1350os8183;
extern T0* ge1350ov8183;
extern T0* T238f7(T0* C);
/* XM_NAMESPACE_RESOLVER.string_ */
extern T0* T173f11(T0* C);
/* XM_NAMESPACE_RESOLVER.on_delayed_attributes */
extern void T173f37(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_remove */
extern void T173f39(T0* C);
/* DS_LINKED_QUEUE [STRING_8].remove */
extern void T240f8(T0* C);
/* DS_LINKED_QUEUE [STRING_8].wipe_out */
extern void T240f9(T0* C);
/* XM_NAMESPACE_RESOLVER.unprefixed_attribute_namespace */
extern T0* T173f19(T0* C);
/* XM_NAMESPACE_RESOLVER.default_namespace */
extern unsigned char ge1317os7219;
extern T0* ge1317ov7219;
extern T0* T173f23(T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns_namespace */
extern unsigned char ge1317os7227;
extern T0* ge1317ov7227;
extern T0* T173f18(T0* C);
/* XM_NAMESPACE_RESOLVER.is_xmlns */
extern T1 T173f14(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.same_string */
extern T1 T173f21(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.string_equality_tester */
extern T0* T173f24(T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns */
extern unsigned char ge1317os7220;
extern T0* ge1317ov7220;
extern T0* T173f20(T0* C);
/* XM_NAMESPACE_RESOLVER.xml_prefix_namespace */
extern unsigned char ge1317os7226;
extern T0* ge1317ov7226;
extern T0* T173f17(T0* C);
/* XM_NAMESPACE_RESOLVER.is_xml */
extern T1 T173f16(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.xml_prefix */
extern unsigned char ge1317os7221;
extern T0* ge1317ov7221;
extern T0* T173f22(T0* C);
/* DS_LINKED_QUEUE [STRING_8].item */
extern T0* T240f5(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_is_empty */
extern T1 T173f15(T0* C);
/* DS_LINKED_QUEUE [STRING_8].is_empty */
extern T1 T240f4(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve */
extern T0* T238f2(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].back */
extern void T276f10(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_back */
extern void T275f18(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].add_traversing_cursor */
extern void T275f19(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_next_cursor */
extern void T276f12(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_traversing_cursor */
extern void T275f20(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set */
extern void T276f13(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].go_before */
extern void T276f9(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_go_before */
extern void T275f17(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_before */
extern void T276f14(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_off */
extern T1 T275f8(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item */
extern T0* T80f23(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_item */
extern T0* T80f28(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].has */
extern T1 T80f22(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].item */
extern T0* T276f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].finish */
extern void T276f8(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_finish */
extern void T275f16(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_namespace */
extern unsigned char ge1350os8184;
extern T0* ge1350ov8184;
extern T0* T238f6(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.has */
extern T1 T238f5(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.has_prefix */
extern T1 T173f9(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_start_tag_finish */
extern void T133f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T98f12(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T98f12p1(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag_finish */
extern void T95f18(T0* C);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T173f32(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.pop */
extern void T238f11(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_last */
extern void T275f10(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].set_last_cell */
extern void T275f14(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].forget_right */
extern void T353f7(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_last_cursors_after */
extern void T275f13(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_after */
extern void T276f11(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].wipe_out */
extern void T275f12(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_all_cursors_after */
extern void T275f15(T0* C);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T173f32p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_NULL.on_end_tag */
extern void T133f8(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T98f13(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T98f13p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_end_tag */
extern void T95f19(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.parent_element */
extern T0* T97f14(T0* C);
/* XM_DOCUMENT.process */
extern void T96f22(T0* C, T0* a1);
/* XM_NODE_TYPER.process_document */
extern void T320f13(T0* C, T0* a1);
/* XM_ELEMENT.is_root_node */
extern T1 T97f22(T0* C);
/* XM_DOCUMENT.is_root_node */
extern T1 T96f10(T0* C);
/* XM_NAMESPACE_RESOLVER.on_error */
extern void T173f35(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_error */
extern void T133f11(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T98f14(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T98f14p1(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_error */
extern void T95f20(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_attribute */
extern void T173f34(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add */
extern void T238f14(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force_new */
extern void T80f54(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].last */
extern T0* T275f5(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.shallow_has */
extern T1 T238f4(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.attributes_force */
extern void T173f38(T0* C, T0* a1, T0* a2, T0* a3);
/* DS_LINKED_QUEUE [STRING_8].force */
extern void T240f7(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add_default */
extern void T238f13(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_attribute */
extern void T133f10(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T98f15(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T98f15p1(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_CALLBACKS_TO_TREE_FILTER.on_attribute */
extern void T95f21(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_ATTRIBUTE.make_last */
extern T0* T190c5(T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER.on_xml_declaration */
extern void T173f41(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_CALLBACKS_NULL.on_xml_declaration */
extern void T133f12(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_STOP_ON_ERROR_FILTER.on_xml_declaration */
extern void T98f16(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_xml_declaration */
extern void T95f23(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_NAMESPACE_RESOLVER.set_next */
extern void T173f40(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.set_next */
extern void T98f5(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.set_next */
extern void T95f11(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_start */
extern void T80f55(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].add_traversing_cursor */
extern void T80f64(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].remove_traversing_cursor */
extern void T80f63(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_off */
extern T1 T80f38(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].is_empty */
extern T1 T80f37(T0* C);
/* GEANT_ARGUMENT_VARIABLES.cursor_start */
extern void T34f69(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.add_traversing_cursor */
extern void T34f72(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.remove_traversing_cursor */
extern void T34f71(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_off */
extern T1 T34f43(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.is_empty */
extern T1 T34f42(T0* C);
/* GEANT_VARIABLES.cursor_start */
extern void T29f68(T0* C, T0* a1);
/* GEANT_VARIABLES.add_traversing_cursor */
extern void T29f71(T0* C, T0* a1);
/* GEANT_VARIABLES.remove_traversing_cursor */
extern void T29f70(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_off */
extern T1 T29f42(T0* C, T0* a1);
/* GEANT_VARIABLES.is_empty */
extern T1 T29f41(T0* C);
/* GEANT_PROJECT_VARIABLES.cursor_start */
extern void T25f81(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.add_traversing_cursor */
extern void T25f84(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.remove_traversing_cursor */
extern void T25f83(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_off */
extern T1 T25f50(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.is_empty */
extern T1 T25f49(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_forth */
extern void T80f56(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_forth */
extern void T34f70(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_forth */
extern void T29f69(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_forth */
extern void T25f82(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.reset */
extern void T73f41(T0* C);
/* AP_STRING_OPTION.reset */
extern void T37f28(T0* C);
/* AP_FLAG.reset */
extern void T35f23(T0* C);
/* AP_DISPLAY_HELP_FLAG.record_occurrence */
extern void T73f42(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.display_help */
extern void T73f43(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.exceptions */
extern T0* T73f16(T0* C);
/* AP_ERROR_HANDLER.report_info_message */
extern void T45f11(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.full_help_text */
extern T0* T73f15(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.option_help_text */
extern T0* T73f24(T0* C, T0* a1, T6 a2);
/* STRING_8.make_filled */
extern T0* T17c53(T2 a1, T6 a2);
/* STRING_8.fill_character */
extern void T17f55(T0* C, T2 a1);
/* SPECIAL [CHARACTER_8].fill_with */
extern void T15f14(T0* C, T2 a1, T6 a2, T6 a3);
/* DS_QUICK_SORTER [AP_OPTION].sort */
extern void T308f3(T0* C, T0* a1);
/* DS_QUICK_SORTER [AP_OPTION].sort_with_comparator */
extern void T308f4(T0* C, T0* a1, T0* a2);
/* DS_QUICK_SORTER [AP_OPTION].subsort_with_comparator */
extern void T308f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* ARRAY [INTEGER_32].force */
extern void T193f13(T0* C, T6 a1, T6 a2);
/* ARRAY [INTEGER_32].auto_resize */
extern void T193f14(T0* C, T6 a1, T6 a2);
/* ARRAY [INTEGER_32].capacity */
extern T6 T193f7(T0* C);
/* SPECIAL [INTEGER_32].aliased_resized_area */
extern T0* T63f4(T0* C, T6 a1);
/* ARRAY [INTEGER_32].additional_space */
extern T6 T193f6(T0* C);
/* ARRAY [INTEGER_32].empty_area */
extern T1 T193f5(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].swap */
extern void T74f30(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [AP_OPTION].replace */
extern void T74f29(T0* C, T0* a1, T6 a2);
/* AP_OPTION_COMPARATOR.less_than */
extern T1 T307f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.three_way_comparison */
extern T6 T76f14(T0* C, T0* a1, T0* a2);
/* AP_OPTION_COMPARATOR.string_ */
extern T0* T307f2(T0* C);
/* ST_WORD_WRAPPER.wrapped_string */
extern T0* T310f5(T0* C, T0* a1);
/* ST_WORD_WRAPPER.canonify_whitespace */
extern void T310f12(T0* C, T0* a1);
/* UC_UTF8_STRING.put */
extern void T195f81(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.move_bytes_right */
extern void T195f82(T0* C, T6 a1, T6 a2);
/* ST_WORD_WRAPPER.is_space */
extern T1 T310f8(T0* C, T2 a1);
/* ST_WORD_WRAPPER.string_ */
extern T0* T310f4(T0* C);
/* ST_WORD_WRAPPER.set_new_line_indentation */
extern void T310f10(T0* C, T6 a1);
/* AP_DISPLAY_HELP_FLAG.wrapper */
extern unsigned char ge153os4892;
extern T0* ge153ov4892;
extern T0* T73f19(T0* C);
/* ST_WORD_WRAPPER.set_maximum_text_width */
extern void T310f11(T0* C, T6 a1);
/* ST_WORD_WRAPPER.make */
extern T0* T310c9(void);
/* AP_DISPLAY_HELP_FLAG.full_usage_instruction */
extern T0* T73f17(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.alternative_usage_instruction */
extern T0* T73f26(T0* C, T0* a1, T0* a2);
/* AP_DISPLAY_HELP_FLAG.arguments */
extern T0* T73f30(T0* C);
/* AP_DISPLAY_HELP_FLAG.file_system */
extern T0* T73f29(T0* C);
/* AP_DISPLAY_HELP_FLAG.unix_file_system */
extern T0* T73f35(T0* C);
/* AP_DISPLAY_HELP_FLAG.windows_file_system */
extern T0* T73f34(T0* C);
/* AP_DISPLAY_HELP_FLAG.operating_system */
extern T0* T73f33(T0* C);
/* AP_DISPLAY_HELP_FLAG.usage_instruction */
extern T0* T73f25(T0* C, T0* a1);
/* DS_QUICK_SORTER [AP_OPTION].make */
extern T0* T308c2(T0* a1);
/* AP_OPTION_COMPARATOR.default_create */
extern T0* T307c3(void);
/* AP_STRING_OPTION.record_occurrence */
extern void T37f30(T0* C, T0* a1);
/* AP_FLAG.record_occurrence */
extern void T35f25(T0* C, T0* a1);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T520f3(T0* C, T6 a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T518f2(T0* C, T6 a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T516f3(T0* C, T6 a1);
/* GEANT_REPLACE_TASK.is_executable */
extern T1 T306f5(T0* C);
/* GEANT_REPLACE_COMMAND.is_executable */
extern T1 T390f15(T0* C);
/* KL_BOOLEAN_ROUTINES.nxor */
extern T1 T417f1(T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.is_fileset_to_directory_executable */
extern T1 T390f13(T0* C);
/* GEANT_REPLACE_COMMAND.boolean_ */
extern unsigned char ge168os5267;
extern T0* ge168ov5267;
extern T0* T390f17(T0* C);
/* KL_BOOLEAN_ROUTINES.default_create */
extern T0* T417c2(void);
/* GEANT_INPUT_TASK.is_executable */
extern T1 T305f5(T0* C);
/* GEANT_INPUT_COMMAND.is_executable */
extern T1 T389f10(T0* C);
/* GEANT_AVAILABLE_TASK.is_executable */
extern T1 T304f5(T0* C);
/* GEANT_AVAILABLE_COMMAND.is_executable */
extern T1 T388f7(T0* C);
/* GEANT_AVAILABLE_COMMAND.is_file_executable */
extern T1 T388f8(T0* C);
/* GEANT_PRECURSOR_TASK.is_executable */
extern T1 T303f5(T0* C);
/* GEANT_PRECURSOR_COMMAND.is_executable */
extern T1 T387f6(T0* C);
/* GEANT_EXIT_TASK.is_executable */
extern T1 T302f5(T0* C);
/* GEANT_EXIT_COMMAND.is_executable */
extern T1 T386f4(T0* C);
/* GEANT_OUTOFDATE_TASK.is_executable */
extern T1 T301f5(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_executable */
extern T1 T385f12(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_fileset_executable */
extern T1 T385f10(T0* C);
/* GEANT_XSLT_TASK.is_executable */
extern T1 T300f5(T0* C);
/* GEANT_XSLT_COMMAND.is_executable */
extern T1 T382f14(T0* C);
/* GEANT_SETENV_TASK.is_executable */
extern T1 T299f5(T0* C);
/* GEANT_SETENV_COMMAND.is_executable */
extern T1 T381f6(T0* C);
/* GEANT_MOVE_TASK.is_executable */
extern T1 T298f5(T0* C);
/* GEANT_MOVE_COMMAND.is_executable */
extern T1 T380f9(T0* C);
/* GEANT_MOVE_COMMAND.is_fileset_to_directory_executable */
extern T1 T380f7(T0* C);
/* GEANT_COPY_TASK.is_executable */
extern T1 T297f5(T0* C);
/* GEANT_COPY_COMMAND.is_executable */
extern T1 T379f10(T0* C);
/* GEANT_COPY_COMMAND.is_fileset_to_directory_executable */
extern T1 T379f8(T0* C);
/* GEANT_COPY_COMMAND.boolean_ */
extern T0* T379f11(T0* C);
/* GEANT_DELETE_TASK.is_executable */
extern T1 T296f5(T0* C);
/* GEANT_DELETE_COMMAND.is_executable */
extern T1 T376f11(T0* C);
/* GEANT_DELETE_COMMAND.boolean_ */
extern T0* T376f12(T0* C);
/* GEANT_MKDIR_TASK.is_executable */
extern T1 T295f5(T0* C);
/* GEANT_MKDIR_COMMAND.is_executable */
extern T1 T375f4(T0* C);
/* GEANT_ECHO_TASK.is_executable */
extern T1 T294f5(T0* C);
/* GEANT_ECHO_COMMAND.is_executable */
extern T1 T374f6(T0* C);
/* GEANT_GEANT_TASK.is_executable */
extern T1 T293f5(T0* C);
/* GEANT_GEANT_COMMAND.is_executable */
extern T1 T372f12(T0* C);
/* GEANT_GEANT_COMMAND.is_target_executable */
extern T1 T372f11(T0* C);
/* GEANT_GETEST_TASK.is_executable */
extern T1 T292f5(T0* C);
/* GEANT_GETEST_COMMAND.is_executable */
extern T1 T371f14(T0* C);
/* GEANT_GEPP_TASK.is_executable */
extern T1 T291f5(T0* C);
/* GEANT_GEPP_COMMAND.is_executable */
extern T1 T370f12(T0* C);
/* GEANT_GEPP_COMMAND.is_fileset_executable */
extern T1 T370f11(T0* C);
/* GEANT_GEYACC_TASK.is_executable */
extern T1 T290f5(T0* C);
/* GEANT_GEYACC_COMMAND.is_executable */
extern T1 T369f12(T0* C);
/* GEANT_GELEX_TASK.is_executable */
extern T1 T289f5(T0* C);
/* GEANT_GELEX_COMMAND.is_executable */
extern T1 T368f14(T0* C);
/* GEANT_GEXACE_TASK.is_executable */
extern T1 T288f5(T0* C);
/* GEANT_GEXACE_COMMAND.is_executable */
extern T1 T366f16(T0* C);
/* GEANT_GEXACE_COMMAND.boolean_ */
extern T0* T366f12(T0* C);
/* GEANT_UNSET_TASK.is_executable */
extern T1 T287f5(T0* C);
/* GEANT_UNSET_COMMAND.is_executable */
extern T1 T365f4(T0* C);
/* GEANT_SET_TASK.is_executable */
extern T1 T286f5(T0* C);
/* GEANT_SET_COMMAND.is_executable */
extern T1 T364f6(T0* C);
/* GEANT_LCC_TASK.is_executable */
extern T1 T285f5(T0* C);
/* GEANT_LCC_COMMAND.is_executable */
extern T1 T363f6(T0* C);
/* GEANT_EXEC_TASK.is_executable */
extern T1 T284f5(T0* C);
/* GEANT_EXEC_COMMAND.is_executable */
extern T1 T360f8(T0* C);
/* GEANT_EXEC_COMMAND.is_fileset_executable */
extern T1 T360f10(T0* C);
/* GEANT_VE_TASK.is_executable */
extern T1 T283f5(T0* C);
/* GEANT_VE_COMMAND.is_executable */
extern T1 T359f14(T0* C);
/* GEANT_VE_COMMAND.is_cleanable */
extern T1 T359f11(T0* C);
/* GEANT_ISE_TASK.is_executable */
extern T1 T282f5(T0* C);
/* GEANT_ISE_COMMAND.is_executable */
extern T1 T358f12(T0* C);
/* GEANT_ISE_COMMAND.is_cleanable */
extern T1 T358f10(T0* C);
/* GEANT_SE_TASK.is_executable */
extern T1 T281f5(T0* C);
/* GEANT_SE_COMMAND.is_executable */
extern T1 T357f14(T0* C);
/* GEANT_SE_COMMAND.is_traditional_configuration */
extern T1 T357f11(T0* C);
/* GEANT_GEC_TASK.is_executable */
extern T1 T280f5(T0* C);
/* GEANT_GEC_COMMAND.is_executable */
extern T1 T356f12(T0* C);
/* GEANT_REPLACE_TASK.is_enabled */
extern T1 T306f7(T0* C);
/* GEANT_REPLACE_TASK.unless_attribute_name */
extern T0* T306f11(T0* C);
/* GEANT_REPLACE_TASK.if_attribute_name */
extern T0* T306f8(T0* C);
/* GEANT_INPUT_TASK.is_enabled */
extern T1 T305f7(T0* C);
/* GEANT_INPUT_TASK.unless_attribute_name */
extern T0* T305f11(T0* C);
/* GEANT_INPUT_TASK.if_attribute_name */
extern T0* T305f8(T0* C);
/* GEANT_AVAILABLE_TASK.is_enabled */
extern T1 T304f7(T0* C);
/* GEANT_AVAILABLE_TASK.unless_attribute_name */
extern T0* T304f11(T0* C);
/* GEANT_AVAILABLE_TASK.if_attribute_name */
extern T0* T304f8(T0* C);
/* GEANT_PRECURSOR_TASK.is_enabled */
extern T1 T303f7(T0* C);
/* GEANT_PRECURSOR_TASK.unless_attribute_name */
extern T0* T303f11(T0* C);
/* GEANT_PRECURSOR_TASK.if_attribute_name */
extern T0* T303f8(T0* C);
/* GEANT_EXIT_TASK.is_enabled */
extern T1 T302f7(T0* C);
/* GEANT_EXIT_TASK.unless_attribute_name */
extern T0* T302f11(T0* C);
/* GEANT_EXIT_TASK.if_attribute_name */
extern T0* T302f8(T0* C);
/* GEANT_OUTOFDATE_TASK.is_enabled */
extern T1 T301f7(T0* C);
/* GEANT_OUTOFDATE_TASK.unless_attribute_name */
extern T0* T301f11(T0* C);
/* GEANT_OUTOFDATE_TASK.if_attribute_name */
extern T0* T301f8(T0* C);
/* GEANT_XSLT_TASK.is_enabled */
extern T1 T300f7(T0* C);
/* GEANT_XSLT_TASK.unless_attribute_name */
extern T0* T300f11(T0* C);
/* GEANT_XSLT_TASK.if_attribute_name */
extern T0* T300f8(T0* C);
/* GEANT_SETENV_TASK.is_enabled */
extern T1 T299f7(T0* C);
/* GEANT_SETENV_TASK.unless_attribute_name */
extern T0* T299f11(T0* C);
/* GEANT_SETENV_TASK.if_attribute_name */
extern T0* T299f8(T0* C);
/* GEANT_MOVE_TASK.is_enabled */
extern T1 T298f7(T0* C);
/* GEANT_MOVE_TASK.unless_attribute_name */
extern T0* T298f11(T0* C);
/* GEANT_MOVE_TASK.if_attribute_name */
extern T0* T298f8(T0* C);
/* GEANT_COPY_TASK.is_enabled */
extern T1 T297f7(T0* C);
/* GEANT_COPY_TASK.unless_attribute_name */
extern T0* T297f11(T0* C);
/* GEANT_COPY_TASK.if_attribute_name */
extern T0* T297f8(T0* C);
/* GEANT_DELETE_TASK.is_enabled */
extern T1 T296f7(T0* C);
/* GEANT_DELETE_TASK.unless_attribute_name */
extern T0* T296f11(T0* C);
/* GEANT_DELETE_TASK.if_attribute_name */
extern T0* T296f8(T0* C);
/* GEANT_MKDIR_TASK.is_enabled */
extern T1 T295f7(T0* C);
/* GEANT_MKDIR_TASK.unless_attribute_name */
extern T0* T295f11(T0* C);
/* GEANT_MKDIR_TASK.if_attribute_name */
extern T0* T295f8(T0* C);
/* GEANT_ECHO_TASK.is_enabled */
extern T1 T294f7(T0* C);
/* GEANT_ECHO_TASK.unless_attribute_name */
extern T0* T294f11(T0* C);
/* GEANT_ECHO_TASK.if_attribute_name */
extern T0* T294f8(T0* C);
/* GEANT_GEANT_TASK.is_enabled */
extern T1 T293f7(T0* C);
/* GEANT_GEANT_TASK.unless_attribute_name */
extern T0* T293f11(T0* C);
/* GEANT_GEANT_TASK.if_attribute_name */
extern T0* T293f8(T0* C);
/* GEANT_GETEST_TASK.is_enabled */
extern T1 T292f7(T0* C);
/* GEANT_GETEST_TASK.unless_attribute_name */
extern T0* T292f11(T0* C);
/* GEANT_GETEST_TASK.if_attribute_name */
extern T0* T292f8(T0* C);
/* GEANT_GEPP_TASK.is_enabled */
extern T1 T291f7(T0* C);
/* GEANT_GEPP_TASK.unless_attribute_name */
extern T0* T291f11(T0* C);
/* GEANT_GEPP_TASK.if_attribute_name */
extern T0* T291f8(T0* C);
/* GEANT_GEYACC_TASK.is_enabled */
extern T1 T290f7(T0* C);
/* GEANT_GEYACC_TASK.unless_attribute_name */
extern T0* T290f11(T0* C);
/* GEANT_GEYACC_TASK.if_attribute_name */
extern T0* T290f8(T0* C);
/* GEANT_GELEX_TASK.is_enabled */
extern T1 T289f7(T0* C);
/* GEANT_GELEX_TASK.unless_attribute_name */
extern T0* T289f11(T0* C);
/* GEANT_GELEX_TASK.if_attribute_name */
extern T0* T289f8(T0* C);
/* GEANT_GEXACE_TASK.is_enabled */
extern T1 T288f7(T0* C);
/* GEANT_GEXACE_TASK.unless_attribute_name */
extern T0* T288f11(T0* C);
/* GEANT_GEXACE_TASK.if_attribute_name */
extern T0* T288f8(T0* C);
/* GEANT_UNSET_TASK.is_enabled */
extern T1 T287f7(T0* C);
/* GEANT_UNSET_TASK.unless_attribute_name */
extern T0* T287f11(T0* C);
/* GEANT_UNSET_TASK.if_attribute_name */
extern T0* T287f8(T0* C);
/* GEANT_SET_TASK.is_enabled */
extern T1 T286f7(T0* C);
/* GEANT_SET_TASK.unless_attribute_name */
extern T0* T286f11(T0* C);
/* GEANT_SET_TASK.if_attribute_name */
extern T0* T286f8(T0* C);
/* GEANT_LCC_TASK.is_enabled */
extern T1 T285f7(T0* C);
/* GEANT_LCC_TASK.unless_attribute_name */
extern T0* T285f11(T0* C);
/* GEANT_LCC_TASK.if_attribute_name */
extern T0* T285f8(T0* C);
/* GEANT_EXEC_TASK.is_enabled */
extern T1 T284f7(T0* C);
/* GEANT_EXEC_TASK.unless_attribute_name */
extern T0* T284f11(T0* C);
/* GEANT_EXEC_TASK.if_attribute_name */
extern T0* T284f8(T0* C);
/* GEANT_VE_TASK.is_enabled */
extern T1 T283f7(T0* C);
/* GEANT_VE_TASK.unless_attribute_name */
extern T0* T283f11(T0* C);
/* GEANT_VE_TASK.if_attribute_name */
extern T0* T283f8(T0* C);
/* GEANT_ISE_TASK.is_enabled */
extern T1 T282f7(T0* C);
/* GEANT_ISE_TASK.unless_attribute_name */
extern T0* T282f11(T0* C);
/* GEANT_ISE_TASK.if_attribute_name */
extern T0* T282f8(T0* C);
/* GEANT_SE_TASK.is_enabled */
extern T1 T281f7(T0* C);
/* GEANT_SE_TASK.unless_attribute_name */
extern T0* T281f11(T0* C);
/* GEANT_SE_TASK.if_attribute_name */
extern T0* T281f8(T0* C);
/* GEANT_GEC_TASK.is_enabled */
extern T1 T280f7(T0* C);
/* GEANT_GEC_TASK.unless_attribute_name */
extern T0* T280f11(T0* C);
/* GEANT_GEC_TASK.if_attribute_name */
extern T0* T280f8(T0* C);
/* GEANT_REPLACE_TASK.is_exit_command */
extern T1 T306f10(T0* C);
/* GEANT_REPLACE_COMMAND.is_exit_command */
extern T1 T390f14(T0* C);
/* GEANT_INPUT_TASK.is_exit_command */
extern T1 T305f10(T0* C);
/* GEANT_INPUT_COMMAND.is_exit_command */
extern T1 T389f9(T0* C);
/* GEANT_AVAILABLE_TASK.is_exit_command */
extern T1 T304f10(T0* C);
/* GEANT_AVAILABLE_COMMAND.is_exit_command */
extern T1 T388f9(T0* C);
/* GEANT_PRECURSOR_TASK.is_exit_command */
extern T1 T303f10(T0* C);
/* GEANT_PRECURSOR_COMMAND.is_exit_command */
extern T1 T387f5(T0* C);
/* GEANT_EXIT_TASK.is_exit_command */
extern T1 T302f10(T0* C);
/* GEANT_OUTOFDATE_TASK.is_exit_command */
extern T1 T301f10(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_exit_command */
extern T1 T385f11(T0* C);
/* GEANT_XSLT_TASK.is_exit_command */
extern T1 T300f10(T0* C);
/* GEANT_XSLT_COMMAND.is_exit_command */
extern T1 T382f15(T0* C);
/* GEANT_SETENV_TASK.is_exit_command */
extern T1 T299f10(T0* C);
/* GEANT_SETENV_COMMAND.is_exit_command */
extern T1 T381f5(T0* C);
/* GEANT_MOVE_TASK.is_exit_command */
extern T1 T298f10(T0* C);
/* GEANT_MOVE_COMMAND.is_exit_command */
extern T1 T380f8(T0* C);
/* GEANT_COPY_TASK.is_exit_command */
extern T1 T297f10(T0* C);
/* GEANT_COPY_COMMAND.is_exit_command */
extern T1 T379f9(T0* C);
/* GEANT_DELETE_TASK.is_exit_command */
extern T1 T296f10(T0* C);
/* GEANT_DELETE_COMMAND.is_exit_command */
extern T1 T376f10(T0* C);
/* GEANT_MKDIR_TASK.is_exit_command */
extern T1 T295f10(T0* C);
/* GEANT_MKDIR_COMMAND.is_exit_command */
extern T1 T375f5(T0* C);
/* GEANT_ECHO_TASK.is_exit_command */
extern T1 T294f10(T0* C);
/* GEANT_ECHO_COMMAND.is_exit_command */
extern T1 T374f7(T0* C);
/* GEANT_GEANT_TASK.is_exit_command */
extern T1 T293f10(T0* C);
/* GEANT_GEANT_COMMAND.is_exit_command */
extern T1 T372f13(T0* C);
/* GEANT_GETEST_TASK.is_exit_command */
extern T1 T292f10(T0* C);
/* GEANT_GETEST_COMMAND.is_exit_command */
extern T1 T371f15(T0* C);
/* GEANT_GEPP_TASK.is_exit_command */
extern T1 T291f10(T0* C);
/* GEANT_GEPP_COMMAND.is_exit_command */
extern T1 T370f13(T0* C);
/* GEANT_GEYACC_TASK.is_exit_command */
extern T1 T290f10(T0* C);
/* GEANT_GEYACC_COMMAND.is_exit_command */
extern T1 T369f11(T0* C);
/* GEANT_GELEX_TASK.is_exit_command */
extern T1 T289f10(T0* C);
/* GEANT_GELEX_COMMAND.is_exit_command */
extern T1 T368f15(T0* C);
/* GEANT_GEXACE_TASK.is_exit_command */
extern T1 T288f10(T0* C);
/* GEANT_GEXACE_COMMAND.is_exit_command */
extern T1 T366f11(T0* C);
/* GEANT_UNSET_TASK.is_exit_command */
extern T1 T287f10(T0* C);
/* GEANT_UNSET_COMMAND.is_exit_command */
extern T1 T365f5(T0* C);
/* GEANT_SET_TASK.is_exit_command */
extern T1 T286f10(T0* C);
/* GEANT_SET_COMMAND.is_exit_command */
extern T1 T364f5(T0* C);
/* GEANT_LCC_TASK.is_exit_command */
extern T1 T285f10(T0* C);
/* GEANT_LCC_COMMAND.is_exit_command */
extern T1 T363f5(T0* C);
/* GEANT_EXEC_TASK.is_exit_command */
extern T1 T284f10(T0* C);
/* GEANT_EXEC_COMMAND.is_exit_command */
extern T1 T360f7(T0* C);
/* GEANT_VE_TASK.is_exit_command */
extern T1 T283f10(T0* C);
/* GEANT_VE_COMMAND.is_exit_command */
extern T1 T359f13(T0* C);
/* GEANT_ISE_TASK.is_exit_command */
extern T1 T282f10(T0* C);
/* GEANT_ISE_COMMAND.is_exit_command */
extern T1 T358f11(T0* C);
/* GEANT_SE_TASK.is_exit_command */
extern T1 T281f10(T0* C);
/* GEANT_SE_COMMAND.is_exit_command */
extern T1 T357f13(T0* C);
/* GEANT_GEC_TASK.is_exit_command */
extern T1 T280f10(T0* C);
/* GEANT_GEC_COMMAND.is_exit_command */
extern T1 T356f15(T0* C);
/* GEANT_REPLACE_TASK.exit_code */
extern T6 T306f4(T0* C);
/* GEANT_INPUT_TASK.exit_code */
extern T6 T305f4(T0* C);
/* GEANT_AVAILABLE_TASK.exit_code */
extern T6 T304f4(T0* C);
/* GEANT_PRECURSOR_TASK.exit_code */
extern T6 T303f4(T0* C);
/* GEANT_EXIT_TASK.exit_code */
extern T6 T302f4(T0* C);
/* GEANT_OUTOFDATE_TASK.exit_code */
extern T6 T301f4(T0* C);
/* GEANT_XSLT_TASK.exit_code */
extern T6 T300f4(T0* C);
/* GEANT_SETENV_TASK.exit_code */
extern T6 T299f4(T0* C);
/* GEANT_MOVE_TASK.exit_code */
extern T6 T298f4(T0* C);
/* GEANT_COPY_TASK.exit_code */
extern T6 T297f4(T0* C);
/* GEANT_DELETE_TASK.exit_code */
extern T6 T296f4(T0* C);
/* GEANT_MKDIR_TASK.exit_code */
extern T6 T295f4(T0* C);
/* GEANT_ECHO_TASK.exit_code */
extern T6 T294f4(T0* C);
/* GEANT_GEANT_TASK.exit_code */
extern T6 T293f4(T0* C);
/* GEANT_GETEST_TASK.exit_code */
extern T6 T292f4(T0* C);
/* GEANT_GEPP_TASK.exit_code */
extern T6 T291f4(T0* C);
/* GEANT_GEYACC_TASK.exit_code */
extern T6 T290f4(T0* C);
/* GEANT_GELEX_TASK.exit_code */
extern T6 T289f4(T0* C);
/* GEANT_GEXACE_TASK.exit_code */
extern T6 T288f4(T0* C);
/* GEANT_UNSET_TASK.exit_code */
extern T6 T287f4(T0* C);
/* GEANT_SET_TASK.exit_code */
extern T6 T286f4(T0* C);
/* GEANT_LCC_TASK.exit_code */
extern T6 T285f4(T0* C);
/* GEANT_EXEC_TASK.exit_code */
extern T6 T284f4(T0* C);
/* GEANT_VE_TASK.exit_code */
extern T6 T283f4(T0* C);
/* GEANT_ISE_TASK.exit_code */
extern T6 T282f4(T0* C);
/* GEANT_SE_TASK.exit_code */
extern T6 T281f4(T0* C);
/* GEANT_GEC_TASK.exit_code */
extern T6 T280f4(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.error_position */
extern T0* T172f57(T0* C);
/* XM_DEFAULT_POSITION.make */
extern T0* T129c5(T0* a1, T6 a2, T6 a3, T6 a4);
/* XM_EIFFEL_SCANNER_DTD.error_position */
extern T0* T170f55(T0* C);
/* XM_EIFFEL_ENTITY_DEF.error_position */
extern T0* T166f56(T0* C);
/* XM_EIFFEL_SCANNER.error_position */
extern T0* T128f63(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.end_of_file */
extern T1 T172f60(T0* C);
/* XM_EIFFEL_SCANNER_DTD.end_of_file */
extern T1 T170f61(T0* C);
/* XM_EIFFEL_ENTITY_DEF.end_of_file */
extern T1 T166f59(T0* C);
/* XM_EIFFEL_SCANNER.end_of_file */
extern T1 T128f65(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_applicable_encoding */
extern T1 T172f61(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_applicable_encoding */
extern T1 T196f16(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_valid_encoding */
extern T1 T196f9(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.is_applicable_encoding */
extern T1 T170f48(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.is_applicable_encoding */
extern T1 T166f60(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.is_applicable_encoding */
extern T1 T128f66(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.start_condition */
extern T6 T172f62(T0* C);
/* XM_EIFFEL_SCANNER_DTD.start_condition */
extern T6 T170f50(T0* C);
/* XM_EIFFEL_ENTITY_DEF.start_condition */
extern T6 T166f61(T0* C);
/* XM_EIFFEL_SCANNER.start_condition */
extern T6 T128f43(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_after */
extern T1 T80f25(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_after */
extern T1 T34f35(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_after */
extern T1 T29f38(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_after */
extern T1 T25f46(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_key */
extern T0* T80f26(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_key */
extern T0* T34f36(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_key */
extern T0* T29f39(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_key */
extern T0* T25f47(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_item */
extern T0* T80f27(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_item */
extern T0* T34f45(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_item */
extern T0* T29f44(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_item */
extern T0* T25f52(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_cursor */
extern T0* T80f40(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].make */
extern T0* T64c7(T0* a1);
/* GEANT_ARGUMENT_VARIABLES.new_cursor */
extern T0* T34f30(T0* C);
/* GEANT_VARIABLES.new_cursor */
extern T0* T29f30(T0* C);
/* GEANT_PROJECT_VARIABLES.new_cursor */
extern T0* T25f35(T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.default_message */
extern T0* T501f5(T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.message */
extern T0* T501f3(T0* C, T0* a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.arguments */
extern T0* T501f6(T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.string_ */
extern T0* T501f4(T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.default_message */
extern T0* T486f5(T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.message */
extern T0* T486f3(T0* C, T0* a1);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.arguments */
extern T0* T486f6(T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.string_ */
extern T0* T486f4(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.default_message */
extern T0* T485f5(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.message */
extern T0* T485f3(T0* C, T0* a1);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.arguments */
extern T0* T485f6(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.string_ */
extern T0* T485f4(T0* C);
/* LX_FULL_AND_REJECT_ERROR.default_message */
extern T0* T484f5(T0* C);
/* LX_FULL_AND_REJECT_ERROR.message */
extern T0* T484f3(T0* C, T0* a1);
/* LX_FULL_AND_REJECT_ERROR.arguments */
extern T0* T484f6(T0* C);
/* LX_FULL_AND_REJECT_ERROR.string_ */
extern T0* T484f4(T0* C);
/* LX_FULL_AND_META_ERROR.default_message */
extern T0* T483f5(T0* C);
/* LX_FULL_AND_META_ERROR.message */
extern T0* T483f3(T0* C, T0* a1);
/* LX_FULL_AND_META_ERROR.arguments */
extern T0* T483f6(T0* C);
/* LX_FULL_AND_META_ERROR.string_ */
extern T0* T483f4(T0* C);
/* LX_BAD_CHARACTER_ERROR.default_message */
extern T0* T482f5(T0* C);
/* LX_BAD_CHARACTER_ERROR.message */
extern T0* T482f3(T0* C, T0* a1);
/* LX_BAD_CHARACTER_ERROR.arguments */
extern T0* T482f6(T0* C);
/* LX_BAD_CHARACTER_ERROR.string_ */
extern T0* T482f4(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.default_message */
extern T0* T481f5(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.message */
extern T0* T481f3(T0* C, T0* a1);
/* LX_BAD_CHARACTER_CLASS_ERROR.arguments */
extern T0* T481f6(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.string_ */
extern T0* T481f4(T0* C);
/* LX_MISSING_QUOTE_ERROR.default_message */
extern T0* T480f5(T0* C);
/* LX_MISSING_QUOTE_ERROR.message */
extern T0* T480f3(T0* C, T0* a1);
/* LX_MISSING_QUOTE_ERROR.arguments */
extern T0* T480f6(T0* C);
/* LX_MISSING_QUOTE_ERROR.string_ */
extern T0* T480f4(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.default_message */
extern T0* T479f5(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.message */
extern T0* T479f3(T0* C, T0* a1);
/* LX_UNRECOGNIZED_RULE_ERROR.arguments */
extern T0* T479f6(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.string_ */
extern T0* T479f4(T0* C);
/* UT_SYNTAX_ERROR.default_message */
extern T0* T477f5(T0* C);
/* UT_SYNTAX_ERROR.message */
extern T0* T477f3(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.arguments */
extern T0* T477f6(T0* C);
/* UT_SYNTAX_ERROR.string_ */
extern T0* T477f4(T0* C);
/* UT_VERSION_NUMBER.default_message */
extern T0* T49f2(T0* C);
/* UT_VERSION_NUMBER.message */
extern T0* T49f4(T0* C, T0* a1);
/* UT_VERSION_NUMBER.arguments */
extern T0* T49f6(T0* C);
/* UT_VERSION_NUMBER.string_ */
extern T0* T49f5(T0* C);
/* AP_DISPLAY_HELP_FLAG.was_found */
extern T1 T73f11(T0* C);
/* AP_STRING_OPTION.was_found */
extern T1 T37f16(T0* C);
/* AP_FLAG.was_found */
extern T1 T35f9(T0* C);
/* AP_STRING_OPTION.occurrences */
extern T6 T37f18(T0* C);
/* AP_DISPLAY_HELP_FLAG.allows_parameter */
extern T1 T73f9(T0* C);
/* AP_STRING_OPTION.allows_parameter */
extern T1 T37f17(T0* C);
/* AP_FLAG.allows_parameter */
extern T1 T35f12(T0* C);
/* AP_DISPLAY_HELP_FLAG.needs_parameter */
extern T1 T73f12(T0* C);
/* AP_FLAG.needs_parameter */
extern T1 T35f11(T0* C);
/* AP_DISPLAY_HELP_FLAG.name */
extern T0* T73f22(T0* C);
/* AP_STRING_OPTION.name */
extern T0* T37f11(T0* C);
/* AP_FLAG.name */
extern T0* T35f15(T0* C);
/* AP_DISPLAY_HELP_FLAG.names */
extern T0* T73f23(T0* C);
/* AP_STRING_OPTION.names */
extern T0* T37f19(T0* C);
/* AP_STRING_OPTION.names */
extern T0* T37f19p1(T0* C);
/* AP_FLAG.names */
extern T0* T35f16(T0* C);
/* AP_DISPLAY_HELP_FLAG.example */
extern T0* T73f28(T0* C);
/* AP_STRING_OPTION.example */
extern T0* T37f20(T0* C);
/* AP_FLAG.example */
extern T0* T35f17(T0* C);
/* AP_DISPLAY_HELP_FLAG.has_long_form */
extern T1 T73f10(T0* C);
/* AP_STRING_OPTION.has_long_form */
extern T1 T37f12(T0* C);
/* AP_FLAG.has_long_form */
extern T1 T35f10(T0* C);
/* GEANT_FILESET_ENTRY.is_equal */
extern T1 T416f5(T0* C, T0* a1);
/* GEANT_FILESET_ENTRY.string_ */
extern T0* T416f6(T0* C);
/* XM_NAMESPACE.is_equal */
extern T1 T316f4(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.is_equal */
extern T1 T139f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.same_string */
extern T1 T139f15(T0* C, T0* a1, T0* a2);
/* INTEGER_32.is_equal */
extern T1 T6f28(T6* C, T6 a1);
/* FILE_NAME.to_c */
extern T0* T457f7(T0* C);
/* UC_UTF8_STRING.to_c */
extern T0* T195f19(T0* C);
/* STRING_8.to_c */
extern T0* T17f11(T0* C);
extern T0* GE_ma33(T6 c, ...);
extern T0* GE_ma193(T6 c, ...);
extern T0* GE_ma175(T6 c, ...);
extern T0* GE_ma451(T6 c, ...);
extern T0* GE_ma418(T6 c, ...);
extern T0* ge308ov3135;
extern T0* ge312ov4945;
extern T0* ge318ov6412;
extern T0* ge247ov7888;
extern T0* ge367ov11432;
extern T0* ge199ov3135;
extern T0* ge491ov9740;
extern T0* ge528ov9582;
extern T0* ge286ov3934;
extern T0* ge310ov3135;
extern T0* ge211ov3972;
extern T0* ge211ov3973;
extern T0* ge200ov4231;
extern T0* ge200ov4230;
extern T0* ge209ov3972;
extern T0* ge209ov3973;
extern T0* ge1411ov5251;
extern T0* ge1411ov5250;
extern T0* ge1418ov5545;
extern T0* ge1418ov5507;
extern T0* ge1418ov5505;
extern T0* ge1418ov5546;
extern T0* ge1418ov5518;
extern T0* ge1418ov5517;
extern T0* ge1418ov5528;
extern T0* ge1418ov5522;
extern T0* ge1418ov5521;
extern T0* ge1418ov5520;
extern T0* ge1418ov5526;
extern T0* ge1418ov5525;
extern T0* ge1418ov5527;
extern T0* ge1418ov5504;
extern T0* ge1418ov5530;
extern T0* ge1418ov5539;
extern T0* ge1421ov5192;
extern T0* ge1421ov5190;
extern T0* ge1421ov5191;
extern T0* ge1418ov5540;
extern T0* ge1418ov5541;
extern T0* ge1418ov5544;
extern T0* ge1418ov5542;
extern T0* ge1418ov5543;
extern T0* ge1418ov5537;
extern T0* ge1414ov7291;
extern T0* ge1414ov7292;
extern T0* ge1418ov5510;
extern T0* ge1418ov5533;
extern T0* ge1418ov5553;
extern T0* ge1418ov5554;
extern T0* ge1418ov5555;
extern T0* ge1418ov5548;
extern T0* ge1418ov5531;
extern T0* ge1418ov5532;
extern T0* ge1418ov5534;
extern T0* ge1418ov5538;
extern T0* ge285ov4122;
extern T0* ge211ov3983;
extern T0* ge209ov3983;
extern T0* ge152ov2592;
extern T0* ge155ov3103;
extern T0* ge155ov3110;
extern T0* ge217ov1704;
extern T0* ge155ov3106;
extern T0* ge155ov3113;
extern T0* ge155ov3104;
extern T0* ge155ov3111;
extern T0* ge155ov3105;
extern T0* ge155ov3112;
extern T0* ge155ov3107;
extern T0* ge155ov3114;
extern T0* ge155ov3108;
extern T0* ge155ov3115;
extern T0* ge152ov2587;
extern T0* ge152ov2586;
extern T0* ge152ov2594;
extern T0* ge152ov2593;
extern T0* ge495ov10357;
extern T0* ge495ov10394;
extern T0* ge495ov10379;
extern T0* ge495ov10372;
extern T0* ge495ov10382;
extern T0* ge495ov10375;
extern T0* ge495ov10383;
extern T0* ge495ov10392;
extern T0* ge495ov10385;
extern T0* ge495ov10381;
extern T0* ge495ov10369;
extern T0* ge495ov10370;
extern T0* ge495ov10384;
extern T0* ge495ov10371;
extern T0* ge495ov10358;
extern T0* ge495ov10359;
extern T0* ge495ov10360;
extern T0* ge495ov10366;
extern T0* ge495ov10368;
extern T0* ge495ov10363;
extern T0* ge495ov10388;
extern T0* ge495ov10387;
extern T0* ge495ov10364;
extern T0* ge495ov10365;
extern T0* ge495ov10362;
extern T0* ge495ov10361;
extern T0* ge281ov9369;
extern T0* ge90ov9223;
extern T0* ge296ov4102;
extern T0* ge285ov4124;
extern T0* ge315ov3135;
extern T0* ge281ov9368;
extern T0* ge1425ov6797;
extern T0* ge1425ov6798;
extern T0* ge1416ov7896;
extern T0* ge1416ov7898;
extern T0* ge1368ov5841;
extern T0* ge1349ov7670;
extern T0* ge1349ov7671;
extern T0* ge153ov4880;
extern T0* ge153ov4881;
extern T0* ge153ov4882;
extern T0* ge153ov4879;
extern T0* ge1416ov7895;
extern T0* ge1416ov7897;
extern T0* ge352ov3119;
extern T0* ge338ov3119;
extern T0* ge344ov3119;
extern T0* ge343ov3119;
extern T0* ge342ov3119;
extern T0* ge333ov3119;
extern T0* ge332ov3119;
extern T0* ge349ov3119;
extern T0* ge362ov3119;
extern T0* ge1268ov3119;
extern T0* ge1273ov3119;
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
	copyright: "Copyright (c) 2006-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_MISC_H
#define EIF_MISC_H

#ifdef __cplusplus
extern "C" {
#endif

extern EIF_INTEGER eif_system(char* s);
extern void eif_system_asynchronous(char* cmd);

#ifdef EIF_WINDOWS
/* DLL declarations */
#define eif_load_dll(name) GE_load_dll(name)
#endif

#ifdef __cplusplus
}
#endif

#endif
/*
	description:

		"C functions used to implement class PATH_NAME"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_PATH_NAME_H
#define EIF_PATH_NAME_H

#ifdef __cplusplus
extern "C" {
#endif

extern EIF_BOOLEAN eif_is_volume_name_valid(EIF_CHARACTER* p);
extern EIF_BOOLEAN eif_is_directory_name_valid(EIF_CHARACTER* p);
extern void eif_append_directory(EIF_REFERENCE string, EIF_CHARACTER* p, EIF_CHARACTER* v);
extern void eif_set_directory(EIF_REFERENCE string, EIF_CHARACTER* p, EIF_CHARACTER* v);
extern EIF_BOOLEAN eif_path_name_compare(EIF_CHARACTER* s, EIF_CHARACTER* t, EIF_INTEGER length);
extern EIF_REFERENCE eif_volume_name(EIF_CHARACTER* p);
extern EIF_REFERENCE eif_extracted_paths(EIF_CHARACTER* p);
extern void eif_append_file_name(EIF_REFERENCE string, EIF_CHARACTER* p, EIF_CHARACTER* v);
extern EIF_BOOLEAN eif_is_file_name_valid(EIF_CHARACTER* p);
extern EIF_BOOLEAN eif_is_extension_valid(EIF_CHARACTER* p);
extern EIF_BOOLEAN eif_is_file_valid(EIF_CHARACTER* p);
extern EIF_BOOLEAN eif_is_directory_valid(EIF_CHARACTER* p);
extern EIF_BOOLEAN eif_home_dir_supported(void);
extern EIF_BOOLEAN eif_root_dir_supported(void);
extern EIF_BOOLEAN eif_case_sensitive_path_names(void);
extern EIF_REFERENCE eif_current_dir_representation(void);
extern EIF_REFERENCE eif_home_directory_name(void);
extern EIF_REFERENCE eif_root_directory_name(void);

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
