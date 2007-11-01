/*
	description:

		"C declarations for the Gobo Eiffel runtime."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
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
	defined(__WIN32__) || defined(__TOS_WIN__) || defined(_MSC_VER))
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
#define GE_alloc(x) GC_MALLOC(x)
#define GE_alloc_atomic(x) GC_MALLOC_ATOMIC(x)

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
#define GE_alloc(x) calloc((x),1)
#define GE_alloc_atomic(x) calloc((x),1)

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

/* GELEX */
typedef struct S21 T21;

/* GELEX_COMMAND_LINE */
typedef struct S22 T22;

/* KL_ARGUMENTS */
typedef struct S23 T23;

/* UT_ERROR_HANDLER */
typedef struct S24 T24;

/* LX_DESCRIPTION */
typedef struct S25 T25;

/* KL_EQUALITY_TESTER [LX_DFA_STATE] */
typedef struct S26 T26;

/* KL_EQUALITY_TESTER [LX_NFA_STATE] */
typedef struct S27 T27;

/* KL_EQUALITY_TESTER [LX_START_CONDITION] */
typedef struct S28 T28;

/* KL_EQUALITY_TESTER [LX_RULE] */
typedef struct S29 T29;

/* KL_EQUALITY_TESTER [INTEGER_32] */
typedef struct S30 T30;

/* KL_EQUALITY_TESTER [STRING_8] */
typedef struct S31 T31;

/* KL_EQUALITY_TESTER [LX_NFA] */
typedef struct S32 T32;

/* KL_EQUALITY_TESTER [LX_PROTO] */
typedef struct S33 T33;

/* KL_EQUALITY_TESTER [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]] */
typedef struct S34 T34;

/* KL_EQUALITY_TESTER [LX_TRANSITION_TABLE [LX_DFA_STATE]] */
typedef struct S35 T35;

/* KL_EQUALITY_TESTER [LX_SINGLETON] */
typedef struct S36 T36;

/* KL_EQUALITY_TESTER [LX_SYMBOL_CLASS] */
typedef struct S37 T37;

/* LX_LEX_PARSER */
typedef struct S38 T38;

/* KL_TEXT_INPUT_FILE */
typedef struct S39 T39;

/* UT_CANNOT_READ_FILE_ERROR */
typedef struct S40 T40;

/* KL_EXCEPTIONS */
typedef struct S44 T44;

/* KL_STANDARD_FILES */
typedef struct S45 T45;

/* KL_STDIN_FILE */
typedef struct S46 T46;

/* LX_COMPRESSED_DFA */
typedef struct S47 T47;

/* DS_ARRAYED_LIST [LX_RULE] */
typedef struct S48 T48;

/* LX_RULE */
typedef struct S49 T49;

/* LX_DANGEROUS_TRAILING_CONTEXT_ERROR */
typedef struct S50 T50;

/* LX_RULE_CANNOT_BE_MATCHED_ERROR */
typedef struct S51 T51;

/* LX_DEFAULT_RULE_CAN_BE_MATCHED_ERROR */
typedef struct S52 T52;

/* LX_FULL_DFA */
typedef struct S54 T54;

/* KL_TEXT_OUTPUT_FILE */
typedef struct S55 T55;

/* UT_CANNOT_WRITE_TO_FILE_ERROR */
typedef struct S56 T56;

/* KL_STDOUT_FILE */
typedef struct S58 T58;

/* AP_PARSER */
typedef struct S59 T59;

/* AP_FLAG */
typedef struct S60 T60;

/* AP_ENUMERATION_OPTION */
typedef struct S61 T61;

/* AP_STRING_OPTION */
typedef struct S62 T62;

/* AP_INTEGER_OPTION */
typedef struct S63 T63;

/* AP_ALTERNATIVE_OPTIONS_LIST */
typedef struct S64 T64;

/* AP_ERROR */
typedef struct S65 T65;

/* KL_STRING_ROUTINES */
typedef struct S69 T69;

/* AP_DISPLAY_HELP_FLAG */
typedef struct S71 T71;

/* UT_VERSION_NUMBER */
typedef struct S72 T72;

/* KL_STDERR_FILE */
typedef struct S73 T73;

/* DS_ARRAYED_LIST [STRING_8] */
typedef struct S74 T74;

/* LX_START_CONDITIONS */
typedef struct S75 T75;

/* LX_ACTION_FACTORY */
typedef struct S76 T76;

/* DS_ARRAYED_STACK [INTEGER_32] */
typedef struct S77 T77;

/* YY_FILE_BUFFER */
typedef struct S78 T78;

/* YY_BUFFER */
typedef struct S79 T79;

/* DS_HASH_TABLE [STRING_8, STRING_8] */
typedef struct S80 T80;

/* KL_STRING_EQUALITY_TESTER */
typedef struct S81 T81;

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8] */
typedef struct S82 T82;

/* SPECIAL [INTEGER_32] */
typedef struct S83 T83;

/* KL_SPECIAL_ROUTINES [INTEGER_32] */
typedef struct S84 T84;

/* SPECIAL [ANY] */
typedef struct S86 T86;

/* KL_SPECIAL_ROUTINES [ANY] */
typedef struct S87 T87;

/* SPECIAL [STRING_8] */
typedef struct S88 T88;

/* KL_SPECIAL_ROUTINES [STRING_8] */
typedef struct S89 T89;

/* LX_SYMBOL_CLASS */
typedef struct S90 T90;

/* SPECIAL [LX_SYMBOL_CLASS] */
typedef struct S91 T91;

/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS] */
typedef struct S92 T92;

/* LX_NFA */
typedef struct S93 T93;

/* LX_EQUIVALENCE_CLASSES */
typedef struct S94 T94;

/* SPECIAL [LX_NFA] */
typedef struct S95 T95;

/* KL_SPECIAL_ROUTINES [LX_NFA] */
typedef struct S96 T96;

/* UT_SYNTAX_ERROR */
typedef struct S97 T97;

/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
typedef struct S98 T98;

/* LX_ACTION */
typedef struct S100 T100;

/* LX_START_CONDITION */
typedef struct S101 T101;

/* LX_BAD_START_CONDITION_LIST_ERROR */
typedef struct S102 T102;

/* LX_UNRECOGNIZED_RULE_ERROR */
typedef struct S103 T103;

/* LX_TRAILING_CONTEXT_USED_TWICE_ERROR */
typedef struct S104 T104;

/* LX_UNRECOGNIZED_DIRECTIVE_ERROR */
typedef struct S105 T105;

/* LX_DIRECTIVE_EXPECTED_ERROR */
typedef struct S106 T106;

/* LX_START_CONDITION_EXPECTED_ERROR */
typedef struct S107 T107;

/* LX_UNRECOGNIZED_OPTION_ERROR */
typedef struct S108 T108;

/* LX_MISSING_QUOTE_ERROR */
typedef struct S109 T109;

/* LX_INCOMPLETE_NAME_DEFINITION_ERROR */
typedef struct S110 T110;

/* LX_UNDEFINED_DEFINITION_ERROR */
typedef struct S111 T111;

/* LX_BAD_CHARACTER_CLASS_ERROR */
typedef struct S112 T112;

/* LX_BAD_START_CONDITION_ERROR */
typedef struct S113 T113;

/* LX_INTEGER_TOO_LARGE_ERROR */
typedef struct S114 T114;

/* LX_BAD_CHARACTER_IN_BRACKETS_ERROR */
typedef struct S115 T115;

/* LX_MISSING_BRACKET_ERROR */
typedef struct S116 T116;

/* LX_BAD_CHARACTER_ERROR */
typedef struct S117 T117;

/* LX_FULL_AND_META_ERROR */
typedef struct S118 T118;

/* LX_FULL_AND_REJECT_ERROR */
typedef struct S119 T119;

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR */
typedef struct S120 T120;

/* LX_START_CONDITION_SPECIFIED_TWICE_ERROR */
typedef struct S121 T121;

/* LX_UNDECLARED_START_CONDITION_ERROR */
typedef struct S122 T122;

/* LX_ALL_START_CONDITIONS_EOF_ERROR */
typedef struct S123 T123;

/* LX_START_CONDITION_DECLARED_TWICE_ERROR */
typedef struct S124 T124;

/* LX_NAME_DEFINED_TWICE_ERROR */
typedef struct S125 T125;

/* LX_CHARACTER_OUT_OF_RANGE_ERROR */
typedef struct S126 T126;

/* LX_MULTIPLE_EOF_RULES_ERROR */
typedef struct S127 T127;

/* TYPED_POINTER [ANY] */
typedef struct S130 T130;

/* ARRAY [STRING_8] */
typedef struct S131 T131;

/* LX_DFA_STATE */
typedef struct S132 T132;

/* LX_NFA_STATE */
typedef struct S133 T133;

/* DS_ARRAYED_LIST [LX_NFA_STATE] */
typedef struct S134 T134;

/* SPECIAL [LX_RULE] */
typedef struct S135 T135;

/* ARRAY [LX_RULE] */
typedef struct S136 T136;

/* DS_ARRAYED_LIST [LX_DFA_STATE] */
typedef struct S137 T137;

/* DS_BUBBLE_SORTER [LX_RULE] */
typedef struct S138 T138;

/* KL_COMPARABLE_COMPARATOR [LX_RULE] */
typedef struct S140 T140;

/* ARRAY [INTEGER_32] */
typedef struct S142 T142;

/* LX_SINGLETON */
typedef struct S143 T143;

/* LX_PROTO_QUEUE */
typedef struct S144 T144;

/* DS_ARRAYED_LIST [LX_SINGLETON] */
typedef struct S145 T145;

/* LX_TEMPLATE_LIST */
typedef struct S146 T146;

/* LX_SYMBOL_PARTITIONS */
typedef struct S147 T147;

/* DS_ARRAYED_LIST [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]] */
typedef struct S148 T148;

/* DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]] */
typedef struct S149 T149;

/* DS_LINKED_LIST [LX_RULE] */
typedef struct S150 T150;

/* DS_LINKED_LIST_CURSOR [LX_RULE] */
typedef struct S151 T151;

/* UT_BOOLEAN_FORMATTER */
typedef struct S152 T152;

/* DS_ARRAYED_LIST [INTEGER_32] */
typedef struct S153 T153;

/* DS_BUBBLE_SORTER [INTEGER_32] */
typedef struct S154 T154;

/* LX_TRANSITION_TABLE [LX_DFA_STATE] */
typedef struct S156 T156;

/* SPECIAL [BOOLEAN] */
typedef struct S157 T157;

/* ARRAY [BOOLEAN] */
typedef struct S158 T158;

/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE] */
typedef struct S159 T159;

/* LX_PROTO */
typedef struct S160 T160;

/* DS_BILINKED_LIST_CURSOR [LX_PROTO] */
typedef struct S161 T161;

/* DS_LINKED_LIST_CURSOR [LX_TRANSITION_TABLE [LX_DFA_STATE]] */
typedef struct S162 T162;

/* KL_ARRAY_ROUTINES [INTEGER_32] */
typedef struct S163 T163;

/* UT_ARRAY_FORMATTER */
typedef struct S164 T164;

/* KL_INTEGER_ROUTINES */
typedef struct S165 T165;

/* DS_ARRAYED_LIST [LX_NFA] */
typedef struct S166 T166;

/* DS_HASH_TABLE [LX_NFA, INTEGER_32] */
typedef struct S167 T167;

/* KL_SPECIAL_ROUTINES [LX_RULE] */
typedef struct S168 T168;

/* DS_ARRAYED_LIST_CURSOR [LX_RULE] */
typedef struct S169 T169;

/* LX_BAD_ITERATION_VALUES_ERROR */
typedef struct S171 T171;

/* LX_ITERATION_NOT_POSITIVE_ERROR */
typedef struct S172 T172;

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR */
typedef struct S173 T173;

/* UNIX_FILE_INFO */
typedef struct S174 T174;

/* KL_COMPARABLE_COMPARATOR [INTEGER_32] */
typedef struct S176 T176;

/* DS_ARRAYED_LIST [AP_OPTION] */
typedef struct S178 T178;

/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S179 T179;

/* AP_ERROR_HANDLER */
typedef struct S180 T180;

/* DS_LINKED_LIST [STRING_8] */
typedef struct S181 T181;

/* DS_LINKED_LIST [INTEGER_32] */
typedef struct S185 T185;

/* DS_LINKED_LIST_CURSOR [AP_OPTION] */
typedef struct S186 T186;

/* KL_ANY_ROUTINES */
typedef struct S188 T188;

/* ST_WORD_WRAPPER */
typedef struct S190 T190;

/* KL_OPERATING_SYSTEM */
typedef struct S191 T191;

/* KL_WINDOWS_FILE_SYSTEM */
typedef struct S192 T192;

/* KL_UNIX_FILE_SYSTEM */
typedef struct S193 T193;

/* DS_ARRAYED_LIST_CURSOR [STRING_8] */
typedef struct S194 T194;

/* SPECIAL [LX_START_CONDITION] */
typedef struct S195 T195;

/* KL_SPECIAL_ROUTINES [LX_START_CONDITION] */
typedef struct S196 T196;

/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION] */
typedef struct S197 T197;

/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8] */
typedef struct S198 T198;

/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
typedef struct S200 T200;

/* DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING_8] */
typedef struct S201 T201;

/* TO_SPECIAL [INTEGER_32] */
typedef struct S203 T203;

/* TO_SPECIAL [ANY] */
typedef struct S204 T204;

/* TO_SPECIAL [STRING_8] */
typedef struct S205 T205;

/* DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
typedef struct S206 T206;

/* TO_SPECIAL [LX_SYMBOL_CLASS] */
typedef struct S207 T207;

/* LX_EPSILON_TRANSITION [LX_NFA_STATE] */
typedef struct S208 T208;

/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE] */
typedef struct S211 T211;

/* LX_SYMBOL_TRANSITION [LX_NFA_STATE] */
typedef struct S212 T212;

/* DS_BILINKABLE [INTEGER_32] */
typedef struct S213 T213;

/* SPECIAL [DS_BILINKABLE [INTEGER_32]] */
typedef struct S214 T214;

/* ARRAY [DS_BILINKABLE [INTEGER_32]] */
typedef struct S215 T215;

/* TO_SPECIAL [LX_NFA] */
typedef struct S216 T216;

/* DS_BUBBLE_SORTER [LX_NFA_STATE] */
typedef struct S217 T217;

/* SPECIAL [LX_NFA_STATE] */
typedef struct S219 T219;

/* KL_SPECIAL_ROUTINES [LX_NFA_STATE] */
typedef struct S220 T220;

/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE] */
typedef struct S221 T221;

/* SPECIAL [LX_DFA_STATE] */
typedef struct S223 T223;

/* KL_SPECIAL_ROUTINES [LX_DFA_STATE] */
typedef struct S224 T224;

/* DS_BILINKABLE [LX_PROTO] */
typedef struct S226 T226;

/* SPECIAL [LX_SINGLETON] */
typedef struct S227 T227;

/* KL_SPECIAL_ROUTINES [LX_SINGLETON] */
typedef struct S228 T228;

/* DS_ARRAYED_LIST_CURSOR [LX_SINGLETON] */
typedef struct S229 T229;

/* DS_LINKABLE [LX_TRANSITION_TABLE [LX_DFA_STATE]] */
typedef struct S230 T230;

/* SPECIAL [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]] */
typedef struct S232 T232;

/* KL_SPECIAL_ROUTINES [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]] */
typedef struct S233 T233;

/* DS_ARRAYED_LIST_CURSOR [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]] */
typedef struct S234 T234;

/* DS_LINKABLE [LX_RULE] */
typedef struct S235 T235;

/* ARRAY [LX_DFA_STATE] */
typedef struct S237 T237;

/* KL_ARRAY_ROUTINES [LX_DFA_STATE] */
typedef struct S238 T238;

/* DS_ARRAYED_LIST_CURSOR [LX_NFA] */
typedef struct S239 T239;

/* DS_SPARSE_TABLE_KEYS [LX_NFA, INTEGER_32] */
typedef struct S240 T240;

/* DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32] */
typedef struct S242 T242;

/* TO_SPECIAL [LX_RULE] */
typedef struct S243 T243;

/* STRING_TO_INTEGER_CONVERTOR */
typedef struct S245 T245;

/* KL_CHARACTER_BUFFER */
typedef struct S249 T249;

/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE] */
typedef struct S250 T250;

/* TYPED_POINTER [SPECIAL [CHARACTER_8]] */
typedef struct S253 T253;

/* DS_ARRAYED_LIST_CURSOR [AP_OPTION] */
typedef struct S254 T254;

/* SPECIAL [AP_OPTION] */
typedef struct S256 T256;

/* KL_SPECIAL_ROUTINES [AP_OPTION] */
typedef struct S257 T257;

/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S258 T258;

/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S259 T259;

/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S260 T260;

/* DS_LINKED_LIST_CURSOR [STRING_8] */
typedef struct S261 T261;

/* DS_LINKABLE [STRING_8] */
typedef struct S262 T262;

/* DS_LINKABLE [INTEGER_32] */
typedef struct S263 T263;

/* DS_LINKED_LIST_CURSOR [INTEGER_32] */
typedef struct S264 T264;

/* EXECUTION_ENVIRONMENT */
typedef struct S265 T265;

/* TO_SPECIAL [LX_START_CONDITION] */
typedef struct S266 T266;

/* DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8] */
typedef struct S267 T267;

/* DS_SPARSE_TABLE_KEYS_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
typedef struct S268 T268;

/* TO_SPECIAL [LX_NFA_STATE] */
typedef struct S269 T269;

/* TO_SPECIAL [LX_DFA_STATE] */
typedef struct S270 T270;

/* TO_SPECIAL [LX_SINGLETON] */
typedef struct S271 T271;

/* TO_SPECIAL [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]] */
typedef struct S272 T272;

/* DS_SPARSE_TABLE_KEYS_CURSOR [LX_NFA, INTEGER_32] */
typedef struct S273 T273;

/* SPECIAL [NATURAL_8] */
typedef struct S274 T274;

/* DS_SHELL_SORTER [INTEGER_32] */
typedef struct S275 T275;

/* INTEGER_OVERFLOW_CHECKER */
typedef struct S276 T276;

/* TO_SPECIAL [AP_OPTION] */
typedef struct S277 T277;

/* TO_SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S278 T278;

/* C_STRING */
typedef struct S282 T282;

/* SPECIAL [NATURAL_64] */
typedef struct S283 T283;

/* PLATFORM */
typedef struct S285 T285;

/* MANAGED_POINTER */
typedef struct S286 T286;

/* AP_OPTION_COMPARATOR */
typedef struct S287 T287;

/* DS_QUICK_SORTER [AP_OPTION] */
typedef struct S288 T288;

/* TYPED_POINTER [NATURAL_8] */
typedef struct S291 T291;

/* EXCEPTIONS */
typedef struct S292 T292;

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
struct S130 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type TYPED_POINTER [SPECIAL [CHARACTER_8]] */
struct S253 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type TYPED_POINTER [NATURAL_8] */
struct S291 {
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

/* Struct for type GELEX */
struct S21 {
	int id;
	T0* a1; /* error_handler */
	T0* a2; /* description */
	T0* a3; /* dfa */
};

/* Struct for type GELEX_COMMAND_LINE */
struct S22 {
	int id;
	T0* a1; /* error_handler */
};

/* Struct for type KL_ARGUMENTS */
struct S23 {
	int id;
	T0* a1; /* program_name */
};

/* Struct for type UT_ERROR_HANDLER */
struct S24 {
	int id;
	T0* a1; /* error_file */
	T0* a2; /* warning_file */
	T0* a3; /* info_file */
};

/* Struct for type LX_DESCRIPTION */
struct S25 {
	int id;
	T0* a1; /* input_filename */
	T1 a2; /* full_table */
	T1 a3; /* no_warning */
	T1 a4; /* reject_used */
	T0* a5; /* rules */
	T1 a6; /* no_default_rule */
	T0* a7; /* output_filename */
	T1 a8; /* backing_up_report */
	T0* a9; /* backing_up_filename */
	T1 a10; /* equiv_classes_used */
	T1 a11; /* meta_equiv_classes_used */
	T6 a12; /* characters_count */
	T6 a13; /* array_size */
	T1 a14; /* line_pragma */
	T0* a15; /* eof_rules */
	T0* a16; /* eiffel_header */
	T0* a17; /* start_conditions */
	T1 a18; /* debug_mode */
	T1 a19; /* case_insensitive */
	T1 a20; /* actions_separated */
	T1 a21; /* inspect_used */
	T0* a22; /* equiv_classes */
	T1 a23; /* variable_trail_context */
	T0* a24; /* eiffel_code */
	T1 a25; /* bol_needed */
	T1 a26; /* pre_action_used */
	T1 a27; /* post_action_used */
	T1 a28; /* pre_eof_action_used */
	T1 a29; /* post_eof_action_used */
	T1 a30; /* line_used */
	T1 a31; /* position_used */
};

/* Struct for type KL_EQUALITY_TESTER [LX_DFA_STATE] */
struct S26 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [LX_NFA_STATE] */
struct S27 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [LX_START_CONDITION] */
struct S28 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [LX_RULE] */
struct S29 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [INTEGER_32] */
struct S30 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [STRING_8] */
struct S31 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [LX_NFA] */
struct S32 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [LX_PROTO] */
struct S33 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]] */
struct S34 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [LX_TRANSITION_TABLE [LX_DFA_STATE]] */
struct S35 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [LX_SINGLETON] */
struct S36 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [LX_SYMBOL_CLASS] */
struct S37 {
	int id;
};

/* Struct for type LX_LEX_PARSER */
struct S38 {
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
	T0* a11; /* options_overrider */
	T0* a12; /* description */
	T0* a13; /* error_handler */
	T0* a14; /* name_definitions */
	T0* a15; /* character_classes */
	T6 a16; /* line_nb */
	T0* a17; /* yyss */
	T0* a18; /* input_buffer */
	T6 a19; /* yy_end */
	T6 a20; /* yy_position */
	T6 a21; /* yy_line */
	T6 a22; /* yy_column */
	T6 a23; /* yy_parsing_status */
	T6 a24; /* yy_suspended_yystacksize */
	T6 a25; /* yy_suspended_yystate */
	T6 a26; /* yy_suspended_yyn */
	T6 a27; /* yy_suspended_yychar1 */
	T6 a28; /* yy_suspended_index */
	T6 a29; /* yy_suspended_yyss_top */
	T6 a30; /* yy_suspended_yy_goto */
	T6 a31; /* error_count */
	T1 a32; /* yy_lookahead_needed */
	T6 a33; /* yyerrstatus */
	T6 a34; /* yyssp */
	T0* a35; /* yypact */
	T6 a36; /* last_token */
	T0* a37; /* yytranslate */
	T0* a38; /* yycheck */
	T0* a39; /* yytable */
	T0* a40; /* yydefact */
	T0* a41; /* yyr1 */
	T0* a42; /* yypgoto */
	T0* a43; /* yydefgoto */
	T0* a44; /* yytypes1 */
	T0* a45; /* yytypes2 */
	T6 a46; /* yy_start */
	T6 a47; /* yyvsp1 */
	T6 a48; /* yyvsp2 */
	T6 a49; /* yyvsp3 */
	T6 a50; /* yyvsp4 */
	T6 a51; /* yyvsp5 */
	T1 a52; /* yy_more_flag */
	T6 a53; /* yy_more_len */
	T6 a54; /* line */
	T6 a55; /* column */
	T6 a56; /* position */
	T6 a57; /* yy_start_state */
	T0* a58; /* yy_state_stack */
	T6 a59; /* yy_state_count */
	T0* a60; /* yy_ec */
	T0* a61; /* yy_content_area */
	T0* a62; /* yy_content */
	T0* a63; /* yy_accept */
	T6 a64; /* yy_last_accepting_state */
	T6 a65; /* yy_last_accepting_cpos */
	T0* a66; /* yy_chk */
	T0* a67; /* yy_base */
	T0* a68; /* yy_def */
	T0* a69; /* yy_meta */
	T0* a70; /* yy_nxt */
	T6 a71; /* yy_lp */
	T0* a72; /* yy_acclist */
	T6 a73; /* yy_looking_for_trail_begin */
	T6 a74; /* yy_full_match */
	T6 a75; /* yy_full_state */
	T6 a76; /* yy_full_lp */
	T1 a77; /* yy_rejected */
	T6 a78; /* yyvsc1 */
	T0* a79; /* yyvs1 */
	T0* a80; /* yyspecial_routines1 */
	T0* a81; /* last_any_value */
	T6 a82; /* yyvsc2 */
	T0* a83; /* yyvs2 */
	T0* a84; /* yyspecial_routines2 */
	T0* a85; /* last_string_value */
	T6 a86; /* yyvsc3 */
	T0* a87; /* yyvs3 */
	T0* a88; /* yyspecial_routines3 */
	T6 a89; /* last_integer_value */
	T6 a90; /* yyvsc4 */
	T0* a91; /* yyvs4 */
	T0* a92; /* yyspecial_routines4 */
	T0* a93; /* last_lx_symbol_class_value */
	T1 a94; /* in_trail_context */
	T0* a95; /* rule */
	T0* a96; /* yyvs5 */
	T1 a97; /* has_trail_context */
	T6 a98; /* trail_count */
	T6 a99; /* regexp_count */
	T6 a100; /* head_count */
	T6 a101; /* head_line */
	T6 a102; /* regexp_line */
	T6 a103; /* head_column */
	T6 a104; /* regexp_column */
	T6 a105; /* series_count */
	T6 a106; /* series_line */
	T6 a107; /* series_column */
	T6 a108; /* yyvsc5 */
	T0* a109; /* yyspecial_routines5 */
	T6 a110; /* singleton_count */
	T6 a111; /* singleton_line */
	T6 a112; /* singleton_column */
	T0* a113; /* last_string */
	T6 a114; /* rule_line_nb */
	T6 a115; /* nb_open_brackets */
};

