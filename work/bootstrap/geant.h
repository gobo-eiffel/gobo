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
typedef struct S81 T81;

/* EXECUTION_ENVIRONMENT */
typedef struct S83 T83;

/* KL_ANY_ROUTINES */
typedef struct S84 T84;

/* KL_PATHNAME */
typedef struct S86 T86;

/* UNIX_FILE_INFO */
typedef struct S87 T87;

/* KL_LINKABLE [CHARACTER_8] */
typedef struct S88 T88;

/* XM_EXPAT_PARSER_FACTORY */
typedef struct S90 T90;

/* XM_EIFFEL_PARSER */
typedef struct S92 T92;

/* XM_TREE_CALLBACKS_PIPE */
typedef struct S93 T93;

/* XM_CALLBACKS_TO_TREE_FILTER */
typedef struct S96 T96;

/* XM_DOCUMENT */
typedef struct S97 T97;

/* XM_ELEMENT */
typedef struct S98 T98;

/* XM_STOP_ON_ERROR_FILTER */
typedef struct S99 T99;

/* XM_POSITION_TABLE */
typedef struct S100 T100;

/* KL_EXECUTION_ENVIRONMENT */
typedef struct S103 T103;

/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES] */
typedef struct S104 T104;

/* DS_ARRAYED_STACK [GEANT_VARIABLES] */
typedef struct S105 T105;

/* DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8] */
typedef struct S106 T106;

/* TO_SPECIAL [INTEGER_32] */
typedef struct S107 T107;

/* TO_SPECIAL [STRING_8] */
typedef struct S108 T108;

/* DS_ARRAYED_LIST_CURSOR [AP_OPTION] */
typedef struct S109 T109;

/* SPECIAL [AP_OPTION] */
typedef struct S111 T111;

/* KL_SPECIAL_ROUTINES [AP_OPTION] */
typedef struct S112 T112;

/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S113 T113;

/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S114 T114;

/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S115 T115;

/* UC_STRING */
typedef struct S116 T116;

/* STRING_TO_INTEGER_CONVERTOR */
typedef struct S118 T118;

/* DS_LINKED_LIST [XM_ELEMENT] */
typedef struct S120 T120;

/* DS_LINKED_LIST_CURSOR [XM_ELEMENT] */
typedef struct S121 T121;

/* GEANT_INHERIT_ELEMENT */
typedef struct S122 T122;

/* GEANT_INHERIT */
typedef struct S123 T123;

/* SPECIAL [GEANT_TARGET] */
typedef struct S124 T124;

/* DS_SPARSE_TABLE_KEYS [GEANT_TARGET, STRING_8] */
typedef struct S126 T126;

/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8] */
typedef struct S128 T128;

/* KL_SPECIAL_ROUTINES [GEANT_TARGET] */
typedef struct S129 T129;

/* TYPED_POINTER [SPECIAL [CHARACTER_8]] */
typedef struct S130 T130;

/* XM_EIFFEL_SCANNER */
typedef struct S132 T132;

/* XM_DEFAULT_POSITION */
typedef struct S133 T133;

/* DS_BILINKED_LIST [XM_POSITION] */
typedef struct S135 T135;

/* DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
typedef struct S136 T136;

/* XM_CALLBACKS_NULL */
typedef struct S137 T137;

/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S138 T138;

/* XM_NULL_EXTERNAL_RESOLVER */
typedef struct S140 T140;

/* SPECIAL [ANY] */
typedef struct S141 T141;

/* KL_SPECIAL_ROUTINES [ANY] */
typedef struct S142 T142;

/* XM_EIFFEL_PARSER_NAME */
typedef struct S143 T143;

/* XM_EIFFEL_DECLARATION */
typedef struct S144 T144;

/* XM_DTD_EXTERNAL_ID */
typedef struct S145 T145;

/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
typedef struct S146 T146;

/* XM_DTD_ELEMENT_CONTENT */
typedef struct S147 T147;

/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S148 T148;

/* XM_DTD_ATTRIBUTE_CONTENT */
typedef struct S149 T149;

/* DS_BILINKED_LIST [STRING_8] */
typedef struct S150 T150;

/* SPECIAL [XM_EIFFEL_PARSER_NAME] */
typedef struct S151 T151;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
typedef struct S152 T152;

/* SPECIAL [XM_EIFFEL_DECLARATION] */
typedef struct S153 T153;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
typedef struct S154 T154;

/* SPECIAL [BOOLEAN] */
typedef struct S155 T155;

/* SPECIAL [XM_DTD_EXTERNAL_ID] */
typedef struct S156 T156;

/* KL_SPECIAL_ROUTINES [BOOLEAN] */
typedef struct S157 T157;

/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S158 T158;

/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S159 T159;

/* SPECIAL [XM_DTD_ELEMENT_CONTENT] */
typedef struct S160 T160;

/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
typedef struct S161 T161;

/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S163 T163;

/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S165 T165;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S166 T166;

/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S167 T167;

/* SPECIAL [DS_BILINKED_LIST [STRING_8]] */
typedef struct S168 T168;

/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
typedef struct S169 T169;

/* XM_EIFFEL_ENTITY_DEF */
typedef struct S170 T170;

/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
typedef struct S171 T171;

/* XM_DTD_CALLBACKS_NULL */
typedef struct S173 T173;

/* XM_EIFFEL_SCANNER_DTD */
typedef struct S174 T174;

/* XM_EIFFEL_PE_ENTITY_DEF */
typedef struct S176 T176;

/* XM_NAMESPACE_RESOLVER */
typedef struct S177 T177;

/* SPECIAL [XM_CALLBACKS_FILTER] */
typedef struct S178 T178;

/* ARRAY [XM_CALLBACKS_FILTER] */
typedef struct S179 T179;

/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S180 T180;

/* SPECIAL [GEANT_ARGUMENT_VARIABLES] */
typedef struct S181 T181;

/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES] */
typedef struct S182 T182;

/* SPECIAL [GEANT_VARIABLES] */
typedef struct S183 T183;

/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES] */
typedef struct S184 T184;

/* TO_SPECIAL [AP_OPTION] */
typedef struct S186 T186;

/* TO_SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
typedef struct S187 T187;

/* C_STRING */
typedef struct S188 T188;

/* DS_ARRAYED_STACK [GEANT_TARGET] */
typedef struct S190 T190;

/* GEANT_TASK_FACTORY */
typedef struct S191 T191;

/* GEANT_PARENT */
typedef struct S192 T192;

/* DS_ARRAYED_LIST [GEANT_PARENT] */
typedef struct S194 T194;

/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT] */
typedef struct S195 T195;

/* GEANT_INTERPRETING_ELEMENT */
typedef struct S196 T196;

/* GEANT_ARGUMENT_ELEMENT */
typedef struct S197 T197;

/* GEANT_LOCAL_ELEMENT */
typedef struct S198 T198;

/* GEANT_GLOBAL_ELEMENT */
typedef struct S199 T199;

/* XM_ATTRIBUTE */
typedef struct S200 T200;

/* GEANT_GROUP */
typedef struct S201 T201;

/* DS_LINKED_LIST_CURSOR [XM_NODE] */
typedef struct S203 T203;

/* ARRAY [INTEGER_32] */
typedef struct S204 T204;

/* UC_UTF8_ROUTINES */
typedef struct S205 T205;

/* UC_UTF8_STRING */
typedef struct S206 T206;

/* XM_EIFFEL_INPUT_STREAM */
typedef struct S208 T208;

/* KL_INTEGER_ROUTINES */
typedef struct S209 T209;

/* KL_PLATFORM */
typedef struct S210 T210;

/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S211 T211;

/* DS_PAIR [XM_POSITION, XM_NODE] */
typedef struct S212 T212;

/* INTEGER_OVERFLOW_CHECKER */
typedef struct S213 T213;

/* DS_LINKABLE [XM_ELEMENT] */
typedef struct S214 T214;

/* GEANT_PARENT_ELEMENT */
typedef struct S215 T215;

/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_TARGET, STRING_8] */
typedef struct S217 T217;

/* TO_SPECIAL [GEANT_TARGET] */
typedef struct S218 T218;

/* XM_EIFFEL_CHARACTER_ENTITY */
typedef struct S219 T219;

/* YY_BUFFER */
typedef struct S220 T220;

/* YY_FILE_BUFFER */
typedef struct S221 T221;

/* DS_LINKED_STACK [INTEGER_32] */
typedef struct S224 T224;

/* DS_BILINKABLE [XM_POSITION] */
typedef struct S225 T225;

/* DS_BILINKED_LIST_CURSOR [XM_POSITION] */
typedef struct S226 T226;

/* DS_LINKABLE [XM_EIFFEL_SCANNER] */
typedef struct S227 T227;

/* SPECIAL [XM_EIFFEL_ENTITY_DEF] */
typedef struct S228 T228;

/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S229 T229;

/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S231 T231;

/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
typedef struct S233 T233;

/* TO_SPECIAL [ANY] */
typedef struct S234 T234;

/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
typedef struct S235 T235;

/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
typedef struct S236 T236;

/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
typedef struct S237 T237;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S238 T238;

/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S239 T239;

/* DS_LINKED_LIST [STRING_8] */
typedef struct S240 T240;

/* DS_BILINKED_LIST_CURSOR [STRING_8] */
typedef struct S241 T241;

/* DS_BILINKABLE [STRING_8] */
typedef struct S242 T242;

/* TO_SPECIAL [XM_EIFFEL_PARSER_NAME] */
typedef struct S243 T243;

/* TO_SPECIAL [XM_EIFFEL_DECLARATION] */
typedef struct S244 T244;

/* TO_SPECIAL [BOOLEAN] */
typedef struct S245 T245;

/* TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
typedef struct S246 T246;

/* TO_SPECIAL [XM_DTD_ELEMENT_CONTENT] */
typedef struct S247 T247;

/* TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
typedef struct S248 T248;

/* TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
typedef struct S249 T249;

/* TO_SPECIAL [DS_BILINKED_LIST [STRING_8]] */
typedef struct S250 T250;

/* TO_SPECIAL [XM_DTD_EXTERNAL_ID] */
typedef struct S251 T251;

/* XM_NAMESPACE_RESOLVER_CONTEXT */
typedef struct S252 T252;

/* DS_LINKED_QUEUE [STRING_8] */
typedef struct S254 T254;

/* TO_SPECIAL [GEANT_ARGUMENT_VARIABLES] */
typedef struct S255 T255;

/* TO_SPECIAL [GEANT_VARIABLES] */
typedef struct S256 T256;

/* SPECIAL [NATURAL_8] */
typedef struct S257 T257;

/* GEANT_STRING_INTERPRETER */
typedef struct S258 T258;

/* KL_ARRAY_ROUTINES [INTEGER_32] */
typedef struct S261 T261;

/* MANAGED_POINTER */
typedef struct S263 T263;

/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
typedef struct S264 T264;

/* GEANT_GEC_TASK */
typedef struct S265 T265;

/* TUPLE [XM_ELEMENT] */
typedef struct S266 T266;

/* TUPLE */
typedef struct S267 T267;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_GEC_TASK] */
typedef struct S268 T268;

/* TUPLE [GEANT_TASK_FACTORY] */
typedef struct S269 T269;

/* GEANT_ISE_TASK */
typedef struct S272 T272;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_ISE_TASK] */
typedef struct S273 T273;

/* GEANT_EXEC_TASK */
typedef struct S274 T274;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_EXEC_TASK] */
typedef struct S275 T275;

/* GEANT_LCC_TASK */
typedef struct S276 T276;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_LCC_TASK] */
typedef struct S277 T277;

/* GEANT_SET_TASK */
typedef struct S278 T278;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_SET_TASK] */
typedef struct S279 T279;

/* GEANT_UNSET_TASK */
typedef struct S280 T280;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_UNSET_TASK] */
typedef struct S281 T281;

/* GEANT_GEXACE_TASK */
typedef struct S282 T282;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_GEXACE_TASK] */
typedef struct S283 T283;

/* GEANT_GELEX_TASK */
typedef struct S284 T284;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_GELEX_TASK] */
typedef struct S285 T285;

/* GEANT_GEYACC_TASK */
typedef struct S286 T286;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_GEYACC_TASK] */
typedef struct S287 T287;

/* GEANT_GEPP_TASK */
typedef struct S288 T288;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_GEPP_TASK] */
typedef struct S289 T289;

/* GEANT_GETEST_TASK */
typedef struct S290 T290;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_GETEST_TASK] */
typedef struct S291 T291;

/* GEANT_GEANT_TASK */
typedef struct S292 T292;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_GEANT_TASK] */
typedef struct S293 T293;

/* GEANT_ECHO_TASK */
typedef struct S294 T294;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_ECHO_TASK] */
typedef struct S295 T295;

/* GEANT_MKDIR_TASK */
typedef struct S296 T296;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_MKDIR_TASK] */
typedef struct S297 T297;

/* GEANT_DELETE_TASK */
typedef struct S298 T298;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_DELETE_TASK] */
typedef struct S299 T299;

/* GEANT_COPY_TASK */
typedef struct S300 T300;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_COPY_TASK] */
typedef struct S301 T301;

/* GEANT_MOVE_TASK */
typedef struct S302 T302;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_MOVE_TASK] */
typedef struct S303 T303;

/* GEANT_SETENV_TASK */
typedef struct S304 T304;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_SETENV_TASK] */
typedef struct S305 T305;

/* GEANT_XSLT_TASK */
typedef struct S306 T306;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_XSLT_TASK] */
typedef struct S307 T307;

/* GEANT_OUTOFDATE_TASK */
typedef struct S308 T308;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_OUTOFDATE_TASK] */
typedef struct S309 T309;

/* GEANT_EXIT_TASK */
typedef struct S310 T310;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_EXIT_TASK] */
typedef struct S311 T311;

/* GEANT_PRECURSOR_TASK */
typedef struct S312 T312;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_PRECURSOR_TASK] */
typedef struct S313 T313;

/* GEANT_AVAILABLE_TASK */
typedef struct S314 T314;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_AVAILABLE_TASK] */
typedef struct S315 T315;

/* GEANT_INPUT_TASK */
typedef struct S316 T316;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_INPUT_TASK] */
typedef struct S317 T317;

/* GEANT_REPLACE_TASK */
typedef struct S318 T318;

/* FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_REPLACE_TASK] */
typedef struct S319 T319;

/* KL_SPECIAL_ROUTINES [GEANT_PARENT] */
typedef struct S320 T320;

/* SPECIAL [GEANT_PARENT] */
typedef struct S321 T321;

/* UC_UNICODE_ROUTINES */
typedef struct S322 T322;

/* DS_LINKED_QUEUE [CHARACTER_8] */
typedef struct S324 T324;

/* UC_UTF16_ROUTINES */
typedef struct S325 T325;

/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
typedef struct S326 T326;

/* SPECIAL [NATURAL_64] */
typedef struct S327 T327;

/* GEANT_RENAME_ELEMENT */
typedef struct S328 T328;

/* GEANT_REDEFINE_ELEMENT */
typedef struct S329 T329;

/* GEANT_SELECT_ELEMENT */
typedef struct S330 T330;

/* GEANT_RENAME */
typedef struct S331 T331;

/* DS_HASH_TABLE [GEANT_RENAME, STRING_8] */
typedef struct S332 T332;

/* GEANT_REDEFINE */
typedef struct S333 T333;

/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8] */
typedef struct S334 T334;

/* GEANT_SELECT */
typedef struct S335 T335;

/* DS_HASH_TABLE [GEANT_SELECT, STRING_8] */
typedef struct S336 T336;

/* DS_LINKABLE [INTEGER_32] */
typedef struct S338 T338;

/* DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
typedef struct S339 T339;

/* TO_SPECIAL [XM_EIFFEL_ENTITY_DEF] */
typedef struct S340 T340;

/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
typedef struct S341 T341;

/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
typedef struct S342 T342;

/* DS_LINKED_LIST_CURSOR [STRING_8] */
typedef struct S343 T343;

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S345 T345;

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S346 T346;

/* DS_LINKABLE [STRING_8] */
typedef struct S347 T347;

/* GEANT_NAME_VALUE_ELEMENT */
typedef struct S348 T348;

/* AP_OPTION_COMPARATOR */
typedef struct S349 T349;

/* DS_QUICK_SORTER [AP_OPTION] */
typedef struct S350 T350;

/* ST_WORD_WRAPPER */
typedef struct S352 T352;

/* DS_HASH_SET [XM_NAMESPACE] */
typedef struct S354 T354;

/* XM_COMMENT */
typedef struct S355 T355;

/* XM_PROCESSING_INSTRUCTION */
typedef struct S356 T356;

/* XM_CHARACTER_DATA */
typedef struct S357 T357;

/* XM_NAMESPACE */
typedef struct S358 T358;

/* DS_LINKABLE [XM_NODE] */
typedef struct S361 T361;

/* XM_NODE_TYPER */
typedef struct S363 T363;

/* KL_CHARACTER_BUFFER */
typedef struct S367 T367;

/* TYPED_POINTER [NATURAL_8] */
typedef struct S368 T368;

/* EXCEPTIONS */
typedef struct S369 T369;

/* DS_SPARSE_TABLE_KEYS [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
typedef struct S371 T371;

/* SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
typedef struct S373 T373;

/* DS_HASH_TABLE_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
typedef struct S374 T374;

/* KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
typedef struct S375 T375;

/* GEANT_GEC_COMMAND */
typedef struct S376 T376;

/* DS_CELL [PROCEDURE [ANY, TUPLE]] */
typedef struct S377 T377;

/* PROCEDURE [GEANT_GEC_TASK, TUPLE] */
typedef struct S378 T378;

/* TUPLE [GEANT_GEC_TASK] */
typedef struct S379 T379;

/* GEANT_ISE_COMMAND */
typedef struct S380 T380;

/* PROCEDURE [GEANT_ISE_TASK, TUPLE] */
typedef struct S381 T381;

/* TUPLE [GEANT_ISE_TASK] */
typedef struct S382 T382;

/* GEANT_FILESET_ELEMENT */
typedef struct S383 T383;

/* GEANT_EXEC_COMMAND */
typedef struct S384 T384;

/* GEANT_STRING_PROPERTY */
typedef struct S385 T385;

/* FUNCTION [GEANT_INTERPRETING_ELEMENT, TUPLE, STRING_8] */
typedef struct S386 T386;

/* TUPLE [GEANT_INTERPRETING_ELEMENT, STRING_8] */
typedef struct S387 T387;

/* GEANT_BOOLEAN_PROPERTY */
typedef struct S388 T388;

/* GEANT_FILESET */
typedef struct S389 T389;

/* PROCEDURE [GEANT_EXEC_TASK, TUPLE] */
typedef struct S390 T390;

/* TUPLE [GEANT_EXEC_TASK] */
typedef struct S391 T391;

/* GEANT_LCC_COMMAND */
typedef struct S392 T392;

/* PROCEDURE [GEANT_LCC_TASK, TUPLE] */
typedef struct S393 T393;

/* TUPLE [GEANT_LCC_TASK] */
typedef struct S394 T394;

/* GEANT_SET_COMMAND */
typedef struct S395 T395;

/* PROCEDURE [GEANT_SET_TASK, TUPLE] */
typedef struct S396 T396;

/* TUPLE [GEANT_SET_TASK] */
typedef struct S397 T397;

/* GEANT_UNSET_COMMAND */
typedef struct S398 T398;

/* PROCEDURE [GEANT_UNSET_TASK, TUPLE] */
typedef struct S399 T399;

/* TUPLE [GEANT_UNSET_TASK] */
typedef struct S400 T400;

/* GEANT_DEFINE_ELEMENT */
typedef struct S401 T401;

/* GEANT_GEXACE_COMMAND */
typedef struct S402 T402;

/* PROCEDURE [GEANT_GEXACE_TASK, TUPLE] */
typedef struct S403 T403;

/* TUPLE [GEANT_GEXACE_TASK] */
typedef struct S404 T404;

/* GEANT_GELEX_COMMAND */
typedef struct S405 T405;

/* PROCEDURE [GEANT_GELEX_TASK, TUPLE] */
typedef struct S406 T406;

/* TUPLE [GEANT_GELEX_TASK] */
typedef struct S407 T407;

/* GEANT_GEYACC_COMMAND */
typedef struct S408 T408;

/* PROCEDURE [GEANT_GEYACC_TASK, TUPLE] */
typedef struct S409 T409;

/* TUPLE [GEANT_GEYACC_TASK] */
typedef struct S410 T410;

/* GEANT_GEPP_COMMAND */
typedef struct S411 T411;

/* PROCEDURE [GEANT_GEPP_TASK, TUPLE] */
typedef struct S412 T412;

/* TUPLE [GEANT_GEPP_TASK] */
typedef struct S413 T413;

/* GEANT_GETEST_COMMAND */
typedef struct S414 T414;

/* PROCEDURE [GEANT_GETEST_TASK, TUPLE] */
typedef struct S415 T415;

/* TUPLE [GEANT_GETEST_TASK] */
typedef struct S416 T416;

/* GEANT_GEANT_COMMAND */
typedef struct S417 T417;

/* ST_SPLITTER */
typedef struct S418 T418;

/* PROCEDURE [GEANT_GEANT_TASK, TUPLE] */
typedef struct S419 T419;

/* TUPLE [GEANT_GEANT_TASK] */
typedef struct S420 T420;

/* GEANT_ECHO_COMMAND */
typedef struct S421 T421;

/* PROCEDURE [GEANT_ECHO_TASK, TUPLE] */
typedef struct S422 T422;

/* TUPLE [GEANT_ECHO_TASK] */
typedef struct S423 T423;

/* GEANT_MKDIR_COMMAND */
typedef struct S424 T424;

/* PROCEDURE [GEANT_MKDIR_TASK, TUPLE] */
typedef struct S425 T425;

/* TUPLE [GEANT_MKDIR_TASK] */
typedef struct S426 T426;

/* GEANT_DIRECTORYSET_ELEMENT */
typedef struct S427 T427;

/* GEANT_DELETE_COMMAND */
typedef struct S428 T428;

/* GEANT_DIRECTORYSET */
typedef struct S429 T429;

/* PROCEDURE [GEANT_DELETE_TASK, TUPLE] */
typedef struct S430 T430;

/* TUPLE [GEANT_DELETE_TASK] */
typedef struct S431 T431;

/* GEANT_COPY_COMMAND */
typedef struct S432 T432;

/* PROCEDURE [GEANT_COPY_TASK, TUPLE] */
typedef struct S433 T433;

/* TUPLE [GEANT_COPY_TASK] */
typedef struct S434 T434;

/* GEANT_MOVE_COMMAND */
typedef struct S435 T435;

/* PROCEDURE [GEANT_MOVE_TASK, TUPLE] */
typedef struct S436 T436;

/* TUPLE [GEANT_MOVE_TASK] */
typedef struct S437 T437;

/* GEANT_SETENV_COMMAND */
typedef struct S438 T438;

/* PROCEDURE [GEANT_SETENV_TASK, TUPLE] */
typedef struct S439 T439;

/* TUPLE [GEANT_SETENV_TASK] */
typedef struct S440 T440;

/* DS_PAIR [STRING_8, STRING_8] */
typedef struct S441 T441;

/* GEANT_XSLT_COMMAND */
typedef struct S442 T442;

/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S443 T443;

/* PROCEDURE [GEANT_XSLT_TASK, TUPLE] */
typedef struct S444 T444;

/* TUPLE [GEANT_XSLT_TASK] */
typedef struct S445 T445;

/* GEANT_OUTOFDATE_COMMAND */
typedef struct S446 T446;

/* PROCEDURE [GEANT_OUTOFDATE_TASK, TUPLE] */
typedef struct S447 T447;

/* TUPLE [GEANT_OUTOFDATE_TASK] */
typedef struct S448 T448;

/* GEANT_EXIT_COMMAND */
typedef struct S449 T449;

/* PROCEDURE [GEANT_EXIT_TASK, TUPLE] */
typedef struct S450 T450;

/* TUPLE [GEANT_EXIT_TASK] */
typedef struct S451 T451;

/* GEANT_PRECURSOR_COMMAND */
typedef struct S452 T452;

/* PROCEDURE [GEANT_PRECURSOR_TASK, TUPLE] */
typedef struct S453 T453;

/* TUPLE [GEANT_PRECURSOR_TASK] */
typedef struct S454 T454;

/* GEANT_AVAILABLE_COMMAND */
typedef struct S455 T455;

/* PROCEDURE [GEANT_AVAILABLE_TASK, TUPLE] */
typedef struct S456 T456;

/* TUPLE [GEANT_AVAILABLE_TASK] */
typedef struct S457 T457;

/* GEANT_INPUT_COMMAND */
typedef struct S458 T458;

/* PROCEDURE [GEANT_INPUT_TASK, TUPLE] */
typedef struct S459 T459;

/* TUPLE [GEANT_INPUT_TASK] */
typedef struct S460 T460;

/* GEANT_REPLACE_COMMAND */
typedef struct S461 T461;

/* PROCEDURE [GEANT_REPLACE_TASK, TUPLE] */
typedef struct S462 T462;

/* TUPLE [GEANT_REPLACE_TASK] */
typedef struct S463 T463;

/* TO_SPECIAL [GEANT_PARENT] */
typedef struct S464 T464;

/* SPECIAL [ARRAY [INTEGER_32]] */
typedef struct S465 T465;

/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
typedef struct S466 T466;

/* DS_LINKABLE [CHARACTER_8] */
typedef struct S467 T467;

/* KL_EQUALITY_TESTER [GEANT_RENAME] */
typedef struct S468 T468;

/* DS_SPARSE_TABLE_KEYS [GEANT_RENAME, STRING_8] */
typedef struct S469 T469;

/* SPECIAL [GEANT_RENAME] */
typedef struct S471 T471;

/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8] */
typedef struct S472 T472;

/* KL_SPECIAL_ROUTINES [GEANT_RENAME] */
typedef struct S473 T473;

/* KL_EQUALITY_TESTER [GEANT_REDEFINE] */
typedef struct S474 T474;

/* DS_SPARSE_TABLE_KEYS [GEANT_REDEFINE, STRING_8] */
typedef struct S475 T475;

/* SPECIAL [GEANT_REDEFINE] */
typedef struct S477 T477;

/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8] */
typedef struct S478 T478;

/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE] */
typedef struct S479 T479;

/* KL_EQUALITY_TESTER [GEANT_SELECT] */
typedef struct S480 T480;

/* DS_SPARSE_TABLE_KEYS [GEANT_SELECT, STRING_8] */
typedef struct S481 T481;

/* SPECIAL [GEANT_SELECT] */
typedef struct S483 T483;

/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8] */
typedef struct S484 T484;

/* KL_SPECIAL_ROUTINES [GEANT_SELECT] */
typedef struct S485 T485;

/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
typedef struct S487 T487;

/* KL_DIRECTORY */
typedef struct S488 T488;

/* KL_STRING_INPUT_STREAM */
typedef struct S489 T489;

/* SPECIAL [XM_NAMESPACE] */
typedef struct S490 T490;

/* KL_EQUALITY_TESTER [XM_NAMESPACE] */
typedef struct S491 T491;

/* DS_HASH_SET_CURSOR [XM_NAMESPACE] */
typedef struct S492 T492;

/* KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
typedef struct S493 T493;

/* DS_SPARSE_TABLE_KEYS_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
typedef struct S494 T494;

/* TO_SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
typedef struct S495 T495;

/* GEANT_MAP_ELEMENT */
typedef struct S498 T498;

/* GEANT_MAP */
typedef struct S499 T499;

/* DS_HASH_SET [GEANT_FILESET_ENTRY] */
typedef struct S502 T502;

/* DS_HASH_SET [STRING_8] */
typedef struct S504 T504;

/* LX_DFA_WILDCARD */
typedef struct S506 T506;

/* DS_HASH_SET [INTEGER_32] */
typedef struct S508 T508;

/* DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8]]] */
typedef struct S509 T509;

/* TUPLE [STRING_8] */
typedef struct S510 T510;

/* PROCEDURE [GEANT_ECHO_COMMAND, TUPLE [STRING_8]] */
typedef struct S511 T511;

/* TUPLE [GEANT_ECHO_COMMAND] */
typedef struct S512 T512;

/* DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]]] */
typedef struct S514 T514;

/* KL_TEXT_OUTPUT_FILE */
typedef struct S515 T515;

/* TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN] */
typedef struct S516 T516;

/* PROCEDURE [GEANT_ECHO_COMMAND, TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]] */
typedef struct S517 T517;

/* PROCEDURE [GEANT_MKDIR_COMMAND, TUPLE [STRING_8]] */
typedef struct S519 T519;

/* TUPLE [GEANT_MKDIR_COMMAND] */
typedef struct S520 T520;

/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S521 T521;

/* SPECIAL [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S522 T522;

/* DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S523 T523;

/* DS_CELL [FUNCTION [ANY, TUPLE [STRING_8], BOOLEAN]] */
typedef struct S524 T524;

/* PREDICATE [GEANT_AVAILABLE_COMMAND, TUPLE [STRING_8]] */
typedef struct S525 T525;

/* TUPLE [GEANT_AVAILABLE_COMMAND] */
typedef struct S526 T526;

/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_RENAME, STRING_8] */
typedef struct S528 T528;

/* TO_SPECIAL [GEANT_RENAME] */
typedef struct S529 T529;

/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_REDEFINE, STRING_8] */
typedef struct S530 T530;

/* TO_SPECIAL [GEANT_REDEFINE] */
typedef struct S531 T531;

/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_SELECT, STRING_8] */
typedef struct S532 T532;

/* TO_SPECIAL [GEANT_SELECT] */
typedef struct S533 T533;

/* TO_SPECIAL [XM_NAMESPACE] */
typedef struct S538 T538;

/* KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY] */
typedef struct S540 T540;

/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY] */
typedef struct S541 T541;

/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY] */
typedef struct S542 T542;

/* GEANT_FILESET_ENTRY */
typedef struct S543 T543;

/* SPECIAL [GEANT_FILESET_ENTRY] */
typedef struct S544 T544;

/* DS_HASH_SET_CURSOR [STRING_8] */
typedef struct S545 T545;

/* LX_WILDCARD_PARSER */
typedef struct S546 T546;

/* LX_DESCRIPTION */
typedef struct S547 T547;

/* LX_FULL_DFA */
typedef struct S548 T548;

/* DS_HASH_SET_CURSOR [INTEGER_32] */
typedef struct S550 T550;

/* KL_EQUALITY_TESTER [INTEGER_32] */
typedef struct S551 T551;

/* TO_SPECIAL [DS_PAIR [STRING_8, STRING_8]] */
typedef struct S552 T552;

/* KL_NULL_TEXT_OUTPUT_STREAM */
typedef struct S556 T556;

/* PLATFORM */
typedef struct S557 T557;

/* DP_SHELL_COMMAND */
typedef struct S559 T559;

/* DS_CELL [BOOLEAN] */
typedef struct S560 T560;

/* KL_BOOLEAN_ROUTINES */
typedef struct S562 T562;

/* ARRAY [BOOLEAN] */
typedef struct S563 T563;

/* GEANT_VARIABLES_VARIABLE_RESOLVER */
typedef struct S564 T564;

/* RX_PCRE_REGULAR_EXPRESSION */
typedef struct S565 T565;

/* KL_STRING_EQUALITY_TESTER */
typedef struct S566 T566;

/* KL_STDIN_FILE */
typedef struct S567 T567;

/* ARRAY [GEANT_VARIABLES] */
typedef struct S568 T568;

/* TO_SPECIAL [GEANT_FILESET_ENTRY] */
typedef struct S571 T571;

/* DS_ARRAYED_LIST [LX_RULE] */
typedef struct S572 T572;

/* LX_START_CONDITIONS */
typedef struct S573 T573;

/* LX_ACTION_FACTORY */
typedef struct S574 T574;

/* DS_ARRAYED_STACK [INTEGER_32] */
typedef struct S575 T575;

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8] */
typedef struct S576 T576;

/* LX_SYMBOL_CLASS */
typedef struct S577 T577;

/* SPECIAL [LX_SYMBOL_CLASS] */
typedef struct S578 T578;

/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS] */
typedef struct S579 T579;

/* LX_NFA */
typedef struct S580 T580;

/* LX_EQUIVALENCE_CLASSES */
typedef struct S581 T581;

/* LX_RULE */
typedef struct S582 T582;

/* SPECIAL [LX_NFA] */
typedef struct S583 T583;

/* KL_SPECIAL_ROUTINES [LX_NFA] */
typedef struct S584 T584;

/* UT_SYNTAX_ERROR */
typedef struct S585 T585;

/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
typedef struct S586 T586;

/* LX_UNRECOGNIZED_RULE_ERROR */
typedef struct S587 T587;

/* LX_MISSING_QUOTE_ERROR */
typedef struct S588 T588;

/* LX_BAD_CHARACTER_CLASS_ERROR */
typedef struct S589 T589;

/* LX_BAD_CHARACTER_ERROR */
typedef struct S590 T590;

/* LX_FULL_AND_META_ERROR */
typedef struct S591 T591;

/* LX_FULL_AND_REJECT_ERROR */
typedef struct S592 T592;

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR */
typedef struct S593 T593;

/* LX_CHARACTER_OUT_OF_RANGE_ERROR */
typedef struct S594 T594;

/* SPECIAL [LX_RULE] */
typedef struct S595 T595;

/* ARRAY [LX_RULE] */
typedef struct S596 T596;

/* LX_DFA_STATE */
typedef struct S597 T597;

/* DS_ARRAYED_LIST [LX_NFA_STATE] */
typedef struct S598 T598;

/* DS_ARRAYED_LIST [LX_DFA_STATE] */
typedef struct S599 T599;

/* LX_SYMBOL_PARTITIONS */
typedef struct S600 T600;

/* LX_START_CONDITION */
typedef struct S601 T601;

/* LX_TRANSITION_TABLE [LX_DFA_STATE] */
typedef struct S602 T602;

/* DS_ARRAYED_LIST [LX_NFA] */
typedef struct S603 T603;

/* DS_HASH_TABLE [LX_NFA, INTEGER_32] */
typedef struct S604 T604;

/* LX_NFA_STATE */
typedef struct S605 T605;

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR */
typedef struct S607 T607;

/* RX_BYTE_CODE */
typedef struct S609 T609;

/* RX_CASE_MAPPING */
typedef struct S610 T610;

/* RX_CHARACTER_SET */
typedef struct S611 T611;

/* SPECIAL [RX_CHARACTER_SET] */
typedef struct S613 T613;

/* ARRAY [RX_CHARACTER_SET] */
typedef struct S614 T614;

/* KL_SPECIAL_ROUTINES [LX_RULE] */
typedef struct S615 T615;

/* DS_ARRAYED_LIST_CURSOR [LX_RULE] */
typedef struct S616 T616;

/* SPECIAL [LX_START_CONDITION] */
typedef struct S617 T617;

/* KL_SPECIAL_ROUTINES [LX_START_CONDITION] */
typedef struct S618 T618;

/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION] */
typedef struct S619 T619;

/* DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING_8] */
typedef struct S621 T621;

/* DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
typedef struct S623 T623;

/* TO_SPECIAL [LX_SYMBOL_CLASS] */
typedef struct S624 T624;

/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE] */
typedef struct S625 T625;

/* LX_EPSILON_TRANSITION [LX_NFA_STATE] */
typedef struct S627 T627;

/* LX_SYMBOL_TRANSITION [LX_NFA_STATE] */
typedef struct S629 T629;

/* DS_BILINKABLE [INTEGER_32] */
typedef struct S630 T630;

/* SPECIAL [DS_BILINKABLE [INTEGER_32]] */
typedef struct S631 T631;

/* ARRAY [DS_BILINKABLE [INTEGER_32]] */
typedef struct S632 T632;

/* LX_ACTION */
typedef struct S634 T634;

/* TO_SPECIAL [LX_NFA] */
typedef struct S635 T635;

/* DS_BUBBLE_SORTER [LX_NFA_STATE] */
typedef struct S636 T636;

/* DS_BUBBLE_SORTER [LX_RULE] */
typedef struct S638 T638;

/* SPECIAL [LX_NFA_STATE] */
typedef struct S640 T640;

/* KL_SPECIAL_ROUTINES [LX_NFA_STATE] */
typedef struct S642 T642;

/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE] */
typedef struct S643 T643;

/* SPECIAL [LX_DFA_STATE] */
typedef struct S645 T645;

/* KL_SPECIAL_ROUTINES [LX_DFA_STATE] */
typedef struct S646 T646;

/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE] */
typedef struct S647 T647;

/* ARRAY [LX_DFA_STATE] */
typedef struct S648 T648;

/* KL_ARRAY_ROUTINES [LX_DFA_STATE] */
typedef struct S649 T649;

/* DS_ARRAYED_LIST_CURSOR [LX_NFA] */
typedef struct S650 T650;

/* DS_SPARSE_TABLE_KEYS [LX_NFA, INTEGER_32] */
typedef struct S652 T652;

/* DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32] */
typedef struct S654 T654;

/* KL_BINARY_INPUT_FILE */
typedef struct S655 T655;

/* KL_BINARY_OUTPUT_FILE */
typedef struct S656 T656;

/* GE_HASH_TABLE [C_STRING, STRING_8] */
typedef struct S657 T657;

/* FILE_NAME */
typedef struct S659 T659;

/* RAW_FILE */
typedef struct S660 T660;

/* DIRECTORY */
typedef struct S661 T661;

/* ARRAYED_LIST [STRING_8] */
typedef struct S662 T662;

/* KL_COMPARABLE_COMPARATOR [LX_RULE] */
typedef struct S665 T665;

/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE] */
typedef struct S668 T668;

/* TO_SPECIAL [LX_RULE] */
typedef struct S671 T671;

/* TO_SPECIAL [LX_START_CONDITION] */
typedef struct S672 T672;

/* DS_SPARSE_TABLE_KEYS_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
typedef struct S673 T673;

/* TO_SPECIAL [LX_NFA_STATE] */
typedef struct S674 T674;

/* TO_SPECIAL [LX_DFA_STATE] */
typedef struct S675 T675;

/* DS_SPARSE_TABLE_KEYS_CURSOR [LX_NFA, INTEGER_32] */
typedef struct S676 T676;

/* STRING_SEARCHER */
typedef struct S677 T677;

/* GE_STRING_EQUALITY_TESTER */
typedef struct S678 T678;

/* DS_SHELL_SORTER [INTEGER_32] */
typedef struct S680 T680;

/* PRIMES */
typedef struct S683 T683;

/* SPECIAL [C_STRING] */
typedef struct S684 T684;

/* TYPED_POINTER [FILE_NAME] */
typedef struct S685 T685;

/* KL_COMPARABLE_COMPARATOR [INTEGER_32] */
typedef struct S688 T688;

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
struct S130 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type TYPED_POINTER [NATURAL_8] */
struct S368 {
	int id;
	T14 a1; /* to_pointer */
};

/* Struct for type TYPED_POINTER [FILE_NAME] */
struct S685 {
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
	T0* a9; /* targets_stack */
	T0* a10; /* task_factory */
	T0* a11; /* options */
	T0* a12; /* inherit_clause */
	T0* a13; /* position_table */
	T0* a14; /* description */
	T1 a15; /* old_inherit */
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
	T1 a4; /* variable_local_by_default */
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
	T0* a13; /* precursor_target */
	T0* a14; /* redefining_target */
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
	T6 a1; /* found_position */
	T0* a2; /* item_storage */
	T0* a3; /* key_equality_tester */
	T0* a4; /* internal_keys */
	T6 a5; /* position */
	T6 a6; /* last_position */
	T6 a7; /* capacity */
	T6 a8; /* slots_position */
	T6 a9; /* count */
	T0* a10; /* equality_tester */
	T6 a11; /* modulus */
	T6 a12; /* clashes_previous_position */
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
struct S81 {
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
	T6 a17; /* slots_position */
	T6 a18; /* count */
	T6 a19; /* clashes_previous_position */
	T0* a20; /* hash_function */
};

/* Struct for type EXECUTION_ENVIRONMENT */
struct S83 {
	int id;
	T6 a1; /* return_code */
};

/* Struct for type KL_ANY_ROUTINES */
struct S84 {
	int id;
};

/* Struct for type KL_PATHNAME */
struct S86 {
	int id;
	T6 a1; /* count */
	T0* a2; /* drive */
	T0* a3; /* hostname */
	T0* a4; /* sharename */
	T1 a5; /* is_relative */
	T0* a6; /* components */
};

/* Struct for type UNIX_FILE_INFO */
struct S87 {
	int id;
	T0* a1; /* buffered_file_info */
	T0* a2; /* file_name */
};

/* Struct for type KL_LINKABLE [CHARACTER_8] */
struct S88 {
	int id;
	T2 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type XM_EXPAT_PARSER_FACTORY */
struct S90 {
	int id;
};

/* Struct for type XM_EIFFEL_PARSER */
struct S92 {
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

/* Struct for type XM_TREE_CALLBACKS_PIPE */
struct S93 {
	int id;
	T0* a1; /* start */
	T0* a2; /* tree */
	T0* a3; /* error */
	T0* a4; /* last */
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

/* Struct for type XM_DOCUMENT */
struct S97 {
	int id;
	T0* a1; /* root_element */
	T0* a2; /* internal_cursor */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
	T6 a5; /* count */
	T0* a6; /* parent */
};

/* Struct for type XM_ELEMENT */
struct S98 {
	int id;
	T0* a1; /* parent */
	T0* a2; /* name */
	T0* a3; /* namespace */
	T0* a4; /* internal_cursor */
	T0* a5; /* first_cell */
	T0* a6; /* last_cell */
	T6 a7; /* count */
};

/* Struct for type XM_STOP_ON_ERROR_FILTER */
struct S99 {
	int id;
	T1 a1; /* has_error */
	T0* a2; /* last_error */
	T0* a3; /* next */
};

/* Struct for type XM_POSITION_TABLE */
struct S100 {
	int id;
	T0* a1; /* table */
};

/* Struct for type KL_EXECUTION_ENVIRONMENT */
struct S103 {
	int id;
	T6 a1; /* return_code */
};

/* Struct for type DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES] */
struct S104 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type DS_ARRAYED_STACK [GEANT_VARIABLES] */
struct S105 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8] */
struct S106 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [INTEGER_32] */
struct S107 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [STRING_8] */
struct S108 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [AP_OPTION] */
struct S109 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [AP_OPTION] */
struct S111 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [AP_OPTION] */
struct S112 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S113 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S114 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S115 {
	int id;
};

/* Struct for type UC_STRING */
struct S116 {
	int id;
	T6 a1; /* count */
	T6 a2; /* byte_count */
	T6 a3; /* internal_hash_code */
	T0* a4; /* area */
	T6 a5; /* last_byte_index_input */
	T6 a6; /* last_byte_index_result */
};

/* Struct for type STRING_TO_INTEGER_CONVERTOR */
struct S118 {
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

/* Struct for type DS_LINKED_LIST [XM_ELEMENT] */
struct S120 {
	int id;
	T6 a1; /* count */
	T0* a2; /* internal_cursor */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
};

/* Struct for type DS_LINKED_LIST_CURSOR [XM_ELEMENT] */
struct S121 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type GEANT_INHERIT_ELEMENT */
struct S122 {
	int id;
	T0* a1; /* geant_inherit */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_INHERIT */
struct S123 {
	int id;
	T0* a1; /* parents */
	T0* a2; /* project */
};

/* Struct for type SPECIAL [GEANT_TARGET] */
struct S124 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [GEANT_TARGET, STRING_8] */
struct S126 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8] */
struct S128 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_TARGET] */
struct S129 {
	int id;
};

/* Struct for type XM_EIFFEL_SCANNER */
struct S132 {
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
struct S133 {
	int id;
	T0* a1; /* source_name */
	T6 a2; /* row */
	T6 a3; /* column */
	T6 a4; /* byte_index */
};

/* Struct for type DS_BILINKED_LIST [XM_POSITION] */
struct S135 {
	int id;
	T0* a1; /* first_cell */
	T0* a2; /* internal_cursor */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
struct S136 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
};

/* Struct for type XM_CALLBACKS_NULL */
struct S137 {
	int id;
};

/* Struct for type DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S138 {
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
struct S140 {
	int id;
};

/* Struct for type SPECIAL [ANY] */
struct S141 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [ANY] */
struct S142 {
	int id;
};

/* Struct for type XM_EIFFEL_PARSER_NAME */
struct S143 {
	int id;
	T1 a1; /* use_namespaces */
	T6 a2; /* count */
	T0* a3; /* first */
	T0* a4; /* second */
	T0* a5; /* tail */
};

/* Struct for type XM_EIFFEL_DECLARATION */
struct S144 {
	int id;
	T0* a1; /* version */
	T0* a2; /* encoding */
	T1 a3; /* stand_alone */
};

/* Struct for type XM_DTD_EXTERNAL_ID */
struct S145 {
	int id;
	T0* a1; /* system_id */
	T0* a2; /* public_id */
};

/* Struct for type DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
struct S146 {
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
struct S147 {
	int id;
	T0* a1; /* items */
	T2 a2; /* repetition */
	T0* a3; /* name */
	T2 a4; /* type */
	T1 a5; /* is_character_data_allowed */
};

/* Struct for type DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
struct S148 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type XM_DTD_ATTRIBUTE_CONTENT */
struct S149 {
	int id;
	T0* a1; /* name */
	T2 a2; /* type */
	T1 a3; /* is_list_type */
	T0* a4; /* enumeration_list */
	T2 a5; /* value */
	T0* a6; /* default_value */
};

/* Struct for type DS_BILINKED_LIST [STRING_8] */
struct S150 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
	T0* a5; /* equality_tester */
};

/* Struct for type SPECIAL [XM_EIFFEL_PARSER_NAME] */
struct S151 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
struct S152 {
	int id;
};

/* Struct for type SPECIAL [XM_EIFFEL_DECLARATION] */
struct S153 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
struct S154 {
	int id;
};

/* Struct for type SPECIAL [BOOLEAN] */
struct S155 {
	int id;
	T6 z1; /* count */
	T1 z2[1]; /* item */
};

/* Struct for type SPECIAL [XM_DTD_EXTERNAL_ID] */
struct S156 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [BOOLEAN] */
struct S157 {
	int id;
};

/* Struct for type SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S158 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S159 {
	int id;
};

/* Struct for type SPECIAL [XM_DTD_ELEMENT_CONTENT] */
struct S160 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
struct S161 {
	int id;
};

/* Struct for type SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S163 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
struct S165 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S166 {
	int id;
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
struct S167 {
	int id;
};

/* Struct for type SPECIAL [DS_BILINKED_LIST [STRING_8]] */
struct S168 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
struct S169 {
	int id;
};

/* Struct for type XM_EIFFEL_ENTITY_DEF */
struct S170 {
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
struct S171 {
	int id;
};

/* Struct for type XM_DTD_CALLBACKS_NULL */
struct S173 {
	int id;
};

/* Struct for type XM_EIFFEL_SCANNER_DTD */
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
struct S176 {
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
struct S177 {
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
struct S178 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [XM_CALLBACKS_FILTER] */
struct S179 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S180 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type SPECIAL [GEANT_ARGUMENT_VARIABLES] */
struct S181 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES] */
struct S182 {
	int id;
};

/* Struct for type SPECIAL [GEANT_VARIABLES] */
struct S183 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_VARIABLES] */
struct S184 {
	int id;
};

/* Struct for type TO_SPECIAL [AP_OPTION] */
struct S186 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
struct S187 {
	int id;
	T0* a1; /* area */
};

/* Struct for type C_STRING */
struct S188 {
	int id;
	T6 a1; /* count */
	T0* a2; /* managed_data */
};

/* Struct for type DS_ARRAYED_STACK [GEANT_TARGET] */
struct S190 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
};

/* Struct for type GEANT_TASK_FACTORY */
struct S191 {
	int id;
	T0* a1; /* project */
	T0* a2; /* builders */
};

/* Struct for type GEANT_PARENT */
struct S192 {
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
struct S194 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T6 a5; /* count */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [GEANT_PARENT] */
struct S195 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type GEANT_INTERPRETING_ELEMENT */
struct S196 {
	int id;
	T0* a1; /* project */
	T0* a2; /* xml_element */
	T0* a3; /* position */
};

/* Struct for type GEANT_ARGUMENT_ELEMENT */
struct S197 {
	int id;
	T0* a1; /* xml_element */
};

/* Struct for type GEANT_LOCAL_ELEMENT */
struct S198 {
	int id;
	T0* a1; /* xml_element */
};

/* Struct for type GEANT_GLOBAL_ELEMENT */
struct S199 {
	int id;
	T0* a1; /* xml_element */
};

/* Struct for type XM_ATTRIBUTE */
struct S200 {
	int id;
	T0* a1; /* name */
	T0* a2; /* namespace */
	T0* a3; /* value */
	T0* a4; /* parent */
};

/* Struct for type GEANT_GROUP */
struct S201 {
	int id;
	T0* a1; /* project */
	T0* a2; /* xml_element */
	T0* a3; /* position */
	T0* a4; /* parent */
	T0* a5; /* description */
};

/* Struct for type DS_LINKED_LIST_CURSOR [XM_NODE] */
struct S203 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type ARRAY [INTEGER_32] */
struct S204 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type UC_UTF8_ROUTINES */
struct S205 {
	int id;
};

/* Struct for type UC_UTF8_STRING */
struct S206 {
	int id;
	T6 a1; /* count */
	T0* a2; /* area */
	T6 a3; /* byte_count */
	T6 a4; /* internal_hash_code */
	T6 a5; /* last_byte_index_input */
	T6 a6; /* last_byte_index_result */
};

/* Struct for type XM_EIFFEL_INPUT_STREAM */
struct S208 {
	int id;
	T0* a1; /* last_string */
	T6 a2; /* encoding */
	T0* a3; /* impl */
	T0* a4; /* utf_queue */
};

/* Struct for type KL_INTEGER_ROUTINES */
struct S209 {
	int id;
};

/* Struct for type KL_PLATFORM */
struct S210 {
	int id;
};

/* Struct for type DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S211 {
	int id;
	T1 a1; /* after */
	T0* a2; /* current_cell */
	T0* a3; /* container */
	T1 a4; /* before */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_PAIR [XM_POSITION, XM_NODE] */
struct S212 {
	int id;
	T0* a1; /* first */
	T0* a2; /* second */
};

/* Struct for type INTEGER_OVERFLOW_CHECKER */
struct S213 {
	int id;
	T0* a1; /* integer_overflow_state1 */
	T0* a2; /* integer_overflow_state2 */
	T0* a3; /* natural_overflow_state1 */
	T0* a4; /* natural_overflow_state2 */
};

/* Struct for type DS_LINKABLE [XM_ELEMENT] */
struct S214 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type GEANT_PARENT_ELEMENT */
struct S215 {
	int id;
	T0* a1; /* parent */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_TARGET, STRING_8] */
struct S217 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [GEANT_TARGET] */
struct S218 {
	int id;
	T0* a1; /* area */
};

/* Struct for type XM_EIFFEL_CHARACTER_ENTITY */
struct S219 {
	int id;
	T6 a1; /* code */
};

/* Struct for type YY_BUFFER */
struct S220 {
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
struct S221 {
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
struct S224 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
};

/* Struct for type DS_BILINKABLE [XM_POSITION] */
struct S225 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_POSITION] */
struct S226 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type DS_LINKABLE [XM_EIFFEL_SCANNER] */
struct S227 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type SPECIAL [XM_EIFFEL_ENTITY_DEF] */
struct S228 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S229 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S231 {
	int id;
	T0* a1; /* next_cursor */
	T0* a2; /* container */
	T6 a3; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
struct S233 {
	int id;
};

/* Struct for type TO_SPECIAL [ANY] */
struct S234 {
	int id;
	T0* a1; /* area */
};

/* Struct for type KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
struct S235 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
struct S236 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
struct S237 {
	int id;
	T0* a1; /* internal_cursor */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
	T6 a4; /* count */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
struct S238 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
struct S239 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_LINKED_LIST [STRING_8] */
struct S240 {
	int id;
	T0* a1; /* internal_cursor */
	T6 a2; /* count */
	T0* a3; /* first_cell */
	T0* a4; /* last_cell */
	T0* a5; /* equality_tester */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [STRING_8] */
struct S241 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_BILINKABLE [STRING_8] */
struct S242 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type TO_SPECIAL [XM_EIFFEL_PARSER_NAME] */
struct S243 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_EIFFEL_DECLARATION] */
struct S244 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [BOOLEAN] */
struct S245 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
struct S246 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_DTD_ELEMENT_CONTENT] */
struct S247 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
struct S248 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
struct S249 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [DS_BILINKED_LIST [STRING_8]] */
struct S250 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_DTD_EXTERNAL_ID] */
struct S251 {
	int id;
	T0* a1; /* area */
};

/* Struct for type XM_NAMESPACE_RESOLVER_CONTEXT */
struct S252 {
	int id;
	T0* a1; /* context */
};

/* Struct for type DS_LINKED_QUEUE [STRING_8] */
struct S254 {
	int id;
	T0* a1; /* first_cell */
	T6 a2; /* count */
	T0* a3; /* last_cell */
};

/* Struct for type TO_SPECIAL [GEANT_ARGUMENT_VARIABLES] */
struct S255 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [GEANT_VARIABLES] */
struct S256 {
	int id;
	T0* a1; /* area */
};

/* Struct for type SPECIAL [NATURAL_8] */
struct S257 {
	int id;
	T6 z1; /* count */
	T8 z2[1]; /* item */
};

/* Struct for type GEANT_STRING_INTERPRETER */
struct S258 {
	int id;
	T0* a1; /* variable_resolver */
};

/* Struct for type KL_ARRAY_ROUTINES [INTEGER_32] */
struct S261 {
	int id;
};

/* Struct for type MANAGED_POINTER */
struct S263 {
	int id;
	T1 a1; /* is_shared */
	T14 a2; /* item */
	T6 a3; /* count */
};

/* Struct for type DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
struct S264 {
	int id;
	T0* a1; /* key_equality_tester */
	T0* a2; /* internal_keys */
	T6 a3; /* count */
	T6 a4; /* capacity */
	T6 a5; /* free_slot */
	T6 a6; /* last_position */
	T0* a7; /* equality_tester */
	T6 a8; /* found_position */
	T6 a9; /* modulus */
	T6 a10; /* position */
	T0* a11; /* clashes */
	T0* a12; /* slots */
	T0* a13; /* item_storage */
	T0* a14; /* key_storage */
	T0* a15; /* internal_cursor */
	T0* a16; /* special_item_routines */
	T0* a17; /* special_key_routines */
	T0* a18; /* hash_function */
	T6 a19; /* slots_position */
	T6 a20; /* clashes_previous_position */
};

/* Struct for type GEANT_GEC_TASK */
struct S265 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type TUPLE [XM_ELEMENT] */
struct S266 {
	int id;
	T0* z1;
};

/* Struct for type TUPLE */
struct S267 {
	int id;
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_GEC_TASK] */
struct S268 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type TUPLE [GEANT_TASK_FACTORY] */
struct S269 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_ISE_TASK */
struct S272 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_ISE_TASK] */
struct S273 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_EXEC_TASK */
struct S274 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_EXEC_TASK] */
struct S275 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_LCC_TASK */
struct S276 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_LCC_TASK] */
struct S277 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_SET_TASK */
struct S278 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_SET_TASK] */
struct S279 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_UNSET_TASK */
struct S280 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_UNSET_TASK] */
struct S281 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_GEXACE_TASK */
struct S282 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* position */
	T0* a4; /* xml_element */
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_GEXACE_TASK] */
struct S283 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_GELEX_TASK */
struct S284 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_GELEX_TASK] */
struct S285 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_GEYACC_TASK */
struct S286 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_GEYACC_TASK] */
struct S287 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_GEPP_TASK */
struct S288 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_GEPP_TASK] */
struct S289 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_GETEST_TASK */
struct S290 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* position */
	T0* a4; /* xml_element */
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_GETEST_TASK] */
struct S291 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_GEANT_TASK */
struct S292 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_GEANT_TASK] */
struct S293 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_ECHO_TASK */
struct S294 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_ECHO_TASK] */
struct S295 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_MKDIR_TASK */
struct S296 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_MKDIR_TASK] */
struct S297 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_DELETE_TASK */
struct S298 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_DELETE_TASK] */
struct S299 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_COPY_TASK */
struct S300 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_COPY_TASK] */
struct S301 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_MOVE_TASK */
struct S302 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_MOVE_TASK] */
struct S303 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_SETENV_TASK */
struct S304 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_SETENV_TASK] */
struct S305 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_XSLT_TASK */
struct S306 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* position */
	T0* a4; /* xml_element */
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_XSLT_TASK] */
struct S307 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_OUTOFDATE_TASK */
struct S308 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_OUTOFDATE_TASK] */
struct S309 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_EXIT_TASK */
struct S310 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_EXIT_TASK] */
struct S311 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_PRECURSOR_TASK */
struct S312 {
	int id;
	T0* a1; /* command */
	T0* a2; /* project */
	T0* a3; /* position */
	T0* a4; /* xml_element */
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_PRECURSOR_TASK] */
struct S313 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_AVAILABLE_TASK */
struct S314 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_AVAILABLE_TASK] */
struct S315 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_INPUT_TASK */
struct S316 {
	int id;
	T0* a1; /* command */
	T0* a2; /* position */
	T0* a3; /* project */
	T0* a4; /* xml_element */
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_INPUT_TASK] */
struct S317 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type GEANT_REPLACE_TASK */
struct S318 {
	int id;
	T0* a1; /* command */
	T0* a2; /* xml_element */
	T0* a3; /* project */
	T0* a4; /* position */
};

/* Struct for type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_REPLACE_TASK] */
struct S319 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*, T0*);
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_PARENT] */
struct S320 {
	int id;
};

/* Struct for type SPECIAL [GEANT_PARENT] */
struct S321 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type UC_UNICODE_ROUTINES */
struct S322 {
	int id;
};

/* Struct for type DS_LINKED_QUEUE [CHARACTER_8] */
struct S324 {
	int id;
	T6 a1; /* count */
	T0* a2; /* first_cell */
	T0* a3; /* last_cell */
};

/* Struct for type UC_UTF16_ROUTINES */
struct S325 {
	int id;
};

/* Struct for type DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
struct S326 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type SPECIAL [NATURAL_64] */
struct S327 {
	int id;
	T6 z1; /* count */
	T11 z2[1]; /* item */
};

/* Struct for type GEANT_RENAME_ELEMENT */
struct S328 {
	int id;
	T0* a1; /* rename_clause */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_REDEFINE_ELEMENT */
struct S329 {
	int id;
	T0* a1; /* redefine_clause */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_SELECT_ELEMENT */
struct S330 {
	int id;
	T0* a1; /* select_clause */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_RENAME */
struct S331 {
	int id;
	T0* a1; /* original_name */
	T0* a2; /* new_name */
};

/* Struct for type DS_HASH_TABLE [GEANT_RENAME, STRING_8] */
struct S332 {
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
struct S333 {
	int id;
	T0* a1; /* name */
};

/* Struct for type DS_HASH_TABLE [GEANT_REDEFINE, STRING_8] */
struct S334 {
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
struct S335 {
	int id;
	T0* a1; /* name */
};

/* Struct for type DS_HASH_TABLE [GEANT_SELECT, STRING_8] */
struct S336 {
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
struct S338 {
	int id;
	T6 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
struct S339 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [XM_EIFFEL_ENTITY_DEF] */
struct S340 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
struct S341 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
};

/* Struct for type DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
struct S342 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
	T0* a3; /* left */
};

/* Struct for type DS_LINKED_LIST_CURSOR [STRING_8] */
struct S343 {
	int id;
	T0* a1; /* container */
	T1 a2; /* before */
	T1 a3; /* after */
	T0* a4; /* current_cell */
	T0* a5; /* next_cursor */
};

/* Struct for type DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S345 {
	int id;
	T6 a1; /* count */
	T0* a2; /* last_cell */
	T0* a3; /* internal_cursor */
	T0* a4; /* first_cell */
};

/* Struct for type DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S346 {
	int id;
	T1 a1; /* before */
	T0* a2; /* current_cell */
	T0* a3; /* next_cursor */
	T0* a4; /* container */
	T1 a5; /* after */
};

/* Struct for type DS_LINKABLE [STRING_8] */
struct S347 {
	int id;
	T0* a1; /* item */
	T0* a2; /* right */
};

/* Struct for type GEANT_NAME_VALUE_ELEMENT */
struct S348 {
	int id;
	T0* a1; /* xml_element */
};

/* Struct for type AP_OPTION_COMPARATOR */
struct S349 {
	int id;
};

/* Struct for type DS_QUICK_SORTER [AP_OPTION] */
struct S350 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type ST_WORD_WRAPPER */
struct S352 {
	int id;
	T6 a1; /* new_line_indentation */
	T6 a2; /* broken_words */
	T6 a3; /* maximum_text_width */
};

/* Struct for type DS_HASH_SET [XM_NAMESPACE] */
struct S354 {
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
struct S355 {
	int id;
	T0* a1; /* data */
	T0* a2; /* parent */
};

/* Struct for type XM_PROCESSING_INSTRUCTION */
struct S356 {
	int id;
	T0* a1; /* target */
	T0* a2; /* data */
	T0* a3; /* parent */
};

/* Struct for type XM_CHARACTER_DATA */
struct S357 {
	int id;
	T0* a1; /* content */
	T0* a2; /* parent */
};

/* Struct for type XM_NAMESPACE */
struct S358 {
	int id;
	T0* a1; /* uri */
	T0* a2; /* ns_prefix */
};

/* Struct for type DS_LINKABLE [XM_NODE] */
struct S361 {
	int id;
	T0* a1; /* right */
	T0* a2; /* item */
};

/* Struct for type XM_NODE_TYPER */
struct S363 {
	int id;
	T0* a1; /* element */
	T0* a2; /* xml_attribute */
	T0* a3; /* composite */
	T0* a4; /* document */
	T0* a5; /* character_data */
	T0* a6; /* processing_instruction */
	T0* a7; /* comment */
};

/* Struct for type KL_CHARACTER_BUFFER */
struct S367 {
	int id;
	T0* a1; /* as_special */
	T0* a2; /* area */
};

/* Struct for type EXCEPTIONS */
struct S369 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
struct S371 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
struct S373 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
struct S374 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
struct S375 {
	int id;
};

/* Struct for type GEANT_GEC_COMMAND */
struct S376 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T1 a3; /* c_compile */
	T1 a4; /* split_mode */
	T0* a5; /* ace_filename */
	T0* a6; /* clean */
	T1 a7; /* finalize */
	T0* a8; /* catcall_mode */
	T6 a9; /* split_size */
	T0* a10; /* garbage_collector */
	T0* a11; /* exit_code_variable_name */
	T6 a12; /* exit_code */
};

/* Struct for type DS_CELL [PROCEDURE [ANY, TUPLE]] */
struct S377 {
	int id;
	T0* a1; /* item */
};

/* Struct for type PROCEDURE [GEANT_GEC_TASK, TUPLE] */
struct S378 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_GEC_TASK] */
struct S379 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_ISE_COMMAND */
struct S380 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* ace_filename */
	T0* a4; /* system_name */
	T0* a5; /* clean */
	T1 a6; /* finalize_mode */
	T1 a7; /* finish_freezing */
	T0* a8; /* exit_code_variable_name */
	T6 a9; /* exit_code */
};

/* Struct for type PROCEDURE [GEANT_ISE_TASK, TUPLE] */
struct S381 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_ISE_TASK] */
struct S382 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_FILESET_ELEMENT */
struct S383 {
	int id;
	T0* a1; /* fileset */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_EXEC_COMMAND */
struct S384 {
	int id;
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
struct S385 {
	int id;
	T0* a1; /* string_value_agent */
	T1 a2; /* has_been_retrieved */
	T0* a3; /* retrieved_string_value */
};

/* Struct for type FUNCTION [GEANT_INTERPRETING_ELEMENT, TUPLE, STRING_8] */
struct S386 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T0* (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_INTERPRETING_ELEMENT, STRING_8] */
struct S387 {
	int id;
	T0* z1;
	T0* z2;
};

/* Struct for type GEANT_BOOLEAN_PROPERTY */
struct S388 {
	int id;
	T0* a1; /* string_value_agent */
	T1 a2; /* has_been_retrieved */
	T0* a3; /* retrieved_string_value */
};

/* Struct for type GEANT_FILESET */
struct S389 {
	int id;
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

/* Struct for type PROCEDURE [GEANT_EXEC_TASK, TUPLE] */
struct S390 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_EXEC_TASK] */
struct S391 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_LCC_COMMAND */
struct S392 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* executable */
	T0* a4; /* source_filename */
	T6 a5; /* exit_code */
};

/* Struct for type PROCEDURE [GEANT_LCC_TASK, TUPLE] */
struct S393 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_LCC_TASK] */
struct S394 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_SET_COMMAND */
struct S395 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* name */
	T0* a4; /* value */
	T6 a5; /* exit_code */
};

/* Struct for type PROCEDURE [GEANT_SET_TASK, TUPLE] */
struct S396 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_SET_TASK] */
struct S397 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_UNSET_COMMAND */
struct S398 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* name */
	T6 a4; /* exit_code */
};

/* Struct for type PROCEDURE [GEANT_UNSET_TASK, TUPLE] */
struct S399 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_UNSET_TASK] */
struct S400 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_DEFINE_ELEMENT */
struct S401 {
	int id;
	T0* a1; /* project */
	T0* a2; /* xml_element */
	T0* a3; /* position */
};

/* Struct for type GEANT_GEXACE_COMMAND */
struct S402 {
	int id;
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

/* Struct for type PROCEDURE [GEANT_GEXACE_TASK, TUPLE] */
struct S403 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_GEXACE_TASK] */
struct S404 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_GELEX_COMMAND */
struct S405 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* output_filename */
	T0* a4; /* input_filename */
	T0* a5; /* size */
	T1 a6; /* ecs */
	T1 a7; /* meta_ecs */
	T1 a8; /* backup */
	T1 a9; /* full */
	T1 a10; /* case_insensitive */
	T1 a11; /* no_default */
	T1 a12; /* no_warn */
	T1 a13; /* separate_actions */
	T6 a14; /* exit_code */
};

/* Struct for type PROCEDURE [GEANT_GELEX_TASK, TUPLE] */
struct S406 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_GELEX_TASK] */
struct S407 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_GEYACC_COMMAND */
struct S408 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* output_filename */
	T0* a4; /* input_filename */
	T1 a5; /* separate_actions */
	T0* a6; /* verbose_filename */
	T1 a7; /* old_typing */
	T1 a8; /* new_typing */
	T0* a9; /* tokens_classname */
	T0* a10; /* tokens_filename */
	T6 a11; /* exit_code */
};

/* Struct for type PROCEDURE [GEANT_GEYACC_TASK, TUPLE] */
struct S409 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_GEYACC_TASK] */
struct S410 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_GEPP_COMMAND */
struct S411 {
	int id;
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

/* Struct for type PROCEDURE [GEANT_GEPP_TASK, TUPLE] */
struct S412 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_GEPP_TASK] */
struct S413 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_GETEST_COMMAND */
struct S414 {
	int id;
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

/* Struct for type PROCEDURE [GEANT_GETEST_TASK, TUPLE] */
struct S415 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_GETEST_TASK] */
struct S416 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_GEANT_COMMAND */
struct S417 {
	int id;
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

/* Struct for type ST_SPLITTER */
struct S418 {
	int id;
	T1 a1; /* has_escape_character */
	T2 a2; /* escape_character */
	T0* a3; /* separator_codes */
	T0* a4; /* separators */
};

/* Struct for type PROCEDURE [GEANT_GEANT_TASK, TUPLE] */
struct S419 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_GEANT_TASK] */
struct S420 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_ECHO_COMMAND */
struct S421 {
	int id;
	T0* a1; /* message_property */
	T0* a2; /* to_file_property */
	T0* a3; /* append_property */
	T0* a4; /* log_validation_messages_agent_cell */
	T0* a5; /* project */
	T0* a6; /* message_only_agent_cell */
	T0* a7; /* message_with_file_agent_cell */
	T6 a8; /* exit_code */
};

/* Struct for type PROCEDURE [GEANT_ECHO_TASK, TUPLE] */
struct S422 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_ECHO_TASK] */
struct S423 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_MKDIR_COMMAND */
struct S424 {
	int id;
	T0* a1; /* directory */
	T0* a2; /* log_validation_messages_agent_cell */
	T0* a3; /* project */
	T0* a4; /* mkdir_agent_cell */
	T6 a5; /* exit_code */
};

/* Struct for type PROCEDURE [GEANT_MKDIR_TASK, TUPLE] */
struct S425 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_MKDIR_TASK] */
struct S426 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_DIRECTORYSET_ELEMENT */
struct S427 {
	int id;
	T0* a1; /* directoryset */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_DELETE_COMMAND */
struct S428 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* directory */
	T0* a4; /* file */
	T0* a5; /* fileset */
	T0* a6; /* directoryset */
	T6 a7; /* exit_code */
};

/* Struct for type GEANT_DIRECTORYSET */
struct S429 {
	int id;
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

/* Struct for type PROCEDURE [GEANT_DELETE_TASK, TUPLE] */
struct S430 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_DELETE_TASK] */
struct S431 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_COPY_COMMAND */
struct S432 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* file */
	T0* a4; /* to_file */
	T0* a5; /* to_directory */
	T1 a6; /* force */
	T0* a7; /* fileset */
	T6 a8; /* exit_code */
};

/* Struct for type PROCEDURE [GEANT_COPY_TASK, TUPLE] */
struct S433 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_COPY_TASK] */
struct S434 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_MOVE_COMMAND */
struct S435 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* file */
	T0* a4; /* to_file */
	T0* a5; /* to_directory */
	T0* a6; /* fileset */
	T6 a7; /* exit_code */
};

/* Struct for type PROCEDURE [GEANT_MOVE_TASK, TUPLE] */
struct S436 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_MOVE_TASK] */
struct S437 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_SETENV_COMMAND */
struct S438 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T0* a3; /* name */
	T0* a4; /* value */
	T6 a5; /* exit_code */
};

/* Struct for type PROCEDURE [GEANT_SETENV_TASK, TUPLE] */
struct S439 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_SETENV_TASK] */
struct S440 {
	int id;
	T0* z1;
};

/* Struct for type DS_PAIR [STRING_8, STRING_8] */
struct S441 {
	int id;
	T0* a1; /* first */
	T0* a2; /* second */
};

/* Struct for type GEANT_XSLT_COMMAND */
struct S442 {
	int id;
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
struct S443 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T6 a5; /* count */
};

/* Struct for type PROCEDURE [GEANT_XSLT_TASK, TUPLE] */
struct S444 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_XSLT_TASK] */
struct S445 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_OUTOFDATE_COMMAND */
struct S446 {
	int id;
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

/* Struct for type PROCEDURE [GEANT_OUTOFDATE_TASK, TUPLE] */
struct S447 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_OUTOFDATE_TASK] */
struct S448 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_EXIT_COMMAND */
struct S449 {
	int id;
	T0* a1; /* log_validation_messages_agent_cell */
	T0* a2; /* project */
	T6 a3; /* code */
	T6 a4; /* exit_code */
};

/* Struct for type PROCEDURE [GEANT_EXIT_TASK, TUPLE] */
struct S450 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_EXIT_TASK] */
struct S451 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_PRECURSOR_COMMAND */
struct S452 {
	int id;
	T0* a1; /* arguments */
	T0* a2; /* log_validation_messages_agent_cell */
	T0* a3; /* project */
	T0* a4; /* parent */
	T6 a5; /* exit_code */
};

/* Struct for type PROCEDURE [GEANT_PRECURSOR_TASK, TUPLE] */
struct S453 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_PRECURSOR_TASK] */
struct S454 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_AVAILABLE_COMMAND */
struct S455 {
	int id;
	T0* a1; /* resource_name */
	T0* a2; /* variable_name */
	T0* a3; /* true_value */
	T0* a4; /* false_value */
	T0* a5; /* log_validation_messages_agent_cell */
	T0* a6; /* project */
	T0* a7; /* available_agent_cell */
	T6 a8; /* exit_code */
};

/* Struct for type PROCEDURE [GEANT_AVAILABLE_TASK, TUPLE] */
struct S456 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_AVAILABLE_TASK] */
struct S457 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_INPUT_COMMAND */
struct S458 {
	int id;
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

/* Struct for type PROCEDURE [GEANT_INPUT_TASK, TUPLE] */
struct S459 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_INPUT_TASK] */
struct S460 {
	int id;
	T0* z1;
};

/* Struct for type GEANT_REPLACE_COMMAND */
struct S461 {
	int id;
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

/* Struct for type PROCEDURE [GEANT_REPLACE_TASK, TUPLE] */
struct S462 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*);
};

/* Struct for type TUPLE [GEANT_REPLACE_TASK] */
struct S463 {
	int id;
	T0* z1;
};

/* Struct for type TO_SPECIAL [GEANT_PARENT] */
struct S464 {
	int id;
	T0* a1; /* area */
};

/* Struct for type SPECIAL [ARRAY [INTEGER_32]] */
struct S465 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
struct S466 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_LINKABLE [CHARACTER_8] */
struct S467 {
	int id;
	T2 a1; /* item */
	T0* a2; /* right */
};

/* Struct for type KL_EQUALITY_TESTER [GEANT_RENAME] */
struct S468 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [GEANT_RENAME, STRING_8] */
struct S469 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type SPECIAL [GEANT_RENAME] */
struct S471 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8] */
struct S472 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_RENAME] */
struct S473 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [GEANT_REDEFINE] */
struct S474 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [GEANT_REDEFINE, STRING_8] */
struct S475 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type SPECIAL [GEANT_REDEFINE] */
struct S477 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8] */
struct S478 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_REDEFINE] */
struct S479 {
	int id;
};

/* Struct for type KL_EQUALITY_TESTER [GEANT_SELECT] */
struct S480 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS [GEANT_SELECT, STRING_8] */
struct S481 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type SPECIAL [GEANT_SELECT] */
struct S483 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8] */
struct S484 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_SELECT] */
struct S485 {
	int id;
};

/* Struct for type DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
struct S487 {
	int id;
	T0* a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
};

/* Struct for type KL_DIRECTORY */
struct S488 {
	int id;
	T0* a1; /* string_name */
	T0* a2; /* name */
	T6 a3; /* mode */
	T14 a4; /* directory_pointer */
	T1 a5; /* end_of_input */
	T0* a6; /* last_entry */
	T0* a7; /* entry_buffer */
	T0* a8; /* lastentry */
};

/* Struct for type KL_STRING_INPUT_STREAM */
struct S489 {
	int id;
	T1 a1; /* end_of_input */
	T2 a2; /* last_character */
	T0* a3; /* string */
	T6 a4; /* location */
};

/* Struct for type SPECIAL [XM_NAMESPACE] */
struct S490 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_EQUALITY_TESTER [XM_NAMESPACE] */
struct S491 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [XM_NAMESPACE] */
struct S492 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
struct S493 {
	int id;
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
struct S494 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
struct S495 {
	int id;
	T0* a1; /* area */
};

/* Struct for type GEANT_MAP_ELEMENT */
struct S498 {
	int id;
	T0* a1; /* map */
	T0* a2; /* project */
	T0* a3; /* xml_element */
	T0* a4; /* position */
};

/* Struct for type GEANT_MAP */
struct S499 {
	int id;
	T0* a1; /* project */
	T0* a2; /* type */
	T0* a3; /* source_pattern */
	T0* a4; /* target_pattern */
	T0* a5; /* map */
};

/* Struct for type DS_HASH_SET [GEANT_FILESET_ENTRY] */
struct S502 {
	int id;
	T0* a1; /* equality_tester */
	T6 a2; /* capacity */
	T6 a3; /* modulus */
	T6 a4; /* last_position */
	T6 a5; /* free_slot */
	T6 a6; /* position */
	T0* a7; /* internal_cursor */
	T0* a8; /* special_item_routines */
	T0* a9; /* item_storage */
	T0* a10; /* clashes */
	T0* a11; /* slots */
	T6 a12; /* found_position */
	T6 a13; /* slots_position */
	T6 a14; /* count */
	T6 a15; /* clashes_previous_position */
	T0* a16; /* hash_function */
};

/* Struct for type DS_HASH_SET [STRING_8] */
struct S504 {
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

/* Struct for type LX_DFA_WILDCARD */
struct S506 {
	int id;
	T0* a1; /* yy_nxt */
	T0* a2; /* yy_accept */
	T6 a3; /* yyNb_rows */
	T6 a4; /* match_count */
	T6 a5; /* subject_start */
	T6 a6; /* subject_end */
	T0* a7; /* subject */
	T6 a8; /* matched_start */
	T6 a9; /* matched_end */
};

/* Struct for type DS_HASH_SET [INTEGER_32] */
struct S508 {
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

/* Struct for type DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8]]] */
struct S509 {
	int id;
	T0* a1; /* item */
};

/* Struct for type TUPLE [STRING_8] */
struct S510 {
	int id;
	T0* z1;
};

/* Struct for type PROCEDURE [GEANT_ECHO_COMMAND, TUPLE [STRING_8]] */
struct S511 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*, T0*);
};

/* Struct for type TUPLE [GEANT_ECHO_COMMAND] */
struct S512 {
	int id;
	T0* z1;
};

/* Struct for type DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]]] */
struct S514 {
	int id;
	T0* a1; /* item */
};

/* Struct for type KL_TEXT_OUTPUT_FILE */
struct S515 {
	int id;
	T0* a1; /* name */
	T6 a2; /* mode */
	T0* a3; /* string_name */
	T14 a4; /* file_pointer */
	T1 a5; /* descriptor_available */
};

/* Struct for type TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN] */
struct S516 {
	int id;
	T0* z1;
	T0* z2;
	T1 z3;
};

/* Struct for type PROCEDURE [GEANT_ECHO_COMMAND, TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]] */
struct S517 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*, T0*, T0*, T1);
};

/* Struct for type PROCEDURE [GEANT_MKDIR_COMMAND, TUPLE [STRING_8]] */
struct S519 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	void (*f)(T0*, T0*);
};

/* Struct for type TUPLE [GEANT_MKDIR_COMMAND] */
struct S520 {
	int id;
	T0* z1;
};

/* Struct for type KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]] */
struct S521 {
	int id;
};

/* Struct for type SPECIAL [DS_PAIR [STRING_8, STRING_8]] */
struct S522 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING_8, STRING_8]] */
struct S523 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_CELL [FUNCTION [ANY, TUPLE [STRING_8], BOOLEAN]] */
struct S524 {
	int id;
	T0* a1; /* item */
};

/* Struct for type PREDICATE [GEANT_AVAILABLE_COMMAND, TUPLE [STRING_8]] */
struct S525 {
	int id;
	T0* a1; /* closed_operands */
	T1 a2; /* is_target_closed */
	T1 (*f)(T0*, T0*);
};

/* Struct for type TUPLE [GEANT_AVAILABLE_COMMAND] */
struct S526 {
	int id;
	T0* z1;
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_RENAME, STRING_8] */
struct S528 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [GEANT_RENAME] */
struct S529 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_REDEFINE, STRING_8] */
struct S530 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [GEANT_REDEFINE] */
struct S531 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_SELECT, STRING_8] */
struct S532 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [GEANT_SELECT] */
struct S533 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [XM_NAMESPACE] */
struct S538 {
	int id;
	T0* a1; /* area */
};

/* Struct for type KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY] */
struct S540 {
	int id;
};

/* Struct for type DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY] */
struct S541 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY] */
struct S542 {
	int id;
};

/* Struct for type GEANT_FILESET_ENTRY */
struct S543 {
	int id;
	T0* a1; /* filename */
	T0* a2; /* mapped_filename */
};

/* Struct for type SPECIAL [GEANT_FILESET_ENTRY] */
struct S544 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type DS_HASH_SET_CURSOR [STRING_8] */
struct S545 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type LX_WILDCARD_PARSER */
struct S546 {
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
	T0* a30; /* yyr1 */
	T6 a31; /* yyssp */
	T0* a32; /* yypgoto */
	T0* a33; /* yycheck */
	T0* a34; /* yytable */
	T0* a35; /* yydefgoto */
	T6 a36; /* error_count */
	T1 a37; /* yy_lookahead_needed */
	T6 a38; /* yyerrstatus */
	T0* a39; /* yypact */
	T6 a40; /* last_token */
	T0* a41; /* yytranslate */
	T0* a42; /* yydefact */
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
struct S547 {
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
struct S548 {
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
struct S550 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_EQUALITY_TESTER [INTEGER_32] */
struct S551 {
	int id;
};

/* Struct for type TO_SPECIAL [DS_PAIR [STRING_8, STRING_8]] */
struct S552 {
	int id;
	T0* a1; /* area */
};

/* Struct for type KL_NULL_TEXT_OUTPUT_STREAM */
struct S556 {
	int id;
	T0* a1; /* name */
};

/* Struct for type PLATFORM */
struct S557 {
	int id;
};

/* Struct for type DP_SHELL_COMMAND */
struct S559 {
	int id;
	T6 a1; /* exit_code */
	T0* a2; /* string_command */
	T0* a3; /* command */
	T6 a4; /* return_code */
	T1 a5; /* is_system_code */
};

/* Struct for type DS_CELL [BOOLEAN] */
struct S560 {
	int id;
	T1 a1; /* item */
};

/* Struct for type KL_BOOLEAN_ROUTINES */
struct S562 {
	int id;
};

/* Struct for type ARRAY [BOOLEAN] */
struct S563 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type GEANT_VARIABLES_VARIABLE_RESOLVER */
struct S564 {
	int id;
	T0* a1; /* variables */
};

/* Struct for type RX_PCRE_REGULAR_EXPRESSION */
struct S565 {
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
struct S566 {
	int id;
};

/* Struct for type KL_STDIN_FILE */
struct S567 {
	int id;
	T0* a1; /* last_string */
	T1 a2; /* end_of_file */
	T2 a3; /* last_character */
	T14 a4; /* file_pointer */
	T0* a5; /* character_buffer */
	T0* a6; /* name */
	T6 a7; /* mode */
};

/* Struct for type ARRAY [GEANT_VARIABLES] */
struct S568 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type TO_SPECIAL [GEANT_FILESET_ENTRY] */
struct S571 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_ARRAYED_LIST [LX_RULE] */
struct S572 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type LX_START_CONDITIONS */
struct S573 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* special_routines */
	T6 a4; /* capacity */
	T0* a5; /* internal_cursor */
};

/* Struct for type LX_ACTION_FACTORY */
struct S574 {
	int id;
};

/* Struct for type DS_ARRAYED_STACK [INTEGER_32] */
struct S575 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
};

/* Struct for type DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8] */
struct S576 {
	int id;
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
	T0* a14; /* clashes */
	T0* a15; /* slots */
	T0* a16; /* key_storage */
	T0* a17; /* internal_cursor */
	T0* a18; /* special_item_routines */
	T0* a19; /* special_key_routines */
	T0* a20; /* hash_function */
};

/* Struct for type LX_SYMBOL_CLASS */
struct S577 {
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
struct S578 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS] */
struct S579 {
	int id;
};

/* Struct for type LX_NFA */
struct S580 {
	int id;
	T1 a1; /* in_trail_context */
	T0* a2; /* states */
};

/* Struct for type LX_EQUIVALENCE_CLASSES */
struct S581 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
};

/* Struct for type LX_RULE */
struct S582 {
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
struct S583 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_NFA] */
struct S584 {
	int id;
};

/* Struct for type UT_SYNTAX_ERROR */
struct S585 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
struct S586 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
	T0* a3; /* next_cursor */
};

/* Struct for type LX_UNRECOGNIZED_RULE_ERROR */
struct S587 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_MISSING_QUOTE_ERROR */
struct S588 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_BAD_CHARACTER_CLASS_ERROR */
struct S589 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_BAD_CHARACTER_ERROR */
struct S590 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_FULL_AND_META_ERROR */
struct S591 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_FULL_AND_REJECT_ERROR */
struct S592 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR */
struct S593 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type LX_CHARACTER_OUT_OF_RANGE_ERROR */
struct S594 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type SPECIAL [LX_RULE] */
struct S595 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [LX_RULE] */
struct S596 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type LX_DFA_STATE */
struct S597 {
	int id;
	T0* a1; /* accepted_rules */
	T0* a2; /* states */
	T0* a3; /* transitions */
	T0* a4; /* accepted_head_rules */
	T6 a5; /* code */
	T6 a6; /* id */
};

/* Struct for type DS_ARRAYED_LIST [LX_NFA_STATE] */
struct S598 {
	int id;
	T6 a1; /* count */
	T0* a2; /* storage */
	T0* a3; /* equality_tester */
	T0* a4; /* special_routines */
	T6 a5; /* capacity */
	T0* a6; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST [LX_DFA_STATE] */
struct S599 {
	int id;
	T6 a1; /* count */
	T6 a2; /* capacity */
	T0* a3; /* storage */
	T0* a4; /* special_routines */
	T0* a5; /* internal_cursor */
};

/* Struct for type LX_SYMBOL_PARTITIONS */
struct S600 {
	int id;
	T0* a1; /* symbols */
	T0* a2; /* storage */
	T6 a3; /* count */
};

/* Struct for type LX_START_CONDITION */
struct S601 {
	int id;
	T0* a1; /* name */
	T6 a2; /* id */
	T1 a3; /* is_exclusive */
	T0* a4; /* patterns */
	T0* a5; /* bol_patterns */
};

/* Struct for type LX_TRANSITION_TABLE [LX_DFA_STATE] */
struct S602 {
	int id;
	T0* a1; /* storage */
	T0* a2; /* array_routines */
	T6 a3; /* count */
};

/* Struct for type DS_ARRAYED_LIST [LX_NFA] */
struct S603 {
	int id;
	T0* a1; /* special_routines */
	T0* a2; /* storage */
	T6 a3; /* capacity */
	T0* a4; /* internal_cursor */
	T6 a5; /* count */
};

/* Struct for type DS_HASH_TABLE [LX_NFA, INTEGER_32] */
struct S604 {
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
struct S605 {
	int id;
	T1 a1; /* in_trail_context */
	T0* a2; /* transition */
	T0* a3; /* epsilon_transition */
	T6 a4; /* id */
	T0* a5; /* accepted_rule */
};

/* Struct for type LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR */
struct S607 {
	int id;
	T0* a1; /* parameters */
};

/* Struct for type RX_BYTE_CODE */
struct S609 {
	int id;
	T6 a1; /* count */
	T0* a2; /* byte_code */
	T0* a3; /* character_sets */
	T6 a4; /* capacity */
	T6 a5; /* character_sets_count */
	T6 a6; /* character_sets_capacity */
};

/* Struct for type RX_CASE_MAPPING */
struct S610 {
	int id;
	T0* a1; /* lower_table */
	T0* a2; /* flip_table */
};

/* Struct for type RX_CHARACTER_SET */
struct S611 {
	int id;
	T0* a1; /* set */
};

/* Struct for type SPECIAL [RX_CHARACTER_SET] */
struct S613 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [RX_CHARACTER_SET] */
struct S614 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_RULE] */
struct S615 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_RULE] */
struct S616 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [LX_START_CONDITION] */
struct S617 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_START_CONDITION] */
struct S618 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION] */
struct S619 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING_8] */
struct S621 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
struct S623 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type TO_SPECIAL [LX_SYMBOL_CLASS] */
struct S624 {
	int id;
	T0* a1; /* area */
};

/* Struct for type LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE] */
struct S625 {
	int id;
	T0* a1; /* label */
	T0* a2; /* target */
};

/* Struct for type LX_EPSILON_TRANSITION [LX_NFA_STATE] */
struct S627 {
	int id;
	T0* a1; /* target */
};

/* Struct for type LX_SYMBOL_TRANSITION [LX_NFA_STATE] */
struct S629 {
	int id;
	T6 a1; /* label */
	T0* a2; /* target */
};

/* Struct for type DS_BILINKABLE [INTEGER_32] */
struct S630 {
	int id;
	T6 a1; /* item */
	T0* a2; /* left */
	T0* a3; /* right */
};

/* Struct for type SPECIAL [DS_BILINKABLE [INTEGER_32]] */
struct S631 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type ARRAY [DS_BILINKABLE [INTEGER_32]] */
struct S632 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type LX_ACTION */
struct S634 {
	int id;
	T0* a1; /* text */
};

/* Struct for type TO_SPECIAL [LX_NFA] */
struct S635 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_BUBBLE_SORTER [LX_NFA_STATE] */
struct S636 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type DS_BUBBLE_SORTER [LX_RULE] */
struct S638 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type SPECIAL [LX_NFA_STATE] */
struct S640 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_NFA_STATE] */
struct S642 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE] */
struct S643 {
	int id;
	T6 a1; /* position */
	T0* a2; /* next_cursor */
	T0* a3; /* container */
};

/* Struct for type SPECIAL [LX_DFA_STATE] */
struct S645 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_SPECIAL_ROUTINES [LX_DFA_STATE] */
struct S646 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE] */
struct S647 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type ARRAY [LX_DFA_STATE] */
struct S648 {
	int id;
	T0* a1; /* area */
	T6 a2; /* lower */
	T6 a3; /* upper */
};

/* Struct for type KL_ARRAY_ROUTINES [LX_DFA_STATE] */
struct S649 {
	int id;
};

/* Struct for type DS_ARRAYED_LIST_CURSOR [LX_NFA] */
struct S650 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type DS_SPARSE_TABLE_KEYS [LX_NFA, INTEGER_32] */
struct S652 {
	int id;
	T0* a1; /* table */
	T0* a2; /* equality_tester */
	T0* a3; /* internal_cursor */
};

/* Struct for type DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32] */
struct S654 {
	int id;
	T0* a1; /* container */
	T6 a2; /* position */
};

/* Struct for type KL_BINARY_INPUT_FILE */
struct S655 {
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
struct S656 {
	int id;
	T6 a1; /* mode */
	T0* a2; /* name */
	T0* a3; /* string_name */
	T14 a4; /* file_pointer */
	T1 a5; /* descriptor_available */
};

/* Struct for type GE_HASH_TABLE [C_STRING, STRING_8] */
struct S657 {
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
struct S659 {
	int id;
	T6 a1; /* count */
	T6 a2; /* internal_hash_code */
	T0* a3; /* area */
};

/* Struct for type RAW_FILE */
struct S660 {
	int id;
	T0* a1; /* name */
	T6 a2; /* mode */
	T14 a3; /* file_pointer */
	T1 a4; /* descriptor_available */
};

/* Struct for type DIRECTORY */
struct S661 {
	int id;
	T0* a1; /* lastentry */
	T0* a2; /* name */
	T6 a3; /* mode */
	T14 a4; /* directory_pointer */
};

/* Struct for type ARRAYED_LIST [STRING_8] */
struct S662 {
	int id;
	T6 a1; /* index */
	T6 a2; /* count */
	T0* a3; /* area */
	T6 a4; /* lower */
	T6 a5; /* upper */
};

/* Struct for type KL_COMPARABLE_COMPARATOR [LX_RULE] */
struct S665 {
	int id;
};

/* Struct for type KL_COMPARABLE_COMPARATOR [LX_NFA_STATE] */
struct S668 {
	int id;
};

/* Struct for type TO_SPECIAL [LX_RULE] */
struct S671 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [LX_START_CONDITION] */
struct S672 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
struct S673 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type TO_SPECIAL [LX_NFA_STATE] */
struct S674 {
	int id;
	T0* a1; /* area */
};

/* Struct for type TO_SPECIAL [LX_DFA_STATE] */
struct S675 {
	int id;
	T0* a1; /* area */
};

/* Struct for type DS_SPARSE_TABLE_KEYS_CURSOR [LX_NFA, INTEGER_32] */
struct S676 {
	int id;
	T0* a1; /* container */
	T0* a2; /* table_cursor */
};

/* Struct for type STRING_SEARCHER */
struct S677 {
	int id;
	T0* a1; /* deltas */
};

/* Struct for type GE_STRING_EQUALITY_TESTER */
struct S678 {
	int id;
};

/* Struct for type DS_SHELL_SORTER [INTEGER_32] */
struct S680 {
	int id;
	T0* a1; /* comparator */
};

/* Struct for type PRIMES */
struct S683 {
	int id;
};

/* Struct for type SPECIAL [C_STRING] */
struct S684 {
	int id;
	T6 z1; /* count */
	T0* z2[1]; /* item */
};

/* Struct for type KL_COMPARABLE_COMPARATOR [INTEGER_32] */
struct S688 {
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
extern T81 GE_default81;
extern T83 GE_default83;
extern T84 GE_default84;
extern T86 GE_default86;
extern T87 GE_default87;
extern T88 GE_default88;
extern T90 GE_default90;
extern T92 GE_default92;
extern T93 GE_default93;
extern T96 GE_default96;
extern T97 GE_default97;
extern T98 GE_default98;
extern T99 GE_default99;
extern T100 GE_default100;
extern T103 GE_default103;
extern T104 GE_default104;
extern T105 GE_default105;
extern T106 GE_default106;
extern T107 GE_default107;
extern T108 GE_default108;
extern T109 GE_default109;
extern T111 GE_default111;
extern T112 GE_default112;
extern T113 GE_default113;
extern T114 GE_default114;
extern T115 GE_default115;
extern T116 GE_default116;
extern T118 GE_default118;
extern T120 GE_default120;
extern T121 GE_default121;
extern T122 GE_default122;
extern T123 GE_default123;
extern T124 GE_default124;
extern T126 GE_default126;
extern T128 GE_default128;
extern T129 GE_default129;
extern T130 GE_default130;
extern T132 GE_default132;
extern T133 GE_default133;
extern T135 GE_default135;
extern T136 GE_default136;
extern T137 GE_default137;
extern T138 GE_default138;
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
extern T163 GE_default163;
extern T165 GE_default165;
extern T166 GE_default166;
extern T167 GE_default167;
extern T168 GE_default168;
extern T169 GE_default169;
extern T170 GE_default170;
extern T171 GE_default171;
extern T173 GE_default173;
extern T174 GE_default174;
extern T176 GE_default176;
extern T177 GE_default177;
extern T178 GE_default178;
extern T179 GE_default179;
extern T180 GE_default180;
extern T181 GE_default181;
extern T182 GE_default182;
extern T183 GE_default183;
extern T184 GE_default184;
extern T186 GE_default186;
extern T187 GE_default187;
extern T188 GE_default188;
extern T190 GE_default190;
extern T191 GE_default191;
extern T192 GE_default192;
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
extern T208 GE_default208;
extern T209 GE_default209;
extern T210 GE_default210;
extern T211 GE_default211;
extern T212 GE_default212;
extern T213 GE_default213;
extern T214 GE_default214;
extern T215 GE_default215;
extern T217 GE_default217;
extern T218 GE_default218;
extern T219 GE_default219;
extern T220 GE_default220;
extern T221 GE_default221;
extern T224 GE_default224;
extern T225 GE_default225;
extern T226 GE_default226;
extern T227 GE_default227;
extern T228 GE_default228;
extern T229 GE_default229;
extern T231 GE_default231;
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
extern T254 GE_default254;
extern T255 GE_default255;
extern T256 GE_default256;
extern T257 GE_default257;
extern T258 GE_default258;
extern T261 GE_default261;
extern T263 GE_default263;
extern T264 GE_default264;
extern T265 GE_default265;
extern T266 GE_default266;
extern T267 GE_default267;
extern T268 GE_default268;
extern T269 GE_default269;
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
extern T316 GE_default316;
extern T317 GE_default317;
extern T318 GE_default318;
extern T319 GE_default319;
extern T320 GE_default320;
extern T321 GE_default321;
extern T322 GE_default322;
extern T324 GE_default324;
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
extern T336 GE_default336;
extern T338 GE_default338;
extern T339 GE_default339;
extern T340 GE_default340;
extern T341 GE_default341;
extern T342 GE_default342;
extern T343 GE_default343;
extern T345 GE_default345;
extern T346 GE_default346;
extern T347 GE_default347;
extern T348 GE_default348;
extern T349 GE_default349;
extern T350 GE_default350;
extern T352 GE_default352;
extern T354 GE_default354;
extern T355 GE_default355;
extern T356 GE_default356;
extern T357 GE_default357;
extern T358 GE_default358;
extern T361 GE_default361;
extern T363 GE_default363;
extern T367 GE_default367;
extern T368 GE_default368;
extern T369 GE_default369;
extern T371 GE_default371;
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
extern T401 GE_default401;
extern T402 GE_default402;
extern T403 GE_default403;
extern T404 GE_default404;
extern T405 GE_default405;
extern T406 GE_default406;
extern T407 GE_default407;
extern T408 GE_default408;
extern T409 GE_default409;
extern T410 GE_default410;
extern T411 GE_default411;
extern T412 GE_default412;
extern T413 GE_default413;
extern T414 GE_default414;
extern T415 GE_default415;
extern T416 GE_default416;
extern T417 GE_default417;
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
extern T471 GE_default471;
extern T472 GE_default472;
extern T473 GE_default473;
extern T474 GE_default474;
extern T475 GE_default475;
extern T477 GE_default477;
extern T478 GE_default478;
extern T479 GE_default479;
extern T480 GE_default480;
extern T481 GE_default481;
extern T483 GE_default483;
extern T484 GE_default484;
extern T485 GE_default485;
extern T487 GE_default487;
extern T488 GE_default488;
extern T489 GE_default489;
extern T490 GE_default490;
extern T491 GE_default491;
extern T492 GE_default492;
extern T493 GE_default493;
extern T494 GE_default494;
extern T495 GE_default495;
extern T498 GE_default498;
extern T499 GE_default499;
extern T502 GE_default502;
extern T504 GE_default504;
extern T506 GE_default506;
extern T508 GE_default508;
extern T509 GE_default509;
extern T510 GE_default510;
extern T511 GE_default511;
extern T512 GE_default512;
extern T514 GE_default514;
extern T515 GE_default515;
extern T516 GE_default516;
extern T517 GE_default517;
extern T519 GE_default519;
extern T520 GE_default520;
extern T521 GE_default521;
extern T522 GE_default522;
extern T523 GE_default523;
extern T524 GE_default524;
extern T525 GE_default525;
extern T526 GE_default526;
extern T528 GE_default528;
extern T529 GE_default529;
extern T530 GE_default530;
extern T531 GE_default531;
extern T532 GE_default532;
extern T533 GE_default533;
extern T538 GE_default538;
extern T540 GE_default540;
extern T541 GE_default541;
extern T542 GE_default542;
extern T543 GE_default543;
extern T544 GE_default544;
extern T545 GE_default545;
extern T546 GE_default546;
extern T547 GE_default547;
extern T548 GE_default548;
extern T550 GE_default550;
extern T551 GE_default551;
extern T552 GE_default552;
extern T556 GE_default556;
extern T557 GE_default557;
extern T559 GE_default559;
extern T560 GE_default560;
extern T562 GE_default562;
extern T563 GE_default563;
extern T564 GE_default564;
extern T565 GE_default565;
extern T566 GE_default566;
extern T567 GE_default567;
extern T568 GE_default568;
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
extern T607 GE_default607;
extern T609 GE_default609;
extern T610 GE_default610;
extern T611 GE_default611;
extern T613 GE_default613;
extern T614 GE_default614;
extern T615 GE_default615;
extern T616 GE_default616;
extern T617 GE_default617;
extern T618 GE_default618;
extern T619 GE_default619;
extern T621 GE_default621;
extern T623 GE_default623;
extern T624 GE_default624;
extern T625 GE_default625;
extern T627 GE_default627;
extern T629 GE_default629;
extern T630 GE_default630;
extern T631 GE_default631;
extern T632 GE_default632;
extern T634 GE_default634;
extern T635 GE_default635;
extern T636 GE_default636;
extern T638 GE_default638;
extern T640 GE_default640;
extern T642 GE_default642;
extern T643 GE_default643;
extern T645 GE_default645;
extern T646 GE_default646;
extern T647 GE_default647;
extern T648 GE_default648;
extern T649 GE_default649;
extern T650 GE_default650;
extern T652 GE_default652;
extern T654 GE_default654;
extern T655 GE_default655;
extern T656 GE_default656;
extern T657 GE_default657;
extern T659 GE_default659;
extern T660 GE_default660;
extern T661 GE_default661;
extern T662 GE_default662;
extern T665 GE_default665;
extern T668 GE_default668;
extern T671 GE_default671;
extern T672 GE_default672;
extern T673 GE_default673;
extern T674 GE_default674;
extern T675 GE_default675;
extern T676 GE_default676;
extern T677 GE_default677;
extern T678 GE_default678;
extern T680 GE_default680;
extern T683 GE_default683;
extern T684 GE_default684;
extern T685 GE_default685;
extern T688 GE_default688;

extern T0* GE_ms8(char* s, T6 c);
extern T0* GE_ms32(char* s, T6 c);
/* Call to STRING_8.to_c */
extern T0* T17x1153(T0* C);
/* Call to STRING_8.count */
extern T6 T17x1248(T0* C);
/* Call to ANY.is_equal */
extern T1 T19x28T0(T0* C, T0* a1);
/* Call to ANY.same_type */
extern T1 T19x27T0(T0* C, T0* a1);
/* Call to GEANT_VARIABLES.has */
extern T1 T29x2009T0(T0* C, T0* a1);
/* Call to GEANT_VARIABLES.item_for_iteration */
extern T0* T29x2068(T0* C);
/* Call to GEANT_VARIABLES.key_for_iteration */
extern T0* T29x2002(T0* C);
/* Call to GEANT_VARIABLES.after */
extern T1 T29x2049(T0* C);
/* Call to GEANT_VARIABLES.found_item */
extern T0* T29x2091(T0* C);
/* Call to GEANT_VARIABLES.found */
extern T1 T29x2099(T0* C);
/* Call to AP_OPTION.short_form */
extern T2 T42x2610(T0* C);
/* Call to AP_OPTION.long_form */
extern T0* T42x2605(T0* C);
/* Call to AP_OPTION.has_long_form */
extern T1 T42x2612(T0* C);
/* Call to AP_OPTION.example */
extern T0* T42x2604(T0* C);
/* Call to AP_OPTION.is_hidden */
extern T1 T42x2614(T0* C);
/* Call to AP_OPTION.description */
extern T0* T42x2603(T0* C);
/* Call to AP_OPTION.names */
extern T0* T42x2607(T0* C);
/* Call to AP_OPTION.name */
extern T0* T42x2606(T0* C);
/* Call to AP_OPTION.needs_parameter */
extern T1 T42x2616(T0* C);
/* Call to AP_OPTION.has_short_form */
extern T1 T42x2613(T0* C);
/* Call to AP_OPTION.allows_parameter */
extern T1 T42x2611(T0* C);
/* Call to AP_OPTION.maximum_occurrences */
extern T6 T42x2609(T0* C);
/* Call to AP_OPTION.occurrences */
extern T6 T42x2608(T0* C);
/* Call to AP_OPTION.was_found */
extern T1 T42x2618(T0* C);
/* Call to AP_OPTION.is_mandatory */
extern T1 T42x2615(T0* C);
/* Call to UT_ERROR.default_message */
extern T0* T50x2991(T0* C);
/* Call to DS_SPARSE_TABLE [STRING_8, STRING_8].new_cursor */
extern T0* T62x2069(T0* C);
/* Call to DS_SPARSE_TABLE [STRING_8, STRING_8].key_equality_tester */
extern T0* T62x2121(T0* C);
/* Call to READABLE_STRING_8.area */
extern T0* T78x1244(T0* C);
/* Call to READABLE_STRING_8.count */
extern T6 T78x1248(T0* C);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_key */
extern T0* T81x2004T0(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_item */
extern T0* T81x2075T0(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_after */
extern T1 T81x2063T0(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].before_position */
extern T6 T81x2176(T0* C);
/* Call to XM_EIFFEL_SCANNER.start_condition */
extern T6 T132x6591(T0* C);
/* Call to XM_EIFFEL_SCANNER.is_applicable_encoding */
extern T1 T132x6466T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.end_of_file */
extern T1 T132x6596(T0* C);
/* Call to XM_EIFFEL_SCANNER.last_value */
extern T0* T132x6477(T0* C);
/* Call to XM_EIFFEL_SCANNER.last_token */
extern T6 T132x6587(T0* C);
/* Call to XM_EIFFEL_SCANNER.error_position */
extern T0* T132x6475(T0* C);
/* Call to XM_NODE.parent */
extern T0* T202x5706(T0* C);
/* Call to GEANT_TASK.exit_code */
extern T6 T270x8059(T0* C);
/* Call to GEANT_TASK.is_exit_command */
extern T1 T270x8060(T0* C);
/* Call to GEANT_TASK.is_enabled */
extern T1 T270x2434(T0* C);
/* Call to GEANT_TASK.is_executable */
extern T1 T270x8058(T0* C);
/* Call to FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK].item with a manifest tuple argument of type TUPLE [XM_ELEMENT] */
extern T0* T271xmt8101T266(T0* C, T0* a1);
/* Call to LX_TRANSITION [LX_NFA_STATE].target */
extern T0* T626x11744(T0* C);
/* Call to LX_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T626x11747T6(T0* C, T6 a1);
/* Call to GEANT_VARIABLES.replace */
extern void T29x2010T0T0(T0* C, T0* a1, T0* a2);
/* Call to GEANT_VARIABLES.set_variable_value */
extern void T29x1926T0T0(T0* C, T0* a1, T0* a2);
/* Call to GEANT_VARIABLES.forth */
extern void T29x2053(T0* C);
/* Call to GEANT_VARIABLES.start */
extern void T29x2052(T0* C);
/* Call to GEANT_VARIABLES.search */
extern void T29x2106T0(T0* C, T0* a1);
/* Call to GEANT_VARIABLES.force_last */
extern void T29x1991T0T0(T0* C, T0* a1, T0* a2);
/* Call to AP_OPTION.record_occurrence */
extern void T42x2629T0(T0* C, T0* a1);
/* Call to AP_OPTION.reset */
extern void T42x2630(T0* C);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_forth */
extern void T81x2065T0(T0* C, T0* a1);
/* Call to DS_HASH_TABLE [STRING_8, STRING_8].cursor_start */
extern void T81x2064T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS_FILTER.set_next */
extern void T94x4959T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_xml_declaration */
extern void T95x5123T0T0T1(T0* C, T0* a1, T0* a2, T1 a3);
/* Call to XM_CALLBACKS.on_attribute */
extern void T95x5128T0T0T0T0(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* Call to XM_CALLBACKS.on_error */
extern void T95x5124T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_end_tag */
extern void T95x5130T0T0T0(T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_start_tag_finish */
extern void T95x5129(T0* C);
/* Call to XM_CALLBACKS.on_start_tag */
extern void T95x5127T0T0T0(T0* C, T0* a1, T0* a2, T0* a3);
/* Call to XM_CALLBACKS.on_content */
extern void T95x5131T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_processing_instruction */
extern void T95x5125T0T0(T0* C, T0* a1, T0* a2);
/* Call to XM_CALLBACKS.on_comment */
extern void T95x5126T0(T0* C, T0* a1);
/* Call to XM_CALLBACKS.on_finish */
extern void T95x5122(T0* C);
/* Call to XM_CALLBACKS.on_start */
extern void T95x5121(T0* C);
/* Call to XM_EIFFEL_SCANNER.close_input */
extern void T132x6462(T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T132x6461T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.set_encoding */
extern void T132x6467T0(T0* C, T0* a1);
/* Call to XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T132x6458(T0* C);
/* Call to XM_EIFFEL_SCANNER.read_token */
extern void T132x6602(T0* C);
/* Call to XM_EIFFEL_SCANNER.set_input_stream */
extern void T132x6460T0(T0* C, T0* a1);
/* Call to XM_NODE.process */
extern void T202x5716T0(T0* C, T0* a1);
/* Call to XM_NODE.node_set_parent */
extern void T202x5714T0(T0* C, T0* a1);
/* Call to GEANT_TASK.execute */
extern void T270x8062(T0* C);
/* Call to GEANT_TASK.log_validation_messages */
extern void T270x8063(T0* C);
/* Call to LX_TRANSITION [LX_NFA_STATE].record */
extern void T626x11748T0(T0* C, T0* a1);
/* New instance of type SPECIAL [CHARACTER_8] */
extern T0* GE_new15(T6 a1, T1 initialize);
/* New instance of type STRING_8 */
extern T0* GE_new17(T1 initialize);
/* New instance of type GEANT */
extern T0* GE_new21(T1 initialize);
/* New instance of type GEANT_PROJECT */
extern T0* GE_new22(T1 initialize);
/* New instance of type GEANT_PROJECT_LOADER */
extern T0* GE_new23(T1 initialize);
/* New instance of type GEANT_PROJECT_OPTIONS */
extern T0* GE_new24(T1 initialize);
/* New instance of type GEANT_PROJECT_VARIABLES */
extern T0* GE_new25(T1 initialize);
/* New instance of type GEANT_TARGET */
extern T0* GE_new26(T1 initialize);
/* New instance of type KL_ARGUMENTS */
extern T0* GE_new27(T1 initialize);
/* New instance of type UT_ERROR_HANDLER */
extern T0* GE_new28(T1 initialize);
/* New instance of type GEANT_VARIABLES */
extern T0* GE_new29(T1 initialize);
/* New instance of type GEANT_PROJECT_ELEMENT */
extern T0* GE_new30(T1 initialize);
/* New instance of type DS_HASH_TABLE [GEANT_TARGET, STRING_8] */
extern T0* GE_new31(T1 initialize);
/* New instance of type SPECIAL [STRING_8] */
extern T0* GE_new32(T6 a1, T1 initialize);
/* New instance of type ARRAY [STRING_8] */
extern T0* GE_new33(T1 initialize);
/* New instance of type GEANT_ARGUMENT_VARIABLES */
extern T0* GE_new34(T1 initialize);
/* New instance of type AP_FLAG */
extern T0* GE_new35(T1 initialize);
/* New instance of type AP_ALTERNATIVE_OPTIONS_LIST */
extern T0* GE_new36(T1 initialize);
/* New instance of type AP_STRING_OPTION */
extern T0* GE_new37(T1 initialize);
/* New instance of type AP_PARSER */
extern T0* GE_new38(T1 initialize);
/* New instance of type AP_ERROR */
extern T0* GE_new40(T1 initialize);
/* New instance of type AP_ERROR_HANDLER */
extern T0* GE_new45(T1 initialize);
/* New instance of type KL_STANDARD_FILES */
extern T0* GE_new46(T1 initialize);
/* New instance of type KL_STDERR_FILE */
extern T0* GE_new47(T1 initialize);
/* New instance of type KL_EXCEPTIONS */
extern T0* GE_new48(T1 initialize);
/* New instance of type UT_VERSION_NUMBER */
extern T0* GE_new49(T1 initialize);
/* New instance of type KL_OPERATING_SYSTEM */
extern T0* GE_new51(T1 initialize);
/* New instance of type KL_WINDOWS_FILE_SYSTEM */
extern T0* GE_new53(T1 initialize);
/* New instance of type KL_UNIX_FILE_SYSTEM */
extern T0* GE_new54(T1 initialize);
/* New instance of type KL_TEXT_INPUT_FILE */
extern T0* GE_new55(T1 initialize);
/* New instance of type GEANT_PROJECT_PARSER */
extern T0* GE_new56(T1 initialize);
/* New instance of type GEANT_PROJECT_VARIABLE_RESOLVER */
extern T0* GE_new58(T1 initialize);
/* New instance of type UC_STRING_EQUALITY_TESTER */
extern T0* GE_new59(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8] */
extern T0* GE_new61(T1 initialize);
/* New instance of type SPECIAL [INTEGER_32] */
extern T0* GE_new63(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
extern T0* GE_new64(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [INTEGER_32] */
extern T0* GE_new65(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [STRING_8] */
extern T0* GE_new66(T1 initialize);
/* New instance of type KL_STDOUT_FILE */
extern T0* GE_new68(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [AP_OPTION] */
extern T0* GE_new69(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [STRING_8] */
extern T0* GE_new71(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [STRING_8] */
extern T0* GE_new72(T1 initialize);
/* New instance of type AP_DISPLAY_HELP_FLAG */
extern T0* GE_new73(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [AP_OPTION] */
extern T0* GE_new74(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST] */
extern T0* GE_new75(T1 initialize);
/* New instance of type KL_STRING_ROUTINES */
extern T0* GE_new76(T1 initialize);
/* New instance of type DS_HASH_TABLE [STRING_8, STRING_8] */
extern T0* GE_new81(T1 initialize);
/* New instance of type EXECUTION_ENVIRONMENT */
extern T0* GE_new83(T1 initialize);
/* New instance of type KL_ANY_ROUTINES */
extern T0* GE_new84(T1 initialize);
/* New instance of type KL_PATHNAME */
extern T0* GE_new86(T1 initialize);
/* New instance of type UNIX_FILE_INFO */
extern T0* GE_new87(T1 initialize);
/* New instance of type KL_LINKABLE [CHARACTER_8] */
extern T0* GE_new88(T1 initialize);
/* New instance of type XM_EXPAT_PARSER_FACTORY */
extern T0* GE_new90(T1 initialize);
/* New instance of type XM_EIFFEL_PARSER */
extern T0* GE_new92(T1 initialize);
/* New instance of type XM_TREE_CALLBACKS_PIPE */
extern T0* GE_new93(T1 initialize);
/* New instance of type XM_CALLBACKS_TO_TREE_FILTER */
extern T0* GE_new96(T1 initialize);
/* New instance of type XM_DOCUMENT */
extern T0* GE_new97(T1 initialize);
/* New instance of type XM_ELEMENT */
extern T0* GE_new98(T1 initialize);
/* New instance of type XM_STOP_ON_ERROR_FILTER */
extern T0* GE_new99(T1 initialize);
/* New instance of type XM_POSITION_TABLE */
extern T0* GE_new100(T1 initialize);
/* New instance of type KL_EXECUTION_ENVIRONMENT */
extern T0* GE_new103(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES] */
extern T0* GE_new104(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [GEANT_VARIABLES] */
extern T0* GE_new105(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8] */
extern T0* GE_new106(T1 initialize);
/* New instance of type TO_SPECIAL [INTEGER_32] */
extern T0* GE_new107(T1 initialize);
/* New instance of type TO_SPECIAL [STRING_8] */
extern T0* GE_new108(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [AP_OPTION] */
extern T0* GE_new109(T1 initialize);
/* New instance of type SPECIAL [AP_OPTION] */
extern T0* GE_new111(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [AP_OPTION] */
extern T0* GE_new112(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST] */
extern T0* GE_new113(T1 initialize);
/* New instance of type SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
extern T0* GE_new114(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST] */
extern T0* GE_new115(T1 initialize);
/* New instance of type UC_STRING */
extern T0* GE_new116(T1 initialize);
/* New instance of type STRING_TO_INTEGER_CONVERTOR */
extern T0* GE_new118(T1 initialize);
/* New instance of type DS_LINKED_LIST [XM_ELEMENT] */
extern T0* GE_new120(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [XM_ELEMENT] */
extern T0* GE_new121(T1 initialize);
/* New instance of type GEANT_INHERIT_ELEMENT */
extern T0* GE_new122(T1 initialize);
/* New instance of type GEANT_INHERIT */
extern T0* GE_new123(T1 initialize);
/* New instance of type SPECIAL [GEANT_TARGET] */
extern T0* GE_new124(T6 a1, T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [GEANT_TARGET, STRING_8] */
extern T0* GE_new126(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8] */
extern T0* GE_new128(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_TARGET] */
extern T0* GE_new129(T1 initialize);
/* New instance of type XM_EIFFEL_SCANNER */
extern T0* GE_new132(T1 initialize);
/* New instance of type XM_DEFAULT_POSITION */
extern T0* GE_new133(T1 initialize);
/* New instance of type DS_BILINKED_LIST [XM_POSITION] */
extern T0* GE_new135(T1 initialize);
/* New instance of type DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
extern T0* GE_new136(T1 initialize);
/* New instance of type XM_CALLBACKS_NULL */
extern T0* GE_new137(T1 initialize);
/* New instance of type DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
extern T0* GE_new138(T1 initialize);
/* New instance of type XM_NULL_EXTERNAL_RESOLVER */
extern T0* GE_new140(T1 initialize);
/* New instance of type SPECIAL [ANY] */
extern T0* GE_new141(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [ANY] */
extern T0* GE_new142(T1 initialize);
/* New instance of type XM_EIFFEL_PARSER_NAME */
extern T0* GE_new143(T1 initialize);
/* New instance of type XM_EIFFEL_DECLARATION */
extern T0* GE_new144(T1 initialize);
/* New instance of type XM_DTD_EXTERNAL_ID */
extern T0* GE_new145(T1 initialize);
/* New instance of type DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new146(T1 initialize);
/* New instance of type XM_DTD_ELEMENT_CONTENT */
extern T0* GE_new147(T1 initialize);
/* New instance of type DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new148(T1 initialize);
/* New instance of type XM_DTD_ATTRIBUTE_CONTENT */
extern T0* GE_new149(T1 initialize);
/* New instance of type DS_BILINKED_LIST [STRING_8] */
extern T0* GE_new150(T1 initialize);
/* New instance of type SPECIAL [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new151(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new152(T1 initialize);
/* New instance of type SPECIAL [XM_EIFFEL_DECLARATION] */
extern T0* GE_new153(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
extern T0* GE_new154(T1 initialize);
/* New instance of type SPECIAL [BOOLEAN] */
extern T0* GE_new155(T6 a1, T1 initialize);
/* New instance of type SPECIAL [XM_DTD_EXTERNAL_ID] */
extern T0* GE_new156(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [BOOLEAN] */
extern T0* GE_new157(T1 initialize);
/* New instance of type SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
extern T0* GE_new158(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
extern T0* GE_new159(T1 initialize);
/* New instance of type SPECIAL [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new160(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new161(T1 initialize);
/* New instance of type SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
extern T0* GE_new163(T6 a1, T1 initialize);
/* New instance of type SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new165(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
extern T0* GE_new166(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new167(T1 initialize);
/* New instance of type SPECIAL [DS_BILINKED_LIST [STRING_8]] */
extern T0* GE_new168(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
extern T0* GE_new169(T1 initialize);
/* New instance of type XM_EIFFEL_ENTITY_DEF */
extern T0* GE_new170(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
extern T0* GE_new171(T1 initialize);
/* New instance of type XM_DTD_CALLBACKS_NULL */
extern T0* GE_new173(T1 initialize);
/* New instance of type XM_EIFFEL_SCANNER_DTD */
extern T0* GE_new174(T1 initialize);
/* New instance of type XM_EIFFEL_PE_ENTITY_DEF */
extern T0* GE_new176(T1 initialize);
/* New instance of type XM_NAMESPACE_RESOLVER */
extern T0* GE_new177(T1 initialize);
/* New instance of type SPECIAL [XM_CALLBACKS_FILTER] */
extern T0* GE_new178(T6 a1, T1 initialize);
/* New instance of type ARRAY [XM_CALLBACKS_FILTER] */
extern T0* GE_new179(T1 initialize);
/* New instance of type DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
extern T0* GE_new180(T1 initialize);
/* New instance of type SPECIAL [GEANT_ARGUMENT_VARIABLES] */
extern T0* GE_new181(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES] */
extern T0* GE_new182(T1 initialize);
/* New instance of type SPECIAL [GEANT_VARIABLES] */
extern T0* GE_new183(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_VARIABLES] */
extern T0* GE_new184(T1 initialize);
/* New instance of type TO_SPECIAL [AP_OPTION] */
extern T0* GE_new186(T1 initialize);
/* New instance of type TO_SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
extern T0* GE_new187(T1 initialize);
/* New instance of type C_STRING */
extern T0* GE_new188(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [GEANT_TARGET] */
extern T0* GE_new190(T1 initialize);
/* New instance of type GEANT_TASK_FACTORY */
extern T0* GE_new191(T1 initialize);
/* New instance of type GEANT_PARENT */
extern T0* GE_new192(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [GEANT_PARENT] */
extern T0* GE_new194(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [GEANT_PARENT] */
extern T0* GE_new195(T1 initialize);
/* New instance of type GEANT_INTERPRETING_ELEMENT */
extern T0* GE_new196(T1 initialize);
/* New instance of type GEANT_ARGUMENT_ELEMENT */
extern T0* GE_new197(T1 initialize);
/* New instance of type GEANT_LOCAL_ELEMENT */
extern T0* GE_new198(T1 initialize);
/* New instance of type GEANT_GLOBAL_ELEMENT */
extern T0* GE_new199(T1 initialize);
/* New instance of type XM_ATTRIBUTE */
extern T0* GE_new200(T1 initialize);
/* New instance of type GEANT_GROUP */
extern T0* GE_new201(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [XM_NODE] */
extern T0* GE_new203(T1 initialize);
/* New instance of type ARRAY [INTEGER_32] */
extern T0* GE_new204(T1 initialize);
/* New instance of type UC_UTF8_ROUTINES */
extern T0* GE_new205(T1 initialize);
/* New instance of type UC_UTF8_STRING */
extern T0* GE_new206(T1 initialize);
/* New instance of type XM_EIFFEL_INPUT_STREAM */
extern T0* GE_new208(T1 initialize);
/* New instance of type KL_INTEGER_ROUTINES */
extern T0* GE_new209(T1 initialize);
/* New instance of type KL_PLATFORM */
extern T0* GE_new210(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
extern T0* GE_new211(T1 initialize);
/* New instance of type DS_PAIR [XM_POSITION, XM_NODE] */
extern T0* GE_new212(T1 initialize);
/* New instance of type INTEGER_OVERFLOW_CHECKER */
extern T0* GE_new213(T1 initialize);
/* New instance of type DS_LINKABLE [XM_ELEMENT] */
extern T0* GE_new214(T1 initialize);
/* New instance of type GEANT_PARENT_ELEMENT */
extern T0* GE_new215(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_TARGET, STRING_8] */
extern T0* GE_new217(T1 initialize);
/* New instance of type TO_SPECIAL [GEANT_TARGET] */
extern T0* GE_new218(T1 initialize);
/* New instance of type XM_EIFFEL_CHARACTER_ENTITY */
extern T0* GE_new219(T1 initialize);
/* New instance of type YY_BUFFER */
extern T0* GE_new220(T1 initialize);
/* New instance of type YY_FILE_BUFFER */
extern T0* GE_new221(T1 initialize);
/* New instance of type DS_LINKED_STACK [INTEGER_32] */
extern T0* GE_new224(T1 initialize);
/* New instance of type DS_BILINKABLE [XM_POSITION] */
extern T0* GE_new225(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [XM_POSITION] */
extern T0* GE_new226(T1 initialize);
/* New instance of type DS_LINKABLE [XM_EIFFEL_SCANNER] */
extern T0* GE_new227(T1 initialize);
/* New instance of type SPECIAL [XM_EIFFEL_ENTITY_DEF] */
extern T0* GE_new228(T6 a1, T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8] */
extern T0* GE_new229(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
extern T0* GE_new231(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
extern T0* GE_new233(T1 initialize);
/* New instance of type TO_SPECIAL [ANY] */
extern T0* GE_new234(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new235(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new236(T1 initialize);
/* New instance of type DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new237(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new238(T1 initialize);
/* New instance of type DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new239(T1 initialize);
/* New instance of type DS_LINKED_LIST [STRING_8] */
extern T0* GE_new240(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [STRING_8] */
extern T0* GE_new241(T1 initialize);
/* New instance of type DS_BILINKABLE [STRING_8] */
extern T0* GE_new242(T1 initialize);
/* New instance of type TO_SPECIAL [XM_EIFFEL_PARSER_NAME] */
extern T0* GE_new243(T1 initialize);
/* New instance of type TO_SPECIAL [XM_EIFFEL_DECLARATION] */
extern T0* GE_new244(T1 initialize);
/* New instance of type TO_SPECIAL [BOOLEAN] */
extern T0* GE_new245(T1 initialize);
/* New instance of type TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
extern T0* GE_new246(T1 initialize);
/* New instance of type TO_SPECIAL [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new247(T1 initialize);
/* New instance of type TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
extern T0* GE_new248(T1 initialize);
/* New instance of type TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
extern T0* GE_new249(T1 initialize);
/* New instance of type TO_SPECIAL [DS_BILINKED_LIST [STRING_8]] */
extern T0* GE_new250(T1 initialize);
/* New instance of type TO_SPECIAL [XM_DTD_EXTERNAL_ID] */
extern T0* GE_new251(T1 initialize);
/* New instance of type XM_NAMESPACE_RESOLVER_CONTEXT */
extern T0* GE_new252(T1 initialize);
/* New instance of type DS_LINKED_QUEUE [STRING_8] */
extern T0* GE_new254(T1 initialize);
/* New instance of type TO_SPECIAL [GEANT_ARGUMENT_VARIABLES] */
extern T0* GE_new255(T1 initialize);
/* New instance of type TO_SPECIAL [GEANT_VARIABLES] */
extern T0* GE_new256(T1 initialize);
/* New instance of type SPECIAL [NATURAL_8] */
extern T0* GE_new257(T6 a1, T1 initialize);
/* New instance of type GEANT_STRING_INTERPRETER */
extern T0* GE_new258(T1 initialize);
/* New instance of type KL_ARRAY_ROUTINES [INTEGER_32] */
extern T0* GE_new261(T1 initialize);
/* New instance of type MANAGED_POINTER */
extern T0* GE_new263(T1 initialize);
/* New instance of type DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
extern T0* GE_new264(T1 initialize);
/* New instance of type GEANT_GEC_TASK */
extern T0* GE_new265(T1 initialize);
/* New instance of type TUPLE [XM_ELEMENT] */
extern T0* GE_new266(T1 initialize);
/* New instance of type TUPLE */
extern T0* GE_new267(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_GEC_TASK] */
extern T0* GE_new268(T1 initialize);
/* New instance of type TUPLE [GEANT_TASK_FACTORY] */
extern T0* GE_new269(T1 initialize);
/* New instance of type GEANT_ISE_TASK */
extern T0* GE_new272(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_ISE_TASK] */
extern T0* GE_new273(T1 initialize);
/* New instance of type GEANT_EXEC_TASK */
extern T0* GE_new274(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_EXEC_TASK] */
extern T0* GE_new275(T1 initialize);
/* New instance of type GEANT_LCC_TASK */
extern T0* GE_new276(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_LCC_TASK] */
extern T0* GE_new277(T1 initialize);
/* New instance of type GEANT_SET_TASK */
extern T0* GE_new278(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_SET_TASK] */
extern T0* GE_new279(T1 initialize);
/* New instance of type GEANT_UNSET_TASK */
extern T0* GE_new280(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_UNSET_TASK] */
extern T0* GE_new281(T1 initialize);
/* New instance of type GEANT_GEXACE_TASK */
extern T0* GE_new282(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_GEXACE_TASK] */
extern T0* GE_new283(T1 initialize);
/* New instance of type GEANT_GELEX_TASK */
extern T0* GE_new284(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_GELEX_TASK] */
extern T0* GE_new285(T1 initialize);
/* New instance of type GEANT_GEYACC_TASK */
extern T0* GE_new286(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_GEYACC_TASK] */
extern T0* GE_new287(T1 initialize);
/* New instance of type GEANT_GEPP_TASK */
extern T0* GE_new288(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_GEPP_TASK] */
extern T0* GE_new289(T1 initialize);
/* New instance of type GEANT_GETEST_TASK */
extern T0* GE_new290(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_GETEST_TASK] */
extern T0* GE_new291(T1 initialize);
/* New instance of type GEANT_GEANT_TASK */
extern T0* GE_new292(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_GEANT_TASK] */
extern T0* GE_new293(T1 initialize);
/* New instance of type GEANT_ECHO_TASK */
extern T0* GE_new294(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_ECHO_TASK] */
extern T0* GE_new295(T1 initialize);
/* New instance of type GEANT_MKDIR_TASK */
extern T0* GE_new296(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_MKDIR_TASK] */
extern T0* GE_new297(T1 initialize);
/* New instance of type GEANT_DELETE_TASK */
extern T0* GE_new298(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_DELETE_TASK] */
extern T0* GE_new299(T1 initialize);
/* New instance of type GEANT_COPY_TASK */
extern T0* GE_new300(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_COPY_TASK] */
extern T0* GE_new301(T1 initialize);
/* New instance of type GEANT_MOVE_TASK */
extern T0* GE_new302(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_MOVE_TASK] */
extern T0* GE_new303(T1 initialize);
/* New instance of type GEANT_SETENV_TASK */
extern T0* GE_new304(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_SETENV_TASK] */
extern T0* GE_new305(T1 initialize);
/* New instance of type GEANT_XSLT_TASK */
extern T0* GE_new306(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_XSLT_TASK] */
extern T0* GE_new307(T1 initialize);
/* New instance of type GEANT_OUTOFDATE_TASK */
extern T0* GE_new308(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_OUTOFDATE_TASK] */
extern T0* GE_new309(T1 initialize);
/* New instance of type GEANT_EXIT_TASK */
extern T0* GE_new310(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_EXIT_TASK] */
extern T0* GE_new311(T1 initialize);
/* New instance of type GEANT_PRECURSOR_TASK */
extern T0* GE_new312(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_PRECURSOR_TASK] */
extern T0* GE_new313(T1 initialize);
/* New instance of type GEANT_AVAILABLE_TASK */
extern T0* GE_new314(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_AVAILABLE_TASK] */
extern T0* GE_new315(T1 initialize);
/* New instance of type GEANT_INPUT_TASK */
extern T0* GE_new316(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_INPUT_TASK] */
extern T0* GE_new317(T1 initialize);
/* New instance of type GEANT_REPLACE_TASK */
extern T0* GE_new318(T1 initialize);
/* New instance of type FUNCTION [GEANT_TASK_FACTORY, TUPLE [XM_ELEMENT], GEANT_REPLACE_TASK] */
extern T0* GE_new319(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_PARENT] */
extern T0* GE_new320(T1 initialize);
/* New instance of type SPECIAL [GEANT_PARENT] */
extern T0* GE_new321(T6 a1, T1 initialize);
/* New instance of type UC_UNICODE_ROUTINES */
extern T0* GE_new322(T1 initialize);
/* New instance of type DS_LINKED_QUEUE [CHARACTER_8] */
extern T0* GE_new324(T1 initialize);
/* New instance of type UC_UTF16_ROUTINES */
extern T0* GE_new325(T1 initialize);
/* New instance of type DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
extern T0* GE_new326(T1 initialize);
/* New instance of type SPECIAL [NATURAL_64] */
extern T0* GE_new327(T6 a1, T1 initialize);
/* New instance of type GEANT_RENAME_ELEMENT */
extern T0* GE_new328(T1 initialize);
/* New instance of type GEANT_REDEFINE_ELEMENT */
extern T0* GE_new329(T1 initialize);
/* New instance of type GEANT_SELECT_ELEMENT */
extern T0* GE_new330(T1 initialize);
/* New instance of type GEANT_RENAME */
extern T0* GE_new331(T1 initialize);
/* New instance of type DS_HASH_TABLE [GEANT_RENAME, STRING_8] */
extern T0* GE_new332(T1 initialize);
/* New instance of type GEANT_REDEFINE */
extern T0* GE_new333(T1 initialize);
/* New instance of type DS_HASH_TABLE [GEANT_REDEFINE, STRING_8] */
extern T0* GE_new334(T1 initialize);
/* New instance of type GEANT_SELECT */
extern T0* GE_new335(T1 initialize);
/* New instance of type DS_HASH_TABLE [GEANT_SELECT, STRING_8] */
extern T0* GE_new336(T1 initialize);
/* New instance of type DS_LINKABLE [INTEGER_32] */
extern T0* GE_new338(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
extern T0* GE_new339(T1 initialize);
/* New instance of type TO_SPECIAL [XM_EIFFEL_ENTITY_DEF] */
extern T0* GE_new340(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new341(T1 initialize);
/* New instance of type DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
extern T0* GE_new342(T1 initialize);
/* New instance of type DS_LINKED_LIST_CURSOR [STRING_8] */
extern T0* GE_new343(T1 initialize);
/* New instance of type DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
extern T0* GE_new345(T1 initialize);
/* New instance of type DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
extern T0* GE_new346(T1 initialize);
/* New instance of type DS_LINKABLE [STRING_8] */
extern T0* GE_new347(T1 initialize);
/* New instance of type GEANT_NAME_VALUE_ELEMENT */
extern T0* GE_new348(T1 initialize);
/* New instance of type AP_OPTION_COMPARATOR */
extern T0* GE_new349(T1 initialize);
/* New instance of type DS_QUICK_SORTER [AP_OPTION] */
extern T0* GE_new350(T1 initialize);
/* New instance of type ST_WORD_WRAPPER */
extern T0* GE_new352(T1 initialize);
/* New instance of type DS_HASH_SET [XM_NAMESPACE] */
extern T0* GE_new354(T1 initialize);
/* New instance of type XM_COMMENT */
extern T0* GE_new355(T1 initialize);
/* New instance of type XM_PROCESSING_INSTRUCTION */
extern T0* GE_new356(T1 initialize);
/* New instance of type XM_CHARACTER_DATA */
extern T0* GE_new357(T1 initialize);
/* New instance of type XM_NAMESPACE */
extern T0* GE_new358(T1 initialize);
/* New instance of type DS_LINKABLE [XM_NODE] */
extern T0* GE_new361(T1 initialize);
/* New instance of type XM_NODE_TYPER */
extern T0* GE_new363(T1 initialize);
/* New instance of type KL_CHARACTER_BUFFER */
extern T0* GE_new367(T1 initialize);
/* New instance of type EXCEPTIONS */
extern T0* GE_new369(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
extern T0* GE_new371(T1 initialize);
/* New instance of type SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
extern T0* GE_new373(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
extern T0* GE_new374(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
extern T0* GE_new375(T1 initialize);
/* New instance of type GEANT_GEC_COMMAND */
extern T0* GE_new376(T1 initialize);
/* New instance of type DS_CELL [PROCEDURE [ANY, TUPLE]] */
extern T0* GE_new377(T1 initialize);
/* New instance of type PROCEDURE [GEANT_GEC_TASK, TUPLE] */
extern T0* GE_new378(T1 initialize);
/* New instance of type TUPLE [GEANT_GEC_TASK] */
extern T0* GE_new379(T1 initialize);
/* New instance of type GEANT_ISE_COMMAND */
extern T0* GE_new380(T1 initialize);
/* New instance of type PROCEDURE [GEANT_ISE_TASK, TUPLE] */
extern T0* GE_new381(T1 initialize);
/* New instance of type TUPLE [GEANT_ISE_TASK] */
extern T0* GE_new382(T1 initialize);
/* New instance of type GEANT_FILESET_ELEMENT */
extern T0* GE_new383(T1 initialize);
/* New instance of type GEANT_EXEC_COMMAND */
extern T0* GE_new384(T1 initialize);
/* New instance of type GEANT_STRING_PROPERTY */
extern T0* GE_new385(T1 initialize);
/* New instance of type FUNCTION [GEANT_INTERPRETING_ELEMENT, TUPLE, STRING_8] */
extern T0* GE_new386(T1 initialize);
/* New instance of type TUPLE [GEANT_INTERPRETING_ELEMENT, STRING_8] */
extern T0* GE_new387(T1 initialize);
/* New instance of type GEANT_BOOLEAN_PROPERTY */
extern T0* GE_new388(T1 initialize);
/* New instance of type GEANT_FILESET */
extern T0* GE_new389(T1 initialize);
/* New instance of type PROCEDURE [GEANT_EXEC_TASK, TUPLE] */
extern T0* GE_new390(T1 initialize);
/* New instance of type TUPLE [GEANT_EXEC_TASK] */
extern T0* GE_new391(T1 initialize);
/* New instance of type GEANT_LCC_COMMAND */
extern T0* GE_new392(T1 initialize);
/* New instance of type PROCEDURE [GEANT_LCC_TASK, TUPLE] */
extern T0* GE_new393(T1 initialize);
/* New instance of type TUPLE [GEANT_LCC_TASK] */
extern T0* GE_new394(T1 initialize);
/* New instance of type GEANT_SET_COMMAND */
extern T0* GE_new395(T1 initialize);
/* New instance of type PROCEDURE [GEANT_SET_TASK, TUPLE] */
extern T0* GE_new396(T1 initialize);
/* New instance of type TUPLE [GEANT_SET_TASK] */
extern T0* GE_new397(T1 initialize);
/* New instance of type GEANT_UNSET_COMMAND */
extern T0* GE_new398(T1 initialize);
/* New instance of type PROCEDURE [GEANT_UNSET_TASK, TUPLE] */
extern T0* GE_new399(T1 initialize);
/* New instance of type TUPLE [GEANT_UNSET_TASK] */
extern T0* GE_new400(T1 initialize);
/* New instance of type GEANT_DEFINE_ELEMENT */
extern T0* GE_new401(T1 initialize);
/* New instance of type GEANT_GEXACE_COMMAND */
extern T0* GE_new402(T1 initialize);
/* New instance of type PROCEDURE [GEANT_GEXACE_TASK, TUPLE] */
extern T0* GE_new403(T1 initialize);
/* New instance of type TUPLE [GEANT_GEXACE_TASK] */
extern T0* GE_new404(T1 initialize);
/* New instance of type GEANT_GELEX_COMMAND */
extern T0* GE_new405(T1 initialize);
/* New instance of type PROCEDURE [GEANT_GELEX_TASK, TUPLE] */
extern T0* GE_new406(T1 initialize);
/* New instance of type TUPLE [GEANT_GELEX_TASK] */
extern T0* GE_new407(T1 initialize);
/* New instance of type GEANT_GEYACC_COMMAND */
extern T0* GE_new408(T1 initialize);
/* New instance of type PROCEDURE [GEANT_GEYACC_TASK, TUPLE] */
extern T0* GE_new409(T1 initialize);
/* New instance of type TUPLE [GEANT_GEYACC_TASK] */
extern T0* GE_new410(T1 initialize);
/* New instance of type GEANT_GEPP_COMMAND */
extern T0* GE_new411(T1 initialize);
/* New instance of type PROCEDURE [GEANT_GEPP_TASK, TUPLE] */
extern T0* GE_new412(T1 initialize);
/* New instance of type TUPLE [GEANT_GEPP_TASK] */
extern T0* GE_new413(T1 initialize);
/* New instance of type GEANT_GETEST_COMMAND */
extern T0* GE_new414(T1 initialize);
/* New instance of type PROCEDURE [GEANT_GETEST_TASK, TUPLE] */
extern T0* GE_new415(T1 initialize);
/* New instance of type TUPLE [GEANT_GETEST_TASK] */
extern T0* GE_new416(T1 initialize);
/* New instance of type GEANT_GEANT_COMMAND */
extern T0* GE_new417(T1 initialize);
/* New instance of type ST_SPLITTER */
extern T0* GE_new418(T1 initialize);
/* New instance of type PROCEDURE [GEANT_GEANT_TASK, TUPLE] */
extern T0* GE_new419(T1 initialize);
/* New instance of type TUPLE [GEANT_GEANT_TASK] */
extern T0* GE_new420(T1 initialize);
/* New instance of type GEANT_ECHO_COMMAND */
extern T0* GE_new421(T1 initialize);
/* New instance of type PROCEDURE [GEANT_ECHO_TASK, TUPLE] */
extern T0* GE_new422(T1 initialize);
/* New instance of type TUPLE [GEANT_ECHO_TASK] */
extern T0* GE_new423(T1 initialize);
/* New instance of type GEANT_MKDIR_COMMAND */
extern T0* GE_new424(T1 initialize);
/* New instance of type PROCEDURE [GEANT_MKDIR_TASK, TUPLE] */
extern T0* GE_new425(T1 initialize);
/* New instance of type TUPLE [GEANT_MKDIR_TASK] */
extern T0* GE_new426(T1 initialize);
/* New instance of type GEANT_DIRECTORYSET_ELEMENT */
extern T0* GE_new427(T1 initialize);
/* New instance of type GEANT_DELETE_COMMAND */
extern T0* GE_new428(T1 initialize);
/* New instance of type GEANT_DIRECTORYSET */
extern T0* GE_new429(T1 initialize);
/* New instance of type PROCEDURE [GEANT_DELETE_TASK, TUPLE] */
extern T0* GE_new430(T1 initialize);
/* New instance of type TUPLE [GEANT_DELETE_TASK] */
extern T0* GE_new431(T1 initialize);
/* New instance of type GEANT_COPY_COMMAND */
extern T0* GE_new432(T1 initialize);
/* New instance of type PROCEDURE [GEANT_COPY_TASK, TUPLE] */
extern T0* GE_new433(T1 initialize);
/* New instance of type TUPLE [GEANT_COPY_TASK] */
extern T0* GE_new434(T1 initialize);
/* New instance of type GEANT_MOVE_COMMAND */
extern T0* GE_new435(T1 initialize);
/* New instance of type PROCEDURE [GEANT_MOVE_TASK, TUPLE] */
extern T0* GE_new436(T1 initialize);
/* New instance of type TUPLE [GEANT_MOVE_TASK] */
extern T0* GE_new437(T1 initialize);
/* New instance of type GEANT_SETENV_COMMAND */
extern T0* GE_new438(T1 initialize);
/* New instance of type PROCEDURE [GEANT_SETENV_TASK, TUPLE] */
extern T0* GE_new439(T1 initialize);
/* New instance of type TUPLE [GEANT_SETENV_TASK] */
extern T0* GE_new440(T1 initialize);
/* New instance of type DS_PAIR [STRING_8, STRING_8] */
extern T0* GE_new441(T1 initialize);
/* New instance of type GEANT_XSLT_COMMAND */
extern T0* GE_new442(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]] */
extern T0* GE_new443(T1 initialize);
/* New instance of type PROCEDURE [GEANT_XSLT_TASK, TUPLE] */
extern T0* GE_new444(T1 initialize);
/* New instance of type TUPLE [GEANT_XSLT_TASK] */
extern T0* GE_new445(T1 initialize);
/* New instance of type GEANT_OUTOFDATE_COMMAND */
extern T0* GE_new446(T1 initialize);
/* New instance of type PROCEDURE [GEANT_OUTOFDATE_TASK, TUPLE] */
extern T0* GE_new447(T1 initialize);
/* New instance of type TUPLE [GEANT_OUTOFDATE_TASK] */
extern T0* GE_new448(T1 initialize);
/* New instance of type GEANT_EXIT_COMMAND */
extern T0* GE_new449(T1 initialize);
/* New instance of type PROCEDURE [GEANT_EXIT_TASK, TUPLE] */
extern T0* GE_new450(T1 initialize);
/* New instance of type TUPLE [GEANT_EXIT_TASK] */
extern T0* GE_new451(T1 initialize);
/* New instance of type GEANT_PRECURSOR_COMMAND */
extern T0* GE_new452(T1 initialize);
/* New instance of type PROCEDURE [GEANT_PRECURSOR_TASK, TUPLE] */
extern T0* GE_new453(T1 initialize);
/* New instance of type TUPLE [GEANT_PRECURSOR_TASK] */
extern T0* GE_new454(T1 initialize);
/* New instance of type GEANT_AVAILABLE_COMMAND */
extern T0* GE_new455(T1 initialize);
/* New instance of type PROCEDURE [GEANT_AVAILABLE_TASK, TUPLE] */
extern T0* GE_new456(T1 initialize);
/* New instance of type TUPLE [GEANT_AVAILABLE_TASK] */
extern T0* GE_new457(T1 initialize);
/* New instance of type GEANT_INPUT_COMMAND */
extern T0* GE_new458(T1 initialize);
/* New instance of type PROCEDURE [GEANT_INPUT_TASK, TUPLE] */
extern T0* GE_new459(T1 initialize);
/* New instance of type TUPLE [GEANT_INPUT_TASK] */
extern T0* GE_new460(T1 initialize);
/* New instance of type GEANT_REPLACE_COMMAND */
extern T0* GE_new461(T1 initialize);
/* New instance of type PROCEDURE [GEANT_REPLACE_TASK, TUPLE] */
extern T0* GE_new462(T1 initialize);
/* New instance of type TUPLE [GEANT_REPLACE_TASK] */
extern T0* GE_new463(T1 initialize);
/* New instance of type TO_SPECIAL [GEANT_PARENT] */
extern T0* GE_new464(T1 initialize);
/* New instance of type SPECIAL [ARRAY [INTEGER_32]] */
extern T0* GE_new465(T6 a1, T1 initialize);
/* New instance of type SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
extern T0* GE_new466(T6 a1, T1 initialize);
/* New instance of type DS_LINKABLE [CHARACTER_8] */
extern T0* GE_new467(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [GEANT_RENAME] */
extern T0* GE_new468(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [GEANT_RENAME, STRING_8] */
extern T0* GE_new469(T1 initialize);
/* New instance of type SPECIAL [GEANT_RENAME] */
extern T0* GE_new471(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8] */
extern T0* GE_new472(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_RENAME] */
extern T0* GE_new473(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [GEANT_REDEFINE] */
extern T0* GE_new474(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [GEANT_REDEFINE, STRING_8] */
extern T0* GE_new475(T1 initialize);
/* New instance of type SPECIAL [GEANT_REDEFINE] */
extern T0* GE_new477(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8] */
extern T0* GE_new478(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_REDEFINE] */
extern T0* GE_new479(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [GEANT_SELECT] */
extern T0* GE_new480(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [GEANT_SELECT, STRING_8] */
extern T0* GE_new481(T1 initialize);
/* New instance of type SPECIAL [GEANT_SELECT] */
extern T0* GE_new483(T6 a1, T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8] */
extern T0* GE_new484(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_SELECT] */
extern T0* GE_new485(T1 initialize);
/* New instance of type DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
extern T0* GE_new487(T1 initialize);
/* New instance of type KL_DIRECTORY */
extern T0* GE_new488(T1 initialize);
/* New instance of type KL_STRING_INPUT_STREAM */
extern T0* GE_new489(T1 initialize);
/* New instance of type SPECIAL [XM_NAMESPACE] */
extern T0* GE_new490(T6 a1, T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [XM_NAMESPACE] */
extern T0* GE_new491(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [XM_NAMESPACE] */
extern T0* GE_new492(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
extern T0* GE_new493(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8] */
extern T0* GE_new494(T1 initialize);
/* New instance of type TO_SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]] */
extern T0* GE_new495(T1 initialize);
/* New instance of type GEANT_MAP_ELEMENT */
extern T0* GE_new498(T1 initialize);
/* New instance of type GEANT_MAP */
extern T0* GE_new499(T1 initialize);
/* New instance of type DS_HASH_SET [GEANT_FILESET_ENTRY] */
extern T0* GE_new502(T1 initialize);
/* New instance of type DS_HASH_SET [STRING_8] */
extern T0* GE_new504(T1 initialize);
/* New instance of type LX_DFA_WILDCARD */
extern T0* GE_new506(T1 initialize);
/* New instance of type DS_HASH_SET [INTEGER_32] */
extern T0* GE_new508(T1 initialize);
/* New instance of type DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8]]] */
extern T0* GE_new509(T1 initialize);
/* New instance of type TUPLE [STRING_8] */
extern T0* GE_new510(T1 initialize);
/* New instance of type PROCEDURE [GEANT_ECHO_COMMAND, TUPLE [STRING_8]] */
extern T0* GE_new511(T1 initialize);
/* New instance of type TUPLE [GEANT_ECHO_COMMAND] */
extern T0* GE_new512(T1 initialize);
/* New instance of type DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]]] */
extern T0* GE_new514(T1 initialize);
/* New instance of type KL_TEXT_OUTPUT_FILE */
extern T0* GE_new515(T1 initialize);
/* New instance of type TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN] */
extern T0* GE_new516(T1 initialize);
/* New instance of type PROCEDURE [GEANT_ECHO_COMMAND, TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]] */
extern T0* GE_new517(T1 initialize);
/* New instance of type PROCEDURE [GEANT_MKDIR_COMMAND, TUPLE [STRING_8]] */
extern T0* GE_new519(T1 initialize);
/* New instance of type TUPLE [GEANT_MKDIR_COMMAND] */
extern T0* GE_new520(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]] */
extern T0* GE_new521(T1 initialize);
/* New instance of type SPECIAL [DS_PAIR [STRING_8, STRING_8]] */
extern T0* GE_new522(T6 a1, T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING_8, STRING_8]] */
extern T0* GE_new523(T1 initialize);
/* New instance of type DS_CELL [FUNCTION [ANY, TUPLE [STRING_8], BOOLEAN]] */
extern T0* GE_new524(T1 initialize);
/* New instance of type PREDICATE [GEANT_AVAILABLE_COMMAND, TUPLE [STRING_8]] */
extern T0* GE_new525(T1 initialize);
/* New instance of type TUPLE [GEANT_AVAILABLE_COMMAND] */
extern T0* GE_new526(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_RENAME, STRING_8] */
extern T0* GE_new528(T1 initialize);
/* New instance of type TO_SPECIAL [GEANT_RENAME] */
extern T0* GE_new529(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_REDEFINE, STRING_8] */
extern T0* GE_new530(T1 initialize);
/* New instance of type TO_SPECIAL [GEANT_REDEFINE] */
extern T0* GE_new531(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_SELECT, STRING_8] */
extern T0* GE_new532(T1 initialize);
/* New instance of type TO_SPECIAL [GEANT_SELECT] */
extern T0* GE_new533(T1 initialize);
/* New instance of type TO_SPECIAL [XM_NAMESPACE] */
extern T0* GE_new538(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY] */
extern T0* GE_new540(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY] */
extern T0* GE_new541(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY] */
extern T0* GE_new542(T1 initialize);
/* New instance of type GEANT_FILESET_ENTRY */
extern T0* GE_new543(T1 initialize);
/* New instance of type SPECIAL [GEANT_FILESET_ENTRY] */
extern T0* GE_new544(T6 a1, T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [STRING_8] */
extern T0* GE_new545(T1 initialize);
/* New instance of type LX_WILDCARD_PARSER */
extern T0* GE_new546(T1 initialize);
/* New instance of type LX_DESCRIPTION */
extern T0* GE_new547(T1 initialize);
/* New instance of type LX_FULL_DFA */
extern T0* GE_new548(T1 initialize);
/* New instance of type DS_HASH_SET_CURSOR [INTEGER_32] */
extern T0* GE_new550(T1 initialize);
/* New instance of type KL_EQUALITY_TESTER [INTEGER_32] */
extern T0* GE_new551(T1 initialize);
/* New instance of type TO_SPECIAL [DS_PAIR [STRING_8, STRING_8]] */
extern T0* GE_new552(T1 initialize);
/* New instance of type KL_NULL_TEXT_OUTPUT_STREAM */
extern T0* GE_new556(T1 initialize);
/* New instance of type PLATFORM */
extern T0* GE_new557(T1 initialize);
/* New instance of type DP_SHELL_COMMAND */
extern T0* GE_new559(T1 initialize);
/* New instance of type DS_CELL [BOOLEAN] */
extern T0* GE_new560(T1 initialize);
/* New instance of type KL_BOOLEAN_ROUTINES */
extern T0* GE_new562(T1 initialize);
/* New instance of type ARRAY [BOOLEAN] */
extern T0* GE_new563(T1 initialize);
/* New instance of type GEANT_VARIABLES_VARIABLE_RESOLVER */
extern T0* GE_new564(T1 initialize);
/* New instance of type RX_PCRE_REGULAR_EXPRESSION */
extern T0* GE_new565(T1 initialize);
/* New instance of type KL_STRING_EQUALITY_TESTER */
extern T0* GE_new566(T1 initialize);
/* New instance of type KL_STDIN_FILE */
extern T0* GE_new567(T1 initialize);
/* New instance of type ARRAY [GEANT_VARIABLES] */
extern T0* GE_new568(T1 initialize);
/* New instance of type TO_SPECIAL [GEANT_FILESET_ENTRY] */
extern T0* GE_new571(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [LX_RULE] */
extern T0* GE_new572(T1 initialize);
/* New instance of type LX_START_CONDITIONS */
extern T0* GE_new573(T1 initialize);
/* New instance of type LX_ACTION_FACTORY */
extern T0* GE_new574(T1 initialize);
/* New instance of type DS_ARRAYED_STACK [INTEGER_32] */
extern T0* GE_new575(T1 initialize);
/* New instance of type DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8] */
extern T0* GE_new576(T1 initialize);
/* New instance of type LX_SYMBOL_CLASS */
extern T0* GE_new577(T1 initialize);
/* New instance of type SPECIAL [LX_SYMBOL_CLASS] */
extern T0* GE_new578(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS] */
extern T0* GE_new579(T1 initialize);
/* New instance of type LX_NFA */
extern T0* GE_new580(T1 initialize);
/* New instance of type LX_EQUIVALENCE_CLASSES */
extern T0* GE_new581(T1 initialize);
/* New instance of type LX_RULE */
extern T0* GE_new582(T1 initialize);
/* New instance of type SPECIAL [LX_NFA] */
extern T0* GE_new583(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_NFA] */
extern T0* GE_new584(T1 initialize);
/* New instance of type UT_SYNTAX_ERROR */
extern T0* GE_new585(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
extern T0* GE_new586(T1 initialize);
/* New instance of type LX_UNRECOGNIZED_RULE_ERROR */
extern T0* GE_new587(T1 initialize);
/* New instance of type LX_MISSING_QUOTE_ERROR */
extern T0* GE_new588(T1 initialize);
/* New instance of type LX_BAD_CHARACTER_CLASS_ERROR */
extern T0* GE_new589(T1 initialize);
/* New instance of type LX_BAD_CHARACTER_ERROR */
extern T0* GE_new590(T1 initialize);
/* New instance of type LX_FULL_AND_META_ERROR */
extern T0* GE_new591(T1 initialize);
/* New instance of type LX_FULL_AND_REJECT_ERROR */
extern T0* GE_new592(T1 initialize);
/* New instance of type LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR */
extern T0* GE_new593(T1 initialize);
/* New instance of type LX_CHARACTER_OUT_OF_RANGE_ERROR */
extern T0* GE_new594(T1 initialize);
/* New instance of type SPECIAL [LX_RULE] */
extern T0* GE_new595(T6 a1, T1 initialize);
/* New instance of type ARRAY [LX_RULE] */
extern T0* GE_new596(T1 initialize);
/* New instance of type LX_DFA_STATE */
extern T0* GE_new597(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [LX_NFA_STATE] */
extern T0* GE_new598(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [LX_DFA_STATE] */
extern T0* GE_new599(T1 initialize);
/* New instance of type LX_SYMBOL_PARTITIONS */
extern T0* GE_new600(T1 initialize);
/* New instance of type LX_START_CONDITION */
extern T0* GE_new601(T1 initialize);
/* New instance of type LX_TRANSITION_TABLE [LX_DFA_STATE] */
extern T0* GE_new602(T1 initialize);
/* New instance of type DS_ARRAYED_LIST [LX_NFA] */
extern T0* GE_new603(T1 initialize);
/* New instance of type DS_HASH_TABLE [LX_NFA, INTEGER_32] */
extern T0* GE_new604(T1 initialize);
/* New instance of type LX_NFA_STATE */
extern T0* GE_new605(T1 initialize);
/* New instance of type LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR */
extern T0* GE_new607(T1 initialize);
/* New instance of type RX_BYTE_CODE */
extern T0* GE_new609(T1 initialize);
/* New instance of type RX_CASE_MAPPING */
extern T0* GE_new610(T1 initialize);
/* New instance of type RX_CHARACTER_SET */
extern T0* GE_new611(T1 initialize);
/* New instance of type SPECIAL [RX_CHARACTER_SET] */
extern T0* GE_new613(T6 a1, T1 initialize);
/* New instance of type ARRAY [RX_CHARACTER_SET] */
extern T0* GE_new614(T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_RULE] */
extern T0* GE_new615(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_RULE] */
extern T0* GE_new616(T1 initialize);
/* New instance of type SPECIAL [LX_START_CONDITION] */
extern T0* GE_new617(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_START_CONDITION] */
extern T0* GE_new618(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION] */
extern T0* GE_new619(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING_8] */
extern T0* GE_new621(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
extern T0* GE_new623(T1 initialize);
/* New instance of type TO_SPECIAL [LX_SYMBOL_CLASS] */
extern T0* GE_new624(T1 initialize);
/* New instance of type LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE] */
extern T0* GE_new625(T1 initialize);
/* New instance of type LX_EPSILON_TRANSITION [LX_NFA_STATE] */
extern T0* GE_new627(T1 initialize);
/* New instance of type LX_SYMBOL_TRANSITION [LX_NFA_STATE] */
extern T0* GE_new629(T1 initialize);
/* New instance of type DS_BILINKABLE [INTEGER_32] */
extern T0* GE_new630(T1 initialize);
/* New instance of type SPECIAL [DS_BILINKABLE [INTEGER_32]] */
extern T0* GE_new631(T6 a1, T1 initialize);
/* New instance of type ARRAY [DS_BILINKABLE [INTEGER_32]] */
extern T0* GE_new632(T1 initialize);
/* New instance of type LX_ACTION */
extern T0* GE_new634(T1 initialize);
/* New instance of type TO_SPECIAL [LX_NFA] */
extern T0* GE_new635(T1 initialize);
/* New instance of type DS_BUBBLE_SORTER [LX_NFA_STATE] */
extern T0* GE_new636(T1 initialize);
/* New instance of type DS_BUBBLE_SORTER [LX_RULE] */
extern T0* GE_new638(T1 initialize);
/* New instance of type SPECIAL [LX_NFA_STATE] */
extern T0* GE_new640(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_NFA_STATE] */
extern T0* GE_new642(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE] */
extern T0* GE_new643(T1 initialize);
/* New instance of type SPECIAL [LX_DFA_STATE] */
extern T0* GE_new645(T6 a1, T1 initialize);
/* New instance of type KL_SPECIAL_ROUTINES [LX_DFA_STATE] */
extern T0* GE_new646(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE] */
extern T0* GE_new647(T1 initialize);
/* New instance of type ARRAY [LX_DFA_STATE] */
extern T0* GE_new648(T1 initialize);
/* New instance of type KL_ARRAY_ROUTINES [LX_DFA_STATE] */
extern T0* GE_new649(T1 initialize);
/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_NFA] */
extern T0* GE_new650(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS [LX_NFA, INTEGER_32] */
extern T0* GE_new652(T1 initialize);
/* New instance of type DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32] */
extern T0* GE_new654(T1 initialize);
/* New instance of type KL_BINARY_INPUT_FILE */
extern T0* GE_new655(T1 initialize);
/* New instance of type KL_BINARY_OUTPUT_FILE */
extern T0* GE_new656(T1 initialize);
/* New instance of type GE_HASH_TABLE [C_STRING, STRING_8] */
extern T0* GE_new657(T1 initialize);
/* New instance of type FILE_NAME */
extern T0* GE_new659(T1 initialize);
/* New instance of type RAW_FILE */
extern T0* GE_new660(T1 initialize);
/* New instance of type DIRECTORY */
extern T0* GE_new661(T1 initialize);
/* New instance of type ARRAYED_LIST [STRING_8] */
extern T0* GE_new662(T1 initialize);
/* New instance of type KL_COMPARABLE_COMPARATOR [LX_RULE] */
extern T0* GE_new665(T1 initialize);
/* New instance of type KL_COMPARABLE_COMPARATOR [LX_NFA_STATE] */
extern T0* GE_new668(T1 initialize);
/* New instance of type TO_SPECIAL [LX_RULE] */
extern T0* GE_new671(T1 initialize);
/* New instance of type TO_SPECIAL [LX_START_CONDITION] */
extern T0* GE_new672(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [LX_SYMBOL_CLASS, STRING_8] */
extern T0* GE_new673(T1 initialize);
/* New instance of type TO_SPECIAL [LX_NFA_STATE] */
extern T0* GE_new674(T1 initialize);
/* New instance of type TO_SPECIAL [LX_DFA_STATE] */
extern T0* GE_new675(T1 initialize);
/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [LX_NFA, INTEGER_32] */
extern T0* GE_new676(T1 initialize);
/* New instance of type STRING_SEARCHER */
extern T0* GE_new677(T1 initialize);
/* New instance of type GE_STRING_EQUALITY_TESTER */
extern T0* GE_new678(T1 initialize);
/* New instance of type DS_SHELL_SORTER [INTEGER_32] */
extern T0* GE_new680(T1 initialize);
/* New instance of type PRIMES */
extern T0* GE_new683(T1 initialize);
/* New instance of type SPECIAL [C_STRING] */
extern T0* GE_new684(T6 a1, T1 initialize);
/* New instance of type KL_COMPARABLE_COMPARATOR [INTEGER_32] */
extern T0* GE_new688(T1 initialize);
/* GEANT.make */
extern T0* T21c20(void);
/* GEANT_PROJECT.build */
extern void T22f35(T0* C, T0* a1);
/* GEANT_PROJECT.build_target */
extern void T22f46(T0* C, T0* a1, T0* a2);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].remove */
extern void T104f10(T0* C);
/* DS_ARRAYED_STACK [GEANT_TARGET].remove */
extern void T190f11(T0* C);
/* GEANT_PROJECT.execute_target */
extern void T22f49(T0* C, T0* a1, T0* a2, T1 a3, T1 a4);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].remove */
extern void T105f10(T0* C);
/* GEANT_TARGET.execute */
extern void T26f75(T0* C);
/* GEANT_TARGET.set_executed */
extern void T26f79(T0* C, T1 a1);
/* GEANT_TARGET.execute */
extern void T26f75p1(T0* C);
/* GEANT_TARGET.has_attribute */
extern T1 T26f28(T0* C, T0* a1);
/* GEANT_TARGET.execute_nested_tasks */
extern void T26f81(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].forth */
extern void T203f11(T0* C);
/* XM_DOCUMENT.cursor_forth */
extern void T97f24(T0* C, T0* a1);
/* XM_DOCUMENT.add_traversing_cursor */
extern void T97f28(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_next_cursor */
extern void T203f16(T0* C, T0* a1);
/* XM_DOCUMENT.remove_traversing_cursor */
extern void T97f29(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set */
extern void T203f14(T0* C, T0* a1, T1 a2, T1 a3);
/* XM_ELEMENT.cursor_forth */
extern void T98f41(T0* C, T0* a1);
/* XM_ELEMENT.add_traversing_cursor */
extern void T98f44(T0* C, T0* a1);
/* XM_ELEMENT.remove_traversing_cursor */
extern void T98f45(T0* C, T0* a1);
/* GEANT_TARGET.execute_element */
extern void T26f83(T0* C, T0* a1);
/* GEANT_TARGET.obsolete_element_name */
extern unsigned char ge60os2407;
extern T0* ge60ov2407;
extern T0* T26f17(T0* C);
/* GEANT_TARGET.argument_element_name */
extern unsigned char ge60os2408;
extern T0* ge60ov2408;
extern T0* T26f15(T0* C);
/* GEANT_TARGET.description_element_name */
extern unsigned char ge126os2457;
extern T0* ge126ov2457;
extern T0* T26f22(T0* C);
/* GEANT_TARGET.execute_task */
extern void T26f84(T0* C, T0* a1);
/* GEANT_PROJECT.new_task */
extern T0* T22f25(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_task */
extern T0* T191f54(T0* C, T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].item */
extern T0* T264f30(T0* C, T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].item_storage_item */
extern T0* T264f32(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].search_position */
extern void T264f55(T0* C, T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].clashes_item */
extern T6 T264f33(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].hash_position */
extern T6 T264f34(T0* C, T0* a1);
/* UC_UTF8_STRING.hash_code */
extern T6 T206f16(T0* C);
/* UC_UTF8_STRING.string */
extern T0* T206f35(T0* C);
/* KL_INTEGER_ROUTINES.to_character */
extern T2 T209f2(T0* C, T6 a1);
/* UC_UTF8_STRING.integer_ */
extern unsigned char ge178os4814;
extern T0* ge178ov4814;
extern T0* T206f24(T0* C);
/* KL_INTEGER_ROUTINES.default_create */
extern T0* T209c4(void);
/* INTEGER_32.infix "<=" */
extern T1 T6f9(T6* C, T6 a1);
/* STRING_8.append_character */
extern void T17f35(T0* C, T2 a1);
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
extern T2 T206f21(T0* C, T6 a1);
/* UC_UTF8_STRING.old_item */
extern T2 T206f34(T0* C, T6 a1);
/* UC_UTF8_STRING.set_count */
extern void T206f61(T0* C, T6 a1);
/* UC_UTF8_STRING.reset_byte_index_cache */
extern void T206f68(T0* C);
/* STRING_8.make */
extern void T17f34(T0* C, T6 a1);
/* STRING_8.make */
extern T0* T17c34(T6 a1);
/* SPECIAL [CHARACTER_8].make */
extern T0* T15c9(T6 a1);
/* UC_UTF8_STRING.next_byte_index */
extern T6 T206f25(T0* C, T6 a1);
/* UC_UTF8_ROUTINES.encoded_byte_count */
extern T6 T205f3(T0* C, T2 a1);
/* CHARACTER_8.infix "<=" */
extern T1 T2f17(T2* C, T2 a1);
/* CHARACTER_8.infix "<" */
extern T1 T2f5(T2* C, T2 a1);
/* UC_UTF8_STRING.utf8 */
extern unsigned char ge276os5403;
extern T0* ge276ov5403;
extern T0* T206f26(T0* C);
/* UC_UTF8_ROUTINES.default_create */
extern T0* T205c36(void);
/* KL_PLATFORM.maximum_character_code */
extern unsigned char ge257os7685;
extern T6 ge257ov7685;
extern T6 T210f1(T0* C);
/* UC_UTF8_STRING.platform */
extern unsigned char ge264os4015;
extern T0* ge264ov4015;
extern T0* T206f23(T0* C);
/* KL_PLATFORM.default_create */
extern T0* T210c3(void);
/* UC_UTF8_STRING.item_code_at_byte_index */
extern T6 T206f22(T0* C, T6 a1);
/* UC_UTF8_ROUTINES.encoded_next_value */
extern T6 T205f6(T0* C, T2 a1);
/* UC_UTF8_ROUTINES.encoded_first_value */
extern T6 T205f4(T0* C, T2 a1);
/* UC_UTF8_STRING.hash_code */
extern T6 T206f16p1(T0* C);
/* INTEGER_32.infix "|<<" */
extern T6 T6f11(T6* C, T6 a1);
/* STRING_8.hash_code */
extern T6 T17f7(T0* C);
/* UC_STRING_EQUALITY_TESTER.test */
extern T1 T59f1(T0* C, T0* a1, T0* a2);
/* UC_STRING_EQUALITY_TESTER.string_ */
extern unsigned char ge183os1787;
extern T0* ge183ov1787;
extern T0* T59f2(T0* C);
/* KL_STRING_ROUTINES.default_create */
extern T0* T76c19(void);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].key_storage_item */
extern T0* T264f31(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].slots_item */
extern T6 T264f21(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].has */
extern T1 T264f29(T0* C, T0* a1);
/* XM_ELEMENT.set_name */
extern void T98f54(T0* C, T0* a1);
/* GEANT_TARGET.set_attribute_name */
extern unsigned char ge60os2410;
extern T0* ge60ov2410;
extern T0* T26f55(T0* C);
/* XM_ELEMENT.cloned_object */
extern T0* T98f26(T0* C);
/* XM_ELEMENT.twin */
extern T0* T98f28(T0* C);
/* XM_ELEMENT.copy */
extern void T98f55(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].put_right */
extern void T361f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].make */
extern T0* T361c3(T0* a1);
/* XM_ELEMENT.is_empty */
extern T1 T98f17(T0* C);
/* XM_ELEMENT.valid_cursor */
extern T1 T98f30(T0* C, T0* a1);
/* XM_ELEMENT.move_all_cursors_after */
extern void T98f53(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_after */
extern void T203f15(T0* C);
/* GEANT_NAME_VALUE_ELEMENT.has_value */
extern T1 T348f4(T0* C);
/* GEANT_NAME_VALUE_ELEMENT.has_attribute */
extern T1 T348f3(T0* C, T0* a1);
/* GEANT_NAME_VALUE_ELEMENT.value_attribute_name */
extern unsigned char ge138os7494;
extern T0* ge138ov7494;
extern T0* T348f2(T0* C);
/* GEANT_NAME_VALUE_ELEMENT.make */
extern T0* T348c5(T0* a1);
/* GEANT_NAME_VALUE_ELEMENT.set_xml_element */
extern void T348f6(T0* C, T0* a1);
/* GEANT_TARGET.global_element_name */
extern unsigned char ge52os2430;
extern T0* ge52ov2430;
extern T0* T26f21(T0* C);
/* GEANT_TARGET.local_element_name */
extern unsigned char ge52os2431;
extern T0* ge52ov2431;
extern T0* T26f19(T0* C);
/* GEANT_TARGET.execute_group_element */
extern void T26f82(T0* C, T0* a1);
/* GEANT_GROUP.execute */
extern void T201f26(T0* C);
/* GEANT_GROUP.has_attribute */
extern T1 T201f18(T0* C, T0* a1);
/* GEANT_GROUP.execute_nested_tasks */
extern void T201f32(T0* C);
/* GEANT_GROUP.execute_element */
extern void T201f37(T0* C, T0* a1);
/* GEANT_GROUP.execute_task */
extern void T201f38(T0* C, T0* a1);
/* GEANT_GROUP.description_element_name */
extern T0* T201f13(T0* C);
/* GEANT_GROUP.global_element_name */
extern T0* T201f20(T0* C);
/* GEANT_GROUP.local_element_name */
extern T0* T201f19(T0* C);
/* GEANT_GROUP.execute_group_element */
extern void T201f36(T0* C, T0* a1);
/* GEANT_GROUP.group_element_name */
extern unsigned char ge52os2429;
extern T0* ge52ov2429;
extern T0* T201f17(T0* C);
/* GEANT_GROUP.string_ */
extern T0* T201f16(T0* C);
/* GEANT_GROUP.prepare_variables_before_execution */
extern void T201f31(T0* C);
/* GEANT_GROUP.exit_application */
extern void T201f30(T0* C, T6 a1, T0* a2);
/* KL_EXCEPTIONS.die */
extern void T48f2(T0* C, T6 a1);
/* GEANT_GROUP.exceptions */
extern unsigned char ge260os1789;
extern T0* ge260ov1789;
extern T0* T201f15(T0* C);
/* KL_EXCEPTIONS.default_create */
extern T0* T48c1(void);
/* KL_STDERR_FILE.put_line */
extern void T47f12(T0* C, T0* a1);
/* KL_STDERR_FILE.put_string */
extern void T47f13(T0* C, T0* a1);
/* KL_STDERR_FILE.old_put_string */
extern void T47f15(T0* C, T0* a1);
/* KL_STDERR_FILE.console_ps */
extern void T47f18(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STRING_ROUTINES.as_string */
extern T0* T76f2(T0* C, T0* a1);
/* STRING_8.string */
extern T0* T17f13(T0* C);
/* STRING_8.make_from_string */
extern T0* T17c40(T0* a1);
/* SPECIAL [CHARACTER_8].twin */
extern T0* T15f5(T0* C);
/* UC_UTF8_STRING.as_string */
extern T0* T206f31(T0* C);
/* UC_UTF8_STRING.to_utf8 */
extern T0* T206f19(T0* C);
/* KL_ANY_ROUTINES.same_types */
extern T1 T84f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.any_ */
extern unsigned char ge170os2029;
extern T0* ge170ov2029;
extern T0* T76f8(T0* C);
/* KL_ANY_ROUTINES.default_create */
extern T0* T84c3(void);
/* KL_STDERR_FILE.string_ */
extern T0* T47f5(T0* C);
/* KL_STDERR_FILE.put_new_line */
extern void T47f11(T0* C);
/* KL_STANDARD_FILES.error */
extern unsigned char ge229os2999;
extern T0* ge229ov2999;
extern T0* T46f1(T0* C);
/* KL_STDERR_FILE.make */
extern T0* T47c9(void);
/* KL_STDERR_FILE.make_open_stderr */
extern void T47f14(T0* C, T0* a1);
/* KL_STDERR_FILE.set_write_mode */
extern void T47f17(T0* C);
/* KL_STDERR_FILE.console_def */
extern T14 T47f4(T0* C, T6 a1);
/* KL_STDERR_FILE.old_make */
extern void T47f16(T0* C, T0* a1);
/* GEANT_GROUP.std */
extern unsigned char ge227os1791;
extern T0* ge227ov1791;
extern T0* T201f14(T0* C);
/* KL_STANDARD_FILES.default_create */
extern T0* T46c3(void);
/* GEANT_GROUP.log_messages */
extern void T201f35(T0* C, T0* a1);
/* ARRAY [STRING_8].item */
extern T0* T33f4(T0* C, T6 a1);
/* GEANT_GROUP.associated_target */
extern T0* T201f12(T0* C);
/* GEANT_GROUP.file_system */
extern unsigned char ge226os1792;
extern T0* ge226ov1792;
extern T0* T201f11(T0* C);
/* GEANT_GROUP.unix_file_system */
extern unsigned char ge226os1795;
extern T0* ge226ov1795;
extern T0* T201f23(T0* C);
/* KL_UNIX_FILE_SYSTEM.make */
extern T0* T54c32(void);
/* KL_OPERATING_SYSTEM.is_unix */
extern unsigned char ge255os3024;
extern T1 ge255ov3024;
extern T1 T51f2(T0* C);
/* STRING_8.item */
extern T2 T17f9(T0* C, T6 a1);
/* KL_OPERATING_SYSTEM.current_working_directory */
extern T0* T51f4(T0* C);
/* EXECUTION_ENVIRONMENT.current_working_directory */
extern T0* T83f2(T0* C);
/* KL_OPERATING_SYSTEM.execution_environment */
extern unsigned char ge255os3028;
extern T0* ge255ov3028;
extern T0* T51f5(T0* C);
/* EXECUTION_ENVIRONMENT.default_create */
extern T0* T83c6(void);
/* STRING_8.is_equal */
extern T1 T17f25(T0* C, T0* a1);
/* STRING_8.str_strict_cmp */
extern T6 T17f27(T0* C, T0* a1, T0* a2, T6 a3);
/* KL_OPERATING_SYSTEM.variable_value */
extern T0* T51f3(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.get */
extern T0* T83f4(T0* C, T0* a1);
/* STRING_8.make_from_c_pointer */
extern T0* T17c44(T14 a1);
/* C_STRING.read_substring_into_character_8_area */
extern void T188f7(T0* C, T0* a1, T6 a2, T6 a3);
/* MANAGED_POINTER.read_natural_8 */
extern T8 T263f6(T0* C, T6 a1);
/* TYPED_POINTER [NATURAL_8].memory_copy */
extern void T368f2(T368* C, T14 a1, T6 a2);
/* TYPED_POINTER [NATURAL_8].c_memcpy */
extern void T368f3(T368* C, T14 a1, T14 a2, T6 a3);
/* C_STRING.set_shared_from_pointer */
extern void T188f6(T0* C, T14 a1);
/* C_STRING.set_shared_from_pointer_and_count */
extern void T188f8(T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.set_from_pointer */
extern void T263f10(T0* C, T14 a1, T6 a2);
/* MANAGED_POINTER.share_from_pointer */
extern T0* T263c9(T14 a1, T6 a2);
/* C_STRING.c_strlen */
extern T6 T188f3(T0* C, T14 a1);
/* STRING_8.c_string_provider */
extern unsigned char ge2356os1266;
extern T0* ge2356ov1266;
extern T0* T17f28(T0* C);
/* C_STRING.make_empty */
extern void T188f5(T0* C, T6 a1);
/* C_STRING.make_empty */
extern T0* T188c5(T6 a1);
/* MANAGED_POINTER.make */
extern T0* T263c7(T6 a1);
/* EXCEPTIONS.raise */
extern void T369f3(T0* C, T0* a1);
/* EXCEPTIONS.eraise */
extern void T369f4(T0* C, T14 a1, T6 a2);
/* EXCEPTIONS.default_create */
extern T0* T369c2(void);
/* MANAGED_POINTER.default_pointer */
extern T14 T263f5(T0* C);
/* POINTER.memory_calloc */
extern T14 T14f2(T14* C, T6 a1, T6 a2);
/* POINTER.c_calloc */
extern T14 T14f3(T14* C, T6 a1, T6 a2);
/* EXECUTION_ENVIRONMENT.eif_getenv */
extern T14 T83f3(T0* C, T14 a1);
/* GEANT_GROUP.windows_file_system */
extern unsigned char ge226os1793;
extern T0* ge226ov1793;
extern T0* T201f22(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.make */
extern T0* T53c36(void);
/* KL_OPERATING_SYSTEM.is_windows */
extern unsigned char ge255os3023;
extern T1 ge255ov3023;
extern T1 T51f1(T0* C);
/* GEANT_GROUP.operating_system */
extern unsigned char ge263os1796;
extern T0* ge263ov1796;
extern T0* T201f21(T0* C);
/* KL_OPERATING_SYSTEM.default_create */
extern T0* T51c7(void);
/* GEANT_GROUP.project_variables_resolver */
extern unsigned char ge58os1778;
extern T0* ge58ov1778;
extern T0* T201f6(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.make */
extern T0* T58c16(void);
/* GEANT_GROUP.dir_attribute_name */
extern unsigned char ge134os2439;
extern T0* ge134ov2439;
extern T0* T201f10(T0* C);
/* GEANT_GROUP.is_enabled */
extern T1 T201f8(T0* C);
/* GEANT_GROUP.unless_attribute_name */
extern unsigned char ge134os2441;
extern T0* ge134ov2441;
extern T0* T201f7(T0* C);
/* BOOLEAN.out */
extern T0* T1f6(T1* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.boolean_condition_value */
extern T1 T58f8(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.string_ */
extern T0* T58f2(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.exit_application */
extern void T58f18(T0* C, T6 a1, T0* a2);
/* GEANT_PROJECT_VARIABLE_RESOLVER.exceptions */
extern T0* T58f15(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.std */
extern T0* T58f14(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.log_messages */
extern void T58f19(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.has */
extern T1 T58f6(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.variable_value */
extern T0* T103f5(T0* C, T0* a1);
/* KL_EXECUTION_ENVIRONMENT.string_ */
extern T0* T103f3(T0* C);
/* KL_EXECUTION_ENVIRONMENT.environment_impl */
extern unsigned char ge321os5893;
extern T0* ge321ov5893;
extern T0* T103f2(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.execution_environment */
extern unsigned char ge261os1788;
extern T0* ge261ov1788;
extern T0* T58f7(T0* C);
/* KL_EXECUTION_ENVIRONMENT.default_create */
extern T0* T103c7(void);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].item */
extern T0* T105f5(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.target_locals_stack */
extern unsigned char ge58os1781;
extern T0* ge58ov1781;
extern T0* T58f5(T0* C);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].make */
extern T0* T105c8(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES].make */
extern T0* T184f1(T0* C, T6 a1);
/* TO_SPECIAL [GEANT_VARIABLES].make_area */
extern T0* T256c2(T6 a1);
/* SPECIAL [GEANT_VARIABLES].make */
extern T0* T183c4(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES].default_create */
extern T0* T184c3(void);
/* GEANT_PROJECT_VARIABLE_RESOLVER.commandline_variables */
extern unsigned char ge58os1771;
extern T0* ge58ov1771;
extern T0* T58f4(T0* C);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].item */
extern T0* T104f5(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.target_arguments_stack */
extern unsigned char ge58os1780;
extern T0* ge58ov1780;
extern T0* T58f3(T0* C);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].make */
extern T0* T104c8(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].make */
extern T0* T182f1(T0* C, T6 a1);
/* TO_SPECIAL [GEANT_ARGUMENT_VARIABLES].make_area */
extern T0* T255c2(T6 a1);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].make */
extern T0* T181c4(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].default_create */
extern T0* T182c3(void);
/* UC_UTF8_STRING.substring */
extern T0* T206f11(T0* C, T6 a1, T6 a2);
/* UC_UTF8_STRING.make_from_substring */
extern T0* T206c60(T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.make_from_substring_general */
extern void T206f70(T0* C, T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.put_substring_at_byte_index */
extern void T206f67(T0* C, T0* a1, T6 a2, T6 a3, T6 a4, T6 a5);
/* NATURAL_32.to_integer_32 */
extern T6 T10f2(T10* C);
/* UC_UTF8_STRING.code */
extern T10 T206f13(T0* C, T6 a1);
/* UC_UTF8_STRING.item_code */
extern T6 T206f15(T0* C, T6 a1);
/* STRING_8.code */
extern T10 T17f24(T0* C, T6 a1);
/* INTEGER_32.to_natural_32 */
extern T10 T6f12(T6* C);
/* UC_UTF8_STRING.put_code_at_byte_index */
extern void T206f73(T0* C, T6 a1, T6 a2, T6 a3);
/* UC_UTF8_ROUTINES.code_byte_count */
extern T6 T205f24(T0* C, T6 a1);
/* UC_UTF8_STRING.byte_index */
extern T6 T206f27(T0* C, T6 a1);
/* UC_UTF8_STRING.put_character_at_byte_index */
extern void T206f66(T0* C, T2 a1, T6 a2, T6 a3);
/* UC_UTF8_ROUTINES.character_byte_count */
extern T6 T205f23(T0* C, T2 a1);
/* UC_UTF8_STRING.put_byte */
extern void T206f71(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.old_put */
extern void T206f65(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.any_ */
extern T0* T206f39(T0* C);
/* UC_UTF8_ROUTINES.substring_byte_count */
extern T6 T205f22(T0* C, T0* a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.shifted_byte_index */
extern T6 T206f44(T0* C, T6 a1, T6 a2);
/* UC_UTF8_ROUTINES.dummy_uc_string */
extern unsigned char ge289os7590;
extern T0* ge289ov7590;
extern T0* T205f27(T0* C);
/* UC_STRING.make_empty */
extern T0* T116c8(void);
/* UC_STRING.make */
extern void T116f9(T0* C, T6 a1);
/* UC_STRING.old_set_count */
extern void T116f12(T0* C, T6 a1);
/* UC_STRING.set_count */
extern void T116f11(T0* C, T6 a1);
/* UC_STRING.byte_capacity */
extern T6 T116f7(T0* C);
/* UC_STRING.capacity */
extern T6 T116f7p1(T0* C);
/* UC_STRING.make */
extern void T116f9p1(T0* C, T6 a1);
/* UC_STRING.reset_byte_index_cache */
extern void T116f10(T0* C);
/* UC_UTF8_ROUTINES.any_ */
extern T0* T205f25(T0* C);
/* UC_UTF8_STRING.cloned_string */
extern T0* T206f38(T0* C);
/* UC_UTF8_STRING.twin */
extern T0* T206f43(T0* C);
/* UC_UTF8_STRING.copy */
extern void T206f77(T0* C, T0* a1);
/* UC_UTF8_STRING.copy */
extern void T206f77p1(T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].copy_data */
extern void T15f11(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [CHARACTER_8].move_data */
extern void T15f12(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].overlapping_move */
extern void T15f14(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [CHARACTER_8].non_overlapping_move */
extern void T15f13(T0* C, T6 a1, T6 a2, T6 a3);
/* UC_UTF8_STRING.make */
extern void T206f59(T0* C, T6 a1);
/* UC_UTF8_STRING.make */
extern T0* T206c59(T6 a1);
/* UC_UTF8_STRING.old_set_count */
extern void T206f69(T0* C, T6 a1);
/* UC_UTF8_STRING.byte_capacity */
extern T6 T206f37(T0* C);
/* UC_UTF8_STRING.capacity */
extern T6 T206f37p1(T0* C);
/* UC_UTF8_STRING.make */
extern void T206f59p1(T0* C, T6 a1);
/* STRING_8.substring */
extern T0* T17f10(T0* C, T6 a1, T6 a2);
/* STRING_8.set_count */
extern void T17f42(T0* C, T6 a1);
/* STRING_8.new_string */
extern T0* T17f19(T0* C, T6 a1);
/* UC_UTF8_STRING.item */
extern T2 T206f10(T0* C, T6 a1);
/* UC_UTF8_STRING.character_item_at_byte_index */
extern T2 T206f28(T0* C, T6 a1);
/* DS_LINKED_LIST [STRING_8].item */
extern T0* T240f7(T0* C, T6 a1);
/* ST_SPLITTER.split_greedy */
extern T0* T418f9(T0* C, T0* a1);
/* ST_SPLITTER.do_split */
extern T0* T418f7(T0* C, T0* a1, T1 a2);
/* DS_LINKED_LIST [STRING_8].force_last */
extern void T240f12(T0* C, T0* a1);
/* DS_LINKABLE [STRING_8].put_right */
extern void T347f4(T0* C, T0* a1);
/* DS_LINKABLE [STRING_8].make */
extern T0* T347c3(T0* a1);
/* DS_LINKED_LIST [STRING_8].is_empty */
extern T1 T240f6(T0* C);
/* DS_HASH_SET [INTEGER_32].has */
extern T1 T508f24(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].search_position */
extern void T508f32(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].clashes_item */
extern T6 T508f22(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].hash_position */
extern T6 T508f19(T0* C, T6 a1);
/* INTEGER_32.hash_code */
extern T6 T6f24(T6* C);
/* INTEGER_32.infix "&" */
extern T6 T6f25(T6* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].key_storage_item */
extern T6 T508f18(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].item_storage_item */
extern T6 T508f27(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].key_equality_tester */
extern T0* T508f17(T0* C);
/* DS_HASH_SET [INTEGER_32].slots_item */
extern T6 T508f25(T0* C, T6 a1);
/* KL_STRING_ROUTINES.appended_substring */
extern T0* T76f4(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* UC_UTF8_STRING.append_character */
extern void T206f56(T0* C, T2 a1);
/* UC_UTF8_STRING.resize_byte_storage */
extern void T206f64(T0* C, T6 a1);
/* UC_UTF8_STRING.resize */
extern void T206f72(T0* C, T6 a1);
/* UC_UTF8_STRING.append_string */
extern void T206f55(T0* C, T0* a1);
/* UC_UTF8_STRING.append */
extern void T206f63(T0* C, T0* a1);
/* UC_UTF8_STRING.dummy_uc_string */
extern unsigned char ge279os6160;
extern T0* ge279ov6160;
extern T0* T206f41(T0* C);
/* UC_UTF8_STRING.append */
extern void T206f63p1(T0* C, T0* a1);
/* UC_UTF8_STRING.additional_space */
extern T6 T206f42(T0* C);
/* ISE_RUNTIME.check_assert */
extern T1 T323s1(T1 a1);
/* UC_UTF8_STRING.new_empty_string */
extern T0* T206f9(T0* C, T6 a1);
/* UC_UTF8_STRING.append_substring */
extern void T206f57(T0* C, T0* a1, T6 a2, T6 a3);
/* ST_SPLITTER.string_ */
extern T0* T418f6(T0* C);
/* STRING_8.item_code */
extern T6 T17f12(T0* C, T6 a1);
/* DS_LINKED_LIST [STRING_8].make */
extern T0* T240c11(void);
/* DS_LINKED_LIST [STRING_8].new_cursor */
extern T0* T240f10(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].make */
extern T0* T343c7(T0* a1);
/* ST_SPLITTER.make_with_separators */
extern T0* T418c10(T0* a1);
/* ST_SPLITTER.set_separators */
extern void T418f12(T0* C, T0* a1);
/* DS_HASH_SET [INTEGER_32].put */
extern void T508f31(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].slots_put */
extern void T508f40(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [INTEGER_32].clashes_put */
extern void T508f39(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [INTEGER_32].item_storage_put */
extern void T508f38(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [INTEGER_32].unset_found_item */
extern void T508f37(T0* C);
/* DS_HASH_SET [INTEGER_32].make */
extern T0* T508c30(T6 a1);
/* DS_HASH_SET [INTEGER_32].new_cursor */
extern T0* T508f20(T0* C);
/* DS_HASH_SET_CURSOR [INTEGER_32].make */
extern T0* T550c3(T0* a1);
/* DS_HASH_SET [INTEGER_32].make_slots */
extern void T508f36(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].make */
extern T0* T65f2(T0* C, T6 a1);
/* TO_SPECIAL [INTEGER_32].make_area */
extern T0* T107c2(T6 a1);
/* SPECIAL [INTEGER_32].make */
extern T0* T63c4(T6 a1);
/* DS_HASH_SET [INTEGER_32].special_integer_ */
extern unsigned char ge181os2189;
extern T0* ge181ov2189;
extern T0* T508f23(T0* C);
/* KL_SPECIAL_ROUTINES [INTEGER_32].default_create */
extern T0* T65c4(void);
/* DS_HASH_SET [INTEGER_32].new_modulus */
extern T6 T508f28(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].make_clashes */
extern void T508f35(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].make_key_storage */
extern void T508f34(T0* C, T6 a1);
/* DS_HASH_SET [INTEGER_32].make_item_storage */
extern void T508f33(T0* C, T6 a1);
/* GEANT_GROUP.if_attribute_name */
extern unsigned char ge134os2440;
extern T0* ge134ov2440;
extern T0* T201f9(T0* C);
/* GEANT_GROUP.set_parent */
extern void T201f25(T0* C, T0* a1);
/* GEANT_GROUP.make */
extern T0* T201c24(T0* a1, T0* a2);
/* GEANT_GROUP.initialize */
extern void T201f27(T0* C);
/* GEANT_GROUP.set_description */
extern void T201f33(T0* C, T0* a1);
/* XM_ELEMENT.text */
extern T0* T98f27(T0* C);
/* KL_STRING_ROUTINES.appended_string */
extern T0* T76f5(T0* C, T0* a1, T0* a2);
/* STRING_8.append_string */
extern void T17f39(T0* C, T0* a1);
/* STRING_8.append */
extern void T17f36(T0* C, T0* a1);
/* KL_STRING_ROUTINES.concat */
extern T0* T76f6(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.prefixed_string */
extern T0* T206f8(T0* C, T0* a1);
/* KL_STRING_ROUTINES.cloned_string */
extern T0* T76f7(T0* C, T0* a1);
/* STRING_8.twin */
extern T0* T17f16(T0* C);
/* STRING_8.copy */
extern void T17f41(T0* C, T0* a1);
/* XM_ELEMENT.string_ */
extern T0* T98f29(T0* C);
/* XM_NODE_TYPER.is_character_data */
extern T1 T363f10(T0* C);
/* XM_NODE_TYPER.default_create */
extern T0* T363c11(void);
/* XM_ELEMENT.element_by_name */
extern T0* T98f16(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].go_after */
extern void T203f12(T0* C);
/* XM_DOCUMENT.cursor_go_after */
extern void T97f25(T0* C, T0* a1);
/* XM_DOCUMENT.cursor_off */
extern T1 T97f12(T0* C, T0* a1);
/* XM_ELEMENT.cursor_go_after */
extern void T98f42(T0* C, T0* a1);
/* XM_ELEMENT.cursor_off */
extern T1 T98f23(T0* C, T0* a1);
/* XM_ELEMENT.named_same_name */
extern T1 T98f9(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.same_namespace */
extern T1 T98f12(T0* C, T0* a1);
/* XM_ELEMENT.has_namespace */
extern T1 T98f14(T0* C);
/* XM_ELEMENT.same_string */
extern T1 T98f11(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.string_equality_tester */
extern unsigned char ge278os2191;
extern T0* ge278ov2191;
extern T0* T98f13(T0* C);
/* UC_STRING_EQUALITY_TESTER.default_create */
extern T0* T59c3(void);
/* XM_NODE_TYPER.is_element */
extern T1 T363f8(T0* C);
/* GEANT_GROUP.make */
extern void T201f24p1(T0* C, T0* a1, T0* a2);
/* XM_POSITION_TABLE.item */
extern T0* T100f3(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].forth */
extern void T211f10(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_forth */
extern void T180f11(T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].add_traversing_cursor */
extern void T180f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set_next_cursor */
extern void T211f13(T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].remove_traversing_cursor */
extern void T180f14(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set */
extern void T211f11(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].go_after */
extern void T211f9(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_go_after */
extern void T180f10(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].set_after */
extern void T211f12(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_off */
extern T1 T180f6(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].item */
extern T0* T211f6(T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].start */
extern void T211f8(T0* C);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].cursor_start */
extern void T180f9(T0* C, T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].new_cursor */
extern T0* T180f7(T0* C);
/* DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T211c7(T0* a1);
/* XM_POSITION_TABLE.has */
extern T1 T100f2(T0* C, T0* a1);
/* GEANT_GROUP.set_project */
extern void T201f29(T0* C, T0* a1);
/* GEANT_GROUP.element_make */
extern void T201f28(T0* C, T0* a1);
/* GEANT_GROUP.set_xml_element */
extern void T201f34(T0* C, T0* a1);
/* KL_STRING_ROUTINES.same_string */
extern T1 T76f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.elks_same_string */
extern T1 T76f10(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.same_string */
extern T1 T206f14(T0* C, T0* a1);
/* UC_UTF8_STRING.substring_index */
extern T6 T206f30(T0* C, T0* a1, T6 a2);
/* STRING_8.same_string */
extern T1 T17f17(T0* C, T0* a1);
/* STRING_8.same_string_general */
extern T1 T17f23(T0* C, T0* a1);
/* SPECIAL [CHARACTER_8].same_items */
extern T1 T15f4(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* UC_UTF8_STRING.same_unicode_string */
extern T1 T206f12(T0* C, T0* a1);
/* UC_UTF8_STRING.unicode_substring_index */
extern T6 T206f29(T0* C, T0* a1, T6 a2);
/* GEANT_TARGET.group_element_name */
extern T0* T26f54(T0* C);
/* GEANT_TARGET.string_ */
extern T0* T26f30(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].item */
extern T0* T203f8(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].start */
extern void T203f10(T0* C);
/* XM_DOCUMENT.cursor_start */
extern void T97f23(T0* C, T0* a1);
/* XM_ELEMENT.cursor_start */
extern void T98f40(T0* C, T0* a1);
/* XM_ELEMENT.new_cursor */
extern T0* T98f20(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].make */
extern T0* T203c9(T0* a1);
/* GEANT_TARGET.prepare_variables_before_execution */
extern void T26f80(T0* C);
/* GEANT_TARGET.prepare_variables_before_execution */
extern void T26f80p1(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].forth */
extern void T64f9(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].key */
extern T0* T64f5(T0* C);
/* STRING_8.make_empty */
extern T0* T17c45(void);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].item */
extern T0* T64f4(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].after */
extern T1 T64f6(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].start */
extern void T64f8(T0* C);
/* GEANT_TARGET.target_locals_stack */
extern T0* T26f53(T0* C);
/* GEANT_TARGET.prepared_arguments_from_formal_arguments */
extern T0* T26f52(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.has_same_keys */
extern T1 T34f35(T0* C, T0* a1);
/* GEANT_TARGET.named_from_numbered_arguments */
extern T0* T26f61(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.has_numbered_keys */
extern T1 T34f39(T0* C);
/* INTEGER_32.out */
extern T0* T6f13(T6* C);
/* STRING_8.append_integer */
extern void T17f46(T0* C, T6 a1);
/* GEANT_TARGET.target_arguments_stack */
extern T0* T26f51(T0* C);
/* KL_UNIX_FILE_SYSTEM.set_current_working_directory */
extern void T54f33(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.change_working_directory */
extern void T83f7(T0* C, T0* a1);
/* EXECUTION_ENVIRONMENT.eif_chdir */
extern T6 T83f5(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.execution_environment */
extern unsigned char ge213os3871;
extern T0* ge213ov3871;
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
extern void T26f67(T0* C, T6 a1, T0* a2);
/* GEANT_TARGET.exceptions */
extern T0* T26f24(T0* C);
/* GEANT_TARGET.std */
extern T0* T26f23(T0* C);
/* GEANT_TARGET.log_messages */
extern void T26f74(T0* C, T0* a1);
/* GEANT_TARGET.associated_target */
extern T0* T26f50(T0* C);
/* KL_UNIX_FILE_SYSTEM.directory_exists */
extern T1 T54f24(T0* C, T0* a1);
/* KL_DIRECTORY.exists */
extern T1 T488f13(T0* C);
/* KL_DIRECTORY.old_exists */
extern T1 T488f18(T0* C);
/* KL_DIRECTORY.eif_dir_exists */
extern T1 T488f10(T0* C, T14 a1);
/* KL_DIRECTORY.reset */
extern void T488f37(T0* C, T0* a1);
/* KL_DIRECTORY.make */
extern void T488f35(T0* C, T0* a1);
/* KL_DIRECTORY.make */
extern T0* T488c35(T0* a1);
/* KL_DIRECTORY.old_make */
extern void T488f38(T0* C, T0* a1);
/* KL_DIRECTORY.string_ */
extern T0* T488f14(T0* C);
/* KL_UNIX_FILE_SYSTEM.tmp_directory */
extern unsigned char ge213os3869;
extern T0* ge213ov3869;
extern T0* T54f25(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.directory_exists */
extern T1 T53f27(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.tmp_directory */
extern T0* T53f28(T0* C);
/* KL_UNIX_FILE_SYSTEM.current_working_directory */
extern T0* T54f23(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.current_working_directory */
extern T0* T53f26(T0* C);
/* GEANT_TARGET.file_system */
extern T0* T26f49(T0* C);
/* GEANT_TARGET.unix_file_system */
extern T0* T26f60(T0* C);
/* GEANT_TARGET.windows_file_system */
extern T0* T26f59(T0* C);
/* GEANT_TARGET.operating_system */
extern T0* T26f58(T0* C);
/* GEANT_STRING_INTERPRETER.interpreted_string */
extern T0* T258f5(T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.variable_value */
extern T0* T258f3(T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.expanded_variable_value */
extern T0* T258f6(T0* C, T0* a1);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.value */
extern T0* T564f2(T0* C, T0* a1);
/* GEANT_VARIABLES.item */
extern T0* T29f34(T0* C, T0* a1);
/* GEANT_VARIABLES.item_storage_item */
extern T0* T29f35(T0* C, T6 a1);
/* GEANT_VARIABLES.search_position */
extern void T29f54(T0* C, T0* a1);
/* GEANT_VARIABLES.clashes_item */
extern T6 T29f27(T0* C, T6 a1);
/* GEANT_VARIABLES.hash_position */
extern T6 T29f24(T0* C, T0* a1);
/* GEANT_VARIABLES.key_storage_item */
extern T0* T29f28(T0* C, T6 a1);
/* GEANT_VARIABLES.slots_item */
extern T6 T29f29(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.value */
extern T0* T58f9(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.cwd */
extern T0* T54f10(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.cwd */
extern T0* T53f10(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.file_system */
extern T0* T58f10(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.unix_file_system */
extern T0* T58f13(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.windows_file_system */
extern T0* T58f12(T0* C);
/* GEANT_PROJECT_VARIABLE_RESOLVER.operating_system */
extern T0* T58f11(T0* C);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.has */
extern T1 T564f3(T0* C, T0* a1);
/* GEANT_STRING_INTERPRETER.default_variable_value */
extern T0* T258f4(T0* C, T0* a1);
/* UC_UTF8_STRING.old_is_empty */
extern T1 T206f50(T0* C);
/* STRING_8.is_empty */
extern T1 T17f30(T0* C);
/* KL_STRING_ROUTINES.append_substring_to_string */
extern void T76f20(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* KL_STRING_ROUTINES.new_empty_string */
extern T0* T76f3(T0* C, T0* a1, T6 a2);
/* UC_UTF8_STRING.old_wipe_out */
extern void T206f75(T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T206f78(T0* C);
/* UC_UTF8_STRING.wipe_out */
extern void T206f75p1(T0* C);
/* STRING_8.wipe_out */
extern void T17f38(T0* C);
/* GEANT_STRING_INTERPRETER.string_ */
extern T0* T258f2(T0* C);
/* UC_UTF8_STRING.out */
extern T0* T206f17(T0* C);
/* UC_UTF8_STRING.unicode */
extern unsigned char ge273os4815;
extern T0* ge273ov4815;
extern T0* T206f32(T0* C);
/* UC_UNICODE_ROUTINES.default_create */
extern T0* T322c31(void);
/* STRING_8.out */
extern T0* T17f4(T0* C);
/* XM_ELEMENT.attribute_by_name */
extern T0* T98f8(T0* C, T0* a1);
/* XM_ELEMENT.attribute_same_name */
extern T1 T98f10(T0* C, T0* a1, T0* a2);
/* XM_NODE_TYPER.is_attribute */
extern T1 T363f9(T0* C);
/* GEANT_STRING_INTERPRETER.set_variable_resolver */
extern void T258f8(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLE_RESOLVER.set_variables */
extern void T58f17(T0* C, T0* a1);
/* GEANT_TARGET.project_variables_resolver */
extern T0* T26f33(T0* C);
/* GEANT_STRING_INTERPRETER.make */
extern T0* T258c7(void);
/* XM_ELEMENT.has_attribute_by_name */
extern T1 T98f21(T0* C, T0* a1);
/* GEANT_TARGET.dir_attribute_name */
extern T0* T26f48(T0* C);
/* GEANT_PROJECT.log */
extern void T22f50(T0* C, T0* a1);
/* KL_STDOUT_FILE.flush */
extern void T68f19(T0* C);
/* KL_STDOUT_FILE.old_flush */
extern void T68f20(T0* C);
/* KL_STDOUT_FILE.file_flush */
extern void T68f21(T0* C, T14 a1);
/* KL_STDOUT_FILE.put_new_line */
extern void T68f14(T0* C);
/* KL_STDOUT_FILE.put_string */
extern void T68f13(T0* C, T0* a1);
/* KL_STDOUT_FILE.old_put_string */
extern void T68f17(T0* C, T0* a1);
/* KL_STDOUT_FILE.console_ps */
extern void T68f18(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_STDOUT_FILE.string_ */
extern T0* T68f6(T0* C);
/* GEANT_PROJECT.target_name */
extern T0* T22f24(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].forth */
extern void T128f10(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_forth */
extern void T31f69(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].add_traversing_cursor */
extern void T31f74(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].set_next_cursor */
extern void T128f15(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].remove_traversing_cursor */
extern void T31f73(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].set_position */
extern void T128f14(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].clashes_item */
extern T6 T31f21(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].go_after */
extern void T128f13(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_go_after */
extern void T31f79(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_off */
extern T1 T31f43(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].key */
extern T0* T128f7(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_key */
extern T0* T31f38(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].key_storage_item */
extern T0* T31f35(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].item */
extern T0* T128f6(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_item */
extern T0* T31f37(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item_storage_item */
extern T0* T31f27(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].after */
extern T1 T128f5(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_after */
extern T1 T31f36(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].start */
extern void T128f9(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_start */
extern void T31f68(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].is_empty */
extern T1 T31f42(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].new_cursor */
extern T0* T31f29(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].make */
extern T0* T128c8(T0* a1);
/* GEANT_TARGET.is_enabled */
extern T1 T26f47(T0* C);
/* GEANT_TARGET.unless_attribute_name */
extern T0* T26f57(T0* C);
/* GEANT_TARGET.if_attribute_name */
extern T0* T26f56(T0* C);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].force */
extern void T105f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].resize */
extern void T105f11(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_VARIABLES].resize */
extern T0* T184f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_VARIABLES].aliased_resized_area */
extern T0* T183f3(T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].new_capacity */
extern T6 T105f7(T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_VARIABLES].extendible */
extern T1 T105f6(T0* C, T6 a1);
/* GEANT_VARIABLES.make */
extern T0* T29c48(void);
/* GEANT_VARIABLES.set_key_equality_tester */
extern void T29f52(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].internal_set_equality_tester */
extern void T61f6(T0* C, T0* a1);
/* GEANT_VARIABLES.make_map */
extern void T29f51(T0* C, T6 a1);
/* GEANT_VARIABLES.make_with_equality_testers */
extern void T29f60(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].make */
extern T0* T61c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].new_cursor */
extern T0* T61f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8].make */
extern T0* T106c3(T0* a1);
/* GEANT_VARIABLES.make_sparse_container */
extern void T29f65(T0* C, T6 a1);
/* GEANT_VARIABLES.unset_found_item */
extern void T29f53(T0* C);
/* GEANT_VARIABLES.make_slots */
extern void T29f69(T0* C, T6 a1);
/* GEANT_VARIABLES.special_integer_ */
extern T0* T29f26(T0* C);
/* GEANT_VARIABLES.new_modulus */
extern T6 T29f33(T0* C, T6 a1);
/* GEANT_VARIABLES.make_clashes */
extern void T29f68(T0* C, T6 a1);
/* GEANT_VARIABLES.make_key_storage */
extern void T29f67(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].make */
extern T0* T66f2(T0* C, T6 a1);
/* TO_SPECIAL [STRING_8].make_area */
extern T0* T108c2(T6 a1);
/* SPECIAL [STRING_8].make */
extern T0* T32c5(T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].default_create */
extern T0* T66c3(void);
/* GEANT_VARIABLES.make_item_storage */
extern void T29f66(T0* C, T6 a1);
/* GEANT_PROJECT.target_locals_stack */
extern T0* T22f23(T0* C);
/* GEANT_TARGET.final_target */
extern T0* T26f37(T0* C);
/* GEANT_PROJECT.current_target */
extern T0* T22f22(T0* C);
/* DS_ARRAYED_STACK [GEANT_TARGET].is_empty */
extern T1 T190f5(T0* C);
/* GEANT_PROJECT.trace_debug */
extern void T22f39(T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].item */
extern T0* T190f6(T0* C);
/* GEANT_ARGUMENT_VARIABLES.make */
extern T0* T34c48(void);
/* GEANT_ARGUMENT_VARIABLES.set_key_equality_tester */
extern void T34f51(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.make_map */
extern void T34f50(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_with_equality_testers */
extern void T34f59(T0* C, T6 a1, T0* a2, T0* a3);
/* GEANT_ARGUMENT_VARIABLES.make_sparse_container */
extern void T34f64(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.unset_found_item */
extern void T34f52(T0* C);
/* GEANT_ARGUMENT_VARIABLES.make_slots */
extern void T34f68(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.special_integer_ */
extern T0* T34f26(T0* C);
/* GEANT_ARGUMENT_VARIABLES.new_modulus */
extern T6 T34f31(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_clashes */
extern void T34f67(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_key_storage */
extern void T34f66(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.make_item_storage */
extern void T34f65(T0* C, T6 a1);
/* GEANT_PROJECT.calculate_depend_order */
extern void T22f48(T0* C, T0* a1);
/* GEANT_TARGET.dependent_targets */
extern T0* T26f41(T0* C);
/* DS_ARRAYED_LIST [STRING_8].item */
extern T0* T71f14(T0* C, T6 a1);
/* GEANT_TARGET.show_dependent_targets */
extern void T26f78(T0* C, T0* a1);
/* KL_STDOUT_FILE.put_line */
extern void T68f11(T0* C, T0* a1);
/* KL_STANDARD_FILES.output */
extern unsigned char ge229os2998;
extern T0* ge229ov2998;
extern T0* T46f2(T0* C);
/* KL_STDOUT_FILE.make */
extern T0* T68c9(void);
/* KL_STDOUT_FILE.make_open_stdout */
extern void T68f12(T0* C, T0* a1);
/* KL_STDOUT_FILE.set_write_mode */
extern void T68f16(T0* C);
/* KL_STDOUT_FILE.console_def */
extern T14 T68f5(T0* C, T6 a1);
/* KL_STDOUT_FILE.old_make */
extern void T68f15(T0* C, T0* a1);
/* GEANT_TARGET.string_tokens */
extern T0* T26f25(T0* C, T0* a1, T2 a2);
/* DS_ARRAYED_LIST [STRING_8].force_last */
extern void T71f27(T0* C, T0* a1);
/* DS_ARRAYED_LIST [STRING_8].resize */
extern void T71f28(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [STRING_8].resize */
extern T0* T66f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [STRING_8].aliased_resized_area */
extern T0* T32f3(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].new_capacity */
extern T6 T71f19(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].extendible */
extern T1 T71f18(T0* C, T6 a1);
/* UC_UTF8_STRING.index_of */
extern T6 T206f18(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.index_of_item_code */
extern T6 T206f33(T0* C, T6 a1, T6 a2);
/* STRING_8.index_of */
extern T6 T17f26(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.keep_head */
extern void T206f74(T0* C, T6 a1);
/* STRING_8.keep_head */
extern void T17f48(T0* C, T6 a1);
/* UC_UTF8_STRING.keep_tail */
extern void T206f76(T0* C, T6 a1);
/* UC_UTF8_STRING.move_bytes_left */
extern void T206f79(T0* C, T6 a1, T6 a2);
/* STRING_8.keep_tail */
extern void T17f47(T0* C, T6 a1);
/* DS_ARRAYED_LIST [STRING_8].make */
extern T0* T71c23(T6 a1);
/* DS_ARRAYED_LIST [STRING_8].new_cursor */
extern T0* T71f9(T0* C);
/* DS_ARRAYED_LIST_CURSOR [STRING_8].make */
extern T0* T72c7(T0* a1);
/* GEANT_TARGET.dependencies */
extern T0* T26f45(T0* C);
/* GEANT_TARGET.depend_attribute_name */
extern unsigned char ge60os2411;
extern T0* ge60ov2411;
extern T0* T26f46(T0* C);
/* GEANT_TARGET.has_dependencies */
extern T1 T26f44(T0* C);
/* DS_ARRAYED_STACK [GEANT_TARGET].force */
extern void T190f10(T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].resize */
extern void T190f12(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].resize */
extern T0* T129f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_TARGET].aliased_resized_area */
extern T0* T124f3(T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].new_capacity */
extern T6 T190f8(T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].extendible */
extern T1 T190f7(T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_TARGET].make */
extern T0* T190c9(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].make */
extern T0* T129f2(T0* C, T6 a1);
/* TO_SPECIAL [GEANT_TARGET].make_area */
extern T0* T218c2(T6 a1);
/* SPECIAL [GEANT_TARGET].make */
extern T0* T124c4(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_TARGET].default_create */
extern T0* T129c3(void);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].force */
extern void T104f9(T0* C, T0* a1);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].resize */
extern void T104f11(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_ARGUMENT_VARIABLES].resize */
extern T0* T182f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_ARGUMENT_VARIABLES].aliased_resized_area */
extern T0* T181f3(T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].new_capacity */
extern T6 T104f7(T0* C, T6 a1);
/* DS_ARRAYED_STACK [GEANT_ARGUMENT_VARIABLES].extendible */
extern T1 T104f6(T0* C, T6 a1);
/* GEANT_PROJECT.target_arguments_stack */
extern T0* T22f21(T0* C);
/* GEANT_PROJECT.trace */
extern void T22f31(T0* C, T0* a1);
/* GEANT.commandline_arguments */
extern unsigned char ge58os1772;
extern T0* ge58ov1772;
extern T0* T21f11(T0* C);
/* GEANT_PROJECT.start_target */
extern T0* T22f17(T0* C);
/* GEANT_PROJECT.exit_application */
extern void T22f43(T0* C, T6 a1, T0* a2);
/* GEANT_PROJECT.exceptions */
extern T0* T22f20(T0* C);
/* GEANT_PROJECT.std */
extern T0* T22f18(T0* C);
/* GEANT_PROJECT.log_messages */
extern void T22f47(T0* C, T0* a1);
/* GEANT_PROJECT.preferred_start_target */
extern T0* T22f19(T0* C);
/* GEANT_PROJECT.default_target */
extern T0* T22f16(T0* C);
/* GEANT_PROJECT.show_target_info */
extern void T22f34(T0* C);
/* GEANT_PROJECT.set_start_target_name */
extern void T22f33(T0* C, T0* a1);
/* GEANT_TARGET.full_name */
extern T0* T26f34(T0* C);
/* GEANT_TARGET.is_exported_to_any */
extern T1 T26f35(T0* C);
/* DS_ARRAYED_LIST [STRING_8].has */
extern T1 T71f22(T0* C, T0* a1);
/* GEANT_TARGET.project_name_any */
extern unsigned char ge60os2414;
extern T0* ge60ov2414;
extern T0* T26f26(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item */
extern T0* T31f34(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].search_position */
extern void T31f51(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].hash_position */
extern T6 T31f24(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].slots_item */
extern T6 T31f26(T0* C, T6 a1);
/* GEANT.exit_application */
extern void T21f22(T0* C, T6 a1, T0* a2);
/* GEANT.exceptions */
extern T0* T21f14(T0* C);
/* GEANT.std */
extern T0* T21f13(T0* C);
/* GEANT.log_messages */
extern void T21f28(T0* C, T0* a1);
/* UC_UTF8_STRING.infix "+" */
extern T0* T206f7(T0* C, T0* a1);
/* STRING_8.infix "+" */
extern T0* T17f8(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].has */
extern T1 T31f33(T0* C, T0* a1);
/* INTEGER_32.infix ">" */
extern T1 T6f1(T6* C, T6 a1);
/* GEANT_PROJECT.merge_in_parent_projects */
extern void T22f32(T0* C);
/* GEANT_TARGET.show_precursors */
extern void T26f77(T0* C);
/* ARRAY [STRING_8].force */
extern void T33f14(T0* C, T0* a1, T6 a2);
/* ARRAY [STRING_8].auto_resize */
extern void T33f15(T0* C, T6 a1, T6 a2);
/* SPECIAL [STRING_8].fill_with_default */
extern void T32f9(T0* C, T6 a1, T6 a2);
/* SPECIAL [STRING_8].put_default */
extern void T32f7(T0* C, T6 a1);
/* SPECIAL [STRING_8].move_data */
extern void T32f8(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].overlapping_move */
extern void T32f11(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [STRING_8].non_overlapping_move */
extern void T32f10(T0* C, T6 a1, T6 a2, T6 a3);
/* ARRAY [STRING_8].capacity */
extern T6 T33f8(T0* C);
/* ARRAY [STRING_8].make_area */
extern void T33f13(T0* C, T6 a1);
/* ARRAY [STRING_8].additional_space */
extern T6 T33f7(T0* C);
/* INTEGER_32.min */
extern T6 T6f20(T6* C, T6 a1);
/* ARRAY [STRING_8].empty_area */
extern T1 T33f6(T0* C);
/* ARRAY [STRING_8].count */
extern T6 T33f10(T0* C);
/* ARRAY [STRING_8].put */
extern void T33f12(T0* C, T0* a1, T6 a2);
/* ARRAY [STRING_8].make */
extern T0* T33c11(T6 a1, T6 a2);
/* GEANT_INHERIT.apply_selects */
extern void T123f8(T0* C);
/* GEANT_INHERIT.check_targets_for_conflicts */
extern void T123f14(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].back */
extern void T128f12(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_back */
extern void T31f71(T0* C, T0* a1);
/* GEANT_INHERIT.exit_application */
extern void T123f15(T0* C, T6 a1, T0* a2);
/* GEANT_INHERIT.exceptions */
extern T0* T123f5(T0* C);
/* GEANT_INHERIT.std */
extern T0* T123f4(T0* C);
/* GEANT_INHERIT.log_messages */
extern void T123f16(T0* C, T0* a1);
/* GEANT_TARGET.conflicts_with */
extern T1 T26f39(T0* C, T0* a1);
/* GEANT_TARGET.seed */
extern T0* T26f43(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].before */
extern T1 T128f4(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_before */
extern T1 T31f39(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_TARGET, STRING_8].finish */
extern void T128f11(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].cursor_finish */
extern void T31f70(T0* C, T0* a1);
/* GEANT_INHERIT.sort_out_selected_targets */
extern void T123f13(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].remove */
extern void T31f67(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].remove_position */
extern void T31f72(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].key_storage_put */
extern void T31f57(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item_storage_put */
extern void T31f56(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].clashes_put */
extern void T31f54(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].slots_put */
extern void T31f55(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].move_cursors_forth */
extern void T31f76(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].move_all_cursors */
extern void T31f78(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].move_cursors_after */
extern void T31f77(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].internal_set_key_equality_tester */
extern void T31f75(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_TARGET, STRING_8].internal_set_equality_tester */
extern void T126f6(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].unset_found_item */
extern void T31f52(T0* C);
/* GEANT_TARGET.set_redefining_target */
extern void T26f85(T0* C, T0* a1);
/* GEANT_INHERIT.validate_parent_selects */
extern void T123f12(T0* C);
/* GEANT_INHERIT.merge_in_parent_project */
extern void T123f7(T0* C, T0* a1);
/* GEANT_INHERIT.merge_in_unchanged_targets */
extern void T123f11(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].force_last_new */
extern void T31f49(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].resize */
extern void T31f53(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].clashes_resize */
extern void T31f62(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].resize */
extern T0* T65f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [INTEGER_32].aliased_resized_area */
extern T0* T63f3(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].special_integer_ */
extern T0* T31f30(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].key_storage_resize */
extern void T31f61(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].item_storage_resize */
extern void T31f60(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].slots_resize */
extern void T31f59(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].new_modulus */
extern T6 T31f22(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].new_capacity */
extern T6 T31f32(T0* C, T6 a1);
/* GEANT_INHERIT.string_ */
extern T0* T123f3(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].found_item */
extern T0* T31f28(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].found */
extern T1 T31f31(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].search */
extern void T31f48(T0* C, T0* a1);
/* GEANT_INHERIT.merge_in_renamed_targets */
extern void T123f10(T0* C, T0* a1);
/* GEANT_INHERIT.merge_in_redefined_targets */
extern void T123f9(T0* C, T0* a1);
/* GEANT_TARGET.set_precursor_target */
extern void T26f76(T0* C, T0* a1);
/* GEANT_TARGET.formal_arguments_match */
extern T1 T26f38(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].forth */
extern void T195f9(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_forth */
extern void T194f20(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].set_position */
extern void T195f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].add_traversing_cursor */
extern void T194f21(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].set_next_cursor */
extern void T195f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].remove_traversing_cursor */
extern void T194f22(T0* C, T0* a1);
/* GEANT_PARENT.prepare_project */
extern void T192f14(T0* C);
/* GEANT_PARENT.apply_selects */
extern void T192f19(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].forth */
extern void T484f8(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_forth */
extern void T336f59(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].add_traversing_cursor */
extern void T336f61(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].set_next_cursor */
extern void T484f10(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].remove_traversing_cursor */
extern void T336f60(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].set_position */
extern void T484f9(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].clashes_item */
extern T6 T336f25(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].force_last */
extern void T31f80(T0* C, T0* a1, T0* a2);
/* GEANT_PARENT.exit_application */
extern void T192f20(T0* C, T6 a1, T0* a2);
/* GEANT_PARENT.exceptions */
extern T0* T192f11(T0* C);
/* GEANT_PARENT.std */
extern T0* T192f10(T0* C);
/* GEANT_PARENT.log_messages */
extern void T192f21(T0* C, T0* a1);
/* GEANT_SELECT.is_executable */
extern T1 T335f2(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].item */
extern T0* T484f4(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_item */
extern T0* T336f33(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].item_storage_item */
extern T0* T336f35(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].after */
extern T1 T484f5(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_after */
extern T1 T336f32(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].start */
extern void T484f7(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_start */
extern void T336f58(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].cursor_off */
extern T1 T336f37(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].is_empty */
extern T1 T336f36(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].new_cursor */
extern T0* T336f26(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_SELECT, STRING_8].make */
extern T0* T484c6(T0* a1);
/* GEANT_PARENT.apply_undeclared_redefines */
extern void T192f18(T0* C);
/* GEANT_PARENT.apply_unchangeds */
extern void T192f17(T0* C);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].has_item */
extern T1 T31f45(T0* C, T0* a1);
/* GEANT_PARENT.apply_redefines */
extern void T192f16(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].forth */
extern void T478f8(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_forth */
extern void T334f59(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].add_traversing_cursor */
extern void T334f61(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].set_next_cursor */
extern void T478f10(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].remove_traversing_cursor */
extern void T334f60(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].set_position */
extern void T478f9(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].clashes_item */
extern T6 T334f25(T0* C, T6 a1);
/* GEANT_REDEFINE.is_executable */
extern T1 T333f2(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].item */
extern T0* T478f4(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_item */
extern T0* T334f33(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].item_storage_item */
extern T0* T334f35(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].after */
extern T1 T478f5(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_after */
extern T1 T334f32(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].start */
extern void T478f7(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_start */
extern void T334f58(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].cursor_off */
extern T1 T334f37(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].is_empty */
extern T1 T334f36(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].new_cursor */
extern T0* T334f26(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_REDEFINE, STRING_8].make */
extern T0* T478c6(T0* a1);
/* GEANT_PARENT.apply_renames */
extern void T192f15(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].back */
extern void T472f8(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_back */
extern void T332f60(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].add_traversing_cursor */
extern void T332f62(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].set_next_cursor */
extern void T472f10(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].remove_traversing_cursor */
extern void T332f61(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].set_position */
extern void T472f9(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].clashes_item */
extern T6 T332f26(T0* C, T6 a1);
/* GEANT_RENAME.is_executable */
extern T1 T331f3(T0* C);
/* GEANT_RENAME.string_ */
extern T0* T331f4(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].item */
extern T0* T472f4(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_item */
extern T0* T332f34(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].item_storage_item */
extern T0* T332f35(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].before */
extern T1 T472f5(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_before */
extern T1 T332f33(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].finish */
extern void T472f7(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_finish */
extern void T332f59(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].cursor_off */
extern T1 T332f37(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].is_empty */
extern T1 T332f36(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].new_cursor */
extern T0* T332f27(T0* C);
/* DS_HASH_TABLE_CURSOR [GEANT_RENAME, STRING_8].make */
extern T0* T472c6(T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].item */
extern T0* T195f4(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_item */
extern T0* T194f10(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].item */
extern T0* T194f12(T0* C, T6 a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].after */
extern T1 T195f6(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_after */
extern T1 T194f9(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].start */
extern void T195f8(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_start */
extern void T194f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].is_empty */
extern T1 T194f13(T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].off */
extern T1 T195f5(T0* C);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_off */
extern T1 T194f14(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].cursor_before */
extern T1 T194f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].new_cursor */
extern T0* T194f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [GEANT_PARENT].make */
extern T0* T195c7(T0* a1);
/* GEANT_PROJECT_LOADER.load */
extern void T23f10(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_LOADER.exit_application */
extern void T23f11(T0* C, T6 a1, T0* a2);
/* GEANT_PROJECT_LOADER.exceptions */
extern T0* T23f6(T0* C);
/* GEANT_PROJECT_LOADER.log_messages */
extern void T23f12(T0* C, T0* a1);
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
extern T0* T86f8(T0* C, T6 a1);
/* KL_PATHNAME.is_parent */
extern T1 T86f7(T0* C, T6 a1);
/* KL_PATHNAME.is_current */
extern T1 T86f11(T0* C, T6 a1);
/* KL_WINDOWS_FILE_SYSTEM.root_directory */
extern unsigned char ge238os3910;
extern T0* ge238ov3910;
extern T0* T53f16(T0* C);
/* KL_UNIX_FILE_SYSTEM.string_to_pathname */
extern T0* T54f5(T0* C, T0* a1);
/* KL_PATHNAME.append_name */
extern void T86f17(T0* C, T0* a1);
/* KL_PATHNAME.append_parent */
extern void T86f16(T0* C);
/* KL_PATHNAME.append_current */
extern void T86f15(T0* C);
/* KL_PATHNAME.set_relative */
extern void T86f14(T0* C, T1 a1);
/* KL_PATHNAME.make */
extern T0* T86c13(void);
/* KL_WINDOWS_FILE_SYSTEM.any_ */
extern T0* T53f6(T0* C);
/* KL_UNIX_FILE_SYSTEM.pathname_from_file_system */
extern T0* T54f3(T0* C, T0* a1, T0* a2);
/* KL_UNIX_FILE_SYSTEM.pathname_to_string */
extern T0* T54f8(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.root_directory */
extern unsigned char ge235os3910;
extern T0* ge235ov3910;
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
/* KL_STDERR_FILE.put_character */
extern void T47f19(T0* C, T2 a1);
/* KL_STDERR_FILE.old_put_character */
extern void T47f20(T0* C, T2 a1);
/* KL_STDERR_FILE.console_pc */
extern void T47f21(T0* C, T14 a1, T2 a2);
/* GEANT_PROJECT_LOADER.std */
extern T0* T23f5(T0* C);
/* KL_TEXT_INPUT_FILE.close */
extern void T55f59(T0* C);
/* KL_TEXT_INPUT_FILE.old_close */
extern void T55f63(T0* C);
/* KL_TEXT_INPUT_FILE.file_close */
extern void T55f65(T0* C, T14 a1);
/* GEANT_PROJECT_PARSER.parse_file */
extern void T56f9(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.last_error_extended_description */
extern T0* T92f89(T0* C);
/* XM_EIFFEL_PARSER.string_ */
extern T0* T92f85(T0* C);
/* XM_EIFFEL_PARSER.last_error_description */
extern T0* T92f177(T0* C);
/* XM_EIFFEL_PARSER.safe_error_component */
extern T0* T92f170(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_safe_error_character */
extern T1 T92f109(T0* C, T2 a1);
/* CHARACTER_8.infix ">=" */
extern T1 T2f4(T2* C, T2 a1);
/* XM_EIFFEL_PARSER.position */
extern T0* T92f137(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].first */
extern T0* T135f6(T0* C);
/* XM_EIFFEL_PARSER.positions */
extern T0* T92f91(T0* C);
/* XM_EIFFEL_PARSER.new_positions */
extern T0* T92f135(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].remove */
extern void T136f7(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].item */
extern T0* T136f4(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].is_empty */
extern T1 T136f3(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].force_last */
extern void T135f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].put_right */
extern void T225f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].attach_left */
extern void T225f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_POSITION].make */
extern T0* T225c4(T0* a1);
/* DS_BILINKED_LIST [XM_POSITION].is_empty */
extern T1 T135f5(T0* C);
/* DS_BILINKED_LIST [XM_POSITION].make */
extern T0* T135c8(void);
/* DS_BILINKED_LIST [XM_POSITION].new_cursor */
extern T0* T135f7(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_POSITION].make */
extern T0* T226c3(T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].copy */
extern void T136f6(T0* C, T0* a1);
/* DS_LINKABLE [XM_EIFFEL_SCANNER].put_right */
extern void T227f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_EIFFEL_SCANNER].make */
extern T0* T227c3(T0* a1);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].make */
extern T0* T136c5(void);
/* KL_STDERR_FILE.flush */
extern void T47f22(T0* C);
/* KL_STDERR_FILE.old_flush */
extern void T47f23(T0* C);
/* KL_STDERR_FILE.file_flush */
extern void T47f24(T0* C, T14 a1);
/* XM_TREE_CALLBACKS_PIPE.last_error */
extern T0* T93f5(T0* C);
/* GEANT_PROJECT_PARSER.std */
extern T0* T56f7(T0* C);
/* GEANT_PROJECT.set_position_table */
extern void T22f36(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.make */
extern T0* T30c20(T0* a1, T0* a2, T0* a3, T0* a4);
/* GEANT_PROJECT_ELEMENT.load_parent_projects */
extern void T30f23(T0* C);
/* GEANT_INHERIT_ELEMENT.make */
extern T0* T122c11(T0* a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.exit_application */
extern void T122f13(T0* C, T6 a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.exceptions */
extern T0* T122f8(T0* C);
/* GEANT_INHERIT_ELEMENT.std */
extern T0* T122f7(T0* C);
/* GEANT_INHERIT_ELEMENT.log_messages */
extern void T122f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].force_last */
extern void T194f17(T0* C, T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].resize */
extern void T194f18(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].resize */
extern T0* T320f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_PARENT].aliased_resized_area */
extern T0* T321f2(T0* C, T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].new_capacity */
extern T6 T194f8(T0* C, T6 a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].extendible */
extern T1 T194f6(T0* C, T6 a1);
/* GEANT_PARENT.is_executable */
extern T1 T192f9(T0* C);
/* GEANT_PARENT_ELEMENT.make */
extern T0* T215c18(T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].force_last */
extern void T336f39(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].key_storage_put */
extern void T336f48(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].slots_put */
extern void T336f47(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].clashes_put */
extern void T336f46(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].slots_item */
extern T6 T336f21(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].hash_position */
extern T6 T336f23(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].resize */
extern void T336f45(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].clashes_resize */
extern void T336f53(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].special_integer_ */
extern T0* T336f27(T0* C);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].key_storage_resize */
extern void T336f52(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].item_storage_resize */
extern void T336f51(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].resize */
extern T0* T485f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_SELECT].aliased_resized_area */
extern T0* T483f2(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].key_storage_item */
extern T0* T336f24(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].slots_resize */
extern void T336f50(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].new_modulus */
extern T6 T336f29(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].new_capacity */
extern T6 T336f22(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].item_storage_put */
extern void T336f44(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].search_position */
extern void T336f43(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].unset_found_item */
extern void T336f42(T0* C);
/* GEANT_SELECT_ELEMENT.make */
extern T0* T330c9(T0* a1, T0* a2);
/* GEANT_SELECT.set_name */
extern void T335f4(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.attribute_value */
extern T0* T330f7(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.project_variables_resolver */
extern T0* T330f8(T0* C);
/* GEANT_SELECT_ELEMENT.has_attribute */
extern T1 T330f6(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.target_attribute_name */
extern unsigned char ge148os8846;
extern T0* ge148ov8846;
extern T0* T330f5(T0* C);
/* GEANT_SELECT.make */
extern T0* T335c3(void);
/* GEANT_SELECT_ELEMENT.interpreting_element_make */
extern void T330f10(T0* C, T0* a1, T0* a2);
/* GEANT_SELECT_ELEMENT.set_project */
extern void T330f12(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.element_make */
extern void T330f11(T0* C, T0* a1);
/* GEANT_SELECT_ELEMENT.set_xml_element */
extern void T330f13(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.select_element_name */
extern unsigned char ge140os7803;
extern T0* ge140ov7803;
extern T0* T215f10(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].force_last */
extern void T334f39(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].key_storage_put */
extern void T334f48(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].slots_put */
extern void T334f47(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].clashes_put */
extern void T334f46(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].slots_item */
extern T6 T334f21(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].hash_position */
extern T6 T334f23(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].resize */
extern void T334f45(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].clashes_resize */
extern void T334f53(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].special_integer_ */
extern T0* T334f27(T0* C);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].key_storage_resize */
extern void T334f52(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].item_storage_resize */
extern void T334f51(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].resize */
extern T0* T479f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_REDEFINE].aliased_resized_area */
extern T0* T477f2(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].key_storage_item */
extern T0* T334f24(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].slots_resize */
extern void T334f50(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].new_modulus */
extern T6 T334f29(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].new_capacity */
extern T6 T334f22(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].item_storage_put */
extern void T334f44(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].search_position */
extern void T334f43(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].unset_found_item */
extern void T334f42(T0* C);
/* GEANT_REDEFINE_ELEMENT.make */
extern T0* T329c9(T0* a1, T0* a2);
/* GEANT_REDEFINE.set_name */
extern void T333f4(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.attribute_value */
extern T0* T329f7(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.project_variables_resolver */
extern T0* T329f8(T0* C);
/* GEANT_REDEFINE_ELEMENT.has_attribute */
extern T1 T329f6(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.target_attribute_name */
extern unsigned char ge144os8842;
extern T0* ge144ov8842;
extern T0* T329f5(T0* C);
/* GEANT_REDEFINE.make */
extern T0* T333c3(void);
/* GEANT_REDEFINE_ELEMENT.interpreting_element_make */
extern void T329f10(T0* C, T0* a1, T0* a2);
/* GEANT_REDEFINE_ELEMENT.set_project */
extern void T329f12(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.element_make */
extern void T329f11(T0* C, T0* a1);
/* GEANT_REDEFINE_ELEMENT.set_xml_element */
extern void T329f13(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.redefine_element_name */
extern unsigned char ge140os7802;
extern T0* ge140ov7802;
extern T0* T215f9(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].force_last */
extern void T332f40(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].key_storage_put */
extern void T332f49(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].slots_put */
extern void T332f48(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].clashes_put */
extern void T332f47(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].slots_item */
extern T6 T332f24(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].hash_position */
extern T6 T332f22(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].resize */
extern void T332f46(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].clashes_resize */
extern void T332f54(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].special_integer_ */
extern T0* T332f28(T0* C);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].key_storage_resize */
extern void T332f53(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].item_storage_resize */
extern void T332f52(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].resize */
extern T0* T473f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_RENAME].aliased_resized_area */
extern T0* T471f2(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].key_storage_item */
extern T0* T332f25(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].slots_resize */
extern void T332f51(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].new_modulus */
extern T6 T332f31(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].new_capacity */
extern T6 T332f30(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].item_storage_put */
extern void T332f45(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].search_position */
extern void T332f42(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].unset_found_item */
extern void T332f44(T0* C);
/* GEANT_PARENT_ELEMENT.exit_application */
extern void T215f20(T0* C, T6 a1, T0* a2);
/* GEANT_PARENT_ELEMENT.exceptions */
extern T0* T215f14(T0* C);
/* GEANT_PARENT_ELEMENT.std */
extern T0* T215f13(T0* C);
/* GEANT_PARENT_ELEMENT.log_messages */
extern void T215f23(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].has */
extern T1 T332f29(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.make */
extern T0* T328c10(T0* a1, T0* a2);
/* GEANT_RENAME.set_new_name */
extern void T331f7(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.as_attribute_name */
extern unsigned char ge146os8838;
extern T0* ge146ov8838;
extern T0* T328f5(T0* C);
/* GEANT_RENAME.set_original_name */
extern void T331f6(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.attribute_value */
extern T0* T328f8(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.project_variables_resolver */
extern T0* T328f9(T0* C);
/* GEANT_RENAME_ELEMENT.has_attribute */
extern T1 T328f7(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.target_attribute_name */
extern unsigned char ge146os8837;
extern T0* ge146ov8837;
extern T0* T328f6(T0* C);
/* GEANT_RENAME.make */
extern T0* T331c5(void);
/* GEANT_RENAME_ELEMENT.interpreting_element_make */
extern void T328f11(T0* C, T0* a1, T0* a2);
/* GEANT_RENAME_ELEMENT.set_project */
extern void T328f13(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.element_make */
extern void T328f12(T0* C, T0* a1);
/* GEANT_RENAME_ELEMENT.set_xml_element */
extern void T328f14(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.elements_by_name */
extern T0* T215f8(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].force_last */
extern void T120f9(T0* C, T0* a1);
/* DS_LINKABLE [XM_ELEMENT].put_right */
extern void T214f4(T0* C, T0* a1);
/* DS_LINKABLE [XM_ELEMENT].make */
extern T0* T214c3(T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].is_empty */
extern T1 T120f6(T0* C);
/* GEANT_PARENT_ELEMENT.string_ */
extern T0* T215f15(T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].make */
extern T0* T120c8(void);
/* GEANT_PARENT_ELEMENT.rename_element_name */
extern unsigned char ge140os7801;
extern T0* ge140ov7801;
extern T0* T215f7(T0* C);
/* GEANT_PARENT.set_parent_project */
extern void T192f13(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.attribute_value */
extern T0* T215f11(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.project_variables_resolver */
extern T0* T215f16(T0* C);
/* GEANT_PARENT_ELEMENT.has_attribute */
extern T1 T215f6(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.location_attribute_name */
extern unsigned char ge140os7799;
extern T0* ge140ov7799;
extern T0* T215f5(T0* C);
/* GEANT_PARENT.make */
extern T0* T192c12(T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].set_key_equality_tester */
extern void T336f40(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_SELECT, STRING_8].internal_set_equality_tester */
extern void T481f6(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_map_equal */
extern T0* T336c38(T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_with_equality_testers */
extern void T336f41(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [GEANT_SELECT, STRING_8].make */
extern T0* T481c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_SELECT, STRING_8].new_cursor */
extern T0* T481f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_SELECT, STRING_8].make */
extern T0* T532c3(T0* a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_sparse_container */
extern void T336f49(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_slots */
extern void T336f57(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_clashes */
extern void T336f56(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_key_storage */
extern void T336f55(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_SELECT, STRING_8].make_item_storage */
extern void T336f54(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].make */
extern T0* T485f2(T0* C, T6 a1);
/* TO_SPECIAL [GEANT_SELECT].make_area */
extern T0* T533c2(T6 a1);
/* SPECIAL [GEANT_SELECT].make */
extern T0* T483c4(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_SELECT].default_create */
extern T0* T485c3(void);
/* KL_EQUALITY_TESTER [GEANT_SELECT].default_create */
extern T0* T480c1(void);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].set_key_equality_tester */
extern void T334f40(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_REDEFINE, STRING_8].internal_set_equality_tester */
extern void T475f6(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_map_equal */
extern T0* T334c38(T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_with_equality_testers */
extern void T334f41(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [GEANT_REDEFINE, STRING_8].make */
extern T0* T475c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_REDEFINE, STRING_8].new_cursor */
extern T0* T475f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_REDEFINE, STRING_8].make */
extern T0* T530c3(T0* a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_sparse_container */
extern void T334f49(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_slots */
extern void T334f57(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_clashes */
extern void T334f56(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_key_storage */
extern void T334f55(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_REDEFINE, STRING_8].make_item_storage */
extern void T334f54(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].make */
extern T0* T479f2(T0* C, T6 a1);
/* TO_SPECIAL [GEANT_REDEFINE].make_area */
extern T0* T531c2(T6 a1);
/* SPECIAL [GEANT_REDEFINE].make */
extern T0* T477c4(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_REDEFINE].default_create */
extern T0* T479c3(void);
/* KL_EQUALITY_TESTER [GEANT_REDEFINE].default_create */
extern T0* T474c1(void);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].set_key_equality_tester */
extern void T332f41(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_RENAME, STRING_8].internal_set_equality_tester */
extern void T469f6(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_map_equal */
extern T0* T332c39(T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_with_equality_testers */
extern void T332f43(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [GEANT_RENAME, STRING_8].make */
extern T0* T469c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_RENAME, STRING_8].new_cursor */
extern T0* T469f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_RENAME, STRING_8].make */
extern T0* T528c3(T0* a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_sparse_container */
extern void T332f50(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_slots */
extern void T332f58(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_clashes */
extern void T332f57(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_key_storage */
extern void T332f56(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_RENAME, STRING_8].make_item_storage */
extern void T332f55(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].make */
extern T0* T473f2(T0* C, T6 a1);
/* TO_SPECIAL [GEANT_RENAME].make_area */
extern T0* T529c2(T6 a1);
/* SPECIAL [GEANT_RENAME].make */
extern T0* T471c4(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_RENAME].default_create */
extern T0* T473c3(void);
/* KL_EQUALITY_TESTER [GEANT_RENAME].default_create */
extern T0* T468c1(void);
/* GEANT_PARENT_ELEMENT.interpreting_element_make */
extern void T215f19(T0* C, T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.set_project */
extern void T215f22(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.element_make */
extern void T215f21(T0* C, T0* a1);
/* GEANT_PARENT_ELEMENT.set_xml_element */
extern void T215f24(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.elements_by_name */
extern T0* T122f6(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.string_ */
extern T0* T122f9(T0* C);
/* GEANT_INHERIT_ELEMENT.parent_element_name */
extern unsigned char ge133os6367;
extern T0* ge133ov6367;
extern T0* T122f5(T0* C);
/* GEANT_INHERIT.make */
extern T0* T123c6(T0* a1);
/* DS_ARRAYED_LIST [GEANT_PARENT].make */
extern T0* T194c16(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].make */
extern T0* T320f1(T0* C, T6 a1);
/* TO_SPECIAL [GEANT_PARENT].make_area */
extern T0* T464c2(T6 a1);
/* SPECIAL [GEANT_PARENT].make */
extern T0* T321c4(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_PARENT].default_create */
extern T0* T320c3(void);
/* GEANT_INHERIT_ELEMENT.interpreting_element_make */
extern void T122f12(T0* C, T0* a1, T0* a2);
/* GEANT_INHERIT_ELEMENT.set_project */
extern void T122f15(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.element_make */
extern void T122f14(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.set_xml_element */
extern void T122f17(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.inherit_element_name */
extern unsigned char ge141os2589;
extern T0* ge141ov2589;
extern T0* T30f16(T0* C);
/* GEANT_PROJECT.set_inherit_clause */
extern void T22f42(T0* C, T0* a1);
/* GEANT_INHERIT_ELEMENT.make_old */
extern T0* T122c10(T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.make_old */
extern T0* T215c17(T0* a1, T0* a2);
/* GEANT_PARENT_ELEMENT.inherit_attribute_name */
extern unsigned char ge140os7800;
extern T0* ge140ov7800;
extern T0* T215f12(T0* C);
/* GEANT_PROJECT.set_old_inherit */
extern void T22f41(T0* C, T1 a1);
/* GEANT_PROJECT_ELEMENT.has_inherit_element */
extern T1 T30f15(T0* C);
/* GEANT_PROJECT_ELEMENT.inherit_attribute_name */
extern unsigned char ge141os2588;
extern T0* ge141ov2588;
extern T0* T30f14(T0* C);
/* GEANT_PROJECT.set_targets */
extern void T22f40(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].forth */
extern void T121f9(T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_forth */
extern void T120f11(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].add_traversing_cursor */
extern void T120f12(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].set_next_cursor */
extern void T121f11(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].remove_traversing_cursor */
extern void T120f13(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].set */
extern void T121f10(T0* C, T0* a1, T1 a2, T1 a3);
/* GEANT_TARGET.make */
extern T0* T26c63(T0* a1, T0* a2);
/* GEANT_TARGET.initialize */
extern void T26f64(T0* C);
/* GEANT_TARGET.initialize */
extern void T26f64p1(T0* C);
/* GEANT_TARGET.set_description */
extern void T26f72(T0* C, T0* a1);
/* GEANT_GLOBAL_ELEMENT.name */
extern T0* T199f2(T0* C);
/* GEANT_GLOBAL_ELEMENT.attribute_value */
extern T0* T199f5(T0* C, T0* a1);
/* GEANT_GLOBAL_ELEMENT.name_attribute_name */
extern unsigned char ge138os7493;
extern T0* ge138ov7493;
extern T0* T199f3(T0* C);
/* GEANT_GLOBAL_ELEMENT.has_name */
extern T1 T199f6(T0* C);
/* GEANT_GLOBAL_ELEMENT.has_attribute */
extern T1 T199f4(T0* C, T0* a1);
/* GEANT_GLOBAL_ELEMENT.make */
extern T0* T199c7(T0* a1);
/* GEANT_GLOBAL_ELEMENT.set_xml_element */
extern void T199f8(T0* C, T0* a1);
/* GEANT_LOCAL_ELEMENT.name */
extern T0* T198f2(T0* C);
/* GEANT_LOCAL_ELEMENT.attribute_value */
extern T0* T198f5(T0* C, T0* a1);
/* GEANT_LOCAL_ELEMENT.name_attribute_name */
extern T0* T198f3(T0* C);
/* GEANT_LOCAL_ELEMENT.has_name */
extern T1 T198f6(T0* C);
/* GEANT_LOCAL_ELEMENT.has_attribute */
extern T1 T198f4(T0* C, T0* a1);
/* GEANT_LOCAL_ELEMENT.make */
extern T0* T198c7(T0* a1);
/* GEANT_LOCAL_ELEMENT.set_xml_element */
extern void T198f8(T0* C, T0* a1);
/* GEANT_TARGET.empty_variables */
extern unsigned char ge58os1773;
extern T0* ge58ov1773;
extern T0* T26f18(T0* C);
/* GEANT_ARGUMENT_ELEMENT.name */
extern T0* T197f2(T0* C);
/* GEANT_ARGUMENT_ELEMENT.attribute_value */
extern T0* T197f5(T0* C, T0* a1);
/* GEANT_ARGUMENT_ELEMENT.name_attribute_name */
extern T0* T197f3(T0* C);
/* GEANT_ARGUMENT_ELEMENT.has_name */
extern T1 T197f6(T0* C);
/* GEANT_ARGUMENT_ELEMENT.has_attribute */
extern T1 T197f4(T0* C, T0* a1);
/* GEANT_ARGUMENT_ELEMENT.make */
extern T0* T197c7(T0* a1);
/* GEANT_ARGUMENT_ELEMENT.set_xml_element */
extern void T197f8(T0* C, T0* a1);
/* GEANT_TARGET.elements_by_name */
extern T0* T26f16(T0* C, T0* a1);
/* GEANT_TARGET.empty_argument_variables */
extern unsigned char ge58os1774;
extern T0* ge58ov1774;
extern T0* T26f42(T0* C);
/* GEANT_TARGET.set_execute_once */
extern void T26f71(T0* C, T1 a1);
/* GEANT_TARGET.boolean_value */
extern T1 T26f36(T0* C, T0* a1);
/* GEANT_TARGET.false_attribute_value */
extern unsigned char ge126os2459;
extern T0* ge126ov2459;
extern T0* T26f32(T0* C);
/* GEANT_TARGET.true_attribute_value */
extern unsigned char ge126os2458;
extern T0* ge126ov2458;
extern T0* T26f31(T0* C);
/* GEANT_TARGET.attribute_value */
extern T0* T26f29(T0* C, T0* a1);
/* GEANT_TARGET.once_attribute_name */
extern unsigned char ge60os2413;
extern T0* ge60ov2413;
extern T0* T26f27(T0* C);
/* GEANT_TARGET.set_exports */
extern void T26f70(T0* C, T0* a1);
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
extern unsigned char ge60os2412;
extern T0* ge60ov2412;
extern T0* T26f20(T0* C);
/* GEANT_TARGET.set_obsolete_message */
extern void T26f69(T0* C, T0* a1);
/* GEANT_TARGET.set_name */
extern void T26f68(T0* C, T0* a1);
/* GEANT_TARGET.name_attribute_name */
extern unsigned char ge60os2409;
extern T0* ge60ov2409;
extern T0* T26f40(T0* C);
/* GEANT_TARGET.make */
extern void T26f63p1(T0* C, T0* a1, T0* a2);
/* GEANT_TARGET.set_project */
extern void T26f66(T0* C, T0* a1);
/* GEANT_TARGET.element_make */
extern void T26f65(T0* C, T0* a1);
/* GEANT_TARGET.set_xml_element */
extern void T26f73(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].item */
extern T0* T121f6(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].start */
extern void T121f8(T0* C);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_start */
extern void T120f10(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].cursor_off */
extern T1 T120f7(T0* C, T0* a1);
/* DS_LINKED_LIST [XM_ELEMENT].new_cursor */
extern T0* T120f5(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_ELEMENT].make */
extern T0* T121c7(T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].set_key_equality_tester */
extern void T31f47(T0* C, T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_map */
extern T0* T31c46(T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_with_equality_testers */
extern void T31f50(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [GEANT_TARGET, STRING_8].make */
extern T0* T126c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [GEANT_TARGET, STRING_8].new_cursor */
extern T0* T126f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [GEANT_TARGET, STRING_8].make */
extern T0* T217c3(T0* a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_sparse_container */
extern void T31f58(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_slots */
extern void T31f66(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_clashes */
extern void T31f65(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_key_storage */
extern void T31f64(T0* C, T6 a1);
/* DS_HASH_TABLE [GEANT_TARGET, STRING_8].make_item_storage */
extern void T31f63(T0* C, T6 a1);
/* GEANT_PROJECT_ELEMENT.elements_by_name */
extern T0* T30f11(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.string_ */
extern T0* T30f19(T0* C);
/* GEANT_PROJECT_ELEMENT.target_element_name */
extern unsigned char ge141os2591;
extern T0* ge141ov2591;
extern T0* T30f10(T0* C);
/* GEANT_PROJECT.set_default_target_name */
extern void T22f38(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.default_attribute_name */
extern unsigned char ge141os2587;
extern T0* ge141ov2587;
extern T0* T30f9(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.basename */
extern T0* T53f24(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_root_directory */
extern T1 T53f25(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.basename */
extern T0* T54f21(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.is_root_directory */
extern T1 T54f22(T0* C, T0* a1);
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
extern void T22f37(T0* C, T0* a1);
/* XM_ELEMENT.has_element_by_name */
extern T1 T98f15(T0* C, T0* a1);
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
/* GEANT_PROJECT_ELEMENT.log_messages */
extern void T30f25(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.has_attribute */
extern T1 T30f3(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.name_attribute_name */
extern unsigned char ge141os2586;
extern T0* ge141ov2586;
extern T0* T30f5(T0* C);
/* GEANT_PROJECT.make */
extern T0* T22c30(T0* a1, T0* a2, T0* a3);
/* GEANT_TASK_FACTORY.make */
extern T0* T191c55(T0* a1);
/* GEANT_TASK_FACTORY.create_builders */
extern void T191f56(T0* C);
/* Creation of agent #1 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac1(T0* a1);
/* Creation of agent #2 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac2(T0* a1);
/* Creation of agent #3 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac3(T0* a1);
/* Creation of agent #4 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac4(T0* a1);
/* Creation of agent #5 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac5(T0* a1);
/* Creation of agent #6 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac6(T0* a1);
/* Creation of agent #7 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac7(T0* a1);
/* Creation of agent #8 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac8(T0* a1);
/* Creation of agent #9 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac9(T0* a1);
/* Creation of agent #10 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac10(T0* a1);
/* Creation of agent #11 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac11(T0* a1);
/* Creation of agent #12 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac12(T0* a1);
/* Creation of agent #13 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac13(T0* a1);
/* Creation of agent #14 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac14(T0* a1);
/* Creation of agent #15 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac15(T0* a1);
/* Creation of agent #16 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac16(T0* a1);
/* Creation of agent #17 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac17(T0* a1);
/* Creation of agent #18 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac18(T0* a1);
/* Creation of agent #19 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac19(T0* a1);
/* Creation of agent #20 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac20(T0* a1);
/* Creation of agent #21 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac21(T0* a1);
/* Creation of agent #22 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac22(T0* a1);
/* Creation of agent #23 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac23(T0* a1);
/* Creation of agent #24 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac24(T0* a1);
/* Creation of agent #25 in feature GEANT_TASK_FACTORY.create_builders */
extern T0* T191f56ac25(T0* a1);
/* GEANT_TASK_FACTORY.new_replace_task */
extern T0* T191f52(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.make */
extern T0* T318c31(T0* a1, T0* a2);
/* GEANT_REPLACE_COMMAND.set_fileset */
extern void T461f38(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.make */
extern T0* T383c29(T0* a1, T0* a2);
/* GEANT_FILESET.set_map */
extern void T389f47(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.make */
extern T0* T498c12(T0* a1, T0* a2);
/* GEANT_MAP.set_map */
extern void T499f21(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.map_element_name */
extern unsigned char ge137os9326;
extern T0* ge137ov9326;
extern T0* T498f9(T0* C);
/* GEANT_MAP.set_target_pattern */
extern void T499f20(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.to_attribute_name */
extern unsigned char ge137os9325;
extern T0* ge137ov9325;
extern T0* T498f7(T0* C);
/* GEANT_MAP.set_source_pattern */
extern void T499f19(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.from_attribute_name */
extern unsigned char ge137os9324;
extern T0* ge137ov9324;
extern T0* T498f6(T0* C);
/* GEANT_MAP.set_type */
extern void T499f18(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.attribute_value */
extern T0* T498f5(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.project_variables_resolver */
extern T0* T498f11(T0* C);
/* GEANT_MAP_ELEMENT.has_attribute */
extern T1 T498f10(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.type_attribute_name */
extern unsigned char ge137os9323;
extern T0* ge137ov9323;
extern T0* T498f8(T0* C);
/* GEANT_MAP.make */
extern T0* T499c17(T0* a1);
/* GEANT_MAP.type_attribute_value_identity */
extern unsigned char ge136os9339;
extern T0* ge136ov9339;
extern T0* T499f6(T0* C);
/* GEANT_MAP_ELEMENT.make */
extern void T498f12p1(T0* C, T0* a1, T0* a2);
/* GEANT_MAP_ELEMENT.set_project */
extern void T498f14(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.element_make */
extern void T498f13(T0* C, T0* a1);
/* GEANT_MAP_ELEMENT.set_xml_element */
extern void T498f15(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.map_element_name */
extern unsigned char ge129os9010;
extern T0* ge129ov9010;
extern T0* T383f21(T0* C);
/* GEANT_FILESET.add_single_exclude */
extern void T389f46(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].force_last */
extern void T504f37(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].slots_put */
extern void T504f47(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING_8].clashes_put */
extern void T504f46(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [STRING_8].slots_item */
extern T6 T504f21(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].hash_position */
extern T6 T504f18(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].resize */
extern void T504f45(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].clashes_resize */
extern void T504f51(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].special_integer_ */
extern T0* T504f19(T0* C);
/* DS_HASH_SET [STRING_8].key_storage_resize */
extern void T504f50(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_resize */
extern void T504f49(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].key_storage_item */
extern T0* T504f24(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_item */
extern T0* T504f28(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].clashes_item */
extern T6 T504f25(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].slots_resize */
extern void T504f48(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].new_modulus */
extern T6 T504f27(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].new_capacity */
extern T6 T504f17(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].item_storage_put */
extern void T504f44(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [STRING_8].search_position */
extern void T504f43(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].key_equality_tester */
extern T0* T504f23(T0* C);
/* DS_HASH_SET [STRING_8].unset_found_item */
extern void T504f42(T0* C);
/* GEANT_FILESET_ELEMENT.exclude_element_name */
extern unsigned char ge129os9009;
extern T0* ge129ov9009;
extern T0* T383f19(T0* C);
/* GEANT_FILESET.add_single_include */
extern void T389f45(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.name */
extern T0* T401f4(T0* C);
/* GEANT_DEFINE_ELEMENT.attribute_value */
extern T0* T401f14(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.project_variables_resolver */
extern T0* T401f6(T0* C);
/* GEANT_DEFINE_ELEMENT.name_attribute_name */
extern T0* T401f13(T0* C);
/* GEANT_DEFINE_ELEMENT.has_name */
extern T1 T401f10(T0* C);
/* GEANT_DEFINE_ELEMENT.has_attribute */
extern T1 T401f9(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.is_enabled */
extern T1 T401f7(T0* C);
/* GEANT_DEFINE_ELEMENT.unless_attribute_name */
extern T0* T401f11(T0* C);
/* GEANT_DEFINE_ELEMENT.if_attribute_name */
extern T0* T401f8(T0* C);
/* GEANT_DEFINE_ELEMENT.make */
extern T0* T401c16(T0* a1, T0* a2);
/* GEANT_DEFINE_ELEMENT.set_project */
extern void T401f18(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.element_make */
extern void T401f17(T0* C, T0* a1);
/* GEANT_DEFINE_ELEMENT.set_xml_element */
extern void T401f19(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.elements_by_name */
extern T0* T383f18(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.string_ */
extern T0* T383f26(T0* C);
/* GEANT_FILESET_ELEMENT.include_element_name */
extern unsigned char ge129os9008;
extern T0* ge129ov9008;
extern T0* T383f17(T0* C);
/* GEANT_FILESET.set_convert_to_filesystem */
extern void T389f44(T0* C, T1 a1);
/* GEANT_FILESET_ELEMENT.convert_attribute_name */
extern unsigned char ge129os9006;
extern T0* ge129ov9006;
extern T0* T383f16(T0* C);
/* GEANT_FILESET.set_mapped_filename_directory_name */
extern void T389f43(T0* C, T0* a1);
/* GEANT_FILESET.set_filename_directory_name */
extern void T389f42(T0* C, T0* a1);
/* GEANT_FILESET.set_mapped_filename_variable_name */
extern void T389f41(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.mapped_filename_variable_name_attribute_name */
extern unsigned char ge129os9004;
extern T0* ge129ov9004;
extern T0* T383f15(T0* C);
/* GEANT_FILESET.set_filename_variable_name */
extern void T389f40(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.filename_variable_name_attribute_name */
extern unsigned char ge129os9003;
extern T0* ge129ov9003;
extern T0* T383f14(T0* C);
/* GEANT_FILESET.set_concat */
extern void T389f39(T0* C, T1 a1);
/* GEANT_FILESET.set_force */
extern void T389f38(T0* C, T1 a1);
/* GEANT_FILESET_ELEMENT.boolean_value */
extern T1 T383f13(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.std */
extern T0* T383f23(T0* C);
/* GEANT_FILESET_ELEMENT.false_attribute_value */
extern T0* T383f28(T0* C);
/* GEANT_FILESET_ELEMENT.true_attribute_value */
extern T0* T383f27(T0* C);
/* GEANT_FILESET_ELEMENT.force_attribute_name */
extern unsigned char ge129os9001;
extern T0* ge129ov9001;
extern T0* T383f12(T0* C);
/* GEANT_FILESET.set_exclude_wc_string */
extern void T389f37(T0* C, T0* a1);
/* LX_DFA_WILDCARD.is_compiled */
extern T1 T506f12(T0* C);
/* LX_DFA_WILDCARD.compile */
extern T0* T506c14(T0* a1, T1 a2);
/* LX_FULL_DFA.make */
extern T0* T548c37(T0* a1);
/* LX_FULL_DFA.build */
extern void T548f40(T0* C);
/* LX_FULL_DFA.build_accept_table */
extern void T548f46(T0* C);
/* ARRAY [INTEGER_32].put */
extern void T204f12(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [LX_RULE].first */
extern T0* T572f11(T0* C);
/* ARRAY [INTEGER_32].make */
extern T0* T204c9(T6 a1, T6 a2);
/* ARRAY [INTEGER_32].make_area */
extern void T204f10(T0* C, T6 a1);
/* LX_FULL_DFA.build_nxt_table */
extern void T548f45(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].target */
extern T0* T602f6(T0* C, T6 a1);
/* ARRAY [LX_DFA_STATE].item */
extern T0* T648f4(T0* C, T6 a1);
/* LX_DFA_STATE.is_accepting */
extern T1 T597f10(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].is_empty */
extern T1 T572f10(T0* C);
/* LX_FULL_DFA.build_transitions */
extern void T548f44(T0* C, T0* a1);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].set_target */
extern void T602f8(T0* C, T0* a1, T6 a2);
/* ARRAY [LX_DFA_STATE].put */
extern void T648f7(T0* C, T0* a1, T6 a2);
/* LX_SYMBOL_PARTITIONS.previous_symbol */
extern T6 T600f4(T0* C, T6 a1);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].item */
extern T0* T632f4(T0* C, T6 a1);
/* LX_FULL_DFA.new_state */
extern T0* T548f36(T0* C, T0* a1);
/* LX_DFA_STATE.set_id */
extern void T597f17(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].put_last */
extern void T599f9(T0* C, T0* a1);
/* LX_DFA_STATE.is_equal */
extern T1 T597f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].is_equal */
extern T1 T598f19(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].any_ */
extern T0* T598f21(T0* C);
/* LX_DFA_STATE.any_ */
extern T0* T597f14(T0* C);
/* LX_DFA_STATE.new_state */
extern T0* T597f9(T0* C, T6 a1);
/* LX_DFA_STATE.make */
extern T0* T597c16(T0* a1, T6 a2, T6 a3);
/* LX_RULE.set_useful */
extern void T582f22(T0* C, T1 a1);
/* DS_ARRAYED_LIST [LX_RULE].sort */
extern void T572f16(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_RULE].sort */
extern void T638f3(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_RULE].sort_with_comparator */
extern void T638f4(T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [LX_RULE].subsort_with_comparator */
extern void T638f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* DS_ARRAYED_LIST [LX_RULE].replace */
extern void T572f21(T0* C, T0* a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [LX_RULE].less_than */
extern T1 T665f1(T0* C, T0* a1, T0* a2);
/* LX_RULE.infix "<" */
extern T1 T582f12(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].item */
extern T0* T572f6(T0* C, T6 a1);
/* LX_DFA_STATE.rule_sorter */
extern unsigned char ge326os10314;
extern T0* ge326ov10314;
extern T0* T597f7(T0* C);
/* DS_BUBBLE_SORTER [LX_RULE].make */
extern T0* T638c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [LX_RULE].make */
extern T0* T665c2(void);
/* DS_ARRAYED_LIST [LX_NFA_STATE].sort */
extern void T598f29(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].sort */
extern void T636f3(T0* C, T0* a1);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].sort_with_comparator */
extern void T636f4(T0* C, T0* a1, T0* a2);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].subsort_with_comparator */
extern void T636f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* DS_ARRAYED_LIST [LX_NFA_STATE].replace */
extern void T598f26(T0* C, T0* a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE].less_than */
extern T1 T668f1(T0* C, T0* a1, T0* a2);
/* LX_NFA_STATE.infix "<" */
extern T1 T605f8(T0* C, T0* a1);
/* LX_DFA_STATE.bubble_sorter */
extern unsigned char ge326os10313;
extern T0* ge326ov10313;
extern T0* T597f8(T0* C);
/* DS_BUBBLE_SORTER [LX_NFA_STATE].make */
extern T0* T636c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE].make */
extern T0* T668c2(void);
/* DS_ARRAYED_LIST [LX_NFA_STATE].last */
extern T0* T598f9(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].is_empty */
extern T1 T598f8(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].force_last */
extern void T572f13(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].resize */
extern void T572f14(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].resize */
extern T0* T615f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_RULE].aliased_resized_area */
extern T0* T595f3(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].new_capacity */
extern T6 T572f9(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].extendible */
extern T1 T572f8(T0* C, T6 a1);
/* LX_NFA_STATE.is_accepting_head */
extern T1 T605f6(T0* C);
/* LX_NFA_STATE.has_transition */
extern T1 T605f9(T0* C);
/* LX_NFA_STATE.is_accepting */
extern T1 T605f7(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].has */
extern T1 T598f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].force_last */
extern void T598f27(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].resize */
extern void T598f31(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].resize */
extern T0* T642f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_NFA_STATE].aliased_resized_area */
extern T0* T640f3(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].new_capacity */
extern T6 T598f13(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].extendible */
extern T1 T598f12(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].make */
extern T0* T572c12(T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].new_cursor */
extern T0* T572f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_RULE].make */
extern T0* T616c4(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].make */
extern T0* T615f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_RULE].make_area */
extern T0* T671c2(T6 a1);
/* SPECIAL [LX_RULE].make */
extern T0* T595c4(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_RULE].default_create */
extern T0* T615c3(void);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].make */
extern T0* T602c7(T6 a1, T6 a2);
/* KL_ARRAY_ROUTINES [LX_DFA_STATE].default_create */
extern T0* T649c1(void);
/* ARRAY [LX_DFA_STATE].make */
extern T0* T648c5(T6 a1, T6 a2);
/* ARRAY [LX_DFA_STATE].make_area */
extern void T648f6(T0* C, T6 a1);
/* SPECIAL [LX_DFA_STATE].make */
extern T0* T645c4(T6 a1);
/* LX_DFA_STATE.maximum_symbol */
extern T6 T597f13(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].upper */
extern T6 T602f5(T0* C);
/* LX_DFA_STATE.minimum_symbol */
extern T6 T597f12(T0* C);
/* LX_TRANSITION_TABLE [LX_DFA_STATE].lower */
extern T6 T602f4(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put_last */
extern void T598f24(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].item */
extern T0* T598f10(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].make */
extern T0* T598c23(T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].new_cursor */
extern T0* T598f11(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].make */
extern T0* T643c7(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].make */
extern T0* T642f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_NFA_STATE].make_area */
extern T0* T674c2(T6 a1);
/* SPECIAL [LX_NFA_STATE].make */
extern T0* T640c4(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].default_create */
extern T0* T642c3(void);
/* LX_SYMBOL_PARTITIONS.is_representative */
extern T1 T600f8(T0* C, T6 a1);
/* ARRAY [BOOLEAN].item */
extern T1 T563f4(T0* C, T6 a1);
/* LX_DFA_STATE.partition */
extern void T597f18(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.initialize */
extern void T600f10(T0* C);
/* ARRAY [BOOLEAN].clear_all */
extern void T563f7(T0* C);
/* SPECIAL [BOOLEAN].clear_all */
extern void T155f6(T0* C);
/* SPECIAL [BOOLEAN].put_default */
extern void T155f7(T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.initialize */
extern void T600f10p1(T0* C);
/* DS_BILINKABLE [INTEGER_32].put_left */
extern void T630f9(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].attach_right */
extern void T630f10(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].put */
extern void T630f5(T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.lower */
extern T6 T600f7(T0* C);
/* LX_SYMBOL_PARTITIONS.upper */
extern T6 T600f6(T0* C);
/* LX_FULL_DFA.resize */
extern void T548f49(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].resize */
extern void T599f10(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].resize */
extern T0* T646f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_DFA_STATE].aliased_resized_area */
extern T0* T645f3(T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.capacity */
extern T6 T600f5(T0* C);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].count */
extern T6 T632f5(T0* C);
/* DS_ARRAYED_LIST [LX_DFA_STATE].item */
extern T0* T599f6(T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.make */
extern T0* T600c9(T6 a1, T6 a2);
/* LX_SYMBOL_PARTITIONS.make */
extern void T600f9p1(T0* C, T6 a1, T6 a2);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].put */
extern void T632f7(T0* C, T0* a1, T6 a2);
/* DS_BILINKABLE [INTEGER_32].make */
extern T0* T630c4(T6 a1);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].make */
extern T0* T632c6(T6 a1, T6 a2);
/* ARRAY [DS_BILINKABLE [INTEGER_32]].make_area */
extern void T632f8(T0* C, T6 a1);
/* SPECIAL [DS_BILINKABLE [INTEGER_32]].make */
extern T0* T631c2(T6 a1);
/* ARRAY [BOOLEAN].make */
extern T0* T563c5(T6 a1, T6 a2);
/* ARRAY [BOOLEAN].make_area */
extern void T563f8(T0* C, T6 a1);
/* SPECIAL [BOOLEAN].make */
extern T0* T155c4(T6 a1);
/* LX_FULL_DFA.put_eob_state */
extern void T548f39(T0* C);
/* DS_ARRAYED_LIST [LX_RULE].force_first */
extern void T572f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_RULE].put */
extern void T572f17(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [LX_RULE].move_cursors_right */
extern void T572f20(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_RULE].set_position */
extern void T616f5(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_RULE].move_right */
extern void T572f19(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [LX_RULE].put_last */
extern void T572f18(T0* C, T0* a1);
/* LX_RULE.make_default */
extern T0* T582c14(T6 a1);
/* LX_RULE.dummy_action */
extern unsigned char ge413os11639;
extern T0* ge413ov11639;
extern T0* T582f11(T0* C);
/* LX_ACTION.make */
extern T0* T634c2(T0* a1);
/* LX_RULE.dummy_pattern */
extern unsigned char ge413os11638;
extern T0* ge413ov11638;
extern T0* T582f13(T0* C);
/* LX_NFA.make_epsilon */
extern T0* T580c12(T1 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put_first */
extern void T598f25(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].put */
extern void T598f30(T0* C, T0* a1, T6 a2);
/* DS_ARRAYED_LIST [LX_NFA_STATE].move_cursors_right */
extern void T598f34(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_position */
extern void T643f8(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].move_right */
extern void T598f33(T0* C, T6 a1, T6 a2);
/* LX_NFA_STATE.set_transition */
extern void T605f11(T0* C, T0* a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].make */
extern T0* T627c3(T0* a1);
/* LX_NFA_STATE.make */
extern T0* T605c10(T1 a1);
/* LX_FULL_DFA.initialize */
extern void T548f38(T0* C, T0* a1);
/* LX_FULL_DFA.initialize_dfa */
extern void T548f43(T0* C, T0* a1, T6 a2, T6 a3);
/* LX_FULL_DFA.put_start_condition */
extern void T548f48(T0* C, T0* a1);
/* LX_NFA.start_state */
extern T0* T580f4(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].first */
extern T0* T598f14(T0* C);
/* DS_ARRAYED_LIST [LX_NFA].item */
extern T0* T603f7(T0* C, T6 a1);
/* LX_START_CONDITIONS.item */
extern T0* T573f7(T0* C, T6 a1);
/* LX_FULL_DFA.set_nfa_state_ids */
extern void T548f47(T0* C, T0* a1);
/* LX_NFA_STATE.set_id */
extern void T605f14(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].force */
extern void T604f37(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].key_storage_put */
extern void T604f45(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].slots_put */
extern void T604f44(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].clashes_put */
extern void T604f43(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].slots_item */
extern T6 T604f29(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].clashes_item */
extern T6 T604f28(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].hash_position */
extern T6 T604f21(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].resize */
extern void T604f42(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].clashes_resize */
extern void T604f50(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].special_integer_ */
extern T0* T604f31(T0* C);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].key_storage_resize */
extern void T604f49(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item_storage_resize */
extern void T604f48(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].resize */
extern T0* T584f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_NFA].aliased_resized_area */
extern T0* T583f3(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].key_storage_item */
extern T6 T604f34(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].slots_resize */
extern void T604f47(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].new_modulus */
extern T6 T604f24(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].new_capacity */
extern T6 T604f33(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item_storage_put */
extern void T604f41(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].search_position */
extern void T604f38(T0* C, T6 a1);
/* KL_EQUALITY_TESTER [INTEGER_32].test */
extern T1 T551f1(T0* C, T6 a1, T6 a2);
/* KL_ANY_ROUTINES.equal_objects */
extern T1 T84f2(T0* C, T0* a1, T0* a2);
/* KL_EQUALITY_TESTER [INTEGER_32].any_ */
extern T0* T551f2(T0* C);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].unset_found_item */
extern void T604f40(T0* C);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item */
extern T0* T604f22(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].item_storage_item */
extern T0* T604f32(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].has */
extern T1 T604f23(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make */
extern T0* T604c36(T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_with_equality_testers */
extern void T604f39(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [LX_NFA, INTEGER_32].make */
extern T0* T652c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [LX_NFA, INTEGER_32].new_cursor */
extern T0* T652f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [LX_NFA, INTEGER_32].make */
extern T0* T676c3(T0* a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].new_cursor */
extern T0* T604f30(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32].make */
extern T0* T654c3(T0* a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_sparse_container */
extern void T604f46(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_slots */
extern void T604f54(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_clashes */
extern void T604f53(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_key_storage */
extern void T604f52(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_NFA, INTEGER_32].make_item_storage */
extern void T604f51(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].make */
extern T0* T584f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_NFA].make_area */
extern T0* T635c2(T6 a1);
/* SPECIAL [LX_NFA].make */
extern T0* T583c4(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_NFA].default_create */
extern T0* T584c3(void);
/* KL_EQUALITY_TESTER [INTEGER_32].default_create */
extern T0* T551c3(void);
/* DS_ARRAYED_LIST [LX_DFA_STATE].make */
extern T0* T599c8(T6 a1);
/* DS_ARRAYED_LIST [LX_DFA_STATE].new_cursor */
extern T0* T599f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].make */
extern T0* T647c3(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].make */
extern T0* T646f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_DFA_STATE].make_area */
extern T0* T675c2(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].default_create */
extern T0* T646c3(void);
/* ARRAY [INTEGER_32].item */
extern T6 T204f4(T0* C, T6 a1);
/* LX_EQUIVALENCE_CLASSES.to_array */
extern T0* T581f6(T0* C, T6 a1, T6 a2);
/* LX_EQUIVALENCE_CLASSES.lower */
extern T6 T581f5(T0* C);
/* LX_EQUIVALENCE_CLASSES.upper */
extern T6 T581f4(T0* C);
/* LX_EQUIVALENCE_CLASSES.built */
extern T1 T581f3(T0* C);
/* LX_FULL_DFA.build_eof_rules */
extern void T548f42(T0* C, T0* a1, T6 a2, T6 a3);
/* ARRAY [LX_RULE].put */
extern void T596f5(T0* C, T0* a1, T6 a2);
/* ARRAY [LX_RULE].make */
extern T0* T596c4(T6 a1, T6 a2);
/* ARRAY [LX_RULE].make_area */
extern void T596f6(T0* C, T6 a1);
/* LX_FULL_DFA.build_rules */
extern void T548f41(T0* C, T0* a1);
/* LX_START_CONDITIONS.names */
extern T0* T573f8(T0* C);
/* LX_WILDCARD_PARSER.parse_string */
extern void T546f220(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.parse */
extern void T546f224(T0* C);
/* LX_WILDCARD_PARSER.yy_pop_last_value */
extern void T546f237(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_push_error_value */
extern void T546f236(T0* C);
/* KL_SPECIAL_ROUTINES [ANY].resize */
extern T0* T142f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [ANY].aliased_resized_area */
extern T0* T141f2(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].make */
extern T0* T142f1(T0* C, T6 a1);
/* TO_SPECIAL [ANY].make_area */
extern T0* T234c2(T6 a1);
/* SPECIAL [ANY].make */
extern T0* T141c3(T6 a1);
/* KL_SPECIAL_ROUTINES [ANY].default_create */
extern T0* T142c3(void);
/* LX_WILDCARD_PARSER.yy_do_action */
extern void T546f235(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.append_character_to_string */
extern T0* T546f170(T0* C, T6 a1, T0* a2);
/* LX_WILDCARD_PARSER.new_symbol_nfa */
extern T0* T546f216(T0* C, T6 a1);
/* LX_NFA.make_symbol */
extern T0* T580c13(T6 a1, T1 a2);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].make */
extern T0* T629c4(T6 a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].force_new */
extern void T576f47(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].key_storage_put */
extern void T576f55(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item_storage_put */
extern void T576f51(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].slots_put */
extern void T576f54(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].clashes_put */
extern void T576f53(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].slots_item */
extern T6 T576f22(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].hash_position */
extern T6 T576f31(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].clashes_item */
extern T6 T576f21(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].resize */
extern void T576f52(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].clashes_resize */
extern void T576f60(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].special_integer_ */
extern T0* T576f33(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].key_storage_resize */
extern void T576f59(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item_storage_resize */
extern void T576f58(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].key_storage_item */
extern T0* T576f25(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].slots_resize */
extern void T576f57(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].new_modulus */
extern T6 T576f27(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].new_capacity */
extern T6 T576f30(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].unset_found_item */
extern void T576f50(T0* C);
/* LX_EQUIVALENCE_CLASSES.add */
extern void T581f11(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].forget_right */
extern void T630f7(T0* C);
/* DS_BILINKABLE [INTEGER_32].forget_left */
extern void T630f8(T0* C);
/* ARRAY [BOOLEAN].put */
extern void T563f6(T0* C, T1 a1, T6 a2);
/* DS_BILINKABLE [INTEGER_32].put_right */
extern void T630f6(T0* C, T0* a1);
/* DS_BILINKABLE [INTEGER_32].attach_left */
extern void T630f11(T0* C, T0* a1);
/* LX_SYMBOL_CLASS.item */
extern T6 T577f14(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.put */
extern void T577f19(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.force_last */
extern void T577f21(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.resize */
extern void T577f22(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.new_capacity */
extern T6 T577f13(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.extendible */
extern T1 T577f11(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.last */
extern T6 T577f16(T0* C);
/* LX_SYMBOL_CLASS.is_empty */
extern T1 T577f12(T0* C);
/* LX_SYMBOL_CLASS.has */
extern T1 T577f10(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.arrayed_has */
extern T1 T577f15(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.make */
extern T0* T577c18(T6 a1);
/* LX_SYMBOL_CLASS.new_cursor */
extern T0* T577f9(T0* C);
/* DS_ARRAYED_LIST_CURSOR [INTEGER_32].make */
extern T0* T623c3(T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].found_item */
extern T0* T576f24(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item_storage_item */
extern T0* T576f32(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].found */
extern T1 T576f23(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].search */
extern void T576f46(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].search_position */
extern void T576f48(T0* C, T0* a1);
/* KL_STRING_EQUALITY_TESTER.test */
extern T1 T566f1(T0* C, T0* a1, T0* a2);
/* LX_WILDCARD_PARSER.new_epsilon_nfa */
extern T0* T546f169(T0* C);
/* LX_WILDCARD_PARSER.append_character_set_to_character_class */
extern T0* T546f168(T0* C, T6 a1, T6 a2, T0* a3);
/* LX_WILDCARD_PARSER.report_negative_range_in_character_class_error */
extern void T546f268(T0* C);
/* UT_ERROR_HANDLER.report_error */
extern void T28f11(T0* C, T0* a1);
/* UT_ERROR_HANDLER.report_error_message */
extern void T28f12(T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_line */
extern void T556f4(T0* C, T0* a1);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_new_line */
extern void T556f6(T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.put_string */
extern void T556f5(T0* C, T0* a1);
/* UT_ERROR_HANDLER.message */
extern T0* T28f5(T0* C, T0* a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.make */
extern T0* T607c7(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.filename */
extern T0* T546f189(T0* C);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].resize */
extern T0* T579f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [LX_SYMBOL_CLASS].aliased_resized_area */
extern T0* T578f2(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].make */
extern T0* T579f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_SYMBOL_CLASS].make_area */
extern T0* T624c2(T6 a1);
/* SPECIAL [LX_SYMBOL_CLASS].make */
extern T0* T578c4(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].default_create */
extern T0* T579c3(void);
/* LX_WILDCARD_PARSER.append_character_to_character_class */
extern T0* T546f167(T0* C, T6 a1, T0* a2);
/* LX_WILDCARD_PARSER.new_character_class */
extern T0* T546f166(T0* C);
/* LX_SYMBOL_CLASS.set_negated */
extern void T577f20(T0* C, T1 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].force */
extern void T576f45(T0* C, T0* a1, T0* a2);
/* LX_WILDCARD_PARSER.new_nfa_from_character_class */
extern T0* T546f165(T0* C, T0* a1);
/* LX_SYMBOL_CLASS.sort */
extern void T577f24(T0* C);
/* LX_SYMBOL_CLASS.arrayed_sort */
extern void T577f26(T0* C, T0* a1);
/* DS_SHELL_SORTER [INTEGER_32].sort */
extern void T680f3(T0* C, T0* a1);
/* DS_SHELL_SORTER [INTEGER_32].sort_with_comparator */
extern void T680f4(T0* C, T0* a1, T0* a2);
/* DS_SHELL_SORTER [INTEGER_32].subsort_with_comparator */
extern void T680f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* LX_SYMBOL_CLASS.replace */
extern void T577f25(T0* C, T6 a1, T6 a2);
/* KL_COMPARABLE_COMPARATOR [INTEGER_32].less_than */
extern T1 T688f1(T0* C, T6 a1, T6 a2);
/* LX_SYMBOL_CLASS.sorter */
extern unsigned char ge331os11478;
extern T0* ge331ov11478;
extern T0* T577f17(T0* C);
/* DS_SHELL_SORTER [INTEGER_32].make */
extern T0* T680c2(T0* a1);
/* KL_COMPARABLE_COMPARATOR [INTEGER_32].make */
extern T0* T688c2(void);
/* LX_WILDCARD_PARSER.new_symbol_class_nfa */
extern T0* T546f163(T0* C, T0* a1);
/* LX_NFA.make_symbol_class */
extern T0* T580c6(T0* a1, T1 a2);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].make */
extern T0* T625c4(T0* a1, T0* a2);
/* LX_WILDCARD_PARSER.question_character_class */
extern T0* T546f162(T0* C);
/* LX_NFA.build_optional */
extern void T580f11(T0* C);
/* LX_NFA_STATE.set_epsilon_transition */
extern void T605f12(T0* C, T0* a1);
/* LX_NFA.final_state */
extern T0* T580f5(T0* C);
/* LX_NFA.build_positive_closure */
extern void T580f10(T0* C);
/* LX_NFA.build_closure */
extern void T580f9(T0* C);
/* LX_WILDCARD_PARSER.new_nfa_from_character */
extern T0* T546f159(T0* C, T6 a1);
/* LX_NFA.build_concatenation */
extern void T580f8(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].append_last */
extern void T598f28(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].extend_last */
extern void T598f32(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].forth */
extern void T643f10(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_forth */
extern void T598f36(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].add_traversing_cursor */
extern void T598f37(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_next_cursor */
extern void T643f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].remove_traversing_cursor */
extern void T598f38(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].item */
extern T0* T643f4(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_item */
extern T0* T598f16(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].after */
extern T1 T643f5(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_after */
extern T1 T598f15(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].start */
extern void T643f9(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_start */
extern void T598f35(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].off */
extern T1 T643f6(T0* C);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_off */
extern T1 T598f18(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_before */
extern T1 T598f20(T0* C, T0* a1);
/* LX_NFA.build_union */
extern void T580f7(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.report_unrecognized_rule_error */
extern void T546f250(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.make */
extern T0* T587c7(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.process_rule */
extern void T546f249(T0* C, T0* a1);
/* LX_START_CONDITIONS.add_nfa_to_all */
extern void T573f11(T0* C, T0* a1);
/* LX_START_CONDITION.put_nfa */
extern void T601f7(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA].force_last */
extern void T603f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [LX_NFA].resize */
extern void T603f12(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA].new_capacity */
extern T6 T603f9(T0* C, T6 a1);
/* DS_ARRAYED_LIST [LX_NFA].extendible */
extern T1 T603f8(T0* C, T6 a1);
/* LX_START_CONDITIONS.add_nfa_to_non_exclusive */
extern void T573f13(T0* C, T0* a1);
/* LX_START_CONDITIONS.is_empty */
extern T1 T573f6(T0* C);
/* LX_DESCRIPTION.set_variable_trail_context */
extern void T547f34(T0* C, T1 a1);
/* LX_RULE.set_column_count */
extern void T582f21(T0* C, T6 a1);
/* LX_RULE.set_line_count */
extern void T582f20(T0* C, T6 a1);
/* LX_RULE.set_trail_count */
extern void T582f19(T0* C, T6 a1);
/* LX_RULE.set_head_count */
extern void T582f18(T0* C, T6 a1);
/* LX_RULE.set_trail_context */
extern void T582f17(T0* C, T1 a1);
/* LX_RULE.set_line_nb */
extern void T582f16(T0* C, T6 a1);
/* LX_RULE.set_pattern */
extern void T582f15(T0* C, T0* a1);
/* LX_NFA.set_accepted_rule */
extern void T580f14(T0* C, T0* a1);
/* LX_NFA_STATE.set_accepted_rule */
extern void T605f13(T0* C, T0* a1);
/* LX_DESCRIPTION.create_equiv_classes */
extern void T547f33(T0* C);
/* LX_EQUIVALENCE_CLASSES.make */
extern T0* T581c9(T6 a1, T6 a2);
/* LX_EQUIVALENCE_CLASSES.initialize */
extern void T581f12(T0* C);
/* LX_WILDCARD_PARSER.check_options */
extern void T546f248(T0* C);
/* LX_WILDCARD_PARSER.report_full_and_variable_trailing_context_error */
extern void T546f263(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.make */
extern T0* T593c7(void);
/* LX_WILDCARD_PARSER.report_full_and_reject_error */
extern void T546f262(T0* C);
/* LX_FULL_AND_REJECT_ERROR.make */
extern T0* T592c7(void);
/* LX_WILDCARD_PARSER.report_full_and_meta_equiv_classes_error */
extern void T546f261(T0* C);
/* LX_FULL_AND_META_ERROR.make */
extern T0* T591c7(void);
/* LX_WILDCARD_PARSER.build_equiv_classes */
extern void T546f247(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].forth */
extern void T586f8(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_forth */
extern void T576f66(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].add_traversing_cursor */
extern void T576f68(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].set_next_cursor */
extern void T586f10(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].remove_traversing_cursor */
extern void T576f67(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].set_position */
extern void T586f9(T0* C, T6 a1);
/* LX_SYMBOL_CLASS.convert_to_equivalence */
extern void T577f23(T0* C, T0* a1);
/* LX_EQUIVALENCE_CLASSES.equivalence_class */
extern T6 T581f8(T0* C, T6 a1);
/* LX_EQUIVALENCE_CLASSES.is_representative */
extern T1 T581f7(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].item */
extern T0* T586f4(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_item */
extern T0* T576f37(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].after */
extern T1 T586f5(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_after */
extern T1 T576f36(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].start */
extern void T586f7(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_start */
extern void T576f65(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].cursor_off */
extern T1 T576f42(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].is_empty */
extern T1 T576f41(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].new_cursor */
extern T0* T576f35(T0* C);
/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_8].make */
extern T0* T586c6(T0* a1);
/* LX_EQUIVALENCE_CLASSES.build */
extern void T581f10(T0* C);
/* LX_WILDCARD_PARSER.yy_push_last_value */
extern void T546f234(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.accept */
extern void T546f233(T0* C);
/* LX_WILDCARD_PARSER.yy_do_error_action */
extern void T546f231(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.report_error */
extern void T546f246(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.make */
extern T0* T585c7(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.report_eof_expected_error */
extern void T546f245(T0* C);
/* LX_WILDCARD_PARSER.read_token */
extern void T546f230(T0* C);
/* LX_WILDCARD_PARSER.yy_execute_action */
extern void T546f244(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.report_bad_character_error */
extern void T546f260(T0* C, T0* a1);
/* LX_BAD_CHARACTER_ERROR.make */
extern T0* T590c7(T0* a1, T6 a2, T0* a3);
/* LX_WILDCARD_PARSER.report_bad_character_class_error */
extern void T546f259(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.make */
extern T0* T589c7(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.start_condition */
extern T6 T546f184(T0* C);
/* LX_WILDCARD_PARSER.process_escaped_character */
extern void T546f258(T0* C);
/* LX_WILDCARD_PARSER.text_count */
extern T6 T546f205(T0* C);
/* LX_WILDCARD_PARSER.report_missing_quote_error */
extern void T546f257(T0* C);
/* LX_MISSING_QUOTE_ERROR.make */
extern T0* T588c7(T0* a1, T6 a2);
/* LX_WILDCARD_PARSER.process_character */
extern void T546f256(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.report_character_out_of_range_error */
extern void T546f266(T0* C, T0* a1);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.make */
extern T0* T594c7(T0* a1, T6 a2, T0* a3);
/* LX_WILDCARD_PARSER.text_item */
extern T2 T546f181(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.less */
extern void T546f255(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_set_line_column */
extern void T546f265(T0* C);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].item */
extern T0* T576f34(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].has */
extern T1 T576f26(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.text */
extern T0* T546f175(T0* C);
/* KL_CHARACTER_BUFFER.substring */
extern T0* T367f3(T0* C, T6 a1, T6 a2);
/* LX_WILDCARD_PARSER.set_start_condition */
extern void T546f254(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_execute_eof_action */
extern void T546f243(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.terminate */
extern void T546f253(T0* C);
/* LX_WILDCARD_PARSER.wrap */
extern T1 T546f129(T0* C);
/* LX_WILDCARD_PARSER.yy_refill_input_buffer */
extern void T546f242(T0* C);
/* LX_WILDCARD_PARSER.yy_set_content */
extern void T546f240(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.count */
extern T6 T367f4(T0* C);
/* YY_BUFFER.fill */
extern void T220f15(T0* C);
/* YY_BUFFER.set_index */
extern void T220f13(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_null_trans_state */
extern T6 T546f128(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.yy_previous_state */
extern T6 T546f127(T0* C);
/* LX_WILDCARD_PARSER.fatal_error */
extern void T546f241(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.std */
extern T0* T546f171(T0* C);
/* KL_CHARACTER_BUFFER.item */
extern T2 T367f6(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.special_integer_ */
extern T0* T546f152(T0* C);
/* LX_WILDCARD_PARSER.yy_init_value_stacks */
extern void T546f229(T0* C);
/* LX_WILDCARD_PARSER.yy_clear_all */
extern void T546f238(T0* C);
/* LX_WILDCARD_PARSER.clear_all */
extern void T546f251(T0* C);
/* LX_WILDCARD_PARSER.clear_stacks */
extern void T546f264(T0* C);
/* LX_WILDCARD_PARSER.yy_clear_value_stacks */
extern void T546f267(T0* C);
/* SPECIAL [LX_NFA].clear_all */
extern void T583f6(T0* C);
/* SPECIAL [LX_NFA].put_default */
extern void T583f7(T0* C, T6 a1);
/* SPECIAL [STRING_8].clear_all */
extern void T32f6(T0* C);
/* SPECIAL [LX_SYMBOL_CLASS].clear_all */
extern void T578f6(T0* C);
/* SPECIAL [LX_SYMBOL_CLASS].put_default */
extern void T578f7(T0* C, T6 a1);
/* SPECIAL [INTEGER_32].clear_all */
extern void T63f12(T0* C);
/* SPECIAL [INTEGER_32].put_default */
extern void T63f11(T0* C, T6 a1);
/* SPECIAL [ANY].clear_all */
extern void T141f5(T0* C);
/* SPECIAL [ANY].put_default */
extern void T141f6(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.abort */
extern void T546f232(T0* C);
/* LX_WILDCARD_PARSER.set_input_buffer */
extern void T546f223(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_load_input_buffer */
extern void T546f228(T0* C);
/* YY_BUFFER.set_position */
extern void T220f14(T0* C, T6 a1, T6 a2, T6 a3);
/* LX_WILDCARD_PARSER.new_string_buffer */
extern T0* T546f123(T0* C, T0* a1);
/* YY_BUFFER.make */
extern T0* T220c12(T0* a1);
/* YY_BUFFER.make_from_buffer */
extern void T220f16(T0* C, T0* a1);
/* KL_CHARACTER_BUFFER.put */
extern void T367f10(T0* C, T2 a1, T6 a2);
/* STRING_8.put */
extern void T17f50(T0* C, T2 a1, T6 a2);
/* KL_CHARACTER_BUFFER.fill_from_string */
extern void T367f9(T0* C, T0* a1, T6 a2);
/* STRING_8.subcopy */
extern void T17f54(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* YY_BUFFER.new_default_buffer */
extern T0* T220f11(T0* C, T6 a1);
/* KL_CHARACTER_BUFFER.make */
extern T0* T367c8(T6 a1);
/* KL_OPERATING_SYSTEM.is_dotnet */
extern unsigned char ge255os3025;
extern T1 ge255ov3025;
extern T1 T51f6(T0* C);
/* PLATFORM.default_create */
extern T0* T557c2(void);
/* KL_CHARACTER_BUFFER.operating_system */
extern T0* T367f7(T0* C);
/* LX_WILDCARD_PARSER.make_from_description */
extern T0* T546c219(T0* a1, T0* a2);
/* DS_ARRAYED_STACK [INTEGER_32].make */
extern T0* T575c4(T6 a1);
/* LX_ACTION_FACTORY.make */
extern T0* T574c1(void);
/* LX_START_CONDITIONS.make */
extern void T573f10(T0* C, T6 a1);
/* LX_START_CONDITIONS.make */
extern T0* T573c10(T6 a1);
/* LX_START_CONDITIONS.new_cursor */
extern T0* T573f9(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].make */
extern T0* T619c4(T0* a1);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].make */
extern T0* T618f1(T0* C, T6 a1);
/* TO_SPECIAL [LX_START_CONDITION].make_area */
extern T0* T672c2(T6 a1);
/* SPECIAL [LX_START_CONDITION].make */
extern T0* T617c2(T6 a1);
/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].default_create */
extern T0* T618c2(void);
/* LX_WILDCARD_PARSER.make_parser_skeleton */
extern void T546f222(T0* C);
/* LX_WILDCARD_PARSER.yy_build_parser_tables */
extern void T546f227(T0* C);
/* LX_WILDCARD_PARSER.yycheck_template */
extern unsigned char ge391os9714;
extern T0* ge391ov9714;
extern T0* T546f138(T0* C);
/* LX_WILDCARD_PARSER.yyfixed_array */
extern T0* T546f211(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [INTEGER_32].to_special */
extern T0* T65f3(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yytable_template */
extern unsigned char ge391os9713;
extern T0* ge391ov9713;
extern T0* T546f137(T0* C);
/* LX_WILDCARD_PARSER.yypgoto_template */
extern unsigned char ge391os9712;
extern T0* ge391ov9712;
extern T0* T546f135(T0* C);
/* LX_WILDCARD_PARSER.yypact_template */
extern unsigned char ge391os9711;
extern T0* ge391ov9711;
extern T0* T546f134(T0* C);
/* LX_WILDCARD_PARSER.yydefgoto_template */
extern unsigned char ge391os9710;
extern T0* ge391ov9710;
extern T0* T546f133(T0* C);
/* LX_WILDCARD_PARSER.yydefact_template */
extern unsigned char ge391os9709;
extern T0* ge391ov9709;
extern T0* T546f130(T0* C);
/* LX_WILDCARD_PARSER.yytypes2_template */
extern unsigned char ge391os9708;
extern T0* ge391ov9708;
extern T0* T546f124(T0* C);
/* LX_WILDCARD_PARSER.yytypes1_template */
extern unsigned char ge391os9707;
extern T0* ge391ov9707;
extern T0* T546f122(T0* C);
/* LX_WILDCARD_PARSER.yyr1_template */
extern unsigned char ge391os9706;
extern T0* ge391ov9706;
extern T0* T546f117(T0* C);
/* LX_WILDCARD_PARSER.yytranslate_template */
extern unsigned char ge391os9705;
extern T0* ge391ov9705;
extern T0* T546f116(T0* C);
/* LX_WILDCARD_PARSER.yy_create_value_stacks */
extern void T546f226(T0* C);
/* LX_WILDCARD_PARSER.make_lex_scanner_from_description */
extern void T546f221(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].set_key_equality_tester */
extern void T576f44(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING_8].internal_set_equality_tester */
extern void T621f6(T0* C, T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_map */
extern T0* T576c43(T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_with_equality_testers */
extern void T576f49(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING_8].make */
extern T0* T621c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [LX_SYMBOL_CLASS, STRING_8].new_cursor */
extern T0* T621f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [LX_SYMBOL_CLASS, STRING_8].make */
extern T0* T673c3(T0* a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_sparse_container */
extern void T576f56(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_slots */
extern void T576f64(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_clashes */
extern void T576f63(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_key_storage */
extern void T576f62(T0* C, T6 a1);
/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_8].make_item_storage */
extern void T576f61(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_key_equality_tester */
extern void T81f44(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.string_equality_tester */
extern unsigned char ge186os2962;
extern T0* ge186ov2962;
extern T0* T546f120(T0* C);
/* KL_STRING_EQUALITY_TESTER.default_create */
extern T0* T566c2(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map */
extern void T81f46(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map */
extern T0* T81c46(T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_with_equality_testers */
extern void T81f47(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_sparse_container */
extern void T81f48(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].unset_found_item */
extern void T81f53(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_slots */
extern void T81f52(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].special_integer_ */
extern T0* T81f41(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_modulus */
extern T6 T81f21(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_clashes */
extern void T81f51(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_key_storage */
extern void T81f50(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_item_storage */
extern void T81f49(T0* C, T6 a1);
/* LX_WILDCARD_PARSER.make_with_buffer */
extern void T546f225(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_initialize */
extern void T546f239(T0* C);
/* LX_WILDCARD_PARSER.yy_build_tables */
extern void T546f252(T0* C);
/* LX_WILDCARD_PARSER.yy_accept_template */
extern unsigned char ge392os9981;
extern T0* ge392ov9981;
extern T0* T546f197(T0* C);
/* LX_WILDCARD_PARSER.yy_fixed_array */
extern T0* T546f218(T0* C, T0* a1);
/* LX_WILDCARD_PARSER.yy_meta_template */
extern unsigned char ge392os9980;
extern T0* ge392ov9980;
extern T0* T546f196(T0* C);
/* LX_WILDCARD_PARSER.yy_ec_template */
extern unsigned char ge392os9979;
extern T0* ge392ov9979;
extern T0* T546f195(T0* C);
/* LX_WILDCARD_PARSER.yy_def_template */
extern unsigned char ge392os9978;
extern T0* ge392ov9978;
extern T0* T546f194(T0* C);
/* LX_WILDCARD_PARSER.yy_base_template */
extern unsigned char ge392os9977;
extern T0* ge392ov9977;
extern T0* T546f193(T0* C);
/* LX_WILDCARD_PARSER.yy_chk_template */
extern unsigned char ge392os9976;
extern T0* ge392ov9976;
extern T0* T546f192(T0* C);
/* LX_WILDCARD_PARSER.yy_nxt_template */
extern unsigned char ge392os9975;
extern T0* ge392ov9975;
extern T0* T546f191(T0* C);
/* LX_WILDCARD_PARSER.empty_buffer */
extern unsigned char ge408os6617;
extern T0* ge408ov6617;
extern T0* T546f144(T0* C);
/* LX_DESCRIPTION.set_case_insensitive */
extern void T547f32(T0* C, T1 a1);
/* LX_DESCRIPTION.set_full_table */
extern void T547f31(T0* C, T1 a1);
/* LX_DESCRIPTION.set_meta_equiv_classes_used */
extern void T547f30(T0* C, T1 a1);
/* LX_DESCRIPTION.set_equiv_classes_used */
extern void T547f29(T0* C, T1 a1);
/* LX_DESCRIPTION.make */
extern T0* T547c28(void);
/* LX_START_CONDITIONS.make_with_initial */
extern T0* T573c12(T6 a1);
/* LX_START_CONDITIONS.put_first */
extern void T573f14(T0* C, T0* a1);
/* LX_START_CONDITIONS.put */
extern void T573f15(T0* C, T0* a1, T6 a2);
/* LX_START_CONDITIONS.move_cursors_right */
extern void T573f18(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].set_position */
extern void T619f5(T0* C, T6 a1);
/* LX_START_CONDITIONS.move_right */
extern void T573f17(T0* C, T6 a1, T6 a2);
/* LX_START_CONDITIONS.put_last */
extern void T573f16(T0* C, T0* a1);
/* LX_START_CONDITION.make */
extern T0* T601c6(T0* a1, T6 a2, T1 a3);
/* DS_ARRAYED_LIST [LX_NFA].make */
extern T0* T603c10(T6 a1);
/* DS_ARRAYED_LIST [LX_NFA].new_cursor */
extern T0* T603f6(T0* C);
/* DS_ARRAYED_LIST_CURSOR [LX_NFA].make */
extern T0* T650c3(T0* a1);
/* UT_ERROR_HANDLER.make_null */
extern T0* T28c10(void);
/* UT_ERROR_HANDLER.null_output_stream */
extern unsigned char ge228os2580;
extern T0* ge228ov2580;
extern T0* T28f6(T0* C);
/* KL_NULL_TEXT_OUTPUT_STREAM.make */
extern T0* T556c3(T0* a1);
/* LX_DFA_WILDCARD.wipe_out */
extern void T506f15(T0* C);
/* GEANT_FILESET_ELEMENT.exclude_attribute_name */
extern unsigned char ge129os9000;
extern T0* ge129ov9000;
extern T0* T383f11(T0* C);
/* GEANT_FILESET.set_include_wc_string */
extern void T389f36(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.include_attribute_name */
extern unsigned char ge129os8999;
extern T0* ge129ov8999;
extern T0* T383f10(T0* C);
/* GEANT_FILESET.set_directory_name */
extern void T389f35(T0* C, T0* a1);
/* GEANT_FILESET.set_dir_name */
extern void T389f34(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.attribute_value */
extern T0* T383f9(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.project_variables_resolver */
extern T0* T383f25(T0* C);
/* GEANT_FILESET_ELEMENT.dir_attribute_name */
extern T0* T383f8(T0* C);
/* GEANT_FILESET.make */
extern T0* T389c33(T0* a1);
/* DS_HASH_SET [STRING_8].set_equality_tester */
extern void T504f36(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].make */
extern T0* T504c35(T6 a1);
/* DS_HASH_SET [STRING_8].new_cursor */
extern T0* T504f22(T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].make */
extern T0* T545c6(T0* a1);
/* DS_HASH_SET [STRING_8].make_slots */
extern void T504f41(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_clashes */
extern void T504f40(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_key_storage */
extern void T504f39(T0* C, T6 a1);
/* DS_HASH_SET [STRING_8].make_item_storage */
extern void T504f38(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_equal */
extern T0* T502c39(T6 a1);
/* KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY].default_create */
extern T0* T540c3(void);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make */
extern void T502f40(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].new_cursor */
extern T0* T502f25(T0* C);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].make */
extern T0* T541c4(T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].unset_found_item */
extern void T502f45(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_slots */
extern void T502f44(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].special_integer_ */
extern T0* T502f27(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].new_modulus */
extern T6 T502f33(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_clashes */
extern void T502f43(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_key_storage */
extern void T502f42(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].make_item_storage */
extern void T502f41(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].make */
extern T0* T542f1(T0* C, T6 a1);
/* TO_SPECIAL [GEANT_FILESET_ENTRY].make_area */
extern T0* T571c2(T6 a1);
/* SPECIAL [GEANT_FILESET_ENTRY].make */
extern T0* T544c4(T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].default_create */
extern T0* T542c3(void);
/* GEANT_FILESET_ELEMENT.exit_application */
extern void T383f30(T0* C, T6 a1, T0* a2);
/* GEANT_FILESET_ELEMENT.exceptions */
extern T0* T383f24(T0* C);
/* GEANT_FILESET_ELEMENT.log_messages */
extern void T383f33(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.mapped_filename_directory_attribute_name */
extern unsigned char ge129os9007;
extern T0* ge129ov9007;
extern T0* T383f6(T0* C);
/* GEANT_FILESET_ELEMENT.filename_directory_attribute_name */
extern unsigned char ge129os9005;
extern T0* ge129ov9005;
extern T0* T383f5(T0* C);
/* GEANT_FILESET_ELEMENT.directory_attribute_name */
extern unsigned char ge129os8998;
extern T0* ge129ov8998;
extern T0* T383f22(T0* C);
/* GEANT_FILESET_ELEMENT.has_attribute */
extern T1 T383f20(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.concat_attribute_name */
extern unsigned char ge129os9002;
extern T0* ge129ov9002;
extern T0* T383f7(T0* C);
/* GEANT_FILESET_ELEMENT.make */
extern void T383f29p1(T0* C, T0* a1, T0* a2);
/* GEANT_FILESET_ELEMENT.set_project */
extern void T383f32(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.element_make */
extern void T383f31(T0* C, T0* a1);
/* GEANT_FILESET_ELEMENT.set_xml_element */
extern void T383f34(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.fileset_element_name */
extern unsigned char ge116os8628;
extern T0* ge116ov8628;
extern T0* T318f13(T0* C);
/* GEANT_REPLACE_COMMAND.set_flags */
extern void T461f37(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.flags_attribute_name */
extern unsigned char ge116os8627;
extern T0* ge116ov8627;
extern T0* T318f12(T0* C);
/* GEANT_REPLACE_COMMAND.set_replace */
extern void T461f36(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.replace_attribute_name */
extern unsigned char ge116os8626;
extern T0* ge116ov8626;
extern T0* T318f11(T0* C);
/* GEANT_REPLACE_COMMAND.set_variable_pattern */
extern void T461f35(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.variable_pattern_attribute_name */
extern unsigned char ge116os8625;
extern T0* ge116ov8625;
extern T0* T318f9(T0* C);
/* GEANT_REPLACE_COMMAND.set_token */
extern void T461f34(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.token_attribute_name */
extern unsigned char ge116os8624;
extern T0* ge116ov8624;
extern T0* T318f8(T0* C);
/* GEANT_REPLACE_COMMAND.set_match */
extern void T461f33(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.match_attribute_name */
extern unsigned char ge116os8623;
extern T0* ge116ov8623;
extern T0* T318f7(T0* C);
/* GEANT_REPLACE_COMMAND.set_to_directory */
extern void T461f32(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.to_directory_attribute_name */
extern unsigned char ge116os8622;
extern T0* ge116ov8622;
extern T0* T318f6(T0* C);
/* GEANT_REPLACE_COMMAND.set_to_file */
extern void T461f31(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.to_file_attribute_name */
extern unsigned char ge116os8621;
extern T0* ge116ov8621;
extern T0* T318f5(T0* C);
/* GEANT_REPLACE_COMMAND.set_file */
extern void T461f30(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.attribute_value */
extern T0* T318f14(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.project_variables_resolver */
extern T0* T318f17(T0* C);
/* GEANT_REPLACE_TASK.has_attribute */
extern T1 T318f10(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.file_attribute_name */
extern unsigned char ge116os8620;
extern T0* ge116ov8620;
extern T0* T318f15(T0* C);
/* GEANT_REPLACE_TASK.make */
extern void T318f31p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_REPLACE_TASK.make */
extern T0* T318f31p1ac1(T0* a1);
/* DS_CELL [PROCEDURE [ANY, TUPLE]].put */
extern void T377f3(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.make_with_command */
extern void T318f33(T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_TASK.interpreting_element_make */
extern void T318f36(T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_TASK.set_project */
extern void T318f38(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.element_make */
extern void T318f37(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.set_xml_element */
extern void T318f39(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.set_command */
extern void T318f35(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.build_command */
extern void T318f32(T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.make */
extern T0* T461c29(T0* a1);
/* DS_CELL [PROCEDURE [ANY, TUPLE]].make */
extern T0* T377c2(T0* a1);
/* GEANT_REPLACE_COMMAND.set_project */
extern void T461f39(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_input_task */
extern T0* T191f50(T0* C, T0* a1);
/* GEANT_INPUT_TASK.make */
extern T0* T316c32(T0* a1, T0* a2);
/* GEANT_INPUT_COMMAND.set_answer_required */
extern void T458f21(T0* C, T1 a1);
/* GEANT_INPUT_TASK.boolean_value */
extern T1 T316f10(T0* C, T0* a1);
/* GEANT_INPUT_TASK.std */
extern T0* T316f18(T0* C);
/* GEANT_INPUT_TASK.false_attribute_value */
extern T0* T316f17(T0* C);
/* GEANT_INPUT_TASK.true_attribute_value */
extern T0* T316f16(T0* C);
/* GEANT_INPUT_TASK.string_ */
extern T0* T316f15(T0* C);
/* GEANT_INPUT_TASK.answer_required_attribute_name */
extern unsigned char ge109os8602;
extern T0* ge109ov8602;
extern T0* T316f9(T0* C);
/* GEANT_INPUT_COMMAND.set_validregexp */
extern void T458f20(T0* C, T0* a1);
/* GEANT_INPUT_TASK.validregexp_attribute_name */
extern unsigned char ge109os8601;
extern T0* ge109ov8601;
extern T0* T316f8(T0* C);
/* GEANT_INPUT_COMMAND.set_validargs */
extern void T458f19(T0* C, T0* a1);
/* GEANT_INPUT_TASK.validargs_attribute_name */
extern unsigned char ge109os8600;
extern T0* ge109ov8600;
extern T0* T316f7(T0* C);
/* GEANT_INPUT_COMMAND.set_default_value */
extern void T458f18(T0* C, T0* a1);
/* GEANT_INPUT_TASK.defaultvalue_attribute_name */
extern unsigned char ge109os8599;
extern T0* ge109ov8599;
extern T0* T316f6(T0* C);
/* GEANT_INPUT_COMMAND.set_message */
extern void T458f17(T0* C, T0* a1);
/* GEANT_INPUT_TASK.message_attribute_name */
extern unsigned char ge109os8598;
extern T0* ge109ov8598;
extern T0* T316f5(T0* C);
/* GEANT_INPUT_COMMAND.set_variable */
extern void T458f16(T0* C, T0* a1);
/* GEANT_INPUT_TASK.attribute_value */
extern T0* T316f12(T0* C, T0* a1);
/* GEANT_INPUT_TASK.project_variables_resolver */
extern T0* T316f19(T0* C);
/* GEANT_INPUT_TASK.has_attribute */
extern T1 T316f11(T0* C, T0* a1);
/* GEANT_INPUT_TASK.variable_attribute_name */
extern unsigned char ge109os8597;
extern T0* ge109ov8597;
extern T0* T316f14(T0* C);
/* GEANT_INPUT_TASK.make */
extern void T316f32p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_INPUT_TASK.make */
extern T0* T316f32p1ac1(T0* a1);
/* GEANT_INPUT_TASK.make_with_command */
extern void T316f34(T0* C, T0* a1, T0* a2);
/* GEANT_INPUT_TASK.interpreting_element_make */
extern void T316f37(T0* C, T0* a1, T0* a2);
/* GEANT_INPUT_TASK.set_project */
extern void T316f39(T0* C, T0* a1);
/* GEANT_INPUT_TASK.element_make */
extern void T316f38(T0* C, T0* a1);
/* GEANT_INPUT_TASK.set_xml_element */
extern void T316f40(T0* C, T0* a1);
/* GEANT_INPUT_TASK.set_command */
extern void T316f36(T0* C, T0* a1);
/* GEANT_INPUT_TASK.build_command */
extern void T316f33(T0* C, T0* a1);
/* GEANT_INPUT_COMMAND.make */
extern T0* T458c15(T0* a1);
/* GEANT_INPUT_COMMAND.set_project */
extern void T458f22(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_available_task */
extern T0* T191f48(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T314c21(T0* a1);
/* Creation of agent #1 in feature GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T314f21ac1(T0* a1, T0* a2);
/* Creation of agent #2 in feature GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T314f21ac2(T0* a1, T0* a2);
/* Creation of agent #3 in feature GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T314f21ac3(T0* a1, T0* a2);
/* Creation of agent #4 in feature GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern T0* T314f21ac4(T0* a1, T0* a2);
/* GEANT_INTERPRETING_ELEMENT.attribute_value_if_existing */
extern T0* T196f5(T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.has_attribute */
extern T1 T196f8(T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.attribute_value */
extern T0* T196f4(T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.project_variables_resolver */
extern T0* T196f7(T0* C);
/* GEANT_STRING_PROPERTY.set_string_value_agent */
extern void T385f9(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.make_from_interpreting_element */
extern void T314f21p1(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.make */
extern void T314f22(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_AVAILABLE_TASK.make */
extern T0* T314f22ac1(T0* a1);
/* GEANT_AVAILABLE_TASK.make_with_command */
extern void T314f24(T0* C, T0* a1, T0* a2);
/* GEANT_AVAILABLE_TASK.interpreting_element_make */
extern void T314f27(T0* C, T0* a1, T0* a2);
/* GEANT_AVAILABLE_TASK.set_project */
extern void T314f29(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.element_make */
extern void T314f28(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.set_xml_element */
extern void T314f30(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.set_command */
extern void T314f26(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.build_command */
extern void T314f23(T0* C, T0* a1);
/* GEANT_AVAILABLE_COMMAND.make */
extern T0* T455c17(T0* a1);
/* Creation of agent #1 in feature GEANT_AVAILABLE_COMMAND.make */
extern T0* T455f17ac1(T0* a1);
/* GEANT_AVAILABLE_COMMAND.is_resource_existing */
extern T1 T455f15(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.file_exists */
extern T1 T53f29(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.exists */
extern T1 T55f33(T0* C);
/* KL_TEXT_INPUT_FILE.is_plain */
extern T1 T55f28(T0* C);
/* UNIX_FILE_INFO.is_plain */
extern T1 T87f7(T0* C);
/* UNIX_FILE_INFO.file_info */
extern T6 T87f5(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.buffered_file_info */
extern unsigned char ge2335os3284;
extern T0* ge2335ov3284;
extern T0* T55f14(T0* C);
/* UNIX_FILE_INFO.make */
extern T0* T87c14(void);
/* UNIX_FILE_INFO.make_buffered_file_info */
extern void T87f16(T0* C, T6 a1);
/* UNIX_FILE_INFO.stat_size */
extern T6 T87f6(T0* C);
/* KL_TEXT_INPUT_FILE.set_buffer */
extern void T55f61(T0* C);
/* UNIX_FILE_INFO.update */
extern void T87f15(T0* C, T0* a1);
/* UNIX_FILE_INFO.file_stat */
extern void T87f17(T0* C, T14 a1, T14 a2);
/* KL_TEXT_INPUT_FILE.old_exists */
extern T1 T55f22(T0* C);
/* KL_TEXT_INPUT_FILE.file_exists */
extern T1 T55f13(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.reset */
extern void T55f60(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.tmp_file */
extern unsigned char ge213os3868;
extern T0* ge213ov3868;
extern T0* T53f5(T0* C);
/* KL_UNIX_FILE_SYSTEM.file_exists */
extern T1 T54f26(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.tmp_file */
extern T0* T54f6(T0* C);
/* GEANT_AVAILABLE_COMMAND.unix_file_system */
extern T0* T455f10(T0* C);
/* GEANT_AVAILABLE_COMMAND.file_system */
extern T0* T455f9(T0* C);
/* GEANT_AVAILABLE_COMMAND.windows_file_system */
extern T0* T455f12(T0* C);
/* GEANT_AVAILABLE_COMMAND.operating_system */
extern T0* T455f11(T0* C);
/* DS_CELL [FUNCTION [ANY, TUPLE [STRING_8], BOOLEAN]].make */
extern T0* T524c2(T0* a1);
/* GEANT_STRING_PROPERTY.make */
extern T0* T385c8(void);
/* GEANT_AVAILABLE_COMMAND.make */
extern void T455f17p1(T0* C, T0* a1);
/* GEANT_AVAILABLE_COMMAND.set_project */
extern void T455f18(T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.make */
extern T0* T196c12(T0* a1, T0* a2);
/* GEANT_INTERPRETING_ELEMENT.set_project */
extern void T196f14(T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.element_make */
extern void T196f13(T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.set_xml_element */
extern void T196f15(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_precursor_task */
extern T0* T191f46(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.make */
extern T0* T312c28(T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.force_last_new */
extern void T34f75(T0* C, T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.key_storage_put */
extern void T34f58(T0* C, T0* a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.item_storage_put */
extern void T34f54(T0* C, T0* a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.slots_put */
extern void T34f57(T0* C, T6 a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.clashes_put */
extern void T34f56(T0* C, T6 a1, T6 a2);
/* GEANT_ARGUMENT_VARIABLES.slots_item */
extern T6 T34f29(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.hash_position */
extern T6 T34f24(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.resize */
extern void T34f55(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.clashes_resize */
extern void T34f63(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.key_storage_resize */
extern void T34f62(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.item_storage_resize */
extern void T34f61(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.key_storage_item */
extern T0* T34f28(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.clashes_item */
extern T6 T34f27(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.slots_resize */
extern void T34f60(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.new_capacity */
extern T6 T34f23(T0* C, T6 a1);
/* GEANT_DEFINE_ELEMENT.value */
extern T0* T401f5(T0* C);
/* GEANT_DEFINE_ELEMENT.value_attribute_name */
extern T0* T401f12(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].forth */
extern void T343f9(T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_forth */
extern void T240f14(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].add_traversing_cursor */
extern void T240f15(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T343f11(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].remove_traversing_cursor */
extern void T240f16(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [STRING_8].set */
extern void T343f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_LINKED_LIST_CURSOR [STRING_8].item */
extern T0* T343f6(T0* C);
/* DS_LINKED_LIST_CURSOR [STRING_8].start */
extern void T343f8(T0* C);
/* DS_LINKED_LIST [STRING_8].cursor_start */
extern void T240f13(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].cursor_off */
extern T1 T240f8(T0* C, T0* a1);
/* ST_SPLITTER.split */
extern T0* T418f5(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.arguments_string_splitter */
extern unsigned char ge58os1776;
extern T0* ge58ov1776;
extern T0* T312f8(T0* C);
/* ST_SPLITTER.make */
extern T0* T418c11(void);
/* GEANT_PRECURSOR_TASK.exit_application */
extern void T312f29(T0* C, T6 a1, T0* a2);
/* GEANT_PRECURSOR_TASK.exceptions */
extern T0* T312f11(T0* C);
/* GEANT_PRECURSOR_TASK.std */
extern T0* T312f10(T0* C);
/* GEANT_PRECURSOR_TASK.log_messages */
extern void T312f33(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.arguments_attribute_name */
extern unsigned char ge115os8575;
extern T0* ge115ov8575;
extern T0* T312f7(T0* C);
/* GEANT_PRECURSOR_TASK.elements_by_name */
extern T0* T312f6(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.string_ */
extern T0* T312f15(T0* C);
/* GEANT_PRECURSOR_TASK.argument_element_name */
extern unsigned char ge115os8574;
extern T0* ge115ov8574;
extern T0* T312f5(T0* C);
/* GEANT_PRECURSOR_COMMAND.set_parent */
extern void T452f9(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.attribute_value */
extern T0* T312f12(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.project_variables_resolver */
extern T0* T312f16(T0* C);
/* GEANT_PRECURSOR_TASK.has_attribute */
extern T1 T312f9(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.parent_attribute_name */
extern unsigned char ge115os8573;
extern T0* ge115ov8573;
extern T0* T312f14(T0* C);
/* GEANT_PRECURSOR_TASK.make */
extern void T312f28p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_PRECURSOR_TASK.make */
extern T0* T312f28p1ac1(T0* a1);
/* GEANT_PRECURSOR_TASK.make_with_command */
extern void T312f31(T0* C, T0* a1, T0* a2);
/* GEANT_PRECURSOR_TASK.interpreting_element_make */
extern void T312f35(T0* C, T0* a1, T0* a2);
/* GEANT_PRECURSOR_TASK.set_project */
extern void T312f37(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.element_make */
extern void T312f36(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.set_xml_element */
extern void T312f38(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.set_command */
extern void T312f34(T0* C, T0* a1);
/* GEANT_PRECURSOR_TASK.build_command */
extern void T312f30(T0* C, T0* a1);
/* GEANT_PRECURSOR_COMMAND.make */
extern T0* T452c8(T0* a1);
/* GEANT_PRECURSOR_COMMAND.make */
extern void T452f8p1(T0* C, T0* a1);
/* GEANT_PRECURSOR_COMMAND.set_project */
extern void T452f10(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_exit_task */
extern T0* T191f44(T0* C, T0* a1);
/* GEANT_EXIT_TASK.make */
extern T0* T310c23(T0* a1, T0* a2);
/* UC_UTF8_STRING.to_integer */
extern T6 T206f47(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
extern T6 T118f13(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
extern void T118f17(T0* C, T0* a1, T6 a2);
/* STRING_TO_INTEGER_CONVERTOR.parse_character */
extern void T118f23(T0* C, T2 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflowed */
extern T1 T118f15(T0* C);
/* INTEGER_OVERFLOW_CHECKER.will_overflow */
extern T1 T213f7(T0* C, T11 a1, T11 a2, T6 a3, T6 a4);
/* NATURAL_64.infix ">" */
extern T1 T11f4(T11* C, T11 a1);
/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
extern unsigned char ge2364os6341;
extern T0* ge2364ov6341;
extern T0* T118f14(T0* C);
/* INTEGER_OVERFLOW_CHECKER.make */
extern T0* T213c13(void);
/* NATURAL_64.to_natural_64 */
extern T11 T11f7(T11* C);
/* NATURAL_32.to_natural_64 */
extern T11 T10f5(T10* C);
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
extern T0* T327c2(T6 a1);
/* STRING_8.has */
extern T1 T17f29(T0* C, T2 a1);
/* INTEGER_32.to_natural_64 */
extern T11 T6f21(T6* C);
/* CHARACTER_8.is_digit */
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
extern T0* T2f9(T2* C);
/* NATURAL_8.infix "|" */
extern T8 T8f3(T8* C, T8 a1);
/* SPECIAL [NATURAL_8].make */
extern T0* T257c2(T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.reset */
extern void T118f18(T0* C, T6 a1);
/* UC_UTF8_STRING.ctoi_convertor */
extern unsigned char ge2356os1267;
extern T0* ge2356ov1267;
extern T0* T206f49(T0* C);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
extern void T118f22(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
extern void T118f21(T0* C, T1 a1);
/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
extern void T118f20(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
extern void T118f19(T0* C, T0* a1);
/* STRING_TO_INTEGER_CONVERTOR.make */
extern T0* T118c16(void);
/* STRING_8.to_integer */
extern T6 T17f15(T0* C);
/* STRING_8.ctoi_convertor */
extern T0* T17f21(T0* C);
/* GEANT_EXIT_COMMAND.set_code */
extern void T449f8(T0* C, T6 a1);
/* UC_UTF8_STRING.is_integer */
extern T1 T206f46(T0* C);
/* UC_UTF8_STRING.is_valid_integer_or_natural */
extern T1 T206f48(T0* C, T6 a1);
/* STRING_TO_INTEGER_CONVERTOR.is_integral_integer */
extern T1 T118f12(T0* C);
/* STRING_8.is_integer */
extern T1 T17f14(T0* C);
/* STRING_8.is_valid_integer_or_natural */
extern T1 T17f20(T0* C, T6 a1);
/* GEANT_EXIT_TASK.attribute_value */
extern T0* T310f6(T0* C, T0* a1);
/* GEANT_EXIT_TASK.project_variables_resolver */
extern T0* T310f9(T0* C);
/* GEANT_EXIT_TASK.has_attribute */
extern T1 T310f5(T0* C, T0* a1);
/* GEANT_EXIT_TASK.code_attribute_name */
extern unsigned char ge101os8564;
extern T0* ge101ov8564;
extern T0* T310f8(T0* C);
/* GEANT_EXIT_TASK.make */
extern void T310f23p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_EXIT_TASK.make */
extern T0* T310f23p1ac1(T0* a1);
/* GEANT_EXIT_TASK.make_with_command */
extern void T310f25(T0* C, T0* a1, T0* a2);
/* GEANT_EXIT_TASK.interpreting_element_make */
extern void T310f28(T0* C, T0* a1, T0* a2);
/* GEANT_EXIT_TASK.set_project */
extern void T310f30(T0* C, T0* a1);
/* GEANT_EXIT_TASK.element_make */
extern void T310f29(T0* C, T0* a1);
/* GEANT_EXIT_TASK.set_xml_element */
extern void T310f31(T0* C, T0* a1);
/* GEANT_EXIT_TASK.set_command */
extern void T310f27(T0* C, T0* a1);
/* GEANT_EXIT_TASK.build_command */
extern void T310f24(T0* C, T0* a1);
/* GEANT_EXIT_COMMAND.make */
extern T0* T449c7(T0* a1);
/* GEANT_EXIT_COMMAND.set_project */
extern void T449f9(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_outofdate_task */
extern T0* T191f42(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.make */
extern T0* T308c28(T0* a1, T0* a2);
/* GEANT_OUTOFDATE_COMMAND.set_fileset */
extern void T446f26(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.fileset_element_name */
extern unsigned char ge114os8543;
extern T0* ge114ov8543;
extern T0* T308f10(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_variable_name */
extern void T446f25(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.variable_attribute_name */
extern unsigned char ge114os8540;
extern T0* ge114ov8540;
extern T0* T308f8(T0* C);
/* GEANT_OUTOFDATE_TASK.false_value_attribute_name */
extern unsigned char ge114os8542;
extern T0* ge114ov8542;
extern T0* T308f7(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_false_value */
extern void T446f24(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.true_value_attribute_name */
extern unsigned char ge114os8541;
extern T0* ge114ov8541;
extern T0* T308f6(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_true_value */
extern void T446f23(T0* C, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.set_target_filename */
extern void T446f22(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.target_attribute_name */
extern unsigned char ge114os8539;
extern T0* ge114ov8539;
extern T0* T308f5(T0* C);
/* GEANT_OUTOFDATE_COMMAND.set_source_filename */
extern void T446f21(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.attribute_value */
extern T0* T308f11(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.project_variables_resolver */
extern T0* T308f14(T0* C);
/* GEANT_OUTOFDATE_TASK.has_attribute */
extern T1 T308f9(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.source_attribute_name */
extern unsigned char ge114os8538;
extern T0* ge114ov8538;
extern T0* T308f12(T0* C);
/* GEANT_OUTOFDATE_TASK.make */
extern void T308f28p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_OUTOFDATE_TASK.make */
extern T0* T308f28p1ac1(T0* a1);
/* GEANT_OUTOFDATE_TASK.make_with_command */
extern void T308f30(T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.interpreting_element_make */
extern void T308f33(T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.set_project */
extern void T308f35(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.element_make */
extern void T308f34(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.set_xml_element */
extern void T308f36(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.set_command */
extern void T308f32(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.build_command */
extern void T308f29(T0* C, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.make */
extern T0* T446c20(T0* a1);
/* GEANT_OUTOFDATE_COMMAND.set_project */
extern void T446f27(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_xslt_task */
extern T0* T191f40(T0* C, T0* a1);
/* GEANT_XSLT_TASK.make */
extern T0* T306c41(T0* a1, T0* a2);
/* GEANT_XSLT_COMMAND.set_classpath */
extern void T442f38(T0* C, T0* a1);
/* GEANT_XSLT_TASK.classpath_attribute_name */
extern unsigned char ge121os8498;
extern T0* ge121ov8498;
extern T0* T306f21(T0* C);
/* GEANT_XSLT_COMMAND.set_extdirs */
extern void T442f37(T0* C, T0* a1);
/* GEANT_XSLT_TASK.extdirs_attribute_name */
extern unsigned char ge121os8497;
extern T0* ge121ov8497;
extern T0* T306f20(T0* C);
/* GEANT_XSLT_COMMAND.set_format */
extern void T442f36(T0* C, T0* a1);
/* GEANT_XSLT_TASK.format_attribute_name */
extern unsigned char ge121os8495;
extern T0* ge121ov8495;
extern T0* T306f19(T0* C);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].force_last */
extern void T443f11(T0* C, T0* a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].resize */
extern void T443f12(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]].resize */
extern T0* T521f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_PAIR [STRING_8, STRING_8]].aliased_resized_area */
extern T0* T522f2(T0* C, T6 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].new_capacity */
extern T6 T443f8(T0* C, T6 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].extendible */
extern T1 T443f6(T0* C, T6 a1);
/* DS_PAIR [STRING_8, STRING_8].make */
extern T0* T441c3(T0* a1, T0* a2);
/* GEANT_DEFINE_ELEMENT.has_value */
extern T1 T401f15(T0* C);
/* GEANT_XSLT_TASK.elements_by_name */
extern T0* T306f17(T0* C, T0* a1);
/* GEANT_XSLT_TASK.parameter_element_name */
extern unsigned char ge121os8499;
extern T0* ge121ov8499;
extern T0* T306f16(T0* C);
/* GEANT_XSLT_COMMAND.set_indent */
extern void T442f35(T0* C, T0* a1);
/* GEANT_XSLT_TASK.indent_attribute_name */
extern unsigned char ge121os8496;
extern T0* ge121ov8496;
extern T0* T306f15(T0* C);
/* GEANT_XSLT_COMMAND.set_force */
extern void T442f34(T0* C, T1 a1);
/* GEANT_XSLT_TASK.boolean_value */
extern T1 T306f14(T0* C, T0* a1);
/* GEANT_XSLT_TASK.std */
extern T0* T306f27(T0* C);
/* GEANT_XSLT_TASK.false_attribute_value */
extern T0* T306f26(T0* C);
/* GEANT_XSLT_TASK.true_attribute_value */
extern T0* T306f25(T0* C);
/* GEANT_XSLT_TASK.force_attribute_name */
extern unsigned char ge121os8489;
extern T0* ge121ov8489;
extern T0* T306f13(T0* C);
/* GEANT_XSLT_COMMAND.set_stylesheet_filename */
extern void T442f33(T0* C, T0* a1);
/* GEANT_XSLT_TASK.stylesheet_filename_attribute_name */
extern unsigned char ge121os8488;
extern T0* ge121ov8488;
extern T0* T306f12(T0* C);
/* GEANT_XSLT_COMMAND.set_output_filename */
extern void T442f32(T0* C, T0* a1);
/* GEANT_XSLT_TASK.output_filename_attribute_name */
extern unsigned char ge121os8487;
extern T0* ge121ov8487;
extern T0* T306f11(T0* C);
/* GEANT_XSLT_COMMAND.set_input_filename */
extern void T442f31(T0* C, T0* a1);
/* GEANT_XSLT_TASK.input_filename_attribute_name */
extern unsigned char ge121os8486;
extern T0* ge121ov8486;
extern T0* T306f10(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_gexslt */
extern void T442f30(T0* C);
/* GEANT_XSLT_COMMAND.set_processor */
extern void T442f40(T0* C, T6 a1);
/* GEANT_XSLT_TASK.processor_attribute_value_gexslt */
extern unsigned char ge121os8494;
extern T0* ge121ov8494;
extern T0* T306f9(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xsltproc */
extern void T442f29(T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xsltproc */
extern unsigned char ge121os8493;
extern T0* ge121ov8493;
extern T0* T306f8(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xalan_java */
extern void T442f28(T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xalan_java */
extern unsigned char ge121os8492;
extern T0* ge121ov8492;
extern T0* T306f7(T0* C);
/* GEANT_XSLT_COMMAND.set_processor_xalan_cpp */
extern void T442f27(T0* C);
/* GEANT_XSLT_TASK.processor_attribute_value_xalan_cpp */
extern unsigned char ge121os8491;
extern T0* ge121ov8491;
extern T0* T306f5(T0* C);
/* GEANT_XSLT_TASK.string_ */
extern T0* T306f24(T0* C);
/* GEANT_XSLT_TASK.attribute_value */
extern T0* T306f22(T0* C, T0* a1);
/* GEANT_XSLT_TASK.project_variables_resolver */
extern T0* T306f28(T0* C);
/* GEANT_XSLT_TASK.has_attribute */
extern T1 T306f18(T0* C, T0* a1);
/* GEANT_XSLT_TASK.processor_attribute_name */
extern unsigned char ge121os8490;
extern T0* ge121ov8490;
extern T0* T306f6(T0* C);
/* GEANT_XSLT_TASK.make */
extern void T306f41p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_XSLT_TASK.make */
extern T0* T306f41p1ac1(T0* a1);
/* GEANT_XSLT_TASK.make_with_command */
extern void T306f43(T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_TASK.interpreting_element_make */
extern void T306f46(T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_TASK.set_project */
extern void T306f48(T0* C, T0* a1);
/* GEANT_XSLT_TASK.element_make */
extern void T306f47(T0* C, T0* a1);
/* GEANT_XSLT_TASK.set_xml_element */
extern void T306f49(T0* C, T0* a1);
/* GEANT_XSLT_TASK.set_command */
extern void T306f45(T0* C, T0* a1);
/* GEANT_XSLT_TASK.build_command */
extern void T306f42(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.make */
extern T0* T442c26(T0* a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].make */
extern T0* T443c10(T6 a1);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].new_cursor */
extern T0* T443f7(T0* C);
/* DS_ARRAYED_LIST_CURSOR [DS_PAIR [STRING_8, STRING_8]].make */
extern T0* T523c3(T0* a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]].make */
extern T0* T521f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_PAIR [STRING_8, STRING_8]].make_area */
extern T0* T552c2(T6 a1);
/* SPECIAL [DS_PAIR [STRING_8, STRING_8]].make */
extern T0* T522c4(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_PAIR [STRING_8, STRING_8]].default_create */
extern T0* T521c3(void);
/* GEANT_XSLT_COMMAND.make */
extern void T442f26p1(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.set_project */
extern void T442f39(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_setenv_task */
extern T0* T191f38(T0* C, T0* a1);
/* GEANT_SETENV_TASK.make */
extern T0* T304c24(T0* a1, T0* a2);
/* GEANT_SETENV_COMMAND.set_value */
extern void T438f11(T0* C, T0* a1);
/* GEANT_SETENV_TASK.value_attribute_name */
extern unsigned char ge117os8476;
extern T0* ge117ov8476;
extern T0* T304f5(T0* C);
/* GEANT_SETENV_COMMAND.set_name */
extern void T438f10(T0* C, T0* a1);
/* GEANT_SETENV_TASK.attribute_value */
extern T0* T304f7(T0* C, T0* a1);
/* GEANT_SETENV_TASK.project_variables_resolver */
extern T0* T304f10(T0* C);
/* GEANT_SETENV_TASK.has_attribute */
extern T1 T304f6(T0* C, T0* a1);
/* GEANT_SETENV_TASK.name_attribute_name */
extern unsigned char ge117os8475;
extern T0* ge117ov8475;
extern T0* T304f9(T0* C);
/* GEANT_SETENV_TASK.make */
extern void T304f24p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_SETENV_TASK.make */
extern T0* T304f24p1ac1(T0* a1);
/* GEANT_SETENV_TASK.make_with_command */
extern void T304f26(T0* C, T0* a1, T0* a2);
/* GEANT_SETENV_TASK.interpreting_element_make */
extern void T304f29(T0* C, T0* a1, T0* a2);
/* GEANT_SETENV_TASK.set_project */
extern void T304f31(T0* C, T0* a1);
/* GEANT_SETENV_TASK.element_make */
extern void T304f30(T0* C, T0* a1);
/* GEANT_SETENV_TASK.set_xml_element */
extern void T304f32(T0* C, T0* a1);
/* GEANT_SETENV_TASK.set_command */
extern void T304f28(T0* C, T0* a1);
/* GEANT_SETENV_TASK.build_command */
extern void T304f25(T0* C, T0* a1);
/* GEANT_SETENV_COMMAND.make */
extern T0* T438c9(T0* a1);
/* GEANT_SETENV_COMMAND.set_project */
extern void T438f12(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_move_task */
extern T0* T191f36(T0* C, T0* a1);
/* GEANT_MOVE_TASK.make */
extern T0* T302c26(T0* a1, T0* a2);
/* GEANT_MOVE_COMMAND.set_fileset */
extern void T435f21(T0* C, T0* a1);
/* GEANT_MOVE_TASK.fileset_element_name */
extern unsigned char ge113os8457;
extern T0* ge113ov8457;
extern T0* T302f8(T0* C);
/* GEANT_MOVE_COMMAND.set_to_directory */
extern void T435f20(T0* C, T0* a1);
/* GEANT_MOVE_TASK.to_directory_attribute_name */
extern unsigned char ge113os8456;
extern T0* ge113ov8456;
extern T0* T302f6(T0* C);
/* GEANT_MOVE_COMMAND.set_to_file */
extern void T435f19(T0* C, T0* a1);
/* GEANT_MOVE_TASK.to_file_attribute_name */
extern unsigned char ge113os8455;
extern T0* ge113ov8455;
extern T0* T302f5(T0* C);
/* GEANT_MOVE_COMMAND.set_file */
extern void T435f18(T0* C, T0* a1);
/* GEANT_MOVE_TASK.attribute_value */
extern T0* T302f9(T0* C, T0* a1);
/* GEANT_MOVE_TASK.project_variables_resolver */
extern T0* T302f12(T0* C);
/* GEANT_MOVE_TASK.has_attribute */
extern T1 T302f7(T0* C, T0* a1);
/* GEANT_MOVE_TASK.file_attribute_name */
extern unsigned char ge113os8454;
extern T0* ge113ov8454;
extern T0* T302f10(T0* C);
/* GEANT_MOVE_TASK.make */
extern void T302f26p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_MOVE_TASK.make */
extern T0* T302f26p1ac1(T0* a1);
/* GEANT_MOVE_TASK.make_with_command */
extern void T302f28(T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_TASK.interpreting_element_make */
extern void T302f31(T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_TASK.set_project */
extern void T302f33(T0* C, T0* a1);
/* GEANT_MOVE_TASK.element_make */
extern void T302f32(T0* C, T0* a1);
/* GEANT_MOVE_TASK.set_xml_element */
extern void T302f34(T0* C, T0* a1);
/* GEANT_MOVE_TASK.set_command */
extern void T302f30(T0* C, T0* a1);
/* GEANT_MOVE_TASK.build_command */
extern void T302f27(T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.make */
extern T0* T435c17(T0* a1);
/* GEANT_MOVE_COMMAND.set_project */
extern void T435f22(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_copy_task */
extern T0* T191f34(T0* C, T0* a1);
/* GEANT_COPY_TASK.make */
extern T0* T300c31(T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.set_fileset */
extern void T432f25(T0* C, T0* a1);
/* GEANT_COPY_TASK.fileset_element_name */
extern unsigned char ge97os8434;
extern T0* ge97ov8434;
extern T0* T300f10(T0* C);
/* GEANT_COPY_COMMAND.set_force */
extern void T432f24(T0* C, T1 a1);
/* GEANT_COPY_TASK.boolean_value */
extern T1 T300f8(T0* C, T0* a1);
/* GEANT_COPY_TASK.std */
extern T0* T300f17(T0* C);
/* GEANT_COPY_TASK.false_attribute_value */
extern T0* T300f16(T0* C);
/* GEANT_COPY_TASK.true_attribute_value */
extern T0* T300f15(T0* C);
/* GEANT_COPY_TASK.string_ */
extern T0* T300f14(T0* C);
/* GEANT_COPY_TASK.force_attribute_name */
extern unsigned char ge97os8433;
extern T0* ge97ov8433;
extern T0* T300f7(T0* C);
/* GEANT_COPY_COMMAND.set_to_directory */
extern void T432f23(T0* C, T0* a1);
/* GEANT_COPY_TASK.to_directory_attribute_name */
extern unsigned char ge97os8432;
extern T0* ge97ov8432;
extern T0* T300f6(T0* C);
/* GEANT_COPY_COMMAND.set_to_file */
extern void T432f22(T0* C, T0* a1);
/* GEANT_COPY_TASK.to_file_attribute_name */
extern unsigned char ge97os8431;
extern T0* ge97ov8431;
extern T0* T300f5(T0* C);
/* GEANT_COPY_COMMAND.set_file */
extern void T432f21(T0* C, T0* a1);
/* GEANT_COPY_TASK.attribute_value */
extern T0* T300f11(T0* C, T0* a1);
/* GEANT_COPY_TASK.project_variables_resolver */
extern T0* T300f18(T0* C);
/* GEANT_COPY_TASK.has_attribute */
extern T1 T300f9(T0* C, T0* a1);
/* GEANT_COPY_TASK.file_attribute_name */
extern unsigned char ge97os8430;
extern T0* ge97ov8430;
extern T0* T300f12(T0* C);
/* GEANT_COPY_TASK.make */
extern void T300f31p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_COPY_TASK.make */
extern T0* T300f31p1ac1(T0* a1);
/* GEANT_COPY_TASK.make_with_command */
extern void T300f33(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_TASK.interpreting_element_make */
extern void T300f36(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_TASK.set_project */
extern void T300f38(T0* C, T0* a1);
/* GEANT_COPY_TASK.element_make */
extern void T300f37(T0* C, T0* a1);
/* GEANT_COPY_TASK.set_xml_element */
extern void T300f39(T0* C, T0* a1);
/* GEANT_COPY_TASK.set_command */
extern void T300f35(T0* C, T0* a1);
/* GEANT_COPY_TASK.build_command */
extern void T300f32(T0* C, T0* a1);
/* GEANT_COPY_COMMAND.make */
extern T0* T432c20(T0* a1);
/* GEANT_COPY_COMMAND.set_project */
extern void T432f26(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_delete_task */
extern T0* T191f32(T0* C, T0* a1);
/* GEANT_DELETE_TASK.make */
extern T0* T298c26(T0* a1, T0* a2);
/* GEANT_DELETE_COMMAND.set_directoryset */
extern void T428f23(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.make */
extern T0* T427c20(T0* a1, T0* a2);
/* GEANT_DIRECTORYSET.add_single_exclude */
extern void T429f27(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.exclude_element_name */
extern unsigned char ge125os9133;
extern T0* ge125ov9133;
extern T0* T427f12(T0* C);
/* GEANT_DIRECTORYSET.add_single_include */
extern void T429f26(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.elements_by_name */
extern T0* T427f11(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.string_ */
extern T0* T427f16(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.include_element_name */
extern unsigned char ge125os9132;
extern T0* ge125ov9132;
extern T0* T427f10(T0* C);
/* GEANT_DIRECTORYSET.set_concat */
extern void T429f25(T0* C, T1 a1);
/* GEANT_DIRECTORYSET_ELEMENT.boolean_value */
extern T1 T427f9(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.std */
extern T0* T427f19(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.false_attribute_value */
extern T0* T427f18(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.true_attribute_value */
extern T0* T427f17(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.concat_attribute_name */
extern unsigned char ge125os9131;
extern T0* ge125ov9131;
extern T0* T427f8(T0* C);
/* GEANT_DIRECTORYSET.set_exclude_wc_string */
extern void T429f24(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.exclude_attribute_name */
extern unsigned char ge125os9130;
extern T0* ge125ov9130;
extern T0* T427f7(T0* C);
/* GEANT_DIRECTORYSET.set_include_wc_string */
extern void T429f23(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.include_attribute_name */
extern unsigned char ge125os9129;
extern T0* ge125ov9129;
extern T0* T427f6(T0* C);
/* GEANT_DIRECTORYSET.set_directory_name */
extern void T429f22(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.attribute_value */
extern T0* T427f5(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.project_variables_resolver */
extern T0* T427f15(T0* C);
/* GEANT_DIRECTORYSET_ELEMENT.has_attribute */
extern T1 T427f14(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.directory_attribute_name */
extern unsigned char ge125os9128;
extern T0* ge125ov9128;
extern T0* T427f13(T0* C);
/* GEANT_DIRECTORYSET.make */
extern T0* T429c21(T0* a1);
/* GEANT_DIRECTORYSET.set_directory_name_variable_name */
extern void T429f28(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.make */
extern void T427f20p1(T0* C, T0* a1, T0* a2);
/* GEANT_DIRECTORYSET_ELEMENT.set_project */
extern void T427f22(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.element_make */
extern void T427f21(T0* C, T0* a1);
/* GEANT_DIRECTORYSET_ELEMENT.set_xml_element */
extern void T427f23(T0* C, T0* a1);
/* GEANT_DELETE_TASK.directoryset_element_name */
extern unsigned char ge98os8412;
extern T0* ge98ov8412;
extern T0* T298f9(T0* C);
/* GEANT_DELETE_COMMAND.set_fileset */
extern void T428f22(T0* C, T0* a1);
/* GEANT_DELETE_TASK.fileset_element_name */
extern unsigned char ge98os8411;
extern T0* ge98ov8411;
extern T0* T298f7(T0* C);
/* GEANT_DELETE_COMMAND.set_file */
extern void T428f21(T0* C, T0* a1);
/* GEANT_DELETE_TASK.file_attribute_name */
extern unsigned char ge98os8410;
extern T0* ge98ov8410;
extern T0* T298f5(T0* C);
/* GEANT_DELETE_COMMAND.set_directory */
extern void T428f20(T0* C, T0* a1);
/* GEANT_DELETE_TASK.attribute_value */
extern T0* T298f8(T0* C, T0* a1);
/* GEANT_DELETE_TASK.project_variables_resolver */
extern T0* T298f12(T0* C);
/* GEANT_DELETE_TASK.has_attribute */
extern T1 T298f6(T0* C, T0* a1);
/* GEANT_DELETE_TASK.directory_attribute_name */
extern unsigned char ge98os8409;
extern T0* ge98ov8409;
extern T0* T298f10(T0* C);
/* GEANT_DELETE_TASK.make */
extern void T298f26p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_DELETE_TASK.make */
extern T0* T298f26p1ac1(T0* a1);
/* GEANT_DELETE_TASK.make_with_command */
extern void T298f28(T0* C, T0* a1, T0* a2);
/* GEANT_DELETE_TASK.interpreting_element_make */
extern void T298f31(T0* C, T0* a1, T0* a2);
/* GEANT_DELETE_TASK.set_project */
extern void T298f33(T0* C, T0* a1);
/* GEANT_DELETE_TASK.element_make */
extern void T298f32(T0* C, T0* a1);
/* GEANT_DELETE_TASK.set_xml_element */
extern void T298f34(T0* C, T0* a1);
/* GEANT_DELETE_TASK.set_command */
extern void T298f30(T0* C, T0* a1);
/* GEANT_DELETE_TASK.build_command */
extern void T298f27(T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.make */
extern T0* T428c19(T0* a1);
/* GEANT_DELETE_COMMAND.set_project */
extern void T428f24(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_mkdir_task */
extern T0* T191f30(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.make_from_interpreting_element */
extern T0* T296c21(T0* a1);
/* Creation of agent #1 in feature GEANT_MKDIR_TASK.make_from_interpreting_element */
extern T0* T296f21ac1(T0* a1, T0* a2);
/* GEANT_MKDIR_TASK.make_from_interpreting_element */
extern void T296f21p1(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.make */
extern void T296f22(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_MKDIR_TASK.make */
extern T0* T296f22ac1(T0* a1);
/* GEANT_MKDIR_TASK.make_with_command */
extern void T296f24(T0* C, T0* a1, T0* a2);
/* GEANT_MKDIR_TASK.interpreting_element_make */
extern void T296f27(T0* C, T0* a1, T0* a2);
/* GEANT_MKDIR_TASK.set_project */
extern void T296f29(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.element_make */
extern void T296f28(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.set_xml_element */
extern void T296f30(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.set_command */
extern void T296f26(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.build_command */
extern void T296f23(T0* C, T0* a1);
/* GEANT_MKDIR_COMMAND.make */
extern T0* T424c13(T0* a1);
/* Creation of agent #1 in feature GEANT_MKDIR_COMMAND.make */
extern T0* T424f13ac1(T0* a1);
/* GEANT_MKDIR_COMMAND.create_directory */
extern void T424f14(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.recursive_create_directory */
extern void T53f38(T0* C, T0* a1);
/* KL_DIRECTORY.recursive_create_directory */
extern void T488f41(T0* C);
/* KL_UNIX_FILE_SYSTEM.canonical_pathname */
extern T0* T54f28(T0* C, T0* a1);
/* KL_PATHNAME.set_canonical */
extern void T86f18(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.canonical_pathname */
extern T0* T53f34(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.string_to_pathname */
extern T0* T53f35(T0* C, T0* a1);
/* KL_PATHNAME.set_drive */
extern void T86f21(T0* C, T0* a1);
/* KL_PATHNAME.set_sharename */
extern void T86f20(T0* C, T0* a1);
/* KL_PATHNAME.set_hostname */
extern void T86f19(T0* C, T0* a1);
/* KL_DIRECTORY.file_system */
extern T0* T488f15(T0* C);
/* KL_DIRECTORY.unix_file_system */
extern T0* T488f26(T0* C);
/* KL_DIRECTORY.windows_file_system */
extern T0* T488f25(T0* C);
/* KL_DIRECTORY.operating_system */
extern T0* T488f24(T0* C);
/* KL_DIRECTORY.create_directory */
extern void T488f45(T0* C);
/* KL_DIRECTORY.create_dir */
extern void T488f48(T0* C);
/* KL_DIRECTORY.file_mkdir */
extern void T488f49(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.recursive_create_directory */
extern void T54f34(T0* C, T0* a1);
/* GEANT_MKDIR_COMMAND.unix_file_system */
extern T0* T424f7(T0* C);
/* GEANT_MKDIR_COMMAND.file_system */
extern T0* T424f6(T0* C);
/* GEANT_MKDIR_COMMAND.windows_file_system */
extern T0* T424f9(T0* C);
/* GEANT_MKDIR_COMMAND.operating_system */
extern T0* T424f8(T0* C);
/* DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8]]].make */
extern T0* T509c2(T0* a1);
/* GEANT_MKDIR_COMMAND.make */
extern void T424f13p1(T0* C, T0* a1);
/* GEANT_MKDIR_COMMAND.set_project */
extern void T424f15(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_echo_task */
extern T0* T191f28(T0* C, T0* a1);
/* GEANT_ECHO_TASK.make_from_interpreting_element */
extern T0* T294c21(T0* a1);
/* Creation of agent #1 in feature GEANT_ECHO_TASK.make_from_interpreting_element */
extern T0* T294f21ac1(T0* a1, T0* a2);
/* Creation of agent #2 in feature GEANT_ECHO_TASK.make_from_interpreting_element */
extern T0* T294f21ac2(T0* a1, T0* a2);
/* Creation of agent #3 in feature GEANT_ECHO_TASK.make_from_interpreting_element */
extern T0* T294f21ac3(T0* a1, T0* a2);
/* GEANT_INTERPRETING_ELEMENT.attribute_or_content_value */
extern T0* T196f6(T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.exit_application */
extern void T196f17(T0* C, T6 a1, T0* a2);
/* GEANT_INTERPRETING_ELEMENT.exceptions */
extern T0* T196f11(T0* C);
/* GEANT_INTERPRETING_ELEMENT.std */
extern T0* T196f10(T0* C);
/* GEANT_INTERPRETING_ELEMENT.log_messages */
extern void T196f16(T0* C, T0* a1);
/* GEANT_INTERPRETING_ELEMENT.content */
extern T0* T196f9(T0* C);
/* GEANT_BOOLEAN_PROPERTY.set_string_value_agent */
extern void T388f13(T0* C, T0* a1);
/* GEANT_ECHO_TASK.make_from_interpreting_element */
extern void T294f21p1(T0* C, T0* a1);
/* GEANT_ECHO_TASK.make */
extern void T294f22(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_ECHO_TASK.make */
extern T0* T294f22ac1(T0* a1);
/* GEANT_ECHO_TASK.make_with_command */
extern void T294f24(T0* C, T0* a1, T0* a2);
/* GEANT_ECHO_TASK.interpreting_element_make */
extern void T294f27(T0* C, T0* a1, T0* a2);
/* GEANT_ECHO_TASK.set_project */
extern void T294f29(T0* C, T0* a1);
/* GEANT_ECHO_TASK.element_make */
extern void T294f28(T0* C, T0* a1);
/* GEANT_ECHO_TASK.set_xml_element */
extern void T294f30(T0* C, T0* a1);
/* GEANT_ECHO_TASK.set_command */
extern void T294f26(T0* C, T0* a1);
/* GEANT_ECHO_TASK.build_command */
extern void T294f23(T0* C, T0* a1);
/* GEANT_ECHO_COMMAND.make */
extern T0* T421c12(T0* a1);
/* Creation of agent #1 in feature GEANT_ECHO_COMMAND.make */
extern T0* T421f12ac1(T0* a1);
/* Creation of agent #2 in feature GEANT_ECHO_COMMAND.make */
extern T0* T421f12ac2(T0* a1);
/* GEANT_ECHO_COMMAND.write_message_to_file */
extern void T421f14(T0* C, T0* a1, T0* a2, T1 a3);
/* KL_TEXT_OUTPUT_FILE.put_line */
extern void T515f24(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.put_new_line */
extern void T515f31(T0* C);
/* KL_TEXT_OUTPUT_FILE.put_string */
extern void T515f30(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_put_string */
extern void T515f33(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.file_ps */
extern void T515f34(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_TEXT_OUTPUT_FILE.string_ */
extern T0* T515f9(T0* C);
/* KL_TEXT_OUTPUT_FILE.is_open_write */
extern T1 T515f15(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
extern T1 T515f12(T0* C);
/* GEANT_ECHO_COMMAND.write_message */
extern void T421f13(T0* C, T0* a1);
/* DS_CELL [PROCEDURE [ANY, TUPLE [STRING_8, KL_TEXT_OUTPUT_FILE, BOOLEAN]]].make */
extern T0* T514c2(T0* a1);
/* GEANT_BOOLEAN_PROPERTY.make */
extern T0* T388c12(void);
/* GEANT_ECHO_COMMAND.make */
extern void T421f12p1(T0* C, T0* a1);
/* GEANT_ECHO_COMMAND.set_project */
extern void T421f15(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_geant_task */
extern T0* T191f26(T0* C, T0* a1);
/* GEANT_GEANT_TASK.make */
extern T0* T292c36(T0* a1, T0* a2);
/* GEANT_GEANT_TASK.arguments_string_splitter */
extern T0* T292f16(T0* C);
/* GEANT_GEANT_TASK.exit_application */
extern void T292f37(T0* C, T6 a1, T0* a2);
/* GEANT_GEANT_TASK.exceptions */
extern T0* T292f18(T0* C);
/* GEANT_GEANT_TASK.std */
extern T0* T292f17(T0* C);
/* GEANT_GEANT_TASK.log_messages */
extern void T292f41(T0* C, T0* a1);
/* GEANT_GEANT_TASK.arguments_attribute_name */
extern unsigned char ge102os8357;
extern T0* ge102ov8357;
extern T0* T292f15(T0* C);
/* GEANT_GEANT_TASK.elements_by_name */
extern T0* T292f14(T0* C, T0* a1);
/* GEANT_GEANT_TASK.string_ */
extern T0* T292f21(T0* C);
/* GEANT_GEANT_TASK.argument_element_name */
extern unsigned char ge102os8356;
extern T0* ge102ov8356;
extern T0* T292f13(T0* C);
/* GEANT_GEANT_COMMAND.set_exit_code_variable_name */
extern void T417f32(T0* C, T0* a1);
/* GEANT_GEANT_TASK.exit_code_variable_attribute_name */
extern unsigned char ge102os8358;
extern T0* ge102ov8358;
extern T0* T292f12(T0* C);
/* GEANT_GEANT_TASK.fork_attribute_name */
extern unsigned char ge102os8354;
extern T0* ge102ov8354;
extern T0* T292f11(T0* C);
/* GEANT_GEANT_COMMAND.set_fileset */
extern void T417f31(T0* C, T0* a1);
/* GEANT_GEANT_TASK.fileset_element_name */
extern unsigned char ge102os8355;
extern T0* ge102ov8355;
extern T0* T292f9(T0* C);
/* GEANT_GEANT_COMMAND.set_fork */
extern void T417f30(T0* C, T1 a1);
/* GEANT_GEANT_COMMAND.set_filename */
extern void T417f29(T0* C, T0* a1);
/* GEANT_GEANT_TASK.filename_attribute_name */
extern unsigned char ge102os8351;
extern T0* ge102ov8351;
extern T0* T292f7(T0* C);
/* GEANT_GEANT_COMMAND.set_reuse_variables */
extern void T417f28(T0* C, T1 a1);
/* GEANT_GEANT_TASK.boolean_value */
extern T1 T292f6(T0* C, T0* a1);
/* GEANT_GEANT_TASK.false_attribute_value */
extern T0* T292f23(T0* C);
/* GEANT_GEANT_TASK.true_attribute_value */
extern T0* T292f22(T0* C);
/* GEANT_GEANT_TASK.reuse_variables_attribute_name */
extern unsigned char ge102os8353;
extern T0* ge102ov8353;
extern T0* T292f5(T0* C);
/* GEANT_GEANT_COMMAND.set_start_target_name */
extern void T417f27(T0* C, T0* a1);
/* GEANT_GEANT_TASK.attribute_value */
extern T0* T292f10(T0* C, T0* a1);
/* GEANT_GEANT_TASK.project_variables_resolver */
extern T0* T292f24(T0* C);
/* GEANT_GEANT_TASK.has_attribute */
extern T1 T292f8(T0* C, T0* a1);
/* GEANT_GEANT_TASK.start_target_attribute_name */
extern unsigned char ge102os8352;
extern T0* ge102ov8352;
extern T0* T292f19(T0* C);
/* GEANT_GEANT_TASK.make */
extern void T292f36p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEANT_TASK.make */
extern T0* T292f36p1ac1(T0* a1);
/* GEANT_GEANT_TASK.make_with_command */
extern void T292f39(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_TASK.interpreting_element_make */
extern void T292f43(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_TASK.set_project */
extern void T292f45(T0* C, T0* a1);
/* GEANT_GEANT_TASK.element_make */
extern void T292f44(T0* C, T0* a1);
/* GEANT_GEANT_TASK.set_xml_element */
extern void T292f46(T0* C, T0* a1);
/* GEANT_GEANT_TASK.set_command */
extern void T292f42(T0* C, T0* a1);
/* GEANT_GEANT_TASK.build_command */
extern void T292f38(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.make */
extern T0* T417c26(T0* a1);
/* GEANT_GEANT_COMMAND.make */
extern void T417f26p1(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.set_project */
extern void T417f33(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_getest_task */
extern T0* T191f24(T0* C, T0* a1);
/* GEANT_GETEST_TASK.make */
extern T0* T290c39(T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force */
extern void T81f55(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_put */
extern void T81f64(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_put */
extern void T81f63(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_put */
extern void T81f62(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_item */
extern T6 T81f34(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_item */
extern T6 T81f37(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].hash_position */
extern T6 T81f32(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].resize */
extern void T81f61(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_resize */
extern void T81f70(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_resize */
extern void T81f69(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_resize */
extern void T81f68(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_item */
extern T0* T81f30(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].slots_resize */
extern void T81f67(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_capacity */
extern T6 T81f31(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_put */
extern void T81f60(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].search_position */
extern void T81f59(T0* C, T0* a1);
/* GEANT_GETEST_TASK.define_element_name */
extern unsigned char ge106os8322;
extern T0* ge106ov8322;
extern T0* T290f20(T0* C);
/* GEANT_GETEST_TASK.true_attribute_value */
extern T0* T290f19(T0* C);
/* GEANT_GETEST_TASK.string_ */
extern T0* T290f18(T0* C);
/* GEANT_GETEST_TASK.elements_by_name */
extern T0* T290f16(T0* C, T0* a1);
/* GEANT_GETEST_TASK.attribute_element_name */
extern unsigned char ge106os8321;
extern T0* ge106ov8321;
extern T0* T290f15(T0* C);
/* GEANT_GETEST_COMMAND.set_abort */
extern void T414f32(T0* C, T1 a1);
/* GEANT_GETEST_TASK.abort_attribute_name */
extern unsigned char ge106os8320;
extern T0* ge106ov8320;
extern T0* T290f14(T0* C);
/* GEANT_GETEST_COMMAND.set_execution */
extern void T414f31(T0* C, T1 a1);
/* GEANT_GETEST_TASK.execution_attribute_name */
extern unsigned char ge106os8319;
extern T0* ge106ov8319;
extern T0* T290f13(T0* C);
/* GEANT_GETEST_COMMAND.set_compilation */
extern void T414f30(T0* C, T1 a1);
/* GEANT_GETEST_TASK.compilation_attribute_name */
extern unsigned char ge106os8318;
extern T0* ge106ov8318;
extern T0* T290f12(T0* C);
/* GEANT_GETEST_COMMAND.set_generation */
extern void T414f29(T0* C, T1 a1);
/* GEANT_GETEST_TASK.generation_attribute_name */
extern unsigned char ge106os8317;
extern T0* ge106ov8317;
extern T0* T290f11(T0* C);
/* GEANT_GETEST_COMMAND.set_default_test_included */
extern void T414f28(T0* C, T1 a1);
/* GEANT_GETEST_TASK.default_test_attribute_name */
extern unsigned char ge106os8316;
extern T0* ge106ov8316;
extern T0* T290f10(T0* C);
/* GEANT_GETEST_COMMAND.set_feature_regexp */
extern void T414f27(T0* C, T0* a1);
/* GEANT_GETEST_TASK.feature_attribute_name */
extern unsigned char ge106os8315;
extern T0* ge106ov8315;
extern T0* T290f9(T0* C);
/* GEANT_GETEST_COMMAND.set_class_regexp */
extern void T414f26(T0* C, T0* a1);
/* GEANT_GETEST_TASK.class_attribute_name */
extern unsigned char ge106os8314;
extern T0* ge106ov8314;
extern T0* T290f8(T0* C);
/* GEANT_GETEST_COMMAND.set_compile */
extern void T414f25(T0* C, T0* a1);
/* GEANT_GETEST_TASK.compile_attribute_name */
extern unsigned char ge106os8313;
extern T0* ge106ov8313;
extern T0* T290f7(T0* C);
/* GEANT_GETEST_COMMAND.set_config_filename */
extern void T414f24(T0* C, T0* a1);
/* GEANT_GETEST_TASK.attribute_value */
extern T0* T290f6(T0* C, T0* a1);
/* GEANT_GETEST_TASK.project_variables_resolver */
extern T0* T290f24(T0* C);
/* GEANT_GETEST_TASK.config_filename_attribute_name */
extern unsigned char ge106os8312;
extern T0* ge106ov8312;
extern T0* T290f5(T0* C);
/* GEANT_GETEST_COMMAND.set_verbose */
extern void T414f23(T0* C, T1 a1);
/* GEANT_GETEST_TASK.boolean_value */
extern T1 T290f23(T0* C, T0* a1);
/* GEANT_GETEST_TASK.std */
extern T0* T290f26(T0* C);
/* GEANT_GETEST_TASK.false_attribute_value */
extern T0* T290f25(T0* C);
/* GEANT_GETEST_TASK.has_attribute */
extern T1 T290f17(T0* C, T0* a1);
/* GEANT_GETEST_TASK.verbose_attribute_name */
extern unsigned char ge106os8311;
extern T0* ge106ov8311;
extern T0* T290f21(T0* C);
/* GEANT_GETEST_TASK.make */
extern void T290f39p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GETEST_TASK.make */
extern T0* T290f39p1ac1(T0* a1);
/* GEANT_GETEST_TASK.make_with_command */
extern void T290f41(T0* C, T0* a1, T0* a2);
/* GEANT_GETEST_TASK.interpreting_element_make */
extern void T290f44(T0* C, T0* a1, T0* a2);
/* GEANT_GETEST_TASK.set_project */
extern void T290f46(T0* C, T0* a1);
/* GEANT_GETEST_TASK.element_make */
extern void T290f45(T0* C, T0* a1);
/* GEANT_GETEST_TASK.set_xml_element */
extern void T290f47(T0* C, T0* a1);
/* GEANT_GETEST_TASK.set_command */
extern void T290f43(T0* C, T0* a1);
/* GEANT_GETEST_TASK.build_command */
extern void T290f40(T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.make */
extern T0* T414c22(T0* a1);
/* GEANT_GETEST_COMMAND.make */
extern void T414f22p1(T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.set_project */
extern void T414f33(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_gepp_task */
extern T0* T191f22(T0* C, T0* a1);
/* GEANT_GEPP_TASK.make */
extern T0* T288c34(T0* a1, T0* a2);
/* GEANT_GEPP_COMMAND.set_fileset */
extern void T411f27(T0* C, T0* a1);
/* GEANT_GEPP_TASK.fileset_element_name */
extern unsigned char ge105os8286;
extern T0* ge105ov8286;
extern T0* T288f14(T0* C);
/* GEANT_GEPP_COMMAND.set_force */
extern void T411f26(T0* C, T1 a1);
/* GEANT_GEPP_TASK.force_attribute_name */
extern unsigned char ge105os8285;
extern T0* ge105ov8285;
extern T0* T288f12(T0* C);
/* GEANT_GEPP_COMMAND.set_to_directory */
extern void T411f25(T0* C, T0* a1);
/* GEANT_GEPP_TASK.to_directory_attribute_name */
extern unsigned char ge105os8284;
extern T0* ge105ov8284;
extern T0* T288f11(T0* C);
/* GEANT_GEPP_TASK.elements_by_name */
extern T0* T288f9(T0* C, T0* a1);
/* GEANT_GEPP_TASK.string_ */
extern T0* T288f17(T0* C);
/* GEANT_GEPP_TASK.define_element_name */
extern unsigned char ge105os8283;
extern T0* ge105ov8283;
extern T0* T288f8(T0* C);
/* GEANT_GEPP_COMMAND.set_empty_lines */
extern void T411f24(T0* C, T1 a1);
/* GEANT_GEPP_TASK.boolean_value */
extern T1 T288f7(T0* C, T0* a1);
/* GEANT_GEPP_TASK.std */
extern T0* T288f20(T0* C);
/* GEANT_GEPP_TASK.false_attribute_value */
extern T0* T288f19(T0* C);
/* GEANT_GEPP_TASK.true_attribute_value */
extern T0* T288f18(T0* C);
/* GEANT_GEPP_TASK.lines_attribute_name */
extern unsigned char ge105os8282;
extern T0* ge105ov8282;
extern T0* T288f6(T0* C);
/* GEANT_GEPP_COMMAND.set_output_filename */
extern void T411f23(T0* C, T0* a1);
/* GEANT_GEPP_TASK.output_filename_attribute_name */
extern unsigned char ge105os8281;
extern T0* ge105ov8281;
extern T0* T288f5(T0* C);
/* GEANT_GEPP_COMMAND.set_input_filename */
extern void T411f22(T0* C, T0* a1);
/* GEANT_GEPP_TASK.attribute_value */
extern T0* T288f13(T0* C, T0* a1);
/* GEANT_GEPP_TASK.project_variables_resolver */
extern T0* T288f21(T0* C);
/* GEANT_GEPP_TASK.has_attribute */
extern T1 T288f10(T0* C, T0* a1);
/* GEANT_GEPP_TASK.input_filename_attribute_name */
extern unsigned char ge105os8280;
extern T0* ge105ov8280;
extern T0* T288f15(T0* C);
/* GEANT_GEPP_TASK.make */
extern void T288f34p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEPP_TASK.make */
extern T0* T288f34p1ac1(T0* a1);
/* GEANT_GEPP_TASK.make_with_command */
extern void T288f36(T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_TASK.interpreting_element_make */
extern void T288f39(T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_TASK.set_project */
extern void T288f41(T0* C, T0* a1);
/* GEANT_GEPP_TASK.element_make */
extern void T288f40(T0* C, T0* a1);
/* GEANT_GEPP_TASK.set_xml_element */
extern void T288f42(T0* C, T0* a1);
/* GEANT_GEPP_TASK.set_command */
extern void T288f38(T0* C, T0* a1);
/* GEANT_GEPP_TASK.build_command */
extern void T288f35(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.make */
extern T0* T411c21(T0* a1);
/* GEANT_GEPP_COMMAND.make */
extern void T411f21p1(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.set_project */
extern void T411f28(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_geyacc_task */
extern T0* T191f20(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.make */
extern T0* T286c34(T0* a1, T0* a2);
/* GEANT_GEYACC_COMMAND.set_input_filename */
extern void T408f27(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.input_filename_attribute_name */
extern unsigned char ge108os8255;
extern T0* ge108ov8255;
extern T0* T286f12(T0* C);
/* GEANT_GEYACC_COMMAND.set_output_filename */
extern void T408f26(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.output_filename_attribute_name */
extern unsigned char ge108os8254;
extern T0* ge108ov8254;
extern T0* T286f11(T0* C);
/* GEANT_GEYACC_COMMAND.set_tokens_filename */
extern void T408f25(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.tokens_filename_attribute_name */
extern unsigned char ge108os8253;
extern T0* ge108ov8253;
extern T0* T286f10(T0* C);
/* GEANT_GEYACC_COMMAND.set_tokens_classname */
extern void T408f24(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.tokens_classname_attribute_name */
extern unsigned char ge108os8252;
extern T0* ge108ov8252;
extern T0* T286f9(T0* C);
/* GEANT_GEYACC_COMMAND.set_new_typing */
extern void T408f23(T0* C, T1 a1);
/* GEANT_GEYACC_TASK.new_typing_attribute_name */
extern unsigned char ge108os8257;
extern T0* ge108ov8257;
extern T0* T286f8(T0* C);
/* GEANT_GEYACC_COMMAND.set_old_typing */
extern void T408f22(T0* C, T1 a1);
/* GEANT_GEYACC_TASK.old_typing_attribute_name */
extern unsigned char ge108os8256;
extern T0* ge108ov8256;
extern T0* T286f7(T0* C);
/* GEANT_GEYACC_COMMAND.set_verbose_filename */
extern void T408f21(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.attribute_value */
extern T0* T286f6(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.project_variables_resolver */
extern T0* T286f17(T0* C);
/* GEANT_GEYACC_TASK.verbose_filename_attribute_name */
extern unsigned char ge108os8251;
extern T0* ge108ov8251;
extern T0* T286f5(T0* C);
/* GEANT_GEYACC_COMMAND.set_separate_actions */
extern void T408f20(T0* C, T1 a1);
/* GEANT_GEYACC_TASK.boolean_value */
extern T1 T286f16(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.std */
extern T0* T286f21(T0* C);
/* GEANT_GEYACC_TASK.false_attribute_value */
extern T0* T286f20(T0* C);
/* GEANT_GEYACC_TASK.true_attribute_value */
extern T0* T286f19(T0* C);
/* GEANT_GEYACC_TASK.string_ */
extern T0* T286f18(T0* C);
/* GEANT_GEYACC_TASK.has_attribute */
extern T1 T286f13(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.separate_actions_attribute_name */
extern unsigned char ge108os8250;
extern T0* ge108ov8250;
extern T0* T286f14(T0* C);
/* GEANT_GEYACC_TASK.make */
extern void T286f34p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEYACC_TASK.make */
extern T0* T286f34p1ac1(T0* a1);
/* GEANT_GEYACC_TASK.make_with_command */
extern void T286f36(T0* C, T0* a1, T0* a2);
/* GEANT_GEYACC_TASK.interpreting_element_make */
extern void T286f39(T0* C, T0* a1, T0* a2);
/* GEANT_GEYACC_TASK.set_project */
extern void T286f41(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.element_make */
extern void T286f40(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.set_xml_element */
extern void T286f42(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.set_command */
extern void T286f38(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.build_command */
extern void T286f35(T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.make */
extern T0* T408c19(T0* a1);
/* GEANT_GEYACC_COMMAND.make */
extern void T408f19p1(T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.set_project */
extern void T408f28(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_gelex_task */
extern T0* T191f18(T0* C, T0* a1);
/* GEANT_GELEX_TASK.make */
extern T0* T284c37(T0* a1, T0* a2);
/* GEANT_GELEX_COMMAND.set_input_filename */
extern void T405f33(T0* C, T0* a1);
/* GEANT_GELEX_TASK.input_filename_attribute_name */
extern unsigned char ge104os8221;
extern T0* ge104ov8221;
extern T0* T284f15(T0* C);
/* GEANT_GELEX_COMMAND.set_output_filename */
extern void T405f32(T0* C, T0* a1);
/* GEANT_GELEX_TASK.output_filename_attribute_name */
extern unsigned char ge104os8220;
extern T0* ge104ov8220;
extern T0* T284f14(T0* C);
/* GEANT_GELEX_COMMAND.set_separate_actions */
extern void T405f31(T0* C, T1 a1);
/* GEANT_GELEX_TASK.separate_actions_attribute_name */
extern unsigned char ge104os8219;
extern T0* ge104ov8219;
extern T0* T284f13(T0* C);
/* GEANT_GELEX_COMMAND.set_no_warn */
extern void T405f30(T0* C, T1 a1);
/* GEANT_GELEX_TASK.no_warn_attribute_name */
extern unsigned char ge104os8218;
extern T0* ge104ov8218;
extern T0* T284f12(T0* C);
/* GEANT_GELEX_COMMAND.set_no_default */
extern void T405f29(T0* C, T1 a1);
/* GEANT_GELEX_TASK.no_default_attribute_name */
extern unsigned char ge104os8217;
extern T0* ge104ov8217;
extern T0* T284f11(T0* C);
/* GEANT_GELEX_COMMAND.set_meta_ecs */
extern void T405f28(T0* C, T1 a1);
/* GEANT_GELEX_TASK.meta_ecs_attribute_name */
extern unsigned char ge104os8216;
extern T0* ge104ov8216;
extern T0* T284f10(T0* C);
/* GEANT_GELEX_COMMAND.set_case_insensitive */
extern void T405f27(T0* C, T1 a1);
/* GEANT_GELEX_TASK.case_insensitive_attribute_name */
extern unsigned char ge104os8215;
extern T0* ge104ov8215;
extern T0* T284f9(T0* C);
/* GEANT_GELEX_COMMAND.set_full */
extern void T405f26(T0* C, T1 a1);
/* GEANT_GELEX_TASK.full_attribute_name */
extern unsigned char ge104os8214;
extern T0* ge104ov8214;
extern T0* T284f8(T0* C);
/* GEANT_GELEX_COMMAND.set_ecs */
extern void T405f25(T0* C, T1 a1);
/* GEANT_GELEX_TASK.ecs_attribute_name */
extern unsigned char ge104os8213;
extern T0* ge104ov8213;
extern T0* T284f7(T0* C);
/* GEANT_GELEX_COMMAND.set_backup */
extern void T405f24(T0* C, T1 a1);
/* GEANT_GELEX_TASK.boolean_value */
extern T1 T284f6(T0* C, T0* a1);
/* GEANT_GELEX_TASK.std */
extern T0* T284f23(T0* C);
/* GEANT_GELEX_TASK.false_attribute_value */
extern T0* T284f22(T0* C);
/* GEANT_GELEX_TASK.true_attribute_value */
extern T0* T284f21(T0* C);
/* GEANT_GELEX_TASK.string_ */
extern T0* T284f20(T0* C);
/* GEANT_GELEX_TASK.backup_attribute_name */
extern unsigned char ge104os8212;
extern T0* ge104ov8212;
extern T0* T284f5(T0* C);
/* GEANT_GELEX_COMMAND.set_size */
extern void T405f23(T0* C, T0* a1);
/* GEANT_GELEX_TASK.attribute_value */
extern T0* T284f17(T0* C, T0* a1);
/* GEANT_GELEX_TASK.project_variables_resolver */
extern T0* T284f24(T0* C);
/* GEANT_GELEX_TASK.has_attribute */
extern T1 T284f16(T0* C, T0* a1);
/* GEANT_GELEX_TASK.size_attribute_name */
extern unsigned char ge104os8211;
extern T0* ge104ov8211;
extern T0* T284f19(T0* C);
/* GEANT_GELEX_TASK.make */
extern void T284f37p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GELEX_TASK.make */
extern T0* T284f37p1ac1(T0* a1);
/* GEANT_GELEX_TASK.make_with_command */
extern void T284f39(T0* C, T0* a1, T0* a2);
/* GEANT_GELEX_TASK.interpreting_element_make */
extern void T284f42(T0* C, T0* a1, T0* a2);
/* GEANT_GELEX_TASK.set_project */
extern void T284f44(T0* C, T0* a1);
/* GEANT_GELEX_TASK.element_make */
extern void T284f43(T0* C, T0* a1);
/* GEANT_GELEX_TASK.set_xml_element */
extern void T284f45(T0* C, T0* a1);
/* GEANT_GELEX_TASK.set_command */
extern void T284f41(T0* C, T0* a1);
/* GEANT_GELEX_TASK.build_command */
extern void T284f38(T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.make */
extern T0* T405c22(T0* a1);
/* GEANT_GELEX_COMMAND.make */
extern void T405f22p1(T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.set_project */
extern void T405f34(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_gexace_task */
extern T0* T191f16(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.make */
extern T0* T282c35(T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force_last */
extern void T81f54(T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.elements_by_name */
extern T0* T282f13(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.string_ */
extern T0* T282f19(T0* C);
/* GEANT_GEXACE_TASK.define_element_name */
extern unsigned char ge107os8185;
extern T0* ge107ov8185;
extern T0* T282f12(T0* C);
/* GEANT_GEXACE_COMMAND.set_output_filename */
extern void T402f30(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.output_filename_attribute_name */
extern unsigned char ge107os8184;
extern T0* ge107ov8184;
extern T0* T282f11(T0* C);
/* GEANT_GEXACE_COMMAND.set_xace_filename */
extern void T402f29(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.xace_filename_attribute_name */
extern unsigned char ge107os8183;
extern T0* ge107ov8183;
extern T0* T282f10(T0* C);
/* GEANT_GEXACE_COMMAND.set_format */
extern void T402f28(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.format_attribute_name */
extern unsigned char ge107os8182;
extern T0* ge107ov8182;
extern T0* T282f9(T0* C);
/* GEANT_GEXACE_COMMAND.set_library_command */
extern void T402f27(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.library_attribute_name */
extern unsigned char ge107os8181;
extern T0* ge107ov8181;
extern T0* T282f8(T0* C);
/* GEANT_GEXACE_COMMAND.set_system_command */
extern void T402f26(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.attribute_value */
extern T0* T282f7(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.project_variables_resolver */
extern T0* T282f18(T0* C);
/* GEANT_GEXACE_TASK.system_attribute_name */
extern unsigned char ge107os8180;
extern T0* ge107ov8180;
extern T0* T282f6(T0* C);
/* GEANT_GEXACE_COMMAND.set_validate_command */
extern void T402f25(T0* C, T1 a1);
/* GEANT_GEXACE_TASK.validate_attribute_name */
extern unsigned char ge107os8179;
extern T0* ge107ov8179;
extern T0* T282f5(T0* C);
/* GEANT_GEXACE_COMMAND.set_verbose */
extern void T402f24(T0* C, T1 a1);
/* GEANT_GEXACE_TASK.boolean_value */
extern T1 T282f17(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.std */
extern T0* T282f22(T0* C);
/* GEANT_GEXACE_TASK.false_attribute_value */
extern T0* T282f21(T0* C);
/* GEANT_GEXACE_TASK.true_attribute_value */
extern T0* T282f20(T0* C);
/* GEANT_GEXACE_TASK.has_attribute */
extern T1 T282f14(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.verbose_attribute_name */
extern unsigned char ge107os8178;
extern T0* ge107ov8178;
extern T0* T282f15(T0* C);
/* GEANT_GEXACE_TASK.make */
extern void T282f35p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEXACE_TASK.make */
extern T0* T282f35p1ac1(T0* a1);
/* GEANT_GEXACE_TASK.make_with_command */
extern void T282f37(T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.interpreting_element_make */
extern void T282f40(T0* C, T0* a1, T0* a2);
/* GEANT_GEXACE_TASK.set_project */
extern void T282f42(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.element_make */
extern void T282f41(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.set_xml_element */
extern void T282f43(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.set_command */
extern void T282f39(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.build_command */
extern void T282f36(T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.make */
extern T0* T402c23(T0* a1);
/* GEANT_GEXACE_COMMAND.make */
extern void T402f23p1(T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.set_project */
extern void T402f31(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_unset_task */
extern T0* T191f14(T0* C, T0* a1);
/* GEANT_UNSET_TASK.make */
extern T0* T280c23(T0* a1, T0* a2);
/* GEANT_UNSET_COMMAND.set_name */
extern void T398f8(T0* C, T0* a1);
/* GEANT_UNSET_TASK.attribute_value */
extern T0* T280f6(T0* C, T0* a1);
/* GEANT_UNSET_TASK.project_variables_resolver */
extern T0* T280f9(T0* C);
/* GEANT_UNSET_TASK.has_attribute */
extern T1 T280f5(T0* C, T0* a1);
/* GEANT_UNSET_TASK.name_attribute_name */
extern unsigned char ge120os8170;
extern T0* ge120ov8170;
extern T0* T280f8(T0* C);
/* GEANT_UNSET_TASK.make */
extern void T280f23p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_UNSET_TASK.make */
extern T0* T280f23p1ac1(T0* a1);
/* GEANT_UNSET_TASK.make_with_command */
extern void T280f25(T0* C, T0* a1, T0* a2);
/* GEANT_UNSET_TASK.interpreting_element_make */
extern void T280f28(T0* C, T0* a1, T0* a2);
/* GEANT_UNSET_TASK.set_project */
extern void T280f30(T0* C, T0* a1);
/* GEANT_UNSET_TASK.element_make */
extern void T280f29(T0* C, T0* a1);
/* GEANT_UNSET_TASK.set_xml_element */
extern void T280f31(T0* C, T0* a1);
/* GEANT_UNSET_TASK.set_command */
extern void T280f27(T0* C, T0* a1);
/* GEANT_UNSET_TASK.build_command */
extern void T280f24(T0* C, T0* a1);
/* GEANT_UNSET_COMMAND.make */
extern T0* T398c7(T0* a1);
/* GEANT_UNSET_COMMAND.set_project */
extern void T398f9(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_set_task */
extern T0* T191f12(T0* C, T0* a1);
/* GEANT_SET_TASK.make */
extern T0* T278c24(T0* a1, T0* a2);
/* GEANT_SET_COMMAND.set_value */
extern void T395f15(T0* C, T0* a1);
/* GEANT_SET_TASK.value_attribute_name */
extern unsigned char ge118os8160;
extern T0* ge118ov8160;
extern T0* T278f5(T0* C);
/* GEANT_SET_COMMAND.set_name */
extern void T395f14(T0* C, T0* a1);
/* GEANT_SET_TASK.attribute_value */
extern T0* T278f7(T0* C, T0* a1);
/* GEANT_SET_TASK.project_variables_resolver */
extern T0* T278f10(T0* C);
/* GEANT_SET_TASK.has_attribute */
extern T1 T278f6(T0* C, T0* a1);
/* GEANT_SET_TASK.name_attribute_name */
extern unsigned char ge118os8159;
extern T0* ge118ov8159;
extern T0* T278f9(T0* C);
/* GEANT_SET_TASK.make */
extern void T278f24p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_SET_TASK.make */
extern T0* T278f24p1ac1(T0* a1);
/* GEANT_SET_TASK.make_with_command */
extern void T278f26(T0* C, T0* a1, T0* a2);
/* GEANT_SET_TASK.interpreting_element_make */
extern void T278f29(T0* C, T0* a1, T0* a2);
/* GEANT_SET_TASK.set_project */
extern void T278f31(T0* C, T0* a1);
/* GEANT_SET_TASK.element_make */
extern void T278f30(T0* C, T0* a1);
/* GEANT_SET_TASK.set_xml_element */
extern void T278f32(T0* C, T0* a1);
/* GEANT_SET_TASK.set_command */
extern void T278f28(T0* C, T0* a1);
/* GEANT_SET_TASK.build_command */
extern void T278f25(T0* C, T0* a1);
/* GEANT_SET_COMMAND.make */
extern T0* T395c13(T0* a1);
/* GEANT_SET_COMMAND.set_project */
extern void T395f16(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_lcc_task */
extern T0* T191f10(T0* C, T0* a1);
/* GEANT_LCC_TASK.make */
extern T0* T276c24(T0* a1, T0* a2);
/* GEANT_LCC_COMMAND.set_source_filename */
extern void T392f15(T0* C, T0* a1);
/* GEANT_LCC_TASK.source_filename_attribute_name */
extern unsigned char ge111os8149;
extern T0* ge111ov8149;
extern T0* T276f5(T0* C);
/* GEANT_LCC_COMMAND.set_executable */
extern void T392f14(T0* C, T0* a1);
/* GEANT_LCC_TASK.attribute_value */
extern T0* T276f7(T0* C, T0* a1);
/* GEANT_LCC_TASK.project_variables_resolver */
extern T0* T276f10(T0* C);
/* GEANT_LCC_TASK.has_attribute */
extern T1 T276f6(T0* C, T0* a1);
/* GEANT_LCC_TASK.executable_attribute_name */
extern unsigned char ge111os8148;
extern T0* ge111ov8148;
extern T0* T276f9(T0* C);
/* GEANT_LCC_TASK.make */
extern void T276f24p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_LCC_TASK.make */
extern T0* T276f24p1ac1(T0* a1);
/* GEANT_LCC_TASK.make_with_command */
extern void T276f26(T0* C, T0* a1, T0* a2);
/* GEANT_LCC_TASK.interpreting_element_make */
extern void T276f29(T0* C, T0* a1, T0* a2);
/* GEANT_LCC_TASK.set_project */
extern void T276f31(T0* C, T0* a1);
/* GEANT_LCC_TASK.element_make */
extern void T276f30(T0* C, T0* a1);
/* GEANT_LCC_TASK.set_xml_element */
extern void T276f32(T0* C, T0* a1);
/* GEANT_LCC_TASK.set_command */
extern void T276f28(T0* C, T0* a1);
/* GEANT_LCC_TASK.build_command */
extern void T276f25(T0* C, T0* a1);
/* GEANT_LCC_COMMAND.make */
extern T0* T392c13(T0* a1);
/* GEANT_LCC_COMMAND.set_project */
extern void T392f16(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_exec_task */
extern T0* T191f8(T0* C, T0* a1);
/* GEANT_EXEC_TASK.make_from_interpreting_element */
extern T0* T274c22(T0* a1);
/* Creation of agent #1 in feature GEANT_EXEC_TASK.make_from_interpreting_element */
extern T0* T274f22ac1(T0* a1, T0* a2);
/* Creation of agent #2 in feature GEANT_EXEC_TASK.make_from_interpreting_element */
extern T0* T274f22ac2(T0* a1, T0* a2);
/* Creation of agent #3 in feature GEANT_EXEC_TASK.make_from_interpreting_element */
extern T0* T274f22ac3(T0* a1, T0* a2);
/* GEANT_EXEC_COMMAND.set_fileset */
extern void T384f14(T0* C, T0* a1);
/* GEANT_EXEC_TASK.fileset_element_name */
extern unsigned char ge100os8135;
extern T0* ge100ov8135;
extern T0* T274f5(T0* C);
/* GEANT_EXEC_TASK.make_from_interpreting_element */
extern void T274f22p1(T0* C, T0* a1);
/* GEANT_EXEC_TASK.make */
extern void T274f23(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_EXEC_TASK.make */
extern T0* T274f23ac1(T0* a1);
/* GEANT_EXEC_TASK.make_with_command */
extern void T274f25(T0* C, T0* a1, T0* a2);
/* GEANT_EXEC_TASK.interpreting_element_make */
extern void T274f28(T0* C, T0* a1, T0* a2);
/* GEANT_EXEC_TASK.set_project */
extern void T274f30(T0* C, T0* a1);
/* GEANT_EXEC_TASK.element_make */
extern void T274f29(T0* C, T0* a1);
/* GEANT_EXEC_TASK.set_xml_element */
extern void T274f31(T0* C, T0* a1);
/* GEANT_EXEC_TASK.set_command */
extern void T274f27(T0* C, T0* a1);
/* GEANT_EXEC_TASK.build_command */
extern void T274f24(T0* C, T0* a1);
/* GEANT_EXEC_COMMAND.make */
extern T0* T384c13(T0* a1);
/* GEANT_EXEC_COMMAND.make */
extern void T384f13p1(T0* C, T0* a1);
/* GEANT_EXEC_COMMAND.set_project */
extern void T384f15(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_ise_task */
extern T0* T191f6(T0* C, T0* a1);
/* GEANT_ISE_TASK.make */
extern T0* T272c33(T0* a1, T0* a2);
/* GEANT_ISE_COMMAND.set_exit_code_variable_name */
extern void T380f25(T0* C, T0* a1);
/* GEANT_ISE_TASK.attribute_value */
extern T0* T272f11(T0* C, T0* a1);
/* GEANT_ISE_TASK.project_variables_resolver */
extern T0* T272f20(T0* C);
/* GEANT_ISE_TASK.exit_code_variable_attribute_name */
extern unsigned char ge110os8113;
extern T0* ge110ov8113;
extern T0* T272f10(T0* C);
/* GEANT_ISE_COMMAND.set_finish_freezing */
extern void T380f24(T0* C, T1 a1);
/* GEANT_ISE_TASK.finish_freezing_attribute_name */
extern unsigned char ge110os8111;
extern T0* ge110ov8111;
extern T0* T272f9(T0* C);
/* GEANT_ISE_COMMAND.set_finalize_mode */
extern void T380f23(T0* C, T1 a1);
/* GEANT_ISE_TASK.boolean_value */
extern T1 T272f8(T0* C, T0* a1);
/* GEANT_ISE_TASK.std */
extern T0* T272f19(T0* C);
/* GEANT_ISE_TASK.false_attribute_value */
extern T0* T272f18(T0* C);
/* GEANT_ISE_TASK.true_attribute_value */
extern T0* T272f17(T0* C);
/* GEANT_ISE_TASK.string_ */
extern T0* T272f16(T0* C);
/* GEANT_ISE_TASK.finalize_attribute_name */
extern unsigned char ge110os8110;
extern T0* ge110ov8110;
extern T0* T272f7(T0* C);
/* GEANT_ISE_COMMAND.set_clean */
extern void T380f22(T0* C, T0* a1);
/* GEANT_ISE_TASK.clean_attribute_name */
extern unsigned char ge110os8112;
extern T0* ge110ov8112;
extern T0* T272f6(T0* C);
/* GEANT_ISE_COMMAND.set_system_name */
extern void T380f21(T0* C, T0* a1);
/* GEANT_ISE_TASK.system_attribute_name */
extern unsigned char ge110os8109;
extern T0* ge110ov8109;
extern T0* T272f5(T0* C);
/* GEANT_ISE_COMMAND.set_ace_filename */
extern void T380f20(T0* C, T0* a1);
/* GEANT_ISE_TASK.attribute_value_or_default */
extern T0* T272f13(T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.has_attribute */
extern T1 T272f12(T0* C, T0* a1);
/* GEANT_ISE_TASK.ace_attribute_name */
extern unsigned char ge110os8108;
extern T0* ge110ov8108;
extern T0* T272f15(T0* C);
/* GEANT_ISE_TASK.make */
extern void T272f33p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_ISE_TASK.make */
extern T0* T272f33p1ac1(T0* a1);
/* GEANT_ISE_TASK.make_with_command */
extern void T272f35(T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.interpreting_element_make */
extern void T272f38(T0* C, T0* a1, T0* a2);
/* GEANT_ISE_TASK.set_project */
extern void T272f40(T0* C, T0* a1);
/* GEANT_ISE_TASK.element_make */
extern void T272f39(T0* C, T0* a1);
/* GEANT_ISE_TASK.set_xml_element */
extern void T272f41(T0* C, T0* a1);
/* GEANT_ISE_TASK.set_command */
extern void T272f37(T0* C, T0* a1);
/* GEANT_ISE_TASK.build_command */
extern void T272f34(T0* C, T0* a1);
/* GEANT_ISE_COMMAND.make */
extern T0* T380c19(T0* a1);
/* GEANT_ISE_COMMAND.set_project */
extern void T380f26(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.new_gec_task */
extern T0* T191f4(T0* C, T0* a1);
/* GEANT_GEC_TASK.make */
extern T0* T265c36(T0* a1, T0* a2);
/* GEANT_GEC_COMMAND.set_exit_code_variable_name */
extern void T376f33(T0* C, T0* a1);
/* GEANT_GEC_TASK.exit_code_variable_attribute_name */
extern unsigned char ge103os8048;
extern T0* ge103ov8048;
extern T0* T265f14(T0* C);
/* GEANT_GEC_COMMAND.set_garbage_collector */
extern void T376f32(T0* C, T0* a1);
/* GEANT_GEC_TASK.gc_attribute_name */
extern unsigned char ge103os8050;
extern T0* ge103ov8050;
extern T0* T265f13(T0* C);
/* GEANT_GEC_COMMAND.set_split_size */
extern void T376f31(T0* C, T6 a1);
/* GEANT_GEC_TASK.split_size_attribute_name */
extern unsigned char ge103os8052;
extern T0* ge103ov8052;
extern T0* T265f12(T0* C);
/* GEANT_GEC_COMMAND.set_split_mode */
extern void T376f30(T0* C, T1 a1);
/* GEANT_GEC_TASK.split_attribute_name */
extern unsigned char ge103os8051;
extern T0* ge103ov8051;
extern T0* T265f11(T0* C);
/* GEANT_GEC_COMMAND.set_catcall_mode */
extern void T376f29(T0* C, T0* a1);
/* GEANT_GEC_TASK.attribute_value */
extern T0* T265f10(T0* C, T0* a1);
/* GEANT_GEC_TASK.project_variables_resolver */
extern T0* T265f23(T0* C);
/* GEANT_GEC_TASK.catcall_attribute_name */
extern unsigned char ge103os8046;
extern T0* ge103ov8046;
extern T0* T265f9(T0* C);
/* GEANT_GEC_COMMAND.set_finalize */
extern void T376f28(T0* C, T1 a1);
/* GEANT_GEC_TASK.finalize_attribute_name */
extern unsigned char ge103os8049;
extern T0* ge103ov8049;
extern T0* T265f8(T0* C);
/* GEANT_GEC_COMMAND.set_c_compile */
extern void T376f27(T0* C, T1 a1);
/* GEANT_GEC_TASK.boolean_value */
extern T1 T265f7(T0* C, T0* a1);
/* GEANT_GEC_TASK.std */
extern T0* T265f22(T0* C);
/* GEANT_GEC_TASK.false_attribute_value */
extern T0* T265f21(T0* C);
/* GEANT_GEC_TASK.true_attribute_value */
extern T0* T265f20(T0* C);
/* GEANT_GEC_TASK.string_ */
extern T0* T265f19(T0* C);
/* GEANT_GEC_TASK.c_compile_attribute_name */
extern unsigned char ge103os8045;
extern T0* ge103ov8045;
extern T0* T265f6(T0* C);
/* GEANT_GEC_COMMAND.set_clean */
extern void T376f26(T0* C, T0* a1);
/* GEANT_GEC_TASK.clean_attribute_name */
extern unsigned char ge103os8047;
extern T0* ge103ov8047;
extern T0* T265f5(T0* C);
/* GEANT_GEC_COMMAND.set_ace_filename */
extern void T376f25(T0* C, T0* a1);
/* GEANT_GEC_TASK.attribute_value_or_default */
extern T0* T265f16(T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.has_attribute */
extern T1 T265f15(T0* C, T0* a1);
/* GEANT_GEC_TASK.ace_attribute_name */
extern unsigned char ge103os8044;
extern T0* ge103ov8044;
extern T0* T265f18(T0* C);
/* GEANT_GEC_TASK.make */
extern void T265f36p1(T0* C, T0* a1, T0* a2);
/* Creation of agent #1 in feature GEANT_GEC_TASK.make */
extern T0* T265f36p1ac1(T0* a1);
/* GEANT_GEC_TASK.make_with_command */
extern void T265f38(T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.interpreting_element_make */
extern void T265f41(T0* C, T0* a1, T0* a2);
/* GEANT_GEC_TASK.set_project */
extern void T265f43(T0* C, T0* a1);
/* GEANT_GEC_TASK.element_make */
extern void T265f42(T0* C, T0* a1);
/* GEANT_GEC_TASK.set_xml_element */
extern void T265f44(T0* C, T0* a1);
/* GEANT_GEC_TASK.set_command */
extern void T265f40(T0* C, T0* a1);
/* GEANT_GEC_TASK.build_command */
extern void T265f37(T0* C, T0* a1);
/* GEANT_GEC_COMMAND.make */
extern T0* T376c24(T0* a1);
/* GEANT_GEC_COMMAND.make */
extern void T376f24p1(T0* C, T0* a1);
/* GEANT_GEC_COMMAND.set_project */
extern void T376f34(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.replace_task_name */
extern unsigned char ge127os2486;
extern T0* ge127ov2486;
extern T0* T191f53(T0* C);
/* GEANT_TASK_FACTORY.input_task_name */
extern unsigned char ge127os2485;
extern T0* ge127ov2485;
extern T0* T191f51(T0* C);
/* GEANT_TASK_FACTORY.available_task_name */
extern unsigned char ge127os2484;
extern T0* ge127ov2484;
extern T0* T191f49(T0* C);
/* GEANT_TASK_FACTORY.precursor_task_name */
extern unsigned char ge127os2483;
extern T0* ge127ov2483;
extern T0* T191f47(T0* C);
/* GEANT_TASK_FACTORY.exit_task_name */
extern unsigned char ge127os2482;
extern T0* ge127ov2482;
extern T0* T191f45(T0* C);
/* GEANT_TASK_FACTORY.outofdate_task_name */
extern unsigned char ge127os2481;
extern T0* ge127ov2481;
extern T0* T191f43(T0* C);
/* GEANT_TASK_FACTORY.xslt_task_name */
extern unsigned char ge127os2480;
extern T0* ge127ov2480;
extern T0* T191f41(T0* C);
/* GEANT_TASK_FACTORY.setenv_task_name */
extern unsigned char ge127os2479;
extern T0* ge127ov2479;
extern T0* T191f39(T0* C);
/* GEANT_TASK_FACTORY.move_task_name */
extern unsigned char ge127os2478;
extern T0* ge127ov2478;
extern T0* T191f37(T0* C);
/* GEANT_TASK_FACTORY.copy_task_name */
extern unsigned char ge127os2477;
extern T0* ge127ov2477;
extern T0* T191f35(T0* C);
/* GEANT_TASK_FACTORY.delete_task_name */
extern unsigned char ge127os2476;
extern T0* ge127ov2476;
extern T0* T191f33(T0* C);
/* GEANT_TASK_FACTORY.mkdir_task_name */
extern unsigned char ge127os2475;
extern T0* ge127ov2475;
extern T0* T191f31(T0* C);
/* GEANT_TASK_FACTORY.echo_task_name */
extern unsigned char ge127os2474;
extern T0* ge127ov2474;
extern T0* T191f29(T0* C);
/* GEANT_TASK_FACTORY.geant_task_name */
extern unsigned char ge127os2473;
extern T0* ge127ov2473;
extern T0* T191f27(T0* C);
/* GEANT_TASK_FACTORY.getest_task_name */
extern unsigned char ge127os2472;
extern T0* ge127ov2472;
extern T0* T191f25(T0* C);
/* GEANT_TASK_FACTORY.gepp_task_name */
extern unsigned char ge127os2471;
extern T0* ge127ov2471;
extern T0* T191f23(T0* C);
/* GEANT_TASK_FACTORY.geyacc_task_name */
extern unsigned char ge127os2470;
extern T0* ge127ov2470;
extern T0* T191f21(T0* C);
/* GEANT_TASK_FACTORY.gelex_task_name */
extern unsigned char ge127os2469;
extern T0* ge127ov2469;
extern T0* T191f19(T0* C);
/* GEANT_TASK_FACTORY.gexace_task_name */
extern unsigned char ge127os2468;
extern T0* ge127ov2468;
extern T0* T191f17(T0* C);
/* GEANT_TASK_FACTORY.unset_task_name */
extern unsigned char ge127os2467;
extern T0* ge127ov2467;
extern T0* T191f15(T0* C);
/* GEANT_TASK_FACTORY.set_task_name */
extern unsigned char ge127os2466;
extern T0* ge127ov2466;
extern T0* T191f13(T0* C);
/* GEANT_TASK_FACTORY.lcc_task_name */
extern unsigned char ge127os2465;
extern T0* ge127ov2465;
extern T0* T191f11(T0* C);
/* GEANT_TASK_FACTORY.exec_task_name */
extern unsigned char ge127os2464;
extern T0* ge127ov2464;
extern T0* T191f9(T0* C);
/* GEANT_TASK_FACTORY.ise_task_name */
extern unsigned char ge127os2463;
extern T0* ge127ov2463;
extern T0* T191f7(T0* C);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].force_new */
extern void T264f38(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].key_storage_put */
extern void T264f45(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].item_storage_put */
extern void T264f44(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].slots_put */
extern void T264f43(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].clashes_put */
extern void T264f42(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].resize */
extern void T264f41(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].clashes_resize */
extern void T264f50(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].special_integer_ */
extern T0* T264f26(T0* C);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].key_storage_resize */
extern void T264f49(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].item_storage_resize */
extern void T264f48(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].resize */
extern T0* T375f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].aliased_resized_area */
extern T0* T373f2(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].slots_resize */
extern void T264f47(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].new_modulus */
extern T6 T264f24(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].new_capacity */
extern T6 T264f23(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].unset_found_item */
extern void T264f40(T0* C);
/* GEANT_TASK_FACTORY.gec_task_name */
extern unsigned char ge127os2462;
extern T0* ge127ov2462;
extern T0* T191f5(T0* C);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].set_key_equality_tester */
extern void T264f37(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].internal_set_equality_tester */
extern void T371f6(T0* C, T0* a1);
/* GEANT_TASK_FACTORY.string_equality_tester */
extern T0* T191f3(T0* C);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_map */
extern T0* T264c36(T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_with_equality_testers */
extern void T264f39(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make */
extern T0* T371c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].new_cursor */
extern T0* T371f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make */
extern T0* T494c3(T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].new_cursor */
extern T0* T264f25(T0* C);
/* DS_HASH_TABLE_CURSOR [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make */
extern T0* T374c3(T0* a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_sparse_container */
extern void T264f46(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_slots */
extern void T264f54(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_clashes */
extern void T264f53(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_key_storage */
extern void T264f52(T0* C, T6 a1);
/* DS_HASH_TABLE [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK], STRING_8].make_item_storage */
extern void T264f51(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].make */
extern T0* T375f2(T0* C, T6 a1);
/* TO_SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].make_area */
extern T0* T495c2(T6 a1);
/* SPECIAL [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].make */
extern T0* T373c4(T6 a1);
/* KL_SPECIAL_ROUTINES [FUNCTION [ANY, TUPLE [XM_ELEMENT], GEANT_TASK]].default_create */
extern T0* T375c3(void);
/* GEANT_PROJECT.set_options */
extern void T22f45(T0* C, T0* a1);
/* GEANT_PROJECT.set_variables */
extern void T22f44(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.element_make */
extern void T30f21(T0* C, T0* a1);
/* GEANT_PROJECT_ELEMENT.set_xml_element */
extern void T30f24(T0* C, T0* a1);
/* XM_TREE_CALLBACKS_PIPE.document */
extern T0* T93f8(T0* C);
/* XM_EIFFEL_PARSER.is_correct */
extern T1 T92f121(T0* C);
/* XM_EIFFEL_PARSER.parse_from_stream */
extern void T92f205(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.parse_with_events */
extern void T92f209(T0* C);
/* XM_EIFFEL_PARSER.on_finish */
extern void T92f215(T0* C);
/* XM_EIFFEL_PARSER.parse */
extern void T92f214(T0* C);
/* XM_EIFFEL_PARSER.yy_pop_last_value */
extern void T92f224(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.yy_push_error_value */
extern void T92f223(T0* C);
/* XM_EIFFEL_PARSER.yy_do_action */
extern void T92f222(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.on_notation_declaration */
extern void T92f252(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_notation_declaration */
extern void T173f8(T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.set_public */
extern void T145f6(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].resize */
extern T0* T171f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_EXTERNAL_ID].aliased_resized_area */
extern T0* T156f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].make */
extern T0* T171f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_DTD_EXTERNAL_ID].make_area */
extern T0* T251c2(T6 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].make */
extern T0* T156c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID].default_create */
extern T0* T171c3(void);
/* XM_DTD_EXTERNAL_ID.set_system */
extern void T145f5(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_dtd_external_id */
extern T0* T92f169(T0* C);
/* XM_DTD_EXTERNAL_ID.make */
extern T0* T145c4(void);
/* XM_EIFFEL_PARSER.when_pe_entity_declared */
extern void T92f251(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].force_new */
extern void T138f40(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_put */
extern void T138f54(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_put */
extern void T138f53(T0* C, T0* a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_put */
extern void T138f52(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_put */
extern void T138f51(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_item */
extern T6 T138f28(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].hash_position */
extern T6 T138f27(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_item */
extern T6 T138f26(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].resize */
extern void T138f50(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_resize */
extern void T138f59(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].special_integer_ */
extern T0* T138f32(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_resize */
extern void T138f58(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_resize */
extern void T138f57(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].resize */
extern T0* T233f1(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].aliased_resized_area */
extern T0* T228f3(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_item */
extern T0* T138f22(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_resize */
extern void T138f56(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_modulus */
extern T6 T138f29(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_capacity */
extern T6 T138f23(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].unset_found_item */
extern void T138f45(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].has */
extern T1 T138f33(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].search_position */
extern void T138f42(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_def */
extern T0* T176c208(T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.make_literal */
extern void T176f210(T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.default_create */
extern T0* T140c4(void);
/* XM_EIFFEL_PE_ENTITY_DEF.make_scanner */
extern void T176f211(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T176f213(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset_sent */
extern void T176f216(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T176f213p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T176f213p0(T0* C);
/* DS_LINKED_STACK [INTEGER_32].make */
extern T0* T224c5(void);
/* XM_EIFFEL_PE_ENTITY_DEF.reset */
extern void T176f213p2(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.make_with_buffer */
extern void T176f212(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_load_input_buffer */
extern void T176f215(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_content */
extern void T176f218(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.special_integer_ */
extern T0* T176f70(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_initialize */
extern void T176f214(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_build_tables */
extern void T176f217(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_accept_template */
extern unsigned char ge1544os6425;
extern T0* ge1544ov6425;
extern T0* T176f50(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_fixed_array */
extern T0* T176f54(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_meta_template */
extern unsigned char ge1544os6424;
extern T0* ge1544ov6424;
extern T0* T176f91(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_ec_template */
extern unsigned char ge1544os6423;
extern T0* ge1544ov6423;
extern T0* T176f69(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_def_template */
extern unsigned char ge1544os6422;
extern T0* ge1544ov6422;
extern T0* T176f59(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_base_template */
extern unsigned char ge1544os6421;
extern T0* ge1544ov6421;
extern T0* T176f52(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template */
extern unsigned char ge1544os6414;
extern T0* ge1544ov6414;
extern T0* T176f49(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_6 */
extern void T176f230(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_array_subcopy */
extern void T176f231(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* KL_ARRAY_ROUTINES [INTEGER_32].subcopy */
extern void T261f2(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* ARRAY [INTEGER_32].subcopy */
extern void T204f11(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER_32].copy_data */
extern void T63f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4);
/* SPECIAL [INTEGER_32].move_data */
extern void T63f7(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].overlapping_move */
extern void T63f9(T0* C, T6 a1, T6 a2, T6 a3);
/* SPECIAL [INTEGER_32].non_overlapping_move */
extern void T63f8(T0* C, T6 a1, T6 a2, T6 a3);
/* XM_EIFFEL_PE_ENTITY_DEF.integer_array_ */
extern unsigned char ge171os2965;
extern T0* ge171ov2965;
extern T0* T176f55(T0* C);
/* KL_ARRAY_ROUTINES [INTEGER_32].default_create */
extern T0* T261c1(void);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_5 */
extern void T176f229(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_4 */
extern void T176f228(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_3 */
extern void T176f227(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_2 */
extern void T176f226(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_chk_template_1 */
extern void T176f225(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template */
extern unsigned char ge1544os6407;
extern T0* ge1544ov6407;
extern T0* T176f65(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_6 */
extern void T176f224(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_5 */
extern void T176f223(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_4 */
extern void T176f222(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_3 */
extern void T176f221(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_2 */
extern void T176f220(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_nxt_template_1 */
extern void T176f219(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.empty_buffer */
extern T0* T176f58(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.make */
extern T0* T219c8(void);
/* XM_EIFFEL_PE_ENTITY_DEF.make_external */
extern void T176f209(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.is_external */
extern T1 T170f51(T0* C);
/* XM_EIFFEL_PARSER.new_external_entity */
extern T0* T92f168(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.make_external */
extern T0* T170c207(T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_scanner */
extern void T170f208(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T170f210(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T170f210p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.reset */
extern void T170f210p0(T0* C);
/* XM_EIFFEL_ENTITY_DEF.make_with_buffer */
extern void T170f209(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_load_input_buffer */
extern void T170f212(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_content */
extern void T170f214(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.special_integer_ */
extern T0* T170f57(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_initialize */
extern void T170f211(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_build_tables */
extern void T170f213(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_accept_template */
extern T0* T170f48(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_fixed_array */
extern T0* T170f53(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_meta_template */
extern T0* T170f88(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_ec_template */
extern T0* T170f67(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_def_template */
extern T0* T170f58(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_base_template */
extern T0* T170f50(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template */
extern T0* T170f47(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_6 */
extern void T170f226(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_array_subcopy */
extern void T170f227(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_ENTITY_DEF.integer_array_ */
extern T0* T170f54(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_5 */
extern void T170f225(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_4 */
extern void T170f224(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_3 */
extern void T170f223(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_2 */
extern void T170f222(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_chk_template_1 */
extern void T170f221(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template */
extern T0* T170f64(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_6 */
extern void T170f220(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_5 */
extern void T170f219(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_4 */
extern void T170f218(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_3 */
extern void T170f217(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_2 */
extern void T170f216(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.yy_nxt_template_1 */
extern void T170f215(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.empty_buffer */
extern T0* T170f49(T0* C);
/* XM_EIFFEL_PARSER.on_entity_declaration */
extern void T92f250(T0* C, T0* a1, T1 a2, T0* a3, T0* a4, T0* a5);
/* XM_DTD_CALLBACKS_NULL.on_entity_declaration */
extern void T173f7(T0* C, T0* a1, T1 a2, T0* a3, T0* a4, T0* a5);
/* XM_EIFFEL_PARSER.when_entity_declared */
extern void T92f249(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.new_literal_entity */
extern T0* T92f167(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_ENTITY_DEF.make_literal */
extern T0* T170c206(T0* a1, T0* a2);
/* XM_DTD_ATTRIBUTE_CONTENT.set_default_value */
extern void T149f26(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_fixed */
extern void T149f25(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_implied */
extern void T149f24(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_value_required */
extern void T149f23(T0* C);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].resize */
extern T0* T169f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].aliased_resized_area */
extern T0* T168f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].make */
extern T0* T169f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_BILINKED_LIST [STRING_8]].make_area */
extern T0* T250c2(T6 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].make */
extern T0* T168c4(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]].default_create */
extern T0* T169c3(void);
/* DS_BILINKED_LIST [STRING_8].force_last */
extern void T150f12(T0* C, T0* a1);
/* DS_BILINKABLE [STRING_8].put_right */
extern void T242f5(T0* C, T0* a1);
/* DS_BILINKABLE [STRING_8].attach_left */
extern void T242f6(T0* C, T0* a1);
/* DS_BILINKABLE [STRING_8].make */
extern T0* T242c4(T0* a1);
/* DS_BILINKED_LIST [STRING_8].is_empty */
extern T1 T150f7(T0* C);
/* XM_EIFFEL_PARSER.new_string_bilinked_list */
extern T0* T92f162(T0* C);
/* DS_BILINKED_LIST [STRING_8].set_equality_tester */
extern void T150f13(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.string_equality_tester */
extern T0* T92f182(T0* C);
/* DS_BILINKED_LIST [STRING_8].make */
extern T0* T150c11(void);
/* DS_BILINKED_LIST [STRING_8].new_cursor */
extern T0* T150f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].make */
extern T0* T241c7(T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration_list */
extern void T149f22(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.set_enumeration */
extern void T149f27(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.default_enumeration_list */
extern unsigned char ge1455os7236;
extern T0* ge1455ov7236;
extern T0* T149f7(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_notation */
extern void T149f21(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_token */
extern void T149f20(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_entity */
extern void T149f19(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_list_type */
extern void T149f18(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id_ref */
extern void T149f17(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_id */
extern void T149f16(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_data */
extern void T149f15(T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content */
extern T0* T92f160(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.make */
extern T0* T149c12(void);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].resize */
extern T0* T167f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].aliased_resized_area */
extern T0* T165f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T167f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make_area */
extern T0* T249c2(T6 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T165c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT].default_create */
extern T0* T167c3(void);
/* XM_DTD_ATTRIBUTE_CONTENT.copy_default */
extern void T149f14(T0* C, T0* a1);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_implied */
extern T1 T149f11(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_required */
extern T1 T149f10(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.has_default_value */
extern T1 T149f9(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.is_value_fixed */
extern T1 T149f8(T0* C);
/* XM_DTD_ATTRIBUTE_CONTENT.set_name */
extern void T149f13(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].resize */
extern T0* T166f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].aliased_resized_area */
extern T0* T163f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T166f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make_area */
extern T0* T248c2(T6 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].make */
extern T0* T163c4(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].default_create */
extern T0* T166c3(void);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].force_last */
extern void T148f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].put_right */
extern void T239f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].attach_left */
extern void T239f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T239c4(T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].is_empty */
extern T1 T148f5(T0* C);
/* XM_EIFFEL_PARSER.new_dtd_attribute_content_list */
extern T0* T92f153(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T148c8(void);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].new_cursor */
extern T0* T148f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].make */
extern T0* T238c7(T0* a1);
/* XM_EIFFEL_PARSER.on_attribute_declarations */
extern void T92f248(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].forth */
extern void T238f9(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_forth */
extern void T148f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].add_traversing_cursor */
extern void T148f12(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set_next_cursor */
extern void T238f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].remove_traversing_cursor */
extern void T148f13(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].set */
extern void T238f10(T0* C, T0* a1, T1 a2, T1 a3);
/* XM_EIFFEL_PARSER.on_attribute_declaration */
extern void T92f258(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_DTD_CALLBACKS_NULL.on_attribute_declaration */
extern void T173f9(T0* C, T0* a1, T0* a2, T0* a3);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].item */
extern T0* T238f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT].start */
extern void T238f8(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_start */
extern void T148f10(T0* C, T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT].cursor_off */
extern T1 T148f7(T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_more */
extern void T147f11(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_mixed */
extern T0* T147c10(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_mixed */
extern void T147f21(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_choice */
extern void T147f19(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_list */
extern void T147f16(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_default */
extern void T147f22(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one */
extern void T147f12(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_sequence */
extern void T147f20(T0* C);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T237c7(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].new_cursor */
extern T0* T237f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T341c3(T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_sequence */
extern T0* T147c9(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_last */
extern void T237f9(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].put_right */
extern void T342f5(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].attach_left */
extern void T342f6(T0* C, T0* a1);
/* DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T342c4(T0* a1);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].is_empty */
extern T1 T237f5(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_choice */
extern T0* T147c8(void);
/* DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT].force_first */
extern void T237f8(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.element_name */
extern T0* T92f147(T0* C, T0* a1);
/* XM_DTD_ELEMENT_CONTENT.make_name */
extern T0* T147c15(T0* a1);
/* XM_EIFFEL_PARSER.set_element_repetition */
extern void T92f247(T0* C, T0* a1, T0* a2);
/* XM_DTD_ELEMENT_CONTENT.set_zero_or_one */
extern void T147f14(T0* C);
/* XM_DTD_ELEMENT_CONTENT.set_one_or_more */
extern void T147f13(T0* C);
/* XM_DTD_ELEMENT_CONTENT.make_any */
extern T0* T147c7(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_any */
extern void T147f18(T0* C);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].resize */
extern T0* T161f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].aliased_resized_area */
extern T0* T160f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T161f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_DTD_ELEMENT_CONTENT].make_area */
extern T0* T247c2(T6 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].make */
extern T0* T160c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT].default_create */
extern T0* T161c3(void);
/* XM_DTD_ELEMENT_CONTENT.make_empty */
extern T0* T147c6(void);
/* XM_DTD_ELEMENT_CONTENT.set_content_empty */
extern void T147f17(T0* C);
/* XM_EIFFEL_PARSER.on_element_declaration */
extern void T92f246(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_element_declaration */
extern void T173f6(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_attribute */
extern void T92f245(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].has */
extern T1 T146f30(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].search_position */
extern void T146f34(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_item */
extern T6 T146f22(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].hash_position */
extern T6 T146f24(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.hash_code */
extern T6 T143f9(T0* C);
/* XM_EIFFEL_PARSER_NAME.item */
extern T0* T143f14(T0* C, T6 a1);
/* DS_BILINKED_LIST [STRING_8].item */
extern T0* T150f8(T0* C, T6 a1);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].test */
extern T1 T235f1(T0* C, T0* a1, T0* a2);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].any_ */
extern T0* T235f2(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_storage_item */
extern T0* T146f18(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_item */
extern T0* T146f29(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_equality_tester */
extern T0* T146f17(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_item */
extern T6 T146f25(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].resize */
extern T0* T159f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].aliased_resized_area */
extern T0* T158f2(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T159f1(T0* C, T6 a1);
/* TO_SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make_area */
extern T0* T246c2(T6 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].make */
extern T0* T158c4(T6 a1);
/* KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].default_create */
extern T0* T159c3(void);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].force_new */
extern void T146f33(T0* C, T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_put */
extern void T146f40(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_put */
extern void T146f39(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_put */
extern void T146f38(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].resize */
extern void T146f37(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].clashes_resize */
extern void T146f48(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].special_integer_ */
extern T0* T146f28(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].key_storage_resize */
extern void T146f47(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].item_storage_resize */
extern void T146f46(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].slots_resize */
extern void T146f45(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_modulus */
extern T6 T146f19(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_capacity */
extern T6 T146f26(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].unset_found_item */
extern void T146f36(T0* C);
/* XM_EIFFEL_PARSER.new_name_set */
extern T0* T92f134(T0* C);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_equal */
extern T0* T146c32(T6 a1);
/* KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T235c3(void);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make */
extern void T146f35(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].new_cursor */
extern T0* T146f21(T0* C);
/* DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME].make */
extern T0* T236c3(T0* a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_slots */
extern void T146f44(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_clashes */
extern void T146f43(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_key_storage */
extern void T146f42(T0* C, T6 a1);
/* DS_HASH_SET [XM_EIFFEL_PARSER_NAME].make_item_storage */
extern void T146f41(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.on_start_tag */
extern void T92f244(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER.on_end_tag */
extern void T92f243(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_EIFFEL_PARSER_NAME.local_part */
extern T0* T143f12(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].forth */
extern void T241f9(T0* C);
/* DS_BILINKED_LIST [STRING_8].cursor_forth */
extern void T150f15(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].add_traversing_cursor */
extern void T150f16(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].set_next_cursor */
extern void T241f11(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].remove_traversing_cursor */
extern void T150f17(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [STRING_8].set */
extern void T241f10(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [STRING_8].item */
extern T0* T241f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [STRING_8].start */
extern void T241f8(T0* C);
/* DS_BILINKED_LIST [STRING_8].cursor_start */
extern void T150f14(T0* C, T0* a1);
/* DS_BILINKED_LIST [STRING_8].cursor_off */
extern T1 T150f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.string_ */
extern T0* T143f18(T0* C);
/* XM_EIFFEL_PARSER_NAME.last */
extern T0* T143f17(T0* C);
/* DS_BILINKED_LIST [STRING_8].last */
extern T0* T150f9(T0* C);
/* XM_EIFFEL_PARSER_NAME.ns_prefix */
extern T0* T143f11(T0* C);
/* XM_EIFFEL_PARSER_NAME.is_namespace_name */
extern T1 T143f16(T0* C);
/* XM_EIFFEL_PARSER.on_start_tag_finish */
extern void T92f242(T0* C);
/* KL_SPECIAL_ROUTINES [BOOLEAN].resize */
extern T0* T157f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [BOOLEAN].aliased_resized_area */
extern T0* T155f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].make */
extern T0* T157f1(T0* C, T6 a1);
/* TO_SPECIAL [BOOLEAN].make_area */
extern T0* T245c2(T6 a1);
/* KL_SPECIAL_ROUTINES [BOOLEAN].default_create */
extern T0* T157c3(void);
/* XM_EIFFEL_PARSER.when_external_dtd */
extern void T92f241(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.last_error */
extern T0* T140f2(T0* C);
/* XM_EIFFEL_PARSER.null_resolver */
extern unsigned char ge1542os5034;
extern T0* ge1542ov5034;
extern T0* T92f103(T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern T0* T174c198(void);
/* XM_EIFFEL_SCANNER_DTD.set_start_condition */
extern void T174f205(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.make_scanner */
extern void T174f198p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T174f207(T0* C);
/* XM_EIFFEL_SCANNER_DTD.reset */
extern void T174f207p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.make_with_buffer */
extern void T174f206(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_load_input_buffer */
extern void T174f217(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_content */
extern void T174f218(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.special_integer_ */
extern T0* T174f184(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_initialize */
extern void T174f216(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_build_tables */
extern void T174f221(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_accept_template */
extern T0* T174f192(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_fixed_array */
extern T0* T174f195(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_meta_template */
extern T0* T174f191(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_ec_template */
extern T0* T174f190(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_def_template */
extern T0* T174f189(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_base_template */
extern T0* T174f188(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template */
extern T0* T174f187(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_6 */
extern void T174f233(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_array_subcopy */
extern void T174f234(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_SCANNER_DTD.integer_array_ */
extern T0* T174f197(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_5 */
extern void T174f232(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_4 */
extern void T174f231(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_3 */
extern void T174f230(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_2 */
extern void T174f229(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_chk_template_1 */
extern void T174f228(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template */
extern T0* T174f186(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_6 */
extern void T174f227(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_5 */
extern void T174f226(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_4 */
extern void T174f225(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_3 */
extern void T174f224(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_2 */
extern void T174f223(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.yy_nxt_template_1 */
extern void T174f222(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.empty_buffer */
extern T0* T174f49(T0* C);
/* DS_LINKED_STACK [XM_EIFFEL_SCANNER].force */
extern void T136f8(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.has_error */
extern T1 T140f1(T0* C);
/* XM_EIFFEL_PARSER.resolve_external_id */
extern void T92f257(T0* C, T0* a1, T0* a2);
/* XM_NULL_EXTERNAL_RESOLVER.resolve */
extern void T140f6(T0* C, T0* a1);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_public */
extern void T140f5(T0* C, T0* a1, T0* a2);
/* XM_DTD_EXTERNAL_ID.is_public */
extern T1 T145f3(T0* C);
/* XM_EIFFEL_PARSER.on_dtd_end */
extern void T92f240(T0* C);
/* XM_DTD_CALLBACKS_NULL.on_dtd_end */
extern void T173f5(T0* C);
/* XM_EIFFEL_PARSER.on_doctype */
extern void T92f239(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_DTD_CALLBACKS_NULL.on_doctype */
extern void T173f4(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_DTD_CALLBACKS_NULL.make */
extern T0* T173c1(void);
/* XM_EIFFEL_DECLARATION.set_encoding */
extern void T144f9(T0* C, T0* a1);
/* XM_EIFFEL_DECLARATION.set_stand_alone */
extern void T144f8(T0* C, T1 a1);
/* XM_EIFFEL_DECLARATION.set_version */
extern void T144f11(T0* C, T0* a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].resize */
extern T0* T154f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_DECLARATION].aliased_resized_area */
extern T0* T153f3(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].make */
extern T0* T154f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_EIFFEL_DECLARATION].make_area */
extern T0* T244c2(T6 a1);
/* SPECIAL [XM_EIFFEL_DECLARATION].make */
extern T0* T153c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION].default_create */
extern T0* T154c3(void);
/* XM_EIFFEL_DECLARATION.make */
extern T0* T144c7(void);
/* XM_EIFFEL_DECLARATION.process */
extern void T144f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_xml_declaration */
extern void T92f261(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_EIFFEL_PARSER.apply_encoding */
extern void T92f238(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_content */
extern void T92f237(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_dtd_processing_instruction */
extern void T92f236(T0* C, T0* a1, T0* a2);
/* XM_DTD_CALLBACKS_NULL.on_dtd_processing_instruction */
extern void T173f3(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_processing_instruction */
extern void T92f235(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER.on_dtd_comment */
extern void T92f234(T0* C, T0* a1);
/* XM_DTD_CALLBACKS_NULL.on_dtd_comment */
extern void T173f2(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_comment */
extern void T92f233(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.entity_referenced_in_entity_value */
extern T0* T92f117(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.defined_entity_referenced */
extern T0* T92f194(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.external_entity_to_string */
extern T0* T92f200(T0* C, T0* a1);
/* STRING_8.remove */
extern void T17f49(T0* C, T6 a1);
/* XM_NULL_EXTERNAL_RESOLVER.resolve_finish */
extern void T140f7(T0* C);
/* XM_EIFFEL_INPUT_STREAM.read_string */
extern void T208f29(T0* C, T6 a1);
/* XM_EIFFEL_INPUT_STREAM.last_character */
extern T2 T208f19(T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].item */
extern T2 T324f5(T0* C);
/* XM_EIFFEL_INPUT_STREAM.end_of_input */
extern T1 T208f18(T0* C);
/* KL_TEXT_INPUT_FILE.end_of_input */
extern T1 T55f27(T0* C);
/* XM_EIFFEL_INPUT_STREAM.read_character */
extern void T208f31(T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].remove */
extern void T324f7(T0* C);
/* DS_LINKED_QUEUE [CHARACTER_8].wipe_out */
extern void T324f9(T0* C);
/* XM_EIFFEL_INPUT_STREAM.noqueue_read_character */
extern void T208f33(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf16_read_character */
extern void T208f35(T0* C);
/* XM_EIFFEL_INPUT_STREAM.append_character */
extern void T208f36(T0* C, T6 a1);
/* DS_LINKED_QUEUE [CHARACTER_8].force */
extern void T324f8(T0* C, T2 a1);
/* DS_LINKABLE [CHARACTER_8].put_right */
extern void T467f4(T0* C, T0* a1);
/* DS_LINKED_QUEUE [CHARACTER_8].is_empty */
extern T1 T324f4(T0* C);
/* DS_LINKABLE [CHARACTER_8].make */
extern T0* T467c3(T2 a1);
/* UC_UTF8_ROUTINES.append_code_to_utf8 */
extern void T205f37(T0* C, T0* a1, T6 a2);
/* UC_UTF8_ROUTINES.integer_ */
extern T0* T205f29(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf8 */
extern T0* T208f22(T0* C);
/* KL_STRING_ROUTINES.wipe_out */
extern void T76f21(T0* C, T0* a1);
/* UC_UTF8_STRING.old_clear_all */
extern void T206f85(T0* C);
/* STRING_8.clear_all */
extern void T17f52(T0* C);
/* XM_EIFFEL_INPUT_STREAM.string_ */
extern T0* T208f17(T0* C);
/* XM_EIFFEL_INPUT_STREAM.utf8_buffer */
extern unsigned char ge1537os7626;
extern T0* ge1537ov7626;
extern T0* T208f25(T0* C);
/* UC_UTF16_ROUTINES.surrogate */
extern T6 T325f7(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_low_surrogate */
extern T1 T325f6(T0* C, T6 a1);
/* UC_UTF16_ROUTINES.least_10_bits */
extern T6 T325f5(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_high_surrogate */
extern T1 T325f4(T0* C, T6 a1);
/* UC_UTF16_ROUTINES.is_surrogate */
extern T1 T325f3(T0* C, T6 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16 */
extern unsigned char ge274os4816;
extern T0* ge274ov4816;
extern T0* T208f20(T0* C);
/* UC_UTF16_ROUTINES.default_create */
extern T0* T325c16(void);
/* XM_EIFFEL_INPUT_STREAM.least_significant */
extern T6 T208f24(T0* C, T2 a1, T2 a2);
/* XM_EIFFEL_INPUT_STREAM.most_significant */
extern T6 T208f23(T0* C, T2 a1, T2 a2);
/* XM_EIFFEL_INPUT_STREAM.latin1_read_character */
extern void T208f34(T0* C);
/* KL_STRING_INPUT_STREAM.read_character */
extern void T489f9(T0* C);
/* KL_TEXT_INPUT_FILE.read_character */
extern void T55f66(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_character */
extern void T55f67(T0* C);
/* KL_TEXT_INPUT_FILE.file_gc */
extern T2 T55f30(T0* C, T14 a1);
/* KL_TEXT_INPUT_FILE.old_end_of_file */
extern T1 T55f29(T0* C);
/* KL_TEXT_INPUT_FILE.file_feof */
extern T1 T55f31(T0* C, T14 a1);
/* XM_EIFFEL_INPUT_STREAM.utf16_detect_read_character */
extern void T208f32(T0* C);
/* UC_UTF8_ROUTINES.is_endian_detection_character */
extern T1 T205f31(T0* C, T2 a1, T2 a2, T2 a3);
/* UC_UTF8_ROUTINES.is_endian_detection_character_start */
extern T1 T205f30(T0* C, T2 a1, T2 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_least_first */
extern T1 T325f2(T0* C, T6 a1, T6 a2);
/* UC_UTF16_ROUTINES.is_endian_detection_character_most_first */
extern T1 T325f1(T0* C, T6 a1, T6 a2);
/* KL_PLATFORM.maximum_integer */
extern unsigned char ge257os7687;
extern T6 ge257ov7687;
extern T6 T210f2(T0* C);
/* KL_INTEGER_ROUTINES.platform */
extern T0* T209f1(T0* C);
/* XM_EIFFEL_PARSER.integer_ */
extern T0* T92f201(T0* C);
/* XM_EIFFEL_INPUT_STREAM.make_from_stream */
extern T0* T208c28(T0* a1);
/* DS_LINKED_QUEUE [CHARACTER_8].make */
extern T0* T324c6(void);
/* XM_NULL_EXTERNAL_RESOLVER.last_stream */
extern T0* T140f3(T0* C);
/* XM_EIFFEL_ENTITY_DEF.is_literal */
extern T1 T170f62(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_literal */
extern T1 T176f63(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_external */
extern T1 T176f66(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item */
extern T0* T138f21(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_item */
extern T0* T138f36(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.force_error */
extern void T92f232(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.report_error */
extern void T92f230(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.on_error */
extern void T92f256(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.setup_error_state */
extern void T92f255(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.onstring_utf8 */
extern T0* T92f96(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.maximum_item_code */
extern T6 T92f189(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_latin1 */
extern T1 T92f188(T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_from_utf8 */
extern T0* T92f184(T0* C, T0* a1);
/* UC_UTF8_STRING.make_from_utf8 */
extern T0* T206c54(T0* a1);
/* UC_UTF8_STRING.append_utf8 */
extern void T206f62(T0* C, T0* a1);
/* UC_UTF8_ROUTINES.valid_utf8 */
extern T1 T205f1(T0* C, T0* a1);
/* UC_UTF8_ROUTINES.is_encoded_next_byte */
extern T1 T205f10(T0* C, T2 a1);
/* UC_UTF8_ROUTINES.is_encoded_second_byte */
extern T1 T205f5(T0* C, T2 a1, T2 a2);
/* UC_UTF8_ROUTINES.is_encoded_first_byte */
extern T1 T205f2(T0* C, T2 a1);
/* XM_EIFFEL_PARSER.utf8 */
extern T0* T92f187(T0* C);
/* XM_EIFFEL_PARSER.is_string_mode_ascii */
extern T1 T92f185(T0* C);
/* XM_EIFFEL_PARSER.onstring_ascii */
extern T0* T92f94(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.is_string_mode_unicode */
extern T1 T92f183(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string */
extern T0* T92f115(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_string */
extern unsigned char ge1542os5102;
extern T0* ge1542ov5102;
extern T0* T92f193(T0* C);
/* XM_EIFFEL_PARSER.shared_empty_string_uc */
extern unsigned char ge1542os5103;
extern T0* ge1542ov5103;
extern T0* T92f192(T0* C);
/* XM_EIFFEL_PARSER.new_unicode_string_empty */
extern T0* T92f199(T0* C);
/* UC_UTF8_STRING.make_empty */
extern T0* T206c58(void);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].resize */
extern T0* T152f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].aliased_resized_area */
extern T0* T151f2(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].make */
extern T0* T152f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_EIFFEL_PARSER_NAME].make_area */
extern T0* T243c2(T6 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].make */
extern T0* T151c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME].default_create */
extern T0* T152c3(void);
/* XM_EIFFEL_PARSER.namespace_force_last */
extern void T92f231(T0* C, T0* a1, T0* a2);
/* XM_EIFFEL_PARSER_NAME.force_last */
extern void T143f20(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.new_string_bilinked_list */
extern T0* T143f7(T0* C);
/* XM_EIFFEL_PARSER_NAME.string_equality_tester */
extern T0* T143f8(T0* C);
/* XM_EIFFEL_PARSER_NAME.can_force_last */
extern T1 T143f6(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.new_namespace_name */
extern T0* T92f111(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern void T143f21(T0* C);
/* XM_EIFFEL_PARSER_NAME.make_no_namespaces */
extern T0* T143c21(void);
/* XM_EIFFEL_PARSER_NAME.make_namespaces */
extern T0* T143c19(void);
/* XM_EIFFEL_PARSER.yy_push_last_value */
extern void T92f221(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.accept */
extern void T92f220(T0* C);
/* XM_EIFFEL_PARSER.yy_do_error_action */
extern void T92f218(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.report_eof_expected_error */
extern void T92f229(T0* C);
/* XM_EIFFEL_PARSER.read_token */
extern void T92f217(T0* C);
/* XM_EIFFEL_PARSER.process_attribute_entity */
extern void T92f228(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_entity_scanner */
extern void T92f254(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_start_condition */
extern void T170f229(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_start_condition */
extern void T176f233(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.has_error */
extern T1 T170f55(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.has_error */
extern T1 T176f56(T0* C);
/* XM_EIFFEL_ENTITY_DEF.apply_input_buffer */
extern void T170f228(T0* C);
/* KL_STRING_INPUT_STREAM.make */
extern T0* T489c8(T0* a1);
/* UC_UTF8_ROUTINES.to_utf8 */
extern T0* T205f35(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.utf8 */
extern T0* T170f66(T0* C);
/* XM_EIFFEL_ENTITY_DEF.fatal_error */
extern void T170f236(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.apply_input_buffer */
extern void T176f232(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.utf8 */
extern T0* T176f68(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.fatal_error */
extern void T176f240(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_entity */
extern void T92f227(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.process_pe_entity */
extern void T92f226(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.special_integer_ */
extern T0* T92f113(T0* C);
/* XM_EIFFEL_PARSER.yy_init_value_stacks */
extern void T92f216(T0* C);
/* XM_EIFFEL_PARSER.yy_clear_all */
extern void T92f225(T0* C);
/* XM_EIFFEL_PARSER.clear_all */
extern void T92f253(T0* C);
/* XM_EIFFEL_PARSER.clear_stacks */
extern void T92f259(T0* C);
/* XM_EIFFEL_PARSER.yy_clear_value_stacks */
extern void T92f260(T0* C);
/* SPECIAL [XM_EIFFEL_DECLARATION].clear_all */
extern void T153f6(T0* C);
/* SPECIAL [XM_EIFFEL_DECLARATION].put_default */
extern void T153f7(T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].clear_all */
extern void T168f6(T0* C);
/* SPECIAL [DS_BILINKED_LIST [STRING_8]].put_default */
extern void T168f7(T0* C, T6 a1);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].clear_all */
extern void T163f6(T0* C);
/* SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]].put_default */
extern void T163f7(T0* C, T6 a1);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].clear_all */
extern void T165f6(T0* C);
/* SPECIAL [XM_DTD_ATTRIBUTE_CONTENT].put_default */
extern void T165f7(T0* C, T6 a1);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].clear_all */
extern void T160f6(T0* C);
/* SPECIAL [XM_DTD_ELEMENT_CONTENT].put_default */
extern void T160f7(T0* C, T6 a1);
/* SPECIAL [XM_DTD_EXTERNAL_ID].clear_all */
extern void T156f6(T0* C);
/* SPECIAL [XM_DTD_EXTERNAL_ID].put_default */
extern void T156f7(T0* C, T6 a1);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].clear_all */
extern void T158f6(T0* C);
/* SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]].put_default */
extern void T158f7(T0* C, T6 a1);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].clear_all */
extern void T151f6(T0* C);
/* SPECIAL [XM_EIFFEL_PARSER_NAME].put_default */
extern void T151f7(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.abort */
extern void T92f219(T0* C);
/* XM_EIFFEL_PARSER.on_start */
extern void T92f213(T0* C);
/* XM_CALLBACKS_NULL.make */
extern T0* T137c1(void);
/* XM_EIFFEL_PARSER.reset_error_state */
extern void T92f212(T0* C);
/* XM_EIFFEL_PARSER.reset */
extern void T92f208(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].wipe_out */
extern void T138f39(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].slots_wipe_out */
extern void T138f49(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].clashes_wipe_out */
extern void T138f48(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].key_storage_wipe_out */
extern void T138f47(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].item_storage_wipe_out */
extern void T138f46(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].move_all_cursors_after */
extern void T138f44(T0* C);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].set_next_cursor */
extern void T231f6(T0* C, T0* a1);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].set_position */
extern void T231f5(T0* C, T6 a1);
/* XM_EIFFEL_PARSER.make_scanner */
extern void T92f206(T0* C);
/* XM_EIFFEL_SCANNER.make_scanner */
extern T0* T132c196(void);
/* XM_EIFFEL_SCANNER.reset */
extern void T132f204(T0* C);
/* XM_EIFFEL_SCANNER.reset */
extern void T132f204p1(T0* C);
/* XM_EIFFEL_SCANNER.make_with_buffer */
extern void T132f203(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_load_input_buffer */
extern void T132f212(T0* C);
/* XM_EIFFEL_SCANNER.yy_set_content */
extern void T132f213(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.special_integer_ */
extern T0* T132f182(T0* C);
/* XM_EIFFEL_SCANNER.yy_initialize */
extern void T132f211(T0* C);
/* XM_EIFFEL_SCANNER.yy_build_tables */
extern void T132f219(T0* C);
/* XM_EIFFEL_SCANNER.yy_accept_template */
extern T0* T132f190(T0* C);
/* XM_EIFFEL_SCANNER.yy_fixed_array */
extern T0* T132f193(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_meta_template */
extern T0* T132f189(T0* C);
/* XM_EIFFEL_SCANNER.yy_ec_template */
extern T0* T132f188(T0* C);
/* XM_EIFFEL_SCANNER.yy_def_template */
extern T0* T132f187(T0* C);
/* XM_EIFFEL_SCANNER.yy_base_template */
extern T0* T132f186(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template */
extern T0* T132f185(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_6 */
extern void T132f231(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_array_subcopy */
extern void T132f232(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5);
/* XM_EIFFEL_SCANNER.integer_array_ */
extern T0* T132f195(T0* C);
/* XM_EIFFEL_SCANNER.yy_chk_template_5 */
extern void T132f230(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_4 */
extern void T132f229(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_3 */
extern void T132f228(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_2 */
extern void T132f227(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_chk_template_1 */
extern void T132f226(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template */
extern T0* T132f184(T0* C);
/* XM_EIFFEL_SCANNER.yy_nxt_template_6 */
extern void T132f225(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_5 */
extern void T132f224(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_4 */
extern void T132f223(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_3 */
extern void T132f222(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_2 */
extern void T132f221(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.yy_nxt_template_1 */
extern void T132f220(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.empty_buffer */
extern T0* T132f42(T0* C);
/* GEANT_PROJECT_PARSER.make */
extern T0* T56c8(T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.enable_position_table */
extern void T96f10(T0* C, T0* a1);
/* XM_POSITION_TABLE.make */
extern T0* T100c4(void);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T180c8(void);
/* XM_EIFFEL_PARSER.set_callbacks */
extern void T92f204(T0* C, T0* a1);
/* XM_TREE_CALLBACKS_PIPE.make */
extern T0* T93c10(void);
/* XM_TREE_CALLBACKS_PIPE.callbacks_pipe */
extern T0* T93f9(T0* C, T0* a1);
/* ARRAY [XM_CALLBACKS_FILTER].item */
extern T0* T179f4(T0* C, T6 a1);
/* XM_CALLBACKS_TO_TREE_FILTER.make_null */
extern T0* T96c9(void);
/* XM_TREE_CALLBACKS_PIPE.new_stop_on_error */
extern T0* T93f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.make_null */
extern T0* T99c4(void);
/* XM_TREE_CALLBACKS_PIPE.new_namespace_resolver */
extern T0* T93f6(T0* C);
/* XM_NAMESPACE_RESOLVER.make_null */
extern T0* T177c25(void);
/* XM_EIFFEL_PARSER.set_string_mode_mixed */
extern void T92f203(T0* C);
/* XM_EIFFEL_PARSER.make */
extern T0* T92c202(void);
/* XM_EIFFEL_PARSER.new_entities_table */
extern T0* T92f87(T0* C);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].set_key_equality_tester */
extern void T138f41(T0* C, T0* a1);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8].internal_set_equality_tester */
extern void T229f6(T0* C, T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_map_default */
extern T0* T138c38(void);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_map */
extern void T138f43(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_with_equality_testers */
extern void T138f55(T0* C, T6 a1, T0* a2, T0* a3);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T229c5(T0* a1);
/* DS_SPARSE_TABLE_KEYS [XM_EIFFEL_ENTITY_DEF, STRING_8].new_cursor */
extern T0* T229f4(T0* C);
/* DS_SPARSE_TABLE_KEYS_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T339c3(T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].new_cursor */
extern T0* T138f35(T0* C);
/* DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8].make */
extern T0* T231c4(T0* a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_sparse_container */
extern void T138f60(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_slots */
extern void T138f64(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_clashes */
extern void T138f63(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_key_storage */
extern void T138f62(T0* C, T6 a1);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].make_item_storage */
extern void T138f61(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T233f2(T0* C, T6 a1);
/* TO_SPECIAL [XM_EIFFEL_ENTITY_DEF].make_area */
extern T0* T340c2(T6 a1);
/* SPECIAL [XM_EIFFEL_ENTITY_DEF].make */
extern T0* T228c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF].default_create */
extern T0* T233c3(void);
/* DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8].default_capacity */
extern T6 T138f31(T0* C);
/* XM_EIFFEL_PARSER.make_parser */
extern void T92f207(T0* C);
/* XM_EIFFEL_PARSER.yy_build_parser_tables */
extern void T92f211(T0* C);
/* XM_EIFFEL_PARSER.yycheck_template */
extern unsigned char ge1538os4981;
extern T0* ge1538ov4981;
extern T0* T92f104(T0* C);
/* XM_EIFFEL_PARSER.yyfixed_array */
extern T0* T92f181(T0* C, T0* a1);
/* XM_EIFFEL_PARSER.yytable_template */
extern unsigned char ge1538os4980;
extern T0* ge1538ov4980;
extern T0* T92f92(T0* C);
/* XM_EIFFEL_PARSER.yypgoto_template */
extern unsigned char ge1538os4979;
extern T0* ge1538ov4979;
extern T0* T92f90(T0* C);
/* XM_EIFFEL_PARSER.yypact_template */
extern unsigned char ge1538os4978;
extern T0* ge1538ov4978;
extern T0* T92f88(T0* C);
/* XM_EIFFEL_PARSER.yydefgoto_template */
extern unsigned char ge1538os4977;
extern T0* ge1538ov4977;
extern T0* T92f86(T0* C);
/* XM_EIFFEL_PARSER.yydefact_template */
extern unsigned char ge1538os4976;
extern T0* ge1538ov4976;
extern T0* T92f84(T0* C);
/* XM_EIFFEL_PARSER.yytypes2_template */
extern unsigned char ge1538os4975;
extern T0* ge1538ov4975;
extern T0* T92f171(T0* C);
/* XM_EIFFEL_PARSER.yytypes1_template */
extern unsigned char ge1538os4974;
extern T0* ge1538ov4974;
extern T0* T92f155(T0* C);
/* XM_EIFFEL_PARSER.yyr1_template */
extern unsigned char ge1538os4973;
extern T0* ge1538ov4973;
extern T0* T92f136(T0* C);
/* XM_EIFFEL_PARSER.yytranslate_template */
extern unsigned char ge1538os4972;
extern T0* ge1538ov4972;
extern T0* T92f125(T0* C);
/* XM_EIFFEL_PARSER.yy_create_value_stacks */
extern void T92f210(T0* C);
/* XM_EXPAT_PARSER_FACTORY.new_expat_parser */
extern T0* T90f2(T0* C);
/* XM_EXPAT_PARSER_FACTORY.is_expat_parser_available */
extern T1 T90f1(T0* C);
/* XM_EXPAT_PARSER_FACTORY.default_create */
extern T0* T90c3(void);
/* KL_TEXT_INPUT_FILE.is_open_read */
extern T1 T55f18(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_read */
extern T1 T55f15(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T55f58(T0* C);
/* KL_TEXT_INPUT_FILE.is_closed */
extern T1 T55f20(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_closed */
extern T1 T55f17(T0* C);
/* KL_TEXT_INPUT_FILE.old_open_read */
extern void T55f64(T0* C);
/* KL_TEXT_INPUT_FILE.default_pointer */
extern T14 T55f24(T0* C);
/* KL_TEXT_INPUT_FILE.open_read */
extern void T55f64p1(T0* C);
/* KL_TEXT_INPUT_FILE.file_open */
extern T14 T55f25(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.old_is_readable */
extern T1 T55f23(T0* C);
/* UNIX_FILE_INFO.is_readable */
extern T1 T87f3(T0* C);
/* UNIX_FILE_INFO.file_eaccess */
extern T1 T87f4(T0* C, T14 a1, T6 a2);
/* KL_TEXT_INPUT_FILE.make */
extern void T55f56(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.make */
extern T0* T55c56(T0* a1);
/* KL_TEXT_INPUT_FILE.old_make */
extern void T55f62(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.string_ */
extern T0* T55f16(T0* C);
/* GEANT_PROJECT_LOADER.make */
extern T0* T23c9(T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_file_readable */
extern T1 T53f2(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.is_readable */
extern T1 T55f39(T0* C);
/* KL_UNIX_FILE_SYSTEM.is_file_readable */
extern T1 T54f2(T0* C, T0* a1);
/* GEANT.default_build_filename */
extern unsigned char ge50os1769;
extern T0* ge50ov1769;
extern T0* T21f8(T0* C);
/* GEANT_PROJECT_OPTIONS.set_no_exec */
extern void T24f8(T0* C, T1 a1);
/* GEANT_PROJECT_OPTIONS.set_debug_mode */
extern void T24f7(T0* C, T1 a1);
/* GEANT_PROJECT_OPTIONS.set_verbose */
extern void T24f6(T0* C, T1 a1);
/* GEANT_PROJECT_OPTIONS.make */
extern T0* T24c5(void);
/* GEANT_PROJECT_VARIABLES.make */
extern T0* T25c59(void);
/* GEANT_PROJECT_VARIABLES.verbose_name */
extern unsigned char ge56os1923;
extern T0* ge56ov1923;
extern T0* T25f38(T0* C);
/* GEANT_PROJECT_VARIABLES.exe_name */
extern unsigned char ge56os1922;
extern T0* ge56ov1922;
extern T0* T25f37(T0* C);
/* GEANT_PROJECT_VARIABLES.path_separator_name */
extern unsigned char ge56os1921;
extern T0* ge56ov1921;
extern T0* T25f34(T0* C);
/* GEANT_PROJECT_VARIABLES.is_unix_name */
extern unsigned char ge56os1920;
extern T0* ge56ov1920;
extern T0* T25f31(T0* C);
/* GEANT_PROJECT_VARIABLES.is_windows_name */
extern unsigned char ge56os1919;
extern T0* ge56ov1919;
extern T0* T25f28(T0* C);
/* GEANT_VARIABLES.value */
extern T0* T29f31(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.default_builtin_variables */
extern unsigned char ge58os1775;
extern T0* ge58ov1775;
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
extern unsigned char ge56os1918;
extern T0* ge56ov1918;
extern T0* T25f24(T0* C);
/* GEANT_PROJECT_VARIABLES.project_variables_resolver */
extern T0* T25f23(T0* C);
/* GEANT_PROJECT_VARIABLES.make */
extern void T25f59p1(T0* C);
/* GEANT_PROJECT_VARIABLES.set_key_equality_tester */
extern void T25f62(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.make_map */
extern void T25f61(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_with_equality_testers */
extern void T25f64(T0* C, T6 a1, T0* a2, T0* a3);
/* GEANT_PROJECT_VARIABLES.make_sparse_container */
extern void T25f72(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.unset_found_item */
extern void T25f65(T0* C);
/* GEANT_PROJECT_VARIABLES.make_slots */
extern void T25f80(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.special_integer_ */
extern T0* T25f36(T0* C);
/* GEANT_PROJECT_VARIABLES.new_modulus */
extern T6 T25f29(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_clashes */
extern void T25f79(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_key_storage */
extern void T25f78(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.make_item_storage */
extern void T25f77(T0* C, T6 a1);
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
/* GEANT_VARIABLES.force */
extern void T29f50(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.key_storage_put */
extern void T29f59(T0* C, T0* a1, T6 a2);
/* GEANT_VARIABLES.slots_put */
extern void T29f58(T0* C, T6 a1, T6 a2);
/* GEANT_VARIABLES.clashes_put */
extern void T29f57(T0* C, T6 a1, T6 a2);
/* GEANT_VARIABLES.resize */
extern void T29f56(T0* C, T6 a1);
/* GEANT_VARIABLES.clashes_resize */
extern void T29f64(T0* C, T6 a1);
/* GEANT_VARIABLES.key_storage_resize */
extern void T29f63(T0* C, T6 a1);
/* GEANT_VARIABLES.item_storage_resize */
extern void T29f62(T0* C, T6 a1);
/* GEANT_VARIABLES.slots_resize */
extern void T29f61(T0* C, T6 a1);
/* GEANT_VARIABLES.new_capacity */
extern T6 T29f23(T0* C, T6 a1);
/* GEANT_VARIABLES.item_storage_put */
extern void T29f55(T0* C, T0* a1, T6 a2);
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
extern unsigned char ge258os1797;
extern T0* ge258ov1797;
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
extern void T34f49(T0* C, T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.search_position */
extern void T34f53(T0* C, T0* a1);
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
extern void T109f6(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_OPTION].add_traversing_cursor */
extern void T74f27(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].set_next_cursor */
extern void T109f7(T0* C, T0* a1);
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
extern T1 T109f4(T0* C);
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
extern void T113f6(T0* C, T6 a1);
/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].add_traversing_cursor */
extern void T75f25(T0* C, T0* a1);
/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].set_next_cursor */
extern void T113f7(T0* C, T0* a1);
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
extern T1 T113f4(T0* C);
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
extern T0* T109c5(T0* a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].make */
extern T0* T112f1(T0* C, T6 a1);
/* TO_SPECIAL [AP_OPTION].make_area */
extern T0* T186c2(T6 a1);
/* SPECIAL [AP_OPTION].make */
extern T0* T111c4(T6 a1);
/* KL_SPECIAL_ROUTINES [AP_OPTION].default_create */
extern T0* T112c3(void);
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
extern T0* T115f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].aliased_resized_area */
extern T0* T114f3(T0* C, T6 a1);
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
extern T0* T112f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [AP_OPTION].aliased_resized_area */
extern T0* T111f3(T0* C, T6 a1);
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
extern T0* T113c5(T0* a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T115f1(T0* C, T6 a1);
/* TO_SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].make_area */
extern T0* T187c2(T6 a1);
/* SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST].make */
extern T0* T114c4(T6 a1);
/* KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST].default_create */
extern T0* T115c3(void);
/* UT_ERROR_HANDLER.make_standard */
extern T0* T28c7(void);
/* UT_ERROR_HANDLER.std */
extern T0* T28f4(T0* C);
/* KL_ARGUMENTS.set_program_name */
extern void T27f5(T0* C, T0* a1);
/* GEANT.arguments */
extern T0* T21f10(T0* C);
/* DIRECTORY.dispose */
extern void T661f15(T0* C);
/* DIRECTORY.close */
extern void T661f20(T0* C);
/* DIRECTORY.default_pointer */
extern T14 T661f9(T0* C);
/* DIRECTORY.dir_close */
extern void T661f25(T0* C, T14 a1);
/* DIRECTORY.is_closed */
extern T1 T661f5(T0* C);
/* RAW_FILE.dispose */
extern void T660f14(T0* C);
/* RAW_FILE.close */
extern void T660f17(T0* C);
/* RAW_FILE.file_close */
extern void T660f19(T0* C, T14 a1);
/* RAW_FILE.is_closed */
extern T1 T660f10(T0* C);
/* KL_BINARY_OUTPUT_FILE.dispose */
extern void T656f20(T0* C);
/* KL_BINARY_OUTPUT_FILE.old_close */
extern void T656f25(T0* C);
/* KL_BINARY_OUTPUT_FILE.file_close */
extern void T656f28(T0* C, T14 a1);
/* KL_BINARY_OUTPUT_FILE.old_is_closed */
extern T1 T656f11(T0* C);
/* KL_BINARY_INPUT_FILE.dispose */
extern void T655f34(T0* C);
/* KL_BINARY_INPUT_FILE.old_close */
extern void T655f39(T0* C);
/* KL_BINARY_INPUT_FILE.file_close */
extern void T655f41(T0* C, T14 a1);
/* KL_BINARY_INPUT_FILE.old_is_closed */
extern T1 T655f12(T0* C);
/* KL_TEXT_OUTPUT_FILE.dispose */
extern void T515f21(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_close */
extern void T515f27(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_close */
extern void T515f32(T0* C, T14 a1);
/* KL_TEXT_OUTPUT_FILE.old_is_closed */
extern T1 T515f11(T0* C);
/* KL_DIRECTORY.dispose */
extern void T488f36(T0* C);
/* KL_DIRECTORY.old_close */
extern void T488f39(T0* C);
/* KL_DIRECTORY.default_pointer */
extern T14 T488f11(T0* C);
/* KL_DIRECTORY.dir_close */
extern void T488f40(T0* C, T14 a1);
/* KL_DIRECTORY.is_closed */
extern T1 T488f16(T0* C);
/* MANAGED_POINTER.dispose */
extern void T263f8(T0* C);
/* POINTER.memory_free */
extern void T14f8(T14* C);
/* POINTER.default_pointer */
extern T14 T14f5(T14* C);
/* POINTER.c_free */
extern void T14f9(T14* C, T14 a1);
/* KL_TEXT_INPUT_FILE.dispose */
extern void T55f57(T0* C);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].record */
extern void T629f5(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.put */
extern void T600f12(T0* C, T6 a1);
/* LX_SYMBOL_PARTITIONS.put */
extern void T600f12p1(T0* C, T6 a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].record */
extern void T627f4(T0* C, T0* a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].record */
extern void T625f5(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.add */
extern void T600f11(T0* C, T0* a1);
/* LX_SYMBOL_PARTITIONS.add */
extern void T600f11p1(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.log_validation_messages */
extern void T318f34(T0* C);
/* GEANT_REPLACE_TASK.validation_messages */
extern unsigned char ge58os1779;
extern T0* ge58ov1779;
extern T0* T318f16(T0* C);
/* GEANT_INPUT_TASK.log_validation_messages */
extern void T316f35(T0* C);
/* GEANT_INPUT_TASK.validation_messages */
extern T0* T316f13(T0* C);
/* GEANT_AVAILABLE_TASK.log_validation_messages */
extern void T314f25(T0* C);
/* GEANT_AVAILABLE_TASK.validation_messages */
extern T0* T314f5(T0* C);
/* GEANT_PRECURSOR_TASK.log_validation_messages */
extern void T312f32(T0* C);
/* GEANT_PRECURSOR_TASK.validation_messages */
extern T0* T312f13(T0* C);
/* GEANT_EXIT_TASK.log_validation_messages */
extern void T310f26(T0* C);
/* GEANT_EXIT_TASK.validation_messages */
extern T0* T310f7(T0* C);
/* GEANT_OUTOFDATE_TASK.log_validation_messages */
extern void T308f31(T0* C);
/* GEANT_OUTOFDATE_TASK.validation_messages */
extern T0* T308f13(T0* C);
/* GEANT_XSLT_TASK.log_validation_messages */
extern void T306f44(T0* C);
/* GEANT_XSLT_TASK.validation_messages */
extern T0* T306f23(T0* C);
/* GEANT_SETENV_TASK.log_validation_messages */
extern void T304f27(T0* C);
/* GEANT_SETENV_TASK.validation_messages */
extern T0* T304f8(T0* C);
/* GEANT_MOVE_TASK.log_validation_messages */
extern void T302f29(T0* C);
/* GEANT_MOVE_TASK.validation_messages */
extern T0* T302f11(T0* C);
/* GEANT_COPY_TASK.log_validation_messages */
extern void T300f34(T0* C);
/* GEANT_COPY_TASK.validation_messages */
extern T0* T300f13(T0* C);
/* GEANT_DELETE_TASK.log_validation_messages */
extern void T298f29(T0* C);
/* GEANT_DELETE_TASK.validation_messages */
extern T0* T298f11(T0* C);
/* GEANT_MKDIR_TASK.log_validation_messages */
extern void T296f25(T0* C);
/* GEANT_MKDIR_TASK.validation_messages */
extern T0* T296f5(T0* C);
/* GEANT_ECHO_TASK.log_validation_messages */
extern void T294f25(T0* C);
/* GEANT_ECHO_TASK.validation_messages */
extern T0* T294f5(T0* C);
/* GEANT_GEANT_TASK.log_validation_messages */
extern void T292f40(T0* C);
/* GEANT_GEANT_TASK.validation_messages */
extern T0* T292f20(T0* C);
/* GEANT_GETEST_TASK.log_validation_messages */
extern void T290f42(T0* C);
/* GEANT_GETEST_TASK.validation_messages */
extern T0* T290f22(T0* C);
/* GEANT_GEPP_TASK.log_validation_messages */
extern void T288f37(T0* C);
/* GEANT_GEPP_TASK.validation_messages */
extern T0* T288f16(T0* C);
/* GEANT_GEYACC_TASK.log_validation_messages */
extern void T286f37(T0* C);
/* GEANT_GEYACC_TASK.validation_messages */
extern T0* T286f15(T0* C);
/* GEANT_GELEX_TASK.log_validation_messages */
extern void T284f40(T0* C);
/* GEANT_GELEX_TASK.validation_messages */
extern T0* T284f18(T0* C);
/* GEANT_GEXACE_TASK.log_validation_messages */
extern void T282f38(T0* C);
/* GEANT_GEXACE_TASK.validation_messages */
extern T0* T282f16(T0* C);
/* GEANT_UNSET_TASK.log_validation_messages */
extern void T280f26(T0* C);
/* GEANT_UNSET_TASK.validation_messages */
extern T0* T280f7(T0* C);
/* GEANT_SET_TASK.log_validation_messages */
extern void T278f27(T0* C);
/* GEANT_SET_TASK.validation_messages */
extern T0* T278f8(T0* C);
/* GEANT_LCC_TASK.log_validation_messages */
extern void T276f27(T0* C);
/* GEANT_LCC_TASK.validation_messages */
extern T0* T276f8(T0* C);
/* GEANT_EXEC_TASK.log_validation_messages */
extern void T274f26(T0* C);
/* GEANT_EXEC_TASK.validation_messages */
extern T0* T274f6(T0* C);
/* GEANT_ISE_TASK.log_validation_messages */
extern void T272f36(T0* C);
/* GEANT_ISE_TASK.validation_messages */
extern T0* T272f14(T0* C);
/* GEANT_GEC_TASK.log_validation_messages */
extern void T265f39(T0* C);
/* GEANT_GEC_TASK.validation_messages */
extern T0* T265f17(T0* C);
/* GEANT_REPLACE_TASK.execute */
extern void T318f40(T0* C);
/* GEANT_REPLACE_COMMAND.execute */
extern void T461f40(T0* C);
/* GEANT_FILESET.forth */
extern void T389f50(T0* C);
/* GEANT_FILESET.update_project_variables */
extern void T389f55(T0* C);
/* GEANT_FILESET.remove_project_variables */
extern void T389f51(T0* C);
/* GEANT_PROJECT_VARIABLES.remove */
extern void T25f86(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.remove_position */
extern void T25f88(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.key_storage_put */
extern void T25f71(T0* C, T0* a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.item_storage_put */
extern void T25f67(T0* C, T0* a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.clashes_put */
extern void T25f69(T0* C, T6 a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.slots_put */
extern void T25f70(T0* C, T6 a1, T6 a2);
/* GEANT_PROJECT_VARIABLES.clashes_item */
extern T6 T25f21(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.move_cursors_forth */
extern void T25f90(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.move_all_cursors */
extern void T25f92(T0* C, T6 a1, T6 a2);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].set_position */
extern void T64f10(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.move_cursors_after */
extern void T25f91(T0* C, T6 a1);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].set_next_cursor */
extern void T64f11(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.internal_set_key_equality_tester */
extern void T25f89(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.slots_item */
extern T6 T25f22(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.hash_position */
extern T6 T25f33(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.key_storage_item */
extern T0* T25f27(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.search_position */
extern void T25f66(T0* C, T0* a1);
/* GEANT_FILESET.off */
extern T1 T389f27(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].off */
extern T1 T502f37(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_off */
extern T1 T502f29(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].forth */
extern void T502f47(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_forth */
extern void T502f51(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].add_traversing_cursor */
extern void T502f59(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].set_next_cursor */
extern void T541f6(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].remove_traversing_cursor */
extern void T502f58(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [GEANT_FILESET_ENTRY].set_position */
extern void T541f5(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].clashes_item */
extern T6 T502f30(T0* C, T6 a1);
/* GEANT_REPLACE_COMMAND.create_directory_for_pathname */
extern void T461f42(T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.file_system */
extern T0* T461f20(T0* C);
/* GEANT_REPLACE_COMMAND.windows_file_system */
extern T0* T461f27(T0* C);
/* GEANT_REPLACE_COMMAND.operating_system */
extern T0* T461f26(T0* C);
/* GEANT_FILESET.item_mapped_filename */
extern T0* T389f26(T0* C);
/* GEANT_FILESET_ENTRY.mapped_filename_converted */
extern T0* T543f8(T0* C);
/* GEANT_FILESET_ENTRY.unix_file_system */
extern T0* T543f10(T0* C);
/* GEANT_FILESET_ENTRY.file_system */
extern T0* T543f9(T0* C);
/* GEANT_FILESET_ENTRY.windows_file_system */
extern T0* T543f12(T0* C);
/* GEANT_FILESET_ENTRY.operating_system */
extern T0* T543f11(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_for_iteration */
extern T0* T502f18(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_item */
extern T0* T502f20(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_storage_item */
extern T0* T502f22(T0* C, T6 a1);
/* GEANT_FILESET.item_filename */
extern T0* T389f25(T0* C);
/* GEANT_FILESET_ENTRY.filename_converted */
extern T0* T543f7(T0* C);
/* GEANT_REPLACE_COMMAND.unix_file_system */
extern T0* T461f19(T0* C);
/* GEANT_FILESET.is_in_gobo_31_format */
extern T1 T389f21(T0* C);
/* GEANT_FILESET.after */
extern T1 T389f20(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].after */
extern T1 T502f17(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_after */
extern T1 T502f19(T0* C, T0* a1);
/* GEANT_FILESET.start */
extern void T389f49(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].start */
extern void T502f46(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_start */
extern void T502f50(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].is_empty */
extern T1 T502f28(T0* C);
/* GEANT_FILESET.execute */
extern void T389f48(T0* C);
/* GEANT_FILESET.remove_fileset_entry */
extern void T389f54(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].remove */
extern void T502f49(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].remove_position */
extern void T502f57(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_storage_put */
extern void T502f66(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_storage_put */
extern void T502f53(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].clashes_put */
extern void T502f55(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].slots_put */
extern void T502f56(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].move_cursors_forth */
extern void T502f65(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].move_all_cursors */
extern void T502f68(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].move_cursors_after */
extern void T502f67(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].internal_set_key_equality_tester */
extern void T502f64(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_equality_tester */
extern T0* T502f34(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].slots_item */
extern T6 T502f26(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].hash_position */
extern T6 T502f24(T0* C, T0* a1);
/* GEANT_FILESET_ENTRY.hash_code */
extern T6 T543f3(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_storage_item */
extern T0* T502f35(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].search_position */
extern void T502f52(T0* C, T0* a1);
/* KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY].test */
extern T1 T540f1(T0* C, T0* a1, T0* a2);
/* KL_EQUALITY_TESTER [GEANT_FILESET_ENTRY].any_ */
extern T0* T540f2(T0* C);
/* GEANT_FILESET_ENTRY.make */
extern T0* T543c13(T0* a1, T0* a2);
/* DS_HASH_SET_CURSOR [STRING_8].forth */
extern void T545f8(T0* C);
/* DS_HASH_SET [STRING_8].cursor_forth */
extern void T504f53(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].add_traversing_cursor */
extern void T504f55(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_next_cursor */
extern void T545f10(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].remove_traversing_cursor */
extern void T504f54(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].set_position */
extern void T545f9(T0* C, T6 a1);
/* GEANT_FILESET.add_fileset_entry_if_necessary */
extern void T389f53(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].force_last */
extern void T502f48(T0* C, T0* a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].resize */
extern void T502f54(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].clashes_resize */
extern void T502f63(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].key_storage_resize */
extern void T502f62(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].item_storage_resize */
extern void T502f61(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [GEANT_FILESET_ENTRY].resize */
extern T0* T542f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [GEANT_FILESET_ENTRY].aliased_resized_area */
extern T0* T544f3(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].slots_resize */
extern void T502f60(T0* C, T6 a1);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].new_capacity */
extern T6 T502f23(T0* C, T6 a1);
/* GEANT_FILESET.is_file_outofdate */
extern T1 T389f29(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.file_time_stamp */
extern T6 T53f32(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.time_stamp */
extern T6 T55f40(T0* C);
/* KL_TEXT_INPUT_FILE.date */
extern T6 T55f42(T0* C);
/* UNIX_FILE_INFO.date */
extern T6 T87f8(T0* C);
/* KL_UNIX_FILE_SYSTEM.file_time_stamp */
extern T6 T54f30(T0* C, T0* a1);
/* GEANT_MAP.mapped_filename */
extern T0* T499f8(T0* C, T0* a1);
/* UC_UTF8_STRING.remove_tail */
extern void T206f84(T0* C, T6 a1);
/* STRING_8.remove_tail */
extern void T17f56(T0* C, T6 a1);
/* UC_UTF8_STRING.remove_head */
extern void T206f83(T0* C, T6 a1);
/* STRING_8.remove_head */
extern void T17f55(T0* C, T6 a1);
/* GEANT_MAP.glob_postfix */
extern T0* T499f16(T0* C, T0* a1);
/* GEANT_MAP.glob_prefix */
extern T0* T499f15(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.replace_all */
extern T0* T565f54(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_replace_all_to_string */
extern void T565f303(T0* C, T0* a1, T0* a2);
/* RX_PCRE_REGULAR_EXPRESSION.match_substring */
extern void T565f315(T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_it */
extern void T565f328(T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_start */
extern T1 T565f149(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_internal */
extern T6 T565f231(T0* C, T6 a1, T1 a2, T1 a3);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_type */
extern T6 T565f295(T0* C, T6 a1, T6 a2, T6 a3, T1 a4);
/* RX_PCRE_REGULAR_EXPRESSION.match_not_repeated_characters */
extern T6 T565f294(T0* C, T6 a1, T6 a2, T6 a3, T1 a4);
/* RX_PCRE_REGULAR_EXPRESSION.infinity */
extern unsigned char ge499os10724;
extern T6 ge499ov10724;
extern T6 T565f60(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.platform */
extern T0* T565f193(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_characters */
extern T6 T565f293(T0* C, T6 a1, T6 a2, T6 a3, T1 a4);
/* RX_BYTE_CODE.character_item */
extern T6 T609f8(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_classes */
extern T6 T565f292(T0* C, T6 a1);
/* RX_BYTE_CODE.character_set_has */
extern T1 T609f10(T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.match_repeated_refs */
extern T6 T565f291(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_ref */
extern T6 T565f297(T0* C, T6 a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.space_set */
extern unsigned char ge505os10891;
extern T0* ge505ov10891;
extern T0* T565f150(T0* C);
/* RX_CHARACTER_SET.make */
extern T0* T611c4(T0* a1);
/* RX_CHARACTER_SET.add_string */
extern void T611f10(T0* C, T0* a1);
/* RX_CHARACTER_SET.add_character */
extern void T611f9(T0* C, T6 a1);
/* RX_CHARACTER_SET.make_empty */
extern void T611f5(T0* C);
/* RX_CHARACTER_SET.make_empty */
extern T0* T611c5(void);
/* RX_CHARACTER_SET.special_boolean_ */
extern unsigned char ge181os2187;
extern T0* ge181ov2187;
extern T0* T611f3(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.digit_set */
extern unsigned char ge505os10883;
extern T0* ge505ov10883;
extern T0* T565f166(T0* C);
/* RX_CHARACTER_SET.has */
extern T1 T611f2(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_ims_options */
extern void T565f326(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_dotall */
extern T1 T565f85(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_multiline */
extern T1 T565f84(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_caseless */
extern T1 T565f83(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_match_count */
extern void T565f335(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_next_start */
extern void T565f334(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_recursive */
extern T6 T565f290(T0* C, T6 a1, T1 a2, T1 a3);
/* RX_BYTE_CODE.integer_item */
extern T6 T609f11(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.next_matching_alternate */
extern T6 T565f288(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.match_additional_bracket */
extern T6 T565f269(T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.opcode_item */
extern T6 T609f7(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.special_integer_ */
extern T0* T565f56(T0* C);
/* RX_CASE_MAPPING.flip_case */
extern T6 T610f4(T0* C, T6 a1);
/* RX_CASE_MAPPING.to_lower */
extern T6 T610f3(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.captured_end_position */
extern T6 T565f53(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_replacement_to_string */
extern void T565f316(T0* C, T0* a1, T0* a2);
/* UC_UTF8_STRING.append_code */
extern void T206f86(T0* C, T10 a1);
/* UC_UTF8_STRING.append_item_code */
extern void T206f87(T0* C, T6 a1);
/* STRING_8.append_code */
extern void T17f57(T0* C, T10 a1);
/* STRING_8.put_code */
extern void T17f58(T0* C, T10 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.append_captured_substring_to_string */
extern void T565f329(T0* C, T0* a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.captured_start_position */
extern T6 T565f52(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.string_ */
extern T0* T565f58(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.has_matched */
extern T1 T565f229(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.match */
extern void T565f302(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.is_compiled */
extern T1 T565f230(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.compile */
extern void T565f299(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.compile */
extern void T565f299p1(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_startline */
extern void T565f314(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.has_startline */
extern T1 T565f228(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.first_significant_code */
extern T6 T565f188(T0* C, T6 a1, T6 a2, T1 a3);
/* RX_PCRE_REGULAR_EXPRESSION.find_firstchar */
extern T6 T565f227(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_anchored */
extern void T565f313(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.can_anchored */
extern T1 T565f226(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.ims_options */
extern T6 T565f82(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_option_dotall */
extern T6 T565f131(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_option_multiline */
extern T6 T565f129(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_option_caseless */
extern T6 T565f127(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.compile_regexp */
extern void T565f312(T0* C, T6 a1, T1 a2, T1 a3, T6 a4);
/* RX_BYTE_CODE.set_count */
extern void T609f18(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.find_fixed_code_length */
extern T6 T565f65(T0* C, T6 a1);
/* RX_BYTE_CODE.put_integer */
extern void T609f17(T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.compile_branch */
extern void T565f327(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.meta_set */
extern unsigned char ge505os10892;
extern T0* ge505ov10892;
extern T0* T565f146(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.maxlit */
extern unsigned char ge499os10725;
extern T6 ge499ov10725;
extern T6 T565f145(T0* C);
/* RX_BYTE_CODE.append_character */
extern void T609f19(T0* C, T6 a1);
/* RX_BYTE_CODE.put_character */
extern void T609f25(T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.resize_byte_code */
extern void T609f24(T0* C, T6 a1);
/* RX_BYTE_CODE.special_integer_ */
extern T0* T609f9(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.scan_escape */
extern T6 T565f140(T0* C, T6 a1, T1 a2);
/* RX_PCRE_REGULAR_EXPRESSION.scan_hex_number */
extern T6 T565f221(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.xdigit_set */
extern unsigned char ge505os10885;
extern T0* ge505ov10885;
extern T0* T565f243(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.scan_octal_number */
extern T6 T565f220(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.escape_character */
extern T6 T565f216(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.to_option_ims */
extern T6 T565f134(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_ichanged */
extern void T565f325(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.unset_option_dotall */
extern T6 T565f132(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.unset_option_multiline */
extern T6 T565f130(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.unset_option_caseless */
extern T6 T565f128(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.scan_decimal_number */
extern T6 T565f109(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.compile_repeats */
extern void T565f332(T0* C, T6 a1, T6 a2, T6 a3, T6 a4, T6 a5);
/* RX_BYTE_CODE.append_subcopy */
extern void T609f23(T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.put_opcode */
extern void T609f22(T0* C, T6 a1, T6 a2);
/* RX_BYTE_CODE.move_right */
extern void T609f21(T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.compile_single_repeat */
extern void T565f333(T0* C, T6 a1, T6 a2, T6 a3, T6 a4, T6 a5, T6 a6);
/* RX_PCRE_REGULAR_EXPRESSION.compile_character_class */
extern void T565f331(T0* C);
/* RX_BYTE_CODE.append_character_set */
extern void T609f20(T0* C, T0* a1, T1 a2);
/* RX_BYTE_CODE.resize_character_sets */
extern void T609f26(T0* C, T6 a1);
/* RX_BYTE_CODE.special_boolean_ */
extern T0* T609f12(T0* C);
/* RX_CHARACTER_SET.add_set */
extern void T611f8(T0* C, T0* a1);
/* RX_CHARACTER_SET.add_negated_set */
extern void T611f7(T0* C, T0* a1);
/* ARRAY [RX_CHARACTER_SET].item */
extern T0* T614f4(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.class_sets */
extern unsigned char ge505os10894;
extern T0* ge505ov10894;
extern T0* T565f158(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.default_word_set */
extern unsigned char ge505os10879;
extern T0* ge505ov10879;
extern T0* T565f147(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.punct_set */
extern unsigned char ge505os10889;
extern T0* ge505ov10889;
extern T0* T565f242(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.print_set */
extern unsigned char ge505os10888;
extern T0* ge505ov10888;
extern T0* T565f241(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.graph_set */
extern unsigned char ge505os10887;
extern T0* ge505ov10887;
extern T0* T565f240(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.cntrl_set */
extern unsigned char ge505os10886;
extern T0* ge505ov10886;
extern T0* T565f239(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.ascii_set */
extern unsigned char ge505os10890;
extern T0* ge505ov10890;
extern T0* T565f238(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.alnum_set */
extern unsigned char ge505os10884;
extern T0* ge505ov10884;
extern T0* T565f237(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.upper_set */
extern unsigned char ge505os10880;
extern T0* ge505ov10880;
extern T0* T565f236(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.lower_set */
extern unsigned char ge505os10881;
extern T0* ge505ov10881;
extern T0* T565f235(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.alpha_set */
extern unsigned char ge505os10882;
extern T0* ge505ov10882;
extern T0* T565f233(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.check_posix_name */
extern T6 T565f156(T0* C, T6 a1, T6 a2);
/* RX_PCRE_REGULAR_EXPRESSION.class_names */
extern unsigned char ge505os10893;
extern T0* ge505ov10893;
extern T0* T565f234(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.check_posix_syntax */
extern T6 T565f154(T0* C, T6 a1);
/* RX_CHARACTER_SET.wipe_out */
extern void T611f6(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.actual_set */
extern unsigned char ge499os10723;
extern T0* ge499ov10723;
extern T0* T565f151(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.compile_counted_repeats */
extern T1 T565f87(T0* C, T6 a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.scan_comment */
extern void T565f330(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.is_option_undef */
extern T1 T565f62(T0* C, T6 a1);
/* RX_BYTE_CODE.append_integer */
extern void T609f16(T0* C, T6 a1);
/* RX_BYTE_CODE.append_opcode */
extern void T609f15(T0* C, T6 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_error */
extern void T565f311(T0* C, T0* a1, T6 a2, T6 a3);
/* RX_PCRE_REGULAR_EXPRESSION.set_default_internal_options */
extern void T565f310(T0* C);
/* RX_BYTE_CODE.wipe_out */
extern void T609f14(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.wipe_out */
extern void T565f309(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.wipe_out */
extern void T565f309p1(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.make */
extern T0* T565c298(void);
/* RX_PCRE_REGULAR_EXPRESSION.make */
extern void T565f298p1(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_default_options */
extern void T565f308(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.set_strict */
extern void T565f324(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_greedy */
extern void T565f323(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_eol */
extern void T565f322(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_bol */
extern void T565f321(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_dollar_endonly */
extern void T565f320(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_empty_allowed */
extern void T565f319(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_extended */
extern void T565f318(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_dotall */
extern void T565f317(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_multiline */
extern void T565f301(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_caseless */
extern void T565f300(T0* C, T1 a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_word_set */
extern void T565f307(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.set_character_case_mapping */
extern void T565f306(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.default_character_case_mapping */
extern unsigned char ge505os10878;
extern T0* ge505ov10878;
extern T0* T565f76(T0* C);
/* RX_CASE_MAPPING.make */
extern T0* T610c6(T0* a1, T0* a2);
/* RX_CASE_MAPPING.add */
extern void T610f8(T0* C, T0* a1, T0* a2);
/* RX_CASE_MAPPING.make_default */
extern void T610f7(T0* C);
/* RX_CASE_MAPPING.clear */
extern void T610f9(T0* C);
/* RX_CASE_MAPPING.special_integer_ */
extern T0* T610f5(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.reset */
extern void T565f305(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.reset */
extern void T565f305p1(T0* C);
/* RX_PCRE_REGULAR_EXPRESSION.empty_pattern */
extern unsigned char ge499os10722;
extern T0* ge499ov10722;
extern T0* T565f75(T0* C);
/* RX_BYTE_CODE.make */
extern T0* T609c13(T6 a1);
/* GEANT_MAP.type_attribute_value_regexp */
extern unsigned char ge136os9343;
extern T0* ge136ov9343;
extern T0* T499f12(T0* C);
/* GEANT_MAP.type_attribute_value_merge */
extern unsigned char ge136os9341;
extern T0* ge136ov9341;
extern T0* T499f11(T0* C);
/* GEANT_MAP.unix_file_system */
extern T0* T499f14(T0* C);
/* GEANT_MAP.type_attribute_value_flat */
extern unsigned char ge136os9340;
extern T0* ge136ov9340;
extern T0* T499f10(T0* C);
/* GEANT_MAP.string_ */
extern T0* T499f9(T0* C);
/* GEANT_MAP.is_executable */
extern T1 T499f7(T0* C);
/* GEANT_MAP.type_attribute_value_glob */
extern unsigned char ge136os9342;
extern T0* ge136ov9342;
extern T0* T499f13(T0* C);
/* DS_HASH_SET_CURSOR [STRING_8].item */
extern T0* T545f4(T0* C);
/* DS_HASH_SET [STRING_8].cursor_item */
extern T0* T504f30(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].after */
extern T1 T545f5(T0* C);
/* DS_HASH_SET [STRING_8].cursor_after */
extern T1 T504f29(T0* C, T0* a1);
/* DS_HASH_SET_CURSOR [STRING_8].start */
extern void T545f7(T0* C);
/* DS_HASH_SET [STRING_8].cursor_start */
extern void T504f52(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].cursor_off */
extern T1 T504f34(T0* C, T0* a1);
/* DS_HASH_SET [STRING_8].is_empty */
extern T1 T504f33(T0* C);
/* GEANT_FILESET.scan_internal */
extern void T389f52(T0* C, T0* a1);
/* KL_DIRECTORY.close */
extern void T488f44(T0* C);
/* LX_DFA_WILDCARD.recognizes */
extern T1 T506f10(T0* C, T0* a1);
/* LX_DFA_WILDCARD.longest_end_position */
extern T6 T506f11(T0* C, T0* a1, T6 a2);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_readable */
extern T1 T53f31(T0* C, T0* a1);
/* KL_DIRECTORY.is_readable */
extern T1 T488f29(T0* C);
/* KL_DIRECTORY.old_is_readable */
extern T1 T488f17(T0* C);
/* KL_DIRECTORY.eif_dir_is_readable */
extern T1 T488f27(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.is_directory_readable */
extern T1 T54f29(T0* C, T0* a1);
/* GEANT_FILESET.string_ */
extern T0* T389f28(T0* C);
/* KL_DIRECTORY.read_entry */
extern void T488f43(T0* C);
/* KL_DIRECTORY.readentry */
extern void T488f47(T0* C);
/* KL_DIRECTORY.dir_next */
extern T0* T488f23(T0* C, T14 a1);
/* KL_DIRECTORY.old_end_of_input */
extern T1 T488f20(T0* C);
/* KL_DIRECTORY.is_open_read */
extern T1 T488f12(T0* C);
/* KL_DIRECTORY.open_read */
extern void T488f42(T0* C);
/* KL_DIRECTORY.old_open_read */
extern void T488f46(T0* C);
/* KL_DIRECTORY.dir_open */
extern T14 T488f21(T0* C, T14 a1);
/* GEANT_FILESET.unix_file_system */
extern T0* T389f24(T0* C);
/* GEANT_FILESET.file_system */
extern T0* T389f23(T0* C);
/* GEANT_FILESET.windows_file_system */
extern T0* T389f32(T0* C);
/* GEANT_FILESET.operating_system */
extern T0* T389f31(T0* C);
/* GEANT_FILESET.is_executable */
extern T1 T389f19(T0* C);
/* GEANT_FILESET.is_in_gobo_32_format */
extern T1 T389f22(T0* C);
/* GEANT_REPLACE_COMMAND.execute_replace */
extern void T461f41(T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_COMMAND.execute_replace_token */
extern void T461f45(T0* C, T0* a1, T0* a2);
/* KL_TEXT_OUTPUT_FILE.close */
extern void T515f25(T0* C);
/* KL_STRING_ROUTINES.replaced_first_substring */
extern T0* T76f16(T0* C, T0* a1, T0* a2, T0* a3);
/* KL_STRING_ROUTINES.substring_index */
extern T6 T76f17(T0* C, T0* a1, T0* a2, T6 a3);
/* KL_STRING_ROUTINES.platform */
extern T0* T76f18(T0* C);
/* STRING_8.substring_index */
extern T6 T17f32(T0* C, T0* a1, T6 a2);
/* STRING_SEARCHER.substring_index */
extern T6 T677f2(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* STRING_SEARCHER.substring_index_with_deltas */
extern T6 T677f3(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* STRING_SEARCHER.internal_initialize_deltas */
extern void T677f6(T0* C, T0* a1, T6 a2, T0* a3);
/* SPECIAL [INTEGER_32].fill_with */
extern void T63f13(T0* C, T6 a1, T6 a2, T6 a3);
/* STRING_8.string_searcher */
extern unsigned char ge2356os1265;
extern T0* ge2356ov1265;
extern T0* T17f33(T0* C);
/* STRING_SEARCHER.make */
extern T0* T677c5(void);
/* KL_STRING_ROUTINES.replaced_all_substrings */
extern T0* T76f15(T0* C, T0* a1, T0* a2, T0* a3);
/* GEANT_REPLACE_COMMAND.string_ */
extern T0* T461f25(T0* C);
/* UC_UTF8_STRING.has */
extern T1 T206f52(T0* C, T2 a1);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T515f23(T0* C);
/* KL_TEXT_OUTPUT_FILE.is_closed */
extern T1 T515f13(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_write */
extern void T515f29(T0* C);
/* KL_TEXT_OUTPUT_FILE.default_pointer */
extern T14 T515f17(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_write */
extern void T515f29p1(T0* C);
/* KL_TEXT_OUTPUT_FILE.file_open */
extern T14 T515f18(T0* C, T14 a1, T6 a2);
/* KL_TEXT_OUTPUT_FILE.reset */
extern void T515f35(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.make */
extern void T515f20(T0* C, T0* a1);
/* KL_TEXT_OUTPUT_FILE.make */
extern T0* T515c20(T0* a1);
/* KL_TEXT_OUTPUT_FILE.old_make */
extern void T515f26(T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.tmp_output_file */
extern unsigned char ge90os8657;
extern T0* ge90ov8657;
extern T0* T461f24(T0* C);
/* KL_TEXT_INPUT_FILE.read_string */
extern void T55f68(T0* C, T6 a1);
/* KL_TEXT_INPUT_FILE.read_to_string */
extern T6 T55f32(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
extern unsigned char ge216os4039;
extern T0* ge216ov4039;
extern T0* T55f37(T0* C);
/* KL_TEXT_INPUT_FILE.any_ */
extern T0* T55f34(T0* C);
/* KL_TEXT_INPUT_FILE.old_read_to_string */
extern T6 T55f36(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_TEXT_INPUT_FILE.file_gss */
extern T6 T55f38(T0* C, T14 a1, T14 a2, T6 a3);
/* SPECIAL [CHARACTER_8].item_address */
extern T14 T15f6(T0* C, T6 a1);
/* GEANT_REPLACE_COMMAND.tmp_input_file */
extern unsigned char ge90os8656;
extern T0* ge90ov8656;
extern T0* T461f22(T0* C);
/* GEANT_REPLACE_COMMAND.execute_replace_regexp */
extern void T461f44(T0* C, T0* a1, T0* a2);
/* RX_PCRE_REGULAR_EXPRESSION.replace */
extern T0* T565f55(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.append_replace_to_string */
extern void T565f304(T0* C, T0* a1, T0* a2);
/* GEANT_REPLACE_COMMAND.execute_replace_variable_pattern */
extern void T461f43(T0* C, T0* a1, T0* a2);
/* ARRAY [GEANT_VARIABLES].item */
extern T0* T568f4(T0* C, T6 a1);
/* GEANT_PROJECT.aggregated_variables_array */
extern T0* T22f27(T0* C);
/* ARRAY [GEANT_VARIABLES].put */
extern void T568f6(T0* C, T0* a1, T6 a2);
/* ARRAY [GEANT_VARIABLES].make */
extern T0* T568c5(T6 a1, T6 a2);
/* ARRAY [GEANT_VARIABLES].make_area */
extern void T568f7(T0* C, T6 a1);
/* UC_UTF8_STRING.occurrences */
extern T6 T206f51(T0* C, T2 a1);
/* UC_UTF8_STRING.code_occurrences */
extern T6 T206f53(T0* C, T6 a1);
/* STRING_8.occurrences */
extern T6 T17f31(T0* C, T2 a1);
/* GEANT_REPLACE_COMMAND.is_file_to_file_executable */
extern T1 T461f16(T0* C);
/* GEANT_REPLACE_COMMAND.is_replace_executable */
extern T1 T461f18(T0* C);
/* GEANT_REPLACE_TASK.exit_application */
extern void T318f41(T0* C, T6 a1, T0* a2);
/* GEANT_REPLACE_TASK.exceptions */
extern T0* T318f27(T0* C);
/* GEANT_REPLACE_TASK.std */
extern T0* T318f26(T0* C);
/* GEANT_REPLACE_TASK.log_messages */
extern void T318f42(T0* C, T0* a1);
/* GEANT_REPLACE_TASK.dir_attribute_name */
extern T0* T318f25(T0* C);
/* GEANT_REPLACE_TASK.file_system */
extern T0* T318f24(T0* C);
/* GEANT_REPLACE_TASK.unix_file_system */
extern T0* T318f30(T0* C);
/* GEANT_REPLACE_TASK.windows_file_system */
extern T0* T318f29(T0* C);
/* GEANT_REPLACE_TASK.operating_system */
extern T0* T318f28(T0* C);
/* GEANT_INPUT_TASK.execute */
extern void T316f41(T0* C);
/* GEANT_INPUT_COMMAND.execute */
extern void T458f23(T0* C);
/* GEANT_PROJECT.set_variable_value */
extern void T22f51(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT.is_local_variable */
extern T1 T22f26(T0* C, T0* a1);
/* RX_PCRE_REGULAR_EXPRESSION.matches */
extern T1 T565f70(T0* C, T0* a1);
/* DS_LINKED_LIST [STRING_8].has */
extern T1 T240f9(T0* C, T0* a1);
/* GEANT_INPUT_COMMAND.string_ */
extern T0* T458f14(T0* C);
/* KL_STDIN_FILE.read_line */
extern void T567f16(T0* C);
/* KL_STDIN_FILE.unread_character */
extern void T567f19(T0* C, T2 a1);
/* KL_LINKABLE [CHARACTER_8].put_right */
extern void T88f4(T0* C, T0* a1);
/* KL_LINKABLE [CHARACTER_8].make */
extern T0* T88c3(T2 a1);
/* KL_STDIN_FILE.read_character */
extern void T567f18(T0* C);
/* KL_STDIN_FILE.old_read_character */
extern void T567f22(T0* C);
/* KL_STDIN_FILE.console_readchar */
extern T2 T567f12(T0* C, T14 a1);
/* KL_STDIN_FILE.old_end_of_file */
extern T1 T567f9(T0* C);
/* KL_STDIN_FILE.console_eof */
extern T1 T567f13(T0* C, T14 a1);
/* GEANT_INPUT_COMMAND.input */
extern unsigned char ge229os2997;
extern T0* ge229ov2997;
extern T0* T458f13(T0* C);
/* KL_STDIN_FILE.make */
extern T0* T567c14(void);
/* KL_STDIN_FILE.make_open_stdin */
extern void T567f17(T0* C, T0* a1);
/* KL_STDIN_FILE.set_read_mode */
extern void T567f21(T0* C);
/* KL_STDIN_FILE.console_def */
extern T14 T567f8(T0* C, T6 a1);
/* KL_STDIN_FILE.old_make */
extern void T567f20(T0* C, T0* a1);
/* GEANT_INPUT_COMMAND.output */
extern T0* T458f12(T0* C);
/* DS_LINKED_LIST [STRING_8].set_equality_tester */
extern void T240f17(T0* C, T0* a1);
/* GEANT_INPUT_TASK.exit_application */
extern void T316f42(T0* C, T6 a1, T0* a2);
/* GEANT_INPUT_TASK.exceptions */
extern T0* T316f28(T0* C);
/* GEANT_INPUT_TASK.log_messages */
extern void T316f43(T0* C, T0* a1);
/* GEANT_INPUT_TASK.dir_attribute_name */
extern T0* T316f27(T0* C);
/* GEANT_INPUT_TASK.file_system */
extern T0* T316f26(T0* C);
/* GEANT_INPUT_TASK.unix_file_system */
extern T0* T316f31(T0* C);
/* GEANT_INPUT_TASK.windows_file_system */
extern T0* T316f30(T0* C);
/* GEANT_INPUT_TASK.operating_system */
extern T0* T316f29(T0* C);
/* GEANT_AVAILABLE_TASK.execute */
extern void T314f31(T0* C);
/* GEANT_AVAILABLE_COMMAND.execute */
extern void T455f19(T0* C);
/* GEANT_STRING_PROPERTY.non_empty_value_or_else */
extern T0* T385f7(T0* C, T0* a1);
/* GEANT_STRING_PROPERTY.string_value */
extern T0* T385f4(T0* C);
/* GEANT_STRING_PROPERTY.is_defined */
extern T1 T385f5(T0* C);
/* GEANT_STRING_PROPERTY.value */
extern T0* T385f6(T0* C);
/* GEANT_AVAILABLE_TASK.exit_application */
extern void T314f32(T0* C, T6 a1, T0* a2);
/* GEANT_AVAILABLE_TASK.exceptions */
extern T0* T314f17(T0* C);
/* GEANT_AVAILABLE_TASK.std */
extern T0* T314f16(T0* C);
/* GEANT_AVAILABLE_TASK.log_messages */
extern void T314f33(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.project_variables_resolver */
extern T0* T314f10(T0* C);
/* GEANT_AVAILABLE_TASK.dir_attribute_name */
extern T0* T314f15(T0* C);
/* GEANT_AVAILABLE_TASK.file_system */
extern T0* T314f14(T0* C);
/* GEANT_AVAILABLE_TASK.unix_file_system */
extern T0* T314f20(T0* C);
/* GEANT_AVAILABLE_TASK.windows_file_system */
extern T0* T314f19(T0* C);
/* GEANT_AVAILABLE_TASK.operating_system */
extern T0* T314f18(T0* C);
/* GEANT_PRECURSOR_TASK.execute */
extern void T312f39(T0* C);
/* GEANT_PRECURSOR_COMMAND.execute */
extern void T452f11(T0* C);
/* GEANT_PRECURSOR_TASK.dir_attribute_name */
extern T0* T312f24(T0* C);
/* GEANT_PRECURSOR_TASK.file_system */
extern T0* T312f23(T0* C);
/* GEANT_PRECURSOR_TASK.unix_file_system */
extern T0* T312f27(T0* C);
/* GEANT_PRECURSOR_TASK.windows_file_system */
extern T0* T312f26(T0* C);
/* GEANT_PRECURSOR_TASK.operating_system */
extern T0* T312f25(T0* C);
/* GEANT_EXIT_TASK.execute */
extern void T310f32(T0* C);
/* GEANT_EXIT_COMMAND.execute */
extern void T449f10(T0* C);
/* GEANT_EXIT_TASK.exit_application */
extern void T310f33(T0* C, T6 a1, T0* a2);
/* GEANT_EXIT_TASK.exceptions */
extern T0* T310f19(T0* C);
/* GEANT_EXIT_TASK.std */
extern T0* T310f18(T0* C);
/* GEANT_EXIT_TASK.log_messages */
extern void T310f34(T0* C, T0* a1);
/* GEANT_EXIT_TASK.dir_attribute_name */
extern T0* T310f17(T0* C);
/* GEANT_EXIT_TASK.file_system */
extern T0* T310f16(T0* C);
/* GEANT_EXIT_TASK.unix_file_system */
extern T0* T310f22(T0* C);
/* GEANT_EXIT_TASK.windows_file_system */
extern T0* T310f21(T0* C);
/* GEANT_EXIT_TASK.operating_system */
extern T0* T310f20(T0* C);
/* GEANT_OUTOFDATE_TASK.execute */
extern void T308f37(T0* C);
/* GEANT_OUTOFDATE_COMMAND.execute */
extern void T446f28(T0* C);
/* GEANT_FILESET.go_after */
extern void T389f56(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].go_after */
extern void T502f69(T0* C);
/* DS_HASH_SET [GEANT_FILESET_ENTRY].cursor_go_after */
extern void T502f70(T0* C, T0* a1);
/* GEANT_OUTOFDATE_COMMAND.is_file_outofdate */
extern T1 T446f17(T0* C, T0* a1, T0* a2);
/* GEANT_OUTOFDATE_COMMAND.unix_file_system */
extern T0* T446f15(T0* C);
/* GEANT_OUTOFDATE_COMMAND.file_system */
extern T0* T446f14(T0* C);
/* GEANT_OUTOFDATE_COMMAND.windows_file_system */
extern T0* T446f19(T0* C);
/* GEANT_OUTOFDATE_COMMAND.operating_system */
extern T0* T446f18(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_file_executable */
extern T1 T446f12(T0* C);
/* GEANT_OUTOFDATE_TASK.exit_application */
extern void T308f38(T0* C, T6 a1, T0* a2);
/* GEANT_OUTOFDATE_TASK.exceptions */
extern T0* T308f24(T0* C);
/* GEANT_OUTOFDATE_TASK.std */
extern T0* T308f23(T0* C);
/* GEANT_OUTOFDATE_TASK.log_messages */
extern void T308f39(T0* C, T0* a1);
/* GEANT_OUTOFDATE_TASK.dir_attribute_name */
extern T0* T308f22(T0* C);
/* GEANT_OUTOFDATE_TASK.file_system */
extern T0* T308f21(T0* C);
/* GEANT_OUTOFDATE_TASK.unix_file_system */
extern T0* T308f27(T0* C);
/* GEANT_OUTOFDATE_TASK.windows_file_system */
extern T0* T308f26(T0* C);
/* GEANT_OUTOFDATE_TASK.operating_system */
extern T0* T308f25(T0* C);
/* GEANT_XSLT_TASK.execute */
extern void T306f50(T0* C);
/* GEANT_XSLT_COMMAND.execute */
extern void T442f41(T0* C);
/* GEANT_XSLT_COMMAND.execute_gexslt */
extern void T442f45(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_shell */
extern void T442f46(T0* C, T0* a1);
/* DP_SHELL_COMMAND.execute */
extern void T559f13(T0* C);
/* DP_SHELL_COMMAND.operating_system */
extern T0* T559f6(T0* C);
/* DP_SHELL_COMMAND.system */
extern void T559f14(T0* C, T0* a1);
/* DP_SHELL_COMMAND.system_call */
extern T6 T559f9(T0* C, T14 a1);
/* C_STRING.item */
extern T14 T188f4(T0* C);
/* C_STRING.make */
extern T0* T188c9(T0* a1);
/* C_STRING.set_string */
extern void T188f10(T0* C, T0* a1);
/* C_STRING.set_substring */
extern void T188f11(T0* C, T0* a1, T6 a2, T6 a3);
/* MANAGED_POINTER.put_natural_8 */
extern void T263f12(T0* C, T8 a1, T6 a2);
/* POINTER.memory_copy */
extern void T14f12(T14* C, T14 a1, T6 a2);
/* POINTER.c_memcpy */
extern void T14f14(T14* C, T14 a1, T14 a2, T6 a3);
/* NATURAL_32.to_natural_8 */
extern T8 T10f9(T10* C);
/* MANAGED_POINTER.resize */
extern void T263f11(T0* C, T6 a1);
/* POINTER.memory_set */
extern void T14f11(T14* C, T6 a1, T6 a2);
/* POINTER.c_memset */
extern void T14f13(T14* C, T14 a1, T6 a2, T6 a3);
/* POINTER.memory_realloc */
extern T14 T14f6(T14* C, T6 a1);
/* POINTER.c_realloc */
extern T14 T14f7(T14* C, T14 a1, T6 a2);
/* DP_SHELL_COMMAND.default_shell */
extern unsigned char ge2480os4821;
extern T0* ge2480ov4821;
extern T0* T559f8(T0* C);
/* DP_SHELL_COMMAND.get */
extern T0* T559f10(T0* C, T0* a1);
/* DP_SHELL_COMMAND.eif_getenv */
extern T14 T559f11(T0* C, T14 a1);
/* DP_SHELL_COMMAND.make */
extern T0* T559c12(T0* a1);
/* DP_SHELL_COMMAND.string_ */
extern T0* T559f7(T0* C);
/* DS_ARRAYED_LIST [DS_PAIR [STRING_8, STRING_8]].item */
extern T0* T443f9(T0* C, T6 a1);
/* GEANT_XSLT_COMMAND.string_ */
extern T0* T442f23(T0* C);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.set_variables */
extern void T564f5(T0* C, T0* a1);
/* GEANT_VARIABLES_VARIABLE_RESOLVER.make */
extern T0* T564c4(void);
/* GEANT_XSLT_COMMAND.execute_xsltproc */
extern void T442f44(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_xalan_java */
extern void T442f43(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.execute_xalan_cpp */
extern void T442f42(T0* C, T0* a1);
/* GEANT_XSLT_COMMAND.is_file_outofdate */
extern T1 T442f22(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.put */
extern void T29f76(T0* C, T0* a1, T0* a2);
/* GEANT_XSLT_COMMAND.unix_file_system */
extern T0* T442f21(T0* C);
/* GEANT_XSLT_COMMAND.file_system */
extern T0* T442f20(T0* C);
/* GEANT_XSLT_COMMAND.windows_file_system */
extern T0* T442f25(T0* C);
/* GEANT_XSLT_COMMAND.operating_system */
extern T0* T442f24(T0* C);
/* GEANT_XSLT_TASK.exit_application */
extern void T306f51(T0* C, T6 a1, T0* a2);
/* GEANT_XSLT_TASK.exceptions */
extern T0* T306f37(T0* C);
/* GEANT_XSLT_TASK.log_messages */
extern void T306f52(T0* C, T0* a1);
/* GEANT_XSLT_TASK.dir_attribute_name */
extern T0* T306f36(T0* C);
/* GEANT_XSLT_TASK.file_system */
extern T0* T306f35(T0* C);
/* GEANT_XSLT_TASK.unix_file_system */
extern T0* T306f40(T0* C);
/* GEANT_XSLT_TASK.windows_file_system */
extern T0* T306f39(T0* C);
/* GEANT_XSLT_TASK.operating_system */
extern T0* T306f38(T0* C);
/* GEANT_SETENV_TASK.execute */
extern void T304f33(T0* C);
/* GEANT_SETENV_COMMAND.execute */
extern void T438f13(T0* C);
/* KL_EXECUTION_ENVIRONMENT.set_variable_value */
extern void T103f8(T0* C, T0* a1, T0* a2);
/* KL_EXECUTION_ENVIRONMENT.put */
extern void T103f9(T0* C, T0* a1, T0* a2);
/* KL_EXECUTION_ENVIRONMENT.eif_putenv */
extern T6 T103f6(T0* C, T14 a1);
/* GE_HASH_TABLE [C_STRING, STRING_8].force */
extern void T657f25(T0* C, T0* a1, T0* a2);
/* GE_HASH_TABLE [C_STRING, STRING_8].add_space */
extern void T657f28(T0* C);
/* GE_HASH_TABLE [C_STRING, STRING_8].accommodate */
extern void T657f29(T0* C, T6 a1);
/* GE_HASH_TABLE [C_STRING, STRING_8].set_deleted_marks */
extern void T657f33(T0* C, T0* a1);
/* GE_HASH_TABLE [C_STRING, STRING_8].set_keys */
extern void T657f32(T0* C, T0* a1);
/* GE_HASH_TABLE [C_STRING, STRING_8].set_content */
extern void T657f31(T0* C, T0* a1);
/* GE_HASH_TABLE [C_STRING, STRING_8].put */
extern void T657f30(T0* C, T0* a1, T0* a2);
/* GE_HASH_TABLE [C_STRING, STRING_8].set_conflict */
extern void T657f34(T0* C);
/* GE_HASH_TABLE [C_STRING, STRING_8].found */
extern T1 T657f21(T0* C);
/* GE_HASH_TABLE [C_STRING, STRING_8].occupied */
extern T1 T657f20(T0* C, T6 a1);
/* GE_HASH_TABLE [C_STRING, STRING_8].set_key_equality_tester */
extern void T657f26(T0* C, T0* a1);
/* GE_HASH_TABLE [C_STRING, STRING_8].make_map */
extern T0* T657c24(T6 a1);
/* GE_HASH_TABLE [C_STRING, STRING_8].make */
extern void T657f24p1(T0* C, T6 a1);
/* SPECIAL [C_STRING].make */
extern T0* T684c2(T6 a1);
/* PRIMES.higher_prime */
extern T6 T683f1(T0* C, T6 a1);
/* PRIMES.is_prime */
extern T1 T683f3(T0* C, T6 a1);
/* PRIMES.default_create */
extern T0* T683c5(void);
/* GE_HASH_TABLE [C_STRING, STRING_8].soon_full */
extern T1 T657f15(T0* C);
/* GE_HASH_TABLE [C_STRING, STRING_8].not_found */
extern T1 T657f14(T0* C);
/* GE_HASH_TABLE [C_STRING, STRING_8].internal_search */
extern void T657f27(T0* C, T0* a1);
/* GE_STRING_EQUALITY_TESTER.test */
extern T1 T678f1(T0* C, T0* a1, T0* a2);
/* KL_EXECUTION_ENVIRONMENT.environ */
extern unsigned char ge2321os4832;
extern T0* ge2321ov4832;
extern T0* T103f4(T0* C);
/* GE_STRING_EQUALITY_TESTER.default_create */
extern T0* T678c2(void);
/* GEANT_SETENV_COMMAND.execution_environment */
extern T0* T438f8(T0* C);
/* GEANT_SETENV_TASK.exit_application */
extern void T304f34(T0* C, T6 a1, T0* a2);
/* GEANT_SETENV_TASK.exceptions */
extern T0* T304f20(T0* C);
/* GEANT_SETENV_TASK.std */
extern T0* T304f19(T0* C);
/* GEANT_SETENV_TASK.log_messages */
extern void T304f35(T0* C, T0* a1);
/* GEANT_SETENV_TASK.dir_attribute_name */
extern T0* T304f18(T0* C);
/* GEANT_SETENV_TASK.file_system */
extern T0* T304f17(T0* C);
/* GEANT_SETENV_TASK.unix_file_system */
extern T0* T304f23(T0* C);
/* GEANT_SETENV_TASK.windows_file_system */
extern T0* T304f22(T0* C);
/* GEANT_SETENV_TASK.operating_system */
extern T0* T304f21(T0* C);
/* GEANT_MOVE_TASK.execute */
extern void T302f35(T0* C);
/* GEANT_MOVE_COMMAND.execute */
extern void T435f23(T0* C);
/* GEANT_MOVE_COMMAND.create_directory_for_pathname */
extern void T435f26(T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.file_system */
extern T0* T435f14(T0* C);
/* GEANT_MOVE_COMMAND.windows_file_system */
extern T0* T435f16(T0* C);
/* GEANT_MOVE_COMMAND.operating_system */
extern T0* T435f15(T0* C);
/* GEANT_MOVE_COMMAND.is_file_to_file_executable */
extern T1 T435f10(T0* C);
/* GEANT_MOVE_COMMAND.move_file */
extern void T435f25(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.same_physical_file */
extern T1 T53f33(T0* C, T0* a1, T0* a2);
/* KL_TEXT_INPUT_FILE.same_physical_file */
extern T1 T55f41(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.old_change_name */
extern void T55f72(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.file_rename */
extern void T55f74(T0* C, T14 a1, T14 a2);
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
extern T6 T87f10(T0* C);
/* KL_TEXT_INPUT_FILE.old_is_open_write */
extern T1 T55f52(T0* C);
/* KL_TEXT_INPUT_FILE.inode */
extern T6 T55f44(T0* C);
/* UNIX_FILE_INFO.inode */
extern T6 T87f9(T0* C);
/* KL_TEXT_INPUT_FILE.tmp_file1 */
extern unsigned char ge212os4059;
extern T0* ge212ov4059;
extern T0* T55f43(T0* C);
/* KL_UNIX_FILE_SYSTEM.same_physical_file */
extern T1 T54f31(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.rename_file */
extern void T53f44(T0* C, T0* a1, T0* a2);
/* KL_TEXT_INPUT_FILE.change_name */
extern void T55f71(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.rename_file */
extern void T54f40(T0* C, T0* a1, T0* a2);
/* GEANT_MOVE_COMMAND.unix_file_system */
extern T0* T435f13(T0* C);
/* GEANT_MOVE_COMMAND.create_directory */
extern void T435f24(T0* C, T0* a1);
/* GEANT_MOVE_COMMAND.is_file_to_directory_executable */
extern T1 T435f11(T0* C);
/* GEANT_MOVE_TASK.exit_application */
extern void T302f36(T0* C, T6 a1, T0* a2);
/* GEANT_MOVE_TASK.exceptions */
extern T0* T302f22(T0* C);
/* GEANT_MOVE_TASK.std */
extern T0* T302f21(T0* C);
/* GEANT_MOVE_TASK.log_messages */
extern void T302f37(T0* C, T0* a1);
/* GEANT_MOVE_TASK.dir_attribute_name */
extern T0* T302f20(T0* C);
/* GEANT_MOVE_TASK.file_system */
extern T0* T302f19(T0* C);
/* GEANT_MOVE_TASK.unix_file_system */
extern T0* T302f25(T0* C);
/* GEANT_MOVE_TASK.windows_file_system */
extern T0* T302f24(T0* C);
/* GEANT_MOVE_TASK.operating_system */
extern T0* T302f23(T0* C);
/* GEANT_COPY_TASK.execute */
extern void T300f40(T0* C);
/* GEANT_COPY_COMMAND.execute */
extern void T432f27(T0* C);
/* GEANT_COPY_COMMAND.create_directory_for_pathname */
extern void T432f30(T0* C, T0* a1);
/* GEANT_COPY_COMMAND.file_system */
extern T0* T432f16(T0* C);
/* GEANT_COPY_COMMAND.windows_file_system */
extern T0* T432f19(T0* C);
/* GEANT_COPY_COMMAND.operating_system */
extern T0* T432f18(T0* C);
/* GEANT_COPY_COMMAND.is_file_to_file_executable */
extern T1 T432f12(T0* C);
/* GEANT_COPY_COMMAND.copy_file */
extern void T432f29(T0* C, T0* a1, T0* a2);
/* KL_WINDOWS_FILE_SYSTEM.copy_file */
extern void T53f43(T0* C, T0* a1, T0* a2);
/* KL_TEXT_INPUT_FILE.copy_file */
extern void T55f70(T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.close */
extern void T655f37(T0* C);
/* KL_BINARY_OUTPUT_FILE.close */
extern void T656f23(T0* C);
/* KL_BINARY_OUTPUT_FILE.put_string */
extern void T656f22(T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.old_put_string */
extern void T656f27(T0* C, T0* a1);
/* KL_BINARY_OUTPUT_FILE.file_ps */
extern void T656f29(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_BINARY_OUTPUT_FILE.string_ */
extern T0* T656f9(T0* C);
/* KL_BINARY_INPUT_FILE.read_string */
extern void T655f36(T0* C, T6 a1);
/* KL_BINARY_INPUT_FILE.read_to_string */
extern T6 T655f20(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_BINARY_INPUT_FILE.dummy_kl_character_buffer */
extern T0* T655f32(T0* C);
/* KL_BINARY_INPUT_FILE.any_ */
extern T0* T655f30(T0* C);
/* KL_BINARY_INPUT_FILE.old_read_to_string */
extern T6 T655f19(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_BINARY_INPUT_FILE.file_gss */
extern T6 T655f29(T0* C, T14 a1, T14 a2, T6 a3);
/* KL_BINARY_INPUT_FILE.old_end_of_file */
extern T1 T655f18(T0* C);
/* KL_BINARY_INPUT_FILE.file_feof */
extern T1 T655f28(T0* C, T14 a1);
/* KL_BINARY_OUTPUT_FILE.is_open_write */
extern T1 T656f12(T0* C);
/* KL_BINARY_OUTPUT_FILE.old_is_open_write */
extern T1 T656f8(T0* C);
/* KL_BINARY_OUTPUT_FILE.open_write */
extern void T656f21(T0* C);
/* KL_BINARY_OUTPUT_FILE.is_closed */
extern T1 T656f13(T0* C);
/* KL_BINARY_OUTPUT_FILE.old_open_write */
extern void T656f26(T0* C);
/* KL_BINARY_OUTPUT_FILE.default_pointer */
extern T14 T656f17(T0* C);
/* KL_BINARY_OUTPUT_FILE.open_write */
extern void T656f26p1(T0* C);
/* KL_BINARY_OUTPUT_FILE.file_open */
extern T14 T656f18(T0* C, T14 a1, T6 a2);
/* KL_BINARY_OUTPUT_FILE.make */
extern T0* T656c19(T0* a1);
/* KL_BINARY_OUTPUT_FILE.old_make */
extern void T656f24(T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.is_open_read */
extern T1 T655f13(T0* C);
/* KL_BINARY_INPUT_FILE.old_is_open_read */
extern T1 T655f9(T0* C);
/* KL_BINARY_INPUT_FILE.open_read */
extern void T655f35(T0* C);
/* KL_BINARY_INPUT_FILE.is_closed */
extern T1 T655f17(T0* C);
/* KL_BINARY_INPUT_FILE.old_open_read */
extern void T655f40(T0* C);
/* KL_BINARY_INPUT_FILE.default_pointer */
extern T14 T655f24(T0* C);
/* KL_BINARY_INPUT_FILE.open_read */
extern void T655f40p1(T0* C);
/* KL_BINARY_INPUT_FILE.file_open */
extern T14 T655f25(T0* C, T14 a1, T6 a2);
/* KL_BINARY_INPUT_FILE.old_is_readable */
extern T1 T655f16(T0* C);
/* KL_BINARY_INPUT_FILE.buffered_file_info */
extern T0* T655f27(T0* C);
/* KL_BINARY_INPUT_FILE.set_buffer */
extern void T655f42(T0* C);
/* KL_BINARY_INPUT_FILE.old_exists */
extern T1 T655f15(T0* C);
/* KL_BINARY_INPUT_FILE.file_exists */
extern T1 T655f26(T0* C, T14 a1);
/* KL_BINARY_INPUT_FILE.make */
extern T0* T655c33(T0* a1);
/* KL_BINARY_INPUT_FILE.old_make */
extern void T655f38(T0* C, T0* a1);
/* KL_BINARY_INPUT_FILE.string_ */
extern T0* T655f10(T0* C);
/* KL_UNIX_FILE_SYSTEM.copy_file */
extern void T54f39(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.is_file_outofdate */
extern T1 T432f17(T0* C, T0* a1, T0* a2);
/* GEANT_COPY_COMMAND.unix_file_system */
extern T0* T432f15(T0* C);
/* GEANT_COPY_COMMAND.create_directory */
extern void T432f28(T0* C, T0* a1);
/* GEANT_COPY_COMMAND.is_file_to_directory_executable */
extern T1 T432f13(T0* C);
/* GEANT_COPY_TASK.exit_application */
extern void T300f41(T0* C, T6 a1, T0* a2);
/* GEANT_COPY_TASK.exceptions */
extern T0* T300f27(T0* C);
/* GEANT_COPY_TASK.log_messages */
extern void T300f42(T0* C, T0* a1);
/* GEANT_COPY_TASK.dir_attribute_name */
extern T0* T300f26(T0* C);
/* GEANT_COPY_TASK.file_system */
extern T0* T300f25(T0* C);
/* GEANT_COPY_TASK.unix_file_system */
extern T0* T300f30(T0* C);
/* GEANT_COPY_TASK.windows_file_system */
extern T0* T300f29(T0* C);
/* GEANT_COPY_TASK.operating_system */
extern T0* T300f28(T0* C);
/* GEANT_DELETE_TASK.execute */
extern void T298f35(T0* C);
/* GEANT_DELETE_COMMAND.execute */
extern void T428f25(T0* C);
/* GEANT_DIRECTORYSET.forth */
extern void T429f31(T0* C);
/* GEANT_DIRECTORYSET.update_project_variables */
extern void T429f35(T0* C);
/* GEANT_DIRECTORYSET.item_directory_name */
extern T0* T429f14(T0* C);
/* GEANT_DIRECTORYSET.after */
extern T1 T429f13(T0* C);
/* GEANT_DIRECTORYSET.start */
extern void T429f30(T0* C);
/* GEANT_DIRECTORYSET.execute */
extern void T429f29(T0* C);
/* GEANT_DIRECTORYSET.remove_fileset_entry */
extern void T429f34(T0* C, T0* a1);
/* GEANT_DIRECTORYSET.add_fileset_entry_if_necessary */
extern void T429f33(T0* C, T0* a1);
/* GEANT_DIRECTORYSET.scan_internal */
extern void T429f32(T0* C, T0* a1);
/* GEANT_DIRECTORYSET.file_system */
extern T0* T429f18(T0* C);
/* GEANT_DIRECTORYSET.windows_file_system */
extern T0* T429f20(T0* C);
/* GEANT_DIRECTORYSET.operating_system */
extern T0* T429f19(T0* C);
/* GEANT_DIRECTORYSET.string_ */
extern T0* T429f17(T0* C);
/* GEANT_DIRECTORYSET.unix_file_system */
extern T0* T429f16(T0* C);
/* GEANT_DIRECTORYSET.is_executable */
extern T1 T429f15(T0* C);
/* GEANT_DELETE_COMMAND.is_directoryset_executable */
extern T1 T428f14(T0* C);
/* GEANT_DELETE_COMMAND.is_fileset_executable */
extern T1 T428f13(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.delete_file */
extern void T53f39(T0* C, T0* a1);
/* KL_TEXT_INPUT_FILE.delete */
extern void T55f69(T0* C);
/* KL_TEXT_INPUT_FILE.old_delete */
extern void T55f73(T0* C);
/* KL_TEXT_INPUT_FILE.file_unlink */
extern void T55f75(T0* C, T14 a1);
/* KL_UNIX_FILE_SYSTEM.delete_file */
extern void T54f35(T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.is_file_executable */
extern T1 T428f11(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.recursive_delete_directory */
extern void T53f41(T0* C, T0* a1);
/* KL_DIRECTORY.recursive_delete */
extern void T488f50(T0* C);
/* KL_DIRECTORY.old_recursive_delete */
extern void T488f52(T0* C);
/* KL_DIRECTORY.old_delete */
extern void T488f53(T0* C);
/* KL_DIRECTORY.eif_dir_delete */
extern void T488f55(T0* C, T14 a1);
/* KL_DIRECTORY.old_is_empty */
extern T1 T488f32(T0* C);
/* KL_DIRECTORY.count */
extern T6 T488f34(T0* C);
/* DIRECTORY.readentry */
extern void T661f19(T0* C);
/* DIRECTORY.dir_next */
extern T0* T661f8(T0* C, T14 a1);
/* DIRECTORY.start */
extern void T661f18(T0* C);
/* DIRECTORY.dir_rewind */
extern void T661f24(T0* C, T14 a1);
/* DIRECTORY.make_open_read */
extern T0* T661c17(T0* a1);
/* DIRECTORY.open_read */
extern void T661f23(T0* C);
/* DIRECTORY.dir_open */
extern T14 T661f11(T0* C, T14 a1);
/* DIRECTORY.make */
extern void T661f14(T0* C, T0* a1);
/* DIRECTORY.make */
extern T0* T661c14(T0* a1);
/* KL_DIRECTORY.delete_content */
extern void T488f54(T0* C);
/* ARRAYED_LIST [STRING_8].forth */
extern void T662f14(T0* C);
/* RAW_FILE.delete */
extern void T660f15(T0* C);
/* RAW_FILE.file_unlink */
extern void T660f18(T0* C, T14 a1);
/* RAW_FILE.is_writable */
extern T1 T660f12(T0* C);
/* UNIX_FILE_INFO.is_writable */
extern T1 T87f13(T0* C);
/* RAW_FILE.buffered_file_info */
extern T0* T660f7(T0* C);
/* RAW_FILE.set_buffer */
extern void T660f16(T0* C);
/* DIRECTORY.recursive_delete */
extern void T661f16(T0* C);
/* DIRECTORY.delete */
extern void T661f22(T0* C);
/* DIRECTORY.eif_dir_delete */
extern void T661f26(T0* C, T14 a1);
/* DIRECTORY.is_empty */
extern T1 T661f6(T0* C);
/* DIRECTORY.count */
extern T6 T661f13(T0* C);
/* DIRECTORY.delete_content */
extern void T661f21(T0* C);
/* DIRECTORY.linear_representation */
extern T0* T661f10(T0* C);
/* ARRAYED_LIST [STRING_8].extend */
extern void T662f15(T0* C, T0* a1);
/* ARRAYED_LIST [STRING_8].force_i_th */
extern void T662f18(T0* C, T0* a1, T6 a2);
/* ARRAYED_LIST [STRING_8].put_i_th */
extern void T662f21(T0* C, T0* a1, T6 a2);
/* ARRAYED_LIST [STRING_8].auto_resize */
extern void T662f20(T0* C, T6 a1, T6 a2);
/* ARRAYED_LIST [STRING_8].capacity */
extern T6 T662f10(T0* C);
/* ARRAYED_LIST [STRING_8].make_area */
extern void T662f19(T0* C, T6 a1);
/* ARRAYED_LIST [STRING_8].additional_space */
extern T6 T662f9(T0* C);
/* ARRAYED_LIST [STRING_8].empty_area */
extern T1 T662f8(T0* C);
/* ARRAYED_LIST [STRING_8].set_count */
extern void T662f16(T0* C, T6 a1);
/* ARRAYED_LIST [STRING_8].make */
extern T0* T662c12(T6 a1);
/* ARRAYED_LIST [STRING_8].array_make */
extern void T662f17(T0* C, T6 a1, T6 a2);
/* RAW_FILE.is_directory */
extern T1 T660f11(T0* C);
/* UNIX_FILE_INFO.is_directory */
extern T1 T87f12(T0* C);
/* RAW_FILE.is_symlink */
extern T1 T660f8(T0* C);
/* UNIX_FILE_INFO.is_symlink */
extern T1 T87f11(T0* C);
/* RAW_FILE.exists */
extern T1 T660f5(T0* C);
/* RAW_FILE.file_exists */
extern T1 T660f6(T0* C, T14 a1);
/* RAW_FILE.make */
extern T0* T660c13(T0* a1);
/* FILE_NAME.set_file_name */
extern void T659f10(T0* C, T0* a1);
/* FILE_NAME.set_count */
extern void T659f15(T0* C, T6 a1);
/* FILE_NAME.c_strlen */
extern T6 T659f4(T0* C, T14 a1);
/* FILE_NAME.eif_append_file_name */
extern void T659f14(T0* C, T14 a1, T14 a2, T14 a3);
/* FILE_NAME.resize */
extern void T659f13(T0* C, T6 a1);
/* FILE_NAME.capacity */
extern T6 T659f5(T0* C);
/* FILE_NAME.make_from_string */
extern T0* T659c9(T0* a1);
/* FILE_NAME.append */
extern void T659f12(T0* C, T0* a1);
/* FILE_NAME.additional_space */
extern T6 T659f7(T0* C);
/* FILE_NAME.string_make */
extern void T659f11(T0* C, T6 a1);
/* ARRAYED_LIST [STRING_8].item */
extern T0* T662f6(T0* C);
/* ARRAYED_LIST [STRING_8].after */
extern T1 T662f7(T0* C);
/* ARRAYED_LIST [STRING_8].start */
extern void T662f13(T0* C);
/* KL_DIRECTORY.linear_representation */
extern T0* T488f33(T0* C);
/* KL_UNIX_FILE_SYSTEM.recursive_delete_directory */
extern void T54f37(T0* C, T0* a1);
/* GEANT_DELETE_COMMAND.unix_file_system */
extern T0* T428f16(T0* C);
/* GEANT_DELETE_COMMAND.file_system */
extern T0* T428f15(T0* C);
/* GEANT_DELETE_COMMAND.windows_file_system */
extern T0* T428f18(T0* C);
/* GEANT_DELETE_COMMAND.operating_system */
extern T0* T428f17(T0* C);
/* GEANT_DELETE_COMMAND.is_directory_executable */
extern T1 T428f12(T0* C);
/* GEANT_DELETE_TASK.exit_application */
extern void T298f36(T0* C, T6 a1, T0* a2);
/* GEANT_DELETE_TASK.exceptions */
extern T0* T298f22(T0* C);
/* GEANT_DELETE_TASK.std */
extern T0* T298f21(T0* C);
/* GEANT_DELETE_TASK.log_messages */
extern void T298f37(T0* C, T0* a1);
/* GEANT_DELETE_TASK.dir_attribute_name */
extern T0* T298f20(T0* C);
/* GEANT_DELETE_TASK.file_system */
extern T0* T298f19(T0* C);
/* GEANT_DELETE_TASK.unix_file_system */
extern T0* T298f25(T0* C);
/* GEANT_DELETE_TASK.windows_file_system */
extern T0* T298f24(T0* C);
/* GEANT_DELETE_TASK.operating_system */
extern T0* T298f23(T0* C);
/* GEANT_MKDIR_TASK.execute */
extern void T296f31(T0* C);
/* GEANT_MKDIR_COMMAND.execute */
extern void T424f16(T0* C);
/* GEANT_MKDIR_TASK.exit_application */
extern void T296f32(T0* C, T6 a1, T0* a2);
/* GEANT_MKDIR_TASK.exceptions */
extern T0* T296f17(T0* C);
/* GEANT_MKDIR_TASK.std */
extern T0* T296f16(T0* C);
/* GEANT_MKDIR_TASK.log_messages */
extern void T296f33(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.project_variables_resolver */
extern T0* T296f10(T0* C);
/* GEANT_MKDIR_TASK.dir_attribute_name */
extern T0* T296f15(T0* C);
/* GEANT_MKDIR_TASK.file_system */
extern T0* T296f14(T0* C);
/* GEANT_MKDIR_TASK.unix_file_system */
extern T0* T296f20(T0* C);
/* GEANT_MKDIR_TASK.windows_file_system */
extern T0* T296f19(T0* C);
/* GEANT_MKDIR_TASK.operating_system */
extern T0* T296f18(T0* C);
/* GEANT_ECHO_TASK.execute */
extern void T294f31(T0* C);
/* GEANT_ECHO_COMMAND.execute */
extern void T421f16(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_append */
extern void T515f22(T0* C);
/* KL_TEXT_OUTPUT_FILE.old_open_append */
extern void T515f28(T0* C);
/* KL_TEXT_OUTPUT_FILE.open_append */
extern void T515f28p1(T0* C);
/* GEANT_BOOLEAN_PROPERTY.non_empty_value_or_else */
extern T1 T388f6(T0* C, T1 a1);
/* GEANT_BOOLEAN_PROPERTY.value */
extern T1 T388f5(T0* C);
/* GEANT_BOOLEAN_PROPERTY.boolean_value */
extern T1 T388f8(T0* C, T0* a1);
/* GEANT_BOOLEAN_PROPERTY.false_attribute_value */
extern unsigned char ge67os9042;
extern T0* ge67ov9042;
extern T0* T388f11(T0* C);
/* GEANT_BOOLEAN_PROPERTY.true_attribute_value */
extern unsigned char ge67os9041;
extern T0* ge67ov9041;
extern T0* T388f10(T0* C);
/* GEANT_BOOLEAN_PROPERTY.string_ */
extern T0* T388f9(T0* C);
/* GEANT_BOOLEAN_PROPERTY.string_value */
extern T0* T388f4(T0* C);
/* GEANT_BOOLEAN_PROPERTY.is_defined */
extern T1 T388f7(T0* C);
/* GEANT_ECHO_TASK.exit_application */
extern void T294f32(T0* C, T6 a1, T0* a2);
/* GEANT_ECHO_TASK.exceptions */
extern T0* T294f17(T0* C);
/* GEANT_ECHO_TASK.std */
extern T0* T294f16(T0* C);
/* GEANT_ECHO_TASK.log_messages */
extern void T294f33(T0* C, T0* a1);
/* GEANT_ECHO_TASK.project_variables_resolver */
extern T0* T294f10(T0* C);
/* GEANT_ECHO_TASK.dir_attribute_name */
extern T0* T294f15(T0* C);
/* GEANT_ECHO_TASK.file_system */
extern T0* T294f14(T0* C);
/* GEANT_ECHO_TASK.unix_file_system */
extern T0* T294f20(T0* C);
/* GEANT_ECHO_TASK.windows_file_system */
extern T0* T294f19(T0* C);
/* GEANT_ECHO_TASK.operating_system */
extern T0* T294f18(T0* C);
/* GEANT_GEANT_TASK.execute */
extern void T292f47(T0* C);
/* GEANT_GEANT_COMMAND.execute */
extern void T417f34(T0* C);
/* GEANT_GEANT_COMMAND.execute_with_target */
extern void T417f38(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.is_fileset_executable */
extern T1 T417f21(T0* C);
/* GEANT_GEANT_COMMAND.execute_forked_with_target */
extern void T417f37(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.item */
extern T0* T25f54(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.item_storage_item */
extern T0* T25f50(T0* C, T6 a1);
/* GEANT_GEANT_COMMAND.string_ */
extern T0* T417f19(T0* C);
/* GEANT_GEANT_COMMAND.execute_with_filename */
extern void T417f36(T0* C, T0* a1);
/* GEANT_TARGET.is_exported_to_project */
extern T1 T26f62(T0* C, T0* a1);
/* GEANT_PROJECT.has_parent_with_name */
extern T1 T22f28(T0* C, T0* a1);
/* GEANT_PROJECT.string_ */
extern T0* T22f29(T0* C);
/* GEANT_GEANT_COMMAND.exit_application */
extern void T417f39(T0* C, T6 a1, T0* a2);
/* GEANT_GEANT_COMMAND.exceptions */
extern T0* T417f23(T0* C);
/* GEANT_GEANT_COMMAND.std */
extern T0* T417f22(T0* C);
/* GEANT_GEANT_COMMAND.log_messages */
extern void T417f41(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.execute_forked_with_filename_and_target */
extern void T417f35(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_COMMAND.execute_shell */
extern void T417f40(T0* C, T0* a1);
/* GEANT_GEANT_COMMAND.options_and_arguments_for_cmdline */
extern T0* T417f20(T0* C);
/* GEANT_PROJECT_VARIABLES.put */
extern void T25f87(T0* C, T0* a1, T0* a2);
/* GEANT_GEANT_COMMAND.project_variables_resolver */
extern T0* T417f18(T0* C);
/* GEANT_GEANT_COMMAND.unix_file_system */
extern T0* T417f17(T0* C);
/* GEANT_GEANT_COMMAND.file_system */
extern T0* T417f16(T0* C);
/* GEANT_GEANT_COMMAND.windows_file_system */
extern T0* T417f25(T0* C);
/* GEANT_GEANT_COMMAND.operating_system */
extern T0* T417f24(T0* C);
/* GEANT_GEANT_COMMAND.is_filename_executable */
extern T1 T417f14(T0* C);
/* GEANT_GEANT_TASK.dir_attribute_name */
extern T0* T292f32(T0* C);
/* GEANT_GEANT_TASK.file_system */
extern T0* T292f31(T0* C);
/* GEANT_GEANT_TASK.unix_file_system */
extern T0* T292f35(T0* C);
/* GEANT_GEANT_TASK.windows_file_system */
extern T0* T292f34(T0* C);
/* GEANT_GEANT_TASK.operating_system */
extern T0* T292f33(T0* C);
/* GEANT_GETEST_TASK.execute */
extern void T290f48(T0* C);
/* GEANT_GETEST_COMMAND.execute */
extern void T414f34(T0* C);
/* GEANT_GETEST_COMMAND.execute_shell */
extern void T414f35(T0* C, T0* a1);
/* GEANT_GETEST_COMMAND.unix_file_system */
extern T0* T414f19(T0* C);
/* GEANT_GETEST_COMMAND.file_system */
extern T0* T414f18(T0* C);
/* GEANT_GETEST_COMMAND.windows_file_system */
extern T0* T414f21(T0* C);
/* GEANT_GETEST_COMMAND.operating_system */
extern T0* T414f20(T0* C);
/* GEANT_GETEST_COMMAND.string_ */
extern T0* T414f17(T0* C);
/* GEANT_GETEST_TASK.exit_application */
extern void T290f49(T0* C, T6 a1, T0* a2);
/* GEANT_GETEST_TASK.exceptions */
extern T0* T290f35(T0* C);
/* GEANT_GETEST_TASK.log_messages */
extern void T290f50(T0* C, T0* a1);
/* GEANT_GETEST_TASK.dir_attribute_name */
extern T0* T290f34(T0* C);
/* GEANT_GETEST_TASK.file_system */
extern T0* T290f33(T0* C);
/* GEANT_GETEST_TASK.unix_file_system */
extern T0* T290f38(T0* C);
/* GEANT_GETEST_TASK.windows_file_system */
extern T0* T290f37(T0* C);
/* GEANT_GETEST_TASK.operating_system */
extern T0* T290f36(T0* C);
/* GEANT_GEPP_TASK.execute */
extern void T288f43(T0* C);
/* GEANT_GEPP_COMMAND.execute */
extern void T411f29(T0* C);
/* GEANT_FILESET.has_map */
extern T1 T389f30(T0* C);
/* GEANT_GEPP_COMMAND.execute_shell */
extern void T411f31(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.is_file_outofdate */
extern T1 T411f18(T0* C, T0* a1, T0* a2);
/* GEANT_GEPP_COMMAND.unix_file_system */
extern T0* T411f17(T0* C);
/* GEANT_GEPP_COMMAND.file_system */
extern T0* T411f16(T0* C);
/* GEANT_GEPP_COMMAND.windows_file_system */
extern T0* T411f20(T0* C);
/* GEANT_GEPP_COMMAND.operating_system */
extern T0* T411f19(T0* C);
/* GEANT_GEPP_COMMAND.is_file_executable */
extern T1 T411f13(T0* C);
/* GEANT_GEPP_COMMAND.create_directory */
extern void T411f30(T0* C, T0* a1);
/* GEANT_GEPP_COMMAND.string_ */
extern T0* T411f15(T0* C);
/* GEANT_GEPP_TASK.exit_application */
extern void T288f44(T0* C, T6 a1, T0* a2);
/* GEANT_GEPP_TASK.exceptions */
extern T0* T288f30(T0* C);
/* GEANT_GEPP_TASK.log_messages */
extern void T288f45(T0* C, T0* a1);
/* GEANT_GEPP_TASK.dir_attribute_name */
extern T0* T288f29(T0* C);
/* GEANT_GEPP_TASK.file_system */
extern T0* T288f28(T0* C);
/* GEANT_GEPP_TASK.unix_file_system */
extern T0* T288f33(T0* C);
/* GEANT_GEPP_TASK.windows_file_system */
extern T0* T288f32(T0* C);
/* GEANT_GEPP_TASK.operating_system */
extern T0* T288f31(T0* C);
/* GEANT_GEYACC_TASK.execute */
extern void T286f43(T0* C);
/* GEANT_GEYACC_COMMAND.execute */
extern void T408f29(T0* C);
/* GEANT_GEYACC_COMMAND.execute_shell */
extern void T408f30(T0* C, T0* a1);
/* GEANT_GEYACC_COMMAND.string_ */
extern T0* T408f16(T0* C);
/* GEANT_GEYACC_COMMAND.unix_file_system */
extern T0* T408f15(T0* C);
/* GEANT_GEYACC_COMMAND.file_system */
extern T0* T408f14(T0* C);
/* GEANT_GEYACC_COMMAND.windows_file_system */
extern T0* T408f18(T0* C);
/* GEANT_GEYACC_COMMAND.operating_system */
extern T0* T408f17(T0* C);
/* GEANT_GEYACC_TASK.exit_application */
extern void T286f44(T0* C, T6 a1, T0* a2);
/* GEANT_GEYACC_TASK.exceptions */
extern T0* T286f30(T0* C);
/* GEANT_GEYACC_TASK.log_messages */
extern void T286f45(T0* C, T0* a1);
/* GEANT_GEYACC_TASK.dir_attribute_name */
extern T0* T286f29(T0* C);
/* GEANT_GEYACC_TASK.file_system */
extern T0* T286f28(T0* C);
/* GEANT_GEYACC_TASK.unix_file_system */
extern T0* T286f33(T0* C);
/* GEANT_GEYACC_TASK.windows_file_system */
extern T0* T286f32(T0* C);
/* GEANT_GEYACC_TASK.operating_system */
extern T0* T286f31(T0* C);
/* GEANT_GELEX_TASK.execute */
extern void T284f46(T0* C);
/* GEANT_GELEX_COMMAND.execute */
extern void T405f35(T0* C);
/* GEANT_GELEX_COMMAND.execute_shell */
extern void T405f36(T0* C, T0* a1);
/* GEANT_GELEX_COMMAND.unix_file_system */
extern T0* T405f19(T0* C);
/* GEANT_GELEX_COMMAND.file_system */
extern T0* T405f18(T0* C);
/* GEANT_GELEX_COMMAND.windows_file_system */
extern T0* T405f21(T0* C);
/* GEANT_GELEX_COMMAND.operating_system */
extern T0* T405f20(T0* C);
/* GEANT_GELEX_COMMAND.string_ */
extern T0* T405f17(T0* C);
/* GEANT_GELEX_TASK.exit_application */
extern void T284f47(T0* C, T6 a1, T0* a2);
/* GEANT_GELEX_TASK.exceptions */
extern T0* T284f33(T0* C);
/* GEANT_GELEX_TASK.log_messages */
extern void T284f48(T0* C, T0* a1);
/* GEANT_GELEX_TASK.dir_attribute_name */
extern T0* T284f32(T0* C);
/* GEANT_GELEX_TASK.file_system */
extern T0* T284f31(T0* C);
/* GEANT_GELEX_TASK.unix_file_system */
extern T0* T284f36(T0* C);
/* GEANT_GELEX_TASK.windows_file_system */
extern T0* T284f35(T0* C);
/* GEANT_GELEX_TASK.operating_system */
extern T0* T284f34(T0* C);
/* GEANT_GEXACE_TASK.execute */
extern void T282f44(T0* C);
/* GEANT_GEXACE_COMMAND.execute */
extern void T402f32(T0* C);
/* GEANT_GEXACE_COMMAND.execute_shell */
extern void T402f33(T0* C, T0* a1);
/* GEANT_GEXACE_COMMAND.unix_file_system */
extern T0* T402f20(T0* C);
/* GEANT_GEXACE_COMMAND.file_system */
extern T0* T402f19(T0* C);
/* GEANT_GEXACE_COMMAND.windows_file_system */
extern T0* T402f22(T0* C);
/* GEANT_GEXACE_COMMAND.operating_system */
extern T0* T402f21(T0* C);
/* GEANT_GEXACE_COMMAND.is_library_executable */
extern T1 T402f17(T0* C);
/* GEANT_GEXACE_COMMAND.is_system_executable */
extern T1 T402f16(T0* C);
/* GEANT_GEXACE_COMMAND.is_validate_executable */
extern T1 T402f15(T0* C);
/* GEANT_GEXACE_COMMAND.string_ */
extern T0* T402f18(T0* C);
/* GEANT_GEXACE_TASK.exit_application */
extern void T282f45(T0* C, T6 a1, T0* a2);
/* GEANT_GEXACE_TASK.exceptions */
extern T0* T282f31(T0* C);
/* GEANT_GEXACE_TASK.log_messages */
extern void T282f46(T0* C, T0* a1);
/* GEANT_GEXACE_TASK.dir_attribute_name */
extern T0* T282f30(T0* C);
/* GEANT_GEXACE_TASK.file_system */
extern T0* T282f29(T0* C);
/* GEANT_GEXACE_TASK.unix_file_system */
extern T0* T282f34(T0* C);
/* GEANT_GEXACE_TASK.windows_file_system */
extern T0* T282f33(T0* C);
/* GEANT_GEXACE_TASK.operating_system */
extern T0* T282f32(T0* C);
/* GEANT_UNSET_TASK.execute */
extern void T280f32(T0* C);
/* GEANT_UNSET_COMMAND.execute */
extern void T398f10(T0* C);
/* GEANT_PROJECT.unset_variable */
extern void T22f52(T0* C, T0* a1);
/* GEANT_UNSET_TASK.exit_application */
extern void T280f33(T0* C, T6 a1, T0* a2);
/* GEANT_UNSET_TASK.exceptions */
extern T0* T280f19(T0* C);
/* GEANT_UNSET_TASK.std */
extern T0* T280f18(T0* C);
/* GEANT_UNSET_TASK.log_messages */
extern void T280f34(T0* C, T0* a1);
/* GEANT_UNSET_TASK.dir_attribute_name */
extern T0* T280f17(T0* C);
/* GEANT_UNSET_TASK.file_system */
extern T0* T280f16(T0* C);
/* GEANT_UNSET_TASK.unix_file_system */
extern T0* T280f22(T0* C);
/* GEANT_UNSET_TASK.windows_file_system */
extern T0* T280f21(T0* C);
/* GEANT_UNSET_TASK.operating_system */
extern T0* T280f20(T0* C);
/* GEANT_SET_TASK.execute */
extern void T278f33(T0* C);
/* GEANT_SET_COMMAND.execute */
extern void T395f17(T0* C);
/* GEANT_SET_COMMAND.default_builtin_variables */
extern T0* T395f8(T0* C);
/* GEANT_SET_COMMAND.file_system */
extern T0* T395f10(T0* C);
/* GEANT_SET_COMMAND.unix_file_system */
extern T0* T395f12(T0* C);
/* GEANT_SET_COMMAND.windows_file_system */
extern T0* T395f11(T0* C);
/* GEANT_SET_COMMAND.operating_system */
extern T0* T395f9(T0* C);
/* GEANT_SET_TASK.exit_application */
extern void T278f34(T0* C, T6 a1, T0* a2);
/* GEANT_SET_TASK.exceptions */
extern T0* T278f20(T0* C);
/* GEANT_SET_TASK.std */
extern T0* T278f19(T0* C);
/* GEANT_SET_TASK.log_messages */
extern void T278f35(T0* C, T0* a1);
/* GEANT_SET_TASK.dir_attribute_name */
extern T0* T278f18(T0* C);
/* GEANT_SET_TASK.file_system */
extern T0* T278f17(T0* C);
/* GEANT_SET_TASK.unix_file_system */
extern T0* T278f23(T0* C);
/* GEANT_SET_TASK.windows_file_system */
extern T0* T278f22(T0* C);
/* GEANT_SET_TASK.operating_system */
extern T0* T278f21(T0* C);
/* GEANT_LCC_TASK.execute */
extern void T276f33(T0* C);
/* GEANT_LCC_COMMAND.execute */
extern void T392f17(T0* C);
/* GEANT_LCC_COMMAND.execute_shell */
extern void T392f18(T0* C, T0* a1);
/* GEANT_LCC_COMMAND.string_ */
extern T0* T392f10(T0* C);
/* GEANT_LCC_COMMAND.unix_file_system */
extern T0* T392f9(T0* C);
/* GEANT_LCC_COMMAND.file_system */
extern T0* T392f8(T0* C);
/* GEANT_LCC_COMMAND.windows_file_system */
extern T0* T392f12(T0* C);
/* GEANT_LCC_COMMAND.operating_system */
extern T0* T392f11(T0* C);
/* GEANT_LCC_TASK.exit_application */
extern void T276f34(T0* C, T6 a1, T0* a2);
/* GEANT_LCC_TASK.exceptions */
extern T0* T276f20(T0* C);
/* GEANT_LCC_TASK.std */
extern T0* T276f19(T0* C);
/* GEANT_LCC_TASK.log_messages */
extern void T276f35(T0* C, T0* a1);
/* GEANT_LCC_TASK.dir_attribute_name */
extern T0* T276f18(T0* C);
/* GEANT_LCC_TASK.file_system */
extern T0* T276f17(T0* C);
/* GEANT_LCC_TASK.unix_file_system */
extern T0* T276f23(T0* C);
/* GEANT_LCC_TASK.windows_file_system */
extern T0* T276f22(T0* C);
/* GEANT_LCC_TASK.operating_system */
extern T0* T276f21(T0* C);
/* GEANT_EXEC_TASK.execute */
extern void T274f32(T0* C);
/* GEANT_EXEC_COMMAND.execute */
extern void T384f16(T0* C);
/* GEANT_EXEC_COMMAND.project_variables_resolver */
extern T0* T384f11(T0* C);
/* GEANT_EXEC_COMMAND.execute_shell */
extern void T384f18(T0* C, T0* a1);
/* GEANT_EXEC_TASK.exit_application */
extern void T274f33(T0* C, T6 a1, T0* a2);
/* GEANT_EXEC_TASK.exceptions */
extern T0* T274f18(T0* C);
/* GEANT_EXEC_TASK.std */
extern T0* T274f17(T0* C);
/* GEANT_EXEC_TASK.log_messages */
extern void T274f34(T0* C, T0* a1);
/* GEANT_EXEC_TASK.project_variables_resolver */
extern T0* T274f11(T0* C);
/* GEANT_EXEC_TASK.dir_attribute_name */
extern T0* T274f16(T0* C);
/* GEANT_EXEC_TASK.file_system */
extern T0* T274f15(T0* C);
/* GEANT_EXEC_TASK.unix_file_system */
extern T0* T274f21(T0* C);
/* GEANT_EXEC_TASK.windows_file_system */
extern T0* T274f20(T0* C);
/* GEANT_EXEC_TASK.operating_system */
extern T0* T274f19(T0* C);
/* GEANT_ISE_TASK.execute */
extern void T272f42(T0* C);
/* GEANT_ISE_COMMAND.execute */
extern void T380f27(T0* C);
/* GEANT_ISE_COMMAND.execute_clean */
extern void T380f29(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.delete_directory */
extern void T53f42(T0* C, T0* a1);
/* KL_DIRECTORY.delete */
extern void T488f51(T0* C);
/* KL_DIRECTORY.is_empty */
extern T1 T488f28(T0* C);
/* KL_DIRECTORY.tmp_directory */
extern unsigned char ge211os9203;
extern T0* ge211ov9203;
extern T0* T488f30(T0* C);
/* KL_UNIX_FILE_SYSTEM.delete_directory */
extern void T54f38(T0* C, T0* a1);
/* KL_WINDOWS_FILE_SYSTEM.is_directory_empty */
extern T1 T53f30(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.is_directory_empty */
extern T1 T54f27(T0* C, T0* a1);
/* GEANT_ISE_COMMAND.file_system */
extern T0* T380f14(T0* C);
/* GEANT_ISE_COMMAND.unix_file_system */
extern T0* T380f15(T0* C);
/* GEANT_ISE_COMMAND.windows_file_system */
extern T0* T380f18(T0* C);
/* GEANT_ISE_COMMAND.operating_system */
extern T0* T380f17(T0* C);
/* GEANT_ISE_COMMAND.execute_compile */
extern void T380f28(T0* C);
/* KL_WINDOWS_FILE_SYSTEM.cd */
extern void T53f40(T0* C, T0* a1);
/* KL_UNIX_FILE_SYSTEM.cd */
extern void T54f36(T0* C, T0* a1);
/* GEANT_ISE_COMMAND.execute_shell */
extern void T380f30(T0* C, T0* a1);
/* GEANT_ISE_COMMAND.string_ */
extern T0* T380f16(T0* C);
/* GEANT_ISE_COMMAND.is_compilable */
extern T1 T380f12(T0* C);
/* GEANT_ISE_TASK.exit_application */
extern void T272f43(T0* C, T6 a1, T0* a2);
/* GEANT_ISE_TASK.exceptions */
extern T0* T272f29(T0* C);
/* GEANT_ISE_TASK.log_messages */
extern void T272f44(T0* C, T0* a1);
/* GEANT_ISE_TASK.dir_attribute_name */
extern T0* T272f28(T0* C);
/* GEANT_ISE_TASK.file_system */
extern T0* T272f27(T0* C);
/* GEANT_ISE_TASK.unix_file_system */
extern T0* T272f32(T0* C);
/* GEANT_ISE_TASK.windows_file_system */
extern T0* T272f31(T0* C);
/* GEANT_ISE_TASK.operating_system */
extern T0* T272f30(T0* C);
/* GEANT_GEC_TASK.execute */
extern void T265f45(T0* C);
/* GEANT_GEC_COMMAND.execute */
extern void T376f35(T0* C);
/* GEANT_GEC_COMMAND.execute_shell */
extern void T376f36(T0* C, T0* a1);
/* GEANT_GEC_COMMAND.new_ace_cmdline */
extern T0* T376f18(T0* C);
/* GEANT_GEC_COMMAND.string_ */
extern T0* T376f23(T0* C);
/* GEANT_GEC_COMMAND.unix_file_system */
extern T0* T376f21(T0* C);
/* KL_INTEGER_ROUTINES.append_decimal_integer */
extern void T209f5(T0* C, T6 a1, T0* a2);
/* GEANT_GEC_COMMAND.integer_ */
extern T0* T376f22(T0* C);
/* GEANT_GEC_COMMAND.is_ace_configuration */
extern T1 T376f15(T0* C);
/* GEANT_GEC_COMMAND.file_system */
extern T0* T376f17(T0* C);
/* GEANT_GEC_COMMAND.windows_file_system */
extern T0* T376f20(T0* C);
/* GEANT_GEC_COMMAND.operating_system */
extern T0* T376f19(T0* C);
/* GEANT_GEC_COMMAND.is_cleanable */
extern T1 T376f16(T0* C);
/* GEANT_GEC_TASK.exit_application */
extern void T265f46(T0* C, T6 a1, T0* a2);
/* GEANT_GEC_TASK.exceptions */
extern T0* T265f32(T0* C);
/* GEANT_GEC_TASK.log_messages */
extern void T265f47(T0* C, T0* a1);
/* GEANT_GEC_TASK.dir_attribute_name */
extern T0* T265f31(T0* C);
/* GEANT_GEC_TASK.file_system */
extern T0* T265f30(T0* C);
/* GEANT_GEC_TASK.unix_file_system */
extern T0* T265f35(T0* C);
/* GEANT_GEC_TASK.windows_file_system */
extern T0* T265f34(T0* C);
/* GEANT_GEC_TASK.operating_system */
extern T0* T265f33(T0* C);
/* XM_CHARACTER_DATA.node_set_parent */
extern void T357f4(T0* C, T0* a1);
/* XM_PROCESSING_INSTRUCTION.node_set_parent */
extern void T356f6(T0* C, T0* a1);
/* XM_COMMENT.node_set_parent */
extern void T355f5(T0* C, T0* a1);
/* XM_ATTRIBUTE.node_set_parent */
extern void T200f6(T0* C, T0* a1);
/* XM_ELEMENT.node_set_parent */
extern void T98f34(T0* C, T0* a1);
/* XM_CHARACTER_DATA.process */
extern void T357f5(T0* C, T0* a1);
/* XM_NODE_TYPER.process_character_data */
extern void T363f18(T0* C, T0* a1);
/* XM_NODE_TYPER.reset */
extern void T363f14(T0* C);
/* XM_PROCESSING_INSTRUCTION.process */
extern void T356f7(T0* C, T0* a1);
/* XM_NODE_TYPER.process_processing_instruction */
extern void T363f17(T0* C, T0* a1);
/* XM_COMMENT.process */
extern void T355f6(T0* C, T0* a1);
/* XM_NODE_TYPER.process_comment */
extern void T363f16(T0* C, T0* a1);
/* XM_ATTRIBUTE.process */
extern void T200f7(T0* C, T0* a1);
/* XM_NODE_TYPER.process_attribute */
extern void T363f15(T0* C, T0* a1);
/* XM_ELEMENT.process */
extern void T98f39(T0* C, T0* a1);
/* XM_NODE_TYPER.process_element */
extern void T363f12(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_stream */
extern void T176f234(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T176f241(T0* C, T0* a1);
/* YY_FILE_BUFFER.name */
extern T0* T221f14(T0* C);
/* XM_EIFFEL_INPUT_STREAM.name */
extern T0* T208f26(T0* C);
/* KL_STRING_INPUT_STREAM.name */
extern unsigned char ge233os4011;
extern T0* ge233ov4011;
extern T0* T489f6(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_buffer */
extern void T176f241p1(T0* C, T0* a1);
/* YY_FILE_BUFFER.set_position */
extern void T221f19(T0* C, T6 a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.set_index */
extern void T221f18(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.new_file_buffer */
extern T0* T176f71(T0* C, T0* a1);
/* YY_FILE_BUFFER.make */
extern T0* T221c17(T0* a1);
/* YY_FILE_BUFFER.make_with_size */
extern void T221f21(T0* C, T0* a1, T6 a2);
/* YY_FILE_BUFFER.set_file */
extern void T221f23(T0* C, T0* a1);
/* YY_FILE_BUFFER.flush */
extern void T221f25(T0* C);
/* YY_FILE_BUFFER.new_default_buffer */
extern T0* T221f16(T0* C, T6 a1);
/* YY_FILE_BUFFER.default_capacity */
extern unsigned char ge403os7840;
extern T6 ge403ov7840;
extern T6 T221f13(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_input_stream */
extern void T174f199(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T174f208(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_buffer */
extern void T174f208p1(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.new_file_buffer */
extern T0* T174f54(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_stream */
extern void T170f230(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T170f237(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_buffer */
extern void T170f237p1(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.new_file_buffer */
extern T0* T170f69(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_stream */
extern void T132f197(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T132f205(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_buffer */
extern void T132f205p1(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.new_file_buffer */
extern T0* T132f45(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T176f235(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T176f235p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.read_token */
extern void T176f235p0(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_action */
extern void T176f245(T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.from_hexadecimal */
extern void T219f10(T0* C, T0* a1);
/* KL_STRING_ROUTINES.hexadecimal_to_integer */
extern T6 T76f13(T0* C, T0* a1);
/* XM_EIFFEL_CHARACTER_ENTITY.string_ */
extern T0* T219f7(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.to_utf8 */
extern T0* T219f3(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.utf8 */
extern T0* T219f6(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_ascii */
extern T1 T219f2(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.is_valid */
extern T1 T219f5(T0* C);
/* UC_UNICODE_ROUTINES.valid_non_surrogate_code */
extern T1 T322f3(T0* C, T6 a1);
/* XM_EIFFEL_CHARACTER_ENTITY.unicode */
extern T0* T219f4(T0* C);
/* XM_EIFFEL_CHARACTER_ENTITY.from_decimal */
extern void T219f9(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.has_normalized_newline */
extern T1 T176f201(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_substring */
extern T0* T176f181(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_PE_ENTITY_DEF.text_count */
extern T6 T176f180(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.system_literal_text */
extern T0* T176f162(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text_item */
extern T2 T176f207(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern T0* T176f121(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
extern unsigned char ge1546os6484;
extern T0* ge1546ov6484;
extern T0* T176f121p1(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_line_column */
extern void T176f249(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.text */
extern T0* T176f105(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.pop_start_condition */
extern void T176f248(T0* C);
/* DS_LINKED_STACK [INTEGER_32].remove */
extern void T224f7(T0* C);
/* DS_LINKED_STACK [INTEGER_32].item */
extern T6 T224f4(T0* C);
/* DS_LINKED_STACK [INTEGER_32].is_empty */
extern T1 T224f3(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition */
extern void T176f246(T0* C, T6 a1);
/* DS_LINKED_STACK [INTEGER_32].force */
extern void T224f6(T0* C, T6 a1);
/* DS_LINKABLE [INTEGER_32].put_right */
extern void T338f4(T0* C, T0* a1);
/* DS_LINKABLE [INTEGER_32].make */
extern T0* T338c3(T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_last_token */
extern void T176f247(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_eof_action */
extern void T176f244(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.wrap */
extern T1 T176f99(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_refill_input_buffer */
extern void T176f243(T0* C);
/* YY_FILE_BUFFER.fill */
extern void T221f20(T0* C);
/* KL_CHARACTER_BUFFER.fill_from_stream */
extern T6 T367f5(T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T6 T208f27(T0* C, T0* a1, T6 a2, T6 a3);
/* XM_EIFFEL_INPUT_STREAM.read_to_string */
extern T6 T208f27p1(T0* C, T0* a1, T6 a2, T6 a3);
/* KL_STRING_INPUT_STREAM.read_to_string */
extern T6 T489f5(T0* C, T0* a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.compact_left */
extern void T221f22(T0* C);
/* KL_CHARACTER_BUFFER.move_left */
extern void T367f11(T0* C, T6 a1, T6 a2, T6 a3);
/* YY_FILE_BUFFER.resize */
extern void T221f24(T0* C);
/* KL_CHARACTER_BUFFER.resize */
extern void T367f12(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_null_trans_state */
extern T6 T176f98(T0* C, T6 a1);
/* XM_EIFFEL_PE_ENTITY_DEF.yy_previous_state */
extern T6 T176f97(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.terminate */
extern void T176f242(T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T174f200(T0* C);
/* XM_EIFFEL_SCANNER_DTD.read_token */
extern void T174f200p1(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_action */
extern void T174f214(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.has_normalized_newline */
extern T1 T174f179(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_substring */
extern T0* T174f159(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_SCANNER_DTD.text_count */
extern T6 T174f158(T0* C);
/* XM_EIFFEL_SCANNER_DTD.system_literal_text */
extern T0* T174f140(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text_item */
extern T2 T174f194(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.normalized_newline */
extern T0* T174f102(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_set_line_column */
extern void T174f220(T0* C);
/* XM_EIFFEL_SCANNER_DTD.text */
extern T0* T174f76(T0* C);
/* XM_EIFFEL_SCANNER_DTD.pop_start_condition */
extern void T174f219(T0* C);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition */
extern void T174f215(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_execute_eof_action */
extern void T174f213(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.wrap */
extern T1 T174f67(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_refill_input_buffer */
extern void T174f212(T0* C);
/* XM_EIFFEL_SCANNER_DTD.yy_null_trans_state */
extern T6 T174f66(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER_DTD.yy_previous_state */
extern T6 T174f65(T0* C);
/* XM_EIFFEL_SCANNER_DTD.fatal_error */
extern void T174f211(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.terminate */
extern void T174f210(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_last_token */
extern void T174f209(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T170f231(T0* C);
/* XM_EIFFEL_ENTITY_DEF.read_token */
extern void T170f231p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_action */
extern void T170f240(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.has_normalized_newline */
extern T1 T170f198(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_substring */
extern T0* T170f178(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_ENTITY_DEF.text_count */
extern T6 T170f177(T0* C);
/* XM_EIFFEL_ENTITY_DEF.system_literal_text */
extern T0* T170f159(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text_item */
extern T2 T170f205(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T170f118(T0* C);
/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
extern T0* T170f118p1(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_set_line_column */
extern void T170f245(T0* C);
/* XM_EIFFEL_ENTITY_DEF.text */
extern T0* T170f102(T0* C);
/* XM_EIFFEL_ENTITY_DEF.pop_start_condition */
extern void T170f244(T0* C);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition */
extern void T170f241(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.set_last_token */
extern void T170f243(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_execute_eof_action */
extern void T170f239(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.terminate */
extern void T170f242(T0* C);
/* XM_EIFFEL_ENTITY_DEF.wrap */
extern T1 T170f96(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_refill_input_buffer */
extern void T170f238(T0* C);
/* XM_EIFFEL_ENTITY_DEF.yy_null_trans_state */
extern T6 T170f95(T0* C, T6 a1);
/* XM_EIFFEL_ENTITY_DEF.yy_previous_state */
extern T6 T170f94(T0* C);
/* XM_EIFFEL_SCANNER.read_token */
extern void T132f198(T0* C);
/* XM_EIFFEL_SCANNER.yy_execute_action */
extern void T132f209(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.has_normalized_newline */
extern T1 T132f177(T0* C);
/* XM_EIFFEL_SCANNER.text_substring */
extern T0* T132f157(T0* C, T6 a1, T6 a2);
/* XM_EIFFEL_SCANNER.text_count */
extern T6 T132f156(T0* C);
/* XM_EIFFEL_SCANNER.system_literal_text */
extern T0* T132f138(T0* C);
/* XM_EIFFEL_SCANNER.text_item */
extern T2 T132f192(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.normalized_newline */
extern T0* T132f97(T0* C);
/* XM_EIFFEL_SCANNER.yy_set_line_column */
extern void T132f217(T0* C);
/* XM_EIFFEL_SCANNER.text */
extern T0* T132f71(T0* C);
/* XM_EIFFEL_SCANNER.pop_start_condition */
extern void T132f216(T0* C);
/* XM_EIFFEL_SCANNER.set_start_condition */
extern void T132f218(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.push_start_condition */
extern void T132f210(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.set_last_token */
extern void T132f215(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.yy_execute_eof_action */
extern void T132f208(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.terminate */
extern void T132f214(T0* C);
/* XM_EIFFEL_SCANNER.wrap */
extern T1 T132f62(T0* C);
/* XM_EIFFEL_SCANNER.yy_refill_input_buffer */
extern void T132f207(T0* C);
/* XM_EIFFEL_SCANNER.yy_null_trans_state */
extern T6 T132f61(T0* C, T6 a1);
/* XM_EIFFEL_SCANNER.yy_previous_state */
extern T6 T132f60(T0* C);
/* XM_EIFFEL_SCANNER.fatal_error */
extern void T132f206(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T176f237(T0* C);
/* XM_EIFFEL_SCANNER_DTD.push_start_condition_dtd_ignore */
extern void T174f202(T0* C);
/* XM_EIFFEL_ENTITY_DEF.push_start_condition_dtd_ignore */
extern void T170f233(T0* C);
/* XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
extern void T132f200(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.set_encoding */
extern void T176f238(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.set_encoding */
extern void T208f30(T0* C, T0* a1);
/* KL_STRING_ROUTINES.same_case_insensitive */
extern T1 T76f11(T0* C, T0* a1, T0* a2);
/* CHARACTER_8.lower */
extern T2 T2f19(T2* C);
/* CHARACTER_8.is_upper */
extern T1 T2f20(T2* C);
/* UC_UNICODE_ROUTINES.lower_code */
extern T6 T322f4(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.lower_codes */
extern unsigned char ge300os8693;
extern T0* ge300ov8693;
extern T0* T322f9(T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_plane */
extern unsigned char ge300os8692;
extern T0* ge300ov8692;
extern T0* T322f12(T0* C);
/* UC_UNICODE_ROUTINES.empty_lower_code_segment */
extern unsigned char ge300os8679;
extern T0* ge300ov8679;
extern T0* T322f19(T0* C);
/* KL_INTEGER_ROUTINES.to_integer */
extern T6 T209f3(T0* C, T6 a1);
/* UC_UNICODE_ROUTINES.integer_ */
extern T0* T322f30(T0* C);
/* SPECIAL [ARRAY [INTEGER_32]].make */
extern T0* T465c2(T6 a1);
/* UC_UNICODE_ROUTINES.lower_code_plane_1 */
extern unsigned char ge300os8691;
extern T0* ge300ov8691;
extern T0* T322f11(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_1_segment_4 */
extern unsigned char ge300os8690;
extern T0* ge300ov8690;
extern T0* T322f29(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0 */
extern unsigned char ge300os8689;
extern T0* ge300ov8689;
extern T0* T322f10(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_255 */
extern unsigned char ge300os8688;
extern T0* ge300ov8688;
extern T0* T322f28(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_167 */
extern unsigned char ge300os8687;
extern T0* ge300ov8687;
extern T0* T322f27(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_166 */
extern unsigned char ge300os8686;
extern T0* ge300ov8686;
extern T0* T322f26(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_44 */
extern unsigned char ge300os8685;
extern T0* ge300ov8685;
extern T0* T322f25(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_36 */
extern unsigned char ge300os8684;
extern T0* ge300ov8684;
extern T0* T322f24(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_33 */
extern unsigned char ge300os8683;
extern T0* ge300ov8683;
extern T0* T322f23(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_31 */
extern unsigned char ge300os8682;
extern T0* ge300ov8682;
extern T0* T322f22(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_30 */
extern unsigned char ge300os8681;
extern T0* ge300ov8681;
extern T0* T322f21(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_16 */
extern unsigned char ge300os8680;
extern T0* ge300ov8680;
extern T0* T322f20(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_5 */
extern unsigned char ge300os8678;
extern T0* ge300ov8678;
extern T0* T322f18(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_4 */
extern unsigned char ge300os8677;
extern T0* ge300ov8677;
extern T0* T322f17(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_3 */
extern unsigned char ge300os8676;
extern T0* ge300ov8676;
extern T0* T322f16(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_2 */
extern unsigned char ge300os8675;
extern T0* ge300ov8675;
extern T0* T322f15(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_1 */
extern unsigned char ge300os8674;
extern T0* ge300ov8674;
extern T0* T322f14(T0* C);
/* UC_UNICODE_ROUTINES.lower_code_plane_0_segment_0 */
extern unsigned char ge300os8673;
extern T0* ge300ov8673;
extern T0* T322f13(T0* C);
/* SPECIAL [SPECIAL [ARRAY [INTEGER_32]]].make */
extern T0* T466c2(T6 a1);
/* KL_STRING_ROUTINES.unicode */
extern T0* T76f12(T0* C);
/* XM_EIFFEL_SCANNER_DTD.set_encoding */
extern void T174f203(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_encoding */
extern void T170f234(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_encoding */
extern void T132f201(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.set_input_from_resolver */
extern void T176f239(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.set_input_from_resolver */
extern void T174f204(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.set_input_from_resolver */
extern void T170f235(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.set_input_from_resolver */
extern void T132f202(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.close_input */
extern void T176f236(T0* C);
/* KL_STRING_INPUT_STREAM.close */
extern void T489f10(T0* C);
/* KL_STRING_INPUT_STREAM.is_closable */
extern T1 T489f7(T0* C);
/* KL_TEXT_INPUT_FILE.is_closable */
extern T1 T55f26(T0* C);
/* XM_EIFFEL_SCANNER_DTD.close_input */
extern void T174f201(T0* C);
/* XM_EIFFEL_ENTITY_DEF.close_input */
extern void T170f232(T0* C);
/* XM_EIFFEL_SCANNER.close_input */
extern void T132f199(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start */
extern void T177f26(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_make */
extern void T177f36(T0* C);
/* XM_NAMESPACE_RESOLVER.new_string_queue */
extern T0* T177f12(T0* C);
/* DS_LINKED_QUEUE [STRING_8].make */
extern T0* T254c6(void);
/* XM_NAMESPACE_RESOLVER_CONTEXT.make */
extern T0* T252c10(void);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T345c9(void);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].new_cursor */
extern T0* T345f7(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T346c7(T0* a1);
/* XM_CALLBACKS_NULL.on_start */
extern void T137f2(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T99f6(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start */
extern void T99f6p1(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start */
extern void T96f12(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_equal */
extern T0* T354c32(T6 a1);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].default_create */
extern T0* T491c3(void);
/* DS_HASH_SET [XM_NAMESPACE].make */
extern void T354f35(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_cursor */
extern T0* T354f23(T0* C);
/* DS_HASH_SET_CURSOR [XM_NAMESPACE].make */
extern T0* T492c3(T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].unset_found_item */
extern void T354f36(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].make_slots */
extern void T354f44(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].special_integer_ */
extern T0* T354f29(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].new_modulus */
extern T6 T354f20(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_clashes */
extern void T354f43(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_key_storage */
extern void T354f42(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].make_item_storage */
extern void T354f41(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].make */
extern T0* T493f1(T0* C, T6 a1);
/* TO_SPECIAL [XM_NAMESPACE].make_area */
extern T0* T538c2(T6 a1);
/* SPECIAL [XM_NAMESPACE].make */
extern T0* T490c4(T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].default_create */
extern T0* T493c3(void);
/* XM_DOCUMENT.make */
extern T0* T97c15(void);
/* XM_DOCUMENT.make_with_root_named */
extern void T97f16(T0* C, T0* a1, T0* a2);
/* XM_DOCUMENT.force_last */
extern void T97f18(T0* C, T0* a1);
/* XM_DOCUMENT.force_last */
extern void T97f18p1(T0* C, T0* a1);
/* XM_DOCUMENT.is_empty */
extern T1 T97f11(T0* C);
/* XM_DOCUMENT.before_addition */
extern void T97f19(T0* C, T0* a1);
/* XM_ELEMENT.equality_delete */
extern void T98f38(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].remove */
extern void T203f13(T0* C);
/* XM_DOCUMENT.remove_at_cursor */
extern void T97f26(T0* C, T0* a1);
/* XM_DOCUMENT.move_all_cursors */
extern void T97f33(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST_CURSOR [XM_NODE].set_current_cell */
extern void T203f17(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].put */
extern void T361f6(T0* C, T0* a1);
/* XM_DOCUMENT.set_last_cell */
extern void T97f32(T0* C, T0* a1);
/* DS_LINKABLE [XM_NODE].forget_right */
extern void T361f5(T0* C);
/* XM_DOCUMENT.remove_last */
extern void T97f31(T0* C);
/* XM_DOCUMENT.move_last_cursors_after */
extern void T97f36(T0* C);
/* XM_DOCUMENT.wipe_out */
extern void T97f34(T0* C);
/* XM_DOCUMENT.move_all_cursors_after */
extern void T97f37(T0* C);
/* DS_LINKED_LIST_CURSOR [XM_NODE].is_last */
extern T1 T203f7(T0* C);
/* XM_DOCUMENT.cursor_is_last */
extern T1 T97f14(T0* C, T0* a1);
/* XM_ELEMENT.cursor_is_last */
extern T1 T98f25(T0* C, T0* a1);
/* XM_DOCUMENT.remove_first */
extern void T97f30(T0* C);
/* XM_DOCUMENT.set_first_cell */
extern void T97f35(T0* C, T0* a1);
/* DS_LINKED_LIST_CURSOR [XM_NODE].is_first */
extern T1 T203f6(T0* C);
/* XM_DOCUMENT.cursor_is_first */
extern T1 T97f13(T0* C, T0* a1);
/* XM_ELEMENT.cursor_is_first */
extern T1 T98f24(T0* C, T0* a1);
/* XM_ELEMENT.remove_at_cursor */
extern void T98f43(T0* C, T0* a1);
/* XM_ELEMENT.move_all_cursors */
extern void T98f49(T0* C, T0* a1, T0* a2);
/* XM_ELEMENT.set_last_cell */
extern void T98f48(T0* C, T0* a1);
/* XM_ELEMENT.remove_last */
extern void T98f47(T0* C);
/* XM_ELEMENT.move_last_cursors_after */
extern void T98f52(T0* C);
/* XM_ELEMENT.wipe_out */
extern void T98f50(T0* C);
/* XM_ELEMENT.remove_first */
extern void T98f46(T0* C);
/* XM_ELEMENT.set_first_cell */
extern void T98f51(T0* C, T0* a1);
/* XM_DOCUMENT.equality_delete */
extern void T97f21(T0* C, T0* a1);
/* XM_DOCUMENT.new_cursor */
extern T0* T97f9(T0* C);
/* XM_DOCUMENT.list_make */
extern void T97f17(T0* C);
/* XM_ELEMENT.make */
extern T0* T98c33(T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.list_make */
extern void T98f35(T0* C);
/* XM_DOCUMENT.default_ns */
extern unsigned char ge1497os5715;
extern T0* ge1497ov5715;
extern T0* T97f7(T0* C);
/* XM_NAMESPACE.make_default */
extern T0* T358c9(void);
/* XM_NAMESPACE.make */
extern void T358f8(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE.make */
extern T0* T358c8(T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_finish */
extern void T177f27(T0* C);
/* XM_CALLBACKS_NULL.on_finish */
extern void T137f3(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T99f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_finish */
extern void T99f7p1(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_finish */
extern void T96f13(T0* C);
/* XM_NAMESPACE_RESOLVER.on_comment */
extern void T177f28(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_comment */
extern void T137f4(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T99f8(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_comment */
extern void T99f8p1(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_comment */
extern void T96f14(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.handle_position */
extern void T96f22(T0* C, T0* a1);
/* XM_POSITION_TABLE.put */
extern void T100f5(T0* C, T0* a1, T0* a2);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].put_last */
extern void T180f12(T0* C, T0* a1);
/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].put_right */
extern void T326f4(T0* C, T0* a1);
/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].make */
extern T0* T326c3(T0* a1);
/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].is_empty */
extern T1 T180f5(T0* C);
/* DS_PAIR [XM_POSITION, XM_NODE].make */
extern T0* T212c3(T0* a1, T0* a2);
/* XM_CALLBACKS_TO_TREE_FILTER.is_position_table_enabled */
extern T1 T96f8(T0* C);
/* XM_COMMENT.make_last */
extern T0* T355c4(T0* a1, T0* a2);
/* XM_ELEMENT.force_last */
extern void T98f36(T0* C, T0* a1);
/* XM_ELEMENT.force_last */
extern void T98f36p1(T0* C, T0* a1);
/* XM_ELEMENT.force_last */
extern void T98f36p0(T0* C, T0* a1);
/* XM_ELEMENT.before_addition */
extern void T98f37(T0* C, T0* a1);
/* XM_ELEMENT.last */
extern T0* T98f18(T0* C);
/* XM_COMMENT.make_last_in_document */
extern T0* T355c3(T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_processing_instruction */
extern void T177f29(T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_NULL.on_processing_instruction */
extern void T137f5(T0* C, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T99f9(T0* C, T0* a1, T0* a2);
/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
extern void T99f9p1(T0* C, T0* a1, T0* a2);
/* XM_CALLBACKS_TO_TREE_FILTER.on_processing_instruction */
extern void T96f15(T0* C, T0* a1, T0* a2);
/* XM_PROCESSING_INSTRUCTION.make_last */
extern T0* T356c5(T0* a1, T0* a2, T0* a3);
/* XM_PROCESSING_INSTRUCTION.make_last_in_document */
extern T0* T356c4(T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER.on_content */
extern void T177f30(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_content */
extern void T137f6(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T99f10(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_content */
extern void T99f10p1(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_content */
extern void T96f16(T0* C, T0* a1);
/* XM_CHARACTER_DATA.make_last */
extern T0* T357c3(T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.on_start_tag */
extern void T177f33(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.push */
extern void T252f12(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].force_last */
extern void T345f11(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].put_right */
extern void T487f5(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].attach_left */
extern void T487f6(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].make */
extern T0* T487c4(T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].is_empty */
extern T1 T345f6(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.new_string_string_table */
extern T0* T252f8(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].set_equality_tester */
extern void T81f45(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.string_equality_tester */
extern T0* T252f9(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].make_map_default */
extern T0* T81c43(void);
/* DS_HASH_TABLE [STRING_8, STRING_8].default_capacity */
extern T6 T81f33(T0* C);
/* XM_CALLBACKS_NULL.on_start_tag */
extern void T137f9(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T99f11(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
extern void T99f11p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag */
extern void T96f17(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_last */
extern T0* T98c32(T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.make_root */
extern T0* T98c31(T0* a1, T0* a2, T0* a3);
/* XM_DOCUMENT.set_root_element */
extern void T97f20(T0* C, T0* a1);
/* XM_DOCUMENT.remove_previous_root_element */
extern void T97f27(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.new_namespace */
extern T0* T96f7(T0* C, T0* a1, T0* a2);
/* DS_HASH_SET [XM_NAMESPACE].force_last */
extern void T354f33(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_put */
extern void T354f40(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].clashes_put */
extern void T354f39(T0* C, T6 a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].slots_item */
extern T6 T354f26(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].hash_position */
extern T6 T354f22(T0* C, T0* a1);
/* XM_NAMESPACE.hash_code */
extern T6 T358f5(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].resize */
extern void T354f38(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_resize */
extern void T354f48(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].key_storage_resize */
extern void T354f47(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_resize */
extern void T354f46(T0* C, T6 a1);
/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].resize */
extern T0* T493f2(T0* C, T0* a1, T6 a2);
/* SPECIAL [XM_NAMESPACE].aliased_resized_area */
extern T0* T490f3(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].key_storage_item */
extern T0* T354f18(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_item */
extern T0* T354f30(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].clashes_item */
extern T6 T354f19(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].slots_resize */
extern void T354f45(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].new_capacity */
extern T6 T354f21(T0* C, T6 a1);
/* DS_HASH_SET [XM_NAMESPACE].item_storage_put */
extern void T354f37(T0* C, T0* a1, T6 a2);
/* DS_HASH_SET [XM_NAMESPACE].search_position */
extern void T354f34(T0* C, T0* a1);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].test */
extern T1 T491f1(T0* C, T0* a1, T0* a2);
/* KL_EQUALITY_TESTER [XM_NAMESPACE].any_ */
extern T0* T491f2(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].key_equality_tester */
extern T0* T354f17(T0* C);
/* XM_NAMESPACE.same_prefix */
extern T1 T358f7(T0* C, T0* a1);
/* XM_NAMESPACE.string_ */
extern T0* T358f3(T0* C);
/* DS_HASH_SET [XM_NAMESPACE].item */
extern T0* T354f24(T0* C, T0* a1);
/* DS_HASH_SET [XM_NAMESPACE].has */
extern T1 T354f27(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T177f31(T0* C);
/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
extern void T177f31p1(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve_default */
extern T0* T252f3(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_pseudo_prefix */
extern unsigned char ge1471os7884;
extern T0* ge1471ov7884;
extern T0* T252f7(T0* C);
/* XM_NAMESPACE_RESOLVER.string_ */
extern T0* T177f11(T0* C);
/* XM_NAMESPACE_RESOLVER.on_delayed_attributes */
extern void T177f37(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_remove */
extern void T177f39(T0* C);
/* DS_LINKED_QUEUE [STRING_8].remove */
extern void T254f8(T0* C);
/* DS_LINKED_QUEUE [STRING_8].wipe_out */
extern void T254f9(T0* C);
/* XM_NAMESPACE_RESOLVER.unprefixed_attribute_namespace */
extern T0* T177f19(T0* C);
/* XM_NAMESPACE_RESOLVER.default_namespace */
extern unsigned char ge1438os6912;
extern T0* ge1438ov6912;
extern T0* T177f23(T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns_namespace */
extern unsigned char ge1438os6920;
extern T0* ge1438ov6920;
extern T0* T177f18(T0* C);
/* XM_NAMESPACE_RESOLVER.is_xmlns */
extern T1 T177f14(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.same_string */
extern T1 T177f21(T0* C, T0* a1, T0* a2);
/* XM_NAMESPACE_RESOLVER.string_equality_tester */
extern T0* T177f24(T0* C);
/* XM_NAMESPACE_RESOLVER.xmlns */
extern unsigned char ge1438os6913;
extern T0* ge1438ov6913;
extern T0* T177f20(T0* C);
/* XM_NAMESPACE_RESOLVER.xml_prefix_namespace */
extern unsigned char ge1438os6919;
extern T0* ge1438ov6919;
extern T0* T177f17(T0* C);
/* XM_NAMESPACE_RESOLVER.is_xml */
extern T1 T177f16(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.xml_prefix */
extern unsigned char ge1438os6914;
extern T0* ge1438ov6914;
extern T0* T177f22(T0* C);
/* DS_LINKED_QUEUE [STRING_8].item */
extern T0* T254f5(T0* C);
/* XM_NAMESPACE_RESOLVER.attributes_is_empty */
extern T1 T177f15(T0* C);
/* DS_LINKED_QUEUE [STRING_8].is_empty */
extern T1 T254f4(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve */
extern T0* T252f2(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].back */
extern void T346f10(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_back */
extern void T345f18(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].add_traversing_cursor */
extern void T345f19(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_next_cursor */
extern void T346f12(T0* C, T0* a1);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_traversing_cursor */
extern void T345f20(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set */
extern void T346f13(T0* C, T0* a1, T1 a2, T1 a3);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].go_before */
extern void T346f9(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_go_before */
extern void T345f17(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_before */
extern void T346f14(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_off */
extern T1 T345f8(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item */
extern T0* T81f23(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_item */
extern T0* T81f28(T0* C, T6 a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].has */
extern T1 T81f22(T0* C, T0* a1);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].item */
extern T0* T346f6(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].finish */
extern void T346f8(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_finish */
extern void T345f16(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.default_namespace */
extern unsigned char ge1471os7885;
extern T0* ge1471ov7885;
extern T0* T252f6(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.has */
extern T1 T252f5(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.has_prefix */
extern T1 T177f9(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_start_tag_finish */
extern void T137f7(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T99f12(T0* C);
/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
extern void T99f12p1(T0* C);
/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag_finish */
extern void T96f18(T0* C);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T177f32(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_NAMESPACE_RESOLVER_CONTEXT.pop */
extern void T252f11(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_last */
extern void T345f10(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].set_last_cell */
extern void T345f14(T0* C, T0* a1);
/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].forget_right */
extern void T487f7(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_last_cursors_after */
extern void T345f13(T0* C);
/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_after */
extern void T346f11(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].wipe_out */
extern void T345f12(T0* C);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_all_cursors_after */
extern void T345f15(T0* C);
/* XM_NAMESPACE_RESOLVER.on_end_tag */
extern void T177f32p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_NULL.on_end_tag */
extern void T137f8(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T99f13(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
extern void T99f13p1(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_end_tag */
extern void T96f19(T0* C, T0* a1, T0* a2, T0* a3);
/* XM_ELEMENT.parent_element */
extern T0* T98f19(T0* C);
/* XM_DOCUMENT.process */
extern void T97f22(T0* C, T0* a1);
/* XM_NODE_TYPER.process_document */
extern void T363f13(T0* C, T0* a1);
/* XM_ELEMENT.is_root_node */
extern T1 T98f22(T0* C);
/* XM_DOCUMENT.is_root_node */
extern T1 T97f10(T0* C);
/* XM_NAMESPACE_RESOLVER.on_error */
extern void T177f35(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_error */
extern void T137f11(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T99f14(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.on_error */
extern void T99f14p1(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.on_error */
extern void T96f20(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.on_attribute */
extern void T177f34(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add */
extern void T252f14(T0* C, T0* a1, T0* a2);
/* DS_HASH_TABLE [STRING_8, STRING_8].force_new */
extern void T81f56(T0* C, T0* a1, T0* a2);
/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].last */
extern T0* T345f5(T0* C);
/* XM_NAMESPACE_RESOLVER_CONTEXT.shallow_has */
extern T1 T252f4(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER.attributes_force */
extern void T177f38(T0* C, T0* a1, T0* a2, T0* a3);
/* DS_LINKED_QUEUE [STRING_8].force */
extern void T254f7(T0* C, T0* a1);
/* XM_NAMESPACE_RESOLVER_CONTEXT.add_default */
extern void T252f13(T0* C, T0* a1);
/* XM_CALLBACKS_NULL.on_attribute */
extern void T137f10(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T99f15(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_STOP_ON_ERROR_FILTER.on_attribute */
extern void T99f15p1(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_CALLBACKS_TO_TREE_FILTER.on_attribute */
extern void T96f21(T0* C, T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_ATTRIBUTE.make_last */
extern T0* T200c5(T0* a1, T0* a2, T0* a3, T0* a4);
/* XM_NAMESPACE_RESOLVER.on_xml_declaration */
extern void T177f41(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_CALLBACKS_NULL.on_xml_declaration */
extern void T137f12(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_STOP_ON_ERROR_FILTER.on_xml_declaration */
extern void T99f16(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_CALLBACKS_TO_TREE_FILTER.on_xml_declaration */
extern void T96f23(T0* C, T0* a1, T0* a2, T1 a3);
/* XM_NAMESPACE_RESOLVER.set_next */
extern void T177f40(T0* C, T0* a1);
/* XM_STOP_ON_ERROR_FILTER.set_next */
extern void T99f5(T0* C, T0* a1);
/* XM_CALLBACKS_TO_TREE_FILTER.set_next */
extern void T96f11(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_start */
extern void T81f57(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].add_traversing_cursor */
extern void T81f66(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].remove_traversing_cursor */
extern void T81f65(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_off */
extern T1 T81f39(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].is_empty */
extern T1 T81f38(T0* C);
/* GEANT_ARGUMENT_VARIABLES.cursor_start */
extern void T34f71(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.add_traversing_cursor */
extern void T34f74(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.remove_traversing_cursor */
extern void T34f73(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_off */
extern T1 T34f43(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.is_empty */
extern T1 T34f42(T0* C);
/* GEANT_VARIABLES.cursor_start */
extern void T29f72(T0* C, T0* a1);
/* GEANT_VARIABLES.add_traversing_cursor */
extern void T29f75(T0* C, T0* a1);
/* GEANT_VARIABLES.remove_traversing_cursor */
extern void T29f74(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_off */
extern T1 T29f43(T0* C, T0* a1);
/* GEANT_VARIABLES.is_empty */
extern T1 T29f42(T0* C);
/* GEANT_PROJECT_VARIABLES.cursor_start */
extern void T25f82(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.add_traversing_cursor */
extern void T25f85(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.remove_traversing_cursor */
extern void T25f84(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_off */
extern T1 T25f52(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.is_empty */
extern T1 T25f51(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_forth */
extern void T81f58(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_forth */
extern void T34f72(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_forth */
extern void T29f73(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_forth */
extern void T25f83(T0* C, T0* a1);
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
extern T0* T17c51(T2 a1, T6 a2);
/* STRING_8.fill_character */
extern void T17f53(T0* C, T2 a1);
/* SPECIAL [CHARACTER_8].fill_with */
extern void T15f16(T0* C, T2 a1, T6 a2, T6 a3);
/* DS_QUICK_SORTER [AP_OPTION].sort */
extern void T350f3(T0* C, T0* a1);
/* DS_QUICK_SORTER [AP_OPTION].sort_with_comparator */
extern void T350f4(T0* C, T0* a1, T0* a2);
/* DS_QUICK_SORTER [AP_OPTION].subsort_with_comparator */
extern void T350f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4);
/* ARRAY [INTEGER_32].force */
extern void T204f13(T0* C, T6 a1, T6 a2);
/* ARRAY [INTEGER_32].auto_resize */
extern void T204f14(T0* C, T6 a1, T6 a2);
/* SPECIAL [INTEGER_32].fill_with_default */
extern void T63f10(T0* C, T6 a1, T6 a2);
/* ARRAY [INTEGER_32].capacity */
extern T6 T204f7(T0* C);
/* ARRAY [INTEGER_32].additional_space */
extern T6 T204f6(T0* C);
/* ARRAY [INTEGER_32].empty_area */
extern T1 T204f5(T0* C);
/* DS_ARRAYED_LIST [AP_OPTION].swap */
extern void T74f30(T0* C, T6 a1, T6 a2);
/* DS_ARRAYED_LIST [AP_OPTION].replace */
extern void T74f29(T0* C, T0* a1, T6 a2);
/* AP_OPTION_COMPARATOR.less_than */
extern T1 T349f1(T0* C, T0* a1, T0* a2);
/* KL_STRING_ROUTINES.three_way_comparison */
extern T6 T76f14(T0* C, T0* a1, T0* a2);
/* AP_OPTION_COMPARATOR.string_ */
extern T0* T349f2(T0* C);
/* ST_WORD_WRAPPER.wrapped_string */
extern T0* T352f5(T0* C, T0* a1);
/* ST_WORD_WRAPPER.canonify_whitespace */
extern void T352f12(T0* C, T0* a1);
/* UC_UTF8_STRING.put */
extern void T206f81(T0* C, T2 a1, T6 a2);
/* UC_UTF8_STRING.move_bytes_right */
extern void T206f82(T0* C, T6 a1, T6 a2);
/* ST_WORD_WRAPPER.is_space */
extern T1 T352f8(T0* C, T2 a1);
/* ST_WORD_WRAPPER.string_ */
extern T0* T352f4(T0* C);
/* ST_WORD_WRAPPER.set_new_line_indentation */
extern void T352f10(T0* C, T6 a1);
/* AP_DISPLAY_HELP_FLAG.wrapper */
extern unsigned char ge152os4755;
extern T0* ge152ov4755;
extern T0* T73f19(T0* C);
/* ST_WORD_WRAPPER.set_maximum_text_width */
extern void T352f11(T0* C, T6 a1);
/* ST_WORD_WRAPPER.make */
extern T0* T352c9(void);
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
extern T0* T350c2(T0* a1);
/* AP_OPTION_COMPARATOR.default_create */
extern T0* T349c3(void);
/* AP_STRING_OPTION.record_occurrence */
extern void T37f30(T0* C, T0* a1);
/* AP_FLAG.record_occurrence */
extern void T35f25(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.force_last */
extern void T34f69(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.force_last */
extern void T29f71(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.force_last */
extern void T25f93(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.resize */
extern void T25f68(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.clashes_resize */
extern void T25f76(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.key_storage_resize */
extern void T25f75(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.item_storage_resize */
extern void T25f74(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.slots_resize */
extern void T25f73(T0* C, T6 a1);
/* GEANT_PROJECT_VARIABLES.new_capacity */
extern T6 T25f32(T0* C, T6 a1);
/* GEANT_ARGUMENT_VARIABLES.search */
extern void T34f70(T0* C, T0* a1);
/* GEANT_VARIABLES.search */
extern void T29f70(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.search */
extern void T25f81(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.start */
extern void T34f78(T0* C);
/* GEANT_VARIABLES.start */
extern void T29f78(T0* C);
/* GEANT_PROJECT_VARIABLES.start */
extern void T25f95(T0* C);
/* GEANT_ARGUMENT_VARIABLES.forth */
extern void T34f79(T0* C);
/* GEANT_VARIABLES.forth */
extern void T29f79(T0* C);
/* GEANT_PROJECT_VARIABLES.forth */
extern void T25f96(T0* C);
/* GEANT_ARGUMENT_VARIABLES.set_variable_value */
extern void T34f76(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.set_variable_value */
extern void T29f49(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.set_variable_value */
extern void T25f60(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.force */
extern void T25f63(T0* C, T0* a1, T0* a2);
/* GEANT_ARGUMENT_VARIABLES.replace */
extern void T34f77(T0* C, T0* a1, T0* a2);
/* GEANT_VARIABLES.replace */
extern void T29f77(T0* C, T0* a1, T0* a2);
/* GEANT_PROJECT_VARIABLES.replace */
extern void T25f94(T0* C, T0* a1, T0* a2);
/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T629f3(T0* C, T6 a1);
/* LX_EPSILON_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T627f2(T0* C, T6 a1);
/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].labeled */
extern T1 T625f3(T0* C, T6 a1);
/* GEANT_REPLACE_TASK.is_executable */
extern T1 T318f18(T0* C);
/* GEANT_REPLACE_COMMAND.is_executable */
extern T1 T461f14(T0* C);
/* KL_BOOLEAN_ROUTINES.nxor */
extern T1 T562f1(T0* C, T0* a1);
/* GEANT_REPLACE_COMMAND.is_fileset_to_directory_executable */
extern T1 T461f17(T0* C);
/* GEANT_REPLACE_COMMAND.boolean_ */
extern unsigned char ge172os4956;
extern T0* ge172ov4956;
extern T0* T461f15(T0* C);
/* KL_BOOLEAN_ROUTINES.default_create */
extern T0* T562c2(void);
/* GEANT_INPUT_TASK.is_executable */
extern T1 T316f20(T0* C);
/* GEANT_INPUT_COMMAND.is_executable */
extern T1 T458f11(T0* C);
/* GEANT_AVAILABLE_TASK.is_executable */
extern T1 T314f6(T0* C);
/* GEANT_AVAILABLE_COMMAND.is_executable */
extern T1 T455f13(T0* C);
/* GEANT_AVAILABLE_COMMAND.validate_condition */
extern void T455f20(T0* C, T1 a1, T0* a2, T0* a3);
/* GEANT_AVAILABLE_COMMAND.validation_messages */
extern T0* T455f16(T0* C);
/* DS_CELL [BOOLEAN].put */
extern void T560f3(T0* C, T1 a1);
/* DS_CELL [BOOLEAN].make */
extern T0* T560c2(T1 a1);
/* GEANT_PRECURSOR_TASK.is_executable */
extern T1 T312f17(T0* C);
/* GEANT_PRECURSOR_COMMAND.is_executable */
extern T1 T452f7(T0* C);
/* GEANT_EXIT_TASK.is_executable */
extern T1 T310f10(T0* C);
/* GEANT_EXIT_COMMAND.is_executable */
extern T1 T449f6(T0* C);
/* GEANT_OUTOFDATE_TASK.is_executable */
extern T1 T308f15(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_executable */
extern T1 T446f11(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_fileset_executable */
extern T1 T446f13(T0* C);
/* GEANT_XSLT_TASK.is_executable */
extern T1 T306f29(T0* C);
/* GEANT_XSLT_COMMAND.is_executable */
extern T1 T442f17(T0* C);
/* GEANT_SETENV_TASK.is_executable */
extern T1 T304f11(T0* C);
/* GEANT_SETENV_COMMAND.is_executable */
extern T1 T438f7(T0* C);
/* GEANT_MOVE_TASK.is_executable */
extern T1 T302f13(T0* C);
/* GEANT_MOVE_COMMAND.is_executable */
extern T1 T435f9(T0* C);
/* GEANT_MOVE_COMMAND.is_fileset_to_directory_executable */
extern T1 T435f12(T0* C);
/* GEANT_COPY_TASK.is_executable */
extern T1 T300f19(T0* C);
/* GEANT_COPY_COMMAND.is_executable */
extern T1 T432f10(T0* C);
/* GEANT_COPY_COMMAND.is_fileset_to_directory_executable */
extern T1 T432f14(T0* C);
/* GEANT_COPY_COMMAND.boolean_ */
extern T0* T432f11(T0* C);
/* GEANT_DELETE_TASK.is_executable */
extern T1 T298f13(T0* C);
/* GEANT_DELETE_COMMAND.is_executable */
extern T1 T428f9(T0* C);
/* GEANT_DELETE_COMMAND.boolean_ */
extern T0* T428f10(T0* C);
/* GEANT_MKDIR_TASK.is_executable */
extern T1 T296f6(T0* C);
/* GEANT_MKDIR_COMMAND.is_executable */
extern T1 T424f10(T0* C);
/* GEANT_MKDIR_COMMAND.validate_condition */
extern void T424f17(T0* C, T1 a1, T0* a2, T0* a3);
/* GEANT_MKDIR_COMMAND.validation_messages */
extern T0* T424f12(T0* C);
/* GEANT_ECHO_TASK.is_executable */
extern T1 T294f6(T0* C);
/* GEANT_ECHO_COMMAND.is_executable */
extern T1 T421f9(T0* C);
/* GEANT_ECHO_COMMAND.validate_condition */
extern void T421f17(T0* C, T1 a1, T0* a2, T0* a3);
/* GEANT_ECHO_COMMAND.validation_messages */
extern T0* T421f11(T0* C);
/* GEANT_GEANT_TASK.is_executable */
extern T1 T292f25(T0* C);
/* GEANT_GEANT_COMMAND.is_executable */
extern T1 T417f13(T0* C);
/* GEANT_GEANT_COMMAND.is_target_executable */
extern T1 T417f15(T0* C);
/* GEANT_GETEST_TASK.is_executable */
extern T1 T290f27(T0* C);
/* GEANT_GETEST_COMMAND.is_executable */
extern T1 T414f16(T0* C);
/* GEANT_GEPP_TASK.is_executable */
extern T1 T288f22(T0* C);
/* GEANT_GEPP_COMMAND.is_executable */
extern T1 T411f12(T0* C);
/* GEANT_GEPP_COMMAND.is_fileset_executable */
extern T1 T411f14(T0* C);
/* GEANT_GEYACC_TASK.is_executable */
extern T1 T286f22(T0* C);
/* GEANT_GEYACC_COMMAND.is_executable */
extern T1 T408f13(T0* C);
/* GEANT_GELEX_TASK.is_executable */
extern T1 T284f25(T0* C);
/* GEANT_GELEX_COMMAND.is_executable */
extern T1 T405f16(T0* C);
/* GEANT_GEXACE_TASK.is_executable */
extern T1 T282f23(T0* C);
/* GEANT_GEXACE_COMMAND.is_executable */
extern T1 T402f13(T0* C);
/* GEANT_GEXACE_COMMAND.boolean_ */
extern T0* T402f14(T0* C);
/* GEANT_UNSET_TASK.is_executable */
extern T1 T280f10(T0* C);
/* GEANT_UNSET_COMMAND.is_executable */
extern T1 T398f6(T0* C);
/* GEANT_SET_TASK.is_executable */
extern T1 T278f11(T0* C);
/* GEANT_SET_COMMAND.is_executable */
extern T1 T395f7(T0* C);
/* GEANT_LCC_TASK.is_executable */
extern T1 T276f11(T0* C);
/* GEANT_LCC_COMMAND.is_executable */
extern T1 T392f7(T0* C);
/* GEANT_EXEC_TASK.is_executable */
extern T1 T274f7(T0* C);
/* GEANT_EXEC_COMMAND.is_executable */
extern T1 T384f9(T0* C);
/* GEANT_EXEC_COMMAND.validate_condition */
extern void T384f17(T0* C, T1 a1, T0* a2, T0* a3);
/* GEANT_EXEC_COMMAND.validation_messages */
extern T0* T384f12(T0* C);
/* GEANT_ISE_TASK.is_executable */
extern T1 T272f21(T0* C);
/* GEANT_ISE_COMMAND.is_executable */
extern T1 T380f11(T0* C);
/* GEANT_ISE_COMMAND.is_cleanable */
extern T1 T380f13(T0* C);
/* GEANT_GEC_TASK.is_executable */
extern T1 T265f24(T0* C);
/* GEANT_GEC_COMMAND.is_executable */
extern T1 T376f14(T0* C);
/* GEANT_REPLACE_TASK.is_enabled */
extern T1 T318f19(T0* C);
/* GEANT_REPLACE_TASK.unless_attribute_name */
extern T0* T318f23(T0* C);
/* GEANT_REPLACE_TASK.if_attribute_name */
extern T0* T318f22(T0* C);
/* GEANT_INPUT_TASK.is_enabled */
extern T1 T316f21(T0* C);
/* GEANT_INPUT_TASK.unless_attribute_name */
extern T0* T316f25(T0* C);
/* GEANT_INPUT_TASK.if_attribute_name */
extern T0* T316f24(T0* C);
/* GEANT_AVAILABLE_TASK.is_enabled */
extern T1 T314f7(T0* C);
/* GEANT_AVAILABLE_TASK.unless_attribute_name */
extern T0* T314f13(T0* C);
/* GEANT_AVAILABLE_TASK.has_attribute */
extern T1 T314f12(T0* C, T0* a1);
/* GEANT_AVAILABLE_TASK.if_attribute_name */
extern T0* T314f11(T0* C);
/* GEANT_PRECURSOR_TASK.is_enabled */
extern T1 T312f18(T0* C);
/* GEANT_PRECURSOR_TASK.unless_attribute_name */
extern T0* T312f22(T0* C);
/* GEANT_PRECURSOR_TASK.if_attribute_name */
extern T0* T312f21(T0* C);
/* GEANT_EXIT_TASK.is_enabled */
extern T1 T310f11(T0* C);
/* GEANT_EXIT_TASK.unless_attribute_name */
extern T0* T310f15(T0* C);
/* GEANT_EXIT_TASK.if_attribute_name */
extern T0* T310f14(T0* C);
/* GEANT_OUTOFDATE_TASK.is_enabled */
extern T1 T308f16(T0* C);
/* GEANT_OUTOFDATE_TASK.unless_attribute_name */
extern T0* T308f20(T0* C);
/* GEANT_OUTOFDATE_TASK.if_attribute_name */
extern T0* T308f19(T0* C);
/* GEANT_XSLT_TASK.is_enabled */
extern T1 T306f30(T0* C);
/* GEANT_XSLT_TASK.unless_attribute_name */
extern T0* T306f34(T0* C);
/* GEANT_XSLT_TASK.if_attribute_name */
extern T0* T306f33(T0* C);
/* GEANT_SETENV_TASK.is_enabled */
extern T1 T304f12(T0* C);
/* GEANT_SETENV_TASK.unless_attribute_name */
extern T0* T304f16(T0* C);
/* GEANT_SETENV_TASK.if_attribute_name */
extern T0* T304f15(T0* C);
/* GEANT_MOVE_TASK.is_enabled */
extern T1 T302f14(T0* C);
/* GEANT_MOVE_TASK.unless_attribute_name */
extern T0* T302f18(T0* C);
/* GEANT_MOVE_TASK.if_attribute_name */
extern T0* T302f17(T0* C);
/* GEANT_COPY_TASK.is_enabled */
extern T1 T300f20(T0* C);
/* GEANT_COPY_TASK.unless_attribute_name */
extern T0* T300f24(T0* C);
/* GEANT_COPY_TASK.if_attribute_name */
extern T0* T300f23(T0* C);
/* GEANT_DELETE_TASK.is_enabled */
extern T1 T298f14(T0* C);
/* GEANT_DELETE_TASK.unless_attribute_name */
extern T0* T298f18(T0* C);
/* GEANT_DELETE_TASK.if_attribute_name */
extern T0* T298f17(T0* C);
/* GEANT_MKDIR_TASK.is_enabled */
extern T1 T296f7(T0* C);
/* GEANT_MKDIR_TASK.unless_attribute_name */
extern T0* T296f13(T0* C);
/* GEANT_MKDIR_TASK.has_attribute */
extern T1 T296f12(T0* C, T0* a1);
/* GEANT_MKDIR_TASK.if_attribute_name */
extern T0* T296f11(T0* C);
/* GEANT_ECHO_TASK.is_enabled */
extern T1 T294f7(T0* C);
/* GEANT_ECHO_TASK.unless_attribute_name */
extern T0* T294f13(T0* C);
/* GEANT_ECHO_TASK.has_attribute */
extern T1 T294f12(T0* C, T0* a1);
/* GEANT_ECHO_TASK.if_attribute_name */
extern T0* T294f11(T0* C);
/* GEANT_GEANT_TASK.is_enabled */
extern T1 T292f26(T0* C);
/* GEANT_GEANT_TASK.unless_attribute_name */
extern T0* T292f30(T0* C);
/* GEANT_GEANT_TASK.if_attribute_name */
extern T0* T292f29(T0* C);
/* GEANT_GETEST_TASK.is_enabled */
extern T1 T290f28(T0* C);
/* GEANT_GETEST_TASK.unless_attribute_name */
extern T0* T290f32(T0* C);
/* GEANT_GETEST_TASK.if_attribute_name */
extern T0* T290f31(T0* C);
/* GEANT_GEPP_TASK.is_enabled */
extern T1 T288f23(T0* C);
/* GEANT_GEPP_TASK.unless_attribute_name */
extern T0* T288f27(T0* C);
/* GEANT_GEPP_TASK.if_attribute_name */
extern T0* T288f26(T0* C);
/* GEANT_GEYACC_TASK.is_enabled */
extern T1 T286f23(T0* C);
/* GEANT_GEYACC_TASK.unless_attribute_name */
extern T0* T286f27(T0* C);
/* GEANT_GEYACC_TASK.if_attribute_name */
extern T0* T286f26(T0* C);
/* GEANT_GELEX_TASK.is_enabled */
extern T1 T284f26(T0* C);
/* GEANT_GELEX_TASK.unless_attribute_name */
extern T0* T284f30(T0* C);
/* GEANT_GELEX_TASK.if_attribute_name */
extern T0* T284f29(T0* C);
/* GEANT_GEXACE_TASK.is_enabled */
extern T1 T282f24(T0* C);
/* GEANT_GEXACE_TASK.unless_attribute_name */
extern T0* T282f28(T0* C);
/* GEANT_GEXACE_TASK.if_attribute_name */
extern T0* T282f27(T0* C);
/* GEANT_UNSET_TASK.is_enabled */
extern T1 T280f11(T0* C);
/* GEANT_UNSET_TASK.unless_attribute_name */
extern T0* T280f15(T0* C);
/* GEANT_UNSET_TASK.if_attribute_name */
extern T0* T280f14(T0* C);
/* GEANT_SET_TASK.is_enabled */
extern T1 T278f12(T0* C);
/* GEANT_SET_TASK.unless_attribute_name */
extern T0* T278f16(T0* C);
/* GEANT_SET_TASK.if_attribute_name */
extern T0* T278f15(T0* C);
/* GEANT_LCC_TASK.is_enabled */
extern T1 T276f12(T0* C);
/* GEANT_LCC_TASK.unless_attribute_name */
extern T0* T276f16(T0* C);
/* GEANT_LCC_TASK.if_attribute_name */
extern T0* T276f15(T0* C);
/* GEANT_EXEC_TASK.is_enabled */
extern T1 T274f8(T0* C);
/* GEANT_EXEC_TASK.unless_attribute_name */
extern T0* T274f14(T0* C);
/* GEANT_EXEC_TASK.has_attribute */
extern T1 T274f13(T0* C, T0* a1);
/* GEANT_EXEC_TASK.if_attribute_name */
extern T0* T274f12(T0* C);
/* GEANT_ISE_TASK.is_enabled */
extern T1 T272f22(T0* C);
/* GEANT_ISE_TASK.unless_attribute_name */
extern T0* T272f26(T0* C);
/* GEANT_ISE_TASK.if_attribute_name */
extern T0* T272f25(T0* C);
/* GEANT_GEC_TASK.is_enabled */
extern T1 T265f25(T0* C);
/* GEANT_GEC_TASK.unless_attribute_name */
extern T0* T265f29(T0* C);
/* GEANT_GEC_TASK.if_attribute_name */
extern T0* T265f28(T0* C);
/* GEANT_REPLACE_TASK.is_exit_command */
extern T1 T318f20(T0* C);
/* GEANT_REPLACE_COMMAND.is_exit_command */
extern T1 T461f13(T0* C);
/* GEANT_INPUT_TASK.is_exit_command */
extern T1 T316f22(T0* C);
/* GEANT_INPUT_COMMAND.is_exit_command */
extern T1 T458f10(T0* C);
/* GEANT_AVAILABLE_TASK.is_exit_command */
extern T1 T314f8(T0* C);
/* GEANT_AVAILABLE_COMMAND.is_exit_command */
extern T1 T455f14(T0* C);
/* GEANT_PRECURSOR_TASK.is_exit_command */
extern T1 T312f19(T0* C);
/* GEANT_PRECURSOR_COMMAND.is_exit_command */
extern T1 T452f6(T0* C);
/* GEANT_EXIT_TASK.is_exit_command */
extern T1 T310f12(T0* C);
/* GEANT_OUTOFDATE_TASK.is_exit_command */
extern T1 T308f17(T0* C);
/* GEANT_OUTOFDATE_COMMAND.is_exit_command */
extern T1 T446f16(T0* C);
/* GEANT_XSLT_TASK.is_exit_command */
extern T1 T306f31(T0* C);
/* GEANT_XSLT_COMMAND.is_exit_command */
extern T1 T442f18(T0* C);
/* GEANT_SETENV_TASK.is_exit_command */
extern T1 T304f13(T0* C);
/* GEANT_SETENV_COMMAND.is_exit_command */
extern T1 T438f6(T0* C);
/* GEANT_MOVE_TASK.is_exit_command */
extern T1 T302f15(T0* C);
/* GEANT_MOVE_COMMAND.is_exit_command */
extern T1 T435f8(T0* C);
/* GEANT_COPY_TASK.is_exit_command */
extern T1 T300f21(T0* C);
/* GEANT_COPY_COMMAND.is_exit_command */
extern T1 T432f9(T0* C);
/* GEANT_DELETE_TASK.is_exit_command */
extern T1 T298f15(T0* C);
/* GEANT_DELETE_COMMAND.is_exit_command */
extern T1 T428f8(T0* C);
/* GEANT_MKDIR_TASK.is_exit_command */
extern T1 T296f8(T0* C);
/* GEANT_MKDIR_COMMAND.is_exit_command */
extern T1 T424f11(T0* C);
/* GEANT_ECHO_TASK.is_exit_command */
extern T1 T294f8(T0* C);
/* GEANT_ECHO_COMMAND.is_exit_command */
extern T1 T421f10(T0* C);
/* GEANT_GEANT_TASK.is_exit_command */
extern T1 T292f27(T0* C);
/* GEANT_GEANT_COMMAND.is_exit_command */
extern T1 T417f12(T0* C);
/* GEANT_GETEST_TASK.is_exit_command */
extern T1 T290f29(T0* C);
/* GEANT_GETEST_COMMAND.is_exit_command */
extern T1 T414f15(T0* C);
/* GEANT_GEPP_TASK.is_exit_command */
extern T1 T288f24(T0* C);
/* GEANT_GEPP_COMMAND.is_exit_command */
extern T1 T411f11(T0* C);
/* GEANT_GEYACC_TASK.is_exit_command */
extern T1 T286f24(T0* C);
/* GEANT_GEYACC_COMMAND.is_exit_command */
extern T1 T408f12(T0* C);
/* GEANT_GELEX_TASK.is_exit_command */
extern T1 T284f27(T0* C);
/* GEANT_GELEX_COMMAND.is_exit_command */
extern T1 T405f15(T0* C);
/* GEANT_GEXACE_TASK.is_exit_command */
extern T1 T282f25(T0* C);
/* GEANT_GEXACE_COMMAND.is_exit_command */
extern T1 T402f12(T0* C);
/* GEANT_UNSET_TASK.is_exit_command */
extern T1 T280f12(T0* C);
/* GEANT_UNSET_COMMAND.is_exit_command */
extern T1 T398f5(T0* C);
/* GEANT_SET_TASK.is_exit_command */
extern T1 T278f13(T0* C);
/* GEANT_SET_COMMAND.is_exit_command */
extern T1 T395f6(T0* C);
/* GEANT_LCC_TASK.is_exit_command */
extern T1 T276f13(T0* C);
/* GEANT_LCC_COMMAND.is_exit_command */
extern T1 T392f6(T0* C);
/* GEANT_EXEC_TASK.is_exit_command */
extern T1 T274f9(T0* C);
/* GEANT_EXEC_COMMAND.is_exit_command */
extern T1 T384f10(T0* C);
/* GEANT_ISE_TASK.is_exit_command */
extern T1 T272f23(T0* C);
/* GEANT_ISE_COMMAND.is_exit_command */
extern T1 T380f10(T0* C);
/* GEANT_GEC_TASK.is_exit_command */
extern T1 T265f26(T0* C);
/* GEANT_GEC_COMMAND.is_exit_command */
extern T1 T376f13(T0* C);
/* GEANT_REPLACE_TASK.exit_code */
extern T6 T318f21(T0* C);
/* GEANT_INPUT_TASK.exit_code */
extern T6 T316f23(T0* C);
/* GEANT_AVAILABLE_TASK.exit_code */
extern T6 T314f9(T0* C);
/* GEANT_PRECURSOR_TASK.exit_code */
extern T6 T312f20(T0* C);
/* GEANT_EXIT_TASK.exit_code */
extern T6 T310f13(T0* C);
/* GEANT_OUTOFDATE_TASK.exit_code */
extern T6 T308f18(T0* C);
/* GEANT_XSLT_TASK.exit_code */
extern T6 T306f32(T0* C);
/* GEANT_SETENV_TASK.exit_code */
extern T6 T304f14(T0* C);
/* GEANT_MOVE_TASK.exit_code */
extern T6 T302f16(T0* C);
/* GEANT_COPY_TASK.exit_code */
extern T6 T300f22(T0* C);
/* GEANT_DELETE_TASK.exit_code */
extern T6 T298f16(T0* C);
/* GEANT_MKDIR_TASK.exit_code */
extern T6 T296f9(T0* C);
/* GEANT_ECHO_TASK.exit_code */
extern T6 T294f9(T0* C);
/* GEANT_GEANT_TASK.exit_code */
extern T6 T292f28(T0* C);
/* GEANT_GETEST_TASK.exit_code */
extern T6 T290f30(T0* C);
/* GEANT_GEPP_TASK.exit_code */
extern T6 T288f25(T0* C);
/* GEANT_GEYACC_TASK.exit_code */
extern T6 T286f25(T0* C);
/* GEANT_GELEX_TASK.exit_code */
extern T6 T284f28(T0* C);
/* GEANT_GEXACE_TASK.exit_code */
extern T6 T282f26(T0* C);
/* GEANT_UNSET_TASK.exit_code */
extern T6 T280f13(T0* C);
/* GEANT_SET_TASK.exit_code */
extern T6 T278f14(T0* C);
/* GEANT_LCC_TASK.exit_code */
extern T6 T276f14(T0* C);
/* GEANT_EXEC_TASK.exit_code */
extern T6 T274f10(T0* C);
/* GEANT_ISE_TASK.exit_code */
extern T6 T272f24(T0* C);
/* GEANT_GEC_TASK.exit_code */
extern T6 T265f27(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.error_position */
extern T0* T176f57(T0* C);
/* XM_DEFAULT_POSITION.make */
extern T0* T133c5(T0* a1, T6 a2, T6 a3, T6 a4);
/* XM_EIFFEL_SCANNER_DTD.error_position */
extern T0* T174f55(T0* C);
/* XM_EIFFEL_ENTITY_DEF.error_position */
extern T0* T170f56(T0* C);
/* XM_EIFFEL_SCANNER.error_position */
extern T0* T132f63(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.end_of_file */
extern T1 T176f60(T0* C);
/* XM_EIFFEL_SCANNER_DTD.end_of_file */
extern T1 T174f61(T0* C);
/* XM_EIFFEL_ENTITY_DEF.end_of_file */
extern T1 T170f59(T0* C);
/* XM_EIFFEL_SCANNER.end_of_file */
extern T1 T132f65(T0* C);
/* XM_EIFFEL_PE_ENTITY_DEF.is_applicable_encoding */
extern T1 T176f61(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_applicable_encoding */
extern T1 T208f16(T0* C, T0* a1);
/* XM_EIFFEL_INPUT_STREAM.is_valid_encoding */
extern T1 T208f9(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER_DTD.is_applicable_encoding */
extern T1 T174f48(T0* C, T0* a1);
/* XM_EIFFEL_ENTITY_DEF.is_applicable_encoding */
extern T1 T170f60(T0* C, T0* a1);
/* XM_EIFFEL_SCANNER.is_applicable_encoding */
extern T1 T132f66(T0* C, T0* a1);
/* XM_EIFFEL_PE_ENTITY_DEF.start_condition */
extern T6 T176f62(T0* C);
/* XM_EIFFEL_SCANNER_DTD.start_condition */
extern T6 T174f50(T0* C);
/* XM_EIFFEL_ENTITY_DEF.start_condition */
extern T6 T170f61(T0* C);
/* XM_EIFFEL_SCANNER.start_condition */
extern T6 T132f43(T0* C);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_after */
extern T1 T81f25(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_after */
extern T1 T34f36(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_after */
extern T1 T29f38(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_after */
extern T1 T25f46(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_item */
extern T0* T81f26(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_item */
extern T0* T34f37(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.item_storage_item */
extern T0* T34f41(T0* C, T6 a1);
/* GEANT_VARIABLES.cursor_item */
extern T0* T29f39(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_item */
extern T0* T25f47(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_key */
extern T0* T81f27(T0* C, T0* a1);
/* GEANT_ARGUMENT_VARIABLES.cursor_key */
extern T0* T34f38(T0* C, T0* a1);
/* GEANT_VARIABLES.cursor_key */
extern T0* T29f40(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.cursor_key */
extern T0* T25f48(T0* C, T0* a1);
/* DS_HASH_TABLE [STRING_8, STRING_8].new_cursor */
extern T0* T81f35(T0* C);
/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].make */
extern T0* T64c7(T0* a1);
/* GEANT_ARGUMENT_VARIABLES.new_cursor */
extern T0* T34f30(T0* C);
/* GEANT_VARIABLES.new_cursor */
extern T0* T29f30(T0* C);
/* GEANT_PROJECT_VARIABLES.new_cursor */
extern T0* T25f35(T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.default_message */
extern T0* T607f5(T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.message */
extern T0* T607f3(T0* C, T0* a1);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.arguments */
extern T0* T607f6(T0* C);
/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.string_ */
extern T0* T607f4(T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.default_message */
extern T0* T594f5(T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.message */
extern T0* T594f3(T0* C, T0* a1);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.arguments */
extern T0* T594f6(T0* C);
/* LX_CHARACTER_OUT_OF_RANGE_ERROR.string_ */
extern T0* T594f4(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.default_message */
extern T0* T593f5(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.message */
extern T0* T593f3(T0* C, T0* a1);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.arguments */
extern T0* T593f6(T0* C);
/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.string_ */
extern T0* T593f4(T0* C);
/* LX_FULL_AND_REJECT_ERROR.default_message */
extern T0* T592f5(T0* C);
/* LX_FULL_AND_REJECT_ERROR.message */
extern T0* T592f3(T0* C, T0* a1);
/* LX_FULL_AND_REJECT_ERROR.arguments */
extern T0* T592f6(T0* C);
/* LX_FULL_AND_REJECT_ERROR.string_ */
extern T0* T592f4(T0* C);
/* LX_FULL_AND_META_ERROR.default_message */
extern T0* T591f5(T0* C);
/* LX_FULL_AND_META_ERROR.message */
extern T0* T591f3(T0* C, T0* a1);
/* LX_FULL_AND_META_ERROR.arguments */
extern T0* T591f6(T0* C);
/* LX_FULL_AND_META_ERROR.string_ */
extern T0* T591f4(T0* C);
/* LX_BAD_CHARACTER_ERROR.default_message */
extern T0* T590f5(T0* C);
/* LX_BAD_CHARACTER_ERROR.message */
extern T0* T590f3(T0* C, T0* a1);
/* LX_BAD_CHARACTER_ERROR.arguments */
extern T0* T590f6(T0* C);
/* LX_BAD_CHARACTER_ERROR.string_ */
extern T0* T590f4(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.default_message */
extern T0* T589f5(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.message */
extern T0* T589f3(T0* C, T0* a1);
/* LX_BAD_CHARACTER_CLASS_ERROR.arguments */
extern T0* T589f6(T0* C);
/* LX_BAD_CHARACTER_CLASS_ERROR.string_ */
extern T0* T589f4(T0* C);
/* LX_MISSING_QUOTE_ERROR.default_message */
extern T0* T588f5(T0* C);
/* LX_MISSING_QUOTE_ERROR.message */
extern T0* T588f3(T0* C, T0* a1);
/* LX_MISSING_QUOTE_ERROR.arguments */
extern T0* T588f6(T0* C);
/* LX_MISSING_QUOTE_ERROR.string_ */
extern T0* T588f4(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.default_message */
extern T0* T587f5(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.message */
extern T0* T587f3(T0* C, T0* a1);
/* LX_UNRECOGNIZED_RULE_ERROR.arguments */
extern T0* T587f6(T0* C);
/* LX_UNRECOGNIZED_RULE_ERROR.string_ */
extern T0* T587f4(T0* C);
/* UT_SYNTAX_ERROR.default_message */
extern T0* T585f5(T0* C);
/* UT_SYNTAX_ERROR.message */
extern T0* T585f3(T0* C, T0* a1);
/* UT_SYNTAX_ERROR.arguments */
extern T0* T585f6(T0* C);
/* UT_SYNTAX_ERROR.string_ */
extern T0* T585f4(T0* C);
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
/* GEANT_ARGUMENT_VARIABLES.found */
extern T1 T34f34(T0* C);
/* GEANT_VARIABLES.found */
extern T1 T29f36(T0* C);
/* GEANT_PROJECT_VARIABLES.found */
extern T1 T25f44(T0* C);
/* GEANT_ARGUMENT_VARIABLES.found_item */
extern T0* T34f44(T0* C);
/* GEANT_VARIABLES.found_item */
extern T0* T29f44(T0* C);
/* GEANT_PROJECT_VARIABLES.found_item */
extern T0* T25f53(T0* C);
/* GEANT_ARGUMENT_VARIABLES.after */
extern T1 T34f45(T0* C);
/* GEANT_VARIABLES.after */
extern T1 T29f45(T0* C);
/* GEANT_PROJECT_VARIABLES.after */
extern T1 T25f56(T0* C);
/* GEANT_ARGUMENT_VARIABLES.key_for_iteration */
extern T0* T34f46(T0* C);
/* GEANT_VARIABLES.key_for_iteration */
extern T0* T29f46(T0* C);
/* GEANT_PROJECT_VARIABLES.key_for_iteration */
extern T0* T25f57(T0* C);
/* GEANT_ARGUMENT_VARIABLES.item_for_iteration */
extern T0* T34f47(T0* C);
/* GEANT_VARIABLES.item_for_iteration */
extern T0* T29f47(T0* C);
/* GEANT_PROJECT_VARIABLES.item_for_iteration */
extern T0* T25f58(T0* C);
/* GEANT_ARGUMENT_VARIABLES.has */
extern T1 T34f33(T0* C, T0* a1);
/* GEANT_VARIABLES.has */
extern T1 T29f32(T0* C, T0* a1);
/* GEANT_PROJECT_VARIABLES.has */
extern T1 T25f55(T0* C, T0* a1);
/* GEANT_FILESET_ENTRY.is_equal */
extern T1 T543f5(T0* C, T0* a1);
/* GEANT_FILESET_ENTRY.string_ */
extern T0* T543f6(T0* C);
/* XM_NAMESPACE.is_equal */
extern T1 T358f4(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.is_equal */
extern T1 T143f10(T0* C, T0* a1);
/* XM_EIFFEL_PARSER_NAME.same_string */
extern T1 T143f15(T0* C, T0* a1, T0* a2);
/* INTEGER_32.is_equal */
extern T1 T6f28(T6* C, T6 a1);
/* FILE_NAME.to_c */
extern T0* T659f6(T0* C);
/* UC_UTF8_STRING.to_c */
extern T0* T206f20(T0* C);
/* STRING_8.to_c */
extern T0* T17f11(T0* C);
extern T0* GE_ma33(T6 c, T6 n, ...);
extern T0* GE_ma204(T6 c, T6 n, ...);
extern T0* GE_ma179(T6 c, T6 n, ...);
extern T0* GE_ma614(T6 c, T6 n, ...);
extern T0* GE_ma563(T6 c, T6 n, ...);
extern T0* ge190ov4809;
extern T0* ge230ov3008;
extern T0* ge279ov6159;
extern T0* ge289ov7589;
extern T0* ge213ov3870;
extern T0* ge232ov3008;
extern T0* ge238ov3908;
extern T0* ge238ov3909;
extern T0* ge223ov4167;
extern T0* ge223ov4166;
extern T0* ge235ov3908;
extern T0* ge235ov3909;
extern T0* ge1532ov4940;
extern T0* ge1532ov4939;
extern T0* ge372ov10254;
extern T0* ge220ov3008;
extern T0* ge496ov9404;
extern T0* ge212ov4058;
extern T0* ge539ov9111;
extern T0* ge323ov3008;
extern T0* ge1539ov5382;
extern T0* ge1539ov5344;
extern T0* ge1539ov5342;
extern T0* ge1539ov5383;
extern T0* ge1539ov5355;
extern T0* ge1539ov5354;
extern T0* ge1539ov5365;
extern T0* ge1539ov5359;
extern T0* ge1539ov5358;
extern T0* ge1539ov5357;
extern T0* ge1539ov5363;
extern T0* ge1539ov5362;
extern T0* ge1539ov5364;
extern T0* ge1539ov5341;
extern T0* ge1539ov5367;
extern T0* ge1539ov5376;
extern T0* ge1542ov5077;
extern T0* ge1542ov5075;
extern T0* ge1542ov5076;
extern T0* ge1539ov5377;
extern T0* ge1539ov5378;
extern T0* ge1539ov5381;
extern T0* ge1539ov5379;
extern T0* ge1539ov5380;
extern T0* ge1539ov5374;
extern T0* ge1535ov6984;
extern T0* ge1535ov6985;
extern T0* ge1539ov5347;
extern T0* ge1539ov5370;
extern T0* ge1539ov5390;
extern T0* ge1539ov5391;
extern T0* ge1539ov5392;
extern T0* ge1539ov5385;
extern T0* ge1539ov5368;
extern T0* ge1539ov5369;
extern T0* ge1539ov5371;
extern T0* ge1539ov5375;
extern T0* ge238ov3919;
extern T0* ge235ov3919;
extern T0* ge151ov2637;
extern T0* ge154ov2976;
extern T0* ge154ov2983;
extern T0* ge250ov1770;
extern T0* ge154ov2979;
extern T0* ge154ov2986;
extern T0* ge154ov2977;
extern T0* ge154ov2984;
extern T0* ge154ov2978;
extern T0* ge154ov2985;
extern T0* ge154ov2980;
extern T0* ge154ov2987;
extern T0* ge154ov2981;
extern T0* ge154ov2988;
extern T0* ge151ov2632;
extern T0* ge151ov2631;
extern T0* ge151ov2639;
extern T0* ge151ov2638;
extern T0* ge500ov10800;
extern T0* ge500ov10837;
extern T0* ge500ov10822;
extern T0* ge500ov10815;
extern T0* ge500ov10825;
extern T0* ge500ov10818;
extern T0* ge500ov10826;
extern T0* ge500ov10835;
extern T0* ge500ov10828;
extern T0* ge500ov10824;
extern T0* ge500ov10812;
extern T0* ge500ov10813;
extern T0* ge500ov10827;
extern T0* ge500ov10814;
extern T0* ge500ov10801;
extern T0* ge500ov10802;
extern T0* ge500ov10803;
extern T0* ge500ov10809;
extern T0* ge500ov10811;
extern T0* ge500ov10806;
extern T0* ge500ov10831;
extern T0* ge500ov10830;
extern T0* ge500ov10807;
extern T0* ge500ov10808;
extern T0* ge500ov10805;
extern T0* ge500ov10804;
extern T0* ge211ov9205;
extern T0* ge90ov8658;
extern T0* ge216ov4038;
extern T0* ge212ov4060;
extern T0* ge211ov9204;
extern T0* ge1546ov6486;
extern T0* ge1546ov6487;
extern T0* ge1537ov7597;
extern T0* ge1537ov7599;
extern T0* ge1489ov5681;
extern T0* ge1470ov7309;
extern T0* ge1470ov7310;
extern T0* ge152ov4743;
extern T0* ge152ov4744;
extern T0* ge152ov4745;
extern T0* ge152ov4742;
extern T0* ge1537ov7596;
extern T0* ge1537ov7598;
extern T0* ge357ov2992;
extern T0* ge343ov2992;
extern T0* ge349ov2992;
extern T0* ge348ov2992;
extern T0* ge347ov2992;
extern T0* ge338ov2992;
extern T0* ge337ov2992;
extern T0* ge354ov2992;
extern T0* ge367ov2992;
extern T0* ge1387ov2992;
extern T0* ge1392ov2992;
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
extern void eif_sleep(EIF_INTEGER_64);

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
