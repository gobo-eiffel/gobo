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

/* GEPP */
typedef struct S21 T21;

/* KL_ARGUMENTS */
typedef struct S22 T22;

/* UT_ERROR_HANDLER */
typedef struct S23 T23;

/* GEPP_PARSER */
typedef struct S24 T24;

/* KL_EQUALITY_TESTER [STRING_8] */
typedef struct S25 T25;

/* KL_EXCEPTIONS */
typedef struct S26 T26;

/* KL_TEXT_INPUT_FILE */
typedef struct S27 T27;

/* KL_TEXT_OUTPUT_FILE */
typedef struct S28 T28;

/* KL_STANDARD_FILES */
typedef struct S30 T30;

/* KL_STDOUT_FILE */
typedef struct S31 T31;

/* KL_STDIN_FILE */
typedef struct S32 T32;

/* UT_VERSION_NUMBER */
typedef struct S34 T34;

/* UT_USAGE_MESSAGE */
typedef struct S36 T36;

/* UT_CANNOT_WRITE_TO_FILE_ERROR */
typedef struct S37 T37;

/* UT_CANNOT_READ_FILE_ERROR */
typedef struct S38 T38;

/* KL_STDERR_FILE */
typedef struct S39 T39;

/* DS_HASH_TABLE [STRING_8, STRING_8] */
typedef struct S40 T40;

/* DS_ARRAYED_STACK [INTEGER_32] */
typedef struct S41 T41;

/* DS_ARRAYED_STACK [YY_BUFFER] */
typedef struct S42 T42;

/* YY_FILE_BUFFER */
typedef struct S43 T43;

/* YY_BUFFER */
typedef struct S44 T44;

/* SPECIAL [INTEGER_32] */
typedef struct S45 T45;

/* KL_SPECIAL_ROUTINES [INTEGER_32] */
typedef struct S46 T46;

/* SPECIAL [ANY] */
typedef struct S48 T48;

/* KL_SPECIAL_ROUTINES [ANY] */
typedef struct S49 T49;

/* SPECIAL [STRING_8] */
typedef struct S50 T50;

/* KL_SPECIAL_ROUTINES [STRING_8] */
typedef struct S51 T51;

/* SPECIAL [BOOLEAN] */
typedef struct S52 T52;

/* KL_SPECIAL_ROUTINES [BOOLEAN] */
typedef struct S53 T53;

/* UT_MESSAGE */
typedef struct S54 T54;

/* UT_SYNTAX_ERROR */
typedef struct S55 T55;

/* GEPP_TOO_MANY_INCLUDES_ERROR */
typedef struct S56 T56;

/* KL_EXECUTION_ENVIRONMENT */
typedef struct S57 T57;

/* KL_STRING_ROUTINES */
typedef struct S58 T58;

/* TYPED_POINTER [ANY] */
typedef struct S61 T61;

/* KL_DIRECTORY */
typedef struct S62 T62;

/* ARRAY [STRING_8] */
typedef struct S64 T64;

/* ARRAY [INTEGER_32] */
typedef struct S65 T65;

/* UNIX_FILE_INFO */
typedef struct S66 T66;

/* KL_OPERATING_SYSTEM */
typedef struct S67 T67;

/* KL_WINDOWS_FILE_SYSTEM */
typedef struct S68 T68;

/* KL_UNIX_FILE_SYSTEM */
typedef struct S69 T69;

/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8] */
typedef struct S70 T70;

/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
typedef struct S72 T72;

/* SPECIAL [YY_BUFFER] */
typedef struct S73 T73;

/* KL_SPECIAL_ROUTINES [YY_BUFFER] */
typedef struct S74 T74;

/* TO_SPECIAL [INTEGER_32] */
typedef struct S75 T75;

/* TO_SPECIAL [ANY] */
typedef struct S76 T76;

/* TO_SPECIAL [STRING_8] */
typedef struct S77 T77;

/* TO_SPECIAL [BOOLEAN] */
typedef struct S78 T78;

/* EXECUTION_ENVIRONMENT */
typedef struct S79 T79;

/* KL_ANY_ROUTINES */
typedef struct S81 T81;

/* STRING_TO_INTEGER_CONVERTOR */
typedef struct S83 T83;

/* KL_CHARACTER_BUFFER */
typedef struct S85 T85;

/* TYPED_POINTER [SPECIAL [CHARACTER_8]] */
typedef struct S86 T86;

/* KL_PATHNAME */
typedef struct S88 T88;

/* DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8] */
typedef struct S89 T89;

/* TO_SPECIAL [YY_BUFFER] */
typedef struct S90 T90;

/* C_STRING */
typedef struct S91 T91;

/* INTEGER_OVERFLOW_CHECKER */
typedef struct S92 T92;

/* SPECIAL [NATURAL_8] */
typedef struct S94 T94;

/* MANAGED_POINTER */
typedef struct S95 T95;

/* SPECIAL [NATURAL_64] */
typedef struct S96 T96;

/* PLATFORM */
typedef struct S97 T97;

/* TYPED_POINTER [NATURAL_8] */
typedef struct S98 T98;