/* Struct for type KL_TEXT_INPUT_FILE */
struct S39 {
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

/* Struct for type UT_CANNOT_READ_FILE_ERROR */
struct S40 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type KL_EXCEPTIONS */
struct S44 {
	int id;
};

/* Struct for type KL_STANDARD_FILES */
struct S45 {
	int id;
};

/* Struct for type KL_STDIN_FILE */
struct S46 {
	int id;
	T1 a1; /* end_of_file */
	T14 a2; /* file_pointer */
	T0* a3; /* name */
	T6 a4; /* mode */
	T2 a5; /* last_character */
	T0* a6; /* character_buffer */
};

/* Struct for type LX_COMPRESSED_DFA */
struct S47 {
	int id;
	T0* a1; /* yy_rules */
	T1 a2; /* yyVariable_trail_context */
	T0* a3; /* states */
	T1 a4; /* yyReject_used */
	T1 a5; /* meta_equiv_classes_used */
	T6 a6; /* start_states_count */
	T0* a7; /* input_filename */
	T6 a8; /* characters_count */
	T6 a9; /* array_size */
	T1 a10; /* inspect_used */
	T1 a11; /* actions_separated */
	T0* a12; /* eiffel_code */
	T0* a13; /* eiffel_header */
	T1 a14; /* bol_needed */
	T1 a15; /* pre_action_used */
	T1 a16; /* post_action_used */
	T1 a17; /* pre_eof_action_used */
	T1 a18; /* post_eof_action_used */
	T1 a19; /* line_pragma */
	T0* a20; /* yy_start_conditions */
	T0* a21; /* yy_ec */
	T6 a22; /* yyNull_equiv_class */
	T6 a23; /* yyNb_rules */
	T6 a24; /* yyEnd_of_buffer */
	T1 a25; /* yyLine_used */
	T1 a26; /* yyPosition_used */
	T6 a27; /* minimum_symbol */
	T6 a28; /* maximum_symbol */
	T6 a29; /* first_free */
	T6 a30; /* table_end */
	T6 a31; /* templates_count */
	T0* a32; /* protos */
	T0* a33; /* singletons */
	T0* a34; /* meta_equiv_classes */
	T0* a35; /* templates */
	T0* a36; /* partitions */
	T0* a37; /* yy_nxt */
	T0* a38; /* yy_chk */
	T0* a39; /* yy_base */
	T0* a40; /* yy_def */
	T6 a41; /* backing_up_count */
	T0* a42; /* yy_meta */
	T0* a43; /* yy_acclist */
	T0* a44; /* yy_eof_rules */
	T0* a45; /* yy_accept */
	T6 a46; /* yyJam_base */
	T6 a47; /* yyJam_state */
	T6 a48; /* yyTemplate_mark */
};

/* Struct for type DS_ARRAYED_LIST [LX_RULE] */
struct S48 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* equality_tester */
	T0* a4; /* special_routines */
	T6 a5; /* capacity */
	T0* a6; /* internal_cursor */
};

/* Struct for type LX_RULE */
struct S49 {
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

/* Struct for type LX_DANGEROUS_TRAILING_CONTEXT_ERROR */
struct S50 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_RULE_CANNOT_BE_MATCHED_ERROR */
struct S51 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_DEFAULT_RULE_CAN_BE_MATCHED_ERROR */
struct S52 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_FULL_DFA */
struct S54 {
	int id;
	T6 a1; /* backing_up_count */
	T6 a2; /* start_states_count */
	T0* a3; /* states */
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
	T0* a27; /* partitions */
	T1 a28; /* yyBacking_up */
	T0* a29; /* yy_eof_rules */
	T0* a30; /* yy_nxt */
	T0* a31; /* yy_accept */
	T6 a32; /* yyNb_rows */
};

/* Struct for type KL_TEXT_OUTPUT_FILE */
struct S55 {
	int id;
	T6 a1; /* mode */
	T0* a2; /* name */
	T0* a3; /* string_name */
	T14 a4; /* file_pointer */
	T1 a5; /* descriptor_available */
};

/* Struct for type UT_CANNOT_WRITE_TO_FILE_ERROR */
struct S56 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type KL_STDOUT_FILE */
struct S58 {
	int id;
	T14 a1; /* file_pointer */
	T0* a2; /* name */
	T6 a3; /* mode */
};

/* Struct for type AP_PARSER */
struct S59 {
	int id;
	T0* a1; /* alternative_options_lists */
	T0* a2; /* options */
	T0* a3; /* parameters */
	T0* a4; /* help_option */
	T0* a5; /* application_description */
	T0* a6; /* parameters_description */
	T0* a7; /* error_handler */
	T0* a8; /* argument_list */
	T0* a9; /* current_options */
	T1 a10; /* is_first_option */
	T0* a11; /* last_option_parameter */
};

/* Struct for type AP_FLAG */
struct S60 {
	int id;
	T6 a1; /* occurrences */
	T0* a2; /* description */
	T2 a3; /* short_form */
	T1 a4; /* has_short_form */
	T0* a5; /* long_form */
	T1 a6; /* is_mandatory */
	T6 a7; /* maximum_occurrences */
	T1 a8; /* is_hidden */
};

/* Struct for type AP_ENUMERATION_OPTION */
struct S61 {
	int id;
	T0* a1; /* parameters */
	T0* a2; /* description */
	T0* a3; /* possible_values */
	T0* a4; /* parameter_description */
	T1 a5; /* needs_parameter */
	T0* a6; /* long_form */
	T1 a7; /* is_mandatory */
	T6 a8; /* maximum_occurrences */
	T1 a9; /* has_short_form */
	T2 a10; /* short_form */
	T1 a11; /* is_hidden */
};

/* Struct for type AP_STRING_OPTION */
struct S62 {
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

/* Struct for type AP_INTEGER_OPTION */
struct S63 {
	int id;
	T0* a1; /* parameters */
	T0* a2; /* description */
	T0* a3; /* parameter_description */
	T2 a4; /* short_form */
	T1 a5; /* has_short_form */
	T0* a6; /* long_form */
	T1 a7; /* is_mandatory */
	T6 a8; /* maximum_occurrences */
	T1 a9; /* is_hidden */
};

/* Struct for type AP_ALTERNATIVE_OPTIONS_LIST */
struct S64 {
	int id;
	T0* a1; /* introduction_option */
	T0* a2; /* parameters_description */
	T0* a3; /* internal_cursor */
	T0* a4; /* first_cell */
};

/* Struct for type AP_ERROR */
struct S65 {
	int id;
	T0* a1; /* default_template */
	T0* a2; /* parameters */
	T0* a3; /* code */
};

/* Struct for type KL_STRING_ROUTINES */
struct S69 {
	int id;
};

/* Struct for type AP_DISPLAY_HELP_FLAG */
struct S71 {
	int id;
	T0* a1; /* description */
	T2 a2; /* short_form */
	T1 a3; /* has_short_form */
	T0* a4; /* long_form */
	T6 a5; /* occurrences */
	T1 a6; /* is_hidden */
	T1 a7; /* is_mandatory */
	T6 a8; /* maximum_occurrences */
};

/* Struct for type UT_VERSION_NUMBER */
struct S72 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type KL_STDERR_FILE */
struct S73 {
	int id;
	T14 a1; /* file_pointer */
	T0* a2; /* name */
	T6 a3; /* mode */
};

/* Struct for type DS_ARRAYED_LIST [STRING_8] */
struct S74 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* internal_cursor */
	T0* a4; /* special_routines */
	T6 a5; /* capacity */
};

/* Struct for type LX_START_CONDITIONS */
struct S75 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
	T0* a6; /* equality_tester */
};

/* Struct for type LX_ACTION_FACTORY */
struct S76 {
	int id;
};

/* Struct for type DS_ARRAYED_STACK [INTEGER_32] */
struct S77 {
	int id;
	T0* a1; /* storage */
	T6 a2; /* count */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type YY_FILE_BUFFER */
struct S78 {
	int id;
	T0* a1; /* content */
	T6 a2; /* index */
	T6 a3; /* line */
	T6 a4; /* column */
	T6 a5; /* position */
	T1 a6; /* beginning_of_line */
	T6 a7; /* count */
	T1 a8; /* filled */
	T0* a9; /* file */
	T1 a10; /* end_of_file */
	T6 a11; /* capacity */
	T1 a12; /* interactive */
};

/* Struct for type YY_BUFFER */
struct S79 {
	int id;
	T0* a1; /* content */
	T6 a2; /* index */
	T6 a3; /* line */
	T6 a4; /* column */
	T6 a5; /* position */
	T1 a6; /* beginning_of_line */
	T6 a7; /* count */
	T1 a8; /* filled */
	T6 a9; /* capacity */
};

/* Struct for type DS_HASH_TABLE [STRING_8, STRING_8] */
struct S80 {
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
};

/* Struct for type KL_STRING_EQUALITY_TESTER */
struct S81 {
	int id;
};

/* Struct for type DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8] */
struct S82 {
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
};

/* Struct for type SPECIAL [INTEGER_32] */
struct S83 {
	int id;
	T6 z1; /* count */
	T6 z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [INTEGER_32] */
struct S84 {
	int id;
};

/* Struct for type SPECIAL [ANY] */
struct S86 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ANY] */
struct S87 {
	int id;
};

/* Struct for type SPECIAL [STRING_8] */
struct S88 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [STRING_8] */
struct S89 {
	int id;
};

/* Struct for type LX_SYMBOL_CLASS */
struct S90 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T1 a5; /* negated */
	T1 a6; /* sort_needed */
	T6 a7; /* count */
	T0* a8; /* equality_tester */
};

/* Struct for type SPECIAL [LX_SYMBOL_CLASS] */
struct S91 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS] */
struct S92 {
	int id;
};

/* Struct for type LX_NFA */
struct S93 {
	int id;
	T1 a1; /* in_trail_context */
	T0* a2; /* states */
};

/* Struct for type LX_EQUIVALENCE_CLASSES */
struct S94 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
};

/* Struct for type SPECIAL [LX_NFA] */
struct S95 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_NFA] */
struct S96 {
	int id;
};

/* Struct for type UT_SYNTAX_ERROR */
struct S97 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
struct S98 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type LX_ACTION */
struct S100 {
	int id;
	T0* a1; /* text */
};

/* Struct for type LX_START_CONDITION */
struct S101 {
	int id;
	T0* a1; /* name */
	T6 a2; /* id */
	T1 a3; /* is_exclusive */
	T0* a4; /* patterns */
	T0* a5; /* bol_patterns */
	T1 a6; /* has_eof */
};

/* Struct for type LX_BAD_START_CONDITION_LIST_ERROR */
struct S102 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_UNRECOGNIZED_RULE_ERROR */
struct S103 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_TRAILING_CONTEXT_USED_TWICE_ERROR */
struct S104 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_UNRECOGNIZED_DIRECTIVE_ERROR */
struct S105 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_DIRECTIVE_EXPECTED_ERROR */
struct S106 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_START_CONDITION_EXPECTED_ERROR */
struct S107 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_UNRECOGNIZED_OPTION_ERROR */
struct S108 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_MISSING_QUOTE_ERROR */
struct S109 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_INCOMPLETE_NAME_DEFINITION_ERROR */
struct S110 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_UNDEFINED_DEFINITION_ERROR */
struct S111 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_BAD_CHARACTER_CLASS_ERROR */
struct S112 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_BAD_START_CONDITION_ERROR */
struct S113 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_INTEGER_TOO_LARGE_ERROR */
struct S114 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_BAD_CHARACTER_IN_BRACKETS_ERROR */
struct S115 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_MISSING_BRACKET_ERROR */
struct S116 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_BAD_CHARACTER_ERROR */
struct S117 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_FULL_AND_META_ERROR */
struct S118 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_FULL_AND_REJECT_ERROR */
struct S119 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR */
struct S120 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_START_CONDITION_SPECIFIED_TWICE_ERROR */
struct S121 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_UNDECLARED_START_CONDITION_ERROR */
struct S122 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_ALL_START_CONDITIONS_EOF_ERROR */
struct S123 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_START_CONDITION_DECLARED_TWICE_ERROR */
struct S124 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_NAME_DEFINED_TWICE_ERROR */
struct S125 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_CHARACTER_OUT_OF_RANGE_ERROR */
struct S126 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_MULTIPLE_EOF_RULES_ERROR */
struct S127 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ARRAY [STRING_8] */
struct S131 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type LX_DFA_STATE */
struct S132 {
	int id;
	T0* a1; /* accepted_rules */
	T0* a2; /* states */
	T0* a3; /* transitions */
	T0* a4; /* accepted_head_rules */
	T6 a5; /* code */
	T6 a6; /* id */
};

/* Struct for type LX_NFA_STATE */
struct S133 {
	int id;
	T1 a1; /* in_trail_context */
	T0* a2; /* transition */
	T0* a3; /* epsilon_transition */
	T6 a4; /* id */
	T0* a5; /* accepted_rule */
};

/* Struct for type DS_ARRAYED_LIST [LX_NFA_STATE] */
struct S134 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* equality_tester */
	T0* a4; /* special_routines */
	T6 a5; /* capacity */
	T0* a6; /* internal_cursor */
};

/* Struct for type SPECIAL [LX_RULE] */
struct S135 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [LX_RULE] */
struct S136 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_ARRAYED_LIST [LX_DFA_STATE] */
struct S137 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T0* a5; /* internal_cursor */
	T0* a6; /* equality_tester */
};

/* Struct for type DS_BUBBLE_SORTER [LX_RULE] */
struct S138 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type KL_COMPARABLE_COMPARATOR [LX_RULE] */
struct S140 {
	int id;
};

/* Struct for type ARRAY [INTEGER_32] */
struct S142 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type LX_SINGLETON */
struct S143 {
	int id;
	T6 a1; /* symbol */
	T6 a2; /* state_id */
	T6 a3; /* default_id */
	T6 a4; /* target_id */
};

/* Struct for type LX_PROTO_QUEUE */
struct S144 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
	T0* a3; /* internal_cursor */
	T0* a4; /* last_cell */
};

/* Struct for type DS_ARRAYED_LIST [LX_SINGLETON] */
struct S145 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* special_routines */
	T0* a5; /* internal_cursor */
};

/* Struct for type LX_TEMPLATE_LIST */
struct S146 {
	int id;
	T6 a1; /* count */
	T0* a2; /* last_cell */
	T0* a3; /* meta_equiv_classes */
	T0* a4; /* internal_cursor */
	T0* a5; /* first_cell */
};

/* Struct for type LX_SYMBOL_PARTITIONS */
struct S147 {
	int id;
	T0* a1; /* symbols */
	T0* a2; /* storage */
	T6 a3; /* count */
};

/* Struct for type DS_ARRAYED_LIST [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]] */
struct S148 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]] */
struct S149 {
	int id;
	T0* a1; /* first */
	T0* a2; /* second */
};

/* Struct for type DS_LINKED_LIST [LX_RULE] */
struct S150 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_LINKED_LIST_CURSOR [LX_RULE] */
struct S151 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type UT_BOOLEAN_FORMATTER */
struct S152 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST [INTEGER_32] */
struct S153 {
	int id;
	T6 a1; /* count */
	T0* a2; /* equality_tester */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T6 a5; /* capacity */
	T0* a6; /* internal_cursor */
};

/* Struct for type DS_BUBBLE_SORTER [INTEGER_32] */
struct S154 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type LX_TRANSITION_TABLE [LX_DFA_STATE] */
struct S156 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* array_routines */
};

/* Struct for type SPECIAL [BOOLEAN] */
struct S157 {
	int id;
	T6 z1; /* count */
	T1 z2[1]; /* item */
};

/* Struct for type ARRAY [BOOLEAN] */
struct S158 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE] */
struct S159 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type LX_PROTO */
struct S160 {
	int id;
	T6 a1; /* state_id */
	T0* a2; /* transitions */
	T0* a3; /* common_state */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [LX_PROTO] */
struct S161 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* next_cursor */
	T0* a4; /* container */
	T1 a5; /* before */
};

/* Struct for type DS_LINKED_LIST_CURSOR [LX_TRANSITION_TABLE [LX_DFA_STATE]] */
struct S162 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type KL_ARRAY_ROUTINES [INTEGER_32] */
struct S163 {
	int id;
};

/* Struct for type UT_ARRAY_FORMATTER */
struct S164 {
	int id;
};

/* Struct for type KL_INTEGER_ROUTINES */
struct S165 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST [LX_NFA] */
struct S166 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T6 a5; /* count */
};

/* Struct for type DS_HASH_TABLE [LX_NFA, INTEGER_32] */
struct S167 {
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
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_RULE] */
struct S168 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_RULE] */
struct S169 {
	int id;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T6 a3; /* position */
};

/* Struct for type LX_BAD_ITERATION_VALUES_ERROR */
struct S171 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_ITERATION_NOT_POSITIVE_ERROR */
struct S172 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR */
struct S173 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type UNIX_FILE_INFO */
struct S174 {
	int id;
	T0* a1; /* buffered_file_info */
	T0* a2; /* file_name */
};

/* Struct for type KL_COMPARABLE_COMPARATOR [INTEGER_32] */
struct S176 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST [AP_OPTION] */
struct S178 {
	int id;
	T0* a1; /* internal_cursor */
	T6 a2; /* count */
	T0* a3; /* equality_tester */
	T0* a4; /* storage */
	T0* a5; /* special_routines */
	T6 a6; /* capacity */
};

/* Struct for type DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S179 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T6 a5; /* count */
};

/* Struct for type AP_ERROR_HANDLER */
struct S180 {
	int id;
	T1 a1; /* has_error */
	T0* a2; /* error_file */
	T0* a3; /* warning_file */
	T0* a4; /* info_file */
};

/* Struct for type DS_LINKED_LIST [STRING_8] */
struct S181 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* last_cell */
	T0* a3; /* first_cell */
	T6 a4; /* count */
	T0* a5; /* equality_tester */
};

/* Struct for type DS_LINKED_LIST [INTEGER_32] */
struct S185 {
	int id;
	T6 a1; /* count */
	T0* a2; /* last_cell */
	T0* a3; /* internal_cursor */
	T0* a4; /* first_cell */
};

/* Struct for type DS_LINKED_LIST_CURSOR [AP_OPTION] */
struct S186 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type KL_ANY_ROUTINES */
struct S188 {
	int id;
};

/* Struct for type ST_WORD_WRAPPER */
struct S190 {
	int id;
	T6 a1; /* new_line_indentation */
	T6 a2; /* broken_words */
	T6 a3; /* maximum_text_width */
};

/* Struct for type KL_OPERATING_SYSTEM */
struct S191 {
	int id;
};

/* Struct for type KL_WINDOWS_FILE_SYSTEM */
struct S192 {
	int id;
	T2 a1; /* secondary_directory_separator */
};

/* Struct for type KL_UNIX_FILE_SYSTEM */
struct S193 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [STRING_8] */
struct S194 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [LX_START_CONDITION] */
struct S195 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_START_CONDITION] */
struct S196 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION] */
struct S197 {
	int id;
	T0* a1; /* next_cursor */
	T6 a2; /* position */
	T0* a3; /* container */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8] */
struct S198 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
struct S200 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING_8] */
struct S201 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type TO_SPECIAL [INTEGER_32] */
struct S203 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [ANY] */
struct S204 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [STRING_8] */
struct S205 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
struct S206 {
	int id;
	T0* a1; /* container */
};

/* Struct for type TO_SPECIAL [LX_SYMBOL_CLASS] */
struct S207 {
	int id;
	T0* a1; /* area */
};

/* Struct for type LX_EPSILON_TRANSITION [LX_NFA_STATE] */
struct S208 {
	int id;
	T0* a1; /* target */
};

/* Struct for type LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE] */
struct S211 {
	int id;
	T0* a1; /* label */
	T0* a2; /* target */
};

/* Struct for type LX_SYMBOL_TRANSITION [LX_NFA_STATE] */
struct S212 {
	int id;
	T6 a1; /* label */
	T0* a2; /* target */
};

/* Struct for type DS_BILINKABLE [INTEGER_32] */
struct S213 {
	int id;
	T6 a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
};

/* Struct for type SPECIAL [DS_BILINKABLE [INTEGER_32]] */
struct S214 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [DS_BILINKABLE [INTEGER_32]] */
struct S215 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type TO_SPECIAL [LX_NFA] */
struct S216 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_BUBBLE_SORTER [LX_NFA_STATE] */
struct S217 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type SPECIAL [LX_NFA_STATE] */
struct S219 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_NFA_STATE] */
struct S220 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE] */
struct S221 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [LX_DFA_STATE] */
struct S223 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_DFA_STATE] */
struct S224 {
	int id;
};

/* Struct for type DS_BILINKABLE [LX_PROTO] */
struct S226 {
	int id;
	T0* a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
};

/* Struct for type SPECIAL [LX_SINGLETON] */
struct S227 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_SINGLETON] */
struct S228 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_SINGLETON] */
struct S229 {
	int id;
	T0* a1; /* container */
};

/* Struct for type DS_LINKABLE [LX_TRANSITION_TABLE [LX_DFA_STATE]] */
struct S230 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type SPECIAL [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]] */
struct S232 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]] */
struct S233 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]] */
struct S234 {
	int id;
	T0* a1; /* container */
};

/* Struct for type DS_LINKABLE [LX_RULE] */
struct S235 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type ARRAY [LX_DFA_STATE] */
struct S237 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type KL_ARRAY_ROUTINES [LX_DFA_STATE] */
struct S238 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_NFA] */
struct S239 {
	int id;
	T0* a1; /* container */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [LX_NFA, INTEGER_32] */
struct S240 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32] */
struct S242 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type TO_SPECIAL [LX_RULE] */
struct S243 {
	int id;
	T0* a1; /* area */
};

/* Struct for type STRING_TO_INTEGER_CONVERTOR */
struct S245 {
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

/* Struct for type KL_CHARACTER_BUFFER */
struct S249 {
	int id;
	T0* a1; /* as_special */
	T0* a2; /* area */
};

/* Struct for type KL_COMPARABLE_COMPARATOR [LX_NFA_STATE] */
struct S250 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [AP_OPTION] */
struct S254 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [AP_OPTION] */
struct S256 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [AP_OPTION] */
struct S257 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S258 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S259 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S260 {
	int id;
};

/* Struct for type DS_LINKED_LIST_CURSOR [STRING_8] */
struct S261 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T1 a3; /* before */
	T0* a4; /* next_cursor */
	T0* a5; /* container */
};

/* Struct for type DS_LINKABLE [STRING_8] */
struct S262 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_LINKABLE [INTEGER_32] */
struct S263 {
	int id;
	T6 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_LINKED_LIST_CURSOR [INTEGER_32] */
struct S264 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type EXECUTION_ENVIRONMENT */
struct S265 {
	int id;
};

/* Struct for type TO_SPECIAL [LX_START_CONDITION] */
struct S266 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8] */
struct S267 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
struct S268 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [LX_NFA_STATE] */
struct S269 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [LX_DFA_STATE] */
struct S270 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [LX_SINGLETON] */
struct S271 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]] */
struct S272 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [LX_NFA, INTEGER_32] */
struct S273 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type SPECIAL [NATURAL_8] */
struct S274 {
	int id;
	T6 z1; /* count */
	T8 z2[1]; /* item */
};

/* Struct for type DS_SHELL_SORTER [INTEGER_32] */
struct S275 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type INTEGER_OVERFLOW_CHECKER */
struct S276 {
	int id;
	T0* a1; /* integer_overflow_state1 */
	T0* a2; /* integer_overflow_state2 */
	T0* a3; /* natural_overflow_state1 */
	T0* a4; /* natural_overflow_state2 */
};

/* Struct for type TO_SPECIAL [AP_OPTION] */
struct S277 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S278 {
	int id;
	T0* a1; /* area */
};

/* Struct for type C_STRING */
struct S282 {
	int id;
	T6 a1; /* count */
	T0* a2; /* managed_data */
};

/* Struct for type SPECIAL [NATURAL_64] */
struct S283 {
	int id;
	T6 z1; /* count */
	T11 z2[1]; /* item */
};

/* Struct for type PLATFORM */
struct S285 {
	int id;
};

/* Struct for type MANAGED_POINTER */
struct S286 {
	int id;
	T1 a1; /* is_shared */
	T14 a2; /* item */
	T6 a3; /* count */
};

/* Struct for type AP_OPTION_COMPARATOR */
struct S287 {
	int id;
};

