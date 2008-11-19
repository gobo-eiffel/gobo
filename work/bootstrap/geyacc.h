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

/* GEYACC */
typedef struct S21 T21;

/* PR_FSM */
typedef struct S22 T22;

/* PR_PARSER_GENERATOR */
typedef struct S23 T23;

/* KL_TEXT_OUTPUT_FILE */
typedef struct S24 T24;

/* UT_CANNOT_WRITE_TO_FILE_ERROR */
typedef struct S25 T25;

/* KL_ARGUMENTS */
typedef struct S27 T27;

/* UT_ERROR_HANDLER */
typedef struct S28 T28;

/* PR_GRAMMAR */
typedef struct S29 T29;

/* PR_XML_DOC_GENERATOR */
typedef struct S30 T30;

/* PR_HTML_DOC_GENERATOR */
typedef struct S31 T31;

/* KL_EXCEPTIONS */
typedef struct S34 T34;

/* KL_STANDARD_FILES */
typedef struct S35 T35;

/* KL_STDOUT_FILE */
typedef struct S36 T36;

/* KL_EQUALITY_TESTER [PR_RULE] */
typedef struct S37 T37;

/* KL_EQUALITY_TESTER [PR_TOKEN] */
typedef struct S38 T38;

/* KL_EQUALITY_TESTER [PR_VARIABLE] */
typedef struct S39 T39;

/* KL_EQUALITY_TESTER [PR_TYPE] */
typedef struct S40 T40;

/* KL_EQUALITY_TESTER [INTEGER_32] */
typedef struct S41 T41;

/* KL_EQUALITY_TESTER [STRING_8] */
typedef struct S42 T42;

/* KL_EQUALITY_TESTER [PR_TRANSITION] */
typedef struct S43 T43;

/* KL_EQUALITY_TESTER [PR_REDUCTION] */
typedef struct S44 T44;

/* KL_EQUALITY_TESTER [PR_STATE] */
typedef struct S45 T45;

/* KL_EQUALITY_TESTER [PR_PORTION] */
typedef struct S46 T46;

/* KL_EQUALITY_TESTER [PR_CONFLICT] */
typedef struct S47 T47;

/* KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_VARIABLE]] */
typedef struct S48 T48;

/* KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_STATE]] */
typedef struct S49 T49;

/* PR_YACC_PARSER */
typedef struct S50 T50;

/* KL_TEXT_INPUT_FILE */
typedef struct S51 T51;

/* UT_CANNOT_READ_FILE_ERROR */
typedef struct S52 T52;

/* KL_STDIN_FILE */
typedef struct S54 T54;

/* UT_VERSION_NUMBER */
typedef struct S55 T55;

/* UT_USAGE_MESSAGE */
typedef struct S56 T56;

/* DS_ARRAYED_LIST [PR_STATE] */
typedef struct S57 T57;

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32] */
typedef struct S58 T58;

/* PR_STATE */
typedef struct S59 T59;

/* UT_MESSAGE */
typedef struct S62 T62;

/* DS_LINKED_LIST [PR_CONFLICT] */
typedef struct S63 T63;

/* PR_CONFLICT */
typedef struct S65 T65;

/* KL_INTEGER_ROUTINES */
typedef struct S67 T67;

/* DS_ARRAYED_LIST [PR_POSITION] */
typedef struct S68 T68;

/* PR_POSITION */
typedef struct S69 T69;

/* PR_ERROR_ACTION */
typedef struct S70 T70;

/* DS_ARRAYED_LIST [PR_RULE] */
typedef struct S71 T71;

/* KL_ANY_ROUTINES */
typedef struct S72 T72;

/* PR_RULE */
typedef struct S73 T73;

/* PR_VARIABLE */
typedef struct S74 T74;

/* DS_LINKED_LIST [PR_REDUCTION] */
typedef struct S75 T75;

/* DS_LINKED_LIST [PR_TRANSITION] */
typedef struct S77 T77;

/* DS_NESTED_LIST_FLATTENER [PR_TOKEN] */
typedef struct S79 T79;

/* DS_LINKED_LIST [PR_TOKEN] */
typedef struct S80 T80;

/* DS_ARRAYED_LIST [PR_SYMBOL] */
typedef struct S81 T81;

/* DS_ARRAYED_STACK [PR_STATE] */
typedef struct S82 T82;

/* PR_TRANSITION */
typedef struct S83 T83;

/* PR_TOKEN */
typedef struct S85 T85;

/* DS_ARRAYED_LIST [PR_REDUCTION] */
typedef struct S86 T86;

/* DS_LINKED_LIST_CURSOR [PR_TRANSITION] */
typedef struct S88 T88;

/* DS_LINKED_LIST_CURSOR [PR_REDUCTION] */
typedef struct S90 T90;

/* PR_REDUCTION */
typedef struct S91 T91;

/* DS_ARRAYED_LIST [PR_VARIABLE] */
typedef struct S92 T92;

/* DS_NESTED_LIST_FLATTENER [PR_RULE] */
typedef struct S93 T93;

/* DS_LINKED_LIST [PR_VARIABLE] */
typedef struct S94 T94;

/* DS_LINKED_LIST [PR_RULE] */
typedef struct S95 T95;

/* SPECIAL [PR_STATE] */
typedef struct S97 T97;

/* ARRAY [PR_STATE] */
typedef struct S98 T98;

/* DS_ARRAYED_LIST [PR_TOKEN] */
typedef struct S99 T99;

/* PR_TYPE */
typedef struct S100 T100;

/* DS_LINKED_LIST_CURSOR [PR_RULE] */
typedef struct S101 T101;

/* SPECIAL [INTEGER_32] */
typedef struct S102 T102;

/* ARRAY [INTEGER_32] */
typedef struct S103 T103;

/* DS_ARRAYED_LIST [PR_PORTION] */
typedef struct S104 T104;

/* DS_ARRAYED_LIST [INTEGER_32] */
typedef struct S105 T105;

/* PR_PORTION */
typedef struct S106 T106;

/* DS_BUBBLE_SORTER [PR_PORTION] */
typedef struct S108 T108;

/* KL_ARRAY_ROUTINES [INTEGER_32] */
typedef struct S110 T110;

/* UT_STRING_FORMATTER */
typedef struct S111 T111;

/* DS_ARRAYED_LIST [STRING_8] */
typedef struct S112 T112;

/* DS_ARRAYED_LIST [PR_TYPE] */
typedef struct S113 T113;

/* DS_HASH_SET [PR_TYPE] */
typedef struct S114 T114;

/* DS_HASH_SET_CURSOR [PR_TYPE] */
typedef struct S115 T115;

/* SPECIAL [PR_TRANSITION] */
typedef struct S117 T117;

/* ARRAY [PR_TRANSITION] */
typedef struct S118 T118;

/* KL_STRING_ROUTINES */
typedef struct S119 T119;

/* UT_ARRAY_FORMATTER */
typedef struct S120 T120;

/* TYPED_POINTER [ANY] */
typedef struct S122 T122;

/* SPECIAL [STRING_8] */
typedef struct S123 T123;

/* ARRAY [STRING_8] */
typedef struct S124 T124;

/* KL_STDERR_FILE */
typedef struct S125 T125;

/* PR_ACTION_FACTORY */
typedef struct S126 T126;

/* DS_HASH_TABLE [PR_TOKEN, STRING_8] */
typedef struct S127 T127;

/* DS_HASH_TABLE [PR_VARIABLE, STRING_8] */
typedef struct S128 T128;

/* DS_HASH_TABLE [PR_TYPE, STRING_8] */
typedef struct S129 T129;

/* YY_FILE_BUFFER */
typedef struct S130 T130;

/* YY_BUFFER */
typedef struct S131 T131;

/* KL_SPECIAL_ROUTINES [INTEGER_32] */
typedef struct S132 T132;

/* SPECIAL [ANY] */
typedef struct S134 T134;

/* KL_SPECIAL_ROUTINES [ANY] */
typedef struct S135 T135;

/* KL_SPECIAL_ROUTINES [STRING_8] */
typedef struct S136 T136;

/* DS_PAIR [STRING_8, INTEGER_32] */
typedef struct S137 T137;

/* SPECIAL [PR_TYPE] */
typedef struct S138 T138;

/* KL_SPECIAL_ROUTINES [PR_TYPE] */
typedef struct S139 T139;

/* SPECIAL [DS_ARRAYED_LIST [PR_TYPE]] */
typedef struct S140 T140;

/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_TYPE]] */
typedef struct S141 T141;

/* SPECIAL [PR_TOKEN] */
typedef struct S142 T142;

/* KL_SPECIAL_ROUTINES [PR_TOKEN] */
typedef struct S143 T143;

/* DS_ARRAYED_LIST [PR_ERROR_ACTION] */
typedef struct S144 T144;

/* UT_SYNTAX_ERROR */
typedef struct S145 T145;

/* ARRAY [PR_TOKEN] */
typedef struct S146 T146;

/* PR_MULTIPLE_START_DECLARATIONS_ERROR */
typedef struct S147 T147;

/* PR_NO_RULES_ERROR */
typedef struct S148 T148;

/* PR_LHS_SYMBOL_TOKEN_ERROR */
typedef struct S149 T149;

/* PR_RULE_DECLARED_TWICE_ERROR */
typedef struct S150 T150;

/* PR_INVALID_ERROR_N_ERROR */
typedef struct S151 T151;

/* PR_PREC_SPECIFIED_TWICE_ERROR */
typedef struct S152 T152;

/* PR_PREC_NOT_TOKEN_ERROR */
typedef struct S153 T153;

/* PR_MISSING_CHARACTERS_ERROR */
typedef struct S154 T154;

/* PR_NULL_INTEGER_ERROR */
typedef struct S155 T155;

/* PR_INVALID_STRING_TOKEN_ERROR */
typedef struct S156 T156;

/* PR_INVALID_DOLLAR_DOLLAR_ERROR */
typedef struct S157 T157;

/* PR_INTEGER_TOO_LARGE_ERROR */
typedef struct S158 T158;

/* PR_START_SYMBOL_TOKEN_ERROR */
typedef struct S159 T159;

/* PR_UNKNOWN_START_SYMBOL_ERROR */
typedef struct S160 T160;

/* PR_TOKEN_ID_USED_TWICE_ERROR */
typedef struct S161 T161;

/* PR_UNDEFINED_SYMBOL_ERROR */
typedef struct S162 T162;

/* PR_TWO_TOKEN_IDS_TOKEN_ERROR */
typedef struct S163 T163;

/* PR_TWO_STRINGS_TOKEN_ERROR */
typedef struct S164 T164;

/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR */
typedef struct S165 T165;

/* PR_DANGEROUS_DOLLAR_N_ERROR */
typedef struct S166 T166;

/* PR_INVALID_DOLLAR_N_ERROR */
typedef struct S167 T167;

/* KL_COMPARABLE_COMPARATOR [PR_PORTION] */
typedef struct S169 T169;

/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]] */
typedef struct S172 T172;

/* PR_BASIC_TYPE */
typedef struct S173 T173;

/* PR_ACTION */
typedef struct S174 T174;

/* PR_SYMBOL_DECLARED_VARIABLE_ERROR */
typedef struct S175 T175;

/* PR_TOKEN_DECLARED_TWICE_ERROR */
typedef struct S176 T176;

/* PR_SYMBOL_DECLARED_TOKEN_ERROR */
typedef struct S177 T177;

/* PR_VARIABLE_DECLARED_TWICE_ERROR */
typedef struct S178 T178;

/* PR_UNDEFINED_STRING_TOKEN_ERROR */
typedef struct S179 T179;

/* PR_PRECEDENCE_DEFINED_TWICE_ERROR */
typedef struct S180 T180;

/* UNIX_FILE_INFO */
typedef struct S181 T181;

/* KL_SPECIAL_ROUTINES [PR_STATE] */
typedef struct S182 T182;

/* DS_ARRAYED_LIST_CURSOR [PR_STATE] */
typedef struct S183 T183;

/* SPECIAL [DS_ARRAYED_LIST [PR_STATE]] */
typedef struct S184 T184;

/* DS_SPARSE_TABLE_KEYS [DS_ARRAYED_LIST [PR_STATE], INTEGER_32] */
typedef struct S185 T185;

/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_STATE]] */
typedef struct S187 T187;

/* DS_HASH_TABLE_CURSOR [DS_ARRAYED_LIST [PR_STATE], INTEGER_32] */
typedef struct S188 T188;

/* DS_BUBBLE_SORTER [PR_POSITION] */
typedef struct S189 T189;

/* SPECIAL [PR_POSITION] */
typedef struct S191 T191;

/* KL_EQUALITY_TESTER [PR_POSITION] */
typedef struct S192 T192;

/* KL_SPECIAL_ROUTINES [PR_POSITION] */
typedef struct S193 T193;

/* DS_ARRAYED_LIST_CURSOR [PR_POSITION] */
typedef struct S194 T194;

/* SPECIAL [PR_RULE] */
typedef struct S195 T195;

/* KL_SPECIAL_ROUTINES [PR_RULE] */
typedef struct S196 T196;

/* DS_ARRAYED_LIST_CURSOR [PR_RULE] */
typedef struct S197 T197;

/* DS_LINKABLE [PR_REDUCTION] */
typedef struct S199 T199;

/* DS_LINKABLE [PR_TRANSITION] */
typedef struct S200 T200;

/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]] */
typedef struct S202 T202;

/* SPECIAL [PR_SYMBOL] */
typedef struct S207 T207;

/* KL_SPECIAL_ROUTINES [PR_SYMBOL] */
typedef struct S208 T208;

/* DS_ARRAYED_LIST_CURSOR [PR_SYMBOL] */
typedef struct S209 T209;

/* KL_SPECIAL_ROUTINES [PR_REDUCTION] */
typedef struct S210 T210;

/* SPECIAL [PR_REDUCTION] */
typedef struct S211 T211;

/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION] */
typedef struct S212 T212;

/* SPECIAL [PR_VARIABLE] */
typedef struct S213 T213;

/* KL_SPECIAL_ROUTINES [PR_VARIABLE] */
typedef struct S214 T214;

/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE] */
typedef struct S215 T215;

/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]] */
typedef struct S218 T218;

/* DS_LINKED_LIST_CURSOR [PR_VARIABLE] */
typedef struct S223 T223;

/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN] */
typedef struct S224 T224;

/* DS_LINKABLE [PR_RULE] */
typedef struct S225 T225;

/* SPECIAL [PR_PORTION] */
typedef struct S226 T226;

/* KL_SPECIAL_ROUTINES [PR_PORTION] */
typedef struct S227 T227;

/* DS_ARRAYED_LIST_CURSOR [PR_PORTION] */
typedef struct S228 T228;

/* DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
typedef struct S230 T230;

/* UT_INTEGER_FORMATTER */
typedef struct S231 T231;

/* DS_ARRAYED_LIST_CURSOR [STRING_8] */
typedef struct S232 T232;

/* DS_ARRAYED_LIST_CURSOR [PR_TYPE] */
typedef struct S233 T233;

/* DS_SPARSE_TABLE_KEYS [PR_TOKEN, STRING_8] */
typedef struct S235 T235;

/* DS_HASH_TABLE_CURSOR [PR_TOKEN, STRING_8] */
typedef struct S237 T237;

/* DS_SPARSE_TABLE_KEYS [PR_VARIABLE, STRING_8] */
typedef struct S238 T238;

/* DS_HASH_TABLE_CURSOR [PR_VARIABLE, STRING_8] */
typedef struct S240 T240;

/* DS_SPARSE_TABLE_KEYS [PR_TYPE, STRING_8] */
typedef struct S241 T241;

/* DS_HASH_TABLE_CURSOR [PR_TYPE, STRING_8] */
typedef struct S243 T243;

/* TO_SPECIAL [INTEGER_32] */
typedef struct S244 T244;

/* TO_SPECIAL [ANY] */
typedef struct S245 T245;

/* TO_SPECIAL [STRING_8] */
typedef struct S246 T246;

/* TO_SPECIAL [PR_TYPE] */
typedef struct S247 T247;

/* TO_SPECIAL [DS_ARRAYED_LIST [PR_TYPE]] */
typedef struct S248 T248;

/* TO_SPECIAL [PR_TOKEN] */
typedef struct S249 T249;

/* KL_SPECIAL_ROUTINES [PR_ERROR_ACTION] */
typedef struct S250 T250;

/* SPECIAL [PR_ERROR_ACTION] */
typedef struct S251 T251;

/* DS_ARRAYED_LIST_CURSOR [PR_ERROR_ACTION] */
typedef struct S252 T252;

/* SPECIAL [NATURAL_8] */
typedef struct S253 T253;

/* STRING_TO_INTEGER_CONVERTOR */
typedef struct S255 T255;

/* KL_COMPARABLE_COMPARATOR [PR_POSITION] */
typedef struct S258 T258;

/* DS_LINKABLE [PR_TOKEN] */
typedef struct S262 T262;

/* DS_LINKED_LIST_CURSOR [PR_TOKEN] */
typedef struct S263 T263;

/* KL_CHARACTER_BUFFER */
typedef struct S267 T267;

/* SPECIAL [DS_ARRAYED_LIST [PR_VARIABLE]] */
typedef struct S268 T268;

/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_VARIABLE]] */
typedef struct S269 T269;

/* DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [PR_VARIABLE]] */
typedef struct S270 T270;

/* TYPED_POINTER [SPECIAL [CHARACTER_8]] */
typedef struct S271 T271;

/* TO_SPECIAL [PR_STATE] */
typedef struct S272 T272;

/* DS_SPARSE_TABLE_KEYS_CURSOR [DS_ARRAYED_LIST [PR_STATE], INTEGER_32] */
typedef struct S273 T273;

/* TO_SPECIAL [DS_ARRAYED_LIST [PR_STATE]] */
typedef struct S274 T274;

/* TO_SPECIAL [PR_POSITION] */
typedef struct S275 T275;

/* TO_SPECIAL [PR_RULE] */
typedef struct S276 T276;

/* SPECIAL [DS_NESTED_LIST [PR_TOKEN]] */
typedef struct S277 T277;

/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_TOKEN]] */
typedef struct S278 T278;

/* TO_SPECIAL [PR_SYMBOL] */
typedef struct S279 T279;

/* TO_SPECIAL [PR_REDUCTION] */
typedef struct S280 T280;

/* TO_SPECIAL [PR_VARIABLE] */
typedef struct S281 T281;

/* SPECIAL [DS_NESTED_LIST [PR_RULE]] */
typedef struct S282 T282;

/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_RULE]] */
typedef struct S283 T283;

/* TO_SPECIAL [PR_PORTION] */
typedef struct S284 T284;

/* DS_SPARSE_TABLE_KEYS_CURSOR [PR_TOKEN, STRING_8] */
typedef struct S285 T285;

/* DS_SPARSE_TABLE_KEYS_CURSOR [PR_VARIABLE, STRING_8] */
typedef struct S286 T286;

/* DS_SPARSE_TABLE_KEYS_CURSOR [PR_TYPE, STRING_8] */
typedef struct S287 T287;

/* TO_SPECIAL [PR_ERROR_ACTION] */
typedef struct S288 T288;

/* KL_CHARACTER_ROUTINES */
typedef struct S289 T289;

/* INTEGER_OVERFLOW_CHECKER */
typedef struct S290 T290;

/* KL_OPERATING_SYSTEM */
typedef struct S291 T291;

/* TO_SPECIAL [DS_ARRAYED_LIST [PR_VARIABLE]] */
typedef struct S292 T292;

/* TO_SPECIAL [DS_NESTED_LIST [PR_TOKEN]] */
typedef struct S294 T294;

/* TO_SPECIAL [DS_NESTED_LIST [PR_RULE]] */
typedef struct S295 T295;

/* DS_LINKED_LIST_CURSOR [PR_CONFLICT] */
typedef struct S299 T299;

/* DS_LINKABLE [PR_CONFLICT] */
typedef struct S300 T300;

/* DS_HASH_TABLE [INTEGER_32, PR_TYPE] */
typedef struct S301 T301;

/* DS_HASH_TABLE_CURSOR [INTEGER_32, PR_TYPE] */
typedef struct S302 T302;

/* DS_LINKABLE [PR_VARIABLE] */
typedef struct S305 T305;

/* SPECIAL [NATURAL_64] */
typedef struct S306 T306;

/* PLATFORM */
typedef struct S307 T307;

/* DS_SPARSE_TABLE_KEYS [INTEGER_32, PR_TYPE] */
typedef struct S308 T308;

/* DS_SPARSE_TABLE_KEYS_CURSOR [INTEGER_32, PR_TYPE] */
typedef struct S310 T310;

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
struct S122 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type TYPED_POINTER [SPECIAL [CHARACTER_8]] */
struct S271 {
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

/* Struct for type GEYACC */
struct S21 {
	int id;
	T0* a1; /* error_handler */
	T1 a2; /* old_typing */
	T1 a3; /* line_pragma */
	T0* a4; /* grammar */
	T0* a5; /* doc_format */
	T0* a6; /* output_filename */
	T0* a7; /* verbose_filename */
	T0* a8; /* input_filename */
	T0* a9; /* token_classname */
	T0* a10; /* token_filename */
	T1 a11; /* actions_separated */
};

/* Struct for type PR_FSM */
struct S22 {
	int id;
	T0* a1; /* grammar */
	T0* a2; /* states */
	T0* a3; /* cached_states */
};

/* Struct for type PR_PARSER_GENERATOR */
struct S23 {
	int id;
	T0* a1; /* machine */
	T6 a2; /* yyFinal */
	T6 a3; /* yyFlag */
	T6 a4; /* array_size */
	T1 a5; /* line_pragma */
	T0* a6; /* input_filename */
	T1 a7; /* old_typing */
	T6 a8; /* yyNtbase */
	T6 a9; /* yyNsyms */
	T6 a10; /* yyMax_token */
	T0* a11; /* yytranslate */
	T0* a12; /* yyr1 */
	T0* a13; /* yytypes1 */
	T0* a14; /* yytypes2 */
	T0* a15; /* yydefact */
	T0* a16; /* yydefgoto */
	T0* a17; /* yypact */
	T0* a18; /* yypgoto */
	T0* a19; /* yytable */
	T0* a20; /* yycheck */
	T6 a21; /* yyLast */
};

/* Struct for type KL_TEXT_OUTPUT_FILE */
struct S24 {
	int id;
	T6 a1; /* mode */
	T0* a2; /* name */
	T0* a3; /* string_name */
	T14 a4; /* file_pointer */
	T1 a5; /* descriptor_available */
};

/* Struct for type UT_CANNOT_WRITE_TO_FILE_ERROR */
struct S25 {
	int id;
	T0* a1; /* parameters */
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

/* Struct for type PR_GRAMMAR */
struct S29 {
	int id;
	T0* a1; /* rules */
	T6 a2; /* expected_conflicts */
	T0* a3; /* start_symbol */
	T0* a4; /* variables */
	T0* a5; /* tokens */
	T0* a6; /* eiffel_header */
	T0* a7; /* types */
	T0* a8; /* eiffel_code */
};

/* Struct for type PR_XML_DOC_GENERATOR */
struct S30 {
	int id;
	T0* a1; /* grammar */
	T1 a2; /* lhs_shared */
};

/* Struct for type PR_HTML_DOC_GENERATOR */
struct S31 {
	int id;
	T0* a1; /* grammar */
	T1 a2; /* lhs_shared */
};

/* Struct for type KL_EXCEPTIONS */
struct S34 {
	int id;
};

/* Struct for type KL_STANDARD_FILES */
struct S35 {
	int id;
};

/* Struct for type KL_STDOUT_FILE */
struct S36 {
	int id;
	T14 a1; /* file_pointer */
	T0* a2; /* name */
	T6 a3; /* mode */
};

/* Struct for type KL_EQUALITY_TESTER [PR_RULE] */
struct S37 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [PR_TOKEN] */
struct S38 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [PR_VARIABLE] */
struct S39 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [PR_TYPE] */
struct S40 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [INTEGER_32] */
struct S41 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [STRING_8] */
struct S42 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [PR_TRANSITION] */
struct S43 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [PR_REDUCTION] */
struct S44 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [PR_STATE] */
struct S45 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [PR_PORTION] */
struct S46 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [PR_CONFLICT] */
struct S47 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_VARIABLE]] */
struct S48 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_STATE]] */
struct S49 {
	int id;
};

/* Struct for type PR_YACC_PARSER */
struct S50 {
	int id;
	T1 a1; /* successful */
	T0* a2; /* last_grammar */
	T0* a3; /* action_factory */
	T0* a4; /* terminal_symbols */
	T0* a5; /* nonterminal_symbols */
	T0* a6; /* types */
	T1 a7; /* old_typing */
	T0* a8; /* error_handler */
	T0* a9; /* action_buffer */
	T6 a10; /* line_nb */
	T0* a11; /* yyss */
	T0* a12; /* input_buffer */
	T6 a13; /* yy_end */
	T6 a14; /* yy_position */
	T6 a15; /* yy_line */
	T6 a16; /* yy_column */
	T6 a17; /* yy_parsing_status */
	T6 a18; /* yy_suspended_yystacksize */
	T6 a19; /* yy_suspended_yystate */
	T6 a20; /* yy_suspended_yyn */
	T6 a21; /* yy_suspended_yychar1 */
	T6 a22; /* yy_suspended_index */
	T6 a23; /* yy_suspended_yyss_top */
	T6 a24; /* yy_suspended_yy_goto */
	T0* a25; /* yyr1 */
	T6 a26; /* yyssp */
	T0* a27; /* yypgoto */
	T0* a28; /* yycheck */
	T0* a29; /* yytable */
	T0* a30; /* yydefgoto */
	T6 a31; /* error_count */
	T1 a32; /* yy_lookahead_needed */
	T6 a33; /* yyerrstatus */
	T0* a34; /* yypact */
	T6 a35; /* last_token */
	T0* a36; /* yytranslate */
	T0* a37; /* yydefact */
	T0* a38; /* yytypes1 */
	T0* a39; /* yytypes2 */
	T6 a40; /* yy_start */
	T6 a41; /* yyvsp1 */
	T6 a42; /* yyvsp2 */
	T6 a43; /* yyvsp3 */
	T6 a44; /* yyvsp4 */
	T6 a45; /* yyvsp5 */
	T6 a46; /* yyvsp6 */
	T1 a47; /* yy_more_flag */
	T6 a48; /* yy_more_len */
	T6 a49; /* line */
	T6 a50; /* column */
	T6 a51; /* position */
	T6 a52; /* yy_start_state */
	T0* a53; /* yy_state_stack */
	T6 a54; /* yy_state_count */
	T0* a55; /* yy_ec */
	T0* a56; /* yy_content_area */
	T0* a57; /* yy_content */
	T0* a58; /* yy_accept */
	T6 a59; /* yy_last_accepting_state */
	T6 a60; /* yy_last_accepting_cpos */
	T0* a61; /* yy_chk */
	T0* a62; /* yy_base */
	T0* a63; /* yy_def */
	T0* a64; /* yy_meta */
	T0* a65; /* yy_nxt */
	T6 a66; /* yy_lp */
	T0* a67; /* yy_acclist */
	T6 a68; /* yy_looking_for_trail_begin */
	T6 a69; /* yy_full_match */
	T6 a70; /* yy_full_state */
	T6 a71; /* yy_full_lp */
	T1 a72; /* yy_rejected */
	T6 a73; /* yyvsc1 */
	T0* a74; /* yyvs1 */
	T0* a75; /* yyspecial_routines1 */
	T0* a76; /* last_any_value */
	T6 a77; /* yyvsc2 */
	T0* a78; /* yyvs2 */
	T0* a79; /* yyspecial_routines2 */
	T0* a80; /* last_string_value */
	T6 a81; /* yyvsc3 */
	T0* a82; /* yyvs3 */
	T0* a83; /* yyspecial_routines3 */
	T6 a84; /* last_integer_value */
	T6 a85; /* precedence */
	T0* a86; /* type */
	T0* a87; /* start_symbol */
	T0* a88; /* yyvs5 */
	T6 a89; /* yyvsc5 */
	T0* a90; /* yyspecial_routines5 */
	T0* a91; /* yyvs6 */
	T6 a92; /* yyvsc6 */
	T0* a93; /* yyspecial_routines6 */
	T6 a94; /* yyvsc4 */
	T0* a95; /* yyvs4 */
	T0* a96; /* yyspecial_routines4 */
	T0* a97; /* rule */
	T0* a98; /* precedence_token */
	T6 a99; /* last_error */
	T6 a100; /* nb_open_brackets */
};