/* EXCEPTIONS */
typedef struct S99 T99;

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
struct S61 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type TYPED_POINTER [SPECIAL [CHARACTER_8]] */
struct S86 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type TYPED_POINTER [NATURAL_8] */
struct S98 {
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

/* Struct for type GEPP */
struct S21 {
	int id;
	T0* a1; /* error_handler */
	T0* a2; /* parser */
	T0* a3; /* in_filename */
	T0* a4; /* out_filename */
};

/* Struct for type KL_ARGUMENTS */
struct S22 {
	int id;
	T0* a1; /* program_name */
};

/* Struct for type UT_ERROR_HANDLER */
struct S23 {
	int id;
	T0* a1; /* error_file */
	T0* a2; /* warning_file */
	T0* a3; /* info_file */
};

/* Struct for type GEPP_PARSER */
struct S24 {
	int id;
	T6 a1; /* yy_parsing_status */
	T0* a2; /* error_handler */
	T0* a3; /* defined_values */
	T0* a4; /* line_nb_stack */
	T0* a5; /* include_stack */
	T1 a6; /* makefile_dependencies */
	T1 a7; /* empty_lines */
	T0* a8; /* output_file */
	T6 a9; /* line_nb */
	T0* a10; /* yyss */
	T0* a11; /* input_buffer */
	T6 a12; /* yy_end */
	T6 a13; /* yy_position */
	T6 a14; /* yy_line */
	T6 a15; /* yy_column */
	T6 a16; /* yy_suspended_yystacksize */
	T6 a17; /* yy_suspended_yystate */
	T6 a18; /* yy_suspended_yyn */
	T6 a19; /* yy_suspended_yychar1 */
	T6 a20; /* yy_suspended_index */
	T6 a21; /* yy_suspended_yyss_top */
	T6 a22; /* yy_suspended_yy_goto */
	T6 a23; /* error_count */
	T1 a24; /* yy_lookahead_needed */
	T6 a25; /* yyerrstatus */
	T6 a26; /* yyssp */
	T0* a27; /* yypact */
	T6 a28; /* last_token */
	T0* a29; /* yytranslate */
	T0* a30; /* yycheck */
	T0* a31; /* yytable */
	T0* a32; /* yydefact */
	T0* a33; /* yyr1 */
	T0* a34; /* yypgoto */
	T0* a35; /* yydefgoto */
	T0* a36; /* yytypes1 */
	T0* a37; /* yytypes2 */
	T6 a38; /* yy_start */
	T6 a39; /* yyvsp1 */
	T6 a40; /* yyvsp2 */
	T6 a41; /* yyvsp3 */
	T1 a42; /* yy_more_flag */
	T6 a43; /* yy_more_len */
	T6 a44; /* line */
	T6 a45; /* column */
	T6 a46; /* position */
	T6 a47; /* yy_start_state */
	T0* a48; /* yy_state_stack */
	T6 a49; /* yy_state_count */
	T0* a50; /* yy_ec */
	T0* a51; /* yy_content_area */
	T0* a52; /* yy_content */
	T0* a53; /* yy_accept */
	T6 a54; /* yy_last_accepting_state */
	T6 a55; /* yy_last_accepting_cpos */
	T0* a56; /* yy_chk */
	T0* a57; /* yy_base */
	T0* a58; /* yy_def */
	T0* a59; /* yy_meta */
	T0* a60; /* yy_nxt */
	T6 a61; /* yy_lp */
	T0* a62; /* yy_acclist */
	T6 a63; /* yy_looking_for_trail_begin */
	T6 a64; /* yy_full_match */
	T6 a65; /* yy_full_state */
	T6 a66; /* yy_full_lp */
	T1 a67; /* yy_rejected */
	T6 a68; /* yyvsc1 */
	T0* a69; /* yyvs1 */
	T0* a70; /* yyspecial_routines1 */
	T0* a71; /* last_any_value */
	T6 a72; /* yyvsc2 */
	T0* a73; /* yyvs2 */
	T0* a74; /* yyspecial_routines2 */
	T0* a75; /* last_string_value */
	T6 a76; /* if_level */
	T0* a77; /* yyvs3 */
	T6 a78; /* ignored_level */
	T6 a79; /* yyvsc3 */
	T0* a80; /* yyspecial_routines3 */
};

/* Struct for type KL_EQUALITY_TESTER [STRING_8] */
struct S25 {
	int id;
};

/* Struct for type KL_EXCEPTIONS */
struct S26 {
	int id;
};

/* Struct for type KL_TEXT_INPUT_FILE */
struct S27 {
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
struct S28 {
	int id;
	T6 a1; /* mode */
	T0* a2; /* name */
	T0* a3; /* string_name */
	T14 a4; /* file_pointer */
	T1 a5; /* descriptor_available */
};

/* Struct for type KL_STANDARD_FILES */
struct S30 {
	int id;
};

/* Struct for type KL_STDOUT_FILE */
struct S31 {
	int id;
	T14 a1; /* file_pointer */
	T0* a2; /* name */
	T6 a3; /* mode */
};

/* Struct for type KL_STDIN_FILE */
struct S32 {
	int id;
	T1 a1; /* end_of_file */
	T14 a2; /* file_pointer */
	T0* a3; /* name */
	T6 a4; /* mode */
	T2 a5; /* last_character */
	T0* a6; /* character_buffer */
};

/* Struct for type UT_VERSION_NUMBER */
struct S34 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type UT_USAGE_MESSAGE */
struct S36 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type UT_CANNOT_WRITE_TO_FILE_ERROR */
struct S37 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type UT_CANNOT_READ_FILE_ERROR */
struct S38 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type KL_STDERR_FILE */
struct S39 {
	int id;
	T14 a1; /* file_pointer */
	T0* a2; /* name */
	T6 a3; /* mode */
};

/* Struct for type DS_HASH_TABLE [STRING_8, STRING_8] */
struct S40 {
	int id;
	T6 a1; /* position */
	T0* a2; /* key_equality_tester */
	T6 a3; /* count */
	T6 a4; /* capacity */
	T6 a5; /* slots_position */
	T6 a6; /* free_slot */
	T6 a7; /* last_position */
	T6 a8; /* modulus */
	T6 a9; /* clashes_previous_position */
	T0* a10; /* equality_tester */
	T0* a11; /* internal_keys */
	T6 a12; /* found_position */
	T0* a13; /* item_storage */
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* key_storage */
	T0* a17; /* internal_cursor */
	T0* a18; /* special_item_routines */
	T0* a19; /* special_key_routines */
};

/* Struct for type DS_ARRAYED_STACK [INTEGER_32] */
struct S41 {
	int id;
	T0* a1; /* storage */
	T6 a2; /* count */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type DS_ARRAYED_STACK [YY_BUFFER] */
struct S42 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
};

/* Struct for type YY_FILE_BUFFER */
struct S43 {
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
struct S44 {
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

/* Struct for type SPECIAL [INTEGER_32] */
struct S45 {
	int id;
	T6 z1; /* count */
	T6 z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [INTEGER_32] */
struct S46 {
	int id;
};

/* Struct for type SPECIAL [ANY] */
struct S48 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ANY] */
struct S49 {
	int id;
};

/* Struct for type SPECIAL [STRING_8] */
struct S50 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [STRING_8] */
struct S51 {
	int id;
};

/* Struct for type SPECIAL [BOOLEAN] */
struct S52 {
	int id;
	T6 z1; /* count */
	T1 z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [BOOLEAN] */
struct S53 {
	int id;
};

/* Struct for type UT_MESSAGE */
struct S54 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type UT_SYNTAX_ERROR */
struct S55 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type GEPP_TOO_MANY_INCLUDES_ERROR */
struct S56 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type KL_EXECUTION_ENVIRONMENT */
struct S57 {
	int id;
};

/* Struct for type KL_STRING_ROUTINES */
struct S58 {
	int id;
};

/* Struct for type KL_DIRECTORY */
struct S62 {
	int id;
	T0* a1; /* string_name */
	T0* a2; /* name */
	T6 a3; /* mode */
};

/* Struct for type ARRAY [STRING_8] */
struct S64 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type ARRAY [INTEGER_32] */
struct S65 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type UNIX_FILE_INFO */
struct S66 {
	int id;
	T0* a1; /* buffered_file_info */
	T0* a2; /* file_name */
};

/* Struct for type KL_OPERATING_SYSTEM */
struct S67 {
	int id;
};

/* Struct for type KL_WINDOWS_FILE_SYSTEM */
struct S68 {
	int id;
	T2 a1; /* secondary_directory_separator */
};

/* Struct for type KL_UNIX_FILE_SYSTEM */
struct S69 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8] */
struct S70 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
struct S72 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [YY_BUFFER] */
struct S73 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [YY_BUFFER] */
struct S74 {
	int id;
};

/* Struct for type TO_SPECIAL [INTEGER_32] */
struct S75 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [ANY] */
struct S76 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [STRING_8] */
struct S77 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [BOOLEAN] */
struct S78 {
	int id;
	T0* a1; /* area */
};

/* Struct for type EXECUTION_ENVIRONMENT */
struct S79 {
	int id;
};

/* Struct for type KL_ANY_ROUTINES */
struct S81 {
	int id;
};

/* Struct for type STRING_TO_INTEGER_CONVERTOR */
struct S83 {
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
struct S85 {
	int id;
	T0* a1; /* as_special */
	T0* a2; /* area */
};

/* Struct for type KL_PATHNAME */
struct S88 {
	int id;
	T6 a1; /* count */
	T0* a2; /* drive */
	T0* a3; /* hostname */
	T0* a4; /* sharename */
	T1 a5; /* is_relative */
	T0* a6; /* components */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8] */
struct S89 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [YY_BUFFER] */
struct S90 {
	int id;
	T0* a1; /* area */
};

/* Struct for type C_STRING */
struct S91 {
	int id;
	T6 a1; /* count */
	T0* a2; /* managed_data */
};

/* Struct for type INTEGER_OVERFLOW_CHECKER */
struct S92 {
	int id;
	T0* a1; /* integer_overflow_state1 */
	T0* a2; /* integer_overflow_state2 */
	T0* a3; /* natural_overflow_state1 */
	T0* a4; /* natural_overflow_state2 */
};

/* Struct for type SPECIAL [NATURAL_8] */
struct S94 {
	int id;
	T6 z1; /* count */
	T8 z2[1]; /* item */
};

/* Struct for type MANAGED_POINTER */
struct S95 {
	int id;
	T1 a1; /* is_shared */
	T14 a2; /* item */
	T6 a3; /* count */
};

/* Struct for type SPECIAL [NATURAL_64] */
struct S96 {
	int id;
	T6 z1; /* count */
	T11 z2[1]; /* item */
};

/* Struct for type PLATFORM */
struct S97 {
	int id;
};

/* Struct for type EXCEPTIONS */
struct S99 {
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
extern T30 GE_default30;
extern T31 GE_default31;
extern T32 GE_default32;
extern T34 GE_default34;
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
extern T48 GE_default48;
extern T49 GE_default49;
extern T50 GE_default50;
extern T51 GE_default51;
extern T52 GE_default52;
extern T53 GE_default53;
extern T54 GE_default54;
extern T55 GE_default55;
extern T56 GE_default56;
extern T57 GE_default57;
extern T58 GE_default58;
extern T61 GE_default61;
extern T62 GE_default62;
extern T64 GE_default64;
extern T65 GE_default65;
extern T66 GE_default66;
extern T67 GE_default67;
extern T68 GE_default68;
extern T69 GE_default69;
extern T70 GE_default70;
extern T72 GE_default72;
extern T73 GE_default73;
extern T74 GE_default74;
extern T75 GE_default75;
extern T76 GE_default76;
extern T77 GE_default77;
extern T78 GE_default78;
extern T79 GE_default79;
extern T81 GE_default81;
extern T83 GE_default83;
extern T85 GE_default85;
extern T86 GE_default86;
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

extern T0* GE_ms(char* s, T6 c);
/* Call to UT_ERROR.default_message */
extern T0* T35x3619(T0* C);
/* GEPP.execute */
extern T0* T21c10(void);
/* GEPP.preprocess */
extern void T21f13(T0* C);
/* KL_TEXT_OUTPUT_FILE.close */
extern void T28f26(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_close */
extern void T28f32(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_close */
extern void T28f35(T0* C, T14 a1);
/* KL_TEXT_OUTPUT_FILE.is_closed */
extern T1 T28f11(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_closed */
extern T1 T28f17(T0* C);
/* GEPP_PARSER.syntax_error */
extern T1 T24f99(T0* C);
/* GEPP.report_cannot_read_error */
extern void T21f18(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_error */
extern void T23f8(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_error_message */
extern void T23f10(T0* C, T0* a1);
/* KL_STDERR_FILE.put_line */
extern void T39f10(T0* C, T0* a1);
/* KL_STDERR_FILE.put_new_line */
extern void T39f13(T0* C);
/* KL_STDERR_FILE.put_string */
extern void T39f12(T0* C, T0* a1);
/* KL_STDERR_FILE.old_put_string */
extern void T39f16(T0* C, T0* a1);
/* KL_STDERR_FILE.console_ps */
extern void T39f17(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STRING_ROUTINES.as_string */
extern T0* T58f1(T0* C, T0* a1);
/* STRING_8.string */
extern T0* T17f10(T0* C);
/* STRING_8.append */
extern void T17f34(T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].copy_data */
extern void T15f8(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [CHARACTER_8].move_data */
extern void T15f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].overlapping_move */
extern void T15f12(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].non_overlapping_move */
extern void T15f11(T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.resize */
extern void T17f36(T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].aliased_resized_area */
extern T0* T15f4(T0* C, T6 a1);
/* INTEGER_32.infix ">=" */
extern T1 T6f2(T6* C, T6 a1);
/* STRING_8.additional_space */
extern T6 T17f18(T0* C);
/* INTEGER_32.max */
extern T6 T6f15(T6* C, T6 a1);
/* STRING_8.capacity */
extern T6 T17f17(T0* C);
/* INTEGER_32.infix ">" */
extern T1 T6f1(T6* C, T6 a1);
/* STRING_8.make */
extern T0* T17c27(T6 a1);
/* STRING_8.make_area */
extern void T17f29(T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].make */
extern T0* T15c9(T6 a1);
/* KL_ANY_ROUTINES.same_types */
extern T1 T81f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.any_ */
extern unsigned char ge265os2070;
extern T0* ge265ov2070;
extern T0* T58f5(T0* C);
/* KL_ANY_ROUTINES.default_create */
extern T0* T81c3(void);
/* KL_STDERR_FILE.string_ */
extern unsigned char ge273os1776;
extern T0* ge273ov1776;
extern T0* T39f6(T0* C);
/* KL_STRING_ROUTINES.default_create */
extern T0* T58c11(void);
/* UT_ERROR_HANDLER.message */
extern T0* T23f5(T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.make */
extern T0* T38c7(T0* a1);
/* ARRAY [STRING_8].put */
extern void T64f11(T0* C, T0* a1, T6 a2);
/* ARRAY [STRING_8].make */
extern T0* T64c10(T6 a1, T6 a2);
/* ARRAY [STRING_8].make_area */
extern void T64f12(T0* C, T6 a1);
/* SPECIAL [STRING_8].make */
extern T0* T50c5(T6 a1);
/* INTEGER_32.infix "<=" */
extern T1 T6f6(T6* C, T6 a1);
/* KL_TEXT_INPUT_FILE.close */
extern void T27f38(T0* C);
/* KL_TEXT_INPUT_FILE.old_close */
extern void T27f41(T0* C);
/* KL_TEXT_INPUT_FILE.file_close */
extern void T27f42(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.is_open_read */
extern T1 T27f10(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_read */
extern T1 T27f19(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T27f37(T0* C);
/* KL_TEXT_INPUT_FILE.is_closed */
extern T1 T27f15(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_closed */
extern T1 T27f23(T0* C);
/* KL_TEXT_INPUT_FILE.old_open_read */
extern void T27f40(T0* C);
/* KL_TEXT_INPUT_FILE.default_pointer */
extern T14 T27f18(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T27f40p1(T0* C);
/* KL_TEXT_INPUT_FILE.file_open */
extern T14 T27f20(T0* C, T14 a1, T6 a2);
/* STRING_8.to_c */
extern T0* T17f7(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_readable */
extern T1 T27f14(T0* C);
/* UNIX_FILE_INFO.is_readable */
extern T1 T66f5(T0* C);
/* UNIX_FILE_INFO.file_eaccess */
extern T1 T66f3(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.buffered_file_info */
extern unsigned char ge524os2431;
extern T0* ge524ov2431;
extern T0* T27f22(T0* C);
/* UNIX_FILE_INFO.make */
extern T0* T66c6(void);
/* UNIX_FILE_INFO.make_buffered_file_info */
extern void T66f8(T0* C, T6 a1);
/* UNIX_FILE_INFO.stat_size */
extern T6 T66f4(T0* C);
/* KL_TEXT_INPUT_FILE.set_buffer */
extern void T27f43(T0* C);
/* UNIX_FILE_INFO.update */
extern void T66f7(T0* C, T0* a1);
/* UNIX_FILE_INFO.file_stat */
extern void T66f9(T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.old_exists */
extern T1 T27f13(T0* C);
/* KL_TEXT_INPUT_FILE.file_exists */
extern T1 T27f21(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.make */
extern T0* T27c36(T0* a1);
/* KL_TEXT_INPUT_FILE.old_make */
extern void T27f39(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.string_ */
extern T0* T27f26(T0* C);
/* GEPP_PARSER.parse_file */
extern void T24f177(T0* C, T0* a1);
/* GEPP_PARSER.output */
extern void T24f182(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_string */
extern void T31f12(T0* C, T0* a1);
/* KL_STDOUT_FILE.old_put_string */
extern void T31f14(T0* C, T0* a1);
/* KL_STDOUT_FILE.console_ps */
extern void T31f17(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STDOUT_FILE.string_ */
extern T0* T31f5(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_string */
extern void T28f29(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_put_string */
extern void T28f33(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_ps */
extern void T28f36(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_TEXT_OUTPUT_FILE.string_ */
extern T0* T28f12(T0* C);
/* KL_STDOUT_FILE.put_new_line */
extern void T31f11(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_new_line */
extern void T28f28(T0* C);
/* KL_STDOUT_FILE.put_line */
extern void T31f10(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.put_line */
extern void T28f27(T0* C, T0* a1);
/* STRING_8.substring */
extern T0* T17f6(T0* C, T6 a1, T6 a2);
/* STRING_8.set_count */
extern void T17f28(T0* C, T6 a1);
/* STRING_8.new_string */
extern T0* T17f8(T0* C, T6 a1);
/* STRING_8.item */
extern T2 T17f5(T0* C, T6 a1);
/* GEPP_PARSER.ignored */
extern T1 T24f106(T0* C);
/* GEPP_PARSER.parse */
extern void T24f181(T0* C);
/* GEPP_PARSER.yy_pop_last_value */
extern void T24f195(T0* C, T6 a1);
/* GEPP_PARSER.yy_push_error_value */
extern void T24f194(T0* C);
/* KL_SPECIAL_ROUTINES [ANY].resize */
extern T0* T49f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ANY].resized_area */
extern T0* T48f2(T0* C, T6 a1);
/* SPECIAL [ANY].copy_data */
extern void T48f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [ANY].move_data */
extern void T48f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ANY].overlapping_move */
extern void T48f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ANY].non_overlapping_move */
extern void T48f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [ANY].make */
extern T0* T48c4(T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].make */
extern T0* T49f1(T0* C, T6 a1);
/* TO_SPECIAL [ANY].make_area */
extern T0* T76c2(T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].default_create */
extern T0* T49c3(void);
/* GEPP_PARSER.yy_do_action */
extern void T24f193(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].resize */
extern T0* T53f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [BOOLEAN].resized_area */
extern T0* T52f3(T0* C, T6 a1);
/* SPECIAL [BOOLEAN].copy_data */
extern void T52f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [BOOLEAN].move_data */
extern void T52f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [BOOLEAN].overlapping_move */
extern void T52f10(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [BOOLEAN].non_overlapping_move */
extern void T52f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [BOOLEAN].make */
extern T0* T52c4(T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].make */
extern T0* T53f1(T0* C, T6 a1);
/* TO_SPECIAL [BOOLEAN].make_area */
extern T0* T78c2(T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].default_create */
extern T0* T53c3(void);
/* GEPP_PARSER.is_defined */
extern T1 T24f134(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].has */
extern T1 T40f30(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].search_position */
extern void T40f37(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_item */
extern T6 T40f21(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].hash_position */
extern T6 T40f25(T0* C, T0* a1);
/* STRING_8.hash_code */
extern T6 T17f19(T0* C);
/* INTEGER_32.infix "|<<" */
extern T6 T6f16(T6* C, T6 a1);
/* KL_EQUALITY_TESTER [STRING_8].test */
extern T1 T25f1(T0* C, T0* a1, T0* a2);
/* KL_ANY_ROUTINES.equal_objects */
extern T1 T81f2(T0* C, T0* a1, T0* a2);
/* KL_EQUALITY_TESTER [STRING_8].any_ */
extern T0* T25f2(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_item */
extern T0* T40f27(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_item */
extern T6 T40f24(T0* C, T6 a1);
/* GEPP_PARSER.process_include */
extern void T24f206(T0* C, T0* a1);
/* GEPP_TOO_MANY_INCLUDES_ERROR.make */
extern T0* T56c7(T6 a1);
/* INTEGER_32.out */
extern T0* T6f10(T6* C);
/* STRING_8.append_integer */
extern void T17f33(T0* C, T6 a1);
/* STRING_8.append_character */
extern void T17f30(T0* C, T2 a1);
/* DS_ARRAYED_STACK [YY_BUFFER].put */
extern void T42f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [INTEGER_32].put */
extern void T41f7(T0* C, T6 a1);
/* KL_EXECUTION_ENVIRONMENT.interpreted_string */
extern T0* T57f1(T0* C, T0* a1);
/* KL_STRING_ROUTINES.appended_string */
extern T0* T58f4(T0* C, T0* a1, T0* a2);
/* STRING_8.append_string */
extern void T17f32(T0* C, T0* a1);
/* KL_STRING_ROUTINES.concat */
extern T0* T58f8(T0* C, T0* a1, T0* a2);
/* STRING_8.infix "+" */
extern T0* T17f14(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.variable_value */
extern T0* T57f3(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.get */
extern T0* T79f1(T0* C, T0* a1);
/* STRING_8.make_from_c */
extern T0* T17c38(T14 a1);
/* STRING_8.from_c */
extern void T17f39(T0* C, T14 a1);
/* C_STRING.read_string_into */
extern void T91f6(T0* C, T0* a1);
/* C_STRING.read_substring_into */
extern void T91f8(T0* C, T0* a1, T6 a2, T6 a3);
/* STRING_8.put_code */
extern void T17f43(T0* C, T10 a1, T6 a2);
/* NATURAL_8.to_natural_32 */
extern T10 T8f7(T8* C);
/* MANAGED_POINTER.read_natural_8 */
extern T8 T95f6(T0* C, T6 a1);
/* TYPED_POINTER [NATURAL_8].memory_copy */
extern void T98f2(T98* C, T14 a1, T6 a2);
/* TYPED_POINTER [NATURAL_8].c_memcpy */
extern void T98f3(T98* C, T14 a1, T14 a2, T6 a3);
/* C_STRING.share_from_pointer */
extern void T91f5(T0* C, T14 a1);
/* C_STRING.share_from_pointer_and_count */
extern void T91f7(T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.set_from_pointer */
extern void T95f9(T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.share_from_pointer */
extern T0* T95c8(T14 a1, T6 a2);
/* C_STRING.c_strlen */
extern T6 T91f3(T0* C, T14 a1);
/* STRING_8.c_string_provider */
extern unsigned char ge541os1257;
extern T0* ge541ov1257;
extern T0* T17f22(T0* C);
/* C_STRING.make_empty */
extern T0* T91c4(T6 a1);
/* MANAGED_POINTER.make */
extern T0* T95c7(T6 a1);
/* EXCEPTIONS.raise */
extern void T99f3(T0* C, T0* a1);
/* EXCEPTIONS.eraise */
extern void T99f4(T0* C, T14 a1, T6 a2);
/* EXCEPTIONS.default_create */
extern T0* T99c2(void);
/* MANAGED_POINTER.default_pointer */
extern T14 T95f5(T0* C);
/* POINTER.memory_calloc */
extern T14 T14f2(T14* C, T6 a1, T6 a2);
/* POINTER.c_calloc */
extern T14 T14f3(T14* C, T6 a1, T6 a2);
/* EXECUTION_ENVIRONMENT.eif_getenv */
extern T14 T79f3(T0* C, T14 a1);
/* KL_EXECUTION_ENVIRONMENT.environment_impl */
extern unsigned char ge379os4085;
extern T0* ge379ov4085;
extern T0* T57f4(T0* C);
/* EXECUTION_ENVIRONMENT.default_create */
extern T0* T79c4(void);
/* KL_STRING_ROUTINES.append_substring_to_string */
extern void T58f12(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* KL_STRING_ROUTINES.appended_substring */
extern T0* T58f3(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* KL_STRING_ROUTINES.new_empty_string */
extern T0* T58f2(T0* C, T0* a1, T6 a2);
/* STRING_8.wipe_out */
extern void T17f31(T0* C);
/* KL_STRING_ROUTINES.cloned_string */
extern T0* T58f7(T0* C, T0* a1);
/* STRING_8.twin */
extern T0* T17f13(T0* C);
/* STRING_8.copy */
extern void T17f35(T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].twin */
extern T0* T15f3(T0* C);
/* KL_EXECUTION_ENVIRONMENT.string_ */
extern T0* T57f2(T0* C);
/* GEPP_PARSER.execution_environment */
extern unsigned char ge322os1982;
extern T0* ge322ov1982;
extern T0* T24f157(T0* C);
/* KL_EXECUTION_ENVIRONMENT.default_create */
extern T0* T57c5(void);
/* DS_ARRAYED_STACK [YY_BUFFER].is_full */
extern T1 T42f5(T0* C);
/* GEPP_PARSER.undefine_value */
extern void T24f205(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].remove */
extern void T40f36(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].remove_position */
extern void T40f45(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_put */
extern void T40f44(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_put */
extern void T40f40(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_put */
extern void T40f42(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_put */
extern void T40f43(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].move_cursors_forth */
extern void T40f52(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].move_all_cursors */
extern void T40f58(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].set_position */
extern void T72f5(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].move_cursors_after */
extern void T40f57(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].set_next_cursor */
extern void T72f6(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].internal_set_key_equality_tester */
extern void T40f51(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].internal_set_equality_tester */
extern void T70f6(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].unset_found_item */
extern void T40f39(T0* C);
/* GEPP_PARSER.define_value */
extern void T24f173(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force */
extern void T40f35(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].resize */
extern void T40f41(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_resize */
extern void T40f50(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].special_integer_ */
extern unsigned char ge271os1780;
extern T0* ge271ov1780;
extern T0* T40f29(T0* C);
/* KL_SPECIAL_ROUTINES [INTEGER_32].default_create */
extern T0* T46c4(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_resize */
extern void T40f49(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].resize */
extern T0* T51f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].resized_area */
extern T0* T50f3(T0* C, T6 a1);
/* SPECIAL [STRING_8].copy_data */
extern void T50f8(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [STRING_8].move_data */
extern void T50f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].overlapping_move */
extern void T50f11(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].non_overlapping_move */
extern void T50f10(T0* C, T6 a1, T6 a2, T6 a3);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_resize */
extern void T40f48(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_resize */
extern void T40f47(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_modulus */
extern T6 T40f22(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_capacity */
extern T6 T40f31(T0* C, T6 a1);
/* GEPP_PARSER.yy_push_last_value */
extern void T24f192(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].make */
extern T0* T51f1(T0* C, T6 a1);
/* TO_SPECIAL [STRING_8].make_area */
extern T0* T77c2(T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].default_create */
extern T0* T51c3(void);
/* GEPP_PARSER.accept */
extern void T24f191(T0* C);
/* GEPP_PARSER.yy_do_error_action */
extern void T24f189(T0* C, T6 a1);
/* GEPP_PARSER.report_error */
extern void T24f204(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.make */
extern T0* T55c7(T0* a1, T6 a2);
/* GEPP_PARSER.report_eof_expected_error */
extern void T24f203(T0* C);
/* GEPP_PARSER.read_token */
extern void T24f188(T0* C);
/* GEPP_PARSER.yy_execute_action */
extern void T24f202(T0* C, T6 a1);
/* GEPP_PARSER.yy_set_beginning_of_line */
extern void T24f212(T0* C);
/* YY_BUFFER.set_beginning_of_line */
extern void T44f16(T0* C, T1 a1);
/* YY_FILE_BUFFER.set_beginning_of_line */
extern void T43f20(T0* C, T1 a1);
/* GEPP_PARSER.text_item */
extern T2 T24f156(T0* C, T6 a1);
/* GEPP_PARSER.text */
extern T0* T24f153(T0* C);
/* KL_CHARACTER_BUFFER.substring */
extern T0* T85f6(T0* C, T6 a1, T6 a2);
/* GEPP_PARSER.text_substring */
extern T0* T24f151(T0* C, T6 a1, T6 a2);
/* GEPP_PARSER.text_count */
extern T6 T24f150(T0* C);
/* GEPP_PARSER.echo */
extern void T24f211(T0* C);
/* GEPP_PARSER.set_start_condition */
extern void T24f209(T0* C, T6 a1);
/* GEPP_PARSER.yy_execute_eof_action */
extern void T24f201(T0* C, T6 a1);
/* GEPP_PARSER.terminate */
extern void T24f210(T0* C);
/* GEPP_PARSER.wrap */
extern T1 T24f119(T0* C);
/* KL_STDIN_FILE.close */
extern void T32f23(T0* C);
/* KL_STDIN_FILE.is_closable */
extern T1 T32f8(T0* C);
/* KL_TEXT_INPUT_FILE.is_closable */
extern T1 T27f25(T0* C);
/* DS_ARRAYED_STACK [YY_BUFFER].remove */
extern void T42f10(T0* C);
/* DS_ARRAYED_STACK [INTEGER_32].remove */
extern void T41f8(T0* C);
/* DS_ARRAYED_STACK [INTEGER_32].item */
extern T6 T41f5(T0* C);
/* DS_ARRAYED_STACK [YY_BUFFER].item */
extern T0* T42f7(T0* C);
/* DS_ARRAYED_STACK [YY_BUFFER].is_empty */
extern T1 T42f6(T0* C);
/* GEPP_PARSER.yy_refill_input_buffer */
extern void T24f200(T0* C);
/* GEPP_PARSER.yy_set_content */
extern void T24f198(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.count */
extern T6 T85f4(T0* C);
/* YY_BUFFER.fill */
extern void T44f15(T0* C);
/* YY_FILE_BUFFER.fill */
extern void T43f19(T0* C);
/* KL_CHARACTER_BUFFER.fill_from_stream */
extern T6 T85f5(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STDIN_FILE.read_to_string */
extern T6 T32f14(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STDIN_FILE.old_read_to_string */
extern T6 T32f17(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STDIN_FILE.file_gss */
extern T6 T32f18(T0* C, T14 a1, T14 a2, T6 a3);
/* SPECIAL [CHARACTER_8].item_address */
extern T14 T15f5(T0* C, T6 a1);
/* KL_STDIN_FILE.any_ */
extern T0* T32f15(T0* C);
/* KL_STDIN_FILE.old_end_of_file */
extern T1 T32f11(T0* C);
/* KL_STDIN_FILE.console_eof */
extern T1 T32f13(T0* C, T14 a1);
/* STRING_8.put */
extern void T17f41(T0* C, T2 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.read_to_string */
extern T6 T27f30(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
extern unsigned char ge391os2199;
extern T0* ge391ov2199;
extern T0* T27f34(T0* C);
/* KL_CHARACTER_BUFFER.make */
extern T0* T85c8(T6 a1);
/* KL_OPERATING_SYSTEM.is_dotnet */
extern unsigned char ge397os3230;
extern T1 ge397ov3230;
extern T1 T67f6(T0* C);
/* PLATFORM.default_create */
extern T0* T97c2(void);
/* KL_CHARACTER_BUFFER.operating_system */
extern unsigned char ge323os2237;
extern T0* ge323ov2237;
extern T0* T85f7(T0* C);
/* KL_OPERATING_SYSTEM.default_create */
extern T0* T67c7(void);
/* KL_TEXT_INPUT_FILE.old_read_to_string */
extern T6 T27f33(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.file_gss */
extern T6 T27f35(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.any_ */
extern T0* T27f31(T0* C);
/* KL_TEXT_INPUT_FILE.old_end_of_file */
extern T1 T27f27(T0* C);
/* KL_TEXT_INPUT_FILE.file_feof */
extern T1 T27f29(T0* C, T14 a1);
/* KL_CHARACTER_BUFFER.put */
extern void T85f9(T0* C, T2 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.end_of_input */
extern T1 T27f24(T0* C);
/* KL_STDIN_FILE.read_character */
extern void T32f24(T0* C);
/* KL_STDIN_FILE.old_read_character */
extern void T32f25(T0* C);
/* KL_STDIN_FILE.console_readchar */
extern T2 T32f12(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.read_character */
extern void T27f44(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_character */
extern void T27f45(T0* C);
/* KL_TEXT_INPUT_FILE.file_gc */
extern T2 T27f28(T0* C, T14 a1);
/* YY_FILE_BUFFER.compact_left */
extern void T43f22(T0* C);
/* KL_CHARACTER_BUFFER.move_left */
extern void T85f10(T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.subcopy */
extern void T17f42(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* YY_FILE_BUFFER.resize */
extern void T43f24(T0* C);
/* KL_CHARACTER_BUFFER.resize */
extern void T85f11(T0* C, T6 a1);
/* YY_FILE_BUFFER.default_capacity */
extern unsigned char ge139os4041;
extern T6 ge139ov4041;
extern T6 T43f13(T0* C);
/* YY_BUFFER.set_index */
extern void T44f13(T0* C, T6 a1);
/* YY_FILE_BUFFER.set_index */
extern void T43f17(T0* C, T6 a1);
/* GEPP_PARSER.yy_null_trans_state */
extern T6 T24f118(T0* C, T6 a1);
/* GEPP_PARSER.yy_previous_state */
extern T6 T24f117(T0* C);
/* GEPP_PARSER.fatal_error */
extern void T24f199(T0* C, T0* a1);
/* UT_MESSAGE.make */
extern T0* T54c7(T0* a1);
/* KL_CHARACTER_BUFFER.item */
extern T2 T85f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].resize */
extern T0* T46f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [INTEGER_32].resized_area */
extern T0* T45f3(T0* C, T6 a1);
/* SPECIAL [INTEGER_32].copy_data */
extern void T45f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER_32].move_data */
extern void T45f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].overlapping_move */
extern void T45f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].non_overlapping_move */
extern void T45f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].make */
extern T0* T45c4(T6 a1);
/* GEPP_PARSER.special_integer_ */
extern T0* T24f112(T0* C);
/* GEPP_PARSER.yy_init_value_stacks */
extern void T24f187(T0* C);
/* GEPP_PARSER.yy_clear_all */
extern void T24f196(T0* C);
/* GEPP_PARSER.clear_all */
extern void T24f207(T0* C);
/* GEPP_PARSER.clear_stacks */
extern void T24f213(T0* C);
/* GEPP_PARSER.yy_clear_value_stacks */
extern void T24f214(T0* C);
/* SPECIAL [BOOLEAN].clear_all */
extern void T52f6(T0* C);
/* SPECIAL [STRING_8].clear_all */
extern void T50f7(T0* C);
/* SPECIAL [ANY].clear_all */
extern void T48f6(T0* C);
/* GEPP_PARSER.abort */
extern void T24f190(T0* C);
/* GEPP_PARSER.set_input_buffer */
extern void T24f180(T0* C, T0* a1);
/* GEPP_PARSER.yy_load_input_buffer */
extern void T24f186(T0* C);
/* YY_BUFFER.set_position */
extern void T44f14(T0* C, T6 a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.set_position */
extern void T43f18(T0* C, T6 a1, T6 a2, T6 a3);
/* GEPP_PARSER.new_file_buffer */
extern T0* T24f91(T0* C, T0* a1);
/* YY_FILE_BUFFER.make */
extern T0* T43c16(T0* a1);
/* YY_FILE_BUFFER.make_with_size */
extern void T43f21(T0* C, T0* a1, T6 a2);
/* YY_FILE_BUFFER.set_file */
extern void T43f23(T0* C, T0* a1);
/* YY_FILE_BUFFER.flush */
extern void T43f25(T0* C);
/* YY_FILE_BUFFER.new_default_buffer */
extern T0* T43f15(T0* C, T6 a1);
/* KL_STANDARD_FILES.input */
extern unsigned char ge305os3219;
extern T0* ge305ov3219;
extern T0* T30f2(T0* C);
/* KL_STDIN_FILE.make */
extern T0* T32c19(void);
/* KL_STDIN_FILE.make_open_stdin */
extern void T32f20(T0* C, T0* a1);
/* KL_STDIN_FILE.set_read_mode */
extern void T32f22(T0* C);
/* KL_STDIN_FILE.console_def */
extern T14 T32f9(T0* C, T6 a1);
/* KL_STDIN_FILE.old_make */
extern void T32f21(T0* C, T0* a1);
/* KL_STANDARD_FILES.output */
extern unsigned char ge305os3220;
extern T0* ge305ov3220;
extern T0* T30f1(T0* C);
/* KL_STDOUT_FILE.make */
extern T0* T31c9(void);
/* KL_STDOUT_FILE.make_open_stdout */
extern void T31f13(T0* C, T0* a1);
/* KL_STDOUT_FILE.set_write_mode */
extern void T31f16(T0* C);
/* KL_STDOUT_FILE.console_def */
extern T14 T31f4(T0* C, T6 a1);
/* KL_STDOUT_FILE.old_make */
extern void T31f15(T0* C, T0* a1);
/* GEPP.std */
extern unsigned char ge303os1569;
extern T0* ge303ov1569;
extern T0* T21f7(T0* C);
/* KL_STANDARD_FILES.default_create */
extern T0* T30c4(void);
/* KL_EXCEPTIONS.die */
extern void T26f2(T0* C, T6 a1);
/* GEPP.exceptions */
extern unsigned char ge321os1570;
extern T0* ge321ov1570;
extern T0* T21f6(T0* C);
/* KL_EXCEPTIONS.default_create */
extern T0* T26c1(void);
/* GEPP.report_cannot_write_error */
extern void T21f17(T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.make */
extern T0* T37c7(T0* a1);
/* GEPP_PARSER.set_output_file */
extern void T24f176(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.is_open_write */
extern T1 T28f18(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
extern T1 T28f16(T0* C);
/* KL_TEXT_OUTPUT_FILE.recursive_open_write */
extern void T28f25(T0* C);
/* KL_DIRECTORY.recursive_create_directory */
extern void T62f14(T0* C);
/* KL_STRING_ROUTINES.same_string */
extern T1 T58f9(T0* C, T0* a1, T0* a2);
/* STRING_8.item_code */
extern T6 T17f23(T0* C, T6 a1);
/* KL_STRING_ROUTINES.elks_same_string */
extern T1 T58f10(T0* C, T0* a1, T0* a2);
/* STRING_8.same_string */
extern T1 T17f24(T0* C, T0* a1);
/* KL_DIRECTORY.string_ */
extern T0* T62f6(T0* C);
/* KL_DIRECTORY.file_system */
extern unsigned char ge302os2233;
extern T0* ge302ov2233;
extern T0* T62f7(T0* C);
/* KL_DIRECTORY.unix_file_system */
extern unsigned char ge302os2236;
extern T0* ge302ov2236;
extern T0* T62f12(T0* C);
/* KL_UNIX_FILE_SYSTEM.make */
extern T0* T69c11(void);
/* KL_OPERATING_SYSTEM.is_unix */
extern unsigned char ge397os3229;
extern T1 ge397ov3229;
extern T1 T67f2(T0* C);
/* KL_OPERATING_SYSTEM.current_working_directory */
extern T0* T67f4(T0* C);
/* EXECUTION_ENVIRONMENT.current_working_directory */
extern T0* T79f2(T0* C);
/* KL_OPERATING_SYSTEM.execution_environment */
extern unsigned char ge397os3233;
extern T0* ge397ov3233;
extern T0* T67f5(T0* C);
/* KL_OPERATING_SYSTEM.variable_value */
extern T0* T67f3(T0* C, T0* a1);
/* KL_DIRECTORY.windows_file_system */
extern unsigned char ge302os2234;
extern T0* ge302ov2234;
extern T0* T62f11(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.make */
extern T0* T68c13(void);
/* KL_OPERATING_SYSTEM.is_windows */
extern unsigned char ge397os3228;
extern T1 ge397ov3228;
extern T1 T67f1(T0* C);
/* KL_DIRECTORY.operating_system */
extern T0* T62f10(T0* C);
/* KL_DIRECTORY.create_directory */
extern void T62f16(T0* C);
/* KL_DIRECTORY.create_dir */
extern void T62f17(T0* C);
/* KL_DIRECTORY.file_mkdir */
extern void T62f18(T0* C, T14 a1);
/* KL_DIRECTORY.old_exists */
extern T1 T62f8(T0* C);
/* KL_DIRECTORY.eif_dir_exists */
extern T1 T62f4(T0* C, T14 a1);
/* KL_DIRECTORY.exists */
extern T1 T62f5(T0* C);
/* KL_DIRECTORY.make */
extern T0* T62c13(T0* a1);
/* KL_DIRECTORY.old_make */
extern void T62f15(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.dirname */
extern T0* T69f2(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.root_directory */
extern unsigned char ge308os4468;
extern T0* ge308ov4468;
extern T0* T69f6(T0* C);
/* KL_UNIX_FILE_SYSTEM.is_root_directory */
extern T1 T69f5(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.dirname */
extern T0* T68f2(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.root_directory */
extern unsigned char ge310os4468;
extern T0* ge310ov4468;
extern T0* T68f8(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_separator */
extern T1 T68f6(T0* C, T2 a1);
/* KL_WINDOWS_FILE_SYSTEM.is_root_directory */
extern T1 T68f5(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.canonical_pathname */
extern T0* T69f1(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.pathname_to_string */
extern T0* T69f4(T0* C, T0* a1);
/* KL_PATHNAME.item */
extern T0* T88f8(T0* C, T6 a1);
/* ARRAY [STRING_8].item */
extern T0* T64f5(T0* C, T6 a1);
/* KL_PATHNAME.is_parent */
extern T1 T88f7(T0* C, T6 a1);
/* KL_PATHNAME.is_current */
extern T1 T88f11(T0* C, T6 a1);
/* KL_UNIX_FILE_SYSTEM.string_ */
extern T0* T69f9(T0* C);
/* KL_PATHNAME.set_canonical */
extern void T88f14(T0* C);
/* KL_PATHNAME.append_current */
extern void T88f16(T0* C);
/* KL_PATHNAME.append_name */
extern void T88f21(T0* C, T0* a1);
/* ARRAY [STRING_8].force */
extern void T64f13(T0* C, T0* a1, T6 a2);
/* ARRAY [STRING_8].auto_resize */
extern void T64f14(T0* C, T6 a1, T6 a2);
/* SPECIAL [STRING_8].fill_with */
extern void T50f12(T0* C, T0* a1, T6 a2, T6 a3);
/* ARRAY [STRING_8].capacity */
extern T6 T64f8(T0* C);
/* SPECIAL [STRING_8].aliased_resized_area */
extern T0* T50f4(T0* C, T6 a1);
/* ARRAY [STRING_8].additional_space */
extern T6 T64f7(T0* C);
/* INTEGER_32.min */
extern T6 T6f21(T6* C, T6 a1);
/* ARRAY [STRING_8].empty_area */
extern T1 T64f6(T0* C);
/* KL_UNIX_FILE_SYSTEM.string_to_pathname */
extern T0* T69f3(T0* C, T0* a1);
/* KL_PATHNAME.append_parent */
extern void T88f17(T0* C);
/* KL_PATHNAME.set_relative */
extern void T88f15(T0* C, T1 a1);
/* KL_PATHNAME.make */
extern T0* T88c13(void);
/* KL_WINDOWS_FILE_SYSTEM.canonical_pathname */
extern T0* T68f12(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.pathname_to_string */
extern T0* T68f4(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.string_ */
extern T0* T68f9(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.string_to_pathname */
extern T0* T68f3(T0* C, T0* a1);
/* KL_PATHNAME.set_drive */
extern void T88f20(T0* C, T0* a1);
/* KL_PATHNAME.set_sharename */
extern void T88f19(T0* C, T0* a1);
/* KL_PATHNAME.set_hostname */
extern void T88f18(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_system */
extern T0* T28f14(T0* C);
/* KL_TEXT_OUTPUT_FILE.unix_file_system */
extern T0* T28f23(T0* C);
/* KL_TEXT_OUTPUT_FILE.windows_file_system */
extern T0* T28f22(T0* C);
/* KL_TEXT_OUTPUT_FILE.operating_system */
extern T0* T28f21(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T28f31(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_write */
extern void T28f34(T0* C);
/* KL_TEXT_OUTPUT_FILE.default_pointer */
extern T14 T28f19(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T28f34p1(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_open */
extern T14 T28f20(T0* C, T14 a1, T6 a2);
/* KL_TEXT_OUTPUT_FILE.make */
extern T0* T28c24(T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_make */
extern void T28f30(T0* C, T0* a1);
/* STRING_8.is_equal */
extern T1 T17f9(T0* C, T0* a1);
/* STRING_8.str_strict_cmp */
extern T6 T17f4(T0* C, T0* a1, T0* a2, T6 a3);
/* GEPP.read_arguments */
extern void T21f12(T0* C);
/* GEPP.report_usage_error */
extern void T21f16(T0* C);
/* GEPP.usage_message */
extern unsigned char ge54os1566;
extern T0* ge54ov1566;
extern T0* T21f9(T0* C);
/* UT_USAGE_MESSAGE.make */
extern T0* T36c7(T0* a1);
/* GEPP_PARSER.set_empty_lines */
extern void T24f175(T0* C, T1 a1);
/* GEPP_PARSER.set_makefile_dependencies */
extern void T24f174(T0* C, T1 a1);
/* GEPP.report_usage_message */
extern void T21f15(T0* C);
/* UT_ERROR_HANDLER.report_info */
extern void T23f7(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_info_message */
extern void T23f9(T0* C, T0* a1);
/* GEPP.report_version_number */
extern void T21f14(T0* C);
/* UT_VERSION_NUMBER.make */
extern T0* T34c7(T0* a1);
/* KL_ARGUMENTS.argument */
extern T0* T22f2(T0* C, T6 a1);
/* GEPP_PARSER.make */
extern T0* T24c172(T0* a1);
/* DS_ARRAYED_STACK [YY_BUFFER].make */
extern T0* T42c8(T6 a1);
/* KL_SPECIAL_ROUTINES [YY_BUFFER].make */
extern T0* T74f1(T0* C, T6 a1);
/* TO_SPECIAL [YY_BUFFER].make_area */
extern T0* T90c2(T6 a1);
/* SPECIAL [YY_BUFFER].make */
extern T0* T73c2(T6 a1);
/* KL_SPECIAL_ROUTINES [YY_BUFFER].default_create */
extern T0* T74c2(void);
/* DS_ARRAYED_STACK [INTEGER_32].make */
extern T0* T41c6(T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].make */
extern T0* T46f1(T0* C, T6 a1);
/* TO_SPECIAL [INTEGER_32].make_area */
extern T0* T75c2(T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make */
extern T0* T40c34(T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_with_equality_testers */
extern void T40f38(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].make */
extern T0* T70c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].new_cursor */
extern T0* T70f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8].make */
extern T0* T89c3(T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_cursor */
extern T0* T40f28(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].make */
extern T0* T72c4(T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_sparse_container */
extern void T40f46(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_slots */
extern void T40f56(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_clashes */
extern void T40f55(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_key_storage */
extern void T40f54(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_item_storage */
extern void T40f53(T0* C, T6 a1);
/* KL_EQUALITY_TESTER [STRING_8].default_create */
extern T0* T25c3(void);
/* GEPP_PARSER.make_parser_skeleton */
extern void T24f179(T0* C);
/* GEPP_PARSER.yy_build_parser_tables */
extern void T24f185(T0* C);
/* GEPP_PARSER.yycheck_template */
extern unsigned char ge55os1642;
extern T0* ge55ov1642;
extern T0* T24f128(T0* C);
/* GEPP_PARSER.yyfixed_array */
extern T0* T24f168(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].to_special */
extern T0* T46f3(T0* C, T0* a1);
/* GEPP_PARSER.yytable_template */
extern unsigned char ge55os1641;
extern T0* ge55ov1641;
extern T0* T24f127(T0* C);
/* GEPP_PARSER.yypgoto_template */
extern unsigned char ge55os1640;
extern T0* ge55ov1640;
extern T0* T24f126(T0* C);
/* GEPP_PARSER.yypact_template */
extern unsigned char ge55os1639;
extern T0* ge55ov1639;
extern T0* T24f124(T0* C);
/* GEPP_PARSER.yydefgoto_template */
extern unsigned char ge55os1638;
extern T0* ge55ov1638;
extern T0* T24f123(T0* C);
/* GEPP_PARSER.yydefact_template */
extern unsigned char ge55os1637;
extern T0* ge55ov1637;
extern T0* T24f122(T0* C);
/* GEPP_PARSER.yytypes2_template */
extern unsigned char ge55os1636;
extern T0* ge55ov1636;
extern T0* T24f120(T0* C);
/* GEPP_PARSER.yytypes1_template */
extern unsigned char ge55os1635;
extern T0* ge55ov1635;
extern T0* T24f113(T0* C);
/* GEPP_PARSER.yyr1_template */
extern unsigned char ge55os1634;
extern T0* ge55ov1634;
extern T0* T24f110(T0* C);
/* GEPP_PARSER.yytranslate_template */
extern unsigned char ge55os1633;
extern T0* ge55ov1633;
extern T0* T24f107(T0* C);
/* GEPP_PARSER.yy_create_value_stacks */
extern void T24f184(T0* C);
/* GEPP_PARSER.make_gepp_scanner */
extern void T24f178(T0* C);
/* GEPP_PARSER.std */
extern T0* T24f95(T0* C);
/* GEPP_PARSER.make_with_buffer */
extern void T24f183(T0* C, T0* a1);
/* GEPP_PARSER.yy_initialize */
extern void T24f197(T0* C);
/* GEPP_PARSER.yy_build_tables */
extern void T24f208(T0* C);
/* GEPP_PARSER.yy_accept_template */
extern unsigned char ge56os1792;
extern T0* ge56ov1792;
extern T0* T24f164(T0* C);
/* GEPP_PARSER.yy_fixed_array */
extern T0* T24f171(T0* C, T0* a1);
/* GEPP_PARSER.yy_meta_template */
extern unsigned char ge56os1791;
extern T0* ge56ov1791;
extern T0* T24f163(T0* C);
/* GEPP_PARSER.yy_ec_template */
extern unsigned char ge56os1790;
extern T0* ge56ov1790;
extern T0* T24f162(T0* C);
/* GEPP_PARSER.yy_def_template */
extern unsigned char ge56os1789;
extern T0* ge56ov1789;
extern T0* T24f161(T0* C);
/* GEPP_PARSER.yy_base_template */
extern unsigned char ge56os1788;
extern T0* ge56ov1788;
extern T0* T24f160(T0* C);
/* GEPP_PARSER.yy_chk_template */
extern unsigned char ge56os1787;
extern T0* ge56ov1787;
extern T0* T24f159(T0* C);
/* GEPP_PARSER.yy_nxt_template */
extern unsigned char ge56os1786;
extern T0* ge56ov1786;
extern T0* T24f158(T0* C);
/* GEPP_PARSER.empty_buffer */
extern unsigned char ge144os1949;
extern T0* ge144ov1949;
extern T0* T24f94(T0* C);
/* YY_BUFFER.make */
extern T0* T44c12(T0* a1);
/* YY_BUFFER.make_from_buffer */
extern void T44f17(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.fill_from_string */
extern void T85f12(T0* C, T0* a1, T6 a2);
/* YY_BUFFER.new_default_buffer */
extern T0* T44f11(T0* C, T6 a1);
/* UT_ERROR_HANDLER.make_standard */
extern T0* T23c6(void);
/* KL_STANDARD_FILES.error */
extern unsigned char ge305os3221;
extern T0* ge305ov3221;
extern T0* T30f3(T0* C);
/* KL_STDERR_FILE.make */
extern T0* T39c9(void);
/* KL_STDERR_FILE.make_open_stderr */
extern void T39f11(T0* C, T0* a1);
/* KL_STDERR_FILE.set_write_mode */
extern void T39f15(T0* C);
/* KL_STDERR_FILE.console_def */
extern T14 T39f5(T0* C, T6 a1);
/* KL_STDERR_FILE.old_make */
extern void T39f14(T0* C, T0* a1);
/* UT_ERROR_HANDLER.std */
extern T0* T23f4(T0* C);
/* KL_ARGUMENTS.set_program_name */
extern void T22f5(T0* C, T0* a1);
/* GEPP.arguments */
extern unsigned char ge319os1572;
extern T0* ge319ov1572;
extern T0* T21f5(T0* C);
/* KL_ARGUMENTS.make */
extern T0* T22c4(void);
/* GEPP.resurrect_code */
extern void T21f11(T0* C);
/* GEPP_TOO_MANY_INCLUDES_ERROR.default_message */
extern T0* T56f5(T0* C);
/* GEPP_TOO_MANY_INCLUDES_ERROR.message */
extern T0* T56f3(T0* C, T0* a1);
/* GEPP_TOO_MANY_INCLUDES_ERROR.arguments */
extern T0* T56f6(T0* C);
/* ARRAY [STRING_8].valid_index */
extern T1 T64f4(T0* C, T6 a1);
/* STRING_8.to_integer */
extern T6 T17f12(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
extern T6 T83f13(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
extern void T83f17(T0* C, T0* a1, T6 a2);
/* STRING_8.code */
extern T10 T17f25(T0* C, T6 a1);
/* INTEGER_32.to_natural_32 */
extern T10 T6f20(T6* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_character */
extern void T83f23(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflowed */
extern T1 T83f15(T0* C);
/* INTEGER_OVERFLOW_CHECKER.will_overflow */
extern T1 T92f7(T0* C, T11 a1, T11 a2, T6 a3, T6 a4);
/* NATURAL_64.infix ">" */
extern T1 T11f4(T11* C, T11 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
extern unsigned char ge544os5173;
extern T0* ge544ov5173;
extern T0* T83f14(T0* C);
/* INTEGER_OVERFLOW_CHECKER.make */
extern T0* T92c13(void);
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
extern T0* T96c2(T6 a1);
/* STRING_8.has */
extern T1 T17f26(T0* C, T2 a1);
/* INTEGER_32.to_natural_64 */
extern T11 T6f17(T6* C);
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
extern T0* T94c2(T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.reset */
extern void T83f18(T0* C, T6 a1);
/* STRING_8.ctoi_convertor */
extern unsigned char ge541os1258;
extern T0* ge541ov1258;
extern T0* T17f16(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
extern void T83f22(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
extern void T83f21(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
extern void T83f20(T0* C, T0* a1);
/* STRING_8.make_from_string */
extern T0* T17c40(T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
extern void T83f19(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.make */
extern T0* T83c16(void);
/* STRING_8.is_integer */
extern T1 T17f11(T0* C);
/* STRING_8.is_valid_integer_or_natural */
extern T1 T17f15(T0* C, T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.is_integral_integer */
extern T1 T83f12(T0* C);
/* GEPP_TOO_MANY_INCLUDES_ERROR.string_ */
extern T0* T56f4(T0* C);
/* UT_SYNTAX_ERROR.default_message */
extern T0* T55f5(T0* C);
/* UT_SYNTAX_ERROR.message */
extern T0* T55f3(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.arguments */
extern T0* T55f6(T0* C);
/* UT_SYNTAX_ERROR.string_ */
extern T0* T55f4(T0* C);
/* UT_MESSAGE.default_message */
extern T0* T54f5(T0* C);
/* UT_MESSAGE.message */
extern T0* T54f3(T0* C, T0* a1);
/* UT_MESSAGE.arguments */
extern T0* T54f6(T0* C);
/* UT_MESSAGE.string_ */
extern T0* T54f4(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.default_message */
extern T0* T38f2(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.message */
extern T0* T38f4(T0* C, T0* a1);
/* UT_CANNOT_READ_FILE_ERROR.arguments */
extern T0* T38f6(T0* C);
/* UT_CANNOT_READ_FILE_ERROR.string_ */
extern T0* T38f5(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
extern T0* T37f2(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
extern T0* T37f4(T0* C, T0* a1);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.arguments */
extern T0* T37f6(T0* C);
/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
extern T0* T37f5(T0* C);
/* UT_USAGE_MESSAGE.default_message */
extern T0* T36f2(T0* C);
/* UT_USAGE_MESSAGE.message */
extern T0* T36f4(T0* C, T0* a1);
/* UT_USAGE_MESSAGE.arguments */
extern T0* T36f6(T0* C);
/* UT_USAGE_MESSAGE.string_ */
extern T0* T36f5(T0* C);
/* UT_VERSION_NUMBER.default_message */
extern T0* T34f2(T0* C);
/* UT_VERSION_NUMBER.message */
extern T0* T34f4(T0* C, T0* a1);
/* UT_VERSION_NUMBER.arguments */
extern T0* T34f6(T0* C);
/* UT_VERSION_NUMBER.string_ */
extern T0* T34f5(T0* C);
extern T0* GE_ma65(T6 c, ...);
extern T0* ge403ov2942;
extern T0* ge407ov4264;
extern T0* ge380ov2218;
extern T0* ge405ov2942;
extern T0* ge410ov2942;
extern T0* ge404ov3525;
extern T0* ge391ov2198;
extern T0* ge308ov4466;
extern T0* ge310ov4466;
extern T0* ge308ov4467;
extern T0* ge299ov4694;
extern T0* ge299ov4693;
extern T0* ge310ov4467;
extern T0* ge316ov1568;
extern T0* ge58ov3620;
extern T0* ge219ov3620;
extern T0* ge217ov3620;
extern T0* ge213ov3620;
extern T0* ge214ov3620;
extern T0* ge223ov3620;
extern T0* ge224ov3620;
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