/* Struct for type DS_QUICK_SORTER [AP_OPTION] */
struct S288 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type EXCEPTIONS */
struct S292 {
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
extern T39 GE_default39;
extern T40 GE_default40;
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
extern T58 GE_default58;
extern T59 GE_default59;
extern T60 GE_default60;
extern T61 GE_default61;
extern T62 GE_default62;
extern T63 GE_default63;
extern T64 GE_default64;
extern T65 GE_default65;
extern T69 GE_default69;
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
extern T86 GE_default86;
extern T87 GE_default87;
extern T88 GE_default88;
extern T89 GE_default89;
extern T90 GE_default90;
extern T91 GE_default91;
extern T92 GE_default92;
extern T93 GE_default93;
extern T94 GE_default94;
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
extern T156 GE_default156;
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
extern T171 GE_default171;
extern T172 GE_default172;
extern T173 GE_default173;
extern T174 GE_default174;
extern T176 GE_default176;
extern T178 GE_default178;
extern T179 GE_default179;
extern T180 GE_default180;
extern T181 GE_default181;
extern T185 GE_default185;
extern T186 GE_default186;
extern T188 GE_default188;
extern T190 GE_default190;
extern T191 GE_default191;
extern T192 GE_default192;
extern T193 GE_default193;
extern T194 GE_default194;
extern T195 GE_default195;
extern T196 GE_default196;
extern T197 GE_default197;
extern T198 GE_default198;
extern T200 GE_default200;
extern T201 GE_default201;
extern T203 GE_default203;
extern T204 GE_default204;
extern T205 GE_default205;
extern T206 GE_default206;
extern T207 GE_default207;
extern T208 GE_default208;
extern T211 GE_default211;
extern T212 GE_default212;
extern T213 GE_default213;
extern T214 GE_default214;
extern T215 GE_default215;
extern T216 GE_default216;
extern T217 GE_default217;
extern T219 GE_default219;
extern T220 GE_default220;
extern T221 GE_default221;
extern T223 GE_default223;
extern T224 GE_default224;
extern T226 GE_default226;
extern T227 GE_default227;
extern T228 GE_default228;
extern T229 GE_default229;
extern T230 GE_default230;
extern T232 GE_default232;
extern T233 GE_default233;
extern T234 GE_default234;
extern T235 GE_default235;
extern T237 GE_default237;
extern T238 GE_default238;
extern T239 GE_default239;
extern T240 GE_default240;
extern T242 GE_default242;
extern T243 GE_default243;
extern T245 GE_default245;
extern T249 GE_default249;
extern T250 GE_default250;
extern T253 GE_default253;
extern T254 GE_default254;
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
extern T282 GE_default282;
extern T283 GE_default283;
extern T285 GE_default285;
extern T286 GE_default286;
extern T287 GE_default287;
extern T288 GE_default288;
extern T291 GE_default291;
extern T292 GE_default292;

extern T0* GE_ms(char* s, T6 c);
/* Call to ANY.same_type */
extern T1 T19x28T0(T0* C, T0* a1);
/* Call to UT_ERROR.default_message */
extern T0* T43x3941(T0* C);
/* Call to AP_OPTION.short_form */
extern T2 T66x5194(T0* C);
/* Call to AP_OPTION.long_form */
extern T0* T66x5189(T0* C);
/* Call to AP_OPTION.has_long_form */
extern T1 T66x5196(T0* C);
/* Call to AP_OPTION.description */
extern T0* T66x5187(T0* C);
/* Call to AP_OPTION.names */
extern T0* T66x5191(T0* C);
/* Call to AP_OPTION.is_hidden */
extern T1 T66x5198(T0* C);
/* Call to AP_OPTION.example */
extern T0* T66x5188(T0* C);
/* Call to AP_OPTION.name */
extern T0* T66x5190(T0* C);
/* Call to AP_OPTION.needs_parameter */
extern T1 T66x5200(T0* C);
/* Call to AP_OPTION.has_short_form */
extern T1 T66x5197(T0* C);
/* Call to AP_OPTION.allows_parameter */
extern T1 T66x5195(T0* C);
/* Call to AP_OPTION.maximum_occurrences */
extern T6 T66x5193(T0* C);
/* Call to AP_OPTION.occurrences */
extern T6 T66x5192(T0* C);
/* Call to AP_OPTION.was_found */
extern T1 T66x5202(T0* C);
/* Call to AP_OPTION.is_mandatory */
extern T1 T66x5199(T0* C);
/* Call to LX_TRANSITION [LX_NFA_STATE].target */
extern T0* T209x7519(T0* C);
/* Call to LX_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T209x7522T6(T0* C, T6 a1);
/* Call to LX_TRANSITION [LX_NFA_STATE].cloned_object */
extern T0* T209x1715(T0* C);
/* Call to AP_OPTION.record_occurrence */
extern void T66x5213T0(T0* C, T0* a1);
/* Call to AP_OPTION.reset */
extern void T66x5214(T0* C);
/* Call to LX_TRANSITION [LX_NFA_STATE].record */
extern void T209x7523T0(T0* C, T0* a1);
/* Call to LX_TRANSITION [LX_NFA_STATE].set_target */
extern void T209x7520T0(T0* C, T0* a1);
/* GELEX.execute */
extern T0* T21c7(void);
/* GELEX.print_backing_up_report */
extern void T21f12(T0* C);
/* KL_STANDARD_FILES.output */
extern unsigned char ge357os4002;
extern T0* ge357ov4002;
extern T0* T45f2(T0* C);
/* KL_STDOUT_FILE.make */
extern T0* T58c9(void);
/* KL_STDOUT_FILE.make_open_stdout */
extern void T58f15(T0* C, T0* a1);
/* KL_STDOUT_FILE.set_write_mode */
extern void T58f19(T0* C);
/* KL_STDOUT_FILE.console_def */
extern T14 T58f4(T0* C, T6 a1);
/* KL_STDOUT_FILE.old_make */
extern void T58f18(T0* C, T0* a1);
/* GELEX.std */
extern unsigned char ge355os1565;
extern T0* ge355ov1565;
extern T0* T21f5(T0* C);
/* KL_STANDARD_FILES.default_create */
extern T0* T45c4(void);
/* KL_EXCEPTIONS.die */
extern void T44f2(T0* C, T6 a1);
/* GELEX.exceptions */
extern unsigned char ge373os1566;
extern T0* ge373ov1566;
extern T0* T21f4(T0* C);
/* KL_EXCEPTIONS.default_create */
extern T0* T44c1(void);
/* UT_ERROR_HANDLER.report_error */
extern void T24f7(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_error_message */
extern void T24f11(T0* C, T0* a1);
/* KL_STDERR_FILE.put_line */
extern void T73f10(T0* C, T0* a1);
/* KL_STDERR_FILE.put_new_line */
extern void T73f14(T0* C);
/* KL_STDERR_FILE.put_string */
extern void T73f11(T0* C, T0* a1);
/* KL_STDERR_FILE.old_put_string */
extern void T73f15(T0* C, T0* a1);
/* KL_STDERR_FILE.console_ps */
extern void T73f19(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STRING_ROUTINES.as_string */
extern T0* T69f2(T0* C, T0* a1);
/* STRING_8.string */
extern T0* T17f14(T0* C);
/* STRING_8.append */
extern void T17f37(T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].copy_data */
extern void T15f9(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [CHARACTER_8].move_data */
extern void T15f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].overlapping_move */
extern void T15f12(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].non_overlapping_move */
extern void T15f11(T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.resize */
extern void T17f36(T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].aliased_resized_area */
extern T0* T15f3(T0* C, T6 a1);
/* INTEGER_32.infix ">=" */
extern T1 T6f5(T6* C, T6 a1);
/* STRING_8.additional_space */
extern T6 T17f6(T0* C);
/* INTEGER_32.max */
extern T6 T6f12(T6* C, T6 a1);
/* STRING_8.capacity */
extern T6 T17f5(T0* C);
/* INTEGER_32.infix ">" */
extern T1 T6f1(T6* C, T6 a1);
/* STRING_8.make */
extern void T17f31(T0* C, T6 a1);
/* STRING_8.make */
extern T0* T17c31(T6 a1);
/* STRING_8.make_area */
extern void T17f35(T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].make */
extern T0* T15c8(T6 a1);
/* KL_ANY_ROUTINES.same_types */
extern T1 T188f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.any_ */
extern unsigned char ge317os1693;
extern T0* ge317ov1693;
extern T0* T69f7(T0* C);
/* KL_ANY_ROUTINES.default_create */
extern T0* T188c3(void);
/* KL_STDERR_FILE.string_ */
extern unsigned char ge325os1574;
extern T0* ge325ov1574;
extern T0* T73f5(T0* C);
/* KL_STRING_ROUTINES.default_create */
extern T0* T69c12(void);
/* UT_ERROR_HANDLER.message */
extern T0* T24f5(T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.make */
extern T0* T56c7(T0* a1);
/* ARRAY [STRING_8].put */
extern void T131f8(T0* C, T0* a1, T6 a2);
/* ARRAY [STRING_8].make */
extern T0* T131c7(T6 a1, T6 a2);
/* ARRAY [STRING_8].make_area */
extern void T131f9(T0* C, T6 a1);
/* SPECIAL [STRING_8].make */
extern T0* T88c4(T6 a1);
/* INTEGER_32.infix "<=" */
extern T1 T6f7(T6* C, T6 a1);
/* KL_TEXT_OUTPUT_FILE.close */
extern void T55f22(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_close */
extern void T55f30(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_close */
extern void T55f33(T0* C, T14 a1);
/* LX_COMPRESSED_DFA.print_backing_up_report */
extern void T47f82(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_line */
extern void T58f12(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_new_line */
extern void T58f14(T0* C);
/* KL_STDOUT_FILE.put_string */
extern void T58f10(T0* C, T0* a1);
/* KL_STDOUT_FILE.old_put_string */
extern void T58f16(T0* C, T0* a1);
/* KL_STDOUT_FILE.console_ps */
extern void T58f20(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STDOUT_FILE.string_ */
extern T0* T58f6(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_line */
extern void T55f25(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.put_new_line */
extern void T55f27(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_string */
extern void T55f23(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_put_string */
extern void T55f31(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_ps */
extern void T55f34(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_TEXT_OUTPUT_FILE.string_ */
extern T0* T55f9(T0* C);
/* LX_COMPRESSED_DFA.print_backing_up_report */
extern void T47f82p1(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_character */
extern void T58f11(T0* C, T2 a1);
/* KL_STDOUT_FILE.old_put_character */
extern void T58f17(T0* C, T2 a1);
/* KL_STDOUT_FILE.console_pc */
extern void T58f21(T0* C, T14 a1, T2 a2);
/* KL_TEXT_OUTPUT_FILE.put_character */
extern void T55f24(T0* C, T2 a1);
/* KL_TEXT_OUTPUT_FILE.old_put_character */
extern void T55f32(T0* C, T2 a1);
/* KL_TEXT_OUTPUT_FILE.file_pc */
extern void T55f35(T0* C, T14 a1, T2 a2);
/* LX_COMPRESSED_DFA.print_transitions */
extern void T47f95(T0* C, T0* a1, T0* a2);
/* LX_COMPRESSED_DFA.print_readable_character */
extern void T47f111(T0* C, T6 a1, T0* a2);
/* KL_INTEGER_ROUTINES.to_character */
extern T2 T165f1(T0* C, T6 a1);
/* LX_COMPRESSED_DFA.integer_ */
extern unsigned char ge322os2656;
extern T0* ge322ov2656;
extern T0* T47f77(T0* C);
/* KL_INTEGER_ROUTINES.default_create */
extern T0* T165c2(void);
/* STRING_8.append_string */
extern void T17f33(T0* C, T0* a1);
/* KL_STRING_ROUTINES.cloned_string */
extern T0* T69f6(T0* C, T0* a1);
/* STRING_8.twin */
extern T0* T17f15(T0* C);
/* STRING_8.copy */
extern void T17f42(T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].twin */
extern T0* T15f4(T0* C);
/* INTEGER_32.out */
extern T0* T6f6(T6* C);
/* STRING_8.append_integer */
extern void T17f34(T0* C, T6 a1);
/* STRING_8.append_character */
extern void T17f32(T0* C, T2 a1);
/* LX_COMPRESSED_DFA.string_ */
extern T0* T47f75(T0* C);
/* ARRAY [BOOLEAN].item */
extern T1 T158f4(T0* C, T6 a1);
/* ARRAY [BOOLEAN].put */
extern void T158f6(T0* C, T1 a1, T6 a2);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].target */
extern T0* T156f9(T0* C, T6 a1);
/* ARRAY [LX_DFA_STATE].item */
extern T0* T237f4(T0* C, T6 a1);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].valid_label */
extern T1 T156f10(T0* C, T6 a1);
/* ARRAY [LX_DFA_STATE].valid_index */
extern T1 T237f6(T0* C, T6 a1);
/* ARRAY [INTEGER_32].item */
extern T6 T142f4(T0* C, T6 a1);
/* ARRAY [BOOLEAN].make */
extern T0* T158c5(T6 a1, T6 a2);
/* ARRAY [BOOLEAN].make_area */
extern void T158f8(T0* C, T6 a1);
/* SPECIAL [BOOLEAN].make */
extern T0* T157c3(T6 a1);
/* LX_COMPRESSED_DFA.print_rule_line_numbers */
extern void T47f94(T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_LIST [INTEGER_32].item */
extern T6 T153f7(T0* C, T6 a1);
/* DS_ARRAYED_LIST [INTEGER_32].sort */
extern void T153f13(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [INTEGER_32].sort */
extern void T154f3(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [INTEGER_32].sort_with_comparator */
extern void T154f4(T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [INTEGER_32].subsort_with_comparator */
extern void T154f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* DS_ARRAYED_LIST [INTEGER_32].replace */
extern void T153f14(T0* C, T6 a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [INTEGER_32].less_than */
extern T1 T176f1(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [INTEGER_32].is_empty */
extern T1 T153f10(T0* C);
/* LX_COMPRESSED_DFA.integer_sorter */
extern unsigned char ge160os4379;
extern T0* ge160ov4379;
extern T0* T47f57(T0* C);
/* DS_BUBBLE_SORTER [INTEGER_32].make */
extern T0* T154c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [INTEGER_32].make */
extern T0* T176c2(void);
/* DS_ARRAYED_LIST [INTEGER_32].put_last */
extern void T153f12(T0* C, T6 a1);
/* DS_ARRAYED_LIST [INTEGER_32].has */
extern T1 T153f8(T0* C, T6 a1);
/* LX_NFA.has */
extern T1 T93f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].has */
extern T1 T134f7(T0* C, T0* a1);
/* ARRAY [LX_RULE].item */
extern T0* T136f5(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].item */
extern T0* T134f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [INTEGER_32].make */
extern T0* T153c11(T6 a1);
/* DS_ARRAYED_LIST [INTEGER_32].new_cursor */
extern T0* T153f9(T0* C);
/* DS_ARRAYED_LIST_CURSOR [INTEGER_32].make */
extern T0* T206c2(T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].make */
extern T0* T84f1(T0* C, T6 a1);
/* TO_SPECIAL [INTEGER_32].make_area */
extern T0* T203c2(T6 a1);
/* SPECIAL [INTEGER_32].make */
extern T0* T83c6(T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].default_create */
extern T0* T84c4(void);
/* KL_STDOUT_FILE.put_integer */
extern void T58f13(T0* C, T6 a1);
/* KL_TEXT_OUTPUT_FILE.put_integer */
extern void T55f26(T0* C, T6 a1);
/* LX_DFA_STATE.is_accepting */
extern T1 T132f11(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].is_empty */
extern T1 T48f13(T0* C);
/* DS_ARRAYED_LIST [LX_DFA_STATE].item */
extern T0* T137f7(T0* C, T6 a1);
/* LX_FULL_DFA.print_backing_up_report */
extern void T54f51(T0* C, T0* a1);
/* LX_FULL_DFA.print_backing_up_report */
extern void T54f51p1(T0* C, T0* a1);
/* LX_FULL_DFA.print_transitions */
extern void T54f64(T0* C, T0* a1, T0* a2);
/* LX_FULL_DFA.print_readable_character */
extern void T54f75(T0* C, T6 a1, T0* a2);
/* LX_FULL_DFA.integer_ */
extern T0* T54f48(T0* C);
/* LX_FULL_DFA.string_ */
extern T0* T54f46(T0* C);
/* LX_FULL_DFA.print_rule_line_numbers */
extern void T54f63(T0* C, T0* a1, T0* a2);
/* LX_FULL_DFA.integer_sorter */
extern T0* T54f36(T0* C);
/* KL_TEXT_OUTPUT_FILE.is_open_write */
extern T1 T55f11(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
extern T1 T55f8(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T55f21(T0* C);
/* KL_TEXT_OUTPUT_FILE.is_closed */
extern T1 T55f12(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_closed */
extern T1 T55f19(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_write */
extern void T55f29(T0* C);
/* KL_TEXT_OUTPUT_FILE.default_pointer */
extern T14 T55f16(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T55f29p1(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_open */
extern T14 T55f18(T0* C, T14 a1, T6 a2);
/* STRING_8.to_c */
extern T0* T17f4(T0* C);
/* KL_TEXT_OUTPUT_FILE.make */
extern T0* T55c20(T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_make */
extern void T55f28(T0* C, T0* a1);
/* GELEX.print_scanner */
extern void T21f11(T0* C);
/* LX_COMPRESSED_DFA.print_scanner */
extern void T47f81(T0* C, T0* a1);
/* LX_COMPRESSED_DFA.print_eiffel_code */
extern void T47f93(T0* C, T0* a1);
/* LX_COMPRESSED_DFA.print_constants */
extern void T47f92(T0* C, T0* a1);
/* LX_COMPRESSED_DFA.print_constants */
extern void T47f92p1(T0* C, T0* a1);
/* ARRAY [STRING_8].item */
extern T0* T131f5(T0* C, T6 a1);
/* UT_BOOLEAN_FORMATTER.put_eiffel_boolean */
extern void T152f4(T0* C, T0* a1, T1 a2);
/* LX_COMPRESSED_DFA.boolean_formatter_ */
extern unsigned char ge280os4414;
extern T0* ge280ov4414;
extern T0* T47f56(T0* C);
/* UT_BOOLEAN_FORMATTER.default_create */
extern T0* T152c3(void);
/* LX_COMPRESSED_DFA.print_eiffel_tables */
extern void T47f91(T0* C, T0* a1);
/* LX_COMPRESSED_DFA.print_eiffel_array */
extern void T47f110(T0* C, T0* a1, T0* a2, T0* a3);
/* INTEGER_32.min */
extern T6 T6f13(T6* C, T6 a1);
/* UT_ARRAY_FORMATTER.put_integer_array */
extern void T164f8(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* LX_COMPRESSED_DFA.array_formatter_ */
extern unsigned char ge280os4416;
extern T0* ge280ov4416;
extern T0* T47f69(T0* C);
/* UT_ARRAY_FORMATTER.default_create */
extern T0* T164c7(void);
/* ARRAY [INTEGER_32].count */
extern T6 T142f5(T0* C);
/* LX_COMPRESSED_DFA.print_eof_actions */
extern void T47f90(T0* C, T0* a1);
/* LX_ACTION.out */
extern T0* T100f2(T0* C);
/* DS_LINKED_LIST_CURSOR [LX_RULE].forth */
extern void T151f9(T0* C);
/* DS_LINKED_LIST [LX_RULE].cursor_forth */
extern void T150f11(T0* C, T0* a1);
/* DS_LINKED_LIST [LX_RULE].add_traversing_cursor */
extern void T150f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [LX_RULE].set_next_cursor */
extern void T151f11(T0* C, T0* a1);
/* DS_LINKED_LIST [LX_RULE].remove_traversing_cursor */
extern void T150f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [LX_RULE].set */
extern void T151f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [LX_RULE].item */
extern T0* T151f6(T0* C);
/* DS_LINKED_LIST_CURSOR [LX_RULE].start */
extern void T151f8(T0* C);
/* DS_LINKED_LIST [LX_RULE].cursor_start */
extern void T150f10(T0* C, T0* a1);
/* DS_LINKED_LIST [LX_RULE].cursor_off */
extern T1 T150f7(T0* C, T0* a1);
/* DS_LINKED_LIST [LX_RULE].new_cursor */
extern T0* T150f6(T0* C);
/* DS_LINKED_LIST_CURSOR [LX_RULE].make */
extern T0* T151c7(T0* a1);
/* DS_LINKED_LIST [LX_RULE].put_last */
extern void T150f9(T0* C, T0* a1);
/* DS_LINKABLE [LX_RULE].put_right */
extern void T235f4(T0* C, T0* a1);
/* DS_LINKABLE [LX_RULE].make */
extern T0* T235c3(T0* a1);
/* DS_LINKED_LIST [LX_RULE].is_empty */
extern T1 T150f5(T0* C);
/* DS_ARRAYED_LIST [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].put_last */
extern void T148f9(T0* C, T0* a1);
/* DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]].make */
extern T0* T149c3(T0* a1, T0* a2);
/* DS_LINKED_LIST [LX_RULE].make */
extern T0* T150c8(void);
/* DS_ARRAYED_LIST [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].item */
extern T0* T148f6(T0* C, T6 a1);
/* DS_ARRAYED_LIST [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].make */
extern T0* T148c8(T6 a1);
/* DS_ARRAYED_LIST [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].new_cursor */
extern T0* T148f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].make */
extern T0* T234c2(T0* a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].make */
extern T0* T233f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].make_area */
extern T0* T272c2(T6 a1);
/* SPECIAL [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].make */
extern T0* T232c2(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].default_create */
extern T0* T233c2(void);
/* ARRAY [LX_RULE].count */
extern T6 T136f4(T0* C);
/* LX_COMPRESSED_DFA.print_actions */
extern void T47f89(T0* C, T0* a1);
/* LX_COMPRESSED_DFA.print_action_routine */
extern void T47f109(T0* C, T0* a1, T0* a2);
/* LX_COMPRESSED_DFA.print_action_body */
extern void T47f118(T0* C, T0* a1, T0* a2);
/* LX_COMPRESSED_DFA.print_binary_search_actions */
extern void T47f108(T0* C, T0* a1, T6 a2, T6 a3);
/* LX_COMPRESSED_DFA.print_action_call */
extern void T47f117(T0* C, T0* a1, T0* a2);
/* LX_COMPRESSED_DFA.print_inspect_actions */
extern void T47f107(T0* C, T0* a1);
/* LX_COMPRESSED_DFA.print_build_tables */
extern void T47f88(T0* C, T0* a1);
/* LX_COMPRESSED_DFA.print_status_report_routines */
extern void T47f87(T0* C, T0* a1);
/* ARRAY [STRING_8].count */
extern T6 T131f6(T0* C);
/* LX_COMPRESSED_DFA.print_eiffel_header */
extern void T47f86(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].item */
extern T0* T74f8(T0* C, T6 a1);
/* LX_FULL_DFA.print_scanner */
extern void T54f50(T0* C, T0* a1);
/* LX_FULL_DFA.print_eiffel_code */
extern void T54f62(T0* C, T0* a1);
/* LX_FULL_DFA.print_constants */
extern void T54f61(T0* C, T0* a1);
/* LX_FULL_DFA.print_constants */
extern void T54f61p1(T0* C, T0* a1);
/* LX_FULL_DFA.boolean_formatter_ */
extern T0* T54f35(T0* C);
/* LX_FULL_DFA.print_eiffel_tables */
extern void T54f60(T0* C, T0* a1);
/* LX_FULL_DFA.print_eiffel_array */
extern void T54f74(T0* C, T0* a1, T0* a2, T0* a3);
/* LX_FULL_DFA.array_formatter_ */
extern T0* T54f40(T0* C);
/* LX_FULL_DFA.print_eof_actions */
extern void T54f59(T0* C, T0* a1);
/* LX_FULL_DFA.print_actions */
extern void T54f58(T0* C, T0* a1);
/* LX_FULL_DFA.print_action_routine */
extern void T54f73(T0* C, T0* a1, T0* a2);
/* LX_FULL_DFA.print_action_body */
extern void T54f80(T0* C, T0* a1, T0* a2);
/* LX_FULL_DFA.print_binary_search_actions */
extern void T54f72(T0* C, T0* a1, T6 a2, T6 a3);
/* LX_FULL_DFA.print_action_call */
extern void T54f79(T0* C, T0* a1, T0* a2);
/* LX_FULL_DFA.print_inspect_actions */
extern void T54f71(T0* C, T0* a1);
/* LX_FULL_DFA.print_build_tables */
extern void T54f57(T0* C, T0* a1);
/* LX_FULL_DFA.print_status_report_routines */
extern void T54f56(T0* C, T0* a1);
/* LX_FULL_DFA.print_eiffel_header */
extern void T54f55(T0* C, T0* a1);
/* GELEX.build_dfa */
extern void T21f10(T0* C);
/* LX_DEFAULT_RULE_CAN_BE_MATCHED_ERROR.make */
extern T0* T52c7(T0* a1);
/* LX_RULE_CANNOT_BE_MATCHED_ERROR.make */
extern T0* T51c7(T0* a1, T6 a2);
/* UT_ERROR_HANDLER.report_warning */
extern void T24f8(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_warning_message */
extern void T24f12(T0* C, T0* a1);
/* LX_DANGEROUS_TRAILING_CONTEXT_ERROR.make */
extern T0* T50c7(T0* a1, T6 a2);
/* DS_ARRAYED_LIST [LX_RULE].item */
extern T0* T48f8(T0* C, T6 a1);
/* LX_COMPRESSED_DFA.dangerous_variable_trail_rules */
extern T0* T47f51(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].sort */
extern void T48f19(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_RULE].sort */
extern void T138f3(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_RULE].sort_with_comparator */
extern void T138f4(T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [LX_RULE].subsort_with_comparator */
extern void T138f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* DS_ARRAYED_LIST [LX_RULE].replace */
extern void T48f24(T0* C, T0* a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [LX_RULE].less_than */
extern T1 T140f1(T0* C, T0* a1, T0* a2);
/* LX_RULE.infix "<" */
extern T1 T49f13(T0* C, T0* a1);
/* LX_COMPRESSED_DFA.rule_sorter */
extern unsigned char ge156os4340;
extern T0* ge156ov4340;
extern T0* T47f52(T0* C);
/* DS_BUBBLE_SORTER [LX_RULE].make */
extern T0* T138c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [LX_RULE].make */
extern T0* T140c2(void);
/* DS_ARRAYED_LIST [LX_RULE].put_last */
extern void T48f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].has */
extern T1 T48f7(T0* C, T0* a1);
/* LX_DFA_STATE.is_accepting_head */
extern T1 T132f10(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].make */
extern T0* T48c15(T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].new_cursor */
extern T0* T48f9(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_RULE].make */
extern T0* T169c4(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].make */
extern T0* T168f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_RULE].make_area */
extern T0* T243c2(T6 a1);
/* SPECIAL [LX_RULE].make */
extern T0* T135c4(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].default_create */
extern T0* T168c3(void);
/* LX_COMPRESSED_DFA.make */
extern T0* T47c80(T0* a1);
/* LX_COMPRESSED_DFA.build */
extern void T47f85(T0* C);
/* LX_COMPRESSED_DFA.build_accept_tables */
extern void T47f106(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].first */
extern T0* T48f14(T0* C);
/* LX_RULE.variable_trail */
extern T1 T49f14(T0* C);
/* ARRAY [INTEGER_32].put */
extern void T142f11(T0* C, T6 a1, T6 a2);
/* LX_COMPRESSED_DFA.build_base_def_tables */
extern void T47f105(T0* C);
/* LX_COMPRESSED_DFA.build_nxt_chk_tables */
extern void T47f104(T0* C);
/* LX_COMPRESSED_DFA.put_jam_state */
extern void T47f103(T0* C);
/* KL_ARRAY_ROUTINES [INTEGER_32].resize */
extern void T163f2(T0* C, T0* a1, T6 a2, T6 a3);
/* ARRAY [INTEGER_32].conservative_resize */
extern void T142f13(T0* C, T6 a1, T6 a2);
/* SPECIAL [INTEGER_32].fill_with */
extern void T83f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].move_data */
extern void T83f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].overlapping_move */
extern void T83f12(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].non_overlapping_move */
extern void T83f11(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].aliased_resized_area */
extern T0* T83f3(T0* C, T6 a1);
/* ARRAY [INTEGER_32].make_area */
extern void T142f12(T0* C, T6 a1);
/* ARRAY [INTEGER_32].empty_area */
extern T1 T142f6(T0* C);
/* LX_COMPRESSED_DFA.integer_array_ */
extern unsigned char ge318os2843;
extern T0* ge318ov2843;
extern T0* T47f68(T0* C);
/* KL_ARRAY_ROUTINES [INTEGER_32].default_create */
extern T0* T163c1(void);
/* LX_COMPRESSED_DFA.put_singletons */
extern void T47f102(T0* C);
/* LX_COMPRESSED_DFA.put_singleton */
extern void T47f116(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_SINGLETON].item */
extern T0* T145f6(T0* C, T6 a1);
/* LX_COMPRESSED_DFA.put_templates */
extern void T47f101(T0* C);
/* DS_LINKED_LIST_CURSOR [LX_TRANSITION_TABLE [LX_DFA_STATE]].forth */
extern void T162f9(T0* C);
/* LX_TEMPLATE_LIST.cursor_forth */
extern void T146f16(T0* C, T0* a1);
/* LX_TEMPLATE_LIST.add_traversing_cursor */
extern void T146f17(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [LX_TRANSITION_TABLE [LX_DFA_STATE]].set_next_cursor */
extern void T162f11(T0* C, T0* a1);
/* LX_TEMPLATE_LIST.remove_traversing_cursor */
extern void T146f18(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [LX_TRANSITION_TABLE [LX_DFA_STATE]].set */
extern void T162f10(T0* C, T0* a1, T1 a2, T1 a3);
/* LX_COMPRESSED_DFA.put_entry */
extern void T47f115(T0* C, T6 a1, T6 a2, T0* a3);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].capacity */
extern T6 T156f5(T0* C);
/* ARRAY [LX_DFA_STATE].count */
extern T6 T237f5(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].maximum_label */
extern T6 T156f4(T0* C);
/* LX_DFA_STATE.default */
extern T0* T132f9(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].upper */
extern T6 T156f8(T0* C);
/* DS_ARRAYED_LIST [LX_SINGLETON].is_full */
extern T1 T145f7(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].minimum_label */
extern T6 T156f7(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].lower */
extern T6 T156f6(T0* C);
/* LX_TEMPLATE_LIST.equiv_template */
extern T0* T146f7(T0* C, T0* a1);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].set_target */
extern void T156f15(T0* C, T0* a1, T6 a2);
/* ARRAY [LX_DFA_STATE].put */
extern void T237f9(T0* C, T0* a1, T6 a2);
/* LX_EQUIVALENCE_CLASSES.equivalence_class */
extern T6 T94f9(T0* C, T6 a1);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].item */
extern T0* T215f4(T0* C, T6 a1);
/* LX_EQUIVALENCE_CLASSES.is_representative */
extern T1 T94f8(T0* C, T6 a1);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].make */
extern T0* T156c14(T6 a1, T6 a2);
/* KL_ARRAY_ROUTINES [LX_DFA_STATE].default_create */
extern T0* T238c2(void);
/* ARRAY [LX_DFA_STATE].make */
extern T0* T237c8(T6 a1, T6 a2);
/* ARRAY [LX_DFA_STATE].make_area */
extern void T237f10(T0* C, T6 a1);
/* SPECIAL [LX_DFA_STATE].make */
extern T0* T223c5(T6 a1);
/* LX_EQUIVALENCE_CLASSES.capacity */
extern T6 T94f7(T0* C);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].count */
extern T6 T215f5(T0* C);
/* DS_LINKED_LIST_CURSOR [LX_TRANSITION_TABLE [LX_DFA_STATE]].item */
extern T0* T162f6(T0* C);
/* DS_LINKED_LIST_CURSOR [LX_TRANSITION_TABLE [LX_DFA_STATE]].start */
extern void T162f8(T0* C);
/* LX_TEMPLATE_LIST.cursor_start */
extern void T146f15(T0* C, T0* a1);
/* LX_TEMPLATE_LIST.cursor_off */
extern T1 T146f10(T0* C, T0* a1);
/* LX_TEMPLATE_LIST.new_cursor */
extern T0* T146f6(T0* C);
/* DS_LINKED_LIST_CURSOR [LX_TRANSITION_TABLE [LX_DFA_STATE]].make */
extern T0* T162c7(T0* a1);
/* LX_EQUIVALENCE_CLASSES.to_array */
extern T0* T94f3(T0* C, T6 a1, T6 a2);
/* LX_EQUIVALENCE_CLASSES.lower */
extern T6 T94f5(T0* C);
/* LX_EQUIVALENCE_CLASSES.upper */
extern T6 T94f4(T0* C);
/* LX_EQUIVALENCE_CLASSES.build */
extern void T94f11(T0* C);
/* DS_BILINKABLE [INTEGER_32].put */
extern void T213f5(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_SINGLETON].put_last */
extern void T145f10(T0* C, T0* a1);
/* LX_SINGLETON.make */
extern T0* T143c5(T6 a1, T6 a2, T6 a3, T6 a4);
/* LX_COMPRESSED_DFA.put_state */
extern void T47f100(T0* C, T0* a1);
/* LX_PROTO_QUEUE.move_to_front */
extern void T144f14(T0* C, T0* a1);
/* LX_PROTO_QUEUE.put_first */
extern void T144f16(T0* C, T0* a1);
/* DS_BILINKABLE [LX_PROTO].put_right */
extern void T226f5(T0* C, T0* a1);
/* DS_BILINKABLE [LX_PROTO].attach_left */
extern void T226f7(T0* C, T0* a1);
/* DS_BILINKABLE [LX_PROTO].make */
extern T0* T226c4(T0* a1);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].remove */
extern void T161f15(T0* C);
/* LX_PROTO_QUEUE.remove_at_cursor */
extern void T144f25(T0* C, T0* a1);
/* LX_PROTO_QUEUE.move_all_cursors */
extern void T144f29(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].set_current_cell */
extern void T161f19(T0* C, T0* a1);
/* LX_PROTO_QUEUE.remove_last */
extern void T144f15(T0* C);
/* LX_PROTO_QUEUE.set_last_cell */
extern void T144f19(T0* C, T0* a1);
/* DS_BILINKABLE [LX_PROTO].forget_right */
extern void T226f8(T0* C);
/* LX_PROTO_QUEUE.move_last_cursors_after */
extern void T144f18(T0* C);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].set_next_cursor */
extern void T161f17(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].set_after */
extern void T161f16(T0* C);
/* LX_PROTO_QUEUE.wipe_out */
extern void T144f17(T0* C);
/* LX_PROTO_QUEUE.move_all_cursors_after */
extern void T144f20(T0* C);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].is_last */
extern T1 T161f9(T0* C);
/* LX_PROTO_QUEUE.cursor_is_last */
extern T1 T144f11(T0* C, T0* a1);
/* LX_PROTO_QUEUE.remove_first */
extern void T144f28(T0* C);
/* LX_PROTO_QUEUE.set_first_cell */
extern void T144f30(T0* C, T0* a1);
/* DS_BILINKABLE [LX_PROTO].forget_left */
extern void T226f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].is_first */
extern T1 T161f8(T0* C);
/* LX_PROTO_QUEUE.cursor_is_first */
extern T1 T144f10(T0* C, T0* a1);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].cloned_object */
extern T0* T156f12(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].twin */
extern T0* T156f13(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].copy */
extern void T156f16(T0* C, T0* a1);
/* KL_ARRAY_ROUTINES [LX_DFA_STATE].cloned_array */
extern T0* T238f1(T0* C, T0* a1);
/* ARRAY [LX_DFA_STATE].twin */
extern T0* T237f7(T0* C);
/* ARRAY [LX_DFA_STATE].copy */
extern void T237f11(T0* C, T0* a1);
/* ARRAY [LX_DFA_STATE].set_area */
extern void T237f13(T0* C, T0* a1);
/* SPECIAL [LX_DFA_STATE].twin */
extern T0* T223f4(T0* C);
/* LX_PROTO_QUEUE.put */
extern void T144f13(T0* C, T6 a1, T0* a2, T0* a3);
/* LX_PROTO.make */
extern T0* T160c4(T6 a1, T0* a2, T0* a3);
/* LX_TEMPLATE_LIST.last */
extern T0* T146f9(T0* C);
/* LX_TEMPLATE_LIST.put */
extern void T146f12(T0* C, T0* a1, T0* a2);
/* LX_EQUIVALENCE_CLASSES.add */
extern void T94f12(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].forget_right */
extern void T213f7(T0* C);
/* DS_BILINKABLE [INTEGER_32].forget_left */
extern void T213f8(T0* C);
/* DS_BILINKABLE [INTEGER_32].put_right */
extern void T213f6(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].attach_left */
extern void T213f11(T0* C, T0* a1);
/* LX_SYMBOL_CLASS.item */
extern T6 T90f14(T0* C, T6 a1);
/* LX_TEMPLATE_LIST.put_last */
extern void T146f14(T0* C, T0* a1);
/* DS_LINKABLE [LX_TRANSITION_TABLE [LX_DFA_STATE]].put_right */
extern void T230f4(T0* C, T0* a1);
/* DS_LINKABLE [LX_TRANSITION_TABLE [LX_DFA_STATE]].make */
extern T0* T230c3(T0* a1);
/* LX_TEMPLATE_LIST.is_empty */
extern T1 T146f8(T0* C);
/* LX_SYMBOL_CLASS.put */
extern void T90f20(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.force_last */
extern void T90f21(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.resize */
extern void T90f22(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].resize */
extern T0* T84f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [INTEGER_32].resized_area */
extern T0* T83f4(T0* C, T6 a1);
/* SPECIAL [INTEGER_32].copy_data */
extern void T83f10(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* LX_SYMBOL_CLASS.new_capacity */
extern T6 T90f13(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.extendible */
extern T1 T90f11(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.last */
extern T6 T90f9(T0* C);
/* LX_SYMBOL_CLASS.is_empty */
extern T1 T90f16(T0* C);
/* LX_SYMBOL_CLASS.has */
extern T1 T90f12(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.arrayed_has */
extern T1 T90f15(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.make */
extern T0* T90c18(T6 a1);
/* LX_SYMBOL_CLASS.new_cursor */
extern T0* T90f10(T0* C);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].go_after */
extern void T161f13(T0* C);
/* LX_PROTO_QUEUE.cursor_go_after */
extern void T144f23(T0* C, T0* a1);
/* LX_PROTO_QUEUE.remove_traversing_cursor */
extern void T144f27(T0* C, T0* a1);
/* LX_PROTO_QUEUE.cursor_off */
extern T1 T144f9(T0* C, T0* a1);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].difference */
extern T0* T156f11(T0* C, T0* a1, T0* a2);
/* LX_COMPRESSED_DFA.null_state */
extern unsigned char ge156os4328;
extern T0* ge156ov4328;
extern T0* T47f63(T0* C);
/* LX_DFA_STATE.set_id */
extern void T132f19(T0* C, T6 a1);
/* LX_DFA_STATE.make */
extern T0* T132c18(T0* a1, T6 a2, T6 a3);
/* LX_RULE.set_useful */
extern void T49f24(T0* C, T1 a1);
/* LX_DFA_STATE.rule_sorter */
extern unsigned char ge114os1712;
extern T0* ge114ov1712;
extern T0* T132f7(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].sort */
extern void T134f29(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].sort */
extern void T217f3(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].sort_with_comparator */
extern void T217f4(T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].subsort_with_comparator */
extern void T217f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* DS_ARRAYED_LIST [LX_NFA_STATE].replace */
extern void T134f26(T0* C, T0* a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE].less_than */
extern T1 T250f1(T0* C, T0* a1, T0* a2);
/* LX_NFA_STATE.infix "<" */
extern T1 T133f9(T0* C, T0* a1);
/* LX_DFA_STATE.bubble_sorter */
extern unsigned char ge114os1711;
extern T0* ge114ov1711;
extern T0* T132f8(T0* C);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].make */
extern T0* T217c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE].make */
extern T0* T250c2(void);
/* DS_ARRAYED_LIST [LX_NFA_STATE].last */
extern T0* T134f9(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].is_empty */
extern T1 T134f8(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].force_last */
extern void T48f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].resize */
extern void T48f20(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].resize */
extern T0* T168f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_RULE].resized_area */
extern T0* T135f3(T0* C, T6 a1);
/* SPECIAL [LX_RULE].copy_data */
extern void T135f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [LX_RULE].move_data */
extern void T135f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_RULE].overlapping_move */
extern void T135f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_RULE].non_overlapping_move */
extern void T135f8(T0* C, T6 a1, T6 a2, T6 a3);
/* DS_ARRAYED_LIST [LX_RULE].new_capacity */
extern T6 T48f11(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].extendible */
extern T1 T48f10(T0* C, T6 a1);
/* LX_NFA_STATE.is_accepting_head */
extern T1 T133f6(T0* C);
/* LX_NFA_STATE.has_transition */
extern T1 T133f10(T0* C);
/* LX_NFA_STATE.is_accepting */
extern T1 T133f7(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].force_last */
extern void T134f27(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].resize */
extern void T134f31(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].resize */
extern T0* T220f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_NFA_STATE].resized_area */
extern T0* T219f3(T0* C, T6 a1);
/* SPECIAL [LX_NFA_STATE].copy_data */
extern void T219f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [LX_NFA_STATE].move_data */
extern void T219f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_NFA_STATE].overlapping_move */
extern void T219f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_NFA_STATE].non_overlapping_move */
extern void T219f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_NFA_STATE].make */
extern T0* T219c4(T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].new_capacity */
extern T6 T134f13(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].extendible */
extern T1 T134f12(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].make */
extern T0* T134c23(T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].new_cursor */
extern T0* T134f11(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].make */
extern T0* T221c7(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].make */
extern T0* T220f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_NFA_STATE].make_area */
extern T0* T269c2(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].default_create */
extern T0* T220c3(void);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].go_to */
extern void T161f12(T0* C, T0* a1);
/* LX_PROTO_QUEUE.cursor_go_to */
extern void T144f22(T0* C, T0* a1, T0* a2);
/* LX_PROTO_QUEUE.add_traversing_cursor */
extern void T144f26(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].off */
extern T1 T161f7(T0* C);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].set */
extern void T161f18(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].forth */
extern void T161f14(T0* C);
/* LX_PROTO_QUEUE.cursor_forth */
extern void T144f24(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].item */
extern T0* T161f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].start */
extern void T161f11(T0* C);
/* LX_PROTO_QUEUE.cursor_start */
extern void T144f21(T0* C, T0* a1);
/* LX_PROTO_QUEUE.first */
extern T0* T144f6(T0* C);
/* LX_PROTO_QUEUE.is_empty */
extern T1 T144f5(T0* C);
/* LX_PROTO_QUEUE.new_cursor */
extern T0* T144f8(T0* C);
/* DS_BILINKED_LIST_CURSOR [LX_PROTO].make */
extern T0* T161c10(T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].go_after */
extern void T159f10(T0* C);
/* DS_ARRAYED_LIST [LX_DFA_STATE].cursor_go_after */
extern void T137f20(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].remove_traversing_cursor */
extern void T137f22(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].set_next_cursor */
extern void T159f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].set_position */
extern void T159f11(T0* C, T6 a1);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].off */
extern T1 T159f5(T0* C);
/* DS_ARRAYED_LIST [LX_DFA_STATE].cursor_off */
extern T1 T137f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].cursor_before */
extern T1 T137f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].cursor_after */
extern T1 T137f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].put_last */
extern void T137f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].index */
extern T6 T159f4(T0* C);
/* DS_ARRAYED_LIST [LX_DFA_STATE].cursor_index */
extern T6 T137f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].after */
extern T1 T159f6(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].search_forth */
extern void T159f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].cursor_search_forth */
extern void T137f19(T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_LIST [LX_DFA_STATE].add_traversing_cursor */
extern void T137f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].start */
extern void T159f8(T0* C);
/* DS_ARRAYED_LIST [LX_DFA_STATE].cursor_start */
extern void T137f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].is_empty */
extern T1 T137f11(T0* C);
/* DS_ARRAYED_LIST [LX_DFA_STATE].new_cursor */
extern T0* T137f12(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].make */
extern T0* T159c7(T0* a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].make */
extern T0* T137c15(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].make */
extern T0* T224f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_DFA_STATE].make_area */
extern T0* T270c2(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].default_create */
extern T0* T224c3(void);
/* LX_COMPRESSED_DFA.build_transitions */
extern void T47f99(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.previous_symbol */
extern T6 T147f4(T0* C, T6 a1);
/* LX_COMPRESSED_DFA.new_state */
extern T0* T47f60(T0* C, T0* a1);
/* LX_DFA_STATE.is_equal */
extern T1 T132f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].is_equal */
extern T1 T134f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].any_ */
extern T0* T134f21(T0* C);
/* LX_DFA_STATE.any_ */
extern T0* T132f16(T0* C);
/* LX_DFA_STATE.new_state */
extern T0* T132f12(T0* C, T6 a1);
/* LX_DFA_STATE.maximum_symbol */
extern T6 T132f15(T0* C);
/* LX_DFA_STATE.minimum_symbol */
extern T6 T132f14(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put_last */
extern void T134f24(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.is_representative */
extern T1 T147f8(T0* C, T6 a1);
/* LX_DFA_STATE.partition */
extern void T132f20(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.initialize */
extern void T147f10(T0* C);
/* ARRAY [BOOLEAN].clear_all */
extern void T158f7(T0* C);
/* SPECIAL [BOOLEAN].clear_all */
extern void T157f5(T0* C);
/* LX_SYMBOL_PARTITIONS.initialize */
extern void T147f10p1(T0* C);
/* DS_BILINKABLE [INTEGER_32].put_left */
extern void T213f9(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].attach_right */
extern void T213f10(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.lower */
extern T6 T147f7(T0* C);
/* LX_SYMBOL_PARTITIONS.upper */
extern T6 T147f6(T0* C);
/* LX_COMPRESSED_DFA.resize */
extern void T47f114(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].resize */
extern void T137f17(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].resize */
extern T0* T224f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_DFA_STATE].resized_area */
extern T0* T223f3(T0* C, T6 a1);
/* SPECIAL [LX_DFA_STATE].copy_data */
extern void T223f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [LX_DFA_STATE].move_data */
extern void T223f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_DFA_STATE].overlapping_move */
extern void T223f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_DFA_STATE].non_overlapping_move */
extern void T223f9(T0* C, T6 a1, T6 a2, T6 a3);
/* LX_SYMBOL_PARTITIONS.capacity */
extern T6 T147f5(T0* C);
/* ARRAY [INTEGER_32].make */
extern T0* T142c10(T6 a1, T6 a2);
/* LX_SYMBOL_PARTITIONS.make */
extern T0* T147c9(T6 a1, T6 a2);
/* LX_SYMBOL_PARTITIONS.make */
extern void T147f9p1(T0* C, T6 a1, T6 a2);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].put */
extern void T215f7(T0* C, T0* a1, T6 a2);
/* DS_BILINKABLE [INTEGER_32].make */
extern T0* T213c4(T6 a1);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].make */
extern T0* T215c6(T6 a1, T6 a2);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].make_area */
extern void T215f8(T0* C, T6 a1);
/* SPECIAL [DS_BILINKABLE [INTEGER_32]].make */
extern T0* T214c2(T6 a1);
/* LX_TEMPLATE_LIST.make */
extern T0* T146c11(T0* a1);
/* LX_TEMPLATE_LIST.make_list */
extern void T146f13(T0* C);
/* LX_EQUIVALENCE_CLASSES.make */
extern T0* T94c10(T6 a1, T6 a2);
/* LX_EQUIVALENCE_CLASSES.initialize */
extern void T94f13(T0* C);
/* DS_ARRAYED_LIST [LX_SINGLETON].make */
extern T0* T145c9(T6 a1);
/* DS_ARRAYED_LIST [LX_SINGLETON].new_cursor */
extern T0* T145f8(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_SINGLETON].make */
extern T0* T229c2(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_SINGLETON].make */
extern T0* T228f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_SINGLETON].make_area */
extern T0* T271c2(T6 a1);
/* SPECIAL [LX_SINGLETON].make */
extern T0* T227c2(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_SINGLETON].default_create */
extern T0* T228c2(void);
/* LX_PROTO_QUEUE.make */
extern T0* T144c12(void);
/* LX_COMPRESSED_DFA.put_eob_state */
extern void T47f84(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].force_first */
extern void T48f23(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].put */
extern void T48f25(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [LX_RULE].move_cursors_right */
extern void T48f27(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_RULE].set_position */
extern void T169f5(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].move_right */
extern void T48f26(T0* C, T6 a1, T6 a2);
/* LX_RULE.make_default */
extern T0* T49c15(T6 a1);
/* LX_RULE.dummy_action */
extern unsigned char ge201os1769;
extern T0* ge201ov1769;
extern T0* T49f11(T0* C);
/* LX_ACTION.make */
extern T0* T100c3(T0* a1);
/* LX_RULE.dummy_pattern */
extern unsigned char ge201os1768;
extern T0* ge201ov1768;
extern T0* T49f12(T0* C);
/* LX_NFA.make_epsilon */
extern T0* T93c9(T1 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put_first */
extern void T134f25(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put */
extern void T134f30(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [LX_NFA_STATE].move_cursors_right */
extern void T134f34(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_position */
extern void T221f8(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].move_right */
extern void T134f33(T0* C, T6 a1, T6 a2);
/* LX_NFA_STATE.set_transition */
extern void T133f13(T0* C, T0* a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].make */
extern T0* T208c5(T0* a1);
/* LX_NFA_STATE.make */
extern T0* T133c12(T1 a1);
/* LX_COMPRESSED_DFA.initialize */
extern void T47f83(T0* C, T0* a1);
/* LX_COMPRESSED_DFA.initialize_dfa */
extern void T47f98(T0* C, T0* a1, T6 a2, T6 a3);
/* LX_COMPRESSED_DFA.put_start_condition */
extern void T47f113(T0* C, T0* a1);
/* LX_NFA.start_state */
extern T0* T93f4(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].first */
extern T0* T134f14(T0* C);
/* DS_ARRAYED_LIST [LX_NFA].item */
extern T0* T166f7(T0* C, T6 a1);
/* LX_START_CONDITIONS.item */
extern T0* T75f10(T0* C, T6 a1);
/* LX_COMPRESSED_DFA.set_nfa_state_ids */
extern void T47f112(T0* C, T0* a1);
/* LX_NFA_STATE.set_id */
extern void T133f15(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].force */
extern void T167f36(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].key_storage_put */
extern void T167f44(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].slots_put */
extern void T167f43(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].clashes_put */
extern void T167f42(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].slots_item */
extern T6 T167f29(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].clashes_item */
extern T6 T167f28(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].hash_position */
extern T6 T167f21(T0* C, T6 a1);
/* INTEGER_32.hash_code */
extern T6 T6f17(T6* C);
/* INTEGER_32.infix "&" */
extern T6 T6f20(T6* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].resize */
extern void T167f41(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].clashes_resize */
extern void T167f49(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].special_integer_ */
extern unsigned char ge323os2660;
extern T0* ge323ov2660;
extern T0* T167f31(T0* C);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].key_storage_resize */
extern void T167f48(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item_storage_resize */
extern void T167f47(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].resize */
extern T0* T96f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_NFA].resized_area */
extern T0* T95f3(T0* C, T6 a1);
/* SPECIAL [LX_NFA].copy_data */
extern void T95f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [LX_NFA].move_data */
extern void T95f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_NFA].overlapping_move */
extern void T95f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_NFA].non_overlapping_move */
extern void T95f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_NFA].make */
extern T0* T95c4(T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].key_storage_item */
extern T6 T167f20(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].slots_resize */
extern void T167f46(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].new_modulus */
extern T6 T167f24(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].new_capacity */
extern T6 T167f33(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item_storage_put */
extern void T167f40(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].search_position */
extern void T167f37(T0* C, T6 a1);
/* KL_EQUALITY_TESTER [INTEGER_32].test */
extern T1 T30f1(T0* C, T6 a1, T6 a2);
/* KL_ANY_ROUTINES.equal_objects */
extern T1 T188f2(T0* C, T0* a1, T0* a2);
/* INTEGER_32.is_equal */
extern T1 T6f19(T6* C, T6 a1);
/* KL_EQUALITY_TESTER [INTEGER_32].any_ */
extern T0* T30f2(T0* C);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].unset_found_item */
extern void T167f39(T0* C);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item */
extern T0* T167f22(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item_storage_item */
extern T0* T167f32(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].has */
extern T1 T167f23(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make */
extern T0* T167c35(T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_with_equality_testers */
extern void T167f38(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [LX_NFA, INTEGER_32].make */
extern T0* T240c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [LX_NFA, INTEGER_32].new_cursor */
extern T0* T240f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [LX_NFA, INTEGER_32].make */
extern T0* T273c3(T0* a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].new_cursor */
extern T0* T167f30(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32].make */
extern T0* T242c3(T0* a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_sparse_container */
extern void T167f45(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_slots */
extern void T167f53(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_clashes */
extern void T167f52(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_key_storage */
extern void T167f51(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_item_storage */
extern void T167f50(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].make */
extern T0* T96f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_NFA].make_area */
extern T0* T216c2(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].default_create */
extern T0* T96c3(void);
/* KL_EQUALITY_TESTER [INTEGER_32].default_create */
extern T0* T30c3(void);
/* LX_EQUIVALENCE_CLASSES.built */
extern T1 T94f6(T0* C);
/* LX_COMPRESSED_DFA.build_eof_rules */
extern void T47f97(T0* C, T0* a1, T6 a2, T6 a3);
/* ARRAY [LX_RULE].put */
extern void T136f7(T0* C, T0* a1, T6 a2);
/* ARRAY [LX_RULE].make */
extern T0* T136c6(T6 a1, T6 a2);
/* ARRAY [LX_RULE].make_area */
extern void T136f8(T0* C, T6 a1);
/* LX_COMPRESSED_DFA.build_rules */
extern void T47f96(T0* C, T0* a1);
/* LX_START_CONDITIONS.names */
extern T0* T75f16(T0* C);
/* LX_FULL_DFA.make */
extern T0* T54c49(T0* a1);
/* LX_FULL_DFA.build */
extern void T54f54(T0* C);
/* LX_FULL_DFA.build_accept_table */
extern void T54f70(T0* C);
/* LX_FULL_DFA.build_nxt_table */
extern void T54f69(T0* C);
/* LX_FULL_DFA.build_transitions */
extern void T54f68(T0* C, T0* a1);
/* LX_FULL_DFA.new_state */
extern T0* T54f39(T0* C, T0* a1);
/* LX_FULL_DFA.resize */
extern void T54f78(T0* C, T6 a1);
/* LX_FULL_DFA.put_eob_state */
extern void T54f53(T0* C);
/* LX_FULL_DFA.initialize */
extern void T54f52(T0* C, T0* a1);
/* LX_FULL_DFA.initialize_dfa */
extern void T54f67(T0* C, T0* a1, T6 a2, T6 a3);
/* LX_FULL_DFA.put_start_condition */
extern void T54f77(T0* C, T0* a1);
/* LX_FULL_DFA.set_nfa_state_ids */
extern void T54f76(T0* C, T0* a1);
/* LX_FULL_DFA.build_eof_rules */
extern void T54f66(T0* C, T0* a1, T6 a2, T6 a3);
/* LX_FULL_DFA.build_rules */
extern void T54f65(T0* C, T0* a1);
/* GELEX.parse_input_file */
extern void T21f9(T0* C);
/* KL_STANDARD_FILES.input */
extern unsigned char ge357os4001;
extern T0* ge357ov4001;
extern T0* T45f1(T0* C);
/* KL_STDIN_FILE.make */
extern T0* T46c18(void);
/* KL_STDIN_FILE.make_open_stdin */
extern void T46f19(T0* C, T0* a1);
/* KL_STDIN_FILE.set_read_mode */
extern void T46f21(T0* C);
/* KL_STDIN_FILE.console_def */
extern T14 T46f8(T0* C, T6 a1);
/* KL_STDIN_FILE.old_make */
extern void T46f20(T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.make */
extern T0* T40c7(T0* a1);
/* KL_TEXT_INPUT_FILE.close */
extern void T39f37(T0* C);
/* KL_TEXT_INPUT_FILE.old_close */
extern void T39f40(T0* C);
/* KL_TEXT_INPUT_FILE.file_close */
extern void T39f41(T0* C, T14 a1);
/* LX_LEX_PARSER.parse_file */
extern void T38f266(T0* C, T0* a1);
/* LX_LEX_PARSER.parse */
extern void T38f270(T0* C);
/* LX_LEX_PARSER.yy_pop_last_value */
extern void T38f283(T0* C, T6 a1);
/* LX_LEX_PARSER.yy_push_error_value */
extern void T38f282(T0* C);
/* KL_SPECIAL_ROUTINES [ANY].resize */
extern T0* T87f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ANY].resized_area */
extern T0* T86f2(T0* C, T6 a1);
/* SPECIAL [ANY].copy_data */
extern void T86f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [ANY].move_data */
extern void T86f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ANY].overlapping_move */
extern void T86f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ANY].non_overlapping_move */
extern void T86f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ANY].make */
extern T0* T86c4(T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].make */
extern T0* T87f1(T0* C, T6 a1);
/* TO_SPECIAL [ANY].make_area */
extern T0* T204c2(T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].default_create */
extern T0* T87c3(void);
/* LX_LEX_PARSER.yy_do_action */
extern void T38f281(T0* C, T6 a1);
/* LX_DESCRIPTION.set_eiffel_code */
extern void T25f50(T0* C, T0* a1);
/* LX_LEX_PARSER.process_singleton_string */
extern void T38f317(T0* C, T6 a1);
/* LX_LEX_PARSER.append_character_to_string */
extern T0* T38f183(T0* C, T6 a1, T0* a2);
/* LX_LEX_PARSER.new_symbol_nfa */
extern T0* T38f257(T0* C, T6 a1);
/* LX_NFA.make_symbol */
extern T0* T93c20(T6 a1, T1 a2);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].make */
extern T0* T212c6(T6 a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item */
extern T0* T82f27(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item_storage_item */
extern T0* T82f21(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].search_position */
extern void T82f43(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].clashes_item */
extern T6 T82f32(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].hash_position */
extern T6 T82f24(T0* C, T0* a1);
/* STRING_8.hash_code */
extern T6 T17f25(T0* C);
/* INTEGER_32.infix "|<<" */
extern T6 T6f22(T6* C, T6 a1);
/* KL_STRING_EQUALITY_TESTER.test */
extern T1 T81f1(T0* C, T0* a1, T0* a2);
/* STRING_8.item_code */
extern T6 T17f13(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].key_storage_item */
extern T0* T82f22(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].slots_item */
extern T6 T82f33(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].has */
extern T1 T82f29(T0* C, T0* a1);
/* LX_LEX_PARSER.process_singleton_empty_string */
extern void T38f316(T0* C);
/* LX_LEX_PARSER.append_character_set_to_character_class */
extern T0* T38f182(T0* C, T6 a1, T6 a2, T0* a3);
/* LX_LEX_PARSER.report_negative_range_in_character_class_error */
extern void T38f360(T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.make */
extern T0* T173c7(T0* a1, T6 a2);
/* LX_LEX_PARSER.filename */
extern T0* T38f232(T0* C);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].resize */
extern T0* T92f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_SYMBOL_CLASS].resized_area */
extern T0* T91f2(T0* C, T6 a1);
/* SPECIAL [LX_SYMBOL_CLASS].copy_data */
extern void T91f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [LX_SYMBOL_CLASS].move_data */
extern void T91f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_SYMBOL_CLASS].overlapping_move */
extern void T91f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_SYMBOL_CLASS].non_overlapping_move */
extern void T91f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_SYMBOL_CLASS].make */
extern T0* T91c4(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].make */
extern T0* T92f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_SYMBOL_CLASS].make_area */
extern T0* T207c2(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].default_create */
extern T0* T92c3(void);
/* LX_LEX_PARSER.append_character_to_character_class */
extern T0* T38f181(T0* C, T6 a1, T0* a2);
/* LX_LEX_PARSER.new_character_class */
extern T0* T38f180(T0* C);
/* LX_SYMBOL_CLASS.set_negated */
extern void T90f19(T0* C, T1 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].force */
extern void T82f42(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].key_storage_put */
extern void T82f50(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].slots_put */
extern void T82f49(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].clashes_put */
extern void T82f48(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].resize */
extern void T82f47(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].clashes_resize */
extern void T82f55(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].special_integer_ */
extern T0* T82f31(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].key_storage_resize */
extern void T82f54(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].resize */
extern T0* T89f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].resized_area */
extern T0* T88f3(T0* C, T6 a1);
/* SPECIAL [STRING_8].copy_data */
extern void T88f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [STRING_8].move_data */
extern void T88f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].overlapping_move */
extern void T88f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].non_overlapping_move */
extern void T88f9(T0* C, T6 a1, T6 a2, T6 a3);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item_storage_resize */
extern void T82f53(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].slots_resize */
extern void T82f52(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].new_modulus */
extern T6 T82f25(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].new_capacity */
extern T6 T82f23(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item_storage_put */
extern void T82f46(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].unset_found_item */
extern void T82f45(T0* C);
/* LX_LEX_PARSER.new_nfa_from_character_class */
extern T0* T38f179(T0* C, T0* a1);
/* LX_SYMBOL_CLASS.sort */
extern void T90f24(T0* C);
/* LX_SYMBOL_CLASS.arrayed_sort */
extern void T90f26(T0* C, T0* a1);
/* DS_SHELL_SORTER [INTEGER_32].sort */
extern void T275f3(T0* C, T0* a1);
/* DS_SHELL_SORTER [INTEGER_32].sort_with_comparator */
extern void T275f4(T0* C, T0* a1, T0* a2);
/* DS_SHELL_SORTER [INTEGER_32].subsort_with_comparator */
extern void T275f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* LX_SYMBOL_CLASS.replace */
extern void T90f25(T0* C, T6 a1, T6 a2);
/* LX_SYMBOL_CLASS.sorter */
extern unsigned char ge119os2158;
extern T0* ge119ov2158;
extern T0* T90f17(T0* C);
/* DS_SHELL_SORTER [INTEGER_32].make */
extern T0* T275c2(T0* a1);
/* LX_LEX_PARSER.process_singleton_symbol_class */
extern void T38f315(T0* C, T0* a1);
/* LX_LEX_PARSER.process_singleton_dot */
extern void T38f314(T0* C);
/* LX_LEX_PARSER.new_symbol_class_nfa */
extern T0* T38f178(T0* C, T0* a1);
/* LX_NFA.make_symbol_class */
extern T0* T93c18(T0* a1, T1 a2);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].make */
extern T0* T211c6(T0* a1, T0* a2);
/* LX_LEX_PARSER.dot_character_class */
extern T0* T38f177(T0* C);
/* LX_LEX_PARSER.process_singleton_fixed_iteration */
extern void T38f313(T0* C, T6 a1);
/* LX_LEX_PARSER.new_iteration_nfa */
extern T0* T38f176(T0* C, T0* a1, T6 a2);
/* LX_NFA.build_iteration */
extern void T93f17(T0* C, T6 a1);
/* LX_NFA.cloned_object */
extern T0* T93f6(T0* C);
/* LX_NFA.twin */
extern T0* T93f7(T0* C);
/* LX_NFA.copy */
extern void T93f21(T0* C, T0* a1);
/* LX_NFA_STATE.set_epsilon_transition */
extern void T133f14(T0* C, T0* a1);
/* LX_NFA_STATE.cloned_object */
extern T0* T133f8(T0* C);
/* LX_NFA_STATE.twin */
extern T0* T133f11(T0* C);
/* LX_NFA_STATE.copy */
extern void T133f18(T0* C, T0* a1);
/* LX_LEX_PARSER.report_iteration_not_positive_error */
extern void T38f359(T0* C);
/* LX_ITERATION_NOT_POSITIVE_ERROR.make */
extern T0* T172c7(T0* a1, T6 a2);
/* LX_LEX_PARSER.process_singleton_unbounded_iteration */
extern void T38f312(T0* C, T6 a1);
/* LX_LEX_PARSER.new_unbounded_iteration_nfa */
extern T0* T38f175(T0* C, T0* a1, T6 a2);
/* LX_NFA.build_unbounded_iteration */
extern void T93f16(T0* C, T6 a1);
/* LX_LEX_PARSER.process_singleton_bounded_iteration */
extern void T38f311(T0* C, T6 a1, T6 a2);
/* LX_LEX_PARSER.new_bounded_iteration_nfa */
extern T0* T38f174(T0* C, T0* a1, T6 a2, T6 a3);
/* LX_NFA.build_bounded_iteration */
extern void T93f15(T0* C, T6 a1, T6 a2);
/* LX_LEX_PARSER.report_bad_iteration_values_error */
extern void T38f358(T0* C);
/* LX_BAD_ITERATION_VALUES_ERROR.make */
extern T0* T171c7(T0* a1, T6 a2);
/* LX_LEX_PARSER.process_singleton_optional */
extern void T38f310(T0* C);
/* LX_NFA.build_optional */
extern void T93f14(T0* C);
/* LX_NFA.final_state */
extern T0* T93f5(T0* C);
/* LX_LEX_PARSER.process_singleton_plus */
extern void T38f309(T0* C);
/* LX_NFA.build_positive_closure */
extern void T93f13(T0* C);
/* LX_LEX_PARSER.process_singleton_star */
extern void T38f308(T0* C);
/* LX_NFA.build_closure */
extern void T93f12(T0* C);
/* LX_LEX_PARSER.process_singleton_char */
extern void T38f307(T0* C, T6 a1);
/* LX_LEX_PARSER.new_nfa_from_character */
extern T0* T38f173(T0* C, T6 a1);
/* LX_LEX_PARSER.process_singleton_series */
extern void T38f306(T0* C);
/* LX_NFA.build_concatenation */
extern void T93f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].append_last */
extern void T134f28(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].extend_last */
extern void T134f32(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].forth */
extern void T221f10(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_forth */
extern void T134f36(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].add_traversing_cursor */
extern void T134f37(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_next_cursor */
extern void T221f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].remove_traversing_cursor */
extern void T134f38(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].item */
extern T0* T221f4(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_item */
extern T0* T134f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].after */
extern T1 T221f5(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_after */
extern T1 T134f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].start */
extern void T221f9(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_start */
extern void T134f35(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].off */
extern T1 T221f6(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_off */
extern T1 T134f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_before */
extern T1 T134f20(T0* C, T0* a1);
/* DS_ARRAYED_STACK [INTEGER_32].force */
extern void T77f10(T0* C, T6 a1);
/* DS_ARRAYED_STACK [INTEGER_32].resize */
extern void T77f11(T0* C, T6 a1);
/* DS_ARRAYED_STACK [INTEGER_32].new_capacity */
extern T6 T77f7(T0* C, T6 a1);
/* DS_ARRAYED_STACK [INTEGER_32].extendible */
extern T1 T77f6(T0* C, T6 a1);
/* LX_LEX_PARSER.process_regexp_or_series */
extern void T38f305(T0* C);
/* LX_NFA.build_union */
extern void T93f10(T0* C, T0* a1);
/* DS_ARRAYED_STACK [INTEGER_32].remove */
extern void T77f9(T0* C);
/* DS_ARRAYED_STACK [INTEGER_32].item */
extern T6 T77f5(T0* C);
/* LX_LEX_PARSER.new_epsilon_nfa */
extern T0* T38f164(T0* C);
/* LX_LEX_PARSER.report_trailing_context_used_twice_error */
extern void T38f304(T0* C);
/* LX_TRAILING_CONTEXT_USED_TWICE_ERROR.make */
extern T0* T104c7(T0* a1, T6 a2);
/* LX_LEX_PARSER.append_eol_to_regexp */
extern T0* T38f163(T0* C, T0* a1);
/* LX_LEX_PARSER.append_trail_context_to_regexp */
extern T0* T38f157(T0* C, T0* a1, T0* a2);
/* LX_NFA.set_accepted_rule */
extern void T93f19(T0* C, T0* a1);
/* LX_NFA_STATE.set_accepted_rule */
extern void T133f16(T0* C, T0* a1);
/* LX_NFA.set_beginning_as_normal */
extern void T93f23(T0* C);
/* LX_NFA_STATE.set_beginning_as_normal */
extern void T133f17(T0* C);
/* LX_LEX_PARSER.report_unrecognized_rule_error */
extern void T38f303(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.make */
extern T0* T103c7(T0* a1, T6 a2);
/* LX_LEX_PARSER.process_eof_rule */
extern void T38f302(T0* C);
/* LX_LEX_PARSER.build_eof_action */
extern void T38f349(T0* C, T0* a1);
/* LX_RULE.set_line_nb */
extern void T49f17(T0* C, T6 a1);
/* LX_RULE.set_pattern */
extern void T49f16(T0* C, T0* a1);
/* LX_LEX_PARSER.eof_nfa */
extern unsigned char ge166os2562;
extern T0* ge166ov2562;
extern T0* T38f253(T0* C);
/* LX_START_CONDITION.set_has_eof */
extern void T101f8(T0* C, T1 a1);
/* LX_LEX_PARSER.report_multiple_eof_rules_error */
extern void T38f356(T0* C, T0* a1);
/* LX_MULTIPLE_EOF_RULES_ERROR.make */
extern T0* T127c7(T0* a1, T6 a2, T0* a3);
/* LX_LEX_PARSER.report_all_start_conditions_eof_warning */
extern void T38f348(T0* C);
/* LX_ALL_START_CONDITIONS_EOF_ERROR.make */
extern T0* T123c7(T0* a1, T6 a2);
/* LX_START_CONDITIONS.append_non_eof_start_conditions */
extern void T75f26(T0* C, T0* a1);
/* LX_START_CONDITIONS.force_last */
extern void T75f31(T0* C, T0* a1);
/* LX_START_CONDITIONS.resize */
extern void T75f33(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].resize */
extern T0* T196f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_START_CONDITION].resized_area */
extern T0* T195f3(T0* C, T6 a1);
/* SPECIAL [LX_START_CONDITION].copy_data */
extern void T195f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [LX_START_CONDITION].move_data */
extern void T195f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_START_CONDITION].overlapping_move */
extern void T195f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_START_CONDITION].non_overlapping_move */
extern void T195f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [LX_START_CONDITION].make */
extern T0* T195c4(T6 a1);
/* LX_START_CONDITIONS.new_capacity */
extern T6 T75f15(T0* C, T6 a1);
/* LX_START_CONDITIONS.extendible */
extern T1 T75f14(T0* C, T6 a1);
/* LX_START_CONDITIONS.is_empty */
extern T1 T75f9(T0* C);
/* LX_LEX_PARSER.process_rule */
extern void T38f301(T0* C, T0* a1);
/* LX_START_CONDITIONS.add_nfa_to_all */
extern void T75f21(T0* C, T0* a1);
/* LX_START_CONDITION.put_nfa */
extern void T101f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA].force_last */
extern void T166f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA].resize */
extern void T166f12(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA].new_capacity */
extern T6 T166f9(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA].extendible */
extern T1 T166f8(T0* C, T6 a1);
/* LX_START_CONDITIONS.add_nfa_to_non_exclusive */
extern void T75f25(T0* C, T0* a1);
/* LX_DESCRIPTION.set_variable_trail_context */
extern void T25f58(T0* C, T1 a1);
/* LX_RULE.set_column_count */
extern void T49f22(T0* C, T6 a1);
/* LX_RULE.set_line_count */
extern void T49f21(T0* C, T6 a1);
/* LX_RULE.set_trail_count */
extern void T49f20(T0* C, T6 a1);
/* LX_RULE.set_head_count */
extern void T49f19(T0* C, T6 a1);
/* LX_RULE.set_trail_context */
extern void T49f18(T0* C, T1 a1);
/* LX_LEX_PARSER.process_bol_rule */
extern void T38f300(T0* C, T0* a1);
/* LX_START_CONDITIONS.add_bol_nfa_to_all */
extern void T75f24(T0* C, T0* a1);
/* LX_START_CONDITION.put_bol_nfa */
extern void T101f10(T0* C, T0* a1);
/* LX_START_CONDITIONS.add_bol_nfa_to_non_exclusive */
extern void T75f23(T0* C, T0* a1);
/* LX_DESCRIPTION.set_bol_needed */
extern void T25f59(T0* C, T1 a1);
/* LX_LEX_PARSER.report_bad_start_condition_list_error */
extern void T38f299(T0* C);
/* LX_BAD_START_CONDITION_LIST_ERROR.make */
extern T0* T102c7(T0* a1, T6 a2);
/* LX_LEX_PARSER.push_start_condition */
extern void T38f298(T0* C, T0* a1, T0* a2);
/* LX_LEX_PARSER.report_undeclared_start_condition_error */
extern void T38f347(T0* C, T0* a1);
/* LX_UNDECLARED_START_CONDITION_ERROR.make */
extern T0* T122c7(T0* a1, T6 a2, T0* a3);
/* LX_START_CONDITIONS.put_last */
extern void T75f22(T0* C, T0* a1);
/* LX_START_CONDITIONS.start_condition */
extern T0* T75f8(T0* C, T0* a1);
/* STRING_8.is_equal */
extern T1 T17f22(T0* C, T0* a1);
/* STRING_8.str_strict_cmp */
extern T6 T17f24(T0* C, T0* a1, T0* a2, T6 a3);
/* STRING_8.as_lower */
extern T0* T17f8(T0* C);
/* STRING_8.to_lower */
extern void T17f41(T0* C);
/* CHARACTER_8.lower */
extern T2 T2f4(T2* C);
/* CHARACTER_8.is_upper */
extern T1 T2f5(T2* C);
/* NATURAL_8.infix ">" */
extern T1 T8f2(T8* C, T8 a1);
/* NATURAL_8.infix "&" */
extern T8 T8f1(T8* C, T8 a1);
/* CHARACTER_8.character_types */
extern T8 T2f6(T2* C, T6 a1);
/* CHARACTER_8.internal_character_types */
extern unsigned char ge37os93;
extern T0* ge37ov93;
extern T0* T2f8(T2* C);
/* NATURAL_8.infix "|" */
extern T8 T8f3(T8* C, T8 a1);
/* SPECIAL [NATURAL_8].make */
extern T0* T274c2(T6 a1);
/* LX_LEX_PARSER.report_start_condition_specified_twice_warning */
extern void T38f346(T0* C, T0* a1);
/* LX_START_CONDITION_SPECIFIED_TWICE_ERROR.make */
extern T0* T121c7(T0* a1, T6 a2, T0* a3);
/* LX_START_CONDITIONS.has_start_condition */
extern T1 T75f7(T0* C, T0* a1);
/* LX_START_CONDITIONS.append_start_conditions */
extern void T75f20(T0* C, T0* a1);
/* LX_START_CONDITIONS.has */
extern T1 T75f12(T0* C, T0* a1);
/* LX_LEX_PARSER.set_action */
extern void T38f297(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].wipe_out */
extern void T48f17(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].clear_items */
extern void T48f22(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [LX_RULE].move_all_cursors_after */
extern void T48f21(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_RULE].set_next_cursor */
extern void T169f6(T0* C, T0* a1);
/* LX_RULE.set_action */
extern void T49f23(T0* C, T0* a1);
/* LX_ACTION_FACTORY.new_action */
extern T0* T76f1(T0* C, T0* a1);
/* LX_START_CONDITIONS.keep_first */
extern void T75f19(T0* C, T6 a1);
/* LX_START_CONDITIONS.clear_items */
extern void T75f30(T0* C, T6 a1, T6 a2);
/* LX_START_CONDITIONS.move_all_cursors_after */
extern void T75f29(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].set_next_cursor */
extern void T197f6(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].set_position */
extern void T197f5(T0* C, T6 a1);
/* LX_DESCRIPTION.create_equiv_classes */
extern void T25f49(T0* C);
/* LX_LEX_PARSER.override_options */
extern void T38f296(T0* C);
/* GELEX.override_description */
extern void T21f13(T0* C, T0* a1);
/* LX_LEX_PARSER.check_options */
extern void T38f295(T0* C);
/* LX_LEX_PARSER.report_full_and_variable_trailing_context_error */
extern void T38f345(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.make */
extern T0* T120c7(void);
/* LX_LEX_PARSER.report_full_and_reject_error */
extern void T38f344(T0* C);
/* LX_FULL_AND_REJECT_ERROR.make */
extern T0* T119c7(void);
/* LX_LEX_PARSER.report_full_and_meta_equiv_classes_error */
extern void T38f343(T0* C);
/* LX_FULL_AND_META_ERROR.make */
extern T0* T118c7(void);
/* LX_LEX_PARSER.build_equiv_classes */
extern void T38f294(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].forth */
extern void T98f8(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_forth */
extern void T82f61(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].add_traversing_cursor */
extern void T82f63(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].set_next_cursor */
extern void T98f10(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].remove_traversing_cursor */
extern void T82f62(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].set_position */
extern void T98f9(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.convert_to_equivalence */
extern void T90f23(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].item */
extern T0* T98f4(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_item */
extern T0* T82f35(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].after */
extern T1 T98f5(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_after */
extern T1 T82f34(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].start */
extern void T98f7(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_start */
extern void T82f60(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_off */
extern T1 T82f39(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].is_empty */
extern T1 T82f38(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].new_cursor */
extern T0* T82f28(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].make */
extern T0* T98c6(T0* a1);
/* LX_LEX_PARSER.process_default_rule */
extern void T38f293(T0* C);
/* LX_LEX_PARSER.yy_push_last_value */
extern void T38f280(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].make */
extern T0* T89f1(T0* C, T6 a1);
/* TO_SPECIAL [STRING_8].make_area */
extern T0* T205c2(T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].default_create */
extern T0* T89c3(void);
/* LX_LEX_PARSER.accept */
extern void T38f279(T0* C);
/* LX_LEX_PARSER.yy_do_error_action */
extern void T38f277(T0* C, T6 a1);
/* LX_LEX_PARSER.report_error */
extern void T38f292(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.make */
extern T0* T97c7(T0* a1, T6 a2);
/* LX_LEX_PARSER.report_eof_expected_error */
extern void T38f291(T0* C);
/* LX_LEX_PARSER.read_token */
extern void T38f276(T0* C);
/* LX_LEX_PARSER.yy_execute_action */
extern void T38f290(T0* C, T6 a1);
/* LX_LEX_PARSER.yy_set_beginning_of_line */
extern void T38f342(T0* C);
/* YY_BUFFER.set_beginning_of_line */
extern void T79f17(T0* C, T1 a1);
/* YY_FILE_BUFFER.set_beginning_of_line */
extern void T78f20(T0* C, T1 a1);
/* LX_LEX_PARSER.report_bad_character_error */
extern void T38f341(T0* C, T0* a1);
/* LX_BAD_CHARACTER_ERROR.make */
extern T0* T117c7(T0* a1, T6 a2, T0* a3);
/* LX_LEX_PARSER.process_escaped_character */
extern void T38f340(T0* C);
/* LX_LEX_PARSER.report_missing_bracket_error */
extern void T38f339(T0* C);
/* LX_MISSING_BRACKET_ERROR.make */
extern T0* T116c7(T0* a1, T6 a2);
/* LX_LEX_PARSER.report_bad_character_in_brackets_error */
extern void T38f338(T0* C);
/* LX_BAD_CHARACTER_IN_BRACKETS_ERROR.make */
extern T0* T115c7(T0* a1, T6 a2);
/* LX_LEX_PARSER.report_integer_too_large_error */
extern void T38f337(T0* C, T0* a1);
/* LX_INTEGER_TOO_LARGE_ERROR.make */
extern T0* T114c7(T0* a1, T6 a2, T0* a3);
/* STRING_8.to_integer */
extern T6 T17f12(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
extern T6 T245f13(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
extern void T245f17(T0* C, T0* a1, T6 a2);
/* STRING_8.code */
extern T10 T17f27(T0* C, T6 a1);
/* INTEGER_32.to_natural_32 */
extern T10 T6f26(T6* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_character */
extern void T245f23(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflowed */
extern T1 T245f15(T0* C);
/* INTEGER_OVERFLOW_CHECKER.will_overflow */
extern T1 T276f7(T0* C, T11 a1, T11 a2, T6 a3, T6 a4);
/* NATURAL_64.infix ">" */
extern T1 T11f4(T11* C, T11 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
extern unsigned char ge596os7583;
extern T0* ge596ov7583;
extern T0* T245f14(T0* C);
/* INTEGER_OVERFLOW_CHECKER.make */
extern T0* T276c13(void);
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
extern T0* T283c2(T6 a1);
/* STRING_8.has */
extern T1 T17f28(T0* C, T2 a1);
/* INTEGER_32.to_natural_64 */
extern T11 T6f23(T6* C);
/* CHARACTER_8.is_digit */
extern T1 T2f16(T2* C);
/* STRING_TO_INTEGER_CONVERTOR.reset */
extern void T245f18(T0* C, T6 a1);
/* STRING_8.ctoi_convertor */
extern unsigned char ge593os1258;
extern T0* ge593ov1258;
extern T0* T17f21(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
extern void T245f22(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
extern void T245f21(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
extern void T245f20(T0* C, T0* a1);
/* STRING_8.make_from_string */
extern T0* T17c48(T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
extern void T245f19(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.make */
extern T0* T245c16(void);
/* STRING_8.is_integer */
extern T1 T17f11(T0* C);
/* STRING_8.is_valid_integer_or_natural */
extern T1 T17f20(T0* C, T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.is_integral_integer */
extern T1 T245f12(T0* C);
/* LX_LEX_PARSER.report_bad_start_condition_error */
extern void T38f336(T0* C, T0* a1);
/* LX_BAD_START_CONDITION_ERROR.make */
extern T0* T113c7(T0* a1, T6 a2, T0* a3);
/* LX_LEX_PARSER.process_character */
extern void T38f335(T0* C, T6 a1);
/* LX_LEX_PARSER.report_character_out_of_range_error */
extern void T38f355(T0* C, T0* a1);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.make */
extern T0* T126c7(T0* a1, T6 a2, T0* a3);
/* LX_LEX_PARSER.text_item */
extern T2 T38f216(T0* C, T6 a1);
/* LX_LEX_PARSER.report_bad_character_class_error */
extern void T38f334(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.make */
extern T0* T112c7(T0* a1, T6 a2);
/* LX_LEX_PARSER.report_undefined_definition_error */
extern void T38f333(T0* C, T0* a1);
/* LX_UNDEFINED_DEFINITION_ERROR.make */
extern T0* T111c7(T0* a1, T6 a2, T0* a3);
/* LX_LEX_PARSER.put_back_string */
extern void T38f332(T0* C, T0* a1);
/* LX_LEX_PARSER.unread_character */
extern void T38f354(T0* C, T2 a1);
/* KL_CHARACTER_BUFFER.put */
extern void T249f9(T0* C, T2 a1, T6 a2);
/* STRING_8.put */
extern void T17f46(T0* C, T2 a1, T6 a2);
/* LX_LEX_PARSER.yy_set_content */
extern void T38f286(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.count */
extern T6 T249f4(T0* C);
/* YY_BUFFER.compact_right */
extern void T79f18(T0* C);
/* KL_CHARACTER_BUFFER.move_right */
extern void T249f10(T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.subcopy */
extern void T17f49(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* YY_BUFFER.resize */
extern void T79f20(T0* C);
/* KL_CHARACTER_BUFFER.resize */
extern void T249f12(T0* C, T6 a1);
/* STRING_8.set_count */
extern void T17f43(T0* C, T6 a1);
/* YY_BUFFER.default_capacity */
extern unsigned char ge191os5970;
extern T6 ge191ov5970;
extern T6 T79f12(T0* C);
/* YY_FILE_BUFFER.compact_right */
extern void T78f21(T0* C);
/* YY_FILE_BUFFER.resize */
extern void T78f24(T0* C);
/* YY_FILE_BUFFER.default_capacity */
extern T6 T78f13(T0* C);
/* YY_BUFFER.set_index */
extern void T79f14(T0* C, T6 a1);
/* YY_FILE_BUFFER.set_index */
extern void T78f17(T0* C, T6 a1);
/* STRING_8.item */
extern T2 T17f9(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item */
extern T0* T80f33(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_item */
extern T0* T80f27(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].search_position */
extern void T80f38(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_item */
extern T6 T80f29(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].hash_position */
extern T6 T80f22(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_item */
extern T0* T80f21(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_item */
extern T6 T80f32(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].has */
extern T1 T80f23(T0* C, T0* a1);
/* LX_LEX_PARSER.less */
extern void T38f331(T0* C, T6 a1);
/* LX_LEX_PARSER.yy_set_line_column */
extern void T38f353(T0* C);
/* LX_LEX_PARSER.report_incomplete_name_definition_error */
extern void T38f330(T0* C);
/* LX_INCOMPLETE_NAME_DEFINITION_ERROR.make */
extern T0* T110c7(T0* a1, T6 a2);
/* LX_LEX_PARSER.process_name_definition */
extern void T38f329(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force */
extern void T80f37(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_put */
extern void T80f45(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_put */
extern void T80f44(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_put */
extern void T80f43(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].resize */
extern void T80f42(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_resize */
extern void T80f50(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].special_integer_ */
extern T0* T80f31(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_resize */
extern void T80f49(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_resize */
extern void T80f48(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_resize */
extern void T80f47(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_modulus */
extern T6 T80f24(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_capacity */
extern T6 T80f20(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_put */
extern void T80f41(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].unset_found_item */
extern void T80f40(T0* C);
/* STRING_8.substring */
extern T0* T17f10(T0* C, T6 a1, T6 a2);
/* STRING_8.new_string */
extern T0* T17f19(T0* C, T6 a1);
/* LX_LEX_PARSER.report_name_defined_twice_error */
extern void T38f352(T0* C, T0* a1);
/* LX_NAME_DEFINED_TWICE_ERROR.make */
extern T0* T125c7(T0* a1, T6 a2, T0* a3);
/* LX_LEX_PARSER.report_missing_quote_error */
extern void T38f328(T0* C);
/* LX_MISSING_QUOTE_ERROR.make */
extern T0* T109c7(T0* a1, T6 a2);
/* LX_DESCRIPTION.set_output_filename */
extern void T25f36(T0* C, T0* a1);
/* LX_LEX_PARSER.report_unrecognized_option_error */
extern void T38f327(T0* C, T0* a1);
/* LX_UNRECOGNIZED_OPTION_ERROR.make */
extern T0* T108c7(T0* a1, T6 a2, T0* a3);
/* LX_DESCRIPTION.set_no_warning */
extern void T25f45(T0* C, T1 a1);
/* LX_DESCRIPTION.set_post_eof_action_used */
extern void T25f57(T0* C, T1 a1);
/* LX_DESCRIPTION.set_pre_eof_action_used */
extern void T25f56(T0* C, T1 a1);
/* LX_DESCRIPTION.set_post_action_used */
extern void T25f55(T0* C, T1 a1);
/* LX_DESCRIPTION.set_pre_action_used */
extern void T25f54(T0* C, T1 a1);
/* LX_DESCRIPTION.set_position_used */
extern void T25f53(T0* C, T1 a1);
/* LX_DESCRIPTION.set_line_used */
extern void T25f52(T0* C, T1 a1);
/* LX_DESCRIPTION.set_reject_used */
extern void T25f51(T0* C, T1 a1);
/* LX_DESCRIPTION.set_meta_equiv_classes_used */
extern void T25f41(T0* C, T1 a1);
/* LX_DESCRIPTION.set_full_table */
extern void T25f42(T0* C, T1 a1);
/* LX_DESCRIPTION.set_equiv_classes_used */
extern void T25f40(T0* C, T1 a1);
/* LX_DESCRIPTION.set_no_default_rule */
extern void T25f44(T0* C, T1 a1);
/* LX_DESCRIPTION.set_debug_mode */
extern void T25f39(T0* C, T1 a1);
/* LX_DESCRIPTION.set_case_insensitive */
extern void T25f43(T0* C, T1 a1);
/* LX_DESCRIPTION.set_backing_up_report */
extern void T25f38(T0* C, T1 a1);
/* LX_LEX_PARSER.report_start_condition_expected_error */
extern void T38f326(T0* C);
/* LX_START_CONDITION_EXPECTED_ERROR.make */
extern T0* T107c7(T0* a1, T6 a2);
/* LX_LEX_PARSER.add_new_start_condition */
extern void T38f325(T0* C, T0* a1, T1 a2);
/* LX_START_CONDITIONS.force_new_start_condition */
extern void T75f27(T0* C, T0* a1, T1 a2);
/* LX_START_CONDITION.make */
extern T0* T101c7(T0* a1, T6 a2, T1 a3);
/* DS_ARRAYED_LIST [LX_NFA].make */
extern T0* T166c10(T6 a1);
/* DS_ARRAYED_LIST [LX_NFA].new_cursor */
extern T0* T166f6(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA].make */
extern T0* T239c2(T0* a1);
/* LX_LEX_PARSER.report_start_condition_declared_twice_error */
extern void T38f351(T0* C, T0* a1);
/* LX_START_CONDITION_DECLARED_TWICE_ERROR.make */
extern T0* T124c7(T0* a1, T6 a2, T0* a3);
/* LX_LEX_PARSER.start_condition */
extern T6 T38f198(T0* C);
/* DS_ARRAYED_LIST [STRING_8].force_last */
extern void T74f22(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].resize */
extern void T74f26(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].new_capacity */
extern T6 T74f19(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].extendible */
extern T1 T74f18(T0* C, T6 a1);
/* STRING_8.occurrences */
extern T6 T17f7(T0* C, T2 a1);
/* LX_LEX_PARSER.text_substring */
extern T0* T38f196(T0* C, T6 a1, T6 a2);
/* KL_CHARACTER_BUFFER.substring */
extern T0* T249f6(T0* C, T6 a1, T6 a2);
/* LX_LEX_PARSER.text_count */
extern T6 T38f195(T0* C);
/* LX_LEX_PARSER.more */
extern void T38f324(T0* C);
/* LX_LEX_PARSER.report_directive_expected_error */
extern void T38f323(T0* C);
/* LX_DIRECTIVE_EXPECTED_ERROR.make */
extern T0* T106c7(T0* a1, T6 a2);
/* LX_LEX_PARSER.report_unrecognized_directive_error */
extern void T38f322(T0* C);
/* LX_UNRECOGNIZED_DIRECTIVE_ERROR.make */
extern T0* T105c7(T0* a1, T6 a2);
/* LX_LEX_PARSER.text */
extern T0* T38f190(T0* C);
/* LX_LEX_PARSER.set_start_condition */
extern void T38f321(T0* C, T6 a1);
/* LX_LEX_PARSER.yy_execute_eof_action */
extern void T38f289(T0* C, T6 a1);
/* LX_LEX_PARSER.terminate */
extern void T38f320(T0* C);
/* LX_LEX_PARSER.wrap */
extern T1 T38f130(T0* C);
/* LX_LEX_PARSER.yy_refill_input_buffer */
extern void T38f288(T0* C);
/* YY_BUFFER.fill */
extern void T79f16(T0* C);
/* YY_FILE_BUFFER.fill */
extern void T78f19(T0* C);
/* KL_CHARACTER_BUFFER.fill_from_stream */
extern T6 T249f5(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STDIN_FILE.read_to_string */
extern T6 T46f13(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STDIN_FILE.old_read_to_string */
extern T6 T46f16(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STDIN_FILE.file_gss */
extern T6 T46f17(T0* C, T14 a1, T14 a2, T6 a3);
/* SPECIAL [CHARACTER_8].item_address */
extern T14 T15f5(T0* C, T6 a1);
/* KL_STDIN_FILE.any_ */
extern T0* T46f14(T0* C);
/* KL_STDIN_FILE.old_end_of_file */
extern T1 T46f10(T0* C);
/* KL_STDIN_FILE.console_eof */
extern T1 T46f12(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.read_to_string */
extern T6 T39f29(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
extern unsigned char ge443os3216;
extern T0* ge443ov3216;
extern T0* T39f33(T0* C);
/* KL_CHARACTER_BUFFER.make */
extern T0* T249c8(T6 a1);
/* KL_OPERATING_SYSTEM.is_dotnet */
extern unsigned char ge449os4020;
extern T1 ge449ov4020;
extern T1 T191f6(T0* C);
/* PLATFORM.default_create */
extern T0* T285c2(void);
/* KL_CHARACTER_BUFFER.operating_system */
extern unsigned char ge375os3254;
extern T0* ge375ov3254;
extern T0* T249f7(T0* C);
/* KL_OPERATING_SYSTEM.default_create */
extern T0* T191c7(void);
/* KL_TEXT_INPUT_FILE.old_read_to_string */
extern T6 T39f32(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.file_gss */
extern T6 T39f34(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.any_ */
extern T0* T39f30(T0* C);
/* KL_TEXT_INPUT_FILE.old_end_of_file */
extern T1 T39f26(T0* C);
/* KL_TEXT_INPUT_FILE.file_feof */
extern T1 T39f28(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.end_of_input */
extern T1 T39f24(T0* C);
/* KL_STDIN_FILE.read_character */
extern void T46f22(T0* C);
/* KL_STDIN_FILE.old_read_character */
extern void T46f23(T0* C);
/* KL_STDIN_FILE.console_readchar */
extern T2 T46f11(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.read_character */
extern void T39f43(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_character */
extern void T39f44(T0* C);
/* KL_TEXT_INPUT_FILE.file_gc */
extern T2 T39f27(T0* C, T14 a1);
/* YY_FILE_BUFFER.compact_left */
extern void T78f23(T0* C);
/* KL_CHARACTER_BUFFER.move_left */
extern void T249f11(T0* C, T6 a1, T6 a2, T6 a3);
/* LX_LEX_PARSER.yy_null_trans_state */
extern T6 T38f129(T0* C, T6 a1);
/* LX_LEX_PARSER.yy_previous_state */
extern T6 T38f128(T0* C);
/* LX_LEX_PARSER.fatal_error */
extern void T38f287(T0* C, T0* a1);
/* KL_STDERR_FILE.put_character */
extern void T73f12(T0* C, T2 a1);
/* KL_STDERR_FILE.old_put_character */
extern void T73f16(T0* C, T2 a1);
/* KL_STDERR_FILE.console_pc */
extern void T73f20(T0* C, T14 a1, T2 a2);
/* KL_STANDARD_FILES.error */
extern unsigned char ge357os4003;
extern T0* ge357ov4003;
extern T0* T45f3(T0* C);
/* KL_STDERR_FILE.make */
extern T0* T73c9(void);
/* KL_STDERR_FILE.make_open_stderr */
extern void T73f13(T0* C, T0* a1);
/* KL_STDERR_FILE.set_write_mode */
extern void T73f18(T0* C);
/* KL_STDERR_FILE.console_def */
extern T14 T73f6(T0* C, T6 a1);
/* KL_STDERR_FILE.old_make */
extern void T73f17(T0* C, T0* a1);
/* LX_LEX_PARSER.std */
extern T0* T38f184(T0* C);
/* KL_CHARACTER_BUFFER.item */
extern T2 T249f3(T0* C, T6 a1);
/* LX_LEX_PARSER.special_integer_ */
extern T0* T38f160(T0* C);
/* LX_LEX_PARSER.yy_init_value_stacks */
extern void T38f275(T0* C);
/* LX_LEX_PARSER.yy_clear_all */
extern void T38f284(T0* C);
/* LX_LEX_PARSER.clear_all */
extern void T38f318(T0* C);
/* LX_LEX_PARSER.clear_stacks */
extern void T38f350(T0* C);
/* LX_LEX_PARSER.yy_clear_value_stacks */
extern void T38f357(T0* C);
/* SPECIAL [LX_NFA].clear_all */
extern void T95f6(T0* C);
/* SPECIAL [LX_SYMBOL_CLASS].clear_all */
extern void T91f6(T0* C);
/* SPECIAL [INTEGER_32].clear_all */
extern void T83f9(T0* C);
/* SPECIAL [STRING_8].clear_all */
extern void T88f6(T0* C);
/* SPECIAL [ANY].clear_all */
extern void T86f6(T0* C);
/* LX_LEX_PARSER.abort */
extern void T38f278(T0* C);
/* LX_LEX_PARSER.set_input_buffer */
extern void T38f269(T0* C, T0* a1);
/* LX_LEX_PARSER.yy_load_input_buffer */
extern void T38f274(T0* C);
/* YY_BUFFER.set_position */
extern void T79f15(T0* C, T6 a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.set_position */
extern void T78f18(T0* C, T6 a1, T6 a2, T6 a3);
/* LX_LEX_PARSER.new_file_buffer */
extern T0* T38f121(T0* C, T0* a1);
/* YY_FILE_BUFFER.make */
extern T0* T78c16(T0* a1);
/* YY_FILE_BUFFER.make_with_size */
extern void T78f22(T0* C, T0* a1, T6 a2);
/* YY_FILE_BUFFER.set_file */
extern void T78f25(T0* C, T0* a1);
/* YY_FILE_BUFFER.flush */
extern void T78f26(T0* C);
/* YY_FILE_BUFFER.new_default_buffer */
extern T0* T78f15(T0* C, T6 a1);
/* KL_TEXT_INPUT_FILE.is_open_read */
extern T1 T39f10(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_read */
extern T1 T39f19(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T39f36(T0* C);
/* KL_TEXT_INPUT_FILE.is_closed */
extern T1 T39f15(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_closed */
extern T1 T39f23(T0* C);
/* KL_TEXT_INPUT_FILE.old_open_read */
extern void T39f39(T0* C);
/* KL_TEXT_INPUT_FILE.default_pointer */
extern T14 T39f18(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T39f39p1(T0* C);
/* KL_TEXT_INPUT_FILE.file_open */
extern T14 T39f20(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.old_is_readable */
extern T1 T39f14(T0* C);
/* UNIX_FILE_INFO.is_readable */
extern T1 T174f5(T0* C);
/* UNIX_FILE_INFO.file_eaccess */
extern T1 T174f3(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.buffered_file_info */
extern unsigned char ge576os3448;
extern T0* ge576ov3448;
extern T0* T39f22(T0* C);
/* UNIX_FILE_INFO.make */
extern T0* T174c6(void);
/* UNIX_FILE_INFO.make_buffered_file_info */
extern void T174f8(T0* C, T6 a1);
/* UNIX_FILE_INFO.stat_size */
extern T6 T174f4(T0* C);
/* KL_TEXT_INPUT_FILE.set_buffer */
extern void T39f42(T0* C);
/* UNIX_FILE_INFO.update */
extern void T174f7(T0* C, T0* a1);
/* UNIX_FILE_INFO.file_stat */
extern void T174f9(T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.old_exists */
extern T1 T39f13(T0* C);
/* KL_TEXT_INPUT_FILE.file_exists */
extern T1 T39f21(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.make */
extern T0* T39c35(T0* a1);
/* KL_TEXT_INPUT_FILE.old_make */
extern void T39f38(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.string_ */
extern T0* T39f25(T0* C);
/* LX_LEX_PARSER.set_options_overrider */
extern void T38f265(T0* C, T0* a1);
/* LX_LEX_PARSER.make_from_description */
extern T0* T38c264(T0* a1, T0* a2);
/* DS_ARRAYED_STACK [INTEGER_32].make */
extern T0* T77c8(T6 a1);
/* LX_ACTION_FACTORY.make */
extern T0* T76c2(void);
/* LX_START_CONDITIONS.make */
extern void T75f18(T0* C, T6 a1);
/* LX_START_CONDITIONS.make */
extern T0* T75c18(T6 a1);
/* LX_START_CONDITIONS.new_cursor */
extern T0* T75f11(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].make */
extern T0* T197c4(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].make */
extern T0* T196f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_START_CONDITION].make_area */
extern T0* T266c2(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].default_create */
extern T0* T196c3(void);
/* LX_LEX_PARSER.make_parser_skeleton */
extern void T38f268(T0* C);
/* LX_LEX_PARSER.yy_build_parser_tables */
extern void T38f273(T0* C);
/* LX_LEX_PARSER.yycheck_template */
extern unsigned char ge165os2444;
extern T0* ge165ov2444;
extern T0* T38f139(T0* C);
/* LX_LEX_PARSER.yyfixed_array */
extern T0* T38f255(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].to_special */
extern T0* T84f3(T0* C, T0* a1);
/* LX_LEX_PARSER.yytable_template */
extern unsigned char ge165os2443;
extern T0* ge165ov2443;
extern T0* T38f138(T0* C);
/* LX_LEX_PARSER.yypgoto_template */
extern unsigned char ge165os2442;
extern T0* ge165ov2442;
extern T0* T38f136(T0* C);
/* LX_LEX_PARSER.yypact_template */
extern unsigned char ge165os2441;
extern T0* ge165ov2441;
extern T0* T38f135(T0* C);
/* LX_LEX_PARSER.yydefgoto_template */
extern unsigned char ge165os2440;
extern T0* ge165ov2440;
extern T0* T38f134(T0* C);
/* LX_LEX_PARSER.yydefact_template */
extern unsigned char ge165os2439;
extern T0* ge165ov2439;
extern T0* T38f131(T0* C);
/* LX_LEX_PARSER.yytypes2_template */
extern unsigned char ge165os2438;
extern T0* ge165ov2438;
extern T0* T38f125(T0* C);
/* LX_LEX_PARSER.yytypes1_template */
extern unsigned char ge165os2437;
extern T0* ge165ov2437;
extern T0* T38f123(T0* C);
/* LX_LEX_PARSER.yyr1_template */
extern unsigned char ge165os2436;
extern T0* ge165ov2436;
extern T0* T38f118(T0* C);
/* LX_LEX_PARSER.yytranslate_template */
extern unsigned char ge165os2435;
extern T0* ge165ov2435;
extern T0* T38f117(T0* C);
/* LX_LEX_PARSER.yy_create_value_stacks */
extern void T38f272(T0* C);
/* LX_LEX_PARSER.make_lex_scanner_from_description */
extern void T38f267(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].set_key_equality_tester */
extern void T82f41(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING_8].internal_set_equality_tester */
extern void T201f6(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_map */
extern T0* T82c40(T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_with_equality_testers */
extern void T82f44(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING_8].make */
extern T0* T201c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING_8].new_cursor */
extern T0* T201f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [LX_SYMBOL_CLASS, STRING_8].make */
extern T0* T268c3(T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_sparse_container */
extern void T82f51(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_slots */
extern void T82f59(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_clashes */
extern void T82f58(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_key_storage */
extern void T82f57(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_item_storage */
extern void T82f56(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_key_equality_tester */
extern void T80f36(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].internal_set_equality_tester */
extern void T198f6(T0* C, T0* a1);
/* LX_LEX_PARSER.string_equality_tester */
extern unsigned char ge326os2946;
extern T0* ge326ov2946;
extern T0* T38f189(T0* C);
/* KL_STRING_EQUALITY_TESTER.default_create */
extern T0* T81c2(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map */
extern T0* T80c35(T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_with_equality_testers */
extern void T80f39(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].make */
extern T0* T198c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].new_cursor */
extern T0* T198f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8].make */
extern T0* T267c3(T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_cursor */
extern T0* T80f30(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].make */
extern T0* T200c3(T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_sparse_container */
extern void T80f46(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_slots */
extern void T80f54(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_clashes */
extern void T80f53(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_key_storage */
extern void T80f52(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_item_storage */
extern void T80f51(T0* C, T6 a1);
/* LX_LEX_PARSER.make_with_buffer */
extern void T38f271(T0* C, T0* a1);
/* LX_LEX_PARSER.yy_initialize */
extern void T38f285(T0* C);
/* LX_LEX_PARSER.yy_build_tables */
extern void T38f319(T0* C);
/* LX_LEX_PARSER.yy_accept_template */
extern unsigned char ge167os2962;
extern T0* ge167ov2962;
extern T0* T38f242(T0* C);
/* LX_LEX_PARSER.yy_fixed_array */
extern T0* T38f261(T0* C, T0* a1);
/* LX_LEX_PARSER.yy_meta_template */
extern unsigned char ge167os2961;
extern T0* ge167ov2961;
extern T0* T38f241(T0* C);
/* LX_LEX_PARSER.yy_ec_template */
extern unsigned char ge167os2960;
extern T0* ge167ov2960;
extern T0* T38f240(T0* C);
/* LX_LEX_PARSER.yy_def_template */
extern unsigned char ge167os2959;
extern T0* ge167ov2959;
extern T0* T38f239(T0* C);
/* LX_LEX_PARSER.yy_base_template */
extern unsigned char ge167os2958;
extern T0* ge167ov2958;
extern T0* T38f238(T0* C);
/* LX_LEX_PARSER.yy_chk_template */
extern unsigned char ge167os2955;
extern T0* ge167ov2955;
extern T0* T38f237(T0* C);
/* LX_LEX_PARSER.yy_chk_template_2 */
extern void T38f364(T0* C, T0* a1);
/* LX_LEX_PARSER.yy_array_subcopy */
extern void T38f365(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* KL_ARRAY_ROUTINES [INTEGER_32].subcopy */
extern void T163f3(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* ARRAY [INTEGER_32].subcopy */
extern void T142f14(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* LX_LEX_PARSER.integer_array_ */
extern T0* T38f263(T0* C);
/* LX_LEX_PARSER.yy_chk_template_1 */
extern void T38f363(T0* C, T0* a1);
/* LX_LEX_PARSER.yy_nxt_template */
extern unsigned char ge167os2952;
extern T0* ge167ov2952;
extern T0* T38f236(T0* C);
/* LX_LEX_PARSER.yy_nxt_template_2 */
extern void T38f362(T0* C, T0* a1);
/* LX_LEX_PARSER.yy_nxt_template_1 */
extern void T38f361(T0* C, T0* a1);
/* LX_LEX_PARSER.empty_buffer */
extern unsigned char ge196os2829;
extern T0* ge196ov2829;
extern T0* T38f155(T0* C);
/* YY_BUFFER.make */
extern T0* T79c13(T0* a1);
/* YY_BUFFER.make_from_buffer */
extern void T79f19(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.fill_from_string */
extern void T249f13(T0* C, T0* a1, T6 a2);
/* YY_BUFFER.new_default_buffer */
extern T0* T79f11(T0* C, T6 a1);
/* GELEX_COMMAND_LINE.read_options */
extern void T22f6(T0* C, T0* a1);
/* LX_DESCRIPTION.set_input_filename */
extern void T25f48(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].first */
extern T0* T74f15(T0* C);
/* UT_ERROR_HANDLER.report_info_message */
extern void T24f9(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.full_usage_instruction */
extern T0* T71f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].forth */
extern void T179f21(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_forth */
extern void T179f24(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].set_position */
extern void T258f6(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].add_traversing_cursor */
extern void T179f25(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].set_next_cursor */
extern void T258f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].remove_traversing_cursor */
extern void T179f26(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.alternative_usage_instruction */
extern T0* T71f15(T0* C, T0* a1, T0* a2);
/* ST_WORD_WRAPPER.wrapped_string */
extern T0* T190f5(T0* C, T0* a1);
/* ST_WORD_WRAPPER.canonify_whitespace */
extern void T190f12(T0* C, T0* a1);
/* ST_WORD_WRAPPER.is_space */
extern T1 T190f8(T0* C, T2 a1);
/* ST_WORD_WRAPPER.string_ */
extern T0* T190f4(T0* C);
/* ST_WORD_WRAPPER.set_new_line_indentation */
extern void T190f10(T0* C, T6 a1);
/* AP_DISPLAY_HELP_FLAG.wrapper */
extern unsigned char ge60os5647;
extern T0* ge60ov5647;
extern T0* T71f25(T0* C);
/* ST_WORD_WRAPPER.set_maximum_text_width */
extern void T190f11(T0* C, T6 a1);
/* ST_WORD_WRAPPER.make */
extern T0* T190c9(void);
/* STRING_8.make_filled */
extern T0* T17c40(T2 a1, T6 a2);
/* STRING_8.fill_character */
extern void T17f44(T0* C, T2 a1);
/* SPECIAL [CHARACTER_8].fill_with */
extern void T15f13(T0* C, T2 a1, T6 a2, T6 a3);
/* STRING_8.keep_head */
extern void T17f47(T0* C, T6 a1);
/* KL_UNIX_FILE_SYSTEM.basename */
extern T0* T193f1(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.root_directory */
extern unsigned char ge360os7248;
extern T0* ge360ov7248;
extern T0* T193f3(T0* C);
/* KL_UNIX_FILE_SYSTEM.is_root_directory */
extern T1 T193f2(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.basename */
extern T0* T192f6(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_separator */
extern T1 T192f4(T0* C, T2 a1);
/* KL_WINDOWS_FILE_SYSTEM.root_directory */
extern unsigned char ge362os7248;
extern T0* ge362ov7248;
extern T0* T192f3(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.is_root_directory */
extern T1 T192f2(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.arguments */
extern unsigned char ge371os1568;
extern T0* ge371ov1568;
extern T0* T71f17(T0* C);
/* KL_ARGUMENTS.make */
extern T0* T23c4(void);
/* KL_ARGUMENTS.argument */
extern T0* T23f2(T0* C, T6 a1);
/* AP_DISPLAY_HELP_FLAG.file_system */
extern unsigned char ge354os3250;
extern T0* ge354ov3250;
extern T0* T71f16(T0* C);
/* AP_DISPLAY_HELP_FLAG.unix_file_system */
extern unsigned char ge354os3253;
extern T0* ge354ov3253;
extern T0* T71f11(T0* C);
/* KL_UNIX_FILE_SYSTEM.make */
extern T0* T193c5(void);
/* KL_OPERATING_SYSTEM.is_unix */
extern unsigned char ge449os4019;
extern T1 ge449ov4019;
extern T1 T191f2(T0* C);
/* KL_OPERATING_SYSTEM.current_working_directory */
extern T0* T191f4(T0* C);
/* EXECUTION_ENVIRONMENT.current_working_directory */
extern T0* T265f2(T0* C);
/* KL_OPERATING_SYSTEM.execution_environment */
extern unsigned char ge449os4023;
extern T0* ge449ov4023;
extern T0* T191f5(T0* C);
/* EXECUTION_ENVIRONMENT.default_create */
extern T0* T265c4(void);
/* KL_OPERATING_SYSTEM.variable_value */
extern T0* T191f3(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.get */
extern T0* T265f1(T0* C, T0* a1);
/* STRING_8.make_from_c */
extern T0* T17c50(T14 a1);
/* STRING_8.from_c */
extern void T17f51(T0* C, T14 a1);
/* C_STRING.read_string_into */
extern void T282f6(T0* C, T0* a1);
/* C_STRING.read_substring_into */
extern void T282f8(T0* C, T0* a1, T6 a2, T6 a3);
/* STRING_8.put_code */
extern void T17f52(T0* C, T10 a1, T6 a2);
/* NATURAL_8.to_natural_32 */
extern T10 T8f12(T8* C);
/* MANAGED_POINTER.read_natural_8 */
extern T8 T286f6(T0* C, T6 a1);
/* TYPED_POINTER [NATURAL_8].memory_copy */
extern void T291f2(T291* C, T14 a1, T6 a2);
/* TYPED_POINTER [NATURAL_8].c_memcpy */
extern void T291f3(T291* C, T14 a1, T14 a2, T6 a3);
/* C_STRING.share_from_pointer */
extern void T282f5(T0* C, T14 a1);
/* C_STRING.share_from_pointer_and_count */
extern void T282f7(T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.set_from_pointer */
extern void T286f9(T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.share_from_pointer */
extern T0* T286c8(T14 a1, T6 a2);
/* C_STRING.c_strlen */
extern T6 T282f3(T0* C, T14 a1);
/* STRING_8.c_string_provider */
extern unsigned char ge593os1257;
extern T0* ge593ov1257;
extern T0* T17f29(T0* C);
/* C_STRING.make_empty */
extern T0* T282c4(T6 a1);
/* MANAGED_POINTER.make */
extern T0* T286c7(T6 a1);
/* EXCEPTIONS.raise */
extern void T292f3(T0* C, T0* a1);
/* EXCEPTIONS.eraise */
extern void T292f4(T0* C, T14 a1, T6 a2);
/* EXCEPTIONS.default_create */
extern T0* T292c2(void);
/* MANAGED_POINTER.default_pointer */
extern T14 T286f5(T0* C);
/* POINTER.memory_calloc */
extern T14 T14f2(T14* C, T6 a1, T6 a2);
/* POINTER.c_calloc */
extern T14 T14f3(T14* C, T6 a1, T6 a2);
/* EXECUTION_ENVIRONMENT.eif_getenv */
extern T14 T265f3(T0* C, T14 a1);
/* AP_DISPLAY_HELP_FLAG.windows_file_system */
extern unsigned char ge354os3251;
extern T0* ge354ov3251;
extern T0* T71f10(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.make */
extern T0* T192c7(void);
/* KL_OPERATING_SYSTEM.is_windows */
extern unsigned char ge449os4018;
extern T1 ge449ov4018;
extern T1 T191f1(T0* C);
/* AP_DISPLAY_HELP_FLAG.operating_system */
extern T0* T71f9(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.forth */
extern void T64f16(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_forth */
extern void T64f18(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.add_traversing_cursor */
extern void T64f19(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [AP_OPTION].set_next_cursor */
extern void T186f8(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.remove_traversing_cursor */
extern void T64f20(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [AP_OPTION].set */
extern void T186f7(T0* C, T0* a1, T1 a2, T1 a3);
/* AP_ALTERNATIVE_OPTIONS_LIST.item_for_iteration */
extern T0* T64f6(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_item */
extern T0* T64f8(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.after */
extern T1 T64f5(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_after */
extern T1 T64f7(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.start */
extern void T64f15(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_start */
extern void T64f17(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_off */
extern T1 T64f9(T0* C, T0* a1);
/* STRING_8.make_empty */
extern T0* T17c39(void);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].item_for_iteration */
extern T0* T179f8(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_item */
extern T0* T179f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].item */
extern T0* T179f7(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].after */
extern T1 T179f9(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_after */
extern T1 T179f10(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].start */
extern void T179f20(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_start */
extern void T179f23(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].is_empty */
extern T1 T179f15(T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].off */
extern T1 T258f4(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_off */
extern T1 T179f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_before */
extern T1 T179f17(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.usage_instruction */
extern T0* T71f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].forth */
extern void T178f23(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_forth */
extern void T178f26(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].set_position */
extern void T254f6(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].add_traversing_cursor */
extern void T178f27(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].set_next_cursor */
extern void T254f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].remove_traversing_cursor */
extern void T178f28(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].item_for_iteration */
extern T0* T178f7(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_item */
extern T0* T178f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].item */
extern T0* T178f11(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].after */
extern T1 T178f9(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_after */
extern T1 T178f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].start */
extern void T178f22(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_start */
extern void T178f25(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].is_empty */
extern T1 T178f17(T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].off */
extern T1 T254f4(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_off */
extern T1 T178f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].cursor_before */
extern T1 T178f19(T0* C, T0* a1);
/* LX_DESCRIPTION.set_inspect_used */
extern void T25f47(T0* C, T1 a1);
/* LX_DESCRIPTION.set_actions_separated */
extern void T25f46(T0* C, T1 a1);
/* GELEX_COMMAND_LINE.exceptions */
extern T0* T22f3(T0* C);
/* AP_ERROR.make_invalid_parameter_error */
extern T0* T65c20(T0* a1, T0* a2);
/* LX_DESCRIPTION.set_array_size */
extern void T25f37(T0* C, T6 a1);
/* AP_INTEGER_OPTION.parameter */
extern T6 T63f15(T0* C);
/* DS_LINKED_LIST [INTEGER_32].last */
extern T6 T185f7(T0* C);
/* AP_STRING_OPTION.parameter */
extern T0* T62f11(T0* C);
/* DS_ARRAYED_LIST [STRING_8].last */
extern T0* T74f7(T0* C);
/* LX_DESCRIPTION.set_line_pragma */
extern void T25f35(T0* C, T1 a1);
/* KL_STRING_ROUTINES.same_string */
extern T1 T69f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.elks_same_string */
extern T1 T69f9(T0* C, T0* a1, T0* a2);
/* STRING_8.same_string */
extern T1 T17f16(T0* C, T0* a1);
/* AP_ENUMERATION_OPTION.parameter */
extern T0* T61f16(T0* C);
/* GELEX_COMMAND_LINE.string_ */
extern T0* T22f2(T0* C);
/* GELEX_COMMAND_LINE.report_version_number */
extern void T22f7(T0* C);
/* UT_ERROR_HANDLER.report_info */
extern void T24f10(T0* C, T0* a1);
/* UT_VERSION_NUMBER.make */
extern T0* T72c7(T0* a1);
/* AP_PARSER.parse_arguments */
extern void T59f28(T0* C);
/* AP_PARSER.parse_list */
extern void T59f30(T0* C, T0* a1);
/* AP_PARSER.final_error_action */
extern void T59f34(T0* C);
/* AP_PARSER.exceptions */
extern T0* T59f21(T0* C);
/* AP_ERROR_HANDLER.report_error_message */
extern void T180f10(T0* C, T0* a1);
/* AP_ERROR_HANDLER.report_error_message */
extern void T180f10p1(T0* C, T0* a1);
/* AP_PARSER.check_options_after_parsing */
extern void T59f33(T0* C);
/* AP_ERROR.make_surplus_option_error */
extern T0* T65c22(T0* a1);
/* AP_ERROR_HANDLER.report_error */
extern void T180f9(T0* C, T0* a1);
/* AP_ERROR_HANDLER.message */
extern T0* T180f6(T0* C, T0* a1);
/* AP_ERROR.make_missing_option_error */
extern T0* T65c21(T0* a1);
/* AP_PARSER.parse_argument */
extern void T59f32(T0* C);
/* AP_PARSER.parse_short */
extern void T59f36(T0* C);
/* AP_ERROR.make_missing_parameter_error */
extern T0* T65c24(T0* a1);
/* DS_ARRAYED_LIST [STRING_8].off */
extern T1 T74f6(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_off */
extern T1 T74f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].cursor_before */
extern T1 T74f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].cursor_after */
extern T1 T74f10(T0* C, T0* a1);
/* AP_ERROR.make_unknown_option_error */
extern T0* T65c23(T0* a1);
/* CHARACTER_8.out */
extern T0* T2f2(T2* C);
/* AP_PARSER.parse_long */
extern void T59f35(T0* C);
/* AP_ERROR.make_unnecessary_parameter_error */
extern T0* T65c25(T0* a1, T0* a2);
/* AP_PARSER.string_ */
extern T0* T59f23(T0* C);
/* STRING_8.index_of */
extern T6 T17f26(T0* C, T2 a1, T6 a2);
/* DS_ARRAYED_LIST [STRING_8].forth */
extern void T74f25(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_forth */
extern void T74f29(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].set_position */
extern void T194f6(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].add_traversing_cursor */
extern void T74f33(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T194f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].remove_traversing_cursor */
extern void T74f34(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].item_for_iteration */
extern T0* T74f16(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_item */
extern T0* T74f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].after */
extern T1 T74f9(T0* C);
/* DS_ARRAYED_LIST [STRING_8].start */
extern void T74f24(T0* C);
/* DS_ARRAYED_LIST [STRING_8].cursor_start */
extern void T74f28(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].is_empty */
extern T1 T74f20(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].off */
extern T1 T194f4(T0* C);
/* AP_PARSER.reset_parser */
extern void T59f31(T0* C);
/* AP_PARSER.all_options */
extern T0* T59f15(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].has */
extern T1 T178f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].make */
extern T0* T178c20(T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].new_cursor */
extern T0* T178f14(T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].make */
extern T0* T254c5(T0* a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].make */
extern T0* T257f1(T0* C, T6 a1);
/* TO_SPECIAL [AP_OPTION].make_area */
extern T0* T277c2(T6 a1);
/* SPECIAL [AP_OPTION].make */
extern T0* T256c4(T6 a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].default_create */
extern T0* T257c3(void);
/* AP_ERROR_HANDLER.reset */
extern void T180f8(T0* C);
/* DS_ARRAYED_LIST [STRING_8].force */
extern void T74f23(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [STRING_8].put */
extern void T74f27(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [STRING_8].move_cursors_right */
extern void T74f32(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [STRING_8].move_right */
extern void T74f31(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [STRING_8].put_last */
extern void T74f30(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].make */
extern T0* T74c21(T6 a1);
/* DS_ARRAYED_LIST [STRING_8].new_cursor */
extern T0* T74f17(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].make */
extern T0* T194c5(T0* a1);
/* AP_PARSER.arguments */
extern T0* T59f17(T0* C);
/* AP_FLAG.make_with_short_form */
extern T0* T60c20(T2 a1);
/* AP_FLAG.set_short_form */
extern void T60f22(T0* C, T2 a1);
/* AP_FLAG.initialize */
extern void T60f21(T0* C);
/* AP_ENUMERATION_OPTION.set_parameter_description */
extern void T61f27(T0* C, T0* a1);
/* AP_ENUMERATION_OPTION.extend */
extern void T61f26(T0* C, T0* a1);
/* AP_ENUMERATION_OPTION.update_parameter_description */
extern void T61f31(T0* C);
/* DS_LINKED_LIST [STRING_8].forth */
extern void T181f20(T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_forth */
extern void T181f22(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].add_traversing_cursor */
extern void T181f23(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T261f8(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].remove_traversing_cursor */
extern void T181f24(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].set */
extern void T261f7(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST [STRING_8].is_last */
extern T1 T181f11(T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_is_last */
extern T1 T181f7(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].item_for_iteration */
extern T0* T181f8(T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_item */
extern T0* T181f6(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].after */
extern T1 T181f12(T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_after */
extern T1 T181f13(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].start */
extern void T181f19(T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_start */
extern void T181f21(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].cursor_off */
extern T1 T181f14(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].force_last */
extern void T181f17(T0* C, T0* a1);
/* DS_LINKABLE [STRING_8].put_right */
extern void T262f4(T0* C, T0* a1);
/* DS_LINKABLE [STRING_8].make */
extern T0* T262c3(T0* a1);
/* DS_LINKED_LIST [STRING_8].is_empty */
extern T1 T181f10(T0* C);
/* AP_ENUMERATION_OPTION.set_description */
extern void T61f25(T0* C, T0* a1);
/* AP_ENUMERATION_OPTION.make_with_long_form */
extern T0* T61c24(T0* a1);
/* AP_ENUMERATION_OPTION.set_long_form */
extern void T61f29(T0* C, T0* a1);
/* AP_ENUMERATION_OPTION.initialize */
extern void T61f28(T0* C);
/* DS_LINKED_LIST [STRING_8].set_equality_tester */
extern void T181f18(T0* C, T0* a1);
/* AP_ENUMERATION_OPTION.string_equality_tester */
extern T0* T61f13(T0* C);
/* DS_LINKED_LIST [STRING_8].make */
extern T0* T181c16(void);
/* DS_LINKED_LIST [STRING_8].new_cursor */
extern T0* T181f9(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].make */
extern T0* T261c6(T0* a1);
/* AP_ENUMERATION_OPTION.initialize */
extern void T61f28p1(T0* C);
/* AP_ENUMERATION_OPTION.initialize */
extern void T61f28p0(T0* C);
/* AP_ENUMERATION_OPTION.initialize */
extern void T61f28p2(T0* C);
/* AP_STRING_OPTION.set_parameter_description */
extern void T62f24(T0* C, T0* a1);
/* AP_STRING_OPTION.set_description */
extern void T62f23(T0* C, T0* a1);
/* AP_STRING_OPTION.make */
extern T0* T62c22(T2 a1, T0* a2);
/* AP_STRING_OPTION.set_long_form */
extern void T62f27(T0* C, T0* a1);
/* AP_STRING_OPTION.set_short_form */
extern void T62f26(T0* C, T2 a1);
/* AP_STRING_OPTION.initialize */
extern void T62f25(T0* C);
/* AP_STRING_OPTION.initialize */
extern void T62f25p1(T0* C);
/* AP_STRING_OPTION.initialize */
extern void T62f25p0(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].force_last */
extern void T178f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_OPTION].resize */
extern void T178f24(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].resize */
extern T0* T257f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [AP_OPTION].resized_area */
extern T0* T256f3(T0* C, T6 a1);
/* SPECIAL [AP_OPTION].copy_data */
extern void T256f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [AP_OPTION].move_data */
extern void T256f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [AP_OPTION].overlapping_move */
extern void T256f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [AP_OPTION].non_overlapping_move */
extern void T256f8(T0* C, T6 a1, T6 a2, T6 a3);
/* DS_ARRAYED_LIST [AP_OPTION].new_capacity */
extern T6 T178f16(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].extendible */
extern T1 T178f15(T0* C, T6 a1);
/* AP_INTEGER_OPTION.set_parameter_description */
extern void T63f24(T0* C, T0* a1);
/* AP_INTEGER_OPTION.set_description */
extern void T63f23(T0* C, T0* a1);
/* AP_INTEGER_OPTION.make_with_short_form */
extern T0* T63c22(T2 a1);
/* AP_INTEGER_OPTION.set_short_form */
extern void T63f26(T0* C, T2 a1);
/* AP_INTEGER_OPTION.initialize */
extern void T63f25(T0* C);
/* AP_INTEGER_OPTION.initialize */
extern void T63f25p1(T0* C);
/* AP_INTEGER_OPTION.initialize */
extern void T63f25p0(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].force_last */
extern void T179f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].resize */
extern void T179f22(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].resize */
extern T0* T260f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].resized_area */
extern T0* T259f3(T0* C, T6 a1);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].copy_data */
extern void T259f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].move_data */
extern void T259f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].overlapping_move */
extern void T259f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].non_overlapping_move */
extern void T259f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T259c4(T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].new_capacity */
extern T6 T179f14(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].extendible */
extern T1 T179f12(T0* C, T6 a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.make */
extern T0* T64c11(T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.old_make */
extern void T64f14(T0* C);
/* AP_ALTERNATIVE_OPTIONS_LIST.new_cursor */
extern T0* T64f10(T0* C);
/* DS_LINKED_LIST_CURSOR [AP_OPTION].make */
extern T0* T186c6(T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.set_parameters_description */
extern void T64f13(T0* C, T0* a1);
/* AP_ALTERNATIVE_OPTIONS_LIST.set_introduction_option */
extern void T64f12(T0* C, T0* a1);
/* AP_FLAG.set_description */
extern void T60f19(T0* C, T0* a1);
/* AP_FLAG.make */
extern T0* T60c18(T2 a1, T0* a2);
/* AP_FLAG.set_long_form */
extern void T60f23(T0* C, T0* a1);
/* AP_PARSER.set_parameters_description */
extern void T59f27(T0* C, T0* a1);
/* AP_PARSER.set_application_description */
extern void T59f26(T0* C, T0* a1);
/* AP_PARSER.make */
extern T0* T59c25(void);
/* AP_DISPLAY_HELP_FLAG.set_description */
extern void T71f37(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.make */
extern T0* T71c36(T2 a1, T0* a2);
/* AP_DISPLAY_HELP_FLAG.set_long_form */
extern void T71f40(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.set_short_form */
extern void T71f39(T0* C, T2 a1);
/* AP_DISPLAY_HELP_FLAG.initialize */
extern void T71f38(T0* C);
/* AP_PARSER.make_empty */
extern void T59f29(T0* C);
/* AP_ERROR_HANDLER.make_standard */
extern T0* T180c7(void);
/* AP_ERROR_HANDLER.std */
extern T0* T180f5(T0* C);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T179c18(T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].new_cursor */
extern T0* T179f11(T0* C);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T258c5(T0* a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T260f1(T0* C, T6 a1);
/* TO_SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].make_area */
extern T0* T278c2(T6 a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].default_create */
extern T0* T260c3(void);
/* GELEX_COMMAND_LINE.make */
extern T0* T22c5(T0* a1);
/* LX_DESCRIPTION.make */
extern T0* T25c34(void);
/* LX_START_CONDITIONS.make_with_initial */
extern T0* T75c17(T6 a1);
/* LX_START_CONDITIONS.put_first */
extern void T75f28(T0* C, T0* a1);
/* LX_START_CONDITIONS.put */
extern void T75f32(T0* C, T0* a1, T6 a2);
/* LX_START_CONDITIONS.move_cursors_right */
extern void T75f35(T0* C, T6 a1, T6 a2);
/* LX_START_CONDITIONS.move_right */
extern void T75f34(T0* C, T6 a1, T6 a2);
/* UT_ERROR_HANDLER.make_standard */
extern T0* T24c6(void);
/* UT_ERROR_HANDLER.std */
extern T0* T24f4(T0* C);
/* KL_ARGUMENTS.set_program_name */
extern void T23f5(T0* C, T0* a1);
/* GELEX.arguments */
extern T0* T21f6(T0* C);
/* GELEX.resurrect_code */
extern void T21f8(T0* C);
/* KL_EQUALITY_TESTER [LX_SYMBOL_CLASS].default_create */
extern T0* T37c1(void);
/* KL_EQUALITY_TESTER [LX_SINGLETON].default_create */
extern T0* T36c1(void);
/* KL_EQUALITY_TESTER [LX_TRANSITION_TABLE [LX_DFA_STATE]].default_create */
extern T0* T35c1(void);
/* KL_EQUALITY_TESTER [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].default_create */
extern T0* T34c1(void);
/* KL_EQUALITY_TESTER [LX_PROTO].default_create */
extern T0* T33c1(void);
/* KL_EQUALITY_TESTER [LX_NFA].default_create */
extern T0* T32c1(void);
/* KL_EQUALITY_TESTER [STRING_8].default_create */
extern T0* T31c1(void);
/* KL_EQUALITY_TESTER [LX_RULE].default_create */
extern T0* T29c1(void);
/* KL_EQUALITY_TESTER [LX_START_CONDITION].default_create */
extern T0* T28c1(void);
/* KL_EQUALITY_TESTER [LX_NFA_STATE].default_create */
extern T0* T27c1(void);
/* KL_EQUALITY_TESTER [LX_DFA_STATE].default_create */
extern T0* T26c1(void);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].set_target */
extern void T212f7(T0* C, T0* a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].set_target */
extern void T211f7(T0* C, T0* a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].set_target */
extern void T208f6(T0* C, T0* a1);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].record */
extern void T212f8(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.put */
extern void T147f12(T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.put */
extern void T147f12p1(T0* C, T6 a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].record */
extern void T211f8(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.add */
extern void T147f11(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.add */
extern void T147f11p1(T0* C, T0* a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].record */
extern void T208f7(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.reset */
extern void T71f41(T0* C);
/* AP_INTEGER_OPTION.reset */
extern void T63f27(T0* C);
/* DS_LINKED_LIST [INTEGER_32].make */
extern T0* T185c8(void);
/* DS_LINKED_LIST [INTEGER_32].new_cursor */
extern T0* T185f5(T0* C);
/* DS_LINKED_LIST_CURSOR [INTEGER_32].make */
extern T0* T264c3(T0* a1);
/* AP_STRING_OPTION.reset */
extern void T62f28(T0* C);
/* AP_ENUMERATION_OPTION.reset */
extern void T61f30(T0* C);
/* AP_FLAG.reset */
extern void T60f24(T0* C);
/* AP_DISPLAY_HELP_FLAG.record_occurrence */
extern void T71f42(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.display_help */
extern void T71f43(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.exceptions */
extern T0* T71f30(T0* C);
/* AP_ERROR_HANDLER.report_info_message */
extern void T180f11(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.full_help_text */
extern T0* T71f29(T0* C, T0* a1);
/* AP_DISPLAY_HELP_FLAG.option_help_text */
extern T0* T71f35(T0* C, T0* a1, T6 a2);
/* STRING_8.infix "+" */
extern T0* T17f17(T0* C, T0* a1);
/* DS_QUICK_SORTER [AP_OPTION].sort */
extern void T288f3(T0* C, T0* a1);
/* DS_QUICK_SORTER [AP_OPTION].sort_with_comparator */
extern void T288f4(T0* C, T0* a1, T0* a2);
/* DS_QUICK_SORTER [AP_OPTION].subsort_with_comparator */
extern void T288f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* ARRAY [INTEGER_32].force */
extern void T142f15(T0* C, T6 a1, T6 a2);
/* ARRAY [INTEGER_32].auto_resize */
extern void T142f16(T0* C, T6 a1, T6 a2);
/* ARRAY [INTEGER_32].capacity */
extern T6 T142f8(T0* C);
/* ARRAY [INTEGER_32].additional_space */
extern T6 T142f7(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].swap */
extern void T178f30(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [AP_OPTION].replace */
extern void T178f29(T0* C, T0* a1, T6 a2);
/* AP_OPTION_COMPARATOR.less_than */
extern T1 T287f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.three_way_comparison */
extern T6 T69f11(T0* C, T0* a1, T0* a2);
/* CHARACTER_8.infix "<" */
extern T1 T2f17(T2* C, T2 a1);
/* AP_OPTION_COMPARATOR.string_ */
extern T0* T287f2(T0* C);
/* STRING_8.is_empty */
extern T1 T17f30(T0* C);
/* DS_QUICK_SORTER [AP_OPTION].make */
extern T0* T288c2(T0* a1);
/* AP_OPTION_COMPARATOR.default_create */
extern T0* T287c3(void);
/* AP_INTEGER_OPTION.record_occurrence */
extern void T63f28(T0* C, T0* a1);
/* DS_LINKED_LIST [INTEGER_32].force_last */
extern void T185f9(T0* C, T6 a1);
/* DS_LINKABLE [INTEGER_32].put_right */
extern void T263f4(T0* C, T0* a1);
/* DS_LINKABLE [INTEGER_32].make */
extern T0* T263c3(T6 a1);
/* DS_LINKED_LIST [INTEGER_32].is_empty */
extern T1 T185f6(T0* C);
/* AP_STRING_OPTION.record_occurrence */
extern void T62f29(T0* C, T0* a1);
/* AP_ENUMERATION_OPTION.record_occurrence */
extern void T61f32(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].has */
extern T1 T181f15(T0* C, T0* a1);
/* AP_ENUMERATION_OPTION.record_occurrence */
extern void T61f32p1(T0* C, T0* a1);
/* AP_FLAG.record_occurrence */
extern void T60f25(T0* C, T0* a1);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].cloned_object */
extern T0* T212f3(T0* C);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].twin */
extern T0* T212f5(T0* C);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].copy */
extern void T212f9(T0* C, T0* a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].cloned_object */
extern T0* T211f3(T0* C);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].twin */
extern T0* T211f5(T0* C);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].copy */
extern void T211f9(T0* C, T0* a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].cloned_object */
extern T0* T208f2(T0* C);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].twin */
extern T0* T208f4(T0* C);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].copy */
extern void T208f8(T0* C, T0* a1);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T212f4(T0* C, T6 a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T211f4(T0* C, T6 a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T208f3(T0* C, T6 a1);
/* AP_DISPLAY_HELP_FLAG.was_found */
extern T1 T71f24(T0* C);
/* AP_INTEGER_OPTION.was_found */
extern T1 T63f14(T0* C);
/* AP_STRING_OPTION.was_found */
extern T1 T62f16(T0* C);
/* AP_ENUMERATION_OPTION.was_found */
extern T1 T61f18(T0* C);
/* AP_FLAG.was_found */
extern T1 T60f9(T0* C);
/* AP_INTEGER_OPTION.occurrences */
extern T6 T63f13(T0* C);
/* AP_STRING_OPTION.occurrences */
extern T6 T62f13(T0* C);
/* AP_ENUMERATION_OPTION.occurrences */
extern T6 T61f17(T0* C);
/* AP_DISPLAY_HELP_FLAG.allows_parameter */
extern T1 T71f21(T0* C);
/* AP_INTEGER_OPTION.allows_parameter */
extern T1 T63f17(T0* C);
/* AP_STRING_OPTION.allows_parameter */
extern T1 T62f15(T0* C);
/* AP_ENUMERATION_OPTION.allows_parameter */
extern T1 T61f15(T0* C);
/* AP_FLAG.allows_parameter */
extern T1 T60f12(T0* C);
/* AP_DISPLAY_HELP_FLAG.needs_parameter */
extern T1 T71f19(T0* C);
/* AP_INTEGER_OPTION.needs_parameter */
extern T1 T63f16(T0* C);
/* AP_FLAG.needs_parameter */
extern T1 T60f11(T0* C);
/* AP_DISPLAY_HELP_FLAG.name */
extern T0* T71f20(T0* C);
/* AP_INTEGER_OPTION.name */
extern T0* T63f18(T0* C);
/* AP_STRING_OPTION.name */
extern T0* T62f12(T0* C);
/* AP_ENUMERATION_OPTION.name */
extern T0* T61f12(T0* C);
/* AP_FLAG.name */
extern T0* T60f13(T0* C);
/* AP_DISPLAY_HELP_FLAG.example */
extern T0* T71f26(T0* C);
/* AP_INTEGER_OPTION.example */
extern T0* T63f19(T0* C);
/* AP_STRING_OPTION.example */
extern T0* T62f17(T0* C);
/* AP_ENUMERATION_OPTION.example */
extern T0* T61f19(T0* C);
/* AP_FLAG.example */
extern T0* T60f14(T0* C);
/* AP_DISPLAY_HELP_FLAG.names */
extern T0* T71f34(T0* C);
/* AP_INTEGER_OPTION.names */
extern T0* T63f21(T0* C);
/* AP_INTEGER_OPTION.names */
extern T0* T63f21p1(T0* C);
/* AP_STRING_OPTION.names */
extern T0* T62f21(T0* C);
/* AP_STRING_OPTION.names */
extern T0* T62f21p1(T0* C);
/* AP_ENUMERATION_OPTION.names */
extern T0* T61f23(T0* C);
/* AP_ENUMERATION_OPTION.names */
extern T0* T61f23p1(T0* C);
/* AP_FLAG.names */
extern T0* T60f17(T0* C);
/* AP_DISPLAY_HELP_FLAG.has_long_form */
extern T1 T71f18(T0* C);
/* AP_INTEGER_OPTION.has_long_form */
extern T1 T63f10(T0* C);
/* AP_STRING_OPTION.has_long_form */
extern T1 T62f14(T0* C);
/* AP_ENUMERATION_OPTION.has_long_form */
extern T1 T61f14(T0* C);
/* AP_FLAG.has_long_form */
extern T1 T60f10(T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.default_message */
extern T0* T173f5(T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.message */
extern T0* T173f3(T0* C, T0* a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.arguments */
extern T0* T173f6(T0* C);
/* KL_STRING_ROUTINES.appended_string */
extern T0* T69f5(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.concat */
extern T0* T69f10(T0* C, T0* a1, T0* a2);
/* ARRAY [STRING_8].valid_index */
extern T1 T131f4(T0* C, T6 a1);
/* KL_STRING_ROUTINES.append_substring_to_string */
extern void T69f13(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* KL_STRING_ROUTINES.appended_substring */
extern T0* T69f4(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* KL_STRING_ROUTINES.new_empty_string */
extern T0* T69f3(T0* C, T0* a1, T6 a2);
/* STRING_8.wipe_out */
extern void T17f38(T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.string_ */
extern T0* T173f4(T0* C);
/* LX_ITERATION_NOT_POSITIVE_ERROR.default_message */
extern T0* T172f5(T0* C);
/* LX_ITERATION_NOT_POSITIVE_ERROR.message */
extern T0* T172f3(T0* C, T0* a1);
/* LX_ITERATION_NOT_POSITIVE_ERROR.arguments */
extern T0* T172f6(T0* C);
/* LX_ITERATION_NOT_POSITIVE_ERROR.string_ */
extern T0* T172f4(T0* C);
/* LX_BAD_ITERATION_VALUES_ERROR.default_message */
extern T0* T171f5(T0* C);
/* LX_BAD_ITERATION_VALUES_ERROR.message */
extern T0* T171f3(T0* C, T0* a1);
/* LX_BAD_ITERATION_VALUES_ERROR.arguments */
extern T0* T171f6(T0* C);
/* LX_BAD_ITERATION_VALUES_ERROR.string_ */
extern T0* T171f4(T0* C);
/* LX_MULTIPLE_EOF_RULES_ERROR.default_message */
extern T0* T127f5(T0* C);
/* LX_MULTIPLE_EOF_RULES_ERROR.message */
extern T0* T127f3(T0* C, T0* a1);
/* LX_MULTIPLE_EOF_RULES_ERROR.arguments */
extern T0* T127f6(T0* C);
/* LX_MULTIPLE_EOF_RULES_ERROR.string_ */
extern T0* T127f4(T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.default_message */
extern T0* T126f5(T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.message */
extern T0* T126f3(T0* C, T0* a1);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.arguments */
extern T0* T126f6(T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.string_ */
extern T0* T126f4(T0* C);
/* LX_NAME_DEFINED_TWICE_ERROR.default_message */
extern T0* T125f5(T0* C);
/* LX_NAME_DEFINED_TWICE_ERROR.message */
extern T0* T125f3(T0* C, T0* a1);
/* LX_NAME_DEFINED_TWICE_ERROR.arguments */
extern T0* T125f6(T0* C);
/* LX_NAME_DEFINED_TWICE_ERROR.string_ */
extern T0* T125f4(T0* C);
/* LX_START_CONDITION_DECLARED_TWICE_ERROR.default_message */
extern T0* T124f5(T0* C);
/* LX_START_CONDITION_DECLARED_TWICE_ERROR.message */
extern T0* T124f3(T0* C, T0* a1);
/* LX_START_CONDITION_DECLARED_TWICE_ERROR.arguments */
extern T0* T124f6(T0* C);
/* LX_START_CONDITION_DECLARED_TWICE_ERROR.string_ */
extern T0* T124f4(T0* C);
/* LX_ALL_START_CONDITIONS_EOF_ERROR.default_message */
extern T0* T123f5(T0* C);
/* LX_ALL_START_CONDITIONS_EOF_ERROR.message */
extern T0* T123f3(T0* C, T0* a1);
/* LX_ALL_START_CONDITIONS_EOF_ERROR.arguments */
extern T0* T123f6(T0* C);
/* LX_ALL_START_CONDITIONS_EOF_ERROR.string_ */
extern T0* T123f4(T0* C);
/* LX_UNDECLARED_START_CONDITION_ERROR.default_message */
extern T0* T122f5(T0* C);
/* LX_UNDECLARED_START_CONDITION_ERROR.message */
extern T0* T122f3(T0* C, T0* a1);
/* LX_UNDECLARED_START_CONDITION_ERROR.arguments */
extern T0* T122f6(T0* C);
/* LX_UNDECLARED_START_CONDITION_ERROR.string_ */
extern T0* T122f4(T0* C);
/* LX_START_CONDITION_SPECIFIED_TWICE_ERROR.default_message */
extern T0* T121f5(T0* C);
/* LX_START_CONDITION_SPECIFIED_TWICE_ERROR.message */
extern T0* T121f3(T0* C, T0* a1);
/* LX_START_CONDITION_SPECIFIED_TWICE_ERROR.arguments */
extern T0* T121f6(T0* C);
/* LX_START_CONDITION_SPECIFIED_TWICE_ERROR.string_ */
extern T0* T121f4(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.default_message */
extern T0* T120f5(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.message */
extern T0* T120f3(T0* C, T0* a1);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.arguments */
extern T0* T120f6(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.string_ */
extern T0* T120f4(T0* C);
/* LX_FULL_AND_REJECT_ERROR.default_message */
extern T0* T119f5(T0* C);
/* LX_FULL_AND_REJECT_ERROR.message */
extern T0* T119f3(T0* C, T0* a1);
/* LX_FULL_AND_REJECT_ERROR.arguments */
extern T0* T119f6(T0* C);
/* LX_FULL_AND_REJECT_ERROR.string_ */
extern T0* T119f4(T0* C);
/* LX_FULL_AND_META_ERROR.default_message */
extern T0* T118f5(T0* C);
/* LX_FULL_AND_META_ERROR.message */
extern T0* T118f3(T0* C, T0* a1);
/* LX_FULL_AND_META_ERROR.arguments */
extern T0* T118f6(T0* C);
/* LX_FULL_AND_META_ERROR.string_ */
extern T0* T118f4(T0* C);
/* LX_BAD_CHARACTER_ERROR.default_message */
extern T0* T117f5(T0* C);
/* LX_BAD_CHARACTER_ERROR.message */
extern T0* T117f3(T0* C, T0* a1);
/* LX_BAD_CHARACTER_ERROR.arguments */
extern T0* T117f6(T0* C);
/* LX_BAD_CHARACTER_ERROR.string_ */
extern T0* T117f4(T0* C);
/* LX_MISSING_BRACKET_ERROR.default_message */
extern T0* T116f5(T0* C);
/* LX_MISSING_BRACKET_ERROR.message */
extern T0* T116f3(T0* C, T0* a1);
/* LX_MISSING_BRACKET_ERROR.arguments */
extern T0* T116f6(T0* C);
/* LX_MISSING_BRACKET_ERROR.string_ */
extern T0* T116f4(T0* C);
/* LX_BAD_CHARACTER_IN_BRACKETS_ERROR.default_message */
extern T0* T115f5(T0* C);
/* LX_BAD_CHARACTER_IN_BRACKETS_ERROR.message */
extern T0* T115f3(T0* C, T0* a1);
/* LX_BAD_CHARACTER_IN_BRACKETS_ERROR.arguments */
extern T0* T115f6(T0* C);
/* LX_BAD_CHARACTER_IN_BRACKETS_ERROR.string_ */
extern T0* T115f4(T0* C);
/* LX_INTEGER_TOO_LARGE_ERROR.default_message */
extern T0* T114f5(T0* C);
/* LX_INTEGER_TOO_LARGE_ERROR.message */
extern T0* T114f3(T0* C, T0* a1);
/* LX_INTEGER_TOO_LARGE_ERROR.arguments */
extern T0* T114f6(T0* C);
/* LX_INTEGER_TOO_LARGE_ERROR.string_ */
extern T0* T114f4(T0* C);
/* LX_BAD_START_CONDITION_ERROR.default_message */
extern T0* T113f5(T0* C);
/* LX_BAD_START_CONDITION_ERROR.message */
extern T0* T113f3(T0* C, T0* a1);
/* LX_BAD_START_CONDITION_ERROR.arguments */
extern T0* T113f6(T0* C);
/* LX_BAD_START_CONDITION_ERROR.string_ */
extern T0* T113f4(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.default_message */
extern T0* T112f5(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.message */
extern T0* T112f3(T0* C, T0* a1);
/* LX_BAD_CHARACTER_CLASS_ERROR.arguments */
extern T0* T112f6(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.string_ */
extern T0* T112f4(T0* C);
/* LX_UNDEFINED_DEFINITION_ERROR.default_message */
extern T0* T111f5(T0* C);
/* LX_UNDEFINED_DEFINITION_ERROR.message */
extern T0* T111f3(T0* C, T0* a1);
/* LX_UNDEFINED_DEFINITION_ERROR.arguments */
extern T0* T111f6(T0* C);
/* LX_UNDEFINED_DEFINITION_ERROR.string_ */
extern T0* T111f4(T0* C);
/* LX_INCOMPLETE_NAME_DEFINITION_ERROR.default_message */
extern T0* T110f5(T0* C);
/* LX_INCOMPLETE_NAME_DEFINITION_ERROR.message */
extern T0* T110f3(T0* C, T0* a1);
/* LX_INCOMPLETE_NAME_DEFINITION_ERROR.arguments */
extern T0* T110f6(T0* C);
/* LX_INCOMPLETE_NAME_DEFINITION_ERROR.string_ */
extern T0* T110f4(T0* C);
/* LX_MISSING_QUOTE_ERROR.default_message */
extern T0* T109f5(T0* C);
/* LX_MISSING_QUOTE_ERROR.message */
extern T0* T109f3(T0* C, T0* a1);
/* LX_MISSING_QUOTE_ERROR.arguments */
extern T0* T109f6(T0* C);
/* LX_MISSING_QUOTE_ERROR.string_ */
extern T0* T109f4(T0* C);
/* LX_UNRECOGNIZED_OPTION_ERROR.default_message */
extern T0* T108f5(T0* C);
/* LX_UNRECOGNIZED_OPTION_ERROR.message */
extern T0* T108f3(T0* C, T0* a1);
/* LX_UNRECOGNIZED_OPTION_ERROR.arguments */
extern T0* T108f6(T0* C);
/* LX_UNRECOGNIZED_OPTION_ERROR.string_ */
extern T0* T108f4(T0* C);
/* LX_START_CONDITION_EXPECTED_ERROR.default_message */
extern T0* T107f5(T0* C);
/* LX_START_CONDITION_EXPECTED_ERROR.message */
extern T0* T107f3(T0* C, T0* a1);
/* LX_START_CONDITION_EXPECTED_ERROR.arguments */
extern T0* T107f6(T0* C);
/* LX_START_CONDITION_EXPECTED_ERROR.string_ */
extern T0* T107f4(T0* C);
/* LX_DIRECTIVE_EXPECTED_ERROR.default_message */
extern T0* T106f5(T0* C);
/* LX_DIRECTIVE_EXPECTED_ERROR.message */
extern T0* T106f3(T0* C, T0* a1);
/* LX_DIRECTIVE_EXPECTED_ERROR.arguments */
extern T0* T106f6(T0* C);
/* LX_DIRECTIVE_EXPECTED_ERROR.string_ */
extern T0* T106f4(T0* C);
/* LX_UNRECOGNIZED_DIRECTIVE_ERROR.default_message */
extern T0* T105f5(T0* C);
/* LX_UNRECOGNIZED_DIRECTIVE_ERROR.message */
extern T0* T105f3(T0* C, T0* a1);
/* LX_UNRECOGNIZED_DIRECTIVE_ERROR.arguments */
extern T0* T105f6(T0* C);
/* LX_UNRECOGNIZED_DIRECTIVE_ERROR.string_ */
extern T0* T105f4(T0* C);
/* LX_TRAILING_CONTEXT_USED_TWICE_ERROR.default_message */
extern T0* T104f5(T0* C);
/* LX_TRAILING_CONTEXT_USED_TWICE_ERROR.message */
extern T0* T104f3(T0* C, T0* a1);
/* LX_TRAILING_CONTEXT_USED_TWICE_ERROR.arguments */
extern T0* T104f6(T0* C);
/* LX_TRAILING_CONTEXT_USED_TWICE_ERROR.string_ */
extern T0* T104f4(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.default_message */
extern T0* T103f5(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.message */
extern T0* T103f3(T0* C, T0* a1);
/* LX_UNRECOGNIZED_RULE_ERROR.arguments */
extern T0* T103f6(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.string_ */
extern T0* T103f4(T0* C);
/* LX_BAD_START_CONDITION_LIST_ERROR.default_message */
extern T0* T102f5(T0* C);
/* LX_BAD_START_CONDITION_LIST_ERROR.message */
extern T0* T102f3(T0* C, T0* a1);
/* LX_BAD_START_CONDITION_LIST_ERROR.arguments */
extern T0* T102f6(T0* C);
/* LX_BAD_START_CONDITION_LIST_ERROR.string_ */
extern T0* T102f4(T0* C);
/* UT_SYNTAX_ERROR.default_message */
extern T0* T97f5(T0* C);
/* UT_SYNTAX_ERROR.message */
extern T0* T97f3(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.arguments */
extern T0* T97f6(T0* C);
/* UT_SYNTAX_ERROR.string_ */
extern T0* T97f4(T0* C);
/* UT_VERSION_NUMBER.default_message */
extern T0* T72f5(T0* C);
/* UT_VERSION_NUMBER.message */
extern T0* T72f3(T0* C, T0* a1);
/* UT_VERSION_NUMBER.arguments */
extern T0* T72f6(T0* C);
/* UT_VERSION_NUMBER.string_ */
extern T0* T72f4(T0* C);
/* AP_ERROR.default_message */
extern T0* T65f5(T0* C);
/* AP_ERROR.message */
extern T0* T65f8(T0* C, T0* a1);
/* AP_ERROR.arguments */
extern T0* T65f6(T0* C);
/* AP_ERROR.string_ */
extern T0* T65f4(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
extern T0* T56f2(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
extern T0* T56f4(T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.arguments */
extern T0* T56f6(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
extern T0* T56f5(T0* C);
/* LX_DEFAULT_RULE_CAN_BE_MATCHED_ERROR.default_message */
extern T0* T52f2(T0* C);
/* LX_DEFAULT_RULE_CAN_BE_MATCHED_ERROR.message */
extern T0* T52f4(T0* C, T0* a1);
/* LX_DEFAULT_RULE_CAN_BE_MATCHED_ERROR.arguments */
extern T0* T52f6(T0* C);
/* LX_DEFAULT_RULE_CAN_BE_MATCHED_ERROR.string_ */
extern T0* T52f5(T0* C);
/* LX_RULE_CANNOT_BE_MATCHED_ERROR.default_message */
extern T0* T51f2(T0* C);
/* LX_RULE_CANNOT_BE_MATCHED_ERROR.message */
extern T0* T51f4(T0* C, T0* a1);
/* LX_RULE_CANNOT_BE_MATCHED_ERROR.arguments */
extern T0* T51f6(T0* C);
/* LX_RULE_CANNOT_BE_MATCHED_ERROR.string_ */
extern T0* T51f5(T0* C);
/* LX_DANGEROUS_TRAILING_CONTEXT_ERROR.default_message */
extern T0* T50f2(T0* C);
/* LX_DANGEROUS_TRAILING_CONTEXT_ERROR.message */
extern T0* T50f4(T0* C, T0* a1);
/* LX_DANGEROUS_TRAILING_CONTEXT_ERROR.arguments */
extern T0* T50f6(T0* C);
/* LX_DANGEROUS_TRAILING_CONTEXT_ERROR.string_ */
extern T0* T50f5(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.default_message */
extern T0* T40f2(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.message */
extern T0* T40f4(T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.arguments */
extern T0* T40f6(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.string_ */
extern T0* T40f5(T0* C);
extern T0* GE_ma142(T6 c, ...);
extern T0* ge455ov4760;
extern T0* ge459ov5626;
extern T0* ge457ov4760;
extern T0* ge462ov4760;
extern T0* ge432ov3235;
extern T0* ge278ov6734;
extern T0* ge278ov6735;
extern T0* ge160ov4378;
extern T0* ge277ov6747;
extern T0* ge277ov6746;
extern T0* ge277ov6745;
extern T0* ge277ov6744;
extern T0* ge160ov4380;
extern T0* ge456ov4017;
extern T0* ge443ov3215;
extern T0* ge60ov5634;
extern T0* ge62ov5561;
extern T0* ge62ov5568;
extern T0* ge368ov1573;
extern T0* ge59ov5173;
extern T0* ge62ov5564;
extern T0* ge62ov5571;
extern T0* ge62ov5562;
extern T0* ge62ov5569;
extern T0* ge62ov5563;
extern T0* ge62ov5570;
extern T0* ge62ov5565;
extern T0* ge62ov5572;
extern T0* ge62ov5566;
extern T0* ge62ov5573;
extern T0* ge59ov5168;
extern T0* ge59ov5167;
extern T0* ge59ov5175;
extern T0* ge59ov5174;
extern T0* ge60ov5635;
extern T0* ge60ov5636;
extern T0* ge60ov5637;
extern T0* ge145ov3942;
extern T0* ge140ov3942;
extern T0* ge128ov3942;
extern T0* ge143ov3942;
extern T0* ge131ov3942;
extern T0* ge144ov3942;
extern T0* ge147ov3942;
extern T0* ge124ov3942;
extern T0* ge151ov3942;
extern T0* ge149ov3942;
extern T0* ge137ov3942;
extern T0* ge136ov3942;
extern T0* ge135ov3942;
extern T0* ge126ov3942;
extern T0* ge141ov3942;
extern T0* ge127ov3942;
extern T0* ge139ov3942;
extern T0* ge129ov3942;
extern T0* ge125ov3942;
extern T0* ge152ov3942;
extern T0* ge138ov3942;
extern T0* ge142ov3942;
extern T0* ge154ov3942;
extern T0* ge148ov3942;
extern T0* ge134ov3942;
extern T0* ge153ov3942;
extern T0* ge150ov3942;
extern T0* ge155ov3942;
extern T0* ge130ov3942;
extern T0* ge271ov3942;
extern T0* ge276ov3942;
extern T0* ge266ov3942;
extern T0* ge133ov3942;
extern T0* ge146ov3942;
extern T0* ge132ov3942;
extern T0* ge265ov3942;
extern void GE_const_init(void);
extern EIF_TYPE GE_types[];

#ifdef __cplusplus
}
#endif


/*
	description:

		"C functions used to implement class FILE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
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

extern void file_mkdir(char* dirname);
extern void file_rename(char* from, char* to);
extern void file_link(char *from, char *to);
extern void file_unlink(char *name);
extern EIF_POINTER file_open(char *name, int how);
extern EIF_POINTER file_dopen(int fd, int how);
extern EIF_POINTER file_reopen(char *name, int how, FILE *old);
extern void file_close(FILE *fp);
extern void file_flush(FILE *fp);
extern EIF_INTEGER file_fd(FILE *f);
extern EIF_CHARACTER file_gc(FILE *f);
extern EIF_INTEGER file_gs(FILE *f, char *s, EIF_INTEGER bound, EIF_INTEGER start);
extern EIF_INTEGER file_gss(FILE *f, char *s, EIF_INTEGER bound);
extern EIF_INTEGER file_gw(FILE *f, char *s, EIF_INTEGER bound, EIF_INTEGER start);
extern EIF_CHARACTER file_lh(FILE *f);
extern EIF_INTEGER eif_file_size(FILE *fp);
extern void file_tnil(FILE *f);
extern EIF_INTEGER file_tell(FILE *f);
extern void file_touch(char *name);
extern void file_utime(char *name, time_t stamp, int how);
extern void file_stat(char *path, struct stat *buf);
extern void file_perm(char *name, char *who, char *what, int flag);
extern void file_chmod(char *path, int mode);
extern void file_chown(char *name, int uid);
extern void file_chgrp(char *name, int gid);
extern void file_tnwl(FILE *f);
extern void file_append(FILE *f, FILE *other, EIF_INTEGER l);
extern void file_ps(FILE *f, char *str, EIF_INTEGER len);
extern void file_pc(FILE *f, char c);
extern void file_go(FILE *f, EIF_INTEGER pos);
extern void file_recede(FILE *f, EIF_INTEGER pos);
extern void file_move(FILE *f, EIF_INTEGER pos);
extern EIF_BOOLEAN file_feof(FILE *fp);
extern EIF_BOOLEAN file_exists(char *name);
extern EIF_BOOLEAN file_path_exists(char *name);
extern EIF_BOOLEAN file_access(char *name, EIF_INTEGER op);
extern EIF_BOOLEAN file_creatable(char *path, EIF_INTEGER length);
extern EIF_INTEGER file_gi(FILE *f);
extern EIF_REAL_32 file_gr(FILE *f);
extern EIF_REAL_64 file_gd(FILE *f);
extern void file_pi(FILE *f, EIF_INTEGER number);
extern void file_pr(FILE *f, EIF_REAL_32 number);
extern void file_pd(FILE *f, EIF_REAL_64 val);
extern EIF_INTEGER stat_size(void);
extern EIF_BOOLEAN file_eaccess(struct stat *buf, int op);
extern EIF_INTEGER file_info(struct stat *buf, int op);
extern EIF_REFERENCE file_owner(int uid);
extern EIF_REFERENCE file_group(int gid);
extern EIF_INTEGER file_gib(FILE* f);
extern EIF_REAL_32 file_grb(FILE* f);
extern EIF_REAL_64 file_gdb(FILE* f);
extern EIF_POINTER file_binary_open(char* name, int how);
extern EIF_POINTER file_binary_dopen(int fd, int how);
extern EIF_POINTER file_binary_reopen(char* name, int how, FILE* old);
extern void file_pib(FILE* f, EIF_INTEGER number);
extern void file_prb(FILE* f, EIF_REAL_32 number);
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

		"C functions used to implement class EXCEPTIONS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_EXCEPT_H
#define EIF_EXCEPT_H

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