/* Struct for type KL_TEXT_INPUT_FILE */
struct S51 {
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
struct S52 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type KL_STDIN_FILE */
struct S54 {
	int id;
	T1 a1; /* end_of_file */
	T14 a2; /* file_pointer */
	T0* a3; /* name */
	T6 a4; /* mode */
	T2 a5; /* last_character */
	T0* a6; /* character_buffer */
};

/* Struct for type UT_VERSION_NUMBER */
struct S55 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type UT_USAGE_MESSAGE */
struct S56 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type DS_ARRAYED_LIST [PR_STATE] */
struct S57 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T0* a5; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32] */
struct S58 {
	int id;
	T6 a1; /* capacity */
	T6 a2; /* found_position */
	T0* a3; /* item_storage */
	T0* a4; /* key_equality_tester */
	T6 a5; /* modulus */
	T6 a6; /* last_position */
	T6 a7; /* position */
	T6 a8; /* free_slot */
	T6 a9; /* count */
	T0* a10; /* equality_tester */
	T0* a11; /* internal_keys */
	T0* a12; /* slots */
	T0* a13; /* clashes */
	T0* a14; /* special_item_routines */
	T0* a15; /* key_storage */
	T0* a16; /* special_key_routines */
	T6 a17; /* slots_position */
	T6 a18; /* clashes_previous_position */
	T0* a19; /* internal_cursor */
	T0* a20; /* hash_function */
};

/* Struct for type PR_STATE */
struct S59 {
	int id;
	T0* a1; /* shifts */
	T6 a2; /* hash_code */
	T0* a3; /* positions */
	T6 a4; /* id */
	T0* a5; /* accessing_symbol */
	T0* a6; /* reductions */
	T0* a7; /* errors */
	T1 a8; /* lookahead_needed */
	T1 a9; /* has_conflict */
	T0* a10; /* error_action */
};

/* Struct for type UT_MESSAGE */
struct S62 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type DS_LINKED_LIST [PR_CONFLICT] */
struct S63 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type PR_CONFLICT */
struct S65 {
	int id;
	T0* a1; /* state */
	T0* a2; /* rule */
	T0* a3; /* token */
	T0* a4; /* resolution */
};

/* Struct for type KL_INTEGER_ROUTINES */
struct S67 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST [PR_POSITION] */
struct S68 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* equality_tester */
	T6 a4; /* capacity */
	T0* a5; /* special_routines */
	T0* a6; /* internal_cursor */
};

/* Struct for type PR_POSITION */
struct S69 {
	int id;
	T6 a1; /* index */
	T0* a2; /* rule */
};

/* Struct for type PR_ERROR_ACTION */
struct S70 {
	int id;
	T0* a1; /* action */
	T6 a2; /* line_nb */
};

/* Struct for type DS_ARRAYED_LIST [PR_RULE] */
struct S71 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* special_routines */
	T0* a5; /* internal_cursor */
	T0* a6; /* equality_tester */
};

/* Struct for type KL_ANY_ROUTINES */
struct S72 {
	int id;
};

/* Struct for type PR_RULE */
struct S73 {
	int id;
	T0* a1; /* rhs */
	T0* a2; /* lhs */
	T0* a3; /* error_actions */
	T0* a4; /* action */
	T6 a5; /* line_nb */
	T6 a6; /* id */
	T6 a7; /* associativity */
	T6 a8; /* precedence */
	T1 a9; /* is_useful */
};

/* Struct for type PR_VARIABLE */
struct S74 {
	int id;
	T0* a1; /* rules */
	T0* a2; /* derives */
	T1 a3; /* is_useful */
	T0* a4; /* type */
	T6 a5; /* id */
	T0* a6; /* name */
	T0* a7; /* transitions */
	T0* a8; /* firsts */
	T1 a9; /* is_nullable */
	T6 a10; /* index */
};

/* Struct for type DS_LINKED_LIST [PR_REDUCTION] */
struct S75 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_LINKED_LIST [PR_TRANSITION] */
struct S77 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_NESTED_LIST_FLATTENER [PR_TOKEN] */
struct S79 {
	int id;
};

/* Struct for type DS_LINKED_LIST [PR_TOKEN] */
struct S80 {
	int id;
	T0* a1; /* first_cell */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
	T0* a4; /* last_cell */
	T6 a5; /* count */
};

/* Struct for type DS_ARRAYED_LIST [PR_SYMBOL] */
struct S81 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* special_routines */
	T0* a5; /* internal_cursor */
	T0* a6; /* equality_tester */
};

/* Struct for type DS_ARRAYED_STACK [PR_STATE] */
struct S82 {
	int id;
	T0* a1; /* storage */
	T6 a2; /* count */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type PR_TRANSITION */
struct S83 {
	int id;
	T0* a1; /* following_tokens */
	T0* a2; /* target */
	T0* a3; /* included_tokens */
	T0* a4; /* source */
	T6 a5; /* index */
};

/* Struct for type PR_TOKEN */
struct S85 {
	int id;
	T6 a1; /* token_id */
	T0* a2; /* name */
	T0* a3; /* literal_string */
	T1 a4; /* is_declared */
	T6 a5; /* precedence */
	T6 a6; /* id */
	T0* a7; /* type */
	T6 a8; /* associativity */
	T1 a9; /* is_useful */
};

/* Struct for type DS_ARRAYED_LIST [PR_REDUCTION] */
struct S86 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T6 a5; /* count */
};

/* Struct for type DS_LINKED_LIST_CURSOR [PR_TRANSITION] */
struct S88 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_LINKED_LIST_CURSOR [PR_REDUCTION] */
struct S90 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type PR_REDUCTION */
struct S91 {
	int id;
	T0* a1; /* rule */
	T0* a2; /* lookaheads */
	T0* a3; /* transitions */
};

/* Struct for type DS_ARRAYED_LIST [PR_VARIABLE] */
struct S92 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type DS_NESTED_LIST_FLATTENER [PR_RULE] */
struct S93 {
	int id;
};

/* Struct for type DS_LINKED_LIST [PR_VARIABLE] */
struct S94 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_LINKED_LIST [PR_RULE] */
struct S95 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* equality_tester */
	T0* a4; /* last_cell */
	T6 a5; /* count */
};

/* Struct for type SPECIAL [PR_STATE] */
struct S97 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [PR_STATE] */
struct S98 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_ARRAYED_LIST [PR_TOKEN] */
struct S99 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
	T0* a6; /* equality_tester */
};

/* Struct for type PR_TYPE */
struct S100 {
	int id;
	T0* a1; /* name */
	T6 a2; /* id */
	T1 a3; /* is_used */
};

/* Struct for type DS_LINKED_LIST_CURSOR [PR_RULE] */
struct S101 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type SPECIAL [INTEGER_32] */
struct S102 {
	int id;
	T6 z1; /* count */
	T6 z2[1]; /* item */
};

/* Struct for type ARRAY [INTEGER_32] */
struct S103 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_ARRAYED_LIST [PR_PORTION] */
struct S104 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST [INTEGER_32] */
struct S105 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T6 a5; /* count */
};

/* Struct for type PR_PORTION */
struct S106 {
	int id;
	T6 a1; /* id */
	T0* a2; /* froms */
	T0* a3; /* tos */
	T6 a4; /* count */
	T6 a5; /* width */
	T1 a6; /* is_state */
	T6 a7; /* position */
};

/* Struct for type DS_BUBBLE_SORTER [PR_PORTION] */
struct S108 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type KL_ARRAY_ROUTINES [INTEGER_32] */
struct S110 {
	int id;
};

/* Struct for type UT_STRING_FORMATTER */
struct S111 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST [STRING_8] */
struct S112 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST [PR_TYPE] */
struct S113 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type DS_HASH_SET [PR_TYPE] */
struct S114 {
	int id;
	T6 a1; /* count */
	T0* a2; /* clashes */
	T0* a3; /* item_storage */
	T6 a4; /* capacity */
	T6 a5; /* modulus */
	T6 a6; /* last_position */
	T6 a7; /* free_slot */
	T6 a8; /* position */
	T0* a9; /* internal_cursor */
	T6 a10; /* slots_position */
	T0* a11; /* special_item_routines */
	T0* a12; /* slots */
	T6 a13; /* found_position */
	T6 a14; /* clashes_previous_position */
	T0* a15; /* equality_tester */
	T0* a16; /* hash_function */
};

/* Struct for type DS_HASH_SET_CURSOR [PR_TYPE] */
struct S115 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type SPECIAL [PR_TRANSITION] */
struct S117 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [PR_TRANSITION] */
struct S118 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type KL_STRING_ROUTINES */
struct S119 {
	int id;
};

/* Struct for type UT_ARRAY_FORMATTER */
struct S120 {
	int id;
};

/* Struct for type SPECIAL [STRING_8] */
struct S123 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [STRING_8] */
struct S124 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type KL_STDERR_FILE */
struct S125 {
	int id;
	T14 a1; /* file_pointer */
	T0* a2; /* name */
	T6 a3; /* mode */
};

/* Struct for type PR_ACTION_FACTORY */
struct S126 {
	int id;
};

/* Struct for type DS_HASH_TABLE [PR_TOKEN, STRING_8] */
struct S127 {
	int id;
	T6 a1; /* position */
	T6 a2; /* found_position */
	T0* a3; /* item_storage */
	T0* a4; /* key_equality_tester */
	T6 a5; /* count */
	T6 a6; /* capacity */
	T6 a7; /* slots_position */
	T6 a8; /* free_slot */
	T6 a9; /* last_position */
	T6 a10; /* modulus */
	T6 a11; /* clashes_previous_position */
	T0* a12; /* equality_tester */
	T0* a13; /* internal_keys */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* key_storage */
	T0* a17; /* internal_cursor */
	T0* a18; /* special_item_routines */
	T0* a19; /* special_key_routines */
	T0* a20; /* hash_function */
};

/* Struct for type DS_HASH_TABLE [PR_VARIABLE, STRING_8] */
struct S128 {
	int id;
	T6 a1; /* count */
	T6 a2; /* found_position */
	T6 a3; /* position */
	T0* a4; /* item_storage */
	T0* a5; /* key_equality_tester */
	T6 a6; /* capacity */
	T6 a7; /* slots_position */
	T6 a8; /* free_slot */
	T6 a9; /* last_position */
	T6 a10; /* modulus */
	T6 a11; /* clashes_previous_position */
	T0* a12; /* equality_tester */
	T0* a13; /* internal_keys */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* key_storage */
	T0* a17; /* internal_cursor */
	T0* a18; /* special_item_routines */
	T0* a19; /* special_key_routines */
	T0* a20; /* hash_function */
};

/* Struct for type DS_HASH_TABLE [PR_TYPE, STRING_8] */
struct S129 {
	int id;
	T6 a1; /* found_position */
	T0* a2; /* item_storage */
	T0* a3; /* key_equality_tester */
	T6 a4; /* position */
	T6 a5; /* count */
	T6 a6; /* capacity */
	T6 a7; /* free_slot */
	T6 a8; /* last_position */
	T0* a9; /* equality_tester */
	T0* a10; /* internal_keys */
	T6 a11; /* modulus */
	T6 a12; /* slots_position */
	T6 a13; /* clashes_previous_position */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* key_storage */
	T0* a17; /* internal_cursor */
	T0* a18; /* special_item_routines */
	T0* a19; /* special_key_routines */
	T0* a20; /* hash_function */
};

/* Struct for type YY_FILE_BUFFER */
struct S130 {
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
struct S131 {
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

/* Struct for type KL_SPECIAL_ROUTINES [INTEGER_32] */
struct S132 {
	int id;
};

/* Struct for type SPECIAL [ANY] */
struct S134 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ANY] */
struct S135 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [STRING_8] */
struct S136 {
	int id;
};

/* Struct for type DS_PAIR [STRING_8, INTEGER_32] */
struct S137 {
	int id;
	T0* a1; /* first */
	T6 a2; /* second */
};

/* Struct for type SPECIAL [PR_TYPE] */
struct S138 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [PR_TYPE] */
struct S139 {
	int id;
};

/* Struct for type SPECIAL [DS_ARRAYED_LIST [PR_TYPE]] */
struct S140 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_TYPE]] */
struct S141 {
	int id;
};

/* Struct for type SPECIAL [PR_TOKEN] */
struct S142 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [PR_TOKEN] */
struct S143 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST [PR_ERROR_ACTION] */
struct S144 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* a3; /* special_routines */
	T0* a4; /* storage */
	T0* a5; /* internal_cursor */
};

/* Struct for type UT_SYNTAX_ERROR */
struct S145 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type ARRAY [PR_TOKEN] */
struct S146 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type PR_MULTIPLE_START_DECLARATIONS_ERROR */
struct S147 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_NO_RULES_ERROR */
struct S148 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_LHS_SYMBOL_TOKEN_ERROR */
struct S149 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_RULE_DECLARED_TWICE_ERROR */
struct S150 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_INVALID_ERROR_N_ERROR */
struct S151 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_PREC_SPECIFIED_TWICE_ERROR */
struct S152 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_PREC_NOT_TOKEN_ERROR */
struct S153 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_MISSING_CHARACTERS_ERROR */
struct S154 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_NULL_INTEGER_ERROR */
struct S155 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_INVALID_STRING_TOKEN_ERROR */
struct S156 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_INVALID_DOLLAR_DOLLAR_ERROR */
struct S157 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_INTEGER_TOO_LARGE_ERROR */
struct S158 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_START_SYMBOL_TOKEN_ERROR */
struct S159 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_UNKNOWN_START_SYMBOL_ERROR */
struct S160 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_TOKEN_ID_USED_TWICE_ERROR */
struct S161 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_UNDEFINED_SYMBOL_ERROR */
struct S162 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_TWO_TOKEN_IDS_TOKEN_ERROR */
struct S163 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_TWO_STRINGS_TOKEN_ERROR */
struct S164 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_STRING_TOKEN_DEFINED_TWICE_ERROR */
struct S165 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_DANGEROUS_DOLLAR_N_ERROR */
struct S166 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_INVALID_DOLLAR_N_ERROR */
struct S167 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type KL_COMPARABLE_COMPARATOR [PR_PORTION] */
struct S169 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]] */
struct S172 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type PR_BASIC_TYPE */
struct S173 {
	int id;
	T6 a1; /* id */
	T0* a2; /* name */
	T1 a3; /* is_used */
};

/* Struct for type PR_ACTION */
struct S174 {
	int id;
	T0* a1; /* text */
};

/* Struct for type PR_SYMBOL_DECLARED_VARIABLE_ERROR */
struct S175 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_TOKEN_DECLARED_TWICE_ERROR */
struct S176 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_SYMBOL_DECLARED_TOKEN_ERROR */
struct S177 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_VARIABLE_DECLARED_TWICE_ERROR */
struct S178 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_UNDEFINED_STRING_TOKEN_ERROR */
struct S179 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type PR_PRECEDENCE_DEFINED_TWICE_ERROR */
struct S180 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type UNIX_FILE_INFO */
struct S181 {
	int id;
	T0* a1; /* buffered_file_info */
	T0* a2; /* file_name */
};

/* Struct for type KL_SPECIAL_ROUTINES [PR_STATE] */
struct S182 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [PR_STATE] */
struct S183 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [DS_ARRAYED_LIST [PR_STATE]] */
struct S184 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [DS_ARRAYED_LIST [PR_STATE], INTEGER_32] */
struct S185 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_STATE]] */
struct S187 {
	int id;
};

/* Struct for type DS_HASH_TABLE_CURSOR [DS_ARRAYED_LIST [PR_STATE], INTEGER_32] */
struct S188 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_BUBBLE_SORTER [PR_POSITION] */
struct S189 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type SPECIAL [PR_POSITION] */
struct S191 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_EQUALITY_TESTER [PR_POSITION] */
struct S192 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [PR_POSITION] */
struct S193 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [PR_POSITION] */
struct S194 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type SPECIAL [PR_RULE] */
struct S195 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [PR_RULE] */
struct S196 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [PR_RULE] */
struct S197 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type DS_LINKABLE [PR_REDUCTION] */
struct S199 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_LINKABLE [PR_TRANSITION] */
struct S200 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]] */
struct S202 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type SPECIAL [PR_SYMBOL] */
struct S207 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [PR_SYMBOL] */
struct S208 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [PR_SYMBOL] */
struct S209 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [PR_REDUCTION] */
struct S210 {
	int id;
};

/* Struct for type SPECIAL [PR_REDUCTION] */
struct S211 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [PR_REDUCTION] */
struct S212 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type SPECIAL [PR_VARIABLE] */
struct S213 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [PR_VARIABLE] */
struct S214 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [PR_VARIABLE] */
struct S215 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]] */
struct S218 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type DS_LINKED_LIST_CURSOR [PR_VARIABLE] */
struct S223 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [PR_TOKEN] */
struct S224 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type DS_LINKABLE [PR_RULE] */
struct S225 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type SPECIAL [PR_PORTION] */
struct S226 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [PR_PORTION] */
struct S227 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [PR_PORTION] */
struct S228 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
struct S230 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type UT_INTEGER_FORMATTER */
struct S231 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [STRING_8] */
struct S232 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [PR_TYPE] */
struct S233 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [PR_TOKEN, STRING_8] */
struct S235 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [PR_TOKEN, STRING_8] */
struct S237 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [PR_VARIABLE, STRING_8] */
struct S238 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [PR_VARIABLE, STRING_8] */
struct S240 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [PR_TYPE, STRING_8] */
struct S241 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [PR_TYPE, STRING_8] */
struct S243 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type TO_SPECIAL [INTEGER_32] */
struct S244 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [ANY] */
struct S245 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [STRING_8] */
struct S246 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [PR_TYPE] */
struct S247 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [DS_ARRAYED_LIST [PR_TYPE]] */
struct S248 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [PR_TOKEN] */
struct S249 {
	int id;
	T0* a1; /* area */
};

/* Struct for type KL_SPECIAL_ROUTINES [PR_ERROR_ACTION] */
struct S250 {
	int id;
};

/* Struct for type SPECIAL [PR_ERROR_ACTION] */
struct S251 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [PR_ERROR_ACTION] */
struct S252 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type SPECIAL [NATURAL_8] */
struct S253 {
	int id;
	T6 z1; /* count */
	T8 z2[1]; /* item */
};

/* Struct for type STRING_TO_INTEGER_CONVERTOR */
struct S255 {
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

/* Struct for type KL_COMPARABLE_COMPARATOR [PR_POSITION] */
struct S258 {
	int id;
};

/* Struct for type DS_LINKABLE [PR_TOKEN] */
struct S262 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_LINKED_LIST_CURSOR [PR_TOKEN] */
struct S263 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type KL_CHARACTER_BUFFER */
struct S267 {
	int id;
	T0* a1; /* as_special */
	T0* a2; /* area */
};

/* Struct for type SPECIAL [DS_ARRAYED_LIST [PR_VARIABLE]] */
struct S268 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_VARIABLE]] */
struct S269 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [PR_VARIABLE]] */
struct S270 {
	int id;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T6 a3; /* position */
};

/* Struct for type TO_SPECIAL [PR_STATE] */
struct S272 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [DS_ARRAYED_LIST [PR_STATE], INTEGER_32] */
struct S273 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [DS_ARRAYED_LIST [PR_STATE]] */
struct S274 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [PR_POSITION] */
struct S275 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [PR_RULE] */
struct S276 {
	int id;
	T0* a1; /* area */
};

/* Struct for type SPECIAL [DS_NESTED_LIST [PR_TOKEN]] */
struct S277 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_TOKEN]] */
struct S278 {
	int id;
};

/* Struct for type TO_SPECIAL [PR_SYMBOL] */
struct S279 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [PR_REDUCTION] */
struct S280 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [PR_VARIABLE] */
struct S281 {
	int id;
	T0* a1; /* area */
};

/* Struct for type SPECIAL [DS_NESTED_LIST [PR_RULE]] */
struct S282 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_RULE]] */
struct S283 {
	int id;
};

/* Struct for type TO_SPECIAL [PR_PORTION] */
struct S284 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [PR_TOKEN, STRING_8] */
struct S285 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [PR_VARIABLE, STRING_8] */
struct S286 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [PR_TYPE, STRING_8] */
struct S287 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [PR_ERROR_ACTION] */
struct S288 {
	int id;
	T0* a1; /* area */
};

/* Struct for type KL_CHARACTER_ROUTINES */
struct S289 {
	int id;
};

/* Struct for type INTEGER_OVERFLOW_CHECKER */
struct S290 {
	int id;
	T0* a1; /* integer_overflow_state1 */
	T0* a2; /* integer_overflow_state2 */
	T0* a3; /* natural_overflow_state1 */
	T0* a4; /* natural_overflow_state2 */
};

/* Struct for type KL_OPERATING_SYSTEM */
struct S291 {
	int id;
};

/* Struct for type TO_SPECIAL [DS_ARRAYED_LIST [PR_VARIABLE]] */
struct S292 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [DS_NESTED_LIST [PR_TOKEN]] */
struct S294 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [DS_NESTED_LIST [PR_RULE]] */
struct S295 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_LINKED_LIST_CURSOR [PR_CONFLICT] */
struct S299 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_LINKABLE [PR_CONFLICT] */
struct S300 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_HASH_TABLE [INTEGER_32, PR_TYPE] */
struct S301 {
	int id;
	T6 a1; /* found_position */
	T6 a2; /* position */
	T0* a3; /* item_storage */
	T6 a4; /* free_slot */
	T6 a5; /* last_position */
	T6 a6; /* count */
	T6 a7; /* modulus */
	T6 a8; /* slots_position */
	T6 a9; /* clashes_previous_position */
	T0* a10; /* key_equality_tester */
	T0* a11; /* equality_tester */
	T0* a12; /* internal_keys */
	T0* a13; /* clashes */
	T0* a14; /* slots */
	T0* a15; /* key_storage */
	T6 a16; /* capacity */
	T0* a17; /* internal_cursor */
	T0* a18; /* special_item_routines */
	T0* a19; /* special_key_routines */
	T0* a20; /* hash_function */
};

/* Struct for type DS_HASH_TABLE_CURSOR [INTEGER_32, PR_TYPE] */
struct S302 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type DS_LINKABLE [PR_VARIABLE] */
struct S305 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type SPECIAL [NATURAL_64] */
struct S306 {
	int id;
	T6 z1; /* count */
	T11 z2[1]; /* item */
};

/* Struct for type PLATFORM */
struct S307 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [INTEGER_32, PR_TYPE] */
struct S308 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [INTEGER_32, PR_TYPE] */
struct S310 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
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
extern T29 GE_default29;
extern T30 GE_default30;
extern T31 GE_default31;
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
extern T62 GE_default62;
extern T63 GE_default63;
extern T65 GE_default65;
extern T67 GE_default67;
extern T68 GE_default68;
extern T69 GE_default69;
extern T70 GE_default70;
extern T71 GE_default71;
extern T72 GE_default72;
extern T73 GE_default73;
extern T74 GE_default74;
extern T75 GE_default75;
extern T77 GE_default77;
extern T79 GE_default79;
extern T80 GE_default80;
extern T81 GE_default81;
extern T82 GE_default82;
extern T83 GE_default83;
extern T85 GE_default85;
extern T86 GE_default86;
extern T88 GE_default88;
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
extern T105 GE_default105;
extern T106 GE_default106;
extern T108 GE_default108;
extern T110 GE_default110;
extern T111 GE_default111;
extern T112 GE_default112;
extern T113 GE_default113;
extern T114 GE_default114;
extern T115 GE_default115;
extern T117 GE_default117;
extern T118 GE_default118;
extern T119 GE_default119;
extern T120 GE_default120;
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
extern T169 GE_default169;
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
extern T187 GE_default187;
extern T188 GE_default188;
extern T189 GE_default189;
extern T191 GE_default191;
extern T192 GE_default192;
extern T193 GE_default193;
extern T194 GE_default194;
extern T195 GE_default195;
extern T196 GE_default196;
extern T197 GE_default197;
extern T199 GE_default199;
extern T200 GE_default200;
extern T202 GE_default202;
extern T207 GE_default207;
extern T208 GE_default208;
extern T209 GE_default209;
extern T210 GE_default210;
extern T211 GE_default211;
extern T212 GE_default212;
extern T213 GE_default213;
extern T214 GE_default214;
extern T215 GE_default215;
extern T218 GE_default218;
extern T223 GE_default223;
extern T224 GE_default224;
extern T225 GE_default225;
extern T226 GE_default226;
extern T227 GE_default227;
extern T228 GE_default228;
extern T230 GE_default230;
extern T231 GE_default231;
extern T232 GE_default232;
extern T233 GE_default233;
extern T235 GE_default235;
extern T237 GE_default237;
extern T238 GE_default238;
extern T240 GE_default240;
extern T241 GE_default241;
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
extern T255 GE_default255;
extern T258 GE_default258;
extern T262 GE_default262;
extern T263 GE_default263;
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
extern T294 GE_default294;
extern T295 GE_default295;
extern T299 GE_default299;
extern T300 GE_default300;
extern T301 GE_default301;
extern T302 GE_default302;
extern T305 GE_default305;
extern T306 GE_default306;
extern T307 GE_default307;
extern T308 GE_default308;
extern T310 GE_default310;

