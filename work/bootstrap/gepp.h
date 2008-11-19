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
typedef struct S84 T84;

/* KL_CHARACTER_BUFFER */
typedef struct S87 T87;

/* TYPED_POINTER [SPECIAL [CHARACTER_8]] */
typedef struct S88 T88;

/* KL_PATHNAME */
typedef struct S90 T90;

/* DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8] */
typedef struct S91 T91;

/* TO_SPECIAL [YY_BUFFER] */
typedef struct S92 T92;

/* C_STRING */
typedef struct S93 T93;

/* INTEGER_OVERFLOW_CHECKER */
typedef struct S94 T94;

/* SPECIAL [NATURAL_8] */
typedef struct S96 T96;

/* MANAGED_POINTER */
typedef struct S97 T97;

/* SPECIAL [NATURAL_64] */
typedef struct S98 T98;

/* PLATFORM */
typedef struct S99 T99;

/* TYPED_POINTER [NATURAL_8] */
typedef struct S100 T100;

/* EXCEPTIONS */
typedef struct S101 T101;

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
struct S88 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type TYPED_POINTER [NATURAL_8] */
struct S100 {
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
	T0* a23; /* yyr1 */
	T6 a24; /* yyssp */
	T0* a25; /* yypgoto */
	T0* a26; /* yycheck */
	T0* a27; /* yytable */
	T0* a28; /* yydefgoto */
	T6 a29; /* error_count */
	T1 a30; /* yy_lookahead_needed */
	T6 a31; /* yyerrstatus */
	T0* a32; /* yypact */
	T6 a33; /* last_token */
	T0* a34; /* yytranslate */
	T0* a35; /* yydefact */
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
	T0* a20; /* hash_function */
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
	T14 a4; /* directory_pointer */
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
struct S84 {
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

/* Struct for type KL_CHARACTER_BUFFER */
struct S87 {
	int id;
	T0* a1; /* as_special */
	T0* a2; /* area */
};

/* Struct for type KL_PATHNAME */
struct S90 {
	int id;
	T6 a1; /* count */
	T0* a2; /* drive */
	T0* a3; /* hostname */
	T0* a4; /* sharename */
	T1 a5; /* is_relative */
	T0* a6; /* components */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8] */
struct S91 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [YY_BUFFER] */
struct S92 {
	int id;
	T0* a1; /* area */
};

/* Struct for type C_STRING */
struct S93 {
	int id;
	T6 a1; /* count */
	T0* a2; /* managed_data */
};

/* Struct for type INTEGER_OVERFLOW_CHECKER */
struct S94 {
	int id;
	T0* a1; /* integer_overflow_state1 */
	T0* a2; /* integer_overflow_state2 */
	T0* a3; /* natural_overflow_state1 */
	T0* a4; /* natural_overflow_state2 */
};

/* Struct for type SPECIAL [NATURAL_8] */
struct S96 {
	int id;
	T6 z1; /* count */
	T8 z2[1]; /* item */
};

/* Struct for type MANAGED_POINTER */
struct S97 {
	int id;
	T1 a1; /* is_shared */
	T14 a2; /* item */
	T6 a3; /* count */
};

/* Struct for type SPECIAL [NATURAL_64] */
struct S98 {
	int id;
	T6 z1; /* count */
	T11 z2[1]; /* item */
};

/* Struct for type PLATFORM */
struct S99 {
	int id;
};

/* Struct for type EXCEPTIONS */
struct S101 {
	int id;
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
extern T84 GE_default84;
extern T87 GE_default87;
extern T88 GE_default88;
extern T90 GE_default90;
extern T91 GE_default91;
extern T92 GE_default92;
extern T93 GE_default93;
extern T94 GE_default94;
extern T96 GE_default96;
extern T97 GE_default97;
extern T98 GE_default98;
extern T99 GE_default99;
extern T100 GE_default100;
extern T101 GE_default101;

extern T0* GE_ms8(char* s, T6 c);
extern T0* GE_ms32(char* s, T6 c);
/* Call to UT_ERROR.default_message */
extern T0* T35x3906(T0* C);
/* New instance of type SPECIAL [CHARACTER_8] */
extern T0* GE_new15(T6 a1, T1 initialize);
/* New instance of type STRING_8 */
extern T0* GE_new17(T1 initialize);
/* New instance of type GEPP */
extern T0* GE_new21(T1 initialize);
/* New instance of type KL_ARGUMENTS */
extern T0* GE_new22(T1 initialize);
/* New instance of type UT_ERROR_HANDLER */
extern T0* GE_new23(T1 initialize);
/* New instance of type GEPP_PARSER */
extern T0* GE_new24(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [STRING_8] */
extern T0* GE_new25(T1 initialize);
/* New instance of type KL_EXCEPTIONS */
extern T0* GE_new26(T1 initialize);
/* New instance of type KL_TEXT_INPUT_FILE */
extern T0* GE_new27(T1 initialize);
/* New instance of type KL_TEXT_OUTPUT_FILE */
extern T0* GE_new28(T1 initialize);
/* New instance of type KL_STANDARD_FILES */
extern T0* GE_new30(T1 initialize);
/* New instance of type KL_STDOUT_FILE */
extern T0* GE_new31(T1 initialize);
/* New instance of type KL_STDIN_FILE */
extern T0* GE_new32(T1 initialize);
/* New instance of type UT_VERSION_NUMBER */
extern T0* GE_new34(T1 initialize);
/* New instance of type UT_USAGE_MESSAGE */
extern T0* GE_new36(T1 initialize);
/* New instance of type UT_CANNOT_WRITE_TO_FILE_ERROR */
extern T0* GE_new37(T1 initialize);
/* New instance of type UT_CANNOT_READ_FILE_ERROR */
extern T0* GE_new38(T1 initialize);
/* New instance of type KL_STDERR_FILE */
extern T0* GE_new39(T1 initialize);
/* New instance of type DS_HASH_TABLE [STRING_8, STRING_8] */
extern T0* GE_new40(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [INTEGER_32] */
extern T0* GE_new41(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [YY_BUFFER] */
extern T0* GE_new42(T1 initialize);
/* New instance of type YY_FILE_BUFFER */
extern T0* GE_new43(T1 initialize);
/* New instance of type YY_BUFFER */
extern T0* GE_new44(T1 initialize);
/* New instance of type SPECIAL [INTEGER_32] */
extern T0* GE_new45(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [INTEGER_32] */
extern T0* GE_new46(T1 initialize);
/* New instance of type SPECIAL [ANY] */
extern T0* GE_new48(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ANY] */
extern T0* GE_new49(T1 initialize);
/* New instance of type SPECIAL [STRING_8] */
extern T0* GE_new50(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [STRING_8] */
extern T0* GE_new51(T1 initialize);
/* New instance of type SPECIAL [BOOLEAN] */
extern T0* GE_new52(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [BOOLEAN] */
extern T0* GE_new53(T1 initialize);
/* New instance of type UT_MESSAGE */
extern T0* GE_new54(T1 initialize);
/* New instance of type UT_SYNTAX_ERROR */
extern T0* GE_new55(T1 initialize);
/* New instance of type GEPP_TOO_MANY_INCLUDES_ERROR */
extern T0* GE_new56(T1 initialize);
/* New instance of type KL_EXECUTION_ENVIRONMENT */
extern T0* GE_new57(T1 initialize);
/* New instance of type KL_STRING_ROUTINES */
extern T0* GE_new58(T1 initialize);
/* New instance of type KL_DIRECTORY */
extern T0* GE_new62(T1 initialize);
/* New instance of type ARRAY [STRING_8] */
extern T0* GE_new64(T1 initialize);
/* New instance of type ARRAY [INTEGER_32] */
extern T0* GE_new65(T1 initialize);
/* New instance of type UNIX_FILE_INFO */
extern T0* GE_new66(T1 initialize);
/* New instance of type KL_OPERATING_SYSTEM */
extern T0* GE_new67(T1 initialize);
/* New instance of type KL_WINDOWS_FILE_SYSTEM */
extern T0* GE_new68(T1 initialize);
/* New instance of type KL_UNIX_FILE_SYSTEM */
extern T0* GE_new69(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8] */
extern T0* GE_new70(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
extern T0* GE_new72(T1 initialize);
/* New instance of type SPECIAL [YY_BUFFER] */
extern T0* GE_new73(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [YY_BUFFER] */
extern T0* GE_new74(T1 initialize);
/* New instance of type TO_SPECIAL [INTEGER_32] */
extern T0* GE_new75(T1 initialize);
/* New instance of type TO_SPECIAL [ANY] */
extern T0* GE_new76(T1 initialize);
/* New instance of type TO_SPECIAL [STRING_8] */
extern T0* GE_new77(T1 initialize);
/* New instance of type TO_SPECIAL [BOOLEAN] */
extern T0* GE_new78(T1 initialize);
/* New instance of type EXECUTION_ENVIRONMENT */
extern T0* GE_new79(T1 initialize);
/* New instance of type KL_ANY_ROUTINES */
extern T0* GE_new81(T1 initialize);
/* New instance of type STRING_TO_INTEGER_CONVERTOR */
extern T0* GE_new84(T1 initialize);
/* New instance of type KL_CHARACTER_BUFFER */
extern T0* GE_new87(T1 initialize);
/* New instance of type KL_PATHNAME */
extern T0* GE_new90(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8] */
extern T0* GE_new91(T1 initialize);
/* New instance of type TO_SPECIAL [YY_BUFFER] */
extern T0* GE_new92(T1 initialize);
/* New instance of type C_STRING */
extern T0* GE_new93(T1 initialize);
/* New instance of type INTEGER_OVERFLOW_CHECKER */
extern T0* GE_new94(T1 initialize);
/* New instance of type SPECIAL [NATURAL_8] */
extern T0* GE_new96(T6 a1, T1 initialize);
/* New instance of type MANAGED_POINTER */
extern T0* GE_new97(T1 initialize);
/* New instance of type SPECIAL [NATURAL_64] */
extern T0* GE_new98(T6 a1, T1 initialize);
/* New instance of type PLATFORM */
extern T0* GE_new99(T1 initialize);
/* New instance of type EXCEPTIONS */
extern T0* GE_new101(T1 initialize);
/* GEPP.execute */
extern T0* T21c10(void);
/* GEPP.preprocess */
extern void T21f13(T0* C);
/* KL_TEXT_OUTPUT_FILE.close */
extern void T28f27(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_close */
extern void T28f32(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_close */
extern void T28f35(T0* C, T14 a1);
/* KL_TEXT_OUTPUT_FILE.is_closed */
extern T1 T28f11(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_closed */
extern T1 T28f17(T0* C);
/* GEPP_PARSER.syntax_error */
extern T1 T24f98(T0* C);
/* GEPP.report_cannot_read_error */
extern void T21f18(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_error */
extern void T23f8(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_error_message */
extern void T23f10(T0* C, T0* a1);
/* KL_STDERR_FILE.put_line */
extern void T39f11(T0* C, T0* a1);
/* KL_STDERR_FILE.put_new_line */
extern void T39f14(T0* C);
/* KL_STDERR_FILE.put_string */
extern void T39f13(T0* C, T0* a1);
/* KL_STDERR_FILE.old_put_string */
extern void T39f17(T0* C, T0* a1);
/* KL_STDERR_FILE.console_ps */
extern void T39f18(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STRING_ROUTINES.as_string */
extern T0* T58f1(T0* C, T0* a1);
/* STRING_8.string */
extern T0* T17f10(T0* C);
/* STRING_8.make_from_string */
extern T0* T17c34(T0* a1);
/* SPECIAL [CHARACTER_8].twin */
extern T0* T15f2(T0* C);
/* KL_ANY_ROUTINES.same_types */
extern T1 T81f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.any_ */
extern unsigned char ge268os2288;
extern T0* ge268ov2288;
extern T0* T58f5(T0* C);
/* KL_ANY_ROUTINES.default_create */
extern T0* T81c3(void);
/* KL_STDERR_FILE.string_ */
extern unsigned char ge281os1978;
extern T0* ge281ov1978;
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
extern T0* T50c4(T6 a1);
/* INTEGER_32.infix "<=" */
extern T1 T6f6(T6* C, T6 a1);
/* KL_TEXT_INPUT_FILE.close */
extern void T27f39(T0* C);
/* KL_TEXT_INPUT_FILE.old_close */
extern void T27f41(T0* C);
/* KL_TEXT_INPUT_FILE.file_close */
extern void T27f43(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.is_open_read */
extern T1 T27f11(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_read */
extern T1 T27f19(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T27f38(T0* C);
/* KL_TEXT_INPUT_FILE.is_closed */
extern T1 T27f16(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_closed */
extern T1 T27f10(T0* C);
/* KL_TEXT_INPUT_FILE.old_open_read */
extern void T27f42(T0* C);
/* KL_TEXT_INPUT_FILE.default_pointer */
extern T14 T27f20(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T27f42p1(T0* C);
/* KL_TEXT_INPUT_FILE.file_open */
extern T14 T27f21(T0* C, T14 a1, T6 a2);
/* STRING_8.to_c */
extern T0* T17f7(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_readable */
extern T1 T27f15(T0* C);
/* UNIX_FILE_INFO.is_readable */
extern T1 T66f5(T0* C);
/* UNIX_FILE_INFO.file_eaccess */
extern T1 T66f3(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.buffered_file_info */
extern unsigned char ge563os2720;
extern T0* ge563ov2720;
extern T0* T27f23(T0* C);
/* UNIX_FILE_INFO.make */
extern T0* T66c6(void);
/* UNIX_FILE_INFO.make_buffered_file_info */
extern void T66f8(T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].make */
extern T0* T15c11(T6 a1);
/* UNIX_FILE_INFO.stat_size */
extern T6 T66f4(T0* C);
/* KL_TEXT_INPUT_FILE.set_buffer */
extern void T27f44(T0* C);
/* UNIX_FILE_INFO.update */
extern void T66f7(T0* C, T0* a1);
/* UNIX_FILE_INFO.file_stat */
extern void T66f9(T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.old_exists */
extern T1 T27f14(T0* C);
/* KL_TEXT_INPUT_FILE.file_exists */
extern T1 T27f22(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.make */
extern T0* T27c36(T0* a1);
/* KL_TEXT_INPUT_FILE.old_make */
extern void T27f40(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.string_ */
extern T0* T27f26(T0* C);
/* INTEGER_32.infix ">" */
extern T1 T6f1(T6* C, T6 a1);
/* GEPP_PARSER.parse_file */
extern void T24f177(T0* C, T0* a1);
/* GEPP_PARSER.output */
extern void T24f182(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_string */
extern void T31f13(T0* C, T0* a1);
/* KL_STDOUT_FILE.old_put_string */
extern void T31f15(T0* C, T0* a1);
/* KL_STDOUT_FILE.console_ps */
extern void T31f18(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STDOUT_FILE.string_ */
extern T0* T31f5(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_string */
extern void T28f30(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_put_string */
extern void T28f34(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_ps */
extern void T28f37(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_TEXT_OUTPUT_FILE.string_ */
extern T0* T28f12(T0* C);
/* KL_STDOUT_FILE.put_new_line */
extern void T31f12(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_new_line */
extern void T28f29(T0* C);
/* KL_STDOUT_FILE.put_line */
extern void T31f11(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.put_line */
extern void T28f28(T0* C, T0* a1);
/* STRING_8.substring */
extern T0* T17f6(T0* C, T6 a1, T6 a2);
/* STRING_8.set_count */
extern void T17f29(T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].copy_data */
extern void T15f10(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [CHARACTER_8].move_data */
extern void T15f12(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].overlapping_move */
extern void T15f14(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].non_overlapping_move */
extern void T15f13(T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.new_string */
extern T0* T17f8(T0* C, T6 a1);
/* STRING_8.make */
extern T0* T17c28(T6 a1);
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
/* SPECIAL [ANY].aliased_resized_area */
extern T0* T48f2(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].make */
extern T0* T49f1(T0* C, T6 a1);
/* TO_SPECIAL [ANY].make_area */
extern T0* T76c2(T6 a1);
/* SPECIAL [ANY].make */
extern T0* T48c3(T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].default_create */
extern T0* T49c3(void);
/* GEPP_PARSER.yy_do_action */
extern void T24f193(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].resize */
extern T0* T53f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [BOOLEAN].aliased_resized_area */
extern T0* T52f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].make */
extern T0* T53f1(T0* C, T6 a1);
/* TO_SPECIAL [BOOLEAN].make_area */
extern T0* T78c2(T6 a1);
/* SPECIAL [BOOLEAN].make */
extern T0* T52c4(T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].default_create */
extern T0* T53c3(void);
/* GEPP_PARSER.is_defined */
extern T1 T24f134(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].has */
extern T1 T40f30(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].search_position */
extern void T40f38(T0* C, T0* a1);
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
/* STRING_8.resize */
extern void T17f37(T0* C, T6 a1);
/* SPECIAL [CHARACTER_8].aliased_resized_area */
extern T0* T15f4(T0* C, T6 a1);
/* STRING_8.additional_space */
extern T6 T17f18(T0* C);
/* INTEGER_32.max */
extern T6 T6f15(T6* C, T6 a1);
/* STRING_8.capacity */
extern T6 T17f17(T0* C);
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
/* STRING_8.append */
extern void T17f36(T0* C, T0* a1);
/* KL_STRING_ROUTINES.concat */
extern T0* T58f8(T0* C, T0* a1, T0* a2);
/* STRING_8.infix "+" */
extern T0* T17f14(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.variable_value */
extern T0* T57f3(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.get */
extern T0* T79f1(T0* C, T0* a1);
/* STRING_8.make_from_c_pointer */
extern T0* T17c39(T14 a1);
/* C_STRING.read_substring_into_character_8_area */
extern void T93f6(T0* C, T0* a1, T6 a2, T6 a3);
/* MANAGED_POINTER.read_natural_8 */
extern T8 T97f6(T0* C, T6 a1);
/* TYPED_POINTER [NATURAL_8].memory_copy */
extern void T100f2(T100* C, T14 a1, T6 a2);
/* TYPED_POINTER [NATURAL_8].c_memcpy */
extern void T100f3(T100* C, T14 a1, T14 a2, T6 a3);
/* C_STRING.set_shared_from_pointer */
extern void T93f5(T0* C, T14 a1);
/* C_STRING.set_shared_from_pointer_and_count */
extern void T93f7(T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.set_from_pointer */
extern void T97f10(T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.share_from_pointer */
extern T0* T97c9(T14 a1, T6 a2);
/* C_STRING.c_strlen */
extern T6 T93f3(T0* C, T14 a1);
/* STRING_8.c_string_provider */
extern unsigned char ge584os1266;
extern T0* ge584ov1266;
extern T0* T17f22(T0* C);
/* C_STRING.make_empty */
extern T0* T93c4(T6 a1);
/* MANAGED_POINTER.make */
extern T0* T97c7(T6 a1);
/* EXCEPTIONS.raise */
extern void T101f3(T0* C, T0* a1);
/* EXCEPTIONS.eraise */
extern void T101f4(T0* C, T14 a1, T6 a2);
/* EXCEPTIONS.default_create */
extern T0* T101c2(void);
/* MANAGED_POINTER.default_pointer */
extern T14 T97f5(T0* C);
/* POINTER.memory_calloc */
extern T14 T14f2(T14* C, T6 a1, T6 a2);
/* POINTER.c_calloc */
extern T14 T14f3(T14* C, T6 a1, T6 a2);
/* EXECUTION_ENVIRONMENT.eif_getenv */
extern T14 T79f3(T0* C, T14 a1);
/* KL_EXECUTION_ENVIRONMENT.environment_impl */
extern unsigned char ge419os4411;
extern T0* ge419ov4411;
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
/* KL_EXECUTION_ENVIRONMENT.string_ */
extern T0* T57f2(T0* C);
/* GEPP_PARSER.execution_environment */
extern unsigned char ge359os2184;
extern T0* ge359ov2184;
extern T0* T24f157(T0* C);
/* KL_EXECUTION_ENVIRONMENT.default_create */
extern T0* T57c5(void);
/* DS_ARRAYED_STACK [YY_BUFFER].is_full */
extern T1 T42f5(T0* C);
/* GEPP_PARSER.undefine_value */
extern void T24f205(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].remove */
extern void T40f37(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].remove_position */
extern void T40f46(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_put */
extern void T40f45(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_put */
extern void T40f41(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_put */
extern void T40f43(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_put */
extern void T40f44(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].move_cursors_forth */
extern void T40f53(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].move_all_cursors */
extern void T40f59(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].set_position */
extern void T72f5(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].move_cursors_after */
extern void T40f58(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].set_next_cursor */
extern void T72f6(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].internal_set_key_equality_tester */
extern void T40f52(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].internal_set_equality_tester */
extern void T70f6(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].unset_found_item */
extern void T40f40(T0* C);
/* GEPP_PARSER.define_value */
extern void T24f173(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force */
extern void T40f36(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].resize */
extern void T40f42(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_resize */
extern void T40f51(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].special_integer_ */
extern unsigned char ge279os1982;
extern T0* ge279ov1982;
extern T0* T40f29(T0* C);
/* KL_SPECIAL_ROUTINES [INTEGER_32].default_create */
extern T0* T46c4(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_resize */
extern void T40f50(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].resize */
extern T0* T51f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].aliased_resized_area */
extern T0* T50f3(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_resize */
extern void T40f49(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_resize */
extern void T40f48(T0* C, T6 a1);
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
extern T0* T87f6(T0* C, T6 a1, T6 a2);
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
extern void T32f24(T0* C);
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
extern T6 T87f4(T0* C);
/* YY_BUFFER.fill */
extern void T44f15(T0* C);
/* YY_FILE_BUFFER.fill */
extern void T43f19(T0* C);
/* KL_CHARACTER_BUFFER.fill_from_stream */
extern T6 T87f5(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STDIN_FILE.read_to_string */
extern T6 T32f14(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STDIN_FILE.old_read_to_string */
extern T6 T32f17(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STDIN_FILE.file_gss */
extern T6 T32f18(T0* C, T14 a1, T14 a2, T6 a3);
/* SPECIAL [CHARACTER_8].item_address */
extern T14 T15f6(T0* C, T6 a1);
/* KL_STDIN_FILE.any_ */
extern T0* T32f15(T0* C);
/* KL_STDIN_FILE.old_end_of_file */
extern T1 T32f11(T0* C);
/* KL_STDIN_FILE.console_eof */
extern T1 T32f13(T0* C, T14 a1);
/* STRING_8.put */
extern void T17f40(T0* C, T2 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.read_to_string */
extern T6 T27f30(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
extern unsigned char ge314os2485;
extern T0* ge314ov2485;
extern T0* T27f34(T0* C);
/* KL_CHARACTER_BUFFER.make */
extern T0* T87c8(T6 a1);
/* KL_OPERATING_SYSTEM.is_dotnet */
extern unsigned char ge353os3508;
extern T1 ge353ov3508;
extern T1 T67f6(T0* C);
/* PLATFORM.default_create */
extern T0* T99c2(void);
/* KL_CHARACTER_BUFFER.operating_system */
extern unsigned char ge361os2523;
extern T0* ge361ov2523;
extern T0* T87f7(T0* C);
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
extern void T87f9(T0* C, T2 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.end_of_input */
extern T1 T27f24(T0* C);
/* KL_STDIN_FILE.read_character */
extern void T32f25(T0* C);
/* KL_STDIN_FILE.old_read_character */
extern void T32f26(T0* C);
/* KL_STDIN_FILE.console_readchar */
extern T2 T32f12(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.read_character */
extern void T27f45(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_character */
extern void T27f46(T0* C);
/* KL_TEXT_INPUT_FILE.file_gc */
extern T2 T27f28(T0* C, T14 a1);
/* YY_FILE_BUFFER.compact_left */
extern void T43f22(T0* C);
/* KL_CHARACTER_BUFFER.move_left */
extern void T87f10(T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.subcopy */
extern void T17f41(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* YY_FILE_BUFFER.resize */
extern void T43f24(T0* C);
/* KL_CHARACTER_BUFFER.resize */
extern void T87f11(T0* C, T6 a1);
/* YY_FILE_BUFFER.default_capacity */
extern unsigned char ge135os4372;
extern T6 ge135ov4372;
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
extern T2 T87f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].resize */
extern T0* T46f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [INTEGER_32].aliased_resized_area */
extern T0* T45f3(T0* C, T6 a1);
/* GEPP_PARSER.special_integer_ */
extern T0* T24f130(T0* C);
/* GEPP_PARSER.yy_init_value_stacks */
extern void T24f187(T0* C);
/* INTEGER_32.infix ">=" */
extern T1 T6f2(T6* C, T6 a1);
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
/* SPECIAL [BOOLEAN].put_default */
extern void T52f7(T0* C, T6 a1);
/* SPECIAL [STRING_8].clear_all */
extern void T50f6(T0* C);
/* SPECIAL [STRING_8].put_default */
extern void T50f7(T0* C, T6 a1);
/* SPECIAL [ANY].clear_all */
extern void T48f5(T0* C);
/* SPECIAL [ANY].put_default */
extern void T48f6(T0* C, T6 a1);
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
extern T0* T24f85(T0* C, T0* a1);
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
extern unsigned char ge327os3497;
extern T0* ge327ov3497;
extern T0* T30f2(T0* C);
/* KL_STDIN_FILE.make */
extern T0* T32c19(void);
/* KL_STDIN_FILE.make_open_stdin */
extern void T32f21(T0* C, T0* a1);
/* KL_STDIN_FILE.set_read_mode */
extern void T32f23(T0* C);
/* KL_STDIN_FILE.console_def */
extern T14 T32f9(T0* C, T6 a1);
/* KL_STDIN_FILE.old_make */
extern void T32f22(T0* C, T0* a1);
/* KL_STANDARD_FILES.output */
extern unsigned char ge327os3498;
extern T0* ge327ov3498;
extern T0* T30f1(T0* C);
/* KL_STDOUT_FILE.make */
extern T0* T31c9(void);
/* KL_STDOUT_FILE.make_open_stdout */
extern void T31f14(T0* C, T0* a1);
/* KL_STDOUT_FILE.set_write_mode */
extern void T31f17(T0* C);
/* KL_STDOUT_FILE.console_def */
extern T14 T31f4(T0* C, T6 a1);
/* KL_STDOUT_FILE.old_make */
extern void T31f16(T0* C, T0* a1);
/* GEPP.std */
extern unsigned char ge325os1770;
extern T0* ge325ov1770;
extern T0* T21f7(T0* C);
/* KL_STANDARD_FILES.default_create */
extern T0* T30c4(void);
/* KL_EXCEPTIONS.die */
extern void T26f2(T0* C, T6 a1);
/* GEPP.exceptions */
extern unsigned char ge358os1771;
extern T0* ge358ov1771;
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
extern void T28f26(T0* C);
/* KL_DIRECTORY.recursive_create_directory */
extern void T62f18(T0* C);
/* KL_STRING_ROUTINES.same_string */
extern T1 T58f9(T0* C, T0* a1, T0* a2);
/* STRING_8.item_code */
extern T6 T17f23(T0* C, T6 a1);
/* KL_STRING_ROUTINES.elks_same_string */
extern T1 T58f10(T0* C, T0* a1, T0* a2);
/* STRING_8.same_string */
extern T1 T17f24(T0* C, T0* a1);
/* STRING_8.same_string_general */
extern T1 T17f27(T0* C, T0* a1);
/* STRING_8.code */
extern T10 T17f25(T0* C, T6 a1);
/* INTEGER_32.to_natural_32 */
extern T10 T6f20(T6* C);
/* SPECIAL [CHARACTER_8].same_items */
extern T1 T15f5(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* KL_DIRECTORY.string_ */
extern T0* T62f6(T0* C);
/* KL_DIRECTORY.file_system */
extern unsigned char ge324os2519;
extern T0* ge324ov2519;
extern T0* T62f8(T0* C);
/* KL_DIRECTORY.unix_file_system */
extern unsigned char ge324os2522;
extern T0* ge324ov2522;
extern T0* T62f15(T0* C);
/* KL_UNIX_FILE_SYSTEM.make */
extern T0* T69c11(void);
/* KL_OPERATING_SYSTEM.is_unix */
extern unsigned char ge353os3507;
extern T1 ge353ov3507;
extern T1 T67f2(T0* C);
/* KL_OPERATING_SYSTEM.current_working_directory */
extern T0* T67f4(T0* C);
/* EXECUTION_ENVIRONMENT.current_working_directory */
extern T0* T79f2(T0* C);
/* KL_OPERATING_SYSTEM.execution_environment */
extern unsigned char ge353os3511;
extern T0* ge353ov3511;
extern T0* T67f5(T0* C);
/* KL_OPERATING_SYSTEM.variable_value */
extern T0* T67f3(T0* C, T0* a1);
/* KL_DIRECTORY.windows_file_system */
extern unsigned char ge324os2520;
extern T0* ge324ov2520;
extern T0* T62f14(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.make */
extern T0* T68c13(void);
/* KL_OPERATING_SYSTEM.is_windows */
extern unsigned char ge353os3506;
extern T1 ge353ov3506;
extern T1 T67f1(T0* C);
/* KL_DIRECTORY.operating_system */
extern T0* T62f13(T0* C);
/* KL_DIRECTORY.create_directory */
extern void T62f21(T0* C);
/* KL_DIRECTORY.create_dir */
extern void T62f23(T0* C);
/* KL_DIRECTORY.file_mkdir */
extern void T62f24(T0* C, T14 a1);
/* KL_DIRECTORY.old_exists */
extern T1 T62f9(T0* C);
/* KL_DIRECTORY.eif_dir_exists */
extern T1 T62f11(T0* C, T14 a1);
/* KL_DIRECTORY.exists */
extern T1 T62f5(T0* C);
/* KL_DIRECTORY.make */
extern T0* T62c16(T0* a1);
/* KL_DIRECTORY.old_make */
extern void T62f19(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.dirname */
extern T0* T69f2(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.root_directory */
extern unsigned char ge333os4806;
extern T0* ge333ov4806;
extern T0* T69f6(T0* C);
/* KL_UNIX_FILE_SYSTEM.is_root_directory */
extern T1 T69f5(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.dirname */
extern T0* T68f2(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.root_directory */
extern unsigned char ge336os4806;
extern T0* ge336ov4806;
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
extern T0* T90f8(T0* C, T6 a1);
/* ARRAY [STRING_8].item */
extern T0* T64f5(T0* C, T6 a1);
/* KL_PATHNAME.is_parent */
extern T1 T90f7(T0* C, T6 a1);
/* KL_PATHNAME.is_current */
extern T1 T90f11(T0* C, T6 a1);
/* KL_UNIX_FILE_SYSTEM.string_ */
extern T0* T69f9(T0* C);
/* KL_PATHNAME.set_canonical */
extern void T90f14(T0* C);
/* KL_PATHNAME.append_current */
extern void T90f16(T0* C);
/* KL_PATHNAME.append_name */
extern void T90f21(T0* C, T0* a1);
/* ARRAY [STRING_8].force */
extern void T64f13(T0* C, T0* a1, T6 a2);
/* ARRAY [STRING_8].auto_resize */
extern void T64f14(T0* C, T6 a1, T6 a2);
/* SPECIAL [STRING_8].fill_with_default */
extern void T50f9(T0* C, T6 a1, T6 a2);
/* SPECIAL [STRING_8].move_data */
extern void T50f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].overlapping_move */
extern void T50f11(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].non_overlapping_move */
extern void T50f10(T0* C, T6 a1, T6 a2, T6 a3);
/* ARRAY [STRING_8].capacity */
extern T6 T64f8(T0* C);
/* ARRAY [STRING_8].additional_space */
extern T6 T64f7(T0* C);
/* INTEGER_32.min */
extern T6 T6f21(T6* C, T6 a1);
/* ARRAY [STRING_8].empty_area */
extern T1 T64f6(T0* C);
/* KL_UNIX_FILE_SYSTEM.string_to_pathname */
extern T0* T69f3(T0* C, T0* a1);
/* KL_PATHNAME.append_parent */
extern void T90f17(T0* C);
/* KL_PATHNAME.set_relative */
extern void T90f15(T0* C, T1 a1);
/* KL_PATHNAME.make */
extern T0* T90c13(void);
/* KL_WINDOWS_FILE_SYSTEM.canonical_pathname */
extern T0* T68f12(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.pathname_to_string */
extern T0* T68f4(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.string_ */
extern T0* T68f9(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.string_to_pathname */
extern T0* T68f3(T0* C, T0* a1);
/* KL_PATHNAME.set_drive */
extern void T90f20(T0* C, T0* a1);
/* KL_PATHNAME.set_sharename */
extern void T90f19(T0* C, T0* a1);
/* KL_PATHNAME.set_hostname */
extern void T90f18(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_system */
extern T0* T28f14(T0* C);
/* KL_TEXT_OUTPUT_FILE.unix_file_system */
extern T0* T28f23(T0* C);
/* KL_TEXT_OUTPUT_FILE.windows_file_system */
extern T0* T28f22(T0* C);
/* KL_TEXT_OUTPUT_FILE.operating_system */
extern T0* T28f21(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T28f33(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_write */
extern void T28f36(T0* C);
/* KL_TEXT_OUTPUT_FILE.default_pointer */
extern T14 T28f19(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T28f36p1(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_open */
extern T14 T28f20(T0* C, T14 a1, T6 a2);
/* KL_TEXT_OUTPUT_FILE.make */
extern T0* T28c24(T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_make */
extern void T28f31(T0* C, T0* a1);
/* STRING_8.is_equal */
extern T1 T17f9(T0* C, T0* a1);
/* STRING_8.str_strict_cmp */
extern T6 T17f4(T0* C, T0* a1, T0* a2, T6 a3);
/* GEPP.read_arguments */
extern void T21f12(T0* C);
/* GEPP.report_usage_error */
extern void T21f16(T0* C);
/* GEPP.usage_message */
extern unsigned char ge50os1767;
extern T0* ge50ov1767;
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
extern T0* T92c2(T6 a1);
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
/* SPECIAL [INTEGER_32].make */
extern T0* T45c4(T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make */
extern T0* T40c35(T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_with_equality_testers */
extern void T40f39(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].make */
extern T0* T70c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].new_cursor */
extern T0* T70f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8].make */
extern T0* T91c3(T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_cursor */
extern T0* T40f28(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].make */
extern T0* T72c4(T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_sparse_container */
extern void T40f47(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_slots */
extern void T40f57(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_clashes */
extern void T40f56(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_key_storage */
extern void T40f55(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_item_storage */
extern void T40f54(T0* C, T6 a1);
/* KL_EQUALITY_TESTER [STRING_8].default_create */
extern T0* T25c3(void);
/* GEPP_PARSER.make_parser_skeleton */
extern void T24f179(T0* C);
/* GEPP_PARSER.yy_build_parser_tables */
extern void T24f185(T0* C);
/* GEPP_PARSER.yycheck_template */
extern unsigned char ge51os1843;
extern T0* ge51ov1843;
extern T0* T24f128(T0* C);
/* GEPP_PARSER.yyfixed_array */
extern T0* T24f168(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].to_special */
extern T0* T46f3(T0* C, T0* a1);
/* GEPP_PARSER.yytable_template */
extern unsigned char ge51os1842;
extern T0* ge51ov1842;
extern T0* T24f127(T0* C);
/* GEPP_PARSER.yypgoto_template */
extern unsigned char ge51os1841;
extern T0* ge51ov1841;
extern T0* T24f126(T0* C);
/* GEPP_PARSER.yypact_template */
extern unsigned char ge51os1840;
extern T0* ge51ov1840;
extern T0* T24f124(T0* C);
/* GEPP_PARSER.yydefgoto_template */
extern unsigned char ge51os1839;
extern T0* ge51ov1839;
extern T0* T24f123(T0* C);
/* GEPP_PARSER.yydefact_template */
extern unsigned char ge51os1838;
extern T0* ge51ov1838;
extern T0* T24f122(T0* C);
/* GEPP_PARSER.yytypes2_template */
extern unsigned char ge51os1837;
extern T0* ge51ov1837;
extern T0* T24f120(T0* C);
/* GEPP_PARSER.yytypes1_template */
extern unsigned char ge51os1836;
extern T0* ge51ov1836;
extern T0* T24f113(T0* C);
/* GEPP_PARSER.yyr1_template */
extern unsigned char ge51os1835;
extern T0* ge51ov1835;
extern T0* T24f110(T0* C);
/* GEPP_PARSER.yytranslate_template */
extern unsigned char ge51os1834;
extern T0* ge51ov1834;
extern T0* T24f107(T0* C);
/* GEPP_PARSER.yy_create_value_stacks */
extern void T24f184(T0* C);
/* GEPP_PARSER.make_gepp_scanner */
extern void T24f178(T0* C);
/* GEPP_PARSER.std */
extern T0* T24f87(T0* C);
/* GEPP_PARSER.make_with_buffer */
extern void T24f183(T0* C, T0* a1);
/* GEPP_PARSER.yy_initialize */
extern void T24f197(T0* C);
/* GEPP_PARSER.yy_build_tables */
extern void T24f208(T0* C);
/* GEPP_PARSER.yy_accept_template */
extern unsigned char ge52os1999;
extern T0* ge52ov1999;
extern T0* T24f164(T0* C);
/* GEPP_PARSER.yy_fixed_array */
extern T0* T24f171(T0* C, T0* a1);
/* GEPP_PARSER.yy_meta_template */
extern unsigned char ge52os1998;
extern T0* ge52ov1998;
extern T0* T24f163(T0* C);
/* GEPP_PARSER.yy_ec_template */
extern unsigned char ge52os1997;
extern T0* ge52ov1997;
extern T0* T24f162(T0* C);
/* GEPP_PARSER.yy_def_template */
extern unsigned char ge52os1996;
extern T0* ge52ov1996;
extern T0* T24f161(T0* C);
/* GEPP_PARSER.yy_base_template */
extern unsigned char ge52os1995;
extern T0* ge52ov1995;
extern T0* T24f160(T0* C);
/* GEPP_PARSER.yy_chk_template */
extern unsigned char ge52os1994;
extern T0* ge52ov1994;
extern T0* T24f159(T0* C);
/* GEPP_PARSER.yy_nxt_template */
extern unsigned char ge52os1993;
extern T0* ge52ov1993;
extern T0* T24f158(T0* C);
/* GEPP_PARSER.empty_buffer */
extern unsigned char ge140os2156;
extern T0* ge140ov2156;
extern T0* T24f86(T0* C);
/* YY_BUFFER.make */
extern T0* T44c12(T0* a1);
/* YY_BUFFER.make_from_buffer */
extern void T44f17(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.fill_from_string */
extern void T87f12(T0* C, T0* a1, T6 a2);
/* YY_BUFFER.new_default_buffer */
extern T0* T44f11(T0* C, T6 a1);
/* UT_ERROR_HANDLER.make_standard */
extern T0* T23c6(void);
/* KL_STANDARD_FILES.error */
extern unsigned char ge327os3499;
extern T0* ge327ov3499;
extern T0* T30f3(T0* C);
/* KL_STDERR_FILE.make */
extern T0* T39c9(void);
/* KL_STDERR_FILE.make_open_stderr */
extern void T39f12(T0* C, T0* a1);
/* KL_STDERR_FILE.set_write_mode */
extern void T39f16(T0* C);
/* KL_STDERR_FILE.console_def */
extern T14 T39f5(T0* C, T6 a1);
/* KL_STDERR_FILE.old_make */
extern void T39f15(T0* C, T0* a1);
/* UT_ERROR_HANDLER.std */
extern T0* T23f4(T0* C);
/* KL_ARGUMENTS.set_program_name */
extern void T22f5(T0* C, T0* a1);
/* GEPP.arguments */
extern unsigned char ge356os1773;
extern T0* ge356ov1773;
extern T0* T21f5(T0* C);
/* KL_ARGUMENTS.make */
extern T0* T22c4(void);
/* GEPP.resurrect_code */
extern void T21f11(T0* C);
/* MANAGED_POINTER.dispose */
extern void T97f8(T0* C);
/* POINTER.memory_free */
extern void T14f6(T14* C);
/* POINTER.default_pointer */
extern T14 T14f5(T14* C);
/* POINTER.c_free */
extern void T14f7(T14* C, T14 a1);
/* KL_DIRECTORY.dispose */
extern void T62f17(T0* C);
/* KL_DIRECTORY.old_close */
extern void T62f20(T0* C);
/* KL_DIRECTORY.default_pointer */
extern T14 T62f12(T0* C);
/* KL_DIRECTORY.dir_close */
extern void T62f22(T0* C, T14 a1);
/* KL_DIRECTORY.is_closed */
extern T1 T62f7(T0* C);
/* KL_TEXT_OUTPUT_FILE.dispose */
extern void T28f25(T0* C);
/* KL_TEXT_INPUT_FILE.dispose */
extern void T27f37(T0* C);
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
extern T6 T84f13(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
extern void T84f17(T0* C, T0* a1, T6 a2);
/* STRING_TO_INTEGER_CONVERTOR.parse_character */
extern void T84f23(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflowed */
extern T1 T84f15(T0* C);
/* INTEGER_OVERFLOW_CHECKER.will_overflow */
extern T1 T94f7(T0* C, T11 a1, T11 a2, T6 a3, T6 a4);
/* NATURAL_64.infix ">" */
extern T1 T11f4(T11* C, T11 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
extern unsigned char ge592os5377;
extern T0* ge592ov5377;
extern T0* T84f14(T0* C);
/* INTEGER_OVERFLOW_CHECKER.make */
extern T0* T94c13(void);
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
extern T0* T98c2(T6 a1);
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
extern unsigned char ge8os92;
extern T0* ge8ov92;
extern T0* T2f6(T2* C);
/* NATURAL_8.infix "|" */
extern T8 T8f3(T8* C, T8 a1);
/* SPECIAL [NATURAL_8].make */
extern T0* T96c2(T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.reset */
extern void T84f18(T0* C, T6 a1);
/* STRING_8.ctoi_convertor */
extern unsigned char ge584os1267;
extern T0* ge584ov1267;
extern T0* T17f16(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
extern void T84f22(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
extern void T84f21(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
extern void T84f20(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
extern void T84f19(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.make */
extern T0* T84c16(void);
/* STRING_8.is_integer */
extern T1 T17f11(T0* C);
/* STRING_8.is_valid_integer_or_natural */
extern T1 T17f15(T0* C, T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.is_integral_integer */
extern T1 T84f12(T0* C);
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
extern T0* GE_ma65(T6 c, T6 n, ...);
extern T0* ge328ov3219;
extern T0* ge288ov4597;
extern T0* ge310ov2504;
extern T0* ge330ov3219;
extern T0* ge421ov3219;
extern T0* ge329ov3809;
extern T0* ge314ov2484;
extern T0* ge333ov4804;
extern T0* ge336ov4804;
extern T0* ge333ov4805;
extern T0* ge321ov5000;
extern T0* ge321ov4999;
extern T0* ge336ov4805;
extern T0* ge348ov1769;
extern T0* ge54ov3907;
extern T0* ge215ov3907;
extern T0* ge213ov3907;
extern T0* ge209ov3907;
extern T0* ge210ov3907;
extern T0* ge219ov3907;
extern T0* ge220ov3907;
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