extern T0* GE_ms8(char* s, T6 c);
extern T0* GE_ms32(char* s, T6 c);
/* Call to ANY.same_type */
extern T1 T19x27T0(T0* C, T0* a1);
/* Call to ANY.is_equal */
extern T1 T19x28T0(T0* C, T0* a1);
/* Call to UT_ERROR.default_message */
extern T0* T33x2638(T0* C);
/* New instance of type SPECIAL [CHARACTER_8] */
extern T0* GE_new15(T6 a1, T1 initialize);
/* New instance of type STRING_8 */
extern T0* GE_new17(T1 initialize);
/* New instance of type GEYACC */
extern T0* GE_new21(T1 initialize);
/* New instance of type PR_FSM */
extern T0* GE_new22(T1 initialize);
/* New instance of type PR_PARSER_GENERATOR */
extern T0* GE_new23(T1 initialize);
/* New instance of type KL_TEXT_OUTPUT_FILE */
extern T0* GE_new24(T1 initialize);
/* New instance of type UT_CANNOT_WRITE_TO_FILE_ERROR */
extern T0* GE_new25(T1 initialize);
/* New instance of type KL_ARGUMENTS */
extern T0* GE_new27(T1 initialize);
/* New instance of type UT_ERROR_HANDLER */
extern T0* GE_new28(T1 initialize);
/* New instance of type PR_GRAMMAR */
extern T0* GE_new29(T1 initialize);
/* New instance of type PR_XML_DOC_GENERATOR */
extern T0* GE_new30(T1 initialize);
/* New instance of type PR_HTML_DOC_GENERATOR */
extern T0* GE_new31(T1 initialize);
/* New instance of type KL_EXCEPTIONS */
extern T0* GE_new34(T1 initialize);
/* New instance of type KL_STANDARD_FILES */
extern T0* GE_new35(T1 initialize);
/* New instance of type KL_STDOUT_FILE */
extern T0* GE_new36(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [PR_RULE] */
extern T0* GE_new37(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [PR_TOKEN] */
extern T0* GE_new38(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [PR_VARIABLE] */
extern T0* GE_new39(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [PR_TYPE] */
extern T0* GE_new40(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [INTEGER_32] */
extern T0* GE_new41(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [STRING_8] */
extern T0* GE_new42(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [PR_TRANSITION] */
extern T0* GE_new43(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [PR_REDUCTION] */
extern T0* GE_new44(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [PR_STATE] */
extern T0* GE_new45(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [PR_PORTION] */
extern T0* GE_new46(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [PR_CONFLICT] */
extern T0* GE_new47(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_VARIABLE]] */
extern T0* GE_new48(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_STATE]] */
extern T0* GE_new49(T1 initialize);
/* New instance of type PR_YACC_PARSER */
extern T0* GE_new50(T1 initialize);
/* New instance of type KL_TEXT_INPUT_FILE */
extern T0* GE_new51(T1 initialize);
/* New instance of type UT_CANNOT_READ_FILE_ERROR */
extern T0* GE_new52(T1 initialize);
/* New instance of type KL_STDIN_FILE */
extern T0* GE_new54(T1 initialize);
/* New instance of type UT_VERSION_NUMBER */
extern T0* GE_new55(T1 initialize);
/* New instance of type UT_USAGE_MESSAGE */
extern T0* GE_new56(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [PR_STATE] */
extern T0* GE_new57(T1 initialize);
/* New instance of type DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32] */
extern T0* GE_new58(T1 initialize);
/* New instance of type PR_STATE */
extern T0* GE_new59(T1 initialize);
/* New instance of type UT_MESSAGE */
extern T0* GE_new62(T1 initialize);
/* New instance of type DS_LINKED_LIST [PR_CONFLICT] */
extern T0* GE_new63(T1 initialize);
/* New instance of type PR_CONFLICT */
extern T0* GE_new65(T1 initialize);
/* New instance of type KL_INTEGER_ROUTINES */
extern T0* GE_new67(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [PR_POSITION] */
extern T0* GE_new68(T1 initialize);
/* New instance of type PR_POSITION */
extern T0* GE_new69(T1 initialize);
/* New instance of type PR_ERROR_ACTION */
extern T0* GE_new70(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [PR_RULE] */
extern T0* GE_new71(T1 initialize);
/* New instance of type KL_ANY_ROUTINES */
extern T0* GE_new72(T1 initialize);
/* New instance of type PR_RULE */
extern T0* GE_new73(T1 initialize);
/* New instance of type PR_VARIABLE */
extern T0* GE_new74(T1 initialize);
/* New instance of type DS_LINKED_LIST [PR_REDUCTION] */
extern T0* GE_new75(T1 initialize);
/* New instance of type DS_LINKED_LIST [PR_TRANSITION] */
extern T0* GE_new77(T1 initialize);
/* New instance of type DS_NESTED_LIST_FLATTENER [PR_TOKEN] */
extern T0* GE_new79(T1 initialize);
/* New instance of type DS_LINKED_LIST [PR_TOKEN] */
extern T0* GE_new80(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [PR_SYMBOL] */
extern T0* GE_new81(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [PR_STATE] */
extern T0* GE_new82(T1 initialize);
/* New instance of type PR_TRANSITION */
extern T0* GE_new83(T1 initialize);
/* New instance of type PR_TOKEN */
extern T0* GE_new85(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [PR_REDUCTION] */
extern T0* GE_new86(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [PR_TRANSITION] */
extern T0* GE_new88(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [PR_REDUCTION] */
extern T0* GE_new90(T1 initialize);
/* New instance of type PR_REDUCTION */
extern T0* GE_new91(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [PR_VARIABLE] */
extern T0* GE_new92(T1 initialize);
/* New instance of type DS_NESTED_LIST_FLATTENER [PR_RULE] */
extern T0* GE_new93(T1 initialize);
/* New instance of type DS_LINKED_LIST [PR_VARIABLE] */
extern T0* GE_new94(T1 initialize);
/* New instance of type DS_LINKED_LIST [PR_RULE] */
extern T0* GE_new95(T1 initialize);
/* New instance of type SPECIAL [PR_STATE] */
extern T0* GE_new97(T6 a1, T1 initialize);
/* New instance of type ARRAY [PR_STATE] */
extern T0* GE_new98(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [PR_TOKEN] */
extern T0* GE_new99(T1 initialize);
/* New instance of type PR_TYPE */
extern T0* GE_new100(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [PR_RULE] */
extern T0* GE_new101(T1 initialize);
/* New instance of type SPECIAL [INTEGER_32] */
extern T0* GE_new102(T6 a1, T1 initialize);
/* New instance of type ARRAY [INTEGER_32] */
extern T0* GE_new103(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [PR_PORTION] */
extern T0* GE_new104(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [INTEGER_32] */
extern T0* GE_new105(T1 initialize);
/* New instance of type PR_PORTION */
extern T0* GE_new106(T1 initialize);
/* New instance of type DS_BUBBLE_SORTER [PR_PORTION] */
extern T0* GE_new108(T1 initialize);
/* New instance of type KL_ARRAY_ROUTINES [INTEGER_32] */
extern T0* GE_new110(T1 initialize);
/* New instance of type UT_STRING_FORMATTER */
extern T0* GE_new111(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [STRING_8] */
extern T0* GE_new112(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [PR_TYPE] */
extern T0* GE_new113(T1 initialize);
/* New instance of type DS_HASH_SET [PR_TYPE] */
extern T0* GE_new114(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [PR_TYPE] */
extern T0* GE_new115(T1 initialize);
/* New instance of type SPECIAL [PR_TRANSITION] */
extern T0* GE_new117(T6 a1, T1 initialize);
/* New instance of type ARRAY [PR_TRANSITION] */
extern T0* GE_new118(T1 initialize);
/* New instance of type KL_STRING_ROUTINES */
extern T0* GE_new119(T1 initialize);
/* New instance of type UT_ARRAY_FORMATTER */
extern T0* GE_new120(T1 initialize);
/* New instance of type SPECIAL [STRING_8] */
extern T0* GE_new123(T6 a1, T1 initialize);
/* New instance of type ARRAY [STRING_8] */
extern T0* GE_new124(T1 initialize);
/* New instance of type KL_STDERR_FILE */
extern T0* GE_new125(T1 initialize);
/* New instance of type PR_ACTION_FACTORY */
extern T0* GE_new126(T1 initialize);
/* New instance of type DS_HASH_TABLE [PR_TOKEN, STRING_8] */
extern T0* GE_new127(T1 initialize);
/* New instance of type DS_HASH_TABLE [PR_VARIABLE, STRING_8] */
extern T0* GE_new128(T1 initialize);
/* New instance of type DS_HASH_TABLE [PR_TYPE, STRING_8] */
extern T0* GE_new129(T1 initialize);
/* New instance of type YY_FILE_BUFFER */
extern T0* GE_new130(T1 initialize);
/* New instance of type YY_BUFFER */
extern T0* GE_new131(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [INTEGER_32] */
extern T0* GE_new132(T1 initialize);
/* New instance of type SPECIAL [ANY] */
extern T0* GE_new134(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ANY] */
extern T0* GE_new135(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [STRING_8] */
extern T0* GE_new136(T1 initialize);
/* New instance of type DS_PAIR [STRING_8, INTEGER_32] */
extern T0* GE_new137(T1 initialize);
/* New instance of type SPECIAL [PR_TYPE] */
extern T0* GE_new138(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [PR_TYPE] */
extern T0* GE_new139(T1 initialize);
/* New instance of type SPECIAL [DS_ARRAYED_LIST [PR_TYPE]] */
extern T0* GE_new140(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_TYPE]] */
extern T0* GE_new141(T1 initialize);
/* New instance of type SPECIAL [PR_TOKEN] */
extern T0* GE_new142(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [PR_TOKEN] */
extern T0* GE_new143(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [PR_ERROR_ACTION] */
extern T0* GE_new144(T1 initialize);
/* New instance of type UT_SYNTAX_ERROR */
extern T0* GE_new145(T1 initialize);
/* New instance of type ARRAY [PR_TOKEN] */
extern T0* GE_new146(T1 initialize);
/* New instance of type PR_MULTIPLE_START_DECLARATIONS_ERROR */
extern T0* GE_new147(T1 initialize);
/* New instance of type PR_NO_RULES_ERROR */
extern T0* GE_new148(T1 initialize);
/* New instance of type PR_LHS_SYMBOL_TOKEN_ERROR */
extern T0* GE_new149(T1 initialize);
/* New instance of type PR_RULE_DECLARED_TWICE_ERROR */
extern T0* GE_new150(T1 initialize);
/* New instance of type PR_INVALID_ERROR_N_ERROR */
extern T0* GE_new151(T1 initialize);
/* New instance of type PR_PREC_SPECIFIED_TWICE_ERROR */
extern T0* GE_new152(T1 initialize);
/* New instance of type PR_PREC_NOT_TOKEN_ERROR */
extern T0* GE_new153(T1 initialize);
/* New instance of type PR_MISSING_CHARACTERS_ERROR */
extern T0* GE_new154(T1 initialize);
/* New instance of type PR_NULL_INTEGER_ERROR */
extern T0* GE_new155(T1 initialize);
/* New instance of type PR_INVALID_STRING_TOKEN_ERROR */
extern T0* GE_new156(T1 initialize);
/* New instance of type PR_INVALID_DOLLAR_DOLLAR_ERROR */
extern T0* GE_new157(T1 initialize);
/* New instance of type PR_INTEGER_TOO_LARGE_ERROR */
extern T0* GE_new158(T1 initialize);
/* New instance of type PR_START_SYMBOL_TOKEN_ERROR */
extern T0* GE_new159(T1 initialize);
/* New instance of type PR_UNKNOWN_START_SYMBOL_ERROR */
extern T0* GE_new160(T1 initialize);
/* New instance of type PR_TOKEN_ID_USED_TWICE_ERROR */
extern T0* GE_new161(T1 initialize);
/* New instance of type PR_UNDEFINED_SYMBOL_ERROR */
extern T0* GE_new162(T1 initialize);
/* New instance of type PR_TWO_TOKEN_IDS_TOKEN_ERROR */
extern T0* GE_new163(T1 initialize);
/* New instance of type PR_TWO_STRINGS_TOKEN_ERROR */
extern T0* GE_new164(T1 initialize);
/* New instance of type PR_STRING_TOKEN_DEFINED_TWICE_ERROR */
extern T0* GE_new165(T1 initialize);
/* New instance of type PR_DANGEROUS_DOLLAR_N_ERROR */
extern T0* GE_new166(T1 initialize);
/* New instance of type PR_INVALID_DOLLAR_N_ERROR */
extern T0* GE_new167(T1 initialize);
/* New instance of type KL_COMPARABLE_COMPARATOR [PR_PORTION] */
extern T0* GE_new169(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]] */
extern T0* GE_new172(T1 initialize);
/* New instance of type PR_BASIC_TYPE */
extern T0* GE_new173(T1 initialize);
/* New instance of type PR_ACTION */
extern T0* GE_new174(T1 initialize);
/* New instance of type PR_SYMBOL_DECLARED_VARIABLE_ERROR */
extern T0* GE_new175(T1 initialize);
/* New instance of type PR_TOKEN_DECLARED_TWICE_ERROR */
extern T0* GE_new176(T1 initialize);
/* New instance of type PR_SYMBOL_DECLARED_TOKEN_ERROR */
extern T0* GE_new177(T1 initialize);
/* New instance of type PR_VARIABLE_DECLARED_TWICE_ERROR */
extern T0* GE_new178(T1 initialize);
/* New instance of type PR_UNDEFINED_STRING_TOKEN_ERROR */
extern T0* GE_new179(T1 initialize);
/* New instance of type PR_PRECEDENCE_DEFINED_TWICE_ERROR */
extern T0* GE_new180(T1 initialize);
/* New instance of type UNIX_FILE_INFO */
extern T0* GE_new181(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [PR_STATE] */
extern T0* GE_new182(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [PR_STATE] */
extern T0* GE_new183(T1 initialize);
/* New instance of type SPECIAL [DS_ARRAYED_LIST [PR_STATE]] */
extern T0* GE_new184(T6 a1, T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [DS_ARRAYED_LIST [PR_STATE], INTEGER_32] */
extern T0* GE_new185(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_STATE]] */
extern T0* GE_new187(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [DS_ARRAYED_LIST [PR_STATE], INTEGER_32] */
extern T0* GE_new188(T1 initialize);
/* New instance of type DS_BUBBLE_SORTER [PR_POSITION] */
extern T0* GE_new189(T1 initialize);
/* New instance of type SPECIAL [PR_POSITION] */
extern T0* GE_new191(T6 a1, T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [PR_POSITION] */
extern T0* GE_new192(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [PR_POSITION] */
extern T0* GE_new193(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [PR_POSITION] */
extern T0* GE_new194(T1 initialize);
/* New instance of type SPECIAL [PR_RULE] */
extern T0* GE_new195(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [PR_RULE] */
extern T0* GE_new196(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [PR_RULE] */
extern T0* GE_new197(T1 initialize);
/* New instance of type DS_LINKABLE [PR_REDUCTION] */
extern T0* GE_new199(T1 initialize);
/* New instance of type DS_LINKABLE [PR_TRANSITION] */
extern T0* GE_new200(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]] */
extern T0* GE_new202(T1 initialize);
/* New instance of type SPECIAL [PR_SYMBOL] */
extern T0* GE_new207(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [PR_SYMBOL] */
extern T0* GE_new208(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [PR_SYMBOL] */
extern T0* GE_new209(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [PR_REDUCTION] */
extern T0* GE_new210(T1 initialize);
/* New instance of type SPECIAL [PR_REDUCTION] */
extern T0* GE_new211(T6 a1, T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [PR_REDUCTION] */
extern T0* GE_new212(T1 initialize);
/* New instance of type SPECIAL [PR_VARIABLE] */
extern T0* GE_new213(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [PR_VARIABLE] */
extern T0* GE_new214(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [PR_VARIABLE] */
extern T0* GE_new215(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]] */
extern T0* GE_new218(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [PR_VARIABLE] */
extern T0* GE_new223(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [PR_TOKEN] */
extern T0* GE_new224(T1 initialize);
/* New instance of type DS_LINKABLE [PR_RULE] */
extern T0* GE_new225(T1 initialize);
/* New instance of type SPECIAL [PR_PORTION] */
extern T0* GE_new226(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [PR_PORTION] */
extern T0* GE_new227(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [PR_PORTION] */
extern T0* GE_new228(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
extern T0* GE_new230(T1 initialize);
/* New instance of type UT_INTEGER_FORMATTER */
extern T0* GE_new231(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [STRING_8] */
extern T0* GE_new232(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [PR_TYPE] */
extern T0* GE_new233(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [PR_TOKEN, STRING_8] */
extern T0* GE_new235(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [PR_TOKEN, STRING_8] */
extern T0* GE_new237(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [PR_VARIABLE, STRING_8] */
extern T0* GE_new238(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [PR_VARIABLE, STRING_8] */
extern T0* GE_new240(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [PR_TYPE, STRING_8] */
extern T0* GE_new241(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [PR_TYPE, STRING_8] */
extern T0* GE_new243(T1 initialize);
/* New instance of type TO_SPECIAL [INTEGER_32] */
extern T0* GE_new244(T1 initialize);
/* New instance of type TO_SPECIAL [ANY] */
extern T0* GE_new245(T1 initialize);
/* New instance of type TO_SPECIAL [STRING_8] */
extern T0* GE_new246(T1 initialize);
/* New instance of type TO_SPECIAL [PR_TYPE] */
extern T0* GE_new247(T1 initialize);
/* New instance of type TO_SPECIAL [DS_ARRAYED_LIST [PR_TYPE]] */
extern T0* GE_new248(T1 initialize);
/* New instance of type TO_SPECIAL [PR_TOKEN] */
extern T0* GE_new249(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [PR_ERROR_ACTION] */
extern T0* GE_new250(T1 initialize);
/* New instance of type SPECIAL [PR_ERROR_ACTION] */
extern T0* GE_new251(T6 a1, T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [PR_ERROR_ACTION] */
extern T0* GE_new252(T1 initialize);
/* New instance of type SPECIAL [NATURAL_8] */
extern T0* GE_new253(T6 a1, T1 initialize);
/* New instance of type STRING_TO_INTEGER_CONVERTOR */
extern T0* GE_new255(T1 initialize);
/* New instance of type KL_COMPARABLE_COMPARATOR [PR_POSITION] */
extern T0* GE_new258(T1 initialize);
/* New instance of type DS_LINKABLE [PR_TOKEN] */
extern T0* GE_new262(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [PR_TOKEN] */
extern T0* GE_new263(T1 initialize);
/* New instance of type KL_CHARACTER_BUFFER */
extern T0* GE_new267(T1 initialize);
/* New instance of type SPECIAL [DS_ARRAYED_LIST [PR_VARIABLE]] */
extern T0* GE_new268(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_VARIABLE]] */
extern T0* GE_new269(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [PR_VARIABLE]] */
extern T0* GE_new270(T1 initialize);
/* New instance of type TO_SPECIAL [PR_STATE] */
extern T0* GE_new272(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [DS_ARRAYED_LIST [PR_STATE], INTEGER_32] */
extern T0* GE_new273(T1 initialize);
/* New instance of type TO_SPECIAL [DS_ARRAYED_LIST [PR_STATE]] */
extern T0* GE_new274(T1 initialize);
/* New instance of type TO_SPECIAL [PR_POSITION] */
extern T0* GE_new275(T1 initialize);
/* New instance of type TO_SPECIAL [PR_RULE] */
extern T0* GE_new276(T1 initialize);
/* New instance of type SPECIAL [DS_NESTED_LIST [PR_TOKEN]] */
extern T0* GE_new277(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_TOKEN]] */
extern T0* GE_new278(T1 initialize);
/* New instance of type TO_SPECIAL [PR_SYMBOL] */
extern T0* GE_new279(T1 initialize);
/* New instance of type TO_SPECIAL [PR_REDUCTION] */
extern T0* GE_new280(T1 initialize);
/* New instance of type TO_SPECIAL [PR_VARIABLE] */
extern T0* GE_new281(T1 initialize);
/* New instance of type SPECIAL [DS_NESTED_LIST [PR_RULE]] */
extern T0* GE_new282(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_RULE]] */
extern T0* GE_new283(T1 initialize);
/* New instance of type TO_SPECIAL [PR_PORTION] */
extern T0* GE_new284(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [PR_TOKEN, STRING_8] */
extern T0* GE_new285(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [PR_VARIABLE, STRING_8] */
extern T0* GE_new286(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [PR_TYPE, STRING_8] */
extern T0* GE_new287(T1 initialize);
/* New instance of type TO_SPECIAL [PR_ERROR_ACTION] */
extern T0* GE_new288(T1 initialize);
/* New instance of type KL_CHARACTER_ROUTINES */
extern T0* GE_new289(T1 initialize);
/* New instance of type INTEGER_OVERFLOW_CHECKER */
extern T0* GE_new290(T1 initialize);
/* New instance of type KL_OPERATING_SYSTEM */
extern T0* GE_new291(T1 initialize);
/* New instance of type TO_SPECIAL [DS_ARRAYED_LIST [PR_VARIABLE]] */
extern T0* GE_new292(T1 initialize);
/* New instance of type TO_SPECIAL [DS_NESTED_LIST [PR_TOKEN]] */
extern T0* GE_new294(T1 initialize);
/* New instance of type TO_SPECIAL [DS_NESTED_LIST [PR_RULE]] */
extern T0* GE_new295(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [PR_CONFLICT] */
extern T0* GE_new299(T1 initialize);
/* New instance of type DS_LINKABLE [PR_CONFLICT] */
extern T0* GE_new300(T1 initialize);
/* New instance of type DS_HASH_TABLE [INTEGER_32, PR_TYPE] */
extern T0* GE_new301(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [INTEGER_32, PR_TYPE] */
extern T0* GE_new302(T1 initialize);
/* New instance of type DS_LINKABLE [PR_VARIABLE] */
extern T0* GE_new305(T1 initialize);
/* New instance of type SPECIAL [NATURAL_64] */
extern T0* GE_new306(T6 a1, T1 initialize);
/* New instance of type PLATFORM */
extern T0* GE_new307(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [INTEGER_32, PR_TYPE] */
extern T0* GE_new308(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [INTEGER_32, PR_TYPE] */
extern T0* GE_new310(T1 initialize);
/* GEYACC.execute */
extern T0* T21c18(void);
/* PR_PARSER_GENERATOR.print_parser */
extern void T23f36(T0* C, T1 a1, T1 a2, T0* a3);
/* PR_PARSER_GENERATOR.print_eiffel_code */
extern void T23f59(T0* C, T0* a1);
/* PR_PARSER_GENERATOR.print_constants */
extern void T23f58(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_integer */
extern void T36f15(T0* C, T6 a1);
/* KL_STDOUT_FILE.put_character */
extern void T36f13(T0* C, T2 a1);
/* KL_STDOUT_FILE.old_put_character */
extern void T36f18(T0* C, T2 a1);
/* KL_STDOUT_FILE.console_pc */
extern void T36f22(T0* C, T14 a1, T2 a2);
/* KL_TEXT_OUTPUT_FILE.put_integer */
extern void T24f25(T0* C, T6 a1);
/* KL_TEXT_OUTPUT_FILE.put_character */
extern void T24f26(T0* C, T2 a1);
/* KL_TEXT_OUTPUT_FILE.old_put_character */
extern void T24f33(T0* C, T2 a1);
/* KL_TEXT_OUTPUT_FILE.file_pc */
extern void T24f36(T0* C, T14 a1, T2 a2);
/* PR_PARSER_GENERATOR.print_stack_declarations */
extern void T23f57(T0* C, T0* a1);
/* PR_BASIC_TYPE.print_yyvs_declaration */
extern void T173f14(T0* C, T6 a1, T0* a2);
/* KL_STDOUT_FILE.put_line */
extern void T36f11(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.put_line */
extern void T24f28(T0* C, T0* a1);
/* PR_BASIC_TYPE.print_indentation */
extern void T173f20(T0* C, T6 a1, T0* a2);
/* PR_TYPE.print_yyvs_declaration */
extern void T100f16(T0* C, T6 a1, T0* a2);
/* PR_TYPE.print_indentation */
extern void T100f22(T0* C, T6 a1, T0* a2);
/* DS_ARRAYED_LIST [PR_TYPE].item */
extern T0* T113f8(T0* C, T6 a1);
/* INTEGER_32.infix ">" */
extern T1 T6f1(T6* C, T6 a1);
/* PR_PARSER_GENERATOR.old_print_conversion_routines */
extern void T23f56(T0* C, T0* a1);
/* PR_BASIC_TYPE.old_print_conversion_routine */
extern void T173f13(T0* C, T0* a1);
/* PR_TYPE.old_print_conversion_routine */
extern void T100f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TYPE].is_empty */
extern T1 T113f6(T0* C);
/* PR_PARSER_GENERATOR.print_eiffel_tables */
extern void T23f55(T0* C, T0* a1);
/* PR_PARSER_GENERATOR.print_eiffel_array */
extern void T23f63(T0* C, T0* a1, T0* a2, T0* a3);
/* INTEGER_32.min */
extern T6 T6f9(T6* C, T6 a1);
/* INTEGER_32.infix "<=" */
extern T1 T6f12(T6* C, T6 a1);
/* UT_ARRAY_FORMATTER.put_integer_array */
extern void T120f8(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* INTEGER_32.out */
extern T0* T6f11(T6* C);
/* STRING_8.append_integer */
extern void T17f33(T0* C, T6 a1);
/* INTEGER_32.infix ">=" */
extern T1 T6f4(T6* C, T6 a1);
/* STRING_8.append_character */
extern void T17f32(T0* C, T2 a1);
/* STRING_8.resize */
extern void T17f39(T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].aliased_resized_area */
extern T0* T15f4(T0* C, T6 a1);
/* STRING_8.additional_space */
extern T6 T17f13(T0* C);
/* INTEGER_32.max */
extern T6 T6f16(T6* C, T6 a1);
/* STRING_8.capacity */
extern T6 T17f12(T0* C);
/* STRING_8.make */
extern T0* T17c29(T6 a1);
/* SPECIAL [CHARACTER_8].make */
extern T0* T15c11(T6 a1);
/* ARRAY [INTEGER_32].item */
extern T6 T103f4(T0* C, T6 a1);
/* PR_PARSER_GENERATOR.array_formatter_ */
extern unsigned char ge220os1873;
extern T0* ge220ov1873;
extern T0* T23f29(T0* C);
/* UT_ARRAY_FORMATTER.default_create */
extern T0* T120c7(void);
/* ARRAY [INTEGER_32].count */
extern T6 T103f5(T0* C);
/* KL_STRING_ROUTINES.same_string */
extern T1 T119f1(T0* C, T0* a1, T0* a2);
/* STRING_8.item_code */
extern T6 T17f17(T0* C, T6 a1);
/* KL_STRING_ROUTINES.elks_same_string */
extern T1 T119f8(T0* C, T0* a1, T0* a2);
/* STRING_8.same_string */
extern T1 T17f20(T0* C, T0* a1);
/* STRING_8.same_string_general */
extern T1 T17f25(T0* C, T0* a1);
/* STRING_8.code */
extern T10 T17f26(T0* C, T6 a1);
/* INTEGER_32.to_natural_32 */
extern T10 T6f17(T6* C);
/* SPECIAL [CHARACTER_8].same_items */
extern T1 T15f5(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* KL_ANY_ROUTINES.same_types */
extern T1 T72f2(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.any_ */
extern unsigned char ge264os1804;
extern T0* ge264ov1804;
extern T0* T119f6(T0* C);
/* KL_ANY_ROUTINES.default_create */
extern T0* T72c3(void);
/* STRING_8.substring */
extern T0* T17f11(T0* C, T6 a1, T6 a2);
/* STRING_8.set_count */
extern void T17f34(T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].copy_data */
extern void T15f10(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [CHARACTER_8].move_data */
extern void T15f13(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].overlapping_move */
extern void T15f15(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].non_overlapping_move */
extern void T15f14(T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.new_string */
extern T0* T17f7(T0* C, T6 a1);
/* PR_PARSER_GENERATOR.string_ */
extern unsigned char ge277os1780;
extern T0* ge277ov1780;
extern T0* T23f28(T0* C);
/* KL_STRING_ROUTINES.default_create */
extern T0* T119c11(void);
/* PR_PARSER_GENERATOR.print_error_actions */
extern void T23f54(T0* C, T0* a1);
/* PR_ACTION.out */
extern T0* T174f2(T0* C);
/* DS_ARRAYED_LIST [PR_STATE].item */
extern T0* T57f8(T0* C, T6 a1);
/* PR_PARSER_GENERATOR.print_separated_error_actions */
extern void T23f53(T0* C, T0* a1);
/* PR_PARSER_GENERATOR.print_actions */
extern void T23f52(T0* C, T0* a1);
/* PR_RULE.print_action */
extern void T73f26(T0* C, T0* a1, T1 a2, T0* a3);
/* PR_BASIC_TYPE.print_push_yyval */
extern void T173f19(T0* C, T6 a1, T0* a2);
/* PR_TYPE.print_push_yyval */
extern void T100f21(T0* C, T6 a1, T0* a2);
/* PR_BASIC_TYPE.print_resize_yyvs */
extern void T173f18(T0* C, T6 a1, T0* a2);
/* PR_BASIC_TYPE.print_create_yyvs */
extern void T173f21(T0* C, T6 a1, T0* a2);
/* PR_TYPE.print_resize_yyvs */
extern void T100f20(T0* C, T6 a1, T0* a2);
/* PR_TYPE.print_create_yyvs */
extern void T100f23(T0* C, T6 a1, T0* a2);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].item */
extern T6 T301f37(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].item_storage_item */
extern T6 T301f29(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].search_position */
extern void T301f46(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].clashes_item */
extern T6 T301f24(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].hash_position */
extern T6 T301f25(T0* C, T0* a1);
/* PR_BASIC_TYPE.hash_code */
extern T6 T173f4(T0* C);
/* PR_TYPE.hash_code */
extern T6 T100f5(T0* C);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].key_storage_item */
extern T0* T301f21(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].slots_item */
extern T6 T301f26(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [INTEGER_32, PR_TYPE].forth */
extern void T302f9(T0* C);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].cursor_forth */
extern void T301f59(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].add_traversing_cursor */
extern void T301f61(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [INTEGER_32, PR_TYPE].set_next_cursor */
extern void T302f11(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].remove_traversing_cursor */
extern void T301f60(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [INTEGER_32, PR_TYPE].set_position */
extern void T302f10(T0* C, T6 a1);
/* PR_BASIC_TYPE.print_increment_yyvsp */
extern void T173f17(T0* C, T6 a1, T6 a2, T0* a3);
/* PR_TYPE.print_increment_yyvsp */
extern void T100f19(T0* C, T6 a1, T6 a2, T0* a3);
/* DS_HASH_TABLE_CURSOR [INTEGER_32, PR_TYPE].key */
extern T0* T302f6(T0* C);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].cursor_key */
extern T0* T301f35(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [INTEGER_32, PR_TYPE].item */
extern T6 T302f5(T0* C);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].cursor_item */
extern T6 T301f34(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [INTEGER_32, PR_TYPE].after */
extern T1 T302f4(T0* C);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].cursor_after */
extern T1 T301f33(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [INTEGER_32, PR_TYPE].start */
extern void T302f8(T0* C);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].cursor_start */
extern void T301f58(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].cursor_off */
extern T1 T301f40(T0* C, T0* a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].is_empty */
extern T1 T301f39(T0* C);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].new_cursor */
extern T0* T301f31(T0* C);
/* DS_HASH_TABLE_CURSOR [INTEGER_32, PR_TYPE].make */
extern T0* T302c7(T0* a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].replace_found_item */
extern void T301f45(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].item_storage_put */
extern void T301f51(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].found_item */
extern T6 T301f30(T0* C);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].found */
extern T1 T301f22(T0* C);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].search */
extern void T301f44(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_SYMBOL].item */
extern T0* T81f12(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].put_new */
extern void T301f43(T0* C, T6 a1, T0* a2);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].key_storage_put */
extern void T301f52(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].slots_put */
extern void T301f50(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].clashes_put */
extern void T301f49(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].unset_found_item */
extern void T301f48(T0* C);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].make_map */
extern T0* T301c42(T6 a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].make_with_equality_testers */
extern void T301f47(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [INTEGER_32, PR_TYPE].make */
extern T0* T308c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [INTEGER_32, PR_TYPE].new_cursor */
extern T0* T308f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [INTEGER_32, PR_TYPE].make */
extern T0* T310c3(T0* a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].make_sparse_container */
extern void T301f53(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].make_slots */
extern void T301f57(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].make */
extern T0* T132f1(T0* C, T6 a1);
/* TO_SPECIAL [INTEGER_32].make_area */
extern T0* T244c2(T6 a1);
/* SPECIAL [INTEGER_32].make */
extern T0* T102c5(T6 a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].special_integer_ */
extern unsigned char ge275os3995;
extern T0* ge275ov3995;
extern T0* T301f32(T0* C);
/* KL_SPECIAL_ROUTINES [INTEGER_32].default_create */
extern T0* T132c4(void);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].new_modulus */
extern T6 T301f28(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].make_clashes */
extern void T301f56(T0* C, T6 a1);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].make_key_storage */
extern void T301f55(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_TYPE].make */
extern T0* T139f1(T0* C, T6 a1);
/* TO_SPECIAL [PR_TYPE].make_area */
extern T0* T247c2(T6 a1);
/* SPECIAL [PR_TYPE].make */
extern T0* T138c4(T6 a1);
/* KL_SPECIAL_ROUTINES [PR_TYPE].default_create */
extern T0* T139c3(void);
/* DS_HASH_TABLE [INTEGER_32, PR_TYPE].make_item_storage */
extern void T301f54(T0* C, T6 a1);
/* PR_RULE.old_print_action */
extern void T73f25(T0* C, T0* a1, T1 a2, T0* a3);
/* PR_BASIC_TYPE.old_print_dollar_dollar_finalization */
extern void T173f25(T0* C, T0* a1);
/* PR_TYPE.old_print_dollar_dollar_finalization */
extern void T100f27(T0* C, T0* a1);
/* PR_BASIC_TYPE.old_print_dollar_dollar_initialization */
extern void T173f24(T0* C, T0* a1);
/* PR_TYPE.old_print_dollar_dollar_initialization */
extern void T100f26(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [PR_TYPE].forth */
extern void T115f8(T0* C);
/* DS_HASH_SET [PR_TYPE].cursor_forth */
extern void T114f48(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].add_traversing_cursor */
extern void T114f50(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [PR_TYPE].set_next_cursor */
extern void T115f10(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].remove_traversing_cursor */
extern void T114f49(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [PR_TYPE].set_position */
extern void T115f9(T0* C, T6 a1);
/* DS_HASH_SET [PR_TYPE].clashes_item */
extern T6 T114f21(T0* C, T6 a1);
/* PR_BASIC_TYPE.print_dollar_dollar_declaration */
extern void T173f16(T0* C, T0* a1);
/* PR_TYPE.print_dollar_dollar_declaration */
extern void T100f18(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [PR_TYPE].item */
extern T0* T115f4(T0* C);
/* DS_HASH_SET [PR_TYPE].cursor_item */
extern T0* T114f30(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].item_storage_item */
extern T0* T114f25(T0* C, T6 a1);
/* DS_HASH_SET_CURSOR [PR_TYPE].after */
extern T1 T115f5(T0* C);
/* DS_HASH_SET [PR_TYPE].cursor_after */
extern T1 T114f29(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [PR_TYPE].start */
extern void T115f7(T0* C);
/* DS_HASH_SET [PR_TYPE].cursor_start */
extern void T114f47(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].cursor_off */
extern T1 T114f35(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].new_cursor */
extern T0* T114f17(T0* C);
/* DS_HASH_SET_CURSOR [PR_TYPE].make */
extern T0* T115c6(T0* a1);
/* DS_HASH_SET [PR_TYPE].is_empty */
extern T1 T114f19(T0* C);
/* DS_HASH_SET [PR_TYPE].put */
extern void T114f37(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].slots_put */
extern void T114f46(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [PR_TYPE].clashes_put */
extern void T114f45(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [PR_TYPE].slots_item */
extern T6 T114f20(T0* C, T6 a1);
/* DS_HASH_SET [PR_TYPE].item_storage_put */
extern void T114f44(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [PR_TYPE].search_position */
extern void T114f43(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].hash_position */
extern T6 T114f28(T0* C, T0* a1);
/* DS_HASH_SET [PR_TYPE].key_storage_item */
extern T0* T114f27(T0* C, T6 a1);
/* DS_HASH_SET [PR_TYPE].key_equality_tester */
extern T0* T114f26(T0* C);
/* DS_HASH_SET [PR_TYPE].unset_found_item */
extern void T114f42(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].item */
extern T0* T71f7(T0* C, T6 a1);
/* DS_HASH_SET [PR_TYPE].make */
extern T0* T114c36(T6 a1);
/* DS_HASH_SET [PR_TYPE].make_slots */
extern void T114f41(T0* C, T6 a1);
/* DS_HASH_SET [PR_TYPE].special_integer_ */
extern T0* T114f22(T0* C);
/* DS_HASH_SET [PR_TYPE].new_modulus */
extern T6 T114f23(T0* C, T6 a1);
/* DS_HASH_SET [PR_TYPE].make_clashes */
extern void T114f40(T0* C, T6 a1);
/* DS_HASH_SET [PR_TYPE].make_key_storage */
extern void T114f39(T0* C, T6 a1);
/* DS_HASH_SET [PR_TYPE].make_item_storage */
extern void T114f38(T0* C, T6 a1);
/* PR_PARSER_GENERATOR.print_separated_actions */
extern void T23f51(T0* C, T0* a1);
/* PR_PARSER_GENERATOR.print_pop_last_value */
extern void T23f50(T0* C, T0* a1);
/* PR_BASIC_TYPE.print_pop_last_value */
extern void T173f12(T0* C, T6 a1, T0* a2);
/* PR_TYPE.print_pop_last_value */
extern void T100f14(T0* C, T6 a1, T0* a2);
/* PR_PARSER_GENERATOR.print_push_error_value */
extern void T23f49(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].item */
extern T0* T99f10(T0* C, T6 a1);
/* PR_PARSER_GENERATOR.print_push_last_value */
extern void T23f48(T0* C, T0* a1);
/* PR_BASIC_TYPE.print_push_last_value */
extern void T173f15(T0* C, T6 a1, T0* a2);
/* PR_BASIC_TYPE.last_value_name */
extern T0* T173f5(T0* C);
/* KL_CHARACTER_ROUTINES.as_lower */
extern T2 T289f1(T0* C, T2 a1);
/* CHARACTER_8.lower */
extern T2 T2f3(T2* C);
/* CHARACTER_8.is_upper */
extern T1 T2f6(T2* C);
/* NATURAL_8.infix ">" */
extern T1 T8f2(T8* C, T8 a1);
/* NATURAL_8.infix "&" */
extern T8 T8f1(T8* C, T8 a1);
/* CHARACTER_8.character_types */
extern T8 T2f7(T2* C, T6 a1);
/* CHARACTER_8.internal_character_types */
extern unsigned char ge8os92;
extern T0* ge8ov92;
extern T0* T2f10(T2* C);
/* NATURAL_8.infix "|" */
extern T8 T8f3(T8* C, T8 a1);
/* SPECIAL [NATURAL_8].make */
extern T0* T253c2(T6 a1);
/* PR_BASIC_TYPE.character_ */
extern unsigned char ge267os3538;
extern T0* ge267ov3538;
extern T0* T173f6(T0* C);
/* KL_CHARACTER_ROUTINES.default_create */
extern T0* T289c2(void);
/* STRING_8.item */
extern T2 T17f14(T0* C, T6 a1);
/* STRING_8.append_string */
extern void T17f30(T0* C, T0* a1);
/* STRING_8.append */
extern void T17f38(T0* C, T0* a1);
/* PR_TYPE.print_push_last_value */
extern void T100f17(T0* C, T6 a1, T0* a2);
/* PR_TYPE.last_value_name */
extern T0* T100f6(T0* C);
/* PR_TYPE.character_ */
extern T0* T100f7(T0* C);
/* DS_HASH_SET [PR_TYPE].first */
extern T0* T114f33(T0* C);
/* PR_PARSER_GENERATOR.print_clear_value_stacks */
extern void T23f47(T0* C, T0* a1);
/* PR_BASIC_TYPE.print_clear_yyvs */
extern void T173f11(T0* C, T6 a1, T0* a2);
/* PR_TYPE.print_clear_yyvs */
extern void T100f13(T0* C, T6 a1, T0* a2);
/* PR_PARSER_GENERATOR.print_init_value_stacks */
extern void T23f46(T0* C, T0* a1);
/* PR_PARSER_GENERATOR.print_create_value_stacks */
extern void T23f45(T0* C, T0* a1);
/* PR_PARSER_GENERATOR.print_build_parser_tables */
extern void T23f44(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_string */
extern void T36f12(T0* C, T0* a1);
/* KL_STDOUT_FILE.old_put_string */
extern void T36f17(T0* C, T0* a1);
/* KL_STDOUT_FILE.console_ps */
extern void T36f21(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STRING_ROUTINES.as_string */
extern T0* T119f2(T0* C, T0* a1);
/* STRING_8.string */
extern T0* T17f18(T0* C);
/* STRING_8.make_from_string */
extern T0* T17c43(T0* a1);
/* SPECIAL [CHARACTER_8].twin */
extern T0* T15f3(T0* C);
/* KL_STDOUT_FILE.string_ */
extern T0* T36f6(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_string */
extern void T24f24(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_put_string */
extern void T24f32(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_ps */
extern void T24f35(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_TEXT_OUTPUT_FILE.string_ */
extern T0* T24f9(T0* C);
/* PR_PARSER_GENERATOR.print_token_codes */
extern void T23f42(T0* C, T0* a1);
/* UT_STRING_FORMATTER.put_eiffel_string */
extern void T111f3(T0* C, T0* a1, T0* a2);
/* UT_INTEGER_FORMATTER.put_decimal_integer */
extern void T231f2(T0* C, T0* a1, T6 a2);
/* UT_STRING_FORMATTER.integer_formatter_ */
extern unsigned char ge220os1869;
extern T0* ge220ov1869;
extern T0* T111f1(T0* C);
/* UT_INTEGER_FORMATTER.default_create */
extern T0* T231c1(void);
/* PR_PARSER_GENERATOR.string_formatter_ */
extern unsigned char ge220os1872;
extern T0* ge220ov1872;
extern T0* T23f27(T0* C);
/* UT_STRING_FORMATTER.default_create */
extern T0* T111c2(void);
/* PR_TOKEN.has_identifier */
extern T1 T85f15(T0* C);
/* PR_PARSER_GENERATOR.print_last_values */
extern void T23f62(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_new_line */
extern void T36f14(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_new_line */
extern void T24f27(T0* C);
/* PR_PARSER_GENERATOR.print_eiffel_header */
extern void T23f43(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].item */
extern T0* T112f6(T0* C, T6 a1);
/* PR_PARSER_GENERATOR.print_token_class */
extern void T23f35(T0* C, T0* a1, T0* a2, T0* a3);
/* PR_PARSER_GENERATOR.set_input_filename */
extern void T23f34(T0* C, T0* a1);
/* PR_PARSER_GENERATOR.set_line_pragma */
extern void T23f33(T0* C, T1 a1);
/* PR_PARSER_GENERATOR.set_old_typing */
extern void T23f32(T0* C, T1 a1);
/* PR_PARSER_GENERATOR.make */
extern T0* T23c31(T0* a1);
/* PR_PARSER_GENERATOR.build_action_tables */
extern void T23f41(T0* C);
/* KL_ARRAY_ROUTINES [INTEGER_32].subarray */
extern T0* T110f1(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* KL_ARRAY_ROUTINES [INTEGER_32].subcopy */
extern void T110f4(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* ARRAY [INTEGER_32].subcopy */
extern void T103f11(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER_32].copy_data */
extern void T102f8(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER_32].move_data */
extern void T102f6(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].overlapping_move */
extern void T102f11(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].non_overlapping_move */
extern void T102f10(T0* C, T6 a1, T6 a2, T6 a3);
/* PR_PORTION.set_position */
extern void T106f13(T0* C, T6 a1);
/* KL_ARRAY_ROUTINES [INTEGER_32].resize */
extern void T110f3(T0* C, T0* a1, T6 a2, T6 a3);
/* ARRAY [INTEGER_32].conservative_resize */
extern void T103f10(T0* C, T6 a1, T6 a2);
/* SPECIAL [INTEGER_32].fill_with_default */
extern void T102f7(T0* C, T6 a1, T6 a2);
/* SPECIAL [INTEGER_32].put_default */
extern void T102f12(T0* C, T6 a1);
/* SPECIAL [INTEGER_32].aliased_resized_area */
extern T0* T102f3(T0* C, T6 a1);
/* ARRAY [INTEGER_32].make_area */
extern void T103f9(T0* C, T6 a1);
/* ARRAY [INTEGER_32].empty_area */
extern T1 T103f6(T0* C);
/* PR_PARSER_GENERATOR.integer_array_ */
extern unsigned char ge265os1865;
extern T0* ge265ov1865;
extern T0* T23f26(T0* C);
/* KL_ARRAY_ROUTINES [INTEGER_32].default_create */
extern T0* T110c2(void);
/* DS_ARRAYED_LIST [INTEGER_32].item */
extern T6 T105f9(T0* C, T6 a1);
/* DS_ARRAYED_LIST [INTEGER_32].first */
extern T6 T105f8(T0* C);
/* PR_PORTION.same_portion */
extern T1 T106f8(T0* C, T0* a1);
/* PR_PORTION.order_is_equal */
extern T1 T106f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_PORTION].item */
extern T0* T104f6(T0* C, T6 a1);
/* ARRAY [INTEGER_32].put */
extern void T103f8(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [PR_PORTION].sort */
extern void T104f10(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [PR_PORTION].sort */
extern void T108f3(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [PR_PORTION].sort_with_comparator */
extern void T108f4(T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [PR_PORTION].subsort_with_comparator */
extern void T108f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* DS_ARRAYED_LIST [PR_PORTION].replace */
extern void T104f12(T0* C, T0* a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [PR_PORTION].less_than */
extern T1 T169f1(T0* C, T0* a1, T0* a2);
/* PR_PORTION.infix "<" */
extern T1 T106f10(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_PORTION].is_empty */
extern T1 T104f8(T0* C);
/* PR_PARSER_GENERATOR.portion_sorter */
extern unsigned char ge180os1846;
extern T0* ge180ov1846;
extern T0* T23f23(T0* C);
/* DS_BUBBLE_SORTER [PR_PORTION].make */
extern T0* T108c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [PR_PORTION].make */
extern T0* T169c2(void);
/* PR_PARSER_GENERATOR.put_yydefgoto */
extern void T23f61(T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_LIST [PR_PORTION].put_last */
extern void T104f11(T0* C, T0* a1);
/* PR_PORTION.make_symbol */
extern T0* T106c12(T6 a1, T0* a2, T0* a3);
/* DS_ARRAYED_LIST [INTEGER_32].last */
extern T6 T105f7(T0* C);
/* DS_ARRAYED_LIST [INTEGER_32].put_last */
extern void T105f11(T0* C, T6 a1);
/* ARRAY [PR_TRANSITION].item */
extern T0* T118f4(T0* C, T6 a1);
/* DS_ARRAYED_LIST [INTEGER_32].make */
extern T0* T105c10(T6 a1);
/* DS_ARRAYED_LIST [INTEGER_32].new_cursor */
extern T0* T105f6(T0* C);
/* DS_ARRAYED_LIST_CURSOR [INTEGER_32].make */
extern T0* T230c3(T0* a1);
/* ARRAY [PR_TRANSITION].put */
extern void T118f6(T0* C, T0* a1, T6 a2);
/* ARRAY [PR_TRANSITION].make */
extern T0* T118c5(T6 a1, T6 a2);
/* ARRAY [PR_TRANSITION].make_area */
extern void T118f7(T0* C, T6 a1);
/* SPECIAL [PR_TRANSITION].make */
extern T0* T117c2(T6 a1);
/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].forth */
extern void T88f9(T0* C);
/* DS_LINKED_LIST [PR_TRANSITION].cursor_forth */
extern void T77f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TRANSITION].add_traversing_cursor */
extern void T77f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].set_next_cursor */
extern void T88f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TRANSITION].remove_traversing_cursor */
extern void T77f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].set */
extern void T88f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].item */
extern T0* T88f6(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].start */
extern void T88f8(T0* C);
/* DS_LINKED_LIST [PR_TRANSITION].cursor_start */
extern void T77f10(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TRANSITION].cursor_off */
extern T1 T77f7(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TRANSITION].new_cursor */
extern T0* T77f6(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].make */
extern T0* T88c7(T0* a1);
/* DS_LINKED_LIST [PR_TRANSITION].is_empty */
extern T1 T77f5(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].item */
extern T0* T92f6(T0* C, T6 a1);
/* PR_PARSER_GENERATOR.put_yydefact */
extern void T23f60(T0* C, T0* a1, T0* a2);
/* PR_PORTION.make_state */
extern T0* T106c11(T6 a1, T0* a2, T0* a3);
/* DS_ARRAYED_LIST [PR_REDUCTION].first */
extern T0* T86f10(T0* C);
/* DS_ARRAYED_LIST [PR_REDUCTION].item */
extern T0* T86f9(T0* C, T6 a1);
/* ARRAY [INTEGER_32].make */
extern T0* T103c7(T6 a1, T6 a2);
/* DS_ARRAYED_LIST [PR_PORTION].make */
extern T0* T104c9(T6 a1);
/* DS_ARRAYED_LIST [PR_PORTION].new_cursor */
extern T0* T104f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_PORTION].make */
extern T0* T228c3(T0* a1);
/* KL_SPECIAL_ROUTINES [PR_PORTION].make */
extern T0* T227f1(T0* C, T6 a1);
/* TO_SPECIAL [PR_PORTION].make_area */
extern T0* T284c2(T6 a1);
/* SPECIAL [PR_PORTION].make */
extern T0* T226c2(T6 a1);
/* KL_SPECIAL_ROUTINES [PR_PORTION].default_create */
extern T0* T227c2(void);
/* PR_PARSER_GENERATOR.build_yytypes2 */
extern void T23f40(T0* C);
/* PR_PARSER_GENERATOR.build_yytypes1 */
extern void T23f39(T0* C);
/* PR_PARSER_GENERATOR.build_yyr1 */
extern void T23f38(T0* C);
/* PR_PARSER_GENERATOR.build_yytranslate */
extern void T23f37(T0* C);
/* DS_ARRAYED_LIST [PR_STATE].last */
extern T0* T57f6(T0* C);
/* PR_FSM.make */
extern T0* T22c11(T0* a1, T0* a2);
/* PR_FSM.set_error_actions */
extern void T22f17(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_warning */
extern void T28f9(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_warning_message */
extern void T28f12(T0* C, T0* a1);
/* KL_STDERR_FILE.put_line */
extern void T125f11(T0* C, T0* a1);
/* KL_STDERR_FILE.put_new_line */
extern void T125f15(T0* C);
/* KL_STDERR_FILE.put_string */
extern void T125f12(T0* C, T0* a1);
/* KL_STDERR_FILE.old_put_string */
extern void T125f16(T0* C, T0* a1);
/* KL_STDERR_FILE.console_ps */
extern void T125f20(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STDERR_FILE.string_ */
extern T0* T125f5(T0* C);
/* UT_ERROR_HANDLER.message */
extern T0* T28f5(T0* C, T0* a1);
/* UT_MESSAGE.make */
extern T0* T62c7(T0* a1);
/* ARRAY [STRING_8].put */
extern void T124f7(T0* C, T0* a1, T6 a2);
/* ARRAY [STRING_8].make */
extern T0* T124c6(T6 a1, T6 a2);
/* ARRAY [STRING_8].make_area */
extern void T124f8(T0* C, T6 a1);
/* SPECIAL [STRING_8].make */
extern T0* T123c4(T6 a1);
/* KL_INTEGER_ROUTINES.append_decimal_integer */
extern void T67f2(T0* C, T6 a1, T0* a2);
/* PR_FSM.integer_ */
extern unsigned char ge272os1803;
extern T0* ge272ov1803;
extern T0* T22f5(T0* C);
/* KL_INTEGER_ROUTINES.default_create */
extern T0* T67c1(void);
/* PR_STATE.set_error_action */
extern void T59f29(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_POSITION].put_last */
extern void T68f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].has */
extern T1 T71f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_POSITION].make */
extern T0* T68c12(T6 a1);
/* DS_ARRAYED_LIST [PR_POSITION].new_cursor */
extern T0* T68f10(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_POSITION].make */
extern T0* T194c3(T0* a1);
/* KL_SPECIAL_ROUTINES [PR_POSITION].make */
extern T0* T193f1(T0* C, T6 a1);
/* TO_SPECIAL [PR_POSITION].make_area */
extern T0* T275c2(T6 a1);
/* SPECIAL [PR_POSITION].make */
extern T0* T191c4(T6 a1);
/* KL_SPECIAL_ROUTINES [PR_POSITION].default_create */
extern T0* T193c3(void);
/* KL_ANY_ROUTINES.equal_objects */
extern T1 T72f1(T0* C, T0* a1, T0* a2);
/* PR_FSM.any_ */
extern T0* T22f6(T0* C);
/* PR_POSITION.error_action */
extern T0* T69f6(T0* C);
/* DS_ARRAYED_LIST [PR_ERROR_ACTION].item */
extern T0* T144f8(T0* C, T6 a1);
/* PR_POSITION.after */
extern T1 T69f5(T0* C);
/* PR_POSITION.before */
extern T1 T69f4(T0* C);
/* DS_ARRAYED_LIST [PR_POSITION].item */
extern T0* T68f8(T0* C, T6 a1);
/* PR_FSM.resolve_conflicts */
extern void T22f16(T0* C, T0* a1);
/* PR_STATE.reduce_reduce_count */
extern T6 T59f21(T0* C);
/* DS_LINKED_LIST [PR_TOKEN].force_last */
extern void T80f11(T0* C, T0* a1);
/* DS_LINKABLE [PR_TOKEN].put_right */
extern void T262f4(T0* C, T0* a1);
/* DS_LINKABLE [PR_TOKEN].make */
extern T0* T262c3(T0* a1);
/* DS_LINKED_LIST [PR_TOKEN].is_empty */
extern T1 T80f6(T0* C);
/* DS_LINKED_LIST [PR_TOKEN].has */
extern T1 T80f7(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TOKEN].make */
extern T0* T80c10(void);
/* DS_LINKED_LIST [PR_TOKEN].new_cursor */
extern T0* T80f8(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_TOKEN].make */
extern T0* T263c7(T0* a1);
/* PR_STATE.shift_reduce_count */
extern T6 T59f20(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].remove */
extern void T99f22(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_TOKEN].move_left */
extern void T99f28(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [PR_TOKEN].move_cursors_left */
extern void T99f27(T0* C, T6 a1);
/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].set_position */
extern void T224f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_TOKEN].remove_last */
extern void T99f26(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].move_last_cursors_after */
extern void T99f31(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].set_next_cursor */
extern void T224f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].has */
extern T1 T99f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].put_last */
extern void T99f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].make */
extern T0* T99c19(T6 a1);
/* DS_ARRAYED_LIST [PR_TOKEN].new_cursor */
extern T0* T99f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].make */
extern T0* T224c7(T0* a1);
/* KL_SPECIAL_ROUTINES [PR_TOKEN].make */
extern T0* T143f1(T0* C, T6 a1);
/* TO_SPECIAL [PR_TOKEN].make_area */
extern T0* T249c2(T6 a1);
/* SPECIAL [PR_TOKEN].make */
extern T0* T142c4(T6 a1);
/* KL_SPECIAL_ROUTINES [PR_TOKEN].default_create */
extern T0* T143c3(void);
/* PR_STATE.resolve_conflicts */
extern T0* T59f18(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].force_last */
extern void T99f23(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].resize */
extern void T99f20(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_TOKEN].resize */
extern T0* T143f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_TOKEN].aliased_resized_area */
extern T0* T142f3(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_TOKEN].new_capacity */
extern T6 T99f12(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_TOKEN].extendible */
extern T1 T99f11(T0* C, T6 a1);
/* PR_TOKEN.is_non_associative */
extern T1 T85f18(T0* C);
/* PR_TOKEN.is_right_associative */
extern T1 T85f17(T0* C);
/* PR_TOKEN.is_left_associative */
extern T1 T85f16(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].delete */
extern void T99f25(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].clear_items */
extern void T99f30(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [PR_TOKEN].is_empty */
extern T1 T99f13(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].move_all_cursors_after */
extern void T99f29(T0* C);
/* DS_LINKED_LIST [PR_CONFLICT].force_last */
extern void T63f9(T0* C, T0* a1);
/* DS_LINKABLE [PR_CONFLICT].put_right */
extern void T300f4(T0* C, T0* a1);
/* DS_LINKABLE [PR_CONFLICT].make */
extern T0* T300c3(T0* a1);
/* DS_LINKED_LIST [PR_CONFLICT].is_empty */
extern T1 T63f5(T0* C);
/* PR_CONFLICT.make */
extern T0* T65c5(T0* a1, T0* a2, T0* a3, T0* a4);
/* PR_STATE.remove_shift */
extern void T59f33(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_STATE].remove */
extern void T57f22(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_STATE].move_left */
extern void T57f25(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [PR_STATE].move_cursors_left */
extern void T57f24(T0* C, T6 a1);
/* DS_ARRAYED_LIST_CURSOR [PR_STATE].set_position */
extern void T183f5(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_STATE].remove_last */
extern void T57f23(T0* C);
/* DS_ARRAYED_LIST [PR_STATE].move_last_cursors_after */
extern void T57f26(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_STATE].set_next_cursor */
extern void T183f6(T0* C, T0* a1);
/* PR_TOKEN.has_precedence */
extern T1 T85f10(T0* C);
/* PR_RULE.has_precedence */
extern T1 T73f15(T0* C);
/* DS_LINKED_LIST [PR_CONFLICT].make */
extern T0* T63c8(void);
/* DS_LINKED_LIST [PR_CONFLICT].new_cursor */
extern T0* T63f6(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_CONFLICT].make */
extern T0* T299c7(T0* a1);
/* PR_FSM.make_default */
extern void T22f12(T0* C, T0* a1);
/* PR_FSM.build_deterministic */
extern void T22f19(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_REDUCTION].forth */
extern void T90f9(T0* C);
/* DS_LINKED_LIST [PR_REDUCTION].cursor_forth */
extern void T75f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_REDUCTION].add_traversing_cursor */
extern void T75f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_REDUCTION].set_next_cursor */
extern void T90f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_REDUCTION].remove_traversing_cursor */
extern void T75f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_REDUCTION].set */
extern void T90f10(T0* C, T0* a1, T1 a2, T1 a3);
/* PR_REDUCTION.build_lookaheads */
extern void T91f7(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_TOKEN].forth */
extern void T263f9(T0* C);
/* DS_LINKED_LIST [PR_TOKEN].cursor_forth */
extern void T80f13(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TOKEN].add_traversing_cursor */
extern void T80f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_TOKEN].set_next_cursor */
extern void T263f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TOKEN].remove_traversing_cursor */
extern void T80f15(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_TOKEN].set */
extern void T263f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [PR_TOKEN].item */
extern T0* T263f6(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_TOKEN].start */
extern void T263f8(T0* C);
/* DS_LINKED_LIST [PR_TOKEN].cursor_start */
extern void T80f12(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_TOKEN].cursor_off */
extern T1 T80f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].wipe_out */
extern void T99f34(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_REDUCTION].item */
extern T0* T90f6(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_REDUCTION].start */
extern void T90f8(T0* C);
/* DS_LINKED_LIST [PR_REDUCTION].cursor_start */
extern void T75f10(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_REDUCTION].cursor_off */
extern T1 T75f7(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_REDUCTION].new_cursor */
extern T0* T75f6(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_REDUCTION].make */
extern T0* T90c7(T0* a1);
/* DS_NESTED_LIST_FLATTENER [PR_TOKEN].flatten */
extern void T79f2(T0* C, T0* a1);
/* DS_NESTED_LIST_FLATTENER [PR_TOKEN].traverse */
extern void T79f3(T0* C, T0* a1, T0* a2);
/* PR_TRANSITION.set_following_tokens */
extern void T83f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].remove */
extern void T202f10(T0* C);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].item */
extern T0* T202f5(T0* C);
/* PR_TRANSITION.add_following_token */
extern void T83f10(T0* C, T0* a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].force */
extern void T202f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].resize */
extern void T202f11(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_TOKEN]].resize */
extern T0* T278f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_NESTED_LIST [PR_TOKEN]].aliased_resized_area */
extern T0* T277f3(T0* C, T6 a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].new_capacity */
extern T6 T202f7(T0* C, T6 a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].extendible */
extern T1 T202f6(T0* C, T6 a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].make */
extern T0* T202c8(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_TOKEN]].make */
extern T0* T278f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_NESTED_LIST [PR_TOKEN]].make_area */
extern T0* T294c2(T6 a1);
/* SPECIAL [DS_NESTED_LIST [PR_TOKEN]].make */
extern T0* T277c4(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_TOKEN]].default_create */
extern T0* T278c3(void);
/* PR_TRANSITION.set_index */
extern void T83f8(T0* C, T6 a1);
/* DS_NESTED_LIST_FLATTENER [PR_TOKEN].make */
extern T0* T79c1(void);
/* DS_ARRAYED_STACK [PR_STATE].item */
extern T0* T82f5(T0* C);
/* DS_ARRAYED_STACK [PR_STATE].remove */
extern void T82f9(T0* C);
/* PR_STATE.put_transition */
extern void T59f32(T0* C, T0* a1, T0* a2);
/* PR_REDUCTION.put_transition */
extern void T91f6(T0* C, T0* a1);
/* PR_STATE.shift */
extern T0* T59f22(T0* C, T0* a1);
/* DS_ARRAYED_STACK [PR_STATE].put */
extern void T82f8(T0* C, T0* a1);
/* DS_ARRAYED_STACK [PR_STATE].wipe_out */
extern void T82f7(T0* C);
/* DS_ARRAYED_STACK [PR_STATE].clear_items */
extern void T82f10(T0* C, T6 a1, T6 a2);
/* PR_TRANSITION.symbol */
extern T0* T83f6(T0* C);
/* PR_VARIABLE.transition */
extern T0* T74f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].go_after */
extern void T88f12(T0* C);
/* DS_LINKED_LIST [PR_TRANSITION].cursor_go_after */
extern void T77f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].set_after */
extern void T88f13(T0* C);
/* DS_ARRAYED_STACK [PR_STATE].make */
extern T0* T82c6(T6 a1);
/* KL_SPECIAL_ROUTINES [PR_STATE].make */
extern T0* T182f1(T0* C, T6 a1);
/* TO_SPECIAL [PR_STATE].make_area */
extern T0* T272c2(T6 a1);
/* SPECIAL [PR_STATE].make */
extern T0* T97c4(T6 a1);
/* KL_SPECIAL_ROUTINES [PR_STATE].default_create */
extern T0* T182c3(void);
/* PR_GRAMMAR.max_rhs */
extern T6 T29f9(T0* C);
/* DS_LINKED_LIST [PR_TRANSITION].force_last */
extern void T77f9(T0* C, T0* a1);
/* DS_LINKABLE [PR_TRANSITION].put_right */
extern void T200f4(T0* C, T0* a1);
/* DS_LINKABLE [PR_TRANSITION].make */
extern T0* T200c3(T0* a1);
/* PR_VARIABLE.put_transition */
extern void T74f19(T0* C, T0* a1);
/* PR_TRANSITION.make */
extern T0* T83c7(T0* a1, T0* a2);
/* DS_LINKED_LIST [PR_REDUCTION].append_last */
extern void T75f9(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_REDUCTION].is_empty */
extern T1 T75f5(T0* C);
/* DS_LINKABLE [PR_REDUCTION].put_right */
extern void T199f4(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].after */
extern T1 T212f4(T0* C);
/* DS_ARRAYED_LIST [PR_REDUCTION].cursor_after */
extern T1 T86f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].forth */
extern void T212f9(T0* C);
/* DS_ARRAYED_LIST [PR_REDUCTION].cursor_forth */
extern void T86f20(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].set_position */
extern void T212f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_REDUCTION].add_traversing_cursor */
extern void T86f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].set_next_cursor */
extern void T212f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_REDUCTION].remove_traversing_cursor */
extern void T86f22(T0* C, T0* a1);
/* DS_LINKABLE [PR_REDUCTION].make */
extern T0* T199c3(T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].item */
extern T0* T212f6(T0* C);
/* DS_ARRAYED_LIST [PR_REDUCTION].cursor_item */
extern T0* T86f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].start */
extern void T212f8(T0* C);
/* DS_ARRAYED_LIST [PR_REDUCTION].cursor_start */
extern void T86f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].off */
extern T1 T212f5(T0* C);
/* DS_ARRAYED_LIST [PR_REDUCTION].cursor_off */
extern T1 T86f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_REDUCTION].cursor_before */
extern T1 T86f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_REDUCTION].new_cursor */
extern T0* T86f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].make */
extern T0* T212c7(T0* a1);
/* DS_ARRAYED_LIST [PR_REDUCTION].is_empty */
extern T1 T86f8(T0* C);
/* PR_STATE.set_lookahead_needed */
extern void T59f31(T0* C);
/* DS_ARRAYED_LIST [PR_STATE].is_empty */
extern T1 T57f12(T0* C);
/* DS_LINKED_LIST [PR_TRANSITION].make */
extern T0* T77c8(void);
/* DS_LINKED_LIST [PR_REDUCTION].make */
extern T0* T75c8(void);
/* PR_FSM.build_nondeterministic */
extern void T22f18(T0* C);
/* PR_FSM.put_final_state */
extern void T22f23(T0* C);
/* PR_TOKEN.make */
extern T0* T85c20(T6 a1, T0* a2, T0* a3);
/* PR_FSM.no_type */
extern unsigned char ge173os1802;
extern T0* ge173ov1802;
extern T0* T22f9(T0* C);
/* DS_ARRAYED_LIST [PR_TYPE].first */
extern T0* T113f7(T0* C);
/* PR_TYPE.make */
extern T0* T100c8(T6 a1, T0* a2);
/* DS_ARRAYED_LIST [PR_STATE].force_last */
extern void T57f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_STATE].new_capacity */
extern T6 T57f11(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_STATE].put_last */
extern void T57f17(T0* C, T0* a1);
/* PR_STATE.make */
extern T0* T59c25(T6 a1, T0* a2);
/* DS_ARRAYED_LIST [PR_REDUCTION].make */
extern T0* T86c16(T6 a1);
/* KL_SPECIAL_ROUTINES [PR_REDUCTION].make */
extern T0* T210f1(T0* C, T6 a1);
/* TO_SPECIAL [PR_REDUCTION].make_area */
extern T0* T280c2(T6 a1);
/* SPECIAL [PR_REDUCTION].make */
extern T0* T211c4(T6 a1);
/* KL_SPECIAL_ROUTINES [PR_REDUCTION].default_create */
extern T0* T210c3(void);
/* DS_ARRAYED_LIST [PR_POSITION].make_equal */
extern T0* T68c14(T6 a1);
/* KL_EQUALITY_TESTER [PR_POSITION].default_create */
extern T0* T192c3(void);
/* PR_STATE.has_shift */
extern T1 T59f24(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_STATE].first */
extern T0* T57f9(T0* C);
/* DS_ARRAYED_LIST [PR_STATE].resize */
extern void T57f16(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_STATE].resize */
extern T0* T182f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_STATE].aliased_resized_area */
extern T0* T97f3(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_STATE].extendible */
extern T1 T57f7(T0* C, T6 a1);
/* PR_FSM.build_transitions */
extern void T22f22(T0* C, T0* a1);
/* PR_FSM.new_state */
extern T0* T22f8(T0* C, T0* a1);
/* PR_STATE.set_id */
extern void T59f28(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].put_new */
extern void T58f38(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].key_storage_put */
extern void T58f49(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].item_storage_put */
extern void T58f48(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].slots_put */
extern void T58f42(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].clashes_put */
extern void T58f43(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].slots_item */
extern T6 T58f28(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].hash_position */
extern T6 T58f27(T0* C, T6 a1);
/* INTEGER_32.hash_code */
extern T6 T6f20(T6* C);
/* INTEGER_32.infix "&" */
extern T6 T6f22(T6* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].clashes_item */
extern T6 T58f23(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].unset_found_item */
extern void T58f40(T0* C);
/* PR_STATE.same_state */
extern T1 T59f12(T0* C, T0* a1);
/* PR_POSITION.same_position */
extern T1 T69f7(T0* C, T0* a1);
/* PR_STATE.any_ */
extern T0* T59f23(T0* C);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].found_item */
extern T0* T58f29(T0* C);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].item_storage_item */
extern T0* T58f22(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].found */
extern T1 T58f30(T0* C);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].search */
extern void T58f37(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].search_position */
extern void T58f47(T0* C, T6 a1);
/* KL_EQUALITY_TESTER [INTEGER_32].test */
extern T1 T41f1(T0* C, T6 a1, T6 a2);
/* KL_EQUALITY_TESTER [INTEGER_32].any_ */
extern T0* T41f2(T0* C);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].key_storage_item */
extern T6 T58f26(T0* C, T6 a1);
/* PR_STATE.sort_positions */
extern void T59f26(T0* C);
/* DS_ARRAYED_LIST [PR_POSITION].sort */
extern void T68f15(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [PR_POSITION].sort */
extern void T189f3(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [PR_POSITION].sort_with_comparator */
extern void T189f4(T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [PR_POSITION].subsort_with_comparator */
extern void T189f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* DS_ARRAYED_LIST [PR_POSITION].replace */
extern void T68f17(T0* C, T0* a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [PR_POSITION].less_than */
extern T1 T258f1(T0* C, T0* a1, T0* a2);
/* PR_POSITION.infix "<" */
extern T1 T69f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_POSITION].is_empty */
extern T1 T68f11(T0* C);
/* PR_STATE.position_sorter */
extern unsigned char ge176os3587;
extern T0* ge176ov3587;
extern T0* T59f14(T0* C);
/* DS_BUBBLE_SORTER [PR_POSITION].make */
extern T0* T189c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [PR_POSITION].make */
extern T0* T258c2(void);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].resize */
extern void T58f36(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].clashes_resize */
extern void T58f46(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].resize */
extern T0* T132f2(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].special_integer_ */
extern T0* T58f24(T0* C);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].key_storage_resize */
extern void T58f45(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].item_storage_resize */
extern void T58f44(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_STATE]].resize */
extern T0* T187f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_ARRAYED_LIST [PR_STATE]].aliased_resized_area */
extern T0* T184f3(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].slots_resize */
extern void T58f41(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].new_modulus */
extern T6 T58f33(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_REDUCTION].put_last */
extern void T86f18(T0* C, T0* a1);
/* PR_REDUCTION.make */
extern T0* T91c5(T0* a1);
/* PR_FSM.put_closure_positions */
extern void T22f24(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [PR_RULE].forth */
extern void T101f9(T0* C);
/* DS_LINKED_LIST [PR_RULE].cursor_forth */
extern void T95f12(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_RULE].add_traversing_cursor */
extern void T95f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_RULE].set_next_cursor */
extern void T101f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_RULE].remove_traversing_cursor */
extern void T95f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_RULE].set */
extern void T101f10(T0* C, T0* a1, T1 a2, T1 a3);
/* PR_POSITION.make */
extern T0* T69c13(T0* a1, T6 a2);
/* DS_LINKED_LIST_CURSOR [PR_RULE].item */
extern T0* T101f6(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_RULE].start */
extern void T101f8(T0* C);
/* DS_LINKED_LIST [PR_RULE].cursor_start */
extern void T95f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_RULE].cursor_off */
extern T1 T95f6(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_RULE].new_cursor */
extern T0* T95f8(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_RULE].make */
extern T0* T101c7(T0* a1);
/* PR_STATE.put_position */
extern void T59f27(T0* C, T0* a1);
/* PR_POSITION.hash_code */
extern T6 T69f3(T0* C);
/* DS_ARRAYED_LIST [PR_POSITION].resize */
extern void T68f16(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_POSITION].resize */
extern T0* T193f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_POSITION].aliased_resized_area */
extern T0* T191f3(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_POSITION].is_full */
extern T1 T68f7(T0* C);
/* DS_ARRAYED_LIST [PR_POSITION].has */
extern T1 T68f9(T0* C, T0* a1);
/* KL_EQUALITY_TESTER [PR_POSITION].test */
extern T1 T192f1(T0* C, T0* a1, T0* a2);
/* KL_EQUALITY_TESTER [PR_POSITION].any_ */
extern T0* T192f2(T0* C);
/* PR_POSITION.next */
extern T0* T69f10(T0* C);
/* ARRAY [PR_STATE].put */
extern void T98f6(T0* C, T0* a1, T6 a2);
/* ARRAY [PR_STATE].item */
extern T0* T98f4(T0* C, T6 a1);
/* PR_POSITION.symbol */
extern T0* T69f9(T0* C);
/* DS_ARRAYED_LIST [PR_REDUCTION].resize */
extern void T86f17(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_REDUCTION].resize */
extern T0* T210f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_REDUCTION].aliased_resized_area */
extern T0* T211f3(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_REDUCTION].extendible */
extern T1 T86f6(T0* C, T6 a1);
/* ARRAY [PR_STATE].make */
extern T0* T98c5(T6 a1, T6 a2);
/* ARRAY [PR_STATE].make_area */
extern void T98f7(T0* C, T6 a1);
/* PR_FSM.put_start_state */
extern void T22f21(T0* C);
/* DS_ARRAYED_LIST [PR_STATE].put_first */
extern void T57f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_STATE].put */
extern void T57f19(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [PR_STATE].move_cursors_right */
extern void T57f21(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [PR_STATE].move_right */
extern void T57f20(T0* C, T6 a1, T6 a2);
/* PR_FSM.build_derives */
extern void T22f20(T0* C);
/* DS_NESTED_LIST_FLATTENER [PR_RULE].flatten */
extern void T93f2(T0* C, T0* a1);
/* DS_NESTED_LIST_FLATTENER [PR_RULE].traverse */
extern void T93f3(T0* C, T0* a1, T0* a2);
/* PR_VARIABLE.set_derives */
extern void T74f25(T0* C, T0* a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].remove */
extern void T218f10(T0* C);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].item */
extern T0* T218f5(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_VARIABLE].forth */
extern void T223f9(T0* C);
/* DS_LINKED_LIST [PR_VARIABLE].cursor_forth */
extern void T94f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_VARIABLE].add_traversing_cursor */
extern void T94f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_VARIABLE].set_next_cursor */
extern void T223f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_VARIABLE].remove_traversing_cursor */
extern void T94f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_VARIABLE].set */
extern void T223f10(T0* C, T0* a1, T1 a2, T1 a3);
/* PR_VARIABLE.add_derive */
extern void T74f24(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_RULE].force_last */
extern void T95f16(T0* C, T0* a1);
/* DS_LINKABLE [PR_RULE].put_right */
extern void T225f4(T0* C, T0* a1);
/* DS_LINKABLE [PR_RULE].make */
extern T0* T225c3(T0* a1);
/* DS_LINKED_LIST [PR_RULE].is_empty */
extern T1 T95f7(T0* C);
/* DS_LINKED_LIST [PR_RULE].has */
extern T1 T95f9(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_VARIABLE].item */
extern T0* T223f6(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_VARIABLE].start */
extern void T223f8(T0* C);
/* DS_LINKED_LIST [PR_VARIABLE].cursor_start */
extern void T94f10(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_VARIABLE].cursor_off */
extern T1 T94f7(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_VARIABLE].new_cursor */
extern T0* T94f6(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_VARIABLE].make */
extern T0* T223c7(T0* a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].force */
extern void T218f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].resize */
extern void T218f11(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_RULE]].resize */
extern T0* T283f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_NESTED_LIST [PR_RULE]].aliased_resized_area */
extern T0* T282f3(T0* C, T6 a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].new_capacity */
extern T6 T218f7(T0* C, T6 a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].extendible */
extern T1 T218f6(T0* C, T6 a1);
/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].make */
extern T0* T218c8(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_RULE]].make */
extern T0* T283f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_NESTED_LIST [PR_RULE]].make_area */
extern T0* T295c2(T6 a1);
/* SPECIAL [DS_NESTED_LIST [PR_RULE]].make */
extern T0* T282c4(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_RULE]].default_create */
extern T0* T283c3(void);
/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].forth */
extern void T215f11(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].cursor_forth */
extern void T92f36(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].set_position */
extern void T215f8(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].add_traversing_cursor */
extern void T92f37(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].set_next_cursor */
extern void T215f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].remove_traversing_cursor */
extern void T92f38(T0* C, T0* a1);
/* PR_VARIABLE.set_index */
extern void T74f23(T0* C, T6 a1);
/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].item */
extern T0* T215f4(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].cursor_item */
extern T0* T92f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].after */
extern T1 T215f5(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].cursor_after */
extern T1 T92f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].start */
extern void T215f10(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].cursor_start */
extern void T92f35(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].is_empty */
extern T1 T92f17(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].off */
extern T1 T215f6(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].cursor_off */
extern T1 T92f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].cursor_before */
extern T1 T92f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].new_cursor */
extern T0* T92f11(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].make */
extern T0* T215c7(T0* a1);
/* DS_NESTED_LIST_FLATTENER [PR_RULE].make */
extern T0* T93c1(void);
/* DS_LINKED_LIST [PR_RULE].append_last */
extern void T95f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_RULE].after */
extern T1 T197f5(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].cursor_after */
extern T1 T71f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_RULE].forth */
extern void T197f11(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].cursor_forth */
extern void T71f33(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_RULE].set_position */
extern void T197f8(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_RULE].add_traversing_cursor */
extern void T71f34(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_RULE].set_next_cursor */
extern void T197f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].remove_traversing_cursor */
extern void T71f35(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_RULE].item */
extern T0* T197f4(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].cursor_item */
extern T0* T71f17(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_RULE].start */
extern void T197f10(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].cursor_start */
extern void T71f32(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_RULE].off */
extern T1 T197f6(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].cursor_off */
extern T1 T71f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].cursor_before */
extern T1 T71f20(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].new_cursor */
extern T0* T71f12(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_RULE].make */
extern T0* T197c7(T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].is_empty */
extern T1 T71f9(T0* C);
/* DS_LINKED_LIST [PR_VARIABLE].force_last */
extern void T94f9(T0* C, T0* a1);
/* DS_LINKABLE [PR_VARIABLE].put_right */
extern void T305f4(T0* C, T0* a1);
/* DS_LINKABLE [PR_VARIABLE].make */
extern T0* T305c3(T0* a1);
/* DS_LINKED_LIST [PR_VARIABLE].is_empty */
extern T1 T94f5(T0* C);
/* DS_ARRAYED_LIST [PR_SYMBOL].first */
extern T0* T81f10(T0* C);
/* DS_ARRAYED_LIST [PR_SYMBOL].is_empty */
extern T1 T81f9(T0* C);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].make */
extern T0* T58c35(T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].make_with_equality_testers */
extern void T58f39(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].make */
extern T0* T185c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].new_cursor */
extern T0* T185f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].make */
extern T0* T273c3(T0* a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].new_cursor */
extern T0* T58f32(T0* C);
/* DS_HASH_TABLE_CURSOR [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].make */
extern T0* T188c3(T0* a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].make_sparse_container */
extern void T58f50(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].make_slots */
extern void T58f54(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].make_clashes */
extern void T58f53(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].make_key_storage */
extern void T58f52(T0* C, T6 a1);
/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER_32].make_item_storage */
extern void T58f51(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_STATE]].make */
extern T0* T187f2(T0* C, T6 a1);
/* TO_SPECIAL [DS_ARRAYED_LIST [PR_STATE]].make_area */
extern T0* T274c2(T6 a1);
/* SPECIAL [DS_ARRAYED_LIST [PR_STATE]].make */
extern T0* T184c4(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_STATE]].default_create */
extern T0* T187c3(void);
/* KL_EQUALITY_TESTER [INTEGER_32].default_create */
extern T0* T41c3(void);
/* DS_ARRAYED_LIST [PR_STATE].make */
extern T0* T57c14(T6 a1);
/* DS_ARRAYED_LIST [PR_STATE].new_cursor */
extern T0* T57f10(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_STATE].make */
extern T0* T183c4(T0* a1);
/* PR_GRAMMAR.set_nullable */
extern void T29f21(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].remove_last */
extern void T92f23(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].move_last_cursors_after */
extern void T92f27(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].last */
extern T0* T92f10(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].first */
extern T0* T92f9(T0* C);
/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].item */
extern T0* T172f6(T0* C, T6 a1);
/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].wipe_out */
extern void T172f11(T0* C);
/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].clear_items */
extern void T172f13(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].move_all_cursors_after */
extern void T172f12(T0* C);
/* DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [PR_VARIABLE]].set_next_cursor */
extern void T270f6(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [PR_VARIABLE]].set_position */
extern void T270f5(T0* C, T6 a1);
/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].put_last */
extern void T172f10(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].put_last */
extern void T92f22(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].put_first */
extern void T92f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].put */
extern void T92f26(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [PR_VARIABLE].move_cursors_right */
extern void T92f33(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [PR_VARIABLE].move_right */
extern void T92f32(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [PR_VARIABLE].make */
extern T0* T92c20(T6 a1);
/* KL_SPECIAL_ROUTINES [PR_VARIABLE].make */
extern T0* T214f1(T0* C, T6 a1);
/* TO_SPECIAL [PR_VARIABLE].make_area */
extern T0* T281c2(T6 a1);
/* SPECIAL [PR_VARIABLE].make */
extern T0* T213c5(T6 a1);
/* KL_SPECIAL_ROUTINES [PR_VARIABLE].default_create */
extern T0* T214c3(void);
/* PR_VARIABLE.set_nullable */
extern void T74f20(T0* C);
/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].make */
extern T0* T172c9(T6 a1);
/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].new_cursor */
extern T0* T172f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [PR_VARIABLE]].make */
extern T0* T270c4(T0* a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_VARIABLE]].make */
extern T0* T269f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_ARRAYED_LIST [PR_VARIABLE]].make_area */
extern T0* T292c2(T6 a1);
/* SPECIAL [DS_ARRAYED_LIST [PR_VARIABLE]].make */
extern T0* T268c2(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_VARIABLE]].default_create */
extern T0* T269c2(void);
/* PR_GRAMMAR.reduce */
extern void T29f23(T0* C, T0* a1);
/* PR_GRAMMAR.integer_ */
extern T0* T29f14(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].remove */
extern void T92f24(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].move_left */
extern void T92f29(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [PR_VARIABLE].move_cursors_left */
extern void T92f28(T0* C, T6 a1);
/* PR_VARIABLE.set_id */
extern void T74f22(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_RULE].remove */
extern void T71f22(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_RULE].move_left */
extern void T71f28(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [PR_RULE].move_cursors_left */
extern void T71f27(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_RULE].remove_last */
extern void T71f26(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].move_last_cursors_after */
extern void T71f31(T0* C);
/* PR_RULE.set_id */
extern void T73f28(T0* C, T6 a1);
/* PR_GRAMMAR.mark_useful_rules */
extern void T29f29(T0* C);
/* PR_RULE.set_useful */
extern void T73f29(T0* C, T1 a1);
/* PR_GRAMMAR.traverse_variable */
extern void T29f30(T0* C, T0* a1);
/* PR_TOKEN.set_useful */
extern void T85f28(T0* C, T1 a1);
/* PR_VARIABLE.set_useful */
extern void T74f18(T0* C, T1 a1);
/* PR_GRAMMAR.mark_useful_variables */
extern void T29f28(T0* C);
/* PR_FSM.make_verbose */
extern T0* T22c10(T0* a1, T0* a2, T0* a3);
/* PR_FSM.print_machine */
extern void T22f15(T0* C, T0* a1);
/* PR_STATE.print_state */
extern void T59f30(T0* C, T0* a1);
/* PR_STATE.print_reductions */
extern void T59f34(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].extend_last */
extern void T99f24(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].forth */
extern void T224f9(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].cursor_forth */
extern void T99f33(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].add_traversing_cursor */
extern void T99f35(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].remove_traversing_cursor */
extern void T99f36(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].item */
extern T0* T224f4(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].cursor_item */
extern T0* T99f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].after */
extern T1 T224f5(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].cursor_after */
extern T1 T99f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].start */
extern void T224f8(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].cursor_start */
extern void T99f32(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].off */
extern T1 T224f6(T0* C);
/* DS_ARRAYED_LIST [PR_TOKEN].cursor_off */
extern T1 T99f17(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].cursor_before */
extern T1 T99f18(T0* C, T0* a1);
/* PR_POSITION.print_position */
extern void T69f14(T0* C, T0* a1);
/* PR_GRAMMAR.print_grammar */
extern void T29f22(T0* C, T0* a1);
/* PR_VARIABLE.print_variable */
extern void T74f21(T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_LIST [PR_SYMBOL].has */
extern T1 T81f11(T0* C, T0* a1);
/* PR_TOKEN.print_token */
extern void T85f30(T0* C, T0* a1, T0* a2);
/* PR_RULE.print_rule */
extern void T73f27(T0* C, T0* a1);
/* PR_FSM.set_error_actions_verbose */
extern void T22f14(T0* C, T0* a1, T0* a2);
/* PR_FSM.resolve_conflicts_verbose */
extern void T22f13(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [PR_CONFLICT].forth */
extern void T299f9(T0* C);
/* DS_LINKED_LIST [PR_CONFLICT].cursor_forth */
extern void T63f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_CONFLICT].add_traversing_cursor */
extern void T63f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_CONFLICT].set_next_cursor */
extern void T299f11(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_CONFLICT].remove_traversing_cursor */
extern void T63f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_CONFLICT].set */
extern void T299f10(T0* C, T0* a1, T1 a2, T1 a3);
/* PR_CONFLICT.print_conflict */
extern void T65f6(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [PR_CONFLICT].item */
extern T0* T299f6(T0* C);
/* DS_LINKED_LIST_CURSOR [PR_CONFLICT].start */
extern void T299f8(T0* C);
/* DS_LINKED_LIST [PR_CONFLICT].cursor_start */
extern void T63f10(T0* C, T0* a1);
/* DS_LINKED_LIST [PR_CONFLICT].cursor_off */
extern T1 T63f7(T0* C, T0* a1);
/* PR_GRAMMAR.reduce_verbose */
extern void T29f20(T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_LIST [PR_RULE].cloned_object */
extern T0* T71f11(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].twin */
extern T0* T71f8(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].copy */
extern void T71f25(T0* C, T0* a1);
/* SPECIAL [PR_RULE].twin */
extern T0* T195f4(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].valid_cursor */
extern T1 T71f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].move_all_cursors_after */
extern void T71f29(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].cloned_object */
extern T0* T92f8(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].twin */
extern T0* T92f7(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].copy */
extern void T92f25(T0* C, T0* a1);
/* SPECIAL [PR_VARIABLE].twin */
extern T0* T213f2(T0* C);
/* DS_ARRAYED_LIST [PR_VARIABLE].valid_cursor */
extern T1 T92f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].move_all_cursors_after */
extern void T92f30(T0* C);
/* KL_STANDARD_FILES.output */
extern unsigned char ge323os2896;
extern T0* ge323ov2896;
extern T0* T35f1(T0* C);
/* KL_STDOUT_FILE.make */
extern T0* T36c9(void);
/* KL_STDOUT_FILE.make_open_stdout */
extern void T36f16(T0* C, T0* a1);
/* KL_STDOUT_FILE.set_write_mode */
extern void T36f20(T0* C);
/* KL_STDOUT_FILE.console_def */
extern T14 T36f4(T0* C, T6 a1);
/* KL_STDOUT_FILE.old_make */
extern void T36f19(T0* C, T0* a1);
/* GEYACC.std */
extern unsigned char ge321os1779;
extern T0* ge321ov1779;
extern T0* T21f12(T0* C);
/* KL_STANDARD_FILES.default_create */
extern T0* T35c4(void);
/* KL_EXCEPTIONS.die */
extern void T34f2(T0* C, T6 a1);
/* GEYACC.exceptions */
extern unsigned char ge354os1776;
extern T0* ge354ov1776;
extern T0* T21f15(T0* C);
/* KL_EXCEPTIONS.default_create */
extern T0* T34c1(void);
/* UT_ERROR_HANDLER.report_error */
extern void T28f7(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_error_message */
extern void T28f10(T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.make */
extern T0* T25c7(T0* a1);
/* KL_TEXT_OUTPUT_FILE.close */
extern void T24f23(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_close */
extern void T24f30(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_close */
extern void T24f34(T0* C, T14 a1);
/* PR_HTML_DOC_GENERATOR.print_grammar */
extern void T31f5(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_grammar_footer */
extern void T31f8(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_rules */
extern void T31f7(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_first_rhs_footer */
extern void T31f17(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_first_rhs_header */
extern void T31f16(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_lhs */
extern void T31f15(T0* C, T0* a1, T0* a2);
/* PR_HTML_DOC_GENERATOR.print_rule_header */
extern void T31f14(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_rule_footer */
extern void T31f13(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_next_rhs_footer */
extern void T31f12(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_rhs */
extern void T31f11(T0* C, T0* a1, T0* a2);
/* PR_HTML_DOC_GENERATOR.print_variable */
extern void T31f20(T0* C, T0* a1, T0* a2);
/* PR_HTML_DOC_GENERATOR.print_token */
extern void T31f19(T0* C, T0* a1, T0* a2);
/* PR_HTML_DOC_GENERATOR.print_escaped */
extern void T31f21(T0* C, T0* a1, T0* a2);
/* PR_HTML_DOC_GENERATOR.print_empty_rhs */
extern void T31f18(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_next_rhs_header */
extern void T31f10(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_grammar_header */
extern void T31f6(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.print_css */
extern void T31f9(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_grammar */
extern void T30f5(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_grammar_footer */
extern void T30f8(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_rules */
extern void T30f7(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_first_rhs_footer */
extern void T30f16(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_first_rhs_header */
extern void T30f15(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_lhs */
extern void T30f14(T0* C, T0* a1, T0* a2);
/* PR_XML_DOC_GENERATOR.print_rule_header */
extern void T30f13(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_rule_footer */
extern void T30f12(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_next_rhs_footer */
extern void T30f11(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_rhs */
extern void T30f10(T0* C, T0* a1, T0* a2);
/* PR_XML_DOC_GENERATOR.print_variable */
extern void T30f19(T0* C, T0* a1, T0* a2);
/* PR_XML_DOC_GENERATOR.print_token */
extern void T30f18(T0* C, T0* a1, T0* a2);
/* PR_XML_DOC_GENERATOR.print_escaped */
extern void T30f20(T0* C, T0* a1, T0* a2);
/* PR_XML_DOC_GENERATOR.print_empty_rhs */
extern void T30f17(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_next_rhs_header */
extern void T30f9(T0* C, T0* a1);
/* PR_XML_DOC_GENERATOR.print_grammar_header */
extern void T30f6(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.is_open_write */
extern T1 T24f12(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
extern T1 T24f8(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T24f22(T0* C);
/* KL_TEXT_OUTPUT_FILE.is_closed */
extern T1 T24f13(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_closed */
extern T1 T24f11(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_write */
extern void T24f31(T0* C);
/* KL_TEXT_OUTPUT_FILE.default_pointer */
extern T14 T24f18(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T24f31p1(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_open */
extern T14 T24f19(T0* C, T14 a1, T6 a2);
/* STRING_8.to_c */
extern T0* T17f4(T0* C);
/* KL_TEXT_OUTPUT_FILE.make */
extern T0* T24c20(T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_make */
extern void T24f29(T0* C, T0* a1);
/* PR_HTML_DOC_GENERATOR.set_lhs_shared */
extern void T31f4(T0* C, T1 a1);
/* PR_XML_DOC_GENERATOR.set_lhs_shared */
extern void T30f4(T0* C, T1 a1);
/* PR_HTML_DOC_GENERATOR.make */
extern T0* T31c3(T0* a1);
/* PR_XML_DOC_GENERATOR.make */
extern T0* T30c3(T0* a1);
/* GEYACC.parse_input_file */
extern void T21f21(T0* C);
/* KL_STANDARD_FILES.input */
extern unsigned char ge323os2895;
extern T0* ge323ov2895;
extern T0* T35f2(T0* C);
/* KL_STDIN_FILE.make */
extern T0* T54c18(void);
/* KL_STDIN_FILE.make_open_stdin */
extern void T54f20(T0* C, T0* a1);
/* KL_STDIN_FILE.set_read_mode */
extern void T54f22(T0* C);
/* KL_STDIN_FILE.console_def */
extern T14 T54f8(T0* C, T6 a1);
/* KL_STDIN_FILE.old_make */
extern void T54f21(T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.make */
extern T0* T52c7(T0* a1);
/* KL_TEXT_INPUT_FILE.close */
extern void T51f38(T0* C);
/* KL_TEXT_INPUT_FILE.old_close */
extern void T51f40(T0* C);
/* KL_TEXT_INPUT_FILE.file_close */
extern void T51f42(T0* C, T14 a1);
/* PR_YACC_PARSER.parse_file */
extern void T50f257(T0* C, T0* a1);
/* PR_YACC_PARSER.parse */
extern void T50f261(T0* C);
/* PR_YACC_PARSER.yy_pop_last_value */
extern void T50f274(T0* C, T6 a1);
/* PR_YACC_PARSER.yy_push_error_value */
extern void T50f273(T0* C);
/* KL_SPECIAL_ROUTINES [ANY].resize */
extern T0* T135f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ANY].aliased_resized_area */
extern T0* T134f2(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].make */
extern T0* T135f1(T0* C, T6 a1);
/* TO_SPECIAL [ANY].make_area */
extern T0* T245c2(T6 a1);
/* SPECIAL [ANY].make */
extern T0* T134c3(T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].default_create */
extern T0* T135c3(void);
/* PR_YACC_PARSER.yy_do_action */
extern void T50f272(T0* C, T6 a1);
/* PR_GRAMMAR.set_eiffel_code */
extern void T29f25(T0* C, T0* a1);
/* PR_YACC_PARSER.report_prec_not_token_error */
extern void T50f300(T0* C, T0* a1);
/* PR_PREC_NOT_TOKEN_ERROR.make */
extern T0* T153c7(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.filename */
extern T0* T50f229(T0* C);
/* PR_YACC_PARSER.new_token */
extern T0* T50f177(T0* C, T0* a1);
/* PR_GRAMMAR.put_token */
extern void T29f33(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TOKEN].is_full */
extern T1 T99f8(T0* C);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].force_new */
extern void T127f41(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].key_storage_put */
extern void T127f49(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].item_storage_put */
extern void T127f45(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].slots_put */
extern void T127f48(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].clashes_put */
extern void T127f47(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].slots_item */
extern T6 T127f36(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].hash_position */
extern T6 T127f28(T0* C, T0* a1);
/* STRING_8.hash_code */
extern T6 T17f27(T0* C);
/* INTEGER_32.infix "|<<" */
extern T6 T6f24(T6* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].clashes_item */
extern T6 T127f35(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].resize */
extern void T127f46(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].clashes_resize */
extern void T127f54(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].special_integer_ */
extern T0* T127f33(T0* C);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].key_storage_resize */
extern void T127f53(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].resize */
extern T0* T136f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].aliased_resized_area */
extern T0* T123f3(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].item_storage_resize */
extern void T127f52(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].key_storage_item */
extern T0* T127f23(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].slots_resize */
extern void T127f51(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].new_modulus */
extern T6 T127f26(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].new_capacity */
extern T6 T127f25(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].unset_found_item */
extern void T127f44(T0* C);
/* PR_YACC_PARSER.unknown_type */
extern unsigned char ge201os3897;
extern T0* ge201ov3897;
extern T0* T50f244(T0* C);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].found_item */
extern T0* T127f21(T0* C);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].item_storage_item */
extern T0* T127f29(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].found */
extern T1 T127f31(T0* C);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].search */
extern void T127f40(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].search_position */
extern void T127f42(T0* C, T0* a1);
/* KL_EQUALITY_TESTER [STRING_8].test */
extern T1 T42f1(T0* C, T0* a1, T0* a2);
/* KL_EQUALITY_TESTER [STRING_8].any_ */
extern T0* T42f2(T0* C);
/* STRING_8.as_lower */
extern T0* T17f10(T0* C);
/* STRING_8.to_lower */
extern void T17f37(T0* C);
/* STRING_8.to_lower_area */
extern void T17f42(T0* C, T0* a1, T6 a2, T6 a3);
/* STRING_8.twin */
extern T0* T17f9(T0* C);
/* STRING_8.copy */
extern void T17f36(T0* C, T0* a1);
/* PR_YACC_PARSER.report_prec_specified_twice_error */
extern void T50f299(T0* C);
/* PR_PREC_SPECIFIED_TWICE_ERROR.make */
extern T0* T152c7(T0* a1, T6 a2);
/* PR_YACC_PARSER.put_action */
extern void T50f298(T0* C, T0* a1, T0* a2);
/* PR_RULE.put_symbol */
extern void T73f23(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_ERROR_ACTION].put_last */
extern void T144f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_ERROR_ACTION].resize */
extern void T144f11(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_ERROR_ACTION].resize */
extern T0* T250f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_ERROR_ACTION].aliased_resized_area */
extern T0* T251f2(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_ERROR_ACTION].is_full */
extern T1 T144f6(T0* C);
/* DS_ARRAYED_LIST [PR_SYMBOL].put_last */
extern void T81f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_SYMBOL].resize */
extern void T81f14(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_SYMBOL].resize */
extern T0* T208f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_SYMBOL].aliased_resized_area */
extern T0* T207f3(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_SYMBOL].is_full */
extern T1 T81f7(T0* C);
/* PR_RULE.set_action */
extern void T73f24(T0* C, T0* a1);
/* PR_VARIABLE.set_type */
extern void T74f16(T0* C, T0* a1);
/* PR_YACC_PARSER.no_action */
extern unsigned char ge201os3895;
extern T0* ge201ov3895;
extern T0* T50f231(T0* C);
/* PR_ACTION_FACTORY.new_action */
extern T0* T126f1(T0* C, T0* a1);
/* PR_ACTION.make */
extern T0* T174c6(T0* a1);
/* PR_YACC_PARSER.new_action */
extern T0* T50f176(T0* C, T0* a1);
/* PR_YACC_PARSER.new_string_token */
extern T0* T50f175(T0* C, T0* a1);
/* PR_TOKEN.set_literal_string */
extern void T85f22(T0* C, T0* a1);
/* PR_YACC_PARSER.report_undefined_string_token_error */
extern void T50f329(T0* C, T0* a1);
/* PR_UNDEFINED_STRING_TOKEN_ERROR.make */
extern T0* T179c7(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.new_char_token */
extern T0* T50f174(T0* C, T0* a1);
/* PR_TOKEN.set_token_id */
extern void T85f21(T0* C, T6 a1);
/* PR_YACC_PARSER.put_symbol */
extern void T50f297(T0* C, T0* a1, T0* a2);
/* PR_YACC_PARSER.new_symbol */
extern T0* T50f173(T0* C, T0* a1);
/* PR_GRAMMAR.put_variable */
extern void T29f32(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].resize */
extern void T92f34(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_VARIABLE].resize */
extern T0* T214f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_VARIABLE].aliased_resized_area */
extern T0* T213f4(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_VARIABLE].is_full */
extern T1 T92f14(T0* C);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].force_new */
extern void T128f40(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].key_storage_put */
extern void T128f48(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].item_storage_put */
extern void T128f44(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].slots_put */
extern void T128f47(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].clashes_put */
extern void T128f46(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].slots_item */
extern T6 T128f34(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].hash_position */
extern T6 T128f24(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].clashes_item */
extern T6 T128f33(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].resize */
extern void T128f45(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].clashes_resize */
extern void T128f53(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].special_integer_ */
extern T0* T128f32(T0* C);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].key_storage_resize */
extern void T128f52(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].item_storage_resize */
extern void T128f51(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].key_storage_item */
extern T0* T128f22(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].slots_resize */
extern void T128f50(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].new_modulus */
extern T6 T128f25(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].new_capacity */
extern T6 T128f23(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].unset_found_item */
extern void T128f43(T0* C);
/* PR_VARIABLE.make */
extern T0* T74c15(T6 a1, T0* a2, T0* a3);
/* DS_LINKED_LIST [PR_VARIABLE].make */
extern T0* T94c8(void);
/* DS_LINKED_LIST [PR_RULE].make */
extern T0* T95c10(void);
/* DS_ARRAYED_LIST [PR_RULE].make */
extern T0* T71c21(T6 a1);
/* KL_SPECIAL_ROUTINES [PR_RULE].make */
extern T0* T196f1(T0* C, T6 a1);
/* TO_SPECIAL [PR_RULE].make_area */
extern T0* T276c2(T6 a1);
/* SPECIAL [PR_RULE].make */
extern T0* T195c5(T6 a1);
/* KL_SPECIAL_ROUTINES [PR_RULE].default_create */
extern T0* T196c3(void);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].item */
extern T0* T127f30(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].has */
extern T1 T127f22(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].found_item */
extern T0* T128f28(T0* C);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].item_storage_item */
extern T0* T128f27(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].found */
extern T1 T128f35(T0* C);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].search */
extern void T128f39(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].search_position */
extern void T128f41(T0* C, T0* a1);
/* PR_YACC_PARSER.put_error_action */
extern void T50f296(T0* C, T0* a1, T6 a2, T0* a3);
/* PR_RULE.set_error_action */
extern void T73f22(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [PR_ERROR_ACTION].replace */
extern void T144f10(T0* C, T0* a1, T6 a2);
/* PR_YACC_PARSER.new_error_action */
extern T0* T50f172(T0* C, T0* a1, T6 a2);
/* PR_ERROR_ACTION.make */
extern T0* T70c6(T0* a1, T6 a2);
/* PR_YACC_PARSER.report_invalid_error_n_error */
extern void T50f295(T0* C, T6 a1);
/* PR_INVALID_ERROR_N_ERROR.make */
extern T0* T151c7(T0* a1, T6 a2, T6 a3);
/* PR_RULE.set_line_nb */
extern void T73f21(T0* C, T6 a1);
/* PR_YACC_PARSER.put_rule */
extern void T50f294(T0* C, T0* a1);
/* PR_GRAMMAR.put_rule */
extern void T29f27(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].put_last */
extern void T71f24(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_RULE].resize */
extern void T71f23(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [PR_RULE].resize */
extern T0* T196f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_RULE].aliased_resized_area */
extern T0* T195f3(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_RULE].is_full */
extern T1 T71f16(T0* C);
/* PR_YACC_PARSER.report_rule_declared_twice_warning */
extern void T50f293(T0* C, T0* a1);
/* PR_RULE_DECLARED_TWICE_ERROR.make */
extern T0* T150c7(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.new_variable */
extern T0* T50f171(T0* C, T0* a1);
/* PR_YACC_PARSER.new_rule */
extern T0* T50f170(T0* C, T0* a1);
/* PR_VARIABLE.put_rule */
extern void T74f17(T0* C, T0* a1);
/* PR_RULE.make */
extern T0* T73c16(T6 a1, T0* a2, T0* a3);
/* DS_ARRAYED_LIST [PR_ERROR_ACTION].make */
extern T0* T144c9(T6 a1);
/* DS_ARRAYED_LIST [PR_ERROR_ACTION].new_cursor */
extern T0* T144f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_ERROR_ACTION].make */
extern T0* T252c3(T0* a1);
/* KL_SPECIAL_ROUTINES [PR_ERROR_ACTION].make */
extern T0* T250f1(T0* C, T6 a1);
/* TO_SPECIAL [PR_ERROR_ACTION].make_area */
extern T0* T288c2(T6 a1);
/* SPECIAL [PR_ERROR_ACTION].make */
extern T0* T251c4(T6 a1);
/* KL_SPECIAL_ROUTINES [PR_ERROR_ACTION].default_create */
extern T0* T250c3(void);
/* DS_ARRAYED_LIST [PR_SYMBOL].make */
extern T0* T81c13(T6 a1);
/* DS_ARRAYED_LIST [PR_SYMBOL].new_cursor */
extern T0* T81f8(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_SYMBOL].make */
extern T0* T209c3(T0* a1);
/* KL_SPECIAL_ROUTINES [PR_SYMBOL].make */
extern T0* T208f1(T0* C, T6 a1);
/* TO_SPECIAL [PR_SYMBOL].make_area */
extern T0* T279c2(T6 a1);
/* SPECIAL [PR_SYMBOL].make */
extern T0* T207c4(T6 a1);
/* KL_SPECIAL_ROUTINES [PR_SYMBOL].default_create */
extern T0* T208c3(void);
/* PR_YACC_PARSER.new_dummy_variable */
extern T0* T50f169(T0* C);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].force */
extern void T128f38(T0* C, T0* a1, T0* a2);
/* PR_YACC_PARSER.integer_ */
extern T0* T50f243(T0* C);
/* PR_YACC_PARSER.report_lhs_symbol_token_error */
extern void T50f292(T0* C, T0* a1);
/* PR_LHS_SYMBOL_TOKEN_ERROR.make */
extern T0* T149c7(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.is_terminal */
extern T1 T50f168(T0* C, T0* a1);
/* PR_YACC_PARSER.process_rule */
extern void T50f291(T0* C, T0* a1);
/* PR_RULE.set_precedence */
extern void T73f20(T0* C, T6 a1);
/* PR_RULE.set_non_associative */
extern void T73f19(T0* C);
/* PR_RULE.set_right_associative */
extern void T73f18(T0* C);
/* PR_RULE.set_left_associative */
extern void T73f17(T0* C);
/* PR_YACC_PARSER.report_no_rules_error */
extern void T50f290(T0* C);
/* PR_NO_RULES_ERROR.make */
extern T0* T148c7(T0* a1);
/* PR_YACC_PARSER.new_nonterminal */
extern T0* T50f165(T0* C, T0* a1, T0* a2);
/* PR_YACC_PARSER.report_variable_declared_twice_error */
extern void T50f328(T0* C, T0* a1);
/* PR_VARIABLE_DECLARED_TWICE_ERROR.make */
extern T0* T178c7(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.is_nonterminal */
extern T1 T50f230(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].has */
extern T1 T128f29(T0* C, T0* a1);
/* PR_YACC_PARSER.report_variable_declared_as_token_error */
extern void T50f327(T0* C, T0* a1);
/* PR_SYMBOL_DECLARED_TOKEN_ERROR.make */
extern T0* T177c7(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.new_nonassoc_char_terminal */
extern T0* T50f164(T0* C, T0* a1, T6 a2);
/* PR_YACC_PARSER.set_precedence */
extern void T50f326(T0* C, T0* a1, T6 a2);
/* PR_TOKEN.set_precedence */
extern void T85f29(T0* C, T6 a1);
/* PR_YACC_PARSER.report_precedence_defined_twice_error */
extern void T50f330(T0* C, T0* a1);
/* PR_PRECEDENCE_DEFINED_TWICE_ERROR.make */
extern T0* T180c7(T0* a1, T6 a2, T0* a3);
/* PR_TOKEN.set_non_associative */
extern void T85f27(T0* C);
/* PR_YACC_PARSER.new_nonassoc_terminal */
extern T0* T50f163(T0* C, T0* a1, T6 a2);
/* PR_YACC_PARSER.report_token_declared_as_variable_error */
extern void T50f324(T0* C, T0* a1);
/* PR_SYMBOL_DECLARED_VARIABLE_ERROR.make */
extern T0* T175c7(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.new_right_char_terminal */
extern T0* T50f162(T0* C, T0* a1, T6 a2);
/* PR_TOKEN.set_right_associative */
extern void T85f26(T0* C);
/* PR_YACC_PARSER.new_right_terminal */
extern T0* T50f161(T0* C, T0* a1, T6 a2);
/* PR_YACC_PARSER.new_left_char_terminal */
extern T0* T50f160(T0* C, T0* a1, T6 a2);
/* PR_TOKEN.set_left_associative */
extern void T85f25(T0* C);
/* PR_YACC_PARSER.new_left_terminal */
extern T0* T50f159(T0* C, T0* a1, T6 a2);
/* PR_YACC_PARSER.new_char_terminal */
extern T0* T50f158(T0* C, T0* a1, T0* a2);
/* PR_TOKEN.set_type */
extern void T85f24(T0* C, T0* a1);
/* PR_TOKEN.set_declared */
extern void T85f23(T0* C);
/* PR_YACC_PARSER.report_token_declared_twice_error */
extern void T50f325(T0* C, T0* a1);
/* PR_TOKEN_DECLARED_TWICE_ERROR.make */
extern T0* T176c7(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.set_literal_string */
extern void T50f289(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].force */
extern void T127f39(T0* C, T0* a1, T0* a2);
/* PR_YACC_PARSER.report_string_token_defined_twice_error */
extern void T50f319(T0* C, T0* a1, T0* a2, T0* a3);
/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR.make */
extern T0* T165c7(T0* a1, T6 a2, T0* a3, T0* a4, T0* a5);
/* PR_YACC_PARSER.report_two_strings_token_error */
extern void T50f318(T0* C, T0* a1, T0* a2, T0* a3);
/* PR_TWO_STRINGS_TOKEN_ERROR.make */
extern T0* T164c7(T0* a1, T6 a2, T0* a3, T0* a4, T0* a5);
/* PR_YACC_PARSER.set_token_id */
extern void T50f288(T0* C, T0* a1, T6 a2);
/* PR_YACC_PARSER.report_two_token_ids_token_error */
extern void T50f317(T0* C, T0* a1, T6 a2, T6 a3);
/* PR_TWO_TOKEN_IDS_TOKEN_ERROR.make */
extern T0* T163c7(T0* a1, T6 a2, T0* a3, T6 a4, T6 a5);
/* PR_TOKEN.has_token_id */
extern T1 T85f14(T0* C);
/* PR_YACC_PARSER.new_terminal */
extern T0* T50f154(T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_LIST [PR_TYPE].force_last */
extern void T113f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TYPE].resize */
extern void T113f15(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_TYPE].new_capacity */
extern T6 T113f11(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_TYPE].extendible */
extern T1 T113f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [PR_TYPE].make */
extern T0* T113c13(T6 a1);
/* DS_ARRAYED_LIST [PR_TYPE].new_cursor */
extern T0* T113f9(T0* C);
/* DS_ARRAYED_LIST_CURSOR [PR_TYPE].make */
extern T0* T233c3(T0* a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_TYPE]].resize */
extern T0* T141f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_ARRAYED_LIST [PR_TYPE]].aliased_resized_area */
extern T0* T140f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_TYPE]].make */
extern T0* T141f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_ARRAYED_LIST [PR_TYPE]].make_area */
extern T0* T248c2(T6 a1);
/* SPECIAL [DS_ARRAYED_LIST [PR_TYPE]].make */
extern T0* T140c4(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_TYPE]].default_create */
extern T0* T141c3(void);
/* PR_YACC_PARSER.new_anchored_type */
extern T0* T50f151(T0* C, T0* a1);
/* PR_GRAMMAR.put_type */
extern void T29f31(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TYPE].put_last */
extern void T113f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST [PR_TYPE].is_full */
extern T1 T113f12(T0* C);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].force_new */
extern void T129f38(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].key_storage_put */
extern void T129f46(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].item_storage_put */
extern void T129f45(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].slots_put */
extern void T129f44(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].clashes_put */
extern void T129f43(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].slots_item */
extern T6 T129f29(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].hash_position */
extern T6 T129f28(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].clashes_item */
extern T6 T129f27(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].resize */
extern void T129f42(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].clashes_resize */
extern void T129f51(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].special_integer_ */
extern T0* T129f31(T0* C);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].key_storage_resize */
extern void T129f50(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].item_storage_resize */
extern void T129f49(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].key_storage_item */
extern T0* T129f23(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].slots_resize */
extern void T129f48(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].new_modulus */
extern T6 T129f24(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].new_capacity */
extern T6 T129f34(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].unset_found_item */
extern void T129f41(T0* C);
/* PR_TYPE.make_anchored */
extern T0* T100c10(T6 a1, T0* a2);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].found_item */
extern T0* T129f33(T0* C);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].item_storage_item */
extern T0* T129f32(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].found */
extern T1 T129f21(T0* C);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].search */
extern void T129f37(T0* C, T0* a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].search_position */
extern void T129f40(T0* C, T0* a1);
/* PR_YACC_PARSER.new_generic_type */
extern T0* T50f150(T0* C, T0* a1, T0* a2);
/* STRING_8.as_upper */
extern T0* T17f6(T0* C);
/* STRING_8.to_upper */
extern void T17f35(T0* C);
/* STRING_8.to_upper_area */
extern void T17f40(T0* C, T0* a1, T6 a2, T6 a3);
/* CHARACTER_8.upper */
extern T2 T2f2(T2* C);
/* CHARACTER_8.is_lower */
extern T1 T2f4(T2* C);
/* PR_TYPE.make_generic */
extern T0* T100c9(T6 a1, T0* a2, T0* a3);
/* PR_YACC_PARSER.new_basic_type */
extern T0* T50f148(T0* C, T0* a1);
/* PR_BASIC_TYPE.make */
extern T0* T173c8(T6 a1, T0* a2);
/* KL_SPECIAL_ROUTINES [PR_TYPE].resize */
extern T0* T139f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [PR_TYPE].aliased_resized_area */
extern T0* T138f3(T0* C, T6 a1);
/* PR_YACC_PARSER.new_type */
extern T0* T50f145(T0* C, T0* a1);
/* PR_YACC_PARSER.no_type */
extern unsigned char ge201os3896;
extern T0* ge201ov3896;
extern T0* T50f143(T0* C);
/* PR_GRAMMAR.set_expected_conflicts */
extern void T29f24(T0* C, T6 a1);
/* DS_PAIR [STRING_8, INTEGER_32].make */
extern T0* T137c3(T0* a1, T6 a2);
/* PR_YACC_PARSER.report_multiple_start_declarations_error */
extern void T50f287(T0* C);
/* PR_MULTIPLE_START_DECLARATIONS_ERROR.make */
extern T0* T147c7(T0* a1, T6 a2);
/* DS_ARRAYED_LIST [STRING_8].force_last */
extern void T112f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].resize */
extern void T112f12(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].new_capacity */
extern T6 T112f9(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].extendible */
extern T1 T112f8(T0* C, T6 a1);
/* PR_YACC_PARSER.initialize_grammar */
extern void T50f286(T0* C);
/* PR_YACC_PARSER.process_symbols */
extern void T50f285(T0* C);
/* PR_YACC_PARSER.report_undefined_symbol_error */
extern void T50f316(T0* C, T0* a1);
/* PR_UNDEFINED_SYMBOL_ERROR.make */
extern T0* T162c7(T0* a1, T0* a2);
/* ARRAY [PR_TOKEN].put */
extern void T146f6(T0* C, T0* a1, T6 a2);
/* PR_YACC_PARSER.report_token_id_used_twice_warning */
extern void T50f315(T0* C, T0* a1, T0* a2);
/* PR_TOKEN_ID_USED_TWICE_ERROR.make */
extern T0* T161c7(T0* a1, T0* a2, T0* a3, T6 a4);
/* ARRAY [PR_TOKEN].item */
extern T0* T146f4(T0* C, T6 a1);
/* ARRAY [PR_TOKEN].make */
extern T0* T146c5(T6 a1, T6 a2);
/* ARRAY [PR_TOKEN].make_area */
extern void T146f7(T0* C, T6 a1);
/* PR_YACC_PARSER.set_start_symbol */
extern void T50f284(T0* C);
/* DS_ARRAYED_LIST [PR_RULE].first */
extern T0* T71f10(T0* C);
/* PR_GRAMMAR.set_start_symbol */
extern void T29f26(T0* C, T0* a1);
/* PR_YACC_PARSER.report_unknown_start_symbol_error */
extern void T50f314(T0* C);
/* PR_UNKNOWN_START_SYMBOL_ERROR.make */
extern T0* T160c7(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.report_start_symbol_token_error */
extern void T50f313(T0* C);
/* PR_START_SYMBOL_TOKEN_ERROR.make */
extern T0* T159c7(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.yy_push_last_value */
extern void T50f271(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].make */
extern T0* T136f1(T0* C, T6 a1);
/* TO_SPECIAL [STRING_8].make_area */
extern T0* T246c2(T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].default_create */
extern T0* T136c3(void);
/* PR_YACC_PARSER.accept */
extern void T50f270(T0* C);
/* PR_YACC_PARSER.yy_do_error_action */
extern void T50f268(T0* C, T6 a1);
/* PR_YACC_PARSER.report_error */
extern void T50f283(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.make */
extern T0* T145c7(T0* a1, T6 a2);
/* PR_YACC_PARSER.report_eof_expected_error */
extern void T50f282(T0* C);
/* PR_YACC_PARSER.read_token */
extern void T50f267(T0* C);
/* PR_YACC_PARSER.yy_execute_action */
extern void T50f281(T0* C, T6 a1);
/* PR_YACC_PARSER.text_item */
extern T2 T50f228(T0* C, T6 a1);
/* STRING_8.wipe_out */
extern void T17f31(T0* C);
/* PR_YACC_PARSER.cloned_string */
extern T0* T50f184(T0* C, T0* a1);
/* PR_YACC_PARSER.report_integer_too_large_error */
extern void T50f312(T0* C, T0* a1);
/* PR_INTEGER_TOO_LARGE_ERROR.make */
extern T0* T158c7(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.process_dollar_n */
extern void T50f311(T0* C, T6 a1, T6 a2, T0* a3);
/* PR_BASIC_TYPE.append_dollar_n_to_string */
extern void T173f23(T0* C, T6 a1, T6 a2, T0* a3, T0* a4);
/* PR_BASIC_TYPE.integer_ */
extern T0* T173f7(T0* C);
/* PR_TYPE.append_dollar_n_to_string */
extern void T100f25(T0* C, T6 a1, T6 a2, T0* a3, T0* a4);
/* PR_TYPE.integer_ */
extern T0* T100f4(T0* C);
/* PR_BASIC_TYPE.old_append_dollar_n_to_string */
extern void T173f22(T0* C, T6 a1, T6 a2, T0* a3, T0* a4);
/* PR_TYPE.old_append_dollar_n_to_string */
extern void T100f24(T0* C, T6 a1, T6 a2, T0* a3, T0* a4);
/* PR_YACC_PARSER.report_invalid_dollar_n_error */
extern void T50f322(T0* C, T6 a1);
/* PR_INVALID_DOLLAR_N_ERROR.make */
extern T0* T167c7(T0* a1, T6 a2, T6 a3);
/* PR_YACC_PARSER.report_dangerous_dollar_n_warning */
extern void T50f321(T0* C, T6 a1);
/* PR_DANGEROUS_DOLLAR_N_ERROR.make */
extern T0* T166c7(T0* a1, T6 a2, T6 a3);
/* STRING_8.is_integer */
extern T1 T17f15(T0* C);
/* STRING_8.is_valid_integer_or_natural */
extern T1 T17f23(T0* C, T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.is_integral_integer */
extern T1 T255f12(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
extern void T255f17(T0* C, T0* a1, T6 a2);
/* STRING_TO_INTEGER_CONVERTOR.parse_character */
extern void T255f23(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflowed */
extern T1 T255f15(T0* C);
/* INTEGER_OVERFLOW_CHECKER.will_overflow */
extern T1 T290f7(T0* C, T11 a1, T11 a2, T6 a3, T6 a4);
/* NATURAL_64.infix ">" */
extern T1 T11f4(T11* C, T11 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
extern unsigned char ge588os6188;
extern T0* ge588ov6188;
extern T0* T255f14(T0* C);
/* INTEGER_OVERFLOW_CHECKER.make */
extern T0* T290c13(void);
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
extern T0* T306c2(T6 a1);
/* STRING_8.has */
extern T1 T17f28(T0* C, T2 a1);
/* INTEGER_32.to_natural_64 */
extern T11 T6f25(T6* C);
/* CHARACTER_8.is_digit */
extern T1 T2f17(T2* C);
/* STRING_TO_INTEGER_CONVERTOR.reset */
extern void T255f18(T0* C, T6 a1);
/* STRING_8.ctoi_convertor */
extern unsigned char ge580os1267;
extern T0* ge580ov1267;
extern T0* T17f24(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
extern void T255f22(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
extern void T255f21(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
extern void T255f20(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
extern void T255f19(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.make */
extern T0* T255c16(void);
/* PR_YACC_PARSER.process_dollar_dollar */
extern void T50f310(T0* C, T0* a1);
/* PR_BASIC_TYPE.append_dollar_dollar_to_string */
extern void T173f10(T0* C, T0* a1);
/* PR_TYPE.append_dollar_dollar_to_string */
extern void T100f12(T0* C, T0* a1);
/* PR_BASIC_TYPE.old_append_dollar_dollar_to_string */
extern void T173f9(T0* C, T0* a1);
/* PR_TYPE.old_append_dollar_dollar_to_string */
extern void T100f11(T0* C, T0* a1);
/* PR_YACC_PARSER.report_invalid_dollar_dollar_error */
extern void T50f309(T0* C);
/* PR_INVALID_DOLLAR_DOLLAR_ERROR.make */
extern T0* T157c7(T0* a1, T6 a2);
/* PR_YACC_PARSER.start_condition */
extern T6 T50f226(T0* C);
/* PR_YACC_PARSER.text_substring */
extern T0* T50f181(T0* C, T6 a1, T6 a2);
/* KL_CHARACTER_BUFFER.substring */
extern T0* T267f6(T0* C, T6 a1, T6 a2);
/* PR_YACC_PARSER.more */
extern void T50f308(T0* C);
/* PR_YACC_PARSER.report_invalid_string_token_error */
extern void T50f307(T0* C, T0* a1);
/* PR_INVALID_STRING_TOKEN_ERROR.make */
extern T0* T156c7(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.text_count */
extern T6 T50f180(T0* C);
/* PR_YACC_PARSER.report_null_integer_error */
extern void T50f306(T0* C);
/* PR_NULL_INTEGER_ERROR.make */
extern T0* T155c7(T0* a1, T6 a2);
/* STRING_8.to_integer */
extern T6 T17f16(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
extern T6 T255f13(T0* C);
/* PR_YACC_PARSER.text */
extern T0* T50f202(T0* C);
/* PR_YACC_PARSER.set_start_condition */
extern void T50f304(T0* C, T6 a1);
/* PR_YACC_PARSER.yy_execute_eof_action */
extern void T50f280(T0* C, T6 a1);
/* PR_YACC_PARSER.terminate */
extern void T50f305(T0* C);
/* PR_YACC_PARSER.report_missing_characters_error */
extern void T50f303(T0* C, T0* a1);
/* PR_MISSING_CHARACTERS_ERROR.make */
extern T0* T154c7(T0* a1, T6 a2, T0* a3);
/* PR_YACC_PARSER.wrap */
extern T1 T50f123(T0* C);
/* PR_YACC_PARSER.yy_refill_input_buffer */
extern void T50f279(T0* C);
/* PR_YACC_PARSER.yy_set_content */
extern void T50f277(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.count */
extern T6 T267f4(T0* C);
/* YY_FILE_BUFFER.fill */
extern void T130f19(T0* C);
/* KL_CHARACTER_BUFFER.fill_from_stream */
extern T6 T267f5(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STDIN_FILE.read_to_string */
extern T6 T54f13(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STDIN_FILE.old_read_to_string */
extern T6 T54f16(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STDIN_FILE.file_gss */
extern T6 T54f17(T0* C, T14 a1, T14 a2, T6 a3);
/* SPECIAL [CHARACTER_8].item_address */
extern T14 T15f6(T0* C, T6 a1);
/* KL_STDIN_FILE.any_ */
extern T0* T54f14(T0* C);
/* KL_STDIN_FILE.old_end_of_file */
extern T1 T54f10(T0* C);
/* KL_STDIN_FILE.console_eof */
extern T1 T54f12(T0* C, T14 a1);
/* STRING_8.put */
extern void T17f44(T0* C, T2 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.read_to_string */
extern T6 T51f29(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
extern unsigned char ge310os4532;
extern T0* ge310ov4532;
extern T0* T51f33(T0* C);
/* KL_CHARACTER_BUFFER.make */
extern T0* T267c8(T6 a1);
/* KL_OPERATING_SYSTEM.is_dotnet */
extern unsigned char ge349os2906;
extern T1 ge349ov2906;
extern T1 T291f1(T0* C);
/* PLATFORM.default_create */
extern T0* T307c2(void);
/* KL_CHARACTER_BUFFER.operating_system */
extern unsigned char ge357os1963;
extern T0* ge357ov1963;
extern T0* T267f7(T0* C);
/* KL_OPERATING_SYSTEM.default_create */
extern T0* T291c2(void);
/* KL_TEXT_INPUT_FILE.old_read_to_string */
extern T6 T51f32(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.file_gss */
extern T6 T51f34(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.any_ */
extern T0* T51f30(T0* C);
/* KL_TEXT_INPUT_FILE.old_end_of_file */
extern T1 T51f26(T0* C);
/* KL_TEXT_INPUT_FILE.file_feof */
extern T1 T51f28(T0* C, T14 a1);
/* KL_CHARACTER_BUFFER.put */
extern void T267f9(T0* C, T2 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.end_of_input */
extern T1 T51f24(T0* C);
/* KL_STDIN_FILE.read_character */
extern void T54f23(T0* C);
/* KL_STDIN_FILE.old_read_character */
extern void T54f24(T0* C);
/* KL_STDIN_FILE.console_readchar */
extern T2 T54f11(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.read_character */
extern void T51f44(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_character */
extern void T51f45(T0* C);
/* KL_TEXT_INPUT_FILE.file_gc */
extern T2 T51f27(T0* C, T14 a1);
/* YY_FILE_BUFFER.compact_left */
extern void T130f21(T0* C);
/* KL_CHARACTER_BUFFER.move_left */
extern void T267f10(T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.subcopy */
extern void T17f45(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* YY_FILE_BUFFER.resize */
extern void T130f23(T0* C);
/* KL_CHARACTER_BUFFER.resize */
extern void T267f11(T0* C, T6 a1);
/* YY_FILE_BUFFER.default_capacity */
extern unsigned char ge131os5630;
extern T6 ge131ov5630;
extern T6 T130f13(T0* C);
/* YY_BUFFER.fill */
extern void T131f15(T0* C);
/* YY_FILE_BUFFER.set_index */
extern void T130f17(T0* C, T6 a1);
/* YY_BUFFER.set_index */
extern void T131f13(T0* C, T6 a1);
/* PR_YACC_PARSER.yy_null_trans_state */
extern T6 T50f122(T0* C, T6 a1);
/* PR_YACC_PARSER.yy_previous_state */
extern T6 T50f121(T0* C);
/* PR_YACC_PARSER.fatal_error */
extern void T50f278(T0* C, T0* a1);
/* KL_STDERR_FILE.put_character */
extern void T125f13(T0* C, T2 a1);
/* KL_STDERR_FILE.old_put_character */
extern void T125f17(T0* C, T2 a1);
/* KL_STDERR_FILE.console_pc */
extern void T125f21(T0* C, T14 a1, T2 a2);
/* KL_STANDARD_FILES.error */
extern unsigned char ge323os2897;
extern T0* ge323ov2897;
extern T0* T35f3(T0* C);
/* KL_STDERR_FILE.make */
extern T0* T125c9(void);
/* KL_STDERR_FILE.make_open_stderr */
extern void T125f14(T0* C, T0* a1);
/* KL_STDERR_FILE.set_write_mode */
extern void T125f19(T0* C);
/* KL_STDERR_FILE.console_def */
extern T14 T125f6(T0* C, T6 a1);
/* KL_STDERR_FILE.old_make */
extern void T125f18(T0* C, T0* a1);
/* PR_YACC_PARSER.std */
extern T0* T50f178(T0* C);
/* KL_CHARACTER_BUFFER.item */
extern T2 T267f3(T0* C, T6 a1);
/* PR_YACC_PARSER.special_integer_ */
extern T0* T50f111(T0* C);
/* PR_YACC_PARSER.yy_init_value_stacks */
extern void T50f266(T0* C);
/* PR_YACC_PARSER.yy_clear_all */
extern void T50f275(T0* C);
/* PR_YACC_PARSER.clear_all */
extern void T50f301(T0* C);
/* PR_YACC_PARSER.clear_stacks */
extern void T50f320(T0* C);
/* PR_YACC_PARSER.yy_clear_value_stacks */
extern void T50f323(T0* C);
/* SPECIAL [DS_ARRAYED_LIST [PR_TYPE]].clear_all */
extern void T140f6(T0* C);
/* SPECIAL [DS_ARRAYED_LIST [PR_TYPE]].put_default */
extern void T140f7(T0* C, T6 a1);
/* SPECIAL [PR_TYPE].clear_all */
extern void T138f6(T0* C);
/* SPECIAL [PR_TYPE].put_default */
extern void T138f7(T0* C, T6 a1);
/* SPECIAL [PR_TOKEN].clear_all */
extern void T142f6(T0* C);
/* SPECIAL [PR_TOKEN].put_default */
extern void T142f7(T0* C, T6 a1);
/* SPECIAL [INTEGER_32].clear_all */
extern void T102f9(T0* C);
/* SPECIAL [STRING_8].clear_all */
extern void T123f6(T0* C);
/* SPECIAL [STRING_8].put_default */
extern void T123f7(T0* C, T6 a1);
/* SPECIAL [ANY].clear_all */
extern void T134f5(T0* C);
/* SPECIAL [ANY].put_default */
extern void T134f6(T0* C, T6 a1);
/* PR_YACC_PARSER.abort */
extern void T50f269(T0* C);
/* PR_YACC_PARSER.set_input_buffer */
extern void T50f260(T0* C, T0* a1);
/* PR_YACC_PARSER.yy_load_input_buffer */
extern void T50f265(T0* C);
/* YY_FILE_BUFFER.set_position */
extern void T130f18(T0* C, T6 a1, T6 a2, T6 a3);
/* YY_BUFFER.set_position */
extern void T131f14(T0* C, T6 a1, T6 a2, T6 a3);
/* PR_YACC_PARSER.new_file_buffer */
extern T0* T50f224(T0* C, T0* a1);
/* YY_FILE_BUFFER.make */
extern T0* T130c16(T0* a1);
/* YY_FILE_BUFFER.make_with_size */
extern void T130f20(T0* C, T0* a1, T6 a2);
/* YY_FILE_BUFFER.set_file */
extern void T130f22(T0* C, T0* a1);
/* YY_FILE_BUFFER.flush */
extern void T130f24(T0* C);
/* YY_FILE_BUFFER.new_default_buffer */
extern T0* T130f15(T0* C, T6 a1);
/* KL_TEXT_INPUT_FILE.is_open_read */
extern T1 T51f11(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_read */
extern T1 T51f19(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T51f37(T0* C);
/* KL_TEXT_INPUT_FILE.is_closed */
extern T1 T51f16(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_closed */
extern T1 T51f10(T0* C);
/* KL_TEXT_INPUT_FILE.old_open_read */
extern void T51f41(T0* C);
/* KL_TEXT_INPUT_FILE.default_pointer */
extern T14 T51f20(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T51f41p1(T0* C);
/* KL_TEXT_INPUT_FILE.file_open */
extern T14 T51f21(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.old_is_readable */
extern T1 T51f15(T0* C);
/* UNIX_FILE_INFO.is_readable */
extern T1 T181f5(T0* C);
/* UNIX_FILE_INFO.file_eaccess */
extern T1 T181f3(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.buffered_file_info */
extern unsigned char ge559os2160;
extern T0* ge559ov2160;
extern T0* T51f23(T0* C);
/* UNIX_FILE_INFO.make */
extern T0* T181c6(void);
/* UNIX_FILE_INFO.make_buffered_file_info */
extern void T181f8(T0* C, T6 a1);
/* UNIX_FILE_INFO.stat_size */
extern T6 T181f4(T0* C);
/* KL_TEXT_INPUT_FILE.set_buffer */
extern void T51f43(T0* C);
/* UNIX_FILE_INFO.update */
extern void T181f7(T0* C, T0* a1);
/* UNIX_FILE_INFO.file_stat */
extern void T181f9(T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.old_exists */
extern T1 T51f14(T0* C);
/* KL_TEXT_INPUT_FILE.file_exists */
extern T1 T51f22(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.make */
extern T0* T51c35(T0* a1);
/* KL_TEXT_INPUT_FILE.old_make */
extern void T51f39(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.string_ */
extern T0* T51f25(T0* C);
/* PR_YACC_PARSER.set_old_typing */
extern void T50f256(T0* C, T1 a1);
/* PR_YACC_PARSER.make */
extern T0* T50c255(T0* a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].make */
extern T0* T129c36(T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].make_with_equality_testers */
extern void T129f39(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [PR_TYPE, STRING_8].make */
extern T0* T241c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [PR_TYPE, STRING_8].new_cursor */
extern T0* T241f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [PR_TYPE, STRING_8].make */
extern T0* T287c3(T0* a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].new_cursor */
extern T0* T129f30(T0* C);
/* DS_HASH_TABLE_CURSOR [PR_TYPE, STRING_8].make */
extern T0* T243c3(T0* a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].make_sparse_container */
extern void T129f47(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].make_slots */
extern void T129f55(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].make_clashes */
extern void T129f54(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].make_key_storage */
extern void T129f53(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TYPE, STRING_8].make_item_storage */
extern void T129f52(T0* C, T6 a1);
/* KL_EQUALITY_TESTER [STRING_8].default_create */
extern T0* T42c3(void);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].make */
extern T0* T128c37(T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].make_with_equality_testers */
extern void T128f42(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [PR_VARIABLE, STRING_8].make */
extern T0* T238c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [PR_VARIABLE, STRING_8].new_cursor */
extern T0* T238f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [PR_VARIABLE, STRING_8].make */
extern T0* T286c3(T0* a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].new_cursor */
extern T0* T128f31(T0* C);
/* DS_HASH_TABLE_CURSOR [PR_VARIABLE, STRING_8].make */
extern T0* T240c3(T0* a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].make_sparse_container */
extern void T128f49(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].make_slots */
extern void T128f57(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].make_clashes */
extern void T128f56(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].make_key_storage */
extern void T128f55(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_VARIABLE, STRING_8].make_item_storage */
extern void T128f54(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].make */
extern T0* T127c38(T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].make_with_equality_testers */
extern void T127f43(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [PR_TOKEN, STRING_8].make */
extern T0* T235c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [PR_TOKEN, STRING_8].new_cursor */
extern T0* T235f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [PR_TOKEN, STRING_8].make */
extern T0* T285c3(T0* a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].new_cursor */
extern T0* T127f32(T0* C);
/* DS_HASH_TABLE_CURSOR [PR_TOKEN, STRING_8].make */
extern T0* T237c3(T0* a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].make_sparse_container */
extern void T127f50(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].make_slots */
extern void T127f58(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].make_clashes */
extern void T127f57(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].make_key_storage */
extern void T127f56(T0* C, T6 a1);
/* DS_HASH_TABLE [PR_TOKEN, STRING_8].make_item_storage */
extern void T127f55(T0* C, T6 a1);
/* PR_GRAMMAR.make */
extern T0* T29c19(void);
/* DS_ARRAYED_LIST [STRING_8].make */
extern T0* T112c10(T6 a1);
/* DS_ARRAYED_LIST [STRING_8].new_cursor */
extern T0* T112f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].make */
extern T0* T232c3(T0* a1);
/* PR_ACTION_FACTORY.make */
extern T0* T126c2(void);
/* PR_YACC_PARSER.make_parser_skeleton */
extern void T50f259(T0* C);
/* PR_YACC_PARSER.yy_build_parser_tables */
extern void T50f264(T0* C);
/* PR_YACC_PARSER.yycheck_template */
extern unsigned char ge200os3791;
extern T0* ge200ov3791;
extern T0* T50f128(T0* C);
/* PR_YACC_PARSER.yyfixed_array */
extern T0* T50f241(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].to_special */
extern T0* T132f3(T0* C, T0* a1);
/* PR_YACC_PARSER.yytable_template */
extern unsigned char ge200os3790;
extern T0* ge200ov3790;
extern T0* T50f127(T0* C);
/* PR_YACC_PARSER.yypgoto_template */
extern unsigned char ge200os3789;
extern T0* ge200ov3789;
extern T0* T50f124(T0* C);
/* PR_YACC_PARSER.yypact_template */
extern unsigned char ge200os3788;
extern T0* ge200ov3788;
extern T0* T50f118(T0* C);
/* PR_YACC_PARSER.yydefgoto_template */
extern unsigned char ge200os3787;
extern T0* ge200ov3787;
extern T0* T50f117(T0* C);
/* PR_YACC_PARSER.yydefact_template */
extern unsigned char ge200os3786;
extern T0* ge200ov3786;
extern T0* T50f116(T0* C);
/* PR_YACC_PARSER.yytypes2_template */
extern unsigned char ge200os3785;
extern T0* ge200ov3785;
extern T0* T50f114(T0* C);
/* PR_YACC_PARSER.yytypes1_template */
extern unsigned char ge200os3784;
extern T0* ge200ov3784;
extern T0* T50f110(T0* C);
/* PR_YACC_PARSER.yyr1_template */
extern unsigned char ge200os3783;
extern T0* ge200ov3783;
extern T0* T50f106(T0* C);
/* PR_YACC_PARSER.yytranslate_template */
extern unsigned char ge200os3782;
extern T0* ge200ov3782;
extern T0* T50f105(T0* C);
/* PR_YACC_PARSER.yy_create_value_stacks */
extern void T50f263(T0* C);
/* PR_YACC_PARSER.make_yacc_scanner */
extern void T50f258(T0* C, T0* a1);
/* PR_YACC_PARSER.make_with_buffer */
extern void T50f262(T0* C, T0* a1);
/* PR_YACC_PARSER.yy_initialize */
extern void T50f276(T0* C);
/* PR_YACC_PARSER.yy_build_tables */
extern void T50f302(T0* C);
/* PR_YACC_PARSER.yy_accept_template */
extern unsigned char ge202os4301;
extern T0* ge202ov4301;
extern T0* T50f238(T0* C);
/* PR_YACC_PARSER.yy_fixed_array */
extern T0* T50f254(T0* C, T0* a1);
/* PR_YACC_PARSER.yy_meta_template */
extern unsigned char ge202os4300;
extern T0* ge202ov4300;
extern T0* T50f237(T0* C);
/* PR_YACC_PARSER.yy_ec_template */
extern unsigned char ge202os4299;
extern T0* ge202ov4299;
extern T0* T50f236(T0* C);
/* PR_YACC_PARSER.yy_def_template */
extern unsigned char ge202os4298;
extern T0* ge202ov4298;
extern T0* T50f235(T0* C);
/* PR_YACC_PARSER.yy_base_template */
extern unsigned char ge202os4297;
extern T0* ge202ov4297;
extern T0* T50f234(T0* C);
/* PR_YACC_PARSER.yy_chk_template */
extern unsigned char ge202os4296;
extern T0* ge202ov4296;
extern T0* T50f233(T0* C);
/* PR_YACC_PARSER.yy_nxt_template */
extern unsigned char ge202os4295;
extern T0* ge202ov4295;
extern T0* T50f232(T0* C);
/* PR_YACC_PARSER.empty_buffer */
extern unsigned char ge136os4150;
extern T0* ge136ov4150;
extern T0* T50f132(T0* C);
/* YY_BUFFER.make */
extern T0* T131c12(T0* a1);
/* YY_BUFFER.make_from_buffer */
extern void T131f16(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.fill_from_string */
extern void T267f12(T0* C, T0* a1, T6 a2);
/* YY_BUFFER.new_default_buffer */
extern T0* T131f11(T0* C, T6 a1);
/* GEYACC.read_command_line */
extern void T21f20(T0* C);
/* GEYACC.report_usage_error */
extern void T21f24(T0* C);
/* GEYACC.usage_message */
extern unsigned char ge50os1773;
extern T0* ge50ov1773;
extern T0* T21f17(T0* C);
/* UT_USAGE_MESSAGE.make */
extern T0* T56c7(T0* a1);
/* GEYACC.report_usage_message */
extern void T21f23(T0* C);
/* UT_ERROR_HANDLER.report_info */
extern void T28f8(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_info_message */
extern void T28f11(T0* C, T0* a1);
/* GEYACC.report_version_number */
extern void T21f22(T0* C);
/* UT_VERSION_NUMBER.make */
extern T0* T55c7(T0* a1);
/* KL_ARGUMENTS.argument */
extern T0* T27f2(T0* C, T6 a1);
/* UT_ERROR_HANDLER.make_standard */
extern T0* T28c6(void);
/* UT_ERROR_HANDLER.std */
extern T0* T28f4(T0* C);
/* KL_ARGUMENTS.set_program_name */
extern void T27f5(T0* C, T0* a1);
/* GEYACC.arguments */
extern unsigned char ge352os1778;
extern T0* ge352ov1778;
extern T0* T21f13(T0* C);
/* KL_ARGUMENTS.make */
extern T0* T27c4(void);
/* GEYACC.resurrect_code */
extern void T21f19(T0* C);
/* KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_STATE]].default_create */
extern T0* T49c1(void);
/* KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_VARIABLE]].default_create */
extern T0* T48c1(void);
/* KL_EQUALITY_TESTER [PR_CONFLICT].default_create */
extern T0* T47c1(void);
/* KL_EQUALITY_TESTER [PR_PORTION].default_create */
extern T0* T46c1(void);
/* KL_EQUALITY_TESTER [PR_STATE].default_create */
extern T0* T45c1(void);
/* KL_EQUALITY_TESTER [PR_REDUCTION].default_create */
extern T0* T44c1(void);
/* KL_EQUALITY_TESTER [PR_TRANSITION].default_create */
extern T0* T43c1(void);
/* KL_EQUALITY_TESTER [PR_TYPE].default_create */
extern T0* T40c1(void);
/* KL_EQUALITY_TESTER [PR_VARIABLE].default_create */
extern T0* T39c1(void);
/* KL_EQUALITY_TESTER [PR_TOKEN].default_create */
extern T0* T38c1(void);
/* KL_EQUALITY_TESTER [PR_RULE].default_create */
extern T0* T37c1(void);
/* KL_TEXT_INPUT_FILE.dispose */
extern void T51f36(T0* C);
/* KL_TEXT_OUTPUT_FILE.dispose */
extern void T24f21(T0* C);
/* PR_PRECEDENCE_DEFINED_TWICE_ERROR.default_message */
extern T0* T180f5(T0* C);
/* PR_PRECEDENCE_DEFINED_TWICE_ERROR.message */
extern T0* T180f3(T0* C, T0* a1);
/* PR_PRECEDENCE_DEFINED_TWICE_ERROR.arguments */
extern T0* T180f6(T0* C);
/* KL_STRING_ROUTINES.appended_string */
extern T0* T119f5(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.concat */
extern T0* T119f10(T0* C, T0* a1, T0* a2);
/* STRING_8.infix "+" */
extern T0* T17f21(T0* C, T0* a1);
/* ARRAY [STRING_8].item */
extern T0* T124f5(T0* C, T6 a1);
/* ARRAY [STRING_8].valid_index */
extern T1 T124f4(T0* C, T6 a1);
/* KL_STRING_ROUTINES.append_substring_to_string */
extern void T119f12(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* KL_STRING_ROUTINES.appended_substring */
extern T0* T119f4(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* KL_STRING_ROUTINES.new_empty_string */
extern T0* T119f3(T0* C, T0* a1, T6 a2);
/* KL_STRING_ROUTINES.cloned_string */
extern T0* T119f9(T0* C, T0* a1);
/* PR_PRECEDENCE_DEFINED_TWICE_ERROR.string_ */
extern T0* T180f4(T0* C);
/* PR_UNDEFINED_STRING_TOKEN_ERROR.default_message */
extern T0* T179f5(T0* C);
/* PR_UNDEFINED_STRING_TOKEN_ERROR.message */
extern T0* T179f3(T0* C, T0* a1);
/* PR_UNDEFINED_STRING_TOKEN_ERROR.arguments */
extern T0* T179f6(T0* C);
/* PR_UNDEFINED_STRING_TOKEN_ERROR.string_ */
extern T0* T179f4(T0* C);
/* PR_VARIABLE_DECLARED_TWICE_ERROR.default_message */
extern T0* T178f5(T0* C);
/* PR_VARIABLE_DECLARED_TWICE_ERROR.message */
extern T0* T178f3(T0* C, T0* a1);
/* PR_VARIABLE_DECLARED_TWICE_ERROR.arguments */
extern T0* T178f6(T0* C);
/* PR_VARIABLE_DECLARED_TWICE_ERROR.string_ */
extern T0* T178f4(T0* C);
/* PR_SYMBOL_DECLARED_TOKEN_ERROR.default_message */
extern T0* T177f5(T0* C);
/* PR_SYMBOL_DECLARED_TOKEN_ERROR.message */
extern T0* T177f3(T0* C, T0* a1);
/* PR_SYMBOL_DECLARED_TOKEN_ERROR.arguments */
extern T0* T177f6(T0* C);
/* PR_SYMBOL_DECLARED_TOKEN_ERROR.string_ */
extern T0* T177f4(T0* C);
/* PR_TOKEN_DECLARED_TWICE_ERROR.default_message */
extern T0* T176f5(T0* C);
/* PR_TOKEN_DECLARED_TWICE_ERROR.message */
extern T0* T176f3(T0* C, T0* a1);
/* PR_TOKEN_DECLARED_TWICE_ERROR.arguments */
extern T0* T176f6(T0* C);
/* PR_TOKEN_DECLARED_TWICE_ERROR.string_ */
extern T0* T176f4(T0* C);
/* PR_SYMBOL_DECLARED_VARIABLE_ERROR.default_message */
extern T0* T175f5(T0* C);
/* PR_SYMBOL_DECLARED_VARIABLE_ERROR.message */
extern T0* T175f3(T0* C, T0* a1);
/* PR_SYMBOL_DECLARED_VARIABLE_ERROR.arguments */
extern T0* T175f6(T0* C);
/* PR_SYMBOL_DECLARED_VARIABLE_ERROR.string_ */
extern T0* T175f4(T0* C);
/* PR_INVALID_DOLLAR_N_ERROR.default_message */
extern T0* T167f5(T0* C);
/* PR_INVALID_DOLLAR_N_ERROR.message */
extern T0* T167f3(T0* C, T0* a1);
/* PR_INVALID_DOLLAR_N_ERROR.arguments */
extern T0* T167f6(T0* C);
/* PR_INVALID_DOLLAR_N_ERROR.string_ */
extern T0* T167f4(T0* C);
/* PR_DANGEROUS_DOLLAR_N_ERROR.default_message */
extern T0* T166f5(T0* C);
/* PR_DANGEROUS_DOLLAR_N_ERROR.message */
extern T0* T166f3(T0* C, T0* a1);
/* PR_DANGEROUS_DOLLAR_N_ERROR.arguments */
extern T0* T166f6(T0* C);
/* PR_DANGEROUS_DOLLAR_N_ERROR.string_ */
extern T0* T166f4(T0* C);
/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR.default_message */
extern T0* T165f5(T0* C);
/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR.message */
extern T0* T165f3(T0* C, T0* a1);
/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR.arguments */
extern T0* T165f6(T0* C);
/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR.string_ */
extern T0* T165f4(T0* C);
/* PR_TWO_STRINGS_TOKEN_ERROR.default_message */
extern T0* T164f5(T0* C);
/* PR_TWO_STRINGS_TOKEN_ERROR.message */
extern T0* T164f3(T0* C, T0* a1);
/* PR_TWO_STRINGS_TOKEN_ERROR.arguments */
extern T0* T164f6(T0* C);
/* PR_TWO_STRINGS_TOKEN_ERROR.string_ */
extern T0* T164f4(T0* C);
/* PR_TWO_TOKEN_IDS_TOKEN_ERROR.default_message */
extern T0* T163f5(T0* C);
/* PR_TWO_TOKEN_IDS_TOKEN_ERROR.message */
extern T0* T163f3(T0* C, T0* a1);
/* PR_TWO_TOKEN_IDS_TOKEN_ERROR.arguments */
extern T0* T163f6(T0* C);
/* PR_TWO_TOKEN_IDS_TOKEN_ERROR.string_ */
extern T0* T163f4(T0* C);
/* PR_UNDEFINED_SYMBOL_ERROR.default_message */
extern T0* T162f5(T0* C);
/* PR_UNDEFINED_SYMBOL_ERROR.message */
extern T0* T162f3(T0* C, T0* a1);
/* PR_UNDEFINED_SYMBOL_ERROR.arguments */
extern T0* T162f6(T0* C);
/* PR_UNDEFINED_SYMBOL_ERROR.string_ */
extern T0* T162f4(T0* C);
/* PR_TOKEN_ID_USED_TWICE_ERROR.default_message */
extern T0* T161f5(T0* C);
/* PR_TOKEN_ID_USED_TWICE_ERROR.message */
extern T0* T161f3(T0* C, T0* a1);
/* PR_TOKEN_ID_USED_TWICE_ERROR.arguments */
extern T0* T161f6(T0* C);
/* PR_TOKEN_ID_USED_TWICE_ERROR.string_ */
extern T0* T161f4(T0* C);
/* PR_UNKNOWN_START_SYMBOL_ERROR.default_message */
extern T0* T160f5(T0* C);
/* PR_UNKNOWN_START_SYMBOL_ERROR.message */
extern T0* T160f3(T0* C, T0* a1);
/* PR_UNKNOWN_START_SYMBOL_ERROR.arguments */
extern T0* T160f6(T0* C);
/* PR_UNKNOWN_START_SYMBOL_ERROR.string_ */
extern T0* T160f4(T0* C);
/* PR_START_SYMBOL_TOKEN_ERROR.default_message */
extern T0* T159f5(T0* C);
/* PR_START_SYMBOL_TOKEN_ERROR.message */
extern T0* T159f3(T0* C, T0* a1);
/* PR_START_SYMBOL_TOKEN_ERROR.arguments */
extern T0* T159f6(T0* C);
/* PR_START_SYMBOL_TOKEN_ERROR.string_ */
extern T0* T159f4(T0* C);
/* PR_INTEGER_TOO_LARGE_ERROR.default_message */
extern T0* T158f5(T0* C);
/* PR_INTEGER_TOO_LARGE_ERROR.message */
extern T0* T158f3(T0* C, T0* a1);
/* PR_INTEGER_TOO_LARGE_ERROR.arguments */
extern T0* T158f6(T0* C);
/* PR_INTEGER_TOO_LARGE_ERROR.string_ */
extern T0* T158f4(T0* C);
/* PR_INVALID_DOLLAR_DOLLAR_ERROR.default_message */
extern T0* T157f5(T0* C);
/* PR_INVALID_DOLLAR_DOLLAR_ERROR.message */
extern T0* T157f3(T0* C, T0* a1);
/* PR_INVALID_DOLLAR_DOLLAR_ERROR.arguments */
extern T0* T157f6(T0* C);
/* PR_INVALID_DOLLAR_DOLLAR_ERROR.string_ */
extern T0* T157f4(T0* C);
/* PR_INVALID_STRING_TOKEN_ERROR.default_message */
extern T0* T156f5(T0* C);
/* PR_INVALID_STRING_TOKEN_ERROR.message */
extern T0* T156f3(T0* C, T0* a1);
/* PR_INVALID_STRING_TOKEN_ERROR.arguments */
extern T0* T156f6(T0* C);
/* PR_INVALID_STRING_TOKEN_ERROR.string_ */
extern T0* T156f4(T0* C);
/* PR_NULL_INTEGER_ERROR.default_message */
extern T0* T155f5(T0* C);
/* PR_NULL_INTEGER_ERROR.message */
extern T0* T155f3(T0* C, T0* a1);
/* PR_NULL_INTEGER_ERROR.arguments */
extern T0* T155f6(T0* C);
/* PR_NULL_INTEGER_ERROR.string_ */
extern T0* T155f4(T0* C);
/* PR_MISSING_CHARACTERS_ERROR.default_message */
extern T0* T154f5(T0* C);
/* PR_MISSING_CHARACTERS_ERROR.message */
extern T0* T154f3(T0* C, T0* a1);
/* PR_MISSING_CHARACTERS_ERROR.arguments */
extern T0* T154f6(T0* C);
/* PR_MISSING_CHARACTERS_ERROR.string_ */
extern T0* T154f4(T0* C);
/* PR_PREC_NOT_TOKEN_ERROR.default_message */
extern T0* T153f5(T0* C);
/* PR_PREC_NOT_TOKEN_ERROR.message */
extern T0* T153f3(T0* C, T0* a1);
/* PR_PREC_NOT_TOKEN_ERROR.arguments */
extern T0* T153f6(T0* C);
/* PR_PREC_NOT_TOKEN_ERROR.string_ */
extern T0* T153f4(T0* C);
/* PR_PREC_SPECIFIED_TWICE_ERROR.default_message */
extern T0* T152f5(T0* C);
/* PR_PREC_SPECIFIED_TWICE_ERROR.message */
extern T0* T152f3(T0* C, T0* a1);
/* PR_PREC_SPECIFIED_TWICE_ERROR.arguments */
extern T0* T152f6(T0* C);
/* PR_PREC_SPECIFIED_TWICE_ERROR.string_ */
extern T0* T152f4(T0* C);
/* PR_INVALID_ERROR_N_ERROR.default_message */
extern T0* T151f5(T0* C);
/* PR_INVALID_ERROR_N_ERROR.message */
extern T0* T151f3(T0* C, T0* a1);
/* PR_INVALID_ERROR_N_ERROR.arguments */
extern T0* T151f6(T0* C);
/* PR_INVALID_ERROR_N_ERROR.string_ */
extern T0* T151f4(T0* C);
/* PR_RULE_DECLARED_TWICE_ERROR.default_message */
extern T0* T150f5(T0* C);
/* PR_RULE_DECLARED_TWICE_ERROR.message */
extern T0* T150f3(T0* C, T0* a1);
/* PR_RULE_DECLARED_TWICE_ERROR.arguments */
extern T0* T150f6(T0* C);
/* PR_RULE_DECLARED_TWICE_ERROR.string_ */
extern T0* T150f4(T0* C);
/* PR_LHS_SYMBOL_TOKEN_ERROR.default_message */
extern T0* T149f5(T0* C);
/* PR_LHS_SYMBOL_TOKEN_ERROR.message */
extern T0* T149f3(T0* C, T0* a1);
/* PR_LHS_SYMBOL_TOKEN_ERROR.arguments */
extern T0* T149f6(T0* C);
/* PR_LHS_SYMBOL_TOKEN_ERROR.string_ */
extern T0* T149f4(T0* C);
/* PR_NO_RULES_ERROR.default_message */
extern T0* T148f5(T0* C);
/* PR_NO_RULES_ERROR.message */
extern T0* T148f3(T0* C, T0* a1);
/* PR_NO_RULES_ERROR.arguments */
extern T0* T148f6(T0* C);
/* PR_NO_RULES_ERROR.string_ */
extern T0* T148f4(T0* C);
/* PR_MULTIPLE_START_DECLARATIONS_ERROR.default_message */
extern T0* T147f5(T0* C);
/* PR_MULTIPLE_START_DECLARATIONS_ERROR.message */
extern T0* T147f3(T0* C, T0* a1);
/* PR_MULTIPLE_START_DECLARATIONS_ERROR.arguments */
extern T0* T147f6(T0* C);
/* PR_MULTIPLE_START_DECLARATIONS_ERROR.string_ */
extern T0* T147f4(T0* C);
/* UT_SYNTAX_ERROR.default_message */
extern T0* T145f5(T0* C);
/* UT_SYNTAX_ERROR.message */
extern T0* T145f3(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.arguments */
extern T0* T145f6(T0* C);
/* UT_SYNTAX_ERROR.string_ */
extern T0* T145f4(T0* C);
/* UT_MESSAGE.default_message */
extern T0* T62f5(T0* C);
/* UT_MESSAGE.message */
extern T0* T62f3(T0* C, T0* a1);
/* UT_MESSAGE.arguments */
extern T0* T62f6(T0* C);
/* UT_MESSAGE.string_ */
extern T0* T62f4(T0* C);
/* UT_USAGE_MESSAGE.default_message */
extern T0* T56f2(T0* C);
/* UT_USAGE_MESSAGE.message */
extern T0* T56f4(T0* C, T0* a1);
/* UT_USAGE_MESSAGE.arguments */
extern T0* T56f6(T0* C);
/* UT_USAGE_MESSAGE.string_ */
extern T0* T56f5(T0* C);
/* UT_VERSION_NUMBER.default_message */
extern T0* T55f2(T0* C);
/* UT_VERSION_NUMBER.message */
extern T0* T55f4(T0* C, T0* a1);
/* UT_VERSION_NUMBER.arguments */
extern T0* T55f6(T0* C);
/* UT_VERSION_NUMBER.string_ */
extern T0* T55f5(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.default_message */
extern T0* T52f2(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.message */
extern T0* T52f4(T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.arguments */
extern T0* T52f6(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.string_ */
extern T0* T52f5(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
extern T0* T25f2(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
extern T0* T25f4(T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.arguments */
extern T0* T25f6(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
extern T0* T25f5(T0* C);
/* PR_ERROR_ACTION.is_equal */
extern T1 T70f4(T0* C, T0* a1);
/* PR_ACTION.is_equal */
extern T1 T174f3(T0* C, T0* a1);
/* PR_ACTION.any_ */
extern T0* T174f4(T0* C);
/* PR_ERROR_ACTION.any_ */
extern T0* T70f5(T0* C);
/* PR_POSITION.is_equal */
extern T1 T69f12(T0* C, T0* a1);
/* STRING_8.is_equal */
extern T1 T17f5(T0* C, T0* a1);
/* STRING_8.str_strict_cmp */
extern T6 T17f8(T0* C, T0* a1, T0* a2, T6 a3);
/* INTEGER_32.is_equal */
extern T1 T6f19(T6* C, T6 a1);
extern T0* GE_ma103(T6 c, T6 n, ...);
extern T0* ge344ov1775;
extern T0* ge180ov1845;
extern T0* ge217ov5494;
extern T0* ge217ov5493;
extern T0* ge217ov5492;
extern T0* ge217ov5491;
extern T0* ge284ov5483;
extern T0* ge326ov1914;
extern T0* ge417ov1914;
extern T0* ge180ov1847;
extern T0* ge324ov1914;
extern T0* ge306ov1944;
extern T0* ge325ov4818;
extern T0* ge310ov4531;
extern T0* ge50ov1769;
extern T0* ge156ov2639;
extern T0* ge168ov2639;
extern T0* ge171ov2639;
extern T0* ge162ov2639;
extern T0* ge164ov2639;
extern T0* ge163ov2639;
extern T0* ge148ov2639;
extern T0* ge145ov2639;
extern T0* ge161ov2639;
extern T0* ge166ov2639;
extern T0* ge167ov2639;
extern T0* ge169ov2639;
extern T0* ge165ov2639;
extern T0* ge170ov2639;
extern T0* ge160ov2639;
extern T0* ge146ov2639;
extern T0* ge147ov2639;
extern T0* ge150ov2639;
extern T0* ge155ov2639;
extern T0* ge152ov2639;
extern T0* ge157ov2639;
extern T0* ge158ov2639;
extern T0* ge149ov2639;
extern T0* ge159ov2639;
extern T0* ge151ov2639;
extern T0* ge154ov2639;
extern T0* ge153ov2639;
extern T0* ge211ov2639;
extern T0* ge209ov2639;
extern T0* ge215ov2639;
extern T0* ge216ov2639;
extern T0* ge205ov2639;
extern T0* ge206ov2639;
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
